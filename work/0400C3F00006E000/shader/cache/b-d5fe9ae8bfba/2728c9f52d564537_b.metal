#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

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
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_60 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_68 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1141 = false;
    bool _309 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1745 = as_type<float>(_103);
        out.gl_Position.z = _1745;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _97 = _125;
    }
    float _127 = _97;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1815 = as_type<float>(_141);
        out.gl_Position.z = _1815;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_51.w;
    float _145 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_49.x;
    float _159 = in.m_49.y;
    float _161 = in.m_49.z;
    float _163 = in.m_44.x;
    float _165 = in.m_44.y;
    float _167 = in.m_44.z;
    float _169 = 0.0;
    if (!_155)
    {
        float _171 = _145 * _145;
        float _173 = _171 * 0.5;
        _169 = _173;
    }
    float _175 = _169;
    float _177 = _175;
    if (!_155)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    bool _183 = !_155;
    float _185 = _181;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _145 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _145);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _221 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _223 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _225 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _227 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _229 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _231 = fma(_221, (*spvDescriptorSet0.vp_c10)._m0[8].x, _225);
    float _233 = fma(_221, (*spvDescriptorSet0.vp_c10)._m0[8].y, _227);
    float _235 = fma(_221, (*spvDescriptorSet0.vp_c10)._m0[8].z, _229);
    float _237 = _227;
    if (!_155)
    {
        _237 = _145;
    }
    float _239 = _237;
    float _241 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[10].x, _231);
    bool _243 = !_155;
    float _245 = _239;
    if (!_243)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _145 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _245 = _265;
    }
    float _267 = _245;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _271 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[10].y, _233);
    float _273 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[10].z, _235);
    float _275 = fma(_267, _157, _241);
    float _277 = fma(_267, _159, _271);
    float _279 = fma(_267, _161, _273);
    float _281 = fma(_275, _143, _163);
    float _283 = fma(_277, _143, _165);
    float _285 = fma(_279, _143, _167);
    bool _287 = !_269;
    float _289 = _285;
    float _307;
    if (!_287)
    {
        float _291 = in.m_53.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_87);
        float _313 = 1.0 / _311;
        float _315 = _121 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    float _319 = in.m_53.z;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _317 + _321;
    float _325 = in.m_53.x;
    float _327 = in.m_53.y;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = _317 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _341;
    float _345 = 1.0 / _335;
    int _347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _349 = _347 != 0;
    int _351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _353 = _351 != 0;
    int _355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _357 = _355 != 0;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _361 = _317 + _359;
    float _363 = 1.0 / _339;
    float _365 = _319 * 2.0;
    float _367 = 1.0 / _343;
    float _369 = _331 * _345;
    float _371 = _325 * 2.0;
    float _373 = _327 + _319;
    float _375 = _373 + (-1.0);
    float _377 = floor(_365);
    float _379 = _323 * _363;
    float _381 = _327 * 2.0;
    float _383 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _385 = floor(_371);
    float _387 = _361 * _367;
    float _389 = _319 + _325;
    float _391 = _319 + (-0.5);
    float _393 = _389 + (-1.0);
    float _395 = floor(_381);
    bool _397 = _377 > 0.0;
    float _399 = _327 + _325;
    bool _401 = _377 >= 0.0;
    bool _403 = isnan(_377);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = _399 + (-1.0);
    float _413 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _415 = log2(_413);
    bool _417 = _385 >= 0.0;
    bool _419 = isnan(_385);
    bool _421 = _417 || _419;
    bool _423 = isnan(0.0);
    bool _425 = _421 || _423;
    float _427 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _429 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _431 = _409 ? 0 : 1;
    bool _433 = _385 > 0.0;
    bool _435 = !_349;
    int _437 = _435 ? 0 : 1;
    bool _439 = _395 > 0.0;
    int _441 = ~_431;
    int _443 = _441 + 1;
    int _445 = _443 + 1;
    int _447 = abs(_437);
    int _449 = _445;
    float _451 = _327;
    if (!_397)
    {
        int _453 = ~_431;
        int _455 = _453 + 1;
        _449 = _455;
    }
    int _457 = _449;
    float _459 = _415 * _121;
    bool _461 = _395 >= 0.0;
    bool _463 = isnan(_395);
    bool _465 = _461 || _463;
    bool _467 = isnan(0.0);
    bool _469 = _465 || _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _471;
    int _475 = _425 ? 0 : 1;
    float _477 = float(_447);
    float _479 = exp2(_459);
    float _481 = float(_457);
    int _483 = _469 ? 0 : 1;
    int _485 = ~_475;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    float _491 = _477 * _481;
    int _493 = _489;
    if (!_433)
    {
        int _495 = ~_475;
        int _497 = _495 + 1;
        _493 = _497;
    }
    int _499 = _493;
    int _501 = ~_483;
    int _503 = _501 + 1;
    int _505 = _503 + 1;
    float _507 = in.m_55.x;
    float _509 = in.m_55.y;
    float _511 = in.m_55.z;
    int _513 = _505;
    if (!_439)
    {
        int _515 = ~_483;
        int _517 = _515 + 1;
        _513 = _517;
    }
    int _519 = _513;
    bool _521 = !_353;
    int _523 = _521 ? 0 : 1;
    bool _525 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _527 = isnan(1.0);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _533 = _529 || _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _537 = 1.0 + _535;
    bool _539 = !_357;
    int _541 = _539 ? 0 : 1;
    float _543 = -_479;
    float _545 = _543 + 1.0;
    int _547 = abs(_523);
    float _549 = 1.0 / _537;
    int _551 = abs(_541);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _553;
    float _557 = float(_499);
    float _559 = fma(_555, _369, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _561 = float(_547);
    float _563 = fma(_473, _369, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _565 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _567 = isnan(0.0);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _573 = _569 || _571;
    float _575 = _491 * (-2.0);
    float _577 = float(_551);
    float _579 = _561 * _557;
    float _581 = float(_519);
    float _583 = as_type<float>(int(gl_VertexIndex));
    float _585 = _573 ? _545 : 0.0;
    float _587 = _579 * (-2.0);
    float _589 = _577 * _581;
    float _591 = fma(_429, _575, _429);
    float _593 = fma(_575, _507, _507);
    float _595 = _325 + (-0.5);
    if (_533)
    {
        float _597 = _585 * _549;
        _123 = _597;
    }
    float _599 = _123;
    bool _601 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _603 = isnan(_317);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _327 + (-0.5);
    float _615 = fma(_587, _509, _509);
    float _617 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[196].x, _593);
    float _619 = fma(_383, _587, _383);
    bool _621 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _623 = isnan(_317);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[196].y, _615);
    float _635 = -_611;
    float _637 = _635 + 1.0;
    bool _639 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _641 = isnan(_317);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = fma(_591, _599, _617);
    bool _653 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _655 = isnan(_317);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _631 * _637;
    float _667 = -_631;
    float _669 = _667 + 1.0;
    float _671 = _589 * (-2.0);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _677 = _651 * 0.15915493667125701904296875;
    float _679 = -_663;
    float _681 = _679 + 1.0;
    float _683 = fma(_671, _511, _511);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _689 = _663 * _669;
    float _691 = _649 * _681;
    float _693 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[196].z, _683);
    float _695 = fma(_675, _379, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _697 = -_649;
    float _699 = _697 + 1.0;
    float _701 = fma(_687, _379, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _703 = in.m_51.x;
    float _705 = in.m_51.y;
    float _707 = fma(_619, _599, _633);
    float _709 = _563 * _691;
    float _711 = _559 * _691;
    float _713 = fma(_427, _671, _427);
    float _715 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[143].y, _709);
    float _717 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[143].x, _711);
    float _719 = _707 * 0.15915493667125701904296875;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _721;
    float _725 = fma(_713, _599, _693);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _727;
    float _731 = fma(_701, _689, _715);
    float _733 = fma(_723, _387, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _735 = fma(_695, _689, _717);
    float _737 = fma(_729, _387, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _739 = _677 * 6.283185482025146484375;
    float _741 = sin(_739);
    float _743 = _725 * 0.15915493667125701904296875;
    float _745 = fma(_733, _665, _735);
    float _747 = fma(_737, _665, _731);
    int _749 = as_type<int>(_583) & 1;
    bool _751 = _749 != 0;
    int _753 = as_type<int>(_583) & 2;
    bool _755 = _753 != 0;
    float _757 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[146].y, _747);
    float _759 = _677 * 6.283185482025146484375;
    float _761 = cos(_759);
    float _763 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[146].x, _745);
    bool _765 = !_755;
    float _767 = _765 ? (-0.5) : 0.5;
    float _769 = _757 * _705;
    bool _771 = !_751;
    float _773 = _771 ? (-0.5) : 0.5;
    float _775 = _763 * _703;
    bool _777 = _325 > 0.5;
    float _779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _767);
    float _781 = _719 * 6.283185482025146484375;
    float _783 = sin(_781);
    float _785 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _787 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _773);
    float _789 = _775 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _791 = _785 * _779;
    float _793 = _789 * _787;
    float _795 = _719 * 6.283185482025146484375;
    float _797 = cos(_795);
    float _799 = _743 * 6.283185482025146484375;
    float _801 = sin(_799);
    float _803 = _761 * _783;
    float _805 = _741 * _783;
    float _807 = _743 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _741 * _797;
    float _813 = _761 * _797;
    float _815 = -_803;
    float _817 = fma(_801, _811, _815);
    float _819 = -_811;
    float _821 = fma(_801, _803, _819);
    float _823 = fma(_801, _813, _805);
    float _825 = fma(_801, _805, _813);
    float _827 = _809 * _791;
    float _829 = _797 * _809;
    float _831 = -_791;
    float _833 = _801 * _831;
    float _835 = _783 * _809;
    float _837 = _761 * _827;
    float _839 = _741 * _827;
    float _841 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _843 = fma(_829, _793, _833);
    float _845 = fma(_823, _793, _837);
    float _847 = fma(_817, _793, _839);
    float _849 = _283 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _851 = fma(_835, _841, _843);
    float _853 = fma(_821, _841, _845);
    float _855 = fma(_825, _841, _847);
    float _857 = _283 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _859 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].x, _849);
    float _861 = _853 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _863 = _853 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _865 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].x, _857);
    float _867 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].z, _859);
    float _869 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _861);
    float _871 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _863);
    float _873 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].z, _865);
    float _875 = _867 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _877 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].z, _869);
    float _879 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].z, _871);
    float _881 = _873 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _883 = _283 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _885 = _877 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _887 = _879 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _889 = _853 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _891 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].x, _883);
    float _893 = _875 + _885;
    float _895 = _881 + _887;
    float _897 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _889);
    float _899 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].z, _891);
    float _901 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _903 = _893 + _901;
    float _905 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _907 = _895 + _905;
    float _909 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].z, _897);
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _913 = _903 * _903;
    float _915 = _907 * _907;
    float _917 = _899 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _919 = _909 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _921 = _913 + _915;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _925 = _923 != 0;
    float _927 = -_773;
    float _929 = _777 ? _927 : _773;
    float _931 = sqrt(_921);
    float _933 = _917 + _919;
    bool _935 = _327 > 0.5;
    bool _937 = !_925;
    float _939 = _937 ? _773 : _929;
    bool _941 = _931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _943 = _929;
    float _945 = _855;
    float _947 = _889;
    if (!_941)
    {
        _943 = _915;
    }
    float _949 = _943;
    float _951 = _949;
    if (!_941)
    {
        _945 = _913;
    }
    float _953 = _945;
    float _955 = _953;
    if (!_941)
    {
        _289 = _893;
    }
    float _957 = _289;
    float _959 = _957;
    if (!_941)
    {
        _451 = _895;
    }
    float _961 = _451;
    float _963 = _961;
    if (!_941)
    {
        _947 = _933;
    }
    float _965 = _947;
    bool _967 = !_941;
    float _969 = _965;
    if (!_967)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _975 = _931 + _973;
        float _977 = rsqrt(_921);
        float _979 = _975 * _971;
        float _981 = _933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _983 = _979 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = _983 * 6.283185482025146484375;
        float _991 = cos(_989);
        float _993 = fma(_987, _981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _995 = _977 * _993;
        float _997 = _991 + (-1.0);
        float _999 = fma(_903, _995, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1001 = fma(_907, _995, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1003 = _997 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1007 = _999 + _1005;
        float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1011 = _1001 + _1009;
        float _1013 = fma(_933, _991, _1003);
        float _1015 = _1007 * _1007;
        float _1017 = _1011 * _1011;
        _969 = _1013;
        _955 = _1015;
        _951 = _1017;
        _959 = _999;
        _963 = _1001;
    }
    float _1019 = _969;
    float _1021 = _955;
    float _1023 = _951;
    float _1025 = _959;
    float _1027 = _963;
    float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1031 = _1019 + _1029;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1035 = _1033 != 0;
    float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1039 = -_767;
    int _1041 = _935 ? as_type<int>(_1039) : as_type<int>(_767);
    float _1043 = fma(_1031, _1031, _1021);
    float _1045 = _939 + 0.5;
    bool _1047 = !_1035;
    float _1049 = _1047 ? _767 : as_type<float>(_1041);
    float _1051 = _1043 + _1023;
    float _1053 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1055 = -_1049;
    float _1057 = _1055 + 0.5;
    float _1059 = sqrt(_1051);
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1073 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1075 = _1053 * _911;
    float _1077 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1081 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1083 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1085 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1087 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = _1073 * _1037;
    bool _1093 = _1059 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1095 = isnan(_1059);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1101 = _1097 || _1099;
    out.m_60.x = _1081;
    out.m_60.y = _1083;
    out.m_60.z = _1085;
    out.m_60.w = _1079;
    out.m_62.x = _1077;
    out.m_62.y = _1087;
    out.m_62.z = _1089;
    out.m_64.x = _1075;
    out.m_64.y = _1091;
    float _1103 = _1069;
    float _1105 = _1037;
    if (!_1101)
    {
        _1103 = 1.0;
    }
    float _1107 = _1103;
    bool _1109 = !_1101;
    float _1111 = _1107;
    if (!_1109)
    {
        bool _1113 = _1059 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1115 = isnan(_1059);
        bool _1117 = _1113 || _1115;
        bool _1119 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1121 = _1117 || _1119;
        if (!_1121)
        {
            float _1123 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1125 = _1059 + _1123;
            float _1127 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1129 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1127;
            float _1131 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1133 = _1131 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1135 = 1.0 / _1129;
            float _1137 = _1125 * _1135;
            float _1139 = fma(_1137, _1133, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1111 = _1139;
            _1141 = true;
        }
        else
        {
            bool _1143 = _1059 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1145 = isnan(_1059);
            bool _1147 = _1143 || _1145;
            bool _1149 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1151 = _1147 || _1149;
            if (!_1151)
            {
                float _1153 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1155 = _1059 + _1153;
                float _1157 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1159 = _1157 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1161 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1163 = _1161 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1165 = 1.0 / _1159;
                float _1167 = _1155 * _1165;
                float _1169 = fma(_1167, _1163, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1111 = _1169;
                _1141 = true;
            }
            else
            {
                _1111 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1141 = false;
    float _1171 = _1111;
    float _1173 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1175 = _1019 + _1173;
    float _1177 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1179 = _1025 + _1177;
    float _1181 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1183 = _1027 + _1181;
    float _1185 = fma(_1175, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1187 = fma(_1179, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1189 = fma(_1183, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1193 = _1185 + _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1197 = _1187 + _1195;
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1201 = _1189 + _1199;
    float _1203 = _1193 * _1193;
    float _1205 = fma(_1197, _1197, _1203);
    float _1207 = fma(_1201, _1201, _1205);
    float _1209 = rsqrt(_1207);
    float _1211 = _1209 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1213 = _1197 * _1211;
    float _1215 = _1201 * _1211;
    float _1217 = _1213 * _1213;
    float _1219 = _1215 * _1215;
    float _1221 = _1217 + _1219;
    float _1223 = sqrt(_1221);
    bool _1225 = _1223 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1227 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1229 = _1223 + _1227;
    float _1231 = _1209;
    float _1233 = _1229;
    float _1235 = _1171;
    float _1237 = _1193;
    float _1239 = _1213;
    if (_1225)
    {
        float _1241 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1231 = _1241;
    }
    float _1243 = _1231;
    float _1245 = _1243;
    if (_1225)
    {
        float _1247 = _1229 * _1243;
        _1233 = _1247;
    }
    float _1249 = _1233;
    if (_1225)
    {
        float _1251 = rsqrt(_1221);
        _1245 = _1251;
    }
    float _1253 = _1245;
    float _1255 = _1253;
    if (_1225)
    {
        float _1257 = _1249 * 0.15915493667125701904296875;
        _1235 = _1257;
    }
    float _1259 = _1235;
    float _1261 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1263 = _1201;
    if (_1225)
    {
        float _1265 = _1259 * 6.283185482025146484375;
        float _1267 = sin(_1265);
        _1263 = _1267;
    }
    float _1269 = _1263;
    float _1271 = precise::max(0.0, _1261);
    float _1273 = _1175;
    float _1275 = _1271;
    if (_1225)
    {
        float _1277 = _1259 * 6.283185482025146484375;
        float _1279 = cos(_1277);
        _1273 = _1279;
    }
    float _1281 = _1273;
    float _1283 = -_1211;
    float _1285 = -_1271;
    float _1287 = fma(_1193, _1283, _1285);
    if (_1225)
    {
        float _1289 = _1287 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1237 = _1289;
    }
    float _1291 = _1237;
    float _1293 = sqrt(_1207);
    float _1295 = _1269;
    float _1297 = _1291;
    if (_1225)
    {
        float _1299 = fma(_1269, _1291, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1295 = _1299;
    }
    float _1301 = _1295;
    float _1303 = _1301;
    if (_1225)
    {
        float _1305 = _1253 * _1301;
        _1105 = _1305;
    }
    float _1307 = _1105;
    if (!_1225)
    {
        _1255 = _1287;
    }
    float _1309 = _1255;
    float _1311 = _1309;
    if (_1225)
    {
        float _1313 = _1281 + (-1.0);
        _1275 = _1313;
    }
    float _1315 = _1275;
    float _1317 = _1315;
    if (_1225)
    {
        float _1319 = _1213 * _1307;
        _1239 = _1319;
    }
    float _1321 = _1239;
    if (!_1225)
    {
        _1303 = _1215;
    }
    float _1323 = _1303;
    float _1325 = _1323;
    if (_1225)
    {
        float _1327 = _1215 * _1307;
        _1325 = _1327;
    }
    float _1329 = _1325;
    if (_1225)
    {
        float _1331 = _1315 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1297 = _1331;
    }
    float _1333 = _1297;
    float _1335 = _1333;
    if (!_1225)
    {
        _1317 = _1217;
    }
    float _1337 = _1317;
    float _1339 = _1337;
    if (_1225)
    {
        float _1341 = _1321 * _1321;
        _1339 = _1341;
    }
    float _1343 = _1339;
    float _1345 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1225)
    {
        float _1347 = fma(_1287, _1281, _1333);
        _1311 = _1347;
    }
    float _1349 = _1311;
    if (!_1225)
    {
        _1335 = _1219;
    }
    float _1351 = _1335;
    float _1353 = _1351;
    if (_1225)
    {
        float _1355 = _1329 * _1329;
        _1353 = _1355;
    }
    float _1357 = _1353;
    float _1359 = fma(_1349, _1349, _1343);
    float _1361 = _1359 + _1357;
    float _1363 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1365 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1367 = fma(_1293, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1365);
    float _1369 = precise::clamp(_1367, 0.0, 1.0);
    float _1371 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1373 = rsqrt(_1361);
    float _1375 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1363);
    float _1377 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1379 = -_1369;
    float _1381 = _1379 + 1.0;
    float _1383 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1371);
    float _1385 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1375);
    float _1387 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1377);
    float _1389 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1345);
    float _1391 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1383);
    float _1393 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1395 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1387);
    float _1397 = abs(_1381);
    float _1399 = log2(_1397);
    float _1401 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1403 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1405 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1407 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1389);
    float _1409 = _1373 * _1321;
    float _1411 = _1373 * _1349;
    float _1413 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1415 = -_1403;
    float _1417 = fma(_1415, _1401, 1.0);
    float _1419 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1421 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1423 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1425 = _1373 * _1329;
    float _1427 = -_1419;
    float _1429 = fma(_1411, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1427);
    float _1431 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1421);
    float _1433 = log2(_1417);
    float _1435 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1437 = -_1425;
    float _1439 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1429);
    float _1441 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1431);
    float _1443 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1445 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1447 = fma(_1439, -0.5, 0.5);
    float _1449 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1441);
    float _1451 = exp2(_1435);
    float _1453 = fma(_1439, 0.5, 0.5);
    float _1455 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1443);
    float _1457 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1445);
    float _1459 = _1411 + 1.0;
    float _1461 = fma(_1453, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1463 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1455);
    float _1465 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1457);
    float _1467 = 1.0 / _1449;
    float _1469 = fma(_1453, _1461, -0.212114393711090087890625);
    float _1471 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1463);
    float _1473 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1465);
    float _1475 = _1433 * 0.693147182464599609375;
    float _1477 = fma(_1453, _1469, 1.570728778839111328125);
    float _1479 = sqrt(_1447);
    float _1481 = -_1411;
    float _1483 = fma(_1451, _1459, _1481);
    float _1485 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1487 = fma(_1483, 0.5, 0.5);
    float _1489 = _1471 * _1467;
    float _1491 = _1473 * _1467;
    float _1493 = fma(_1489, 0.5, 0.5);
    float _1495 = fma(_1491, -0.5, 0.5);
    float _1497 = _1479 * 0.636619746685028076171875;
    float _1499 = -_1477;
    float _1501 = fma(_1497, _1499, 1.0);
    float3 _3996 = float3(_1493, _1495, _1485);
    float _1503 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3996, float3(0.0), isnan(_3996)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3996, float3(0.0), isnan(_3996)), level(0.0)).x;
    float3 _4007 = float3(_1493, _1495, _1485);
    float4 _1506 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4007, float3(0.0), isnan(_4007)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4007, float3(0.0), isnan(_4007)), level(0.0)).xyzw;
    float _1508 = _1506.x;
    float _1510 = _1506.y;
    float _1512 = _1506.z;
    float _1514 = _1506.w;
    float2 _4024 = float2(_1501, _1487);
    float3 _1518 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4024, float2(0.0), isnan(_4024)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4024, float2(0.0), isnan(_4024)), level(0.0)).xyz;
    float _1520 = _1518.x;
    float _1522 = _1518.y;
    float _1524 = _1518.z;
    float _1526 = _917 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1528 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1526);
    float _1530 = _917 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1532 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1528);
    float _1534 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1530);
    bool _1536 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan(0.5);
    bool _1544 = _1540 || _1542;
    float _1546 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1548 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1534);
    float _1550 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1552 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1554 = 1.0 / _1546;
    float _1556 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1558 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1552);
    float _1560 = _1556 + _1546;
    float _1562 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1558);
    float _1564 = exp2(_1550);
    float _1566 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1544)
    {
        _1566 = 1.0;
    }
    float _1568 = _1566;
    float _1570 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1562);
    float _1572 = _1560 * _1554;
    float _1574 = _1572 * 0.5;
    float _1576 = _1568;
    if (!_1544)
    {
        float _1578 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1582 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1580);
        float _1584 = _1578 * 0.15915493667125701904296875;
        float _1586 = _1584 * 6.283185482025146484375;
        float _1588 = cos(_1586);
        float _1590 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1592 = _1590 * 0.15915493667125701904296875;
        float _1594 = _1584 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = 1.0 / _1588;
        float _1600 = _1592 * 6.283185482025146484375;
        float _1602 = cos(_1600);
        float _1604 = _1596 * _1598;
        float _1606 = 1.0 / _1582;
        float _1608 = _1602 * _1604;
        float _1610 = _1592 * 6.283185482025146484375;
        float _1612 = sin(_1610);
        float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1616 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1614;
        float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1620 = _1606 * _1618;
        float _1622 = 1.0 / _1608;
        float _1624 = 1.0 / _1616;
        float _1626 = _1612 * _1622;
        float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1630 = fma(_1626, _1620, _1628);
        float _1632 = _1630 * _1624;
        float _1634 = precise::clamp(_1632, 0.0, 1.0);
        _1576 = _1634;
    }
    float _1636 = _1576;
    float _1638 = _1449 * 0.5;
    float _1640 = -_1564;
    float _1642 = _1640 + 1.0;
    bool _1644 = _1636 > 0.0;
    bool _1646 = isnan(_1636);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan(0.0);
    bool _1652 = _1648 || _1650;
    float _1654 = _1636 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1656 = fma(_1473, -0.5, _1638);
    float _1658 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1660 = _1570 + _1449;
    float _1662 = _1471 + _1449;
    out.gl_Position.x = _1471;
    out.gl_Position.y = _1473;
    out.gl_Position.z = _1570;
    out.gl_Position.w = _1449;
    float _1664 = _1658 * _1503;
    float _1666 = -_1658;
    float _1668 = _1666 + 1.0;
    float _1670 = _1660 * 0.5;
    float _1672 = _1514 * _1664;
    float _1674 = _1524 * _1664;
    float _1676 = _1662 * 0.5;
    float _1678 = _1654 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1680 = fma(_1520, _1672, _1508);
    float _1682 = fma(_1522, _1672, _1510);
    float _1684 = _1514 * _1668;
    float _1686 = fma(_1514, _1674, _1512);
    out.m_66.x = _1676;
    out.m_66.y = _1656;
    out.m_66.z = _1670;
    out.m_66.w = _1449;
    out.m_47.x = _1678;
    out.m_68.x = _1680;
    out.m_68.y = _1682;
    out.m_68.z = _1686;
    out.m_68.w = _1684;
    if (_1652)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1688 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1688;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1141 = false;
    bool _309 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1745 = as_type<float>(_103);
        out.gl_Position.z = _1745;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _97 = _125;
    }
    float _127 = _97;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1815 = as_type<float>(_141);
        out.gl_Position.z = _1815;
    }
    if (_133)
    {
        return out;
    }
    float _143 = in.m_51.w;
    float _145 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_49.x;
    float _159 = in.m_49.y;
    float _161 = in.m_49.z;
    float _163 = in.m_44.x;
    float _165 = in.m_44.y;
    float _167 = in.m_44.z;
    float _169 = 0.0;
    if (!_155)
    {
        float _171 = _145 * _145;
        float _173 = _171 * 0.5;
        _169 = _173;
    }
    float _175 = _169;
    float _177 = _175;
    if (!_155)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    bool _183 = !_155;
    float _185 = _181;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _145 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _145);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _221 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _223 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _225 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _227 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _229 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _231 = fma(_221, (*spvDescriptorSet0.vp_c10)._m0[8].x, _225);
    float _233 = fma(_221, (*spvDescriptorSet0.vp_c10)._m0[8].y, _227);
    float _235 = fma(_221, (*spvDescriptorSet0.vp_c10)._m0[8].z, _229);
    float _237 = _227;
    if (!_155)
    {
        _237 = _145;
    }
    float _239 = _237;
    float _241 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[10].x, _231);
    bool _243 = !_155;
    float _245 = _239;
    if (!_243)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _145 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _245 = _265;
    }
    float _267 = _245;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _271 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[10].y, _233);
    float _273 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[10].z, _235);
    float _275 = fma(_267, _157, _241);
    float _277 = fma(_267, _159, _271);
    float _279 = fma(_267, _161, _273);
    float _281 = fma(_275, _143, _163);
    float _283 = fma(_277, _143, _165);
    float _285 = fma(_279, _143, _167);
    bool _287 = !_269;
    float _289 = _285;
    float _307;
    if (!_287)
    {
        float _291 = in.m_53.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_87);
        float _313 = 1.0 / _311;
        float _315 = _121 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    float _319 = in.m_53.z;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _317 + _321;
    float _325 = in.m_53.x;
    float _327 = in.m_53.y;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = _317 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _341;
    float _345 = 1.0 / _335;
    int _347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _349 = _347 != 0;
    int _351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _353 = _351 != 0;
    int _355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _357 = _355 != 0;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _361 = _317 + _359;
    float _363 = 1.0 / _339;
    float _365 = _319 * 2.0;
    float _367 = 1.0 / _343;
    float _369 = _331 * _345;
    float _371 = _325 * 2.0;
    float _373 = _327 + _319;
    float _375 = _373 + (-1.0);
    float _377 = floor(_365);
    float _379 = _323 * _363;
    float _381 = _327 * 2.0;
    float _383 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _385 = floor(_371);
    float _387 = _361 * _367;
    float _389 = _319 + _325;
    float _391 = _319 + (-0.5);
    float _393 = _389 + (-1.0);
    float _395 = floor(_381);
    bool _397 = _377 > 0.0;
    float _399 = _327 + _325;
    bool _401 = _377 >= 0.0;
    bool _403 = isnan(_377);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = _399 + (-1.0);
    float _413 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _415 = log2(_413);
    bool _417 = _385 >= 0.0;
    bool _419 = isnan(_385);
    bool _421 = _417 || _419;
    bool _423 = isnan(0.0);
    bool _425 = _421 || _423;
    float _427 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _429 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _431 = _409 ? 0 : 1;
    bool _433 = _385 > 0.0;
    bool _435 = !_349;
    int _437 = _435 ? 0 : 1;
    bool _439 = _395 > 0.0;
    int _441 = ~_431;
    int _443 = _441 + 1;
    int _445 = _443 + 1;
    int _447 = abs(_437);
    int _449 = _445;
    float _451 = _327;
    if (!_397)
    {
        int _453 = ~_431;
        int _455 = _453 + 1;
        _449 = _455;
    }
    int _457 = _449;
    float _459 = _415 * _121;
    bool _461 = _395 >= 0.0;
    bool _463 = isnan(_395);
    bool _465 = _461 || _463;
    bool _467 = isnan(0.0);
    bool _469 = _465 || _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _471;
    int _475 = _425 ? 0 : 1;
    float _477 = float(_447);
    float _479 = exp2(_459);
    float _481 = float(_457);
    int _483 = _469 ? 0 : 1;
    int _485 = ~_475;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    float _491 = _477 * _481;
    int _493 = _489;
    if (!_433)
    {
        int _495 = ~_475;
        int _497 = _495 + 1;
        _493 = _497;
    }
    int _499 = _493;
    int _501 = ~_483;
    int _503 = _501 + 1;
    int _505 = _503 + 1;
    float _507 = in.m_55.x;
    float _509 = in.m_55.y;
    float _511 = in.m_55.z;
    int _513 = _505;
    if (!_439)
    {
        int _515 = ~_483;
        int _517 = _515 + 1;
        _513 = _517;
    }
    int _519 = _513;
    bool _521 = !_353;
    int _523 = _521 ? 0 : 1;
    bool _525 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _527 = isnan(1.0);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _533 = _529 || _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _537 = 1.0 + _535;
    bool _539 = !_357;
    int _541 = _539 ? 0 : 1;
    float _543 = -_479;
    float _545 = _543 + 1.0;
    int _547 = abs(_523);
    float _549 = 1.0 / _537;
    int _551 = abs(_541);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _553;
    float _557 = float(_499);
    float _559 = fma(_555, _369, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _561 = float(_547);
    float _563 = fma(_473, _369, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _565 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _567 = isnan(0.0);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _573 = _569 || _571;
    float _575 = _491 * (-2.0);
    float _577 = float(_551);
    float _579 = _561 * _557;
    float _581 = float(_519);
    float _583 = as_type<float>(int(gl_VertexIndex));
    float _585 = _573 ? _545 : 0.0;
    float _587 = _579 * (-2.0);
    float _589 = _577 * _581;
    float _591 = fma(_429, _575, _429);
    float _593 = fma(_575, _507, _507);
    float _595 = _325 + (-0.5);
    if (_533)
    {
        float _597 = _585 * _549;
        _123 = _597;
    }
    float _599 = _123;
    bool _601 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _603 = isnan(_317);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _327 + (-0.5);
    float _615 = fma(_587, _509, _509);
    float _617 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[196].x, _593);
    float _619 = fma(_383, _587, _383);
    bool _621 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _623 = isnan(_317);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[196].y, _615);
    float _635 = -_611;
    float _637 = _635 + 1.0;
    bool _639 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _641 = isnan(_317);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = fma(_591, _599, _617);
    bool _653 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _655 = isnan(_317);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _631 * _637;
    float _667 = -_631;
    float _669 = _667 + 1.0;
    float _671 = _589 * (-2.0);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _677 = _651 * 0.15915493667125701904296875;
    float _679 = -_663;
    float _681 = _679 + 1.0;
    float _683 = fma(_671, _511, _511);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _689 = _663 * _669;
    float _691 = _649 * _681;
    float _693 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[196].z, _683);
    float _695 = fma(_675, _379, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _697 = -_649;
    float _699 = _697 + 1.0;
    float _701 = fma(_687, _379, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _703 = in.m_51.x;
    float _705 = in.m_51.y;
    float _707 = fma(_619, _599, _633);
    float _709 = _563 * _691;
    float _711 = _559 * _691;
    float _713 = fma(_427, _671, _427);
    float _715 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[143].y, _709);
    float _717 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[143].x, _711);
    float _719 = _707 * 0.15915493667125701904296875;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _721;
    float _725 = fma(_713, _599, _693);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _727;
    float _731 = fma(_701, _689, _715);
    float _733 = fma(_723, _387, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _735 = fma(_695, _689, _717);
    float _737 = fma(_729, _387, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _739 = _677 * 6.283185482025146484375;
    float _741 = sin(_739);
    float _743 = _725 * 0.15915493667125701904296875;
    float _745 = fma(_733, _665, _735);
    float _747 = fma(_737, _665, _731);
    int _749 = as_type<int>(_583) & 1;
    bool _751 = _749 != 0;
    int _753 = as_type<int>(_583) & 2;
    bool _755 = _753 != 0;
    float _757 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[146].y, _747);
    float _759 = _677 * 6.283185482025146484375;
    float _761 = cos(_759);
    float _763 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[146].x, _745);
    bool _765 = !_755;
    float _767 = _765 ? (-0.5) : 0.5;
    float _769 = _757 * _705;
    bool _771 = !_751;
    float _773 = _771 ? (-0.5) : 0.5;
    float _775 = _763 * _703;
    bool _777 = _325 > 0.5;
    float _779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _767);
    float _781 = _719 * 6.283185482025146484375;
    float _783 = sin(_781);
    float _785 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _787 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _773);
    float _789 = _775 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _791 = _785 * _779;
    float _793 = _789 * _787;
    float _795 = _719 * 6.283185482025146484375;
    float _797 = cos(_795);
    float _799 = _743 * 6.283185482025146484375;
    float _801 = sin(_799);
    float _803 = _761 * _783;
    float _805 = _741 * _783;
    float _807 = _743 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _741 * _797;
    float _813 = _761 * _797;
    float _815 = -_803;
    float _817 = fma(_801, _811, _815);
    float _819 = -_811;
    float _821 = fma(_801, _803, _819);
    float _823 = fma(_801, _813, _805);
    float _825 = fma(_801, _805, _813);
    float _827 = _809 * _791;
    float _829 = _797 * _809;
    float _831 = -_791;
    float _833 = _801 * _831;
    float _835 = _783 * _809;
    float _837 = _761 * _827;
    float _839 = _741 * _827;
    float _841 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _843 = fma(_829, _793, _833);
    float _845 = fma(_823, _793, _837);
    float _847 = fma(_817, _793, _839);
    float _849 = _283 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _851 = fma(_835, _841, _843);
    float _853 = fma(_821, _841, _845);
    float _855 = fma(_825, _841, _847);
    float _857 = _283 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _859 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].x, _849);
    float _861 = _853 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _863 = _853 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _865 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].x, _857);
    float _867 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].z, _859);
    float _869 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _861);
    float _871 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _863);
    float _873 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].z, _865);
    float _875 = _867 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _877 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].z, _869);
    float _879 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].z, _871);
    float _881 = _873 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _883 = _283 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _885 = _877 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _887 = _879 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _889 = _853 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _891 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].x, _883);
    float _893 = _875 + _885;
    float _895 = _881 + _887;
    float _897 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _889);
    float _899 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].z, _891);
    float _901 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _903 = _893 + _901;
    float _905 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _907 = _895 + _905;
    float _909 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].z, _897);
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _913 = _903 * _903;
    float _915 = _907 * _907;
    float _917 = _899 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _919 = _909 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _921 = _913 + _915;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _925 = _923 != 0;
    float _927 = -_773;
    float _929 = _777 ? _927 : _773;
    float _931 = sqrt(_921);
    float _933 = _917 + _919;
    bool _935 = _327 > 0.5;
    bool _937 = !_925;
    float _939 = _937 ? _773 : _929;
    bool _941 = _931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _943 = _929;
    float _945 = _855;
    float _947 = _889;
    if (!_941)
    {
        _943 = _915;
    }
    float _949 = _943;
    float _951 = _949;
    if (!_941)
    {
        _945 = _913;
    }
    float _953 = _945;
    float _955 = _953;
    if (!_941)
    {
        _289 = _893;
    }
    float _957 = _289;
    float _959 = _957;
    if (!_941)
    {
        _451 = _895;
    }
    float _961 = _451;
    float _963 = _961;
    if (!_941)
    {
        _947 = _933;
    }
    float _965 = _947;
    bool _967 = !_941;
    float _969 = _965;
    if (!_967)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _975 = _931 + _973;
        float _977 = rsqrt(_921);
        float _979 = _975 * _971;
        float _981 = _933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _983 = _979 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = _983 * 6.283185482025146484375;
        float _991 = cos(_989);
        float _993 = fma(_987, _981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _995 = _977 * _993;
        float _997 = _991 + (-1.0);
        float _999 = fma(_903, _995, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1001 = fma(_907, _995, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1003 = _997 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1007 = _999 + _1005;
        float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1011 = _1001 + _1009;
        float _1013 = fma(_933, _991, _1003);
        float _1015 = _1007 * _1007;
        float _1017 = _1011 * _1011;
        _969 = _1013;
        _955 = _1015;
        _951 = _1017;
        _959 = _999;
        _963 = _1001;
    }
    float _1019 = _969;
    float _1021 = _955;
    float _1023 = _951;
    float _1025 = _959;
    float _1027 = _963;
    float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1031 = _1019 + _1029;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1035 = _1033 != 0;
    float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1039 = -_767;
    int _1041 = _935 ? as_type<int>(_1039) : as_type<int>(_767);
    float _1043 = fma(_1031, _1031, _1021);
    float _1045 = _939 + 0.5;
    bool _1047 = !_1035;
    float _1049 = _1047 ? _767 : as_type<float>(_1041);
    float _1051 = _1043 + _1023;
    float _1053 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1055 = -_1049;
    float _1057 = _1055 + 0.5;
    float _1059 = sqrt(_1051);
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1073 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1075 = _1053 * _911;
    float _1077 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1081 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1083 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1085 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1087 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = _1073 * _1037;
    bool _1093 = _1059 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1095 = isnan(_1059);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1101 = _1097 || _1099;
    out.m_60.x = _1081;
    out.m_60.y = _1083;
    out.m_60.z = _1085;
    out.m_60.w = _1079;
    out.m_62.x = _1077;
    out.m_62.y = _1087;
    out.m_62.z = _1089;
    out.m_64.x = _1075;
    out.m_64.y = _1091;
    float _1103 = _1069;
    float _1105 = _1037;
    if (!_1101)
    {
        _1103 = 1.0;
    }
    float _1107 = _1103;
    bool _1109 = !_1101;
    float _1111 = _1107;
    if (!_1109)
    {
        bool _1113 = _1059 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1115 = isnan(_1059);
        bool _1117 = _1113 || _1115;
        bool _1119 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1121 = _1117 || _1119;
        if (!_1121)
        {
            float _1123 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1125 = _1059 + _1123;
            float _1127 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1129 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1127;
            float _1131 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1133 = _1131 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1135 = 1.0 / _1129;
            float _1137 = _1125 * _1135;
            float _1139 = fma(_1137, _1133, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1111 = _1139;
            _1141 = true;
        }
        else
        {
            bool _1143 = _1059 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1145 = isnan(_1059);
            bool _1147 = _1143 || _1145;
            bool _1149 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1151 = _1147 || _1149;
            if (!_1151)
            {
                float _1153 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1155 = _1059 + _1153;
                float _1157 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1159 = _1157 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1161 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1163 = _1161 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1165 = 1.0 / _1159;
                float _1167 = _1155 * _1165;
                float _1169 = fma(_1167, _1163, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1111 = _1169;
                _1141 = true;
            }
            else
            {
                _1111 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1141 = false;
    float _1171 = _1111;
    float _1173 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1175 = _1019 + _1173;
    float _1177 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1179 = _1025 + _1177;
    float _1181 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1183 = _1027 + _1181;
    float _1185 = fma(_1175, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1187 = fma(_1179, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1189 = fma(_1183, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1193 = _1185 + _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1197 = _1187 + _1195;
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1201 = _1189 + _1199;
    float _1203 = _1193 * _1193;
    float _1205 = fma(_1197, _1197, _1203);
    float _1207 = fma(_1201, _1201, _1205);
    float _1209 = rsqrt(_1207);
    float _1211 = _1209 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1213 = _1197 * _1211;
    float _1215 = _1201 * _1211;
    float _1217 = _1213 * _1213;
    float _1219 = _1215 * _1215;
    float _1221 = _1217 + _1219;
    float _1223 = sqrt(_1221);
    bool _1225 = _1223 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1227 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1229 = _1223 + _1227;
    float _1231 = _1209;
    float _1233 = _1229;
    float _1235 = _1171;
    float _1237 = _1193;
    float _1239 = _1213;
    if (_1225)
    {
        float _1241 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1231 = _1241;
    }
    float _1243 = _1231;
    float _1245 = _1243;
    if (_1225)
    {
        float _1247 = _1229 * _1243;
        _1233 = _1247;
    }
    float _1249 = _1233;
    if (_1225)
    {
        float _1251 = rsqrt(_1221);
        _1245 = _1251;
    }
    float _1253 = _1245;
    float _1255 = _1253;
    if (_1225)
    {
        float _1257 = _1249 * 0.15915493667125701904296875;
        _1235 = _1257;
    }
    float _1259 = _1235;
    float _1261 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1263 = _1201;
    if (_1225)
    {
        float _1265 = _1259 * 6.283185482025146484375;
        float _1267 = sin(_1265);
        _1263 = _1267;
    }
    float _1269 = _1263;
    float _1271 = precise::max(0.0, _1261);
    float _1273 = _1175;
    float _1275 = _1271;
    if (_1225)
    {
        float _1277 = _1259 * 6.283185482025146484375;
        float _1279 = cos(_1277);
        _1273 = _1279;
    }
    float _1281 = _1273;
    float _1283 = -_1211;
    float _1285 = -_1271;
    float _1287 = fma(_1193, _1283, _1285);
    if (_1225)
    {
        float _1289 = _1287 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1237 = _1289;
    }
    float _1291 = _1237;
    float _1293 = sqrt(_1207);
    float _1295 = _1269;
    float _1297 = _1291;
    if (_1225)
    {
        float _1299 = fma(_1269, _1291, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1295 = _1299;
    }
    float _1301 = _1295;
    float _1303 = _1301;
    if (_1225)
    {
        float _1305 = _1253 * _1301;
        _1105 = _1305;
    }
    float _1307 = _1105;
    if (!_1225)
    {
        _1255 = _1287;
    }
    float _1309 = _1255;
    float _1311 = _1309;
    if (_1225)
    {
        float _1313 = _1281 + (-1.0);
        _1275 = _1313;
    }
    float _1315 = _1275;
    float _1317 = _1315;
    if (_1225)
    {
        float _1319 = _1213 * _1307;
        _1239 = _1319;
    }
    float _1321 = _1239;
    if (!_1225)
    {
        _1303 = _1215;
    }
    float _1323 = _1303;
    float _1325 = _1323;
    if (_1225)
    {
        float _1327 = _1215 * _1307;
        _1325 = _1327;
    }
    float _1329 = _1325;
    if (_1225)
    {
        float _1331 = _1315 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1297 = _1331;
    }
    float _1333 = _1297;
    float _1335 = _1333;
    if (!_1225)
    {
        _1317 = _1217;
    }
    float _1337 = _1317;
    float _1339 = _1337;
    if (_1225)
    {
        float _1341 = _1321 * _1321;
        _1339 = _1341;
    }
    float _1343 = _1339;
    float _1345 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1225)
    {
        float _1347 = fma(_1287, _1281, _1333);
        _1311 = _1347;
    }
    float _1349 = _1311;
    if (!_1225)
    {
        _1335 = _1219;
    }
    float _1351 = _1335;
    float _1353 = _1351;
    if (_1225)
    {
        float _1355 = _1329 * _1329;
        _1353 = _1355;
    }
    float _1357 = _1353;
    float _1359 = fma(_1349, _1349, _1343);
    float _1361 = _1359 + _1357;
    float _1363 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1365 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1367 = fma(_1293, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1365);
    float _1369 = precise::clamp(_1367, 0.0, 1.0);
    float _1371 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1373 = rsqrt(_1361);
    float _1375 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1363);
    float _1377 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1379 = -_1369;
    float _1381 = _1379 + 1.0;
    float _1383 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1371);
    float _1385 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1375);
    float _1387 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1377);
    float _1389 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1345);
    float _1391 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1383);
    float _1393 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1395 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1387);
    float _1397 = abs(_1381);
    float _1399 = log2(_1397);
    float _1401 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1403 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1405 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1407 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1389);
    float _1409 = _1373 * _1321;
    float _1411 = _1373 * _1349;
    float _1413 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1415 = -_1403;
    float _1417 = fma(_1415, _1401, 1.0);
    float _1419 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1421 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1423 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1425 = _1373 * _1329;
    float _1427 = -_1419;
    float _1429 = fma(_1411, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1427);
    float _1431 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1421);
    float _1433 = log2(_1417);
    float _1435 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1437 = -_1425;
    float _1439 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1429);
    float _1441 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1431);
    float _1443 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1445 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1447 = fma(_1439, -0.5, 0.5);
    float _1449 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1441);
    float _1451 = exp2(_1435);
    float _1453 = fma(_1439, 0.5, 0.5);
    float _1455 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1443);
    float _1457 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1445);
    float _1459 = _1411 + 1.0;
    float _1461 = fma(_1453, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1463 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1455);
    float _1465 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1457);
    float _1467 = 1.0 / _1449;
    float _1469 = fma(_1453, _1461, -0.212114393711090087890625);
    float _1471 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1463);
    float _1473 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1465);
    float _1475 = _1433 * 0.693147182464599609375;
    float _1477 = fma(_1453, _1469, 1.570728778839111328125);
    float _1479 = sqrt(_1447);
    float _1481 = -_1411;
    float _1483 = fma(_1451, _1459, _1481);
    float _1485 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1487 = fma(_1483, 0.5, 0.5);
    float _1489 = _1471 * _1467;
    float _1491 = _1473 * _1467;
    float _1493 = fma(_1489, 0.5, 0.5);
    float _1495 = fma(_1491, -0.5, 0.5);
    float _1497 = _1479 * 0.636619746685028076171875;
    float _1499 = -_1477;
    float _1501 = fma(_1497, _1499, 1.0);
    float3 _3996 = float3(_1493, _1495, _1485);
    float _1503 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3996, float3(0.0), isnan(_3996)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3996, float3(0.0), isnan(_3996)), level(0.0)).x;
    float3 _4007 = float3(_1493, _1495, _1485);
    float4 _1506 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4007, float3(0.0), isnan(_4007)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4007, float3(0.0), isnan(_4007)), level(0.0)).xyzw;
    float _1508 = _1506.x;
    float _1510 = _1506.y;
    float _1512 = _1506.z;
    float _1514 = _1506.w;
    float2 _4024 = float2(_1501, _1487);
    float3 _1518 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4024, float2(0.0), isnan(_4024)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4024, float2(0.0), isnan(_4024)), level(0.0)).xyz;
    float _1520 = _1518.x;
    float _1522 = _1518.y;
    float _1524 = _1518.z;
    float _1526 = _917 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1528 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1526);
    float _1530 = _917 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1532 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1528);
    float _1534 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1530);
    bool _1536 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan(0.5);
    bool _1544 = _1540 || _1542;
    float _1546 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1548 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1534);
    float _1550 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1552 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1554 = 1.0 / _1546;
    float _1556 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1558 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1552);
    float _1560 = _1556 + _1546;
    float _1562 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1558);
    float _1564 = exp2(_1550);
    float _1566 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1544)
    {
        _1566 = 1.0;
    }
    float _1568 = _1566;
    float _1570 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1562);
    float _1572 = _1560 * _1554;
    float _1574 = _1572 * 0.5;
    float _1576 = _1568;
    if (!_1544)
    {
        float _1578 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1582 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1580);
        float _1584 = _1578 * 0.15915493667125701904296875;
        float _1586 = _1584 * 6.283185482025146484375;
        float _1588 = cos(_1586);
        float _1590 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1592 = _1590 * 0.15915493667125701904296875;
        float _1594 = _1584 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = 1.0 / _1588;
        float _1600 = _1592 * 6.283185482025146484375;
        float _1602 = cos(_1600);
        float _1604 = _1596 * _1598;
        float _1606 = 1.0 / _1582;
        float _1608 = _1602 * _1604;
        float _1610 = _1592 * 6.283185482025146484375;
        float _1612 = sin(_1610);
        float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1616 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1614;
        float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1620 = _1606 * _1618;
        float _1622 = 1.0 / _1608;
        float _1624 = 1.0 / _1616;
        float _1626 = _1612 * _1622;
        float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1630 = fma(_1626, _1620, _1628);
        float _1632 = _1630 * _1624;
        float _1634 = precise::clamp(_1632, 0.0, 1.0);
        _1576 = _1634;
    }
    float _1636 = _1576;
    float _1638 = _1449 * 0.5;
    float _1640 = -_1564;
    float _1642 = _1640 + 1.0;
    bool _1644 = _1636 > 0.0;
    bool _1646 = isnan(_1636);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan(0.0);
    bool _1652 = _1648 || _1650;
    float _1654 = _1636 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1656 = fma(_1473, -0.5, _1638);
    float _1658 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1660 = _1570 + _1449;
    float _1662 = _1471 + _1449;
    out.gl_Position.x = _1471;
    out.gl_Position.y = _1473;
    out.gl_Position.z = _1570;
    out.gl_Position.w = _1449;
    float _1664 = _1658 * _1503;
    float _1666 = -_1658;
    float _1668 = _1666 + 1.0;
    float _1670 = _1660 * 0.5;
    float _1672 = _1514 * _1664;
    float _1674 = _1524 * _1664;
    float _1676 = _1662 * 0.5;
    float _1678 = _1654 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1680 = fma(_1520, _1672, _1508);
    float _1682 = fma(_1522, _1672, _1510);
    float _1684 = _1514 * _1668;
    float _1686 = fma(_1514, _1674, _1512);
    out.m_66.x = _1676;
    out.m_66.y = _1656;
    out.m_66.z = _1670;
    out.m_66.w = _1449;
    out.m_47.x = _1678;
    out.m_68.x = _1680;
    out.m_68.y = _1682;
    out.m_68.z = _1686;
    out.m_68.w = _1684;
    if (_1652)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1688 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1688;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1141 = false;
    bool _309 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1745 = as_type<float>(_103);
        out.gl_Position.z = _1745;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = _121;
    if (_117)
    {
        float _125 = float(_87);
        _97 = _125;
    }
    float _127 = _97;
    bool _129 = _121 >= _127;
    bool _131 = !_117;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1815 = as_type<float>(_141);
        out.gl_Position.z = _1815;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_51.w;
    float _145 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_49.x;
    float _159 = in.m_49.y;
    float _161 = in.m_49.z;
    float _163 = in.m_44.x;
    float _165 = in.m_44.y;
    float _167 = in.m_44.z;
    float _169 = 0.0;
    if (!_155)
    {
        float _171 = _145 * _145;
        float _173 = _171 * 0.5;
        _169 = _173;
    }
    float _175 = _169;
    float _177 = _175;
    if (!_155)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    bool _183 = !_155;
    float _185 = _181;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _145 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _145);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _215;
    }
    float _217 = _185;
    float _219 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _221 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _223 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _225 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _227 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _229 = _219 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _231 = fma(_221, (*spvDescriptorSet0.vp_c10)._m0[8].x, _225);
    float _233 = fma(_221, (*spvDescriptorSet0.vp_c10)._m0[8].y, _227);
    float _235 = fma(_221, (*spvDescriptorSet0.vp_c10)._m0[8].z, _229);
    float _237 = _227;
    if (!_155)
    {
        _237 = _145;
    }
    float _239 = _237;
    float _241 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[10].x, _231);
    bool _243 = !_155;
    float _245 = _239;
    if (!_243)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _145 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _245 = _265;
    }
    float _267 = _245;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _271 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[10].y, _233);
    float _273 = fma(_223, (*spvDescriptorSet0.vp_c10)._m0[10].z, _235);
    float _275 = fma(_267, _157, _241);
    float _277 = fma(_267, _159, _271);
    float _279 = fma(_267, _161, _273);
    float _281 = fma(_275, _143, _163);
    float _283 = fma(_277, _143, _165);
    float _285 = fma(_279, _143, _167);
    bool _287 = !_269;
    float _289 = _285;
    float _307;
    if (!_287)
    {
        float _291 = in.m_53.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_87);
        float _313 = 1.0 / _311;
        float _315 = _121 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    float _319 = in.m_53.z;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _317 + _321;
    float _325 = in.m_53.x;
    float _327 = in.m_53.y;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = _317 + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _341;
    float _345 = 1.0 / _335;
    int _347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _349 = _347 != 0;
    int _351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _353 = _351 != 0;
    int _355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _357 = _355 != 0;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _361 = _317 + _359;
    float _363 = 1.0 / _339;
    float _365 = _319 * 2.0;
    float _367 = 1.0 / _343;
    float _369 = _331 * _345;
    float _371 = _325 * 2.0;
    float _373 = _327 + _319;
    float _375 = _373 + (-1.0);
    float _377 = floor(_365);
    float _379 = _323 * _363;
    float _381 = _327 * 2.0;
    float _383 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _385 = floor(_371);
    float _387 = _361 * _367;
    float _389 = _319 + _325;
    float _391 = _319 + (-0.5);
    float _393 = _389 + (-1.0);
    float _395 = floor(_381);
    bool _397 = _377 > 0.0;
    float _399 = _327 + _325;
    bool _401 = _377 >= 0.0;
    bool _403 = isnan(_377);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = _399 + (-1.0);
    float _413 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _415 = log2(_413);
    bool _417 = _385 >= 0.0;
    bool _419 = isnan(_385);
    bool _421 = _417 || _419;
    bool _423 = isnan(0.0);
    bool _425 = _421 || _423;
    float _427 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _429 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _431 = _409 ? 0 : 1;
    bool _433 = _385 > 0.0;
    bool _435 = !_349;
    int _437 = _435 ? 0 : 1;
    bool _439 = _395 > 0.0;
    int _441 = ~_431;
    int _443 = _441 + 1;
    int _445 = _443 + 1;
    int _447 = abs(_437);
    int _449 = _445;
    float _451 = _327;
    if (!_397)
    {
        int _453 = ~_431;
        int _455 = _453 + 1;
        _449 = _455;
    }
    int _457 = _449;
    float _459 = _415 * _121;
    bool _461 = _395 >= 0.0;
    bool _463 = isnan(_395);
    bool _465 = _461 || _463;
    bool _467 = isnan(0.0);
    bool _469 = _465 || _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _471;
    int _475 = _425 ? 0 : 1;
    float _477 = float(_447);
    float _479 = exp2(_459);
    float _481 = float(_457);
    int _483 = _469 ? 0 : 1;
    int _485 = ~_475;
    int _487 = _485 + 1;
    int _489 = _487 + 1;
    float _491 = _477 * _481;
    int _493 = _489;
    if (!_433)
    {
        int _495 = ~_475;
        int _497 = _495 + 1;
        _493 = _497;
    }
    int _499 = _493;
    int _501 = ~_483;
    int _503 = _501 + 1;
    int _505 = _503 + 1;
    float _507 = in.m_55.x;
    float _509 = in.m_55.y;
    float _511 = in.m_55.z;
    int _513 = _505;
    if (!_439)
    {
        int _515 = ~_483;
        int _517 = _515 + 1;
        _513 = _517;
    }
    int _519 = _513;
    bool _521 = !_353;
    int _523 = _521 ? 0 : 1;
    bool _525 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _527 = isnan(1.0);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _533 = _529 || _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _537 = 1.0 + _535;
    bool _539 = !_357;
    int _541 = _539 ? 0 : 1;
    float _543 = -_479;
    float _545 = _543 + 1.0;
    int _547 = abs(_523);
    float _549 = 1.0 / _537;
    int _551 = abs(_541);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _553;
    float _557 = float(_499);
    float _559 = fma(_555, _369, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _561 = float(_547);
    float _563 = fma(_473, _369, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _565 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _567 = isnan(0.0);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _573 = _569 || _571;
    float _575 = _491 * (-2.0);
    float _577 = float(_551);
    float _579 = _561 * _557;
    float _581 = float(_519);
    float _583 = as_type<float>(int(gl_VertexIndex));
    float _585 = _573 ? _545 : 0.0;
    float _587 = _579 * (-2.0);
    float _589 = _577 * _581;
    float _591 = fma(_429, _575, _429);
    float _593 = fma(_575, _507, _507);
    float _595 = _325 + (-0.5);
    if (_533)
    {
        float _597 = _585 * _549;
        _123 = _597;
    }
    float _599 = _123;
    bool _601 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _603 = isnan(_317);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = _327 + (-0.5);
    float _615 = fma(_587, _509, _509);
    float _617 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[196].x, _593);
    float _619 = fma(_383, _587, _383);
    bool _621 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _623 = isnan(_317);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[196].y, _615);
    float _635 = -_611;
    float _637 = _635 + 1.0;
    bool _639 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _641 = isnan(_317);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = fma(_591, _599, _617);
    bool _653 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _655 = isnan(_317);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _631 * _637;
    float _667 = -_631;
    float _669 = _667 + 1.0;
    float _671 = _589 * (-2.0);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _677 = _651 * 0.15915493667125701904296875;
    float _679 = -_663;
    float _681 = _679 + 1.0;
    float _683 = fma(_671, _511, _511);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _689 = _663 * _669;
    float _691 = _649 * _681;
    float _693 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[196].z, _683);
    float _695 = fma(_675, _379, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _697 = -_649;
    float _699 = _697 + 1.0;
    float _701 = fma(_687, _379, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _703 = in.m_51.x;
    float _705 = in.m_51.y;
    float _707 = fma(_619, _599, _633);
    float _709 = _563 * _691;
    float _711 = _559 * _691;
    float _713 = fma(_427, _671, _427);
    float _715 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[143].y, _709);
    float _717 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[143].x, _711);
    float _719 = _707 * 0.15915493667125701904296875;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _721;
    float _725 = fma(_713, _599, _693);
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _727;
    float _731 = fma(_701, _689, _715);
    float _733 = fma(_723, _387, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _735 = fma(_695, _689, _717);
    float _737 = fma(_729, _387, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _739 = _677 * 6.283185482025146484375;
    float _741 = sin(_739);
    float _743 = _725 * 0.15915493667125701904296875;
    float _745 = fma(_733, _665, _735);
    float _747 = fma(_737, _665, _731);
    int _749 = as_type<int>(_583) & 1;
    bool _751 = _749 != 0;
    int _753 = as_type<int>(_583) & 2;
    bool _755 = _753 != 0;
    float _757 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[146].y, _747);
    float _759 = _677 * 6.283185482025146484375;
    float _761 = cos(_759);
    float _763 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[146].x, _745);
    bool _765 = !_755;
    float _767 = _765 ? (-0.5) : 0.5;
    float _769 = _757 * _705;
    bool _771 = !_751;
    float _773 = _771 ? (-0.5) : 0.5;
    float _775 = _763 * _703;
    bool _777 = _325 > 0.5;
    float _779 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _767);
    float _781 = _719 * 6.283185482025146484375;
    float _783 = sin(_781);
    float _785 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _787 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _773);
    float _789 = _775 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _791 = _785 * _779;
    float _793 = _789 * _787;
    float _795 = _719 * 6.283185482025146484375;
    float _797 = cos(_795);
    float _799 = _743 * 6.283185482025146484375;
    float _801 = sin(_799);
    float _803 = _761 * _783;
    float _805 = _741 * _783;
    float _807 = _743 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _741 * _797;
    float _813 = _761 * _797;
    float _815 = -_803;
    float _817 = fma(_801, _811, _815);
    float _819 = -_811;
    float _821 = fma(_801, _803, _819);
    float _823 = fma(_801, _813, _805);
    float _825 = fma(_801, _805, _813);
    float _827 = _809 * _791;
    float _829 = _797 * _809;
    float _831 = -_791;
    float _833 = _801 * _831;
    float _835 = _783 * _809;
    float _837 = _761 * _827;
    float _839 = _741 * _827;
    float _841 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _843 = fma(_829, _793, _833);
    float _845 = fma(_823, _793, _837);
    float _847 = fma(_817, _793, _839);
    float _849 = _283 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _851 = fma(_835, _841, _843);
    float _853 = fma(_821, _841, _845);
    float _855 = fma(_825, _841, _847);
    float _857 = _283 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _859 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[4].x, _849);
    float _861 = _853 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _863 = _853 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _865 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[6].x, _857);
    float _867 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[4].z, _859);
    float _869 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _861);
    float _871 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _863);
    float _873 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[6].z, _865);
    float _875 = _867 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _877 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[24].z, _869);
    float _879 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[26].z, _871);
    float _881 = _873 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _883 = _283 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _885 = _877 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _887 = _879 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _889 = _853 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _891 = fma(_281, (*spvDescriptorSet0.vp_c10)._m0[5].x, _883);
    float _893 = _875 + _885;
    float _895 = _881 + _887;
    float _897 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _889);
    float _899 = fma(_285, (*spvDescriptorSet0.vp_c10)._m0[5].z, _891);
    float _901 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _903 = _893 + _901;
    float _905 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _907 = _895 + _905;
    float _909 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[25].z, _897);
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _913 = _903 * _903;
    float _915 = _907 * _907;
    float _917 = _899 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _919 = _909 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _921 = _913 + _915;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _925 = _923 != 0;
    float _927 = -_773;
    float _929 = _777 ? _927 : _773;
    float _931 = sqrt(_921);
    float _933 = _917 + _919;
    bool _935 = _327 > 0.5;
    bool _937 = !_925;
    float _939 = _937 ? _773 : _929;
    bool _941 = _931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _943 = _929;
    float _945 = _855;
    float _947 = _889;
    if (!_941)
    {
        _943 = _915;
    }
    float _949 = _943;
    float _951 = _949;
    if (!_941)
    {
        _945 = _913;
    }
    float _953 = _945;
    float _955 = _953;
    if (!_941)
    {
        _289 = _893;
    }
    float _957 = _289;
    float _959 = _957;
    if (!_941)
    {
        _451 = _895;
    }
    float _961 = _451;
    float _963 = _961;
    if (!_941)
    {
        _947 = _933;
    }
    float _965 = _947;
    bool _967 = !_941;
    float _969 = _965;
    if (!_967)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _973 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _975 = _931 + _973;
        float _977 = rsqrt(_921);
        float _979 = _975 * _971;
        float _981 = _933 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _983 = _979 * 0.15915493667125701904296875;
        float _985 = _983 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = _983 * 6.283185482025146484375;
        float _991 = cos(_989);
        float _993 = fma(_987, _981, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _995 = _977 * _993;
        float _997 = _991 + (-1.0);
        float _999 = fma(_903, _995, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1001 = fma(_907, _995, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1003 = _997 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1007 = _999 + _1005;
        float _1009 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1011 = _1001 + _1009;
        float _1013 = fma(_933, _991, _1003);
        float _1015 = _1007 * _1007;
        float _1017 = _1011 * _1011;
        _969 = _1013;
        _955 = _1015;
        _951 = _1017;
        _959 = _999;
        _963 = _1001;
    }
    float _1019 = _969;
    float _1021 = _955;
    float _1023 = _951;
    float _1025 = _959;
    float _1027 = _963;
    float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1031 = _1019 + _1029;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1035 = _1033 != 0;
    float _1037 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1039 = -_767;
    int _1041 = _935 ? as_type<int>(_1039) : as_type<int>(_767);
    float _1043 = fma(_1031, _1031, _1021);
    float _1045 = _939 + 0.5;
    bool _1047 = !_1035;
    float _1049 = _1047 ? _767 : as_type<float>(_1041);
    float _1051 = _1043 + _1023;
    float _1053 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1055 = -_1049;
    float _1057 = _1055 + 0.5;
    float _1059 = sqrt(_1051);
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1067 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1069 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1073 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1075 = _1053 * _911;
    float _1077 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1081 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1083 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1085 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1087 = _1069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1091 = _1073 * _1037;
    bool _1093 = _1059 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1095 = isnan(_1059);
    bool _1097 = _1093 || _1095;
    bool _1099 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1101 = _1097 || _1099;
    out.m_60.x = _1081;
    out.m_60.y = _1083;
    out.m_60.z = _1085;
    out.m_60.w = _1079;
    out.m_62.x = _1077;
    out.m_62.y = _1087;
    out.m_62.z = _1089;
    out.m_64.x = _1075;
    out.m_64.y = _1091;
    float _1103 = _1069;
    float _1105 = _1037;
    if (!_1101)
    {
        _1103 = 1.0;
    }
    float _1107 = _1103;
    bool _1109 = !_1101;
    float _1111 = _1107;
    if (!_1109)
    {
        bool _1113 = _1059 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1115 = isnan(_1059);
        bool _1117 = _1113 || _1115;
        bool _1119 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1121 = _1117 || _1119;
        if (!_1121)
        {
            float _1123 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1125 = _1059 + _1123;
            float _1127 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1129 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1127;
            float _1131 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1133 = _1131 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1135 = 1.0 / _1129;
            float _1137 = _1125 * _1135;
            float _1139 = fma(_1137, _1133, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1111 = _1139;
            _1141 = true;
        }
        else
        {
            bool _1143 = _1059 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1145 = isnan(_1059);
            bool _1147 = _1143 || _1145;
            bool _1149 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1151 = _1147 || _1149;
            if (!_1151)
            {
                float _1153 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1155 = _1059 + _1153;
                float _1157 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1159 = _1157 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1161 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1163 = _1161 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1165 = 1.0 / _1159;
                float _1167 = _1155 * _1165;
                float _1169 = fma(_1167, _1163, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1111 = _1169;
                _1141 = true;
            }
            else
            {
                _1111 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1141 = false;
    float _1171 = _1111;
    float _1173 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1175 = _1019 + _1173;
    float _1177 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1179 = _1025 + _1177;
    float _1181 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1183 = _1027 + _1181;
    float _1185 = fma(_1175, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1187 = fma(_1179, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1189 = fma(_1183, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1193 = _1185 + _1191;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1197 = _1187 + _1195;
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1201 = _1189 + _1199;
    float _1203 = _1193 * _1193;
    float _1205 = fma(_1197, _1197, _1203);
    float _1207 = fma(_1201, _1201, _1205);
    float _1209 = rsqrt(_1207);
    float _1211 = _1209 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1213 = _1197 * _1211;
    float _1215 = _1201 * _1211;
    float _1217 = _1213 * _1213;
    float _1219 = _1215 * _1215;
    float _1221 = _1217 + _1219;
    float _1223 = sqrt(_1221);
    bool _1225 = _1223 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1227 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1229 = _1223 + _1227;
    float _1231 = _1209;
    float _1233 = _1229;
    float _1235 = _1171;
    float _1237 = _1193;
    float _1239 = _1213;
    if (_1225)
    {
        float _1241 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1231 = _1241;
    }
    float _1243 = _1231;
    float _1245 = _1243;
    if (_1225)
    {
        float _1247 = _1229 * _1243;
        _1233 = _1247;
    }
    float _1249 = _1233;
    if (_1225)
    {
        float _1251 = rsqrt(_1221);
        _1245 = _1251;
    }
    float _1253 = _1245;
    float _1255 = _1253;
    if (_1225)
    {
        float _1257 = _1249 * 0.15915493667125701904296875;
        _1235 = _1257;
    }
    float _1259 = _1235;
    float _1261 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1263 = _1201;
    if (_1225)
    {
        float _1265 = _1259 * 6.283185482025146484375;
        float _1267 = sin(_1265);
        _1263 = _1267;
    }
    float _1269 = _1263;
    float _1271 = precise::max(0.0, _1261);
    float _1273 = _1175;
    float _1275 = _1271;
    if (_1225)
    {
        float _1277 = _1259 * 6.283185482025146484375;
        float _1279 = cos(_1277);
        _1273 = _1279;
    }
    float _1281 = _1273;
    float _1283 = -_1211;
    float _1285 = -_1271;
    float _1287 = fma(_1193, _1283, _1285);
    if (_1225)
    {
        float _1289 = _1287 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1237 = _1289;
    }
    float _1291 = _1237;
    float _1293 = sqrt(_1207);
    float _1295 = _1269;
    float _1297 = _1291;
    if (_1225)
    {
        float _1299 = fma(_1269, _1291, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1295 = _1299;
    }
    float _1301 = _1295;
    float _1303 = _1301;
    if (_1225)
    {
        float _1305 = _1253 * _1301;
        _1105 = _1305;
    }
    float _1307 = _1105;
    if (!_1225)
    {
        _1255 = _1287;
    }
    float _1309 = _1255;
    float _1311 = _1309;
    if (_1225)
    {
        float _1313 = _1281 + (-1.0);
        _1275 = _1313;
    }
    float _1315 = _1275;
    float _1317 = _1315;
    if (_1225)
    {
        float _1319 = _1213 * _1307;
        _1239 = _1319;
    }
    float _1321 = _1239;
    if (!_1225)
    {
        _1303 = _1215;
    }
    float _1323 = _1303;
    float _1325 = _1323;
    if (_1225)
    {
        float _1327 = _1215 * _1307;
        _1325 = _1327;
    }
    float _1329 = _1325;
    if (_1225)
    {
        float _1331 = _1315 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1297 = _1331;
    }
    float _1333 = _1297;
    float _1335 = _1333;
    if (!_1225)
    {
        _1317 = _1217;
    }
    float _1337 = _1317;
    float _1339 = _1337;
    if (_1225)
    {
        float _1341 = _1321 * _1321;
        _1339 = _1341;
    }
    float _1343 = _1339;
    float _1345 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1225)
    {
        float _1347 = fma(_1287, _1281, _1333);
        _1311 = _1347;
    }
    float _1349 = _1311;
    if (!_1225)
    {
        _1335 = _1219;
    }
    float _1351 = _1335;
    float _1353 = _1351;
    if (_1225)
    {
        float _1355 = _1329 * _1329;
        _1353 = _1355;
    }
    float _1357 = _1353;
    float _1359 = fma(_1349, _1349, _1343);
    float _1361 = _1359 + _1357;
    float _1363 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1365 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1367 = fma(_1293, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1365);
    float _1369 = precise::clamp(_1367, 0.0, 1.0);
    float _1371 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1373 = rsqrt(_1361);
    float _1375 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1363);
    float _1377 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1379 = -_1369;
    float _1381 = _1379 + 1.0;
    float _1383 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1371);
    float _1385 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1375);
    float _1387 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1377);
    float _1389 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1345);
    float _1391 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1383);
    float _1393 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1395 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1387);
    float _1397 = abs(_1381);
    float _1399 = log2(_1397);
    float _1401 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1403 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1405 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1407 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1389);
    float _1409 = _1373 * _1321;
    float _1411 = _1373 * _1349;
    float _1413 = _1391 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1415 = -_1403;
    float _1417 = fma(_1415, _1401, 1.0);
    float _1419 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1421 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1423 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1425 = _1373 * _1329;
    float _1427 = -_1419;
    float _1429 = fma(_1411, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1427);
    float _1431 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1421);
    float _1433 = log2(_1417);
    float _1435 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1437 = -_1425;
    float _1439 = fma(_1437, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1429);
    float _1441 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1431);
    float _1443 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1445 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1447 = fma(_1439, -0.5, 0.5);
    float _1449 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1441);
    float _1451 = exp2(_1435);
    float _1453 = fma(_1439, 0.5, 0.5);
    float _1455 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1443);
    float _1457 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1445);
    float _1459 = _1411 + 1.0;
    float _1461 = fma(_1453, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1463 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1455);
    float _1465 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1457);
    float _1467 = 1.0 / _1449;
    float _1469 = fma(_1453, _1461, -0.212114393711090087890625);
    float _1471 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1463);
    float _1473 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1465);
    float _1475 = _1433 * 0.693147182464599609375;
    float _1477 = fma(_1453, _1469, 1.570728778839111328125);
    float _1479 = sqrt(_1447);
    float _1481 = -_1411;
    float _1483 = fma(_1451, _1459, _1481);
    float _1485 = _1475 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1487 = fma(_1483, 0.5, 0.5);
    float _1489 = _1471 * _1467;
    float _1491 = _1473 * _1467;
    float _1493 = fma(_1489, 0.5, 0.5);
    float _1495 = fma(_1491, -0.5, 0.5);
    float _1497 = _1479 * 0.636619746685028076171875;
    float _1499 = -_1477;
    float _1501 = fma(_1497, _1499, 1.0);
    float3 _3996 = float3(_1493, _1495, _1485);
    float _1503 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3996, float3(0.0), isnan(_3996)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3996, float3(0.0), isnan(_3996)), level(0.0)).x;
    float3 _4007 = float3(_1493, _1495, _1485);
    float4 _1506 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4007, float3(0.0), isnan(_4007)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4007, float3(0.0), isnan(_4007)), level(0.0)).xyzw;
    float _1508 = _1506.x;
    float _1510 = _1506.y;
    float _1512 = _1506.z;
    float _1514 = _1506.w;
    float2 _4024 = float2(_1501, _1487);
    float3 _1518 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4024, float2(0.0), isnan(_4024)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4024, float2(0.0), isnan(_4024)), level(0.0)).xyz;
    float _1520 = _1518.x;
    float _1522 = _1518.y;
    float _1524 = _1518.z;
    float _1526 = _917 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1528 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1526);
    float _1530 = _917 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1532 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1528);
    float _1534 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1530);
    bool _1536 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan(0.5);
    bool _1544 = _1540 || _1542;
    float _1546 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1548 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1534);
    float _1550 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1552 = _1405 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1554 = 1.0 / _1546;
    float _1556 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1558 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1552);
    float _1560 = _1556 + _1546;
    float _1562 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1558);
    float _1564 = exp2(_1550);
    float _1566 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1544)
    {
        _1566 = 1.0;
    }
    float _1568 = _1566;
    float _1570 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1562);
    float _1572 = _1560 * _1554;
    float _1574 = _1572 * 0.5;
    float _1576 = _1568;
    if (!_1544)
    {
        float _1578 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1582 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1580);
        float _1584 = _1578 * 0.15915493667125701904296875;
        float _1586 = _1584 * 6.283185482025146484375;
        float _1588 = cos(_1586);
        float _1590 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1592 = _1590 * 0.15915493667125701904296875;
        float _1594 = _1584 * 6.283185482025146484375;
        float _1596 = sin(_1594);
        float _1598 = 1.0 / _1588;
        float _1600 = _1592 * 6.283185482025146484375;
        float _1602 = cos(_1600);
        float _1604 = _1596 * _1598;
        float _1606 = 1.0 / _1582;
        float _1608 = _1602 * _1604;
        float _1610 = _1592 * 6.283185482025146484375;
        float _1612 = sin(_1610);
        float _1614 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1616 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1614;
        float _1618 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1620 = _1606 * _1618;
        float _1622 = 1.0 / _1608;
        float _1624 = 1.0 / _1616;
        float _1626 = _1612 * _1622;
        float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1630 = fma(_1626, _1620, _1628);
        float _1632 = _1630 * _1624;
        float _1634 = precise::clamp(_1632, 0.0, 1.0);
        _1576 = _1634;
    }
    float _1636 = _1576;
    float _1638 = _1449 * 0.5;
    float _1640 = -_1564;
    float _1642 = _1640 + 1.0;
    bool _1644 = _1636 > 0.0;
    bool _1646 = isnan(_1636);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan(0.0);
    bool _1652 = _1648 || _1650;
    float _1654 = _1636 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1656 = fma(_1473, -0.5, _1638);
    float _1658 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1660 = _1570 + _1449;
    float _1662 = _1471 + _1449;
    out.gl_Position.x = _1471;
    out.gl_Position.y = _1473;
    out.gl_Position.z = _1570;
    out.gl_Position.w = _1449;
    float _1664 = _1658 * _1503;
    float _1666 = -_1658;
    float _1668 = _1666 + 1.0;
    float _1670 = _1660 * 0.5;
    float _1672 = _1514 * _1664;
    float _1674 = _1524 * _1664;
    float _1676 = _1662 * 0.5;
    float _1678 = _1654 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1680 = fma(_1520, _1672, _1508);
    float _1682 = fma(_1522, _1672, _1510);
    float _1684 = _1514 * _1668;
    float _1686 = fma(_1514, _1674, _1512);
    out.m_66.x = _1676;
    out.m_66.y = _1656;
    out.m_66.z = _1670;
    out.m_66.w = _1449;
    out.m_47.x = _1678;
    out.m_68.x = _1680;
    out.m_68.y = _1682;
    out.m_68.z = _1686;
    out.m_68.w = _1684;
    if (_1652)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1688 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1688;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

