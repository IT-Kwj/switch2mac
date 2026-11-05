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
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_50 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_32 [[attribute(2)]];
    float4 m_37 [[attribute(3)]];
    float4 m_39 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1438 = false;
    bool _769 = false;
    bool _617 = false;
    bool _371 = false;
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
        float _1691 = as_type<float>(_87);
        out.gl_Position.z = _1691;
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
        float _1760 = as_type<float>(_123);
        out.gl_Position.z = _1760;
    }
    if (_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_39.x;
    float _127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _129 = _105 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = _129 * _127;
    float _147 = 0.0;
    float _149 = _133;
    if (!_143)
    {
        float _151 = _133 * _133;
        float _153 = _151 * 0.5;
        _147 = _153;
    }
    float _155 = _147;
    float _157 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    float _159 = _155;
    if (!_143)
    {
        float _161 = _155 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    float _165 = in.m_37.x;
    float _167 = in.m_37.y;
    float _169 = in.m_37.z;
    float _171 = _157 * 6.283185482025146484375;
    float _173 = floor(_157);
    int _175 = as_type<int>(_131) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_131) & 2;
    bool _181 = _179 != 0;
    float _183 = _171 * 0.15915493667125701904296875;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _183 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_177;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = -_173;
    float _199 = _157 + _197;
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_143;
    float _207 = _163;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _133 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _133);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_143;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _133 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _149 = _261;
    }
    float _263 = _149;
    float _265 = in.m_44.w;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _269 = _267 != 0;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _273 = _271 != 0;
    float _275 = fma(_191, 0.5, 0.5);
    bool _277 = _199 < 0.5;
    float _279 = float(_277);
    float _281 = -_199;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = in.m_32.x;
    float _287 = in.m_32.y;
    float _289 = in.m_32.z;
    bool _291 = !_269;
    int _293 = _291 ? 0 : 1;
    float _295 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _297 = !_187;
    int _299 = _297 ? 0 : 1;
    float _301 = -_279;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = -_275;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _309 = abs(_293);
    float _311 = fma(_263, _165, _295);
    int _313 = abs(_299);
    float _315 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _317 = !_273;
    int _319 = _317 ? 0 : 1;
    float _321 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _325 = abs(_319);
    float _327 = fma(_263, _167, _315);
    float _329 = float(_309);
    float _331 = fma(_263, _169, _321);
    float _333 = float(_313);
    float _335 = abs(_283);
    float _337 = _329 * _335;
    float _339 = fma(_327, _265, _287);
    float _341 = fma(_331, _265, _289);
    float _343 = float(_325);
    float _345 = fma(_333, _307, _337);
    float _347 = fma(_311, _265, _285);
    float _349 = abs(_303);
    float _351 = fma(_343, _349, _345);
    bool _353 = !_323;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _357 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_71);
        float _375 = 1.0 / _373;
        float _377 = _105 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = _379 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _379 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _405 = 1.0 / _391;
    bool _407 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _409 = 1.0 / _399;
    float _411 = 1.0 / _403;
    float _413 = _383 * _405;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _417 = _379 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _421 = _379 + _419;
    float _423 = 1.0 / _395;
    float _425 = _417 * _409;
    bool _427 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _429 = isnan(_379);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    bool _439 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _441 = isnan(_379);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -_437;
    float _453 = _451 + 1.0;
    float _455 = _421 * _411;
    bool _457 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _459 = isnan(_379);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _469;
    float _473 = _467 * _453;
    float _475 = -_467;
    float _477 = _475 + 1.0;
    float _479 = _387 * _423;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _481;
    float _485 = fma(_471, _413, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _487 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _489 = isnan(_379);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _503 = fma(_483, _413, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _509 = -_449;
    float _511 = _509 + 1.0;
    float _513 = _449 * _477;
    float _515 = fma(_501, _479, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _517 = fma(_507, _479, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _519 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _521 = isnan(_379);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = _497 * _511;
    float _533 = -_497;
    float _535 = _533 + 1.0;
    float _537 = in.m_44.x;
    float _539 = in.m_44.y;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _541;
    float _545 = _529 * _535;
    float _547 = -_529;
    float _549 = _547 + 1.0;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _551;
    float _555 = fma(_543, _425, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _557 = _485 * _545;
    float _559 = _503 * _545;
    float _561 = fma(_553, _425, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _567 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[143].x, _557);
    float _569 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[143].y, _559);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _575 = fma(_565, _455, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _577 = fma(_515, _531, _567);
    float _579 = fma(_517, _531, _569);
    float _581 = fma(_573, _455, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _583 = fma(_561, _513, _577);
    float _585 = fma(_555, _513, _579);
    float _587 = fma(_581, _473, _583);
    float _589 = fma(_575, _473, _585);
    float _591 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[147].x, _587);
    float _593 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[147].y, _589);
    float _595 = _591 * _537;
    float _597 = _593 * _539;
    bool _599 = !_407;
    float _615;
    if (!_599)
    {
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _603 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_71);
        float _621 = 1.0 / _619;
        float _623 = _105 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _631 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _633 = isnan(_625);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _647 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _649 = isnan(_625);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = 1.0 / _629;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _661;
    float _665 = -_641;
    float _667 = _665 + 1.0;
    bool _669 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _671 = isnan(_625);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    bool _681 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _683 = _657 * _667;
    float _685 = -_657;
    float _687 = _685 + 1.0;
    float _689 = 1.0 / _645;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _695 = _663 * _659;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _699 = _625 + _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _625 + _701;
    float _705 = fma(_695, _699, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _707 = -_679;
    float _709 = _707 + 1.0;
    float _711 = _693 * _689;
    float _713 = _705 * _683;
    float _715 = _641 * _709;
    float _717 = fma(_711, _703, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _719 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[115].x, _713);
    float _721 = fma(_717, _715, _719);
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _725 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[117].x, _721);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _731 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _733 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _735 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _739 = _725 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _741 = _731 * _125;
    out.m_46.x = _735;
    out.m_46.y = _737;
    out.m_46.z = _733;
    out.m_46.w = _739;
    float _743 = trunc(_741);
    int _745 = int(_743);
    int _747 = _745 << 4;
    int _749 = _747 + 1968;
    bool _751 = !_681;
    float _767;
    if (!_751)
    {
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _755 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _759 = _757 * _753;
        float _761 = floor(_759);
        float _763 = -_761;
        float _765 = _759 + _763;
        _767 = _765;
        _769 = true;
    }
    else
    {
        float _771 = float(_71);
        float _773 = 1.0 / _771;
        float _775 = _105 * _773;
        _767 = _775;
    }
    _769 = false;
    float _777 = _767;
    float _779 = in.m_39.z;
    float _781 = _339 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _783 = _339 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _785 = _339 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _787 = in.m_39.w;
    float _789 = _339 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _791 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[14].x, _781);
    float _793 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[14].y, _783);
    float _795 = in.m_39.y;
    float _797 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[14].z, _785);
    float _799 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[14].w, _789);
    float _801 = _125 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _803 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[16].y, _793);
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _807 = _805 != 0;
    float _809 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[16].x, _791);
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _813 = _811 != 0;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _819 = _817 != 0;
    float _821 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[16].z, _797);
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _825 = _823 != 0;
    float _827 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[16].w, _799);
    float _829 = _821 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    bool _831 = _779 > 0.5;
    float _833 = _827 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _835 = _351 * _595;
    bool _837 = _787 > 0.5;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _841 = _125 > 0.5;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _845 = -_839;
    float _847 = fma(_801, 2.0, _845);
    float _849 = _795 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _851 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[78].z, _843);
    float _853 = fma(_849, -2.0, _815);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _859 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _861 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _863 = 1.0 / _857;
    float _865 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _859);
    float _867 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _861);
    float _869 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _853);
    float _871 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _865);
    float _873 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _875;
    float _879 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _873);
    float _881 = sqrt(_871);
    float _883 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _867);
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _887 = _877 * _863;
    float _889 = _809 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _891 = -_195;
    int _893 = _841 ? as_type<int>(_891) : as_type<int>(_195);
    float _895 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[78].w, _885);
    float _897 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _879);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _901 = _777 + _899;
    bool _903 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _905 = isnan(_777);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = sqrt(_883);
    bool _917 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _919 = isnan(_777);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = fma(_887, _901, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _931 = _795 > 0.5;
    uint _934 = uint(int(uint(_749) >> uint(2)));
    uint _936 = uint(int(uint(int(_934)) >> uint(2)));
    int _938 = int(_934) & 3;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[int(_936)][_938];
    int _942 = int(_934) + 1;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    int _946 = _942 & 3;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[int(_944)][_946];
    float _950 = -_913;
    float _952 = _950 + 1.0;
    float _954 = _881 * _889;
    float _956 = -_105;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[76].x, _847);
    float _960 = sqrt(_897);
    float _962 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _851);
    float _964 = _803 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _966 = _927 * _952;
    float _968 = -_927;
    float _970 = _968 + 1.0;
    float _972 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _895);
    bool _974 = !_807;
    float _976 = _974 ? _195 : as_type<float>(_893);
    float _978 = _929 * _966;
    float _980 = _915 * _964;
    float _982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _984 = -_962;
    float _986 = _984 + 1.0;
    float _988 = -_972;
    float _990 = _988 + 1.0;
    float _992 = _980 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _994 = _980 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _996 = _980 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _998 = _749 + 8;
    uint _1000 = uint(int(uint(_998) >> uint(2)));
    uint _1002 = uint(int(uint(int(_1000)) >> uint(2)));
    int _1004 = int(_1000) & 3;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[int(_1002)][_1004];
    float _1008 = _960 * _829;
    float _1010 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[25].x, _992);
    float _1012 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _994);
    float _1014 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[26].x, _996);
    float _1016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1018 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1020 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[131].x, _978);
    float _1022 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1012);
    float _1024 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1014);
    float _1026 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1018);
    float _1028 = -_203;
    int _1030 = _931 ? as_type<int>(_1028) : as_type<int>(_203);
    float _1032 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1022);
    float _1034 = _982 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1036 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1038 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1024);
    float _1040 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    bool _1042 = !_813;
    float _1044 = _1042 ? _203 : as_type<float>(_1030);
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1048 = _1036 + _1046;
    float _1050 = _976 + 0.5;
    float _1052 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1056 = _1040 + _1054;
    float _1058 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1060 = fma(_1034, _1050, _958);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1064 = _1052 + _1062;
    float _1066 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1020);
    float _1068 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1058);
    float _1070 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1072 = _940 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1074 = -_195;
    int _1076 = _831 ? as_type<int>(_1074) : as_type<int>(_195);
    float _1078 = _1044 + (-0.5);
    float _1080 = _948 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1082 = _1048 * _1048;
    float _1084 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1068);
    bool _1086 = !_819;
    float _1088 = _1086 ? _195 : as_type<float>(_1076);
    float _1090 = -_1070;
    float _1092 = -_869;
    float _1094 = fma(_1090, _1078, _1092);
    float _1096 = -_986;
    float _1098 = fma(_976, _1096, _1060);
    float _1100 = fma(_1056, _1056, _1082);
    float _1102 = -_203;
    int _1104 = _837 ? as_type<int>(_1102) : as_type<int>(_203);
    float _1106 = _1088 + 0.5;
    bool _1108 = _1084 >= 0.0;
    float _1110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1112 = fma(_1044, _990, _1094);
    float _1114 = fma(_1064, _1064, _1100);
    bool _1116 = !_825;
    float _1118 = _1116 ? _203 : as_type<float>(_1104);
    float _1120 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1122 = _835 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1124 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1126 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1130 = -_1118;
    float _1132 = _1130 + 0.5;
    float _1134 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1138 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1142 = _1132;
    int _1144 = as_type<int>(_1072);
    if (_1108)
    {
        _1142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1146 = _1142;
    float _1148 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1150 = rsqrt(_1114);
    float _1152 = _1140 * _1110;
    if (_1108)
    {
        out.m_35.x = 0.0;
    }
    if (_1108)
    {
        float _1154 = _1146 * 5.0;
        _1144 = as_type<int>(_1154);
    }
    int _1156 = _1144;
    out.m_48.x = _1134;
    out.m_48.y = _1124;
    out.m_48.z = _1138;
    out.m_48.w = _1148;
    float _1158 = _1120 * _1128;
    float _1160 = _1158;
    if (_1108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3487 = as_type<float>(_1156);
        out.gl_Position.z = _3487;
    }
    out.m_50.x = _1098;
    out.m_50.y = _1112;
    out.m_50.z = _1158;
    out.m_50.w = _1152;
    float _1162 = _1136 * _1150;
    float _1164 = _1056 * _1162;
    float _1166 = _1048 * _1162;
    if (_1108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1168 = -_1166;
    float _1170 = _1036 + _1168;
    float _1172 = _1064 * _1162;
    float _1174 = -_1164;
    float _1176 = _1040 + _1174;
    float _1178 = -_1166;
    float _1180 = _1048 + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1184 = _1170 + _1182;
    float _1186 = -_1172;
    float _1188 = _1052 + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1192 = _1176 + _1190;
    float _1194 = -_1164;
    float _1196 = _1056 + _1194;
    float _1198 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1202 = _1188 + _1200;
    float _1204 = _1180 * _1180;
    float _1206 = -_1172;
    float _1208 = _1064 + _1206;
    float _1210 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1198);
    float _1212 = _351 * _597;
    float _1214 = fma(_1196, _1196, _1204);
    float _1216 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1210);
    float _1218 = fma(_1208, _1208, _1214);
    bool _1220 = _1216 >= 0.0;
    float _1222 = sqrt(_1218);
    if (_1220)
    {
        _1160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1224 = _1160;
    int _1226 = as_type<int>(_1224);
    if (_1220)
    {
        out.m_35.x = 0.0;
    }
    if (_1220)
    {
        float _1228 = _1224 * 5.0;
        _1226 = as_type<int>(_1228);
    }
    int _1230 = _1226;
    float _1232 = _1150 * _1222;
    if (_1220)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3621 = as_type<float>(_1230);
        out.gl_Position.z = _3621;
    }
    if (_1220)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1234 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1238 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1240 = _1122 * _1232;
    float _1242 = _1232 * _1234;
    float _1244 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1246 = _1244 * 0.5;
    float _1248 = _1238 * _1240;
    float _1250 = _1236 * _1242;
    float _1252 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1254 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1256 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1258 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1252);
    float _1260 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1254);
    float _1262 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1256);
    float _1264 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1258);
    float _1266 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1260);
    float _1268 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1262);
    float _1270 = _1264 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1272 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1274 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1276 = _1040 + _1270;
    float _1278 = _1052 + _1272;
    float _1280 = _1036 + _1274;
    float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1284 = _1276 + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1288 = _1278 + _1286;
    float _1290 = _1284 * _1284;
    float _1292 = _1288 * _1288;
    float _1294 = _1290 + _1292;
    float _1296 = sqrt(_1294);
    bool _1298 = _1296 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1300 = _1248;
    float _1302 = _1274;
    float _1304 = _1246;
    float _1306 = _1292;
    float _1308 = _1276;
    if (!_1298)
    {
        _1300 = _1290;
    }
    float _1310 = _1300;
    float _1312 = _1310;
    if (!_1298)
    {
        _1302 = _1278;
    }
    float _1314 = _1302;
    float _1316 = _1314;
    if (!_1298)
    {
        _1304 = _1280;
    }
    float _1318 = _1304;
    bool _1320 = !_1298;
    float _1322 = _1318;
    if (!_1320)
    {
        float _1324 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1326 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1328 = _1296 + _1326;
        float _1330 = _1280 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1332 = rsqrt(_1294);
        float _1334 = _1328 * _1324;
        float _1336 = _1334 * 0.15915493667125701904296875;
        float _1338 = _1336 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1336 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        float _1346 = fma(_1340, _1330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1348 = _1332 * _1346;
        float _1350 = _1344 + (-1.0);
        float _1352 = fma(_1284, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1354 = fma(_1288, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1356 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1360 = _1352 + _1358;
        float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1364 = _1354 + _1362;
        float _1366 = fma(_1280, _1344, _1356);
        float _1368 = _1360 * _1360;
        float _1370 = _1364 * _1364;
        _1322 = _1366;
        _1312 = _1368;
        _1306 = _1370;
        _1308 = _1352;
        _1316 = _1354;
    }
    float _1372 = _1322;
    float _1374 = _1312;
    float _1376 = _1306;
    float _1378 = _1308;
    float _1380 = _1316;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1384 = _1372 + _1382;
    float _1386 = fma(_1384, _1384, _1374);
    float _1388 = _1386 + _1376;
    float _1390 = sqrt(_1388);
    bool _1392 = _1390 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1394 = isnan(_1390);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1400 = _1396 || _1398;
    float _1402 = _1386;
    if (!_1400)
    {
        _1402 = 1.0;
    }
    float _1404 = _1402;
    bool _1406 = !_1400;
    float _1408 = _1404;
    if (!_1406)
    {
        bool _1410 = _1390 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1412 = isnan(_1390);
        bool _1414 = _1410 || _1412;
        bool _1416 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1418 = _1414 || _1416;
        if (!_1418)
        {
            float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1422 = _1390 + _1420;
            float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1426 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1424;
            float _1428 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1430 = _1428 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1432 = 1.0 / _1426;
            float _1434 = _1422 * _1432;
            float _1436 = fma(_1434, _1430, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1408 = _1436;
            _1438 = true;
        }
        else
        {
            bool _1440 = _1390 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1442 = isnan(_1390);
            bool _1444 = _1440 || _1442;
            bool _1446 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1448 = _1444 || _1446;
            if (!_1448)
            {
                float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1452 = _1390 + _1450;
                float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1456 = _1454 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1458 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1460 = _1458 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1462 = 1.0 / _1456;
                float _1464 = _1452 * _1462;
                float _1466 = fma(_1464, _1460, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1408 = _1466;
                _1438 = true;
            }
            else
            {
                _1408 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1438 = false;
    float _1468 = _1408;
    float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1472 = _1378 + _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1476 = _1380 + _1474;
    bool _1478 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan(0.5);
    bool _1486 = _1482 || _1484;
    float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1490 = _1372 + _1488;
    float _1492 = fma(_1472, _1468, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1494 = fma(_1476, _1468, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1496 = fma(_1490, _1468, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1498 = -_1164;
    float _1500 = _1498 + _1492;
    float _1502 = -_1172;
    float _1504 = _1502 + _1494;
    float _1506 = -_1166;
    float _1508 = _1506 + _1496;
    float _1510 = _1508;
    float _1512 = _1500;
    float _1514 = _1504;
    if (!_1486)
    {
        float _1516 = _1184 * _1184;
        float _1518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1520 = -_1052;
        float _1522 = _1520 + _1494;
        float _1524 = -_1036;
        float _1526 = _1524 + _1496;
        float _1528 = fma(_1192, _1192, _1516);
        float _1530 = fma(_1202, _1202, _1528);
        float _1532 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1534 = sqrt(_1530);
        float _1536 = 1.0 / _1232;
        float _1538 = precise::min(_1534, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1540 = _1538 * _1518;
        float _1542 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1544 = _1540 * _1536;
        float _1546 = -_1040;
        float _1548 = _1546 + _1492;
        float _1550 = _1542 * _1544;
        float _1552 = _1522 * _1544;
        float _1554 = fma(_1548, _1550, _1176);
        float _1556 = fma(_1526, _1550, _1170);
        float _1558 = fma(_1542, _1552, _1188);
        _1510 = _1556;
        _1512 = _1554;
        _1514 = _1558;
    }
    float _1560 = _1510;
    float _1562 = _1512;
    float _1564 = _1514;
    float _1566 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1568 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1570 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1572 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1574 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1566);
    float _1576 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1568);
    float _1578 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1570);
    float _1580 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1572);
    float _1582 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1574);
    float _1584 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1576);
    float _1586 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1578);
    float _1588 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1580);
    float _1590 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1592 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1594 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1596 = _1588 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1598 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1600 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1604 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1606 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1598);
    float _1608 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1600);
    float _1610 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1602);
    float _1612 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1604);
    float _1614 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1606);
    float _1616 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1608);
    float _1618 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1610);
    float _1620 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1612);
    float _1622 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1614);
    float _1624 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1616);
    float _1626 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1618);
    float _1628 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1620);
    float _1630 = _1622 + _1624;
    float _1632 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1634 = _1630 * 0.5;
    out.m_35.x = _1632;
    out.gl_Position.x = _1626;
    out.gl_Position.y = _1628;
    out.gl_Position.z = _1622;
    out.gl_Position.w = _1624;
    out.m_52.z = _1634;
    out.m_52.w = _1624;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1438 = false;
    bool _769 = false;
    bool _617 = false;
    bool _371 = false;
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
        float _1691 = as_type<float>(_87);
        out.gl_Position.z = _1691;
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
        float _1760 = as_type<float>(_123);
        out.gl_Position.z = _1760;
    }
    if (_115)
    {
        return out;
    }
    float _125 = in.m_39.x;
    float _127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _129 = _105 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = _129 * _127;
    float _147 = 0.0;
    float _149 = _133;
    if (!_143)
    {
        float _151 = _133 * _133;
        float _153 = _151 * 0.5;
        _147 = _153;
    }
    float _155 = _147;
    float _157 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    float _159 = _155;
    if (!_143)
    {
        float _161 = _155 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    float _165 = in.m_37.x;
    float _167 = in.m_37.y;
    float _169 = in.m_37.z;
    float _171 = _157 * 6.283185482025146484375;
    float _173 = floor(_157);
    int _175 = as_type<int>(_131) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_131) & 2;
    bool _181 = _179 != 0;
    float _183 = _171 * 0.15915493667125701904296875;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _183 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_177;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = -_173;
    float _199 = _157 + _197;
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_143;
    float _207 = _163;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _133 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _133);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_143;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _133 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _149 = _261;
    }
    float _263 = _149;
    float _265 = in.m_44.w;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _269 = _267 != 0;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _273 = _271 != 0;
    float _275 = fma(_191, 0.5, 0.5);
    bool _277 = _199 < 0.5;
    float _279 = float(_277);
    float _281 = -_199;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = in.m_32.x;
    float _287 = in.m_32.y;
    float _289 = in.m_32.z;
    bool _291 = !_269;
    int _293 = _291 ? 0 : 1;
    float _295 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _297 = !_187;
    int _299 = _297 ? 0 : 1;
    float _301 = -_279;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = -_275;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _309 = abs(_293);
    float _311 = fma(_263, _165, _295);
    int _313 = abs(_299);
    float _315 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _317 = !_273;
    int _319 = _317 ? 0 : 1;
    float _321 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _325 = abs(_319);
    float _327 = fma(_263, _167, _315);
    float _329 = float(_309);
    float _331 = fma(_263, _169, _321);
    float _333 = float(_313);
    float _335 = abs(_283);
    float _337 = _329 * _335;
    float _339 = fma(_327, _265, _287);
    float _341 = fma(_331, _265, _289);
    float _343 = float(_325);
    float _345 = fma(_333, _307, _337);
    float _347 = fma(_311, _265, _285);
    float _349 = abs(_303);
    float _351 = fma(_343, _349, _345);
    bool _353 = !_323;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _357 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_71);
        float _375 = 1.0 / _373;
        float _377 = _105 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = _379 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _379 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _405 = 1.0 / _391;
    bool _407 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _409 = 1.0 / _399;
    float _411 = 1.0 / _403;
    float _413 = _383 * _405;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _417 = _379 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _421 = _379 + _419;
    float _423 = 1.0 / _395;
    float _425 = _417 * _409;
    bool _427 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _429 = isnan(_379);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    bool _439 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _441 = isnan(_379);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -_437;
    float _453 = _451 + 1.0;
    float _455 = _421 * _411;
    bool _457 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _459 = isnan(_379);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _469;
    float _473 = _467 * _453;
    float _475 = -_467;
    float _477 = _475 + 1.0;
    float _479 = _387 * _423;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _481;
    float _485 = fma(_471, _413, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _487 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _489 = isnan(_379);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _503 = fma(_483, _413, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _509 = -_449;
    float _511 = _509 + 1.0;
    float _513 = _449 * _477;
    float _515 = fma(_501, _479, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _517 = fma(_507, _479, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _519 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _521 = isnan(_379);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = _497 * _511;
    float _533 = -_497;
    float _535 = _533 + 1.0;
    float _537 = in.m_44.x;
    float _539 = in.m_44.y;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _541;
    float _545 = _529 * _535;
    float _547 = -_529;
    float _549 = _547 + 1.0;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _551;
    float _555 = fma(_543, _425, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _557 = _485 * _545;
    float _559 = _503 * _545;
    float _561 = fma(_553, _425, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _567 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[143].x, _557);
    float _569 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[143].y, _559);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _575 = fma(_565, _455, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _577 = fma(_515, _531, _567);
    float _579 = fma(_517, _531, _569);
    float _581 = fma(_573, _455, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _583 = fma(_561, _513, _577);
    float _585 = fma(_555, _513, _579);
    float _587 = fma(_581, _473, _583);
    float _589 = fma(_575, _473, _585);
    float _591 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[147].x, _587);
    float _593 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[147].y, _589);
    float _595 = _591 * _537;
    float _597 = _593 * _539;
    bool _599 = !_407;
    float _615;
    if (!_599)
    {
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _603 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_71);
        float _621 = 1.0 / _619;
        float _623 = _105 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _631 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _633 = isnan(_625);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _647 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _649 = isnan(_625);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = 1.0 / _629;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _661;
    float _665 = -_641;
    float _667 = _665 + 1.0;
    bool _669 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _671 = isnan(_625);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    bool _681 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _683 = _657 * _667;
    float _685 = -_657;
    float _687 = _685 + 1.0;
    float _689 = 1.0 / _645;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _695 = _663 * _659;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _699 = _625 + _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _625 + _701;
    float _705 = fma(_695, _699, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _707 = -_679;
    float _709 = _707 + 1.0;
    float _711 = _693 * _689;
    float _713 = _705 * _683;
    float _715 = _641 * _709;
    float _717 = fma(_711, _703, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _719 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[115].x, _713);
    float _721 = fma(_717, _715, _719);
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _725 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[117].x, _721);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _731 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _733 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _735 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _739 = _725 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _741 = _731 * _125;
    out.m_46.x = _735;
    out.m_46.y = _737;
    out.m_46.z = _733;
    out.m_46.w = _739;
    float _743 = trunc(_741);
    int _745 = int(_743);
    int _747 = _745 << 4;
    int _749 = _747 + 1968;
    bool _751 = !_681;
    float _767;
    if (!_751)
    {
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _755 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _759 = _757 * _753;
        float _761 = floor(_759);
        float _763 = -_761;
        float _765 = _759 + _763;
        _767 = _765;
        _769 = true;
    }
    else
    {
        float _771 = float(_71);
        float _773 = 1.0 / _771;
        float _775 = _105 * _773;
        _767 = _775;
    }
    _769 = false;
    float _777 = _767;
    float _779 = in.m_39.z;
    float _781 = _339 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _783 = _339 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _785 = _339 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _787 = in.m_39.w;
    float _789 = _339 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _791 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[14].x, _781);
    float _793 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[14].y, _783);
    float _795 = in.m_39.y;
    float _797 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[14].z, _785);
    float _799 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[14].w, _789);
    float _801 = _125 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _803 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[16].y, _793);
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _807 = _805 != 0;
    float _809 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[16].x, _791);
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _813 = _811 != 0;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _819 = _817 != 0;
    float _821 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[16].z, _797);
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _825 = _823 != 0;
    float _827 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[16].w, _799);
    float _829 = _821 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    bool _831 = _779 > 0.5;
    float _833 = _827 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _835 = _351 * _595;
    bool _837 = _787 > 0.5;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _841 = _125 > 0.5;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _845 = -_839;
    float _847 = fma(_801, 2.0, _845);
    float _849 = _795 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _851 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[78].z, _843);
    float _853 = fma(_849, -2.0, _815);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _859 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _861 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _863 = 1.0 / _857;
    float _865 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _859);
    float _867 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _861);
    float _869 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _853);
    float _871 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _865);
    float _873 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _875;
    float _879 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _873);
    float _881 = sqrt(_871);
    float _883 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _867);
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _887 = _877 * _863;
    float _889 = _809 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _891 = -_195;
    int _893 = _841 ? as_type<int>(_891) : as_type<int>(_195);
    float _895 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[78].w, _885);
    float _897 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _879);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _901 = _777 + _899;
    bool _903 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _905 = isnan(_777);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = sqrt(_883);
    bool _917 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _919 = isnan(_777);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = fma(_887, _901, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _931 = _795 > 0.5;
    uint _934 = uint(int(uint(_749) >> uint(2)));
    uint _936 = uint(int(uint(int(_934)) >> uint(2)));
    int _938 = int(_934) & 3;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[int(_936)][_938];
    int _942 = int(_934) + 1;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    int _946 = _942 & 3;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[int(_944)][_946];
    float _950 = -_913;
    float _952 = _950 + 1.0;
    float _954 = _881 * _889;
    float _956 = -_105;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[76].x, _847);
    float _960 = sqrt(_897);
    float _962 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _851);
    float _964 = _803 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _966 = _927 * _952;
    float _968 = -_927;
    float _970 = _968 + 1.0;
    float _972 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _895);
    bool _974 = !_807;
    float _976 = _974 ? _195 : as_type<float>(_893);
    float _978 = _929 * _966;
    float _980 = _915 * _964;
    float _982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _984 = -_962;
    float _986 = _984 + 1.0;
    float _988 = -_972;
    float _990 = _988 + 1.0;
    float _992 = _980 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _994 = _980 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _996 = _980 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _998 = _749 + 8;
    uint _1000 = uint(int(uint(_998) >> uint(2)));
    uint _1002 = uint(int(uint(int(_1000)) >> uint(2)));
    int _1004 = int(_1000) & 3;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[int(_1002)][_1004];
    float _1008 = _960 * _829;
    float _1010 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[25].x, _992);
    float _1012 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _994);
    float _1014 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[26].x, _996);
    float _1016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1018 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1020 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[131].x, _978);
    float _1022 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1012);
    float _1024 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1014);
    float _1026 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1018);
    float _1028 = -_203;
    int _1030 = _931 ? as_type<int>(_1028) : as_type<int>(_203);
    float _1032 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1022);
    float _1034 = _982 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1036 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1038 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1024);
    float _1040 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    bool _1042 = !_813;
    float _1044 = _1042 ? _203 : as_type<float>(_1030);
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1048 = _1036 + _1046;
    float _1050 = _976 + 0.5;
    float _1052 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1056 = _1040 + _1054;
    float _1058 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1060 = fma(_1034, _1050, _958);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1064 = _1052 + _1062;
    float _1066 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1020);
    float _1068 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1058);
    float _1070 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1072 = _940 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1074 = -_195;
    int _1076 = _831 ? as_type<int>(_1074) : as_type<int>(_195);
    float _1078 = _1044 + (-0.5);
    float _1080 = _948 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1082 = _1048 * _1048;
    float _1084 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1068);
    bool _1086 = !_819;
    float _1088 = _1086 ? _195 : as_type<float>(_1076);
    float _1090 = -_1070;
    float _1092 = -_869;
    float _1094 = fma(_1090, _1078, _1092);
    float _1096 = -_986;
    float _1098 = fma(_976, _1096, _1060);
    float _1100 = fma(_1056, _1056, _1082);
    float _1102 = -_203;
    int _1104 = _837 ? as_type<int>(_1102) : as_type<int>(_203);
    float _1106 = _1088 + 0.5;
    bool _1108 = _1084 >= 0.0;
    float _1110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1112 = fma(_1044, _990, _1094);
    float _1114 = fma(_1064, _1064, _1100);
    bool _1116 = !_825;
    float _1118 = _1116 ? _203 : as_type<float>(_1104);
    float _1120 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1122 = _835 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1124 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1126 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1130 = -_1118;
    float _1132 = _1130 + 0.5;
    float _1134 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1138 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1142 = _1132;
    int _1144 = as_type<int>(_1072);
    if (_1108)
    {
        _1142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1146 = _1142;
    float _1148 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1150 = rsqrt(_1114);
    float _1152 = _1140 * _1110;
    if (_1108)
    {
        out.m_35.x = 0.0;
    }
    if (_1108)
    {
        float _1154 = _1146 * 5.0;
        _1144 = as_type<int>(_1154);
    }
    int _1156 = _1144;
    out.m_48.x = _1134;
    out.m_48.y = _1124;
    out.m_48.z = _1138;
    out.m_48.w = _1148;
    float _1158 = _1120 * _1128;
    float _1160 = _1158;
    if (_1108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3487 = as_type<float>(_1156);
        out.gl_Position.z = _3487;
    }
    out.m_50.x = _1098;
    out.m_50.y = _1112;
    out.m_50.z = _1158;
    out.m_50.w = _1152;
    float _1162 = _1136 * _1150;
    float _1164 = _1056 * _1162;
    float _1166 = _1048 * _1162;
    if (_1108)
    {
        return out;
    }
    float _1168 = -_1166;
    float _1170 = _1036 + _1168;
    float _1172 = _1064 * _1162;
    float _1174 = -_1164;
    float _1176 = _1040 + _1174;
    float _1178 = -_1166;
    float _1180 = _1048 + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1184 = _1170 + _1182;
    float _1186 = -_1172;
    float _1188 = _1052 + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1192 = _1176 + _1190;
    float _1194 = -_1164;
    float _1196 = _1056 + _1194;
    float _1198 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1202 = _1188 + _1200;
    float _1204 = _1180 * _1180;
    float _1206 = -_1172;
    float _1208 = _1064 + _1206;
    float _1210 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1198);
    float _1212 = _351 * _597;
    float _1214 = fma(_1196, _1196, _1204);
    float _1216 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1210);
    float _1218 = fma(_1208, _1208, _1214);
    bool _1220 = _1216 >= 0.0;
    float _1222 = sqrt(_1218);
    if (_1220)
    {
        _1160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1224 = _1160;
    int _1226 = as_type<int>(_1224);
    if (_1220)
    {
        out.m_35.x = 0.0;
    }
    if (_1220)
    {
        float _1228 = _1224 * 5.0;
        _1226 = as_type<int>(_1228);
    }
    int _1230 = _1226;
    float _1232 = _1150 * _1222;
    if (_1220)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3621 = as_type<float>(_1230);
        out.gl_Position.z = _3621;
    }
    if (_1220)
    {
        return out;
    }
    float _1234 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1238 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1240 = _1122 * _1232;
    float _1242 = _1232 * _1234;
    float _1244 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1246 = _1244 * 0.5;
    float _1248 = _1238 * _1240;
    float _1250 = _1236 * _1242;
    float _1252 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1254 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1256 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1258 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1252);
    float _1260 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1254);
    float _1262 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1256);
    float _1264 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1258);
    float _1266 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1260);
    float _1268 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1262);
    float _1270 = _1264 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1272 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1274 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1276 = _1040 + _1270;
    float _1278 = _1052 + _1272;
    float _1280 = _1036 + _1274;
    float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1284 = _1276 + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1288 = _1278 + _1286;
    float _1290 = _1284 * _1284;
    float _1292 = _1288 * _1288;
    float _1294 = _1290 + _1292;
    float _1296 = sqrt(_1294);
    bool _1298 = _1296 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1300 = _1248;
    float _1302 = _1274;
    float _1304 = _1246;
    float _1306 = _1292;
    float _1308 = _1276;
    if (!_1298)
    {
        _1300 = _1290;
    }
    float _1310 = _1300;
    float _1312 = _1310;
    if (!_1298)
    {
        _1302 = _1278;
    }
    float _1314 = _1302;
    float _1316 = _1314;
    if (!_1298)
    {
        _1304 = _1280;
    }
    float _1318 = _1304;
    bool _1320 = !_1298;
    float _1322 = _1318;
    if (!_1320)
    {
        float _1324 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1326 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1328 = _1296 + _1326;
        float _1330 = _1280 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1332 = rsqrt(_1294);
        float _1334 = _1328 * _1324;
        float _1336 = _1334 * 0.15915493667125701904296875;
        float _1338 = _1336 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1336 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        float _1346 = fma(_1340, _1330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1348 = _1332 * _1346;
        float _1350 = _1344 + (-1.0);
        float _1352 = fma(_1284, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1354 = fma(_1288, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1356 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1360 = _1352 + _1358;
        float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1364 = _1354 + _1362;
        float _1366 = fma(_1280, _1344, _1356);
        float _1368 = _1360 * _1360;
        float _1370 = _1364 * _1364;
        _1322 = _1366;
        _1312 = _1368;
        _1306 = _1370;
        _1308 = _1352;
        _1316 = _1354;
    }
    float _1372 = _1322;
    float _1374 = _1312;
    float _1376 = _1306;
    float _1378 = _1308;
    float _1380 = _1316;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1384 = _1372 + _1382;
    float _1386 = fma(_1384, _1384, _1374);
    float _1388 = _1386 + _1376;
    float _1390 = sqrt(_1388);
    bool _1392 = _1390 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1394 = isnan(_1390);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1400 = _1396 || _1398;
    float _1402 = _1386;
    if (!_1400)
    {
        _1402 = 1.0;
    }
    float _1404 = _1402;
    bool _1406 = !_1400;
    float _1408 = _1404;
    if (!_1406)
    {
        bool _1410 = _1390 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1412 = isnan(_1390);
        bool _1414 = _1410 || _1412;
        bool _1416 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1418 = _1414 || _1416;
        if (!_1418)
        {
            float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1422 = _1390 + _1420;
            float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1426 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1424;
            float _1428 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1430 = _1428 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1432 = 1.0 / _1426;
            float _1434 = _1422 * _1432;
            float _1436 = fma(_1434, _1430, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1408 = _1436;
            _1438 = true;
        }
        else
        {
            bool _1440 = _1390 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1442 = isnan(_1390);
            bool _1444 = _1440 || _1442;
            bool _1446 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1448 = _1444 || _1446;
            if (!_1448)
            {
                float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1452 = _1390 + _1450;
                float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1456 = _1454 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1458 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1460 = _1458 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1462 = 1.0 / _1456;
                float _1464 = _1452 * _1462;
                float _1466 = fma(_1464, _1460, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1408 = _1466;
                _1438 = true;
            }
            else
            {
                _1408 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1438 = false;
    float _1468 = _1408;
    float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1472 = _1378 + _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1476 = _1380 + _1474;
    bool _1478 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan(0.5);
    bool _1486 = _1482 || _1484;
    float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1490 = _1372 + _1488;
    float _1492 = fma(_1472, _1468, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1494 = fma(_1476, _1468, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1496 = fma(_1490, _1468, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1498 = -_1164;
    float _1500 = _1498 + _1492;
    float _1502 = -_1172;
    float _1504 = _1502 + _1494;
    float _1506 = -_1166;
    float _1508 = _1506 + _1496;
    float _1510 = _1508;
    float _1512 = _1500;
    float _1514 = _1504;
    if (!_1486)
    {
        float _1516 = _1184 * _1184;
        float _1518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1520 = -_1052;
        float _1522 = _1520 + _1494;
        float _1524 = -_1036;
        float _1526 = _1524 + _1496;
        float _1528 = fma(_1192, _1192, _1516);
        float _1530 = fma(_1202, _1202, _1528);
        float _1532 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1534 = sqrt(_1530);
        float _1536 = 1.0 / _1232;
        float _1538 = precise::min(_1534, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1540 = _1538 * _1518;
        float _1542 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1544 = _1540 * _1536;
        float _1546 = -_1040;
        float _1548 = _1546 + _1492;
        float _1550 = _1542 * _1544;
        float _1552 = _1522 * _1544;
        float _1554 = fma(_1548, _1550, _1176);
        float _1556 = fma(_1526, _1550, _1170);
        float _1558 = fma(_1542, _1552, _1188);
        _1510 = _1556;
        _1512 = _1554;
        _1514 = _1558;
    }
    float _1560 = _1510;
    float _1562 = _1512;
    float _1564 = _1514;
    float _1566 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1568 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1570 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1572 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1574 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1566);
    float _1576 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1568);
    float _1578 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1570);
    float _1580 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1572);
    float _1582 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1574);
    float _1584 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1576);
    float _1586 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1578);
    float _1588 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1580);
    float _1590 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1592 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1594 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1596 = _1588 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1598 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1600 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1604 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1606 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1598);
    float _1608 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1600);
    float _1610 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1602);
    float _1612 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1604);
    float _1614 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1606);
    float _1616 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1608);
    float _1618 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1610);
    float _1620 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1612);
    float _1622 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1614);
    float _1624 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1616);
    float _1626 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1618);
    float _1628 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1620);
    float _1630 = _1622 + _1624;
    float _1632 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1634 = _1630 * 0.5;
    out.m_35.x = _1632;
    out.gl_Position.x = _1626;
    out.gl_Position.y = _1628;
    out.gl_Position.z = _1622;
    out.gl_Position.w = _1624;
    out.m_52.z = _1634;
    out.m_52.w = _1624;
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
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1438 = false;
    bool _769 = false;
    bool _617 = false;
    bool _371 = false;
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
        float _1691 = as_type<float>(_87);
        out.gl_Position.z = _1691;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1760 = as_type<float>(_123);
        out.gl_Position.z = _1760;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_39.x;
    float _127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _129 = _105 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _131 = as_type<float>(int(gl_VertexIndex));
    float _133 = _105 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _135 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _137 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _139 = _135 || _137;
    bool _141 = isnan(1.0);
    bool _143 = _139 || _141;
    float _145 = _129 * _127;
    float _147 = 0.0;
    float _149 = _133;
    if (!_143)
    {
        float _151 = _133 * _133;
        float _153 = _151 * 0.5;
        _147 = _153;
    }
    float _155 = _147;
    float _157 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    float _159 = _155;
    if (!_143)
    {
        float _161 = _155 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _159 = _161;
    }
    float _163 = _159;
    float _165 = in.m_37.x;
    float _167 = in.m_37.y;
    float _169 = in.m_37.z;
    float _171 = _157 * 6.283185482025146484375;
    float _173 = floor(_157);
    int _175 = as_type<int>(_131) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_131) & 2;
    bool _181 = _179 != 0;
    float _183 = _171 * 0.15915493667125701904296875;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _183 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_177;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = -_173;
    float _199 = _157 + _197;
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_143;
    float _207 = _163;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _133 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _133);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_143;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _133 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _149 = _261;
    }
    float _263 = _149;
    float _265 = in.m_44.w;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _269 = _267 != 0;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _273 = _271 != 0;
    float _275 = fma(_191, 0.5, 0.5);
    bool _277 = _199 < 0.5;
    float _279 = float(_277);
    float _281 = -_199;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = in.m_32.x;
    float _287 = in.m_32.y;
    float _289 = in.m_32.z;
    bool _291 = !_269;
    int _293 = _291 ? 0 : 1;
    float _295 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _297 = !_187;
    int _299 = _297 ? 0 : 1;
    float _301 = -_279;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = -_275;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _309 = abs(_293);
    float _311 = fma(_263, _165, _295);
    int _313 = abs(_299);
    float _315 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _317 = !_273;
    int _319 = _317 ? 0 : 1;
    float _321 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _323 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _325 = abs(_319);
    float _327 = fma(_263, _167, _315);
    float _329 = float(_309);
    float _331 = fma(_263, _169, _321);
    float _333 = float(_313);
    float _335 = abs(_283);
    float _337 = _329 * _335;
    float _339 = fma(_327, _265, _287);
    float _341 = fma(_331, _265, _289);
    float _343 = float(_325);
    float _345 = fma(_333, _307, _337);
    float _347 = fma(_311, _265, _285);
    float _349 = abs(_303);
    float _351 = fma(_343, _349, _345);
    bool _353 = !_323;
    float _369;
    if (!_353)
    {
        float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _357 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[12].x, _105);
        float _361 = _359 * _355;
        float _363 = floor(_361);
        float _365 = -_363;
        float _367 = _361 + _365;
        _369 = _367;
        _371 = true;
    }
    else
    {
        float _373 = float(_71);
        float _375 = 1.0 / _373;
        float _377 = _105 * _375;
        _369 = _377;
    }
    _371 = false;
    float _379 = _369;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _383 = _379 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _379 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _405 = 1.0 / _391;
    bool _407 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _409 = 1.0 / _399;
    float _411 = 1.0 / _403;
    float _413 = _383 * _405;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _417 = _379 + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _421 = _379 + _419;
    float _423 = 1.0 / _395;
    float _425 = _417 * _409;
    bool _427 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _429 = isnan(_379);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    bool _439 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _441 = isnan(_379);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -_437;
    float _453 = _451 + 1.0;
    float _455 = _421 * _411;
    bool _457 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _459 = isnan(_379);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _469;
    float _473 = _467 * _453;
    float _475 = -_467;
    float _477 = _475 + 1.0;
    float _479 = _387 * _423;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _481;
    float _485 = fma(_471, _413, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _487 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _489 = isnan(_379);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _503 = fma(_483, _413, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _509 = -_449;
    float _511 = _509 + 1.0;
    float _513 = _449 * _477;
    float _515 = fma(_501, _479, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _517 = fma(_507, _479, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _519 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _521 = isnan(_379);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = _497 * _511;
    float _533 = -_497;
    float _535 = _533 + 1.0;
    float _537 = in.m_44.x;
    float _539 = in.m_44.y;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _541;
    float _545 = _529 * _535;
    float _547 = -_529;
    float _549 = _547 + 1.0;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _551;
    float _555 = fma(_543, _425, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _557 = _485 * _545;
    float _559 = _503 * _545;
    float _561 = fma(_553, _425, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _567 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[143].x, _557);
    float _569 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[143].y, _559);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _575 = fma(_565, _455, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _577 = fma(_515, _531, _567);
    float _579 = fma(_517, _531, _569);
    float _581 = fma(_573, _455, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _583 = fma(_561, _513, _577);
    float _585 = fma(_555, _513, _579);
    float _587 = fma(_581, _473, _583);
    float _589 = fma(_575, _473, _585);
    float _591 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[147].x, _587);
    float _593 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[147].y, _589);
    float _595 = _591 * _537;
    float _597 = _593 * _539;
    bool _599 = !_407;
    float _615;
    if (!_599)
    {
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _603 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[11].y, _105);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_71);
        float _621 = 1.0 / _619;
        float _623 = _105 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _631 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _633 = isnan(_625);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _647 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _649 = isnan(_625);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = 1.0 / _629;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _661;
    float _665 = -_641;
    float _667 = _665 + 1.0;
    bool _669 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _671 = isnan(_625);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    bool _681 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _683 = _657 * _667;
    float _685 = -_657;
    float _687 = _685 + 1.0;
    float _689 = 1.0 / _645;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _695 = _663 * _659;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _699 = _625 + _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _625 + _701;
    float _705 = fma(_695, _699, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _707 = -_679;
    float _709 = _707 + 1.0;
    float _711 = _693 * _689;
    float _713 = _705 * _683;
    float _715 = _641 * _709;
    float _717 = fma(_711, _703, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _719 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[115].x, _713);
    float _721 = fma(_717, _715, _719);
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _725 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[117].x, _721);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _731 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _733 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _735 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _739 = _725 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _741 = _731 * _125;
    out.m_46.x = _735;
    out.m_46.y = _737;
    out.m_46.z = _733;
    out.m_46.w = _739;
    float _743 = trunc(_741);
    int _745 = int(_743);
    int _747 = _745 << 4;
    int _749 = _747 + 1968;
    bool _751 = !_681;
    float _767;
    if (!_751)
    {
        float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _755 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _757 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _759 = _757 * _753;
        float _761 = floor(_759);
        float _763 = -_761;
        float _765 = _759 + _763;
        _767 = _765;
        _769 = true;
    }
    else
    {
        float _771 = float(_71);
        float _773 = 1.0 / _771;
        float _775 = _105 * _773;
        _767 = _775;
    }
    _769 = false;
    float _777 = _767;
    float _779 = in.m_39.z;
    float _781 = _339 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _783 = _339 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _785 = _339 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _787 = in.m_39.w;
    float _789 = _339 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _791 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[14].x, _781);
    float _793 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[14].y, _783);
    float _795 = in.m_39.y;
    float _797 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[14].z, _785);
    float _799 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[14].w, _789);
    float _801 = _125 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _803 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[16].y, _793);
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _807 = _805 != 0;
    float _809 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[16].x, _791);
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _813 = _811 != 0;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _819 = _817 != 0;
    float _821 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[16].z, _797);
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _825 = _823 != 0;
    float _827 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[16].w, _799);
    float _829 = _821 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    bool _831 = _779 > 0.5;
    float _833 = _827 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _835 = _351 * _595;
    bool _837 = _787 > 0.5;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _841 = _125 > 0.5;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _845 = -_839;
    float _847 = fma(_801, 2.0, _845);
    float _849 = _795 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _851 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[78].z, _843);
    float _853 = fma(_849, -2.0, _815);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _859 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _861 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _863 = 1.0 / _857;
    float _865 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _859);
    float _867 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _861);
    float _869 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _853);
    float _871 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _865);
    float _873 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _875;
    float _879 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _873);
    float _881 = sqrt(_871);
    float _883 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _867);
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _887 = _877 * _863;
    float _889 = _809 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _891 = -_195;
    int _893 = _841 ? as_type<int>(_891) : as_type<int>(_195);
    float _895 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[78].w, _885);
    float _897 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _879);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _901 = _777 + _899;
    bool _903 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _905 = isnan(_777);
    bool _907 = _903 || _905;
    bool _909 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = sqrt(_883);
    bool _917 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _919 = isnan(_777);
    bool _921 = _917 || _919;
    bool _923 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _925 = _921 || _923;
    float _927 = float(_925);
    float _929 = fma(_887, _901, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _931 = _795 > 0.5;
    uint _934 = uint(int(uint(_749) >> uint(2)));
    uint _936 = uint(int(uint(int(_934)) >> uint(2)));
    int _938 = int(_934) & 3;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[int(_936)][_938];
    int _942 = int(_934) + 1;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    int _946 = _942 & 3;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[int(_944)][_946];
    float _950 = -_913;
    float _952 = _950 + 1.0;
    float _954 = _881 * _889;
    float _956 = -_105;
    float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[76].x, _847);
    float _960 = sqrt(_897);
    float _962 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _851);
    float _964 = _803 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _966 = _927 * _952;
    float _968 = -_927;
    float _970 = _968 + 1.0;
    float _972 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _895);
    bool _974 = !_807;
    float _976 = _974 ? _195 : as_type<float>(_893);
    float _978 = _929 * _966;
    float _980 = _915 * _964;
    float _982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _984 = -_962;
    float _986 = _984 + 1.0;
    float _988 = -_972;
    float _990 = _988 + 1.0;
    float _992 = _980 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _994 = _980 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _996 = _980 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _998 = _749 + 8;
    uint _1000 = uint(int(uint(_998) >> uint(2)));
    uint _1002 = uint(int(uint(int(_1000)) >> uint(2)));
    int _1004 = int(_1000) & 3;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[int(_1002)][_1004];
    float _1008 = _960 * _829;
    float _1010 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[25].x, _992);
    float _1012 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _994);
    float _1014 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[26].x, _996);
    float _1016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1018 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1010);
    float _1020 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[131].x, _978);
    float _1022 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1012);
    float _1024 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1014);
    float _1026 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1018);
    float _1028 = -_203;
    int _1030 = _931 ? as_type<int>(_1028) : as_type<int>(_203);
    float _1032 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1022);
    float _1034 = _982 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1036 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1038 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1024);
    float _1040 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    bool _1042 = !_813;
    float _1044 = _1042 ? _203 : as_type<float>(_1030);
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1048 = _1036 + _1046;
    float _1050 = _976 + 0.5;
    float _1052 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1056 = _1040 + _1054;
    float _1058 = _1048 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1060 = fma(_1034, _1050, _958);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1064 = _1052 + _1062;
    float _1066 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1020);
    float _1068 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1058);
    float _1070 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1072 = _940 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1074 = -_195;
    int _1076 = _831 ? as_type<int>(_1074) : as_type<int>(_195);
    float _1078 = _1044 + (-0.5);
    float _1080 = _948 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1082 = _1048 * _1048;
    float _1084 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1068);
    bool _1086 = !_819;
    float _1088 = _1086 ? _195 : as_type<float>(_1076);
    float _1090 = -_1070;
    float _1092 = -_869;
    float _1094 = fma(_1090, _1078, _1092);
    float _1096 = -_986;
    float _1098 = fma(_976, _1096, _1060);
    float _1100 = fma(_1056, _1056, _1082);
    float _1102 = -_203;
    int _1104 = _837 ? as_type<int>(_1102) : as_type<int>(_203);
    float _1106 = _1088 + 0.5;
    bool _1108 = _1084 >= 0.0;
    float _1110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1112 = fma(_1044, _990, _1094);
    float _1114 = fma(_1064, _1064, _1100);
    bool _1116 = !_825;
    float _1118 = _1116 ? _203 : as_type<float>(_1104);
    float _1120 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1122 = _835 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1124 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1126 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1130 = -_1118;
    float _1132 = _1130 + 0.5;
    float _1134 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1138 = _1126 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1142 = _1132;
    int _1144 = as_type<int>(_1072);
    if (_1108)
    {
        _1142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1146 = _1142;
    float _1148 = _1066 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1150 = rsqrt(_1114);
    float _1152 = _1140 * _1110;
    if (_1108)
    {
        out.m_35.x = 0.0;
    }
    if (_1108)
    {
        float _1154 = _1146 * 5.0;
        _1144 = as_type<int>(_1154);
    }
    int _1156 = _1144;
    out.m_48.x = _1134;
    out.m_48.y = _1124;
    out.m_48.z = _1138;
    out.m_48.w = _1148;
    float _1158 = _1120 * _1128;
    float _1160 = _1158;
    if (_1108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3487 = as_type<float>(_1156);
        out.gl_Position.z = _3487;
    }
    out.m_50.x = _1098;
    out.m_50.y = _1112;
    out.m_50.z = _1158;
    out.m_50.w = _1152;
    float _1162 = _1136 * _1150;
    float _1164 = _1056 * _1162;
    float _1166 = _1048 * _1162;
    if (_1108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1168 = -_1166;
    float _1170 = _1036 + _1168;
    float _1172 = _1064 * _1162;
    float _1174 = -_1164;
    float _1176 = _1040 + _1174;
    float _1178 = -_1166;
    float _1180 = _1048 + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1184 = _1170 + _1182;
    float _1186 = -_1172;
    float _1188 = _1052 + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1192 = _1176 + _1190;
    float _1194 = -_1164;
    float _1196 = _1056 + _1194;
    float _1198 = _1184 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1202 = _1188 + _1200;
    float _1204 = _1180 * _1180;
    float _1206 = -_1172;
    float _1208 = _1064 + _1206;
    float _1210 = fma(_1192, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1198);
    float _1212 = _351 * _597;
    float _1214 = fma(_1196, _1196, _1204);
    float _1216 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1210);
    float _1218 = fma(_1208, _1208, _1214);
    bool _1220 = _1216 >= 0.0;
    float _1222 = sqrt(_1218);
    if (_1220)
    {
        _1160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1224 = _1160;
    int _1226 = as_type<int>(_1224);
    if (_1220)
    {
        out.m_35.x = 0.0;
    }
    if (_1220)
    {
        float _1228 = _1224 * 5.0;
        _1226 = as_type<int>(_1228);
    }
    int _1230 = _1226;
    float _1232 = _1150 * _1222;
    if (_1220)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3621 = as_type<float>(_1230);
        out.gl_Position.z = _3621;
    }
    if (_1220)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1234 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1236 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1238 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1240 = _1122 * _1232;
    float _1242 = _1232 * _1234;
    float _1244 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1246 = _1244 * 0.5;
    float _1248 = _1238 * _1240;
    float _1250 = _1236 * _1242;
    float _1252 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1254 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1256 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1258 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1252);
    float _1260 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1254);
    float _1262 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1256);
    float _1264 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1258);
    float _1266 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1260);
    float _1268 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1262);
    float _1270 = _1264 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1272 = _1266 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1274 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1276 = _1040 + _1270;
    float _1278 = _1052 + _1272;
    float _1280 = _1036 + _1274;
    float _1282 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1284 = _1276 + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1288 = _1278 + _1286;
    float _1290 = _1284 * _1284;
    float _1292 = _1288 * _1288;
    float _1294 = _1290 + _1292;
    float _1296 = sqrt(_1294);
    bool _1298 = _1296 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1300 = _1248;
    float _1302 = _1274;
    float _1304 = _1246;
    float _1306 = _1292;
    float _1308 = _1276;
    if (!_1298)
    {
        _1300 = _1290;
    }
    float _1310 = _1300;
    float _1312 = _1310;
    if (!_1298)
    {
        _1302 = _1278;
    }
    float _1314 = _1302;
    float _1316 = _1314;
    if (!_1298)
    {
        _1304 = _1280;
    }
    float _1318 = _1304;
    bool _1320 = !_1298;
    float _1322 = _1318;
    if (!_1320)
    {
        float _1324 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1326 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1328 = _1296 + _1326;
        float _1330 = _1280 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1332 = rsqrt(_1294);
        float _1334 = _1328 * _1324;
        float _1336 = _1334 * 0.15915493667125701904296875;
        float _1338 = _1336 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1336 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        float _1346 = fma(_1340, _1330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1348 = _1332 * _1346;
        float _1350 = _1344 + (-1.0);
        float _1352 = fma(_1284, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1354 = fma(_1288, _1348, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1356 = _1350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1360 = _1352 + _1358;
        float _1362 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1364 = _1354 + _1362;
        float _1366 = fma(_1280, _1344, _1356);
        float _1368 = _1360 * _1360;
        float _1370 = _1364 * _1364;
        _1322 = _1366;
        _1312 = _1368;
        _1306 = _1370;
        _1308 = _1352;
        _1316 = _1354;
    }
    float _1372 = _1322;
    float _1374 = _1312;
    float _1376 = _1306;
    float _1378 = _1308;
    float _1380 = _1316;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1384 = _1372 + _1382;
    float _1386 = fma(_1384, _1384, _1374);
    float _1388 = _1386 + _1376;
    float _1390 = sqrt(_1388);
    bool _1392 = _1390 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1394 = isnan(_1390);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1400 = _1396 || _1398;
    float _1402 = _1386;
    if (!_1400)
    {
        _1402 = 1.0;
    }
    float _1404 = _1402;
    bool _1406 = !_1400;
    float _1408 = _1404;
    if (!_1406)
    {
        bool _1410 = _1390 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1412 = isnan(_1390);
        bool _1414 = _1410 || _1412;
        bool _1416 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1418 = _1414 || _1416;
        if (!_1418)
        {
            float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1422 = _1390 + _1420;
            float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1426 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1424;
            float _1428 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1430 = _1428 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1432 = 1.0 / _1426;
            float _1434 = _1422 * _1432;
            float _1436 = fma(_1434, _1430, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1408 = _1436;
            _1438 = true;
        }
        else
        {
            bool _1440 = _1390 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1442 = isnan(_1390);
            bool _1444 = _1440 || _1442;
            bool _1446 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1448 = _1444 || _1446;
            if (!_1448)
            {
                float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1452 = _1390 + _1450;
                float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1456 = _1454 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1458 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1460 = _1458 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1462 = 1.0 / _1456;
                float _1464 = _1452 * _1462;
                float _1466 = fma(_1464, _1460, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1408 = _1466;
                _1438 = true;
            }
            else
            {
                _1408 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1438 = false;
    float _1468 = _1408;
    float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1472 = _1378 + _1470;
    float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1476 = _1380 + _1474;
    bool _1478 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan(0.5);
    bool _1486 = _1482 || _1484;
    float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1490 = _1372 + _1488;
    float _1492 = fma(_1472, _1468, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1494 = fma(_1476, _1468, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1496 = fma(_1490, _1468, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1498 = -_1164;
    float _1500 = _1498 + _1492;
    float _1502 = -_1172;
    float _1504 = _1502 + _1494;
    float _1506 = -_1166;
    float _1508 = _1506 + _1496;
    float _1510 = _1508;
    float _1512 = _1500;
    float _1514 = _1504;
    if (!_1486)
    {
        float _1516 = _1184 * _1184;
        float _1518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1520 = -_1052;
        float _1522 = _1520 + _1494;
        float _1524 = -_1036;
        float _1526 = _1524 + _1496;
        float _1528 = fma(_1192, _1192, _1516);
        float _1530 = fma(_1202, _1202, _1528);
        float _1532 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1534 = sqrt(_1530);
        float _1536 = 1.0 / _1232;
        float _1538 = precise::min(_1534, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1540 = _1538 * _1518;
        float _1542 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1544 = _1540 * _1536;
        float _1546 = -_1040;
        float _1548 = _1546 + _1492;
        float _1550 = _1542 * _1544;
        float _1552 = _1522 * _1544;
        float _1554 = fma(_1548, _1550, _1176);
        float _1556 = fma(_1526, _1550, _1170);
        float _1558 = fma(_1542, _1552, _1188);
        _1510 = _1556;
        _1512 = _1554;
        _1514 = _1558;
    }
    float _1560 = _1510;
    float _1562 = _1512;
    float _1564 = _1514;
    float _1566 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1568 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1570 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1572 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1574 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1566);
    float _1576 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1568);
    float _1578 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1570);
    float _1580 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1572);
    float _1582 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1574);
    float _1584 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1576);
    float _1586 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1578);
    float _1588 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1580);
    float _1590 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1592 = _1584 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1594 = _1586 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1596 = _1588 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1598 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1600 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1604 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1606 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1598);
    float _1608 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1600);
    float _1610 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1602);
    float _1612 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1604);
    float _1614 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1606);
    float _1616 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1608);
    float _1618 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1610);
    float _1620 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1612);
    float _1622 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1614);
    float _1624 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1616);
    float _1626 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1618);
    float _1628 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1620);
    float _1630 = _1622 + _1624;
    float _1632 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1634 = _1630 * 0.5;
    out.m_35.x = _1632;
    out.gl_Position.x = _1626;
    out.gl_Position.y = _1628;
    out.gl_Position.z = _1622;
    out.gl_Position.w = _1624;
    out.m_52.z = _1634;
    out.m_52.w = _1624;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

