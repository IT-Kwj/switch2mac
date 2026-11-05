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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    texture2d_array<float> vp_t_tcb_14 [[id(19)]];
    sampler vp_t_tcb_14Smplr [[id(20)]];
    sampler vp_t_tcb_20Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    sampler vp_t_tcb_14Smplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_82 [[user(locn0)]];
    float4 m_86 [[user(locn1)]];
    float4 m_106 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_84 [[user(locn5)]];
    float4 m_92 [[user(locn6)]];
    float4 m_96 [[user(locn7)]];
    float4 m_98 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 m_104 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_100 [[user(locn12)]];
    float4 m_102 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(1)]];
    float4 m_80 [[attribute(2)]];
    float4 m_78 [[attribute(3)]];
    float4 m_72 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_70 [[attribute(7)]];
    float4 m_74 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3983 = false;
    bool _2860 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_60.w;
    float _122 = trunc(_120);
    int _125 = int(_122);
    bool _129 = _125 >= 1;
    float _131 = 0.0;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    float _135 = _133;
    if (!_129)
    {
        out.m_63.x = 0.0;
    }
    int _137 = 0;
    if (!_129)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4268 = as_type<float>(_141);
        out.gl_Position.z = _4268;
    }
    if (!_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_65.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = 0.0;
    float _163 = _159;
    if (_155)
    {
        float _165 = float(_125);
        _161 = _165;
    }
    float _167 = _161;
    bool _169 = _159 >= _167;
    bool _171 = !_155;
    bool _173 = _169 || _171;
    if (_173)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _135;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    if (_173)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4337 = as_type<float>(_179);
        out.gl_Position.z = _4337;
    }
    if (_173)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _185 = as_type<int>(_181) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_181) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    float _219;
    if (!_201)
    {
        float _203 = in.m_70.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        float _223 = float(_125);
        float _225 = 1.0 / _223;
        float _227 = _159 * _225;
        _219 = _227;
    }
    _221 = false;
    float _229 = _219;
    float _231 = in.m_70.x;
    float _233 = in.m_70.y;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = _229 + _235;
    float _239 = in.m_70.z;
    float _241 = in.m_70.w;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _253 = 1.0 / _245;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _255;
    int _259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _261 = _259 != 0;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _265 = 1.0 / _249;
    float _267 = _231 * 2.0;
    float _269 = _233 * 2.0;
    float _271 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _273 = 1.0 / _257;
    float _275 = _239 * 2.0;
    float _277 = -_251;
    float _279 = fma(_271, 2.0, _277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = _229 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = floor(_267);
    float _291 = _283 * _253;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _229 + _293;
    int _297 = as_type<int>(_253);
    float _299 = _291;
    if (_261)
    {
        _297 = 0;
    }
    int _301 = _297;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _303;
    int _307 = _301;
    if (!_261)
    {
        _307 = 1;
    }
    int _309 = _307;
    float _311 = _295 * _265;
    float _313 = _231 + _233;
    float _315 = floor(_269);
    float _317 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _319 = _237 * _273;
    float _321 = _313 + (-1.0);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _327 = fma(_317, -2.0, _263);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _333 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _335 = _289 > 0.0;
    float _337 = floor(_275);
    bool _339 = _289 >= 0.0;
    bool _341 = isnan(_289);
    bool _343 = _339 || _341;
    bool _345 = isnan(0.0);
    bool _347 = _343 || _345;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _351 = fma(_325, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _353 = _347 ? 0 : 1;
    float _355 = fma(_331, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _357 = _315 > 0.0;
    float _359 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _361 = int(_359);
    bool _363 = _315 >= 0.0;
    bool _365 = isnan(_315);
    bool _367 = _363 || _365;
    bool _369 = isnan(0.0);
    bool _371 = _367 || _369;
    float _373 = fma(_287, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _375 = ~_353;
    int _377 = _375 + 1;
    int _379 = _377 + 1;
    float _381 = fma(_305, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _383 = _371 ? 0 : 1;
    float _385 = -_159;
    float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[76].x, _279);
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _391 = _389 != 0;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _395 = _393 != 0;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _399 = _397 != 0;
    float _401 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _403 = int(_401);
    int _405 = _379;
    float _407 = _311;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    if (!_335)
    {
        int _411 = ~_353;
        int _413 = _411 + 1;
        _405 = _413;
    }
    int _415 = _405;
    float _417 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _327);
    bool _419 = _233 > 0.5;
    bool _421 = _239 > 0.5;
    int _423 = ~_383;
    int _425 = _423 + 1;
    int _427 = _425 + 1;
    bool _429 = !_395;
    int _431 = _429 ? 0 : 1;
    bool _433 = !_391;
    int _435 = _433 ? 0 : 1;
    int _437 = _427;
    if (!_357)
    {
        int _439 = ~_383;
        int _441 = _439 + 1;
        _437 = _441;
    }
    int _443 = _437;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _451 = _449 != 0;
    float _453 = -_195;
    int _455 = _419 ? as_type<int>(_453) : as_type<int>(_195);
    float _457 = -_199;
    int _459 = _421 ? as_type<int>(_457) : as_type<int>(_199);
    bool _461 = !_399;
    int _463 = _461 ? 0 : 1;
    bool _465 = !_447;
    float _467 = _465 ? _195 : as_type<float>(_455);
    bool _469 = !_451;
    float _471 = _469 ? _199 : as_type<float>(_459);
    float _473 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _475 = int(_473);
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _487 = _485 != 0;
    int _489 = int(_261);
    int _491 = _419 ? 2 : 0;
    int _493 = _489 | _491;
    int _495 = _357 ? 4 : 0;
    int _497 = _493 | _495;
    int _499 = _421 ? 8 : 0;
    int _501 = _497 | _499;
    int _503 = _479 ? 16 : 0;
    int _505 = _501 | _503;
    int _507 = _483 ? 32 : 0;
    int _509 = _505 | _507;
    int _511 = _487 ? 64 : 0;
    int _513 = _509 | _511;
    int _515 = _513 & 2;
    bool _517 = _309 != 1;
    float _519 = _233 + _239;
    bool _521 = _337 >= 0.0;
    bool _523 = isnan(_337);
    bool _525 = _521 || _523;
    bool _527 = isnan(0.0);
    bool _529 = _525 || _527;
    float _531 = _519 + (-1.0);
    int _533 = _529 ? 0 : 1;
    bool _535 = _337 > 0.0;
    float _537 = _231 + _239;
    float _539 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _541 = !_483;
    int _543 = _541 ? 0 : 1;
    float _545 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _547 = int(_545);
    float _549 = _537 + (-1.0);
    if (!_517)
    {
        _407 = _233;
    }
    float _551 = _407;
    float _553 = _537;
    float _555 = _551;
    if (!_517)
    {
        float _557 = in.m_70.z;
        _553 = _557;
    }
    float _559 = _553;
    if (_517)
    {
        _555 = _231;
    }
    float _561 = _555;
    float _563 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _565 = ~_533;
    int _567 = _565 + 1;
    int _569 = _567 + 1;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _573 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _575 = log2(_573);
    int _577 = _569;
    if (!_535)
    {
        int _579 = ~_533;
        int _581 = _579 + 1;
        _577 = _581;
    }
    int _583 = _577;
    float _585 = _561 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _587 = _239 + (-0.5);
    float _589 = -_571;
    float _591 = fma(_585, 2.0, _589);
    int _593 = abs(_543);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_517)
    {
        _299 = _233;
    }
    float _597 = _299;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _601 = _597;
    if (_517)
    {
        _601 = _231;
    }
    float _603 = _601;
    float _605 = float(_415);
    float _607 = float(_583);
    float _609 = _575 * _159;
    float _611 = float(_593);
    float _613 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[83].z, _595);
    float _615 = _559;
    if (!_517)
    {
        _409 = _559;
    }
    float _617 = _409;
    float _619 = _617;
    if (_517)
    {
        _615 = _233;
    }
    float _621 = _615;
    float _623 = _611 * _605;
    if (_517)
    {
        _619 = _233;
    }
    float _625 = _619;
    float _627 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _613);
    float _629 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[83].w, _349);
    bool _631 = !_479;
    int _633 = _631 ? 0 : 1;
    float _635 = _625 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _637 = !_487;
    int _639 = _637 ? 0 : 1;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _643 = 1.0 + _641;
    int _645 = abs(_633);
    float _647 = fma(_635, -2.0, _599);
    float _649 = float(_361);
    float _651 = exp2(_609);
    float _653 = float(_645);
    float _655 = _623 * (-2.0);
    float _657 = float(_547);
    float _659 = float(_443);
    float _661 = _653 * _607;
    int _663 = abs(_639);
    float _665 = in.m_72.x;
    float _667 = in.m_72.y;
    float _669 = in.m_72.z;
    float _671 = 1.0 / _649;
    float _673 = float(_663);
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _677 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _679 = isnan(1.0);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _685 = _681 || _683;
    float _687 = _673 * _659;
    float _689 = -_651;
    float _691 = _689 + 1.0;
    float _693 = 1.0 / _657;
    float _695 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].z, _675);
    bool _697 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _699 = isnan(0.0);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _705 = _701 || _703;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _709 = float(_475);
    float _711 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _695);
    float _713 = float(_403);
    float _715 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _707);
    float _717 = 1.0 / _643;
    float _719 = _705 ? _691 : 0.0;
    float _721 = _709 * _159;
    float _723 = _713 * _159;
    float _725 = _671 * _159;
    float _727 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _715);
    float _729 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _629);
    float _731 = _231 + (-0.5);
    float _733 = _693 * _159;
    float _735 = -_159;
    float _737 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[81].x, _591);
    float _739 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _647);
    float _741 = _661 * (-2.0);
    bool _743 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _745 = isnan(_229);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = _233 + (-0.5);
    bool _757 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _759 = isnan(_229);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = fma(_741, _665, _665);
    float _771 = fma(_333, _741, _333);
    if (_685)
    {
        float _773 = _719 * _717;
        _163 = _773;
    }
    float _775 = _163;
    bool _777 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _779 = isnan(_229);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -_753;
    float _791 = _789 + 1.0;
    float _793 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[196].x, _769);
    bool _795 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _797 = isnan(_229);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = fma(_539, _655, _539);
    float _809 = _787 * _791;
    float _811 = -_787;
    float _813 = _811 + 1.0;
    float _815 = fma(_655, _667, _667);
    float _817 = fma(_771, _775, _793);
    float _819 = _687 * (-2.0);
    float _821 = _805 * _813;
    float _823 = -_805;
    float _825 = _823 + 1.0;
    float _827 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[196].y, _815);
    float _829 = fma(_819, _669, _669);
    float _831 = in.m_74.x;
    float _833 = in.m_74.y;
    float _835 = _767 * _825;
    float _837 = fma(_563, _819, _563);
    float _839 = fma(_807, _775, _827);
    float _841 = _381 * _835;
    float _843 = -_767;
    float _845 = _843 + 1.0;
    float _847 = _373 * _835;
    float _849 = _817 * 0.15915493667125701904296875;
    float _851 = _839 * 0.15915493667125701904296875;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _853;
    float _857 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[143].y, _841);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _859;
    float _863 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[143].x, _847);
    float _865 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[196].z, _829);
    float _867 = _849 * 6.283185482025146484375;
    float _869 = sin(_867);
    float _871 = in.m_60.x;
    float _873 = in.m_60.y;
    float _875 = in.m_60.z;
    float _877 = fma(_355, _821, _857);
    float _879 = fma(_351, _821, _863);
    float _881 = fma(_837, _775, _865);
    float _883 = in.m_76.x;
    float _885 = in.m_76.y;
    float _887 = in.m_76.z;
    float _889 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    int _891 = int(_261);
    int _893 = _705 ? 2 : 0;
    int _895 = _891 | _893;
    int _897 = _685 ? 4 : 0;
    int _899 = _895 | _897;
    int _901 = _421 ? 8 : 0;
    int _903 = _899 | _901;
    int _905 = _479 ? 16 : 0;
    int _907 = _903 | _905;
    int _909 = _483 ? 32 : 0;
    int _911 = _907 | _909;
    int _913 = _487 ? 64 : 0;
    int _915 = _911 | _913;
    int _917 = _915 & 8;
    float _919 = _849 * 6.283185482025146484375;
    float _921 = cos(_919);
    float _923 = _881 * 0.15915493667125701904296875;
    float _925 = _851 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = fma(_855, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _931 = fma(_861, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _933 = fma(_929, _809, _879);
    float _935 = fma(_931, _809, _877);
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _939 = _851 * 6.283185482025146484375;
    float _941 = cos(_939);
    float _943 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[146].x, _933);
    float _945 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[146].y, _935);
    float _947 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _949 = _943 * _831;
    float _951 = _945 * _833;
    float _953 = _873 * _885;
    float _955 = _923 * 6.283185482025146484375;
    float _957 = cos(_955);
    float _959 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _961 = _951 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _963 = fma(_871, _883, _953);
    float _965 = in.m_78.x;
    float _967 = in.m_78.y;
    float _969 = in.m_78.z;
    float _971 = _959 * _937;
    float _973 = _961 * _889;
    float _975 = _869 * _927;
    float _977 = _923 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = _921 * _941;
    float _983 = _869 * _941;
    float _985 = _921 * _927;
    float _987 = fma(_875, _887, _963);
    float _989 = _921 * _957;
    float _991 = _941 * _957;
    float _993 = _869 * _957;
    float _995 = _927 * _957;
    float _997 = _989 * _973;
    float _999 = fma(_979, _981, _975);
    float _1001 = -_985;
    float _1003 = fma(_979, _983, _1001);
    float _1005 = -_973;
    float _1007 = _979 * _1005;
    float _1009 = -_983;
    float _1011 = fma(_979, _985, _1009);
    float _1013 = fma(_999, _971, _997);
    float _1015 = _993 * _973;
    float _1017 = fma(_991, _971, _1007);
    float _1019 = fma(_979, _975, _981);
    float _1021 = fma(_1011, _947, _1013);
    float _1023 = fma(_1003, _971, _1015);
    float _1025 = fma(_995, _947, _1017);
    float _1027 = _873 * _967;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1031 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1033 = fma(_1019, _947, _1023);
    float _1035 = fma(_871, _965, _1027);
    float _1037 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1029);
    float _1039 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1031);
    float _1041 = fma(_875, _969, _1035);
    float _1043 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1037);
    float _1045 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1039);
    float _1047 = _987 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1049 = _1041 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1051 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1053 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1055 = _1047 + _1051;
    float _1057 = _1049 + _1053;
    float _1059 = in.m_80.x;
    float _1061 = in.m_80.y;
    float _1063 = in.m_80.z;
    float _1065 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1067 = _1055 + _1065;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1071 = _1057 + _1069;
    float _1073 = _1067 * _1067;
    float _1075 = _1071 * _1071;
    float _1077 = _1073 + _1075;
    float _1079 = sqrt(_1077);
    float _1081 = _873 * _1061;
    float _1083 = fma(_871, _1059, _1081);
    bool _1085 = _1079 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1087 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1089 = _1079 + _1087;
    float _1091 = fma(_875, _1063, _1083);
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1095 = 0.0;
    float _1097 = _1077;
    float _1099 = _1079;
    float _1101 = _1021;
    float _1103 = _873;
    float _1105 = _1073;
    float _1107 = _1003;
    if (_1085)
    {
        float _1109 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1095 = _1109;
    }
    float _1111 = _1095;
    if (_1085)
    {
        float _1113 = rsqrt(_1077);
        _1097 = _1113;
    }
    float _1115 = _1097;
    if (_1085)
    {
        float _1117 = _1089 * _1111;
        _1099 = _1117;
    }
    float _1119 = _1099;
    float _1121 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1123 = _1119;
    if (!_1085)
    {
        _1101 = _1055;
    }
    float _1125 = _1101;
    float _1127 = _1125;
    if (_1085)
    {
        float _1129 = _1119 * 0.15915493667125701904296875;
        _1123 = _1129;
    }
    float _1131 = _1123;
    float _1133 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1121);
    float _1135 = _871;
    if (_1085)
    {
        float _1137 = _1131 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        _1135 = _1139;
    }
    float _1141 = _1135;
    float _1143 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1133);
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1147 = _1093 + _1145;
    float _1149 = _1145;
    float _1151 = _1147;
    if (!_1085)
    {
        _1149 = _1057;
    }
    float _1153 = _1149;
    float _1155 = _1153;
    if (_1085)
    {
        float _1157 = _1147 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1103 = _1157;
    }
    float _1159 = _1103;
    float _1161 = _1141;
    if (_1085)
    {
        float _1163 = fma(_1141, _1159, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1161 = _1163;
    }
    float _1165 = _1161;
    float _1167 = _1165;
    if (_1085)
    {
        float _1169 = _1115 * _1165;
        _1167 = _1169;
    }
    float _1171 = _1167;
    if (_1085)
    {
        float _1173 = fma(_1067, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1127 = _1173;
    }
    float _1175 = _1127;
    if (_1085)
    {
        float _1177 = fma(_1071, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1155 = _1177;
    }
    float _1179 = _1155;
    float _1181 = fma(_1175, 6.2500002968590706586837768554688e-05, 0.5);
    float _1183 = fma(_1179, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5869 = float2(_1181, _1183);
    float3 _1187 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5869, float2(0.0), isnan(_5869)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5869, float2(0.0), isnan(_5869)), level(0.0)).xyz;
    float _1189 = _1187.x;
    float _1191 = _1187.y;
    float _1193 = _1187.z;
    float _1195 = float(uint(_475));
    float _1197 = trunc(_725);
    int _1199 = int(_1197);
    float _1201 = float(uint(_403));
    float _1203 = -_471;
    float _1205 = _1203 + 0.5;
    int _1207 = ~_475;
    int _1209 = _1207 + 1;
    float _1211 = -_729;
    float _1213 = _1211 + 1.0;
    int _1215 = ~_475;
    int _1217 = _1215 + 1;
    float _1219 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1221 = _475 == 0;
    float _1223 = 1.0 / _1195;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1227 = _1225 != 0;
    float _1229 = -_727;
    float _1231 = _1229 + 1.0;
    float _1233 = -_627;
    float _1235 = _1233 + 1.0;
    float _1237 = float(uint(_1199));
    float _1239 = 1.0 / _1201;
    int _1241 = as_type<int>(_1223) + (-2);
    float _1243 = trunc(_733);
    int _1245 = int(_1243);
    float _1247 = as_type<float>(_1241) * _1237;
    float _1249 = _1237;
    if (_261)
    {
        _1249 = 1.0;
    }
    float _1251 = _1249;
    float _1253 = _1251;
    if (!_261)
    {
        _1253 = 7.345489978790283203125;
    }
    float _1255 = _1253;
    float _1257 = float(_125);
    float _1259 = trunc(_1247);
    float _1261 = precise::max(_1259, 0.0);
    uint _1264 = uint(_1261);
    float _1266 = _1255 * _231;
    float _1268 = _1255;
    if (_261)
    {
        float _1270 = in.m_70.x;
        _1268 = _1270;
    }
    float _1272 = _1268;
    float _1274 = 1.0 / _1257;
    float _1276 = _1272;
    if (!_261)
    {
        float _1278 = in.m_70.y;
        _1276 = _1278;
    }
    float _1280 = _1276;
    int _1282 = _1209 * int(_1264);
    int _1284 = _1282 + _1199;
    float _1286 = float(uint(_1284));
    float _1288 = float(uint(_1245));
    float _1290 = _721 * _1274;
    float _1292 = _723 * _1274;
    float _1294 = as_type<float>(_1241) * _1286;
    int _1296 = as_type<int>(_1239) + (-2);
    float _1298 = floor(_1266);
    int _1300 = _403 + (-1);
    float _1302 = as_type<float>(_1296) * _1288;
    float _1304 = trunc(_1294);
    float _1306 = precise::max(_1304, 0.0);
    uint _1308 = uint(_1306);
    float _1310 = trunc(_1302);
    float _1312 = precise::max(_1310, 0.0);
    uint _1314 = uint(_1312);
    float _1316 = -_1298;
    float _1318 = _1266 + _1316;
    int _1320 = int(_1264) + int(_1308);
    float _1322 = trunc(_1292);
    int _1324 = int(_1322);
    int _1326 = ~_403;
    int _1328 = _1326 + 1;
    float _1330 = float(_1199);
    int _1332 = _1217 * _1320;
    int _1334 = _1332 + _1199;
    bool _1336 = _1330 >= _709;
    bool _1338 = isnan(_1330);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan(_709);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = _1318 * _709;
    bool _1350 = uint(_1334) >= uint(_475);
    int _1352 = _1328 * int(_1314);
    int _1354 = _1352 + _1245;
    float _1356 = trunc(_1346);
    int _1358 = int(_1356);
    bool _1360 = !_1350;
    int _1362 = _1360 ? 0 : (-1);
    float _1364 = float(uint(_1354));
    int _1366 = ~_1320;
    int _1368 = _1366 + _1362;
    int _1370 = _1368 + 1;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1374 = _1372 != 0;
    float _1376 = as_type<float>(_1296) * _1364;
    float _1378 = trunc(_1348);
    int _1380 = int(_1378);
    int _1382 = _475 * _1370;
    int _1384 = _1382 + _1199;
    bool _1386 = !_1374;
    int _1388 = _1386 ? 0 : 1;
    int _1390 = _475 + (-1);
    int _1392 = abs(_1388);
    float _1394 = trunc(_1376);
    float _1396 = precise::max(_1394, 0.0);
    uint _1398 = uint(_1396);
    int _1400 = ~_1358;
    int _1402 = _1400 + 1;
    int _1404 = _1402 + 1;
    bool _1406 = !_1221;
    int _1408 = _1406 ? _1384 : (-1);
    int _1410 = abs(_431);
    int _1412 = _1408 * _1404;
    float _1414 = trunc(_1290);
    int _1416 = int(_1414);
    float _1418 = _1364;
    if (_261)
    {
        _1418 = 1.0;
    }
    float _1420 = _1418;
    int _1422 = _1380 * _1392;
    int _1424 = _1422 + _1199;
    float _1426 = _1420;
    if (!_261)
    {
        _1426 = 1.2345600128173828125;
    }
    float _1428 = _1426;
    int _1430 = _1358 * _1390;
    int _1432 = _1430 + _1412;
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1436 = _1434 != 0;
    float _1438 = _1428 * _1280;
    int _1440 = int(_1314) + int(_1398);
    int _1442 = _1432 * _1410;
    int _1444 = abs(_435);
    float _1446 = floor(_1438);
    bool _1448 = !_1436;
    int _1450 = _1448 ? 0 : 1;
    int _1452 = abs(_463);
    int _1454 = _1416 * _1444;
    int _1456 = _1454 + _1442;
    int _1458 = abs(_1450);
    int _1460 = ~_403;
    int _1462 = _1460 + 1;
    float _1464 = float(_1245);
    int _1466 = _1424 * _1452;
    int _1468 = _1466 + _1456;
    int _1470 = _1462 * _1440;
    int _1472 = _1470 + _1245;
    bool _1474 = _1464 >= _713;
    bool _1476 = isnan(_1464);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan(_713);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    int _1486 = _1380 * _1458;
    int _1488 = _1486 + _1468;
    float _1490 = -_1446;
    float _1492 = _1438 + _1490;
    float _1494 = trunc(_1484);
    int _1496 = int(_1494);
    bool _1498 = uint(_1472) >= uint(_403);
    float _1500 = _713 * _1492;
    float _1502 = float(uint(_1488));
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1506 = !_1498;
    int _1508 = _1506 ? 0 : (-1);
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1512 = _1510 != 0;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1516 = _1514 != 0;
    float _1518 = as_type<float>(_1241) * _1502;
    int _1520 = ~_1440;
    int _1522 = _1520 + _1508;
    int _1524 = _1522 + 1;
    float _1526 = trunc(_1500);
    int _1528 = int(_1526);
    bool _1530 = _403 == 0;
    bool _1532 = !_1227;
    int _1534 = _1532 ? 0 : 1;
    int _1536 = _403 * _1524;
    int _1538 = _1536 + _1245;
    int _1540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1542 = _1540 != 0;
    int _1544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1546 = _1544 != 0;
    int _1548 = ~_1496;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    float _1554 = trunc(_1518);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    bool _1560 = !_1530;
    int _1562 = _1560 ? _1538 : (-1);
    int _1564 = abs(_1534);
    int _1566 = ~_475;
    int _1568 = _1566 + 1;
    int _1570 = _1552 * _1562;
    bool _1572 = !_1516;
    int _1574 = _1572 ? 0 : 1;
    int _1576 = _1528 * _1564;
    int _1578 = _1576 + _1245;
    bool _1580 = !_1512;
    int _1582 = _1580 ? 0 : 1;
    int _1584 = _1496 * _1300;
    int _1586 = _1584 + _1570;
    int _1588 = abs(_1574);
    bool _1590 = !_1542;
    int _1592 = _1590 ? 0 : 1;
    int _1594 = abs(_1582);
    int _1596 = _1568 * int(_1558);
    int _1598 = _1596 + _1488;
    bool _1600 = !_1546;
    int _1602 = _1600 ? 0 : 1;
    bool _1604 = _515 != 0;
    int _1606 = abs(_1592);
    int _1608 = _1586 * _1588;
    float _1610 = float(uint(_1598));
    int _1612 = abs(_1602);
    int _1614 = _1324 * _1594;
    int _1616 = _1614 + _1608;
    float _1618 = as_type<float>(_1241) * _1610;
    float _1620 = float(uint(_1424));
    int _1622 = ~_403;
    int _1624 = _1622 + 1;
    int _1626 = _1578 * _1606;
    int _1628 = _1626 + _1616;
    int _1630 = ~_475;
    int _1632 = _1630 + 1;
    float _1634 = trunc(_1618);
    float _1636 = precise::max(_1634, 0.0);
    uint _1638 = uint(_1636);
    float _1640 = as_type<float>(_1241) * _1620;
    int _1642 = _1528 * _1612;
    int _1644 = _1642 + _1628;
    int _1646 = ~_475;
    int _1648 = _1646 + 1;
    bool _1650 = _231 > 0.5;
    float _1652 = float(uint(_1644));
    float _1654 = trunc(_1640);
    float _1656 = precise::max(_1654, 0.0);
    uint _1658 = uint(_1656);
    float _1660 = -_195;
    int _1662 = _1650 ? as_type<int>(_1660) : as_type<int>(_195);
    float _1664 = as_type<float>(_1296) * _1652;
    float _1666 = float(uint(_1578));
    int _1668 = int(_1558) + int(_1638);
    float _1670 = trunc(_1664);
    float _1672 = precise::max(_1670, 0.0);
    uint _1674 = uint(_1672);
    float _1676 = as_type<float>(_1296) * _1666;
    int _1678 = _1632 * _1668;
    int _1680 = _1678 + _1488;
    int _1682 = _1632 * int(_1658);
    int _1684 = _1682 + _1424;
    float _1686 = trunc(_1676);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    bool _1692 = uint(_1680) >= uint(_475);
    float _1694 = float(uint(_1684));
    bool _1696 = !_1692;
    int _1698 = _1696 ? 0 : (-1);
    int _1700 = _1624 * int(_1674);
    int _1702 = _1700 + _1644;
    int _1704 = ~_1668;
    int _1706 = _1704 + _1698;
    int _1708 = _1706 + 1;
    float _1710 = as_type<float>(_1241) * _1694;
    float _1712 = float(uint(_1702));
    int _1714 = _475 * _1708;
    int _1716 = _1714 + _1488;
    float _1718 = trunc(_1710);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = _1624 * int(_1690);
    int _1726 = _1724 + _1578;
    float _1728 = as_type<float>(_1296) * _1712;
    bool _1730 = !_1221;
    int _1732 = _1730 ? _1716 : (-1);
    float _1734 = float(uint(_1726));
    int _1736 = _1732 & 3;
    bool _1738 = _1736 != 0;
    float _1740 = trunc(_1728);
    float _1742 = precise::max(_1740, 0.0);
    uint _1744 = uint(_1742);
    int _1746 = _1732 & 3;
    bool _1748 = _1746 != 0;
    float _1750 = as_type<float>(_1296) * _1734;
    int _1752 = _1738 ? 0 : 1;
    bool _1754 = uint(_1746) > 1u;
    int _1756 = int(_1658) + int(_1722);
    int _1758 = ~_1752;
    int _1760 = _1758 + 1;
    int _1762 = _1760 + 1;
    bool _1764 = _1746 != 3;
    int _1766 = int(_1674) + int(_1744);
    int _1768 = _1648 * _1756;
    int _1770 = _1768 + _1424;
    int _1772 = _1762;
    if (!_1754)
    {
        int _1774 = ~_1752;
        int _1776 = _1774 + 1;
        _1772 = _1776;
    }
    int _1778 = _1772;
    float _1780 = trunc(_1750);
    float _1782 = precise::max(_1780, 0.0);
    uint _1784 = uint(_1782);
    bool _1786 = uint(_1746) >= 2u;
    int _1788 = ~_403;
    int _1790 = _1788 + 1;
    int _1792 = _1786 ? 0 : 1;
    bool _1794 = uint(_1770) >= uint(_475);
    int _1796 = _1790 * _1766;
    int _1798 = _1796 + _1644;
    int _1800 = ~_1792;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    bool _1806 = !_1794;
    int _1808 = _1806 ? 0 : (-1);
    bool _1810 = uint(_1798) >= uint(_403);
    int _1812 = ~_1756;
    int _1814 = _1812 + _1808;
    int _1816 = _1814 + 1;
    bool _1818 = !_1810;
    int _1820 = _1818 ? 0 : (-1);
    bool _1822 = _1746 != 3;
    int _1824 = _475 * _1816;
    int _1826 = _1824 + _1424;
    int _1828 = ~_1766;
    int _1830 = _1828 + _1820;
    int _1832 = _1830 + 1;
    int _1834 = ~_403;
    int _1836 = _1834 + 1;
    int _1838 = int(_1690) + int(_1784);
    int _1840 = _403 * _1832;
    int _1842 = _1840 + _1644;
    int _1844 = _1732 >> 31;
    bool _1846 = !_1221;
    int _1848 = _1846 ? _1826 : (-1);
    int _1850 = _1836 * _1838;
    int _1852 = _1850 + _1578;
    bool _1854 = !_1530;
    int _1856 = _1854 ? _1842 : (-1);
    int _1858 = _1804;
    if (_1822)
    {
        int _1860 = ~_1792;
        int _1862 = _1860 + 1;
        _1858 = _1862;
    }
    int _1864 = _1858;
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1868 = _1866 != 0;
    bool _1870 = _917 != 0;
    bool _1872 = !_1868;
    int _1874 = _1872 ? 0 : 1;
    bool _1876 = uint(_1852) >= uint(_403);
    int _1878 = _1844 & 3;
    int _1880 = _1856 >> 31;
    int _1882 = _1732 + _1878;
    int _1884 = _1880 & 3;
    int _1886 = _1882 >> 2;
    int _1888 = _1856 + _1884;
    int _1890 = _1886 << 4;
    int _1892 = _1890 + 368;
    int _1894 = _1888 >> 2;
    uint _1896 = uint(int(uint(_1892) >> uint(2)));
    uint _1898 = uint(int(uint(int(_1896)) >> uint(2)));
    int _1900 = int(_1896) & 3;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[int(_1898)][_1900];
    int _1904 = int(_1896) + 1;
    uint _1906 = uint(int(uint(_1904) >> uint(2)));
    int _1908 = _1904 & 3;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[int(_1906)][_1908];
    bool _1912 = !_1748;
    int _1914 = _1912 ? 0 : 1;
    int _1916 = _1856 & 3;
    bool _1918 = _1916 != 0;
    int _1920 = _1894 << 4;
    int _1922 = _1920 + 512;
    bool _1924 = !_1764;
    int _1926 = _1924 ? 0 : (-1);
    bool _1928 = _1916 != 3;
    uint _1930 = uint(int(uint(_1922) >> uint(2)));
    uint _1932 = uint(int(uint(int(_1930)) >> uint(2)));
    int _1934 = int(_1930) & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    int _1938 = int(_1930) + 1;
    uint _1940 = uint(int(uint(_1938) >> uint(2)));
    int _1942 = _1938 & 3;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[int(_1940)][_1942];
    bool _1946 = !_1876;
    int _1948 = _1946 ? 0 : (-1);
    bool _1950 = uint(_1916) > 1u;
    float _1952 = -_199;
    int _1954 = _1604 ? as_type<int>(_1952) : as_type<int>(_199);
    bool _1956 = uint(_1916) >= 2u;
    int _1958 = ~_1838;
    int _1960 = _1958 + _1948;
    int _1962 = _1960 + 1;
    int _1964 = _1918 ? 0 : 1;
    bool _1966 = _1916 != 3;
    int _1968 = _1956 ? 0 : 1;
    bool _1970 = !_1966;
    int _1972 = _1970 ? 0 : (-1);
    int _1974 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1976 = _1974 != 0;
    int _1978 = _1856 & 3;
    bool _1980 = _1978 != 0;
    int _1982 = ~_1968;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    int _1988 = _1986;
    if (_1928)
    {
        int _1990 = ~_1968;
        int _1992 = _1990 + 1;
        _1988 = _1992;
    }
    int _1994 = _1988;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1998 = ~_1964;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = _2002;
    if (!_1950)
    {
        int _2006 = ~_1964;
        int _2008 = _2006 + 1;
        _2004 = _2008;
    }
    int _2010 = _2004;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2014 = abs(_1778);
    int _2016 = _1892 + 8;
    uint _2018 = uint(int(uint(_2016) >> uint(2)));
    uint _2020 = uint(int(uint(int(_2018)) >> uint(2)));
    int _2022 = int(_2018) & 3;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[int(_2020)][_2022];
    int _2026 = int(_2018) + 1;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    int _2030 = _2026 & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    int _2034 = abs(_2010);
    float _2036 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2038 = _2012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2040 = abs(_1914);
    float _2042 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2044 = ~_2014;
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    float _2050 = _467 + 0.5;
    int _2052 = _1922 + 8;
    uint _2054 = uint(int(uint(_2052) >> uint(2)));
    uint _2056 = uint(int(uint(int(_2054)) >> uint(2)));
    int _2058 = int(_2054) & 3;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[int(_2056)][_2058];
    int _2062 = int(_2054) + 1;
    uint _2064 = uint(int(uint(_2062) >> uint(2)));
    int _2066 = _2062 & 3;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[int(_2064)][_2066];
    bool _2070 = _241 > 0.5;
    int _2072 = _403 * _1962;
    int _2074 = _2072 + _1578;
    int _2076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2078 = _2076 != 0;
    int _2080 = _2048 * as_type<int>(_1910);
    bool _2082 = !_1980;
    int _2084 = _2082 ? 0 : 1;
    float _2086 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2088 = !_1530;
    int _2090 = _2088 ? _2074 : (-1);
    float _2092 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2094 = !_2078;
    int _2096 = _2094 ? 0 : 1;
    int _2098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2100 = _2098 != 0;
    int _2102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2104 = _2102 != 0;
    int _2106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2108 = _2106 != 0;
    float _2110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2112 = ~_2034;
    int _2114 = _2112 + 1;
    int _2116 = _2114 + 1;
    int _2118 = ~_2040;
    int _2120 = _2118 + 1;
    int _2122 = _2120 + 1;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2126 = _1219 * _2086;
    int _2128 = _2116 * as_type<int>(_1944);
    int _2130 = _2122 * as_type<int>(_1902);
    int _2132 = _2130 + _2080;
    out.m_82.x = _2036;
    out.m_82.y = _2038;
    out.m_82.z = _2042;
    out.m_82.w = _2124;
    float _2134 = _2092 * _2110;
    int _2136 = abs(_2084);
    int _2138 = abs(_1994);
    int _2140 = ~_2136;
    int _2142 = _2140 + 1;
    int _2144 = _2142 + 1;
    out.m_84.x = _2134;
    out.m_84.y = _2126;
    int _2146 = abs(_1874);
    float _2148 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2150 = int(_2148);
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2154 = abs(_1864);
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2160 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2162 = ~_2154;
    int _2164 = _2162 + 1;
    int _2166 = _2164 + 1;
    float _2168 = _2156 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2170 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2172 = int(_2170);
    float _2174 = _2158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2176 = _2144 * as_type<int>(_1936);
    int _2178 = _2176 + _2128;
    int _2180 = abs(_1926);
    int _2182 = _2166 * as_type<int>(_2024);
    int _2184 = _2182 + _2132;
    out.m_86.x = _2160;
    out.m_86.y = _2168;
    out.m_86.z = _2174;
    int _2186 = abs(_1972);
    float _2188 = as_type<float>(_2138);
    if (_1085)
    {
        float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2192 = _1175 + _2190;
        _2188 = _2192;
    }
    float _2194 = _2188;
    float _2196 = float(uint(_2150));
    int _2198 = ~_2186;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    float _2204 = _989 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2206 = abs(_2150);
    if (_1085)
    {
        float _2208 = _2194 * _2194;
        _1105 = _2208;
    }
    float _2210 = _1105;
    float _2212 = 1.0 / _2196;
    int _2214 = abs(_2096);
    float _2216 = _989 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2218 = ~_2138;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    float _2224 = _989 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2226 = ~_2180;
    int _2228 = _2226 + 1;
    int _2230 = _2228 + 1;
    float _2232 = -_979;
    float _2234 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2216);
    float _2236 = float(uint(_2172));
    int _2238 = _2222 * as_type<int>(_2060);
    int _2240 = _2238 + _2178;
    int _2242 = ~_2146;
    int _2244 = _2242 + 1;
    int _2246 = _2244 + 1;
    int _2248 = _2230 * as_type<int>(_2032);
    int _2250 = _2248 + _2184;
    int _2252 = _2202 * as_type<int>(_2068);
    int _2254 = _2252 + _2240;
    float _2256 = 1.0 / _2236;
    int _2258 = _2250 * _2246;
    int _2260 = abs(_2172);
    float _2262 = -_979;
    float _2264 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2204);
    float _2266 = float(uint(_2206));
    int _2268 = _1848 * _2146;
    int _2270 = _2268 + _2258;
    int _2272 = ~_2214;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    float _2278 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2264);
    float _2280 = float(uint(_2260));
    float _2282 = -_979;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    int _2286 = as_type<int>(_2212) + (-2);
    float _2288 = 1.0 / _2266;
    float _2290 = float(uint(_2270));
    int _2292 = _2276 * _2254;
    float _2294 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    float _2296 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2284);
    int _2298 = as_type<int>(_2256) + (-2);
    int _2300 = _2090 * _2214;
    int _2302 = _2300 + _2292;
    float _2304 = as_type<float>(_2286) * _2290;
    float _2306 = 1.0 / _2280;
    int _2308 = abs(_2270);
    float _2310 = _999 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2312 = float(uint(_2302));
    float _2314 = _999 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2316 = _999 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2318 = abs(_2302);
    float _2320 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2310);
    float _2322 = trunc(_2304);
    float _2324 = precise::max(_2322, 0.0);
    uint _2326 = uint(_2324);
    float _2328 = as_type<float>(_2298) * _2312;
    int _2330 = as_type<int>(_2288) + (-2);
    float _2332 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2314);
    float _2334 = float(uint(_2308));
    float _2336 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2316);
    float _2338 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2340 = float(uint(_2318));
    float _2342 = _2234;
    float _2344 = _2296;
    if (_1085)
    {
        float _2346 = _1131 * 6.283185482025146484375;
        float _2348 = cos(_2346);
        _2342 = _2348;
    }
    float _2350 = _2342;
    int _2352 = as_type<int>(_2306) + (-2);
    float _2354 = as_type<float>(_2330) * _2334;
    int _2356 = ~_2150;
    int _2358 = _2356 + 1;
    float _2360 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2362 = !_2100;
    float _2364 = _2362 ? _199 : as_type<float>(_1954);
    float _2366 = as_type<float>(_2352) * _2340;
    float _2368 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2332);
    float _2370 = trunc(_2328);
    float _2372 = precise::max(_2370, 0.0);
    uint _2374 = uint(_2372);
    float _2376 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2378 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2338);
    int _2380 = _2358 * int(_2326);
    int _2382 = _2380 + _2270;
    int _2384 = ~_2260;
    int _2386 = _2384 + 1;
    float _2388 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2376);
    float _2390 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2360);
    int _2392 = ~_2172;
    int _2394 = _2392 + 1;
    float _2396 = trunc(_2354);
    float _2398 = precise::max(_2396, 0.0);
    uint _2400 = uint(_2398);
    float _2402 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2388);
    float _2404 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2378);
    float _2406 = float(uint(_2382));
    float _2408 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2390);
    int _2410 = ~_2206;
    int _2412 = _2410 + 1;
    bool _2414 = !_1976;
    float _2416 = _2414 ? _195 : as_type<float>(_1662);
    float _2418 = trunc(_2366);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    float _2424 = as_type<float>(_2286) * _2406;
    int _2426 = _2394 * int(_2374);
    int _2428 = _2426 + _2302;
    float _2430 = as_type<float>(_2412);
    if (_1085)
    {
        float _2432 = _2350 + (-1.0);
        _2430 = _2432;
    }
    float _2434 = _2430;
    bool _2436 = _2172 == 0;
    int _2438 = _2412 * int(_2400);
    int _2440 = _2438 + _2308;
    float _2442 = float(uint(_2428));
    float _2444 = trunc(_2424);
    float _2446 = precise::max(_2444, 0.0);
    uint _2448 = uint(_2446);
    float _2450 = _2434;
    if (_1085)
    {
        float _2452 = _2434 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2450 = _2452;
    }
    float _2454 = _2450;
    float _2456 = float(uint(_2440));
    if (_1085)
    {
        float _2458 = fma(_1147, _2350, _2454);
        _1151 = _2458;
    }
    float _2460 = _1151;
    int _2462 = _2386 * int(_2422);
    int _2464 = _2462 + _2318;
    float _2466 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2470 = _2460 + _2468;
    float _2472 = float(uint(_2464));
    float _2474 = as_type<float>(_2298) * _2442;
    float _2476 = as_type<float>(_2330) * _2456;
    float _2478 = -_199;
    int _2480 = _2070 ? as_type<int>(_2478) : as_type<int>(_199);
    float _2482 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2484 = -_195;
    int _2486 = _1870 ? as_type<int>(_2484) : as_type<int>(_195);
    float _2488 = as_type<float>(_2352) * _2472;
    bool _2490 = !_2108;
    float _2492 = _2490 ? _199 : as_type<float>(_2480);
    float _2494 = trunc(_2474);
    float _2496 = precise::max(_2494, 0.0);
    uint _2498 = uint(_2496);
    bool _2500 = !_2104;
    float _2502 = _2500 ? _195 : as_type<float>(_2486);
    float _2504 = _2482 * _2278;
    float _2506 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2320);
    float _2508 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2336);
    float _2510 = _2482 * _2296;
    float _2512 = _2504;
    if (!_1085)
    {
        _1107 = _1075;
    }
    float _2514 = _1107;
    float _2516 = fma(_2466, _2506, _2504);
    float _2518 = trunc(_2488);
    float _2520 = precise::max(_2518, 0.0);
    uint _2522 = uint(_2520);
    float _2524 = _2482 * _2294;
    float _2526 = _2514;
    if (_1085)
    {
        float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2530 = _1179 + _2528;
        _2512 = _2530;
    }
    float _2532 = _2512;
    int _2534 = ~_2206;
    int _2536 = _2534 + 1;
    out.m_88.x = _2506;
    out.m_88.y = _2368;
    out.m_88.z = _2508;
    float _2538 = fma(_2466, _2368, _2524);
    float _2540 = fma(_2466, _2508, _2510);
    float _2542 = fma(_2470, _2470, _2210);
    float _2544 = trunc(_2476);
    float _2546 = precise::max(_2544, 0.0);
    uint _2548 = uint(_2546);
    int _2550 = int(_2326) + int(_2448);
    float _2552 = _2540;
    float _2554 = as_type<float>(_2550);
    if (_1085)
    {
        float _2556 = _2532 * _2532;
        _2526 = _2556;
    }
    float _2558 = _2526;
    int _2560 = ~_2150;
    int _2562 = _2560 + 1;
    int _2564 = int(_2374) + int(_2498);
    float _2566 = _2542 + _2558;
    int _2568 = ~_2172;
    int _2570 = _2568 + 1;
    int _2572 = _2562 * _2550;
    int _2574 = _2572 + _2270;
    int _2576 = int(_2422) + int(_2522);
    int _2578 = ~_2260;
    int _2580 = _2578 + 1;
    int _2582 = _2570 * _2564;
    int _2584 = _2582 + _2302;
    bool _2586 = uint(_2574) >= uint(_2150);
    float _2588 = sqrt(_2566);
    int _2590 = _2302 ^ _2172;
    int _2592 = _2580 * _2576;
    int _2594 = _2592 + _2318;
    int _2596 = int(_2400) + int(_2548);
    bool _2598 = !_2586;
    int _2600 = _2598 ? 0 : (-1);
    bool _2602 = uint(_2584) >= uint(_2172);
    int _2604 = _2536 * _2596;
    int _2606 = _2604 + _2308;
    int _2608 = ~_2550;
    int _2610 = _2608 + _2600;
    int _2612 = _2610 + 1;
    float _2614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2616 = !_2602;
    int _2618 = _2616 ? 0 : (-1);
    bool _2620 = uint(_2594) >= uint(_2260);
    int _2622 = _2150 * _2612;
    int _2624 = _2622 + _2270;
    bool _2626 = uint(_2606) >= uint(_2206);
    int _2628 = _2270 ^ _2150;
    float _2630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2632 = ~_2564;
    int _2634 = _2632 + _2618;
    int _2636 = _2634 + 1;
    bool _2638 = !_2620;
    int _2640 = _2638 ? 0 : (-1);
    bool _2642 = !_2626;
    int _2644 = _2642 ? 0 : (-1);
    int _2646 = _2172 * _2636;
    int _2648 = _2646 + _2302;
    uint _2650 = uint(int(uint(_2628) >> uint(31)));
    float _2652 = fma(_2482, _2482, 1.0);
    bool _2654 = _2150 == 0;
    bool _2656 = _2150 == 0;
    float _2658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2660 = ~_2640;
    int _2662 = _2576 + _2660;
    int _2664 = _2662 + 1;
    int _2666 = ~_2644;
    int _2668 = _2596 + _2666;
    int _2670 = _2668 + 1;
    float _2672 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2674 = ~int(_2650);
    int _2676 = _2674 + 1;
    float _2678 = _2614 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2680 = _2172 == 0;
    float _2682 = rsqrt(_2652);
    uint _2684 = uint(int(uint(_2590) >> uint(31)));
    bool _2686 = !_2654;
    int _2688 = _2686 ? _2624 : (-1);
    int _2690 = _2670 ^ _2676;
    int _2692 = ~int(_2684);
    int _2694 = _2692 + 1;
    float _2696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2698 = float(_2688);
    float _2700 = _2658 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2702 = ~_2676;
    int _2704 = _2702 + _2690;
    int _2706 = _2704 + 1;
    float _2708 = _2416 + 0.5;
    bool _2710 = !_2436;
    int _2712 = _2710 ? _2648 : (-1);
    float _2714 = fma(_2678, _2698, _387);
    int _2716 = _2664 ^ _2694;
    float _2718 = _2482 * _2682;
    float _2720 = float(_2712);
    float _2722 = fma(_2678, _2708, _2714);
    bool _2724 = !_2656;
    int _2726 = _2724 ? _2706 : (-1);
    float _2728 = _2364 + (-0.5);
    int _2730 = ~_2694;
    int _2732 = _2730 + _2716;
    int _2734 = _2732 + 1;
    float _2736 = fma(_2700, _2720, _737);
    float _2738 = float(_2726);
    float _2740 = _2696 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2742 = !_2680;
    int _2744 = _2742 ? _2734 : (-1);
    float _2746 = -_2404;
    float _2748 = _2718 * _2746;
    float _2750 = _2404 + _2538;
    float _2752 = -_417;
    float _2754 = fma(_2672, _2738, _2752);
    float _2756 = float(_2744);
    float _2758 = _2502 + 0.5;
    out.m_90.x = _1189;
    out.m_90.y = _1191;
    out.m_90.z = _1193;
    float _2760 = -_2672;
    float _2762 = fma(_2760, _2728, _2754);
    float _2764 = _2492 + (-0.5);
    float _2766 = -_739;
    float _2768 = fma(_2740, _2756, _2766);
    float _2770 = fma(_2700, _2758, _2736);
    float _2772 = -_2402;
    float _2774 = _2718 * _2772;
    float _2776 = -_2408;
    float _2778 = _2718 * _2776;
    float _2780 = -_2740;
    float _2782 = fma(_2780, _2764, _2768);
    float _2784 = fma(_2682, _2294, _2748);
    float _2786 = -_711;
    float _2788 = _2786 + 1.0;
    float _2790 = fma(_2682, _2278, _2774);
    float _2792 = _2402 + _2516;
    float _2794 = fma(_2682, _2296, _2778);
    float _2796 = -_2788;
    float _2798 = fma(_2416, _2796, _2722);
    float _2800 = fma(_2492, _1213, _2782);
    float _2802 = -_1235;
    float _2804 = fma(_2502, _2802, _2770);
    float _2806 = fma(_2364, _1231, _2762);
    float _2808 = _2408 + _2540;
    out.m_92.x = _2790;
    out.m_92.y = _2784;
    out.m_92.z = _2794;
    bool _2810 = _2588 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2812 = isnan(_2588);
    bool _2814 = _2810 || _2812;
    bool _2816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2818 = _2814 || _2816;
    out.m_94.x = _2798;
    out.m_94.y = _2806;
    out.m_94.z = _2804;
    out.m_94.w = _2800;
    out.m_96.x = _2792;
    out.m_96.y = _2750;
    out.m_96.z = _2808;
    float _2820 = _2762;
    float _2822 = as_type<float>(_2596);
    float _2824 = as_type<float>(_2580);
    if (!_2818)
    {
        _2820 = 1.0;
    }
    float _2826 = _2820;
    bool _2828 = !_2818;
    float _2830 = _2826;
    if (!_2828)
    {
        bool _2832 = _2588 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2834 = isnan(_2588);
        bool _2836 = _2832 || _2834;
        bool _2838 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2840 = _2836 || _2838;
        if (!_2840)
        {
            float _2842 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2844 = _2588 + _2842;
            float _2846 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2848 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2846;
            float _2850 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2852 = _2850 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2854 = 1.0 / _2848;
            float _2856 = _2844 * _2854;
            float _2858 = fma(_2856, _2852, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2830 = _2858;
            _2860 = true;
        }
        else
        {
            bool _2862 = _2588 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2864 = isnan(_2588);
            bool _2866 = _2862 || _2864;
            bool _2868 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2870 = _2866 || _2868;
            if (!_2870)
            {
                float _2872 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2874 = _2588 + _2872;
                float _2876 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2878 = _2876 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2880 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2882 = _2880 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2884 = 1.0 / _2878;
                float _2886 = _2874 * _2884;
                float _2888 = fma(_2886, _2882, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2830 = _2888;
                _2860 = true;
            }
            else
            {
                _2830 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2860 = false;
    float _2890 = _2830;
    float _2892 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2894 = _2460 + _2892;
    float _2896 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2898 = _1175 + _2896;
    float _2900 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2902 = _1179 + _2900;
    float _2904 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2906 = fma(_2894, _2890, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2908 = fma(_2898, _2890, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2910 = fma(_2902, _2890, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2912 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2904);
    float _2914 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2916 = _2906 + _2914;
    float _2918 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2920 = _2908 + _2918;
    float _2922 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2924 = _2910 + _2922;
    float _2926 = _2916 * _2916;
    float _2928 = fma(_2920, _2920, _2926);
    float _2930 = fma(_2924, _2924, _2928);
    float _2932 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2912);
    float _2934 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2936 = fma(_1047, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2938 = rsqrt(_2930);
    float _2940 = _2932 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2942 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2934);
    float _2944 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2942);
    float _2946 = 1.0 / _2940;
    float _2948 = _2944 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2950 = _2948 + _2940;
    float _2952 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2954 = sqrt(_2930);
    float _2956 = _2920 * _2952;
    float _2958 = _2924 * _2952;
    float _2960 = _2956 * _2956;
    float _2962 = _2958 * _2958;
    float _2964 = _2950 * _2946;
    float _2966 = _2964 * 0.5;
    float _2968 = _2960 + _2962;
    float _2970 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2972 = fma(_2966, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2970);
    float _2974 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2976 = sqrt(_2968);
    float _2978 = _1093 + _2974;
    float _2980 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2982 = 1.0 / _2972;
    float _2984 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2986 = fma(_1047, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2980);
    float _2988 = fma(_1047, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2984);
    float _2990 = fma(_1049, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2986);
    bool _2992 = _2976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2994 = fma(_1049, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2988);
    float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2998 = _2976 + _2996;
    float _3000 = _2990 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3002 = floor(_2936);
    float _3004 = _2994 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _3006 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3008 = _2982 * _3006;
    float _3010 = trunc(_3000);
    int _3012 = int(_3010);
    bool _3014 = _3008 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3016 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _3018 = _3008 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3020 = _1193;
    int _3022 = 2;
    float _3024 = _2998;
    float _3026 = _2968;
    float _3028 = _2958;
    float _3030 = _2960;
    if (_2992)
    {
        float _3032 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3020 = _3032;
    }
    float _3034 = _3020;
    float _3036 = -_3002;
    float _3038 = _2936 + _3036;
    if (!_3014)
    {
        _3022 = 1;
    }
    int _3040 = _3022;
    float _3042 = trunc(_3004);
    int _3044 = int(_3042);
    int _3046 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3048 = _3012 + _3046;
    int _3050 = _3048 + 1;
    int _3052 = _3040;
    if (_2992)
    {
        float _3054 = _2998 * _3034;
        _3024 = _3054;
    }
    float _3056 = _3024;
    if (_2992)
    {
        float _3058 = rsqrt(_2968);
        _3026 = _3058;
    }
    float _3060 = _3026;
    if (_2992)
    {
        float _3062 = _3056 * 0.15915493667125701904296875;
        _2552 = _3062;
    }
    float _3064 = _2552;
    bool _3066 = !_3014;
    int _3068 = _3066 ? 0 : 1;
    int _3070 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3072 = _3044 + _3070;
    int _3074 = _3072 + 1;
    float _3076 = _2990;
    if (_2992)
    {
        float _3078 = _3064 * 6.283185482025146484375;
        float _3080 = sin(_3078);
        _3076 = _3080;
    }
    float _3082 = _3076;
    if (!_3018)
    {
        _3052 = _3068;
    }
    int _3084 = _3052;
    float _3086 = precise::max(0.0, _3016);
    int _3088 = _3084 << 6;
    bool _3090 = _3050 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _3092 = -_2952;
    float _3094 = -_3086;
    float _3096 = fma(_2916, _3092, _3094);
    int _3098 = _3088 + 96;
    uint _3100 = uint(int(uint(_3098) >> uint(2)));
    uint _3102 = uint(int(uint(int(_3100)) >> uint(2)));
    int _3104 = int(_3100) & 3;
    float _3106 = (*spvDescriptorSet0.vp_c15)._m0[int(_3102)][_3104];
    int _3108 = int(_3100) + 1;
    uint _3110 = uint(int(uint(_3108) >> uint(2)));
    int _3112 = _3108 & 3;
    float _3114 = (*spvDescriptorSet0.vp_c15)._m0[int(_3110)][_3112];
    int _3116 = _3050 | _3074;
    float _3118 = _3064;
    float _3120 = _3086;
    float _3122 = as_type<float>(_3116);
    float _3124 = _3096;
    if (_2992)
    {
        float _3126 = _3064 * 6.283185482025146484375;
        float _3128 = cos(_3126);
        _3118 = _3128;
    }
    float _3130 = _3118;
    if (_2992)
    {
        float _3132 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3120 = _3132;
    }
    float _3134 = _3120;
    bool _3136 = _3116 < 0;
    bool _3138 = _3136 || _3090;
    if (_2992)
    {
        float _3140 = fma(_3082, _3134, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3122 = _3140;
    }
    float _3142 = _3122;
    int _3144 = _3088 + 48;
    uint _3146 = uint(int(uint(_3144) >> uint(2)));
    uint _3148 = uint(int(uint(int(_3146)) >> uint(2)));
    int _3150 = int(_3146) & 3;
    float _3152 = (*spvDescriptorSet0.vp_c15)._m0[int(_3148)][_3150];
    int _3154 = int(_3146) + 1;
    uint _3156 = uint(int(uint(_3154) >> uint(2)));
    int _3158 = _3154 & 3;
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[int(_3156)][_3158];
    float _3162 = fma(_1049, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _3164 = _3074 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3166 = _3164 || _3138;
    if (_2992)
    {
        float _3168 = _3060 * _3142;
        _2554 = _3168;
    }
    float _3170 = _2554;
    float _3172 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3174 = floor(_3162);
    if (_2992)
    {
        float _3176 = _2958 * _3170;
        _3028 = _3176;
    }
    float _3178 = _3028;
    int _3180 = _3088 + 104;
    uint _3182 = uint(int(uint(_3180) >> uint(2)));
    uint _3184 = uint(int(uint(int(_3182)) >> uint(2)));
    int _3186 = int(_3182) & 3;
    float _3188 = (*spvDescriptorSet0.vp_c15)._m0[int(_3184)][_3186];
    int _3190 = int(_3182) + 1;
    uint _3192 = uint(int(uint(_3190) >> uint(2)));
    int _3194 = _3190 & 3;
    float _3196 = (*spvDescriptorSet0.vp_c15)._m0[int(_3192)][_3194];
    float _3198 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3172);
    float _3200 = _3130;
    if (_2992)
    {
        float _3202 = _3130 + (-1.0);
        _2822 = _3202;
    }
    float _3204 = _2822;
    float _3206 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3198);
    float _3208 = _3204;
    if (_2992)
    {
        float _3210 = _3204 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2824 = _3210;
    }
    float _3212 = _2824;
    if (!_2992)
    {
        _3208 = _2956;
    }
    float _3214 = _3208;
    int _3216 = _3088 + 64;
    uint _3218 = uint(int(uint(_3216) >> uint(2)));
    uint _3220 = uint(int(uint(int(_3218)) >> uint(2)));
    int _3222 = int(_3218) & 3;
    float _3224 = (*spvDescriptorSet0.vp_c15)._m0[int(_3220)][_3222];
    int _3226 = int(_3218) + 1;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    int _3230 = _3226 & 3;
    float _3232 = (*spvDescriptorSet0.vp_c15)._m0[int(_3228)][_3230];
    float _3234 = _3214;
    if (_2992)
    {
        float _3236 = _2956 * _3170;
        _3234 = _3236;
    }
    float _3238 = _3234;
    if (_2992)
    {
        float _3240 = fma(_3096, _3130, _3212);
        _3124 = _3240;
    }
    float _3242 = _3124;
    if (!_2992)
    {
        _3200 = _2962;
    }
    float _3244 = _3200;
    float _3246 = _3244;
    if (_2992)
    {
        float _3248 = _3178 * _3178;
        _3246 = _3248;
    }
    float _3250 = _3246;
    if (_2992)
    {
        float _3252 = _3238 * _3238;
        _3030 = _3252;
    }
    float _3254 = _3030;
    float _3256 = _3206 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_3166)
    {
        float _3258 = floor(_3004);
        _2344 = _3258;
    }
    float _3260 = _2344;
    int _3262 = _3088 + 56;
    uint _3264 = uint(int(uint(_3262) >> uint(2)));
    uint _3266 = uint(int(uint(int(_3264)) >> uint(2)));
    int _3268 = int(_3264) & 3;
    float _3270 = (*spvDescriptorSet0.vp_c15)._m0[int(_3266)][_3268];
    int _3272 = int(_3264) + 1;
    uint _3274 = uint(int(uint(_3272) >> uint(2)));
    int _3276 = _3272 & 3;
    float _3278 = (*spvDescriptorSet0.vp_c15)._m0[int(_3274)][_3276];
    float _3280 = fma(_3242, _3242, _3254);
    float _3282 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3284 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3286 = -_3174;
    float _3288 = _3162 + _3286;
    float _3290 = _3280 + _3250;
    float _3292 = -_3284;
    float _3294 = fma(_3292, _3282, 1.0);
    int _3296 = _3088 + 80;
    uint _3298 = uint(int(uint(_3296) >> uint(2)));
    uint _3300 = uint(int(uint(int(_3298)) >> uint(2)));
    int _3302 = int(_3298) & 3;
    float _3304 = (*spvDescriptorSet0.vp_c15)._m0[int(_3300)][_3302];
    int _3306 = int(_3298) + 1;
    uint _3308 = uint(int(uint(_3306) >> uint(2)));
    int _3310 = _3306 & 3;
    float _3312 = (*spvDescriptorSet0.vp_c15)._m0[int(_3308)][_3310];
    int _3314 = as_type<int>(_3284);
    if (!_3166)
    {
        int _3316 = _3074 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3318 = _3316 + _3050;
        _3314 = _3318;
    }
    int _3320 = _3314;
    float _3322 = rsqrt(_3290);
    int _3324 = _3088 + 72;
    uint _3326 = uint(int(uint(_3324) >> uint(2)));
    uint _3328 = uint(int(uint(int(_3326)) >> uint(2)));
    int _3330 = int(_3326) & 3;
    float _3332 = (*spvDescriptorSet0.vp_c15)._m0[int(_3328)][_3330];
    int _3334 = int(_3326) + 1;
    uint _3336 = uint(int(uint(_3334) >> uint(2)));
    int _3338 = _3334 & 3;
    float _3340 = (*spvDescriptorSet0.vp_c15)._m0[int(_3336)][_3338];
    float _3342 = _2978 * _3114;
    float _3344 = log2(_3294);
    float _3346 = fma(_1047, _3106, _3342);
    int _3348 = _3088 + 88;
    uint _3350 = uint(int(uint(_3348) >> uint(2)));
    uint _3352 = uint(int(uint(int(_3350)) >> uint(2)));
    int _3354 = int(_3350) & 3;
    float _3356 = (*spvDescriptorSet0.vp_c15)._m0[int(_3352)][_3354];
    int _3358 = int(_3350) + 1;
    uint _3360 = uint(int(uint(_3358) >> uint(2)));
    int _3362 = _3358 & 3;
    float _3364 = (*spvDescriptorSet0.vp_c15)._m0[int(_3360)][_3362];
    float _3366 = _2978 * _3160;
    float _3368 = _3322 * _3238;
    float _3370 = _3322 * _3242;
    float _3372 = fma(_1047, _3152, _3366);
    int _3374 = as_type<int>(_3366);
    float _3376 = _3372;
    if (!_3166)
    {
        int _3378 = _3320 << 2;
        _3374 = _3378;
    }
    int _3380 = _3374;
    float _3382 = _3368 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3384 = fma(_1049, _3188, _3346);
    float _3386 = _3322 * _3178;
    int _3388 = _3380;
    float _3390 = _3232;
    if (!_3166)
    {
        int _3392 = 12 & _3380;
        _3388 = _3392;
    }
    int _3394 = _3388;
    float _3396 = _3384 + _3196;
    float _3398 = -_3382;
    float _3400 = fma(_3370, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3398);
    float _3402 = _3344 * 0.693147182464599609375;
    float _3404 = _2978 * _3232;
    int _3406 = _3394;
    if (!_3166)
    {
        float _3408 = -_3260;
        float _3410 = _3004 + _3408;
        _3390 = _3410;
    }
    float _3412 = _3390;
    float _3414 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3416 = fma(_2954, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3414);
    float _3418 = precise::clamp(_3416, 0.0, 1.0);
    float _3420 = 1.0 / _3396;
    float _3422 = fma(_1047, _3224, _3404);
    float _3424 = -_3418;
    float _3426 = _3424 + 1.0;
    float _3428 = fma(_1049, _3270, _3372);
    float _3430 = _3418;
    if (!_3166)
    {
        float _3432 = floor(_3000);
        _3376 = _3432;
    }
    float _3434 = _3376;
    float _3436 = _3428 + _3278;
    float _3438 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3440 = _2978 * _3312;
    int _3442 = as_type<int>(_3312);
    if (!_3166)
    {
        uint _3444 = uint(int(uint(_3320) >> uint(2)));
        _3442 = int(_3444);
    }
    int _3446 = _3442;
    float _3448 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3438);
    float _3450 = abs(_3426);
    float _3452 = log2(_3450);
    float _3454 = fma(_1047, _3304, _3440);
    if (!_3166)
    {
        int _3456 = _3446 << 4;
        int _3458 = _3456 + _3394;
        _3406 = _3458;
    }
    int _3460 = _3406;
    float _3462 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3448);
    float _3464 = fma(_1049, _3332, _3422);
    float _3466 = -_3386;
    float _3468 = fma(_3466, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3400);
    float _3470 = _3382;
    if (!_3166)
    {
        int _3472 = _3460 + 400;
        uint _3474 = uint(int(uint(_3472) >> uint(2)));
        uint _3476 = uint(int(uint(int(_3474)) >> uint(2)));
        int _3478 = int(_3474) & 3;
        float _3480 = (*spvDescriptorSet0.vp_c15)._m0[int(_3476)][_3478];
        _3470 = _3480;
    }
    float _3482 = _3470;
    float _3484 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3486 = _3464 + _3340;
    float _3488 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float2 _9355 = float2(_3038, _3288);
    float _3490 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9355, float2(0.0), isnan(_9355)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9355, float2(0.0), isnan(_9355)), level(0.0)).x;
    float _3492 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3484);
    float _3494 = _3462 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3496 = _3436 * _3420;
    float _3498 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3488);
    float _3500 = fma(_1049, _3356, _3454);
    float _3502 = fma(_3468, -0.5, 0.5);
    float _3504 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _3506 = _3496 >= 0.0;
    float _3508 = _3486 * _3420;
    float _3510 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3498);
    float _3512 = exp2(_3504);
    bool _3514 = _3496 <= 1.0;
    bool _3516 = _3514 && _3506;
    float _3518 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3492);
    float _3520 = _3510 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3522 = _3494 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3524 = _3508 >= 0.0;
    bool _3526 = _3524 && _3516;
    float _3528 = _3518 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3530 = fma(_3468, 0.5, 0.5);
    float _3532 = sqrt(_3502);
    bool _3534 = _3508 <= 1.0;
    bool _3536 = _3534 && _3526;
    float _3538 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3522);
    float _3540 = _3500 + _3364;
    float _3542 = _3370 + 1.0;
    float _3544 = fma(_3530, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3546 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3538);
    float _3548 = _3494 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3550 = -_3370;
    float _3552 = fma(_3512, _3542, _3550);
    float _3554 = _3494 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3556 = fma(_3528, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3546);
    float _3558 = fma(_3530, _3544, -0.212114393711090087890625);
    float _3560 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3548);
    float _3562 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3554);
    float _3564 = 1.0 / _3556;
    float _3566 = fma(_3530, _3558, 1.570728778839111328125);
    float _3568 = _3532 * 0.636619746685028076171875;
    float _3570 = _3532;
    float _3572 = _3556;
    if (_3536)
    {
        float _3574 = float(_3084);
        _3570 = _3574;
    }
    float _3576 = _3570;
    float _3578 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3560);
    float _3580 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3562);
    float _3582 = -_3566;
    float _3584 = fma(_3568, _3582, 1.0);
    float _3586 = _3402 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3588 = fma(_3528, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3578);
    float _3590 = _3576;
    if (_3536)
    {
        float _3592 = rint(_3576);
        float _3594 = precise::max(_3592, 0.0);
        uint _3596 = uint(_3594);
        uint _3598 = clamp(_3596, 0u, 65535u);
        _3590 = as_type<float>(_3598);
    }
    float _3600 = _3590;
    float _3602 = fma(_3528, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3580);
    float _3604 = _3540 * _3420;
    float _3606 = fma(_3552, 0.5, 0.5);
    float _3608 = _3602;
    if (!_3166)
    {
        float _3610 = -_3434;
        float _3612 = _3000 + _3610;
        _3430 = _3612;
    }
    float _3614 = _3430;
    float _3616 = _3588 * _3564;
    float _3618 = _3402;
    if (!_3166)
    {
        float _3620 = rint(_3482);
        float _3622 = precise::max(_3620, 0.0);
        uint _3624 = uint(_3622);
        uint _3626 = clamp(_3624, 0u, 65535u);
        _3618 = as_type<float>(_3626);
    }
    float _3628 = _3618;
    float _3630 = _3602 * _3564;
    float _3632 = fma(_3616, 0.5, 0.5);
    float _3634 = fma(_3630, -0.5, 0.5);
    float _3636 = _3600;
    if (_3536)
    {
        float3 _9603 = float3(_3496, _3508, float(as_type<int>(_3600)));
        float3 _9607 = select(_9603, float3(0.0), isnan(_9603));
        float _3638 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9607.xy, uint(rint(_9607.z)), _3604, level(0.0));
        _3636 = _3638;
    }
    float _3640 = _3636;
    float3 _9617 = float3(_3632, _3634, _3586);
    float _3642 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9617, float3(0.0), isnan(_9617)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9617, float3(0.0), isnan(_9617)), level(0.0)).x;
    float3 _9626 = float3(_3632, _3634, _3586);
    float4 _3645 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9626, float3(0.0), isnan(_9626)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9626, float3(0.0), isnan(_9626)), level(0.0)).xyzw;
    float _3647 = _3645.x;
    float _3649 = _3645.y;
    float _3651 = _3645.z;
    float _3653 = _3645.w;
    float2 _9642 = float2(_3584, _3606);
    float3 _3655 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9642, float2(0.0), isnan(_9642)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9642, float2(0.0), isnan(_9642)), level(0.0)).xyz;
    float _3657 = _3655.x;
    float _3659 = _3655.y;
    float _3661 = _3655.z;
    float _3663 = _3412;
    if (!_3166)
    {
        float3 _9663 = float3(_3614, _3412, float(as_type<int>(_3628)));
        float3 _9665 = select(_9663, float3(0.0), isnan(_9663));
        float _3665 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9665.xy, uint(rint(_9665.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9665.xy, uint(rint(_9665.z)), level(0.0)).x;
        _3663 = _3665;
    }
    float _3667 = _3663;
    float _3669 = abs(_3008);
    float _3671 = log2(_3669);
    float _3673 = _3494 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3675 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3677 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3673);
    float _3679 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3677);
    float _3681 = exp2(_3675);
    bool _3683 = _3008 <= 8000.0;
    bool _3685 = isnan(_3008);
    bool _3687 = _3683 || _3685;
    bool _3689 = isnan(8000.0);
    bool _3691 = _3687 || _3689;
    float _3693 = float(_3691);
    float _3695 = fma(_3528, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3679);
    float _3697 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3588;
    out.gl_Position.y = _3602;
    out.gl_Position.z = _3695;
    out.gl_Position.w = _3556;
    float _3699 = exp2(_3697);
    float _3701 = fma(_3699, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3703 = precise::clamp(_3701, 0.0, 1.0);
    float _3705 = fma(_3703, -2.0, 3.0);
    float _3707 = _3703 * _3703;
    float _3709 = _3707 * _3705;
    float _3711 = -_3709;
    float _3713 = _3711 + 1.0;
    float _3715 = fma(_3713, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3709);
    float _3717 = -_3681;
    float _3719 = _3717 + 1.0;
    float _3721 = _3693 * _3715;
    float _3723 = _3715;
    float _3725 = _3695;
    if (!_3536)
    {
        _3723 = 1.0;
    }
    float _3727 = _3723;
    float _3729 = _3721 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3731 = -_3490;
    float _3733 = _3731 + 1.0;
    float _3735 = _3733 * _3729;
    float _3737 = precise::clamp(_3735, 0.0, 1.0);
    float _3739 = _3729;
    float _3741 = _3727;
    if (_3166)
    {
        _3739 = 1.0;
    }
    float _3743 = _3739;
    float _3745 = _3743;
    if (_3536)
    {
        bool _3747 = _3640 >= _3604;
        bool _3749 = isnan(_3640);
        bool _3751 = _3747 || _3749;
        bool _3753 = isnan(_3604);
        bool _3755 = _3751 || _3753;
        float _3757 = float(_3755);
        _3741 = _3757;
    }
    float _3759 = _3741;
    float _3761 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3763 = _3759;
    if (!_3166)
    {
        int _3765 = _3320 << 4;
        int _3767 = _3765 + 2048;
        uint _3769 = uint(int(uint(_3767) >> uint(2)));
        uint _3771 = uint(int(uint(int(_3769)) >> uint(2)));
        int _3773 = int(_3769) & 3;
        float _3775 = (*spvDescriptorSet0.vp_c15)._m0[int(_3771)][_3773];
        int _3777 = int(_3769) + 1;
        uint _3779 = uint(int(uint(_3777) >> uint(2)));
        int _3781 = _3777 & 3;
        float _3783 = (*spvDescriptorSet0.vp_c15)._m0[int(_3779)][_3781];
        int _3785 = _3767 + 8;
        uint _3787 = uint(int(uint(_3785) >> uint(2)));
        uint _3789 = uint(int(uint(int(_3787)) >> uint(2)));
        int _3791 = int(_3787) & 3;
        float _3793 = (*spvDescriptorSet0.vp_c15)._m0[int(_3789)][_3791];
        int _3795 = int(_3787) + 1;
        uint _3797 = uint(int(uint(_3795) >> uint(2)));
        int _3799 = _3795 & 3;
        float _3801 = (*spvDescriptorSet0.vp_c15)._m0[int(_3797)][_3799];
        float _3803 = _2978 * _3783;
        float _3805 = fma(_1047, _3775, _3803);
        float _3807 = fma(_1049, _3793, _3805);
        float _3809 = _3807 + _3801;
        float _3811 = precise::clamp(_3809, 0.0, 1.0);
        float _3813 = -_3811;
        float _3815 = _3813 + _3667;
        float _3817 = fma(_3815, 500.0, 1.5);
        float _3819 = exp2(_3817);
        float _3821 = 0.0 + _3819;
        float _3823 = precise::clamp(_3821, 0.0, 1.0);
        _3745 = _3823;
        _3572 = _3801;
        _3608 = _3783;
        _3725 = _3793;
    }
    float _3825 = _3745;
    float _3827 = _3572;
    float _3829 = _3608;
    float _3831 = _3725;
    float _3833 = _3759 * _3825;
    float _3835 = _3761 * _3642;
    float _3837 = -_3737;
    float _3839 = fma(_3837, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3841 = -_3761;
    float _3843 = _3841 + 1.0;
    out.m_98.x = _2908;
    out.m_98.y = _2906;
    out.m_98.z = _2910;
    float _3845 = _3653 * _3835;
    float _3847 = -_3833;
    float _3849 = fma(_3847, _3839, 1.0);
    float _3851 = precise::clamp(_3849, 0.0, 1.0);
    float _3853 = _3661 * _3835;
    float _3855 = _3653 * _3843;
    float _3857 = fma(_3657, _3845, _3647);
    float _3859 = fma(_3659, _3845, _3649);
    float _3861 = _3851 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3863 = fma(_3653, _3853, _3651);
    bool _3865 = _2954 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3867 = isnan(_2954);
    bool _3869 = _3865 || _3867;
    bool _3871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3873 = _3869 || _3871;
    out.m_100.x = _3861;
    out.m_102.x = _3857;
    out.m_102.y = _3859;
    out.m_102.z = _3863;
    out.m_102.w = _3855;
    float _3875 = _3827;
    float _3877 = _3831;
    float _3879 = _3829;
    float _3881 = _3845;
    float _3883 = _3851;
    if (!_3873)
    {
        _3763 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3885 = _3763;
    float _3887 = _3885;
    float _3889 = _3885;
    if (!_3873)
    {
        _3875 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3891 = _3875;
    float _3893 = _3891;
    float _3895 = _3891;
    if (!_3873)
    {
        _3877 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3897 = _3877;
    float _3899 = _3897;
    float _3901 = _3897;
    if (!_3873)
    {
        _3879 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3903 = _3879;
    float _3905 = _3903;
    float _3907 = _3903;
    if (!_3873)
    {
        _3881 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3909 = _3881;
    float _3911 = _3909;
    float _3913 = _3909;
    if (!_3873)
    {
        _3883 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3915 = _3883;
    bool _3917 = !_3873;
    float _3919 = _3915;
    float _3921 = _3915;
    if (!_3917)
    {
        bool _3923 = _2954 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3925 = isnan(_2954);
        bool _3927 = _3923 || _3925;
        bool _3929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3931 = _3927 || _3929;
        if (!_3931)
        {
            float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3935 = _2954 + _3933;
            float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3939 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3937;
            float _3941 = 1.0 / _3939;
            float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3949 = _3947 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3955 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3957 = _3955 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3963 = _3935 * _3941;
            float _3965 = precise::clamp(_3963, 0.0, 1.0);
            float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3971 = fma(_3965, _3945, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3973 = fma(_3965, _3969, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3975 = fma(_3965, _3949, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3977 = fma(_3965, _3953, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3979 = fma(_3965, _3957, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3981 = fma(_3965, _3961, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3895 = _3973;
            _3913 = _3979;
            _3889 = _3971;
            _3907 = _3977;
            _3901 = _3975;
            _3921 = _3981;
            _3983 = true;
        }
        else
        {
            bool _3985 = _2954 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3987 = isnan(_2954);
            bool _3989 = _3985 || _3987;
            bool _3991 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3993 = _3989 || _3991;
            if (!_3993)
            {
                _3887 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3995 = _3887;
            _3889 = _3995;
            if (!_3993)
            {
                _3893 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3997 = _3893;
            _3895 = _3997;
            if (!_3993)
            {
                _3899 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3999 = _3899;
            _3901 = _3999;
            if (!_3993)
            {
                _3905 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4001 = _3905;
            _3907 = _4001;
            if (!_3993)
            {
                _3911 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4003 = _3911;
            _3913 = _4003;
            if (!_3993)
            {
                _3919 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4005 = _3919;
            bool _4007 = !_3993;
            _3921 = _4005;
            if (!_4007)
            {
                bool _4009 = _2954 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4011 = isnan(_2954);
                bool _4013 = _4009 || _4011;
                bool _4015 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4017 = _4013 || _4015;
                if (!_4017)
                {
                    float _4019 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4021 = _2954 + _4019;
                    float _4023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4025 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4023;
                    float _4027 = 1.0 / _4025;
                    float _4029 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4033 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4037 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4039 = _4037 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4041 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4043 = _4041 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4047 = _4045 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4049 = _4021 * _4027;
                    float _4051 = precise::clamp(_4049, 0.0, 1.0);
                    float _4053 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4057 = fma(_4051, _4031, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4059 = fma(_4051, _4055, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4061 = fma(_4051, _4035, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4063 = fma(_4051, _4039, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4065 = fma(_4051, _4043, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4067 = fma(_4051, _4047, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3895 = _4059;
                    _3913 = _4065;
                    _3889 = _4057;
                    _3907 = _4063;
                    _3901 = _4061;
                    _3921 = _4067;
                    _3983 = true;
                }
                else
                {
                    _3895 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3913 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3889 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3907 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3901 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3921 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3983 = false;
    float _4069 = _3895;
    float _4071 = _3913;
    float _4073 = _3889;
    float _4075 = _3907;
    float _4077 = _3901;
    float _4079 = _3921;
    float _4081 = fma(_2750, -0.5, 0.5);
    float _4083 = precise::clamp(_4081, 0.0, 1.0);
    float _4085 = -_4069;
    float _4087 = _4085 + _4071;
    float _4089 = -_4073;
    float _4091 = _4089 + _4075;
    float _4093 = -_4077;
    float _4095 = _4093 + _4079;
    bool _4097 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4099 = fma(_4083, _4087, _4069);
    float _4101 = fma(_4083, _4091, _4073);
    float _4103 = fma(_4083, _4095, _4077);
    float _4105 = _4099 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _4107 = fma(_4101, 0.298911988735198974609375, _4105);
    float _4109 = fma(_4103, 0.114477999508380889892578125, _4107);
    out.m_104.x = 0.0;
    float _4111 = -_4109;
    float _4113 = _4101 + _4111;
    float _4115 = -_4109;
    float _4117 = _4099 + _4115;
    float _4119 = -_4109;
    float _4121 = _4103 + _4119;
    float _4123 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4125 = fma(_4113, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4109);
    float _4127 = fma(_4117, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4109);
    float _4129 = fma(_4121, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4109);
    out.m_100.w = _4123;
    out.m_106.x = _4125;
    out.m_106.y = _4127;
    out.m_106.z = _4129;
    if (!_4097)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4131 = -_2906;
    float _4133 = _4131 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4135 = -_2908;
    float _4137 = _4135 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4139 = -_2910;
    float _4141 = _4139 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4143 = _4133 * _4133;
    float _4145 = fma(_4137, _4137, _4143);
    float _4147 = fma(_4141, _4141, _4145);
    float _4149 = sqrt(_4147);
    float _4151 = rsqrt(_4147);
    float _4153 = -_4149;
    float _4155 = _4153 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4157 = _4155 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4159 = precise::clamp(_4157, 0.0, 1.0);
    float _4161 = _4137 * _4151;
    float _4163 = _4133 * _4151;
    float _4165 = abs(_4159);
    float _4167 = log2(_4165);
    float _4169 = _4141 * _4151;
    float _4171 = _4161 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4173 = _2750 * _4163;
    float _4175 = -_4163;
    float _4177 = -_4171;
    float _4179 = fma(_4175, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4177);
    float _4181 = fma(_2792, _4161, _4173);
    float _4183 = -_4169;
    float _4185 = fma(_4183, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4179);
    float _4187 = fma(_2808, _4169, _4181);
    float _4189 = precise::clamp(_4187, 0.0, 1.0);
    float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4193 = _4185 + _4191;
    float _4195 = _4167 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4197 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4199 = precise::clamp(_4197, 0.0, 1.0);
    float _4201 = exp2(_4195);
    float _4203 = _4201 * _4199;
    float _4205 = _4189 * _4203;
    float _4207 = _4205 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4209 = _4205 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4211 = _4205 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_104.x = _4207;
    out.m_104.y = _4209;
    out.m_104.z = _4211;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3983 = false;
    bool _2860 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_60.w;
    float _122 = trunc(_120);
    int _125 = int(_122);
    bool _129 = _125 >= 1;
    float _131 = 0.0;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    float _135 = _133;
    if (!_129)
    {
        out.m_63.x = 0.0;
    }
    int _137 = 0;
    if (!_129)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4268 = as_type<float>(_141);
        out.gl_Position.z = _4268;
    }
    if (!_129)
    {
        return out;
    }
    float _145 = in.m_65.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = 0.0;
    float _163 = _159;
    if (_155)
    {
        float _165 = float(_125);
        _161 = _165;
    }
    float _167 = _161;
    bool _169 = _159 >= _167;
    bool _171 = !_155;
    bool _173 = _169 || _171;
    if (_173)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _135;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    if (_173)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4337 = as_type<float>(_179);
        out.gl_Position.z = _4337;
    }
    if (_173)
    {
        return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _185 = as_type<int>(_181) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_181) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    float _219;
    if (!_201)
    {
        float _203 = in.m_70.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        float _223 = float(_125);
        float _225 = 1.0 / _223;
        float _227 = _159 * _225;
        _219 = _227;
    }
    _221 = false;
    float _229 = _219;
    float _231 = in.m_70.x;
    float _233 = in.m_70.y;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = _229 + _235;
    float _239 = in.m_70.z;
    float _241 = in.m_70.w;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _253 = 1.0 / _245;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _255;
    int _259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _261 = _259 != 0;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _265 = 1.0 / _249;
    float _267 = _231 * 2.0;
    float _269 = _233 * 2.0;
    float _271 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _273 = 1.0 / _257;
    float _275 = _239 * 2.0;
    float _277 = -_251;
    float _279 = fma(_271, 2.0, _277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = _229 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = floor(_267);
    float _291 = _283 * _253;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _229 + _293;
    int _297 = as_type<int>(_253);
    float _299 = _291;
    if (_261)
    {
        _297 = 0;
    }
    int _301 = _297;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _303;
    int _307 = _301;
    if (!_261)
    {
        _307 = 1;
    }
    int _309 = _307;
    float _311 = _295 * _265;
    float _313 = _231 + _233;
    float _315 = floor(_269);
    float _317 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _319 = _237 * _273;
    float _321 = _313 + (-1.0);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _327 = fma(_317, -2.0, _263);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _333 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _335 = _289 > 0.0;
    float _337 = floor(_275);
    bool _339 = _289 >= 0.0;
    bool _341 = isnan(_289);
    bool _343 = _339 || _341;
    bool _345 = isnan(0.0);
    bool _347 = _343 || _345;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _351 = fma(_325, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _353 = _347 ? 0 : 1;
    float _355 = fma(_331, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _357 = _315 > 0.0;
    float _359 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _361 = int(_359);
    bool _363 = _315 >= 0.0;
    bool _365 = isnan(_315);
    bool _367 = _363 || _365;
    bool _369 = isnan(0.0);
    bool _371 = _367 || _369;
    float _373 = fma(_287, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _375 = ~_353;
    int _377 = _375 + 1;
    int _379 = _377 + 1;
    float _381 = fma(_305, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _383 = _371 ? 0 : 1;
    float _385 = -_159;
    float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[76].x, _279);
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _391 = _389 != 0;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _395 = _393 != 0;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _399 = _397 != 0;
    float _401 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _403 = int(_401);
    int _405 = _379;
    float _407 = _311;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    if (!_335)
    {
        int _411 = ~_353;
        int _413 = _411 + 1;
        _405 = _413;
    }
    int _415 = _405;
    float _417 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _327);
    bool _419 = _233 > 0.5;
    bool _421 = _239 > 0.5;
    int _423 = ~_383;
    int _425 = _423 + 1;
    int _427 = _425 + 1;
    bool _429 = !_395;
    int _431 = _429 ? 0 : 1;
    bool _433 = !_391;
    int _435 = _433 ? 0 : 1;
    int _437 = _427;
    if (!_357)
    {
        int _439 = ~_383;
        int _441 = _439 + 1;
        _437 = _441;
    }
    int _443 = _437;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _451 = _449 != 0;
    float _453 = -_195;
    int _455 = _419 ? as_type<int>(_453) : as_type<int>(_195);
    float _457 = -_199;
    int _459 = _421 ? as_type<int>(_457) : as_type<int>(_199);
    bool _461 = !_399;
    int _463 = _461 ? 0 : 1;
    bool _465 = !_447;
    float _467 = _465 ? _195 : as_type<float>(_455);
    bool _469 = !_451;
    float _471 = _469 ? _199 : as_type<float>(_459);
    float _473 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _475 = int(_473);
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _487 = _485 != 0;
    int _489 = int(_261);
    int _491 = _419 ? 2 : 0;
    int _493 = _489 | _491;
    int _495 = _357 ? 4 : 0;
    int _497 = _493 | _495;
    int _499 = _421 ? 8 : 0;
    int _501 = _497 | _499;
    int _503 = _479 ? 16 : 0;
    int _505 = _501 | _503;
    int _507 = _483 ? 32 : 0;
    int _509 = _505 | _507;
    int _511 = _487 ? 64 : 0;
    int _513 = _509 | _511;
    int _515 = _513 & 2;
    bool _517 = _309 != 1;
    float _519 = _233 + _239;
    bool _521 = _337 >= 0.0;
    bool _523 = isnan(_337);
    bool _525 = _521 || _523;
    bool _527 = isnan(0.0);
    bool _529 = _525 || _527;
    float _531 = _519 + (-1.0);
    int _533 = _529 ? 0 : 1;
    bool _535 = _337 > 0.0;
    float _537 = _231 + _239;
    float _539 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _541 = !_483;
    int _543 = _541 ? 0 : 1;
    float _545 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _547 = int(_545);
    float _549 = _537 + (-1.0);
    if (!_517)
    {
        _407 = _233;
    }
    float _551 = _407;
    float _553 = _537;
    float _555 = _551;
    if (!_517)
    {
        float _557 = in.m_70.z;
        _553 = _557;
    }
    float _559 = _553;
    if (_517)
    {
        _555 = _231;
    }
    float _561 = _555;
    float _563 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _565 = ~_533;
    int _567 = _565 + 1;
    int _569 = _567 + 1;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _573 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _575 = log2(_573);
    int _577 = _569;
    if (!_535)
    {
        int _579 = ~_533;
        int _581 = _579 + 1;
        _577 = _581;
    }
    int _583 = _577;
    float _585 = _561 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _587 = _239 + (-0.5);
    float _589 = -_571;
    float _591 = fma(_585, 2.0, _589);
    int _593 = abs(_543);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_517)
    {
        _299 = _233;
    }
    float _597 = _299;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _601 = _597;
    if (_517)
    {
        _601 = _231;
    }
    float _603 = _601;
    float _605 = float(_415);
    float _607 = float(_583);
    float _609 = _575 * _159;
    float _611 = float(_593);
    float _613 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[83].z, _595);
    float _615 = _559;
    if (!_517)
    {
        _409 = _559;
    }
    float _617 = _409;
    float _619 = _617;
    if (_517)
    {
        _615 = _233;
    }
    float _621 = _615;
    float _623 = _611 * _605;
    if (_517)
    {
        _619 = _233;
    }
    float _625 = _619;
    float _627 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _613);
    float _629 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[83].w, _349);
    bool _631 = !_479;
    int _633 = _631 ? 0 : 1;
    float _635 = _625 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _637 = !_487;
    int _639 = _637 ? 0 : 1;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _643 = 1.0 + _641;
    int _645 = abs(_633);
    float _647 = fma(_635, -2.0, _599);
    float _649 = float(_361);
    float _651 = exp2(_609);
    float _653 = float(_645);
    float _655 = _623 * (-2.0);
    float _657 = float(_547);
    float _659 = float(_443);
    float _661 = _653 * _607;
    int _663 = abs(_639);
    float _665 = in.m_72.x;
    float _667 = in.m_72.y;
    float _669 = in.m_72.z;
    float _671 = 1.0 / _649;
    float _673 = float(_663);
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _677 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _679 = isnan(1.0);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _685 = _681 || _683;
    float _687 = _673 * _659;
    float _689 = -_651;
    float _691 = _689 + 1.0;
    float _693 = 1.0 / _657;
    float _695 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].z, _675);
    bool _697 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _699 = isnan(0.0);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _705 = _701 || _703;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _709 = float(_475);
    float _711 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _695);
    float _713 = float(_403);
    float _715 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _707);
    float _717 = 1.0 / _643;
    float _719 = _705 ? _691 : 0.0;
    float _721 = _709 * _159;
    float _723 = _713 * _159;
    float _725 = _671 * _159;
    float _727 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _715);
    float _729 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _629);
    float _731 = _231 + (-0.5);
    float _733 = _693 * _159;
    float _735 = -_159;
    float _737 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[81].x, _591);
    float _739 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _647);
    float _741 = _661 * (-2.0);
    bool _743 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _745 = isnan(_229);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = _233 + (-0.5);
    bool _757 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _759 = isnan(_229);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = fma(_741, _665, _665);
    float _771 = fma(_333, _741, _333);
    if (_685)
    {
        float _773 = _719 * _717;
        _163 = _773;
    }
    float _775 = _163;
    bool _777 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _779 = isnan(_229);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -_753;
    float _791 = _789 + 1.0;
    float _793 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[196].x, _769);
    bool _795 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _797 = isnan(_229);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = fma(_539, _655, _539);
    float _809 = _787 * _791;
    float _811 = -_787;
    float _813 = _811 + 1.0;
    float _815 = fma(_655, _667, _667);
    float _817 = fma(_771, _775, _793);
    float _819 = _687 * (-2.0);
    float _821 = _805 * _813;
    float _823 = -_805;
    float _825 = _823 + 1.0;
    float _827 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[196].y, _815);
    float _829 = fma(_819, _669, _669);
    float _831 = in.m_74.x;
    float _833 = in.m_74.y;
    float _835 = _767 * _825;
    float _837 = fma(_563, _819, _563);
    float _839 = fma(_807, _775, _827);
    float _841 = _381 * _835;
    float _843 = -_767;
    float _845 = _843 + 1.0;
    float _847 = _373 * _835;
    float _849 = _817 * 0.15915493667125701904296875;
    float _851 = _839 * 0.15915493667125701904296875;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _853;
    float _857 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[143].y, _841);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _859;
    float _863 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[143].x, _847);
    float _865 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[196].z, _829);
    float _867 = _849 * 6.283185482025146484375;
    float _869 = sin(_867);
    float _871 = in.m_60.x;
    float _873 = in.m_60.y;
    float _875 = in.m_60.z;
    float _877 = fma(_355, _821, _857);
    float _879 = fma(_351, _821, _863);
    float _881 = fma(_837, _775, _865);
    float _883 = in.m_76.x;
    float _885 = in.m_76.y;
    float _887 = in.m_76.z;
    float _889 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    int _891 = int(_261);
    int _893 = _705 ? 2 : 0;
    int _895 = _891 | _893;
    int _897 = _685 ? 4 : 0;
    int _899 = _895 | _897;
    int _901 = _421 ? 8 : 0;
    int _903 = _899 | _901;
    int _905 = _479 ? 16 : 0;
    int _907 = _903 | _905;
    int _909 = _483 ? 32 : 0;
    int _911 = _907 | _909;
    int _913 = _487 ? 64 : 0;
    int _915 = _911 | _913;
    int _917 = _915 & 8;
    float _919 = _849 * 6.283185482025146484375;
    float _921 = cos(_919);
    float _923 = _881 * 0.15915493667125701904296875;
    float _925 = _851 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = fma(_855, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _931 = fma(_861, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _933 = fma(_929, _809, _879);
    float _935 = fma(_931, _809, _877);
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _939 = _851 * 6.283185482025146484375;
    float _941 = cos(_939);
    float _943 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[146].x, _933);
    float _945 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[146].y, _935);
    float _947 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _949 = _943 * _831;
    float _951 = _945 * _833;
    float _953 = _873 * _885;
    float _955 = _923 * 6.283185482025146484375;
    float _957 = cos(_955);
    float _959 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _961 = _951 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _963 = fma(_871, _883, _953);
    float _965 = in.m_78.x;
    float _967 = in.m_78.y;
    float _969 = in.m_78.z;
    float _971 = _959 * _937;
    float _973 = _961 * _889;
    float _975 = _869 * _927;
    float _977 = _923 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = _921 * _941;
    float _983 = _869 * _941;
    float _985 = _921 * _927;
    float _987 = fma(_875, _887, _963);
    float _989 = _921 * _957;
    float _991 = _941 * _957;
    float _993 = _869 * _957;
    float _995 = _927 * _957;
    float _997 = _989 * _973;
    float _999 = fma(_979, _981, _975);
    float _1001 = -_985;
    float _1003 = fma(_979, _983, _1001);
    float _1005 = -_973;
    float _1007 = _979 * _1005;
    float _1009 = -_983;
    float _1011 = fma(_979, _985, _1009);
    float _1013 = fma(_999, _971, _997);
    float _1015 = _993 * _973;
    float _1017 = fma(_991, _971, _1007);
    float _1019 = fma(_979, _975, _981);
    float _1021 = fma(_1011, _947, _1013);
    float _1023 = fma(_1003, _971, _1015);
    float _1025 = fma(_995, _947, _1017);
    float _1027 = _873 * _967;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1031 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1033 = fma(_1019, _947, _1023);
    float _1035 = fma(_871, _965, _1027);
    float _1037 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1029);
    float _1039 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1031);
    float _1041 = fma(_875, _969, _1035);
    float _1043 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1037);
    float _1045 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1039);
    float _1047 = _987 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1049 = _1041 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1051 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1053 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1055 = _1047 + _1051;
    float _1057 = _1049 + _1053;
    float _1059 = in.m_80.x;
    float _1061 = in.m_80.y;
    float _1063 = in.m_80.z;
    float _1065 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1067 = _1055 + _1065;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1071 = _1057 + _1069;
    float _1073 = _1067 * _1067;
    float _1075 = _1071 * _1071;
    float _1077 = _1073 + _1075;
    float _1079 = sqrt(_1077);
    float _1081 = _873 * _1061;
    float _1083 = fma(_871, _1059, _1081);
    bool _1085 = _1079 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1087 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1089 = _1079 + _1087;
    float _1091 = fma(_875, _1063, _1083);
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1095 = 0.0;
    float _1097 = _1077;
    float _1099 = _1079;
    float _1101 = _1021;
    float _1103 = _873;
    float _1105 = _1073;
    float _1107 = _1003;
    if (_1085)
    {
        float _1109 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1095 = _1109;
    }
    float _1111 = _1095;
    if (_1085)
    {
        float _1113 = rsqrt(_1077);
        _1097 = _1113;
    }
    float _1115 = _1097;
    if (_1085)
    {
        float _1117 = _1089 * _1111;
        _1099 = _1117;
    }
    float _1119 = _1099;
    float _1121 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1123 = _1119;
    if (!_1085)
    {
        _1101 = _1055;
    }
    float _1125 = _1101;
    float _1127 = _1125;
    if (_1085)
    {
        float _1129 = _1119 * 0.15915493667125701904296875;
        _1123 = _1129;
    }
    float _1131 = _1123;
    float _1133 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1121);
    float _1135 = _871;
    if (_1085)
    {
        float _1137 = _1131 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        _1135 = _1139;
    }
    float _1141 = _1135;
    float _1143 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1133);
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1147 = _1093 + _1145;
    float _1149 = _1145;
    float _1151 = _1147;
    if (!_1085)
    {
        _1149 = _1057;
    }
    float _1153 = _1149;
    float _1155 = _1153;
    if (_1085)
    {
        float _1157 = _1147 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1103 = _1157;
    }
    float _1159 = _1103;
    float _1161 = _1141;
    if (_1085)
    {
        float _1163 = fma(_1141, _1159, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1161 = _1163;
    }
    float _1165 = _1161;
    float _1167 = _1165;
    if (_1085)
    {
        float _1169 = _1115 * _1165;
        _1167 = _1169;
    }
    float _1171 = _1167;
    if (_1085)
    {
        float _1173 = fma(_1067, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1127 = _1173;
    }
    float _1175 = _1127;
    if (_1085)
    {
        float _1177 = fma(_1071, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1155 = _1177;
    }
    float _1179 = _1155;
    float _1181 = fma(_1175, 6.2500002968590706586837768554688e-05, 0.5);
    float _1183 = fma(_1179, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5869 = float2(_1181, _1183);
    float3 _1187 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5869, float2(0.0), isnan(_5869)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5869, float2(0.0), isnan(_5869)), level(0.0)).xyz;
    float _1189 = _1187.x;
    float _1191 = _1187.y;
    float _1193 = _1187.z;
    float _1195 = float(uint(_475));
    float _1197 = trunc(_725);
    int _1199 = int(_1197);
    float _1201 = float(uint(_403));
    float _1203 = -_471;
    float _1205 = _1203 + 0.5;
    int _1207 = ~_475;
    int _1209 = _1207 + 1;
    float _1211 = -_729;
    float _1213 = _1211 + 1.0;
    int _1215 = ~_475;
    int _1217 = _1215 + 1;
    float _1219 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1221 = _475 == 0;
    float _1223 = 1.0 / _1195;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1227 = _1225 != 0;
    float _1229 = -_727;
    float _1231 = _1229 + 1.0;
    float _1233 = -_627;
    float _1235 = _1233 + 1.0;
    float _1237 = float(uint(_1199));
    float _1239 = 1.0 / _1201;
    int _1241 = as_type<int>(_1223) + (-2);
    float _1243 = trunc(_733);
    int _1245 = int(_1243);
    float _1247 = as_type<float>(_1241) * _1237;
    float _1249 = _1237;
    if (_261)
    {
        _1249 = 1.0;
    }
    float _1251 = _1249;
    float _1253 = _1251;
    if (!_261)
    {
        _1253 = 7.345489978790283203125;
    }
    float _1255 = _1253;
    float _1257 = float(_125);
    float _1259 = trunc(_1247);
    float _1261 = precise::max(_1259, 0.0);
    uint _1264 = uint(_1261);
    float _1266 = _1255 * _231;
    float _1268 = _1255;
    if (_261)
    {
        float _1270 = in.m_70.x;
        _1268 = _1270;
    }
    float _1272 = _1268;
    float _1274 = 1.0 / _1257;
    float _1276 = _1272;
    if (!_261)
    {
        float _1278 = in.m_70.y;
        _1276 = _1278;
    }
    float _1280 = _1276;
    int _1282 = _1209 * int(_1264);
    int _1284 = _1282 + _1199;
    float _1286 = float(uint(_1284));
    float _1288 = float(uint(_1245));
    float _1290 = _721 * _1274;
    float _1292 = _723 * _1274;
    float _1294 = as_type<float>(_1241) * _1286;
    int _1296 = as_type<int>(_1239) + (-2);
    float _1298 = floor(_1266);
    int _1300 = _403 + (-1);
    float _1302 = as_type<float>(_1296) * _1288;
    float _1304 = trunc(_1294);
    float _1306 = precise::max(_1304, 0.0);
    uint _1308 = uint(_1306);
    float _1310 = trunc(_1302);
    float _1312 = precise::max(_1310, 0.0);
    uint _1314 = uint(_1312);
    float _1316 = -_1298;
    float _1318 = _1266 + _1316;
    int _1320 = int(_1264) + int(_1308);
    float _1322 = trunc(_1292);
    int _1324 = int(_1322);
    int _1326 = ~_403;
    int _1328 = _1326 + 1;
    float _1330 = float(_1199);
    int _1332 = _1217 * _1320;
    int _1334 = _1332 + _1199;
    bool _1336 = _1330 >= _709;
    bool _1338 = isnan(_1330);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan(_709);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = _1318 * _709;
    bool _1350 = uint(_1334) >= uint(_475);
    int _1352 = _1328 * int(_1314);
    int _1354 = _1352 + _1245;
    float _1356 = trunc(_1346);
    int _1358 = int(_1356);
    bool _1360 = !_1350;
    int _1362 = _1360 ? 0 : (-1);
    float _1364 = float(uint(_1354));
    int _1366 = ~_1320;
    int _1368 = _1366 + _1362;
    int _1370 = _1368 + 1;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1374 = _1372 != 0;
    float _1376 = as_type<float>(_1296) * _1364;
    float _1378 = trunc(_1348);
    int _1380 = int(_1378);
    int _1382 = _475 * _1370;
    int _1384 = _1382 + _1199;
    bool _1386 = !_1374;
    int _1388 = _1386 ? 0 : 1;
    int _1390 = _475 + (-1);
    int _1392 = abs(_1388);
    float _1394 = trunc(_1376);
    float _1396 = precise::max(_1394, 0.0);
    uint _1398 = uint(_1396);
    int _1400 = ~_1358;
    int _1402 = _1400 + 1;
    int _1404 = _1402 + 1;
    bool _1406 = !_1221;
    int _1408 = _1406 ? _1384 : (-1);
    int _1410 = abs(_431);
    int _1412 = _1408 * _1404;
    float _1414 = trunc(_1290);
    int _1416 = int(_1414);
    float _1418 = _1364;
    if (_261)
    {
        _1418 = 1.0;
    }
    float _1420 = _1418;
    int _1422 = _1380 * _1392;
    int _1424 = _1422 + _1199;
    float _1426 = _1420;
    if (!_261)
    {
        _1426 = 1.2345600128173828125;
    }
    float _1428 = _1426;
    int _1430 = _1358 * _1390;
    int _1432 = _1430 + _1412;
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1436 = _1434 != 0;
    float _1438 = _1428 * _1280;
    int _1440 = int(_1314) + int(_1398);
    int _1442 = _1432 * _1410;
    int _1444 = abs(_435);
    float _1446 = floor(_1438);
    bool _1448 = !_1436;
    int _1450 = _1448 ? 0 : 1;
    int _1452 = abs(_463);
    int _1454 = _1416 * _1444;
    int _1456 = _1454 + _1442;
    int _1458 = abs(_1450);
    int _1460 = ~_403;
    int _1462 = _1460 + 1;
    float _1464 = float(_1245);
    int _1466 = _1424 * _1452;
    int _1468 = _1466 + _1456;
    int _1470 = _1462 * _1440;
    int _1472 = _1470 + _1245;
    bool _1474 = _1464 >= _713;
    bool _1476 = isnan(_1464);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan(_713);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    int _1486 = _1380 * _1458;
    int _1488 = _1486 + _1468;
    float _1490 = -_1446;
    float _1492 = _1438 + _1490;
    float _1494 = trunc(_1484);
    int _1496 = int(_1494);
    bool _1498 = uint(_1472) >= uint(_403);
    float _1500 = _713 * _1492;
    float _1502 = float(uint(_1488));
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1506 = !_1498;
    int _1508 = _1506 ? 0 : (-1);
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1512 = _1510 != 0;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1516 = _1514 != 0;
    float _1518 = as_type<float>(_1241) * _1502;
    int _1520 = ~_1440;
    int _1522 = _1520 + _1508;
    int _1524 = _1522 + 1;
    float _1526 = trunc(_1500);
    int _1528 = int(_1526);
    bool _1530 = _403 == 0;
    bool _1532 = !_1227;
    int _1534 = _1532 ? 0 : 1;
    int _1536 = _403 * _1524;
    int _1538 = _1536 + _1245;
    int _1540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1542 = _1540 != 0;
    int _1544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1546 = _1544 != 0;
    int _1548 = ~_1496;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    float _1554 = trunc(_1518);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    bool _1560 = !_1530;
    int _1562 = _1560 ? _1538 : (-1);
    int _1564 = abs(_1534);
    int _1566 = ~_475;
    int _1568 = _1566 + 1;
    int _1570 = _1552 * _1562;
    bool _1572 = !_1516;
    int _1574 = _1572 ? 0 : 1;
    int _1576 = _1528 * _1564;
    int _1578 = _1576 + _1245;
    bool _1580 = !_1512;
    int _1582 = _1580 ? 0 : 1;
    int _1584 = _1496 * _1300;
    int _1586 = _1584 + _1570;
    int _1588 = abs(_1574);
    bool _1590 = !_1542;
    int _1592 = _1590 ? 0 : 1;
    int _1594 = abs(_1582);
    int _1596 = _1568 * int(_1558);
    int _1598 = _1596 + _1488;
    bool _1600 = !_1546;
    int _1602 = _1600 ? 0 : 1;
    bool _1604 = _515 != 0;
    int _1606 = abs(_1592);
    int _1608 = _1586 * _1588;
    float _1610 = float(uint(_1598));
    int _1612 = abs(_1602);
    int _1614 = _1324 * _1594;
    int _1616 = _1614 + _1608;
    float _1618 = as_type<float>(_1241) * _1610;
    float _1620 = float(uint(_1424));
    int _1622 = ~_403;
    int _1624 = _1622 + 1;
    int _1626 = _1578 * _1606;
    int _1628 = _1626 + _1616;
    int _1630 = ~_475;
    int _1632 = _1630 + 1;
    float _1634 = trunc(_1618);
    float _1636 = precise::max(_1634, 0.0);
    uint _1638 = uint(_1636);
    float _1640 = as_type<float>(_1241) * _1620;
    int _1642 = _1528 * _1612;
    int _1644 = _1642 + _1628;
    int _1646 = ~_475;
    int _1648 = _1646 + 1;
    bool _1650 = _231 > 0.5;
    float _1652 = float(uint(_1644));
    float _1654 = trunc(_1640);
    float _1656 = precise::max(_1654, 0.0);
    uint _1658 = uint(_1656);
    float _1660 = -_195;
    int _1662 = _1650 ? as_type<int>(_1660) : as_type<int>(_195);
    float _1664 = as_type<float>(_1296) * _1652;
    float _1666 = float(uint(_1578));
    int _1668 = int(_1558) + int(_1638);
    float _1670 = trunc(_1664);
    float _1672 = precise::max(_1670, 0.0);
    uint _1674 = uint(_1672);
    float _1676 = as_type<float>(_1296) * _1666;
    int _1678 = _1632 * _1668;
    int _1680 = _1678 + _1488;
    int _1682 = _1632 * int(_1658);
    int _1684 = _1682 + _1424;
    float _1686 = trunc(_1676);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    bool _1692 = uint(_1680) >= uint(_475);
    float _1694 = float(uint(_1684));
    bool _1696 = !_1692;
    int _1698 = _1696 ? 0 : (-1);
    int _1700 = _1624 * int(_1674);
    int _1702 = _1700 + _1644;
    int _1704 = ~_1668;
    int _1706 = _1704 + _1698;
    int _1708 = _1706 + 1;
    float _1710 = as_type<float>(_1241) * _1694;
    float _1712 = float(uint(_1702));
    int _1714 = _475 * _1708;
    int _1716 = _1714 + _1488;
    float _1718 = trunc(_1710);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = _1624 * int(_1690);
    int _1726 = _1724 + _1578;
    float _1728 = as_type<float>(_1296) * _1712;
    bool _1730 = !_1221;
    int _1732 = _1730 ? _1716 : (-1);
    float _1734 = float(uint(_1726));
    int _1736 = _1732 & 3;
    bool _1738 = _1736 != 0;
    float _1740 = trunc(_1728);
    float _1742 = precise::max(_1740, 0.0);
    uint _1744 = uint(_1742);
    int _1746 = _1732 & 3;
    bool _1748 = _1746 != 0;
    float _1750 = as_type<float>(_1296) * _1734;
    int _1752 = _1738 ? 0 : 1;
    bool _1754 = uint(_1746) > 1u;
    int _1756 = int(_1658) + int(_1722);
    int _1758 = ~_1752;
    int _1760 = _1758 + 1;
    int _1762 = _1760 + 1;
    bool _1764 = _1746 != 3;
    int _1766 = int(_1674) + int(_1744);
    int _1768 = _1648 * _1756;
    int _1770 = _1768 + _1424;
    int _1772 = _1762;
    if (!_1754)
    {
        int _1774 = ~_1752;
        int _1776 = _1774 + 1;
        _1772 = _1776;
    }
    int _1778 = _1772;
    float _1780 = trunc(_1750);
    float _1782 = precise::max(_1780, 0.0);
    uint _1784 = uint(_1782);
    bool _1786 = uint(_1746) >= 2u;
    int _1788 = ~_403;
    int _1790 = _1788 + 1;
    int _1792 = _1786 ? 0 : 1;
    bool _1794 = uint(_1770) >= uint(_475);
    int _1796 = _1790 * _1766;
    int _1798 = _1796 + _1644;
    int _1800 = ~_1792;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    bool _1806 = !_1794;
    int _1808 = _1806 ? 0 : (-1);
    bool _1810 = uint(_1798) >= uint(_403);
    int _1812 = ~_1756;
    int _1814 = _1812 + _1808;
    int _1816 = _1814 + 1;
    bool _1818 = !_1810;
    int _1820 = _1818 ? 0 : (-1);
    bool _1822 = _1746 != 3;
    int _1824 = _475 * _1816;
    int _1826 = _1824 + _1424;
    int _1828 = ~_1766;
    int _1830 = _1828 + _1820;
    int _1832 = _1830 + 1;
    int _1834 = ~_403;
    int _1836 = _1834 + 1;
    int _1838 = int(_1690) + int(_1784);
    int _1840 = _403 * _1832;
    int _1842 = _1840 + _1644;
    int _1844 = _1732 >> 31;
    bool _1846 = !_1221;
    int _1848 = _1846 ? _1826 : (-1);
    int _1850 = _1836 * _1838;
    int _1852 = _1850 + _1578;
    bool _1854 = !_1530;
    int _1856 = _1854 ? _1842 : (-1);
    int _1858 = _1804;
    if (_1822)
    {
        int _1860 = ~_1792;
        int _1862 = _1860 + 1;
        _1858 = _1862;
    }
    int _1864 = _1858;
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1868 = _1866 != 0;
    bool _1870 = _917 != 0;
    bool _1872 = !_1868;
    int _1874 = _1872 ? 0 : 1;
    bool _1876 = uint(_1852) >= uint(_403);
    int _1878 = _1844 & 3;
    int _1880 = _1856 >> 31;
    int _1882 = _1732 + _1878;
    int _1884 = _1880 & 3;
    int _1886 = _1882 >> 2;
    int _1888 = _1856 + _1884;
    int _1890 = _1886 << 4;
    int _1892 = _1890 + 368;
    int _1894 = _1888 >> 2;
    uint _1896 = uint(int(uint(_1892) >> uint(2)));
    uint _1898 = uint(int(uint(int(_1896)) >> uint(2)));
    int _1900 = int(_1896) & 3;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[int(_1898)][_1900];
    int _1904 = int(_1896) + 1;
    uint _1906 = uint(int(uint(_1904) >> uint(2)));
    int _1908 = _1904 & 3;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[int(_1906)][_1908];
    bool _1912 = !_1748;
    int _1914 = _1912 ? 0 : 1;
    int _1916 = _1856 & 3;
    bool _1918 = _1916 != 0;
    int _1920 = _1894 << 4;
    int _1922 = _1920 + 512;
    bool _1924 = !_1764;
    int _1926 = _1924 ? 0 : (-1);
    bool _1928 = _1916 != 3;
    uint _1930 = uint(int(uint(_1922) >> uint(2)));
    uint _1932 = uint(int(uint(int(_1930)) >> uint(2)));
    int _1934 = int(_1930) & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    int _1938 = int(_1930) + 1;
    uint _1940 = uint(int(uint(_1938) >> uint(2)));
    int _1942 = _1938 & 3;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[int(_1940)][_1942];
    bool _1946 = !_1876;
    int _1948 = _1946 ? 0 : (-1);
    bool _1950 = uint(_1916) > 1u;
    float _1952 = -_199;
    int _1954 = _1604 ? as_type<int>(_1952) : as_type<int>(_199);
    bool _1956 = uint(_1916) >= 2u;
    int _1958 = ~_1838;
    int _1960 = _1958 + _1948;
    int _1962 = _1960 + 1;
    int _1964 = _1918 ? 0 : 1;
    bool _1966 = _1916 != 3;
    int _1968 = _1956 ? 0 : 1;
    bool _1970 = !_1966;
    int _1972 = _1970 ? 0 : (-1);
    int _1974 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1976 = _1974 != 0;
    int _1978 = _1856 & 3;
    bool _1980 = _1978 != 0;
    int _1982 = ~_1968;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    int _1988 = _1986;
    if (_1928)
    {
        int _1990 = ~_1968;
        int _1992 = _1990 + 1;
        _1988 = _1992;
    }
    int _1994 = _1988;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1998 = ~_1964;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = _2002;
    if (!_1950)
    {
        int _2006 = ~_1964;
        int _2008 = _2006 + 1;
        _2004 = _2008;
    }
    int _2010 = _2004;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2014 = abs(_1778);
    int _2016 = _1892 + 8;
    uint _2018 = uint(int(uint(_2016) >> uint(2)));
    uint _2020 = uint(int(uint(int(_2018)) >> uint(2)));
    int _2022 = int(_2018) & 3;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[int(_2020)][_2022];
    int _2026 = int(_2018) + 1;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    int _2030 = _2026 & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    int _2034 = abs(_2010);
    float _2036 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2038 = _2012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2040 = abs(_1914);
    float _2042 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2044 = ~_2014;
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    float _2050 = _467 + 0.5;
    int _2052 = _1922 + 8;
    uint _2054 = uint(int(uint(_2052) >> uint(2)));
    uint _2056 = uint(int(uint(int(_2054)) >> uint(2)));
    int _2058 = int(_2054) & 3;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[int(_2056)][_2058];
    int _2062 = int(_2054) + 1;
    uint _2064 = uint(int(uint(_2062) >> uint(2)));
    int _2066 = _2062 & 3;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[int(_2064)][_2066];
    bool _2070 = _241 > 0.5;
    int _2072 = _403 * _1962;
    int _2074 = _2072 + _1578;
    int _2076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2078 = _2076 != 0;
    int _2080 = _2048 * as_type<int>(_1910);
    bool _2082 = !_1980;
    int _2084 = _2082 ? 0 : 1;
    float _2086 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2088 = !_1530;
    int _2090 = _2088 ? _2074 : (-1);
    float _2092 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2094 = !_2078;
    int _2096 = _2094 ? 0 : 1;
    int _2098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2100 = _2098 != 0;
    int _2102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2104 = _2102 != 0;
    int _2106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2108 = _2106 != 0;
    float _2110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2112 = ~_2034;
    int _2114 = _2112 + 1;
    int _2116 = _2114 + 1;
    int _2118 = ~_2040;
    int _2120 = _2118 + 1;
    int _2122 = _2120 + 1;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2126 = _1219 * _2086;
    int _2128 = _2116 * as_type<int>(_1944);
    int _2130 = _2122 * as_type<int>(_1902);
    int _2132 = _2130 + _2080;
    out.m_82.x = _2036;
    out.m_82.y = _2038;
    out.m_82.z = _2042;
    out.m_82.w = _2124;
    float _2134 = _2092 * _2110;
    int _2136 = abs(_2084);
    int _2138 = abs(_1994);
    int _2140 = ~_2136;
    int _2142 = _2140 + 1;
    int _2144 = _2142 + 1;
    out.m_84.x = _2134;
    out.m_84.y = _2126;
    int _2146 = abs(_1874);
    float _2148 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2150 = int(_2148);
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2154 = abs(_1864);
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2160 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2162 = ~_2154;
    int _2164 = _2162 + 1;
    int _2166 = _2164 + 1;
    float _2168 = _2156 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2170 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2172 = int(_2170);
    float _2174 = _2158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2176 = _2144 * as_type<int>(_1936);
    int _2178 = _2176 + _2128;
    int _2180 = abs(_1926);
    int _2182 = _2166 * as_type<int>(_2024);
    int _2184 = _2182 + _2132;
    out.m_86.x = _2160;
    out.m_86.y = _2168;
    out.m_86.z = _2174;
    int _2186 = abs(_1972);
    float _2188 = as_type<float>(_2138);
    if (_1085)
    {
        float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2192 = _1175 + _2190;
        _2188 = _2192;
    }
    float _2194 = _2188;
    float _2196 = float(uint(_2150));
    int _2198 = ~_2186;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    float _2204 = _989 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2206 = abs(_2150);
    if (_1085)
    {
        float _2208 = _2194 * _2194;
        _1105 = _2208;
    }
    float _2210 = _1105;
    float _2212 = 1.0 / _2196;
    int _2214 = abs(_2096);
    float _2216 = _989 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2218 = ~_2138;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    float _2224 = _989 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2226 = ~_2180;
    int _2228 = _2226 + 1;
    int _2230 = _2228 + 1;
    float _2232 = -_979;
    float _2234 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2216);
    float _2236 = float(uint(_2172));
    int _2238 = _2222 * as_type<int>(_2060);
    int _2240 = _2238 + _2178;
    int _2242 = ~_2146;
    int _2244 = _2242 + 1;
    int _2246 = _2244 + 1;
    int _2248 = _2230 * as_type<int>(_2032);
    int _2250 = _2248 + _2184;
    int _2252 = _2202 * as_type<int>(_2068);
    int _2254 = _2252 + _2240;
    float _2256 = 1.0 / _2236;
    int _2258 = _2250 * _2246;
    int _2260 = abs(_2172);
    float _2262 = -_979;
    float _2264 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2204);
    float _2266 = float(uint(_2206));
    int _2268 = _1848 * _2146;
    int _2270 = _2268 + _2258;
    int _2272 = ~_2214;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    float _2278 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2264);
    float _2280 = float(uint(_2260));
    float _2282 = -_979;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    int _2286 = as_type<int>(_2212) + (-2);
    float _2288 = 1.0 / _2266;
    float _2290 = float(uint(_2270));
    int _2292 = _2276 * _2254;
    float _2294 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    float _2296 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2284);
    int _2298 = as_type<int>(_2256) + (-2);
    int _2300 = _2090 * _2214;
    int _2302 = _2300 + _2292;
    float _2304 = as_type<float>(_2286) * _2290;
    float _2306 = 1.0 / _2280;
    int _2308 = abs(_2270);
    float _2310 = _999 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2312 = float(uint(_2302));
    float _2314 = _999 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2316 = _999 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2318 = abs(_2302);
    float _2320 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2310);
    float _2322 = trunc(_2304);
    float _2324 = precise::max(_2322, 0.0);
    uint _2326 = uint(_2324);
    float _2328 = as_type<float>(_2298) * _2312;
    int _2330 = as_type<int>(_2288) + (-2);
    float _2332 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2314);
    float _2334 = float(uint(_2308));
    float _2336 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2316);
    float _2338 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2340 = float(uint(_2318));
    float _2342 = _2234;
    float _2344 = _2296;
    if (_1085)
    {
        float _2346 = _1131 * 6.283185482025146484375;
        float _2348 = cos(_2346);
        _2342 = _2348;
    }
    float _2350 = _2342;
    int _2352 = as_type<int>(_2306) + (-2);
    float _2354 = as_type<float>(_2330) * _2334;
    int _2356 = ~_2150;
    int _2358 = _2356 + 1;
    float _2360 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2362 = !_2100;
    float _2364 = _2362 ? _199 : as_type<float>(_1954);
    float _2366 = as_type<float>(_2352) * _2340;
    float _2368 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2332);
    float _2370 = trunc(_2328);
    float _2372 = precise::max(_2370, 0.0);
    uint _2374 = uint(_2372);
    float _2376 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2378 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2338);
    int _2380 = _2358 * int(_2326);
    int _2382 = _2380 + _2270;
    int _2384 = ~_2260;
    int _2386 = _2384 + 1;
    float _2388 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2376);
    float _2390 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2360);
    int _2392 = ~_2172;
    int _2394 = _2392 + 1;
    float _2396 = trunc(_2354);
    float _2398 = precise::max(_2396, 0.0);
    uint _2400 = uint(_2398);
    float _2402 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2388);
    float _2404 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2378);
    float _2406 = float(uint(_2382));
    float _2408 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2390);
    int _2410 = ~_2206;
    int _2412 = _2410 + 1;
    bool _2414 = !_1976;
    float _2416 = _2414 ? _195 : as_type<float>(_1662);
    float _2418 = trunc(_2366);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    float _2424 = as_type<float>(_2286) * _2406;
    int _2426 = _2394 * int(_2374);
    int _2428 = _2426 + _2302;
    float _2430 = as_type<float>(_2412);
    if (_1085)
    {
        float _2432 = _2350 + (-1.0);
        _2430 = _2432;
    }
    float _2434 = _2430;
    bool _2436 = _2172 == 0;
    int _2438 = _2412 * int(_2400);
    int _2440 = _2438 + _2308;
    float _2442 = float(uint(_2428));
    float _2444 = trunc(_2424);
    float _2446 = precise::max(_2444, 0.0);
    uint _2448 = uint(_2446);
    float _2450 = _2434;
    if (_1085)
    {
        float _2452 = _2434 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2450 = _2452;
    }
    float _2454 = _2450;
    float _2456 = float(uint(_2440));
    if (_1085)
    {
        float _2458 = fma(_1147, _2350, _2454);
        _1151 = _2458;
    }
    float _2460 = _1151;
    int _2462 = _2386 * int(_2422);
    int _2464 = _2462 + _2318;
    float _2466 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2470 = _2460 + _2468;
    float _2472 = float(uint(_2464));
    float _2474 = as_type<float>(_2298) * _2442;
    float _2476 = as_type<float>(_2330) * _2456;
    float _2478 = -_199;
    int _2480 = _2070 ? as_type<int>(_2478) : as_type<int>(_199);
    float _2482 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2484 = -_195;
    int _2486 = _1870 ? as_type<int>(_2484) : as_type<int>(_195);
    float _2488 = as_type<float>(_2352) * _2472;
    bool _2490 = !_2108;
    float _2492 = _2490 ? _199 : as_type<float>(_2480);
    float _2494 = trunc(_2474);
    float _2496 = precise::max(_2494, 0.0);
    uint _2498 = uint(_2496);
    bool _2500 = !_2104;
    float _2502 = _2500 ? _195 : as_type<float>(_2486);
    float _2504 = _2482 * _2278;
    float _2506 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2320);
    float _2508 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2336);
    float _2510 = _2482 * _2296;
    float _2512 = _2504;
    if (!_1085)
    {
        _1107 = _1075;
    }
    float _2514 = _1107;
    float _2516 = fma(_2466, _2506, _2504);
    float _2518 = trunc(_2488);
    float _2520 = precise::max(_2518, 0.0);
    uint _2522 = uint(_2520);
    float _2524 = _2482 * _2294;
    float _2526 = _2514;
    if (_1085)
    {
        float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2530 = _1179 + _2528;
        _2512 = _2530;
    }
    float _2532 = _2512;
    int _2534 = ~_2206;
    int _2536 = _2534 + 1;
    out.m_88.x = _2506;
    out.m_88.y = _2368;
    out.m_88.z = _2508;
    float _2538 = fma(_2466, _2368, _2524);
    float _2540 = fma(_2466, _2508, _2510);
    float _2542 = fma(_2470, _2470, _2210);
    float _2544 = trunc(_2476);
    float _2546 = precise::max(_2544, 0.0);
    uint _2548 = uint(_2546);
    int _2550 = int(_2326) + int(_2448);
    float _2552 = _2540;
    float _2554 = as_type<float>(_2550);
    if (_1085)
    {
        float _2556 = _2532 * _2532;
        _2526 = _2556;
    }
    float _2558 = _2526;
    int _2560 = ~_2150;
    int _2562 = _2560 + 1;
    int _2564 = int(_2374) + int(_2498);
    float _2566 = _2542 + _2558;
    int _2568 = ~_2172;
    int _2570 = _2568 + 1;
    int _2572 = _2562 * _2550;
    int _2574 = _2572 + _2270;
    int _2576 = int(_2422) + int(_2522);
    int _2578 = ~_2260;
    int _2580 = _2578 + 1;
    int _2582 = _2570 * _2564;
    int _2584 = _2582 + _2302;
    bool _2586 = uint(_2574) >= uint(_2150);
    float _2588 = sqrt(_2566);
    int _2590 = _2302 ^ _2172;
    int _2592 = _2580 * _2576;
    int _2594 = _2592 + _2318;
    int _2596 = int(_2400) + int(_2548);
    bool _2598 = !_2586;
    int _2600 = _2598 ? 0 : (-1);
    bool _2602 = uint(_2584) >= uint(_2172);
    int _2604 = _2536 * _2596;
    int _2606 = _2604 + _2308;
    int _2608 = ~_2550;
    int _2610 = _2608 + _2600;
    int _2612 = _2610 + 1;
    float _2614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2616 = !_2602;
    int _2618 = _2616 ? 0 : (-1);
    bool _2620 = uint(_2594) >= uint(_2260);
    int _2622 = _2150 * _2612;
    int _2624 = _2622 + _2270;
    bool _2626 = uint(_2606) >= uint(_2206);
    int _2628 = _2270 ^ _2150;
    float _2630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2632 = ~_2564;
    int _2634 = _2632 + _2618;
    int _2636 = _2634 + 1;
    bool _2638 = !_2620;
    int _2640 = _2638 ? 0 : (-1);
    bool _2642 = !_2626;
    int _2644 = _2642 ? 0 : (-1);
    int _2646 = _2172 * _2636;
    int _2648 = _2646 + _2302;
    uint _2650 = uint(int(uint(_2628) >> uint(31)));
    float _2652 = fma(_2482, _2482, 1.0);
    bool _2654 = _2150 == 0;
    bool _2656 = _2150 == 0;
    float _2658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2660 = ~_2640;
    int _2662 = _2576 + _2660;
    int _2664 = _2662 + 1;
    int _2666 = ~_2644;
    int _2668 = _2596 + _2666;
    int _2670 = _2668 + 1;
    float _2672 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2674 = ~int(_2650);
    int _2676 = _2674 + 1;
    float _2678 = _2614 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2680 = _2172 == 0;
    float _2682 = rsqrt(_2652);
    uint _2684 = uint(int(uint(_2590) >> uint(31)));
    bool _2686 = !_2654;
    int _2688 = _2686 ? _2624 : (-1);
    int _2690 = _2670 ^ _2676;
    int _2692 = ~int(_2684);
    int _2694 = _2692 + 1;
    float _2696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2698 = float(_2688);
    float _2700 = _2658 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2702 = ~_2676;
    int _2704 = _2702 + _2690;
    int _2706 = _2704 + 1;
    float _2708 = _2416 + 0.5;
    bool _2710 = !_2436;
    int _2712 = _2710 ? _2648 : (-1);
    float _2714 = fma(_2678, _2698, _387);
    int _2716 = _2664 ^ _2694;
    float _2718 = _2482 * _2682;
    float _2720 = float(_2712);
    float _2722 = fma(_2678, _2708, _2714);
    bool _2724 = !_2656;
    int _2726 = _2724 ? _2706 : (-1);
    float _2728 = _2364 + (-0.5);
    int _2730 = ~_2694;
    int _2732 = _2730 + _2716;
    int _2734 = _2732 + 1;
    float _2736 = fma(_2700, _2720, _737);
    float _2738 = float(_2726);
    float _2740 = _2696 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2742 = !_2680;
    int _2744 = _2742 ? _2734 : (-1);
    float _2746 = -_2404;
    float _2748 = _2718 * _2746;
    float _2750 = _2404 + _2538;
    float _2752 = -_417;
    float _2754 = fma(_2672, _2738, _2752);
    float _2756 = float(_2744);
    float _2758 = _2502 + 0.5;
    out.m_90.x = _1189;
    out.m_90.y = _1191;
    out.m_90.z = _1193;
    float _2760 = -_2672;
    float _2762 = fma(_2760, _2728, _2754);
    float _2764 = _2492 + (-0.5);
    float _2766 = -_739;
    float _2768 = fma(_2740, _2756, _2766);
    float _2770 = fma(_2700, _2758, _2736);
    float _2772 = -_2402;
    float _2774 = _2718 * _2772;
    float _2776 = -_2408;
    float _2778 = _2718 * _2776;
    float _2780 = -_2740;
    float _2782 = fma(_2780, _2764, _2768);
    float _2784 = fma(_2682, _2294, _2748);
    float _2786 = -_711;
    float _2788 = _2786 + 1.0;
    float _2790 = fma(_2682, _2278, _2774);
    float _2792 = _2402 + _2516;
    float _2794 = fma(_2682, _2296, _2778);
    float _2796 = -_2788;
    float _2798 = fma(_2416, _2796, _2722);
    float _2800 = fma(_2492, _1213, _2782);
    float _2802 = -_1235;
    float _2804 = fma(_2502, _2802, _2770);
    float _2806 = fma(_2364, _1231, _2762);
    float _2808 = _2408 + _2540;
    out.m_92.x = _2790;
    out.m_92.y = _2784;
    out.m_92.z = _2794;
    bool _2810 = _2588 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2812 = isnan(_2588);
    bool _2814 = _2810 || _2812;
    bool _2816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2818 = _2814 || _2816;
    out.m_94.x = _2798;
    out.m_94.y = _2806;
    out.m_94.z = _2804;
    out.m_94.w = _2800;
    out.m_96.x = _2792;
    out.m_96.y = _2750;
    out.m_96.z = _2808;
    float _2820 = _2762;
    float _2822 = as_type<float>(_2596);
    float _2824 = as_type<float>(_2580);
    if (!_2818)
    {
        _2820 = 1.0;
    }
    float _2826 = _2820;
    bool _2828 = !_2818;
    float _2830 = _2826;
    if (!_2828)
    {
        bool _2832 = _2588 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2834 = isnan(_2588);
        bool _2836 = _2832 || _2834;
        bool _2838 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2840 = _2836 || _2838;
        if (!_2840)
        {
            float _2842 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2844 = _2588 + _2842;
            float _2846 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2848 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2846;
            float _2850 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2852 = _2850 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2854 = 1.0 / _2848;
            float _2856 = _2844 * _2854;
            float _2858 = fma(_2856, _2852, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2830 = _2858;
            _2860 = true;
        }
        else
        {
            bool _2862 = _2588 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2864 = isnan(_2588);
            bool _2866 = _2862 || _2864;
            bool _2868 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2870 = _2866 || _2868;
            if (!_2870)
            {
                float _2872 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2874 = _2588 + _2872;
                float _2876 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2878 = _2876 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2880 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2882 = _2880 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2884 = 1.0 / _2878;
                float _2886 = _2874 * _2884;
                float _2888 = fma(_2886, _2882, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2830 = _2888;
                _2860 = true;
            }
            else
            {
                _2830 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2860 = false;
    float _2890 = _2830;
    float _2892 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2894 = _2460 + _2892;
    float _2896 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2898 = _1175 + _2896;
    float _2900 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2902 = _1179 + _2900;
    float _2904 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2906 = fma(_2894, _2890, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2908 = fma(_2898, _2890, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2910 = fma(_2902, _2890, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2912 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2904);
    float _2914 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2916 = _2906 + _2914;
    float _2918 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2920 = _2908 + _2918;
    float _2922 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2924 = _2910 + _2922;
    float _2926 = _2916 * _2916;
    float _2928 = fma(_2920, _2920, _2926);
    float _2930 = fma(_2924, _2924, _2928);
    float _2932 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2912);
    float _2934 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2936 = fma(_1047, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2938 = rsqrt(_2930);
    float _2940 = _2932 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2942 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2934);
    float _2944 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2942);
    float _2946 = 1.0 / _2940;
    float _2948 = _2944 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2950 = _2948 + _2940;
    float _2952 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2954 = sqrt(_2930);
    float _2956 = _2920 * _2952;
    float _2958 = _2924 * _2952;
    float _2960 = _2956 * _2956;
    float _2962 = _2958 * _2958;
    float _2964 = _2950 * _2946;
    float _2966 = _2964 * 0.5;
    float _2968 = _2960 + _2962;
    float _2970 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2972 = fma(_2966, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2970);
    float _2974 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2976 = sqrt(_2968);
    float _2978 = _1093 + _2974;
    float _2980 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2982 = 1.0 / _2972;
    float _2984 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2986 = fma(_1047, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2980);
    float _2988 = fma(_1047, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2984);
    float _2990 = fma(_1049, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2986);
    bool _2992 = _2976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2994 = fma(_1049, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2988);
    float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2998 = _2976 + _2996;
    float _3000 = _2990 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3002 = floor(_2936);
    float _3004 = _2994 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _3006 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3008 = _2982 * _3006;
    float _3010 = trunc(_3000);
    int _3012 = int(_3010);
    bool _3014 = _3008 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3016 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _3018 = _3008 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3020 = _1193;
    int _3022 = 2;
    float _3024 = _2998;
    float _3026 = _2968;
    float _3028 = _2958;
    float _3030 = _2960;
    if (_2992)
    {
        float _3032 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3020 = _3032;
    }
    float _3034 = _3020;
    float _3036 = -_3002;
    float _3038 = _2936 + _3036;
    if (!_3014)
    {
        _3022 = 1;
    }
    int _3040 = _3022;
    float _3042 = trunc(_3004);
    int _3044 = int(_3042);
    int _3046 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3048 = _3012 + _3046;
    int _3050 = _3048 + 1;
    int _3052 = _3040;
    if (_2992)
    {
        float _3054 = _2998 * _3034;
        _3024 = _3054;
    }
    float _3056 = _3024;
    if (_2992)
    {
        float _3058 = rsqrt(_2968);
        _3026 = _3058;
    }
    float _3060 = _3026;
    if (_2992)
    {
        float _3062 = _3056 * 0.15915493667125701904296875;
        _2552 = _3062;
    }
    float _3064 = _2552;
    bool _3066 = !_3014;
    int _3068 = _3066 ? 0 : 1;
    int _3070 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3072 = _3044 + _3070;
    int _3074 = _3072 + 1;
    float _3076 = _2990;
    if (_2992)
    {
        float _3078 = _3064 * 6.283185482025146484375;
        float _3080 = sin(_3078);
        _3076 = _3080;
    }
    float _3082 = _3076;
    if (!_3018)
    {
        _3052 = _3068;
    }
    int _3084 = _3052;
    float _3086 = precise::max(0.0, _3016);
    int _3088 = _3084 << 6;
    bool _3090 = _3050 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _3092 = -_2952;
    float _3094 = -_3086;
    float _3096 = fma(_2916, _3092, _3094);
    int _3098 = _3088 + 96;
    uint _3100 = uint(int(uint(_3098) >> uint(2)));
    uint _3102 = uint(int(uint(int(_3100)) >> uint(2)));
    int _3104 = int(_3100) & 3;
    float _3106 = (*spvDescriptorSet0.vp_c15)._m0[int(_3102)][_3104];
    int _3108 = int(_3100) + 1;
    uint _3110 = uint(int(uint(_3108) >> uint(2)));
    int _3112 = _3108 & 3;
    float _3114 = (*spvDescriptorSet0.vp_c15)._m0[int(_3110)][_3112];
    int _3116 = _3050 | _3074;
    float _3118 = _3064;
    float _3120 = _3086;
    float _3122 = as_type<float>(_3116);
    float _3124 = _3096;
    if (_2992)
    {
        float _3126 = _3064 * 6.283185482025146484375;
        float _3128 = cos(_3126);
        _3118 = _3128;
    }
    float _3130 = _3118;
    if (_2992)
    {
        float _3132 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3120 = _3132;
    }
    float _3134 = _3120;
    bool _3136 = _3116 < 0;
    bool _3138 = _3136 || _3090;
    if (_2992)
    {
        float _3140 = fma(_3082, _3134, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3122 = _3140;
    }
    float _3142 = _3122;
    int _3144 = _3088 + 48;
    uint _3146 = uint(int(uint(_3144) >> uint(2)));
    uint _3148 = uint(int(uint(int(_3146)) >> uint(2)));
    int _3150 = int(_3146) & 3;
    float _3152 = (*spvDescriptorSet0.vp_c15)._m0[int(_3148)][_3150];
    int _3154 = int(_3146) + 1;
    uint _3156 = uint(int(uint(_3154) >> uint(2)));
    int _3158 = _3154 & 3;
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[int(_3156)][_3158];
    float _3162 = fma(_1049, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _3164 = _3074 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3166 = _3164 || _3138;
    if (_2992)
    {
        float _3168 = _3060 * _3142;
        _2554 = _3168;
    }
    float _3170 = _2554;
    float _3172 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3174 = floor(_3162);
    if (_2992)
    {
        float _3176 = _2958 * _3170;
        _3028 = _3176;
    }
    float _3178 = _3028;
    int _3180 = _3088 + 104;
    uint _3182 = uint(int(uint(_3180) >> uint(2)));
    uint _3184 = uint(int(uint(int(_3182)) >> uint(2)));
    int _3186 = int(_3182) & 3;
    float _3188 = (*spvDescriptorSet0.vp_c15)._m0[int(_3184)][_3186];
    int _3190 = int(_3182) + 1;
    uint _3192 = uint(int(uint(_3190) >> uint(2)));
    int _3194 = _3190 & 3;
    float _3196 = (*spvDescriptorSet0.vp_c15)._m0[int(_3192)][_3194];
    float _3198 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3172);
    float _3200 = _3130;
    if (_2992)
    {
        float _3202 = _3130 + (-1.0);
        _2822 = _3202;
    }
    float _3204 = _2822;
    float _3206 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3198);
    float _3208 = _3204;
    if (_2992)
    {
        float _3210 = _3204 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2824 = _3210;
    }
    float _3212 = _2824;
    if (!_2992)
    {
        _3208 = _2956;
    }
    float _3214 = _3208;
    int _3216 = _3088 + 64;
    uint _3218 = uint(int(uint(_3216) >> uint(2)));
    uint _3220 = uint(int(uint(int(_3218)) >> uint(2)));
    int _3222 = int(_3218) & 3;
    float _3224 = (*spvDescriptorSet0.vp_c15)._m0[int(_3220)][_3222];
    int _3226 = int(_3218) + 1;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    int _3230 = _3226 & 3;
    float _3232 = (*spvDescriptorSet0.vp_c15)._m0[int(_3228)][_3230];
    float _3234 = _3214;
    if (_2992)
    {
        float _3236 = _2956 * _3170;
        _3234 = _3236;
    }
    float _3238 = _3234;
    if (_2992)
    {
        float _3240 = fma(_3096, _3130, _3212);
        _3124 = _3240;
    }
    float _3242 = _3124;
    if (!_2992)
    {
        _3200 = _2962;
    }
    float _3244 = _3200;
    float _3246 = _3244;
    if (_2992)
    {
        float _3248 = _3178 * _3178;
        _3246 = _3248;
    }
    float _3250 = _3246;
    if (_2992)
    {
        float _3252 = _3238 * _3238;
        _3030 = _3252;
    }
    float _3254 = _3030;
    float _3256 = _3206 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_3166)
    {
        float _3258 = floor(_3004);
        _2344 = _3258;
    }
    float _3260 = _2344;
    int _3262 = _3088 + 56;
    uint _3264 = uint(int(uint(_3262) >> uint(2)));
    uint _3266 = uint(int(uint(int(_3264)) >> uint(2)));
    int _3268 = int(_3264) & 3;
    float _3270 = (*spvDescriptorSet0.vp_c15)._m0[int(_3266)][_3268];
    int _3272 = int(_3264) + 1;
    uint _3274 = uint(int(uint(_3272) >> uint(2)));
    int _3276 = _3272 & 3;
    float _3278 = (*spvDescriptorSet0.vp_c15)._m0[int(_3274)][_3276];
    float _3280 = fma(_3242, _3242, _3254);
    float _3282 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3284 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3286 = -_3174;
    float _3288 = _3162 + _3286;
    float _3290 = _3280 + _3250;
    float _3292 = -_3284;
    float _3294 = fma(_3292, _3282, 1.0);
    int _3296 = _3088 + 80;
    uint _3298 = uint(int(uint(_3296) >> uint(2)));
    uint _3300 = uint(int(uint(int(_3298)) >> uint(2)));
    int _3302 = int(_3298) & 3;
    float _3304 = (*spvDescriptorSet0.vp_c15)._m0[int(_3300)][_3302];
    int _3306 = int(_3298) + 1;
    uint _3308 = uint(int(uint(_3306) >> uint(2)));
    int _3310 = _3306 & 3;
    float _3312 = (*spvDescriptorSet0.vp_c15)._m0[int(_3308)][_3310];
    int _3314 = as_type<int>(_3284);
    if (!_3166)
    {
        int _3316 = _3074 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3318 = _3316 + _3050;
        _3314 = _3318;
    }
    int _3320 = _3314;
    float _3322 = rsqrt(_3290);
    int _3324 = _3088 + 72;
    uint _3326 = uint(int(uint(_3324) >> uint(2)));
    uint _3328 = uint(int(uint(int(_3326)) >> uint(2)));
    int _3330 = int(_3326) & 3;
    float _3332 = (*spvDescriptorSet0.vp_c15)._m0[int(_3328)][_3330];
    int _3334 = int(_3326) + 1;
    uint _3336 = uint(int(uint(_3334) >> uint(2)));
    int _3338 = _3334 & 3;
    float _3340 = (*spvDescriptorSet0.vp_c15)._m0[int(_3336)][_3338];
    float _3342 = _2978 * _3114;
    float _3344 = log2(_3294);
    float _3346 = fma(_1047, _3106, _3342);
    int _3348 = _3088 + 88;
    uint _3350 = uint(int(uint(_3348) >> uint(2)));
    uint _3352 = uint(int(uint(int(_3350)) >> uint(2)));
    int _3354 = int(_3350) & 3;
    float _3356 = (*spvDescriptorSet0.vp_c15)._m0[int(_3352)][_3354];
    int _3358 = int(_3350) + 1;
    uint _3360 = uint(int(uint(_3358) >> uint(2)));
    int _3362 = _3358 & 3;
    float _3364 = (*spvDescriptorSet0.vp_c15)._m0[int(_3360)][_3362];
    float _3366 = _2978 * _3160;
    float _3368 = _3322 * _3238;
    float _3370 = _3322 * _3242;
    float _3372 = fma(_1047, _3152, _3366);
    int _3374 = as_type<int>(_3366);
    float _3376 = _3372;
    if (!_3166)
    {
        int _3378 = _3320 << 2;
        _3374 = _3378;
    }
    int _3380 = _3374;
    float _3382 = _3368 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3384 = fma(_1049, _3188, _3346);
    float _3386 = _3322 * _3178;
    int _3388 = _3380;
    float _3390 = _3232;
    if (!_3166)
    {
        int _3392 = 12 & _3380;
        _3388 = _3392;
    }
    int _3394 = _3388;
    float _3396 = _3384 + _3196;
    float _3398 = -_3382;
    float _3400 = fma(_3370, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3398);
    float _3402 = _3344 * 0.693147182464599609375;
    float _3404 = _2978 * _3232;
    int _3406 = _3394;
    if (!_3166)
    {
        float _3408 = -_3260;
        float _3410 = _3004 + _3408;
        _3390 = _3410;
    }
    float _3412 = _3390;
    float _3414 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3416 = fma(_2954, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3414);
    float _3418 = precise::clamp(_3416, 0.0, 1.0);
    float _3420 = 1.0 / _3396;
    float _3422 = fma(_1047, _3224, _3404);
    float _3424 = -_3418;
    float _3426 = _3424 + 1.0;
    float _3428 = fma(_1049, _3270, _3372);
    float _3430 = _3418;
    if (!_3166)
    {
        float _3432 = floor(_3000);
        _3376 = _3432;
    }
    float _3434 = _3376;
    float _3436 = _3428 + _3278;
    float _3438 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3440 = _2978 * _3312;
    int _3442 = as_type<int>(_3312);
    if (!_3166)
    {
        uint _3444 = uint(int(uint(_3320) >> uint(2)));
        _3442 = int(_3444);
    }
    int _3446 = _3442;
    float _3448 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3438);
    float _3450 = abs(_3426);
    float _3452 = log2(_3450);
    float _3454 = fma(_1047, _3304, _3440);
    if (!_3166)
    {
        int _3456 = _3446 << 4;
        int _3458 = _3456 + _3394;
        _3406 = _3458;
    }
    int _3460 = _3406;
    float _3462 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3448);
    float _3464 = fma(_1049, _3332, _3422);
    float _3466 = -_3386;
    float _3468 = fma(_3466, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3400);
    float _3470 = _3382;
    if (!_3166)
    {
        int _3472 = _3460 + 400;
        uint _3474 = uint(int(uint(_3472) >> uint(2)));
        uint _3476 = uint(int(uint(int(_3474)) >> uint(2)));
        int _3478 = int(_3474) & 3;
        float _3480 = (*spvDescriptorSet0.vp_c15)._m0[int(_3476)][_3478];
        _3470 = _3480;
    }
    float _3482 = _3470;
    float _3484 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3486 = _3464 + _3340;
    float _3488 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float2 _9355 = float2(_3038, _3288);
    float _3490 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9355, float2(0.0), isnan(_9355)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9355, float2(0.0), isnan(_9355)), level(0.0)).x;
    float _3492 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3484);
    float _3494 = _3462 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3496 = _3436 * _3420;
    float _3498 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3488);
    float _3500 = fma(_1049, _3356, _3454);
    float _3502 = fma(_3468, -0.5, 0.5);
    float _3504 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _3506 = _3496 >= 0.0;
    float _3508 = _3486 * _3420;
    float _3510 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3498);
    float _3512 = exp2(_3504);
    bool _3514 = _3496 <= 1.0;
    bool _3516 = _3514 && _3506;
    float _3518 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3492);
    float _3520 = _3510 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3522 = _3494 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3524 = _3508 >= 0.0;
    bool _3526 = _3524 && _3516;
    float _3528 = _3518 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3530 = fma(_3468, 0.5, 0.5);
    float _3532 = sqrt(_3502);
    bool _3534 = _3508 <= 1.0;
    bool _3536 = _3534 && _3526;
    float _3538 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3522);
    float _3540 = _3500 + _3364;
    float _3542 = _3370 + 1.0;
    float _3544 = fma(_3530, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3546 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3538);
    float _3548 = _3494 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3550 = -_3370;
    float _3552 = fma(_3512, _3542, _3550);
    float _3554 = _3494 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3556 = fma(_3528, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3546);
    float _3558 = fma(_3530, _3544, -0.212114393711090087890625);
    float _3560 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3548);
    float _3562 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3554);
    float _3564 = 1.0 / _3556;
    float _3566 = fma(_3530, _3558, 1.570728778839111328125);
    float _3568 = _3532 * 0.636619746685028076171875;
    float _3570 = _3532;
    float _3572 = _3556;
    if (_3536)
    {
        float _3574 = float(_3084);
        _3570 = _3574;
    }
    float _3576 = _3570;
    float _3578 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3560);
    float _3580 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3562);
    float _3582 = -_3566;
    float _3584 = fma(_3568, _3582, 1.0);
    float _3586 = _3402 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3588 = fma(_3528, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3578);
    float _3590 = _3576;
    if (_3536)
    {
        float _3592 = rint(_3576);
        float _3594 = precise::max(_3592, 0.0);
        uint _3596 = uint(_3594);
        uint _3598 = clamp(_3596, 0u, 65535u);
        _3590 = as_type<float>(_3598);
    }
    float _3600 = _3590;
    float _3602 = fma(_3528, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3580);
    float _3604 = _3540 * _3420;
    float _3606 = fma(_3552, 0.5, 0.5);
    float _3608 = _3602;
    if (!_3166)
    {
        float _3610 = -_3434;
        float _3612 = _3000 + _3610;
        _3430 = _3612;
    }
    float _3614 = _3430;
    float _3616 = _3588 * _3564;
    float _3618 = _3402;
    if (!_3166)
    {
        float _3620 = rint(_3482);
        float _3622 = precise::max(_3620, 0.0);
        uint _3624 = uint(_3622);
        uint _3626 = clamp(_3624, 0u, 65535u);
        _3618 = as_type<float>(_3626);
    }
    float _3628 = _3618;
    float _3630 = _3602 * _3564;
    float _3632 = fma(_3616, 0.5, 0.5);
    float _3634 = fma(_3630, -0.5, 0.5);
    float _3636 = _3600;
    if (_3536)
    {
        float3 _9603 = float3(_3496, _3508, float(as_type<int>(_3600)));
        float3 _9607 = select(_9603, float3(0.0), isnan(_9603));
        float _3638 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9607.xy, uint(rint(_9607.z)), _3604, level(0.0));
        _3636 = _3638;
    }
    float _3640 = _3636;
    float3 _9617 = float3(_3632, _3634, _3586);
    float _3642 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9617, float3(0.0), isnan(_9617)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9617, float3(0.0), isnan(_9617)), level(0.0)).x;
    float3 _9626 = float3(_3632, _3634, _3586);
    float4 _3645 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9626, float3(0.0), isnan(_9626)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9626, float3(0.0), isnan(_9626)), level(0.0)).xyzw;
    float _3647 = _3645.x;
    float _3649 = _3645.y;
    float _3651 = _3645.z;
    float _3653 = _3645.w;
    float2 _9642 = float2(_3584, _3606);
    float3 _3655 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9642, float2(0.0), isnan(_9642)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9642, float2(0.0), isnan(_9642)), level(0.0)).xyz;
    float _3657 = _3655.x;
    float _3659 = _3655.y;
    float _3661 = _3655.z;
    float _3663 = _3412;
    if (!_3166)
    {
        float3 _9663 = float3(_3614, _3412, float(as_type<int>(_3628)));
        float3 _9665 = select(_9663, float3(0.0), isnan(_9663));
        float _3665 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9665.xy, uint(rint(_9665.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9665.xy, uint(rint(_9665.z)), level(0.0)).x;
        _3663 = _3665;
    }
    float _3667 = _3663;
    float _3669 = abs(_3008);
    float _3671 = log2(_3669);
    float _3673 = _3494 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3675 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3677 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3673);
    float _3679 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3677);
    float _3681 = exp2(_3675);
    bool _3683 = _3008 <= 8000.0;
    bool _3685 = isnan(_3008);
    bool _3687 = _3683 || _3685;
    bool _3689 = isnan(8000.0);
    bool _3691 = _3687 || _3689;
    float _3693 = float(_3691);
    float _3695 = fma(_3528, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3679);
    float _3697 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3588;
    out.gl_Position.y = _3602;
    out.gl_Position.z = _3695;
    out.gl_Position.w = _3556;
    float _3699 = exp2(_3697);
    float _3701 = fma(_3699, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3703 = precise::clamp(_3701, 0.0, 1.0);
    float _3705 = fma(_3703, -2.0, 3.0);
    float _3707 = _3703 * _3703;
    float _3709 = _3707 * _3705;
    float _3711 = -_3709;
    float _3713 = _3711 + 1.0;
    float _3715 = fma(_3713, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3709);
    float _3717 = -_3681;
    float _3719 = _3717 + 1.0;
    float _3721 = _3693 * _3715;
    float _3723 = _3715;
    float _3725 = _3695;
    if (!_3536)
    {
        _3723 = 1.0;
    }
    float _3727 = _3723;
    float _3729 = _3721 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3731 = -_3490;
    float _3733 = _3731 + 1.0;
    float _3735 = _3733 * _3729;
    float _3737 = precise::clamp(_3735, 0.0, 1.0);
    float _3739 = _3729;
    float _3741 = _3727;
    if (_3166)
    {
        _3739 = 1.0;
    }
    float _3743 = _3739;
    float _3745 = _3743;
    if (_3536)
    {
        bool _3747 = _3640 >= _3604;
        bool _3749 = isnan(_3640);
        bool _3751 = _3747 || _3749;
        bool _3753 = isnan(_3604);
        bool _3755 = _3751 || _3753;
        float _3757 = float(_3755);
        _3741 = _3757;
    }
    float _3759 = _3741;
    float _3761 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3763 = _3759;
    if (!_3166)
    {
        int _3765 = _3320 << 4;
        int _3767 = _3765 + 2048;
        uint _3769 = uint(int(uint(_3767) >> uint(2)));
        uint _3771 = uint(int(uint(int(_3769)) >> uint(2)));
        int _3773 = int(_3769) & 3;
        float _3775 = (*spvDescriptorSet0.vp_c15)._m0[int(_3771)][_3773];
        int _3777 = int(_3769) + 1;
        uint _3779 = uint(int(uint(_3777) >> uint(2)));
        int _3781 = _3777 & 3;
        float _3783 = (*spvDescriptorSet0.vp_c15)._m0[int(_3779)][_3781];
        int _3785 = _3767 + 8;
        uint _3787 = uint(int(uint(_3785) >> uint(2)));
        uint _3789 = uint(int(uint(int(_3787)) >> uint(2)));
        int _3791 = int(_3787) & 3;
        float _3793 = (*spvDescriptorSet0.vp_c15)._m0[int(_3789)][_3791];
        int _3795 = int(_3787) + 1;
        uint _3797 = uint(int(uint(_3795) >> uint(2)));
        int _3799 = _3795 & 3;
        float _3801 = (*spvDescriptorSet0.vp_c15)._m0[int(_3797)][_3799];
        float _3803 = _2978 * _3783;
        float _3805 = fma(_1047, _3775, _3803);
        float _3807 = fma(_1049, _3793, _3805);
        float _3809 = _3807 + _3801;
        float _3811 = precise::clamp(_3809, 0.0, 1.0);
        float _3813 = -_3811;
        float _3815 = _3813 + _3667;
        float _3817 = fma(_3815, 500.0, 1.5);
        float _3819 = exp2(_3817);
        float _3821 = 0.0 + _3819;
        float _3823 = precise::clamp(_3821, 0.0, 1.0);
        _3745 = _3823;
        _3572 = _3801;
        _3608 = _3783;
        _3725 = _3793;
    }
    float _3825 = _3745;
    float _3827 = _3572;
    float _3829 = _3608;
    float _3831 = _3725;
    float _3833 = _3759 * _3825;
    float _3835 = _3761 * _3642;
    float _3837 = -_3737;
    float _3839 = fma(_3837, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3841 = -_3761;
    float _3843 = _3841 + 1.0;
    out.m_98.x = _2908;
    out.m_98.y = _2906;
    out.m_98.z = _2910;
    float _3845 = _3653 * _3835;
    float _3847 = -_3833;
    float _3849 = fma(_3847, _3839, 1.0);
    float _3851 = precise::clamp(_3849, 0.0, 1.0);
    float _3853 = _3661 * _3835;
    float _3855 = _3653 * _3843;
    float _3857 = fma(_3657, _3845, _3647);
    float _3859 = fma(_3659, _3845, _3649);
    float _3861 = _3851 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3863 = fma(_3653, _3853, _3651);
    bool _3865 = _2954 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3867 = isnan(_2954);
    bool _3869 = _3865 || _3867;
    bool _3871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3873 = _3869 || _3871;
    out.m_100.x = _3861;
    out.m_102.x = _3857;
    out.m_102.y = _3859;
    out.m_102.z = _3863;
    out.m_102.w = _3855;
    float _3875 = _3827;
    float _3877 = _3831;
    float _3879 = _3829;
    float _3881 = _3845;
    float _3883 = _3851;
    if (!_3873)
    {
        _3763 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3885 = _3763;
    float _3887 = _3885;
    float _3889 = _3885;
    if (!_3873)
    {
        _3875 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3891 = _3875;
    float _3893 = _3891;
    float _3895 = _3891;
    if (!_3873)
    {
        _3877 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3897 = _3877;
    float _3899 = _3897;
    float _3901 = _3897;
    if (!_3873)
    {
        _3879 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3903 = _3879;
    float _3905 = _3903;
    float _3907 = _3903;
    if (!_3873)
    {
        _3881 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3909 = _3881;
    float _3911 = _3909;
    float _3913 = _3909;
    if (!_3873)
    {
        _3883 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3915 = _3883;
    bool _3917 = !_3873;
    float _3919 = _3915;
    float _3921 = _3915;
    if (!_3917)
    {
        bool _3923 = _2954 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3925 = isnan(_2954);
        bool _3927 = _3923 || _3925;
        bool _3929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3931 = _3927 || _3929;
        if (!_3931)
        {
            float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3935 = _2954 + _3933;
            float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3939 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3937;
            float _3941 = 1.0 / _3939;
            float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3949 = _3947 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3955 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3957 = _3955 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3963 = _3935 * _3941;
            float _3965 = precise::clamp(_3963, 0.0, 1.0);
            float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3971 = fma(_3965, _3945, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3973 = fma(_3965, _3969, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3975 = fma(_3965, _3949, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3977 = fma(_3965, _3953, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3979 = fma(_3965, _3957, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3981 = fma(_3965, _3961, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3895 = _3973;
            _3913 = _3979;
            _3889 = _3971;
            _3907 = _3977;
            _3901 = _3975;
            _3921 = _3981;
            _3983 = true;
        }
        else
        {
            bool _3985 = _2954 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3987 = isnan(_2954);
            bool _3989 = _3985 || _3987;
            bool _3991 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3993 = _3989 || _3991;
            if (!_3993)
            {
                _3887 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3995 = _3887;
            _3889 = _3995;
            if (!_3993)
            {
                _3893 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3997 = _3893;
            _3895 = _3997;
            if (!_3993)
            {
                _3899 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3999 = _3899;
            _3901 = _3999;
            if (!_3993)
            {
                _3905 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4001 = _3905;
            _3907 = _4001;
            if (!_3993)
            {
                _3911 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4003 = _3911;
            _3913 = _4003;
            if (!_3993)
            {
                _3919 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4005 = _3919;
            bool _4007 = !_3993;
            _3921 = _4005;
            if (!_4007)
            {
                bool _4009 = _2954 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4011 = isnan(_2954);
                bool _4013 = _4009 || _4011;
                bool _4015 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4017 = _4013 || _4015;
                if (!_4017)
                {
                    float _4019 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4021 = _2954 + _4019;
                    float _4023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4025 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4023;
                    float _4027 = 1.0 / _4025;
                    float _4029 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4033 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4037 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4039 = _4037 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4041 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4043 = _4041 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4047 = _4045 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4049 = _4021 * _4027;
                    float _4051 = precise::clamp(_4049, 0.0, 1.0);
                    float _4053 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4057 = fma(_4051, _4031, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4059 = fma(_4051, _4055, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4061 = fma(_4051, _4035, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4063 = fma(_4051, _4039, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4065 = fma(_4051, _4043, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4067 = fma(_4051, _4047, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3895 = _4059;
                    _3913 = _4065;
                    _3889 = _4057;
                    _3907 = _4063;
                    _3901 = _4061;
                    _3921 = _4067;
                    _3983 = true;
                }
                else
                {
                    _3895 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3913 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3889 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3907 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3901 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3921 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3983 = false;
    float _4069 = _3895;
    float _4071 = _3913;
    float _4073 = _3889;
    float _4075 = _3907;
    float _4077 = _3901;
    float _4079 = _3921;
    float _4081 = fma(_2750, -0.5, 0.5);
    float _4083 = precise::clamp(_4081, 0.0, 1.0);
    float _4085 = -_4069;
    float _4087 = _4085 + _4071;
    float _4089 = -_4073;
    float _4091 = _4089 + _4075;
    float _4093 = -_4077;
    float _4095 = _4093 + _4079;
    bool _4097 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4099 = fma(_4083, _4087, _4069);
    float _4101 = fma(_4083, _4091, _4073);
    float _4103 = fma(_4083, _4095, _4077);
    float _4105 = _4099 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _4107 = fma(_4101, 0.298911988735198974609375, _4105);
    float _4109 = fma(_4103, 0.114477999508380889892578125, _4107);
    out.m_104.x = 0.0;
    float _4111 = -_4109;
    float _4113 = _4101 + _4111;
    float _4115 = -_4109;
    float _4117 = _4099 + _4115;
    float _4119 = -_4109;
    float _4121 = _4103 + _4119;
    float _4123 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4125 = fma(_4113, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4109);
    float _4127 = fma(_4117, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4109);
    float _4129 = fma(_4121, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4109);
    out.m_100.w = _4123;
    out.m_106.x = _4125;
    out.m_106.y = _4127;
    out.m_106.z = _4129;
    if (!_4097)
    {
        return out;
    }
    float _4131 = -_2906;
    float _4133 = _4131 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4135 = -_2908;
    float _4137 = _4135 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4139 = -_2910;
    float _4141 = _4139 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4143 = _4133 * _4133;
    float _4145 = fma(_4137, _4137, _4143);
    float _4147 = fma(_4141, _4141, _4145);
    float _4149 = sqrt(_4147);
    float _4151 = rsqrt(_4147);
    float _4153 = -_4149;
    float _4155 = _4153 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4157 = _4155 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4159 = precise::clamp(_4157, 0.0, 1.0);
    float _4161 = _4137 * _4151;
    float _4163 = _4133 * _4151;
    float _4165 = abs(_4159);
    float _4167 = log2(_4165);
    float _4169 = _4141 * _4151;
    float _4171 = _4161 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4173 = _2750 * _4163;
    float _4175 = -_4163;
    float _4177 = -_4171;
    float _4179 = fma(_4175, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4177);
    float _4181 = fma(_2792, _4161, _4173);
    float _4183 = -_4169;
    float _4185 = fma(_4183, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4179);
    float _4187 = fma(_2808, _4169, _4181);
    float _4189 = precise::clamp(_4187, 0.0, 1.0);
    float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4193 = _4185 + _4191;
    float _4195 = _4167 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4197 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4199 = precise::clamp(_4197, 0.0, 1.0);
    float _4201 = exp2(_4195);
    float _4203 = _4201 * _4199;
    float _4205 = _4189 * _4203;
    float _4207 = _4205 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4209 = _4205 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4211 = _4205 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_104.x = _4207;
    out.m_104.y = _4209;
    out.m_104.z = _4211;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3983 = false;
    bool _2860 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_60.w;
    float _122 = trunc(_120);
    int _125 = int(_122);
    bool _129 = _125 >= 1;
    float _131 = 0.0;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    float _135 = _133;
    if (!_129)
    {
        out.m_63.x = 0.0;
    }
    int _137 = 0;
    if (!_129)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4268 = as_type<float>(_141);
        out.gl_Position.z = _4268;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_65.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _161 = 0.0;
    float _163 = _159;
    if (_155)
    {
        float _165 = float(_125);
        _161 = _165;
    }
    float _167 = _161;
    bool _169 = _159 >= _167;
    bool _171 = !_155;
    bool _173 = _169 || _171;
    if (_173)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _135;
    if (_173)
    {
        out.m_63.x = 0.0;
    }
    if (_173)
    {
        float _177 = _175 * 5.0;
        _143 = as_type<int>(_177);
    }
    int _179 = _143;
    if (_173)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4337 = as_type<float>(_179);
        out.gl_Position.z = _4337;
    }
    if (_173)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _185 = as_type<int>(_181) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_181) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    float _219;
    if (!_201)
    {
        float _203 = in.m_70.x;
        float _205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _207 = _203 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _211 = _209 * _205;
        float _213 = floor(_211);
        float _215 = -_213;
        float _217 = _211 + _215;
        _219 = _217;
        _221 = true;
    }
    else
    {
        float _223 = float(_125);
        float _225 = 1.0 / _223;
        float _227 = _159 * _225;
        _219 = _227;
    }
    _221 = false;
    float _229 = _219;
    float _231 = in.m_70.x;
    float _233 = in.m_70.y;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = _229 + _235;
    float _239 = in.m_70.z;
    float _241 = in.m_70.w;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _253 = 1.0 / _245;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _255;
    int _259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _261 = _259 != 0;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _265 = 1.0 / _249;
    float _267 = _231 * 2.0;
    float _269 = _233 * 2.0;
    float _271 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _273 = 1.0 / _257;
    float _275 = _239 * 2.0;
    float _277 = -_251;
    float _279 = fma(_271, 2.0, _277);
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = _229 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = floor(_267);
    float _291 = _283 * _253;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _295 = _229 + _293;
    int _297 = as_type<int>(_253);
    float _299 = _291;
    if (_261)
    {
        _297 = 0;
    }
    int _301 = _297;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _303;
    int _307 = _301;
    if (!_261)
    {
        _307 = 1;
    }
    int _309 = _307;
    float _311 = _295 * _265;
    float _313 = _231 + _233;
    float _315 = floor(_269);
    float _317 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _319 = _237 * _273;
    float _321 = _313 + (-1.0);
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _325 = _323 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _327 = fma(_317, -2.0, _263);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _333 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _335 = _289 > 0.0;
    float _337 = floor(_275);
    bool _339 = _289 >= 0.0;
    bool _341 = isnan(_289);
    bool _343 = _339 || _341;
    bool _345 = isnan(0.0);
    bool _347 = _343 || _345;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _351 = fma(_325, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _353 = _347 ? 0 : 1;
    float _355 = fma(_331, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _357 = _315 > 0.0;
    float _359 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _361 = int(_359);
    bool _363 = _315 >= 0.0;
    bool _365 = isnan(_315);
    bool _367 = _363 || _365;
    bool _369 = isnan(0.0);
    bool _371 = _367 || _369;
    float _373 = fma(_287, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _375 = ~_353;
    int _377 = _375 + 1;
    int _379 = _377 + 1;
    float _381 = fma(_305, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _383 = _371 ? 0 : 1;
    float _385 = -_159;
    float _387 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[76].x, _279);
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _391 = _389 != 0;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _395 = _393 != 0;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _399 = _397 != 0;
    float _401 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _403 = int(_401);
    int _405 = _379;
    float _407 = _311;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    if (!_335)
    {
        int _411 = ~_353;
        int _413 = _411 + 1;
        _405 = _413;
    }
    int _415 = _405;
    float _417 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _327);
    bool _419 = _233 > 0.5;
    bool _421 = _239 > 0.5;
    int _423 = ~_383;
    int _425 = _423 + 1;
    int _427 = _425 + 1;
    bool _429 = !_395;
    int _431 = _429 ? 0 : 1;
    bool _433 = !_391;
    int _435 = _433 ? 0 : 1;
    int _437 = _427;
    if (!_357)
    {
        int _439 = ~_383;
        int _441 = _439 + 1;
        _437 = _441;
    }
    int _443 = _437;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _451 = _449 != 0;
    float _453 = -_195;
    int _455 = _419 ? as_type<int>(_453) : as_type<int>(_195);
    float _457 = -_199;
    int _459 = _421 ? as_type<int>(_457) : as_type<int>(_199);
    bool _461 = !_399;
    int _463 = _461 ? 0 : 1;
    bool _465 = !_447;
    float _467 = _465 ? _195 : as_type<float>(_455);
    bool _469 = !_451;
    float _471 = _469 ? _199 : as_type<float>(_459);
    float _473 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _475 = int(_473);
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _479 = _477 != 0;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _483 = _481 != 0;
    int _485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _487 = _485 != 0;
    int _489 = int(_261);
    int _491 = _419 ? 2 : 0;
    int _493 = _489 | _491;
    int _495 = _357 ? 4 : 0;
    int _497 = _493 | _495;
    int _499 = _421 ? 8 : 0;
    int _501 = _497 | _499;
    int _503 = _479 ? 16 : 0;
    int _505 = _501 | _503;
    int _507 = _483 ? 32 : 0;
    int _509 = _505 | _507;
    int _511 = _487 ? 64 : 0;
    int _513 = _509 | _511;
    int _515 = _513 & 2;
    bool _517 = _309 != 1;
    float _519 = _233 + _239;
    bool _521 = _337 >= 0.0;
    bool _523 = isnan(_337);
    bool _525 = _521 || _523;
    bool _527 = isnan(0.0);
    bool _529 = _525 || _527;
    float _531 = _519 + (-1.0);
    int _533 = _529 ? 0 : 1;
    bool _535 = _337 > 0.0;
    float _537 = _231 + _239;
    float _539 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _541 = !_483;
    int _543 = _541 ? 0 : 1;
    float _545 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _547 = int(_545);
    float _549 = _537 + (-1.0);
    if (!_517)
    {
        _407 = _233;
    }
    float _551 = _407;
    float _553 = _537;
    float _555 = _551;
    if (!_517)
    {
        float _557 = in.m_70.z;
        _553 = _557;
    }
    float _559 = _553;
    if (_517)
    {
        _555 = _231;
    }
    float _561 = _555;
    float _563 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _565 = ~_533;
    int _567 = _565 + 1;
    int _569 = _567 + 1;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _573 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _575 = log2(_573);
    int _577 = _569;
    if (!_535)
    {
        int _579 = ~_533;
        int _581 = _579 + 1;
        _577 = _581;
    }
    int _583 = _577;
    float _585 = _561 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _587 = _239 + (-0.5);
    float _589 = -_571;
    float _591 = fma(_585, 2.0, _589);
    int _593 = abs(_543);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_517)
    {
        _299 = _233;
    }
    float _597 = _299;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _601 = _597;
    if (_517)
    {
        _601 = _231;
    }
    float _603 = _601;
    float _605 = float(_415);
    float _607 = float(_583);
    float _609 = _575 * _159;
    float _611 = float(_593);
    float _613 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[83].z, _595);
    float _615 = _559;
    if (!_517)
    {
        _409 = _559;
    }
    float _617 = _409;
    float _619 = _617;
    if (_517)
    {
        _615 = _233;
    }
    float _621 = _615;
    float _623 = _611 * _605;
    if (_517)
    {
        _619 = _233;
    }
    float _625 = _619;
    float _627 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _613);
    float _629 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[83].w, _349);
    bool _631 = !_479;
    int _633 = _631 ? 0 : 1;
    float _635 = _625 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _637 = !_487;
    int _639 = _637 ? 0 : 1;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _643 = 1.0 + _641;
    int _645 = abs(_633);
    float _647 = fma(_635, -2.0, _599);
    float _649 = float(_361);
    float _651 = exp2(_609);
    float _653 = float(_645);
    float _655 = _623 * (-2.0);
    float _657 = float(_547);
    float _659 = float(_443);
    float _661 = _653 * _607;
    int _663 = abs(_639);
    float _665 = in.m_72.x;
    float _667 = in.m_72.y;
    float _669 = in.m_72.z;
    float _671 = 1.0 / _649;
    float _673 = float(_663);
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _677 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _679 = isnan(1.0);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _685 = _681 || _683;
    float _687 = _673 * _659;
    float _689 = -_651;
    float _691 = _689 + 1.0;
    float _693 = 1.0 / _657;
    float _695 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].z, _675);
    bool _697 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _699 = isnan(0.0);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _705 = _701 || _703;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _709 = float(_475);
    float _711 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _695);
    float _713 = float(_403);
    float _715 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _707);
    float _717 = 1.0 / _643;
    float _719 = _705 ? _691 : 0.0;
    float _721 = _709 * _159;
    float _723 = _713 * _159;
    float _725 = _671 * _159;
    float _727 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _715);
    float _729 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _629);
    float _731 = _231 + (-0.5);
    float _733 = _693 * _159;
    float _735 = -_159;
    float _737 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[81].x, _591);
    float _739 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _647);
    float _741 = _661 * (-2.0);
    bool _743 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _745 = isnan(_229);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = _233 + (-0.5);
    bool _757 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _759 = isnan(_229);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = fma(_741, _665, _665);
    float _771 = fma(_333, _741, _333);
    if (_685)
    {
        float _773 = _719 * _717;
        _163 = _773;
    }
    float _775 = _163;
    bool _777 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _779 = isnan(_229);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -_753;
    float _791 = _789 + 1.0;
    float _793 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[196].x, _769);
    bool _795 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _797 = isnan(_229);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = fma(_539, _655, _539);
    float _809 = _787 * _791;
    float _811 = -_787;
    float _813 = _811 + 1.0;
    float _815 = fma(_655, _667, _667);
    float _817 = fma(_771, _775, _793);
    float _819 = _687 * (-2.0);
    float _821 = _805 * _813;
    float _823 = -_805;
    float _825 = _823 + 1.0;
    float _827 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[196].y, _815);
    float _829 = fma(_819, _669, _669);
    float _831 = in.m_74.x;
    float _833 = in.m_74.y;
    float _835 = _767 * _825;
    float _837 = fma(_563, _819, _563);
    float _839 = fma(_807, _775, _827);
    float _841 = _381 * _835;
    float _843 = -_767;
    float _845 = _843 + 1.0;
    float _847 = _373 * _835;
    float _849 = _817 * 0.15915493667125701904296875;
    float _851 = _839 * 0.15915493667125701904296875;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _853;
    float _857 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[143].y, _841);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _859;
    float _863 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[143].x, _847);
    float _865 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[196].z, _829);
    float _867 = _849 * 6.283185482025146484375;
    float _869 = sin(_867);
    float _871 = in.m_60.x;
    float _873 = in.m_60.y;
    float _875 = in.m_60.z;
    float _877 = fma(_355, _821, _857);
    float _879 = fma(_351, _821, _863);
    float _881 = fma(_837, _775, _865);
    float _883 = in.m_76.x;
    float _885 = in.m_76.y;
    float _887 = in.m_76.z;
    float _889 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    int _891 = int(_261);
    int _893 = _705 ? 2 : 0;
    int _895 = _891 | _893;
    int _897 = _685 ? 4 : 0;
    int _899 = _895 | _897;
    int _901 = _421 ? 8 : 0;
    int _903 = _899 | _901;
    int _905 = _479 ? 16 : 0;
    int _907 = _903 | _905;
    int _909 = _483 ? 32 : 0;
    int _911 = _907 | _909;
    int _913 = _487 ? 64 : 0;
    int _915 = _911 | _913;
    int _917 = _915 & 8;
    float _919 = _849 * 6.283185482025146484375;
    float _921 = cos(_919);
    float _923 = _881 * 0.15915493667125701904296875;
    float _925 = _851 * 6.283185482025146484375;
    float _927 = sin(_925);
    float _929 = fma(_855, _319, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _931 = fma(_861, _319, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _933 = fma(_929, _809, _879);
    float _935 = fma(_931, _809, _877);
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _939 = _851 * 6.283185482025146484375;
    float _941 = cos(_939);
    float _943 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[146].x, _933);
    float _945 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[146].y, _935);
    float _947 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _949 = _943 * _831;
    float _951 = _945 * _833;
    float _953 = _873 * _885;
    float _955 = _923 * 6.283185482025146484375;
    float _957 = cos(_955);
    float _959 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _961 = _951 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _963 = fma(_871, _883, _953);
    float _965 = in.m_78.x;
    float _967 = in.m_78.y;
    float _969 = in.m_78.z;
    float _971 = _959 * _937;
    float _973 = _961 * _889;
    float _975 = _869 * _927;
    float _977 = _923 * 6.283185482025146484375;
    float _979 = sin(_977);
    float _981 = _921 * _941;
    float _983 = _869 * _941;
    float _985 = _921 * _927;
    float _987 = fma(_875, _887, _963);
    float _989 = _921 * _957;
    float _991 = _941 * _957;
    float _993 = _869 * _957;
    float _995 = _927 * _957;
    float _997 = _989 * _973;
    float _999 = fma(_979, _981, _975);
    float _1001 = -_985;
    float _1003 = fma(_979, _983, _1001);
    float _1005 = -_973;
    float _1007 = _979 * _1005;
    float _1009 = -_983;
    float _1011 = fma(_979, _985, _1009);
    float _1013 = fma(_999, _971, _997);
    float _1015 = _993 * _973;
    float _1017 = fma(_991, _971, _1007);
    float _1019 = fma(_979, _975, _981);
    float _1021 = fma(_1011, _947, _1013);
    float _1023 = fma(_1003, _971, _1015);
    float _1025 = fma(_995, _947, _1017);
    float _1027 = _873 * _967;
    float _1029 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1031 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1033 = fma(_1019, _947, _1023);
    float _1035 = fma(_871, _965, _1027);
    float _1037 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1029);
    float _1039 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1031);
    float _1041 = fma(_875, _969, _1035);
    float _1043 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1037);
    float _1045 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1039);
    float _1047 = _987 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1049 = _1041 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1051 = _1043 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1053 = _1045 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1055 = _1047 + _1051;
    float _1057 = _1049 + _1053;
    float _1059 = in.m_80.x;
    float _1061 = in.m_80.y;
    float _1063 = in.m_80.z;
    float _1065 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1067 = _1055 + _1065;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1071 = _1057 + _1069;
    float _1073 = _1067 * _1067;
    float _1075 = _1071 * _1071;
    float _1077 = _1073 + _1075;
    float _1079 = sqrt(_1077);
    float _1081 = _873 * _1061;
    float _1083 = fma(_871, _1059, _1081);
    bool _1085 = _1079 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1087 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1089 = _1079 + _1087;
    float _1091 = fma(_875, _1063, _1083);
    float _1093 = _1091 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1095 = 0.0;
    float _1097 = _1077;
    float _1099 = _1079;
    float _1101 = _1021;
    float _1103 = _873;
    float _1105 = _1073;
    float _1107 = _1003;
    if (_1085)
    {
        float _1109 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1095 = _1109;
    }
    float _1111 = _1095;
    if (_1085)
    {
        float _1113 = rsqrt(_1077);
        _1097 = _1113;
    }
    float _1115 = _1097;
    if (_1085)
    {
        float _1117 = _1089 * _1111;
        _1099 = _1117;
    }
    float _1119 = _1099;
    float _1121 = _1021 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1123 = _1119;
    if (!_1085)
    {
        _1101 = _1055;
    }
    float _1125 = _1101;
    float _1127 = _1125;
    if (_1085)
    {
        float _1129 = _1119 * 0.15915493667125701904296875;
        _1123 = _1129;
    }
    float _1131 = _1123;
    float _1133 = fma(_1025, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1121);
    float _1135 = _871;
    if (_1085)
    {
        float _1137 = _1131 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        _1135 = _1139;
    }
    float _1141 = _1135;
    float _1143 = fma(_1033, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1133);
    float _1145 = _1143 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1147 = _1093 + _1145;
    float _1149 = _1145;
    float _1151 = _1147;
    if (!_1085)
    {
        _1149 = _1057;
    }
    float _1153 = _1149;
    float _1155 = _1153;
    if (_1085)
    {
        float _1157 = _1147 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1103 = _1157;
    }
    float _1159 = _1103;
    float _1161 = _1141;
    if (_1085)
    {
        float _1163 = fma(_1141, _1159, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1161 = _1163;
    }
    float _1165 = _1161;
    float _1167 = _1165;
    if (_1085)
    {
        float _1169 = _1115 * _1165;
        _1167 = _1169;
    }
    float _1171 = _1167;
    if (_1085)
    {
        float _1173 = fma(_1067, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1127 = _1173;
    }
    float _1175 = _1127;
    if (_1085)
    {
        float _1177 = fma(_1071, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1155 = _1177;
    }
    float _1179 = _1155;
    float _1181 = fma(_1175, 6.2500002968590706586837768554688e-05, 0.5);
    float _1183 = fma(_1179, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5869 = float2(_1181, _1183);
    float3 _1187 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5869, float2(0.0), isnan(_5869)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5869, float2(0.0), isnan(_5869)), level(0.0)).xyz;
    float _1189 = _1187.x;
    float _1191 = _1187.y;
    float _1193 = _1187.z;
    float _1195 = float(uint(_475));
    float _1197 = trunc(_725);
    int _1199 = int(_1197);
    float _1201 = float(uint(_403));
    float _1203 = -_471;
    float _1205 = _1203 + 0.5;
    int _1207 = ~_475;
    int _1209 = _1207 + 1;
    float _1211 = -_729;
    float _1213 = _1211 + 1.0;
    int _1215 = ~_475;
    int _1217 = _1215 + 1;
    float _1219 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1221 = _475 == 0;
    float _1223 = 1.0 / _1195;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1227 = _1225 != 0;
    float _1229 = -_727;
    float _1231 = _1229 + 1.0;
    float _1233 = -_627;
    float _1235 = _1233 + 1.0;
    float _1237 = float(uint(_1199));
    float _1239 = 1.0 / _1201;
    int _1241 = as_type<int>(_1223) + (-2);
    float _1243 = trunc(_733);
    int _1245 = int(_1243);
    float _1247 = as_type<float>(_1241) * _1237;
    float _1249 = _1237;
    if (_261)
    {
        _1249 = 1.0;
    }
    float _1251 = _1249;
    float _1253 = _1251;
    if (!_261)
    {
        _1253 = 7.345489978790283203125;
    }
    float _1255 = _1253;
    float _1257 = float(_125);
    float _1259 = trunc(_1247);
    float _1261 = precise::max(_1259, 0.0);
    uint _1264 = uint(_1261);
    float _1266 = _1255 * _231;
    float _1268 = _1255;
    if (_261)
    {
        float _1270 = in.m_70.x;
        _1268 = _1270;
    }
    float _1272 = _1268;
    float _1274 = 1.0 / _1257;
    float _1276 = _1272;
    if (!_261)
    {
        float _1278 = in.m_70.y;
        _1276 = _1278;
    }
    float _1280 = _1276;
    int _1282 = _1209 * int(_1264);
    int _1284 = _1282 + _1199;
    float _1286 = float(uint(_1284));
    float _1288 = float(uint(_1245));
    float _1290 = _721 * _1274;
    float _1292 = _723 * _1274;
    float _1294 = as_type<float>(_1241) * _1286;
    int _1296 = as_type<int>(_1239) + (-2);
    float _1298 = floor(_1266);
    int _1300 = _403 + (-1);
    float _1302 = as_type<float>(_1296) * _1288;
    float _1304 = trunc(_1294);
    float _1306 = precise::max(_1304, 0.0);
    uint _1308 = uint(_1306);
    float _1310 = trunc(_1302);
    float _1312 = precise::max(_1310, 0.0);
    uint _1314 = uint(_1312);
    float _1316 = -_1298;
    float _1318 = _1266 + _1316;
    int _1320 = int(_1264) + int(_1308);
    float _1322 = trunc(_1292);
    int _1324 = int(_1322);
    int _1326 = ~_403;
    int _1328 = _1326 + 1;
    float _1330 = float(_1199);
    int _1332 = _1217 * _1320;
    int _1334 = _1332 + _1199;
    bool _1336 = _1330 >= _709;
    bool _1338 = isnan(_1330);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan(_709);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = _1318 * _709;
    bool _1350 = uint(_1334) >= uint(_475);
    int _1352 = _1328 * int(_1314);
    int _1354 = _1352 + _1245;
    float _1356 = trunc(_1346);
    int _1358 = int(_1356);
    bool _1360 = !_1350;
    int _1362 = _1360 ? 0 : (-1);
    float _1364 = float(uint(_1354));
    int _1366 = ~_1320;
    int _1368 = _1366 + _1362;
    int _1370 = _1368 + 1;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1374 = _1372 != 0;
    float _1376 = as_type<float>(_1296) * _1364;
    float _1378 = trunc(_1348);
    int _1380 = int(_1378);
    int _1382 = _475 * _1370;
    int _1384 = _1382 + _1199;
    bool _1386 = !_1374;
    int _1388 = _1386 ? 0 : 1;
    int _1390 = _475 + (-1);
    int _1392 = abs(_1388);
    float _1394 = trunc(_1376);
    float _1396 = precise::max(_1394, 0.0);
    uint _1398 = uint(_1396);
    int _1400 = ~_1358;
    int _1402 = _1400 + 1;
    int _1404 = _1402 + 1;
    bool _1406 = !_1221;
    int _1408 = _1406 ? _1384 : (-1);
    int _1410 = abs(_431);
    int _1412 = _1408 * _1404;
    float _1414 = trunc(_1290);
    int _1416 = int(_1414);
    float _1418 = _1364;
    if (_261)
    {
        _1418 = 1.0;
    }
    float _1420 = _1418;
    int _1422 = _1380 * _1392;
    int _1424 = _1422 + _1199;
    float _1426 = _1420;
    if (!_261)
    {
        _1426 = 1.2345600128173828125;
    }
    float _1428 = _1426;
    int _1430 = _1358 * _1390;
    int _1432 = _1430 + _1412;
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1436 = _1434 != 0;
    float _1438 = _1428 * _1280;
    int _1440 = int(_1314) + int(_1398);
    int _1442 = _1432 * _1410;
    int _1444 = abs(_435);
    float _1446 = floor(_1438);
    bool _1448 = !_1436;
    int _1450 = _1448 ? 0 : 1;
    int _1452 = abs(_463);
    int _1454 = _1416 * _1444;
    int _1456 = _1454 + _1442;
    int _1458 = abs(_1450);
    int _1460 = ~_403;
    int _1462 = _1460 + 1;
    float _1464 = float(_1245);
    int _1466 = _1424 * _1452;
    int _1468 = _1466 + _1456;
    int _1470 = _1462 * _1440;
    int _1472 = _1470 + _1245;
    bool _1474 = _1464 >= _713;
    bool _1476 = isnan(_1464);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan(_713);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    int _1486 = _1380 * _1458;
    int _1488 = _1486 + _1468;
    float _1490 = -_1446;
    float _1492 = _1438 + _1490;
    float _1494 = trunc(_1484);
    int _1496 = int(_1494);
    bool _1498 = uint(_1472) >= uint(_403);
    float _1500 = _713 * _1492;
    float _1502 = float(uint(_1488));
    float _1504 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1506 = !_1498;
    int _1508 = _1506 ? 0 : (-1);
    int _1510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1512 = _1510 != 0;
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1516 = _1514 != 0;
    float _1518 = as_type<float>(_1241) * _1502;
    int _1520 = ~_1440;
    int _1522 = _1520 + _1508;
    int _1524 = _1522 + 1;
    float _1526 = trunc(_1500);
    int _1528 = int(_1526);
    bool _1530 = _403 == 0;
    bool _1532 = !_1227;
    int _1534 = _1532 ? 0 : 1;
    int _1536 = _403 * _1524;
    int _1538 = _1536 + _1245;
    int _1540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1542 = _1540 != 0;
    int _1544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1546 = _1544 != 0;
    int _1548 = ~_1496;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    float _1554 = trunc(_1518);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    bool _1560 = !_1530;
    int _1562 = _1560 ? _1538 : (-1);
    int _1564 = abs(_1534);
    int _1566 = ~_475;
    int _1568 = _1566 + 1;
    int _1570 = _1552 * _1562;
    bool _1572 = !_1516;
    int _1574 = _1572 ? 0 : 1;
    int _1576 = _1528 * _1564;
    int _1578 = _1576 + _1245;
    bool _1580 = !_1512;
    int _1582 = _1580 ? 0 : 1;
    int _1584 = _1496 * _1300;
    int _1586 = _1584 + _1570;
    int _1588 = abs(_1574);
    bool _1590 = !_1542;
    int _1592 = _1590 ? 0 : 1;
    int _1594 = abs(_1582);
    int _1596 = _1568 * int(_1558);
    int _1598 = _1596 + _1488;
    bool _1600 = !_1546;
    int _1602 = _1600 ? 0 : 1;
    bool _1604 = _515 != 0;
    int _1606 = abs(_1592);
    int _1608 = _1586 * _1588;
    float _1610 = float(uint(_1598));
    int _1612 = abs(_1602);
    int _1614 = _1324 * _1594;
    int _1616 = _1614 + _1608;
    float _1618 = as_type<float>(_1241) * _1610;
    float _1620 = float(uint(_1424));
    int _1622 = ~_403;
    int _1624 = _1622 + 1;
    int _1626 = _1578 * _1606;
    int _1628 = _1626 + _1616;
    int _1630 = ~_475;
    int _1632 = _1630 + 1;
    float _1634 = trunc(_1618);
    float _1636 = precise::max(_1634, 0.0);
    uint _1638 = uint(_1636);
    float _1640 = as_type<float>(_1241) * _1620;
    int _1642 = _1528 * _1612;
    int _1644 = _1642 + _1628;
    int _1646 = ~_475;
    int _1648 = _1646 + 1;
    bool _1650 = _231 > 0.5;
    float _1652 = float(uint(_1644));
    float _1654 = trunc(_1640);
    float _1656 = precise::max(_1654, 0.0);
    uint _1658 = uint(_1656);
    float _1660 = -_195;
    int _1662 = _1650 ? as_type<int>(_1660) : as_type<int>(_195);
    float _1664 = as_type<float>(_1296) * _1652;
    float _1666 = float(uint(_1578));
    int _1668 = int(_1558) + int(_1638);
    float _1670 = trunc(_1664);
    float _1672 = precise::max(_1670, 0.0);
    uint _1674 = uint(_1672);
    float _1676 = as_type<float>(_1296) * _1666;
    int _1678 = _1632 * _1668;
    int _1680 = _1678 + _1488;
    int _1682 = _1632 * int(_1658);
    int _1684 = _1682 + _1424;
    float _1686 = trunc(_1676);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    bool _1692 = uint(_1680) >= uint(_475);
    float _1694 = float(uint(_1684));
    bool _1696 = !_1692;
    int _1698 = _1696 ? 0 : (-1);
    int _1700 = _1624 * int(_1674);
    int _1702 = _1700 + _1644;
    int _1704 = ~_1668;
    int _1706 = _1704 + _1698;
    int _1708 = _1706 + 1;
    float _1710 = as_type<float>(_1241) * _1694;
    float _1712 = float(uint(_1702));
    int _1714 = _475 * _1708;
    int _1716 = _1714 + _1488;
    float _1718 = trunc(_1710);
    float _1720 = precise::max(_1718, 0.0);
    uint _1722 = uint(_1720);
    int _1724 = _1624 * int(_1690);
    int _1726 = _1724 + _1578;
    float _1728 = as_type<float>(_1296) * _1712;
    bool _1730 = !_1221;
    int _1732 = _1730 ? _1716 : (-1);
    float _1734 = float(uint(_1726));
    int _1736 = _1732 & 3;
    bool _1738 = _1736 != 0;
    float _1740 = trunc(_1728);
    float _1742 = precise::max(_1740, 0.0);
    uint _1744 = uint(_1742);
    int _1746 = _1732 & 3;
    bool _1748 = _1746 != 0;
    float _1750 = as_type<float>(_1296) * _1734;
    int _1752 = _1738 ? 0 : 1;
    bool _1754 = uint(_1746) > 1u;
    int _1756 = int(_1658) + int(_1722);
    int _1758 = ~_1752;
    int _1760 = _1758 + 1;
    int _1762 = _1760 + 1;
    bool _1764 = _1746 != 3;
    int _1766 = int(_1674) + int(_1744);
    int _1768 = _1648 * _1756;
    int _1770 = _1768 + _1424;
    int _1772 = _1762;
    if (!_1754)
    {
        int _1774 = ~_1752;
        int _1776 = _1774 + 1;
        _1772 = _1776;
    }
    int _1778 = _1772;
    float _1780 = trunc(_1750);
    float _1782 = precise::max(_1780, 0.0);
    uint _1784 = uint(_1782);
    bool _1786 = uint(_1746) >= 2u;
    int _1788 = ~_403;
    int _1790 = _1788 + 1;
    int _1792 = _1786 ? 0 : 1;
    bool _1794 = uint(_1770) >= uint(_475);
    int _1796 = _1790 * _1766;
    int _1798 = _1796 + _1644;
    int _1800 = ~_1792;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    bool _1806 = !_1794;
    int _1808 = _1806 ? 0 : (-1);
    bool _1810 = uint(_1798) >= uint(_403);
    int _1812 = ~_1756;
    int _1814 = _1812 + _1808;
    int _1816 = _1814 + 1;
    bool _1818 = !_1810;
    int _1820 = _1818 ? 0 : (-1);
    bool _1822 = _1746 != 3;
    int _1824 = _475 * _1816;
    int _1826 = _1824 + _1424;
    int _1828 = ~_1766;
    int _1830 = _1828 + _1820;
    int _1832 = _1830 + 1;
    int _1834 = ~_403;
    int _1836 = _1834 + 1;
    int _1838 = int(_1690) + int(_1784);
    int _1840 = _403 * _1832;
    int _1842 = _1840 + _1644;
    int _1844 = _1732 >> 31;
    bool _1846 = !_1221;
    int _1848 = _1846 ? _1826 : (-1);
    int _1850 = _1836 * _1838;
    int _1852 = _1850 + _1578;
    bool _1854 = !_1530;
    int _1856 = _1854 ? _1842 : (-1);
    int _1858 = _1804;
    if (_1822)
    {
        int _1860 = ~_1792;
        int _1862 = _1860 + 1;
        _1858 = _1862;
    }
    int _1864 = _1858;
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1868 = _1866 != 0;
    bool _1870 = _917 != 0;
    bool _1872 = !_1868;
    int _1874 = _1872 ? 0 : 1;
    bool _1876 = uint(_1852) >= uint(_403);
    int _1878 = _1844 & 3;
    int _1880 = _1856 >> 31;
    int _1882 = _1732 + _1878;
    int _1884 = _1880 & 3;
    int _1886 = _1882 >> 2;
    int _1888 = _1856 + _1884;
    int _1890 = _1886 << 4;
    int _1892 = _1890 + 368;
    int _1894 = _1888 >> 2;
    uint _1896 = uint(int(uint(_1892) >> uint(2)));
    uint _1898 = uint(int(uint(int(_1896)) >> uint(2)));
    int _1900 = int(_1896) & 3;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[int(_1898)][_1900];
    int _1904 = int(_1896) + 1;
    uint _1906 = uint(int(uint(_1904) >> uint(2)));
    int _1908 = _1904 & 3;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[int(_1906)][_1908];
    bool _1912 = !_1748;
    int _1914 = _1912 ? 0 : 1;
    int _1916 = _1856 & 3;
    bool _1918 = _1916 != 0;
    int _1920 = _1894 << 4;
    int _1922 = _1920 + 512;
    bool _1924 = !_1764;
    int _1926 = _1924 ? 0 : (-1);
    bool _1928 = _1916 != 3;
    uint _1930 = uint(int(uint(_1922) >> uint(2)));
    uint _1932 = uint(int(uint(int(_1930)) >> uint(2)));
    int _1934 = int(_1930) & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    int _1938 = int(_1930) + 1;
    uint _1940 = uint(int(uint(_1938) >> uint(2)));
    int _1942 = _1938 & 3;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[int(_1940)][_1942];
    bool _1946 = !_1876;
    int _1948 = _1946 ? 0 : (-1);
    bool _1950 = uint(_1916) > 1u;
    float _1952 = -_199;
    int _1954 = _1604 ? as_type<int>(_1952) : as_type<int>(_199);
    bool _1956 = uint(_1916) >= 2u;
    int _1958 = ~_1838;
    int _1960 = _1958 + _1948;
    int _1962 = _1960 + 1;
    int _1964 = _1918 ? 0 : 1;
    bool _1966 = _1916 != 3;
    int _1968 = _1956 ? 0 : 1;
    bool _1970 = !_1966;
    int _1972 = _1970 ? 0 : (-1);
    int _1974 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1976 = _1974 != 0;
    int _1978 = _1856 & 3;
    bool _1980 = _1978 != 0;
    int _1982 = ~_1968;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    int _1988 = _1986;
    if (_1928)
    {
        int _1990 = ~_1968;
        int _1992 = _1990 + 1;
        _1988 = _1992;
    }
    int _1994 = _1988;
    float _1996 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1998 = ~_1964;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = _2002;
    if (!_1950)
    {
        int _2006 = ~_1964;
        int _2008 = _2006 + 1;
        _2004 = _2008;
    }
    int _2010 = _2004;
    float _2012 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2014 = abs(_1778);
    int _2016 = _1892 + 8;
    uint _2018 = uint(int(uint(_2016) >> uint(2)));
    uint _2020 = uint(int(uint(int(_2018)) >> uint(2)));
    int _2022 = int(_2018) & 3;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[int(_2020)][_2022];
    int _2026 = int(_2018) + 1;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    int _2030 = _2026 & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    int _2034 = abs(_2010);
    float _2036 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2038 = _2012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2040 = abs(_1914);
    float _2042 = _1504 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2044 = ~_2014;
    int _2046 = _2044 + 1;
    int _2048 = _2046 + 1;
    float _2050 = _467 + 0.5;
    int _2052 = _1922 + 8;
    uint _2054 = uint(int(uint(_2052) >> uint(2)));
    uint _2056 = uint(int(uint(int(_2054)) >> uint(2)));
    int _2058 = int(_2054) & 3;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[int(_2056)][_2058];
    int _2062 = int(_2054) + 1;
    uint _2064 = uint(int(uint(_2062) >> uint(2)));
    int _2066 = _2062 & 3;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[int(_2064)][_2066];
    bool _2070 = _241 > 0.5;
    int _2072 = _403 * _1962;
    int _2074 = _2072 + _1578;
    int _2076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2078 = _2076 != 0;
    int _2080 = _2048 * as_type<int>(_1910);
    bool _2082 = !_1980;
    int _2084 = _2082 ? 0 : 1;
    float _2086 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _2088 = !_1530;
    int _2090 = _2088 ? _2074 : (-1);
    float _2092 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2094 = !_2078;
    int _2096 = _2094 ? 0 : 1;
    int _2098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2100 = _2098 != 0;
    int _2102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2104 = _2102 != 0;
    int _2106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2108 = _2106 != 0;
    float _2110 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2112 = ~_2034;
    int _2114 = _2112 + 1;
    int _2116 = _2114 + 1;
    int _2118 = ~_2040;
    int _2120 = _2118 + 1;
    int _2122 = _2120 + 1;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2126 = _1219 * _2086;
    int _2128 = _2116 * as_type<int>(_1944);
    int _2130 = _2122 * as_type<int>(_1902);
    int _2132 = _2130 + _2080;
    out.m_82.x = _2036;
    out.m_82.y = _2038;
    out.m_82.z = _2042;
    out.m_82.w = _2124;
    float _2134 = _2092 * _2110;
    int _2136 = abs(_2084);
    int _2138 = abs(_1994);
    int _2140 = ~_2136;
    int _2142 = _2140 + 1;
    int _2144 = _2142 + 1;
    out.m_84.x = _2134;
    out.m_84.y = _2126;
    int _2146 = abs(_1874);
    float _2148 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2150 = int(_2148);
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2154 = abs(_1864);
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2160 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2162 = ~_2154;
    int _2164 = _2162 + 1;
    int _2166 = _2164 + 1;
    float _2168 = _2156 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2170 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2172 = int(_2170);
    float _2174 = _2158 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2176 = _2144 * as_type<int>(_1936);
    int _2178 = _2176 + _2128;
    int _2180 = abs(_1926);
    int _2182 = _2166 * as_type<int>(_2024);
    int _2184 = _2182 + _2132;
    out.m_86.x = _2160;
    out.m_86.y = _2168;
    out.m_86.z = _2174;
    int _2186 = abs(_1972);
    float _2188 = as_type<float>(_2138);
    if (_1085)
    {
        float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2192 = _1175 + _2190;
        _2188 = _2192;
    }
    float _2194 = _2188;
    float _2196 = float(uint(_2150));
    int _2198 = ~_2186;
    int _2200 = _2198 + 1;
    int _2202 = _2200 + 1;
    float _2204 = _989 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2206 = abs(_2150);
    if (_1085)
    {
        float _2208 = _2194 * _2194;
        _1105 = _2208;
    }
    float _2210 = _1105;
    float _2212 = 1.0 / _2196;
    int _2214 = abs(_2096);
    float _2216 = _989 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2218 = ~_2138;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    float _2224 = _989 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2226 = ~_2180;
    int _2228 = _2226 + 1;
    int _2230 = _2228 + 1;
    float _2232 = -_979;
    float _2234 = fma(_2232, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2216);
    float _2236 = float(uint(_2172));
    int _2238 = _2222 * as_type<int>(_2060);
    int _2240 = _2238 + _2178;
    int _2242 = ~_2146;
    int _2244 = _2242 + 1;
    int _2246 = _2244 + 1;
    int _2248 = _2230 * as_type<int>(_2032);
    int _2250 = _2248 + _2184;
    int _2252 = _2202 * as_type<int>(_2068);
    int _2254 = _2252 + _2240;
    float _2256 = 1.0 / _2236;
    int _2258 = _2250 * _2246;
    int _2260 = abs(_2172);
    float _2262 = -_979;
    float _2264 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2204);
    float _2266 = float(uint(_2206));
    int _2268 = _1848 * _2146;
    int _2270 = _2268 + _2258;
    int _2272 = ~_2214;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    float _2278 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2264);
    float _2280 = float(uint(_2260));
    float _2282 = -_979;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    int _2286 = as_type<int>(_2212) + (-2);
    float _2288 = 1.0 / _2266;
    float _2290 = float(uint(_2270));
    int _2292 = _2276 * _2254;
    float _2294 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    float _2296 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2284);
    int _2298 = as_type<int>(_2256) + (-2);
    int _2300 = _2090 * _2214;
    int _2302 = _2300 + _2292;
    float _2304 = as_type<float>(_2286) * _2290;
    float _2306 = 1.0 / _2280;
    int _2308 = abs(_2270);
    float _2310 = _999 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2312 = float(uint(_2302));
    float _2314 = _999 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2316 = _999 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2318 = abs(_2302);
    float _2320 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2310);
    float _2322 = trunc(_2304);
    float _2324 = precise::max(_2322, 0.0);
    uint _2326 = uint(_2324);
    float _2328 = as_type<float>(_2298) * _2312;
    int _2330 = as_type<int>(_2288) + (-2);
    float _2332 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2314);
    float _2334 = float(uint(_2308));
    float _2336 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2316);
    float _2338 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2340 = float(uint(_2318));
    float _2342 = _2234;
    float _2344 = _2296;
    if (_1085)
    {
        float _2346 = _1131 * 6.283185482025146484375;
        float _2348 = cos(_2346);
        _2342 = _2348;
    }
    float _2350 = _2342;
    int _2352 = as_type<int>(_2306) + (-2);
    float _2354 = as_type<float>(_2330) * _2334;
    int _2356 = ~_2150;
    int _2358 = _2356 + 1;
    float _2360 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2362 = !_2100;
    float _2364 = _2362 ? _199 : as_type<float>(_1954);
    float _2366 = as_type<float>(_2352) * _2340;
    float _2368 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2332);
    float _2370 = trunc(_2328);
    float _2372 = precise::max(_2370, 0.0);
    uint _2374 = uint(_2372);
    float _2376 = _1011 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2378 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2338);
    int _2380 = _2358 * int(_2326);
    int _2382 = _2380 + _2270;
    int _2384 = ~_2260;
    int _2386 = _2384 + 1;
    float _2388 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2376);
    float _2390 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2360);
    int _2392 = ~_2172;
    int _2394 = _2392 + 1;
    float _2396 = trunc(_2354);
    float _2398 = precise::max(_2396, 0.0);
    uint _2400 = uint(_2398);
    float _2402 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2388);
    float _2404 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2378);
    float _2406 = float(uint(_2382));
    float _2408 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2390);
    int _2410 = ~_2206;
    int _2412 = _2410 + 1;
    bool _2414 = !_1976;
    float _2416 = _2414 ? _195 : as_type<float>(_1662);
    float _2418 = trunc(_2366);
    float _2420 = precise::max(_2418, 0.0);
    uint _2422 = uint(_2420);
    float _2424 = as_type<float>(_2286) * _2406;
    int _2426 = _2394 * int(_2374);
    int _2428 = _2426 + _2302;
    float _2430 = as_type<float>(_2412);
    if (_1085)
    {
        float _2432 = _2350 + (-1.0);
        _2430 = _2432;
    }
    float _2434 = _2430;
    bool _2436 = _2172 == 0;
    int _2438 = _2412 * int(_2400);
    int _2440 = _2438 + _2308;
    float _2442 = float(uint(_2428));
    float _2444 = trunc(_2424);
    float _2446 = precise::max(_2444, 0.0);
    uint _2448 = uint(_2446);
    float _2450 = _2434;
    if (_1085)
    {
        float _2452 = _2434 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2450 = _2452;
    }
    float _2454 = _2450;
    float _2456 = float(uint(_2440));
    if (_1085)
    {
        float _2458 = fma(_1147, _2350, _2454);
        _1151 = _2458;
    }
    float _2460 = _1151;
    int _2462 = _2386 * int(_2422);
    int _2464 = _2462 + _2318;
    float _2466 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2470 = _2460 + _2468;
    float _2472 = float(uint(_2464));
    float _2474 = as_type<float>(_2298) * _2442;
    float _2476 = as_type<float>(_2330) * _2456;
    float _2478 = -_199;
    int _2480 = _2070 ? as_type<int>(_2478) : as_type<int>(_199);
    float _2482 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2484 = -_195;
    int _2486 = _1870 ? as_type<int>(_2484) : as_type<int>(_195);
    float _2488 = as_type<float>(_2352) * _2472;
    bool _2490 = !_2108;
    float _2492 = _2490 ? _199 : as_type<float>(_2480);
    float _2494 = trunc(_2474);
    float _2496 = precise::max(_2494, 0.0);
    uint _2498 = uint(_2496);
    bool _2500 = !_2104;
    float _2502 = _2500 ? _195 : as_type<float>(_2486);
    float _2504 = _2482 * _2278;
    float _2506 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2320);
    float _2508 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2336);
    float _2510 = _2482 * _2296;
    float _2512 = _2504;
    if (!_1085)
    {
        _1107 = _1075;
    }
    float _2514 = _1107;
    float _2516 = fma(_2466, _2506, _2504);
    float _2518 = trunc(_2488);
    float _2520 = precise::max(_2518, 0.0);
    uint _2522 = uint(_2520);
    float _2524 = _2482 * _2294;
    float _2526 = _2514;
    if (_1085)
    {
        float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2530 = _1179 + _2528;
        _2512 = _2530;
    }
    float _2532 = _2512;
    int _2534 = ~_2206;
    int _2536 = _2534 + 1;
    out.m_88.x = _2506;
    out.m_88.y = _2368;
    out.m_88.z = _2508;
    float _2538 = fma(_2466, _2368, _2524);
    float _2540 = fma(_2466, _2508, _2510);
    float _2542 = fma(_2470, _2470, _2210);
    float _2544 = trunc(_2476);
    float _2546 = precise::max(_2544, 0.0);
    uint _2548 = uint(_2546);
    int _2550 = int(_2326) + int(_2448);
    float _2552 = _2540;
    float _2554 = as_type<float>(_2550);
    if (_1085)
    {
        float _2556 = _2532 * _2532;
        _2526 = _2556;
    }
    float _2558 = _2526;
    int _2560 = ~_2150;
    int _2562 = _2560 + 1;
    int _2564 = int(_2374) + int(_2498);
    float _2566 = _2542 + _2558;
    int _2568 = ~_2172;
    int _2570 = _2568 + 1;
    int _2572 = _2562 * _2550;
    int _2574 = _2572 + _2270;
    int _2576 = int(_2422) + int(_2522);
    int _2578 = ~_2260;
    int _2580 = _2578 + 1;
    int _2582 = _2570 * _2564;
    int _2584 = _2582 + _2302;
    bool _2586 = uint(_2574) >= uint(_2150);
    float _2588 = sqrt(_2566);
    int _2590 = _2302 ^ _2172;
    int _2592 = _2580 * _2576;
    int _2594 = _2592 + _2318;
    int _2596 = int(_2400) + int(_2548);
    bool _2598 = !_2586;
    int _2600 = _2598 ? 0 : (-1);
    bool _2602 = uint(_2584) >= uint(_2172);
    int _2604 = _2536 * _2596;
    int _2606 = _2604 + _2308;
    int _2608 = ~_2550;
    int _2610 = _2608 + _2600;
    int _2612 = _2610 + 1;
    float _2614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2616 = !_2602;
    int _2618 = _2616 ? 0 : (-1);
    bool _2620 = uint(_2594) >= uint(_2260);
    int _2622 = _2150 * _2612;
    int _2624 = _2622 + _2270;
    bool _2626 = uint(_2606) >= uint(_2206);
    int _2628 = _2270 ^ _2150;
    float _2630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2632 = ~_2564;
    int _2634 = _2632 + _2618;
    int _2636 = _2634 + 1;
    bool _2638 = !_2620;
    int _2640 = _2638 ? 0 : (-1);
    bool _2642 = !_2626;
    int _2644 = _2642 ? 0 : (-1);
    int _2646 = _2172 * _2636;
    int _2648 = _2646 + _2302;
    uint _2650 = uint(int(uint(_2628) >> uint(31)));
    float _2652 = fma(_2482, _2482, 1.0);
    bool _2654 = _2150 == 0;
    bool _2656 = _2150 == 0;
    float _2658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2660 = ~_2640;
    int _2662 = _2576 + _2660;
    int _2664 = _2662 + 1;
    int _2666 = ~_2644;
    int _2668 = _2596 + _2666;
    int _2670 = _2668 + 1;
    float _2672 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2674 = ~int(_2650);
    int _2676 = _2674 + 1;
    float _2678 = _2614 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2680 = _2172 == 0;
    float _2682 = rsqrt(_2652);
    uint _2684 = uint(int(uint(_2590) >> uint(31)));
    bool _2686 = !_2654;
    int _2688 = _2686 ? _2624 : (-1);
    int _2690 = _2670 ^ _2676;
    int _2692 = ~int(_2684);
    int _2694 = _2692 + 1;
    float _2696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2698 = float(_2688);
    float _2700 = _2658 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2702 = ~_2676;
    int _2704 = _2702 + _2690;
    int _2706 = _2704 + 1;
    float _2708 = _2416 + 0.5;
    bool _2710 = !_2436;
    int _2712 = _2710 ? _2648 : (-1);
    float _2714 = fma(_2678, _2698, _387);
    int _2716 = _2664 ^ _2694;
    float _2718 = _2482 * _2682;
    float _2720 = float(_2712);
    float _2722 = fma(_2678, _2708, _2714);
    bool _2724 = !_2656;
    int _2726 = _2724 ? _2706 : (-1);
    float _2728 = _2364 + (-0.5);
    int _2730 = ~_2694;
    int _2732 = _2730 + _2716;
    int _2734 = _2732 + 1;
    float _2736 = fma(_2700, _2720, _737);
    float _2738 = float(_2726);
    float _2740 = _2696 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2742 = !_2680;
    int _2744 = _2742 ? _2734 : (-1);
    float _2746 = -_2404;
    float _2748 = _2718 * _2746;
    float _2750 = _2404 + _2538;
    float _2752 = -_417;
    float _2754 = fma(_2672, _2738, _2752);
    float _2756 = float(_2744);
    float _2758 = _2502 + 0.5;
    out.m_90.x = _1189;
    out.m_90.y = _1191;
    out.m_90.z = _1193;
    float _2760 = -_2672;
    float _2762 = fma(_2760, _2728, _2754);
    float _2764 = _2492 + (-0.5);
    float _2766 = -_739;
    float _2768 = fma(_2740, _2756, _2766);
    float _2770 = fma(_2700, _2758, _2736);
    float _2772 = -_2402;
    float _2774 = _2718 * _2772;
    float _2776 = -_2408;
    float _2778 = _2718 * _2776;
    float _2780 = -_2740;
    float _2782 = fma(_2780, _2764, _2768);
    float _2784 = fma(_2682, _2294, _2748);
    float _2786 = -_711;
    float _2788 = _2786 + 1.0;
    float _2790 = fma(_2682, _2278, _2774);
    float _2792 = _2402 + _2516;
    float _2794 = fma(_2682, _2296, _2778);
    float _2796 = -_2788;
    float _2798 = fma(_2416, _2796, _2722);
    float _2800 = fma(_2492, _1213, _2782);
    float _2802 = -_1235;
    float _2804 = fma(_2502, _2802, _2770);
    float _2806 = fma(_2364, _1231, _2762);
    float _2808 = _2408 + _2540;
    out.m_92.x = _2790;
    out.m_92.y = _2784;
    out.m_92.z = _2794;
    bool _2810 = _2588 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2812 = isnan(_2588);
    bool _2814 = _2810 || _2812;
    bool _2816 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2818 = _2814 || _2816;
    out.m_94.x = _2798;
    out.m_94.y = _2806;
    out.m_94.z = _2804;
    out.m_94.w = _2800;
    out.m_96.x = _2792;
    out.m_96.y = _2750;
    out.m_96.z = _2808;
    float _2820 = _2762;
    float _2822 = as_type<float>(_2596);
    float _2824 = as_type<float>(_2580);
    if (!_2818)
    {
        _2820 = 1.0;
    }
    float _2826 = _2820;
    bool _2828 = !_2818;
    float _2830 = _2826;
    if (!_2828)
    {
        bool _2832 = _2588 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2834 = isnan(_2588);
        bool _2836 = _2832 || _2834;
        bool _2838 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2840 = _2836 || _2838;
        if (!_2840)
        {
            float _2842 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2844 = _2588 + _2842;
            float _2846 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2848 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2846;
            float _2850 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2852 = _2850 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2854 = 1.0 / _2848;
            float _2856 = _2844 * _2854;
            float _2858 = fma(_2856, _2852, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2830 = _2858;
            _2860 = true;
        }
        else
        {
            bool _2862 = _2588 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2864 = isnan(_2588);
            bool _2866 = _2862 || _2864;
            bool _2868 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2870 = _2866 || _2868;
            if (!_2870)
            {
                float _2872 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2874 = _2588 + _2872;
                float _2876 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2878 = _2876 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2880 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2882 = _2880 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2884 = 1.0 / _2878;
                float _2886 = _2874 * _2884;
                float _2888 = fma(_2886, _2882, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2830 = _2888;
                _2860 = true;
            }
            else
            {
                _2830 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2860 = false;
    float _2890 = _2830;
    float _2892 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2894 = _2460 + _2892;
    float _2896 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2898 = _1175 + _2896;
    float _2900 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2902 = _1179 + _2900;
    float _2904 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2906 = fma(_2894, _2890, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2908 = fma(_2898, _2890, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2910 = fma(_2902, _2890, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2912 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2904);
    float _2914 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2916 = _2906 + _2914;
    float _2918 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2920 = _2908 + _2918;
    float _2922 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2924 = _2910 + _2922;
    float _2926 = _2916 * _2916;
    float _2928 = fma(_2920, _2920, _2926);
    float _2930 = fma(_2924, _2924, _2928);
    float _2932 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2912);
    float _2934 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2936 = fma(_1047, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2938 = rsqrt(_2930);
    float _2940 = _2932 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2942 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2934);
    float _2944 = fma(_1049, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2942);
    float _2946 = 1.0 / _2940;
    float _2948 = _2944 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2950 = _2948 + _2940;
    float _2952 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2954 = sqrt(_2930);
    float _2956 = _2920 * _2952;
    float _2958 = _2924 * _2952;
    float _2960 = _2956 * _2956;
    float _2962 = _2958 * _2958;
    float _2964 = _2950 * _2946;
    float _2966 = _2964 * 0.5;
    float _2968 = _2960 + _2962;
    float _2970 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2972 = fma(_2966, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2970);
    float _2974 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2976 = sqrt(_2968);
    float _2978 = _1093 + _2974;
    float _2980 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2982 = 1.0 / _2972;
    float _2984 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2986 = fma(_1047, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2980);
    float _2988 = fma(_1047, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2984);
    float _2990 = fma(_1049, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2986);
    bool _2992 = _2976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2994 = fma(_1049, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2988);
    float _2996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2998 = _2976 + _2996;
    float _3000 = _2990 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3002 = floor(_2936);
    float _3004 = _2994 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _3006 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3008 = _2982 * _3006;
    float _3010 = trunc(_3000);
    int _3012 = int(_3010);
    bool _3014 = _3008 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3016 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    bool _3018 = _3008 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _3020 = _1193;
    int _3022 = 2;
    float _3024 = _2998;
    float _3026 = _2968;
    float _3028 = _2958;
    float _3030 = _2960;
    if (_2992)
    {
        float _3032 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3020 = _3032;
    }
    float _3034 = _3020;
    float _3036 = -_3002;
    float _3038 = _2936 + _3036;
    if (!_3014)
    {
        _3022 = 1;
    }
    int _3040 = _3022;
    float _3042 = trunc(_3004);
    int _3044 = int(_3042);
    int _3046 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3048 = _3012 + _3046;
    int _3050 = _3048 + 1;
    int _3052 = _3040;
    if (_2992)
    {
        float _3054 = _2998 * _3034;
        _3024 = _3054;
    }
    float _3056 = _3024;
    if (_2992)
    {
        float _3058 = rsqrt(_2968);
        _3026 = _3058;
    }
    float _3060 = _3026;
    if (_2992)
    {
        float _3062 = _3056 * 0.15915493667125701904296875;
        _2552 = _3062;
    }
    float _3064 = _2552;
    bool _3066 = !_3014;
    int _3068 = _3066 ? 0 : 1;
    int _3070 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3072 = _3044 + _3070;
    int _3074 = _3072 + 1;
    float _3076 = _2990;
    if (_2992)
    {
        float _3078 = _3064 * 6.283185482025146484375;
        float _3080 = sin(_3078);
        _3076 = _3080;
    }
    float _3082 = _3076;
    if (!_3018)
    {
        _3052 = _3068;
    }
    int _3084 = _3052;
    float _3086 = precise::max(0.0, _3016);
    int _3088 = _3084 << 6;
    bool _3090 = _3050 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _3092 = -_2952;
    float _3094 = -_3086;
    float _3096 = fma(_2916, _3092, _3094);
    int _3098 = _3088 + 96;
    uint _3100 = uint(int(uint(_3098) >> uint(2)));
    uint _3102 = uint(int(uint(int(_3100)) >> uint(2)));
    int _3104 = int(_3100) & 3;
    float _3106 = (*spvDescriptorSet0.vp_c15)._m0[int(_3102)][_3104];
    int _3108 = int(_3100) + 1;
    uint _3110 = uint(int(uint(_3108) >> uint(2)));
    int _3112 = _3108 & 3;
    float _3114 = (*spvDescriptorSet0.vp_c15)._m0[int(_3110)][_3112];
    int _3116 = _3050 | _3074;
    float _3118 = _3064;
    float _3120 = _3086;
    float _3122 = as_type<float>(_3116);
    float _3124 = _3096;
    if (_2992)
    {
        float _3126 = _3064 * 6.283185482025146484375;
        float _3128 = cos(_3126);
        _3118 = _3128;
    }
    float _3130 = _3118;
    if (_2992)
    {
        float _3132 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3120 = _3132;
    }
    float _3134 = _3120;
    bool _3136 = _3116 < 0;
    bool _3138 = _3136 || _3090;
    if (_2992)
    {
        float _3140 = fma(_3082, _3134, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3122 = _3140;
    }
    float _3142 = _3122;
    int _3144 = _3088 + 48;
    uint _3146 = uint(int(uint(_3144) >> uint(2)));
    uint _3148 = uint(int(uint(int(_3146)) >> uint(2)));
    int _3150 = int(_3146) & 3;
    float _3152 = (*spvDescriptorSet0.vp_c15)._m0[int(_3148)][_3150];
    int _3154 = int(_3146) + 1;
    uint _3156 = uint(int(uint(_3154) >> uint(2)));
    int _3158 = _3154 & 3;
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[int(_3156)][_3158];
    float _3162 = fma(_1049, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _3164 = _3074 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3166 = _3164 || _3138;
    if (_2992)
    {
        float _3168 = _3060 * _3142;
        _2554 = _3168;
    }
    float _3170 = _2554;
    float _3172 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3174 = floor(_3162);
    if (_2992)
    {
        float _3176 = _2958 * _3170;
        _3028 = _3176;
    }
    float _3178 = _3028;
    int _3180 = _3088 + 104;
    uint _3182 = uint(int(uint(_3180) >> uint(2)));
    uint _3184 = uint(int(uint(int(_3182)) >> uint(2)));
    int _3186 = int(_3182) & 3;
    float _3188 = (*spvDescriptorSet0.vp_c15)._m0[int(_3184)][_3186];
    int _3190 = int(_3182) + 1;
    uint _3192 = uint(int(uint(_3190) >> uint(2)));
    int _3194 = _3190 & 3;
    float _3196 = (*spvDescriptorSet0.vp_c15)._m0[int(_3192)][_3194];
    float _3198 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3172);
    float _3200 = _3130;
    if (_2992)
    {
        float _3202 = _3130 + (-1.0);
        _2822 = _3202;
    }
    float _3204 = _2822;
    float _3206 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3198);
    float _3208 = _3204;
    if (_2992)
    {
        float _3210 = _3204 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2824 = _3210;
    }
    float _3212 = _2824;
    if (!_2992)
    {
        _3208 = _2956;
    }
    float _3214 = _3208;
    int _3216 = _3088 + 64;
    uint _3218 = uint(int(uint(_3216) >> uint(2)));
    uint _3220 = uint(int(uint(int(_3218)) >> uint(2)));
    int _3222 = int(_3218) & 3;
    float _3224 = (*spvDescriptorSet0.vp_c15)._m0[int(_3220)][_3222];
    int _3226 = int(_3218) + 1;
    uint _3228 = uint(int(uint(_3226) >> uint(2)));
    int _3230 = _3226 & 3;
    float _3232 = (*spvDescriptorSet0.vp_c15)._m0[int(_3228)][_3230];
    float _3234 = _3214;
    if (_2992)
    {
        float _3236 = _2956 * _3170;
        _3234 = _3236;
    }
    float _3238 = _3234;
    if (_2992)
    {
        float _3240 = fma(_3096, _3130, _3212);
        _3124 = _3240;
    }
    float _3242 = _3124;
    if (!_2992)
    {
        _3200 = _2962;
    }
    float _3244 = _3200;
    float _3246 = _3244;
    if (_2992)
    {
        float _3248 = _3178 * _3178;
        _3246 = _3248;
    }
    float _3250 = _3246;
    if (_2992)
    {
        float _3252 = _3238 * _3238;
        _3030 = _3252;
    }
    float _3254 = _3030;
    float _3256 = _3206 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_3166)
    {
        float _3258 = floor(_3004);
        _2344 = _3258;
    }
    float _3260 = _2344;
    int _3262 = _3088 + 56;
    uint _3264 = uint(int(uint(_3262) >> uint(2)));
    uint _3266 = uint(int(uint(int(_3264)) >> uint(2)));
    int _3268 = int(_3264) & 3;
    float _3270 = (*spvDescriptorSet0.vp_c15)._m0[int(_3266)][_3268];
    int _3272 = int(_3264) + 1;
    uint _3274 = uint(int(uint(_3272) >> uint(2)));
    int _3276 = _3272 & 3;
    float _3278 = (*spvDescriptorSet0.vp_c15)._m0[int(_3274)][_3276];
    float _3280 = fma(_3242, _3242, _3254);
    float _3282 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3284 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3286 = -_3174;
    float _3288 = _3162 + _3286;
    float _3290 = _3280 + _3250;
    float _3292 = -_3284;
    float _3294 = fma(_3292, _3282, 1.0);
    int _3296 = _3088 + 80;
    uint _3298 = uint(int(uint(_3296) >> uint(2)));
    uint _3300 = uint(int(uint(int(_3298)) >> uint(2)));
    int _3302 = int(_3298) & 3;
    float _3304 = (*spvDescriptorSet0.vp_c15)._m0[int(_3300)][_3302];
    int _3306 = int(_3298) + 1;
    uint _3308 = uint(int(uint(_3306) >> uint(2)));
    int _3310 = _3306 & 3;
    float _3312 = (*spvDescriptorSet0.vp_c15)._m0[int(_3308)][_3310];
    int _3314 = as_type<int>(_3284);
    if (!_3166)
    {
        int _3316 = _3074 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3318 = _3316 + _3050;
        _3314 = _3318;
    }
    int _3320 = _3314;
    float _3322 = rsqrt(_3290);
    int _3324 = _3088 + 72;
    uint _3326 = uint(int(uint(_3324) >> uint(2)));
    uint _3328 = uint(int(uint(int(_3326)) >> uint(2)));
    int _3330 = int(_3326) & 3;
    float _3332 = (*spvDescriptorSet0.vp_c15)._m0[int(_3328)][_3330];
    int _3334 = int(_3326) + 1;
    uint _3336 = uint(int(uint(_3334) >> uint(2)));
    int _3338 = _3334 & 3;
    float _3340 = (*spvDescriptorSet0.vp_c15)._m0[int(_3336)][_3338];
    float _3342 = _2978 * _3114;
    float _3344 = log2(_3294);
    float _3346 = fma(_1047, _3106, _3342);
    int _3348 = _3088 + 88;
    uint _3350 = uint(int(uint(_3348) >> uint(2)));
    uint _3352 = uint(int(uint(int(_3350)) >> uint(2)));
    int _3354 = int(_3350) & 3;
    float _3356 = (*spvDescriptorSet0.vp_c15)._m0[int(_3352)][_3354];
    int _3358 = int(_3350) + 1;
    uint _3360 = uint(int(uint(_3358) >> uint(2)));
    int _3362 = _3358 & 3;
    float _3364 = (*spvDescriptorSet0.vp_c15)._m0[int(_3360)][_3362];
    float _3366 = _2978 * _3160;
    float _3368 = _3322 * _3238;
    float _3370 = _3322 * _3242;
    float _3372 = fma(_1047, _3152, _3366);
    int _3374 = as_type<int>(_3366);
    float _3376 = _3372;
    if (!_3166)
    {
        int _3378 = _3320 << 2;
        _3374 = _3378;
    }
    int _3380 = _3374;
    float _3382 = _3368 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3384 = fma(_1049, _3188, _3346);
    float _3386 = _3322 * _3178;
    int _3388 = _3380;
    float _3390 = _3232;
    if (!_3166)
    {
        int _3392 = 12 & _3380;
        _3388 = _3392;
    }
    int _3394 = _3388;
    float _3396 = _3384 + _3196;
    float _3398 = -_3382;
    float _3400 = fma(_3370, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3398);
    float _3402 = _3344 * 0.693147182464599609375;
    float _3404 = _2978 * _3232;
    int _3406 = _3394;
    if (!_3166)
    {
        float _3408 = -_3260;
        float _3410 = _3004 + _3408;
        _3390 = _3410;
    }
    float _3412 = _3390;
    float _3414 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3416 = fma(_2954, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3414);
    float _3418 = precise::clamp(_3416, 0.0, 1.0);
    float _3420 = 1.0 / _3396;
    float _3422 = fma(_1047, _3224, _3404);
    float _3424 = -_3418;
    float _3426 = _3424 + 1.0;
    float _3428 = fma(_1049, _3270, _3372);
    float _3430 = _3418;
    if (!_3166)
    {
        float _3432 = floor(_3000);
        _3376 = _3432;
    }
    float _3434 = _3376;
    float _3436 = _3428 + _3278;
    float _3438 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3440 = _2978 * _3312;
    int _3442 = as_type<int>(_3312);
    if (!_3166)
    {
        uint _3444 = uint(int(uint(_3320) >> uint(2)));
        _3442 = int(_3444);
    }
    int _3446 = _3442;
    float _3448 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3438);
    float _3450 = abs(_3426);
    float _3452 = log2(_3450);
    float _3454 = fma(_1047, _3304, _3440);
    if (!_3166)
    {
        int _3456 = _3446 << 4;
        int _3458 = _3456 + _3394;
        _3406 = _3458;
    }
    int _3460 = _3406;
    float _3462 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3448);
    float _3464 = fma(_1049, _3332, _3422);
    float _3466 = -_3386;
    float _3468 = fma(_3466, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3400);
    float _3470 = _3382;
    if (!_3166)
    {
        int _3472 = _3460 + 400;
        uint _3474 = uint(int(uint(_3472) >> uint(2)));
        uint _3476 = uint(int(uint(int(_3474)) >> uint(2)));
        int _3478 = int(_3474) & 3;
        float _3480 = (*spvDescriptorSet0.vp_c15)._m0[int(_3476)][_3478];
        _3470 = _3480;
    }
    float _3482 = _3470;
    float _3484 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3486 = _3464 + _3340;
    float _3488 = _2906 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float2 _9355 = float2(_3038, _3288);
    float _3490 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9355, float2(0.0), isnan(_9355)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9355, float2(0.0), isnan(_9355)), level(0.0)).x;
    float _3492 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3484);
    float _3494 = _3462 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3496 = _3436 * _3420;
    float _3498 = fma(_2908, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3488);
    float _3500 = fma(_1049, _3356, _3454);
    float _3502 = fma(_3468, -0.5, 0.5);
    float _3504 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _3506 = _3496 >= 0.0;
    float _3508 = _3486 * _3420;
    float _3510 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3498);
    float _3512 = exp2(_3504);
    bool _3514 = _3496 <= 1.0;
    bool _3516 = _3514 && _3506;
    float _3518 = fma(_2910, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3492);
    float _3520 = _3510 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3522 = _3494 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3524 = _3508 >= 0.0;
    bool _3526 = _3524 && _3516;
    float _3528 = _3518 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3530 = fma(_3468, 0.5, 0.5);
    float _3532 = sqrt(_3502);
    bool _3534 = _3508 <= 1.0;
    bool _3536 = _3534 && _3526;
    float _3538 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3522);
    float _3540 = _3500 + _3364;
    float _3542 = _3370 + 1.0;
    float _3544 = fma(_3530, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3546 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3538);
    float _3548 = _3494 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3550 = -_3370;
    float _3552 = fma(_3512, _3542, _3550);
    float _3554 = _3494 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3556 = fma(_3528, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3546);
    float _3558 = fma(_3530, _3544, -0.212114393711090087890625);
    float _3560 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3548);
    float _3562 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3554);
    float _3564 = 1.0 / _3556;
    float _3566 = fma(_3530, _3558, 1.570728778839111328125);
    float _3568 = _3532 * 0.636619746685028076171875;
    float _3570 = _3532;
    float _3572 = _3556;
    if (_3536)
    {
        float _3574 = float(_3084);
        _3570 = _3574;
    }
    float _3576 = _3570;
    float _3578 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3560);
    float _3580 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3562);
    float _3582 = -_3566;
    float _3584 = fma(_3568, _3582, 1.0);
    float _3586 = _3402 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3588 = fma(_3528, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3578);
    float _3590 = _3576;
    if (_3536)
    {
        float _3592 = rint(_3576);
        float _3594 = precise::max(_3592, 0.0);
        uint _3596 = uint(_3594);
        uint _3598 = clamp(_3596, 0u, 65535u);
        _3590 = as_type<float>(_3598);
    }
    float _3600 = _3590;
    float _3602 = fma(_3528, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3580);
    float _3604 = _3540 * _3420;
    float _3606 = fma(_3552, 0.5, 0.5);
    float _3608 = _3602;
    if (!_3166)
    {
        float _3610 = -_3434;
        float _3612 = _3000 + _3610;
        _3430 = _3612;
    }
    float _3614 = _3430;
    float _3616 = _3588 * _3564;
    float _3618 = _3402;
    if (!_3166)
    {
        float _3620 = rint(_3482);
        float _3622 = precise::max(_3620, 0.0);
        uint _3624 = uint(_3622);
        uint _3626 = clamp(_3624, 0u, 65535u);
        _3618 = as_type<float>(_3626);
    }
    float _3628 = _3618;
    float _3630 = _3602 * _3564;
    float _3632 = fma(_3616, 0.5, 0.5);
    float _3634 = fma(_3630, -0.5, 0.5);
    float _3636 = _3600;
    if (_3536)
    {
        float3 _9603 = float3(_3496, _3508, float(as_type<int>(_3600)));
        float3 _9607 = select(_9603, float3(0.0), isnan(_9603));
        float _3638 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9607.xy, uint(rint(_9607.z)), _3604, level(0.0));
        _3636 = _3638;
    }
    float _3640 = _3636;
    float3 _9617 = float3(_3632, _3634, _3586);
    float _3642 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9617, float3(0.0), isnan(_9617)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9617, float3(0.0), isnan(_9617)), level(0.0)).x;
    float3 _9626 = float3(_3632, _3634, _3586);
    float4 _3645 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9626, float3(0.0), isnan(_9626)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9626, float3(0.0), isnan(_9626)), level(0.0)).xyzw;
    float _3647 = _3645.x;
    float _3649 = _3645.y;
    float _3651 = _3645.z;
    float _3653 = _3645.w;
    float2 _9642 = float2(_3584, _3606);
    float3 _3655 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9642, float2(0.0), isnan(_9642)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9642, float2(0.0), isnan(_9642)), level(0.0)).xyz;
    float _3657 = _3655.x;
    float _3659 = _3655.y;
    float _3661 = _3655.z;
    float _3663 = _3412;
    if (!_3166)
    {
        float3 _9663 = float3(_3614, _3412, float(as_type<int>(_3628)));
        float3 _9665 = select(_9663, float3(0.0), isnan(_9663));
        float _3665 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9665.xy, uint(rint(_9665.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9665.xy, uint(rint(_9665.z)), level(0.0)).x;
        _3663 = _3665;
    }
    float _3667 = _3663;
    float _3669 = abs(_3008);
    float _3671 = log2(_3669);
    float _3673 = _3494 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3675 = _3452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3677 = fma(_3520, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3673);
    float _3679 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3677);
    float _3681 = exp2(_3675);
    bool _3683 = _3008 <= 8000.0;
    bool _3685 = isnan(_3008);
    bool _3687 = _3683 || _3685;
    bool _3689 = isnan(8000.0);
    bool _3691 = _3687 || _3689;
    float _3693 = float(_3691);
    float _3695 = fma(_3528, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3679);
    float _3697 = _3671 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3588;
    out.gl_Position.y = _3602;
    out.gl_Position.z = _3695;
    out.gl_Position.w = _3556;
    float _3699 = exp2(_3697);
    float _3701 = fma(_3699, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3703 = precise::clamp(_3701, 0.0, 1.0);
    float _3705 = fma(_3703, -2.0, 3.0);
    float _3707 = _3703 * _3703;
    float _3709 = _3707 * _3705;
    float _3711 = -_3709;
    float _3713 = _3711 + 1.0;
    float _3715 = fma(_3713, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3709);
    float _3717 = -_3681;
    float _3719 = _3717 + 1.0;
    float _3721 = _3693 * _3715;
    float _3723 = _3715;
    float _3725 = _3695;
    if (!_3536)
    {
        _3723 = 1.0;
    }
    float _3727 = _3723;
    float _3729 = _3721 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3731 = -_3490;
    float _3733 = _3731 + 1.0;
    float _3735 = _3733 * _3729;
    float _3737 = precise::clamp(_3735, 0.0, 1.0);
    float _3739 = _3729;
    float _3741 = _3727;
    if (_3166)
    {
        _3739 = 1.0;
    }
    float _3743 = _3739;
    float _3745 = _3743;
    if (_3536)
    {
        bool _3747 = _3640 >= _3604;
        bool _3749 = isnan(_3640);
        bool _3751 = _3747 || _3749;
        bool _3753 = isnan(_3604);
        bool _3755 = _3751 || _3753;
        float _3757 = float(_3755);
        _3741 = _3757;
    }
    float _3759 = _3741;
    float _3761 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3763 = _3759;
    if (!_3166)
    {
        int _3765 = _3320 << 4;
        int _3767 = _3765 + 2048;
        uint _3769 = uint(int(uint(_3767) >> uint(2)));
        uint _3771 = uint(int(uint(int(_3769)) >> uint(2)));
        int _3773 = int(_3769) & 3;
        float _3775 = (*spvDescriptorSet0.vp_c15)._m0[int(_3771)][_3773];
        int _3777 = int(_3769) + 1;
        uint _3779 = uint(int(uint(_3777) >> uint(2)));
        int _3781 = _3777 & 3;
        float _3783 = (*spvDescriptorSet0.vp_c15)._m0[int(_3779)][_3781];
        int _3785 = _3767 + 8;
        uint _3787 = uint(int(uint(_3785) >> uint(2)));
        uint _3789 = uint(int(uint(int(_3787)) >> uint(2)));
        int _3791 = int(_3787) & 3;
        float _3793 = (*spvDescriptorSet0.vp_c15)._m0[int(_3789)][_3791];
        int _3795 = int(_3787) + 1;
        uint _3797 = uint(int(uint(_3795) >> uint(2)));
        int _3799 = _3795 & 3;
        float _3801 = (*spvDescriptorSet0.vp_c15)._m0[int(_3797)][_3799];
        float _3803 = _2978 * _3783;
        float _3805 = fma(_1047, _3775, _3803);
        float _3807 = fma(_1049, _3793, _3805);
        float _3809 = _3807 + _3801;
        float _3811 = precise::clamp(_3809, 0.0, 1.0);
        float _3813 = -_3811;
        float _3815 = _3813 + _3667;
        float _3817 = fma(_3815, 500.0, 1.5);
        float _3819 = exp2(_3817);
        float _3821 = 0.0 + _3819;
        float _3823 = precise::clamp(_3821, 0.0, 1.0);
        _3745 = _3823;
        _3572 = _3801;
        _3608 = _3783;
        _3725 = _3793;
    }
    float _3825 = _3745;
    float _3827 = _3572;
    float _3829 = _3608;
    float _3831 = _3725;
    float _3833 = _3759 * _3825;
    float _3835 = _3761 * _3642;
    float _3837 = -_3737;
    float _3839 = fma(_3837, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3841 = -_3761;
    float _3843 = _3841 + 1.0;
    out.m_98.x = _2908;
    out.m_98.y = _2906;
    out.m_98.z = _2910;
    float _3845 = _3653 * _3835;
    float _3847 = -_3833;
    float _3849 = fma(_3847, _3839, 1.0);
    float _3851 = precise::clamp(_3849, 0.0, 1.0);
    float _3853 = _3661 * _3835;
    float _3855 = _3653 * _3843;
    float _3857 = fma(_3657, _3845, _3647);
    float _3859 = fma(_3659, _3845, _3649);
    float _3861 = _3851 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3863 = fma(_3653, _3853, _3651);
    bool _3865 = _2954 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3867 = isnan(_2954);
    bool _3869 = _3865 || _3867;
    bool _3871 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3873 = _3869 || _3871;
    out.m_100.x = _3861;
    out.m_102.x = _3857;
    out.m_102.y = _3859;
    out.m_102.z = _3863;
    out.m_102.w = _3855;
    float _3875 = _3827;
    float _3877 = _3831;
    float _3879 = _3829;
    float _3881 = _3845;
    float _3883 = _3851;
    if (!_3873)
    {
        _3763 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3885 = _3763;
    float _3887 = _3885;
    float _3889 = _3885;
    if (!_3873)
    {
        _3875 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3891 = _3875;
    float _3893 = _3891;
    float _3895 = _3891;
    if (!_3873)
    {
        _3877 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3897 = _3877;
    float _3899 = _3897;
    float _3901 = _3897;
    if (!_3873)
    {
        _3879 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3903 = _3879;
    float _3905 = _3903;
    float _3907 = _3903;
    if (!_3873)
    {
        _3881 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3909 = _3881;
    float _3911 = _3909;
    float _3913 = _3909;
    if (!_3873)
    {
        _3883 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3915 = _3883;
    bool _3917 = !_3873;
    float _3919 = _3915;
    float _3921 = _3915;
    if (!_3917)
    {
        bool _3923 = _2954 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3925 = isnan(_2954);
        bool _3927 = _3923 || _3925;
        bool _3929 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3931 = _3927 || _3929;
        if (!_3931)
        {
            float _3933 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3935 = _2954 + _3933;
            float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3939 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3937;
            float _3941 = 1.0 / _3939;
            float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3949 = _3947 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3951 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3955 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3957 = _3955 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3959 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3963 = _3935 * _3941;
            float _3965 = precise::clamp(_3963, 0.0, 1.0);
            float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3971 = fma(_3965, _3945, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3973 = fma(_3965, _3969, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3975 = fma(_3965, _3949, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3977 = fma(_3965, _3953, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3979 = fma(_3965, _3957, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3981 = fma(_3965, _3961, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3895 = _3973;
            _3913 = _3979;
            _3889 = _3971;
            _3907 = _3977;
            _3901 = _3975;
            _3921 = _3981;
            _3983 = true;
        }
        else
        {
            bool _3985 = _2954 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3987 = isnan(_2954);
            bool _3989 = _3985 || _3987;
            bool _3991 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3993 = _3989 || _3991;
            if (!_3993)
            {
                _3887 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3995 = _3887;
            _3889 = _3995;
            if (!_3993)
            {
                _3893 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3997 = _3893;
            _3895 = _3997;
            if (!_3993)
            {
                _3899 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3999 = _3899;
            _3901 = _3999;
            if (!_3993)
            {
                _3905 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4001 = _3905;
            _3907 = _4001;
            if (!_3993)
            {
                _3911 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4003 = _3911;
            _3913 = _4003;
            if (!_3993)
            {
                _3919 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4005 = _3919;
            bool _4007 = !_3993;
            _3921 = _4005;
            if (!_4007)
            {
                bool _4009 = _2954 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4011 = isnan(_2954);
                bool _4013 = _4009 || _4011;
                bool _4015 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4017 = _4013 || _4015;
                if (!_4017)
                {
                    float _4019 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4021 = _2954 + _4019;
                    float _4023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4025 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4023;
                    float _4027 = 1.0 / _4025;
                    float _4029 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4033 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4037 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4039 = _4037 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4041 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4043 = _4041 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4047 = _4045 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4049 = _4021 * _4027;
                    float _4051 = precise::clamp(_4049, 0.0, 1.0);
                    float _4053 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4057 = fma(_4051, _4031, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4059 = fma(_4051, _4055, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4061 = fma(_4051, _4035, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4063 = fma(_4051, _4039, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4065 = fma(_4051, _4043, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4067 = fma(_4051, _4047, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3895 = _4059;
                    _3913 = _4065;
                    _3889 = _4057;
                    _3907 = _4063;
                    _3901 = _4061;
                    _3921 = _4067;
                    _3983 = true;
                }
                else
                {
                    _3895 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3913 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3889 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3907 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3901 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3921 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3983 = false;
    float _4069 = _3895;
    float _4071 = _3913;
    float _4073 = _3889;
    float _4075 = _3907;
    float _4077 = _3901;
    float _4079 = _3921;
    float _4081 = fma(_2750, -0.5, 0.5);
    float _4083 = precise::clamp(_4081, 0.0, 1.0);
    float _4085 = -_4069;
    float _4087 = _4085 + _4071;
    float _4089 = -_4073;
    float _4091 = _4089 + _4075;
    float _4093 = -_4077;
    float _4095 = _4093 + _4079;
    bool _4097 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4099 = fma(_4083, _4087, _4069);
    float _4101 = fma(_4083, _4091, _4073);
    float _4103 = fma(_4083, _4095, _4077);
    float _4105 = _4099 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _4107 = fma(_4101, 0.298911988735198974609375, _4105);
    float _4109 = fma(_4103, 0.114477999508380889892578125, _4107);
    out.m_104.x = 0.0;
    float _4111 = -_4109;
    float _4113 = _4101 + _4111;
    float _4115 = -_4109;
    float _4117 = _4099 + _4115;
    float _4119 = -_4109;
    float _4121 = _4103 + _4119;
    float _4123 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4125 = fma(_4113, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4109);
    float _4127 = fma(_4117, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4109);
    float _4129 = fma(_4121, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4109);
    out.m_100.w = _4123;
    out.m_106.x = _4125;
    out.m_106.y = _4127;
    out.m_106.z = _4129;
    if (!_4097)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4131 = -_2906;
    float _4133 = _4131 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4135 = -_2908;
    float _4137 = _4135 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4139 = -_2910;
    float _4141 = _4139 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4143 = _4133 * _4133;
    float _4145 = fma(_4137, _4137, _4143);
    float _4147 = fma(_4141, _4141, _4145);
    float _4149 = sqrt(_4147);
    float _4151 = rsqrt(_4147);
    float _4153 = -_4149;
    float _4155 = _4153 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4157 = _4155 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4159 = precise::clamp(_4157, 0.0, 1.0);
    float _4161 = _4137 * _4151;
    float _4163 = _4133 * _4151;
    float _4165 = abs(_4159);
    float _4167 = log2(_4165);
    float _4169 = _4141 * _4151;
    float _4171 = _4161 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4173 = _2750 * _4163;
    float _4175 = -_4163;
    float _4177 = -_4171;
    float _4179 = fma(_4175, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4177);
    float _4181 = fma(_2792, _4161, _4173);
    float _4183 = -_4169;
    float _4185 = fma(_4183, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4179);
    float _4187 = fma(_2808, _4169, _4181);
    float _4189 = precise::clamp(_4187, 0.0, 1.0);
    float _4191 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4193 = _4185 + _4191;
    float _4195 = _4167 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4197 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4199 = precise::clamp(_4197, 0.0, 1.0);
    float _4201 = exp2(_4195);
    float _4203 = _4201 * _4199;
    float _4205 = _4189 * _4203;
    float _4207 = _4205 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4209 = _4205 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4211 = _4205 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_104.x = _4207;
    out.m_104.y = _4209;
    out.m_104.z = _4211;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

