#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_14 [[id(12)]];
    sampler vp_t_tcb_14Smplr [[id(13)]];
    sampler vp_t_tcb_28Smplr_w [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_14Smplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_80 [[user(locn0)]];
    float4 m_92 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_98 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_96 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(0)]];
    float4 m_58 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_62 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_54 [[attribute(7)]];
    float4 m_78 [[attribute(8)]];
    float4 m_68 [[attribute(9)]];
    float4 m_64 [[attribute(10)]];
    float4 m_72 [[attribute(11)]];
    float4 m_76 [[attribute(12)]];
    float4 m_70 [[attribute(13)]];
    float4 m_66 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2126 = false;
    bool _339 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_49.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_52.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2411 = as_type<float>(_133);
        out.gl_Position.z = _2411;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_54.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    if (_147)
    {
        float _155 = float(_117);
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    if (_163)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_163)
    {
        out.m_52.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _135 = as_type<int>(_167);
    }
    int _169 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2479 = as_type<float>(_169);
        out.gl_Position.z = _2479;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = in.m_56.z;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = in.m_56.y;
    float _177 = in.m_58.z;
    float _179 = in.m_58.y;
    float _181 = in.m_60.z;
    float _183 = in.m_60.y;
    float _185 = _171 * _171;
    float _187 = in.m_58.x;
    float _189 = _175 * _175;
    float _191 = in.m_60.x;
    float _193 = fma(_177, _177, _185);
    float _195 = in.m_56.x;
    float _197 = fma(_179, _179, _189);
    float _199 = fma(_181, _181, _193);
    float _201 = fma(_183, _183, _197);
    float _203 = sqrt(_199);
    float _205 = in.m_62.x;
    float _207 = in.m_62.y;
    float _209 = in.m_62.z;
    float _211 = sqrt(_201);
    bool _213 = _203 > 0.0;
    bool _215 = _211 > 0.0;
    float _217 = _179 * _207;
    float _219 = _183 * _207;
    float _221 = _175 * _207;
    float _223 = _199;
    float _225 = _221;
    float _227 = _195;
    float _229 = _205;
    float _231 = _175;
    if (_213)
    {
        float _233 = rsqrt(_199);
        _223 = _233;
    }
    float _235 = _223;
    float _237 = fma(_205, _187, _217);
    float _239 = fma(_205, _191, _219);
    float _241 = fma(_205, _195, _221);
    float _243 = fma(_177, _209, _237);
    float _245 = fma(_181, _209, _239);
    float _247 = _237;
    float _249 = _239;
    if (!_213)
    {
        _247 = 0.0;
    }
    float _251 = _247;
    float _253 = 0.0;
    float _255 = _251;
    if (_215)
    {
        float _257 = rsqrt(_201);
        _253 = _257;
    }
    float _259 = _253;
    if (!_215)
    {
        _225 = 0.0;
    }
    float _261 = _225;
    float _263 = fma(_171, _209, _241);
    float _265 = _261;
    if (!_215)
    {
        _227 = 0.0;
    }
    float _267 = _227;
    float _269 = 0.0;
    float _271 = _267;
    if (!_215)
    {
        _269 = 0.0;
    }
    float _273 = _269;
    float _275 = _273;
    if (!_213)
    {
        _249 = 0.0;
    }
    float _277 = _249;
    float _279 = _277;
    if (_213)
    {
        float _281 = _235 * 0.001000000047497451305389404296875;
        _229 = _281;
    }
    float _283 = _229;
    if (_213)
    {
        float _285 = _171 * _283;
        _255 = _285;
    }
    float _287 = _255;
    if (_213)
    {
        float _289 = _177 * _283;
        _279 = _289;
    }
    float _291 = _279;
    if (_215)
    {
        float _293 = _259 * _175;
        _265 = _293;
    }
    float _295 = _265;
    float _297 = _295;
    if (!_213)
    {
        _231 = 0.0;
    }
    float _299 = _231;
    float _301 = _299;
    if (_215)
    {
        float _303 = _259 * _179;
        _271 = _303;
    }
    float _305 = _271;
    float _307 = _305;
    if (_215)
    {
        float _309 = _259 * _183;
        _275 = _309;
    }
    float _311 = _275;
    float _313 = _311;
    if (_213)
    {
        float _315 = _181 * _283;
        _301 = _315;
    }
    float _317 = _301;
    bool _319 = !_173;
    float _337;
    if (!_319)
    {
        float _321 = in.m_64.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_117);
        float _343 = 1.0 / _341;
        float _345 = _151 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _337;
    float _349 = in.m_66.x;
    float _351 = in.m_66.y;
    float _353 = _151 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _355 = in.m_49.x;
    float _357 = in.m_49.y;
    float _359 = in.m_49.z;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = in.m_64.x;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _371;
    float _375 = 1.0 / _363;
    float _377 = 1.0 / _367;
    float _379 = -_351;
    float _381 = _379 + 1.0;
    float _383 = abs(_349);
    float _385 = log2(_383);
    float _387 = _179 * _357;
    float _389 = _183 * _357;
    float _391 = fma(_369, 6.283185482025146484375, _353);
    float _393 = fma(_187, _355, _387);
    float _395 = fma(_191, _355, _389);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = _347 + _397;
    float _401 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _391);
    float _403 = fma(_177, _359, _393);
    float _405 = fma(_181, _359, _395);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _409 = _347 + _407;
    float _411 = _399 * _375;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _415 = 1.0 / _373;
    float _417 = _385 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _419 = in.m_68.x;
    float _421 = in.m_68.y;
    float _423 = in.m_68.z;
    float _425 = _409 * _377;
    float _427 = _401 * 0.60000002384185791015625;
    float _429 = _401 * 0.15915493667125701904296875;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _431;
    float _435 = exp2(_417);
    float _437 = _427 * 0.15915493667125701904296875;
    float _439 = _401 * 1.2999999523162841796875;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _347 + _441;
    float _445 = fma(_401, 0.60000002384185791015625, 0.31415927410125732421875);
    float _447 = _439 * 0.15915493667125701904296875;
    float _449 = fma(_433, _411, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _451 = _437 * 6.283185482025146484375;
    float _453 = sin(_451);
    float _455 = _443 * _415;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _457;
    float _461 = fma(_401, 1.2999999523162841796875, 0.680678427219390869140625);
    float _463 = _401 + 0.52359879016876220703125;
    float _465 = _445 * 0.15915493667125701904296875;
    float _467 = fma(_459, _411, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _469 = fma(_413, _435, _353);
    float _471 = _429 * 6.283185482025146484375;
    float _473 = sin(_471);
    bool _475 = _419 > 0.0;
    float _477 = _461 * 0.15915493667125701904296875;
    bool _479 = _419 >= 0.0;
    bool _481 = isnan(_419);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = _263 * _263;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _499;
    float _503 = _447 * 6.283185482025146484375;
    float _505 = sin(_503);
    float _507 = fma(_491, _411, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _509 = _463 * 0.15915493667125701904296875;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _515 = fma(_243, _243, _497);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _521 = fma(_495, _425, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _523 = fma(_453, 0.60000002384185791015625, _473);
    float _525 = fma(_245, _245, _515);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _527;
    float _531 = fma(_369, 6.283185482025146484375, _469);
    float _533 = _509 * 6.283185482025146484375;
    float _535 = sin(_533);
    int _537 = _487 ? 0 : 1;
    float _539 = fma(_513, _425, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _541 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _543 = isnan(_347);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = fma(_505, 0.300000011920928955078125, _523);
    bool _555 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _557 = isnan(_347);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = _531 * 0.60000002384185791015625;
    int _569 = ~_537;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    float _575 = _465 * 6.283185482025146484375;
    float _577 = sin(_575);
    int _579 = _573;
    float _581 = _357;
    if (!_475)
    {
        int _583 = ~_537;
        int _585 = _583 + 1;
        _579 = _585;
    }
    int _587 = _579;
    float _589 = fma(_519, _425, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _591 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _593 = isnan(_347);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -_565;
    float _605 = _603 + 1.0;
    bool _607 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _609 = isnan(_347);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = _567 * 0.15915493667125701904296875;
    float _621 = rsqrt(_525);
    float _623 = -_551;
    float _625 = _623 + 1.0;
    float _627 = _551 * _605;
    float _629 = fma(_501, _455, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _631;
    float _635 = _617 * _625;
    float _637 = -_617;
    float _639 = _637 + 1.0;
    float _641 = fma(_529, _455, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _643 = _477 * 6.283185482025146484375;
    float _645 = sin(_643);
    float _647 = fma(_577, 0.60000002384185791015625, _535);
    float _649 = fma(_633, _455, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _651 = _531 * 0.15915493667125701904296875;
    float _653 = _531 * 1.2999999523162841796875;
    float _655 = _601 * _639;
    float _657 = -_349;
    float _659 = _657 + 1.0;
    float _661 = in.m_70.y;
    float _663 = _263 * _621;
    float _665 = _619 * 6.283185482025146484375;
    float _667 = sin(_665);
    float _669 = _653 * 0.15915493667125701904296875;
    float _671 = _243 * _621;
    float _673 = _553 * _659;
    float _675 = _245 * _621;
    float _677 = -_601;
    float _679 = _677 + 1.0;
    float _681 = _467 * _655;
    float _683 = fma(_645, 0.300000011920928955078125, _647);
    float _685 = _663 * _295;
    float _687 = _651 * 6.283185482025146484375;
    float _689 = sin(_687);
    float _691 = _673 * 0.52359879016876220703125;
    float _693 = abs(_683);
    float _695 = _381 * _693;
    float _697 = fma(_671, _305, _685);
    float _699 = _507 * _655;
    float _701 = _691 * 0.15915493667125701904296875;
    float _703 = _695 * (-45.0);
    float _705 = fma(_675, _311, _697);
    float _707 = _669 * 6.283185482025146484375;
    float _709 = sin(_707);
    float _711 = _449 * _655;
    float _713 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[143].x, _699);
    float _715 = _703 * 0.01745329238474369049072265625;
    float _717 = abs(_705);
    bool _719 = _717 > 0.99989998340606689453125;
    float _721 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[143].y, _711);
    float _723 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[143].z, _681);
    float _725 = float(_587);
    float _727 = fma(_667, 0.60000002384185791015625, _689);
    float _729 = fma(_539, _635, _721);
    float _731 = _701 * 6.283185482025146484375;
    float _733 = sin(_731);
    float _735 = _695 * (-20.0);
    float _737 = _715 * 0.15915493667125701904296875;
    float _739 = fma(_521, _635, _713);
    float _741 = fma(_589, _635, _723);
    float _743 = fma(_709, 0.300000011920928955078125, _727);
    float _745 = fma(_661, 0.5, 0.5);
    float _747 = _725 * _735;
    float _749 = _701 * 6.283185482025146484375;
    float _751 = cos(_749);
    if (_719)
    {
        float _753 = _305 + _291;
        _307 = _753;
    }
    float _755 = _307;
    float _757 = _745 * _743;
    float _759 = _747 * 0.01745329238474369049072265625;
    if (_719)
    {
        float _761 = _311 + _317;
        _313 = _761;
    }
    float _763 = _313;
    float _765 = fma(_629, _627, _739);
    float _767 = _757 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _769 = _759 * 0.15915493667125701904296875;
    float _771 = _737 * 6.283185482025146484375;
    float _773 = sin(_771);
    float _775 = -_755;
    float _777 = _675 * _775;
    float _779 = _767 * 0.01745329238474369049072265625;
    float _781 = _733 * _419;
    if (_719)
    {
        float _783 = _295 + _287;
        _297 = _783;
    }
    float _785 = _297;
    float _787 = -_763;
    float _789 = -_777;
    float _791 = fma(_671, _787, _789);
    float _793 = -_763;
    float _795 = _663 * _793;
    float _797 = fma(_641, _627, _729);
    float _799 = _737 * 6.283185482025146484375;
    float _801 = cos(_799);
    float _803 = -_781;
    float _805 = fma(_751, _423, _803);
    float _807 = in.m_72.x;
    float _809 = in.m_72.y;
    float _811 = in.m_72.z;
    float _813 = -_785;
    float _815 = _671 * _813;
    float _817 = fma(_649, _627, _741);
    float _819 = _805 + 0.02999999932944774627685546875;
    float _821 = _779 * 0.15915493667125701904296875;
    float _823 = -_785;
    float _825 = -_795;
    float _827 = fma(_675, _823, _825);
    float _829 = _769 * 6.283185482025146484375;
    float _831 = cos(_829);
    float _833 = -_755;
    float _835 = -_815;
    float _837 = fma(_663, _833, _835);
    float _839 = _791 * _791;
    float _841 = _751 * _419;
    float _843 = _421 + (-0.0199999995529651641845703125);
    float _845 = _773 * _819;
    float _847 = fma(_827, _827, _839);
    float _849 = fma(_733, _423, _841);
    float _851 = _769 * 6.283185482025146484375;
    float _853 = sin(_851);
    float _855 = -_845;
    float _857 = fma(_801, _843, _855);
    float _859 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[146].x, _765);
    float _861 = fma(_837, _837, _847);
    float _863 = fma(_725, -0.100000001490116119384765625, _849);
    float _865 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[146].y, _797);
    float _867 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[146].z, _817);
    float _869 = _821 * 6.283185482025146484375;
    float _871 = sin(_869);
    float _873 = _857 * _831;
    float _875 = _865 * _809;
    float _877 = _859 * _807;
    float _879 = _867 * _811;
    float _881 = _875 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _883 = _877 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _885 = _821 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = _857 * _853;
    float _891 = fma(_853, _863, _873);
    float _893 = _879 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _895 = -_889;
    float _897 = fma(_831, _863, _895);
    float _899 = _891 + 0.0199999995529651641845703125;
    float _901 = in.m_58.w;
    float _903 = rsqrt(_861);
    float _905 = _801 * _819;
    float _907 = fma(_725, 0.100000001490116119384765625, _897);
    float _909 = _899 * _871;
    float _911 = in.m_60.w;
    float _913 = fma(_773, _843, _905);
    float _915 = _899 * _887;
    float _917 = -_909;
    float _919 = fma(_907, _887, _917);
    float _921 = _913 + (-0.02999999932944774627685546875);
    float _923 = fma(_907, _871, _915);
    float _925 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[194].x, _919);
    float _927 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _921);
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _923);
    float _931 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _925);
    float _933 = _791 * _903;
    float _935 = _827 * _903;
    float _937 = _881 * _929;
    float _939 = _883 * _931;
    float _941 = _837 * _903;
    float _943 = _671 * _933;
    float _945 = _937 * _675;
    float _947 = _893 * _927;
    float _949 = _663 * _941;
    float _951 = -_943;
    float _953 = fma(_663, _935, _951);
    float _955 = _937 * _671;
    float _957 = fma(_939, _941, _945);
    float _959 = _405 + _911;
    float _961 = -_949;
    float _963 = fma(_675, _933, _961);
    float _965 = fma(_939, _935, _955);
    float _967 = fma(_947, _953, _957);
    float _969 = _403 + _901;
    float _971 = _937 * _663;
    float _973 = fma(_947, _963, _965);
    float _975 = _959 + _967;
    float _977 = in.m_74.y;
    float _979 = _675 * _935;
    float _981 = _969 + _973;
    float _983 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _985 = _975 + _983;
    float _987 = fma(_939, _933, _971);
    float _989 = -_979;
    float _991 = fma(_671, _941, _989);
    float _993 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _995 = _981 + _993;
    float _997 = _985 * _985;
    float _999 = fma(_947, _991, _987);
    float _1001 = fma(_995, _995, _997);
    float _1003 = sqrt(_1001);
    float _1005 = _357 + _977;
    float _1007 = _1005 + _999;
    bool _1009 = _1003 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1013 = _1003 + _1011;
    float _1015 = _689;
    float _1017 = _1013;
    float _1019 = _907;
    float _1021 = _981;
    if (_1009)
    {
        float _1023 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1015 = _1023;
    }
    float _1025 = _1015;
    if (_1009)
    {
        float _1027 = _1007 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _581 = _1027;
    }
    float _1029 = _581;
    float _1031 = _1025;
    if (_1009)
    {
        float _1033 = _1013 * _1025;
        _1031 = _1033;
    }
    float _1035 = _1031;
    float _1037 = _1035;
    if (_1009)
    {
        float _1039 = rsqrt(_1001);
        _1017 = _1039;
    }
    float _1041 = _1017;
    float _1043 = _1041;
    if (_1009)
    {
        float _1045 = _1035 * 0.15915493667125701904296875;
        _1037 = _1045;
    }
    float _1047 = _1037;
    float _1049 = _1003;
    if (_1009)
    {
        float _1051 = _1047 * 6.283185482025146484375;
        float _1053 = sin(_1051);
        _1049 = _1053;
    }
    float _1055 = _1049;
    float _1057 = _1055;
    if (_1009)
    {
        float _1059 = fma(_1055, _1029, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1019 = _1059;
    }
    float _1061 = _1019;
    if (!_1009)
    {
        _1057 = _981;
    }
    float _1063 = _1057;
    float _1065 = _1063;
    if (!_1009)
    {
        _1021 = _975;
    }
    float _1067 = _1021;
    float _1069 = _1067;
    if (_1009)
    {
        float _1071 = _1041 * _1061;
        _1043 = _1071;
    }
    float _1073 = _1043;
    if (_1009)
    {
        float _1075 = fma(_995, _1073, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1065 = _1075;
    }
    float _1077 = _1065;
    if (_1009)
    {
        float _1079 = fma(_985, _1073, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1069 = _1079;
    }
    float _1081 = _1069;
    float _1083 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1085 = _1077 + _1083;
    float _1087 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1089 = _1081 + _1087;
    float _1091 = fma(_1085, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1093 = fma(_1089, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3855 = float2(_1091, _1093);
    float _1095 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3855, float2(0.0), isnan(_3855)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3855, float2(0.0), isnan(_3855)), level(0.0)).x;
    float _1097 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1099 = fma(_1095, 100.0, _1005);
    float _1101 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1103 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1101);
    float _1105 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1103);
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1109 = _1099 + _1097;
    float _1111 = _1105 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1113 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1107);
    float _1115 = 1.0 / _1111;
    float _1117 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1113);
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1121 = _1119 + _1111;
    float _1123 = _1121 * _1115;
    float _1125 = _1123 * 0.5;
    float _1127 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1129 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1127);
    float _1131 = 1.0 / _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1135 = _1131 * _1133;
    bool _1137 = _1135 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1139 = _1135 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1141 = !_1137;
    int _1143 = _1141 ? 0 : 1;
    int _1145 = 2;
    if (!_1137)
    {
        _1145 = 1;
    }
    int _1147 = _1145;
    int _1149 = _1147;
    if (!_1139)
    {
        _1149 = _1143;
    }
    int _1151 = _1149;
    int _1153 = _1151 << 6;
    int _1155 = _1153 + 96;
    uint _1158 = uint(int(uint(_1155) >> uint(2)));
    uint _1160 = uint(int(uint(int(_1158)) >> uint(2)));
    int _1162 = int(_1158) & 3;
    float _1164 = (*spvDescriptorSet0.vp_c15)._m0[int(_1160)][_1162];
    int _1166 = int(_1158) + 1;
    uint _1168 = uint(int(uint(_1166) >> uint(2)));
    int _1170 = _1166 & 3;
    float _1172 = (*spvDescriptorSet0.vp_c15)._m0[int(_1168)][_1170];
    int _1174 = _1153 + 104;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    uint _1178 = uint(int(uint(int(_1176)) >> uint(2)));
    int _1180 = int(_1176) & 3;
    float _1182 = (*spvDescriptorSet0.vp_c15)._m0[int(_1178)][_1180];
    int _1184 = int(_1176) + 1;
    uint _1186 = uint(int(uint(_1184) >> uint(2)));
    int _1188 = _1184 & 3;
    float _1190 = (*spvDescriptorSet0.vp_c15)._m0[int(_1186)][_1188];
    int _1192 = _1153 + 48;
    uint _1194 = uint(int(uint(_1192) >> uint(2)));
    uint _1196 = uint(int(uint(int(_1194)) >> uint(2)));
    int _1198 = int(_1194) & 3;
    float _1200 = (*spvDescriptorSet0.vp_c15)._m0[int(_1196)][_1198];
    int _1202 = int(_1194) + 1;
    uint _1204 = uint(int(uint(_1202) >> uint(2)));
    int _1206 = _1202 & 3;
    float _1208 = (*spvDescriptorSet0.vp_c15)._m0[int(_1204)][_1206];
    int _1210 = _1153 + 64;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    uint _1214 = uint(int(uint(int(_1212)) >> uint(2)));
    int _1216 = int(_1212) & 3;
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[int(_1214)][_1216];
    int _1220 = int(_1212) + 1;
    uint _1222 = uint(int(uint(_1220) >> uint(2)));
    int _1224 = _1220 & 3;
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[int(_1222)][_1224];
    int _1228 = _1153 + 56;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    int _1246 = _1153 + 72;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    uint _1250 = uint(int(uint(int(_1248)) >> uint(2)));
    int _1252 = int(_1248) & 3;
    float _1254 = (*spvDescriptorSet0.vp_c15)._m0[int(_1250)][_1252];
    int _1256 = int(_1248) + 1;
    uint _1258 = uint(int(uint(_1256) >> uint(2)));
    int _1260 = _1256 & 3;
    float _1262 = (*spvDescriptorSet0.vp_c15)._m0[int(_1258)][_1260];
    float _1264 = _1109 * _1172;
    float _1266 = fma(_969, _1164, _1264);
    float _1268 = fma(_959, _1182, _1266);
    float _1270 = _1268 + _1190;
    int _1272 = _1153 + 80;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    uint _1276 = uint(int(uint(int(_1274)) >> uint(2)));
    int _1278 = int(_1274) & 3;
    float _1280 = (*spvDescriptorSet0.vp_c15)._m0[int(_1276)][_1278];
    int _1282 = int(_1274) + 1;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    int _1286 = _1282 & 3;
    float _1288 = (*spvDescriptorSet0.vp_c15)._m0[int(_1284)][_1286];
    float _1290 = _1109 * _1208;
    float _1292 = 1.0 / _1270;
    float _1294 = fma(_969, _1200, _1290);
    int _1296 = _1153 + 88;
    uint _1298 = uint(int(uint(_1296) >> uint(2)));
    uint _1300 = uint(int(uint(int(_1298)) >> uint(2)));
    int _1302 = int(_1298) & 3;
    float _1304 = (*spvDescriptorSet0.vp_c15)._m0[int(_1300)][_1302];
    int _1306 = int(_1298) + 1;
    uint _1308 = uint(int(uint(_1306) >> uint(2)));
    int _1310 = _1306 & 3;
    float _1312 = (*spvDescriptorSet0.vp_c15)._m0[int(_1308)][_1310];
    float _1314 = _1109 * _1226;
    float _1316 = fma(_969, _1218, _1314);
    float _1318 = fma(_959, _1236, _1294);
    float _1320 = _1318 + _1244;
    float _1322 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1324 = fma(_959, _1254, _1316);
    float _1326 = _1320 * _1292;
    float _1328 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1330 = floor(_1322);
    float _1332 = _1324 + _1262;
    bool _1334 = _1326 >= 0.0;
    float _1336 = _1332 * _1292;
    bool _1338 = _1326 <= 1.0;
    bool _1340 = _1338 && _1334;
    float _1342 = floor(_1328);
    bool _1344 = _1336 >= 0.0;
    bool _1346 = _1344 && _1340;
    bool _1348 = _1336 <= 1.0;
    bool _1350 = _1348 && _1346;
    float _1352 = -_1330;
    float _1354 = _1322 + _1352;
    float _1356 = _1109 * _1288;
    float _1358 = fma(_969, _1280, _1356);
    float _1360 = -_1342;
    float _1362 = _1328 + _1360;
    float _1364 = fma(_959, _1304, _1358);
    float _1366 = as_type<float>(_1151);
    if (_1350)
    {
        float _1368 = float(_1151);
        _1366 = _1368;
    }
    float _1370 = _1366;
    float _1372 = _1364 + _1312;
    float _1374 = _1356;
    if (_1350)
    {
        float _1376 = rint(_1370);
        float _1378 = precise::max(_1376, 0.0);
        uint _1380 = uint(_1378);
        uint _1382 = clamp(_1380, 0u, 65535u);
        _1374 = as_type<float>(_1382);
    }
    float _1384 = _1374;
    float _1386 = _1372 * _1292;
    float2 _4352 = float2(_1362, _1354);
    float _1388 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4352, float2(0.0), isnan(_4352)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4352, float2(0.0), isnan(_4352)), level(0.0)).x;
    float _1390 = _1330;
    if (_1350)
    {
        float3 _4367 = float3(_1326, _1336, float(as_type<int>(_1384)));
        float3 _4371 = select(_4367, float3(0.0), isnan(_4367));
        float _1392 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4371.xy, uint(rint(_4371.z)), _1386, level(0.0));
        _1390 = _1392;
    }
    float _1394 = _1390;
    float _1396 = in.m_64.w;
    float _1398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1402 = _1400 != 0;
    float _1404 = in.m_70.x;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1408 = _1406 != 0;
    float _1410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1412 = _1328;
    float _1414 = _1404;
    if (_1402)
    {
        float _1416 = in.m_64.z;
        _1412 = _1416;
    }
    float _1418 = _1412;
    bool _1420 = _1396 > 0.5;
    float _1422 = -_661;
    float _1424 = _1422 + 1.0;
    int _1426 = _1420 ? as_type<int>(_1424) : as_type<int>(_661);
    bool _1428 = _923 != 0.0;
    bool _1430 = isnan(_923);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan(0.0);
    bool _1436 = _1432 || _1434;
    float _1438 = _1408 ? as_type<float>(_1426) : _661;
    bool _1440 = _1418 > 0.5;
    bool _1442 = _1440 && _1402;
    float _1444 = in.m_76.x;
    float _1446 = in.m_76.y;
    float _1448 = in.m_76.z;
    float _1450 = in.m_76.w;
    float _1452 = _1418;
    if (_1402)
    {
        _1452 = _1404;
    }
    float _1454 = _1452;
    float _1456 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1458 = _925 == 0.0;
    bool _1460 = !_1436;
    bool _1462 = _1458 && _1460;
    float _1464 = _1456 * _1398;
    bool _1466 = _913 == 0.02999999932944774627685546875;
    bool _1468 = _1466 && _1462;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1474 = _1454;
    float _1476 = _1472;
    if (_1442)
    {
        float _1478 = -_1454;
        float _1480 = _1478 + 1.0;
        _1474 = _1480;
    }
    float _1482 = _1474;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (_1402)
    {
        _1414 = _1482;
    }
    float _1488 = _1414;
    float _1490 = in.m_78.x;
    float _1492 = in.m_78.y;
    float _1494 = in.m_78.z;
    float _1496 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1498 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1504 = _1496 * _1410;
    float _1506 = _671 * _1446;
    float _1508 = _663 * _1446;
    float _1510 = _675 * _1446;
    out.m_80.x = _1498;
    out.m_80.y = _1500;
    out.m_80.z = _1502;
    out.m_80.w = _1472;
    float _1512 = fma(_935, _1444, _1506);
    float _1514 = fma(_933, _1444, _1508);
    float _1516 = fma(_941, _1444, _1510);
    out.m_82.z = _1504;
    out.m_82.w = _1464;
    float _1518 = 0.0;
    float _1520 = _1512;
    float _1522 = _1506;
    float _1524 = _1504;
    float _1526 = _1490;
    if (_1468)
    {
        _1518 = _1490;
    }
    float _1528 = _1518;
    float _1530 = fma(_963, _1448, _1512);
    float _1532 = _1528;
    if (_1468)
    {
        _1520 = _1494;
    }
    float _1534 = _1520;
    float _1536 = fma(_991, _1448, _1514);
    float _1538 = _1534;
    if (_1468)
    {
        _1522 = _1528;
    }
    float _1540 = _1522;
    float _1542 = fma(_953, _1448, _1516);
    float _1544 = _1540;
    if (!_1468)
    {
        _1532 = _1490;
    }
    float _1546 = _1532;
    if (_1468)
    {
        _1524 = _1492;
    }
    float _1548 = _1524;
    float _1550 = _1548;
    if (_1468)
    {
        _1526 = _1534;
    }
    float _1552 = _1526;
    float _1554 = _1448 * _1546;
    float _1556 = _1552;
    if (!_1468)
    {
        _1538 = _1494;
    }
    float _1558 = _1538;
    out.m_84.x = _1530;
    out.m_84.y = _1536;
    out.m_84.z = _1542;
    if (_1468)
    {
        _1476 = _1548;
    }
    float _1560 = _1476;
    float _1562 = _1560;
    if (!_1468)
    {
        float _1564 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1546);
        _1544 = _1564;
    }
    float _1566 = _1544;
    if (!_1468)
    {
        _1550 = _1492;
    }
    float _1568 = _1550;
    float _1570 = _1446 * _1558;
    if (!_1468)
    {
        float _1572 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1558);
        _1556 = _1572;
    }
    float _1574 = _1556;
    float _1576 = -_1570;
    float _1578 = fma(_1448, _1568, _1576);
    float _1580 = _1444 * _1568;
    float _1582 = _1570;
    if (_1009)
    {
        float _1584 = _1047 * 6.283185482025146484375;
        float _1586 = cos(_1584);
        _1582 = _1586;
    }
    float _1588 = _1582;
    float _1590 = -_1554;
    float _1592 = fma(_1444, _1558, _1590);
    if (!_1468)
    {
        float _1594 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1568);
        _1562 = _1594;
    }
    float _1596 = _1562;
    float _1598 = -_1580;
    float _1600 = fma(_1446, _1546, _1598);
    float _1602 = _1578 * _1450;
    float _1604 = _1592 * _1450;
    float _1606 = _663 * _1596;
    float _1608 = _1600 * _1450;
    float _1610 = _671 * _1596;
    float _1612 = _671 * _1604;
    float _1614 = _675 * _1596;
    float _1616 = _663 * _1604;
    float _1618 = _675 * _1604;
    float _1620 = fma(_935, _1566, _1610);
    float _1622 = fma(_935, _1602, _1612);
    float _1624 = fma(_933, _1602, _1616);
    float _1626 = _1610;
    float _1628 = _1608;
    if (_1009)
    {
        float _1630 = _1588 + (-1.0);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = fma(_941, _1602, _1618);
    float _1636 = fma(_963, _1608, _1622);
    float _1638 = fma(_991, _1608, _1624);
    float _1640 = _1632;
    if (_1009)
    {
        float _1642 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1640 = _1642;
    }
    float _1644 = _1640;
    float _1646 = fma(_953, _1608, _1634);
    if (!_1009)
    {
        _1628 = _1007;
    }
    float _1648 = _1628;
    float _1650 = fma(_933, _1566, _1606);
    float _1652 = _1648;
    if (_1009)
    {
        float _1654 = fma(_1007, _1588, _1644);
        _1652 = _1654;
    }
    float _1656 = _1652;
    float _1658 = fma(_941, _1566, _1614);
    out.m_86.x = _1636;
    out.m_86.y = _1638;
    out.m_86.z = _1646;
    float _1660 = fma(_963, _1574, _1620);
    float _1662 = fma(_1095, 100.0, _1656);
    float _1664 = fma(_991, _1574, _1650);
    float _1666 = fma(_953, _1574, _1658);
    float _1668 = _1109 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1670 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1672 = abs(_1135);
    float _1674 = log2(_1672);
    float _1676 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1678 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1668);
    float _1680 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1670);
    float _1682 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1684 = _1109 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1686 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1678);
    float _1688 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1680);
    float _1690 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1676);
    float _1692 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1684);
    float _1694 = _1686 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1696 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1682);
    float _1698 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1690);
    float _1700 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1692);
    float _1702 = _1688 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1704 = trunc(_1694);
    int _1706 = int(_1704);
    float _1708 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1710 = _1700 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1712 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1714 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1696);
    float _1716 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1718 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1720 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1722 = trunc(_1710);
    int _1724 = int(_1722);
    float _1726 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1728 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1730 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1712);
    float _1732 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1718);
    float _1736 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1720);
    float _1738 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1726);
    float _1740 = exp2(_1708);
    float _1742 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1728);
    float _1744 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1730);
    int _1746 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1748 = _1706 + _1746;
    int _1750 = _1748 + 1;
    float _1752 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1734);
    float _1754 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1736);
    float _1756 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1738);
    float _1758 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1742);
    int _1760 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1762 = _1724 + _1760;
    int _1764 = _1762 + 1;
    float _1766 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1768 = _1750 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1770 = _1750 | _1764;
    float _1772 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1754);
    float _1774 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1752);
    bool _1776 = _1770 < 0;
    bool _1778 = _1776 || _1768;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1782 = _1662 + _1780;
    float _1784 = fma(_1740, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1786 = precise::clamp(_1784, 0.0, 1.0);
    bool _1788 = _1764 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1790 = _1788 || _1778;
    float _1792 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1756);
    float _1794 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1758);
    float _1796 = fma(_1786, -2.0, 3.0);
    float _1798 = _1786 * _1786;
    float _1800 = _1782 * _1782;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1804 = _1077 + _1802;
    out.gl_Position.x = _1774;
    out.gl_Position.y = _1772;
    out.gl_Position.z = _1792;
    out.gl_Position.w = _1794;
    float _1806 = _1798 * _1796;
    bool _1808 = _1135 <= 8000.0;
    bool _1810 = isnan(_1135);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan(8000.0);
    bool _1816 = _1812 || _1814;
    float _1818 = float(_1816);
    float _1820 = fma(_1804, _1804, _1800);
    float _1822 = -_1806;
    float _1824 = _1822 + 1.0;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1806);
    float _1828 = _1774;
    float _1830 = _1772;
    float _1832 = _1792;
    float _1834 = _1710;
    float _1836 = _1694;
    if (_1790)
    {
        _1828 = 1.0;
    }
    float _1838 = _1828;
    float _1840 = _1838;
    if (!_1790)
    {
        int _1842 = _1764 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1844 = _1842 + _1750;
        float _1846 = floor(_1694);
        int _1848 = _1844 << 2;
        uint _1850 = uint(int(uint(_1844) >> uint(2)));
        int _1852 = 12 & _1848;
        int _1854 = int(_1850) << 4;
        int _1856 = _1854 + _1852;
        float _1858 = floor(_1710);
        float _1860 = -_1846;
        float _1862 = _1694 + _1860;
        int _1864 = _1856 + 400;
        uint _1866 = uint(int(uint(_1864) >> uint(2)));
        uint _1868 = uint(int(uint(int(_1866)) >> uint(2)));
        int _1870 = int(_1866) & 3;
        float _1872 = (*spvDescriptorSet0.vp_c15)._m0[int(_1868)][_1870];
        float _1874 = -_1858;
        float _1876 = _1710 + _1874;
        float _1878 = rint(_1872);
        float _1880 = precise::max(_1878, 0.0);
        uint _1882 = uint(_1880);
        uint _1884 = clamp(_1882, 0u, 65535u);
        float3 _5237 = float3(_1862, _1876, float(int(_1884)));
        float3 _5239 = select(_5237, float3(0.0), isnan(_5237));
        float _1886 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5239.xy, uint(rint(_5239.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5239.xy, uint(rint(_5239.z)), level(0.0)).x;
        int _1888 = _1844 << 4;
        int _1890 = _1888 + 2048;
        uint _1892 = uint(int(uint(_1890) >> uint(2)));
        uint _1894 = uint(int(uint(int(_1892)) >> uint(2)));
        int _1896 = int(_1892) & 3;
        float _1898 = (*spvDescriptorSet0.vp_c15)._m0[int(_1894)][_1896];
        int _1900 = int(_1892) + 1;
        uint _1902 = uint(int(uint(_1900) >> uint(2)));
        int _1904 = _1900 & 3;
        float _1906 = (*spvDescriptorSet0.vp_c15)._m0[int(_1902)][_1904];
        int _1908 = _1890 + 8;
        uint _1910 = uint(int(uint(_1908) >> uint(2)));
        uint _1912 = uint(int(uint(int(_1910)) >> uint(2)));
        int _1914 = int(_1910) & 3;
        float _1916 = (*spvDescriptorSet0.vp_c15)._m0[int(_1912)][_1914];
        int _1918 = int(_1910) + 1;
        uint _1920 = uint(int(uint(_1918) >> uint(2)));
        int _1922 = _1918 & 3;
        float _1924 = (*spvDescriptorSet0.vp_c15)._m0[int(_1920)][_1922];
        float _1926 = _1109 * _1906;
        float _1928 = fma(_969, _1898, _1926);
        float _1930 = fma(_959, _1916, _1928);
        float _1932 = _1930 + _1924;
        float _1934 = precise::clamp(_1932, 0.0, 1.0);
        float _1936 = -_1934;
        float _1938 = _1936 + _1886;
        float _1940 = fma(_1938, 500.0, 1.5);
        float _1942 = exp2(_1940);
        float _1944 = 0.0 + _1942;
        float _1946 = precise::clamp(_1944, 0.0, 1.0);
        _1830 = _1872;
        _1840 = _1946;
        _1832 = _1876;
    }
    float _1948 = _1830;
    float _1950 = _1840;
    float _1952 = _1832;
    float _1954 = _1818 * _1826;
    float _1956 = in.m_66.w;
    float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1960 = _1081 + _1958;
    float _1962 = -_1388;
    float _1964 = _1962 + 1.0;
    float _1966 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1968 = _1948;
    float _1970 = _1966;
    float _1972 = _1952;
    if (!_1350)
    {
        _1968 = 1.0;
    }
    float _1974 = _1968;
    float _1976 = fma(_1960, _1960, _1820);
    float _1978 = _1974;
    if (_1350)
    {
        bool _1980 = _1394 >= _1386;
        bool _1982 = isnan(_1394);
        bool _1984 = _1980 || _1982;
        bool _1986 = isnan(_1386);
        bool _1988 = _1984 || _1986;
        float _1990 = float(_1988);
        _1978 = _1990;
    }
    float _1992 = _1978;
    float _1994 = _1964 * _1966;
    float _1996 = precise::clamp(_1994, 0.0, 1.0);
    out.m_88.x = _1660;
    out.m_88.y = _1664;
    out.m_88.z = _1666;
    float _1998 = _1992 * _1950;
    float _2000 = sqrt(_1976);
    float _2002 = -_1996;
    float _2004 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_90.x = _1077;
    out.m_90.y = _1662;
    out.m_90.z = _1081;
    float _2006 = -_1998;
    float _2008 = fma(_2006, _2004, 1.0);
    float _2010 = precise::clamp(_2008, 0.0, 1.0);
    float _2012 = _2010 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.w = _1956;
    out.m_94.x = _2012;
    bool _2014 = _2000 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2016 = isnan(_2000);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2022 = _2018 || _2020;
    float _2024 = _2004;
    float _2026 = _2010;
    if (!_2022)
    {
        _1834 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2028 = _1834;
    float _2030 = _2028;
    float _2032 = _2028;
    if (!_2022)
    {
        _1836 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2034 = _1836;
    float _2036 = _2034;
    float _2038 = _2034;
    if (!_2022)
    {
        _1970 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2040 = _1970;
    float _2042 = _2040;
    float _2044 = _2040;
    if (!_2022)
    {
        _1972 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2046 = _1972;
    float _2048 = _2046;
    float _2050 = _2046;
    if (!_2022)
    {
        _2024 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2052 = _2024;
    float _2054 = _2052;
    float _2056 = _2052;
    if (!_2022)
    {
        _2026 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2058 = _2026;
    bool _2060 = !_2022;
    float _2062 = _2058;
    float _2064 = _2058;
    if (!_2060)
    {
        bool _2066 = _2000 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2068 = isnan(_2000);
        bool _2070 = _2066 || _2068;
        bool _2072 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2074 = _2070 || _2072;
        if (!_2074)
        {
            float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2078 = _2000 + _2076;
            float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2082 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2080;
            float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2086 = _2084 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2088 = 1.0 / _2082;
            float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2092 = _2090 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2104 = _2102 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2106 = _2078 * _2088;
            float _2108 = precise::clamp(_2106, 0.0, 1.0);
            float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2112 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2114 = fma(_2108, _2086, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2116 = fma(_2108, _2112, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2118 = fma(_2108, _2092, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2120 = fma(_2108, _2096, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2122 = fma(_2108, _2100, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2124 = fma(_2108, _2104, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2038 = _2114;
            _2056 = _2122;
            _2032 = _2118;
            _2050 = _2120;
            _2044 = _2116;
            _2064 = _2124;
            _2126 = true;
        }
        else
        {
            bool _2128 = _2000 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2130 = isnan(_2000);
            bool _2132 = _2128 || _2130;
            bool _2134 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2136 = _2132 || _2134;
            if (!_2136)
            {
                _2030 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2138 = _2030;
            _2032 = _2138;
            if (!_2136)
            {
                _2036 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2140 = _2036;
            _2038 = _2140;
            if (!_2136)
            {
                _2042 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2142 = _2042;
            _2044 = _2142;
            if (!_2136)
            {
                _2048 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2144 = _2048;
            _2050 = _2144;
            if (!_2136)
            {
                _2054 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2146 = _2054;
            _2056 = _2146;
            if (!_2136)
            {
                _2062 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2148 = _2062;
            bool _2150 = !_2136;
            _2064 = _2148;
            if (!_2150)
            {
                bool _2152 = _2000 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2154 = isnan(_2000);
                bool _2156 = _2152 || _2154;
                bool _2158 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2160 = _2156 || _2158;
                if (!_2160)
                {
                    float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2164 = _2000 + _2162;
                    float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2168 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2166;
                    float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2174 = 1.0 / _2168;
                    float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2192 = _2164 * _2174;
                    float _2194 = precise::clamp(_2192, 0.0, 1.0);
                    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2198 = _2196 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2200 = fma(_2194, _2172, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2202 = fma(_2194, _2198, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2204 = fma(_2194, _2178, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2206 = fma(_2194, _2182, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2208 = fma(_2194, _2186, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2210 = fma(_2194, _2190, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2038 = _2200;
                    _2056 = _2208;
                    _2032 = _2204;
                    _2050 = _2206;
                    _2044 = _2202;
                    _2064 = _2210;
                    _2126 = true;
                }
                else
                {
                    _2038 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2056 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2032 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2050 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2044 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2064 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2126 = false;
    float _2212 = _2038;
    float _2214 = _2056;
    float _2216 = _2032;
    float _2218 = _2050;
    float _2220 = _2044;
    float _2222 = _2064;
    float _2224 = fma(_1664, -0.5, 0.5);
    float _2226 = precise::clamp(_2224, 0.0, 1.0);
    float _2228 = -_2212;
    float _2230 = _2228 + _2214;
    float _2232 = -_2216;
    float _2234 = _2232 + _2218;
    float _2236 = -_2220;
    float _2238 = _2236 + _2222;
    bool _2240 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2242 = fma(_2226, _2230, _2212);
    float _2244 = fma(_2226, _2234, _2216);
    float _2246 = fma(_2226, _2238, _2220);
    float _2248 = _2242 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _2250 = fma(_2244, 0.298911988735198974609375, _2248);
    float _2252 = fma(_2246, 0.114477999508380889892578125, _2250);
    out.m_96.x = 0.0;
    float _2254 = -_2252;
    float _2256 = _2244 + _2254;
    float _2258 = -_2252;
    float _2260 = _2242 + _2258;
    float _2262 = -_2252;
    float _2264 = _2246 + _2262;
    float _2266 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2268 = fma(_2256, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2252);
    float _2270 = fma(_2260, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2252);
    float _2272 = fma(_2264, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2252);
    out.m_94.w = _2266;
    out.m_98.x = _2268;
    out.m_98.y = _2270;
    out.m_98.z = _2272;
    if (!_2240)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2274 = -_1662;
    float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2278 = -_1077;
    float _2280 = _2278 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2282 = -_1081;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2286 = _2276 * _2276;
    float _2288 = fma(_2280, _2280, _2286);
    float _2290 = fma(_2284, _2284, _2288);
    float _2292 = sqrt(_2290);
    float _2294 = rsqrt(_2290);
    float _2296 = -_2292;
    float _2298 = _2296 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2300 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2302 = precise::clamp(_2300, 0.0, 1.0);
    float _2304 = _2280 * _2294;
    float _2306 = _2276 * _2294;
    float _2308 = abs(_2302);
    float _2310 = log2(_2308);
    float _2312 = _2284 * _2294;
    float _2314 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2316 = _1664 * _2306;
    float _2318 = -_2306;
    float _2320 = -_2314;
    float _2322 = fma(_2318, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2320);
    float _2324 = fma(_1660, _2304, _2316);
    float _2326 = -_2312;
    float _2328 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2322);
    float _2330 = fma(_1666, _2312, _2324);
    float _2332 = precise::clamp(_2330, 0.0, 1.0);
    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2336 = _2328 + _2334;
    float _2338 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2340 = _2336 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2342 = precise::clamp(_2340, 0.0, 1.0);
    float _2344 = exp2(_2338);
    float _2346 = _2344 * _2342;
    float _2348 = _2332 * _2346;
    float _2350 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2352 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2354 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _2350;
    out.m_96.y = _2352;
    out.m_96.z = _2354;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2126 = false;
    bool _339 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_49.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_52.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2411 = as_type<float>(_133);
        out.gl_Position.z = _2411;
    }
    if (!_121)
    {
        return out;
    }
    float _137 = in.m_54.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    if (_147)
    {
        float _155 = float(_117);
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    if (_163)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_163)
    {
        out.m_52.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _135 = as_type<int>(_167);
    }
    int _169 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2479 = as_type<float>(_169);
        out.gl_Position.z = _2479;
    }
    if (_163)
    {
        return out;
    }
    float _171 = in.m_56.z;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = in.m_56.y;
    float _177 = in.m_58.z;
    float _179 = in.m_58.y;
    float _181 = in.m_60.z;
    float _183 = in.m_60.y;
    float _185 = _171 * _171;
    float _187 = in.m_58.x;
    float _189 = _175 * _175;
    float _191 = in.m_60.x;
    float _193 = fma(_177, _177, _185);
    float _195 = in.m_56.x;
    float _197 = fma(_179, _179, _189);
    float _199 = fma(_181, _181, _193);
    float _201 = fma(_183, _183, _197);
    float _203 = sqrt(_199);
    float _205 = in.m_62.x;
    float _207 = in.m_62.y;
    float _209 = in.m_62.z;
    float _211 = sqrt(_201);
    bool _213 = _203 > 0.0;
    bool _215 = _211 > 0.0;
    float _217 = _179 * _207;
    float _219 = _183 * _207;
    float _221 = _175 * _207;
    float _223 = _199;
    float _225 = _221;
    float _227 = _195;
    float _229 = _205;
    float _231 = _175;
    if (_213)
    {
        float _233 = rsqrt(_199);
        _223 = _233;
    }
    float _235 = _223;
    float _237 = fma(_205, _187, _217);
    float _239 = fma(_205, _191, _219);
    float _241 = fma(_205, _195, _221);
    float _243 = fma(_177, _209, _237);
    float _245 = fma(_181, _209, _239);
    float _247 = _237;
    float _249 = _239;
    if (!_213)
    {
        _247 = 0.0;
    }
    float _251 = _247;
    float _253 = 0.0;
    float _255 = _251;
    if (_215)
    {
        float _257 = rsqrt(_201);
        _253 = _257;
    }
    float _259 = _253;
    if (!_215)
    {
        _225 = 0.0;
    }
    float _261 = _225;
    float _263 = fma(_171, _209, _241);
    float _265 = _261;
    if (!_215)
    {
        _227 = 0.0;
    }
    float _267 = _227;
    float _269 = 0.0;
    float _271 = _267;
    if (!_215)
    {
        _269 = 0.0;
    }
    float _273 = _269;
    float _275 = _273;
    if (!_213)
    {
        _249 = 0.0;
    }
    float _277 = _249;
    float _279 = _277;
    if (_213)
    {
        float _281 = _235 * 0.001000000047497451305389404296875;
        _229 = _281;
    }
    float _283 = _229;
    if (_213)
    {
        float _285 = _171 * _283;
        _255 = _285;
    }
    float _287 = _255;
    if (_213)
    {
        float _289 = _177 * _283;
        _279 = _289;
    }
    float _291 = _279;
    if (_215)
    {
        float _293 = _259 * _175;
        _265 = _293;
    }
    float _295 = _265;
    float _297 = _295;
    if (!_213)
    {
        _231 = 0.0;
    }
    float _299 = _231;
    float _301 = _299;
    if (_215)
    {
        float _303 = _259 * _179;
        _271 = _303;
    }
    float _305 = _271;
    float _307 = _305;
    if (_215)
    {
        float _309 = _259 * _183;
        _275 = _309;
    }
    float _311 = _275;
    float _313 = _311;
    if (_213)
    {
        float _315 = _181 * _283;
        _301 = _315;
    }
    float _317 = _301;
    bool _319 = !_173;
    float _337;
    if (!_319)
    {
        float _321 = in.m_64.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_117);
        float _343 = 1.0 / _341;
        float _345 = _151 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _337;
    float _349 = in.m_66.x;
    float _351 = in.m_66.y;
    float _353 = _151 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _355 = in.m_49.x;
    float _357 = in.m_49.y;
    float _359 = in.m_49.z;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = in.m_64.x;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _371;
    float _375 = 1.0 / _363;
    float _377 = 1.0 / _367;
    float _379 = -_351;
    float _381 = _379 + 1.0;
    float _383 = abs(_349);
    float _385 = log2(_383);
    float _387 = _179 * _357;
    float _389 = _183 * _357;
    float _391 = fma(_369, 6.283185482025146484375, _353);
    float _393 = fma(_187, _355, _387);
    float _395 = fma(_191, _355, _389);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = _347 + _397;
    float _401 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _391);
    float _403 = fma(_177, _359, _393);
    float _405 = fma(_181, _359, _395);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _409 = _347 + _407;
    float _411 = _399 * _375;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _415 = 1.0 / _373;
    float _417 = _385 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _419 = in.m_68.x;
    float _421 = in.m_68.y;
    float _423 = in.m_68.z;
    float _425 = _409 * _377;
    float _427 = _401 * 0.60000002384185791015625;
    float _429 = _401 * 0.15915493667125701904296875;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _431;
    float _435 = exp2(_417);
    float _437 = _427 * 0.15915493667125701904296875;
    float _439 = _401 * 1.2999999523162841796875;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _347 + _441;
    float _445 = fma(_401, 0.60000002384185791015625, 0.31415927410125732421875);
    float _447 = _439 * 0.15915493667125701904296875;
    float _449 = fma(_433, _411, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _451 = _437 * 6.283185482025146484375;
    float _453 = sin(_451);
    float _455 = _443 * _415;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _457;
    float _461 = fma(_401, 1.2999999523162841796875, 0.680678427219390869140625);
    float _463 = _401 + 0.52359879016876220703125;
    float _465 = _445 * 0.15915493667125701904296875;
    float _467 = fma(_459, _411, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _469 = fma(_413, _435, _353);
    float _471 = _429 * 6.283185482025146484375;
    float _473 = sin(_471);
    bool _475 = _419 > 0.0;
    float _477 = _461 * 0.15915493667125701904296875;
    bool _479 = _419 >= 0.0;
    bool _481 = isnan(_419);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = _263 * _263;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _499;
    float _503 = _447 * 6.283185482025146484375;
    float _505 = sin(_503);
    float _507 = fma(_491, _411, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _509 = _463 * 0.15915493667125701904296875;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _515 = fma(_243, _243, _497);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _521 = fma(_495, _425, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _523 = fma(_453, 0.60000002384185791015625, _473);
    float _525 = fma(_245, _245, _515);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _527;
    float _531 = fma(_369, 6.283185482025146484375, _469);
    float _533 = _509 * 6.283185482025146484375;
    float _535 = sin(_533);
    int _537 = _487 ? 0 : 1;
    float _539 = fma(_513, _425, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _541 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _543 = isnan(_347);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = fma(_505, 0.300000011920928955078125, _523);
    bool _555 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _557 = isnan(_347);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = _531 * 0.60000002384185791015625;
    int _569 = ~_537;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    float _575 = _465 * 6.283185482025146484375;
    float _577 = sin(_575);
    int _579 = _573;
    float _581 = _357;
    if (!_475)
    {
        int _583 = ~_537;
        int _585 = _583 + 1;
        _579 = _585;
    }
    int _587 = _579;
    float _589 = fma(_519, _425, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _591 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _593 = isnan(_347);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -_565;
    float _605 = _603 + 1.0;
    bool _607 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _609 = isnan(_347);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = _567 * 0.15915493667125701904296875;
    float _621 = rsqrt(_525);
    float _623 = -_551;
    float _625 = _623 + 1.0;
    float _627 = _551 * _605;
    float _629 = fma(_501, _455, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _631;
    float _635 = _617 * _625;
    float _637 = -_617;
    float _639 = _637 + 1.0;
    float _641 = fma(_529, _455, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _643 = _477 * 6.283185482025146484375;
    float _645 = sin(_643);
    float _647 = fma(_577, 0.60000002384185791015625, _535);
    float _649 = fma(_633, _455, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _651 = _531 * 0.15915493667125701904296875;
    float _653 = _531 * 1.2999999523162841796875;
    float _655 = _601 * _639;
    float _657 = -_349;
    float _659 = _657 + 1.0;
    float _661 = in.m_70.y;
    float _663 = _263 * _621;
    float _665 = _619 * 6.283185482025146484375;
    float _667 = sin(_665);
    float _669 = _653 * 0.15915493667125701904296875;
    float _671 = _243 * _621;
    float _673 = _553 * _659;
    float _675 = _245 * _621;
    float _677 = -_601;
    float _679 = _677 + 1.0;
    float _681 = _467 * _655;
    float _683 = fma(_645, 0.300000011920928955078125, _647);
    float _685 = _663 * _295;
    float _687 = _651 * 6.283185482025146484375;
    float _689 = sin(_687);
    float _691 = _673 * 0.52359879016876220703125;
    float _693 = abs(_683);
    float _695 = _381 * _693;
    float _697 = fma(_671, _305, _685);
    float _699 = _507 * _655;
    float _701 = _691 * 0.15915493667125701904296875;
    float _703 = _695 * (-45.0);
    float _705 = fma(_675, _311, _697);
    float _707 = _669 * 6.283185482025146484375;
    float _709 = sin(_707);
    float _711 = _449 * _655;
    float _713 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[143].x, _699);
    float _715 = _703 * 0.01745329238474369049072265625;
    float _717 = abs(_705);
    bool _719 = _717 > 0.99989998340606689453125;
    float _721 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[143].y, _711);
    float _723 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[143].z, _681);
    float _725 = float(_587);
    float _727 = fma(_667, 0.60000002384185791015625, _689);
    float _729 = fma(_539, _635, _721);
    float _731 = _701 * 6.283185482025146484375;
    float _733 = sin(_731);
    float _735 = _695 * (-20.0);
    float _737 = _715 * 0.15915493667125701904296875;
    float _739 = fma(_521, _635, _713);
    float _741 = fma(_589, _635, _723);
    float _743 = fma(_709, 0.300000011920928955078125, _727);
    float _745 = fma(_661, 0.5, 0.5);
    float _747 = _725 * _735;
    float _749 = _701 * 6.283185482025146484375;
    float _751 = cos(_749);
    if (_719)
    {
        float _753 = _305 + _291;
        _307 = _753;
    }
    float _755 = _307;
    float _757 = _745 * _743;
    float _759 = _747 * 0.01745329238474369049072265625;
    if (_719)
    {
        float _761 = _311 + _317;
        _313 = _761;
    }
    float _763 = _313;
    float _765 = fma(_629, _627, _739);
    float _767 = _757 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _769 = _759 * 0.15915493667125701904296875;
    float _771 = _737 * 6.283185482025146484375;
    float _773 = sin(_771);
    float _775 = -_755;
    float _777 = _675 * _775;
    float _779 = _767 * 0.01745329238474369049072265625;
    float _781 = _733 * _419;
    if (_719)
    {
        float _783 = _295 + _287;
        _297 = _783;
    }
    float _785 = _297;
    float _787 = -_763;
    float _789 = -_777;
    float _791 = fma(_671, _787, _789);
    float _793 = -_763;
    float _795 = _663 * _793;
    float _797 = fma(_641, _627, _729);
    float _799 = _737 * 6.283185482025146484375;
    float _801 = cos(_799);
    float _803 = -_781;
    float _805 = fma(_751, _423, _803);
    float _807 = in.m_72.x;
    float _809 = in.m_72.y;
    float _811 = in.m_72.z;
    float _813 = -_785;
    float _815 = _671 * _813;
    float _817 = fma(_649, _627, _741);
    float _819 = _805 + 0.02999999932944774627685546875;
    float _821 = _779 * 0.15915493667125701904296875;
    float _823 = -_785;
    float _825 = -_795;
    float _827 = fma(_675, _823, _825);
    float _829 = _769 * 6.283185482025146484375;
    float _831 = cos(_829);
    float _833 = -_755;
    float _835 = -_815;
    float _837 = fma(_663, _833, _835);
    float _839 = _791 * _791;
    float _841 = _751 * _419;
    float _843 = _421 + (-0.0199999995529651641845703125);
    float _845 = _773 * _819;
    float _847 = fma(_827, _827, _839);
    float _849 = fma(_733, _423, _841);
    float _851 = _769 * 6.283185482025146484375;
    float _853 = sin(_851);
    float _855 = -_845;
    float _857 = fma(_801, _843, _855);
    float _859 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[146].x, _765);
    float _861 = fma(_837, _837, _847);
    float _863 = fma(_725, -0.100000001490116119384765625, _849);
    float _865 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[146].y, _797);
    float _867 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[146].z, _817);
    float _869 = _821 * 6.283185482025146484375;
    float _871 = sin(_869);
    float _873 = _857 * _831;
    float _875 = _865 * _809;
    float _877 = _859 * _807;
    float _879 = _867 * _811;
    float _881 = _875 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _883 = _877 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _885 = _821 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = _857 * _853;
    float _891 = fma(_853, _863, _873);
    float _893 = _879 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _895 = -_889;
    float _897 = fma(_831, _863, _895);
    float _899 = _891 + 0.0199999995529651641845703125;
    float _901 = in.m_58.w;
    float _903 = rsqrt(_861);
    float _905 = _801 * _819;
    float _907 = fma(_725, 0.100000001490116119384765625, _897);
    float _909 = _899 * _871;
    float _911 = in.m_60.w;
    float _913 = fma(_773, _843, _905);
    float _915 = _899 * _887;
    float _917 = -_909;
    float _919 = fma(_907, _887, _917);
    float _921 = _913 + (-0.02999999932944774627685546875);
    float _923 = fma(_907, _871, _915);
    float _925 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[194].x, _919);
    float _927 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _921);
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _923);
    float _931 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _925);
    float _933 = _791 * _903;
    float _935 = _827 * _903;
    float _937 = _881 * _929;
    float _939 = _883 * _931;
    float _941 = _837 * _903;
    float _943 = _671 * _933;
    float _945 = _937 * _675;
    float _947 = _893 * _927;
    float _949 = _663 * _941;
    float _951 = -_943;
    float _953 = fma(_663, _935, _951);
    float _955 = _937 * _671;
    float _957 = fma(_939, _941, _945);
    float _959 = _405 + _911;
    float _961 = -_949;
    float _963 = fma(_675, _933, _961);
    float _965 = fma(_939, _935, _955);
    float _967 = fma(_947, _953, _957);
    float _969 = _403 + _901;
    float _971 = _937 * _663;
    float _973 = fma(_947, _963, _965);
    float _975 = _959 + _967;
    float _977 = in.m_74.y;
    float _979 = _675 * _935;
    float _981 = _969 + _973;
    float _983 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _985 = _975 + _983;
    float _987 = fma(_939, _933, _971);
    float _989 = -_979;
    float _991 = fma(_671, _941, _989);
    float _993 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _995 = _981 + _993;
    float _997 = _985 * _985;
    float _999 = fma(_947, _991, _987);
    float _1001 = fma(_995, _995, _997);
    float _1003 = sqrt(_1001);
    float _1005 = _357 + _977;
    float _1007 = _1005 + _999;
    bool _1009 = _1003 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1013 = _1003 + _1011;
    float _1015 = _689;
    float _1017 = _1013;
    float _1019 = _907;
    float _1021 = _981;
    if (_1009)
    {
        float _1023 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1015 = _1023;
    }
    float _1025 = _1015;
    if (_1009)
    {
        float _1027 = _1007 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _581 = _1027;
    }
    float _1029 = _581;
    float _1031 = _1025;
    if (_1009)
    {
        float _1033 = _1013 * _1025;
        _1031 = _1033;
    }
    float _1035 = _1031;
    float _1037 = _1035;
    if (_1009)
    {
        float _1039 = rsqrt(_1001);
        _1017 = _1039;
    }
    float _1041 = _1017;
    float _1043 = _1041;
    if (_1009)
    {
        float _1045 = _1035 * 0.15915493667125701904296875;
        _1037 = _1045;
    }
    float _1047 = _1037;
    float _1049 = _1003;
    if (_1009)
    {
        float _1051 = _1047 * 6.283185482025146484375;
        float _1053 = sin(_1051);
        _1049 = _1053;
    }
    float _1055 = _1049;
    float _1057 = _1055;
    if (_1009)
    {
        float _1059 = fma(_1055, _1029, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1019 = _1059;
    }
    float _1061 = _1019;
    if (!_1009)
    {
        _1057 = _981;
    }
    float _1063 = _1057;
    float _1065 = _1063;
    if (!_1009)
    {
        _1021 = _975;
    }
    float _1067 = _1021;
    float _1069 = _1067;
    if (_1009)
    {
        float _1071 = _1041 * _1061;
        _1043 = _1071;
    }
    float _1073 = _1043;
    if (_1009)
    {
        float _1075 = fma(_995, _1073, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1065 = _1075;
    }
    float _1077 = _1065;
    if (_1009)
    {
        float _1079 = fma(_985, _1073, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1069 = _1079;
    }
    float _1081 = _1069;
    float _1083 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1085 = _1077 + _1083;
    float _1087 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1089 = _1081 + _1087;
    float _1091 = fma(_1085, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1093 = fma(_1089, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3855 = float2(_1091, _1093);
    float _1095 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3855, float2(0.0), isnan(_3855)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3855, float2(0.0), isnan(_3855)), level(0.0)).x;
    float _1097 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1099 = fma(_1095, 100.0, _1005);
    float _1101 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1103 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1101);
    float _1105 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1103);
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1109 = _1099 + _1097;
    float _1111 = _1105 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1113 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1107);
    float _1115 = 1.0 / _1111;
    float _1117 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1113);
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1121 = _1119 + _1111;
    float _1123 = _1121 * _1115;
    float _1125 = _1123 * 0.5;
    float _1127 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1129 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1127);
    float _1131 = 1.0 / _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1135 = _1131 * _1133;
    bool _1137 = _1135 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1139 = _1135 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1141 = !_1137;
    int _1143 = _1141 ? 0 : 1;
    int _1145 = 2;
    if (!_1137)
    {
        _1145 = 1;
    }
    int _1147 = _1145;
    int _1149 = _1147;
    if (!_1139)
    {
        _1149 = _1143;
    }
    int _1151 = _1149;
    int _1153 = _1151 << 6;
    int _1155 = _1153 + 96;
    uint _1158 = uint(int(uint(_1155) >> uint(2)));
    uint _1160 = uint(int(uint(int(_1158)) >> uint(2)));
    int _1162 = int(_1158) & 3;
    float _1164 = (*spvDescriptorSet0.vp_c15)._m0[int(_1160)][_1162];
    int _1166 = int(_1158) + 1;
    uint _1168 = uint(int(uint(_1166) >> uint(2)));
    int _1170 = _1166 & 3;
    float _1172 = (*spvDescriptorSet0.vp_c15)._m0[int(_1168)][_1170];
    int _1174 = _1153 + 104;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    uint _1178 = uint(int(uint(int(_1176)) >> uint(2)));
    int _1180 = int(_1176) & 3;
    float _1182 = (*spvDescriptorSet0.vp_c15)._m0[int(_1178)][_1180];
    int _1184 = int(_1176) + 1;
    uint _1186 = uint(int(uint(_1184) >> uint(2)));
    int _1188 = _1184 & 3;
    float _1190 = (*spvDescriptorSet0.vp_c15)._m0[int(_1186)][_1188];
    int _1192 = _1153 + 48;
    uint _1194 = uint(int(uint(_1192) >> uint(2)));
    uint _1196 = uint(int(uint(int(_1194)) >> uint(2)));
    int _1198 = int(_1194) & 3;
    float _1200 = (*spvDescriptorSet0.vp_c15)._m0[int(_1196)][_1198];
    int _1202 = int(_1194) + 1;
    uint _1204 = uint(int(uint(_1202) >> uint(2)));
    int _1206 = _1202 & 3;
    float _1208 = (*spvDescriptorSet0.vp_c15)._m0[int(_1204)][_1206];
    int _1210 = _1153 + 64;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    uint _1214 = uint(int(uint(int(_1212)) >> uint(2)));
    int _1216 = int(_1212) & 3;
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[int(_1214)][_1216];
    int _1220 = int(_1212) + 1;
    uint _1222 = uint(int(uint(_1220) >> uint(2)));
    int _1224 = _1220 & 3;
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[int(_1222)][_1224];
    int _1228 = _1153 + 56;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    int _1246 = _1153 + 72;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    uint _1250 = uint(int(uint(int(_1248)) >> uint(2)));
    int _1252 = int(_1248) & 3;
    float _1254 = (*spvDescriptorSet0.vp_c15)._m0[int(_1250)][_1252];
    int _1256 = int(_1248) + 1;
    uint _1258 = uint(int(uint(_1256) >> uint(2)));
    int _1260 = _1256 & 3;
    float _1262 = (*spvDescriptorSet0.vp_c15)._m0[int(_1258)][_1260];
    float _1264 = _1109 * _1172;
    float _1266 = fma(_969, _1164, _1264);
    float _1268 = fma(_959, _1182, _1266);
    float _1270 = _1268 + _1190;
    int _1272 = _1153 + 80;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    uint _1276 = uint(int(uint(int(_1274)) >> uint(2)));
    int _1278 = int(_1274) & 3;
    float _1280 = (*spvDescriptorSet0.vp_c15)._m0[int(_1276)][_1278];
    int _1282 = int(_1274) + 1;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    int _1286 = _1282 & 3;
    float _1288 = (*spvDescriptorSet0.vp_c15)._m0[int(_1284)][_1286];
    float _1290 = _1109 * _1208;
    float _1292 = 1.0 / _1270;
    float _1294 = fma(_969, _1200, _1290);
    int _1296 = _1153 + 88;
    uint _1298 = uint(int(uint(_1296) >> uint(2)));
    uint _1300 = uint(int(uint(int(_1298)) >> uint(2)));
    int _1302 = int(_1298) & 3;
    float _1304 = (*spvDescriptorSet0.vp_c15)._m0[int(_1300)][_1302];
    int _1306 = int(_1298) + 1;
    uint _1308 = uint(int(uint(_1306) >> uint(2)));
    int _1310 = _1306 & 3;
    float _1312 = (*spvDescriptorSet0.vp_c15)._m0[int(_1308)][_1310];
    float _1314 = _1109 * _1226;
    float _1316 = fma(_969, _1218, _1314);
    float _1318 = fma(_959, _1236, _1294);
    float _1320 = _1318 + _1244;
    float _1322 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1324 = fma(_959, _1254, _1316);
    float _1326 = _1320 * _1292;
    float _1328 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1330 = floor(_1322);
    float _1332 = _1324 + _1262;
    bool _1334 = _1326 >= 0.0;
    float _1336 = _1332 * _1292;
    bool _1338 = _1326 <= 1.0;
    bool _1340 = _1338 && _1334;
    float _1342 = floor(_1328);
    bool _1344 = _1336 >= 0.0;
    bool _1346 = _1344 && _1340;
    bool _1348 = _1336 <= 1.0;
    bool _1350 = _1348 && _1346;
    float _1352 = -_1330;
    float _1354 = _1322 + _1352;
    float _1356 = _1109 * _1288;
    float _1358 = fma(_969, _1280, _1356);
    float _1360 = -_1342;
    float _1362 = _1328 + _1360;
    float _1364 = fma(_959, _1304, _1358);
    float _1366 = as_type<float>(_1151);
    if (_1350)
    {
        float _1368 = float(_1151);
        _1366 = _1368;
    }
    float _1370 = _1366;
    float _1372 = _1364 + _1312;
    float _1374 = _1356;
    if (_1350)
    {
        float _1376 = rint(_1370);
        float _1378 = precise::max(_1376, 0.0);
        uint _1380 = uint(_1378);
        uint _1382 = clamp(_1380, 0u, 65535u);
        _1374 = as_type<float>(_1382);
    }
    float _1384 = _1374;
    float _1386 = _1372 * _1292;
    float2 _4352 = float2(_1362, _1354);
    float _1388 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4352, float2(0.0), isnan(_4352)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4352, float2(0.0), isnan(_4352)), level(0.0)).x;
    float _1390 = _1330;
    if (_1350)
    {
        float3 _4367 = float3(_1326, _1336, float(as_type<int>(_1384)));
        float3 _4371 = select(_4367, float3(0.0), isnan(_4367));
        float _1392 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4371.xy, uint(rint(_4371.z)), _1386, level(0.0));
        _1390 = _1392;
    }
    float _1394 = _1390;
    float _1396 = in.m_64.w;
    float _1398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1402 = _1400 != 0;
    float _1404 = in.m_70.x;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1408 = _1406 != 0;
    float _1410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1412 = _1328;
    float _1414 = _1404;
    if (_1402)
    {
        float _1416 = in.m_64.z;
        _1412 = _1416;
    }
    float _1418 = _1412;
    bool _1420 = _1396 > 0.5;
    float _1422 = -_661;
    float _1424 = _1422 + 1.0;
    int _1426 = _1420 ? as_type<int>(_1424) : as_type<int>(_661);
    bool _1428 = _923 != 0.0;
    bool _1430 = isnan(_923);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan(0.0);
    bool _1436 = _1432 || _1434;
    float _1438 = _1408 ? as_type<float>(_1426) : _661;
    bool _1440 = _1418 > 0.5;
    bool _1442 = _1440 && _1402;
    float _1444 = in.m_76.x;
    float _1446 = in.m_76.y;
    float _1448 = in.m_76.z;
    float _1450 = in.m_76.w;
    float _1452 = _1418;
    if (_1402)
    {
        _1452 = _1404;
    }
    float _1454 = _1452;
    float _1456 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1458 = _925 == 0.0;
    bool _1460 = !_1436;
    bool _1462 = _1458 && _1460;
    float _1464 = _1456 * _1398;
    bool _1466 = _913 == 0.02999999932944774627685546875;
    bool _1468 = _1466 && _1462;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1474 = _1454;
    float _1476 = _1472;
    if (_1442)
    {
        float _1478 = -_1454;
        float _1480 = _1478 + 1.0;
        _1474 = _1480;
    }
    float _1482 = _1474;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (_1402)
    {
        _1414 = _1482;
    }
    float _1488 = _1414;
    float _1490 = in.m_78.x;
    float _1492 = in.m_78.y;
    float _1494 = in.m_78.z;
    float _1496 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1498 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1504 = _1496 * _1410;
    float _1506 = _671 * _1446;
    float _1508 = _663 * _1446;
    float _1510 = _675 * _1446;
    out.m_80.x = _1498;
    out.m_80.y = _1500;
    out.m_80.z = _1502;
    out.m_80.w = _1472;
    float _1512 = fma(_935, _1444, _1506);
    float _1514 = fma(_933, _1444, _1508);
    float _1516 = fma(_941, _1444, _1510);
    out.m_82.z = _1504;
    out.m_82.w = _1464;
    float _1518 = 0.0;
    float _1520 = _1512;
    float _1522 = _1506;
    float _1524 = _1504;
    float _1526 = _1490;
    if (_1468)
    {
        _1518 = _1490;
    }
    float _1528 = _1518;
    float _1530 = fma(_963, _1448, _1512);
    float _1532 = _1528;
    if (_1468)
    {
        _1520 = _1494;
    }
    float _1534 = _1520;
    float _1536 = fma(_991, _1448, _1514);
    float _1538 = _1534;
    if (_1468)
    {
        _1522 = _1528;
    }
    float _1540 = _1522;
    float _1542 = fma(_953, _1448, _1516);
    float _1544 = _1540;
    if (!_1468)
    {
        _1532 = _1490;
    }
    float _1546 = _1532;
    if (_1468)
    {
        _1524 = _1492;
    }
    float _1548 = _1524;
    float _1550 = _1548;
    if (_1468)
    {
        _1526 = _1534;
    }
    float _1552 = _1526;
    float _1554 = _1448 * _1546;
    float _1556 = _1552;
    if (!_1468)
    {
        _1538 = _1494;
    }
    float _1558 = _1538;
    out.m_84.x = _1530;
    out.m_84.y = _1536;
    out.m_84.z = _1542;
    if (_1468)
    {
        _1476 = _1548;
    }
    float _1560 = _1476;
    float _1562 = _1560;
    if (!_1468)
    {
        float _1564 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1546);
        _1544 = _1564;
    }
    float _1566 = _1544;
    if (!_1468)
    {
        _1550 = _1492;
    }
    float _1568 = _1550;
    float _1570 = _1446 * _1558;
    if (!_1468)
    {
        float _1572 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1558);
        _1556 = _1572;
    }
    float _1574 = _1556;
    float _1576 = -_1570;
    float _1578 = fma(_1448, _1568, _1576);
    float _1580 = _1444 * _1568;
    float _1582 = _1570;
    if (_1009)
    {
        float _1584 = _1047 * 6.283185482025146484375;
        float _1586 = cos(_1584);
        _1582 = _1586;
    }
    float _1588 = _1582;
    float _1590 = -_1554;
    float _1592 = fma(_1444, _1558, _1590);
    if (!_1468)
    {
        float _1594 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1568);
        _1562 = _1594;
    }
    float _1596 = _1562;
    float _1598 = -_1580;
    float _1600 = fma(_1446, _1546, _1598);
    float _1602 = _1578 * _1450;
    float _1604 = _1592 * _1450;
    float _1606 = _663 * _1596;
    float _1608 = _1600 * _1450;
    float _1610 = _671 * _1596;
    float _1612 = _671 * _1604;
    float _1614 = _675 * _1596;
    float _1616 = _663 * _1604;
    float _1618 = _675 * _1604;
    float _1620 = fma(_935, _1566, _1610);
    float _1622 = fma(_935, _1602, _1612);
    float _1624 = fma(_933, _1602, _1616);
    float _1626 = _1610;
    float _1628 = _1608;
    if (_1009)
    {
        float _1630 = _1588 + (-1.0);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = fma(_941, _1602, _1618);
    float _1636 = fma(_963, _1608, _1622);
    float _1638 = fma(_991, _1608, _1624);
    float _1640 = _1632;
    if (_1009)
    {
        float _1642 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1640 = _1642;
    }
    float _1644 = _1640;
    float _1646 = fma(_953, _1608, _1634);
    if (!_1009)
    {
        _1628 = _1007;
    }
    float _1648 = _1628;
    float _1650 = fma(_933, _1566, _1606);
    float _1652 = _1648;
    if (_1009)
    {
        float _1654 = fma(_1007, _1588, _1644);
        _1652 = _1654;
    }
    float _1656 = _1652;
    float _1658 = fma(_941, _1566, _1614);
    out.m_86.x = _1636;
    out.m_86.y = _1638;
    out.m_86.z = _1646;
    float _1660 = fma(_963, _1574, _1620);
    float _1662 = fma(_1095, 100.0, _1656);
    float _1664 = fma(_991, _1574, _1650);
    float _1666 = fma(_953, _1574, _1658);
    float _1668 = _1109 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1670 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1672 = abs(_1135);
    float _1674 = log2(_1672);
    float _1676 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1678 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1668);
    float _1680 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1670);
    float _1682 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1684 = _1109 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1686 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1678);
    float _1688 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1680);
    float _1690 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1676);
    float _1692 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1684);
    float _1694 = _1686 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1696 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1682);
    float _1698 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1690);
    float _1700 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1692);
    float _1702 = _1688 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1704 = trunc(_1694);
    int _1706 = int(_1704);
    float _1708 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1710 = _1700 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1712 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1714 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1696);
    float _1716 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1718 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1720 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1722 = trunc(_1710);
    int _1724 = int(_1722);
    float _1726 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1728 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1730 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1712);
    float _1732 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1718);
    float _1736 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1720);
    float _1738 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1726);
    float _1740 = exp2(_1708);
    float _1742 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1728);
    float _1744 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1730);
    int _1746 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1748 = _1706 + _1746;
    int _1750 = _1748 + 1;
    float _1752 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1734);
    float _1754 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1736);
    float _1756 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1738);
    float _1758 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1742);
    int _1760 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1762 = _1724 + _1760;
    int _1764 = _1762 + 1;
    float _1766 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1768 = _1750 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1770 = _1750 | _1764;
    float _1772 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1754);
    float _1774 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1752);
    bool _1776 = _1770 < 0;
    bool _1778 = _1776 || _1768;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1782 = _1662 + _1780;
    float _1784 = fma(_1740, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1786 = precise::clamp(_1784, 0.0, 1.0);
    bool _1788 = _1764 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1790 = _1788 || _1778;
    float _1792 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1756);
    float _1794 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1758);
    float _1796 = fma(_1786, -2.0, 3.0);
    float _1798 = _1786 * _1786;
    float _1800 = _1782 * _1782;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1804 = _1077 + _1802;
    out.gl_Position.x = _1774;
    out.gl_Position.y = _1772;
    out.gl_Position.z = _1792;
    out.gl_Position.w = _1794;
    float _1806 = _1798 * _1796;
    bool _1808 = _1135 <= 8000.0;
    bool _1810 = isnan(_1135);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan(8000.0);
    bool _1816 = _1812 || _1814;
    float _1818 = float(_1816);
    float _1820 = fma(_1804, _1804, _1800);
    float _1822 = -_1806;
    float _1824 = _1822 + 1.0;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1806);
    float _1828 = _1774;
    float _1830 = _1772;
    float _1832 = _1792;
    float _1834 = _1710;
    float _1836 = _1694;
    if (_1790)
    {
        _1828 = 1.0;
    }
    float _1838 = _1828;
    float _1840 = _1838;
    if (!_1790)
    {
        int _1842 = _1764 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1844 = _1842 + _1750;
        float _1846 = floor(_1694);
        int _1848 = _1844 << 2;
        uint _1850 = uint(int(uint(_1844) >> uint(2)));
        int _1852 = 12 & _1848;
        int _1854 = int(_1850) << 4;
        int _1856 = _1854 + _1852;
        float _1858 = floor(_1710);
        float _1860 = -_1846;
        float _1862 = _1694 + _1860;
        int _1864 = _1856 + 400;
        uint _1866 = uint(int(uint(_1864) >> uint(2)));
        uint _1868 = uint(int(uint(int(_1866)) >> uint(2)));
        int _1870 = int(_1866) & 3;
        float _1872 = (*spvDescriptorSet0.vp_c15)._m0[int(_1868)][_1870];
        float _1874 = -_1858;
        float _1876 = _1710 + _1874;
        float _1878 = rint(_1872);
        float _1880 = precise::max(_1878, 0.0);
        uint _1882 = uint(_1880);
        uint _1884 = clamp(_1882, 0u, 65535u);
        float3 _5237 = float3(_1862, _1876, float(int(_1884)));
        float3 _5239 = select(_5237, float3(0.0), isnan(_5237));
        float _1886 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5239.xy, uint(rint(_5239.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5239.xy, uint(rint(_5239.z)), level(0.0)).x;
        int _1888 = _1844 << 4;
        int _1890 = _1888 + 2048;
        uint _1892 = uint(int(uint(_1890) >> uint(2)));
        uint _1894 = uint(int(uint(int(_1892)) >> uint(2)));
        int _1896 = int(_1892) & 3;
        float _1898 = (*spvDescriptorSet0.vp_c15)._m0[int(_1894)][_1896];
        int _1900 = int(_1892) + 1;
        uint _1902 = uint(int(uint(_1900) >> uint(2)));
        int _1904 = _1900 & 3;
        float _1906 = (*spvDescriptorSet0.vp_c15)._m0[int(_1902)][_1904];
        int _1908 = _1890 + 8;
        uint _1910 = uint(int(uint(_1908) >> uint(2)));
        uint _1912 = uint(int(uint(int(_1910)) >> uint(2)));
        int _1914 = int(_1910) & 3;
        float _1916 = (*spvDescriptorSet0.vp_c15)._m0[int(_1912)][_1914];
        int _1918 = int(_1910) + 1;
        uint _1920 = uint(int(uint(_1918) >> uint(2)));
        int _1922 = _1918 & 3;
        float _1924 = (*spvDescriptorSet0.vp_c15)._m0[int(_1920)][_1922];
        float _1926 = _1109 * _1906;
        float _1928 = fma(_969, _1898, _1926);
        float _1930 = fma(_959, _1916, _1928);
        float _1932 = _1930 + _1924;
        float _1934 = precise::clamp(_1932, 0.0, 1.0);
        float _1936 = -_1934;
        float _1938 = _1936 + _1886;
        float _1940 = fma(_1938, 500.0, 1.5);
        float _1942 = exp2(_1940);
        float _1944 = 0.0 + _1942;
        float _1946 = precise::clamp(_1944, 0.0, 1.0);
        _1830 = _1872;
        _1840 = _1946;
        _1832 = _1876;
    }
    float _1948 = _1830;
    float _1950 = _1840;
    float _1952 = _1832;
    float _1954 = _1818 * _1826;
    float _1956 = in.m_66.w;
    float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1960 = _1081 + _1958;
    float _1962 = -_1388;
    float _1964 = _1962 + 1.0;
    float _1966 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1968 = _1948;
    float _1970 = _1966;
    float _1972 = _1952;
    if (!_1350)
    {
        _1968 = 1.0;
    }
    float _1974 = _1968;
    float _1976 = fma(_1960, _1960, _1820);
    float _1978 = _1974;
    if (_1350)
    {
        bool _1980 = _1394 >= _1386;
        bool _1982 = isnan(_1394);
        bool _1984 = _1980 || _1982;
        bool _1986 = isnan(_1386);
        bool _1988 = _1984 || _1986;
        float _1990 = float(_1988);
        _1978 = _1990;
    }
    float _1992 = _1978;
    float _1994 = _1964 * _1966;
    float _1996 = precise::clamp(_1994, 0.0, 1.0);
    out.m_88.x = _1660;
    out.m_88.y = _1664;
    out.m_88.z = _1666;
    float _1998 = _1992 * _1950;
    float _2000 = sqrt(_1976);
    float _2002 = -_1996;
    float _2004 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_90.x = _1077;
    out.m_90.y = _1662;
    out.m_90.z = _1081;
    float _2006 = -_1998;
    float _2008 = fma(_2006, _2004, 1.0);
    float _2010 = precise::clamp(_2008, 0.0, 1.0);
    float _2012 = _2010 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.w = _1956;
    out.m_94.x = _2012;
    bool _2014 = _2000 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2016 = isnan(_2000);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2022 = _2018 || _2020;
    float _2024 = _2004;
    float _2026 = _2010;
    if (!_2022)
    {
        _1834 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2028 = _1834;
    float _2030 = _2028;
    float _2032 = _2028;
    if (!_2022)
    {
        _1836 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2034 = _1836;
    float _2036 = _2034;
    float _2038 = _2034;
    if (!_2022)
    {
        _1970 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2040 = _1970;
    float _2042 = _2040;
    float _2044 = _2040;
    if (!_2022)
    {
        _1972 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2046 = _1972;
    float _2048 = _2046;
    float _2050 = _2046;
    if (!_2022)
    {
        _2024 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2052 = _2024;
    float _2054 = _2052;
    float _2056 = _2052;
    if (!_2022)
    {
        _2026 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2058 = _2026;
    bool _2060 = !_2022;
    float _2062 = _2058;
    float _2064 = _2058;
    if (!_2060)
    {
        bool _2066 = _2000 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2068 = isnan(_2000);
        bool _2070 = _2066 || _2068;
        bool _2072 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2074 = _2070 || _2072;
        if (!_2074)
        {
            float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2078 = _2000 + _2076;
            float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2082 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2080;
            float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2086 = _2084 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2088 = 1.0 / _2082;
            float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2092 = _2090 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2104 = _2102 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2106 = _2078 * _2088;
            float _2108 = precise::clamp(_2106, 0.0, 1.0);
            float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2112 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2114 = fma(_2108, _2086, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2116 = fma(_2108, _2112, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2118 = fma(_2108, _2092, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2120 = fma(_2108, _2096, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2122 = fma(_2108, _2100, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2124 = fma(_2108, _2104, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2038 = _2114;
            _2056 = _2122;
            _2032 = _2118;
            _2050 = _2120;
            _2044 = _2116;
            _2064 = _2124;
            _2126 = true;
        }
        else
        {
            bool _2128 = _2000 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2130 = isnan(_2000);
            bool _2132 = _2128 || _2130;
            bool _2134 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2136 = _2132 || _2134;
            if (!_2136)
            {
                _2030 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2138 = _2030;
            _2032 = _2138;
            if (!_2136)
            {
                _2036 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2140 = _2036;
            _2038 = _2140;
            if (!_2136)
            {
                _2042 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2142 = _2042;
            _2044 = _2142;
            if (!_2136)
            {
                _2048 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2144 = _2048;
            _2050 = _2144;
            if (!_2136)
            {
                _2054 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2146 = _2054;
            _2056 = _2146;
            if (!_2136)
            {
                _2062 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2148 = _2062;
            bool _2150 = !_2136;
            _2064 = _2148;
            if (!_2150)
            {
                bool _2152 = _2000 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2154 = isnan(_2000);
                bool _2156 = _2152 || _2154;
                bool _2158 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2160 = _2156 || _2158;
                if (!_2160)
                {
                    float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2164 = _2000 + _2162;
                    float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2168 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2166;
                    float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2174 = 1.0 / _2168;
                    float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2192 = _2164 * _2174;
                    float _2194 = precise::clamp(_2192, 0.0, 1.0);
                    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2198 = _2196 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2200 = fma(_2194, _2172, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2202 = fma(_2194, _2198, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2204 = fma(_2194, _2178, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2206 = fma(_2194, _2182, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2208 = fma(_2194, _2186, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2210 = fma(_2194, _2190, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2038 = _2200;
                    _2056 = _2208;
                    _2032 = _2204;
                    _2050 = _2206;
                    _2044 = _2202;
                    _2064 = _2210;
                    _2126 = true;
                }
                else
                {
                    _2038 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2056 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2032 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2050 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2044 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2064 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2126 = false;
    float _2212 = _2038;
    float _2214 = _2056;
    float _2216 = _2032;
    float _2218 = _2050;
    float _2220 = _2044;
    float _2222 = _2064;
    float _2224 = fma(_1664, -0.5, 0.5);
    float _2226 = precise::clamp(_2224, 0.0, 1.0);
    float _2228 = -_2212;
    float _2230 = _2228 + _2214;
    float _2232 = -_2216;
    float _2234 = _2232 + _2218;
    float _2236 = -_2220;
    float _2238 = _2236 + _2222;
    bool _2240 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2242 = fma(_2226, _2230, _2212);
    float _2244 = fma(_2226, _2234, _2216);
    float _2246 = fma(_2226, _2238, _2220);
    float _2248 = _2242 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _2250 = fma(_2244, 0.298911988735198974609375, _2248);
    float _2252 = fma(_2246, 0.114477999508380889892578125, _2250);
    out.m_96.x = 0.0;
    float _2254 = -_2252;
    float _2256 = _2244 + _2254;
    float _2258 = -_2252;
    float _2260 = _2242 + _2258;
    float _2262 = -_2252;
    float _2264 = _2246 + _2262;
    float _2266 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2268 = fma(_2256, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2252);
    float _2270 = fma(_2260, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2252);
    float _2272 = fma(_2264, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2252);
    out.m_94.w = _2266;
    out.m_98.x = _2268;
    out.m_98.y = _2270;
    out.m_98.z = _2272;
    if (!_2240)
    {
        return out;
    }
    float _2274 = -_1662;
    float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2278 = -_1077;
    float _2280 = _2278 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2282 = -_1081;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2286 = _2276 * _2276;
    float _2288 = fma(_2280, _2280, _2286);
    float _2290 = fma(_2284, _2284, _2288);
    float _2292 = sqrt(_2290);
    float _2294 = rsqrt(_2290);
    float _2296 = -_2292;
    float _2298 = _2296 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2300 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2302 = precise::clamp(_2300, 0.0, 1.0);
    float _2304 = _2280 * _2294;
    float _2306 = _2276 * _2294;
    float _2308 = abs(_2302);
    float _2310 = log2(_2308);
    float _2312 = _2284 * _2294;
    float _2314 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2316 = _1664 * _2306;
    float _2318 = -_2306;
    float _2320 = -_2314;
    float _2322 = fma(_2318, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2320);
    float _2324 = fma(_1660, _2304, _2316);
    float _2326 = -_2312;
    float _2328 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2322);
    float _2330 = fma(_1666, _2312, _2324);
    float _2332 = precise::clamp(_2330, 0.0, 1.0);
    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2336 = _2328 + _2334;
    float _2338 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2340 = _2336 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2342 = precise::clamp(_2340, 0.0, 1.0);
    float _2344 = exp2(_2338);
    float _2346 = _2344 * _2342;
    float _2348 = _2332 * _2346;
    float _2350 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2352 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2354 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _2350;
    out.m_96.y = _2352;
    out.m_96.z = _2354;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2126 = false;
    bool _339 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_49.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_52.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2411 = as_type<float>(_133);
        out.gl_Position.z = _2411;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_54.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _153 = 0.0;
    if (_147)
    {
        float _155 = float(_117);
        _153 = _155;
    }
    float _157 = _153;
    bool _159 = _151 >= _157;
    bool _161 = !_147;
    bool _163 = _159 || _161;
    if (_163)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_163)
    {
        out.m_52.x = 0.0;
    }
    if (_163)
    {
        float _167 = _165 * 5.0;
        _135 = as_type<int>(_167);
    }
    int _169 = _135;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2479 = as_type<float>(_169);
        out.gl_Position.z = _2479;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = in.m_56.z;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = in.m_56.y;
    float _177 = in.m_58.z;
    float _179 = in.m_58.y;
    float _181 = in.m_60.z;
    float _183 = in.m_60.y;
    float _185 = _171 * _171;
    float _187 = in.m_58.x;
    float _189 = _175 * _175;
    float _191 = in.m_60.x;
    float _193 = fma(_177, _177, _185);
    float _195 = in.m_56.x;
    float _197 = fma(_179, _179, _189);
    float _199 = fma(_181, _181, _193);
    float _201 = fma(_183, _183, _197);
    float _203 = sqrt(_199);
    float _205 = in.m_62.x;
    float _207 = in.m_62.y;
    float _209 = in.m_62.z;
    float _211 = sqrt(_201);
    bool _213 = _203 > 0.0;
    bool _215 = _211 > 0.0;
    float _217 = _179 * _207;
    float _219 = _183 * _207;
    float _221 = _175 * _207;
    float _223 = _199;
    float _225 = _221;
    float _227 = _195;
    float _229 = _205;
    float _231 = _175;
    if (_213)
    {
        float _233 = rsqrt(_199);
        _223 = _233;
    }
    float _235 = _223;
    float _237 = fma(_205, _187, _217);
    float _239 = fma(_205, _191, _219);
    float _241 = fma(_205, _195, _221);
    float _243 = fma(_177, _209, _237);
    float _245 = fma(_181, _209, _239);
    float _247 = _237;
    float _249 = _239;
    if (!_213)
    {
        _247 = 0.0;
    }
    float _251 = _247;
    float _253 = 0.0;
    float _255 = _251;
    if (_215)
    {
        float _257 = rsqrt(_201);
        _253 = _257;
    }
    float _259 = _253;
    if (!_215)
    {
        _225 = 0.0;
    }
    float _261 = _225;
    float _263 = fma(_171, _209, _241);
    float _265 = _261;
    if (!_215)
    {
        _227 = 0.0;
    }
    float _267 = _227;
    float _269 = 0.0;
    float _271 = _267;
    if (!_215)
    {
        _269 = 0.0;
    }
    float _273 = _269;
    float _275 = _273;
    if (!_213)
    {
        _249 = 0.0;
    }
    float _277 = _249;
    float _279 = _277;
    if (_213)
    {
        float _281 = _235 * 0.001000000047497451305389404296875;
        _229 = _281;
    }
    float _283 = _229;
    if (_213)
    {
        float _285 = _171 * _283;
        _255 = _285;
    }
    float _287 = _255;
    if (_213)
    {
        float _289 = _177 * _283;
        _279 = _289;
    }
    float _291 = _279;
    if (_215)
    {
        float _293 = _259 * _175;
        _265 = _293;
    }
    float _295 = _265;
    float _297 = _295;
    if (!_213)
    {
        _231 = 0.0;
    }
    float _299 = _231;
    float _301 = _299;
    if (_215)
    {
        float _303 = _259 * _179;
        _271 = _303;
    }
    float _305 = _271;
    float _307 = _305;
    if (_215)
    {
        float _309 = _259 * _183;
        _275 = _309;
    }
    float _311 = _275;
    float _313 = _311;
    if (_213)
    {
        float _315 = _181 * _283;
        _301 = _315;
    }
    float _317 = _301;
    bool _319 = !_173;
    float _337;
    if (!_319)
    {
        float _321 = in.m_64.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_117);
        float _343 = 1.0 / _341;
        float _345 = _151 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _337;
    float _349 = in.m_66.x;
    float _351 = in.m_66.y;
    float _353 = _151 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _355 = in.m_49.x;
    float _357 = in.m_49.y;
    float _359 = in.m_49.z;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = in.m_64.x;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _371;
    float _375 = 1.0 / _363;
    float _377 = 1.0 / _367;
    float _379 = -_351;
    float _381 = _379 + 1.0;
    float _383 = abs(_349);
    float _385 = log2(_383);
    float _387 = _179 * _357;
    float _389 = _183 * _357;
    float _391 = fma(_369, 6.283185482025146484375, _353);
    float _393 = fma(_187, _355, _387);
    float _395 = fma(_191, _355, _389);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = _347 + _397;
    float _401 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _391);
    float _403 = fma(_177, _359, _393);
    float _405 = fma(_181, _359, _395);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _409 = _347 + _407;
    float _411 = _399 * _375;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _415 = 1.0 / _373;
    float _417 = _385 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _419 = in.m_68.x;
    float _421 = in.m_68.y;
    float _423 = in.m_68.z;
    float _425 = _409 * _377;
    float _427 = _401 * 0.60000002384185791015625;
    float _429 = _401 * 0.15915493667125701904296875;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _431;
    float _435 = exp2(_417);
    float _437 = _427 * 0.15915493667125701904296875;
    float _439 = _401 * 1.2999999523162841796875;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _347 + _441;
    float _445 = fma(_401, 0.60000002384185791015625, 0.31415927410125732421875);
    float _447 = _439 * 0.15915493667125701904296875;
    float _449 = fma(_433, _411, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _451 = _437 * 6.283185482025146484375;
    float _453 = sin(_451);
    float _455 = _443 * _415;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _457;
    float _461 = fma(_401, 1.2999999523162841796875, 0.680678427219390869140625);
    float _463 = _401 + 0.52359879016876220703125;
    float _465 = _445 * 0.15915493667125701904296875;
    float _467 = fma(_459, _411, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _469 = fma(_413, _435, _353);
    float _471 = _429 * 6.283185482025146484375;
    float _473 = sin(_471);
    bool _475 = _419 > 0.0;
    float _477 = _461 * 0.15915493667125701904296875;
    bool _479 = _419 >= 0.0;
    bool _481 = isnan(_419);
    bool _483 = _479 || _481;
    bool _485 = isnan(0.0);
    bool _487 = _483 || _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = _263 * _263;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _499;
    float _503 = _447 * 6.283185482025146484375;
    float _505 = sin(_503);
    float _507 = fma(_491, _411, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _509 = _463 * 0.15915493667125701904296875;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _515 = fma(_243, _243, _497);
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _521 = fma(_495, _425, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _523 = fma(_453, 0.60000002384185791015625, _473);
    float _525 = fma(_245, _245, _515);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _527;
    float _531 = fma(_369, 6.283185482025146484375, _469);
    float _533 = _509 * 6.283185482025146484375;
    float _535 = sin(_533);
    int _537 = _487 ? 0 : 1;
    float _539 = fma(_513, _425, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _541 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _543 = isnan(_347);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = fma(_505, 0.300000011920928955078125, _523);
    bool _555 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _557 = isnan(_347);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = _531 * 0.60000002384185791015625;
    int _569 = ~_537;
    int _571 = _569 + 1;
    int _573 = _571 + 1;
    float _575 = _465 * 6.283185482025146484375;
    float _577 = sin(_575);
    int _579 = _573;
    float _581 = _357;
    if (!_475)
    {
        int _583 = ~_537;
        int _585 = _583 + 1;
        _579 = _585;
    }
    int _587 = _579;
    float _589 = fma(_519, _425, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _591 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _593 = isnan(_347);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -_565;
    float _605 = _603 + 1.0;
    bool _607 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _609 = isnan(_347);
    bool _611 = _607 || _609;
    bool _613 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _615 = _611 || _613;
    float _617 = float(_615);
    float _619 = _567 * 0.15915493667125701904296875;
    float _621 = rsqrt(_525);
    float _623 = -_551;
    float _625 = _623 + 1.0;
    float _627 = _551 * _605;
    float _629 = fma(_501, _455, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _631;
    float _635 = _617 * _625;
    float _637 = -_617;
    float _639 = _637 + 1.0;
    float _641 = fma(_529, _455, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _643 = _477 * 6.283185482025146484375;
    float _645 = sin(_643);
    float _647 = fma(_577, 0.60000002384185791015625, _535);
    float _649 = fma(_633, _455, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _651 = _531 * 0.15915493667125701904296875;
    float _653 = _531 * 1.2999999523162841796875;
    float _655 = _601 * _639;
    float _657 = -_349;
    float _659 = _657 + 1.0;
    float _661 = in.m_70.y;
    float _663 = _263 * _621;
    float _665 = _619 * 6.283185482025146484375;
    float _667 = sin(_665);
    float _669 = _653 * 0.15915493667125701904296875;
    float _671 = _243 * _621;
    float _673 = _553 * _659;
    float _675 = _245 * _621;
    float _677 = -_601;
    float _679 = _677 + 1.0;
    float _681 = _467 * _655;
    float _683 = fma(_645, 0.300000011920928955078125, _647);
    float _685 = _663 * _295;
    float _687 = _651 * 6.283185482025146484375;
    float _689 = sin(_687);
    float _691 = _673 * 0.52359879016876220703125;
    float _693 = abs(_683);
    float _695 = _381 * _693;
    float _697 = fma(_671, _305, _685);
    float _699 = _507 * _655;
    float _701 = _691 * 0.15915493667125701904296875;
    float _703 = _695 * (-45.0);
    float _705 = fma(_675, _311, _697);
    float _707 = _669 * 6.283185482025146484375;
    float _709 = sin(_707);
    float _711 = _449 * _655;
    float _713 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[143].x, _699);
    float _715 = _703 * 0.01745329238474369049072265625;
    float _717 = abs(_705);
    bool _719 = _717 > 0.99989998340606689453125;
    float _721 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[143].y, _711);
    float _723 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[143].z, _681);
    float _725 = float(_587);
    float _727 = fma(_667, 0.60000002384185791015625, _689);
    float _729 = fma(_539, _635, _721);
    float _731 = _701 * 6.283185482025146484375;
    float _733 = sin(_731);
    float _735 = _695 * (-20.0);
    float _737 = _715 * 0.15915493667125701904296875;
    float _739 = fma(_521, _635, _713);
    float _741 = fma(_589, _635, _723);
    float _743 = fma(_709, 0.300000011920928955078125, _727);
    float _745 = fma(_661, 0.5, 0.5);
    float _747 = _725 * _735;
    float _749 = _701 * 6.283185482025146484375;
    float _751 = cos(_749);
    if (_719)
    {
        float _753 = _305 + _291;
        _307 = _753;
    }
    float _755 = _307;
    float _757 = _745 * _743;
    float _759 = _747 * 0.01745329238474369049072265625;
    if (_719)
    {
        float _761 = _311 + _317;
        _313 = _761;
    }
    float _763 = _313;
    float _765 = fma(_629, _627, _739);
    float _767 = _757 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _769 = _759 * 0.15915493667125701904296875;
    float _771 = _737 * 6.283185482025146484375;
    float _773 = sin(_771);
    float _775 = -_755;
    float _777 = _675 * _775;
    float _779 = _767 * 0.01745329238474369049072265625;
    float _781 = _733 * _419;
    if (_719)
    {
        float _783 = _295 + _287;
        _297 = _783;
    }
    float _785 = _297;
    float _787 = -_763;
    float _789 = -_777;
    float _791 = fma(_671, _787, _789);
    float _793 = -_763;
    float _795 = _663 * _793;
    float _797 = fma(_641, _627, _729);
    float _799 = _737 * 6.283185482025146484375;
    float _801 = cos(_799);
    float _803 = -_781;
    float _805 = fma(_751, _423, _803);
    float _807 = in.m_72.x;
    float _809 = in.m_72.y;
    float _811 = in.m_72.z;
    float _813 = -_785;
    float _815 = _671 * _813;
    float _817 = fma(_649, _627, _741);
    float _819 = _805 + 0.02999999932944774627685546875;
    float _821 = _779 * 0.15915493667125701904296875;
    float _823 = -_785;
    float _825 = -_795;
    float _827 = fma(_675, _823, _825);
    float _829 = _769 * 6.283185482025146484375;
    float _831 = cos(_829);
    float _833 = -_755;
    float _835 = -_815;
    float _837 = fma(_663, _833, _835);
    float _839 = _791 * _791;
    float _841 = _751 * _419;
    float _843 = _421 + (-0.0199999995529651641845703125);
    float _845 = _773 * _819;
    float _847 = fma(_827, _827, _839);
    float _849 = fma(_733, _423, _841);
    float _851 = _769 * 6.283185482025146484375;
    float _853 = sin(_851);
    float _855 = -_845;
    float _857 = fma(_801, _843, _855);
    float _859 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[146].x, _765);
    float _861 = fma(_837, _837, _847);
    float _863 = fma(_725, -0.100000001490116119384765625, _849);
    float _865 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[146].y, _797);
    float _867 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[146].z, _817);
    float _869 = _821 * 6.283185482025146484375;
    float _871 = sin(_869);
    float _873 = _857 * _831;
    float _875 = _865 * _809;
    float _877 = _859 * _807;
    float _879 = _867 * _811;
    float _881 = _875 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _883 = _877 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _885 = _821 * 6.283185482025146484375;
    float _887 = cos(_885);
    float _889 = _857 * _853;
    float _891 = fma(_853, _863, _873);
    float _893 = _879 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _895 = -_889;
    float _897 = fma(_831, _863, _895);
    float _899 = _891 + 0.0199999995529651641845703125;
    float _901 = in.m_58.w;
    float _903 = rsqrt(_861);
    float _905 = _801 * _819;
    float _907 = fma(_725, 0.100000001490116119384765625, _897);
    float _909 = _899 * _871;
    float _911 = in.m_60.w;
    float _913 = fma(_773, _843, _905);
    float _915 = _899 * _887;
    float _917 = -_909;
    float _919 = fma(_907, _887, _917);
    float _921 = _913 + (-0.02999999932944774627685546875);
    float _923 = fma(_907, _871, _915);
    float _925 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[194].x, _919);
    float _927 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _921);
    float _929 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _923);
    float _931 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _925);
    float _933 = _791 * _903;
    float _935 = _827 * _903;
    float _937 = _881 * _929;
    float _939 = _883 * _931;
    float _941 = _837 * _903;
    float _943 = _671 * _933;
    float _945 = _937 * _675;
    float _947 = _893 * _927;
    float _949 = _663 * _941;
    float _951 = -_943;
    float _953 = fma(_663, _935, _951);
    float _955 = _937 * _671;
    float _957 = fma(_939, _941, _945);
    float _959 = _405 + _911;
    float _961 = -_949;
    float _963 = fma(_675, _933, _961);
    float _965 = fma(_939, _935, _955);
    float _967 = fma(_947, _953, _957);
    float _969 = _403 + _901;
    float _971 = _937 * _663;
    float _973 = fma(_947, _963, _965);
    float _975 = _959 + _967;
    float _977 = in.m_74.y;
    float _979 = _675 * _935;
    float _981 = _969 + _973;
    float _983 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _985 = _975 + _983;
    float _987 = fma(_939, _933, _971);
    float _989 = -_979;
    float _991 = fma(_671, _941, _989);
    float _993 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _995 = _981 + _993;
    float _997 = _985 * _985;
    float _999 = fma(_947, _991, _987);
    float _1001 = fma(_995, _995, _997);
    float _1003 = sqrt(_1001);
    float _1005 = _357 + _977;
    float _1007 = _1005 + _999;
    bool _1009 = _1003 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1013 = _1003 + _1011;
    float _1015 = _689;
    float _1017 = _1013;
    float _1019 = _907;
    float _1021 = _981;
    if (_1009)
    {
        float _1023 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1015 = _1023;
    }
    float _1025 = _1015;
    if (_1009)
    {
        float _1027 = _1007 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _581 = _1027;
    }
    float _1029 = _581;
    float _1031 = _1025;
    if (_1009)
    {
        float _1033 = _1013 * _1025;
        _1031 = _1033;
    }
    float _1035 = _1031;
    float _1037 = _1035;
    if (_1009)
    {
        float _1039 = rsqrt(_1001);
        _1017 = _1039;
    }
    float _1041 = _1017;
    float _1043 = _1041;
    if (_1009)
    {
        float _1045 = _1035 * 0.15915493667125701904296875;
        _1037 = _1045;
    }
    float _1047 = _1037;
    float _1049 = _1003;
    if (_1009)
    {
        float _1051 = _1047 * 6.283185482025146484375;
        float _1053 = sin(_1051);
        _1049 = _1053;
    }
    float _1055 = _1049;
    float _1057 = _1055;
    if (_1009)
    {
        float _1059 = fma(_1055, _1029, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1019 = _1059;
    }
    float _1061 = _1019;
    if (!_1009)
    {
        _1057 = _981;
    }
    float _1063 = _1057;
    float _1065 = _1063;
    if (!_1009)
    {
        _1021 = _975;
    }
    float _1067 = _1021;
    float _1069 = _1067;
    if (_1009)
    {
        float _1071 = _1041 * _1061;
        _1043 = _1071;
    }
    float _1073 = _1043;
    if (_1009)
    {
        float _1075 = fma(_995, _1073, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1065 = _1075;
    }
    float _1077 = _1065;
    if (_1009)
    {
        float _1079 = fma(_985, _1073, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1069 = _1079;
    }
    float _1081 = _1069;
    float _1083 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1085 = _1077 + _1083;
    float _1087 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1089 = _1081 + _1087;
    float _1091 = fma(_1085, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1093 = fma(_1089, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3855 = float2(_1091, _1093);
    float _1095 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3855, float2(0.0), isnan(_3855)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3855, float2(0.0), isnan(_3855)), level(0.0)).x;
    float _1097 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1099 = fma(_1095, 100.0, _1005);
    float _1101 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1103 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1101);
    float _1105 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1103);
    float _1107 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1109 = _1099 + _1097;
    float _1111 = _1105 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1113 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1107);
    float _1115 = 1.0 / _1111;
    float _1117 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1113);
    float _1119 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1121 = _1119 + _1111;
    float _1123 = _1121 * _1115;
    float _1125 = _1123 * 0.5;
    float _1127 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1129 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1127);
    float _1131 = 1.0 / _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1135 = _1131 * _1133;
    bool _1137 = _1135 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1139 = _1135 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1141 = !_1137;
    int _1143 = _1141 ? 0 : 1;
    int _1145 = 2;
    if (!_1137)
    {
        _1145 = 1;
    }
    int _1147 = _1145;
    int _1149 = _1147;
    if (!_1139)
    {
        _1149 = _1143;
    }
    int _1151 = _1149;
    int _1153 = _1151 << 6;
    int _1155 = _1153 + 96;
    uint _1158 = uint(int(uint(_1155) >> uint(2)));
    uint _1160 = uint(int(uint(int(_1158)) >> uint(2)));
    int _1162 = int(_1158) & 3;
    float _1164 = (*spvDescriptorSet0.vp_c15)._m0[int(_1160)][_1162];
    int _1166 = int(_1158) + 1;
    uint _1168 = uint(int(uint(_1166) >> uint(2)));
    int _1170 = _1166 & 3;
    float _1172 = (*spvDescriptorSet0.vp_c15)._m0[int(_1168)][_1170];
    int _1174 = _1153 + 104;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    uint _1178 = uint(int(uint(int(_1176)) >> uint(2)));
    int _1180 = int(_1176) & 3;
    float _1182 = (*spvDescriptorSet0.vp_c15)._m0[int(_1178)][_1180];
    int _1184 = int(_1176) + 1;
    uint _1186 = uint(int(uint(_1184) >> uint(2)));
    int _1188 = _1184 & 3;
    float _1190 = (*spvDescriptorSet0.vp_c15)._m0[int(_1186)][_1188];
    int _1192 = _1153 + 48;
    uint _1194 = uint(int(uint(_1192) >> uint(2)));
    uint _1196 = uint(int(uint(int(_1194)) >> uint(2)));
    int _1198 = int(_1194) & 3;
    float _1200 = (*spvDescriptorSet0.vp_c15)._m0[int(_1196)][_1198];
    int _1202 = int(_1194) + 1;
    uint _1204 = uint(int(uint(_1202) >> uint(2)));
    int _1206 = _1202 & 3;
    float _1208 = (*spvDescriptorSet0.vp_c15)._m0[int(_1204)][_1206];
    int _1210 = _1153 + 64;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    uint _1214 = uint(int(uint(int(_1212)) >> uint(2)));
    int _1216 = int(_1212) & 3;
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[int(_1214)][_1216];
    int _1220 = int(_1212) + 1;
    uint _1222 = uint(int(uint(_1220) >> uint(2)));
    int _1224 = _1220 & 3;
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[int(_1222)][_1224];
    int _1228 = _1153 + 56;
    uint _1230 = uint(int(uint(_1228) >> uint(2)));
    uint _1232 = uint(int(uint(int(_1230)) >> uint(2)));
    int _1234 = int(_1230) & 3;
    float _1236 = (*spvDescriptorSet0.vp_c15)._m0[int(_1232)][_1234];
    int _1238 = int(_1230) + 1;
    uint _1240 = uint(int(uint(_1238) >> uint(2)));
    int _1242 = _1238 & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    int _1246 = _1153 + 72;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    uint _1250 = uint(int(uint(int(_1248)) >> uint(2)));
    int _1252 = int(_1248) & 3;
    float _1254 = (*spvDescriptorSet0.vp_c15)._m0[int(_1250)][_1252];
    int _1256 = int(_1248) + 1;
    uint _1258 = uint(int(uint(_1256) >> uint(2)));
    int _1260 = _1256 & 3;
    float _1262 = (*spvDescriptorSet0.vp_c15)._m0[int(_1258)][_1260];
    float _1264 = _1109 * _1172;
    float _1266 = fma(_969, _1164, _1264);
    float _1268 = fma(_959, _1182, _1266);
    float _1270 = _1268 + _1190;
    int _1272 = _1153 + 80;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    uint _1276 = uint(int(uint(int(_1274)) >> uint(2)));
    int _1278 = int(_1274) & 3;
    float _1280 = (*spvDescriptorSet0.vp_c15)._m0[int(_1276)][_1278];
    int _1282 = int(_1274) + 1;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    int _1286 = _1282 & 3;
    float _1288 = (*spvDescriptorSet0.vp_c15)._m0[int(_1284)][_1286];
    float _1290 = _1109 * _1208;
    float _1292 = 1.0 / _1270;
    float _1294 = fma(_969, _1200, _1290);
    int _1296 = _1153 + 88;
    uint _1298 = uint(int(uint(_1296) >> uint(2)));
    uint _1300 = uint(int(uint(int(_1298)) >> uint(2)));
    int _1302 = int(_1298) & 3;
    float _1304 = (*spvDescriptorSet0.vp_c15)._m0[int(_1300)][_1302];
    int _1306 = int(_1298) + 1;
    uint _1308 = uint(int(uint(_1306) >> uint(2)));
    int _1310 = _1306 & 3;
    float _1312 = (*spvDescriptorSet0.vp_c15)._m0[int(_1308)][_1310];
    float _1314 = _1109 * _1226;
    float _1316 = fma(_969, _1218, _1314);
    float _1318 = fma(_959, _1236, _1294);
    float _1320 = _1318 + _1244;
    float _1322 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1324 = fma(_959, _1254, _1316);
    float _1326 = _1320 * _1292;
    float _1328 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1330 = floor(_1322);
    float _1332 = _1324 + _1262;
    bool _1334 = _1326 >= 0.0;
    float _1336 = _1332 * _1292;
    bool _1338 = _1326 <= 1.0;
    bool _1340 = _1338 && _1334;
    float _1342 = floor(_1328);
    bool _1344 = _1336 >= 0.0;
    bool _1346 = _1344 && _1340;
    bool _1348 = _1336 <= 1.0;
    bool _1350 = _1348 && _1346;
    float _1352 = -_1330;
    float _1354 = _1322 + _1352;
    float _1356 = _1109 * _1288;
    float _1358 = fma(_969, _1280, _1356);
    float _1360 = -_1342;
    float _1362 = _1328 + _1360;
    float _1364 = fma(_959, _1304, _1358);
    float _1366 = as_type<float>(_1151);
    if (_1350)
    {
        float _1368 = float(_1151);
        _1366 = _1368;
    }
    float _1370 = _1366;
    float _1372 = _1364 + _1312;
    float _1374 = _1356;
    if (_1350)
    {
        float _1376 = rint(_1370);
        float _1378 = precise::max(_1376, 0.0);
        uint _1380 = uint(_1378);
        uint _1382 = clamp(_1380, 0u, 65535u);
        _1374 = as_type<float>(_1382);
    }
    float _1384 = _1374;
    float _1386 = _1372 * _1292;
    float2 _4352 = float2(_1362, _1354);
    float _1388 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4352, float2(0.0), isnan(_4352)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4352, float2(0.0), isnan(_4352)), level(0.0)).x;
    float _1390 = _1330;
    if (_1350)
    {
        float3 _4367 = float3(_1326, _1336, float(as_type<int>(_1384)));
        float3 _4371 = select(_4367, float3(0.0), isnan(_4367));
        float _1392 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4371.xy, uint(rint(_4371.z)), _1386, level(0.0));
        _1390 = _1392;
    }
    float _1394 = _1390;
    float _1396 = in.m_64.w;
    float _1398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1402 = _1400 != 0;
    float _1404 = in.m_70.x;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1408 = _1406 != 0;
    float _1410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1412 = _1328;
    float _1414 = _1404;
    if (_1402)
    {
        float _1416 = in.m_64.z;
        _1412 = _1416;
    }
    float _1418 = _1412;
    bool _1420 = _1396 > 0.5;
    float _1422 = -_661;
    float _1424 = _1422 + 1.0;
    int _1426 = _1420 ? as_type<int>(_1424) : as_type<int>(_661);
    bool _1428 = _923 != 0.0;
    bool _1430 = isnan(_923);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan(0.0);
    bool _1436 = _1432 || _1434;
    float _1438 = _1408 ? as_type<float>(_1426) : _661;
    bool _1440 = _1418 > 0.5;
    bool _1442 = _1440 && _1402;
    float _1444 = in.m_76.x;
    float _1446 = in.m_76.y;
    float _1448 = in.m_76.z;
    float _1450 = in.m_76.w;
    float _1452 = _1418;
    if (_1402)
    {
        _1452 = _1404;
    }
    float _1454 = _1452;
    float _1456 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1458 = _925 == 0.0;
    bool _1460 = !_1436;
    bool _1462 = _1458 && _1460;
    float _1464 = _1456 * _1398;
    bool _1466 = _913 == 0.02999999932944774627685546875;
    bool _1468 = _1466 && _1462;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1474 = _1454;
    float _1476 = _1472;
    if (_1442)
    {
        float _1478 = -_1454;
        float _1480 = _1478 + 1.0;
        _1474 = _1480;
    }
    float _1482 = _1474;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    if (_1402)
    {
        _1414 = _1482;
    }
    float _1488 = _1414;
    float _1490 = in.m_78.x;
    float _1492 = in.m_78.y;
    float _1494 = in.m_78.z;
    float _1496 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1498 = _1470 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1504 = _1496 * _1410;
    float _1506 = _671 * _1446;
    float _1508 = _663 * _1446;
    float _1510 = _675 * _1446;
    out.m_80.x = _1498;
    out.m_80.y = _1500;
    out.m_80.z = _1502;
    out.m_80.w = _1472;
    float _1512 = fma(_935, _1444, _1506);
    float _1514 = fma(_933, _1444, _1508);
    float _1516 = fma(_941, _1444, _1510);
    out.m_82.z = _1504;
    out.m_82.w = _1464;
    float _1518 = 0.0;
    float _1520 = _1512;
    float _1522 = _1506;
    float _1524 = _1504;
    float _1526 = _1490;
    if (_1468)
    {
        _1518 = _1490;
    }
    float _1528 = _1518;
    float _1530 = fma(_963, _1448, _1512);
    float _1532 = _1528;
    if (_1468)
    {
        _1520 = _1494;
    }
    float _1534 = _1520;
    float _1536 = fma(_991, _1448, _1514);
    float _1538 = _1534;
    if (_1468)
    {
        _1522 = _1528;
    }
    float _1540 = _1522;
    float _1542 = fma(_953, _1448, _1516);
    float _1544 = _1540;
    if (!_1468)
    {
        _1532 = _1490;
    }
    float _1546 = _1532;
    if (_1468)
    {
        _1524 = _1492;
    }
    float _1548 = _1524;
    float _1550 = _1548;
    if (_1468)
    {
        _1526 = _1534;
    }
    float _1552 = _1526;
    float _1554 = _1448 * _1546;
    float _1556 = _1552;
    if (!_1468)
    {
        _1538 = _1494;
    }
    float _1558 = _1538;
    out.m_84.x = _1530;
    out.m_84.y = _1536;
    out.m_84.z = _1542;
    if (_1468)
    {
        _1476 = _1548;
    }
    float _1560 = _1476;
    float _1562 = _1560;
    if (!_1468)
    {
        float _1564 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1546);
        _1544 = _1564;
    }
    float _1566 = _1544;
    if (!_1468)
    {
        _1550 = _1492;
    }
    float _1568 = _1550;
    float _1570 = _1446 * _1558;
    if (!_1468)
    {
        float _1572 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1558);
        _1556 = _1572;
    }
    float _1574 = _1556;
    float _1576 = -_1570;
    float _1578 = fma(_1448, _1568, _1576);
    float _1580 = _1444 * _1568;
    float _1582 = _1570;
    if (_1009)
    {
        float _1584 = _1047 * 6.283185482025146484375;
        float _1586 = cos(_1584);
        _1582 = _1586;
    }
    float _1588 = _1582;
    float _1590 = -_1554;
    float _1592 = fma(_1444, _1558, _1590);
    if (!_1468)
    {
        float _1594 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1568);
        _1562 = _1594;
    }
    float _1596 = _1562;
    float _1598 = -_1580;
    float _1600 = fma(_1446, _1546, _1598);
    float _1602 = _1578 * _1450;
    float _1604 = _1592 * _1450;
    float _1606 = _663 * _1596;
    float _1608 = _1600 * _1450;
    float _1610 = _671 * _1596;
    float _1612 = _671 * _1604;
    float _1614 = _675 * _1596;
    float _1616 = _663 * _1604;
    float _1618 = _675 * _1604;
    float _1620 = fma(_935, _1566, _1610);
    float _1622 = fma(_935, _1602, _1612);
    float _1624 = fma(_933, _1602, _1616);
    float _1626 = _1610;
    float _1628 = _1608;
    if (_1009)
    {
        float _1630 = _1588 + (-1.0);
        _1626 = _1630;
    }
    float _1632 = _1626;
    float _1634 = fma(_941, _1602, _1618);
    float _1636 = fma(_963, _1608, _1622);
    float _1638 = fma(_991, _1608, _1624);
    float _1640 = _1632;
    if (_1009)
    {
        float _1642 = _1632 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1640 = _1642;
    }
    float _1644 = _1640;
    float _1646 = fma(_953, _1608, _1634);
    if (!_1009)
    {
        _1628 = _1007;
    }
    float _1648 = _1628;
    float _1650 = fma(_933, _1566, _1606);
    float _1652 = _1648;
    if (_1009)
    {
        float _1654 = fma(_1007, _1588, _1644);
        _1652 = _1654;
    }
    float _1656 = _1652;
    float _1658 = fma(_941, _1566, _1614);
    out.m_86.x = _1636;
    out.m_86.y = _1638;
    out.m_86.z = _1646;
    float _1660 = fma(_963, _1574, _1620);
    float _1662 = fma(_1095, 100.0, _1656);
    float _1664 = fma(_991, _1574, _1650);
    float _1666 = fma(_953, _1574, _1658);
    float _1668 = _1109 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1670 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1672 = abs(_1135);
    float _1674 = log2(_1672);
    float _1676 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1678 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1668);
    float _1680 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1670);
    float _1682 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1684 = _1109 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1686 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1678);
    float _1688 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1680);
    float _1690 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1676);
    float _1692 = fma(_969, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1684);
    float _1694 = _1686 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1696 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1682);
    float _1698 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1690);
    float _1700 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1692);
    float _1702 = _1688 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1704 = trunc(_1694);
    int _1706 = int(_1704);
    float _1708 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1710 = _1700 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1712 = _1662 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1714 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1696);
    float _1716 = _1698 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1718 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1720 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1722 = trunc(_1710);
    int _1724 = int(_1722);
    float _1726 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1728 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1730 = fma(_1077, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1712);
    float _1732 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1734 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1718);
    float _1736 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1720);
    float _1738 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1726);
    float _1740 = exp2(_1708);
    float _1742 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1728);
    float _1744 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1730);
    int _1746 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1748 = _1706 + _1746;
    int _1750 = _1748 + 1;
    float _1752 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1734);
    float _1754 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1736);
    float _1756 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1738);
    float _1758 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1742);
    int _1760 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1762 = _1724 + _1760;
    int _1764 = _1762 + 1;
    float _1766 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1768 = _1750 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1770 = _1750 | _1764;
    float _1772 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1754);
    float _1774 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1752);
    bool _1776 = _1770 < 0;
    bool _1778 = _1776 || _1768;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1782 = _1662 + _1780;
    float _1784 = fma(_1740, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1786 = precise::clamp(_1784, 0.0, 1.0);
    bool _1788 = _1764 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1790 = _1788 || _1778;
    float _1792 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1756);
    float _1794 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1758);
    float _1796 = fma(_1786, -2.0, 3.0);
    float _1798 = _1786 * _1786;
    float _1800 = _1782 * _1782;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1804 = _1077 + _1802;
    out.gl_Position.x = _1774;
    out.gl_Position.y = _1772;
    out.gl_Position.z = _1792;
    out.gl_Position.w = _1794;
    float _1806 = _1798 * _1796;
    bool _1808 = _1135 <= 8000.0;
    bool _1810 = isnan(_1135);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan(8000.0);
    bool _1816 = _1812 || _1814;
    float _1818 = float(_1816);
    float _1820 = fma(_1804, _1804, _1800);
    float _1822 = -_1806;
    float _1824 = _1822 + 1.0;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1806);
    float _1828 = _1774;
    float _1830 = _1772;
    float _1832 = _1792;
    float _1834 = _1710;
    float _1836 = _1694;
    if (_1790)
    {
        _1828 = 1.0;
    }
    float _1838 = _1828;
    float _1840 = _1838;
    if (!_1790)
    {
        int _1842 = _1764 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1844 = _1842 + _1750;
        float _1846 = floor(_1694);
        int _1848 = _1844 << 2;
        uint _1850 = uint(int(uint(_1844) >> uint(2)));
        int _1852 = 12 & _1848;
        int _1854 = int(_1850) << 4;
        int _1856 = _1854 + _1852;
        float _1858 = floor(_1710);
        float _1860 = -_1846;
        float _1862 = _1694 + _1860;
        int _1864 = _1856 + 400;
        uint _1866 = uint(int(uint(_1864) >> uint(2)));
        uint _1868 = uint(int(uint(int(_1866)) >> uint(2)));
        int _1870 = int(_1866) & 3;
        float _1872 = (*spvDescriptorSet0.vp_c15)._m0[int(_1868)][_1870];
        float _1874 = -_1858;
        float _1876 = _1710 + _1874;
        float _1878 = rint(_1872);
        float _1880 = precise::max(_1878, 0.0);
        uint _1882 = uint(_1880);
        uint _1884 = clamp(_1882, 0u, 65535u);
        float3 _5237 = float3(_1862, _1876, float(int(_1884)));
        float3 _5239 = select(_5237, float3(0.0), isnan(_5237));
        float _1886 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5239.xy, uint(rint(_5239.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5239.xy, uint(rint(_5239.z)), level(0.0)).x;
        int _1888 = _1844 << 4;
        int _1890 = _1888 + 2048;
        uint _1892 = uint(int(uint(_1890) >> uint(2)));
        uint _1894 = uint(int(uint(int(_1892)) >> uint(2)));
        int _1896 = int(_1892) & 3;
        float _1898 = (*spvDescriptorSet0.vp_c15)._m0[int(_1894)][_1896];
        int _1900 = int(_1892) + 1;
        uint _1902 = uint(int(uint(_1900) >> uint(2)));
        int _1904 = _1900 & 3;
        float _1906 = (*spvDescriptorSet0.vp_c15)._m0[int(_1902)][_1904];
        int _1908 = _1890 + 8;
        uint _1910 = uint(int(uint(_1908) >> uint(2)));
        uint _1912 = uint(int(uint(int(_1910)) >> uint(2)));
        int _1914 = int(_1910) & 3;
        float _1916 = (*spvDescriptorSet0.vp_c15)._m0[int(_1912)][_1914];
        int _1918 = int(_1910) + 1;
        uint _1920 = uint(int(uint(_1918) >> uint(2)));
        int _1922 = _1918 & 3;
        float _1924 = (*spvDescriptorSet0.vp_c15)._m0[int(_1920)][_1922];
        float _1926 = _1109 * _1906;
        float _1928 = fma(_969, _1898, _1926);
        float _1930 = fma(_959, _1916, _1928);
        float _1932 = _1930 + _1924;
        float _1934 = precise::clamp(_1932, 0.0, 1.0);
        float _1936 = -_1934;
        float _1938 = _1936 + _1886;
        float _1940 = fma(_1938, 500.0, 1.5);
        float _1942 = exp2(_1940);
        float _1944 = 0.0 + _1942;
        float _1946 = precise::clamp(_1944, 0.0, 1.0);
        _1830 = _1872;
        _1840 = _1946;
        _1832 = _1876;
    }
    float _1948 = _1830;
    float _1950 = _1840;
    float _1952 = _1832;
    float _1954 = _1818 * _1826;
    float _1956 = in.m_66.w;
    float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1960 = _1081 + _1958;
    float _1962 = -_1388;
    float _1964 = _1962 + 1.0;
    float _1966 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1968 = _1948;
    float _1970 = _1966;
    float _1972 = _1952;
    if (!_1350)
    {
        _1968 = 1.0;
    }
    float _1974 = _1968;
    float _1976 = fma(_1960, _1960, _1820);
    float _1978 = _1974;
    if (_1350)
    {
        bool _1980 = _1394 >= _1386;
        bool _1982 = isnan(_1394);
        bool _1984 = _1980 || _1982;
        bool _1986 = isnan(_1386);
        bool _1988 = _1984 || _1986;
        float _1990 = float(_1988);
        _1978 = _1990;
    }
    float _1992 = _1978;
    float _1994 = _1964 * _1966;
    float _1996 = precise::clamp(_1994, 0.0, 1.0);
    out.m_88.x = _1660;
    out.m_88.y = _1664;
    out.m_88.z = _1666;
    float _1998 = _1992 * _1950;
    float _2000 = sqrt(_1976);
    float _2002 = -_1996;
    float _2004 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_90.x = _1077;
    out.m_90.y = _1662;
    out.m_90.z = _1081;
    float _2006 = -_1998;
    float _2008 = fma(_2006, _2004, 1.0);
    float _2010 = precise::clamp(_2008, 0.0, 1.0);
    float _2012 = _2010 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.w = _1956;
    out.m_94.x = _2012;
    bool _2014 = _2000 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2016 = isnan(_2000);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2022 = _2018 || _2020;
    float _2024 = _2004;
    float _2026 = _2010;
    if (!_2022)
    {
        _1834 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2028 = _1834;
    float _2030 = _2028;
    float _2032 = _2028;
    if (!_2022)
    {
        _1836 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2034 = _1836;
    float _2036 = _2034;
    float _2038 = _2034;
    if (!_2022)
    {
        _1970 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2040 = _1970;
    float _2042 = _2040;
    float _2044 = _2040;
    if (!_2022)
    {
        _1972 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2046 = _1972;
    float _2048 = _2046;
    float _2050 = _2046;
    if (!_2022)
    {
        _2024 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2052 = _2024;
    float _2054 = _2052;
    float _2056 = _2052;
    if (!_2022)
    {
        _2026 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2058 = _2026;
    bool _2060 = !_2022;
    float _2062 = _2058;
    float _2064 = _2058;
    if (!_2060)
    {
        bool _2066 = _2000 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2068 = isnan(_2000);
        bool _2070 = _2066 || _2068;
        bool _2072 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2074 = _2070 || _2072;
        if (!_2074)
        {
            float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2078 = _2000 + _2076;
            float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2082 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2080;
            float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2086 = _2084 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2088 = 1.0 / _2082;
            float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2092 = _2090 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2104 = _2102 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2106 = _2078 * _2088;
            float _2108 = precise::clamp(_2106, 0.0, 1.0);
            float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2112 = _2110 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2114 = fma(_2108, _2086, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2116 = fma(_2108, _2112, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2118 = fma(_2108, _2092, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2120 = fma(_2108, _2096, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2122 = fma(_2108, _2100, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2124 = fma(_2108, _2104, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2038 = _2114;
            _2056 = _2122;
            _2032 = _2118;
            _2050 = _2120;
            _2044 = _2116;
            _2064 = _2124;
            _2126 = true;
        }
        else
        {
            bool _2128 = _2000 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2130 = isnan(_2000);
            bool _2132 = _2128 || _2130;
            bool _2134 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2136 = _2132 || _2134;
            if (!_2136)
            {
                _2030 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2138 = _2030;
            _2032 = _2138;
            if (!_2136)
            {
                _2036 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2140 = _2036;
            _2038 = _2140;
            if (!_2136)
            {
                _2042 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2142 = _2042;
            _2044 = _2142;
            if (!_2136)
            {
                _2048 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2144 = _2048;
            _2050 = _2144;
            if (!_2136)
            {
                _2054 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2146 = _2054;
            _2056 = _2146;
            if (!_2136)
            {
                _2062 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2148 = _2062;
            bool _2150 = !_2136;
            _2064 = _2148;
            if (!_2150)
            {
                bool _2152 = _2000 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2154 = isnan(_2000);
                bool _2156 = _2152 || _2154;
                bool _2158 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2160 = _2156 || _2158;
                if (!_2160)
                {
                    float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2164 = _2000 + _2162;
                    float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2168 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2166;
                    float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2174 = 1.0 / _2168;
                    float _2176 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2178 = _2176 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2180 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2182 = _2180 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2184 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2186 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2188 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2190 = _2188 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2192 = _2164 * _2174;
                    float _2194 = precise::clamp(_2192, 0.0, 1.0);
                    float _2196 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2198 = _2196 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2200 = fma(_2194, _2172, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2202 = fma(_2194, _2198, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2204 = fma(_2194, _2178, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2206 = fma(_2194, _2182, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2208 = fma(_2194, _2186, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2210 = fma(_2194, _2190, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2038 = _2200;
                    _2056 = _2208;
                    _2032 = _2204;
                    _2050 = _2206;
                    _2044 = _2202;
                    _2064 = _2210;
                    _2126 = true;
                }
                else
                {
                    _2038 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2056 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2032 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2050 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2044 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2064 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2126 = false;
    float _2212 = _2038;
    float _2214 = _2056;
    float _2216 = _2032;
    float _2218 = _2050;
    float _2220 = _2044;
    float _2222 = _2064;
    float _2224 = fma(_1664, -0.5, 0.5);
    float _2226 = precise::clamp(_2224, 0.0, 1.0);
    float _2228 = -_2212;
    float _2230 = _2228 + _2214;
    float _2232 = -_2216;
    float _2234 = _2232 + _2218;
    float _2236 = -_2220;
    float _2238 = _2236 + _2222;
    bool _2240 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2242 = fma(_2226, _2230, _2212);
    float _2244 = fma(_2226, _2234, _2216);
    float _2246 = fma(_2226, _2238, _2220);
    float _2248 = _2242 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _2250 = fma(_2244, 0.298911988735198974609375, _2248);
    float _2252 = fma(_2246, 0.114477999508380889892578125, _2250);
    out.m_96.x = 0.0;
    float _2254 = -_2252;
    float _2256 = _2244 + _2254;
    float _2258 = -_2252;
    float _2260 = _2242 + _2258;
    float _2262 = -_2252;
    float _2264 = _2246 + _2262;
    float _2266 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2268 = fma(_2256, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2252);
    float _2270 = fma(_2260, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2252);
    float _2272 = fma(_2264, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2252);
    out.m_94.w = _2266;
    out.m_98.x = _2268;
    out.m_98.y = _2270;
    out.m_98.z = _2272;
    if (!_2240)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2274 = -_1662;
    float _2276 = _2274 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2278 = -_1077;
    float _2280 = _2278 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2282 = -_1081;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2286 = _2276 * _2276;
    float _2288 = fma(_2280, _2280, _2286);
    float _2290 = fma(_2284, _2284, _2288);
    float _2292 = sqrt(_2290);
    float _2294 = rsqrt(_2290);
    float _2296 = -_2292;
    float _2298 = _2296 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2300 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2302 = precise::clamp(_2300, 0.0, 1.0);
    float _2304 = _2280 * _2294;
    float _2306 = _2276 * _2294;
    float _2308 = abs(_2302);
    float _2310 = log2(_2308);
    float _2312 = _2284 * _2294;
    float _2314 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2316 = _1664 * _2306;
    float _2318 = -_2306;
    float _2320 = -_2314;
    float _2322 = fma(_2318, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2320);
    float _2324 = fma(_1660, _2304, _2316);
    float _2326 = -_2312;
    float _2328 = fma(_2326, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2322);
    float _2330 = fma(_1666, _2312, _2324);
    float _2332 = precise::clamp(_2330, 0.0, 1.0);
    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2336 = _2328 + _2334;
    float _2338 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2340 = _2336 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2342 = precise::clamp(_2340, 0.0, 1.0);
    float _2344 = exp2(_2338);
    float _2346 = _2344 * _2342;
    float _2348 = _2332 * _2346;
    float _2350 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2352 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2354 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _2350;
    out.m_96.y = _2352;
    out.m_96.z = _2354;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

