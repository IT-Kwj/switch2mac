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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_70 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_72 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_60 [[user(locn7)]];
    float4 m_64 [[user(locn8)]];
    float4 m_62 [[user(locn9)]];
    float4 m_68 [[user(locn10)]];
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1589 = as_type<float>(_111);
        out.gl_Position.z = _1589;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1659 = as_type<float>(_149);
        out.gl_Position.z = _1659;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_51.w;
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_49.x;
    float _167 = in.m_49.y;
    float _169 = in.m_49.z;
    float _171 = in.m_44.x;
    float _173 = in.m_44.y;
    float _175 = in.m_44.z;
    float _177 = 0.0;
    float _179 = _153;
    if (!_163)
    {
        float _181 = _153 * _153;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_163;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _153 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _153);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_163;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _165, _255);
    float _263 = fma(_251, _167, _257);
    float _265 = fma(_251, _169, _259);
    float _267 = fma(_261, _151, _171);
    float _269 = fma(_263, _151, _173);
    float _271 = fma(_265, _151, _175);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_53.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_95);
        float _297 = 1.0 / _295;
        float _299 = _129 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = in.m_53.z;
    float _305 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _307 = in.m_53.x;
    float _309 = in.m_53.y;
    float _311 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _313 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _317 = _315 != 0;
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _321 = _319 != 0;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _325 = _323 != 0;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _305);
    float _333 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _311);
    float _335 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _313);
    float _337 = 1.0 / _329;
    float _339 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _331);
    float _341 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _333);
    float _343 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _335);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _301 + _345;
    bool _349 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_301);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = _341 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _363 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _365 = isnan(_301);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _377 = log2(_375);
    float _379 = _339 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _383 = _361 + _381;
    bool _385 = !_317;
    int _387 = _385 ? 0 : 1;
    float _389 = _303 * 2.0;
    float _391 = -_373;
    float _393 = _391 + 1.0;
    float _395 = _343 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _399 = _379 + _397;
    float _401 = _309 * 2.0;
    float _403 = _307 * 2.0;
    float _405 = floor(_389);
    float _407 = _309 + _303;
    float _409 = _347 * _337;
    float _411 = _309 + _307;
    float _413 = _407 + (-1.0);
    float _415 = _377 * _129;
    float _417 = _411 + (-1.0);
    float _419 = floor(_401);
    int _421 = abs(_387);
    float _423 = _359 * _393;
    float _425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _427 = _395 + _425;
    float _429 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _431 = -_359;
    float _433 = _431 + 1.0;
    bool _435 = _405 > 0.0;
    float _437 = floor(_403);
    bool _439 = _405 >= 0.0;
    bool _441 = isnan(_405);
    bool _443 = _439 || _441;
    bool _445 = isnan(0.0);
    bool _447 = _443 || _445;
    int _449 = _447 ? 0 : 1;
    bool _451 = _419 >= 0.0;
    bool _453 = isnan(_419);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _463 = ~_449;
    int _465 = _463 + 1;
    int _467 = _465 + 1;
    float _469 = exp2(_415);
    float _471 = in.m_55.x;
    float _473 = in.m_55.y;
    float _475 = in.m_55.z;
    int _477 = _467;
    if (!_435)
    {
        int _479 = ~_449;
        int _481 = _479 + 1;
        _477 = _481;
    }
    int _483 = _477;
    bool _485 = _419 > 0.0;
    bool _487 = _437 > 0.0;
    bool _489 = _437 >= 0.0;
    bool _491 = isnan(_437);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _499;
    float _503 = in.m_51.x;
    float _505 = in.m_51.y;
    float _507 = fma(_501, _409, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _509 = _383 * _383;
    float _511 = float(_483);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _515 = 1.0 + _513;
    bool _517 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _519 = isnan(1.0);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _525 = _521 || _523;
    float _527 = fma(_399, _399, _509);
    float _529 = _507 * _423;
    float _531 = 1.0 / _515;
    int _533 = _497 ? 0 : 1;
    float _535 = fma(_427, _427, _527);
    float _537 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].x, _529);
    float _539 = -_469;
    float _541 = _539 + 1.0;
    bool _543 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _551 = _547 || _549;
    float _553 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[144].x, _537);
    float _555 = sqrt(_535);
    float _557 = float(_421);
    bool _559 = !_325;
    int _561 = _559 ? 0 : 1;
    int _563 = ~_533;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    float _569 = _557 * _511;
    bool _571 = !_321;
    int _573 = _571 ? 0 : 1;
    float _575 = _553 * _503;
    int _577 = _567;
    if (!_487)
    {
        int _579 = ~_533;
        int _581 = _579 + 1;
        _577 = _581;
    }
    int _583 = _577;
    float _585 = rsqrt(_535);
    int _587 = abs(_573);
    float _589 = _575 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _591 = _551 ? _541 : 0.0;
    float _593 = _569 * (-2.0);
    int _595 = abs(_561);
    float _597 = _555 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _599 = _589 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _601 = fma(_593, _471, _471);
    if (_525)
    {
        float _603 = _591 * _531;
        _131 = _603;
    }
    float _605 = _131;
    float _607 = float(_587);
    float _609 = fma(_429, _593, _429);
    float _611 = float(_583);
    float _613 = _307 + (-0.5);
    float _615 = precise::min(_599, _597);
    float _617 = _309 + (-0.5);
    int _619 = _459 ? 0 : 1;
    float _621 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[196].x, _601);
    float _623 = _607 * _611;
    float _625 = _585 * _615;
    int _627 = ~_619;
    int _629 = _627 + 1;
    int _631 = _629 + 1;
    float _633 = fma(_609, _605, _621);
    float _635 = _623 * (-2.0);
    float _637 = _383 * _625;
    int _639 = _631;
    float _641 = _615;
    if (!_485)
    {
        int _643 = ~_619;
        int _645 = _643 + 1;
        _639 = _645;
    }
    int _647 = _639;
    float _649 = _633 * 0.15915493667125701904296875;
    float _651 = _399 * _625;
    float _653 = -_637;
    float _655 = _383 + _653;
    float _657 = fma(_635, _473, _473);
    float _659 = fma(_461, _635, _461);
    float _661 = float(_595);
    float _663 = -_651;
    float _665 = _399 + _663;
    float _667 = float(_647);
    float _669 = _655 * _655;
    float _671 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[196].y, _657);
    float _673 = as_type<float>(int(gl_VertexIndex));
    float _675 = fma(_665, _665, _669);
    float _677 = _661 * _667;
    float _679 = _427 * _625;
    float _681 = _303 + _307;
    float _683 = _303 + (-0.5);
    float _685 = _677 * (-2.0);
    float _687 = -_679;
    float _689 = _427 + _687;
    float _691 = _681 + (-1.0);
    float _693 = _649 * 6.283185482025146484375;
    float _695 = sin(_693);
    float _697 = fma(_689, _689, _675);
    float _699 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _701 = fma(_685, _475, _475);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _703;
    float _707 = fma(_659, _605, _671);
    float _709 = fma(_699, _685, _699);
    float _711 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[196].z, _701);
    float _713 = fma(_705, _409, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _715 = _649 * 6.283185482025146484375;
    float _717 = cos(_715);
    float _719 = _707 * 0.15915493667125701904296875;
    float _721 = fma(_709, _605, _711);
    float _723 = _713 * _423;
    int _725 = as_type<int>(_673) & 1;
    bool _727 = _725 != 0;
    int _729 = as_type<int>(_673) & 2;
    bool _731 = _729 != 0;
    float _733 = _721 * 0.15915493667125701904296875;
    float _735 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].y, _723);
    float _737 = sqrt(_697);
    float _739 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[144].y, _735);
    bool _741 = !_731;
    float _743 = _741 ? (-0.5) : 0.5;
    float _745 = _739 * _505;
    float _747 = _719 * 6.283185482025146484375;
    float _749 = sin(_747);
    bool _751 = !_727;
    float _753 = _751 ? (-0.5) : 0.5;
    float _755 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _743);
    float _757 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _753);
    float _761 = _719 * 6.283185482025146484375;
    float _763 = cos(_761);
    float _765 = _585 * _737;
    float _767 = _757 * _765;
    float _769 = _589 * _765;
    float _771 = _765 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _773 = _771 * 0.5;
    float _775 = _733 * 6.283185482025146484375;
    float _777 = cos(_775);
    float _779 = _767 * _755;
    float _781 = _695 * _749;
    float _783 = _769 * _759;
    float _785 = _733 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = _717 * _763;
    float _791 = _777 * _779;
    float _793 = _717 * _749;
    float _795 = _749 * _777;
    float _797 = _717 * _791;
    float _799 = _695 * _763;
    float _801 = _763 * _777;
    float _803 = _695 * _791;
    float _805 = fma(_787, _789, _781);
    float _807 = -_799;
    float _809 = fma(_787, _793, _807);
    float _811 = -_793;
    float _813 = fma(_787, _799, _811);
    float _815 = fma(_805, _783, _797);
    float _817 = -_779;
    float _819 = _787 * _817;
    float _821 = fma(_787, _781, _789);
    float _823 = fma(_813, _783, _803);
    float _825 = fma(_809, _773, _815);
    float _827 = fma(_801, _783, _819);
    float _829 = fma(_821, _773, _823);
    float _831 = _825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _833 = fma(_795, _773, _827);
    float _835 = _825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _837 = _825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _839 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _831);
    float _841 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _835);
    float _843 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _837);
    float _845 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[24].z, _839);
    float _847 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[26].z, _841);
    float _849 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[25].z, _843);
    float _851 = _845 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _853 = _847 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _855 = _849 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _857 = _379 + _851;
    float _859 = _395 + _853;
    float _861 = _361 + _855;
    float _863 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _865 = _857 + _863;
    float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _869 = _859 + _867;
    float _871 = _869 * _869;
    float _873 = fma(_865, _865, _871);
    float _875 = sqrt(_873);
    bool _877 = _875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _879 = _849;
    float _881 = _871;
    float _883 = _857;
    if (!_877)
    {
        _879 = _859;
    }
    float _885 = _879;
    float _887 = _885;
    if (!_877)
    {
        _881 = _861;
    }
    float _889 = _881;
    bool _891 = !_877;
    float _893 = _889;
    if (!_891)
    {
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _897 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _899 = _875 + _897;
        float _901 = _861 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _903 = _899 * _895;
        float _905 = rsqrt(_873);
        float _907 = _903 * 0.15915493667125701904296875;
        float _909 = _907 * 6.283185482025146484375;
        float _911 = sin(_909);
        float _913 = _907 * 6.283185482025146484375;
        float _915 = cos(_913);
        float _917 = fma(_911, _901, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _919 = _905 * _917;
        float _921 = _915 + (-1.0);
        float _923 = _921 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _925 = fma(_865, _919, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _927 = fma(_869, _919, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _929 = fma(_861, _915, _923);
        _893 = _929;
        _883 = _925;
        _887 = _927;
    }
    float _931 = _893;
    float _933 = _883;
    float _935 = _887;
    float _937 = -_637;
    float _939 = _937 + _931;
    float _941 = -_651;
    float _943 = _941 + _933;
    float _945 = -_679;
    float _947 = _945 + _935;
    float _949 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _953 = _939 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _957 = _943 + _955;
    float _959 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _961 = _947 + _959;
    float _963 = _939 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _965 = _953 * _953;
    float _967 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[3].x, _963);
    float _969 = fma(_957, _957, _965);
    float _971 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[3].z, _967);
    float _973 = fma(_961, _961, _969);
    float _975 = _971 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _977 = rsqrt(_973);
    float _979 = sqrt(_973);
    float _981 = _977 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _983 = _957 * _981;
    float _985 = _961 * _981;
    float _987 = _983 * _983;
    float _989 = _985 * _985;
    float _991 = _987 + _989;
    float _993 = sqrt(_991);
    bool _995 = _993 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _997 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _999 = _993 + _997;
    float _1001 = _961;
    float _1003 = _991;
    float _1005 = _999;
    float _1007 = _965;
    float _1009 = _981;
    if (_995)
    {
        float _1011 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1001 = _1011;
    }
    float _1013 = _1001;
    if (_995)
    {
        float _1015 = rsqrt(_991);
        _1003 = _1015;
    }
    float _1017 = _1003;
    float _1019 = _1017;
    if (_995)
    {
        float _1021 = _999 * _1013;
        _1005 = _1021;
    }
    float _1023 = _1005;
    if (_995)
    {
        float _1025 = _1023 * 0.15915493667125701904296875;
        _1007 = _1025;
    }
    float _1027 = _1007;
    float _1029 = _1013;
    float _1031 = _1027;
    if (_995)
    {
        float _1033 = _1027 * 6.283185482025146484375;
        float _1035 = sin(_1033);
        _1029 = _1035;
    }
    float _1037 = _1029;
    float _1039 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1041 = precise::max(0.0, _1039);
    float _1043 = _869;
    float _1045 = _1041;
    if (_995)
    {
        float _1047 = _1027 * 6.283185482025146484375;
        float _1049 = cos(_1047);
        _1043 = _1049;
    }
    float _1051 = _1043;
    float _1053 = -_981;
    float _1055 = -_1041;
    float _1057 = fma(_953, _1053, _1055);
    float _1059 = _1057;
    if (_995)
    {
        float _1061 = _1057 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1045 = _1061;
    }
    float _1063 = _1045;
    float _1065 = _1037;
    float _1067 = _1063;
    if (_995)
    {
        float _1069 = fma(_1037, _1063, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1065 = _1069;
    }
    float _1071 = _1065;
    float _1073 = _1071;
    float _1075 = _1051;
    if (_995)
    {
        float _1077 = _1051 + (-1.0);
        _1067 = _1077;
    }
    float _1079 = _1067;
    float _1081 = _1079;
    if (_995)
    {
        float _1083 = _1017 * _1071;
        _1009 = _1083;
    }
    float _1085 = _1009;
    if (!_995)
    {
        _1073 = _983;
    }
    float _1087 = _1073;
    float _1089 = _1087;
    if (_995)
    {
        float _1091 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1031 = _1091;
    }
    float _1093 = _1031;
    if (_995)
    {
        float _1095 = _983 * _1085;
        _1089 = _1095;
    }
    float _1097 = _1089;
    if (!_995)
    {
        _1081 = _985;
    }
    float _1099 = _1081;
    float _1101 = _1099;
    if (_995)
    {
        float _1103 = _985 * _1085;
        _1101 = _1103;
    }
    float _1105 = _1101;
    if (!_995)
    {
        _1019 = _987;
    }
    float _1107 = _1019;
    float _1109 = _1107;
    if (_995)
    {
        float _1111 = fma(_1057, _1051, _1093);
        _1059 = _1111;
    }
    float _1113 = _1059;
    if (_995)
    {
        float _1115 = _1097 * _1097;
        _1109 = _1115;
    }
    float _1117 = _1109;
    if (!_995)
    {
        _1075 = _989;
    }
    float _1119 = _1075;
    float _1121 = _1119;
    if (_995)
    {
        float _1123 = _1105 * _1105;
        _1121 = _1123;
    }
    float _1125 = _1121;
    float _1127 = fma(_1113, _1113, _1117);
    float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1131 = fma(_979, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1129);
    float _1133 = precise::clamp(_1131, 0.0, 1.0);
    float _1135 = _939 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1137 = _939 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1139 = _1127 + _1125;
    float _1141 = _939 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1143 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1135);
    float _1145 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1137);
    float _1147 = -_1133;
    float _1149 = _1147 + 1.0;
    float _1151 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1141);
    float _1153 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1143);
    float _1155 = rsqrt(_1139);
    float _1157 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1145);
    float _1159 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1151);
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1163 = _1157 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1165 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1167 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1169 = abs(_1149);
    float _1171 = log2(_1169);
    float _1173 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1175 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1167);
    float _1177 = -_1173;
    float _1179 = fma(_1177, _949, 1.0);
    float _1181 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1175);
    float _1183 = _1155 * _1097;
    float _1185 = _1155 * _1113;
    float _1187 = _1155 * _1105;
    float _1189 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1181);
    float _1191 = _1183 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1193 = log2(_1179);
    float _1195 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1197 = _1185 + 1.0;
    float _1199 = -_1191;
    float _1201 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1199);
    float _1203 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1205 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1195);
    float _1207 = -_1187;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1201);
    float _1211 = 1.0 / _1189;
    float _1213 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1215 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1205);
    float _1217 = fma(_1209, -0.5, 0.5);
    float _1219 = fma(_1209, 0.5, 0.5);
    float _1221 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1213);
    float _1223 = exp2(_1203);
    float _1225 = fma(_1219, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1227 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1221);
    float _1229 = _1193 * 0.693147182464599609375;
    float _1231 = fma(_1219, _1225, -0.212114393711090087890625);
    float _1233 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1227);
    float _1235 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1215);
    float _1237 = sqrt(_1217);
    float _1239 = fma(_1219, _1231, 1.570728778839111328125);
    float _1241 = _1233 * _1211;
    float _1243 = _1235 * _1211;
    float _1245 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1247 = fma(_1241, 0.5, 0.5);
    float _1249 = fma(_1243, -0.5, 0.5);
    float _1251 = -_1185;
    float _1253 = fma(_1223, _1197, _1251);
    float _1255 = fma(_1253, 0.5, 0.5);
    float _1257 = _1237 * 0.636619746685028076171875;
    float _1259 = -_1239;
    float _1261 = fma(_1257, _1259, 1.0);
    float3 _3371 = float3(_1247, _1249, _1245);
    float _1263 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3371, float3(0.0), isnan(_3371)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3371, float3(0.0), isnan(_3371)), level(0.0)).x;
    float3 _3382 = float3(_1247, _1249, _1245);
    float4 _1266 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3382, float3(0.0), isnan(_3382)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3382, float3(0.0), isnan(_3382)), level(0.0)).xyzw;
    float _1268 = _1266.x;
    float _1270 = _1266.y;
    float _1272 = _1266.z;
    float _1274 = _1266.w;
    float2 _3399 = float2(_1261, _1255);
    float3 _1278 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3399, float2(0.0), isnan(_3399)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3399, float2(0.0), isnan(_3399)), level(0.0)).xyz;
    float _1280 = _1278.x;
    float _1282 = _1278.y;
    float _1284 = _1278.z;
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1288 = _307 > 0.5;
    float _1290 = -_679;
    float _1292 = _395 + _1290;
    bool _1294 = _309 > 0.5;
    out.m_60.x = _769;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1298 = _1296 != 0;
    float _1300 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1304 = _1302 != 0;
    float _1306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1308 = -_753;
    int _1310 = _1288 ? as_type<int>(_1308) : as_type<int>(_753);
    out.m_62.w = _615;
    float _1312 = -_743;
    int _1314 = _1294 ? as_type<int>(_1312) : as_type<int>(_743);
    bool _1316 = !_1298;
    float _1318 = _1316 ? _753 : as_type<float>(_1310);
    bool _1320 = !_1304;
    float _1322 = _1320 ? _743 : as_type<float>(_1314);
    float _1324 = exp2(_1300);
    float _1326 = _1318 + 0.5;
    float _1328 = -_1322;
    float _1330 = _1328 + 0.5;
    float _1332 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1334 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1338 = _1332 * _1286;
    float _1340 = -_651;
    float _1342 = _379 + _1340;
    float _1344 = _1334 * _1306;
    float _1346 = -_637;
    float _1348 = _361 + _1346;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1356 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1358 = _1336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1356);
    float _1366 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_64.x = _1338;
    out.m_64.y = _1344;
    float _1368 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1364);
    float _1370 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1366);
    out.m_66.x = _1358;
    out.m_66.y = _1360;
    out.m_66.z = _1362;
    out.m_66.w = _1354;
    float _1372 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_68.x = _1342;
    out.m_68.y = _1348;
    out.m_68.z = _1292;
    bool _1374 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1376 = isnan(0.5);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1382 = _1378 || _1380;
    float _1384 = 1.0 / _1372;
    float _1386 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1370);
    float _1388 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1396 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1398 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1388);
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1402 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1406 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1396 + _1372;
    float _1410 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1398);
    if (_1382)
    {
        _641 = 1.0;
    }
    float _1412 = _641;
    out.m_70.x = _1402;
    out.m_70.y = _1404;
    out.m_70.z = _1406;
    out.m_70.w = _1400;
    float _1414 = _1408 * _1384;
    float _1416 = _1414 * 0.5;
    float _1418 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1410);
    float _1420 = _1412;
    if (!_1382)
    {
        float _1422 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1424 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1426 = _1422 * 0.15915493667125701904296875;
        float _1428 = _1424 * 0.15915493667125701904296875;
        float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1432 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1430);
        float _1434 = _1426 * 6.283185482025146484375;
        float _1436 = cos(_1434);
        float _1438 = _1426 * 6.283185482025146484375;
        float _1440 = sin(_1438);
        float _1442 = 1.0 / _1436;
        float _1444 = _1428 * 6.283185482025146484375;
        float _1446 = cos(_1444);
        float _1448 = _1440 * _1442;
        float _1450 = _1428 * 6.283185482025146484375;
        float _1452 = sin(_1450);
        float _1454 = _1446 * _1448;
        float _1456 = 1.0 / _1432;
        float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1460 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1458;
        float _1462 = 1.0 / _1454;
        float _1464 = 1.0 / _1460;
        float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1468 = _1456 * _1466;
        float _1470 = _1452 * _1462;
        float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1474 = fma(_1470, _1468, _1472);
        float _1476 = _1474 * _1464;
        float _1478 = precise::clamp(_1476, 0.0, 1.0);
        _1420 = _1478;
    }
    float _1480 = _1420;
    float _1482 = -_1324;
    float _1484 = _1482 + 1.0;
    float _1486 = _1189 * 0.5;
    bool _1488 = _1480 > 0.0;
    bool _1490 = isnan(_1480);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan(0.0);
    bool _1496 = _1492 || _1494;
    float _1498 = _1480 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1500 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1502 = fma(_1235, -0.5, _1486);
    float _1504 = _1418 + _1189;
    float _1506 = _1233 + _1189;
    float _1508 = _1500 * _1263;
    float _1510 = -_1500;
    float _1512 = _1510 + 1.0;
    out.m_72.x = _943;
    out.m_72.y = _939;
    out.m_72.z = _947;
    float _1514 = _1274 * _1508;
    float _1516 = _1284 * _1508;
    float _1518 = _1504 * 0.5;
    float _1520 = _1506 * 0.5;
    float _1522 = fma(_1280, _1514, _1268);
    float _1524 = fma(_1282, _1514, _1270);
    float _1526 = _1498 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1528 = _1274 * _1512;
    float _1530 = fma(_1274, _1516, _1272);
    out.gl_Position.x = _1233;
    out.gl_Position.y = _1235;
    out.gl_Position.z = _1418;
    out.gl_Position.w = _1189;
    out.m_74.x = _1520;
    out.m_74.y = _1502;
    out.m_74.z = _1518;
    out.m_74.w = _1189;
    out.m_47.x = _1526;
    out.m_76.x = _1522;
    out.m_76.y = _1524;
    out.m_76.z = _1530;
    out.m_76.w = _1528;
    if (_1496)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1532 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1532;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1589 = as_type<float>(_111);
        out.gl_Position.z = _1589;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1659 = as_type<float>(_149);
        out.gl_Position.z = _1659;
    }
    if (_141)
    {
        return out;
    }
    float _151 = in.m_51.w;
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_49.x;
    float _167 = in.m_49.y;
    float _169 = in.m_49.z;
    float _171 = in.m_44.x;
    float _173 = in.m_44.y;
    float _175 = in.m_44.z;
    float _177 = 0.0;
    float _179 = _153;
    if (!_163)
    {
        float _181 = _153 * _153;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_163;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _153 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _153);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_163;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _165, _255);
    float _263 = fma(_251, _167, _257);
    float _265 = fma(_251, _169, _259);
    float _267 = fma(_261, _151, _171);
    float _269 = fma(_263, _151, _173);
    float _271 = fma(_265, _151, _175);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_53.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_95);
        float _297 = 1.0 / _295;
        float _299 = _129 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = in.m_53.z;
    float _305 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _307 = in.m_53.x;
    float _309 = in.m_53.y;
    float _311 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _313 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _317 = _315 != 0;
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _321 = _319 != 0;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _325 = _323 != 0;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _305);
    float _333 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _311);
    float _335 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _313);
    float _337 = 1.0 / _329;
    float _339 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _331);
    float _341 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _333);
    float _343 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _335);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _301 + _345;
    bool _349 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_301);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = _341 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _363 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _365 = isnan(_301);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _377 = log2(_375);
    float _379 = _339 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _383 = _361 + _381;
    bool _385 = !_317;
    int _387 = _385 ? 0 : 1;
    float _389 = _303 * 2.0;
    float _391 = -_373;
    float _393 = _391 + 1.0;
    float _395 = _343 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _399 = _379 + _397;
    float _401 = _309 * 2.0;
    float _403 = _307 * 2.0;
    float _405 = floor(_389);
    float _407 = _309 + _303;
    float _409 = _347 * _337;
    float _411 = _309 + _307;
    float _413 = _407 + (-1.0);
    float _415 = _377 * _129;
    float _417 = _411 + (-1.0);
    float _419 = floor(_401);
    int _421 = abs(_387);
    float _423 = _359 * _393;
    float _425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _427 = _395 + _425;
    float _429 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _431 = -_359;
    float _433 = _431 + 1.0;
    bool _435 = _405 > 0.0;
    float _437 = floor(_403);
    bool _439 = _405 >= 0.0;
    bool _441 = isnan(_405);
    bool _443 = _439 || _441;
    bool _445 = isnan(0.0);
    bool _447 = _443 || _445;
    int _449 = _447 ? 0 : 1;
    bool _451 = _419 >= 0.0;
    bool _453 = isnan(_419);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _463 = ~_449;
    int _465 = _463 + 1;
    int _467 = _465 + 1;
    float _469 = exp2(_415);
    float _471 = in.m_55.x;
    float _473 = in.m_55.y;
    float _475 = in.m_55.z;
    int _477 = _467;
    if (!_435)
    {
        int _479 = ~_449;
        int _481 = _479 + 1;
        _477 = _481;
    }
    int _483 = _477;
    bool _485 = _419 > 0.0;
    bool _487 = _437 > 0.0;
    bool _489 = _437 >= 0.0;
    bool _491 = isnan(_437);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _499;
    float _503 = in.m_51.x;
    float _505 = in.m_51.y;
    float _507 = fma(_501, _409, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _509 = _383 * _383;
    float _511 = float(_483);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _515 = 1.0 + _513;
    bool _517 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _519 = isnan(1.0);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _525 = _521 || _523;
    float _527 = fma(_399, _399, _509);
    float _529 = _507 * _423;
    float _531 = 1.0 / _515;
    int _533 = _497 ? 0 : 1;
    float _535 = fma(_427, _427, _527);
    float _537 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].x, _529);
    float _539 = -_469;
    float _541 = _539 + 1.0;
    bool _543 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _551 = _547 || _549;
    float _553 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[144].x, _537);
    float _555 = sqrt(_535);
    float _557 = float(_421);
    bool _559 = !_325;
    int _561 = _559 ? 0 : 1;
    int _563 = ~_533;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    float _569 = _557 * _511;
    bool _571 = !_321;
    int _573 = _571 ? 0 : 1;
    float _575 = _553 * _503;
    int _577 = _567;
    if (!_487)
    {
        int _579 = ~_533;
        int _581 = _579 + 1;
        _577 = _581;
    }
    int _583 = _577;
    float _585 = rsqrt(_535);
    int _587 = abs(_573);
    float _589 = _575 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _591 = _551 ? _541 : 0.0;
    float _593 = _569 * (-2.0);
    int _595 = abs(_561);
    float _597 = _555 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _599 = _589 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _601 = fma(_593, _471, _471);
    if (_525)
    {
        float _603 = _591 * _531;
        _131 = _603;
    }
    float _605 = _131;
    float _607 = float(_587);
    float _609 = fma(_429, _593, _429);
    float _611 = float(_583);
    float _613 = _307 + (-0.5);
    float _615 = precise::min(_599, _597);
    float _617 = _309 + (-0.5);
    int _619 = _459 ? 0 : 1;
    float _621 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[196].x, _601);
    float _623 = _607 * _611;
    float _625 = _585 * _615;
    int _627 = ~_619;
    int _629 = _627 + 1;
    int _631 = _629 + 1;
    float _633 = fma(_609, _605, _621);
    float _635 = _623 * (-2.0);
    float _637 = _383 * _625;
    int _639 = _631;
    float _641 = _615;
    if (!_485)
    {
        int _643 = ~_619;
        int _645 = _643 + 1;
        _639 = _645;
    }
    int _647 = _639;
    float _649 = _633 * 0.15915493667125701904296875;
    float _651 = _399 * _625;
    float _653 = -_637;
    float _655 = _383 + _653;
    float _657 = fma(_635, _473, _473);
    float _659 = fma(_461, _635, _461);
    float _661 = float(_595);
    float _663 = -_651;
    float _665 = _399 + _663;
    float _667 = float(_647);
    float _669 = _655 * _655;
    float _671 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[196].y, _657);
    float _673 = as_type<float>(int(gl_VertexIndex));
    float _675 = fma(_665, _665, _669);
    float _677 = _661 * _667;
    float _679 = _427 * _625;
    float _681 = _303 + _307;
    float _683 = _303 + (-0.5);
    float _685 = _677 * (-2.0);
    float _687 = -_679;
    float _689 = _427 + _687;
    float _691 = _681 + (-1.0);
    float _693 = _649 * 6.283185482025146484375;
    float _695 = sin(_693);
    float _697 = fma(_689, _689, _675);
    float _699 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _701 = fma(_685, _475, _475);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _703;
    float _707 = fma(_659, _605, _671);
    float _709 = fma(_699, _685, _699);
    float _711 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[196].z, _701);
    float _713 = fma(_705, _409, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _715 = _649 * 6.283185482025146484375;
    float _717 = cos(_715);
    float _719 = _707 * 0.15915493667125701904296875;
    float _721 = fma(_709, _605, _711);
    float _723 = _713 * _423;
    int _725 = as_type<int>(_673) & 1;
    bool _727 = _725 != 0;
    int _729 = as_type<int>(_673) & 2;
    bool _731 = _729 != 0;
    float _733 = _721 * 0.15915493667125701904296875;
    float _735 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].y, _723);
    float _737 = sqrt(_697);
    float _739 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[144].y, _735);
    bool _741 = !_731;
    float _743 = _741 ? (-0.5) : 0.5;
    float _745 = _739 * _505;
    float _747 = _719 * 6.283185482025146484375;
    float _749 = sin(_747);
    bool _751 = !_727;
    float _753 = _751 ? (-0.5) : 0.5;
    float _755 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _743);
    float _757 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _753);
    float _761 = _719 * 6.283185482025146484375;
    float _763 = cos(_761);
    float _765 = _585 * _737;
    float _767 = _757 * _765;
    float _769 = _589 * _765;
    float _771 = _765 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _773 = _771 * 0.5;
    float _775 = _733 * 6.283185482025146484375;
    float _777 = cos(_775);
    float _779 = _767 * _755;
    float _781 = _695 * _749;
    float _783 = _769 * _759;
    float _785 = _733 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = _717 * _763;
    float _791 = _777 * _779;
    float _793 = _717 * _749;
    float _795 = _749 * _777;
    float _797 = _717 * _791;
    float _799 = _695 * _763;
    float _801 = _763 * _777;
    float _803 = _695 * _791;
    float _805 = fma(_787, _789, _781);
    float _807 = -_799;
    float _809 = fma(_787, _793, _807);
    float _811 = -_793;
    float _813 = fma(_787, _799, _811);
    float _815 = fma(_805, _783, _797);
    float _817 = -_779;
    float _819 = _787 * _817;
    float _821 = fma(_787, _781, _789);
    float _823 = fma(_813, _783, _803);
    float _825 = fma(_809, _773, _815);
    float _827 = fma(_801, _783, _819);
    float _829 = fma(_821, _773, _823);
    float _831 = _825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _833 = fma(_795, _773, _827);
    float _835 = _825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _837 = _825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _839 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _831);
    float _841 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _835);
    float _843 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _837);
    float _845 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[24].z, _839);
    float _847 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[26].z, _841);
    float _849 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[25].z, _843);
    float _851 = _845 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _853 = _847 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _855 = _849 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _857 = _379 + _851;
    float _859 = _395 + _853;
    float _861 = _361 + _855;
    float _863 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _865 = _857 + _863;
    float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _869 = _859 + _867;
    float _871 = _869 * _869;
    float _873 = fma(_865, _865, _871);
    float _875 = sqrt(_873);
    bool _877 = _875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _879 = _849;
    float _881 = _871;
    float _883 = _857;
    if (!_877)
    {
        _879 = _859;
    }
    float _885 = _879;
    float _887 = _885;
    if (!_877)
    {
        _881 = _861;
    }
    float _889 = _881;
    bool _891 = !_877;
    float _893 = _889;
    if (!_891)
    {
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _897 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _899 = _875 + _897;
        float _901 = _861 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _903 = _899 * _895;
        float _905 = rsqrt(_873);
        float _907 = _903 * 0.15915493667125701904296875;
        float _909 = _907 * 6.283185482025146484375;
        float _911 = sin(_909);
        float _913 = _907 * 6.283185482025146484375;
        float _915 = cos(_913);
        float _917 = fma(_911, _901, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _919 = _905 * _917;
        float _921 = _915 + (-1.0);
        float _923 = _921 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _925 = fma(_865, _919, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _927 = fma(_869, _919, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _929 = fma(_861, _915, _923);
        _893 = _929;
        _883 = _925;
        _887 = _927;
    }
    float _931 = _893;
    float _933 = _883;
    float _935 = _887;
    float _937 = -_637;
    float _939 = _937 + _931;
    float _941 = -_651;
    float _943 = _941 + _933;
    float _945 = -_679;
    float _947 = _945 + _935;
    float _949 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _953 = _939 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _957 = _943 + _955;
    float _959 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _961 = _947 + _959;
    float _963 = _939 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _965 = _953 * _953;
    float _967 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[3].x, _963);
    float _969 = fma(_957, _957, _965);
    float _971 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[3].z, _967);
    float _973 = fma(_961, _961, _969);
    float _975 = _971 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _977 = rsqrt(_973);
    float _979 = sqrt(_973);
    float _981 = _977 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _983 = _957 * _981;
    float _985 = _961 * _981;
    float _987 = _983 * _983;
    float _989 = _985 * _985;
    float _991 = _987 + _989;
    float _993 = sqrt(_991);
    bool _995 = _993 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _997 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _999 = _993 + _997;
    float _1001 = _961;
    float _1003 = _991;
    float _1005 = _999;
    float _1007 = _965;
    float _1009 = _981;
    if (_995)
    {
        float _1011 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1001 = _1011;
    }
    float _1013 = _1001;
    if (_995)
    {
        float _1015 = rsqrt(_991);
        _1003 = _1015;
    }
    float _1017 = _1003;
    float _1019 = _1017;
    if (_995)
    {
        float _1021 = _999 * _1013;
        _1005 = _1021;
    }
    float _1023 = _1005;
    if (_995)
    {
        float _1025 = _1023 * 0.15915493667125701904296875;
        _1007 = _1025;
    }
    float _1027 = _1007;
    float _1029 = _1013;
    float _1031 = _1027;
    if (_995)
    {
        float _1033 = _1027 * 6.283185482025146484375;
        float _1035 = sin(_1033);
        _1029 = _1035;
    }
    float _1037 = _1029;
    float _1039 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1041 = precise::max(0.0, _1039);
    float _1043 = _869;
    float _1045 = _1041;
    if (_995)
    {
        float _1047 = _1027 * 6.283185482025146484375;
        float _1049 = cos(_1047);
        _1043 = _1049;
    }
    float _1051 = _1043;
    float _1053 = -_981;
    float _1055 = -_1041;
    float _1057 = fma(_953, _1053, _1055);
    float _1059 = _1057;
    if (_995)
    {
        float _1061 = _1057 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1045 = _1061;
    }
    float _1063 = _1045;
    float _1065 = _1037;
    float _1067 = _1063;
    if (_995)
    {
        float _1069 = fma(_1037, _1063, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1065 = _1069;
    }
    float _1071 = _1065;
    float _1073 = _1071;
    float _1075 = _1051;
    if (_995)
    {
        float _1077 = _1051 + (-1.0);
        _1067 = _1077;
    }
    float _1079 = _1067;
    float _1081 = _1079;
    if (_995)
    {
        float _1083 = _1017 * _1071;
        _1009 = _1083;
    }
    float _1085 = _1009;
    if (!_995)
    {
        _1073 = _983;
    }
    float _1087 = _1073;
    float _1089 = _1087;
    if (_995)
    {
        float _1091 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1031 = _1091;
    }
    float _1093 = _1031;
    if (_995)
    {
        float _1095 = _983 * _1085;
        _1089 = _1095;
    }
    float _1097 = _1089;
    if (!_995)
    {
        _1081 = _985;
    }
    float _1099 = _1081;
    float _1101 = _1099;
    if (_995)
    {
        float _1103 = _985 * _1085;
        _1101 = _1103;
    }
    float _1105 = _1101;
    if (!_995)
    {
        _1019 = _987;
    }
    float _1107 = _1019;
    float _1109 = _1107;
    if (_995)
    {
        float _1111 = fma(_1057, _1051, _1093);
        _1059 = _1111;
    }
    float _1113 = _1059;
    if (_995)
    {
        float _1115 = _1097 * _1097;
        _1109 = _1115;
    }
    float _1117 = _1109;
    if (!_995)
    {
        _1075 = _989;
    }
    float _1119 = _1075;
    float _1121 = _1119;
    if (_995)
    {
        float _1123 = _1105 * _1105;
        _1121 = _1123;
    }
    float _1125 = _1121;
    float _1127 = fma(_1113, _1113, _1117);
    float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1131 = fma(_979, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1129);
    float _1133 = precise::clamp(_1131, 0.0, 1.0);
    float _1135 = _939 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1137 = _939 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1139 = _1127 + _1125;
    float _1141 = _939 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1143 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1135);
    float _1145 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1137);
    float _1147 = -_1133;
    float _1149 = _1147 + 1.0;
    float _1151 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1141);
    float _1153 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1143);
    float _1155 = rsqrt(_1139);
    float _1157 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1145);
    float _1159 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1151);
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1163 = _1157 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1165 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1167 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1169 = abs(_1149);
    float _1171 = log2(_1169);
    float _1173 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1175 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1167);
    float _1177 = -_1173;
    float _1179 = fma(_1177, _949, 1.0);
    float _1181 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1175);
    float _1183 = _1155 * _1097;
    float _1185 = _1155 * _1113;
    float _1187 = _1155 * _1105;
    float _1189 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1181);
    float _1191 = _1183 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1193 = log2(_1179);
    float _1195 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1197 = _1185 + 1.0;
    float _1199 = -_1191;
    float _1201 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1199);
    float _1203 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1205 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1195);
    float _1207 = -_1187;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1201);
    float _1211 = 1.0 / _1189;
    float _1213 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1215 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1205);
    float _1217 = fma(_1209, -0.5, 0.5);
    float _1219 = fma(_1209, 0.5, 0.5);
    float _1221 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1213);
    float _1223 = exp2(_1203);
    float _1225 = fma(_1219, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1227 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1221);
    float _1229 = _1193 * 0.693147182464599609375;
    float _1231 = fma(_1219, _1225, -0.212114393711090087890625);
    float _1233 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1227);
    float _1235 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1215);
    float _1237 = sqrt(_1217);
    float _1239 = fma(_1219, _1231, 1.570728778839111328125);
    float _1241 = _1233 * _1211;
    float _1243 = _1235 * _1211;
    float _1245 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1247 = fma(_1241, 0.5, 0.5);
    float _1249 = fma(_1243, -0.5, 0.5);
    float _1251 = -_1185;
    float _1253 = fma(_1223, _1197, _1251);
    float _1255 = fma(_1253, 0.5, 0.5);
    float _1257 = _1237 * 0.636619746685028076171875;
    float _1259 = -_1239;
    float _1261 = fma(_1257, _1259, 1.0);
    float3 _3371 = float3(_1247, _1249, _1245);
    float _1263 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3371, float3(0.0), isnan(_3371)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3371, float3(0.0), isnan(_3371)), level(0.0)).x;
    float3 _3382 = float3(_1247, _1249, _1245);
    float4 _1266 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3382, float3(0.0), isnan(_3382)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3382, float3(0.0), isnan(_3382)), level(0.0)).xyzw;
    float _1268 = _1266.x;
    float _1270 = _1266.y;
    float _1272 = _1266.z;
    float _1274 = _1266.w;
    float2 _3399 = float2(_1261, _1255);
    float3 _1278 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3399, float2(0.0), isnan(_3399)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3399, float2(0.0), isnan(_3399)), level(0.0)).xyz;
    float _1280 = _1278.x;
    float _1282 = _1278.y;
    float _1284 = _1278.z;
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1288 = _307 > 0.5;
    float _1290 = -_679;
    float _1292 = _395 + _1290;
    bool _1294 = _309 > 0.5;
    out.m_60.x = _769;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1298 = _1296 != 0;
    float _1300 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1304 = _1302 != 0;
    float _1306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1308 = -_753;
    int _1310 = _1288 ? as_type<int>(_1308) : as_type<int>(_753);
    out.m_62.w = _615;
    float _1312 = -_743;
    int _1314 = _1294 ? as_type<int>(_1312) : as_type<int>(_743);
    bool _1316 = !_1298;
    float _1318 = _1316 ? _753 : as_type<float>(_1310);
    bool _1320 = !_1304;
    float _1322 = _1320 ? _743 : as_type<float>(_1314);
    float _1324 = exp2(_1300);
    float _1326 = _1318 + 0.5;
    float _1328 = -_1322;
    float _1330 = _1328 + 0.5;
    float _1332 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1334 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1338 = _1332 * _1286;
    float _1340 = -_651;
    float _1342 = _379 + _1340;
    float _1344 = _1334 * _1306;
    float _1346 = -_637;
    float _1348 = _361 + _1346;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1356 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1358 = _1336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1356);
    float _1366 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_64.x = _1338;
    out.m_64.y = _1344;
    float _1368 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1364);
    float _1370 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1366);
    out.m_66.x = _1358;
    out.m_66.y = _1360;
    out.m_66.z = _1362;
    out.m_66.w = _1354;
    float _1372 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_68.x = _1342;
    out.m_68.y = _1348;
    out.m_68.z = _1292;
    bool _1374 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1376 = isnan(0.5);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1382 = _1378 || _1380;
    float _1384 = 1.0 / _1372;
    float _1386 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1370);
    float _1388 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1396 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1398 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1388);
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1402 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1406 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1396 + _1372;
    float _1410 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1398);
    if (_1382)
    {
        _641 = 1.0;
    }
    float _1412 = _641;
    out.m_70.x = _1402;
    out.m_70.y = _1404;
    out.m_70.z = _1406;
    out.m_70.w = _1400;
    float _1414 = _1408 * _1384;
    float _1416 = _1414 * 0.5;
    float _1418 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1410);
    float _1420 = _1412;
    if (!_1382)
    {
        float _1422 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1424 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1426 = _1422 * 0.15915493667125701904296875;
        float _1428 = _1424 * 0.15915493667125701904296875;
        float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1432 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1430);
        float _1434 = _1426 * 6.283185482025146484375;
        float _1436 = cos(_1434);
        float _1438 = _1426 * 6.283185482025146484375;
        float _1440 = sin(_1438);
        float _1442 = 1.0 / _1436;
        float _1444 = _1428 * 6.283185482025146484375;
        float _1446 = cos(_1444);
        float _1448 = _1440 * _1442;
        float _1450 = _1428 * 6.283185482025146484375;
        float _1452 = sin(_1450);
        float _1454 = _1446 * _1448;
        float _1456 = 1.0 / _1432;
        float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1460 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1458;
        float _1462 = 1.0 / _1454;
        float _1464 = 1.0 / _1460;
        float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1468 = _1456 * _1466;
        float _1470 = _1452 * _1462;
        float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1474 = fma(_1470, _1468, _1472);
        float _1476 = _1474 * _1464;
        float _1478 = precise::clamp(_1476, 0.0, 1.0);
        _1420 = _1478;
    }
    float _1480 = _1420;
    float _1482 = -_1324;
    float _1484 = _1482 + 1.0;
    float _1486 = _1189 * 0.5;
    bool _1488 = _1480 > 0.0;
    bool _1490 = isnan(_1480);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan(0.0);
    bool _1496 = _1492 || _1494;
    float _1498 = _1480 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1500 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1502 = fma(_1235, -0.5, _1486);
    float _1504 = _1418 + _1189;
    float _1506 = _1233 + _1189;
    float _1508 = _1500 * _1263;
    float _1510 = -_1500;
    float _1512 = _1510 + 1.0;
    out.m_72.x = _943;
    out.m_72.y = _939;
    out.m_72.z = _947;
    float _1514 = _1274 * _1508;
    float _1516 = _1284 * _1508;
    float _1518 = _1504 * 0.5;
    float _1520 = _1506 * 0.5;
    float _1522 = fma(_1280, _1514, _1268);
    float _1524 = fma(_1282, _1514, _1270);
    float _1526 = _1498 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1528 = _1274 * _1512;
    float _1530 = fma(_1274, _1516, _1272);
    out.gl_Position.x = _1233;
    out.gl_Position.y = _1235;
    out.gl_Position.z = _1418;
    out.gl_Position.w = _1189;
    out.m_74.x = _1520;
    out.m_74.y = _1502;
    out.m_74.z = _1518;
    out.m_74.w = _1189;
    out.m_47.x = _1526;
    out.m_76.x = _1522;
    out.m_76.y = _1524;
    out.m_76.z = _1530;
    out.m_76.w = _1528;
    if (_1496)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1532 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1532;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _293 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1589 = as_type<float>(_111);
        out.gl_Position.z = _1589;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1659 = as_type<float>(_149);
        out.gl_Position.z = _1659;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_51.w;
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = in.m_49.x;
    float _167 = in.m_49.y;
    float _169 = in.m_49.z;
    float _171 = in.m_44.x;
    float _173 = in.m_44.y;
    float _175 = in.m_44.z;
    float _177 = 0.0;
    float _179 = _153;
    if (!_163)
    {
        float _181 = _153 * _153;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    float _187 = _185;
    if (!_163)
    {
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _187 = _189;
    }
    float _191 = _187;
    bool _193 = !_163;
    float _195 = _191;
    if (!_193)
    {
        float _197 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _199 = log2(_197);
        float _201 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _203 = _201 + 1.0;
        float _205 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = _153 * _199;
        float _209 = 1.0 / _203;
        float _211 = _205 * 0.693147182464599609375;
        float _213 = exp2(_207);
        float _215 = 1.0 / _211;
        float _217 = _213 + (-1.0);
        float _219 = -_217;
        float _221 = fma(_219, _215, _153);
        float _223 = _221 * _209;
        float _225 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _195 = _225;
    }
    float _227 = _195;
    bool _229 = !_163;
    if (!_229)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = 1.0 / _237;
        float _241 = _153 * _233;
        float _243 = exp2(_241);
        float _245 = -_243;
        float _247 = _245 + 1.0;
        float _249 = _247 * _239;
        _179 = _249;
    }
    float _251 = _179;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _255 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _257 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _261 = fma(_251, _165, _255);
    float _263 = fma(_251, _167, _257);
    float _265 = fma(_251, _169, _259);
    float _267 = fma(_261, _151, _171);
    float _269 = fma(_263, _151, _173);
    float _271 = fma(_265, _151, _175);
    bool _273 = !_253;
    float _291;
    if (!_273)
    {
        float _275 = in.m_53.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_95);
        float _297 = 1.0 / _295;
        float _299 = _129 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = in.m_53.z;
    float _305 = _269 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _307 = in.m_53.x;
    float _309 = in.m_53.y;
    float _311 = _269 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _313 = _269 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _317 = _315 != 0;
    int _319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _321 = _319 != 0;
    int _323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _325 = _323 != 0;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].x, _305);
    float _333 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].x, _311);
    float _335 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].x, _313);
    float _337 = 1.0 / _329;
    float _339 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[4].z, _331);
    float _341 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[5].z, _333);
    float _343 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[6].z, _335);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _301 + _345;
    bool _349 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _351 = isnan(_301);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = _341 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _363 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _365 = isnan(_301);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _377 = log2(_375);
    float _379 = _339 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _383 = _361 + _381;
    bool _385 = !_317;
    int _387 = _385 ? 0 : 1;
    float _389 = _303 * 2.0;
    float _391 = -_373;
    float _393 = _391 + 1.0;
    float _395 = _343 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _397 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _399 = _379 + _397;
    float _401 = _309 * 2.0;
    float _403 = _307 * 2.0;
    float _405 = floor(_389);
    float _407 = _309 + _303;
    float _409 = _347 * _337;
    float _411 = _309 + _307;
    float _413 = _407 + (-1.0);
    float _415 = _377 * _129;
    float _417 = _411 + (-1.0);
    float _419 = floor(_401);
    int _421 = abs(_387);
    float _423 = _359 * _393;
    float _425 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _427 = _395 + _425;
    float _429 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _431 = -_359;
    float _433 = _431 + 1.0;
    bool _435 = _405 > 0.0;
    float _437 = floor(_403);
    bool _439 = _405 >= 0.0;
    bool _441 = isnan(_405);
    bool _443 = _439 || _441;
    bool _445 = isnan(0.0);
    bool _447 = _443 || _445;
    int _449 = _447 ? 0 : 1;
    bool _451 = _419 >= 0.0;
    bool _453 = isnan(_419);
    bool _455 = _451 || _453;
    bool _457 = isnan(0.0);
    bool _459 = _455 || _457;
    float _461 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _463 = ~_449;
    int _465 = _463 + 1;
    int _467 = _465 + 1;
    float _469 = exp2(_415);
    float _471 = in.m_55.x;
    float _473 = in.m_55.y;
    float _475 = in.m_55.z;
    int _477 = _467;
    if (!_435)
    {
        int _479 = ~_449;
        int _481 = _479 + 1;
        _477 = _481;
    }
    int _483 = _477;
    bool _485 = _419 > 0.0;
    bool _487 = _437 > 0.0;
    bool _489 = _437 >= 0.0;
    bool _491 = isnan(_437);
    bool _493 = _489 || _491;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _499;
    float _503 = in.m_51.x;
    float _505 = in.m_51.y;
    float _507 = fma(_501, _409, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _509 = _383 * _383;
    float _511 = float(_483);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _515 = 1.0 + _513;
    bool _517 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _519 = isnan(1.0);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _525 = _521 || _523;
    float _527 = fma(_399, _399, _509);
    float _529 = _507 * _423;
    float _531 = 1.0 / _515;
    int _533 = _497 ? 0 : 1;
    float _535 = fma(_427, _427, _527);
    float _537 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].x, _529);
    float _539 = -_469;
    float _541 = _539 + 1.0;
    bool _543 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _551 = _547 || _549;
    float _553 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[144].x, _537);
    float _555 = sqrt(_535);
    float _557 = float(_421);
    bool _559 = !_325;
    int _561 = _559 ? 0 : 1;
    int _563 = ~_533;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    float _569 = _557 * _511;
    bool _571 = !_321;
    int _573 = _571 ? 0 : 1;
    float _575 = _553 * _503;
    int _577 = _567;
    if (!_487)
    {
        int _579 = ~_533;
        int _581 = _579 + 1;
        _577 = _581;
    }
    int _583 = _577;
    float _585 = rsqrt(_535);
    int _587 = abs(_573);
    float _589 = _575 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _591 = _551 ? _541 : 0.0;
    float _593 = _569 * (-2.0);
    int _595 = abs(_561);
    float _597 = _555 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _599 = _589 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _601 = fma(_593, _471, _471);
    if (_525)
    {
        float _603 = _591 * _531;
        _131 = _603;
    }
    float _605 = _131;
    float _607 = float(_587);
    float _609 = fma(_429, _593, _429);
    float _611 = float(_583);
    float _613 = _307 + (-0.5);
    float _615 = precise::min(_599, _597);
    float _617 = _309 + (-0.5);
    int _619 = _459 ? 0 : 1;
    float _621 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[196].x, _601);
    float _623 = _607 * _611;
    float _625 = _585 * _615;
    int _627 = ~_619;
    int _629 = _627 + 1;
    int _631 = _629 + 1;
    float _633 = fma(_609, _605, _621);
    float _635 = _623 * (-2.0);
    float _637 = _383 * _625;
    int _639 = _631;
    float _641 = _615;
    if (!_485)
    {
        int _643 = ~_619;
        int _645 = _643 + 1;
        _639 = _645;
    }
    int _647 = _639;
    float _649 = _633 * 0.15915493667125701904296875;
    float _651 = _399 * _625;
    float _653 = -_637;
    float _655 = _383 + _653;
    float _657 = fma(_635, _473, _473);
    float _659 = fma(_461, _635, _461);
    float _661 = float(_595);
    float _663 = -_651;
    float _665 = _399 + _663;
    float _667 = float(_647);
    float _669 = _655 * _655;
    float _671 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[196].y, _657);
    float _673 = as_type<float>(int(gl_VertexIndex));
    float _675 = fma(_665, _665, _669);
    float _677 = _661 * _667;
    float _679 = _427 * _625;
    float _681 = _303 + _307;
    float _683 = _303 + (-0.5);
    float _685 = _677 * (-2.0);
    float _687 = -_679;
    float _689 = _427 + _687;
    float _691 = _681 + (-1.0);
    float _693 = _649 * 6.283185482025146484375;
    float _695 = sin(_693);
    float _697 = fma(_689, _689, _675);
    float _699 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _701 = fma(_685, _475, _475);
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _703;
    float _707 = fma(_659, _605, _671);
    float _709 = fma(_699, _685, _699);
    float _711 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[196].z, _701);
    float _713 = fma(_705, _409, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _715 = _649 * 6.283185482025146484375;
    float _717 = cos(_715);
    float _719 = _707 * 0.15915493667125701904296875;
    float _721 = fma(_709, _605, _711);
    float _723 = _713 * _423;
    int _725 = as_type<int>(_673) & 1;
    bool _727 = _725 != 0;
    int _729 = as_type<int>(_673) & 2;
    bool _731 = _729 != 0;
    float _733 = _721 * 0.15915493667125701904296875;
    float _735 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[143].y, _723);
    float _737 = sqrt(_697);
    float _739 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[144].y, _735);
    bool _741 = !_731;
    float _743 = _741 ? (-0.5) : 0.5;
    float _745 = _739 * _505;
    float _747 = _719 * 6.283185482025146484375;
    float _749 = sin(_747);
    bool _751 = !_727;
    float _753 = _751 ? (-0.5) : 0.5;
    float _755 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _743);
    float _757 = _745 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _753);
    float _761 = _719 * 6.283185482025146484375;
    float _763 = cos(_761);
    float _765 = _585 * _737;
    float _767 = _757 * _765;
    float _769 = _589 * _765;
    float _771 = _765 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _773 = _771 * 0.5;
    float _775 = _733 * 6.283185482025146484375;
    float _777 = cos(_775);
    float _779 = _767 * _755;
    float _781 = _695 * _749;
    float _783 = _769 * _759;
    float _785 = _733 * 6.283185482025146484375;
    float _787 = sin(_785);
    float _789 = _717 * _763;
    float _791 = _777 * _779;
    float _793 = _717 * _749;
    float _795 = _749 * _777;
    float _797 = _717 * _791;
    float _799 = _695 * _763;
    float _801 = _763 * _777;
    float _803 = _695 * _791;
    float _805 = fma(_787, _789, _781);
    float _807 = -_799;
    float _809 = fma(_787, _793, _807);
    float _811 = -_793;
    float _813 = fma(_787, _799, _811);
    float _815 = fma(_805, _783, _797);
    float _817 = -_779;
    float _819 = _787 * _817;
    float _821 = fma(_787, _781, _789);
    float _823 = fma(_813, _783, _803);
    float _825 = fma(_809, _773, _815);
    float _827 = fma(_801, _783, _819);
    float _829 = fma(_821, _773, _823);
    float _831 = _825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _833 = fma(_795, _773, _827);
    float _835 = _825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _837 = _825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _839 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _831);
    float _841 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _835);
    float _843 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _837);
    float _845 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[24].z, _839);
    float _847 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[26].z, _841);
    float _849 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[25].z, _843);
    float _851 = _845 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _853 = _847 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _855 = _849 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _857 = _379 + _851;
    float _859 = _395 + _853;
    float _861 = _361 + _855;
    float _863 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _865 = _857 + _863;
    float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _869 = _859 + _867;
    float _871 = _869 * _869;
    float _873 = fma(_865, _865, _871);
    float _875 = sqrt(_873);
    bool _877 = _875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _879 = _849;
    float _881 = _871;
    float _883 = _857;
    if (!_877)
    {
        _879 = _859;
    }
    float _885 = _879;
    float _887 = _885;
    if (!_877)
    {
        _881 = _861;
    }
    float _889 = _881;
    bool _891 = !_877;
    float _893 = _889;
    if (!_891)
    {
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _897 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _899 = _875 + _897;
        float _901 = _861 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _903 = _899 * _895;
        float _905 = rsqrt(_873);
        float _907 = _903 * 0.15915493667125701904296875;
        float _909 = _907 * 6.283185482025146484375;
        float _911 = sin(_909);
        float _913 = _907 * 6.283185482025146484375;
        float _915 = cos(_913);
        float _917 = fma(_911, _901, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _919 = _905 * _917;
        float _921 = _915 + (-1.0);
        float _923 = _921 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _925 = fma(_865, _919, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _927 = fma(_869, _919, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _929 = fma(_861, _915, _923);
        _893 = _929;
        _883 = _925;
        _887 = _927;
    }
    float _931 = _893;
    float _933 = _883;
    float _935 = _887;
    float _937 = -_637;
    float _939 = _937 + _931;
    float _941 = -_651;
    float _943 = _941 + _933;
    float _945 = -_679;
    float _947 = _945 + _935;
    float _949 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _953 = _939 + _951;
    float _955 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _957 = _943 + _955;
    float _959 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _961 = _947 + _959;
    float _963 = _939 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _965 = _953 * _953;
    float _967 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[3].x, _963);
    float _969 = fma(_957, _957, _965);
    float _971 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[3].z, _967);
    float _973 = fma(_961, _961, _969);
    float _975 = _971 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _977 = rsqrt(_973);
    float _979 = sqrt(_973);
    float _981 = _977 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _983 = _957 * _981;
    float _985 = _961 * _981;
    float _987 = _983 * _983;
    float _989 = _985 * _985;
    float _991 = _987 + _989;
    float _993 = sqrt(_991);
    bool _995 = _993 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _997 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _999 = _993 + _997;
    float _1001 = _961;
    float _1003 = _991;
    float _1005 = _999;
    float _1007 = _965;
    float _1009 = _981;
    if (_995)
    {
        float _1011 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1001 = _1011;
    }
    float _1013 = _1001;
    if (_995)
    {
        float _1015 = rsqrt(_991);
        _1003 = _1015;
    }
    float _1017 = _1003;
    float _1019 = _1017;
    if (_995)
    {
        float _1021 = _999 * _1013;
        _1005 = _1021;
    }
    float _1023 = _1005;
    if (_995)
    {
        float _1025 = _1023 * 0.15915493667125701904296875;
        _1007 = _1025;
    }
    float _1027 = _1007;
    float _1029 = _1013;
    float _1031 = _1027;
    if (_995)
    {
        float _1033 = _1027 * 6.283185482025146484375;
        float _1035 = sin(_1033);
        _1029 = _1035;
    }
    float _1037 = _1029;
    float _1039 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1041 = precise::max(0.0, _1039);
    float _1043 = _869;
    float _1045 = _1041;
    if (_995)
    {
        float _1047 = _1027 * 6.283185482025146484375;
        float _1049 = cos(_1047);
        _1043 = _1049;
    }
    float _1051 = _1043;
    float _1053 = -_981;
    float _1055 = -_1041;
    float _1057 = fma(_953, _1053, _1055);
    float _1059 = _1057;
    if (_995)
    {
        float _1061 = _1057 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1045 = _1061;
    }
    float _1063 = _1045;
    float _1065 = _1037;
    float _1067 = _1063;
    if (_995)
    {
        float _1069 = fma(_1037, _1063, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1065 = _1069;
    }
    float _1071 = _1065;
    float _1073 = _1071;
    float _1075 = _1051;
    if (_995)
    {
        float _1077 = _1051 + (-1.0);
        _1067 = _1077;
    }
    float _1079 = _1067;
    float _1081 = _1079;
    if (_995)
    {
        float _1083 = _1017 * _1071;
        _1009 = _1083;
    }
    float _1085 = _1009;
    if (!_995)
    {
        _1073 = _983;
    }
    float _1087 = _1073;
    float _1089 = _1087;
    if (_995)
    {
        float _1091 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1031 = _1091;
    }
    float _1093 = _1031;
    if (_995)
    {
        float _1095 = _983 * _1085;
        _1089 = _1095;
    }
    float _1097 = _1089;
    if (!_995)
    {
        _1081 = _985;
    }
    float _1099 = _1081;
    float _1101 = _1099;
    if (_995)
    {
        float _1103 = _985 * _1085;
        _1101 = _1103;
    }
    float _1105 = _1101;
    if (!_995)
    {
        _1019 = _987;
    }
    float _1107 = _1019;
    float _1109 = _1107;
    if (_995)
    {
        float _1111 = fma(_1057, _1051, _1093);
        _1059 = _1111;
    }
    float _1113 = _1059;
    if (_995)
    {
        float _1115 = _1097 * _1097;
        _1109 = _1115;
    }
    float _1117 = _1109;
    if (!_995)
    {
        _1075 = _989;
    }
    float _1119 = _1075;
    float _1121 = _1119;
    if (_995)
    {
        float _1123 = _1105 * _1105;
        _1121 = _1123;
    }
    float _1125 = _1121;
    float _1127 = fma(_1113, _1113, _1117);
    float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1131 = fma(_979, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1129);
    float _1133 = precise::clamp(_1131, 0.0, 1.0);
    float _1135 = _939 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1137 = _939 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1139 = _1127 + _1125;
    float _1141 = _939 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1143 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1135);
    float _1145 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1137);
    float _1147 = -_1133;
    float _1149 = _1147 + 1.0;
    float _1151 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1141);
    float _1153 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1143);
    float _1155 = rsqrt(_1139);
    float _1157 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1145);
    float _1159 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1151);
    float _1161 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1163 = _1157 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1165 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1167 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1169 = abs(_1149);
    float _1171 = log2(_1169);
    float _1173 = _1163 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1175 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1167);
    float _1177 = -_1173;
    float _1179 = fma(_1177, _949, 1.0);
    float _1181 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1175);
    float _1183 = _1155 * _1097;
    float _1185 = _1155 * _1113;
    float _1187 = _1155 * _1105;
    float _1189 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1181);
    float _1191 = _1183 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1193 = log2(_1179);
    float _1195 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1197 = _1185 + 1.0;
    float _1199 = -_1191;
    float _1201 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1199);
    float _1203 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1205 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1195);
    float _1207 = -_1187;
    float _1209 = fma(_1207, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1201);
    float _1211 = 1.0 / _1189;
    float _1213 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1215 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1205);
    float _1217 = fma(_1209, -0.5, 0.5);
    float _1219 = fma(_1209, 0.5, 0.5);
    float _1221 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1213);
    float _1223 = exp2(_1203);
    float _1225 = fma(_1219, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1227 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1221);
    float _1229 = _1193 * 0.693147182464599609375;
    float _1231 = fma(_1219, _1225, -0.212114393711090087890625);
    float _1233 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1227);
    float _1235 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1215);
    float _1237 = sqrt(_1217);
    float _1239 = fma(_1219, _1231, 1.570728778839111328125);
    float _1241 = _1233 * _1211;
    float _1243 = _1235 * _1211;
    float _1245 = _1229 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1247 = fma(_1241, 0.5, 0.5);
    float _1249 = fma(_1243, -0.5, 0.5);
    float _1251 = -_1185;
    float _1253 = fma(_1223, _1197, _1251);
    float _1255 = fma(_1253, 0.5, 0.5);
    float _1257 = _1237 * 0.636619746685028076171875;
    float _1259 = -_1239;
    float _1261 = fma(_1257, _1259, 1.0);
    float3 _3371 = float3(_1247, _1249, _1245);
    float _1263 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3371, float3(0.0), isnan(_3371)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3371, float3(0.0), isnan(_3371)), level(0.0)).x;
    float3 _3382 = float3(_1247, _1249, _1245);
    float4 _1266 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3382, float3(0.0), isnan(_3382)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3382, float3(0.0), isnan(_3382)), level(0.0)).xyzw;
    float _1268 = _1266.x;
    float _1270 = _1266.y;
    float _1272 = _1266.z;
    float _1274 = _1266.w;
    float2 _3399 = float2(_1261, _1255);
    float3 _1278 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3399, float2(0.0), isnan(_3399)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3399, float2(0.0), isnan(_3399)), level(0.0)).xyz;
    float _1280 = _1278.x;
    float _1282 = _1278.y;
    float _1284 = _1278.z;
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1288 = _307 > 0.5;
    float _1290 = -_679;
    float _1292 = _395 + _1290;
    bool _1294 = _309 > 0.5;
    out.m_60.x = _769;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1298 = _1296 != 0;
    float _1300 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1304 = _1302 != 0;
    float _1306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1308 = -_753;
    int _1310 = _1288 ? as_type<int>(_1308) : as_type<int>(_753);
    out.m_62.w = _615;
    float _1312 = -_743;
    int _1314 = _1294 ? as_type<int>(_1312) : as_type<int>(_743);
    bool _1316 = !_1298;
    float _1318 = _1316 ? _753 : as_type<float>(_1310);
    bool _1320 = !_1304;
    float _1322 = _1320 ? _743 : as_type<float>(_1314);
    float _1324 = exp2(_1300);
    float _1326 = _1318 + 0.5;
    float _1328 = -_1322;
    float _1330 = _1328 + 0.5;
    float _1332 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1334 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1338 = _1332 * _1286;
    float _1340 = -_651;
    float _1342 = _379 + _1340;
    float _1344 = _1334 * _1306;
    float _1346 = -_637;
    float _1348 = _361 + _1346;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1356 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1358 = _1336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1362 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1356);
    float _1366 = _1348 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_64.x = _1338;
    out.m_64.y = _1344;
    float _1368 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1364);
    float _1370 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1366);
    out.m_66.x = _1358;
    out.m_66.y = _1360;
    out.m_66.z = _1362;
    out.m_66.w = _1354;
    float _1372 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_68.x = _1342;
    out.m_68.y = _1348;
    out.m_68.z = _1292;
    bool _1374 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1376 = isnan(0.5);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1382 = _1378 || _1380;
    float _1384 = 1.0 / _1372;
    float _1386 = fma(_1292, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1370);
    float _1388 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1396 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1398 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1388);
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1402 = _1390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1406 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1408 = _1396 + _1372;
    float _1410 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1398);
    if (_1382)
    {
        _641 = 1.0;
    }
    float _1412 = _641;
    out.m_70.x = _1402;
    out.m_70.y = _1404;
    out.m_70.z = _1406;
    out.m_70.w = _1400;
    float _1414 = _1408 * _1384;
    float _1416 = _1414 * 0.5;
    float _1418 = fma(_975, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1410);
    float _1420 = _1412;
    if (!_1382)
    {
        float _1422 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1424 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1426 = _1422 * 0.15915493667125701904296875;
        float _1428 = _1424 * 0.15915493667125701904296875;
        float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1432 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1430);
        float _1434 = _1426 * 6.283185482025146484375;
        float _1436 = cos(_1434);
        float _1438 = _1426 * 6.283185482025146484375;
        float _1440 = sin(_1438);
        float _1442 = 1.0 / _1436;
        float _1444 = _1428 * 6.283185482025146484375;
        float _1446 = cos(_1444);
        float _1448 = _1440 * _1442;
        float _1450 = _1428 * 6.283185482025146484375;
        float _1452 = sin(_1450);
        float _1454 = _1446 * _1448;
        float _1456 = 1.0 / _1432;
        float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1460 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1458;
        float _1462 = 1.0 / _1454;
        float _1464 = 1.0 / _1460;
        float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1468 = _1456 * _1466;
        float _1470 = _1452 * _1462;
        float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1474 = fma(_1470, _1468, _1472);
        float _1476 = _1474 * _1464;
        float _1478 = precise::clamp(_1476, 0.0, 1.0);
        _1420 = _1478;
    }
    float _1480 = _1420;
    float _1482 = -_1324;
    float _1484 = _1482 + 1.0;
    float _1486 = _1189 * 0.5;
    bool _1488 = _1480 > 0.0;
    bool _1490 = isnan(_1480);
    bool _1492 = _1488 || _1490;
    bool _1494 = isnan(0.0);
    bool _1496 = _1492 || _1494;
    float _1498 = _1480 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1500 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1502 = fma(_1235, -0.5, _1486);
    float _1504 = _1418 + _1189;
    float _1506 = _1233 + _1189;
    float _1508 = _1500 * _1263;
    float _1510 = -_1500;
    float _1512 = _1510 + 1.0;
    out.m_72.x = _943;
    out.m_72.y = _939;
    out.m_72.z = _947;
    float _1514 = _1274 * _1508;
    float _1516 = _1284 * _1508;
    float _1518 = _1504 * 0.5;
    float _1520 = _1506 * 0.5;
    float _1522 = fma(_1280, _1514, _1268);
    float _1524 = fma(_1282, _1514, _1270);
    float _1526 = _1498 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1528 = _1274 * _1512;
    float _1530 = fma(_1274, _1516, _1272);
    out.gl_Position.x = _1233;
    out.gl_Position.y = _1235;
    out.gl_Position.z = _1418;
    out.gl_Position.w = _1189;
    out.m_74.x = _1520;
    out.m_74.y = _1502;
    out.m_74.z = _1518;
    out.m_74.w = _1189;
    out.m_47.x = _1526;
    out.m_76.x = _1522;
    out.m_76.y = _1524;
    out.m_76.z = _1530;
    out.m_76.w = _1528;
    if (_1496)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1532 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1532;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

