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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_54 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_52 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
    float4 m_47 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
    float4 m_62 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _333 = false;
    bool _231 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1413 = as_type<float>(_107);
        out.gl_Position.z = _1413;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1482 = as_type<float>(_143);
        out.gl_Position.z = _1482;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_52.x;
    float _149 = in.m_52.y;
    float _151 = in.m_52.z;
    float _153 = in.m_54.x;
    float _155 = in.m_54.y;
    float _157 = in.m_54.z;
    float _159 = in.m_56.x;
    float _161 = in.m_56.y;
    float _163 = in.m_56.z;
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    int _171 = as_type<int>(_145) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_145) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _149 * _155;
    float _183 = _149 * _161;
    float _185 = fma(_147, _153, _181);
    float _187 = _149 * _167;
    float _189 = fma(_147, _159, _183);
    float _191 = fma(_151, _157, _185);
    float _193 = fma(_147, _165, _187);
    float _195 = fma(_151, _163, _189);
    bool _197 = !_173;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_151, _169, _193);
    bool _203 = !_177;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_179;
    float _209 = _191;
    float _211 = _195;
    float _229;
    if (!_207)
    {
        float _213 = in.m_60.x;
        float _215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _221 = _219 * _215;
        float _223 = floor(_221);
        float _225 = -_223;
        float _227 = _221 + _225;
        _229 = _227;
        _231 = true;
    }
    else
    {
        float _233 = float(_91);
        float _235 = 1.0 / _233;
        float _237 = _125 * _235;
        _229 = _237;
    }
    _231 = false;
    float _239 = _229;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _239 + _241;
    bool _245 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _247 = isnan(_239);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -_255;
    float _263 = _261 + 1.0;
    bool _265 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _267 = isnan(_239);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _283 = 1.0 / _259;
    float _285 = _275 * _263;
    float _287 = -_275;
    float _289 = _287 + 1.0;
    float _291 = _243 * _283;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _293;
    float _297 = fma(_279, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _299 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _301 = _297 * _285;
    float _303 = _299 * _285;
    float _305 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].x, _301);
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _309 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    bool _313 = !_281;
    float _331;
    if (!_313)
    {
        float _315 = in.m_60.x;
        float _317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _319 = _315 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _323 = _321 * _317;
        float _325 = floor(_323);
        float _327 = -_325;
        float _329 = _323 + _327;
        _331 = _329;
        _333 = true;
    }
    else
    {
        float _335 = float(_91);
        float _337 = 1.0 / _335;
        float _339 = _125 * _337;
        _331 = _339;
    }
    _333 = false;
    float _341 = _331;
    float _343 = in.m_62.x;
    float _345 = in.m_62.y;
    float _347 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _349 = in.m_42.x;
    float _351 = in.m_42.y;
    float _353 = in.m_42.z;
    float _355 = in.m_58.w;
    float _357 = in.m_54.w;
    float _359 = _311 * _345;
    float _361 = _309 * _343;
    float _363 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _365 = _359 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _367 = _361 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _369 = _167 * _351;
    float _371 = _155 * _351;
    float _373 = _365 * _347;
    float _375 = _367 * _363;
    float _377 = fma(_165, _349, _369);
    float _379 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _381 = _373 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _383 = _373 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _385 = fma(_153, _349, _371);
    float _387 = fma(_169, _353, _377);
    float _389 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[26].x, _381);
    float _391 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[24].x, _383);
    float _393 = fma(_157, _353, _385);
    float _395 = _161 * _351;
    float _397 = fma(_379, (*spvDescriptorSet0.vp_c8)._m0[26].z, _389);
    float _399 = _387 + _355;
    float _401 = fma(_379, (*spvDescriptorSet0.vp_c8)._m0[24].z, _391);
    float _403 = _393 + _357;
    float _405 = _397 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _407 = _373 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _409 = _401 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _411 = fma(_159, _349, _395);
    float _413 = _399 + _405;
    float _415 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[25].x, _407);
    float _417 = _403 + _409;
    float _419 = fma(_163, _353, _411);
    float _421 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _423 = _413 + _421;
    float _425 = fma(_379, (*spvDescriptorSet0.vp_c8)._m0[25].z, _415);
    float _427 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _429 = _417 + _427;
    float _431 = _423 * _423;
    float _433 = _425 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _435 = fma(_429, _429, _431);
    float _437 = in.m_56.w;
    float _439 = sqrt(_435);
    bool _441 = _439 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _443 = _419 + _437;
    float _445 = _443 + _433;
    float _447 = _419;
    float _449 = _437;
    float _451 = _417;
    float _453 = _423;
    if (!_441)
    {
        _447 = _413;
    }
    float _455 = _447;
    float _457 = _455;
    if (!_441)
    {
        _449 = _445;
    }
    float _459 = _449;
    bool _461 = !_441;
    float _463 = _459;
    if (!_461)
    {
        float _465 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _467 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _469 = _439 + _467;
        float _471 = rsqrt(_435);
        float _473 = _469 * _465;
        float _475 = _445 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _477 = _473 * 0.15915493667125701904296875;
        float _479 = _477 * 6.283185482025146484375;
        float _481 = cos(_479);
        float _483 = _477 * 6.283185482025146484375;
        float _485 = sin(_483);
        float _487 = _481 + (-1.0);
        float _489 = fma(_485, _475, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _491 = _487 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _493 = _471 * _489;
        float _495 = fma(_445, _481, _491);
        float _497 = fma(_429, _493, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _499 = fma(_423, _493, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _463 = _495;
        _451 = _497;
        _457 = _499;
    }
    float _501 = _463;
    float _503 = _451;
    float _505 = _457;
    float _507 = -_443;
    float _509 = _507 + _501;
    float _511 = -_403;
    float _513 = _511 + _503;
    float _515 = -_399;
    float _517 = _515 + _505;
    float _519 = _509 * _509;
    bool _521 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _523 = isnan(0.5);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _529 = _525 || _527;
    float _531 = fma(_513, _513, _519);
    float _533 = fma(_517, _517, _531);
    float _535 = sqrt(_533);
    bool _537 = _535 > 0.0;
    bool _539 = !_537;
    float _541 = _503;
    float _543 = _501;
    float _545 = _505;
    float _547 = _517;
    if (!_539)
    {
        float _549 = _195 * _195;
        float _551 = fma(_191, _191, _549);
        float _553 = fma(_201, _201, _551);
        float _555 = rsqrt(_533);
        float _557 = sqrt(_553);
        float _559 = _513 * _555;
        float _561 = _509 * _555;
        float _563 = _517 * _555;
        bool _565 = _557 > 0.0;
        bool _567 = !_565;
        _453 = _559;
        if (!_567)
        {
            float _569 = rsqrt(_553);
            float _571 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _573 = _195 * _569;
            float _575 = _191 * _569;
            float _577 = _561 * _573;
            float _579 = _201 * _569;
            float _581 = fma(_559, _575, _577);
            float _583 = _571 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _585 = fma(_563, _579, _581);
            float _587 = _585 * _583;
            float _589 = fma(_191, _587, _503);
            float _591 = fma(_195, _587, _501);
            float _593 = fma(_201, _587, _505);
            _541 = _589;
            _543 = _591;
            _545 = _593;
        }
    }
    float _595 = _541;
    float _597 = _543;
    float _599 = _545;
    float _601 = _453;
    float _603 = _597;
    float _605 = _599;
    if (_529)
    {
        _209 = _595;
    }
    float _607 = _209;
    float _609 = _607;
    if (!_529)
    {
        float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _613 = _443 + _611;
        float _615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _617 = _403 + _615;
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _621 = -_443;
        float _623 = _621 + _597;
        float _625 = _613 * _613;
        float _627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _629 = _399 + _627;
        float _631 = fma(_617, _617, _625);
        float _633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _635 = fma(_629, _629, _631);
        float _637 = sqrt(_635);
        float _639 = _619 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _641 = precise::min(_637, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _643 = _641 * _633;
        float _645 = -_403;
        float _647 = _645 + _595;
        float _649 = _639 * _643;
        float _651 = -_399;
        float _653 = _651 + _599;
        float _655 = fma(_647, _649, _403);
        float _657 = fma(_623, _649, _443);
        float _659 = fma(_653, _649, _399);
        _603 = _657;
        _609 = _655;
        _605 = _659;
    }
    float _661 = _603;
    float _663 = _609;
    float _665 = _605;
    float _667 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _669 = _661 + _667;
    float _671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _673 = _663 + _671;
    float _675 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _677 = _665 + _675;
    float _679 = _669 * _669;
    float _681 = fma(_673, _673, _679);
    float _683 = fma(_677, _677, _681);
    float _685 = rsqrt(_683);
    float _687 = _685 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _689 = _673 * _687;
    float _691 = _677 * _687;
    float _693 = _689 * _689;
    float _695 = _691 * _691;
    float _697 = _693 + _695;
    float _699 = sqrt(_697);
    bool _701 = _699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _705 = _699 + _703;
    float _707 = _677;
    float _709 = _697;
    float _711 = _705;
    float _713 = _689;
    if (_701)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _707 = _715;
    }
    float _717 = _707;
    if (_701)
    {
        float _719 = rsqrt(_697);
        _709 = _719;
    }
    float _721 = _709;
    float _723 = _721;
    if (_701)
    {
        float _725 = _705 * _717;
        _711 = _725;
    }
    float _727 = _711;
    if (_701)
    {
        float _729 = _727 * 0.15915493667125701904296875;
        _211 = _729;
    }
    float _731 = _211;
    float _733 = _685;
    float _735 = _731;
    if (_701)
    {
        float _737 = _731 * 6.283185482025146484375;
        float _739 = sin(_737);
        _733 = _739;
    }
    float _741 = _733;
    float _743 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _745 = precise::max(0.0, _743);
    float _747 = _601;
    float _749 = _745;
    float _751 = _743;
    if (_701)
    {
        float _753 = _731 * 6.283185482025146484375;
        float _755 = cos(_753);
        _747 = _755;
    }
    float _757 = _747;
    float _759 = -_687;
    float _761 = -_745;
    float _763 = fma(_669, _759, _761);
    if (_701)
    {
        float _765 = _763 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _749 = _765;
    }
    float _767 = _749;
    float _769 = sqrt(_683);
    float _771 = _741;
    float _773 = _767;
    if (_701)
    {
        float _775 = fma(_741, _767, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _771 = _775;
    }
    float _777 = _771;
    float _779 = _777;
    if (!_701)
    {
        _773 = _691;
    }
    float _781 = _773;
    float _783 = _781;
    if (_701)
    {
        float _785 = _757 + (-1.0);
        _751 = _785;
    }
    float _787 = _751;
    float _789 = _787;
    if (_701)
    {
        float _791 = _721 * _777;
        _547 = _791;
    }
    float _793 = _547;
    if (!_701)
    {
        _779 = _763;
    }
    float _795 = _779;
    float _797 = _795;
    if (_701)
    {
        float _799 = _787 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _735 = _799;
    }
    float _801 = _735;
    if (_701)
    {
        float _803 = _689 * _793;
        _713 = _803;
    }
    float _805 = _713;
    if (!_701)
    {
        _723 = _693;
    }
    float _807 = _723;
    float _809 = _807;
    if (_701)
    {
        float _811 = _691 * _793;
        _783 = _811;
    }
    float _813 = _783;
    if (_701)
    {
        float _815 = fma(_763, _757, _801);
        _797 = _815;
    }
    float _817 = _797;
    if (_701)
    {
        float _819 = _805 * _805;
        _809 = _819;
    }
    float _821 = _809;
    if (!_701)
    {
        _789 = _695;
    }
    float _823 = _789;
    float _825 = _823;
    if (_701)
    {
        float _827 = _813 * _813;
        _825 = _827;
    }
    float _829 = _825;
    float _831 = fma(_817, _817, _821);
    float _833 = _831 + _829;
    float _835 = _661 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _837 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _839 = fma(_769, (*spvDescriptorSet0.vp_c15)._m0[23].w, _837);
    float _841 = precise::clamp(_839, 0.0, 1.0);
    float _843 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _845 = rsqrt(_833);
    float _847 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[2].x, _835);
    float _849 = _661 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _851 = -_841;
    float _853 = _851 + 1.0;
    float _855 = _661 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _857 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[2].z, _847);
    float _859 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[1].x, _849);
    float _861 = _661 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _863 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[0].x, _855);
    float _865 = _857 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _867 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[1].z, _859);
    float _869 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[3].x, _861);
    float _871 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[0].z, _863);
    float _873 = abs(_853);
    float _875 = log2(_873);
    float _877 = _867 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _879 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[3].z, _869);
    float _881 = _845 * _805;
    float _883 = _871 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _885 = _877 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _887 = _845 * _817;
    float _889 = _881 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _891 = _845 * _813;
    float _893 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[7].x, _885);
    float _895 = _865 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _897 = -_889;
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[21].y, _897);
    float _901 = _879 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _903 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[7].z, _893);
    float _905 = -_895;
    float _907 = fma(_905, _843, 1.0);
    float _909 = -_891;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[21].z, _899);
    float _913 = _875 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].w, _903);
    float _917 = _877 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _919 = fma(_911, -0.5, 0.5);
    float _921 = log2(_907);
    float _923 = _877 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _925 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[4].x, _917);
    float _927 = fma(_911, 0.5, 0.5);
    float _929 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[5].x, _923);
    float _931 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[4].z, _925);
    float _933 = _887 + 1.0;
    float _935 = 1.0 / _915;
    float _937 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[5].z, _929);
    float _939 = fma(_927, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _941 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].w, _931);
    float _943 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].w, _937);
    float _945 = fma(_927, _939, -0.212114393711090087890625);
    float _947 = exp2(_913);
    float _949 = _921 * 0.693147182464599609375;
    float _951 = fma(_927, _945, 1.570728778839111328125);
    float _953 = _949 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _955 = sqrt(_919);
    float _957 = _941 * _935;
    float _959 = _943 * _935;
    float _961 = fma(_957, 0.5, 0.5);
    float _963 = fma(_959, -0.5, 0.5);
    float _965 = -_887;
    float _967 = fma(_947, _933, _965);
    float3 _2794 = float3(_961, _963, _953);
    float _969 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2794, float3(0.0), isnan(_2794)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2794, float3(0.0), isnan(_2794)), level(0.0)).x;
    float _971 = fma(_967, 0.5, 0.5);
    float _973 = _955 * 0.636619746685028076171875;
    float _975 = -_951;
    float _977 = fma(_973, _975, 1.0);
    float3 _2815 = float3(_961, _963, _953);
    float4 _980 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2815, float3(0.0), isnan(_2815)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2815, float3(0.0), isnan(_2815)), level(0.0)).xyzw;
    float _982 = _980.x;
    float _984 = _980.y;
    float _986 = _980.z;
    float _988 = _980.w;
    float2 _2832 = float2(_977, _971);
    float3 _992 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2832, float2(0.0), isnan(_2832)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2832, float2(0.0), isnan(_2832)), level(0.0)).xyz;
    float _994 = _992.x;
    float _996 = _992.y;
    float _998 = _992.z;
    float _1000 = in.m_60.x;
    float _1002 = in.m_60.y;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1012 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1014 = isnan(0.5);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1020 = _1016 || _1018;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1024 = 1.0 / _1006;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1028 = _1026 != 0;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1034 = _1032 != 0;
    float _1036 = 1.0 / _1010;
    float _1038 = _443 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1042 = _443 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1044 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1046 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1048 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1052 = _341 + _1050;
    bool _1054 = _1000 > 0.5;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1058 = _341 + _1056;
    float _1060 = _1052 * _1024;
    out.m_64.x = _1044;
    out.m_64.y = _1046;
    out.m_64.z = _1048;
    float _1062 = -_199;
    int _1064 = _1054 ? as_type<int>(_1062) : as_type<int>(_199);
    bool _1066 = _1002 > 0.5;
    float _1068 = _1058 * _1036;
    float _1070 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1038);
    float _1072 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1042);
    bool _1074 = !_1028;
    float _1076 = _1074 ? _199 : as_type<float>(_1064);
    float _1078 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1070);
    float _1080 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1072);
    float _1082 = -_205;
    int _1084 = _1066 ? as_type<int>(_1082) : as_type<int>(_205);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1086;
    float _1090 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1092 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1094 = fma(_1088, _1060, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1096 = 1.0 / _1090;
    float _1098 = _1092 + _1090;
    bool _1100 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1102 = isnan(_341);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1112;
    bool _1116 = !_1034;
    float _1118 = _1116 ? _205 : as_type<float>(_1084);
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1120;
    bool _1124 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1126 = isnan(_341);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1132 = _1128 || _1130;
    float _1134 = float(_1132);
    float _1136 = -_1110;
    float _1138 = _1136 + 1.0;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1144 = fma(_1114, _1060, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1148 = fma(_1122, _1060, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1150 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1152 = isnan(_341);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    float _1162 = _1134 * _1138;
    float _1164 = -_1134;
    float _1166 = _1164 + 1.0;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1174 = _1094;
    float _1176 = _875;
    if (!_1020)
    {
        _1172 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1178 = _1172;
    float _1180 = _1098 * _1096;
    float _1182 = _1180 * 0.5;
    float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1186 = _1160 * _1166;
    float _1188 = -_1118;
    float _1190 = _1188 + 0.5;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1196 = _1076 + 0.5;
    float _1198 = _1094 * _1186;
    float _1200 = _1144 * _1186;
    float _1202 = _1148 * _1186;
    float _1204 = _1182;
    float _1206 = _1186;
    if (!_1020)
    {
        float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1210 = fma(_1182, _1178, _1208);
        _1204 = _1210;
    }
    float _1212 = _1204;
    float _1214 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1020)
    {
        _1206 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1216 = _1206;
    float _1218 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1220 = _877 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1222 = _1214 * _1146;
    float _1224 = _875 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1226 = _1212;
    if (!_1020)
    {
        float _1228 = 1.0 / _1212;
        _1226 = _1228;
    }
    float _1230 = _1226;
    if (!_1020)
    {
        float _1232 = -_1216;
        float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1174 = _1234;
    }
    float _1236 = _1174;
    float _1238 = _1218 * _1184;
    float _1240 = -_1160;
    float _1242 = _1240 + 1.0;
    float _1244 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1220);
    float _1246 = fma(_1194, _1068, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1248 = fma(_1170, _1068, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1250 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1198);
    float _1252 = exp2(_1224);
    float _1254 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1200);
    float _1256 = fma(_1142, _1068, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1258 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1202);
    float _1260 = fma(_1246, _1162, _1250);
    float _1262 = fma(_1248, _1162, _1254);
    out.m_66.x = _1238;
    out.m_66.y = _1222;
    float _1264 = fma(_1256, _1162, _1258);
    float _1266 = 0.0;
    float _1268 = _1236;
    if (!_1020)
    {
        float _1270 = 1.0 / _1236;
        _1266 = _1270;
    }
    float _1272 = _1266;
    if (!_1020)
    {
        float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1276 = -_1216;
        float _1278 = fma(_1230, _1274, _1276);
        _1176 = _1278;
    }
    float _1280 = _1176;
    float _1282 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1260);
    float _1284 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1262);
    float _1286 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1264);
    float _1288 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1290 = -_1252;
    float _1292 = _1290 + 1.0;
    if (_1020)
    {
        _1268 = 1.0;
    }
    float _1294 = _1268;
    float _1296 = _1286 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1298 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1294;
    if (!_1020)
    {
        float _1304 = _1280 * _1272;
        float _1306 = precise::clamp(_1304, 0.0, 1.0);
        _1302 = _1306;
    }
    float _1308 = _1302;
    float _1310 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1244);
    float _1312 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1314 = _1284 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1316 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1310);
    bool _1318 = _1308 > 0.0;
    bool _1320 = isnan(_1308);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan(0.0);
    bool _1326 = _1322 || _1324;
    float _1328 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1330 = -_1312;
    float _1332 = _1330 + 1.0;
    float _1334 = _1316 + _915;
    out.gl_Position.x = _941;
    out.gl_Position.y = _943;
    out.gl_Position.z = _1316;
    out.gl_Position.w = _915;
    float _1336 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1338 = _1328 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1340 = _1334 * 0.5;
    out.m_68.x = _1298;
    out.m_68.y = _1336;
    out.m_68.z = _1300;
    out.m_70.z = _1340;
    out.m_70.w = _915;
    out.m_45.x = _1338;
    float _1342 = _1312 * _969;
    float _1344 = _988 * _1342;
    float _1346 = _988 * _1332;
    float _1348 = _998 * _1342;
    float _1350 = fma(_994, _1344, _982);
    float _1352 = fma(_996, _1344, _984);
    float _1354 = fma(_988, _1348, _986);
    out.m_72.x = _1350;
    out.m_72.y = _1352;
    out.m_72.z = _1354;
    out.m_72.w = _1346;
    if (_1326)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1356 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1356;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _333 = false;
    bool _231 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1413 = as_type<float>(_107);
        out.gl_Position.z = _1413;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1482 = as_type<float>(_143);
        out.gl_Position.z = _1482;
    }
    if (_135)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_52.x;
    float _149 = in.m_52.y;
    float _151 = in.m_52.z;
    float _153 = in.m_54.x;
    float _155 = in.m_54.y;
    float _157 = in.m_54.z;
    float _159 = in.m_56.x;
    float _161 = in.m_56.y;
    float _163 = in.m_56.z;
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    int _171 = as_type<int>(_145) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_145) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _149 * _155;
    float _183 = _149 * _161;
    float _185 = fma(_147, _153, _181);
    float _187 = _149 * _167;
    float _189 = fma(_147, _159, _183);
    float _191 = fma(_151, _157, _185);
    float _193 = fma(_147, _165, _187);
    float _195 = fma(_151, _163, _189);
    bool _197 = !_173;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_151, _169, _193);
    bool _203 = !_177;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_179;
    float _209 = _191;
    float _211 = _195;
    float _229;
    if (!_207)
    {
        float _213 = in.m_60.x;
        float _215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _221 = _219 * _215;
        float _223 = floor(_221);
        float _225 = -_223;
        float _227 = _221 + _225;
        _229 = _227;
        _231 = true;
    }
    else
    {
        float _233 = float(_91);
        float _235 = 1.0 / _233;
        float _237 = _125 * _235;
        _229 = _237;
    }
    _231 = false;
    float _239 = _229;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _239 + _241;
    bool _245 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _247 = isnan(_239);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -_255;
    float _263 = _261 + 1.0;
    bool _265 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _267 = isnan(_239);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _283 = 1.0 / _259;
    float _285 = _275 * _263;
    float _287 = -_275;
    float _289 = _287 + 1.0;
    float _291 = _243 * _283;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _293;
    float _297 = fma(_279, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _299 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _301 = _297 * _285;
    float _303 = _299 * _285;
    float _305 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].x, _301);
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _309 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    bool _313 = !_281;
    float _331;
    if (!_313)
    {
        float _315 = in.m_60.x;
        float _317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _319 = _315 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _323 = _321 * _317;
        float _325 = floor(_323);
        float _327 = -_325;
        float _329 = _323 + _327;
        _331 = _329;
        _333 = true;
    }
    else
    {
        float _335 = float(_91);
        float _337 = 1.0 / _335;
        float _339 = _125 * _337;
        _331 = _339;
    }
    _333 = false;
    float _341 = _331;
    float _343 = in.m_62.x;
    float _345 = in.m_62.y;
    float _347 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _349 = in.m_42.x;
    float _351 = in.m_42.y;
    float _353 = in.m_42.z;
    float _355 = in.m_58.w;
    float _357 = in.m_54.w;
    float _359 = _311 * _345;
    float _361 = _309 * _343;
    float _363 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _365 = _359 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _367 = _361 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _369 = _167 * _351;
    float _371 = _155 * _351;
    float _373 = _365 * _347;
    float _375 = _367 * _363;
    float _377 = fma(_165, _349, _369);
    float _379 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _381 = _373 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _383 = _373 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _385 = fma(_153, _349, _371);
    float _387 = fma(_169, _353, _377);
    float _389 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[26].x, _381);
    float _391 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[24].x, _383);
    float _393 = fma(_157, _353, _385);
    float _395 = _161 * _351;
    float _397 = fma(_379, (*spvDescriptorSet0.vp_c8)._m0[26].z, _389);
    float _399 = _387 + _355;
    float _401 = fma(_379, (*spvDescriptorSet0.vp_c8)._m0[24].z, _391);
    float _403 = _393 + _357;
    float _405 = _397 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _407 = _373 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _409 = _401 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _411 = fma(_159, _349, _395);
    float _413 = _399 + _405;
    float _415 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[25].x, _407);
    float _417 = _403 + _409;
    float _419 = fma(_163, _353, _411);
    float _421 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _423 = _413 + _421;
    float _425 = fma(_379, (*spvDescriptorSet0.vp_c8)._m0[25].z, _415);
    float _427 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _429 = _417 + _427;
    float _431 = _423 * _423;
    float _433 = _425 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _435 = fma(_429, _429, _431);
    float _437 = in.m_56.w;
    float _439 = sqrt(_435);
    bool _441 = _439 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _443 = _419 + _437;
    float _445 = _443 + _433;
    float _447 = _419;
    float _449 = _437;
    float _451 = _417;
    float _453 = _423;
    if (!_441)
    {
        _447 = _413;
    }
    float _455 = _447;
    float _457 = _455;
    if (!_441)
    {
        _449 = _445;
    }
    float _459 = _449;
    bool _461 = !_441;
    float _463 = _459;
    if (!_461)
    {
        float _465 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _467 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _469 = _439 + _467;
        float _471 = rsqrt(_435);
        float _473 = _469 * _465;
        float _475 = _445 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _477 = _473 * 0.15915493667125701904296875;
        float _479 = _477 * 6.283185482025146484375;
        float _481 = cos(_479);
        float _483 = _477 * 6.283185482025146484375;
        float _485 = sin(_483);
        float _487 = _481 + (-1.0);
        float _489 = fma(_485, _475, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _491 = _487 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _493 = _471 * _489;
        float _495 = fma(_445, _481, _491);
        float _497 = fma(_429, _493, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _499 = fma(_423, _493, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _463 = _495;
        _451 = _497;
        _457 = _499;
    }
    float _501 = _463;
    float _503 = _451;
    float _505 = _457;
    float _507 = -_443;
    float _509 = _507 + _501;
    float _511 = -_403;
    float _513 = _511 + _503;
    float _515 = -_399;
    float _517 = _515 + _505;
    float _519 = _509 * _509;
    bool _521 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _523 = isnan(0.5);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _529 = _525 || _527;
    float _531 = fma(_513, _513, _519);
    float _533 = fma(_517, _517, _531);
    float _535 = sqrt(_533);
    bool _537 = _535 > 0.0;
    bool _539 = !_537;
    float _541 = _503;
    float _543 = _501;
    float _545 = _505;
    float _547 = _517;
    if (!_539)
    {
        float _549 = _195 * _195;
        float _551 = fma(_191, _191, _549);
        float _553 = fma(_201, _201, _551);
        float _555 = rsqrt(_533);
        float _557 = sqrt(_553);
        float _559 = _513 * _555;
        float _561 = _509 * _555;
        float _563 = _517 * _555;
        bool _565 = _557 > 0.0;
        bool _567 = !_565;
        _453 = _559;
        if (!_567)
        {
            float _569 = rsqrt(_553);
            float _571 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _573 = _195 * _569;
            float _575 = _191 * _569;
            float _577 = _561 * _573;
            float _579 = _201 * _569;
            float _581 = fma(_559, _575, _577);
            float _583 = _571 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _585 = fma(_563, _579, _581);
            float _587 = _585 * _583;
            float _589 = fma(_191, _587, _503);
            float _591 = fma(_195, _587, _501);
            float _593 = fma(_201, _587, _505);
            _541 = _589;
            _543 = _591;
            _545 = _593;
        }
    }
    float _595 = _541;
    float _597 = _543;
    float _599 = _545;
    float _601 = _453;
    float _603 = _597;
    float _605 = _599;
    if (_529)
    {
        _209 = _595;
    }
    float _607 = _209;
    float _609 = _607;
    if (!_529)
    {
        float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _613 = _443 + _611;
        float _615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _617 = _403 + _615;
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _621 = -_443;
        float _623 = _621 + _597;
        float _625 = _613 * _613;
        float _627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _629 = _399 + _627;
        float _631 = fma(_617, _617, _625);
        float _633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _635 = fma(_629, _629, _631);
        float _637 = sqrt(_635);
        float _639 = _619 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _641 = precise::min(_637, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _643 = _641 * _633;
        float _645 = -_403;
        float _647 = _645 + _595;
        float _649 = _639 * _643;
        float _651 = -_399;
        float _653 = _651 + _599;
        float _655 = fma(_647, _649, _403);
        float _657 = fma(_623, _649, _443);
        float _659 = fma(_653, _649, _399);
        _603 = _657;
        _609 = _655;
        _605 = _659;
    }
    float _661 = _603;
    float _663 = _609;
    float _665 = _605;
    float _667 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _669 = _661 + _667;
    float _671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _673 = _663 + _671;
    float _675 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _677 = _665 + _675;
    float _679 = _669 * _669;
    float _681 = fma(_673, _673, _679);
    float _683 = fma(_677, _677, _681);
    float _685 = rsqrt(_683);
    float _687 = _685 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _689 = _673 * _687;
    float _691 = _677 * _687;
    float _693 = _689 * _689;
    float _695 = _691 * _691;
    float _697 = _693 + _695;
    float _699 = sqrt(_697);
    bool _701 = _699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _705 = _699 + _703;
    float _707 = _677;
    float _709 = _697;
    float _711 = _705;
    float _713 = _689;
    if (_701)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _707 = _715;
    }
    float _717 = _707;
    if (_701)
    {
        float _719 = rsqrt(_697);
        _709 = _719;
    }
    float _721 = _709;
    float _723 = _721;
    if (_701)
    {
        float _725 = _705 * _717;
        _711 = _725;
    }
    float _727 = _711;
    if (_701)
    {
        float _729 = _727 * 0.15915493667125701904296875;
        _211 = _729;
    }
    float _731 = _211;
    float _733 = _685;
    float _735 = _731;
    if (_701)
    {
        float _737 = _731 * 6.283185482025146484375;
        float _739 = sin(_737);
        _733 = _739;
    }
    float _741 = _733;
    float _743 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _745 = precise::max(0.0, _743);
    float _747 = _601;
    float _749 = _745;
    float _751 = _743;
    if (_701)
    {
        float _753 = _731 * 6.283185482025146484375;
        float _755 = cos(_753);
        _747 = _755;
    }
    float _757 = _747;
    float _759 = -_687;
    float _761 = -_745;
    float _763 = fma(_669, _759, _761);
    if (_701)
    {
        float _765 = _763 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _749 = _765;
    }
    float _767 = _749;
    float _769 = sqrt(_683);
    float _771 = _741;
    float _773 = _767;
    if (_701)
    {
        float _775 = fma(_741, _767, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _771 = _775;
    }
    float _777 = _771;
    float _779 = _777;
    if (!_701)
    {
        _773 = _691;
    }
    float _781 = _773;
    float _783 = _781;
    if (_701)
    {
        float _785 = _757 + (-1.0);
        _751 = _785;
    }
    float _787 = _751;
    float _789 = _787;
    if (_701)
    {
        float _791 = _721 * _777;
        _547 = _791;
    }
    float _793 = _547;
    if (!_701)
    {
        _779 = _763;
    }
    float _795 = _779;
    float _797 = _795;
    if (_701)
    {
        float _799 = _787 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _735 = _799;
    }
    float _801 = _735;
    if (_701)
    {
        float _803 = _689 * _793;
        _713 = _803;
    }
    float _805 = _713;
    if (!_701)
    {
        _723 = _693;
    }
    float _807 = _723;
    float _809 = _807;
    if (_701)
    {
        float _811 = _691 * _793;
        _783 = _811;
    }
    float _813 = _783;
    if (_701)
    {
        float _815 = fma(_763, _757, _801);
        _797 = _815;
    }
    float _817 = _797;
    if (_701)
    {
        float _819 = _805 * _805;
        _809 = _819;
    }
    float _821 = _809;
    if (!_701)
    {
        _789 = _695;
    }
    float _823 = _789;
    float _825 = _823;
    if (_701)
    {
        float _827 = _813 * _813;
        _825 = _827;
    }
    float _829 = _825;
    float _831 = fma(_817, _817, _821);
    float _833 = _831 + _829;
    float _835 = _661 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _837 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _839 = fma(_769, (*spvDescriptorSet0.vp_c15)._m0[23].w, _837);
    float _841 = precise::clamp(_839, 0.0, 1.0);
    float _843 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _845 = rsqrt(_833);
    float _847 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[2].x, _835);
    float _849 = _661 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _851 = -_841;
    float _853 = _851 + 1.0;
    float _855 = _661 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _857 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[2].z, _847);
    float _859 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[1].x, _849);
    float _861 = _661 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _863 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[0].x, _855);
    float _865 = _857 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _867 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[1].z, _859);
    float _869 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[3].x, _861);
    float _871 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[0].z, _863);
    float _873 = abs(_853);
    float _875 = log2(_873);
    float _877 = _867 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _879 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[3].z, _869);
    float _881 = _845 * _805;
    float _883 = _871 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _885 = _877 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _887 = _845 * _817;
    float _889 = _881 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _891 = _845 * _813;
    float _893 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[7].x, _885);
    float _895 = _865 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _897 = -_889;
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[21].y, _897);
    float _901 = _879 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _903 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[7].z, _893);
    float _905 = -_895;
    float _907 = fma(_905, _843, 1.0);
    float _909 = -_891;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[21].z, _899);
    float _913 = _875 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].w, _903);
    float _917 = _877 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _919 = fma(_911, -0.5, 0.5);
    float _921 = log2(_907);
    float _923 = _877 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _925 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[4].x, _917);
    float _927 = fma(_911, 0.5, 0.5);
    float _929 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[5].x, _923);
    float _931 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[4].z, _925);
    float _933 = _887 + 1.0;
    float _935 = 1.0 / _915;
    float _937 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[5].z, _929);
    float _939 = fma(_927, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _941 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].w, _931);
    float _943 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].w, _937);
    float _945 = fma(_927, _939, -0.212114393711090087890625);
    float _947 = exp2(_913);
    float _949 = _921 * 0.693147182464599609375;
    float _951 = fma(_927, _945, 1.570728778839111328125);
    float _953 = _949 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _955 = sqrt(_919);
    float _957 = _941 * _935;
    float _959 = _943 * _935;
    float _961 = fma(_957, 0.5, 0.5);
    float _963 = fma(_959, -0.5, 0.5);
    float _965 = -_887;
    float _967 = fma(_947, _933, _965);
    float3 _2794 = float3(_961, _963, _953);
    float _969 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2794, float3(0.0), isnan(_2794)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2794, float3(0.0), isnan(_2794)), level(0.0)).x;
    float _971 = fma(_967, 0.5, 0.5);
    float _973 = _955 * 0.636619746685028076171875;
    float _975 = -_951;
    float _977 = fma(_973, _975, 1.0);
    float3 _2815 = float3(_961, _963, _953);
    float4 _980 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2815, float3(0.0), isnan(_2815)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2815, float3(0.0), isnan(_2815)), level(0.0)).xyzw;
    float _982 = _980.x;
    float _984 = _980.y;
    float _986 = _980.z;
    float _988 = _980.w;
    float2 _2832 = float2(_977, _971);
    float3 _992 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2832, float2(0.0), isnan(_2832)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2832, float2(0.0), isnan(_2832)), level(0.0)).xyz;
    float _994 = _992.x;
    float _996 = _992.y;
    float _998 = _992.z;
    float _1000 = in.m_60.x;
    float _1002 = in.m_60.y;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1012 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1014 = isnan(0.5);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1020 = _1016 || _1018;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1024 = 1.0 / _1006;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1028 = _1026 != 0;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1034 = _1032 != 0;
    float _1036 = 1.0 / _1010;
    float _1038 = _443 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1042 = _443 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1044 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1046 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1048 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1052 = _341 + _1050;
    bool _1054 = _1000 > 0.5;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1058 = _341 + _1056;
    float _1060 = _1052 * _1024;
    out.m_64.x = _1044;
    out.m_64.y = _1046;
    out.m_64.z = _1048;
    float _1062 = -_199;
    int _1064 = _1054 ? as_type<int>(_1062) : as_type<int>(_199);
    bool _1066 = _1002 > 0.5;
    float _1068 = _1058 * _1036;
    float _1070 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1038);
    float _1072 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1042);
    bool _1074 = !_1028;
    float _1076 = _1074 ? _199 : as_type<float>(_1064);
    float _1078 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1070);
    float _1080 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1072);
    float _1082 = -_205;
    int _1084 = _1066 ? as_type<int>(_1082) : as_type<int>(_205);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1086;
    float _1090 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1092 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1094 = fma(_1088, _1060, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1096 = 1.0 / _1090;
    float _1098 = _1092 + _1090;
    bool _1100 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1102 = isnan(_341);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1112;
    bool _1116 = !_1034;
    float _1118 = _1116 ? _205 : as_type<float>(_1084);
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1120;
    bool _1124 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1126 = isnan(_341);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1132 = _1128 || _1130;
    float _1134 = float(_1132);
    float _1136 = -_1110;
    float _1138 = _1136 + 1.0;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1144 = fma(_1114, _1060, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1148 = fma(_1122, _1060, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1150 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1152 = isnan(_341);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    float _1162 = _1134 * _1138;
    float _1164 = -_1134;
    float _1166 = _1164 + 1.0;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1174 = _1094;
    float _1176 = _875;
    if (!_1020)
    {
        _1172 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1178 = _1172;
    float _1180 = _1098 * _1096;
    float _1182 = _1180 * 0.5;
    float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1186 = _1160 * _1166;
    float _1188 = -_1118;
    float _1190 = _1188 + 0.5;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1196 = _1076 + 0.5;
    float _1198 = _1094 * _1186;
    float _1200 = _1144 * _1186;
    float _1202 = _1148 * _1186;
    float _1204 = _1182;
    float _1206 = _1186;
    if (!_1020)
    {
        float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1210 = fma(_1182, _1178, _1208);
        _1204 = _1210;
    }
    float _1212 = _1204;
    float _1214 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1020)
    {
        _1206 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1216 = _1206;
    float _1218 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1220 = _877 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1222 = _1214 * _1146;
    float _1224 = _875 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1226 = _1212;
    if (!_1020)
    {
        float _1228 = 1.0 / _1212;
        _1226 = _1228;
    }
    float _1230 = _1226;
    if (!_1020)
    {
        float _1232 = -_1216;
        float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1174 = _1234;
    }
    float _1236 = _1174;
    float _1238 = _1218 * _1184;
    float _1240 = -_1160;
    float _1242 = _1240 + 1.0;
    float _1244 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1220);
    float _1246 = fma(_1194, _1068, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1248 = fma(_1170, _1068, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1250 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1198);
    float _1252 = exp2(_1224);
    float _1254 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1200);
    float _1256 = fma(_1142, _1068, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1258 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1202);
    float _1260 = fma(_1246, _1162, _1250);
    float _1262 = fma(_1248, _1162, _1254);
    out.m_66.x = _1238;
    out.m_66.y = _1222;
    float _1264 = fma(_1256, _1162, _1258);
    float _1266 = 0.0;
    float _1268 = _1236;
    if (!_1020)
    {
        float _1270 = 1.0 / _1236;
        _1266 = _1270;
    }
    float _1272 = _1266;
    if (!_1020)
    {
        float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1276 = -_1216;
        float _1278 = fma(_1230, _1274, _1276);
        _1176 = _1278;
    }
    float _1280 = _1176;
    float _1282 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1260);
    float _1284 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1262);
    float _1286 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1264);
    float _1288 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1290 = -_1252;
    float _1292 = _1290 + 1.0;
    if (_1020)
    {
        _1268 = 1.0;
    }
    float _1294 = _1268;
    float _1296 = _1286 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1298 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1294;
    if (!_1020)
    {
        float _1304 = _1280 * _1272;
        float _1306 = precise::clamp(_1304, 0.0, 1.0);
        _1302 = _1306;
    }
    float _1308 = _1302;
    float _1310 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1244);
    float _1312 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1314 = _1284 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1316 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1310);
    bool _1318 = _1308 > 0.0;
    bool _1320 = isnan(_1308);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan(0.0);
    bool _1326 = _1322 || _1324;
    float _1328 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1330 = -_1312;
    float _1332 = _1330 + 1.0;
    float _1334 = _1316 + _915;
    out.gl_Position.x = _941;
    out.gl_Position.y = _943;
    out.gl_Position.z = _1316;
    out.gl_Position.w = _915;
    float _1336 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1338 = _1328 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1340 = _1334 * 0.5;
    out.m_68.x = _1298;
    out.m_68.y = _1336;
    out.m_68.z = _1300;
    out.m_70.z = _1340;
    out.m_70.w = _915;
    out.m_45.x = _1338;
    float _1342 = _1312 * _969;
    float _1344 = _988 * _1342;
    float _1346 = _988 * _1332;
    float _1348 = _998 * _1342;
    float _1350 = fma(_994, _1344, _982);
    float _1352 = fma(_996, _1344, _984);
    float _1354 = fma(_988, _1348, _986);
    out.m_72.x = _1350;
    out.m_72.y = _1352;
    out.m_72.z = _1354;
    out.m_72.w = _1346;
    if (_1326)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1356 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1356;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _333 = false;
    bool _231 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1413 = as_type<float>(_107);
        out.gl_Position.z = _1413;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1482 = as_type<float>(_143);
        out.gl_Position.z = _1482;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_52.x;
    float _149 = in.m_52.y;
    float _151 = in.m_52.z;
    float _153 = in.m_54.x;
    float _155 = in.m_54.y;
    float _157 = in.m_54.z;
    float _159 = in.m_56.x;
    float _161 = in.m_56.y;
    float _163 = in.m_56.z;
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    int _171 = as_type<int>(_145) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_145) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _149 * _155;
    float _183 = _149 * _161;
    float _185 = fma(_147, _153, _181);
    float _187 = _149 * _167;
    float _189 = fma(_147, _159, _183);
    float _191 = fma(_151, _157, _185);
    float _193 = fma(_147, _165, _187);
    float _195 = fma(_151, _163, _189);
    bool _197 = !_173;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_151, _169, _193);
    bool _203 = !_177;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_179;
    float _209 = _191;
    float _211 = _195;
    float _229;
    if (!_207)
    {
        float _213 = in.m_60.x;
        float _215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _221 = _219 * _215;
        float _223 = floor(_221);
        float _225 = -_223;
        float _227 = _221 + _225;
        _229 = _227;
        _231 = true;
    }
    else
    {
        float _233 = float(_91);
        float _235 = 1.0 / _233;
        float _237 = _125 * _235;
        _229 = _237;
    }
    _231 = false;
    float _239 = _229;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _239 + _241;
    bool _245 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _247 = isnan(_239);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    float _261 = -_255;
    float _263 = _261 + 1.0;
    bool _265 = _239 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _267 = isnan(_239);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _283 = 1.0 / _259;
    float _285 = _275 * _263;
    float _287 = -_275;
    float _289 = _287 + 1.0;
    float _291 = _243 * _283;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _293;
    float _297 = fma(_279, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _299 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _301 = _297 * _285;
    float _303 = _299 * _285;
    float _305 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].x, _301);
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _309 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    bool _313 = !_281;
    float _331;
    if (!_313)
    {
        float _315 = in.m_60.x;
        float _317 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _319 = _315 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _323 = _321 * _317;
        float _325 = floor(_323);
        float _327 = -_325;
        float _329 = _323 + _327;
        _331 = _329;
        _333 = true;
    }
    else
    {
        float _335 = float(_91);
        float _337 = 1.0 / _335;
        float _339 = _125 * _337;
        _331 = _339;
    }
    _333 = false;
    float _341 = _331;
    float _343 = in.m_62.x;
    float _345 = in.m_62.y;
    float _347 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _349 = in.m_42.x;
    float _351 = in.m_42.y;
    float _353 = in.m_42.z;
    float _355 = in.m_58.w;
    float _357 = in.m_54.w;
    float _359 = _311 * _345;
    float _361 = _309 * _343;
    float _363 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _365 = _359 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _367 = _361 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _369 = _167 * _351;
    float _371 = _155 * _351;
    float _373 = _365 * _347;
    float _375 = _367 * _363;
    float _377 = fma(_165, _349, _369);
    float _379 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _381 = _373 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _383 = _373 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _385 = fma(_153, _349, _371);
    float _387 = fma(_169, _353, _377);
    float _389 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[26].x, _381);
    float _391 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[24].x, _383);
    float _393 = fma(_157, _353, _385);
    float _395 = _161 * _351;
    float _397 = fma(_379, (*spvDescriptorSet0.vp_c8)._m0[26].z, _389);
    float _399 = _387 + _355;
    float _401 = fma(_379, (*spvDescriptorSet0.vp_c8)._m0[24].z, _391);
    float _403 = _393 + _357;
    float _405 = _397 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _407 = _373 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _409 = _401 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _411 = fma(_159, _349, _395);
    float _413 = _399 + _405;
    float _415 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[25].x, _407);
    float _417 = _403 + _409;
    float _419 = fma(_163, _353, _411);
    float _421 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _423 = _413 + _421;
    float _425 = fma(_379, (*spvDescriptorSet0.vp_c8)._m0[25].z, _415);
    float _427 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _429 = _417 + _427;
    float _431 = _423 * _423;
    float _433 = _425 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _435 = fma(_429, _429, _431);
    float _437 = in.m_56.w;
    float _439 = sqrt(_435);
    bool _441 = _439 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _443 = _419 + _437;
    float _445 = _443 + _433;
    float _447 = _419;
    float _449 = _437;
    float _451 = _417;
    float _453 = _423;
    if (!_441)
    {
        _447 = _413;
    }
    float _455 = _447;
    float _457 = _455;
    if (!_441)
    {
        _449 = _445;
    }
    float _459 = _449;
    bool _461 = !_441;
    float _463 = _459;
    if (!_461)
    {
        float _465 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _467 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _469 = _439 + _467;
        float _471 = rsqrt(_435);
        float _473 = _469 * _465;
        float _475 = _445 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _477 = _473 * 0.15915493667125701904296875;
        float _479 = _477 * 6.283185482025146484375;
        float _481 = cos(_479);
        float _483 = _477 * 6.283185482025146484375;
        float _485 = sin(_483);
        float _487 = _481 + (-1.0);
        float _489 = fma(_485, _475, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _491 = _487 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _493 = _471 * _489;
        float _495 = fma(_445, _481, _491);
        float _497 = fma(_429, _493, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _499 = fma(_423, _493, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _463 = _495;
        _451 = _497;
        _457 = _499;
    }
    float _501 = _463;
    float _503 = _451;
    float _505 = _457;
    float _507 = -_443;
    float _509 = _507 + _501;
    float _511 = -_403;
    float _513 = _511 + _503;
    float _515 = -_399;
    float _517 = _515 + _505;
    float _519 = _509 * _509;
    bool _521 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _523 = isnan(0.5);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _529 = _525 || _527;
    float _531 = fma(_513, _513, _519);
    float _533 = fma(_517, _517, _531);
    float _535 = sqrt(_533);
    bool _537 = _535 > 0.0;
    bool _539 = !_537;
    float _541 = _503;
    float _543 = _501;
    float _545 = _505;
    float _547 = _517;
    if (!_539)
    {
        float _549 = _195 * _195;
        float _551 = fma(_191, _191, _549);
        float _553 = fma(_201, _201, _551);
        float _555 = rsqrt(_533);
        float _557 = sqrt(_553);
        float _559 = _513 * _555;
        float _561 = _509 * _555;
        float _563 = _517 * _555;
        bool _565 = _557 > 0.0;
        bool _567 = !_565;
        _453 = _559;
        if (!_567)
        {
            float _569 = rsqrt(_553);
            float _571 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _573 = _195 * _569;
            float _575 = _191 * _569;
            float _577 = _561 * _573;
            float _579 = _201 * _569;
            float _581 = fma(_559, _575, _577);
            float _583 = _571 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _585 = fma(_563, _579, _581);
            float _587 = _585 * _583;
            float _589 = fma(_191, _587, _503);
            float _591 = fma(_195, _587, _501);
            float _593 = fma(_201, _587, _505);
            _541 = _589;
            _543 = _591;
            _545 = _593;
        }
    }
    float _595 = _541;
    float _597 = _543;
    float _599 = _545;
    float _601 = _453;
    float _603 = _597;
    float _605 = _599;
    if (_529)
    {
        _209 = _595;
    }
    float _607 = _209;
    float _609 = _607;
    if (!_529)
    {
        float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _613 = _443 + _611;
        float _615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _617 = _403 + _615;
        float _619 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _621 = -_443;
        float _623 = _621 + _597;
        float _625 = _613 * _613;
        float _627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _629 = _399 + _627;
        float _631 = fma(_617, _617, _625);
        float _633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _635 = fma(_629, _629, _631);
        float _637 = sqrt(_635);
        float _639 = _619 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _641 = precise::min(_637, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _643 = _641 * _633;
        float _645 = -_403;
        float _647 = _645 + _595;
        float _649 = _639 * _643;
        float _651 = -_399;
        float _653 = _651 + _599;
        float _655 = fma(_647, _649, _403);
        float _657 = fma(_623, _649, _443);
        float _659 = fma(_653, _649, _399);
        _603 = _657;
        _609 = _655;
        _605 = _659;
    }
    float _661 = _603;
    float _663 = _609;
    float _665 = _605;
    float _667 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _669 = _661 + _667;
    float _671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _673 = _663 + _671;
    float _675 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _677 = _665 + _675;
    float _679 = _669 * _669;
    float _681 = fma(_673, _673, _679);
    float _683 = fma(_677, _677, _681);
    float _685 = rsqrt(_683);
    float _687 = _685 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _689 = _673 * _687;
    float _691 = _677 * _687;
    float _693 = _689 * _689;
    float _695 = _691 * _691;
    float _697 = _693 + _695;
    float _699 = sqrt(_697);
    bool _701 = _699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _705 = _699 + _703;
    float _707 = _677;
    float _709 = _697;
    float _711 = _705;
    float _713 = _689;
    if (_701)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _707 = _715;
    }
    float _717 = _707;
    if (_701)
    {
        float _719 = rsqrt(_697);
        _709 = _719;
    }
    float _721 = _709;
    float _723 = _721;
    if (_701)
    {
        float _725 = _705 * _717;
        _711 = _725;
    }
    float _727 = _711;
    if (_701)
    {
        float _729 = _727 * 0.15915493667125701904296875;
        _211 = _729;
    }
    float _731 = _211;
    float _733 = _685;
    float _735 = _731;
    if (_701)
    {
        float _737 = _731 * 6.283185482025146484375;
        float _739 = sin(_737);
        _733 = _739;
    }
    float _741 = _733;
    float _743 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _745 = precise::max(0.0, _743);
    float _747 = _601;
    float _749 = _745;
    float _751 = _743;
    if (_701)
    {
        float _753 = _731 * 6.283185482025146484375;
        float _755 = cos(_753);
        _747 = _755;
    }
    float _757 = _747;
    float _759 = -_687;
    float _761 = -_745;
    float _763 = fma(_669, _759, _761);
    if (_701)
    {
        float _765 = _763 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _749 = _765;
    }
    float _767 = _749;
    float _769 = sqrt(_683);
    float _771 = _741;
    float _773 = _767;
    if (_701)
    {
        float _775 = fma(_741, _767, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _771 = _775;
    }
    float _777 = _771;
    float _779 = _777;
    if (!_701)
    {
        _773 = _691;
    }
    float _781 = _773;
    float _783 = _781;
    if (_701)
    {
        float _785 = _757 + (-1.0);
        _751 = _785;
    }
    float _787 = _751;
    float _789 = _787;
    if (_701)
    {
        float _791 = _721 * _777;
        _547 = _791;
    }
    float _793 = _547;
    if (!_701)
    {
        _779 = _763;
    }
    float _795 = _779;
    float _797 = _795;
    if (_701)
    {
        float _799 = _787 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _735 = _799;
    }
    float _801 = _735;
    if (_701)
    {
        float _803 = _689 * _793;
        _713 = _803;
    }
    float _805 = _713;
    if (!_701)
    {
        _723 = _693;
    }
    float _807 = _723;
    float _809 = _807;
    if (_701)
    {
        float _811 = _691 * _793;
        _783 = _811;
    }
    float _813 = _783;
    if (_701)
    {
        float _815 = fma(_763, _757, _801);
        _797 = _815;
    }
    float _817 = _797;
    if (_701)
    {
        float _819 = _805 * _805;
        _809 = _819;
    }
    float _821 = _809;
    if (!_701)
    {
        _789 = _695;
    }
    float _823 = _789;
    float _825 = _823;
    if (_701)
    {
        float _827 = _813 * _813;
        _825 = _827;
    }
    float _829 = _825;
    float _831 = fma(_817, _817, _821);
    float _833 = _831 + _829;
    float _835 = _661 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _837 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _839 = fma(_769, (*spvDescriptorSet0.vp_c15)._m0[23].w, _837);
    float _841 = precise::clamp(_839, 0.0, 1.0);
    float _843 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _845 = rsqrt(_833);
    float _847 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[2].x, _835);
    float _849 = _661 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _851 = -_841;
    float _853 = _851 + 1.0;
    float _855 = _661 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _857 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[2].z, _847);
    float _859 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[1].x, _849);
    float _861 = _661 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _863 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[0].x, _855);
    float _865 = _857 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _867 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[1].z, _859);
    float _869 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[3].x, _861);
    float _871 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[0].z, _863);
    float _873 = abs(_853);
    float _875 = log2(_873);
    float _877 = _867 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _879 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[3].z, _869);
    float _881 = _845 * _805;
    float _883 = _871 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _885 = _877 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _887 = _845 * _817;
    float _889 = _881 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _891 = _845 * _813;
    float _893 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[7].x, _885);
    float _895 = _865 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _897 = -_889;
    float _899 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[21].y, _897);
    float _901 = _879 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _903 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[7].z, _893);
    float _905 = -_895;
    float _907 = fma(_905, _843, 1.0);
    float _909 = -_891;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c15)._m0[21].z, _899);
    float _913 = _875 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].w, _903);
    float _917 = _877 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _919 = fma(_911, -0.5, 0.5);
    float _921 = log2(_907);
    float _923 = _877 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _925 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[4].x, _917);
    float _927 = fma(_911, 0.5, 0.5);
    float _929 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[5].x, _923);
    float _931 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[4].z, _925);
    float _933 = _887 + 1.0;
    float _935 = 1.0 / _915;
    float _937 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[5].z, _929);
    float _939 = fma(_927, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _941 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].w, _931);
    float _943 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].w, _937);
    float _945 = fma(_927, _939, -0.212114393711090087890625);
    float _947 = exp2(_913);
    float _949 = _921 * 0.693147182464599609375;
    float _951 = fma(_927, _945, 1.570728778839111328125);
    float _953 = _949 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _955 = sqrt(_919);
    float _957 = _941 * _935;
    float _959 = _943 * _935;
    float _961 = fma(_957, 0.5, 0.5);
    float _963 = fma(_959, -0.5, 0.5);
    float _965 = -_887;
    float _967 = fma(_947, _933, _965);
    float3 _2794 = float3(_961, _963, _953);
    float _969 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2794, float3(0.0), isnan(_2794)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2794, float3(0.0), isnan(_2794)), level(0.0)).x;
    float _971 = fma(_967, 0.5, 0.5);
    float _973 = _955 * 0.636619746685028076171875;
    float _975 = -_951;
    float _977 = fma(_973, _975, 1.0);
    float3 _2815 = float3(_961, _963, _953);
    float4 _980 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2815, float3(0.0), isnan(_2815)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2815, float3(0.0), isnan(_2815)), level(0.0)).xyzw;
    float _982 = _980.x;
    float _984 = _980.y;
    float _986 = _980.z;
    float _988 = _980.w;
    float2 _2832 = float2(_977, _971);
    float3 _992 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2832, float2(0.0), isnan(_2832)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2832, float2(0.0), isnan(_2832)), level(0.0)).xyz;
    float _994 = _992.x;
    float _996 = _992.y;
    float _998 = _992.z;
    float _1000 = in.m_60.x;
    float _1002 = in.m_60.y;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1012 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1014 = isnan(0.5);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1020 = _1016 || _1018;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1024 = 1.0 / _1006;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1028 = _1026 != 0;
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1034 = _1032 != 0;
    float _1036 = 1.0 / _1010;
    float _1038 = _443 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1042 = _443 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1044 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1046 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1048 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1052 = _341 + _1050;
    bool _1054 = _1000 > 0.5;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1058 = _341 + _1056;
    float _1060 = _1052 * _1024;
    out.m_64.x = _1044;
    out.m_64.y = _1046;
    out.m_64.z = _1048;
    float _1062 = -_199;
    int _1064 = _1054 ? as_type<int>(_1062) : as_type<int>(_199);
    bool _1066 = _1002 > 0.5;
    float _1068 = _1058 * _1036;
    float _1070 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1038);
    float _1072 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1042);
    bool _1074 = !_1028;
    float _1076 = _1074 ? _199 : as_type<float>(_1064);
    float _1078 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1070);
    float _1080 = fma(_399, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1072);
    float _1082 = -_205;
    int _1084 = _1066 ? as_type<int>(_1082) : as_type<int>(_205);
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1086;
    float _1090 = _1078 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1092 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1094 = fma(_1088, _1060, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1096 = 1.0 / _1090;
    float _1098 = _1092 + _1090;
    bool _1100 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1102 = isnan(_341);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1114 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1112;
    bool _1116 = !_1034;
    float _1118 = _1116 ? _205 : as_type<float>(_1084);
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1122 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1120;
    bool _1124 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1126 = isnan(_341);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1132 = _1128 || _1130;
    float _1134 = float(_1132);
    float _1136 = -_1110;
    float _1138 = _1136 + 1.0;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1144 = fma(_1114, _1060, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1148 = fma(_1122, _1060, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1150 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1152 = isnan(_341);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    float _1162 = _1134 * _1138;
    float _1164 = -_1134;
    float _1166 = _1164 + 1.0;
    float _1168 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1174 = _1094;
    float _1176 = _875;
    if (!_1020)
    {
        _1172 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1178 = _1172;
    float _1180 = _1098 * _1096;
    float _1182 = _1180 * 0.5;
    float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1186 = _1160 * _1166;
    float _1188 = -_1118;
    float _1190 = _1188 + 0.5;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1196 = _1076 + 0.5;
    float _1198 = _1094 * _1186;
    float _1200 = _1144 * _1186;
    float _1202 = _1148 * _1186;
    float _1204 = _1182;
    float _1206 = _1186;
    if (!_1020)
    {
        float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1210 = fma(_1182, _1178, _1208);
        _1204 = _1210;
    }
    float _1212 = _1204;
    float _1214 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1020)
    {
        _1206 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1216 = _1206;
    float _1218 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1220 = _877 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1222 = _1214 * _1146;
    float _1224 = _875 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1226 = _1212;
    if (!_1020)
    {
        float _1228 = 1.0 / _1212;
        _1226 = _1228;
    }
    float _1230 = _1226;
    if (!_1020)
    {
        float _1232 = -_1216;
        float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1174 = _1234;
    }
    float _1236 = _1174;
    float _1238 = _1218 * _1184;
    float _1240 = -_1160;
    float _1242 = _1240 + 1.0;
    float _1244 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1220);
    float _1246 = fma(_1194, _1068, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1248 = fma(_1170, _1068, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1250 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1198);
    float _1252 = exp2(_1224);
    float _1254 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1200);
    float _1256 = fma(_1142, _1068, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1258 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1202);
    float _1260 = fma(_1246, _1162, _1250);
    float _1262 = fma(_1248, _1162, _1254);
    out.m_66.x = _1238;
    out.m_66.y = _1222;
    float _1264 = fma(_1256, _1162, _1258);
    float _1266 = 0.0;
    float _1268 = _1236;
    if (!_1020)
    {
        float _1270 = 1.0 / _1236;
        _1266 = _1270;
    }
    float _1272 = _1266;
    if (!_1020)
    {
        float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1276 = -_1216;
        float _1278 = fma(_1230, _1274, _1276);
        _1176 = _1278;
    }
    float _1280 = _1176;
    float _1282 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1260);
    float _1284 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1262);
    float _1286 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1264);
    float _1288 = _1282 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1290 = -_1252;
    float _1292 = _1290 + 1.0;
    if (_1020)
    {
        _1268 = 1.0;
    }
    float _1294 = _1268;
    float _1296 = _1286 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1298 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1294;
    if (!_1020)
    {
        float _1304 = _1280 * _1272;
        float _1306 = precise::clamp(_1304, 0.0, 1.0);
        _1302 = _1306;
    }
    float _1308 = _1302;
    float _1310 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1244);
    float _1312 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1314 = _1284 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1316 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1310);
    bool _1318 = _1308 > 0.0;
    bool _1320 = isnan(_1308);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan(0.0);
    bool _1326 = _1322 || _1324;
    float _1328 = _1308 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1330 = -_1312;
    float _1332 = _1330 + 1.0;
    float _1334 = _1316 + _915;
    out.gl_Position.x = _941;
    out.gl_Position.y = _943;
    out.gl_Position.z = _1316;
    out.gl_Position.w = _915;
    float _1336 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1338 = _1328 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1340 = _1334 * 0.5;
    out.m_68.x = _1298;
    out.m_68.y = _1336;
    out.m_68.z = _1300;
    out.m_70.z = _1340;
    out.m_70.w = _915;
    out.m_45.x = _1338;
    float _1342 = _1312 * _969;
    float _1344 = _988 * _1342;
    float _1346 = _988 * _1332;
    float _1348 = _998 * _1342;
    float _1350 = fma(_994, _1344, _982);
    float _1352 = fma(_996, _1344, _984);
    float _1354 = fma(_988, _1348, _986);
    out.m_72.x = _1350;
    out.m_72.y = _1352;
    out.m_72.z = _1354;
    out.m_72.w = _1346;
    if (_1326)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1356 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1356;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

