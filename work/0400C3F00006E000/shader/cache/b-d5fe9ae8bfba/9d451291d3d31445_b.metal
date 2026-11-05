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
    float4 m_76 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4223 = false;
    bool _4005 = false;
    bool _2770 = false;
    bool _2758 = false;
    bool _687 = false;
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
        float _4522 = as_type<float>(_125);
        out.gl_Position.z = _4522;
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
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_109);
        _119 = _149;
    }
    float _151 = _119;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4596 = as_type<float>(_165);
        out.gl_Position.z = _4596;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_57.x;
    float _169 = in.m_57.y;
    float _171 = in.m_57.z;
    float _173 = in.m_59.x;
    float _175 = in.m_59.y;
    float _177 = in.m_59.z;
    float _179 = in.m_61.x;
    float _181 = in.m_61.y;
    float _183 = in.m_61.z;
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_66.w;
    float _189 = in.m_46.x;
    float _191 = in.m_46.y;
    float _193 = in.m_46.z;
    float _195 = _167 * _167;
    float _197 = _169 * _169;
    float _199 = fma(_173, _173, _195);
    float _201 = fma(_175, _175, _197);
    float _203 = fma(_179, _179, _199);
    float _205 = _171 * _171;
    float _207 = fma(_181, _181, _201);
    float _209 = sqrt(_203);
    float _211 = fma(_177, _177, _205);
    float _213 = fma(_183, _183, _211);
    float _215 = sqrt(_207);
    float _217 = sqrt(_213);
    bool _219 = _209 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = 0.0;
    float _225 = _203;
    float _227 = _177;
    if (_219)
    {
        float _229 = rsqrt(_203);
        _223 = _229;
    }
    float _231 = _223;
    float _233 = 0.0;
    if (!_219)
    {
        _233 = 0.0;
    }
    float _235 = _233;
    bool _237 = _217 > 0.0;
    float _239 = 0.0;
    float _241 = _235;
    if (!_219)
    {
        _239 = 0.0;
    }
    float _243 = _239;
    int _245 = as_type<int>(_185) & 1;
    bool _247 = _245 != 0;
    int _249 = as_type<int>(_185) & 2;
    bool _251 = _249 != 0;
    float _253 = 0.0;
    float _255 = _243;
    if (_221)
    {
        float _257 = rsqrt(_207);
        _253 = _257;
    }
    float _259 = _253;
    float _261 = in.m_51.x;
    float _263 = in.m_51.y;
    float _265 = in.m_51.z;
    bool _267 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _271 = _267 || _269;
    bool _273 = isnan(1.0);
    bool _275 = _271 || _273;
    float _277 = 0.0;
    float _279 = 0.0;
    if (!_221)
    {
        _277 = 0.0;
        _279 = 0.0;
    }
    float _281 = _277;
    float _283 = _279;
    float _285 = _283;
    float _287 = _281;
    if (!_219)
    {
        _225 = 0.0;
    }
    float _289 = _225;
    float _291 = 0.0;
    float _293 = _289;
    if (!_221)
    {
        _291 = 0.0;
    }
    float _295 = _291;
    float _297 = 0.0;
    float _299 = _295;
    if (_237)
    {
        float _301 = rsqrt(_213);
        _297 = _301;
    }
    float _303 = _297;
    if (_219)
    {
        float _305 = _231 * _173;
        _241 = _305;
    }
    float _307 = _241;
    if (_219)
    {
        float _309 = _231 * _167;
        _293 = _309;
    }
    float _311 = _293;
    if (_219)
    {
        float _313 = _231 * _179;
        _255 = _313;
    }
    float _315 = _255;
    float _317 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _319 = int(_247);
    int _321 = _251 ? 2 : 0;
    int _323 = _319 | _321;
    int _325 = _219 ? 4 : 0;
    int _327 = _323 | _325;
    int _329 = _221 ? 8 : 0;
    int _331 = _327 | _329;
    int _333 = _237 ? 16 : 0;
    int _335 = _331 | _333;
    int _337 = _275 ? 32 : 0;
    int _339 = _335 | _337;
    int _341 = false ? 64 : 0;
    int _343 = _339 | _341;
    int _345 = _343 & 32;
    float _347 = 0.0;
    float _349 = 0.0;
    float _351 = as_type<float>(_345);
    float _353 = _317;
    if (!_237)
    {
        _347 = 0.0;
        _349 = 0.0;
    }
    float _355 = _347;
    float _357 = _349;
    float _359 = 0.0;
    float _361 = _355;
    float _363 = _357;
    if (!_237)
    {
        _359 = 0.0;
    }
    float _365 = _359;
    float _367 = _365;
    if (!_275)
    {
        float _369 = _317 * _317;
        float _371 = _369 * 0.5;
        _351 = _371;
    }
    float _373 = _351;
    float _375 = _373;
    if (_221)
    {
        float _377 = _259 * _175;
        _285 = _377;
    }
    float _379 = _285;
    float _381 = _379;
    float _383 = _379;
    if (_221)
    {
        float _385 = _259 * _169;
        _287 = _385;
    }
    float _387 = _287;
    if (_221)
    {
        float _389 = _259 * _181;
        _299 = _389;
    }
    float _391 = _299;
    bool _393 = !_247;
    float _395 = _393 ? (-0.5) : 0.5;
    if (!_275)
    {
        float _397 = _373 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _375 = _397;
    }
    float _399 = _375;
    bool _401 = !_251;
    float _403 = _401 ? (-0.5) : 0.5;
    float _405 = _399;
    if (_237)
    {
        float _407 = _303 * _177;
        _367 = _407;
    }
    float _409 = _367;
    if (_237)
    {
        float _411 = _303 * _171;
        _361 = _411;
    }
    float _413 = _361;
    if (_237)
    {
        float _415 = _303 * _183;
        _363 = _415;
    }
    float _417 = _363;
    bool _419 = !_275;
    float _421 = 0.0;
    float _423 = _265;
    float _425 = _261;
    float _427 = _265;
    if (!_419)
    {
        float _429 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _431 = log2(_429);
        float _433 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _435 = _433 + 1.0;
        float _437 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _439 = _317 * _431;
        float _441 = 1.0 / _435;
        float _443 = _437 * 0.693147182464599609375;
        float _445 = exp2(_439);
        float _447 = 1.0 / _443;
        float _449 = _445 + (-1.0);
        float _451 = -_449;
        float _453 = fma(_451, _447, _317);
        float _455 = _453 * _441;
        float _457 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _405 = _457;
        _421 = _455;
    }
    float _459 = _405;
    float _461 = _421;
    float _463 = _459 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _465 = !_275;
    float _467 = _461;
    float _469 = _459;
    if (!_465)
    {
        float _471 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _473 = log2(_471);
        float _475 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _477 = _475 + 1.0;
        float _479 = 1.0 / _477;
        float _481 = _317 * _473;
        float _483 = exp2(_481);
        float _485 = -_483;
        float _487 = _485 + 1.0;
        float _489 = _487 * _479;
        _467 = _479;
        _353 = _489;
    }
    float _491 = _467;
    float _493 = _353;
    float _495 = _463 * _311;
    float _497 = _463 * _387;
    float _499 = _459 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _501 = _463 * _413;
    float _503 = _491;
    if (!_275)
    {
        float _505 = _145 * _145;
        float _507 = _505 * 0.5;
        _503 = _507;
    }
    float _509 = _503;
    float _511 = fma(_499, _307, _495);
    float _513 = fma(_499, _379, _497);
    float _515 = fma(_499, _409, _501);
    float _517 = _459 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_275)
    {
        float _519 = _509 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _469 = _519;
    }
    float _521 = _469;
    bool _523 = !_275;
    float _525 = _521;
    if (!_523)
    {
        float _527 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _529 = log2(_527);
        float _531 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _533 = _531 + 1.0;
        float _535 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _537 = _145 * _529;
        float _539 = exp2(_537);
        float _541 = _535 * 0.693147182464599609375;
        float _543 = 1.0 / _541;
        float _545 = 1.0 / _533;
        float _547 = _539 + (-1.0);
        float _549 = -_547;
        float _551 = fma(_549, _543, _145);
        float _553 = _551 * _545;
        float _555 = _553 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _525 = _555;
    }
    float _557 = _525;
    float _559 = _557 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _561 = fma(_517, _315, _511);
    float _563 = fma(_517, _391, _513);
    float _565 = _557 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _567 = _559 * _311;
    float _569 = _559 * _387;
    float _571 = _559 * _413;
    float _573 = fma(_517, _417, _515);
    float _575 = _557 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _577 = fma(_565, _379, _569);
    float _579 = fma(_565, _307, _567);
    float _581 = fma(_565, _409, _571);
    float _583 = fma(_493, _261, _561);
    float _585 = fma(_493, _263, _563);
    float _587 = fma(_493, _265, _573);
    float _589 = fma(_575, _391, _577);
    float _591 = fma(_575, _315, _579);
    float _593 = fma(_575, _417, _581);
    float _595 = _557;
    if (!_275)
    {
        _595 = _145;
    }
    float _597 = _595;
    bool _599 = !_275;
    float _601 = _597;
    if (!_599)
    {
        float _603 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _605 = log2(_603);
        float _607 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _609 = _607 + 1.0;
        float _611 = 1.0 / _609;
        float _613 = _145 * _605;
        float _615 = exp2(_613);
        float _617 = -_615;
        float _619 = _617 + 1.0;
        float _621 = _619 * _611;
        _601 = _621;
    }
    float _623 = _601;
    float _625 = fma(_623, _263, _589);
    bool _627 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _629 = fma(_623, _261, _591);
    float _631 = fma(_623, _265, _593);
    float _633 = -_625;
    float _635 = _585 + _633;
    float _637 = fma(_585, _187, _191);
    float _639 = fma(_583, _187, _189);
    float _641 = -_629;
    float _643 = _583 + _641;
    float _645 = _635 * _175;
    float _647 = _635 * _169;
    float _649 = _635 * _181;
    float _651 = -_631;
    float _653 = _587 + _651;
    float _655 = fma(_643, _173, _645);
    float _657 = fma(_643, _167, _647);
    float _659 = fma(_643, _179, _649);
    float _661 = fma(_587, _187, _193);
    float _663 = fma(_653, _177, _655);
    float _665 = fma(_653, _171, _657);
    float _667 = fma(_653, _183, _659);
    bool _669 = !_627;
    float _685;
    if (!_669)
    {
        float _671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _673 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _675 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _677 = _675 * _671;
        float _679 = floor(_677);
        float _681 = -_679;
        float _683 = _677 + _681;
        _685 = _683;
        _687 = true;
    }
    else
    {
        float _689 = float(_109);
        float _691 = 1.0 / _689;
        float _693 = _145 * _691;
        _685 = _693;
    }
    _687 = false;
    float _695 = _685;
    float _697 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _699 = int(_697);
    float _701 = in.m_53.y;
    float _703 = _131 * 2.0;
    float _705 = in.m_53.z;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _709 = _707 != 0;
    float _711 = _637 * _181;
    float _713 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _715 = int(_713);
    float _717 = in.m_53.w;
    float _719 = fma(_639, _179, _711);
    float _721 = in.m_61.w;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _723;
    float _727 = float(_699);
    float _729 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _731 = int(_729);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _737 = 0.0;
    if (_709)
    {
        _737 = 1.0;
    }
    float _739 = _737;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _743 = 0.0;
    float _745 = _739;
    if (_709)
    {
        _743 = _131;
    }
    float _747 = _743;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _751 = 0.0;
    float _753 = _747;
    if (_709)
    {
        _751 = 1.0;
    }
    float _755 = _751;
    float _757 = float(_715);
    float _759 = 1.0 / _727;
    float _761 = _701 * 2.0;
    float _763 = _755;
    if (!_709)
    {
        _745 = 7.345489978790283203125;
    }
    float _765 = _745;
    float _767 = _701 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_709)
    {
        _753 = _701;
    }
    float _769 = _753;
    if (!_709)
    {
        _763 = 1.2345600128173828125;
    }
    float _771 = _763;
    float _773 = fma(_767, -2.0, _741);
    float _775 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _777 = int(_775);
    float _779 = float(uint(_731));
    float _781 = in.m_57.w;
    int _783 = ~_731;
    int _785 = _783 + 1;
    float _787 = _765 * _131;
    float _789 = _769 * _771;
    float _791 = 1.0 / _757;
    float _793 = _145 * _759;
    float _795 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _773);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _797;
    float _801 = float(uint(_777));
    float _803 = floor(_703);
    int _805 = ~_777;
    int _807 = _805 + 1;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _815 = _813 != 0;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _819 = _817 != 0;
    float _821 = _145 * _791;
    float _823 = floor(_761);
    float _825 = _705 * 2.0;
    int _827 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _829 = _827 != 0;
    bool _831 = !_811;
    int _833 = _831 ? 0 : 1;
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _837 = _835 != 0;
    float _839 = 1.0 / _779;
    bool _841 = _131 > 0.5;
    bool _843 = !_837;
    int _845 = _843 ? 0 : 1;
    float _847 = -_395;
    int _849 = _841 ? as_type<int>(_847) : as_type<int>(_395);
    float _851 = trunc(_793);
    int _853 = int(_851);
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _857 = _855 != 0;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _861 = _859 != 0;
    bool _863 = !_829;
    float _865 = _863 ? _395 : as_type<float>(_849);
    bool _867 = !_857;
    int _869 = _867 ? 0 : 1;
    float _871 = 1.0 / _801;
    bool _873 = _803 >= 0.0;
    bool _875 = isnan(_803);
    bool _877 = _873 || _875;
    bool _879 = isnan(0.0);
    bool _881 = _877 || _879;
    bool _883 = _823 > 0.0;
    bool _885 = _823 >= 0.0;
    bool _887 = isnan(_823);
    bool _889 = _885 || _887;
    bool _891 = isnan(0.0);
    bool _893 = _889 || _891;
    int _895 = as_type<int>(_839) + (-2);
    float _897 = trunc(_821);
    int _899 = int(_897);
    float _901 = float(uint(_853));
    bool _903 = !_861;
    int _905 = _903 ? 0 : 1;
    bool _907 = _803 > 0.0;
    int _909 = _881 ? 0 : 1;
    float _911 = floor(_825);
    int _913 = as_type<int>(_871) + (-2);
    int _915 = _893 ? 0 : 1;
    bool _917 = !_815;
    int _919 = _917 ? 0 : 1;
    bool _921 = _717 > 0.5;
    float _923 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _925 = log2(_923);
    float _927 = float(uint(_899));
    int _929 = ~_909;
    int _931 = _929 + 1;
    int _933 = _931 + 1;
    int _935 = _933;
    if (!_907)
    {
        int _937 = ~_909;
        int _939 = _937 + 1;
        _935 = _939;
    }
    int _941 = _935;
    float _943 = as_type<float>(_913) * _927;
    bool _945 = _701 > 0.5;
    float _947 = 1.0 / _735;
    bool _949 = _911 > 0.0;
    bool _951 = _911 >= 0.0;
    bool _953 = isnan(_911);
    bool _955 = _951 || _953;
    bool _957 = isnan(0.0);
    bool _959 = _955 || _957;
    float _961 = as_type<float>(_895) * _901;
    int _963 = ~_915;
    int _965 = _963 + 1;
    int _967 = _965 + 1;
    int _969 = _967;
    if (!_883)
    {
        int _971 = ~_915;
        int _973 = _971 + 1;
        _969 = _973;
    }
    int _975 = _969;
    float _977 = trunc(_943);
    float _979 = precise::max(_977, 0.0);
    uint _982 = uint(_979);
    float _984 = _145 * _925;
    float _986 = -_403;
    int _988 = _945 ? as_type<int>(_986) : as_type<int>(_403);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _992 = _990 != 0;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _996 = 1.0 + _994;
    float _998 = trunc(_961);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    bool _1004 = _705 > 0.5;
    bool _1006 = !_992;
    float _1008 = _1006 ? _403 : as_type<float>(_988);
    float _1010 = -_395;
    int _1012 = _1004 ? as_type<int>(_1010) : as_type<int>(_395);
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1016 = _1014 != 0;
    float _1018 = exp2(_984);
    int _1020 = _807 * int(_982);
    int _1022 = _1020 + _899;
    float _1024 = -_403;
    int _1026 = _921 ? as_type<int>(_1024) : as_type<int>(_403);
    bool _1028 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1030 = isnan(0.0);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(uint(_1022));
    float _1040 = 1.0 / _996;
    int _1042 = _785 * int(_1002);
    int _1044 = _1042 + _853;
    int _1046 = _1022;
    if (_709)
    {
        _1046 = 0;
    }
    int _1048 = _1046;
    float _1050 = as_type<float>(_913) * _1038;
    int _1052 = _1048;
    if (!_709)
    {
        _1052 = 1;
    }
    int _1054 = _1052;
    float _1056 = float(uint(_1044));
    float _1058 = trunc(_1050);
    float _1060 = precise::max(_1058, 0.0);
    uint _1062 = uint(_1060);
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1066 = _1064 != 0;
    float _1068 = -_1018;
    float _1070 = _1068 + 1.0;
    float _1072 = as_type<float>(_895) * _1056;
    bool _1074 = !_819;
    int _1076 = _1074 ? 0 : 1;
    bool _1078 = !_1016;
    float _1080 = _1078 ? _403 : as_type<float>(_1026);
    float _1082 = trunc(_1072);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1090 = _1088 != 0;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1098 = _1096 != 0;
    int _1100 = _959 ? 0 : 1;
    bool _1102 = _1054 != 1;
    int _1104 = ~_777;
    int _1106 = _1104 + 1;
    float _1108 = 1.0 / _725;
    int _1110 = int(_982) + int(_1062);
    float _1112 = _1036 ? _1070 : 0.0;
    int _1114 = ~_731;
    int _1116 = _1114 + 1;
    float _1118 = _1112 * _1040;
    int _1120 = int(_1002) + int(_1086);
    int _1122 = _1106 * _1110;
    int _1124 = _1122 + _899;
    int _1126 = ~_1100;
    int _1128 = _1126 + 1;
    int _1130 = _1128 + 1;
    float _1132 = 0.0;
    int _1134 = _1130;
    if (!_1102)
    {
        _1132 = _701;
    }
    float _1136 = _1132;
    int _1138 = _1116 * _1120;
    int _1140 = _1138 + _853;
    float _1142 = 0.0;
    float _1144 = _1136;
    if (!_1102)
    {
        _1142 = _701;
    }
    float _1146 = _1142;
    float _1148 = _637 * _175;
    float _1150 = 0.0;
    float _1152 = _1146;
    if (!_1102)
    {
        _1150 = _705;
    }
    float _1154 = _1150;
    float _1156 = 0.0;
    float _1158 = _1154;
    if (!_1102)
    {
        _1156 = _705;
    }
    float _1160 = _1156;
    float _1162 = _1160;
    if (!_949)
    {
        int _1164 = ~_1100;
        int _1166 = _1164 + 1;
        _1134 = _1166;
    }
    int _1168 = _1134;
    if (_1102)
    {
        _1144 = _131;
    }
    float _1170 = _1144;
    if (_1102)
    {
        _1152 = _131;
    }
    float _1172 = _1152;
    if (_1102)
    {
        _1158 = _701;
    }
    float _1174 = _1158;
    float _1176 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1102)
    {
        _1162 = _701;
    }
    float _1178 = _1162;
    bool _1180 = !_1094;
    int _1182 = _1180 ? 0 : 1;
    float _1184 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1186 = uint(_1124) >= uint(_777);
    float _1188 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1190 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1192 = isnan(1.0);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1198 = _1194 || _1196;
    bool _1200 = uint(_1140) >= uint(_731);
    float _1202 = _637 * _169;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1206 = _1204 != 0;
    float _1208 = fma(_639, _173, _1148);
    bool _1210 = !_1066;
    float _1212 = _1210 ? _395 : as_type<float>(_1012);
    float _1214 = fma(_639, _167, _1202);
    bool _1216 = !_1198;
    float _1218 = _1216 ? _145 : _1118;
    float _1220 = in.m_59.w;
    bool _1222 = !_1186;
    int _1224 = _1222 ? 0 : (-1);
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1228 = _695 + _1226;
    bool _1230 = !_1200;
    int _1232 = _1230 ? 0 : (-1);
    float _1234 = fma(_661, _171, _1214);
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1238 = _1236 != 0;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1242 = _1240 != 0;
    int _1244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1246 = _1244 != 0;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1250 = _1248 != 0;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1254 = _695 + _1252;
    float _1256 = _1228 * _947;
    float _1258 = _131 + _701;
    float _1260 = -_749;
    float _1262 = fma(_1188, 2.0, _1260);
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1266 = _695 + _1264;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1268;
    float _1272 = _131 + _705;
    float _1274 = _1258 + (-1.0);
    float _1276 = _705 + _701;
    float _1278 = fma(_661, _177, _1208);
    float _1280 = _1266 * _1108;
    float _1282 = 1.0 / _1270;
    float _1284 = fma(_661, _183, _719);
    float _1286 = _1272 + (-1.0);
    float _1288 = _1276 + (-1.0);
    float _1290 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1292 = _1234 + _781;
    float _1294 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1296 = _1278 + _1220;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1306 = _1284 + _721;
    bool _1308 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1310 = isnan(_695);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    float _1320 = fma(_1300, _1280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1322 = fma(_1304, _1256, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1324 = _1254 * _1282;
    float _1326 = -_1318;
    float _1328 = _1326 + 1.0;
    bool _1330 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1332 = isnan(_695);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = _1296 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1344 = _1306 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1346 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1348 = !_1098;
    int _1350 = _1348 ? 0 : 1;
    bool _1352 = !_1090;
    int _1354 = _1352 ? 0 : 1;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1356;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1362 = _1360 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1364 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1366 = isnan(_695);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1372 = _1368 || _1370;
    float _1374 = float(_1372);
    float _1376 = fma(_1358, _1280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1378 = fma(_1362, _1256, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1380 = -_1374;
    float _1382 = _1380 + 1.0;
    bool _1384 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1386 = isnan(_695);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = floor(_787);
    float _1398 = _1374 * _1328;
    float _1400 = _1340 * _1382;
    float _1402 = -_1340;
    float _1404 = _1402 + 1.0;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1406;
    float _1410 = -_145;
    float _1412 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1262);
    float _1414 = _865 + 0.5;
    float _1416 = _1394 * _1404;
    float _1418 = fma(_1408, _1324, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1420 = fma(_799, _1324, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1422 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1412);
    float _1424 = _1008 + (-0.5);
    float _1426 = _1320 * _1416;
    float _1428 = -_1394;
    float _1430 = _1428 + 1.0;
    float _1432 = _1376 * _1416;
    float _1434 = floor(_789);
    float _1436 = -_1424;
    float _1438 = -_795;
    float _1440 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1438);
    float _1442 = float(_109);
    float _1444 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1426);
    float _1446 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1432);
    float _1448 = _1292 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1450 = -_1396;
    float _1452 = _787 + _1450;
    float _1454 = fma(_1322, _1400, _1444);
    float _1456 = 1.0 / _1442;
    float _1458 = _1448 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1460 = _1448 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1462 = _1448 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1464 = fma(_1378, _1400, _1446);
    float _1466 = float(_899);
    float _1468 = fma(_1342, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1458);
    float _1470 = fma(_1342, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1462);
    float _1472 = -_1434;
    float _1474 = _789 + _1472;
    float _1476 = fma(_1418, _1398, _1454);
    float _1478 = fma(_1420, _1398, _1464);
    float _1480 = float(_777);
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1484 = float(_731);
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1488 = _145 * _1456;
    float _1490 = float(_853);
    float _1492 = _1452 * _1480;
    bool _1494 = _1466 >= _1480;
    bool _1496 = isnan(_1466);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(_1480);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    float _1506 = _1488 * _1480;
    float _1508 = _1488 * _1484;
    bool _1510 = _1490 >= _1484;
    bool _1512 = isnan(_1490);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(_1484);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = _1474 * _1484;
    float _1524 = fma(_1344, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1468);
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1528 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1482);
    float _1530 = fma(_1342, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1460);
    float _1532 = -_1526;
    float _1534 = fma(_1176, 2.0, _1532);
    int _1536 = abs(_1350);
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1540 = float(_975);
    float _1542 = fma(_1344, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1530);
    float _1544 = in.m_68.x;
    float _1546 = in.m_68.y;
    float _1548 = in.m_68.z;
    int _1550 = abs(_1182);
    float _1552 = fma(_1344, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1470);
    int _1554 = abs(_1354);
    float _1556 = fma(_1184, -2.0, _1538);
    float _1558 = float(_941);
    float _1560 = _1524 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1562 = float(_1550);
    float _1564 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1478);
    float _1566 = float(_1554);
    float _1568 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1556);
    float _1570 = float(_1168);
    float _1572 = _1562 * _1558;
    float _1574 = float(_1536);
    float _1576 = trunc(_1522);
    int _1578 = int(_1576);
    int _1580 = abs(_905);
    float _1582 = _1566 * _1570;
    float _1584 = _1080 + (-0.5);
    float _1586 = _1574 * _1540;
    int _1588 = ~_1120;
    int _1590 = _1588 + _1232;
    int _1592 = _1590 + 1;
    float _1594 = _1582 * (-2.0);
    float _1596 = -_1584;
    float _1598 = -_1568;
    float _1600 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1598);
    float _1602 = trunc(_1504);
    int _1604 = int(_1602);
    float _1606 = fma(_1346, _1594, _1346);
    float _1608 = fma(_1594, _1544, _1544);
    float _1610 = _1572 * (-2.0);
    float _1612 = _1586 * (-2.0);
    int _1614 = abs(_869);
    float _1616 = fma(_1294, _1610, _1294);
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1620 = fma(_1610, _1546, _1546);
    int _1622 = ~_1110;
    int _1624 = _1622 + _1224;
    int _1626 = _1624 + 1;
    float _1628 = trunc(_1492);
    int _1630 = int(_1628);
    float _1632 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1618);
    float _1634 = _131 + (-0.5);
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1638 = _731 * _1592;
    int _1640 = _1638 + _853;
    float _1642 = fma(_1290, _1612, _1290);
    float _1644 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1608);
    int _1646 = _777 * _1626;
    int _1648 = _1646 + _899;
    float _1650 = trunc(_1520);
    int _1652 = int(_1650);
    bool _1654 = !_1242;
    int _1656 = _1654 ? 0 : 1;
    float _1658 = fma(_1218, _1606, _1644);
    float _1660 = fma(_1612, _1548, _1548);
    float _1662 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1636);
    bool _1664 = _777 == 0;
    float _1666 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1668 = _701 + (-0.5);
    int _1670 = _1630 * _1580;
    int _1672 = _1670 + _899;
    float _1674 = _705 + (-0.5);
    int _1676 = _1578 * _1614;
    int _1678 = _1676 + _853;
    int _1680 = ~_1604;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1620);
    bool _1688 = !_1664;
    int _1690 = _1688 ? _1648 : (-1);
    float _1692 = trunc(_1506);
    int _1694 = int(_1692);
    float _1696 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1660);
    bool _1698 = !_1238;
    int _1700 = _1698 ? 0 : 1;
    float _1702 = _1542 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1704 = float(uint(_1672));
    int _1706 = _1690 * _1684;
    bool _1708 = _731 == 0;
    float _1710 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1476);
    int _1712 = _777 + (-1);
    float _1714 = as_type<float>(_913) * _1704;
    int _1716 = ~_1652;
    int _1718 = _1716 + 1;
    int _1720 = _1718 + 1;
    float _1722 = _1560 * _1666;
    bool _1724 = !_1708;
    int _1726 = _1724 ? _1640 : (-1);
    int _1728 = _1604 * _1712;
    int _1730 = _1728 + _1706;
    int _1732 = abs(_919);
    float _1734 = in.m_66.x;
    float _1736 = in.m_66.y;
    float _1738 = float(uint(_1678));
    float _1740 = fma(_1218, _1616, _1686);
    int _1742 = _1726 * _1720;
    int _1744 = abs(_833);
    float _1746 = trunc(_1508);
    int _1748 = int(_1746);
    int _1750 = _731 + (-1);
    int _1752 = _1730 * _1732;
    int _1754 = abs(_1656);
    float _1756 = as_type<float>(_895) * _1738;
    int _1758 = abs(_1076);
    int _1760 = _1694 * _1744;
    int _1762 = _1760 + _1752;
    int _1764 = _1652 * _1750;
    int _1766 = _1764 + _1742;
    int _1768 = abs(_1700);
    int _1770 = _1672 * _1758;
    int _1772 = _1770 + _1762;
    int _1774 = abs(_845);
    int _1776 = _1766 * _1754;
    bool _1778 = !_1246;
    int _1780 = _1778 ? 0 : 1;
    float _1782 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1486);
    int _1784 = _1630 * _1774;
    int _1786 = _1784 + _1772;
    int _1788 = abs(_1780);
    float _1790 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _1792 = !_1250;
    int _1794 = _1792 ? 0 : 1;
    int _1796 = _1748 * _1768;
    int _1798 = _1796 + _1776;
    float _1800 = float(uint(_1786));
    float _1802 = _1564 * _1736;
    int _1804 = abs(_1794);
    int _1806 = _1678 * _1788;
    int _1808 = _1806 + _1798;
    float _1810 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1632);
    float _1812 = as_type<float>(_913) * _1800;
    float _1814 = trunc(_1714);
    float _1816 = precise::max(_1814, 0.0);
    uint _1818 = uint(_1816);
    int _1820 = _1578 * _1804;
    int _1822 = _1820 + _1808;
    float _1824 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1782);
    float _1826 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1662);
    float _1828 = _1212 + 0.5;
    float _1830 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1528);
    float _1832 = -_1824;
    float _1834 = _1832 + 1.0;
    float _1836 = _1702 * _1790;
    float _1838 = trunc(_1812);
    float _1840 = precise::max(_1838, 0.0);
    uint _1842 = uint(_1840);
    float _1844 = _1552 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1846 = -_145;
    float _1848 = fma(_1846, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1534);
    float _1850 = -_1810;
    float _1852 = _1850 + 1.0;
    float _1854 = fma(_1218, _1642, _1696);
    float _1856 = -_1826;
    float _1858 = _1856 + 1.0;
    float _1860 = fma(_1080, _1834, _1600);
    float _1862 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1848);
    float _1864 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1866 = -_1830;
    float _1868 = _1866 + 1.0;
    int _1870 = ~_777;
    int _1872 = _1870 + 1;
    float _1874 = -_1852;
    float _1876 = fma(_865, _1874, _1422);
    float _1878 = float(uint(_1822));
    float _1880 = fma(_1008, _1858, _1440);
    int _1882 = ~_777;
    int _1884 = _1882 + 1;
    float _1886 = -_1868;
    float _1888 = fma(_1212, _1886, _1862);
    int _1890 = _1872 * int(_1842);
    int _1892 = _1890 + _1786;
    float _1894 = as_type<float>(_895) * _1878;
    float _1896 = trunc(_1756);
    float _1898 = precise::max(_1896, 0.0);
    uint _1900 = uint(_1898);
    int _1902 = _1884 * int(_1818);
    int _1904 = _1902 + _1672;
    out.m_70.x = _1876;
    out.m_70.y = _1880;
    out.m_70.z = _1888;
    out.m_70.w = _1860;
    float _1906 = _1658 * 0.15915493667125701904296875;
    float _1908 = _1740 * 0.15915493667125701904296875;
    float _1910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _403);
    float _1912 = _1844 * _1864;
    float _1914 = fma(_1722, 0.5, 0.5);
    float _1916 = fma(_1836, 0.5, 0.5);
    float _1918 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1920 = _1854 * 0.15915493667125701904296875;
    float _1922 = trunc(_1894);
    float _1924 = precise::max(_1922, 0.0);
    uint _1926 = uint(_1924);
    float _1928 = float(uint(_1904));
    float _1930 = fma(_1912, 0.5, 0.5);
    float _1932 = _1918 * _1910;
    int _1934 = ~_731;
    int _1936 = _1934 + 1;
    float _1938 = _1710 * _1734;
    float _1940 = float(uint(_1892));
    float _1942 = as_type<float>(_913) * _1928;
    float _1944 = _1906 * 6.283185482025146484375;
    float _1946 = sin(_1944);
    float _1948 = as_type<float>(_913) * _1940;
    int _1950 = ~_731;
    int _1952 = _1950 + 1;
    int _1954 = _1936 * int(_1900);
    int _1956 = _1954 + _1678;
    int _1958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1960 = _1958 != 0;
    float _1962 = _1906 * 6.283185482025146484375;
    float _1964 = cos(_1962);
    int _1966 = _1952 * int(_1926);
    int _1968 = _1966 + _1822;
    bool _1970 = !_1960;
    int _1972 = _1970 ? 0 : 1;
    float _1974 = _1908 * 6.283185482025146484375;
    float _1976 = sin(_1974);
    float _1978 = _1908 * 6.283185482025146484375;
    float _1980 = cos(_1978);
    float _1982 = floor(_1914);
    float _1984 = _1964 * _1976;
    float _1986 = _1946 * _1976;
    float _1988 = floor(_1916);
    float _1990 = _1946 * _1980;
    float _1992 = _1920 * 6.283185482025146484375;
    float _1994 = cos(_1992);
    float _1996 = -_1982;
    float _1998 = _1914 + _1996;
    float _2000 = _1964 * _1980;
    float _2002 = floor(_1930);
    float _2004 = -_1988;
    float _2006 = _1916 + _2004;
    float _2008 = _1920 * 6.283185482025146484375;
    float _2010 = sin(_2008);
    float _2012 = _1946 * _1994;
    float _2014 = float(uint(_1968));
    float _2016 = as_type<float>(_895) * _2014;
    float _2018 = trunc(_1948);
    float _2020 = precise::max(_2018, 0.0);
    uint _2022 = uint(_2020);
    float _2024 = float(uint(_1956));
    float _2026 = _1980 * _1994;
    float _2028 = -_2002;
    float _2030 = _1930 + _2028;
    float _2032 = _1964 * _1994;
    float _2034 = fma(_2030, 2.0, -1.0);
    float _2036 = trunc(_1942);
    float _2038 = precise::max(_2036, 0.0);
    uint _2040 = uint(_2038);
    float _2042 = -_1984;
    float _2044 = fma(_2010, _1990, _2042);
    float _2046 = -_1990;
    float _2048 = fma(_2010, _1984, _2046);
    float _2050 = fma(_2006, 2.0, -1.0);
    float _2052 = _1976 * _1994;
    float _2054 = as_type<float>(_895) * _2024;
    float _2056 = fma(_1998, 2.0, -1.0);
    float _2058 = _2050 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _2060 = int(_1842) + int(_2022);
    float _2062 = trunc(_2054);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    int _2068 = ~_777;
    int _2070 = _2068 + 1;
    float _2072 = _2058 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _2074 = _2058 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2076 = _2058 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _2078 = fma(_2010, _2000, _1986);
    int _2080 = _2070 * _2060;
    int _2082 = _2080 + _1786;
    float _2084 = fma(_2010, _1986, _2000);
    float _2086 = trunc(_2016);
    float _2088 = precise::max(_2086, 0.0);
    uint _2090 = uint(_2088);
    float _2092 = _2056 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _2094 = int(_1818) + int(_2040);
    float _2096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _395);
    bool _2098 = uint(_2082) >= uint(_777);
    float _2100 = fma(_2092, (*spvDescriptorSet0.vp_c12)._m0[2].x, _2072);
    float _2102 = fma(_2092, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2074);
    float _2104 = fma(_2092, (*spvDescriptorSet0.vp_c12)._m0[2].z, _2076);
    bool _2106 = !_2098;
    int _2108 = _2106 ? 0 : (-1);
    float _2110 = _1938 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2112 = int(_1900) + int(_2066);
    float _2114 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2116 = ~_2060;
    int _2118 = _2116 + _2108;
    int _2120 = _2118 + 1;
    int _2122 = ~_731;
    int _2124 = _2122 + 1;
    float _2126 = -_2010;
    float _2128 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2114);
    int _2130 = int(_1926) + int(_2090);
    int _2132 = _777 * _2120;
    int _2134 = _2132 + _1786;
    float _2136 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2138 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2140 = _2110 * _2096;
    int _2142 = _2124 * _2130;
    int _2144 = _2142 + _1822;
    bool _2146 = !_1664;
    int _2148 = _2146 ? _2134 : (-1);
    float _2150 = -_2010;
    float _2152 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2136);
    float _2154 = -_2010;
    float _2156 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2138);
    float _2158 = _2032 * _1932;
    int _2160 = _2148 & 3;
    bool _2162 = _2160 != 0;
    float _2164 = -_1932;
    float _2166 = _2010 * _2164;
    bool _2168 = uint(_2144) >= uint(_731);
    float _2170 = fma(_2078, _2140, _2158);
    int _2172 = _2162 ? 0 : 1;
    float _2174 = fma(_2026, _2140, _2166);
    int _2176 = _2148 & 3;
    bool _2178 = _2176 != 0;
    float _2180 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2128);
    bool _2182 = !_2168;
    int _2184 = _2182 ? 0 : (-1);
    float _2186 = _2012 * _1932;
    bool _2188 = uint(_2176) > 1u;
    float _2190 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2192 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2194 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2152);
    float _2196 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2198 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2200 = fma(_2044, _2140, _2186);
    float _2202 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2192);
    float _2204 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2156);
    float _2206 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2190);
    float _2208 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2196);
    float _2210 = fma(_2052, _2198, _2174);
    int _2212 = ~_2130;
    int _2214 = _2212 + _2184;
    int _2216 = _2214 + 1;
    float _2218 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2220 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2222 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2224 = ~_2172;
    int _2226 = _2224 + 1;
    int _2228 = _2226 + 1;
    float _2230 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2218);
    int _2232 = _2228;
    float _2234 = _2056;
    float _2236 = _2050;
    float _2238 = _2050;
    if (!_2188)
    {
        int _2240 = ~_2172;
        int _2242 = _2240 + 1;
        _2232 = _2242;
    }
    int _2244 = _2232;
    float _2246 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2220);
    float _2248 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2222);
    int _2250 = ~_777;
    int _2252 = _2250 + 1;
    int _2254 = _731 * _2216;
    int _2256 = _2254 + _1822;
    bool _2258 = uint(_2176) >= 2u;
    float _2260 = fma(_2048, _2198, _2170);
    float _2262 = fma(_2084, _2198, _2200);
    int _2264 = _2148 >> 31;
    float _2266 = _403 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2268 = !_1708;
    int _2270 = _2268 ? _2256 : (-1);
    int _2272 = _2252 * _2094;
    int _2274 = _2272 + _1672;
    int _2276 = _2258 ? 0 : 1;
    float _2278 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2230);
    bool _2280 = _2176 != 3;
    float _2282 = _395 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2284 = _2264 & 3;
    float _2286 = _2266 * _2180;
    int _2288 = _2270 >> 31;
    float _2290 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2246);
    int _2292 = _2148 + _2284;
    float _2294 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2248);
    int _2296 = _2288 & 3;
    int _2298 = ~_731;
    int _2300 = _2298 + 1;
    int _2302 = _2270 + _2296;
    int _2304 = _2292 >> 2;
    int _2306 = ~_2276;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = _2310;
    if (_2280)
    {
        int _2314 = ~_2276;
        int _2316 = _2314 + 1;
        _2312 = _2316;
    }
    int _2318 = _2312;
    int _2320 = _2302 >> 2;
    int _2322 = _2300 * _2112;
    int _2324 = _2322 + _1678;
    int _2326 = _2304 << 4;
    int _2328 = _2326 + 368;
    float _2330 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2206);
    bool _2332 = uint(_2274) >= uint(_777);
    int _2334 = _2320 << 4;
    int _2336 = _2334 + 512;
    uint _2338 = uint(int(uint(_2328) >> uint(2)));
    uint _2340 = uint(int(uint(int(_2338)) >> uint(2)));
    int _2342 = int(_2338) & 3;
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[int(_2340)][_2342];
    int _2346 = int(_2338) + 1;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    int _2350 = _2346 & 3;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[int(_2348)][_2350];
    bool _2354 = !_2332;
    int _2356 = _2354 ? 0 : (-1);
    float _2358 = fma(_2282, _2330, _2286);
    bool _2360 = uint(_2324) >= uint(_731);
    float _2362 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2202);
    float _2364 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2208);
    int _2366 = ~_2094;
    int _2368 = _2366 + _2356;
    int _2370 = _2368 + 1;
    float _2372 = _2266 * _2194;
    uint _2374 = uint(int(uint(_2336) >> uint(2)));
    uint _2376 = uint(int(uint(int(_2374)) >> uint(2)));
    int _2378 = int(_2374) & 3;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[int(_2376)][_2378];
    int _2382 = int(_2374) + 1;
    uint _2384 = uint(int(uint(_2382) >> uint(2)));
    int _2386 = _2382 & 3;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[int(_2384)][_2386];
    bool _2390 = !_2178;
    int _2392 = _2390 ? 0 : 1;
    out.m_72.x = _2330;
    out.m_72.y = _2362;
    out.m_72.z = _2364;
    int _2394 = _2270 & 3;
    bool _2396 = _2394 != 0;
    float _2398 = fma(_2282, _2362, _2372);
    bool _2400 = !_2360;
    int _2402 = _2400 ? 0 : (-1);
    int _2404 = _777 * _2370;
    int _2406 = _2404 + _1672;
    bool _2408 = uint(_2394) > 1u;
    int _2410 = _2328 + 8;
    uint _2412 = uint(int(uint(_2410) >> uint(2)));
    uint _2414 = uint(int(uint(int(_2412)) >> uint(2)));
    int _2416 = int(_2412) & 3;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[int(_2414)][_2416];
    int _2420 = int(_2412) + 1;
    uint _2422 = uint(int(uint(_2420) >> uint(2)));
    int _2424 = _2420 & 3;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[int(_2422)][_2424];
    int _2428 = _2270 & 3;
    bool _2430 = _2428 != 0;
    float _2432 = _2266 * _2204;
    int _2434 = ~_2112;
    int _2436 = _2434 + _2402;
    int _2438 = _2436 + 1;
    int _2440 = _2430 ? 0 : 1;
    float _2442 = fma(_2282, _2364, _2432);
    int _2444 = abs(_2392);
    int _2446 = _2336 + 8;
    uint _2448 = uint(int(uint(_2446) >> uint(2)));
    uint _2450 = uint(int(uint(int(_2448)) >> uint(2)));
    int _2452 = int(_2448) & 3;
    float _2454 = (*spvDescriptorSet0.vp_c9)._m0[int(_2450)][_2452];
    int _2456 = int(_2448) + 1;
    uint _2458 = uint(int(uint(_2456) >> uint(2)));
    int _2460 = _2456 & 3;
    float _2462 = (*spvDescriptorSet0.vp_c9)._m0[int(_2458)][_2460];
    int _2464 = ~_2440;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    int _2470 = _731 * _2438;
    int _2472 = _2470 + _1678;
    bool _2474 = !_2396;
    int _2476 = _2474 ? 0 : 1;
    float _2478 = _2294 + _2442;
    int _2480 = _2468;
    if (!_2408)
    {
        int _2482 = ~_2440;
        int _2484 = _2482 + 1;
        _2480 = _2484;
    }
    int _2486 = _2480;
    int _2488 = abs(_2244);
    bool _2490 = _2394 != 3;
    int _2492 = abs(_2486);
    int _2494 = ~_2488;
    int _2496 = _2494 + 1;
    int _2498 = _2496 + 1;
    int _2500 = abs(_2476);
    bool _2502 = uint(_2394) >= 2u;
    int _2504 = ~_2492;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    int _2510 = abs(_2318);
    int _2512 = _2498 * as_type<int>(_2352);
    int _2514 = ~_2444;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    int _2520 = _2502 ? 0 : 1;
    int _2522 = ~_2500;
    int _2524 = _2522 + 1;
    int _2526 = _2524 + 1;
    int _2528 = _2508 * as_type<int>(_2388);
    int _2530 = ~_2510;
    int _2532 = _2530 + 1;
    int _2534 = _2532 + 1;
    int _2536 = _2518 * as_type<int>(_2344);
    int _2538 = _2536 + _2512;
    int _2540 = ~_2520;
    int _2542 = _2540 + 1;
    int _2544 = _2542 + 1;
    float _2546 = fma(_2266, _2266, 1.0);
    bool _2548 = _2394 != 3;
    int _2550 = _2526 * as_type<int>(_2380);
    int _2552 = _2550 + _2528;
    int _2554 = _2544;
    if (_2490)
    {
        int _2556 = ~_2520;
        int _2558 = _2556 + 1;
        _2554 = _2558;
    }
    int _2560 = _2554;
    int _2562 = _2534 * as_type<int>(_2418);
    int _2564 = _2562 + _2538;
    bool _2566 = _2176 != 3;
    float _2568 = rsqrt(_2546);
    bool _2570 = !_2548;
    int _2572 = _2570 ? 0 : (-1);
    int _2574 = abs(_2560);
    bool _2576 = !_2566;
    int _2578 = _2576 ? 0 : (-1);
    bool _2580 = !_1206;
    int _2582 = _2580 ? 0 : 1;
    int _2584 = abs(_1972);
    int _2586 = abs(_2572);
    int _2588 = abs(_2578);
    float _2590 = _2266 * _2568;
    int _2592 = abs(_2582);
    int _2594 = ~_2574;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    int _2600 = ~_2588;
    int _2602 = _2600 + 1;
    int _2604 = _2602 + 1;
    int _2606 = _2598 * as_type<int>(_2454);
    int _2608 = _2606 + _2552;
    int _2610 = _2604 * as_type<int>(_2426);
    int _2612 = _2610 + _2564;
    int _2614 = ~_2586;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    float _2620 = -_2294;
    float _2622 = _2590 * _2620;
    int _2624 = ~_2584;
    int _2626 = _2624 + 1;
    int _2628 = _2626 + 1;
    int _2630 = ~_2592;
    int _2632 = _2630 + 1;
    int _2634 = _2632 + 1;
    int _2636 = _2618 * as_type<int>(_2462);
    int _2638 = _2636 + _2608;
    bool _2640 = !_1664;
    int _2642 = _2640 ? _2406 : (-1);
    int _2644 = _2612 * _2628;
    float _2646 = -_2278;
    float _2648 = _2590 * _2646;
    int _2650 = _2638 * _2634;
    float _2652 = -_2290;
    float _2654 = _2590 * _2652;
    int _2656 = _2642 * _2584;
    int _2658 = _2656 + _2644;
    float _2660 = fma(_2568, _2180, _2648);
    float _2662 = _2290 + _2398;
    float _2664 = fma(_2568, _2194, _2654);
    float _2666 = _2278 + _2358;
    bool _2668 = !_1708;
    int _2670 = _2668 ? _2472 : (-1);
    float _2672 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2674 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _2676 = isnan(1.0);
    bool _2678 = _2674 || _2676;
    bool _2680 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2682 = _2678 || _2680;
    float _2684 = fma(_2568, _2204, _2622);
    out.m_74.x = _2666;
    out.m_74.y = _2662;
    out.m_74.z = _2478;
    int _2686 = _2670 * _2592;
    int _2688 = _2686 + _2650;
    float _2690 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2692 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2694 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2672);
    float _2696 = _2034 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2698 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2690);
    float _2700 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2692);
    float _2702 = float(_2658);
    float _2704 = fma(_2696, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2100);
    float _2706 = float(_2688);
    float _2708 = fma(_2696, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2102);
    float _2710 = fma(_2696, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2104);
    float _2712 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2694);
    float _2714 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2698);
    float _2716 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2700);
    out.m_76.x = _2660;
    out.m_76.y = _2664;
    out.m_76.z = _2684;
    float _2718 = _2704 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2720 = _2712 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2722 = _2714 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_78.x = _2702;
    out.m_78.y = _2706;
    float _2724 = _2720 + _2718;
    float _2726 = _2708 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2728 = _2710 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2730 = _2716 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2732 = _2722 + _2726;
    float _2734 = _2730 + _2728;
    float _2736 = _2730;
    float _2738 = _2720;
    float _2740 = _2702;
    float _2742 = _2730;
    float _2744 = _2702;
    float _2746 = _2720;
    float _2748 = _2660;
    float _2750 = _2716;
    float _2752 = _2734;
    float _2762;
    float _2764;
    float _2766;
    float _2768;
    if (!_2682)
    {
        bool _2754 = _2726 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2756 = !_2754;
        _2758 = _2756;
        if (!_2758)
        {
            float _2760 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _2762 = _2760;
            _2764 = 0.0;
            _2766 = 0.0;
            _2768 = 0.0;
            _2770 = true;
        }
    }
    if ((!_2770) || _2758)
    {
        bool _2808;
        if (!_2758)
        {
            bool _2772 = _2726 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2774 = isnan(_2726);
            bool _2776 = _2772 || _2774;
            bool _2778 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2780 = _2776 || _2778;
            bool _2782 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2784 = !_2780;
            bool _2786 = _2782 && _2784;
            bool _2788 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _2790 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2786)
            {
                _2736 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2792 = _2736;
            float _2794 = _2792;
            if (_2786)
            {
                _2738 = 0.0;
            }
            float _2796 = _2738;
            _2746 = _2796;
            _2764 = _2796;
            if (_2786)
            {
                _2740 = 0.0;
            }
            float _2798 = _2740;
            _2744 = _2798;
            _2766 = _2798;
            if (_2786)
            {
                float _2800 = _2792 * 5.0;
                _2794 = _2800;
            }
            float _2802 = _2794;
            _2742 = _2802;
            _2762 = _2802;
            if (_2786)
            {
                _2790 = 0.0;
            }
            float _2804 = _2790;
            bool _2806 = !_2780;
            _2808 = _2806 && _2788;
            _2748 = _2804;
            _2768 = _2804;
        }
        if ((!_2808) || _2758)
        {
            _2758 = false;
            float _2810 = _2742;
            float _2812 = _2744;
            float _2814 = _2746;
            float _2816 = _2748;
            bool _2818 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2820 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2822 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2824 = _2810;
            float _2826 = _2812;
            float _2828 = _2814;
            float _2830 = _2816;
            if (_2818)
            {
                float _2832 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2824 = _2832;
            }
            float _2834 = _2824;
            if (_2818)
            {
                float _2836 = abs(_2056);
                float _2838 = -_2836;
                float _2840 = _2838 + 1.0;
                _2234 = _2840;
            }
            float _2842 = _2234;
            if (_2820)
            {
                float _2844 = abs(_2050);
                float _2846 = -_2844;
                float _2848 = _2846 + 1.0;
                _2236 = _2848;
            }
            float _2850 = _2236;
            _2238 = _2850;
            if (!_2818)
            {
                _2826 = 1.0;
            }
            float _2852 = _2826;
            float _2854 = _2852;
            if (!_2820)
            {
                _2828 = 1.0;
            }
            float _2856 = _2828;
            float _2858 = _2856;
            if (!_2822)
            {
                _2830 = 1.0;
            }
            float _2860 = _2830;
            float _2862 = _2690;
            float _2864 = _2860;
            if (_2820)
            {
                float _2866 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2862 = _2866;
            }
            float _2868 = _2862;
            float _2870 = _2722;
            if (_2822)
            {
                float _2872 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2870 = _2872;
            }
            float _2874 = _2870;
            float _2876 = _2834;
            if (_2818)
            {
                float _2878 = _2842 * _2834;
                float _2880 = precise::clamp(_2878, 0.0, 1.0);
                _2854 = _2880;
            }
            float _2882 = _2854;
            if (_2822)
            {
                float _2884 = abs(_2034);
                float _2886 = -_2884;
                float _2888 = _2886 + 1.0;
                _2876 = _2888;
            }
            float _2890 = _2876;
            if (_2820)
            {
                float _2892 = _2850 * _2868;
                float _2894 = precise::clamp(_2892, 0.0, 1.0);
                _2858 = _2894;
            }
            float _2896 = _2858;
            if (_2822)
            {
                float _2898 = _2890 * _2874;
                float _2900 = precise::clamp(_2898, 0.0, 1.0);
                _2864 = _2900;
            }
            float _2902 = _2864;
            float _2904 = _2882 * _2896;
            float _2906 = _2904 * _2902;
            _2762 = _2734;
            _2764 = _2724;
            _2766 = _2732;
            _2768 = _2906;
        }
    }
    _2770 = false;
    float _2908 = _2762;
    float _2910 = _2764;
    float _2912 = _2766;
    float _2914 = _2238;
    float _2916 = _2768;
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2920 = _2908 + _2918;
    float _2922 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2924 = _2910 + _2922;
    float _2926 = _2920 * _2920;
    float _2928 = fma(_2924, _2924, _2926);
    float _2930 = sqrt(_2928);
    bool _2932 = _2930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _2934 = !_2932;
    float _2936 = _2912;
    float _2938 = _2910;
    float _2940 = _2908;
    float _2942 = _2914;
    float _2944 = _2924;
    if (!_2934)
    {
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2950 = _2930 + _2948;
        float _2952 = rsqrt(_2928);
        float _2954 = _2950 * _2946;
        float _2956 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2958 = _2954 * 0.15915493667125701904296875;
        float _2960 = _2958 * 6.283185482025146484375;
        float _2962 = cos(_2960);
        float _2964 = _2958 * 6.283185482025146484375;
        float _2966 = sin(_2964);
        float _2968 = _2962 + (-1.0);
        float _2970 = fma(_2966, _2956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2972 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2974 = _2952 * _2970;
        float _2976 = fma(_2962, _2912, _2972);
        float _2978 = fma(_2924, _2974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2980 = fma(_2920, _2974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2936 = _2976;
        _2938 = _2978;
        _2940 = _2980;
    }
    float _2982 = _2936;
    float _2984 = _2938;
    float _2986 = _2940;
    float _2988 = -_2726;
    float _2990 = _2988 + _2982;
    float _2992 = -_2718;
    float _2994 = _2992 + _2984;
    float _2996 = -_2728;
    float _2998 = _2996 + _2986;
    float _3000 = _2990 * _2990;
    float _3002 = fma(_2994, _2994, _3000);
    float _3004 = fma(_2998, _2998, _3002);
    float _3006 = sqrt(_3004);
    bool _3008 = _3006 > 0.0;
    bool _3010 = !_3008;
    float _3012 = _3006;
    float _3014 = _2984;
    float _3016 = _2986;
    float _3018 = _2982;
    if (!_3010)
    {
        bool _3020 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3022 = _2704;
        if (_3020)
        {
            float _3024 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3022 = _3024;
        }
        float _3026 = _3022;
        if (_3020)
        {
            _2942 = _663;
        }
        float _3028 = _2942;
        float _3030 = _3028;
        if (_3020)
        {
            _2944 = _665;
        }
        float _3032 = _2944;
        float _3034 = _3032;
        if (_3020)
        {
            _3012 = _667;
        }
        float _3036 = _3012;
        float _3038 = _3026;
        float _3040 = _3036;
        if (_3020)
        {
            float _3042 = _663 * _3026;
            _2750 = _3042;
        }
        float _3044 = _2750;
        float _3046 = _3044;
        if (_3020)
        {
            float _3048 = _665 * _3026;
            _2752 = _3048;
        }
        float _3050 = _2752;
        float _3052 = _3050;
        if (_3020)
        {
            float _3054 = _667 * _3026;
            _3038 = _3054;
        }
        float _3056 = _3038;
        float _3058 = _3056;
        if (!_3020)
        {
            bool _3060 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3062 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3064 = _3060 || _3062;
            bool _3066 = isnan(1.0);
            bool _3068 = _3064 || _3066;
            float _3070 = _145 + 1.0;
            if (!_3068)
            {
                float _3072 = _3070 * _3070;
                float _3074 = _3072 * 0.5;
                _147 = _3074;
            }
            float _3076 = _147;
            float _3078 = _3076;
            if (!_3068)
            {
                float _3080 = _3076 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3078 = _3080;
            }
            float _3082 = _3078;
            bool _3084 = !_3068;
            float _3086 = _3082;
            if (!_3084)
            {
                float _3088 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3090 = log2(_3088);
                float _3092 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3094 = 1.0 + _3092;
                float _3096 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3098 = _3090 * _3070;
                float _3100 = 1.0 / _3094;
                float _3102 = _3096 * 0.693147182464599609375;
                float _3104 = exp2(_3098);
                float _3106 = 1.0 / _3102;
                float _3108 = _3104 + (-1.0);
                float _3110 = -_3108;
                float _3112 = fma(_3110, _3106, _3070);
                float _3114 = _3112 * _3100;
                float _3116 = _3114 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3086 = _3116;
            }
            float _3118 = _3086;
            float _3120 = _3118 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _3122 = _3118 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3124 = _3118 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3126 = _3118;
            if (!_3068)
            {
                _3126 = _3070;
            }
            float _3128 = _3126;
            float _3130 = _3120 * _387;
            float _3132 = _3120 * _311;
            float _3134 = _3120 * _413;
            float _3136 = fma(_3122, _379, _3130);
            float _3138 = fma(_3122, _307, _3132);
            float _3140 = fma(_3124, _391, _3136);
            bool _3142 = !_3068;
            float _3144 = _3128;
            if (!_3142)
            {
                float _3146 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3148 = log2(_3146);
                float _3150 = _3148 * _3070;
                float _3152 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3154 = 1.0 + _3152;
                float _3156 = exp2(_3150);
                float _3158 = 1.0 / _3154;
                float _3160 = -_3156;
                float _3162 = _3160 + 1.0;
                float _3164 = _3162 * _3158;
                _3144 = _3164;
            }
            float _3166 = _3144;
            float _3168 = fma(_3122, _409, _3134);
            float _3170 = fma(_3124, _315, _3138);
            float _3172 = fma(_3166, _263, _3140);
            float _3174 = fma(_3124, _417, _3168);
            float _3176 = fma(_3166, _261, _3170);
            float _3178 = -_625;
            float _3180 = _3178 + _3172;
            float _3182 = fma(_3166, _265, _3174);
            float _3184 = -_629;
            float _3186 = _3184 + _3176;
            float _3188 = _3180 * _175;
            float _3190 = _3180 * _169;
            float _3192 = _3180 * _181;
            float _3194 = -_631;
            float _3196 = _3194 + _3182;
            float _3198 = fma(_3186, _173, _3188);
            float _3200 = fma(_3186, _167, _3190);
            float _3202 = fma(_3186, _179, _3192);
            float _3204 = fma(_3196, _177, _3198);
            float _3206 = fma(_3196, _171, _3200);
            float _3208 = fma(_3196, _183, _3202);
            _3034 = _3206;
            _3030 = _3204;
            _3040 = _3208;
            _3046 = _3204;
            _3052 = _3206;
            _3058 = _3208;
            _423 = _3182;
            _381 = _3180;
        }
        float _3210 = _3034;
        float _3212 = _3030;
        float _3214 = _3040;
        float _3216 = _3046;
        float _3218 = _3052;
        float _3220 = _3058;
        float _3222 = _423;
        float _3224 = _381;
        float _3226 = _3210 * _3210;
        float _3228 = rsqrt(_3004);
        float _3230 = fma(_3212, _3212, _3226);
        float _3232 = fma(_3214, _3214, _3230);
        float _3234 = sqrt(_3232);
        float _3236 = _2994 * _3228;
        float _3238 = _2990 * _3228;
        float _3240 = _2998 * _3228;
        bool _3242 = _3234 > 0.0;
        bool _3244 = !_3242;
        _425 = _3234;
        _427 = _3222;
        _383 = _3224;
        if (!_3244)
        {
            float _3246 = rsqrt(_3232);
            float _3248 = _3246 * _3210;
            float _3250 = _3246 * _3212;
            float _3252 = _3246 * _3214;
            float _3254 = _3238 * _3248;
            float _3256 = fma(_3236, _3250, _3254);
            float _3258 = fma(_3240, _3252, _3256);
            float _3260 = _3258 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3262 = fma(_3216, _3260, _2984);
            float _3264 = fma(_3218, _3260, _2982);
            float _3266 = fma(_3220, _3260, _2986);
            _3014 = _3262;
            _3016 = _3266;
            _3018 = _3264;
            _425 = _3260;
            _427 = _3248;
        }
    }
    float _3268 = _3014;
    float _3270 = _3016;
    float _3272 = _3018;
    float _3274 = _425;
    float _3276 = _427;
    float _3278 = _383;
    float _3280 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3282 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3284 = isnan(0.5);
    bool _3286 = _3282 || _3284;
    bool _3288 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3290 = _3286 || _3288;
    bool _3292 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3294 = isnan(0.5);
    bool _3296 = _3292 || _3294;
    bool _3298 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3300 = _3296 || _3298;
    float _3302 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3280);
    float _3304 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3306 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3302);
    float _3308 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3304);
    float _3310 = _3306 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3312 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3308);
    float _3314 = _3274;
    float _3316 = _3276;
    float _3318 = _3306;
    float _3320 = _3278;
    if (_3290)
    {
        _3314 = _3268;
    }
    float _3322 = _3314;
    float _3324 = 1.0 / _3310;
    float _3326 = _3312 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3328 = _3326;
    float _3330 = _3322;
    if (_3290)
    {
        _3316 = _3270;
    }
    float _3332 = _3316;
    float _3334 = _3326 + _3310;
    float _3336 = _3332;
    if (_3290)
    {
        _3328 = _3272;
    }
    float _3338 = _3328;
    float _3340 = _3338;
    if (!_3290)
    {
        float _3342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3344 = _2726 + _3342;
        float _3346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3348 = _2718 + _3346;
        float _3350 = -_2718;
        float _3352 = _3350 + _3268;
        float _3354 = -_2726;
        float _3356 = _3354 + _3272;
        float _3358 = _3344 * _3344;
        float _3360 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3362 = _2728 + _3360;
        float _3364 = -_2728;
        float _3366 = _3364 + _3270;
        float _3368 = fma(_3348, _3348, _3358);
        float _3370 = fma(_3362, _3362, _3368);
        float _3372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3374 = sqrt(_3370);
        float _3376 = precise::min(_3374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3378 = _3376 * _3372;
        float _3380 = fma(_3352, _3378, _2718);
        float _3382 = fma(_3356, _3378, _2726);
        float _3384 = fma(_3366, _3378, _2728);
        _3340 = _3382;
        _3330 = _3380;
        _3336 = _3384;
        _3318 = _3374;
    }
    float _3386 = _3340;
    float _3388 = _3330;
    float _3390 = _3336;
    float _3392 = _3318;
    float _3394 = _3392;
    if (_3300)
    {
        _3394 = 1.0;
    }
    float _3396 = _3394;
    float _3398 = _3334 * _3324;
    float _3400 = _3398 * 0.5;
    float _3402 = _3396;
    if (!_3300)
    {
        float _3404 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3406 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3404);
        float _3408 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3410 = _3408 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _3412 = 1.0 / _3406;
        float _3414 = 1.0 / _3410;
        float _3416 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3418 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3420 = fma(_3412, _3416, _3418);
        float _3422 = _3420 * _3414;
        float _3424 = precise::clamp(_3422, 0.0, 1.0);
        _3402 = _3424;
    }
    float _3426 = _3402;
    float _3428 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3430 = _3386 + _3428;
    float _3432 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3434 = _3388 + _3432;
    float _3436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3438 = _3390 + _3436;
    float _3440 = _3430 * _3430;
    float _3442 = fma(_3434, _3434, _3440);
    float _3444 = fma(_3438, _3438, _3442);
    float _3446 = rsqrt(_3444);
    float _3448 = sqrt(_3444);
    float _3450 = _3446 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3452 = _3434 * _3450;
    float _3454 = _3438 * _3450;
    float _3456 = _3452 * _3452;
    float _3458 = _3454 * _3454;
    float _3460 = _3456 + _3458;
    float _3462 = sqrt(_3460);
    bool _3464 = _3462 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3468 = _3462 + _3466;
    float _3470 = _3446;
    float _3472 = _3468;
    float _3474 = _3430;
    if (_3464)
    {
        float _3476 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3470 = _3476;
    }
    float _3478 = _3470;
    float _3480 = _3478;
    if (_3464)
    {
        float _3482 = _3468 * _3478;
        _3472 = _3482;
    }
    float _3484 = _3472;
    if (_3464)
    {
        float _3486 = rsqrt(_3460);
        _3480 = _3486;
    }
    float _3488 = _3480;
    float _3490 = _3488;
    if (_3464)
    {
        float _3492 = _3484 * 0.15915493667125701904296875;
        _227 = _3492;
    }
    float _3494 = _227;
    float _3496 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3498 = _3438;
    float _3500 = _3494;
    if (_3464)
    {
        float _3502 = _3494 * 6.283185482025146484375;
        float _3504 = sin(_3502);
        _3498 = _3504;
    }
    float _3506 = _3498;
    float _3508 = precise::max(0.0, _3496);
    float _3510 = _175;
    float _3512 = _3508;
    if (_3464)
    {
        float _3514 = _3494 * 6.283185482025146484375;
        float _3516 = cos(_3514);
        _3510 = _3516;
    }
    float _3518 = _3510;
    float _3520 = -_3450;
    float _3522 = -_3508;
    float _3524 = fma(_3430, _3520, _3522);
    if (_3464)
    {
        float _3526 = _3524 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3474 = _3526;
    }
    float _3528 = _3474;
    float _3530 = _3506;
    float _3532 = _3528;
    if (_3464)
    {
        float _3534 = fma(_3506, _3528, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3530 = _3534;
    }
    float _3536 = _3530;
    float _3538 = _3536;
    if (!_3464)
    {
        _3532 = _3524;
    }
    float _3540 = _3532;
    float _3542 = _3540;
    if (_3464)
    {
        float _3544 = _3488 * _3536;
        _3320 = _3544;
    }
    float _3546 = _3320;
    if (!_3464)
    {
        _3490 = _3452;
    }
    float _3548 = _3490;
    float _3550 = _3548;
    float _3552 = _3518;
    if (_3464)
    {
        float _3554 = _3518 + (-1.0);
        _3512 = _3554;
    }
    float _3556 = _3512;
    float _3558 = _3556;
    if (_3464)
    {
        float _3560 = _3452 * _3546;
        _3550 = _3560;
    }
    float _3562 = _3550;
    if (!_3464)
    {
        _3538 = _3456;
    }
    float _3564 = _3538;
    float _3566 = _3386 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3568 = _3564;
    if (_3464)
    {
        float _3570 = _3556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3500 = _3570;
    }
    float _3572 = _3500;
    if (!_3464)
    {
        _3558 = _3454;
    }
    float _3574 = _3558;
    float _3576 = _3574;
    if (_3464)
    {
        float _3578 = _3454 * _3546;
        _3576 = _3578;
    }
    float _3580 = _3576;
    if (_3464)
    {
        float _3582 = _3562 * _3562;
        _3568 = _3582;
    }
    float _3584 = _3568;
    if (_3464)
    {
        float _3586 = fma(_3524, _3518, _3572);
        _3542 = _3586;
    }
    float _3588 = _3542;
    if (!_3464)
    {
        _3552 = _3458;
    }
    float _3590 = _3552;
    float _3592 = _3590;
    if (_3464)
    {
        float _3594 = _3580 * _3580;
        _3592 = _3594;
    }
    float _3596 = _3592;
    float _3598 = fma(_3588, _3588, _3584);
    float _3600 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3602 = _3598 + _3596;
    float _3604 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3606 = fma(_3448, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3604);
    float _3608 = precise::clamp(_3606, 0.0, 1.0);
    float _3610 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3566);
    float _3612 = _3386 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3614 = rsqrt(_3602);
    float _3616 = -_3608;
    float _3618 = _3616 + 1.0;
    float _3620 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3610);
    float _3622 = _3386 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3624 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3612);
    float _3626 = _3386 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3628 = _3620 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3630 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3622);
    float _3632 = abs(_3618);
    float _3634 = log2(_3632);
    float _3636 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3624);
    float _3638 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3626);
    float _3640 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3630);
    float _3642 = _3628 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3644 = _3636 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3646 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3638);
    float _3648 = _3640 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3650 = _3614 * _3562;
    float _3652 = _3644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3654 = _3646 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3656 = _3614 * _3588;
    float _3658 = _3650 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3660 = -_3642;
    float _3662 = fma(_3660, _3600, 1.0);
    float _3664 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3652);
    float _3666 = _3614 * _3580;
    float _3668 = _3634 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3670 = -_3658;
    float _3672 = fma(_3656, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3670);
    float _3674 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3664);
    float _3676 = log2(_3662);
    float _3678 = _3644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3680 = -_3666;
    float _3682 = fma(_3680, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3672);
    float _3684 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3674);
    float _3686 = _3644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3688 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3678);
    float _3690 = fma(_3682, -0.5, 0.5);
    float _3692 = exp2(_3668);
    float _3694 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3686);
    float _3696 = fma(_3682, 0.5, 0.5);
    float _3698 = _3656 + 1.0;
    float _3700 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3688);
    float _3702 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3694);
    float _3704 = fma(_3696, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3706 = 1.0 / _3684;
    float _3708 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3702);
    float _3710 = fma(_3696, _3704, -0.212114393711090087890625);
    float _3712 = _3676 * 0.693147182464599609375;
    float _3714 = fma(_3696, _3710, 1.570728778839111328125);
    float _3716 = sqrt(_3690);
    float _3718 = -_3656;
    float _3720 = fma(_3692, _3698, _3718);
    float _3722 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3700);
    float _3724 = _3712 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3726 = fma(_3720, 0.5, 0.5);
    float _3728 = _3708 * _3706;
    float _3730 = _3722 * _3706;
    float _3732 = fma(_3728, 0.5, 0.5);
    float _3734 = fma(_3730, -0.5, 0.5);
    float _3736 = _3716 * 0.636619746685028076171875;
    float3 _9888 = float3(_3732, _3734, _3724);
    float _3738 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9888, float3(0.0), isnan(_9888)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9888, float3(0.0), isnan(_9888)), level(0.0)).x;
    float _3740 = -_3714;
    float _3742 = fma(_3736, _3740, 1.0);
    float3 _9904 = float3(_3732, _3734, _3724);
    float4 _3745 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9904, float3(0.0), isnan(_9904)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9904, float3(0.0), isnan(_9904)), level(0.0)).xyzw;
    float _3747 = _3745.x;
    float _3749 = _3745.y;
    float _3751 = _3745.z;
    float _3753 = _3745.w;
    float2 _9921 = float2(_3742, _3726);
    float3 _3757 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9921, float2(0.0), isnan(_9921)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9921, float2(0.0), isnan(_9921)), level(0.0)).xyz;
    float _3759 = _3757.x;
    float _3761 = _3757.y;
    float _3763 = _3757.z;
    float _3765 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3767 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3769 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3771 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3773 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3765);
    float _3775 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3767);
    float _3777 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3769);
    float _3779 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3771);
    float _3781 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3773);
    float _3783 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3775);
    float _3785 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3777);
    float _3787 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3779);
    float _3789 = _3781 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3791 = _3783 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3793 = -_665;
    float _3795 = _3793 + _3386;
    float _3797 = _3785 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3799 = _3789 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3801 = _3789 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3803 = _3644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3805 = _3789 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3807 = fma(_3791, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3799);
    float _3809 = -_663;
    float _3811 = _3809 + _3388;
    float _3813 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    out.m_80.y = 1.0;
    float _3815 = fma(_3791, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3801);
    float _3817 = _3797 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3819 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3803);
    float _3821 = fma(_3791, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3805);
    float _3823 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3813);
    float _3825 = _3787 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3827 = _3817 + _3815;
    float _3829 = _3789 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3831 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3819);
    float _3833 = _3634 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3835 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3827);
    float _3837 = fma(_3791, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3829);
    float _3839 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3841 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3843 = -_667;
    float _3845 = _3843 + _3390;
    float _3847 = exp2(_3833);
    float _3849 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3839);
    float _3851 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3841);
    float _3853 = fma(_3797, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3837);
    float _3855 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3831);
    float _3857 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3823);
    float _3859 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3851);
    float _3861 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3853);
    float _3863 = 1.0 / _3835;
    float _3865 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3867 = _3859 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3869 = _3684 * 0.5;
    float _3871 = _3855 + _3684;
    out.gl_Position.x = _3708;
    out.gl_Position.y = _3722;
    out.gl_Position.z = _3855;
    out.gl_Position.w = _3684;
    float _3873 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3849);
    float _3875 = fma(_3722, -0.5, _3869);
    float _3877 = 1.0 / _3867;
    float _3879 = -_3847;
    float _3881 = _3879 + 1.0;
    out.m_82.x = _3388;
    out.m_82.y = _3386;
    out.m_82.z = _3390;
    float _3883 = _3797 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3885 = _3797 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3887 = _3881 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3889 = _3708 + _3684;
    float _3891 = _3861 * _3863;
    float _3893 = _3883 + _3807;
    float _3895 = _3885 + _3821;
    float _3897 = -_3887;
    float _3899 = _3897 + 1.0;
    float _3901 = _3871 * 0.5;
    bool _3903 = _3891 > 0.0;
    float _3905 = _3889 * 0.5;
    float _3907 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3909 = _3865 * _3877;
    bool _3911 = _3891 < 1.0;
    bool _3913 = _3911 && _3903;
    float _3915 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3893);
    float _3917 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3895);
    bool _3919 = _3728 > (-1.0);
    bool _3921 = _3919 && _3913;
    out.m_84.x = _3905;
    out.m_84.y = _3875;
    out.m_84.z = _3901;
    out.m_84.w = _3684;
    float _3923 = _3907 * _3877;
    bool _3925 = _3730 > (-1.0);
    bool _3927 = _3925 && _3921;
    bool _3929 = _3728 < 1.0;
    bool _3931 = _3929 && _3927;
    bool _3933 = _3730 < 1.0;
    bool _3935 = _3933 && _3931;
    float _3937 = _3915 * _3863;
    float _3939 = _3917 * _3863;
    float _3941 = _3887 * _3738;
    float _3943 = _3753 * _3941;
    float _3945 = _3763 * _3941;
    float _3947 = fma(_3759, _3943, _3747);
    float _3949 = fma(_3761, _3943, _3749);
    float _3951 = _3753 * _3899;
    float _3953 = fma(_3753, _3945, _3751);
    out.m_86.x = _3947;
    out.m_86.y = _3949;
    out.m_86.z = _3953;
    out.m_86.w = _3951;
    bool _3955 = !_3935;
    float _3957 = _3753;
    float _3959 = _3722;
    float _3961 = _3751;
    float _3963 = _3943;
    float _3965 = _3899;
    float _3967 = _3708;
    float _3969 = _3684;
    float _4003;
    if (!_3955)
    {
        float _3971 = -_3939;
        float _3973 = _3730 + _3971;
        float _3975 = -_3937;
        float _3977 = _3728 + _3975;
        float _3979 = _2916 * _3426;
        float _3981 = -_3909;
        float _3983 = _3728 + _3981;
        float _3985 = _3973 * _3973;
        float _3987 = -_3923;
        float _3989 = _3730 + _3987;
        float _3991 = _3979 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _3993 = fma(_3977, _3977, _3985);
        float _3995 = sqrt(_3993);
        bool _3997 = _3995 > 0.0;
        _3961 = _3993;
        _3963 = _3977;
        _3965 = _3995;
        if (!_3997)
        {
            _3957 = _3991;
        }
        float _3999 = _3957;
        bool _4001 = !_3997;
        _4003 = _3999;
        _4005 = _4001;
        if (!_4005)
        {
            float _4007 = _3989 * _3989;
            float _4009 = fma(_3983, _3983, _4007);
            float _4011 = rsqrt(_3993);
            float _4013 = sqrt(_4009);
            float _4015 = _3977 * _4011;
            float _4017 = _3973 * _4011;
            bool _4019 = _4013 > 0.0;
            float _4021 = _4013;
            _3965 = _4011;
            if (!_4019)
            {
                _4021 = _3991;
            }
            float _4023 = _4021;
            bool _4025 = !_4019;
            _4003 = _4023;
            _4005 = _4025;
            if (!_4005)
            {
                float _4027 = _2110 * _3825;
                float _4029 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _4031 = fma(_4027, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3817);
                float _4033 = fma(_4027, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3885);
                float _4035 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4031);
                float _4037 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4033);
                float _4039 = 1.0 / _4035;
                float _4041 = _4029 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _4043 = fma(_4027, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3883);
                float _4045 = rsqrt(_4009);
                float _4047 = _3989 * _4041;
                float _4049 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4043);
                float _4051 = _3983 * _4041;
                float _4053 = _4047 * _4047;
                float _4055 = _4037 * _4039;
                float _4057 = _4049 * _4039;
                float _4059 = fma(_4051, _4051, _4053);
                float _4061 = _4055 * _4055;
                float _4063 = fma(_4057, _4057, _4061);
                float _4065 = sqrt(_4059);
                float _4067 = _3989 * _4045;
                float _4069 = _3983 * _4045;
                float _4071 = _4017 * _4067;
                float _4073 = sqrt(_4063);
                float _4075 = fma(_4015, _4069, _4071);
                float _4077 = precise::min(0.0, _4075);
                float _4079 = _3684 * _4077;
                float _4081 = fma(_4051, _4079, _3708);
                float _4083 = fma(_4065, (*spvDescriptorSet0.vp_c13)._m0[1].x, _4073);
                float _4085 = fma(_4047, _4079, _3722);
                float _4087 = 1.0 / _4083;
                out.gl_Position.x = _4081;
                out.gl_Position.y = _4085;
                float _4089 = _4073 * _4087;
                out.m_80.y = _4089;
                _3959 = _4085;
                _3961 = _4047;
                _4003 = _3991;
                _3963 = _4071;
                _3965 = _4079;
                _3967 = _4081;
                _4005 = true;
            }
        }
    }
    else
    {
        float _4091 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _4091;
        _4003 = 0.0;
        _3967 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    _4005 = false;
    float _4093 = _3959;
    float _4095 = _3961;
    float _4097 = _4003;
    float _4099 = _3963;
    float _4101 = _3965;
    float _4103 = _3967;
    bool _4105 = _3448 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4107 = isnan(_3448);
    bool _4109 = _4105 || _4107;
    bool _4111 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4113 = _4109 || _4111;
    float _4115 = _4099;
    float _4117 = _4095;
    float _4119 = _4101;
    float _4121 = _4093;
    float _4123 = _4103;
    if (!_4113)
    {
        _4115 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4125 = _4115;
    float _4127 = _4125;
    float _4129 = _4125;
    if (!_4113)
    {
        _4117 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4131 = _4117;
    float _4133 = _4131;
    float _4135 = _4131;
    if (!_4113)
    {
        _3969 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4137 = _3969;
    float _4139 = _4137;
    float _4141 = _4137;
    if (!_4113)
    {
        _4119 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4143 = _4119;
    float _4145 = _4143;
    float _4147 = _4143;
    if (!_4113)
    {
        _4121 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4149 = _4121;
    float _4151 = _4149;
    float _4153 = _4149;
    if (!_4113)
    {
        _4123 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4155 = _4123;
    bool _4157 = !_4113;
    float _4159 = _4155;
    float _4161 = _4155;
    if (!_4157)
    {
        bool _4163 = _3448 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4165 = isnan(_3448);
        bool _4167 = _4163 || _4165;
        bool _4169 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4171 = _4167 || _4169;
        if (!_4171)
        {
            float _4173 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4175 = _3448 + _4173;
            float _4177 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4179 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4177;
            float _4181 = 1.0 / _4179;
            float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4185 = _4183 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4189 = _4187 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4193 = _4191 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4199 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4201 = _4199 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4203 = _4175 * _4181;
            float _4205 = precise::clamp(_4203, 0.0, 1.0);
            float _4207 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4209 = _4207 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4211 = fma(_4205, _4185, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4213 = fma(_4205, _4209, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4215 = fma(_4205, _4189, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4217 = fma(_4205, _4193, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4219 = fma(_4205, _4197, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4221 = fma(_4205, _4201, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4135 = _4213;
            _4153 = _4219;
            _4129 = _4211;
            _4147 = _4217;
            _4141 = _4215;
            _4161 = _4221;
            _4223 = true;
        }
        else
        {
            bool _4225 = _3448 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4227 = isnan(_3448);
            bool _4229 = _4225 || _4227;
            bool _4231 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4233 = _4229 || _4231;
            if (!_4233)
            {
                _4127 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4235 = _4127;
            _4129 = _4235;
            if (!_4233)
            {
                _4133 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4237 = _4133;
            _4135 = _4237;
            if (!_4233)
            {
                _4139 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4239 = _4139;
            _4141 = _4239;
            if (!_4233)
            {
                _4145 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4241 = _4145;
            _4147 = _4241;
            if (!_4233)
            {
                _4151 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4243 = _4151;
            _4153 = _4243;
            if (!_4233)
            {
                _4159 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4245 = _4159;
            bool _4247 = !_4233;
            _4161 = _4245;
            if (!_4247)
            {
                bool _4249 = _3448 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4251 = isnan(_3448);
                bool _4253 = _4249 || _4251;
                bool _4255 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4257 = _4253 || _4255;
                if (!_4257)
                {
                    float _4259 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4261 = _3448 + _4259;
                    float _4263 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4265 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4263;
                    float _4267 = 1.0 / _4265;
                    float _4269 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4271 = _4269 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4277 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4279 = _4277 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4281 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4283 = _4281 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4285 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4287 = _4285 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4289 = _4261 * _4267;
                    float _4291 = precise::clamp(_4289, 0.0, 1.0);
                    float _4293 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4295 = _4293 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4297 = fma(_4291, _4271, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4299 = fma(_4291, _4295, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4301 = fma(_4291, _4275, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4303 = fma(_4291, _4279, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4305 = fma(_4291, _4283, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4307 = fma(_4291, _4287, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4135 = _4299;
                    _4153 = _4305;
                    _4129 = _4297;
                    _4147 = _4303;
                    _4141 = _4301;
                    _4161 = _4307;
                    _4223 = true;
                }
                else
                {
                    _4135 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4153 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4129 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4147 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4141 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4161 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4223 = false;
    float _4309 = _4135;
    float _4311 = _4153;
    float _4313 = _4129;
    float _4315 = _4147;
    float _4317 = _4141;
    float _4319 = _4161;
    float _4321 = fma(_2662, -0.5, 0.5);
    float _4323 = precise::clamp(_4321, 0.0, 1.0);
    float _4325 = -_4309;
    float _4327 = _4325 + _4311;
    float _4329 = _4097 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4331 = -_4313;
    float _4333 = _4331 + _4315;
    float _4335 = fma(_4323, _4327, _4309);
    out.m_88.x = 0.0;
    float _4337 = -_4317;
    float _4339 = _4337 + _4319;
    float _4341 = fma(_4323, _4333, _4313);
    float _4343 = _4335 * 0.586610972881317138671875;
    out.m_49.x = _4329;
    bool _4345 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4347 = fma(_4323, _4339, _4317);
    float _4349 = fma(_4341, 0.298911988735198974609375, _4343);
    bool _4351 = _3426 > 0.0;
    bool _4353 = isnan(_3426);
    bool _4355 = _4351 || _4353;
    bool _4357 = isnan(0.0);
    bool _4359 = _4355 || _4357;
    float _4361 = fma(_4347, 0.114477999508380889892578125, _4349);
    float _4363 = -_4361;
    float _4365 = _4341 + _4363;
    float _4367 = -_4361;
    float _4369 = _4335 + _4367;
    float _4371 = -_4361;
    float _4373 = _4347 + _4371;
    float _4375 = fma(_4365, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4361);
    float _4377 = fma(_4369, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4361);
    float _4379 = fma(_4373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4361);
    bool _4381 = !_4345;
    if (!_4381)
    {
        float _4383 = -_3386;
        float _4385 = _4383 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4387 = -_3388;
        float _4389 = _4387 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4391 = -_3390;
        float _4393 = _4391 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4395 = _4385 * _4385;
        float _4397 = fma(_4389, _4389, _4395);
        float _4399 = fma(_4393, _4393, _4397);
        float _4401 = sqrt(_4399);
        float _4403 = rsqrt(_4399);
        float _4405 = -_4401;
        float _4407 = _4405 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4409 = _4407 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4411 = precise::clamp(_4409, 0.0, 1.0);
        float _4413 = _4389 * _4403;
        float _4415 = _4385 * _4403;
        float _4417 = abs(_4411);
        float _4419 = log2(_4417);
        float _4421 = _4393 * _4403;
        float _4423 = _4413 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4425 = _2662 * _4415;
        float _4427 = -_4415;
        float _4429 = -_4423;
        float _4431 = fma(_4427, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4429);
        float _4433 = fma(_2666, _4413, _4425);
        float _4435 = -_4421;
        float _4437 = fma(_4435, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4431);
        float _4439 = fma(_2478, _4421, _4433);
        float _4441 = precise::clamp(_4439, 0.0, 1.0);
        float _4443 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4445 = _4437 + _4443;
        float _4447 = _4419 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4449 = _4445 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4451 = precise::clamp(_4449, 0.0, 1.0);
        float _4453 = exp2(_4447);
        float _4455 = _4453 * _4451;
        float _4457 = _4441 * _4455;
        float _4459 = _4457 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4461 = _4457 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4463 = _4457 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _4459;
        out.m_88.y = _4461;
        out.m_88.z = _4463;
    }
    out.m_90.x = _4375;
    out.m_90.y = _4377;
    out.m_90.z = _4379;
    if (_4359)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _4465 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4465;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4223 = false;
    bool _4005 = false;
    bool _2770 = false;
    bool _2758 = false;
    bool _687 = false;
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
        float _4522 = as_type<float>(_125);
        out.gl_Position.z = _4522;
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
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_109);
        _119 = _149;
    }
    float _151 = _119;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4596 = as_type<float>(_165);
        out.gl_Position.z = _4596;
    }
    if (_157)
    {
        return out;
    }
    float _167 = in.m_57.x;
    float _169 = in.m_57.y;
    float _171 = in.m_57.z;
    float _173 = in.m_59.x;
    float _175 = in.m_59.y;
    float _177 = in.m_59.z;
    float _179 = in.m_61.x;
    float _181 = in.m_61.y;
    float _183 = in.m_61.z;
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_66.w;
    float _189 = in.m_46.x;
    float _191 = in.m_46.y;
    float _193 = in.m_46.z;
    float _195 = _167 * _167;
    float _197 = _169 * _169;
    float _199 = fma(_173, _173, _195);
    float _201 = fma(_175, _175, _197);
    float _203 = fma(_179, _179, _199);
    float _205 = _171 * _171;
    float _207 = fma(_181, _181, _201);
    float _209 = sqrt(_203);
    float _211 = fma(_177, _177, _205);
    float _213 = fma(_183, _183, _211);
    float _215 = sqrt(_207);
    float _217 = sqrt(_213);
    bool _219 = _209 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = 0.0;
    float _225 = _203;
    float _227 = _177;
    if (_219)
    {
        float _229 = rsqrt(_203);
        _223 = _229;
    }
    float _231 = _223;
    float _233 = 0.0;
    if (!_219)
    {
        _233 = 0.0;
    }
    float _235 = _233;
    bool _237 = _217 > 0.0;
    float _239 = 0.0;
    float _241 = _235;
    if (!_219)
    {
        _239 = 0.0;
    }
    float _243 = _239;
    int _245 = as_type<int>(_185) & 1;
    bool _247 = _245 != 0;
    int _249 = as_type<int>(_185) & 2;
    bool _251 = _249 != 0;
    float _253 = 0.0;
    float _255 = _243;
    if (_221)
    {
        float _257 = rsqrt(_207);
        _253 = _257;
    }
    float _259 = _253;
    float _261 = in.m_51.x;
    float _263 = in.m_51.y;
    float _265 = in.m_51.z;
    bool _267 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _271 = _267 || _269;
    bool _273 = isnan(1.0);
    bool _275 = _271 || _273;
    float _277 = 0.0;
    float _279 = 0.0;
    if (!_221)
    {
        _277 = 0.0;
        _279 = 0.0;
    }
    float _281 = _277;
    float _283 = _279;
    float _285 = _283;
    float _287 = _281;
    if (!_219)
    {
        _225 = 0.0;
    }
    float _289 = _225;
    float _291 = 0.0;
    float _293 = _289;
    if (!_221)
    {
        _291 = 0.0;
    }
    float _295 = _291;
    float _297 = 0.0;
    float _299 = _295;
    if (_237)
    {
        float _301 = rsqrt(_213);
        _297 = _301;
    }
    float _303 = _297;
    if (_219)
    {
        float _305 = _231 * _173;
        _241 = _305;
    }
    float _307 = _241;
    if (_219)
    {
        float _309 = _231 * _167;
        _293 = _309;
    }
    float _311 = _293;
    if (_219)
    {
        float _313 = _231 * _179;
        _255 = _313;
    }
    float _315 = _255;
    float _317 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _319 = int(_247);
    int _321 = _251 ? 2 : 0;
    int _323 = _319 | _321;
    int _325 = _219 ? 4 : 0;
    int _327 = _323 | _325;
    int _329 = _221 ? 8 : 0;
    int _331 = _327 | _329;
    int _333 = _237 ? 16 : 0;
    int _335 = _331 | _333;
    int _337 = _275 ? 32 : 0;
    int _339 = _335 | _337;
    int _341 = false ? 64 : 0;
    int _343 = _339 | _341;
    int _345 = _343 & 32;
    float _347 = 0.0;
    float _349 = 0.0;
    float _351 = as_type<float>(_345);
    float _353 = _317;
    if (!_237)
    {
        _347 = 0.0;
        _349 = 0.0;
    }
    float _355 = _347;
    float _357 = _349;
    float _359 = 0.0;
    float _361 = _355;
    float _363 = _357;
    if (!_237)
    {
        _359 = 0.0;
    }
    float _365 = _359;
    float _367 = _365;
    if (!_275)
    {
        float _369 = _317 * _317;
        float _371 = _369 * 0.5;
        _351 = _371;
    }
    float _373 = _351;
    float _375 = _373;
    if (_221)
    {
        float _377 = _259 * _175;
        _285 = _377;
    }
    float _379 = _285;
    float _381 = _379;
    float _383 = _379;
    if (_221)
    {
        float _385 = _259 * _169;
        _287 = _385;
    }
    float _387 = _287;
    if (_221)
    {
        float _389 = _259 * _181;
        _299 = _389;
    }
    float _391 = _299;
    bool _393 = !_247;
    float _395 = _393 ? (-0.5) : 0.5;
    if (!_275)
    {
        float _397 = _373 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _375 = _397;
    }
    float _399 = _375;
    bool _401 = !_251;
    float _403 = _401 ? (-0.5) : 0.5;
    float _405 = _399;
    if (_237)
    {
        float _407 = _303 * _177;
        _367 = _407;
    }
    float _409 = _367;
    if (_237)
    {
        float _411 = _303 * _171;
        _361 = _411;
    }
    float _413 = _361;
    if (_237)
    {
        float _415 = _303 * _183;
        _363 = _415;
    }
    float _417 = _363;
    bool _419 = !_275;
    float _421 = 0.0;
    float _423 = _265;
    float _425 = _261;
    float _427 = _265;
    if (!_419)
    {
        float _429 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _431 = log2(_429);
        float _433 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _435 = _433 + 1.0;
        float _437 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _439 = _317 * _431;
        float _441 = 1.0 / _435;
        float _443 = _437 * 0.693147182464599609375;
        float _445 = exp2(_439);
        float _447 = 1.0 / _443;
        float _449 = _445 + (-1.0);
        float _451 = -_449;
        float _453 = fma(_451, _447, _317);
        float _455 = _453 * _441;
        float _457 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _405 = _457;
        _421 = _455;
    }
    float _459 = _405;
    float _461 = _421;
    float _463 = _459 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _465 = !_275;
    float _467 = _461;
    float _469 = _459;
    if (!_465)
    {
        float _471 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _473 = log2(_471);
        float _475 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _477 = _475 + 1.0;
        float _479 = 1.0 / _477;
        float _481 = _317 * _473;
        float _483 = exp2(_481);
        float _485 = -_483;
        float _487 = _485 + 1.0;
        float _489 = _487 * _479;
        _467 = _479;
        _353 = _489;
    }
    float _491 = _467;
    float _493 = _353;
    float _495 = _463 * _311;
    float _497 = _463 * _387;
    float _499 = _459 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _501 = _463 * _413;
    float _503 = _491;
    if (!_275)
    {
        float _505 = _145 * _145;
        float _507 = _505 * 0.5;
        _503 = _507;
    }
    float _509 = _503;
    float _511 = fma(_499, _307, _495);
    float _513 = fma(_499, _379, _497);
    float _515 = fma(_499, _409, _501);
    float _517 = _459 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_275)
    {
        float _519 = _509 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _469 = _519;
    }
    float _521 = _469;
    bool _523 = !_275;
    float _525 = _521;
    if (!_523)
    {
        float _527 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _529 = log2(_527);
        float _531 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _533 = _531 + 1.0;
        float _535 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _537 = _145 * _529;
        float _539 = exp2(_537);
        float _541 = _535 * 0.693147182464599609375;
        float _543 = 1.0 / _541;
        float _545 = 1.0 / _533;
        float _547 = _539 + (-1.0);
        float _549 = -_547;
        float _551 = fma(_549, _543, _145);
        float _553 = _551 * _545;
        float _555 = _553 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _525 = _555;
    }
    float _557 = _525;
    float _559 = _557 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _561 = fma(_517, _315, _511);
    float _563 = fma(_517, _391, _513);
    float _565 = _557 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _567 = _559 * _311;
    float _569 = _559 * _387;
    float _571 = _559 * _413;
    float _573 = fma(_517, _417, _515);
    float _575 = _557 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _577 = fma(_565, _379, _569);
    float _579 = fma(_565, _307, _567);
    float _581 = fma(_565, _409, _571);
    float _583 = fma(_493, _261, _561);
    float _585 = fma(_493, _263, _563);
    float _587 = fma(_493, _265, _573);
    float _589 = fma(_575, _391, _577);
    float _591 = fma(_575, _315, _579);
    float _593 = fma(_575, _417, _581);
    float _595 = _557;
    if (!_275)
    {
        _595 = _145;
    }
    float _597 = _595;
    bool _599 = !_275;
    float _601 = _597;
    if (!_599)
    {
        float _603 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _605 = log2(_603);
        float _607 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _609 = _607 + 1.0;
        float _611 = 1.0 / _609;
        float _613 = _145 * _605;
        float _615 = exp2(_613);
        float _617 = -_615;
        float _619 = _617 + 1.0;
        float _621 = _619 * _611;
        _601 = _621;
    }
    float _623 = _601;
    float _625 = fma(_623, _263, _589);
    bool _627 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _629 = fma(_623, _261, _591);
    float _631 = fma(_623, _265, _593);
    float _633 = -_625;
    float _635 = _585 + _633;
    float _637 = fma(_585, _187, _191);
    float _639 = fma(_583, _187, _189);
    float _641 = -_629;
    float _643 = _583 + _641;
    float _645 = _635 * _175;
    float _647 = _635 * _169;
    float _649 = _635 * _181;
    float _651 = -_631;
    float _653 = _587 + _651;
    float _655 = fma(_643, _173, _645);
    float _657 = fma(_643, _167, _647);
    float _659 = fma(_643, _179, _649);
    float _661 = fma(_587, _187, _193);
    float _663 = fma(_653, _177, _655);
    float _665 = fma(_653, _171, _657);
    float _667 = fma(_653, _183, _659);
    bool _669 = !_627;
    float _685;
    if (!_669)
    {
        float _671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _673 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _675 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _677 = _675 * _671;
        float _679 = floor(_677);
        float _681 = -_679;
        float _683 = _677 + _681;
        _685 = _683;
        _687 = true;
    }
    else
    {
        float _689 = float(_109);
        float _691 = 1.0 / _689;
        float _693 = _145 * _691;
        _685 = _693;
    }
    _687 = false;
    float _695 = _685;
    float _697 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _699 = int(_697);
    float _701 = in.m_53.y;
    float _703 = _131 * 2.0;
    float _705 = in.m_53.z;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _709 = _707 != 0;
    float _711 = _637 * _181;
    float _713 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _715 = int(_713);
    float _717 = in.m_53.w;
    float _719 = fma(_639, _179, _711);
    float _721 = in.m_61.w;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _723;
    float _727 = float(_699);
    float _729 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _731 = int(_729);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _737 = 0.0;
    if (_709)
    {
        _737 = 1.0;
    }
    float _739 = _737;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _743 = 0.0;
    float _745 = _739;
    if (_709)
    {
        _743 = _131;
    }
    float _747 = _743;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _751 = 0.0;
    float _753 = _747;
    if (_709)
    {
        _751 = 1.0;
    }
    float _755 = _751;
    float _757 = float(_715);
    float _759 = 1.0 / _727;
    float _761 = _701 * 2.0;
    float _763 = _755;
    if (!_709)
    {
        _745 = 7.345489978790283203125;
    }
    float _765 = _745;
    float _767 = _701 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_709)
    {
        _753 = _701;
    }
    float _769 = _753;
    if (!_709)
    {
        _763 = 1.2345600128173828125;
    }
    float _771 = _763;
    float _773 = fma(_767, -2.0, _741);
    float _775 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _777 = int(_775);
    float _779 = float(uint(_731));
    float _781 = in.m_57.w;
    int _783 = ~_731;
    int _785 = _783 + 1;
    float _787 = _765 * _131;
    float _789 = _769 * _771;
    float _791 = 1.0 / _757;
    float _793 = _145 * _759;
    float _795 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _773);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _797;
    float _801 = float(uint(_777));
    float _803 = floor(_703);
    int _805 = ~_777;
    int _807 = _805 + 1;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _815 = _813 != 0;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _819 = _817 != 0;
    float _821 = _145 * _791;
    float _823 = floor(_761);
    float _825 = _705 * 2.0;
    int _827 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _829 = _827 != 0;
    bool _831 = !_811;
    int _833 = _831 ? 0 : 1;
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _837 = _835 != 0;
    float _839 = 1.0 / _779;
    bool _841 = _131 > 0.5;
    bool _843 = !_837;
    int _845 = _843 ? 0 : 1;
    float _847 = -_395;
    int _849 = _841 ? as_type<int>(_847) : as_type<int>(_395);
    float _851 = trunc(_793);
    int _853 = int(_851);
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _857 = _855 != 0;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _861 = _859 != 0;
    bool _863 = !_829;
    float _865 = _863 ? _395 : as_type<float>(_849);
    bool _867 = !_857;
    int _869 = _867 ? 0 : 1;
    float _871 = 1.0 / _801;
    bool _873 = _803 >= 0.0;
    bool _875 = isnan(_803);
    bool _877 = _873 || _875;
    bool _879 = isnan(0.0);
    bool _881 = _877 || _879;
    bool _883 = _823 > 0.0;
    bool _885 = _823 >= 0.0;
    bool _887 = isnan(_823);
    bool _889 = _885 || _887;
    bool _891 = isnan(0.0);
    bool _893 = _889 || _891;
    int _895 = as_type<int>(_839) + (-2);
    float _897 = trunc(_821);
    int _899 = int(_897);
    float _901 = float(uint(_853));
    bool _903 = !_861;
    int _905 = _903 ? 0 : 1;
    bool _907 = _803 > 0.0;
    int _909 = _881 ? 0 : 1;
    float _911 = floor(_825);
    int _913 = as_type<int>(_871) + (-2);
    int _915 = _893 ? 0 : 1;
    bool _917 = !_815;
    int _919 = _917 ? 0 : 1;
    bool _921 = _717 > 0.5;
    float _923 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _925 = log2(_923);
    float _927 = float(uint(_899));
    int _929 = ~_909;
    int _931 = _929 + 1;
    int _933 = _931 + 1;
    int _935 = _933;
    if (!_907)
    {
        int _937 = ~_909;
        int _939 = _937 + 1;
        _935 = _939;
    }
    int _941 = _935;
    float _943 = as_type<float>(_913) * _927;
    bool _945 = _701 > 0.5;
    float _947 = 1.0 / _735;
    bool _949 = _911 > 0.0;
    bool _951 = _911 >= 0.0;
    bool _953 = isnan(_911);
    bool _955 = _951 || _953;
    bool _957 = isnan(0.0);
    bool _959 = _955 || _957;
    float _961 = as_type<float>(_895) * _901;
    int _963 = ~_915;
    int _965 = _963 + 1;
    int _967 = _965 + 1;
    int _969 = _967;
    if (!_883)
    {
        int _971 = ~_915;
        int _973 = _971 + 1;
        _969 = _973;
    }
    int _975 = _969;
    float _977 = trunc(_943);
    float _979 = precise::max(_977, 0.0);
    uint _982 = uint(_979);
    float _984 = _145 * _925;
    float _986 = -_403;
    int _988 = _945 ? as_type<int>(_986) : as_type<int>(_403);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _992 = _990 != 0;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _996 = 1.0 + _994;
    float _998 = trunc(_961);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    bool _1004 = _705 > 0.5;
    bool _1006 = !_992;
    float _1008 = _1006 ? _403 : as_type<float>(_988);
    float _1010 = -_395;
    int _1012 = _1004 ? as_type<int>(_1010) : as_type<int>(_395);
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1016 = _1014 != 0;
    float _1018 = exp2(_984);
    int _1020 = _807 * int(_982);
    int _1022 = _1020 + _899;
    float _1024 = -_403;
    int _1026 = _921 ? as_type<int>(_1024) : as_type<int>(_403);
    bool _1028 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1030 = isnan(0.0);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(uint(_1022));
    float _1040 = 1.0 / _996;
    int _1042 = _785 * int(_1002);
    int _1044 = _1042 + _853;
    int _1046 = _1022;
    if (_709)
    {
        _1046 = 0;
    }
    int _1048 = _1046;
    float _1050 = as_type<float>(_913) * _1038;
    int _1052 = _1048;
    if (!_709)
    {
        _1052 = 1;
    }
    int _1054 = _1052;
    float _1056 = float(uint(_1044));
    float _1058 = trunc(_1050);
    float _1060 = precise::max(_1058, 0.0);
    uint _1062 = uint(_1060);
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1066 = _1064 != 0;
    float _1068 = -_1018;
    float _1070 = _1068 + 1.0;
    float _1072 = as_type<float>(_895) * _1056;
    bool _1074 = !_819;
    int _1076 = _1074 ? 0 : 1;
    bool _1078 = !_1016;
    float _1080 = _1078 ? _403 : as_type<float>(_1026);
    float _1082 = trunc(_1072);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1090 = _1088 != 0;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1098 = _1096 != 0;
    int _1100 = _959 ? 0 : 1;
    bool _1102 = _1054 != 1;
    int _1104 = ~_777;
    int _1106 = _1104 + 1;
    float _1108 = 1.0 / _725;
    int _1110 = int(_982) + int(_1062);
    float _1112 = _1036 ? _1070 : 0.0;
    int _1114 = ~_731;
    int _1116 = _1114 + 1;
    float _1118 = _1112 * _1040;
    int _1120 = int(_1002) + int(_1086);
    int _1122 = _1106 * _1110;
    int _1124 = _1122 + _899;
    int _1126 = ~_1100;
    int _1128 = _1126 + 1;
    int _1130 = _1128 + 1;
    float _1132 = 0.0;
    int _1134 = _1130;
    if (!_1102)
    {
        _1132 = _701;
    }
    float _1136 = _1132;
    int _1138 = _1116 * _1120;
    int _1140 = _1138 + _853;
    float _1142 = 0.0;
    float _1144 = _1136;
    if (!_1102)
    {
        _1142 = _701;
    }
    float _1146 = _1142;
    float _1148 = _637 * _175;
    float _1150 = 0.0;
    float _1152 = _1146;
    if (!_1102)
    {
        _1150 = _705;
    }
    float _1154 = _1150;
    float _1156 = 0.0;
    float _1158 = _1154;
    if (!_1102)
    {
        _1156 = _705;
    }
    float _1160 = _1156;
    float _1162 = _1160;
    if (!_949)
    {
        int _1164 = ~_1100;
        int _1166 = _1164 + 1;
        _1134 = _1166;
    }
    int _1168 = _1134;
    if (_1102)
    {
        _1144 = _131;
    }
    float _1170 = _1144;
    if (_1102)
    {
        _1152 = _131;
    }
    float _1172 = _1152;
    if (_1102)
    {
        _1158 = _701;
    }
    float _1174 = _1158;
    float _1176 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1102)
    {
        _1162 = _701;
    }
    float _1178 = _1162;
    bool _1180 = !_1094;
    int _1182 = _1180 ? 0 : 1;
    float _1184 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1186 = uint(_1124) >= uint(_777);
    float _1188 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1190 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1192 = isnan(1.0);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1198 = _1194 || _1196;
    bool _1200 = uint(_1140) >= uint(_731);
    float _1202 = _637 * _169;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1206 = _1204 != 0;
    float _1208 = fma(_639, _173, _1148);
    bool _1210 = !_1066;
    float _1212 = _1210 ? _395 : as_type<float>(_1012);
    float _1214 = fma(_639, _167, _1202);
    bool _1216 = !_1198;
    float _1218 = _1216 ? _145 : _1118;
    float _1220 = in.m_59.w;
    bool _1222 = !_1186;
    int _1224 = _1222 ? 0 : (-1);
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1228 = _695 + _1226;
    bool _1230 = !_1200;
    int _1232 = _1230 ? 0 : (-1);
    float _1234 = fma(_661, _171, _1214);
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1238 = _1236 != 0;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1242 = _1240 != 0;
    int _1244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1246 = _1244 != 0;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1250 = _1248 != 0;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1254 = _695 + _1252;
    float _1256 = _1228 * _947;
    float _1258 = _131 + _701;
    float _1260 = -_749;
    float _1262 = fma(_1188, 2.0, _1260);
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1266 = _695 + _1264;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1268;
    float _1272 = _131 + _705;
    float _1274 = _1258 + (-1.0);
    float _1276 = _705 + _701;
    float _1278 = fma(_661, _177, _1208);
    float _1280 = _1266 * _1108;
    float _1282 = 1.0 / _1270;
    float _1284 = fma(_661, _183, _719);
    float _1286 = _1272 + (-1.0);
    float _1288 = _1276 + (-1.0);
    float _1290 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1292 = _1234 + _781;
    float _1294 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1296 = _1278 + _1220;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1306 = _1284 + _721;
    bool _1308 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1310 = isnan(_695);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    float _1320 = fma(_1300, _1280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1322 = fma(_1304, _1256, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1324 = _1254 * _1282;
    float _1326 = -_1318;
    float _1328 = _1326 + 1.0;
    bool _1330 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1332 = isnan(_695);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = _1296 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1344 = _1306 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1346 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1348 = !_1098;
    int _1350 = _1348 ? 0 : 1;
    bool _1352 = !_1090;
    int _1354 = _1352 ? 0 : 1;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1356;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1362 = _1360 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1364 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1366 = isnan(_695);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1372 = _1368 || _1370;
    float _1374 = float(_1372);
    float _1376 = fma(_1358, _1280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1378 = fma(_1362, _1256, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1380 = -_1374;
    float _1382 = _1380 + 1.0;
    bool _1384 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1386 = isnan(_695);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = floor(_787);
    float _1398 = _1374 * _1328;
    float _1400 = _1340 * _1382;
    float _1402 = -_1340;
    float _1404 = _1402 + 1.0;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1406;
    float _1410 = -_145;
    float _1412 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1262);
    float _1414 = _865 + 0.5;
    float _1416 = _1394 * _1404;
    float _1418 = fma(_1408, _1324, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1420 = fma(_799, _1324, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1422 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1412);
    float _1424 = _1008 + (-0.5);
    float _1426 = _1320 * _1416;
    float _1428 = -_1394;
    float _1430 = _1428 + 1.0;
    float _1432 = _1376 * _1416;
    float _1434 = floor(_789);
    float _1436 = -_1424;
    float _1438 = -_795;
    float _1440 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1438);
    float _1442 = float(_109);
    float _1444 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1426);
    float _1446 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1432);
    float _1448 = _1292 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1450 = -_1396;
    float _1452 = _787 + _1450;
    float _1454 = fma(_1322, _1400, _1444);
    float _1456 = 1.0 / _1442;
    float _1458 = _1448 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1460 = _1448 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1462 = _1448 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1464 = fma(_1378, _1400, _1446);
    float _1466 = float(_899);
    float _1468 = fma(_1342, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1458);
    float _1470 = fma(_1342, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1462);
    float _1472 = -_1434;
    float _1474 = _789 + _1472;
    float _1476 = fma(_1418, _1398, _1454);
    float _1478 = fma(_1420, _1398, _1464);
    float _1480 = float(_777);
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1484 = float(_731);
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1488 = _145 * _1456;
    float _1490 = float(_853);
    float _1492 = _1452 * _1480;
    bool _1494 = _1466 >= _1480;
    bool _1496 = isnan(_1466);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(_1480);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    float _1506 = _1488 * _1480;
    float _1508 = _1488 * _1484;
    bool _1510 = _1490 >= _1484;
    bool _1512 = isnan(_1490);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(_1484);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = _1474 * _1484;
    float _1524 = fma(_1344, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1468);
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1528 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1482);
    float _1530 = fma(_1342, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1460);
    float _1532 = -_1526;
    float _1534 = fma(_1176, 2.0, _1532);
    int _1536 = abs(_1350);
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1540 = float(_975);
    float _1542 = fma(_1344, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1530);
    float _1544 = in.m_68.x;
    float _1546 = in.m_68.y;
    float _1548 = in.m_68.z;
    int _1550 = abs(_1182);
    float _1552 = fma(_1344, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1470);
    int _1554 = abs(_1354);
    float _1556 = fma(_1184, -2.0, _1538);
    float _1558 = float(_941);
    float _1560 = _1524 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1562 = float(_1550);
    float _1564 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1478);
    float _1566 = float(_1554);
    float _1568 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1556);
    float _1570 = float(_1168);
    float _1572 = _1562 * _1558;
    float _1574 = float(_1536);
    float _1576 = trunc(_1522);
    int _1578 = int(_1576);
    int _1580 = abs(_905);
    float _1582 = _1566 * _1570;
    float _1584 = _1080 + (-0.5);
    float _1586 = _1574 * _1540;
    int _1588 = ~_1120;
    int _1590 = _1588 + _1232;
    int _1592 = _1590 + 1;
    float _1594 = _1582 * (-2.0);
    float _1596 = -_1584;
    float _1598 = -_1568;
    float _1600 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1598);
    float _1602 = trunc(_1504);
    int _1604 = int(_1602);
    float _1606 = fma(_1346, _1594, _1346);
    float _1608 = fma(_1594, _1544, _1544);
    float _1610 = _1572 * (-2.0);
    float _1612 = _1586 * (-2.0);
    int _1614 = abs(_869);
    float _1616 = fma(_1294, _1610, _1294);
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1620 = fma(_1610, _1546, _1546);
    int _1622 = ~_1110;
    int _1624 = _1622 + _1224;
    int _1626 = _1624 + 1;
    float _1628 = trunc(_1492);
    int _1630 = int(_1628);
    float _1632 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1618);
    float _1634 = _131 + (-0.5);
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1638 = _731 * _1592;
    int _1640 = _1638 + _853;
    float _1642 = fma(_1290, _1612, _1290);
    float _1644 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1608);
    int _1646 = _777 * _1626;
    int _1648 = _1646 + _899;
    float _1650 = trunc(_1520);
    int _1652 = int(_1650);
    bool _1654 = !_1242;
    int _1656 = _1654 ? 0 : 1;
    float _1658 = fma(_1218, _1606, _1644);
    float _1660 = fma(_1612, _1548, _1548);
    float _1662 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1636);
    bool _1664 = _777 == 0;
    float _1666 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1668 = _701 + (-0.5);
    int _1670 = _1630 * _1580;
    int _1672 = _1670 + _899;
    float _1674 = _705 + (-0.5);
    int _1676 = _1578 * _1614;
    int _1678 = _1676 + _853;
    int _1680 = ~_1604;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1620);
    bool _1688 = !_1664;
    int _1690 = _1688 ? _1648 : (-1);
    float _1692 = trunc(_1506);
    int _1694 = int(_1692);
    float _1696 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1660);
    bool _1698 = !_1238;
    int _1700 = _1698 ? 0 : 1;
    float _1702 = _1542 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1704 = float(uint(_1672));
    int _1706 = _1690 * _1684;
    bool _1708 = _731 == 0;
    float _1710 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1476);
    int _1712 = _777 + (-1);
    float _1714 = as_type<float>(_913) * _1704;
    int _1716 = ~_1652;
    int _1718 = _1716 + 1;
    int _1720 = _1718 + 1;
    float _1722 = _1560 * _1666;
    bool _1724 = !_1708;
    int _1726 = _1724 ? _1640 : (-1);
    int _1728 = _1604 * _1712;
    int _1730 = _1728 + _1706;
    int _1732 = abs(_919);
    float _1734 = in.m_66.x;
    float _1736 = in.m_66.y;
    float _1738 = float(uint(_1678));
    float _1740 = fma(_1218, _1616, _1686);
    int _1742 = _1726 * _1720;
    int _1744 = abs(_833);
    float _1746 = trunc(_1508);
    int _1748 = int(_1746);
    int _1750 = _731 + (-1);
    int _1752 = _1730 * _1732;
    int _1754 = abs(_1656);
    float _1756 = as_type<float>(_895) * _1738;
    int _1758 = abs(_1076);
    int _1760 = _1694 * _1744;
    int _1762 = _1760 + _1752;
    int _1764 = _1652 * _1750;
    int _1766 = _1764 + _1742;
    int _1768 = abs(_1700);
    int _1770 = _1672 * _1758;
    int _1772 = _1770 + _1762;
    int _1774 = abs(_845);
    int _1776 = _1766 * _1754;
    bool _1778 = !_1246;
    int _1780 = _1778 ? 0 : 1;
    float _1782 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1486);
    int _1784 = _1630 * _1774;
    int _1786 = _1784 + _1772;
    int _1788 = abs(_1780);
    float _1790 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _1792 = !_1250;
    int _1794 = _1792 ? 0 : 1;
    int _1796 = _1748 * _1768;
    int _1798 = _1796 + _1776;
    float _1800 = float(uint(_1786));
    float _1802 = _1564 * _1736;
    int _1804 = abs(_1794);
    int _1806 = _1678 * _1788;
    int _1808 = _1806 + _1798;
    float _1810 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1632);
    float _1812 = as_type<float>(_913) * _1800;
    float _1814 = trunc(_1714);
    float _1816 = precise::max(_1814, 0.0);
    uint _1818 = uint(_1816);
    int _1820 = _1578 * _1804;
    int _1822 = _1820 + _1808;
    float _1824 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1782);
    float _1826 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1662);
    float _1828 = _1212 + 0.5;
    float _1830 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1528);
    float _1832 = -_1824;
    float _1834 = _1832 + 1.0;
    float _1836 = _1702 * _1790;
    float _1838 = trunc(_1812);
    float _1840 = precise::max(_1838, 0.0);
    uint _1842 = uint(_1840);
    float _1844 = _1552 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1846 = -_145;
    float _1848 = fma(_1846, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1534);
    float _1850 = -_1810;
    float _1852 = _1850 + 1.0;
    float _1854 = fma(_1218, _1642, _1696);
    float _1856 = -_1826;
    float _1858 = _1856 + 1.0;
    float _1860 = fma(_1080, _1834, _1600);
    float _1862 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1848);
    float _1864 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1866 = -_1830;
    float _1868 = _1866 + 1.0;
    int _1870 = ~_777;
    int _1872 = _1870 + 1;
    float _1874 = -_1852;
    float _1876 = fma(_865, _1874, _1422);
    float _1878 = float(uint(_1822));
    float _1880 = fma(_1008, _1858, _1440);
    int _1882 = ~_777;
    int _1884 = _1882 + 1;
    float _1886 = -_1868;
    float _1888 = fma(_1212, _1886, _1862);
    int _1890 = _1872 * int(_1842);
    int _1892 = _1890 + _1786;
    float _1894 = as_type<float>(_895) * _1878;
    float _1896 = trunc(_1756);
    float _1898 = precise::max(_1896, 0.0);
    uint _1900 = uint(_1898);
    int _1902 = _1884 * int(_1818);
    int _1904 = _1902 + _1672;
    out.m_70.x = _1876;
    out.m_70.y = _1880;
    out.m_70.z = _1888;
    out.m_70.w = _1860;
    float _1906 = _1658 * 0.15915493667125701904296875;
    float _1908 = _1740 * 0.15915493667125701904296875;
    float _1910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _403);
    float _1912 = _1844 * _1864;
    float _1914 = fma(_1722, 0.5, 0.5);
    float _1916 = fma(_1836, 0.5, 0.5);
    float _1918 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1920 = _1854 * 0.15915493667125701904296875;
    float _1922 = trunc(_1894);
    float _1924 = precise::max(_1922, 0.0);
    uint _1926 = uint(_1924);
    float _1928 = float(uint(_1904));
    float _1930 = fma(_1912, 0.5, 0.5);
    float _1932 = _1918 * _1910;
    int _1934 = ~_731;
    int _1936 = _1934 + 1;
    float _1938 = _1710 * _1734;
    float _1940 = float(uint(_1892));
    float _1942 = as_type<float>(_913) * _1928;
    float _1944 = _1906 * 6.283185482025146484375;
    float _1946 = sin(_1944);
    float _1948 = as_type<float>(_913) * _1940;
    int _1950 = ~_731;
    int _1952 = _1950 + 1;
    int _1954 = _1936 * int(_1900);
    int _1956 = _1954 + _1678;
    int _1958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1960 = _1958 != 0;
    float _1962 = _1906 * 6.283185482025146484375;
    float _1964 = cos(_1962);
    int _1966 = _1952 * int(_1926);
    int _1968 = _1966 + _1822;
    bool _1970 = !_1960;
    int _1972 = _1970 ? 0 : 1;
    float _1974 = _1908 * 6.283185482025146484375;
    float _1976 = sin(_1974);
    float _1978 = _1908 * 6.283185482025146484375;
    float _1980 = cos(_1978);
    float _1982 = floor(_1914);
    float _1984 = _1964 * _1976;
    float _1986 = _1946 * _1976;
    float _1988 = floor(_1916);
    float _1990 = _1946 * _1980;
    float _1992 = _1920 * 6.283185482025146484375;
    float _1994 = cos(_1992);
    float _1996 = -_1982;
    float _1998 = _1914 + _1996;
    float _2000 = _1964 * _1980;
    float _2002 = floor(_1930);
    float _2004 = -_1988;
    float _2006 = _1916 + _2004;
    float _2008 = _1920 * 6.283185482025146484375;
    float _2010 = sin(_2008);
    float _2012 = _1946 * _1994;
    float _2014 = float(uint(_1968));
    float _2016 = as_type<float>(_895) * _2014;
    float _2018 = trunc(_1948);
    float _2020 = precise::max(_2018, 0.0);
    uint _2022 = uint(_2020);
    float _2024 = float(uint(_1956));
    float _2026 = _1980 * _1994;
    float _2028 = -_2002;
    float _2030 = _1930 + _2028;
    float _2032 = _1964 * _1994;
    float _2034 = fma(_2030, 2.0, -1.0);
    float _2036 = trunc(_1942);
    float _2038 = precise::max(_2036, 0.0);
    uint _2040 = uint(_2038);
    float _2042 = -_1984;
    float _2044 = fma(_2010, _1990, _2042);
    float _2046 = -_1990;
    float _2048 = fma(_2010, _1984, _2046);
    float _2050 = fma(_2006, 2.0, -1.0);
    float _2052 = _1976 * _1994;
    float _2054 = as_type<float>(_895) * _2024;
    float _2056 = fma(_1998, 2.0, -1.0);
    float _2058 = _2050 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _2060 = int(_1842) + int(_2022);
    float _2062 = trunc(_2054);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    int _2068 = ~_777;
    int _2070 = _2068 + 1;
    float _2072 = _2058 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _2074 = _2058 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2076 = _2058 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _2078 = fma(_2010, _2000, _1986);
    int _2080 = _2070 * _2060;
    int _2082 = _2080 + _1786;
    float _2084 = fma(_2010, _1986, _2000);
    float _2086 = trunc(_2016);
    float _2088 = precise::max(_2086, 0.0);
    uint _2090 = uint(_2088);
    float _2092 = _2056 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _2094 = int(_1818) + int(_2040);
    float _2096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _395);
    bool _2098 = uint(_2082) >= uint(_777);
    float _2100 = fma(_2092, (*spvDescriptorSet0.vp_c12)._m0[2].x, _2072);
    float _2102 = fma(_2092, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2074);
    float _2104 = fma(_2092, (*spvDescriptorSet0.vp_c12)._m0[2].z, _2076);
    bool _2106 = !_2098;
    int _2108 = _2106 ? 0 : (-1);
    float _2110 = _1938 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2112 = int(_1900) + int(_2066);
    float _2114 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2116 = ~_2060;
    int _2118 = _2116 + _2108;
    int _2120 = _2118 + 1;
    int _2122 = ~_731;
    int _2124 = _2122 + 1;
    float _2126 = -_2010;
    float _2128 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2114);
    int _2130 = int(_1926) + int(_2090);
    int _2132 = _777 * _2120;
    int _2134 = _2132 + _1786;
    float _2136 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2138 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2140 = _2110 * _2096;
    int _2142 = _2124 * _2130;
    int _2144 = _2142 + _1822;
    bool _2146 = !_1664;
    int _2148 = _2146 ? _2134 : (-1);
    float _2150 = -_2010;
    float _2152 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2136);
    float _2154 = -_2010;
    float _2156 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2138);
    float _2158 = _2032 * _1932;
    int _2160 = _2148 & 3;
    bool _2162 = _2160 != 0;
    float _2164 = -_1932;
    float _2166 = _2010 * _2164;
    bool _2168 = uint(_2144) >= uint(_731);
    float _2170 = fma(_2078, _2140, _2158);
    int _2172 = _2162 ? 0 : 1;
    float _2174 = fma(_2026, _2140, _2166);
    int _2176 = _2148 & 3;
    bool _2178 = _2176 != 0;
    float _2180 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2128);
    bool _2182 = !_2168;
    int _2184 = _2182 ? 0 : (-1);
    float _2186 = _2012 * _1932;
    bool _2188 = uint(_2176) > 1u;
    float _2190 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2192 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2194 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2152);
    float _2196 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2198 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2200 = fma(_2044, _2140, _2186);
    float _2202 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2192);
    float _2204 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2156);
    float _2206 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2190);
    float _2208 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2196);
    float _2210 = fma(_2052, _2198, _2174);
    int _2212 = ~_2130;
    int _2214 = _2212 + _2184;
    int _2216 = _2214 + 1;
    float _2218 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2220 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2222 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2224 = ~_2172;
    int _2226 = _2224 + 1;
    int _2228 = _2226 + 1;
    float _2230 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2218);
    int _2232 = _2228;
    float _2234 = _2056;
    float _2236 = _2050;
    float _2238 = _2050;
    if (!_2188)
    {
        int _2240 = ~_2172;
        int _2242 = _2240 + 1;
        _2232 = _2242;
    }
    int _2244 = _2232;
    float _2246 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2220);
    float _2248 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2222);
    int _2250 = ~_777;
    int _2252 = _2250 + 1;
    int _2254 = _731 * _2216;
    int _2256 = _2254 + _1822;
    bool _2258 = uint(_2176) >= 2u;
    float _2260 = fma(_2048, _2198, _2170);
    float _2262 = fma(_2084, _2198, _2200);
    int _2264 = _2148 >> 31;
    float _2266 = _403 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2268 = !_1708;
    int _2270 = _2268 ? _2256 : (-1);
    int _2272 = _2252 * _2094;
    int _2274 = _2272 + _1672;
    int _2276 = _2258 ? 0 : 1;
    float _2278 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2230);
    bool _2280 = _2176 != 3;
    float _2282 = _395 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2284 = _2264 & 3;
    float _2286 = _2266 * _2180;
    int _2288 = _2270 >> 31;
    float _2290 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2246);
    int _2292 = _2148 + _2284;
    float _2294 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2248);
    int _2296 = _2288 & 3;
    int _2298 = ~_731;
    int _2300 = _2298 + 1;
    int _2302 = _2270 + _2296;
    int _2304 = _2292 >> 2;
    int _2306 = ~_2276;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = _2310;
    if (_2280)
    {
        int _2314 = ~_2276;
        int _2316 = _2314 + 1;
        _2312 = _2316;
    }
    int _2318 = _2312;
    int _2320 = _2302 >> 2;
    int _2322 = _2300 * _2112;
    int _2324 = _2322 + _1678;
    int _2326 = _2304 << 4;
    int _2328 = _2326 + 368;
    float _2330 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2206);
    bool _2332 = uint(_2274) >= uint(_777);
    int _2334 = _2320 << 4;
    int _2336 = _2334 + 512;
    uint _2338 = uint(int(uint(_2328) >> uint(2)));
    uint _2340 = uint(int(uint(int(_2338)) >> uint(2)));
    int _2342 = int(_2338) & 3;
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[int(_2340)][_2342];
    int _2346 = int(_2338) + 1;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    int _2350 = _2346 & 3;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[int(_2348)][_2350];
    bool _2354 = !_2332;
    int _2356 = _2354 ? 0 : (-1);
    float _2358 = fma(_2282, _2330, _2286);
    bool _2360 = uint(_2324) >= uint(_731);
    float _2362 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2202);
    float _2364 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2208);
    int _2366 = ~_2094;
    int _2368 = _2366 + _2356;
    int _2370 = _2368 + 1;
    float _2372 = _2266 * _2194;
    uint _2374 = uint(int(uint(_2336) >> uint(2)));
    uint _2376 = uint(int(uint(int(_2374)) >> uint(2)));
    int _2378 = int(_2374) & 3;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[int(_2376)][_2378];
    int _2382 = int(_2374) + 1;
    uint _2384 = uint(int(uint(_2382) >> uint(2)));
    int _2386 = _2382 & 3;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[int(_2384)][_2386];
    bool _2390 = !_2178;
    int _2392 = _2390 ? 0 : 1;
    out.m_72.x = _2330;
    out.m_72.y = _2362;
    out.m_72.z = _2364;
    int _2394 = _2270 & 3;
    bool _2396 = _2394 != 0;
    float _2398 = fma(_2282, _2362, _2372);
    bool _2400 = !_2360;
    int _2402 = _2400 ? 0 : (-1);
    int _2404 = _777 * _2370;
    int _2406 = _2404 + _1672;
    bool _2408 = uint(_2394) > 1u;
    int _2410 = _2328 + 8;
    uint _2412 = uint(int(uint(_2410) >> uint(2)));
    uint _2414 = uint(int(uint(int(_2412)) >> uint(2)));
    int _2416 = int(_2412) & 3;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[int(_2414)][_2416];
    int _2420 = int(_2412) + 1;
    uint _2422 = uint(int(uint(_2420) >> uint(2)));
    int _2424 = _2420 & 3;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[int(_2422)][_2424];
    int _2428 = _2270 & 3;
    bool _2430 = _2428 != 0;
    float _2432 = _2266 * _2204;
    int _2434 = ~_2112;
    int _2436 = _2434 + _2402;
    int _2438 = _2436 + 1;
    int _2440 = _2430 ? 0 : 1;
    float _2442 = fma(_2282, _2364, _2432);
    int _2444 = abs(_2392);
    int _2446 = _2336 + 8;
    uint _2448 = uint(int(uint(_2446) >> uint(2)));
    uint _2450 = uint(int(uint(int(_2448)) >> uint(2)));
    int _2452 = int(_2448) & 3;
    float _2454 = (*spvDescriptorSet0.vp_c9)._m0[int(_2450)][_2452];
    int _2456 = int(_2448) + 1;
    uint _2458 = uint(int(uint(_2456) >> uint(2)));
    int _2460 = _2456 & 3;
    float _2462 = (*spvDescriptorSet0.vp_c9)._m0[int(_2458)][_2460];
    int _2464 = ~_2440;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    int _2470 = _731 * _2438;
    int _2472 = _2470 + _1678;
    bool _2474 = !_2396;
    int _2476 = _2474 ? 0 : 1;
    float _2478 = _2294 + _2442;
    int _2480 = _2468;
    if (!_2408)
    {
        int _2482 = ~_2440;
        int _2484 = _2482 + 1;
        _2480 = _2484;
    }
    int _2486 = _2480;
    int _2488 = abs(_2244);
    bool _2490 = _2394 != 3;
    int _2492 = abs(_2486);
    int _2494 = ~_2488;
    int _2496 = _2494 + 1;
    int _2498 = _2496 + 1;
    int _2500 = abs(_2476);
    bool _2502 = uint(_2394) >= 2u;
    int _2504 = ~_2492;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    int _2510 = abs(_2318);
    int _2512 = _2498 * as_type<int>(_2352);
    int _2514 = ~_2444;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    int _2520 = _2502 ? 0 : 1;
    int _2522 = ~_2500;
    int _2524 = _2522 + 1;
    int _2526 = _2524 + 1;
    int _2528 = _2508 * as_type<int>(_2388);
    int _2530 = ~_2510;
    int _2532 = _2530 + 1;
    int _2534 = _2532 + 1;
    int _2536 = _2518 * as_type<int>(_2344);
    int _2538 = _2536 + _2512;
    int _2540 = ~_2520;
    int _2542 = _2540 + 1;
    int _2544 = _2542 + 1;
    float _2546 = fma(_2266, _2266, 1.0);
    bool _2548 = _2394 != 3;
    int _2550 = _2526 * as_type<int>(_2380);
    int _2552 = _2550 + _2528;
    int _2554 = _2544;
    if (_2490)
    {
        int _2556 = ~_2520;
        int _2558 = _2556 + 1;
        _2554 = _2558;
    }
    int _2560 = _2554;
    int _2562 = _2534 * as_type<int>(_2418);
    int _2564 = _2562 + _2538;
    bool _2566 = _2176 != 3;
    float _2568 = rsqrt(_2546);
    bool _2570 = !_2548;
    int _2572 = _2570 ? 0 : (-1);
    int _2574 = abs(_2560);
    bool _2576 = !_2566;
    int _2578 = _2576 ? 0 : (-1);
    bool _2580 = !_1206;
    int _2582 = _2580 ? 0 : 1;
    int _2584 = abs(_1972);
    int _2586 = abs(_2572);
    int _2588 = abs(_2578);
    float _2590 = _2266 * _2568;
    int _2592 = abs(_2582);
    int _2594 = ~_2574;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    int _2600 = ~_2588;
    int _2602 = _2600 + 1;
    int _2604 = _2602 + 1;
    int _2606 = _2598 * as_type<int>(_2454);
    int _2608 = _2606 + _2552;
    int _2610 = _2604 * as_type<int>(_2426);
    int _2612 = _2610 + _2564;
    int _2614 = ~_2586;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    float _2620 = -_2294;
    float _2622 = _2590 * _2620;
    int _2624 = ~_2584;
    int _2626 = _2624 + 1;
    int _2628 = _2626 + 1;
    int _2630 = ~_2592;
    int _2632 = _2630 + 1;
    int _2634 = _2632 + 1;
    int _2636 = _2618 * as_type<int>(_2462);
    int _2638 = _2636 + _2608;
    bool _2640 = !_1664;
    int _2642 = _2640 ? _2406 : (-1);
    int _2644 = _2612 * _2628;
    float _2646 = -_2278;
    float _2648 = _2590 * _2646;
    int _2650 = _2638 * _2634;
    float _2652 = -_2290;
    float _2654 = _2590 * _2652;
    int _2656 = _2642 * _2584;
    int _2658 = _2656 + _2644;
    float _2660 = fma(_2568, _2180, _2648);
    float _2662 = _2290 + _2398;
    float _2664 = fma(_2568, _2194, _2654);
    float _2666 = _2278 + _2358;
    bool _2668 = !_1708;
    int _2670 = _2668 ? _2472 : (-1);
    float _2672 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2674 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _2676 = isnan(1.0);
    bool _2678 = _2674 || _2676;
    bool _2680 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2682 = _2678 || _2680;
    float _2684 = fma(_2568, _2204, _2622);
    out.m_74.x = _2666;
    out.m_74.y = _2662;
    out.m_74.z = _2478;
    int _2686 = _2670 * _2592;
    int _2688 = _2686 + _2650;
    float _2690 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2692 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2694 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2672);
    float _2696 = _2034 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2698 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2690);
    float _2700 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2692);
    float _2702 = float(_2658);
    float _2704 = fma(_2696, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2100);
    float _2706 = float(_2688);
    float _2708 = fma(_2696, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2102);
    float _2710 = fma(_2696, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2104);
    float _2712 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2694);
    float _2714 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2698);
    float _2716 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2700);
    out.m_76.x = _2660;
    out.m_76.y = _2664;
    out.m_76.z = _2684;
    float _2718 = _2704 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2720 = _2712 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2722 = _2714 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_78.x = _2702;
    out.m_78.y = _2706;
    float _2724 = _2720 + _2718;
    float _2726 = _2708 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2728 = _2710 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2730 = _2716 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2732 = _2722 + _2726;
    float _2734 = _2730 + _2728;
    float _2736 = _2730;
    float _2738 = _2720;
    float _2740 = _2702;
    float _2742 = _2730;
    float _2744 = _2702;
    float _2746 = _2720;
    float _2748 = _2660;
    float _2750 = _2716;
    float _2752 = _2734;
    float _2762;
    float _2764;
    float _2766;
    float _2768;
    if (!_2682)
    {
        bool _2754 = _2726 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2756 = !_2754;
        _2758 = _2756;
        if (!_2758)
        {
            float _2760 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _2762 = _2760;
            _2764 = 0.0;
            _2766 = 0.0;
            _2768 = 0.0;
            _2770 = true;
        }
    }
    if ((!_2770) || _2758)
    {
        bool _2808;
        if (!_2758)
        {
            bool _2772 = _2726 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2774 = isnan(_2726);
            bool _2776 = _2772 || _2774;
            bool _2778 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2780 = _2776 || _2778;
            bool _2782 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2784 = !_2780;
            bool _2786 = _2782 && _2784;
            bool _2788 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _2790 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2786)
            {
                _2736 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2792 = _2736;
            float _2794 = _2792;
            if (_2786)
            {
                _2738 = 0.0;
            }
            float _2796 = _2738;
            _2746 = _2796;
            _2764 = _2796;
            if (_2786)
            {
                _2740 = 0.0;
            }
            float _2798 = _2740;
            _2744 = _2798;
            _2766 = _2798;
            if (_2786)
            {
                float _2800 = _2792 * 5.0;
                _2794 = _2800;
            }
            float _2802 = _2794;
            _2742 = _2802;
            _2762 = _2802;
            if (_2786)
            {
                _2790 = 0.0;
            }
            float _2804 = _2790;
            bool _2806 = !_2780;
            _2808 = _2806 && _2788;
            _2748 = _2804;
            _2768 = _2804;
        }
        if ((!_2808) || _2758)
        {
            _2758 = false;
            float _2810 = _2742;
            float _2812 = _2744;
            float _2814 = _2746;
            float _2816 = _2748;
            bool _2818 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2820 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2822 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2824 = _2810;
            float _2826 = _2812;
            float _2828 = _2814;
            float _2830 = _2816;
            if (_2818)
            {
                float _2832 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2824 = _2832;
            }
            float _2834 = _2824;
            if (_2818)
            {
                float _2836 = abs(_2056);
                float _2838 = -_2836;
                float _2840 = _2838 + 1.0;
                _2234 = _2840;
            }
            float _2842 = _2234;
            if (_2820)
            {
                float _2844 = abs(_2050);
                float _2846 = -_2844;
                float _2848 = _2846 + 1.0;
                _2236 = _2848;
            }
            float _2850 = _2236;
            _2238 = _2850;
            if (!_2818)
            {
                _2826 = 1.0;
            }
            float _2852 = _2826;
            float _2854 = _2852;
            if (!_2820)
            {
                _2828 = 1.0;
            }
            float _2856 = _2828;
            float _2858 = _2856;
            if (!_2822)
            {
                _2830 = 1.0;
            }
            float _2860 = _2830;
            float _2862 = _2690;
            float _2864 = _2860;
            if (_2820)
            {
                float _2866 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2862 = _2866;
            }
            float _2868 = _2862;
            float _2870 = _2722;
            if (_2822)
            {
                float _2872 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2870 = _2872;
            }
            float _2874 = _2870;
            float _2876 = _2834;
            if (_2818)
            {
                float _2878 = _2842 * _2834;
                float _2880 = precise::clamp(_2878, 0.0, 1.0);
                _2854 = _2880;
            }
            float _2882 = _2854;
            if (_2822)
            {
                float _2884 = abs(_2034);
                float _2886 = -_2884;
                float _2888 = _2886 + 1.0;
                _2876 = _2888;
            }
            float _2890 = _2876;
            if (_2820)
            {
                float _2892 = _2850 * _2868;
                float _2894 = precise::clamp(_2892, 0.0, 1.0);
                _2858 = _2894;
            }
            float _2896 = _2858;
            if (_2822)
            {
                float _2898 = _2890 * _2874;
                float _2900 = precise::clamp(_2898, 0.0, 1.0);
                _2864 = _2900;
            }
            float _2902 = _2864;
            float _2904 = _2882 * _2896;
            float _2906 = _2904 * _2902;
            _2762 = _2734;
            _2764 = _2724;
            _2766 = _2732;
            _2768 = _2906;
        }
    }
    _2770 = false;
    float _2908 = _2762;
    float _2910 = _2764;
    float _2912 = _2766;
    float _2914 = _2238;
    float _2916 = _2768;
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2920 = _2908 + _2918;
    float _2922 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2924 = _2910 + _2922;
    float _2926 = _2920 * _2920;
    float _2928 = fma(_2924, _2924, _2926);
    float _2930 = sqrt(_2928);
    bool _2932 = _2930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _2934 = !_2932;
    float _2936 = _2912;
    float _2938 = _2910;
    float _2940 = _2908;
    float _2942 = _2914;
    float _2944 = _2924;
    if (!_2934)
    {
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2950 = _2930 + _2948;
        float _2952 = rsqrt(_2928);
        float _2954 = _2950 * _2946;
        float _2956 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2958 = _2954 * 0.15915493667125701904296875;
        float _2960 = _2958 * 6.283185482025146484375;
        float _2962 = cos(_2960);
        float _2964 = _2958 * 6.283185482025146484375;
        float _2966 = sin(_2964);
        float _2968 = _2962 + (-1.0);
        float _2970 = fma(_2966, _2956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2972 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2974 = _2952 * _2970;
        float _2976 = fma(_2962, _2912, _2972);
        float _2978 = fma(_2924, _2974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2980 = fma(_2920, _2974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2936 = _2976;
        _2938 = _2978;
        _2940 = _2980;
    }
    float _2982 = _2936;
    float _2984 = _2938;
    float _2986 = _2940;
    float _2988 = -_2726;
    float _2990 = _2988 + _2982;
    float _2992 = -_2718;
    float _2994 = _2992 + _2984;
    float _2996 = -_2728;
    float _2998 = _2996 + _2986;
    float _3000 = _2990 * _2990;
    float _3002 = fma(_2994, _2994, _3000);
    float _3004 = fma(_2998, _2998, _3002);
    float _3006 = sqrt(_3004);
    bool _3008 = _3006 > 0.0;
    bool _3010 = !_3008;
    float _3012 = _3006;
    float _3014 = _2984;
    float _3016 = _2986;
    float _3018 = _2982;
    if (!_3010)
    {
        bool _3020 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3022 = _2704;
        if (_3020)
        {
            float _3024 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3022 = _3024;
        }
        float _3026 = _3022;
        if (_3020)
        {
            _2942 = _663;
        }
        float _3028 = _2942;
        float _3030 = _3028;
        if (_3020)
        {
            _2944 = _665;
        }
        float _3032 = _2944;
        float _3034 = _3032;
        if (_3020)
        {
            _3012 = _667;
        }
        float _3036 = _3012;
        float _3038 = _3026;
        float _3040 = _3036;
        if (_3020)
        {
            float _3042 = _663 * _3026;
            _2750 = _3042;
        }
        float _3044 = _2750;
        float _3046 = _3044;
        if (_3020)
        {
            float _3048 = _665 * _3026;
            _2752 = _3048;
        }
        float _3050 = _2752;
        float _3052 = _3050;
        if (_3020)
        {
            float _3054 = _667 * _3026;
            _3038 = _3054;
        }
        float _3056 = _3038;
        float _3058 = _3056;
        if (!_3020)
        {
            bool _3060 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3062 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3064 = _3060 || _3062;
            bool _3066 = isnan(1.0);
            bool _3068 = _3064 || _3066;
            float _3070 = _145 + 1.0;
            if (!_3068)
            {
                float _3072 = _3070 * _3070;
                float _3074 = _3072 * 0.5;
                _147 = _3074;
            }
            float _3076 = _147;
            float _3078 = _3076;
            if (!_3068)
            {
                float _3080 = _3076 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3078 = _3080;
            }
            float _3082 = _3078;
            bool _3084 = !_3068;
            float _3086 = _3082;
            if (!_3084)
            {
                float _3088 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3090 = log2(_3088);
                float _3092 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3094 = 1.0 + _3092;
                float _3096 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3098 = _3090 * _3070;
                float _3100 = 1.0 / _3094;
                float _3102 = _3096 * 0.693147182464599609375;
                float _3104 = exp2(_3098);
                float _3106 = 1.0 / _3102;
                float _3108 = _3104 + (-1.0);
                float _3110 = -_3108;
                float _3112 = fma(_3110, _3106, _3070);
                float _3114 = _3112 * _3100;
                float _3116 = _3114 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3086 = _3116;
            }
            float _3118 = _3086;
            float _3120 = _3118 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _3122 = _3118 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3124 = _3118 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3126 = _3118;
            if (!_3068)
            {
                _3126 = _3070;
            }
            float _3128 = _3126;
            float _3130 = _3120 * _387;
            float _3132 = _3120 * _311;
            float _3134 = _3120 * _413;
            float _3136 = fma(_3122, _379, _3130);
            float _3138 = fma(_3122, _307, _3132);
            float _3140 = fma(_3124, _391, _3136);
            bool _3142 = !_3068;
            float _3144 = _3128;
            if (!_3142)
            {
                float _3146 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3148 = log2(_3146);
                float _3150 = _3148 * _3070;
                float _3152 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3154 = 1.0 + _3152;
                float _3156 = exp2(_3150);
                float _3158 = 1.0 / _3154;
                float _3160 = -_3156;
                float _3162 = _3160 + 1.0;
                float _3164 = _3162 * _3158;
                _3144 = _3164;
            }
            float _3166 = _3144;
            float _3168 = fma(_3122, _409, _3134);
            float _3170 = fma(_3124, _315, _3138);
            float _3172 = fma(_3166, _263, _3140);
            float _3174 = fma(_3124, _417, _3168);
            float _3176 = fma(_3166, _261, _3170);
            float _3178 = -_625;
            float _3180 = _3178 + _3172;
            float _3182 = fma(_3166, _265, _3174);
            float _3184 = -_629;
            float _3186 = _3184 + _3176;
            float _3188 = _3180 * _175;
            float _3190 = _3180 * _169;
            float _3192 = _3180 * _181;
            float _3194 = -_631;
            float _3196 = _3194 + _3182;
            float _3198 = fma(_3186, _173, _3188);
            float _3200 = fma(_3186, _167, _3190);
            float _3202 = fma(_3186, _179, _3192);
            float _3204 = fma(_3196, _177, _3198);
            float _3206 = fma(_3196, _171, _3200);
            float _3208 = fma(_3196, _183, _3202);
            _3034 = _3206;
            _3030 = _3204;
            _3040 = _3208;
            _3046 = _3204;
            _3052 = _3206;
            _3058 = _3208;
            _423 = _3182;
            _381 = _3180;
        }
        float _3210 = _3034;
        float _3212 = _3030;
        float _3214 = _3040;
        float _3216 = _3046;
        float _3218 = _3052;
        float _3220 = _3058;
        float _3222 = _423;
        float _3224 = _381;
        float _3226 = _3210 * _3210;
        float _3228 = rsqrt(_3004);
        float _3230 = fma(_3212, _3212, _3226);
        float _3232 = fma(_3214, _3214, _3230);
        float _3234 = sqrt(_3232);
        float _3236 = _2994 * _3228;
        float _3238 = _2990 * _3228;
        float _3240 = _2998 * _3228;
        bool _3242 = _3234 > 0.0;
        bool _3244 = !_3242;
        _425 = _3234;
        _427 = _3222;
        _383 = _3224;
        if (!_3244)
        {
            float _3246 = rsqrt(_3232);
            float _3248 = _3246 * _3210;
            float _3250 = _3246 * _3212;
            float _3252 = _3246 * _3214;
            float _3254 = _3238 * _3248;
            float _3256 = fma(_3236, _3250, _3254);
            float _3258 = fma(_3240, _3252, _3256);
            float _3260 = _3258 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3262 = fma(_3216, _3260, _2984);
            float _3264 = fma(_3218, _3260, _2982);
            float _3266 = fma(_3220, _3260, _2986);
            _3014 = _3262;
            _3016 = _3266;
            _3018 = _3264;
            _425 = _3260;
            _427 = _3248;
        }
    }
    float _3268 = _3014;
    float _3270 = _3016;
    float _3272 = _3018;
    float _3274 = _425;
    float _3276 = _427;
    float _3278 = _383;
    float _3280 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3282 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3284 = isnan(0.5);
    bool _3286 = _3282 || _3284;
    bool _3288 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3290 = _3286 || _3288;
    bool _3292 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3294 = isnan(0.5);
    bool _3296 = _3292 || _3294;
    bool _3298 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3300 = _3296 || _3298;
    float _3302 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3280);
    float _3304 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3306 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3302);
    float _3308 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3304);
    float _3310 = _3306 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3312 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3308);
    float _3314 = _3274;
    float _3316 = _3276;
    float _3318 = _3306;
    float _3320 = _3278;
    if (_3290)
    {
        _3314 = _3268;
    }
    float _3322 = _3314;
    float _3324 = 1.0 / _3310;
    float _3326 = _3312 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3328 = _3326;
    float _3330 = _3322;
    if (_3290)
    {
        _3316 = _3270;
    }
    float _3332 = _3316;
    float _3334 = _3326 + _3310;
    float _3336 = _3332;
    if (_3290)
    {
        _3328 = _3272;
    }
    float _3338 = _3328;
    float _3340 = _3338;
    if (!_3290)
    {
        float _3342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3344 = _2726 + _3342;
        float _3346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3348 = _2718 + _3346;
        float _3350 = -_2718;
        float _3352 = _3350 + _3268;
        float _3354 = -_2726;
        float _3356 = _3354 + _3272;
        float _3358 = _3344 * _3344;
        float _3360 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3362 = _2728 + _3360;
        float _3364 = -_2728;
        float _3366 = _3364 + _3270;
        float _3368 = fma(_3348, _3348, _3358);
        float _3370 = fma(_3362, _3362, _3368);
        float _3372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3374 = sqrt(_3370);
        float _3376 = precise::min(_3374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3378 = _3376 * _3372;
        float _3380 = fma(_3352, _3378, _2718);
        float _3382 = fma(_3356, _3378, _2726);
        float _3384 = fma(_3366, _3378, _2728);
        _3340 = _3382;
        _3330 = _3380;
        _3336 = _3384;
        _3318 = _3374;
    }
    float _3386 = _3340;
    float _3388 = _3330;
    float _3390 = _3336;
    float _3392 = _3318;
    float _3394 = _3392;
    if (_3300)
    {
        _3394 = 1.0;
    }
    float _3396 = _3394;
    float _3398 = _3334 * _3324;
    float _3400 = _3398 * 0.5;
    float _3402 = _3396;
    if (!_3300)
    {
        float _3404 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3406 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3404);
        float _3408 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3410 = _3408 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _3412 = 1.0 / _3406;
        float _3414 = 1.0 / _3410;
        float _3416 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3418 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3420 = fma(_3412, _3416, _3418);
        float _3422 = _3420 * _3414;
        float _3424 = precise::clamp(_3422, 0.0, 1.0);
        _3402 = _3424;
    }
    float _3426 = _3402;
    float _3428 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3430 = _3386 + _3428;
    float _3432 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3434 = _3388 + _3432;
    float _3436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3438 = _3390 + _3436;
    float _3440 = _3430 * _3430;
    float _3442 = fma(_3434, _3434, _3440);
    float _3444 = fma(_3438, _3438, _3442);
    float _3446 = rsqrt(_3444);
    float _3448 = sqrt(_3444);
    float _3450 = _3446 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3452 = _3434 * _3450;
    float _3454 = _3438 * _3450;
    float _3456 = _3452 * _3452;
    float _3458 = _3454 * _3454;
    float _3460 = _3456 + _3458;
    float _3462 = sqrt(_3460);
    bool _3464 = _3462 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3468 = _3462 + _3466;
    float _3470 = _3446;
    float _3472 = _3468;
    float _3474 = _3430;
    if (_3464)
    {
        float _3476 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3470 = _3476;
    }
    float _3478 = _3470;
    float _3480 = _3478;
    if (_3464)
    {
        float _3482 = _3468 * _3478;
        _3472 = _3482;
    }
    float _3484 = _3472;
    if (_3464)
    {
        float _3486 = rsqrt(_3460);
        _3480 = _3486;
    }
    float _3488 = _3480;
    float _3490 = _3488;
    if (_3464)
    {
        float _3492 = _3484 * 0.15915493667125701904296875;
        _227 = _3492;
    }
    float _3494 = _227;
    float _3496 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3498 = _3438;
    float _3500 = _3494;
    if (_3464)
    {
        float _3502 = _3494 * 6.283185482025146484375;
        float _3504 = sin(_3502);
        _3498 = _3504;
    }
    float _3506 = _3498;
    float _3508 = precise::max(0.0, _3496);
    float _3510 = _175;
    float _3512 = _3508;
    if (_3464)
    {
        float _3514 = _3494 * 6.283185482025146484375;
        float _3516 = cos(_3514);
        _3510 = _3516;
    }
    float _3518 = _3510;
    float _3520 = -_3450;
    float _3522 = -_3508;
    float _3524 = fma(_3430, _3520, _3522);
    if (_3464)
    {
        float _3526 = _3524 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3474 = _3526;
    }
    float _3528 = _3474;
    float _3530 = _3506;
    float _3532 = _3528;
    if (_3464)
    {
        float _3534 = fma(_3506, _3528, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3530 = _3534;
    }
    float _3536 = _3530;
    float _3538 = _3536;
    if (!_3464)
    {
        _3532 = _3524;
    }
    float _3540 = _3532;
    float _3542 = _3540;
    if (_3464)
    {
        float _3544 = _3488 * _3536;
        _3320 = _3544;
    }
    float _3546 = _3320;
    if (!_3464)
    {
        _3490 = _3452;
    }
    float _3548 = _3490;
    float _3550 = _3548;
    float _3552 = _3518;
    if (_3464)
    {
        float _3554 = _3518 + (-1.0);
        _3512 = _3554;
    }
    float _3556 = _3512;
    float _3558 = _3556;
    if (_3464)
    {
        float _3560 = _3452 * _3546;
        _3550 = _3560;
    }
    float _3562 = _3550;
    if (!_3464)
    {
        _3538 = _3456;
    }
    float _3564 = _3538;
    float _3566 = _3386 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3568 = _3564;
    if (_3464)
    {
        float _3570 = _3556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3500 = _3570;
    }
    float _3572 = _3500;
    if (!_3464)
    {
        _3558 = _3454;
    }
    float _3574 = _3558;
    float _3576 = _3574;
    if (_3464)
    {
        float _3578 = _3454 * _3546;
        _3576 = _3578;
    }
    float _3580 = _3576;
    if (_3464)
    {
        float _3582 = _3562 * _3562;
        _3568 = _3582;
    }
    float _3584 = _3568;
    if (_3464)
    {
        float _3586 = fma(_3524, _3518, _3572);
        _3542 = _3586;
    }
    float _3588 = _3542;
    if (!_3464)
    {
        _3552 = _3458;
    }
    float _3590 = _3552;
    float _3592 = _3590;
    if (_3464)
    {
        float _3594 = _3580 * _3580;
        _3592 = _3594;
    }
    float _3596 = _3592;
    float _3598 = fma(_3588, _3588, _3584);
    float _3600 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3602 = _3598 + _3596;
    float _3604 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3606 = fma(_3448, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3604);
    float _3608 = precise::clamp(_3606, 0.0, 1.0);
    float _3610 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3566);
    float _3612 = _3386 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3614 = rsqrt(_3602);
    float _3616 = -_3608;
    float _3618 = _3616 + 1.0;
    float _3620 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3610);
    float _3622 = _3386 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3624 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3612);
    float _3626 = _3386 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3628 = _3620 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3630 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3622);
    float _3632 = abs(_3618);
    float _3634 = log2(_3632);
    float _3636 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3624);
    float _3638 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3626);
    float _3640 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3630);
    float _3642 = _3628 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3644 = _3636 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3646 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3638);
    float _3648 = _3640 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3650 = _3614 * _3562;
    float _3652 = _3644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3654 = _3646 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3656 = _3614 * _3588;
    float _3658 = _3650 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3660 = -_3642;
    float _3662 = fma(_3660, _3600, 1.0);
    float _3664 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3652);
    float _3666 = _3614 * _3580;
    float _3668 = _3634 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3670 = -_3658;
    float _3672 = fma(_3656, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3670);
    float _3674 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3664);
    float _3676 = log2(_3662);
    float _3678 = _3644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3680 = -_3666;
    float _3682 = fma(_3680, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3672);
    float _3684 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3674);
    float _3686 = _3644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3688 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3678);
    float _3690 = fma(_3682, -0.5, 0.5);
    float _3692 = exp2(_3668);
    float _3694 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3686);
    float _3696 = fma(_3682, 0.5, 0.5);
    float _3698 = _3656 + 1.0;
    float _3700 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3688);
    float _3702 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3694);
    float _3704 = fma(_3696, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3706 = 1.0 / _3684;
    float _3708 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3702);
    float _3710 = fma(_3696, _3704, -0.212114393711090087890625);
    float _3712 = _3676 * 0.693147182464599609375;
    float _3714 = fma(_3696, _3710, 1.570728778839111328125);
    float _3716 = sqrt(_3690);
    float _3718 = -_3656;
    float _3720 = fma(_3692, _3698, _3718);
    float _3722 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3700);
    float _3724 = _3712 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3726 = fma(_3720, 0.5, 0.5);
    float _3728 = _3708 * _3706;
    float _3730 = _3722 * _3706;
    float _3732 = fma(_3728, 0.5, 0.5);
    float _3734 = fma(_3730, -0.5, 0.5);
    float _3736 = _3716 * 0.636619746685028076171875;
    float3 _9888 = float3(_3732, _3734, _3724);
    float _3738 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9888, float3(0.0), isnan(_9888)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9888, float3(0.0), isnan(_9888)), level(0.0)).x;
    float _3740 = -_3714;
    float _3742 = fma(_3736, _3740, 1.0);
    float3 _9904 = float3(_3732, _3734, _3724);
    float4 _3745 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9904, float3(0.0), isnan(_9904)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9904, float3(0.0), isnan(_9904)), level(0.0)).xyzw;
    float _3747 = _3745.x;
    float _3749 = _3745.y;
    float _3751 = _3745.z;
    float _3753 = _3745.w;
    float2 _9921 = float2(_3742, _3726);
    float3 _3757 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9921, float2(0.0), isnan(_9921)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9921, float2(0.0), isnan(_9921)), level(0.0)).xyz;
    float _3759 = _3757.x;
    float _3761 = _3757.y;
    float _3763 = _3757.z;
    float _3765 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3767 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3769 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3771 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3773 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3765);
    float _3775 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3767);
    float _3777 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3769);
    float _3779 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3771);
    float _3781 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3773);
    float _3783 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3775);
    float _3785 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3777);
    float _3787 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3779);
    float _3789 = _3781 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3791 = _3783 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3793 = -_665;
    float _3795 = _3793 + _3386;
    float _3797 = _3785 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3799 = _3789 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3801 = _3789 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3803 = _3644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3805 = _3789 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3807 = fma(_3791, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3799);
    float _3809 = -_663;
    float _3811 = _3809 + _3388;
    float _3813 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    out.m_80.y = 1.0;
    float _3815 = fma(_3791, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3801);
    float _3817 = _3797 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3819 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3803);
    float _3821 = fma(_3791, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3805);
    float _3823 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3813);
    float _3825 = _3787 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3827 = _3817 + _3815;
    float _3829 = _3789 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3831 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3819);
    float _3833 = _3634 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3835 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3827);
    float _3837 = fma(_3791, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3829);
    float _3839 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3841 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3843 = -_667;
    float _3845 = _3843 + _3390;
    float _3847 = exp2(_3833);
    float _3849 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3839);
    float _3851 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3841);
    float _3853 = fma(_3797, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3837);
    float _3855 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3831);
    float _3857 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3823);
    float _3859 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3851);
    float _3861 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3853);
    float _3863 = 1.0 / _3835;
    float _3865 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3867 = _3859 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3869 = _3684 * 0.5;
    float _3871 = _3855 + _3684;
    out.gl_Position.x = _3708;
    out.gl_Position.y = _3722;
    out.gl_Position.z = _3855;
    out.gl_Position.w = _3684;
    float _3873 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3849);
    float _3875 = fma(_3722, -0.5, _3869);
    float _3877 = 1.0 / _3867;
    float _3879 = -_3847;
    float _3881 = _3879 + 1.0;
    out.m_82.x = _3388;
    out.m_82.y = _3386;
    out.m_82.z = _3390;
    float _3883 = _3797 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3885 = _3797 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3887 = _3881 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3889 = _3708 + _3684;
    float _3891 = _3861 * _3863;
    float _3893 = _3883 + _3807;
    float _3895 = _3885 + _3821;
    float _3897 = -_3887;
    float _3899 = _3897 + 1.0;
    float _3901 = _3871 * 0.5;
    bool _3903 = _3891 > 0.0;
    float _3905 = _3889 * 0.5;
    float _3907 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3909 = _3865 * _3877;
    bool _3911 = _3891 < 1.0;
    bool _3913 = _3911 && _3903;
    float _3915 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3893);
    float _3917 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3895);
    bool _3919 = _3728 > (-1.0);
    bool _3921 = _3919 && _3913;
    out.m_84.x = _3905;
    out.m_84.y = _3875;
    out.m_84.z = _3901;
    out.m_84.w = _3684;
    float _3923 = _3907 * _3877;
    bool _3925 = _3730 > (-1.0);
    bool _3927 = _3925 && _3921;
    bool _3929 = _3728 < 1.0;
    bool _3931 = _3929 && _3927;
    bool _3933 = _3730 < 1.0;
    bool _3935 = _3933 && _3931;
    float _3937 = _3915 * _3863;
    float _3939 = _3917 * _3863;
    float _3941 = _3887 * _3738;
    float _3943 = _3753 * _3941;
    float _3945 = _3763 * _3941;
    float _3947 = fma(_3759, _3943, _3747);
    float _3949 = fma(_3761, _3943, _3749);
    float _3951 = _3753 * _3899;
    float _3953 = fma(_3753, _3945, _3751);
    out.m_86.x = _3947;
    out.m_86.y = _3949;
    out.m_86.z = _3953;
    out.m_86.w = _3951;
    bool _3955 = !_3935;
    float _3957 = _3753;
    float _3959 = _3722;
    float _3961 = _3751;
    float _3963 = _3943;
    float _3965 = _3899;
    float _3967 = _3708;
    float _3969 = _3684;
    float _4003;
    if (!_3955)
    {
        float _3971 = -_3939;
        float _3973 = _3730 + _3971;
        float _3975 = -_3937;
        float _3977 = _3728 + _3975;
        float _3979 = _2916 * _3426;
        float _3981 = -_3909;
        float _3983 = _3728 + _3981;
        float _3985 = _3973 * _3973;
        float _3987 = -_3923;
        float _3989 = _3730 + _3987;
        float _3991 = _3979 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _3993 = fma(_3977, _3977, _3985);
        float _3995 = sqrt(_3993);
        bool _3997 = _3995 > 0.0;
        _3961 = _3993;
        _3963 = _3977;
        _3965 = _3995;
        if (!_3997)
        {
            _3957 = _3991;
        }
        float _3999 = _3957;
        bool _4001 = !_3997;
        _4003 = _3999;
        _4005 = _4001;
        if (!_4005)
        {
            float _4007 = _3989 * _3989;
            float _4009 = fma(_3983, _3983, _4007);
            float _4011 = rsqrt(_3993);
            float _4013 = sqrt(_4009);
            float _4015 = _3977 * _4011;
            float _4017 = _3973 * _4011;
            bool _4019 = _4013 > 0.0;
            float _4021 = _4013;
            _3965 = _4011;
            if (!_4019)
            {
                _4021 = _3991;
            }
            float _4023 = _4021;
            bool _4025 = !_4019;
            _4003 = _4023;
            _4005 = _4025;
            if (!_4005)
            {
                float _4027 = _2110 * _3825;
                float _4029 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _4031 = fma(_4027, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3817);
                float _4033 = fma(_4027, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3885);
                float _4035 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4031);
                float _4037 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4033);
                float _4039 = 1.0 / _4035;
                float _4041 = _4029 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _4043 = fma(_4027, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3883);
                float _4045 = rsqrt(_4009);
                float _4047 = _3989 * _4041;
                float _4049 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4043);
                float _4051 = _3983 * _4041;
                float _4053 = _4047 * _4047;
                float _4055 = _4037 * _4039;
                float _4057 = _4049 * _4039;
                float _4059 = fma(_4051, _4051, _4053);
                float _4061 = _4055 * _4055;
                float _4063 = fma(_4057, _4057, _4061);
                float _4065 = sqrt(_4059);
                float _4067 = _3989 * _4045;
                float _4069 = _3983 * _4045;
                float _4071 = _4017 * _4067;
                float _4073 = sqrt(_4063);
                float _4075 = fma(_4015, _4069, _4071);
                float _4077 = precise::min(0.0, _4075);
                float _4079 = _3684 * _4077;
                float _4081 = fma(_4051, _4079, _3708);
                float _4083 = fma(_4065, (*spvDescriptorSet0.vp_c13)._m0[1].x, _4073);
                float _4085 = fma(_4047, _4079, _3722);
                float _4087 = 1.0 / _4083;
                out.gl_Position.x = _4081;
                out.gl_Position.y = _4085;
                float _4089 = _4073 * _4087;
                out.m_80.y = _4089;
                _3959 = _4085;
                _3961 = _4047;
                _4003 = _3991;
                _3963 = _4071;
                _3965 = _4079;
                _3967 = _4081;
                _4005 = true;
            }
        }
    }
    else
    {
        float _4091 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _4091;
        _4003 = 0.0;
        _3967 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    _4005 = false;
    float _4093 = _3959;
    float _4095 = _3961;
    float _4097 = _4003;
    float _4099 = _3963;
    float _4101 = _3965;
    float _4103 = _3967;
    bool _4105 = _3448 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4107 = isnan(_3448);
    bool _4109 = _4105 || _4107;
    bool _4111 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4113 = _4109 || _4111;
    float _4115 = _4099;
    float _4117 = _4095;
    float _4119 = _4101;
    float _4121 = _4093;
    float _4123 = _4103;
    if (!_4113)
    {
        _4115 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4125 = _4115;
    float _4127 = _4125;
    float _4129 = _4125;
    if (!_4113)
    {
        _4117 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4131 = _4117;
    float _4133 = _4131;
    float _4135 = _4131;
    if (!_4113)
    {
        _3969 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4137 = _3969;
    float _4139 = _4137;
    float _4141 = _4137;
    if (!_4113)
    {
        _4119 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4143 = _4119;
    float _4145 = _4143;
    float _4147 = _4143;
    if (!_4113)
    {
        _4121 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4149 = _4121;
    float _4151 = _4149;
    float _4153 = _4149;
    if (!_4113)
    {
        _4123 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4155 = _4123;
    bool _4157 = !_4113;
    float _4159 = _4155;
    float _4161 = _4155;
    if (!_4157)
    {
        bool _4163 = _3448 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4165 = isnan(_3448);
        bool _4167 = _4163 || _4165;
        bool _4169 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4171 = _4167 || _4169;
        if (!_4171)
        {
            float _4173 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4175 = _3448 + _4173;
            float _4177 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4179 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4177;
            float _4181 = 1.0 / _4179;
            float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4185 = _4183 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4189 = _4187 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4193 = _4191 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4199 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4201 = _4199 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4203 = _4175 * _4181;
            float _4205 = precise::clamp(_4203, 0.0, 1.0);
            float _4207 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4209 = _4207 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4211 = fma(_4205, _4185, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4213 = fma(_4205, _4209, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4215 = fma(_4205, _4189, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4217 = fma(_4205, _4193, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4219 = fma(_4205, _4197, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4221 = fma(_4205, _4201, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4135 = _4213;
            _4153 = _4219;
            _4129 = _4211;
            _4147 = _4217;
            _4141 = _4215;
            _4161 = _4221;
            _4223 = true;
        }
        else
        {
            bool _4225 = _3448 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4227 = isnan(_3448);
            bool _4229 = _4225 || _4227;
            bool _4231 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4233 = _4229 || _4231;
            if (!_4233)
            {
                _4127 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4235 = _4127;
            _4129 = _4235;
            if (!_4233)
            {
                _4133 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4237 = _4133;
            _4135 = _4237;
            if (!_4233)
            {
                _4139 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4239 = _4139;
            _4141 = _4239;
            if (!_4233)
            {
                _4145 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4241 = _4145;
            _4147 = _4241;
            if (!_4233)
            {
                _4151 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4243 = _4151;
            _4153 = _4243;
            if (!_4233)
            {
                _4159 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4245 = _4159;
            bool _4247 = !_4233;
            _4161 = _4245;
            if (!_4247)
            {
                bool _4249 = _3448 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4251 = isnan(_3448);
                bool _4253 = _4249 || _4251;
                bool _4255 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4257 = _4253 || _4255;
                if (!_4257)
                {
                    float _4259 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4261 = _3448 + _4259;
                    float _4263 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4265 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4263;
                    float _4267 = 1.0 / _4265;
                    float _4269 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4271 = _4269 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4277 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4279 = _4277 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4281 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4283 = _4281 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4285 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4287 = _4285 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4289 = _4261 * _4267;
                    float _4291 = precise::clamp(_4289, 0.0, 1.0);
                    float _4293 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4295 = _4293 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4297 = fma(_4291, _4271, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4299 = fma(_4291, _4295, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4301 = fma(_4291, _4275, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4303 = fma(_4291, _4279, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4305 = fma(_4291, _4283, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4307 = fma(_4291, _4287, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4135 = _4299;
                    _4153 = _4305;
                    _4129 = _4297;
                    _4147 = _4303;
                    _4141 = _4301;
                    _4161 = _4307;
                    _4223 = true;
                }
                else
                {
                    _4135 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4153 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4129 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4147 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4141 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4161 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4223 = false;
    float _4309 = _4135;
    float _4311 = _4153;
    float _4313 = _4129;
    float _4315 = _4147;
    float _4317 = _4141;
    float _4319 = _4161;
    float _4321 = fma(_2662, -0.5, 0.5);
    float _4323 = precise::clamp(_4321, 0.0, 1.0);
    float _4325 = -_4309;
    float _4327 = _4325 + _4311;
    float _4329 = _4097 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4331 = -_4313;
    float _4333 = _4331 + _4315;
    float _4335 = fma(_4323, _4327, _4309);
    out.m_88.x = 0.0;
    float _4337 = -_4317;
    float _4339 = _4337 + _4319;
    float _4341 = fma(_4323, _4333, _4313);
    float _4343 = _4335 * 0.586610972881317138671875;
    out.m_49.x = _4329;
    bool _4345 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4347 = fma(_4323, _4339, _4317);
    float _4349 = fma(_4341, 0.298911988735198974609375, _4343);
    bool _4351 = _3426 > 0.0;
    bool _4353 = isnan(_3426);
    bool _4355 = _4351 || _4353;
    bool _4357 = isnan(0.0);
    bool _4359 = _4355 || _4357;
    float _4361 = fma(_4347, 0.114477999508380889892578125, _4349);
    float _4363 = -_4361;
    float _4365 = _4341 + _4363;
    float _4367 = -_4361;
    float _4369 = _4335 + _4367;
    float _4371 = -_4361;
    float _4373 = _4347 + _4371;
    float _4375 = fma(_4365, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4361);
    float _4377 = fma(_4369, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4361);
    float _4379 = fma(_4373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4361);
    bool _4381 = !_4345;
    if (!_4381)
    {
        float _4383 = -_3386;
        float _4385 = _4383 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4387 = -_3388;
        float _4389 = _4387 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4391 = -_3390;
        float _4393 = _4391 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4395 = _4385 * _4385;
        float _4397 = fma(_4389, _4389, _4395);
        float _4399 = fma(_4393, _4393, _4397);
        float _4401 = sqrt(_4399);
        float _4403 = rsqrt(_4399);
        float _4405 = -_4401;
        float _4407 = _4405 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4409 = _4407 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4411 = precise::clamp(_4409, 0.0, 1.0);
        float _4413 = _4389 * _4403;
        float _4415 = _4385 * _4403;
        float _4417 = abs(_4411);
        float _4419 = log2(_4417);
        float _4421 = _4393 * _4403;
        float _4423 = _4413 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4425 = _2662 * _4415;
        float _4427 = -_4415;
        float _4429 = -_4423;
        float _4431 = fma(_4427, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4429);
        float _4433 = fma(_2666, _4413, _4425);
        float _4435 = -_4421;
        float _4437 = fma(_4435, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4431);
        float _4439 = fma(_2478, _4421, _4433);
        float _4441 = precise::clamp(_4439, 0.0, 1.0);
        float _4443 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4445 = _4437 + _4443;
        float _4447 = _4419 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4449 = _4445 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4451 = precise::clamp(_4449, 0.0, 1.0);
        float _4453 = exp2(_4447);
        float _4455 = _4453 * _4451;
        float _4457 = _4441 * _4455;
        float _4459 = _4457 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4461 = _4457 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4463 = _4457 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _4459;
        out.m_88.y = _4461;
        out.m_88.z = _4463;
    }
    out.m_90.x = _4375;
    out.m_90.y = _4377;
    out.m_90.z = _4379;
    if (_4359)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _4465 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4465;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4223 = false;
    bool _4005 = false;
    bool _2770 = false;
    bool _2758 = false;
    bool _687 = false;
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
        float _4522 = as_type<float>(_125);
        out.gl_Position.z = _4522;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_109);
        _119 = _149;
    }
    float _151 = _119;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4596 = as_type<float>(_165);
        out.gl_Position.z = _4596;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_57.x;
    float _169 = in.m_57.y;
    float _171 = in.m_57.z;
    float _173 = in.m_59.x;
    float _175 = in.m_59.y;
    float _177 = in.m_59.z;
    float _179 = in.m_61.x;
    float _181 = in.m_61.y;
    float _183 = in.m_61.z;
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_66.w;
    float _189 = in.m_46.x;
    float _191 = in.m_46.y;
    float _193 = in.m_46.z;
    float _195 = _167 * _167;
    float _197 = _169 * _169;
    float _199 = fma(_173, _173, _195);
    float _201 = fma(_175, _175, _197);
    float _203 = fma(_179, _179, _199);
    float _205 = _171 * _171;
    float _207 = fma(_181, _181, _201);
    float _209 = sqrt(_203);
    float _211 = fma(_177, _177, _205);
    float _213 = fma(_183, _183, _211);
    float _215 = sqrt(_207);
    float _217 = sqrt(_213);
    bool _219 = _209 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = 0.0;
    float _225 = _203;
    float _227 = _177;
    if (_219)
    {
        float _229 = rsqrt(_203);
        _223 = _229;
    }
    float _231 = _223;
    float _233 = 0.0;
    if (!_219)
    {
        _233 = 0.0;
    }
    float _235 = _233;
    bool _237 = _217 > 0.0;
    float _239 = 0.0;
    float _241 = _235;
    if (!_219)
    {
        _239 = 0.0;
    }
    float _243 = _239;
    int _245 = as_type<int>(_185) & 1;
    bool _247 = _245 != 0;
    int _249 = as_type<int>(_185) & 2;
    bool _251 = _249 != 0;
    float _253 = 0.0;
    float _255 = _243;
    if (_221)
    {
        float _257 = rsqrt(_207);
        _253 = _257;
    }
    float _259 = _253;
    float _261 = in.m_51.x;
    float _263 = in.m_51.y;
    float _265 = in.m_51.z;
    bool _267 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _271 = _267 || _269;
    bool _273 = isnan(1.0);
    bool _275 = _271 || _273;
    float _277 = 0.0;
    float _279 = 0.0;
    if (!_221)
    {
        _277 = 0.0;
        _279 = 0.0;
    }
    float _281 = _277;
    float _283 = _279;
    float _285 = _283;
    float _287 = _281;
    if (!_219)
    {
        _225 = 0.0;
    }
    float _289 = _225;
    float _291 = 0.0;
    float _293 = _289;
    if (!_221)
    {
        _291 = 0.0;
    }
    float _295 = _291;
    float _297 = 0.0;
    float _299 = _295;
    if (_237)
    {
        float _301 = rsqrt(_213);
        _297 = _301;
    }
    float _303 = _297;
    if (_219)
    {
        float _305 = _231 * _173;
        _241 = _305;
    }
    float _307 = _241;
    if (_219)
    {
        float _309 = _231 * _167;
        _293 = _309;
    }
    float _311 = _293;
    if (_219)
    {
        float _313 = _231 * _179;
        _255 = _313;
    }
    float _315 = _255;
    float _317 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _319 = int(_247);
    int _321 = _251 ? 2 : 0;
    int _323 = _319 | _321;
    int _325 = _219 ? 4 : 0;
    int _327 = _323 | _325;
    int _329 = _221 ? 8 : 0;
    int _331 = _327 | _329;
    int _333 = _237 ? 16 : 0;
    int _335 = _331 | _333;
    int _337 = _275 ? 32 : 0;
    int _339 = _335 | _337;
    int _341 = false ? 64 : 0;
    int _343 = _339 | _341;
    int _345 = _343 & 32;
    float _347 = 0.0;
    float _349 = 0.0;
    float _351 = as_type<float>(_345);
    float _353 = _317;
    if (!_237)
    {
        _347 = 0.0;
        _349 = 0.0;
    }
    float _355 = _347;
    float _357 = _349;
    float _359 = 0.0;
    float _361 = _355;
    float _363 = _357;
    if (!_237)
    {
        _359 = 0.0;
    }
    float _365 = _359;
    float _367 = _365;
    if (!_275)
    {
        float _369 = _317 * _317;
        float _371 = _369 * 0.5;
        _351 = _371;
    }
    float _373 = _351;
    float _375 = _373;
    if (_221)
    {
        float _377 = _259 * _175;
        _285 = _377;
    }
    float _379 = _285;
    float _381 = _379;
    float _383 = _379;
    if (_221)
    {
        float _385 = _259 * _169;
        _287 = _385;
    }
    float _387 = _287;
    if (_221)
    {
        float _389 = _259 * _181;
        _299 = _389;
    }
    float _391 = _299;
    bool _393 = !_247;
    float _395 = _393 ? (-0.5) : 0.5;
    if (!_275)
    {
        float _397 = _373 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _375 = _397;
    }
    float _399 = _375;
    bool _401 = !_251;
    float _403 = _401 ? (-0.5) : 0.5;
    float _405 = _399;
    if (_237)
    {
        float _407 = _303 * _177;
        _367 = _407;
    }
    float _409 = _367;
    if (_237)
    {
        float _411 = _303 * _171;
        _361 = _411;
    }
    float _413 = _361;
    if (_237)
    {
        float _415 = _303 * _183;
        _363 = _415;
    }
    float _417 = _363;
    bool _419 = !_275;
    float _421 = 0.0;
    float _423 = _265;
    float _425 = _261;
    float _427 = _265;
    if (!_419)
    {
        float _429 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _431 = log2(_429);
        float _433 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _435 = _433 + 1.0;
        float _437 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _439 = _317 * _431;
        float _441 = 1.0 / _435;
        float _443 = _437 * 0.693147182464599609375;
        float _445 = exp2(_439);
        float _447 = 1.0 / _443;
        float _449 = _445 + (-1.0);
        float _451 = -_449;
        float _453 = fma(_451, _447, _317);
        float _455 = _453 * _441;
        float _457 = _455 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _405 = _457;
        _421 = _455;
    }
    float _459 = _405;
    float _461 = _421;
    float _463 = _459 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _465 = !_275;
    float _467 = _461;
    float _469 = _459;
    if (!_465)
    {
        float _471 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _473 = log2(_471);
        float _475 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _477 = _475 + 1.0;
        float _479 = 1.0 / _477;
        float _481 = _317 * _473;
        float _483 = exp2(_481);
        float _485 = -_483;
        float _487 = _485 + 1.0;
        float _489 = _487 * _479;
        _467 = _479;
        _353 = _489;
    }
    float _491 = _467;
    float _493 = _353;
    float _495 = _463 * _311;
    float _497 = _463 * _387;
    float _499 = _459 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _501 = _463 * _413;
    float _503 = _491;
    if (!_275)
    {
        float _505 = _145 * _145;
        float _507 = _505 * 0.5;
        _503 = _507;
    }
    float _509 = _503;
    float _511 = fma(_499, _307, _495);
    float _513 = fma(_499, _379, _497);
    float _515 = fma(_499, _409, _501);
    float _517 = _459 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_275)
    {
        float _519 = _509 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _469 = _519;
    }
    float _521 = _469;
    bool _523 = !_275;
    float _525 = _521;
    if (!_523)
    {
        float _527 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _529 = log2(_527);
        float _531 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _533 = _531 + 1.0;
        float _535 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _537 = _145 * _529;
        float _539 = exp2(_537);
        float _541 = _535 * 0.693147182464599609375;
        float _543 = 1.0 / _541;
        float _545 = 1.0 / _533;
        float _547 = _539 + (-1.0);
        float _549 = -_547;
        float _551 = fma(_549, _543, _145);
        float _553 = _551 * _545;
        float _555 = _553 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _525 = _555;
    }
    float _557 = _525;
    float _559 = _557 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _561 = fma(_517, _315, _511);
    float _563 = fma(_517, _391, _513);
    float _565 = _557 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _567 = _559 * _311;
    float _569 = _559 * _387;
    float _571 = _559 * _413;
    float _573 = fma(_517, _417, _515);
    float _575 = _557 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _577 = fma(_565, _379, _569);
    float _579 = fma(_565, _307, _567);
    float _581 = fma(_565, _409, _571);
    float _583 = fma(_493, _261, _561);
    float _585 = fma(_493, _263, _563);
    float _587 = fma(_493, _265, _573);
    float _589 = fma(_575, _391, _577);
    float _591 = fma(_575, _315, _579);
    float _593 = fma(_575, _417, _581);
    float _595 = _557;
    if (!_275)
    {
        _595 = _145;
    }
    float _597 = _595;
    bool _599 = !_275;
    float _601 = _597;
    if (!_599)
    {
        float _603 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _605 = log2(_603);
        float _607 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _609 = _607 + 1.0;
        float _611 = 1.0 / _609;
        float _613 = _145 * _605;
        float _615 = exp2(_613);
        float _617 = -_615;
        float _619 = _617 + 1.0;
        float _621 = _619 * _611;
        _601 = _621;
    }
    float _623 = _601;
    float _625 = fma(_623, _263, _589);
    bool _627 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _629 = fma(_623, _261, _591);
    float _631 = fma(_623, _265, _593);
    float _633 = -_625;
    float _635 = _585 + _633;
    float _637 = fma(_585, _187, _191);
    float _639 = fma(_583, _187, _189);
    float _641 = -_629;
    float _643 = _583 + _641;
    float _645 = _635 * _175;
    float _647 = _635 * _169;
    float _649 = _635 * _181;
    float _651 = -_631;
    float _653 = _587 + _651;
    float _655 = fma(_643, _173, _645);
    float _657 = fma(_643, _167, _647);
    float _659 = fma(_643, _179, _649);
    float _661 = fma(_587, _187, _193);
    float _663 = fma(_653, _177, _655);
    float _665 = fma(_653, _171, _657);
    float _667 = fma(_653, _183, _659);
    bool _669 = !_627;
    float _685;
    if (!_669)
    {
        float _671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _673 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _675 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _677 = _675 * _671;
        float _679 = floor(_677);
        float _681 = -_679;
        float _683 = _677 + _681;
        _685 = _683;
        _687 = true;
    }
    else
    {
        float _689 = float(_109);
        float _691 = 1.0 / _689;
        float _693 = _145 * _691;
        _685 = _693;
    }
    _687 = false;
    float _695 = _685;
    float _697 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _699 = int(_697);
    float _701 = in.m_53.y;
    float _703 = _131 * 2.0;
    float _705 = in.m_53.z;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _709 = _707 != 0;
    float _711 = _637 * _181;
    float _713 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _715 = int(_713);
    float _717 = in.m_53.w;
    float _719 = fma(_639, _179, _711);
    float _721 = in.m_61.w;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _723;
    float _727 = float(_699);
    float _729 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _731 = int(_729);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _737 = 0.0;
    if (_709)
    {
        _737 = 1.0;
    }
    float _739 = _737;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _743 = 0.0;
    float _745 = _739;
    if (_709)
    {
        _743 = _131;
    }
    float _747 = _743;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _751 = 0.0;
    float _753 = _747;
    if (_709)
    {
        _751 = 1.0;
    }
    float _755 = _751;
    float _757 = float(_715);
    float _759 = 1.0 / _727;
    float _761 = _701 * 2.0;
    float _763 = _755;
    if (!_709)
    {
        _745 = 7.345489978790283203125;
    }
    float _765 = _745;
    float _767 = _701 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_709)
    {
        _753 = _701;
    }
    float _769 = _753;
    if (!_709)
    {
        _763 = 1.2345600128173828125;
    }
    float _771 = _763;
    float _773 = fma(_767, -2.0, _741);
    float _775 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _777 = int(_775);
    float _779 = float(uint(_731));
    float _781 = in.m_57.w;
    int _783 = ~_731;
    int _785 = _783 + 1;
    float _787 = _765 * _131;
    float _789 = _769 * _771;
    float _791 = 1.0 / _757;
    float _793 = _145 * _759;
    float _795 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _773);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _797;
    float _801 = float(uint(_777));
    float _803 = floor(_703);
    int _805 = ~_777;
    int _807 = _805 + 1;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _811 = _809 != 0;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _815 = _813 != 0;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _819 = _817 != 0;
    float _821 = _145 * _791;
    float _823 = floor(_761);
    float _825 = _705 * 2.0;
    int _827 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _829 = _827 != 0;
    bool _831 = !_811;
    int _833 = _831 ? 0 : 1;
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _837 = _835 != 0;
    float _839 = 1.0 / _779;
    bool _841 = _131 > 0.5;
    bool _843 = !_837;
    int _845 = _843 ? 0 : 1;
    float _847 = -_395;
    int _849 = _841 ? as_type<int>(_847) : as_type<int>(_395);
    float _851 = trunc(_793);
    int _853 = int(_851);
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _857 = _855 != 0;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _861 = _859 != 0;
    bool _863 = !_829;
    float _865 = _863 ? _395 : as_type<float>(_849);
    bool _867 = !_857;
    int _869 = _867 ? 0 : 1;
    float _871 = 1.0 / _801;
    bool _873 = _803 >= 0.0;
    bool _875 = isnan(_803);
    bool _877 = _873 || _875;
    bool _879 = isnan(0.0);
    bool _881 = _877 || _879;
    bool _883 = _823 > 0.0;
    bool _885 = _823 >= 0.0;
    bool _887 = isnan(_823);
    bool _889 = _885 || _887;
    bool _891 = isnan(0.0);
    bool _893 = _889 || _891;
    int _895 = as_type<int>(_839) + (-2);
    float _897 = trunc(_821);
    int _899 = int(_897);
    float _901 = float(uint(_853));
    bool _903 = !_861;
    int _905 = _903 ? 0 : 1;
    bool _907 = _803 > 0.0;
    int _909 = _881 ? 0 : 1;
    float _911 = floor(_825);
    int _913 = as_type<int>(_871) + (-2);
    int _915 = _893 ? 0 : 1;
    bool _917 = !_815;
    int _919 = _917 ? 0 : 1;
    bool _921 = _717 > 0.5;
    float _923 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _925 = log2(_923);
    float _927 = float(uint(_899));
    int _929 = ~_909;
    int _931 = _929 + 1;
    int _933 = _931 + 1;
    int _935 = _933;
    if (!_907)
    {
        int _937 = ~_909;
        int _939 = _937 + 1;
        _935 = _939;
    }
    int _941 = _935;
    float _943 = as_type<float>(_913) * _927;
    bool _945 = _701 > 0.5;
    float _947 = 1.0 / _735;
    bool _949 = _911 > 0.0;
    bool _951 = _911 >= 0.0;
    bool _953 = isnan(_911);
    bool _955 = _951 || _953;
    bool _957 = isnan(0.0);
    bool _959 = _955 || _957;
    float _961 = as_type<float>(_895) * _901;
    int _963 = ~_915;
    int _965 = _963 + 1;
    int _967 = _965 + 1;
    int _969 = _967;
    if (!_883)
    {
        int _971 = ~_915;
        int _973 = _971 + 1;
        _969 = _973;
    }
    int _975 = _969;
    float _977 = trunc(_943);
    float _979 = precise::max(_977, 0.0);
    uint _982 = uint(_979);
    float _984 = _145 * _925;
    float _986 = -_403;
    int _988 = _945 ? as_type<int>(_986) : as_type<int>(_403);
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _992 = _990 != 0;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _996 = 1.0 + _994;
    float _998 = trunc(_961);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    bool _1004 = _705 > 0.5;
    bool _1006 = !_992;
    float _1008 = _1006 ? _403 : as_type<float>(_988);
    float _1010 = -_395;
    int _1012 = _1004 ? as_type<int>(_1010) : as_type<int>(_395);
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1016 = _1014 != 0;
    float _1018 = exp2(_984);
    int _1020 = _807 * int(_982);
    int _1022 = _1020 + _899;
    float _1024 = -_403;
    int _1026 = _921 ? as_type<int>(_1024) : as_type<int>(_403);
    bool _1028 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1030 = isnan(0.0);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(uint(_1022));
    float _1040 = 1.0 / _996;
    int _1042 = _785 * int(_1002);
    int _1044 = _1042 + _853;
    int _1046 = _1022;
    if (_709)
    {
        _1046 = 0;
    }
    int _1048 = _1046;
    float _1050 = as_type<float>(_913) * _1038;
    int _1052 = _1048;
    if (!_709)
    {
        _1052 = 1;
    }
    int _1054 = _1052;
    float _1056 = float(uint(_1044));
    float _1058 = trunc(_1050);
    float _1060 = precise::max(_1058, 0.0);
    uint _1062 = uint(_1060);
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1066 = _1064 != 0;
    float _1068 = -_1018;
    float _1070 = _1068 + 1.0;
    float _1072 = as_type<float>(_895) * _1056;
    bool _1074 = !_819;
    int _1076 = _1074 ? 0 : 1;
    bool _1078 = !_1016;
    float _1080 = _1078 ? _403 : as_type<float>(_1026);
    float _1082 = trunc(_1072);
    float _1084 = precise::max(_1082, 0.0);
    uint _1086 = uint(_1084);
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1090 = _1088 != 0;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1094 = _1092 != 0;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1098 = _1096 != 0;
    int _1100 = _959 ? 0 : 1;
    bool _1102 = _1054 != 1;
    int _1104 = ~_777;
    int _1106 = _1104 + 1;
    float _1108 = 1.0 / _725;
    int _1110 = int(_982) + int(_1062);
    float _1112 = _1036 ? _1070 : 0.0;
    int _1114 = ~_731;
    int _1116 = _1114 + 1;
    float _1118 = _1112 * _1040;
    int _1120 = int(_1002) + int(_1086);
    int _1122 = _1106 * _1110;
    int _1124 = _1122 + _899;
    int _1126 = ~_1100;
    int _1128 = _1126 + 1;
    int _1130 = _1128 + 1;
    float _1132 = 0.0;
    int _1134 = _1130;
    if (!_1102)
    {
        _1132 = _701;
    }
    float _1136 = _1132;
    int _1138 = _1116 * _1120;
    int _1140 = _1138 + _853;
    float _1142 = 0.0;
    float _1144 = _1136;
    if (!_1102)
    {
        _1142 = _701;
    }
    float _1146 = _1142;
    float _1148 = _637 * _175;
    float _1150 = 0.0;
    float _1152 = _1146;
    if (!_1102)
    {
        _1150 = _705;
    }
    float _1154 = _1150;
    float _1156 = 0.0;
    float _1158 = _1154;
    if (!_1102)
    {
        _1156 = _705;
    }
    float _1160 = _1156;
    float _1162 = _1160;
    if (!_949)
    {
        int _1164 = ~_1100;
        int _1166 = _1164 + 1;
        _1134 = _1166;
    }
    int _1168 = _1134;
    if (_1102)
    {
        _1144 = _131;
    }
    float _1170 = _1144;
    if (_1102)
    {
        _1152 = _131;
    }
    float _1172 = _1152;
    if (_1102)
    {
        _1158 = _701;
    }
    float _1174 = _1158;
    float _1176 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1102)
    {
        _1162 = _701;
    }
    float _1178 = _1162;
    bool _1180 = !_1094;
    int _1182 = _1180 ? 0 : 1;
    float _1184 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1186 = uint(_1124) >= uint(_777);
    float _1188 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1190 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1192 = isnan(1.0);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1198 = _1194 || _1196;
    bool _1200 = uint(_1140) >= uint(_731);
    float _1202 = _637 * _169;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1206 = _1204 != 0;
    float _1208 = fma(_639, _173, _1148);
    bool _1210 = !_1066;
    float _1212 = _1210 ? _395 : as_type<float>(_1012);
    float _1214 = fma(_639, _167, _1202);
    bool _1216 = !_1198;
    float _1218 = _1216 ? _145 : _1118;
    float _1220 = in.m_59.w;
    bool _1222 = !_1186;
    int _1224 = _1222 ? 0 : (-1);
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1228 = _695 + _1226;
    bool _1230 = !_1200;
    int _1232 = _1230 ? 0 : (-1);
    float _1234 = fma(_661, _171, _1214);
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1238 = _1236 != 0;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1242 = _1240 != 0;
    int _1244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1246 = _1244 != 0;
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1250 = _1248 != 0;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1254 = _695 + _1252;
    float _1256 = _1228 * _947;
    float _1258 = _131 + _701;
    float _1260 = -_749;
    float _1262 = fma(_1188, 2.0, _1260);
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1266 = _695 + _1264;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1270 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1268;
    float _1272 = _131 + _705;
    float _1274 = _1258 + (-1.0);
    float _1276 = _705 + _701;
    float _1278 = fma(_661, _177, _1208);
    float _1280 = _1266 * _1108;
    float _1282 = 1.0 / _1270;
    float _1284 = fma(_661, _183, _719);
    float _1286 = _1272 + (-1.0);
    float _1288 = _1276 + (-1.0);
    float _1290 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1292 = _1234 + _781;
    float _1294 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1296 = _1278 + _1220;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1306 = _1284 + _721;
    bool _1308 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1310 = isnan(_695);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    float _1320 = fma(_1300, _1280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1322 = fma(_1304, _1256, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1324 = _1254 * _1282;
    float _1326 = -_1318;
    float _1328 = _1326 + 1.0;
    bool _1330 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1332 = isnan(_695);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = _1296 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _1344 = _1306 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _1346 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1348 = !_1098;
    int _1350 = _1348 ? 0 : 1;
    bool _1352 = !_1090;
    int _1354 = _1352 ? 0 : 1;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1356;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1362 = _1360 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1364 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1366 = isnan(_695);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1372 = _1368 || _1370;
    float _1374 = float(_1372);
    float _1376 = fma(_1358, _1280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1378 = fma(_1362, _1256, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1380 = -_1374;
    float _1382 = _1380 + 1.0;
    bool _1384 = _695 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1386 = isnan(_695);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = floor(_787);
    float _1398 = _1374 * _1328;
    float _1400 = _1340 * _1382;
    float _1402 = -_1340;
    float _1404 = _1402 + 1.0;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1406;
    float _1410 = -_145;
    float _1412 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1262);
    float _1414 = _865 + 0.5;
    float _1416 = _1394 * _1404;
    float _1418 = fma(_1408, _1324, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1420 = fma(_799, _1324, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1422 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1412);
    float _1424 = _1008 + (-0.5);
    float _1426 = _1320 * _1416;
    float _1428 = -_1394;
    float _1430 = _1428 + 1.0;
    float _1432 = _1376 * _1416;
    float _1434 = floor(_789);
    float _1436 = -_1424;
    float _1438 = -_795;
    float _1440 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1438);
    float _1442 = float(_109);
    float _1444 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1426);
    float _1446 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1432);
    float _1448 = _1292 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    float _1450 = -_1396;
    float _1452 = _787 + _1450;
    float _1454 = fma(_1322, _1400, _1444);
    float _1456 = 1.0 / _1442;
    float _1458 = _1448 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _1460 = _1448 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _1462 = _1448 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _1464 = fma(_1378, _1400, _1446);
    float _1466 = float(_899);
    float _1468 = fma(_1342, (*spvDescriptorSet0.vp_c12)._m0[6].x, _1458);
    float _1470 = fma(_1342, (*spvDescriptorSet0.vp_c12)._m0[6].z, _1462);
    float _1472 = -_1434;
    float _1474 = _789 + _1472;
    float _1476 = fma(_1418, _1398, _1454);
    float _1478 = fma(_1420, _1398, _1464);
    float _1480 = float(_777);
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1484 = float(_731);
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1488 = _145 * _1456;
    float _1490 = float(_853);
    float _1492 = _1452 * _1480;
    bool _1494 = _1466 >= _1480;
    bool _1496 = isnan(_1466);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(_1480);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    float _1506 = _1488 * _1480;
    float _1508 = _1488 * _1484;
    bool _1510 = _1490 >= _1484;
    bool _1512 = isnan(_1490);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(_1484);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = _1474 * _1484;
    float _1524 = fma(_1344, (*spvDescriptorSet0.vp_c12)._m0[8].x, _1468);
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1528 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1482);
    float _1530 = fma(_1342, (*spvDescriptorSet0.vp_c12)._m0[6].y, _1460);
    float _1532 = -_1526;
    float _1534 = fma(_1176, 2.0, _1532);
    int _1536 = abs(_1350);
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1540 = float(_975);
    float _1542 = fma(_1344, (*spvDescriptorSet0.vp_c12)._m0[8].y, _1530);
    float _1544 = in.m_68.x;
    float _1546 = in.m_68.y;
    float _1548 = in.m_68.z;
    int _1550 = abs(_1182);
    float _1552 = fma(_1344, (*spvDescriptorSet0.vp_c12)._m0[8].z, _1470);
    int _1554 = abs(_1354);
    float _1556 = fma(_1184, -2.0, _1538);
    float _1558 = float(_941);
    float _1560 = _1524 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _1562 = float(_1550);
    float _1564 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1478);
    float _1566 = float(_1554);
    float _1568 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1556);
    float _1570 = float(_1168);
    float _1572 = _1562 * _1558;
    float _1574 = float(_1536);
    float _1576 = trunc(_1522);
    int _1578 = int(_1576);
    int _1580 = abs(_905);
    float _1582 = _1566 * _1570;
    float _1584 = _1080 + (-0.5);
    float _1586 = _1574 * _1540;
    int _1588 = ~_1120;
    int _1590 = _1588 + _1232;
    int _1592 = _1590 + 1;
    float _1594 = _1582 * (-2.0);
    float _1596 = -_1584;
    float _1598 = -_1568;
    float _1600 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1598);
    float _1602 = trunc(_1504);
    int _1604 = int(_1602);
    float _1606 = fma(_1346, _1594, _1346);
    float _1608 = fma(_1594, _1544, _1544);
    float _1610 = _1572 * (-2.0);
    float _1612 = _1586 * (-2.0);
    int _1614 = abs(_869);
    float _1616 = fma(_1294, _1610, _1294);
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1620 = fma(_1610, _1546, _1546);
    int _1622 = ~_1110;
    int _1624 = _1622 + _1224;
    int _1626 = _1624 + 1;
    float _1628 = trunc(_1492);
    int _1630 = int(_1628);
    float _1632 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1618);
    float _1634 = _131 + (-0.5);
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1638 = _731 * _1592;
    int _1640 = _1638 + _853;
    float _1642 = fma(_1290, _1612, _1290);
    float _1644 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1608);
    int _1646 = _777 * _1626;
    int _1648 = _1646 + _899;
    float _1650 = trunc(_1520);
    int _1652 = int(_1650);
    bool _1654 = !_1242;
    int _1656 = _1654 ? 0 : 1;
    float _1658 = fma(_1218, _1606, _1644);
    float _1660 = fma(_1612, _1548, _1548);
    float _1662 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1636);
    bool _1664 = _777 == 0;
    float _1666 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _1668 = _701 + (-0.5);
    int _1670 = _1630 * _1580;
    int _1672 = _1670 + _899;
    float _1674 = _705 + (-0.5);
    int _1676 = _1578 * _1614;
    int _1678 = _1676 + _853;
    int _1680 = ~_1604;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1620);
    bool _1688 = !_1664;
    int _1690 = _1688 ? _1648 : (-1);
    float _1692 = trunc(_1506);
    int _1694 = int(_1692);
    float _1696 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1660);
    bool _1698 = !_1238;
    int _1700 = _1698 ? 0 : 1;
    float _1702 = _1542 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _1704 = float(uint(_1672));
    int _1706 = _1690 * _1684;
    bool _1708 = _731 == 0;
    float _1710 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1476);
    int _1712 = _777 + (-1);
    float _1714 = as_type<float>(_913) * _1704;
    int _1716 = ~_1652;
    int _1718 = _1716 + 1;
    int _1720 = _1718 + 1;
    float _1722 = _1560 * _1666;
    bool _1724 = !_1708;
    int _1726 = _1724 ? _1640 : (-1);
    int _1728 = _1604 * _1712;
    int _1730 = _1728 + _1706;
    int _1732 = abs(_919);
    float _1734 = in.m_66.x;
    float _1736 = in.m_66.y;
    float _1738 = float(uint(_1678));
    float _1740 = fma(_1218, _1616, _1686);
    int _1742 = _1726 * _1720;
    int _1744 = abs(_833);
    float _1746 = trunc(_1508);
    int _1748 = int(_1746);
    int _1750 = _731 + (-1);
    int _1752 = _1730 * _1732;
    int _1754 = abs(_1656);
    float _1756 = as_type<float>(_895) * _1738;
    int _1758 = abs(_1076);
    int _1760 = _1694 * _1744;
    int _1762 = _1760 + _1752;
    int _1764 = _1652 * _1750;
    int _1766 = _1764 + _1742;
    int _1768 = abs(_1700);
    int _1770 = _1672 * _1758;
    int _1772 = _1770 + _1762;
    int _1774 = abs(_845);
    int _1776 = _1766 * _1754;
    bool _1778 = !_1246;
    int _1780 = _1778 ? 0 : 1;
    float _1782 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1486);
    int _1784 = _1630 * _1774;
    int _1786 = _1784 + _1772;
    int _1788 = abs(_1780);
    float _1790 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    bool _1792 = !_1250;
    int _1794 = _1792 ? 0 : 1;
    int _1796 = _1748 * _1768;
    int _1798 = _1796 + _1776;
    float _1800 = float(uint(_1786));
    float _1802 = _1564 * _1736;
    int _1804 = abs(_1794);
    int _1806 = _1678 * _1788;
    int _1808 = _1806 + _1798;
    float _1810 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1632);
    float _1812 = as_type<float>(_913) * _1800;
    float _1814 = trunc(_1714);
    float _1816 = precise::max(_1814, 0.0);
    uint _1818 = uint(_1816);
    int _1820 = _1578 * _1804;
    int _1822 = _1820 + _1808;
    float _1824 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1782);
    float _1826 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1662);
    float _1828 = _1212 + 0.5;
    float _1830 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1528);
    float _1832 = -_1824;
    float _1834 = _1832 + 1.0;
    float _1836 = _1702 * _1790;
    float _1838 = trunc(_1812);
    float _1840 = precise::max(_1838, 0.0);
    uint _1842 = uint(_1840);
    float _1844 = _1552 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    float _1846 = -_145;
    float _1848 = fma(_1846, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1534);
    float _1850 = -_1810;
    float _1852 = _1850 + 1.0;
    float _1854 = fma(_1218, _1642, _1696);
    float _1856 = -_1826;
    float _1858 = _1856 + 1.0;
    float _1860 = fma(_1080, _1834, _1600);
    float _1862 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1848);
    float _1864 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _1866 = -_1830;
    float _1868 = _1866 + 1.0;
    int _1870 = ~_777;
    int _1872 = _1870 + 1;
    float _1874 = -_1852;
    float _1876 = fma(_865, _1874, _1422);
    float _1878 = float(uint(_1822));
    float _1880 = fma(_1008, _1858, _1440);
    int _1882 = ~_777;
    int _1884 = _1882 + 1;
    float _1886 = -_1868;
    float _1888 = fma(_1212, _1886, _1862);
    int _1890 = _1872 * int(_1842);
    int _1892 = _1890 + _1786;
    float _1894 = as_type<float>(_895) * _1878;
    float _1896 = trunc(_1756);
    float _1898 = precise::max(_1896, 0.0);
    uint _1900 = uint(_1898);
    int _1902 = _1884 * int(_1818);
    int _1904 = _1902 + _1672;
    out.m_70.x = _1876;
    out.m_70.y = _1880;
    out.m_70.z = _1888;
    out.m_70.w = _1860;
    float _1906 = _1658 * 0.15915493667125701904296875;
    float _1908 = _1740 * 0.15915493667125701904296875;
    float _1910 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _403);
    float _1912 = _1844 * _1864;
    float _1914 = fma(_1722, 0.5, 0.5);
    float _1916 = fma(_1836, 0.5, 0.5);
    float _1918 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1920 = _1854 * 0.15915493667125701904296875;
    float _1922 = trunc(_1894);
    float _1924 = precise::max(_1922, 0.0);
    uint _1926 = uint(_1924);
    float _1928 = float(uint(_1904));
    float _1930 = fma(_1912, 0.5, 0.5);
    float _1932 = _1918 * _1910;
    int _1934 = ~_731;
    int _1936 = _1934 + 1;
    float _1938 = _1710 * _1734;
    float _1940 = float(uint(_1892));
    float _1942 = as_type<float>(_913) * _1928;
    float _1944 = _1906 * 6.283185482025146484375;
    float _1946 = sin(_1944);
    float _1948 = as_type<float>(_913) * _1940;
    int _1950 = ~_731;
    int _1952 = _1950 + 1;
    int _1954 = _1936 * int(_1900);
    int _1956 = _1954 + _1678;
    int _1958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1960 = _1958 != 0;
    float _1962 = _1906 * 6.283185482025146484375;
    float _1964 = cos(_1962);
    int _1966 = _1952 * int(_1926);
    int _1968 = _1966 + _1822;
    bool _1970 = !_1960;
    int _1972 = _1970 ? 0 : 1;
    float _1974 = _1908 * 6.283185482025146484375;
    float _1976 = sin(_1974);
    float _1978 = _1908 * 6.283185482025146484375;
    float _1980 = cos(_1978);
    float _1982 = floor(_1914);
    float _1984 = _1964 * _1976;
    float _1986 = _1946 * _1976;
    float _1988 = floor(_1916);
    float _1990 = _1946 * _1980;
    float _1992 = _1920 * 6.283185482025146484375;
    float _1994 = cos(_1992);
    float _1996 = -_1982;
    float _1998 = _1914 + _1996;
    float _2000 = _1964 * _1980;
    float _2002 = floor(_1930);
    float _2004 = -_1988;
    float _2006 = _1916 + _2004;
    float _2008 = _1920 * 6.283185482025146484375;
    float _2010 = sin(_2008);
    float _2012 = _1946 * _1994;
    float _2014 = float(uint(_1968));
    float _2016 = as_type<float>(_895) * _2014;
    float _2018 = trunc(_1948);
    float _2020 = precise::max(_2018, 0.0);
    uint _2022 = uint(_2020);
    float _2024 = float(uint(_1956));
    float _2026 = _1980 * _1994;
    float _2028 = -_2002;
    float _2030 = _1930 + _2028;
    float _2032 = _1964 * _1994;
    float _2034 = fma(_2030, 2.0, -1.0);
    float _2036 = trunc(_1942);
    float _2038 = precise::max(_2036, 0.0);
    uint _2040 = uint(_2038);
    float _2042 = -_1984;
    float _2044 = fma(_2010, _1990, _2042);
    float _2046 = -_1990;
    float _2048 = fma(_2010, _1984, _2046);
    float _2050 = fma(_2006, 2.0, -1.0);
    float _2052 = _1976 * _1994;
    float _2054 = as_type<float>(_895) * _2024;
    float _2056 = fma(_1998, 2.0, -1.0);
    float _2058 = _2050 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    int _2060 = int(_1842) + int(_2022);
    float _2062 = trunc(_2054);
    float _2064 = precise::max(_2062, 0.0);
    uint _2066 = uint(_2064);
    int _2068 = ~_777;
    int _2070 = _2068 + 1;
    float _2072 = _2058 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _2074 = _2058 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _2076 = _2058 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _2078 = fma(_2010, _2000, _1986);
    int _2080 = _2070 * _2060;
    int _2082 = _2080 + _1786;
    float _2084 = fma(_2010, _1986, _2000);
    float _2086 = trunc(_2016);
    float _2088 = precise::max(_2086, 0.0);
    uint _2090 = uint(_2088);
    float _2092 = _2056 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    int _2094 = int(_1818) + int(_2040);
    float _2096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _395);
    bool _2098 = uint(_2082) >= uint(_777);
    float _2100 = fma(_2092, (*spvDescriptorSet0.vp_c12)._m0[2].x, _2072);
    float _2102 = fma(_2092, (*spvDescriptorSet0.vp_c12)._m0[2].y, _2074);
    float _2104 = fma(_2092, (*spvDescriptorSet0.vp_c12)._m0[2].z, _2076);
    bool _2106 = !_2098;
    int _2108 = _2106 ? 0 : (-1);
    float _2110 = _1938 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2112 = int(_1900) + int(_2066);
    float _2114 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2116 = ~_2060;
    int _2118 = _2116 + _2108;
    int _2120 = _2118 + 1;
    int _2122 = ~_731;
    int _2124 = _2122 + 1;
    float _2126 = -_2010;
    float _2128 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2114);
    int _2130 = int(_1926) + int(_2090);
    int _2132 = _777 * _2120;
    int _2134 = _2132 + _1786;
    float _2136 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2138 = _2032 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2140 = _2110 * _2096;
    int _2142 = _2124 * _2130;
    int _2144 = _2142 + _1822;
    bool _2146 = !_1664;
    int _2148 = _2146 ? _2134 : (-1);
    float _2150 = -_2010;
    float _2152 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2136);
    float _2154 = -_2010;
    float _2156 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2138);
    float _2158 = _2032 * _1932;
    int _2160 = _2148 & 3;
    bool _2162 = _2160 != 0;
    float _2164 = -_1932;
    float _2166 = _2010 * _2164;
    bool _2168 = uint(_2144) >= uint(_731);
    float _2170 = fma(_2078, _2140, _2158);
    int _2172 = _2162 ? 0 : 1;
    float _2174 = fma(_2026, _2140, _2166);
    int _2176 = _2148 & 3;
    bool _2178 = _2176 != 0;
    float _2180 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2128);
    bool _2182 = !_2168;
    int _2184 = _2182 ? 0 : (-1);
    float _2186 = _2012 * _1932;
    bool _2188 = uint(_2176) > 1u;
    float _2190 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2192 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2194 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2152);
    float _2196 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2198 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2200 = fma(_2044, _2140, _2186);
    float _2202 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2192);
    float _2204 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2156);
    float _2206 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2190);
    float _2208 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2196);
    float _2210 = fma(_2052, _2198, _2174);
    int _2212 = ~_2130;
    int _2214 = _2212 + _2184;
    int _2216 = _2214 + 1;
    float _2218 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2220 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2222 = _2048 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2224 = ~_2172;
    int _2226 = _2224 + 1;
    int _2228 = _2226 + 1;
    float _2230 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2218);
    int _2232 = _2228;
    float _2234 = _2056;
    float _2236 = _2050;
    float _2238 = _2050;
    if (!_2188)
    {
        int _2240 = ~_2172;
        int _2242 = _2240 + 1;
        _2232 = _2242;
    }
    int _2244 = _2232;
    float _2246 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2220);
    float _2248 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2222);
    int _2250 = ~_777;
    int _2252 = _2250 + 1;
    int _2254 = _731 * _2216;
    int _2256 = _2254 + _1822;
    bool _2258 = uint(_2176) >= 2u;
    float _2260 = fma(_2048, _2198, _2170);
    float _2262 = fma(_2084, _2198, _2200);
    int _2264 = _2148 >> 31;
    float _2266 = _403 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2268 = !_1708;
    int _2270 = _2268 ? _2256 : (-1);
    int _2272 = _2252 * _2094;
    int _2274 = _2272 + _1672;
    int _2276 = _2258 ? 0 : 1;
    float _2278 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2230);
    bool _2280 = _2176 != 3;
    float _2282 = _395 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2284 = _2264 & 3;
    float _2286 = _2266 * _2180;
    int _2288 = _2270 >> 31;
    float _2290 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2246);
    int _2292 = _2148 + _2284;
    float _2294 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2248);
    int _2296 = _2288 & 3;
    int _2298 = ~_731;
    int _2300 = _2298 + 1;
    int _2302 = _2270 + _2296;
    int _2304 = _2292 >> 2;
    int _2306 = ~_2276;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = _2310;
    if (_2280)
    {
        int _2314 = ~_2276;
        int _2316 = _2314 + 1;
        _2312 = _2316;
    }
    int _2318 = _2312;
    int _2320 = _2302 >> 2;
    int _2322 = _2300 * _2112;
    int _2324 = _2322 + _1678;
    int _2326 = _2304 << 4;
    int _2328 = _2326 + 368;
    float _2330 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2206);
    bool _2332 = uint(_2274) >= uint(_777);
    int _2334 = _2320 << 4;
    int _2336 = _2334 + 512;
    uint _2338 = uint(int(uint(_2328) >> uint(2)));
    uint _2340 = uint(int(uint(int(_2338)) >> uint(2)));
    int _2342 = int(_2338) & 3;
    float _2344 = (*spvDescriptorSet0.vp_c9)._m0[int(_2340)][_2342];
    int _2346 = int(_2338) + 1;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    int _2350 = _2346 & 3;
    float _2352 = (*spvDescriptorSet0.vp_c9)._m0[int(_2348)][_2350];
    bool _2354 = !_2332;
    int _2356 = _2354 ? 0 : (-1);
    float _2358 = fma(_2282, _2330, _2286);
    bool _2360 = uint(_2324) >= uint(_731);
    float _2362 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2202);
    float _2364 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2208);
    int _2366 = ~_2094;
    int _2368 = _2366 + _2356;
    int _2370 = _2368 + 1;
    float _2372 = _2266 * _2194;
    uint _2374 = uint(int(uint(_2336) >> uint(2)));
    uint _2376 = uint(int(uint(int(_2374)) >> uint(2)));
    int _2378 = int(_2374) & 3;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[int(_2376)][_2378];
    int _2382 = int(_2374) + 1;
    uint _2384 = uint(int(uint(_2382) >> uint(2)));
    int _2386 = _2382 & 3;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[int(_2384)][_2386];
    bool _2390 = !_2178;
    int _2392 = _2390 ? 0 : 1;
    out.m_72.x = _2330;
    out.m_72.y = _2362;
    out.m_72.z = _2364;
    int _2394 = _2270 & 3;
    bool _2396 = _2394 != 0;
    float _2398 = fma(_2282, _2362, _2372);
    bool _2400 = !_2360;
    int _2402 = _2400 ? 0 : (-1);
    int _2404 = _777 * _2370;
    int _2406 = _2404 + _1672;
    bool _2408 = uint(_2394) > 1u;
    int _2410 = _2328 + 8;
    uint _2412 = uint(int(uint(_2410) >> uint(2)));
    uint _2414 = uint(int(uint(int(_2412)) >> uint(2)));
    int _2416 = int(_2412) & 3;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[int(_2414)][_2416];
    int _2420 = int(_2412) + 1;
    uint _2422 = uint(int(uint(_2420) >> uint(2)));
    int _2424 = _2420 & 3;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[int(_2422)][_2424];
    int _2428 = _2270 & 3;
    bool _2430 = _2428 != 0;
    float _2432 = _2266 * _2204;
    int _2434 = ~_2112;
    int _2436 = _2434 + _2402;
    int _2438 = _2436 + 1;
    int _2440 = _2430 ? 0 : 1;
    float _2442 = fma(_2282, _2364, _2432);
    int _2444 = abs(_2392);
    int _2446 = _2336 + 8;
    uint _2448 = uint(int(uint(_2446) >> uint(2)));
    uint _2450 = uint(int(uint(int(_2448)) >> uint(2)));
    int _2452 = int(_2448) & 3;
    float _2454 = (*spvDescriptorSet0.vp_c9)._m0[int(_2450)][_2452];
    int _2456 = int(_2448) + 1;
    uint _2458 = uint(int(uint(_2456) >> uint(2)));
    int _2460 = _2456 & 3;
    float _2462 = (*spvDescriptorSet0.vp_c9)._m0[int(_2458)][_2460];
    int _2464 = ~_2440;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    int _2470 = _731 * _2438;
    int _2472 = _2470 + _1678;
    bool _2474 = !_2396;
    int _2476 = _2474 ? 0 : 1;
    float _2478 = _2294 + _2442;
    int _2480 = _2468;
    if (!_2408)
    {
        int _2482 = ~_2440;
        int _2484 = _2482 + 1;
        _2480 = _2484;
    }
    int _2486 = _2480;
    int _2488 = abs(_2244);
    bool _2490 = _2394 != 3;
    int _2492 = abs(_2486);
    int _2494 = ~_2488;
    int _2496 = _2494 + 1;
    int _2498 = _2496 + 1;
    int _2500 = abs(_2476);
    bool _2502 = uint(_2394) >= 2u;
    int _2504 = ~_2492;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    int _2510 = abs(_2318);
    int _2512 = _2498 * as_type<int>(_2352);
    int _2514 = ~_2444;
    int _2516 = _2514 + 1;
    int _2518 = _2516 + 1;
    int _2520 = _2502 ? 0 : 1;
    int _2522 = ~_2500;
    int _2524 = _2522 + 1;
    int _2526 = _2524 + 1;
    int _2528 = _2508 * as_type<int>(_2388);
    int _2530 = ~_2510;
    int _2532 = _2530 + 1;
    int _2534 = _2532 + 1;
    int _2536 = _2518 * as_type<int>(_2344);
    int _2538 = _2536 + _2512;
    int _2540 = ~_2520;
    int _2542 = _2540 + 1;
    int _2544 = _2542 + 1;
    float _2546 = fma(_2266, _2266, 1.0);
    bool _2548 = _2394 != 3;
    int _2550 = _2526 * as_type<int>(_2380);
    int _2552 = _2550 + _2528;
    int _2554 = _2544;
    if (_2490)
    {
        int _2556 = ~_2520;
        int _2558 = _2556 + 1;
        _2554 = _2558;
    }
    int _2560 = _2554;
    int _2562 = _2534 * as_type<int>(_2418);
    int _2564 = _2562 + _2538;
    bool _2566 = _2176 != 3;
    float _2568 = rsqrt(_2546);
    bool _2570 = !_2548;
    int _2572 = _2570 ? 0 : (-1);
    int _2574 = abs(_2560);
    bool _2576 = !_2566;
    int _2578 = _2576 ? 0 : (-1);
    bool _2580 = !_1206;
    int _2582 = _2580 ? 0 : 1;
    int _2584 = abs(_1972);
    int _2586 = abs(_2572);
    int _2588 = abs(_2578);
    float _2590 = _2266 * _2568;
    int _2592 = abs(_2582);
    int _2594 = ~_2574;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    int _2600 = ~_2588;
    int _2602 = _2600 + 1;
    int _2604 = _2602 + 1;
    int _2606 = _2598 * as_type<int>(_2454);
    int _2608 = _2606 + _2552;
    int _2610 = _2604 * as_type<int>(_2426);
    int _2612 = _2610 + _2564;
    int _2614 = ~_2586;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    float _2620 = -_2294;
    float _2622 = _2590 * _2620;
    int _2624 = ~_2584;
    int _2626 = _2624 + 1;
    int _2628 = _2626 + 1;
    int _2630 = ~_2592;
    int _2632 = _2630 + 1;
    int _2634 = _2632 + 1;
    int _2636 = _2618 * as_type<int>(_2462);
    int _2638 = _2636 + _2608;
    bool _2640 = !_1664;
    int _2642 = _2640 ? _2406 : (-1);
    int _2644 = _2612 * _2628;
    float _2646 = -_2278;
    float _2648 = _2590 * _2646;
    int _2650 = _2638 * _2634;
    float _2652 = -_2290;
    float _2654 = _2590 * _2652;
    int _2656 = _2642 * _2584;
    int _2658 = _2656 + _2644;
    float _2660 = fma(_2568, _2180, _2648);
    float _2662 = _2290 + _2398;
    float _2664 = fma(_2568, _2194, _2654);
    float _2666 = _2278 + _2358;
    bool _2668 = !_1708;
    int _2670 = _2668 ? _2472 : (-1);
    float _2672 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2674 = 1.0 != (*spvDescriptorSet0.vp_c12)._m0[10].x;
    bool _2676 = isnan(1.0);
    bool _2678 = _2674 || _2676;
    bool _2680 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _2682 = _2678 || _2680;
    float _2684 = fma(_2568, _2204, _2622);
    out.m_74.x = _2666;
    out.m_74.y = _2662;
    out.m_74.z = _2478;
    int _2686 = _2670 * _2592;
    int _2688 = _2686 + _2650;
    float _2690 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2692 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2694 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2672);
    float _2696 = _2034 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _2698 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2690);
    float _2700 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2692);
    float _2702 = float(_2658);
    float _2704 = fma(_2696, (*spvDescriptorSet0.vp_c12)._m0[4].x, _2100);
    float _2706 = float(_2688);
    float _2708 = fma(_2696, (*spvDescriptorSet0.vp_c12)._m0[4].y, _2102);
    float _2710 = fma(_2696, (*spvDescriptorSet0.vp_c12)._m0[4].z, _2104);
    float _2712 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2694);
    float _2714 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2698);
    float _2716 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2700);
    out.m_76.x = _2660;
    out.m_76.y = _2664;
    out.m_76.z = _2684;
    float _2718 = _2704 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _2720 = _2712 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2722 = _2714 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_78.x = _2702;
    out.m_78.y = _2706;
    float _2724 = _2720 + _2718;
    float _2726 = _2708 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _2728 = _2710 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _2730 = _2716 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2732 = _2722 + _2726;
    float _2734 = _2730 + _2728;
    float _2736 = _2730;
    float _2738 = _2720;
    float _2740 = _2702;
    float _2742 = _2730;
    float _2744 = _2702;
    float _2746 = _2720;
    float _2748 = _2660;
    float _2750 = _2716;
    float _2752 = _2734;
    float _2762;
    float _2764;
    float _2766;
    float _2768;
    if (!_2682)
    {
        bool _2754 = _2726 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _2756 = !_2754;
        _2758 = _2756;
        if (!_2758)
        {
            float _2760 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _2762 = _2760;
            _2764 = 0.0;
            _2766 = 0.0;
            _2768 = 0.0;
            _2770 = true;
        }
    }
    if ((!_2770) || _2758)
    {
        bool _2808;
        if (!_2758)
        {
            bool _2772 = _2726 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _2774 = isnan(_2726);
            bool _2776 = _2772 || _2774;
            bool _2778 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _2780 = _2776 || _2778;
            bool _2782 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _2784 = !_2780;
            bool _2786 = _2782 && _2784;
            bool _2788 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            float _2790 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
            if (_2786)
            {
                _2736 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _2792 = _2736;
            float _2794 = _2792;
            if (_2786)
            {
                _2738 = 0.0;
            }
            float _2796 = _2738;
            _2746 = _2796;
            _2764 = _2796;
            if (_2786)
            {
                _2740 = 0.0;
            }
            float _2798 = _2740;
            _2744 = _2798;
            _2766 = _2798;
            if (_2786)
            {
                float _2800 = _2792 * 5.0;
                _2794 = _2800;
            }
            float _2802 = _2794;
            _2742 = _2802;
            _2762 = _2802;
            if (_2786)
            {
                _2790 = 0.0;
            }
            float _2804 = _2790;
            bool _2806 = !_2780;
            _2808 = _2806 && _2788;
            _2748 = _2804;
            _2768 = _2804;
        }
        if ((!_2808) || _2758)
        {
            _2758 = false;
            float _2810 = _2742;
            float _2812 = _2744;
            float _2814 = _2746;
            float _2816 = _2748;
            bool _2818 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _2820 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _2822 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _2824 = _2810;
            float _2826 = _2812;
            float _2828 = _2814;
            float _2830 = _2816;
            if (_2818)
            {
                float _2832 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _2824 = _2832;
            }
            float _2834 = _2824;
            if (_2818)
            {
                float _2836 = abs(_2056);
                float _2838 = -_2836;
                float _2840 = _2838 + 1.0;
                _2234 = _2840;
            }
            float _2842 = _2234;
            if (_2820)
            {
                float _2844 = abs(_2050);
                float _2846 = -_2844;
                float _2848 = _2846 + 1.0;
                _2236 = _2848;
            }
            float _2850 = _2236;
            _2238 = _2850;
            if (!_2818)
            {
                _2826 = 1.0;
            }
            float _2852 = _2826;
            float _2854 = _2852;
            if (!_2820)
            {
                _2828 = 1.0;
            }
            float _2856 = _2828;
            float _2858 = _2856;
            if (!_2822)
            {
                _2830 = 1.0;
            }
            float _2860 = _2830;
            float _2862 = _2690;
            float _2864 = _2860;
            if (_2820)
            {
                float _2866 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _2862 = _2866;
            }
            float _2868 = _2862;
            float _2870 = _2722;
            if (_2822)
            {
                float _2872 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _2870 = _2872;
            }
            float _2874 = _2870;
            float _2876 = _2834;
            if (_2818)
            {
                float _2878 = _2842 * _2834;
                float _2880 = precise::clamp(_2878, 0.0, 1.0);
                _2854 = _2880;
            }
            float _2882 = _2854;
            if (_2822)
            {
                float _2884 = abs(_2034);
                float _2886 = -_2884;
                float _2888 = _2886 + 1.0;
                _2876 = _2888;
            }
            float _2890 = _2876;
            if (_2820)
            {
                float _2892 = _2850 * _2868;
                float _2894 = precise::clamp(_2892, 0.0, 1.0);
                _2858 = _2894;
            }
            float _2896 = _2858;
            if (_2822)
            {
                float _2898 = _2890 * _2874;
                float _2900 = precise::clamp(_2898, 0.0, 1.0);
                _2864 = _2900;
            }
            float _2902 = _2864;
            float _2904 = _2882 * _2896;
            float _2906 = _2904 * _2902;
            _2762 = _2734;
            _2764 = _2724;
            _2766 = _2732;
            _2768 = _2906;
        }
    }
    _2770 = false;
    float _2908 = _2762;
    float _2910 = _2764;
    float _2912 = _2766;
    float _2914 = _2238;
    float _2916 = _2768;
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2920 = _2908 + _2918;
    float _2922 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2924 = _2910 + _2922;
    float _2926 = _2920 * _2920;
    float _2928 = fma(_2924, _2924, _2926);
    float _2930 = sqrt(_2928);
    bool _2932 = _2930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _2934 = !_2932;
    float _2936 = _2912;
    float _2938 = _2910;
    float _2940 = _2908;
    float _2942 = _2914;
    float _2944 = _2924;
    if (!_2934)
    {
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2950 = _2930 + _2948;
        float _2952 = rsqrt(_2928);
        float _2954 = _2950 * _2946;
        float _2956 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2958 = _2954 * 0.15915493667125701904296875;
        float _2960 = _2958 * 6.283185482025146484375;
        float _2962 = cos(_2960);
        float _2964 = _2958 * 6.283185482025146484375;
        float _2966 = sin(_2964);
        float _2968 = _2962 + (-1.0);
        float _2970 = fma(_2966, _2956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2972 = _2968 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2974 = _2952 * _2970;
        float _2976 = fma(_2962, _2912, _2972);
        float _2978 = fma(_2924, _2974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2980 = fma(_2920, _2974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2936 = _2976;
        _2938 = _2978;
        _2940 = _2980;
    }
    float _2982 = _2936;
    float _2984 = _2938;
    float _2986 = _2940;
    float _2988 = -_2726;
    float _2990 = _2988 + _2982;
    float _2992 = -_2718;
    float _2994 = _2992 + _2984;
    float _2996 = -_2728;
    float _2998 = _2996 + _2986;
    float _3000 = _2990 * _2990;
    float _3002 = fma(_2994, _2994, _3000);
    float _3004 = fma(_2998, _2998, _3002);
    float _3006 = sqrt(_3004);
    bool _3008 = _3006 > 0.0;
    bool _3010 = !_3008;
    float _3012 = _3006;
    float _3014 = _2984;
    float _3016 = _2986;
    float _3018 = _2982;
    if (!_3010)
    {
        bool _3020 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3022 = _2704;
        if (_3020)
        {
            float _3024 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3022 = _3024;
        }
        float _3026 = _3022;
        if (_3020)
        {
            _2942 = _663;
        }
        float _3028 = _2942;
        float _3030 = _3028;
        if (_3020)
        {
            _2944 = _665;
        }
        float _3032 = _2944;
        float _3034 = _3032;
        if (_3020)
        {
            _3012 = _667;
        }
        float _3036 = _3012;
        float _3038 = _3026;
        float _3040 = _3036;
        if (_3020)
        {
            float _3042 = _663 * _3026;
            _2750 = _3042;
        }
        float _3044 = _2750;
        float _3046 = _3044;
        if (_3020)
        {
            float _3048 = _665 * _3026;
            _2752 = _3048;
        }
        float _3050 = _2752;
        float _3052 = _3050;
        if (_3020)
        {
            float _3054 = _667 * _3026;
            _3038 = _3054;
        }
        float _3056 = _3038;
        float _3058 = _3056;
        if (!_3020)
        {
            bool _3060 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _3062 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _3064 = _3060 || _3062;
            bool _3066 = isnan(1.0);
            bool _3068 = _3064 || _3066;
            float _3070 = _145 + 1.0;
            if (!_3068)
            {
                float _3072 = _3070 * _3070;
                float _3074 = _3072 * 0.5;
                _147 = _3074;
            }
            float _3076 = _147;
            float _3078 = _3076;
            if (!_3068)
            {
                float _3080 = _3076 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3078 = _3080;
            }
            float _3082 = _3078;
            bool _3084 = !_3068;
            float _3086 = _3082;
            if (!_3084)
            {
                float _3088 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3090 = log2(_3088);
                float _3092 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3094 = 1.0 + _3092;
                float _3096 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3098 = _3090 * _3070;
                float _3100 = 1.0 / _3094;
                float _3102 = _3096 * 0.693147182464599609375;
                float _3104 = exp2(_3098);
                float _3106 = 1.0 / _3102;
                float _3108 = _3104 + (-1.0);
                float _3110 = -_3108;
                float _3112 = fma(_3110, _3106, _3070);
                float _3114 = _3112 * _3100;
                float _3116 = _3114 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3086 = _3116;
            }
            float _3118 = _3086;
            float _3120 = _3118 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _3122 = _3118 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3124 = _3118 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3126 = _3118;
            if (!_3068)
            {
                _3126 = _3070;
            }
            float _3128 = _3126;
            float _3130 = _3120 * _387;
            float _3132 = _3120 * _311;
            float _3134 = _3120 * _413;
            float _3136 = fma(_3122, _379, _3130);
            float _3138 = fma(_3122, _307, _3132);
            float _3140 = fma(_3124, _391, _3136);
            bool _3142 = !_3068;
            float _3144 = _3128;
            if (!_3142)
            {
                float _3146 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3148 = log2(_3146);
                float _3150 = _3148 * _3070;
                float _3152 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3154 = 1.0 + _3152;
                float _3156 = exp2(_3150);
                float _3158 = 1.0 / _3154;
                float _3160 = -_3156;
                float _3162 = _3160 + 1.0;
                float _3164 = _3162 * _3158;
                _3144 = _3164;
            }
            float _3166 = _3144;
            float _3168 = fma(_3122, _409, _3134);
            float _3170 = fma(_3124, _315, _3138);
            float _3172 = fma(_3166, _263, _3140);
            float _3174 = fma(_3124, _417, _3168);
            float _3176 = fma(_3166, _261, _3170);
            float _3178 = -_625;
            float _3180 = _3178 + _3172;
            float _3182 = fma(_3166, _265, _3174);
            float _3184 = -_629;
            float _3186 = _3184 + _3176;
            float _3188 = _3180 * _175;
            float _3190 = _3180 * _169;
            float _3192 = _3180 * _181;
            float _3194 = -_631;
            float _3196 = _3194 + _3182;
            float _3198 = fma(_3186, _173, _3188);
            float _3200 = fma(_3186, _167, _3190);
            float _3202 = fma(_3186, _179, _3192);
            float _3204 = fma(_3196, _177, _3198);
            float _3206 = fma(_3196, _171, _3200);
            float _3208 = fma(_3196, _183, _3202);
            _3034 = _3206;
            _3030 = _3204;
            _3040 = _3208;
            _3046 = _3204;
            _3052 = _3206;
            _3058 = _3208;
            _423 = _3182;
            _381 = _3180;
        }
        float _3210 = _3034;
        float _3212 = _3030;
        float _3214 = _3040;
        float _3216 = _3046;
        float _3218 = _3052;
        float _3220 = _3058;
        float _3222 = _423;
        float _3224 = _381;
        float _3226 = _3210 * _3210;
        float _3228 = rsqrt(_3004);
        float _3230 = fma(_3212, _3212, _3226);
        float _3232 = fma(_3214, _3214, _3230);
        float _3234 = sqrt(_3232);
        float _3236 = _2994 * _3228;
        float _3238 = _2990 * _3228;
        float _3240 = _2998 * _3228;
        bool _3242 = _3234 > 0.0;
        bool _3244 = !_3242;
        _425 = _3234;
        _427 = _3222;
        _383 = _3224;
        if (!_3244)
        {
            float _3246 = rsqrt(_3232);
            float _3248 = _3246 * _3210;
            float _3250 = _3246 * _3212;
            float _3252 = _3246 * _3214;
            float _3254 = _3238 * _3248;
            float _3256 = fma(_3236, _3250, _3254);
            float _3258 = fma(_3240, _3252, _3256);
            float _3260 = _3258 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3262 = fma(_3216, _3260, _2984);
            float _3264 = fma(_3218, _3260, _2982);
            float _3266 = fma(_3220, _3260, _2986);
            _3014 = _3262;
            _3016 = _3266;
            _3018 = _3264;
            _425 = _3260;
            _427 = _3248;
        }
    }
    float _3268 = _3014;
    float _3270 = _3016;
    float _3272 = _3018;
    float _3274 = _425;
    float _3276 = _427;
    float _3278 = _383;
    float _3280 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _3282 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _3284 = isnan(0.5);
    bool _3286 = _3282 || _3284;
    bool _3288 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3290 = _3286 || _3288;
    bool _3292 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3294 = isnan(0.5);
    bool _3296 = _3292 || _3294;
    bool _3298 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3300 = _3296 || _3298;
    float _3302 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3280);
    float _3304 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3306 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3302);
    float _3308 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3304);
    float _3310 = _3306 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3312 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3308);
    float _3314 = _3274;
    float _3316 = _3276;
    float _3318 = _3306;
    float _3320 = _3278;
    if (_3290)
    {
        _3314 = _3268;
    }
    float _3322 = _3314;
    float _3324 = 1.0 / _3310;
    float _3326 = _3312 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3328 = _3326;
    float _3330 = _3322;
    if (_3290)
    {
        _3316 = _3270;
    }
    float _3332 = _3316;
    float _3334 = _3326 + _3310;
    float _3336 = _3332;
    if (_3290)
    {
        _3328 = _3272;
    }
    float _3338 = _3328;
    float _3340 = _3338;
    if (!_3290)
    {
        float _3342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3344 = _2726 + _3342;
        float _3346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3348 = _2718 + _3346;
        float _3350 = -_2718;
        float _3352 = _3350 + _3268;
        float _3354 = -_2726;
        float _3356 = _3354 + _3272;
        float _3358 = _3344 * _3344;
        float _3360 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3362 = _2728 + _3360;
        float _3364 = -_2728;
        float _3366 = _3364 + _3270;
        float _3368 = fma(_3348, _3348, _3358);
        float _3370 = fma(_3362, _3362, _3368);
        float _3372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3374 = sqrt(_3370);
        float _3376 = precise::min(_3374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3378 = _3376 * _3372;
        float _3380 = fma(_3352, _3378, _2718);
        float _3382 = fma(_3356, _3378, _2726);
        float _3384 = fma(_3366, _3378, _2728);
        _3340 = _3382;
        _3330 = _3380;
        _3336 = _3384;
        _3318 = _3374;
    }
    float _3386 = _3340;
    float _3388 = _3330;
    float _3390 = _3336;
    float _3392 = _3318;
    float _3394 = _3392;
    if (_3300)
    {
        _3394 = 1.0;
    }
    float _3396 = _3394;
    float _3398 = _3334 * _3324;
    float _3400 = _3398 * 0.5;
    float _3402 = _3396;
    if (!_3300)
    {
        float _3404 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3406 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3404);
        float _3408 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3410 = _3408 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _3412 = 1.0 / _3406;
        float _3414 = 1.0 / _3410;
        float _3416 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3418 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3420 = fma(_3412, _3416, _3418);
        float _3422 = _3420 * _3414;
        float _3424 = precise::clamp(_3422, 0.0, 1.0);
        _3402 = _3424;
    }
    float _3426 = _3402;
    float _3428 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3430 = _3386 + _3428;
    float _3432 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3434 = _3388 + _3432;
    float _3436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3438 = _3390 + _3436;
    float _3440 = _3430 * _3430;
    float _3442 = fma(_3434, _3434, _3440);
    float _3444 = fma(_3438, _3438, _3442);
    float _3446 = rsqrt(_3444);
    float _3448 = sqrt(_3444);
    float _3450 = _3446 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3452 = _3434 * _3450;
    float _3454 = _3438 * _3450;
    float _3456 = _3452 * _3452;
    float _3458 = _3454 * _3454;
    float _3460 = _3456 + _3458;
    float _3462 = sqrt(_3460);
    bool _3464 = _3462 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3468 = _3462 + _3466;
    float _3470 = _3446;
    float _3472 = _3468;
    float _3474 = _3430;
    if (_3464)
    {
        float _3476 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3470 = _3476;
    }
    float _3478 = _3470;
    float _3480 = _3478;
    if (_3464)
    {
        float _3482 = _3468 * _3478;
        _3472 = _3482;
    }
    float _3484 = _3472;
    if (_3464)
    {
        float _3486 = rsqrt(_3460);
        _3480 = _3486;
    }
    float _3488 = _3480;
    float _3490 = _3488;
    if (_3464)
    {
        float _3492 = _3484 * 0.15915493667125701904296875;
        _227 = _3492;
    }
    float _3494 = _227;
    float _3496 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3498 = _3438;
    float _3500 = _3494;
    if (_3464)
    {
        float _3502 = _3494 * 6.283185482025146484375;
        float _3504 = sin(_3502);
        _3498 = _3504;
    }
    float _3506 = _3498;
    float _3508 = precise::max(0.0, _3496);
    float _3510 = _175;
    float _3512 = _3508;
    if (_3464)
    {
        float _3514 = _3494 * 6.283185482025146484375;
        float _3516 = cos(_3514);
        _3510 = _3516;
    }
    float _3518 = _3510;
    float _3520 = -_3450;
    float _3522 = -_3508;
    float _3524 = fma(_3430, _3520, _3522);
    if (_3464)
    {
        float _3526 = _3524 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3474 = _3526;
    }
    float _3528 = _3474;
    float _3530 = _3506;
    float _3532 = _3528;
    if (_3464)
    {
        float _3534 = fma(_3506, _3528, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3530 = _3534;
    }
    float _3536 = _3530;
    float _3538 = _3536;
    if (!_3464)
    {
        _3532 = _3524;
    }
    float _3540 = _3532;
    float _3542 = _3540;
    if (_3464)
    {
        float _3544 = _3488 * _3536;
        _3320 = _3544;
    }
    float _3546 = _3320;
    if (!_3464)
    {
        _3490 = _3452;
    }
    float _3548 = _3490;
    float _3550 = _3548;
    float _3552 = _3518;
    if (_3464)
    {
        float _3554 = _3518 + (-1.0);
        _3512 = _3554;
    }
    float _3556 = _3512;
    float _3558 = _3556;
    if (_3464)
    {
        float _3560 = _3452 * _3546;
        _3550 = _3560;
    }
    float _3562 = _3550;
    if (!_3464)
    {
        _3538 = _3456;
    }
    float _3564 = _3538;
    float _3566 = _3386 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3568 = _3564;
    if (_3464)
    {
        float _3570 = _3556 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3500 = _3570;
    }
    float _3572 = _3500;
    if (!_3464)
    {
        _3558 = _3454;
    }
    float _3574 = _3558;
    float _3576 = _3574;
    if (_3464)
    {
        float _3578 = _3454 * _3546;
        _3576 = _3578;
    }
    float _3580 = _3576;
    if (_3464)
    {
        float _3582 = _3562 * _3562;
        _3568 = _3582;
    }
    float _3584 = _3568;
    if (_3464)
    {
        float _3586 = fma(_3524, _3518, _3572);
        _3542 = _3586;
    }
    float _3588 = _3542;
    if (!_3464)
    {
        _3552 = _3458;
    }
    float _3590 = _3552;
    float _3592 = _3590;
    if (_3464)
    {
        float _3594 = _3580 * _3580;
        _3592 = _3594;
    }
    float _3596 = _3592;
    float _3598 = fma(_3588, _3588, _3584);
    float _3600 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3602 = _3598 + _3596;
    float _3604 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3606 = fma(_3448, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3604);
    float _3608 = precise::clamp(_3606, 0.0, 1.0);
    float _3610 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3566);
    float _3612 = _3386 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3614 = rsqrt(_3602);
    float _3616 = -_3608;
    float _3618 = _3616 + 1.0;
    float _3620 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3610);
    float _3622 = _3386 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3624 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3612);
    float _3626 = _3386 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3628 = _3620 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3630 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3622);
    float _3632 = abs(_3618);
    float _3634 = log2(_3632);
    float _3636 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3624);
    float _3638 = fma(_3388, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3626);
    float _3640 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3630);
    float _3642 = _3628 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3644 = _3636 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3646 = fma(_3390, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3638);
    float _3648 = _3640 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3650 = _3614 * _3562;
    float _3652 = _3644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3654 = _3646 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3656 = _3614 * _3588;
    float _3658 = _3650 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3660 = -_3642;
    float _3662 = fma(_3660, _3600, 1.0);
    float _3664 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3652);
    float _3666 = _3614 * _3580;
    float _3668 = _3634 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3670 = -_3658;
    float _3672 = fma(_3656, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3670);
    float _3674 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3664);
    float _3676 = log2(_3662);
    float _3678 = _3644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3680 = -_3666;
    float _3682 = fma(_3680, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3672);
    float _3684 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3674);
    float _3686 = _3644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3688 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3678);
    float _3690 = fma(_3682, -0.5, 0.5);
    float _3692 = exp2(_3668);
    float _3694 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3686);
    float _3696 = fma(_3682, 0.5, 0.5);
    float _3698 = _3656 + 1.0;
    float _3700 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3688);
    float _3702 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3694);
    float _3704 = fma(_3696, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3706 = 1.0 / _3684;
    float _3708 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3702);
    float _3710 = fma(_3696, _3704, -0.212114393711090087890625);
    float _3712 = _3676 * 0.693147182464599609375;
    float _3714 = fma(_3696, _3710, 1.570728778839111328125);
    float _3716 = sqrt(_3690);
    float _3718 = -_3656;
    float _3720 = fma(_3692, _3698, _3718);
    float _3722 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3700);
    float _3724 = _3712 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3726 = fma(_3720, 0.5, 0.5);
    float _3728 = _3708 * _3706;
    float _3730 = _3722 * _3706;
    float _3732 = fma(_3728, 0.5, 0.5);
    float _3734 = fma(_3730, -0.5, 0.5);
    float _3736 = _3716 * 0.636619746685028076171875;
    float3 _9888 = float3(_3732, _3734, _3724);
    float _3738 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9888, float3(0.0), isnan(_9888)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9888, float3(0.0), isnan(_9888)), level(0.0)).x;
    float _3740 = -_3714;
    float _3742 = fma(_3736, _3740, 1.0);
    float3 _9904 = float3(_3732, _3734, _3724);
    float4 _3745 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9904, float3(0.0), isnan(_9904)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9904, float3(0.0), isnan(_9904)), level(0.0)).xyzw;
    float _3747 = _3745.x;
    float _3749 = _3745.y;
    float _3751 = _3745.z;
    float _3753 = _3745.w;
    float2 _9921 = float2(_3742, _3726);
    float3 _3757 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9921, float2(0.0), isnan(_9921)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9921, float2(0.0), isnan(_9921)), level(0.0)).xyz;
    float _3759 = _3757.x;
    float _3761 = _3757.y;
    float _3763 = _3757.z;
    float _3765 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3767 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3769 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3771 = _2726 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3773 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3765);
    float _3775 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3767);
    float _3777 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3769);
    float _3779 = fma(_2718, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3771);
    float _3781 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3773);
    float _3783 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3775);
    float _3785 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3777);
    float _3787 = fma(_2728, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3779);
    float _3789 = _3781 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3791 = _3783 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3793 = -_665;
    float _3795 = _3793 + _3386;
    float _3797 = _3785 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3799 = _3789 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3801 = _3789 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3803 = _3644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3805 = _3789 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3807 = fma(_3791, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3799);
    float _3809 = -_663;
    float _3811 = _3809 + _3388;
    float _3813 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    out.m_80.y = 1.0;
    float _3815 = fma(_3791, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3801);
    float _3817 = _3797 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _3819 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3803);
    float _3821 = fma(_3791, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3805);
    float _3823 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[635].x, _3813);
    float _3825 = _3787 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3827 = _3817 + _3815;
    float _3829 = _3789 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3831 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3819);
    float _3833 = _3634 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3835 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3827);
    float _3837 = fma(_3791, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3829);
    float _3839 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _3841 = _3795 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _3843 = -_667;
    float _3845 = _3843 + _3390;
    float _3847 = exp2(_3833);
    float _3849 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[636].x, _3839);
    float _3851 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[638].x, _3841);
    float _3853 = fma(_3797, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3837);
    float _3855 = fma(_3654, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3831);
    float _3857 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[635].z, _3823);
    float _3859 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[638].z, _3851);
    float _3861 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3853);
    float _3863 = 1.0 / _3835;
    float _3865 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    float _3867 = _3859 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _3869 = _3684 * 0.5;
    float _3871 = _3855 + _3684;
    out.gl_Position.x = _3708;
    out.gl_Position.y = _3722;
    out.gl_Position.z = _3855;
    out.gl_Position.w = _3684;
    float _3873 = fma(_3845, (*spvDescriptorSet0.vp_c15)._m0[636].z, _3849);
    float _3875 = fma(_3722, -0.5, _3869);
    float _3877 = 1.0 / _3867;
    float _3879 = -_3847;
    float _3881 = _3879 + 1.0;
    out.m_82.x = _3388;
    out.m_82.y = _3386;
    out.m_82.z = _3390;
    float _3883 = _3797 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _3885 = _3797 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _3887 = _3881 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3889 = _3708 + _3684;
    float _3891 = _3861 * _3863;
    float _3893 = _3883 + _3807;
    float _3895 = _3885 + _3821;
    float _3897 = -_3887;
    float _3899 = _3897 + 1.0;
    float _3901 = _3871 * 0.5;
    bool _3903 = _3891 > 0.0;
    float _3905 = _3889 * 0.5;
    float _3907 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    float _3909 = _3865 * _3877;
    bool _3911 = _3891 < 1.0;
    bool _3913 = _3911 && _3903;
    float _3915 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3893);
    float _3917 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3895);
    bool _3919 = _3728 > (-1.0);
    bool _3921 = _3919 && _3913;
    out.m_84.x = _3905;
    out.m_84.y = _3875;
    out.m_84.z = _3901;
    out.m_84.w = _3684;
    float _3923 = _3907 * _3877;
    bool _3925 = _3730 > (-1.0);
    bool _3927 = _3925 && _3921;
    bool _3929 = _3728 < 1.0;
    bool _3931 = _3929 && _3927;
    bool _3933 = _3730 < 1.0;
    bool _3935 = _3933 && _3931;
    float _3937 = _3915 * _3863;
    float _3939 = _3917 * _3863;
    float _3941 = _3887 * _3738;
    float _3943 = _3753 * _3941;
    float _3945 = _3763 * _3941;
    float _3947 = fma(_3759, _3943, _3747);
    float _3949 = fma(_3761, _3943, _3749);
    float _3951 = _3753 * _3899;
    float _3953 = fma(_3753, _3945, _3751);
    out.m_86.x = _3947;
    out.m_86.y = _3949;
    out.m_86.z = _3953;
    out.m_86.w = _3951;
    bool _3955 = !_3935;
    float _3957 = _3753;
    float _3959 = _3722;
    float _3961 = _3751;
    float _3963 = _3943;
    float _3965 = _3899;
    float _3967 = _3708;
    float _3969 = _3684;
    float _4003;
    if (!_3955)
    {
        float _3971 = -_3939;
        float _3973 = _3730 + _3971;
        float _3975 = -_3937;
        float _3977 = _3728 + _3975;
        float _3979 = _2916 * _3426;
        float _3981 = -_3909;
        float _3983 = _3728 + _3981;
        float _3985 = _3973 * _3973;
        float _3987 = -_3923;
        float _3989 = _3730 + _3987;
        float _3991 = _3979 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _3993 = fma(_3977, _3977, _3985);
        float _3995 = sqrt(_3993);
        bool _3997 = _3995 > 0.0;
        _3961 = _3993;
        _3963 = _3977;
        _3965 = _3995;
        if (!_3997)
        {
            _3957 = _3991;
        }
        float _3999 = _3957;
        bool _4001 = !_3997;
        _4003 = _3999;
        _4005 = _4001;
        if (!_4005)
        {
            float _4007 = _3989 * _3989;
            float _4009 = fma(_3983, _3983, _4007);
            float _4011 = rsqrt(_3993);
            float _4013 = sqrt(_4009);
            float _4015 = _3977 * _4011;
            float _4017 = _3973 * _4011;
            bool _4019 = _4013 > 0.0;
            float _4021 = _4013;
            _3965 = _4011;
            if (!_4019)
            {
                _4021 = _3991;
            }
            float _4023 = _4021;
            bool _4025 = !_4019;
            _4003 = _4023;
            _4005 = _4025;
            if (!_4005)
            {
                float _4027 = _2110 * _3825;
                float _4029 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _4031 = fma(_4027, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3817);
                float _4033 = fma(_4027, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3885);
                float _4035 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4031);
                float _4037 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4033);
                float _4039 = 1.0 / _4035;
                float _4041 = _4029 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _4043 = fma(_4027, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3883);
                float _4045 = rsqrt(_4009);
                float _4047 = _3989 * _4041;
                float _4049 = fma(_3825, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4043);
                float _4051 = _3983 * _4041;
                float _4053 = _4047 * _4047;
                float _4055 = _4037 * _4039;
                float _4057 = _4049 * _4039;
                float _4059 = fma(_4051, _4051, _4053);
                float _4061 = _4055 * _4055;
                float _4063 = fma(_4057, _4057, _4061);
                float _4065 = sqrt(_4059);
                float _4067 = _3989 * _4045;
                float _4069 = _3983 * _4045;
                float _4071 = _4017 * _4067;
                float _4073 = sqrt(_4063);
                float _4075 = fma(_4015, _4069, _4071);
                float _4077 = precise::min(0.0, _4075);
                float _4079 = _3684 * _4077;
                float _4081 = fma(_4051, _4079, _3708);
                float _4083 = fma(_4065, (*spvDescriptorSet0.vp_c13)._m0[1].x, _4073);
                float _4085 = fma(_4047, _4079, _3722);
                float _4087 = 1.0 / _4083;
                out.gl_Position.x = _4081;
                out.gl_Position.y = _4085;
                float _4089 = _4073 * _4087;
                out.m_80.y = _4089;
                _3959 = _4085;
                _3961 = _4047;
                _4003 = _3991;
                _3963 = _4071;
                _3965 = _4079;
                _3967 = _4081;
                _4005 = true;
            }
        }
    }
    else
    {
        float _4091 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _4091;
        _4003 = 0.0;
        _3967 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    _4005 = false;
    float _4093 = _3959;
    float _4095 = _3961;
    float _4097 = _4003;
    float _4099 = _3963;
    float _4101 = _3965;
    float _4103 = _3967;
    bool _4105 = _3448 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4107 = isnan(_3448);
    bool _4109 = _4105 || _4107;
    bool _4111 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4113 = _4109 || _4111;
    float _4115 = _4099;
    float _4117 = _4095;
    float _4119 = _4101;
    float _4121 = _4093;
    float _4123 = _4103;
    if (!_4113)
    {
        _4115 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4125 = _4115;
    float _4127 = _4125;
    float _4129 = _4125;
    if (!_4113)
    {
        _4117 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4131 = _4117;
    float _4133 = _4131;
    float _4135 = _4131;
    if (!_4113)
    {
        _3969 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4137 = _3969;
    float _4139 = _4137;
    float _4141 = _4137;
    if (!_4113)
    {
        _4119 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4143 = _4119;
    float _4145 = _4143;
    float _4147 = _4143;
    if (!_4113)
    {
        _4121 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4149 = _4121;
    float _4151 = _4149;
    float _4153 = _4149;
    if (!_4113)
    {
        _4123 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4155 = _4123;
    bool _4157 = !_4113;
    float _4159 = _4155;
    float _4161 = _4155;
    if (!_4157)
    {
        bool _4163 = _3448 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4165 = isnan(_3448);
        bool _4167 = _4163 || _4165;
        bool _4169 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4171 = _4167 || _4169;
        if (!_4171)
        {
            float _4173 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4175 = _3448 + _4173;
            float _4177 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4179 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4177;
            float _4181 = 1.0 / _4179;
            float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4185 = _4183 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4189 = _4187 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4193 = _4191 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4195 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4197 = _4195 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4199 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4201 = _4199 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4203 = _4175 * _4181;
            float _4205 = precise::clamp(_4203, 0.0, 1.0);
            float _4207 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4209 = _4207 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4211 = fma(_4205, _4185, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4213 = fma(_4205, _4209, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4215 = fma(_4205, _4189, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4217 = fma(_4205, _4193, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4219 = fma(_4205, _4197, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4221 = fma(_4205, _4201, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4135 = _4213;
            _4153 = _4219;
            _4129 = _4211;
            _4147 = _4217;
            _4141 = _4215;
            _4161 = _4221;
            _4223 = true;
        }
        else
        {
            bool _4225 = _3448 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4227 = isnan(_3448);
            bool _4229 = _4225 || _4227;
            bool _4231 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4233 = _4229 || _4231;
            if (!_4233)
            {
                _4127 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4235 = _4127;
            _4129 = _4235;
            if (!_4233)
            {
                _4133 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4237 = _4133;
            _4135 = _4237;
            if (!_4233)
            {
                _4139 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4239 = _4139;
            _4141 = _4239;
            if (!_4233)
            {
                _4145 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4241 = _4145;
            _4147 = _4241;
            if (!_4233)
            {
                _4151 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4243 = _4151;
            _4153 = _4243;
            if (!_4233)
            {
                _4159 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4245 = _4159;
            bool _4247 = !_4233;
            _4161 = _4245;
            if (!_4247)
            {
                bool _4249 = _3448 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4251 = isnan(_3448);
                bool _4253 = _4249 || _4251;
                bool _4255 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4257 = _4253 || _4255;
                if (!_4257)
                {
                    float _4259 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4261 = _3448 + _4259;
                    float _4263 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4265 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4263;
                    float _4267 = 1.0 / _4265;
                    float _4269 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4271 = _4269 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4273 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4275 = _4273 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4277 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4279 = _4277 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4281 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4283 = _4281 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4285 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4287 = _4285 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4289 = _4261 * _4267;
                    float _4291 = precise::clamp(_4289, 0.0, 1.0);
                    float _4293 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4295 = _4293 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4297 = fma(_4291, _4271, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4299 = fma(_4291, _4295, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4301 = fma(_4291, _4275, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4303 = fma(_4291, _4279, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4305 = fma(_4291, _4283, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4307 = fma(_4291, _4287, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4135 = _4299;
                    _4153 = _4305;
                    _4129 = _4297;
                    _4147 = _4303;
                    _4141 = _4301;
                    _4161 = _4307;
                    _4223 = true;
                }
                else
                {
                    _4135 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4153 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4129 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4147 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4141 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4161 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4223 = false;
    float _4309 = _4135;
    float _4311 = _4153;
    float _4313 = _4129;
    float _4315 = _4147;
    float _4317 = _4141;
    float _4319 = _4161;
    float _4321 = fma(_2662, -0.5, 0.5);
    float _4323 = precise::clamp(_4321, 0.0, 1.0);
    float _4325 = -_4309;
    float _4327 = _4325 + _4311;
    float _4329 = _4097 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4331 = -_4313;
    float _4333 = _4331 + _4315;
    float _4335 = fma(_4323, _4327, _4309);
    out.m_88.x = 0.0;
    float _4337 = -_4317;
    float _4339 = _4337 + _4319;
    float _4341 = fma(_4323, _4333, _4313);
    float _4343 = _4335 * 0.586610972881317138671875;
    out.m_49.x = _4329;
    bool _4345 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4347 = fma(_4323, _4339, _4317);
    float _4349 = fma(_4341, 0.298911988735198974609375, _4343);
    bool _4351 = _3426 > 0.0;
    bool _4353 = isnan(_3426);
    bool _4355 = _4351 || _4353;
    bool _4357 = isnan(0.0);
    bool _4359 = _4355 || _4357;
    float _4361 = fma(_4347, 0.114477999508380889892578125, _4349);
    float _4363 = -_4361;
    float _4365 = _4341 + _4363;
    float _4367 = -_4361;
    float _4369 = _4335 + _4367;
    float _4371 = -_4361;
    float _4373 = _4347 + _4371;
    float _4375 = fma(_4365, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4361);
    float _4377 = fma(_4369, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4361);
    float _4379 = fma(_4373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4361);
    bool _4381 = !_4345;
    if (!_4381)
    {
        float _4383 = -_3386;
        float _4385 = _4383 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4387 = -_3388;
        float _4389 = _4387 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4391 = -_3390;
        float _4393 = _4391 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4395 = _4385 * _4385;
        float _4397 = fma(_4389, _4389, _4395);
        float _4399 = fma(_4393, _4393, _4397);
        float _4401 = sqrt(_4399);
        float _4403 = rsqrt(_4399);
        float _4405 = -_4401;
        float _4407 = _4405 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4409 = _4407 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4411 = precise::clamp(_4409, 0.0, 1.0);
        float _4413 = _4389 * _4403;
        float _4415 = _4385 * _4403;
        float _4417 = abs(_4411);
        float _4419 = log2(_4417);
        float _4421 = _4393 * _4403;
        float _4423 = _4413 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4425 = _2662 * _4415;
        float _4427 = -_4415;
        float _4429 = -_4423;
        float _4431 = fma(_4427, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4429);
        float _4433 = fma(_2666, _4413, _4425);
        float _4435 = -_4421;
        float _4437 = fma(_4435, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4431);
        float _4439 = fma(_2478, _4421, _4433);
        float _4441 = precise::clamp(_4439, 0.0, 1.0);
        float _4443 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4445 = _4437 + _4443;
        float _4447 = _4419 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4449 = _4445 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4451 = precise::clamp(_4449, 0.0, 1.0);
        float _4453 = exp2(_4447);
        float _4455 = _4453 * _4451;
        float _4457 = _4441 * _4455;
        float _4459 = _4457 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4461 = _4457 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4463 = _4457 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _4459;
        out.m_88.y = _4461;
        out.m_88.z = _4463;
    }
    out.m_90.x = _4375;
    out.m_90.y = _4377;
    out.m_90.z = _4379;
    if (_4359)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _4465 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4465;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

