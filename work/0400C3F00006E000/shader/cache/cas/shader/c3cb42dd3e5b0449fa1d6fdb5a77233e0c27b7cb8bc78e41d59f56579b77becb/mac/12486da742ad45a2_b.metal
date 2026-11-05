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
    float4 m_48 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_52 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1469 = false;
    bool _537 = false;
    bool _427 = false;
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
        float _2144 = as_type<float>(_89);
        out.gl_Position.z = _2144;
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
    float _109 = 0.0;
    if (_103)
    {
        float _111 = float(_73);
        _109 = _111;
    }
    float _113 = _109;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    if (_119)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _83;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    if (_119)
    {
        float _123 = _121 * 5.0;
        _91 = as_type<int>(_123);
    }
    int _125 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2212 = as_type<float>(_125);
        out.gl_Position.z = _2212;
    }
    if (_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = as_type<float>(int(gl_VertexIndex));
    float _129 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _131 = in.m_42.w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = in.m_37.x;
    float _145 = in.m_37.y;
    float _147 = in.m_37.z;
    float _149 = in.m_32.x;
    float _151 = in.m_32.y;
    float _153 = in.m_32.z;
    float _155 = 0.0;
    float _157 = _129;
    if (!_141)
    {
        float _159 = _129 * _129;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    float _165 = _163;
    if (!_141)
    {
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _165 = _167;
    }
    float _169 = _165;
    int _171 = as_type<int>(_127) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_127) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_141;
    float _189 = _169;
    float _191 = 0.0;
    float _193 = _127;
    if (!_187)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _129 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _129);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _223;
        _191 = _207;
        _193 = _213;
    }
    float _225 = _189;
    float _227 = _191;
    float _229 = _193;
    bool _231 = !_141;
    float _233 = _229;
    float _235 = _227;
    float _237 = _225;
    if (!_231)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _129 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _157 = _257;
        _233 = _245;
    }
    float _259 = _157;
    float _261 = _233;
    float _263 = _261;
    if (!_141)
    {
        float _265 = _107 * _107;
        float _267 = _265 * 0.5;
        _235 = _267;
    }
    float _269 = _235;
    float _271 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_141)
    {
        _263 = _107;
    }
    float _277 = _263;
    float _279 = fma(_259, _143, _271);
    float _281 = fma(_259, _145, _273);
    float _283 = _277;
    if (!_141)
    {
        float _285 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _285;
    }
    float _287 = _237;
    bool _289 = !_141;
    float _291 = _287;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _107 * _295;
        float _305 = 1.0 / _299;
        float _307 = _301 * 0.693147182464599609375;
        float _309 = exp2(_303);
        float _311 = 1.0 / _307;
        float _313 = _309 + (-1.0);
        float _315 = -_313;
        float _317 = fma(_315, _311, _107);
        float _319 = _317 * _305;
        float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _321;
    }
    float _323 = _291;
    bool _325 = !_141;
    if (!_325)
    {
        float _327 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _329 = log2(_327);
        float _331 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _333 = _331 + 1.0;
        float _335 = 1.0 / _333;
        float _337 = _107 * _329;
        float _339 = exp2(_337);
        float _341 = -_339;
        float _343 = _341 + 1.0;
        float _345 = _343 * _335;
        _283 = _345;
    }
    float _347 = _283;
    float _349 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _351 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _353 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _357 = fma(_347, _145, _349);
    float _359 = fma(_347, _143, _351);
    float _361 = fma(_347, _147, _353);
    float _363 = fma(_281, _131, _151);
    float _365 = -_357;
    float _367 = _281 + _365;
    float _369 = fma(_259, _147, _275);
    float _371 = fma(_279, _131, _149);
    float _373 = -_359;
    float _375 = _279 + _373;
    float _377 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _379 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _381 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _383 = -_361;
    float _385 = _369 + _383;
    float _387 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _377);
    float _389 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _379);
    float _391 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _381);
    float _393 = fma(_369, _131, _153);
    float _395 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _387);
    float _397 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _389);
    float _399 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _391);
    bool _401 = !_355;
    float _403 = _397;
    float _405 = _395;
    float _407 = _399;
    float _425;
    if (!_401)
    {
        float _409 = in.m_44.x;
        float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _413 = _409 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        float _429 = float(_73);
        float _431 = 1.0 / _429;
        float _433 = _107 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _439 = _435 + _437;
    float _441 = in.m_42.x;
    float _443 = in.m_42.y;
    bool _445 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _447 = isnan(_435);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _457;
    bool _461 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _463 = isnan(_435);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -_455;
    float _475 = _473 + 1.0;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _477;
    float _481 = 1.0 / _459;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _485 = _471 * _475;
    float _487 = -_471;
    float _489 = _487 + 1.0;
    float _491 = _439 * _481;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _493;
    float _497 = fma(_479, _491, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _499 = fma(_495, _491, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _501 = _497 * _485;
    float _503 = _499 * _485;
    float _505 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _501);
    float _507 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _503);
    float _509 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[144].x, _505);
    float _511 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[144].y, _507);
    float _513 = _509 * _441;
    float _515 = _511 * _443;
    bool _517 = !_483;
    float _535;
    if (!_517)
    {
        float _519 = in.m_44.x;
        float _521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _523 = _519 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _527 = _525 * _521;
        float _529 = floor(_527);
        float _531 = -_529;
        float _533 = _527 + _531;
        _535 = _533;
        _537 = true;
    }
    else
    {
        float _539 = float(_73);
        float _541 = 1.0 / _539;
        float _543 = _107 * _541;
        _535 = _543;
    }
    _537 = false;
    float _545 = _535;
    float _547 = in.m_44.y;
    float _549 = _363 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _551 = in.m_44.x;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _559 = _557 != 0;
    float _561 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _549);
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _565 = _563 != 0;
    float _567 = 1.0 / _555;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _569;
    float _573 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
    float _575 = _573 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _579 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _581 = _575 + _579;
    bool _583 = _547 > 0.5;
    float _585 = _363 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _587 = _363 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _589 = _571 * _567;
    bool _591 = _551 > 0.5;
    float _593 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _585);
    float _595 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _599 = _545 + _597;
    float _601 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].z, _593);
    float _603 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].z, _595);
    bool _605 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _607 = isnan(_545);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = fma(_589, _599, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _623 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _625 = isnan(_545);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = _601 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _637 = _581 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _639 = 1.0 / _621;
    bool _641 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _643 = isnan(_545);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -_633;
    float _655 = _653 + 1.0;
    float _657 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _659 = _635 + _657;
    float _661 = _603 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _663 = _615 * _655;
    float _665 = -_615;
    float _667 = _665 + 1.0;
    float _669 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[28].x, _637);
    float _671 = -_181;
    int _673 = _591 ? as_type<int>(_671) : as_type<int>(_181);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _679 = _651 * _667;
    float _681 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _683 = _661 + _681;
    bool _685 = !_559;
    float _687 = _685 ? _181 : as_type<float>(_673);
    float _689 = -_651;
    float _691 = _689 + 1.0;
    float _693 = _617 * _679;
    float _695 = _677 * _639;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _545 + _697;
    float _701 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[28].z, _669);
    float _703 = -_185;
    int _705 = _583 ? as_type<int>(_703) : as_type<int>(_185);
    float _707 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[115].x, _693);
    float _709 = fma(_695, _699, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _713 = _701 >= 0.0;
    float _715 = _687 + 0.5;
    bool _717 = !_565;
    float _719 = _717 ? _185 : as_type<float>(_705);
    float _721 = fma(_709, _663, _707);
    float _723 = _715 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _725 = -_719;
    float _727 = _725 + 0.5;
    float _729 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[117].x, _721);
    float _731 = _581 * _581;
    float _733 = _727 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _735 = fma(_659, _659, _731);
    float _737 = _699;
    int _739 = as_type<int>(_709);
    bool _741 = _583;
    if (_713)
    {
        _737 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _743 = _737;
    float _745 = _733 * _577;
    float _747 = _723 * _711;
    float _749 = fma(_683, _683, _735);
    if (_713)
    {
        float _751 = _743 * 5.0;
        _739 = as_type<int>(_751);
    }
    int _753 = _739;
    out.m_46.y = _745;
    float _755 = _729 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _757 = rsqrt(_749);
    out.m_46.x = _747;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_713)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3201 = as_type<float>(_753);
        out.gl_Position.z = _3201;
    }
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _769 = _761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_713)
    {
        out.m_35.x = 0.0;
    }
    float _771 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _773 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = _581 * _757;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_48.x = _771;
    out.m_48.y = _773;
    out.m_48.z = _769;
    out.m_48.w = _755;
    float _783 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _789 = _659 * _757;
    out.m_50.x = _783;
    out.m_50.y = _785;
    out.m_50.z = _787;
    out.m_50.w = _763;
    if (_713)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _791 = -_775;
    float _793 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _575);
    float _795 = _683 * _757;
    float _797 = -_789;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _635);
    float _801 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _803 = _793 + _801;
    float _805 = -_795;
    float _807 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[18].w, _661);
    float _809 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _811 = _799 + _809;
    float _813 = _803 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _817 = _807 + _815;
    float _819 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[28].x, _813);
    float _821 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[28].z, _819);
    bool _823 = _821 >= 0.0;
    if (_823)
    {
        _759 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _825 = _759;
    int _827 = as_type<int>(_825);
    if (_823)
    {
        out.m_35.x = 0.0;
    }
    if (_823)
    {
        float _829 = _825 * 5.0;
        _827 = as_type<int>(_829);
    }
    int _831 = _827;
    if (_823)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3379 = as_type<float>(_831);
        out.gl_Position.z = _3379;
    }
    if (_823)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _833 = -_575;
    float _835 = _833 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _837 = -_635;
    float _839 = _837 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _841 = _835 * _835;
    float _843 = -_661;
    float _845 = _843 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _847 = -_775;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _851 = -_789;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _659);
    float _855 = fma(_839, _839, _841);
    float _857 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _859 = _849 * _849;
    float _861 = fma(_845, _845, _855);
    float _863 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[1].x, _857);
    float _865 = -_795;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _683);
    float _869 = fma(_853, _853, _859);
    float _871 = rsqrt(_861);
    float _873 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _863);
    float _875 = fma(_867, _867, _869);
    float _877 = rsqrt(_873);
    float _879 = _839 * _871;
    float _881 = _845 * _871;
    float _883 = _835 * _871;
    float _885 = sqrt(_875);
    float _887 = _883 * _883;
    float _889 = _877 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _891 = _877 * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _893 = _877 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _895 = fma(_879, _879, _887);
    float _897 = _889 * _879;
    float _899 = _891 * _881;
    float _901 = _893 * _883;
    float _903 = fma(_881, _881, _895);
    float _905 = -_897;
    float _907 = fma(_891, _883, _905);
    float _909 = -_899;
    float _911 = fma(_893, _879, _909);
    float _913 = -_901;
    float _915 = fma(_889, _881, _913);
    float _917 = -_575;
    float _919 = _917 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _921 = _879 * _907;
    float _923 = _881 * _911;
    float _925 = _883 * _915;
    float _927 = rsqrt(_903);
    float _929 = -_921;
    float _931 = fma(_881, _915, _929);
    float _933 = -_635;
    float _935 = _933 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _937 = -_923;
    float _939 = fma(_883, _907, _937);
    float _941 = -_925;
    float _943 = fma(_879, _911, _941);
    float _945 = _919 * _931;
    float _947 = _911 * _919;
    float _949 = -_661;
    float _951 = _949 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _953 = fma(_935, _939, _945);
    float _955 = fma(_915, _935, _947);
    float _957 = fma(_951, _943, _953);
    float _959 = fma(_907, _951, _955);
    float _961 = _957 * _957;
    float _963 = fma(_959, _959, _961);
    float _965 = rsqrt(_963);
    float _967 = _959 * _965;
    float _969 = _957 * _965;
    float _971 = abs(_967);
    float _973 = abs(_969);
    float _975 = precise::max(_971, _973);
    bool _977 = _975 >= 16.0;
    float _979 = _969;
    float _981 = _967;
    int _983 = as_type<int>(_963);
    float _985 = _867;
    if (_977)
    {
        float _987 = _969 * 0.0625;
        _979 = _987;
    }
    float _989 = _979;
    if (_977)
    {
        float _991 = _967 * 0.0625;
        _981 = _991;
    }
    float _993 = _981;
    float _995 = abs(_989);
    bool _997 = _995 != 0.0;
    bool _999 = isnan(_995);
    bool _1001 = _997 || _999;
    bool _1003 = isnan(0.0);
    bool _1005 = _1001 || _1003;
    float _1007 = abs(_993);
    bool _1009 = _1007 == 0.0;
    float _1011 = abs(_993);
    bool _1013 = _1011 == 0.0;
    bool _1015 = !_1005;
    bool _1017 = _1013 && _1015;
    if (_1017)
    {
        bool _1019 = as_type<int>(_993) >= 0;
        _741 = _1019;
    }
    bool _1021 = _741;
    int _1023 = _1021 ? (-1) : 0;
    if (_1017)
    {
        int _1025 = _1021 ? 0 : 1078530011;
        _983 = _1025;
    }
    int _1027 = _983;
    int _1029 = _1027;
    if (_1017)
    {
        int _1031 = int(0x80000000) & as_type<int>(_989);
        int _1033 = _1027 | _1031;
        _985 = as_type<float>(_1033);
    }
    float _1035 = _985;
    bool _1037 = !_1005;
    bool _1039 = _1037 && _1009;
    float _1041 = _1035;
    float _1043 = _1035;
    if (!_1039)
    {
        float _1045 = abs(_989);
        bool _1047 = _1045 != as_type<float>(0x7f800000u /* inf */);
        bool _1049 = isnan(_1045);
        bool _1051 = _1047 || _1049;
        bool _1053 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1055 = _1051 || _1053;
        float _1057 = abs(_993);
        bool _1059 = _1057 == as_type<float>(0x7f800000u /* inf */);
        float _1061 = abs(_993);
        bool _1063 = _1061 == as_type<float>(0x7f800000u /* inf */);
        bool _1065 = !_1055;
        bool _1067 = _1063 && _1065;
        if (_1067)
        {
            bool _1069 = as_type<int>(_993) >= 0;
            _1023 = _1069 ? (-1) : 0;
        }
        int _1071 = _1023;
        if (_1067)
        {
            _1029 = 1075235812;
        }
        int _1073 = _1029;
        int _1075 = _1073;
        if (_1067)
        {
            int _1077 = ~_1071;
            int _1079 = (_1077 != 0) ? _1073 : 1061752795;
            _1075 = _1079;
        }
        int _1081 = _1075;
        if (_1067)
        {
            int _1083 = int(0x80000000) & as_type<int>(_989);
            int _1085 = _1081 | _1083;
            _1041 = as_type<float>(_1085);
        }
        float _1087 = _1041;
        bool _1089 = !_1055;
        bool _1091 = _1089 && _1059;
        _1043 = _1087;
        if (!_1091)
        {
            float _1093 = abs(_989);
            float _1095 = abs(_993);
            float _1097 = precise::max(_1093, _1095);
            float _1099 = abs(_989);
            float _1101 = abs(_993);
            float _1103 = precise::min(_1099, _1101);
            float _1105 = 1.0 / _1097;
            float _1107 = abs(_989);
            float _1109 = abs(_993);
            bool _1111 = _1107 > _1109;
            bool _1113 = as_type<int>(_993) >= 0;
            float _1115 = _1103 * _1105;
            float _1117 = abs(_989);
            float _1119 = abs(_993);
            float _1121 = _1117 + _1119;
            int _1123 = as_type<int>(_989) & int(0x80000000);
            float _1125 = _1115 * _1115;
            bool _1127 = _1121 > as_type<float>(0x7f800000u /* inf */);
            bool _1129 = isnan(_1121);
            bool _1131 = _1127 || _1129;
            bool _1133 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1135 = _1131 || _1133;
            float _1137 = _1125 + 11.33538818359375;
            float _1139 = fma(_1125, _1137, 28.84246826171875);
            float _1141 = fma(_1125, _1139, 19.6966705322265625);
            float _1143 = fma(_1125, -0.82336294651031494140625, -5.674867153167724609375);
            float _1145 = fma(_1125, _1143, -6.565555095672607421875);
            float _1147 = 1.0 / _1141;
            float _1149 = _1125 * _1145;
            float _1151 = _1115 * _1149;
            float _1153 = fma(_1151, _1147, _1115);
            float _1155 = _1153;
            _1043 = _1121;
            if (_1111)
            {
                float _1157 = -_1153;
                float _1159 = _1157 + 1.57079637050628662109375;
                _1155 = _1159;
            }
            float _1161 = _1155;
            int _1163 = as_type<int>(_1161);
            if (!_1113)
            {
                float _1165 = -_1161;
                float _1167 = _1165 + 3.1415927410125732421875;
                _1163 = as_type<int>(_1167);
            }
            int _1169 = _1163;
            if (!_1135)
            {
                int _1171 = _1123 | _1169;
                _1043 = as_type<float>(_1171);
            }
        }
    }
    float _1173 = _1043;
    float _1175 = _1173 + 1.57079637050628662109375;
    float _1177 = _757 * _885;
    float _1179 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1181 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1183 = _1175 * 0.15915493667125701904296875;
    float _1185 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1187 = _1177 * _1179;
    float _1189 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _1191 = _1183 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = _1177 * _1185;
    float _1197 = _1181 * _1187;
    float _1199 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1201 = _1199 * 0.5;
    float _1203 = _879 * _927;
    float _1205 = _1189 * _1195;
    float _1207 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1209 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1211 = _1183 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1217 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1207);
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1209);
    float _1221 = _881 * _927;
    float _1223 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1215);
    float _1225 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1217);
    float _1227 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1219);
    float _1229 = -_1193;
    float _1231 = _1229 + 1.0;
    float _1233 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1223);
    float _1235 = _883 * _927;
    float _1237 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1239 = _1203 * _1231;
    float _1241 = _1221 * _1221;
    float _1243 = _1235 * _1231;
    float _1245 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1247 = _1221 * _1213;
    float _1249 = _1203 * _1213;
    float _1251 = fma(_1203, _1239, _1193);
    float _1253 = _1235 * _1213;
    float _1255 = -_1247;
    float _1257 = fma(_1235, _1239, _1255);
    float _1259 = fma(_1221, _1243, _1249);
    float _1261 = fma(_1231, _1241, _1193);
    float _1263 = -_1253;
    float _1265 = fma(_1221, _1239, _1263);
    float _1267 = _1237 * _1257;
    float _1269 = _1237 * _1259;
    float _1271 = fma(_1235, _1239, _1247);
    float _1273 = fma(_1245, _1251, _1267);
    float _1275 = _1233 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1277 = fma(_1221, _1239, _1253);
    float _1279 = fma(_1245, _1265, _1269);
    float _1281 = fma(_1275, _1277, _1273);
    float _1283 = fma(_1275, _1261, _1279);
    float _1285 = fma(_1235, _1243, _1193);
    float _1287 = -_1249;
    float _1289 = fma(_1221, _1243, _1287);
    float _1291 = _635 + _1281;
    float _1293 = _661 + _1283;
    float _1295 = _1237 * _1285;
    float _1297 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1299 = _1291 + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1303 = _1293 + _1301;
    float _1305 = fma(_1245, _1271, _1295);
    float _1307 = _1299 * _1299;
    float _1309 = _1303 * _1303;
    float _1311 = fma(_1275, _1289, _1305);
    float _1313 = _1307 + _1309;
    float _1315 = _575 + _1311;
    float _1317 = sqrt(_1313);
    bool _1319 = _1317 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1321 = _1295;
    float _1323 = _1193;
    float _1325 = _1235;
    float _1327 = _1221;
    float _1329 = _1311;
    if (!_1319)
    {
        _1321 = _1309;
    }
    float _1331 = _1321;
    float _1333 = _1331;
    if (!_1319)
    {
        _1323 = _1307;
    }
    float _1335 = _1323;
    float _1337 = _1335;
    if (!_1319)
    {
        _1325 = _1291;
    }
    float _1339 = _1325;
    float _1341 = _1339;
    if (!_1319)
    {
        _1327 = _1293;
    }
    float _1343 = _1327;
    float _1345 = _1343;
    if (!_1319)
    {
        _1329 = _1315;
    }
    float _1347 = _1329;
    bool _1349 = !_1319;
    float _1351 = _1347;
    if (!_1349)
    {
        float _1353 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1357 = _1317 + _1355;
        float _1359 = _1315 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1361 = rsqrt(_1313);
        float _1363 = _1357 * _1353;
        float _1365 = _1363 * 0.15915493667125701904296875;
        float _1367 = _1365 * 6.283185482025146484375;
        float _1369 = sin(_1367);
        float _1371 = _1365 * 6.283185482025146484375;
        float _1373 = cos(_1371);
        float _1375 = fma(_1369, _1359, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1377 = _1361 * _1375;
        float _1379 = _1373 + (-1.0);
        float _1381 = fma(_1299, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1383 = fma(_1303, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1385 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1389 = _1381 + _1387;
        float _1391 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1393 = _1383 + _1391;
        float _1395 = fma(_1315, _1373, _1385);
        float _1397 = _1389 * _1389;
        float _1399 = _1393 * _1393;
        _1351 = _1395;
        _1337 = _1397;
        _1333 = _1399;
        _1341 = _1381;
        _1345 = _1383;
    }
    float _1401 = _1351;
    float _1403 = _1337;
    float _1405 = _1333;
    float _1407 = _1341;
    float _1409 = _1345;
    float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1413 = _1401 + _1411;
    out.m_48.x = _771;
    out.m_48.y = _773;
    out.m_48.z = _769;
    out.m_48.w = _755;
    float _1415 = fma(_1413, _1413, _1403);
    out.m_50.x = _783;
    out.m_50.y = _785;
    out.m_50.z = _787;
    out.m_50.w = _763;
    float _1417 = _1415 + _1405;
    float _1419 = sqrt(_1417);
    bool _1421 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1423 = isnan(_1419);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1429 = _1425 || _1427;
    float _1431 = _1403;
    float _1433 = _1409;
    if (!_1429)
    {
        _1431 = 1.0;
    }
    float _1435 = _1431;
    bool _1437 = !_1429;
    float _1439 = _1435;
    if (!_1437)
    {
        bool _1441 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1443 = isnan(_1419);
        bool _1445 = _1441 || _1443;
        bool _1447 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1449 = _1445 || _1447;
        if (!_1449)
        {
            float _1451 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1453 = _1419 + _1451;
            float _1455 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1457 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1455;
            float _1459 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1461 = _1459 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1463 = 1.0 / _1457;
            float _1465 = _1453 * _1463;
            float _1467 = fma(_1465, _1461, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1439 = _1467;
            _1469 = true;
        }
        else
        {
            bool _1471 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1473 = isnan(_1419);
            bool _1475 = _1471 || _1473;
            bool _1477 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1479 = _1475 || _1477;
            if (!_1479)
            {
                float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1483 = _1419 + _1481;
                float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1487 = _1485 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1489 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1491 = _1489 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1493 = 1.0 / _1487;
                float _1495 = _1483 * _1493;
                float _1497 = fma(_1495, _1491, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1439 = _1497;
                _1469 = true;
            }
            else
            {
                _1439 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1469 = false;
    float _1499 = _1439;
    float _1501 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1503 = _1401 + _1501;
    float _1505 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1507 = _1407 + _1505;
    float _1509 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1511 = _1409 + _1509;
    float _1513 = fma(_1503, _1499, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1515 = fma(_1507, _1499, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1517 = fma(_1511, _1499, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1519 = -_575;
    float _1521 = _1519 + _1513;
    float _1523 = -_635;
    float _1525 = _1523 + _1515;
    float _1527 = -_661;
    float _1529 = _1527 + _1517;
    float _1531 = _1521 * _1521;
    float _1533 = fma(_1525, _1525, _1531);
    float _1535 = fma(_1529, _1529, _1533);
    float _1537 = sqrt(_1535);
    bool _1539 = _1537 > 0.0;
    bool _1541 = !_1539;
    float _1543 = _1507;
    float _1545 = _1515;
    float _1547 = _1517;
    float _1549 = _1513;
    if (!_1541)
    {
        bool _1551 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1553 = _1537;
        if (_1551)
        {
            float _1555 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1553 = _1555;
        }
        float _1557 = _1553;
        float _1559 = _1557;
        if (_1551)
        {
            float _1561 = _395 * _1557;
            _1543 = _1561;
        }
        float _1563 = _1543;
        float _1565 = _1563;
        if (_1551)
        {
            float _1567 = _397 * _1557;
            _1433 = _1567;
        }
        float _1569 = _1433;
        float _1571 = _1569;
        float _1573 = _1569;
        if (_1551)
        {
            float _1575 = _399 * _1557;
            _1559 = _1575;
        }
        float _1577 = _1559;
        float _1579 = _1577;
        if (!_1551)
        {
            float _1581 = _107 + 1.0;
            float _1583 = _1581;
            if (!_141)
            {
                float _1585 = _1581 * _1581;
                float _1587 = _1585 * 0.5;
                _1571 = _1587;
            }
            float _1589 = _1571;
            float _1591 = _1589;
            if (!_141)
            {
                float _1593 = _1589 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1591 = _1593;
            }
            float _1595 = _1591;
            bool _1597 = !_141;
            float _1599 = _1595;
            if (!_1597)
            {
                float _1601 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1603 = log2(_1601);
                float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1607 = _1605 + 1.0;
                float _1609 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1611 = _1603 * _1581;
                float _1613 = exp2(_1611);
                float _1615 = _1609 * 0.693147182464599609375;
                float _1617 = 1.0 / _1615;
                float _1619 = 1.0 / _1607;
                float _1621 = _1613 + (-1.0);
                float _1623 = -_1621;
                float _1625 = fma(_1623, _1617, _1581);
                float _1627 = _1625 * _1619;
                float _1629 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1599 = _1629;
            }
            float _1631 = _1599;
            float _1633 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1635 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1637 = !_141;
            if (!_1637)
            {
                float _1639 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1641 = log2(_1639);
                float _1643 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1645 = _1643 + 1.0;
                float _1647 = 1.0 / _1645;
                float _1649 = _1641 * _1581;
                float _1651 = exp2(_1649);
                float _1653 = -_1651;
                float _1655 = _1653 + 1.0;
                float _1657 = _1655 * _1647;
                _1583 = _1657;
            }
            float _1659 = _1583;
            float _1661 = fma(_1659, _145, _1635);
            float _1663 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1665 = fma(_1659, _143, _1633);
            float _1667 = -_357;
            float _1669 = _1667 + _1661;
            float _1671 = fma(_1659, _147, _1663);
            float _1673 = -_359;
            float _1675 = _1673 + _1665;
            float _1677 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1679 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1681 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1683 = -_361;
            float _1685 = _1683 + _1671;
            float _1687 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1677);
            float _1689 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1679);
            float _1691 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1681);
            float _1693 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1687);
            float _1695 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1689);
            float _1697 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1691);
            _403 = _1695;
            _405 = _1693;
            _407 = _1697;
            _1565 = _1693;
            _1573 = _1695;
            _1579 = _1697;
        }
        float _1699 = _403;
        float _1701 = _405;
        float _1703 = _407;
        float _1705 = _1565;
        float _1707 = _1573;
        float _1709 = _1579;
        float _1711 = _1699 * _1699;
        float _1713 = rsqrt(_1535);
        float _1715 = fma(_1701, _1701, _1711);
        float _1717 = fma(_1703, _1703, _1715);
        float _1719 = sqrt(_1717);
        float _1721 = _1521 * _1713;
        float _1723 = _1525 * _1713;
        float _1725 = _1529 * _1713;
        bool _1727 = _1719 > 0.0;
        bool _1729 = !_1727;
        if (!_1729)
        {
            float _1731 = rsqrt(_1717);
            float _1733 = _1731 * _1699;
            float _1735 = _1731 * _1701;
            float _1737 = _1731 * _1703;
            float _1739 = _1721 * _1733;
            float _1741 = fma(_1723, _1735, _1739);
            float _1743 = fma(_1725, _1737, _1741);
            float _1745 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1747 = fma(_1705, _1745, _1515);
            float _1749 = fma(_1707, _1745, _1513);
            float _1751 = fma(_1709, _1745, _1517);
            _1545 = _1747;
            _1547 = _1751;
            _1549 = _1749;
        }
    }
    float _1753 = _1545;
    float _1755 = _1547;
    float _1757 = _1549;
    float _1759 = _793 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1761 = -_789;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1753);
    float _1765 = -_795;
    float _1767 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1755);
    float _1769 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1759);
    bool _1771 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1775 = _1771 || _1773;
    bool _1777 = isnan(0.5);
    bool _1779 = _1775 || _1777;
    float _1781 = -_775;
    float _1783 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1757);
    float _1785 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1769);
    float _1787 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1789 = _793 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1791 = 1.0 / _1787;
    float _1793 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1789);
    float _1795 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1793);
    float _1797 = _1793;
    float _1799 = _1795;
    float _1801 = _1783;
    if (_1779)
    {
        _1797 = _1763;
    }
    float _1803 = _1797;
    float _1805 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1807 = _1803;
    if (_1779)
    {
        _1799 = _1767;
    }
    float _1809 = _1799;
    float _1811 = _1809;
    if (!_1779)
    {
        float _1813 = _803 * _803;
        float _1815 = 1.0 / _1177;
        float _1817 = -_661;
        float _1819 = _1817 + _1755;
        float _1821 = fma(_811, _811, _1813);
        float _1823 = fma(_817, _817, _1821);
        float _1825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1827 = sqrt(_1823);
        float _1829 = precise::min(_1827, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1831 = _1829 * _1825;
        float _1833 = -_635;
        float _1835 = _1833 + _1753;
        float _1837 = _1831 * _1815;
        float _1839 = -_575;
        float _1841 = _1839 + _1757;
        float _1843 = fma(_1835, _1837, _799);
        float _1845 = fma(_1841, _1837, _793);
        float _1847 = fma(_1819, _1837, _807);
        _1801 = _1845;
        _1807 = _1843;
        _1811 = _1847;
    }
    float _1849 = _1801;
    float _1851 = _1807;
    float _1853 = _1811;
    float _1855 = _1805 + _1787;
    float _1857 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1859 = _1855 * _1791;
    float _1861 = _1859 * 0.5;
    float _1863 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1865 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1857);
    bool _1867 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1869 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(0.5);
    bool _1875 = _1871 || _1873;
    float _1877 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1879 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1877);
    float _1881 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1863);
    float _1883 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1865);
    float _1885 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1887 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1889 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1881);
    float _1891 = 1.0 / _1879;
    float _1893 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1895 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1885);
    float _1897 = _1889 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1899 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1887);
    float _1901 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1903 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1905 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1907 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1909 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1895);
    float _1911 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1901);
    float _1913 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1903);
    float _1915 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1905);
    float _1917 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1907);
    float _1919 = _1901;
    float _1921 = _1897;
    if (_1875)
    {
        _1919 = 1.0;
    }
    float _1923 = _1919;
    float _1925 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1899);
    float _1927 = _1923;
    if (_1875)
    {
        _1921 = 1.0;
    }
    float _1929 = _1921;
    float _1931 = _1909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1935 = _1891 * _1933;
    float _1937 = _1929;
    if (!_1875)
    {
        float _1939 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1941 = _1939 * 0.15915493667125701904296875;
        float _1943 = _1941 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        float _1947 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1949 = _1947 * 0.15915493667125701904296875;
        float _1951 = _1941 * 6.283185482025146484375;
        float _1953 = sin(_1951);
        float _1955 = 1.0 / _1945;
        float _1957 = _1949 * 6.283185482025146484375;
        float _1959 = cos(_1957);
        float _1961 = _1953 * _1955;
        float _1963 = _1949 * 6.283185482025146484375;
        float _1965 = sin(_1963);
        float _1967 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1969 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1967;
        float _1971 = _1959 * _1961;
        float _1973 = 1.0 / _1969;
        float _1975 = 1.0 / _1971;
        float _1977 = _1965 * _1975;
        float _1979 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1981 = fma(_1935, _1977, _1979);
        float _1983 = _1981 * _1973;
        float _1985 = precise::clamp(_1983, 0.0, 1.0);
        _1927 = _1985;
    }
    float _1987 = _1927;
    if (!_1875)
    {
        float _1989 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1991 = _1989 * 0.15915493667125701904296875;
        float _1993 = _1991 * 6.283185482025146484375;
        float _1995 = cos(_1993);
        float _1997 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1999 = _1997 * 0.15915493667125701904296875;
        float _2001 = _1991 * 6.283185482025146484375;
        float _2003 = sin(_2001);
        float _2005 = 1.0 / _1995;
        float _2007 = _1999 * 6.283185482025146484375;
        float _2009 = cos(_2007);
        float _2011 = _2003 * _2005;
        float _2013 = _1999 * 6.283185482025146484375;
        float _2015 = sin(_2013);
        float _2017 = _2009 * _2011;
        float _2019 = 1.0 / _2017;
        float _2021 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2023 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2021;
        float _2025 = 1.0 / _2023;
        float _2027 = _2015 * _2019;
        float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2031 = fma(_1935, _2027, _2029);
        float _2033 = _2031 * _2025;
        float _2035 = precise::clamp(_2033, 0.0, 1.0);
        float _2037 = -_2035;
        float _2039 = _2037 + 1.0;
        _1937 = _2039;
    }
    float _2041 = _1937;
    float _2043 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2045 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1915);
    float _2047 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1917);
    bool _2049 = _1987 > 0.0;
    bool _2051 = isnan(_1987);
    bool _2053 = _2049 || _2051;
    bool _2055 = isnan(0.0);
    bool _2057 = _2053 || _2055;
    float _2059 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1911);
    float _2061 = _1987 * _2041;
    float _2063 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2045);
    float _2065 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2047);
    bool _2067 = _2041 <= 0.0;
    bool _2069 = !_2057;
    bool _2071 = _2067 || _2069;
    float _2073 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1913);
    float _2075 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2059);
    float _2077 = _2063 + _2065;
    float _2079 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2081 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2073);
    float _2083 = _2077 * 0.5;
    float _2085 = _2079 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_52.x = _1851;
    out.m_52.y = _1849;
    out.m_52.z = _1853;
    out.gl_Position.x = _2075;
    out.gl_Position.y = _2081;
    out.gl_Position.z = _2063;
    out.gl_Position.w = _2065;
    out.m_54.z = _2083;
    out.m_54.w = _2065;
    out.m_35.x = _2085;
    if (!_2071)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_35.x = 0.0;
    float _2087 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2087;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1469 = false;
    bool _537 = false;
    bool _427 = false;
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
        float _2144 = as_type<float>(_89);
        out.gl_Position.z = _2144;
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
    float _109 = 0.0;
    if (_103)
    {
        float _111 = float(_73);
        _109 = _111;
    }
    float _113 = _109;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    if (_119)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _83;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    if (_119)
    {
        float _123 = _121 * 5.0;
        _91 = as_type<int>(_123);
    }
    int _125 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2212 = as_type<float>(_125);
        out.gl_Position.z = _2212;
    }
    if (_119)
    {
        return out;
    }
    float _127 = as_type<float>(int(gl_VertexIndex));
    float _129 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _131 = in.m_42.w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = in.m_37.x;
    float _145 = in.m_37.y;
    float _147 = in.m_37.z;
    float _149 = in.m_32.x;
    float _151 = in.m_32.y;
    float _153 = in.m_32.z;
    float _155 = 0.0;
    float _157 = _129;
    if (!_141)
    {
        float _159 = _129 * _129;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    float _165 = _163;
    if (!_141)
    {
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _165 = _167;
    }
    float _169 = _165;
    int _171 = as_type<int>(_127) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_127) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_141;
    float _189 = _169;
    float _191 = 0.0;
    float _193 = _127;
    if (!_187)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _129 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _129);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _223;
        _191 = _207;
        _193 = _213;
    }
    float _225 = _189;
    float _227 = _191;
    float _229 = _193;
    bool _231 = !_141;
    float _233 = _229;
    float _235 = _227;
    float _237 = _225;
    if (!_231)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _129 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _157 = _257;
        _233 = _245;
    }
    float _259 = _157;
    float _261 = _233;
    float _263 = _261;
    if (!_141)
    {
        float _265 = _107 * _107;
        float _267 = _265 * 0.5;
        _235 = _267;
    }
    float _269 = _235;
    float _271 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_141)
    {
        _263 = _107;
    }
    float _277 = _263;
    float _279 = fma(_259, _143, _271);
    float _281 = fma(_259, _145, _273);
    float _283 = _277;
    if (!_141)
    {
        float _285 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _285;
    }
    float _287 = _237;
    bool _289 = !_141;
    float _291 = _287;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _107 * _295;
        float _305 = 1.0 / _299;
        float _307 = _301 * 0.693147182464599609375;
        float _309 = exp2(_303);
        float _311 = 1.0 / _307;
        float _313 = _309 + (-1.0);
        float _315 = -_313;
        float _317 = fma(_315, _311, _107);
        float _319 = _317 * _305;
        float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _321;
    }
    float _323 = _291;
    bool _325 = !_141;
    if (!_325)
    {
        float _327 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _329 = log2(_327);
        float _331 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _333 = _331 + 1.0;
        float _335 = 1.0 / _333;
        float _337 = _107 * _329;
        float _339 = exp2(_337);
        float _341 = -_339;
        float _343 = _341 + 1.0;
        float _345 = _343 * _335;
        _283 = _345;
    }
    float _347 = _283;
    float _349 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _351 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _353 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _357 = fma(_347, _145, _349);
    float _359 = fma(_347, _143, _351);
    float _361 = fma(_347, _147, _353);
    float _363 = fma(_281, _131, _151);
    float _365 = -_357;
    float _367 = _281 + _365;
    float _369 = fma(_259, _147, _275);
    float _371 = fma(_279, _131, _149);
    float _373 = -_359;
    float _375 = _279 + _373;
    float _377 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _379 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _381 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _383 = -_361;
    float _385 = _369 + _383;
    float _387 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _377);
    float _389 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _379);
    float _391 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _381);
    float _393 = fma(_369, _131, _153);
    float _395 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _387);
    float _397 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _389);
    float _399 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _391);
    bool _401 = !_355;
    float _403 = _397;
    float _405 = _395;
    float _407 = _399;
    float _425;
    if (!_401)
    {
        float _409 = in.m_44.x;
        float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _413 = _409 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        float _429 = float(_73);
        float _431 = 1.0 / _429;
        float _433 = _107 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _439 = _435 + _437;
    float _441 = in.m_42.x;
    float _443 = in.m_42.y;
    bool _445 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _447 = isnan(_435);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _457;
    bool _461 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _463 = isnan(_435);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -_455;
    float _475 = _473 + 1.0;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _477;
    float _481 = 1.0 / _459;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _485 = _471 * _475;
    float _487 = -_471;
    float _489 = _487 + 1.0;
    float _491 = _439 * _481;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _493;
    float _497 = fma(_479, _491, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _499 = fma(_495, _491, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _501 = _497 * _485;
    float _503 = _499 * _485;
    float _505 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _501);
    float _507 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _503);
    float _509 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[144].x, _505);
    float _511 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[144].y, _507);
    float _513 = _509 * _441;
    float _515 = _511 * _443;
    bool _517 = !_483;
    float _535;
    if (!_517)
    {
        float _519 = in.m_44.x;
        float _521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _523 = _519 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _527 = _525 * _521;
        float _529 = floor(_527);
        float _531 = -_529;
        float _533 = _527 + _531;
        _535 = _533;
        _537 = true;
    }
    else
    {
        float _539 = float(_73);
        float _541 = 1.0 / _539;
        float _543 = _107 * _541;
        _535 = _543;
    }
    _537 = false;
    float _545 = _535;
    float _547 = in.m_44.y;
    float _549 = _363 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _551 = in.m_44.x;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _559 = _557 != 0;
    float _561 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _549);
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _565 = _563 != 0;
    float _567 = 1.0 / _555;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _569;
    float _573 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
    float _575 = _573 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _579 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _581 = _575 + _579;
    bool _583 = _547 > 0.5;
    float _585 = _363 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _587 = _363 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _589 = _571 * _567;
    bool _591 = _551 > 0.5;
    float _593 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _585);
    float _595 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _599 = _545 + _597;
    float _601 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].z, _593);
    float _603 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].z, _595);
    bool _605 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _607 = isnan(_545);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = fma(_589, _599, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _623 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _625 = isnan(_545);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = _601 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _637 = _581 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _639 = 1.0 / _621;
    bool _641 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _643 = isnan(_545);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -_633;
    float _655 = _653 + 1.0;
    float _657 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _659 = _635 + _657;
    float _661 = _603 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _663 = _615 * _655;
    float _665 = -_615;
    float _667 = _665 + 1.0;
    float _669 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[28].x, _637);
    float _671 = -_181;
    int _673 = _591 ? as_type<int>(_671) : as_type<int>(_181);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _679 = _651 * _667;
    float _681 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _683 = _661 + _681;
    bool _685 = !_559;
    float _687 = _685 ? _181 : as_type<float>(_673);
    float _689 = -_651;
    float _691 = _689 + 1.0;
    float _693 = _617 * _679;
    float _695 = _677 * _639;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _545 + _697;
    float _701 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[28].z, _669);
    float _703 = -_185;
    int _705 = _583 ? as_type<int>(_703) : as_type<int>(_185);
    float _707 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[115].x, _693);
    float _709 = fma(_695, _699, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _713 = _701 >= 0.0;
    float _715 = _687 + 0.5;
    bool _717 = !_565;
    float _719 = _717 ? _185 : as_type<float>(_705);
    float _721 = fma(_709, _663, _707);
    float _723 = _715 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _725 = -_719;
    float _727 = _725 + 0.5;
    float _729 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[117].x, _721);
    float _731 = _581 * _581;
    float _733 = _727 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _735 = fma(_659, _659, _731);
    float _737 = _699;
    int _739 = as_type<int>(_709);
    bool _741 = _583;
    if (_713)
    {
        _737 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _743 = _737;
    float _745 = _733 * _577;
    float _747 = _723 * _711;
    float _749 = fma(_683, _683, _735);
    if (_713)
    {
        float _751 = _743 * 5.0;
        _739 = as_type<int>(_751);
    }
    int _753 = _739;
    out.m_46.y = _745;
    float _755 = _729 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _757 = rsqrt(_749);
    out.m_46.x = _747;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_713)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3201 = as_type<float>(_753);
        out.gl_Position.z = _3201;
    }
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _769 = _761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_713)
    {
        out.m_35.x = 0.0;
    }
    float _771 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _773 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = _581 * _757;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_48.x = _771;
    out.m_48.y = _773;
    out.m_48.z = _769;
    out.m_48.w = _755;
    float _783 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _789 = _659 * _757;
    out.m_50.x = _783;
    out.m_50.y = _785;
    out.m_50.z = _787;
    out.m_50.w = _763;
    if (_713)
    {
        return out;
    }
    float _791 = -_775;
    float _793 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _575);
    float _795 = _683 * _757;
    float _797 = -_789;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _635);
    float _801 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _803 = _793 + _801;
    float _805 = -_795;
    float _807 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[18].w, _661);
    float _809 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _811 = _799 + _809;
    float _813 = _803 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _817 = _807 + _815;
    float _819 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[28].x, _813);
    float _821 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[28].z, _819);
    bool _823 = _821 >= 0.0;
    if (_823)
    {
        _759 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _825 = _759;
    int _827 = as_type<int>(_825);
    if (_823)
    {
        out.m_35.x = 0.0;
    }
    if (_823)
    {
        float _829 = _825 * 5.0;
        _827 = as_type<int>(_829);
    }
    int _831 = _827;
    if (_823)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3379 = as_type<float>(_831);
        out.gl_Position.z = _3379;
    }
    if (_823)
    {
        return out;
    }
    float _833 = -_575;
    float _835 = _833 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _837 = -_635;
    float _839 = _837 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _841 = _835 * _835;
    float _843 = -_661;
    float _845 = _843 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _847 = -_775;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _851 = -_789;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _659);
    float _855 = fma(_839, _839, _841);
    float _857 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _859 = _849 * _849;
    float _861 = fma(_845, _845, _855);
    float _863 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[1].x, _857);
    float _865 = -_795;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _683);
    float _869 = fma(_853, _853, _859);
    float _871 = rsqrt(_861);
    float _873 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _863);
    float _875 = fma(_867, _867, _869);
    float _877 = rsqrt(_873);
    float _879 = _839 * _871;
    float _881 = _845 * _871;
    float _883 = _835 * _871;
    float _885 = sqrt(_875);
    float _887 = _883 * _883;
    float _889 = _877 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _891 = _877 * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _893 = _877 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _895 = fma(_879, _879, _887);
    float _897 = _889 * _879;
    float _899 = _891 * _881;
    float _901 = _893 * _883;
    float _903 = fma(_881, _881, _895);
    float _905 = -_897;
    float _907 = fma(_891, _883, _905);
    float _909 = -_899;
    float _911 = fma(_893, _879, _909);
    float _913 = -_901;
    float _915 = fma(_889, _881, _913);
    float _917 = -_575;
    float _919 = _917 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _921 = _879 * _907;
    float _923 = _881 * _911;
    float _925 = _883 * _915;
    float _927 = rsqrt(_903);
    float _929 = -_921;
    float _931 = fma(_881, _915, _929);
    float _933 = -_635;
    float _935 = _933 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _937 = -_923;
    float _939 = fma(_883, _907, _937);
    float _941 = -_925;
    float _943 = fma(_879, _911, _941);
    float _945 = _919 * _931;
    float _947 = _911 * _919;
    float _949 = -_661;
    float _951 = _949 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _953 = fma(_935, _939, _945);
    float _955 = fma(_915, _935, _947);
    float _957 = fma(_951, _943, _953);
    float _959 = fma(_907, _951, _955);
    float _961 = _957 * _957;
    float _963 = fma(_959, _959, _961);
    float _965 = rsqrt(_963);
    float _967 = _959 * _965;
    float _969 = _957 * _965;
    float _971 = abs(_967);
    float _973 = abs(_969);
    float _975 = precise::max(_971, _973);
    bool _977 = _975 >= 16.0;
    float _979 = _969;
    float _981 = _967;
    int _983 = as_type<int>(_963);
    float _985 = _867;
    if (_977)
    {
        float _987 = _969 * 0.0625;
        _979 = _987;
    }
    float _989 = _979;
    if (_977)
    {
        float _991 = _967 * 0.0625;
        _981 = _991;
    }
    float _993 = _981;
    float _995 = abs(_989);
    bool _997 = _995 != 0.0;
    bool _999 = isnan(_995);
    bool _1001 = _997 || _999;
    bool _1003 = isnan(0.0);
    bool _1005 = _1001 || _1003;
    float _1007 = abs(_993);
    bool _1009 = _1007 == 0.0;
    float _1011 = abs(_993);
    bool _1013 = _1011 == 0.0;
    bool _1015 = !_1005;
    bool _1017 = _1013 && _1015;
    if (_1017)
    {
        bool _1019 = as_type<int>(_993) >= 0;
        _741 = _1019;
    }
    bool _1021 = _741;
    int _1023 = _1021 ? (-1) : 0;
    if (_1017)
    {
        int _1025 = _1021 ? 0 : 1078530011;
        _983 = _1025;
    }
    int _1027 = _983;
    int _1029 = _1027;
    if (_1017)
    {
        int _1031 = int(0x80000000) & as_type<int>(_989);
        int _1033 = _1027 | _1031;
        _985 = as_type<float>(_1033);
    }
    float _1035 = _985;
    bool _1037 = !_1005;
    bool _1039 = _1037 && _1009;
    float _1041 = _1035;
    float _1043 = _1035;
    if (!_1039)
    {
        float _1045 = abs(_989);
        bool _1047 = _1045 != as_type<float>(0x7f800000u /* inf */);
        bool _1049 = isnan(_1045);
        bool _1051 = _1047 || _1049;
        bool _1053 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1055 = _1051 || _1053;
        float _1057 = abs(_993);
        bool _1059 = _1057 == as_type<float>(0x7f800000u /* inf */);
        float _1061 = abs(_993);
        bool _1063 = _1061 == as_type<float>(0x7f800000u /* inf */);
        bool _1065 = !_1055;
        bool _1067 = _1063 && _1065;
        if (_1067)
        {
            bool _1069 = as_type<int>(_993) >= 0;
            _1023 = _1069 ? (-1) : 0;
        }
        int _1071 = _1023;
        if (_1067)
        {
            _1029 = 1075235812;
        }
        int _1073 = _1029;
        int _1075 = _1073;
        if (_1067)
        {
            int _1077 = ~_1071;
            int _1079 = (_1077 != 0) ? _1073 : 1061752795;
            _1075 = _1079;
        }
        int _1081 = _1075;
        if (_1067)
        {
            int _1083 = int(0x80000000) & as_type<int>(_989);
            int _1085 = _1081 | _1083;
            _1041 = as_type<float>(_1085);
        }
        float _1087 = _1041;
        bool _1089 = !_1055;
        bool _1091 = _1089 && _1059;
        _1043 = _1087;
        if (!_1091)
        {
            float _1093 = abs(_989);
            float _1095 = abs(_993);
            float _1097 = precise::max(_1093, _1095);
            float _1099 = abs(_989);
            float _1101 = abs(_993);
            float _1103 = precise::min(_1099, _1101);
            float _1105 = 1.0 / _1097;
            float _1107 = abs(_989);
            float _1109 = abs(_993);
            bool _1111 = _1107 > _1109;
            bool _1113 = as_type<int>(_993) >= 0;
            float _1115 = _1103 * _1105;
            float _1117 = abs(_989);
            float _1119 = abs(_993);
            float _1121 = _1117 + _1119;
            int _1123 = as_type<int>(_989) & int(0x80000000);
            float _1125 = _1115 * _1115;
            bool _1127 = _1121 > as_type<float>(0x7f800000u /* inf */);
            bool _1129 = isnan(_1121);
            bool _1131 = _1127 || _1129;
            bool _1133 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1135 = _1131 || _1133;
            float _1137 = _1125 + 11.33538818359375;
            float _1139 = fma(_1125, _1137, 28.84246826171875);
            float _1141 = fma(_1125, _1139, 19.6966705322265625);
            float _1143 = fma(_1125, -0.82336294651031494140625, -5.674867153167724609375);
            float _1145 = fma(_1125, _1143, -6.565555095672607421875);
            float _1147 = 1.0 / _1141;
            float _1149 = _1125 * _1145;
            float _1151 = _1115 * _1149;
            float _1153 = fma(_1151, _1147, _1115);
            float _1155 = _1153;
            _1043 = _1121;
            if (_1111)
            {
                float _1157 = -_1153;
                float _1159 = _1157 + 1.57079637050628662109375;
                _1155 = _1159;
            }
            float _1161 = _1155;
            int _1163 = as_type<int>(_1161);
            if (!_1113)
            {
                float _1165 = -_1161;
                float _1167 = _1165 + 3.1415927410125732421875;
                _1163 = as_type<int>(_1167);
            }
            int _1169 = _1163;
            if (!_1135)
            {
                int _1171 = _1123 | _1169;
                _1043 = as_type<float>(_1171);
            }
        }
    }
    float _1173 = _1043;
    float _1175 = _1173 + 1.57079637050628662109375;
    float _1177 = _757 * _885;
    float _1179 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1181 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1183 = _1175 * 0.15915493667125701904296875;
    float _1185 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1187 = _1177 * _1179;
    float _1189 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _1191 = _1183 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = _1177 * _1185;
    float _1197 = _1181 * _1187;
    float _1199 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1201 = _1199 * 0.5;
    float _1203 = _879 * _927;
    float _1205 = _1189 * _1195;
    float _1207 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1209 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1211 = _1183 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1217 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1207);
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1209);
    float _1221 = _881 * _927;
    float _1223 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1215);
    float _1225 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1217);
    float _1227 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1219);
    float _1229 = -_1193;
    float _1231 = _1229 + 1.0;
    float _1233 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1223);
    float _1235 = _883 * _927;
    float _1237 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1239 = _1203 * _1231;
    float _1241 = _1221 * _1221;
    float _1243 = _1235 * _1231;
    float _1245 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1247 = _1221 * _1213;
    float _1249 = _1203 * _1213;
    float _1251 = fma(_1203, _1239, _1193);
    float _1253 = _1235 * _1213;
    float _1255 = -_1247;
    float _1257 = fma(_1235, _1239, _1255);
    float _1259 = fma(_1221, _1243, _1249);
    float _1261 = fma(_1231, _1241, _1193);
    float _1263 = -_1253;
    float _1265 = fma(_1221, _1239, _1263);
    float _1267 = _1237 * _1257;
    float _1269 = _1237 * _1259;
    float _1271 = fma(_1235, _1239, _1247);
    float _1273 = fma(_1245, _1251, _1267);
    float _1275 = _1233 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1277 = fma(_1221, _1239, _1253);
    float _1279 = fma(_1245, _1265, _1269);
    float _1281 = fma(_1275, _1277, _1273);
    float _1283 = fma(_1275, _1261, _1279);
    float _1285 = fma(_1235, _1243, _1193);
    float _1287 = -_1249;
    float _1289 = fma(_1221, _1243, _1287);
    float _1291 = _635 + _1281;
    float _1293 = _661 + _1283;
    float _1295 = _1237 * _1285;
    float _1297 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1299 = _1291 + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1303 = _1293 + _1301;
    float _1305 = fma(_1245, _1271, _1295);
    float _1307 = _1299 * _1299;
    float _1309 = _1303 * _1303;
    float _1311 = fma(_1275, _1289, _1305);
    float _1313 = _1307 + _1309;
    float _1315 = _575 + _1311;
    float _1317 = sqrt(_1313);
    bool _1319 = _1317 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1321 = _1295;
    float _1323 = _1193;
    float _1325 = _1235;
    float _1327 = _1221;
    float _1329 = _1311;
    if (!_1319)
    {
        _1321 = _1309;
    }
    float _1331 = _1321;
    float _1333 = _1331;
    if (!_1319)
    {
        _1323 = _1307;
    }
    float _1335 = _1323;
    float _1337 = _1335;
    if (!_1319)
    {
        _1325 = _1291;
    }
    float _1339 = _1325;
    float _1341 = _1339;
    if (!_1319)
    {
        _1327 = _1293;
    }
    float _1343 = _1327;
    float _1345 = _1343;
    if (!_1319)
    {
        _1329 = _1315;
    }
    float _1347 = _1329;
    bool _1349 = !_1319;
    float _1351 = _1347;
    if (!_1349)
    {
        float _1353 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1357 = _1317 + _1355;
        float _1359 = _1315 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1361 = rsqrt(_1313);
        float _1363 = _1357 * _1353;
        float _1365 = _1363 * 0.15915493667125701904296875;
        float _1367 = _1365 * 6.283185482025146484375;
        float _1369 = sin(_1367);
        float _1371 = _1365 * 6.283185482025146484375;
        float _1373 = cos(_1371);
        float _1375 = fma(_1369, _1359, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1377 = _1361 * _1375;
        float _1379 = _1373 + (-1.0);
        float _1381 = fma(_1299, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1383 = fma(_1303, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1385 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1389 = _1381 + _1387;
        float _1391 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1393 = _1383 + _1391;
        float _1395 = fma(_1315, _1373, _1385);
        float _1397 = _1389 * _1389;
        float _1399 = _1393 * _1393;
        _1351 = _1395;
        _1337 = _1397;
        _1333 = _1399;
        _1341 = _1381;
        _1345 = _1383;
    }
    float _1401 = _1351;
    float _1403 = _1337;
    float _1405 = _1333;
    float _1407 = _1341;
    float _1409 = _1345;
    float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1413 = _1401 + _1411;
    out.m_48.x = _771;
    out.m_48.y = _773;
    out.m_48.z = _769;
    out.m_48.w = _755;
    float _1415 = fma(_1413, _1413, _1403);
    out.m_50.x = _783;
    out.m_50.y = _785;
    out.m_50.z = _787;
    out.m_50.w = _763;
    float _1417 = _1415 + _1405;
    float _1419 = sqrt(_1417);
    bool _1421 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1423 = isnan(_1419);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1429 = _1425 || _1427;
    float _1431 = _1403;
    float _1433 = _1409;
    if (!_1429)
    {
        _1431 = 1.0;
    }
    float _1435 = _1431;
    bool _1437 = !_1429;
    float _1439 = _1435;
    if (!_1437)
    {
        bool _1441 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1443 = isnan(_1419);
        bool _1445 = _1441 || _1443;
        bool _1447 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1449 = _1445 || _1447;
        if (!_1449)
        {
            float _1451 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1453 = _1419 + _1451;
            float _1455 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1457 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1455;
            float _1459 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1461 = _1459 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1463 = 1.0 / _1457;
            float _1465 = _1453 * _1463;
            float _1467 = fma(_1465, _1461, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1439 = _1467;
            _1469 = true;
        }
        else
        {
            bool _1471 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1473 = isnan(_1419);
            bool _1475 = _1471 || _1473;
            bool _1477 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1479 = _1475 || _1477;
            if (!_1479)
            {
                float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1483 = _1419 + _1481;
                float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1487 = _1485 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1489 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1491 = _1489 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1493 = 1.0 / _1487;
                float _1495 = _1483 * _1493;
                float _1497 = fma(_1495, _1491, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1439 = _1497;
                _1469 = true;
            }
            else
            {
                _1439 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1469 = false;
    float _1499 = _1439;
    float _1501 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1503 = _1401 + _1501;
    float _1505 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1507 = _1407 + _1505;
    float _1509 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1511 = _1409 + _1509;
    float _1513 = fma(_1503, _1499, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1515 = fma(_1507, _1499, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1517 = fma(_1511, _1499, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1519 = -_575;
    float _1521 = _1519 + _1513;
    float _1523 = -_635;
    float _1525 = _1523 + _1515;
    float _1527 = -_661;
    float _1529 = _1527 + _1517;
    float _1531 = _1521 * _1521;
    float _1533 = fma(_1525, _1525, _1531);
    float _1535 = fma(_1529, _1529, _1533);
    float _1537 = sqrt(_1535);
    bool _1539 = _1537 > 0.0;
    bool _1541 = !_1539;
    float _1543 = _1507;
    float _1545 = _1515;
    float _1547 = _1517;
    float _1549 = _1513;
    if (!_1541)
    {
        bool _1551 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1553 = _1537;
        if (_1551)
        {
            float _1555 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1553 = _1555;
        }
        float _1557 = _1553;
        float _1559 = _1557;
        if (_1551)
        {
            float _1561 = _395 * _1557;
            _1543 = _1561;
        }
        float _1563 = _1543;
        float _1565 = _1563;
        if (_1551)
        {
            float _1567 = _397 * _1557;
            _1433 = _1567;
        }
        float _1569 = _1433;
        float _1571 = _1569;
        float _1573 = _1569;
        if (_1551)
        {
            float _1575 = _399 * _1557;
            _1559 = _1575;
        }
        float _1577 = _1559;
        float _1579 = _1577;
        if (!_1551)
        {
            float _1581 = _107 + 1.0;
            float _1583 = _1581;
            if (!_141)
            {
                float _1585 = _1581 * _1581;
                float _1587 = _1585 * 0.5;
                _1571 = _1587;
            }
            float _1589 = _1571;
            float _1591 = _1589;
            if (!_141)
            {
                float _1593 = _1589 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1591 = _1593;
            }
            float _1595 = _1591;
            bool _1597 = !_141;
            float _1599 = _1595;
            if (!_1597)
            {
                float _1601 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1603 = log2(_1601);
                float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1607 = _1605 + 1.0;
                float _1609 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1611 = _1603 * _1581;
                float _1613 = exp2(_1611);
                float _1615 = _1609 * 0.693147182464599609375;
                float _1617 = 1.0 / _1615;
                float _1619 = 1.0 / _1607;
                float _1621 = _1613 + (-1.0);
                float _1623 = -_1621;
                float _1625 = fma(_1623, _1617, _1581);
                float _1627 = _1625 * _1619;
                float _1629 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1599 = _1629;
            }
            float _1631 = _1599;
            float _1633 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1635 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1637 = !_141;
            if (!_1637)
            {
                float _1639 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1641 = log2(_1639);
                float _1643 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1645 = _1643 + 1.0;
                float _1647 = 1.0 / _1645;
                float _1649 = _1641 * _1581;
                float _1651 = exp2(_1649);
                float _1653 = -_1651;
                float _1655 = _1653 + 1.0;
                float _1657 = _1655 * _1647;
                _1583 = _1657;
            }
            float _1659 = _1583;
            float _1661 = fma(_1659, _145, _1635);
            float _1663 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1665 = fma(_1659, _143, _1633);
            float _1667 = -_357;
            float _1669 = _1667 + _1661;
            float _1671 = fma(_1659, _147, _1663);
            float _1673 = -_359;
            float _1675 = _1673 + _1665;
            float _1677 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1679 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1681 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1683 = -_361;
            float _1685 = _1683 + _1671;
            float _1687 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1677);
            float _1689 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1679);
            float _1691 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1681);
            float _1693 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1687);
            float _1695 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1689);
            float _1697 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1691);
            _403 = _1695;
            _405 = _1693;
            _407 = _1697;
            _1565 = _1693;
            _1573 = _1695;
            _1579 = _1697;
        }
        float _1699 = _403;
        float _1701 = _405;
        float _1703 = _407;
        float _1705 = _1565;
        float _1707 = _1573;
        float _1709 = _1579;
        float _1711 = _1699 * _1699;
        float _1713 = rsqrt(_1535);
        float _1715 = fma(_1701, _1701, _1711);
        float _1717 = fma(_1703, _1703, _1715);
        float _1719 = sqrt(_1717);
        float _1721 = _1521 * _1713;
        float _1723 = _1525 * _1713;
        float _1725 = _1529 * _1713;
        bool _1727 = _1719 > 0.0;
        bool _1729 = !_1727;
        if (!_1729)
        {
            float _1731 = rsqrt(_1717);
            float _1733 = _1731 * _1699;
            float _1735 = _1731 * _1701;
            float _1737 = _1731 * _1703;
            float _1739 = _1721 * _1733;
            float _1741 = fma(_1723, _1735, _1739);
            float _1743 = fma(_1725, _1737, _1741);
            float _1745 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1747 = fma(_1705, _1745, _1515);
            float _1749 = fma(_1707, _1745, _1513);
            float _1751 = fma(_1709, _1745, _1517);
            _1545 = _1747;
            _1547 = _1751;
            _1549 = _1749;
        }
    }
    float _1753 = _1545;
    float _1755 = _1547;
    float _1757 = _1549;
    float _1759 = _793 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1761 = -_789;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1753);
    float _1765 = -_795;
    float _1767 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1755);
    float _1769 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1759);
    bool _1771 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1775 = _1771 || _1773;
    bool _1777 = isnan(0.5);
    bool _1779 = _1775 || _1777;
    float _1781 = -_775;
    float _1783 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1757);
    float _1785 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1769);
    float _1787 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1789 = _793 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1791 = 1.0 / _1787;
    float _1793 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1789);
    float _1795 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1793);
    float _1797 = _1793;
    float _1799 = _1795;
    float _1801 = _1783;
    if (_1779)
    {
        _1797 = _1763;
    }
    float _1803 = _1797;
    float _1805 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1807 = _1803;
    if (_1779)
    {
        _1799 = _1767;
    }
    float _1809 = _1799;
    float _1811 = _1809;
    if (!_1779)
    {
        float _1813 = _803 * _803;
        float _1815 = 1.0 / _1177;
        float _1817 = -_661;
        float _1819 = _1817 + _1755;
        float _1821 = fma(_811, _811, _1813);
        float _1823 = fma(_817, _817, _1821);
        float _1825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1827 = sqrt(_1823);
        float _1829 = precise::min(_1827, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1831 = _1829 * _1825;
        float _1833 = -_635;
        float _1835 = _1833 + _1753;
        float _1837 = _1831 * _1815;
        float _1839 = -_575;
        float _1841 = _1839 + _1757;
        float _1843 = fma(_1835, _1837, _799);
        float _1845 = fma(_1841, _1837, _793);
        float _1847 = fma(_1819, _1837, _807);
        _1801 = _1845;
        _1807 = _1843;
        _1811 = _1847;
    }
    float _1849 = _1801;
    float _1851 = _1807;
    float _1853 = _1811;
    float _1855 = _1805 + _1787;
    float _1857 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1859 = _1855 * _1791;
    float _1861 = _1859 * 0.5;
    float _1863 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1865 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1857);
    bool _1867 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1869 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(0.5);
    bool _1875 = _1871 || _1873;
    float _1877 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1879 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1877);
    float _1881 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1863);
    float _1883 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1865);
    float _1885 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1887 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1889 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1881);
    float _1891 = 1.0 / _1879;
    float _1893 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1895 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1885);
    float _1897 = _1889 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1899 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1887);
    float _1901 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1903 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1905 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1907 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1909 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1895);
    float _1911 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1901);
    float _1913 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1903);
    float _1915 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1905);
    float _1917 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1907);
    float _1919 = _1901;
    float _1921 = _1897;
    if (_1875)
    {
        _1919 = 1.0;
    }
    float _1923 = _1919;
    float _1925 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1899);
    float _1927 = _1923;
    if (_1875)
    {
        _1921 = 1.0;
    }
    float _1929 = _1921;
    float _1931 = _1909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1935 = _1891 * _1933;
    float _1937 = _1929;
    if (!_1875)
    {
        float _1939 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1941 = _1939 * 0.15915493667125701904296875;
        float _1943 = _1941 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        float _1947 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1949 = _1947 * 0.15915493667125701904296875;
        float _1951 = _1941 * 6.283185482025146484375;
        float _1953 = sin(_1951);
        float _1955 = 1.0 / _1945;
        float _1957 = _1949 * 6.283185482025146484375;
        float _1959 = cos(_1957);
        float _1961 = _1953 * _1955;
        float _1963 = _1949 * 6.283185482025146484375;
        float _1965 = sin(_1963);
        float _1967 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1969 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1967;
        float _1971 = _1959 * _1961;
        float _1973 = 1.0 / _1969;
        float _1975 = 1.0 / _1971;
        float _1977 = _1965 * _1975;
        float _1979 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1981 = fma(_1935, _1977, _1979);
        float _1983 = _1981 * _1973;
        float _1985 = precise::clamp(_1983, 0.0, 1.0);
        _1927 = _1985;
    }
    float _1987 = _1927;
    if (!_1875)
    {
        float _1989 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1991 = _1989 * 0.15915493667125701904296875;
        float _1993 = _1991 * 6.283185482025146484375;
        float _1995 = cos(_1993);
        float _1997 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1999 = _1997 * 0.15915493667125701904296875;
        float _2001 = _1991 * 6.283185482025146484375;
        float _2003 = sin(_2001);
        float _2005 = 1.0 / _1995;
        float _2007 = _1999 * 6.283185482025146484375;
        float _2009 = cos(_2007);
        float _2011 = _2003 * _2005;
        float _2013 = _1999 * 6.283185482025146484375;
        float _2015 = sin(_2013);
        float _2017 = _2009 * _2011;
        float _2019 = 1.0 / _2017;
        float _2021 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2023 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2021;
        float _2025 = 1.0 / _2023;
        float _2027 = _2015 * _2019;
        float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2031 = fma(_1935, _2027, _2029);
        float _2033 = _2031 * _2025;
        float _2035 = precise::clamp(_2033, 0.0, 1.0);
        float _2037 = -_2035;
        float _2039 = _2037 + 1.0;
        _1937 = _2039;
    }
    float _2041 = _1937;
    float _2043 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2045 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1915);
    float _2047 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1917);
    bool _2049 = _1987 > 0.0;
    bool _2051 = isnan(_1987);
    bool _2053 = _2049 || _2051;
    bool _2055 = isnan(0.0);
    bool _2057 = _2053 || _2055;
    float _2059 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1911);
    float _2061 = _1987 * _2041;
    float _2063 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2045);
    float _2065 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2047);
    bool _2067 = _2041 <= 0.0;
    bool _2069 = !_2057;
    bool _2071 = _2067 || _2069;
    float _2073 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1913);
    float _2075 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2059);
    float _2077 = _2063 + _2065;
    float _2079 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2081 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2073);
    float _2083 = _2077 * 0.5;
    float _2085 = _2079 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_52.x = _1851;
    out.m_52.y = _1849;
    out.m_52.z = _1853;
    out.gl_Position.x = _2075;
    out.gl_Position.y = _2081;
    out.gl_Position.z = _2063;
    out.gl_Position.w = _2065;
    out.m_54.z = _2083;
    out.m_54.w = _2065;
    out.m_35.x = _2085;
    if (!_2071)
    {
        return out;
    }
    out.m_35.x = 0.0;
    float _2087 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2087;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1469 = false;
    bool _537 = false;
    bool _427 = false;
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
        float _2144 = as_type<float>(_89);
        out.gl_Position.z = _2144;
    }
    if (!_77)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _93 = in.m_37.w;
    bool _95 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _97 = isnan(_93);
    bool _99 = _95 || _97;
    bool _101 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _103 = _99 || _101;
    float _105 = -_93;
    float _107 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _109 = 0.0;
    if (_103)
    {
        float _111 = float(_73);
        _109 = _111;
    }
    float _113 = _109;
    bool _115 = _107 >= _113;
    bool _117 = !_103;
    bool _119 = _115 || _117;
    if (_119)
    {
        _83 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _83;
    if (_119)
    {
        out.m_35.x = 0.0;
    }
    if (_119)
    {
        float _123 = _121 * 5.0;
        _91 = as_type<int>(_123);
    }
    int _125 = _91;
    if (_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2212 = as_type<float>(_125);
        out.gl_Position.z = _2212;
    }
    if (_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = as_type<float>(int(gl_VertexIndex));
    float _129 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _131 = in.m_42.w;
    bool _133 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _135 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _137 = _133 || _135;
    bool _139 = isnan(1.0);
    bool _141 = _137 || _139;
    float _143 = in.m_37.x;
    float _145 = in.m_37.y;
    float _147 = in.m_37.z;
    float _149 = in.m_32.x;
    float _151 = in.m_32.y;
    float _153 = in.m_32.z;
    float _155 = 0.0;
    float _157 = _129;
    if (!_141)
    {
        float _159 = _129 * _129;
        float _161 = _159 * 0.5;
        _155 = _161;
    }
    float _163 = _155;
    float _165 = _163;
    if (!_141)
    {
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _165 = _167;
    }
    float _169 = _165;
    int _171 = as_type<int>(_127) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_127) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_141;
    float _189 = _169;
    float _191 = 0.0;
    float _193 = _127;
    if (!_187)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _129 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _129);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _189 = _223;
        _191 = _207;
        _193 = _213;
    }
    float _225 = _189;
    float _227 = _191;
    float _229 = _193;
    bool _231 = !_141;
    float _233 = _229;
    float _235 = _227;
    float _237 = _225;
    if (!_231)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _129 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _157 = _257;
        _233 = _245;
    }
    float _259 = _157;
    float _261 = _233;
    float _263 = _261;
    if (!_141)
    {
        float _265 = _107 * _107;
        float _267 = _265 * 0.5;
        _235 = _267;
    }
    float _269 = _235;
    float _271 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_141)
    {
        _263 = _107;
    }
    float _277 = _263;
    float _279 = fma(_259, _143, _271);
    float _281 = fma(_259, _145, _273);
    float _283 = _277;
    if (!_141)
    {
        float _285 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _285;
    }
    float _287 = _237;
    bool _289 = !_141;
    float _291 = _287;
    if (!_289)
    {
        float _293 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = log2(_293);
        float _297 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _299 = _297 + 1.0;
        float _301 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _303 = _107 * _295;
        float _305 = 1.0 / _299;
        float _307 = _301 * 0.693147182464599609375;
        float _309 = exp2(_303);
        float _311 = 1.0 / _307;
        float _313 = _309 + (-1.0);
        float _315 = -_313;
        float _317 = fma(_315, _311, _107);
        float _319 = _317 * _305;
        float _321 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _291 = _321;
    }
    float _323 = _291;
    bool _325 = !_141;
    if (!_325)
    {
        float _327 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _329 = log2(_327);
        float _331 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _333 = _331 + 1.0;
        float _335 = 1.0 / _333;
        float _337 = _107 * _329;
        float _339 = exp2(_337);
        float _341 = -_339;
        float _343 = _341 + 1.0;
        float _345 = _343 * _335;
        _283 = _345;
    }
    float _347 = _283;
    float _349 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _351 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _353 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _355 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _357 = fma(_347, _145, _349);
    float _359 = fma(_347, _143, _351);
    float _361 = fma(_347, _147, _353);
    float _363 = fma(_281, _131, _151);
    float _365 = -_357;
    float _367 = _281 + _365;
    float _369 = fma(_259, _147, _275);
    float _371 = fma(_279, _131, _149);
    float _373 = -_359;
    float _375 = _279 + _373;
    float _377 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _379 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _381 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _383 = -_361;
    float _385 = _369 + _383;
    float _387 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _377);
    float _389 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _379);
    float _391 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _381);
    float _393 = fma(_369, _131, _153);
    float _395 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _387);
    float _397 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _389);
    float _399 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _391);
    bool _401 = !_355;
    float _403 = _397;
    float _405 = _395;
    float _407 = _399;
    float _425;
    if (!_401)
    {
        float _409 = in.m_44.x;
        float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _413 = _409 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[12].x, _107);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        float _429 = float(_73);
        float _431 = 1.0 / _429;
        float _433 = _107 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _439 = _435 + _437;
    float _441 = in.m_42.x;
    float _443 = in.m_42.y;
    bool _445 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _447 = isnan(_435);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _457;
    bool _461 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _463 = isnan(_435);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -_455;
    float _475 = _473 + 1.0;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _477;
    float _481 = 1.0 / _459;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _485 = _471 * _475;
    float _487 = -_471;
    float _489 = _487 + 1.0;
    float _491 = _439 * _481;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _493;
    float _497 = fma(_479, _491, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _499 = fma(_495, _491, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _501 = _497 * _485;
    float _503 = _499 * _485;
    float _505 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _501);
    float _507 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _503);
    float _509 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[144].x, _505);
    float _511 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[144].y, _507);
    float _513 = _509 * _441;
    float _515 = _511 * _443;
    bool _517 = !_483;
    float _535;
    if (!_517)
    {
        float _519 = in.m_44.x;
        float _521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _523 = _519 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[11].y, _107);
        float _527 = _525 * _521;
        float _529 = floor(_527);
        float _531 = -_529;
        float _533 = _527 + _531;
        _535 = _533;
        _537 = true;
    }
    else
    {
        float _539 = float(_73);
        float _541 = 1.0 / _539;
        float _543 = _107 * _541;
        _535 = _543;
    }
    _537 = false;
    float _545 = _535;
    float _547 = in.m_44.y;
    float _549 = _363 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _551 = in.m_44.x;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _559 = _557 != 0;
    float _561 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[5].x, _549);
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _565 = _563 != 0;
    float _567 = 1.0 / _555;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _569;
    float _573 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[5].z, _561);
    float _575 = _573 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _579 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _581 = _575 + _579;
    bool _583 = _547 > 0.5;
    float _585 = _363 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _587 = _363 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _589 = _571 * _567;
    bool _591 = _551 > 0.5;
    float _593 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[4].x, _585);
    float _595 = fma(_371, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _599 = _545 + _597;
    float _601 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[4].z, _593);
    float _603 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[6].z, _595);
    bool _605 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _607 = isnan(_545);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = fma(_589, _599, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _623 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _625 = isnan(_545);
    bool _627 = _623 || _625;
    bool _629 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _631 = _627 || _629;
    float _633 = float(_631);
    float _635 = _601 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _637 = _581 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _639 = 1.0 / _621;
    bool _641 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _643 = isnan(_545);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -_633;
    float _655 = _653 + 1.0;
    float _657 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _659 = _635 + _657;
    float _661 = _603 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _663 = _615 * _655;
    float _665 = -_615;
    float _667 = _665 + 1.0;
    float _669 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[28].x, _637);
    float _671 = -_181;
    int _673 = _591 ? as_type<int>(_671) : as_type<int>(_181);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _679 = _651 * _667;
    float _681 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _683 = _661 + _681;
    bool _685 = !_559;
    float _687 = _685 ? _181 : as_type<float>(_673);
    float _689 = -_651;
    float _691 = _689 + 1.0;
    float _693 = _617 * _679;
    float _695 = _677 * _639;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _699 = _545 + _697;
    float _701 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[28].z, _669);
    float _703 = -_185;
    int _705 = _583 ? as_type<int>(_703) : as_type<int>(_185);
    float _707 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[115].x, _693);
    float _709 = fma(_695, _699, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _713 = _701 >= 0.0;
    float _715 = _687 + 0.5;
    bool _717 = !_565;
    float _719 = _717 ? _185 : as_type<float>(_705);
    float _721 = fma(_709, _663, _707);
    float _723 = _715 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _725 = -_719;
    float _727 = _725 + 0.5;
    float _729 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[117].x, _721);
    float _731 = _581 * _581;
    float _733 = _727 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _735 = fma(_659, _659, _731);
    float _737 = _699;
    int _739 = as_type<int>(_709);
    bool _741 = _583;
    if (_713)
    {
        _737 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _743 = _737;
    float _745 = _733 * _577;
    float _747 = _723 * _711;
    float _749 = fma(_683, _683, _735);
    if (_713)
    {
        float _751 = _743 * 5.0;
        _739 = as_type<int>(_751);
    }
    int _753 = _739;
    out.m_46.y = _745;
    float _755 = _729 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _757 = rsqrt(_749);
    out.m_46.x = _747;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    if (_713)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3201 = as_type<float>(_753);
        out.gl_Position.z = _3201;
    }
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _769 = _761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_713)
    {
        out.m_35.x = 0.0;
    }
    float _771 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _773 = _767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _775 = _581 * _757;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_48.x = _771;
    out.m_48.y = _773;
    out.m_48.z = _769;
    out.m_48.w = _755;
    float _783 = _777 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _785 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _787 = _781 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _789 = _659 * _757;
    out.m_50.x = _783;
    out.m_50.y = _785;
    out.m_50.z = _787;
    out.m_50.w = _763;
    if (_713)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _791 = -_775;
    float _793 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _575);
    float _795 = _683 * _757;
    float _797 = -_789;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _635);
    float _801 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _803 = _793 + _801;
    float _805 = -_795;
    float _807 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[18].w, _661);
    float _809 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _811 = _799 + _809;
    float _813 = _803 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _815 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _817 = _807 + _815;
    float _819 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[28].x, _813);
    float _821 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[28].z, _819);
    bool _823 = _821 >= 0.0;
    if (_823)
    {
        _759 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _825 = _759;
    int _827 = as_type<int>(_825);
    if (_823)
    {
        out.m_35.x = 0.0;
    }
    if (_823)
    {
        float _829 = _825 * 5.0;
        _827 = as_type<int>(_829);
    }
    int _831 = _827;
    if (_823)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3379 = as_type<float>(_831);
        out.gl_Position.z = _3379;
    }
    if (_823)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _833 = -_575;
    float _835 = _833 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _837 = -_635;
    float _839 = _837 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _841 = _835 * _835;
    float _843 = -_661;
    float _845 = _843 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _847 = -_775;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[18].w, _581);
    float _851 = -_789;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _659);
    float _855 = fma(_839, _839, _841);
    float _857 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _859 = _849 * _849;
    float _861 = fma(_845, _845, _855);
    float _863 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[1].x, _857);
    float _865 = -_795;
    float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[18].w, _683);
    float _869 = fma(_853, _853, _859);
    float _871 = rsqrt(_861);
    float _873 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[1].z, _863);
    float _875 = fma(_867, _867, _869);
    float _877 = rsqrt(_873);
    float _879 = _839 * _871;
    float _881 = _845 * _871;
    float _883 = _835 * _871;
    float _885 = sqrt(_875);
    float _887 = _883 * _883;
    float _889 = _877 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _891 = _877 * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _893 = _877 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _895 = fma(_879, _879, _887);
    float _897 = _889 * _879;
    float _899 = _891 * _881;
    float _901 = _893 * _883;
    float _903 = fma(_881, _881, _895);
    float _905 = -_897;
    float _907 = fma(_891, _883, _905);
    float _909 = -_899;
    float _911 = fma(_893, _879, _909);
    float _913 = -_901;
    float _915 = fma(_889, _881, _913);
    float _917 = -_575;
    float _919 = _917 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _921 = _879 * _907;
    float _923 = _881 * _911;
    float _925 = _883 * _915;
    float _927 = rsqrt(_903);
    float _929 = -_921;
    float _931 = fma(_881, _915, _929);
    float _933 = -_635;
    float _935 = _933 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _937 = -_923;
    float _939 = fma(_883, _907, _937);
    float _941 = -_925;
    float _943 = fma(_879, _911, _941);
    float _945 = _919 * _931;
    float _947 = _911 * _919;
    float _949 = -_661;
    float _951 = _949 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _953 = fma(_935, _939, _945);
    float _955 = fma(_915, _935, _947);
    float _957 = fma(_951, _943, _953);
    float _959 = fma(_907, _951, _955);
    float _961 = _957 * _957;
    float _963 = fma(_959, _959, _961);
    float _965 = rsqrt(_963);
    float _967 = _959 * _965;
    float _969 = _957 * _965;
    float _971 = abs(_967);
    float _973 = abs(_969);
    float _975 = precise::max(_971, _973);
    bool _977 = _975 >= 16.0;
    float _979 = _969;
    float _981 = _967;
    int _983 = as_type<int>(_963);
    float _985 = _867;
    if (_977)
    {
        float _987 = _969 * 0.0625;
        _979 = _987;
    }
    float _989 = _979;
    if (_977)
    {
        float _991 = _967 * 0.0625;
        _981 = _991;
    }
    float _993 = _981;
    float _995 = abs(_989);
    bool _997 = _995 != 0.0;
    bool _999 = isnan(_995);
    bool _1001 = _997 || _999;
    bool _1003 = isnan(0.0);
    bool _1005 = _1001 || _1003;
    float _1007 = abs(_993);
    bool _1009 = _1007 == 0.0;
    float _1011 = abs(_993);
    bool _1013 = _1011 == 0.0;
    bool _1015 = !_1005;
    bool _1017 = _1013 && _1015;
    if (_1017)
    {
        bool _1019 = as_type<int>(_993) >= 0;
        _741 = _1019;
    }
    bool _1021 = _741;
    int _1023 = _1021 ? (-1) : 0;
    if (_1017)
    {
        int _1025 = _1021 ? 0 : 1078530011;
        _983 = _1025;
    }
    int _1027 = _983;
    int _1029 = _1027;
    if (_1017)
    {
        int _1031 = int(0x80000000) & as_type<int>(_989);
        int _1033 = _1027 | _1031;
        _985 = as_type<float>(_1033);
    }
    float _1035 = _985;
    bool _1037 = !_1005;
    bool _1039 = _1037 && _1009;
    float _1041 = _1035;
    float _1043 = _1035;
    if (!_1039)
    {
        float _1045 = abs(_989);
        bool _1047 = _1045 != as_type<float>(0x7f800000u /* inf */);
        bool _1049 = isnan(_1045);
        bool _1051 = _1047 || _1049;
        bool _1053 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1055 = _1051 || _1053;
        float _1057 = abs(_993);
        bool _1059 = _1057 == as_type<float>(0x7f800000u /* inf */);
        float _1061 = abs(_993);
        bool _1063 = _1061 == as_type<float>(0x7f800000u /* inf */);
        bool _1065 = !_1055;
        bool _1067 = _1063 && _1065;
        if (_1067)
        {
            bool _1069 = as_type<int>(_993) >= 0;
            _1023 = _1069 ? (-1) : 0;
        }
        int _1071 = _1023;
        if (_1067)
        {
            _1029 = 1075235812;
        }
        int _1073 = _1029;
        int _1075 = _1073;
        if (_1067)
        {
            int _1077 = ~_1071;
            int _1079 = (_1077 != 0) ? _1073 : 1061752795;
            _1075 = _1079;
        }
        int _1081 = _1075;
        if (_1067)
        {
            int _1083 = int(0x80000000) & as_type<int>(_989);
            int _1085 = _1081 | _1083;
            _1041 = as_type<float>(_1085);
        }
        float _1087 = _1041;
        bool _1089 = !_1055;
        bool _1091 = _1089 && _1059;
        _1043 = _1087;
        if (!_1091)
        {
            float _1093 = abs(_989);
            float _1095 = abs(_993);
            float _1097 = precise::max(_1093, _1095);
            float _1099 = abs(_989);
            float _1101 = abs(_993);
            float _1103 = precise::min(_1099, _1101);
            float _1105 = 1.0 / _1097;
            float _1107 = abs(_989);
            float _1109 = abs(_993);
            bool _1111 = _1107 > _1109;
            bool _1113 = as_type<int>(_993) >= 0;
            float _1115 = _1103 * _1105;
            float _1117 = abs(_989);
            float _1119 = abs(_993);
            float _1121 = _1117 + _1119;
            int _1123 = as_type<int>(_989) & int(0x80000000);
            float _1125 = _1115 * _1115;
            bool _1127 = _1121 > as_type<float>(0x7f800000u /* inf */);
            bool _1129 = isnan(_1121);
            bool _1131 = _1127 || _1129;
            bool _1133 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1135 = _1131 || _1133;
            float _1137 = _1125 + 11.33538818359375;
            float _1139 = fma(_1125, _1137, 28.84246826171875);
            float _1141 = fma(_1125, _1139, 19.6966705322265625);
            float _1143 = fma(_1125, -0.82336294651031494140625, -5.674867153167724609375);
            float _1145 = fma(_1125, _1143, -6.565555095672607421875);
            float _1147 = 1.0 / _1141;
            float _1149 = _1125 * _1145;
            float _1151 = _1115 * _1149;
            float _1153 = fma(_1151, _1147, _1115);
            float _1155 = _1153;
            _1043 = _1121;
            if (_1111)
            {
                float _1157 = -_1153;
                float _1159 = _1157 + 1.57079637050628662109375;
                _1155 = _1159;
            }
            float _1161 = _1155;
            int _1163 = as_type<int>(_1161);
            if (!_1113)
            {
                float _1165 = -_1161;
                float _1167 = _1165 + 3.1415927410125732421875;
                _1163 = as_type<int>(_1167);
            }
            int _1169 = _1163;
            if (!_1135)
            {
                int _1171 = _1123 | _1169;
                _1043 = as_type<float>(_1171);
            }
        }
    }
    float _1173 = _1043;
    float _1175 = _1173 + 1.57079637050628662109375;
    float _1177 = _757 * _885;
    float _1179 = _515 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1181 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1183 = _1175 * 0.15915493667125701904296875;
    float _1185 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1187 = _1177 * _1179;
    float _1189 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _1191 = _1183 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = _1177 * _1185;
    float _1197 = _1181 * _1187;
    float _1199 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1201 = _1199 * 0.5;
    float _1203 = _879 * _927;
    float _1205 = _1189 * _1195;
    float _1207 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1209 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1211 = _1183 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = _1197 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1217 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1207);
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1209);
    float _1221 = _881 * _927;
    float _1223 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1215);
    float _1225 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1217);
    float _1227 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1219);
    float _1229 = -_1193;
    float _1231 = _1229 + 1.0;
    float _1233 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1223);
    float _1235 = _883 * _927;
    float _1237 = _1225 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1239 = _1203 * _1231;
    float _1241 = _1221 * _1221;
    float _1243 = _1235 * _1231;
    float _1245 = _1227 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1247 = _1221 * _1213;
    float _1249 = _1203 * _1213;
    float _1251 = fma(_1203, _1239, _1193);
    float _1253 = _1235 * _1213;
    float _1255 = -_1247;
    float _1257 = fma(_1235, _1239, _1255);
    float _1259 = fma(_1221, _1243, _1249);
    float _1261 = fma(_1231, _1241, _1193);
    float _1263 = -_1253;
    float _1265 = fma(_1221, _1239, _1263);
    float _1267 = _1237 * _1257;
    float _1269 = _1237 * _1259;
    float _1271 = fma(_1235, _1239, _1247);
    float _1273 = fma(_1245, _1251, _1267);
    float _1275 = _1233 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1277 = fma(_1221, _1239, _1253);
    float _1279 = fma(_1245, _1265, _1269);
    float _1281 = fma(_1275, _1277, _1273);
    float _1283 = fma(_1275, _1261, _1279);
    float _1285 = fma(_1235, _1243, _1193);
    float _1287 = -_1249;
    float _1289 = fma(_1221, _1243, _1287);
    float _1291 = _635 + _1281;
    float _1293 = _661 + _1283;
    float _1295 = _1237 * _1285;
    float _1297 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1299 = _1291 + _1297;
    float _1301 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1303 = _1293 + _1301;
    float _1305 = fma(_1245, _1271, _1295);
    float _1307 = _1299 * _1299;
    float _1309 = _1303 * _1303;
    float _1311 = fma(_1275, _1289, _1305);
    float _1313 = _1307 + _1309;
    float _1315 = _575 + _1311;
    float _1317 = sqrt(_1313);
    bool _1319 = _1317 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1321 = _1295;
    float _1323 = _1193;
    float _1325 = _1235;
    float _1327 = _1221;
    float _1329 = _1311;
    if (!_1319)
    {
        _1321 = _1309;
    }
    float _1331 = _1321;
    float _1333 = _1331;
    if (!_1319)
    {
        _1323 = _1307;
    }
    float _1335 = _1323;
    float _1337 = _1335;
    if (!_1319)
    {
        _1325 = _1291;
    }
    float _1339 = _1325;
    float _1341 = _1339;
    if (!_1319)
    {
        _1327 = _1293;
    }
    float _1343 = _1327;
    float _1345 = _1343;
    if (!_1319)
    {
        _1329 = _1315;
    }
    float _1347 = _1329;
    bool _1349 = !_1319;
    float _1351 = _1347;
    if (!_1349)
    {
        float _1353 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1355 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1357 = _1317 + _1355;
        float _1359 = _1315 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1361 = rsqrt(_1313);
        float _1363 = _1357 * _1353;
        float _1365 = _1363 * 0.15915493667125701904296875;
        float _1367 = _1365 * 6.283185482025146484375;
        float _1369 = sin(_1367);
        float _1371 = _1365 * 6.283185482025146484375;
        float _1373 = cos(_1371);
        float _1375 = fma(_1369, _1359, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1377 = _1361 * _1375;
        float _1379 = _1373 + (-1.0);
        float _1381 = fma(_1299, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1383 = fma(_1303, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1385 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1389 = _1381 + _1387;
        float _1391 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1393 = _1383 + _1391;
        float _1395 = fma(_1315, _1373, _1385);
        float _1397 = _1389 * _1389;
        float _1399 = _1393 * _1393;
        _1351 = _1395;
        _1337 = _1397;
        _1333 = _1399;
        _1341 = _1381;
        _1345 = _1383;
    }
    float _1401 = _1351;
    float _1403 = _1337;
    float _1405 = _1333;
    float _1407 = _1341;
    float _1409 = _1345;
    float _1411 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1413 = _1401 + _1411;
    out.m_48.x = _771;
    out.m_48.y = _773;
    out.m_48.z = _769;
    out.m_48.w = _755;
    float _1415 = fma(_1413, _1413, _1403);
    out.m_50.x = _783;
    out.m_50.y = _785;
    out.m_50.z = _787;
    out.m_50.w = _763;
    float _1417 = _1415 + _1405;
    float _1419 = sqrt(_1417);
    bool _1421 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1423 = isnan(_1419);
    bool _1425 = _1421 || _1423;
    bool _1427 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1429 = _1425 || _1427;
    float _1431 = _1403;
    float _1433 = _1409;
    if (!_1429)
    {
        _1431 = 1.0;
    }
    float _1435 = _1431;
    bool _1437 = !_1429;
    float _1439 = _1435;
    if (!_1437)
    {
        bool _1441 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1443 = isnan(_1419);
        bool _1445 = _1441 || _1443;
        bool _1447 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1449 = _1445 || _1447;
        if (!_1449)
        {
            float _1451 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1453 = _1419 + _1451;
            float _1455 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1457 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1455;
            float _1459 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1461 = _1459 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1463 = 1.0 / _1457;
            float _1465 = _1453 * _1463;
            float _1467 = fma(_1465, _1461, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1439 = _1467;
            _1469 = true;
        }
        else
        {
            bool _1471 = _1419 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1473 = isnan(_1419);
            bool _1475 = _1471 || _1473;
            bool _1477 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1479 = _1475 || _1477;
            if (!_1479)
            {
                float _1481 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1483 = _1419 + _1481;
                float _1485 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1487 = _1485 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1489 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1491 = _1489 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1493 = 1.0 / _1487;
                float _1495 = _1483 * _1493;
                float _1497 = fma(_1495, _1491, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1439 = _1497;
                _1469 = true;
            }
            else
            {
                _1439 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1469 = false;
    float _1499 = _1439;
    float _1501 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1503 = _1401 + _1501;
    float _1505 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1507 = _1407 + _1505;
    float _1509 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1511 = _1409 + _1509;
    float _1513 = fma(_1503, _1499, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1515 = fma(_1507, _1499, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1517 = fma(_1511, _1499, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1519 = -_575;
    float _1521 = _1519 + _1513;
    float _1523 = -_635;
    float _1525 = _1523 + _1515;
    float _1527 = -_661;
    float _1529 = _1527 + _1517;
    float _1531 = _1521 * _1521;
    float _1533 = fma(_1525, _1525, _1531);
    float _1535 = fma(_1529, _1529, _1533);
    float _1537 = sqrt(_1535);
    bool _1539 = _1537 > 0.0;
    bool _1541 = !_1539;
    float _1543 = _1507;
    float _1545 = _1515;
    float _1547 = _1517;
    float _1549 = _1513;
    if (!_1541)
    {
        bool _1551 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1553 = _1537;
        if (_1551)
        {
            float _1555 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1553 = _1555;
        }
        float _1557 = _1553;
        float _1559 = _1557;
        if (_1551)
        {
            float _1561 = _395 * _1557;
            _1543 = _1561;
        }
        float _1563 = _1543;
        float _1565 = _1563;
        if (_1551)
        {
            float _1567 = _397 * _1557;
            _1433 = _1567;
        }
        float _1569 = _1433;
        float _1571 = _1569;
        float _1573 = _1569;
        if (_1551)
        {
            float _1575 = _399 * _1557;
            _1559 = _1575;
        }
        float _1577 = _1559;
        float _1579 = _1577;
        if (!_1551)
        {
            float _1581 = _107 + 1.0;
            float _1583 = _1581;
            if (!_141)
            {
                float _1585 = _1581 * _1581;
                float _1587 = _1585 * 0.5;
                _1571 = _1587;
            }
            float _1589 = _1571;
            float _1591 = _1589;
            if (!_141)
            {
                float _1593 = _1589 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1591 = _1593;
            }
            float _1595 = _1591;
            bool _1597 = !_141;
            float _1599 = _1595;
            if (!_1597)
            {
                float _1601 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1603 = log2(_1601);
                float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1607 = _1605 + 1.0;
                float _1609 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1611 = _1603 * _1581;
                float _1613 = exp2(_1611);
                float _1615 = _1609 * 0.693147182464599609375;
                float _1617 = 1.0 / _1615;
                float _1619 = 1.0 / _1607;
                float _1621 = _1613 + (-1.0);
                float _1623 = -_1621;
                float _1625 = fma(_1623, _1617, _1581);
                float _1627 = _1625 * _1619;
                float _1629 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1599 = _1629;
            }
            float _1631 = _1599;
            float _1633 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1635 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1637 = !_141;
            if (!_1637)
            {
                float _1639 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1641 = log2(_1639);
                float _1643 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1645 = _1643 + 1.0;
                float _1647 = 1.0 / _1645;
                float _1649 = _1641 * _1581;
                float _1651 = exp2(_1649);
                float _1653 = -_1651;
                float _1655 = _1653 + 1.0;
                float _1657 = _1655 * _1647;
                _1583 = _1657;
            }
            float _1659 = _1583;
            float _1661 = fma(_1659, _145, _1635);
            float _1663 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1665 = fma(_1659, _143, _1633);
            float _1667 = -_357;
            float _1669 = _1667 + _1661;
            float _1671 = fma(_1659, _147, _1663);
            float _1673 = -_359;
            float _1675 = _1673 + _1665;
            float _1677 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1679 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1681 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1683 = -_361;
            float _1685 = _1683 + _1671;
            float _1687 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1677);
            float _1689 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1679);
            float _1691 = fma(_1675, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1681);
            float _1693 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1687);
            float _1695 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1689);
            float _1697 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1691);
            _403 = _1695;
            _405 = _1693;
            _407 = _1697;
            _1565 = _1693;
            _1573 = _1695;
            _1579 = _1697;
        }
        float _1699 = _403;
        float _1701 = _405;
        float _1703 = _407;
        float _1705 = _1565;
        float _1707 = _1573;
        float _1709 = _1579;
        float _1711 = _1699 * _1699;
        float _1713 = rsqrt(_1535);
        float _1715 = fma(_1701, _1701, _1711);
        float _1717 = fma(_1703, _1703, _1715);
        float _1719 = sqrt(_1717);
        float _1721 = _1521 * _1713;
        float _1723 = _1525 * _1713;
        float _1725 = _1529 * _1713;
        bool _1727 = _1719 > 0.0;
        bool _1729 = !_1727;
        if (!_1729)
        {
            float _1731 = rsqrt(_1717);
            float _1733 = _1731 * _1699;
            float _1735 = _1731 * _1701;
            float _1737 = _1731 * _1703;
            float _1739 = _1721 * _1733;
            float _1741 = fma(_1723, _1735, _1739);
            float _1743 = fma(_1725, _1737, _1741);
            float _1745 = _1743 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1747 = fma(_1705, _1745, _1515);
            float _1749 = fma(_1707, _1745, _1513);
            float _1751 = fma(_1709, _1745, _1517);
            _1545 = _1747;
            _1547 = _1751;
            _1549 = _1749;
        }
    }
    float _1753 = _1545;
    float _1755 = _1547;
    float _1757 = _1549;
    float _1759 = _793 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1761 = -_789;
    float _1763 = fma(_1761, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1753);
    float _1765 = -_795;
    float _1767 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1755);
    float _1769 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1759);
    bool _1771 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1775 = _1771 || _1773;
    bool _1777 = isnan(0.5);
    bool _1779 = _1775 || _1777;
    float _1781 = -_775;
    float _1783 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1757);
    float _1785 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1769);
    float _1787 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1789 = _793 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1791 = 1.0 / _1787;
    float _1793 = fma(_799, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1789);
    float _1795 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1793);
    float _1797 = _1793;
    float _1799 = _1795;
    float _1801 = _1783;
    if (_1779)
    {
        _1797 = _1763;
    }
    float _1803 = _1797;
    float _1805 = _1795 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1807 = _1803;
    if (_1779)
    {
        _1799 = _1767;
    }
    float _1809 = _1799;
    float _1811 = _1809;
    if (!_1779)
    {
        float _1813 = _803 * _803;
        float _1815 = 1.0 / _1177;
        float _1817 = -_661;
        float _1819 = _1817 + _1755;
        float _1821 = fma(_811, _811, _1813);
        float _1823 = fma(_817, _817, _1821);
        float _1825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1827 = sqrt(_1823);
        float _1829 = precise::min(_1827, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1831 = _1829 * _1825;
        float _1833 = -_635;
        float _1835 = _1833 + _1753;
        float _1837 = _1831 * _1815;
        float _1839 = -_575;
        float _1841 = _1839 + _1757;
        float _1843 = fma(_1835, _1837, _799);
        float _1845 = fma(_1841, _1837, _793);
        float _1847 = fma(_1819, _1837, _807);
        _1801 = _1845;
        _1807 = _1843;
        _1811 = _1847;
    }
    float _1849 = _1801;
    float _1851 = _1807;
    float _1853 = _1811;
    float _1855 = _1805 + _1787;
    float _1857 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1859 = _1855 * _1791;
    float _1861 = _1859 * 0.5;
    float _1863 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1865 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1857);
    bool _1867 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1869 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(0.5);
    bool _1875 = _1871 || _1873;
    float _1877 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1879 = fma(_1861, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1877);
    float _1881 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1863);
    float _1883 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1865);
    float _1885 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1887 = _1849 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1889 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1881);
    float _1891 = 1.0 / _1879;
    float _1893 = _1883 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1895 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1885);
    float _1897 = _1889 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1899 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1887);
    float _1901 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1903 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1905 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1907 = _1893 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1909 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1895);
    float _1911 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1901);
    float _1913 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1903);
    float _1915 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1905);
    float _1917 = fma(_1897, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1907);
    float _1919 = _1901;
    float _1921 = _1897;
    if (_1875)
    {
        _1919 = 1.0;
    }
    float _1923 = _1919;
    float _1925 = fma(_1853, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1899);
    float _1927 = _1923;
    if (_1875)
    {
        _1921 = 1.0;
    }
    float _1929 = _1921;
    float _1931 = _1909 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1935 = _1891 * _1933;
    float _1937 = _1929;
    if (!_1875)
    {
        float _1939 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1941 = _1939 * 0.15915493667125701904296875;
        float _1943 = _1941 * 6.283185482025146484375;
        float _1945 = cos(_1943);
        float _1947 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1949 = _1947 * 0.15915493667125701904296875;
        float _1951 = _1941 * 6.283185482025146484375;
        float _1953 = sin(_1951);
        float _1955 = 1.0 / _1945;
        float _1957 = _1949 * 6.283185482025146484375;
        float _1959 = cos(_1957);
        float _1961 = _1953 * _1955;
        float _1963 = _1949 * 6.283185482025146484375;
        float _1965 = sin(_1963);
        float _1967 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1969 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1967;
        float _1971 = _1959 * _1961;
        float _1973 = 1.0 / _1969;
        float _1975 = 1.0 / _1971;
        float _1977 = _1965 * _1975;
        float _1979 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1981 = fma(_1935, _1977, _1979);
        float _1983 = _1981 * _1973;
        float _1985 = precise::clamp(_1983, 0.0, 1.0);
        _1927 = _1985;
    }
    float _1987 = _1927;
    if (!_1875)
    {
        float _1989 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1991 = _1989 * 0.15915493667125701904296875;
        float _1993 = _1991 * 6.283185482025146484375;
        float _1995 = cos(_1993);
        float _1997 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1999 = _1997 * 0.15915493667125701904296875;
        float _2001 = _1991 * 6.283185482025146484375;
        float _2003 = sin(_2001);
        float _2005 = 1.0 / _1995;
        float _2007 = _1999 * 6.283185482025146484375;
        float _2009 = cos(_2007);
        float _2011 = _2003 * _2005;
        float _2013 = _1999 * 6.283185482025146484375;
        float _2015 = sin(_2013);
        float _2017 = _2009 * _2011;
        float _2019 = 1.0 / _2017;
        float _2021 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2023 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2021;
        float _2025 = 1.0 / _2023;
        float _2027 = _2015 * _2019;
        float _2029 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2031 = fma(_1935, _2027, _2029);
        float _2033 = _2031 * _2025;
        float _2035 = precise::clamp(_2033, 0.0, 1.0);
        float _2037 = -_2035;
        float _2039 = _2037 + 1.0;
        _1937 = _2039;
    }
    float _2041 = _1937;
    float _2043 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2045 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1915);
    float _2047 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1917);
    bool _2049 = _1987 > 0.0;
    bool _2051 = isnan(_1987);
    bool _2053 = _2049 || _2051;
    bool _2055 = isnan(0.0);
    bool _2057 = _2053 || _2055;
    float _2059 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1911);
    float _2061 = _1987 * _2041;
    float _2063 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2045);
    float _2065 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2047);
    bool _2067 = _2041 <= 0.0;
    bool _2069 = !_2057;
    bool _2071 = _2067 || _2069;
    float _2073 = fma(_1931, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1913);
    float _2075 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2059);
    float _2077 = _2063 + _2065;
    float _2079 = _2061 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2081 = fma(_2043, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2073);
    float _2083 = _2077 * 0.5;
    float _2085 = _2079 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_52.x = _1851;
    out.m_52.y = _1849;
    out.m_52.z = _1853;
    out.gl_Position.x = _2075;
    out.gl_Position.y = _2081;
    out.gl_Position.z = _2063;
    out.gl_Position.w = _2065;
    out.m_54.z = _2083;
    out.m_54.w = _2065;
    out.m_35.x = _2085;
    if (!_2071)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_35.x = 0.0;
    float _2087 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2087;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

