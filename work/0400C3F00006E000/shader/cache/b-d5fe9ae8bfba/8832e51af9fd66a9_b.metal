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
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1374 = false;
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
        float _1635 = as_type<float>(_87);
        out.gl_Position.z = _1635;
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
        float _1704 = as_type<float>(_123);
        out.gl_Position.z = _1704;
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
    float _781 = _339 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _783 = _339 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _785 = _339 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _787 = in.m_39.w;
    float _789 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[4].x, _781);
    float _791 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[5].x, _783);
    float _793 = in.m_39.y;
    float _795 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[6].x, _785);
    float _797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _801 = _799 != 0;
    float _803 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[5].z, _791);
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _807 = _805 != 0;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _813 = _811 != 0;
    float _815 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[4].z, _789);
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _819 = _817 != 0;
    float _821 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[78].z, _809);
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _825 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _821);
    bool _827 = _779 > 0.5;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _831 = _797 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _833 = _787 > 0.5;
    float _835 = _125 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _837 = _125 > 0.5;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _843 = _793 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _845 = -_829;
    float _847 = fma(_835, 2.0, _845);
    float _849 = 1.0 / _841;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _853 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _855 = isnan(_777);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -_825;
    float _867 = _865 + 1.0;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _869;
    float _873 = fma(_843, -2.0, _851);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _877 = _777 + _875;
    bool _879 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _881 = isnan(_777);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = -_863;
    float _893 = _891 + 1.0;
    uint _896 = uint(int(uint(_749) >> uint(2)));
    uint _898 = uint(int(uint(int(_896)) >> uint(2)));
    int _900 = int(_896) & 3;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[int(_898)][_900];
    int _904 = int(_896) + 1;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    int _908 = _904 & 3;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[int(_906)][_908];
    float _912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _914 = _351 * _595;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _918 = _871 * _849;
    float _920 = -_195;
    int _922 = _837 ? as_type<int>(_920) : as_type<int>(_195);
    bool _924 = _793 > 0.5;
    float _926 = fma(_918, _877, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _928 = _889 * _893;
    float _930 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[6].z, _795);
    float _932 = -_105;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[76].x, _847);
    float _936 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _873);
    float _938 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[78].w, _916);
    int _940 = _749 + 8;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    uint _944 = uint(int(uint(int(_942)) >> uint(2)));
    int _946 = int(_942) & 3;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[int(_944)][_946];
    float _950 = _926 * _928;
    float _952 = -_889;
    float _954 = _952 + 1.0;
    float _956 = _803 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _958 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _938);
    float _960 = _815 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _962 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[131].x, _950);
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _966 = _956 + _964;
    float _968 = _930 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _970 = -_203;
    int _972 = _924 ? as_type<int>(_970) : as_type<int>(_203);
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _976 = _960 + _974;
    float _978 = _966 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _980 = !_801;
    float _982 = _980 ? _195 : as_type<float>(_922);
    float _984 = _823 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _986 = !_807;
    float _988 = _986 ? _203 : as_type<float>(_972);
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[28].x, _978);
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _994 = _968 + _992;
    float _996 = _982 + 0.5;
    float _998 = _966 * _966;
    float _1000 = _988 + (-0.5);
    float _1002 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[28].z, _990);
    float _1004 = fma(_831, _996, _934);
    float _1006 = -_958;
    float _1008 = _1006 + 1.0;
    float _1010 = -_984;
    float _1012 = -_936;
    float _1014 = fma(_1010, _1000, _1012);
    float _1016 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[132].x, _962);
    bool _1018 = _1002 >= 0.0;
    float _1020 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1022 = -_203;
    int _1024 = _833 ? as_type<int>(_1022) : as_type<int>(_203);
    float _1026 = _914 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1028 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1030 = _902 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1032 = -_195;
    int _1034 = _827 ? as_type<int>(_1032) : as_type<int>(_195);
    float _1036 = _910 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1038 = !_819;
    float _1040 = _1038 ? _203 : as_type<float>(_1024);
    float _1042 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1044 = !_813;
    float _1046 = _1044 ? _195 : as_type<float>(_1034);
    float _1048 = -_867;
    float _1050 = fma(_982, _1048, _1004);
    float _1052 = fma(_976, _976, _998);
    float _1054 = -_1040;
    float _1056 = _1054 + 0.5;
    float _1058 = _867;
    if (_1018)
    {
        _1058 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1060 = _1058;
    float _1062 = _1046 + 0.5;
    float _1064 = fma(_988, _1008, _1014);
    float _1066 = fma(_994, _994, _1052);
    float _1068 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1070 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1072 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1074 = rsqrt(_1066);
    float _1076 = _948 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1078 = _1068 * _1020;
    float _1080 = _1070 * _912;
    float _1082 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1084 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1086 = as_type<int>(_1076);
    float _1088 = _1080;
    if (_1018)
    {
        float _1090 = _1060 * 5.0;
        _1086 = as_type<int>(_1090);
    }
    int _1092 = _1086;
    out.m_48.x = _1050;
    out.m_48.y = _1064;
    out.m_48.z = _1080;
    out.m_48.w = _1078;
    out.m_50.x = _1072;
    out.m_50.y = _1084;
    out.m_50.z = _1082;
    out.m_50.w = _1028;
    float _1094 = _1042 * _1074;
    if (_1018)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3281 = as_type<float>(_1092);
        out.gl_Position.z = _3281;
    }
    float _1096 = _976 * _1094;
    if (_1018)
    {
        out.m_35.x = 0.0;
    }
    float _1098 = _966 * _1094;
    if (_1018)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1100 = -_1098;
    float _1102 = _956 + _1100;
    float _1104 = _994 * _1094;
    float _1106 = -_1096;
    float _1108 = _960 + _1106;
    float _1110 = -_1098;
    float _1112 = _966 + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1116 = _1102 + _1114;
    float _1118 = -_1104;
    float _1120 = _968 + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1124 = _1108 + _1122;
    float _1126 = -_1096;
    float _1128 = _976 + _1126;
    float _1130 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1134 = _1120 + _1132;
    float _1136 = _1112 * _1112;
    float _1138 = -_1104;
    float _1140 = _994 + _1138;
    float _1142 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1130);
    float _1144 = _351 * _597;
    float _1146 = fma(_1128, _1128, _1136);
    float _1148 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1142);
    float _1150 = fma(_1140, _1140, _1146);
    bool _1152 = _1148 >= 0.0;
    float _1154 = sqrt(_1150);
    if (_1152)
    {
        _1088 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1156 = _1088;
    int _1158 = as_type<int>(_1156);
    if (_1152)
    {
        out.m_35.x = 0.0;
    }
    if (_1152)
    {
        float _1160 = _1156 * 5.0;
        _1158 = as_type<int>(_1160);
    }
    int _1162 = _1158;
    float _1164 = _1074 * _1154;
    if (_1152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3408 = as_type<float>(_1162);
        out.gl_Position.z = _3408;
    }
    if (_1152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1166 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1168 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1172 = _1026 * _1164;
    float _1174 = _1164 * _1166;
    float _1176 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1178 = _1176 * 0.5;
    float _1180 = _1170 * _1172;
    float _1182 = _1168 * _1174;
    float _1184 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1186 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1188 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1190 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1184);
    float _1192 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1186);
    float _1194 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1188);
    float _1196 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1190);
    float _1198 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1192);
    float _1200 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1194);
    float _1202 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1204 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1206 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1208 = _960 + _1202;
    float _1210 = _968 + _1204;
    float _1212 = _956 + _1206;
    float _1214 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1216 = _1208 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1220 = _1210 + _1218;
    float _1222 = _1216 * _1216;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 + _1224;
    float _1228 = sqrt(_1226);
    bool _1230 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = _1180;
    float _1234 = _1222;
    float _1236 = _1206;
    float _1238 = _1178;
    float _1240 = _1224;
    if (!_1230)
    {
        _1232 = _1222;
    }
    float _1242 = _1232;
    float _1244 = _1242;
    if (!_1230)
    {
        _1234 = _1208;
    }
    float _1246 = _1234;
    float _1248 = _1246;
    if (!_1230)
    {
        _1236 = _1210;
    }
    float _1250 = _1236;
    float _1252 = _1250;
    if (!_1230)
    {
        _1238 = _1212;
    }
    float _1254 = _1238;
    bool _1256 = !_1230;
    float _1258 = _1254;
    if (!_1256)
    {
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1264 = _1228 + _1262;
        float _1266 = _1212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1268 = rsqrt(_1226);
        float _1270 = _1264 * _1260;
        float _1272 = _1270 * 0.15915493667125701904296875;
        float _1274 = _1272 * 6.283185482025146484375;
        float _1276 = sin(_1274);
        float _1278 = _1272 * 6.283185482025146484375;
        float _1280 = cos(_1278);
        float _1282 = fma(_1276, _1266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1284 = _1268 * _1282;
        float _1286 = _1280 + (-1.0);
        float _1288 = fma(_1216, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1290 = fma(_1220, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1292 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1294 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1296 = _1288 + _1294;
        float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1300 = _1290 + _1298;
        float _1302 = fma(_1212, _1280, _1292);
        float _1304 = _1296 * _1296;
        float _1306 = _1300 * _1300;
        _1258 = _1302;
        _1244 = _1304;
        _1240 = _1306;
        _1248 = _1288;
        _1252 = _1290;
    }
    float _1308 = _1258;
    float _1310 = _1244;
    float _1312 = _1240;
    float _1314 = _1248;
    float _1316 = _1252;
    float _1318 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1320 = _1308 + _1318;
    float _1322 = fma(_1320, _1320, _1310);
    float _1324 = _1322 + _1312;
    float _1326 = sqrt(_1324);
    bool _1328 = _1326 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1330 = isnan(_1326);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1336 = _1332 || _1334;
    float _1338 = _1322;
    if (!_1336)
    {
        _1338 = 1.0;
    }
    float _1340 = _1338;
    bool _1342 = !_1336;
    float _1344 = _1340;
    if (!_1342)
    {
        bool _1346 = _1326 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1348 = isnan(_1326);
        bool _1350 = _1346 || _1348;
        bool _1352 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1354 = _1350 || _1352;
        if (!_1354)
        {
            float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1358 = _1326 + _1356;
            float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1362 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1360;
            float _1364 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1366 = _1364 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1368 = 1.0 / _1362;
            float _1370 = _1358 * _1368;
            float _1372 = fma(_1370, _1366, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1344 = _1372;
            _1374 = true;
        }
        else
        {
            bool _1376 = _1326 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1378 = isnan(_1326);
            bool _1380 = _1376 || _1378;
            bool _1382 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1384 = _1380 || _1382;
            if (!_1384)
            {
                float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1388 = _1326 + _1386;
                float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1392 = _1390 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1396 = _1394 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1398 = 1.0 / _1392;
                float _1400 = _1388 * _1398;
                float _1402 = fma(_1400, _1396, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1344 = _1402;
                _1374 = true;
            }
            else
            {
                _1344 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1374 = false;
    float _1404 = _1344;
    float _1406 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1408 = _1314 + _1406;
    float _1410 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1412 = _1316 + _1410;
    bool _1414 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(0.5);
    bool _1422 = _1418 || _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1426 = _1308 + _1424;
    float _1428 = fma(_1408, _1404, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1430 = fma(_1412, _1404, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1432 = fma(_1426, _1404, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1434 = -_1096;
    float _1436 = _1434 + _1428;
    float _1438 = -_1104;
    float _1440 = _1438 + _1430;
    float _1442 = -_1098;
    float _1444 = _1442 + _1432;
    float _1446 = _1444;
    float _1448 = _1436;
    float _1450 = _1440;
    if (!_1422)
    {
        float _1452 = _1116 * _1116;
        float _1454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1456 = -_968;
        float _1458 = _1456 + _1430;
        float _1460 = -_956;
        float _1462 = _1460 + _1432;
        float _1464 = fma(_1124, _1124, _1452);
        float _1466 = fma(_1134, _1134, _1464);
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1470 = sqrt(_1466);
        float _1472 = 1.0 / _1164;
        float _1474 = precise::min(_1470, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1476 = _1474 * _1454;
        float _1478 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1480 = _1476 * _1472;
        float _1482 = -_960;
        float _1484 = _1482 + _1428;
        float _1486 = _1478 * _1480;
        float _1488 = _1458 * _1480;
        float _1490 = fma(_1484, _1486, _1108);
        float _1492 = fma(_1462, _1486, _1102);
        float _1494 = fma(_1478, _1488, _1120);
        _1446 = _1492;
        _1448 = _1490;
        _1450 = _1494;
    }
    float _1496 = _1446;
    float _1498 = _1448;
    float _1500 = _1450;
    float _1502 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1504 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1506 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1508 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1510 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1502);
    float _1512 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1504);
    float _1514 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1506);
    float _1516 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1508);
    float _1518 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1510);
    float _1520 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1512);
    float _1522 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1514);
    float _1524 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1516);
    float _1526 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1528 = _1520 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1530 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1534 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1536 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1538 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1540 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1542 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1534);
    float _1544 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1536);
    float _1546 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1538);
    float _1548 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1540);
    float _1550 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1542);
    float _1552 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1544);
    float _1554 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1546);
    float _1556 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1548);
    float _1558 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1550);
    float _1560 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1552);
    float _1562 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1554);
    float _1564 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1556);
    float _1566 = _1558 + _1562;
    float _1568 = _1560 + _1562;
    float _1570 = _1562 * 0.5;
    float _1572 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1574 = _1566 * 0.5;
    float _1576 = _1568 * 0.5;
    float _1578 = fma(_1564, -0.5, _1570);
    out.m_35.x = _1572;
    out.gl_Position.x = _1558;
    out.gl_Position.y = _1564;
    out.gl_Position.z = _1560;
    out.gl_Position.w = _1562;
    out.m_52.x = _1574;
    out.m_52.y = _1578;
    out.m_52.z = _1576;
    out.m_52.w = _1562;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1374 = false;
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
        float _1635 = as_type<float>(_87);
        out.gl_Position.z = _1635;
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
        float _1704 = as_type<float>(_123);
        out.gl_Position.z = _1704;
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
    float _781 = _339 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _783 = _339 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _785 = _339 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _787 = in.m_39.w;
    float _789 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[4].x, _781);
    float _791 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[5].x, _783);
    float _793 = in.m_39.y;
    float _795 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[6].x, _785);
    float _797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _801 = _799 != 0;
    float _803 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[5].z, _791);
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _807 = _805 != 0;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _813 = _811 != 0;
    float _815 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[4].z, _789);
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _819 = _817 != 0;
    float _821 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[78].z, _809);
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _825 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _821);
    bool _827 = _779 > 0.5;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _831 = _797 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _833 = _787 > 0.5;
    float _835 = _125 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _837 = _125 > 0.5;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _843 = _793 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _845 = -_829;
    float _847 = fma(_835, 2.0, _845);
    float _849 = 1.0 / _841;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _853 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _855 = isnan(_777);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -_825;
    float _867 = _865 + 1.0;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _869;
    float _873 = fma(_843, -2.0, _851);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _877 = _777 + _875;
    bool _879 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _881 = isnan(_777);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = -_863;
    float _893 = _891 + 1.0;
    uint _896 = uint(int(uint(_749) >> uint(2)));
    uint _898 = uint(int(uint(int(_896)) >> uint(2)));
    int _900 = int(_896) & 3;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[int(_898)][_900];
    int _904 = int(_896) + 1;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    int _908 = _904 & 3;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[int(_906)][_908];
    float _912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _914 = _351 * _595;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _918 = _871 * _849;
    float _920 = -_195;
    int _922 = _837 ? as_type<int>(_920) : as_type<int>(_195);
    bool _924 = _793 > 0.5;
    float _926 = fma(_918, _877, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _928 = _889 * _893;
    float _930 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[6].z, _795);
    float _932 = -_105;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[76].x, _847);
    float _936 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _873);
    float _938 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[78].w, _916);
    int _940 = _749 + 8;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    uint _944 = uint(int(uint(int(_942)) >> uint(2)));
    int _946 = int(_942) & 3;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[int(_944)][_946];
    float _950 = _926 * _928;
    float _952 = -_889;
    float _954 = _952 + 1.0;
    float _956 = _803 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _958 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _938);
    float _960 = _815 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _962 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[131].x, _950);
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _966 = _956 + _964;
    float _968 = _930 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _970 = -_203;
    int _972 = _924 ? as_type<int>(_970) : as_type<int>(_203);
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _976 = _960 + _974;
    float _978 = _966 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _980 = !_801;
    float _982 = _980 ? _195 : as_type<float>(_922);
    float _984 = _823 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _986 = !_807;
    float _988 = _986 ? _203 : as_type<float>(_972);
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[28].x, _978);
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _994 = _968 + _992;
    float _996 = _982 + 0.5;
    float _998 = _966 * _966;
    float _1000 = _988 + (-0.5);
    float _1002 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[28].z, _990);
    float _1004 = fma(_831, _996, _934);
    float _1006 = -_958;
    float _1008 = _1006 + 1.0;
    float _1010 = -_984;
    float _1012 = -_936;
    float _1014 = fma(_1010, _1000, _1012);
    float _1016 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[132].x, _962);
    bool _1018 = _1002 >= 0.0;
    float _1020 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1022 = -_203;
    int _1024 = _833 ? as_type<int>(_1022) : as_type<int>(_203);
    float _1026 = _914 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1028 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1030 = _902 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1032 = -_195;
    int _1034 = _827 ? as_type<int>(_1032) : as_type<int>(_195);
    float _1036 = _910 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1038 = !_819;
    float _1040 = _1038 ? _203 : as_type<float>(_1024);
    float _1042 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1044 = !_813;
    float _1046 = _1044 ? _195 : as_type<float>(_1034);
    float _1048 = -_867;
    float _1050 = fma(_982, _1048, _1004);
    float _1052 = fma(_976, _976, _998);
    float _1054 = -_1040;
    float _1056 = _1054 + 0.5;
    float _1058 = _867;
    if (_1018)
    {
        _1058 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1060 = _1058;
    float _1062 = _1046 + 0.5;
    float _1064 = fma(_988, _1008, _1014);
    float _1066 = fma(_994, _994, _1052);
    float _1068 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1070 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1072 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1074 = rsqrt(_1066);
    float _1076 = _948 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1078 = _1068 * _1020;
    float _1080 = _1070 * _912;
    float _1082 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1084 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1086 = as_type<int>(_1076);
    float _1088 = _1080;
    if (_1018)
    {
        float _1090 = _1060 * 5.0;
        _1086 = as_type<int>(_1090);
    }
    int _1092 = _1086;
    out.m_48.x = _1050;
    out.m_48.y = _1064;
    out.m_48.z = _1080;
    out.m_48.w = _1078;
    out.m_50.x = _1072;
    out.m_50.y = _1084;
    out.m_50.z = _1082;
    out.m_50.w = _1028;
    float _1094 = _1042 * _1074;
    if (_1018)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3281 = as_type<float>(_1092);
        out.gl_Position.z = _3281;
    }
    float _1096 = _976 * _1094;
    if (_1018)
    {
        out.m_35.x = 0.0;
    }
    float _1098 = _966 * _1094;
    if (_1018)
    {
        return out;
    }
    float _1100 = -_1098;
    float _1102 = _956 + _1100;
    float _1104 = _994 * _1094;
    float _1106 = -_1096;
    float _1108 = _960 + _1106;
    float _1110 = -_1098;
    float _1112 = _966 + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1116 = _1102 + _1114;
    float _1118 = -_1104;
    float _1120 = _968 + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1124 = _1108 + _1122;
    float _1126 = -_1096;
    float _1128 = _976 + _1126;
    float _1130 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1134 = _1120 + _1132;
    float _1136 = _1112 * _1112;
    float _1138 = -_1104;
    float _1140 = _994 + _1138;
    float _1142 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1130);
    float _1144 = _351 * _597;
    float _1146 = fma(_1128, _1128, _1136);
    float _1148 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1142);
    float _1150 = fma(_1140, _1140, _1146);
    bool _1152 = _1148 >= 0.0;
    float _1154 = sqrt(_1150);
    if (_1152)
    {
        _1088 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1156 = _1088;
    int _1158 = as_type<int>(_1156);
    if (_1152)
    {
        out.m_35.x = 0.0;
    }
    if (_1152)
    {
        float _1160 = _1156 * 5.0;
        _1158 = as_type<int>(_1160);
    }
    int _1162 = _1158;
    float _1164 = _1074 * _1154;
    if (_1152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3408 = as_type<float>(_1162);
        out.gl_Position.z = _3408;
    }
    if (_1152)
    {
        return out;
    }
    float _1166 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1168 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1172 = _1026 * _1164;
    float _1174 = _1164 * _1166;
    float _1176 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1178 = _1176 * 0.5;
    float _1180 = _1170 * _1172;
    float _1182 = _1168 * _1174;
    float _1184 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1186 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1188 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1190 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1184);
    float _1192 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1186);
    float _1194 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1188);
    float _1196 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1190);
    float _1198 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1192);
    float _1200 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1194);
    float _1202 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1204 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1206 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1208 = _960 + _1202;
    float _1210 = _968 + _1204;
    float _1212 = _956 + _1206;
    float _1214 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1216 = _1208 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1220 = _1210 + _1218;
    float _1222 = _1216 * _1216;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 + _1224;
    float _1228 = sqrt(_1226);
    bool _1230 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = _1180;
    float _1234 = _1222;
    float _1236 = _1206;
    float _1238 = _1178;
    float _1240 = _1224;
    if (!_1230)
    {
        _1232 = _1222;
    }
    float _1242 = _1232;
    float _1244 = _1242;
    if (!_1230)
    {
        _1234 = _1208;
    }
    float _1246 = _1234;
    float _1248 = _1246;
    if (!_1230)
    {
        _1236 = _1210;
    }
    float _1250 = _1236;
    float _1252 = _1250;
    if (!_1230)
    {
        _1238 = _1212;
    }
    float _1254 = _1238;
    bool _1256 = !_1230;
    float _1258 = _1254;
    if (!_1256)
    {
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1264 = _1228 + _1262;
        float _1266 = _1212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1268 = rsqrt(_1226);
        float _1270 = _1264 * _1260;
        float _1272 = _1270 * 0.15915493667125701904296875;
        float _1274 = _1272 * 6.283185482025146484375;
        float _1276 = sin(_1274);
        float _1278 = _1272 * 6.283185482025146484375;
        float _1280 = cos(_1278);
        float _1282 = fma(_1276, _1266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1284 = _1268 * _1282;
        float _1286 = _1280 + (-1.0);
        float _1288 = fma(_1216, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1290 = fma(_1220, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1292 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1294 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1296 = _1288 + _1294;
        float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1300 = _1290 + _1298;
        float _1302 = fma(_1212, _1280, _1292);
        float _1304 = _1296 * _1296;
        float _1306 = _1300 * _1300;
        _1258 = _1302;
        _1244 = _1304;
        _1240 = _1306;
        _1248 = _1288;
        _1252 = _1290;
    }
    float _1308 = _1258;
    float _1310 = _1244;
    float _1312 = _1240;
    float _1314 = _1248;
    float _1316 = _1252;
    float _1318 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1320 = _1308 + _1318;
    float _1322 = fma(_1320, _1320, _1310);
    float _1324 = _1322 + _1312;
    float _1326 = sqrt(_1324);
    bool _1328 = _1326 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1330 = isnan(_1326);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1336 = _1332 || _1334;
    float _1338 = _1322;
    if (!_1336)
    {
        _1338 = 1.0;
    }
    float _1340 = _1338;
    bool _1342 = !_1336;
    float _1344 = _1340;
    if (!_1342)
    {
        bool _1346 = _1326 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1348 = isnan(_1326);
        bool _1350 = _1346 || _1348;
        bool _1352 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1354 = _1350 || _1352;
        if (!_1354)
        {
            float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1358 = _1326 + _1356;
            float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1362 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1360;
            float _1364 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1366 = _1364 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1368 = 1.0 / _1362;
            float _1370 = _1358 * _1368;
            float _1372 = fma(_1370, _1366, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1344 = _1372;
            _1374 = true;
        }
        else
        {
            bool _1376 = _1326 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1378 = isnan(_1326);
            bool _1380 = _1376 || _1378;
            bool _1382 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1384 = _1380 || _1382;
            if (!_1384)
            {
                float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1388 = _1326 + _1386;
                float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1392 = _1390 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1396 = _1394 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1398 = 1.0 / _1392;
                float _1400 = _1388 * _1398;
                float _1402 = fma(_1400, _1396, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1344 = _1402;
                _1374 = true;
            }
            else
            {
                _1344 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1374 = false;
    float _1404 = _1344;
    float _1406 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1408 = _1314 + _1406;
    float _1410 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1412 = _1316 + _1410;
    bool _1414 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(0.5);
    bool _1422 = _1418 || _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1426 = _1308 + _1424;
    float _1428 = fma(_1408, _1404, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1430 = fma(_1412, _1404, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1432 = fma(_1426, _1404, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1434 = -_1096;
    float _1436 = _1434 + _1428;
    float _1438 = -_1104;
    float _1440 = _1438 + _1430;
    float _1442 = -_1098;
    float _1444 = _1442 + _1432;
    float _1446 = _1444;
    float _1448 = _1436;
    float _1450 = _1440;
    if (!_1422)
    {
        float _1452 = _1116 * _1116;
        float _1454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1456 = -_968;
        float _1458 = _1456 + _1430;
        float _1460 = -_956;
        float _1462 = _1460 + _1432;
        float _1464 = fma(_1124, _1124, _1452);
        float _1466 = fma(_1134, _1134, _1464);
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1470 = sqrt(_1466);
        float _1472 = 1.0 / _1164;
        float _1474 = precise::min(_1470, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1476 = _1474 * _1454;
        float _1478 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1480 = _1476 * _1472;
        float _1482 = -_960;
        float _1484 = _1482 + _1428;
        float _1486 = _1478 * _1480;
        float _1488 = _1458 * _1480;
        float _1490 = fma(_1484, _1486, _1108);
        float _1492 = fma(_1462, _1486, _1102);
        float _1494 = fma(_1478, _1488, _1120);
        _1446 = _1492;
        _1448 = _1490;
        _1450 = _1494;
    }
    float _1496 = _1446;
    float _1498 = _1448;
    float _1500 = _1450;
    float _1502 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1504 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1506 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1508 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1510 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1502);
    float _1512 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1504);
    float _1514 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1506);
    float _1516 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1508);
    float _1518 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1510);
    float _1520 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1512);
    float _1522 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1514);
    float _1524 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1516);
    float _1526 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1528 = _1520 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1530 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1534 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1536 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1538 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1540 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1542 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1534);
    float _1544 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1536);
    float _1546 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1538);
    float _1548 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1540);
    float _1550 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1542);
    float _1552 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1544);
    float _1554 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1546);
    float _1556 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1548);
    float _1558 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1550);
    float _1560 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1552);
    float _1562 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1554);
    float _1564 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1556);
    float _1566 = _1558 + _1562;
    float _1568 = _1560 + _1562;
    float _1570 = _1562 * 0.5;
    float _1572 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1574 = _1566 * 0.5;
    float _1576 = _1568 * 0.5;
    float _1578 = fma(_1564, -0.5, _1570);
    out.m_35.x = _1572;
    out.gl_Position.x = _1558;
    out.gl_Position.y = _1564;
    out.gl_Position.z = _1560;
    out.gl_Position.w = _1562;
    out.m_52.x = _1574;
    out.m_52.y = _1578;
    out.m_52.z = _1576;
    out.m_52.w = _1562;
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
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_35 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_48 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1374 = false;
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
        float _1635 = as_type<float>(_87);
        out.gl_Position.z = _1635;
    }
    if (!_75)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1704 = as_type<float>(_123);
        out.gl_Position.z = _1704;
    }
    if (_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _781 = _339 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _783 = _339 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _785 = _339 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _787 = in.m_39.w;
    float _789 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[4].x, _781);
    float _791 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[5].x, _783);
    float _793 = in.m_39.y;
    float _795 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[6].x, _785);
    float _797 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _801 = _799 != 0;
    float _803 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[5].z, _791);
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _807 = _805 != 0;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _813 = _811 != 0;
    float _815 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[4].z, _789);
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _819 = _817 != 0;
    float _821 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[78].z, _809);
    float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _825 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _821);
    bool _827 = _779 > 0.5;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _831 = _797 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _833 = _787 > 0.5;
    float _835 = _125 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _837 = _125 > 0.5;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _843 = _793 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _845 = -_829;
    float _847 = fma(_835, 2.0, _845);
    float _849 = 1.0 / _841;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _853 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _855 = isnan(_777);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -_825;
    float _867 = _865 + 1.0;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _869;
    float _873 = fma(_843, -2.0, _851);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _877 = _777 + _875;
    bool _879 = _777 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _881 = isnan(_777);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = -_863;
    float _893 = _891 + 1.0;
    uint _896 = uint(int(uint(_749) >> uint(2)));
    uint _898 = uint(int(uint(int(_896)) >> uint(2)));
    int _900 = int(_896) & 3;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[int(_898)][_900];
    int _904 = int(_896) + 1;
    uint _906 = uint(int(uint(_904) >> uint(2)));
    int _908 = _904 & 3;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[int(_906)][_908];
    float _912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _914 = _351 * _595;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _918 = _871 * _849;
    float _920 = -_195;
    int _922 = _837 ? as_type<int>(_920) : as_type<int>(_195);
    bool _924 = _793 > 0.5;
    float _926 = fma(_918, _877, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _928 = _889 * _893;
    float _930 = fma(_341, (*spvDescriptorSet0.vp_c10)._m0[6].z, _795);
    float _932 = -_105;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[76].x, _847);
    float _936 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _873);
    float _938 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[78].w, _916);
    int _940 = _749 + 8;
    uint _942 = uint(int(uint(_940) >> uint(2)));
    uint _944 = uint(int(uint(int(_942)) >> uint(2)));
    int _946 = int(_942) & 3;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[int(_944)][_946];
    float _950 = _926 * _928;
    float _952 = -_889;
    float _954 = _952 + 1.0;
    float _956 = _803 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _958 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _938);
    float _960 = _815 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _962 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[131].x, _950);
    float _964 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _966 = _956 + _964;
    float _968 = _930 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _970 = -_203;
    int _972 = _924 ? as_type<int>(_970) : as_type<int>(_203);
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _976 = _960 + _974;
    float _978 = _966 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _980 = !_801;
    float _982 = _980 ? _195 : as_type<float>(_922);
    float _984 = _823 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _986 = !_807;
    float _988 = _986 ? _203 : as_type<float>(_972);
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[28].x, _978);
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _994 = _968 + _992;
    float _996 = _982 + 0.5;
    float _998 = _966 * _966;
    float _1000 = _988 + (-0.5);
    float _1002 = fma(_994, (*spvDescriptorSet0.vp_c8)._m0[28].z, _990);
    float _1004 = fma(_831, _996, _934);
    float _1006 = -_958;
    float _1008 = _1006 + 1.0;
    float _1010 = -_984;
    float _1012 = -_936;
    float _1014 = fma(_1010, _1000, _1012);
    float _1016 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[132].x, _962);
    bool _1018 = _1002 >= 0.0;
    float _1020 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1022 = -_203;
    int _1024 = _833 ? as_type<int>(_1022) : as_type<int>(_203);
    float _1026 = _914 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1028 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1030 = _902 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1032 = -_195;
    int _1034 = _827 ? as_type<int>(_1032) : as_type<int>(_195);
    float _1036 = _910 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1038 = !_819;
    float _1040 = _1038 ? _203 : as_type<float>(_1024);
    float _1042 = _1026 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1044 = !_813;
    float _1046 = _1044 ? _195 : as_type<float>(_1034);
    float _1048 = -_867;
    float _1050 = fma(_982, _1048, _1004);
    float _1052 = fma(_976, _976, _998);
    float _1054 = -_1040;
    float _1056 = _1054 + 0.5;
    float _1058 = _867;
    if (_1018)
    {
        _1058 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1060 = _1058;
    float _1062 = _1046 + 0.5;
    float _1064 = fma(_988, _1008, _1014);
    float _1066 = fma(_994, _994, _1052);
    float _1068 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1070 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1072 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1074 = rsqrt(_1066);
    float _1076 = _948 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1078 = _1068 * _1020;
    float _1080 = _1070 * _912;
    float _1082 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1084 = _1036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1086 = as_type<int>(_1076);
    float _1088 = _1080;
    if (_1018)
    {
        float _1090 = _1060 * 5.0;
        _1086 = as_type<int>(_1090);
    }
    int _1092 = _1086;
    out.m_48.x = _1050;
    out.m_48.y = _1064;
    out.m_48.z = _1080;
    out.m_48.w = _1078;
    out.m_50.x = _1072;
    out.m_50.y = _1084;
    out.m_50.z = _1082;
    out.m_50.w = _1028;
    float _1094 = _1042 * _1074;
    if (_1018)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3281 = as_type<float>(_1092);
        out.gl_Position.z = _3281;
    }
    float _1096 = _976 * _1094;
    if (_1018)
    {
        out.m_35.x = 0.0;
    }
    float _1098 = _966 * _1094;
    if (_1018)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1100 = -_1098;
    float _1102 = _956 + _1100;
    float _1104 = _994 * _1094;
    float _1106 = -_1096;
    float _1108 = _960 + _1106;
    float _1110 = -_1098;
    float _1112 = _966 + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1116 = _1102 + _1114;
    float _1118 = -_1104;
    float _1120 = _968 + _1118;
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1124 = _1108 + _1122;
    float _1126 = -_1096;
    float _1128 = _976 + _1126;
    float _1130 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1134 = _1120 + _1132;
    float _1136 = _1112 * _1112;
    float _1138 = -_1104;
    float _1140 = _994 + _1138;
    float _1142 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1130);
    float _1144 = _351 * _597;
    float _1146 = fma(_1128, _1128, _1136);
    float _1148 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1142);
    float _1150 = fma(_1140, _1140, _1146);
    bool _1152 = _1148 >= 0.0;
    float _1154 = sqrt(_1150);
    if (_1152)
    {
        _1088 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1156 = _1088;
    int _1158 = as_type<int>(_1156);
    if (_1152)
    {
        out.m_35.x = 0.0;
    }
    if (_1152)
    {
        float _1160 = _1156 * 5.0;
        _1158 = as_type<int>(_1160);
    }
    int _1162 = _1158;
    float _1164 = _1074 * _1154;
    if (_1152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3408 = as_type<float>(_1162);
        out.gl_Position.z = _3408;
    }
    if (_1152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1166 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1168 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1172 = _1026 * _1164;
    float _1174 = _1164 * _1166;
    float _1176 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1178 = _1176 * 0.5;
    float _1180 = _1170 * _1172;
    float _1182 = _1168 * _1174;
    float _1184 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1186 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1188 = _1182 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1190 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1184);
    float _1192 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1186);
    float _1194 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1188);
    float _1196 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1190);
    float _1198 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1192);
    float _1200 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1194);
    float _1202 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1204 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1206 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1208 = _960 + _1202;
    float _1210 = _968 + _1204;
    float _1212 = _956 + _1206;
    float _1214 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1216 = _1208 + _1214;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1220 = _1210 + _1218;
    float _1222 = _1216 * _1216;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 + _1224;
    float _1228 = sqrt(_1226);
    bool _1230 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = _1180;
    float _1234 = _1222;
    float _1236 = _1206;
    float _1238 = _1178;
    float _1240 = _1224;
    if (!_1230)
    {
        _1232 = _1222;
    }
    float _1242 = _1232;
    float _1244 = _1242;
    if (!_1230)
    {
        _1234 = _1208;
    }
    float _1246 = _1234;
    float _1248 = _1246;
    if (!_1230)
    {
        _1236 = _1210;
    }
    float _1250 = _1236;
    float _1252 = _1250;
    if (!_1230)
    {
        _1238 = _1212;
    }
    float _1254 = _1238;
    bool _1256 = !_1230;
    float _1258 = _1254;
    if (!_1256)
    {
        float _1260 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1262 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1264 = _1228 + _1262;
        float _1266 = _1212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1268 = rsqrt(_1226);
        float _1270 = _1264 * _1260;
        float _1272 = _1270 * 0.15915493667125701904296875;
        float _1274 = _1272 * 6.283185482025146484375;
        float _1276 = sin(_1274);
        float _1278 = _1272 * 6.283185482025146484375;
        float _1280 = cos(_1278);
        float _1282 = fma(_1276, _1266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1284 = _1268 * _1282;
        float _1286 = _1280 + (-1.0);
        float _1288 = fma(_1216, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1290 = fma(_1220, _1284, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1292 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1294 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1296 = _1288 + _1294;
        float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1300 = _1290 + _1298;
        float _1302 = fma(_1212, _1280, _1292);
        float _1304 = _1296 * _1296;
        float _1306 = _1300 * _1300;
        _1258 = _1302;
        _1244 = _1304;
        _1240 = _1306;
        _1248 = _1288;
        _1252 = _1290;
    }
    float _1308 = _1258;
    float _1310 = _1244;
    float _1312 = _1240;
    float _1314 = _1248;
    float _1316 = _1252;
    float _1318 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1320 = _1308 + _1318;
    float _1322 = fma(_1320, _1320, _1310);
    float _1324 = _1322 + _1312;
    float _1326 = sqrt(_1324);
    bool _1328 = _1326 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1330 = isnan(_1326);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1336 = _1332 || _1334;
    float _1338 = _1322;
    if (!_1336)
    {
        _1338 = 1.0;
    }
    float _1340 = _1338;
    bool _1342 = !_1336;
    float _1344 = _1340;
    if (!_1342)
    {
        bool _1346 = _1326 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1348 = isnan(_1326);
        bool _1350 = _1346 || _1348;
        bool _1352 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1354 = _1350 || _1352;
        if (!_1354)
        {
            float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1358 = _1326 + _1356;
            float _1360 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1362 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1360;
            float _1364 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1366 = _1364 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1368 = 1.0 / _1362;
            float _1370 = _1358 * _1368;
            float _1372 = fma(_1370, _1366, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1344 = _1372;
            _1374 = true;
        }
        else
        {
            bool _1376 = _1326 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1378 = isnan(_1326);
            bool _1380 = _1376 || _1378;
            bool _1382 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1384 = _1380 || _1382;
            if (!_1384)
            {
                float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1388 = _1326 + _1386;
                float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1392 = _1390 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1396 = _1394 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1398 = 1.0 / _1392;
                float _1400 = _1388 * _1398;
                float _1402 = fma(_1400, _1396, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1344 = _1402;
                _1374 = true;
            }
            else
            {
                _1344 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1374 = false;
    float _1404 = _1344;
    float _1406 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1408 = _1314 + _1406;
    float _1410 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1412 = _1316 + _1410;
    bool _1414 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(0.5);
    bool _1422 = _1418 || _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1426 = _1308 + _1424;
    float _1428 = fma(_1408, _1404, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1430 = fma(_1412, _1404, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1432 = fma(_1426, _1404, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1434 = -_1096;
    float _1436 = _1434 + _1428;
    float _1438 = -_1104;
    float _1440 = _1438 + _1430;
    float _1442 = -_1098;
    float _1444 = _1442 + _1432;
    float _1446 = _1444;
    float _1448 = _1436;
    float _1450 = _1440;
    if (!_1422)
    {
        float _1452 = _1116 * _1116;
        float _1454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1456 = -_968;
        float _1458 = _1456 + _1430;
        float _1460 = -_956;
        float _1462 = _1460 + _1432;
        float _1464 = fma(_1124, _1124, _1452);
        float _1466 = fma(_1134, _1134, _1464);
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1470 = sqrt(_1466);
        float _1472 = 1.0 / _1164;
        float _1474 = precise::min(_1470, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1476 = _1474 * _1454;
        float _1478 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1480 = _1476 * _1472;
        float _1482 = -_960;
        float _1484 = _1482 + _1428;
        float _1486 = _1478 * _1480;
        float _1488 = _1458 * _1480;
        float _1490 = fma(_1484, _1486, _1108);
        float _1492 = fma(_1462, _1486, _1102);
        float _1494 = fma(_1478, _1488, _1120);
        _1446 = _1492;
        _1448 = _1490;
        _1450 = _1494;
    }
    float _1496 = _1446;
    float _1498 = _1448;
    float _1500 = _1450;
    float _1502 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1504 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1506 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1508 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1510 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1502);
    float _1512 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1504);
    float _1514 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1506);
    float _1516 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1508);
    float _1518 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1510);
    float _1520 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1512);
    float _1522 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1514);
    float _1524 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1516);
    float _1526 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1528 = _1520 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1530 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1534 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1536 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1538 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1540 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1542 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1534);
    float _1544 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1536);
    float _1546 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1538);
    float _1548 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1540);
    float _1550 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1542);
    float _1552 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1544);
    float _1554 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1546);
    float _1556 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1548);
    float _1558 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1550);
    float _1560 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1552);
    float _1562 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1554);
    float _1564 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1556);
    float _1566 = _1558 + _1562;
    float _1568 = _1560 + _1562;
    float _1570 = _1562 * 0.5;
    float _1572 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1574 = _1566 * 0.5;
    float _1576 = _1568 * 0.5;
    float _1578 = fma(_1564, -0.5, _1570);
    out.m_35.x = _1572;
    out.gl_Position.x = _1558;
    out.gl_Position.y = _1564;
    out.gl_Position.z = _1560;
    out.gl_Position.w = _1562;
    out.m_52.x = _1574;
    out.m_52.y = _1578;
    out.m_52.z = _1576;
    out.m_52.w = _1562;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

