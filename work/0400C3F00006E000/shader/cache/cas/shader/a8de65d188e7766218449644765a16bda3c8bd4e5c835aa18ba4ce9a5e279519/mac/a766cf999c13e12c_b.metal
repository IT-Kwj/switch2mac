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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(0)]];
    float4 m_55 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2018 = false;
    bool _441 = false;
    bool _339 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_46.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2323 = as_type<float>(_121);
        out.gl_Position.z = _2323;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = _139;
    if (_135)
    {
        float _143 = float(_105);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2393 = as_type<float>(_159);
        out.gl_Position.z = _2393;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = in.m_53.x;
    float _163 = in.m_53.y;
    float _165 = in.m_53.z;
    float _167 = in.m_55.x;
    float _169 = in.m_55.y;
    float _171 = in.m_55.z;
    float _173 = in.m_57.x;
    float _175 = in.m_57.y;
    float _177 = in.m_57.z;
    float _179 = _161 * _161;
    float _181 = _163 * _163;
    float _183 = _165 * _165;
    float _185 = fma(_167, _167, _179);
    float _187 = fma(_169, _169, _181);
    float _189 = fma(_171, _171, _183);
    float _191 = fma(_173, _173, _185);
    float _193 = fma(_175, _175, _187);
    float _195 = fma(_177, _177, _189);
    float _197 = sqrt(_191);
    float _199 = sqrt(_193);
    float _201 = sqrt(_195);
    bool _203 = _197 > 0.0;
    bool _205 = _199 > 0.0;
    float _207 = _199;
    if (_203)
    {
        float _209 = rsqrt(_191);
        _207 = _209;
    }
    float _211 = _207;
    float _213 = 0.0;
    if (!_203)
    {
        _213 = 0.0;
    }
    float _215 = _213;
    bool _217 = _201 > 0.0;
    float _219 = 0.0;
    float _221 = _215;
    if (!_203)
    {
        _219 = 0.0;
    }
    float _223 = _219;
    float _225 = 0.0;
    float _227 = _223;
    if (!_203)
    {
        _225 = 0.0;
    }
    float _229 = _225;
    float _231 = _197;
    float _233 = _229;
    if (_205)
    {
        float _235 = rsqrt(_193);
        _231 = _235;
    }
    float _237 = _231;
    float _239 = 0.0;
    if (!_205)
    {
        _239 = 0.0;
    }
    float _241 = _239;
    float _243 = 0.0;
    float _245 = _241;
    if (!_205)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    float _249 = 0.0;
    float _251 = _247;
    if (!_205)
    {
        _249 = 0.0;
    }
    float _253 = _249;
    float _255 = _201;
    float _257 = _253;
    if (_217)
    {
        float _259 = rsqrt(_195);
        _255 = _259;
    }
    float _261 = _255;
    if (_203)
    {
        float _263 = _211 * _161;
        _221 = _263;
    }
    float _265 = _221;
    if (_203)
    {
        float _267 = _211 * _167;
        _227 = _267;
    }
    float _269 = _227;
    if (_203)
    {
        float _271 = _211 * _173;
        _233 = _271;
    }
    float _273 = _233;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _277 = 0.0;
    float _279 = 0.0;
    if (!_217)
    {
        _277 = 0.0;
        _279 = 0.0;
    }
    float _281 = _277;
    float _283 = _279;
    float _285 = 0.0;
    float _287 = _283;
    float _289 = _281;
    if (!_217)
    {
        _285 = 0.0;
    }
    float _291 = _285;
    float _293 = _291;
    if (_205)
    {
        float _295 = _237 * _163;
        _245 = _295;
    }
    float _297 = _245;
    if (_205)
    {
        float _299 = _237 * _169;
        _251 = _299;
    }
    float _301 = _251;
    if (_205)
    {
        float _303 = _237 * _175;
        _257 = _303;
    }
    float _305 = _257;
    if (_217)
    {
        float _307 = _261 * _165;
        _287 = _307;
    }
    float _309 = _287;
    if (_217)
    {
        float _311 = _261 * _171;
        _293 = _311;
    }
    float _313 = _293;
    if (_217)
    {
        float _315 = _261 * _177;
        _289 = _315;
    }
    float _317 = _289;
    bool _319 = !_275;
    float _337;
    if (!_319)
    {
        float _321 = in.m_59.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_105);
        float _343 = 1.0 / _341;
        float _345 = _139 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _337;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _351 = _347 + _349;
    bool _353 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _355 = isnan(_347);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _365;
    float _369 = -_363;
    float _371 = _369 + 1.0;
    bool _373 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _375 = isnan(_347);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _385;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _391 = 1.0 / _367;
    float _393 = _383 * _371;
    float _395 = -_383;
    float _397 = _395 + 1.0;
    float _399 = _351 * _391;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _401;
    float _405 = fma(_387, _399, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = fma(_403, _399, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _409 = _405 * _393;
    float _411 = _407 * _393;
    float _413 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].x, _409);
    float _415 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].y, _411);
    float _417 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[144].x, _413);
    float _419 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[144].y, _415);
    bool _421 = !_389;
    float _439;
    if (!_421)
    {
        float _423 = in.m_59.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_105);
        float _445 = 1.0 / _443;
        float _447 = _139 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = in.m_59.z;
    float _453 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _455 = log2(_453);
    float _457 = in.m_59.x;
    float _459 = in.m_59.y;
    float _461 = _455 * _139;
    float _463 = exp2(_461);
    float _465 = _451 * 2.0;
    float _467 = _457 * 2.0;
    float _469 = _459 * 2.0;
    float _471 = _459 + _451;
    float _473 = floor(_465);
    float _475 = _471 + (-1.0);
    float _477 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _479 = floor(_467);
    float _481 = -_463;
    float _483 = _481 + 1.0;
    float _485 = floor(_469);
    bool _487 = _473 > 0.0;
    bool _489 = _473 >= 0.0;
    bool _491 = isnan(_473);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _501 = _499 != 0;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _505 = _503 != 0;
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _509 = _507 != 0;
    int _511 = _497 ? 0 : 1;
    bool _513 = _479 > 0.0;
    bool _515 = _479 >= 0.0;
    bool _517 = isnan(_479);
    bool _519 = _515 || _517;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    bool _525 = !_501;
    int _527 = _525 ? 0 : 1;
    int _529 = ~_511;
    int _531 = _529 + 1;
    int _533 = _531 + 1;
    bool _535 = _485 > 0.0;
    bool _537 = _485 >= 0.0;
    bool _539 = isnan(_485);
    bool _541 = _537 || _539;
    bool _543 = isnan(0.0);
    bool _545 = _541 || _543;
    int _547 = _533;
    if (!_487)
    {
        int _549 = ~_511;
        int _551 = _549 + 1;
        _547 = _551;
    }
    int _553 = _547;
    int _555 = _523 ? 0 : 1;
    float _557 = in.m_61.x;
    float _559 = in.m_61.y;
    float _561 = in.m_61.z;
    bool _563 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _565 = isnan(1.0);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _571 = _567 || _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _575 = 1.0 + _573;
    int _577 = abs(_527);
    float _579 = float(_553);
    float _581 = 1.0 / _575;
    float _583 = float(_577);
    bool _585 = !_505;
    int _587 = _585 ? 0 : 1;
    int _589 = ~_555;
    int _591 = _589 + 1;
    int _593 = _591 + 1;
    float _595 = _583 * _579;
    int _597 = _593;
    if (!_513)
    {
        int _599 = ~_555;
        int _601 = _599 + 1;
        _597 = _601;
    }
    int _603 = _597;
    float _605 = _459 + _457;
    bool _607 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _609 = isnan(0.0);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _615 = _611 || _613;
    int _617 = abs(_587);
    float _619 = _605 + (-1.0);
    int _621 = _545 ? 0 : 1;
    float _623 = _615 ? _483 : 0.0;
    float _625 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _627 = float(_617);
    float _629 = _457 + (-0.5);
    int _631 = ~_621;
    int _633 = _631 + 1;
    int _635 = _633 + 1;
    int _637 = _635;
    if (_571)
    {
        float _639 = _623 * _581;
        _141 = _639;
    }
    float _641 = _141;
    float _643 = float(_603);
    float _645 = as_type<float>(int(gl_VertexIndex));
    if (!_535)
    {
        int _647 = ~_621;
        int _649 = _647 + 1;
        _637 = _649;
    }
    int _651 = _637;
    float _653 = _595 * (-2.0);
    bool _655 = !_509;
    int _657 = _655 ? 0 : 1;
    float _659 = _627 * _643;
    float _661 = float(_651);
    float _663 = fma(_653, _557, _557);
    int _665 = abs(_657);
    float _667 = _659 * (-2.0);
    float _669 = fma(_625, _653, _625);
    float _671 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[196].x, _663);
    float _673 = fma(_477, _667, _477);
    float _675 = _459 + (-0.5);
    float _677 = fma(_669, _641, _671);
    float _679 = fma(_667, _559, _559);
    float _681 = float(_665);
    float _683 = in.m_66.x;
    float _685 = in.m_66.y;
    float _687 = _677 * 0.15915493667125701904296875;
    float _689 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[196].y, _679);
    float _691 = in.m_46.x;
    float _693 = in.m_46.y;
    float _695 = in.m_46.z;
    float _697 = _681 * _661;
    float _699 = _451 + _457;
    float _701 = _451 + (-0.5);
    float _703 = fma(_673, _641, _689);
    float _705 = _697 * (-2.0);
    float _707 = _699 + (-1.0);
    float _709 = _687 * 6.283185482025146484375;
    float _711 = cos(_709);
    float _713 = _703 * 0.15915493667125701904296875;
    float _715 = fma(_705, _561, _561);
    float _717 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _719 = as_type<int>(_645) & 1;
    bool _721 = _719 != 0;
    int _723 = as_type<int>(_645) & 2;
    bool _725 = _723 != 0;
    float _727 = in.m_68.y;
    float _729 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[196].z, _715);
    float _731 = fma(_717, _705, _717);
    float _733 = _713 * 6.283185482025146484375;
    float _735 = sin(_733);
    float _737 = fma(_731, _641, _729);
    float _739 = _419 * _685;
    bool _741 = !_725;
    float _743 = _741 ? (-0.5) : 0.5;
    float _745 = _737 * 0.15915493667125701904296875;
    float _747 = _713 * 6.283185482025146484375;
    float _749 = cos(_747);
    float _751 = _169 * _693;
    float _753 = _175 * _693;
    bool _755 = !_721;
    float _757 = _755 ? (-0.5) : 0.5;
    float _759 = _417 * _683;
    float _761 = fma(_167, _691, _751);
    float _763 = fma(_173, _691, _753);
    float _765 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _767 = _687 * 6.283185482025146484375;
    float _769 = sin(_767);
    float _771 = fma(_171, _695, _761);
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _743);
    float _775 = in.m_55.w;
    float _777 = fma(_177, _695, _763);
    float _779 = _711 * _735;
    float _781 = _759 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _757);
    float _785 = _745 * 6.283185482025146484375;
    float _787 = cos(_785);
    float _789 = _711 * _749;
    float _791 = _765 * _773;
    float _793 = in.m_57.w;
    float _795 = _781 * _783;
    float _797 = _693 + _727;
    bool _799 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _801 = isnan(0.5);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _807 = _803 || _805;
    float _809 = _745 * 6.283185482025146484375;
    float _811 = sin(_809);
    float _813 = _769 * _735;
    float _815 = _769 * _749;
    bool _817 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _819 = isnan(0.5);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _825 = _821 || _823;
    float _827 = _711 * _787;
    float _829 = _769 * _787;
    float _831 = _749 * _787;
    float _833 = _735 * _787;
    float _835 = _827 * _791;
    float _837 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _839 = _829 * _791;
    float _841 = fma(_811, _789, _813);
    float _843 = -_779;
    float _845 = fma(_811, _815, _843);
    float _847 = -_815;
    float _849 = fma(_811, _779, _847);
    float _851 = -_791;
    float _853 = _811 * _851;
    float _855 = fma(_841, _795, _835);
    float _857 = fma(_811, _813, _789);
    float _859 = _771 + _775;
    float _861 = fma(_831, _795, _853);
    float _863 = fma(_849, _837, _855);
    float _865 = fma(_845, _795, _839);
    float _867 = _777 + _793;
    float _869 = fma(_833, _837, _861);
    float _871 = _863 * _305;
    float _873 = fma(_857, _837, _865);
    float _875 = _797 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _877 = _863 * _301;
    float _879 = fma(_869, _273, _871);
    float _881 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[11].x, _875);
    float _883 = fma(_869, _269, _877);
    float _885 = fma(_873, _317, _879);
    float _887 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].z, _881);
    float _889 = fma(_873, _313, _883);
    float _891 = _867 + _885;
    float _893 = _797 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _895 = _887 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _897 = _859 + _889;
    float _899 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _901 = _891 + _899;
    float _903 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[10].x, _893);
    float _905 = 1.0 / _895;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _909 = _897 + _907;
    float _911 = _901 * _901;
    float _913 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].z, _903);
    float _915 = fma(_909, _909, _911);
    float _917 = _913 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _919 = sqrt(_915);
    float _921 = _917 + _895;
    float _923 = _921 * _905;
    float _925 = _923 * 0.5;
    float _927 = _863 * _297;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _931 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _929);
    float _933 = fma(_869, _265, _927);
    float _935 = 1.0 / _931;
    float _937 = fma(_873, _309, _933);
    bool _939 = _919 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _941 = _797 + _937;
    float _943 = _673;
    float _945 = _897;
    float _947 = _891;
    float _949 = _931;
    float _951 = _937;
    float _953 = _727;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    float _957 = _941;
    float _959 = _859;
    if (!_939)
    {
        _943 = _941;
    }
    float _961 = _943;
    bool _963 = !_939;
    float _965 = _961;
    if (!_963)
    {
        float _967 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _969 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _971 = _919 + _969;
        float _973 = rsqrt(_915);
        float _975 = _971 * _967;
        float _977 = _941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _979 = _975 * 0.15915493667125701904296875;
        float _981 = _979 * 6.283185482025146484375;
        float _983 = cos(_981);
        float _985 = _979 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = _983 + (-1.0);
        float _991 = _989 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _993 = fma(_987, _977, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _995 = fma(_941, _983, _991);
        float _997 = _973 * _993;
        float _999 = fma(_909, _997, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1001 = fma(_901, _997, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _965 = _995;
        _945 = _999;
        _947 = _1001;
        _949 = _979;
        _951 = _973;
    }
    float _1003 = _965;
    float _1005 = _945;
    float _1007 = _947;
    float _1009 = _949;
    float _1011 = _951;
    float _1013 = _1003;
    float _1015 = _1005;
    float _1017 = _1007;
    float _1019 = _1011;
    if (_825)
    {
        _953 = 1.0;
    }
    float _1021 = _953;
    float _1023 = _1021;
    if (!_807)
    {
        float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1027 = _797 + _1025;
        float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1031 = _859 + _1029;
        float _1033 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1035 = -_797;
        float _1037 = _1035 + _1003;
        float _1039 = _1027 * _1027;
        float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1043 = _867 + _1041;
        float _1045 = -_859;
        float _1047 = _1045 + _1005;
        float _1049 = -_867;
        float _1051 = _1049 + _1007;
        float _1053 = fma(_1031, _1031, _1039);
        float _1055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1057 = fma(_1043, _1043, _1053);
        float _1059 = sqrt(_1057);
        float _1061 = _1033 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1063 = precise::min(_1059, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1065 = _1063 * _1055;
        float _1067 = _1061 * _1065;
        float _1069 = fma(_1037, _1067, _797);
        float _1071 = fma(_1047, _1067, _859);
        float _1073 = fma(_1051, _1067, _867);
        _1013 = _1069;
        _1015 = _1071;
        _1017 = _1073;
    }
    float _1075 = _1013;
    float _1077 = _1015;
    float _1079 = _1017;
    if (_825)
    {
        _955 = 1.0;
    }
    float _1081 = _955;
    float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1085 = _935 * _1083;
    float _1087 = _1081;
    if (!_825)
    {
        float _1089 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1091 = _1089 * 0.15915493667125701904296875;
        float _1093 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1095 = _1091 * 6.283185482025146484375;
        float _1097 = cos(_1095);
        float _1099 = _1093 * 0.15915493667125701904296875;
        float _1101 = _1091 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        float _1105 = 1.0 / _1097;
        float _1107 = _1099 * 6.283185482025146484375;
        float _1109 = cos(_1107);
        float _1111 = _1103 * _1105;
        float _1113 = _1099 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1109 * _1111;
        float _1119 = 1.0 / _1117;
        float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1123 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1121;
        float _1125 = 1.0 / _1123;
        float _1127 = _1115 * _1119;
        float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1131 = fma(_1085, _1127, _1129);
        float _1133 = _1131 * _1125;
        float _1135 = precise::clamp(_1133, 0.0, 1.0);
        _1019 = _1091;
        _1023 = _1135;
    }
    float _1137 = _1019;
    float _1139 = _1023;
    if (!_825)
    {
        float _1141 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1143 = _1141 * 0.15915493667125701904296875;
        float _1145 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1147 = _1143 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = _1145 * 0.15915493667125701904296875;
        float _1153 = _1143 * 6.283185482025146484375;
        float _1155 = sin(_1153);
        float _1157 = 1.0 / _1149;
        float _1159 = _1151 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        float _1163 = _1155 * _1157;
        float _1165 = _1151 * 6.283185482025146484375;
        float _1167 = sin(_1165);
        float _1169 = _1161 * _1163;
        float _1171 = 1.0 / _1169;
        float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1175 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1173;
        float _1177 = 1.0 / _1175;
        float _1179 = _1167 * _1171;
        float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1183 = fma(_1085, _1179, _1181);
        float _1185 = _1183 * _1177;
        float _1187 = precise::clamp(_1185, 0.0, 1.0);
        float _1189 = -_1187;
        float _1191 = _1189 + 1.0;
        _1087 = _1191;
    }
    float _1193 = _1087;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1197 = _1075 + _1195;
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1201 = _1077 + _1199;
    float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1205 = _1079 + _1203;
    float _1207 = _1197 * _1197;
    float _1209 = fma(_1201, _1201, _1207);
    float _1211 = fma(_1205, _1205, _1209);
    float _1213 = rsqrt(_1211);
    float _1215 = sqrt(_1211);
    float _1217 = _1213 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1219 = _1201 * _1217;
    float _1221 = _1205 * _1217;
    float _1223 = _1219 * _1219;
    float _1225 = _1221 * _1221;
    float _1227 = _1223 + _1225;
    float _1229 = sqrt(_1227);
    bool _1231 = _1229 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1235 = _1229 + _1233;
    float _1237 = _873;
    float _1239 = _1227;
    float _1241 = _1235;
    float _1243 = _1197;
    float _1245 = _1219;
    float _1247 = _1221;
    float _1249 = _1223;
    if (_1231)
    {
        float _1251 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1237 = _1251;
    }
    float _1253 = _1237;
    if (_1231)
    {
        float _1255 = rsqrt(_1227);
        _1239 = _1255;
    }
    float _1257 = _1239;
    float _1259 = _1257;
    if (_1231)
    {
        float _1261 = _1235 * _1253;
        _1241 = _1261;
    }
    float _1263 = _1241;
    if (_1231)
    {
        float _1265 = _1263 * 0.15915493667125701904296875;
        _957 = _1265;
    }
    float _1267 = _957;
    float _1269 = _1009;
    if (_1231)
    {
        float _1271 = _1267 * 6.283185482025146484375;
        float _1273 = sin(_1271);
        _1269 = _1273;
    }
    float _1275 = _1269;
    float _1277 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1279 = precise::max(0.0, _1277);
    float _1281 = _1137;
    float _1283 = _1279;
    if (_1231)
    {
        float _1285 = _1267 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        _1281 = _1287;
    }
    float _1289 = _1281;
    float _1291 = -_1217;
    float _1293 = -_1279;
    float _1295 = fma(_1197, _1291, _1293);
    if (_1231)
    {
        float _1297 = _1295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1243 = _1297;
    }
    float _1299 = _1243;
    float _1301 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1303 = _1275;
    if (_1231)
    {
        float _1305 = fma(_1275, _1299, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1303 = _1305;
    }
    float _1307 = _1303;
    float _1309 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1311 = _1307;
    if (!_1231)
    {
        _959 = _1295;
    }
    float _1313 = _959;
    float _1315 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1301);
    float _1317 = _1313;
    if (_1231)
    {
        float _1319 = _1289 + (-1.0);
        _1283 = _1319;
    }
    float _1321 = _1283;
    float _1323 = _1321;
    if (_1231)
    {
        float _1325 = _1257 * _1307;
        _1311 = _1325;
    }
    float _1327 = _1311;
    float _1329 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1315);
    if (_1231)
    {
        float _1331 = _1321 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1259 = _1331;
    }
    float _1333 = _1259;
    if (_1231)
    {
        float _1335 = _1219 * _1327;
        _1245 = _1335;
    }
    float _1337 = _1245;
    if (_1231)
    {
        float _1339 = _1221 * _1327;
        _1247 = _1339;
    }
    float _1341 = _1247;
    if (!_1231)
    {
        _1323 = _1225;
    }
    float _1343 = _1323;
    float _1345 = _1343;
    if (_1231)
    {
        float _1347 = fma(_1295, _1289, _1333);
        _1317 = _1347;
    }
    float _1349 = _1317;
    if (_1231)
    {
        float _1351 = _1337 * _1337;
        _1249 = _1351;
    }
    float _1353 = _1249;
    if (_1231)
    {
        float _1355 = _1341 * _1341;
        _1345 = _1355;
    }
    float _1357 = _1345;
    float _1359 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1361 = fma(_1349, _1349, _1353);
    float _1363 = floor(_1309);
    float _1365 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1359);
    float _1367 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1369 = _1361 + _1357;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1373 = fma(_1215, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1371);
    float _1375 = precise::clamp(_1373, 0.0, 1.0);
    float _1377 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1365);
    float _1379 = rsqrt(_1369);
    float _1381 = -_1375;
    float _1383 = _1381 + 1.0;
    float _1385 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1387 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1389 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1391 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1393 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1395 = abs(_1383);
    float _1397 = log2(_1395);
    float _1399 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1387);
    float _1401 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1391);
    float _1403 = _1389 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1405 = -_1363;
    float _1407 = _1309 + _1405;
    float _1409 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1401);
    float _1411 = -_1403;
    float _1413 = fma(_1411, _1393, 1.0);
    float _1415 = _1379 * _1349;
    float _1417 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1399);
    float _1419 = _1379 * _1337;
    float _1421 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1423 = _1379 * _1341;
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1427 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1429 = floor(_1385);
    float _1431 = _1425 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1433 = -_1427;
    float _1435 = fma(_1415, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1433);
    float _1437 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1439 = _1425 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1441 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1431);
    float _1443 = -_1423;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1435);
    float _1447 = log2(_1413);
    float _1449 = _1425 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1451 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1441);
    float _1453 = fma(_1445, 0.5, 0.5);
    float _1455 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1439);
    float _1457 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1449);
    float _1459 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1451);
    float _1461 = fma(_1453, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1463 = exp2(_1437);
    float _1465 = fma(_1445, -0.5, 0.5);
    float _1467 = -_1429;
    float _1469 = _1385 + _1467;
    float _1471 = _1415 + 1.0;
    float _1473 = fma(_1453, _1461, -0.212114393711090087890625);
    float _1475 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1457);
    float _1477 = 1.0 / _1459;
    float _1479 = sqrt(_1465);
    float _1481 = -_1415;
    float _1483 = fma(_1463, _1471, _1481);
    float _1485 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1475);
    float _1487 = _1447 * 0.693147182464599609375;
    float2 _4354 = float2(_1407, _1469);
    float _1489 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4354, float2(0.0), isnan(_4354)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4354, float2(0.0), isnan(_4354)), level(0.0)).x;
    float _1491 = fma(_1453, _1473, 1.570728778839111328125);
    float _1493 = fma(_1483, 0.5, 0.5);
    float _1495 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1497 = _1485 * _1477;
    float _1499 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1455);
    float _1501 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1499);
    float _1503 = _1479 * 0.636619746685028076171875;
    float _1505 = _1501 * _1477;
    float _1507 = fma(_1497, 0.5, 0.5);
    float _1509 = -_1491;
    float _1511 = fma(_1503, _1509, 1.0);
    float _1513 = fma(_1505, -0.5, 0.5);
    float3 _4403 = float3(_1507, _1513, _1495);
    float _1515 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4403, float3(0.0), isnan(_4403)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4403, float3(0.0), isnan(_4403)), level(0.0)).x;
    float3 _4414 = float3(_1507, _1513, _1495);
    float4 _1518 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4414, float3(0.0), isnan(_4414)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4414, float3(0.0), isnan(_4414)), level(0.0)).xyzw;
    float _1520 = _1518.x;
    float _1522 = _1518.y;
    float _1524 = _1518.z;
    float _1526 = _1518.w;
    float2 _4430 = float2(_1511, _1493);
    float3 _1530 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4430, float2(0.0), isnan(_4430)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4430, float2(0.0), isnan(_4430)), level(0.0)).xyz;
    float _1532 = _1530.x;
    float _1534 = _1530.y;
    float _1536 = _1530.z;
    float _1538 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1540 = _1425 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1544 = _1542 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1548 = _1546 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1550 = _459 > 0.5;
    float _1552 = exp2(_1538);
    float _1554 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1540);
    bool _1556 = _457 > 0.5;
    float _1558 = 1.0 / _1544;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1560;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1568 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1570 = isnan(_449);
    bool _1572 = _1568 || _1570;
    bool _1574 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1576 = _1572 || _1574;
    float _1578 = float(_1576);
    float _1580 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1554);
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1584 = _1582 != 0;
    int _1586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1588 = _1586 != 0;
    float _1590 = 1.0 / _1548;
    float _1592 = -_1578;
    float _1594 = _1592 + 1.0;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1598 = _1596 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1600 = -_1552;
    float _1602 = _1600 + 1.0;
    bool _1604 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1606 = isnan(_449);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1580);
    float _1618 = _1562 * _1558;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1622 = _449 + _1620;
    float _1624 = 1.0 / _1566;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1626;
    float _1630 = -_1614;
    float _1632 = _1630 + 1.0;
    float _1634 = fma(_1618, _1622, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1636 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1638 = isnan(_449);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1644 = _1640 || _1642;
    float _1646 = float(_1644);
    float _1648 = _1602 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1650 = _1598 * _1590;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1654 = _449 + _1652;
    float _1656 = _1578 * _1632;
    float _1658 = _1646 * _1594;
    float _1660 = -_1646;
    float _1662 = _1660 + 1.0;
    bool _1664 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1666 = isnan(_449);
    bool _1668 = _1664 || _1666;
    bool _1670 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1672 = _1668 || _1670;
    float _1674 = float(_1672);
    float _1676 = fma(_1650, _1654, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1678 = _1634 * _1658;
    float _1680 = -_743;
    int _1682 = _1550 ? as_type<int>(_1680) : as_type<int>(_743);
    float _1684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1686 = -_1674;
    float _1688 = _1686 + 1.0;
    float _1690 = fma(_1662, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1678);
    float _1692 = -_757;
    int _1694 = _1556 ? as_type<int>(_1692) : as_type<int>(_757);
    float _1696 = _1628 * _1624;
    float _1698 = _1614 * _1688;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1702 = _449 + _1700;
    bool _1704 = !_1584;
    float _1706 = _1704 ? _757 : as_type<float>(_1694);
    float _1708 = abs(_1085);
    float _1710 = log2(_1708);
    bool _1712 = !_1588;
    float _1714 = _1712 ? _743 : as_type<float>(_1682);
    float _1716 = fma(_1696, _1702, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1718 = fma(_1676, _1656, _1690);
    float _1720 = _1706 + 0.5;
    float _1722 = _757 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1724 = -_1714;
    float _1726 = _1724 + 0.5;
    float _1728 = fma(_1716, _1698, _1718);
    float _1730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1732 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1734 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1736 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1728);
    float _1738 = _1732 * _1684;
    float _1740 = _1736 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1742 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.gl_Position.x = _1485;
    out.gl_Position.y = _1501;
    out.gl_Position.z = _1616;
    out.gl_Position.w = _1459;
    float _1748 = exp2(_1742);
    float _1750 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1734 * _1730;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_70.x = _1738;
    out.m_70.y = _1752;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1760 = _1758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1762 = _743 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1768 = fma(_1748, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1770 = precise::clamp(_1768, 0.0, 1.0);
    float _1772 = -_1762;
    float _1774 = _811 * _1772;
    out.m_72.x = _1750;
    out.m_72.y = _1754;
    out.m_72.z = _1760;
    out.m_72.w = _1756;
    float _1776 = _827 * _1762;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1780 = fma(_831, _1722, _1774);
    float _1782 = fma(_841, _1722, _1776);
    float _1784 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1786 = _1766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = in.m_68.x;
    float _1792 = _849 + _1782;
    float _1794 = _829 * _1762;
    bool _1796 = _1085 <= 8000.0;
    bool _1798 = isnan(_1085);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan(8000.0);
    bool _1804 = _1800 || _1802;
    float _1806 = float(_1804);
    out.m_74.x = _1784;
    out.m_74.y = _1786;
    out.m_74.z = _1788;
    out.m_74.w = _1740;
    float _1808 = fma(_1770, -2.0, 3.0);
    float _1810 = _1770 * _1770;
    float _1812 = _1792 * _301;
    float _1814 = fma(_845, _1722, _1794);
    float _1816 = _833 + _1780;
    float _1818 = _1810 * _1808;
    bool _1820 = _1215 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1822 = isnan(_1215);
    bool _1824 = _1820 || _1822;
    bool _1826 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1828 = _1824 || _1826;
    float _1830 = _857 + _1814;
    float _1832 = _1616 + _1459;
    float _1834 = -_1818;
    float _1836 = _1834 + 1.0;
    float _1838 = _1832 * 0.5;
    float _1840 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1818);
    float _1842 = _1792 * _297;
    float _1844 = _1792 * _305;
    float _1846 = _1459 * 0.5;
    float _1848 = _1806 * _1840;
    float _1850 = _1485 + _1459;
    float _1852 = fma(_1816, _273, _1844);
    float _1854 = fma(_1501, -0.5, _1846);
    float _1856 = _1848 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1858 = fma(_1816, _265, _1842);
    float _1860 = fma(_1830, _317, _1852);
    float _1862 = fma(_1816, _269, _1812);
    float _1864 = fma(_1830, _309, _1858);
    float _1866 = _1850 * 0.5;
    float _1868 = _1459;
    float _1870 = _1616;
    float _1872 = _1501;
    float _1874 = _1854;
    float _1876 = _1866;
    if (!_1828)
    {
        _1868 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1878 = _1868;
    float _1880 = fma(_1830, _313, _1862);
    float _1882 = _1878;
    float _1884 = _1878;
    if (!_1828)
    {
        _1870 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1886 = _1870;
    out.m_76.x = _1866;
    out.m_76.y = _1854;
    out.m_76.z = _1838;
    out.m_76.w = _1459;
    float _1888 = _1886;
    float _1890 = _1886;
    if (!_1828)
    {
        _1872 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1892 = _1872;
    out.m_78.x = _1880;
    out.m_78.y = _1864;
    out.m_78.z = _1860;
    float _1894 = _1892;
    float _1896 = _1892;
    if (!_1828)
    {
        _1874 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1898 = _1874;
    float _1900 = _1898;
    float _1902 = _1898;
    if (!_1828)
    {
        _1876 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1904 = _1876;
    float _1906 = -_1489;
    float _1908 = _1906 + 1.0;
    float _1910 = _1908 * _1856;
    float _1912 = precise::clamp(_1910, 0.0, 1.0);
    float _1914 = -_1912;
    float _1916 = fma(_1914, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1918 = _1916 * _1790;
    float _1920 = _1918 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1922 = _1648 * _1515;
    float _1924 = -_1648;
    float _1926 = _1924 + 1.0;
    out.m_80.x = _1920;
    float _1928 = _1526 * _1922;
    float _1930 = _1536 * _1922;
    float _1932 = _1526 * _1926;
    float _1934 = fma(_1532, _1928, _1520);
    float _1936 = fma(_1534, _1928, _1522);
    float _1938 = fma(_1526, _1930, _1524);
    float _1940 = _1139 * _1193;
    out.m_82.x = _1934;
    out.m_82.y = _1936;
    out.m_82.z = _1938;
    out.m_82.w = _1932;
    float _1942 = _1940 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1944 = _1940;
    float _1946 = _1904;
    float _1948 = _1904;
    if (!_1828)
    {
        _1944 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1950 = _1944;
    bool _1952 = !_1828;
    float _1954 = _1950;
    float _1956 = _1950;
    if (!_1952)
    {
        bool _1958 = _1215 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1960 = isnan(_1215);
        bool _1962 = _1958 || _1960;
        bool _1964 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1966 = _1962 || _1964;
        if (!_1966)
        {
            float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1970 = _1215 + _1968;
            float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1974 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1972;
            float _1976 = 1.0 / _1974;
            float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1992 = _1990 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1996 = _1994 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1998 = _1970 * _1976;
            float _2000 = precise::clamp(_1998, 0.0, 1.0);
            float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2004 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2006 = fma(_2000, _1980, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2008 = fma(_2000, _2004, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2010 = fma(_2000, _1984, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2012 = fma(_2000, _1988, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2014 = fma(_2000, _1992, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2016 = fma(_2000, _1996, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1948 = _2008;
            _1896 = _2014;
            _1902 = _2006;
            _1890 = _2012;
            _1884 = _2010;
            _1956 = _2016;
            _2018 = true;
        }
        else
        {
            bool _2020 = _1215 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2022 = isnan(_1215);
            bool _2024 = _2020 || _2022;
            bool _2026 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2028 = _2024 || _2026;
            if (!_2028)
            {
                _1900 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2030 = _1900;
            _1902 = _2030;
            if (!_2028)
            {
                _1946 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2032 = _1946;
            _1948 = _2032;
            if (!_2028)
            {
                _1882 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2034 = _1882;
            _1884 = _2034;
            if (!_2028)
            {
                _1888 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2036 = _1888;
            _1890 = _2036;
            if (!_2028)
            {
                _1894 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2038 = _1894;
            _1896 = _2038;
            if (!_2028)
            {
                _1954 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2040 = _1954;
            bool _2042 = !_2028;
            _1956 = _2040;
            if (!_2042)
            {
                bool _2044 = _1215 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2046 = isnan(_1215);
                bool _2048 = _2044 || _2046;
                bool _2050 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2052 = _2048 || _2050;
                if (!_2052)
                {
                    float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2056 = _1215 + _2054;
                    float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2060 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2058;
                    float _2062 = 1.0 / _2060;
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2078 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2082 = _2080 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2084 = _2056 * _2062;
                    float _2086 = precise::clamp(_2084, 0.0, 1.0);
                    float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2090 = _2088 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2092 = fma(_2086, _2066, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2094 = fma(_2086, _2090, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2096 = fma(_2086, _2070, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2098 = fma(_2086, _2074, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2100 = fma(_2086, _2078, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2102 = fma(_2086, _2082, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1948 = _2094;
                    _1896 = _2100;
                    _1902 = _2092;
                    _1890 = _2098;
                    _1884 = _2096;
                    _1956 = _2102;
                    _2018 = true;
                }
                else
                {
                    _1948 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1896 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1902 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1890 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1884 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1956 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2018 = false;
    float _2104 = _1948;
    float _2106 = _1896;
    float _2108 = _1902;
    float _2110 = _1890;
    float _2112 = _1884;
    float _2114 = _1956;
    float _2116 = fma(_1864, -0.5, 0.5);
    float _2118 = precise::clamp(_2116, 0.0, 1.0);
    float _2120 = -_2104;
    float _2122 = _2120 + _2106;
    float _2124 = -_2108;
    float _2126 = _2124 + _2110;
    out.m_84.x = 0.0;
    float _2128 = fma(_2118, _2122, _2104);
    float _2130 = -_2112;
    float _2132 = _2130 + _2114;
    float _2134 = fma(_2118, _2126, _2108);
    float _2136 = _2128 * 0.586610972881317138671875;
    bool _2138 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2140 = fma(_2118, _2132, _2112);
    float _2142 = _1942 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2144 = fma(_2134, 0.298911988735198974609375, _2136);
    bool _2146 = _1139 > 0.0;
    bool _2148 = isnan(_1139);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan(0.0);
    bool _2154 = _2150 || _2152;
    float _2156 = fma(_2140, 0.114477999508380889892578125, _2144);
    out.m_49.x = _2142;
    bool _2158 = _1193 <= 0.0;
    bool _2160 = !_2154;
    bool _2162 = _2158 || _2160;
    float _2164 = -_2156;
    float _2166 = _2134 + _2164;
    float _2168 = -_2156;
    float _2170 = _2128 + _2168;
    float _2172 = -_2156;
    float _2174 = _2140 + _2172;
    float _2176 = fma(_2166, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    float _2178 = fma(_2170, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    float _2180 = fma(_2174, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    bool _2182 = !_2138;
    if (!_2182)
    {
        float _2184 = -_1075;
        float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2188 = -_1077;
        float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2192 = -_1079;
        float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2196 = _2186 * _2186;
        float _2198 = fma(_2190, _2190, _2196);
        float _2200 = fma(_2194, _2194, _2198);
        float _2202 = sqrt(_2200);
        float _2204 = rsqrt(_2200);
        float _2206 = -_2202;
        float _2208 = _2206 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2210 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2212 = precise::clamp(_2210, 0.0, 1.0);
        float _2214 = _2190 * _2204;
        float _2216 = _2186 * _2204;
        float _2218 = abs(_2212);
        float _2220 = log2(_2218);
        float _2222 = _2194 * _2204;
        float _2224 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2226 = _1864 * _2216;
        float _2228 = -_2216;
        float _2230 = -_2224;
        float _2232 = fma(_2228, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2230);
        float _2234 = fma(_1880, _2214, _2226);
        float _2236 = -_2222;
        float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2232);
        float _2240 = fma(_1860, _2222, _2234);
        float _2242 = precise::clamp(_2240, 0.0, 1.0);
        float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2246 = _2238 + _2244;
        float _2248 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2250 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2252 = precise::clamp(_2250, 0.0, 1.0);
        float _2254 = exp2(_2248);
        float _2256 = _2254 * _2252;
        float _2258 = _2242 * _2256;
        float _2260 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2262 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2264 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2260;
        out.m_84.y = _2262;
        out.m_84.z = _2264;
    }
    out.m_86.x = _2176;
    out.m_86.y = _2178;
    out.m_86.z = _2180;
    if (!_2162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2266 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2266;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2018 = false;
    bool _441 = false;
    bool _339 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_46.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2323 = as_type<float>(_121);
        out.gl_Position.z = _2323;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = _139;
    if (_135)
    {
        float _143 = float(_105);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2393 = as_type<float>(_159);
        out.gl_Position.z = _2393;
    }
    if (_151)
    {
        return out;
    }
    float _161 = in.m_53.x;
    float _163 = in.m_53.y;
    float _165 = in.m_53.z;
    float _167 = in.m_55.x;
    float _169 = in.m_55.y;
    float _171 = in.m_55.z;
    float _173 = in.m_57.x;
    float _175 = in.m_57.y;
    float _177 = in.m_57.z;
    float _179 = _161 * _161;
    float _181 = _163 * _163;
    float _183 = _165 * _165;
    float _185 = fma(_167, _167, _179);
    float _187 = fma(_169, _169, _181);
    float _189 = fma(_171, _171, _183);
    float _191 = fma(_173, _173, _185);
    float _193 = fma(_175, _175, _187);
    float _195 = fma(_177, _177, _189);
    float _197 = sqrt(_191);
    float _199 = sqrt(_193);
    float _201 = sqrt(_195);
    bool _203 = _197 > 0.0;
    bool _205 = _199 > 0.0;
    float _207 = _199;
    if (_203)
    {
        float _209 = rsqrt(_191);
        _207 = _209;
    }
    float _211 = _207;
    float _213 = 0.0;
    if (!_203)
    {
        _213 = 0.0;
    }
    float _215 = _213;
    bool _217 = _201 > 0.0;
    float _219 = 0.0;
    float _221 = _215;
    if (!_203)
    {
        _219 = 0.0;
    }
    float _223 = _219;
    float _225 = 0.0;
    float _227 = _223;
    if (!_203)
    {
        _225 = 0.0;
    }
    float _229 = _225;
    float _231 = _197;
    float _233 = _229;
    if (_205)
    {
        float _235 = rsqrt(_193);
        _231 = _235;
    }
    float _237 = _231;
    float _239 = 0.0;
    if (!_205)
    {
        _239 = 0.0;
    }
    float _241 = _239;
    float _243 = 0.0;
    float _245 = _241;
    if (!_205)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    float _249 = 0.0;
    float _251 = _247;
    if (!_205)
    {
        _249 = 0.0;
    }
    float _253 = _249;
    float _255 = _201;
    float _257 = _253;
    if (_217)
    {
        float _259 = rsqrt(_195);
        _255 = _259;
    }
    float _261 = _255;
    if (_203)
    {
        float _263 = _211 * _161;
        _221 = _263;
    }
    float _265 = _221;
    if (_203)
    {
        float _267 = _211 * _167;
        _227 = _267;
    }
    float _269 = _227;
    if (_203)
    {
        float _271 = _211 * _173;
        _233 = _271;
    }
    float _273 = _233;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _277 = 0.0;
    float _279 = 0.0;
    if (!_217)
    {
        _277 = 0.0;
        _279 = 0.0;
    }
    float _281 = _277;
    float _283 = _279;
    float _285 = 0.0;
    float _287 = _283;
    float _289 = _281;
    if (!_217)
    {
        _285 = 0.0;
    }
    float _291 = _285;
    float _293 = _291;
    if (_205)
    {
        float _295 = _237 * _163;
        _245 = _295;
    }
    float _297 = _245;
    if (_205)
    {
        float _299 = _237 * _169;
        _251 = _299;
    }
    float _301 = _251;
    if (_205)
    {
        float _303 = _237 * _175;
        _257 = _303;
    }
    float _305 = _257;
    if (_217)
    {
        float _307 = _261 * _165;
        _287 = _307;
    }
    float _309 = _287;
    if (_217)
    {
        float _311 = _261 * _171;
        _293 = _311;
    }
    float _313 = _293;
    if (_217)
    {
        float _315 = _261 * _177;
        _289 = _315;
    }
    float _317 = _289;
    bool _319 = !_275;
    float _337;
    if (!_319)
    {
        float _321 = in.m_59.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_105);
        float _343 = 1.0 / _341;
        float _345 = _139 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _337;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _351 = _347 + _349;
    bool _353 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _355 = isnan(_347);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _365;
    float _369 = -_363;
    float _371 = _369 + 1.0;
    bool _373 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _375 = isnan(_347);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _385;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _391 = 1.0 / _367;
    float _393 = _383 * _371;
    float _395 = -_383;
    float _397 = _395 + 1.0;
    float _399 = _351 * _391;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _401;
    float _405 = fma(_387, _399, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = fma(_403, _399, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _409 = _405 * _393;
    float _411 = _407 * _393;
    float _413 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].x, _409);
    float _415 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].y, _411);
    float _417 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[144].x, _413);
    float _419 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[144].y, _415);
    bool _421 = !_389;
    float _439;
    if (!_421)
    {
        float _423 = in.m_59.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_105);
        float _445 = 1.0 / _443;
        float _447 = _139 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = in.m_59.z;
    float _453 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _455 = log2(_453);
    float _457 = in.m_59.x;
    float _459 = in.m_59.y;
    float _461 = _455 * _139;
    float _463 = exp2(_461);
    float _465 = _451 * 2.0;
    float _467 = _457 * 2.0;
    float _469 = _459 * 2.0;
    float _471 = _459 + _451;
    float _473 = floor(_465);
    float _475 = _471 + (-1.0);
    float _477 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _479 = floor(_467);
    float _481 = -_463;
    float _483 = _481 + 1.0;
    float _485 = floor(_469);
    bool _487 = _473 > 0.0;
    bool _489 = _473 >= 0.0;
    bool _491 = isnan(_473);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _501 = _499 != 0;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _505 = _503 != 0;
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _509 = _507 != 0;
    int _511 = _497 ? 0 : 1;
    bool _513 = _479 > 0.0;
    bool _515 = _479 >= 0.0;
    bool _517 = isnan(_479);
    bool _519 = _515 || _517;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    bool _525 = !_501;
    int _527 = _525 ? 0 : 1;
    int _529 = ~_511;
    int _531 = _529 + 1;
    int _533 = _531 + 1;
    bool _535 = _485 > 0.0;
    bool _537 = _485 >= 0.0;
    bool _539 = isnan(_485);
    bool _541 = _537 || _539;
    bool _543 = isnan(0.0);
    bool _545 = _541 || _543;
    int _547 = _533;
    if (!_487)
    {
        int _549 = ~_511;
        int _551 = _549 + 1;
        _547 = _551;
    }
    int _553 = _547;
    int _555 = _523 ? 0 : 1;
    float _557 = in.m_61.x;
    float _559 = in.m_61.y;
    float _561 = in.m_61.z;
    bool _563 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _565 = isnan(1.0);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _571 = _567 || _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _575 = 1.0 + _573;
    int _577 = abs(_527);
    float _579 = float(_553);
    float _581 = 1.0 / _575;
    float _583 = float(_577);
    bool _585 = !_505;
    int _587 = _585 ? 0 : 1;
    int _589 = ~_555;
    int _591 = _589 + 1;
    int _593 = _591 + 1;
    float _595 = _583 * _579;
    int _597 = _593;
    if (!_513)
    {
        int _599 = ~_555;
        int _601 = _599 + 1;
        _597 = _601;
    }
    int _603 = _597;
    float _605 = _459 + _457;
    bool _607 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _609 = isnan(0.0);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _615 = _611 || _613;
    int _617 = abs(_587);
    float _619 = _605 + (-1.0);
    int _621 = _545 ? 0 : 1;
    float _623 = _615 ? _483 : 0.0;
    float _625 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _627 = float(_617);
    float _629 = _457 + (-0.5);
    int _631 = ~_621;
    int _633 = _631 + 1;
    int _635 = _633 + 1;
    int _637 = _635;
    if (_571)
    {
        float _639 = _623 * _581;
        _141 = _639;
    }
    float _641 = _141;
    float _643 = float(_603);
    float _645 = as_type<float>(int(gl_VertexIndex));
    if (!_535)
    {
        int _647 = ~_621;
        int _649 = _647 + 1;
        _637 = _649;
    }
    int _651 = _637;
    float _653 = _595 * (-2.0);
    bool _655 = !_509;
    int _657 = _655 ? 0 : 1;
    float _659 = _627 * _643;
    float _661 = float(_651);
    float _663 = fma(_653, _557, _557);
    int _665 = abs(_657);
    float _667 = _659 * (-2.0);
    float _669 = fma(_625, _653, _625);
    float _671 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[196].x, _663);
    float _673 = fma(_477, _667, _477);
    float _675 = _459 + (-0.5);
    float _677 = fma(_669, _641, _671);
    float _679 = fma(_667, _559, _559);
    float _681 = float(_665);
    float _683 = in.m_66.x;
    float _685 = in.m_66.y;
    float _687 = _677 * 0.15915493667125701904296875;
    float _689 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[196].y, _679);
    float _691 = in.m_46.x;
    float _693 = in.m_46.y;
    float _695 = in.m_46.z;
    float _697 = _681 * _661;
    float _699 = _451 + _457;
    float _701 = _451 + (-0.5);
    float _703 = fma(_673, _641, _689);
    float _705 = _697 * (-2.0);
    float _707 = _699 + (-1.0);
    float _709 = _687 * 6.283185482025146484375;
    float _711 = cos(_709);
    float _713 = _703 * 0.15915493667125701904296875;
    float _715 = fma(_705, _561, _561);
    float _717 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _719 = as_type<int>(_645) & 1;
    bool _721 = _719 != 0;
    int _723 = as_type<int>(_645) & 2;
    bool _725 = _723 != 0;
    float _727 = in.m_68.y;
    float _729 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[196].z, _715);
    float _731 = fma(_717, _705, _717);
    float _733 = _713 * 6.283185482025146484375;
    float _735 = sin(_733);
    float _737 = fma(_731, _641, _729);
    float _739 = _419 * _685;
    bool _741 = !_725;
    float _743 = _741 ? (-0.5) : 0.5;
    float _745 = _737 * 0.15915493667125701904296875;
    float _747 = _713 * 6.283185482025146484375;
    float _749 = cos(_747);
    float _751 = _169 * _693;
    float _753 = _175 * _693;
    bool _755 = !_721;
    float _757 = _755 ? (-0.5) : 0.5;
    float _759 = _417 * _683;
    float _761 = fma(_167, _691, _751);
    float _763 = fma(_173, _691, _753);
    float _765 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _767 = _687 * 6.283185482025146484375;
    float _769 = sin(_767);
    float _771 = fma(_171, _695, _761);
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _743);
    float _775 = in.m_55.w;
    float _777 = fma(_177, _695, _763);
    float _779 = _711 * _735;
    float _781 = _759 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _757);
    float _785 = _745 * 6.283185482025146484375;
    float _787 = cos(_785);
    float _789 = _711 * _749;
    float _791 = _765 * _773;
    float _793 = in.m_57.w;
    float _795 = _781 * _783;
    float _797 = _693 + _727;
    bool _799 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _801 = isnan(0.5);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _807 = _803 || _805;
    float _809 = _745 * 6.283185482025146484375;
    float _811 = sin(_809);
    float _813 = _769 * _735;
    float _815 = _769 * _749;
    bool _817 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _819 = isnan(0.5);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _825 = _821 || _823;
    float _827 = _711 * _787;
    float _829 = _769 * _787;
    float _831 = _749 * _787;
    float _833 = _735 * _787;
    float _835 = _827 * _791;
    float _837 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _839 = _829 * _791;
    float _841 = fma(_811, _789, _813);
    float _843 = -_779;
    float _845 = fma(_811, _815, _843);
    float _847 = -_815;
    float _849 = fma(_811, _779, _847);
    float _851 = -_791;
    float _853 = _811 * _851;
    float _855 = fma(_841, _795, _835);
    float _857 = fma(_811, _813, _789);
    float _859 = _771 + _775;
    float _861 = fma(_831, _795, _853);
    float _863 = fma(_849, _837, _855);
    float _865 = fma(_845, _795, _839);
    float _867 = _777 + _793;
    float _869 = fma(_833, _837, _861);
    float _871 = _863 * _305;
    float _873 = fma(_857, _837, _865);
    float _875 = _797 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _877 = _863 * _301;
    float _879 = fma(_869, _273, _871);
    float _881 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[11].x, _875);
    float _883 = fma(_869, _269, _877);
    float _885 = fma(_873, _317, _879);
    float _887 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].z, _881);
    float _889 = fma(_873, _313, _883);
    float _891 = _867 + _885;
    float _893 = _797 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _895 = _887 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _897 = _859 + _889;
    float _899 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _901 = _891 + _899;
    float _903 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[10].x, _893);
    float _905 = 1.0 / _895;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _909 = _897 + _907;
    float _911 = _901 * _901;
    float _913 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].z, _903);
    float _915 = fma(_909, _909, _911);
    float _917 = _913 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _919 = sqrt(_915);
    float _921 = _917 + _895;
    float _923 = _921 * _905;
    float _925 = _923 * 0.5;
    float _927 = _863 * _297;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _931 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _929);
    float _933 = fma(_869, _265, _927);
    float _935 = 1.0 / _931;
    float _937 = fma(_873, _309, _933);
    bool _939 = _919 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _941 = _797 + _937;
    float _943 = _673;
    float _945 = _897;
    float _947 = _891;
    float _949 = _931;
    float _951 = _937;
    float _953 = _727;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    float _957 = _941;
    float _959 = _859;
    if (!_939)
    {
        _943 = _941;
    }
    float _961 = _943;
    bool _963 = !_939;
    float _965 = _961;
    if (!_963)
    {
        float _967 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _969 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _971 = _919 + _969;
        float _973 = rsqrt(_915);
        float _975 = _971 * _967;
        float _977 = _941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _979 = _975 * 0.15915493667125701904296875;
        float _981 = _979 * 6.283185482025146484375;
        float _983 = cos(_981);
        float _985 = _979 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = _983 + (-1.0);
        float _991 = _989 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _993 = fma(_987, _977, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _995 = fma(_941, _983, _991);
        float _997 = _973 * _993;
        float _999 = fma(_909, _997, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1001 = fma(_901, _997, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _965 = _995;
        _945 = _999;
        _947 = _1001;
        _949 = _979;
        _951 = _973;
    }
    float _1003 = _965;
    float _1005 = _945;
    float _1007 = _947;
    float _1009 = _949;
    float _1011 = _951;
    float _1013 = _1003;
    float _1015 = _1005;
    float _1017 = _1007;
    float _1019 = _1011;
    if (_825)
    {
        _953 = 1.0;
    }
    float _1021 = _953;
    float _1023 = _1021;
    if (!_807)
    {
        float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1027 = _797 + _1025;
        float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1031 = _859 + _1029;
        float _1033 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1035 = -_797;
        float _1037 = _1035 + _1003;
        float _1039 = _1027 * _1027;
        float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1043 = _867 + _1041;
        float _1045 = -_859;
        float _1047 = _1045 + _1005;
        float _1049 = -_867;
        float _1051 = _1049 + _1007;
        float _1053 = fma(_1031, _1031, _1039);
        float _1055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1057 = fma(_1043, _1043, _1053);
        float _1059 = sqrt(_1057);
        float _1061 = _1033 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1063 = precise::min(_1059, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1065 = _1063 * _1055;
        float _1067 = _1061 * _1065;
        float _1069 = fma(_1037, _1067, _797);
        float _1071 = fma(_1047, _1067, _859);
        float _1073 = fma(_1051, _1067, _867);
        _1013 = _1069;
        _1015 = _1071;
        _1017 = _1073;
    }
    float _1075 = _1013;
    float _1077 = _1015;
    float _1079 = _1017;
    if (_825)
    {
        _955 = 1.0;
    }
    float _1081 = _955;
    float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1085 = _935 * _1083;
    float _1087 = _1081;
    if (!_825)
    {
        float _1089 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1091 = _1089 * 0.15915493667125701904296875;
        float _1093 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1095 = _1091 * 6.283185482025146484375;
        float _1097 = cos(_1095);
        float _1099 = _1093 * 0.15915493667125701904296875;
        float _1101 = _1091 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        float _1105 = 1.0 / _1097;
        float _1107 = _1099 * 6.283185482025146484375;
        float _1109 = cos(_1107);
        float _1111 = _1103 * _1105;
        float _1113 = _1099 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1109 * _1111;
        float _1119 = 1.0 / _1117;
        float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1123 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1121;
        float _1125 = 1.0 / _1123;
        float _1127 = _1115 * _1119;
        float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1131 = fma(_1085, _1127, _1129);
        float _1133 = _1131 * _1125;
        float _1135 = precise::clamp(_1133, 0.0, 1.0);
        _1019 = _1091;
        _1023 = _1135;
    }
    float _1137 = _1019;
    float _1139 = _1023;
    if (!_825)
    {
        float _1141 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1143 = _1141 * 0.15915493667125701904296875;
        float _1145 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1147 = _1143 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = _1145 * 0.15915493667125701904296875;
        float _1153 = _1143 * 6.283185482025146484375;
        float _1155 = sin(_1153);
        float _1157 = 1.0 / _1149;
        float _1159 = _1151 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        float _1163 = _1155 * _1157;
        float _1165 = _1151 * 6.283185482025146484375;
        float _1167 = sin(_1165);
        float _1169 = _1161 * _1163;
        float _1171 = 1.0 / _1169;
        float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1175 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1173;
        float _1177 = 1.0 / _1175;
        float _1179 = _1167 * _1171;
        float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1183 = fma(_1085, _1179, _1181);
        float _1185 = _1183 * _1177;
        float _1187 = precise::clamp(_1185, 0.0, 1.0);
        float _1189 = -_1187;
        float _1191 = _1189 + 1.0;
        _1087 = _1191;
    }
    float _1193 = _1087;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1197 = _1075 + _1195;
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1201 = _1077 + _1199;
    float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1205 = _1079 + _1203;
    float _1207 = _1197 * _1197;
    float _1209 = fma(_1201, _1201, _1207);
    float _1211 = fma(_1205, _1205, _1209);
    float _1213 = rsqrt(_1211);
    float _1215 = sqrt(_1211);
    float _1217 = _1213 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1219 = _1201 * _1217;
    float _1221 = _1205 * _1217;
    float _1223 = _1219 * _1219;
    float _1225 = _1221 * _1221;
    float _1227 = _1223 + _1225;
    float _1229 = sqrt(_1227);
    bool _1231 = _1229 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1235 = _1229 + _1233;
    float _1237 = _873;
    float _1239 = _1227;
    float _1241 = _1235;
    float _1243 = _1197;
    float _1245 = _1219;
    float _1247 = _1221;
    float _1249 = _1223;
    if (_1231)
    {
        float _1251 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1237 = _1251;
    }
    float _1253 = _1237;
    if (_1231)
    {
        float _1255 = rsqrt(_1227);
        _1239 = _1255;
    }
    float _1257 = _1239;
    float _1259 = _1257;
    if (_1231)
    {
        float _1261 = _1235 * _1253;
        _1241 = _1261;
    }
    float _1263 = _1241;
    if (_1231)
    {
        float _1265 = _1263 * 0.15915493667125701904296875;
        _957 = _1265;
    }
    float _1267 = _957;
    float _1269 = _1009;
    if (_1231)
    {
        float _1271 = _1267 * 6.283185482025146484375;
        float _1273 = sin(_1271);
        _1269 = _1273;
    }
    float _1275 = _1269;
    float _1277 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1279 = precise::max(0.0, _1277);
    float _1281 = _1137;
    float _1283 = _1279;
    if (_1231)
    {
        float _1285 = _1267 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        _1281 = _1287;
    }
    float _1289 = _1281;
    float _1291 = -_1217;
    float _1293 = -_1279;
    float _1295 = fma(_1197, _1291, _1293);
    if (_1231)
    {
        float _1297 = _1295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1243 = _1297;
    }
    float _1299 = _1243;
    float _1301 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1303 = _1275;
    if (_1231)
    {
        float _1305 = fma(_1275, _1299, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1303 = _1305;
    }
    float _1307 = _1303;
    float _1309 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1311 = _1307;
    if (!_1231)
    {
        _959 = _1295;
    }
    float _1313 = _959;
    float _1315 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1301);
    float _1317 = _1313;
    if (_1231)
    {
        float _1319 = _1289 + (-1.0);
        _1283 = _1319;
    }
    float _1321 = _1283;
    float _1323 = _1321;
    if (_1231)
    {
        float _1325 = _1257 * _1307;
        _1311 = _1325;
    }
    float _1327 = _1311;
    float _1329 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1315);
    if (_1231)
    {
        float _1331 = _1321 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1259 = _1331;
    }
    float _1333 = _1259;
    if (_1231)
    {
        float _1335 = _1219 * _1327;
        _1245 = _1335;
    }
    float _1337 = _1245;
    if (_1231)
    {
        float _1339 = _1221 * _1327;
        _1247 = _1339;
    }
    float _1341 = _1247;
    if (!_1231)
    {
        _1323 = _1225;
    }
    float _1343 = _1323;
    float _1345 = _1343;
    if (_1231)
    {
        float _1347 = fma(_1295, _1289, _1333);
        _1317 = _1347;
    }
    float _1349 = _1317;
    if (_1231)
    {
        float _1351 = _1337 * _1337;
        _1249 = _1351;
    }
    float _1353 = _1249;
    if (_1231)
    {
        float _1355 = _1341 * _1341;
        _1345 = _1355;
    }
    float _1357 = _1345;
    float _1359 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1361 = fma(_1349, _1349, _1353);
    float _1363 = floor(_1309);
    float _1365 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1359);
    float _1367 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1369 = _1361 + _1357;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1373 = fma(_1215, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1371);
    float _1375 = precise::clamp(_1373, 0.0, 1.0);
    float _1377 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1365);
    float _1379 = rsqrt(_1369);
    float _1381 = -_1375;
    float _1383 = _1381 + 1.0;
    float _1385 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1387 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1389 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1391 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1393 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1395 = abs(_1383);
    float _1397 = log2(_1395);
    float _1399 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1387);
    float _1401 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1391);
    float _1403 = _1389 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1405 = -_1363;
    float _1407 = _1309 + _1405;
    float _1409 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1401);
    float _1411 = -_1403;
    float _1413 = fma(_1411, _1393, 1.0);
    float _1415 = _1379 * _1349;
    float _1417 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1399);
    float _1419 = _1379 * _1337;
    float _1421 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1423 = _1379 * _1341;
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1427 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1429 = floor(_1385);
    float _1431 = _1425 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1433 = -_1427;
    float _1435 = fma(_1415, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1433);
    float _1437 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1439 = _1425 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1441 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1431);
    float _1443 = -_1423;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1435);
    float _1447 = log2(_1413);
    float _1449 = _1425 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1451 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1441);
    float _1453 = fma(_1445, 0.5, 0.5);
    float _1455 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1439);
    float _1457 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1449);
    float _1459 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1451);
    float _1461 = fma(_1453, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1463 = exp2(_1437);
    float _1465 = fma(_1445, -0.5, 0.5);
    float _1467 = -_1429;
    float _1469 = _1385 + _1467;
    float _1471 = _1415 + 1.0;
    float _1473 = fma(_1453, _1461, -0.212114393711090087890625);
    float _1475 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1457);
    float _1477 = 1.0 / _1459;
    float _1479 = sqrt(_1465);
    float _1481 = -_1415;
    float _1483 = fma(_1463, _1471, _1481);
    float _1485 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1475);
    float _1487 = _1447 * 0.693147182464599609375;
    float2 _4354 = float2(_1407, _1469);
    float _1489 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4354, float2(0.0), isnan(_4354)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4354, float2(0.0), isnan(_4354)), level(0.0)).x;
    float _1491 = fma(_1453, _1473, 1.570728778839111328125);
    float _1493 = fma(_1483, 0.5, 0.5);
    float _1495 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1497 = _1485 * _1477;
    float _1499 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1455);
    float _1501 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1499);
    float _1503 = _1479 * 0.636619746685028076171875;
    float _1505 = _1501 * _1477;
    float _1507 = fma(_1497, 0.5, 0.5);
    float _1509 = -_1491;
    float _1511 = fma(_1503, _1509, 1.0);
    float _1513 = fma(_1505, -0.5, 0.5);
    float3 _4403 = float3(_1507, _1513, _1495);
    float _1515 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4403, float3(0.0), isnan(_4403)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4403, float3(0.0), isnan(_4403)), level(0.0)).x;
    float3 _4414 = float3(_1507, _1513, _1495);
    float4 _1518 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4414, float3(0.0), isnan(_4414)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4414, float3(0.0), isnan(_4414)), level(0.0)).xyzw;
    float _1520 = _1518.x;
    float _1522 = _1518.y;
    float _1524 = _1518.z;
    float _1526 = _1518.w;
    float2 _4430 = float2(_1511, _1493);
    float3 _1530 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4430, float2(0.0), isnan(_4430)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4430, float2(0.0), isnan(_4430)), level(0.0)).xyz;
    float _1532 = _1530.x;
    float _1534 = _1530.y;
    float _1536 = _1530.z;
    float _1538 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1540 = _1425 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1544 = _1542 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1548 = _1546 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1550 = _459 > 0.5;
    float _1552 = exp2(_1538);
    float _1554 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1540);
    bool _1556 = _457 > 0.5;
    float _1558 = 1.0 / _1544;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1560;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1568 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1570 = isnan(_449);
    bool _1572 = _1568 || _1570;
    bool _1574 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1576 = _1572 || _1574;
    float _1578 = float(_1576);
    float _1580 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1554);
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1584 = _1582 != 0;
    int _1586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1588 = _1586 != 0;
    float _1590 = 1.0 / _1548;
    float _1592 = -_1578;
    float _1594 = _1592 + 1.0;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1598 = _1596 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1600 = -_1552;
    float _1602 = _1600 + 1.0;
    bool _1604 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1606 = isnan(_449);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1580);
    float _1618 = _1562 * _1558;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1622 = _449 + _1620;
    float _1624 = 1.0 / _1566;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1626;
    float _1630 = -_1614;
    float _1632 = _1630 + 1.0;
    float _1634 = fma(_1618, _1622, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1636 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1638 = isnan(_449);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1644 = _1640 || _1642;
    float _1646 = float(_1644);
    float _1648 = _1602 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1650 = _1598 * _1590;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1654 = _449 + _1652;
    float _1656 = _1578 * _1632;
    float _1658 = _1646 * _1594;
    float _1660 = -_1646;
    float _1662 = _1660 + 1.0;
    bool _1664 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1666 = isnan(_449);
    bool _1668 = _1664 || _1666;
    bool _1670 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1672 = _1668 || _1670;
    float _1674 = float(_1672);
    float _1676 = fma(_1650, _1654, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1678 = _1634 * _1658;
    float _1680 = -_743;
    int _1682 = _1550 ? as_type<int>(_1680) : as_type<int>(_743);
    float _1684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1686 = -_1674;
    float _1688 = _1686 + 1.0;
    float _1690 = fma(_1662, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1678);
    float _1692 = -_757;
    int _1694 = _1556 ? as_type<int>(_1692) : as_type<int>(_757);
    float _1696 = _1628 * _1624;
    float _1698 = _1614 * _1688;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1702 = _449 + _1700;
    bool _1704 = !_1584;
    float _1706 = _1704 ? _757 : as_type<float>(_1694);
    float _1708 = abs(_1085);
    float _1710 = log2(_1708);
    bool _1712 = !_1588;
    float _1714 = _1712 ? _743 : as_type<float>(_1682);
    float _1716 = fma(_1696, _1702, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1718 = fma(_1676, _1656, _1690);
    float _1720 = _1706 + 0.5;
    float _1722 = _757 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1724 = -_1714;
    float _1726 = _1724 + 0.5;
    float _1728 = fma(_1716, _1698, _1718);
    float _1730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1732 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1734 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1736 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1728);
    float _1738 = _1732 * _1684;
    float _1740 = _1736 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1742 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.gl_Position.x = _1485;
    out.gl_Position.y = _1501;
    out.gl_Position.z = _1616;
    out.gl_Position.w = _1459;
    float _1748 = exp2(_1742);
    float _1750 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1734 * _1730;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_70.x = _1738;
    out.m_70.y = _1752;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1760 = _1758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1762 = _743 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1768 = fma(_1748, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1770 = precise::clamp(_1768, 0.0, 1.0);
    float _1772 = -_1762;
    float _1774 = _811 * _1772;
    out.m_72.x = _1750;
    out.m_72.y = _1754;
    out.m_72.z = _1760;
    out.m_72.w = _1756;
    float _1776 = _827 * _1762;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1780 = fma(_831, _1722, _1774);
    float _1782 = fma(_841, _1722, _1776);
    float _1784 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1786 = _1766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = in.m_68.x;
    float _1792 = _849 + _1782;
    float _1794 = _829 * _1762;
    bool _1796 = _1085 <= 8000.0;
    bool _1798 = isnan(_1085);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan(8000.0);
    bool _1804 = _1800 || _1802;
    float _1806 = float(_1804);
    out.m_74.x = _1784;
    out.m_74.y = _1786;
    out.m_74.z = _1788;
    out.m_74.w = _1740;
    float _1808 = fma(_1770, -2.0, 3.0);
    float _1810 = _1770 * _1770;
    float _1812 = _1792 * _301;
    float _1814 = fma(_845, _1722, _1794);
    float _1816 = _833 + _1780;
    float _1818 = _1810 * _1808;
    bool _1820 = _1215 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1822 = isnan(_1215);
    bool _1824 = _1820 || _1822;
    bool _1826 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1828 = _1824 || _1826;
    float _1830 = _857 + _1814;
    float _1832 = _1616 + _1459;
    float _1834 = -_1818;
    float _1836 = _1834 + 1.0;
    float _1838 = _1832 * 0.5;
    float _1840 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1818);
    float _1842 = _1792 * _297;
    float _1844 = _1792 * _305;
    float _1846 = _1459 * 0.5;
    float _1848 = _1806 * _1840;
    float _1850 = _1485 + _1459;
    float _1852 = fma(_1816, _273, _1844);
    float _1854 = fma(_1501, -0.5, _1846);
    float _1856 = _1848 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1858 = fma(_1816, _265, _1842);
    float _1860 = fma(_1830, _317, _1852);
    float _1862 = fma(_1816, _269, _1812);
    float _1864 = fma(_1830, _309, _1858);
    float _1866 = _1850 * 0.5;
    float _1868 = _1459;
    float _1870 = _1616;
    float _1872 = _1501;
    float _1874 = _1854;
    float _1876 = _1866;
    if (!_1828)
    {
        _1868 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1878 = _1868;
    float _1880 = fma(_1830, _313, _1862);
    float _1882 = _1878;
    float _1884 = _1878;
    if (!_1828)
    {
        _1870 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1886 = _1870;
    out.m_76.x = _1866;
    out.m_76.y = _1854;
    out.m_76.z = _1838;
    out.m_76.w = _1459;
    float _1888 = _1886;
    float _1890 = _1886;
    if (!_1828)
    {
        _1872 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1892 = _1872;
    out.m_78.x = _1880;
    out.m_78.y = _1864;
    out.m_78.z = _1860;
    float _1894 = _1892;
    float _1896 = _1892;
    if (!_1828)
    {
        _1874 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1898 = _1874;
    float _1900 = _1898;
    float _1902 = _1898;
    if (!_1828)
    {
        _1876 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1904 = _1876;
    float _1906 = -_1489;
    float _1908 = _1906 + 1.0;
    float _1910 = _1908 * _1856;
    float _1912 = precise::clamp(_1910, 0.0, 1.0);
    float _1914 = -_1912;
    float _1916 = fma(_1914, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1918 = _1916 * _1790;
    float _1920 = _1918 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1922 = _1648 * _1515;
    float _1924 = -_1648;
    float _1926 = _1924 + 1.0;
    out.m_80.x = _1920;
    float _1928 = _1526 * _1922;
    float _1930 = _1536 * _1922;
    float _1932 = _1526 * _1926;
    float _1934 = fma(_1532, _1928, _1520);
    float _1936 = fma(_1534, _1928, _1522);
    float _1938 = fma(_1526, _1930, _1524);
    float _1940 = _1139 * _1193;
    out.m_82.x = _1934;
    out.m_82.y = _1936;
    out.m_82.z = _1938;
    out.m_82.w = _1932;
    float _1942 = _1940 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1944 = _1940;
    float _1946 = _1904;
    float _1948 = _1904;
    if (!_1828)
    {
        _1944 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1950 = _1944;
    bool _1952 = !_1828;
    float _1954 = _1950;
    float _1956 = _1950;
    if (!_1952)
    {
        bool _1958 = _1215 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1960 = isnan(_1215);
        bool _1962 = _1958 || _1960;
        bool _1964 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1966 = _1962 || _1964;
        if (!_1966)
        {
            float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1970 = _1215 + _1968;
            float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1974 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1972;
            float _1976 = 1.0 / _1974;
            float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1992 = _1990 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1996 = _1994 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1998 = _1970 * _1976;
            float _2000 = precise::clamp(_1998, 0.0, 1.0);
            float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2004 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2006 = fma(_2000, _1980, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2008 = fma(_2000, _2004, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2010 = fma(_2000, _1984, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2012 = fma(_2000, _1988, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2014 = fma(_2000, _1992, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2016 = fma(_2000, _1996, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1948 = _2008;
            _1896 = _2014;
            _1902 = _2006;
            _1890 = _2012;
            _1884 = _2010;
            _1956 = _2016;
            _2018 = true;
        }
        else
        {
            bool _2020 = _1215 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2022 = isnan(_1215);
            bool _2024 = _2020 || _2022;
            bool _2026 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2028 = _2024 || _2026;
            if (!_2028)
            {
                _1900 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2030 = _1900;
            _1902 = _2030;
            if (!_2028)
            {
                _1946 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2032 = _1946;
            _1948 = _2032;
            if (!_2028)
            {
                _1882 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2034 = _1882;
            _1884 = _2034;
            if (!_2028)
            {
                _1888 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2036 = _1888;
            _1890 = _2036;
            if (!_2028)
            {
                _1894 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2038 = _1894;
            _1896 = _2038;
            if (!_2028)
            {
                _1954 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2040 = _1954;
            bool _2042 = !_2028;
            _1956 = _2040;
            if (!_2042)
            {
                bool _2044 = _1215 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2046 = isnan(_1215);
                bool _2048 = _2044 || _2046;
                bool _2050 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2052 = _2048 || _2050;
                if (!_2052)
                {
                    float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2056 = _1215 + _2054;
                    float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2060 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2058;
                    float _2062 = 1.0 / _2060;
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2078 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2082 = _2080 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2084 = _2056 * _2062;
                    float _2086 = precise::clamp(_2084, 0.0, 1.0);
                    float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2090 = _2088 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2092 = fma(_2086, _2066, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2094 = fma(_2086, _2090, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2096 = fma(_2086, _2070, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2098 = fma(_2086, _2074, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2100 = fma(_2086, _2078, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2102 = fma(_2086, _2082, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1948 = _2094;
                    _1896 = _2100;
                    _1902 = _2092;
                    _1890 = _2098;
                    _1884 = _2096;
                    _1956 = _2102;
                    _2018 = true;
                }
                else
                {
                    _1948 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1896 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1902 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1890 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1884 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1956 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2018 = false;
    float _2104 = _1948;
    float _2106 = _1896;
    float _2108 = _1902;
    float _2110 = _1890;
    float _2112 = _1884;
    float _2114 = _1956;
    float _2116 = fma(_1864, -0.5, 0.5);
    float _2118 = precise::clamp(_2116, 0.0, 1.0);
    float _2120 = -_2104;
    float _2122 = _2120 + _2106;
    float _2124 = -_2108;
    float _2126 = _2124 + _2110;
    out.m_84.x = 0.0;
    float _2128 = fma(_2118, _2122, _2104);
    float _2130 = -_2112;
    float _2132 = _2130 + _2114;
    float _2134 = fma(_2118, _2126, _2108);
    float _2136 = _2128 * 0.586610972881317138671875;
    bool _2138 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2140 = fma(_2118, _2132, _2112);
    float _2142 = _1942 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2144 = fma(_2134, 0.298911988735198974609375, _2136);
    bool _2146 = _1139 > 0.0;
    bool _2148 = isnan(_1139);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan(0.0);
    bool _2154 = _2150 || _2152;
    float _2156 = fma(_2140, 0.114477999508380889892578125, _2144);
    out.m_49.x = _2142;
    bool _2158 = _1193 <= 0.0;
    bool _2160 = !_2154;
    bool _2162 = _2158 || _2160;
    float _2164 = -_2156;
    float _2166 = _2134 + _2164;
    float _2168 = -_2156;
    float _2170 = _2128 + _2168;
    float _2172 = -_2156;
    float _2174 = _2140 + _2172;
    float _2176 = fma(_2166, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    float _2178 = fma(_2170, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    float _2180 = fma(_2174, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    bool _2182 = !_2138;
    if (!_2182)
    {
        float _2184 = -_1075;
        float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2188 = -_1077;
        float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2192 = -_1079;
        float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2196 = _2186 * _2186;
        float _2198 = fma(_2190, _2190, _2196);
        float _2200 = fma(_2194, _2194, _2198);
        float _2202 = sqrt(_2200);
        float _2204 = rsqrt(_2200);
        float _2206 = -_2202;
        float _2208 = _2206 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2210 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2212 = precise::clamp(_2210, 0.0, 1.0);
        float _2214 = _2190 * _2204;
        float _2216 = _2186 * _2204;
        float _2218 = abs(_2212);
        float _2220 = log2(_2218);
        float _2222 = _2194 * _2204;
        float _2224 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2226 = _1864 * _2216;
        float _2228 = -_2216;
        float _2230 = -_2224;
        float _2232 = fma(_2228, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2230);
        float _2234 = fma(_1880, _2214, _2226);
        float _2236 = -_2222;
        float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2232);
        float _2240 = fma(_1860, _2222, _2234);
        float _2242 = precise::clamp(_2240, 0.0, 1.0);
        float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2246 = _2238 + _2244;
        float _2248 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2250 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2252 = precise::clamp(_2250, 0.0, 1.0);
        float _2254 = exp2(_2248);
        float _2256 = _2254 * _2252;
        float _2258 = _2242 * _2256;
        float _2260 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2262 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2264 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2260;
        out.m_84.y = _2262;
        out.m_84.z = _2264;
    }
    out.m_86.x = _2176;
    out.m_86.y = _2178;
    out.m_86.z = _2180;
    if (!_2162)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2266 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2266;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2018 = false;
    bool _441 = false;
    bool _339 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_46.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_49.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2323 = as_type<float>(_121);
        out.gl_Position.z = _2323;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_51.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = _139;
    if (_135)
    {
        float _143 = float(_105);
        _115 = _143;
    }
    float _145 = _115;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2393 = as_type<float>(_159);
        out.gl_Position.z = _2393;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = in.m_53.x;
    float _163 = in.m_53.y;
    float _165 = in.m_53.z;
    float _167 = in.m_55.x;
    float _169 = in.m_55.y;
    float _171 = in.m_55.z;
    float _173 = in.m_57.x;
    float _175 = in.m_57.y;
    float _177 = in.m_57.z;
    float _179 = _161 * _161;
    float _181 = _163 * _163;
    float _183 = _165 * _165;
    float _185 = fma(_167, _167, _179);
    float _187 = fma(_169, _169, _181);
    float _189 = fma(_171, _171, _183);
    float _191 = fma(_173, _173, _185);
    float _193 = fma(_175, _175, _187);
    float _195 = fma(_177, _177, _189);
    float _197 = sqrt(_191);
    float _199 = sqrt(_193);
    float _201 = sqrt(_195);
    bool _203 = _197 > 0.0;
    bool _205 = _199 > 0.0;
    float _207 = _199;
    if (_203)
    {
        float _209 = rsqrt(_191);
        _207 = _209;
    }
    float _211 = _207;
    float _213 = 0.0;
    if (!_203)
    {
        _213 = 0.0;
    }
    float _215 = _213;
    bool _217 = _201 > 0.0;
    float _219 = 0.0;
    float _221 = _215;
    if (!_203)
    {
        _219 = 0.0;
    }
    float _223 = _219;
    float _225 = 0.0;
    float _227 = _223;
    if (!_203)
    {
        _225 = 0.0;
    }
    float _229 = _225;
    float _231 = _197;
    float _233 = _229;
    if (_205)
    {
        float _235 = rsqrt(_193);
        _231 = _235;
    }
    float _237 = _231;
    float _239 = 0.0;
    if (!_205)
    {
        _239 = 0.0;
    }
    float _241 = _239;
    float _243 = 0.0;
    float _245 = _241;
    if (!_205)
    {
        _243 = 0.0;
    }
    float _247 = _243;
    float _249 = 0.0;
    float _251 = _247;
    if (!_205)
    {
        _249 = 0.0;
    }
    float _253 = _249;
    float _255 = _201;
    float _257 = _253;
    if (_217)
    {
        float _259 = rsqrt(_195);
        _255 = _259;
    }
    float _261 = _255;
    if (_203)
    {
        float _263 = _211 * _161;
        _221 = _263;
    }
    float _265 = _221;
    if (_203)
    {
        float _267 = _211 * _167;
        _227 = _267;
    }
    float _269 = _227;
    if (_203)
    {
        float _271 = _211 * _173;
        _233 = _271;
    }
    float _273 = _233;
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _277 = 0.0;
    float _279 = 0.0;
    if (!_217)
    {
        _277 = 0.0;
        _279 = 0.0;
    }
    float _281 = _277;
    float _283 = _279;
    float _285 = 0.0;
    float _287 = _283;
    float _289 = _281;
    if (!_217)
    {
        _285 = 0.0;
    }
    float _291 = _285;
    float _293 = _291;
    if (_205)
    {
        float _295 = _237 * _163;
        _245 = _295;
    }
    float _297 = _245;
    if (_205)
    {
        float _299 = _237 * _169;
        _251 = _299;
    }
    float _301 = _251;
    if (_205)
    {
        float _303 = _237 * _175;
        _257 = _303;
    }
    float _305 = _257;
    if (_217)
    {
        float _307 = _261 * _165;
        _287 = _307;
    }
    float _309 = _287;
    if (_217)
    {
        float _311 = _261 * _171;
        _293 = _311;
    }
    float _313 = _293;
    if (_217)
    {
        float _315 = _261 * _177;
        _289 = _315;
    }
    float _317 = _289;
    bool _319 = !_275;
    float _337;
    if (!_319)
    {
        float _321 = in.m_59.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_105);
        float _343 = 1.0 / _341;
        float _345 = _139 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _337;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _351 = _347 + _349;
    bool _353 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _355 = isnan(_347);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _365;
    float _369 = -_363;
    float _371 = _369 + 1.0;
    bool _373 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _375 = isnan(_347);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _385;
    bool _389 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _391 = 1.0 / _367;
    float _393 = _383 * _371;
    float _395 = -_383;
    float _397 = _395 + 1.0;
    float _399 = _351 * _391;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _401;
    float _405 = fma(_387, _399, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _407 = fma(_403, _399, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _409 = _405 * _393;
    float _411 = _407 * _393;
    float _413 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].x, _409);
    float _415 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].y, _411);
    float _417 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[144].x, _413);
    float _419 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[144].y, _415);
    bool _421 = !_389;
    float _439;
    if (!_421)
    {
        float _423 = in.m_59.x;
        float _425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _427 = _423 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _429 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _431 = _429 * _425;
        float _433 = floor(_431);
        float _435 = -_433;
        float _437 = _431 + _435;
        _439 = _437;
        _441 = true;
    }
    else
    {
        float _443 = float(_105);
        float _445 = 1.0 / _443;
        float _447 = _139 * _445;
        _439 = _447;
    }
    _441 = false;
    float _449 = _439;
    float _451 = in.m_59.z;
    float _453 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _455 = log2(_453);
    float _457 = in.m_59.x;
    float _459 = in.m_59.y;
    float _461 = _455 * _139;
    float _463 = exp2(_461);
    float _465 = _451 * 2.0;
    float _467 = _457 * 2.0;
    float _469 = _459 * 2.0;
    float _471 = _459 + _451;
    float _473 = floor(_465);
    float _475 = _471 + (-1.0);
    float _477 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _479 = floor(_467);
    float _481 = -_463;
    float _483 = _481 + 1.0;
    float _485 = floor(_469);
    bool _487 = _473 > 0.0;
    bool _489 = _473 >= 0.0;
    bool _491 = isnan(_473);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _501 = _499 != 0;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _505 = _503 != 0;
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _509 = _507 != 0;
    int _511 = _497 ? 0 : 1;
    bool _513 = _479 > 0.0;
    bool _515 = _479 >= 0.0;
    bool _517 = isnan(_479);
    bool _519 = _515 || _517;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    bool _525 = !_501;
    int _527 = _525 ? 0 : 1;
    int _529 = ~_511;
    int _531 = _529 + 1;
    int _533 = _531 + 1;
    bool _535 = _485 > 0.0;
    bool _537 = _485 >= 0.0;
    bool _539 = isnan(_485);
    bool _541 = _537 || _539;
    bool _543 = isnan(0.0);
    bool _545 = _541 || _543;
    int _547 = _533;
    if (!_487)
    {
        int _549 = ~_511;
        int _551 = _549 + 1;
        _547 = _551;
    }
    int _553 = _547;
    int _555 = _523 ? 0 : 1;
    float _557 = in.m_61.x;
    float _559 = in.m_61.y;
    float _561 = in.m_61.z;
    bool _563 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _565 = isnan(1.0);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _571 = _567 || _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _575 = 1.0 + _573;
    int _577 = abs(_527);
    float _579 = float(_553);
    float _581 = 1.0 / _575;
    float _583 = float(_577);
    bool _585 = !_505;
    int _587 = _585 ? 0 : 1;
    int _589 = ~_555;
    int _591 = _589 + 1;
    int _593 = _591 + 1;
    float _595 = _583 * _579;
    int _597 = _593;
    if (!_513)
    {
        int _599 = ~_555;
        int _601 = _599 + 1;
        _597 = _601;
    }
    int _603 = _597;
    float _605 = _459 + _457;
    bool _607 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _609 = isnan(0.0);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _615 = _611 || _613;
    int _617 = abs(_587);
    float _619 = _605 + (-1.0);
    int _621 = _545 ? 0 : 1;
    float _623 = _615 ? _483 : 0.0;
    float _625 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _627 = float(_617);
    float _629 = _457 + (-0.5);
    int _631 = ~_621;
    int _633 = _631 + 1;
    int _635 = _633 + 1;
    int _637 = _635;
    if (_571)
    {
        float _639 = _623 * _581;
        _141 = _639;
    }
    float _641 = _141;
    float _643 = float(_603);
    float _645 = as_type<float>(int(gl_VertexIndex));
    if (!_535)
    {
        int _647 = ~_621;
        int _649 = _647 + 1;
        _637 = _649;
    }
    int _651 = _637;
    float _653 = _595 * (-2.0);
    bool _655 = !_509;
    int _657 = _655 ? 0 : 1;
    float _659 = _627 * _643;
    float _661 = float(_651);
    float _663 = fma(_653, _557, _557);
    int _665 = abs(_657);
    float _667 = _659 * (-2.0);
    float _669 = fma(_625, _653, _625);
    float _671 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[196].x, _663);
    float _673 = fma(_477, _667, _477);
    float _675 = _459 + (-0.5);
    float _677 = fma(_669, _641, _671);
    float _679 = fma(_667, _559, _559);
    float _681 = float(_665);
    float _683 = in.m_66.x;
    float _685 = in.m_66.y;
    float _687 = _677 * 0.15915493667125701904296875;
    float _689 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[196].y, _679);
    float _691 = in.m_46.x;
    float _693 = in.m_46.y;
    float _695 = in.m_46.z;
    float _697 = _681 * _661;
    float _699 = _451 + _457;
    float _701 = _451 + (-0.5);
    float _703 = fma(_673, _641, _689);
    float _705 = _697 * (-2.0);
    float _707 = _699 + (-1.0);
    float _709 = _687 * 6.283185482025146484375;
    float _711 = cos(_709);
    float _713 = _703 * 0.15915493667125701904296875;
    float _715 = fma(_705, _561, _561);
    float _717 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _719 = as_type<int>(_645) & 1;
    bool _721 = _719 != 0;
    int _723 = as_type<int>(_645) & 2;
    bool _725 = _723 != 0;
    float _727 = in.m_68.y;
    float _729 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[196].z, _715);
    float _731 = fma(_717, _705, _717);
    float _733 = _713 * 6.283185482025146484375;
    float _735 = sin(_733);
    float _737 = fma(_731, _641, _729);
    float _739 = _419 * _685;
    bool _741 = !_725;
    float _743 = _741 ? (-0.5) : 0.5;
    float _745 = _737 * 0.15915493667125701904296875;
    float _747 = _713 * 6.283185482025146484375;
    float _749 = cos(_747);
    float _751 = _169 * _693;
    float _753 = _175 * _693;
    bool _755 = !_721;
    float _757 = _755 ? (-0.5) : 0.5;
    float _759 = _417 * _683;
    float _761 = fma(_167, _691, _751);
    float _763 = fma(_173, _691, _753);
    float _765 = _739 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _767 = _687 * 6.283185482025146484375;
    float _769 = sin(_767);
    float _771 = fma(_171, _695, _761);
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _743);
    float _775 = in.m_55.w;
    float _777 = fma(_177, _695, _763);
    float _779 = _711 * _735;
    float _781 = _759 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _757);
    float _785 = _745 * 6.283185482025146484375;
    float _787 = cos(_785);
    float _789 = _711 * _749;
    float _791 = _765 * _773;
    float _793 = in.m_57.w;
    float _795 = _781 * _783;
    float _797 = _693 + _727;
    bool _799 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _801 = isnan(0.5);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _807 = _803 || _805;
    float _809 = _745 * 6.283185482025146484375;
    float _811 = sin(_809);
    float _813 = _769 * _735;
    float _815 = _769 * _749;
    bool _817 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _819 = isnan(0.5);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _825 = _821 || _823;
    float _827 = _711 * _787;
    float _829 = _769 * _787;
    float _831 = _749 * _787;
    float _833 = _735 * _787;
    float _835 = _827 * _791;
    float _837 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _839 = _829 * _791;
    float _841 = fma(_811, _789, _813);
    float _843 = -_779;
    float _845 = fma(_811, _815, _843);
    float _847 = -_815;
    float _849 = fma(_811, _779, _847);
    float _851 = -_791;
    float _853 = _811 * _851;
    float _855 = fma(_841, _795, _835);
    float _857 = fma(_811, _813, _789);
    float _859 = _771 + _775;
    float _861 = fma(_831, _795, _853);
    float _863 = fma(_849, _837, _855);
    float _865 = fma(_845, _795, _839);
    float _867 = _777 + _793;
    float _869 = fma(_833, _837, _861);
    float _871 = _863 * _305;
    float _873 = fma(_857, _837, _865);
    float _875 = _797 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _877 = _863 * _301;
    float _879 = fma(_869, _273, _871);
    float _881 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[11].x, _875);
    float _883 = fma(_869, _269, _877);
    float _885 = fma(_873, _317, _879);
    float _887 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[11].z, _881);
    float _889 = fma(_873, _313, _883);
    float _891 = _867 + _885;
    float _893 = _797 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _895 = _887 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _897 = _859 + _889;
    float _899 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _901 = _891 + _899;
    float _903 = fma(_859, (*spvDescriptorSet0.vp_c8)._m0[10].x, _893);
    float _905 = 1.0 / _895;
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _909 = _897 + _907;
    float _911 = _901 * _901;
    float _913 = fma(_867, (*spvDescriptorSet0.vp_c8)._m0[10].z, _903);
    float _915 = fma(_909, _909, _911);
    float _917 = _913 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _919 = sqrt(_915);
    float _921 = _917 + _895;
    float _923 = _921 * _905;
    float _925 = _923 * 0.5;
    float _927 = _863 * _297;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _931 = fma(_925, (*spvDescriptorSet0.vp_c8)._m0[30].w, _929);
    float _933 = fma(_869, _265, _927);
    float _935 = 1.0 / _931;
    float _937 = fma(_873, _309, _933);
    bool _939 = _919 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _941 = _797 + _937;
    float _943 = _673;
    float _945 = _897;
    float _947 = _891;
    float _949 = _931;
    float _951 = _937;
    float _953 = _727;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    float _957 = _941;
    float _959 = _859;
    if (!_939)
    {
        _943 = _941;
    }
    float _961 = _943;
    bool _963 = !_939;
    float _965 = _961;
    if (!_963)
    {
        float _967 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _969 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _971 = _919 + _969;
        float _973 = rsqrt(_915);
        float _975 = _971 * _967;
        float _977 = _941 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _979 = _975 * 0.15915493667125701904296875;
        float _981 = _979 * 6.283185482025146484375;
        float _983 = cos(_981);
        float _985 = _979 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = _983 + (-1.0);
        float _991 = _989 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _993 = fma(_987, _977, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _995 = fma(_941, _983, _991);
        float _997 = _973 * _993;
        float _999 = fma(_909, _997, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1001 = fma(_901, _997, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _965 = _995;
        _945 = _999;
        _947 = _1001;
        _949 = _979;
        _951 = _973;
    }
    float _1003 = _965;
    float _1005 = _945;
    float _1007 = _947;
    float _1009 = _949;
    float _1011 = _951;
    float _1013 = _1003;
    float _1015 = _1005;
    float _1017 = _1007;
    float _1019 = _1011;
    if (_825)
    {
        _953 = 1.0;
    }
    float _1021 = _953;
    float _1023 = _1021;
    if (!_807)
    {
        float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1027 = _797 + _1025;
        float _1029 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1031 = _859 + _1029;
        float _1033 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1035 = -_797;
        float _1037 = _1035 + _1003;
        float _1039 = _1027 * _1027;
        float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1043 = _867 + _1041;
        float _1045 = -_859;
        float _1047 = _1045 + _1005;
        float _1049 = -_867;
        float _1051 = _1049 + _1007;
        float _1053 = fma(_1031, _1031, _1039);
        float _1055 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1057 = fma(_1043, _1043, _1053);
        float _1059 = sqrt(_1057);
        float _1061 = _1033 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1063 = precise::min(_1059, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1065 = _1063 * _1055;
        float _1067 = _1061 * _1065;
        float _1069 = fma(_1037, _1067, _797);
        float _1071 = fma(_1047, _1067, _859);
        float _1073 = fma(_1051, _1067, _867);
        _1013 = _1069;
        _1015 = _1071;
        _1017 = _1073;
    }
    float _1075 = _1013;
    float _1077 = _1015;
    float _1079 = _1017;
    if (_825)
    {
        _955 = 1.0;
    }
    float _1081 = _955;
    float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1085 = _935 * _1083;
    float _1087 = _1081;
    if (!_825)
    {
        float _1089 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1091 = _1089 * 0.15915493667125701904296875;
        float _1093 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1095 = _1091 * 6.283185482025146484375;
        float _1097 = cos(_1095);
        float _1099 = _1093 * 0.15915493667125701904296875;
        float _1101 = _1091 * 6.283185482025146484375;
        float _1103 = sin(_1101);
        float _1105 = 1.0 / _1097;
        float _1107 = _1099 * 6.283185482025146484375;
        float _1109 = cos(_1107);
        float _1111 = _1103 * _1105;
        float _1113 = _1099 * 6.283185482025146484375;
        float _1115 = sin(_1113);
        float _1117 = _1109 * _1111;
        float _1119 = 1.0 / _1117;
        float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1123 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1121;
        float _1125 = 1.0 / _1123;
        float _1127 = _1115 * _1119;
        float _1129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1131 = fma(_1085, _1127, _1129);
        float _1133 = _1131 * _1125;
        float _1135 = precise::clamp(_1133, 0.0, 1.0);
        _1019 = _1091;
        _1023 = _1135;
    }
    float _1137 = _1019;
    float _1139 = _1023;
    if (!_825)
    {
        float _1141 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1143 = _1141 * 0.15915493667125701904296875;
        float _1145 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1147 = _1143 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = _1145 * 0.15915493667125701904296875;
        float _1153 = _1143 * 6.283185482025146484375;
        float _1155 = sin(_1153);
        float _1157 = 1.0 / _1149;
        float _1159 = _1151 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        float _1163 = _1155 * _1157;
        float _1165 = _1151 * 6.283185482025146484375;
        float _1167 = sin(_1165);
        float _1169 = _1161 * _1163;
        float _1171 = 1.0 / _1169;
        float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1175 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1173;
        float _1177 = 1.0 / _1175;
        float _1179 = _1167 * _1171;
        float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1183 = fma(_1085, _1179, _1181);
        float _1185 = _1183 * _1177;
        float _1187 = precise::clamp(_1185, 0.0, 1.0);
        float _1189 = -_1187;
        float _1191 = _1189 + 1.0;
        _1087 = _1191;
    }
    float _1193 = _1087;
    float _1195 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1197 = _1075 + _1195;
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1201 = _1077 + _1199;
    float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1205 = _1079 + _1203;
    float _1207 = _1197 * _1197;
    float _1209 = fma(_1201, _1201, _1207);
    float _1211 = fma(_1205, _1205, _1209);
    float _1213 = rsqrt(_1211);
    float _1215 = sqrt(_1211);
    float _1217 = _1213 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1219 = _1201 * _1217;
    float _1221 = _1205 * _1217;
    float _1223 = _1219 * _1219;
    float _1225 = _1221 * _1221;
    float _1227 = _1223 + _1225;
    float _1229 = sqrt(_1227);
    bool _1231 = _1229 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1235 = _1229 + _1233;
    float _1237 = _873;
    float _1239 = _1227;
    float _1241 = _1235;
    float _1243 = _1197;
    float _1245 = _1219;
    float _1247 = _1221;
    float _1249 = _1223;
    if (_1231)
    {
        float _1251 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1237 = _1251;
    }
    float _1253 = _1237;
    if (_1231)
    {
        float _1255 = rsqrt(_1227);
        _1239 = _1255;
    }
    float _1257 = _1239;
    float _1259 = _1257;
    if (_1231)
    {
        float _1261 = _1235 * _1253;
        _1241 = _1261;
    }
    float _1263 = _1241;
    if (_1231)
    {
        float _1265 = _1263 * 0.15915493667125701904296875;
        _957 = _1265;
    }
    float _1267 = _957;
    float _1269 = _1009;
    if (_1231)
    {
        float _1271 = _1267 * 6.283185482025146484375;
        float _1273 = sin(_1271);
        _1269 = _1273;
    }
    float _1275 = _1269;
    float _1277 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1279 = precise::max(0.0, _1277);
    float _1281 = _1137;
    float _1283 = _1279;
    if (_1231)
    {
        float _1285 = _1267 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        _1281 = _1287;
    }
    float _1289 = _1281;
    float _1291 = -_1217;
    float _1293 = -_1279;
    float _1295 = fma(_1197, _1291, _1293);
    if (_1231)
    {
        float _1297 = _1295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1243 = _1297;
    }
    float _1299 = _1243;
    float _1301 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1303 = _1275;
    if (_1231)
    {
        float _1305 = fma(_1275, _1299, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1303 = _1305;
    }
    float _1307 = _1303;
    float _1309 = fma(_859, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1311 = _1307;
    if (!_1231)
    {
        _959 = _1295;
    }
    float _1313 = _959;
    float _1315 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1301);
    float _1317 = _1313;
    if (_1231)
    {
        float _1319 = _1289 + (-1.0);
        _1283 = _1319;
    }
    float _1321 = _1283;
    float _1323 = _1321;
    if (_1231)
    {
        float _1325 = _1257 * _1307;
        _1311 = _1325;
    }
    float _1327 = _1311;
    float _1329 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1315);
    if (_1231)
    {
        float _1331 = _1321 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1259 = _1331;
    }
    float _1333 = _1259;
    if (_1231)
    {
        float _1335 = _1219 * _1327;
        _1245 = _1335;
    }
    float _1337 = _1245;
    if (_1231)
    {
        float _1339 = _1221 * _1327;
        _1247 = _1339;
    }
    float _1341 = _1247;
    if (!_1231)
    {
        _1323 = _1225;
    }
    float _1343 = _1323;
    float _1345 = _1343;
    if (_1231)
    {
        float _1347 = fma(_1295, _1289, _1333);
        _1317 = _1347;
    }
    float _1349 = _1317;
    if (_1231)
    {
        float _1351 = _1337 * _1337;
        _1249 = _1351;
    }
    float _1353 = _1249;
    if (_1231)
    {
        float _1355 = _1341 * _1341;
        _1345 = _1355;
    }
    float _1357 = _1345;
    float _1359 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1361 = fma(_1349, _1349, _1353);
    float _1363 = floor(_1309);
    float _1365 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1359);
    float _1367 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1369 = _1361 + _1357;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1373 = fma(_1215, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1371);
    float _1375 = precise::clamp(_1373, 0.0, 1.0);
    float _1377 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1365);
    float _1379 = rsqrt(_1369);
    float _1381 = -_1375;
    float _1383 = _1381 + 1.0;
    float _1385 = fma(_867, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1387 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1389 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1391 = _1075 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1393 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1395 = abs(_1383);
    float _1397 = log2(_1395);
    float _1399 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1387);
    float _1401 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1391);
    float _1403 = _1389 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1405 = -_1363;
    float _1407 = _1309 + _1405;
    float _1409 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1401);
    float _1411 = -_1403;
    float _1413 = fma(_1411, _1393, 1.0);
    float _1415 = _1379 * _1349;
    float _1417 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1399);
    float _1419 = _1379 * _1337;
    float _1421 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1423 = _1379 * _1341;
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1427 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1429 = floor(_1385);
    float _1431 = _1425 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1433 = -_1427;
    float _1435 = fma(_1415, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1433);
    float _1437 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1439 = _1425 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1441 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1431);
    float _1443 = -_1423;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1435);
    float _1447 = log2(_1413);
    float _1449 = _1425 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1451 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1441);
    float _1453 = fma(_1445, 0.5, 0.5);
    float _1455 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1439);
    float _1457 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1449);
    float _1459 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1451);
    float _1461 = fma(_1453, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1463 = exp2(_1437);
    float _1465 = fma(_1445, -0.5, 0.5);
    float _1467 = -_1429;
    float _1469 = _1385 + _1467;
    float _1471 = _1415 + 1.0;
    float _1473 = fma(_1453, _1461, -0.212114393711090087890625);
    float _1475 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1457);
    float _1477 = 1.0 / _1459;
    float _1479 = sqrt(_1465);
    float _1481 = -_1415;
    float _1483 = fma(_1463, _1471, _1481);
    float _1485 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1475);
    float _1487 = _1447 * 0.693147182464599609375;
    float2 _4354 = float2(_1407, _1469);
    float _1489 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4354, float2(0.0), isnan(_4354)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4354, float2(0.0), isnan(_4354)), level(0.0)).x;
    float _1491 = fma(_1453, _1473, 1.570728778839111328125);
    float _1493 = fma(_1483, 0.5, 0.5);
    float _1495 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1497 = _1485 * _1477;
    float _1499 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1455);
    float _1501 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1499);
    float _1503 = _1479 * 0.636619746685028076171875;
    float _1505 = _1501 * _1477;
    float _1507 = fma(_1497, 0.5, 0.5);
    float _1509 = -_1491;
    float _1511 = fma(_1503, _1509, 1.0);
    float _1513 = fma(_1505, -0.5, 0.5);
    float3 _4403 = float3(_1507, _1513, _1495);
    float _1515 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4403, float3(0.0), isnan(_4403)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4403, float3(0.0), isnan(_4403)), level(0.0)).x;
    float3 _4414 = float3(_1507, _1513, _1495);
    float4 _1518 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4414, float3(0.0), isnan(_4414)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4414, float3(0.0), isnan(_4414)), level(0.0)).xyzw;
    float _1520 = _1518.x;
    float _1522 = _1518.y;
    float _1524 = _1518.z;
    float _1526 = _1518.w;
    float2 _4430 = float2(_1511, _1493);
    float3 _1530 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4430, float2(0.0), isnan(_4430)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4430, float2(0.0), isnan(_4430)), level(0.0)).xyz;
    float _1532 = _1530.x;
    float _1534 = _1530.y;
    float _1536 = _1530.z;
    float _1538 = _1397 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1540 = _1425 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1544 = _1542 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1548 = _1546 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1550 = _459 > 0.5;
    float _1552 = exp2(_1538);
    float _1554 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1540);
    bool _1556 = _457 > 0.5;
    float _1558 = 1.0 / _1544;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1560;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1568 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1570 = isnan(_449);
    bool _1572 = _1568 || _1570;
    bool _1574 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1576 = _1572 || _1574;
    float _1578 = float(_1576);
    float _1580 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1554);
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1584 = _1582 != 0;
    int _1586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1588 = _1586 != 0;
    float _1590 = 1.0 / _1548;
    float _1592 = -_1578;
    float _1594 = _1592 + 1.0;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1598 = _1596 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1600 = -_1552;
    float _1602 = _1600 + 1.0;
    bool _1604 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1606 = isnan(_449);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1580);
    float _1618 = _1562 * _1558;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1622 = _449 + _1620;
    float _1624 = 1.0 / _1566;
    float _1626 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1626;
    float _1630 = -_1614;
    float _1632 = _1630 + 1.0;
    float _1634 = fma(_1618, _1622, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1636 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1638 = isnan(_449);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1644 = _1640 || _1642;
    float _1646 = float(_1644);
    float _1648 = _1602 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1650 = _1598 * _1590;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1654 = _449 + _1652;
    float _1656 = _1578 * _1632;
    float _1658 = _1646 * _1594;
    float _1660 = -_1646;
    float _1662 = _1660 + 1.0;
    bool _1664 = _449 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1666 = isnan(_449);
    bool _1668 = _1664 || _1666;
    bool _1670 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1672 = _1668 || _1670;
    float _1674 = float(_1672);
    float _1676 = fma(_1650, _1654, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1678 = _1634 * _1658;
    float _1680 = -_743;
    int _1682 = _1550 ? as_type<int>(_1680) : as_type<int>(_743);
    float _1684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1686 = -_1674;
    float _1688 = _1686 + 1.0;
    float _1690 = fma(_1662, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1678);
    float _1692 = -_757;
    int _1694 = _1556 ? as_type<int>(_1692) : as_type<int>(_757);
    float _1696 = _1628 * _1624;
    float _1698 = _1614 * _1688;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1702 = _449 + _1700;
    bool _1704 = !_1584;
    float _1706 = _1704 ? _757 : as_type<float>(_1694);
    float _1708 = abs(_1085);
    float _1710 = log2(_1708);
    bool _1712 = !_1588;
    float _1714 = _1712 ? _743 : as_type<float>(_1682);
    float _1716 = fma(_1696, _1702, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1718 = fma(_1676, _1656, _1690);
    float _1720 = _1706 + 0.5;
    float _1722 = _757 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1724 = -_1714;
    float _1726 = _1724 + 0.5;
    float _1728 = fma(_1716, _1698, _1718);
    float _1730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1732 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1734 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1736 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1728);
    float _1738 = _1732 * _1684;
    float _1740 = _1736 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1742 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.gl_Position.x = _1485;
    out.gl_Position.y = _1501;
    out.gl_Position.z = _1616;
    out.gl_Position.w = _1459;
    float _1748 = exp2(_1742);
    float _1750 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1734 * _1730;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_70.x = _1738;
    out.m_70.y = _1752;
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1760 = _1758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1762 = _743 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1768 = fma(_1748, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1770 = precise::clamp(_1768, 0.0, 1.0);
    float _1772 = -_1762;
    float _1774 = _811 * _1772;
    out.m_72.x = _1750;
    out.m_72.y = _1754;
    out.m_72.z = _1760;
    out.m_72.w = _1756;
    float _1776 = _827 * _1762;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1780 = fma(_831, _1722, _1774);
    float _1782 = fma(_841, _1722, _1776);
    float _1784 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1786 = _1766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = in.m_68.x;
    float _1792 = _849 + _1782;
    float _1794 = _829 * _1762;
    bool _1796 = _1085 <= 8000.0;
    bool _1798 = isnan(_1085);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan(8000.0);
    bool _1804 = _1800 || _1802;
    float _1806 = float(_1804);
    out.m_74.x = _1784;
    out.m_74.y = _1786;
    out.m_74.z = _1788;
    out.m_74.w = _1740;
    float _1808 = fma(_1770, -2.0, 3.0);
    float _1810 = _1770 * _1770;
    float _1812 = _1792 * _301;
    float _1814 = fma(_845, _1722, _1794);
    float _1816 = _833 + _1780;
    float _1818 = _1810 * _1808;
    bool _1820 = _1215 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1822 = isnan(_1215);
    bool _1824 = _1820 || _1822;
    bool _1826 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1828 = _1824 || _1826;
    float _1830 = _857 + _1814;
    float _1832 = _1616 + _1459;
    float _1834 = -_1818;
    float _1836 = _1834 + 1.0;
    float _1838 = _1832 * 0.5;
    float _1840 = fma(_1836, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1818);
    float _1842 = _1792 * _297;
    float _1844 = _1792 * _305;
    float _1846 = _1459 * 0.5;
    float _1848 = _1806 * _1840;
    float _1850 = _1485 + _1459;
    float _1852 = fma(_1816, _273, _1844);
    float _1854 = fma(_1501, -0.5, _1846);
    float _1856 = _1848 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1858 = fma(_1816, _265, _1842);
    float _1860 = fma(_1830, _317, _1852);
    float _1862 = fma(_1816, _269, _1812);
    float _1864 = fma(_1830, _309, _1858);
    float _1866 = _1850 * 0.5;
    float _1868 = _1459;
    float _1870 = _1616;
    float _1872 = _1501;
    float _1874 = _1854;
    float _1876 = _1866;
    if (!_1828)
    {
        _1868 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1878 = _1868;
    float _1880 = fma(_1830, _313, _1862);
    float _1882 = _1878;
    float _1884 = _1878;
    if (!_1828)
    {
        _1870 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1886 = _1870;
    out.m_76.x = _1866;
    out.m_76.y = _1854;
    out.m_76.z = _1838;
    out.m_76.w = _1459;
    float _1888 = _1886;
    float _1890 = _1886;
    if (!_1828)
    {
        _1872 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1892 = _1872;
    out.m_78.x = _1880;
    out.m_78.y = _1864;
    out.m_78.z = _1860;
    float _1894 = _1892;
    float _1896 = _1892;
    if (!_1828)
    {
        _1874 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1898 = _1874;
    float _1900 = _1898;
    float _1902 = _1898;
    if (!_1828)
    {
        _1876 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1904 = _1876;
    float _1906 = -_1489;
    float _1908 = _1906 + 1.0;
    float _1910 = _1908 * _1856;
    float _1912 = precise::clamp(_1910, 0.0, 1.0);
    float _1914 = -_1912;
    float _1916 = fma(_1914, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1918 = _1916 * _1790;
    float _1920 = _1918 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1922 = _1648 * _1515;
    float _1924 = -_1648;
    float _1926 = _1924 + 1.0;
    out.m_80.x = _1920;
    float _1928 = _1526 * _1922;
    float _1930 = _1536 * _1922;
    float _1932 = _1526 * _1926;
    float _1934 = fma(_1532, _1928, _1520);
    float _1936 = fma(_1534, _1928, _1522);
    float _1938 = fma(_1526, _1930, _1524);
    float _1940 = _1139 * _1193;
    out.m_82.x = _1934;
    out.m_82.y = _1936;
    out.m_82.z = _1938;
    out.m_82.w = _1932;
    float _1942 = _1940 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1944 = _1940;
    float _1946 = _1904;
    float _1948 = _1904;
    if (!_1828)
    {
        _1944 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1950 = _1944;
    bool _1952 = !_1828;
    float _1954 = _1950;
    float _1956 = _1950;
    if (!_1952)
    {
        bool _1958 = _1215 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1960 = isnan(_1215);
        bool _1962 = _1958 || _1960;
        bool _1964 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1966 = _1962 || _1964;
        if (!_1966)
        {
            float _1968 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1970 = _1215 + _1968;
            float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1974 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1972;
            float _1976 = 1.0 / _1974;
            float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1980 = _1978 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1982 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1984 = _1982 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1986 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1988 = _1986 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1992 = _1990 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1996 = _1994 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1998 = _1970 * _1976;
            float _2000 = precise::clamp(_1998, 0.0, 1.0);
            float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2004 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2006 = fma(_2000, _1980, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2008 = fma(_2000, _2004, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2010 = fma(_2000, _1984, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2012 = fma(_2000, _1988, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2014 = fma(_2000, _1992, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2016 = fma(_2000, _1996, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1948 = _2008;
            _1896 = _2014;
            _1902 = _2006;
            _1890 = _2012;
            _1884 = _2010;
            _1956 = _2016;
            _2018 = true;
        }
        else
        {
            bool _2020 = _1215 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2022 = isnan(_1215);
            bool _2024 = _2020 || _2022;
            bool _2026 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2028 = _2024 || _2026;
            if (!_2028)
            {
                _1900 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2030 = _1900;
            _1902 = _2030;
            if (!_2028)
            {
                _1946 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2032 = _1946;
            _1948 = _2032;
            if (!_2028)
            {
                _1882 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2034 = _1882;
            _1884 = _2034;
            if (!_2028)
            {
                _1888 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2036 = _1888;
            _1890 = _2036;
            if (!_2028)
            {
                _1894 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2038 = _1894;
            _1896 = _2038;
            if (!_2028)
            {
                _1954 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2040 = _1954;
            bool _2042 = !_2028;
            _1956 = _2040;
            if (!_2042)
            {
                bool _2044 = _1215 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2046 = isnan(_1215);
                bool _2048 = _2044 || _2046;
                bool _2050 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2052 = _2048 || _2050;
                if (!_2052)
                {
                    float _2054 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2056 = _1215 + _2054;
                    float _2058 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2060 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2058;
                    float _2062 = 1.0 / _2060;
                    float _2064 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2066 = _2064 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2068 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2070 = _2068 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2072 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2074 = _2072 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2078 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2082 = _2080 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2084 = _2056 * _2062;
                    float _2086 = precise::clamp(_2084, 0.0, 1.0);
                    float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2090 = _2088 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2092 = fma(_2086, _2066, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2094 = fma(_2086, _2090, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2096 = fma(_2086, _2070, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2098 = fma(_2086, _2074, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2100 = fma(_2086, _2078, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2102 = fma(_2086, _2082, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1948 = _2094;
                    _1896 = _2100;
                    _1902 = _2092;
                    _1890 = _2098;
                    _1884 = _2096;
                    _1956 = _2102;
                    _2018 = true;
                }
                else
                {
                    _1948 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1896 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1902 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1890 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1884 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1956 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2018 = false;
    float _2104 = _1948;
    float _2106 = _1896;
    float _2108 = _1902;
    float _2110 = _1890;
    float _2112 = _1884;
    float _2114 = _1956;
    float _2116 = fma(_1864, -0.5, 0.5);
    float _2118 = precise::clamp(_2116, 0.0, 1.0);
    float _2120 = -_2104;
    float _2122 = _2120 + _2106;
    float _2124 = -_2108;
    float _2126 = _2124 + _2110;
    out.m_84.x = 0.0;
    float _2128 = fma(_2118, _2122, _2104);
    float _2130 = -_2112;
    float _2132 = _2130 + _2114;
    float _2134 = fma(_2118, _2126, _2108);
    float _2136 = _2128 * 0.586610972881317138671875;
    bool _2138 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2140 = fma(_2118, _2132, _2112);
    float _2142 = _1942 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2144 = fma(_2134, 0.298911988735198974609375, _2136);
    bool _2146 = _1139 > 0.0;
    bool _2148 = isnan(_1139);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan(0.0);
    bool _2154 = _2150 || _2152;
    float _2156 = fma(_2140, 0.114477999508380889892578125, _2144);
    out.m_49.x = _2142;
    bool _2158 = _1193 <= 0.0;
    bool _2160 = !_2154;
    bool _2162 = _2158 || _2160;
    float _2164 = -_2156;
    float _2166 = _2134 + _2164;
    float _2168 = -_2156;
    float _2170 = _2128 + _2168;
    float _2172 = -_2156;
    float _2174 = _2140 + _2172;
    float _2176 = fma(_2166, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    float _2178 = fma(_2170, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    float _2180 = fma(_2174, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2156);
    bool _2182 = !_2138;
    if (!_2182)
    {
        float _2184 = -_1075;
        float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2188 = -_1077;
        float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2192 = -_1079;
        float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2196 = _2186 * _2186;
        float _2198 = fma(_2190, _2190, _2196);
        float _2200 = fma(_2194, _2194, _2198);
        float _2202 = sqrt(_2200);
        float _2204 = rsqrt(_2200);
        float _2206 = -_2202;
        float _2208 = _2206 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2210 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2212 = precise::clamp(_2210, 0.0, 1.0);
        float _2214 = _2190 * _2204;
        float _2216 = _2186 * _2204;
        float _2218 = abs(_2212);
        float _2220 = log2(_2218);
        float _2222 = _2194 * _2204;
        float _2224 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2226 = _1864 * _2216;
        float _2228 = -_2216;
        float _2230 = -_2224;
        float _2232 = fma(_2228, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2230);
        float _2234 = fma(_1880, _2214, _2226);
        float _2236 = -_2222;
        float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2232);
        float _2240 = fma(_1860, _2222, _2234);
        float _2242 = precise::clamp(_2240, 0.0, 1.0);
        float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2246 = _2238 + _2244;
        float _2248 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2250 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2252 = precise::clamp(_2250, 0.0, 1.0);
        float _2254 = exp2(_2248);
        float _2256 = _2254 * _2252;
        float _2258 = _2242 * _2256;
        float _2260 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2262 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2264 = _2258 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2260;
        out.m_84.y = _2262;
        out.m_84.z = _2264;
    }
    out.m_86.x = _2176;
    out.m_86.y = _2178;
    out.m_86.z = _2180;
    if (!_2162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2266 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2266;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

