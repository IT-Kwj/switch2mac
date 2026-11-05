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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_68 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3673 = false;
    bool _685 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3958 = as_type<float>(_123);
        out.gl_Position.z = _3958;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _117 = _147;
    }
    float _149 = _117;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4032 = as_type<float>(_163);
        out.gl_Position.z = _4032;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    float _171 = in.m_57.x;
    float _173 = in.m_57.y;
    float _175 = in.m_57.z;
    float _177 = in.m_59.x;
    float _179 = in.m_59.y;
    float _181 = in.m_59.z;
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_64.w;
    float _187 = in.m_44.x;
    float _189 = in.m_44.y;
    float _191 = in.m_44.z;
    float _193 = _165 * _165;
    float _195 = _167 * _167;
    float _197 = fma(_171, _171, _193);
    float _199 = fma(_173, _173, _195);
    float _201 = fma(_177, _177, _197);
    float _203 = _169 * _169;
    float _205 = fma(_179, _179, _199);
    float _207 = sqrt(_201);
    float _209 = fma(_175, _175, _203);
    float _211 = fma(_181, _181, _209);
    float _213 = sqrt(_205);
    float _215 = sqrt(_211);
    bool _217 = _207 > 0.0;
    bool _219 = _213 > 0.0;
    float _221 = 0.0;
    float _223 = _201;
    float _225 = _205;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _231 = _171;
    if (_217)
    {
        float _233 = rsqrt(_201);
        _221 = _233;
    }
    float _235 = _221;
    float _237 = 0.0;
    if (!_217)
    {
        _237 = 0.0;
    }
    float _239 = _237;
    bool _241 = _215 > 0.0;
    int _243 = as_type<int>(_183) & 1;
    bool _245 = _243 != 0;
    int _247 = as_type<int>(_183) & 2;
    bool _249 = _247 != 0;
    float _251 = 0.0;
    float _253 = _239;
    if (_219)
    {
        float _255 = rsqrt(_205);
        _251 = _255;
    }
    float _257 = _251;
    float _259 = in.m_49.x;
    float _261 = in.m_49.y;
    float _263 = in.m_49.z;
    bool _265 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _269 = _265 || _267;
    bool _271 = isnan(1.0);
    bool _273 = _269 || _271;
    float _275 = 0.0;
    float _277 = 0.0;
    if (!_219)
    {
        _275 = 0.0;
        _277 = 0.0;
    }
    float _279 = _275;
    float _281 = _277;
    float _283 = _281;
    float _285 = _279;
    if (!_217)
    {
        _223 = 0.0;
    }
    float _287 = _223;
    int _289 = int(_245);
    int _291 = _249 ? 2 : 0;
    int _293 = _289 | _291;
    int _295 = _217 ? 4 : 0;
    int _297 = _293 | _295;
    int _299 = _219 ? 8 : 0;
    int _301 = _297 | _299;
    int _303 = _241 ? 16 : 0;
    int _305 = _301 | _303;
    int _307 = _273 ? 32 : 0;
    int _309 = _305 | _307;
    int _311 = false ? 64 : 0;
    int _313 = _309 | _311;
    int _315 = _313 & 32;
    float _317 = 0.0;
    float _319 = as_type<float>(_315);
    float _321 = _287;
    if (_241)
    {
        float _323 = rsqrt(_211);
        _317 = _323;
    }
    float _325 = _317;
    if (!_217)
    {
        _319 = 0.0;
    }
    float _327 = _319;
    float _329 = _327;
    if (_217)
    {
        float _331 = _235 * _171;
        _253 = _331;
    }
    float _333 = _253;
    if (_217)
    {
        float _335 = _235 * _165;
        _321 = _335;
    }
    float _337 = _321;
    if (_217)
    {
        float _339 = _235 * _177;
        _329 = _339;
    }
    float _341 = _329;
    float _343 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _345 = 0.0;
    float _347 = 0.0;
    float _349 = _343;
    if (!_241)
    {
        _345 = 0.0;
        _347 = 0.0;
    }
    float _351 = _345;
    float _353 = _347;
    float _355 = 0.0;
    float _357 = _351;
    float _359 = _353;
    if (!_219)
    {
        _355 = 0.0;
    }
    float _361 = _355;
    float _363 = _361;
    if (_219)
    {
        float _365 = _257 * _173;
        _283 = _365;
    }
    float _367 = _283;
    if (!_273)
    {
        float _369 = _343 * _343;
        float _371 = _369 * 0.5;
        _225 = _371;
    }
    float _373 = _225;
    float _375 = 0.0;
    float _377 = _373;
    if (!_241)
    {
        _375 = 0.0;
    }
    float _379 = _375;
    float _381 = _379;
    if (_219)
    {
        float _383 = _257 * _167;
        _285 = _383;
    }
    float _385 = _285;
    if (_219)
    {
        float _387 = _257 * _179;
        _363 = _387;
    }
    float _389 = _363;
    bool _391 = !_245;
    float _393 = _391 ? (-0.5) : 0.5;
    if (!_273)
    {
        float _395 = _373 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _377 = _395;
    }
    float _397 = _377;
    bool _399 = !_249;
    float _401 = _399 ? (-0.5) : 0.5;
    float _403 = _397;
    if (_241)
    {
        float _405 = _325 * _175;
        _381 = _405;
    }
    float _407 = _381;
    if (_241)
    {
        float _409 = _325 * _169;
        _357 = _409;
    }
    float _411 = _357;
    if (_241)
    {
        float _413 = _325 * _181;
        _359 = _413;
    }
    float _415 = _359;
    bool _417 = !_273;
    float _419 = 0.0;
    if (!_417)
    {
        float _421 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _423 = log2(_421);
        float _425 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _427 = _425 + 1.0;
        float _429 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _431 = _343 * _423;
        float _433 = exp2(_431);
        float _435 = _429 * 0.693147182464599609375;
        float _437 = 1.0 / _435;
        float _439 = 1.0 / _427;
        float _441 = _433 + (-1.0);
        float _443 = -_441;
        float _445 = fma(_443, _437, _343);
        float _447 = _445 * _439;
        float _449 = _447 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _403 = _449;
        _419 = _427;
    }
    float _451 = _403;
    float _453 = _419;
    float _455 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _457 = !_273;
    float _459 = _453;
    float _461 = _451;
    if (!_457)
    {
        float _463 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _465 = log2(_463);
        float _467 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _469 = _467 + 1.0;
        float _471 = 1.0 / _469;
        float _473 = _343 * _465;
        float _475 = exp2(_473);
        float _477 = -_475;
        float _479 = _477 + 1.0;
        float _481 = _479 * _471;
        _459 = _471;
        _349 = _481;
    }
    float _483 = _459;
    float _485 = _349;
    float _487 = _455 * _337;
    float _489 = _455 * _385;
    float _491 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _493 = _455 * _411;
    float _495 = _483;
    if (!_273)
    {
        float _497 = _143 * _143;
        float _499 = _497 * 0.5;
        _495 = _499;
    }
    float _501 = _495;
    float _503 = fma(_491, _333, _487);
    float _505 = fma(_491, _367, _489);
    float _507 = fma(_491, _407, _493);
    float _509 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_273)
    {
        float _511 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _461 = _511;
    }
    float _513 = _461;
    bool _515 = !_273;
    float _517 = _513;
    if (!_515)
    {
        float _519 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _521 = log2(_519);
        float _523 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _525 = _523 + 1.0;
        float _527 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _529 = _143 * _521;
        float _531 = exp2(_529);
        float _533 = _527 * 0.693147182464599609375;
        float _535 = 1.0 / _533;
        float _537 = 1.0 / _525;
        float _539 = _531 + (-1.0);
        float _541 = -_539;
        float _543 = fma(_541, _535, _143);
        float _545 = _543 * _537;
        float _547 = _545 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _517 = _547;
    }
    float _549 = _517;
    float _551 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _553 = fma(_509, _341, _503);
    float _555 = fma(_509, _389, _505);
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _559 = _551 * _337;
    float _561 = _551 * _385;
    float _563 = _551 * _411;
    float _565 = fma(_509, _415, _507);
    float _567 = fma(_557, _333, _559);
    float _569 = fma(_557, _367, _561);
    float _571 = fma(_557, _407, _563);
    float _573 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _575 = fma(_485, _259, _553);
    float _577 = fma(_485, _261, _555);
    float _579 = fma(_485, _263, _565);
    float _581 = fma(_573, _341, _567);
    float _583 = fma(_573, _389, _569);
    float _585 = fma(_573, _415, _571);
    float _587 = _549;
    if (!_273)
    {
        _587 = _143;
    }
    float _589 = _587;
    bool _591 = !_273;
    float _593 = _589;
    if (!_591)
    {
        float _595 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _597 = log2(_595);
        float _599 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _601 = _599 + 1.0;
        float _603 = 1.0 / _601;
        float _605 = _143 * _597;
        float _607 = exp2(_605);
        float _609 = -_607;
        float _611 = _609 + 1.0;
        float _613 = _611 * _603;
        _593 = _613;
    }
    float _615 = _593;
    float _617 = fma(_615, _261, _583);
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _621 = fma(_615, _259, _581);
    float _623 = fma(_577, _185, _189);
    float _625 = -_617;
    float _627 = _577 + _625;
    float _629 = fma(_575, _185, _187);
    float _631 = -_621;
    float _633 = _575 + _631;
    float _635 = fma(_615, _263, _585);
    float _637 = _627 * _173;
    float _639 = _627 * _167;
    float _641 = _627 * _179;
    float _643 = -_635;
    float _645 = _579 + _643;
    float _647 = fma(_633, _171, _637);
    float _649 = fma(_633, _165, _639);
    float _651 = fma(_633, _177, _641);
    float _653 = fma(_579, _185, _191);
    float _655 = fma(_645, _175, _647);
    float _657 = fma(_645, _169, _649);
    float _659 = fma(_645, _181, _651);
    bool _661 = !_619;
    float _663 = _657;
    float _665 = _655;
    float _667 = _659;
    float _683;
    if (!_661)
    {
        float _669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _671 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _675 = _673 * _669;
        float _677 = floor(_675);
        float _679 = -_677;
        float _681 = _675 + _679;
        _683 = _681;
        _685 = true;
    }
    else
    {
        float _687 = float(_107);
        float _689 = 1.0 / _687;
        float _691 = _143 * _689;
        _683 = _691;
    }
    _685 = false;
    float _693 = _683;
    float _695 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _697 = int(_695);
    float _699 = in.m_51.y;
    float _701 = float(_107);
    float _703 = _623 * _167;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _707 = _705 != 0;
    float _709 = _623 * _179;
    float _711 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _713 = int(_711);
    float _715 = fma(_629, _165, _703);
    float _717 = fma(_629, _177, _709);
    float _719 = in.m_59.w;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _723 = 1.0 / _701;
    float _725 = float(_697);
    float _727 = in.m_55.w;
    float _729 = 1.0 / _725;
    float _731 = float(uint(_713));
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _735 = 1.0 + _733;
    int _737 = ~_713;
    int _739 = _737 + 1;
    bool _741 = _713 == 0;
    float _743 = 1.0 / _731;
    float _745 = _143 * _729;
    float _747 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _749 = int(_747);
    int _751 = as_type<int>(_743) + (-2);
    float _753 = trunc(_745);
    int _755 = int(_753);
    float _757 = float(_713);
    float _759 = float(uint(_749));
    float _761 = 1.0 / _735;
    float _763 = _745;
    if (_707)
    {
        _763 = 1.0;
    }
    float _765 = _763;
    float _767 = _765;
    if (!_707)
    {
        _767 = 7.345489978790283203125;
    }
    float _769 = _767;
    int _771 = ~_749;
    int _773 = _771 + 1;
    float _775 = float(uint(_755));
    float _777 = _769 * _129;
    float _779 = 1.0 / _759;
    float _781 = as_type<float>(_751) * _775;
    float _783 = trunc(_781);
    float _785 = precise::max(_783, 0.0);
    uint _788 = uint(_785);
    float _790 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _792 = int(_790);
    int _794 = _739 * int(_788);
    int _796 = _794 + _755;
    float _798 = float(uint(_796));
    float _800 = as_type<float>(_751) * _798;
    float _802 = trunc(_800);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    int _808 = int(_788) + int(_806);
    float _810 = float(_755);
    float _812 = floor(_777);
    int _814 = _739 * _808;
    int _816 = _814 + _755;
    bool _818 = _810 >= _757;
    bool _820 = isnan(_810);
    bool _822 = _818 || _820;
    bool _824 = isnan(_757);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    bool _830 = uint(_816) >= uint(_713);
    float _832 = trunc(_828);
    int _834 = int(_832);
    bool _836 = !_830;
    int _838 = _836 ? 0 : (-1);
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _842 = _840 != 0;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _850 = _848 != 0;
    int _852 = ~_808;
    int _854 = _852 + _838;
    int _856 = _854 + 1;
    float _858 = -_812;
    float _860 = _777 + _858;
    float _862 = float(_792);
    float _864 = _143 * _723;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _868 = _866 != 0;
    int _870 = _713 * _856;
    int _872 = _870 + _755;
    float _874 = 1.0 / _862;
    float _876 = _860 * _757;
    bool _878 = !_842;
    int _880 = _878 ? 0 : 1;
    int _882 = ~_834;
    int _884 = _882 + 1;
    int _886 = _884 + 1;
    bool _888 = !_741;
    int _890 = _888 ? _872 : (-1);
    float _892 = trunc(_876);
    int _894 = int(_892);
    bool _896 = !_868;
    int _898 = _896 ? 0 : 1;
    int _900 = _890 * _886;
    int _902 = _713 + (-1);
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _906 = _904 != 0;
    int _908 = abs(_898);
    int _910 = _834 * _902;
    int _912 = _910 + _900;
    float _914 = _864 * _757;
    bool _916 = !_846;
    int _918 = _916 ? 0 : 1;
    bool _920 = !_850;
    int _922 = _920 ? 0 : 1;
    int _924 = abs(_918);
    float _926 = trunc(_914);
    int _928 = int(_926);
    float _930 = _143 * _874;
    int _932 = abs(_880);
    int _934 = _894 * _908;
    int _936 = _934 + _755;
    bool _938 = !_906;
    int _940 = _938 ? 0 : 1;
    int _942 = _912 * _924;
    int _944 = abs(_922);
    float _946 = trunc(_930);
    int _948 = int(_946);
    int _950 = abs(_940);
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _954 = _952 != 0;
    int _956 = _928 * _932;
    int _958 = _956 + _942;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _962 = _960 != 0;
    int _964 = _936 * _944;
    int _966 = _964 + _958;
    int _968 = as_type<int>(_779) + (-2);
    int _970 = ~_713;
    int _972 = _970 + 1;
    int _974 = _894 * _950;
    int _976 = _974 + _966;
    float _978 = float(uint(_948));
    float _980 = float(uint(_976));
    float _982 = as_type<float>(_968) * _978;
    int _984 = ~_749;
    int _986 = _984 + 1;
    float _988 = trunc(_982);
    float _990 = precise::max(_988, 0.0);
    uint _992 = uint(_990);
    float _994 = as_type<float>(_751) * _980;
    float _996 = trunc(_994);
    float _998 = precise::max(_996, 0.0);
    uint _1000 = uint(_998);
    int _1002 = _986 * int(_992);
    int _1004 = _1002 + _948;
    float _1006 = _994;
    if (_954)
    {
        _1006 = _129;
    }
    float _1008 = _1006;
    float _1010 = _1008;
    if (!_954)
    {
        _1010 = _699;
    }
    float _1012 = _1010;
    float _1014 = float(uint(_1004));
    int _1016 = _972 * int(_1000);
    int _1018 = _1016 + _976;
    float _1020 = as_type<float>(_968) * _1014;
    float _1022 = float(uint(_1018));
    float _1024 = as_type<float>(_1018);
    if (_954)
    {
        _1024 = 1.0;
    }
    float _1026 = _1024;
    float _1028 = trunc(_1020);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    float _1034 = _1026;
    if (!_954)
    {
        _1034 = 1.2345600128173828125;
    }
    float _1036 = _1034;
    float _1038 = as_type<float>(_751) * _1022;
    float _1040 = _1036 * _1012;
    int _1042 = ~_749;
    int _1044 = _1042 + 1;
    float _1046 = trunc(_1038);
    float _1048 = precise::max(_1046, 0.0);
    uint _1050 = uint(_1048);
    int _1052 = int(_992) + int(_1032);
    int _1054 = ~_713;
    int _1056 = _1054 + 1;
    float _1058 = floor(_1040);
    int _1060 = _1044 * _1052;
    int _1062 = _1060 + _948;
    int _1064 = int(_1000) + int(_1050);
    float _1066 = float(_749);
    float _1068 = float(_948);
    int _1070 = _1056 * _1064;
    int _1072 = _1070 + _976;
    bool _1074 = uint(_1062) >= uint(_749);
    bool _1076 = _1068 >= _1066;
    bool _1078 = isnan(_1068);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(_1066);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    bool _1088 = uint(_1072) >= uint(_713);
    float _1090 = trunc(_1086);
    int _1092 = int(_1090);
    bool _1094 = !_1074;
    int _1096 = _1094 ? 0 : (-1);
    float _1098 = -_1058;
    float _1100 = _1040 + _1098;
    bool _1102 = !_962;
    int _1104 = _1102 ? 0 : 1;
    bool _1106 = !_1088;
    int _1108 = _1106 ? 0 : (-1);
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1112 = _1110 != 0;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1116 = _1114 != 0;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1120 = _1118 != 0;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1124 = _1122 != 0;
    int _1126 = ~_1052;
    int _1128 = _1126 + _1096;
    int _1130 = _1128 + 1;
    float _1132 = _1100 * _1066;
    int _1134 = abs(_1104);
    float _1136 = _864 * _1066;
    bool _1138 = !_1116;
    int _1140 = _1138 ? 0 : 1;
    int _1142 = _749 * _1130;
    int _1144 = _1142 + _948;
    bool _1146 = _749 == 0;
    float _1148 = trunc(_1132);
    int _1150 = int(_1148);
    int _1152 = ~_1092;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    bool _1158 = !_1146;
    int _1160 = _1158 ? _1144 : (-1);
    int _1162 = ~_1064;
    int _1164 = _1162 + _1108;
    int _1166 = _1164 + 1;
    int _1168 = abs(_1140);
    int _1170 = _1160 * _1156;
    int _1172 = _749 + (-1);
    int _1174 = _713 * _1166;
    int _1176 = _1174 + _976;
    float _1178 = trunc(_1136);
    int _1180 = int(_1178);
    int _1182 = _1092 * _1172;
    int _1184 = _1182 + _1170;
    bool _1186 = _713 == 0;
    int _1188 = _1184 * _1168;
    bool _1190 = !_1120;
    int _1192 = _1190 ? 0 : 1;
    int _1194 = _1150 * _1134;
    int _1196 = _1194 + _948;
    bool _1198 = !_1112;
    int _1200 = _1198 ? 0 : 1;
    bool _1202 = !_1186;
    int _1204 = _1202 ? _1176 : (-1);
    int _1206 = abs(_1200);
    bool _1208 = !_1124;
    int _1210 = _1208 ? 0 : 1;
    int _1212 = abs(_1192);
    int _1214 = _1204 & 3;
    bool _1216 = _1214 != 0;
    int _1218 = abs(_1210);
    bool _1220 = uint(_1214) > 1u;
    int _1222 = _1180 * _1206;
    int _1224 = _1222 + _1188;
    int _1226 = _1204 & 3;
    bool _1228 = _1226 != 0;
    int _1230 = _1196 * _1212;
    int _1232 = _1230 + _1224;
    int _1234 = _1228 ? 0 : 1;
    float _1236 = _129 * 2.0;
    bool _1238 = _1214 != 3;
    int _1240 = _1150 * _1218;
    int _1242 = _1240 + _1232;
    int _1244 = ~_1234;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    float _1250 = floor(_1236);
    int _1252 = _1248;
    if (!_1220)
    {
        int _1254 = ~_1234;
        int _1256 = _1254 + 1;
        _1252 = _1256;
    }
    int _1258 = _1252;
    float _1260 = in.m_51.z;
    float _1262 = float(uint(_1242));
    bool _1264 = uint(_1214) >= 2u;
    float _1266 = as_type<float>(_968) * _1262;
    int _1268 = _1264 ? 0 : 1;
    float _1270 = _699 * 2.0;
    bool _1272 = _129 > 0.5;
    float _1274 = trunc(_1266);
    float _1276 = precise::max(_1274, 0.0);
    uint _1278 = uint(_1276);
    int _1280 = ~_1268;
    int _1282 = _1280 + 1;
    int _1284 = _1282 + 1;
    int _1286 = _1284;
    if (_1238)
    {
        int _1288 = ~_1268;
        int _1290 = _1288 + 1;
        _1286 = _1290;
    }
    int _1292 = _1286;
    int _1294 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1296 = _1294 != 0;
    float _1298 = -_393;
    int _1300 = _1272 ? as_type<int>(_1298) : as_type<int>(_393);
    float _1302 = floor(_1270);
    bool _1304 = _1250 > 0.0;
    bool _1306 = !_1296;
    float _1308 = _1306 ? _393 : as_type<float>(_1300);
    bool _1310 = _1250 >= 0.0;
    bool _1312 = isnan(_1250);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan(0.0);
    bool _1318 = _1314 || _1316;
    int _1320 = ~_749;
    int _1322 = _1320 + 1;
    float _1324 = _1308 + 0.5;
    int _1326 = _1318 ? 0 : 1;
    bool _1328 = _699 > 0.5;
    int _1330 = _1322 * int(_1278);
    int _1332 = _1330 + _1242;
    int _1334 = ~_1326;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    float _1340 = -_401;
    int _1342 = _1328 ? as_type<int>(_1340) : as_type<int>(_401);
    bool _1344 = _1260 > 0.5;
    int _1346 = _1338;
    if (!_1304)
    {
        int _1348 = ~_1326;
        int _1350 = _1348 + 1;
        _1346 = _1350;
    }
    int _1352 = _1346;
    float _1354 = _1260 * 2.0;
    float _1356 = float(uint(_1332));
    float _1358 = -_393;
    int _1360 = _1344 ? as_type<int>(_1358) : as_type<int>(_393);
    float _1362 = floor(_1354);
    bool _1364 = _1302 >= 0.0;
    bool _1366 = isnan(_1302);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan(0.0);
    bool _1372 = _1368 || _1370;
    float _1374 = as_type<float>(_968) * _1356;
    bool _1376 = _1302 > 0.0;
    int _1378 = _1372 ? 0 : 1;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1382 = _1380 != 0;
    float _1384 = trunc(_1374);
    float _1386 = precise::max(_1384, 0.0);
    uint _1388 = uint(_1386);
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1392 = _1390 != 0;
    int _1394 = as_type<int>(_1302);
    if (_954)
    {
        _1394 = 0;
    }
    int _1396 = _1394;
    int _1398 = _1396;
    if (!_954)
    {
        _1398 = 1;
    }
    int _1400 = _1398;
    bool _1402 = !_1382;
    float _1404 = _1402 ? _393 : as_type<float>(_1360);
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1412 = _1410 != 0;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1416 = _1414 != 0;
    float _1418 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1420 = log2(_1418);
    int _1422 = ~_1378;
    int _1424 = _1422 + 1;
    int _1426 = _1424 + 1;
    int _1428 = _1426;
    if (!_1376)
    {
        int _1430 = ~_1378;
        int _1432 = _1430 + 1;
        _1428 = _1432;
    }
    int _1434 = _1428;
    bool _1436 = _1362 >= 0.0;
    bool _1438 = isnan(_1362);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan(0.0);
    bool _1444 = _1440 || _1442;
    float _1446 = in.m_51.w;
    bool _1448 = !_1392;
    float _1450 = _1448 ? _401 : as_type<float>(_1342);
    int _1452 = _1444 ? 0 : 1;
    bool _1454 = _1400 != 1;
    int _1456 = ~_749;
    int _1458 = _1456 + 1;
    int _1460 = int(_1278) + int(_1388);
    float _1462 = _143 * _1420;
    bool _1464 = _1362 > 0.0;
    float _1466 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1468 = !_1408;
    int _1470 = _1468 ? 0 : 1;
    int _1472 = _1458 * _1460;
    int _1474 = _1472 + _1242;
    int _1476 = ~_1452;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    float _1482 = exp2(_1462);
    bool _1484 = !_1216;
    int _1486 = _1484 ? 0 : 1;
    float _1488 = -_721;
    float _1490 = fma(_1466, 2.0, _1488);
    bool _1492 = uint(_1474) >= uint(_749);
    float _1494 = in.m_57.w;
    float _1496 = -_143;
    float _1498 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1490);
    float _1500 = 0.0;
    int _1502 = _1480;
    if (!_1454)
    {
        _1500 = _699;
    }
    float _1504 = _1500;
    float _1506 = _1504;
    if (!_1464)
    {
        int _1508 = ~_1452;
        int _1510 = _1508 + 1;
        _1502 = _1510;
    }
    int _1512 = _1502;
    float _1514 = _623 * _173;
    float _1516 = 0.0;
    if (!_1454)
    {
        _1516 = _699;
    }
    float _1518 = _1516;
    float _1520 = 0.0;
    float _1522 = _1518;
    if (!_1454)
    {
        _1520 = _1260;
    }
    float _1524 = _1520;
    float _1526 = fma(_629, _171, _1514);
    float _1528 = 0.0;
    float _1530 = _1524;
    if (!_1454)
    {
        _1528 = _1260;
    }
    float _1532 = _1528;
    float _1534 = -_1482;
    float _1536 = _1534 + 1.0;
    float _1538 = _1532;
    if (_1454)
    {
        _1506 = _129;
    }
    float _1540 = _1506;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1544 = _693 + _1542;
    if (_1454)
    {
        _1522 = _129;
    }
    float _1546 = _1522;
    float _1548 = fma(_653, _175, _1526);
    if (_1454)
    {
        _1530 = _699;
    }
    float _1550 = _1530;
    if (_1454)
    {
        _1538 = _699;
    }
    float _1552 = _1538;
    bool _1554 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1556 = isnan(0.0);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1562 = _1558 || _1560;
    bool _1564 = !_1492;
    int _1566 = _1564 ? 0 : (-1);
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1570 = _1568 != 0;
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1574 = _1572 != 0;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1578 = _1576 != 0;
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1580;
    float _1584 = _1562 ? _1536 : 0.0;
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1588 = _1586 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1590 = _1446 > 0.5;
    float _1592 = 1.0 / _1582;
    float _1594 = _1584 * _761;
    bool _1596 = !_1416;
    int _1598 = _1596 ? 0 : 1;
    int _1600 = ~_1460;
    int _1602 = _1600 + _1566;
    int _1604 = _1602 + 1;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1606;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1612 = 1.0 / _1588;
    float _1614 = _699 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1616 = _749 * _1604;
    int _1618 = _1616 + _1242;
    int _1620 = abs(_1598);
    float _1622 = fma(_1614, -2.0, _1610);
    float _1624 = fma(_653, _181, _717);
    float _1626 = _1544 * _1592;
    float _1628 = fma(_653, _169, _715);
    float _1630 = _129 + _699;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1634 = _693 + _1632;
    float _1636 = 1.0 / _1608;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1640 = _693 + _1638;
    float _1642 = _1630 + (-1.0);
    float _1644 = _129 + _1260;
    float _1646 = _1634 * _1612;
    float _1648 = _1260 + _699;
    float _1650 = float(uint(_936));
    float _1652 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1654 = _1644 + (-1.0);
    float _1656 = _1648 + (-1.0);
    float _1658 = as_type<float>(_751) * _1650;
    float _1660 = _1624 + _719;
    float _1662 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1664 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1666;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1670;
    float _1674 = trunc(_1658);
    float _1676 = precise::max(_1674, 0.0);
    uint _1678 = uint(_1676);
    float _1680 = _1640 * _1636;
    float _1682 = _1548 + _1494;
    float _1684 = fma(_1668, _1626, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1686 = fma(_1672, _1626, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1688 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1690 = isnan(_693);
    bool _1692 = _1688 || _1690;
    bool _1694 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1696 = _1692 || _1694;
    float _1698 = float(_1696);
    float _1700 = _1628 + _727;
    bool _1702 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1704 = isnan(_693);
    bool _1706 = _1702 || _1704;
    bool _1708 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1710 = _1706 || _1708;
    float _1712 = float(_1710);
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1718 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1720 = isnan(_693);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1726 = _1722 || _1724;
    float _1728 = float(_1726);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1732 = _1730 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1734 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1736 = isnan(_693);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1742 = _1738 || _1740;
    float _1744 = float(_1742);
    float _1746 = -_1698;
    float _1748 = _1746 + 1.0;
    int _1750 = ~_713;
    int _1752 = _1750 + 1;
    float _1754 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1622);
    float _1756 = fma(_1716, _1646, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1758 = -_1744;
    float _1760 = _1758 + 1.0;
    float _1762 = _1744 * _1748;
    float _1764 = fma(_1732, _1646, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1766 = float(_1620);
    float _1768 = _1728 * _1760;
    float _1770 = -_1728;
    float _1772 = _1770 + 1.0;
    float _1774 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1498);
    int _1776 = _1752 * int(_1678);
    int _1778 = _1776 + _936;
    float _1780 = _1712 * _1772;
    float _1782 = -_1712;
    float _1784 = _1782 + 1.0;
    float _1786 = _1450 + (-0.5);
    float _1788 = float(uint(_1778));
    float _1790 = _1684 * _1780;
    float _1792 = _1686 * _1780;
    float _1794 = -_1786;
    float _1796 = -_1754;
    float _1798 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1796);
    float _1800 = as_type<float>(_751) * _1788;
    float _1802 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1790);
    float _1804 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1792);
    float _1806 = float(uint(_1196));
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1810 = trunc(_1800);
    float _1812 = precise::max(_1810, 0.0);
    uint _1814 = uint(_1812);
    float _1816 = as_type<float>(_968) * _1806;
    float _1818 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1808);
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1822 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1828 = trunc(_1816);
    float _1830 = precise::max(_1828, 0.0);
    uint _1832 = uint(_1830);
    float _1834 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1820);
    float _1836 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1838 = -_1824;
    float _1840 = fma(_1822, 2.0, _1838);
    int _1842 = ~_749;
    int _1844 = _1842 + 1;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1848 = _1682 + _1846;
    float _1850 = fma(_1836, -2.0, _1826);
    float _1852 = float(_1434);
    float _1854 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1818);
    float _1856 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1850);
    int _1858 = abs(_1470);
    float _1860 = _1766 * _1852;
    float _1862 = float(_1512);
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1866 = _1700 + _1864;
    float _1868 = float(_1858);
    int _1870 = _1844 * int(_1832);
    int _1872 = _1870 + _1196;
    int _1874 = int(_1678) + int(_1814);
    float _1876 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1878 = _1660 + _1876;
    int _1880 = ~_713;
    int _1882 = _1880 + 1;
    float _1884 = _1868 * _1862;
    float _1886 = float(uint(_1872));
    float _1888 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1834);
    bool _1890 = !_1146;
    int _1892 = _1890 ? _1618 : (-1);
    int _1894 = _1882 * _1874;
    int _1896 = _1894 + _936;
    float _1898 = -_401;
    int _1900 = _1590 ? as_type<int>(_1898) : as_type<int>(_401);
    float _1902 = as_type<float>(_968) * _1886;
    int _1904 = _1204 >> 31;
    float _1906 = _1404 + 0.5;
    bool _1908 = uint(_1896) >= uint(_713);
    float _1910 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1912 = _1892 >> 31;
    float _1914 = trunc(_1902);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    int _1920 = _1904 & 3;
    float _1922 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1910);
    bool _1924 = !_1412;
    int _1926 = _1924 ? 0 : 1;
    float _1928 = _1884 * (-2.0);
    int _1930 = _1912 & 3;
    float _1932 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1922);
    int _1934 = _1204 + _1920;
    float _1936 = -_1888;
    float _1938 = _1936 + 1.0;
    int _1940 = abs(_1926);
    float _1942 = fma(_1652, _1928, _1652);
    int _1944 = _1892 + _1930;
    bool _1946 = !_1578;
    float _1948 = _1946 ? _401 : as_type<float>(_1900);
    int _1950 = _1934 >> 2;
    float _1952 = float(_1352);
    float _1954 = _1948 + (-0.5);
    float _1956 = float(_1940);
    bool _1958 = _1214 != 3;
    float _1960 = -_1954;
    float _1962 = -_1856;
    float _1964 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1962);
    int _1966 = _1944 >> 2;
    float _1968 = _1956 * _1952;
    int _1970 = _1950 << 4;
    int _1972 = _1970 + 368;
    float _1974 = -_143;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1840);
    bool _1978 = !_1958;
    int _1980 = _1978 ? 0 : (-1);
    float _1982 = in.m_66.x;
    float _1984 = in.m_66.y;
    float _1986 = in.m_66.z;
    bool _1988 = !_1908;
    int _1990 = _1988 ? 0 : (-1);
    uint _1992 = uint(int(uint(_1972) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    int _2008 = _1892 & 3;
    bool _2010 = _2008 != 0;
    float _2012 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1976);
    int _2014 = _1966 << 4;
    int _2016 = _2014 + 512;
    int _2018 = _1892 & 3;
    bool _2020 = _2018 != 0;
    int _2022 = _2010 ? 0 : 1;
    uint _2024 = uint(int(uint(_2016) >> uint(2)));
    uint _2026 = uint(int(uint(int(_2024)) >> uint(2)));
    int _2028 = int(_2024) & 3;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[int(_2026)][_2028];
    int _2032 = int(_2024) + 1;
    uint _2034 = uint(int(uint(_2032) >> uint(2)));
    int _2036 = _2032 & 3;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[int(_2034)][_2036];
    bool _2040 = !_2020;
    int _2042 = _2040 ? 0 : 1;
    bool _2044 = uint(_2018) > 1u;
    bool _2046 = _1932 >= 0.0;
    int _2048 = ~_2022;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    int _2054 = _1972 + 8;
    uint _2056 = uint(int(uint(_2054) >> uint(2)));
    uint _2058 = uint(int(uint(int(_2056)) >> uint(2)));
    int _2060 = int(_2056) & 3;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[int(_2058)][_2060];
    int _2064 = int(_2056) + 1;
    uint _2066 = uint(int(uint(_2064) >> uint(2)));
    int _2068 = _2064 & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = int(_1832) + int(_1918);
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2076 = ~_1874;
    int _2078 = _2076 + _1990;
    int _2080 = _2078 + 1;
    int _2082 = abs(_1292);
    int _2084 = _773 * _2072;
    int _2086 = _2084 + _1196;
    float _2088 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2074);
    int _2090 = _2052;
    float _2092 = as_type<float>(_1832);
    if (!_2044)
    {
        int _2094 = ~_2022;
        int _2096 = _2094 + 1;
        _2090 = _2096;
    }
    int _2098 = _2090;
    float _2100 = _129 + (-0.5);
    int _2102 = _2016 + 8;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    uint _2106 = uint(int(uint(int(_2104)) >> uint(2)));
    int _2108 = int(_2104) & 3;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[int(_2106)][_2108];
    int _2112 = int(_2104) + 1;
    uint _2114 = uint(int(uint(_2112) >> uint(2)));
    int _2116 = _2112 & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    bool _2120 = uint(_2018) >= 2u;
    float _2122 = fma(_1928, _1982, _1982);
    float _2124 = _1986;
    if (_2046)
    {
        _2092 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2126 = _2092;
    int _2128 = _2120 ? 0 : 1;
    float _2130 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2122);
    bool _2132 = uint(_2086) >= uint(_749);
    int _2134 = as_type<int>(_2126);
    if (_2046)
    {
        float _2136 = _2126 * 5.0;
        _2134 = as_type<int>(_2136);
    }
    int _2138 = _2134;
    int _2140 = abs(_2098);
    int _2142 = _713 * _2080;
    int _2144 = _2142 + _936;
    bool _2146 = !_2132;
    int _2148 = _2146 ? 0 : (-1);
    float _2150 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2088);
    bool _2152 = _2018 != 3;
    if (_2046)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6854 = as_type<float>(_2138);
        out.gl_Position.z = _6854;
    }
    int _2154 = abs(_1258);
    bool _2156 = !_2152;
    int _2158 = _2156 ? 0 : (-1);
    if (_2046)
    {
        out.m_47.x = 0.0;
    }
    bool _2160 = _2018 != 3;
    int _2162 = ~_2072;
    int _2164 = _2162 + _2148;
    int _2166 = _2164 + 1;
    bool _2168 = _713 == 0;
    int _2170 = _749 * _2166;
    int _2172 = _2170 + _1196;
    int _2174 = ~_2154;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    int _2180 = abs(_1486);
    int _2182 = ~_2140;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    int _2188 = _2178 * as_type<int>(_2006);
    int _2190 = abs(_2042);
    int _2192 = ~_2180;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    int _2198 = _2186 * as_type<int>(_2038);
    int _2200 = ~_2190;
    int _2202 = _2200 + 1;
    int _2204 = _2202 + 1;
    int _2206 = _2196 * as_type<int>(_1998);
    int _2208 = _2206 + _2188;
    int _2210 = ~_2128;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    int _2216 = ~_2082;
    int _2218 = _2216 + 1;
    int _2220 = _2218 + 1;
    int _2222 = _2204 * as_type<int>(_2030);
    int _2224 = _2222 + _2198;
    int _2226 = _2214;
    if (_2160)
    {
        int _2228 = ~_2128;
        int _2230 = _2228 + 1;
        _2226 = _2230;
    }
    int _2232 = _2226;
    int _2234 = abs(_2158);
    int _2236 = _2220 * as_type<int>(_2062);
    int _2238 = _2236 + _2208;
    int _2240 = abs(_2232);
    bool _2242 = !_1570;
    int _2244 = _2242 ? 0 : 1;
    int _2246 = abs(_1980);
    int _2248 = ~_2240;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = abs(_2244);
    int _2256 = ~_2246;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    int _2262 = _2252 * as_type<int>(_2110);
    int _2264 = _2262 + _2224;
    int _2266 = ~_2234;
    int _2268 = _2266 + 1;
    int _2270 = _2268 + 1;
    float _2272 = _1866 * _1866;
    bool _2274 = !_1574;
    int _2276 = _2274 ? 0 : 1;
    int _2278 = _2260 * as_type<int>(_2070);
    int _2280 = _2278 + _2238;
    int _2282 = _2270 * as_type<int>(_2118);
    int _2284 = _2282 + _2264;
    int _2286 = abs(_2276);
    float _2288 = fma(_1848, _1848, _2272);
    bool _2290 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2292 = isnan(1.0);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2298 = _2294 || _2296;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2302 = fma(_1878, _1878, _2288);
    int _2304 = ~_2254;
    int _2306 = _2304 + 1;
    int _2308 = _2306 + 1;
    float _2310 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2300);
    int _2312 = ~_2286;
    int _2314 = _2312 + 1;
    int _2316 = _2314 + 1;
    float _2318 = rsqrt(_2302);
    int _2320 = _2280 * _2308;
    bool _2322 = !_2168;
    int _2324 = _2322 ? _2144 : (-1);
    int _2326 = _2284 * _2316;
    bool _2328 = !_1146;
    int _2330 = _2328 ? _2172 : (-1);
    float _2332 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2310);
    int _2334 = _2324 * _2254;
    int _2336 = _2334 + _2320;
    float _2338 = -_2150;
    float _2340 = _2338 + 1.0;
    int _2342 = _2330 * _2286;
    int _2344 = _2342 + _2326;
    float _2346 = -_1854;
    float _2348 = _2346 + 1.0;
    float _2350 = -_2332;
    float _2352 = _2350 + 1.0;
    float _2354 = -_2340;
    float _2356 = fma(_1308, _2354, _1774);
    float _2358 = float(_2336);
    float _2360 = -_2348;
    float _2362 = fma(_1404, _2360, _2012);
    float _2364 = fma(_1450, _2352, _1798);
    float _2366 = fma(_1948, _1938, _1964);
    float _2368 = _1866 * _2318;
    float _2370 = float(_2344);
    float _2372 = _1848 * _2318;
    bool _2374 = !_2298;
    float _2376 = _2374 ? _143 : _1594;
    float _2378 = -_2368;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1866);
    out.m_68.x = _2356;
    out.m_68.y = _2364;
    out.m_68.z = _2362;
    out.m_68.w = _2366;
    float _2382 = -_2372;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1848);
    float _2386 = fma(_2376, _1942, _2130);
    out.m_70.x = _2358;
    out.m_70.y = _2370;
    float _2388 = _2380 * _2380;
    if (_2046)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2390 = -_2368;
    float _2392 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1700);
    float _2394 = _1878 * _2318;
    float _2396 = fma(_2384, _2384, _2388);
    float _2398 = -_2372;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1682);
    float _2402 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2404 = _2392 + _2402;
    float _2406 = -_2394;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1878);
    float _2410 = -_2394;
    float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1660);
    float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2416 = _2400 + _2414;
    float _2418 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2420 = fma(_2408, _2408, _2396);
    float _2422 = _1968 * (-2.0);
    float _2424 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2426 = _2412 + _2424;
    float _2428 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2418);
    float _2430 = _699 + (-0.5);
    float _2432 = fma(_2422, _1984, _1984);
    float _2434 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2428);
    float _2436 = fma(_1664, _2422, _1664);
    float _2438 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2432);
    float _2440 = fma(_1764, _1768, _1804);
    float _2442 = in.m_64.x;
    float _2444 = in.m_64.y;
    bool _2446 = _2434 >= 0.0;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2448;
    float _2452 = fma(_2376, _2436, _2438);
    float _2454 = _1860 * (-2.0);
    float _2456 = _2386 * 0.15915493667125701904296875;
    float _2458 = fma(_2450, _1680, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2460 = _2452 * 0.15915493667125701904296875;
    float _2462 = fma(_2454, _1986, _1986);
    float _2464 = fma(_2458, _1762, _2440);
    float _2466 = _1260 + (-0.5);
    float _2468 = sqrt(_2420);
    float _2470 = fma(_1662, _2454, _1662);
    float _2472 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2464);
    if (_2446)
    {
        _2124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2474 = _2124;
    float _2476 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2462);
    float _2478 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2480 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2478;
    int _2482 = as_type<int>(_2474);
    if (_2446)
    {
        out.m_47.x = 0.0;
    }
    float _2484 = _2456 * 6.283185482025146484375;
    float _2486 = sin(_2484);
    if (_2446)
    {
        float _2488 = _2474 * 5.0;
        _2482 = as_type<int>(_2488);
    }
    int _2490 = _2482;
    float _2492 = fma(_2376, _2470, _2476);
    float _2494 = fma(_1756, _1768, _1802);
    float _2496 = _2472 * _2444;
    float _2498 = fma(_2480, _1680, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    if (_2446)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7386 = as_type<float>(_2490);
        out.gl_Position.z = _7386;
    }
    float _2500 = _2492 * 0.15915493667125701904296875;
    float _2502 = _2456 * 6.283185482025146484375;
    float _2504 = cos(_2502);
    float _2506 = _2460 * 6.283185482025146484375;
    float _2508 = sin(_2506);
    float _2510 = _2460 * 6.283185482025146484375;
    float _2512 = cos(_2510);
    if (_2446)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2514 = _2500 * 6.283185482025146484375;
    float _2516 = cos(_2514);
    float _2518 = fma(_2498, _1762, _2494);
    float _2520 = _2318 * _2468;
    float _2522 = _2496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2524 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _401);
    float _2526 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2518);
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _393);
    float _2530 = _2520 * _2522;
    float _2532 = _2500 * 6.283185482025146484375;
    float _2534 = sin(_2532);
    float _2536 = _2526 * _2442;
    float _2538 = _2486 * _2512;
    float _2540 = _2524 * _2530;
    float _2542 = _2486 * _2508;
    float _2544 = _2536 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2546 = _2504 * _2512;
    float _2548 = _2504 * _2508;
    float _2550 = _2504 * _2516;
    float _2552 = _2520 * _2544;
    float _2554 = _2512 * _2516;
    float _2556 = _2486 * _2516;
    float _2558 = _2508 * _2516;
    float _2560 = _2528 * _2552;
    float _2562 = _2550 * _2540;
    float _2564 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2566 = _2564 * 0.5;
    float _2568 = fma(_2534, _2546, _2542);
    float _2570 = -_2538;
    float _2572 = fma(_2534, _2548, _2570);
    float _2574 = -_2540;
    float _2576 = _2534 * _2574;
    float _2578 = fma(_2534, _2542, _2546);
    float _2580 = fma(_2568, _2560, _2562);
    float _2582 = -_2548;
    float _2584 = fma(_2534, _2538, _2582);
    float _2586 = _2556 * _2540;
    float _2588 = fma(_2554, _2560, _2576);
    float _2590 = fma(_2572, _2566, _2580);
    float _2592 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2594 = fma(_2584, _2560, _2586);
    float _2596 = fma(_2558, _2566, _2588);
    float _2598 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2600 = _2568 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2602 = fma(_2578, _2566, _2594);
    float _2604 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2606 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2598);
    float _2608 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2600);
    float _2610 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2612 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2604);
    float _2614 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2606);
    float _2616 = -_2534;
    float _2618 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2592);
    float _2620 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2610);
    float _2622 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2612);
    float _2624 = _2614 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2626 = _2568 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2628 = _2622 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2630 = _1660 + _2624;
    float _2632 = _2568 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2634 = _401 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2636 = _1682 + _2628;
    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2640 = _2630 + _2638;
    float _2642 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2632);
    float _2644 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2626);
    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2648 = _2636 + _2646;
    float _2650 = _2640 * _2640;
    float _2652 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2654 = fma(_2648, _2648, _2650);
    float _2656 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2658 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2652);
    float _2660 = sqrt(_2654);
    float _2662 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2656);
    float _2664 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2666 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2668 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2658);
    float _2670 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2662);
    float _2672 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2674 = -_2534;
    float _2676 = fma(_2674, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2664);
    float _2678 = fma(_2634, _2634, 1.0);
    float _2680 = -_2534;
    float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2666);
    float _2684 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2672);
    float _2686 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2688 = rsqrt(_2678);
    float _2690 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2618);
    float _2692 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2684);
    float _2694 = _1700 + _2686;
    bool _2696 = _2660 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2698 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2676);
    float _2700 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2682);
    float _2702 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2620);
    float _2704 = _2684;
    float _2706 = _2618;
    float _2708 = _2658;
    if (!_2696)
    {
        _2704 = _2636;
    }
    float _2710 = _2704;
    float _2712 = _2710;
    if (!_2696)
    {
        _2706 = _2630;
    }
    float _2714 = _2706;
    float _2716 = _2714;
    if (!_2696)
    {
        _2708 = _2694;
    }
    float _2718 = _2708;
    bool _2720 = !_2696;
    float _2722 = _2718;
    if (!_2720)
    {
        float _2724 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2728 = _2660 + _2726;
        float _2730 = rsqrt(_2654);
        float _2732 = _2728 * _2724;
        float _2734 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2736 = _2732 * 0.15915493667125701904296875;
        float _2738 = _2736 * 6.283185482025146484375;
        float _2740 = cos(_2738);
        float _2742 = _2736 * 6.283185482025146484375;
        float _2744 = sin(_2742);
        float _2746 = _2740 + (-1.0);
        float _2748 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2750 = fma(_2744, _2734, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2752 = fma(_2694, _2740, _2748);
        float _2754 = _2730 * _2750;
        float _2756 = fma(_2648, _2754, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2758 = fma(_2640, _2754, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2722 = _2752;
        _2712 = _2756;
        _2716 = _2758;
    }
    float _2760 = _2722;
    float _2762 = _2712;
    float _2764 = _2716;
    float _2766 = -_1700;
    float _2768 = _2766 + _2760;
    float _2770 = -_1682;
    float _2772 = _2770 + _2762;
    float _2774 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2642);
    float _2776 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2644);
    float _2778 = _2768 * _2768;
    float _2780 = _393 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2782 = -_1660;
    float _2784 = _2782 + _2764;
    float _2786 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2608);
    float _2788 = fma(_2772, _2772, _2778);
    float _2790 = _2634 * _2688;
    float _2792 = _2634 * _2698;
    float _2794 = _2634 * _2690;
    float _2796 = fma(_2784, _2784, _2788);
    float _2798 = _2634 * _2700;
    float _2800 = -_2668;
    float _2802 = _2790 * _2800;
    float _2804 = -_2702;
    float _2806 = _2790 * _2804;
    float _2808 = sqrt(_2796);
    float _2810 = -_2692;
    float _2812 = _2790 * _2810;
    float _2814 = fma(_2780, _2774, _2792);
    float _2816 = fma(_2780, _2776, _2794);
    float _2818 = fma(_2780, _2786, _2798);
    float _2820 = fma(_2688, _2690, _2806);
    float _2822 = fma(_2688, _2698, _2802);
    float _2824 = fma(_2688, _2700, _2812);
    float _2826 = _2668 + _2814;
    float _2828 = _2702 + _2816;
    float _2830 = _2692 + _2818;
    out.m_72.x = _2774;
    out.m_72.y = _2776;
    out.m_72.z = _2786;
    out.m_74.x = _2822;
    out.m_74.y = _2820;
    out.m_74.z = _2824;
    bool _2832 = _2808 > 0.0;
    out.m_76.x = _2826;
    out.m_76.y = _2828;
    out.m_76.z = _2830;
    bool _2834 = !_2832;
    float _2836 = _2820;
    float _2838 = _2774;
    float _2840 = _2762;
    float _2842 = _2760;
    float _2844 = _2764;
    float _2846 = _2776;
    if (!_2834)
    {
        bool _2848 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2850 = _2776;
        if (_2848)
        {
            float _2852 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2850 = _2852;
        }
        float _2854 = _2850;
        float _2856 = _2854;
        if (_2848)
        {
            float _2858 = _655 * _2854;
            _2836 = _2858;
        }
        float _2860 = _2836;
        float _2862 = _2860;
        if (_2848)
        {
            float _2864 = _657 * _2854;
            _2838 = _2864;
        }
        float _2866 = _2838;
        float _2868 = _2866;
        if (_2848)
        {
            float _2870 = _659 * _2854;
            _2856 = _2870;
        }
        float _2872 = _2856;
        float _2874 = _2872;
        if (!_2848)
        {
            bool _2876 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2878 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2880 = _2876 || _2878;
            bool _2882 = isnan(1.0);
            bool _2884 = _2880 || _2882;
            float _2886 = _143 + 1.0;
            float _2888 = _2886;
            if (!_2884)
            {
                float _2890 = _2886 * _2886;
                float _2892 = _2890 * 0.5;
                _145 = _2892;
            }
            float _2894 = _145;
            float _2896 = _2894;
            if (!_2884)
            {
                float _2898 = _2894 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2896 = _2898;
            }
            float _2900 = _2896;
            bool _2902 = !_2884;
            float _2904 = _2900;
            if (!_2902)
            {
                float _2906 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2908 = log2(_2906);
                float _2910 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2912 = 1.0 + _2910;
                float _2914 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2916 = _2908 * _2886;
                float _2918 = 1.0 / _2912;
                float _2920 = _2914 * 0.693147182464599609375;
                float _2922 = exp2(_2916);
                float _2924 = 1.0 / _2920;
                float _2926 = _2922 + (-1.0);
                float _2928 = -_2926;
                float _2930 = fma(_2928, _2924, _2886);
                float _2932 = _2930 * _2918;
                float _2934 = _2932 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2904 = _2934;
            }
            float _2936 = _2904;
            float _2938 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2940 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2942 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2944 = _2936;
            if (!_2884)
            {
                _2944 = _2886;
            }
            float _2946 = _2944;
            float _2948 = _2938 * _385;
            float _2950 = _2938 * _337;
            float _2952 = _2938 * _411;
            float _2954 = fma(_2940, _367, _2948);
            float _2956 = fma(_2940, _333, _2950);
            float _2958 = fma(_2942, _389, _2954);
            bool _2960 = !_2884;
            float _2962 = _2946;
            if (!_2960)
            {
                float _2964 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2966 = log2(_2964);
                float _2968 = _2966 * _2886;
                float _2970 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2972 = 1.0 + _2970;
                float _2974 = exp2(_2968);
                float _2976 = 1.0 / _2972;
                float _2978 = -_2974;
                float _2980 = _2978 + 1.0;
                float _2982 = _2980 * _2976;
                _2962 = _2982;
                _2888 = _2972;
            }
            float _2984 = _2962;
            float _2986 = _2888;
            float _2988 = fma(_2940, _407, _2952);
            float _2990 = fma(_2942, _341, _2956);
            float _2992 = fma(_2984, _261, _2958);
            float _2994 = fma(_2942, _415, _2988);
            float _2996 = fma(_2984, _259, _2990);
            float _2998 = -_617;
            float _3000 = _2998 + _2992;
            float _3002 = fma(_2984, _263, _2994);
            float _3004 = -_621;
            float _3006 = _3004 + _2996;
            float _3008 = _3000 * _173;
            float _3010 = _3000 * _167;
            float _3012 = _3000 * _179;
            float _3014 = -_635;
            float _3016 = _3014 + _3002;
            float _3018 = fma(_3006, _171, _3008);
            float _3020 = fma(_3006, _165, _3010);
            float _3022 = fma(_3006, _177, _3012);
            float _3024 = fma(_3016, _175, _3018);
            float _3026 = fma(_3016, _169, _3020);
            float _3028 = fma(_3016, _181, _3022);
            _663 = _3026;
            _665 = _3024;
            _667 = _3028;
            _2862 = _3024;
            _2868 = _3026;
            _2874 = _3028;
            _227 = _2986;
        }
        float _3030 = _663;
        float _3032 = _665;
        float _3034 = _667;
        float _3036 = _2862;
        float _3038 = _2868;
        float _3040 = _2874;
        float _3042 = _227;
        float _3044 = _3030 * _3030;
        float _3046 = rsqrt(_2796);
        float _3048 = fma(_3032, _3032, _3044);
        float _3050 = fma(_3034, _3034, _3048);
        float _3052 = sqrt(_3050);
        float _3054 = _2772 * _3046;
        float _3056 = _2768 * _3046;
        float _3058 = _2784 * _3046;
        bool _3060 = _3052 > 0.0;
        bool _3062 = !_3060;
        _229 = _3042;
        _2846 = _3040;
        if (!_3062)
        {
            float _3064 = rsqrt(_3050);
            float _3066 = _3064 * _3030;
            float _3068 = _3064 * _3032;
            float _3070 = _3064 * _3034;
            float _3072 = _3056 * _3066;
            float _3074 = fma(_3054, _3068, _3072);
            float _3076 = fma(_3058, _3070, _3074);
            float _3078 = _3076 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3080 = fma(_3036, _3078, _2762);
            float _3082 = fma(_3038, _3078, _2760);
            float _3084 = fma(_3040, _3078, _2764);
            _2840 = _3080;
            _2842 = _3082;
            _2844 = _3084;
        }
    }
    float _3086 = _2840;
    float _3088 = _2842;
    float _3090 = _2844;
    float _3092 = _229;
    float _3094 = _2846;
    bool _3096 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3098 = isnan(0.5);
    bool _3100 = _3096 || _3098;
    bool _3102 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3104 = _3100 || _3102;
    float _3106 = -_2372;
    float _3108 = fma(_3106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3086);
    float _3110 = -_2368;
    float _3112 = fma(_3110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3088);
    float _3114 = -_2394;
    float _3116 = fma(_3114, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3090);
    float _3118 = _3112;
    float _3120 = _3108;
    float _3122 = _3116;
    float _3124 = _3094;
    if (!_3104)
    {
        float _3126 = _2404 * _2404;
        float _3128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3130 = -_1682;
        float _3132 = _3130 + _3086;
        float _3134 = -_1700;
        float _3136 = _3134 + _3088;
        float _3138 = fma(_2416, _2416, _3126);
        float _3140 = -_1660;
        float _3142 = _3140 + _3090;
        float _3144 = fma(_2426, _2426, _3138);
        float _3146 = 1.0 / _2520;
        float _3148 = sqrt(_3144);
        float _3150 = precise::min(_3148, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3152 = _3150 * _3128;
        float _3154 = _3152 * _3146;
        float _3156 = fma(_3132, _3154, _2400);
        float _3158 = fma(_3136, _3154, _2392);
        float _3160 = fma(_3142, _3154, _2412);
        _3118 = _3158;
        _3120 = _3156;
        _3122 = _3160;
    }
    float _3162 = _3118;
    float _3164 = _3120;
    float _3166 = _3122;
    float _3168 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3170 = _3162 + _3168;
    float _3172 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3174 = _3164 + _3172;
    float _3176 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3178 = _3166 + _3176;
    float _3180 = _3170 * _3170;
    float _3182 = fma(_3174, _3174, _3180);
    float _3184 = fma(_3178, _3178, _3182);
    float _3186 = rsqrt(_3184);
    float _3188 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3190 = _3174 * _3188;
    float _3192 = _3178 * _3188;
    float _3194 = _3190 * _3190;
    float _3196 = _3192 * _3192;
    float _3198 = _3194 + _3196;
    float _3200 = sqrt(_3198);
    bool _3202 = _3200 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3204 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3206 = _3200 + _3204;
    float _3208 = _3186;
    float _3210 = _3206;
    float _3212 = _3170;
    float _3214 = _3188;
    if (_3202)
    {
        float _3216 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3208 = _3216;
    }
    float _3218 = _3208;
    float _3220 = _3218;
    if (_3202)
    {
        float _3222 = _3206 * _3218;
        _3210 = _3222;
    }
    float _3224 = _3210;
    if (_3202)
    {
        float _3226 = rsqrt(_3198);
        _3220 = _3226;
    }
    float _3228 = _3220;
    float _3230 = _3228;
    if (_3202)
    {
        float _3232 = _3224 * 0.15915493667125701904296875;
        _231 = _3232;
    }
    float _3234 = _231;
    float _3236 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3238 = _3178;
    float _3240 = _3234;
    if (_3202)
    {
        float _3242 = _3234 * 6.283185482025146484375;
        float _3244 = sin(_3242);
        _3238 = _3244;
    }
    float _3246 = _3238;
    float _3248 = precise::max(0.0, _3236);
    float _3250 = _3092;
    if (_3202)
    {
        float _3252 = _3234 * 6.283185482025146484375;
        float _3254 = cos(_3252);
        _3250 = _3254;
    }
    float _3256 = _3250;
    float _3258 = -_3188;
    float _3260 = -_3248;
    float _3262 = fma(_3170, _3258, _3260);
    if (_3202)
    {
        float _3264 = _3262 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3212 = _3264;
    }
    float _3266 = _3212;
    float _3268 = sqrt(_3184);
    float _3270 = _3246;
    float _3272 = _3266;
    if (_3202)
    {
        float _3274 = fma(_3246, _3266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3270 = _3274;
    }
    float _3276 = _3270;
    float _3278 = _3276;
    if (!_3202)
    {
        _3240 = _3194;
    }
    float _3280 = _3240;
    float _3282 = _3280;
    if (_3202)
    {
        float _3284 = _3228 * _3276;
        _3124 = _3284;
    }
    float _3286 = _3124;
    if (!_3202)
    {
        _3230 = _3190;
    }
    float _3288 = _3230;
    float _3290 = _3288;
    float _3292 = _3256;
    if (_3202)
    {
        float _3294 = _3256 + (-1.0);
        _3272 = _3294;
    }
    float _3296 = _3272;
    float _3298 = _3296;
    if (_3202)
    {
        float _3300 = _3190 * _3286;
        _3290 = _3300;
    }
    float _3302 = _3290;
    if (!_3202)
    {
        _3278 = _3262;
    }
    float _3304 = _3278;
    float _3306 = _3162 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3308 = _3304;
    if (_3202)
    {
        float _3310 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3214 = _3310;
    }
    float _3312 = _3214;
    if (!_3202)
    {
        _3298 = _3192;
    }
    float _3314 = _3298;
    float _3316 = _3314;
    if (_3202)
    {
        float _3318 = _3192 * _3286;
        _3316 = _3318;
    }
    float _3320 = _3316;
    if (_3202)
    {
        float _3322 = _3302 * _3302;
        _3282 = _3322;
    }
    float _3324 = _3282;
    if (_3202)
    {
        float _3326 = fma(_3262, _3256, _3312);
        _3308 = _3326;
    }
    float _3328 = _3308;
    if (!_3202)
    {
        _3292 = _3196;
    }
    float _3330 = _3292;
    float _3332 = _3330;
    if (_3202)
    {
        float _3334 = _3320 * _3320;
        _3332 = _3334;
    }
    float _3336 = _3332;
    float _3338 = fma(_3328, _3328, _3324);
    float _3340 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3342 = _3162 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3344 = _3338 + _3336;
    float _3346 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3306);
    float _3348 = _3162 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3350 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3352 = fma(_3268, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3350);
    float _3354 = precise::clamp(_3352, 0.0, 1.0);
    float _3356 = rsqrt(_3344);
    float _3358 = fma(_3166, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3346);
    float _3360 = _3162 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3362 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3348);
    float _3364 = -_3354;
    float _3366 = _3364 + 1.0;
    float _3368 = _3358 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3370 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3360);
    float _3372 = fma(_3166, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3362);
    float _3374 = abs(_3366);
    float _3376 = log2(_3374);
    float _3378 = _3368 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3380 = fma(_3166, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3370);
    float _3382 = _3372 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3384 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3342);
    float _3386 = -_3378;
    float _3388 = fma(_3386, _3340, 1.0);
    float _3390 = _3380 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3392 = _3382 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3394 = _3356 * _3302;
    float _3396 = _3356 * _3328;
    float _3398 = fma(_3166, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3384);
    float _3400 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3392);
    float _3402 = _3394 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3404 = _3356 * _3320;
    float _3406 = _3398 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3408 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3400);
    float _3410 = -_3402;
    float _3412 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3410);
    float _3414 = _3376 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3416 = log2(_3388);
    float _3418 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3408);
    float _3420 = -_3404;
    float _3422 = fma(_3420, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3412);
    float _3424 = _3382 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3426 = fma(_3422, -0.5, 0.5);
    float _3428 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3424);
    float _3430 = exp2(_3414);
    float _3432 = _3382 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3434 = fma(_3422, 0.5, 0.5);
    float _3436 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3428);
    float _3438 = _3396 + 1.0;
    float _3440 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3432);
    float _3442 = fma(_3434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3444 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3436);
    float _3446 = 1.0 / _3418;
    float _3448 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3440);
    float _3450 = fma(_3434, _3442, -0.212114393711090087890625);
    float _3452 = _3416 * 0.693147182464599609375;
    float _3454 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3448);
    float _3456 = fma(_3434, _3450, 1.570728778839111328125);
    float _3458 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3460 = sqrt(_3426);
    float _3462 = -_3396;
    float _3464 = fma(_3430, _3438, _3462);
    float _3466 = fma(_3464, 0.5, 0.5);
    float _3468 = _3444 * _3446;
    float _3470 = _3454 * _3446;
    float _3472 = fma(_3468, 0.5, 0.5);
    float _3474 = fma(_3470, -0.5, 0.5);
    float _3476 = _3460 * 0.636619746685028076171875;
    float3 _8986 = float3(_3472, _3474, _3458);
    float _3478 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8986, float3(0.0), isnan(_8986)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8986, float3(0.0), isnan(_8986)), level(0.0)).x;
    float3 _8997 = float3(_3472, _3474, _3458);
    float4 _3481 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8997, float3(0.0), isnan(_8997)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8997, float3(0.0), isnan(_8997)), level(0.0)).xyzw;
    float _3483 = _3481.x;
    float _3485 = _3481.y;
    float _3487 = _3481.z;
    float _3489 = _3481.w;
    float _3491 = -_3456;
    float _3493 = fma(_3476, _3491, 1.0);
    float2 _9019 = float2(_3493, _3466);
    float3 _3497 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9019, float2(0.0), isnan(_9019)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9019, float2(0.0), isnan(_9019)), level(0.0)).xyz;
    float _3499 = _3497.x;
    float _3501 = _3497.y;
    float _3503 = _3497.z;
    float _3505 = _3376 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3507 = _3382 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3509 = _3418 * 0.5;
    out.m_78.x = _3164;
    out.m_78.y = _3162;
    out.m_78.z = _3166;
    bool _3511 = _3268 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3513 = isnan(_3268);
    bool _3515 = _3511 || _3513;
    bool _3517 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3519 = _3515 || _3517;
    float _3521 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3507);
    float _3523 = exp2(_3505);
    float _3525 = _3444 + _3418;
    float _3527 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3521);
    float _3529 = fma(_3454, -0.5, _3509);
    float _3531 = _3525 * 0.5;
    float _3533 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3527);
    float _3535 = _3533 + _3418;
    out.gl_Position.x = _3444;
    out.gl_Position.y = _3454;
    out.gl_Position.z = _3533;
    out.gl_Position.w = _3418;
    float _3537 = _3535 * 0.5;
    float _3539 = -_3523;
    float _3541 = _3539 + 1.0;
    float _3543 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _3531;
    out.m_80.y = _3529;
    out.m_80.z = _3537;
    out.m_80.w = _3418;
    float _3545 = -_3543;
    float _3547 = _3545 + 1.0;
    float _3549 = _3418;
    float _3551 = _3533;
    float _3553 = _3454;
    float _3555 = _3444;
    float _3557 = _3529;
    float _3559 = _3531;
    if (!_3519)
    {
        _3549 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3561 = _3549;
    float _3563 = _3561;
    float _3565 = _3561;
    if (!_3519)
    {
        _3551 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3567 = _3551;
    float _3569 = _3567;
    float _3571 = _3567;
    if (!_3519)
    {
        _3553 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3573 = _3553;
    float _3575 = _3573;
    float _3577 = _3573;
    if (!_3519)
    {
        _3555 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3579 = _3555;
    float _3581 = _3579;
    float _3583 = _3579;
    if (!_3519)
    {
        _3557 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3585 = _3557;
    float _3587 = _3585;
    float _3589 = _3585;
    if (!_3519)
    {
        _3559 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3591 = _3559;
    float _3593 = _3543 * _3478;
    float _3595 = _3489 * _3593;
    float _3597 = _3503 * _3593;
    float _3599 = fma(_3499, _3595, _3483);
    float _3601 = fma(_3501, _3595, _3485);
    float _3603 = _3489 * _3547;
    float _3605 = fma(_3489, _3597, _3487);
    out.m_82.x = _3599;
    out.m_82.y = _3601;
    out.m_82.z = _3605;
    out.m_82.w = _3603;
    bool _3607 = !_3519;
    float _3609 = _3591;
    float _3611 = _3591;
    if (!_3607)
    {
        bool _3613 = _3268 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3615 = isnan(_3268);
        bool _3617 = _3613 || _3615;
        bool _3619 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3621 = _3617 || _3619;
        if (!_3621)
        {
            float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3625 = _3268 + _3623;
            float _3627 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3629 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3627;
            float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3633 = _3631 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3635 = 1.0 / _3629;
            float _3637 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3639 = _3637 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3641 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3643 = _3641 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3647 = _3645 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3649 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3651 = _3649 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3653 = _3625 * _3635;
            float _3655 = precise::clamp(_3653, 0.0, 1.0);
            float _3657 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3659 = _3657 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3661 = fma(_3655, _3633, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3663 = fma(_3655, _3659, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3665 = fma(_3655, _3639, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3667 = fma(_3655, _3643, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3669 = fma(_3655, _3647, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3671 = fma(_3655, _3651, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3611 = _3665;
            _3577 = _3669;
            _3589 = _3661;
            _3571 = _3667;
            _3565 = _3663;
            _3583 = _3671;
            _3673 = true;
        }
        else
        {
            bool _3675 = _3268 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3677 = isnan(_3268);
            bool _3679 = _3675 || _3677;
            bool _3681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3683 = _3679 || _3681;
            if (!_3683)
            {
                _3587 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3685 = _3587;
            _3589 = _3685;
            if (!_3683)
            {
                _3609 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3687 = _3609;
            _3611 = _3687;
            if (!_3683)
            {
                _3563 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3689 = _3563;
            _3565 = _3689;
            if (!_3683)
            {
                _3569 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3691 = _3569;
            _3571 = _3691;
            if (!_3683)
            {
                _3575 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3693 = _3575;
            _3577 = _3693;
            if (!_3683)
            {
                _3581 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3695 = _3581;
            bool _3697 = !_3683;
            _3583 = _3695;
            if (!_3697)
            {
                bool _3699 = _3268 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3701 = isnan(_3268);
                bool _3703 = _3699 || _3701;
                bool _3705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3707 = _3703 || _3705;
                if (!_3707)
                {
                    float _3709 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3711 = _3268 + _3709;
                    float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3715 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3713;
                    float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3721 = 1.0 / _3715;
                    float _3723 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3725 = _3723 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3727 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3729 = _3727 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3733 = _3731 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3739 = _3711 * _3721;
                    float _3741 = precise::clamp(_3739, 0.0, 1.0);
                    float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3747 = fma(_3741, _3719, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3749 = fma(_3741, _3745, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3751 = fma(_3741, _3725, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3753 = fma(_3741, _3729, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3755 = fma(_3741, _3733, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3757 = fma(_3741, _3737, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3611 = _3751;
                    _3577 = _3755;
                    _3589 = _3747;
                    _3571 = _3753;
                    _3565 = _3749;
                    _3583 = _3757;
                    _3673 = true;
                }
                else
                {
                    _3611 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3577 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3589 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3571 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3565 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3583 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3673 = false;
    float _3759 = _3611;
    float _3761 = _3577;
    float _3763 = _3589;
    float _3765 = _3571;
    float _3767 = _3565;
    float _3769 = _3583;
    float _3771 = fma(_2828, -0.5, 0.5);
    float _3773 = precise::clamp(_3771, 0.0, 1.0);
    float _3775 = -_3759;
    float _3777 = _3775 + _3761;
    float _3779 = -_3763;
    float _3781 = _3779 + _3765;
    float _3783 = -_3767;
    float _3785 = _3783 + _3769;
    bool _3787 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3789 = fma(_3773, _3777, _3759);
    float _3791 = fma(_3773, _3781, _3763);
    float _3793 = fma(_3773, _3785, _3767);
    float _3795 = _3789 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3797 = fma(_3791, 0.298911988735198974609375, _3795);
    float _3799 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3801 = fma(_3793, 0.114477999508380889892578125, _3797);
    out.m_84.w = _3799;
    float _3803 = -_3801;
    float _3805 = _3791 + _3803;
    float _3807 = -_3801;
    float _3809 = _3789 + _3807;
    float _3811 = -_3801;
    float _3813 = _3793 + _3811;
    out.m_86.x = 0.0;
    float _3815 = fma(_3805, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3801);
    float _3817 = fma(_3809, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3801);
    float _3819 = fma(_3813, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3801);
    out.m_88.x = _3815;
    out.m_88.y = _3817;
    out.m_88.z = _3819;
    if (!_3787)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3821 = -_3162;
    float _3823 = _3821 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3825 = -_3164;
    float _3827 = _3825 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3829 = -_3166;
    float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3833 = _3823 * _3823;
    float _3835 = fma(_3827, _3827, _3833);
    float _3837 = fma(_3831, _3831, _3835);
    float _3839 = sqrt(_3837);
    float _3841 = rsqrt(_3837);
    float _3843 = -_3839;
    float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3847 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3849 = precise::clamp(_3847, 0.0, 1.0);
    float _3851 = _3827 * _3841;
    float _3853 = _3823 * _3841;
    float _3855 = abs(_3849);
    float _3857 = log2(_3855);
    float _3859 = _3831 * _3841;
    float _3861 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3863 = _2828 * _3853;
    float _3865 = -_3853;
    float _3867 = -_3861;
    float _3869 = fma(_3865, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3867);
    float _3871 = fma(_2826, _3851, _3863);
    float _3873 = -_3859;
    float _3875 = fma(_3873, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3869);
    float _3877 = fma(_2830, _3859, _3871);
    float _3879 = precise::clamp(_3877, 0.0, 1.0);
    float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3883 = _3875 + _3881;
    float _3885 = _3857 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3887 = _3883 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3889 = precise::clamp(_3887, 0.0, 1.0);
    float _3891 = exp2(_3885);
    float _3893 = _3891 * _3889;
    float _3895 = _3879 * _3893;
    float _3897 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3899 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3901 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3897;
    out.m_86.y = _3899;
    out.m_86.z = _3901;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3673 = false;
    bool _685 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3958 = as_type<float>(_123);
        out.gl_Position.z = _3958;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _117 = _147;
    }
    float _149 = _117;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4032 = as_type<float>(_163);
        out.gl_Position.z = _4032;
    }
    if (_155)
    {
        return out;
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    float _171 = in.m_57.x;
    float _173 = in.m_57.y;
    float _175 = in.m_57.z;
    float _177 = in.m_59.x;
    float _179 = in.m_59.y;
    float _181 = in.m_59.z;
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_64.w;
    float _187 = in.m_44.x;
    float _189 = in.m_44.y;
    float _191 = in.m_44.z;
    float _193 = _165 * _165;
    float _195 = _167 * _167;
    float _197 = fma(_171, _171, _193);
    float _199 = fma(_173, _173, _195);
    float _201 = fma(_177, _177, _197);
    float _203 = _169 * _169;
    float _205 = fma(_179, _179, _199);
    float _207 = sqrt(_201);
    float _209 = fma(_175, _175, _203);
    float _211 = fma(_181, _181, _209);
    float _213 = sqrt(_205);
    float _215 = sqrt(_211);
    bool _217 = _207 > 0.0;
    bool _219 = _213 > 0.0;
    float _221 = 0.0;
    float _223 = _201;
    float _225 = _205;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _231 = _171;
    if (_217)
    {
        float _233 = rsqrt(_201);
        _221 = _233;
    }
    float _235 = _221;
    float _237 = 0.0;
    if (!_217)
    {
        _237 = 0.0;
    }
    float _239 = _237;
    bool _241 = _215 > 0.0;
    int _243 = as_type<int>(_183) & 1;
    bool _245 = _243 != 0;
    int _247 = as_type<int>(_183) & 2;
    bool _249 = _247 != 0;
    float _251 = 0.0;
    float _253 = _239;
    if (_219)
    {
        float _255 = rsqrt(_205);
        _251 = _255;
    }
    float _257 = _251;
    float _259 = in.m_49.x;
    float _261 = in.m_49.y;
    float _263 = in.m_49.z;
    bool _265 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _269 = _265 || _267;
    bool _271 = isnan(1.0);
    bool _273 = _269 || _271;
    float _275 = 0.0;
    float _277 = 0.0;
    if (!_219)
    {
        _275 = 0.0;
        _277 = 0.0;
    }
    float _279 = _275;
    float _281 = _277;
    float _283 = _281;
    float _285 = _279;
    if (!_217)
    {
        _223 = 0.0;
    }
    float _287 = _223;
    int _289 = int(_245);
    int _291 = _249 ? 2 : 0;
    int _293 = _289 | _291;
    int _295 = _217 ? 4 : 0;
    int _297 = _293 | _295;
    int _299 = _219 ? 8 : 0;
    int _301 = _297 | _299;
    int _303 = _241 ? 16 : 0;
    int _305 = _301 | _303;
    int _307 = _273 ? 32 : 0;
    int _309 = _305 | _307;
    int _311 = false ? 64 : 0;
    int _313 = _309 | _311;
    int _315 = _313 & 32;
    float _317 = 0.0;
    float _319 = as_type<float>(_315);
    float _321 = _287;
    if (_241)
    {
        float _323 = rsqrt(_211);
        _317 = _323;
    }
    float _325 = _317;
    if (!_217)
    {
        _319 = 0.0;
    }
    float _327 = _319;
    float _329 = _327;
    if (_217)
    {
        float _331 = _235 * _171;
        _253 = _331;
    }
    float _333 = _253;
    if (_217)
    {
        float _335 = _235 * _165;
        _321 = _335;
    }
    float _337 = _321;
    if (_217)
    {
        float _339 = _235 * _177;
        _329 = _339;
    }
    float _341 = _329;
    float _343 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _345 = 0.0;
    float _347 = 0.0;
    float _349 = _343;
    if (!_241)
    {
        _345 = 0.0;
        _347 = 0.0;
    }
    float _351 = _345;
    float _353 = _347;
    float _355 = 0.0;
    float _357 = _351;
    float _359 = _353;
    if (!_219)
    {
        _355 = 0.0;
    }
    float _361 = _355;
    float _363 = _361;
    if (_219)
    {
        float _365 = _257 * _173;
        _283 = _365;
    }
    float _367 = _283;
    if (!_273)
    {
        float _369 = _343 * _343;
        float _371 = _369 * 0.5;
        _225 = _371;
    }
    float _373 = _225;
    float _375 = 0.0;
    float _377 = _373;
    if (!_241)
    {
        _375 = 0.0;
    }
    float _379 = _375;
    float _381 = _379;
    if (_219)
    {
        float _383 = _257 * _167;
        _285 = _383;
    }
    float _385 = _285;
    if (_219)
    {
        float _387 = _257 * _179;
        _363 = _387;
    }
    float _389 = _363;
    bool _391 = !_245;
    float _393 = _391 ? (-0.5) : 0.5;
    if (!_273)
    {
        float _395 = _373 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _377 = _395;
    }
    float _397 = _377;
    bool _399 = !_249;
    float _401 = _399 ? (-0.5) : 0.5;
    float _403 = _397;
    if (_241)
    {
        float _405 = _325 * _175;
        _381 = _405;
    }
    float _407 = _381;
    if (_241)
    {
        float _409 = _325 * _169;
        _357 = _409;
    }
    float _411 = _357;
    if (_241)
    {
        float _413 = _325 * _181;
        _359 = _413;
    }
    float _415 = _359;
    bool _417 = !_273;
    float _419 = 0.0;
    if (!_417)
    {
        float _421 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _423 = log2(_421);
        float _425 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _427 = _425 + 1.0;
        float _429 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _431 = _343 * _423;
        float _433 = exp2(_431);
        float _435 = _429 * 0.693147182464599609375;
        float _437 = 1.0 / _435;
        float _439 = 1.0 / _427;
        float _441 = _433 + (-1.0);
        float _443 = -_441;
        float _445 = fma(_443, _437, _343);
        float _447 = _445 * _439;
        float _449 = _447 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _403 = _449;
        _419 = _427;
    }
    float _451 = _403;
    float _453 = _419;
    float _455 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _457 = !_273;
    float _459 = _453;
    float _461 = _451;
    if (!_457)
    {
        float _463 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _465 = log2(_463);
        float _467 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _469 = _467 + 1.0;
        float _471 = 1.0 / _469;
        float _473 = _343 * _465;
        float _475 = exp2(_473);
        float _477 = -_475;
        float _479 = _477 + 1.0;
        float _481 = _479 * _471;
        _459 = _471;
        _349 = _481;
    }
    float _483 = _459;
    float _485 = _349;
    float _487 = _455 * _337;
    float _489 = _455 * _385;
    float _491 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _493 = _455 * _411;
    float _495 = _483;
    if (!_273)
    {
        float _497 = _143 * _143;
        float _499 = _497 * 0.5;
        _495 = _499;
    }
    float _501 = _495;
    float _503 = fma(_491, _333, _487);
    float _505 = fma(_491, _367, _489);
    float _507 = fma(_491, _407, _493);
    float _509 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_273)
    {
        float _511 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _461 = _511;
    }
    float _513 = _461;
    bool _515 = !_273;
    float _517 = _513;
    if (!_515)
    {
        float _519 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _521 = log2(_519);
        float _523 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _525 = _523 + 1.0;
        float _527 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _529 = _143 * _521;
        float _531 = exp2(_529);
        float _533 = _527 * 0.693147182464599609375;
        float _535 = 1.0 / _533;
        float _537 = 1.0 / _525;
        float _539 = _531 + (-1.0);
        float _541 = -_539;
        float _543 = fma(_541, _535, _143);
        float _545 = _543 * _537;
        float _547 = _545 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _517 = _547;
    }
    float _549 = _517;
    float _551 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _553 = fma(_509, _341, _503);
    float _555 = fma(_509, _389, _505);
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _559 = _551 * _337;
    float _561 = _551 * _385;
    float _563 = _551 * _411;
    float _565 = fma(_509, _415, _507);
    float _567 = fma(_557, _333, _559);
    float _569 = fma(_557, _367, _561);
    float _571 = fma(_557, _407, _563);
    float _573 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _575 = fma(_485, _259, _553);
    float _577 = fma(_485, _261, _555);
    float _579 = fma(_485, _263, _565);
    float _581 = fma(_573, _341, _567);
    float _583 = fma(_573, _389, _569);
    float _585 = fma(_573, _415, _571);
    float _587 = _549;
    if (!_273)
    {
        _587 = _143;
    }
    float _589 = _587;
    bool _591 = !_273;
    float _593 = _589;
    if (!_591)
    {
        float _595 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _597 = log2(_595);
        float _599 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _601 = _599 + 1.0;
        float _603 = 1.0 / _601;
        float _605 = _143 * _597;
        float _607 = exp2(_605);
        float _609 = -_607;
        float _611 = _609 + 1.0;
        float _613 = _611 * _603;
        _593 = _613;
    }
    float _615 = _593;
    float _617 = fma(_615, _261, _583);
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _621 = fma(_615, _259, _581);
    float _623 = fma(_577, _185, _189);
    float _625 = -_617;
    float _627 = _577 + _625;
    float _629 = fma(_575, _185, _187);
    float _631 = -_621;
    float _633 = _575 + _631;
    float _635 = fma(_615, _263, _585);
    float _637 = _627 * _173;
    float _639 = _627 * _167;
    float _641 = _627 * _179;
    float _643 = -_635;
    float _645 = _579 + _643;
    float _647 = fma(_633, _171, _637);
    float _649 = fma(_633, _165, _639);
    float _651 = fma(_633, _177, _641);
    float _653 = fma(_579, _185, _191);
    float _655 = fma(_645, _175, _647);
    float _657 = fma(_645, _169, _649);
    float _659 = fma(_645, _181, _651);
    bool _661 = !_619;
    float _663 = _657;
    float _665 = _655;
    float _667 = _659;
    float _683;
    if (!_661)
    {
        float _669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _671 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _675 = _673 * _669;
        float _677 = floor(_675);
        float _679 = -_677;
        float _681 = _675 + _679;
        _683 = _681;
        _685 = true;
    }
    else
    {
        float _687 = float(_107);
        float _689 = 1.0 / _687;
        float _691 = _143 * _689;
        _683 = _691;
    }
    _685 = false;
    float _693 = _683;
    float _695 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _697 = int(_695);
    float _699 = in.m_51.y;
    float _701 = float(_107);
    float _703 = _623 * _167;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _707 = _705 != 0;
    float _709 = _623 * _179;
    float _711 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _713 = int(_711);
    float _715 = fma(_629, _165, _703);
    float _717 = fma(_629, _177, _709);
    float _719 = in.m_59.w;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _723 = 1.0 / _701;
    float _725 = float(_697);
    float _727 = in.m_55.w;
    float _729 = 1.0 / _725;
    float _731 = float(uint(_713));
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _735 = 1.0 + _733;
    int _737 = ~_713;
    int _739 = _737 + 1;
    bool _741 = _713 == 0;
    float _743 = 1.0 / _731;
    float _745 = _143 * _729;
    float _747 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _749 = int(_747);
    int _751 = as_type<int>(_743) + (-2);
    float _753 = trunc(_745);
    int _755 = int(_753);
    float _757 = float(_713);
    float _759 = float(uint(_749));
    float _761 = 1.0 / _735;
    float _763 = _745;
    if (_707)
    {
        _763 = 1.0;
    }
    float _765 = _763;
    float _767 = _765;
    if (!_707)
    {
        _767 = 7.345489978790283203125;
    }
    float _769 = _767;
    int _771 = ~_749;
    int _773 = _771 + 1;
    float _775 = float(uint(_755));
    float _777 = _769 * _129;
    float _779 = 1.0 / _759;
    float _781 = as_type<float>(_751) * _775;
    float _783 = trunc(_781);
    float _785 = precise::max(_783, 0.0);
    uint _788 = uint(_785);
    float _790 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _792 = int(_790);
    int _794 = _739 * int(_788);
    int _796 = _794 + _755;
    float _798 = float(uint(_796));
    float _800 = as_type<float>(_751) * _798;
    float _802 = trunc(_800);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    int _808 = int(_788) + int(_806);
    float _810 = float(_755);
    float _812 = floor(_777);
    int _814 = _739 * _808;
    int _816 = _814 + _755;
    bool _818 = _810 >= _757;
    bool _820 = isnan(_810);
    bool _822 = _818 || _820;
    bool _824 = isnan(_757);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    bool _830 = uint(_816) >= uint(_713);
    float _832 = trunc(_828);
    int _834 = int(_832);
    bool _836 = !_830;
    int _838 = _836 ? 0 : (-1);
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _842 = _840 != 0;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _850 = _848 != 0;
    int _852 = ~_808;
    int _854 = _852 + _838;
    int _856 = _854 + 1;
    float _858 = -_812;
    float _860 = _777 + _858;
    float _862 = float(_792);
    float _864 = _143 * _723;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _868 = _866 != 0;
    int _870 = _713 * _856;
    int _872 = _870 + _755;
    float _874 = 1.0 / _862;
    float _876 = _860 * _757;
    bool _878 = !_842;
    int _880 = _878 ? 0 : 1;
    int _882 = ~_834;
    int _884 = _882 + 1;
    int _886 = _884 + 1;
    bool _888 = !_741;
    int _890 = _888 ? _872 : (-1);
    float _892 = trunc(_876);
    int _894 = int(_892);
    bool _896 = !_868;
    int _898 = _896 ? 0 : 1;
    int _900 = _890 * _886;
    int _902 = _713 + (-1);
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _906 = _904 != 0;
    int _908 = abs(_898);
    int _910 = _834 * _902;
    int _912 = _910 + _900;
    float _914 = _864 * _757;
    bool _916 = !_846;
    int _918 = _916 ? 0 : 1;
    bool _920 = !_850;
    int _922 = _920 ? 0 : 1;
    int _924 = abs(_918);
    float _926 = trunc(_914);
    int _928 = int(_926);
    float _930 = _143 * _874;
    int _932 = abs(_880);
    int _934 = _894 * _908;
    int _936 = _934 + _755;
    bool _938 = !_906;
    int _940 = _938 ? 0 : 1;
    int _942 = _912 * _924;
    int _944 = abs(_922);
    float _946 = trunc(_930);
    int _948 = int(_946);
    int _950 = abs(_940);
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _954 = _952 != 0;
    int _956 = _928 * _932;
    int _958 = _956 + _942;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _962 = _960 != 0;
    int _964 = _936 * _944;
    int _966 = _964 + _958;
    int _968 = as_type<int>(_779) + (-2);
    int _970 = ~_713;
    int _972 = _970 + 1;
    int _974 = _894 * _950;
    int _976 = _974 + _966;
    float _978 = float(uint(_948));
    float _980 = float(uint(_976));
    float _982 = as_type<float>(_968) * _978;
    int _984 = ~_749;
    int _986 = _984 + 1;
    float _988 = trunc(_982);
    float _990 = precise::max(_988, 0.0);
    uint _992 = uint(_990);
    float _994 = as_type<float>(_751) * _980;
    float _996 = trunc(_994);
    float _998 = precise::max(_996, 0.0);
    uint _1000 = uint(_998);
    int _1002 = _986 * int(_992);
    int _1004 = _1002 + _948;
    float _1006 = _994;
    if (_954)
    {
        _1006 = _129;
    }
    float _1008 = _1006;
    float _1010 = _1008;
    if (!_954)
    {
        _1010 = _699;
    }
    float _1012 = _1010;
    float _1014 = float(uint(_1004));
    int _1016 = _972 * int(_1000);
    int _1018 = _1016 + _976;
    float _1020 = as_type<float>(_968) * _1014;
    float _1022 = float(uint(_1018));
    float _1024 = as_type<float>(_1018);
    if (_954)
    {
        _1024 = 1.0;
    }
    float _1026 = _1024;
    float _1028 = trunc(_1020);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    float _1034 = _1026;
    if (!_954)
    {
        _1034 = 1.2345600128173828125;
    }
    float _1036 = _1034;
    float _1038 = as_type<float>(_751) * _1022;
    float _1040 = _1036 * _1012;
    int _1042 = ~_749;
    int _1044 = _1042 + 1;
    float _1046 = trunc(_1038);
    float _1048 = precise::max(_1046, 0.0);
    uint _1050 = uint(_1048);
    int _1052 = int(_992) + int(_1032);
    int _1054 = ~_713;
    int _1056 = _1054 + 1;
    float _1058 = floor(_1040);
    int _1060 = _1044 * _1052;
    int _1062 = _1060 + _948;
    int _1064 = int(_1000) + int(_1050);
    float _1066 = float(_749);
    float _1068 = float(_948);
    int _1070 = _1056 * _1064;
    int _1072 = _1070 + _976;
    bool _1074 = uint(_1062) >= uint(_749);
    bool _1076 = _1068 >= _1066;
    bool _1078 = isnan(_1068);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(_1066);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    bool _1088 = uint(_1072) >= uint(_713);
    float _1090 = trunc(_1086);
    int _1092 = int(_1090);
    bool _1094 = !_1074;
    int _1096 = _1094 ? 0 : (-1);
    float _1098 = -_1058;
    float _1100 = _1040 + _1098;
    bool _1102 = !_962;
    int _1104 = _1102 ? 0 : 1;
    bool _1106 = !_1088;
    int _1108 = _1106 ? 0 : (-1);
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1112 = _1110 != 0;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1116 = _1114 != 0;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1120 = _1118 != 0;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1124 = _1122 != 0;
    int _1126 = ~_1052;
    int _1128 = _1126 + _1096;
    int _1130 = _1128 + 1;
    float _1132 = _1100 * _1066;
    int _1134 = abs(_1104);
    float _1136 = _864 * _1066;
    bool _1138 = !_1116;
    int _1140 = _1138 ? 0 : 1;
    int _1142 = _749 * _1130;
    int _1144 = _1142 + _948;
    bool _1146 = _749 == 0;
    float _1148 = trunc(_1132);
    int _1150 = int(_1148);
    int _1152 = ~_1092;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    bool _1158 = !_1146;
    int _1160 = _1158 ? _1144 : (-1);
    int _1162 = ~_1064;
    int _1164 = _1162 + _1108;
    int _1166 = _1164 + 1;
    int _1168 = abs(_1140);
    int _1170 = _1160 * _1156;
    int _1172 = _749 + (-1);
    int _1174 = _713 * _1166;
    int _1176 = _1174 + _976;
    float _1178 = trunc(_1136);
    int _1180 = int(_1178);
    int _1182 = _1092 * _1172;
    int _1184 = _1182 + _1170;
    bool _1186 = _713 == 0;
    int _1188 = _1184 * _1168;
    bool _1190 = !_1120;
    int _1192 = _1190 ? 0 : 1;
    int _1194 = _1150 * _1134;
    int _1196 = _1194 + _948;
    bool _1198 = !_1112;
    int _1200 = _1198 ? 0 : 1;
    bool _1202 = !_1186;
    int _1204 = _1202 ? _1176 : (-1);
    int _1206 = abs(_1200);
    bool _1208 = !_1124;
    int _1210 = _1208 ? 0 : 1;
    int _1212 = abs(_1192);
    int _1214 = _1204 & 3;
    bool _1216 = _1214 != 0;
    int _1218 = abs(_1210);
    bool _1220 = uint(_1214) > 1u;
    int _1222 = _1180 * _1206;
    int _1224 = _1222 + _1188;
    int _1226 = _1204 & 3;
    bool _1228 = _1226 != 0;
    int _1230 = _1196 * _1212;
    int _1232 = _1230 + _1224;
    int _1234 = _1228 ? 0 : 1;
    float _1236 = _129 * 2.0;
    bool _1238 = _1214 != 3;
    int _1240 = _1150 * _1218;
    int _1242 = _1240 + _1232;
    int _1244 = ~_1234;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    float _1250 = floor(_1236);
    int _1252 = _1248;
    if (!_1220)
    {
        int _1254 = ~_1234;
        int _1256 = _1254 + 1;
        _1252 = _1256;
    }
    int _1258 = _1252;
    float _1260 = in.m_51.z;
    float _1262 = float(uint(_1242));
    bool _1264 = uint(_1214) >= 2u;
    float _1266 = as_type<float>(_968) * _1262;
    int _1268 = _1264 ? 0 : 1;
    float _1270 = _699 * 2.0;
    bool _1272 = _129 > 0.5;
    float _1274 = trunc(_1266);
    float _1276 = precise::max(_1274, 0.0);
    uint _1278 = uint(_1276);
    int _1280 = ~_1268;
    int _1282 = _1280 + 1;
    int _1284 = _1282 + 1;
    int _1286 = _1284;
    if (_1238)
    {
        int _1288 = ~_1268;
        int _1290 = _1288 + 1;
        _1286 = _1290;
    }
    int _1292 = _1286;
    int _1294 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1296 = _1294 != 0;
    float _1298 = -_393;
    int _1300 = _1272 ? as_type<int>(_1298) : as_type<int>(_393);
    float _1302 = floor(_1270);
    bool _1304 = _1250 > 0.0;
    bool _1306 = !_1296;
    float _1308 = _1306 ? _393 : as_type<float>(_1300);
    bool _1310 = _1250 >= 0.0;
    bool _1312 = isnan(_1250);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan(0.0);
    bool _1318 = _1314 || _1316;
    int _1320 = ~_749;
    int _1322 = _1320 + 1;
    float _1324 = _1308 + 0.5;
    int _1326 = _1318 ? 0 : 1;
    bool _1328 = _699 > 0.5;
    int _1330 = _1322 * int(_1278);
    int _1332 = _1330 + _1242;
    int _1334 = ~_1326;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    float _1340 = -_401;
    int _1342 = _1328 ? as_type<int>(_1340) : as_type<int>(_401);
    bool _1344 = _1260 > 0.5;
    int _1346 = _1338;
    if (!_1304)
    {
        int _1348 = ~_1326;
        int _1350 = _1348 + 1;
        _1346 = _1350;
    }
    int _1352 = _1346;
    float _1354 = _1260 * 2.0;
    float _1356 = float(uint(_1332));
    float _1358 = -_393;
    int _1360 = _1344 ? as_type<int>(_1358) : as_type<int>(_393);
    float _1362 = floor(_1354);
    bool _1364 = _1302 >= 0.0;
    bool _1366 = isnan(_1302);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan(0.0);
    bool _1372 = _1368 || _1370;
    float _1374 = as_type<float>(_968) * _1356;
    bool _1376 = _1302 > 0.0;
    int _1378 = _1372 ? 0 : 1;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1382 = _1380 != 0;
    float _1384 = trunc(_1374);
    float _1386 = precise::max(_1384, 0.0);
    uint _1388 = uint(_1386);
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1392 = _1390 != 0;
    int _1394 = as_type<int>(_1302);
    if (_954)
    {
        _1394 = 0;
    }
    int _1396 = _1394;
    int _1398 = _1396;
    if (!_954)
    {
        _1398 = 1;
    }
    int _1400 = _1398;
    bool _1402 = !_1382;
    float _1404 = _1402 ? _393 : as_type<float>(_1360);
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1412 = _1410 != 0;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1416 = _1414 != 0;
    float _1418 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1420 = log2(_1418);
    int _1422 = ~_1378;
    int _1424 = _1422 + 1;
    int _1426 = _1424 + 1;
    int _1428 = _1426;
    if (!_1376)
    {
        int _1430 = ~_1378;
        int _1432 = _1430 + 1;
        _1428 = _1432;
    }
    int _1434 = _1428;
    bool _1436 = _1362 >= 0.0;
    bool _1438 = isnan(_1362);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan(0.0);
    bool _1444 = _1440 || _1442;
    float _1446 = in.m_51.w;
    bool _1448 = !_1392;
    float _1450 = _1448 ? _401 : as_type<float>(_1342);
    int _1452 = _1444 ? 0 : 1;
    bool _1454 = _1400 != 1;
    int _1456 = ~_749;
    int _1458 = _1456 + 1;
    int _1460 = int(_1278) + int(_1388);
    float _1462 = _143 * _1420;
    bool _1464 = _1362 > 0.0;
    float _1466 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1468 = !_1408;
    int _1470 = _1468 ? 0 : 1;
    int _1472 = _1458 * _1460;
    int _1474 = _1472 + _1242;
    int _1476 = ~_1452;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    float _1482 = exp2(_1462);
    bool _1484 = !_1216;
    int _1486 = _1484 ? 0 : 1;
    float _1488 = -_721;
    float _1490 = fma(_1466, 2.0, _1488);
    bool _1492 = uint(_1474) >= uint(_749);
    float _1494 = in.m_57.w;
    float _1496 = -_143;
    float _1498 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1490);
    float _1500 = 0.0;
    int _1502 = _1480;
    if (!_1454)
    {
        _1500 = _699;
    }
    float _1504 = _1500;
    float _1506 = _1504;
    if (!_1464)
    {
        int _1508 = ~_1452;
        int _1510 = _1508 + 1;
        _1502 = _1510;
    }
    int _1512 = _1502;
    float _1514 = _623 * _173;
    float _1516 = 0.0;
    if (!_1454)
    {
        _1516 = _699;
    }
    float _1518 = _1516;
    float _1520 = 0.0;
    float _1522 = _1518;
    if (!_1454)
    {
        _1520 = _1260;
    }
    float _1524 = _1520;
    float _1526 = fma(_629, _171, _1514);
    float _1528 = 0.0;
    float _1530 = _1524;
    if (!_1454)
    {
        _1528 = _1260;
    }
    float _1532 = _1528;
    float _1534 = -_1482;
    float _1536 = _1534 + 1.0;
    float _1538 = _1532;
    if (_1454)
    {
        _1506 = _129;
    }
    float _1540 = _1506;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1544 = _693 + _1542;
    if (_1454)
    {
        _1522 = _129;
    }
    float _1546 = _1522;
    float _1548 = fma(_653, _175, _1526);
    if (_1454)
    {
        _1530 = _699;
    }
    float _1550 = _1530;
    if (_1454)
    {
        _1538 = _699;
    }
    float _1552 = _1538;
    bool _1554 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1556 = isnan(0.0);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1562 = _1558 || _1560;
    bool _1564 = !_1492;
    int _1566 = _1564 ? 0 : (-1);
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1570 = _1568 != 0;
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1574 = _1572 != 0;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1578 = _1576 != 0;
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1580;
    float _1584 = _1562 ? _1536 : 0.0;
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1588 = _1586 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1590 = _1446 > 0.5;
    float _1592 = 1.0 / _1582;
    float _1594 = _1584 * _761;
    bool _1596 = !_1416;
    int _1598 = _1596 ? 0 : 1;
    int _1600 = ~_1460;
    int _1602 = _1600 + _1566;
    int _1604 = _1602 + 1;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1606;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1612 = 1.0 / _1588;
    float _1614 = _699 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1616 = _749 * _1604;
    int _1618 = _1616 + _1242;
    int _1620 = abs(_1598);
    float _1622 = fma(_1614, -2.0, _1610);
    float _1624 = fma(_653, _181, _717);
    float _1626 = _1544 * _1592;
    float _1628 = fma(_653, _169, _715);
    float _1630 = _129 + _699;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1634 = _693 + _1632;
    float _1636 = 1.0 / _1608;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1640 = _693 + _1638;
    float _1642 = _1630 + (-1.0);
    float _1644 = _129 + _1260;
    float _1646 = _1634 * _1612;
    float _1648 = _1260 + _699;
    float _1650 = float(uint(_936));
    float _1652 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1654 = _1644 + (-1.0);
    float _1656 = _1648 + (-1.0);
    float _1658 = as_type<float>(_751) * _1650;
    float _1660 = _1624 + _719;
    float _1662 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1664 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1666;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1670;
    float _1674 = trunc(_1658);
    float _1676 = precise::max(_1674, 0.0);
    uint _1678 = uint(_1676);
    float _1680 = _1640 * _1636;
    float _1682 = _1548 + _1494;
    float _1684 = fma(_1668, _1626, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1686 = fma(_1672, _1626, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1688 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1690 = isnan(_693);
    bool _1692 = _1688 || _1690;
    bool _1694 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1696 = _1692 || _1694;
    float _1698 = float(_1696);
    float _1700 = _1628 + _727;
    bool _1702 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1704 = isnan(_693);
    bool _1706 = _1702 || _1704;
    bool _1708 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1710 = _1706 || _1708;
    float _1712 = float(_1710);
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1718 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1720 = isnan(_693);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1726 = _1722 || _1724;
    float _1728 = float(_1726);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1732 = _1730 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1734 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1736 = isnan(_693);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1742 = _1738 || _1740;
    float _1744 = float(_1742);
    float _1746 = -_1698;
    float _1748 = _1746 + 1.0;
    int _1750 = ~_713;
    int _1752 = _1750 + 1;
    float _1754 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1622);
    float _1756 = fma(_1716, _1646, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1758 = -_1744;
    float _1760 = _1758 + 1.0;
    float _1762 = _1744 * _1748;
    float _1764 = fma(_1732, _1646, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1766 = float(_1620);
    float _1768 = _1728 * _1760;
    float _1770 = -_1728;
    float _1772 = _1770 + 1.0;
    float _1774 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1498);
    int _1776 = _1752 * int(_1678);
    int _1778 = _1776 + _936;
    float _1780 = _1712 * _1772;
    float _1782 = -_1712;
    float _1784 = _1782 + 1.0;
    float _1786 = _1450 + (-0.5);
    float _1788 = float(uint(_1778));
    float _1790 = _1684 * _1780;
    float _1792 = _1686 * _1780;
    float _1794 = -_1786;
    float _1796 = -_1754;
    float _1798 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1796);
    float _1800 = as_type<float>(_751) * _1788;
    float _1802 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1790);
    float _1804 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1792);
    float _1806 = float(uint(_1196));
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1810 = trunc(_1800);
    float _1812 = precise::max(_1810, 0.0);
    uint _1814 = uint(_1812);
    float _1816 = as_type<float>(_968) * _1806;
    float _1818 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1808);
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1822 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1828 = trunc(_1816);
    float _1830 = precise::max(_1828, 0.0);
    uint _1832 = uint(_1830);
    float _1834 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1820);
    float _1836 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1838 = -_1824;
    float _1840 = fma(_1822, 2.0, _1838);
    int _1842 = ~_749;
    int _1844 = _1842 + 1;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1848 = _1682 + _1846;
    float _1850 = fma(_1836, -2.0, _1826);
    float _1852 = float(_1434);
    float _1854 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1818);
    float _1856 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1850);
    int _1858 = abs(_1470);
    float _1860 = _1766 * _1852;
    float _1862 = float(_1512);
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1866 = _1700 + _1864;
    float _1868 = float(_1858);
    int _1870 = _1844 * int(_1832);
    int _1872 = _1870 + _1196;
    int _1874 = int(_1678) + int(_1814);
    float _1876 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1878 = _1660 + _1876;
    int _1880 = ~_713;
    int _1882 = _1880 + 1;
    float _1884 = _1868 * _1862;
    float _1886 = float(uint(_1872));
    float _1888 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1834);
    bool _1890 = !_1146;
    int _1892 = _1890 ? _1618 : (-1);
    int _1894 = _1882 * _1874;
    int _1896 = _1894 + _936;
    float _1898 = -_401;
    int _1900 = _1590 ? as_type<int>(_1898) : as_type<int>(_401);
    float _1902 = as_type<float>(_968) * _1886;
    int _1904 = _1204 >> 31;
    float _1906 = _1404 + 0.5;
    bool _1908 = uint(_1896) >= uint(_713);
    float _1910 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1912 = _1892 >> 31;
    float _1914 = trunc(_1902);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    int _1920 = _1904 & 3;
    float _1922 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1910);
    bool _1924 = !_1412;
    int _1926 = _1924 ? 0 : 1;
    float _1928 = _1884 * (-2.0);
    int _1930 = _1912 & 3;
    float _1932 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1922);
    int _1934 = _1204 + _1920;
    float _1936 = -_1888;
    float _1938 = _1936 + 1.0;
    int _1940 = abs(_1926);
    float _1942 = fma(_1652, _1928, _1652);
    int _1944 = _1892 + _1930;
    bool _1946 = !_1578;
    float _1948 = _1946 ? _401 : as_type<float>(_1900);
    int _1950 = _1934 >> 2;
    float _1952 = float(_1352);
    float _1954 = _1948 + (-0.5);
    float _1956 = float(_1940);
    bool _1958 = _1214 != 3;
    float _1960 = -_1954;
    float _1962 = -_1856;
    float _1964 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1962);
    int _1966 = _1944 >> 2;
    float _1968 = _1956 * _1952;
    int _1970 = _1950 << 4;
    int _1972 = _1970 + 368;
    float _1974 = -_143;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1840);
    bool _1978 = !_1958;
    int _1980 = _1978 ? 0 : (-1);
    float _1982 = in.m_66.x;
    float _1984 = in.m_66.y;
    float _1986 = in.m_66.z;
    bool _1988 = !_1908;
    int _1990 = _1988 ? 0 : (-1);
    uint _1992 = uint(int(uint(_1972) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    int _2008 = _1892 & 3;
    bool _2010 = _2008 != 0;
    float _2012 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1976);
    int _2014 = _1966 << 4;
    int _2016 = _2014 + 512;
    int _2018 = _1892 & 3;
    bool _2020 = _2018 != 0;
    int _2022 = _2010 ? 0 : 1;
    uint _2024 = uint(int(uint(_2016) >> uint(2)));
    uint _2026 = uint(int(uint(int(_2024)) >> uint(2)));
    int _2028 = int(_2024) & 3;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[int(_2026)][_2028];
    int _2032 = int(_2024) + 1;
    uint _2034 = uint(int(uint(_2032) >> uint(2)));
    int _2036 = _2032 & 3;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[int(_2034)][_2036];
    bool _2040 = !_2020;
    int _2042 = _2040 ? 0 : 1;
    bool _2044 = uint(_2018) > 1u;
    bool _2046 = _1932 >= 0.0;
    int _2048 = ~_2022;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    int _2054 = _1972 + 8;
    uint _2056 = uint(int(uint(_2054) >> uint(2)));
    uint _2058 = uint(int(uint(int(_2056)) >> uint(2)));
    int _2060 = int(_2056) & 3;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[int(_2058)][_2060];
    int _2064 = int(_2056) + 1;
    uint _2066 = uint(int(uint(_2064) >> uint(2)));
    int _2068 = _2064 & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = int(_1832) + int(_1918);
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2076 = ~_1874;
    int _2078 = _2076 + _1990;
    int _2080 = _2078 + 1;
    int _2082 = abs(_1292);
    int _2084 = _773 * _2072;
    int _2086 = _2084 + _1196;
    float _2088 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2074);
    int _2090 = _2052;
    float _2092 = as_type<float>(_1832);
    if (!_2044)
    {
        int _2094 = ~_2022;
        int _2096 = _2094 + 1;
        _2090 = _2096;
    }
    int _2098 = _2090;
    float _2100 = _129 + (-0.5);
    int _2102 = _2016 + 8;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    uint _2106 = uint(int(uint(int(_2104)) >> uint(2)));
    int _2108 = int(_2104) & 3;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[int(_2106)][_2108];
    int _2112 = int(_2104) + 1;
    uint _2114 = uint(int(uint(_2112) >> uint(2)));
    int _2116 = _2112 & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    bool _2120 = uint(_2018) >= 2u;
    float _2122 = fma(_1928, _1982, _1982);
    float _2124 = _1986;
    if (_2046)
    {
        _2092 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2126 = _2092;
    int _2128 = _2120 ? 0 : 1;
    float _2130 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2122);
    bool _2132 = uint(_2086) >= uint(_749);
    int _2134 = as_type<int>(_2126);
    if (_2046)
    {
        float _2136 = _2126 * 5.0;
        _2134 = as_type<int>(_2136);
    }
    int _2138 = _2134;
    int _2140 = abs(_2098);
    int _2142 = _713 * _2080;
    int _2144 = _2142 + _936;
    bool _2146 = !_2132;
    int _2148 = _2146 ? 0 : (-1);
    float _2150 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2088);
    bool _2152 = _2018 != 3;
    if (_2046)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6854 = as_type<float>(_2138);
        out.gl_Position.z = _6854;
    }
    int _2154 = abs(_1258);
    bool _2156 = !_2152;
    int _2158 = _2156 ? 0 : (-1);
    if (_2046)
    {
        out.m_47.x = 0.0;
    }
    bool _2160 = _2018 != 3;
    int _2162 = ~_2072;
    int _2164 = _2162 + _2148;
    int _2166 = _2164 + 1;
    bool _2168 = _713 == 0;
    int _2170 = _749 * _2166;
    int _2172 = _2170 + _1196;
    int _2174 = ~_2154;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    int _2180 = abs(_1486);
    int _2182 = ~_2140;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    int _2188 = _2178 * as_type<int>(_2006);
    int _2190 = abs(_2042);
    int _2192 = ~_2180;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    int _2198 = _2186 * as_type<int>(_2038);
    int _2200 = ~_2190;
    int _2202 = _2200 + 1;
    int _2204 = _2202 + 1;
    int _2206 = _2196 * as_type<int>(_1998);
    int _2208 = _2206 + _2188;
    int _2210 = ~_2128;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    int _2216 = ~_2082;
    int _2218 = _2216 + 1;
    int _2220 = _2218 + 1;
    int _2222 = _2204 * as_type<int>(_2030);
    int _2224 = _2222 + _2198;
    int _2226 = _2214;
    if (_2160)
    {
        int _2228 = ~_2128;
        int _2230 = _2228 + 1;
        _2226 = _2230;
    }
    int _2232 = _2226;
    int _2234 = abs(_2158);
    int _2236 = _2220 * as_type<int>(_2062);
    int _2238 = _2236 + _2208;
    int _2240 = abs(_2232);
    bool _2242 = !_1570;
    int _2244 = _2242 ? 0 : 1;
    int _2246 = abs(_1980);
    int _2248 = ~_2240;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = abs(_2244);
    int _2256 = ~_2246;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    int _2262 = _2252 * as_type<int>(_2110);
    int _2264 = _2262 + _2224;
    int _2266 = ~_2234;
    int _2268 = _2266 + 1;
    int _2270 = _2268 + 1;
    float _2272 = _1866 * _1866;
    bool _2274 = !_1574;
    int _2276 = _2274 ? 0 : 1;
    int _2278 = _2260 * as_type<int>(_2070);
    int _2280 = _2278 + _2238;
    int _2282 = _2270 * as_type<int>(_2118);
    int _2284 = _2282 + _2264;
    int _2286 = abs(_2276);
    float _2288 = fma(_1848, _1848, _2272);
    bool _2290 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2292 = isnan(1.0);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2298 = _2294 || _2296;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2302 = fma(_1878, _1878, _2288);
    int _2304 = ~_2254;
    int _2306 = _2304 + 1;
    int _2308 = _2306 + 1;
    float _2310 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2300);
    int _2312 = ~_2286;
    int _2314 = _2312 + 1;
    int _2316 = _2314 + 1;
    float _2318 = rsqrt(_2302);
    int _2320 = _2280 * _2308;
    bool _2322 = !_2168;
    int _2324 = _2322 ? _2144 : (-1);
    int _2326 = _2284 * _2316;
    bool _2328 = !_1146;
    int _2330 = _2328 ? _2172 : (-1);
    float _2332 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2310);
    int _2334 = _2324 * _2254;
    int _2336 = _2334 + _2320;
    float _2338 = -_2150;
    float _2340 = _2338 + 1.0;
    int _2342 = _2330 * _2286;
    int _2344 = _2342 + _2326;
    float _2346 = -_1854;
    float _2348 = _2346 + 1.0;
    float _2350 = -_2332;
    float _2352 = _2350 + 1.0;
    float _2354 = -_2340;
    float _2356 = fma(_1308, _2354, _1774);
    float _2358 = float(_2336);
    float _2360 = -_2348;
    float _2362 = fma(_1404, _2360, _2012);
    float _2364 = fma(_1450, _2352, _1798);
    float _2366 = fma(_1948, _1938, _1964);
    float _2368 = _1866 * _2318;
    float _2370 = float(_2344);
    float _2372 = _1848 * _2318;
    bool _2374 = !_2298;
    float _2376 = _2374 ? _143 : _1594;
    float _2378 = -_2368;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1866);
    out.m_68.x = _2356;
    out.m_68.y = _2364;
    out.m_68.z = _2362;
    out.m_68.w = _2366;
    float _2382 = -_2372;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1848);
    float _2386 = fma(_2376, _1942, _2130);
    out.m_70.x = _2358;
    out.m_70.y = _2370;
    float _2388 = _2380 * _2380;
    if (_2046)
    {
        return out;
    }
    float _2390 = -_2368;
    float _2392 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1700);
    float _2394 = _1878 * _2318;
    float _2396 = fma(_2384, _2384, _2388);
    float _2398 = -_2372;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1682);
    float _2402 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2404 = _2392 + _2402;
    float _2406 = -_2394;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1878);
    float _2410 = -_2394;
    float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1660);
    float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2416 = _2400 + _2414;
    float _2418 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2420 = fma(_2408, _2408, _2396);
    float _2422 = _1968 * (-2.0);
    float _2424 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2426 = _2412 + _2424;
    float _2428 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2418);
    float _2430 = _699 + (-0.5);
    float _2432 = fma(_2422, _1984, _1984);
    float _2434 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2428);
    float _2436 = fma(_1664, _2422, _1664);
    float _2438 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2432);
    float _2440 = fma(_1764, _1768, _1804);
    float _2442 = in.m_64.x;
    float _2444 = in.m_64.y;
    bool _2446 = _2434 >= 0.0;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2448;
    float _2452 = fma(_2376, _2436, _2438);
    float _2454 = _1860 * (-2.0);
    float _2456 = _2386 * 0.15915493667125701904296875;
    float _2458 = fma(_2450, _1680, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2460 = _2452 * 0.15915493667125701904296875;
    float _2462 = fma(_2454, _1986, _1986);
    float _2464 = fma(_2458, _1762, _2440);
    float _2466 = _1260 + (-0.5);
    float _2468 = sqrt(_2420);
    float _2470 = fma(_1662, _2454, _1662);
    float _2472 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2464);
    if (_2446)
    {
        _2124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2474 = _2124;
    float _2476 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2462);
    float _2478 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2480 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2478;
    int _2482 = as_type<int>(_2474);
    if (_2446)
    {
        out.m_47.x = 0.0;
    }
    float _2484 = _2456 * 6.283185482025146484375;
    float _2486 = sin(_2484);
    if (_2446)
    {
        float _2488 = _2474 * 5.0;
        _2482 = as_type<int>(_2488);
    }
    int _2490 = _2482;
    float _2492 = fma(_2376, _2470, _2476);
    float _2494 = fma(_1756, _1768, _1802);
    float _2496 = _2472 * _2444;
    float _2498 = fma(_2480, _1680, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    if (_2446)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7386 = as_type<float>(_2490);
        out.gl_Position.z = _7386;
    }
    float _2500 = _2492 * 0.15915493667125701904296875;
    float _2502 = _2456 * 6.283185482025146484375;
    float _2504 = cos(_2502);
    float _2506 = _2460 * 6.283185482025146484375;
    float _2508 = sin(_2506);
    float _2510 = _2460 * 6.283185482025146484375;
    float _2512 = cos(_2510);
    if (_2446)
    {
        return out;
    }
    float _2514 = _2500 * 6.283185482025146484375;
    float _2516 = cos(_2514);
    float _2518 = fma(_2498, _1762, _2494);
    float _2520 = _2318 * _2468;
    float _2522 = _2496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2524 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _401);
    float _2526 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2518);
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _393);
    float _2530 = _2520 * _2522;
    float _2532 = _2500 * 6.283185482025146484375;
    float _2534 = sin(_2532);
    float _2536 = _2526 * _2442;
    float _2538 = _2486 * _2512;
    float _2540 = _2524 * _2530;
    float _2542 = _2486 * _2508;
    float _2544 = _2536 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2546 = _2504 * _2512;
    float _2548 = _2504 * _2508;
    float _2550 = _2504 * _2516;
    float _2552 = _2520 * _2544;
    float _2554 = _2512 * _2516;
    float _2556 = _2486 * _2516;
    float _2558 = _2508 * _2516;
    float _2560 = _2528 * _2552;
    float _2562 = _2550 * _2540;
    float _2564 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2566 = _2564 * 0.5;
    float _2568 = fma(_2534, _2546, _2542);
    float _2570 = -_2538;
    float _2572 = fma(_2534, _2548, _2570);
    float _2574 = -_2540;
    float _2576 = _2534 * _2574;
    float _2578 = fma(_2534, _2542, _2546);
    float _2580 = fma(_2568, _2560, _2562);
    float _2582 = -_2548;
    float _2584 = fma(_2534, _2538, _2582);
    float _2586 = _2556 * _2540;
    float _2588 = fma(_2554, _2560, _2576);
    float _2590 = fma(_2572, _2566, _2580);
    float _2592 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2594 = fma(_2584, _2560, _2586);
    float _2596 = fma(_2558, _2566, _2588);
    float _2598 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2600 = _2568 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2602 = fma(_2578, _2566, _2594);
    float _2604 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2606 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2598);
    float _2608 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2600);
    float _2610 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2612 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2604);
    float _2614 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2606);
    float _2616 = -_2534;
    float _2618 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2592);
    float _2620 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2610);
    float _2622 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2612);
    float _2624 = _2614 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2626 = _2568 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2628 = _2622 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2630 = _1660 + _2624;
    float _2632 = _2568 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2634 = _401 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2636 = _1682 + _2628;
    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2640 = _2630 + _2638;
    float _2642 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2632);
    float _2644 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2626);
    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2648 = _2636 + _2646;
    float _2650 = _2640 * _2640;
    float _2652 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2654 = fma(_2648, _2648, _2650);
    float _2656 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2658 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2652);
    float _2660 = sqrt(_2654);
    float _2662 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2656);
    float _2664 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2666 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2668 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2658);
    float _2670 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2662);
    float _2672 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2674 = -_2534;
    float _2676 = fma(_2674, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2664);
    float _2678 = fma(_2634, _2634, 1.0);
    float _2680 = -_2534;
    float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2666);
    float _2684 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2672);
    float _2686 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2688 = rsqrt(_2678);
    float _2690 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2618);
    float _2692 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2684);
    float _2694 = _1700 + _2686;
    bool _2696 = _2660 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2698 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2676);
    float _2700 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2682);
    float _2702 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2620);
    float _2704 = _2684;
    float _2706 = _2618;
    float _2708 = _2658;
    if (!_2696)
    {
        _2704 = _2636;
    }
    float _2710 = _2704;
    float _2712 = _2710;
    if (!_2696)
    {
        _2706 = _2630;
    }
    float _2714 = _2706;
    float _2716 = _2714;
    if (!_2696)
    {
        _2708 = _2694;
    }
    float _2718 = _2708;
    bool _2720 = !_2696;
    float _2722 = _2718;
    if (!_2720)
    {
        float _2724 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2728 = _2660 + _2726;
        float _2730 = rsqrt(_2654);
        float _2732 = _2728 * _2724;
        float _2734 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2736 = _2732 * 0.15915493667125701904296875;
        float _2738 = _2736 * 6.283185482025146484375;
        float _2740 = cos(_2738);
        float _2742 = _2736 * 6.283185482025146484375;
        float _2744 = sin(_2742);
        float _2746 = _2740 + (-1.0);
        float _2748 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2750 = fma(_2744, _2734, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2752 = fma(_2694, _2740, _2748);
        float _2754 = _2730 * _2750;
        float _2756 = fma(_2648, _2754, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2758 = fma(_2640, _2754, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2722 = _2752;
        _2712 = _2756;
        _2716 = _2758;
    }
    float _2760 = _2722;
    float _2762 = _2712;
    float _2764 = _2716;
    float _2766 = -_1700;
    float _2768 = _2766 + _2760;
    float _2770 = -_1682;
    float _2772 = _2770 + _2762;
    float _2774 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2642);
    float _2776 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2644);
    float _2778 = _2768 * _2768;
    float _2780 = _393 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2782 = -_1660;
    float _2784 = _2782 + _2764;
    float _2786 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2608);
    float _2788 = fma(_2772, _2772, _2778);
    float _2790 = _2634 * _2688;
    float _2792 = _2634 * _2698;
    float _2794 = _2634 * _2690;
    float _2796 = fma(_2784, _2784, _2788);
    float _2798 = _2634 * _2700;
    float _2800 = -_2668;
    float _2802 = _2790 * _2800;
    float _2804 = -_2702;
    float _2806 = _2790 * _2804;
    float _2808 = sqrt(_2796);
    float _2810 = -_2692;
    float _2812 = _2790 * _2810;
    float _2814 = fma(_2780, _2774, _2792);
    float _2816 = fma(_2780, _2776, _2794);
    float _2818 = fma(_2780, _2786, _2798);
    float _2820 = fma(_2688, _2690, _2806);
    float _2822 = fma(_2688, _2698, _2802);
    float _2824 = fma(_2688, _2700, _2812);
    float _2826 = _2668 + _2814;
    float _2828 = _2702 + _2816;
    float _2830 = _2692 + _2818;
    out.m_72.x = _2774;
    out.m_72.y = _2776;
    out.m_72.z = _2786;
    out.m_74.x = _2822;
    out.m_74.y = _2820;
    out.m_74.z = _2824;
    bool _2832 = _2808 > 0.0;
    out.m_76.x = _2826;
    out.m_76.y = _2828;
    out.m_76.z = _2830;
    bool _2834 = !_2832;
    float _2836 = _2820;
    float _2838 = _2774;
    float _2840 = _2762;
    float _2842 = _2760;
    float _2844 = _2764;
    float _2846 = _2776;
    if (!_2834)
    {
        bool _2848 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2850 = _2776;
        if (_2848)
        {
            float _2852 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2850 = _2852;
        }
        float _2854 = _2850;
        float _2856 = _2854;
        if (_2848)
        {
            float _2858 = _655 * _2854;
            _2836 = _2858;
        }
        float _2860 = _2836;
        float _2862 = _2860;
        if (_2848)
        {
            float _2864 = _657 * _2854;
            _2838 = _2864;
        }
        float _2866 = _2838;
        float _2868 = _2866;
        if (_2848)
        {
            float _2870 = _659 * _2854;
            _2856 = _2870;
        }
        float _2872 = _2856;
        float _2874 = _2872;
        if (!_2848)
        {
            bool _2876 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2878 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2880 = _2876 || _2878;
            bool _2882 = isnan(1.0);
            bool _2884 = _2880 || _2882;
            float _2886 = _143 + 1.0;
            float _2888 = _2886;
            if (!_2884)
            {
                float _2890 = _2886 * _2886;
                float _2892 = _2890 * 0.5;
                _145 = _2892;
            }
            float _2894 = _145;
            float _2896 = _2894;
            if (!_2884)
            {
                float _2898 = _2894 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2896 = _2898;
            }
            float _2900 = _2896;
            bool _2902 = !_2884;
            float _2904 = _2900;
            if (!_2902)
            {
                float _2906 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2908 = log2(_2906);
                float _2910 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2912 = 1.0 + _2910;
                float _2914 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2916 = _2908 * _2886;
                float _2918 = 1.0 / _2912;
                float _2920 = _2914 * 0.693147182464599609375;
                float _2922 = exp2(_2916);
                float _2924 = 1.0 / _2920;
                float _2926 = _2922 + (-1.0);
                float _2928 = -_2926;
                float _2930 = fma(_2928, _2924, _2886);
                float _2932 = _2930 * _2918;
                float _2934 = _2932 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2904 = _2934;
            }
            float _2936 = _2904;
            float _2938 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2940 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2942 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2944 = _2936;
            if (!_2884)
            {
                _2944 = _2886;
            }
            float _2946 = _2944;
            float _2948 = _2938 * _385;
            float _2950 = _2938 * _337;
            float _2952 = _2938 * _411;
            float _2954 = fma(_2940, _367, _2948);
            float _2956 = fma(_2940, _333, _2950);
            float _2958 = fma(_2942, _389, _2954);
            bool _2960 = !_2884;
            float _2962 = _2946;
            if (!_2960)
            {
                float _2964 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2966 = log2(_2964);
                float _2968 = _2966 * _2886;
                float _2970 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2972 = 1.0 + _2970;
                float _2974 = exp2(_2968);
                float _2976 = 1.0 / _2972;
                float _2978 = -_2974;
                float _2980 = _2978 + 1.0;
                float _2982 = _2980 * _2976;
                _2962 = _2982;
                _2888 = _2972;
            }
            float _2984 = _2962;
            float _2986 = _2888;
            float _2988 = fma(_2940, _407, _2952);
            float _2990 = fma(_2942, _341, _2956);
            float _2992 = fma(_2984, _261, _2958);
            float _2994 = fma(_2942, _415, _2988);
            float _2996 = fma(_2984, _259, _2990);
            float _2998 = -_617;
            float _3000 = _2998 + _2992;
            float _3002 = fma(_2984, _263, _2994);
            float _3004 = -_621;
            float _3006 = _3004 + _2996;
            float _3008 = _3000 * _173;
            float _3010 = _3000 * _167;
            float _3012 = _3000 * _179;
            float _3014 = -_635;
            float _3016 = _3014 + _3002;
            float _3018 = fma(_3006, _171, _3008);
            float _3020 = fma(_3006, _165, _3010);
            float _3022 = fma(_3006, _177, _3012);
            float _3024 = fma(_3016, _175, _3018);
            float _3026 = fma(_3016, _169, _3020);
            float _3028 = fma(_3016, _181, _3022);
            _663 = _3026;
            _665 = _3024;
            _667 = _3028;
            _2862 = _3024;
            _2868 = _3026;
            _2874 = _3028;
            _227 = _2986;
        }
        float _3030 = _663;
        float _3032 = _665;
        float _3034 = _667;
        float _3036 = _2862;
        float _3038 = _2868;
        float _3040 = _2874;
        float _3042 = _227;
        float _3044 = _3030 * _3030;
        float _3046 = rsqrt(_2796);
        float _3048 = fma(_3032, _3032, _3044);
        float _3050 = fma(_3034, _3034, _3048);
        float _3052 = sqrt(_3050);
        float _3054 = _2772 * _3046;
        float _3056 = _2768 * _3046;
        float _3058 = _2784 * _3046;
        bool _3060 = _3052 > 0.0;
        bool _3062 = !_3060;
        _229 = _3042;
        _2846 = _3040;
        if (!_3062)
        {
            float _3064 = rsqrt(_3050);
            float _3066 = _3064 * _3030;
            float _3068 = _3064 * _3032;
            float _3070 = _3064 * _3034;
            float _3072 = _3056 * _3066;
            float _3074 = fma(_3054, _3068, _3072);
            float _3076 = fma(_3058, _3070, _3074);
            float _3078 = _3076 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3080 = fma(_3036, _3078, _2762);
            float _3082 = fma(_3038, _3078, _2760);
            float _3084 = fma(_3040, _3078, _2764);
            _2840 = _3080;
            _2842 = _3082;
            _2844 = _3084;
        }
    }
    float _3086 = _2840;
    float _3088 = _2842;
    float _3090 = _2844;
    float _3092 = _229;
    float _3094 = _2846;
    bool _3096 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3098 = isnan(0.5);
    bool _3100 = _3096 || _3098;
    bool _3102 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3104 = _3100 || _3102;
    float _3106 = -_2372;
    float _3108 = fma(_3106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3086);
    float _3110 = -_2368;
    float _3112 = fma(_3110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3088);
    float _3114 = -_2394;
    float _3116 = fma(_3114, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3090);
    float _3118 = _3112;
    float _3120 = _3108;
    float _3122 = _3116;
    float _3124 = _3094;
    if (!_3104)
    {
        float _3126 = _2404 * _2404;
        float _3128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3130 = -_1682;
        float _3132 = _3130 + _3086;
        float _3134 = -_1700;
        float _3136 = _3134 + _3088;
        float _3138 = fma(_2416, _2416, _3126);
        float _3140 = -_1660;
        float _3142 = _3140 + _3090;
        float _3144 = fma(_2426, _2426, _3138);
        float _3146 = 1.0 / _2520;
        float _3148 = sqrt(_3144);
        float _3150 = precise::min(_3148, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3152 = _3150 * _3128;
        float _3154 = _3152 * _3146;
        float _3156 = fma(_3132, _3154, _2400);
        float _3158 = fma(_3136, _3154, _2392);
        float _3160 = fma(_3142, _3154, _2412);
        _3118 = _3158;
        _3120 = _3156;
        _3122 = _3160;
    }
    float _3162 = _3118;
    float _3164 = _3120;
    float _3166 = _3122;
    float _3168 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3170 = _3162 + _3168;
    float _3172 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3174 = _3164 + _3172;
    float _3176 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3178 = _3166 + _3176;
    float _3180 = _3170 * _3170;
    float _3182 = fma(_3174, _3174, _3180);
    float _3184 = fma(_3178, _3178, _3182);
    float _3186 = rsqrt(_3184);
    float _3188 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3190 = _3174 * _3188;
    float _3192 = _3178 * _3188;
    float _3194 = _3190 * _3190;
    float _3196 = _3192 * _3192;
    float _3198 = _3194 + _3196;
    float _3200 = sqrt(_3198);
    bool _3202 = _3200 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3204 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3206 = _3200 + _3204;
    float _3208 = _3186;
    float _3210 = _3206;
    float _3212 = _3170;
    float _3214 = _3188;
    if (_3202)
    {
        float _3216 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3208 = _3216;
    }
    float _3218 = _3208;
    float _3220 = _3218;
    if (_3202)
    {
        float _3222 = _3206 * _3218;
        _3210 = _3222;
    }
    float _3224 = _3210;
    if (_3202)
    {
        float _3226 = rsqrt(_3198);
        _3220 = _3226;
    }
    float _3228 = _3220;
    float _3230 = _3228;
    if (_3202)
    {
        float _3232 = _3224 * 0.15915493667125701904296875;
        _231 = _3232;
    }
    float _3234 = _231;
    float _3236 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3238 = _3178;
    float _3240 = _3234;
    if (_3202)
    {
        float _3242 = _3234 * 6.283185482025146484375;
        float _3244 = sin(_3242);
        _3238 = _3244;
    }
    float _3246 = _3238;
    float _3248 = precise::max(0.0, _3236);
    float _3250 = _3092;
    if (_3202)
    {
        float _3252 = _3234 * 6.283185482025146484375;
        float _3254 = cos(_3252);
        _3250 = _3254;
    }
    float _3256 = _3250;
    float _3258 = -_3188;
    float _3260 = -_3248;
    float _3262 = fma(_3170, _3258, _3260);
    if (_3202)
    {
        float _3264 = _3262 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3212 = _3264;
    }
    float _3266 = _3212;
    float _3268 = sqrt(_3184);
    float _3270 = _3246;
    float _3272 = _3266;
    if (_3202)
    {
        float _3274 = fma(_3246, _3266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3270 = _3274;
    }
    float _3276 = _3270;
    float _3278 = _3276;
    if (!_3202)
    {
        _3240 = _3194;
    }
    float _3280 = _3240;
    float _3282 = _3280;
    if (_3202)
    {
        float _3284 = _3228 * _3276;
        _3124 = _3284;
    }
    float _3286 = _3124;
    if (!_3202)
    {
        _3230 = _3190;
    }
    float _3288 = _3230;
    float _3290 = _3288;
    float _3292 = _3256;
    if (_3202)
    {
        float _3294 = _3256 + (-1.0);
        _3272 = _3294;
    }
    float _3296 = _3272;
    float _3298 = _3296;
    if (_3202)
    {
        float _3300 = _3190 * _3286;
        _3290 = _3300;
    }
    float _3302 = _3290;
    if (!_3202)
    {
        _3278 = _3262;
    }
    float _3304 = _3278;
    float _3306 = _3162 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3308 = _3304;
    if (_3202)
    {
        float _3310 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3214 = _3310;
    }
    float _3312 = _3214;
    if (!_3202)
    {
        _3298 = _3192;
    }
    float _3314 = _3298;
    float _3316 = _3314;
    if (_3202)
    {
        float _3318 = _3192 * _3286;
        _3316 = _3318;
    }
    float _3320 = _3316;
    if (_3202)
    {
        float _3322 = _3302 * _3302;
        _3282 = _3322;
    }
    float _3324 = _3282;
    if (_3202)
    {
        float _3326 = fma(_3262, _3256, _3312);
        _3308 = _3326;
    }
    float _3328 = _3308;
    if (!_3202)
    {
        _3292 = _3196;
    }
    float _3330 = _3292;
    float _3332 = _3330;
    if (_3202)
    {
        float _3334 = _3320 * _3320;
        _3332 = _3334;
    }
    float _3336 = _3332;
    float _3338 = fma(_3328, _3328, _3324);
    float _3340 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3342 = _3162 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3344 = _3338 + _3336;
    float _3346 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3306);
    float _3348 = _3162 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3350 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3352 = fma(_3268, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3350);
    float _3354 = precise::clamp(_3352, 0.0, 1.0);
    float _3356 = rsqrt(_3344);
    float _3358 = fma(_3166, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3346);
    float _3360 = _3162 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3362 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3348);
    float _3364 = -_3354;
    float _3366 = _3364 + 1.0;
    float _3368 = _3358 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3370 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3360);
    float _3372 = fma(_3166, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3362);
    float _3374 = abs(_3366);
    float _3376 = log2(_3374);
    float _3378 = _3368 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3380 = fma(_3166, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3370);
    float _3382 = _3372 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3384 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3342);
    float _3386 = -_3378;
    float _3388 = fma(_3386, _3340, 1.0);
    float _3390 = _3380 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3392 = _3382 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3394 = _3356 * _3302;
    float _3396 = _3356 * _3328;
    float _3398 = fma(_3166, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3384);
    float _3400 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3392);
    float _3402 = _3394 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3404 = _3356 * _3320;
    float _3406 = _3398 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3408 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3400);
    float _3410 = -_3402;
    float _3412 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3410);
    float _3414 = _3376 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3416 = log2(_3388);
    float _3418 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3408);
    float _3420 = -_3404;
    float _3422 = fma(_3420, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3412);
    float _3424 = _3382 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3426 = fma(_3422, -0.5, 0.5);
    float _3428 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3424);
    float _3430 = exp2(_3414);
    float _3432 = _3382 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3434 = fma(_3422, 0.5, 0.5);
    float _3436 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3428);
    float _3438 = _3396 + 1.0;
    float _3440 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3432);
    float _3442 = fma(_3434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3444 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3436);
    float _3446 = 1.0 / _3418;
    float _3448 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3440);
    float _3450 = fma(_3434, _3442, -0.212114393711090087890625);
    float _3452 = _3416 * 0.693147182464599609375;
    float _3454 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3448);
    float _3456 = fma(_3434, _3450, 1.570728778839111328125);
    float _3458 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3460 = sqrt(_3426);
    float _3462 = -_3396;
    float _3464 = fma(_3430, _3438, _3462);
    float _3466 = fma(_3464, 0.5, 0.5);
    float _3468 = _3444 * _3446;
    float _3470 = _3454 * _3446;
    float _3472 = fma(_3468, 0.5, 0.5);
    float _3474 = fma(_3470, -0.5, 0.5);
    float _3476 = _3460 * 0.636619746685028076171875;
    float3 _8986 = float3(_3472, _3474, _3458);
    float _3478 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8986, float3(0.0), isnan(_8986)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8986, float3(0.0), isnan(_8986)), level(0.0)).x;
    float3 _8997 = float3(_3472, _3474, _3458);
    float4 _3481 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8997, float3(0.0), isnan(_8997)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8997, float3(0.0), isnan(_8997)), level(0.0)).xyzw;
    float _3483 = _3481.x;
    float _3485 = _3481.y;
    float _3487 = _3481.z;
    float _3489 = _3481.w;
    float _3491 = -_3456;
    float _3493 = fma(_3476, _3491, 1.0);
    float2 _9019 = float2(_3493, _3466);
    float3 _3497 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9019, float2(0.0), isnan(_9019)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9019, float2(0.0), isnan(_9019)), level(0.0)).xyz;
    float _3499 = _3497.x;
    float _3501 = _3497.y;
    float _3503 = _3497.z;
    float _3505 = _3376 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3507 = _3382 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3509 = _3418 * 0.5;
    out.m_78.x = _3164;
    out.m_78.y = _3162;
    out.m_78.z = _3166;
    bool _3511 = _3268 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3513 = isnan(_3268);
    bool _3515 = _3511 || _3513;
    bool _3517 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3519 = _3515 || _3517;
    float _3521 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3507);
    float _3523 = exp2(_3505);
    float _3525 = _3444 + _3418;
    float _3527 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3521);
    float _3529 = fma(_3454, -0.5, _3509);
    float _3531 = _3525 * 0.5;
    float _3533 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3527);
    float _3535 = _3533 + _3418;
    out.gl_Position.x = _3444;
    out.gl_Position.y = _3454;
    out.gl_Position.z = _3533;
    out.gl_Position.w = _3418;
    float _3537 = _3535 * 0.5;
    float _3539 = -_3523;
    float _3541 = _3539 + 1.0;
    float _3543 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _3531;
    out.m_80.y = _3529;
    out.m_80.z = _3537;
    out.m_80.w = _3418;
    float _3545 = -_3543;
    float _3547 = _3545 + 1.0;
    float _3549 = _3418;
    float _3551 = _3533;
    float _3553 = _3454;
    float _3555 = _3444;
    float _3557 = _3529;
    float _3559 = _3531;
    if (!_3519)
    {
        _3549 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3561 = _3549;
    float _3563 = _3561;
    float _3565 = _3561;
    if (!_3519)
    {
        _3551 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3567 = _3551;
    float _3569 = _3567;
    float _3571 = _3567;
    if (!_3519)
    {
        _3553 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3573 = _3553;
    float _3575 = _3573;
    float _3577 = _3573;
    if (!_3519)
    {
        _3555 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3579 = _3555;
    float _3581 = _3579;
    float _3583 = _3579;
    if (!_3519)
    {
        _3557 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3585 = _3557;
    float _3587 = _3585;
    float _3589 = _3585;
    if (!_3519)
    {
        _3559 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3591 = _3559;
    float _3593 = _3543 * _3478;
    float _3595 = _3489 * _3593;
    float _3597 = _3503 * _3593;
    float _3599 = fma(_3499, _3595, _3483);
    float _3601 = fma(_3501, _3595, _3485);
    float _3603 = _3489 * _3547;
    float _3605 = fma(_3489, _3597, _3487);
    out.m_82.x = _3599;
    out.m_82.y = _3601;
    out.m_82.z = _3605;
    out.m_82.w = _3603;
    bool _3607 = !_3519;
    float _3609 = _3591;
    float _3611 = _3591;
    if (!_3607)
    {
        bool _3613 = _3268 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3615 = isnan(_3268);
        bool _3617 = _3613 || _3615;
        bool _3619 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3621 = _3617 || _3619;
        if (!_3621)
        {
            float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3625 = _3268 + _3623;
            float _3627 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3629 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3627;
            float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3633 = _3631 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3635 = 1.0 / _3629;
            float _3637 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3639 = _3637 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3641 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3643 = _3641 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3647 = _3645 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3649 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3651 = _3649 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3653 = _3625 * _3635;
            float _3655 = precise::clamp(_3653, 0.0, 1.0);
            float _3657 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3659 = _3657 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3661 = fma(_3655, _3633, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3663 = fma(_3655, _3659, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3665 = fma(_3655, _3639, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3667 = fma(_3655, _3643, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3669 = fma(_3655, _3647, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3671 = fma(_3655, _3651, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3611 = _3665;
            _3577 = _3669;
            _3589 = _3661;
            _3571 = _3667;
            _3565 = _3663;
            _3583 = _3671;
            _3673 = true;
        }
        else
        {
            bool _3675 = _3268 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3677 = isnan(_3268);
            bool _3679 = _3675 || _3677;
            bool _3681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3683 = _3679 || _3681;
            if (!_3683)
            {
                _3587 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3685 = _3587;
            _3589 = _3685;
            if (!_3683)
            {
                _3609 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3687 = _3609;
            _3611 = _3687;
            if (!_3683)
            {
                _3563 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3689 = _3563;
            _3565 = _3689;
            if (!_3683)
            {
                _3569 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3691 = _3569;
            _3571 = _3691;
            if (!_3683)
            {
                _3575 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3693 = _3575;
            _3577 = _3693;
            if (!_3683)
            {
                _3581 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3695 = _3581;
            bool _3697 = !_3683;
            _3583 = _3695;
            if (!_3697)
            {
                bool _3699 = _3268 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3701 = isnan(_3268);
                bool _3703 = _3699 || _3701;
                bool _3705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3707 = _3703 || _3705;
                if (!_3707)
                {
                    float _3709 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3711 = _3268 + _3709;
                    float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3715 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3713;
                    float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3721 = 1.0 / _3715;
                    float _3723 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3725 = _3723 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3727 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3729 = _3727 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3733 = _3731 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3739 = _3711 * _3721;
                    float _3741 = precise::clamp(_3739, 0.0, 1.0);
                    float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3747 = fma(_3741, _3719, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3749 = fma(_3741, _3745, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3751 = fma(_3741, _3725, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3753 = fma(_3741, _3729, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3755 = fma(_3741, _3733, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3757 = fma(_3741, _3737, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3611 = _3751;
                    _3577 = _3755;
                    _3589 = _3747;
                    _3571 = _3753;
                    _3565 = _3749;
                    _3583 = _3757;
                    _3673 = true;
                }
                else
                {
                    _3611 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3577 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3589 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3571 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3565 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3583 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3673 = false;
    float _3759 = _3611;
    float _3761 = _3577;
    float _3763 = _3589;
    float _3765 = _3571;
    float _3767 = _3565;
    float _3769 = _3583;
    float _3771 = fma(_2828, -0.5, 0.5);
    float _3773 = precise::clamp(_3771, 0.0, 1.0);
    float _3775 = -_3759;
    float _3777 = _3775 + _3761;
    float _3779 = -_3763;
    float _3781 = _3779 + _3765;
    float _3783 = -_3767;
    float _3785 = _3783 + _3769;
    bool _3787 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3789 = fma(_3773, _3777, _3759);
    float _3791 = fma(_3773, _3781, _3763);
    float _3793 = fma(_3773, _3785, _3767);
    float _3795 = _3789 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3797 = fma(_3791, 0.298911988735198974609375, _3795);
    float _3799 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3801 = fma(_3793, 0.114477999508380889892578125, _3797);
    out.m_84.w = _3799;
    float _3803 = -_3801;
    float _3805 = _3791 + _3803;
    float _3807 = -_3801;
    float _3809 = _3789 + _3807;
    float _3811 = -_3801;
    float _3813 = _3793 + _3811;
    out.m_86.x = 0.0;
    float _3815 = fma(_3805, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3801);
    float _3817 = fma(_3809, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3801);
    float _3819 = fma(_3813, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3801);
    out.m_88.x = _3815;
    out.m_88.y = _3817;
    out.m_88.z = _3819;
    if (!_3787)
    {
        return out;
    }
    float _3821 = -_3162;
    float _3823 = _3821 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3825 = -_3164;
    float _3827 = _3825 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3829 = -_3166;
    float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3833 = _3823 * _3823;
    float _3835 = fma(_3827, _3827, _3833);
    float _3837 = fma(_3831, _3831, _3835);
    float _3839 = sqrt(_3837);
    float _3841 = rsqrt(_3837);
    float _3843 = -_3839;
    float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3847 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3849 = precise::clamp(_3847, 0.0, 1.0);
    float _3851 = _3827 * _3841;
    float _3853 = _3823 * _3841;
    float _3855 = abs(_3849);
    float _3857 = log2(_3855);
    float _3859 = _3831 * _3841;
    float _3861 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3863 = _2828 * _3853;
    float _3865 = -_3853;
    float _3867 = -_3861;
    float _3869 = fma(_3865, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3867);
    float _3871 = fma(_2826, _3851, _3863);
    float _3873 = -_3859;
    float _3875 = fma(_3873, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3869);
    float _3877 = fma(_2830, _3859, _3871);
    float _3879 = precise::clamp(_3877, 0.0, 1.0);
    float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3883 = _3875 + _3881;
    float _3885 = _3857 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3887 = _3883 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3889 = precise::clamp(_3887, 0.0, 1.0);
    float _3891 = exp2(_3885);
    float _3893 = _3891 * _3889;
    float _3895 = _3879 * _3893;
    float _3897 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3899 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3901 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3897;
    out.m_86.y = _3899;
    out.m_86.z = _3901;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3673 = false;
    bool _685 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_44.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    float _117 = _115;
    if (!_111)
    {
        out.m_47.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _115 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3958 = as_type<float>(_123);
        out.gl_Position.z = _3958;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_49.w;
    float _129 = in.m_51.x;
    bool _131 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_127);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_127;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _129;
    float _145 = _143;
    if (_139)
    {
        float _147 = float(_107);
        _117 = _147;
    }
    float _149 = _117;
    bool _151 = _143 >= _149;
    bool _153 = !_139;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4032 = as_type<float>(_163);
        out.gl_Position.z = _4032;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_55.x;
    float _167 = in.m_55.y;
    float _169 = in.m_55.z;
    float _171 = in.m_57.x;
    float _173 = in.m_57.y;
    float _175 = in.m_57.z;
    float _177 = in.m_59.x;
    float _179 = in.m_59.y;
    float _181 = in.m_59.z;
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_64.w;
    float _187 = in.m_44.x;
    float _189 = in.m_44.y;
    float _191 = in.m_44.z;
    float _193 = _165 * _165;
    float _195 = _167 * _167;
    float _197 = fma(_171, _171, _193);
    float _199 = fma(_173, _173, _195);
    float _201 = fma(_177, _177, _197);
    float _203 = _169 * _169;
    float _205 = fma(_179, _179, _199);
    float _207 = sqrt(_201);
    float _209 = fma(_175, _175, _203);
    float _211 = fma(_181, _181, _209);
    float _213 = sqrt(_205);
    float _215 = sqrt(_211);
    bool _217 = _207 > 0.0;
    bool _219 = _213 > 0.0;
    float _221 = 0.0;
    float _223 = _201;
    float _225 = _205;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _231 = _171;
    if (_217)
    {
        float _233 = rsqrt(_201);
        _221 = _233;
    }
    float _235 = _221;
    float _237 = 0.0;
    if (!_217)
    {
        _237 = 0.0;
    }
    float _239 = _237;
    bool _241 = _215 > 0.0;
    int _243 = as_type<int>(_183) & 1;
    bool _245 = _243 != 0;
    int _247 = as_type<int>(_183) & 2;
    bool _249 = _247 != 0;
    float _251 = 0.0;
    float _253 = _239;
    if (_219)
    {
        float _255 = rsqrt(_205);
        _251 = _255;
    }
    float _257 = _251;
    float _259 = in.m_49.x;
    float _261 = in.m_49.y;
    float _263 = in.m_49.z;
    bool _265 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _269 = _265 || _267;
    bool _271 = isnan(1.0);
    bool _273 = _269 || _271;
    float _275 = 0.0;
    float _277 = 0.0;
    if (!_219)
    {
        _275 = 0.0;
        _277 = 0.0;
    }
    float _279 = _275;
    float _281 = _277;
    float _283 = _281;
    float _285 = _279;
    if (!_217)
    {
        _223 = 0.0;
    }
    float _287 = _223;
    int _289 = int(_245);
    int _291 = _249 ? 2 : 0;
    int _293 = _289 | _291;
    int _295 = _217 ? 4 : 0;
    int _297 = _293 | _295;
    int _299 = _219 ? 8 : 0;
    int _301 = _297 | _299;
    int _303 = _241 ? 16 : 0;
    int _305 = _301 | _303;
    int _307 = _273 ? 32 : 0;
    int _309 = _305 | _307;
    int _311 = false ? 64 : 0;
    int _313 = _309 | _311;
    int _315 = _313 & 32;
    float _317 = 0.0;
    float _319 = as_type<float>(_315);
    float _321 = _287;
    if (_241)
    {
        float _323 = rsqrt(_211);
        _317 = _323;
    }
    float _325 = _317;
    if (!_217)
    {
        _319 = 0.0;
    }
    float _327 = _319;
    float _329 = _327;
    if (_217)
    {
        float _331 = _235 * _171;
        _253 = _331;
    }
    float _333 = _253;
    if (_217)
    {
        float _335 = _235 * _165;
        _321 = _335;
    }
    float _337 = _321;
    if (_217)
    {
        float _339 = _235 * _177;
        _329 = _339;
    }
    float _341 = _329;
    float _343 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _345 = 0.0;
    float _347 = 0.0;
    float _349 = _343;
    if (!_241)
    {
        _345 = 0.0;
        _347 = 0.0;
    }
    float _351 = _345;
    float _353 = _347;
    float _355 = 0.0;
    float _357 = _351;
    float _359 = _353;
    if (!_219)
    {
        _355 = 0.0;
    }
    float _361 = _355;
    float _363 = _361;
    if (_219)
    {
        float _365 = _257 * _173;
        _283 = _365;
    }
    float _367 = _283;
    if (!_273)
    {
        float _369 = _343 * _343;
        float _371 = _369 * 0.5;
        _225 = _371;
    }
    float _373 = _225;
    float _375 = 0.0;
    float _377 = _373;
    if (!_241)
    {
        _375 = 0.0;
    }
    float _379 = _375;
    float _381 = _379;
    if (_219)
    {
        float _383 = _257 * _167;
        _285 = _383;
    }
    float _385 = _285;
    if (_219)
    {
        float _387 = _257 * _179;
        _363 = _387;
    }
    float _389 = _363;
    bool _391 = !_245;
    float _393 = _391 ? (-0.5) : 0.5;
    if (!_273)
    {
        float _395 = _373 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _377 = _395;
    }
    float _397 = _377;
    bool _399 = !_249;
    float _401 = _399 ? (-0.5) : 0.5;
    float _403 = _397;
    if (_241)
    {
        float _405 = _325 * _175;
        _381 = _405;
    }
    float _407 = _381;
    if (_241)
    {
        float _409 = _325 * _169;
        _357 = _409;
    }
    float _411 = _357;
    if (_241)
    {
        float _413 = _325 * _181;
        _359 = _413;
    }
    float _415 = _359;
    bool _417 = !_273;
    float _419 = 0.0;
    if (!_417)
    {
        float _421 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _423 = log2(_421);
        float _425 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _427 = _425 + 1.0;
        float _429 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _431 = _343 * _423;
        float _433 = exp2(_431);
        float _435 = _429 * 0.693147182464599609375;
        float _437 = 1.0 / _435;
        float _439 = 1.0 / _427;
        float _441 = _433 + (-1.0);
        float _443 = -_441;
        float _445 = fma(_443, _437, _343);
        float _447 = _445 * _439;
        float _449 = _447 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _403 = _449;
        _419 = _427;
    }
    float _451 = _403;
    float _453 = _419;
    float _455 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _457 = !_273;
    float _459 = _453;
    float _461 = _451;
    if (!_457)
    {
        float _463 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _465 = log2(_463);
        float _467 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _469 = _467 + 1.0;
        float _471 = 1.0 / _469;
        float _473 = _343 * _465;
        float _475 = exp2(_473);
        float _477 = -_475;
        float _479 = _477 + 1.0;
        float _481 = _479 * _471;
        _459 = _471;
        _349 = _481;
    }
    float _483 = _459;
    float _485 = _349;
    float _487 = _455 * _337;
    float _489 = _455 * _385;
    float _491 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _493 = _455 * _411;
    float _495 = _483;
    if (!_273)
    {
        float _497 = _143 * _143;
        float _499 = _497 * 0.5;
        _495 = _499;
    }
    float _501 = _495;
    float _503 = fma(_491, _333, _487);
    float _505 = fma(_491, _367, _489);
    float _507 = fma(_491, _407, _493);
    float _509 = _451 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_273)
    {
        float _511 = _501 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _461 = _511;
    }
    float _513 = _461;
    bool _515 = !_273;
    float _517 = _513;
    if (!_515)
    {
        float _519 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _521 = log2(_519);
        float _523 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _525 = _523 + 1.0;
        float _527 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _529 = _143 * _521;
        float _531 = exp2(_529);
        float _533 = _527 * 0.693147182464599609375;
        float _535 = 1.0 / _533;
        float _537 = 1.0 / _525;
        float _539 = _531 + (-1.0);
        float _541 = -_539;
        float _543 = fma(_541, _535, _143);
        float _545 = _543 * _537;
        float _547 = _545 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _517 = _547;
    }
    float _549 = _517;
    float _551 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _553 = fma(_509, _341, _503);
    float _555 = fma(_509, _389, _505);
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _559 = _551 * _337;
    float _561 = _551 * _385;
    float _563 = _551 * _411;
    float _565 = fma(_509, _415, _507);
    float _567 = fma(_557, _333, _559);
    float _569 = fma(_557, _367, _561);
    float _571 = fma(_557, _407, _563);
    float _573 = _549 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _575 = fma(_485, _259, _553);
    float _577 = fma(_485, _261, _555);
    float _579 = fma(_485, _263, _565);
    float _581 = fma(_573, _341, _567);
    float _583 = fma(_573, _389, _569);
    float _585 = fma(_573, _415, _571);
    float _587 = _549;
    if (!_273)
    {
        _587 = _143;
    }
    float _589 = _587;
    bool _591 = !_273;
    float _593 = _589;
    if (!_591)
    {
        float _595 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _597 = log2(_595);
        float _599 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _601 = _599 + 1.0;
        float _603 = 1.0 / _601;
        float _605 = _143 * _597;
        float _607 = exp2(_605);
        float _609 = -_607;
        float _611 = _609 + 1.0;
        float _613 = _611 * _603;
        _593 = _613;
    }
    float _615 = _593;
    float _617 = fma(_615, _261, _583);
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _621 = fma(_615, _259, _581);
    float _623 = fma(_577, _185, _189);
    float _625 = -_617;
    float _627 = _577 + _625;
    float _629 = fma(_575, _185, _187);
    float _631 = -_621;
    float _633 = _575 + _631;
    float _635 = fma(_615, _263, _585);
    float _637 = _627 * _173;
    float _639 = _627 * _167;
    float _641 = _627 * _179;
    float _643 = -_635;
    float _645 = _579 + _643;
    float _647 = fma(_633, _171, _637);
    float _649 = fma(_633, _165, _639);
    float _651 = fma(_633, _177, _641);
    float _653 = fma(_579, _185, _191);
    float _655 = fma(_645, _175, _647);
    float _657 = fma(_645, _169, _649);
    float _659 = fma(_645, _181, _651);
    bool _661 = !_619;
    float _663 = _657;
    float _665 = _655;
    float _667 = _659;
    float _683;
    if (!_661)
    {
        float _669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _671 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _675 = _673 * _669;
        float _677 = floor(_675);
        float _679 = -_677;
        float _681 = _675 + _679;
        _683 = _681;
        _685 = true;
    }
    else
    {
        float _687 = float(_107);
        float _689 = 1.0 / _687;
        float _691 = _143 * _689;
        _683 = _691;
    }
    _685 = false;
    float _693 = _683;
    float _695 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _697 = int(_695);
    float _699 = in.m_51.y;
    float _701 = float(_107);
    float _703 = _623 * _167;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _707 = _705 != 0;
    float _709 = _623 * _179;
    float _711 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _713 = int(_711);
    float _715 = fma(_629, _165, _703);
    float _717 = fma(_629, _177, _709);
    float _719 = in.m_59.w;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _723 = 1.0 / _701;
    float _725 = float(_697);
    float _727 = in.m_55.w;
    float _729 = 1.0 / _725;
    float _731 = float(uint(_713));
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _735 = 1.0 + _733;
    int _737 = ~_713;
    int _739 = _737 + 1;
    bool _741 = _713 == 0;
    float _743 = 1.0 / _731;
    float _745 = _143 * _729;
    float _747 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _749 = int(_747);
    int _751 = as_type<int>(_743) + (-2);
    float _753 = trunc(_745);
    int _755 = int(_753);
    float _757 = float(_713);
    float _759 = float(uint(_749));
    float _761 = 1.0 / _735;
    float _763 = _745;
    if (_707)
    {
        _763 = 1.0;
    }
    float _765 = _763;
    float _767 = _765;
    if (!_707)
    {
        _767 = 7.345489978790283203125;
    }
    float _769 = _767;
    int _771 = ~_749;
    int _773 = _771 + 1;
    float _775 = float(uint(_755));
    float _777 = _769 * _129;
    float _779 = 1.0 / _759;
    float _781 = as_type<float>(_751) * _775;
    float _783 = trunc(_781);
    float _785 = precise::max(_783, 0.0);
    uint _788 = uint(_785);
    float _790 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _792 = int(_790);
    int _794 = _739 * int(_788);
    int _796 = _794 + _755;
    float _798 = float(uint(_796));
    float _800 = as_type<float>(_751) * _798;
    float _802 = trunc(_800);
    float _804 = precise::max(_802, 0.0);
    uint _806 = uint(_804);
    int _808 = int(_788) + int(_806);
    float _810 = float(_755);
    float _812 = floor(_777);
    int _814 = _739 * _808;
    int _816 = _814 + _755;
    bool _818 = _810 >= _757;
    bool _820 = isnan(_810);
    bool _822 = _818 || _820;
    bool _824 = isnan(_757);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    bool _830 = uint(_816) >= uint(_713);
    float _832 = trunc(_828);
    int _834 = int(_832);
    bool _836 = !_830;
    int _838 = _836 ? 0 : (-1);
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _842 = _840 != 0;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _850 = _848 != 0;
    int _852 = ~_808;
    int _854 = _852 + _838;
    int _856 = _854 + 1;
    float _858 = -_812;
    float _860 = _777 + _858;
    float _862 = float(_792);
    float _864 = _143 * _723;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _868 = _866 != 0;
    int _870 = _713 * _856;
    int _872 = _870 + _755;
    float _874 = 1.0 / _862;
    float _876 = _860 * _757;
    bool _878 = !_842;
    int _880 = _878 ? 0 : 1;
    int _882 = ~_834;
    int _884 = _882 + 1;
    int _886 = _884 + 1;
    bool _888 = !_741;
    int _890 = _888 ? _872 : (-1);
    float _892 = trunc(_876);
    int _894 = int(_892);
    bool _896 = !_868;
    int _898 = _896 ? 0 : 1;
    int _900 = _890 * _886;
    int _902 = _713 + (-1);
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _906 = _904 != 0;
    int _908 = abs(_898);
    int _910 = _834 * _902;
    int _912 = _910 + _900;
    float _914 = _864 * _757;
    bool _916 = !_846;
    int _918 = _916 ? 0 : 1;
    bool _920 = !_850;
    int _922 = _920 ? 0 : 1;
    int _924 = abs(_918);
    float _926 = trunc(_914);
    int _928 = int(_926);
    float _930 = _143 * _874;
    int _932 = abs(_880);
    int _934 = _894 * _908;
    int _936 = _934 + _755;
    bool _938 = !_906;
    int _940 = _938 ? 0 : 1;
    int _942 = _912 * _924;
    int _944 = abs(_922);
    float _946 = trunc(_930);
    int _948 = int(_946);
    int _950 = abs(_940);
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _954 = _952 != 0;
    int _956 = _928 * _932;
    int _958 = _956 + _942;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _962 = _960 != 0;
    int _964 = _936 * _944;
    int _966 = _964 + _958;
    int _968 = as_type<int>(_779) + (-2);
    int _970 = ~_713;
    int _972 = _970 + 1;
    int _974 = _894 * _950;
    int _976 = _974 + _966;
    float _978 = float(uint(_948));
    float _980 = float(uint(_976));
    float _982 = as_type<float>(_968) * _978;
    int _984 = ~_749;
    int _986 = _984 + 1;
    float _988 = trunc(_982);
    float _990 = precise::max(_988, 0.0);
    uint _992 = uint(_990);
    float _994 = as_type<float>(_751) * _980;
    float _996 = trunc(_994);
    float _998 = precise::max(_996, 0.0);
    uint _1000 = uint(_998);
    int _1002 = _986 * int(_992);
    int _1004 = _1002 + _948;
    float _1006 = _994;
    if (_954)
    {
        _1006 = _129;
    }
    float _1008 = _1006;
    float _1010 = _1008;
    if (!_954)
    {
        _1010 = _699;
    }
    float _1012 = _1010;
    float _1014 = float(uint(_1004));
    int _1016 = _972 * int(_1000);
    int _1018 = _1016 + _976;
    float _1020 = as_type<float>(_968) * _1014;
    float _1022 = float(uint(_1018));
    float _1024 = as_type<float>(_1018);
    if (_954)
    {
        _1024 = 1.0;
    }
    float _1026 = _1024;
    float _1028 = trunc(_1020);
    float _1030 = precise::max(_1028, 0.0);
    uint _1032 = uint(_1030);
    float _1034 = _1026;
    if (!_954)
    {
        _1034 = 1.2345600128173828125;
    }
    float _1036 = _1034;
    float _1038 = as_type<float>(_751) * _1022;
    float _1040 = _1036 * _1012;
    int _1042 = ~_749;
    int _1044 = _1042 + 1;
    float _1046 = trunc(_1038);
    float _1048 = precise::max(_1046, 0.0);
    uint _1050 = uint(_1048);
    int _1052 = int(_992) + int(_1032);
    int _1054 = ~_713;
    int _1056 = _1054 + 1;
    float _1058 = floor(_1040);
    int _1060 = _1044 * _1052;
    int _1062 = _1060 + _948;
    int _1064 = int(_1000) + int(_1050);
    float _1066 = float(_749);
    float _1068 = float(_948);
    int _1070 = _1056 * _1064;
    int _1072 = _1070 + _976;
    bool _1074 = uint(_1062) >= uint(_749);
    bool _1076 = _1068 >= _1066;
    bool _1078 = isnan(_1068);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(_1066);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    bool _1088 = uint(_1072) >= uint(_713);
    float _1090 = trunc(_1086);
    int _1092 = int(_1090);
    bool _1094 = !_1074;
    int _1096 = _1094 ? 0 : (-1);
    float _1098 = -_1058;
    float _1100 = _1040 + _1098;
    bool _1102 = !_962;
    int _1104 = _1102 ? 0 : 1;
    bool _1106 = !_1088;
    int _1108 = _1106 ? 0 : (-1);
    int _1110 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1112 = _1110 != 0;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1116 = _1114 != 0;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1120 = _1118 != 0;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1124 = _1122 != 0;
    int _1126 = ~_1052;
    int _1128 = _1126 + _1096;
    int _1130 = _1128 + 1;
    float _1132 = _1100 * _1066;
    int _1134 = abs(_1104);
    float _1136 = _864 * _1066;
    bool _1138 = !_1116;
    int _1140 = _1138 ? 0 : 1;
    int _1142 = _749 * _1130;
    int _1144 = _1142 + _948;
    bool _1146 = _749 == 0;
    float _1148 = trunc(_1132);
    int _1150 = int(_1148);
    int _1152 = ~_1092;
    int _1154 = _1152 + 1;
    int _1156 = _1154 + 1;
    bool _1158 = !_1146;
    int _1160 = _1158 ? _1144 : (-1);
    int _1162 = ~_1064;
    int _1164 = _1162 + _1108;
    int _1166 = _1164 + 1;
    int _1168 = abs(_1140);
    int _1170 = _1160 * _1156;
    int _1172 = _749 + (-1);
    int _1174 = _713 * _1166;
    int _1176 = _1174 + _976;
    float _1178 = trunc(_1136);
    int _1180 = int(_1178);
    int _1182 = _1092 * _1172;
    int _1184 = _1182 + _1170;
    bool _1186 = _713 == 0;
    int _1188 = _1184 * _1168;
    bool _1190 = !_1120;
    int _1192 = _1190 ? 0 : 1;
    int _1194 = _1150 * _1134;
    int _1196 = _1194 + _948;
    bool _1198 = !_1112;
    int _1200 = _1198 ? 0 : 1;
    bool _1202 = !_1186;
    int _1204 = _1202 ? _1176 : (-1);
    int _1206 = abs(_1200);
    bool _1208 = !_1124;
    int _1210 = _1208 ? 0 : 1;
    int _1212 = abs(_1192);
    int _1214 = _1204 & 3;
    bool _1216 = _1214 != 0;
    int _1218 = abs(_1210);
    bool _1220 = uint(_1214) > 1u;
    int _1222 = _1180 * _1206;
    int _1224 = _1222 + _1188;
    int _1226 = _1204 & 3;
    bool _1228 = _1226 != 0;
    int _1230 = _1196 * _1212;
    int _1232 = _1230 + _1224;
    int _1234 = _1228 ? 0 : 1;
    float _1236 = _129 * 2.0;
    bool _1238 = _1214 != 3;
    int _1240 = _1150 * _1218;
    int _1242 = _1240 + _1232;
    int _1244 = ~_1234;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    float _1250 = floor(_1236);
    int _1252 = _1248;
    if (!_1220)
    {
        int _1254 = ~_1234;
        int _1256 = _1254 + 1;
        _1252 = _1256;
    }
    int _1258 = _1252;
    float _1260 = in.m_51.z;
    float _1262 = float(uint(_1242));
    bool _1264 = uint(_1214) >= 2u;
    float _1266 = as_type<float>(_968) * _1262;
    int _1268 = _1264 ? 0 : 1;
    float _1270 = _699 * 2.0;
    bool _1272 = _129 > 0.5;
    float _1274 = trunc(_1266);
    float _1276 = precise::max(_1274, 0.0);
    uint _1278 = uint(_1276);
    int _1280 = ~_1268;
    int _1282 = _1280 + 1;
    int _1284 = _1282 + 1;
    int _1286 = _1284;
    if (_1238)
    {
        int _1288 = ~_1268;
        int _1290 = _1288 + 1;
        _1286 = _1290;
    }
    int _1292 = _1286;
    int _1294 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1296 = _1294 != 0;
    float _1298 = -_393;
    int _1300 = _1272 ? as_type<int>(_1298) : as_type<int>(_393);
    float _1302 = floor(_1270);
    bool _1304 = _1250 > 0.0;
    bool _1306 = !_1296;
    float _1308 = _1306 ? _393 : as_type<float>(_1300);
    bool _1310 = _1250 >= 0.0;
    bool _1312 = isnan(_1250);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan(0.0);
    bool _1318 = _1314 || _1316;
    int _1320 = ~_749;
    int _1322 = _1320 + 1;
    float _1324 = _1308 + 0.5;
    int _1326 = _1318 ? 0 : 1;
    bool _1328 = _699 > 0.5;
    int _1330 = _1322 * int(_1278);
    int _1332 = _1330 + _1242;
    int _1334 = ~_1326;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    float _1340 = -_401;
    int _1342 = _1328 ? as_type<int>(_1340) : as_type<int>(_401);
    bool _1344 = _1260 > 0.5;
    int _1346 = _1338;
    if (!_1304)
    {
        int _1348 = ~_1326;
        int _1350 = _1348 + 1;
        _1346 = _1350;
    }
    int _1352 = _1346;
    float _1354 = _1260 * 2.0;
    float _1356 = float(uint(_1332));
    float _1358 = -_393;
    int _1360 = _1344 ? as_type<int>(_1358) : as_type<int>(_393);
    float _1362 = floor(_1354);
    bool _1364 = _1302 >= 0.0;
    bool _1366 = isnan(_1302);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan(0.0);
    bool _1372 = _1368 || _1370;
    float _1374 = as_type<float>(_968) * _1356;
    bool _1376 = _1302 > 0.0;
    int _1378 = _1372 ? 0 : 1;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1382 = _1380 != 0;
    float _1384 = trunc(_1374);
    float _1386 = precise::max(_1384, 0.0);
    uint _1388 = uint(_1386);
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1392 = _1390 != 0;
    int _1394 = as_type<int>(_1302);
    if (_954)
    {
        _1394 = 0;
    }
    int _1396 = _1394;
    int _1398 = _1396;
    if (!_954)
    {
        _1398 = 1;
    }
    int _1400 = _1398;
    bool _1402 = !_1382;
    float _1404 = _1402 ? _393 : as_type<float>(_1360);
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1412 = _1410 != 0;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1416 = _1414 != 0;
    float _1418 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1420 = log2(_1418);
    int _1422 = ~_1378;
    int _1424 = _1422 + 1;
    int _1426 = _1424 + 1;
    int _1428 = _1426;
    if (!_1376)
    {
        int _1430 = ~_1378;
        int _1432 = _1430 + 1;
        _1428 = _1432;
    }
    int _1434 = _1428;
    bool _1436 = _1362 >= 0.0;
    bool _1438 = isnan(_1362);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan(0.0);
    bool _1444 = _1440 || _1442;
    float _1446 = in.m_51.w;
    bool _1448 = !_1392;
    float _1450 = _1448 ? _401 : as_type<float>(_1342);
    int _1452 = _1444 ? 0 : 1;
    bool _1454 = _1400 != 1;
    int _1456 = ~_749;
    int _1458 = _1456 + 1;
    int _1460 = int(_1278) + int(_1388);
    float _1462 = _143 * _1420;
    bool _1464 = _1362 > 0.0;
    float _1466 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1468 = !_1408;
    int _1470 = _1468 ? 0 : 1;
    int _1472 = _1458 * _1460;
    int _1474 = _1472 + _1242;
    int _1476 = ~_1452;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    float _1482 = exp2(_1462);
    bool _1484 = !_1216;
    int _1486 = _1484 ? 0 : 1;
    float _1488 = -_721;
    float _1490 = fma(_1466, 2.0, _1488);
    bool _1492 = uint(_1474) >= uint(_749);
    float _1494 = in.m_57.w;
    float _1496 = -_143;
    float _1498 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1490);
    float _1500 = 0.0;
    int _1502 = _1480;
    if (!_1454)
    {
        _1500 = _699;
    }
    float _1504 = _1500;
    float _1506 = _1504;
    if (!_1464)
    {
        int _1508 = ~_1452;
        int _1510 = _1508 + 1;
        _1502 = _1510;
    }
    int _1512 = _1502;
    float _1514 = _623 * _173;
    float _1516 = 0.0;
    if (!_1454)
    {
        _1516 = _699;
    }
    float _1518 = _1516;
    float _1520 = 0.0;
    float _1522 = _1518;
    if (!_1454)
    {
        _1520 = _1260;
    }
    float _1524 = _1520;
    float _1526 = fma(_629, _171, _1514);
    float _1528 = 0.0;
    float _1530 = _1524;
    if (!_1454)
    {
        _1528 = _1260;
    }
    float _1532 = _1528;
    float _1534 = -_1482;
    float _1536 = _1534 + 1.0;
    float _1538 = _1532;
    if (_1454)
    {
        _1506 = _129;
    }
    float _1540 = _1506;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1544 = _693 + _1542;
    if (_1454)
    {
        _1522 = _129;
    }
    float _1546 = _1522;
    float _1548 = fma(_653, _175, _1526);
    if (_1454)
    {
        _1530 = _699;
    }
    float _1550 = _1530;
    if (_1454)
    {
        _1538 = _699;
    }
    float _1552 = _1538;
    bool _1554 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1556 = isnan(0.0);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1562 = _1558 || _1560;
    bool _1564 = !_1492;
    int _1566 = _1564 ? 0 : (-1);
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1570 = _1568 != 0;
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1574 = _1572 != 0;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1578 = _1576 != 0;
    float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1580;
    float _1584 = _1562 ? _1536 : 0.0;
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1588 = _1586 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1590 = _1446 > 0.5;
    float _1592 = 1.0 / _1582;
    float _1594 = _1584 * _761;
    bool _1596 = !_1416;
    int _1598 = _1596 ? 0 : 1;
    int _1600 = ~_1460;
    int _1602 = _1600 + _1566;
    int _1604 = _1602 + 1;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1606;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1612 = 1.0 / _1588;
    float _1614 = _699 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1616 = _749 * _1604;
    int _1618 = _1616 + _1242;
    int _1620 = abs(_1598);
    float _1622 = fma(_1614, -2.0, _1610);
    float _1624 = fma(_653, _181, _717);
    float _1626 = _1544 * _1592;
    float _1628 = fma(_653, _169, _715);
    float _1630 = _129 + _699;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1634 = _693 + _1632;
    float _1636 = 1.0 / _1608;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1640 = _693 + _1638;
    float _1642 = _1630 + (-1.0);
    float _1644 = _129 + _1260;
    float _1646 = _1634 * _1612;
    float _1648 = _1260 + _699;
    float _1650 = float(uint(_936));
    float _1652 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1654 = _1644 + (-1.0);
    float _1656 = _1648 + (-1.0);
    float _1658 = as_type<float>(_751) * _1650;
    float _1660 = _1624 + _719;
    float _1662 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1664 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1666;
    float _1670 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1670;
    float _1674 = trunc(_1658);
    float _1676 = precise::max(_1674, 0.0);
    uint _1678 = uint(_1676);
    float _1680 = _1640 * _1636;
    float _1682 = _1548 + _1494;
    float _1684 = fma(_1668, _1626, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1686 = fma(_1672, _1626, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1688 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1690 = isnan(_693);
    bool _1692 = _1688 || _1690;
    bool _1694 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1696 = _1692 || _1694;
    float _1698 = float(_1696);
    float _1700 = _1628 + _727;
    bool _1702 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1704 = isnan(_693);
    bool _1706 = _1702 || _1704;
    bool _1708 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1710 = _1706 || _1708;
    float _1712 = float(_1710);
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1718 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1720 = isnan(_693);
    bool _1722 = _1718 || _1720;
    bool _1724 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1726 = _1722 || _1724;
    float _1728 = float(_1726);
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1732 = _1730 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1734 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1736 = isnan(_693);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1742 = _1738 || _1740;
    float _1744 = float(_1742);
    float _1746 = -_1698;
    float _1748 = _1746 + 1.0;
    int _1750 = ~_713;
    int _1752 = _1750 + 1;
    float _1754 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1622);
    float _1756 = fma(_1716, _1646, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1758 = -_1744;
    float _1760 = _1758 + 1.0;
    float _1762 = _1744 * _1748;
    float _1764 = fma(_1732, _1646, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1766 = float(_1620);
    float _1768 = _1728 * _1760;
    float _1770 = -_1728;
    float _1772 = _1770 + 1.0;
    float _1774 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1498);
    int _1776 = _1752 * int(_1678);
    int _1778 = _1776 + _936;
    float _1780 = _1712 * _1772;
    float _1782 = -_1712;
    float _1784 = _1782 + 1.0;
    float _1786 = _1450 + (-0.5);
    float _1788 = float(uint(_1778));
    float _1790 = _1684 * _1780;
    float _1792 = _1686 * _1780;
    float _1794 = -_1786;
    float _1796 = -_1754;
    float _1798 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1796);
    float _1800 = as_type<float>(_751) * _1788;
    float _1802 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1790);
    float _1804 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1792);
    float _1806 = float(uint(_1196));
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1810 = trunc(_1800);
    float _1812 = precise::max(_1810, 0.0);
    uint _1814 = uint(_1812);
    float _1816 = as_type<float>(_968) * _1806;
    float _1818 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1808);
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1822 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1828 = trunc(_1816);
    float _1830 = precise::max(_1828, 0.0);
    uint _1832 = uint(_1830);
    float _1834 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1820);
    float _1836 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1838 = -_1824;
    float _1840 = fma(_1822, 2.0, _1838);
    int _1842 = ~_749;
    int _1844 = _1842 + 1;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1848 = _1682 + _1846;
    float _1850 = fma(_1836, -2.0, _1826);
    float _1852 = float(_1434);
    float _1854 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1818);
    float _1856 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1850);
    int _1858 = abs(_1470);
    float _1860 = _1766 * _1852;
    float _1862 = float(_1512);
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1866 = _1700 + _1864;
    float _1868 = float(_1858);
    int _1870 = _1844 * int(_1832);
    int _1872 = _1870 + _1196;
    int _1874 = int(_1678) + int(_1814);
    float _1876 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1878 = _1660 + _1876;
    int _1880 = ~_713;
    int _1882 = _1880 + 1;
    float _1884 = _1868 * _1862;
    float _1886 = float(uint(_1872));
    float _1888 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1834);
    bool _1890 = !_1146;
    int _1892 = _1890 ? _1618 : (-1);
    int _1894 = _1882 * _1874;
    int _1896 = _1894 + _936;
    float _1898 = -_401;
    int _1900 = _1590 ? as_type<int>(_1898) : as_type<int>(_401);
    float _1902 = as_type<float>(_968) * _1886;
    int _1904 = _1204 >> 31;
    float _1906 = _1404 + 0.5;
    bool _1908 = uint(_1896) >= uint(_713);
    float _1910 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1912 = _1892 >> 31;
    float _1914 = trunc(_1902);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    int _1920 = _1904 & 3;
    float _1922 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1910);
    bool _1924 = !_1412;
    int _1926 = _1924 ? 0 : 1;
    float _1928 = _1884 * (-2.0);
    int _1930 = _1912 & 3;
    float _1932 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1922);
    int _1934 = _1204 + _1920;
    float _1936 = -_1888;
    float _1938 = _1936 + 1.0;
    int _1940 = abs(_1926);
    float _1942 = fma(_1652, _1928, _1652);
    int _1944 = _1892 + _1930;
    bool _1946 = !_1578;
    float _1948 = _1946 ? _401 : as_type<float>(_1900);
    int _1950 = _1934 >> 2;
    float _1952 = float(_1352);
    float _1954 = _1948 + (-0.5);
    float _1956 = float(_1940);
    bool _1958 = _1214 != 3;
    float _1960 = -_1954;
    float _1962 = -_1856;
    float _1964 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1962);
    int _1966 = _1944 >> 2;
    float _1968 = _1956 * _1952;
    int _1970 = _1950 << 4;
    int _1972 = _1970 + 368;
    float _1974 = -_143;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1840);
    bool _1978 = !_1958;
    int _1980 = _1978 ? 0 : (-1);
    float _1982 = in.m_66.x;
    float _1984 = in.m_66.y;
    float _1986 = in.m_66.z;
    bool _1988 = !_1908;
    int _1990 = _1988 ? 0 : (-1);
    uint _1992 = uint(int(uint(_1972) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[int(_2002)][_2004];
    int _2008 = _1892 & 3;
    bool _2010 = _2008 != 0;
    float _2012 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1976);
    int _2014 = _1966 << 4;
    int _2016 = _2014 + 512;
    int _2018 = _1892 & 3;
    bool _2020 = _2018 != 0;
    int _2022 = _2010 ? 0 : 1;
    uint _2024 = uint(int(uint(_2016) >> uint(2)));
    uint _2026 = uint(int(uint(int(_2024)) >> uint(2)));
    int _2028 = int(_2024) & 3;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[int(_2026)][_2028];
    int _2032 = int(_2024) + 1;
    uint _2034 = uint(int(uint(_2032) >> uint(2)));
    int _2036 = _2032 & 3;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[int(_2034)][_2036];
    bool _2040 = !_2020;
    int _2042 = _2040 ? 0 : 1;
    bool _2044 = uint(_2018) > 1u;
    bool _2046 = _1932 >= 0.0;
    int _2048 = ~_2022;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    int _2054 = _1972 + 8;
    uint _2056 = uint(int(uint(_2054) >> uint(2)));
    uint _2058 = uint(int(uint(int(_2056)) >> uint(2)));
    int _2060 = int(_2056) & 3;
    float _2062 = (*spvDescriptorSet0.vp_c9)._m0[int(_2058)][_2060];
    int _2064 = int(_2056) + 1;
    uint _2066 = uint(int(uint(_2064) >> uint(2)));
    int _2068 = _2064 & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = int(_1832) + int(_1918);
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2076 = ~_1874;
    int _2078 = _2076 + _1990;
    int _2080 = _2078 + 1;
    int _2082 = abs(_1292);
    int _2084 = _773 * _2072;
    int _2086 = _2084 + _1196;
    float _2088 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2074);
    int _2090 = _2052;
    float _2092 = as_type<float>(_1832);
    if (!_2044)
    {
        int _2094 = ~_2022;
        int _2096 = _2094 + 1;
        _2090 = _2096;
    }
    int _2098 = _2090;
    float _2100 = _129 + (-0.5);
    int _2102 = _2016 + 8;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    uint _2106 = uint(int(uint(int(_2104)) >> uint(2)));
    int _2108 = int(_2104) & 3;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[int(_2106)][_2108];
    int _2112 = int(_2104) + 1;
    uint _2114 = uint(int(uint(_2112) >> uint(2)));
    int _2116 = _2112 & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    bool _2120 = uint(_2018) >= 2u;
    float _2122 = fma(_1928, _1982, _1982);
    float _2124 = _1986;
    if (_2046)
    {
        _2092 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2126 = _2092;
    int _2128 = _2120 ? 0 : 1;
    float _2130 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2122);
    bool _2132 = uint(_2086) >= uint(_749);
    int _2134 = as_type<int>(_2126);
    if (_2046)
    {
        float _2136 = _2126 * 5.0;
        _2134 = as_type<int>(_2136);
    }
    int _2138 = _2134;
    int _2140 = abs(_2098);
    int _2142 = _713 * _2080;
    int _2144 = _2142 + _936;
    bool _2146 = !_2132;
    int _2148 = _2146 ? 0 : (-1);
    float _2150 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2088);
    bool _2152 = _2018 != 3;
    if (_2046)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6854 = as_type<float>(_2138);
        out.gl_Position.z = _6854;
    }
    int _2154 = abs(_1258);
    bool _2156 = !_2152;
    int _2158 = _2156 ? 0 : (-1);
    if (_2046)
    {
        out.m_47.x = 0.0;
    }
    bool _2160 = _2018 != 3;
    int _2162 = ~_2072;
    int _2164 = _2162 + _2148;
    int _2166 = _2164 + 1;
    bool _2168 = _713 == 0;
    int _2170 = _749 * _2166;
    int _2172 = _2170 + _1196;
    int _2174 = ~_2154;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    int _2180 = abs(_1486);
    int _2182 = ~_2140;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    int _2188 = _2178 * as_type<int>(_2006);
    int _2190 = abs(_2042);
    int _2192 = ~_2180;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    int _2198 = _2186 * as_type<int>(_2038);
    int _2200 = ~_2190;
    int _2202 = _2200 + 1;
    int _2204 = _2202 + 1;
    int _2206 = _2196 * as_type<int>(_1998);
    int _2208 = _2206 + _2188;
    int _2210 = ~_2128;
    int _2212 = _2210 + 1;
    int _2214 = _2212 + 1;
    int _2216 = ~_2082;
    int _2218 = _2216 + 1;
    int _2220 = _2218 + 1;
    int _2222 = _2204 * as_type<int>(_2030);
    int _2224 = _2222 + _2198;
    int _2226 = _2214;
    if (_2160)
    {
        int _2228 = ~_2128;
        int _2230 = _2228 + 1;
        _2226 = _2230;
    }
    int _2232 = _2226;
    int _2234 = abs(_2158);
    int _2236 = _2220 * as_type<int>(_2062);
    int _2238 = _2236 + _2208;
    int _2240 = abs(_2232);
    bool _2242 = !_1570;
    int _2244 = _2242 ? 0 : 1;
    int _2246 = abs(_1980);
    int _2248 = ~_2240;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = abs(_2244);
    int _2256 = ~_2246;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    int _2262 = _2252 * as_type<int>(_2110);
    int _2264 = _2262 + _2224;
    int _2266 = ~_2234;
    int _2268 = _2266 + 1;
    int _2270 = _2268 + 1;
    float _2272 = _1866 * _1866;
    bool _2274 = !_1574;
    int _2276 = _2274 ? 0 : 1;
    int _2278 = _2260 * as_type<int>(_2070);
    int _2280 = _2278 + _2238;
    int _2282 = _2270 * as_type<int>(_2118);
    int _2284 = _2282 + _2264;
    int _2286 = abs(_2276);
    float _2288 = fma(_1848, _1848, _2272);
    bool _2290 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2292 = isnan(1.0);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2298 = _2294 || _2296;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2302 = fma(_1878, _1878, _2288);
    int _2304 = ~_2254;
    int _2306 = _2304 + 1;
    int _2308 = _2306 + 1;
    float _2310 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2300);
    int _2312 = ~_2286;
    int _2314 = _2312 + 1;
    int _2316 = _2314 + 1;
    float _2318 = rsqrt(_2302);
    int _2320 = _2280 * _2308;
    bool _2322 = !_2168;
    int _2324 = _2322 ? _2144 : (-1);
    int _2326 = _2284 * _2316;
    bool _2328 = !_1146;
    int _2330 = _2328 ? _2172 : (-1);
    float _2332 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2310);
    int _2334 = _2324 * _2254;
    int _2336 = _2334 + _2320;
    float _2338 = -_2150;
    float _2340 = _2338 + 1.0;
    int _2342 = _2330 * _2286;
    int _2344 = _2342 + _2326;
    float _2346 = -_1854;
    float _2348 = _2346 + 1.0;
    float _2350 = -_2332;
    float _2352 = _2350 + 1.0;
    float _2354 = -_2340;
    float _2356 = fma(_1308, _2354, _1774);
    float _2358 = float(_2336);
    float _2360 = -_2348;
    float _2362 = fma(_1404, _2360, _2012);
    float _2364 = fma(_1450, _2352, _1798);
    float _2366 = fma(_1948, _1938, _1964);
    float _2368 = _1866 * _2318;
    float _2370 = float(_2344);
    float _2372 = _1848 * _2318;
    bool _2374 = !_2298;
    float _2376 = _2374 ? _143 : _1594;
    float _2378 = -_2368;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1866);
    out.m_68.x = _2356;
    out.m_68.y = _2364;
    out.m_68.z = _2362;
    out.m_68.w = _2366;
    float _2382 = -_2372;
    float _2384 = fma(_2382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1848);
    float _2386 = fma(_2376, _1942, _2130);
    out.m_70.x = _2358;
    out.m_70.y = _2370;
    float _2388 = _2380 * _2380;
    if (_2046)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2390 = -_2368;
    float _2392 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1700);
    float _2394 = _1878 * _2318;
    float _2396 = fma(_2384, _2384, _2388);
    float _2398 = -_2372;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1682);
    float _2402 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2404 = _2392 + _2402;
    float _2406 = -_2394;
    float _2408 = fma(_2406, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1878);
    float _2410 = -_2394;
    float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1660);
    float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2416 = _2400 + _2414;
    float _2418 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2420 = fma(_2408, _2408, _2396);
    float _2422 = _1968 * (-2.0);
    float _2424 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2426 = _2412 + _2424;
    float _2428 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2418);
    float _2430 = _699 + (-0.5);
    float _2432 = fma(_2422, _1984, _1984);
    float _2434 = fma(_2426, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2428);
    float _2436 = fma(_1664, _2422, _1664);
    float _2438 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2432);
    float _2440 = fma(_1764, _1768, _1804);
    float _2442 = in.m_64.x;
    float _2444 = in.m_64.y;
    bool _2446 = _2434 >= 0.0;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2448;
    float _2452 = fma(_2376, _2436, _2438);
    float _2454 = _1860 * (-2.0);
    float _2456 = _2386 * 0.15915493667125701904296875;
    float _2458 = fma(_2450, _1680, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2460 = _2452 * 0.15915493667125701904296875;
    float _2462 = fma(_2454, _1986, _1986);
    float _2464 = fma(_2458, _1762, _2440);
    float _2466 = _1260 + (-0.5);
    float _2468 = sqrt(_2420);
    float _2470 = fma(_1662, _2454, _1662);
    float _2472 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2464);
    if (_2446)
    {
        _2124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2474 = _2124;
    float _2476 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2462);
    float _2478 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2480 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2478;
    int _2482 = as_type<int>(_2474);
    if (_2446)
    {
        out.m_47.x = 0.0;
    }
    float _2484 = _2456 * 6.283185482025146484375;
    float _2486 = sin(_2484);
    if (_2446)
    {
        float _2488 = _2474 * 5.0;
        _2482 = as_type<int>(_2488);
    }
    int _2490 = _2482;
    float _2492 = fma(_2376, _2470, _2476);
    float _2494 = fma(_1756, _1768, _1802);
    float _2496 = _2472 * _2444;
    float _2498 = fma(_2480, _1680, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    if (_2446)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7386 = as_type<float>(_2490);
        out.gl_Position.z = _7386;
    }
    float _2500 = _2492 * 0.15915493667125701904296875;
    float _2502 = _2456 * 6.283185482025146484375;
    float _2504 = cos(_2502);
    float _2506 = _2460 * 6.283185482025146484375;
    float _2508 = sin(_2506);
    float _2510 = _2460 * 6.283185482025146484375;
    float _2512 = cos(_2510);
    if (_2446)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2514 = _2500 * 6.283185482025146484375;
    float _2516 = cos(_2514);
    float _2518 = fma(_2498, _1762, _2494);
    float _2520 = _2318 * _2468;
    float _2522 = _2496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2524 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _401);
    float _2526 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2518);
    float _2528 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _393);
    float _2530 = _2520 * _2522;
    float _2532 = _2500 * 6.283185482025146484375;
    float _2534 = sin(_2532);
    float _2536 = _2526 * _2442;
    float _2538 = _2486 * _2512;
    float _2540 = _2524 * _2530;
    float _2542 = _2486 * _2508;
    float _2544 = _2536 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2546 = _2504 * _2512;
    float _2548 = _2504 * _2508;
    float _2550 = _2504 * _2516;
    float _2552 = _2520 * _2544;
    float _2554 = _2512 * _2516;
    float _2556 = _2486 * _2516;
    float _2558 = _2508 * _2516;
    float _2560 = _2528 * _2552;
    float _2562 = _2550 * _2540;
    float _2564 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2566 = _2564 * 0.5;
    float _2568 = fma(_2534, _2546, _2542);
    float _2570 = -_2538;
    float _2572 = fma(_2534, _2548, _2570);
    float _2574 = -_2540;
    float _2576 = _2534 * _2574;
    float _2578 = fma(_2534, _2542, _2546);
    float _2580 = fma(_2568, _2560, _2562);
    float _2582 = -_2548;
    float _2584 = fma(_2534, _2538, _2582);
    float _2586 = _2556 * _2540;
    float _2588 = fma(_2554, _2560, _2576);
    float _2590 = fma(_2572, _2566, _2580);
    float _2592 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2594 = fma(_2584, _2560, _2586);
    float _2596 = fma(_2558, _2566, _2588);
    float _2598 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2600 = _2568 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2602 = fma(_2578, _2566, _2594);
    float _2604 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2606 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2598);
    float _2608 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2600);
    float _2610 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2612 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2604);
    float _2614 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2606);
    float _2616 = -_2534;
    float _2618 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2592);
    float _2620 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2610);
    float _2622 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2612);
    float _2624 = _2614 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2626 = _2568 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2628 = _2622 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2630 = _1660 + _2624;
    float _2632 = _2568 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2634 = _401 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2636 = _1682 + _2628;
    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2640 = _2630 + _2638;
    float _2642 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2632);
    float _2644 = fma(_2554, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2626);
    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2648 = _2636 + _2646;
    float _2650 = _2640 * _2640;
    float _2652 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2654 = fma(_2648, _2648, _2650);
    float _2656 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2658 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2652);
    float _2660 = sqrt(_2654);
    float _2662 = fma(_2596, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2656);
    float _2664 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2666 = _2550 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2668 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2658);
    float _2670 = fma(_2602, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2662);
    float _2672 = _2572 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2674 = -_2534;
    float _2676 = fma(_2674, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2664);
    float _2678 = fma(_2634, _2634, 1.0);
    float _2680 = -_2534;
    float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2666);
    float _2684 = fma(_2558, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2672);
    float _2686 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2688 = rsqrt(_2678);
    float _2690 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2618);
    float _2692 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2684);
    float _2694 = _1700 + _2686;
    bool _2696 = _2660 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2698 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2676);
    float _2700 = fma(_2556, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2682);
    float _2702 = fma(_2578, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2620);
    float _2704 = _2684;
    float _2706 = _2618;
    float _2708 = _2658;
    if (!_2696)
    {
        _2704 = _2636;
    }
    float _2710 = _2704;
    float _2712 = _2710;
    if (!_2696)
    {
        _2706 = _2630;
    }
    float _2714 = _2706;
    float _2716 = _2714;
    if (!_2696)
    {
        _2708 = _2694;
    }
    float _2718 = _2708;
    bool _2720 = !_2696;
    float _2722 = _2718;
    if (!_2720)
    {
        float _2724 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2728 = _2660 + _2726;
        float _2730 = rsqrt(_2654);
        float _2732 = _2728 * _2724;
        float _2734 = _2694 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2736 = _2732 * 0.15915493667125701904296875;
        float _2738 = _2736 * 6.283185482025146484375;
        float _2740 = cos(_2738);
        float _2742 = _2736 * 6.283185482025146484375;
        float _2744 = sin(_2742);
        float _2746 = _2740 + (-1.0);
        float _2748 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2750 = fma(_2744, _2734, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2752 = fma(_2694, _2740, _2748);
        float _2754 = _2730 * _2750;
        float _2756 = fma(_2648, _2754, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2758 = fma(_2640, _2754, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2722 = _2752;
        _2712 = _2756;
        _2716 = _2758;
    }
    float _2760 = _2722;
    float _2762 = _2712;
    float _2764 = _2716;
    float _2766 = -_1700;
    float _2768 = _2766 + _2760;
    float _2770 = -_1682;
    float _2772 = _2770 + _2762;
    float _2774 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2642);
    float _2776 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2644);
    float _2778 = _2768 * _2768;
    float _2780 = _393 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2782 = -_1660;
    float _2784 = _2782 + _2764;
    float _2786 = fma(_2584, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2608);
    float _2788 = fma(_2772, _2772, _2778);
    float _2790 = _2634 * _2688;
    float _2792 = _2634 * _2698;
    float _2794 = _2634 * _2690;
    float _2796 = fma(_2784, _2784, _2788);
    float _2798 = _2634 * _2700;
    float _2800 = -_2668;
    float _2802 = _2790 * _2800;
    float _2804 = -_2702;
    float _2806 = _2790 * _2804;
    float _2808 = sqrt(_2796);
    float _2810 = -_2692;
    float _2812 = _2790 * _2810;
    float _2814 = fma(_2780, _2774, _2792);
    float _2816 = fma(_2780, _2776, _2794);
    float _2818 = fma(_2780, _2786, _2798);
    float _2820 = fma(_2688, _2690, _2806);
    float _2822 = fma(_2688, _2698, _2802);
    float _2824 = fma(_2688, _2700, _2812);
    float _2826 = _2668 + _2814;
    float _2828 = _2702 + _2816;
    float _2830 = _2692 + _2818;
    out.m_72.x = _2774;
    out.m_72.y = _2776;
    out.m_72.z = _2786;
    out.m_74.x = _2822;
    out.m_74.y = _2820;
    out.m_74.z = _2824;
    bool _2832 = _2808 > 0.0;
    out.m_76.x = _2826;
    out.m_76.y = _2828;
    out.m_76.z = _2830;
    bool _2834 = !_2832;
    float _2836 = _2820;
    float _2838 = _2774;
    float _2840 = _2762;
    float _2842 = _2760;
    float _2844 = _2764;
    float _2846 = _2776;
    if (!_2834)
    {
        bool _2848 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2850 = _2776;
        if (_2848)
        {
            float _2852 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2850 = _2852;
        }
        float _2854 = _2850;
        float _2856 = _2854;
        if (_2848)
        {
            float _2858 = _655 * _2854;
            _2836 = _2858;
        }
        float _2860 = _2836;
        float _2862 = _2860;
        if (_2848)
        {
            float _2864 = _657 * _2854;
            _2838 = _2864;
        }
        float _2866 = _2838;
        float _2868 = _2866;
        if (_2848)
        {
            float _2870 = _659 * _2854;
            _2856 = _2870;
        }
        float _2872 = _2856;
        float _2874 = _2872;
        if (!_2848)
        {
            bool _2876 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2878 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2880 = _2876 || _2878;
            bool _2882 = isnan(1.0);
            bool _2884 = _2880 || _2882;
            float _2886 = _143 + 1.0;
            float _2888 = _2886;
            if (!_2884)
            {
                float _2890 = _2886 * _2886;
                float _2892 = _2890 * 0.5;
                _145 = _2892;
            }
            float _2894 = _145;
            float _2896 = _2894;
            if (!_2884)
            {
                float _2898 = _2894 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2896 = _2898;
            }
            float _2900 = _2896;
            bool _2902 = !_2884;
            float _2904 = _2900;
            if (!_2902)
            {
                float _2906 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2908 = log2(_2906);
                float _2910 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2912 = 1.0 + _2910;
                float _2914 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2916 = _2908 * _2886;
                float _2918 = 1.0 / _2912;
                float _2920 = _2914 * 0.693147182464599609375;
                float _2922 = exp2(_2916);
                float _2924 = 1.0 / _2920;
                float _2926 = _2922 + (-1.0);
                float _2928 = -_2926;
                float _2930 = fma(_2928, _2924, _2886);
                float _2932 = _2930 * _2918;
                float _2934 = _2932 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2904 = _2934;
            }
            float _2936 = _2904;
            float _2938 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2940 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2942 = _2936 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2944 = _2936;
            if (!_2884)
            {
                _2944 = _2886;
            }
            float _2946 = _2944;
            float _2948 = _2938 * _385;
            float _2950 = _2938 * _337;
            float _2952 = _2938 * _411;
            float _2954 = fma(_2940, _367, _2948);
            float _2956 = fma(_2940, _333, _2950);
            float _2958 = fma(_2942, _389, _2954);
            bool _2960 = !_2884;
            float _2962 = _2946;
            if (!_2960)
            {
                float _2964 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2966 = log2(_2964);
                float _2968 = _2966 * _2886;
                float _2970 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2972 = 1.0 + _2970;
                float _2974 = exp2(_2968);
                float _2976 = 1.0 / _2972;
                float _2978 = -_2974;
                float _2980 = _2978 + 1.0;
                float _2982 = _2980 * _2976;
                _2962 = _2982;
                _2888 = _2972;
            }
            float _2984 = _2962;
            float _2986 = _2888;
            float _2988 = fma(_2940, _407, _2952);
            float _2990 = fma(_2942, _341, _2956);
            float _2992 = fma(_2984, _261, _2958);
            float _2994 = fma(_2942, _415, _2988);
            float _2996 = fma(_2984, _259, _2990);
            float _2998 = -_617;
            float _3000 = _2998 + _2992;
            float _3002 = fma(_2984, _263, _2994);
            float _3004 = -_621;
            float _3006 = _3004 + _2996;
            float _3008 = _3000 * _173;
            float _3010 = _3000 * _167;
            float _3012 = _3000 * _179;
            float _3014 = -_635;
            float _3016 = _3014 + _3002;
            float _3018 = fma(_3006, _171, _3008);
            float _3020 = fma(_3006, _165, _3010);
            float _3022 = fma(_3006, _177, _3012);
            float _3024 = fma(_3016, _175, _3018);
            float _3026 = fma(_3016, _169, _3020);
            float _3028 = fma(_3016, _181, _3022);
            _663 = _3026;
            _665 = _3024;
            _667 = _3028;
            _2862 = _3024;
            _2868 = _3026;
            _2874 = _3028;
            _227 = _2986;
        }
        float _3030 = _663;
        float _3032 = _665;
        float _3034 = _667;
        float _3036 = _2862;
        float _3038 = _2868;
        float _3040 = _2874;
        float _3042 = _227;
        float _3044 = _3030 * _3030;
        float _3046 = rsqrt(_2796);
        float _3048 = fma(_3032, _3032, _3044);
        float _3050 = fma(_3034, _3034, _3048);
        float _3052 = sqrt(_3050);
        float _3054 = _2772 * _3046;
        float _3056 = _2768 * _3046;
        float _3058 = _2784 * _3046;
        bool _3060 = _3052 > 0.0;
        bool _3062 = !_3060;
        _229 = _3042;
        _2846 = _3040;
        if (!_3062)
        {
            float _3064 = rsqrt(_3050);
            float _3066 = _3064 * _3030;
            float _3068 = _3064 * _3032;
            float _3070 = _3064 * _3034;
            float _3072 = _3056 * _3066;
            float _3074 = fma(_3054, _3068, _3072);
            float _3076 = fma(_3058, _3070, _3074);
            float _3078 = _3076 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3080 = fma(_3036, _3078, _2762);
            float _3082 = fma(_3038, _3078, _2760);
            float _3084 = fma(_3040, _3078, _2764);
            _2840 = _3080;
            _2842 = _3082;
            _2844 = _3084;
        }
    }
    float _3086 = _2840;
    float _3088 = _2842;
    float _3090 = _2844;
    float _3092 = _229;
    float _3094 = _2846;
    bool _3096 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3098 = isnan(0.5);
    bool _3100 = _3096 || _3098;
    bool _3102 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3104 = _3100 || _3102;
    float _3106 = -_2372;
    float _3108 = fma(_3106, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3086);
    float _3110 = -_2368;
    float _3112 = fma(_3110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3088);
    float _3114 = -_2394;
    float _3116 = fma(_3114, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3090);
    float _3118 = _3112;
    float _3120 = _3108;
    float _3122 = _3116;
    float _3124 = _3094;
    if (!_3104)
    {
        float _3126 = _2404 * _2404;
        float _3128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3130 = -_1682;
        float _3132 = _3130 + _3086;
        float _3134 = -_1700;
        float _3136 = _3134 + _3088;
        float _3138 = fma(_2416, _2416, _3126);
        float _3140 = -_1660;
        float _3142 = _3140 + _3090;
        float _3144 = fma(_2426, _2426, _3138);
        float _3146 = 1.0 / _2520;
        float _3148 = sqrt(_3144);
        float _3150 = precise::min(_3148, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3152 = _3150 * _3128;
        float _3154 = _3152 * _3146;
        float _3156 = fma(_3132, _3154, _2400);
        float _3158 = fma(_3136, _3154, _2392);
        float _3160 = fma(_3142, _3154, _2412);
        _3118 = _3158;
        _3120 = _3156;
        _3122 = _3160;
    }
    float _3162 = _3118;
    float _3164 = _3120;
    float _3166 = _3122;
    float _3168 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3170 = _3162 + _3168;
    float _3172 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3174 = _3164 + _3172;
    float _3176 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3178 = _3166 + _3176;
    float _3180 = _3170 * _3170;
    float _3182 = fma(_3174, _3174, _3180);
    float _3184 = fma(_3178, _3178, _3182);
    float _3186 = rsqrt(_3184);
    float _3188 = _3186 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3190 = _3174 * _3188;
    float _3192 = _3178 * _3188;
    float _3194 = _3190 * _3190;
    float _3196 = _3192 * _3192;
    float _3198 = _3194 + _3196;
    float _3200 = sqrt(_3198);
    bool _3202 = _3200 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3204 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3206 = _3200 + _3204;
    float _3208 = _3186;
    float _3210 = _3206;
    float _3212 = _3170;
    float _3214 = _3188;
    if (_3202)
    {
        float _3216 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3208 = _3216;
    }
    float _3218 = _3208;
    float _3220 = _3218;
    if (_3202)
    {
        float _3222 = _3206 * _3218;
        _3210 = _3222;
    }
    float _3224 = _3210;
    if (_3202)
    {
        float _3226 = rsqrt(_3198);
        _3220 = _3226;
    }
    float _3228 = _3220;
    float _3230 = _3228;
    if (_3202)
    {
        float _3232 = _3224 * 0.15915493667125701904296875;
        _231 = _3232;
    }
    float _3234 = _231;
    float _3236 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3238 = _3178;
    float _3240 = _3234;
    if (_3202)
    {
        float _3242 = _3234 * 6.283185482025146484375;
        float _3244 = sin(_3242);
        _3238 = _3244;
    }
    float _3246 = _3238;
    float _3248 = precise::max(0.0, _3236);
    float _3250 = _3092;
    if (_3202)
    {
        float _3252 = _3234 * 6.283185482025146484375;
        float _3254 = cos(_3252);
        _3250 = _3254;
    }
    float _3256 = _3250;
    float _3258 = -_3188;
    float _3260 = -_3248;
    float _3262 = fma(_3170, _3258, _3260);
    if (_3202)
    {
        float _3264 = _3262 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3212 = _3264;
    }
    float _3266 = _3212;
    float _3268 = sqrt(_3184);
    float _3270 = _3246;
    float _3272 = _3266;
    if (_3202)
    {
        float _3274 = fma(_3246, _3266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3270 = _3274;
    }
    float _3276 = _3270;
    float _3278 = _3276;
    if (!_3202)
    {
        _3240 = _3194;
    }
    float _3280 = _3240;
    float _3282 = _3280;
    if (_3202)
    {
        float _3284 = _3228 * _3276;
        _3124 = _3284;
    }
    float _3286 = _3124;
    if (!_3202)
    {
        _3230 = _3190;
    }
    float _3288 = _3230;
    float _3290 = _3288;
    float _3292 = _3256;
    if (_3202)
    {
        float _3294 = _3256 + (-1.0);
        _3272 = _3294;
    }
    float _3296 = _3272;
    float _3298 = _3296;
    if (_3202)
    {
        float _3300 = _3190 * _3286;
        _3290 = _3300;
    }
    float _3302 = _3290;
    if (!_3202)
    {
        _3278 = _3262;
    }
    float _3304 = _3278;
    float _3306 = _3162 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3308 = _3304;
    if (_3202)
    {
        float _3310 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3214 = _3310;
    }
    float _3312 = _3214;
    if (!_3202)
    {
        _3298 = _3192;
    }
    float _3314 = _3298;
    float _3316 = _3314;
    if (_3202)
    {
        float _3318 = _3192 * _3286;
        _3316 = _3318;
    }
    float _3320 = _3316;
    if (_3202)
    {
        float _3322 = _3302 * _3302;
        _3282 = _3322;
    }
    float _3324 = _3282;
    if (_3202)
    {
        float _3326 = fma(_3262, _3256, _3312);
        _3308 = _3326;
    }
    float _3328 = _3308;
    if (!_3202)
    {
        _3292 = _3196;
    }
    float _3330 = _3292;
    float _3332 = _3330;
    if (_3202)
    {
        float _3334 = _3320 * _3320;
        _3332 = _3334;
    }
    float _3336 = _3332;
    float _3338 = fma(_3328, _3328, _3324);
    float _3340 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3342 = _3162 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3344 = _3338 + _3336;
    float _3346 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3306);
    float _3348 = _3162 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3350 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3352 = fma(_3268, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3350);
    float _3354 = precise::clamp(_3352, 0.0, 1.0);
    float _3356 = rsqrt(_3344);
    float _3358 = fma(_3166, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3346);
    float _3360 = _3162 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3362 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3348);
    float _3364 = -_3354;
    float _3366 = _3364 + 1.0;
    float _3368 = _3358 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3370 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3360);
    float _3372 = fma(_3166, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3362);
    float _3374 = abs(_3366);
    float _3376 = log2(_3374);
    float _3378 = _3368 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3380 = fma(_3166, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3370);
    float _3382 = _3372 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3384 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3342);
    float _3386 = -_3378;
    float _3388 = fma(_3386, _3340, 1.0);
    float _3390 = _3380 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3392 = _3382 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3394 = _3356 * _3302;
    float _3396 = _3356 * _3328;
    float _3398 = fma(_3166, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3384);
    float _3400 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3392);
    float _3402 = _3394 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3404 = _3356 * _3320;
    float _3406 = _3398 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3408 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3400);
    float _3410 = -_3402;
    float _3412 = fma(_3396, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3410);
    float _3414 = _3376 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3416 = log2(_3388);
    float _3418 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3408);
    float _3420 = -_3404;
    float _3422 = fma(_3420, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3412);
    float _3424 = _3382 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3426 = fma(_3422, -0.5, 0.5);
    float _3428 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3424);
    float _3430 = exp2(_3414);
    float _3432 = _3382 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3434 = fma(_3422, 0.5, 0.5);
    float _3436 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3428);
    float _3438 = _3396 + 1.0;
    float _3440 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3432);
    float _3442 = fma(_3434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3444 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3436);
    float _3446 = 1.0 / _3418;
    float _3448 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3440);
    float _3450 = fma(_3434, _3442, -0.212114393711090087890625);
    float _3452 = _3416 * 0.693147182464599609375;
    float _3454 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3448);
    float _3456 = fma(_3434, _3450, 1.570728778839111328125);
    float _3458 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3460 = sqrt(_3426);
    float _3462 = -_3396;
    float _3464 = fma(_3430, _3438, _3462);
    float _3466 = fma(_3464, 0.5, 0.5);
    float _3468 = _3444 * _3446;
    float _3470 = _3454 * _3446;
    float _3472 = fma(_3468, 0.5, 0.5);
    float _3474 = fma(_3470, -0.5, 0.5);
    float _3476 = _3460 * 0.636619746685028076171875;
    float3 _8986 = float3(_3472, _3474, _3458);
    float _3478 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8986, float3(0.0), isnan(_8986)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8986, float3(0.0), isnan(_8986)), level(0.0)).x;
    float3 _8997 = float3(_3472, _3474, _3458);
    float4 _3481 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8997, float3(0.0), isnan(_8997)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8997, float3(0.0), isnan(_8997)), level(0.0)).xyzw;
    float _3483 = _3481.x;
    float _3485 = _3481.y;
    float _3487 = _3481.z;
    float _3489 = _3481.w;
    float _3491 = -_3456;
    float _3493 = fma(_3476, _3491, 1.0);
    float2 _9019 = float2(_3493, _3466);
    float3 _3497 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9019, float2(0.0), isnan(_9019)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9019, float2(0.0), isnan(_9019)), level(0.0)).xyz;
    float _3499 = _3497.x;
    float _3501 = _3497.y;
    float _3503 = _3497.z;
    float _3505 = _3376 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3507 = _3382 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3509 = _3418 * 0.5;
    out.m_78.x = _3164;
    out.m_78.y = _3162;
    out.m_78.z = _3166;
    bool _3511 = _3268 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3513 = isnan(_3268);
    bool _3515 = _3511 || _3513;
    bool _3517 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3519 = _3515 || _3517;
    float _3521 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3507);
    float _3523 = exp2(_3505);
    float _3525 = _3444 + _3418;
    float _3527 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3521);
    float _3529 = fma(_3454, -0.5, _3509);
    float _3531 = _3525 * 0.5;
    float _3533 = fma(_3406, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3527);
    float _3535 = _3533 + _3418;
    out.gl_Position.x = _3444;
    out.gl_Position.y = _3454;
    out.gl_Position.z = _3533;
    out.gl_Position.w = _3418;
    float _3537 = _3535 * 0.5;
    float _3539 = -_3523;
    float _3541 = _3539 + 1.0;
    float _3543 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _3531;
    out.m_80.y = _3529;
    out.m_80.z = _3537;
    out.m_80.w = _3418;
    float _3545 = -_3543;
    float _3547 = _3545 + 1.0;
    float _3549 = _3418;
    float _3551 = _3533;
    float _3553 = _3454;
    float _3555 = _3444;
    float _3557 = _3529;
    float _3559 = _3531;
    if (!_3519)
    {
        _3549 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3561 = _3549;
    float _3563 = _3561;
    float _3565 = _3561;
    if (!_3519)
    {
        _3551 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3567 = _3551;
    float _3569 = _3567;
    float _3571 = _3567;
    if (!_3519)
    {
        _3553 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3573 = _3553;
    float _3575 = _3573;
    float _3577 = _3573;
    if (!_3519)
    {
        _3555 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3579 = _3555;
    float _3581 = _3579;
    float _3583 = _3579;
    if (!_3519)
    {
        _3557 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3585 = _3557;
    float _3587 = _3585;
    float _3589 = _3585;
    if (!_3519)
    {
        _3559 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3591 = _3559;
    float _3593 = _3543 * _3478;
    float _3595 = _3489 * _3593;
    float _3597 = _3503 * _3593;
    float _3599 = fma(_3499, _3595, _3483);
    float _3601 = fma(_3501, _3595, _3485);
    float _3603 = _3489 * _3547;
    float _3605 = fma(_3489, _3597, _3487);
    out.m_82.x = _3599;
    out.m_82.y = _3601;
    out.m_82.z = _3605;
    out.m_82.w = _3603;
    bool _3607 = !_3519;
    float _3609 = _3591;
    float _3611 = _3591;
    if (!_3607)
    {
        bool _3613 = _3268 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3615 = isnan(_3268);
        bool _3617 = _3613 || _3615;
        bool _3619 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3621 = _3617 || _3619;
        if (!_3621)
        {
            float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3625 = _3268 + _3623;
            float _3627 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3629 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3627;
            float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3633 = _3631 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3635 = 1.0 / _3629;
            float _3637 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3639 = _3637 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3641 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3643 = _3641 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3647 = _3645 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3649 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3651 = _3649 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3653 = _3625 * _3635;
            float _3655 = precise::clamp(_3653, 0.0, 1.0);
            float _3657 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3659 = _3657 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3661 = fma(_3655, _3633, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3663 = fma(_3655, _3659, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3665 = fma(_3655, _3639, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3667 = fma(_3655, _3643, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3669 = fma(_3655, _3647, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3671 = fma(_3655, _3651, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3611 = _3665;
            _3577 = _3669;
            _3589 = _3661;
            _3571 = _3667;
            _3565 = _3663;
            _3583 = _3671;
            _3673 = true;
        }
        else
        {
            bool _3675 = _3268 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3677 = isnan(_3268);
            bool _3679 = _3675 || _3677;
            bool _3681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3683 = _3679 || _3681;
            if (!_3683)
            {
                _3587 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3685 = _3587;
            _3589 = _3685;
            if (!_3683)
            {
                _3609 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3687 = _3609;
            _3611 = _3687;
            if (!_3683)
            {
                _3563 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3689 = _3563;
            _3565 = _3689;
            if (!_3683)
            {
                _3569 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3691 = _3569;
            _3571 = _3691;
            if (!_3683)
            {
                _3575 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3693 = _3575;
            _3577 = _3693;
            if (!_3683)
            {
                _3581 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3695 = _3581;
            bool _3697 = !_3683;
            _3583 = _3695;
            if (!_3697)
            {
                bool _3699 = _3268 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3701 = isnan(_3268);
                bool _3703 = _3699 || _3701;
                bool _3705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3707 = _3703 || _3705;
                if (!_3707)
                {
                    float _3709 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3711 = _3268 + _3709;
                    float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3715 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3713;
                    float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3721 = 1.0 / _3715;
                    float _3723 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3725 = _3723 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3727 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3729 = _3727 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3733 = _3731 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3739 = _3711 * _3721;
                    float _3741 = precise::clamp(_3739, 0.0, 1.0);
                    float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3747 = fma(_3741, _3719, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3749 = fma(_3741, _3745, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3751 = fma(_3741, _3725, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3753 = fma(_3741, _3729, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3755 = fma(_3741, _3733, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3757 = fma(_3741, _3737, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3611 = _3751;
                    _3577 = _3755;
                    _3589 = _3747;
                    _3571 = _3753;
                    _3565 = _3749;
                    _3583 = _3757;
                    _3673 = true;
                }
                else
                {
                    _3611 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3577 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3589 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3571 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3565 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3583 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3673 = false;
    float _3759 = _3611;
    float _3761 = _3577;
    float _3763 = _3589;
    float _3765 = _3571;
    float _3767 = _3565;
    float _3769 = _3583;
    float _3771 = fma(_2828, -0.5, 0.5);
    float _3773 = precise::clamp(_3771, 0.0, 1.0);
    float _3775 = -_3759;
    float _3777 = _3775 + _3761;
    float _3779 = -_3763;
    float _3781 = _3779 + _3765;
    float _3783 = -_3767;
    float _3785 = _3783 + _3769;
    bool _3787 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3789 = fma(_3773, _3777, _3759);
    float _3791 = fma(_3773, _3781, _3763);
    float _3793 = fma(_3773, _3785, _3767);
    float _3795 = _3789 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3797 = fma(_3791, 0.298911988735198974609375, _3795);
    float _3799 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3801 = fma(_3793, 0.114477999508380889892578125, _3797);
    out.m_84.w = _3799;
    float _3803 = -_3801;
    float _3805 = _3791 + _3803;
    float _3807 = -_3801;
    float _3809 = _3789 + _3807;
    float _3811 = -_3801;
    float _3813 = _3793 + _3811;
    out.m_86.x = 0.0;
    float _3815 = fma(_3805, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3801);
    float _3817 = fma(_3809, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3801);
    float _3819 = fma(_3813, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3801);
    out.m_88.x = _3815;
    out.m_88.y = _3817;
    out.m_88.z = _3819;
    if (!_3787)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3821 = -_3162;
    float _3823 = _3821 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3825 = -_3164;
    float _3827 = _3825 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3829 = -_3166;
    float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3833 = _3823 * _3823;
    float _3835 = fma(_3827, _3827, _3833);
    float _3837 = fma(_3831, _3831, _3835);
    float _3839 = sqrt(_3837);
    float _3841 = rsqrt(_3837);
    float _3843 = -_3839;
    float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3847 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3849 = precise::clamp(_3847, 0.0, 1.0);
    float _3851 = _3827 * _3841;
    float _3853 = _3823 * _3841;
    float _3855 = abs(_3849);
    float _3857 = log2(_3855);
    float _3859 = _3831 * _3841;
    float _3861 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3863 = _2828 * _3853;
    float _3865 = -_3853;
    float _3867 = -_3861;
    float _3869 = fma(_3865, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3867);
    float _3871 = fma(_2826, _3851, _3863);
    float _3873 = -_3859;
    float _3875 = fma(_3873, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3869);
    float _3877 = fma(_2830, _3859, _3871);
    float _3879 = precise::clamp(_3877, 0.0, 1.0);
    float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3883 = _3875 + _3881;
    float _3885 = _3857 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3887 = _3883 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3889 = precise::clamp(_3887, 0.0, 1.0);
    float _3891 = exp2(_3885);
    float _3893 = _3891 * _3889;
    float _3895 = _3879 * _3893;
    float _3897 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3899 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3901 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3897;
    out.m_86.y = _3899;
    out.m_86.z = _3901;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

