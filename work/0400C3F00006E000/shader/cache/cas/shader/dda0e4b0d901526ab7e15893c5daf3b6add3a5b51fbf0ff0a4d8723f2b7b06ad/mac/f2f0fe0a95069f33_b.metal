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
    bool _1661 = false;
    bool _951 = false;
    bool _677 = false;
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
        float _1850 = as_type<float>(_87);
        out.gl_Position.z = _1850;
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
        float _1919 = as_type<float>(_123);
        out.gl_Position.z = _1919;
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
    float _147 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    float _149 = in.m_37.x;
    float _151 = in.m_37.y;
    float _153 = in.m_37.z;
    float _155 = _147 * 6.283185482025146484375;
    float _157 = floor(_147);
    int _159 = as_type<int>(_131) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_131) & 2;
    bool _165 = _163 != 0;
    float _167 = _131;
    float _169 = _133;
    if (!_143)
    {
        float _171 = _133 * _133;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _155 * 0.15915493667125701904296875;
    float _179 = _175;
    if (!_143)
    {
        float _181 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _177 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_161;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = -_157;
    float _199 = _147 + _197;
    bool _201 = !_165;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_143;
    float _207 = _183;
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
        _169 = _261;
    }
    float _263 = _169;
    float _265 = fma(_191, 0.5, 0.5);
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _269 = _267 != 0;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _273 = _271 != 0;
    float _275 = in.m_44.w;
    bool _277 = _199 < 0.5;
    float _279 = float(_277);
    float _281 = -_199;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _287 = in.m_32.x;
    float _289 = in.m_32.y;
    float _291 = in.m_32.z;
    bool _293 = !_269;
    int _295 = _293 ? 0 : 1;
    float _297 = -_279;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_265;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _305 = !_187;
    int _307 = _305 ? 0 : 1;
    int _309 = abs(_295);
    float _311 = fma(_263, _149, _285);
    bool _313 = !_273;
    int _315 = _313 ? 0 : 1;
    float _317 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _321 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _323 = abs(_307);
    float _325 = fma(_263, _151, _317);
    int _327 = abs(_315);
    float _329 = fma(_263, _153, _321);
    float _331 = float(_309);
    float _333 = float(_323);
    float _335 = abs(_283);
    float _337 = _331 * _335;
    float _339 = float(_327);
    float _341 = fma(_333, _303, _337);
    float _343 = fma(_311, _275, _287);
    float _345 = fma(_325, _275, _289);
    float _347 = fma(_329, _275, _291);
    float _349 = abs(_299);
    float _351 = fma(_339, _349, _341);
    bool _353 = !_319;
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
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _389;
    float _393 = 1.0 / _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _407 = 1.0 / _391;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _411 = _379 + _409;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _417 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _421 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = 1.0 / _387;
    float _425 = _411 * _393;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _429 = _379 + _427;
    out.m_46.x = _417;
    out.m_46.y = _419;
    out.m_46.z = _421;
    out.m_46.w = _415;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _433 = _379 + _431;
    bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _437 = 1.0 / _397;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _441 = _379 + _439;
    float _443 = _429 * _407;
    bool _445 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _447 = isnan(_379);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = 1.0 / _401;
    float _459 = _441 * _423;
    bool _461 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _463 = isnan(_379);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    bool _473 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _475 = isnan(_379);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    bool _485 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _487 = isnan(_379);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -_471;
    float _499 = _497 + 1.0;
    bool _501 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _503 = isnan(_379);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _515 = _379 + _513;
    float _517 = -_483;
    float _519 = _517 + 1.0;
    float _521 = -_495;
    float _523 = _521 + 1.0;
    float _525 = _515 * _437;
    float _527 = -_455;
    float _529 = _527 + 1.0;
    float _531 = _495 * _519;
    float _533 = _433 * _457;
    float _535 = _455 * _499;
    float _537 = _483 * _529;
    bool _539 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _541 = isnan(_379);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _563 = -_549;
    float _565 = _563 + 1.0;
    float _567 = fma(_553, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _569 = fma(_557, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _571 = _549 * _523;
    float _573 = _511 * _565;
    float _575 = fma(_561, _459, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _577;
    float _581 = -_511;
    float _583 = _581 + 1.0;
    float _585 = _567 * _573;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _591 = _569 * _573;
    float _593 = fma(_579, _443, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _595 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[143].x, _585);
    float _597 = fma(_589, _459, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _599;
    float _603 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[143].y, _591);
    float _605 = in.m_44.x;
    float _607 = in.m_44.y;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _617 = fma(_601, _443, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _619 = fma(_575, _571, _595);
    float _621 = fma(_597, _571, _603);
    float _623 = fma(_615, _533, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _625;
    float _629 = fma(_611, _533, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _631;
    float _635 = fma(_593, _531, _619);
    float _637 = fma(_617, _531, _621);
    float _639 = fma(_627, _525, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _641 = fma(_633, _525, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _643 = fma(_629, _537, _635);
    float _645 = fma(_623, _537, _637);
    float _647 = fma(_639, _535, _643);
    float _649 = fma(_641, _535, _645);
    float _651 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[148].x, _647);
    float _653 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[148].y, _649);
    float _655 = _651 * _605;
    float _657 = _653 * _607;
    bool _659 = !_435;
    float _675;
    if (!_659)
    {
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _663 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        float _679 = float(_71);
        float _681 = 1.0 / _679;
        float _683 = _105 * _681;
        _675 = _683;
    }
    _677 = false;
    float _685 = _675;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _689 = _685 + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _693 = _685 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _711 = 1.0 / _697;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _715 = _685 + _713;
    bool _717 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _719 = isnan(_685);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = 1.0 / _701;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _733 = _685 + _731;
    bool _735 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _737 = 1.0 / _709;
    float _739 = _715 * _711;
    bool _741 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _743 = isnan(_685);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = 1.0 / _705;
    float _755 = _689 * _729;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _757;
    float _761 = _733 * _737;
    bool _763 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _765 = isnan(_685);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    bool _775 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _777 = isnan(_685);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = fma(_759, _739, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _789 = -_773;
    float _791 = _789 + 1.0;
    float _793 = _693 * _753;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _799;
    float _803 = _751 * _791;
    float _805 = -_785;
    float _807 = _805 + 1.0;
    float _809 = fma(_797, _739, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _811 = fma(_801, _739, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _813 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _815 = isnan(_685);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = -_751;
    float _827 = _825 + 1.0;
    float _829 = _823 * _807;
    float _831 = _785 * _827;
    float _833 = -_823;
    float _835 = _833 + 1.0;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _849 = _727 * _835;
    float _851 = fma(_839, _755, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _853 = fma(_843, _755, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _855 = fma(_847, _755, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _857 = _787 * _849;
    float _859 = _809 * _849;
    float _861 = -_727;
    float _863 = _861 + 1.0;
    float _865 = _811 * _849;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _867;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _871;
    float _875 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].x, _857);
    float _877 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].z, _865);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _879;
    float _883 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].y, _859);
    float _885 = fma(_869, _793, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _887 = fma(_873, _793, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _889 = fma(_851, _829, _875);
    float _891 = fma(_855, _829, _877);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _901 = fma(_881, _793, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _903 = fma(_853, _829, _883);
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _909 = fma(_885, _831, _889);
    float _911 = fma(_895, _761, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _913 = fma(_899, _761, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _915 = fma(_907, _761, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _917 = fma(_887, _831, _903);
    float _919 = fma(_901, _831, _891);
    float _921 = fma(_911, _803, _909);
    float _923 = fma(_913, _803, _917);
    float _925 = fma(_915, _803, _919);
    float _927 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[127].x, _921);
    float _929 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[127].y, _923);
    float _931 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[127].z, _925);
    bool _933 = !_735;
    float _949;
    if (!_933)
    {
        float _935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _937 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _939 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _941 = _939 * _935;
        float _943 = floor(_941);
        float _945 = -_943;
        float _947 = _941 + _945;
        _949 = _947;
        _951 = true;
    }
    else
    {
        float _953 = float(_71);
        float _955 = 1.0 / _953;
        float _957 = _105 * _955;
        _949 = _957;
    }
    _951 = false;
    float _959 = _949;
    float _961 = in.m_39.w;
    float _963 = _345 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _965 = in.m_39.z;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _969 = _967 != 0;
    float _971 = _345 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _975 = _973 != 0;
    float _977 = in.m_39.y;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _981 = _979 != 0;
    float _983 = _345 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _987 = _985 != 0;
    float _989 = _345 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _991 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[14].x, _963);
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _997 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[14].y, _971);
    float _999 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[14].z, _983);
    float _1001 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[14].w, _989);
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1005 = _961 > 0.5;
    float _1007 = _125 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1013 = _965 > 0.5;
    float _1015 = -_995;
    float _1017 = fma(_1007, 2.0, _1015);
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1021 = _977 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1023 = _125 > 0.5;
    float _1025 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1003);
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1031 = fma(_1021, -2.0, _993);
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1035 = _1033 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1037 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[16].y, _997);
    float _1039 = 1.0 / _1029;
    float _1041 = -_195;
    int _1043 = _1023 ? as_type<int>(_1041) : as_type<int>(_195);
    float _1045 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1019);
    float _1047 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[16].x, _991);
    bool _1049 = _977 > 0.5;
    float _1051 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[16].z, _999);
    float _1053 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1001);
    float _1055 = 1.0 / _1035;
    float _1057 = _1047 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1059 = _1053 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1061 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _1063 = 1.0 / _1011;
    float _1065 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _1067 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _1069 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _1061);
    float _1071 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _1065);
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1081 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _1067);
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1083;
    float _1087 = _1075 * _1039;
    float _1089 = _1079 * _1055;
    bool _1091 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1093 = isnan(_959);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = _1085 * _1063;
    float _1105 = -_105;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1017);
    float _1109 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _1071);
    float _1111 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _1069);
    float _1113 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1025);
    float _1115 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1031);
    float _1117 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1045);
    bool _1119 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1121 = isnan(_959);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = -_1101;
    float _1133 = _1131 + 1.0;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1137 = _959 + _1135;
    bool _1139 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1141 = isnan(_959);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = sqrt(_1109);
    float _1153 = _1129 * _1133;
    float _1155 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _1081);
    float _1157 = fma(_1087, _1137, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1159 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1161 = isnan(_959);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    float _1171 = -_1149;
    float _1173 = _1171 + 1.0;
    float _1175 = -_1129;
    float _1177 = _1175 + 1.0;
    bool _1179 = !_969;
    float _1181 = _1179 ? _195 : as_type<float>(_1043);
    float _1183 = sqrt(_1111);
    float _1185 = -_1113;
    float _1187 = _1185 + 1.0;
    float _1189 = _1149 * _1177;
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1193 = _959 + _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1197 = _959 + _1195;
    float _1199 = _927 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1201 = fma(_1103, _1193, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1203 = sqrt(_1155);
    float _1205 = _1169 * _1173;
    float _1207 = -_1169;
    float _1209 = _1207 + 1.0;
    float _1211 = fma(_1089, _1197, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1213 = _1157 * _1205;
    float _1215 = _1037 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1217 = _1051 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1221 = _1183 * _1057;
    float _1223 = _1151 * _1215;
    float _1225 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1213);
    float _1227 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1229 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1231 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1233 = _1203 * _1217;
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1227);
    float _1237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1239 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1229);
    float _1241 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1231);
    float _1243 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1235);
    float _1245 = -_203;
    int _1247 = _1049 ? as_type<int>(_1245) : as_type<int>(_203);
    float _1249 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1251 = _1181 + 0.5;
    float _1253 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1239);
    bool _1255 = !_975;
    float _1257 = _1255 ? _203 : as_type<float>(_1247);
    float _1259 = fma(_1211, _1189, _1225);
    float _1261 = fma(_1249, _1251, _1107);
    float _1263 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1241);
    float _1265 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1243);
    float _1267 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1253);
    float _1269 = _1257 + (-0.5);
    float _1271 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1263);
    float _1273 = _1265 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1275 = _1267 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1277 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1279 = _1271 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1283 = _1273 + _1281;
    float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1287 = _1275 + _1285;
    float _1289 = -_1277;
    float _1291 = -_1115;
    float _1293 = fma(_1289, _1269, _1291);
    float _1295 = fma(_1201, _1153, _1259);
    float _1297 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1301 = _1279 + _1299;
    float _1303 = -_203;
    int _1305 = _1005 ? as_type<int>(_1303) : as_type<int>(_203);
    float _1307 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1295);
    float _1309 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1297);
    float _1311 = -_1187;
    float _1313 = fma(_1181, _1311, _1261);
    float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1317 = _1283 * _1283;
    float _1319 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1309);
    bool _1321 = !_987;
    float _1323 = _1321 ? _203 : as_type<float>(_1305);
    float _1325 = -_1117;
    float _1327 = _1325 + 1.0;
    float _1329 = fma(_1287, _1287, _1317);
    float _1331 = -_195;
    int _1333 = _1013 ? as_type<int>(_1331) : as_type<int>(_195);
    float _1335 = _931 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1337 = _1319 >= 0.0;
    float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1341 = -_1323;
    float _1343 = _1341 + 0.5;
    float _1345 = fma(_1301, _1301, _1329);
    bool _1347 = !_981;
    float _1349 = _1347 ? _195 : as_type<float>(_1333);
    float _1351 = fma(_1257, _1327, _1293);
    float _1353 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1355 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1357 = _1349 + 0.5;
    float _1359 = rsqrt(_1345);
    float _1361 = _1353 * _1315;
    float _1363 = _929 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1365 = _1343;
    int _1367 = as_type<int>(_1363);
    if (_1337)
    {
        _1365 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1369 = _1365;
    float _1371 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1373 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1375 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1307 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1379 = _1371 * _1339;
    if (_1337)
    {
        float _1381 = _1369 * 5.0;
        _1367 = as_type<int>(_1381);
    }
    int _1383 = _1367;
    float _1385 = as_type<float>(_1383);
    if (_1337)
    {
        out.m_35.x = 0.0;
    }
    out.m_48.x = _1313;
    out.m_48.y = _1351;
    out.m_48.z = _1379;
    out.m_48.w = _1361;
    float _1387 = _1283 * _1359;
    float _1389 = _1287 * _1359;
    out.m_50.x = _1373;
    out.m_50.y = _1375;
    out.m_50.z = _1355;
    out.m_50.w = _1377;
    if (_1337)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4049 = as_type<float>(_1383);
        out.gl_Position.z = _4049;
    }
    if (_1337)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1391 = -_1387;
    float _1393 = fma(_1391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1273);
    float _1395 = _1301 * _1359;
    float _1397 = -_1389;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1275);
    float _1401 = -_1387;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1407 = _1393 + _1405;
    float _1409 = -_1395;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1279);
    float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1415 = _1399 + _1413;
    float _1417 = -_1389;
    float _1419 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1287);
    float _1421 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1425 = _1411 + _1423;
    float _1427 = _1403 * _1403;
    float _1429 = -_1395;
    float _1431 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1301);
    float _1433 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1421);
    float _1435 = fma(_1419, _1419, _1427);
    float _1437 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1433);
    float _1439 = fma(_1431, _1431, _1435);
    bool _1441 = _1437 >= 0.0;
    float _1443 = sqrt(_1439);
    if (_1441)
    {
        _1385 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1445 = _1385;
    int _1447 = as_type<int>(_1445);
    if (_1441)
    {
        out.m_35.x = 0.0;
    }
    float _1449 = _1359 * _1443;
    if (_1441)
    {
        float _1451 = _1445 * 5.0;
        _1447 = as_type<int>(_1451);
    }
    int _1453 = _1447;
    if (_1441)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4175 = as_type<float>(_1453);
        out.gl_Position.z = _4175;
    }
    if (_1441)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1455 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1457 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1459 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1461 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1463 = _1449 * _1455;
    float _1465 = _1449 * _1457;
    float _1467 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1469 = _1467 * 0.5;
    float _1471 = _1459 * _1463;
    float _1473 = _1461 * _1465;
    float _1475 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1477 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1479 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1481 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1475);
    float _1483 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1477);
    float _1485 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1479);
    float _1487 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1481);
    float _1489 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1483);
    float _1491 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1485);
    float _1493 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1495 = _1489 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1497 = _1491 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1499 = _1275 + _1493;
    float _1501 = _1279 + _1495;
    float _1503 = _1273 + _1497;
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1507 = _1499 + _1505;
    float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1511 = _1501 + _1509;
    float _1513 = _1507 * _1507;
    float _1515 = _1511 * _1511;
    float _1517 = _1513 + _1515;
    float _1519 = sqrt(_1517);
    bool _1521 = _1519 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1523 = _1497;
    float _1525 = _1469;
    float _1527 = _1491;
    float _1529 = _1515;
    float _1531 = _1499;
    if (!_1521)
    {
        _1523 = _1513;
    }
    float _1533 = _1523;
    float _1535 = _1533;
    if (!_1521)
    {
        _1525 = _1501;
    }
    float _1537 = _1525;
    float _1539 = _1537;
    if (!_1521)
    {
        _1527 = _1503;
    }
    float _1541 = _1527;
    bool _1543 = !_1521;
    float _1545 = _1541;
    if (!_1543)
    {
        float _1547 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1551 = _1519 + _1549;
        float _1553 = _1503 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1555 = rsqrt(_1517);
        float _1557 = _1551 * _1547;
        float _1559 = _1557 * 0.15915493667125701904296875;
        float _1561 = _1559 * 6.283185482025146484375;
        float _1563 = sin(_1561);
        float _1565 = _1559 * 6.283185482025146484375;
        float _1567 = cos(_1565);
        float _1569 = fma(_1563, _1553, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1571 = _1555 * _1569;
        float _1573 = _1567 + (-1.0);
        float _1575 = fma(_1507, _1571, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1577 = fma(_1511, _1571, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1579 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1583 = _1575 + _1581;
        float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1587 = _1577 + _1585;
        float _1589 = fma(_1503, _1567, _1579);
        float _1591 = _1583 * _1583;
        float _1593 = _1587 * _1587;
        _1545 = _1589;
        _1535 = _1591;
        _1529 = _1593;
        _1531 = _1575;
        _1539 = _1577;
    }
    float _1595 = _1545;
    float _1597 = _1535;
    float _1599 = _1529;
    float _1601 = _1531;
    float _1603 = _1539;
    float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1607 = _1595 + _1605;
    float _1609 = fma(_1607, _1607, _1597);
    float _1611 = _1609 + _1599;
    float _1613 = sqrt(_1611);
    bool _1615 = _1613 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1617 = isnan(_1613);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1623 = _1619 || _1621;
    float _1625 = _1609;
    if (!_1623)
    {
        _1625 = 1.0;
    }
    float _1627 = _1625;
    bool _1629 = !_1623;
    float _1631 = _1627;
    if (!_1629)
    {
        bool _1633 = _1613 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1635 = isnan(_1613);
        bool _1637 = _1633 || _1635;
        bool _1639 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1641 = _1637 || _1639;
        if (!_1641)
        {
            float _1643 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1645 = _1613 + _1643;
            float _1647 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1649 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1647;
            float _1651 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1653 = _1651 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1655 = 1.0 / _1649;
            float _1657 = _1645 * _1655;
            float _1659 = fma(_1657, _1653, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1631 = _1659;
            _1661 = true;
        }
        else
        {
            bool _1663 = _1613 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1665 = isnan(_1613);
            bool _1667 = _1663 || _1665;
            bool _1669 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1671 = _1667 || _1669;
            if (!_1671)
            {
                float _1673 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1675 = _1613 + _1673;
                float _1677 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1679 = _1677 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1681 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1683 = _1681 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1685 = 1.0 / _1679;
                float _1687 = _1675 * _1685;
                float _1689 = fma(_1687, _1683, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1631 = _1689;
                _1661 = true;
            }
            else
            {
                _1631 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1661 = false;
    float _1691 = _1631;
    float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1695 = _1595 + _1693;
    float _1697 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1699 = _1601 + _1697;
    float _1701 = _351 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1703 = fma(_1695, _1691, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1705 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1707 = _1603 + _1705;
    float _1709 = fma(_1699, _1691, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1711 = _1701 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1713 = -_1387;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1703);
    float _1717 = fma(_1707, _1691, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1719 = -_1389;
    float _1721 = fma(_1719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1709);
    float _1723 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1725 = -_1395;
    float _1727 = fma(_1725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1717);
    float _1729 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1731 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1733 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1723);
    float _1735 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1737 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1729);
    float _1739 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1731);
    float _1741 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1733);
    float _1743 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1735);
    float _1745 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1737);
    float _1747 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1739);
    float _1749 = _1741 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1751 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1743);
    float _1753 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1755 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1757 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1759 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1761 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1763 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1765 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1757);
    float _1767 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1759);
    float _1769 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1761);
    float _1771 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1773 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1765);
    float _1775 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1767);
    float _1777 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1763);
    float _1779 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1769);
    float _1781 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1773);
    float _1783 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1775);
    float _1785 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1777);
    float _1787 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1779);
    float _1789 = _1781 + _1783;
    float _1791 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1785);
    out.m_35.x = _1711;
    float _1793 = _1789 * 0.5;
    out.gl_Position.x = _1787;
    out.gl_Position.y = _1791;
    out.gl_Position.z = _1781;
    out.gl_Position.w = _1783;
    out.m_52.z = _1793;
    out.m_52.w = _1783;
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
    bool _1661 = false;
    bool _951 = false;
    bool _677 = false;
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
        float _1850 = as_type<float>(_87);
        out.gl_Position.z = _1850;
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
        float _1919 = as_type<float>(_123);
        out.gl_Position.z = _1919;
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
    float _147 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    float _149 = in.m_37.x;
    float _151 = in.m_37.y;
    float _153 = in.m_37.z;
    float _155 = _147 * 6.283185482025146484375;
    float _157 = floor(_147);
    int _159 = as_type<int>(_131) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_131) & 2;
    bool _165 = _163 != 0;
    float _167 = _131;
    float _169 = _133;
    if (!_143)
    {
        float _171 = _133 * _133;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _155 * 0.15915493667125701904296875;
    float _179 = _175;
    if (!_143)
    {
        float _181 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _177 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_161;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = -_157;
    float _199 = _147 + _197;
    bool _201 = !_165;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_143;
    float _207 = _183;
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
        _169 = _261;
    }
    float _263 = _169;
    float _265 = fma(_191, 0.5, 0.5);
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _269 = _267 != 0;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _273 = _271 != 0;
    float _275 = in.m_44.w;
    bool _277 = _199 < 0.5;
    float _279 = float(_277);
    float _281 = -_199;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _287 = in.m_32.x;
    float _289 = in.m_32.y;
    float _291 = in.m_32.z;
    bool _293 = !_269;
    int _295 = _293 ? 0 : 1;
    float _297 = -_279;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_265;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _305 = !_187;
    int _307 = _305 ? 0 : 1;
    int _309 = abs(_295);
    float _311 = fma(_263, _149, _285);
    bool _313 = !_273;
    int _315 = _313 ? 0 : 1;
    float _317 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _321 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _323 = abs(_307);
    float _325 = fma(_263, _151, _317);
    int _327 = abs(_315);
    float _329 = fma(_263, _153, _321);
    float _331 = float(_309);
    float _333 = float(_323);
    float _335 = abs(_283);
    float _337 = _331 * _335;
    float _339 = float(_327);
    float _341 = fma(_333, _303, _337);
    float _343 = fma(_311, _275, _287);
    float _345 = fma(_325, _275, _289);
    float _347 = fma(_329, _275, _291);
    float _349 = abs(_299);
    float _351 = fma(_339, _349, _341);
    bool _353 = !_319;
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
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _389;
    float _393 = 1.0 / _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _407 = 1.0 / _391;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _411 = _379 + _409;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _417 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _421 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = 1.0 / _387;
    float _425 = _411 * _393;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _429 = _379 + _427;
    out.m_46.x = _417;
    out.m_46.y = _419;
    out.m_46.z = _421;
    out.m_46.w = _415;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _433 = _379 + _431;
    bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _437 = 1.0 / _397;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _441 = _379 + _439;
    float _443 = _429 * _407;
    bool _445 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _447 = isnan(_379);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = 1.0 / _401;
    float _459 = _441 * _423;
    bool _461 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _463 = isnan(_379);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    bool _473 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _475 = isnan(_379);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    bool _485 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _487 = isnan(_379);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -_471;
    float _499 = _497 + 1.0;
    bool _501 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _503 = isnan(_379);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _515 = _379 + _513;
    float _517 = -_483;
    float _519 = _517 + 1.0;
    float _521 = -_495;
    float _523 = _521 + 1.0;
    float _525 = _515 * _437;
    float _527 = -_455;
    float _529 = _527 + 1.0;
    float _531 = _495 * _519;
    float _533 = _433 * _457;
    float _535 = _455 * _499;
    float _537 = _483 * _529;
    bool _539 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _541 = isnan(_379);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _563 = -_549;
    float _565 = _563 + 1.0;
    float _567 = fma(_553, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _569 = fma(_557, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _571 = _549 * _523;
    float _573 = _511 * _565;
    float _575 = fma(_561, _459, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _577;
    float _581 = -_511;
    float _583 = _581 + 1.0;
    float _585 = _567 * _573;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _591 = _569 * _573;
    float _593 = fma(_579, _443, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _595 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[143].x, _585);
    float _597 = fma(_589, _459, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _599;
    float _603 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[143].y, _591);
    float _605 = in.m_44.x;
    float _607 = in.m_44.y;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _617 = fma(_601, _443, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _619 = fma(_575, _571, _595);
    float _621 = fma(_597, _571, _603);
    float _623 = fma(_615, _533, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _625;
    float _629 = fma(_611, _533, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _631;
    float _635 = fma(_593, _531, _619);
    float _637 = fma(_617, _531, _621);
    float _639 = fma(_627, _525, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _641 = fma(_633, _525, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _643 = fma(_629, _537, _635);
    float _645 = fma(_623, _537, _637);
    float _647 = fma(_639, _535, _643);
    float _649 = fma(_641, _535, _645);
    float _651 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[148].x, _647);
    float _653 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[148].y, _649);
    float _655 = _651 * _605;
    float _657 = _653 * _607;
    bool _659 = !_435;
    float _675;
    if (!_659)
    {
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _663 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        float _679 = float(_71);
        float _681 = 1.0 / _679;
        float _683 = _105 * _681;
        _675 = _683;
    }
    _677 = false;
    float _685 = _675;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _689 = _685 + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _693 = _685 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _711 = 1.0 / _697;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _715 = _685 + _713;
    bool _717 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _719 = isnan(_685);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = 1.0 / _701;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _733 = _685 + _731;
    bool _735 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _737 = 1.0 / _709;
    float _739 = _715 * _711;
    bool _741 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _743 = isnan(_685);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = 1.0 / _705;
    float _755 = _689 * _729;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _757;
    float _761 = _733 * _737;
    bool _763 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _765 = isnan(_685);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    bool _775 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _777 = isnan(_685);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = fma(_759, _739, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _789 = -_773;
    float _791 = _789 + 1.0;
    float _793 = _693 * _753;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _799;
    float _803 = _751 * _791;
    float _805 = -_785;
    float _807 = _805 + 1.0;
    float _809 = fma(_797, _739, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _811 = fma(_801, _739, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _813 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _815 = isnan(_685);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = -_751;
    float _827 = _825 + 1.0;
    float _829 = _823 * _807;
    float _831 = _785 * _827;
    float _833 = -_823;
    float _835 = _833 + 1.0;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _849 = _727 * _835;
    float _851 = fma(_839, _755, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _853 = fma(_843, _755, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _855 = fma(_847, _755, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _857 = _787 * _849;
    float _859 = _809 * _849;
    float _861 = -_727;
    float _863 = _861 + 1.0;
    float _865 = _811 * _849;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _867;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _871;
    float _875 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].x, _857);
    float _877 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].z, _865);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _879;
    float _883 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].y, _859);
    float _885 = fma(_869, _793, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _887 = fma(_873, _793, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _889 = fma(_851, _829, _875);
    float _891 = fma(_855, _829, _877);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _901 = fma(_881, _793, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _903 = fma(_853, _829, _883);
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _909 = fma(_885, _831, _889);
    float _911 = fma(_895, _761, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _913 = fma(_899, _761, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _915 = fma(_907, _761, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _917 = fma(_887, _831, _903);
    float _919 = fma(_901, _831, _891);
    float _921 = fma(_911, _803, _909);
    float _923 = fma(_913, _803, _917);
    float _925 = fma(_915, _803, _919);
    float _927 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[127].x, _921);
    float _929 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[127].y, _923);
    float _931 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[127].z, _925);
    bool _933 = !_735;
    float _949;
    if (!_933)
    {
        float _935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _937 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _939 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _941 = _939 * _935;
        float _943 = floor(_941);
        float _945 = -_943;
        float _947 = _941 + _945;
        _949 = _947;
        _951 = true;
    }
    else
    {
        float _953 = float(_71);
        float _955 = 1.0 / _953;
        float _957 = _105 * _955;
        _949 = _957;
    }
    _951 = false;
    float _959 = _949;
    float _961 = in.m_39.w;
    float _963 = _345 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _965 = in.m_39.z;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _969 = _967 != 0;
    float _971 = _345 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _975 = _973 != 0;
    float _977 = in.m_39.y;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _981 = _979 != 0;
    float _983 = _345 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _987 = _985 != 0;
    float _989 = _345 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _991 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[14].x, _963);
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _997 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[14].y, _971);
    float _999 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[14].z, _983);
    float _1001 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[14].w, _989);
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1005 = _961 > 0.5;
    float _1007 = _125 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1013 = _965 > 0.5;
    float _1015 = -_995;
    float _1017 = fma(_1007, 2.0, _1015);
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1021 = _977 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1023 = _125 > 0.5;
    float _1025 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1003);
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1031 = fma(_1021, -2.0, _993);
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1035 = _1033 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1037 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[16].y, _997);
    float _1039 = 1.0 / _1029;
    float _1041 = -_195;
    int _1043 = _1023 ? as_type<int>(_1041) : as_type<int>(_195);
    float _1045 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1019);
    float _1047 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[16].x, _991);
    bool _1049 = _977 > 0.5;
    float _1051 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[16].z, _999);
    float _1053 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1001);
    float _1055 = 1.0 / _1035;
    float _1057 = _1047 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1059 = _1053 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1061 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _1063 = 1.0 / _1011;
    float _1065 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _1067 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _1069 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _1061);
    float _1071 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _1065);
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1081 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _1067);
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1083;
    float _1087 = _1075 * _1039;
    float _1089 = _1079 * _1055;
    bool _1091 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1093 = isnan(_959);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = _1085 * _1063;
    float _1105 = -_105;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1017);
    float _1109 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _1071);
    float _1111 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _1069);
    float _1113 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1025);
    float _1115 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1031);
    float _1117 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1045);
    bool _1119 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1121 = isnan(_959);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = -_1101;
    float _1133 = _1131 + 1.0;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1137 = _959 + _1135;
    bool _1139 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1141 = isnan(_959);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = sqrt(_1109);
    float _1153 = _1129 * _1133;
    float _1155 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _1081);
    float _1157 = fma(_1087, _1137, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1159 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1161 = isnan(_959);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    float _1171 = -_1149;
    float _1173 = _1171 + 1.0;
    float _1175 = -_1129;
    float _1177 = _1175 + 1.0;
    bool _1179 = !_969;
    float _1181 = _1179 ? _195 : as_type<float>(_1043);
    float _1183 = sqrt(_1111);
    float _1185 = -_1113;
    float _1187 = _1185 + 1.0;
    float _1189 = _1149 * _1177;
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1193 = _959 + _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1197 = _959 + _1195;
    float _1199 = _927 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1201 = fma(_1103, _1193, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1203 = sqrt(_1155);
    float _1205 = _1169 * _1173;
    float _1207 = -_1169;
    float _1209 = _1207 + 1.0;
    float _1211 = fma(_1089, _1197, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1213 = _1157 * _1205;
    float _1215 = _1037 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1217 = _1051 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1221 = _1183 * _1057;
    float _1223 = _1151 * _1215;
    float _1225 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1213);
    float _1227 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1229 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1231 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1233 = _1203 * _1217;
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1227);
    float _1237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1239 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1229);
    float _1241 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1231);
    float _1243 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1235);
    float _1245 = -_203;
    int _1247 = _1049 ? as_type<int>(_1245) : as_type<int>(_203);
    float _1249 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1251 = _1181 + 0.5;
    float _1253 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1239);
    bool _1255 = !_975;
    float _1257 = _1255 ? _203 : as_type<float>(_1247);
    float _1259 = fma(_1211, _1189, _1225);
    float _1261 = fma(_1249, _1251, _1107);
    float _1263 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1241);
    float _1265 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1243);
    float _1267 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1253);
    float _1269 = _1257 + (-0.5);
    float _1271 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1263);
    float _1273 = _1265 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1275 = _1267 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1277 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1279 = _1271 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1283 = _1273 + _1281;
    float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1287 = _1275 + _1285;
    float _1289 = -_1277;
    float _1291 = -_1115;
    float _1293 = fma(_1289, _1269, _1291);
    float _1295 = fma(_1201, _1153, _1259);
    float _1297 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1301 = _1279 + _1299;
    float _1303 = -_203;
    int _1305 = _1005 ? as_type<int>(_1303) : as_type<int>(_203);
    float _1307 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1295);
    float _1309 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1297);
    float _1311 = -_1187;
    float _1313 = fma(_1181, _1311, _1261);
    float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1317 = _1283 * _1283;
    float _1319 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1309);
    bool _1321 = !_987;
    float _1323 = _1321 ? _203 : as_type<float>(_1305);
    float _1325 = -_1117;
    float _1327 = _1325 + 1.0;
    float _1329 = fma(_1287, _1287, _1317);
    float _1331 = -_195;
    int _1333 = _1013 ? as_type<int>(_1331) : as_type<int>(_195);
    float _1335 = _931 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1337 = _1319 >= 0.0;
    float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1341 = -_1323;
    float _1343 = _1341 + 0.5;
    float _1345 = fma(_1301, _1301, _1329);
    bool _1347 = !_981;
    float _1349 = _1347 ? _195 : as_type<float>(_1333);
    float _1351 = fma(_1257, _1327, _1293);
    float _1353 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1355 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1357 = _1349 + 0.5;
    float _1359 = rsqrt(_1345);
    float _1361 = _1353 * _1315;
    float _1363 = _929 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1365 = _1343;
    int _1367 = as_type<int>(_1363);
    if (_1337)
    {
        _1365 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1369 = _1365;
    float _1371 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1373 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1375 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1307 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1379 = _1371 * _1339;
    if (_1337)
    {
        float _1381 = _1369 * 5.0;
        _1367 = as_type<int>(_1381);
    }
    int _1383 = _1367;
    float _1385 = as_type<float>(_1383);
    if (_1337)
    {
        out.m_35.x = 0.0;
    }
    out.m_48.x = _1313;
    out.m_48.y = _1351;
    out.m_48.z = _1379;
    out.m_48.w = _1361;
    float _1387 = _1283 * _1359;
    float _1389 = _1287 * _1359;
    out.m_50.x = _1373;
    out.m_50.y = _1375;
    out.m_50.z = _1355;
    out.m_50.w = _1377;
    if (_1337)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4049 = as_type<float>(_1383);
        out.gl_Position.z = _4049;
    }
    if (_1337)
    {
        return out;
    }
    float _1391 = -_1387;
    float _1393 = fma(_1391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1273);
    float _1395 = _1301 * _1359;
    float _1397 = -_1389;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1275);
    float _1401 = -_1387;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1407 = _1393 + _1405;
    float _1409 = -_1395;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1279);
    float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1415 = _1399 + _1413;
    float _1417 = -_1389;
    float _1419 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1287);
    float _1421 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1425 = _1411 + _1423;
    float _1427 = _1403 * _1403;
    float _1429 = -_1395;
    float _1431 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1301);
    float _1433 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1421);
    float _1435 = fma(_1419, _1419, _1427);
    float _1437 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1433);
    float _1439 = fma(_1431, _1431, _1435);
    bool _1441 = _1437 >= 0.0;
    float _1443 = sqrt(_1439);
    if (_1441)
    {
        _1385 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1445 = _1385;
    int _1447 = as_type<int>(_1445);
    if (_1441)
    {
        out.m_35.x = 0.0;
    }
    float _1449 = _1359 * _1443;
    if (_1441)
    {
        float _1451 = _1445 * 5.0;
        _1447 = as_type<int>(_1451);
    }
    int _1453 = _1447;
    if (_1441)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4175 = as_type<float>(_1453);
        out.gl_Position.z = _4175;
    }
    if (_1441)
    {
        return out;
    }
    float _1455 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1457 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1459 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1461 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1463 = _1449 * _1455;
    float _1465 = _1449 * _1457;
    float _1467 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1469 = _1467 * 0.5;
    float _1471 = _1459 * _1463;
    float _1473 = _1461 * _1465;
    float _1475 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1477 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1479 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1481 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1475);
    float _1483 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1477);
    float _1485 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1479);
    float _1487 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1481);
    float _1489 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1483);
    float _1491 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1485);
    float _1493 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1495 = _1489 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1497 = _1491 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1499 = _1275 + _1493;
    float _1501 = _1279 + _1495;
    float _1503 = _1273 + _1497;
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1507 = _1499 + _1505;
    float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1511 = _1501 + _1509;
    float _1513 = _1507 * _1507;
    float _1515 = _1511 * _1511;
    float _1517 = _1513 + _1515;
    float _1519 = sqrt(_1517);
    bool _1521 = _1519 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1523 = _1497;
    float _1525 = _1469;
    float _1527 = _1491;
    float _1529 = _1515;
    float _1531 = _1499;
    if (!_1521)
    {
        _1523 = _1513;
    }
    float _1533 = _1523;
    float _1535 = _1533;
    if (!_1521)
    {
        _1525 = _1501;
    }
    float _1537 = _1525;
    float _1539 = _1537;
    if (!_1521)
    {
        _1527 = _1503;
    }
    float _1541 = _1527;
    bool _1543 = !_1521;
    float _1545 = _1541;
    if (!_1543)
    {
        float _1547 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1551 = _1519 + _1549;
        float _1553 = _1503 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1555 = rsqrt(_1517);
        float _1557 = _1551 * _1547;
        float _1559 = _1557 * 0.15915493667125701904296875;
        float _1561 = _1559 * 6.283185482025146484375;
        float _1563 = sin(_1561);
        float _1565 = _1559 * 6.283185482025146484375;
        float _1567 = cos(_1565);
        float _1569 = fma(_1563, _1553, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1571 = _1555 * _1569;
        float _1573 = _1567 + (-1.0);
        float _1575 = fma(_1507, _1571, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1577 = fma(_1511, _1571, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1579 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1583 = _1575 + _1581;
        float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1587 = _1577 + _1585;
        float _1589 = fma(_1503, _1567, _1579);
        float _1591 = _1583 * _1583;
        float _1593 = _1587 * _1587;
        _1545 = _1589;
        _1535 = _1591;
        _1529 = _1593;
        _1531 = _1575;
        _1539 = _1577;
    }
    float _1595 = _1545;
    float _1597 = _1535;
    float _1599 = _1529;
    float _1601 = _1531;
    float _1603 = _1539;
    float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1607 = _1595 + _1605;
    float _1609 = fma(_1607, _1607, _1597);
    float _1611 = _1609 + _1599;
    float _1613 = sqrt(_1611);
    bool _1615 = _1613 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1617 = isnan(_1613);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1623 = _1619 || _1621;
    float _1625 = _1609;
    if (!_1623)
    {
        _1625 = 1.0;
    }
    float _1627 = _1625;
    bool _1629 = !_1623;
    float _1631 = _1627;
    if (!_1629)
    {
        bool _1633 = _1613 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1635 = isnan(_1613);
        bool _1637 = _1633 || _1635;
        bool _1639 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1641 = _1637 || _1639;
        if (!_1641)
        {
            float _1643 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1645 = _1613 + _1643;
            float _1647 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1649 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1647;
            float _1651 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1653 = _1651 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1655 = 1.0 / _1649;
            float _1657 = _1645 * _1655;
            float _1659 = fma(_1657, _1653, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1631 = _1659;
            _1661 = true;
        }
        else
        {
            bool _1663 = _1613 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1665 = isnan(_1613);
            bool _1667 = _1663 || _1665;
            bool _1669 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1671 = _1667 || _1669;
            if (!_1671)
            {
                float _1673 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1675 = _1613 + _1673;
                float _1677 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1679 = _1677 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1681 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1683 = _1681 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1685 = 1.0 / _1679;
                float _1687 = _1675 * _1685;
                float _1689 = fma(_1687, _1683, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1631 = _1689;
                _1661 = true;
            }
            else
            {
                _1631 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1661 = false;
    float _1691 = _1631;
    float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1695 = _1595 + _1693;
    float _1697 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1699 = _1601 + _1697;
    float _1701 = _351 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1703 = fma(_1695, _1691, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1705 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1707 = _1603 + _1705;
    float _1709 = fma(_1699, _1691, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1711 = _1701 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1713 = -_1387;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1703);
    float _1717 = fma(_1707, _1691, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1719 = -_1389;
    float _1721 = fma(_1719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1709);
    float _1723 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1725 = -_1395;
    float _1727 = fma(_1725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1717);
    float _1729 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1731 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1733 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1723);
    float _1735 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1737 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1729);
    float _1739 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1731);
    float _1741 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1733);
    float _1743 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1735);
    float _1745 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1737);
    float _1747 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1739);
    float _1749 = _1741 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1751 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1743);
    float _1753 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1755 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1757 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1759 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1761 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1763 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1765 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1757);
    float _1767 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1759);
    float _1769 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1761);
    float _1771 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1773 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1765);
    float _1775 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1767);
    float _1777 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1763);
    float _1779 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1769);
    float _1781 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1773);
    float _1783 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1775);
    float _1785 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1777);
    float _1787 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1779);
    float _1789 = _1781 + _1783;
    float _1791 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1785);
    out.m_35.x = _1711;
    float _1793 = _1789 * 0.5;
    out.gl_Position.x = _1787;
    out.gl_Position.y = _1791;
    out.gl_Position.z = _1781;
    out.gl_Position.w = _1783;
    out.m_52.z = _1793;
    out.m_52.w = _1783;
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
    bool _1661 = false;
    bool _951 = false;
    bool _677 = false;
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
        float _1850 = as_type<float>(_87);
        out.gl_Position.z = _1850;
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
        float _1919 = as_type<float>(_123);
        out.gl_Position.z = _1919;
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
    float _147 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    float _149 = in.m_37.x;
    float _151 = in.m_37.y;
    float _153 = in.m_37.z;
    float _155 = _147 * 6.283185482025146484375;
    float _157 = floor(_147);
    int _159 = as_type<int>(_131) & 1;
    bool _161 = _159 != 0;
    int _163 = as_type<int>(_131) & 2;
    bool _165 = _163 != 0;
    float _167 = _131;
    float _169 = _133;
    if (!_143)
    {
        float _171 = _133 * _133;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _155 * 0.15915493667125701904296875;
    float _179 = _175;
    if (!_143)
    {
        float _181 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    int _185 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _187 = _185 != 0;
    float _189 = _177 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_161;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = -_157;
    float _199 = _147 + _197;
    bool _201 = !_165;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_143;
    float _207 = _183;
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
        _169 = _261;
    }
    float _263 = _169;
    float _265 = fma(_191, 0.5, 0.5);
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _269 = _267 != 0;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _273 = _271 != 0;
    float _275 = in.m_44.w;
    bool _277 = _199 < 0.5;
    float _279 = float(_277);
    float _281 = -_199;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _287 = in.m_32.x;
    float _289 = in.m_32.y;
    float _291 = in.m_32.z;
    bool _293 = !_269;
    int _295 = _293 ? 0 : 1;
    float _297 = -_279;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_265;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _305 = !_187;
    int _307 = _305 ? 0 : 1;
    int _309 = abs(_295);
    float _311 = fma(_263, _149, _285);
    bool _313 = !_273;
    int _315 = _313 ? 0 : 1;
    float _317 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _319 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _321 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    int _323 = abs(_307);
    float _325 = fma(_263, _151, _317);
    int _327 = abs(_315);
    float _329 = fma(_263, _153, _321);
    float _331 = float(_309);
    float _333 = float(_323);
    float _335 = abs(_283);
    float _337 = _331 * _335;
    float _339 = float(_327);
    float _341 = fma(_333, _303, _337);
    float _343 = fma(_311, _275, _287);
    float _345 = fma(_325, _275, _289);
    float _347 = fma(_329, _275, _291);
    float _349 = abs(_299);
    float _351 = fma(_339, _349, _341);
    bool _353 = !_319;
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
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _389;
    float _393 = 1.0 / _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _407 = 1.0 / _391;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _411 = _379 + _409;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _417 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _421 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = 1.0 / _387;
    float _425 = _411 * _393;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _429 = _379 + _427;
    out.m_46.x = _417;
    out.m_46.y = _419;
    out.m_46.z = _421;
    out.m_46.w = _415;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _433 = _379 + _431;
    bool _435 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _437 = 1.0 / _397;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _441 = _379 + _439;
    float _443 = _429 * _407;
    bool _445 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _447 = isnan(_379);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = 1.0 / _401;
    float _459 = _441 * _423;
    bool _461 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _463 = isnan(_379);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    bool _473 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _475 = isnan(_379);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    bool _485 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _487 = isnan(_379);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -_471;
    float _499 = _497 + 1.0;
    bool _501 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _503 = isnan(_379);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _515 = _379 + _513;
    float _517 = -_483;
    float _519 = _517 + 1.0;
    float _521 = -_495;
    float _523 = _521 + 1.0;
    float _525 = _515 * _437;
    float _527 = -_455;
    float _529 = _527 + 1.0;
    float _531 = _495 * _519;
    float _533 = _433 * _457;
    float _535 = _455 * _499;
    float _537 = _483 * _529;
    bool _539 = _379 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _541 = isnan(_379);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _551;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _563 = -_549;
    float _565 = _563 + 1.0;
    float _567 = fma(_553, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _569 = fma(_557, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _571 = _549 * _523;
    float _573 = _511 * _565;
    float _575 = fma(_561, _459, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _577;
    float _581 = -_511;
    float _583 = _581 + 1.0;
    float _585 = _567 * _573;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _591 = _569 * _573;
    float _593 = fma(_579, _443, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _595 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[143].x, _585);
    float _597 = fma(_589, _459, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _599;
    float _603 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[143].y, _591);
    float _605 = in.m_44.x;
    float _607 = in.m_44.y;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _617 = fma(_601, _443, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _619 = fma(_575, _571, _595);
    float _621 = fma(_597, _571, _603);
    float _623 = fma(_615, _533, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _625;
    float _629 = fma(_611, _533, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _631;
    float _635 = fma(_593, _531, _619);
    float _637 = fma(_617, _531, _621);
    float _639 = fma(_627, _525, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _641 = fma(_633, _525, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _643 = fma(_629, _537, _635);
    float _645 = fma(_623, _537, _637);
    float _647 = fma(_639, _535, _643);
    float _649 = fma(_641, _535, _645);
    float _651 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[148].x, _647);
    float _653 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[148].y, _649);
    float _655 = _651 * _605;
    float _657 = _653 * _607;
    bool _659 = !_435;
    float _675;
    if (!_659)
    {
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _663 = _125 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[11].z, _105);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        float _679 = float(_71);
        float _681 = 1.0 / _679;
        float _683 = _105 * _681;
        _675 = _683;
    }
    _677 = false;
    float _685 = _675;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _689 = _685 + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _693 = _685 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _711 = 1.0 / _697;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _715 = _685 + _713;
    bool _717 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _719 = isnan(_685);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = 1.0 / _701;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _733 = _685 + _731;
    bool _735 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _737 = 1.0 / _709;
    float _739 = _715 * _711;
    bool _741 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _743 = isnan(_685);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = 1.0 / _705;
    float _755 = _689 * _729;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _757;
    float _761 = _733 * _737;
    bool _763 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _765 = isnan(_685);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    bool _775 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _777 = isnan(_685);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = fma(_759, _739, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _789 = -_773;
    float _791 = _789 + 1.0;
    float _793 = _693 * _753;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _799;
    float _803 = _751 * _791;
    float _805 = -_785;
    float _807 = _805 + 1.0;
    float _809 = fma(_797, _739, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _811 = fma(_801, _739, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _813 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _815 = isnan(_685);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = -_751;
    float _827 = _825 + 1.0;
    float _829 = _823 * _807;
    float _831 = _785 * _827;
    float _833 = -_823;
    float _835 = _833 + 1.0;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _849 = _727 * _835;
    float _851 = fma(_839, _755, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _853 = fma(_843, _755, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _855 = fma(_847, _755, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _857 = _787 * _849;
    float _859 = _809 * _849;
    float _861 = -_727;
    float _863 = _861 + 1.0;
    float _865 = _811 * _849;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _867;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _871;
    float _875 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].x, _857);
    float _877 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].z, _865);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _879;
    float _883 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].y, _859);
    float _885 = fma(_869, _793, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _887 = fma(_873, _793, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _889 = fma(_851, _829, _875);
    float _891 = fma(_855, _829, _877);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _901 = fma(_881, _793, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _903 = fma(_853, _829, _883);
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _909 = fma(_885, _831, _889);
    float _911 = fma(_895, _761, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _913 = fma(_899, _761, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _915 = fma(_907, _761, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _917 = fma(_887, _831, _903);
    float _919 = fma(_901, _831, _891);
    float _921 = fma(_911, _803, _909);
    float _923 = fma(_913, _803, _917);
    float _925 = fma(_915, _803, _919);
    float _927 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[127].x, _921);
    float _929 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[127].y, _923);
    float _931 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[127].z, _925);
    bool _933 = !_735;
    float _949;
    if (!_933)
    {
        float _935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _937 = _125 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _939 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[11].w, _105);
        float _941 = _939 * _935;
        float _943 = floor(_941);
        float _945 = -_943;
        float _947 = _941 + _945;
        _949 = _947;
        _951 = true;
    }
    else
    {
        float _953 = float(_71);
        float _955 = 1.0 / _953;
        float _957 = _105 * _955;
        _949 = _957;
    }
    _951 = false;
    float _959 = _949;
    float _961 = in.m_39.w;
    float _963 = _345 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _965 = in.m_39.z;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _969 = _967 != 0;
    float _971 = _345 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _975 = _973 != 0;
    float _977 = in.m_39.y;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _981 = _979 != 0;
    float _983 = _345 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _987 = _985 != 0;
    float _989 = _345 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _991 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[14].x, _963);
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _997 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[14].y, _971);
    float _999 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[14].z, _983);
    float _1001 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[14].w, _989);
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1005 = _961 > 0.5;
    float _1007 = _125 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1013 = _965 > 0.5;
    float _1015 = -_995;
    float _1017 = fma(_1007, 2.0, _1015);
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1021 = _977 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1023 = _125 > 0.5;
    float _1025 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1003);
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1031 = fma(_1021, -2.0, _993);
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1035 = _1033 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1037 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[16].y, _997);
    float _1039 = 1.0 / _1029;
    float _1041 = -_195;
    int _1043 = _1023 ? as_type<int>(_1041) : as_type<int>(_195);
    float _1045 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1019);
    float _1047 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[16].x, _991);
    bool _1049 = _977 > 0.5;
    float _1051 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[16].z, _999);
    float _1053 = fma(_347, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1001);
    float _1055 = 1.0 / _1035;
    float _1057 = _1047 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1059 = _1053 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1061 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _1063 = 1.0 / _1011;
    float _1065 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _1067 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _1069 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _1061);
    float _1071 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _1065);
    float _1073 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1081 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _1067);
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1083;
    float _1087 = _1075 * _1039;
    float _1089 = _1079 * _1055;
    bool _1091 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1093 = isnan(_959);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = _1085 * _1063;
    float _1105 = -_105;
    float _1107 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1017);
    float _1109 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _1071);
    float _1111 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _1069);
    float _1113 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1025);
    float _1115 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1031);
    float _1117 = fma(_105, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1045);
    bool _1119 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1121 = isnan(_959);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = -_1101;
    float _1133 = _1131 + 1.0;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1137 = _959 + _1135;
    bool _1139 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1141 = isnan(_959);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = sqrt(_1109);
    float _1153 = _1129 * _1133;
    float _1155 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _1081);
    float _1157 = fma(_1087, _1137, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1159 = _959 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1161 = isnan(_959);
    bool _1163 = _1159 || _1161;
    bool _1165 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1167 = _1163 || _1165;
    float _1169 = float(_1167);
    float _1171 = -_1149;
    float _1173 = _1171 + 1.0;
    float _1175 = -_1129;
    float _1177 = _1175 + 1.0;
    bool _1179 = !_969;
    float _1181 = _1179 ? _195 : as_type<float>(_1043);
    float _1183 = sqrt(_1111);
    float _1185 = -_1113;
    float _1187 = _1185 + 1.0;
    float _1189 = _1149 * _1177;
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1193 = _959 + _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1197 = _959 + _1195;
    float _1199 = _927 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1201 = fma(_1103, _1193, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1203 = sqrt(_1155);
    float _1205 = _1169 * _1173;
    float _1207 = -_1169;
    float _1209 = _1207 + 1.0;
    float _1211 = fma(_1089, _1197, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1213 = _1157 * _1205;
    float _1215 = _1037 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1217 = _1051 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1221 = _1183 * _1057;
    float _1223 = _1151 * _1215;
    float _1225 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1213);
    float _1227 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1229 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1231 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1233 = _1203 * _1217;
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1227);
    float _1237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1239 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1229);
    float _1241 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1231);
    float _1243 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1235);
    float _1245 = -_203;
    int _1247 = _1049 ? as_type<int>(_1245) : as_type<int>(_203);
    float _1249 = _1219 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1251 = _1181 + 0.5;
    float _1253 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1239);
    bool _1255 = !_975;
    float _1257 = _1255 ? _203 : as_type<float>(_1247);
    float _1259 = fma(_1211, _1189, _1225);
    float _1261 = fma(_1249, _1251, _1107);
    float _1263 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1241);
    float _1265 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1243);
    float _1267 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1253);
    float _1269 = _1257 + (-0.5);
    float _1271 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1263);
    float _1273 = _1265 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1275 = _1267 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1277 = _1237 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1279 = _1271 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1283 = _1273 + _1281;
    float _1285 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1287 = _1275 + _1285;
    float _1289 = -_1277;
    float _1291 = -_1115;
    float _1293 = fma(_1289, _1269, _1291);
    float _1295 = fma(_1201, _1153, _1259);
    float _1297 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1301 = _1279 + _1299;
    float _1303 = -_203;
    int _1305 = _1005 ? as_type<int>(_1303) : as_type<int>(_203);
    float _1307 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1295);
    float _1309 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1297);
    float _1311 = -_1187;
    float _1313 = fma(_1181, _1311, _1261);
    float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1317 = _1283 * _1283;
    float _1319 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1309);
    bool _1321 = !_987;
    float _1323 = _1321 ? _203 : as_type<float>(_1305);
    float _1325 = -_1117;
    float _1327 = _1325 + 1.0;
    float _1329 = fma(_1287, _1287, _1317);
    float _1331 = -_195;
    int _1333 = _1013 ? as_type<int>(_1331) : as_type<int>(_195);
    float _1335 = _931 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1337 = _1319 >= 0.0;
    float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1341 = -_1323;
    float _1343 = _1341 + 0.5;
    float _1345 = fma(_1301, _1301, _1329);
    bool _1347 = !_981;
    float _1349 = _1347 ? _195 : as_type<float>(_1333);
    float _1351 = fma(_1257, _1327, _1293);
    float _1353 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1355 = _1335 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1357 = _1349 + 0.5;
    float _1359 = rsqrt(_1345);
    float _1361 = _1353 * _1315;
    float _1363 = _929 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1365 = _1343;
    int _1367 = as_type<int>(_1363);
    if (_1337)
    {
        _1365 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1369 = _1365;
    float _1371 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1373 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1375 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1307 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1379 = _1371 * _1339;
    if (_1337)
    {
        float _1381 = _1369 * 5.0;
        _1367 = as_type<int>(_1381);
    }
    int _1383 = _1367;
    float _1385 = as_type<float>(_1383);
    if (_1337)
    {
        out.m_35.x = 0.0;
    }
    out.m_48.x = _1313;
    out.m_48.y = _1351;
    out.m_48.z = _1379;
    out.m_48.w = _1361;
    float _1387 = _1283 * _1359;
    float _1389 = _1287 * _1359;
    out.m_50.x = _1373;
    out.m_50.y = _1375;
    out.m_50.z = _1355;
    out.m_50.w = _1377;
    if (_1337)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4049 = as_type<float>(_1383);
        out.gl_Position.z = _4049;
    }
    if (_1337)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1391 = -_1387;
    float _1393 = fma(_1391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1273);
    float _1395 = _1301 * _1359;
    float _1397 = -_1389;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1275);
    float _1401 = -_1387;
    float _1403 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1407 = _1393 + _1405;
    float _1409 = -_1395;
    float _1411 = fma(_1409, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1279);
    float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1415 = _1399 + _1413;
    float _1417 = -_1389;
    float _1419 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1287);
    float _1421 = _1407 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1425 = _1411 + _1423;
    float _1427 = _1403 * _1403;
    float _1429 = -_1395;
    float _1431 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1301);
    float _1433 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1421);
    float _1435 = fma(_1419, _1419, _1427);
    float _1437 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1433);
    float _1439 = fma(_1431, _1431, _1435);
    bool _1441 = _1437 >= 0.0;
    float _1443 = sqrt(_1439);
    if (_1441)
    {
        _1385 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1445 = _1385;
    int _1447 = as_type<int>(_1445);
    if (_1441)
    {
        out.m_35.x = 0.0;
    }
    float _1449 = _1359 * _1443;
    if (_1441)
    {
        float _1451 = _1445 * 5.0;
        _1447 = as_type<int>(_1451);
    }
    int _1453 = _1447;
    if (_1441)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4175 = as_type<float>(_1453);
        out.gl_Position.z = _4175;
    }
    if (_1441)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1455 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1457 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1459 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1461 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1463 = _1449 * _1455;
    float _1465 = _1449 * _1457;
    float _1467 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1469 = _1467 * 0.5;
    float _1471 = _1459 * _1463;
    float _1473 = _1461 * _1465;
    float _1475 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1477 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1479 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1481 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1475);
    float _1483 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1477);
    float _1485 = fma(_1473, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1479);
    float _1487 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1481);
    float _1489 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1483);
    float _1491 = fma(_1469, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1485);
    float _1493 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1495 = _1489 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1497 = _1491 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1499 = _1275 + _1493;
    float _1501 = _1279 + _1495;
    float _1503 = _1273 + _1497;
    float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1507 = _1499 + _1505;
    float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1511 = _1501 + _1509;
    float _1513 = _1507 * _1507;
    float _1515 = _1511 * _1511;
    float _1517 = _1513 + _1515;
    float _1519 = sqrt(_1517);
    bool _1521 = _1519 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1523 = _1497;
    float _1525 = _1469;
    float _1527 = _1491;
    float _1529 = _1515;
    float _1531 = _1499;
    if (!_1521)
    {
        _1523 = _1513;
    }
    float _1533 = _1523;
    float _1535 = _1533;
    if (!_1521)
    {
        _1525 = _1501;
    }
    float _1537 = _1525;
    float _1539 = _1537;
    if (!_1521)
    {
        _1527 = _1503;
    }
    float _1541 = _1527;
    bool _1543 = !_1521;
    float _1545 = _1541;
    if (!_1543)
    {
        float _1547 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1551 = _1519 + _1549;
        float _1553 = _1503 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1555 = rsqrt(_1517);
        float _1557 = _1551 * _1547;
        float _1559 = _1557 * 0.15915493667125701904296875;
        float _1561 = _1559 * 6.283185482025146484375;
        float _1563 = sin(_1561);
        float _1565 = _1559 * 6.283185482025146484375;
        float _1567 = cos(_1565);
        float _1569 = fma(_1563, _1553, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1571 = _1555 * _1569;
        float _1573 = _1567 + (-1.0);
        float _1575 = fma(_1507, _1571, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1577 = fma(_1511, _1571, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1579 = _1573 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1583 = _1575 + _1581;
        float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1587 = _1577 + _1585;
        float _1589 = fma(_1503, _1567, _1579);
        float _1591 = _1583 * _1583;
        float _1593 = _1587 * _1587;
        _1545 = _1589;
        _1535 = _1591;
        _1529 = _1593;
        _1531 = _1575;
        _1539 = _1577;
    }
    float _1595 = _1545;
    float _1597 = _1535;
    float _1599 = _1529;
    float _1601 = _1531;
    float _1603 = _1539;
    float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1607 = _1595 + _1605;
    float _1609 = fma(_1607, _1607, _1597);
    float _1611 = _1609 + _1599;
    float _1613 = sqrt(_1611);
    bool _1615 = _1613 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1617 = isnan(_1613);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1623 = _1619 || _1621;
    float _1625 = _1609;
    if (!_1623)
    {
        _1625 = 1.0;
    }
    float _1627 = _1625;
    bool _1629 = !_1623;
    float _1631 = _1627;
    if (!_1629)
    {
        bool _1633 = _1613 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1635 = isnan(_1613);
        bool _1637 = _1633 || _1635;
        bool _1639 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1641 = _1637 || _1639;
        if (!_1641)
        {
            float _1643 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1645 = _1613 + _1643;
            float _1647 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1649 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1647;
            float _1651 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1653 = _1651 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1655 = 1.0 / _1649;
            float _1657 = _1645 * _1655;
            float _1659 = fma(_1657, _1653, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1631 = _1659;
            _1661 = true;
        }
        else
        {
            bool _1663 = _1613 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1665 = isnan(_1613);
            bool _1667 = _1663 || _1665;
            bool _1669 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1671 = _1667 || _1669;
            if (!_1671)
            {
                float _1673 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1675 = _1613 + _1673;
                float _1677 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1679 = _1677 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1681 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1683 = _1681 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1685 = 1.0 / _1679;
                float _1687 = _1675 * _1685;
                float _1689 = fma(_1687, _1683, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1631 = _1689;
                _1661 = true;
            }
            else
            {
                _1631 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1661 = false;
    float _1691 = _1631;
    float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1695 = _1595 + _1693;
    float _1697 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1699 = _1601 + _1697;
    float _1701 = _351 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1703 = fma(_1695, _1691, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1705 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1707 = _1603 + _1705;
    float _1709 = fma(_1699, _1691, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1711 = _1701 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1713 = -_1387;
    float _1715 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1703);
    float _1717 = fma(_1707, _1691, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1719 = -_1389;
    float _1721 = fma(_1719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1709);
    float _1723 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1725 = -_1395;
    float _1727 = fma(_1725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1717);
    float _1729 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1731 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1733 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1723);
    float _1735 = _1715 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1737 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1729);
    float _1739 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1731);
    float _1741 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1733);
    float _1743 = fma(_1721, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1735);
    float _1745 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1737);
    float _1747 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1739);
    float _1749 = _1741 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1751 = fma(_1727, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1743);
    float _1753 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1755 = _1747 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1757 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1759 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1761 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1763 = _1749 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1765 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1757);
    float _1767 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1759);
    float _1769 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1761);
    float _1771 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1773 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1765);
    float _1775 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1767);
    float _1777 = fma(_1753, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1763);
    float _1779 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1769);
    float _1781 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1773);
    float _1783 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1775);
    float _1785 = fma(_1755, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1777);
    float _1787 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1779);
    float _1789 = _1781 + _1783;
    float _1791 = fma(_1771, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1785);
    out.m_35.x = _1711;
    float _1793 = _1789 * 0.5;
    out.gl_Position.x = _1787;
    out.gl_Position.y = _1791;
    out.gl_Position.z = _1781;
    out.gl_Position.w = _1783;
    out.m_52.z = _1793;
    out.m_52.w = _1783;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_35.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_35.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_35.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_35.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_48.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_48.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_48.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_48.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

