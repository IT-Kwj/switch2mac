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
    float4 m_76 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_88 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_98 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_92 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_96 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(0)]];
    float4 m_58 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_49 [[attribute(5)]];
    float4 m_54 [[attribute(6)]];
    float4 m_82 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
    float4 m_62 [[attribute(9)]];
    float4 m_70 [[attribute(10)]];
    float4 m_74 [[attribute(11)]];
    float4 m_68 [[attribute(12)]];
    float4 m_64 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2604 = false;
    bool _353 = false;
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
    float _125 = as_type<float>(_117);
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_52.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2889 = as_type<float>(_133);
        out.gl_Position.z = _2889;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_54.w;
    float _137 = float(_117);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    float _159 = _141;
    if (_157)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _125;
    if (_157)
    {
        out.m_52.x = 0.0;
    }
    int _163 = 0;
    if (_157)
    {
        float _165 = _161 * 5.0;
        _163 = as_type<int>(_165);
    }
    int _167 = _163;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2953 = as_type<float>(_167);
        out.gl_Position.z = _2953;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = in.m_56.x;
    float _171 = in.m_56.y;
    float _173 = in.m_56.z;
    float _175 = 1.0 / _137;
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    float _183 = in.m_60.x;
    float _185 = in.m_60.y;
    float _187 = in.m_60.z;
    float _189 = _141 * _175;
    float _191 = _169 * _169;
    float _193 = _171 * _171;
    float _195 = fma(_177, _177, _191);
    float _197 = fma(_179, _179, _193);
    float _199 = fma(_183, _183, _195);
    float _201 = _173 * _173;
    float _203 = fma(_185, _185, _197);
    float _205 = sqrt(_199);
    float _207 = fma(_181, _181, _201);
    float _209 = fma(_187, _187, _207);
    float _211 = sqrt(_203);
    float _213 = sqrt(_209);
    bool _215 = _205 > 0.0;
    bool _217 = _211 > 0.0;
    float _219 = 0.0;
    float _221 = _205;
    float _223 = _211;
    float _225 = _199;
    float _227 = _209;
    float _229 = _203;
    if (_215)
    {
        float _231 = rsqrt(_199);
        _219 = _231;
    }
    float _233 = _219;
    if (!_215)
    {
        _221 = 0.0;
    }
    float _235 = _221;
    bool _237 = _213 > 0.0;
    float _239 = _213;
    float _241 = _235;
    bool _243 = _237;
    float _245 = 0.0;
    if (!_215)
    {
        _223 = 0.0;
    }
    float _247 = _223;
    float _249 = 0.0;
    float _251 = _247;
    if (_217)
    {
        float _253 = rsqrt(_203);
        _249 = _253;
    }
    float _255 = _249;
    if (!_217)
    {
        _239 = 0.0;
    }
    float _257 = _239;
    float _259 = 0.0;
    float _261 = _257;
    if (!_217)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (_237)
    {
        float _269 = rsqrt(_209);
        _265 = _269;
    }
    float _271 = _265;
    float _273 = _233;
    if (_215)
    {
        float _275 = _233 * _169;
        _241 = _275;
    }
    float _277 = _241;
    if (_215)
    {
        float _279 = _233 * _177;
        _245 = _279;
    }
    float _281 = _245;
    if (_215)
    {
        float _283 = _233 * _183;
        _251 = _283;
    }
    float _285 = _251;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_217)
    {
        _273 = 0.0;
    }
    float _289 = _273;
    float _291 = _289;
    if (!_237)
    {
        _225 = 0.0;
    }
    float _293 = _225;
    float _295 = _293;
    if (_217)
    {
        float _297 = _255 * _171;
        _261 = _297;
    }
    float _299 = _261;
    float _301 = _299;
    if (!_237)
    {
        _227 = 0.0;
    }
    float _303 = _227;
    float _305 = _303;
    if (_217)
    {
        float _307 = _255 * _179;
        _267 = _307;
    }
    float _309 = _267;
    if (!_237)
    {
        _229 = 0.0;
    }
    float _311 = _229;
    float _313 = _311;
    if (_217)
    {
        float _315 = _255 * _185;
        _291 = _315;
    }
    float _317 = _291;
    float _319 = _317;
    if (_237)
    {
        float _321 = _271 * _173;
        _295 = _321;
    }
    float _323 = _295;
    if (_237)
    {
        float _325 = _271 * _181;
        _305 = _325;
    }
    float _327 = _305;
    if (_237)
    {
        float _329 = _271 * _187;
        _313 = _329;
    }
    float _331 = _313;
    bool _333 = !_287;
    float _351;
    if (!_333)
    {
        float _335 = in.m_62.x;
        float _337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _339 = _335 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _341 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _343 = _341 * _337;
        float _345 = floor(_343);
        float _347 = -_345;
        float _349 = _343 + _347;
        _351 = _349;
        _353 = true;
    }
    else
    {
        _351 = _189;
    }
    _353 = false;
    float _355 = _351;
    float _357 = in.m_64.x;
    float _359 = in.m_64.y;
    float _361 = _141 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _363 = in.m_62.x;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _373 = in.m_49.x;
    float _375 = in.m_49.y;
    float _377 = in.m_49.z;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = _355 + _379;
    float _383 = 1.0 / _367;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _391 = _355 + _389;
    float _393 = 1.0 / _371;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _403;
    float _407 = -_359;
    float _409 = _407 + 1.0;
    float _411 = abs(_357);
    float _413 = log2(_411);
    float _415 = _381 * _383;
    float _417 = fma(_363, 6.283185482025146484375, _361);
    float _419 = _179 * _375;
    float _421 = 1.0 / _387;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _423;
    float _427 = fma(_177, _373, _419);
    float _429 = _391 * _393;
    float _431 = fma(_425, _415, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _433 = _413 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _417);
    float _437 = _185 * _375;
    float _439 = exp2(_433);
    float _441 = _435 * 0.60000002384185791015625;
    float _443 = fma(_183, _373, _437);
    float _445 = _435 + 0.52359879016876220703125;
    float _447 = _441 * 0.15915493667125701904296875;
    float _449 = _435 * 0.15915493667125701904296875;
    float _451 = in.m_62.y;
    float _453 = _445 * 0.15915493667125701904296875;
    float _455 = fma(_435, 0.60000002384185791015625, 0.31415927410125732421875);
    float _457 = _435 * 1.2999999523162841796875;
    float _459 = fma(_435, 1.2999999523162841796875, 0.680678427219390869140625);
    float _461 = _455 * 0.15915493667125701904296875;
    float _463 = _449 * 6.283185482025146484375;
    float _465 = sin(_463);
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _469 = _459 * 0.15915493667125701904296875;
    float _471 = _457 * 0.15915493667125701904296875;
    float _473 = fma(_467, _439, _361);
    float _475 = in.m_66.x;
    float _477 = in.m_66.y;
    float _479 = in.m_66.z;
    float _481 = _471 * 6.283185482025146484375;
    float _483 = sin(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _485;
    float _489 = fma(_363, 6.283185482025146484375, _473);
    float _491 = fma(_357, 0.261799395084381103515625, -0.261799395084381103515625);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = fma(_487, _415, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _499 = -_357;
    float _501 = _499 + 1.0;
    float _503 = _447 * 6.283185482025146484375;
    float _505 = sin(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _513 = _355 + _511;
    float _515 = _451 * 628.31854248046875;
    float _517 = fma(_495, _429, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _519 = fma(_509, _363, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _521 = _513 * _421;
    float _523 = _453 * 6.283185482025146484375;
    float _525 = sin(_523);
    float _527 = fma(_141, _519, _515);
    float _529 = fma(_401, _521, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _531 = _527 * 0.89999997615814208984375;
    float _533 = _527 * 0.15915493667125701904296875;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _535;
    float _539 = _461 * 6.283185482025146484375;
    float _541 = sin(_539);
    float _543 = _531 * 0.15915493667125701904296875;
    float _545 = _527 + _491;
    bool _547 = _475 > 0.0;
    float _549 = fma(_537, _415, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _555 = _545 * 0.15915493667125701904296875;
    bool _557 = _475 >= 0.0;
    bool _559 = isnan(_475);
    bool _561 = _557 || _559;
    bool _563 = isnan(0.0);
    bool _565 = _561 || _563;
    float _567 = fma(_505, 0.60000002384185791015625, _465);
    float _569 = fma(_553, _429, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _571 = _469 * 6.283185482025146484375;
    float _573 = sin(_571);
    int _575 = _565 ? 0 : 1;
    float _577 = fma(_483, 0.300000011920928955078125, _567);
    bool _579 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _581 = isnan(_355);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = _545 * 1.10000002384185791015625;
    int _593 = ~_575;
    int _595 = _593 + 1;
    int _597 = _595 + 1;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _603 = _597;
    float _605 = _363;
    if (!_547)
    {
        int _607 = ~_575;
        int _609 = _607 + 1;
        _603 = _609;
    }
    int _611 = _603;
    float _613 = _555 * 6.283185482025146484375;
    float _615 = sin(_613);
    bool _617 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _619 = isnan(_355);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = _545 * 0.699999988079071044921875;
    float _631 = _489 * 0.15915493667125701904296875;
    float _633 = _591 * 0.15915493667125701904296875;
    float _635 = fma(_601, _429, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _637 = _545 * 0.89999997615814208984375;
    float _639 = _629 * 0.15915493667125701904296875;
    float _641 = _633 * 6.283185482025146484375;
    float _643 = cos(_641);
    float _645 = fma(_397, _521, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _647 = fma(_541, 0.60000002384185791015625, _525);
    float _649 = _489 * 0.60000002384185791015625;
    float _651 = fma(_405, _521, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _653 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _655 = isnan(_355);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _489 * 1.2999999523162841796875;
    bool _667 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _669 = isnan(_355);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = _649 * 0.15915493667125701904296875;
    float _681 = -_589;
    float _683 = _681 + 1.0;
    float _685 = -_663;
    float _687 = _685 + 1.0;
    float _689 = _665 * 0.15915493667125701904296875;
    float _691 = _577 * _501;
    float _693 = _677 * _683;
    float _695 = -_677;
    float _697 = _695 + 1.0;
    float _699 = fma(_573, 0.300000011920928955078125, _647);
    float _701 = _637 * 0.15915493667125701904296875;
    float _703 = _589 * _687;
    float _705 = _627 * _697;
    float _707 = _631 * 6.283185482025146484375;
    float _709 = sin(_707);
    float _711 = _691 * 0.52359879016876220703125;
    float _713 = -_627;
    float _715 = _713 + 1.0;
    float _717 = _497 * _705;
    float _719 = _431 * _705;
    float _721 = in.m_68.y;
    float _723 = _549 * _705;
    float _725 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[143].x, _717);
    float _727 = _679 * 6.283185482025146484375;
    float _729 = sin(_727);
    float _731 = abs(_699);
    float _733 = _409 * _731;
    float _735 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[143].y, _719);
    float _737 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[143].z, _723);
    float _739 = fma(_517, _693, _725);
    float _741 = _733 * (-45.0);
    float _743 = float(_611);
    float _745 = fma(_635, _693, _737);
    float _747 = _701 * 6.283185482025146484375;
    float _749 = sin(_747);
    float _751 = _711 * 0.15915493667125701904296875;
    float _753 = fma(_529, _703, _739);
    float _755 = _733 * (-20.0);
    float _757 = fma(_569, _693, _735);
    float _759 = fma(_651, _703, _745);
    float _761 = _741 * 0.01745329238474369049072265625;
    float _763 = _689 * 6.283185482025146484375;
    float _765 = sin(_763);
    float _767 = fma(_729, 0.60000002384185791015625, _709);
    float _769 = fma(_645, _703, _757);
    float _771 = _743 * _755;
    float _773 = _761 * 0.15915493667125701904296875;
    float _775 = _477 + (-0.0199999995529651641845703125);
    float _777 = _771 * 0.01745329238474369049072265625;
    float _779 = _639 * 6.283185482025146484375;
    float _781 = cos(_779);
    float _783 = _749 * 0.89999997615814208984375;
    float _785 = fma(_721, 0.5, 0.5);
    float _787 = _777 * 0.15915493667125701904296875;
    float _789 = -_783;
    float _791 = fma(_615, -1.2000000476837158203125, _789);
    float _793 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[146].x, _753);
    float _795 = _751 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = fma(_765, 0.300000011920928955078125, _767);
    float _801 = abs(_791);
    bool _803 = _801 > 0.001000000047497451305389404296875;
    bool _805 = isnan(_801);
    bool _807 = _803 || _805;
    bool _809 = isnan(0.001000000047497451305389404296875);
    bool _811 = _807 || _809;
    float _813 = in.m_70.x;
    float _815 = in.m_70.y;
    float _817 = in.m_70.z;
    float _819 = _785 * _799;
    float _821 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[146].y, _769);
    float _823 = _811 ? _791 : 0.001000000047497451305389404296875;
    float _825 = _751 * 6.283185482025146484375;
    float _827 = cos(_825);
    float _829 = _781 * 0.699999988079071044921875;
    float _831 = _819 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _833 = abs(_823);
    bool _835 = _833 == 0.0;
    float _837 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[146].z, _759);
    float _839 = fma(_643, 1.10000002384185791015625, _829);
    float _841 = _831 * 0.01745329238474369049072265625;
    float _843 = _773 * 6.283185482025146484375;
    float _845 = sin(_843);
    float _847 = _797 * _475;
    float _849 = abs(_839);
    bool _851 = _849 != 0.0;
    bool _853 = isnan(_849);
    bool _855 = _851 || _853;
    bool _857 = isnan(0.0);
    bool _859 = _855 || _857;
    float _861 = _841 * 0.15915493667125701904296875;
    float _863 = abs(_823);
    bool _865 = _863 == 0.0;
    bool _867 = !_859;
    bool _869 = _865 && _867;
    float _871 = _773 * 6.283185482025146484375;
    float _873 = cos(_871);
    float _875 = -_847;
    float _877 = fma(_827, _479, _875);
    float _879 = _827 * _475;
    float _881 = _793 * _813;
    float _883 = _821 * _815;
    float _885 = _877 + 0.02999999932944774627685546875;
    float _887 = fma(_797, _479, _879);
    float _889 = _837 * _817;
    float _891 = _787 * 6.283185482025146484375;
    float _893 = sin(_891);
    float _895 = _845 * _885;
    float _897 = fma(_743, -0.100000001490116119384765625, _887);
    if (_869)
    {
        bool _899 = as_type<int>(_823) >= 0;
        _243 = _899;
    }
    bool _901 = _243;
    float _903 = _527 * 0.699999988079071044921875;
    float _905 = _787 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = -_895;
    float _911 = fma(_873, _775, _909);
    float _913 = _873 * _885;
    float _915 = _533 * 6.283185482025146484375;
    float _917 = cos(_915);
    float _919 = _911 * _893;
    float _921 = _543 * 6.283185482025146484375;
    float _923 = cos(_921);
    float _925 = _911 * _907;
    int _927 = as_type<int>(_911);
    int _929 = _901 ? (-1) : 0;
    if (_869)
    {
        int _931 = _901 ? 0 : 1078530011;
        _927 = _931;
    }
    int _933 = _927;
    float _935 = -_919;
    float _937 = fma(_907, _897, _935);
    float _939 = fma(_893, _897, _925);
    int _941 = _933;
    if (_869)
    {
        int _943 = int(0x80000000) & as_type<int>(_839);
        int _945 = _933 | _943;
        _941 = _945;
    }
    int _947 = _941;
    float _949 = _861 * 6.283185482025146484375;
    float _951 = sin(_949);
    float _953 = _861 * 6.283185482025146484375;
    float _955 = cos(_953);
    bool _957 = !_859;
    bool _959 = _957 && _835;
    int _961 = _947;
    float _963 = as_type<float>(_947);
    if (!_959)
    {
        float _965 = abs(_839);
        bool _967 = _965 != as_type<float>(0x7f800000u /* inf */);
        bool _969 = isnan(_965);
        bool _971 = _967 || _969;
        bool _973 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _975 = _971 || _973;
        float _977 = abs(_823);
        bool _979 = _977 == as_type<float>(0x7f800000u /* inf */);
        float _981 = abs(_823);
        bool _983 = _981 == as_type<float>(0x7f800000u /* inf */);
        bool _985 = !_975;
        bool _987 = _983 && _985;
        if (_987)
        {
            bool _989 = as_type<int>(_823) >= 0;
            _929 = _989 ? (-1) : 0;
        }
        int _991 = _929;
        if (_987)
        {
            _961 = 1075235812;
        }
        int _993 = _961;
        int _995 = _993;
        if (_987)
        {
            int _997 = ~_991;
            int _999 = (_997 != 0) ? _993 : 1061752795;
            _995 = _999;
        }
        int _1001 = _995;
        float _1003 = as_type<float>(_1001);
        if (_987)
        {
            int _1005 = int(0x80000000) & as_type<int>(_839);
            int _1007 = _1001 | _1005;
            _1003 = as_type<float>(_1007);
        }
        float _1009 = _1003;
        bool _1011 = !_975;
        bool _1013 = _1011 && _979;
        _963 = _1009;
        if (!_1013)
        {
            float _1015 = abs(_839);
            float _1017 = abs(_823);
            float _1019 = precise::max(_1015, _1017);
            float _1021 = abs(_839);
            float _1023 = abs(_823);
            float _1025 = precise::min(_1021, _1023);
            float _1027 = 1.0 / _1019;
            float _1029 = abs(_839);
            float _1031 = abs(_823);
            bool _1033 = _1029 > _1031;
            bool _1035 = as_type<int>(_823) >= 0;
            float _1037 = _1025 * _1027;
            float _1039 = _1037 * _1037;
            float _1041 = _1039 + 11.33538818359375;
            float _1043 = fma(_1039, _1041, 28.84246826171875);
            float _1045 = fma(_1039, _1043, 19.6966705322265625);
            float _1047 = fma(_1039, -0.82336294651031494140625, -5.674867153167724609375);
            float _1049 = fma(_1039, _1047, -6.565555095672607421875);
            float _1051 = 1.0 / _1045;
            float _1053 = _1039 * _1049;
            float _1055 = abs(_839);
            float _1057 = abs(_823);
            float _1059 = _1055 + _1057;
            int _1061 = as_type<int>(_839) & int(0x80000000);
            float _1063 = _1037 * _1053;
            bool _1065 = _1059 > as_type<float>(0x7f800000u /* inf */);
            bool _1067 = isnan(_1059);
            bool _1069 = _1065 || _1067;
            bool _1071 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1073 = _1069 || _1071;
            float _1075 = fma(_1063, _1051, _1037);
            float _1077 = _1075;
            _963 = _1059;
            if (_1033)
            {
                float _1079 = -_1075;
                float _1081 = _1079 + 1.57079637050628662109375;
                _1077 = _1081;
            }
            float _1083 = _1077;
            int _1085 = as_type<int>(_1083);
            if (!_1035)
            {
                float _1087 = -_1083;
                float _1089 = _1087 + 3.1415927410125732421875;
                _1085 = as_type<int>(_1089);
            }
            int _1091 = _1085;
            if (!_1073)
            {
                int _1093 = _1061 | _1091;
                _963 = as_type<float>(_1093);
            }
        }
    }
    float _1095 = _963;
    float _1097 = _939 + 0.0199999995529651641845703125;
    float _1099 = fma(_743, 0.100000001490116119384765625, _937);
    float _1101 = in.m_62.z;
    float _1103 = fma(_845, _775, _913);
    float _1105 = _1097 * _951;
    float _1107 = _1097 * _955;
    float _1109 = _1095 + 1.57079637050628662109375;
    float _1111 = _883 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1113 = -_1105;
    float _1115 = fma(_1099, _955, _1113);
    float _1117 = fma(_1099, _951, _1107);
    float _1119 = _881 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1121 = in.m_60.w;
    float _1123 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1115);
    float _1125 = _1103 + (-0.02999999932944774627685546875);
    float _1127 = _1109 * (-0.15915493667125701904296875);
    float _1129 = in.m_58.w;
    float _1131 = _889 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1125);
    float _1135 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1117);
    float _1137 = _527 * 1.10000002384185791015625;
    float _1139 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1123);
    float _1141 = _1127 * 6.283185482025146484375;
    float _1143 = cos(_1141);
    float _1145 = _1131 * _1133;
    float _1147 = _1111 * _1135;
    float _1149 = _1119 * _1139;
    float _1151 = _903 * 0.15915493667125701904296875;
    float _1153 = _1145 * _309;
    float _1155 = _1101 * 6.283185482025146484375;
    float _1157 = _1137 * 0.15915493667125701904296875;
    float _1159 = _1127 * 6.283185482025146484375;
    float _1161 = sin(_1159);
    float _1163 = _1145 * _317;
    float _1165 = fma(_1149, _281, _1153);
    float _1167 = _1155 * 0.15915493667125701904296875;
    float _1169 = fma(_181, _377, _427);
    float _1171 = fma(_1149, _285, _1163);
    float _1173 = -_1147;
    float _1175 = fma(_1173, _327, _1165);
    float _1177 = fma(_187, _377, _443);
    float _1179 = _1151 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = -_1147;
    float _1185 = fma(_1183, _331, _1171);
    float _1187 = _1175 * _1143;
    float _1189 = _1177 + _1121;
    float _1191 = _1169 + _1129;
    float _1193 = fma(_917, 1.2000000476837158203125, _923);
    float _1195 = _189 * 3.3333332538604736328125;
    float _1197 = _1157 * 6.283185482025146484375;
    float _1199 = sin(_1197);
    float _1201 = _1175 * _1161;
    float _1203 = fma(_1185, _1161, _1187);
    float _1205 = -_1201;
    float _1207 = fma(_1185, _1143, _1205);
    float _1209 = _1191 + _1203;
    float _1211 = _1167 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = _1189 + _1207;
    float _1217 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1209);
    float _1219 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1221 = _1217 + _1219;
    float _1223 = _1167 * 6.283185482025146484375;
    float _1225 = cos(_1223);
    float _1227 = _1181 + _1199;
    float _1229 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1215);
    float _1231 = _1213 * _1221;
    float _1233 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1235 = _1229 + _1233;
    float _1237 = _1225 * _1221;
    float _1239 = -_1231;
    float _1241 = fma(_1225, _1235, _1239);
    float _1243 = fma(_1213, _1235, _1237);
    float _1245 = _1241 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1247 = in.m_72.y;
    float _1249 = _1243 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1253 = _1245 + _1251;
    float _1255 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1257 = _1249 + _1255;
    float _1259 = _1253 * _1253;
    float _1261 = fma(_1257, _1257, _1259);
    float _1263 = sqrt(_1261);
    bool _1265 = _1263 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1269 = _1263 + _1267;
    float _1271 = 0.0 + _1195;
    float _1273 = precise::clamp(_1271, 0.0, 1.0);
    float _1275 = -_1195;
    float _1277 = _1275 + 3.3333332538604736328125;
    float _1279 = precise::clamp(_1277, 0.0, 1.0);
    float _1281 = precise::min(_1273, _1279);
    float _1283 = _759;
    float _1285 = _1103;
    if (_1265)
    {
        float _1287 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1287;
    }
    float _1289 = _1283;
    float _1291 = _1289;
    if (_1265)
    {
        float _1293 = _1269 * _1289;
        _1291 = _1293;
    }
    float _1295 = _1291;
    float _1297 = _1145 * _299;
    float _1299 = _375 + _1247;
    float _1301 = _1295;
    float _1303 = _1247;
    if (_1265)
    {
        float _1305 = _1295 * 0.15915493667125701904296875;
        _1301 = _1305;
    }
    float _1307 = _1301;
    float _1309 = fma(_1149, _277, _1297);
    if (_1265)
    {
        float _1311 = rsqrt(_1261);
        _1303 = _1311;
    }
    float _1313 = _1303;
    float _1315 = -_1147;
    float _1317 = fma(_1315, _323, _1309);
    float _1319 = fma(_1281, -5.0, 5.0);
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1323 = _1321 + 1.0;
    float _1325 = _1299 + _1317;
    float _1327 = _1203;
    float _1329 = _1319;
    float _1331 = _1323;
    if (_1265)
    {
        float _1333 = _1307 * 6.283185482025146484375;
        float _1335 = sin(_1333);
        _1327 = _1335;
    }
    float _1337 = _1327;
    float _1339 = -_1319;
    float _1341 = fma(_1339, _1323, _1325);
    float _1343 = _1341;
    if (!_1265)
    {
        _1329 = _1249;
    }
    float _1345 = _1329;
    float _1347 = _1345;
    if (_1265)
    {
        float _1349 = _1341 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1331 = _1349;
    }
    float _1351 = _1331;
    float _1353 = _1351;
    float _1355 = _1337;
    if (_1265)
    {
        float _1357 = fma(_1337, _1351, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1353 = _1357;
    }
    float _1359 = _1353;
    float _1361 = _1359;
    if (!_1265)
    {
        _1355 = _1245;
    }
    float _1363 = _1355;
    float _1365 = _1363;
    if (_1265)
    {
        float _1367 = _1313 * _1359;
        _1361 = _1367;
    }
    float _1369 = _1361;
    if (_1265)
    {
        float _1371 = fma(_1257, _1369, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1347 = _1371;
    }
    float _1373 = _1347;
    if (_1265)
    {
        float _1375 = fma(_1253, _1369, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1365 = _1375;
    }
    float _1377 = _1365;
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1381 = _1373 + _1379;
    float _1383 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1385 = _1377 + _1383;
    float _1387 = fma(_1381, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1389 = fma(_1385, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4717 = float2(_1387, _1389);
    float _1391 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4717, float2(0.0), isnan(_4717)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4717, float2(0.0), isnan(_4717)), level(0.0)).x;
    float _1393 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1395 = fma(_1391, 100.0, _1299);
    float _1397 = _1395 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1399 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1397);
    float _1401 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1399);
    float _1403 = _1395 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1405 = _1395 + _1393;
    float _1407 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1409 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1403);
    float _1411 = 1.0 / _1407;
    float _1413 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1409);
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1417 = _1415 + _1407;
    float _1419 = _1417 * _1411;
    float _1421 = _1419 * 0.5;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1425 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1423);
    float _1427 = 1.0 / _1425;
    float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1431 = _1427 * _1429;
    bool _1433 = _1431 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1435 = _1431 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1437 = !_1433;
    int _1439 = _1437 ? 0 : 1;
    int _1441 = 2;
    if (!_1433)
    {
        _1441 = 1;
    }
    int _1443 = _1441;
    int _1445 = _1443;
    if (!_1435)
    {
        _1445 = _1439;
    }
    int _1447 = _1445;
    int _1449 = _1447 << 6;
    int _1451 = _1449 + 96;
    uint _1454 = uint(int(uint(_1451) >> uint(2)));
    uint _1456 = uint(int(uint(int(_1454)) >> uint(2)));
    int _1458 = int(_1454) & 3;
    float _1460 = (*spvDescriptorSet0.vp_c15)._m0[int(_1456)][_1458];
    int _1462 = int(_1454) + 1;
    uint _1464 = uint(int(uint(_1462) >> uint(2)));
    int _1466 = _1462 & 3;
    float _1468 = (*spvDescriptorSet0.vp_c15)._m0[int(_1464)][_1466];
    int _1470 = _1449 + 104;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    uint _1474 = uint(int(uint(int(_1472)) >> uint(2)));
    int _1476 = int(_1472) & 3;
    float _1478 = (*spvDescriptorSet0.vp_c15)._m0[int(_1474)][_1476];
    int _1480 = int(_1472) + 1;
    uint _1482 = uint(int(uint(_1480) >> uint(2)));
    int _1484 = _1480 & 3;
    float _1486 = (*spvDescriptorSet0.vp_c15)._m0[int(_1482)][_1484];
    int _1488 = _1449 + 48;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    uint _1492 = uint(int(uint(int(_1490)) >> uint(2)));
    int _1494 = int(_1490) & 3;
    float _1496 = (*spvDescriptorSet0.vp_c15)._m0[int(_1492)][_1494];
    int _1498 = int(_1490) + 1;
    uint _1500 = uint(int(uint(_1498) >> uint(2)));
    int _1502 = _1498 & 3;
    float _1504 = (*spvDescriptorSet0.vp_c15)._m0[int(_1500)][_1502];
    int _1506 = _1449 + 64;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    uint _1510 = uint(int(uint(int(_1508)) >> uint(2)));
    int _1512 = int(_1508) & 3;
    float _1514 = (*spvDescriptorSet0.vp_c15)._m0[int(_1510)][_1512];
    int _1516 = int(_1508) + 1;
    uint _1518 = uint(int(uint(_1516) >> uint(2)));
    int _1520 = _1516 & 3;
    float _1522 = (*spvDescriptorSet0.vp_c15)._m0[int(_1518)][_1520];
    int _1524 = _1449 + 56;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
    int _1530 = int(_1526) & 3;
    float _1532 = (*spvDescriptorSet0.vp_c15)._m0[int(_1528)][_1530];
    int _1534 = int(_1526) + 1;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    int _1538 = _1534 & 3;
    float _1540 = (*spvDescriptorSet0.vp_c15)._m0[int(_1536)][_1538];
    int _1542 = _1449 + 72;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    uint _1546 = uint(int(uint(int(_1544)) >> uint(2)));
    int _1548 = int(_1544) & 3;
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[int(_1546)][_1548];
    int _1552 = int(_1544) + 1;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    int _1556 = _1552 & 3;
    float _1558 = (*spvDescriptorSet0.vp_c15)._m0[int(_1554)][_1556];
    float _1560 = _1405 * _1468;
    float _1562 = fma(_1191, _1460, _1560);
    float _1564 = fma(_1189, _1478, _1562);
    float _1566 = _1564 + _1486;
    int _1568 = _1449 + 80;
    uint _1570 = uint(int(uint(_1568) >> uint(2)));
    uint _1572 = uint(int(uint(int(_1570)) >> uint(2)));
    int _1574 = int(_1570) & 3;
    float _1576 = (*spvDescriptorSet0.vp_c15)._m0[int(_1572)][_1574];
    int _1578 = int(_1570) + 1;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    int _1582 = _1578 & 3;
    float _1584 = (*spvDescriptorSet0.vp_c15)._m0[int(_1580)][_1582];
    float _1586 = _1405 * _1504;
    float _1588 = 1.0 / _1566;
    float _1590 = fma(_1191, _1496, _1586);
    int _1592 = _1449 + 88;
    uint _1594 = uint(int(uint(_1592) >> uint(2)));
    uint _1596 = uint(int(uint(int(_1594)) >> uint(2)));
    int _1598 = int(_1594) & 3;
    float _1600 = (*spvDescriptorSet0.vp_c15)._m0[int(_1596)][_1598];
    int _1602 = int(_1594) + 1;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    int _1606 = _1602 & 3;
    float _1608 = (*spvDescriptorSet0.vp_c15)._m0[int(_1604)][_1606];
    float _1610 = _1405 * _1522;
    float _1612 = fma(_1191, _1514, _1610);
    float _1614 = fma(_1189, _1532, _1590);
    float _1616 = _1614 + _1540;
    float _1618 = fma(_1189, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1620 = fma(_1189, _1550, _1612);
    float _1622 = _1616 * _1588;
    float _1624 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1626 = _1620 + _1558;
    bool _1628 = _1622 >= 0.0;
    float _1630 = floor(_1618);
    float _1632 = _1626 * _1588;
    bool _1634 = _1622 <= 1.0;
    bool _1636 = _1634 && _1628;
    bool _1638 = _1632 >= 0.0;
    bool _1640 = _1638 && _1636;
    float _1642 = floor(_1624);
    bool _1644 = _1632 <= 1.0;
    bool _1646 = _1644 && _1640;
    float _1648 = _1405 * _1584;
    float _1650 = -_1630;
    float _1652 = _1618 + _1650;
    float _1654 = fma(_1191, _1576, _1648);
    float _1656 = fma(_1189, _1600, _1654);
    float _1658 = _1584;
    if (_1646)
    {
        float _1660 = float(_1447);
        _1658 = _1660;
    }
    float _1662 = _1658;
    float _1664 = -_1642;
    float _1666 = _1624 + _1664;
    float _1668 = _1656 + _1608;
    float _1670 = _1648;
    if (_1646)
    {
        float _1672 = rint(_1662);
        float _1674 = precise::max(_1672, 0.0);
        uint _1676 = uint(_1674);
        uint _1678 = clamp(_1676, 0u, 65535u);
        _1670 = as_type<float>(_1678);
    }
    float _1680 = _1670;
    float _1682 = _1668 * _1588;
    float2 _5212 = float2(_1666, _1652);
    float _1684 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5212, float2(0.0), isnan(_5212)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5212, float2(0.0), isnan(_5212)), level(0.0)).x;
    float _1686 = _1632;
    if (_1646)
    {
        float3 _5227 = float3(_1622, _1632, float(as_type<int>(_1680)));
        float3 _5231 = select(_5227, float3(0.0), isnan(_5227));
        float _1688 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5231.xy, uint(rint(_5231.z)), _1682, level(0.0));
        _1686 = _1688;
    }
    float _1690 = _1686;
    float _1692 = in.m_62.w;
    float _1694 = -_721;
    float _1696 = _1694 + 1.0;
    float _1698 = _451 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1702 = _1700 != 0;
    float _1704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1710 = _1708 != 0;
    float _1712 = in.m_68.x;
    int _1714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1716 = _1714 != 0;
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1720 = _1718 != 0;
    float _1722 = _719;
    bool _1724 = _1720;
    float _1726 = _1712;
    if (_1702)
    {
        float _1728 = in.m_62.z;
        _1722 = _1728;
    }
    float _1730 = _1722;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1738 = _1692 > 0.5;
    float _1740 = _363 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1744 = _1738 ? as_type<int>(_1696) : as_type<int>(_721);
    float _1746 = -_1706;
    float _1748 = fma(_1740, 2.0, _1746);
    int _1750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1752 = _1750 != 0;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1756 = in.m_74.x;
    float _1758 = in.m_74.y;
    float _1760 = in.m_74.z;
    float _1762 = in.m_74.w;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1766 = _1716 ? as_type<float>(_1744) : _721;
    float _1768 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1770 = _451 > 0.5;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1774 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1776 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1778 = _1770 ? as_type<int>(_1696) : as_type<int>(_721);
    float _1780 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1782 = _1770;
    if (_1702)
    {
        bool _1784 = _1730 > 0.5;
        _1782 = _1784;
    }
    bool _1786 = _1782;
    float _1788 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_76.x = _1768;
    out.m_76.y = _1774;
    out.m_76.z = _1776;
    out.m_76.w = _1772;
    float _1794 = _1720 ? as_type<float>(_1778) : _721;
    float _1796 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    out.m_78.x = _1780;
    out.m_78.y = _1788;
    out.m_78.z = _1790;
    float _1800 = fma(_1698, -2.0, _1792);
    float _1802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1804 = _317 * _1760;
    float _1806 = _1780;
    float _1808 = _1788;
    float _1810 = _1796;
    if (!_1752)
    {
        float _1812 = in.m_62.z;
        _1806 = _1812;
    }
    float _1814 = _1806;
    float _1816 = _309 * _1760;
    float _1818 = _299 * _1760;
    float _1820 = fma(_1796, _1794, -0.5);
    float _1822 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1800);
    float _1824 = fma(_281, _1756, _1816);
    float _1826 = fma(_285, _1756, _1804);
    float _1828 = fma(_277, _1756, _1818);
    float _1830 = -_1758;
    float _1832 = fma(_327, _1830, _1824);
    float _1834 = -_1758;
    float _1836 = fma(_331, _1834, _1826);
    float _1838 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1798);
    float _1840 = -_1758;
    float _1842 = fma(_323, _1840, _1828);
    float _1844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].z);
    float _1848 = _1838;
    if (!_1752)
    {
        _1808 = _451;
    }
    float _1850 = _1808;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1854 = _1850;
    if (_1752)
    {
        _1854 = _363;
    }
    float _1856 = _1854;
    out.m_80.x = _1832;
    out.m_80.y = _1842;
    out.m_80.z = _1836;
    if (_1710)
    {
        bool _1858 = _363 > 0.5;
        _1724 = _1858;
    }
    bool _1860 = _1724;
    float _1862 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1852);
    float _1864 = -_141;
    float _1866 = fma(_1864, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1748);
    float _1868 = _1814;
    if (!_1752)
    {
        _1810 = _1814;
    }
    float _1870 = _1810;
    float _1872 = _1870;
    if (_1752)
    {
        _1872 = _451;
    }
    float _1874 = _1872;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_1752)
    {
        _1868 = _451;
    }
    float _1878 = _1868;
    bool _1880 = _1117 != 0.0;
    bool _1882 = isnan(_1117);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(0.0);
    bool _1888 = _1884 || _1886;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1894 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1896 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1862);
    float _1898 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1900 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1892);
    float _1902 = fma(_1766, _1894, -0.5);
    float _1904 = -_1822;
    float _1906 = fma(_1896, _1820, _1904);
    float _1908 = -_1890;
    float _1910 = fma(_1898, 2.0, _1908);
    float _1912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1914 = in.m_82.x;
    float _1916 = in.m_82.y;
    float _1918 = in.m_82.z;
    bool _1920 = _1123 == 0.0;
    bool _1922 = !_1888;
    bool _1924 = _1920 && _1922;
    int _1926 = as_type<int>(_1898);
    if (_1710)
    {
        float _1928 = -_1712;
        float _1930 = _1928 + 1.0;
        _1926 = as_type<int>(_1930);
    }
    int _1932 = _1926;
    if (_1702)
    {
        float _1934 = -_1712;
        float _1936 = _1934 + 1.0;
        _1846 = as_type<int>(_1936);
    }
    int _1938 = _1846;
    float _1940 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1876);
    bool _1942 = _1103 == 0.02999999932944774627685546875;
    bool _1944 = _1942 && _1924;
    float _1946 = -_141;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1910);
    if (!_1710)
    {
        _605 = _1712;
    }
    float _1950 = _605;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1954 = _1950;
    if (_1710)
    {
        float _1956 = _1860 ? as_type<float>(_1932) : _1712;
        _1954 = _1956;
    }
    float _1958 = _1954;
    float _1960 = _1906 + 0.5;
    if (_1702)
    {
        float _1962 = _1786 ? as_type<float>(_1938) : _1712;
        _1726 = _1962;
    }
    float _1964 = _1726;
    float _1966 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1968 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1970 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1972 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1940);
    float _1974 = fma(_1966, -2.0, _1952);
    float _1976 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1900);
    float _1978 = fma(_1970, _1964, -0.5);
    float _1980 = fma(_1968, _1958, -0.5);
    float _1982 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1838);
    float _1984 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1974);
    float _1986 = fma(_1976, _1978, _1948);
    float _1988 = _1982;
    if (_1944)
    {
        _1285 = _1916;
    }
    float _1990 = _1285;
    float _1992 = fma(_1982, _1980, _1866);
    float _1994 = -_1984;
    float _1996 = fma(_1972, _1902, _1994);
    float _1998 = _1986 + 0.5;
    float _2000 = _1990;
    if (_1944)
    {
        _1848 = _1990;
    }
    float _2002 = _1848;
    float _2004 = _1992 + 0.5;
    float _2006 = _2002;
    if (!_1944)
    {
        _2000 = _1916;
    }
    float _2008 = _2000;
    float _2010 = _1760 * _1914;
    if (_1944)
    {
        _1988 = _1914;
    }
    float _2012 = _1988;
    float _2014 = _2012;
    if (!_1944)
    {
        float _2016 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1914);
        _2014 = _2016;
    }
    float _2018 = _2014;
    float _2020 = _1996 + 0.5;
    float _2022 = -_2010;
    float _2024 = fma(_1756, _1918, _2022);
    float _2026 = _1756 * _2008;
    if (_1944)
    {
        _159 = _1918;
    }
    float _2028 = _159;
    float _2030 = _1758 * _1918;
    float _2032 = _2028;
    if (!_1944)
    {
        float _2034 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1918);
        _2032 = _2034;
    }
    float _2036 = _2032;
    float _2038 = -_2026;
    float _2040 = fma(_1758, _1914, _2038);
    if (!_1944)
    {
        float _2042 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2006 = _2042;
    }
    float _2044 = _2006;
    float _2046 = -_2030;
    float _2048 = fma(_1760, _2008, _2046);
    out.m_84.x = _2004;
    out.m_84.y = _1960;
    out.m_84.z = _1998;
    out.m_84.w = _2020;
    float _2050 = _309 * _2036;
    float _2052 = _299 * _2036;
    float _2054 = _317 * _2036;
    float _2056 = _2040 * _1762;
    float _2058 = fma(_281, _2018, _2050);
    float _2060 = fma(_277, _2018, _2052);
    float _2062 = fma(_285, _2018, _2054);
    float _2064 = _2048 * _1762;
    float _2066 = _2056 * _309;
    float _2068 = _2056 * _299;
    float _2070 = _2056 * _317;
    float _2072 = _2024 * _1762;
    float _2074 = fma(_2064, _281, _2066);
    float _2076 = _1960;
    if (_1265)
    {
        float _2078 = _1307 * 6.283185482025146484375;
        float _2080 = cos(_2078);
        _2076 = _2080;
    }
    float _2082 = _2076;
    float _2084 = fma(_2064, _285, _2070);
    float _2086 = -_2044;
    float _2088 = fma(_327, _2086, _2058);
    float _2090 = -_2072;
    float _2092 = fma(_2090, _327, _2074);
    float _2094 = -_2044;
    float _2096 = fma(_331, _2094, _2062);
    float _2098 = -_2072;
    float _2100 = fma(_2098, _331, _2084);
    float _2102 = _2088 * _1143;
    float _2104 = fma(_2064, _277, _2068);
    float _2106 = _2088 * _1161;
    float _2108 = in.m_64.w;
    float _2110 = fma(_2096, _1161, _2102);
    float _2112 = -_2072;
    float _2114 = fma(_2112, _323, _2104);
    float _2116 = -_2106;
    float _2118 = fma(_2096, _1143, _2116);
    float _2120 = abs(_1431);
    float _2122 = log2(_2120);
    float _2124 = _1225 * _2110;
    if (_1265)
    {
        float _2126 = _2082 + (-1.0);
        _301 = _2126;
    }
    float _2128 = _301;
    out.m_86.x = _2092;
    out.m_86.y = _2114;
    out.m_86.z = _2100;
    if (_1265)
    {
        float _2130 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _319 = _2130;
    }
    float _2132 = _319;
    float _2134 = _1213 * _2110;
    float _2136 = -_2044;
    float _2138 = fma(_323, _2136, _2060);
    float _2140 = fma(_1213, _2118, _2124);
    if (_1265)
    {
        float _2142 = fma(_1341, _2082, _2132);
        _1343 = _2142;
    }
    float _2144 = _1343;
    float _2146 = -_2134;
    float _2148 = fma(_1225, _2118, _2146);
    float _2150 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _2152 = _1431 <= 8000.0;
    bool _2154 = isnan(_1431);
    bool _2156 = _2152 || _2154;
    bool _2158 = isnan(8000.0);
    bool _2160 = _2156 || _2158;
    float _2162 = float(_2160);
    float _2164 = fma(_1391, 100.0, _2144);
    float _2166 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2168 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2150);
    float _2170 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2172 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2174 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2166);
    float _2176 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2178 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2180 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2172);
    float _2182 = fma(_1189, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2168);
    float _2184 = fma(_1189, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2174);
    float _2186 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2176);
    float _2188 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2190 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2192 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2194 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2186);
    float _2196 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2178);
    float _2198 = trunc(_2190);
    int _2200 = int(_2198);
    float _2202 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2180);
    float _2204 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    out.m_88.w = _2108;
    float _2206 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2188);
    float _2208 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2196);
    float _2210 = _2202 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2212 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2214 = trunc(_2192);
    int _2216 = int(_2214);
    float _2218 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2220 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2222 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2224 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2206);
    float _2226 = _2208 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2228 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2212);
    float _2230 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2222);
    float _2232 = exp2(_2170);
    float _2234 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2218);
    float _2236 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2220);
    float _2238 = _2224 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2240 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2228);
    float _2242 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2230);
    float _2244 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2234);
    float _2246 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2236);
    int _2248 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2250 = _2200 + _2248;
    int _2252 = _2250 + 1;
    float _2254 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2240);
    int _2256 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2258 = _2216 + _2256;
    int _2260 = _2258 + 1;
    float _2262 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2242);
    float _2264 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2244);
    float _2266 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2246);
    bool _2268 = _2252 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2272 = _2164 + _2270;
    int _2274 = _2252 | _2260;
    float _2276 = fma(_2232, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2278 = precise::clamp(_2276, 0.0, 1.0);
    float _2280 = _2272 * _2272;
    bool _2282 = _2274 < 0;
    bool _2284 = _2282 || _2268;
    out.gl_Position.x = _2264;
    out.gl_Position.y = _2254;
    out.gl_Position.z = _2262;
    out.gl_Position.w = _2266;
    float _2286 = fma(_2278, -2.0, 3.0);
    float _2288 = _2278 * _2278;
    bool _2290 = _2260 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2292 = _2290 || _2284;
    float _2294 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2296 = _1373 + _2294;
    float _2298 = _2288 * _2286;
    float _2300 = fma(_2296, _2296, _2280);
    float _2302 = -_2298;
    float _2304 = _2302 + 1.0;
    float _2306 = fma(_2304, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2298);
    float _2308 = _2264;
    float _2310 = _2254;
    float _2312 = _2266;
    float _2314 = _2192;
    if (_2292)
    {
        _2308 = 1.0;
    }
    float _2316 = _2308;
    float _2318 = _2162 * _2306;
    float _2320 = _2316;
    float _2322 = _2318;
    if (!_2292)
    {
        int _2324 = _2260 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2326 = _2324 + _2252;
        float _2328 = floor(_2192);
        int _2330 = _2326 << 2;
        uint _2332 = uint(int(uint(_2326) >> uint(2)));
        int _2334 = 12 & _2330;
        int _2336 = int(_2332) << 4;
        int _2338 = _2336 + _2334;
        float _2340 = floor(_2190);
        float _2342 = -_2328;
        float _2344 = _2192 + _2342;
        int _2346 = _2338 + 400;
        uint _2348 = uint(int(uint(_2346) >> uint(2)));
        uint _2350 = uint(int(uint(int(_2348)) >> uint(2)));
        int _2352 = int(_2348) & 3;
        float _2354 = (*spvDescriptorSet0.vp_c15)._m0[int(_2350)][_2352];
        float _2356 = -_2340;
        float _2358 = _2190 + _2356;
        float _2360 = rint(_2354);
        float _2362 = precise::max(_2360, 0.0);
        uint _2364 = uint(_2362);
        uint _2366 = clamp(_2364, 0u, 65535u);
        float3 _6460 = float3(_2358, _2344, float(int(_2366)));
        float3 _6462 = select(_6460, float3(0.0), isnan(_6460));
        float _2368 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6462.xy, uint(rint(_6462.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6462.xy, uint(rint(_6462.z)), level(0.0)).x;
        int _2370 = _2326 << 4;
        int _2372 = _2370 + 2048;
        uint _2374 = uint(int(uint(_2372) >> uint(2)));
        uint _2376 = uint(int(uint(int(_2374)) >> uint(2)));
        int _2378 = int(_2374) & 3;
        float _2380 = (*spvDescriptorSet0.vp_c15)._m0[int(_2376)][_2378];
        int _2382 = int(_2374) + 1;
        uint _2384 = uint(int(uint(_2382) >> uint(2)));
        int _2386 = _2382 & 3;
        float _2388 = (*spvDescriptorSet0.vp_c15)._m0[int(_2384)][_2386];
        int _2390 = _2372 + 8;
        uint _2392 = uint(int(uint(_2390) >> uint(2)));
        uint _2394 = uint(int(uint(int(_2392)) >> uint(2)));
        int _2396 = int(_2392) & 3;
        float _2398 = (*spvDescriptorSet0.vp_c15)._m0[int(_2394)][_2396];
        int _2400 = int(_2392) + 1;
        uint _2402 = uint(int(uint(_2400) >> uint(2)));
        int _2404 = _2400 & 3;
        float _2406 = (*spvDescriptorSet0.vp_c15)._m0[int(_2402)][_2404];
        float _2408 = _1405 * _2388;
        float _2410 = fma(_1191, _2380, _2408);
        float _2412 = fma(_1189, _2398, _2410);
        float _2414 = _2412 + _2406;
        float _2416 = precise::clamp(_2414, 0.0, 1.0);
        float _2418 = -_2416;
        float _2420 = _2418 + _2368;
        float _2422 = fma(_2420, 500.0, 1.5);
        float _2424 = exp2(_2422);
        float _2426 = 0.0 + _2424;
        float _2428 = precise::clamp(_2426, 0.0, 1.0);
        _2310 = _2354;
        _2320 = _2428;
        _2312 = _2368;
    }
    float _2430 = _2310;
    float _2432 = _2320;
    float _2434 = _2312;
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2438 = _1377 + _2436;
    float _2440 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2442 = -_1684;
    float _2444 = _2442 + 1.0;
    float _2446 = _2430;
    float _2448 = _2434;
    if (!_1646)
    {
        _2446 = 1.0;
    }
    float _2450 = _2446;
    float _2452 = fma(_2438, _2438, _2300);
    float _2454 = _2450;
    if (_1646)
    {
        bool _2456 = _1690 >= _1682;
        bool _2458 = isnan(_1690);
        bool _2460 = _2456 || _2458;
        bool _2462 = isnan(_1682);
        bool _2464 = _2460 || _2462;
        float _2466 = float(_2464);
        _2454 = _2466;
    }
    float _2468 = _2454;
    float _2470 = _2444 * _2440;
    float _2472 = precise::clamp(_2470, 0.0, 1.0);
    out.m_90.x = _2140;
    out.m_90.y = _2138;
    out.m_90.z = _2148;
    float _2474 = _2468 * _2432;
    float _2476 = sqrt(_2452);
    float _2478 = -_2472;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_92.x = _1373;
    out.m_92.y = _2164;
    out.m_92.z = _1377;
    float _2482 = -_2474;
    float _2484 = fma(_2482, _2480, 1.0);
    float _2486 = precise::clamp(_2484, 0.0, 1.0);
    float _2488 = _2486 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _2488;
    bool _2490 = _2476 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2492 = isnan(_2476);
    bool _2494 = _2490 || _2492;
    bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2498 = _2494 || _2496;
    float _2500 = _2472;
    float _2502 = _2480;
    float _2504 = _2486;
    if (!_2498)
    {
        _2322 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2506 = _2322;
    float _2508 = _2506;
    float _2510 = _2506;
    if (!_2498)
    {
        _2314 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2512 = _2314;
    float _2514 = _2512;
    float _2516 = _2512;
    if (!_2498)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2518 = _2448;
    float _2520 = _2518;
    float _2522 = _2518;
    if (!_2498)
    {
        _2500 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2524 = _2500;
    float _2526 = _2524;
    float _2528 = _2524;
    if (!_2498)
    {
        _2502 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2530 = _2502;
    float _2532 = _2530;
    float _2534 = _2530;
    if (!_2498)
    {
        _2504 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2536 = _2504;
    bool _2538 = !_2498;
    float _2540 = _2536;
    float _2542 = _2536;
    if (!_2538)
    {
        bool _2544 = _2476 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2546 = isnan(_2476);
        bool _2548 = _2544 || _2546;
        bool _2550 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2552 = _2548 || _2550;
        if (!_2552)
        {
            float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2556 = _2476 + _2554;
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2560 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2558;
            float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2566 = 1.0 / _2560;
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2584 = _2556 * _2566;
            float _2586 = precise::clamp(_2584, 0.0, 1.0);
            float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2592 = fma(_2586, _2564, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2594 = fma(_2586, _2590, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2596 = fma(_2586, _2570, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2598 = fma(_2586, _2574, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2600 = fma(_2586, _2578, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2602 = fma(_2586, _2582, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2516 = _2592;
            _2534 = _2600;
            _2510 = _2596;
            _2528 = _2598;
            _2522 = _2594;
            _2542 = _2602;
            _2604 = true;
        }
        else
        {
            bool _2606 = _2476 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2608 = isnan(_2476);
            bool _2610 = _2606 || _2608;
            bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2614 = _2610 || _2612;
            if (!_2614)
            {
                _2508 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2616 = _2508;
            _2510 = _2616;
            if (!_2614)
            {
                _2514 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2618 = _2514;
            _2516 = _2618;
            if (!_2614)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2620 = _2520;
            _2522 = _2620;
            if (!_2614)
            {
                _2526 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2622 = _2526;
            _2528 = _2622;
            if (!_2614)
            {
                _2532 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2624 = _2532;
            _2534 = _2624;
            if (!_2614)
            {
                _2540 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2626 = _2540;
            bool _2628 = !_2614;
            _2542 = _2626;
            if (!_2628)
            {
                bool _2630 = _2476 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2632 = isnan(_2476);
                bool _2634 = _2630 || _2632;
                bool _2636 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2638 = _2634 || _2636;
                if (!_2638)
                {
                    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2642 = _2476 + _2640;
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2646 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2644;
                    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2650 = _2648 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2652 = 1.0 / _2646;
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2670 = _2642 * _2652;
                    float _2672 = precise::clamp(_2670, 0.0, 1.0);
                    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2678 = fma(_2672, _2650, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2680 = fma(_2672, _2676, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2682 = fma(_2672, _2656, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2684 = fma(_2672, _2660, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2686 = fma(_2672, _2664, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2688 = fma(_2672, _2668, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2516 = _2678;
                    _2534 = _2686;
                    _2510 = _2682;
                    _2528 = _2684;
                    _2522 = _2680;
                    _2542 = _2688;
                    _2604 = true;
                }
                else
                {
                    _2516 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2534 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2510 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2528 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2542 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2604 = false;
    float _2690 = _2516;
    float _2692 = _2534;
    float _2694 = _2510;
    float _2696 = _2528;
    float _2698 = _2522;
    float _2700 = _2542;
    float _2702 = fma(_2138, -0.5, 0.5);
    float _2704 = precise::clamp(_2702, 0.0, 1.0);
    float _2706 = -_2690;
    float _2708 = _2706 + _2692;
    float _2710 = -_2694;
    float _2712 = _2710 + _2696;
    float _2714 = -_2698;
    float _2716 = _2714 + _2700;
    bool _2718 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2720 = fma(_2704, _2708, _2690);
    float _2722 = fma(_2704, _2712, _2694);
    float _2724 = fma(_2704, _2716, _2698);
    float _2726 = _2720 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _2728 = fma(_2722, 0.298911988735198974609375, _2726);
    float _2730 = fma(_2724, 0.114477999508380889892578125, _2728);
    out.m_96.x = 0.0;
    float _2732 = -_2730;
    float _2734 = _2722 + _2732;
    float _2736 = -_2730;
    float _2738 = _2720 + _2736;
    float _2740 = -_2730;
    float _2742 = _2724 + _2740;
    float _2744 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2746 = fma(_2734, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2730);
    float _2748 = fma(_2738, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2730);
    float _2750 = fma(_2742, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2730);
    out.m_94.w = _2744;
    out.m_98.x = _2746;
    out.m_98.y = _2748;
    out.m_98.z = _2750;
    if (!_2718)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2752 = -_2164;
    float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2756 = -_1373;
    float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2760 = -_1377;
    float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2764 = _2754 * _2754;
    float _2766 = fma(_2758, _2758, _2764);
    float _2768 = fma(_2762, _2762, _2766);
    float _2770 = sqrt(_2768);
    float _2772 = rsqrt(_2768);
    float _2774 = -_2770;
    float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2778 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2780 = precise::clamp(_2778, 0.0, 1.0);
    float _2782 = _2758 * _2772;
    float _2784 = _2754 * _2772;
    float _2786 = abs(_2780);
    float _2788 = log2(_2786);
    float _2790 = _2762 * _2772;
    float _2792 = _2782 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2794 = _2138 * _2784;
    float _2796 = -_2784;
    float _2798 = -_2792;
    float _2800 = fma(_2796, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2798);
    float _2802 = fma(_2140, _2782, _2794);
    float _2804 = -_2790;
    float _2806 = fma(_2804, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2800);
    float _2808 = fma(_2148, _2790, _2802);
    float _2810 = precise::clamp(_2808, 0.0, 1.0);
    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2814 = _2806 + _2812;
    float _2816 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2818 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2820 = precise::clamp(_2818, 0.0, 1.0);
    float _2822 = exp2(_2816);
    float _2824 = _2822 * _2820;
    float _2826 = _2810 * _2824;
    float _2828 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2830 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2832 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _2828;
    out.m_96.y = _2830;
    out.m_96.z = _2832;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2604 = false;
    bool _353 = false;
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
    float _125 = as_type<float>(_117);
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_52.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2889 = as_type<float>(_133);
        out.gl_Position.z = _2889;
    }
    if (!_121)
    {
        return out;
    }
    float _135 = in.m_54.w;
    float _137 = float(_117);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    float _159 = _141;
    if (_157)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _125;
    if (_157)
    {
        out.m_52.x = 0.0;
    }
    int _163 = 0;
    if (_157)
    {
        float _165 = _161 * 5.0;
        _163 = as_type<int>(_165);
    }
    int _167 = _163;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2953 = as_type<float>(_167);
        out.gl_Position.z = _2953;
    }
    if (_157)
    {
        return out;
    }
    float _169 = in.m_56.x;
    float _171 = in.m_56.y;
    float _173 = in.m_56.z;
    float _175 = 1.0 / _137;
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    float _183 = in.m_60.x;
    float _185 = in.m_60.y;
    float _187 = in.m_60.z;
    float _189 = _141 * _175;
    float _191 = _169 * _169;
    float _193 = _171 * _171;
    float _195 = fma(_177, _177, _191);
    float _197 = fma(_179, _179, _193);
    float _199 = fma(_183, _183, _195);
    float _201 = _173 * _173;
    float _203 = fma(_185, _185, _197);
    float _205 = sqrt(_199);
    float _207 = fma(_181, _181, _201);
    float _209 = fma(_187, _187, _207);
    float _211 = sqrt(_203);
    float _213 = sqrt(_209);
    bool _215 = _205 > 0.0;
    bool _217 = _211 > 0.0;
    float _219 = 0.0;
    float _221 = _205;
    float _223 = _211;
    float _225 = _199;
    float _227 = _209;
    float _229 = _203;
    if (_215)
    {
        float _231 = rsqrt(_199);
        _219 = _231;
    }
    float _233 = _219;
    if (!_215)
    {
        _221 = 0.0;
    }
    float _235 = _221;
    bool _237 = _213 > 0.0;
    float _239 = _213;
    float _241 = _235;
    bool _243 = _237;
    float _245 = 0.0;
    if (!_215)
    {
        _223 = 0.0;
    }
    float _247 = _223;
    float _249 = 0.0;
    float _251 = _247;
    if (_217)
    {
        float _253 = rsqrt(_203);
        _249 = _253;
    }
    float _255 = _249;
    if (!_217)
    {
        _239 = 0.0;
    }
    float _257 = _239;
    float _259 = 0.0;
    float _261 = _257;
    if (!_217)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (_237)
    {
        float _269 = rsqrt(_209);
        _265 = _269;
    }
    float _271 = _265;
    float _273 = _233;
    if (_215)
    {
        float _275 = _233 * _169;
        _241 = _275;
    }
    float _277 = _241;
    if (_215)
    {
        float _279 = _233 * _177;
        _245 = _279;
    }
    float _281 = _245;
    if (_215)
    {
        float _283 = _233 * _183;
        _251 = _283;
    }
    float _285 = _251;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_217)
    {
        _273 = 0.0;
    }
    float _289 = _273;
    float _291 = _289;
    if (!_237)
    {
        _225 = 0.0;
    }
    float _293 = _225;
    float _295 = _293;
    if (_217)
    {
        float _297 = _255 * _171;
        _261 = _297;
    }
    float _299 = _261;
    float _301 = _299;
    if (!_237)
    {
        _227 = 0.0;
    }
    float _303 = _227;
    float _305 = _303;
    if (_217)
    {
        float _307 = _255 * _179;
        _267 = _307;
    }
    float _309 = _267;
    if (!_237)
    {
        _229 = 0.0;
    }
    float _311 = _229;
    float _313 = _311;
    if (_217)
    {
        float _315 = _255 * _185;
        _291 = _315;
    }
    float _317 = _291;
    float _319 = _317;
    if (_237)
    {
        float _321 = _271 * _173;
        _295 = _321;
    }
    float _323 = _295;
    if (_237)
    {
        float _325 = _271 * _181;
        _305 = _325;
    }
    float _327 = _305;
    if (_237)
    {
        float _329 = _271 * _187;
        _313 = _329;
    }
    float _331 = _313;
    bool _333 = !_287;
    float _351;
    if (!_333)
    {
        float _335 = in.m_62.x;
        float _337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _339 = _335 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _341 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _343 = _341 * _337;
        float _345 = floor(_343);
        float _347 = -_345;
        float _349 = _343 + _347;
        _351 = _349;
        _353 = true;
    }
    else
    {
        _351 = _189;
    }
    _353 = false;
    float _355 = _351;
    float _357 = in.m_64.x;
    float _359 = in.m_64.y;
    float _361 = _141 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _363 = in.m_62.x;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _373 = in.m_49.x;
    float _375 = in.m_49.y;
    float _377 = in.m_49.z;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = _355 + _379;
    float _383 = 1.0 / _367;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _391 = _355 + _389;
    float _393 = 1.0 / _371;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _403;
    float _407 = -_359;
    float _409 = _407 + 1.0;
    float _411 = abs(_357);
    float _413 = log2(_411);
    float _415 = _381 * _383;
    float _417 = fma(_363, 6.283185482025146484375, _361);
    float _419 = _179 * _375;
    float _421 = 1.0 / _387;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _423;
    float _427 = fma(_177, _373, _419);
    float _429 = _391 * _393;
    float _431 = fma(_425, _415, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _433 = _413 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _417);
    float _437 = _185 * _375;
    float _439 = exp2(_433);
    float _441 = _435 * 0.60000002384185791015625;
    float _443 = fma(_183, _373, _437);
    float _445 = _435 + 0.52359879016876220703125;
    float _447 = _441 * 0.15915493667125701904296875;
    float _449 = _435 * 0.15915493667125701904296875;
    float _451 = in.m_62.y;
    float _453 = _445 * 0.15915493667125701904296875;
    float _455 = fma(_435, 0.60000002384185791015625, 0.31415927410125732421875);
    float _457 = _435 * 1.2999999523162841796875;
    float _459 = fma(_435, 1.2999999523162841796875, 0.680678427219390869140625);
    float _461 = _455 * 0.15915493667125701904296875;
    float _463 = _449 * 6.283185482025146484375;
    float _465 = sin(_463);
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _469 = _459 * 0.15915493667125701904296875;
    float _471 = _457 * 0.15915493667125701904296875;
    float _473 = fma(_467, _439, _361);
    float _475 = in.m_66.x;
    float _477 = in.m_66.y;
    float _479 = in.m_66.z;
    float _481 = _471 * 6.283185482025146484375;
    float _483 = sin(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _485;
    float _489 = fma(_363, 6.283185482025146484375, _473);
    float _491 = fma(_357, 0.261799395084381103515625, -0.261799395084381103515625);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = fma(_487, _415, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _499 = -_357;
    float _501 = _499 + 1.0;
    float _503 = _447 * 6.283185482025146484375;
    float _505 = sin(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _513 = _355 + _511;
    float _515 = _451 * 628.31854248046875;
    float _517 = fma(_495, _429, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _519 = fma(_509, _363, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _521 = _513 * _421;
    float _523 = _453 * 6.283185482025146484375;
    float _525 = sin(_523);
    float _527 = fma(_141, _519, _515);
    float _529 = fma(_401, _521, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _531 = _527 * 0.89999997615814208984375;
    float _533 = _527 * 0.15915493667125701904296875;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _535;
    float _539 = _461 * 6.283185482025146484375;
    float _541 = sin(_539);
    float _543 = _531 * 0.15915493667125701904296875;
    float _545 = _527 + _491;
    bool _547 = _475 > 0.0;
    float _549 = fma(_537, _415, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _555 = _545 * 0.15915493667125701904296875;
    bool _557 = _475 >= 0.0;
    bool _559 = isnan(_475);
    bool _561 = _557 || _559;
    bool _563 = isnan(0.0);
    bool _565 = _561 || _563;
    float _567 = fma(_505, 0.60000002384185791015625, _465);
    float _569 = fma(_553, _429, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _571 = _469 * 6.283185482025146484375;
    float _573 = sin(_571);
    int _575 = _565 ? 0 : 1;
    float _577 = fma(_483, 0.300000011920928955078125, _567);
    bool _579 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _581 = isnan(_355);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = _545 * 1.10000002384185791015625;
    int _593 = ~_575;
    int _595 = _593 + 1;
    int _597 = _595 + 1;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _603 = _597;
    float _605 = _363;
    if (!_547)
    {
        int _607 = ~_575;
        int _609 = _607 + 1;
        _603 = _609;
    }
    int _611 = _603;
    float _613 = _555 * 6.283185482025146484375;
    float _615 = sin(_613);
    bool _617 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _619 = isnan(_355);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = _545 * 0.699999988079071044921875;
    float _631 = _489 * 0.15915493667125701904296875;
    float _633 = _591 * 0.15915493667125701904296875;
    float _635 = fma(_601, _429, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _637 = _545 * 0.89999997615814208984375;
    float _639 = _629 * 0.15915493667125701904296875;
    float _641 = _633 * 6.283185482025146484375;
    float _643 = cos(_641);
    float _645 = fma(_397, _521, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _647 = fma(_541, 0.60000002384185791015625, _525);
    float _649 = _489 * 0.60000002384185791015625;
    float _651 = fma(_405, _521, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _653 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _655 = isnan(_355);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _489 * 1.2999999523162841796875;
    bool _667 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _669 = isnan(_355);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = _649 * 0.15915493667125701904296875;
    float _681 = -_589;
    float _683 = _681 + 1.0;
    float _685 = -_663;
    float _687 = _685 + 1.0;
    float _689 = _665 * 0.15915493667125701904296875;
    float _691 = _577 * _501;
    float _693 = _677 * _683;
    float _695 = -_677;
    float _697 = _695 + 1.0;
    float _699 = fma(_573, 0.300000011920928955078125, _647);
    float _701 = _637 * 0.15915493667125701904296875;
    float _703 = _589 * _687;
    float _705 = _627 * _697;
    float _707 = _631 * 6.283185482025146484375;
    float _709 = sin(_707);
    float _711 = _691 * 0.52359879016876220703125;
    float _713 = -_627;
    float _715 = _713 + 1.0;
    float _717 = _497 * _705;
    float _719 = _431 * _705;
    float _721 = in.m_68.y;
    float _723 = _549 * _705;
    float _725 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[143].x, _717);
    float _727 = _679 * 6.283185482025146484375;
    float _729 = sin(_727);
    float _731 = abs(_699);
    float _733 = _409 * _731;
    float _735 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[143].y, _719);
    float _737 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[143].z, _723);
    float _739 = fma(_517, _693, _725);
    float _741 = _733 * (-45.0);
    float _743 = float(_611);
    float _745 = fma(_635, _693, _737);
    float _747 = _701 * 6.283185482025146484375;
    float _749 = sin(_747);
    float _751 = _711 * 0.15915493667125701904296875;
    float _753 = fma(_529, _703, _739);
    float _755 = _733 * (-20.0);
    float _757 = fma(_569, _693, _735);
    float _759 = fma(_651, _703, _745);
    float _761 = _741 * 0.01745329238474369049072265625;
    float _763 = _689 * 6.283185482025146484375;
    float _765 = sin(_763);
    float _767 = fma(_729, 0.60000002384185791015625, _709);
    float _769 = fma(_645, _703, _757);
    float _771 = _743 * _755;
    float _773 = _761 * 0.15915493667125701904296875;
    float _775 = _477 + (-0.0199999995529651641845703125);
    float _777 = _771 * 0.01745329238474369049072265625;
    float _779 = _639 * 6.283185482025146484375;
    float _781 = cos(_779);
    float _783 = _749 * 0.89999997615814208984375;
    float _785 = fma(_721, 0.5, 0.5);
    float _787 = _777 * 0.15915493667125701904296875;
    float _789 = -_783;
    float _791 = fma(_615, -1.2000000476837158203125, _789);
    float _793 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[146].x, _753);
    float _795 = _751 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = fma(_765, 0.300000011920928955078125, _767);
    float _801 = abs(_791);
    bool _803 = _801 > 0.001000000047497451305389404296875;
    bool _805 = isnan(_801);
    bool _807 = _803 || _805;
    bool _809 = isnan(0.001000000047497451305389404296875);
    bool _811 = _807 || _809;
    float _813 = in.m_70.x;
    float _815 = in.m_70.y;
    float _817 = in.m_70.z;
    float _819 = _785 * _799;
    float _821 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[146].y, _769);
    float _823 = _811 ? _791 : 0.001000000047497451305389404296875;
    float _825 = _751 * 6.283185482025146484375;
    float _827 = cos(_825);
    float _829 = _781 * 0.699999988079071044921875;
    float _831 = _819 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _833 = abs(_823);
    bool _835 = _833 == 0.0;
    float _837 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[146].z, _759);
    float _839 = fma(_643, 1.10000002384185791015625, _829);
    float _841 = _831 * 0.01745329238474369049072265625;
    float _843 = _773 * 6.283185482025146484375;
    float _845 = sin(_843);
    float _847 = _797 * _475;
    float _849 = abs(_839);
    bool _851 = _849 != 0.0;
    bool _853 = isnan(_849);
    bool _855 = _851 || _853;
    bool _857 = isnan(0.0);
    bool _859 = _855 || _857;
    float _861 = _841 * 0.15915493667125701904296875;
    float _863 = abs(_823);
    bool _865 = _863 == 0.0;
    bool _867 = !_859;
    bool _869 = _865 && _867;
    float _871 = _773 * 6.283185482025146484375;
    float _873 = cos(_871);
    float _875 = -_847;
    float _877 = fma(_827, _479, _875);
    float _879 = _827 * _475;
    float _881 = _793 * _813;
    float _883 = _821 * _815;
    float _885 = _877 + 0.02999999932944774627685546875;
    float _887 = fma(_797, _479, _879);
    float _889 = _837 * _817;
    float _891 = _787 * 6.283185482025146484375;
    float _893 = sin(_891);
    float _895 = _845 * _885;
    float _897 = fma(_743, -0.100000001490116119384765625, _887);
    if (_869)
    {
        bool _899 = as_type<int>(_823) >= 0;
        _243 = _899;
    }
    bool _901 = _243;
    float _903 = _527 * 0.699999988079071044921875;
    float _905 = _787 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = -_895;
    float _911 = fma(_873, _775, _909);
    float _913 = _873 * _885;
    float _915 = _533 * 6.283185482025146484375;
    float _917 = cos(_915);
    float _919 = _911 * _893;
    float _921 = _543 * 6.283185482025146484375;
    float _923 = cos(_921);
    float _925 = _911 * _907;
    int _927 = as_type<int>(_911);
    int _929 = _901 ? (-1) : 0;
    if (_869)
    {
        int _931 = _901 ? 0 : 1078530011;
        _927 = _931;
    }
    int _933 = _927;
    float _935 = -_919;
    float _937 = fma(_907, _897, _935);
    float _939 = fma(_893, _897, _925);
    int _941 = _933;
    if (_869)
    {
        int _943 = int(0x80000000) & as_type<int>(_839);
        int _945 = _933 | _943;
        _941 = _945;
    }
    int _947 = _941;
    float _949 = _861 * 6.283185482025146484375;
    float _951 = sin(_949);
    float _953 = _861 * 6.283185482025146484375;
    float _955 = cos(_953);
    bool _957 = !_859;
    bool _959 = _957 && _835;
    int _961 = _947;
    float _963 = as_type<float>(_947);
    if (!_959)
    {
        float _965 = abs(_839);
        bool _967 = _965 != as_type<float>(0x7f800000u /* inf */);
        bool _969 = isnan(_965);
        bool _971 = _967 || _969;
        bool _973 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _975 = _971 || _973;
        float _977 = abs(_823);
        bool _979 = _977 == as_type<float>(0x7f800000u /* inf */);
        float _981 = abs(_823);
        bool _983 = _981 == as_type<float>(0x7f800000u /* inf */);
        bool _985 = !_975;
        bool _987 = _983 && _985;
        if (_987)
        {
            bool _989 = as_type<int>(_823) >= 0;
            _929 = _989 ? (-1) : 0;
        }
        int _991 = _929;
        if (_987)
        {
            _961 = 1075235812;
        }
        int _993 = _961;
        int _995 = _993;
        if (_987)
        {
            int _997 = ~_991;
            int _999 = (_997 != 0) ? _993 : 1061752795;
            _995 = _999;
        }
        int _1001 = _995;
        float _1003 = as_type<float>(_1001);
        if (_987)
        {
            int _1005 = int(0x80000000) & as_type<int>(_839);
            int _1007 = _1001 | _1005;
            _1003 = as_type<float>(_1007);
        }
        float _1009 = _1003;
        bool _1011 = !_975;
        bool _1013 = _1011 && _979;
        _963 = _1009;
        if (!_1013)
        {
            float _1015 = abs(_839);
            float _1017 = abs(_823);
            float _1019 = precise::max(_1015, _1017);
            float _1021 = abs(_839);
            float _1023 = abs(_823);
            float _1025 = precise::min(_1021, _1023);
            float _1027 = 1.0 / _1019;
            float _1029 = abs(_839);
            float _1031 = abs(_823);
            bool _1033 = _1029 > _1031;
            bool _1035 = as_type<int>(_823) >= 0;
            float _1037 = _1025 * _1027;
            float _1039 = _1037 * _1037;
            float _1041 = _1039 + 11.33538818359375;
            float _1043 = fma(_1039, _1041, 28.84246826171875);
            float _1045 = fma(_1039, _1043, 19.6966705322265625);
            float _1047 = fma(_1039, -0.82336294651031494140625, -5.674867153167724609375);
            float _1049 = fma(_1039, _1047, -6.565555095672607421875);
            float _1051 = 1.0 / _1045;
            float _1053 = _1039 * _1049;
            float _1055 = abs(_839);
            float _1057 = abs(_823);
            float _1059 = _1055 + _1057;
            int _1061 = as_type<int>(_839) & int(0x80000000);
            float _1063 = _1037 * _1053;
            bool _1065 = _1059 > as_type<float>(0x7f800000u /* inf */);
            bool _1067 = isnan(_1059);
            bool _1069 = _1065 || _1067;
            bool _1071 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1073 = _1069 || _1071;
            float _1075 = fma(_1063, _1051, _1037);
            float _1077 = _1075;
            _963 = _1059;
            if (_1033)
            {
                float _1079 = -_1075;
                float _1081 = _1079 + 1.57079637050628662109375;
                _1077 = _1081;
            }
            float _1083 = _1077;
            int _1085 = as_type<int>(_1083);
            if (!_1035)
            {
                float _1087 = -_1083;
                float _1089 = _1087 + 3.1415927410125732421875;
                _1085 = as_type<int>(_1089);
            }
            int _1091 = _1085;
            if (!_1073)
            {
                int _1093 = _1061 | _1091;
                _963 = as_type<float>(_1093);
            }
        }
    }
    float _1095 = _963;
    float _1097 = _939 + 0.0199999995529651641845703125;
    float _1099 = fma(_743, 0.100000001490116119384765625, _937);
    float _1101 = in.m_62.z;
    float _1103 = fma(_845, _775, _913);
    float _1105 = _1097 * _951;
    float _1107 = _1097 * _955;
    float _1109 = _1095 + 1.57079637050628662109375;
    float _1111 = _883 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1113 = -_1105;
    float _1115 = fma(_1099, _955, _1113);
    float _1117 = fma(_1099, _951, _1107);
    float _1119 = _881 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1121 = in.m_60.w;
    float _1123 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1115);
    float _1125 = _1103 + (-0.02999999932944774627685546875);
    float _1127 = _1109 * (-0.15915493667125701904296875);
    float _1129 = in.m_58.w;
    float _1131 = _889 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1125);
    float _1135 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1117);
    float _1137 = _527 * 1.10000002384185791015625;
    float _1139 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1123);
    float _1141 = _1127 * 6.283185482025146484375;
    float _1143 = cos(_1141);
    float _1145 = _1131 * _1133;
    float _1147 = _1111 * _1135;
    float _1149 = _1119 * _1139;
    float _1151 = _903 * 0.15915493667125701904296875;
    float _1153 = _1145 * _309;
    float _1155 = _1101 * 6.283185482025146484375;
    float _1157 = _1137 * 0.15915493667125701904296875;
    float _1159 = _1127 * 6.283185482025146484375;
    float _1161 = sin(_1159);
    float _1163 = _1145 * _317;
    float _1165 = fma(_1149, _281, _1153);
    float _1167 = _1155 * 0.15915493667125701904296875;
    float _1169 = fma(_181, _377, _427);
    float _1171 = fma(_1149, _285, _1163);
    float _1173 = -_1147;
    float _1175 = fma(_1173, _327, _1165);
    float _1177 = fma(_187, _377, _443);
    float _1179 = _1151 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = -_1147;
    float _1185 = fma(_1183, _331, _1171);
    float _1187 = _1175 * _1143;
    float _1189 = _1177 + _1121;
    float _1191 = _1169 + _1129;
    float _1193 = fma(_917, 1.2000000476837158203125, _923);
    float _1195 = _189 * 3.3333332538604736328125;
    float _1197 = _1157 * 6.283185482025146484375;
    float _1199 = sin(_1197);
    float _1201 = _1175 * _1161;
    float _1203 = fma(_1185, _1161, _1187);
    float _1205 = -_1201;
    float _1207 = fma(_1185, _1143, _1205);
    float _1209 = _1191 + _1203;
    float _1211 = _1167 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = _1189 + _1207;
    float _1217 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1209);
    float _1219 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1221 = _1217 + _1219;
    float _1223 = _1167 * 6.283185482025146484375;
    float _1225 = cos(_1223);
    float _1227 = _1181 + _1199;
    float _1229 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1215);
    float _1231 = _1213 * _1221;
    float _1233 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1235 = _1229 + _1233;
    float _1237 = _1225 * _1221;
    float _1239 = -_1231;
    float _1241 = fma(_1225, _1235, _1239);
    float _1243 = fma(_1213, _1235, _1237);
    float _1245 = _1241 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1247 = in.m_72.y;
    float _1249 = _1243 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1253 = _1245 + _1251;
    float _1255 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1257 = _1249 + _1255;
    float _1259 = _1253 * _1253;
    float _1261 = fma(_1257, _1257, _1259);
    float _1263 = sqrt(_1261);
    bool _1265 = _1263 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1269 = _1263 + _1267;
    float _1271 = 0.0 + _1195;
    float _1273 = precise::clamp(_1271, 0.0, 1.0);
    float _1275 = -_1195;
    float _1277 = _1275 + 3.3333332538604736328125;
    float _1279 = precise::clamp(_1277, 0.0, 1.0);
    float _1281 = precise::min(_1273, _1279);
    float _1283 = _759;
    float _1285 = _1103;
    if (_1265)
    {
        float _1287 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1287;
    }
    float _1289 = _1283;
    float _1291 = _1289;
    if (_1265)
    {
        float _1293 = _1269 * _1289;
        _1291 = _1293;
    }
    float _1295 = _1291;
    float _1297 = _1145 * _299;
    float _1299 = _375 + _1247;
    float _1301 = _1295;
    float _1303 = _1247;
    if (_1265)
    {
        float _1305 = _1295 * 0.15915493667125701904296875;
        _1301 = _1305;
    }
    float _1307 = _1301;
    float _1309 = fma(_1149, _277, _1297);
    if (_1265)
    {
        float _1311 = rsqrt(_1261);
        _1303 = _1311;
    }
    float _1313 = _1303;
    float _1315 = -_1147;
    float _1317 = fma(_1315, _323, _1309);
    float _1319 = fma(_1281, -5.0, 5.0);
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1323 = _1321 + 1.0;
    float _1325 = _1299 + _1317;
    float _1327 = _1203;
    float _1329 = _1319;
    float _1331 = _1323;
    if (_1265)
    {
        float _1333 = _1307 * 6.283185482025146484375;
        float _1335 = sin(_1333);
        _1327 = _1335;
    }
    float _1337 = _1327;
    float _1339 = -_1319;
    float _1341 = fma(_1339, _1323, _1325);
    float _1343 = _1341;
    if (!_1265)
    {
        _1329 = _1249;
    }
    float _1345 = _1329;
    float _1347 = _1345;
    if (_1265)
    {
        float _1349 = _1341 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1331 = _1349;
    }
    float _1351 = _1331;
    float _1353 = _1351;
    float _1355 = _1337;
    if (_1265)
    {
        float _1357 = fma(_1337, _1351, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1353 = _1357;
    }
    float _1359 = _1353;
    float _1361 = _1359;
    if (!_1265)
    {
        _1355 = _1245;
    }
    float _1363 = _1355;
    float _1365 = _1363;
    if (_1265)
    {
        float _1367 = _1313 * _1359;
        _1361 = _1367;
    }
    float _1369 = _1361;
    if (_1265)
    {
        float _1371 = fma(_1257, _1369, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1347 = _1371;
    }
    float _1373 = _1347;
    if (_1265)
    {
        float _1375 = fma(_1253, _1369, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1365 = _1375;
    }
    float _1377 = _1365;
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1381 = _1373 + _1379;
    float _1383 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1385 = _1377 + _1383;
    float _1387 = fma(_1381, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1389 = fma(_1385, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4717 = float2(_1387, _1389);
    float _1391 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4717, float2(0.0), isnan(_4717)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4717, float2(0.0), isnan(_4717)), level(0.0)).x;
    float _1393 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1395 = fma(_1391, 100.0, _1299);
    float _1397 = _1395 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1399 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1397);
    float _1401 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1399);
    float _1403 = _1395 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1405 = _1395 + _1393;
    float _1407 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1409 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1403);
    float _1411 = 1.0 / _1407;
    float _1413 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1409);
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1417 = _1415 + _1407;
    float _1419 = _1417 * _1411;
    float _1421 = _1419 * 0.5;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1425 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1423);
    float _1427 = 1.0 / _1425;
    float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1431 = _1427 * _1429;
    bool _1433 = _1431 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1435 = _1431 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1437 = !_1433;
    int _1439 = _1437 ? 0 : 1;
    int _1441 = 2;
    if (!_1433)
    {
        _1441 = 1;
    }
    int _1443 = _1441;
    int _1445 = _1443;
    if (!_1435)
    {
        _1445 = _1439;
    }
    int _1447 = _1445;
    int _1449 = _1447 << 6;
    int _1451 = _1449 + 96;
    uint _1454 = uint(int(uint(_1451) >> uint(2)));
    uint _1456 = uint(int(uint(int(_1454)) >> uint(2)));
    int _1458 = int(_1454) & 3;
    float _1460 = (*spvDescriptorSet0.vp_c15)._m0[int(_1456)][_1458];
    int _1462 = int(_1454) + 1;
    uint _1464 = uint(int(uint(_1462) >> uint(2)));
    int _1466 = _1462 & 3;
    float _1468 = (*spvDescriptorSet0.vp_c15)._m0[int(_1464)][_1466];
    int _1470 = _1449 + 104;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    uint _1474 = uint(int(uint(int(_1472)) >> uint(2)));
    int _1476 = int(_1472) & 3;
    float _1478 = (*spvDescriptorSet0.vp_c15)._m0[int(_1474)][_1476];
    int _1480 = int(_1472) + 1;
    uint _1482 = uint(int(uint(_1480) >> uint(2)));
    int _1484 = _1480 & 3;
    float _1486 = (*spvDescriptorSet0.vp_c15)._m0[int(_1482)][_1484];
    int _1488 = _1449 + 48;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    uint _1492 = uint(int(uint(int(_1490)) >> uint(2)));
    int _1494 = int(_1490) & 3;
    float _1496 = (*spvDescriptorSet0.vp_c15)._m0[int(_1492)][_1494];
    int _1498 = int(_1490) + 1;
    uint _1500 = uint(int(uint(_1498) >> uint(2)));
    int _1502 = _1498 & 3;
    float _1504 = (*spvDescriptorSet0.vp_c15)._m0[int(_1500)][_1502];
    int _1506 = _1449 + 64;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    uint _1510 = uint(int(uint(int(_1508)) >> uint(2)));
    int _1512 = int(_1508) & 3;
    float _1514 = (*spvDescriptorSet0.vp_c15)._m0[int(_1510)][_1512];
    int _1516 = int(_1508) + 1;
    uint _1518 = uint(int(uint(_1516) >> uint(2)));
    int _1520 = _1516 & 3;
    float _1522 = (*spvDescriptorSet0.vp_c15)._m0[int(_1518)][_1520];
    int _1524 = _1449 + 56;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
    int _1530 = int(_1526) & 3;
    float _1532 = (*spvDescriptorSet0.vp_c15)._m0[int(_1528)][_1530];
    int _1534 = int(_1526) + 1;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    int _1538 = _1534 & 3;
    float _1540 = (*spvDescriptorSet0.vp_c15)._m0[int(_1536)][_1538];
    int _1542 = _1449 + 72;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    uint _1546 = uint(int(uint(int(_1544)) >> uint(2)));
    int _1548 = int(_1544) & 3;
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[int(_1546)][_1548];
    int _1552 = int(_1544) + 1;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    int _1556 = _1552 & 3;
    float _1558 = (*spvDescriptorSet0.vp_c15)._m0[int(_1554)][_1556];
    float _1560 = _1405 * _1468;
    float _1562 = fma(_1191, _1460, _1560);
    float _1564 = fma(_1189, _1478, _1562);
    float _1566 = _1564 + _1486;
    int _1568 = _1449 + 80;
    uint _1570 = uint(int(uint(_1568) >> uint(2)));
    uint _1572 = uint(int(uint(int(_1570)) >> uint(2)));
    int _1574 = int(_1570) & 3;
    float _1576 = (*spvDescriptorSet0.vp_c15)._m0[int(_1572)][_1574];
    int _1578 = int(_1570) + 1;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    int _1582 = _1578 & 3;
    float _1584 = (*spvDescriptorSet0.vp_c15)._m0[int(_1580)][_1582];
    float _1586 = _1405 * _1504;
    float _1588 = 1.0 / _1566;
    float _1590 = fma(_1191, _1496, _1586);
    int _1592 = _1449 + 88;
    uint _1594 = uint(int(uint(_1592) >> uint(2)));
    uint _1596 = uint(int(uint(int(_1594)) >> uint(2)));
    int _1598 = int(_1594) & 3;
    float _1600 = (*spvDescriptorSet0.vp_c15)._m0[int(_1596)][_1598];
    int _1602 = int(_1594) + 1;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    int _1606 = _1602 & 3;
    float _1608 = (*spvDescriptorSet0.vp_c15)._m0[int(_1604)][_1606];
    float _1610 = _1405 * _1522;
    float _1612 = fma(_1191, _1514, _1610);
    float _1614 = fma(_1189, _1532, _1590);
    float _1616 = _1614 + _1540;
    float _1618 = fma(_1189, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1620 = fma(_1189, _1550, _1612);
    float _1622 = _1616 * _1588;
    float _1624 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1626 = _1620 + _1558;
    bool _1628 = _1622 >= 0.0;
    float _1630 = floor(_1618);
    float _1632 = _1626 * _1588;
    bool _1634 = _1622 <= 1.0;
    bool _1636 = _1634 && _1628;
    bool _1638 = _1632 >= 0.0;
    bool _1640 = _1638 && _1636;
    float _1642 = floor(_1624);
    bool _1644 = _1632 <= 1.0;
    bool _1646 = _1644 && _1640;
    float _1648 = _1405 * _1584;
    float _1650 = -_1630;
    float _1652 = _1618 + _1650;
    float _1654 = fma(_1191, _1576, _1648);
    float _1656 = fma(_1189, _1600, _1654);
    float _1658 = _1584;
    if (_1646)
    {
        float _1660 = float(_1447);
        _1658 = _1660;
    }
    float _1662 = _1658;
    float _1664 = -_1642;
    float _1666 = _1624 + _1664;
    float _1668 = _1656 + _1608;
    float _1670 = _1648;
    if (_1646)
    {
        float _1672 = rint(_1662);
        float _1674 = precise::max(_1672, 0.0);
        uint _1676 = uint(_1674);
        uint _1678 = clamp(_1676, 0u, 65535u);
        _1670 = as_type<float>(_1678);
    }
    float _1680 = _1670;
    float _1682 = _1668 * _1588;
    float2 _5212 = float2(_1666, _1652);
    float _1684 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5212, float2(0.0), isnan(_5212)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5212, float2(0.0), isnan(_5212)), level(0.0)).x;
    float _1686 = _1632;
    if (_1646)
    {
        float3 _5227 = float3(_1622, _1632, float(as_type<int>(_1680)));
        float3 _5231 = select(_5227, float3(0.0), isnan(_5227));
        float _1688 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5231.xy, uint(rint(_5231.z)), _1682, level(0.0));
        _1686 = _1688;
    }
    float _1690 = _1686;
    float _1692 = in.m_62.w;
    float _1694 = -_721;
    float _1696 = _1694 + 1.0;
    float _1698 = _451 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1702 = _1700 != 0;
    float _1704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1710 = _1708 != 0;
    float _1712 = in.m_68.x;
    int _1714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1716 = _1714 != 0;
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1720 = _1718 != 0;
    float _1722 = _719;
    bool _1724 = _1720;
    float _1726 = _1712;
    if (_1702)
    {
        float _1728 = in.m_62.z;
        _1722 = _1728;
    }
    float _1730 = _1722;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1738 = _1692 > 0.5;
    float _1740 = _363 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1744 = _1738 ? as_type<int>(_1696) : as_type<int>(_721);
    float _1746 = -_1706;
    float _1748 = fma(_1740, 2.0, _1746);
    int _1750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1752 = _1750 != 0;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1756 = in.m_74.x;
    float _1758 = in.m_74.y;
    float _1760 = in.m_74.z;
    float _1762 = in.m_74.w;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1766 = _1716 ? as_type<float>(_1744) : _721;
    float _1768 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1770 = _451 > 0.5;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1774 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1776 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1778 = _1770 ? as_type<int>(_1696) : as_type<int>(_721);
    float _1780 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1782 = _1770;
    if (_1702)
    {
        bool _1784 = _1730 > 0.5;
        _1782 = _1784;
    }
    bool _1786 = _1782;
    float _1788 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_76.x = _1768;
    out.m_76.y = _1774;
    out.m_76.z = _1776;
    out.m_76.w = _1772;
    float _1794 = _1720 ? as_type<float>(_1778) : _721;
    float _1796 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    out.m_78.x = _1780;
    out.m_78.y = _1788;
    out.m_78.z = _1790;
    float _1800 = fma(_1698, -2.0, _1792);
    float _1802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1804 = _317 * _1760;
    float _1806 = _1780;
    float _1808 = _1788;
    float _1810 = _1796;
    if (!_1752)
    {
        float _1812 = in.m_62.z;
        _1806 = _1812;
    }
    float _1814 = _1806;
    float _1816 = _309 * _1760;
    float _1818 = _299 * _1760;
    float _1820 = fma(_1796, _1794, -0.5);
    float _1822 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1800);
    float _1824 = fma(_281, _1756, _1816);
    float _1826 = fma(_285, _1756, _1804);
    float _1828 = fma(_277, _1756, _1818);
    float _1830 = -_1758;
    float _1832 = fma(_327, _1830, _1824);
    float _1834 = -_1758;
    float _1836 = fma(_331, _1834, _1826);
    float _1838 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1798);
    float _1840 = -_1758;
    float _1842 = fma(_323, _1840, _1828);
    float _1844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].z);
    float _1848 = _1838;
    if (!_1752)
    {
        _1808 = _451;
    }
    float _1850 = _1808;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1854 = _1850;
    if (_1752)
    {
        _1854 = _363;
    }
    float _1856 = _1854;
    out.m_80.x = _1832;
    out.m_80.y = _1842;
    out.m_80.z = _1836;
    if (_1710)
    {
        bool _1858 = _363 > 0.5;
        _1724 = _1858;
    }
    bool _1860 = _1724;
    float _1862 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1852);
    float _1864 = -_141;
    float _1866 = fma(_1864, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1748);
    float _1868 = _1814;
    if (!_1752)
    {
        _1810 = _1814;
    }
    float _1870 = _1810;
    float _1872 = _1870;
    if (_1752)
    {
        _1872 = _451;
    }
    float _1874 = _1872;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_1752)
    {
        _1868 = _451;
    }
    float _1878 = _1868;
    bool _1880 = _1117 != 0.0;
    bool _1882 = isnan(_1117);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(0.0);
    bool _1888 = _1884 || _1886;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1894 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1896 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1862);
    float _1898 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1900 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1892);
    float _1902 = fma(_1766, _1894, -0.5);
    float _1904 = -_1822;
    float _1906 = fma(_1896, _1820, _1904);
    float _1908 = -_1890;
    float _1910 = fma(_1898, 2.0, _1908);
    float _1912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1914 = in.m_82.x;
    float _1916 = in.m_82.y;
    float _1918 = in.m_82.z;
    bool _1920 = _1123 == 0.0;
    bool _1922 = !_1888;
    bool _1924 = _1920 && _1922;
    int _1926 = as_type<int>(_1898);
    if (_1710)
    {
        float _1928 = -_1712;
        float _1930 = _1928 + 1.0;
        _1926 = as_type<int>(_1930);
    }
    int _1932 = _1926;
    if (_1702)
    {
        float _1934 = -_1712;
        float _1936 = _1934 + 1.0;
        _1846 = as_type<int>(_1936);
    }
    int _1938 = _1846;
    float _1940 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1876);
    bool _1942 = _1103 == 0.02999999932944774627685546875;
    bool _1944 = _1942 && _1924;
    float _1946 = -_141;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1910);
    if (!_1710)
    {
        _605 = _1712;
    }
    float _1950 = _605;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1954 = _1950;
    if (_1710)
    {
        float _1956 = _1860 ? as_type<float>(_1932) : _1712;
        _1954 = _1956;
    }
    float _1958 = _1954;
    float _1960 = _1906 + 0.5;
    if (_1702)
    {
        float _1962 = _1786 ? as_type<float>(_1938) : _1712;
        _1726 = _1962;
    }
    float _1964 = _1726;
    float _1966 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1968 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1970 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1972 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1940);
    float _1974 = fma(_1966, -2.0, _1952);
    float _1976 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1900);
    float _1978 = fma(_1970, _1964, -0.5);
    float _1980 = fma(_1968, _1958, -0.5);
    float _1982 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1838);
    float _1984 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1974);
    float _1986 = fma(_1976, _1978, _1948);
    float _1988 = _1982;
    if (_1944)
    {
        _1285 = _1916;
    }
    float _1990 = _1285;
    float _1992 = fma(_1982, _1980, _1866);
    float _1994 = -_1984;
    float _1996 = fma(_1972, _1902, _1994);
    float _1998 = _1986 + 0.5;
    float _2000 = _1990;
    if (_1944)
    {
        _1848 = _1990;
    }
    float _2002 = _1848;
    float _2004 = _1992 + 0.5;
    float _2006 = _2002;
    if (!_1944)
    {
        _2000 = _1916;
    }
    float _2008 = _2000;
    float _2010 = _1760 * _1914;
    if (_1944)
    {
        _1988 = _1914;
    }
    float _2012 = _1988;
    float _2014 = _2012;
    if (!_1944)
    {
        float _2016 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1914);
        _2014 = _2016;
    }
    float _2018 = _2014;
    float _2020 = _1996 + 0.5;
    float _2022 = -_2010;
    float _2024 = fma(_1756, _1918, _2022);
    float _2026 = _1756 * _2008;
    if (_1944)
    {
        _159 = _1918;
    }
    float _2028 = _159;
    float _2030 = _1758 * _1918;
    float _2032 = _2028;
    if (!_1944)
    {
        float _2034 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1918);
        _2032 = _2034;
    }
    float _2036 = _2032;
    float _2038 = -_2026;
    float _2040 = fma(_1758, _1914, _2038);
    if (!_1944)
    {
        float _2042 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2006 = _2042;
    }
    float _2044 = _2006;
    float _2046 = -_2030;
    float _2048 = fma(_1760, _2008, _2046);
    out.m_84.x = _2004;
    out.m_84.y = _1960;
    out.m_84.z = _1998;
    out.m_84.w = _2020;
    float _2050 = _309 * _2036;
    float _2052 = _299 * _2036;
    float _2054 = _317 * _2036;
    float _2056 = _2040 * _1762;
    float _2058 = fma(_281, _2018, _2050);
    float _2060 = fma(_277, _2018, _2052);
    float _2062 = fma(_285, _2018, _2054);
    float _2064 = _2048 * _1762;
    float _2066 = _2056 * _309;
    float _2068 = _2056 * _299;
    float _2070 = _2056 * _317;
    float _2072 = _2024 * _1762;
    float _2074 = fma(_2064, _281, _2066);
    float _2076 = _1960;
    if (_1265)
    {
        float _2078 = _1307 * 6.283185482025146484375;
        float _2080 = cos(_2078);
        _2076 = _2080;
    }
    float _2082 = _2076;
    float _2084 = fma(_2064, _285, _2070);
    float _2086 = -_2044;
    float _2088 = fma(_327, _2086, _2058);
    float _2090 = -_2072;
    float _2092 = fma(_2090, _327, _2074);
    float _2094 = -_2044;
    float _2096 = fma(_331, _2094, _2062);
    float _2098 = -_2072;
    float _2100 = fma(_2098, _331, _2084);
    float _2102 = _2088 * _1143;
    float _2104 = fma(_2064, _277, _2068);
    float _2106 = _2088 * _1161;
    float _2108 = in.m_64.w;
    float _2110 = fma(_2096, _1161, _2102);
    float _2112 = -_2072;
    float _2114 = fma(_2112, _323, _2104);
    float _2116 = -_2106;
    float _2118 = fma(_2096, _1143, _2116);
    float _2120 = abs(_1431);
    float _2122 = log2(_2120);
    float _2124 = _1225 * _2110;
    if (_1265)
    {
        float _2126 = _2082 + (-1.0);
        _301 = _2126;
    }
    float _2128 = _301;
    out.m_86.x = _2092;
    out.m_86.y = _2114;
    out.m_86.z = _2100;
    if (_1265)
    {
        float _2130 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _319 = _2130;
    }
    float _2132 = _319;
    float _2134 = _1213 * _2110;
    float _2136 = -_2044;
    float _2138 = fma(_323, _2136, _2060);
    float _2140 = fma(_1213, _2118, _2124);
    if (_1265)
    {
        float _2142 = fma(_1341, _2082, _2132);
        _1343 = _2142;
    }
    float _2144 = _1343;
    float _2146 = -_2134;
    float _2148 = fma(_1225, _2118, _2146);
    float _2150 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _2152 = _1431 <= 8000.0;
    bool _2154 = isnan(_1431);
    bool _2156 = _2152 || _2154;
    bool _2158 = isnan(8000.0);
    bool _2160 = _2156 || _2158;
    float _2162 = float(_2160);
    float _2164 = fma(_1391, 100.0, _2144);
    float _2166 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2168 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2150);
    float _2170 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2172 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2174 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2166);
    float _2176 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2178 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2180 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2172);
    float _2182 = fma(_1189, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2168);
    float _2184 = fma(_1189, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2174);
    float _2186 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2176);
    float _2188 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2190 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2192 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2194 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2186);
    float _2196 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2178);
    float _2198 = trunc(_2190);
    int _2200 = int(_2198);
    float _2202 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2180);
    float _2204 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    out.m_88.w = _2108;
    float _2206 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2188);
    float _2208 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2196);
    float _2210 = _2202 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2212 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2214 = trunc(_2192);
    int _2216 = int(_2214);
    float _2218 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2220 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2222 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2224 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2206);
    float _2226 = _2208 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2228 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2212);
    float _2230 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2222);
    float _2232 = exp2(_2170);
    float _2234 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2218);
    float _2236 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2220);
    float _2238 = _2224 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2240 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2228);
    float _2242 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2230);
    float _2244 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2234);
    float _2246 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2236);
    int _2248 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2250 = _2200 + _2248;
    int _2252 = _2250 + 1;
    float _2254 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2240);
    int _2256 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2258 = _2216 + _2256;
    int _2260 = _2258 + 1;
    float _2262 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2242);
    float _2264 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2244);
    float _2266 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2246);
    bool _2268 = _2252 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2272 = _2164 + _2270;
    int _2274 = _2252 | _2260;
    float _2276 = fma(_2232, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2278 = precise::clamp(_2276, 0.0, 1.0);
    float _2280 = _2272 * _2272;
    bool _2282 = _2274 < 0;
    bool _2284 = _2282 || _2268;
    out.gl_Position.x = _2264;
    out.gl_Position.y = _2254;
    out.gl_Position.z = _2262;
    out.gl_Position.w = _2266;
    float _2286 = fma(_2278, -2.0, 3.0);
    float _2288 = _2278 * _2278;
    bool _2290 = _2260 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2292 = _2290 || _2284;
    float _2294 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2296 = _1373 + _2294;
    float _2298 = _2288 * _2286;
    float _2300 = fma(_2296, _2296, _2280);
    float _2302 = -_2298;
    float _2304 = _2302 + 1.0;
    float _2306 = fma(_2304, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2298);
    float _2308 = _2264;
    float _2310 = _2254;
    float _2312 = _2266;
    float _2314 = _2192;
    if (_2292)
    {
        _2308 = 1.0;
    }
    float _2316 = _2308;
    float _2318 = _2162 * _2306;
    float _2320 = _2316;
    float _2322 = _2318;
    if (!_2292)
    {
        int _2324 = _2260 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2326 = _2324 + _2252;
        float _2328 = floor(_2192);
        int _2330 = _2326 << 2;
        uint _2332 = uint(int(uint(_2326) >> uint(2)));
        int _2334 = 12 & _2330;
        int _2336 = int(_2332) << 4;
        int _2338 = _2336 + _2334;
        float _2340 = floor(_2190);
        float _2342 = -_2328;
        float _2344 = _2192 + _2342;
        int _2346 = _2338 + 400;
        uint _2348 = uint(int(uint(_2346) >> uint(2)));
        uint _2350 = uint(int(uint(int(_2348)) >> uint(2)));
        int _2352 = int(_2348) & 3;
        float _2354 = (*spvDescriptorSet0.vp_c15)._m0[int(_2350)][_2352];
        float _2356 = -_2340;
        float _2358 = _2190 + _2356;
        float _2360 = rint(_2354);
        float _2362 = precise::max(_2360, 0.0);
        uint _2364 = uint(_2362);
        uint _2366 = clamp(_2364, 0u, 65535u);
        float3 _6460 = float3(_2358, _2344, float(int(_2366)));
        float3 _6462 = select(_6460, float3(0.0), isnan(_6460));
        float _2368 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6462.xy, uint(rint(_6462.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6462.xy, uint(rint(_6462.z)), level(0.0)).x;
        int _2370 = _2326 << 4;
        int _2372 = _2370 + 2048;
        uint _2374 = uint(int(uint(_2372) >> uint(2)));
        uint _2376 = uint(int(uint(int(_2374)) >> uint(2)));
        int _2378 = int(_2374) & 3;
        float _2380 = (*spvDescriptorSet0.vp_c15)._m0[int(_2376)][_2378];
        int _2382 = int(_2374) + 1;
        uint _2384 = uint(int(uint(_2382) >> uint(2)));
        int _2386 = _2382 & 3;
        float _2388 = (*spvDescriptorSet0.vp_c15)._m0[int(_2384)][_2386];
        int _2390 = _2372 + 8;
        uint _2392 = uint(int(uint(_2390) >> uint(2)));
        uint _2394 = uint(int(uint(int(_2392)) >> uint(2)));
        int _2396 = int(_2392) & 3;
        float _2398 = (*spvDescriptorSet0.vp_c15)._m0[int(_2394)][_2396];
        int _2400 = int(_2392) + 1;
        uint _2402 = uint(int(uint(_2400) >> uint(2)));
        int _2404 = _2400 & 3;
        float _2406 = (*spvDescriptorSet0.vp_c15)._m0[int(_2402)][_2404];
        float _2408 = _1405 * _2388;
        float _2410 = fma(_1191, _2380, _2408);
        float _2412 = fma(_1189, _2398, _2410);
        float _2414 = _2412 + _2406;
        float _2416 = precise::clamp(_2414, 0.0, 1.0);
        float _2418 = -_2416;
        float _2420 = _2418 + _2368;
        float _2422 = fma(_2420, 500.0, 1.5);
        float _2424 = exp2(_2422);
        float _2426 = 0.0 + _2424;
        float _2428 = precise::clamp(_2426, 0.0, 1.0);
        _2310 = _2354;
        _2320 = _2428;
        _2312 = _2368;
    }
    float _2430 = _2310;
    float _2432 = _2320;
    float _2434 = _2312;
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2438 = _1377 + _2436;
    float _2440 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2442 = -_1684;
    float _2444 = _2442 + 1.0;
    float _2446 = _2430;
    float _2448 = _2434;
    if (!_1646)
    {
        _2446 = 1.0;
    }
    float _2450 = _2446;
    float _2452 = fma(_2438, _2438, _2300);
    float _2454 = _2450;
    if (_1646)
    {
        bool _2456 = _1690 >= _1682;
        bool _2458 = isnan(_1690);
        bool _2460 = _2456 || _2458;
        bool _2462 = isnan(_1682);
        bool _2464 = _2460 || _2462;
        float _2466 = float(_2464);
        _2454 = _2466;
    }
    float _2468 = _2454;
    float _2470 = _2444 * _2440;
    float _2472 = precise::clamp(_2470, 0.0, 1.0);
    out.m_90.x = _2140;
    out.m_90.y = _2138;
    out.m_90.z = _2148;
    float _2474 = _2468 * _2432;
    float _2476 = sqrt(_2452);
    float _2478 = -_2472;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_92.x = _1373;
    out.m_92.y = _2164;
    out.m_92.z = _1377;
    float _2482 = -_2474;
    float _2484 = fma(_2482, _2480, 1.0);
    float _2486 = precise::clamp(_2484, 0.0, 1.0);
    float _2488 = _2486 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _2488;
    bool _2490 = _2476 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2492 = isnan(_2476);
    bool _2494 = _2490 || _2492;
    bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2498 = _2494 || _2496;
    float _2500 = _2472;
    float _2502 = _2480;
    float _2504 = _2486;
    if (!_2498)
    {
        _2322 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2506 = _2322;
    float _2508 = _2506;
    float _2510 = _2506;
    if (!_2498)
    {
        _2314 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2512 = _2314;
    float _2514 = _2512;
    float _2516 = _2512;
    if (!_2498)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2518 = _2448;
    float _2520 = _2518;
    float _2522 = _2518;
    if (!_2498)
    {
        _2500 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2524 = _2500;
    float _2526 = _2524;
    float _2528 = _2524;
    if (!_2498)
    {
        _2502 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2530 = _2502;
    float _2532 = _2530;
    float _2534 = _2530;
    if (!_2498)
    {
        _2504 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2536 = _2504;
    bool _2538 = !_2498;
    float _2540 = _2536;
    float _2542 = _2536;
    if (!_2538)
    {
        bool _2544 = _2476 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2546 = isnan(_2476);
        bool _2548 = _2544 || _2546;
        bool _2550 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2552 = _2548 || _2550;
        if (!_2552)
        {
            float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2556 = _2476 + _2554;
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2560 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2558;
            float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2566 = 1.0 / _2560;
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2584 = _2556 * _2566;
            float _2586 = precise::clamp(_2584, 0.0, 1.0);
            float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2592 = fma(_2586, _2564, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2594 = fma(_2586, _2590, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2596 = fma(_2586, _2570, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2598 = fma(_2586, _2574, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2600 = fma(_2586, _2578, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2602 = fma(_2586, _2582, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2516 = _2592;
            _2534 = _2600;
            _2510 = _2596;
            _2528 = _2598;
            _2522 = _2594;
            _2542 = _2602;
            _2604 = true;
        }
        else
        {
            bool _2606 = _2476 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2608 = isnan(_2476);
            bool _2610 = _2606 || _2608;
            bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2614 = _2610 || _2612;
            if (!_2614)
            {
                _2508 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2616 = _2508;
            _2510 = _2616;
            if (!_2614)
            {
                _2514 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2618 = _2514;
            _2516 = _2618;
            if (!_2614)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2620 = _2520;
            _2522 = _2620;
            if (!_2614)
            {
                _2526 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2622 = _2526;
            _2528 = _2622;
            if (!_2614)
            {
                _2532 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2624 = _2532;
            _2534 = _2624;
            if (!_2614)
            {
                _2540 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2626 = _2540;
            bool _2628 = !_2614;
            _2542 = _2626;
            if (!_2628)
            {
                bool _2630 = _2476 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2632 = isnan(_2476);
                bool _2634 = _2630 || _2632;
                bool _2636 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2638 = _2634 || _2636;
                if (!_2638)
                {
                    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2642 = _2476 + _2640;
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2646 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2644;
                    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2650 = _2648 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2652 = 1.0 / _2646;
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2670 = _2642 * _2652;
                    float _2672 = precise::clamp(_2670, 0.0, 1.0);
                    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2678 = fma(_2672, _2650, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2680 = fma(_2672, _2676, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2682 = fma(_2672, _2656, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2684 = fma(_2672, _2660, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2686 = fma(_2672, _2664, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2688 = fma(_2672, _2668, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2516 = _2678;
                    _2534 = _2686;
                    _2510 = _2682;
                    _2528 = _2684;
                    _2522 = _2680;
                    _2542 = _2688;
                    _2604 = true;
                }
                else
                {
                    _2516 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2534 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2510 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2528 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2542 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2604 = false;
    float _2690 = _2516;
    float _2692 = _2534;
    float _2694 = _2510;
    float _2696 = _2528;
    float _2698 = _2522;
    float _2700 = _2542;
    float _2702 = fma(_2138, -0.5, 0.5);
    float _2704 = precise::clamp(_2702, 0.0, 1.0);
    float _2706 = -_2690;
    float _2708 = _2706 + _2692;
    float _2710 = -_2694;
    float _2712 = _2710 + _2696;
    float _2714 = -_2698;
    float _2716 = _2714 + _2700;
    bool _2718 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2720 = fma(_2704, _2708, _2690);
    float _2722 = fma(_2704, _2712, _2694);
    float _2724 = fma(_2704, _2716, _2698);
    float _2726 = _2720 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _2728 = fma(_2722, 0.298911988735198974609375, _2726);
    float _2730 = fma(_2724, 0.114477999508380889892578125, _2728);
    out.m_96.x = 0.0;
    float _2732 = -_2730;
    float _2734 = _2722 + _2732;
    float _2736 = -_2730;
    float _2738 = _2720 + _2736;
    float _2740 = -_2730;
    float _2742 = _2724 + _2740;
    float _2744 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2746 = fma(_2734, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2730);
    float _2748 = fma(_2738, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2730);
    float _2750 = fma(_2742, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2730);
    out.m_94.w = _2744;
    out.m_98.x = _2746;
    out.m_98.y = _2748;
    out.m_98.z = _2750;
    if (!_2718)
    {
        return out;
    }
    float _2752 = -_2164;
    float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2756 = -_1373;
    float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2760 = -_1377;
    float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2764 = _2754 * _2754;
    float _2766 = fma(_2758, _2758, _2764);
    float _2768 = fma(_2762, _2762, _2766);
    float _2770 = sqrt(_2768);
    float _2772 = rsqrt(_2768);
    float _2774 = -_2770;
    float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2778 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2780 = precise::clamp(_2778, 0.0, 1.0);
    float _2782 = _2758 * _2772;
    float _2784 = _2754 * _2772;
    float _2786 = abs(_2780);
    float _2788 = log2(_2786);
    float _2790 = _2762 * _2772;
    float _2792 = _2782 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2794 = _2138 * _2784;
    float _2796 = -_2784;
    float _2798 = -_2792;
    float _2800 = fma(_2796, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2798);
    float _2802 = fma(_2140, _2782, _2794);
    float _2804 = -_2790;
    float _2806 = fma(_2804, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2800);
    float _2808 = fma(_2148, _2790, _2802);
    float _2810 = precise::clamp(_2808, 0.0, 1.0);
    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2814 = _2806 + _2812;
    float _2816 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2818 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2820 = precise::clamp(_2818, 0.0, 1.0);
    float _2822 = exp2(_2816);
    float _2824 = _2822 * _2820;
    float _2826 = _2810 * _2824;
    float _2828 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2830 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2832 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _2828;
    out.m_96.y = _2830;
    out.m_96.z = _2832;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2604 = false;
    bool _353 = false;
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
    float _125 = as_type<float>(_117);
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _123;
    if (!_121)
    {
        out.m_52.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2889 = as_type<float>(_133);
        out.gl_Position.z = _2889;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_54.w;
    float _137 = float(_117);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    float _159 = _141;
    if (_157)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _125;
    if (_157)
    {
        out.m_52.x = 0.0;
    }
    int _163 = 0;
    if (_157)
    {
        float _165 = _161 * 5.0;
        _163 = as_type<int>(_165);
    }
    int _167 = _163;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2953 = as_type<float>(_167);
        out.gl_Position.z = _2953;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = in.m_56.x;
    float _171 = in.m_56.y;
    float _173 = in.m_56.z;
    float _175 = 1.0 / _137;
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    float _183 = in.m_60.x;
    float _185 = in.m_60.y;
    float _187 = in.m_60.z;
    float _189 = _141 * _175;
    float _191 = _169 * _169;
    float _193 = _171 * _171;
    float _195 = fma(_177, _177, _191);
    float _197 = fma(_179, _179, _193);
    float _199 = fma(_183, _183, _195);
    float _201 = _173 * _173;
    float _203 = fma(_185, _185, _197);
    float _205 = sqrt(_199);
    float _207 = fma(_181, _181, _201);
    float _209 = fma(_187, _187, _207);
    float _211 = sqrt(_203);
    float _213 = sqrt(_209);
    bool _215 = _205 > 0.0;
    bool _217 = _211 > 0.0;
    float _219 = 0.0;
    float _221 = _205;
    float _223 = _211;
    float _225 = _199;
    float _227 = _209;
    float _229 = _203;
    if (_215)
    {
        float _231 = rsqrt(_199);
        _219 = _231;
    }
    float _233 = _219;
    if (!_215)
    {
        _221 = 0.0;
    }
    float _235 = _221;
    bool _237 = _213 > 0.0;
    float _239 = _213;
    float _241 = _235;
    bool _243 = _237;
    float _245 = 0.0;
    if (!_215)
    {
        _223 = 0.0;
    }
    float _247 = _223;
    float _249 = 0.0;
    float _251 = _247;
    if (_217)
    {
        float _253 = rsqrt(_203);
        _249 = _253;
    }
    float _255 = _249;
    if (!_217)
    {
        _239 = 0.0;
    }
    float _257 = _239;
    float _259 = 0.0;
    float _261 = _257;
    if (!_217)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (_237)
    {
        float _269 = rsqrt(_209);
        _265 = _269;
    }
    float _271 = _265;
    float _273 = _233;
    if (_215)
    {
        float _275 = _233 * _169;
        _241 = _275;
    }
    float _277 = _241;
    if (_215)
    {
        float _279 = _233 * _177;
        _245 = _279;
    }
    float _281 = _245;
    if (_215)
    {
        float _283 = _233 * _183;
        _251 = _283;
    }
    float _285 = _251;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_217)
    {
        _273 = 0.0;
    }
    float _289 = _273;
    float _291 = _289;
    if (!_237)
    {
        _225 = 0.0;
    }
    float _293 = _225;
    float _295 = _293;
    if (_217)
    {
        float _297 = _255 * _171;
        _261 = _297;
    }
    float _299 = _261;
    float _301 = _299;
    if (!_237)
    {
        _227 = 0.0;
    }
    float _303 = _227;
    float _305 = _303;
    if (_217)
    {
        float _307 = _255 * _179;
        _267 = _307;
    }
    float _309 = _267;
    if (!_237)
    {
        _229 = 0.0;
    }
    float _311 = _229;
    float _313 = _311;
    if (_217)
    {
        float _315 = _255 * _185;
        _291 = _315;
    }
    float _317 = _291;
    float _319 = _317;
    if (_237)
    {
        float _321 = _271 * _173;
        _295 = _321;
    }
    float _323 = _295;
    if (_237)
    {
        float _325 = _271 * _181;
        _305 = _325;
    }
    float _327 = _305;
    if (_237)
    {
        float _329 = _271 * _187;
        _313 = _329;
    }
    float _331 = _313;
    bool _333 = !_287;
    float _351;
    if (!_333)
    {
        float _335 = in.m_62.x;
        float _337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _339 = _335 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _341 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _343 = _341 * _337;
        float _345 = floor(_343);
        float _347 = -_345;
        float _349 = _343 + _347;
        _351 = _349;
        _353 = true;
    }
    else
    {
        _351 = _189;
    }
    _353 = false;
    float _355 = _351;
    float _357 = in.m_64.x;
    float _359 = in.m_64.y;
    float _361 = _141 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _363 = in.m_62.x;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _373 = in.m_49.x;
    float _375 = in.m_49.y;
    float _377 = in.m_49.z;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _381 = _355 + _379;
    float _383 = 1.0 / _367;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _391 = _355 + _389;
    float _393 = 1.0 / _371;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _403;
    float _407 = -_359;
    float _409 = _407 + 1.0;
    float _411 = abs(_357);
    float _413 = log2(_411);
    float _415 = _381 * _383;
    float _417 = fma(_363, 6.283185482025146484375, _361);
    float _419 = _179 * _375;
    float _421 = 1.0 / _387;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _423;
    float _427 = fma(_177, _373, _419);
    float _429 = _391 * _393;
    float _431 = fma(_425, _415, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _433 = _413 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _417);
    float _437 = _185 * _375;
    float _439 = exp2(_433);
    float _441 = _435 * 0.60000002384185791015625;
    float _443 = fma(_183, _373, _437);
    float _445 = _435 + 0.52359879016876220703125;
    float _447 = _441 * 0.15915493667125701904296875;
    float _449 = _435 * 0.15915493667125701904296875;
    float _451 = in.m_62.y;
    float _453 = _445 * 0.15915493667125701904296875;
    float _455 = fma(_435, 0.60000002384185791015625, 0.31415927410125732421875);
    float _457 = _435 * 1.2999999523162841796875;
    float _459 = fma(_435, 1.2999999523162841796875, 0.680678427219390869140625);
    float _461 = _455 * 0.15915493667125701904296875;
    float _463 = _449 * 6.283185482025146484375;
    float _465 = sin(_463);
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _469 = _459 * 0.15915493667125701904296875;
    float _471 = _457 * 0.15915493667125701904296875;
    float _473 = fma(_467, _439, _361);
    float _475 = in.m_66.x;
    float _477 = in.m_66.y;
    float _479 = in.m_66.z;
    float _481 = _471 * 6.283185482025146484375;
    float _483 = sin(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _485;
    float _489 = fma(_363, 6.283185482025146484375, _473);
    float _491 = fma(_357, 0.261799395084381103515625, -0.261799395084381103515625);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = fma(_487, _415, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _499 = -_357;
    float _501 = _499 + 1.0;
    float _503 = _447 * 6.283185482025146484375;
    float _505 = sin(_503);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _513 = _355 + _511;
    float _515 = _451 * 628.31854248046875;
    float _517 = fma(_495, _429, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _519 = fma(_509, _363, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _521 = _513 * _421;
    float _523 = _453 * 6.283185482025146484375;
    float _525 = sin(_523);
    float _527 = fma(_141, _519, _515);
    float _529 = fma(_401, _521, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _531 = _527 * 0.89999997615814208984375;
    float _533 = _527 * 0.15915493667125701904296875;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _535;
    float _539 = _461 * 6.283185482025146484375;
    float _541 = sin(_539);
    float _543 = _531 * 0.15915493667125701904296875;
    float _545 = _527 + _491;
    bool _547 = _475 > 0.0;
    float _549 = fma(_537, _415, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _555 = _545 * 0.15915493667125701904296875;
    bool _557 = _475 >= 0.0;
    bool _559 = isnan(_475);
    bool _561 = _557 || _559;
    bool _563 = isnan(0.0);
    bool _565 = _561 || _563;
    float _567 = fma(_505, 0.60000002384185791015625, _465);
    float _569 = fma(_553, _429, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _571 = _469 * 6.283185482025146484375;
    float _573 = sin(_571);
    int _575 = _565 ? 0 : 1;
    float _577 = fma(_483, 0.300000011920928955078125, _567);
    bool _579 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _581 = isnan(_355);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = _545 * 1.10000002384185791015625;
    int _593 = ~_575;
    int _595 = _593 + 1;
    int _597 = _595 + 1;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _603 = _597;
    float _605 = _363;
    if (!_547)
    {
        int _607 = ~_575;
        int _609 = _607 + 1;
        _603 = _609;
    }
    int _611 = _603;
    float _613 = _555 * 6.283185482025146484375;
    float _615 = sin(_613);
    bool _617 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _619 = isnan(_355);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = _545 * 0.699999988079071044921875;
    float _631 = _489 * 0.15915493667125701904296875;
    float _633 = _591 * 0.15915493667125701904296875;
    float _635 = fma(_601, _429, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _637 = _545 * 0.89999997615814208984375;
    float _639 = _629 * 0.15915493667125701904296875;
    float _641 = _633 * 6.283185482025146484375;
    float _643 = cos(_641);
    float _645 = fma(_397, _521, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _647 = fma(_541, 0.60000002384185791015625, _525);
    float _649 = _489 * 0.60000002384185791015625;
    float _651 = fma(_405, _521, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _653 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _655 = isnan(_355);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _489 * 1.2999999523162841796875;
    bool _667 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _669 = isnan(_355);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = _649 * 0.15915493667125701904296875;
    float _681 = -_589;
    float _683 = _681 + 1.0;
    float _685 = -_663;
    float _687 = _685 + 1.0;
    float _689 = _665 * 0.15915493667125701904296875;
    float _691 = _577 * _501;
    float _693 = _677 * _683;
    float _695 = -_677;
    float _697 = _695 + 1.0;
    float _699 = fma(_573, 0.300000011920928955078125, _647);
    float _701 = _637 * 0.15915493667125701904296875;
    float _703 = _589 * _687;
    float _705 = _627 * _697;
    float _707 = _631 * 6.283185482025146484375;
    float _709 = sin(_707);
    float _711 = _691 * 0.52359879016876220703125;
    float _713 = -_627;
    float _715 = _713 + 1.0;
    float _717 = _497 * _705;
    float _719 = _431 * _705;
    float _721 = in.m_68.y;
    float _723 = _549 * _705;
    float _725 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[143].x, _717);
    float _727 = _679 * 6.283185482025146484375;
    float _729 = sin(_727);
    float _731 = abs(_699);
    float _733 = _409 * _731;
    float _735 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[143].y, _719);
    float _737 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[143].z, _723);
    float _739 = fma(_517, _693, _725);
    float _741 = _733 * (-45.0);
    float _743 = float(_611);
    float _745 = fma(_635, _693, _737);
    float _747 = _701 * 6.283185482025146484375;
    float _749 = sin(_747);
    float _751 = _711 * 0.15915493667125701904296875;
    float _753 = fma(_529, _703, _739);
    float _755 = _733 * (-20.0);
    float _757 = fma(_569, _693, _735);
    float _759 = fma(_651, _703, _745);
    float _761 = _741 * 0.01745329238474369049072265625;
    float _763 = _689 * 6.283185482025146484375;
    float _765 = sin(_763);
    float _767 = fma(_729, 0.60000002384185791015625, _709);
    float _769 = fma(_645, _703, _757);
    float _771 = _743 * _755;
    float _773 = _761 * 0.15915493667125701904296875;
    float _775 = _477 + (-0.0199999995529651641845703125);
    float _777 = _771 * 0.01745329238474369049072265625;
    float _779 = _639 * 6.283185482025146484375;
    float _781 = cos(_779);
    float _783 = _749 * 0.89999997615814208984375;
    float _785 = fma(_721, 0.5, 0.5);
    float _787 = _777 * 0.15915493667125701904296875;
    float _789 = -_783;
    float _791 = fma(_615, -1.2000000476837158203125, _789);
    float _793 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[146].x, _753);
    float _795 = _751 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = fma(_765, 0.300000011920928955078125, _767);
    float _801 = abs(_791);
    bool _803 = _801 > 0.001000000047497451305389404296875;
    bool _805 = isnan(_801);
    bool _807 = _803 || _805;
    bool _809 = isnan(0.001000000047497451305389404296875);
    bool _811 = _807 || _809;
    float _813 = in.m_70.x;
    float _815 = in.m_70.y;
    float _817 = in.m_70.z;
    float _819 = _785 * _799;
    float _821 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[146].y, _769);
    float _823 = _811 ? _791 : 0.001000000047497451305389404296875;
    float _825 = _751 * 6.283185482025146484375;
    float _827 = cos(_825);
    float _829 = _781 * 0.699999988079071044921875;
    float _831 = _819 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _833 = abs(_823);
    bool _835 = _833 == 0.0;
    float _837 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[146].z, _759);
    float _839 = fma(_643, 1.10000002384185791015625, _829);
    float _841 = _831 * 0.01745329238474369049072265625;
    float _843 = _773 * 6.283185482025146484375;
    float _845 = sin(_843);
    float _847 = _797 * _475;
    float _849 = abs(_839);
    bool _851 = _849 != 0.0;
    bool _853 = isnan(_849);
    bool _855 = _851 || _853;
    bool _857 = isnan(0.0);
    bool _859 = _855 || _857;
    float _861 = _841 * 0.15915493667125701904296875;
    float _863 = abs(_823);
    bool _865 = _863 == 0.0;
    bool _867 = !_859;
    bool _869 = _865 && _867;
    float _871 = _773 * 6.283185482025146484375;
    float _873 = cos(_871);
    float _875 = -_847;
    float _877 = fma(_827, _479, _875);
    float _879 = _827 * _475;
    float _881 = _793 * _813;
    float _883 = _821 * _815;
    float _885 = _877 + 0.02999999932944774627685546875;
    float _887 = fma(_797, _479, _879);
    float _889 = _837 * _817;
    float _891 = _787 * 6.283185482025146484375;
    float _893 = sin(_891);
    float _895 = _845 * _885;
    float _897 = fma(_743, -0.100000001490116119384765625, _887);
    if (_869)
    {
        bool _899 = as_type<int>(_823) >= 0;
        _243 = _899;
    }
    bool _901 = _243;
    float _903 = _527 * 0.699999988079071044921875;
    float _905 = _787 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = -_895;
    float _911 = fma(_873, _775, _909);
    float _913 = _873 * _885;
    float _915 = _533 * 6.283185482025146484375;
    float _917 = cos(_915);
    float _919 = _911 * _893;
    float _921 = _543 * 6.283185482025146484375;
    float _923 = cos(_921);
    float _925 = _911 * _907;
    int _927 = as_type<int>(_911);
    int _929 = _901 ? (-1) : 0;
    if (_869)
    {
        int _931 = _901 ? 0 : 1078530011;
        _927 = _931;
    }
    int _933 = _927;
    float _935 = -_919;
    float _937 = fma(_907, _897, _935);
    float _939 = fma(_893, _897, _925);
    int _941 = _933;
    if (_869)
    {
        int _943 = int(0x80000000) & as_type<int>(_839);
        int _945 = _933 | _943;
        _941 = _945;
    }
    int _947 = _941;
    float _949 = _861 * 6.283185482025146484375;
    float _951 = sin(_949);
    float _953 = _861 * 6.283185482025146484375;
    float _955 = cos(_953);
    bool _957 = !_859;
    bool _959 = _957 && _835;
    int _961 = _947;
    float _963 = as_type<float>(_947);
    if (!_959)
    {
        float _965 = abs(_839);
        bool _967 = _965 != as_type<float>(0x7f800000u /* inf */);
        bool _969 = isnan(_965);
        bool _971 = _967 || _969;
        bool _973 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _975 = _971 || _973;
        float _977 = abs(_823);
        bool _979 = _977 == as_type<float>(0x7f800000u /* inf */);
        float _981 = abs(_823);
        bool _983 = _981 == as_type<float>(0x7f800000u /* inf */);
        bool _985 = !_975;
        bool _987 = _983 && _985;
        if (_987)
        {
            bool _989 = as_type<int>(_823) >= 0;
            _929 = _989 ? (-1) : 0;
        }
        int _991 = _929;
        if (_987)
        {
            _961 = 1075235812;
        }
        int _993 = _961;
        int _995 = _993;
        if (_987)
        {
            int _997 = ~_991;
            int _999 = (_997 != 0) ? _993 : 1061752795;
            _995 = _999;
        }
        int _1001 = _995;
        float _1003 = as_type<float>(_1001);
        if (_987)
        {
            int _1005 = int(0x80000000) & as_type<int>(_839);
            int _1007 = _1001 | _1005;
            _1003 = as_type<float>(_1007);
        }
        float _1009 = _1003;
        bool _1011 = !_975;
        bool _1013 = _1011 && _979;
        _963 = _1009;
        if (!_1013)
        {
            float _1015 = abs(_839);
            float _1017 = abs(_823);
            float _1019 = precise::max(_1015, _1017);
            float _1021 = abs(_839);
            float _1023 = abs(_823);
            float _1025 = precise::min(_1021, _1023);
            float _1027 = 1.0 / _1019;
            float _1029 = abs(_839);
            float _1031 = abs(_823);
            bool _1033 = _1029 > _1031;
            bool _1035 = as_type<int>(_823) >= 0;
            float _1037 = _1025 * _1027;
            float _1039 = _1037 * _1037;
            float _1041 = _1039 + 11.33538818359375;
            float _1043 = fma(_1039, _1041, 28.84246826171875);
            float _1045 = fma(_1039, _1043, 19.6966705322265625);
            float _1047 = fma(_1039, -0.82336294651031494140625, -5.674867153167724609375);
            float _1049 = fma(_1039, _1047, -6.565555095672607421875);
            float _1051 = 1.0 / _1045;
            float _1053 = _1039 * _1049;
            float _1055 = abs(_839);
            float _1057 = abs(_823);
            float _1059 = _1055 + _1057;
            int _1061 = as_type<int>(_839) & int(0x80000000);
            float _1063 = _1037 * _1053;
            bool _1065 = _1059 > as_type<float>(0x7f800000u /* inf */);
            bool _1067 = isnan(_1059);
            bool _1069 = _1065 || _1067;
            bool _1071 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1073 = _1069 || _1071;
            float _1075 = fma(_1063, _1051, _1037);
            float _1077 = _1075;
            _963 = _1059;
            if (_1033)
            {
                float _1079 = -_1075;
                float _1081 = _1079 + 1.57079637050628662109375;
                _1077 = _1081;
            }
            float _1083 = _1077;
            int _1085 = as_type<int>(_1083);
            if (!_1035)
            {
                float _1087 = -_1083;
                float _1089 = _1087 + 3.1415927410125732421875;
                _1085 = as_type<int>(_1089);
            }
            int _1091 = _1085;
            if (!_1073)
            {
                int _1093 = _1061 | _1091;
                _963 = as_type<float>(_1093);
            }
        }
    }
    float _1095 = _963;
    float _1097 = _939 + 0.0199999995529651641845703125;
    float _1099 = fma(_743, 0.100000001490116119384765625, _937);
    float _1101 = in.m_62.z;
    float _1103 = fma(_845, _775, _913);
    float _1105 = _1097 * _951;
    float _1107 = _1097 * _955;
    float _1109 = _1095 + 1.57079637050628662109375;
    float _1111 = _883 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1113 = -_1105;
    float _1115 = fma(_1099, _955, _1113);
    float _1117 = fma(_1099, _951, _1107);
    float _1119 = _881 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1121 = in.m_60.w;
    float _1123 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1115);
    float _1125 = _1103 + (-0.02999999932944774627685546875);
    float _1127 = _1109 * (-0.15915493667125701904296875);
    float _1129 = in.m_58.w;
    float _1131 = _889 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1125);
    float _1135 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1117);
    float _1137 = _527 * 1.10000002384185791015625;
    float _1139 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1123);
    float _1141 = _1127 * 6.283185482025146484375;
    float _1143 = cos(_1141);
    float _1145 = _1131 * _1133;
    float _1147 = _1111 * _1135;
    float _1149 = _1119 * _1139;
    float _1151 = _903 * 0.15915493667125701904296875;
    float _1153 = _1145 * _309;
    float _1155 = _1101 * 6.283185482025146484375;
    float _1157 = _1137 * 0.15915493667125701904296875;
    float _1159 = _1127 * 6.283185482025146484375;
    float _1161 = sin(_1159);
    float _1163 = _1145 * _317;
    float _1165 = fma(_1149, _281, _1153);
    float _1167 = _1155 * 0.15915493667125701904296875;
    float _1169 = fma(_181, _377, _427);
    float _1171 = fma(_1149, _285, _1163);
    float _1173 = -_1147;
    float _1175 = fma(_1173, _327, _1165);
    float _1177 = fma(_187, _377, _443);
    float _1179 = _1151 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = -_1147;
    float _1185 = fma(_1183, _331, _1171);
    float _1187 = _1175 * _1143;
    float _1189 = _1177 + _1121;
    float _1191 = _1169 + _1129;
    float _1193 = fma(_917, 1.2000000476837158203125, _923);
    float _1195 = _189 * 3.3333332538604736328125;
    float _1197 = _1157 * 6.283185482025146484375;
    float _1199 = sin(_1197);
    float _1201 = _1175 * _1161;
    float _1203 = fma(_1185, _1161, _1187);
    float _1205 = -_1201;
    float _1207 = fma(_1185, _1143, _1205);
    float _1209 = _1191 + _1203;
    float _1211 = _1167 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = _1189 + _1207;
    float _1217 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1209);
    float _1219 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1221 = _1217 + _1219;
    float _1223 = _1167 * 6.283185482025146484375;
    float _1225 = cos(_1223);
    float _1227 = _1181 + _1199;
    float _1229 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1215);
    float _1231 = _1213 * _1221;
    float _1233 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1235 = _1229 + _1233;
    float _1237 = _1225 * _1221;
    float _1239 = -_1231;
    float _1241 = fma(_1225, _1235, _1239);
    float _1243 = fma(_1213, _1235, _1237);
    float _1245 = _1241 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1247 = in.m_72.y;
    float _1249 = _1243 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1253 = _1245 + _1251;
    float _1255 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1257 = _1249 + _1255;
    float _1259 = _1253 * _1253;
    float _1261 = fma(_1257, _1257, _1259);
    float _1263 = sqrt(_1261);
    bool _1265 = _1263 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1269 = _1263 + _1267;
    float _1271 = 0.0 + _1195;
    float _1273 = precise::clamp(_1271, 0.0, 1.0);
    float _1275 = -_1195;
    float _1277 = _1275 + 3.3333332538604736328125;
    float _1279 = precise::clamp(_1277, 0.0, 1.0);
    float _1281 = precise::min(_1273, _1279);
    float _1283 = _759;
    float _1285 = _1103;
    if (_1265)
    {
        float _1287 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1287;
    }
    float _1289 = _1283;
    float _1291 = _1289;
    if (_1265)
    {
        float _1293 = _1269 * _1289;
        _1291 = _1293;
    }
    float _1295 = _1291;
    float _1297 = _1145 * _299;
    float _1299 = _375 + _1247;
    float _1301 = _1295;
    float _1303 = _1247;
    if (_1265)
    {
        float _1305 = _1295 * 0.15915493667125701904296875;
        _1301 = _1305;
    }
    float _1307 = _1301;
    float _1309 = fma(_1149, _277, _1297);
    if (_1265)
    {
        float _1311 = rsqrt(_1261);
        _1303 = _1311;
    }
    float _1313 = _1303;
    float _1315 = -_1147;
    float _1317 = fma(_1315, _323, _1309);
    float _1319 = fma(_1281, -5.0, 5.0);
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1323 = _1321 + 1.0;
    float _1325 = _1299 + _1317;
    float _1327 = _1203;
    float _1329 = _1319;
    float _1331 = _1323;
    if (_1265)
    {
        float _1333 = _1307 * 6.283185482025146484375;
        float _1335 = sin(_1333);
        _1327 = _1335;
    }
    float _1337 = _1327;
    float _1339 = -_1319;
    float _1341 = fma(_1339, _1323, _1325);
    float _1343 = _1341;
    if (!_1265)
    {
        _1329 = _1249;
    }
    float _1345 = _1329;
    float _1347 = _1345;
    if (_1265)
    {
        float _1349 = _1341 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1331 = _1349;
    }
    float _1351 = _1331;
    float _1353 = _1351;
    float _1355 = _1337;
    if (_1265)
    {
        float _1357 = fma(_1337, _1351, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1353 = _1357;
    }
    float _1359 = _1353;
    float _1361 = _1359;
    if (!_1265)
    {
        _1355 = _1245;
    }
    float _1363 = _1355;
    float _1365 = _1363;
    if (_1265)
    {
        float _1367 = _1313 * _1359;
        _1361 = _1367;
    }
    float _1369 = _1361;
    if (_1265)
    {
        float _1371 = fma(_1257, _1369, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1347 = _1371;
    }
    float _1373 = _1347;
    if (_1265)
    {
        float _1375 = fma(_1253, _1369, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1365 = _1375;
    }
    float _1377 = _1365;
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1381 = _1373 + _1379;
    float _1383 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1385 = _1377 + _1383;
    float _1387 = fma(_1381, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1389 = fma(_1385, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4717 = float2(_1387, _1389);
    float _1391 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4717, float2(0.0), isnan(_4717)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4717, float2(0.0), isnan(_4717)), level(0.0)).x;
    float _1393 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1395 = fma(_1391, 100.0, _1299);
    float _1397 = _1395 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1399 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1397);
    float _1401 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1399);
    float _1403 = _1395 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1405 = _1395 + _1393;
    float _1407 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1409 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1403);
    float _1411 = 1.0 / _1407;
    float _1413 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1409);
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1417 = _1415 + _1407;
    float _1419 = _1417 * _1411;
    float _1421 = _1419 * 0.5;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1425 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1423);
    float _1427 = 1.0 / _1425;
    float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1431 = _1427 * _1429;
    bool _1433 = _1431 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1435 = _1431 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1437 = !_1433;
    int _1439 = _1437 ? 0 : 1;
    int _1441 = 2;
    if (!_1433)
    {
        _1441 = 1;
    }
    int _1443 = _1441;
    int _1445 = _1443;
    if (!_1435)
    {
        _1445 = _1439;
    }
    int _1447 = _1445;
    int _1449 = _1447 << 6;
    int _1451 = _1449 + 96;
    uint _1454 = uint(int(uint(_1451) >> uint(2)));
    uint _1456 = uint(int(uint(int(_1454)) >> uint(2)));
    int _1458 = int(_1454) & 3;
    float _1460 = (*spvDescriptorSet0.vp_c15)._m0[int(_1456)][_1458];
    int _1462 = int(_1454) + 1;
    uint _1464 = uint(int(uint(_1462) >> uint(2)));
    int _1466 = _1462 & 3;
    float _1468 = (*spvDescriptorSet0.vp_c15)._m0[int(_1464)][_1466];
    int _1470 = _1449 + 104;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    uint _1474 = uint(int(uint(int(_1472)) >> uint(2)));
    int _1476 = int(_1472) & 3;
    float _1478 = (*spvDescriptorSet0.vp_c15)._m0[int(_1474)][_1476];
    int _1480 = int(_1472) + 1;
    uint _1482 = uint(int(uint(_1480) >> uint(2)));
    int _1484 = _1480 & 3;
    float _1486 = (*spvDescriptorSet0.vp_c15)._m0[int(_1482)][_1484];
    int _1488 = _1449 + 48;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    uint _1492 = uint(int(uint(int(_1490)) >> uint(2)));
    int _1494 = int(_1490) & 3;
    float _1496 = (*spvDescriptorSet0.vp_c15)._m0[int(_1492)][_1494];
    int _1498 = int(_1490) + 1;
    uint _1500 = uint(int(uint(_1498) >> uint(2)));
    int _1502 = _1498 & 3;
    float _1504 = (*spvDescriptorSet0.vp_c15)._m0[int(_1500)][_1502];
    int _1506 = _1449 + 64;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    uint _1510 = uint(int(uint(int(_1508)) >> uint(2)));
    int _1512 = int(_1508) & 3;
    float _1514 = (*spvDescriptorSet0.vp_c15)._m0[int(_1510)][_1512];
    int _1516 = int(_1508) + 1;
    uint _1518 = uint(int(uint(_1516) >> uint(2)));
    int _1520 = _1516 & 3;
    float _1522 = (*spvDescriptorSet0.vp_c15)._m0[int(_1518)][_1520];
    int _1524 = _1449 + 56;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    uint _1528 = uint(int(uint(int(_1526)) >> uint(2)));
    int _1530 = int(_1526) & 3;
    float _1532 = (*spvDescriptorSet0.vp_c15)._m0[int(_1528)][_1530];
    int _1534 = int(_1526) + 1;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    int _1538 = _1534 & 3;
    float _1540 = (*spvDescriptorSet0.vp_c15)._m0[int(_1536)][_1538];
    int _1542 = _1449 + 72;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    uint _1546 = uint(int(uint(int(_1544)) >> uint(2)));
    int _1548 = int(_1544) & 3;
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[int(_1546)][_1548];
    int _1552 = int(_1544) + 1;
    uint _1554 = uint(int(uint(_1552) >> uint(2)));
    int _1556 = _1552 & 3;
    float _1558 = (*spvDescriptorSet0.vp_c15)._m0[int(_1554)][_1556];
    float _1560 = _1405 * _1468;
    float _1562 = fma(_1191, _1460, _1560);
    float _1564 = fma(_1189, _1478, _1562);
    float _1566 = _1564 + _1486;
    int _1568 = _1449 + 80;
    uint _1570 = uint(int(uint(_1568) >> uint(2)));
    uint _1572 = uint(int(uint(int(_1570)) >> uint(2)));
    int _1574 = int(_1570) & 3;
    float _1576 = (*spvDescriptorSet0.vp_c15)._m0[int(_1572)][_1574];
    int _1578 = int(_1570) + 1;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    int _1582 = _1578 & 3;
    float _1584 = (*spvDescriptorSet0.vp_c15)._m0[int(_1580)][_1582];
    float _1586 = _1405 * _1504;
    float _1588 = 1.0 / _1566;
    float _1590 = fma(_1191, _1496, _1586);
    int _1592 = _1449 + 88;
    uint _1594 = uint(int(uint(_1592) >> uint(2)));
    uint _1596 = uint(int(uint(int(_1594)) >> uint(2)));
    int _1598 = int(_1594) & 3;
    float _1600 = (*spvDescriptorSet0.vp_c15)._m0[int(_1596)][_1598];
    int _1602 = int(_1594) + 1;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    int _1606 = _1602 & 3;
    float _1608 = (*spvDescriptorSet0.vp_c15)._m0[int(_1604)][_1606];
    float _1610 = _1405 * _1522;
    float _1612 = fma(_1191, _1514, _1610);
    float _1614 = fma(_1189, _1532, _1590);
    float _1616 = _1614 + _1540;
    float _1618 = fma(_1189, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1620 = fma(_1189, _1550, _1612);
    float _1622 = _1616 * _1588;
    float _1624 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1626 = _1620 + _1558;
    bool _1628 = _1622 >= 0.0;
    float _1630 = floor(_1618);
    float _1632 = _1626 * _1588;
    bool _1634 = _1622 <= 1.0;
    bool _1636 = _1634 && _1628;
    bool _1638 = _1632 >= 0.0;
    bool _1640 = _1638 && _1636;
    float _1642 = floor(_1624);
    bool _1644 = _1632 <= 1.0;
    bool _1646 = _1644 && _1640;
    float _1648 = _1405 * _1584;
    float _1650 = -_1630;
    float _1652 = _1618 + _1650;
    float _1654 = fma(_1191, _1576, _1648);
    float _1656 = fma(_1189, _1600, _1654);
    float _1658 = _1584;
    if (_1646)
    {
        float _1660 = float(_1447);
        _1658 = _1660;
    }
    float _1662 = _1658;
    float _1664 = -_1642;
    float _1666 = _1624 + _1664;
    float _1668 = _1656 + _1608;
    float _1670 = _1648;
    if (_1646)
    {
        float _1672 = rint(_1662);
        float _1674 = precise::max(_1672, 0.0);
        uint _1676 = uint(_1674);
        uint _1678 = clamp(_1676, 0u, 65535u);
        _1670 = as_type<float>(_1678);
    }
    float _1680 = _1670;
    float _1682 = _1668 * _1588;
    float2 _5212 = float2(_1666, _1652);
    float _1684 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5212, float2(0.0), isnan(_5212)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5212, float2(0.0), isnan(_5212)), level(0.0)).x;
    float _1686 = _1632;
    if (_1646)
    {
        float3 _5227 = float3(_1622, _1632, float(as_type<int>(_1680)));
        float3 _5231 = select(_5227, float3(0.0), isnan(_5227));
        float _1688 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5231.xy, uint(rint(_5231.z)), _1682, level(0.0));
        _1686 = _1688;
    }
    float _1690 = _1686;
    float _1692 = in.m_62.w;
    float _1694 = -_721;
    float _1696 = _1694 + 1.0;
    float _1698 = _451 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1702 = _1700 != 0;
    float _1704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1710 = _1708 != 0;
    float _1712 = in.m_68.x;
    int _1714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1716 = _1714 != 0;
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1720 = _1718 != 0;
    float _1722 = _719;
    bool _1724 = _1720;
    float _1726 = _1712;
    if (_1702)
    {
        float _1728 = in.m_62.z;
        _1722 = _1728;
    }
    float _1730 = _1722;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1738 = _1692 > 0.5;
    float _1740 = _363 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1744 = _1738 ? as_type<int>(_1696) : as_type<int>(_721);
    float _1746 = -_1706;
    float _1748 = fma(_1740, 2.0, _1746);
    int _1750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1752 = _1750 != 0;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1756 = in.m_74.x;
    float _1758 = in.m_74.y;
    float _1760 = in.m_74.z;
    float _1762 = in.m_74.w;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1766 = _1716 ? as_type<float>(_1744) : _721;
    float _1768 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1770 = _451 > 0.5;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1774 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1776 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1778 = _1770 ? as_type<int>(_1696) : as_type<int>(_721);
    float _1780 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1782 = _1770;
    if (_1702)
    {
        bool _1784 = _1730 > 0.5;
        _1782 = _1784;
    }
    bool _1786 = _1782;
    float _1788 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1790 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_76.x = _1768;
    out.m_76.y = _1774;
    out.m_76.z = _1776;
    out.m_76.w = _1772;
    float _1794 = _1720 ? as_type<float>(_1778) : _721;
    float _1796 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    out.m_78.x = _1780;
    out.m_78.y = _1788;
    out.m_78.z = _1790;
    float _1800 = fma(_1698, -2.0, _1792);
    float _1802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1804 = _317 * _1760;
    float _1806 = _1780;
    float _1808 = _1788;
    float _1810 = _1796;
    if (!_1752)
    {
        float _1812 = in.m_62.z;
        _1806 = _1812;
    }
    float _1814 = _1806;
    float _1816 = _309 * _1760;
    float _1818 = _299 * _1760;
    float _1820 = fma(_1796, _1794, -0.5);
    float _1822 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1800);
    float _1824 = fma(_281, _1756, _1816);
    float _1826 = fma(_285, _1756, _1804);
    float _1828 = fma(_277, _1756, _1818);
    float _1830 = -_1758;
    float _1832 = fma(_327, _1830, _1824);
    float _1834 = -_1758;
    float _1836 = fma(_331, _1834, _1826);
    float _1838 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1798);
    float _1840 = -_1758;
    float _1842 = fma(_323, _1840, _1828);
    float _1844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].z);
    float _1848 = _1838;
    if (!_1752)
    {
        _1808 = _451;
    }
    float _1850 = _1808;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1854 = _1850;
    if (_1752)
    {
        _1854 = _363;
    }
    float _1856 = _1854;
    out.m_80.x = _1832;
    out.m_80.y = _1842;
    out.m_80.z = _1836;
    if (_1710)
    {
        bool _1858 = _363 > 0.5;
        _1724 = _1858;
    }
    bool _1860 = _1724;
    float _1862 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1852);
    float _1864 = -_141;
    float _1866 = fma(_1864, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1748);
    float _1868 = _1814;
    if (!_1752)
    {
        _1810 = _1814;
    }
    float _1870 = _1810;
    float _1872 = _1870;
    if (_1752)
    {
        _1872 = _451;
    }
    float _1874 = _1872;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_1752)
    {
        _1868 = _451;
    }
    float _1878 = _1868;
    bool _1880 = _1117 != 0.0;
    bool _1882 = isnan(_1117);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(0.0);
    bool _1888 = _1884 || _1886;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1894 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1896 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1862);
    float _1898 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1900 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1892);
    float _1902 = fma(_1766, _1894, -0.5);
    float _1904 = -_1822;
    float _1906 = fma(_1896, _1820, _1904);
    float _1908 = -_1890;
    float _1910 = fma(_1898, 2.0, _1908);
    float _1912 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1914 = in.m_82.x;
    float _1916 = in.m_82.y;
    float _1918 = in.m_82.z;
    bool _1920 = _1123 == 0.0;
    bool _1922 = !_1888;
    bool _1924 = _1920 && _1922;
    int _1926 = as_type<int>(_1898);
    if (_1710)
    {
        float _1928 = -_1712;
        float _1930 = _1928 + 1.0;
        _1926 = as_type<int>(_1930);
    }
    int _1932 = _1926;
    if (_1702)
    {
        float _1934 = -_1712;
        float _1936 = _1934 + 1.0;
        _1846 = as_type<int>(_1936);
    }
    int _1938 = _1846;
    float _1940 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1876);
    bool _1942 = _1103 == 0.02999999932944774627685546875;
    bool _1944 = _1942 && _1924;
    float _1946 = -_141;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1910);
    if (!_1710)
    {
        _605 = _1712;
    }
    float _1950 = _605;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1954 = _1950;
    if (_1710)
    {
        float _1956 = _1860 ? as_type<float>(_1932) : _1712;
        _1954 = _1956;
    }
    float _1958 = _1954;
    float _1960 = _1906 + 0.5;
    if (_1702)
    {
        float _1962 = _1786 ? as_type<float>(_1938) : _1712;
        _1726 = _1962;
    }
    float _1964 = _1726;
    float _1966 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1968 = _1844 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1970 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1972 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1940);
    float _1974 = fma(_1966, -2.0, _1952);
    float _1976 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1900);
    float _1978 = fma(_1970, _1964, -0.5);
    float _1980 = fma(_1968, _1958, -0.5);
    float _1982 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1838);
    float _1984 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1974);
    float _1986 = fma(_1976, _1978, _1948);
    float _1988 = _1982;
    if (_1944)
    {
        _1285 = _1916;
    }
    float _1990 = _1285;
    float _1992 = fma(_1982, _1980, _1866);
    float _1994 = -_1984;
    float _1996 = fma(_1972, _1902, _1994);
    float _1998 = _1986 + 0.5;
    float _2000 = _1990;
    if (_1944)
    {
        _1848 = _1990;
    }
    float _2002 = _1848;
    float _2004 = _1992 + 0.5;
    float _2006 = _2002;
    if (!_1944)
    {
        _2000 = _1916;
    }
    float _2008 = _2000;
    float _2010 = _1760 * _1914;
    if (_1944)
    {
        _1988 = _1914;
    }
    float _2012 = _1988;
    float _2014 = _2012;
    if (!_1944)
    {
        float _2016 = fma(_1123, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1914);
        _2014 = _2016;
    }
    float _2018 = _2014;
    float _2020 = _1996 + 0.5;
    float _2022 = -_2010;
    float _2024 = fma(_1756, _1918, _2022);
    float _2026 = _1756 * _2008;
    if (_1944)
    {
        _159 = _1918;
    }
    float _2028 = _159;
    float _2030 = _1758 * _1918;
    float _2032 = _2028;
    if (!_1944)
    {
        float _2034 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1918);
        _2032 = _2034;
    }
    float _2036 = _2032;
    float _2038 = -_2026;
    float _2040 = fma(_1758, _1914, _2038);
    if (!_1944)
    {
        float _2042 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2006 = _2042;
    }
    float _2044 = _2006;
    float _2046 = -_2030;
    float _2048 = fma(_1760, _2008, _2046);
    out.m_84.x = _2004;
    out.m_84.y = _1960;
    out.m_84.z = _1998;
    out.m_84.w = _2020;
    float _2050 = _309 * _2036;
    float _2052 = _299 * _2036;
    float _2054 = _317 * _2036;
    float _2056 = _2040 * _1762;
    float _2058 = fma(_281, _2018, _2050);
    float _2060 = fma(_277, _2018, _2052);
    float _2062 = fma(_285, _2018, _2054);
    float _2064 = _2048 * _1762;
    float _2066 = _2056 * _309;
    float _2068 = _2056 * _299;
    float _2070 = _2056 * _317;
    float _2072 = _2024 * _1762;
    float _2074 = fma(_2064, _281, _2066);
    float _2076 = _1960;
    if (_1265)
    {
        float _2078 = _1307 * 6.283185482025146484375;
        float _2080 = cos(_2078);
        _2076 = _2080;
    }
    float _2082 = _2076;
    float _2084 = fma(_2064, _285, _2070);
    float _2086 = -_2044;
    float _2088 = fma(_327, _2086, _2058);
    float _2090 = -_2072;
    float _2092 = fma(_2090, _327, _2074);
    float _2094 = -_2044;
    float _2096 = fma(_331, _2094, _2062);
    float _2098 = -_2072;
    float _2100 = fma(_2098, _331, _2084);
    float _2102 = _2088 * _1143;
    float _2104 = fma(_2064, _277, _2068);
    float _2106 = _2088 * _1161;
    float _2108 = in.m_64.w;
    float _2110 = fma(_2096, _1161, _2102);
    float _2112 = -_2072;
    float _2114 = fma(_2112, _323, _2104);
    float _2116 = -_2106;
    float _2118 = fma(_2096, _1143, _2116);
    float _2120 = abs(_1431);
    float _2122 = log2(_2120);
    float _2124 = _1225 * _2110;
    if (_1265)
    {
        float _2126 = _2082 + (-1.0);
        _301 = _2126;
    }
    float _2128 = _301;
    out.m_86.x = _2092;
    out.m_86.y = _2114;
    out.m_86.z = _2100;
    if (_1265)
    {
        float _2130 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _319 = _2130;
    }
    float _2132 = _319;
    float _2134 = _1213 * _2110;
    float _2136 = -_2044;
    float _2138 = fma(_323, _2136, _2060);
    float _2140 = fma(_1213, _2118, _2124);
    if (_1265)
    {
        float _2142 = fma(_1341, _2082, _2132);
        _1343 = _2142;
    }
    float _2144 = _1343;
    float _2146 = -_2134;
    float _2148 = fma(_1225, _2118, _2146);
    float _2150 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _2152 = _1431 <= 8000.0;
    bool _2154 = isnan(_1431);
    bool _2156 = _2152 || _2154;
    bool _2158 = isnan(8000.0);
    bool _2160 = _2156 || _2158;
    float _2162 = float(_2160);
    float _2164 = fma(_1391, 100.0, _2144);
    float _2166 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2168 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2150);
    float _2170 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2172 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2174 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2166);
    float _2176 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2178 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2180 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2172);
    float _2182 = fma(_1189, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2168);
    float _2184 = fma(_1189, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2174);
    float _2186 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2176);
    float _2188 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2190 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2192 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2194 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2186);
    float _2196 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2178);
    float _2198 = trunc(_2190);
    int _2200 = int(_2198);
    float _2202 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2180);
    float _2204 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    out.m_88.w = _2108;
    float _2206 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2188);
    float _2208 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2196);
    float _2210 = _2202 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2212 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2214 = trunc(_2192);
    int _2216 = int(_2214);
    float _2218 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2220 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2222 = _2204 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2224 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2206);
    float _2226 = _2208 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2228 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2212);
    float _2230 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2222);
    float _2232 = exp2(_2170);
    float _2234 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2218);
    float _2236 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2220);
    float _2238 = _2224 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2240 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2228);
    float _2242 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2230);
    float _2244 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2234);
    float _2246 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2236);
    int _2248 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2250 = _2200 + _2248;
    int _2252 = _2250 + 1;
    float _2254 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2240);
    int _2256 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2258 = _2216 + _2256;
    int _2260 = _2258 + 1;
    float _2262 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2242);
    float _2264 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2244);
    float _2266 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2246);
    bool _2268 = _2252 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2272 = _2164 + _2270;
    int _2274 = _2252 | _2260;
    float _2276 = fma(_2232, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2278 = precise::clamp(_2276, 0.0, 1.0);
    float _2280 = _2272 * _2272;
    bool _2282 = _2274 < 0;
    bool _2284 = _2282 || _2268;
    out.gl_Position.x = _2264;
    out.gl_Position.y = _2254;
    out.gl_Position.z = _2262;
    out.gl_Position.w = _2266;
    float _2286 = fma(_2278, -2.0, 3.0);
    float _2288 = _2278 * _2278;
    bool _2290 = _2260 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2292 = _2290 || _2284;
    float _2294 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2296 = _1373 + _2294;
    float _2298 = _2288 * _2286;
    float _2300 = fma(_2296, _2296, _2280);
    float _2302 = -_2298;
    float _2304 = _2302 + 1.0;
    float _2306 = fma(_2304, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2298);
    float _2308 = _2264;
    float _2310 = _2254;
    float _2312 = _2266;
    float _2314 = _2192;
    if (_2292)
    {
        _2308 = 1.0;
    }
    float _2316 = _2308;
    float _2318 = _2162 * _2306;
    float _2320 = _2316;
    float _2322 = _2318;
    if (!_2292)
    {
        int _2324 = _2260 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2326 = _2324 + _2252;
        float _2328 = floor(_2192);
        int _2330 = _2326 << 2;
        uint _2332 = uint(int(uint(_2326) >> uint(2)));
        int _2334 = 12 & _2330;
        int _2336 = int(_2332) << 4;
        int _2338 = _2336 + _2334;
        float _2340 = floor(_2190);
        float _2342 = -_2328;
        float _2344 = _2192 + _2342;
        int _2346 = _2338 + 400;
        uint _2348 = uint(int(uint(_2346) >> uint(2)));
        uint _2350 = uint(int(uint(int(_2348)) >> uint(2)));
        int _2352 = int(_2348) & 3;
        float _2354 = (*spvDescriptorSet0.vp_c15)._m0[int(_2350)][_2352];
        float _2356 = -_2340;
        float _2358 = _2190 + _2356;
        float _2360 = rint(_2354);
        float _2362 = precise::max(_2360, 0.0);
        uint _2364 = uint(_2362);
        uint _2366 = clamp(_2364, 0u, 65535u);
        float3 _6460 = float3(_2358, _2344, float(int(_2366)));
        float3 _6462 = select(_6460, float3(0.0), isnan(_6460));
        float _2368 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6462.xy, uint(rint(_6462.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6462.xy, uint(rint(_6462.z)), level(0.0)).x;
        int _2370 = _2326 << 4;
        int _2372 = _2370 + 2048;
        uint _2374 = uint(int(uint(_2372) >> uint(2)));
        uint _2376 = uint(int(uint(int(_2374)) >> uint(2)));
        int _2378 = int(_2374) & 3;
        float _2380 = (*spvDescriptorSet0.vp_c15)._m0[int(_2376)][_2378];
        int _2382 = int(_2374) + 1;
        uint _2384 = uint(int(uint(_2382) >> uint(2)));
        int _2386 = _2382 & 3;
        float _2388 = (*spvDescriptorSet0.vp_c15)._m0[int(_2384)][_2386];
        int _2390 = _2372 + 8;
        uint _2392 = uint(int(uint(_2390) >> uint(2)));
        uint _2394 = uint(int(uint(int(_2392)) >> uint(2)));
        int _2396 = int(_2392) & 3;
        float _2398 = (*spvDescriptorSet0.vp_c15)._m0[int(_2394)][_2396];
        int _2400 = int(_2392) + 1;
        uint _2402 = uint(int(uint(_2400) >> uint(2)));
        int _2404 = _2400 & 3;
        float _2406 = (*spvDescriptorSet0.vp_c15)._m0[int(_2402)][_2404];
        float _2408 = _1405 * _2388;
        float _2410 = fma(_1191, _2380, _2408);
        float _2412 = fma(_1189, _2398, _2410);
        float _2414 = _2412 + _2406;
        float _2416 = precise::clamp(_2414, 0.0, 1.0);
        float _2418 = -_2416;
        float _2420 = _2418 + _2368;
        float _2422 = fma(_2420, 500.0, 1.5);
        float _2424 = exp2(_2422);
        float _2426 = 0.0 + _2424;
        float _2428 = precise::clamp(_2426, 0.0, 1.0);
        _2310 = _2354;
        _2320 = _2428;
        _2312 = _2368;
    }
    float _2430 = _2310;
    float _2432 = _2320;
    float _2434 = _2312;
    float _2436 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2438 = _1377 + _2436;
    float _2440 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2442 = -_1684;
    float _2444 = _2442 + 1.0;
    float _2446 = _2430;
    float _2448 = _2434;
    if (!_1646)
    {
        _2446 = 1.0;
    }
    float _2450 = _2446;
    float _2452 = fma(_2438, _2438, _2300);
    float _2454 = _2450;
    if (_1646)
    {
        bool _2456 = _1690 >= _1682;
        bool _2458 = isnan(_1690);
        bool _2460 = _2456 || _2458;
        bool _2462 = isnan(_1682);
        bool _2464 = _2460 || _2462;
        float _2466 = float(_2464);
        _2454 = _2466;
    }
    float _2468 = _2454;
    float _2470 = _2444 * _2440;
    float _2472 = precise::clamp(_2470, 0.0, 1.0);
    out.m_90.x = _2140;
    out.m_90.y = _2138;
    out.m_90.z = _2148;
    float _2474 = _2468 * _2432;
    float _2476 = sqrt(_2452);
    float _2478 = -_2472;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_92.x = _1373;
    out.m_92.y = _2164;
    out.m_92.z = _1377;
    float _2482 = -_2474;
    float _2484 = fma(_2482, _2480, 1.0);
    float _2486 = precise::clamp(_2484, 0.0, 1.0);
    float _2488 = _2486 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _2488;
    bool _2490 = _2476 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2492 = isnan(_2476);
    bool _2494 = _2490 || _2492;
    bool _2496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2498 = _2494 || _2496;
    float _2500 = _2472;
    float _2502 = _2480;
    float _2504 = _2486;
    if (!_2498)
    {
        _2322 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2506 = _2322;
    float _2508 = _2506;
    float _2510 = _2506;
    if (!_2498)
    {
        _2314 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2512 = _2314;
    float _2514 = _2512;
    float _2516 = _2512;
    if (!_2498)
    {
        _2448 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2518 = _2448;
    float _2520 = _2518;
    float _2522 = _2518;
    if (!_2498)
    {
        _2500 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2524 = _2500;
    float _2526 = _2524;
    float _2528 = _2524;
    if (!_2498)
    {
        _2502 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2530 = _2502;
    float _2532 = _2530;
    float _2534 = _2530;
    if (!_2498)
    {
        _2504 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2536 = _2504;
    bool _2538 = !_2498;
    float _2540 = _2536;
    float _2542 = _2536;
    if (!_2538)
    {
        bool _2544 = _2476 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2546 = isnan(_2476);
        bool _2548 = _2544 || _2546;
        bool _2550 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2552 = _2548 || _2550;
        if (!_2552)
        {
            float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2556 = _2476 + _2554;
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2560 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2558;
            float _2562 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2566 = 1.0 / _2560;
            float _2568 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2570 = _2568 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2584 = _2556 * _2566;
            float _2586 = precise::clamp(_2584, 0.0, 1.0);
            float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2592 = fma(_2586, _2564, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2594 = fma(_2586, _2590, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2596 = fma(_2586, _2570, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2598 = fma(_2586, _2574, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2600 = fma(_2586, _2578, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2602 = fma(_2586, _2582, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2516 = _2592;
            _2534 = _2600;
            _2510 = _2596;
            _2528 = _2598;
            _2522 = _2594;
            _2542 = _2602;
            _2604 = true;
        }
        else
        {
            bool _2606 = _2476 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2608 = isnan(_2476);
            bool _2610 = _2606 || _2608;
            bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2614 = _2610 || _2612;
            if (!_2614)
            {
                _2508 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2616 = _2508;
            _2510 = _2616;
            if (!_2614)
            {
                _2514 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2618 = _2514;
            _2516 = _2618;
            if (!_2614)
            {
                _2520 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2620 = _2520;
            _2522 = _2620;
            if (!_2614)
            {
                _2526 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2622 = _2526;
            _2528 = _2622;
            if (!_2614)
            {
                _2532 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2624 = _2532;
            _2534 = _2624;
            if (!_2614)
            {
                _2540 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2626 = _2540;
            bool _2628 = !_2614;
            _2542 = _2626;
            if (!_2628)
            {
                bool _2630 = _2476 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2632 = isnan(_2476);
                bool _2634 = _2630 || _2632;
                bool _2636 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2638 = _2634 || _2636;
                if (!_2638)
                {
                    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2642 = _2476 + _2640;
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2646 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2644;
                    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2650 = _2648 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2652 = 1.0 / _2646;
                    float _2654 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2656 = _2654 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2658 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2660 = _2658 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2670 = _2642 * _2652;
                    float _2672 = precise::clamp(_2670, 0.0, 1.0);
                    float _2674 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2676 = _2674 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2678 = fma(_2672, _2650, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2680 = fma(_2672, _2676, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2682 = fma(_2672, _2656, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2684 = fma(_2672, _2660, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2686 = fma(_2672, _2664, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2688 = fma(_2672, _2668, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2516 = _2678;
                    _2534 = _2686;
                    _2510 = _2682;
                    _2528 = _2684;
                    _2522 = _2680;
                    _2542 = _2688;
                    _2604 = true;
                }
                else
                {
                    _2516 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2534 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2510 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2528 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2522 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2542 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2604 = false;
    float _2690 = _2516;
    float _2692 = _2534;
    float _2694 = _2510;
    float _2696 = _2528;
    float _2698 = _2522;
    float _2700 = _2542;
    float _2702 = fma(_2138, -0.5, 0.5);
    float _2704 = precise::clamp(_2702, 0.0, 1.0);
    float _2706 = -_2690;
    float _2708 = _2706 + _2692;
    float _2710 = -_2694;
    float _2712 = _2710 + _2696;
    float _2714 = -_2698;
    float _2716 = _2714 + _2700;
    bool _2718 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2720 = fma(_2704, _2708, _2690);
    float _2722 = fma(_2704, _2712, _2694);
    float _2724 = fma(_2704, _2716, _2698);
    float _2726 = _2720 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _2728 = fma(_2722, 0.298911988735198974609375, _2726);
    float _2730 = fma(_2724, 0.114477999508380889892578125, _2728);
    out.m_96.x = 0.0;
    float _2732 = -_2730;
    float _2734 = _2722 + _2732;
    float _2736 = -_2730;
    float _2738 = _2720 + _2736;
    float _2740 = -_2730;
    float _2742 = _2724 + _2740;
    float _2744 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2746 = fma(_2734, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2730);
    float _2748 = fma(_2738, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2730);
    float _2750 = fma(_2742, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2730);
    out.m_94.w = _2744;
    out.m_98.x = _2746;
    out.m_98.y = _2748;
    out.m_98.z = _2750;
    if (!_2718)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2752 = -_2164;
    float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2756 = -_1373;
    float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2760 = -_1377;
    float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2764 = _2754 * _2754;
    float _2766 = fma(_2758, _2758, _2764);
    float _2768 = fma(_2762, _2762, _2766);
    float _2770 = sqrt(_2768);
    float _2772 = rsqrt(_2768);
    float _2774 = -_2770;
    float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2778 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2780 = precise::clamp(_2778, 0.0, 1.0);
    float _2782 = _2758 * _2772;
    float _2784 = _2754 * _2772;
    float _2786 = abs(_2780);
    float _2788 = log2(_2786);
    float _2790 = _2762 * _2772;
    float _2792 = _2782 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2794 = _2138 * _2784;
    float _2796 = -_2784;
    float _2798 = -_2792;
    float _2800 = fma(_2796, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2798);
    float _2802 = fma(_2140, _2782, _2794);
    float _2804 = -_2790;
    float _2806 = fma(_2804, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2800);
    float _2808 = fma(_2148, _2790, _2802);
    float _2810 = precise::clamp(_2808, 0.0, 1.0);
    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2814 = _2806 + _2812;
    float _2816 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2818 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2820 = precise::clamp(_2818, 0.0, 1.0);
    float _2822 = exp2(_2816);
    float _2824 = _2822 * _2820;
    float _2826 = _2810 * _2824;
    float _2828 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2830 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2832 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _2828;
    out.m_96.y = _2830;
    out.m_96.z = _2832;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

