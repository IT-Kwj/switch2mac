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
    constant _16* vp_c12 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_84 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_78 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3879 = false;
    bool _3659 = false;
    bool _2740 = false;
    bool _2728 = false;
    bool _655 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4178 = as_type<float>(_125);
        out.gl_Position.z = _4178;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_51.w;
    float _131 = in.m_53.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.x = _131;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_109);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _119;
    if (_159)
    {
        out.m_49.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4251 = as_type<float>(_165);
        out.gl_Position.z = _4251;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_57.x;
    float _169 = in.m_57.y;
    float _171 = in.m_57.z;
    float _173 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_59.x;
    float _177 = in.m_59.y;
    float _179 = in.m_59.z;
    float _181 = in.m_61.x;
    float _183 = in.m_61.y;
    float _185 = in.m_61.z;
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_51.x;
    float _191 = in.m_51.y;
    float _193 = in.m_51.z;
    float _195 = _167 * _167;
    float _197 = _169 * _169;
    float _199 = fma(_175, _175, _195);
    float _201 = fma(_177, _177, _197);
    float _203 = fma(_181, _181, _199);
    float _205 = _171 * _171;
    float _207 = fma(_183, _183, _201);
    float _209 = sqrt(_203);
    float _211 = fma(_179, _179, _205);
    float _213 = fma(_185, _185, _211);
    float _215 = sqrt(_207);
    float _217 = sqrt(_213);
    bool _219 = _209 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = 0.0;
    float _225 = _203;
    if (_219)
    {
        float _227 = rsqrt(_203);
        _223 = _227;
    }
    float _229 = _223;
    float _231 = 0.0;
    if (!_219)
    {
        _231 = 0.0;
    }
    float _233 = _231;
    bool _235 = _217 > 0.0;
    float _237 = 0.0;
    float _239 = _233;
    float _241 = _217;
    if (!_219)
    {
        _237 = 0.0;
    }
    float _243 = _237;
    int _245 = as_type<int>(_187) & 1;
    bool _247 = _245 != 0;
    int _249 = as_type<int>(_187) & 2;
    bool _251 = _249 != 0;
    float _253 = _209;
    float _255 = _187;
    float _257 = _243;
    if (_221)
    {
        float _259 = rsqrt(_207);
        _253 = _259;
    }
    float _261 = _253;
    bool _263 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _267 = _263 || _265;
    bool _269 = isnan(1.0);
    bool _271 = _267 || _269;
    if (!_221)
    {
        _255 = 0.0;
    }
    float _273 = _255;
    float _275 = 0.0;
    float _277 = _273;
    if (!_221)
    {
        _275 = 0.0;
    }
    float _279 = _275;
    float _281 = _279;
    if (!_221)
    {
        _225 = 0.0;
    }
    float _283 = _225;
    float _285 = _213;
    float _287 = _283;
    if (_235)
    {
        float _289 = rsqrt(_213);
        _285 = _289;
    }
    float _291 = _285;
    if (_219)
    {
        float _293 = _229 * _175;
        _239 = _293;
    }
    float _295 = _239;
    if (!_219)
    {
        _241 = 0.0;
    }
    float _297 = _241;
    float _299 = _297;
    if (_219)
    {
        float _301 = _229 * _167;
        _257 = _301;
    }
    float _303 = _257;
    float _305 = 0.0;
    if (!_235)
    {
        _305 = 0.0;
    }
    float _307 = _305;
    float _309 = 0.0;
    float _311 = _307;
    if (!_271)
    {
        float _313 = _173 * _173;
        float _315 = _313 * 0.5;
        _309 = _315;
    }
    float _317 = _309;
    float _319 = 0.0;
    float _321 = _317;
    if (!_235)
    {
        _319 = 0.0;
    }
    float _323 = _319;
    float _325 = _261;
    float _327 = _323;
    if (_221)
    {
        float _329 = _261 * _177;
        _277 = _329;
    }
    float _331 = _277;
    if (_221)
    {
        float _333 = _261 * _169;
        _281 = _333;
    }
    float _335 = _281;
    if (_221)
    {
        float _337 = _261 * _183;
        _287 = _337;
    }
    float _339 = _287;
    float _341 = _339;
    if (!_235)
    {
        _325 = 0.0;
    }
    float _343 = _325;
    float _345 = _343;
    if (_219)
    {
        float _347 = _229 * _181;
        _299 = _347;
    }
    float _349 = _299;
    bool _351 = !_247;
    float _353 = _351 ? (-0.5) : 0.5;
    if (!_271)
    {
        float _355 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _321 = _355;
    }
    float _357 = _321;
    float _359 = _357;
    if (_235)
    {
        float _361 = _291 * _179;
        _311 = _361;
    }
    float _363 = _311;
    if (_235)
    {
        float _365 = _291 * _171;
        _327 = _365;
    }
    float _367 = _327;
    if (_235)
    {
        float _369 = _291 * _185;
        _345 = _369;
    }
    float _371 = _345;
    bool _373 = !_251;
    float _375 = _373 ? (-0.5) : 0.5;
    bool _377 = !_271;
    float _379 = 0.0;
    float _381 = 0.0;
    if (!_377)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _393 = _173 * _385;
        float _395 = 1.0 / _389;
        float _397 = _391 * 0.693147182464599609375;
        float _399 = exp2(_393);
        float _401 = 1.0 / _397;
        float _403 = _399 + (-1.0);
        float _405 = -_403;
        float _407 = fma(_405, _401, _173);
        float _409 = _407 * _395;
        float _411 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _359 = _411;
        _379 = _409;
        _381 = _395;
    }
    float _413 = _359;
    float _415 = _379;
    float _417 = _381;
    float _419 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _421 = _417;
    float _423 = _415;
    if (!_271)
    {
        _421 = _173;
    }
    float _425 = _421;
    bool _427 = !_271;
    float _429 = _425;
    if (!_427)
    {
        float _431 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _433 = log2(_431);
        float _435 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _437 = _435 + 1.0;
        float _439 = 1.0 / _437;
        float _441 = _173 * _433;
        float _443 = exp2(_441);
        float _445 = -_443;
        float _447 = _445 + 1.0;
        float _449 = _447 * _439;
        _423 = _439;
        _429 = _449;
    }
    float _451 = _423;
    float _453 = _429;
    float _455 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _457 = _419 * _303;
    float _459 = _419 * _335;
    float _461 = _419 * _367;
    float _463 = _451;
    if (!_271)
    {
        float _465 = _145 * _145;
        float _467 = _465 * 0.5;
        _463 = _467;
    }
    float _469 = _463;
    float _471 = fma(_455, _295, _457);
    float _473 = fma(_455, _331, _459);
    float _475 = fma(_455, _363, _461);
    float _477 = _469;
    if (!_271)
    {
        float _479 = _469 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _477 = _479;
    }
    float _481 = _477;
    bool _483 = !_271;
    float _485 = _481;
    if (!_483)
    {
        float _487 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _489 = log2(_487);
        float _491 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _493 = _491 + 1.0;
        float _495 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _497 = _145 * _489;
        float _499 = 1.0 / _493;
        float _501 = _495 * 0.693147182464599609375;
        float _503 = exp2(_497);
        float _505 = 1.0 / _501;
        float _507 = _503 + (-1.0);
        float _509 = -_507;
        float _511 = fma(_509, _505, _145);
        float _513 = _511 * _499;
        float _515 = _513 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _485 = _515;
    }
    float _517 = _485;
    float _519 = in.m_66.w;
    float _521 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _523 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _525 = in.m_46.x;
    float _527 = in.m_46.y;
    float _529 = in.m_46.z;
    float _531 = _521 * _303;
    float _533 = _521 * _335;
    float _535 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _537 = _521 * _367;
    float _539 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _541 = fma(_523, _349, _471);
    float _543 = fma(_535, _331, _533);
    float _545 = fma(_523, _339, _473);
    float _547 = fma(_523, _371, _475);
    float _549 = fma(_535, _295, _531);
    float _551 = fma(_535, _363, _537);
    float _553 = fma(_539, _339, _543);
    float _555 = fma(_453, _189, _541);
    float _557 = fma(_453, _191, _545);
    float _559 = fma(_453, _193, _547);
    float _561 = fma(_539, _349, _549);
    float _563 = fma(_539, _371, _551);
    if (!_271)
    {
        _341 = _145;
    }
    float _565 = _341;
    bool _567 = !_271;
    float _569 = _565;
    if (!_567)
    {
        float _571 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _573 = log2(_571);
        float _575 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _577 = _575 + 1.0;
        float _579 = 1.0 / _577;
        float _581 = _145 * _573;
        float _583 = exp2(_581);
        float _585 = -_583;
        float _587 = _585 + 1.0;
        float _589 = _587 * _579;
        _569 = _589;
    }
    float _591 = _569;
    float _593 = fma(_591, _191, _553);
    bool _595 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _597 = fma(_591, _189, _561);
    float _599 = fma(_591, _193, _563);
    float _601 = -_593;
    float _603 = _557 + _601;
    float _605 = fma(_555, _519, _525);
    float _607 = -_597;
    float _609 = _555 + _607;
    float _611 = -_599;
    float _613 = _559 + _611;
    float _615 = _603 * _177;
    float _617 = _603 * _169;
    float _619 = _603 * _183;
    float _621 = fma(_557, _519, _527);
    float _623 = fma(_609, _175, _615);
    float _625 = fma(_609, _167, _617);
    float _627 = fma(_609, _181, _619);
    float _629 = fma(_559, _519, _529);
    float _631 = fma(_613, _179, _623);
    float _633 = fma(_613, _171, _625);
    float _635 = fma(_613, _185, _627);
    bool _637 = !_595;
    float _653;
    if (!_637)
    {
        float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _641 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _645 = _643 * _639;
        float _647 = floor(_645);
        float _649 = -_647;
        float _651 = _645 + _649;
        _653 = _651;
        _655 = true;
    }
    else
    {
        float _657 = float(_109);
        float _659 = 1.0 / _657;
        float _661 = _145 * _659;
        _653 = _661;
    }
    _655 = false;
    float _663 = _653;
    float _665 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _667 = int(_665);
    float _669 = _621 * _177;
    float _671 = _621 * _169;
    float _673 = _621 * _183;
    float _675 = fma(_605, _175, _669);
    float _677 = fma(_605, _167, _671);
    float _679 = fma(_605, _181, _673);
    float _681 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _683 = int(_681);
    float _685 = _131 * 2.0;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _689 = _687 != 0;
    float _691 = in.m_53.w;
    float _693 = fma(_629, _171, _677);
    int _695 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _697 = _695 != 0;
    float _699 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _701 = int(_699);
    float _703 = float(_667);
    float _705 = fma(_629, _185, _679);
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _709 = _707 != 0;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _717 = _715 != 0;
    float _719 = in.m_59.w;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _723 = _663 + _721;
    bool _725 = _131 > 0.5;
    float _727 = 1.0 / _703;
    float _729 = float(_683);
    float _731 = in.m_61.w;
    bool _733 = !_717;
    int _735 = _733 ? 0 : 1;
    float _737 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _741 = _739 != 0;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _745 = _743 != 0;
    float _747 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _749 = int(_747);
    float _751 = float(uint(_701));
    int _753 = ~_701;
    int _755 = _753 + 1;
    float _757 = 0.0;
    if (_689)
    {
        _757 = _131;
    }
    float _759 = _757;
    float _761 = 0.0;
    float _763 = _759;
    if (_689)
    {
        _761 = 1.0;
    }
    float _765 = _761;
    float _767 = 1.0 / _729;
    float _769 = _727 * _145;
    float _771 = _765;
    if (!_689)
    {
        _771 = 1.2345600128173828125;
    }
    float _773 = _771;
    float _775 = float(uint(_749));
    float _777 = 1.0 / _751;
    float _779 = in.m_53.z;
    int _781 = ~_749;
    int _783 = _781 + 1;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _785;
    int _789 = ~_749;
    int _791 = _789 + 1;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _795 = _767 * _145;
    float _797 = trunc(_769);
    int _799 = int(_797);
    float _801 = in.m_53.y;
    float _803 = -_793;
    float _805 = fma(_737, 2.0, _803);
    float _807 = _705 + _731;
    bool _809 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _811 = isnan(_663);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -_145;
    float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[76].x, _805);
    float _825 = 1.0 / _775;
    int _827 = as_type<int>(_777) + (-2);
    float _829 = float(_749);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _831;
    float _835 = trunc(_795);
    int _837 = int(_835);
    float _839 = float(uint(_799));
    float _841 = _131 + _779;
    float _843 = as_type<float>(_827) * _839;
    float _845 = _841 + (-1.0);
    int _847 = as_type<int>(_825) + (-2);
    float _849 = _801 * 2.0;
    float _851 = trunc(_843);
    float _853 = precise::max(_851, 0.0);
    uint _856 = uint(_853);
    bool _858 = !_713;
    int _860 = _858 ? 0 : 1;
    float _862 = _801 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_689)
    {
        _763 = _801;
    }
    float _864 = _763;
    float _866 = _779 + _801;
    int _868 = abs(_860);
    float _870 = float(uint(_837));
    float _872 = floor(_849);
    bool _874 = !_709;
    int _876 = _874 ? 0 : 1;
    float _878 = _866 + (-1.0);
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _882 = _880 != 0;
    float _884 = as_type<float>(_847) * _870;
    float _886 = _864 * _773;
    int _888 = abs(_876);
    float _890 = trunc(_884);
    float _892 = precise::max(_890, 0.0);
    uint _894 = uint(_892);
    int _896 = _755 * int(_856);
    int _898 = _896 + _799;
    bool _900 = !_745;
    int _902 = _900 ? 0 : 1;
    float _904 = float(uint(_898));
    float _906 = floor(_685);
    float _908 = _779 * 2.0;
    bool _910 = !_882;
    int _912 = _910 ? 0 : 1;
    float _914 = as_type<float>(_827) * _904;
    bool _916 = _872 > 0.0;
    float _918 = -_353;
    int _920 = _725 ? as_type<int>(_918) : as_type<int>(_353);
    int _922 = _783 * int(_894);
    int _924 = _922 + _837;
    float _926 = trunc(_914);
    float _928 = precise::max(_926, 0.0);
    uint _930 = uint(_928);
    bool _932 = !_697;
    float _934 = _932 ? _353 : as_type<float>(_920);
    int _936 = abs(_912);
    float _938 = float(uint(_924));
    float _940 = _934 + 0.5;
    bool _942 = !_741;
    int _944 = _942 ? 0 : 1;
    float _946 = floor(_908);
    bool _948 = _872 >= 0.0;
    bool _950 = isnan(_872);
    bool _952 = _948 || _950;
    bool _954 = isnan(0.0);
    bool _956 = _952 || _954;
    float _958 = as_type<float>(_847) * _938;
    bool _960 = _906 > 0.0;
    int _962 = _956 ? 0 : 1;
    bool _964 = _906 >= 0.0;
    bool _966 = isnan(_906);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = trunc(_958);
    float _976 = precise::max(_974, 0.0);
    uint _978 = uint(_976);
    int _980 = ~_962;
    int _982 = _980 + 1;
    int _984 = _982 + 1;
    int _986 = _984;
    int _988 = as_type<int>(_908);
    float _990 = _958;
    if (!_916)
    {
        int _992 = ~_962;
        int _994 = _992 + 1;
        _986 = _994;
    }
    int _996 = _986;
    bool _998 = _779 > 0.5;
    bool _1000 = _801 > 0.5;
    float _1002 = 1.0 / _787;
    int _1004 = int(_856) + int(_930);
    int _1006 = _972 ? 0 : 1;
    bool _1008 = _946 > 0.0;
    bool _1010 = _946 >= 0.0;
    bool _1012 = isnan(_946);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan(0.0);
    bool _1018 = _1014 || _1016;
    int _1020 = int(_894) + int(_978);
    float _1022 = -_353;
    int _1024 = _998 ? as_type<int>(_1022) : as_type<int>(_353);
    float _1026 = -_375;
    int _1028 = _1000 ? as_type<int>(_1026) : as_type<int>(_375);
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1032 = _1030 != 0;
    if (_689)
    {
        _988 = 0;
    }
    int _1034 = _988;
    int _1036 = ~_701;
    int _1038 = _1036 + 1;
    int _1040 = ~_1006;
    int _1042 = _1040 + 1;
    int _1044 = _1042 + 1;
    int _1046 = _1034;
    int _1048 = _1044;
    if (!_689)
    {
        _1046 = 1;
    }
    int _1050 = _1046;
    if (!_960)
    {
        int _1052 = ~_1006;
        int _1054 = _1052 + 1;
        _1048 = _1054;
    }
    int _1056 = _1048;
    if (_689)
    {
        _990 = 1.0;
    }
    float _1058 = _990;
    float _1060 = _1058;
    if (!_689)
    {
        _1060 = 7.345489978790283203125;
    }
    float _1062 = _1060;
    bool _1064 = !_1032;
    float _1066 = _1064 ? _375 : as_type<float>(_1028);
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1070 = _1068 != 0;
    bool _1072 = _1050 != 1;
    bool _1074 = _691 > 0.5;
    int _1076 = _1038 * _1004;
    int _1078 = _1076 + _799;
    bool _1080 = !_1070;
    float _1082 = _1080 ? _353 : as_type<float>(_1024);
    float _1084 = -_375;
    int _1086 = _1074 ? as_type<int>(_1084) : as_type<int>(_375);
    int _1088 = _791 * _1020;
    int _1090 = _1088 + _837;
    int _1092 = _1018 ? 0 : 1;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1096 = _1094 != 0;
    int _1098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1100 = _1098 != 0;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1104 = _1102 != 0;
    int _1106 = ~_1092;
    int _1108 = _1106 + 1;
    int _1110 = _1108 + 1;
    int _1112 = _1110;
    float _1114 = as_type<float>(_1078);
    if (!_1008)
    {
        int _1116 = ~_1092;
        int _1118 = _1116 + 1;
        _1112 = _1118;
    }
    int _1120 = _1112;
    bool _1122 = !_1100;
    int _1124 = _1122 ? 0 : 1;
    bool _1126 = uint(_1078) >= uint(_701);
    bool _1128 = uint(_1090) >= uint(_749);
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1132 = _1130 != 0;
    float _1134 = 0.0;
    if (!_1072)
    {
        _1134 = _801;
    }
    float _1136 = _1134;
    float _1138 = 0.0;
    float _1140 = _1136;
    if (!_1072)
    {
        _1138 = _801;
    }
    float _1142 = _1138;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1144;
    float _1148 = 0.0;
    float _1150 = _1142;
    if (!_1072)
    {
        _1148 = _779;
    }
    float _1152 = _1148;
    float _1154 = _1152;
    if (!_1072)
    {
        _1114 = _779;
    }
    float _1156 = _1114;
    float _1158 = _1156;
    if (_1072)
    {
        _1140 = _131;
    }
    float _1160 = _1140;
    float _1162 = 1.0 / _1146;
    if (_1072)
    {
        _1150 = _131;
    }
    float _1164 = _1150;
    if (_1072)
    {
        _1154 = _801;
    }
    float _1166 = _1154;
    float _1168 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1072)
    {
        _1158 = _801;
    }
    float _1170 = _1158;
    bool _1172 = !_1126;
    int _1174 = _1172 ? 0 : (-1);
    bool _1176 = !_1128;
    int _1178 = _1176 ? 0 : (-1);
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1182 = _1180 != 0;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1186 = _1184 != 0;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1190 = _1188 != 0;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1194 = _1192 != 0;
    float _1196 = fma(_629, _179, _675);
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1202 = in.m_57.w;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1206 = _663 + _1204;
    float _1208 = _1196 + _719;
    float _1210 = 1.0 / _1200;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1214 = _1206 * _1162;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1218 = _663 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1220;
    float _1224 = fma(_862, -2.0, _1212);
    float _1226 = _1218 * _1002;
    float _1228 = _1208 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1230 = !_1104;
    int _1232 = _1230 ? 0 : 1;
    float _1234 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1236 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1238 = isnan(_663);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    bool _1248 = !_1096;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = _723 * _1210;
    float _1254 = _131 + _801;
    float _1256 = float(_996);
    float _1258 = _693 + _1202;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1262 = _1260 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1264 = _1254 + (-1.0);
    float _1266 = fma(_1222, _1214, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1268 = _1258 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1270 = fma(_1262, _1252, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1272 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1274 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1276 = -_1246;
    float _1278 = _1276 + 1.0;
    bool _1280 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1282 = isnan(_663);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1288 = _1284 || _1286;
    float _1290 = float(_1288);
    bool _1292 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1294 = isnan(_663);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1304;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1312 = _1290 * _1278;
    bool _1314 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1316 = isnan(0.0);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1322 = _1318 || _1320;
    float _1324 = fma(_1306, _1214, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1326 = _1062 * _131;
    float _1328 = -_1290;
    float _1330 = _1328 + 1.0;
    float _1332 = -_1302;
    float _1334 = _1332 + 1.0;
    float _1336 = fma(_1310, _1252, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1338 = _1302 * _1330;
    float _1340 = floor(_886);
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1342;
    float _1346 = _819 * _1334;
    float _1348 = -_819;
    float _1350 = _1348 + 1.0;
    int _1352 = ~_1004;
    int _1354 = _1352 + _1174;
    int _1356 = _1354 + 1;
    float _1358 = fma(_1344, _1226, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1360 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[80].x, _823);
    float _1362 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1224);
    float _1364 = _1266 * _1346;
    float _1366 = floor(_1326);
    float _1368 = float(_109);
    float _1370 = _1324 * _1346;
    float _1372 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1364);
    float _1374 = fma(_833, _1226, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1376 = _1066 + (-0.5);
    int _1378 = ~_1020;
    int _1380 = _1378 + _1178;
    int _1382 = _1380 + 1;
    float _1384 = -_1340;
    float _1386 = _886 + _1384;
    float _1388 = 1.0 / _1368;
    float _1390 = _1268 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1392 = -_1376;
    float _1394 = -_1362;
    float _1396 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1394);
    float _1398 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1370);
    float _1400 = _1268 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1402 = float(_701);
    float _1404 = fma(_1270, _1338, _1372);
    float _1406 = fma(_1336, _1338, _1398);
    float _1408 = -_1366;
    float _1410 = _1326 + _1408;
    float _1412 = _1268 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1414 = fma(_1228, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1390);
    float _1416 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1418 = log2(_1416);
    float _1420 = fma(_1228, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1412);
    float _1422 = fma(_1228, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1400);
    float _1424 = _1388 * _145;
    float _1426 = float(_837);
    float _1428 = fma(_1374, _1312, _1406);
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1432 = _1402 * _1424;
    bool _1434 = _1426 >= _829;
    bool _1436 = isnan(_1426);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan(_829);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = _1386 * _829;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1450 = _829 * _1424;
    float _1452 = _807 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    int _1454 = abs(_1124);
    float _1456 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1448);
    int _1458 = abs(_1232);
    float _1460 = fma(_1452, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1420);
    int _1462 = abs(_1250);
    float _1464 = fma(_1452, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1422);
    float _1466 = fma(_1452, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1414);
    float _1468 = _1418 * _145;
    float _1470 = float(_1056);
    float _1472 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1474 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1478 = float(_1458);
    float _1480 = fma(_1358, _1312, _1404);
    float _1482 = float(_1462);
    float _1484 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1430);
    float _1486 = float(_1120);
    float _1488 = fma(_1474, -2.0, _1476);
    float _1490 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1492 = _1478 * _1256;
    float _1494 = _1482 * _1486;
    float _1496 = _1464 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1498 = _1466 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1500 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1502 = float(_799);
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1510 = _1410 * _1402;
    bool _1512 = _1502 >= _1402;
    bool _1514 = isnan(_1502);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan(_1402);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = exp2(_1468);
    float _1526 = _1460 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1528 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1504);
    float _1530 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1506);
    float _1532 = -_1508;
    float _1534 = fma(_1168, 2.0, _1532);
    float _1536 = _1498 * _1472;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1540 = 1.0 + _1538;
    float _1542 = in.m_66.x;
    float _1544 = in.m_66.y;
    float _1546 = _1526 * _1490;
    float _1548 = _1496 * _1500;
    bool _1550 = !_1132;
    float _1552 = _1550 ? _375 : as_type<float>(_1086);
    float _1554 = 1.0 / _1540;
    float _1556 = in.m_68.x;
    float _1558 = in.m_68.y;
    float _1560 = in.m_68.z;
    float _1562 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1480);
    float _1564 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1428);
    float _1566 = -_145;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1534);
    float _1570 = -_1524;
    float _1572 = _1570 + 1.0;
    float _1574 = _1082 + 0.5;
    float _1576 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1488);
    float _1578 = float(_1454);
    float _1580 = _1552 + (-0.5);
    float _1582 = _1322 ? _1572 : 0.0;
    float _1584 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1568);
    bool _1586 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1588 = isnan(1.0);
    bool _1590 = _1586 || _1588;
    bool _1592 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1594 = _1590 || _1592;
    float _1596 = trunc(_1510);
    int _1598 = int(_1596);
    float _1600 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1528);
    float _1602 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1530);
    float _1604 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1484);
    float _1606 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1456);
    float _1608 = _1578 * _1470;
    float _1610 = _1492 * (-2.0);
    float _1612 = _1562 * _1542;
    float _1614 = trunc(_1522);
    int _1616 = int(_1614);
    int _1618 = abs(_902);
    float _1620 = _131 + (-0.5);
    int _1622 = _749 * _1382;
    int _1624 = _1622 + _837;
    if (_1594)
    {
        float _1626 = _1582 * _1554;
        _149 = _1626;
    }
    float _1628 = _149;
    float _1630 = -_1580;
    float _1632 = -_1576;
    float _1634 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1632);
    float _1636 = _1494 * (-2.0);
    float _1638 = _1608 * (-2.0);
    float _1640 = trunc(_1444);
    int _1642 = int(_1640);
    int _1644 = _1598 * _1618;
    int _1646 = _1644 + _799;
    float _1648 = fma(_1636, _1556, _1556);
    float _1650 = fma(_1272, _1636, _1272);
    float _1652 = fma(_1638, _1558, _1558);
    float _1654 = fma(_1274, _1610, _1274);
    float _1656 = _779 + (-0.5);
    int _1658 = _701 * _1356;
    int _1660 = _1658 + _799;
    float _1662 = trunc(_1446);
    int _1664 = int(_1662);
    float _1666 = float(uint(_1646));
    float _1668 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1648);
    bool _1670 = !_1186;
    int _1672 = _1670 ? 0 : 1;
    float _1674 = _801 + (-0.5);
    bool _1676 = _701 == 0;
    float _1678 = fma(_1234, _1638, _1234);
    bool _1680 = _749 == 0;
    float _1682 = trunc(_1432);
    int _1684 = int(_1682);
    int _1686 = abs(_944);
    float _1688 = as_type<float>(_827) * _1666;
    int _1690 = ~_1616;
    int _1692 = _1690 + 1;
    int _1694 = _1692 + 1;
    float _1696 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1652);
    bool _1698 = !_1676;
    int _1700 = _1698 ? _1660 : (-1);
    float _1702 = fma(_1610, _1560, _1560);
    int _1704 = ~_1642;
    int _1706 = _1704 + 1;
    int _1708 = _1706 + 1;
    int _1710 = _1664 * _1686;
    int _1712 = _1710 + _837;
    bool _1714 = !_1680;
    int _1716 = _1714 ? _1624 : (-1);
    int _1718 = _1700 * _1694;
    int _1720 = _701 + (-1);
    float _1722 = trunc(_1450);
    int _1724 = int(_1722);
    int _1726 = _749 + (-1);
    int _1728 = _1716 * _1708;
    int _1730 = abs(_1672);
    int _1732 = _1616 * _1720;
    int _1734 = _1732 + _1718;
    float _1736 = fma(_1678, _1628, _1696);
    bool _1738 = !_1190;
    int _1740 = _1738 ? 0 : 1;
    int _1742 = _1642 * _1726;
    int _1744 = _1742 + _1728;
    float _1746 = fma(_1650, _1628, _1668);
    int _1748 = _1734 * _868;
    bool _1750 = !_1182;
    int _1752 = _1750 ? 0 : 1;
    float _1754 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1702);
    int _1756 = abs(_1740);
    int _1758 = _1684 * _888;
    int _1760 = _1758 + _1748;
    int _1762 = abs(_1752);
    int _1764 = _1744 * _1730;
    int _1766 = abs(_735);
    float _1768 = _1746 * 0.15915493667125701904296875;
    float _1770 = fma(_1654, _1628, _1754);
    bool _1772 = !_1194;
    int _1774 = _1772 ? 0 : 1;
    int _1776 = _1646 * _1766;
    int _1778 = _1776 + _1760;
    int _1780 = _1724 * _1762;
    int _1782 = _1780 + _1764;
    float _1784 = _1768 * 6.283185482025146484375;
    float _1786 = sin(_1784);
    int _1788 = abs(_1774);
    int _1790 = _1598 * _936;
    int _1792 = _1790 + _1778;
    float _1794 = float(uint(_1712));
    int _1796 = _1712 * _1756;
    int _1798 = _1796 + _1782;
    float _1800 = -_1602;
    float _1802 = _1800 + 1.0;
    float _1804 = fma(_1546, 0.5, 0.5);
    float _1806 = float(uint(_1792));
    float _1808 = _1768 * 6.283185482025146484375;
    float _1810 = cos(_1808);
    float _1812 = as_type<float>(_847) * _1794;
    float _1814 = fma(_1548, 0.5, 0.5);
    float _1816 = _1736 * 0.15915493667125701904296875;
    float _1818 = as_type<float>(_827) * _1806;
    float _1820 = -_1604;
    float _1822 = _1820 + 1.0;
    float _1824 = -_1606;
    float _1826 = _1824 + 1.0;
    int _1828 = ~_701;
    int _1830 = _1828 + 1;
    float _1832 = trunc(_1688);
    float _1834 = precise::max(_1832, 0.0);
    uint _1836 = uint(_1834);
    float _1838 = _1770 * 0.15915493667125701904296875;
    float _1840 = -_1600;
    float _1842 = _1840 + 1.0;
    float _1844 = -_1822;
    float _1846 = fma(_1082, _1844, _1584);
    float _1848 = fma(_1552, _1826, _1634);
    float _1850 = fma(_1536, 0.5, 0.5);
    int _1852 = _1664 * _1788;
    int _1854 = _1852 + _1798;
    float _1856 = -_1842;
    float _1858 = fma(_934, _1856, _1360);
    float _1860 = fma(_1066, _1802, _1396);
    int _1862 = ~_701;
    int _1864 = _1862 + 1;
    float _1866 = trunc(_1812);
    float _1868 = precise::max(_1866, 0.0);
    uint _1870 = uint(_1868);
    float _1872 = float(uint(_1854));
    float _1874 = _1612 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1876 = ~_749;
    int _1878 = _1876 + 1;
    out.m_70.x = _1858;
    out.m_70.y = _1860;
    out.m_70.z = _1846;
    out.m_70.w = _1848;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1882 = _1880 != 0;
    float _1884 = as_type<float>(_847) * _1872;
    float _1886 = trunc(_1818);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    float _1892 = _1564 * _1544;
    float _1894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _375);
    int _1896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1898 = _1896 != 0;
    int _1900 = _1864 * int(_1836);
    int _1902 = _1900 + _1646;
    float _1904 = _1892 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1906 = !_1882;
    int _1908 = _1906 ? 0 : 1;
    float _1910 = trunc(_1884);
    float _1912 = precise::max(_1910, 0.0);
    uint _1914 = uint(_1912);
    float _1916 = float(uint(_1902));
    int _1918 = _1878 * int(_1870);
    int _1920 = _1918 + _1712;
    float _1922 = _1904 * _1894;
    float _1924 = as_type<float>(_827) * _1916;
    float _1926 = float(uint(_1920));
    float _1928 = floor(_1804);
    int _1930 = _1830 * int(_1890);
    int _1932 = _1930 + _1792;
    float _1934 = float(uint(_1932));
    float _1936 = floor(_1814);
    float _1938 = as_type<float>(_827) * _1934;
    float _1940 = _1816 * 6.283185482025146484375;
    float _1942 = sin(_1940);
    float _1944 = -_1928;
    float _1946 = _1804 + _1944;
    float _1948 = as_type<float>(_847) * _1926;
    float _1950 = _1816 * 6.283185482025146484375;
    float _1952 = cos(_1950);
    float _1954 = -_1936;
    float _1956 = _1814 + _1954;
    float _1958 = fma(_1956, 2.0, -1.0);
    float _1960 = _1838 * 6.283185482025146484375;
    float _1962 = sin(_1960);
    int _1964 = ~_749;
    int _1966 = _1964 + 1;
    float _1968 = _1810 * _1942;
    float _1970 = _1786 * _1942;
    int _1972 = _1966 * int(_1914);
    int _1974 = _1972 + _1854;
    float _1976 = _1838 * 6.283185482025146484375;
    float _1978 = cos(_1976);
    float _1980 = _1810 * _1952;
    float _1982 = float(uint(_1974));
    float _1984 = floor(_1850);
    float _1986 = as_type<float>(_847) * _1982;
    float _1988 = _1958 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1990 = _1786 * _1952;
    float _1992 = _1988 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1994 = _1988 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1996 = trunc(_1948);
    float _1998 = precise::max(_1996, 0.0);
    uint _2000 = uint(_1998);
    float _2002 = _1810 * _1978;
    float _2004 = fma(_1946, 2.0, -1.0);
    float _2006 = _1786 * _1978;
    float _2008 = _1952 * _1978;
    float _2010 = _1942 * _1978;
    float _2012 = trunc(_1924);
    float _2014 = precise::max(_2012, 0.0);
    uint _2016 = uint(_2014);
    float _2018 = -_1984;
    float _2020 = _1850 + _2018;
    float _2022 = _1988 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2024 = -_1968;
    float _2026 = fma(_1962, _1990, _2024);
    float _2028 = -_1990;
    float _2030 = fma(_1962, _1968, _2028);
    float _2032 = fma(_1962, _1980, _1970);
    float _2034 = fma(_1962, _1970, _1980);
    float _2036 = _2006 * _1922;
    float _2038 = trunc(_1938);
    float _2040 = precise::max(_2038, 0.0);
    uint _2042 = uint(_2040);
    float _2044 = trunc(_1986);
    float _2046 = precise::max(_2044, 0.0);
    uint _2048 = uint(_2046);
    float _2050 = _2004 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _2052 = int(_1836) + int(_2016);
    float _2054 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2056 = ~_701;
    int _2058 = _2056 + 1;
    float _2060 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2022);
    int _2062 = int(_1870) + int(_2000);
    float _2064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _353);
    float _2066 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1992);
    int _2068 = int(_1890) + int(_2042);
    float _2070 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1994);
    float _2072 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2074 = ~_749;
    int _2076 = _2074 + 1;
    float _2078 = _1874 * _2064;
    float _2080 = -_1922;
    float _2082 = _1962 * _2080;
    float _2084 = -_1962;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2054);
    int _2088 = int(_1914) + int(_2048);
    float _2090 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2092 = _2002 * _1922;
    int _2094 = _2058 * _2068;
    int _2096 = _2094 + _1792;
    float _2098 = -_1962;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2072);
    float _2102 = -_1962;
    float _2104 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2090);
    float _2106 = fma(_2026, _2078, _2036);
    bool _2108 = uint(_2096) >= uint(_701);
    float _2110 = fma(_2008, _2078, _2082);
    float _2112 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2114 = _2076 * _2088;
    int _2116 = _2114 + _1854;
    bool _2118 = !_2108;
    int _2120 = _2118 ? 0 : (-1);
    float _2122 = fma(_2032, _2078, _2092);
    float _2124 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2104);
    float _2126 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2086);
    bool _2128 = uint(_2116) >= uint(_749);
    float _2130 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2100);
    int _2132 = ~_2068;
    int _2134 = _2132 + _2120;
    int _2136 = _2134 + 1;
    float _2138 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2140 = !_2128;
    int _2142 = _2140 ? 0 : (-1);
    float _2144 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2146 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2112);
    int _2148 = _701 * _2136;
    int _2150 = _2148 + _1792;
    float _2152 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2138);
    int _2154 = ~_2088;
    int _2156 = _2154 + _2142;
    int _2158 = _2156 + 1;
    float _2160 = fma(_2010, _2144, _2110);
    float _2162 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2164 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2166 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2168 = !_1676;
    int _2170 = _2168 ? _2150 : (-1);
    float _2172 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2162);
    float _2174 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2164);
    float _2176 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2166);
    float _2178 = fma(_2030, _2144, _2122);
    float _2180 = fma(_2034, _2144, _2106);
    int _2182 = _2170 & 3;
    bool _2184 = _2182 != 0;
    int _2186 = _749 * _2158;
    int _2188 = _2186 + _1854;
    int _2190 = _2170 >> 31;
    float _2192 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2194 = uint(_2182) > 1u;
    float _2196 = _353 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2198 = _2190 & 3;
    float _2200 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2192);
    bool _2202 = !_1680;
    int _2204 = _2202 ? _2188 : (-1);
    float _2206 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2174);
    int _2208 = ~_701;
    int _2210 = _2208 + 1;
    float _2212 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2176);
    int _2214 = _2170 & 3;
    bool _2216 = _2214 != 0;
    int _2218 = _2170 + _2198;
    int _2220 = _2210 * _2052;
    int _2222 = _2220 + _1646;
    int _2224 = _2204 >> 31;
    int _2226 = _2216 ? 0 : 1;
    int _2228 = ~_749;
    int _2230 = _2228 + 1;
    int _2232 = _2224 & 3;
    int _2234 = ~_2226;
    int _2236 = _2234 + 1;
    int _2238 = _2236 + 1;
    int _2240 = _2230 * _2062;
    int _2242 = _2240 + _1712;
    bool _2244 = uint(_2222) >= uint(_701);
    float _2246 = _375 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2248 = _2238;
    float _2250 = _2004;
    float _2252 = _1958;
    float _2254 = _2180;
    if (!_2194)
    {
        int _2256 = ~_2226;
        int _2258 = _2256 + 1;
        _2248 = _2258;
    }
    int _2260 = _2248;
    int _2262 = _2204 + _2232;
    float _2264 = _2246 * _2124;
    bool _2266 = uint(_2182) >= 2u;
    int _2268 = _2218 >> 2;
    int _2270 = _2262 >> 2;
    int _2272 = _2266 ? 0 : 1;
    int _2274 = _2268 << 4;
    int _2276 = _2274 + 368;
    float _2278 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2146);
    bool _2280 = uint(_2242) >= uint(_749);
    float _2282 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2152);
    int _2284 = _2270 << 4;
    int _2286 = _2284 + 512;
    uint _2288 = uint(int(uint(_2276) >> uint(2)));
    uint _2290 = uint(int(uint(int(_2288)) >> uint(2)));
    int _2292 = int(_2288) & 3;
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[int(_2290)][_2292];
    int _2296 = int(_2288) + 1;
    uint _2298 = uint(int(uint(_2296) >> uint(2)));
    int _2300 = _2296 & 3;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[int(_2298)][_2300];
    bool _2304 = !_2244;
    int _2306 = _2304 ? 0 : (-1);
    float _2308 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2200);
    bool _2310 = _2182 != 3;
    float _2312 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2172);
    int _2314 = ~_2052;
    int _2316 = _2314 + _2306;
    int _2318 = _2316 + 1;
    float _2320 = _2246 * _2126;
    bool _2322 = !_2280;
    int _2324 = _2322 ? 0 : (-1);
    uint _2326 = uint(int(uint(_2286) >> uint(2)));
    uint _2328 = uint(int(uint(int(_2326)) >> uint(2)));
    int _2330 = int(_2326) & 3;
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[int(_2328)][_2330];
    int _2334 = int(_2326) + 1;
    uint _2336 = uint(int(uint(_2334) >> uint(2)));
    int _2338 = _2334 & 3;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[int(_2336)][_2338];
    int _2342 = ~_2272;
    int _2344 = _2342 + 1;
    int _2346 = _2344 + 1;
    float _2348 = fma(_2196, _2278, _2264);
    int _2350 = ~_2062;
    int _2352 = _2350 + _2324;
    int _2354 = _2352 + 1;
    out.m_72.x = _2278;
    out.m_72.y = _2282;
    out.m_72.z = _2308;
    float _2356 = fma(_2196, _2282, _2320);
    bool _2358 = !_2184;
    int _2360 = _2358 ? 0 : 1;
    int _2362 = _701 * _2318;
    int _2364 = _2362 + _1646;
    int _2366 = _2276 + 8;
    uint _2368 = uint(int(uint(_2366) >> uint(2)));
    uint _2370 = uint(int(uint(int(_2368)) >> uint(2)));
    int _2372 = int(_2368) & 3;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[int(_2370)][_2372];
    int _2376 = int(_2368) + 1;
    uint _2378 = uint(int(uint(_2376) >> uint(2)));
    int _2380 = _2376 & 3;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[int(_2378)][_2380];
    int _2384 = _2346;
    if (_2310)
    {
        int _2386 = ~_2272;
        int _2388 = _2386 + 1;
        _2384 = _2388;
    }
    int _2390 = _2384;
    int _2392 = _749 * _2354;
    int _2394 = _2392 + _1712;
    int _2396 = _2204 & 3;
    bool _2398 = _2396 != 0;
    float _2400 = _2246 * _2130;
    int _2402 = _2204 & 3;
    bool _2404 = _2402 != 0;
    bool _2406 = uint(_2396) > 1u;
    int _2408 = _2286 + 8;
    uint _2410 = uint(int(uint(_2408) >> uint(2)));
    uint _2412 = uint(int(uint(int(_2410)) >> uint(2)));
    int _2414 = int(_2410) & 3;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[int(_2412)][_2414];
    int _2418 = int(_2410) + 1;
    uint _2420 = uint(int(uint(_2418) >> uint(2)));
    int _2422 = _2418 & 3;
    float _2424 = (*spvDescriptorSet0.vp_c9)._m0[int(_2420)][_2422];
    int _2426 = _2404 ? 0 : 1;
    float _2428 = fma(_2196, _2308, _2400);
    bool _2430 = !_2398;
    int _2432 = _2430 ? 0 : 1;
    int _2434 = ~_2426;
    int _2436 = _2434 + 1;
    int _2438 = _2436 + 1;
    float _2440 = _2212 + _2428;
    bool _2442 = uint(_2396) >= 2u;
    int _2444 = abs(_2260);
    int _2446 = abs(_2360);
    int _2448 = _2438;
    if (!_2406)
    {
        int _2450 = ~_2426;
        int _2452 = _2450 + 1;
        _2448 = _2452;
    }
    int _2454 = _2448;
    bool _2456 = _2396 != 3;
    int _2458 = _2442 ? 0 : 1;
    int _2460 = abs(_2454);
    bool _2462 = _2396 != 3;
    int _2464 = abs(_2432);
    int _2466 = ~_2444;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    int _2472 = abs(_2390);
    int _2474 = _2470 * as_type<int>(_2302);
    int _2476 = ~_2460;
    int _2478 = _2476 + 1;
    int _2480 = _2478 + 1;
    int _2482 = ~_2446;
    int _2484 = _2482 + 1;
    int _2486 = _2484 + 1;
    int _2488 = _2480 * as_type<int>(_2340);
    int _2490 = ~_2464;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    int _2496 = _2486 * as_type<int>(_2294);
    int _2498 = _2496 + _2474;
    bool _2500 = _2182 != 3;
    float _2502 = fma(_2246, _2246, 1.0);
    int _2504 = ~_2458;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    int _2510 = _2494 * as_type<int>(_2332);
    int _2512 = _2510 + _2488;
    int _2514 = ~_2472;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    int _2520 = _2508;
    if (_2456)
    {
        int _2522 = ~_2458;
        int _2524 = _2522 + 1;
        _2520 = _2524;
    }
    int _2526 = _2520;
    float _2528 = rsqrt(_2502);
    bool _2530 = !_2500;
    int _2532 = _2530 ? 0 : (-1);
    int _2534 = _2518 * as_type<int>(_2374);
    int _2536 = _2534 + _2498;
    int _2538 = abs(_2526);
    int _2540 = abs(_1908);
    bool _2542 = !_1898;
    int _2544 = _2542 ? 0 : 1;
    int _2546 = abs(_2532);
    bool _2548 = !_2462;
    int _2550 = _2548 ? 0 : (-1);
    int _2552 = abs(_2544);
    float _2554 = _2246 * _2528;
    int _2556 = abs(_2550);
    int _2558 = ~_2538;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    int _2564 = ~_2546;
    int _2566 = _2564 + 1;
    int _2568 = _2566 + 1;
    int _2570 = _2562 * as_type<int>(_2416);
    int _2572 = _2570 + _2512;
    int _2574 = _2568 * as_type<int>(_2382);
    int _2576 = _2574 + _2536;
    int _2578 = ~_2556;
    int _2580 = _2578 + 1;
    int _2582 = _2580 + 1;
    float _2584 = fma(_2020, 2.0, -1.0);
    int _2586 = ~_2552;
    int _2588 = _2586 + 1;
    int _2590 = _2588 + 1;
    int _2592 = ~_2540;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    int _2598 = _2582 * as_type<int>(_2424);
    int _2600 = _2598 + _2572;
    float _2602 = -_2312;
    float _2604 = _2554 * _2602;
    float _2606 = -_2212;
    float _2608 = _2554 * _2606;
    bool _2610 = !_1676;
    int _2612 = _2610 ? _2364 : (-1);
    int _2614 = _2600 * _2590;
    float _2616 = -_2206;
    float _2618 = _2554 * _2616;
    int _2620 = _2576 * _2596;
    float _2622 = fma(_2528, _2124, _2604);
    float _2624 = fma(_2528, _2130, _2608);
    float _2626 = fma(_2528, _2126, _2618);
    float _2628 = _2312 + _2348;
    float _2630 = _2206 + _2356;
    bool _2632 = !_1680;
    int _2634 = _2632 ? _2394 : (-1);
    int _2636 = _2612 * _2540;
    int _2638 = _2636 + _2620;
    out.m_74.x = _2622;
    out.m_74.y = _2626;
    out.m_74.z = _2624;
    float _2640 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2642 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2644 = _2634 * _2552;
    int _2646 = _2644 + _2614;
    out.m_76.x = _2628;
    out.m_76.y = _2630;
    out.m_76.z = _2440;
    float _2648 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2650 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _2652 = isnan(1.0);
    bool _2654 = _2650 || _2652;
    bool _2656 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2658 = _2654 || _2656;
    float _2660 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2640);
    float _2662 = _2584 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2664 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2648);
    float _2666 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2642);
    float _2668 = float(_2638);
    float _2670 = fma(_2662, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2066);
    float _2672 = float(_2646);
    float _2674 = fma(_2662, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2060);
    float _2676 = fma(_2662, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2070);
    float _2678 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2664);
    float _2680 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2660);
    float _2682 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2666);
    out.m_78.x = _2668;
    out.m_78.y = _2672;
    float _2684 = _2670 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2686 = _2674 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2688 = _2676 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2690 = _2680 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2692 = _2682 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2694 = _2690 + _2686;
    float _2696 = _2692 + _2688;
    float _2698 = _2678 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2700 = _2698 + _2684;
    float _2702 = _2624;
    float _2704 = _2626;
    float _2706 = _2622;
    float _2708 = _2678;
    float _2710 = _2626;
    float _2712 = _2624;
    float _2714 = _2698;
    float _2716 = _2622;
    float _2718 = _2678;
    float _2720 = _2672;
    float _2722 = _2670;
    float _2732;
    float _2734;
    float _2736;
    float _2738;
    if (!_2658)
    {
        bool _2724 = _2686 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2726 = !_2724;
        _2728 = _2726;
        if (!_2728)
        {
            float _2730 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _2732 = _2730;
            _2734 = 0.0;
            _2736 = 0.0;
            _2738 = 0.0;
            _2740 = true;
        }
    }
    if ((!_2740) || _2728)
    {
        bool _2776;
        if (!_2728)
        {
            bool _2742 = _2686 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2744 = isnan(_2686);
            bool _2746 = _2742 || _2744;
            bool _2748 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2750 = _2746 || _2748;
            bool _2752 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2754 = !_2750;
            bool _2756 = _2752 && _2754;
            bool _2758 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _2714 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2756)
            {
                _2702 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2760 = _2702;
            float _2762 = _2760;
            if (_2756)
            {
                _2704 = 0.0;
                _2706 = 0.0;
            }
            float _2764 = _2704;
            float _2766 = _2706;
            _2710 = _2764;
            _2716 = _2766;
            _2734 = _2766;
            _2736 = _2764;
            if (_2756)
            {
                _2708 = 0.0;
            }
            float _2768 = _2708;
            _2718 = _2768;
            _2738 = _2768;
            if (_2756)
            {
                float _2770 = _2760 * 5.0;
                _2762 = _2770;
            }
            float _2772 = _2762;
            bool _2774 = !_2750;
            _2776 = _2774 && _2758;
            _2712 = _2772;
            _2732 = _2772;
        }
        if ((!_2776) || _2728)
        {
            _2728 = false;
            float _2778 = _2710;
            float _2780 = _2712;
            float _2782 = _2714;
            float _2784 = _2716;
            float _2786 = _2718;
            bool _2788 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2790 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2792 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2794 = _2778;
            float _2796 = _2784;
            float _2798 = _2782;
            float _2800 = _2786;
            if (_2788)
            {
                float _2802 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2794 = _2802;
            }
            float _2804 = _2794;
            if (_2788)
            {
                float _2806 = abs(_2004);
                float _2808 = -_2806;
                float _2810 = _2808 + 1.0;
                _2250 = _2810;
            }
            float _2812 = _2250;
            if (_2790)
            {
                float _2814 = abs(_1958);
                float _2816 = -_2814;
                float _2818 = _2816 + 1.0;
                _2252 = _2818;
            }
            float _2820 = _2252;
            if (!_2788)
            {
                _2720 = 1.0;
            }
            float _2822 = _2720;
            float _2824 = _2822;
            if (_2792)
            {
                float _2826 = abs(_2584);
                float _2828 = -_2826;
                float _2830 = _2828 + 1.0;
                _2796 = _2830;
            }
            float _2832 = _2796;
            if (!_2790)
            {
                _2798 = 1.0;
            }
            float _2834 = _2798;
            float _2836 = _2834;
            if (!_2792)
            {
                _2800 = 1.0;
            }
            float _2838 = _2800;
            float _2840 = _2780;
            float _2842 = _2838;
            if (_2790)
            {
                float _2844 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2840 = _2844;
            }
            float _2846 = _2840;
            float _2848 = _2692;
            if (_2792)
            {
                float _2850 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2848 = _2850;
            }
            float _2852 = _2848;
            if (_2788)
            {
                float _2854 = _2812 * _2804;
                float _2856 = precise::clamp(_2854, 0.0, 1.0);
                _2824 = _2856;
            }
            float _2858 = _2824;
            _2736 = _2694;
            if (_2790)
            {
                float _2860 = _2820 * _2846;
                float _2862 = precise::clamp(_2860, 0.0, 1.0);
                _2836 = _2862;
            }
            float _2864 = _2836;
            float _2866 = _2858 * _2864;
            _2732 = _2696;
            if (_2792)
            {
                float _2868 = _2832 * _2852;
                float _2870 = precise::clamp(_2868, 0.0, 1.0);
                _2842 = _2870;
            }
            float _2872 = _2842;
            float _2874 = _2866 * _2872;
            _2734 = _2700;
            _2738 = _2874;
        }
    }
    _2740 = false;
    float _2876 = _2732;
    float _2878 = _2734;
    float _2880 = _2736;
    float _2882 = _2738;
    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2886 = _2876 + _2884;
    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2890 = _2878 + _2888;
    float _2892 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2894 = _2886 * _2886;
    bool _2896 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2898 = isnan(0.5);
    bool _2900 = _2896 || _2898;
    bool _2902 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2904 = _2900 || _2902;
    float _2906 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2892);
    float _2908 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2910 = fma(_2890, _2890, _2894);
    bool _2912 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2914 = isnan(0.5);
    bool _2916 = _2912 || _2914;
    bool _2918 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2920 = _2916 || _2918;
    float _2922 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2906);
    float _2924 = sqrt(_2910);
    float _2926 = _2922 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2928 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2908);
    float _2930 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2928);
    float _2932 = 1.0 / _2926;
    float _2934 = _2930 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2936 = _2934 + _2926;
    bool _2938 = _2924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2940 = _2936 * _2932;
    float _2942 = _2940 * 0.5;
    bool _2944 = !_2938;
    float _2946 = _2878;
    float _2948 = _2880;
    float _2950 = _2876;
    float _2952 = _2890;
    float _2954 = _2910;
    if (!_2944)
    {
        float _2956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2958 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2960 = _2924 + _2958;
        float _2962 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2964 = rsqrt(_2910);
        float _2966 = _2960 * _2956;
        float _2968 = _2966 * 0.15915493667125701904296875;
        float _2970 = _2968 * 6.283185482025146484375;
        float _2972 = cos(_2970);
        float _2974 = _2968 * 6.283185482025146484375;
        float _2976 = sin(_2974);
        float _2978 = _2972 + (-1.0);
        float _2980 = fma(_2976, _2962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2982 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2984 = _2964 * _2980;
        float _2986 = fma(_2972, _2880, _2982);
        float _2988 = fma(_2890, _2984, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2990 = fma(_2886, _2984, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2946 = _2988;
        _2948 = _2986;
        _2950 = _2990;
    }
    float _2992 = _2946;
    float _2994 = _2948;
    float _2996 = _2950;
    float _2998 = _2994;
    float _3000 = _2992;
    float _3002 = _2996;
    if (_2920)
    {
        _2722 = 1.0;
    }
    float _3004 = _2722;
    float _3006 = _3004;
    if (!_2904)
    {
        float _3008 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3010 = _2686 + _3008;
        float _3012 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3014 = _2684 + _3012;
        float _3016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3018 = -_2684;
        float _3020 = _3018 + _2992;
        float _3022 = _3010 * _3010;
        float _3024 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3026 = _2688 + _3024;
        float _3028 = fma(_3014, _3014, _3022);
        float _3030 = fma(_3026, _3026, _3028);
        float _3032 = sqrt(_3030);
        float _3034 = precise::min(_3032, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3036 = _3034 * _3016;
        float _3038 = -_2686;
        float _3040 = _3038 + _2994;
        float _3042 = -_2688;
        float _3044 = _3042 + _2996;
        float _3046 = fma(_3020, _3036, _2684);
        float _3048 = fma(_3040, _3036, _2686);
        float _3050 = fma(_3044, _3036, _2688);
        _2998 = _3048;
        _3000 = _3046;
        _3002 = _3050;
    }
    float _3052 = _2998;
    float _3054 = _3000;
    float _3056 = _3002;
    if (!_2920)
    {
        float _3058 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3060 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3058);
        float _3062 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3064 = _3062 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _3066 = 1.0 / _3060;
        float _3068 = 1.0 / _3064;
        float _3070 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3072 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3074 = fma(_3066, _3070, _3072);
        float _3076 = _3074 * _3068;
        float _3078 = precise::clamp(_3076, 0.0, 1.0);
        _3006 = _3078;
    }
    float _3080 = _3006;
    float _3082 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3084 = _3052 + _3082;
    float _3086 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3088 = _3054 + _3086;
    float _3090 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3092 = _3056 + _3090;
    float _3094 = _3084 * _3084;
    float _3096 = fma(_3088, _3088, _3094);
    float _3098 = fma(_3092, _3092, _3096);
    float _3100 = rsqrt(_3098);
    float _3102 = sqrt(_3098);
    float _3104 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3106 = _3088 * _3104;
    float _3108 = _3092 * _3104;
    float _3110 = _3106 * _3106;
    float _3112 = _3108 * _3108;
    float _3114 = _3110 + _3112;
    float _3116 = sqrt(_3114);
    bool _3118 = _3116 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3120 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3122 = _3116 + _3120;
    float _3124 = _3100;
    float _3126 = _3114;
    float _3128 = _3122;
    float _3130 = _3084;
    if (_3118)
    {
        float _3132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3124 = _3132;
    }
    float _3134 = _3124;
    if (_3118)
    {
        float _3136 = rsqrt(_3114);
        _3126 = _3136;
    }
    float _3138 = _3126;
    float _3140 = _3138;
    if (_3118)
    {
        float _3142 = _3122 * _3134;
        _3128 = _3142;
    }
    float _3144 = _3128;
    if (_3118)
    {
        float _3146 = _3144 * 0.15915493667125701904296875;
        _2952 = _3146;
    }
    float _3148 = _2952;
    float _3150 = _3092;
    if (_3118)
    {
        float _3152 = _3148 * 6.283185482025146484375;
        float _3154 = sin(_3152);
        _3150 = _3154;
    }
    float _3156 = _3150;
    float _3158 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3160 = precise::max(0.0, _3158);
    float _3162 = _3134;
    float _3164 = _3160;
    if (_3118)
    {
        float _3166 = _3148 * 6.283185482025146484375;
        float _3168 = cos(_3166);
        _3162 = _3168;
    }
    float _3170 = _3162;
    float _3172 = -_3104;
    float _3174 = -_3160;
    float _3176 = fma(_3084, _3172, _3174);
    if (_3118)
    {
        float _3178 = _3176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3130 = _3178;
    }
    float _3180 = _3130;
    float _3182 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3184 = _3180;
    float _3186 = _3156;
    if (_3118)
    {
        float _3188 = fma(_3156, _3180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3184 = _3188;
    }
    float _3190 = _3184;
    float _3192 = _3190;
    if (!_3118)
    {
        _3186 = _3106;
    }
    float _3194 = _3186;
    float _3196 = _3194;
    float _3198 = _3170;
    if (_3118)
    {
        float _3200 = _3170 + (-1.0);
        _3164 = _3200;
    }
    float _3202 = _3164;
    float _3204 = _3202;
    if (_3118)
    {
        float _3206 = _3138 * _3190;
        _2254 = _3206;
    }
    float _3208 = _2254;
    if (!_3118)
    {
        _3192 = _3176;
    }
    float _3210 = _3192;
    float _3212 = _3210;
    if (_3118)
    {
        float _3214 = _3202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2954 = _3214;
    }
    float _3216 = _2954;
    if (_3118)
    {
        float _3218 = _3106 * _3208;
        _3196 = _3218;
    }
    float _3220 = _3196;
    if (!_3118)
    {
        _3204 = _3108;
    }
    float _3222 = _3204;
    float _3224 = _3222;
    if (_3118)
    {
        float _3226 = _3108 * _3208;
        _3224 = _3226;
    }
    float _3228 = _3224;
    if (!_3118)
    {
        _3140 = _3110;
    }
    float _3230 = _3140;
    float _3232 = _3230;
    if (_3118)
    {
        float _3234 = fma(_3176, _3170, _3216);
        _3212 = _3234;
    }
    float _3236 = _3212;
    if (_3118)
    {
        float _3238 = _3220 * _3220;
        _3232 = _3238;
    }
    float _3240 = _3232;
    if (!_3118)
    {
        _3198 = _3112;
    }
    float _3242 = _3198;
    float _3244 = _3242;
    if (_3118)
    {
        float _3246 = _3228 * _3228;
        _3244 = _3246;
    }
    float _3248 = _3244;
    float _3250 = fma(_3236, _3236, _3240);
    float _3252 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3254 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3256 = _3250 + _3248;
    float _3258 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3182);
    float _3260 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3262 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3264 = fma(_3102, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3262);
    float _3266 = precise::clamp(_3264, 0.0, 1.0);
    float _3268 = rsqrt(_3256);
    float _3270 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3258);
    float _3272 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3274 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3260);
    float _3276 = -_3266;
    float _3278 = _3276 + 1.0;
    float _3280 = _3270 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3282 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3272);
    float _3284 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3274);
    float _3286 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3252);
    float _3288 = _3280 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3290 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3282);
    float _3292 = _3284 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3294 = abs(_3278);
    float _3296 = log2(_3294);
    float _3298 = -_3288;
    float _3300 = fma(_3298, _3254, 1.0);
    float _3302 = _3290 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3304 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3306 = _3268 * _3220;
    float _3308 = _3268 * _3236;
    float _3310 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3286);
    float _3312 = fma(_3302, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3304);
    float _3314 = _3306 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3316 = _3268 * _3228;
    float _3318 = _3310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3320 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3312);
    float _3322 = -_3314;
    float _3324 = fma(_3308, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3322);
    float _3326 = log2(_3300);
    float _3328 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3330 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3320);
    float _3332 = -_3316;
    float _3334 = fma(_3332, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3324);
    float _3336 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3338 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3340 = fma(_3302, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3328);
    float _3342 = fma(_3334, -0.5, 0.5);
    float _3344 = 1.0 / _3330;
    float _3346 = fma(_3302, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3338);
    float _3348 = fma(_3334, 0.5, 0.5);
    float _3350 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3340);
    float _3352 = _3308 + 1.0;
    float _3354 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3346);
    float _3356 = fma(_3348, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3358 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3350);
    float _3360 = exp2(_3336);
    float _3362 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3354);
    float _3364 = fma(_3348, _3356, -0.212114393711090087890625);
    float _3366 = _3326 * 0.693147182464599609375;
    float _3368 = fma(_3348, _3364, 1.570728778839111328125);
    float _3370 = _3366 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3372 = sqrt(_3342);
    float _3374 = _3362 * _3344;
    float _3376 = fma(_3374, 0.5, 0.5);
    float _3378 = -_3308;
    float _3380 = fma(_3360, _3352, _3378);
    float _3382 = _3358 * _3344;
    float _3384 = fma(_3380, 0.5, 0.5);
    float _3386 = fma(_3382, -0.5, 0.5);
    float _3388 = _3372 * 0.636619746685028076171875;
    float3 _9067 = float3(_3376, _3386, _3370);
    float _3390 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9067, float3(0.0), isnan(_9067)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9067, float3(0.0), isnan(_9067)), level(0.0)).x;
    float3 _9078 = float3(_3376, _3386, _3370);
    float4 _3393 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9078, float3(0.0), isnan(_9078)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9078, float3(0.0), isnan(_9078)), level(0.0)).xyzw;
    float _3395 = _3393.x;
    float _3397 = _3393.y;
    float _3399 = _3393.z;
    float _3401 = _3393.w;
    float _3403 = -_3368;
    float _3405 = fma(_3388, _3403, 1.0);
    float2 _9100 = float2(_3405, _3384);
    float3 _3409 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9100, float2(0.0), isnan(_9100)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9100, float2(0.0), isnan(_9100)), level(0.0)).xyz;
    float _3411 = _3409.x;
    float _3413 = _3409.y;
    float _3415 = _3409.z;
    float _3417 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3419 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3421 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    out.m_80.y = 1.0;
    float _3423 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3417);
    float _3425 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3427 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3419);
    float _3429 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3421);
    float _3431 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3423);
    float _3433 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3425);
    float _3435 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3427);
    float _3437 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3429);
    float _3439 = _3431 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3441 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3433);
    float _3443 = _3435 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3445 = -_633;
    float _3447 = _3445 + _3052;
    float _3449 = -_631;
    float _3451 = _3449 + _3054;
    float _3453 = -_635;
    float _3455 = _3453 + _3056;
    float _3457 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3459 = _3447 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3461 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3463 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3465 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3467 = fma(_3451, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3459);
    float _3469 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3471 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3461);
    float _3473 = _3437 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3475 = fma(_3455, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3467);
    float _3477 = fma(_3302, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3457);
    float _3479 = _3447 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3481 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3463);
    float _3483 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3469);
    float _3485 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3465);
    float _3487 = _3447 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3489 = fma(_3451, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3479);
    float _3491 = _3473 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3493 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3477);
    float _3495 = fma(_3451, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3487);
    float _3497 = _3441 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3499 = _3491 + _3485;
    float _3501 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3503 = _3475 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3505 = fma(_3473, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3483);
    float _3507 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3499);
    float _3509 = exp2(_3501);
    float _3511 = fma(_3455, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3489);
    float _3513 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3505);
    float _3515 = _3473 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3517 = _3473 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3519 = _3511 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3521 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3493);
    float _3523 = _3515 + _3471;
    float _3525 = 1.0 / _3507;
    float _3527 = fma(_3455, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3495);
    float _3529 = _3362 + _3330;
    float _3531 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3523);
    out.gl_Position.x = _3362;
    out.gl_Position.y = _3358;
    out.gl_Position.z = _3521;
    out.gl_Position.w = _3330;
    float _3533 = _3330 * 0.5;
    float _3535 = _3529 * 0.5;
    float _3537 = 1.0 / _3503;
    float _3539 = -_3509;
    float _3541 = _3539 + 1.0;
    float _3543 = fma(_3358, -0.5, _3533);
    out.m_82.x = _3054;
    out.m_82.y = _3052;
    out.m_82.z = _3056;
    float _3545 = _3527 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3547 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3549 = _3513 * _3525;
    float _3551 = _3521 + _3330;
    float _3553 = _3531 * _3525;
    bool _3555 = _3549 > 0.0;
    float _3557 = _3551 * 0.5;
    float _3559 = _3519 * _3537;
    float _3561 = _3517 + _3481;
    bool _3563 = _3549 < 1.0;
    bool _3565 = _3563 && _3555;
    out.m_84.x = _3535;
    out.m_84.y = _3543;
    out.m_84.z = _3557;
    out.m_84.w = _3330;
    float _3567 = _3545 * _3537;
    float _3569 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3561);
    bool _3571 = _3374 > (-1.0);
    bool _3573 = _3571 && _3565;
    bool _3575 = _3382 > (-1.0);
    bool _3577 = _3575 && _3573;
    bool _3579 = _3374 < 1.0;
    bool _3581 = _3579 && _3577;
    bool _3583 = _3382 < 1.0;
    bool _3585 = _3583 && _3581;
    float _3587 = _3547 * _3390;
    float _3589 = _3569 * _3525;
    float _3591 = _3401 * _3587;
    float _3593 = _3415 * _3587;
    float _3595 = -_3547;
    float _3597 = _3595 + 1.0;
    float _3599 = fma(_3411, _3591, _3395);
    float _3601 = fma(_3413, _3591, _3397);
    float _3603 = fma(_3401, _3593, _3399);
    float _3605 = _3401 * _3597;
    out.m_86.x = _3599;
    out.m_86.y = _3601;
    out.m_86.z = _3603;
    out.m_86.w = _3605;
    bool _3607 = !_3585;
    float _3609 = _3491;
    float _3611 = _3497;
    float _3613 = _3597;
    float _3645;
    float _3647;
    float _3649;
    float _3657;
    if (!_3607)
    {
        float _3615 = -_3589;
        float _3617 = _3382 + _3615;
        float _3619 = -_3553;
        float _3621 = _3374 + _3619;
        float _3623 = _2882 * _3080;
        float _3625 = -_3559;
        float _3627 = _3374 + _3625;
        float _3629 = _3617 * _3617;
        float _3631 = -_3567;
        float _3633 = _3382 + _3631;
        float _3635 = _3623 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _3637 = fma(_3621, _3621, _3629);
        float _3639 = sqrt(_3637);
        bool _3641 = _3639 > 0.0;
        float _3643 = _3623;
        _3645 = _3621;
        _3647 = _3637;
        _3649 = _3639;
        if (!_3641)
        {
            _3643 = _3635;
        }
        float _3651 = _3643;
        bool _3653 = !_3641;
        float _3655 = _3651;
        _3657 = _3651;
        _3659 = _3653;
        if (!_3659)
        {
            float _3661 = _3633 * _3633;
            float _3663 = fma(_3627, _3627, _3661);
            float _3665 = rsqrt(_3637);
            float _3667 = sqrt(_3663);
            float _3669 = _3621 * _3665;
            float _3671 = _3617 * _3665;
            bool _3673 = _3667 > 0.0;
            _3613 = _3667;
            _3649 = _3665;
            if (!_3673)
            {
                _3655 = _3635;
            }
            float _3675 = _3655;
            bool _3677 = !_3673;
            _3657 = _3675;
            _3659 = _3677;
            if (!_3659)
            {
                float _3679 = _1874 * _3497;
                float _3681 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3683 = fma(_3679, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3491);
                float _3685 = fma(_3679, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3517);
                float _3687 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3683);
                float _3689 = fma(_3679, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3515);
                float _3691 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3685);
                float _3693 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3689);
                float _3695 = 1.0 / _3687;
                float _3697 = _3681 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3699 = _3633 * _3697;
                float _3701 = _3627 * _3697;
                float _3703 = rsqrt(_3663);
                float _3705 = _3699 * _3699;
                float _3707 = fma(_3701, _3701, _3705);
                float _3709 = _3691 * _3695;
                float _3711 = _3693 * _3695;
                float _3713 = _3709 * _3709;
                float _3715 = sqrt(_3707);
                float _3717 = fma(_3711, _3711, _3713);
                float _3719 = _3633 * _3703;
                float _3721 = _3627 * _3703;
                float _3723 = sqrt(_3717);
                float _3725 = _3671 * _3719;
                float _3727 = fma(_3669, _3721, _3725);
                float _3729 = precise::min(0.0, _3727);
                float _3731 = _3330 * _3729;
                float _3733 = fma(_3715, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3723);
                float _3735 = fma(_3701, _3731, _3362);
                float _3737 = fma(_3699, _3731, _3358);
                float _3739 = 1.0 / _3733;
                out.gl_Position.x = _3735;
                out.gl_Position.y = _3737;
                float _3741 = _3723 * _3739;
                out.m_80.y = _3741;
                _3645 = _3731;
                _3609 = _3715;
                _3657 = _3635;
                _3611 = _3741;
                _3647 = _3701;
                _3613 = _3699;
                _3649 = _3727;
                _3659 = true;
            }
        }
    }
    else
    {
        float _3743 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3743;
        _3645 = 0.0;
        _3657 = 0.0;
        _3647 = 0.0;
        _3613 = _3743;
        _3649 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    _3659 = false;
    float _3745 = _3645;
    float _3747 = _3609;
    float _3749 = _3657;
    float _3751 = _3611;
    float _3753 = _3647;
    float _3755 = _3613;
    float _3757 = _3649;
    bool _3759 = _3102 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3761 = isnan(_3102);
    bool _3763 = _3759 || _3761;
    bool _3765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3767 = _3763 || _3765;
    float _3769 = _3751;
    float _3771 = _3747;
    float _3773 = _3755;
    float _3775 = _3753;
    float _3777 = _3745;
    float _3779 = _3757;
    if (!_3767)
    {
        _3769 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3781 = _3769;
    float _3783 = _3781;
    float _3785 = _3781;
    if (!_3767)
    {
        _3771 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3787 = _3771;
    float _3789 = _3787;
    float _3791 = _3787;
    if (!_3767)
    {
        _3773 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3793 = _3773;
    float _3795 = _3793;
    float _3797 = _3793;
    if (!_3767)
    {
        _3775 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3799 = _3775;
    float _3801 = _3799;
    float _3803 = _3799;
    if (!_3767)
    {
        _3777 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3805 = _3777;
    float _3807 = _3805;
    float _3809 = _3805;
    if (!_3767)
    {
        _3779 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3811 = _3779;
    bool _3813 = !_3767;
    float _3815 = _3811;
    float _3817 = _3811;
    if (!_3813)
    {
        bool _3819 = _3102 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3821 = isnan(_3102);
        bool _3823 = _3819 || _3821;
        bool _3825 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3827 = _3823 || _3825;
        if (!_3827)
        {
            float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3831 = _3102 + _3829;
            float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3835 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3833;
            float _3837 = 1.0 / _3835;
            float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3841 = _3839 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3851 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3853 = _3851 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3857 = _3855 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3859 = _3831 * _3837;
            float _3861 = precise::clamp(_3859, 0.0, 1.0);
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3867 = fma(_3861, _3841, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3869 = fma(_3861, _3865, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3871 = fma(_3861, _3845, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3873 = fma(_3861, _3849, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3875 = fma(_3861, _3853, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3877 = fma(_3861, _3857, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3791 = _3869;
            _3809 = _3875;
            _3785 = _3867;
            _3803 = _3873;
            _3797 = _3871;
            _3817 = _3877;
            _3879 = true;
        }
        else
        {
            bool _3881 = _3102 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3883 = isnan(_3102);
            bool _3885 = _3881 || _3883;
            bool _3887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3889 = _3885 || _3887;
            if (!_3889)
            {
                _3783 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3891 = _3783;
            _3785 = _3891;
            if (!_3889)
            {
                _3789 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3893 = _3789;
            _3791 = _3893;
            if (!_3889)
            {
                _3795 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3895 = _3795;
            _3797 = _3895;
            if (!_3889)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3897 = _3801;
            _3803 = _3897;
            if (!_3889)
            {
                _3807 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3899 = _3807;
            _3809 = _3899;
            if (!_3889)
            {
                _3815 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3901 = _3815;
            bool _3903 = !_3889;
            _3817 = _3901;
            if (!_3903)
            {
                bool _3905 = _3102 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3907 = isnan(_3102);
                bool _3909 = _3905 || _3907;
                bool _3911 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3913 = _3909 || _3911;
                if (!_3913)
                {
                    float _3915 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3917 = _3102 + _3915;
                    float _3919 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3921 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3919;
                    float _3923 = 1.0 / _3921;
                    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3931 = _3929 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3935 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3939 = _3937 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3941 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3943 = _3941 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3945 = _3917 * _3923;
                    float _3947 = precise::clamp(_3945, 0.0, 1.0);
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3951 = _3949 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3953 = fma(_3947, _3927, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3955 = fma(_3947, _3951, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3957 = fma(_3947, _3931, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3959 = fma(_3947, _3935, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3961 = fma(_3947, _3939, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3963 = fma(_3947, _3943, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3791 = _3955;
                    _3809 = _3961;
                    _3785 = _3953;
                    _3803 = _3959;
                    _3797 = _3957;
                    _3817 = _3963;
                    _3879 = true;
                }
                else
                {
                    _3791 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3809 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3785 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3797 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3817 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3879 = false;
    float _3965 = _3791;
    float _3967 = _3809;
    float _3969 = _3785;
    float _3971 = _3803;
    float _3973 = _3797;
    float _3975 = _3817;
    float _3977 = fma(_2630, -0.5, 0.5);
    float _3979 = precise::clamp(_3977, 0.0, 1.0);
    float _3981 = -_3965;
    float _3983 = _3981 + _3967;
    float _3985 = _3749 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3987 = -_3969;
    float _3989 = _3987 + _3971;
    float _3991 = fma(_3979, _3983, _3965);
    out.m_88.x = 0.0;
    float _3993 = -_3973;
    float _3995 = _3993 + _3975;
    float _3997 = fma(_3979, _3989, _3969);
    float _3999 = _3991 * 0.586610972881317138671875;
    out.m_49.x = _3985;
    bool _4001 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4003 = fma(_3979, _3995, _3973);
    float _4005 = fma(_3997, 0.298911988735198974609375, _3999);
    bool _4007 = _3080 > 0.0;
    bool _4009 = isnan(_3080);
    bool _4011 = _4007 || _4009;
    bool _4013 = isnan(0.0);
    bool _4015 = _4011 || _4013;
    float _4017 = fma(_4003, 0.114477999508380889892578125, _4005);
    float _4019 = -_4017;
    float _4021 = _3997 + _4019;
    float _4023 = -_4017;
    float _4025 = _3991 + _4023;
    float _4027 = -_4017;
    float _4029 = _4003 + _4027;
    float _4031 = fma(_4021, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4017);
    float _4033 = fma(_4025, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4017);
    float _4035 = fma(_4029, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4017);
    bool _4037 = !_4001;
    if (!_4037)
    {
        float _4039 = -_3052;
        float _4041 = _4039 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4043 = -_3054;
        float _4045 = _4043 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4047 = -_3056;
        float _4049 = _4047 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4051 = _4041 * _4041;
        float _4053 = fma(_4045, _4045, _4051);
        float _4055 = fma(_4049, _4049, _4053);
        float _4057 = sqrt(_4055);
        float _4059 = rsqrt(_4055);
        float _4061 = -_4057;
        float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4065 = _4063 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4067 = precise::clamp(_4065, 0.0, 1.0);
        float _4069 = _4045 * _4059;
        float _4071 = _4041 * _4059;
        float _4073 = abs(_4067);
        float _4075 = log2(_4073);
        float _4077 = _4049 * _4059;
        float _4079 = _4069 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4081 = _2630 * _4071;
        float _4083 = -_4071;
        float _4085 = -_4079;
        float _4087 = fma(_4083, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4085);
        float _4089 = fma(_2628, _4069, _4081);
        float _4091 = -_4077;
        float _4093 = fma(_4091, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4087);
        float _4095 = fma(_2440, _4077, _4089);
        float _4097 = precise::clamp(_4095, 0.0, 1.0);
        float _4099 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4101 = _4093 + _4099;
        float _4103 = _4075 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4105 = _4101 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4107 = precise::clamp(_4105, 0.0, 1.0);
        float _4109 = exp2(_4103);
        float _4111 = _4109 * _4107;
        float _4113 = _4097 * _4111;
        float _4115 = _4113 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4117 = _4113 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4119 = _4113 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _4115;
        out.m_88.y = _4117;
        out.m_88.z = _4119;
    }
    out.m_90.x = _4031;
    out.m_90.y = _4033;
    out.m_90.z = _4035;
    if (_4015)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _4121 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4121;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3879 = false;
    bool _3659 = false;
    bool _2740 = false;
    bool _2728 = false;
    bool _655 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4178 = as_type<float>(_125);
        out.gl_Position.z = _4178;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_51.w;
    float _131 = in.m_53.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.x = _131;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_109);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _119;
    if (_159)
    {
        out.m_49.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4251 = as_type<float>(_165);
        out.gl_Position.z = _4251;
    }
    if (_159)
    {
        return out;
    }
    float _167 = in.m_57.x;
    float _169 = in.m_57.y;
    float _171 = in.m_57.z;
    float _173 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_59.x;
    float _177 = in.m_59.y;
    float _179 = in.m_59.z;
    float _181 = in.m_61.x;
    float _183 = in.m_61.y;
    float _185 = in.m_61.z;
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_51.x;
    float _191 = in.m_51.y;
    float _193 = in.m_51.z;
    float _195 = _167 * _167;
    float _197 = _169 * _169;
    float _199 = fma(_175, _175, _195);
    float _201 = fma(_177, _177, _197);
    float _203 = fma(_181, _181, _199);
    float _205 = _171 * _171;
    float _207 = fma(_183, _183, _201);
    float _209 = sqrt(_203);
    float _211 = fma(_179, _179, _205);
    float _213 = fma(_185, _185, _211);
    float _215 = sqrt(_207);
    float _217 = sqrt(_213);
    bool _219 = _209 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = 0.0;
    float _225 = _203;
    if (_219)
    {
        float _227 = rsqrt(_203);
        _223 = _227;
    }
    float _229 = _223;
    float _231 = 0.0;
    if (!_219)
    {
        _231 = 0.0;
    }
    float _233 = _231;
    bool _235 = _217 > 0.0;
    float _237 = 0.0;
    float _239 = _233;
    float _241 = _217;
    if (!_219)
    {
        _237 = 0.0;
    }
    float _243 = _237;
    int _245 = as_type<int>(_187) & 1;
    bool _247 = _245 != 0;
    int _249 = as_type<int>(_187) & 2;
    bool _251 = _249 != 0;
    float _253 = _209;
    float _255 = _187;
    float _257 = _243;
    if (_221)
    {
        float _259 = rsqrt(_207);
        _253 = _259;
    }
    float _261 = _253;
    bool _263 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _267 = _263 || _265;
    bool _269 = isnan(1.0);
    bool _271 = _267 || _269;
    if (!_221)
    {
        _255 = 0.0;
    }
    float _273 = _255;
    float _275 = 0.0;
    float _277 = _273;
    if (!_221)
    {
        _275 = 0.0;
    }
    float _279 = _275;
    float _281 = _279;
    if (!_221)
    {
        _225 = 0.0;
    }
    float _283 = _225;
    float _285 = _213;
    float _287 = _283;
    if (_235)
    {
        float _289 = rsqrt(_213);
        _285 = _289;
    }
    float _291 = _285;
    if (_219)
    {
        float _293 = _229 * _175;
        _239 = _293;
    }
    float _295 = _239;
    if (!_219)
    {
        _241 = 0.0;
    }
    float _297 = _241;
    float _299 = _297;
    if (_219)
    {
        float _301 = _229 * _167;
        _257 = _301;
    }
    float _303 = _257;
    float _305 = 0.0;
    if (!_235)
    {
        _305 = 0.0;
    }
    float _307 = _305;
    float _309 = 0.0;
    float _311 = _307;
    if (!_271)
    {
        float _313 = _173 * _173;
        float _315 = _313 * 0.5;
        _309 = _315;
    }
    float _317 = _309;
    float _319 = 0.0;
    float _321 = _317;
    if (!_235)
    {
        _319 = 0.0;
    }
    float _323 = _319;
    float _325 = _261;
    float _327 = _323;
    if (_221)
    {
        float _329 = _261 * _177;
        _277 = _329;
    }
    float _331 = _277;
    if (_221)
    {
        float _333 = _261 * _169;
        _281 = _333;
    }
    float _335 = _281;
    if (_221)
    {
        float _337 = _261 * _183;
        _287 = _337;
    }
    float _339 = _287;
    float _341 = _339;
    if (!_235)
    {
        _325 = 0.0;
    }
    float _343 = _325;
    float _345 = _343;
    if (_219)
    {
        float _347 = _229 * _181;
        _299 = _347;
    }
    float _349 = _299;
    bool _351 = !_247;
    float _353 = _351 ? (-0.5) : 0.5;
    if (!_271)
    {
        float _355 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _321 = _355;
    }
    float _357 = _321;
    float _359 = _357;
    if (_235)
    {
        float _361 = _291 * _179;
        _311 = _361;
    }
    float _363 = _311;
    if (_235)
    {
        float _365 = _291 * _171;
        _327 = _365;
    }
    float _367 = _327;
    if (_235)
    {
        float _369 = _291 * _185;
        _345 = _369;
    }
    float _371 = _345;
    bool _373 = !_251;
    float _375 = _373 ? (-0.5) : 0.5;
    bool _377 = !_271;
    float _379 = 0.0;
    float _381 = 0.0;
    if (!_377)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _393 = _173 * _385;
        float _395 = 1.0 / _389;
        float _397 = _391 * 0.693147182464599609375;
        float _399 = exp2(_393);
        float _401 = 1.0 / _397;
        float _403 = _399 + (-1.0);
        float _405 = -_403;
        float _407 = fma(_405, _401, _173);
        float _409 = _407 * _395;
        float _411 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _359 = _411;
        _379 = _409;
        _381 = _395;
    }
    float _413 = _359;
    float _415 = _379;
    float _417 = _381;
    float _419 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _421 = _417;
    float _423 = _415;
    if (!_271)
    {
        _421 = _173;
    }
    float _425 = _421;
    bool _427 = !_271;
    float _429 = _425;
    if (!_427)
    {
        float _431 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _433 = log2(_431);
        float _435 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _437 = _435 + 1.0;
        float _439 = 1.0 / _437;
        float _441 = _173 * _433;
        float _443 = exp2(_441);
        float _445 = -_443;
        float _447 = _445 + 1.0;
        float _449 = _447 * _439;
        _423 = _439;
        _429 = _449;
    }
    float _451 = _423;
    float _453 = _429;
    float _455 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _457 = _419 * _303;
    float _459 = _419 * _335;
    float _461 = _419 * _367;
    float _463 = _451;
    if (!_271)
    {
        float _465 = _145 * _145;
        float _467 = _465 * 0.5;
        _463 = _467;
    }
    float _469 = _463;
    float _471 = fma(_455, _295, _457);
    float _473 = fma(_455, _331, _459);
    float _475 = fma(_455, _363, _461);
    float _477 = _469;
    if (!_271)
    {
        float _479 = _469 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _477 = _479;
    }
    float _481 = _477;
    bool _483 = !_271;
    float _485 = _481;
    if (!_483)
    {
        float _487 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _489 = log2(_487);
        float _491 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _493 = _491 + 1.0;
        float _495 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _497 = _145 * _489;
        float _499 = 1.0 / _493;
        float _501 = _495 * 0.693147182464599609375;
        float _503 = exp2(_497);
        float _505 = 1.0 / _501;
        float _507 = _503 + (-1.0);
        float _509 = -_507;
        float _511 = fma(_509, _505, _145);
        float _513 = _511 * _499;
        float _515 = _513 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _485 = _515;
    }
    float _517 = _485;
    float _519 = in.m_66.w;
    float _521 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _523 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _525 = in.m_46.x;
    float _527 = in.m_46.y;
    float _529 = in.m_46.z;
    float _531 = _521 * _303;
    float _533 = _521 * _335;
    float _535 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _537 = _521 * _367;
    float _539 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _541 = fma(_523, _349, _471);
    float _543 = fma(_535, _331, _533);
    float _545 = fma(_523, _339, _473);
    float _547 = fma(_523, _371, _475);
    float _549 = fma(_535, _295, _531);
    float _551 = fma(_535, _363, _537);
    float _553 = fma(_539, _339, _543);
    float _555 = fma(_453, _189, _541);
    float _557 = fma(_453, _191, _545);
    float _559 = fma(_453, _193, _547);
    float _561 = fma(_539, _349, _549);
    float _563 = fma(_539, _371, _551);
    if (!_271)
    {
        _341 = _145;
    }
    float _565 = _341;
    bool _567 = !_271;
    float _569 = _565;
    if (!_567)
    {
        float _571 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _573 = log2(_571);
        float _575 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _577 = _575 + 1.0;
        float _579 = 1.0 / _577;
        float _581 = _145 * _573;
        float _583 = exp2(_581);
        float _585 = -_583;
        float _587 = _585 + 1.0;
        float _589 = _587 * _579;
        _569 = _589;
    }
    float _591 = _569;
    float _593 = fma(_591, _191, _553);
    bool _595 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _597 = fma(_591, _189, _561);
    float _599 = fma(_591, _193, _563);
    float _601 = -_593;
    float _603 = _557 + _601;
    float _605 = fma(_555, _519, _525);
    float _607 = -_597;
    float _609 = _555 + _607;
    float _611 = -_599;
    float _613 = _559 + _611;
    float _615 = _603 * _177;
    float _617 = _603 * _169;
    float _619 = _603 * _183;
    float _621 = fma(_557, _519, _527);
    float _623 = fma(_609, _175, _615);
    float _625 = fma(_609, _167, _617);
    float _627 = fma(_609, _181, _619);
    float _629 = fma(_559, _519, _529);
    float _631 = fma(_613, _179, _623);
    float _633 = fma(_613, _171, _625);
    float _635 = fma(_613, _185, _627);
    bool _637 = !_595;
    float _653;
    if (!_637)
    {
        float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _641 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _645 = _643 * _639;
        float _647 = floor(_645);
        float _649 = -_647;
        float _651 = _645 + _649;
        _653 = _651;
        _655 = true;
    }
    else
    {
        float _657 = float(_109);
        float _659 = 1.0 / _657;
        float _661 = _145 * _659;
        _653 = _661;
    }
    _655 = false;
    float _663 = _653;
    float _665 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _667 = int(_665);
    float _669 = _621 * _177;
    float _671 = _621 * _169;
    float _673 = _621 * _183;
    float _675 = fma(_605, _175, _669);
    float _677 = fma(_605, _167, _671);
    float _679 = fma(_605, _181, _673);
    float _681 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _683 = int(_681);
    float _685 = _131 * 2.0;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _689 = _687 != 0;
    float _691 = in.m_53.w;
    float _693 = fma(_629, _171, _677);
    int _695 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _697 = _695 != 0;
    float _699 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _701 = int(_699);
    float _703 = float(_667);
    float _705 = fma(_629, _185, _679);
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _709 = _707 != 0;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _717 = _715 != 0;
    float _719 = in.m_59.w;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _723 = _663 + _721;
    bool _725 = _131 > 0.5;
    float _727 = 1.0 / _703;
    float _729 = float(_683);
    float _731 = in.m_61.w;
    bool _733 = !_717;
    int _735 = _733 ? 0 : 1;
    float _737 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _741 = _739 != 0;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _745 = _743 != 0;
    float _747 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _749 = int(_747);
    float _751 = float(uint(_701));
    int _753 = ~_701;
    int _755 = _753 + 1;
    float _757 = 0.0;
    if (_689)
    {
        _757 = _131;
    }
    float _759 = _757;
    float _761 = 0.0;
    float _763 = _759;
    if (_689)
    {
        _761 = 1.0;
    }
    float _765 = _761;
    float _767 = 1.0 / _729;
    float _769 = _727 * _145;
    float _771 = _765;
    if (!_689)
    {
        _771 = 1.2345600128173828125;
    }
    float _773 = _771;
    float _775 = float(uint(_749));
    float _777 = 1.0 / _751;
    float _779 = in.m_53.z;
    int _781 = ~_749;
    int _783 = _781 + 1;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _785;
    int _789 = ~_749;
    int _791 = _789 + 1;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _795 = _767 * _145;
    float _797 = trunc(_769);
    int _799 = int(_797);
    float _801 = in.m_53.y;
    float _803 = -_793;
    float _805 = fma(_737, 2.0, _803);
    float _807 = _705 + _731;
    bool _809 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _811 = isnan(_663);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -_145;
    float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[76].x, _805);
    float _825 = 1.0 / _775;
    int _827 = as_type<int>(_777) + (-2);
    float _829 = float(_749);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _831;
    float _835 = trunc(_795);
    int _837 = int(_835);
    float _839 = float(uint(_799));
    float _841 = _131 + _779;
    float _843 = as_type<float>(_827) * _839;
    float _845 = _841 + (-1.0);
    int _847 = as_type<int>(_825) + (-2);
    float _849 = _801 * 2.0;
    float _851 = trunc(_843);
    float _853 = precise::max(_851, 0.0);
    uint _856 = uint(_853);
    bool _858 = !_713;
    int _860 = _858 ? 0 : 1;
    float _862 = _801 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_689)
    {
        _763 = _801;
    }
    float _864 = _763;
    float _866 = _779 + _801;
    int _868 = abs(_860);
    float _870 = float(uint(_837));
    float _872 = floor(_849);
    bool _874 = !_709;
    int _876 = _874 ? 0 : 1;
    float _878 = _866 + (-1.0);
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _882 = _880 != 0;
    float _884 = as_type<float>(_847) * _870;
    float _886 = _864 * _773;
    int _888 = abs(_876);
    float _890 = trunc(_884);
    float _892 = precise::max(_890, 0.0);
    uint _894 = uint(_892);
    int _896 = _755 * int(_856);
    int _898 = _896 + _799;
    bool _900 = !_745;
    int _902 = _900 ? 0 : 1;
    float _904 = float(uint(_898));
    float _906 = floor(_685);
    float _908 = _779 * 2.0;
    bool _910 = !_882;
    int _912 = _910 ? 0 : 1;
    float _914 = as_type<float>(_827) * _904;
    bool _916 = _872 > 0.0;
    float _918 = -_353;
    int _920 = _725 ? as_type<int>(_918) : as_type<int>(_353);
    int _922 = _783 * int(_894);
    int _924 = _922 + _837;
    float _926 = trunc(_914);
    float _928 = precise::max(_926, 0.0);
    uint _930 = uint(_928);
    bool _932 = !_697;
    float _934 = _932 ? _353 : as_type<float>(_920);
    int _936 = abs(_912);
    float _938 = float(uint(_924));
    float _940 = _934 + 0.5;
    bool _942 = !_741;
    int _944 = _942 ? 0 : 1;
    float _946 = floor(_908);
    bool _948 = _872 >= 0.0;
    bool _950 = isnan(_872);
    bool _952 = _948 || _950;
    bool _954 = isnan(0.0);
    bool _956 = _952 || _954;
    float _958 = as_type<float>(_847) * _938;
    bool _960 = _906 > 0.0;
    int _962 = _956 ? 0 : 1;
    bool _964 = _906 >= 0.0;
    bool _966 = isnan(_906);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = trunc(_958);
    float _976 = precise::max(_974, 0.0);
    uint _978 = uint(_976);
    int _980 = ~_962;
    int _982 = _980 + 1;
    int _984 = _982 + 1;
    int _986 = _984;
    int _988 = as_type<int>(_908);
    float _990 = _958;
    if (!_916)
    {
        int _992 = ~_962;
        int _994 = _992 + 1;
        _986 = _994;
    }
    int _996 = _986;
    bool _998 = _779 > 0.5;
    bool _1000 = _801 > 0.5;
    float _1002 = 1.0 / _787;
    int _1004 = int(_856) + int(_930);
    int _1006 = _972 ? 0 : 1;
    bool _1008 = _946 > 0.0;
    bool _1010 = _946 >= 0.0;
    bool _1012 = isnan(_946);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan(0.0);
    bool _1018 = _1014 || _1016;
    int _1020 = int(_894) + int(_978);
    float _1022 = -_353;
    int _1024 = _998 ? as_type<int>(_1022) : as_type<int>(_353);
    float _1026 = -_375;
    int _1028 = _1000 ? as_type<int>(_1026) : as_type<int>(_375);
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1032 = _1030 != 0;
    if (_689)
    {
        _988 = 0;
    }
    int _1034 = _988;
    int _1036 = ~_701;
    int _1038 = _1036 + 1;
    int _1040 = ~_1006;
    int _1042 = _1040 + 1;
    int _1044 = _1042 + 1;
    int _1046 = _1034;
    int _1048 = _1044;
    if (!_689)
    {
        _1046 = 1;
    }
    int _1050 = _1046;
    if (!_960)
    {
        int _1052 = ~_1006;
        int _1054 = _1052 + 1;
        _1048 = _1054;
    }
    int _1056 = _1048;
    if (_689)
    {
        _990 = 1.0;
    }
    float _1058 = _990;
    float _1060 = _1058;
    if (!_689)
    {
        _1060 = 7.345489978790283203125;
    }
    float _1062 = _1060;
    bool _1064 = !_1032;
    float _1066 = _1064 ? _375 : as_type<float>(_1028);
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1070 = _1068 != 0;
    bool _1072 = _1050 != 1;
    bool _1074 = _691 > 0.5;
    int _1076 = _1038 * _1004;
    int _1078 = _1076 + _799;
    bool _1080 = !_1070;
    float _1082 = _1080 ? _353 : as_type<float>(_1024);
    float _1084 = -_375;
    int _1086 = _1074 ? as_type<int>(_1084) : as_type<int>(_375);
    int _1088 = _791 * _1020;
    int _1090 = _1088 + _837;
    int _1092 = _1018 ? 0 : 1;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1096 = _1094 != 0;
    int _1098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1100 = _1098 != 0;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1104 = _1102 != 0;
    int _1106 = ~_1092;
    int _1108 = _1106 + 1;
    int _1110 = _1108 + 1;
    int _1112 = _1110;
    float _1114 = as_type<float>(_1078);
    if (!_1008)
    {
        int _1116 = ~_1092;
        int _1118 = _1116 + 1;
        _1112 = _1118;
    }
    int _1120 = _1112;
    bool _1122 = !_1100;
    int _1124 = _1122 ? 0 : 1;
    bool _1126 = uint(_1078) >= uint(_701);
    bool _1128 = uint(_1090) >= uint(_749);
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1132 = _1130 != 0;
    float _1134 = 0.0;
    if (!_1072)
    {
        _1134 = _801;
    }
    float _1136 = _1134;
    float _1138 = 0.0;
    float _1140 = _1136;
    if (!_1072)
    {
        _1138 = _801;
    }
    float _1142 = _1138;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1144;
    float _1148 = 0.0;
    float _1150 = _1142;
    if (!_1072)
    {
        _1148 = _779;
    }
    float _1152 = _1148;
    float _1154 = _1152;
    if (!_1072)
    {
        _1114 = _779;
    }
    float _1156 = _1114;
    float _1158 = _1156;
    if (_1072)
    {
        _1140 = _131;
    }
    float _1160 = _1140;
    float _1162 = 1.0 / _1146;
    if (_1072)
    {
        _1150 = _131;
    }
    float _1164 = _1150;
    if (_1072)
    {
        _1154 = _801;
    }
    float _1166 = _1154;
    float _1168 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1072)
    {
        _1158 = _801;
    }
    float _1170 = _1158;
    bool _1172 = !_1126;
    int _1174 = _1172 ? 0 : (-1);
    bool _1176 = !_1128;
    int _1178 = _1176 ? 0 : (-1);
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1182 = _1180 != 0;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1186 = _1184 != 0;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1190 = _1188 != 0;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1194 = _1192 != 0;
    float _1196 = fma(_629, _179, _675);
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1202 = in.m_57.w;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1206 = _663 + _1204;
    float _1208 = _1196 + _719;
    float _1210 = 1.0 / _1200;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1214 = _1206 * _1162;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1218 = _663 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1220;
    float _1224 = fma(_862, -2.0, _1212);
    float _1226 = _1218 * _1002;
    float _1228 = _1208 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1230 = !_1104;
    int _1232 = _1230 ? 0 : 1;
    float _1234 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1236 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1238 = isnan(_663);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    bool _1248 = !_1096;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = _723 * _1210;
    float _1254 = _131 + _801;
    float _1256 = float(_996);
    float _1258 = _693 + _1202;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1262 = _1260 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1264 = _1254 + (-1.0);
    float _1266 = fma(_1222, _1214, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1268 = _1258 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1270 = fma(_1262, _1252, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1272 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1274 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1276 = -_1246;
    float _1278 = _1276 + 1.0;
    bool _1280 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1282 = isnan(_663);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1288 = _1284 || _1286;
    float _1290 = float(_1288);
    bool _1292 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1294 = isnan(_663);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1304;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1312 = _1290 * _1278;
    bool _1314 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1316 = isnan(0.0);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1322 = _1318 || _1320;
    float _1324 = fma(_1306, _1214, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1326 = _1062 * _131;
    float _1328 = -_1290;
    float _1330 = _1328 + 1.0;
    float _1332 = -_1302;
    float _1334 = _1332 + 1.0;
    float _1336 = fma(_1310, _1252, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1338 = _1302 * _1330;
    float _1340 = floor(_886);
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1342;
    float _1346 = _819 * _1334;
    float _1348 = -_819;
    float _1350 = _1348 + 1.0;
    int _1352 = ~_1004;
    int _1354 = _1352 + _1174;
    int _1356 = _1354 + 1;
    float _1358 = fma(_1344, _1226, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1360 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[80].x, _823);
    float _1362 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1224);
    float _1364 = _1266 * _1346;
    float _1366 = floor(_1326);
    float _1368 = float(_109);
    float _1370 = _1324 * _1346;
    float _1372 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1364);
    float _1374 = fma(_833, _1226, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1376 = _1066 + (-0.5);
    int _1378 = ~_1020;
    int _1380 = _1378 + _1178;
    int _1382 = _1380 + 1;
    float _1384 = -_1340;
    float _1386 = _886 + _1384;
    float _1388 = 1.0 / _1368;
    float _1390 = _1268 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1392 = -_1376;
    float _1394 = -_1362;
    float _1396 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1394);
    float _1398 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1370);
    float _1400 = _1268 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1402 = float(_701);
    float _1404 = fma(_1270, _1338, _1372);
    float _1406 = fma(_1336, _1338, _1398);
    float _1408 = -_1366;
    float _1410 = _1326 + _1408;
    float _1412 = _1268 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1414 = fma(_1228, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1390);
    float _1416 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1418 = log2(_1416);
    float _1420 = fma(_1228, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1412);
    float _1422 = fma(_1228, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1400);
    float _1424 = _1388 * _145;
    float _1426 = float(_837);
    float _1428 = fma(_1374, _1312, _1406);
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1432 = _1402 * _1424;
    bool _1434 = _1426 >= _829;
    bool _1436 = isnan(_1426);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan(_829);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = _1386 * _829;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1450 = _829 * _1424;
    float _1452 = _807 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    int _1454 = abs(_1124);
    float _1456 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1448);
    int _1458 = abs(_1232);
    float _1460 = fma(_1452, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1420);
    int _1462 = abs(_1250);
    float _1464 = fma(_1452, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1422);
    float _1466 = fma(_1452, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1414);
    float _1468 = _1418 * _145;
    float _1470 = float(_1056);
    float _1472 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1474 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1478 = float(_1458);
    float _1480 = fma(_1358, _1312, _1404);
    float _1482 = float(_1462);
    float _1484 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1430);
    float _1486 = float(_1120);
    float _1488 = fma(_1474, -2.0, _1476);
    float _1490 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1492 = _1478 * _1256;
    float _1494 = _1482 * _1486;
    float _1496 = _1464 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1498 = _1466 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1500 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1502 = float(_799);
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1510 = _1410 * _1402;
    bool _1512 = _1502 >= _1402;
    bool _1514 = isnan(_1502);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan(_1402);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = exp2(_1468);
    float _1526 = _1460 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1528 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1504);
    float _1530 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1506);
    float _1532 = -_1508;
    float _1534 = fma(_1168, 2.0, _1532);
    float _1536 = _1498 * _1472;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1540 = 1.0 + _1538;
    float _1542 = in.m_66.x;
    float _1544 = in.m_66.y;
    float _1546 = _1526 * _1490;
    float _1548 = _1496 * _1500;
    bool _1550 = !_1132;
    float _1552 = _1550 ? _375 : as_type<float>(_1086);
    float _1554 = 1.0 / _1540;
    float _1556 = in.m_68.x;
    float _1558 = in.m_68.y;
    float _1560 = in.m_68.z;
    float _1562 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1480);
    float _1564 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1428);
    float _1566 = -_145;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1534);
    float _1570 = -_1524;
    float _1572 = _1570 + 1.0;
    float _1574 = _1082 + 0.5;
    float _1576 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1488);
    float _1578 = float(_1454);
    float _1580 = _1552 + (-0.5);
    float _1582 = _1322 ? _1572 : 0.0;
    float _1584 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1568);
    bool _1586 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1588 = isnan(1.0);
    bool _1590 = _1586 || _1588;
    bool _1592 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1594 = _1590 || _1592;
    float _1596 = trunc(_1510);
    int _1598 = int(_1596);
    float _1600 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1528);
    float _1602 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1530);
    float _1604 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1484);
    float _1606 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1456);
    float _1608 = _1578 * _1470;
    float _1610 = _1492 * (-2.0);
    float _1612 = _1562 * _1542;
    float _1614 = trunc(_1522);
    int _1616 = int(_1614);
    int _1618 = abs(_902);
    float _1620 = _131 + (-0.5);
    int _1622 = _749 * _1382;
    int _1624 = _1622 + _837;
    if (_1594)
    {
        float _1626 = _1582 * _1554;
        _149 = _1626;
    }
    float _1628 = _149;
    float _1630 = -_1580;
    float _1632 = -_1576;
    float _1634 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1632);
    float _1636 = _1494 * (-2.0);
    float _1638 = _1608 * (-2.0);
    float _1640 = trunc(_1444);
    int _1642 = int(_1640);
    int _1644 = _1598 * _1618;
    int _1646 = _1644 + _799;
    float _1648 = fma(_1636, _1556, _1556);
    float _1650 = fma(_1272, _1636, _1272);
    float _1652 = fma(_1638, _1558, _1558);
    float _1654 = fma(_1274, _1610, _1274);
    float _1656 = _779 + (-0.5);
    int _1658 = _701 * _1356;
    int _1660 = _1658 + _799;
    float _1662 = trunc(_1446);
    int _1664 = int(_1662);
    float _1666 = float(uint(_1646));
    float _1668 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1648);
    bool _1670 = !_1186;
    int _1672 = _1670 ? 0 : 1;
    float _1674 = _801 + (-0.5);
    bool _1676 = _701 == 0;
    float _1678 = fma(_1234, _1638, _1234);
    bool _1680 = _749 == 0;
    float _1682 = trunc(_1432);
    int _1684 = int(_1682);
    int _1686 = abs(_944);
    float _1688 = as_type<float>(_827) * _1666;
    int _1690 = ~_1616;
    int _1692 = _1690 + 1;
    int _1694 = _1692 + 1;
    float _1696 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1652);
    bool _1698 = !_1676;
    int _1700 = _1698 ? _1660 : (-1);
    float _1702 = fma(_1610, _1560, _1560);
    int _1704 = ~_1642;
    int _1706 = _1704 + 1;
    int _1708 = _1706 + 1;
    int _1710 = _1664 * _1686;
    int _1712 = _1710 + _837;
    bool _1714 = !_1680;
    int _1716 = _1714 ? _1624 : (-1);
    int _1718 = _1700 * _1694;
    int _1720 = _701 + (-1);
    float _1722 = trunc(_1450);
    int _1724 = int(_1722);
    int _1726 = _749 + (-1);
    int _1728 = _1716 * _1708;
    int _1730 = abs(_1672);
    int _1732 = _1616 * _1720;
    int _1734 = _1732 + _1718;
    float _1736 = fma(_1678, _1628, _1696);
    bool _1738 = !_1190;
    int _1740 = _1738 ? 0 : 1;
    int _1742 = _1642 * _1726;
    int _1744 = _1742 + _1728;
    float _1746 = fma(_1650, _1628, _1668);
    int _1748 = _1734 * _868;
    bool _1750 = !_1182;
    int _1752 = _1750 ? 0 : 1;
    float _1754 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1702);
    int _1756 = abs(_1740);
    int _1758 = _1684 * _888;
    int _1760 = _1758 + _1748;
    int _1762 = abs(_1752);
    int _1764 = _1744 * _1730;
    int _1766 = abs(_735);
    float _1768 = _1746 * 0.15915493667125701904296875;
    float _1770 = fma(_1654, _1628, _1754);
    bool _1772 = !_1194;
    int _1774 = _1772 ? 0 : 1;
    int _1776 = _1646 * _1766;
    int _1778 = _1776 + _1760;
    int _1780 = _1724 * _1762;
    int _1782 = _1780 + _1764;
    float _1784 = _1768 * 6.283185482025146484375;
    float _1786 = sin(_1784);
    int _1788 = abs(_1774);
    int _1790 = _1598 * _936;
    int _1792 = _1790 + _1778;
    float _1794 = float(uint(_1712));
    int _1796 = _1712 * _1756;
    int _1798 = _1796 + _1782;
    float _1800 = -_1602;
    float _1802 = _1800 + 1.0;
    float _1804 = fma(_1546, 0.5, 0.5);
    float _1806 = float(uint(_1792));
    float _1808 = _1768 * 6.283185482025146484375;
    float _1810 = cos(_1808);
    float _1812 = as_type<float>(_847) * _1794;
    float _1814 = fma(_1548, 0.5, 0.5);
    float _1816 = _1736 * 0.15915493667125701904296875;
    float _1818 = as_type<float>(_827) * _1806;
    float _1820 = -_1604;
    float _1822 = _1820 + 1.0;
    float _1824 = -_1606;
    float _1826 = _1824 + 1.0;
    int _1828 = ~_701;
    int _1830 = _1828 + 1;
    float _1832 = trunc(_1688);
    float _1834 = precise::max(_1832, 0.0);
    uint _1836 = uint(_1834);
    float _1838 = _1770 * 0.15915493667125701904296875;
    float _1840 = -_1600;
    float _1842 = _1840 + 1.0;
    float _1844 = -_1822;
    float _1846 = fma(_1082, _1844, _1584);
    float _1848 = fma(_1552, _1826, _1634);
    float _1850 = fma(_1536, 0.5, 0.5);
    int _1852 = _1664 * _1788;
    int _1854 = _1852 + _1798;
    float _1856 = -_1842;
    float _1858 = fma(_934, _1856, _1360);
    float _1860 = fma(_1066, _1802, _1396);
    int _1862 = ~_701;
    int _1864 = _1862 + 1;
    float _1866 = trunc(_1812);
    float _1868 = precise::max(_1866, 0.0);
    uint _1870 = uint(_1868);
    float _1872 = float(uint(_1854));
    float _1874 = _1612 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1876 = ~_749;
    int _1878 = _1876 + 1;
    out.m_70.x = _1858;
    out.m_70.y = _1860;
    out.m_70.z = _1846;
    out.m_70.w = _1848;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1882 = _1880 != 0;
    float _1884 = as_type<float>(_847) * _1872;
    float _1886 = trunc(_1818);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    float _1892 = _1564 * _1544;
    float _1894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _375);
    int _1896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1898 = _1896 != 0;
    int _1900 = _1864 * int(_1836);
    int _1902 = _1900 + _1646;
    float _1904 = _1892 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1906 = !_1882;
    int _1908 = _1906 ? 0 : 1;
    float _1910 = trunc(_1884);
    float _1912 = precise::max(_1910, 0.0);
    uint _1914 = uint(_1912);
    float _1916 = float(uint(_1902));
    int _1918 = _1878 * int(_1870);
    int _1920 = _1918 + _1712;
    float _1922 = _1904 * _1894;
    float _1924 = as_type<float>(_827) * _1916;
    float _1926 = float(uint(_1920));
    float _1928 = floor(_1804);
    int _1930 = _1830 * int(_1890);
    int _1932 = _1930 + _1792;
    float _1934 = float(uint(_1932));
    float _1936 = floor(_1814);
    float _1938 = as_type<float>(_827) * _1934;
    float _1940 = _1816 * 6.283185482025146484375;
    float _1942 = sin(_1940);
    float _1944 = -_1928;
    float _1946 = _1804 + _1944;
    float _1948 = as_type<float>(_847) * _1926;
    float _1950 = _1816 * 6.283185482025146484375;
    float _1952 = cos(_1950);
    float _1954 = -_1936;
    float _1956 = _1814 + _1954;
    float _1958 = fma(_1956, 2.0, -1.0);
    float _1960 = _1838 * 6.283185482025146484375;
    float _1962 = sin(_1960);
    int _1964 = ~_749;
    int _1966 = _1964 + 1;
    float _1968 = _1810 * _1942;
    float _1970 = _1786 * _1942;
    int _1972 = _1966 * int(_1914);
    int _1974 = _1972 + _1854;
    float _1976 = _1838 * 6.283185482025146484375;
    float _1978 = cos(_1976);
    float _1980 = _1810 * _1952;
    float _1982 = float(uint(_1974));
    float _1984 = floor(_1850);
    float _1986 = as_type<float>(_847) * _1982;
    float _1988 = _1958 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1990 = _1786 * _1952;
    float _1992 = _1988 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1994 = _1988 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1996 = trunc(_1948);
    float _1998 = precise::max(_1996, 0.0);
    uint _2000 = uint(_1998);
    float _2002 = _1810 * _1978;
    float _2004 = fma(_1946, 2.0, -1.0);
    float _2006 = _1786 * _1978;
    float _2008 = _1952 * _1978;
    float _2010 = _1942 * _1978;
    float _2012 = trunc(_1924);
    float _2014 = precise::max(_2012, 0.0);
    uint _2016 = uint(_2014);
    float _2018 = -_1984;
    float _2020 = _1850 + _2018;
    float _2022 = _1988 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2024 = -_1968;
    float _2026 = fma(_1962, _1990, _2024);
    float _2028 = -_1990;
    float _2030 = fma(_1962, _1968, _2028);
    float _2032 = fma(_1962, _1980, _1970);
    float _2034 = fma(_1962, _1970, _1980);
    float _2036 = _2006 * _1922;
    float _2038 = trunc(_1938);
    float _2040 = precise::max(_2038, 0.0);
    uint _2042 = uint(_2040);
    float _2044 = trunc(_1986);
    float _2046 = precise::max(_2044, 0.0);
    uint _2048 = uint(_2046);
    float _2050 = _2004 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _2052 = int(_1836) + int(_2016);
    float _2054 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2056 = ~_701;
    int _2058 = _2056 + 1;
    float _2060 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2022);
    int _2062 = int(_1870) + int(_2000);
    float _2064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _353);
    float _2066 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1992);
    int _2068 = int(_1890) + int(_2042);
    float _2070 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1994);
    float _2072 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2074 = ~_749;
    int _2076 = _2074 + 1;
    float _2078 = _1874 * _2064;
    float _2080 = -_1922;
    float _2082 = _1962 * _2080;
    float _2084 = -_1962;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2054);
    int _2088 = int(_1914) + int(_2048);
    float _2090 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2092 = _2002 * _1922;
    int _2094 = _2058 * _2068;
    int _2096 = _2094 + _1792;
    float _2098 = -_1962;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2072);
    float _2102 = -_1962;
    float _2104 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2090);
    float _2106 = fma(_2026, _2078, _2036);
    bool _2108 = uint(_2096) >= uint(_701);
    float _2110 = fma(_2008, _2078, _2082);
    float _2112 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2114 = _2076 * _2088;
    int _2116 = _2114 + _1854;
    bool _2118 = !_2108;
    int _2120 = _2118 ? 0 : (-1);
    float _2122 = fma(_2032, _2078, _2092);
    float _2124 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2104);
    float _2126 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2086);
    bool _2128 = uint(_2116) >= uint(_749);
    float _2130 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2100);
    int _2132 = ~_2068;
    int _2134 = _2132 + _2120;
    int _2136 = _2134 + 1;
    float _2138 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2140 = !_2128;
    int _2142 = _2140 ? 0 : (-1);
    float _2144 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2146 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2112);
    int _2148 = _701 * _2136;
    int _2150 = _2148 + _1792;
    float _2152 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2138);
    int _2154 = ~_2088;
    int _2156 = _2154 + _2142;
    int _2158 = _2156 + 1;
    float _2160 = fma(_2010, _2144, _2110);
    float _2162 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2164 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2166 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2168 = !_1676;
    int _2170 = _2168 ? _2150 : (-1);
    float _2172 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2162);
    float _2174 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2164);
    float _2176 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2166);
    float _2178 = fma(_2030, _2144, _2122);
    float _2180 = fma(_2034, _2144, _2106);
    int _2182 = _2170 & 3;
    bool _2184 = _2182 != 0;
    int _2186 = _749 * _2158;
    int _2188 = _2186 + _1854;
    int _2190 = _2170 >> 31;
    float _2192 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2194 = uint(_2182) > 1u;
    float _2196 = _353 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2198 = _2190 & 3;
    float _2200 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2192);
    bool _2202 = !_1680;
    int _2204 = _2202 ? _2188 : (-1);
    float _2206 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2174);
    int _2208 = ~_701;
    int _2210 = _2208 + 1;
    float _2212 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2176);
    int _2214 = _2170 & 3;
    bool _2216 = _2214 != 0;
    int _2218 = _2170 + _2198;
    int _2220 = _2210 * _2052;
    int _2222 = _2220 + _1646;
    int _2224 = _2204 >> 31;
    int _2226 = _2216 ? 0 : 1;
    int _2228 = ~_749;
    int _2230 = _2228 + 1;
    int _2232 = _2224 & 3;
    int _2234 = ~_2226;
    int _2236 = _2234 + 1;
    int _2238 = _2236 + 1;
    int _2240 = _2230 * _2062;
    int _2242 = _2240 + _1712;
    bool _2244 = uint(_2222) >= uint(_701);
    float _2246 = _375 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2248 = _2238;
    float _2250 = _2004;
    float _2252 = _1958;
    float _2254 = _2180;
    if (!_2194)
    {
        int _2256 = ~_2226;
        int _2258 = _2256 + 1;
        _2248 = _2258;
    }
    int _2260 = _2248;
    int _2262 = _2204 + _2232;
    float _2264 = _2246 * _2124;
    bool _2266 = uint(_2182) >= 2u;
    int _2268 = _2218 >> 2;
    int _2270 = _2262 >> 2;
    int _2272 = _2266 ? 0 : 1;
    int _2274 = _2268 << 4;
    int _2276 = _2274 + 368;
    float _2278 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2146);
    bool _2280 = uint(_2242) >= uint(_749);
    float _2282 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2152);
    int _2284 = _2270 << 4;
    int _2286 = _2284 + 512;
    uint _2288 = uint(int(uint(_2276) >> uint(2)));
    uint _2290 = uint(int(uint(int(_2288)) >> uint(2)));
    int _2292 = int(_2288) & 3;
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[int(_2290)][_2292];
    int _2296 = int(_2288) + 1;
    uint _2298 = uint(int(uint(_2296) >> uint(2)));
    int _2300 = _2296 & 3;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[int(_2298)][_2300];
    bool _2304 = !_2244;
    int _2306 = _2304 ? 0 : (-1);
    float _2308 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2200);
    bool _2310 = _2182 != 3;
    float _2312 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2172);
    int _2314 = ~_2052;
    int _2316 = _2314 + _2306;
    int _2318 = _2316 + 1;
    float _2320 = _2246 * _2126;
    bool _2322 = !_2280;
    int _2324 = _2322 ? 0 : (-1);
    uint _2326 = uint(int(uint(_2286) >> uint(2)));
    uint _2328 = uint(int(uint(int(_2326)) >> uint(2)));
    int _2330 = int(_2326) & 3;
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[int(_2328)][_2330];
    int _2334 = int(_2326) + 1;
    uint _2336 = uint(int(uint(_2334) >> uint(2)));
    int _2338 = _2334 & 3;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[int(_2336)][_2338];
    int _2342 = ~_2272;
    int _2344 = _2342 + 1;
    int _2346 = _2344 + 1;
    float _2348 = fma(_2196, _2278, _2264);
    int _2350 = ~_2062;
    int _2352 = _2350 + _2324;
    int _2354 = _2352 + 1;
    out.m_72.x = _2278;
    out.m_72.y = _2282;
    out.m_72.z = _2308;
    float _2356 = fma(_2196, _2282, _2320);
    bool _2358 = !_2184;
    int _2360 = _2358 ? 0 : 1;
    int _2362 = _701 * _2318;
    int _2364 = _2362 + _1646;
    int _2366 = _2276 + 8;
    uint _2368 = uint(int(uint(_2366) >> uint(2)));
    uint _2370 = uint(int(uint(int(_2368)) >> uint(2)));
    int _2372 = int(_2368) & 3;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[int(_2370)][_2372];
    int _2376 = int(_2368) + 1;
    uint _2378 = uint(int(uint(_2376) >> uint(2)));
    int _2380 = _2376 & 3;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[int(_2378)][_2380];
    int _2384 = _2346;
    if (_2310)
    {
        int _2386 = ~_2272;
        int _2388 = _2386 + 1;
        _2384 = _2388;
    }
    int _2390 = _2384;
    int _2392 = _749 * _2354;
    int _2394 = _2392 + _1712;
    int _2396 = _2204 & 3;
    bool _2398 = _2396 != 0;
    float _2400 = _2246 * _2130;
    int _2402 = _2204 & 3;
    bool _2404 = _2402 != 0;
    bool _2406 = uint(_2396) > 1u;
    int _2408 = _2286 + 8;
    uint _2410 = uint(int(uint(_2408) >> uint(2)));
    uint _2412 = uint(int(uint(int(_2410)) >> uint(2)));
    int _2414 = int(_2410) & 3;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[int(_2412)][_2414];
    int _2418 = int(_2410) + 1;
    uint _2420 = uint(int(uint(_2418) >> uint(2)));
    int _2422 = _2418 & 3;
    float _2424 = (*spvDescriptorSet0.vp_c9)._m0[int(_2420)][_2422];
    int _2426 = _2404 ? 0 : 1;
    float _2428 = fma(_2196, _2308, _2400);
    bool _2430 = !_2398;
    int _2432 = _2430 ? 0 : 1;
    int _2434 = ~_2426;
    int _2436 = _2434 + 1;
    int _2438 = _2436 + 1;
    float _2440 = _2212 + _2428;
    bool _2442 = uint(_2396) >= 2u;
    int _2444 = abs(_2260);
    int _2446 = abs(_2360);
    int _2448 = _2438;
    if (!_2406)
    {
        int _2450 = ~_2426;
        int _2452 = _2450 + 1;
        _2448 = _2452;
    }
    int _2454 = _2448;
    bool _2456 = _2396 != 3;
    int _2458 = _2442 ? 0 : 1;
    int _2460 = abs(_2454);
    bool _2462 = _2396 != 3;
    int _2464 = abs(_2432);
    int _2466 = ~_2444;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    int _2472 = abs(_2390);
    int _2474 = _2470 * as_type<int>(_2302);
    int _2476 = ~_2460;
    int _2478 = _2476 + 1;
    int _2480 = _2478 + 1;
    int _2482 = ~_2446;
    int _2484 = _2482 + 1;
    int _2486 = _2484 + 1;
    int _2488 = _2480 * as_type<int>(_2340);
    int _2490 = ~_2464;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    int _2496 = _2486 * as_type<int>(_2294);
    int _2498 = _2496 + _2474;
    bool _2500 = _2182 != 3;
    float _2502 = fma(_2246, _2246, 1.0);
    int _2504 = ~_2458;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    int _2510 = _2494 * as_type<int>(_2332);
    int _2512 = _2510 + _2488;
    int _2514 = ~_2472;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    int _2520 = _2508;
    if (_2456)
    {
        int _2522 = ~_2458;
        int _2524 = _2522 + 1;
        _2520 = _2524;
    }
    int _2526 = _2520;
    float _2528 = rsqrt(_2502);
    bool _2530 = !_2500;
    int _2532 = _2530 ? 0 : (-1);
    int _2534 = _2518 * as_type<int>(_2374);
    int _2536 = _2534 + _2498;
    int _2538 = abs(_2526);
    int _2540 = abs(_1908);
    bool _2542 = !_1898;
    int _2544 = _2542 ? 0 : 1;
    int _2546 = abs(_2532);
    bool _2548 = !_2462;
    int _2550 = _2548 ? 0 : (-1);
    int _2552 = abs(_2544);
    float _2554 = _2246 * _2528;
    int _2556 = abs(_2550);
    int _2558 = ~_2538;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    int _2564 = ~_2546;
    int _2566 = _2564 + 1;
    int _2568 = _2566 + 1;
    int _2570 = _2562 * as_type<int>(_2416);
    int _2572 = _2570 + _2512;
    int _2574 = _2568 * as_type<int>(_2382);
    int _2576 = _2574 + _2536;
    int _2578 = ~_2556;
    int _2580 = _2578 + 1;
    int _2582 = _2580 + 1;
    float _2584 = fma(_2020, 2.0, -1.0);
    int _2586 = ~_2552;
    int _2588 = _2586 + 1;
    int _2590 = _2588 + 1;
    int _2592 = ~_2540;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    int _2598 = _2582 * as_type<int>(_2424);
    int _2600 = _2598 + _2572;
    float _2602 = -_2312;
    float _2604 = _2554 * _2602;
    float _2606 = -_2212;
    float _2608 = _2554 * _2606;
    bool _2610 = !_1676;
    int _2612 = _2610 ? _2364 : (-1);
    int _2614 = _2600 * _2590;
    float _2616 = -_2206;
    float _2618 = _2554 * _2616;
    int _2620 = _2576 * _2596;
    float _2622 = fma(_2528, _2124, _2604);
    float _2624 = fma(_2528, _2130, _2608);
    float _2626 = fma(_2528, _2126, _2618);
    float _2628 = _2312 + _2348;
    float _2630 = _2206 + _2356;
    bool _2632 = !_1680;
    int _2634 = _2632 ? _2394 : (-1);
    int _2636 = _2612 * _2540;
    int _2638 = _2636 + _2620;
    out.m_74.x = _2622;
    out.m_74.y = _2626;
    out.m_74.z = _2624;
    float _2640 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2642 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2644 = _2634 * _2552;
    int _2646 = _2644 + _2614;
    out.m_76.x = _2628;
    out.m_76.y = _2630;
    out.m_76.z = _2440;
    float _2648 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2650 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _2652 = isnan(1.0);
    bool _2654 = _2650 || _2652;
    bool _2656 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2658 = _2654 || _2656;
    float _2660 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2640);
    float _2662 = _2584 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2664 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2648);
    float _2666 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2642);
    float _2668 = float(_2638);
    float _2670 = fma(_2662, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2066);
    float _2672 = float(_2646);
    float _2674 = fma(_2662, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2060);
    float _2676 = fma(_2662, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2070);
    float _2678 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2664);
    float _2680 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2660);
    float _2682 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2666);
    out.m_78.x = _2668;
    out.m_78.y = _2672;
    float _2684 = _2670 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2686 = _2674 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2688 = _2676 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2690 = _2680 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2692 = _2682 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2694 = _2690 + _2686;
    float _2696 = _2692 + _2688;
    float _2698 = _2678 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2700 = _2698 + _2684;
    float _2702 = _2624;
    float _2704 = _2626;
    float _2706 = _2622;
    float _2708 = _2678;
    float _2710 = _2626;
    float _2712 = _2624;
    float _2714 = _2698;
    float _2716 = _2622;
    float _2718 = _2678;
    float _2720 = _2672;
    float _2722 = _2670;
    float _2732;
    float _2734;
    float _2736;
    float _2738;
    if (!_2658)
    {
        bool _2724 = _2686 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2726 = !_2724;
        _2728 = _2726;
        if (!_2728)
        {
            float _2730 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _2732 = _2730;
            _2734 = 0.0;
            _2736 = 0.0;
            _2738 = 0.0;
            _2740 = true;
        }
    }
    if ((!_2740) || _2728)
    {
        bool _2776;
        if (!_2728)
        {
            bool _2742 = _2686 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2744 = isnan(_2686);
            bool _2746 = _2742 || _2744;
            bool _2748 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2750 = _2746 || _2748;
            bool _2752 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2754 = !_2750;
            bool _2756 = _2752 && _2754;
            bool _2758 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _2714 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2756)
            {
                _2702 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2760 = _2702;
            float _2762 = _2760;
            if (_2756)
            {
                _2704 = 0.0;
                _2706 = 0.0;
            }
            float _2764 = _2704;
            float _2766 = _2706;
            _2710 = _2764;
            _2716 = _2766;
            _2734 = _2766;
            _2736 = _2764;
            if (_2756)
            {
                _2708 = 0.0;
            }
            float _2768 = _2708;
            _2718 = _2768;
            _2738 = _2768;
            if (_2756)
            {
                float _2770 = _2760 * 5.0;
                _2762 = _2770;
            }
            float _2772 = _2762;
            bool _2774 = !_2750;
            _2776 = _2774 && _2758;
            _2712 = _2772;
            _2732 = _2772;
        }
        if ((!_2776) || _2728)
        {
            _2728 = false;
            float _2778 = _2710;
            float _2780 = _2712;
            float _2782 = _2714;
            float _2784 = _2716;
            float _2786 = _2718;
            bool _2788 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2790 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2792 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2794 = _2778;
            float _2796 = _2784;
            float _2798 = _2782;
            float _2800 = _2786;
            if (_2788)
            {
                float _2802 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2794 = _2802;
            }
            float _2804 = _2794;
            if (_2788)
            {
                float _2806 = abs(_2004);
                float _2808 = -_2806;
                float _2810 = _2808 + 1.0;
                _2250 = _2810;
            }
            float _2812 = _2250;
            if (_2790)
            {
                float _2814 = abs(_1958);
                float _2816 = -_2814;
                float _2818 = _2816 + 1.0;
                _2252 = _2818;
            }
            float _2820 = _2252;
            if (!_2788)
            {
                _2720 = 1.0;
            }
            float _2822 = _2720;
            float _2824 = _2822;
            if (_2792)
            {
                float _2826 = abs(_2584);
                float _2828 = -_2826;
                float _2830 = _2828 + 1.0;
                _2796 = _2830;
            }
            float _2832 = _2796;
            if (!_2790)
            {
                _2798 = 1.0;
            }
            float _2834 = _2798;
            float _2836 = _2834;
            if (!_2792)
            {
                _2800 = 1.0;
            }
            float _2838 = _2800;
            float _2840 = _2780;
            float _2842 = _2838;
            if (_2790)
            {
                float _2844 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2840 = _2844;
            }
            float _2846 = _2840;
            float _2848 = _2692;
            if (_2792)
            {
                float _2850 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2848 = _2850;
            }
            float _2852 = _2848;
            if (_2788)
            {
                float _2854 = _2812 * _2804;
                float _2856 = precise::clamp(_2854, 0.0, 1.0);
                _2824 = _2856;
            }
            float _2858 = _2824;
            _2736 = _2694;
            if (_2790)
            {
                float _2860 = _2820 * _2846;
                float _2862 = precise::clamp(_2860, 0.0, 1.0);
                _2836 = _2862;
            }
            float _2864 = _2836;
            float _2866 = _2858 * _2864;
            _2732 = _2696;
            if (_2792)
            {
                float _2868 = _2832 * _2852;
                float _2870 = precise::clamp(_2868, 0.0, 1.0);
                _2842 = _2870;
            }
            float _2872 = _2842;
            float _2874 = _2866 * _2872;
            _2734 = _2700;
            _2738 = _2874;
        }
    }
    _2740 = false;
    float _2876 = _2732;
    float _2878 = _2734;
    float _2880 = _2736;
    float _2882 = _2738;
    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2886 = _2876 + _2884;
    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2890 = _2878 + _2888;
    float _2892 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2894 = _2886 * _2886;
    bool _2896 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2898 = isnan(0.5);
    bool _2900 = _2896 || _2898;
    bool _2902 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2904 = _2900 || _2902;
    float _2906 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2892);
    float _2908 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2910 = fma(_2890, _2890, _2894);
    bool _2912 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2914 = isnan(0.5);
    bool _2916 = _2912 || _2914;
    bool _2918 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2920 = _2916 || _2918;
    float _2922 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2906);
    float _2924 = sqrt(_2910);
    float _2926 = _2922 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2928 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2908);
    float _2930 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2928);
    float _2932 = 1.0 / _2926;
    float _2934 = _2930 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2936 = _2934 + _2926;
    bool _2938 = _2924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2940 = _2936 * _2932;
    float _2942 = _2940 * 0.5;
    bool _2944 = !_2938;
    float _2946 = _2878;
    float _2948 = _2880;
    float _2950 = _2876;
    float _2952 = _2890;
    float _2954 = _2910;
    if (!_2944)
    {
        float _2956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2958 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2960 = _2924 + _2958;
        float _2962 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2964 = rsqrt(_2910);
        float _2966 = _2960 * _2956;
        float _2968 = _2966 * 0.15915493667125701904296875;
        float _2970 = _2968 * 6.283185482025146484375;
        float _2972 = cos(_2970);
        float _2974 = _2968 * 6.283185482025146484375;
        float _2976 = sin(_2974);
        float _2978 = _2972 + (-1.0);
        float _2980 = fma(_2976, _2962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2982 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2984 = _2964 * _2980;
        float _2986 = fma(_2972, _2880, _2982);
        float _2988 = fma(_2890, _2984, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2990 = fma(_2886, _2984, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2946 = _2988;
        _2948 = _2986;
        _2950 = _2990;
    }
    float _2992 = _2946;
    float _2994 = _2948;
    float _2996 = _2950;
    float _2998 = _2994;
    float _3000 = _2992;
    float _3002 = _2996;
    if (_2920)
    {
        _2722 = 1.0;
    }
    float _3004 = _2722;
    float _3006 = _3004;
    if (!_2904)
    {
        float _3008 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3010 = _2686 + _3008;
        float _3012 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3014 = _2684 + _3012;
        float _3016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3018 = -_2684;
        float _3020 = _3018 + _2992;
        float _3022 = _3010 * _3010;
        float _3024 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3026 = _2688 + _3024;
        float _3028 = fma(_3014, _3014, _3022);
        float _3030 = fma(_3026, _3026, _3028);
        float _3032 = sqrt(_3030);
        float _3034 = precise::min(_3032, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3036 = _3034 * _3016;
        float _3038 = -_2686;
        float _3040 = _3038 + _2994;
        float _3042 = -_2688;
        float _3044 = _3042 + _2996;
        float _3046 = fma(_3020, _3036, _2684);
        float _3048 = fma(_3040, _3036, _2686);
        float _3050 = fma(_3044, _3036, _2688);
        _2998 = _3048;
        _3000 = _3046;
        _3002 = _3050;
    }
    float _3052 = _2998;
    float _3054 = _3000;
    float _3056 = _3002;
    if (!_2920)
    {
        float _3058 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3060 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3058);
        float _3062 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3064 = _3062 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _3066 = 1.0 / _3060;
        float _3068 = 1.0 / _3064;
        float _3070 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3072 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3074 = fma(_3066, _3070, _3072);
        float _3076 = _3074 * _3068;
        float _3078 = precise::clamp(_3076, 0.0, 1.0);
        _3006 = _3078;
    }
    float _3080 = _3006;
    float _3082 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3084 = _3052 + _3082;
    float _3086 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3088 = _3054 + _3086;
    float _3090 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3092 = _3056 + _3090;
    float _3094 = _3084 * _3084;
    float _3096 = fma(_3088, _3088, _3094);
    float _3098 = fma(_3092, _3092, _3096);
    float _3100 = rsqrt(_3098);
    float _3102 = sqrt(_3098);
    float _3104 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3106 = _3088 * _3104;
    float _3108 = _3092 * _3104;
    float _3110 = _3106 * _3106;
    float _3112 = _3108 * _3108;
    float _3114 = _3110 + _3112;
    float _3116 = sqrt(_3114);
    bool _3118 = _3116 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3120 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3122 = _3116 + _3120;
    float _3124 = _3100;
    float _3126 = _3114;
    float _3128 = _3122;
    float _3130 = _3084;
    if (_3118)
    {
        float _3132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3124 = _3132;
    }
    float _3134 = _3124;
    if (_3118)
    {
        float _3136 = rsqrt(_3114);
        _3126 = _3136;
    }
    float _3138 = _3126;
    float _3140 = _3138;
    if (_3118)
    {
        float _3142 = _3122 * _3134;
        _3128 = _3142;
    }
    float _3144 = _3128;
    if (_3118)
    {
        float _3146 = _3144 * 0.15915493667125701904296875;
        _2952 = _3146;
    }
    float _3148 = _2952;
    float _3150 = _3092;
    if (_3118)
    {
        float _3152 = _3148 * 6.283185482025146484375;
        float _3154 = sin(_3152);
        _3150 = _3154;
    }
    float _3156 = _3150;
    float _3158 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3160 = precise::max(0.0, _3158);
    float _3162 = _3134;
    float _3164 = _3160;
    if (_3118)
    {
        float _3166 = _3148 * 6.283185482025146484375;
        float _3168 = cos(_3166);
        _3162 = _3168;
    }
    float _3170 = _3162;
    float _3172 = -_3104;
    float _3174 = -_3160;
    float _3176 = fma(_3084, _3172, _3174);
    if (_3118)
    {
        float _3178 = _3176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3130 = _3178;
    }
    float _3180 = _3130;
    float _3182 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3184 = _3180;
    float _3186 = _3156;
    if (_3118)
    {
        float _3188 = fma(_3156, _3180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3184 = _3188;
    }
    float _3190 = _3184;
    float _3192 = _3190;
    if (!_3118)
    {
        _3186 = _3106;
    }
    float _3194 = _3186;
    float _3196 = _3194;
    float _3198 = _3170;
    if (_3118)
    {
        float _3200 = _3170 + (-1.0);
        _3164 = _3200;
    }
    float _3202 = _3164;
    float _3204 = _3202;
    if (_3118)
    {
        float _3206 = _3138 * _3190;
        _2254 = _3206;
    }
    float _3208 = _2254;
    if (!_3118)
    {
        _3192 = _3176;
    }
    float _3210 = _3192;
    float _3212 = _3210;
    if (_3118)
    {
        float _3214 = _3202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2954 = _3214;
    }
    float _3216 = _2954;
    if (_3118)
    {
        float _3218 = _3106 * _3208;
        _3196 = _3218;
    }
    float _3220 = _3196;
    if (!_3118)
    {
        _3204 = _3108;
    }
    float _3222 = _3204;
    float _3224 = _3222;
    if (_3118)
    {
        float _3226 = _3108 * _3208;
        _3224 = _3226;
    }
    float _3228 = _3224;
    if (!_3118)
    {
        _3140 = _3110;
    }
    float _3230 = _3140;
    float _3232 = _3230;
    if (_3118)
    {
        float _3234 = fma(_3176, _3170, _3216);
        _3212 = _3234;
    }
    float _3236 = _3212;
    if (_3118)
    {
        float _3238 = _3220 * _3220;
        _3232 = _3238;
    }
    float _3240 = _3232;
    if (!_3118)
    {
        _3198 = _3112;
    }
    float _3242 = _3198;
    float _3244 = _3242;
    if (_3118)
    {
        float _3246 = _3228 * _3228;
        _3244 = _3246;
    }
    float _3248 = _3244;
    float _3250 = fma(_3236, _3236, _3240);
    float _3252 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3254 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3256 = _3250 + _3248;
    float _3258 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3182);
    float _3260 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3262 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3264 = fma(_3102, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3262);
    float _3266 = precise::clamp(_3264, 0.0, 1.0);
    float _3268 = rsqrt(_3256);
    float _3270 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3258);
    float _3272 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3274 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3260);
    float _3276 = -_3266;
    float _3278 = _3276 + 1.0;
    float _3280 = _3270 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3282 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3272);
    float _3284 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3274);
    float _3286 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3252);
    float _3288 = _3280 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3290 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3282);
    float _3292 = _3284 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3294 = abs(_3278);
    float _3296 = log2(_3294);
    float _3298 = -_3288;
    float _3300 = fma(_3298, _3254, 1.0);
    float _3302 = _3290 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3304 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3306 = _3268 * _3220;
    float _3308 = _3268 * _3236;
    float _3310 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3286);
    float _3312 = fma(_3302, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3304);
    float _3314 = _3306 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3316 = _3268 * _3228;
    float _3318 = _3310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3320 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3312);
    float _3322 = -_3314;
    float _3324 = fma(_3308, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3322);
    float _3326 = log2(_3300);
    float _3328 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3330 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3320);
    float _3332 = -_3316;
    float _3334 = fma(_3332, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3324);
    float _3336 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3338 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3340 = fma(_3302, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3328);
    float _3342 = fma(_3334, -0.5, 0.5);
    float _3344 = 1.0 / _3330;
    float _3346 = fma(_3302, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3338);
    float _3348 = fma(_3334, 0.5, 0.5);
    float _3350 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3340);
    float _3352 = _3308 + 1.0;
    float _3354 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3346);
    float _3356 = fma(_3348, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3358 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3350);
    float _3360 = exp2(_3336);
    float _3362 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3354);
    float _3364 = fma(_3348, _3356, -0.212114393711090087890625);
    float _3366 = _3326 * 0.693147182464599609375;
    float _3368 = fma(_3348, _3364, 1.570728778839111328125);
    float _3370 = _3366 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3372 = sqrt(_3342);
    float _3374 = _3362 * _3344;
    float _3376 = fma(_3374, 0.5, 0.5);
    float _3378 = -_3308;
    float _3380 = fma(_3360, _3352, _3378);
    float _3382 = _3358 * _3344;
    float _3384 = fma(_3380, 0.5, 0.5);
    float _3386 = fma(_3382, -0.5, 0.5);
    float _3388 = _3372 * 0.636619746685028076171875;
    float3 _9067 = float3(_3376, _3386, _3370);
    float _3390 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9067, float3(0.0), isnan(_9067)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9067, float3(0.0), isnan(_9067)), level(0.0)).x;
    float3 _9078 = float3(_3376, _3386, _3370);
    float4 _3393 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9078, float3(0.0), isnan(_9078)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9078, float3(0.0), isnan(_9078)), level(0.0)).xyzw;
    float _3395 = _3393.x;
    float _3397 = _3393.y;
    float _3399 = _3393.z;
    float _3401 = _3393.w;
    float _3403 = -_3368;
    float _3405 = fma(_3388, _3403, 1.0);
    float2 _9100 = float2(_3405, _3384);
    float3 _3409 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9100, float2(0.0), isnan(_9100)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9100, float2(0.0), isnan(_9100)), level(0.0)).xyz;
    float _3411 = _3409.x;
    float _3413 = _3409.y;
    float _3415 = _3409.z;
    float _3417 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3419 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3421 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    out.m_80.y = 1.0;
    float _3423 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3417);
    float _3425 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3427 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3419);
    float _3429 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3421);
    float _3431 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3423);
    float _3433 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3425);
    float _3435 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3427);
    float _3437 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3429);
    float _3439 = _3431 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3441 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3433);
    float _3443 = _3435 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3445 = -_633;
    float _3447 = _3445 + _3052;
    float _3449 = -_631;
    float _3451 = _3449 + _3054;
    float _3453 = -_635;
    float _3455 = _3453 + _3056;
    float _3457 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3459 = _3447 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3461 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3463 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3465 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3467 = fma(_3451, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3459);
    float _3469 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3471 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3461);
    float _3473 = _3437 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3475 = fma(_3455, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3467);
    float _3477 = fma(_3302, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3457);
    float _3479 = _3447 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3481 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3463);
    float _3483 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3469);
    float _3485 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3465);
    float _3487 = _3447 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3489 = fma(_3451, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3479);
    float _3491 = _3473 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3493 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3477);
    float _3495 = fma(_3451, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3487);
    float _3497 = _3441 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3499 = _3491 + _3485;
    float _3501 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3503 = _3475 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3505 = fma(_3473, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3483);
    float _3507 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3499);
    float _3509 = exp2(_3501);
    float _3511 = fma(_3455, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3489);
    float _3513 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3505);
    float _3515 = _3473 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3517 = _3473 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3519 = _3511 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3521 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3493);
    float _3523 = _3515 + _3471;
    float _3525 = 1.0 / _3507;
    float _3527 = fma(_3455, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3495);
    float _3529 = _3362 + _3330;
    float _3531 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3523);
    out.gl_Position.x = _3362;
    out.gl_Position.y = _3358;
    out.gl_Position.z = _3521;
    out.gl_Position.w = _3330;
    float _3533 = _3330 * 0.5;
    float _3535 = _3529 * 0.5;
    float _3537 = 1.0 / _3503;
    float _3539 = -_3509;
    float _3541 = _3539 + 1.0;
    float _3543 = fma(_3358, -0.5, _3533);
    out.m_82.x = _3054;
    out.m_82.y = _3052;
    out.m_82.z = _3056;
    float _3545 = _3527 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3547 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3549 = _3513 * _3525;
    float _3551 = _3521 + _3330;
    float _3553 = _3531 * _3525;
    bool _3555 = _3549 > 0.0;
    float _3557 = _3551 * 0.5;
    float _3559 = _3519 * _3537;
    float _3561 = _3517 + _3481;
    bool _3563 = _3549 < 1.0;
    bool _3565 = _3563 && _3555;
    out.m_84.x = _3535;
    out.m_84.y = _3543;
    out.m_84.z = _3557;
    out.m_84.w = _3330;
    float _3567 = _3545 * _3537;
    float _3569 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3561);
    bool _3571 = _3374 > (-1.0);
    bool _3573 = _3571 && _3565;
    bool _3575 = _3382 > (-1.0);
    bool _3577 = _3575 && _3573;
    bool _3579 = _3374 < 1.0;
    bool _3581 = _3579 && _3577;
    bool _3583 = _3382 < 1.0;
    bool _3585 = _3583 && _3581;
    float _3587 = _3547 * _3390;
    float _3589 = _3569 * _3525;
    float _3591 = _3401 * _3587;
    float _3593 = _3415 * _3587;
    float _3595 = -_3547;
    float _3597 = _3595 + 1.0;
    float _3599 = fma(_3411, _3591, _3395);
    float _3601 = fma(_3413, _3591, _3397);
    float _3603 = fma(_3401, _3593, _3399);
    float _3605 = _3401 * _3597;
    out.m_86.x = _3599;
    out.m_86.y = _3601;
    out.m_86.z = _3603;
    out.m_86.w = _3605;
    bool _3607 = !_3585;
    float _3609 = _3491;
    float _3611 = _3497;
    float _3613 = _3597;
    float _3645;
    float _3647;
    float _3649;
    float _3657;
    if (!_3607)
    {
        float _3615 = -_3589;
        float _3617 = _3382 + _3615;
        float _3619 = -_3553;
        float _3621 = _3374 + _3619;
        float _3623 = _2882 * _3080;
        float _3625 = -_3559;
        float _3627 = _3374 + _3625;
        float _3629 = _3617 * _3617;
        float _3631 = -_3567;
        float _3633 = _3382 + _3631;
        float _3635 = _3623 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _3637 = fma(_3621, _3621, _3629);
        float _3639 = sqrt(_3637);
        bool _3641 = _3639 > 0.0;
        float _3643 = _3623;
        _3645 = _3621;
        _3647 = _3637;
        _3649 = _3639;
        if (!_3641)
        {
            _3643 = _3635;
        }
        float _3651 = _3643;
        bool _3653 = !_3641;
        float _3655 = _3651;
        _3657 = _3651;
        _3659 = _3653;
        if (!_3659)
        {
            float _3661 = _3633 * _3633;
            float _3663 = fma(_3627, _3627, _3661);
            float _3665 = rsqrt(_3637);
            float _3667 = sqrt(_3663);
            float _3669 = _3621 * _3665;
            float _3671 = _3617 * _3665;
            bool _3673 = _3667 > 0.0;
            _3613 = _3667;
            _3649 = _3665;
            if (!_3673)
            {
                _3655 = _3635;
            }
            float _3675 = _3655;
            bool _3677 = !_3673;
            _3657 = _3675;
            _3659 = _3677;
            if (!_3659)
            {
                float _3679 = _1874 * _3497;
                float _3681 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3683 = fma(_3679, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3491);
                float _3685 = fma(_3679, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3517);
                float _3687 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3683);
                float _3689 = fma(_3679, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3515);
                float _3691 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3685);
                float _3693 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3689);
                float _3695 = 1.0 / _3687;
                float _3697 = _3681 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3699 = _3633 * _3697;
                float _3701 = _3627 * _3697;
                float _3703 = rsqrt(_3663);
                float _3705 = _3699 * _3699;
                float _3707 = fma(_3701, _3701, _3705);
                float _3709 = _3691 * _3695;
                float _3711 = _3693 * _3695;
                float _3713 = _3709 * _3709;
                float _3715 = sqrt(_3707);
                float _3717 = fma(_3711, _3711, _3713);
                float _3719 = _3633 * _3703;
                float _3721 = _3627 * _3703;
                float _3723 = sqrt(_3717);
                float _3725 = _3671 * _3719;
                float _3727 = fma(_3669, _3721, _3725);
                float _3729 = precise::min(0.0, _3727);
                float _3731 = _3330 * _3729;
                float _3733 = fma(_3715, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3723);
                float _3735 = fma(_3701, _3731, _3362);
                float _3737 = fma(_3699, _3731, _3358);
                float _3739 = 1.0 / _3733;
                out.gl_Position.x = _3735;
                out.gl_Position.y = _3737;
                float _3741 = _3723 * _3739;
                out.m_80.y = _3741;
                _3645 = _3731;
                _3609 = _3715;
                _3657 = _3635;
                _3611 = _3741;
                _3647 = _3701;
                _3613 = _3699;
                _3649 = _3727;
                _3659 = true;
            }
        }
    }
    else
    {
        float _3743 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3743;
        _3645 = 0.0;
        _3657 = 0.0;
        _3647 = 0.0;
        _3613 = _3743;
        _3649 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    _3659 = false;
    float _3745 = _3645;
    float _3747 = _3609;
    float _3749 = _3657;
    float _3751 = _3611;
    float _3753 = _3647;
    float _3755 = _3613;
    float _3757 = _3649;
    bool _3759 = _3102 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3761 = isnan(_3102);
    bool _3763 = _3759 || _3761;
    bool _3765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3767 = _3763 || _3765;
    float _3769 = _3751;
    float _3771 = _3747;
    float _3773 = _3755;
    float _3775 = _3753;
    float _3777 = _3745;
    float _3779 = _3757;
    if (!_3767)
    {
        _3769 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3781 = _3769;
    float _3783 = _3781;
    float _3785 = _3781;
    if (!_3767)
    {
        _3771 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3787 = _3771;
    float _3789 = _3787;
    float _3791 = _3787;
    if (!_3767)
    {
        _3773 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3793 = _3773;
    float _3795 = _3793;
    float _3797 = _3793;
    if (!_3767)
    {
        _3775 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3799 = _3775;
    float _3801 = _3799;
    float _3803 = _3799;
    if (!_3767)
    {
        _3777 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3805 = _3777;
    float _3807 = _3805;
    float _3809 = _3805;
    if (!_3767)
    {
        _3779 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3811 = _3779;
    bool _3813 = !_3767;
    float _3815 = _3811;
    float _3817 = _3811;
    if (!_3813)
    {
        bool _3819 = _3102 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3821 = isnan(_3102);
        bool _3823 = _3819 || _3821;
        bool _3825 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3827 = _3823 || _3825;
        if (!_3827)
        {
            float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3831 = _3102 + _3829;
            float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3835 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3833;
            float _3837 = 1.0 / _3835;
            float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3841 = _3839 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3851 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3853 = _3851 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3857 = _3855 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3859 = _3831 * _3837;
            float _3861 = precise::clamp(_3859, 0.0, 1.0);
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3867 = fma(_3861, _3841, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3869 = fma(_3861, _3865, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3871 = fma(_3861, _3845, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3873 = fma(_3861, _3849, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3875 = fma(_3861, _3853, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3877 = fma(_3861, _3857, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3791 = _3869;
            _3809 = _3875;
            _3785 = _3867;
            _3803 = _3873;
            _3797 = _3871;
            _3817 = _3877;
            _3879 = true;
        }
        else
        {
            bool _3881 = _3102 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3883 = isnan(_3102);
            bool _3885 = _3881 || _3883;
            bool _3887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3889 = _3885 || _3887;
            if (!_3889)
            {
                _3783 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3891 = _3783;
            _3785 = _3891;
            if (!_3889)
            {
                _3789 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3893 = _3789;
            _3791 = _3893;
            if (!_3889)
            {
                _3795 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3895 = _3795;
            _3797 = _3895;
            if (!_3889)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3897 = _3801;
            _3803 = _3897;
            if (!_3889)
            {
                _3807 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3899 = _3807;
            _3809 = _3899;
            if (!_3889)
            {
                _3815 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3901 = _3815;
            bool _3903 = !_3889;
            _3817 = _3901;
            if (!_3903)
            {
                bool _3905 = _3102 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3907 = isnan(_3102);
                bool _3909 = _3905 || _3907;
                bool _3911 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3913 = _3909 || _3911;
                if (!_3913)
                {
                    float _3915 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3917 = _3102 + _3915;
                    float _3919 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3921 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3919;
                    float _3923 = 1.0 / _3921;
                    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3931 = _3929 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3935 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3939 = _3937 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3941 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3943 = _3941 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3945 = _3917 * _3923;
                    float _3947 = precise::clamp(_3945, 0.0, 1.0);
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3951 = _3949 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3953 = fma(_3947, _3927, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3955 = fma(_3947, _3951, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3957 = fma(_3947, _3931, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3959 = fma(_3947, _3935, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3961 = fma(_3947, _3939, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3963 = fma(_3947, _3943, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3791 = _3955;
                    _3809 = _3961;
                    _3785 = _3953;
                    _3803 = _3959;
                    _3797 = _3957;
                    _3817 = _3963;
                    _3879 = true;
                }
                else
                {
                    _3791 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3809 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3785 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3797 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3817 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3879 = false;
    float _3965 = _3791;
    float _3967 = _3809;
    float _3969 = _3785;
    float _3971 = _3803;
    float _3973 = _3797;
    float _3975 = _3817;
    float _3977 = fma(_2630, -0.5, 0.5);
    float _3979 = precise::clamp(_3977, 0.0, 1.0);
    float _3981 = -_3965;
    float _3983 = _3981 + _3967;
    float _3985 = _3749 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3987 = -_3969;
    float _3989 = _3987 + _3971;
    float _3991 = fma(_3979, _3983, _3965);
    out.m_88.x = 0.0;
    float _3993 = -_3973;
    float _3995 = _3993 + _3975;
    float _3997 = fma(_3979, _3989, _3969);
    float _3999 = _3991 * 0.586610972881317138671875;
    out.m_49.x = _3985;
    bool _4001 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4003 = fma(_3979, _3995, _3973);
    float _4005 = fma(_3997, 0.298911988735198974609375, _3999);
    bool _4007 = _3080 > 0.0;
    bool _4009 = isnan(_3080);
    bool _4011 = _4007 || _4009;
    bool _4013 = isnan(0.0);
    bool _4015 = _4011 || _4013;
    float _4017 = fma(_4003, 0.114477999508380889892578125, _4005);
    float _4019 = -_4017;
    float _4021 = _3997 + _4019;
    float _4023 = -_4017;
    float _4025 = _3991 + _4023;
    float _4027 = -_4017;
    float _4029 = _4003 + _4027;
    float _4031 = fma(_4021, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4017);
    float _4033 = fma(_4025, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4017);
    float _4035 = fma(_4029, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4017);
    bool _4037 = !_4001;
    if (!_4037)
    {
        float _4039 = -_3052;
        float _4041 = _4039 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4043 = -_3054;
        float _4045 = _4043 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4047 = -_3056;
        float _4049 = _4047 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4051 = _4041 * _4041;
        float _4053 = fma(_4045, _4045, _4051);
        float _4055 = fma(_4049, _4049, _4053);
        float _4057 = sqrt(_4055);
        float _4059 = rsqrt(_4055);
        float _4061 = -_4057;
        float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4065 = _4063 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4067 = precise::clamp(_4065, 0.0, 1.0);
        float _4069 = _4045 * _4059;
        float _4071 = _4041 * _4059;
        float _4073 = abs(_4067);
        float _4075 = log2(_4073);
        float _4077 = _4049 * _4059;
        float _4079 = _4069 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4081 = _2630 * _4071;
        float _4083 = -_4071;
        float _4085 = -_4079;
        float _4087 = fma(_4083, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4085);
        float _4089 = fma(_2628, _4069, _4081);
        float _4091 = -_4077;
        float _4093 = fma(_4091, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4087);
        float _4095 = fma(_2440, _4077, _4089);
        float _4097 = precise::clamp(_4095, 0.0, 1.0);
        float _4099 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4101 = _4093 + _4099;
        float _4103 = _4075 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4105 = _4101 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4107 = precise::clamp(_4105, 0.0, 1.0);
        float _4109 = exp2(_4103);
        float _4111 = _4109 * _4107;
        float _4113 = _4097 * _4111;
        float _4115 = _4113 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4117 = _4113 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4119 = _4113 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _4115;
        out.m_88.y = _4117;
        out.m_88.z = _4119;
    }
    out.m_90.x = _4031;
    out.m_90.y = _4033;
    out.m_90.z = _4035;
    if (_4015)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _4121 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4121;
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
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3879 = false;
    bool _3659 = false;
    bool _2740 = false;
    bool _2728 = false;
    bool _655 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4178 = as_type<float>(_125);
        out.gl_Position.z = _4178;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_51.w;
    float _131 = in.m_53.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.x = _131;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_109);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _119;
    if (_159)
    {
        out.m_49.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4251 = as_type<float>(_165);
        out.gl_Position.z = _4251;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_57.x;
    float _169 = in.m_57.y;
    float _171 = in.m_57.z;
    float _173 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _175 = in.m_59.x;
    float _177 = in.m_59.y;
    float _179 = in.m_59.z;
    float _181 = in.m_61.x;
    float _183 = in.m_61.y;
    float _185 = in.m_61.z;
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_51.x;
    float _191 = in.m_51.y;
    float _193 = in.m_51.z;
    float _195 = _167 * _167;
    float _197 = _169 * _169;
    float _199 = fma(_175, _175, _195);
    float _201 = fma(_177, _177, _197);
    float _203 = fma(_181, _181, _199);
    float _205 = _171 * _171;
    float _207 = fma(_183, _183, _201);
    float _209 = sqrt(_203);
    float _211 = fma(_179, _179, _205);
    float _213 = fma(_185, _185, _211);
    float _215 = sqrt(_207);
    float _217 = sqrt(_213);
    bool _219 = _209 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = 0.0;
    float _225 = _203;
    if (_219)
    {
        float _227 = rsqrt(_203);
        _223 = _227;
    }
    float _229 = _223;
    float _231 = 0.0;
    if (!_219)
    {
        _231 = 0.0;
    }
    float _233 = _231;
    bool _235 = _217 > 0.0;
    float _237 = 0.0;
    float _239 = _233;
    float _241 = _217;
    if (!_219)
    {
        _237 = 0.0;
    }
    float _243 = _237;
    int _245 = as_type<int>(_187) & 1;
    bool _247 = _245 != 0;
    int _249 = as_type<int>(_187) & 2;
    bool _251 = _249 != 0;
    float _253 = _209;
    float _255 = _187;
    float _257 = _243;
    if (_221)
    {
        float _259 = rsqrt(_207);
        _253 = _259;
    }
    float _261 = _253;
    bool _263 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _267 = _263 || _265;
    bool _269 = isnan(1.0);
    bool _271 = _267 || _269;
    if (!_221)
    {
        _255 = 0.0;
    }
    float _273 = _255;
    float _275 = 0.0;
    float _277 = _273;
    if (!_221)
    {
        _275 = 0.0;
    }
    float _279 = _275;
    float _281 = _279;
    if (!_221)
    {
        _225 = 0.0;
    }
    float _283 = _225;
    float _285 = _213;
    float _287 = _283;
    if (_235)
    {
        float _289 = rsqrt(_213);
        _285 = _289;
    }
    float _291 = _285;
    if (_219)
    {
        float _293 = _229 * _175;
        _239 = _293;
    }
    float _295 = _239;
    if (!_219)
    {
        _241 = 0.0;
    }
    float _297 = _241;
    float _299 = _297;
    if (_219)
    {
        float _301 = _229 * _167;
        _257 = _301;
    }
    float _303 = _257;
    float _305 = 0.0;
    if (!_235)
    {
        _305 = 0.0;
    }
    float _307 = _305;
    float _309 = 0.0;
    float _311 = _307;
    if (!_271)
    {
        float _313 = _173 * _173;
        float _315 = _313 * 0.5;
        _309 = _315;
    }
    float _317 = _309;
    float _319 = 0.0;
    float _321 = _317;
    if (!_235)
    {
        _319 = 0.0;
    }
    float _323 = _319;
    float _325 = _261;
    float _327 = _323;
    if (_221)
    {
        float _329 = _261 * _177;
        _277 = _329;
    }
    float _331 = _277;
    if (_221)
    {
        float _333 = _261 * _169;
        _281 = _333;
    }
    float _335 = _281;
    if (_221)
    {
        float _337 = _261 * _183;
        _287 = _337;
    }
    float _339 = _287;
    float _341 = _339;
    if (!_235)
    {
        _325 = 0.0;
    }
    float _343 = _325;
    float _345 = _343;
    if (_219)
    {
        float _347 = _229 * _181;
        _299 = _347;
    }
    float _349 = _299;
    bool _351 = !_247;
    float _353 = _351 ? (-0.5) : 0.5;
    if (!_271)
    {
        float _355 = _317 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _321 = _355;
    }
    float _357 = _321;
    float _359 = _357;
    if (_235)
    {
        float _361 = _291 * _179;
        _311 = _361;
    }
    float _363 = _311;
    if (_235)
    {
        float _365 = _291 * _171;
        _327 = _365;
    }
    float _367 = _327;
    if (_235)
    {
        float _369 = _291 * _185;
        _345 = _369;
    }
    float _371 = _345;
    bool _373 = !_251;
    float _375 = _373 ? (-0.5) : 0.5;
    bool _377 = !_271;
    float _379 = 0.0;
    float _381 = 0.0;
    if (!_377)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _393 = _173 * _385;
        float _395 = 1.0 / _389;
        float _397 = _391 * 0.693147182464599609375;
        float _399 = exp2(_393);
        float _401 = 1.0 / _397;
        float _403 = _399 + (-1.0);
        float _405 = -_403;
        float _407 = fma(_405, _401, _173);
        float _409 = _407 * _395;
        float _411 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _359 = _411;
        _379 = _409;
        _381 = _395;
    }
    float _413 = _359;
    float _415 = _379;
    float _417 = _381;
    float _419 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _421 = _417;
    float _423 = _415;
    if (!_271)
    {
        _421 = _173;
    }
    float _425 = _421;
    bool _427 = !_271;
    float _429 = _425;
    if (!_427)
    {
        float _431 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _433 = log2(_431);
        float _435 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _437 = _435 + 1.0;
        float _439 = 1.0 / _437;
        float _441 = _173 * _433;
        float _443 = exp2(_441);
        float _445 = -_443;
        float _447 = _445 + 1.0;
        float _449 = _447 * _439;
        _423 = _439;
        _429 = _449;
    }
    float _451 = _423;
    float _453 = _429;
    float _455 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _457 = _419 * _303;
    float _459 = _419 * _335;
    float _461 = _419 * _367;
    float _463 = _451;
    if (!_271)
    {
        float _465 = _145 * _145;
        float _467 = _465 * 0.5;
        _463 = _467;
    }
    float _469 = _463;
    float _471 = fma(_455, _295, _457);
    float _473 = fma(_455, _331, _459);
    float _475 = fma(_455, _363, _461);
    float _477 = _469;
    if (!_271)
    {
        float _479 = _469 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _477 = _479;
    }
    float _481 = _477;
    bool _483 = !_271;
    float _485 = _481;
    if (!_483)
    {
        float _487 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _489 = log2(_487);
        float _491 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _493 = _491 + 1.0;
        float _495 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _497 = _145 * _489;
        float _499 = 1.0 / _493;
        float _501 = _495 * 0.693147182464599609375;
        float _503 = exp2(_497);
        float _505 = 1.0 / _501;
        float _507 = _503 + (-1.0);
        float _509 = -_507;
        float _511 = fma(_509, _505, _145);
        float _513 = _511 * _499;
        float _515 = _513 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _485 = _515;
    }
    float _517 = _485;
    float _519 = in.m_66.w;
    float _521 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _523 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _525 = in.m_46.x;
    float _527 = in.m_46.y;
    float _529 = in.m_46.z;
    float _531 = _521 * _303;
    float _533 = _521 * _335;
    float _535 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _537 = _521 * _367;
    float _539 = _517 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _541 = fma(_523, _349, _471);
    float _543 = fma(_535, _331, _533);
    float _545 = fma(_523, _339, _473);
    float _547 = fma(_523, _371, _475);
    float _549 = fma(_535, _295, _531);
    float _551 = fma(_535, _363, _537);
    float _553 = fma(_539, _339, _543);
    float _555 = fma(_453, _189, _541);
    float _557 = fma(_453, _191, _545);
    float _559 = fma(_453, _193, _547);
    float _561 = fma(_539, _349, _549);
    float _563 = fma(_539, _371, _551);
    if (!_271)
    {
        _341 = _145;
    }
    float _565 = _341;
    bool _567 = !_271;
    float _569 = _565;
    if (!_567)
    {
        float _571 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _573 = log2(_571);
        float _575 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _577 = _575 + 1.0;
        float _579 = 1.0 / _577;
        float _581 = _145 * _573;
        float _583 = exp2(_581);
        float _585 = -_583;
        float _587 = _585 + 1.0;
        float _589 = _587 * _579;
        _569 = _589;
    }
    float _591 = _569;
    float _593 = fma(_591, _191, _553);
    bool _595 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _597 = fma(_591, _189, _561);
    float _599 = fma(_591, _193, _563);
    float _601 = -_593;
    float _603 = _557 + _601;
    float _605 = fma(_555, _519, _525);
    float _607 = -_597;
    float _609 = _555 + _607;
    float _611 = -_599;
    float _613 = _559 + _611;
    float _615 = _603 * _177;
    float _617 = _603 * _169;
    float _619 = _603 * _183;
    float _621 = fma(_557, _519, _527);
    float _623 = fma(_609, _175, _615);
    float _625 = fma(_609, _167, _617);
    float _627 = fma(_609, _181, _619);
    float _629 = fma(_559, _519, _529);
    float _631 = fma(_613, _179, _623);
    float _633 = fma(_613, _171, _625);
    float _635 = fma(_613, _185, _627);
    bool _637 = !_595;
    float _653;
    if (!_637)
    {
        float _639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _641 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _645 = _643 * _639;
        float _647 = floor(_645);
        float _649 = -_647;
        float _651 = _645 + _649;
        _653 = _651;
        _655 = true;
    }
    else
    {
        float _657 = float(_109);
        float _659 = 1.0 / _657;
        float _661 = _145 * _659;
        _653 = _661;
    }
    _655 = false;
    float _663 = _653;
    float _665 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _667 = int(_665);
    float _669 = _621 * _177;
    float _671 = _621 * _169;
    float _673 = _621 * _183;
    float _675 = fma(_605, _175, _669);
    float _677 = fma(_605, _167, _671);
    float _679 = fma(_605, _181, _673);
    float _681 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _683 = int(_681);
    float _685 = _131 * 2.0;
    int _687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _689 = _687 != 0;
    float _691 = in.m_53.w;
    float _693 = fma(_629, _171, _677);
    int _695 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _697 = _695 != 0;
    float _699 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _701 = int(_699);
    float _703 = float(_667);
    float _705 = fma(_629, _185, _679);
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _709 = _707 != 0;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _717 = _715 != 0;
    float _719 = in.m_59.w;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _723 = _663 + _721;
    bool _725 = _131 > 0.5;
    float _727 = 1.0 / _703;
    float _729 = float(_683);
    float _731 = in.m_61.w;
    bool _733 = !_717;
    int _735 = _733 ? 0 : 1;
    float _737 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _741 = _739 != 0;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _745 = _743 != 0;
    float _747 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _749 = int(_747);
    float _751 = float(uint(_701));
    int _753 = ~_701;
    int _755 = _753 + 1;
    float _757 = 0.0;
    if (_689)
    {
        _757 = _131;
    }
    float _759 = _757;
    float _761 = 0.0;
    float _763 = _759;
    if (_689)
    {
        _761 = 1.0;
    }
    float _765 = _761;
    float _767 = 1.0 / _729;
    float _769 = _727 * _145;
    float _771 = _765;
    if (!_689)
    {
        _771 = 1.2345600128173828125;
    }
    float _773 = _771;
    float _775 = float(uint(_749));
    float _777 = 1.0 / _751;
    float _779 = in.m_53.z;
    int _781 = ~_749;
    int _783 = _781 + 1;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _785;
    int _789 = ~_749;
    int _791 = _789 + 1;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _795 = _767 * _145;
    float _797 = trunc(_769);
    int _799 = int(_797);
    float _801 = in.m_53.y;
    float _803 = -_793;
    float _805 = fma(_737, 2.0, _803);
    float _807 = _705 + _731;
    bool _809 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _811 = isnan(_663);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -_145;
    float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[76].x, _805);
    float _825 = 1.0 / _775;
    int _827 = as_type<int>(_777) + (-2);
    float _829 = float(_749);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _831;
    float _835 = trunc(_795);
    int _837 = int(_835);
    float _839 = float(uint(_799));
    float _841 = _131 + _779;
    float _843 = as_type<float>(_827) * _839;
    float _845 = _841 + (-1.0);
    int _847 = as_type<int>(_825) + (-2);
    float _849 = _801 * 2.0;
    float _851 = trunc(_843);
    float _853 = precise::max(_851, 0.0);
    uint _856 = uint(_853);
    bool _858 = !_713;
    int _860 = _858 ? 0 : 1;
    float _862 = _801 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_689)
    {
        _763 = _801;
    }
    float _864 = _763;
    float _866 = _779 + _801;
    int _868 = abs(_860);
    float _870 = float(uint(_837));
    float _872 = floor(_849);
    bool _874 = !_709;
    int _876 = _874 ? 0 : 1;
    float _878 = _866 + (-1.0);
    int _880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _882 = _880 != 0;
    float _884 = as_type<float>(_847) * _870;
    float _886 = _864 * _773;
    int _888 = abs(_876);
    float _890 = trunc(_884);
    float _892 = precise::max(_890, 0.0);
    uint _894 = uint(_892);
    int _896 = _755 * int(_856);
    int _898 = _896 + _799;
    bool _900 = !_745;
    int _902 = _900 ? 0 : 1;
    float _904 = float(uint(_898));
    float _906 = floor(_685);
    float _908 = _779 * 2.0;
    bool _910 = !_882;
    int _912 = _910 ? 0 : 1;
    float _914 = as_type<float>(_827) * _904;
    bool _916 = _872 > 0.0;
    float _918 = -_353;
    int _920 = _725 ? as_type<int>(_918) : as_type<int>(_353);
    int _922 = _783 * int(_894);
    int _924 = _922 + _837;
    float _926 = trunc(_914);
    float _928 = precise::max(_926, 0.0);
    uint _930 = uint(_928);
    bool _932 = !_697;
    float _934 = _932 ? _353 : as_type<float>(_920);
    int _936 = abs(_912);
    float _938 = float(uint(_924));
    float _940 = _934 + 0.5;
    bool _942 = !_741;
    int _944 = _942 ? 0 : 1;
    float _946 = floor(_908);
    bool _948 = _872 >= 0.0;
    bool _950 = isnan(_872);
    bool _952 = _948 || _950;
    bool _954 = isnan(0.0);
    bool _956 = _952 || _954;
    float _958 = as_type<float>(_847) * _938;
    bool _960 = _906 > 0.0;
    int _962 = _956 ? 0 : 1;
    bool _964 = _906 >= 0.0;
    bool _966 = isnan(_906);
    bool _968 = _964 || _966;
    bool _970 = isnan(0.0);
    bool _972 = _968 || _970;
    float _974 = trunc(_958);
    float _976 = precise::max(_974, 0.0);
    uint _978 = uint(_976);
    int _980 = ~_962;
    int _982 = _980 + 1;
    int _984 = _982 + 1;
    int _986 = _984;
    int _988 = as_type<int>(_908);
    float _990 = _958;
    if (!_916)
    {
        int _992 = ~_962;
        int _994 = _992 + 1;
        _986 = _994;
    }
    int _996 = _986;
    bool _998 = _779 > 0.5;
    bool _1000 = _801 > 0.5;
    float _1002 = 1.0 / _787;
    int _1004 = int(_856) + int(_930);
    int _1006 = _972 ? 0 : 1;
    bool _1008 = _946 > 0.0;
    bool _1010 = _946 >= 0.0;
    bool _1012 = isnan(_946);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan(0.0);
    bool _1018 = _1014 || _1016;
    int _1020 = int(_894) + int(_978);
    float _1022 = -_353;
    int _1024 = _998 ? as_type<int>(_1022) : as_type<int>(_353);
    float _1026 = -_375;
    int _1028 = _1000 ? as_type<int>(_1026) : as_type<int>(_375);
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1032 = _1030 != 0;
    if (_689)
    {
        _988 = 0;
    }
    int _1034 = _988;
    int _1036 = ~_701;
    int _1038 = _1036 + 1;
    int _1040 = ~_1006;
    int _1042 = _1040 + 1;
    int _1044 = _1042 + 1;
    int _1046 = _1034;
    int _1048 = _1044;
    if (!_689)
    {
        _1046 = 1;
    }
    int _1050 = _1046;
    if (!_960)
    {
        int _1052 = ~_1006;
        int _1054 = _1052 + 1;
        _1048 = _1054;
    }
    int _1056 = _1048;
    if (_689)
    {
        _990 = 1.0;
    }
    float _1058 = _990;
    float _1060 = _1058;
    if (!_689)
    {
        _1060 = 7.345489978790283203125;
    }
    float _1062 = _1060;
    bool _1064 = !_1032;
    float _1066 = _1064 ? _375 : as_type<float>(_1028);
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1070 = _1068 != 0;
    bool _1072 = _1050 != 1;
    bool _1074 = _691 > 0.5;
    int _1076 = _1038 * _1004;
    int _1078 = _1076 + _799;
    bool _1080 = !_1070;
    float _1082 = _1080 ? _353 : as_type<float>(_1024);
    float _1084 = -_375;
    int _1086 = _1074 ? as_type<int>(_1084) : as_type<int>(_375);
    int _1088 = _791 * _1020;
    int _1090 = _1088 + _837;
    int _1092 = _1018 ? 0 : 1;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1096 = _1094 != 0;
    int _1098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1100 = _1098 != 0;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1104 = _1102 != 0;
    int _1106 = ~_1092;
    int _1108 = _1106 + 1;
    int _1110 = _1108 + 1;
    int _1112 = _1110;
    float _1114 = as_type<float>(_1078);
    if (!_1008)
    {
        int _1116 = ~_1092;
        int _1118 = _1116 + 1;
        _1112 = _1118;
    }
    int _1120 = _1112;
    bool _1122 = !_1100;
    int _1124 = _1122 ? 0 : 1;
    bool _1126 = uint(_1078) >= uint(_701);
    bool _1128 = uint(_1090) >= uint(_749);
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1132 = _1130 != 0;
    float _1134 = 0.0;
    if (!_1072)
    {
        _1134 = _801;
    }
    float _1136 = _1134;
    float _1138 = 0.0;
    float _1140 = _1136;
    if (!_1072)
    {
        _1138 = _801;
    }
    float _1142 = _1138;
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1144;
    float _1148 = 0.0;
    float _1150 = _1142;
    if (!_1072)
    {
        _1148 = _779;
    }
    float _1152 = _1148;
    float _1154 = _1152;
    if (!_1072)
    {
        _1114 = _779;
    }
    float _1156 = _1114;
    float _1158 = _1156;
    if (_1072)
    {
        _1140 = _131;
    }
    float _1160 = _1140;
    float _1162 = 1.0 / _1146;
    if (_1072)
    {
        _1150 = _131;
    }
    float _1164 = _1150;
    if (_1072)
    {
        _1154 = _801;
    }
    float _1166 = _1154;
    float _1168 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1072)
    {
        _1158 = _801;
    }
    float _1170 = _1158;
    bool _1172 = !_1126;
    int _1174 = _1172 ? 0 : (-1);
    bool _1176 = !_1128;
    int _1178 = _1176 ? 0 : (-1);
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1182 = _1180 != 0;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1186 = _1184 != 0;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1190 = _1188 != 0;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1194 = _1192 != 0;
    float _1196 = fma(_629, _179, _675);
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1202 = in.m_57.w;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1206 = _663 + _1204;
    float _1208 = _1196 + _719;
    float _1210 = 1.0 / _1200;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1214 = _1206 * _1162;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1218 = _663 + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1220;
    float _1224 = fma(_862, -2.0, _1212);
    float _1226 = _1218 * _1002;
    float _1228 = _1208 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    bool _1230 = !_1104;
    int _1232 = _1230 ? 0 : 1;
    float _1234 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1236 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1238 = isnan(_663);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    bool _1248 = !_1096;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = _723 * _1210;
    float _1254 = _131 + _801;
    float _1256 = float(_996);
    float _1258 = _693 + _1202;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1262 = _1260 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1264 = _1254 + (-1.0);
    float _1266 = fma(_1222, _1214, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1268 = _1258 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1270 = fma(_1262, _1252, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1272 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1274 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1276 = -_1246;
    float _1278 = _1276 + 1.0;
    bool _1280 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1282 = isnan(_663);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1288 = _1284 || _1286;
    float _1290 = float(_1288);
    bool _1292 = _663 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1294 = isnan(_663);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1304;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1312 = _1290 * _1278;
    bool _1314 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1316 = isnan(0.0);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1322 = _1318 || _1320;
    float _1324 = fma(_1306, _1214, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1326 = _1062 * _131;
    float _1328 = -_1290;
    float _1330 = _1328 + 1.0;
    float _1332 = -_1302;
    float _1334 = _1332 + 1.0;
    float _1336 = fma(_1310, _1252, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1338 = _1302 * _1330;
    float _1340 = floor(_886);
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1342;
    float _1346 = _819 * _1334;
    float _1348 = -_819;
    float _1350 = _1348 + 1.0;
    int _1352 = ~_1004;
    int _1354 = _1352 + _1174;
    int _1356 = _1354 + 1;
    float _1358 = fma(_1344, _1226, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1360 = fma(_940, (*spvDescriptorSet0.vp_c9)._m0[80].x, _823);
    float _1362 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1224);
    float _1364 = _1266 * _1346;
    float _1366 = floor(_1326);
    float _1368 = float(_109);
    float _1370 = _1324 * _1346;
    float _1372 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1364);
    float _1374 = fma(_833, _1226, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1376 = _1066 + (-0.5);
    int _1378 = ~_1020;
    int _1380 = _1378 + _1178;
    int _1382 = _1380 + 1;
    float _1384 = -_1340;
    float _1386 = _886 + _1384;
    float _1388 = 1.0 / _1368;
    float _1390 = _1268 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1392 = -_1376;
    float _1394 = -_1362;
    float _1396 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1394);
    float _1398 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1370);
    float _1400 = _1268 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1402 = float(_701);
    float _1404 = fma(_1270, _1338, _1372);
    float _1406 = fma(_1336, _1338, _1398);
    float _1408 = -_1366;
    float _1410 = _1326 + _1408;
    float _1412 = _1268 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1414 = fma(_1228, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1390);
    float _1416 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1418 = log2(_1416);
    float _1420 = fma(_1228, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1412);
    float _1422 = fma(_1228, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1400);
    float _1424 = _1388 * _145;
    float _1426 = float(_837);
    float _1428 = fma(_1374, _1312, _1406);
    float _1430 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1432 = _1402 * _1424;
    bool _1434 = _1426 >= _829;
    bool _1436 = isnan(_1426);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan(_829);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = _1386 * _829;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1450 = _829 * _1424;
    float _1452 = _807 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    int _1454 = abs(_1124);
    float _1456 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1448);
    int _1458 = abs(_1232);
    float _1460 = fma(_1452, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1420);
    int _1462 = abs(_1250);
    float _1464 = fma(_1452, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1422);
    float _1466 = fma(_1452, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1414);
    float _1468 = _1418 * _145;
    float _1470 = float(_1056);
    float _1472 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1474 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1478 = float(_1458);
    float _1480 = fma(_1358, _1312, _1404);
    float _1482 = float(_1462);
    float _1484 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1430);
    float _1486 = float(_1120);
    float _1488 = fma(_1474, -2.0, _1476);
    float _1490 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1492 = _1478 * _1256;
    float _1494 = _1482 * _1486;
    float _1496 = _1464 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1498 = _1466 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1500 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1502 = float(_799);
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1510 = _1410 * _1402;
    bool _1512 = _1502 >= _1402;
    bool _1514 = isnan(_1502);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan(_1402);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = exp2(_1468);
    float _1526 = _1460 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1528 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1504);
    float _1530 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1506);
    float _1532 = -_1508;
    float _1534 = fma(_1168, 2.0, _1532);
    float _1536 = _1498 * _1472;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1540 = 1.0 + _1538;
    float _1542 = in.m_66.x;
    float _1544 = in.m_66.y;
    float _1546 = _1526 * _1490;
    float _1548 = _1496 * _1500;
    bool _1550 = !_1132;
    float _1552 = _1550 ? _375 : as_type<float>(_1086);
    float _1554 = 1.0 / _1540;
    float _1556 = in.m_68.x;
    float _1558 = in.m_68.y;
    float _1560 = in.m_68.z;
    float _1562 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1480);
    float _1564 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1428);
    float _1566 = -_145;
    float _1568 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1534);
    float _1570 = -_1524;
    float _1572 = _1570 + 1.0;
    float _1574 = _1082 + 0.5;
    float _1576 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1488);
    float _1578 = float(_1454);
    float _1580 = _1552 + (-0.5);
    float _1582 = _1322 ? _1572 : 0.0;
    float _1584 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1568);
    bool _1586 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1588 = isnan(1.0);
    bool _1590 = _1586 || _1588;
    bool _1592 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1594 = _1590 || _1592;
    float _1596 = trunc(_1510);
    int _1598 = int(_1596);
    float _1600 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1528);
    float _1602 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1530);
    float _1604 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1484);
    float _1606 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1456);
    float _1608 = _1578 * _1470;
    float _1610 = _1492 * (-2.0);
    float _1612 = _1562 * _1542;
    float _1614 = trunc(_1522);
    int _1616 = int(_1614);
    int _1618 = abs(_902);
    float _1620 = _131 + (-0.5);
    int _1622 = _749 * _1382;
    int _1624 = _1622 + _837;
    if (_1594)
    {
        float _1626 = _1582 * _1554;
        _149 = _1626;
    }
    float _1628 = _149;
    float _1630 = -_1580;
    float _1632 = -_1576;
    float _1634 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1632);
    float _1636 = _1494 * (-2.0);
    float _1638 = _1608 * (-2.0);
    float _1640 = trunc(_1444);
    int _1642 = int(_1640);
    int _1644 = _1598 * _1618;
    int _1646 = _1644 + _799;
    float _1648 = fma(_1636, _1556, _1556);
    float _1650 = fma(_1272, _1636, _1272);
    float _1652 = fma(_1638, _1558, _1558);
    float _1654 = fma(_1274, _1610, _1274);
    float _1656 = _779 + (-0.5);
    int _1658 = _701 * _1356;
    int _1660 = _1658 + _799;
    float _1662 = trunc(_1446);
    int _1664 = int(_1662);
    float _1666 = float(uint(_1646));
    float _1668 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1648);
    bool _1670 = !_1186;
    int _1672 = _1670 ? 0 : 1;
    float _1674 = _801 + (-0.5);
    bool _1676 = _701 == 0;
    float _1678 = fma(_1234, _1638, _1234);
    bool _1680 = _749 == 0;
    float _1682 = trunc(_1432);
    int _1684 = int(_1682);
    int _1686 = abs(_944);
    float _1688 = as_type<float>(_827) * _1666;
    int _1690 = ~_1616;
    int _1692 = _1690 + 1;
    int _1694 = _1692 + 1;
    float _1696 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1652);
    bool _1698 = !_1676;
    int _1700 = _1698 ? _1660 : (-1);
    float _1702 = fma(_1610, _1560, _1560);
    int _1704 = ~_1642;
    int _1706 = _1704 + 1;
    int _1708 = _1706 + 1;
    int _1710 = _1664 * _1686;
    int _1712 = _1710 + _837;
    bool _1714 = !_1680;
    int _1716 = _1714 ? _1624 : (-1);
    int _1718 = _1700 * _1694;
    int _1720 = _701 + (-1);
    float _1722 = trunc(_1450);
    int _1724 = int(_1722);
    int _1726 = _749 + (-1);
    int _1728 = _1716 * _1708;
    int _1730 = abs(_1672);
    int _1732 = _1616 * _1720;
    int _1734 = _1732 + _1718;
    float _1736 = fma(_1678, _1628, _1696);
    bool _1738 = !_1190;
    int _1740 = _1738 ? 0 : 1;
    int _1742 = _1642 * _1726;
    int _1744 = _1742 + _1728;
    float _1746 = fma(_1650, _1628, _1668);
    int _1748 = _1734 * _868;
    bool _1750 = !_1182;
    int _1752 = _1750 ? 0 : 1;
    float _1754 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1702);
    int _1756 = abs(_1740);
    int _1758 = _1684 * _888;
    int _1760 = _1758 + _1748;
    int _1762 = abs(_1752);
    int _1764 = _1744 * _1730;
    int _1766 = abs(_735);
    float _1768 = _1746 * 0.15915493667125701904296875;
    float _1770 = fma(_1654, _1628, _1754);
    bool _1772 = !_1194;
    int _1774 = _1772 ? 0 : 1;
    int _1776 = _1646 * _1766;
    int _1778 = _1776 + _1760;
    int _1780 = _1724 * _1762;
    int _1782 = _1780 + _1764;
    float _1784 = _1768 * 6.283185482025146484375;
    float _1786 = sin(_1784);
    int _1788 = abs(_1774);
    int _1790 = _1598 * _936;
    int _1792 = _1790 + _1778;
    float _1794 = float(uint(_1712));
    int _1796 = _1712 * _1756;
    int _1798 = _1796 + _1782;
    float _1800 = -_1602;
    float _1802 = _1800 + 1.0;
    float _1804 = fma(_1546, 0.5, 0.5);
    float _1806 = float(uint(_1792));
    float _1808 = _1768 * 6.283185482025146484375;
    float _1810 = cos(_1808);
    float _1812 = as_type<float>(_847) * _1794;
    float _1814 = fma(_1548, 0.5, 0.5);
    float _1816 = _1736 * 0.15915493667125701904296875;
    float _1818 = as_type<float>(_827) * _1806;
    float _1820 = -_1604;
    float _1822 = _1820 + 1.0;
    float _1824 = -_1606;
    float _1826 = _1824 + 1.0;
    int _1828 = ~_701;
    int _1830 = _1828 + 1;
    float _1832 = trunc(_1688);
    float _1834 = precise::max(_1832, 0.0);
    uint _1836 = uint(_1834);
    float _1838 = _1770 * 0.15915493667125701904296875;
    float _1840 = -_1600;
    float _1842 = _1840 + 1.0;
    float _1844 = -_1822;
    float _1846 = fma(_1082, _1844, _1584);
    float _1848 = fma(_1552, _1826, _1634);
    float _1850 = fma(_1536, 0.5, 0.5);
    int _1852 = _1664 * _1788;
    int _1854 = _1852 + _1798;
    float _1856 = -_1842;
    float _1858 = fma(_934, _1856, _1360);
    float _1860 = fma(_1066, _1802, _1396);
    int _1862 = ~_701;
    int _1864 = _1862 + 1;
    float _1866 = trunc(_1812);
    float _1868 = precise::max(_1866, 0.0);
    uint _1870 = uint(_1868);
    float _1872 = float(uint(_1854));
    float _1874 = _1612 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1876 = ~_749;
    int _1878 = _1876 + 1;
    out.m_70.x = _1858;
    out.m_70.y = _1860;
    out.m_70.z = _1846;
    out.m_70.w = _1848;
    int _1880 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1882 = _1880 != 0;
    float _1884 = as_type<float>(_847) * _1872;
    float _1886 = trunc(_1818);
    float _1888 = precise::max(_1886, 0.0);
    uint _1890 = uint(_1888);
    float _1892 = _1564 * _1544;
    float _1894 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _375);
    int _1896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1898 = _1896 != 0;
    int _1900 = _1864 * int(_1836);
    int _1902 = _1900 + _1646;
    float _1904 = _1892 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1906 = !_1882;
    int _1908 = _1906 ? 0 : 1;
    float _1910 = trunc(_1884);
    float _1912 = precise::max(_1910, 0.0);
    uint _1914 = uint(_1912);
    float _1916 = float(uint(_1902));
    int _1918 = _1878 * int(_1870);
    int _1920 = _1918 + _1712;
    float _1922 = _1904 * _1894;
    float _1924 = as_type<float>(_827) * _1916;
    float _1926 = float(uint(_1920));
    float _1928 = floor(_1804);
    int _1930 = _1830 * int(_1890);
    int _1932 = _1930 + _1792;
    float _1934 = float(uint(_1932));
    float _1936 = floor(_1814);
    float _1938 = as_type<float>(_827) * _1934;
    float _1940 = _1816 * 6.283185482025146484375;
    float _1942 = sin(_1940);
    float _1944 = -_1928;
    float _1946 = _1804 + _1944;
    float _1948 = as_type<float>(_847) * _1926;
    float _1950 = _1816 * 6.283185482025146484375;
    float _1952 = cos(_1950);
    float _1954 = -_1936;
    float _1956 = _1814 + _1954;
    float _1958 = fma(_1956, 2.0, -1.0);
    float _1960 = _1838 * 6.283185482025146484375;
    float _1962 = sin(_1960);
    int _1964 = ~_749;
    int _1966 = _1964 + 1;
    float _1968 = _1810 * _1942;
    float _1970 = _1786 * _1942;
    int _1972 = _1966 * int(_1914);
    int _1974 = _1972 + _1854;
    float _1976 = _1838 * 6.283185482025146484375;
    float _1978 = cos(_1976);
    float _1980 = _1810 * _1952;
    float _1982 = float(uint(_1974));
    float _1984 = floor(_1850);
    float _1986 = as_type<float>(_847) * _1982;
    float _1988 = _1958 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _1990 = _1786 * _1952;
    float _1992 = _1988 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _1994 = _1988 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _1996 = trunc(_1948);
    float _1998 = precise::max(_1996, 0.0);
    uint _2000 = uint(_1998);
    float _2002 = _1810 * _1978;
    float _2004 = fma(_1946, 2.0, -1.0);
    float _2006 = _1786 * _1978;
    float _2008 = _1952 * _1978;
    float _2010 = _1942 * _1978;
    float _2012 = trunc(_1924);
    float _2014 = precise::max(_2012, 0.0);
    uint _2016 = uint(_2014);
    float _2018 = -_1984;
    float _2020 = _1850 + _2018;
    float _2022 = _1988 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2024 = -_1968;
    float _2026 = fma(_1962, _1990, _2024);
    float _2028 = -_1990;
    float _2030 = fma(_1962, _1968, _2028);
    float _2032 = fma(_1962, _1980, _1970);
    float _2034 = fma(_1962, _1970, _1980);
    float _2036 = _2006 * _1922;
    float _2038 = trunc(_1938);
    float _2040 = precise::max(_2038, 0.0);
    uint _2042 = uint(_2040);
    float _2044 = trunc(_1986);
    float _2046 = precise::max(_2044, 0.0);
    uint _2048 = uint(_2046);
    float _2050 = _2004 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _2052 = int(_1836) + int(_2016);
    float _2054 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2056 = ~_701;
    int _2058 = _2056 + 1;
    float _2060 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2022);
    int _2062 = int(_1870) + int(_2000);
    float _2064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _353);
    float _2066 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].x, _1992);
    int _2068 = int(_1890) + int(_2042);
    float _2070 = fma(_2050, (*spvDescriptorSet0.vp_c12)._m0[2].z, _1994);
    float _2072 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2074 = ~_749;
    int _2076 = _2074 + 1;
    float _2078 = _1874 * _2064;
    float _2080 = -_1922;
    float _2082 = _1962 * _2080;
    float _2084 = -_1962;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2054);
    int _2088 = int(_1914) + int(_2048);
    float _2090 = _2002 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2092 = _2002 * _1922;
    int _2094 = _2058 * _2068;
    int _2096 = _2094 + _1792;
    float _2098 = -_1962;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2072);
    float _2102 = -_1962;
    float _2104 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2090);
    float _2106 = fma(_2026, _2078, _2036);
    bool _2108 = uint(_2096) >= uint(_701);
    float _2110 = fma(_2008, _2078, _2082);
    float _2112 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2114 = _2076 * _2088;
    int _2116 = _2114 + _1854;
    bool _2118 = !_2108;
    int _2120 = _2118 ? 0 : (-1);
    float _2122 = fma(_2032, _2078, _2092);
    float _2124 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2104);
    float _2126 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2086);
    bool _2128 = uint(_2116) >= uint(_749);
    float _2130 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2100);
    int _2132 = ~_2068;
    int _2134 = _2132 + _2120;
    int _2136 = _2134 + 1;
    float _2138 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2140 = !_2128;
    int _2142 = _2140 ? 0 : (-1);
    float _2144 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2146 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2112);
    int _2148 = _701 * _2136;
    int _2150 = _2148 + _1792;
    float _2152 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2138);
    int _2154 = ~_2088;
    int _2156 = _2154 + _2142;
    int _2158 = _2156 + 1;
    float _2160 = fma(_2010, _2144, _2110);
    float _2162 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2164 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2166 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2168 = !_1676;
    int _2170 = _2168 ? _2150 : (-1);
    float _2172 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2162);
    float _2174 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2164);
    float _2176 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2166);
    float _2178 = fma(_2030, _2144, _2122);
    float _2180 = fma(_2034, _2144, _2106);
    int _2182 = _2170 & 3;
    bool _2184 = _2182 != 0;
    int _2186 = _749 * _2158;
    int _2188 = _2186 + _1854;
    int _2190 = _2170 >> 31;
    float _2192 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2194 = uint(_2182) > 1u;
    float _2196 = _353 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2198 = _2190 & 3;
    float _2200 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2192);
    bool _2202 = !_1680;
    int _2204 = _2202 ? _2188 : (-1);
    float _2206 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2174);
    int _2208 = ~_701;
    int _2210 = _2208 + 1;
    float _2212 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2176);
    int _2214 = _2170 & 3;
    bool _2216 = _2214 != 0;
    int _2218 = _2170 + _2198;
    int _2220 = _2210 * _2052;
    int _2222 = _2220 + _1646;
    int _2224 = _2204 >> 31;
    int _2226 = _2216 ? 0 : 1;
    int _2228 = ~_749;
    int _2230 = _2228 + 1;
    int _2232 = _2224 & 3;
    int _2234 = ~_2226;
    int _2236 = _2234 + 1;
    int _2238 = _2236 + 1;
    int _2240 = _2230 * _2062;
    int _2242 = _2240 + _1712;
    bool _2244 = uint(_2222) >= uint(_701);
    float _2246 = _375 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2248 = _2238;
    float _2250 = _2004;
    float _2252 = _1958;
    float _2254 = _2180;
    if (!_2194)
    {
        int _2256 = ~_2226;
        int _2258 = _2256 + 1;
        _2248 = _2258;
    }
    int _2260 = _2248;
    int _2262 = _2204 + _2232;
    float _2264 = _2246 * _2124;
    bool _2266 = uint(_2182) >= 2u;
    int _2268 = _2218 >> 2;
    int _2270 = _2262 >> 2;
    int _2272 = _2266 ? 0 : 1;
    int _2274 = _2268 << 4;
    int _2276 = _2274 + 368;
    float _2278 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2146);
    bool _2280 = uint(_2242) >= uint(_749);
    float _2282 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2152);
    int _2284 = _2270 << 4;
    int _2286 = _2284 + 512;
    uint _2288 = uint(int(uint(_2276) >> uint(2)));
    uint _2290 = uint(int(uint(int(_2288)) >> uint(2)));
    int _2292 = int(_2288) & 3;
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[int(_2290)][_2292];
    int _2296 = int(_2288) + 1;
    uint _2298 = uint(int(uint(_2296) >> uint(2)));
    int _2300 = _2296 & 3;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[int(_2298)][_2300];
    bool _2304 = !_2244;
    int _2306 = _2304 ? 0 : (-1);
    float _2308 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2200);
    bool _2310 = _2182 != 3;
    float _2312 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2172);
    int _2314 = ~_2052;
    int _2316 = _2314 + _2306;
    int _2318 = _2316 + 1;
    float _2320 = _2246 * _2126;
    bool _2322 = !_2280;
    int _2324 = _2322 ? 0 : (-1);
    uint _2326 = uint(int(uint(_2286) >> uint(2)));
    uint _2328 = uint(int(uint(int(_2326)) >> uint(2)));
    int _2330 = int(_2326) & 3;
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[int(_2328)][_2330];
    int _2334 = int(_2326) + 1;
    uint _2336 = uint(int(uint(_2334) >> uint(2)));
    int _2338 = _2334 & 3;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[int(_2336)][_2338];
    int _2342 = ~_2272;
    int _2344 = _2342 + 1;
    int _2346 = _2344 + 1;
    float _2348 = fma(_2196, _2278, _2264);
    int _2350 = ~_2062;
    int _2352 = _2350 + _2324;
    int _2354 = _2352 + 1;
    out.m_72.x = _2278;
    out.m_72.y = _2282;
    out.m_72.z = _2308;
    float _2356 = fma(_2196, _2282, _2320);
    bool _2358 = !_2184;
    int _2360 = _2358 ? 0 : 1;
    int _2362 = _701 * _2318;
    int _2364 = _2362 + _1646;
    int _2366 = _2276 + 8;
    uint _2368 = uint(int(uint(_2366) >> uint(2)));
    uint _2370 = uint(int(uint(int(_2368)) >> uint(2)));
    int _2372 = int(_2368) & 3;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[int(_2370)][_2372];
    int _2376 = int(_2368) + 1;
    uint _2378 = uint(int(uint(_2376) >> uint(2)));
    int _2380 = _2376 & 3;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[int(_2378)][_2380];
    int _2384 = _2346;
    if (_2310)
    {
        int _2386 = ~_2272;
        int _2388 = _2386 + 1;
        _2384 = _2388;
    }
    int _2390 = _2384;
    int _2392 = _749 * _2354;
    int _2394 = _2392 + _1712;
    int _2396 = _2204 & 3;
    bool _2398 = _2396 != 0;
    float _2400 = _2246 * _2130;
    int _2402 = _2204 & 3;
    bool _2404 = _2402 != 0;
    bool _2406 = uint(_2396) > 1u;
    int _2408 = _2286 + 8;
    uint _2410 = uint(int(uint(_2408) >> uint(2)));
    uint _2412 = uint(int(uint(int(_2410)) >> uint(2)));
    int _2414 = int(_2410) & 3;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[int(_2412)][_2414];
    int _2418 = int(_2410) + 1;
    uint _2420 = uint(int(uint(_2418) >> uint(2)));
    int _2422 = _2418 & 3;
    float _2424 = (*spvDescriptorSet0.vp_c9)._m0[int(_2420)][_2422];
    int _2426 = _2404 ? 0 : 1;
    float _2428 = fma(_2196, _2308, _2400);
    bool _2430 = !_2398;
    int _2432 = _2430 ? 0 : 1;
    int _2434 = ~_2426;
    int _2436 = _2434 + 1;
    int _2438 = _2436 + 1;
    float _2440 = _2212 + _2428;
    bool _2442 = uint(_2396) >= 2u;
    int _2444 = abs(_2260);
    int _2446 = abs(_2360);
    int _2448 = _2438;
    if (!_2406)
    {
        int _2450 = ~_2426;
        int _2452 = _2450 + 1;
        _2448 = _2452;
    }
    int _2454 = _2448;
    bool _2456 = _2396 != 3;
    int _2458 = _2442 ? 0 : 1;
    int _2460 = abs(_2454);
    bool _2462 = _2396 != 3;
    int _2464 = abs(_2432);
    int _2466 = ~_2444;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    int _2472 = abs(_2390);
    int _2474 = _2470 * as_type<int>(_2302);
    int _2476 = ~_2460;
    int _2478 = _2476 + 1;
    int _2480 = _2478 + 1;
    int _2482 = ~_2446;
    int _2484 = _2482 + 1;
    int _2486 = _2484 + 1;
    int _2488 = _2480 * as_type<int>(_2340);
    int _2490 = ~_2464;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    int _2496 = _2486 * as_type<int>(_2294);
    int _2498 = _2496 + _2474;
    bool _2500 = _2182 != 3;
    float _2502 = fma(_2246, _2246, 1.0);
    int _2504 = ~_2458;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    int _2510 = _2494 * as_type<int>(_2332);
    int _2512 = _2510 + _2488;
    int _2514 = ~_2472;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    int _2520 = _2508;
    if (_2456)
    {
        int _2522 = ~_2458;
        int _2524 = _2522 + 1;
        _2520 = _2524;
    }
    int _2526 = _2520;
    float _2528 = rsqrt(_2502);
    bool _2530 = !_2500;
    int _2532 = _2530 ? 0 : (-1);
    int _2534 = _2518 * as_type<int>(_2374);
    int _2536 = _2534 + _2498;
    int _2538 = abs(_2526);
    int _2540 = abs(_1908);
    bool _2542 = !_1898;
    int _2544 = _2542 ? 0 : 1;
    int _2546 = abs(_2532);
    bool _2548 = !_2462;
    int _2550 = _2548 ? 0 : (-1);
    int _2552 = abs(_2544);
    float _2554 = _2246 * _2528;
    int _2556 = abs(_2550);
    int _2558 = ~_2538;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    int _2564 = ~_2546;
    int _2566 = _2564 + 1;
    int _2568 = _2566 + 1;
    int _2570 = _2562 * as_type<int>(_2416);
    int _2572 = _2570 + _2512;
    int _2574 = _2568 * as_type<int>(_2382);
    int _2576 = _2574 + _2536;
    int _2578 = ~_2556;
    int _2580 = _2578 + 1;
    int _2582 = _2580 + 1;
    float _2584 = fma(_2020, 2.0, -1.0);
    int _2586 = ~_2552;
    int _2588 = _2586 + 1;
    int _2590 = _2588 + 1;
    int _2592 = ~_2540;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    int _2598 = _2582 * as_type<int>(_2424);
    int _2600 = _2598 + _2572;
    float _2602 = -_2312;
    float _2604 = _2554 * _2602;
    float _2606 = -_2212;
    float _2608 = _2554 * _2606;
    bool _2610 = !_1676;
    int _2612 = _2610 ? _2364 : (-1);
    int _2614 = _2600 * _2590;
    float _2616 = -_2206;
    float _2618 = _2554 * _2616;
    int _2620 = _2576 * _2596;
    float _2622 = fma(_2528, _2124, _2604);
    float _2624 = fma(_2528, _2130, _2608);
    float _2626 = fma(_2528, _2126, _2618);
    float _2628 = _2312 + _2348;
    float _2630 = _2206 + _2356;
    bool _2632 = !_1680;
    int _2634 = _2632 ? _2394 : (-1);
    int _2636 = _2612 * _2540;
    int _2638 = _2636 + _2620;
    out.m_74.x = _2622;
    out.m_74.y = _2626;
    out.m_74.z = _2624;
    float _2640 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2642 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2644 = _2634 * _2552;
    int _2646 = _2644 + _2614;
    out.m_76.x = _2628;
    out.m_76.y = _2630;
    out.m_76.z = _2440;
    float _2648 = _2178 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2650 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _2652 = isnan(1.0);
    bool _2654 = _2650 || _2652;
    bool _2656 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2658 = _2654 || _2656;
    float _2660 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2640);
    float _2662 = _2584 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2664 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2648);
    float _2666 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2642);
    float _2668 = float(_2638);
    float _2670 = fma(_2662, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2066);
    float _2672 = float(_2646);
    float _2674 = fma(_2662, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2060);
    float _2676 = fma(_2662, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2070);
    float _2678 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2664);
    float _2680 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2660);
    float _2682 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2666);
    out.m_78.x = _2668;
    out.m_78.y = _2672;
    float _2684 = _2670 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2686 = _2674 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2688 = _2676 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2690 = _2680 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2692 = _2682 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2694 = _2690 + _2686;
    float _2696 = _2692 + _2688;
    float _2698 = _2678 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2700 = _2698 + _2684;
    float _2702 = _2624;
    float _2704 = _2626;
    float _2706 = _2622;
    float _2708 = _2678;
    float _2710 = _2626;
    float _2712 = _2624;
    float _2714 = _2698;
    float _2716 = _2622;
    float _2718 = _2678;
    float _2720 = _2672;
    float _2722 = _2670;
    float _2732;
    float _2734;
    float _2736;
    float _2738;
    if (!_2658)
    {
        bool _2724 = _2686 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2726 = !_2724;
        _2728 = _2726;
        if (!_2728)
        {
            float _2730 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _2732 = _2730;
            _2734 = 0.0;
            _2736 = 0.0;
            _2738 = 0.0;
            _2740 = true;
        }
    }
    if ((!_2740) || _2728)
    {
        bool _2776;
        if (!_2728)
        {
            bool _2742 = _2686 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2744 = isnan(_2686);
            bool _2746 = _2742 || _2744;
            bool _2748 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2750 = _2746 || _2748;
            bool _2752 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2754 = !_2750;
            bool _2756 = _2752 && _2754;
            bool _2758 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            _2714 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2756)
            {
                _2702 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2760 = _2702;
            float _2762 = _2760;
            if (_2756)
            {
                _2704 = 0.0;
                _2706 = 0.0;
            }
            float _2764 = _2704;
            float _2766 = _2706;
            _2710 = _2764;
            _2716 = _2766;
            _2734 = _2766;
            _2736 = _2764;
            if (_2756)
            {
                _2708 = 0.0;
            }
            float _2768 = _2708;
            _2718 = _2768;
            _2738 = _2768;
            if (_2756)
            {
                float _2770 = _2760 * 5.0;
                _2762 = _2770;
            }
            float _2772 = _2762;
            bool _2774 = !_2750;
            _2776 = _2774 && _2758;
            _2712 = _2772;
            _2732 = _2772;
        }
        if ((!_2776) || _2728)
        {
            _2728 = false;
            float _2778 = _2710;
            float _2780 = _2712;
            float _2782 = _2714;
            float _2784 = _2716;
            float _2786 = _2718;
            bool _2788 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2790 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2792 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2794 = _2778;
            float _2796 = _2784;
            float _2798 = _2782;
            float _2800 = _2786;
            if (_2788)
            {
                float _2802 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2794 = _2802;
            }
            float _2804 = _2794;
            if (_2788)
            {
                float _2806 = abs(_2004);
                float _2808 = -_2806;
                float _2810 = _2808 + 1.0;
                _2250 = _2810;
            }
            float _2812 = _2250;
            if (_2790)
            {
                float _2814 = abs(_1958);
                float _2816 = -_2814;
                float _2818 = _2816 + 1.0;
                _2252 = _2818;
            }
            float _2820 = _2252;
            if (!_2788)
            {
                _2720 = 1.0;
            }
            float _2822 = _2720;
            float _2824 = _2822;
            if (_2792)
            {
                float _2826 = abs(_2584);
                float _2828 = -_2826;
                float _2830 = _2828 + 1.0;
                _2796 = _2830;
            }
            float _2832 = _2796;
            if (!_2790)
            {
                _2798 = 1.0;
            }
            float _2834 = _2798;
            float _2836 = _2834;
            if (!_2792)
            {
                _2800 = 1.0;
            }
            float _2838 = _2800;
            float _2840 = _2780;
            float _2842 = _2838;
            if (_2790)
            {
                float _2844 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2840 = _2844;
            }
            float _2846 = _2840;
            float _2848 = _2692;
            if (_2792)
            {
                float _2850 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2848 = _2850;
            }
            float _2852 = _2848;
            if (_2788)
            {
                float _2854 = _2812 * _2804;
                float _2856 = precise::clamp(_2854, 0.0, 1.0);
                _2824 = _2856;
            }
            float _2858 = _2824;
            _2736 = _2694;
            if (_2790)
            {
                float _2860 = _2820 * _2846;
                float _2862 = precise::clamp(_2860, 0.0, 1.0);
                _2836 = _2862;
            }
            float _2864 = _2836;
            float _2866 = _2858 * _2864;
            _2732 = _2696;
            if (_2792)
            {
                float _2868 = _2832 * _2852;
                float _2870 = precise::clamp(_2868, 0.0, 1.0);
                _2842 = _2870;
            }
            float _2872 = _2842;
            float _2874 = _2866 * _2872;
            _2734 = _2700;
            _2738 = _2874;
        }
    }
    _2740 = false;
    float _2876 = _2732;
    float _2878 = _2734;
    float _2880 = _2736;
    float _2882 = _2738;
    float _2884 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2886 = _2876 + _2884;
    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2890 = _2878 + _2888;
    float _2892 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2894 = _2886 * _2886;
    bool _2896 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2898 = isnan(0.5);
    bool _2900 = _2896 || _2898;
    bool _2902 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2904 = _2900 || _2902;
    float _2906 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2892);
    float _2908 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2910 = fma(_2890, _2890, _2894);
    bool _2912 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2914 = isnan(0.5);
    bool _2916 = _2912 || _2914;
    bool _2918 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2920 = _2916 || _2918;
    float _2922 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2906);
    float _2924 = sqrt(_2910);
    float _2926 = _2922 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2928 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2908);
    float _2930 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2928);
    float _2932 = 1.0 / _2926;
    float _2934 = _2930 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2936 = _2934 + _2926;
    bool _2938 = _2924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2940 = _2936 * _2932;
    float _2942 = _2940 * 0.5;
    bool _2944 = !_2938;
    float _2946 = _2878;
    float _2948 = _2880;
    float _2950 = _2876;
    float _2952 = _2890;
    float _2954 = _2910;
    if (!_2944)
    {
        float _2956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2958 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2960 = _2924 + _2958;
        float _2962 = _2880 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2964 = rsqrt(_2910);
        float _2966 = _2960 * _2956;
        float _2968 = _2966 * 0.15915493667125701904296875;
        float _2970 = _2968 * 6.283185482025146484375;
        float _2972 = cos(_2970);
        float _2974 = _2968 * 6.283185482025146484375;
        float _2976 = sin(_2974);
        float _2978 = _2972 + (-1.0);
        float _2980 = fma(_2976, _2962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2982 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2984 = _2964 * _2980;
        float _2986 = fma(_2972, _2880, _2982);
        float _2988 = fma(_2890, _2984, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2990 = fma(_2886, _2984, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2946 = _2988;
        _2948 = _2986;
        _2950 = _2990;
    }
    float _2992 = _2946;
    float _2994 = _2948;
    float _2996 = _2950;
    float _2998 = _2994;
    float _3000 = _2992;
    float _3002 = _2996;
    if (_2920)
    {
        _2722 = 1.0;
    }
    float _3004 = _2722;
    float _3006 = _3004;
    if (!_2904)
    {
        float _3008 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3010 = _2686 + _3008;
        float _3012 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3014 = _2684 + _3012;
        float _3016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3018 = -_2684;
        float _3020 = _3018 + _2992;
        float _3022 = _3010 * _3010;
        float _3024 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3026 = _2688 + _3024;
        float _3028 = fma(_3014, _3014, _3022);
        float _3030 = fma(_3026, _3026, _3028);
        float _3032 = sqrt(_3030);
        float _3034 = precise::min(_3032, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3036 = _3034 * _3016;
        float _3038 = -_2686;
        float _3040 = _3038 + _2994;
        float _3042 = -_2688;
        float _3044 = _3042 + _2996;
        float _3046 = fma(_3020, _3036, _2684);
        float _3048 = fma(_3040, _3036, _2686);
        float _3050 = fma(_3044, _3036, _2688);
        _2998 = _3048;
        _3000 = _3046;
        _3002 = _3050;
    }
    float _3052 = _2998;
    float _3054 = _3000;
    float _3056 = _3002;
    if (!_2920)
    {
        float _3058 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3060 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3058);
        float _3062 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3064 = _3062 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _3066 = 1.0 / _3060;
        float _3068 = 1.0 / _3064;
        float _3070 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3072 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3074 = fma(_3066, _3070, _3072);
        float _3076 = _3074 * _3068;
        float _3078 = precise::clamp(_3076, 0.0, 1.0);
        _3006 = _3078;
    }
    float _3080 = _3006;
    float _3082 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3084 = _3052 + _3082;
    float _3086 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3088 = _3054 + _3086;
    float _3090 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3092 = _3056 + _3090;
    float _3094 = _3084 * _3084;
    float _3096 = fma(_3088, _3088, _3094);
    float _3098 = fma(_3092, _3092, _3096);
    float _3100 = rsqrt(_3098);
    float _3102 = sqrt(_3098);
    float _3104 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3106 = _3088 * _3104;
    float _3108 = _3092 * _3104;
    float _3110 = _3106 * _3106;
    float _3112 = _3108 * _3108;
    float _3114 = _3110 + _3112;
    float _3116 = sqrt(_3114);
    bool _3118 = _3116 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3120 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3122 = _3116 + _3120;
    float _3124 = _3100;
    float _3126 = _3114;
    float _3128 = _3122;
    float _3130 = _3084;
    if (_3118)
    {
        float _3132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3124 = _3132;
    }
    float _3134 = _3124;
    if (_3118)
    {
        float _3136 = rsqrt(_3114);
        _3126 = _3136;
    }
    float _3138 = _3126;
    float _3140 = _3138;
    if (_3118)
    {
        float _3142 = _3122 * _3134;
        _3128 = _3142;
    }
    float _3144 = _3128;
    if (_3118)
    {
        float _3146 = _3144 * 0.15915493667125701904296875;
        _2952 = _3146;
    }
    float _3148 = _2952;
    float _3150 = _3092;
    if (_3118)
    {
        float _3152 = _3148 * 6.283185482025146484375;
        float _3154 = sin(_3152);
        _3150 = _3154;
    }
    float _3156 = _3150;
    float _3158 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3160 = precise::max(0.0, _3158);
    float _3162 = _3134;
    float _3164 = _3160;
    if (_3118)
    {
        float _3166 = _3148 * 6.283185482025146484375;
        float _3168 = cos(_3166);
        _3162 = _3168;
    }
    float _3170 = _3162;
    float _3172 = -_3104;
    float _3174 = -_3160;
    float _3176 = fma(_3084, _3172, _3174);
    if (_3118)
    {
        float _3178 = _3176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3130 = _3178;
    }
    float _3180 = _3130;
    float _3182 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3184 = _3180;
    float _3186 = _3156;
    if (_3118)
    {
        float _3188 = fma(_3156, _3180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3184 = _3188;
    }
    float _3190 = _3184;
    float _3192 = _3190;
    if (!_3118)
    {
        _3186 = _3106;
    }
    float _3194 = _3186;
    float _3196 = _3194;
    float _3198 = _3170;
    if (_3118)
    {
        float _3200 = _3170 + (-1.0);
        _3164 = _3200;
    }
    float _3202 = _3164;
    float _3204 = _3202;
    if (_3118)
    {
        float _3206 = _3138 * _3190;
        _2254 = _3206;
    }
    float _3208 = _2254;
    if (!_3118)
    {
        _3192 = _3176;
    }
    float _3210 = _3192;
    float _3212 = _3210;
    if (_3118)
    {
        float _3214 = _3202 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2954 = _3214;
    }
    float _3216 = _2954;
    if (_3118)
    {
        float _3218 = _3106 * _3208;
        _3196 = _3218;
    }
    float _3220 = _3196;
    if (!_3118)
    {
        _3204 = _3108;
    }
    float _3222 = _3204;
    float _3224 = _3222;
    if (_3118)
    {
        float _3226 = _3108 * _3208;
        _3224 = _3226;
    }
    float _3228 = _3224;
    if (!_3118)
    {
        _3140 = _3110;
    }
    float _3230 = _3140;
    float _3232 = _3230;
    if (_3118)
    {
        float _3234 = fma(_3176, _3170, _3216);
        _3212 = _3234;
    }
    float _3236 = _3212;
    if (_3118)
    {
        float _3238 = _3220 * _3220;
        _3232 = _3238;
    }
    float _3240 = _3232;
    if (!_3118)
    {
        _3198 = _3112;
    }
    float _3242 = _3198;
    float _3244 = _3242;
    if (_3118)
    {
        float _3246 = _3228 * _3228;
        _3244 = _3246;
    }
    float _3248 = _3244;
    float _3250 = fma(_3236, _3236, _3240);
    float _3252 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3254 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3256 = _3250 + _3248;
    float _3258 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3182);
    float _3260 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3262 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3264 = fma(_3102, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3262);
    float _3266 = precise::clamp(_3264, 0.0, 1.0);
    float _3268 = rsqrt(_3256);
    float _3270 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3258);
    float _3272 = _3052 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3274 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3260);
    float _3276 = -_3266;
    float _3278 = _3276 + 1.0;
    float _3280 = _3270 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3282 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3272);
    float _3284 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3274);
    float _3286 = fma(_3054, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3252);
    float _3288 = _3280 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3290 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3282);
    float _3292 = _3284 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3294 = abs(_3278);
    float _3296 = log2(_3294);
    float _3298 = -_3288;
    float _3300 = fma(_3298, _3254, 1.0);
    float _3302 = _3290 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3304 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3306 = _3268 * _3220;
    float _3308 = _3268 * _3236;
    float _3310 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3286);
    float _3312 = fma(_3302, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3304);
    float _3314 = _3306 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3316 = _3268 * _3228;
    float _3318 = _3310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3320 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3312);
    float _3322 = -_3314;
    float _3324 = fma(_3308, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3322);
    float _3326 = log2(_3300);
    float _3328 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3330 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3320);
    float _3332 = -_3316;
    float _3334 = fma(_3332, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3324);
    float _3336 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3338 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3340 = fma(_3302, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3328);
    float _3342 = fma(_3334, -0.5, 0.5);
    float _3344 = 1.0 / _3330;
    float _3346 = fma(_3302, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3338);
    float _3348 = fma(_3334, 0.5, 0.5);
    float _3350 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3340);
    float _3352 = _3308 + 1.0;
    float _3354 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3346);
    float _3356 = fma(_3348, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3358 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3350);
    float _3360 = exp2(_3336);
    float _3362 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3354);
    float _3364 = fma(_3348, _3356, -0.212114393711090087890625);
    float _3366 = _3326 * 0.693147182464599609375;
    float _3368 = fma(_3348, _3364, 1.570728778839111328125);
    float _3370 = _3366 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3372 = sqrt(_3342);
    float _3374 = _3362 * _3344;
    float _3376 = fma(_3374, 0.5, 0.5);
    float _3378 = -_3308;
    float _3380 = fma(_3360, _3352, _3378);
    float _3382 = _3358 * _3344;
    float _3384 = fma(_3380, 0.5, 0.5);
    float _3386 = fma(_3382, -0.5, 0.5);
    float _3388 = _3372 * 0.636619746685028076171875;
    float3 _9067 = float3(_3376, _3386, _3370);
    float _3390 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9067, float3(0.0), isnan(_9067)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9067, float3(0.0), isnan(_9067)), level(0.0)).x;
    float3 _9078 = float3(_3376, _3386, _3370);
    float4 _3393 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9078, float3(0.0), isnan(_9078)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9078, float3(0.0), isnan(_9078)), level(0.0)).xyzw;
    float _3395 = _3393.x;
    float _3397 = _3393.y;
    float _3399 = _3393.z;
    float _3401 = _3393.w;
    float _3403 = -_3368;
    float _3405 = fma(_3388, _3403, 1.0);
    float2 _9100 = float2(_3405, _3384);
    float3 _3409 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9100, float2(0.0), isnan(_9100)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9100, float2(0.0), isnan(_9100)), level(0.0)).xyz;
    float _3411 = _3409.x;
    float _3413 = _3409.y;
    float _3415 = _3409.z;
    float _3417 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3419 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3421 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    out.m_80.y = 1.0;
    float _3423 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3417);
    float _3425 = _2686 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3427 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3419);
    float _3429 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3421);
    float _3431 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3423);
    float _3433 = fma(_2684, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3425);
    float _3435 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3427);
    float _3437 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3429);
    float _3439 = _3431 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3441 = fma(_2688, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3433);
    float _3443 = _3435 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3445 = -_633;
    float _3447 = _3445 + _3052;
    float _3449 = -_631;
    float _3451 = _3449 + _3054;
    float _3453 = -_635;
    float _3455 = _3453 + _3056;
    float _3457 = _3292 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3459 = _3447 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3461 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3463 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3465 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3467 = fma(_3451, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3459);
    float _3469 = _3439 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3471 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3461);
    float _3473 = _3437 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3475 = fma(_3455, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3467);
    float _3477 = fma(_3302, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3457);
    float _3479 = _3447 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _3481 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3463);
    float _3483 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3469);
    float _3485 = fma(_3443, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3465);
    float _3487 = _3447 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3489 = fma(_3451, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3479);
    float _3491 = _3473 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3493 = fma(_3280, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3477);
    float _3495 = fma(_3451, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3487);
    float _3497 = _3441 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3499 = _3491 + _3485;
    float _3501 = _3296 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3503 = _3475 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3505 = fma(_3473, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3483);
    float _3507 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3499);
    float _3509 = exp2(_3501);
    float _3511 = fma(_3455, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3489);
    float _3513 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3505);
    float _3515 = _3473 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3517 = _3473 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3519 = _3511 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3521 = fma(_3318, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3493);
    float _3523 = _3515 + _3471;
    float _3525 = 1.0 / _3507;
    float _3527 = fma(_3455, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3495);
    float _3529 = _3362 + _3330;
    float _3531 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3523);
    out.gl_Position.x = _3362;
    out.gl_Position.y = _3358;
    out.gl_Position.z = _3521;
    out.gl_Position.w = _3330;
    float _3533 = _3330 * 0.5;
    float _3535 = _3529 * 0.5;
    float _3537 = 1.0 / _3503;
    float _3539 = -_3509;
    float _3541 = _3539 + 1.0;
    float _3543 = fma(_3358, -0.5, _3533);
    out.m_82.x = _3054;
    out.m_82.y = _3052;
    out.m_82.z = _3056;
    float _3545 = _3527 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3547 = _3541 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3549 = _3513 * _3525;
    float _3551 = _3521 + _3330;
    float _3553 = _3531 * _3525;
    bool _3555 = _3549 > 0.0;
    float _3557 = _3551 * 0.5;
    float _3559 = _3519 * _3537;
    float _3561 = _3517 + _3481;
    bool _3563 = _3549 < 1.0;
    bool _3565 = _3563 && _3555;
    out.m_84.x = _3535;
    out.m_84.y = _3543;
    out.m_84.z = _3557;
    out.m_84.w = _3330;
    float _3567 = _3545 * _3537;
    float _3569 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3561);
    bool _3571 = _3374 > (-1.0);
    bool _3573 = _3571 && _3565;
    bool _3575 = _3382 > (-1.0);
    bool _3577 = _3575 && _3573;
    bool _3579 = _3374 < 1.0;
    bool _3581 = _3579 && _3577;
    bool _3583 = _3382 < 1.0;
    bool _3585 = _3583 && _3581;
    float _3587 = _3547 * _3390;
    float _3589 = _3569 * _3525;
    float _3591 = _3401 * _3587;
    float _3593 = _3415 * _3587;
    float _3595 = -_3547;
    float _3597 = _3595 + 1.0;
    float _3599 = fma(_3411, _3591, _3395);
    float _3601 = fma(_3413, _3591, _3397);
    float _3603 = fma(_3401, _3593, _3399);
    float _3605 = _3401 * _3597;
    out.m_86.x = _3599;
    out.m_86.y = _3601;
    out.m_86.z = _3603;
    out.m_86.w = _3605;
    bool _3607 = !_3585;
    float _3609 = _3491;
    float _3611 = _3497;
    float _3613 = _3597;
    float _3645;
    float _3647;
    float _3649;
    float _3657;
    if (!_3607)
    {
        float _3615 = -_3589;
        float _3617 = _3382 + _3615;
        float _3619 = -_3553;
        float _3621 = _3374 + _3619;
        float _3623 = _2882 * _3080;
        float _3625 = -_3559;
        float _3627 = _3374 + _3625;
        float _3629 = _3617 * _3617;
        float _3631 = -_3567;
        float _3633 = _3382 + _3631;
        float _3635 = _3623 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _3637 = fma(_3621, _3621, _3629);
        float _3639 = sqrt(_3637);
        bool _3641 = _3639 > 0.0;
        float _3643 = _3623;
        _3645 = _3621;
        _3647 = _3637;
        _3649 = _3639;
        if (!_3641)
        {
            _3643 = _3635;
        }
        float _3651 = _3643;
        bool _3653 = !_3641;
        float _3655 = _3651;
        _3657 = _3651;
        _3659 = _3653;
        if (!_3659)
        {
            float _3661 = _3633 * _3633;
            float _3663 = fma(_3627, _3627, _3661);
            float _3665 = rsqrt(_3637);
            float _3667 = sqrt(_3663);
            float _3669 = _3621 * _3665;
            float _3671 = _3617 * _3665;
            bool _3673 = _3667 > 0.0;
            _3613 = _3667;
            _3649 = _3665;
            if (!_3673)
            {
                _3655 = _3635;
            }
            float _3675 = _3655;
            bool _3677 = !_3673;
            _3657 = _3675;
            _3659 = _3677;
            if (!_3659)
            {
                float _3679 = _1874 * _3497;
                float _3681 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _3683 = fma(_3679, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3491);
                float _3685 = fma(_3679, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3517);
                float _3687 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3683);
                float _3689 = fma(_3679, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3515);
                float _3691 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3685);
                float _3693 = fma(_3497, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3689);
                float _3695 = 1.0 / _3687;
                float _3697 = _3681 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _3699 = _3633 * _3697;
                float _3701 = _3627 * _3697;
                float _3703 = rsqrt(_3663);
                float _3705 = _3699 * _3699;
                float _3707 = fma(_3701, _3701, _3705);
                float _3709 = _3691 * _3695;
                float _3711 = _3693 * _3695;
                float _3713 = _3709 * _3709;
                float _3715 = sqrt(_3707);
                float _3717 = fma(_3711, _3711, _3713);
                float _3719 = _3633 * _3703;
                float _3721 = _3627 * _3703;
                float _3723 = sqrt(_3717);
                float _3725 = _3671 * _3719;
                float _3727 = fma(_3669, _3721, _3725);
                float _3729 = precise::min(0.0, _3727);
                float _3731 = _3330 * _3729;
                float _3733 = fma(_3715, (*spvDescriptorSet0.vp_c13)._m0[1].x, _3723);
                float _3735 = fma(_3701, _3731, _3362);
                float _3737 = fma(_3699, _3731, _3358);
                float _3739 = 1.0 / _3733;
                out.gl_Position.x = _3735;
                out.gl_Position.y = _3737;
                float _3741 = _3723 * _3739;
                out.m_80.y = _3741;
                _3645 = _3731;
                _3609 = _3715;
                _3657 = _3635;
                _3611 = _3741;
                _3647 = _3701;
                _3613 = _3699;
                _3649 = _3727;
                _3659 = true;
            }
        }
    }
    else
    {
        float _3743 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _3743;
        _3645 = 0.0;
        _3657 = 0.0;
        _3647 = 0.0;
        _3613 = _3743;
        _3649 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    _3659 = false;
    float _3745 = _3645;
    float _3747 = _3609;
    float _3749 = _3657;
    float _3751 = _3611;
    float _3753 = _3647;
    float _3755 = _3613;
    float _3757 = _3649;
    bool _3759 = _3102 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3761 = isnan(_3102);
    bool _3763 = _3759 || _3761;
    bool _3765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3767 = _3763 || _3765;
    float _3769 = _3751;
    float _3771 = _3747;
    float _3773 = _3755;
    float _3775 = _3753;
    float _3777 = _3745;
    float _3779 = _3757;
    if (!_3767)
    {
        _3769 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3781 = _3769;
    float _3783 = _3781;
    float _3785 = _3781;
    if (!_3767)
    {
        _3771 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3787 = _3771;
    float _3789 = _3787;
    float _3791 = _3787;
    if (!_3767)
    {
        _3773 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3793 = _3773;
    float _3795 = _3793;
    float _3797 = _3793;
    if (!_3767)
    {
        _3775 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3799 = _3775;
    float _3801 = _3799;
    float _3803 = _3799;
    if (!_3767)
    {
        _3777 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3805 = _3777;
    float _3807 = _3805;
    float _3809 = _3805;
    if (!_3767)
    {
        _3779 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3811 = _3779;
    bool _3813 = !_3767;
    float _3815 = _3811;
    float _3817 = _3811;
    if (!_3813)
    {
        bool _3819 = _3102 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3821 = isnan(_3102);
        bool _3823 = _3819 || _3821;
        bool _3825 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3827 = _3823 || _3825;
        if (!_3827)
        {
            float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3831 = _3102 + _3829;
            float _3833 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3835 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3833;
            float _3837 = 1.0 / _3835;
            float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3841 = _3839 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3851 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3853 = _3851 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3857 = _3855 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3859 = _3831 * _3837;
            float _3861 = precise::clamp(_3859, 0.0, 1.0);
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3867 = fma(_3861, _3841, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3869 = fma(_3861, _3865, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3871 = fma(_3861, _3845, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3873 = fma(_3861, _3849, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3875 = fma(_3861, _3853, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3877 = fma(_3861, _3857, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3791 = _3869;
            _3809 = _3875;
            _3785 = _3867;
            _3803 = _3873;
            _3797 = _3871;
            _3817 = _3877;
            _3879 = true;
        }
        else
        {
            bool _3881 = _3102 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3883 = isnan(_3102);
            bool _3885 = _3881 || _3883;
            bool _3887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3889 = _3885 || _3887;
            if (!_3889)
            {
                _3783 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3891 = _3783;
            _3785 = _3891;
            if (!_3889)
            {
                _3789 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3893 = _3789;
            _3791 = _3893;
            if (!_3889)
            {
                _3795 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3895 = _3795;
            _3797 = _3895;
            if (!_3889)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3897 = _3801;
            _3803 = _3897;
            if (!_3889)
            {
                _3807 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3899 = _3807;
            _3809 = _3899;
            if (!_3889)
            {
                _3815 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3901 = _3815;
            bool _3903 = !_3889;
            _3817 = _3901;
            if (!_3903)
            {
                bool _3905 = _3102 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3907 = isnan(_3102);
                bool _3909 = _3905 || _3907;
                bool _3911 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3913 = _3909 || _3911;
                if (!_3913)
                {
                    float _3915 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3917 = _3102 + _3915;
                    float _3919 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3921 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3919;
                    float _3923 = 1.0 / _3921;
                    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3931 = _3929 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3935 = _3933 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3939 = _3937 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3941 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3943 = _3941 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3945 = _3917 * _3923;
                    float _3947 = precise::clamp(_3945, 0.0, 1.0);
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3951 = _3949 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3953 = fma(_3947, _3927, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3955 = fma(_3947, _3951, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3957 = fma(_3947, _3931, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3959 = fma(_3947, _3935, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3961 = fma(_3947, _3939, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3963 = fma(_3947, _3943, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3791 = _3955;
                    _3809 = _3961;
                    _3785 = _3953;
                    _3803 = _3959;
                    _3797 = _3957;
                    _3817 = _3963;
                    _3879 = true;
                }
                else
                {
                    _3791 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3809 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3785 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3797 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3817 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3879 = false;
    float _3965 = _3791;
    float _3967 = _3809;
    float _3969 = _3785;
    float _3971 = _3803;
    float _3973 = _3797;
    float _3975 = _3817;
    float _3977 = fma(_2630, -0.5, 0.5);
    float _3979 = precise::clamp(_3977, 0.0, 1.0);
    float _3981 = -_3965;
    float _3983 = _3981 + _3967;
    float _3985 = _3749 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3987 = -_3969;
    float _3989 = _3987 + _3971;
    float _3991 = fma(_3979, _3983, _3965);
    out.m_88.x = 0.0;
    float _3993 = -_3973;
    float _3995 = _3993 + _3975;
    float _3997 = fma(_3979, _3989, _3969);
    float _3999 = _3991 * 0.586610972881317138671875;
    out.m_49.x = _3985;
    bool _4001 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4003 = fma(_3979, _3995, _3973);
    float _4005 = fma(_3997, 0.298911988735198974609375, _3999);
    bool _4007 = _3080 > 0.0;
    bool _4009 = isnan(_3080);
    bool _4011 = _4007 || _4009;
    bool _4013 = isnan(0.0);
    bool _4015 = _4011 || _4013;
    float _4017 = fma(_4003, 0.114477999508380889892578125, _4005);
    float _4019 = -_4017;
    float _4021 = _3997 + _4019;
    float _4023 = -_4017;
    float _4025 = _3991 + _4023;
    float _4027 = -_4017;
    float _4029 = _4003 + _4027;
    float _4031 = fma(_4021, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4017);
    float _4033 = fma(_4025, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4017);
    float _4035 = fma(_4029, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4017);
    bool _4037 = !_4001;
    if (!_4037)
    {
        float _4039 = -_3052;
        float _4041 = _4039 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4043 = -_3054;
        float _4045 = _4043 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4047 = -_3056;
        float _4049 = _4047 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4051 = _4041 * _4041;
        float _4053 = fma(_4045, _4045, _4051);
        float _4055 = fma(_4049, _4049, _4053);
        float _4057 = sqrt(_4055);
        float _4059 = rsqrt(_4055);
        float _4061 = -_4057;
        float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4065 = _4063 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4067 = precise::clamp(_4065, 0.0, 1.0);
        float _4069 = _4045 * _4059;
        float _4071 = _4041 * _4059;
        float _4073 = abs(_4067);
        float _4075 = log2(_4073);
        float _4077 = _4049 * _4059;
        float _4079 = _4069 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4081 = _2630 * _4071;
        float _4083 = -_4071;
        float _4085 = -_4079;
        float _4087 = fma(_4083, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4085);
        float _4089 = fma(_2628, _4069, _4081);
        float _4091 = -_4077;
        float _4093 = fma(_4091, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4087);
        float _4095 = fma(_2440, _4077, _4089);
        float _4097 = precise::clamp(_4095, 0.0, 1.0);
        float _4099 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4101 = _4093 + _4099;
        float _4103 = _4075 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4105 = _4101 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4107 = precise::clamp(_4105, 0.0, 1.0);
        float _4109 = exp2(_4103);
        float _4111 = _4109 * _4107;
        float _4113 = _4097 * _4111;
        float _4115 = _4113 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4117 = _4113 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4119 = _4113 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _4115;
        out.m_88.y = _4117;
        out.m_88.z = _4119;
    }
    out.m_90.x = _4031;
    out.m_90.y = _4033;
    out.m_90.z = _4035;
    if (_4015)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _4121 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4121;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

