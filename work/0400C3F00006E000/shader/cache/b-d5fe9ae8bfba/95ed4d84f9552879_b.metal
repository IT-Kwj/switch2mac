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
    float4 m_70 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_68 [[user(locn9)]];
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3559 = false;
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
        float _3844 = as_type<float>(_123);
        out.gl_Position.z = _3844;
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
        float _3918 = as_type<float>(_163);
        out.gl_Position.z = _3918;
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
    if (!_217)
    {
        _223 = 0.0;
    }
    float _275 = _223;
    int _277 = int(_245);
    int _279 = _249 ? 2 : 0;
    int _281 = _277 | _279;
    int _283 = _217 ? 4 : 0;
    int _285 = _281 | _283;
    int _287 = _219 ? 8 : 0;
    int _289 = _285 | _287;
    int _291 = _241 ? 16 : 0;
    int _293 = _289 | _291;
    int _295 = _273 ? 32 : 0;
    int _297 = _293 | _295;
    int _299 = false ? 64 : 0;
    int _301 = _297 | _299;
    int _303 = _301 & 32;
    float _305 = 0.0;
    float _307 = as_type<float>(_303);
    float _309 = _275;
    if (_241)
    {
        float _311 = rsqrt(_211);
        _305 = _311;
    }
    float _313 = _305;
    if (!_217)
    {
        _307 = 0.0;
    }
    float _315 = _307;
    float _317 = _315;
    if (_217)
    {
        float _319 = _235 * _171;
        _253 = _319;
    }
    float _321 = _253;
    if (_217)
    {
        float _323 = _235 * _165;
        _309 = _323;
    }
    float _325 = _309;
    if (_217)
    {
        float _327 = _235 * _177;
        _317 = _327;
    }
    float _329 = _317;
    float _331 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _333 = 0.0;
    float _335 = 0.0;
    float _337 = _331;
    if (!_241)
    {
        _333 = 0.0;
        _335 = 0.0;
    }
    float _339 = _333;
    float _341 = _335;
    float _343 = 0.0;
    float _345 = _339;
    float _347 = _341;
    if (!_241)
    {
        _343 = 0.0;
    }
    float _349 = _343;
    float _351 = _349;
    if (!_273)
    {
        float _353 = _331 * _331;
        float _355 = _353 * 0.5;
        _225 = _355;
    }
    float _357 = _225;
    float _359 = 0.0;
    float _361 = _357;
    if (!_219)
    {
        _359 = 0.0;
    }
    float _363 = _359;
    float _365 = _363;
    if (_219)
    {
        float _367 = _257 * _173;
        _365 = _367;
    }
    float _369 = _365;
    float _371 = 0.0;
    if (!_219)
    {
        _371 = 0.0;
    }
    float _373 = _371;
    float _375 = _373;
    if (_219)
    {
        float _377 = _257 * _167;
        _375 = _377;
    }
    float _379 = _375;
    float _381 = 0.0;
    if (!_219)
    {
        _381 = 0.0;
    }
    float _383 = _381;
    float _385 = _383;
    if (_219)
    {
        float _387 = _257 * _179;
        _385 = _387;
    }
    float _389 = _385;
    if (_241)
    {
        float _391 = _313 * _175;
        _351 = _391;
    }
    float _393 = _351;
    if (_241)
    {
        float _395 = _313 * _169;
        _345 = _395;
    }
    float _397 = _345;
    if (_241)
    {
        float _399 = _313 * _181;
        _347 = _399;
    }
    float _401 = _347;
    bool _403 = !_245;
    float _405 = _403 ? (-0.5) : 0.5;
    if (!_273)
    {
        float _407 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _361 = _407;
    }
    float _409 = _361;
    bool _411 = !_249;
    float _413 = _411 ? (-0.5) : 0.5;
    bool _415 = !_273;
    float _417 = _409;
    float _419 = _263;
    float _421 = _261;
    float _423 = _259;
    float _425 = _263;
    if (!_415)
    {
        float _427 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _429 = log2(_427);
        float _431 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _433 = _431 + 1.0;
        float _435 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _437 = _331 * _429;
        float _439 = 1.0 / _433;
        float _441 = _435 * 0.693147182464599609375;
        float _443 = exp2(_437);
        float _445 = 1.0 / _441;
        float _447 = _443 + (-1.0);
        float _449 = -_447;
        float _451 = fma(_449, _445, _331);
        float _453 = _451 * _439;
        float _455 = _453 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _417 = _455;
    }
    float _457 = _417;
    float _459 = _457 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _461 = !_273;
    float _463 = _457;
    if (!_461)
    {
        float _465 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _467 = log2(_465);
        float _469 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _471 = _469 + 1.0;
        float _473 = 1.0 / _471;
        float _475 = _331 * _467;
        float _477 = exp2(_475);
        float _479 = -_477;
        float _481 = _479 + 1.0;
        float _483 = _481 * _473;
        _337 = _483;
    }
    float _485 = _337;
    float _487 = _459 * _325;
    float _489 = _459 * _379;
    float _491 = _457 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _493 = _459 * _397;
    float _495 = 0.0;
    float _497 = _485;
    if (!_273)
    {
        float _499 = _143 * _143;
        float _501 = _499 * 0.5;
        _495 = _501;
    }
    float _503 = _495;
    float _505 = fma(_491, _321, _487);
    float _507 = fma(_491, _369, _489);
    float _509 = fma(_491, _393, _493);
    float _511 = _457 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_273)
    {
        float _513 = _503 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _463 = _513;
    }
    float _515 = _463;
    bool _517 = !_273;
    float _519 = _515;
    if (!_517)
    {
        float _521 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _523 = log2(_521);
        float _525 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _527 = _525 + 1.0;
        float _529 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _531 = _143 * _523;
        float _533 = 1.0 / _527;
        float _535 = _529 * 0.693147182464599609375;
        float _537 = exp2(_531);
        float _539 = 1.0 / _535;
        float _541 = _537 + (-1.0);
        float _543 = -_541;
        float _545 = fma(_543, _539, _143);
        float _547 = _545 * _533;
        float _549 = _547 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _519 = _549;
    }
    float _551 = _519;
    float _553 = _551 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _555 = fma(_511, _329, _505);
    float _557 = _551 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _559 = fma(_511, _389, _507);
    float _561 = _553 * _325;
    float _563 = _553 * _379;
    float _565 = _553 * _397;
    float _567 = fma(_511, _401, _509);
    float _569 = fma(_557, _321, _561);
    float _571 = fma(_557, _369, _563);
    float _573 = fma(_557, _393, _565);
    float _575 = _551 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _577 = fma(_485, _259, _555);
    float _579 = fma(_485, _261, _559);
    float _581 = fma(_485, _263, _567);
    float _583 = fma(_575, _329, _569);
    float _585 = fma(_575, _389, _571);
    float _587 = fma(_575, _401, _573);
    if (!_273)
    {
        _497 = _143;
    }
    float _589 = _497;
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
    float _617 = fma(_615, _261, _585);
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _621 = fma(_615, _259, _583);
    float _623 = fma(_579, _185, _189);
    float _625 = -_617;
    float _627 = _579 + _625;
    float _629 = fma(_577, _185, _187);
    float _631 = -_621;
    float _633 = _577 + _631;
    float _635 = fma(_615, _263, _587);
    float _637 = _627 * _173;
    float _639 = _627 * _167;
    float _641 = _627 * _179;
    float _643 = -_635;
    float _645 = _581 + _643;
    float _647 = fma(_633, _171, _637);
    float _649 = fma(_633, _165, _639);
    float _651 = fma(_633, _177, _641);
    float _653 = fma(_581, _185, _191);
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
    float _701 = _129 * 2.0;
    float _703 = _623 * _179;
    float _705 = in.m_51.z;
    float _707 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _709 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _711 = int(_709);
    float _713 = fma(_629, _177, _703);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _717 = _693 + _715;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _727 = float(_697);
    float _729 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _731 = int(_729);
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _737 = _693 + _735;
    float _739 = float(_107);
    float _741 = float(_711);
    float _743 = 1.0 / _727;
    float _745 = _699 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _747 = _129 + _699;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _755 = _753 != 0;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _759 = _757 != 0;
    float _761 = fma(_745, -2.0, _733);
    float _763 = float(uint(_731));
    float _765 = 1.0 / _741;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _769 = _767 != 0;
    float _771 = _747 + (-1.0);
    bool _773 = !_751;
    int _775 = _773 ? 0 : 1;
    bool _777 = !_769;
    int _779 = _777 ? 0 : 1;
    bool _781 = !_755;
    int _783 = _781 ? 0 : 1;
    float _785 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _787 = int(_785);
    float _789 = _143 * _743;
    float _791 = _699 * 2.0;
    bool _793 = !_759;
    int _795 = _793 ? 0 : 1;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _799 = _797 != 0;
    float _801 = _143 * _765;
    float _803 = 1.0 / _763;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _807 = _805 != 0;
    bool _809 = !_799;
    int _811 = _809 ? 0 : 1;
    bool _813 = !_807;
    int _815 = _813 ? 0 : 1;
    float _817 = float(uint(_787));
    float _819 = trunc(_801);
    int _821 = int(_819);
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _825 = _823 != 0;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _829 = _827 != 0;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _833 = _831 != 0;
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _837 = _835 != 0;
    bool _839 = _129 > 0.5;
    int _841 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _843 = _841 != 0;
    float _845 = -_405;
    int _847 = _839 ? as_type<int>(_845) : as_type<int>(_405);
    float _849 = 1.0 / _817;
    int _851 = as_type<int>(_803) + (-2);
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _855 = _853 != 0;
    bool _857 = !_829;
    int _859 = _857 ? 0 : 1;
    int _861 = ~_787;
    int _863 = _861 + 1;
    float _865 = trunc(_789);
    int _867 = int(_865);
    float _869 = float(uint(_821));
    bool _871 = !_825;
    int _873 = _871 ? 0 : 1;
    bool _875 = !_833;
    int _877 = _875 ? 0 : 1;
    int _879 = abs(_811);
    float _881 = floor(_701);
    int _883 = as_type<int>(_849) + (-2);
    float _885 = 0.0;
    if (_855)
    {
        _885 = 1.0;
    }
    float _887 = _885;
    float _889 = 0.0;
    float _891 = _887;
    if (_855)
    {
        _889 = _129;
    }
    float _893 = _889;
    float _895 = as_type<float>(_883) * _869;
    float _897 = _893;
    if (!_855)
    {
        _891 = 1.2345600128173828125;
    }
    float _899 = _891;
    float _901 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _903 = log2(_901);
    float _905 = float(uint(_867));
    if (!_855)
    {
        _897 = _699;
    }
    float _907 = _897;
    int _909 = abs(_783);
    float _911 = as_type<float>(_851) * _905;
    int _913 = abs(_795);
    float _915 = floor(_791);
    bool _917 = _881 > 0.0;
    float _919 = _899 * _907;
    int _921 = abs(_877);
    float _923 = trunc(_895);
    float _925 = precise::max(_923, 0.0);
    uint _928 = uint(_925);
    bool _930 = !_843;
    float _932 = _930 ? _405 : as_type<float>(_847);
    float _934 = _705 * 2.0;
    bool _936 = _881 >= 0.0;
    bool _938 = isnan(_881);
    bool _940 = _936 || _938;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    float _946 = _143 * _903;
    int _948 = ~_731;
    int _950 = _948 + 1;
    float _952 = _932 + 0.5;
    float _954 = trunc(_911);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    bool _960 = _915 > 0.0;
    float _962 = floor(_934);
    int _964 = _944 ? 0 : 1;
    bool _966 = _915 >= 0.0;
    bool _968 = isnan(_915);
    bool _970 = _966 || _968;
    bool _972 = isnan(0.0);
    bool _974 = _970 || _972;
    int _976 = ~_964;
    int _978 = _976 + 1;
    int _980 = _978 + 1;
    int _982 = _980;
    float _984 = _946;
    if (!_917)
    {
        int _986 = ~_964;
        int _988 = _986 + 1;
        _982 = _988;
    }
    int _990 = _982;
    int _992 = _950 * int(_958);
    int _994 = _992 + _867;
    float _996 = exp2(_946);
    bool _998 = _699 > 0.5;
    float _1000 = float(uint(_994));
    int _1002 = _863 * int(_928);
    int _1004 = _1002 + _821;
    float _1006 = -_413;
    int _1008 = _998 ? as_type<int>(_1006) : as_type<int>(_413);
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1012 = _1010 != 0;
    float _1014 = as_type<float>(_851) * _1000;
    float _1016 = float(uint(_1004));
    float _1018 = 1.0 / _721;
    int _1020 = _1004;
    if (_855)
    {
        _984 = 1.0;
    }
    float _1022 = _984;
    float _1024 = as_type<float>(_883) * _1016;
    float _1026 = _1022;
    if (_855)
    {
        _1020 = 0;
    }
    int _1028 = _1020;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1032 = 1.0 + _1030;
    int _1034 = _974 ? 0 : 1;
    float _1036 = trunc(_1014);
    float _1038 = precise::max(_1036, 0.0);
    uint _1040 = uint(_1038);
    int _1042 = _1028;
    if (!_855)
    {
        _1026 = 7.345489978790283203125;
    }
    float _1044 = _1026;
    float _1046 = -_996;
    float _1048 = _1046 + 1.0;
    if (!_855)
    {
        _1042 = 1;
    }
    int _1050 = _1042;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1054 = _1052 != 0;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1058 = _1056 != 0;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1062 = _1060 != 0;
    float _1064 = _1044 * _129;
    bool _1066 = !_1012;
    float _1068 = _1066 ? _413 : as_type<float>(_1008);
    float _1070 = trunc(_1024);
    float _1072 = precise::max(_1070, 0.0);
    uint _1074 = uint(_1072);
    bool _1076 = _962 > 0.0;
    float _1078 = _717 * _1018;
    int _1080 = ~_1034;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    int _1086 = _1084;
    if (!_960)
    {
        int _1088 = ~_1034;
        int _1090 = _1088 + 1;
        _1086 = _1090;
    }
    int _1092 = _1086;
    bool _1094 = _962 >= 0.0;
    bool _1096 = isnan(_962);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(0.0);
    bool _1102 = _1098 || _1100;
    float _1104 = 1.0 / _1032;
    int _1106 = int(_958) + int(_1040);
    int _1108 = _1102 ? 0 : 1;
    bool _1110 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1118 = _1114 || _1116;
    int _1120 = ~_1108;
    int _1122 = _1120 + 1;
    int _1124 = _1122 + 1;
    float _1126 = 1.0 / _725;
    int _1128 = _1124;
    if (!_1076)
    {
        int _1130 = ~_1108;
        int _1132 = _1130 + 1;
        _1128 = _1132;
    }
    int _1134 = _1128;
    float _1136 = in.m_51.w;
    float _1138 = _1118 ? _1048 : 0.0;
    int _1140 = ~_731;
    int _1142 = _1140 + 1;
    int _1144 = ~_787;
    int _1146 = _1144 + 1;
    float _1148 = _1138 * _1104;
    int _1150 = int(_928) + int(_1074);
    int _1152 = _1142 * _1106;
    int _1154 = _1152 + _867;
    bool _1156 = _1050 != 1;
    float _1158 = _623 * _167;
    int _1160 = _1146 * _1150;
    int _1162 = _1160 + _821;
    bool _1164 = uint(_1154) >= uint(_731);
    float _1166 = fma(_629, _165, _1158);
    bool _1168 = !_1062;
    int _1170 = _1168 ? 0 : 1;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1172;
    bool _1176 = uint(_1162) >= uint(_787);
    float _1178 = _737 * _1126;
    bool _1180 = !_1164;
    int _1182 = _1180 ? 0 : (-1);
    float _1184 = 1.0 / _739;
    bool _1186 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1188 = isnan(1.0);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1194 = _1190 || _1192;
    float _1196 = 0.0;
    if (!_1156)
    {
        _1196 = _699;
    }
    float _1198 = _1196;
    float _1200 = 0.0;
    float _1202 = _1198;
    if (!_1156)
    {
        _1200 = _699;
    }
    float _1204 = _1200;
    float _1206 = 0.0;
    float _1208 = _1204;
    if (!_1156)
    {
        _1206 = _705;
    }
    float _1210 = _1206;
    float _1212 = 1.0 / _1174;
    float _1214 = 0.0;
    float _1216 = _1210;
    if (!_1156)
    {
        _1214 = _705;
    }
    float _1218 = _1214;
    bool _1220 = !_1054;
    int _1222 = _1220 ? 0 : 1;
    float _1224 = _1218;
    if (_1156)
    {
        _1202 = _129;
    }
    float _1226 = _1202;
    if (_1156)
    {
        _1208 = _129;
    }
    float _1228 = _1208;
    float _1230 = _143 * _1184;
    if (_1156)
    {
        _1216 = _699;
    }
    float _1232 = _1216;
    if (_1156)
    {
        _1224 = _699;
    }
    float _1234 = _1224;
    bool _1236 = !_1176;
    int _1238 = _1236 ? 0 : (-1);
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1242 = _1240 != 0;
    int _1244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1246 = _1244 != 0;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1250 = _1248 != 0;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1254 = _1252 != 0;
    float _1256 = _623 * _173;
    bool _1258 = !_1194;
    float _1260 = _1258 ? _143 : _1148;
    bool _1262 = _1136 > 0.5;
    float _1264 = fma(_629, _171, _1256);
    float _1266 = in.m_57.w;
    float _1268 = fma(_653, _175, _1264);
    float _1270 = in.m_55.w;
    float _1272 = fma(_653, _169, _1166);
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1276 = in.m_59.w;
    float _1278 = _129 + _705;
    float _1280 = -_1274;
    float _1282 = fma(_707, 2.0, _1280);
    float _1284 = fma(_653, _181, _713);
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1288 = _693 + _1286;
    float _1290 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1292 = _1278 + (-1.0);
    float _1294 = _1288 * _1212;
    float _1296 = _705 + _699;
    float _1298 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1300 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1302 = isnan(_693);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = -_143;
    float _1314 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1282);
    float _1316 = _1296 + (-1.0);
    float _1318 = _1268 + _1266;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1320;
    float _1324 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1326;
    bool _1330 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1332 = isnan(_693);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = _1272 + _1270;
    float _1344 = fma(_1322, _1078, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1350 = _1284 + _1276;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1356 = fma(_1328, _1078, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1358 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1360 = isnan(_693);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    float _1370 = -_1340;
    float _1372 = _1370 + 1.0;
    float _1374 = fma(_1354, _1178, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1376 = fma(_1348, _1178, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1378 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1380 = isnan(_693);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = _1368 * _1372;
    float _1392 = -_1368;
    float _1394 = _1392 + 1.0;
    float _1396 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1314);
    float _1398 = _1388 * _1394;
    float _1400 = -_1388;
    float _1402 = _1400 + 1.0;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1404;
    float _1408 = floor(_1064);
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1410;
    float _1414 = _1310 * _1402;
    float _1416 = fma(_1406, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1418 = -_1310;
    float _1420 = _1418 + 1.0;
    float _1422 = fma(_1412, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1424 = _1344 * _1414;
    float _1426 = _1356 * _1414;
    float _1428 = floor(_919);
    float _1430 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _761);
    float _1432 = _1068 + (-0.5);
    float _1434 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1424);
    float _1436 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1426);
    bool _1438 = !_1058;
    int _1440 = _1438 ? 0 : 1;
    float _1442 = -_1432;
    float _1444 = -_1430;
    float _1446 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1444);
    float _1448 = fma(_1374, _1398, _1434);
    float _1450 = -_1408;
    float _1452 = _1064 + _1450;
    float _1454 = fma(_1376, _1398, _1436);
    float _1456 = float(_787);
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1460 = fma(_1416, _1390, _1448);
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1464 = float(_867);
    float _1466 = -_1428;
    float _1468 = _919 + _1466;
    float _1470 = float(_821);
    float _1472 = _1230 * _1456;
    float _1474 = float(_731);
    float _1476 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1460);
    bool _1478 = _1470 >= _1456;
    bool _1480 = isnan(_1470);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan(_1456);
    bool _1486 = _1482 || _1484;
    float _1488 = float(_1486);
    float _1490 = _1468 * _1456;
    float _1492 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1458);
    float _1494 = fma(_1422, _1390, _1454);
    int _1496 = abs(_1222);
    float _1498 = in.m_66.x;
    float _1500 = in.m_66.y;
    float _1502 = in.m_66.z;
    bool _1504 = _1464 >= _1474;
    bool _1506 = isnan(_1464);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan(_1474);
    bool _1512 = _1508 || _1510;
    float _1514 = float(_1512);
    float _1516 = _1452 * _1474;
    float _1518 = _1230 * _1474;
    float _1520 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1462);
    float _1522 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1524 = abs(_1440);
    float _1526 = trunc(_1516);
    int _1528 = int(_1526);
    int _1530 = abs(_1170);
    float _1532 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1534 = float(_1496);
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1538 = float(_1134);
    float _1540 = float(_990);
    float _1542 = trunc(_1514);
    int _1544 = int(_1542);
    float _1546 = float(_1524);
    float _1548 = -_1536;
    float _1550 = fma(_1532, 2.0, _1548);
    float _1552 = float(_1530);
    float _1554 = _1534 * _1538;
    float _1556 = float(_1092);
    float _1558 = _1546 * _1540;
    float _1560 = _1554 * (-2.0);
    float _1562 = _1552 * _1556;
    float _1564 = _1558 * (-2.0);
    float _1566 = fma(_1290, _1560, _1290);
    float _1568 = fma(_1560, _1498, _1498);
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1572 = fma(_1324, _1564, _1324);
    float _1574 = fma(_1564, _1500, _1500);
    int _1576 = ~_1106;
    int _1578 = _1576 + _1182;
    int _1580 = _1578 + 1;
    float _1582 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1570);
    float _1584 = _129 + (-0.5);
    float _1586 = trunc(_1488);
    int _1588 = int(_1586);
    int _1590 = _1528 * _879;
    int _1592 = _1590 + _867;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1596 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1568);
    int _1598 = _731 * _1580;
    int _1600 = _1598 + _867;
    int _1602 = ~_1150;
    int _1604 = _1602 + _1238;
    int _1606 = _1604 + 1;
    float _1608 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1594);
    float _1610 = fma(_1260, _1566, _1596);
    bool _1612 = !_837;
    int _1614 = _1612 ? 0 : 1;
    float _1616 = _699 + (-0.5);
    bool _1618 = _705 > 0.5;
    float _1620 = trunc(_1518);
    int _1622 = int(_1620);
    float _1624 = float(uint(_1592));
    float _1626 = _1562 * (-2.0);
    float _1628 = -_405;
    int _1630 = _1618 ? as_type<int>(_1628) : as_type<int>(_405);
    float _1632 = _1610 * 0.15915493667125701904296875;
    bool _1634 = _731 == 0;
    float _1636 = fma(_1626, _1502, _1502);
    int _1638 = abs(_815);
    int _1640 = _787 * _1606;
    int _1642 = _1640 + _821;
    int _1644 = ~_1544;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    float _1650 = trunc(_1490);
    int _1652 = int(_1650);
    bool _1654 = !_1634;
    int _1656 = _1654 ? _1600 : (-1);
    float _1658 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1574);
    bool _1660 = !_1250;
    float _1662 = _1660 ? _405 : as_type<float>(_1630);
    float _1664 = as_type<float>(_851) * _1624;
    bool _1666 = _787 == 0;
    int _1668 = _1656 * _1648;
    int _1670 = _731 + (-1);
    float _1672 = trunc(_1472);
    int _1674 = int(_1672);
    int _1676 = ~_1588;
    int _1678 = _1676 + 1;
    int _1680 = _1678 + 1;
    float _1682 = fma(_1260, _1572, _1658);
    bool _1684 = !_1666;
    int _1686 = _1684 ? _1642 : (-1);
    int _1688 = _1544 * _1670;
    int _1690 = _1688 + _1668;
    float _1692 = _705 + (-0.5);
    int _1694 = abs(_775);
    int _1696 = _1686 * _1680;
    int _1698 = _787 + (-1);
    int _1700 = _1690 * _909;
    int _1702 = _1652 * _1638;
    int _1704 = _1702 + _821;
    int _1706 = abs(_859);
    int _1708 = _1588 * _1698;
    int _1710 = _1708 + _1696;
    int _1712 = abs(_779);
    int _1714 = _1622 * _1694;
    int _1716 = _1714 + _1700;
    float _1718 = trunc(_1664);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = abs(_873);
    int _1726 = _1592 * _913;
    int _1728 = _1726 + _1716;
    float _1730 = fma(_1298, _1626, _1298);
    float _1732 = float(uint(_1704));
    int _1734 = _1528 * _1712;
    int _1736 = _1734 + _1728;
    float _1738 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1494);
    float _1740 = as_type<float>(_883) * _1732;
    float _1742 = _1632 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = float(uint(_1736));
    int _1748 = _1710 * _1706;
    float _1750 = as_type<float>(_851) * _1746;
    int _1752 = _1674 * _1724;
    int _1754 = _1752 + _1748;
    float _1756 = trunc(_1740);
    float _1758 = precise::max(_1756, 0.0);
    uint _1760 = uint(_1758);
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1764 = abs(_1614);
    float _1766 = in.m_64.x;
    float _1768 = in.m_64.y;
    int _1770 = _1704 * _921;
    int _1772 = _1770 + _1754;
    float _1774 = fma(_1522, -2.0, _1762);
    float _1776 = trunc(_1750);
    float _1778 = precise::max(_1776, 0.0);
    uint _1780 = uint(_1778);
    float _1782 = _1682 * 0.15915493667125701904296875;
    float _1784 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1636);
    int _1786 = _1652 * _1764;
    int _1788 = _1786 + _1772;
    float _1790 = -_143;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1550);
    float _1794 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1774);
    float _1796 = fma(_1260, _1730, _1784);
    int _1798 = ~_731;
    int _1800 = _1798 + 1;
    float _1802 = _1632 * 6.283185482025146484375;
    float _1804 = cos(_1802);
    float _1806 = _1796 * 0.15915493667125701904296875;
    float _1808 = -_413;
    int _1810 = _1262 ? as_type<int>(_1808) : as_type<int>(_413);
    int _1812 = _1800 * int(_1722);
    int _1814 = _1812 + _1592;
    float _1816 = _1662 + 0.5;
    bool _1818 = !_1254;
    float _1820 = _1818 ? _413 : as_type<float>(_1810);
    float _1822 = _1782 * 6.283185482025146484375;
    float _1824 = sin(_1822);
    int _1826 = ~_731;
    int _1828 = _1826 + 1;
    float _1830 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1792);
    float _1832 = float(uint(_1814));
    float _1834 = _1820 + (-0.5);
    float _1836 = _1476 * _1766;
    int _1838 = _1828 * int(_1780);
    int _1840 = _1838 + _1736;
    float _1842 = float(uint(_1788));
    float _1844 = as_type<float>(_851) * _1832;
    float _1846 = -_1834;
    float _1848 = -_1794;
    float _1850 = fma(_1846, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1848);
    int _1852 = ~_787;
    int _1854 = _1852 + 1;
    float _1856 = _1782 * 6.283185482025146484375;
    float _1858 = cos(_1856);
    float _1860 = float(uint(_1840));
    float _1862 = as_type<float>(_883) * _1842;
    float _1864 = _1738 * _1768;
    float _1866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _405);
    float _1868 = as_type<float>(_851) * _1860;
    float _1870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _413);
    float _1872 = _1806 * 6.283185482025146484375;
    float _1874 = cos(_1872);
    int _1876 = _1854 * int(_1760);
    int _1878 = _1876 + _1704;
    float _1880 = _1836 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1882 = _1864 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1884 = float(uint(_1878));
    float _1886 = _1880 * _1866;
    float _1888 = trunc(_1862);
    float _1890 = precise::max(_1888, 0.0);
    uint _1892 = uint(_1890);
    float _1894 = _1882 * _1870;
    float _1896 = _1744 * _1824;
    float _1898 = _1744 * _1858;
    float _1900 = as_type<float>(_883) * _1884;
    float _1902 = _1804 * _1858;
    float _1904 = _1806 * 6.283185482025146484375;
    float _1906 = sin(_1904);
    float _1908 = _1744 * _1874;
    float _1910 = _1804 * _1824;
    float _1912 = _1858 * _1874;
    float _1914 = _1804 * _1874;
    float _1916 = _1824 * _1874;
    float _1918 = trunc(_1868);
    float _1920 = precise::max(_1918, 0.0);
    uint _1922 = uint(_1920);
    float _1924 = _1914 * _1894;
    float _1926 = trunc(_1844);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    float _1932 = -_1910;
    float _1934 = fma(_1906, _1898, _1932);
    float _1936 = -_1898;
    float _1938 = fma(_1906, _1910, _1936);
    float _1940 = fma(_1906, _1902, _1896);
    float _1942 = trunc(_1900);
    float _1944 = precise::max(_1942, 0.0);
    uint _1946 = uint(_1944);
    int _1948 = ~_787;
    int _1950 = _1948 + 1;
    int _1952 = int(_1780) + int(_1922);
    float _1954 = fma(_1906, _1896, _1902);
    int _1956 = ~_787;
    int _1958 = _1956 + 1;
    int _1960 = _1950 * int(_1892);
    int _1962 = _1960 + _1788;
    int _1964 = int(_1722) + int(_1930);
    int _1966 = ~_731;
    int _1968 = _1966 + 1;
    float _1970 = float(uint(_1962));
    float _1972 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1974 = _1968 * _1952;
    int _1976 = _1974 + _1736;
    float _1978 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1980 = as_type<float>(_883) * _1970;
    float _1982 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1984 = -_1906;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1972);
    bool _1988 = uint(_1976) >= uint(_731);
    float _1990 = -_1906;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1978);
    float _1994 = -_1906;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1982);
    float _1998 = trunc(_1980);
    float _2000 = precise::max(_1998, 0.0);
    uint _2002 = uint(_2000);
    float _2004 = -_1894;
    float _2006 = _1906 * _2004;
    bool _2008 = !_1988;
    int _2010 = _2008 ? 0 : (-1);
    float _2012 = _1908 * _1894;
    float _2014 = fma(_1940, _1886, _1924);
    float _2016 = fma(_1912, _1886, _2006);
    int _2018 = ~_1952;
    int _2020 = _2018 + _2010;
    int _2022 = _2020 + 1;
    float _2024 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2026 = fma(_1934, _1886, _2012);
    float _2028 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2030 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2032 = _731 * _2022;
    int _2034 = _2032 + _1736;
    float _2036 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2024);
    float _2038 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1996);
    float _2040 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1986);
    float _2042 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1992);
    int _2044 = int(_1892) + int(_2002);
    float _2046 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2028);
    bool _2048 = !_1634;
    int _2050 = _2048 ? _2034 : (-1);
    float _2052 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2030);
    float _2054 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2056 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2058 = _2050 & 3;
    bool _2060 = _2058 != 0;
    float _2062 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2064 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2066 = ~_731;
    int _2068 = _2066 + 1;
    float _2070 = fma(_1916, _2054, _2016);
    bool _2072 = uint(_2058) > 1u;
    float _2074 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2056);
    int _2076 = int(_1760) + int(_1946);
    float _2078 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2062);
    bool _2080 = !_2060;
    int _2082 = _2080 ? 0 : 1;
    float _2084 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2064);
    int _2086 = _2050 & 3;
    bool _2088 = _2086 != 0;
    float _2090 = fma(_1938, _2054, _2014);
    int _2092 = _1958 * _2044;
    int _2094 = _2092 + _1788;
    int _2096 = _2088 ? 0 : 1;
    float _2098 = fma(_1954, _2054, _2026);
    int _2100 = ~_787;
    int _2102 = _2100 + 1;
    int _2104 = _2068 * _1964;
    int _2106 = _2104 + _1592;
    bool _2108 = uint(_2094) >= uint(_787);
    float _2110 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2074);
    int _2112 = ~_2096;
    int _2114 = _2112 + 1;
    int _2116 = _2114 + 1;
    float _2118 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2078);
    int _2120 = _2116;
    if (!_2072)
    {
        int _2122 = ~_2096;
        int _2124 = _2122 + 1;
        _2120 = _2124;
    }
    int _2126 = _2120;
    float _2128 = _2090 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2130 = uint(_2106) >= uint(_731);
    float _2132 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2084);
    bool _2134 = !_2108;
    int _2136 = _2134 ? 0 : (-1);
    float _2138 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2128);
    float _2140 = _2090 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2142 = ~_2044;
    int _2144 = _2142 + _2136;
    int _2146 = _2144 + 1;
    float _2148 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2138);
    bool _2150 = uint(_2058) >= 2u;
    float _2152 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2140);
    float _2154 = _2090 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2156 = _787 * _2146;
    int _2158 = _2156 + _1788;
    float _2160 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2162 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2152);
    float _2164 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2154);
    int _2166 = _2050 >> 31;
    float _2168 = _1350 + _2160;
    bool _2170 = !_1666;
    int _2172 = _2170 ? _2158 : (-1);
    float _2174 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2176 = _2166 & 3;
    float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2180 = _2168 + _2178;
    int _2182 = _2172 >> 31;
    float _2184 = _1318 + _2174;
    int _2186 = _2050 + _2176;
    float _2188 = _2180 * _2180;
    int _2190 = _2182 & 3;
    float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2194 = _2184 + _2192;
    int _2196 = _2186 >> 2;
    int _2198 = _2102 * _2076;
    int _2200 = _2198 + _1704;
    int _2202 = _2172 + _2190;
    float _2204 = fma(_2194, _2194, _2188);
    int _2206 = _2196 << 4;
    int _2208 = _2206 + 368;
    float _2210 = _413 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2212 = _2202 >> 2;
    float _2214 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2164);
    int _2216 = _2208 + 8;
    uint _2218 = uint(int(uint(_2216) >> uint(2)));
    uint _2220 = uint(int(uint(int(_2218)) >> uint(2)));
    int _2222 = int(_2218) & 3;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[int(_2220)][_2222];
    int _2226 = int(_2218) + 1;
    uint _2228 = uint(int(uint(_2226) >> uint(2)));
    int _2230 = _2226 & 3;
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[int(_2228)][_2230];
    int _2234 = _2150 ? 0 : 1;
    float _2236 = _405 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2238 = _2212 << 4;
    int _2240 = _2238 + 512;
    float _2242 = _2210 * _2038;
    bool _2244 = uint(_2200) >= uint(_787);
    float _2246 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2046);
    float _2248 = sqrt(_2204);
    uint _2250 = uint(int(uint(_2208) >> uint(2)));
    uint _2252 = uint(int(uint(int(_2250)) >> uint(2)));
    int _2254 = int(_2250) & 3;
    float _2256 = (*spvDescriptorSet0.vp_c9)._m0[int(_2252)][_2254];
    int _2258 = int(_2250) + 1;
    uint _2260 = uint(int(uint(_2258) >> uint(2)));
    int _2262 = _2258 & 3;
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[int(_2260)][_2262];
    bool _2266 = !_2130;
    int _2268 = _2266 ? 0 : (-1);
    float _2270 = _2210 * _2042;
    bool _2272 = _2058 != 3;
    int _2274 = ~_2234;
    int _2276 = _2274 + 1;
    int _2278 = _2276 + 1;
    int _2280 = ~_1964;
    int _2282 = _2280 + _2268;
    int _2284 = _2282 + 1;
    uint _2286 = uint(int(uint(_2240) >> uint(2)));
    uint _2288 = uint(int(uint(int(_2286)) >> uint(2)));
    int _2290 = int(_2286) & 3;
    float _2292 = (*spvDescriptorSet0.vp_c9)._m0[int(_2288)][_2290];
    int _2294 = int(_2286) + 1;
    uint _2296 = uint(int(uint(_2294) >> uint(2)));
    int _2298 = _2294 & 3;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[int(_2296)][_2298];
    float _2302 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2036);
    bool _2304 = !_2244;
    int _2306 = _2304 ? 0 : (-1);
    float _2308 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2052);
    int _2310 = _2172 & 3;
    bool _2312 = _2310 != 0;
    float _2314 = fma(_2236, _2302, _2242);
    int _2316 = ~_2076;
    int _2318 = _2316 + _2306;
    int _2320 = _2318 + 1;
    int _2322 = _731 * _2284;
    int _2324 = _2322 + _1592;
    int _2326 = _2240 + 8;
    uint _2328 = uint(int(uint(_2326) >> uint(2)));
    uint _2330 = uint(int(uint(int(_2328)) >> uint(2)));
    int _2332 = int(_2328) & 3;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[int(_2330)][_2332];
    int _2336 = int(_2328) + 1;
    uint _2338 = uint(int(uint(_2336) >> uint(2)));
    int _2340 = _2336 & 3;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[int(_2338)][_2340];
    int _2344 = _2278;
    float _2346 = _2168;
    float _2348 = _2184;
    float _2350 = _2246;
    float _2352 = _2302;
    float _2354 = _2246;
    if (_2272)
    {
        int _2356 = ~_2234;
        int _2358 = _2356 + 1;
        _2344 = _2358;
    }
    int _2360 = _2344;
    float _2362 = _2210 * _2040;
    bool _2364 = _2248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2366 = _787 * _2320;
    int _2368 = _2366 + _1704;
    int _2370 = _2172 & 3;
    bool _2372 = _2370 != 0;
    float _2374 = fma(_2236, _2246, _2362);
    float _2376 = _2214 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2378 = _2312 ? 0 : 1;
    float _2380 = fma(_2236, _2308, _2270);
    bool _2382 = uint(_2370) >= 2u;
    float _2384 = _1342 + _2376;
    bool _2386 = !_2372;
    int _2388 = _2386 ? 0 : 1;
    int _2390 = _2382 ? 0 : 1;
    bool _2392 = uint(_2370) > 1u;
    int _2394 = ~_2378;
    int _2396 = _2394 + 1;
    int _2398 = _2396 + 1;
    int _2400 = ~_2390;
    int _2402 = _2400 + 1;
    int _2404 = _2402 + 1;
    bool _2406 = _2370 != 3;
    bool _2408 = !_2364;
    float _2410 = _2384;
    int _2412 = _2398;
    int _2414 = _2404;
    if (!_2408)
    {
        float _2416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2420 = _2248 + _2418;
        float _2422 = rsqrt(_2204);
        float _2424 = _2420 * _2416;
        float _2426 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2428 = _2424 * 0.15915493667125701904296875;
        float _2430 = _2428 * 6.283185482025146484375;
        float _2432 = cos(_2430);
        float _2434 = _2428 * 6.283185482025146484375;
        float _2436 = sin(_2434);
        float _2438 = _2432 + (-1.0);
        float _2440 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2442 = fma(_2436, _2426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2444 = fma(_2384, _2432, _2440);
        float _2446 = _2422 * _2442;
        float _2448 = fma(_2194, _2446, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2450 = fma(_2180, _2446, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2346 = _2450;
        _2410 = _2444;
        _2348 = _2448;
    }
    float _2452 = _2346;
    float _2454 = _2410;
    float _2456 = _2348;
    float _2458 = _2456;
    float _2460 = _2454;
    float _2462 = _2452;
    if (!_2392)
    {
        int _2464 = ~_2378;
        int _2466 = _2464 + 1;
        _2412 = _2466;
    }
    int _2468 = _2412;
    float _2470 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1582);
    int _2472 = abs(_2126);
    float _2474 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1608);
    int _2476 = abs(_2082);
    float _2478 = -_2470;
    float _2480 = _2478 + 1.0;
    int _2482 = abs(_2468);
    float _2484 = -_2474;
    float _2486 = _2484 + 1.0;
    int _2488 = abs(_2388);
    float _2490 = -_2480;
    float _2492 = fma(_932, _2490, _1396);
    float _2494 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1492);
    int _2496 = ~_2472;
    int _2498 = _2496 + 1;
    int _2500 = _2498 + 1;
    float _2502 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1520);
    int _2504 = ~_2482;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    float _2510 = fma(_1068, _2486, _1446);
    int _2512 = abs(_2360);
    int _2514 = _2500 * as_type<int>(_2264);
    int _2516 = ~_2476;
    int _2518 = _2516 + 1;
    int _2520 = _2518 + 1;
    int _2522 = _2508 * as_type<int>(_2300);
    bool _2524 = _2058 != 3;
    out.m_68.x = _2302;
    out.m_68.y = _2246;
    out.m_68.z = _2308;
    int _2526 = ~_2488;
    int _2528 = _2526 + 1;
    int _2530 = _2528 + 1;
    int _2532 = _2520 * as_type<int>(_2256);
    int _2534 = _2532 + _2514;
    float _2536 = _2510;
    if (_2406)
    {
        int _2538 = ~_2390;
        int _2540 = _2538 + 1;
        _2414 = _2540;
    }
    int _2542 = _2414;
    int _2544 = ~_2512;
    int _2546 = _2544 + 1;
    int _2548 = _2546 + 1;
    int _2550 = _2530 * as_type<int>(_2292);
    int _2552 = _2550 + _2522;
    bool _2554 = !_2524;
    int _2556 = _2554 ? 0 : (-1);
    bool _2558 = _2370 != 3;
    int _2560 = _2548 * as_type<int>(_2224);
    int _2562 = _2560 + _2534;
    int _2564 = abs(_2542);
    bool _2566 = !_1242;
    int _2568 = _2566 ? 0 : 1;
    int _2570 = abs(_2556);
    bool _2572 = !_2558;
    int _2574 = _2572 ? 0 : (-1);
    int _2576 = abs(_2568);
    int _2578 = abs(_2574);
    int _2580 = ~_2564;
    int _2582 = _2580 + 1;
    int _2584 = _2582 + 1;
    bool _2586 = !_1246;
    int _2588 = _2586 ? 0 : 1;
    int _2590 = ~_2570;
    int _2592 = _2590 + 1;
    int _2594 = _2592 + 1;
    int _2596 = _2584 * as_type<int>(_2334);
    int _2598 = _2596 + _2552;
    float _2600 = fma(_2210, _2210, 1.0);
    int _2602 = abs(_2588);
    int _2604 = _2594 * as_type<int>(_2232);
    int _2606 = _2604 + _2562;
    int _2608 = ~_2576;
    int _2610 = _2608 + 1;
    int _2612 = _2610 + 1;
    int _2614 = ~_2578;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    int _2620 = _2606 * _2612;
    bool _2622 = !_1634;
    int _2624 = _2622 ? _2324 : (-1);
    int _2626 = _2618 * as_type<int>(_2342);
    int _2628 = _2626 + _2598;
    float _2630 = rsqrt(_2600);
    int _2632 = ~_2602;
    int _2634 = _2632 + 1;
    int _2636 = _2634 + 1;
    float _2638 = -_1350;
    float _2640 = _2638 + _2452;
    bool _2642 = !_1666;
    int _2644 = _2642 ? _2368 : (-1);
    float _2646 = -_2502;
    float _2648 = _2646 + 1.0;
    int _2650 = _2628 * _2636;
    int _2652 = _2624 * _2576;
    int _2654 = _2652 + _2620;
    float _2656 = -_1342;
    float _2658 = _2656 + _2454;
    float _2660 = -_1318;
    float _2662 = _2660 + _2456;
    int _2664 = _2644 * _2602;
    int _2666 = _2664 + _2650;
    float _2668 = -_2494;
    float _2670 = _2668 + 1.0;
    float _2672 = _2658 * _2658;
    float _2674 = fma(_1820, _2648, _1850);
    float _2676 = float(_2654);
    float _2678 = _2210 * _2630;
    float _2680 = fma(_2662, _2662, _2672);
    float _2682 = -_2670;
    float _2684 = fma(_1662, _2682, _1830);
    float _2686 = float(_2666);
    float _2688 = -_2110;
    float _2690 = _2678 * _2688;
    float _2692 = fma(_2640, _2640, _2680);
    float _2694 = -_2118;
    float _2696 = _2678 * _2694;
    float _2698 = -_2132;
    float _2700 = _2678 * _2698;
    float _2702 = fma(_2630, _2038, _2690);
    float _2704 = sqrt(_2692);
    float _2706 = fma(_2630, _2040, _2696);
    float _2708 = fma(_2630, _2042, _2700);
    float _2710 = _2110 + _2314;
    float _2712 = _2118 + _2374;
    float _2714 = _2132 + _2380;
    out.m_70.x = _2492;
    out.m_70.y = _2510;
    out.m_70.z = _2684;
    out.m_70.w = _2674;
    out.m_72.x = _2702;
    out.m_72.y = _2706;
    out.m_72.z = _2708;
    out.m_74.x = _2676;
    out.m_74.y = _2686;
    bool _2716 = _2704 > 0.0;
    out.m_76.x = _2710;
    out.m_76.y = _2712;
    out.m_76.z = _2714;
    bool _2718 = !_2716;
    if (!_2718)
    {
        bool _2720 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2722 = _2674;
        if (_2720)
        {
            float _2724 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2722 = _2724;
        }
        float _2726 = _2722;
        if (_2720)
        {
            float _2728 = _655 * _2726;
            _2536 = _2728;
        }
        float _2730 = _2536;
        float _2732 = _2730;
        if (_2720)
        {
            float _2734 = _657 * _2726;
            _2350 = _2734;
        }
        float _2736 = _2350;
        float _2738 = _2736;
        if (_2720)
        {
            float _2740 = _659 * _2726;
            _2352 = _2740;
        }
        float _2742 = _2352;
        float _2744 = _2742;
        if (!_2720)
        {
            bool _2746 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2748 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2750 = _2746 || _2748;
            bool _2752 = isnan(1.0);
            bool _2754 = _2750 || _2752;
            float _2756 = _143 + 1.0;
            float _2758 = _2756;
            if (!_2754)
            {
                float _2760 = _2756 * _2756;
                float _2762 = _2760 * 0.5;
                _145 = _2762;
            }
            float _2764 = _145;
            float _2766 = _2764;
            if (!_2754)
            {
                float _2768 = _2764 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2766 = _2768;
            }
            float _2770 = _2766;
            bool _2772 = !_2754;
            float _2774 = _2770;
            if (!_2772)
            {
                float _2776 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2778 = log2(_2776);
                float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2782 = 1.0 + _2780;
                float _2784 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2786 = _2778 * _2756;
                float _2788 = 1.0 / _2782;
                float _2790 = _2784 * 0.693147182464599609375;
                float _2792 = exp2(_2786);
                float _2794 = 1.0 / _2790;
                float _2796 = _2792 + (-1.0);
                float _2798 = -_2796;
                float _2800 = fma(_2798, _2794, _2756);
                float _2802 = _2800 * _2788;
                float _2804 = _2802 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2774 = _2804;
            }
            float _2806 = _2774;
            float _2808 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2810 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2812 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2814 = _2806;
            if (!_2754)
            {
                _2814 = _2756;
            }
            float _2816 = _2814;
            float _2818 = _2808 * _379;
            float _2820 = _2808 * _325;
            float _2822 = _2808 * _397;
            float _2824 = fma(_2810, _369, _2818);
            float _2826 = fma(_2810, _321, _2820);
            float _2828 = fma(_2812, _389, _2824);
            bool _2830 = !_2754;
            float _2832 = _2816;
            if (!_2830)
            {
                float _2834 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2836 = log2(_2834);
                float _2838 = _2836 * _2756;
                float _2840 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2842 = 1.0 + _2840;
                float _2844 = exp2(_2838);
                float _2846 = 1.0 / _2842;
                float _2848 = -_2844;
                float _2850 = _2848 + 1.0;
                float _2852 = _2850 * _2846;
                _2832 = _2852;
                _2758 = _2842;
            }
            float _2854 = _2832;
            float _2856 = _2758;
            float _2858 = fma(_2810, _393, _2822);
            float _2860 = fma(_2812, _329, _2826);
            float _2862 = fma(_2854, _261, _2828);
            float _2864 = fma(_2812, _401, _2858);
            float _2866 = fma(_2854, _259, _2860);
            float _2868 = -_617;
            float _2870 = _2868 + _2862;
            float _2872 = fma(_2854, _263, _2864);
            float _2874 = -_621;
            float _2876 = _2874 + _2866;
            float _2878 = _2870 * _173;
            float _2880 = _2870 * _167;
            float _2882 = _2870 * _179;
            float _2884 = -_635;
            float _2886 = _2884 + _2872;
            float _2888 = fma(_2876, _171, _2878);
            float _2890 = fma(_2876, _165, _2880);
            float _2892 = fma(_2876, _177, _2882);
            float _2894 = fma(_2886, _175, _2888);
            float _2896 = fma(_2886, _169, _2890);
            float _2898 = fma(_2886, _181, _2892);
            _663 = _2896;
            _665 = _2894;
            _667 = _2898;
            _2732 = _2894;
            _2738 = _2896;
            _2744 = _2898;
            _419 = _2872;
            _227 = _2856;
        }
        float _2900 = _663;
        float _2902 = _665;
        float _2904 = _667;
        float _2906 = _2732;
        float _2908 = _2738;
        float _2910 = _2744;
        float _2912 = _419;
        float _2914 = _227;
        float _2916 = _2900 * _2900;
        float _2918 = rsqrt(_2692);
        float _2920 = fma(_2902, _2902, _2916);
        float _2922 = fma(_2904, _2904, _2920);
        float _2924 = sqrt(_2922);
        float _2926 = _2662 * _2918;
        float _2928 = _2658 * _2918;
        float _2930 = _2640 * _2918;
        bool _2932 = _2924 > 0.0;
        bool _2934 = !_2932;
        _421 = _2920;
        _423 = _2924;
        _425 = _2912;
        _229 = _2914;
        _2354 = _2908;
        if (!_2934)
        {
            float _2936 = rsqrt(_2922);
            float _2938 = _2936 * _2900;
            float _2940 = _2936 * _2902;
            float _2942 = _2936 * _2904;
            float _2944 = _2928 * _2938;
            float _2946 = fma(_2926, _2940, _2944);
            float _2948 = fma(_2930, _2942, _2946);
            float _2950 = _2948 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2952 = fma(_2906, _2950, _2456);
            float _2954 = fma(_2908, _2950, _2454);
            float _2956 = fma(_2910, _2950, _2452);
            _2458 = _2952;
            _2460 = _2954;
            _2462 = _2956;
            _421 = _2942;
            _423 = _2950;
            _425 = _2938;
        }
    }
    float _2958 = _2458;
    float _2960 = _2460;
    float _2962 = _2462;
    float _2964 = _421;
    float _2966 = _423;
    float _2968 = _425;
    float _2970 = _229;
    float _2972 = _2354;
    bool _2974 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2976 = isnan(0.5);
    bool _2978 = _2974 || _2976;
    bool _2980 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2982 = _2978 || _2980;
    float _2984 = _2966;
    float _2986 = _2964;
    float _2988 = _2968;
    float _2990 = _2972;
    if (_2982)
    {
        _2984 = _2958;
    }
    float _2992 = _2984;
    float _2994 = _2992;
    if (_2982)
    {
        _2986 = _2960;
    }
    float _2996 = _2986;
    float _2998 = _2996;
    if (_2982)
    {
        _2988 = _2962;
    }
    float _3000 = _2988;
    float _3002 = _3000;
    if (!_2982)
    {
        float _3004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3006 = _1342 + _3004;
        float _3008 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3010 = _1318 + _3008;
        float _3012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3014 = -_1342;
        float _3016 = _3014 + _2960;
        float _3018 = _3006 * _3006;
        float _3020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3022 = _1350 + _3020;
        float _3024 = -_1350;
        float _3026 = _3024 + _2962;
        float _3028 = fma(_3010, _3010, _3018);
        float _3030 = fma(_3022, _3022, _3028);
        float _3032 = -_1318;
        float _3034 = _3032 + _2958;
        float _3036 = sqrt(_3030);
        float _3038 = precise::min(_3036, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3040 = _3038 * _3012;
        float _3042 = fma(_3034, _3040, _1318);
        float _3044 = fma(_3016, _3040, _1342);
        float _3046 = fma(_3026, _3040, _1350);
        _2998 = _3044;
        _2994 = _3042;
        _3002 = _3046;
    }
    float _3048 = _2998;
    float _3050 = _2994;
    float _3052 = _3002;
    float _3054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3056 = _3048 + _3054;
    float _3058 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3060 = _3050 + _3058;
    float _3062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3064 = _3052 + _3062;
    float _3066 = _3056 * _3056;
    float _3068 = fma(_3060, _3060, _3066);
    float _3070 = fma(_3064, _3064, _3068);
    float _3072 = rsqrt(_3070);
    float _3074 = _3072 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3076 = _3060 * _3074;
    float _3078 = _3064 * _3074;
    float _3080 = _3076 * _3076;
    float _3082 = _3078 * _3078;
    float _3084 = _3080 + _3082;
    float _3086 = sqrt(_3084);
    bool _3088 = _3086 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3090 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3092 = _3086 + _3090;
    float _3094 = _3072;
    float _3096 = _3092;
    float _3098 = _3056;
    float _3100 = _3074;
    if (_3088)
    {
        float _3102 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3094 = _3102;
    }
    float _3104 = _3094;
    float _3106 = _3104;
    if (_3088)
    {
        float _3108 = _3092 * _3104;
        _3096 = _3108;
    }
    float _3110 = _3096;
    if (_3088)
    {
        float _3112 = rsqrt(_3084);
        _3106 = _3112;
    }
    float _3114 = _3106;
    float _3116 = _3114;
    if (_3088)
    {
        float _3118 = _3110 * 0.15915493667125701904296875;
        _231 = _3118;
    }
    float _3120 = _231;
    float _3122 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3124 = _3064;
    float _3126 = _3120;
    if (_3088)
    {
        float _3128 = _3120 * 6.283185482025146484375;
        float _3130 = sin(_3128);
        _3124 = _3130;
    }
    float _3132 = _3124;
    float _3134 = precise::max(0.0, _3122);
    float _3136 = _2970;
    if (_3088)
    {
        float _3138 = _3120 * 6.283185482025146484375;
        float _3140 = cos(_3138);
        _3136 = _3140;
    }
    float _3142 = _3136;
    float _3144 = -_3074;
    float _3146 = -_3134;
    float _3148 = fma(_3056, _3144, _3146);
    if (_3088)
    {
        float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3098 = _3150;
    }
    float _3152 = _3098;
    float _3154 = sqrt(_3070);
    float _3156 = _3132;
    float _3158 = _3152;
    if (_3088)
    {
        float _3160 = fma(_3132, _3152, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3156 = _3160;
    }
    float _3162 = _3156;
    float _3164 = _3162;
    if (!_3088)
    {
        _3126 = _3080;
    }
    float _3166 = _3126;
    float _3168 = _3166;
    if (_3088)
    {
        float _3170 = _3114 * _3162;
        _2990 = _3170;
    }
    float _3172 = _2990;
    if (!_3088)
    {
        _3116 = _3076;
    }
    float _3174 = _3116;
    float _3176 = _3174;
    float _3178 = _3142;
    if (_3088)
    {
        float _3180 = _3142 + (-1.0);
        _3158 = _3180;
    }
    float _3182 = _3158;
    float _3184 = _3182;
    if (_3088)
    {
        float _3186 = _3076 * _3172;
        _3176 = _3186;
    }
    float _3188 = _3176;
    if (!_3088)
    {
        _3164 = _3148;
    }
    float _3190 = _3164;
    float _3192 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3194 = _3190;
    if (_3088)
    {
        float _3196 = _3182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3100 = _3196;
    }
    float _3198 = _3100;
    if (!_3088)
    {
        _3184 = _3078;
    }
    float _3200 = _3184;
    float _3202 = _3200;
    if (_3088)
    {
        float _3204 = _3078 * _3172;
        _3202 = _3204;
    }
    float _3206 = _3202;
    if (_3088)
    {
        float _3208 = _3188 * _3188;
        _3168 = _3208;
    }
    float _3210 = _3168;
    if (_3088)
    {
        float _3212 = fma(_3148, _3142, _3198);
        _3194 = _3212;
    }
    float _3214 = _3194;
    if (!_3088)
    {
        _3178 = _3082;
    }
    float _3216 = _3178;
    float _3218 = _3216;
    if (_3088)
    {
        float _3220 = _3206 * _3206;
        _3218 = _3220;
    }
    float _3222 = _3218;
    float _3224 = fma(_3214, _3214, _3210);
    float _3226 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3228 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3230 = _3224 + _3222;
    float _3232 = fma(_3050, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3192);
    float _3234 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3236 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3238 = fma(_3154, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3236);
    float _3240 = precise::clamp(_3238, 0.0, 1.0);
    float _3242 = rsqrt(_3230);
    float _3244 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3232);
    float _3246 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3248 = fma(_3050, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3234);
    float _3250 = -_3240;
    float _3252 = _3250 + 1.0;
    float _3254 = _3244 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3256 = fma(_3050, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3246);
    float _3258 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3248);
    float _3260 = abs(_3252);
    float _3262 = log2(_3260);
    float _3264 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3266 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3256);
    float _3268 = _3258 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3270 = fma(_3050, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3228);
    float _3272 = -_3264;
    float _3274 = fma(_3272, _3226, 1.0);
    float _3276 = _3266 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3278 = _3268 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3280 = _3242 * _3188;
    float _3282 = _3242 * _3214;
    float _3284 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3270);
    float _3286 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3278);
    float _3288 = _3280 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3290 = _3242 * _3206;
    float _3292 = _3284 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3294 = fma(_3254, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3286);
    float _3296 = -_3288;
    float _3298 = fma(_3282, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3296);
    float _3300 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3302 = log2(_3274);
    float _3304 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3294);
    float _3306 = -_3290;
    float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3298);
    float _3310 = _3268 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3312 = fma(_3308, -0.5, 0.5);
    float _3314 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3310);
    float _3316 = exp2(_3300);
    float _3318 = _3268 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3320 = fma(_3308, 0.5, 0.5);
    float _3322 = fma(_3254, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3314);
    float _3324 = _3282 + 1.0;
    float _3326 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3318);
    float _3328 = fma(_3320, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3330 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3322);
    float _3332 = 1.0 / _3304;
    float _3334 = fma(_3254, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3326);
    float _3336 = fma(_3320, _3328, -0.212114393711090087890625);
    float _3338 = _3302 * 0.693147182464599609375;
    float _3340 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3334);
    float _3342 = fma(_3320, _3336, 1.570728778839111328125);
    float _3344 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3346 = sqrt(_3312);
    float _3348 = -_3282;
    float _3350 = fma(_3316, _3324, _3348);
    float _3352 = fma(_3350, 0.5, 0.5);
    float _3354 = _3330 * _3332;
    float _3356 = _3340 * _3332;
    float _3358 = fma(_3354, 0.5, 0.5);
    float _3360 = fma(_3356, -0.5, 0.5);
    float _3362 = _3346 * 0.636619746685028076171875;
    float3 _8641 = float3(_3358, _3360, _3344);
    float _3364 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8641, float3(0.0), isnan(_8641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8641, float3(0.0), isnan(_8641)), level(0.0)).x;
    float3 _8652 = float3(_3358, _3360, _3344);
    float4 _3367 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8652, float3(0.0), isnan(_8652)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8652, float3(0.0), isnan(_8652)), level(0.0)).xyzw;
    float _3369 = _3367.x;
    float _3371 = _3367.y;
    float _3373 = _3367.z;
    float _3375 = _3367.w;
    float _3377 = -_3342;
    float _3379 = fma(_3362, _3377, 1.0);
    float2 _8674 = float2(_3379, _3352);
    float3 _3383 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8674, float2(0.0), isnan(_8674)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8674, float2(0.0), isnan(_8674)), level(0.0)).xyz;
    float _3385 = _3383.x;
    float _3387 = _3383.y;
    float _3389 = _3383.z;
    float _3391 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3393 = _3268 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3395 = _3304 * 0.5;
    out.m_78.x = _3050;
    out.m_78.y = _3048;
    out.m_78.z = _3052;
    bool _3397 = _3154 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3399 = isnan(_3154);
    bool _3401 = _3397 || _3399;
    bool _3403 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3405 = _3401 || _3403;
    float _3407 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3393);
    float _3409 = exp2(_3391);
    float _3411 = _3330 + _3304;
    float _3413 = fma(_3254, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3407);
    float _3415 = fma(_3340, -0.5, _3395);
    float _3417 = _3411 * 0.5;
    float _3419 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3413);
    float _3421 = _3419 + _3304;
    out.gl_Position.x = _3330;
    out.gl_Position.y = _3340;
    out.gl_Position.z = _3419;
    out.gl_Position.w = _3304;
    float _3423 = _3421 * 0.5;
    float _3425 = -_3409;
    float _3427 = _3425 + 1.0;
    float _3429 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _3417;
    out.m_80.y = _3415;
    out.m_80.z = _3423;
    out.m_80.w = _3304;
    float _3431 = -_3429;
    float _3433 = _3431 + 1.0;
    float _3435 = _3304;
    float _3437 = _3419;
    float _3439 = _3340;
    float _3441 = _3330;
    float _3443 = _3415;
    float _3445 = _3417;
    if (!_3405)
    {
        _3435 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3447 = _3435;
    float _3449 = _3447;
    float _3451 = _3447;
    if (!_3405)
    {
        _3437 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3453 = _3437;
    float _3455 = _3453;
    float _3457 = _3453;
    if (!_3405)
    {
        _3439 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3459 = _3439;
    float _3461 = _3459;
    float _3463 = _3459;
    if (!_3405)
    {
        _3441 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3465 = _3441;
    float _3467 = _3465;
    float _3469 = _3465;
    if (!_3405)
    {
        _3443 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3471 = _3443;
    float _3473 = _3471;
    float _3475 = _3471;
    if (!_3405)
    {
        _3445 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3477 = _3445;
    float _3479 = _3429 * _3364;
    float _3481 = _3375 * _3479;
    float _3483 = _3389 * _3479;
    float _3485 = fma(_3385, _3481, _3369);
    float _3487 = fma(_3387, _3481, _3371);
    float _3489 = _3375 * _3433;
    float _3491 = fma(_3375, _3483, _3373);
    out.m_82.x = _3485;
    out.m_82.y = _3487;
    out.m_82.z = _3491;
    out.m_82.w = _3489;
    bool _3493 = !_3405;
    float _3495 = _3477;
    float _3497 = _3477;
    if (!_3493)
    {
        bool _3499 = _3154 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3501 = isnan(_3154);
        bool _3503 = _3499 || _3501;
        bool _3505 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3507 = _3503 || _3505;
        if (!_3507)
        {
            float _3509 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3511 = _3154 + _3509;
            float _3513 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3515 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3513;
            float _3517 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3519 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3521 = 1.0 / _3515;
            float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3525 = _3523 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3529 = _3527 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3531 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3533 = _3531 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3535 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3537 = _3535 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3539 = _3511 * _3521;
            float _3541 = precise::clamp(_3539, 0.0, 1.0);
            float _3543 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3545 = _3543 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3547 = fma(_3541, _3519, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3549 = fma(_3541, _3545, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3551 = fma(_3541, _3525, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3553 = fma(_3541, _3529, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3555 = fma(_3541, _3533, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3557 = fma(_3541, _3537, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3497 = _3551;
            _3463 = _3555;
            _3475 = _3547;
            _3457 = _3553;
            _3451 = _3549;
            _3469 = _3557;
            _3559 = true;
        }
        else
        {
            bool _3561 = _3154 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3563 = isnan(_3154);
            bool _3565 = _3561 || _3563;
            bool _3567 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3569 = _3565 || _3567;
            if (!_3569)
            {
                _3473 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3571 = _3473;
            _3475 = _3571;
            if (!_3569)
            {
                _3495 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3573 = _3495;
            _3497 = _3573;
            if (!_3569)
            {
                _3449 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3575 = _3449;
            _3451 = _3575;
            if (!_3569)
            {
                _3455 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3577 = _3455;
            _3457 = _3577;
            if (!_3569)
            {
                _3461 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3579 = _3461;
            _3463 = _3579;
            if (!_3569)
            {
                _3467 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3581 = _3467;
            bool _3583 = !_3569;
            _3469 = _3581;
            if (!_3583)
            {
                bool _3585 = _3154 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3587 = isnan(_3154);
                bool _3589 = _3585 || _3587;
                bool _3591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3593 = _3589 || _3591;
                if (!_3593)
                {
                    float _3595 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3597 = _3154 + _3595;
                    float _3599 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3601 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3599;
                    float _3603 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3605 = _3603 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3607 = 1.0 / _3601;
                    float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3611 = _3609 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3613 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3615 = _3613 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3619 = _3617 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3621 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3623 = _3621 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3625 = _3597 * _3607;
                    float _3627 = precise::clamp(_3625, 0.0, 1.0);
                    float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3631 = _3629 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3633 = fma(_3627, _3605, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3635 = fma(_3627, _3631, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3637 = fma(_3627, _3611, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3639 = fma(_3627, _3615, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3641 = fma(_3627, _3619, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3643 = fma(_3627, _3623, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3497 = _3637;
                    _3463 = _3641;
                    _3475 = _3633;
                    _3457 = _3639;
                    _3451 = _3635;
                    _3469 = _3643;
                    _3559 = true;
                }
                else
                {
                    _3497 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3463 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3475 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3457 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3451 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3469 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3559 = false;
    float _3645 = _3497;
    float _3647 = _3463;
    float _3649 = _3475;
    float _3651 = _3457;
    float _3653 = _3451;
    float _3655 = _3469;
    float _3657 = fma(_2712, -0.5, 0.5);
    float _3659 = precise::clamp(_3657, 0.0, 1.0);
    float _3661 = -_3645;
    float _3663 = _3661 + _3647;
    float _3665 = -_3649;
    float _3667 = _3665 + _3651;
    float _3669 = -_3653;
    float _3671 = _3669 + _3655;
    bool _3673 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3675 = fma(_3659, _3663, _3645);
    float _3677 = fma(_3659, _3667, _3649);
    float _3679 = fma(_3659, _3671, _3653);
    float _3681 = _3675 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3683 = fma(_3677, 0.298911988735198974609375, _3681);
    float _3685 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3687 = fma(_3679, 0.114477999508380889892578125, _3683);
    out.m_84.w = _3685;
    float _3689 = -_3687;
    float _3691 = _3677 + _3689;
    float _3693 = -_3687;
    float _3695 = _3675 + _3693;
    float _3697 = -_3687;
    float _3699 = _3679 + _3697;
    out.m_86.x = 0.0;
    float _3701 = fma(_3691, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3687);
    float _3703 = fma(_3695, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3687);
    float _3705 = fma(_3699, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3687);
    out.m_88.x = _3701;
    out.m_88.y = _3703;
    out.m_88.z = _3705;
    if (!_3673)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3707 = -_3048;
    float _3709 = _3707 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3711 = -_3050;
    float _3713 = _3711 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3715 = -_3052;
    float _3717 = _3715 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3719 = _3709 * _3709;
    float _3721 = fma(_3713, _3713, _3719);
    float _3723 = fma(_3717, _3717, _3721);
    float _3725 = sqrt(_3723);
    float _3727 = rsqrt(_3723);
    float _3729 = -_3725;
    float _3731 = _3729 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3733 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3735 = precise::clamp(_3733, 0.0, 1.0);
    float _3737 = _3713 * _3727;
    float _3739 = _3709 * _3727;
    float _3741 = abs(_3735);
    float _3743 = log2(_3741);
    float _3745 = _3717 * _3727;
    float _3747 = _3737 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3749 = _2712 * _3739;
    float _3751 = -_3739;
    float _3753 = -_3747;
    float _3755 = fma(_3751, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3753);
    float _3757 = fma(_2710, _3737, _3749);
    float _3759 = -_3745;
    float _3761 = fma(_3759, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3755);
    float _3763 = fma(_2714, _3745, _3757);
    float _3765 = precise::clamp(_3763, 0.0, 1.0);
    float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3769 = _3761 + _3767;
    float _3771 = _3743 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3773 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3775 = precise::clamp(_3773, 0.0, 1.0);
    float _3777 = exp2(_3771);
    float _3779 = _3777 * _3775;
    float _3781 = _3765 * _3779;
    float _3783 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3785 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3787 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3783;
    out.m_86.y = _3785;
    out.m_86.z = _3787;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3559 = false;
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
        float _3844 = as_type<float>(_123);
        out.gl_Position.z = _3844;
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
        float _3918 = as_type<float>(_163);
        out.gl_Position.z = _3918;
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
    if (!_217)
    {
        _223 = 0.0;
    }
    float _275 = _223;
    int _277 = int(_245);
    int _279 = _249 ? 2 : 0;
    int _281 = _277 | _279;
    int _283 = _217 ? 4 : 0;
    int _285 = _281 | _283;
    int _287 = _219 ? 8 : 0;
    int _289 = _285 | _287;
    int _291 = _241 ? 16 : 0;
    int _293 = _289 | _291;
    int _295 = _273 ? 32 : 0;
    int _297 = _293 | _295;
    int _299 = false ? 64 : 0;
    int _301 = _297 | _299;
    int _303 = _301 & 32;
    float _305 = 0.0;
    float _307 = as_type<float>(_303);
    float _309 = _275;
    if (_241)
    {
        float _311 = rsqrt(_211);
        _305 = _311;
    }
    float _313 = _305;
    if (!_217)
    {
        _307 = 0.0;
    }
    float _315 = _307;
    float _317 = _315;
    if (_217)
    {
        float _319 = _235 * _171;
        _253 = _319;
    }
    float _321 = _253;
    if (_217)
    {
        float _323 = _235 * _165;
        _309 = _323;
    }
    float _325 = _309;
    if (_217)
    {
        float _327 = _235 * _177;
        _317 = _327;
    }
    float _329 = _317;
    float _331 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _333 = 0.0;
    float _335 = 0.0;
    float _337 = _331;
    if (!_241)
    {
        _333 = 0.0;
        _335 = 0.0;
    }
    float _339 = _333;
    float _341 = _335;
    float _343 = 0.0;
    float _345 = _339;
    float _347 = _341;
    if (!_241)
    {
        _343 = 0.0;
    }
    float _349 = _343;
    float _351 = _349;
    if (!_273)
    {
        float _353 = _331 * _331;
        float _355 = _353 * 0.5;
        _225 = _355;
    }
    float _357 = _225;
    float _359 = 0.0;
    float _361 = _357;
    if (!_219)
    {
        _359 = 0.0;
    }
    float _363 = _359;
    float _365 = _363;
    if (_219)
    {
        float _367 = _257 * _173;
        _365 = _367;
    }
    float _369 = _365;
    float _371 = 0.0;
    if (!_219)
    {
        _371 = 0.0;
    }
    float _373 = _371;
    float _375 = _373;
    if (_219)
    {
        float _377 = _257 * _167;
        _375 = _377;
    }
    float _379 = _375;
    float _381 = 0.0;
    if (!_219)
    {
        _381 = 0.0;
    }
    float _383 = _381;
    float _385 = _383;
    if (_219)
    {
        float _387 = _257 * _179;
        _385 = _387;
    }
    float _389 = _385;
    if (_241)
    {
        float _391 = _313 * _175;
        _351 = _391;
    }
    float _393 = _351;
    if (_241)
    {
        float _395 = _313 * _169;
        _345 = _395;
    }
    float _397 = _345;
    if (_241)
    {
        float _399 = _313 * _181;
        _347 = _399;
    }
    float _401 = _347;
    bool _403 = !_245;
    float _405 = _403 ? (-0.5) : 0.5;
    if (!_273)
    {
        float _407 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _361 = _407;
    }
    float _409 = _361;
    bool _411 = !_249;
    float _413 = _411 ? (-0.5) : 0.5;
    bool _415 = !_273;
    float _417 = _409;
    float _419 = _263;
    float _421 = _261;
    float _423 = _259;
    float _425 = _263;
    if (!_415)
    {
        float _427 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _429 = log2(_427);
        float _431 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _433 = _431 + 1.0;
        float _435 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _437 = _331 * _429;
        float _439 = 1.0 / _433;
        float _441 = _435 * 0.693147182464599609375;
        float _443 = exp2(_437);
        float _445 = 1.0 / _441;
        float _447 = _443 + (-1.0);
        float _449 = -_447;
        float _451 = fma(_449, _445, _331);
        float _453 = _451 * _439;
        float _455 = _453 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _417 = _455;
    }
    float _457 = _417;
    float _459 = _457 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _461 = !_273;
    float _463 = _457;
    if (!_461)
    {
        float _465 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _467 = log2(_465);
        float _469 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _471 = _469 + 1.0;
        float _473 = 1.0 / _471;
        float _475 = _331 * _467;
        float _477 = exp2(_475);
        float _479 = -_477;
        float _481 = _479 + 1.0;
        float _483 = _481 * _473;
        _337 = _483;
    }
    float _485 = _337;
    float _487 = _459 * _325;
    float _489 = _459 * _379;
    float _491 = _457 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _493 = _459 * _397;
    float _495 = 0.0;
    float _497 = _485;
    if (!_273)
    {
        float _499 = _143 * _143;
        float _501 = _499 * 0.5;
        _495 = _501;
    }
    float _503 = _495;
    float _505 = fma(_491, _321, _487);
    float _507 = fma(_491, _369, _489);
    float _509 = fma(_491, _393, _493);
    float _511 = _457 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_273)
    {
        float _513 = _503 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _463 = _513;
    }
    float _515 = _463;
    bool _517 = !_273;
    float _519 = _515;
    if (!_517)
    {
        float _521 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _523 = log2(_521);
        float _525 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _527 = _525 + 1.0;
        float _529 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _531 = _143 * _523;
        float _533 = 1.0 / _527;
        float _535 = _529 * 0.693147182464599609375;
        float _537 = exp2(_531);
        float _539 = 1.0 / _535;
        float _541 = _537 + (-1.0);
        float _543 = -_541;
        float _545 = fma(_543, _539, _143);
        float _547 = _545 * _533;
        float _549 = _547 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _519 = _549;
    }
    float _551 = _519;
    float _553 = _551 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _555 = fma(_511, _329, _505);
    float _557 = _551 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _559 = fma(_511, _389, _507);
    float _561 = _553 * _325;
    float _563 = _553 * _379;
    float _565 = _553 * _397;
    float _567 = fma(_511, _401, _509);
    float _569 = fma(_557, _321, _561);
    float _571 = fma(_557, _369, _563);
    float _573 = fma(_557, _393, _565);
    float _575 = _551 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _577 = fma(_485, _259, _555);
    float _579 = fma(_485, _261, _559);
    float _581 = fma(_485, _263, _567);
    float _583 = fma(_575, _329, _569);
    float _585 = fma(_575, _389, _571);
    float _587 = fma(_575, _401, _573);
    if (!_273)
    {
        _497 = _143;
    }
    float _589 = _497;
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
    float _617 = fma(_615, _261, _585);
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _621 = fma(_615, _259, _583);
    float _623 = fma(_579, _185, _189);
    float _625 = -_617;
    float _627 = _579 + _625;
    float _629 = fma(_577, _185, _187);
    float _631 = -_621;
    float _633 = _577 + _631;
    float _635 = fma(_615, _263, _587);
    float _637 = _627 * _173;
    float _639 = _627 * _167;
    float _641 = _627 * _179;
    float _643 = -_635;
    float _645 = _581 + _643;
    float _647 = fma(_633, _171, _637);
    float _649 = fma(_633, _165, _639);
    float _651 = fma(_633, _177, _641);
    float _653 = fma(_581, _185, _191);
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
    float _701 = _129 * 2.0;
    float _703 = _623 * _179;
    float _705 = in.m_51.z;
    float _707 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _709 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _711 = int(_709);
    float _713 = fma(_629, _177, _703);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _717 = _693 + _715;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _727 = float(_697);
    float _729 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _731 = int(_729);
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _737 = _693 + _735;
    float _739 = float(_107);
    float _741 = float(_711);
    float _743 = 1.0 / _727;
    float _745 = _699 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _747 = _129 + _699;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _755 = _753 != 0;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _759 = _757 != 0;
    float _761 = fma(_745, -2.0, _733);
    float _763 = float(uint(_731));
    float _765 = 1.0 / _741;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _769 = _767 != 0;
    float _771 = _747 + (-1.0);
    bool _773 = !_751;
    int _775 = _773 ? 0 : 1;
    bool _777 = !_769;
    int _779 = _777 ? 0 : 1;
    bool _781 = !_755;
    int _783 = _781 ? 0 : 1;
    float _785 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _787 = int(_785);
    float _789 = _143 * _743;
    float _791 = _699 * 2.0;
    bool _793 = !_759;
    int _795 = _793 ? 0 : 1;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _799 = _797 != 0;
    float _801 = _143 * _765;
    float _803 = 1.0 / _763;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _807 = _805 != 0;
    bool _809 = !_799;
    int _811 = _809 ? 0 : 1;
    bool _813 = !_807;
    int _815 = _813 ? 0 : 1;
    float _817 = float(uint(_787));
    float _819 = trunc(_801);
    int _821 = int(_819);
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _825 = _823 != 0;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _829 = _827 != 0;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _833 = _831 != 0;
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _837 = _835 != 0;
    bool _839 = _129 > 0.5;
    int _841 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _843 = _841 != 0;
    float _845 = -_405;
    int _847 = _839 ? as_type<int>(_845) : as_type<int>(_405);
    float _849 = 1.0 / _817;
    int _851 = as_type<int>(_803) + (-2);
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _855 = _853 != 0;
    bool _857 = !_829;
    int _859 = _857 ? 0 : 1;
    int _861 = ~_787;
    int _863 = _861 + 1;
    float _865 = trunc(_789);
    int _867 = int(_865);
    float _869 = float(uint(_821));
    bool _871 = !_825;
    int _873 = _871 ? 0 : 1;
    bool _875 = !_833;
    int _877 = _875 ? 0 : 1;
    int _879 = abs(_811);
    float _881 = floor(_701);
    int _883 = as_type<int>(_849) + (-2);
    float _885 = 0.0;
    if (_855)
    {
        _885 = 1.0;
    }
    float _887 = _885;
    float _889 = 0.0;
    float _891 = _887;
    if (_855)
    {
        _889 = _129;
    }
    float _893 = _889;
    float _895 = as_type<float>(_883) * _869;
    float _897 = _893;
    if (!_855)
    {
        _891 = 1.2345600128173828125;
    }
    float _899 = _891;
    float _901 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _903 = log2(_901);
    float _905 = float(uint(_867));
    if (!_855)
    {
        _897 = _699;
    }
    float _907 = _897;
    int _909 = abs(_783);
    float _911 = as_type<float>(_851) * _905;
    int _913 = abs(_795);
    float _915 = floor(_791);
    bool _917 = _881 > 0.0;
    float _919 = _899 * _907;
    int _921 = abs(_877);
    float _923 = trunc(_895);
    float _925 = precise::max(_923, 0.0);
    uint _928 = uint(_925);
    bool _930 = !_843;
    float _932 = _930 ? _405 : as_type<float>(_847);
    float _934 = _705 * 2.0;
    bool _936 = _881 >= 0.0;
    bool _938 = isnan(_881);
    bool _940 = _936 || _938;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    float _946 = _143 * _903;
    int _948 = ~_731;
    int _950 = _948 + 1;
    float _952 = _932 + 0.5;
    float _954 = trunc(_911);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    bool _960 = _915 > 0.0;
    float _962 = floor(_934);
    int _964 = _944 ? 0 : 1;
    bool _966 = _915 >= 0.0;
    bool _968 = isnan(_915);
    bool _970 = _966 || _968;
    bool _972 = isnan(0.0);
    bool _974 = _970 || _972;
    int _976 = ~_964;
    int _978 = _976 + 1;
    int _980 = _978 + 1;
    int _982 = _980;
    float _984 = _946;
    if (!_917)
    {
        int _986 = ~_964;
        int _988 = _986 + 1;
        _982 = _988;
    }
    int _990 = _982;
    int _992 = _950 * int(_958);
    int _994 = _992 + _867;
    float _996 = exp2(_946);
    bool _998 = _699 > 0.5;
    float _1000 = float(uint(_994));
    int _1002 = _863 * int(_928);
    int _1004 = _1002 + _821;
    float _1006 = -_413;
    int _1008 = _998 ? as_type<int>(_1006) : as_type<int>(_413);
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1012 = _1010 != 0;
    float _1014 = as_type<float>(_851) * _1000;
    float _1016 = float(uint(_1004));
    float _1018 = 1.0 / _721;
    int _1020 = _1004;
    if (_855)
    {
        _984 = 1.0;
    }
    float _1022 = _984;
    float _1024 = as_type<float>(_883) * _1016;
    float _1026 = _1022;
    if (_855)
    {
        _1020 = 0;
    }
    int _1028 = _1020;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1032 = 1.0 + _1030;
    int _1034 = _974 ? 0 : 1;
    float _1036 = trunc(_1014);
    float _1038 = precise::max(_1036, 0.0);
    uint _1040 = uint(_1038);
    int _1042 = _1028;
    if (!_855)
    {
        _1026 = 7.345489978790283203125;
    }
    float _1044 = _1026;
    float _1046 = -_996;
    float _1048 = _1046 + 1.0;
    if (!_855)
    {
        _1042 = 1;
    }
    int _1050 = _1042;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1054 = _1052 != 0;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1058 = _1056 != 0;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1062 = _1060 != 0;
    float _1064 = _1044 * _129;
    bool _1066 = !_1012;
    float _1068 = _1066 ? _413 : as_type<float>(_1008);
    float _1070 = trunc(_1024);
    float _1072 = precise::max(_1070, 0.0);
    uint _1074 = uint(_1072);
    bool _1076 = _962 > 0.0;
    float _1078 = _717 * _1018;
    int _1080 = ~_1034;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    int _1086 = _1084;
    if (!_960)
    {
        int _1088 = ~_1034;
        int _1090 = _1088 + 1;
        _1086 = _1090;
    }
    int _1092 = _1086;
    bool _1094 = _962 >= 0.0;
    bool _1096 = isnan(_962);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(0.0);
    bool _1102 = _1098 || _1100;
    float _1104 = 1.0 / _1032;
    int _1106 = int(_958) + int(_1040);
    int _1108 = _1102 ? 0 : 1;
    bool _1110 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1118 = _1114 || _1116;
    int _1120 = ~_1108;
    int _1122 = _1120 + 1;
    int _1124 = _1122 + 1;
    float _1126 = 1.0 / _725;
    int _1128 = _1124;
    if (!_1076)
    {
        int _1130 = ~_1108;
        int _1132 = _1130 + 1;
        _1128 = _1132;
    }
    int _1134 = _1128;
    float _1136 = in.m_51.w;
    float _1138 = _1118 ? _1048 : 0.0;
    int _1140 = ~_731;
    int _1142 = _1140 + 1;
    int _1144 = ~_787;
    int _1146 = _1144 + 1;
    float _1148 = _1138 * _1104;
    int _1150 = int(_928) + int(_1074);
    int _1152 = _1142 * _1106;
    int _1154 = _1152 + _867;
    bool _1156 = _1050 != 1;
    float _1158 = _623 * _167;
    int _1160 = _1146 * _1150;
    int _1162 = _1160 + _821;
    bool _1164 = uint(_1154) >= uint(_731);
    float _1166 = fma(_629, _165, _1158);
    bool _1168 = !_1062;
    int _1170 = _1168 ? 0 : 1;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1172;
    bool _1176 = uint(_1162) >= uint(_787);
    float _1178 = _737 * _1126;
    bool _1180 = !_1164;
    int _1182 = _1180 ? 0 : (-1);
    float _1184 = 1.0 / _739;
    bool _1186 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1188 = isnan(1.0);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1194 = _1190 || _1192;
    float _1196 = 0.0;
    if (!_1156)
    {
        _1196 = _699;
    }
    float _1198 = _1196;
    float _1200 = 0.0;
    float _1202 = _1198;
    if (!_1156)
    {
        _1200 = _699;
    }
    float _1204 = _1200;
    float _1206 = 0.0;
    float _1208 = _1204;
    if (!_1156)
    {
        _1206 = _705;
    }
    float _1210 = _1206;
    float _1212 = 1.0 / _1174;
    float _1214 = 0.0;
    float _1216 = _1210;
    if (!_1156)
    {
        _1214 = _705;
    }
    float _1218 = _1214;
    bool _1220 = !_1054;
    int _1222 = _1220 ? 0 : 1;
    float _1224 = _1218;
    if (_1156)
    {
        _1202 = _129;
    }
    float _1226 = _1202;
    if (_1156)
    {
        _1208 = _129;
    }
    float _1228 = _1208;
    float _1230 = _143 * _1184;
    if (_1156)
    {
        _1216 = _699;
    }
    float _1232 = _1216;
    if (_1156)
    {
        _1224 = _699;
    }
    float _1234 = _1224;
    bool _1236 = !_1176;
    int _1238 = _1236 ? 0 : (-1);
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1242 = _1240 != 0;
    int _1244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1246 = _1244 != 0;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1250 = _1248 != 0;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1254 = _1252 != 0;
    float _1256 = _623 * _173;
    bool _1258 = !_1194;
    float _1260 = _1258 ? _143 : _1148;
    bool _1262 = _1136 > 0.5;
    float _1264 = fma(_629, _171, _1256);
    float _1266 = in.m_57.w;
    float _1268 = fma(_653, _175, _1264);
    float _1270 = in.m_55.w;
    float _1272 = fma(_653, _169, _1166);
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1276 = in.m_59.w;
    float _1278 = _129 + _705;
    float _1280 = -_1274;
    float _1282 = fma(_707, 2.0, _1280);
    float _1284 = fma(_653, _181, _713);
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1288 = _693 + _1286;
    float _1290 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1292 = _1278 + (-1.0);
    float _1294 = _1288 * _1212;
    float _1296 = _705 + _699;
    float _1298 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1300 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1302 = isnan(_693);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = -_143;
    float _1314 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1282);
    float _1316 = _1296 + (-1.0);
    float _1318 = _1268 + _1266;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1320;
    float _1324 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1326;
    bool _1330 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1332 = isnan(_693);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = _1272 + _1270;
    float _1344 = fma(_1322, _1078, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1350 = _1284 + _1276;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1356 = fma(_1328, _1078, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1358 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1360 = isnan(_693);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    float _1370 = -_1340;
    float _1372 = _1370 + 1.0;
    float _1374 = fma(_1354, _1178, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1376 = fma(_1348, _1178, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1378 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1380 = isnan(_693);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = _1368 * _1372;
    float _1392 = -_1368;
    float _1394 = _1392 + 1.0;
    float _1396 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1314);
    float _1398 = _1388 * _1394;
    float _1400 = -_1388;
    float _1402 = _1400 + 1.0;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1404;
    float _1408 = floor(_1064);
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1410;
    float _1414 = _1310 * _1402;
    float _1416 = fma(_1406, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1418 = -_1310;
    float _1420 = _1418 + 1.0;
    float _1422 = fma(_1412, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1424 = _1344 * _1414;
    float _1426 = _1356 * _1414;
    float _1428 = floor(_919);
    float _1430 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _761);
    float _1432 = _1068 + (-0.5);
    float _1434 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1424);
    float _1436 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1426);
    bool _1438 = !_1058;
    int _1440 = _1438 ? 0 : 1;
    float _1442 = -_1432;
    float _1444 = -_1430;
    float _1446 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1444);
    float _1448 = fma(_1374, _1398, _1434);
    float _1450 = -_1408;
    float _1452 = _1064 + _1450;
    float _1454 = fma(_1376, _1398, _1436);
    float _1456 = float(_787);
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1460 = fma(_1416, _1390, _1448);
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1464 = float(_867);
    float _1466 = -_1428;
    float _1468 = _919 + _1466;
    float _1470 = float(_821);
    float _1472 = _1230 * _1456;
    float _1474 = float(_731);
    float _1476 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1460);
    bool _1478 = _1470 >= _1456;
    bool _1480 = isnan(_1470);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan(_1456);
    bool _1486 = _1482 || _1484;
    float _1488 = float(_1486);
    float _1490 = _1468 * _1456;
    float _1492 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1458);
    float _1494 = fma(_1422, _1390, _1454);
    int _1496 = abs(_1222);
    float _1498 = in.m_66.x;
    float _1500 = in.m_66.y;
    float _1502 = in.m_66.z;
    bool _1504 = _1464 >= _1474;
    bool _1506 = isnan(_1464);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan(_1474);
    bool _1512 = _1508 || _1510;
    float _1514 = float(_1512);
    float _1516 = _1452 * _1474;
    float _1518 = _1230 * _1474;
    float _1520 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1462);
    float _1522 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1524 = abs(_1440);
    float _1526 = trunc(_1516);
    int _1528 = int(_1526);
    int _1530 = abs(_1170);
    float _1532 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1534 = float(_1496);
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1538 = float(_1134);
    float _1540 = float(_990);
    float _1542 = trunc(_1514);
    int _1544 = int(_1542);
    float _1546 = float(_1524);
    float _1548 = -_1536;
    float _1550 = fma(_1532, 2.0, _1548);
    float _1552 = float(_1530);
    float _1554 = _1534 * _1538;
    float _1556 = float(_1092);
    float _1558 = _1546 * _1540;
    float _1560 = _1554 * (-2.0);
    float _1562 = _1552 * _1556;
    float _1564 = _1558 * (-2.0);
    float _1566 = fma(_1290, _1560, _1290);
    float _1568 = fma(_1560, _1498, _1498);
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1572 = fma(_1324, _1564, _1324);
    float _1574 = fma(_1564, _1500, _1500);
    int _1576 = ~_1106;
    int _1578 = _1576 + _1182;
    int _1580 = _1578 + 1;
    float _1582 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1570);
    float _1584 = _129 + (-0.5);
    float _1586 = trunc(_1488);
    int _1588 = int(_1586);
    int _1590 = _1528 * _879;
    int _1592 = _1590 + _867;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1596 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1568);
    int _1598 = _731 * _1580;
    int _1600 = _1598 + _867;
    int _1602 = ~_1150;
    int _1604 = _1602 + _1238;
    int _1606 = _1604 + 1;
    float _1608 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1594);
    float _1610 = fma(_1260, _1566, _1596);
    bool _1612 = !_837;
    int _1614 = _1612 ? 0 : 1;
    float _1616 = _699 + (-0.5);
    bool _1618 = _705 > 0.5;
    float _1620 = trunc(_1518);
    int _1622 = int(_1620);
    float _1624 = float(uint(_1592));
    float _1626 = _1562 * (-2.0);
    float _1628 = -_405;
    int _1630 = _1618 ? as_type<int>(_1628) : as_type<int>(_405);
    float _1632 = _1610 * 0.15915493667125701904296875;
    bool _1634 = _731 == 0;
    float _1636 = fma(_1626, _1502, _1502);
    int _1638 = abs(_815);
    int _1640 = _787 * _1606;
    int _1642 = _1640 + _821;
    int _1644 = ~_1544;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    float _1650 = trunc(_1490);
    int _1652 = int(_1650);
    bool _1654 = !_1634;
    int _1656 = _1654 ? _1600 : (-1);
    float _1658 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1574);
    bool _1660 = !_1250;
    float _1662 = _1660 ? _405 : as_type<float>(_1630);
    float _1664 = as_type<float>(_851) * _1624;
    bool _1666 = _787 == 0;
    int _1668 = _1656 * _1648;
    int _1670 = _731 + (-1);
    float _1672 = trunc(_1472);
    int _1674 = int(_1672);
    int _1676 = ~_1588;
    int _1678 = _1676 + 1;
    int _1680 = _1678 + 1;
    float _1682 = fma(_1260, _1572, _1658);
    bool _1684 = !_1666;
    int _1686 = _1684 ? _1642 : (-1);
    int _1688 = _1544 * _1670;
    int _1690 = _1688 + _1668;
    float _1692 = _705 + (-0.5);
    int _1694 = abs(_775);
    int _1696 = _1686 * _1680;
    int _1698 = _787 + (-1);
    int _1700 = _1690 * _909;
    int _1702 = _1652 * _1638;
    int _1704 = _1702 + _821;
    int _1706 = abs(_859);
    int _1708 = _1588 * _1698;
    int _1710 = _1708 + _1696;
    int _1712 = abs(_779);
    int _1714 = _1622 * _1694;
    int _1716 = _1714 + _1700;
    float _1718 = trunc(_1664);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = abs(_873);
    int _1726 = _1592 * _913;
    int _1728 = _1726 + _1716;
    float _1730 = fma(_1298, _1626, _1298);
    float _1732 = float(uint(_1704));
    int _1734 = _1528 * _1712;
    int _1736 = _1734 + _1728;
    float _1738 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1494);
    float _1740 = as_type<float>(_883) * _1732;
    float _1742 = _1632 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = float(uint(_1736));
    int _1748 = _1710 * _1706;
    float _1750 = as_type<float>(_851) * _1746;
    int _1752 = _1674 * _1724;
    int _1754 = _1752 + _1748;
    float _1756 = trunc(_1740);
    float _1758 = precise::max(_1756, 0.0);
    uint _1760 = uint(_1758);
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1764 = abs(_1614);
    float _1766 = in.m_64.x;
    float _1768 = in.m_64.y;
    int _1770 = _1704 * _921;
    int _1772 = _1770 + _1754;
    float _1774 = fma(_1522, -2.0, _1762);
    float _1776 = trunc(_1750);
    float _1778 = precise::max(_1776, 0.0);
    uint _1780 = uint(_1778);
    float _1782 = _1682 * 0.15915493667125701904296875;
    float _1784 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1636);
    int _1786 = _1652 * _1764;
    int _1788 = _1786 + _1772;
    float _1790 = -_143;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1550);
    float _1794 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1774);
    float _1796 = fma(_1260, _1730, _1784);
    int _1798 = ~_731;
    int _1800 = _1798 + 1;
    float _1802 = _1632 * 6.283185482025146484375;
    float _1804 = cos(_1802);
    float _1806 = _1796 * 0.15915493667125701904296875;
    float _1808 = -_413;
    int _1810 = _1262 ? as_type<int>(_1808) : as_type<int>(_413);
    int _1812 = _1800 * int(_1722);
    int _1814 = _1812 + _1592;
    float _1816 = _1662 + 0.5;
    bool _1818 = !_1254;
    float _1820 = _1818 ? _413 : as_type<float>(_1810);
    float _1822 = _1782 * 6.283185482025146484375;
    float _1824 = sin(_1822);
    int _1826 = ~_731;
    int _1828 = _1826 + 1;
    float _1830 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1792);
    float _1832 = float(uint(_1814));
    float _1834 = _1820 + (-0.5);
    float _1836 = _1476 * _1766;
    int _1838 = _1828 * int(_1780);
    int _1840 = _1838 + _1736;
    float _1842 = float(uint(_1788));
    float _1844 = as_type<float>(_851) * _1832;
    float _1846 = -_1834;
    float _1848 = -_1794;
    float _1850 = fma(_1846, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1848);
    int _1852 = ~_787;
    int _1854 = _1852 + 1;
    float _1856 = _1782 * 6.283185482025146484375;
    float _1858 = cos(_1856);
    float _1860 = float(uint(_1840));
    float _1862 = as_type<float>(_883) * _1842;
    float _1864 = _1738 * _1768;
    float _1866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _405);
    float _1868 = as_type<float>(_851) * _1860;
    float _1870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _413);
    float _1872 = _1806 * 6.283185482025146484375;
    float _1874 = cos(_1872);
    int _1876 = _1854 * int(_1760);
    int _1878 = _1876 + _1704;
    float _1880 = _1836 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1882 = _1864 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1884 = float(uint(_1878));
    float _1886 = _1880 * _1866;
    float _1888 = trunc(_1862);
    float _1890 = precise::max(_1888, 0.0);
    uint _1892 = uint(_1890);
    float _1894 = _1882 * _1870;
    float _1896 = _1744 * _1824;
    float _1898 = _1744 * _1858;
    float _1900 = as_type<float>(_883) * _1884;
    float _1902 = _1804 * _1858;
    float _1904 = _1806 * 6.283185482025146484375;
    float _1906 = sin(_1904);
    float _1908 = _1744 * _1874;
    float _1910 = _1804 * _1824;
    float _1912 = _1858 * _1874;
    float _1914 = _1804 * _1874;
    float _1916 = _1824 * _1874;
    float _1918 = trunc(_1868);
    float _1920 = precise::max(_1918, 0.0);
    uint _1922 = uint(_1920);
    float _1924 = _1914 * _1894;
    float _1926 = trunc(_1844);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    float _1932 = -_1910;
    float _1934 = fma(_1906, _1898, _1932);
    float _1936 = -_1898;
    float _1938 = fma(_1906, _1910, _1936);
    float _1940 = fma(_1906, _1902, _1896);
    float _1942 = trunc(_1900);
    float _1944 = precise::max(_1942, 0.0);
    uint _1946 = uint(_1944);
    int _1948 = ~_787;
    int _1950 = _1948 + 1;
    int _1952 = int(_1780) + int(_1922);
    float _1954 = fma(_1906, _1896, _1902);
    int _1956 = ~_787;
    int _1958 = _1956 + 1;
    int _1960 = _1950 * int(_1892);
    int _1962 = _1960 + _1788;
    int _1964 = int(_1722) + int(_1930);
    int _1966 = ~_731;
    int _1968 = _1966 + 1;
    float _1970 = float(uint(_1962));
    float _1972 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1974 = _1968 * _1952;
    int _1976 = _1974 + _1736;
    float _1978 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1980 = as_type<float>(_883) * _1970;
    float _1982 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1984 = -_1906;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1972);
    bool _1988 = uint(_1976) >= uint(_731);
    float _1990 = -_1906;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1978);
    float _1994 = -_1906;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1982);
    float _1998 = trunc(_1980);
    float _2000 = precise::max(_1998, 0.0);
    uint _2002 = uint(_2000);
    float _2004 = -_1894;
    float _2006 = _1906 * _2004;
    bool _2008 = !_1988;
    int _2010 = _2008 ? 0 : (-1);
    float _2012 = _1908 * _1894;
    float _2014 = fma(_1940, _1886, _1924);
    float _2016 = fma(_1912, _1886, _2006);
    int _2018 = ~_1952;
    int _2020 = _2018 + _2010;
    int _2022 = _2020 + 1;
    float _2024 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2026 = fma(_1934, _1886, _2012);
    float _2028 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2030 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2032 = _731 * _2022;
    int _2034 = _2032 + _1736;
    float _2036 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2024);
    float _2038 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1996);
    float _2040 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1986);
    float _2042 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1992);
    int _2044 = int(_1892) + int(_2002);
    float _2046 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2028);
    bool _2048 = !_1634;
    int _2050 = _2048 ? _2034 : (-1);
    float _2052 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2030);
    float _2054 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2056 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2058 = _2050 & 3;
    bool _2060 = _2058 != 0;
    float _2062 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2064 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2066 = ~_731;
    int _2068 = _2066 + 1;
    float _2070 = fma(_1916, _2054, _2016);
    bool _2072 = uint(_2058) > 1u;
    float _2074 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2056);
    int _2076 = int(_1760) + int(_1946);
    float _2078 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2062);
    bool _2080 = !_2060;
    int _2082 = _2080 ? 0 : 1;
    float _2084 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2064);
    int _2086 = _2050 & 3;
    bool _2088 = _2086 != 0;
    float _2090 = fma(_1938, _2054, _2014);
    int _2092 = _1958 * _2044;
    int _2094 = _2092 + _1788;
    int _2096 = _2088 ? 0 : 1;
    float _2098 = fma(_1954, _2054, _2026);
    int _2100 = ~_787;
    int _2102 = _2100 + 1;
    int _2104 = _2068 * _1964;
    int _2106 = _2104 + _1592;
    bool _2108 = uint(_2094) >= uint(_787);
    float _2110 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2074);
    int _2112 = ~_2096;
    int _2114 = _2112 + 1;
    int _2116 = _2114 + 1;
    float _2118 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2078);
    int _2120 = _2116;
    if (!_2072)
    {
        int _2122 = ~_2096;
        int _2124 = _2122 + 1;
        _2120 = _2124;
    }
    int _2126 = _2120;
    float _2128 = _2090 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2130 = uint(_2106) >= uint(_731);
    float _2132 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2084);
    bool _2134 = !_2108;
    int _2136 = _2134 ? 0 : (-1);
    float _2138 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2128);
    float _2140 = _2090 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2142 = ~_2044;
    int _2144 = _2142 + _2136;
    int _2146 = _2144 + 1;
    float _2148 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2138);
    bool _2150 = uint(_2058) >= 2u;
    float _2152 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2140);
    float _2154 = _2090 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2156 = _787 * _2146;
    int _2158 = _2156 + _1788;
    float _2160 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2162 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2152);
    float _2164 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2154);
    int _2166 = _2050 >> 31;
    float _2168 = _1350 + _2160;
    bool _2170 = !_1666;
    int _2172 = _2170 ? _2158 : (-1);
    float _2174 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2176 = _2166 & 3;
    float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2180 = _2168 + _2178;
    int _2182 = _2172 >> 31;
    float _2184 = _1318 + _2174;
    int _2186 = _2050 + _2176;
    float _2188 = _2180 * _2180;
    int _2190 = _2182 & 3;
    float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2194 = _2184 + _2192;
    int _2196 = _2186 >> 2;
    int _2198 = _2102 * _2076;
    int _2200 = _2198 + _1704;
    int _2202 = _2172 + _2190;
    float _2204 = fma(_2194, _2194, _2188);
    int _2206 = _2196 << 4;
    int _2208 = _2206 + 368;
    float _2210 = _413 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2212 = _2202 >> 2;
    float _2214 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2164);
    int _2216 = _2208 + 8;
    uint _2218 = uint(int(uint(_2216) >> uint(2)));
    uint _2220 = uint(int(uint(int(_2218)) >> uint(2)));
    int _2222 = int(_2218) & 3;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[int(_2220)][_2222];
    int _2226 = int(_2218) + 1;
    uint _2228 = uint(int(uint(_2226) >> uint(2)));
    int _2230 = _2226 & 3;
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[int(_2228)][_2230];
    int _2234 = _2150 ? 0 : 1;
    float _2236 = _405 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2238 = _2212 << 4;
    int _2240 = _2238 + 512;
    float _2242 = _2210 * _2038;
    bool _2244 = uint(_2200) >= uint(_787);
    float _2246 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2046);
    float _2248 = sqrt(_2204);
    uint _2250 = uint(int(uint(_2208) >> uint(2)));
    uint _2252 = uint(int(uint(int(_2250)) >> uint(2)));
    int _2254 = int(_2250) & 3;
    float _2256 = (*spvDescriptorSet0.vp_c9)._m0[int(_2252)][_2254];
    int _2258 = int(_2250) + 1;
    uint _2260 = uint(int(uint(_2258) >> uint(2)));
    int _2262 = _2258 & 3;
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[int(_2260)][_2262];
    bool _2266 = !_2130;
    int _2268 = _2266 ? 0 : (-1);
    float _2270 = _2210 * _2042;
    bool _2272 = _2058 != 3;
    int _2274 = ~_2234;
    int _2276 = _2274 + 1;
    int _2278 = _2276 + 1;
    int _2280 = ~_1964;
    int _2282 = _2280 + _2268;
    int _2284 = _2282 + 1;
    uint _2286 = uint(int(uint(_2240) >> uint(2)));
    uint _2288 = uint(int(uint(int(_2286)) >> uint(2)));
    int _2290 = int(_2286) & 3;
    float _2292 = (*spvDescriptorSet0.vp_c9)._m0[int(_2288)][_2290];
    int _2294 = int(_2286) + 1;
    uint _2296 = uint(int(uint(_2294) >> uint(2)));
    int _2298 = _2294 & 3;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[int(_2296)][_2298];
    float _2302 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2036);
    bool _2304 = !_2244;
    int _2306 = _2304 ? 0 : (-1);
    float _2308 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2052);
    int _2310 = _2172 & 3;
    bool _2312 = _2310 != 0;
    float _2314 = fma(_2236, _2302, _2242);
    int _2316 = ~_2076;
    int _2318 = _2316 + _2306;
    int _2320 = _2318 + 1;
    int _2322 = _731 * _2284;
    int _2324 = _2322 + _1592;
    int _2326 = _2240 + 8;
    uint _2328 = uint(int(uint(_2326) >> uint(2)));
    uint _2330 = uint(int(uint(int(_2328)) >> uint(2)));
    int _2332 = int(_2328) & 3;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[int(_2330)][_2332];
    int _2336 = int(_2328) + 1;
    uint _2338 = uint(int(uint(_2336) >> uint(2)));
    int _2340 = _2336 & 3;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[int(_2338)][_2340];
    int _2344 = _2278;
    float _2346 = _2168;
    float _2348 = _2184;
    float _2350 = _2246;
    float _2352 = _2302;
    float _2354 = _2246;
    if (_2272)
    {
        int _2356 = ~_2234;
        int _2358 = _2356 + 1;
        _2344 = _2358;
    }
    int _2360 = _2344;
    float _2362 = _2210 * _2040;
    bool _2364 = _2248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2366 = _787 * _2320;
    int _2368 = _2366 + _1704;
    int _2370 = _2172 & 3;
    bool _2372 = _2370 != 0;
    float _2374 = fma(_2236, _2246, _2362);
    float _2376 = _2214 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2378 = _2312 ? 0 : 1;
    float _2380 = fma(_2236, _2308, _2270);
    bool _2382 = uint(_2370) >= 2u;
    float _2384 = _1342 + _2376;
    bool _2386 = !_2372;
    int _2388 = _2386 ? 0 : 1;
    int _2390 = _2382 ? 0 : 1;
    bool _2392 = uint(_2370) > 1u;
    int _2394 = ~_2378;
    int _2396 = _2394 + 1;
    int _2398 = _2396 + 1;
    int _2400 = ~_2390;
    int _2402 = _2400 + 1;
    int _2404 = _2402 + 1;
    bool _2406 = _2370 != 3;
    bool _2408 = !_2364;
    float _2410 = _2384;
    int _2412 = _2398;
    int _2414 = _2404;
    if (!_2408)
    {
        float _2416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2420 = _2248 + _2418;
        float _2422 = rsqrt(_2204);
        float _2424 = _2420 * _2416;
        float _2426 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2428 = _2424 * 0.15915493667125701904296875;
        float _2430 = _2428 * 6.283185482025146484375;
        float _2432 = cos(_2430);
        float _2434 = _2428 * 6.283185482025146484375;
        float _2436 = sin(_2434);
        float _2438 = _2432 + (-1.0);
        float _2440 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2442 = fma(_2436, _2426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2444 = fma(_2384, _2432, _2440);
        float _2446 = _2422 * _2442;
        float _2448 = fma(_2194, _2446, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2450 = fma(_2180, _2446, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2346 = _2450;
        _2410 = _2444;
        _2348 = _2448;
    }
    float _2452 = _2346;
    float _2454 = _2410;
    float _2456 = _2348;
    float _2458 = _2456;
    float _2460 = _2454;
    float _2462 = _2452;
    if (!_2392)
    {
        int _2464 = ~_2378;
        int _2466 = _2464 + 1;
        _2412 = _2466;
    }
    int _2468 = _2412;
    float _2470 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1582);
    int _2472 = abs(_2126);
    float _2474 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1608);
    int _2476 = abs(_2082);
    float _2478 = -_2470;
    float _2480 = _2478 + 1.0;
    int _2482 = abs(_2468);
    float _2484 = -_2474;
    float _2486 = _2484 + 1.0;
    int _2488 = abs(_2388);
    float _2490 = -_2480;
    float _2492 = fma(_932, _2490, _1396);
    float _2494 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1492);
    int _2496 = ~_2472;
    int _2498 = _2496 + 1;
    int _2500 = _2498 + 1;
    float _2502 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1520);
    int _2504 = ~_2482;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    float _2510 = fma(_1068, _2486, _1446);
    int _2512 = abs(_2360);
    int _2514 = _2500 * as_type<int>(_2264);
    int _2516 = ~_2476;
    int _2518 = _2516 + 1;
    int _2520 = _2518 + 1;
    int _2522 = _2508 * as_type<int>(_2300);
    bool _2524 = _2058 != 3;
    out.m_68.x = _2302;
    out.m_68.y = _2246;
    out.m_68.z = _2308;
    int _2526 = ~_2488;
    int _2528 = _2526 + 1;
    int _2530 = _2528 + 1;
    int _2532 = _2520 * as_type<int>(_2256);
    int _2534 = _2532 + _2514;
    float _2536 = _2510;
    if (_2406)
    {
        int _2538 = ~_2390;
        int _2540 = _2538 + 1;
        _2414 = _2540;
    }
    int _2542 = _2414;
    int _2544 = ~_2512;
    int _2546 = _2544 + 1;
    int _2548 = _2546 + 1;
    int _2550 = _2530 * as_type<int>(_2292);
    int _2552 = _2550 + _2522;
    bool _2554 = !_2524;
    int _2556 = _2554 ? 0 : (-1);
    bool _2558 = _2370 != 3;
    int _2560 = _2548 * as_type<int>(_2224);
    int _2562 = _2560 + _2534;
    int _2564 = abs(_2542);
    bool _2566 = !_1242;
    int _2568 = _2566 ? 0 : 1;
    int _2570 = abs(_2556);
    bool _2572 = !_2558;
    int _2574 = _2572 ? 0 : (-1);
    int _2576 = abs(_2568);
    int _2578 = abs(_2574);
    int _2580 = ~_2564;
    int _2582 = _2580 + 1;
    int _2584 = _2582 + 1;
    bool _2586 = !_1246;
    int _2588 = _2586 ? 0 : 1;
    int _2590 = ~_2570;
    int _2592 = _2590 + 1;
    int _2594 = _2592 + 1;
    int _2596 = _2584 * as_type<int>(_2334);
    int _2598 = _2596 + _2552;
    float _2600 = fma(_2210, _2210, 1.0);
    int _2602 = abs(_2588);
    int _2604 = _2594 * as_type<int>(_2232);
    int _2606 = _2604 + _2562;
    int _2608 = ~_2576;
    int _2610 = _2608 + 1;
    int _2612 = _2610 + 1;
    int _2614 = ~_2578;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    int _2620 = _2606 * _2612;
    bool _2622 = !_1634;
    int _2624 = _2622 ? _2324 : (-1);
    int _2626 = _2618 * as_type<int>(_2342);
    int _2628 = _2626 + _2598;
    float _2630 = rsqrt(_2600);
    int _2632 = ~_2602;
    int _2634 = _2632 + 1;
    int _2636 = _2634 + 1;
    float _2638 = -_1350;
    float _2640 = _2638 + _2452;
    bool _2642 = !_1666;
    int _2644 = _2642 ? _2368 : (-1);
    float _2646 = -_2502;
    float _2648 = _2646 + 1.0;
    int _2650 = _2628 * _2636;
    int _2652 = _2624 * _2576;
    int _2654 = _2652 + _2620;
    float _2656 = -_1342;
    float _2658 = _2656 + _2454;
    float _2660 = -_1318;
    float _2662 = _2660 + _2456;
    int _2664 = _2644 * _2602;
    int _2666 = _2664 + _2650;
    float _2668 = -_2494;
    float _2670 = _2668 + 1.0;
    float _2672 = _2658 * _2658;
    float _2674 = fma(_1820, _2648, _1850);
    float _2676 = float(_2654);
    float _2678 = _2210 * _2630;
    float _2680 = fma(_2662, _2662, _2672);
    float _2682 = -_2670;
    float _2684 = fma(_1662, _2682, _1830);
    float _2686 = float(_2666);
    float _2688 = -_2110;
    float _2690 = _2678 * _2688;
    float _2692 = fma(_2640, _2640, _2680);
    float _2694 = -_2118;
    float _2696 = _2678 * _2694;
    float _2698 = -_2132;
    float _2700 = _2678 * _2698;
    float _2702 = fma(_2630, _2038, _2690);
    float _2704 = sqrt(_2692);
    float _2706 = fma(_2630, _2040, _2696);
    float _2708 = fma(_2630, _2042, _2700);
    float _2710 = _2110 + _2314;
    float _2712 = _2118 + _2374;
    float _2714 = _2132 + _2380;
    out.m_70.x = _2492;
    out.m_70.y = _2510;
    out.m_70.z = _2684;
    out.m_70.w = _2674;
    out.m_72.x = _2702;
    out.m_72.y = _2706;
    out.m_72.z = _2708;
    out.m_74.x = _2676;
    out.m_74.y = _2686;
    bool _2716 = _2704 > 0.0;
    out.m_76.x = _2710;
    out.m_76.y = _2712;
    out.m_76.z = _2714;
    bool _2718 = !_2716;
    if (!_2718)
    {
        bool _2720 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2722 = _2674;
        if (_2720)
        {
            float _2724 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2722 = _2724;
        }
        float _2726 = _2722;
        if (_2720)
        {
            float _2728 = _655 * _2726;
            _2536 = _2728;
        }
        float _2730 = _2536;
        float _2732 = _2730;
        if (_2720)
        {
            float _2734 = _657 * _2726;
            _2350 = _2734;
        }
        float _2736 = _2350;
        float _2738 = _2736;
        if (_2720)
        {
            float _2740 = _659 * _2726;
            _2352 = _2740;
        }
        float _2742 = _2352;
        float _2744 = _2742;
        if (!_2720)
        {
            bool _2746 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2748 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2750 = _2746 || _2748;
            bool _2752 = isnan(1.0);
            bool _2754 = _2750 || _2752;
            float _2756 = _143 + 1.0;
            float _2758 = _2756;
            if (!_2754)
            {
                float _2760 = _2756 * _2756;
                float _2762 = _2760 * 0.5;
                _145 = _2762;
            }
            float _2764 = _145;
            float _2766 = _2764;
            if (!_2754)
            {
                float _2768 = _2764 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2766 = _2768;
            }
            float _2770 = _2766;
            bool _2772 = !_2754;
            float _2774 = _2770;
            if (!_2772)
            {
                float _2776 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2778 = log2(_2776);
                float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2782 = 1.0 + _2780;
                float _2784 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2786 = _2778 * _2756;
                float _2788 = 1.0 / _2782;
                float _2790 = _2784 * 0.693147182464599609375;
                float _2792 = exp2(_2786);
                float _2794 = 1.0 / _2790;
                float _2796 = _2792 + (-1.0);
                float _2798 = -_2796;
                float _2800 = fma(_2798, _2794, _2756);
                float _2802 = _2800 * _2788;
                float _2804 = _2802 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2774 = _2804;
            }
            float _2806 = _2774;
            float _2808 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2810 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2812 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2814 = _2806;
            if (!_2754)
            {
                _2814 = _2756;
            }
            float _2816 = _2814;
            float _2818 = _2808 * _379;
            float _2820 = _2808 * _325;
            float _2822 = _2808 * _397;
            float _2824 = fma(_2810, _369, _2818);
            float _2826 = fma(_2810, _321, _2820);
            float _2828 = fma(_2812, _389, _2824);
            bool _2830 = !_2754;
            float _2832 = _2816;
            if (!_2830)
            {
                float _2834 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2836 = log2(_2834);
                float _2838 = _2836 * _2756;
                float _2840 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2842 = 1.0 + _2840;
                float _2844 = exp2(_2838);
                float _2846 = 1.0 / _2842;
                float _2848 = -_2844;
                float _2850 = _2848 + 1.0;
                float _2852 = _2850 * _2846;
                _2832 = _2852;
                _2758 = _2842;
            }
            float _2854 = _2832;
            float _2856 = _2758;
            float _2858 = fma(_2810, _393, _2822);
            float _2860 = fma(_2812, _329, _2826);
            float _2862 = fma(_2854, _261, _2828);
            float _2864 = fma(_2812, _401, _2858);
            float _2866 = fma(_2854, _259, _2860);
            float _2868 = -_617;
            float _2870 = _2868 + _2862;
            float _2872 = fma(_2854, _263, _2864);
            float _2874 = -_621;
            float _2876 = _2874 + _2866;
            float _2878 = _2870 * _173;
            float _2880 = _2870 * _167;
            float _2882 = _2870 * _179;
            float _2884 = -_635;
            float _2886 = _2884 + _2872;
            float _2888 = fma(_2876, _171, _2878);
            float _2890 = fma(_2876, _165, _2880);
            float _2892 = fma(_2876, _177, _2882);
            float _2894 = fma(_2886, _175, _2888);
            float _2896 = fma(_2886, _169, _2890);
            float _2898 = fma(_2886, _181, _2892);
            _663 = _2896;
            _665 = _2894;
            _667 = _2898;
            _2732 = _2894;
            _2738 = _2896;
            _2744 = _2898;
            _419 = _2872;
            _227 = _2856;
        }
        float _2900 = _663;
        float _2902 = _665;
        float _2904 = _667;
        float _2906 = _2732;
        float _2908 = _2738;
        float _2910 = _2744;
        float _2912 = _419;
        float _2914 = _227;
        float _2916 = _2900 * _2900;
        float _2918 = rsqrt(_2692);
        float _2920 = fma(_2902, _2902, _2916);
        float _2922 = fma(_2904, _2904, _2920);
        float _2924 = sqrt(_2922);
        float _2926 = _2662 * _2918;
        float _2928 = _2658 * _2918;
        float _2930 = _2640 * _2918;
        bool _2932 = _2924 > 0.0;
        bool _2934 = !_2932;
        _421 = _2920;
        _423 = _2924;
        _425 = _2912;
        _229 = _2914;
        _2354 = _2908;
        if (!_2934)
        {
            float _2936 = rsqrt(_2922);
            float _2938 = _2936 * _2900;
            float _2940 = _2936 * _2902;
            float _2942 = _2936 * _2904;
            float _2944 = _2928 * _2938;
            float _2946 = fma(_2926, _2940, _2944);
            float _2948 = fma(_2930, _2942, _2946);
            float _2950 = _2948 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2952 = fma(_2906, _2950, _2456);
            float _2954 = fma(_2908, _2950, _2454);
            float _2956 = fma(_2910, _2950, _2452);
            _2458 = _2952;
            _2460 = _2954;
            _2462 = _2956;
            _421 = _2942;
            _423 = _2950;
            _425 = _2938;
        }
    }
    float _2958 = _2458;
    float _2960 = _2460;
    float _2962 = _2462;
    float _2964 = _421;
    float _2966 = _423;
    float _2968 = _425;
    float _2970 = _229;
    float _2972 = _2354;
    bool _2974 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2976 = isnan(0.5);
    bool _2978 = _2974 || _2976;
    bool _2980 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2982 = _2978 || _2980;
    float _2984 = _2966;
    float _2986 = _2964;
    float _2988 = _2968;
    float _2990 = _2972;
    if (_2982)
    {
        _2984 = _2958;
    }
    float _2992 = _2984;
    float _2994 = _2992;
    if (_2982)
    {
        _2986 = _2960;
    }
    float _2996 = _2986;
    float _2998 = _2996;
    if (_2982)
    {
        _2988 = _2962;
    }
    float _3000 = _2988;
    float _3002 = _3000;
    if (!_2982)
    {
        float _3004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3006 = _1342 + _3004;
        float _3008 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3010 = _1318 + _3008;
        float _3012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3014 = -_1342;
        float _3016 = _3014 + _2960;
        float _3018 = _3006 * _3006;
        float _3020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3022 = _1350 + _3020;
        float _3024 = -_1350;
        float _3026 = _3024 + _2962;
        float _3028 = fma(_3010, _3010, _3018);
        float _3030 = fma(_3022, _3022, _3028);
        float _3032 = -_1318;
        float _3034 = _3032 + _2958;
        float _3036 = sqrt(_3030);
        float _3038 = precise::min(_3036, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3040 = _3038 * _3012;
        float _3042 = fma(_3034, _3040, _1318);
        float _3044 = fma(_3016, _3040, _1342);
        float _3046 = fma(_3026, _3040, _1350);
        _2998 = _3044;
        _2994 = _3042;
        _3002 = _3046;
    }
    float _3048 = _2998;
    float _3050 = _2994;
    float _3052 = _3002;
    float _3054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3056 = _3048 + _3054;
    float _3058 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3060 = _3050 + _3058;
    float _3062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3064 = _3052 + _3062;
    float _3066 = _3056 * _3056;
    float _3068 = fma(_3060, _3060, _3066);
    float _3070 = fma(_3064, _3064, _3068);
    float _3072 = rsqrt(_3070);
    float _3074 = _3072 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3076 = _3060 * _3074;
    float _3078 = _3064 * _3074;
    float _3080 = _3076 * _3076;
    float _3082 = _3078 * _3078;
    float _3084 = _3080 + _3082;
    float _3086 = sqrt(_3084);
    bool _3088 = _3086 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3090 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3092 = _3086 + _3090;
    float _3094 = _3072;
    float _3096 = _3092;
    float _3098 = _3056;
    float _3100 = _3074;
    if (_3088)
    {
        float _3102 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3094 = _3102;
    }
    float _3104 = _3094;
    float _3106 = _3104;
    if (_3088)
    {
        float _3108 = _3092 * _3104;
        _3096 = _3108;
    }
    float _3110 = _3096;
    if (_3088)
    {
        float _3112 = rsqrt(_3084);
        _3106 = _3112;
    }
    float _3114 = _3106;
    float _3116 = _3114;
    if (_3088)
    {
        float _3118 = _3110 * 0.15915493667125701904296875;
        _231 = _3118;
    }
    float _3120 = _231;
    float _3122 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3124 = _3064;
    float _3126 = _3120;
    if (_3088)
    {
        float _3128 = _3120 * 6.283185482025146484375;
        float _3130 = sin(_3128);
        _3124 = _3130;
    }
    float _3132 = _3124;
    float _3134 = precise::max(0.0, _3122);
    float _3136 = _2970;
    if (_3088)
    {
        float _3138 = _3120 * 6.283185482025146484375;
        float _3140 = cos(_3138);
        _3136 = _3140;
    }
    float _3142 = _3136;
    float _3144 = -_3074;
    float _3146 = -_3134;
    float _3148 = fma(_3056, _3144, _3146);
    if (_3088)
    {
        float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3098 = _3150;
    }
    float _3152 = _3098;
    float _3154 = sqrt(_3070);
    float _3156 = _3132;
    float _3158 = _3152;
    if (_3088)
    {
        float _3160 = fma(_3132, _3152, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3156 = _3160;
    }
    float _3162 = _3156;
    float _3164 = _3162;
    if (!_3088)
    {
        _3126 = _3080;
    }
    float _3166 = _3126;
    float _3168 = _3166;
    if (_3088)
    {
        float _3170 = _3114 * _3162;
        _2990 = _3170;
    }
    float _3172 = _2990;
    if (!_3088)
    {
        _3116 = _3076;
    }
    float _3174 = _3116;
    float _3176 = _3174;
    float _3178 = _3142;
    if (_3088)
    {
        float _3180 = _3142 + (-1.0);
        _3158 = _3180;
    }
    float _3182 = _3158;
    float _3184 = _3182;
    if (_3088)
    {
        float _3186 = _3076 * _3172;
        _3176 = _3186;
    }
    float _3188 = _3176;
    if (!_3088)
    {
        _3164 = _3148;
    }
    float _3190 = _3164;
    float _3192 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3194 = _3190;
    if (_3088)
    {
        float _3196 = _3182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3100 = _3196;
    }
    float _3198 = _3100;
    if (!_3088)
    {
        _3184 = _3078;
    }
    float _3200 = _3184;
    float _3202 = _3200;
    if (_3088)
    {
        float _3204 = _3078 * _3172;
        _3202 = _3204;
    }
    float _3206 = _3202;
    if (_3088)
    {
        float _3208 = _3188 * _3188;
        _3168 = _3208;
    }
    float _3210 = _3168;
    if (_3088)
    {
        float _3212 = fma(_3148, _3142, _3198);
        _3194 = _3212;
    }
    float _3214 = _3194;
    if (!_3088)
    {
        _3178 = _3082;
    }
    float _3216 = _3178;
    float _3218 = _3216;
    if (_3088)
    {
        float _3220 = _3206 * _3206;
        _3218 = _3220;
    }
    float _3222 = _3218;
    float _3224 = fma(_3214, _3214, _3210);
    float _3226 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3228 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3230 = _3224 + _3222;
    float _3232 = fma(_3050, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3192);
    float _3234 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3236 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3238 = fma(_3154, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3236);
    float _3240 = precise::clamp(_3238, 0.0, 1.0);
    float _3242 = rsqrt(_3230);
    float _3244 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3232);
    float _3246 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3248 = fma(_3050, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3234);
    float _3250 = -_3240;
    float _3252 = _3250 + 1.0;
    float _3254 = _3244 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3256 = fma(_3050, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3246);
    float _3258 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3248);
    float _3260 = abs(_3252);
    float _3262 = log2(_3260);
    float _3264 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3266 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3256);
    float _3268 = _3258 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3270 = fma(_3050, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3228);
    float _3272 = -_3264;
    float _3274 = fma(_3272, _3226, 1.0);
    float _3276 = _3266 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3278 = _3268 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3280 = _3242 * _3188;
    float _3282 = _3242 * _3214;
    float _3284 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3270);
    float _3286 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3278);
    float _3288 = _3280 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3290 = _3242 * _3206;
    float _3292 = _3284 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3294 = fma(_3254, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3286);
    float _3296 = -_3288;
    float _3298 = fma(_3282, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3296);
    float _3300 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3302 = log2(_3274);
    float _3304 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3294);
    float _3306 = -_3290;
    float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3298);
    float _3310 = _3268 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3312 = fma(_3308, -0.5, 0.5);
    float _3314 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3310);
    float _3316 = exp2(_3300);
    float _3318 = _3268 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3320 = fma(_3308, 0.5, 0.5);
    float _3322 = fma(_3254, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3314);
    float _3324 = _3282 + 1.0;
    float _3326 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3318);
    float _3328 = fma(_3320, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3330 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3322);
    float _3332 = 1.0 / _3304;
    float _3334 = fma(_3254, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3326);
    float _3336 = fma(_3320, _3328, -0.212114393711090087890625);
    float _3338 = _3302 * 0.693147182464599609375;
    float _3340 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3334);
    float _3342 = fma(_3320, _3336, 1.570728778839111328125);
    float _3344 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3346 = sqrt(_3312);
    float _3348 = -_3282;
    float _3350 = fma(_3316, _3324, _3348);
    float _3352 = fma(_3350, 0.5, 0.5);
    float _3354 = _3330 * _3332;
    float _3356 = _3340 * _3332;
    float _3358 = fma(_3354, 0.5, 0.5);
    float _3360 = fma(_3356, -0.5, 0.5);
    float _3362 = _3346 * 0.636619746685028076171875;
    float3 _8641 = float3(_3358, _3360, _3344);
    float _3364 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8641, float3(0.0), isnan(_8641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8641, float3(0.0), isnan(_8641)), level(0.0)).x;
    float3 _8652 = float3(_3358, _3360, _3344);
    float4 _3367 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8652, float3(0.0), isnan(_8652)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8652, float3(0.0), isnan(_8652)), level(0.0)).xyzw;
    float _3369 = _3367.x;
    float _3371 = _3367.y;
    float _3373 = _3367.z;
    float _3375 = _3367.w;
    float _3377 = -_3342;
    float _3379 = fma(_3362, _3377, 1.0);
    float2 _8674 = float2(_3379, _3352);
    float3 _3383 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8674, float2(0.0), isnan(_8674)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8674, float2(0.0), isnan(_8674)), level(0.0)).xyz;
    float _3385 = _3383.x;
    float _3387 = _3383.y;
    float _3389 = _3383.z;
    float _3391 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3393 = _3268 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3395 = _3304 * 0.5;
    out.m_78.x = _3050;
    out.m_78.y = _3048;
    out.m_78.z = _3052;
    bool _3397 = _3154 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3399 = isnan(_3154);
    bool _3401 = _3397 || _3399;
    bool _3403 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3405 = _3401 || _3403;
    float _3407 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3393);
    float _3409 = exp2(_3391);
    float _3411 = _3330 + _3304;
    float _3413 = fma(_3254, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3407);
    float _3415 = fma(_3340, -0.5, _3395);
    float _3417 = _3411 * 0.5;
    float _3419 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3413);
    float _3421 = _3419 + _3304;
    out.gl_Position.x = _3330;
    out.gl_Position.y = _3340;
    out.gl_Position.z = _3419;
    out.gl_Position.w = _3304;
    float _3423 = _3421 * 0.5;
    float _3425 = -_3409;
    float _3427 = _3425 + 1.0;
    float _3429 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _3417;
    out.m_80.y = _3415;
    out.m_80.z = _3423;
    out.m_80.w = _3304;
    float _3431 = -_3429;
    float _3433 = _3431 + 1.0;
    float _3435 = _3304;
    float _3437 = _3419;
    float _3439 = _3340;
    float _3441 = _3330;
    float _3443 = _3415;
    float _3445 = _3417;
    if (!_3405)
    {
        _3435 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3447 = _3435;
    float _3449 = _3447;
    float _3451 = _3447;
    if (!_3405)
    {
        _3437 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3453 = _3437;
    float _3455 = _3453;
    float _3457 = _3453;
    if (!_3405)
    {
        _3439 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3459 = _3439;
    float _3461 = _3459;
    float _3463 = _3459;
    if (!_3405)
    {
        _3441 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3465 = _3441;
    float _3467 = _3465;
    float _3469 = _3465;
    if (!_3405)
    {
        _3443 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3471 = _3443;
    float _3473 = _3471;
    float _3475 = _3471;
    if (!_3405)
    {
        _3445 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3477 = _3445;
    float _3479 = _3429 * _3364;
    float _3481 = _3375 * _3479;
    float _3483 = _3389 * _3479;
    float _3485 = fma(_3385, _3481, _3369);
    float _3487 = fma(_3387, _3481, _3371);
    float _3489 = _3375 * _3433;
    float _3491 = fma(_3375, _3483, _3373);
    out.m_82.x = _3485;
    out.m_82.y = _3487;
    out.m_82.z = _3491;
    out.m_82.w = _3489;
    bool _3493 = !_3405;
    float _3495 = _3477;
    float _3497 = _3477;
    if (!_3493)
    {
        bool _3499 = _3154 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3501 = isnan(_3154);
        bool _3503 = _3499 || _3501;
        bool _3505 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3507 = _3503 || _3505;
        if (!_3507)
        {
            float _3509 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3511 = _3154 + _3509;
            float _3513 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3515 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3513;
            float _3517 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3519 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3521 = 1.0 / _3515;
            float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3525 = _3523 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3529 = _3527 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3531 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3533 = _3531 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3535 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3537 = _3535 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3539 = _3511 * _3521;
            float _3541 = precise::clamp(_3539, 0.0, 1.0);
            float _3543 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3545 = _3543 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3547 = fma(_3541, _3519, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3549 = fma(_3541, _3545, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3551 = fma(_3541, _3525, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3553 = fma(_3541, _3529, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3555 = fma(_3541, _3533, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3557 = fma(_3541, _3537, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3497 = _3551;
            _3463 = _3555;
            _3475 = _3547;
            _3457 = _3553;
            _3451 = _3549;
            _3469 = _3557;
            _3559 = true;
        }
        else
        {
            bool _3561 = _3154 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3563 = isnan(_3154);
            bool _3565 = _3561 || _3563;
            bool _3567 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3569 = _3565 || _3567;
            if (!_3569)
            {
                _3473 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3571 = _3473;
            _3475 = _3571;
            if (!_3569)
            {
                _3495 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3573 = _3495;
            _3497 = _3573;
            if (!_3569)
            {
                _3449 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3575 = _3449;
            _3451 = _3575;
            if (!_3569)
            {
                _3455 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3577 = _3455;
            _3457 = _3577;
            if (!_3569)
            {
                _3461 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3579 = _3461;
            _3463 = _3579;
            if (!_3569)
            {
                _3467 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3581 = _3467;
            bool _3583 = !_3569;
            _3469 = _3581;
            if (!_3583)
            {
                bool _3585 = _3154 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3587 = isnan(_3154);
                bool _3589 = _3585 || _3587;
                bool _3591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3593 = _3589 || _3591;
                if (!_3593)
                {
                    float _3595 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3597 = _3154 + _3595;
                    float _3599 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3601 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3599;
                    float _3603 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3605 = _3603 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3607 = 1.0 / _3601;
                    float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3611 = _3609 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3613 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3615 = _3613 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3619 = _3617 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3621 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3623 = _3621 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3625 = _3597 * _3607;
                    float _3627 = precise::clamp(_3625, 0.0, 1.0);
                    float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3631 = _3629 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3633 = fma(_3627, _3605, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3635 = fma(_3627, _3631, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3637 = fma(_3627, _3611, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3639 = fma(_3627, _3615, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3641 = fma(_3627, _3619, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3643 = fma(_3627, _3623, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3497 = _3637;
                    _3463 = _3641;
                    _3475 = _3633;
                    _3457 = _3639;
                    _3451 = _3635;
                    _3469 = _3643;
                    _3559 = true;
                }
                else
                {
                    _3497 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3463 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3475 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3457 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3451 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3469 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3559 = false;
    float _3645 = _3497;
    float _3647 = _3463;
    float _3649 = _3475;
    float _3651 = _3457;
    float _3653 = _3451;
    float _3655 = _3469;
    float _3657 = fma(_2712, -0.5, 0.5);
    float _3659 = precise::clamp(_3657, 0.0, 1.0);
    float _3661 = -_3645;
    float _3663 = _3661 + _3647;
    float _3665 = -_3649;
    float _3667 = _3665 + _3651;
    float _3669 = -_3653;
    float _3671 = _3669 + _3655;
    bool _3673 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3675 = fma(_3659, _3663, _3645);
    float _3677 = fma(_3659, _3667, _3649);
    float _3679 = fma(_3659, _3671, _3653);
    float _3681 = _3675 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3683 = fma(_3677, 0.298911988735198974609375, _3681);
    float _3685 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3687 = fma(_3679, 0.114477999508380889892578125, _3683);
    out.m_84.w = _3685;
    float _3689 = -_3687;
    float _3691 = _3677 + _3689;
    float _3693 = -_3687;
    float _3695 = _3675 + _3693;
    float _3697 = -_3687;
    float _3699 = _3679 + _3697;
    out.m_86.x = 0.0;
    float _3701 = fma(_3691, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3687);
    float _3703 = fma(_3695, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3687);
    float _3705 = fma(_3699, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3687);
    out.m_88.x = _3701;
    out.m_88.y = _3703;
    out.m_88.z = _3705;
    if (!_3673)
    {
        return out;
    }
    float _3707 = -_3048;
    float _3709 = _3707 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3711 = -_3050;
    float _3713 = _3711 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3715 = -_3052;
    float _3717 = _3715 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3719 = _3709 * _3709;
    float _3721 = fma(_3713, _3713, _3719);
    float _3723 = fma(_3717, _3717, _3721);
    float _3725 = sqrt(_3723);
    float _3727 = rsqrt(_3723);
    float _3729 = -_3725;
    float _3731 = _3729 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3733 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3735 = precise::clamp(_3733, 0.0, 1.0);
    float _3737 = _3713 * _3727;
    float _3739 = _3709 * _3727;
    float _3741 = abs(_3735);
    float _3743 = log2(_3741);
    float _3745 = _3717 * _3727;
    float _3747 = _3737 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3749 = _2712 * _3739;
    float _3751 = -_3739;
    float _3753 = -_3747;
    float _3755 = fma(_3751, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3753);
    float _3757 = fma(_2710, _3737, _3749);
    float _3759 = -_3745;
    float _3761 = fma(_3759, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3755);
    float _3763 = fma(_2714, _3745, _3757);
    float _3765 = precise::clamp(_3763, 0.0, 1.0);
    float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3769 = _3761 + _3767;
    float _3771 = _3743 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3773 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3775 = precise::clamp(_3773, 0.0, 1.0);
    float _3777 = exp2(_3771);
    float _3779 = _3777 * _3775;
    float _3781 = _3765 * _3779;
    float _3783 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3785 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3787 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3783;
    out.m_86.y = _3785;
    out.m_86.z = _3787;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3559 = false;
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
        float _3844 = as_type<float>(_123);
        out.gl_Position.z = _3844;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3918 = as_type<float>(_163);
        out.gl_Position.z = _3918;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    if (!_217)
    {
        _223 = 0.0;
    }
    float _275 = _223;
    int _277 = int(_245);
    int _279 = _249 ? 2 : 0;
    int _281 = _277 | _279;
    int _283 = _217 ? 4 : 0;
    int _285 = _281 | _283;
    int _287 = _219 ? 8 : 0;
    int _289 = _285 | _287;
    int _291 = _241 ? 16 : 0;
    int _293 = _289 | _291;
    int _295 = _273 ? 32 : 0;
    int _297 = _293 | _295;
    int _299 = false ? 64 : 0;
    int _301 = _297 | _299;
    int _303 = _301 & 32;
    float _305 = 0.0;
    float _307 = as_type<float>(_303);
    float _309 = _275;
    if (_241)
    {
        float _311 = rsqrt(_211);
        _305 = _311;
    }
    float _313 = _305;
    if (!_217)
    {
        _307 = 0.0;
    }
    float _315 = _307;
    float _317 = _315;
    if (_217)
    {
        float _319 = _235 * _171;
        _253 = _319;
    }
    float _321 = _253;
    if (_217)
    {
        float _323 = _235 * _165;
        _309 = _323;
    }
    float _325 = _309;
    if (_217)
    {
        float _327 = _235 * _177;
        _317 = _327;
    }
    float _329 = _317;
    float _331 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _333 = 0.0;
    float _335 = 0.0;
    float _337 = _331;
    if (!_241)
    {
        _333 = 0.0;
        _335 = 0.0;
    }
    float _339 = _333;
    float _341 = _335;
    float _343 = 0.0;
    float _345 = _339;
    float _347 = _341;
    if (!_241)
    {
        _343 = 0.0;
    }
    float _349 = _343;
    float _351 = _349;
    if (!_273)
    {
        float _353 = _331 * _331;
        float _355 = _353 * 0.5;
        _225 = _355;
    }
    float _357 = _225;
    float _359 = 0.0;
    float _361 = _357;
    if (!_219)
    {
        _359 = 0.0;
    }
    float _363 = _359;
    float _365 = _363;
    if (_219)
    {
        float _367 = _257 * _173;
        _365 = _367;
    }
    float _369 = _365;
    float _371 = 0.0;
    if (!_219)
    {
        _371 = 0.0;
    }
    float _373 = _371;
    float _375 = _373;
    if (_219)
    {
        float _377 = _257 * _167;
        _375 = _377;
    }
    float _379 = _375;
    float _381 = 0.0;
    if (!_219)
    {
        _381 = 0.0;
    }
    float _383 = _381;
    float _385 = _383;
    if (_219)
    {
        float _387 = _257 * _179;
        _385 = _387;
    }
    float _389 = _385;
    if (_241)
    {
        float _391 = _313 * _175;
        _351 = _391;
    }
    float _393 = _351;
    if (_241)
    {
        float _395 = _313 * _169;
        _345 = _395;
    }
    float _397 = _345;
    if (_241)
    {
        float _399 = _313 * _181;
        _347 = _399;
    }
    float _401 = _347;
    bool _403 = !_245;
    float _405 = _403 ? (-0.5) : 0.5;
    if (!_273)
    {
        float _407 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _361 = _407;
    }
    float _409 = _361;
    bool _411 = !_249;
    float _413 = _411 ? (-0.5) : 0.5;
    bool _415 = !_273;
    float _417 = _409;
    float _419 = _263;
    float _421 = _261;
    float _423 = _259;
    float _425 = _263;
    if (!_415)
    {
        float _427 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _429 = log2(_427);
        float _431 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _433 = _431 + 1.0;
        float _435 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _437 = _331 * _429;
        float _439 = 1.0 / _433;
        float _441 = _435 * 0.693147182464599609375;
        float _443 = exp2(_437);
        float _445 = 1.0 / _441;
        float _447 = _443 + (-1.0);
        float _449 = -_447;
        float _451 = fma(_449, _445, _331);
        float _453 = _451 * _439;
        float _455 = _453 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _417 = _455;
    }
    float _457 = _417;
    float _459 = _457 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _461 = !_273;
    float _463 = _457;
    if (!_461)
    {
        float _465 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _467 = log2(_465);
        float _469 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _471 = _469 + 1.0;
        float _473 = 1.0 / _471;
        float _475 = _331 * _467;
        float _477 = exp2(_475);
        float _479 = -_477;
        float _481 = _479 + 1.0;
        float _483 = _481 * _473;
        _337 = _483;
    }
    float _485 = _337;
    float _487 = _459 * _325;
    float _489 = _459 * _379;
    float _491 = _457 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _493 = _459 * _397;
    float _495 = 0.0;
    float _497 = _485;
    if (!_273)
    {
        float _499 = _143 * _143;
        float _501 = _499 * 0.5;
        _495 = _501;
    }
    float _503 = _495;
    float _505 = fma(_491, _321, _487);
    float _507 = fma(_491, _369, _489);
    float _509 = fma(_491, _393, _493);
    float _511 = _457 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_273)
    {
        float _513 = _503 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _463 = _513;
    }
    float _515 = _463;
    bool _517 = !_273;
    float _519 = _515;
    if (!_517)
    {
        float _521 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _523 = log2(_521);
        float _525 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _527 = _525 + 1.0;
        float _529 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _531 = _143 * _523;
        float _533 = 1.0 / _527;
        float _535 = _529 * 0.693147182464599609375;
        float _537 = exp2(_531);
        float _539 = 1.0 / _535;
        float _541 = _537 + (-1.0);
        float _543 = -_541;
        float _545 = fma(_543, _539, _143);
        float _547 = _545 * _533;
        float _549 = _547 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _519 = _549;
    }
    float _551 = _519;
    float _553 = _551 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _555 = fma(_511, _329, _505);
    float _557 = _551 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _559 = fma(_511, _389, _507);
    float _561 = _553 * _325;
    float _563 = _553 * _379;
    float _565 = _553 * _397;
    float _567 = fma(_511, _401, _509);
    float _569 = fma(_557, _321, _561);
    float _571 = fma(_557, _369, _563);
    float _573 = fma(_557, _393, _565);
    float _575 = _551 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _577 = fma(_485, _259, _555);
    float _579 = fma(_485, _261, _559);
    float _581 = fma(_485, _263, _567);
    float _583 = fma(_575, _329, _569);
    float _585 = fma(_575, _389, _571);
    float _587 = fma(_575, _401, _573);
    if (!_273)
    {
        _497 = _143;
    }
    float _589 = _497;
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
    float _617 = fma(_615, _261, _585);
    bool _619 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _621 = fma(_615, _259, _583);
    float _623 = fma(_579, _185, _189);
    float _625 = -_617;
    float _627 = _579 + _625;
    float _629 = fma(_577, _185, _187);
    float _631 = -_621;
    float _633 = _577 + _631;
    float _635 = fma(_615, _263, _587);
    float _637 = _627 * _173;
    float _639 = _627 * _167;
    float _641 = _627 * _179;
    float _643 = -_635;
    float _645 = _581 + _643;
    float _647 = fma(_633, _171, _637);
    float _649 = fma(_633, _165, _639);
    float _651 = fma(_633, _177, _641);
    float _653 = fma(_581, _185, _191);
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
    float _701 = _129 * 2.0;
    float _703 = _623 * _179;
    float _705 = in.m_51.z;
    float _707 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _709 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _711 = int(_709);
    float _713 = fma(_629, _177, _703);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _717 = _693 + _715;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _727 = float(_697);
    float _729 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _731 = int(_729);
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _737 = _693 + _735;
    float _739 = float(_107);
    float _741 = float(_711);
    float _743 = 1.0 / _727;
    float _745 = _699 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _747 = _129 + _699;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _755 = _753 != 0;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _759 = _757 != 0;
    float _761 = fma(_745, -2.0, _733);
    float _763 = float(uint(_731));
    float _765 = 1.0 / _741;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _769 = _767 != 0;
    float _771 = _747 + (-1.0);
    bool _773 = !_751;
    int _775 = _773 ? 0 : 1;
    bool _777 = !_769;
    int _779 = _777 ? 0 : 1;
    bool _781 = !_755;
    int _783 = _781 ? 0 : 1;
    float _785 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _787 = int(_785);
    float _789 = _143 * _743;
    float _791 = _699 * 2.0;
    bool _793 = !_759;
    int _795 = _793 ? 0 : 1;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _799 = _797 != 0;
    float _801 = _143 * _765;
    float _803 = 1.0 / _763;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _807 = _805 != 0;
    bool _809 = !_799;
    int _811 = _809 ? 0 : 1;
    bool _813 = !_807;
    int _815 = _813 ? 0 : 1;
    float _817 = float(uint(_787));
    float _819 = trunc(_801);
    int _821 = int(_819);
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _825 = _823 != 0;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _829 = _827 != 0;
    int _831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _833 = _831 != 0;
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _837 = _835 != 0;
    bool _839 = _129 > 0.5;
    int _841 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _843 = _841 != 0;
    float _845 = -_405;
    int _847 = _839 ? as_type<int>(_845) : as_type<int>(_405);
    float _849 = 1.0 / _817;
    int _851 = as_type<int>(_803) + (-2);
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _855 = _853 != 0;
    bool _857 = !_829;
    int _859 = _857 ? 0 : 1;
    int _861 = ~_787;
    int _863 = _861 + 1;
    float _865 = trunc(_789);
    int _867 = int(_865);
    float _869 = float(uint(_821));
    bool _871 = !_825;
    int _873 = _871 ? 0 : 1;
    bool _875 = !_833;
    int _877 = _875 ? 0 : 1;
    int _879 = abs(_811);
    float _881 = floor(_701);
    int _883 = as_type<int>(_849) + (-2);
    float _885 = 0.0;
    if (_855)
    {
        _885 = 1.0;
    }
    float _887 = _885;
    float _889 = 0.0;
    float _891 = _887;
    if (_855)
    {
        _889 = _129;
    }
    float _893 = _889;
    float _895 = as_type<float>(_883) * _869;
    float _897 = _893;
    if (!_855)
    {
        _891 = 1.2345600128173828125;
    }
    float _899 = _891;
    float _901 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _903 = log2(_901);
    float _905 = float(uint(_867));
    if (!_855)
    {
        _897 = _699;
    }
    float _907 = _897;
    int _909 = abs(_783);
    float _911 = as_type<float>(_851) * _905;
    int _913 = abs(_795);
    float _915 = floor(_791);
    bool _917 = _881 > 0.0;
    float _919 = _899 * _907;
    int _921 = abs(_877);
    float _923 = trunc(_895);
    float _925 = precise::max(_923, 0.0);
    uint _928 = uint(_925);
    bool _930 = !_843;
    float _932 = _930 ? _405 : as_type<float>(_847);
    float _934 = _705 * 2.0;
    bool _936 = _881 >= 0.0;
    bool _938 = isnan(_881);
    bool _940 = _936 || _938;
    bool _942 = isnan(0.0);
    bool _944 = _940 || _942;
    float _946 = _143 * _903;
    int _948 = ~_731;
    int _950 = _948 + 1;
    float _952 = _932 + 0.5;
    float _954 = trunc(_911);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    bool _960 = _915 > 0.0;
    float _962 = floor(_934);
    int _964 = _944 ? 0 : 1;
    bool _966 = _915 >= 0.0;
    bool _968 = isnan(_915);
    bool _970 = _966 || _968;
    bool _972 = isnan(0.0);
    bool _974 = _970 || _972;
    int _976 = ~_964;
    int _978 = _976 + 1;
    int _980 = _978 + 1;
    int _982 = _980;
    float _984 = _946;
    if (!_917)
    {
        int _986 = ~_964;
        int _988 = _986 + 1;
        _982 = _988;
    }
    int _990 = _982;
    int _992 = _950 * int(_958);
    int _994 = _992 + _867;
    float _996 = exp2(_946);
    bool _998 = _699 > 0.5;
    float _1000 = float(uint(_994));
    int _1002 = _863 * int(_928);
    int _1004 = _1002 + _821;
    float _1006 = -_413;
    int _1008 = _998 ? as_type<int>(_1006) : as_type<int>(_413);
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1012 = _1010 != 0;
    float _1014 = as_type<float>(_851) * _1000;
    float _1016 = float(uint(_1004));
    float _1018 = 1.0 / _721;
    int _1020 = _1004;
    if (_855)
    {
        _984 = 1.0;
    }
    float _1022 = _984;
    float _1024 = as_type<float>(_883) * _1016;
    float _1026 = _1022;
    if (_855)
    {
        _1020 = 0;
    }
    int _1028 = _1020;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1032 = 1.0 + _1030;
    int _1034 = _974 ? 0 : 1;
    float _1036 = trunc(_1014);
    float _1038 = precise::max(_1036, 0.0);
    uint _1040 = uint(_1038);
    int _1042 = _1028;
    if (!_855)
    {
        _1026 = 7.345489978790283203125;
    }
    float _1044 = _1026;
    float _1046 = -_996;
    float _1048 = _1046 + 1.0;
    if (!_855)
    {
        _1042 = 1;
    }
    int _1050 = _1042;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1054 = _1052 != 0;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1058 = _1056 != 0;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1062 = _1060 != 0;
    float _1064 = _1044 * _129;
    bool _1066 = !_1012;
    float _1068 = _1066 ? _413 : as_type<float>(_1008);
    float _1070 = trunc(_1024);
    float _1072 = precise::max(_1070, 0.0);
    uint _1074 = uint(_1072);
    bool _1076 = _962 > 0.0;
    float _1078 = _717 * _1018;
    int _1080 = ~_1034;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    int _1086 = _1084;
    if (!_960)
    {
        int _1088 = ~_1034;
        int _1090 = _1088 + 1;
        _1086 = _1090;
    }
    int _1092 = _1086;
    bool _1094 = _962 >= 0.0;
    bool _1096 = isnan(_962);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(0.0);
    bool _1102 = _1098 || _1100;
    float _1104 = 1.0 / _1032;
    int _1106 = int(_958) + int(_1040);
    int _1108 = _1102 ? 0 : 1;
    bool _1110 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1118 = _1114 || _1116;
    int _1120 = ~_1108;
    int _1122 = _1120 + 1;
    int _1124 = _1122 + 1;
    float _1126 = 1.0 / _725;
    int _1128 = _1124;
    if (!_1076)
    {
        int _1130 = ~_1108;
        int _1132 = _1130 + 1;
        _1128 = _1132;
    }
    int _1134 = _1128;
    float _1136 = in.m_51.w;
    float _1138 = _1118 ? _1048 : 0.0;
    int _1140 = ~_731;
    int _1142 = _1140 + 1;
    int _1144 = ~_787;
    int _1146 = _1144 + 1;
    float _1148 = _1138 * _1104;
    int _1150 = int(_928) + int(_1074);
    int _1152 = _1142 * _1106;
    int _1154 = _1152 + _867;
    bool _1156 = _1050 != 1;
    float _1158 = _623 * _167;
    int _1160 = _1146 * _1150;
    int _1162 = _1160 + _821;
    bool _1164 = uint(_1154) >= uint(_731);
    float _1166 = fma(_629, _165, _1158);
    bool _1168 = !_1062;
    int _1170 = _1168 ? 0 : 1;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1172;
    bool _1176 = uint(_1162) >= uint(_787);
    float _1178 = _737 * _1126;
    bool _1180 = !_1164;
    int _1182 = _1180 ? 0 : (-1);
    float _1184 = 1.0 / _739;
    bool _1186 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1188 = isnan(1.0);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1194 = _1190 || _1192;
    float _1196 = 0.0;
    if (!_1156)
    {
        _1196 = _699;
    }
    float _1198 = _1196;
    float _1200 = 0.0;
    float _1202 = _1198;
    if (!_1156)
    {
        _1200 = _699;
    }
    float _1204 = _1200;
    float _1206 = 0.0;
    float _1208 = _1204;
    if (!_1156)
    {
        _1206 = _705;
    }
    float _1210 = _1206;
    float _1212 = 1.0 / _1174;
    float _1214 = 0.0;
    float _1216 = _1210;
    if (!_1156)
    {
        _1214 = _705;
    }
    float _1218 = _1214;
    bool _1220 = !_1054;
    int _1222 = _1220 ? 0 : 1;
    float _1224 = _1218;
    if (_1156)
    {
        _1202 = _129;
    }
    float _1226 = _1202;
    if (_1156)
    {
        _1208 = _129;
    }
    float _1228 = _1208;
    float _1230 = _143 * _1184;
    if (_1156)
    {
        _1216 = _699;
    }
    float _1232 = _1216;
    if (_1156)
    {
        _1224 = _699;
    }
    float _1234 = _1224;
    bool _1236 = !_1176;
    int _1238 = _1236 ? 0 : (-1);
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1242 = _1240 != 0;
    int _1244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1246 = _1244 != 0;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1250 = _1248 != 0;
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1254 = _1252 != 0;
    float _1256 = _623 * _173;
    bool _1258 = !_1194;
    float _1260 = _1258 ? _143 : _1148;
    bool _1262 = _1136 > 0.5;
    float _1264 = fma(_629, _171, _1256);
    float _1266 = in.m_57.w;
    float _1268 = fma(_653, _175, _1264);
    float _1270 = in.m_55.w;
    float _1272 = fma(_653, _169, _1166);
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1276 = in.m_59.w;
    float _1278 = _129 + _705;
    float _1280 = -_1274;
    float _1282 = fma(_707, 2.0, _1280);
    float _1284 = fma(_653, _181, _713);
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1288 = _693 + _1286;
    float _1290 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1292 = _1278 + (-1.0);
    float _1294 = _1288 * _1212;
    float _1296 = _705 + _699;
    float _1298 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1300 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1302 = isnan(_693);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1308 = _1304 || _1306;
    float _1310 = float(_1308);
    float _1312 = -_143;
    float _1314 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1282);
    float _1316 = _1296 + (-1.0);
    float _1318 = _1268 + _1266;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1320;
    float _1324 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1326;
    bool _1330 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1332 = isnan(_693);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = _1272 + _1270;
    float _1344 = fma(_1322, _1078, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1350 = _1284 + _1276;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1354 = _1352 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1356 = fma(_1328, _1078, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1358 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1360 = isnan(_693);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    float _1370 = -_1340;
    float _1372 = _1370 + 1.0;
    float _1374 = fma(_1354, _1178, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1376 = fma(_1348, _1178, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _1378 = _693 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1380 = isnan(_693);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = _1368 * _1372;
    float _1392 = -_1368;
    float _1394 = _1392 + 1.0;
    float _1396 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1314);
    float _1398 = _1388 * _1394;
    float _1400 = -_1388;
    float _1402 = _1400 + 1.0;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1404;
    float _1408 = floor(_1064);
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1410;
    float _1414 = _1310 * _1402;
    float _1416 = fma(_1406, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1418 = -_1310;
    float _1420 = _1418 + 1.0;
    float _1422 = fma(_1412, _1294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1424 = _1344 * _1414;
    float _1426 = _1356 * _1414;
    float _1428 = floor(_919);
    float _1430 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _761);
    float _1432 = _1068 + (-0.5);
    float _1434 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1424);
    float _1436 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1426);
    bool _1438 = !_1058;
    int _1440 = _1438 ? 0 : 1;
    float _1442 = -_1432;
    float _1444 = -_1430;
    float _1446 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1444);
    float _1448 = fma(_1374, _1398, _1434);
    float _1450 = -_1408;
    float _1452 = _1064 + _1450;
    float _1454 = fma(_1376, _1398, _1436);
    float _1456 = float(_787);
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1460 = fma(_1416, _1390, _1448);
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1464 = float(_867);
    float _1466 = -_1428;
    float _1468 = _919 + _1466;
    float _1470 = float(_821);
    float _1472 = _1230 * _1456;
    float _1474 = float(_731);
    float _1476 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1460);
    bool _1478 = _1470 >= _1456;
    bool _1480 = isnan(_1470);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan(_1456);
    bool _1486 = _1482 || _1484;
    float _1488 = float(_1486);
    float _1490 = _1468 * _1456;
    float _1492 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1458);
    float _1494 = fma(_1422, _1390, _1454);
    int _1496 = abs(_1222);
    float _1498 = in.m_66.x;
    float _1500 = in.m_66.y;
    float _1502 = in.m_66.z;
    bool _1504 = _1464 >= _1474;
    bool _1506 = isnan(_1464);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan(_1474);
    bool _1512 = _1508 || _1510;
    float _1514 = float(_1512);
    float _1516 = _1452 * _1474;
    float _1518 = _1230 * _1474;
    float _1520 = fma(_1234, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1462);
    float _1522 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1524 = abs(_1440);
    float _1526 = trunc(_1516);
    int _1528 = int(_1526);
    int _1530 = abs(_1170);
    float _1532 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1534 = float(_1496);
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1538 = float(_1134);
    float _1540 = float(_990);
    float _1542 = trunc(_1514);
    int _1544 = int(_1542);
    float _1546 = float(_1524);
    float _1548 = -_1536;
    float _1550 = fma(_1532, 2.0, _1548);
    float _1552 = float(_1530);
    float _1554 = _1534 * _1538;
    float _1556 = float(_1092);
    float _1558 = _1546 * _1540;
    float _1560 = _1554 * (-2.0);
    float _1562 = _1552 * _1556;
    float _1564 = _1558 * (-2.0);
    float _1566 = fma(_1290, _1560, _1290);
    float _1568 = fma(_1560, _1498, _1498);
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1572 = fma(_1324, _1564, _1324);
    float _1574 = fma(_1564, _1500, _1500);
    int _1576 = ~_1106;
    int _1578 = _1576 + _1182;
    int _1580 = _1578 + 1;
    float _1582 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1570);
    float _1584 = _129 + (-0.5);
    float _1586 = trunc(_1488);
    int _1588 = int(_1586);
    int _1590 = _1528 * _879;
    int _1592 = _1590 + _867;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1596 = fma(_1584, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1568);
    int _1598 = _731 * _1580;
    int _1600 = _1598 + _867;
    int _1602 = ~_1150;
    int _1604 = _1602 + _1238;
    int _1606 = _1604 + 1;
    float _1608 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1594);
    float _1610 = fma(_1260, _1566, _1596);
    bool _1612 = !_837;
    int _1614 = _1612 ? 0 : 1;
    float _1616 = _699 + (-0.5);
    bool _1618 = _705 > 0.5;
    float _1620 = trunc(_1518);
    int _1622 = int(_1620);
    float _1624 = float(uint(_1592));
    float _1626 = _1562 * (-2.0);
    float _1628 = -_405;
    int _1630 = _1618 ? as_type<int>(_1628) : as_type<int>(_405);
    float _1632 = _1610 * 0.15915493667125701904296875;
    bool _1634 = _731 == 0;
    float _1636 = fma(_1626, _1502, _1502);
    int _1638 = abs(_815);
    int _1640 = _787 * _1606;
    int _1642 = _1640 + _821;
    int _1644 = ~_1544;
    int _1646 = _1644 + 1;
    int _1648 = _1646 + 1;
    float _1650 = trunc(_1490);
    int _1652 = int(_1650);
    bool _1654 = !_1634;
    int _1656 = _1654 ? _1600 : (-1);
    float _1658 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1574);
    bool _1660 = !_1250;
    float _1662 = _1660 ? _405 : as_type<float>(_1630);
    float _1664 = as_type<float>(_851) * _1624;
    bool _1666 = _787 == 0;
    int _1668 = _1656 * _1648;
    int _1670 = _731 + (-1);
    float _1672 = trunc(_1472);
    int _1674 = int(_1672);
    int _1676 = ~_1588;
    int _1678 = _1676 + 1;
    int _1680 = _1678 + 1;
    float _1682 = fma(_1260, _1572, _1658);
    bool _1684 = !_1666;
    int _1686 = _1684 ? _1642 : (-1);
    int _1688 = _1544 * _1670;
    int _1690 = _1688 + _1668;
    float _1692 = _705 + (-0.5);
    int _1694 = abs(_775);
    int _1696 = _1686 * _1680;
    int _1698 = _787 + (-1);
    int _1700 = _1690 * _909;
    int _1702 = _1652 * _1638;
    int _1704 = _1702 + _821;
    int _1706 = abs(_859);
    int _1708 = _1588 * _1698;
    int _1710 = _1708 + _1696;
    int _1712 = abs(_779);
    int _1714 = _1622 * _1694;
    int _1716 = _1714 + _1700;
    float _1718 = trunc(_1664);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = abs(_873);
    int _1726 = _1592 * _913;
    int _1728 = _1726 + _1716;
    float _1730 = fma(_1298, _1626, _1298);
    float _1732 = float(uint(_1704));
    int _1734 = _1528 * _1712;
    int _1736 = _1734 + _1728;
    float _1738 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1494);
    float _1740 = as_type<float>(_883) * _1732;
    float _1742 = _1632 * 6.283185482025146484375;
    float _1744 = sin(_1742);
    float _1746 = float(uint(_1736));
    int _1748 = _1710 * _1706;
    float _1750 = as_type<float>(_851) * _1746;
    int _1752 = _1674 * _1724;
    int _1754 = _1752 + _1748;
    float _1756 = trunc(_1740);
    float _1758 = precise::max(_1756, 0.0);
    uint _1760 = uint(_1758);
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1764 = abs(_1614);
    float _1766 = in.m_64.x;
    float _1768 = in.m_64.y;
    int _1770 = _1704 * _921;
    int _1772 = _1770 + _1754;
    float _1774 = fma(_1522, -2.0, _1762);
    float _1776 = trunc(_1750);
    float _1778 = precise::max(_1776, 0.0);
    uint _1780 = uint(_1778);
    float _1782 = _1682 * 0.15915493667125701904296875;
    float _1784 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1636);
    int _1786 = _1652 * _1764;
    int _1788 = _1786 + _1772;
    float _1790 = -_143;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1550);
    float _1794 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1774);
    float _1796 = fma(_1260, _1730, _1784);
    int _1798 = ~_731;
    int _1800 = _1798 + 1;
    float _1802 = _1632 * 6.283185482025146484375;
    float _1804 = cos(_1802);
    float _1806 = _1796 * 0.15915493667125701904296875;
    float _1808 = -_413;
    int _1810 = _1262 ? as_type<int>(_1808) : as_type<int>(_413);
    int _1812 = _1800 * int(_1722);
    int _1814 = _1812 + _1592;
    float _1816 = _1662 + 0.5;
    bool _1818 = !_1254;
    float _1820 = _1818 ? _413 : as_type<float>(_1810);
    float _1822 = _1782 * 6.283185482025146484375;
    float _1824 = sin(_1822);
    int _1826 = ~_731;
    int _1828 = _1826 + 1;
    float _1830 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1792);
    float _1832 = float(uint(_1814));
    float _1834 = _1820 + (-0.5);
    float _1836 = _1476 * _1766;
    int _1838 = _1828 * int(_1780);
    int _1840 = _1838 + _1736;
    float _1842 = float(uint(_1788));
    float _1844 = as_type<float>(_851) * _1832;
    float _1846 = -_1834;
    float _1848 = -_1794;
    float _1850 = fma(_1846, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1848);
    int _1852 = ~_787;
    int _1854 = _1852 + 1;
    float _1856 = _1782 * 6.283185482025146484375;
    float _1858 = cos(_1856);
    float _1860 = float(uint(_1840));
    float _1862 = as_type<float>(_883) * _1842;
    float _1864 = _1738 * _1768;
    float _1866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _405);
    float _1868 = as_type<float>(_851) * _1860;
    float _1870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _413);
    float _1872 = _1806 * 6.283185482025146484375;
    float _1874 = cos(_1872);
    int _1876 = _1854 * int(_1760);
    int _1878 = _1876 + _1704;
    float _1880 = _1836 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1882 = _1864 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1884 = float(uint(_1878));
    float _1886 = _1880 * _1866;
    float _1888 = trunc(_1862);
    float _1890 = precise::max(_1888, 0.0);
    uint _1892 = uint(_1890);
    float _1894 = _1882 * _1870;
    float _1896 = _1744 * _1824;
    float _1898 = _1744 * _1858;
    float _1900 = as_type<float>(_883) * _1884;
    float _1902 = _1804 * _1858;
    float _1904 = _1806 * 6.283185482025146484375;
    float _1906 = sin(_1904);
    float _1908 = _1744 * _1874;
    float _1910 = _1804 * _1824;
    float _1912 = _1858 * _1874;
    float _1914 = _1804 * _1874;
    float _1916 = _1824 * _1874;
    float _1918 = trunc(_1868);
    float _1920 = precise::max(_1918, 0.0);
    uint _1922 = uint(_1920);
    float _1924 = _1914 * _1894;
    float _1926 = trunc(_1844);
    float _1928 = precise::max(_1926, 0.0);
    uint _1930 = uint(_1928);
    float _1932 = -_1910;
    float _1934 = fma(_1906, _1898, _1932);
    float _1936 = -_1898;
    float _1938 = fma(_1906, _1910, _1936);
    float _1940 = fma(_1906, _1902, _1896);
    float _1942 = trunc(_1900);
    float _1944 = precise::max(_1942, 0.0);
    uint _1946 = uint(_1944);
    int _1948 = ~_787;
    int _1950 = _1948 + 1;
    int _1952 = int(_1780) + int(_1922);
    float _1954 = fma(_1906, _1896, _1902);
    int _1956 = ~_787;
    int _1958 = _1956 + 1;
    int _1960 = _1950 * int(_1892);
    int _1962 = _1960 + _1788;
    int _1964 = int(_1722) + int(_1930);
    int _1966 = ~_731;
    int _1968 = _1966 + 1;
    float _1970 = float(uint(_1962));
    float _1972 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1974 = _1968 * _1952;
    int _1976 = _1974 + _1736;
    float _1978 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1980 = as_type<float>(_883) * _1970;
    float _1982 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1984 = -_1906;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1972);
    bool _1988 = uint(_1976) >= uint(_731);
    float _1990 = -_1906;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1978);
    float _1994 = -_1906;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1982);
    float _1998 = trunc(_1980);
    float _2000 = precise::max(_1998, 0.0);
    uint _2002 = uint(_2000);
    float _2004 = -_1894;
    float _2006 = _1906 * _2004;
    bool _2008 = !_1988;
    int _2010 = _2008 ? 0 : (-1);
    float _2012 = _1908 * _1894;
    float _2014 = fma(_1940, _1886, _1924);
    float _2016 = fma(_1912, _1886, _2006);
    int _2018 = ~_1952;
    int _2020 = _2018 + _2010;
    int _2022 = _2020 + 1;
    float _2024 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2026 = fma(_1934, _1886, _2012);
    float _2028 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2030 = _1940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2032 = _731 * _2022;
    int _2034 = _2032 + _1736;
    float _2036 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2024);
    float _2038 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1996);
    float _2040 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1986);
    float _2042 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1992);
    int _2044 = int(_1892) + int(_2002);
    float _2046 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2028);
    bool _2048 = !_1634;
    int _2050 = _2048 ? _2034 : (-1);
    float _2052 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2030);
    float _2054 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2056 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2058 = _2050 & 3;
    bool _2060 = _2058 != 0;
    float _2062 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2064 = _1938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2066 = ~_731;
    int _2068 = _2066 + 1;
    float _2070 = fma(_1916, _2054, _2016);
    bool _2072 = uint(_2058) > 1u;
    float _2074 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2056);
    int _2076 = int(_1760) + int(_1946);
    float _2078 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2062);
    bool _2080 = !_2060;
    int _2082 = _2080 ? 0 : 1;
    float _2084 = fma(_1916, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2064);
    int _2086 = _2050 & 3;
    bool _2088 = _2086 != 0;
    float _2090 = fma(_1938, _2054, _2014);
    int _2092 = _1958 * _2044;
    int _2094 = _2092 + _1788;
    int _2096 = _2088 ? 0 : 1;
    float _2098 = fma(_1954, _2054, _2026);
    int _2100 = ~_787;
    int _2102 = _2100 + 1;
    int _2104 = _2068 * _1964;
    int _2106 = _2104 + _1592;
    bool _2108 = uint(_2094) >= uint(_787);
    float _2110 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2074);
    int _2112 = ~_2096;
    int _2114 = _2112 + 1;
    int _2116 = _2114 + 1;
    float _2118 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2078);
    int _2120 = _2116;
    if (!_2072)
    {
        int _2122 = ~_2096;
        int _2124 = _2122 + 1;
        _2120 = _2124;
    }
    int _2126 = _2120;
    float _2128 = _2090 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2130 = uint(_2106) >= uint(_731);
    float _2132 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2084);
    bool _2134 = !_2108;
    int _2136 = _2134 ? 0 : (-1);
    float _2138 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2128);
    float _2140 = _2090 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2142 = ~_2044;
    int _2144 = _2142 + _2136;
    int _2146 = _2144 + 1;
    float _2148 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2138);
    bool _2150 = uint(_2058) >= 2u;
    float _2152 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2140);
    float _2154 = _2090 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2156 = _787 * _2146;
    int _2158 = _2156 + _1788;
    float _2160 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2162 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2152);
    float _2164 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2154);
    int _2166 = _2050 >> 31;
    float _2168 = _1350 + _2160;
    bool _2170 = !_1666;
    int _2172 = _2170 ? _2158 : (-1);
    float _2174 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _2176 = _2166 & 3;
    float _2178 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2180 = _2168 + _2178;
    int _2182 = _2172 >> 31;
    float _2184 = _1318 + _2174;
    int _2186 = _2050 + _2176;
    float _2188 = _2180 * _2180;
    int _2190 = _2182 & 3;
    float _2192 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2194 = _2184 + _2192;
    int _2196 = _2186 >> 2;
    int _2198 = _2102 * _2076;
    int _2200 = _2198 + _1704;
    int _2202 = _2172 + _2190;
    float _2204 = fma(_2194, _2194, _2188);
    int _2206 = _2196 << 4;
    int _2208 = _2206 + 368;
    float _2210 = _413 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2212 = _2202 >> 2;
    float _2214 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2164);
    int _2216 = _2208 + 8;
    uint _2218 = uint(int(uint(_2216) >> uint(2)));
    uint _2220 = uint(int(uint(int(_2218)) >> uint(2)));
    int _2222 = int(_2218) & 3;
    float _2224 = (*spvDescriptorSet0.vp_c9)._m0[int(_2220)][_2222];
    int _2226 = int(_2218) + 1;
    uint _2228 = uint(int(uint(_2226) >> uint(2)));
    int _2230 = _2226 & 3;
    float _2232 = (*spvDescriptorSet0.vp_c9)._m0[int(_2228)][_2230];
    int _2234 = _2150 ? 0 : 1;
    float _2236 = _405 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2238 = _2212 << 4;
    int _2240 = _2238 + 512;
    float _2242 = _2210 * _2038;
    bool _2244 = uint(_2200) >= uint(_787);
    float _2246 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2046);
    float _2248 = sqrt(_2204);
    uint _2250 = uint(int(uint(_2208) >> uint(2)));
    uint _2252 = uint(int(uint(int(_2250)) >> uint(2)));
    int _2254 = int(_2250) & 3;
    float _2256 = (*spvDescriptorSet0.vp_c9)._m0[int(_2252)][_2254];
    int _2258 = int(_2250) + 1;
    uint _2260 = uint(int(uint(_2258) >> uint(2)));
    int _2262 = _2258 & 3;
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[int(_2260)][_2262];
    bool _2266 = !_2130;
    int _2268 = _2266 ? 0 : (-1);
    float _2270 = _2210 * _2042;
    bool _2272 = _2058 != 3;
    int _2274 = ~_2234;
    int _2276 = _2274 + 1;
    int _2278 = _2276 + 1;
    int _2280 = ~_1964;
    int _2282 = _2280 + _2268;
    int _2284 = _2282 + 1;
    uint _2286 = uint(int(uint(_2240) >> uint(2)));
    uint _2288 = uint(int(uint(int(_2286)) >> uint(2)));
    int _2290 = int(_2286) & 3;
    float _2292 = (*spvDescriptorSet0.vp_c9)._m0[int(_2288)][_2290];
    int _2294 = int(_2286) + 1;
    uint _2296 = uint(int(uint(_2294) >> uint(2)));
    int _2298 = _2294 & 3;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[int(_2296)][_2298];
    float _2302 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2036);
    bool _2304 = !_2244;
    int _2306 = _2304 ? 0 : (-1);
    float _2308 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2052);
    int _2310 = _2172 & 3;
    bool _2312 = _2310 != 0;
    float _2314 = fma(_2236, _2302, _2242);
    int _2316 = ~_2076;
    int _2318 = _2316 + _2306;
    int _2320 = _2318 + 1;
    int _2322 = _731 * _2284;
    int _2324 = _2322 + _1592;
    int _2326 = _2240 + 8;
    uint _2328 = uint(int(uint(_2326) >> uint(2)));
    uint _2330 = uint(int(uint(int(_2328)) >> uint(2)));
    int _2332 = int(_2328) & 3;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[int(_2330)][_2332];
    int _2336 = int(_2328) + 1;
    uint _2338 = uint(int(uint(_2336) >> uint(2)));
    int _2340 = _2336 & 3;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[int(_2338)][_2340];
    int _2344 = _2278;
    float _2346 = _2168;
    float _2348 = _2184;
    float _2350 = _2246;
    float _2352 = _2302;
    float _2354 = _2246;
    if (_2272)
    {
        int _2356 = ~_2234;
        int _2358 = _2356 + 1;
        _2344 = _2358;
    }
    int _2360 = _2344;
    float _2362 = _2210 * _2040;
    bool _2364 = _2248 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2366 = _787 * _2320;
    int _2368 = _2366 + _1704;
    int _2370 = _2172 & 3;
    bool _2372 = _2370 != 0;
    float _2374 = fma(_2236, _2246, _2362);
    float _2376 = _2214 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2378 = _2312 ? 0 : 1;
    float _2380 = fma(_2236, _2308, _2270);
    bool _2382 = uint(_2370) >= 2u;
    float _2384 = _1342 + _2376;
    bool _2386 = !_2372;
    int _2388 = _2386 ? 0 : 1;
    int _2390 = _2382 ? 0 : 1;
    bool _2392 = uint(_2370) > 1u;
    int _2394 = ~_2378;
    int _2396 = _2394 + 1;
    int _2398 = _2396 + 1;
    int _2400 = ~_2390;
    int _2402 = _2400 + 1;
    int _2404 = _2402 + 1;
    bool _2406 = _2370 != 3;
    bool _2408 = !_2364;
    float _2410 = _2384;
    int _2412 = _2398;
    int _2414 = _2404;
    if (!_2408)
    {
        float _2416 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2420 = _2248 + _2418;
        float _2422 = rsqrt(_2204);
        float _2424 = _2420 * _2416;
        float _2426 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2428 = _2424 * 0.15915493667125701904296875;
        float _2430 = _2428 * 6.283185482025146484375;
        float _2432 = cos(_2430);
        float _2434 = _2428 * 6.283185482025146484375;
        float _2436 = sin(_2434);
        float _2438 = _2432 + (-1.0);
        float _2440 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2442 = fma(_2436, _2426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2444 = fma(_2384, _2432, _2440);
        float _2446 = _2422 * _2442;
        float _2448 = fma(_2194, _2446, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2450 = fma(_2180, _2446, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2346 = _2450;
        _2410 = _2444;
        _2348 = _2448;
    }
    float _2452 = _2346;
    float _2454 = _2410;
    float _2456 = _2348;
    float _2458 = _2456;
    float _2460 = _2454;
    float _2462 = _2452;
    if (!_2392)
    {
        int _2464 = ~_2378;
        int _2466 = _2464 + 1;
        _2412 = _2466;
    }
    int _2468 = _2412;
    float _2470 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1582);
    int _2472 = abs(_2126);
    float _2474 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1608);
    int _2476 = abs(_2082);
    float _2478 = -_2470;
    float _2480 = _2478 + 1.0;
    int _2482 = abs(_2468);
    float _2484 = -_2474;
    float _2486 = _2484 + 1.0;
    int _2488 = abs(_2388);
    float _2490 = -_2480;
    float _2492 = fma(_932, _2490, _1396);
    float _2494 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1492);
    int _2496 = ~_2472;
    int _2498 = _2496 + 1;
    int _2500 = _2498 + 1;
    float _2502 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1520);
    int _2504 = ~_2482;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    float _2510 = fma(_1068, _2486, _1446);
    int _2512 = abs(_2360);
    int _2514 = _2500 * as_type<int>(_2264);
    int _2516 = ~_2476;
    int _2518 = _2516 + 1;
    int _2520 = _2518 + 1;
    int _2522 = _2508 * as_type<int>(_2300);
    bool _2524 = _2058 != 3;
    out.m_68.x = _2302;
    out.m_68.y = _2246;
    out.m_68.z = _2308;
    int _2526 = ~_2488;
    int _2528 = _2526 + 1;
    int _2530 = _2528 + 1;
    int _2532 = _2520 * as_type<int>(_2256);
    int _2534 = _2532 + _2514;
    float _2536 = _2510;
    if (_2406)
    {
        int _2538 = ~_2390;
        int _2540 = _2538 + 1;
        _2414 = _2540;
    }
    int _2542 = _2414;
    int _2544 = ~_2512;
    int _2546 = _2544 + 1;
    int _2548 = _2546 + 1;
    int _2550 = _2530 * as_type<int>(_2292);
    int _2552 = _2550 + _2522;
    bool _2554 = !_2524;
    int _2556 = _2554 ? 0 : (-1);
    bool _2558 = _2370 != 3;
    int _2560 = _2548 * as_type<int>(_2224);
    int _2562 = _2560 + _2534;
    int _2564 = abs(_2542);
    bool _2566 = !_1242;
    int _2568 = _2566 ? 0 : 1;
    int _2570 = abs(_2556);
    bool _2572 = !_2558;
    int _2574 = _2572 ? 0 : (-1);
    int _2576 = abs(_2568);
    int _2578 = abs(_2574);
    int _2580 = ~_2564;
    int _2582 = _2580 + 1;
    int _2584 = _2582 + 1;
    bool _2586 = !_1246;
    int _2588 = _2586 ? 0 : 1;
    int _2590 = ~_2570;
    int _2592 = _2590 + 1;
    int _2594 = _2592 + 1;
    int _2596 = _2584 * as_type<int>(_2334);
    int _2598 = _2596 + _2552;
    float _2600 = fma(_2210, _2210, 1.0);
    int _2602 = abs(_2588);
    int _2604 = _2594 * as_type<int>(_2232);
    int _2606 = _2604 + _2562;
    int _2608 = ~_2576;
    int _2610 = _2608 + 1;
    int _2612 = _2610 + 1;
    int _2614 = ~_2578;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    int _2620 = _2606 * _2612;
    bool _2622 = !_1634;
    int _2624 = _2622 ? _2324 : (-1);
    int _2626 = _2618 * as_type<int>(_2342);
    int _2628 = _2626 + _2598;
    float _2630 = rsqrt(_2600);
    int _2632 = ~_2602;
    int _2634 = _2632 + 1;
    int _2636 = _2634 + 1;
    float _2638 = -_1350;
    float _2640 = _2638 + _2452;
    bool _2642 = !_1666;
    int _2644 = _2642 ? _2368 : (-1);
    float _2646 = -_2502;
    float _2648 = _2646 + 1.0;
    int _2650 = _2628 * _2636;
    int _2652 = _2624 * _2576;
    int _2654 = _2652 + _2620;
    float _2656 = -_1342;
    float _2658 = _2656 + _2454;
    float _2660 = -_1318;
    float _2662 = _2660 + _2456;
    int _2664 = _2644 * _2602;
    int _2666 = _2664 + _2650;
    float _2668 = -_2494;
    float _2670 = _2668 + 1.0;
    float _2672 = _2658 * _2658;
    float _2674 = fma(_1820, _2648, _1850);
    float _2676 = float(_2654);
    float _2678 = _2210 * _2630;
    float _2680 = fma(_2662, _2662, _2672);
    float _2682 = -_2670;
    float _2684 = fma(_1662, _2682, _1830);
    float _2686 = float(_2666);
    float _2688 = -_2110;
    float _2690 = _2678 * _2688;
    float _2692 = fma(_2640, _2640, _2680);
    float _2694 = -_2118;
    float _2696 = _2678 * _2694;
    float _2698 = -_2132;
    float _2700 = _2678 * _2698;
    float _2702 = fma(_2630, _2038, _2690);
    float _2704 = sqrt(_2692);
    float _2706 = fma(_2630, _2040, _2696);
    float _2708 = fma(_2630, _2042, _2700);
    float _2710 = _2110 + _2314;
    float _2712 = _2118 + _2374;
    float _2714 = _2132 + _2380;
    out.m_70.x = _2492;
    out.m_70.y = _2510;
    out.m_70.z = _2684;
    out.m_70.w = _2674;
    out.m_72.x = _2702;
    out.m_72.y = _2706;
    out.m_72.z = _2708;
    out.m_74.x = _2676;
    out.m_74.y = _2686;
    bool _2716 = _2704 > 0.0;
    out.m_76.x = _2710;
    out.m_76.y = _2712;
    out.m_76.z = _2714;
    bool _2718 = !_2716;
    if (!_2718)
    {
        bool _2720 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2722 = _2674;
        if (_2720)
        {
            float _2724 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2722 = _2724;
        }
        float _2726 = _2722;
        if (_2720)
        {
            float _2728 = _655 * _2726;
            _2536 = _2728;
        }
        float _2730 = _2536;
        float _2732 = _2730;
        if (_2720)
        {
            float _2734 = _657 * _2726;
            _2350 = _2734;
        }
        float _2736 = _2350;
        float _2738 = _2736;
        if (_2720)
        {
            float _2740 = _659 * _2726;
            _2352 = _2740;
        }
        float _2742 = _2352;
        float _2744 = _2742;
        if (!_2720)
        {
            bool _2746 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2748 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2750 = _2746 || _2748;
            bool _2752 = isnan(1.0);
            bool _2754 = _2750 || _2752;
            float _2756 = _143 + 1.0;
            float _2758 = _2756;
            if (!_2754)
            {
                float _2760 = _2756 * _2756;
                float _2762 = _2760 * 0.5;
                _145 = _2762;
            }
            float _2764 = _145;
            float _2766 = _2764;
            if (!_2754)
            {
                float _2768 = _2764 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2766 = _2768;
            }
            float _2770 = _2766;
            bool _2772 = !_2754;
            float _2774 = _2770;
            if (!_2772)
            {
                float _2776 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2778 = log2(_2776);
                float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2782 = 1.0 + _2780;
                float _2784 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2786 = _2778 * _2756;
                float _2788 = 1.0 / _2782;
                float _2790 = _2784 * 0.693147182464599609375;
                float _2792 = exp2(_2786);
                float _2794 = 1.0 / _2790;
                float _2796 = _2792 + (-1.0);
                float _2798 = -_2796;
                float _2800 = fma(_2798, _2794, _2756);
                float _2802 = _2800 * _2788;
                float _2804 = _2802 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2774 = _2804;
            }
            float _2806 = _2774;
            float _2808 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2810 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2812 = _2806 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2814 = _2806;
            if (!_2754)
            {
                _2814 = _2756;
            }
            float _2816 = _2814;
            float _2818 = _2808 * _379;
            float _2820 = _2808 * _325;
            float _2822 = _2808 * _397;
            float _2824 = fma(_2810, _369, _2818);
            float _2826 = fma(_2810, _321, _2820);
            float _2828 = fma(_2812, _389, _2824);
            bool _2830 = !_2754;
            float _2832 = _2816;
            if (!_2830)
            {
                float _2834 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2836 = log2(_2834);
                float _2838 = _2836 * _2756;
                float _2840 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2842 = 1.0 + _2840;
                float _2844 = exp2(_2838);
                float _2846 = 1.0 / _2842;
                float _2848 = -_2844;
                float _2850 = _2848 + 1.0;
                float _2852 = _2850 * _2846;
                _2832 = _2852;
                _2758 = _2842;
            }
            float _2854 = _2832;
            float _2856 = _2758;
            float _2858 = fma(_2810, _393, _2822);
            float _2860 = fma(_2812, _329, _2826);
            float _2862 = fma(_2854, _261, _2828);
            float _2864 = fma(_2812, _401, _2858);
            float _2866 = fma(_2854, _259, _2860);
            float _2868 = -_617;
            float _2870 = _2868 + _2862;
            float _2872 = fma(_2854, _263, _2864);
            float _2874 = -_621;
            float _2876 = _2874 + _2866;
            float _2878 = _2870 * _173;
            float _2880 = _2870 * _167;
            float _2882 = _2870 * _179;
            float _2884 = -_635;
            float _2886 = _2884 + _2872;
            float _2888 = fma(_2876, _171, _2878);
            float _2890 = fma(_2876, _165, _2880);
            float _2892 = fma(_2876, _177, _2882);
            float _2894 = fma(_2886, _175, _2888);
            float _2896 = fma(_2886, _169, _2890);
            float _2898 = fma(_2886, _181, _2892);
            _663 = _2896;
            _665 = _2894;
            _667 = _2898;
            _2732 = _2894;
            _2738 = _2896;
            _2744 = _2898;
            _419 = _2872;
            _227 = _2856;
        }
        float _2900 = _663;
        float _2902 = _665;
        float _2904 = _667;
        float _2906 = _2732;
        float _2908 = _2738;
        float _2910 = _2744;
        float _2912 = _419;
        float _2914 = _227;
        float _2916 = _2900 * _2900;
        float _2918 = rsqrt(_2692);
        float _2920 = fma(_2902, _2902, _2916);
        float _2922 = fma(_2904, _2904, _2920);
        float _2924 = sqrt(_2922);
        float _2926 = _2662 * _2918;
        float _2928 = _2658 * _2918;
        float _2930 = _2640 * _2918;
        bool _2932 = _2924 > 0.0;
        bool _2934 = !_2932;
        _421 = _2920;
        _423 = _2924;
        _425 = _2912;
        _229 = _2914;
        _2354 = _2908;
        if (!_2934)
        {
            float _2936 = rsqrt(_2922);
            float _2938 = _2936 * _2900;
            float _2940 = _2936 * _2902;
            float _2942 = _2936 * _2904;
            float _2944 = _2928 * _2938;
            float _2946 = fma(_2926, _2940, _2944);
            float _2948 = fma(_2930, _2942, _2946);
            float _2950 = _2948 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2952 = fma(_2906, _2950, _2456);
            float _2954 = fma(_2908, _2950, _2454);
            float _2956 = fma(_2910, _2950, _2452);
            _2458 = _2952;
            _2460 = _2954;
            _2462 = _2956;
            _421 = _2942;
            _423 = _2950;
            _425 = _2938;
        }
    }
    float _2958 = _2458;
    float _2960 = _2460;
    float _2962 = _2462;
    float _2964 = _421;
    float _2966 = _423;
    float _2968 = _425;
    float _2970 = _229;
    float _2972 = _2354;
    bool _2974 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2976 = isnan(0.5);
    bool _2978 = _2974 || _2976;
    bool _2980 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2982 = _2978 || _2980;
    float _2984 = _2966;
    float _2986 = _2964;
    float _2988 = _2968;
    float _2990 = _2972;
    if (_2982)
    {
        _2984 = _2958;
    }
    float _2992 = _2984;
    float _2994 = _2992;
    if (_2982)
    {
        _2986 = _2960;
    }
    float _2996 = _2986;
    float _2998 = _2996;
    if (_2982)
    {
        _2988 = _2962;
    }
    float _3000 = _2988;
    float _3002 = _3000;
    if (!_2982)
    {
        float _3004 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3006 = _1342 + _3004;
        float _3008 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3010 = _1318 + _3008;
        float _3012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3014 = -_1342;
        float _3016 = _3014 + _2960;
        float _3018 = _3006 * _3006;
        float _3020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3022 = _1350 + _3020;
        float _3024 = -_1350;
        float _3026 = _3024 + _2962;
        float _3028 = fma(_3010, _3010, _3018);
        float _3030 = fma(_3022, _3022, _3028);
        float _3032 = -_1318;
        float _3034 = _3032 + _2958;
        float _3036 = sqrt(_3030);
        float _3038 = precise::min(_3036, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3040 = _3038 * _3012;
        float _3042 = fma(_3034, _3040, _1318);
        float _3044 = fma(_3016, _3040, _1342);
        float _3046 = fma(_3026, _3040, _1350);
        _2998 = _3044;
        _2994 = _3042;
        _3002 = _3046;
    }
    float _3048 = _2998;
    float _3050 = _2994;
    float _3052 = _3002;
    float _3054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3056 = _3048 + _3054;
    float _3058 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3060 = _3050 + _3058;
    float _3062 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3064 = _3052 + _3062;
    float _3066 = _3056 * _3056;
    float _3068 = fma(_3060, _3060, _3066);
    float _3070 = fma(_3064, _3064, _3068);
    float _3072 = rsqrt(_3070);
    float _3074 = _3072 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3076 = _3060 * _3074;
    float _3078 = _3064 * _3074;
    float _3080 = _3076 * _3076;
    float _3082 = _3078 * _3078;
    float _3084 = _3080 + _3082;
    float _3086 = sqrt(_3084);
    bool _3088 = _3086 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3090 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3092 = _3086 + _3090;
    float _3094 = _3072;
    float _3096 = _3092;
    float _3098 = _3056;
    float _3100 = _3074;
    if (_3088)
    {
        float _3102 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3094 = _3102;
    }
    float _3104 = _3094;
    float _3106 = _3104;
    if (_3088)
    {
        float _3108 = _3092 * _3104;
        _3096 = _3108;
    }
    float _3110 = _3096;
    if (_3088)
    {
        float _3112 = rsqrt(_3084);
        _3106 = _3112;
    }
    float _3114 = _3106;
    float _3116 = _3114;
    if (_3088)
    {
        float _3118 = _3110 * 0.15915493667125701904296875;
        _231 = _3118;
    }
    float _3120 = _231;
    float _3122 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3124 = _3064;
    float _3126 = _3120;
    if (_3088)
    {
        float _3128 = _3120 * 6.283185482025146484375;
        float _3130 = sin(_3128);
        _3124 = _3130;
    }
    float _3132 = _3124;
    float _3134 = precise::max(0.0, _3122);
    float _3136 = _2970;
    if (_3088)
    {
        float _3138 = _3120 * 6.283185482025146484375;
        float _3140 = cos(_3138);
        _3136 = _3140;
    }
    float _3142 = _3136;
    float _3144 = -_3074;
    float _3146 = -_3134;
    float _3148 = fma(_3056, _3144, _3146);
    if (_3088)
    {
        float _3150 = _3148 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3098 = _3150;
    }
    float _3152 = _3098;
    float _3154 = sqrt(_3070);
    float _3156 = _3132;
    float _3158 = _3152;
    if (_3088)
    {
        float _3160 = fma(_3132, _3152, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3156 = _3160;
    }
    float _3162 = _3156;
    float _3164 = _3162;
    if (!_3088)
    {
        _3126 = _3080;
    }
    float _3166 = _3126;
    float _3168 = _3166;
    if (_3088)
    {
        float _3170 = _3114 * _3162;
        _2990 = _3170;
    }
    float _3172 = _2990;
    if (!_3088)
    {
        _3116 = _3076;
    }
    float _3174 = _3116;
    float _3176 = _3174;
    float _3178 = _3142;
    if (_3088)
    {
        float _3180 = _3142 + (-1.0);
        _3158 = _3180;
    }
    float _3182 = _3158;
    float _3184 = _3182;
    if (_3088)
    {
        float _3186 = _3076 * _3172;
        _3176 = _3186;
    }
    float _3188 = _3176;
    if (!_3088)
    {
        _3164 = _3148;
    }
    float _3190 = _3164;
    float _3192 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3194 = _3190;
    if (_3088)
    {
        float _3196 = _3182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3100 = _3196;
    }
    float _3198 = _3100;
    if (!_3088)
    {
        _3184 = _3078;
    }
    float _3200 = _3184;
    float _3202 = _3200;
    if (_3088)
    {
        float _3204 = _3078 * _3172;
        _3202 = _3204;
    }
    float _3206 = _3202;
    if (_3088)
    {
        float _3208 = _3188 * _3188;
        _3168 = _3208;
    }
    float _3210 = _3168;
    if (_3088)
    {
        float _3212 = fma(_3148, _3142, _3198);
        _3194 = _3212;
    }
    float _3214 = _3194;
    if (!_3088)
    {
        _3178 = _3082;
    }
    float _3216 = _3178;
    float _3218 = _3216;
    if (_3088)
    {
        float _3220 = _3206 * _3206;
        _3218 = _3220;
    }
    float _3222 = _3218;
    float _3224 = fma(_3214, _3214, _3210);
    float _3226 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3228 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3230 = _3224 + _3222;
    float _3232 = fma(_3050, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3192);
    float _3234 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3236 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3238 = fma(_3154, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3236);
    float _3240 = precise::clamp(_3238, 0.0, 1.0);
    float _3242 = rsqrt(_3230);
    float _3244 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3232);
    float _3246 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3248 = fma(_3050, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3234);
    float _3250 = -_3240;
    float _3252 = _3250 + 1.0;
    float _3254 = _3244 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3256 = fma(_3050, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3246);
    float _3258 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3248);
    float _3260 = abs(_3252);
    float _3262 = log2(_3260);
    float _3264 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3266 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3256);
    float _3268 = _3258 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3270 = fma(_3050, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3228);
    float _3272 = -_3264;
    float _3274 = fma(_3272, _3226, 1.0);
    float _3276 = _3266 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3278 = _3268 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3280 = _3242 * _3188;
    float _3282 = _3242 * _3214;
    float _3284 = fma(_3052, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3270);
    float _3286 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3278);
    float _3288 = _3280 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3290 = _3242 * _3206;
    float _3292 = _3284 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3294 = fma(_3254, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3286);
    float _3296 = -_3288;
    float _3298 = fma(_3282, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3296);
    float _3300 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3302 = log2(_3274);
    float _3304 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3294);
    float _3306 = -_3290;
    float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3298);
    float _3310 = _3268 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3312 = fma(_3308, -0.5, 0.5);
    float _3314 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3310);
    float _3316 = exp2(_3300);
    float _3318 = _3268 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3320 = fma(_3308, 0.5, 0.5);
    float _3322 = fma(_3254, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3314);
    float _3324 = _3282 + 1.0;
    float _3326 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3318);
    float _3328 = fma(_3320, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3330 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3322);
    float _3332 = 1.0 / _3304;
    float _3334 = fma(_3254, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3326);
    float _3336 = fma(_3320, _3328, -0.212114393711090087890625);
    float _3338 = _3302 * 0.693147182464599609375;
    float _3340 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3334);
    float _3342 = fma(_3320, _3336, 1.570728778839111328125);
    float _3344 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3346 = sqrt(_3312);
    float _3348 = -_3282;
    float _3350 = fma(_3316, _3324, _3348);
    float _3352 = fma(_3350, 0.5, 0.5);
    float _3354 = _3330 * _3332;
    float _3356 = _3340 * _3332;
    float _3358 = fma(_3354, 0.5, 0.5);
    float _3360 = fma(_3356, -0.5, 0.5);
    float _3362 = _3346 * 0.636619746685028076171875;
    float3 _8641 = float3(_3358, _3360, _3344);
    float _3364 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8641, float3(0.0), isnan(_8641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8641, float3(0.0), isnan(_8641)), level(0.0)).x;
    float3 _8652 = float3(_3358, _3360, _3344);
    float4 _3367 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8652, float3(0.0), isnan(_8652)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8652, float3(0.0), isnan(_8652)), level(0.0)).xyzw;
    float _3369 = _3367.x;
    float _3371 = _3367.y;
    float _3373 = _3367.z;
    float _3375 = _3367.w;
    float _3377 = -_3342;
    float _3379 = fma(_3362, _3377, 1.0);
    float2 _8674 = float2(_3379, _3352);
    float3 _3383 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8674, float2(0.0), isnan(_8674)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8674, float2(0.0), isnan(_8674)), level(0.0)).xyz;
    float _3385 = _3383.x;
    float _3387 = _3383.y;
    float _3389 = _3383.z;
    float _3391 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3393 = _3268 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3395 = _3304 * 0.5;
    out.m_78.x = _3050;
    out.m_78.y = _3048;
    out.m_78.z = _3052;
    bool _3397 = _3154 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3399 = isnan(_3154);
    bool _3401 = _3397 || _3399;
    bool _3403 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3405 = _3401 || _3403;
    float _3407 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3393);
    float _3409 = exp2(_3391);
    float _3411 = _3330 + _3304;
    float _3413 = fma(_3254, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3407);
    float _3415 = fma(_3340, -0.5, _3395);
    float _3417 = _3411 * 0.5;
    float _3419 = fma(_3292, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3413);
    float _3421 = _3419 + _3304;
    out.gl_Position.x = _3330;
    out.gl_Position.y = _3340;
    out.gl_Position.z = _3419;
    out.gl_Position.w = _3304;
    float _3423 = _3421 * 0.5;
    float _3425 = -_3409;
    float _3427 = _3425 + 1.0;
    float _3429 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _3417;
    out.m_80.y = _3415;
    out.m_80.z = _3423;
    out.m_80.w = _3304;
    float _3431 = -_3429;
    float _3433 = _3431 + 1.0;
    float _3435 = _3304;
    float _3437 = _3419;
    float _3439 = _3340;
    float _3441 = _3330;
    float _3443 = _3415;
    float _3445 = _3417;
    if (!_3405)
    {
        _3435 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3447 = _3435;
    float _3449 = _3447;
    float _3451 = _3447;
    if (!_3405)
    {
        _3437 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3453 = _3437;
    float _3455 = _3453;
    float _3457 = _3453;
    if (!_3405)
    {
        _3439 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3459 = _3439;
    float _3461 = _3459;
    float _3463 = _3459;
    if (!_3405)
    {
        _3441 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3465 = _3441;
    float _3467 = _3465;
    float _3469 = _3465;
    if (!_3405)
    {
        _3443 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3471 = _3443;
    float _3473 = _3471;
    float _3475 = _3471;
    if (!_3405)
    {
        _3445 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3477 = _3445;
    float _3479 = _3429 * _3364;
    float _3481 = _3375 * _3479;
    float _3483 = _3389 * _3479;
    float _3485 = fma(_3385, _3481, _3369);
    float _3487 = fma(_3387, _3481, _3371);
    float _3489 = _3375 * _3433;
    float _3491 = fma(_3375, _3483, _3373);
    out.m_82.x = _3485;
    out.m_82.y = _3487;
    out.m_82.z = _3491;
    out.m_82.w = _3489;
    bool _3493 = !_3405;
    float _3495 = _3477;
    float _3497 = _3477;
    if (!_3493)
    {
        bool _3499 = _3154 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3501 = isnan(_3154);
        bool _3503 = _3499 || _3501;
        bool _3505 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3507 = _3503 || _3505;
        if (!_3507)
        {
            float _3509 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3511 = _3154 + _3509;
            float _3513 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3515 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3513;
            float _3517 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3519 = _3517 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3521 = 1.0 / _3515;
            float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3525 = _3523 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3529 = _3527 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3531 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3533 = _3531 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3535 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3537 = _3535 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3539 = _3511 * _3521;
            float _3541 = precise::clamp(_3539, 0.0, 1.0);
            float _3543 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3545 = _3543 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3547 = fma(_3541, _3519, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3549 = fma(_3541, _3545, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3551 = fma(_3541, _3525, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3553 = fma(_3541, _3529, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3555 = fma(_3541, _3533, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3557 = fma(_3541, _3537, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3497 = _3551;
            _3463 = _3555;
            _3475 = _3547;
            _3457 = _3553;
            _3451 = _3549;
            _3469 = _3557;
            _3559 = true;
        }
        else
        {
            bool _3561 = _3154 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3563 = isnan(_3154);
            bool _3565 = _3561 || _3563;
            bool _3567 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3569 = _3565 || _3567;
            if (!_3569)
            {
                _3473 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3571 = _3473;
            _3475 = _3571;
            if (!_3569)
            {
                _3495 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3573 = _3495;
            _3497 = _3573;
            if (!_3569)
            {
                _3449 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3575 = _3449;
            _3451 = _3575;
            if (!_3569)
            {
                _3455 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3577 = _3455;
            _3457 = _3577;
            if (!_3569)
            {
                _3461 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3579 = _3461;
            _3463 = _3579;
            if (!_3569)
            {
                _3467 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3581 = _3467;
            bool _3583 = !_3569;
            _3469 = _3581;
            if (!_3583)
            {
                bool _3585 = _3154 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3587 = isnan(_3154);
                bool _3589 = _3585 || _3587;
                bool _3591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3593 = _3589 || _3591;
                if (!_3593)
                {
                    float _3595 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3597 = _3154 + _3595;
                    float _3599 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3601 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3599;
                    float _3603 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3605 = _3603 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3607 = 1.0 / _3601;
                    float _3609 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3611 = _3609 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3613 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3615 = _3613 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3617 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3619 = _3617 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3621 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3623 = _3621 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3625 = _3597 * _3607;
                    float _3627 = precise::clamp(_3625, 0.0, 1.0);
                    float _3629 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3631 = _3629 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3633 = fma(_3627, _3605, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3635 = fma(_3627, _3631, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3637 = fma(_3627, _3611, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3639 = fma(_3627, _3615, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3641 = fma(_3627, _3619, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3643 = fma(_3627, _3623, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3497 = _3637;
                    _3463 = _3641;
                    _3475 = _3633;
                    _3457 = _3639;
                    _3451 = _3635;
                    _3469 = _3643;
                    _3559 = true;
                }
                else
                {
                    _3497 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3463 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3475 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3457 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3451 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3469 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3559 = false;
    float _3645 = _3497;
    float _3647 = _3463;
    float _3649 = _3475;
    float _3651 = _3457;
    float _3653 = _3451;
    float _3655 = _3469;
    float _3657 = fma(_2712, -0.5, 0.5);
    float _3659 = precise::clamp(_3657, 0.0, 1.0);
    float _3661 = -_3645;
    float _3663 = _3661 + _3647;
    float _3665 = -_3649;
    float _3667 = _3665 + _3651;
    float _3669 = -_3653;
    float _3671 = _3669 + _3655;
    bool _3673 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3675 = fma(_3659, _3663, _3645);
    float _3677 = fma(_3659, _3667, _3649);
    float _3679 = fma(_3659, _3671, _3653);
    float _3681 = _3675 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3683 = fma(_3677, 0.298911988735198974609375, _3681);
    float _3685 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3687 = fma(_3679, 0.114477999508380889892578125, _3683);
    out.m_84.w = _3685;
    float _3689 = -_3687;
    float _3691 = _3677 + _3689;
    float _3693 = -_3687;
    float _3695 = _3675 + _3693;
    float _3697 = -_3687;
    float _3699 = _3679 + _3697;
    out.m_86.x = 0.0;
    float _3701 = fma(_3691, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3687);
    float _3703 = fma(_3695, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3687);
    float _3705 = fma(_3699, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3687);
    out.m_88.x = _3701;
    out.m_88.y = _3703;
    out.m_88.z = _3705;
    if (!_3673)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3707 = -_3048;
    float _3709 = _3707 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3711 = -_3050;
    float _3713 = _3711 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3715 = -_3052;
    float _3717 = _3715 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3719 = _3709 * _3709;
    float _3721 = fma(_3713, _3713, _3719);
    float _3723 = fma(_3717, _3717, _3721);
    float _3725 = sqrt(_3723);
    float _3727 = rsqrt(_3723);
    float _3729 = -_3725;
    float _3731 = _3729 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3733 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3735 = precise::clamp(_3733, 0.0, 1.0);
    float _3737 = _3713 * _3727;
    float _3739 = _3709 * _3727;
    float _3741 = abs(_3735);
    float _3743 = log2(_3741);
    float _3745 = _3717 * _3727;
    float _3747 = _3737 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3749 = _2712 * _3739;
    float _3751 = -_3739;
    float _3753 = -_3747;
    float _3755 = fma(_3751, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3753);
    float _3757 = fma(_2710, _3737, _3749);
    float _3759 = -_3745;
    float _3761 = fma(_3759, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3755);
    float _3763 = fma(_2714, _3745, _3757);
    float _3765 = precise::clamp(_3763, 0.0, 1.0);
    float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3769 = _3761 + _3767;
    float _3771 = _3743 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3773 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3775 = precise::clamp(_3773, 0.0, 1.0);
    float _3777 = exp2(_3771);
    float _3779 = _3777 * _3775;
    float _3781 = _3765 * _3779;
    float _3783 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3785 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3787 = _3781 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3783;
    out.m_86.y = _3785;
    out.m_86.z = _3787;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

