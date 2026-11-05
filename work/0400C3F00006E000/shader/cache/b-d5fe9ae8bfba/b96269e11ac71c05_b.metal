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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_20 [[id(6)]];
    sampler vp_t_tcb_20Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_16 [[id(8)]];
    sampler vp_t_tcb_16Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_24 [[id(10)]];
    sampler vp_t_tcb_24Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    texture2d_array<float> vp_t_tcb_14 [[id(18)]];
    sampler vp_t_tcb_14Smplr [[id(19)]];
    sampler vp_t_tcb_20Smplr_w [[id(20)]];
    sampler vp_t_tcb_24Smplr_w [[id(21)]];
    sampler vp_t_tcb_32Smplr_w [[id(22)]];
    sampler vp_t_tcb_30Smplr_w [[id(23)]];
    sampler vp_t_tcb_1CSmplr_w [[id(24)]];
    sampler vp_t_tcb_14Smplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_86 [[user(locn0)]];
    float4 m_88 [[user(locn1)]];
    float4 m_104 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_92 [[user(locn5)]];
    float4 m_96 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_102 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_98 [[user(locn10)]];
    float4 m_100 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    uint4 m_82 [[attribute(0)]];
    float4 m_76 [[attribute(1)]];
    float4 m_78 [[attribute(2)]];
    float4 m_74 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_63 [[attribute(6)]];
    float4 m_68 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3855 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_58.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    float _131 = as_type<float>(_123);
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _129;
    float _135 = _133;
    if (!_127)
    {
        out.m_61.x = 0.0;
    }
    int _137 = 0;
    if (!_127)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4142 = as_type<float>(_141);
        out.gl_Position.z = _4142;
    }
    if (!_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_63.w;
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
        float _165 = float(_123);
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
        out.m_61.x = 0.0;
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
        float _4211 = as_type<float>(_179);
        out.gl_Position.z = _4211;
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
        float _203 = in.m_68.x;
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
        float _223 = float(_123);
        float _225 = 1.0 / _223;
        float _227 = _159 * _225;
        _219 = _227;
    }
    _221 = false;
    float _229 = _219;
    float _231 = in.m_68.x;
    float _233 = in.m_68.y;
    float _235 = in.m_68.z;
    float _237 = in.m_68.w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = _229 + _239;
    float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _245 = log2(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _261 = 1.0 / _249;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _267 = _265 != 0;
    float _269 = 1.0 / _253;
    float _271 = float(_123);
    float _273 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _275 = _231 * 2.0;
    float _277 = _233 * 2.0;
    float _279 = 1.0 / _257;
    float _281 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _283 = fma(_273, -2.0, _263);
    float _285 = _241 * _261;
    float _287 = _235 * 2.0;
    float _289 = -_259;
    float _291 = fma(_281, 2.0, _289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _229 + _293;
    float _297 = floor(_275);
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _301 = _229 + _299;
    float _303 = -_159;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[76].x, _291);
    float _307 = _295 * _269;
    float _309 = _231 + _233;
    float _311 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _283);
    float _313 = _301 * _279;
    float _315 = _235 + _231;
    float _317 = floor(_277);
    float _319 = _309 + (-1.0);
    float _321 = _315 + (-1.0);
    float _323 = _235 + _233;
    float _325 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _327 = floor(_287);
    float _329 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _331 = _323 + (-1.0);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _333;
    bool _337 = _297 > 0.0;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _343 = _297 >= 0.0;
    bool _345 = isnan(_297);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _355;
    int _359 = as_type<int>(_331);
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    if (_267)
    {
        _359 = 0;
    }
    int _363 = _359;
    float _365 = fma(_335, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _367 = _363;
    if (!_267)
    {
        _367 = 1;
    }
    int _369 = _367;
    float _371 = fma(_357, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _373 = _317 > 0.0;
    float _375 = fma(_341, _313, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _377 = _351 ? 0 : 1;
    float _379 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _381 = int(_379);
    bool _383 = _369 != 1;
    bool _385 = _327 > 0.0;
    bool _387 = _317 >= 0.0;
    bool _389 = isnan(_317);
    bool _391 = _387 || _389;
    bool _393 = isnan(0.0);
    bool _395 = _391 || _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _401 = _327 >= 0.0;
    bool _403 = isnan(_327);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = 1.0 / _271;
    float _413 = _395 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _415 = fma(_399, _313, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _417 = ~_377;
    int _419 = _417 + 1;
    int _421 = _419 + 1;
    int _423 = _421;
    float _425 = _413;
    if (!_337)
    {
        int _427 = ~_377;
        int _429 = _427 + 1;
        _423 = _429;
    }
    int _431 = _423;
    int _433 = _409 ? 0 : 1;
    float _435 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _437 = int(_435);
    int _439 = ~as_type<int>(_413);
    int _441 = _439 + 1;
    int _443 = _441 + 1;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _447 = _443;
    if (!_373)
    {
        int _449 = ~as_type<int>(_413);
        int _451 = _449 + 1;
        _447 = _451;
    }
    int _453 = _447;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_383)
    {
        _361 = _233;
    }
    float _457 = _361;
    float _459 = _411 * _159;
    float _461 = _457;
    if (!_383)
    {
        _425 = _235;
    }
    float _463 = _425;
    int _465 = ~_433;
    int _467 = _465 + 1;
    int _469 = _467 + 1;
    float _471 = _463;
    int _473 = _469;
    if (_383)
    {
        _461 = _231;
    }
    float _475 = _461;
    if (_383)
    {
        _471 = _233;
    }
    float _477 = _471;
    float _479 = _477;
    if (!_385)
    {
        int _481 = ~_433;
        int _483 = _481 + 1;
        _473 = _483;
    }
    int _485 = _473;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[83].z, _445);
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _499 = _497 != 0;
    float _501 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[83].w, _455);
    float _503 = float(_431);
    float _505 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _487);
    if (!_383)
    {
        _131 = _235;
    }
    float _507 = _131;
    float _509 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _501);
    bool _511 = !_495;
    int _513 = _511 ? 0 : 1;
    bool _515 = !_491;
    int _517 = _515 ? 0 : 1;
    bool _519 = !_499;
    int _521 = _519 ? 0 : 1;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _533 = _531 != 0;
    float _535 = _507;
    if (!_383)
    {
        _479 = _233;
    }
    float _537 = _479;
    float _539 = _537;
    if (_383)
    {
        _535 = _233;
    }
    float _541 = _535;
    bool _543 = !_529;
    int _545 = _543 ? 0 : 1;
    bool _547 = !_525;
    int _549 = _547 ? 0 : 1;
    int _551 = abs(_545);
    float _553 = float(_551);
    float _555 = float(_485);
    float _557 = _245 * _159;
    if (_383)
    {
        _539 = _231;
    }
    float _559 = _539;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _563 = float(_437);
    float _565 = _553 * _503;
    int _567 = abs(_549);
    float _569 = _541 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _571 = 1.0 / _563;
    float _573 = _559 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _575 = float(_381);
    float _577 = -_561;
    float _579 = fma(_573, 2.0, _577);
    float _581 = float(_567);
    float _583 = exp2(_557);
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _587 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _589 = isnan(_229);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = _581 * _555;
    bool _601 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _603 = isnan(_229);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _615 = 1.0 + _613;
    float _617 = 1.0 / _575;
    float _619 = -_597;
    float _621 = _619 + 1.0;
    float _623 = fma(_569, -2.0, _585);
    bool _625 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _627 = isnan(1.0);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _633 = _629 || _631;
    float _635 = _611 * _621;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _639 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _641 = isnan(0.0);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _647 = _643 || _645;
    float _649 = 1.0 / _615;
    float _651 = in.m_70.x;
    float _653 = in.m_70.y;
    float _655 = in.m_70.z;
    float _657 = -_583;
    float _659 = _657 + 1.0;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _663 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].z, _637);
    bool _665 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _667 = isnan(_229);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -_611;
    float _679 = _677 + 1.0;
    float _681 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _661);
    float _683 = _647 ? _659 : 0.0;
    float _685 = _571 * _159;
    bool _687 = !_533;
    int _689 = _687 ? 0 : 1;
    float _691 = _617 * _159;
    float _693 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _663);
    float _695 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _681);
    float _697 = -_159;
    float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[81].x, _579);
    float _701 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _623);
    float _703 = _693;
    if (_633)
    {
        float _705 = _683 * _649;
        _163 = _705;
    }
    float _707 = _163;
    float _709 = _599 * (-2.0);
    bool _711 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _713 = isnan(_229);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = _675 * _679;
    int _725 = abs(_689);
    float _727 = -_675;
    float _729 = _727 + 1.0;
    float _731 = _231 + (-0.5);
    float _733 = fma(_325, _709, _325);
    float _735 = fma(_709, _651, _651);
    float _737 = _721 * _729;
    float _739 = -_721;
    float _741 = _739 + 1.0;
    float _743 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[196].x, _735);
    float _745 = float(_453);
    float _747 = _371 * _737;
    float _749 = float(_725);
    float _751 = _565 * (-2.0);
    float _753 = _365 * _737;
    float _755 = fma(_733, _707, _743);
    float _757 = _749 * _745;
    float _759 = fma(_751, _653, _653);
    float _761 = _233 + (-0.5);
    float _763 = fma(_353, _751, _353);
    float _765 = _757 * (-2.0);
    float _767 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[143].y, _753);
    float _769 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[196].y, _759);
    float _771 = in.m_72.x;
    float _773 = in.m_72.y;
    float _775 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[143].x, _747);
    float _777 = fma(_765, _655, _655);
    float _779 = fma(_763, _707, _769);
    float _781 = _755 * 0.15915493667125701904296875;
    float _783 = in.m_58.x;
    float _785 = in.m_58.y;
    float _787 = in.m_58.z;
    float _789 = _235 + (-0.5);
    float _791 = _779 * 0.15915493667125701904296875;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _793;
    float _797 = in.m_74.x;
    float _799 = in.m_74.y;
    float _801 = in.m_74.z;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _803;
    float _807 = fma(_329, _765, _329);
    float _809 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[196].z, _777);
    float _811 = fma(_795, _285, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _813 = fma(_805, _285, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _815 = fma(_415, _723, _775);
    float _817 = fma(_375, _723, _767);
    float _819 = fma(_807, _707, _809);
    float _821 = _781 * 6.283185482025146484375;
    float _823 = sin(_821);
    float _825 = fma(_811, _635, _815);
    float _827 = fma(_813, _635, _817);
    float _829 = _819 * 0.15915493667125701904296875;
    float _831 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _833 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[146].x, _825);
    float _835 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[146].y, _827);
    bool _837 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _839 = isnan(0.5);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _845 = _841 || _843;
    float _847 = _781 * 6.283185482025146484375;
    float _849 = cos(_847);
    float _851 = _833 * _771;
    float _853 = _835 * _773;
    float _855 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _857 = _853 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _859 = _785 * _799;
    float _861 = _791 * 6.283185482025146484375;
    float _863 = sin(_861);
    float _865 = _851 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _867 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _869 = fma(_783, _797, _859);
    float _871 = _865 * _855;
    float _873 = _857 * _867;
    float _875 = in.m_76.x;
    float _877 = in.m_76.y;
    float _879 = in.m_76.z;
    float _881 = _791 * 6.283185482025146484375;
    float _883 = cos(_881);
    float _885 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _887 = fma(_787, _801, _869);
    float _889 = _887 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _891 = _829 * 6.283185482025146484375;
    float _893 = cos(_891);
    float _895 = _823 * _863;
    float _897 = _849 * _863;
    float _899 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _901 = _829 * 6.283185482025146484375;
    float _903 = sin(_901);
    float _905 = _849 * _883;
    float _907 = _823 * _883;
    float _909 = _785 * _877;
    float _911 = _849 * _893;
    float _913 = _883 * _893;
    float _915 = _823 * _893;
    float _917 = _863 * _893;
    float _919 = _911 * _873;
    float _921 = fma(_783, _875, _909);
    float _923 = _915 * _873;
    float _925 = fma(_903, _905, _895);
    float _927 = -_873;
    float _929 = _903 * _927;
    float _931 = -_907;
    float _933 = fma(_903, _897, _931);
    float _935 = -_897;
    float _937 = fma(_903, _907, _935);
    float _939 = fma(_925, _871, _919);
    float _941 = fma(_913, _871, _929);
    float _943 = fma(_903, _895, _905);
    float _945 = fma(_937, _871, _923);
    float _947 = fma(_933, _885, _939);
    float _949 = fma(_917, _885, _941);
    float _951 = fma(_787, _879, _921);
    float _953 = fma(_943, _885, _945);
    float _955 = _947 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _957 = _947 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _959 = _951 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _961 = _947 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].x, _955);
    float _965 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _957);
    float _967 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].x, _961);
    float _969 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _963);
    float _971 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _965);
    float _973 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _967);
    float _975 = _969 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _977 = _971 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _979 = _889 + _975;
    float _981 = _959 + _977;
    float _983 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _985 = _979 + _983;
    float _987 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _989 = _981 + _987;
    float _991 = _985 * _985;
    float _993 = fma(_989, _989, _991);
    float _995 = in.m_78.x;
    float _997 = in.m_78.y;
    float _999 = in.m_78.z;
    float _1001 = sqrt(_993);
    bool _1003 = _1001 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _1001 + _1005;
    float _1009 = _785 * _997;
    float _1011 = fma(_783, _995, _1009);
    float _1013 = _973 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1015 = _875;
    float _1017 = _995;
    float _1019 = _1013;
    float _1021 = _1007;
    float _1023 = _787;
    float _1025 = _981;
    float _1027 = _979;
    int _1029 = 2;
    if (_1003)
    {
        float _1031 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1015 = _1031;
    }
    float _1033 = _1015;
    float _1035 = fma(_787, _999, _1011);
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_1003)
    {
        float _1039 = rsqrt(_993);
        _1017 = _1039;
    }
    float _1041 = _1017;
    float _1043 = _1037 + _1013;
    float _1045 = _1037 + _831;
    float _1047 = _1043;
    if (_1003)
    {
        float _1049 = _1043 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1019 = _1049;
    }
    float _1051 = _1019;
    float _1053 = _1033;
    if (_1003)
    {
        float _1055 = _1007 * _1033;
        _1021 = _1055;
    }
    float _1057 = _1021;
    if (_1003)
    {
        float _1059 = _1057 * 0.15915493667125701904296875;
        _1053 = _1059;
    }
    float _1061 = _1053;
    float _1063 = _1057;
    if (_1003)
    {
        float _1065 = _1061 * 6.283185482025146484375;
        float _1067 = cos(_1065);
        _1063 = _1067;
    }
    float _1069 = _1063;
    float _1071 = _785;
    if (_1003)
    {
        float _1073 = _1061 * 6.283185482025146484375;
        float _1075 = sin(_1073);
        _1071 = _1075;
    }
    float _1077 = _1071;
    if (_1003)
    {
        float _1079 = _1069 + (-1.0);
        _1023 = _1079;
    }
    float _1081 = _1023;
    float _1083 = _1081;
    if (_1003)
    {
        float _1085 = _1081 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1083 = _1085;
    }
    float _1087 = _1083;
    float _1089 = _1077;
    if (_1003)
    {
        float _1091 = fma(_1077, _1051, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1089 = _1091;
    }
    float _1093 = _1089;
    float _1095 = _1093;
    if (_1003)
    {
        float _1097 = fma(_1043, _1069, _1087);
        _1047 = _1097;
    }
    float _1099 = _1047;
    float _1101 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1003)
    {
        float _1103 = _1041 * _1093;
        _1095 = _1103;
    }
    float _1105 = _1095;
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1109 = _1099 + _1107;
    float _1111 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1101);
    if (_1003)
    {
        float _1113 = fma(_989, _1105, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1025 = _1113;
    }
    float _1115 = _1025;
    if (_1003)
    {
        float _1117 = fma(_985, _1105, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1027 = _1117;
    }
    float _1119 = _1027;
    float _1121 = _1109 * _1109;
    float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1125 = _1115 + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1129 = _1119 + _1127;
    float _1131 = fma(_1125, _1125, _1121);
    float _1133 = fma(_1129, _1129, _1131);
    float _1135 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1111);
    float _1137 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1139 = rsqrt(_1133);
    float _1141 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1143 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1137);
    float _1145 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1143);
    float _1147 = 1.0 / _1141;
    float _1149 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1151 = _1149 + _1141;
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1155 = sqrt(_1133);
    float _1157 = _1125 * _1153;
    float _1159 = _1129 * _1153;
    float _1161 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1163 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1165 = _1157 * _1157;
    float _1167 = _1159 * _1159;
    float _1169 = _1151 * _1147;
    float _1171 = _1169 * 0.5;
    float _1173 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1161);
    float _1175 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1163);
    float _1177 = _1165 + _1167;
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1181 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1179);
    float _1183 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1173);
    float _1185 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1175);
    float _1187 = sqrt(_1177);
    float _1189 = _1183 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1191 = _1185 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1193 = 1.0 / _1181;
    bool _1195 = _1187 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1197 = trunc(_1189);
    int _1199 = int(_1197);
    float _1201 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1203 = _1187 + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1207 = _1193 * _1205;
    float _1209 = trunc(_1191);
    int _1211 = int(_1209);
    bool _1213 = _1207 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1215 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1217 = _1207 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1219 = !_1213;
    int _1221 = _1219 ? 0 : 1;
    float _1223 = _1061;
    float _1225 = _1203;
    int _1227 = as_type<int>(_1153);
    float _1229 = _1177;
    float _1231 = _1157;
    float _1233 = _1159;
    float _1235 = _1165;
    float _1237 = _1167;
    float _1239 = _1191;
    if (_1195)
    {
        float _1241 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1223 = _1241;
    }
    float _1243 = _1223;
    int _1245 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1247 = _1199 + _1245;
    int _1249 = _1247 + 1;
    float _1251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1253 = precise::max(0.0, _1251);
    float _1255 = floor(_1215);
    int _1257 = _1249;
    if (!_1213)
    {
        _1029 = 1;
    }
    int _1259 = _1029;
    int _1261 = _1259;
    if (!_1217)
    {
        _1261 = _1221;
    }
    int _1263 = _1261;
    float _1265 = -_1153;
    float _1267 = -_1253;
    float _1269 = fma(_1109, _1265, _1267);
    int _1271 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1273 = _1211 + _1271;
    int _1275 = _1273 + 1;
    int _1277 = _1263 << 6;
    float _1279 = _1269;
    if (_1195)
    {
        float _1281 = _1203 * _1243;
        _1225 = _1281;
    }
    float _1283 = _1225;
    bool _1285 = _1249 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1287 = 0.0;
    if (_1195)
    {
        float _1289 = rsqrt(_1177);
        _1287 = _1289;
    }
    float _1291 = _1287;
    int _1293 = _1277 + 48;
    uint _1296 = uint(int(uint(_1293) >> uint(2)));
    uint _1298 = uint(int(uint(int(_1296)) >> uint(2)));
    int _1300 = int(_1296) & 3;
    float _1302 = (*spvDescriptorSet0.vp_c15)._m0[int(_1298)][_1300];
    int _1304 = int(_1296) + 1;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    int _1308 = _1304 & 3;
    float _1310 = (*spvDescriptorSet0.vp_c15)._m0[int(_1306)][_1308];
    float _1312 = 0.0;
    float _1314 = _1291;
    if (_1195)
    {
        float _1316 = _1283 * 0.15915493667125701904296875;
        _1312 = _1316;
    }
    float _1318 = _1312;
    int _1320 = _1249 | _1275;
    float _1322 = -_1255;
    float _1324 = _1215 + _1322;
    bool _1326 = _1320 < 0;
    bool _1328 = _1326 || _1285;
    float _1330 = 0.0;
    float _1332 = _1318;
    float _1334 = _1255;
    if (_1195)
    {
        float _1336 = _1318 * 6.283185482025146484375;
        float _1338 = sin(_1336);
        _1330 = _1338;
    }
    float _1340 = _1330;
    int _1342 = _1277 + 64;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    uint _1346 = uint(int(uint(int(_1344)) >> uint(2)));
    int _1348 = int(_1344) & 3;
    float _1350 = (*spvDescriptorSet0.vp_c15)._m0[int(_1346)][_1348];
    int _1352 = int(_1344) + 1;
    uint _1354 = uint(int(uint(_1352) >> uint(2)));
    int _1356 = _1352 & 3;
    float _1358 = (*spvDescriptorSet0.vp_c15)._m0[int(_1354)][_1356];
    bool _1360 = _1275 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1362 = _1360 || _1328;
    float _1364 = 0.0;
    if (_1195)
    {
        float _1366 = _1318 * 6.283185482025146484375;
        float _1368 = cos(_1366);
        _1364 = _1368;
    }
    float _1370 = _1364;
    int _1372 = _1277 + 80;
    uint _1374 = uint(int(uint(_1372) >> uint(2)));
    uint _1376 = uint(int(uint(int(_1374)) >> uint(2)));
    int _1378 = int(_1374) & 3;
    float _1380 = (*spvDescriptorSet0.vp_c15)._m0[int(_1376)][_1378];
    int _1382 = int(_1374) + 1;
    uint _1384 = uint(int(uint(_1382) >> uint(2)));
    int _1386 = _1382 & 3;
    float _1388 = (*spvDescriptorSet0.vp_c15)._m0[int(_1384)][_1386];
    if (!_1362)
    {
        int _1390 = _1275 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1392 = _1390 + _1249;
        _1227 = _1392;
    }
    int _1394 = _1227;
    int _1396 = _1277 + 96;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    uint _1400 = uint(int(uint(int(_1398)) >> uint(2)));
    int _1402 = int(_1398) & 3;
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[int(_1400)][_1402];
    int _1406 = int(_1398) + 1;
    uint _1408 = uint(int(uint(_1406) >> uint(2)));
    int _1410 = _1406 & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    if (_1195)
    {
        float _1414 = _1269 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1332 = _1414;
    }
    float _1416 = _1332;
    float _1418 = floor(_899);
    float _1420 = _1416;
    if (!_1362)
    {
        int _1422 = _1394 << 2;
        _1257 = _1422;
    }
    int _1424 = _1257;
    int _1426 = _1424;
    if (_1195)
    {
        float _1428 = fma(_1340, _1416, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1420 = _1428;
    }
    float _1430 = _1420;
    if (_1195)
    {
        float _1432 = _1370 + (-1.0);
        _1334 = _1432;
    }
    float _1434 = _1334;
    int _1436 = _1277 + 72;
    uint _1438 = uint(int(uint(_1436) >> uint(2)));
    uint _1440 = uint(int(uint(int(_1438)) >> uint(2)));
    int _1442 = int(_1438) & 3;
    float _1444 = (*spvDescriptorSet0.vp_c15)._m0[int(_1440)][_1442];
    int _1446 = int(_1438) + 1;
    uint _1448 = uint(int(uint(_1446) >> uint(2)));
    int _1450 = _1446 & 3;
    float _1452 = (*spvDescriptorSet0.vp_c15)._m0[int(_1448)][_1450];
    if (_1195)
    {
        float _1454 = _1291 * _1430;
        _1314 = _1454;
    }
    float _1456 = _1314;
    if (!_1362)
    {
        int _1458 = 12 & _1424;
        _1426 = _1458;
    }
    int _1460 = _1426;
    if (_1195)
    {
        float _1462 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1229 = _1462;
    }
    float _1464 = _1229;
    float _1466 = as_type<float>(_1275);
    int _1468 = as_type<int>(_1464);
    if (!_1362)
    {
        float _1470 = floor(_1191);
        _1466 = _1470;
    }
    float _1472 = _1466;
    if (_1195)
    {
        float _1474 = _1157 * _1456;
        _1231 = _1474;
    }
    float _1476 = _1231;
    if (_1195)
    {
        float _1478 = _1159 * _1456;
        _1233 = _1478;
    }
    float _1480 = _1233;
    if (_1195)
    {
        float _1482 = fma(_1269, _1370, _1464);
        _1279 = _1482;
    }
    float _1484 = _1279;
    int _1486 = _1277 + 104;
    uint _1488 = uint(int(uint(_1486) >> uint(2)));
    uint _1490 = uint(int(uint(int(_1488)) >> uint(2)));
    int _1492 = int(_1488) & 3;
    float _1494 = (*spvDescriptorSet0.vp_c15)._m0[int(_1490)][_1492];
    int _1496 = int(_1488) + 1;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    int _1500 = _1496 & 3;
    float _1502 = (*spvDescriptorSet0.vp_c15)._m0[int(_1498)][_1500];
    if (_1195)
    {
        float _1504 = _1476 * _1476;
        _1235 = _1504;
    }
    float _1506 = _1235;
    if (_1195)
    {
        float _1508 = _1480 * _1480;
        _1237 = _1508;
    }
    float _1510 = _1237;
    if (!_1362)
    {
        uint _1512 = uint(int(uint(_1394) >> uint(2)));
        _1468 = int(_1512);
    }
    int _1514 = _1468;
    float _1516 = fma(_1484, _1484, _1506);
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1520 = _1518 != 0;
    int _1522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1524 = _1522 != 0;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1528 = _1526 != 0;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1532 = _1530 != 0;
    int _1534 = _1277 + 56;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    uint _1538 = uint(int(uint(int(_1536)) >> uint(2)));
    int _1540 = int(_1536) & 3;
    float _1542 = (*spvDescriptorSet0.vp_c15)._m0[int(_1538)][_1540];
    int _1544 = int(_1536) + 1;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    int _1548 = _1544 & 3;
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[int(_1546)][_1548];
    float _1552 = _1516 + _1510;
    int _1554 = _1514;
    float _1556 = _1552;
    if (!_1362)
    {
        int _1558 = _1514 << 4;
        int _1560 = _1558 + _1460;
        _1554 = _1560;
    }
    int _1562 = _1554;
    float _1564 = _1045 * _1310;
    float _1566 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1568 = rsqrt(_1552);
    if (!_1362)
    {
        float _1570 = -_1472;
        float _1572 = _1191 + _1570;
        _1239 = _1572;
    }
    float _1574 = _1239;
    float _1576 = fma(_959, _1302, _1564);
    int _1578 = _1277 + 88;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    uint _1582 = uint(int(uint(int(_1580)) >> uint(2)));
    int _1584 = int(_1580) & 3;
    float _1586 = (*spvDescriptorSet0.vp_c15)._m0[int(_1582)][_1584];
    int _1588 = int(_1580) + 1;
    uint _1590 = uint(int(uint(_1588) >> uint(2)));
    int _1592 = _1588 & 3;
    float _1594 = (*spvDescriptorSet0.vp_c15)._m0[int(_1590)][_1592];
    float _1596 = _1045 * _1358;
    float _1598 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1600 = !_1524;
    int _1602 = _1600 ? 0 : 1;
    float _1604 = fma(_959, _1350, _1596);
    float _1606 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1598);
    if (_845)
    {
        _1556 = 1.0;
    }
    float _1608 = _1556;
    float _1610 = _1350;
    float _1612 = _1608;
    if (!_1362)
    {
        int _1614 = _1562 + 400;
        uint _1616 = uint(int(uint(_1614) >> uint(2)));
        uint _1618 = uint(int(uint(int(_1616)) >> uint(2)));
        int _1620 = int(_1616) & 3;
        float _1622 = (*spvDescriptorSet0.vp_c15)._m0[int(_1618)][_1620];
        _1610 = _1622;
    }
    float _1624 = _1610;
    float _1626 = _1045 * _1388;
    float _1628 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1606);
    float _1630 = -_1418;
    float _1632 = _899 + _1630;
    bool _1634 = !_1520;
    int _1636 = _1634 ? 0 : 1;
    float _1638 = _1568 * _1476;
    float _1640 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1642 = fma(_959, _1380, _1626);
    float _1644 = _1045 * _1412;
    float _1646 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1648 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1650 = _1568 * _1480;
    float _1652 = fma(_959, _1404, _1644);
    bool _1654 = !_1528;
    int _1656 = _1654 ? 0 : 1;
    bool _1658 = !_1532;
    int _1660 = _1658 ? 0 : 1;
    float _1662 = fma(_889, _1444, _1604);
    float _1664 = _1568 * _1484;
    float _1666 = _1662 + _1452;
    float _1668 = -_1646;
    float _1670 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1668);
    float _1672 = -_1648;
    float _1674 = fma(_1672, _1566, 1.0);
    float _1676 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1678 = fma(_889, _1494, _1652);
    float _1680 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1682 = -_1650;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1670);
    float _1686 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1676);
    float _1688 = _1678 + _1502;
    float _1690 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1680);
    float _1692 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1694 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1686);
    float _1696 = fma(_889, _1542, _1576);
    float _1698 = 1.0 / _1688;
    float _1700 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1690);
    float _1702 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1704 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1692);
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1708 = fma(_1155, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1706);
    float _1710 = precise::clamp(_1708, 0.0, 1.0);
    float _1712 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1714 = fma(_889, _1586, _1642);
    float _1716 = _1696 + _1550;
    float _1718 = -_1710;
    float _1720 = _1718 + 1.0;
    float _1722 = _1642;
    float _1724 = _1594;
    float _1726 = _1714;
    float _1728 = _1664;
    if (!_1362)
    {
        float _1730 = floor(_1189);
        _1722 = _1730;
    }
    float _1732 = _1722;
    float _1734 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1736 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1704);
    float _1738 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1734);
    float _1740 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1742 = _1716 * _1698;
    float _1744 = log2(_1674);
    float _1746 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1738);
    bool _1748 = _1742 >= 0.0;
    float _1750 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1746);
    float _1752 = abs(_1720);
    float _1754 = log2(_1752);
    if (!_845)
    {
        float _1756 = as_type<float>(in.m_82.w);
        int _1758 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1760 = _1758 == 4;
        bool _1762 = _1758 == 8;
        bool _1764 = _1758 == 12;
        int _1766 = as_type<int>(_1756) << 16;
        int _1768 = as_type<int>(_1756) << 8;
        int _1770 = as_type<int>(_1756) << 24;
        int _1772 = _1766 >> 24;
        int _1774 = _1768 >> 24;
        int _1776 = as_type<int>(_1756) >> 24;
        int _1778 = _1770 >> 24;
        float _1780 = float(_1772);
        float _1782 = float(_1774);
        float _1784 = float(_1776);
        float _1786 = _1780 * 0.0078740157186985015869140625;
        float _1788 = float(_1778);
        float _1790 = _1782 * 0.0078740157186985015869140625;
        float _1792 = _1784 * 0.0078740157186985015869140625;
        float _1794 = precise::min(_1786, 1.0);
        float _1796 = _1788 * 0.0078740157186985015869140625;
        float _1798 = precise::min(_1790, 1.0);
        float _1800 = precise::min(_1792, 1.0);
        float _1802 = precise::min(_1796, 1.0);
        float _1804 = precise::max(_1794, -1.0);
        float _1806 = precise::max(_1798, -1.0);
        float _1808 = precise::max(_1800, -1.0);
        float _1810 = precise::max(_1802, -1.0);
        float _1812 = _1810;
        if (_1760)
        {
            _1812 = _1804;
        }
        float _1814 = _1812;
        float _1816 = _1814;
        if (_1762)
        {
            _1816 = _1806;
        }
        float _1818 = _1816;
        float _1820 = _1818;
        if (_1764)
        {
            _1820 = _1808;
        }
        float _1822 = _1820;
        float _1824 = abs(_1822);
        float _1826 = (-0.0) + _1824;
        _1612 = _1826;
    }
    float _1828 = _1612;
    float _1830 = _1666 * _1698;
    bool _1832 = _1742 <= 1.0;
    bool _1834 = _1832 && _1748;
    float _1836 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1838 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1840 = _1828 != 0.0;
    bool _1842 = isnan(_1828);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan(0.0);
    bool _1848 = _1844 || _1846;
    float _1850 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1852 = _1830 >= 0.0;
    bool _1854 = _1852 && _1834;
    float _1856 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1836);
    float _1858 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1838);
    float _1860 = fma(_1684, -0.5, 0.5);
    bool _1862 = _1830 <= 1.0;
    bool _1864 = _1862 && _1854;
    float _1866 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1856);
    float _1868 = 1.0 / _1750;
    float _1870 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1858);
    float _1872 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1866);
    float _1874 = fma(_1684, 0.5, 0.5);
    float _1876 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1870);
    float _1878 = _1714 + _1594;
    float _1880 = _1744 * 0.693147182464599609375;
    float _1882 = sqrt(_1860);
    float _1884 = fma(_1874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1886 = _1860;
    float _1888 = _1830;
    float _1890 = _1876;
    float _1892 = _1872;
    if (_1848)
    {
        _1724 = _1872;
    }
    float _1894 = _1724;
    float _1896 = _1878 * _1698;
    float _1898 = _1894;
    if (_1848)
    {
        _1726 = _1876;
    }
    float _1900 = _1726;
    float _1902 = _1900;
    if (!_1848)
    {
        _1898 = 0.0;
        _1902 = 0.0;
    }
    float _1904 = _1898;
    float _1906 = _1902;
    float _1908 = fma(_1874, _1884, -0.212114393711090087890625);
    float _1910 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1912 = exp2(_1850);
    if (_1864)
    {
        float _1914 = float(_1263);
        _1886 = _1914;
    }
    float _1916 = _1886;
    float _1918 = _1664 + 1.0;
    float _1920 = fma(_1874, _1908, 1.570728778839111328125);
    float _1922 = _1868 * _1904;
    float _1924 = _1868 * _1906;
    float _1926 = fma(_1115, 6.2500002968590706586837768554688e-05, 0.5);
    float _1928 = fma(_1119, 6.2500002968590706586837768554688e-05, 0.5);
    float _1930 = _1916;
    if (_1864)
    {
        float _1932 = rint(_1916);
        float _1934 = precise::max(_1932, 0.0);
        uint _1936 = uint(_1934);
        uint _1938 = clamp(_1936, 0u, 65535u);
        _1930 = as_type<float>(_1938);
    }
    float _1940 = _1930;
    float _1942 = _1882 * 0.636619746685028076171875;
    float _1944 = fma(_1922, 0.5, 0.5);
    float _1946 = -_1920;
    float _1948 = fma(_1942, _1946, 1.0);
    float _1950 = _1624;
    if (!_1362)
    {
        float _1952 = rint(_1624);
        float _1954 = precise::max(_1952, 0.0);
        uint _1956 = uint(_1954);
        uint _1958 = clamp(_1956, 0u, 65535u);
        _1950 = as_type<float>(_1958);
    }
    float _1960 = _1950;
    float _1962 = -_1664;
    float _1964 = fma(_1912, _1918, _1962);
    if (!_1362)
    {
        float _1966 = -_1732;
        float _1968 = _1189 + _1966;
        _1728 = _1968;
    }
    float _1970 = _1728;
    float _1972 = fma(_1924, -0.5, 0.5);
    float2 _7021 = float2(_1926, _1928);
    float3 _1976 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_7021, float2(0.0), isnan(_7021)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_7021, float2(0.0), isnan(_7021)), level(0.0)).xyz;
    float _1978 = _1976.x;
    float _1980 = _1976.y;
    float _1982 = _1976.z;
    float _1984 = fma(_1964, 0.5, 0.5);
    if (_1864)
    {
        float3 _7044 = float3(_1742, _1830, float(as_type<int>(_1940)));
        float3 _7048 = select(_7044, float3(0.0), isnan(_7044));
        float _1986 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7048.xy, uint(rint(_7048.z)), _1896, level(0.0));
        _1888 = _1986;
    }
    float _1988 = _1888;
    float2 _7057 = float2(_1324, _1632);
    float _1990 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7057, float2(0.0), isnan(_7057)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7057, float2(0.0), isnan(_7057)), level(0.0)).x;
    float3 _7066 = float3(_1944, _1972, _1910);
    float _1992 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7066, float3(0.0), isnan(_7066)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7066, float3(0.0), isnan(_7066)), level(0.0)).x;
    float3 _7075 = float3(_1944, _1972, _1910);
    float4 _1995 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7075, float3(0.0), isnan(_7075)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7075, float3(0.0), isnan(_7075)), level(0.0)).xyzw;
    float _1997 = _1995.x;
    float _1999 = _1995.y;
    float _2001 = _1995.z;
    float _2003 = _1995.w;
    float2 _7091 = float2(_1948, _1984);
    float3 _2005 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7091, float2(0.0), isnan(_7091)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7091, float2(0.0), isnan(_7091)), level(0.0)).xyz;
    float _2007 = _2005.x;
    float _2009 = _2005.y;
    float _2011 = _2005.z;
    float _2013 = _1574;
    if (!_1362)
    {
        float3 _7112 = float3(_1970, _1574, float(as_type<int>(_1960)));
        float3 _7114 = select(_7112, float3(0.0), isnan(_7112));
        float _2015 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7114.xy, uint(rint(_7114.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7114.xy, uint(rint(_7114.z)), level(0.0)).x;
        _2013 = _2015;
    }
    float _2017 = _2013;
    float _2019 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2021 = int(_2019);
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2025 = _2023 != 0;
    float _2027 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2029 = abs(_513);
    float _2031 = -_695;
    float _2033 = _2031 + 1.0;
    int _2035 = abs(_1602);
    float _2037 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2027);
    int _2039 = abs(_1656);
    float _2041 = trunc(_685);
    int _2043 = int(_2041);
    int _2045 = abs(_1660);
    float _2047 = -_505;
    float _2049 = _2047 + 1.0;
    float _2051 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2053 = float(uint(_2021));
    float _2055 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2057 = int(_2055);
    int _2059 = ~_2021;
    int _2061 = _2059 + 1;
    float _2063 = float(uint(_2043));
    float _2065 = 1.0 / _2053;
    int _2067 = ~_2021;
    int _2069 = _2067 + 1;
    int _2071 = _2021 + (-1);
    float _2073 = float(uint(_2057));
    float _2075 = trunc(_691);
    int _2077 = int(_2075);
    int _2079 = ~_2057;
    int _2081 = _2079 + 1;
    int _2083 = as_type<int>(_2065) + (-2);
    float _2085 = 1.0 / _2073;
    float _2087 = as_type<float>(_2083) * _2063;
    float _2089 = exp2(_2051);
    float _2091 = trunc(_2087);
    float _2093 = precise::max(_2091, 0.0);
    uint _2095 = uint(_2093);
    int _2097 = _2069 * int(_2095);
    int _2099 = _2097 + _2043;
    float _2101 = float(uint(_2099));
    int _2103 = as_type<int>(_2085) + (-2);
    float _2105 = _2085;
    float _2107 = _2101;
    if (_2025)
    {
        float _2109 = in.m_68.x;
        _2105 = _2109;
    }
    float _2111 = _2105;
    float _2113 = as_type<float>(_2083) * _2101;
    if (_2025)
    {
        _2107 = 1.0;
    }
    float _2115 = _2107;
    float _2117 = _2115;
    if (!_2025)
    {
        _2117 = 7.345489978790283203125;
    }
    float _2119 = _2117;
    float _2121 = _2111;
    if (!_2025)
    {
        float _2123 = in.m_68.y;
        _2121 = _2123;
    }
    float _2125 = _2121;
    float _2127 = trunc(_2113);
    float _2129 = precise::max(_2127, 0.0);
    uint _2131 = uint(_2129);
    float _2133 = _2119 * _231;
    float _2135 = float(uint(_2077));
    float _2137 = as_type<float>(_2103) * _2135;
    float _2139 = floor(_2133);
    int _2141 = int(_2095) + int(_2131);
    float _2143 = trunc(_2137);
    float _2145 = precise::max(_2143, 0.0);
    uint _2147 = uint(_2145);
    float _2149 = float(_2021);
    float _2151 = float(_2043);
    int _2153 = _2061 * _2141;
    int _2155 = _2153 + _2043;
    bool _2157 = _2151 >= _2149;
    bool _2159 = isnan(_2151);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan(_2149);
    bool _2165 = _2161 || _2163;
    float _2167 = float(_2165);
    float _2169 = -_2139;
    float _2171 = _2133 + _2169;
    bool _2173 = uint(_2155) >= uint(_2021);
    float _2175 = _2171 * _2149;
    float _2177 = trunc(_2167);
    int _2179 = int(_2177);
    bool _2181 = !_2173;
    int _2183 = _2181 ? 0 : (-1);
    int _2185 = _2081 * int(_2147);
    int _2187 = _2185 + _2077;
    bool _2189 = _2021 == 0;
    int _2191 = ~_2141;
    int _2193 = _2191 + _2183;
    int _2195 = _2193 + 1;
    float _2197 = float(uint(_2187));
    float _2199 = trunc(_2175);
    int _2201 = int(_2199);
    int _2203 = _2021 * _2195;
    int _2205 = _2203 + _2043;
    float _2207 = as_type<float>(_2103) * _2197;
    float _2209 = _2149 * _459;
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2213 = _2211 != 0;
    int _2215 = ~_2179;
    int _2217 = _2215 + 1;
    int _2219 = _2217 + 1;
    float _2221 = trunc(_2209);
    int _2223 = int(_2221);
    bool _2225 = !_2189;
    float _2227 = _2225 ? as_type<float>(_2205) : as_type<float>(0xffffffffu /* nan */);
    bool _2229 = !_2213;
    int _2231 = _2229 ? 0 : 1;
    int _2233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2235 = _2233 != 0;
    int _2237 = as_type<int>(_2227) * _2219;
    float _2239 = _2227;
    if (_2025)
    {
        _2239 = 1.0;
    }
    float _2241 = _2239;
    float _2243 = trunc(_2207);
    float _2245 = precise::max(_2243, 0.0);
    uint _2247 = uint(_2245);
    float _2249 = _2241;
    if (!_2025)
    {
        _2249 = 1.2345600128173828125;
    }
    float _2251 = _2249;
    int _2253 = _2179 * _2071;
    int _2255 = _2253 + _2237;
    int _2257 = abs(_517);
    int _2259 = abs(_2231);
    float _2261 = _2251 * _2125;
    bool _2263 = !_2235;
    int _2265 = _2263 ? 0 : 1;
    int _2267 = _2255 * _2029;
    int _2269 = abs(_521);
    float _2271 = floor(_2261);
    int _2273 = _2201 * _2259;
    int _2275 = _2273 + _2043;
    int _2277 = ~_2057;
    int _2279 = _2277 + 1;
    int _2281 = abs(_2265);
    int _2283 = _2223 * _2257;
    int _2285 = _2283 + _2267;
    int _2287 = int(_2147) + int(_2247);
    float _2289 = float(_2057);
    int _2291 = _2279 * _2287;
    int _2293 = _2291 + _2077;
    float _2295 = float(_2077);
    float _2297 = -_2271;
    float _2299 = _2261 + _2297;
    bool _2301 = _2295 >= _2289;
    bool _2303 = isnan(_2295);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(_2289);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    int _2313 = _2275 * _2269;
    int _2315 = _2313 + _2285;
    bool _2317 = uint(_2293) >= uint(_2057);
    int _2319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2321 = _2319 != 0;
    int _2323 = _2201 * _2281;
    int _2325 = _2323 + _2315;
    float _2327 = trunc(_2311);
    int _2329 = int(_2327);
    bool _2331 = !_2317;
    int _2333 = _2331 ? 0 : (-1);
    float _2335 = _2299 * _2289;
    bool _2337 = _2057 == 0;
    float _2339 = _2289 * _459;
    float _2341 = float(uint(_2325));
    int _2343 = ~_2287;
    int _2345 = _2343 + _2333;
    int _2347 = _2345 + 1;
    float _2349 = trunc(_2335);
    int _2351 = int(_2349);
    bool _2353 = !_2321;
    int _2355 = _2353 ? 0 : 1;
    float _2357 = as_type<float>(_2083) * _2341;
    int _2359 = _2057 + (-1);
    int _2361 = _2057 * _2347;
    int _2363 = _2361 + _2077;
    int _2365 = abs(_2355);
    int _2367 = ~_2057;
    int _2369 = _2367 + 1;
    float _2371 = trunc(_2357);
    float _2373 = precise::max(_2371, 0.0);
    uint _2375 = uint(_2373);
    int _2377 = ~_2329;
    int _2379 = _2377 + 1;
    int _2381 = _2379 + 1;
    bool _2383 = !_2337;
    int _2385 = _2383 ? _2363 : (-1);
    int _2387 = _2385 * _2381;
    float _2389 = trunc(_2339);
    int _2391 = int(_2389);
    int _2393 = ~_2021;
    int _2395 = _2393 + 1;
    int _2397 = _2329 * _2359;
    int _2399 = _2397 + _2387;
    int _2401 = abs(_1636);
    int _2403 = _2399 * _2035;
    int _2405 = ~_2021;
    int _2407 = _2405 + 1;
    int _2409 = _2395 * int(_2375);
    int _2411 = _2409 + _2325;
    int _2413 = ~_2021;
    int _2415 = _2413 + 1;
    int _2417 = _2351 * _2365;
    int _2419 = _2417 + _2077;
    float _2421 = float(uint(_2411));
    int _2423 = _2391 * _2401;
    int _2425 = _2423 + _2403;
    float _2427 = as_type<float>(_2083) * _2421;
    int _2429 = _2419 * _2039;
    int _2431 = _2429 + _2425;
    float _2433 = float(uint(_2275));
    float _2435 = trunc(_2427);
    float _2437 = precise::max(_2435, 0.0);
    uint _2439 = uint(_2437);
    int _2441 = _2351 * _2045;
    int _2443 = _2441 + _2431;
    float _2445 = as_type<float>(_2083) * _2433;
    float _2447 = float(uint(_2443));
    float _2449 = float(uint(_2419));
    float _2451 = as_type<float>(_2103) * _2447;
    float _2453 = as_type<float>(_2103) * _2449;
    int _2455 = int(_2375) + int(_2439);
    float _2457 = trunc(_2451);
    float _2459 = precise::max(_2457, 0.0);
    uint _2461 = uint(_2459);
    int _2463 = ~_2057;
    int _2465 = _2463 + 1;
    int _2467 = _2415 * _2455;
    int _2469 = _2467 + _2325;
    float _2471 = trunc(_2445);
    float _2473 = precise::max(_2471, 0.0);
    uint _2475 = uint(_2473);
    bool _2477 = uint(_2469) >= uint(_2021);
    bool _2479 = !_2477;
    int _2481 = _2479 ? 0 : (-1);
    int _2483 = _2465 * int(_2461);
    int _2485 = _2483 + _2443;
    float _2487 = trunc(_2453);
    float _2489 = precise::max(_2487, 0.0);
    uint _2491 = uint(_2489);
    bool _2493 = _237 > 0.5;
    int _2495 = ~_2455;
    int _2497 = _2495 + _2481;
    int _2499 = _2497 + 1;
    float _2501 = float(uint(_2485));
    int _2503 = _2407 * int(_2475);
    int _2505 = _2503 + _2275;
    float _2507 = -_199;
    int _2509 = _2493 ? as_type<int>(_2507) : as_type<int>(_199);
    int _2511 = _2021 * _2499;
    int _2513 = _2511 + _2325;
    float _2515 = as_type<float>(_2103) * _2501;
    int _2517 = ~_2057;
    int _2519 = _2517 + 1;
    float _2521 = float(uint(_2505));
    float _2523 = trunc(_2515);
    float _2525 = precise::max(_2523, 0.0);
    uint _2527 = uint(_2525);
    bool _2529 = !_2189;
    int _2531 = _2529 ? _2513 : (-1);
    int _2533 = _2519 * int(_2491);
    int _2535 = _2533 + _2419;
    int _2537 = ~_2057;
    int _2539 = _2537 + 1;
    float _2541 = as_type<float>(_2083) * _2521;
    int _2543 = _2531 & 3;
    bool _2545 = _2543 != 0;
    int _2547 = _2531 & 3;
    bool _2549 = _2547 != 0;
    float _2551 = trunc(_2541);
    float _2553 = precise::max(_2551, 0.0);
    uint _2555 = uint(_2553);
    int _2557 = _2545 ? 0 : 1;
    out.m_84.x = _1978;
    out.m_84.y = _1980;
    out.m_84.z = _1982;
    bool _2559 = uint(_2547) > 1u;
    float _2561 = float(uint(_2535));
    int _2563 = ~_2557;
    int _2565 = _2563 + 1;
    int _2567 = _2565 + 1;
    float _2569 = -_1990;
    float _2571 = _2569 + 1.0;
    int _2573 = int(_2461) + int(_2527);
    float _2575 = as_type<float>(_2103) * _2561;
    bool _2577 = !_2549;
    int _2579 = _2577 ? 0 : 1;
    int _2581 = _2539 * _2573;
    int _2583 = _2581 + _2443;
    float _2585 = trunc(_2575);
    float _2587 = precise::max(_2585, 0.0);
    uint _2589 = uint(_2587);
    int _2591 = _2567;
    float _2593 = _1978;
    float _2595 = _1982;
    if (!_2559)
    {
        int _2597 = ~_2557;
        int _2599 = _2597 + 1;
        _2591 = _2599;
    }
    int _2601 = _2591;
    bool _2603 = uint(_2547) >= 2u;
    int _2605 = ~_2021;
    int _2607 = _2605 + 1;
    int _2609 = _2603 ? 0 : 1;
    bool _2611 = uint(_2583) >= uint(_2057);
    int _2613 = int(_2475) + int(_2555);
    bool _2615 = !_2611;
    int _2617 = _2615 ? 0 : (-1);
    int _2619 = abs(_2579);
    int _2621 = _2607 * _2613;
    int _2623 = _2621 + _2275;
    int _2625 = ~_2573;
    int _2627 = _2625 + _2617;
    int _2629 = _2627 + 1;
    int _2631 = int(_2491) + int(_2589);
    bool _2633 = uint(_2623) >= uint(_2021);
    int _2635 = _2057 * _2629;
    int _2637 = _2635 + _2443;
    int _2639 = _2531 >> 31;
    int _2641 = _2369 * _2631;
    int _2643 = _2641 + _2419;
    bool _2645 = !_2633;
    int _2647 = _2645 ? 0 : (-1);
    int _2649 = _2639 & 3;
    bool _2651 = !_2337;
    int _2653 = _2651 ? _2637 : (-1);
    int _2655 = _2531 + _2649;
    int _2657 = _2653 >> 31;
    bool _2659 = _2547 != 3;
    int _2661 = ~_2613;
    int _2663 = _2661 + _2647;
    int _2665 = _2663 + 1;
    int _2667 = _2657 & 3;
    int _2669 = _2655 >> 2;
    int _2671 = _2021 * _2665;
    int _2673 = _2671 + _2275;
    int _2675 = _2653 + _2667;
    int _2677 = ~_2609;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    int _2683 = _2675 >> 2;
    bool _2685 = !_2189;
    int _2687 = _2685 ? _2673 : (-1);
    int _2689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2691 = _2689 != 0;
    int _2693 = _2669 << 4;
    int _2695 = _2693 + 368;
    int _2697 = _2681;
    if (_2659)
    {
        int _2699 = ~_2609;
        int _2701 = _2699 + 1;
        _2697 = _2701;
    }
    int _2703 = _2697;
    int _2705 = _2683 << 4;
    int _2707 = _2705 + 512;
    uint _2709 = uint(int(uint(_2695) >> uint(2)));
    uint _2711 = uint(int(uint(int(_2709)) >> uint(2)));
    int _2713 = int(_2709) & 3;
    float _2715 = (*spvDescriptorSet0.vp_c9)._m0[int(_2711)][_2713];
    int _2717 = int(_2709) + 1;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    int _2721 = _2717 & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    int _2725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2727 = _2725 != 0;
    bool _2729 = !_2691;
    float _2731 = _2729 ? _199 : as_type<float>(_2509);
    int _2733 = _2653 & 3;
    bool _2735 = _2733 != 0;
    int _2737 = _2653 & 3;
    bool _2739 = _2737 != 0;
    int _2741 = _2707 + 8;
    uint _2743 = uint(int(uint(_2741) >> uint(2)));
    uint _2745 = uint(int(uint(int(_2743)) >> uint(2)));
    int _2747 = int(_2743) & 3;
    float _2749 = (*spvDescriptorSet0.vp_c9)._m0[int(_2745)][_2747];
    int _2751 = int(_2743) + 1;
    uint _2753 = uint(int(uint(_2751) >> uint(2)));
    int _2755 = _2751 & 3;
    float _2757 = (*spvDescriptorSet0.vp_c9)._m0[int(_2753)][_2755];
    bool _2759 = !_2727;
    int _2761 = _2759 ? 0 : 1;
    int _2763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2765 = _2763 != 0;
    int _2767 = _2735 ? 0 : 1;
    bool _2769 = !_2765;
    int _2771 = _2769 ? 0 : 1;
    uint _2773 = uint(int(uint(_2707) >> uint(2)));
    uint _2775 = uint(int(uint(int(_2773)) >> uint(2)));
    int _2777 = int(_2773) & 3;
    float _2779 = (*spvDescriptorSet0.vp_c9)._m0[int(_2775)][_2777];
    int _2781 = int(_2773) + 1;
    uint _2783 = uint(int(uint(_2781) >> uint(2)));
    int _2785 = _2781 & 3;
    float _2787 = (*spvDescriptorSet0.vp_c9)._m0[int(_2783)][_2785];
    bool _2789 = uint(_2737) > 1u;
    bool _2791 = _2547 != 3;
    bool _2793 = !_2739;
    int _2795 = _2793 ? 0 : 1;
    int _2797 = ~_2767;
    int _2799 = _2797 + 1;
    int _2801 = _2799 + 1;
    int _2803 = _2695 + 8;
    uint _2805 = uint(int(uint(_2803) >> uint(2)));
    uint _2807 = uint(int(uint(int(_2805)) >> uint(2)));
    int _2809 = int(_2805) & 3;
    float _2811 = (*spvDescriptorSet0.vp_c9)._m0[int(_2807)][_2809];
    int _2813 = int(_2805) + 1;
    uint _2815 = uint(int(uint(_2813) >> uint(2)));
    int _2817 = _2813 & 3;
    float _2819 = (*spvDescriptorSet0.vp_c9)._m0[int(_2815)][_2817];
    bool _2821 = uint(_2643) >= uint(_2057);
    float _2823 = _911 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2825 = abs(_2703);
    bool _2827 = !_2821;
    int _2829 = _2827 ? 0 : (-1);
    int _2831 = _2801;
    if (!_2789)
    {
        int _2833 = ~_2767;
        int _2835 = _2833 + 1;
        _2831 = _2835;
    }
    int _2837 = _2831;
    bool _2839 = !_2791;
    int _2841 = _2839 ? 0 : (-1);
    bool _2843 = uint(_2737) >= 2u;
    bool _2845 = _2737 != 3;
    int _2847 = _2843 ? 0 : 1;
    bool _2849 = _2737 != 3;
    int _2851 = ~_2631;
    int _2853 = _2851 + _2829;
    int _2855 = _2853 + 1;
    bool _2857 = !_2849;
    int _2859 = _2857 ? 0 : (-1);
    int _2861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2863 = _2861 != 0;
    int _2865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2867 = _2865 != 0;
    int _2869 = _2057 * _2855;
    int _2871 = _2869 + _2419;
    int _2873 = abs(_2601);
    int _2875 = ~_2847;
    int _2877 = _2875 + 1;
    int _2879 = _2877 + 1;
    int _2881 = _2879;
    if (_2845)
    {
        int _2883 = ~_2847;
        int _2885 = _2883 + 1;
        _2881 = _2885;
    }
    int _2887 = _2881;
    bool _2889 = _231 > 0.5;
    int _2891 = abs(_2837);
    bool _2893 = !_2337;
    int _2895 = _2893 ? _2871 : (-1);
    int _2897 = ~_2873;
    int _2899 = _2897 + 1;
    int _2901 = _2899 + 1;
    int _2903 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2905 = _2903 != 0;
    int _2907 = ~_2891;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    int _2913 = _2901 * as_type<int>(_2723);
    int _2915 = abs(_2795);
    int _2917 = _2911 * as_type<int>(_2787);
    int _2919 = ~_2619;
    int _2921 = _2919 + 1;
    int _2923 = _2921 + 1;
    int _2925 = ~_2915;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    float _2931 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2933 = int(_2931);
    int _2935 = abs(_2887);
    int _2937 = _2923 * as_type<int>(_2715);
    int _2939 = _2937 + _2913;
    int _2941 = _2929 * as_type<int>(_2779);
    int _2943 = _2941 + _2917;
    int _2945 = ~_2935;
    int _2947 = _2945 + 1;
    int _2949 = _2947 + 1;
    int _2951 = ~_2825;
    int _2953 = _2951 + 1;
    int _2955 = _2953 + 1;
    int _2957 = _2949 * as_type<int>(_2749);
    int _2959 = _2957 + _2943;
    int _2961 = _2955 * as_type<int>(_2811);
    int _2963 = _2961 + _2939;
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2967 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2969 = abs(_2859);
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2973 = -_195;
    int _2975 = _2889 ? as_type<int>(_2973) : as_type<int>(_195);
    float _2977 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2979 = int(_2977);
    bool _2981 = _233 > 0.5;
    float _2983 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2985 = ~_2969;
    int _2987 = _2985 + 1;
    int _2989 = _2987 + 1;
    float _2991 = _2965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2993 = float(uint(_2933));
    float _2995 = _2971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2997 = _2967 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2999 = abs(_2841);
    float _3001 = abs(_1207);
    float _3003 = log2(_3001);
    int _3005 = _2989 * as_type<int>(_2757);
    int _3007 = _3005 + _2959;
    int _3009 = abs(_2933);
    out.m_86.x = _2991;
    out.m_86.y = _2995;
    out.m_86.z = _2997;
    out.m_86.w = _2983;
    int _3011 = ~_2999;
    int _3013 = _3011 + 1;
    int _3015 = _3013 + 1;
    float _3017 = -_199;
    int _3019 = _2981 ? as_type<int>(_3017) : as_type<int>(_199);
    float _3021 = 1.0 / _2993;
    int _3023 = _3015 * as_type<int>(_2819);
    int _3025 = _3023 + _2963;
    int _3027 = abs(_2771);
    bool _3029 = _235 > 0.5;
    float _3031 = float(uint(_2979));
    float _3033 = _3003 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3035 = abs(_2761);
    float _3037 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3039 = ~_3035;
    int _3041 = _3039 + 1;
    int _3043 = _3041 + 1;
    float _3045 = 1.0 / _3031;
    float _3047 = _3037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3049 = _3025 * _3043;
    int _3051 = ~_3027;
    int _3053 = _3051 + 1;
    int _3055 = _3053 + 1;
    float _3057 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3059 = abs(_2979);
    int _3061 = _2687 * _3035;
    int _3063 = _3061 + _3049;
    float _3065 = float(uint(_3009));
    float _3067 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3069 = as_type<int>(_3021) + (-2);
    float _3071 = _911 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3073 = _3007 * _3055;
    float _3075 = float(uint(_3059));
    float _3077 = _911 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3079 = _3057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3081 = _3067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3083 = exp2(_3033);
    float _3085 = -_903;
    float _3087 = fma(_3085, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3071);
    float _3089 = float(uint(_3063));
    int _3091 = _2895 * _3027;
    int _3093 = _3091 + _3073;
    out.m_88.x = _3047;
    out.m_88.y = _3079;
    out.m_88.z = _3081;
    float _3095 = -_903;
    float _3097 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3077);
    float _3099 = -_903;
    float _3101 = fma(_3099, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2823);
    int _3103 = as_type<int>(_3045) + (-2);
    float _3105 = 1.0 / _3065;
    int _3107 = abs(_3063);
    float _3109 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3087);
    int _3111 = ~_2933;
    int _3113 = _3111 + 1;
    float _3115 = _925 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3117 = ~_2979;
    int _3119 = _3117 + 1;
    bool _3121 = !_2905;
    float _3123 = _3121 ? _195 : as_type<float>(_2975);
    float _3125 = 1.0 / _3075;
    float _3127 = as_type<float>(_3069) * _3089;
    float _3129 = float(uint(_3093));
    int _3131 = abs(_3093);
    float _3133 = fma(_3083, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3135 = precise::clamp(_3133, 0.0, 1.0);
    float _3137 = trunc(_3127);
    float _3139 = precise::max(_3137, 0.0);
    uint _3141 = uint(_3139);
    int _3143 = as_type<int>(_3105) + (-2);
    float _3145 = as_type<float>(_3103) * _3129;
    float _3147 = float(uint(_3107));
    float _3149 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3101);
    float _3151 = float(uint(_3131));
    float _3153 = _925 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3155 = _2933 == 0;
    float _3157 = trunc(_3145);
    float _3159 = precise::max(_3157, 0.0);
    uint _3161 = uint(_3159);
    int _3163 = as_type<int>(_3125) + (-2);
    float _3165 = as_type<float>(_3143) * _3147;
    float _3167 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3097);
    float _3169 = _925 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3171 = _1207 <= 8000.0;
    bool _3173 = isnan(_1207);
    bool _3175 = _3171 || _3173;
    bool _3177 = isnan(8000.0);
    bool _3179 = _3175 || _3177;
    float _3181 = float(_3179);
    float _3183 = as_type<float>(_3163) * _3151;
    float _3185 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3153);
    float _3187 = trunc(_3165);
    float _3189 = precise::max(_3187, 0.0);
    uint _3191 = uint(_3189);
    int _3193 = _3113 * int(_3141);
    int _3195 = _3193 + _3063;
    float _3197 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3169);
    float _3199 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3115);
    if (_1362)
    {
        _2593 = 1.0;
    }
    float _3201 = _2593;
    float _3203 = float(uint(_3195));
    float _3205 = _933 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3207 = trunc(_3183);
    float _3209 = precise::max(_3207, 0.0);
    uint _3211 = uint(_3209);
    int _3213 = _3119 * int(_3161);
    int _3215 = _3213 + _3093;
    float _3217 = as_type<float>(_3069) * _3203;
    float _3219 = _933 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3221 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3205);
    float _3223 = float(uint(_3215));
    float _3225 = _933 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3227 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3219);
    int _3229 = ~int(_3191);
    int _3231 = _3229 + 1;
    float _3233 = trunc(_3217);
    float _3235 = precise::max(_3233, 0.0);
    uint _3237 = uint(_3235);
    float _3239 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3225);
    float _3241 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3227);
    int _3243 = ~int(_3211);
    int _3245 = _3243 + 1;
    int _3247 = _3231 * _3009;
    int _3249 = _3247 + _3107;
    float _3251 = as_type<float>(_3103) * _3223;
    float _3253 = fma(_3135, -2.0, 3.0);
    float _3255 = _3135 * _3135;
    float _3257 = float(uint(_3249));
    int _3259 = _3245 * _3059;
    int _3261 = _3259 + _3131;
    float _3263 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3221);
    float _3265 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3239);
    float _3267 = trunc(_3251);
    float _3269 = precise::max(_3267, 0.0);
    uint _3271 = uint(_3269);
    float _3273 = as_type<float>(_3143) * _3257;
    float _3275 = float(uint(_3261));
    float _3277 = _3255 * _3253;
    int _3279 = int(_3141) + int(_3237);
    float _3281 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3197);
    float _3283 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3199);
    float _3285 = as_type<float>(_3163) * _3275;
    float _3287 = trunc(_3273);
    float _3289 = precise::max(_3287, 0.0);
    uint _3291 = uint(_3289);
    float _3293 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3185);
    int _3295 = ~_2933;
    int _3297 = _3295 + 1;
    float _3299 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3301 = !_2863;
    float _3303 = _3301 ? _199 : as_type<float>(_3019);
    float _3305 = -_195;
    int _3307 = _3029 ? as_type<int>(_3305) : as_type<int>(_195);
    int _3309 = _3297 * _3279;
    int _3311 = _3309 + _3063;
    float _3313 = trunc(_3285);
    float _3315 = precise::max(_3313, 0.0);
    uint _3317 = uint(_3315);
    float _3319 = _3299 * _3109;
    bool _3321 = !_2867;
    float _3323 = _3321 ? _195 : as_type<float>(_3307);
    float _3325 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3327 = uint(_3311) >= uint(_2933);
    out.m_90.x = _3293;
    out.m_90.y = _3281;
    out.m_90.z = _3283;
    int _3329 = ~_2979;
    int _3331 = _3329 + 1;
    float _3333 = fma(_3325, _3293, _3319);
    int _3335 = int(_3191) + int(_3291);
    float _3337 = _3299 * _3167;
    int _3339 = int(_3161) + int(_3271);
    float _3341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3343 = ~_3335;
    int _3345 = _3343 + 1;
    float _3347 = fma(_3325, _3281, _3337);
    int _3349 = int(_3211) + int(_3317);
    int _3351 = _3331 * _3339;
    int _3353 = _3351 + _3093;
    bool _3355 = !_3327;
    int _3357 = _3355 ? 0 : (-1);
    float _3359 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2037);
    int _3361 = ~_3349;
    int _3363 = _3361 + 1;
    int _3365 = ~_3279;
    int _3367 = _3365 + _3357;
    int _3369 = _3367 + 1;
    int _3371 = _3345 * _3009;
    int _3373 = _3371 + _3107;
    bool _3375 = uint(_3353) >= uint(_2979);
    float _3377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3379 = _3363 * _3059;
    int _3381 = _3379 + _3131;
    float _3383 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3359);
    int _3385 = _2933 * _3369;
    int _3387 = _3385 + _3063;
    bool _3389 = uint(_3373) >= uint(_3009);
    float _3391 = _3263 + _3347;
    bool _3393 = !_3375;
    int _3395 = _3393 ? 0 : (-1);
    out.gl_Position.x = _1872;
    out.gl_Position.y = _1876;
    out.gl_Position.z = _3383;
    out.gl_Position.w = _1750;
    bool _3397 = !_3155;
    int _3399 = _3397 ? _3387 : (-1);
    bool _3401 = uint(_3381) >= uint(_3059);
    float _3403 = _3341 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3405 = float(_3399);
    float _3407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3409 = _2933 == 0;
    int _3411 = _3063 ^ _2933;
    float _3413 = fma(_3403, _3405, _305);
    int _3415 = ~_3339;
    int _3417 = _3415 + _3395;
    int _3419 = _3417 + 1;
    bool _3421 = !_3401;
    int _3423 = _3421 ? 0 : (-1);
    int _3425 = _3093 ^ _2979;
    int _3427 = _2979 * _3419;
    int _3429 = _3427 + _3093;
    bool _3431 = !_3389;
    int _3433 = _3431 ? 0 : (-1);
    uint _3435 = uint(int(uint(_3411) >> uint(31)));
    int _3437 = ~_3423;
    int _3439 = _3349 + _3437;
    int _3441 = _3439 + 1;
    float _3443 = _3377 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3445 = _2979 == 0;
    float _3447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3449 = _2979 == 0;
    uint _3451 = uint(int(uint(_3425) >> uint(31)));
    float _3453 = fma(_3299, _3299, 1.0);
    int _3455 = ~_3433;
    int _3457 = _3335 + _3455;
    int _3459 = _3457 + 1;
    int _3461 = ~int(_3435);
    int _3463 = _3461 + 1;
    float _3465 = rsqrt(_3453);
    bool _3467 = !_3445;
    int _3469 = _3467 ? _3429 : (-1);
    int _3471 = ~int(_3451);
    int _3473 = _3471 + 1;
    int _3475 = _3459 ^ _3463;
    float _3477 = float(_3469);
    int _3479 = _3441 ^ _3473;
    float _3481 = _2731 + (-0.5);
    int _3483 = ~_3463;
    int _3485 = _3483 + _3475;
    int _3487 = _3485 + 1;
    float _3489 = _3123 + 0.5;
    float _3491 = fma(_3443, _3477, _699);
    int _3493 = ~_3473;
    int _3495 = _3493 + _3479;
    int _3497 = _3495 + 1;
    bool _3499 = !_3409;
    int _3501 = _3499 ? _3487 : (-1);
    float _3503 = fma(_3403, _3489, _3413);
    float _3505 = _3323 + 0.5;
    bool _3507 = !_3449;
    int _3509 = _3507 ? _3497 : (-1);
    float _3511 = _3407 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3513 = float(_3501);
    float _3515 = fma(_3443, _3505, _3491);
    float _3517 = float(_3509);
    float _3519 = _3447 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3521 = _3303 + (-0.5);
    float _3523 = -_311;
    float _3525 = fma(_3511, _3513, _3523);
    float _3527 = _3299 * _3465;
    float _3529 = -_701;
    float _3531 = fma(_3519, _3517, _3529);
    float _3533 = -_2049;
    float _3535 = fma(_3323, _3533, _3515);
    float _3537 = -_3511;
    float _3539 = fma(_3537, _3521, _3525);
    float _3541 = -_3263;
    float _3543 = _3527 * _3541;
    float _3545 = -_3519;
    float _3547 = fma(_3545, _3481, _3531);
    float _3549 = -_693;
    float _3551 = _3549 + 1.0;
    float _3553 = _3201;
    if (!_1848)
    {
        _703 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3555 = _703;
    float _3557 = fma(_3465, _3167, _3543);
    float _3559 = -_3241;
    float _3561 = _3527 * _3559;
    float _3563 = -_3265;
    float _3565 = _3527 * _3563;
    float _3567 = -_509;
    float _3569 = _3567 + 1.0;
    float _3571 = -_3551;
    float _3573 = fma(_3123, _3571, _3503);
    float _3575 = _3299 * _3149;
    float _3577 = fma(_3303, _2033, _3539);
    float _3579 = fma(_3465, _3109, _3561);
    float _3581 = fma(_3465, _3149, _3565);
    int _3583 = as_type<int>(_3555);
    if (!_1848)
    {
        float _3585 = _3555 * 5.0;
        _3583 = as_type<int>(_3585);
    }
    int _3587 = _3583;
    float _3589 = fma(_2731, _3569, _3547);
    float _3591 = -_3277;
    float _3593 = _3591 + 1.0;
    out.m_92.x = _3579;
    out.m_92.y = _3557;
    out.m_92.z = _3581;
    float _3595 = fma(_3325, _3283, _3575);
    if (!_1864)
    {
        _1890 = 1.0;
    }
    float _3597 = _1890;
    float _3599 = fma(_3593, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3277);
    float _3601 = _3597;
    if (!_1848)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9398 = as_type<float>(_3587);
        out.gl_Position.z = _9398;
    }
    float _3603 = _3241 + _3333;
    float _3605 = _3265 + _3595;
    float _3607 = _3181 * _3599;
    out.m_94.x = _3573;
    out.m_94.y = _3577;
    out.m_94.z = _3535;
    out.m_94.w = _3589;
    if (_1864)
    {
        bool _3609 = _1988 >= _1896;
        bool _3611 = isnan(_1988);
        bool _3613 = _3609 || _3611;
        bool _3615 = isnan(_1896);
        bool _3617 = _3613 || _3615;
        float _3619 = float(_3617);
        _3601 = _3619;
    }
    float _3621 = _3601;
    float _3623 = _3607 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3625 = _2571 * _3623;
    float _3627 = precise::clamp(_3625, 0.0, 1.0);
    float _3629 = _3623;
    float _3631 = _3621;
    if (!_1362)
    {
        int _3633 = _1394 << 4;
        int _3635 = _3633 + 2048;
        uint _3637 = uint(int(uint(_3635) >> uint(2)));
        uint _3639 = uint(int(uint(int(_3637)) >> uint(2)));
        int _3641 = int(_3637) & 3;
        float _3643 = (*spvDescriptorSet0.vp_c15)._m0[int(_3639)][_3641];
        int _3645 = int(_3637) + 1;
        uint _3647 = uint(int(uint(_3645) >> uint(2)));
        int _3649 = _3645 & 3;
        float _3651 = (*spvDescriptorSet0.vp_c15)._m0[int(_3647)][_3649];
        int _3653 = _3635 + 8;
        uint _3655 = uint(int(uint(_3653) >> uint(2)));
        uint _3657 = uint(int(uint(int(_3655)) >> uint(2)));
        int _3659 = int(_3655) & 3;
        float _3661 = (*spvDescriptorSet0.vp_c15)._m0[int(_3657)][_3659];
        int _3663 = int(_3655) + 1;
        uint _3665 = uint(int(uint(_3663) >> uint(2)));
        int _3667 = _3663 & 3;
        float _3669 = (*spvDescriptorSet0.vp_c15)._m0[int(_3665)][_3667];
        float _3671 = _1045 * _3651;
        float _3673 = fma(_959, _3643, _3671);
        float _3675 = fma(_889, _3661, _3673);
        float _3677 = _3675 + _3669;
        float _3679 = precise::clamp(_3677, 0.0, 1.0);
        float _3681 = -_3679;
        float _3683 = _3681 + _2017;
        float _3685 = fma(_3683, 500.0, 1.5);
        float _3687 = exp2(_3685);
        float _3689 = 0.0 + _3687;
        float _3691 = precise::clamp(_3689, 0.0, 1.0);
        _3553 = _3691;
        _3629 = _3669;
    }
    float _3693 = _3553;
    float _3695 = _3629;
    float _3697 = -_2089;
    float _3699 = _3697 + 1.0;
    float _3701 = _3621 * _3693;
    float _3703 = -_3627;
    float _3705 = fma(_3703, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_96.x = _3603;
    out.m_96.y = _3391;
    out.m_96.z = _3605;
    float _3707 = _3699 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3709 = _1155 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3711 = isnan(_1155);
    bool _3713 = _3709 || _3711;
    bool _3715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3717 = _3713 || _3715;
    float _3719 = -_3701;
    float _3721 = fma(_3719, _3705, 1.0);
    float _3723 = precise::clamp(_3721, 0.0, 1.0);
    float _3725 = _3707 * _1992;
    float _3727 = -_3707;
    float _3729 = _3727 + 1.0;
    float _3731 = _3723 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3733 = _1828 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3735 = _2003 * _3725;
    float _3737 = _2011 * _3725;
    float _3739 = _2003 * _3729;
    out.m_98.x = _3731;
    float _3741 = fma(_2007, _3735, _1997);
    float _3743 = fma(_2009, _3735, _1999);
    float _3745 = fma(_2003, _3737, _2001);
    float _3747 = _3733;
    float _3749 = _3695;
    float _3751 = _3735;
    float _3753 = _3731;
    if (!_1848)
    {
        _3747 = 0.0;
    }
    float _3755 = _3747;
    if (!_3717)
    {
        _3749 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3757 = _3749;
    out.m_100.x = _3741;
    out.m_100.y = _3743;
    out.m_100.z = _3745;
    out.m_100.w = _3739;
    float _3759 = _3757;
    float _3761 = _3757;
    if (!_3717)
    {
        _1892 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3763 = _1892;
    float _3765 = _3763;
    float _3767 = _3763;
    if (!_3717)
    {
        _3631 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3769 = _3631;
    float _3771 = _3769;
    float _3773 = _3769;
    if (!_3717)
    {
        _2595 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3775 = _2595;
    float _3777 = _3775;
    float _3779 = _3775;
    if (!_3717)
    {
        _3751 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3781 = _3751;
    float _3783 = _3781;
    float _3785 = _3781;
    if (!_3717)
    {
        _3753 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3787 = _3753;
    bool _3789 = !_3717;
    float _3791 = _3787;
    float _3793 = _3787;
    if (!_3789)
    {
        bool _3795 = _1155 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3797 = isnan(_1155);
        bool _3799 = _3795 || _3797;
        bool _3801 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3803 = _3799 || _3801;
        if (!_3803)
        {
            float _3805 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3807 = _1155 + _3805;
            float _3809 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3811 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3809;
            float _3813 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3815 = _3813 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3817 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3819 = _3817 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3821 = 1.0 / _3811;
            float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3825 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3827 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3829 = _3827 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3831 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3833 = _3831 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3835 = _3807 * _3821;
            float _3837 = precise::clamp(_3835, 0.0, 1.0);
            float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3841 = _3839 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3843 = fma(_3837, _3815, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3845 = fma(_3837, _3819, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3847 = fma(_3837, _3841, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3849 = fma(_3837, _3825, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3851 = fma(_3837, _3829, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3853 = fma(_3837, _3833, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3785 = _3843;
            _3767 = _3851;
            _3779 = _3845;
            _3761 = _3849;
            _3793 = _3847;
            _3773 = _3853;
            _3855 = true;
        }
        else
        {
            bool _3857 = _1155 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3859 = isnan(_1155);
            bool _3861 = _3857 || _3859;
            bool _3863 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3865 = _3861 || _3863;
            if (!_3865)
            {
                _3759 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3867 = _3759;
            _3761 = _3867;
            if (!_3865)
            {
                _3765 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3869 = _3765;
            _3767 = _3869;
            if (!_3865)
            {
                _3771 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3871 = _3771;
            _3773 = _3871;
            if (!_3865)
            {
                _3777 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3873 = _3777;
            _3779 = _3873;
            if (!_3865)
            {
                _3783 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3875 = _3783;
            _3785 = _3875;
            if (!_3865)
            {
                _3791 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3877 = _3791;
            bool _3879 = !_3865;
            _3793 = _3877;
            if (!_3879)
            {
                bool _3881 = _1155 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3883 = isnan(_1155);
                bool _3885 = _3881 || _3883;
                bool _3887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3889 = _3885 || _3887;
                if (!_3889)
                {
                    float _3891 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3893 = _1155 + _3891;
                    float _3895 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3897 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3895;
                    float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3901 = _3899 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3905 = _3903 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3907 = 1.0 / _3897;
                    float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3911 = _3909 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3919 = _3917 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3921 = _3893 * _3907;
                    float _3923 = precise::clamp(_3921, 0.0, 1.0);
                    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3929 = fma(_3923, _3901, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3931 = fma(_3923, _3905, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3933 = fma(_3923, _3927, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3935 = fma(_3923, _3911, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3937 = fma(_3923, _3915, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3939 = fma(_3923, _3919, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3785 = _3929;
                    _3767 = _3937;
                    _3779 = _3931;
                    _3761 = _3935;
                    _3793 = _3933;
                    _3773 = _3939;
                    _3855 = true;
                }
                else
                {
                    _3785 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3767 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3779 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3761 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3793 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3773 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3855 = false;
    float _3941 = _3785;
    float _3943 = _3767;
    float _3945 = _3779;
    float _3947 = _3761;
    float _3949 = _3793;
    float _3951 = _3773;
    float _3953 = fma(_3391, -0.5, 0.5);
    float _3955 = precise::clamp(_3953, 0.0, 1.0);
    float _3957 = -_3941;
    float _3959 = _3943 + _3957;
    float _3961 = -_3945;
    float _3963 = _3947 + _3961;
    float _3965 = -_3949;
    float _3967 = _3951 + _3965;
    bool _3969 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3971 = fma(_3955, _3959, _3941);
    float _3973 = fma(_3955, _3963, _3945);
    float _3975 = fma(_3955, _3967, _3949);
    float _3977 = _3755 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3979 = _3971 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _3981 = fma(_3973, 0.298911988735198974609375, _3979);
    out.m_98.w = _3977;
    float _3983 = fma(_3975, 0.114477999508380889892578125, _3981);
    out.m_102.x = 0.0;
    float _3985 = -_3983;
    float _3987 = _3973 + _3985;
    float _3989 = -_3983;
    float _3991 = _3971 + _3989;
    float _3993 = -_3983;
    float _3995 = _3975 + _3993;
    float _3997 = fma(_3987, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3983);
    float _3999 = fma(_3991, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3983);
    float _4001 = fma(_3995, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3983);
    out.m_104.x = _3997;
    out.m_104.y = _3999;
    out.m_104.z = _4001;
    if (!_3969)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4003 = -_1099;
    float _4005 = _4003 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4007 = -_1115;
    float _4009 = _4007 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4011 = -_1119;
    float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4015 = _4005 * _4005;
    float _4017 = fma(_4009, _4009, _4015);
    float _4019 = fma(_4013, _4013, _4017);
    float _4021 = sqrt(_4019);
    float _4023 = rsqrt(_4019);
    float _4025 = -_4021;
    float _4027 = _4025 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4029 = _4027 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4031 = precise::clamp(_4029, 0.0, 1.0);
    float _4033 = _4009 * _4023;
    float _4035 = _4005 * _4023;
    float _4037 = abs(_4031);
    float _4039 = log2(_4037);
    float _4041 = _4013 * _4023;
    float _4043 = _4033 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4045 = _3391 * _4035;
    float _4047 = -_4035;
    float _4049 = -_4043;
    float _4051 = fma(_4047, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4049);
    float _4053 = fma(_3603, _4033, _4045);
    float _4055 = -_4041;
    float _4057 = fma(_4055, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4051);
    float _4059 = fma(_3605, _4041, _4053);
    float _4061 = precise::clamp(_4059, 0.0, 1.0);
    float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4065 = _4057 + _4063;
    float _4067 = _4039 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4069 = _4065 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4071 = precise::clamp(_4069, 0.0, 1.0);
    float _4073 = exp2(_4067);
    float _4075 = _4073 * _4071;
    float _4077 = _4061 * _4075;
    float _4079 = _4077 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4081 = _4077 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4083 = _4077 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _4079;
    out.m_102.y = _4081;
    out.m_102.z = _4083;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3855 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_58.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    float _131 = as_type<float>(_123);
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _129;
    float _135 = _133;
    if (!_127)
    {
        out.m_61.x = 0.0;
    }
    int _137 = 0;
    if (!_127)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4142 = as_type<float>(_141);
        out.gl_Position.z = _4142;
    }
    if (!_127)
    {
        return out;
    }
    float _145 = in.m_63.w;
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
        float _165 = float(_123);
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
        out.m_61.x = 0.0;
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
        float _4211 = as_type<float>(_179);
        out.gl_Position.z = _4211;
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
        float _203 = in.m_68.x;
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
        float _223 = float(_123);
        float _225 = 1.0 / _223;
        float _227 = _159 * _225;
        _219 = _227;
    }
    _221 = false;
    float _229 = _219;
    float _231 = in.m_68.x;
    float _233 = in.m_68.y;
    float _235 = in.m_68.z;
    float _237 = in.m_68.w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = _229 + _239;
    float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _245 = log2(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _261 = 1.0 / _249;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _267 = _265 != 0;
    float _269 = 1.0 / _253;
    float _271 = float(_123);
    float _273 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _275 = _231 * 2.0;
    float _277 = _233 * 2.0;
    float _279 = 1.0 / _257;
    float _281 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _283 = fma(_273, -2.0, _263);
    float _285 = _241 * _261;
    float _287 = _235 * 2.0;
    float _289 = -_259;
    float _291 = fma(_281, 2.0, _289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _229 + _293;
    float _297 = floor(_275);
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _301 = _229 + _299;
    float _303 = -_159;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[76].x, _291);
    float _307 = _295 * _269;
    float _309 = _231 + _233;
    float _311 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _283);
    float _313 = _301 * _279;
    float _315 = _235 + _231;
    float _317 = floor(_277);
    float _319 = _309 + (-1.0);
    float _321 = _315 + (-1.0);
    float _323 = _235 + _233;
    float _325 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _327 = floor(_287);
    float _329 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _331 = _323 + (-1.0);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _333;
    bool _337 = _297 > 0.0;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _343 = _297 >= 0.0;
    bool _345 = isnan(_297);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _355;
    int _359 = as_type<int>(_331);
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    if (_267)
    {
        _359 = 0;
    }
    int _363 = _359;
    float _365 = fma(_335, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _367 = _363;
    if (!_267)
    {
        _367 = 1;
    }
    int _369 = _367;
    float _371 = fma(_357, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _373 = _317 > 0.0;
    float _375 = fma(_341, _313, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _377 = _351 ? 0 : 1;
    float _379 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _381 = int(_379);
    bool _383 = _369 != 1;
    bool _385 = _327 > 0.0;
    bool _387 = _317 >= 0.0;
    bool _389 = isnan(_317);
    bool _391 = _387 || _389;
    bool _393 = isnan(0.0);
    bool _395 = _391 || _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _401 = _327 >= 0.0;
    bool _403 = isnan(_327);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = 1.0 / _271;
    float _413 = _395 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _415 = fma(_399, _313, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _417 = ~_377;
    int _419 = _417 + 1;
    int _421 = _419 + 1;
    int _423 = _421;
    float _425 = _413;
    if (!_337)
    {
        int _427 = ~_377;
        int _429 = _427 + 1;
        _423 = _429;
    }
    int _431 = _423;
    int _433 = _409 ? 0 : 1;
    float _435 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _437 = int(_435);
    int _439 = ~as_type<int>(_413);
    int _441 = _439 + 1;
    int _443 = _441 + 1;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _447 = _443;
    if (!_373)
    {
        int _449 = ~as_type<int>(_413);
        int _451 = _449 + 1;
        _447 = _451;
    }
    int _453 = _447;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_383)
    {
        _361 = _233;
    }
    float _457 = _361;
    float _459 = _411 * _159;
    float _461 = _457;
    if (!_383)
    {
        _425 = _235;
    }
    float _463 = _425;
    int _465 = ~_433;
    int _467 = _465 + 1;
    int _469 = _467 + 1;
    float _471 = _463;
    int _473 = _469;
    if (_383)
    {
        _461 = _231;
    }
    float _475 = _461;
    if (_383)
    {
        _471 = _233;
    }
    float _477 = _471;
    float _479 = _477;
    if (!_385)
    {
        int _481 = ~_433;
        int _483 = _481 + 1;
        _473 = _483;
    }
    int _485 = _473;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[83].z, _445);
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _499 = _497 != 0;
    float _501 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[83].w, _455);
    float _503 = float(_431);
    float _505 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _487);
    if (!_383)
    {
        _131 = _235;
    }
    float _507 = _131;
    float _509 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _501);
    bool _511 = !_495;
    int _513 = _511 ? 0 : 1;
    bool _515 = !_491;
    int _517 = _515 ? 0 : 1;
    bool _519 = !_499;
    int _521 = _519 ? 0 : 1;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _533 = _531 != 0;
    float _535 = _507;
    if (!_383)
    {
        _479 = _233;
    }
    float _537 = _479;
    float _539 = _537;
    if (_383)
    {
        _535 = _233;
    }
    float _541 = _535;
    bool _543 = !_529;
    int _545 = _543 ? 0 : 1;
    bool _547 = !_525;
    int _549 = _547 ? 0 : 1;
    int _551 = abs(_545);
    float _553 = float(_551);
    float _555 = float(_485);
    float _557 = _245 * _159;
    if (_383)
    {
        _539 = _231;
    }
    float _559 = _539;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _563 = float(_437);
    float _565 = _553 * _503;
    int _567 = abs(_549);
    float _569 = _541 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _571 = 1.0 / _563;
    float _573 = _559 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _575 = float(_381);
    float _577 = -_561;
    float _579 = fma(_573, 2.0, _577);
    float _581 = float(_567);
    float _583 = exp2(_557);
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _587 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _589 = isnan(_229);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = _581 * _555;
    bool _601 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _603 = isnan(_229);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _615 = 1.0 + _613;
    float _617 = 1.0 / _575;
    float _619 = -_597;
    float _621 = _619 + 1.0;
    float _623 = fma(_569, -2.0, _585);
    bool _625 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _627 = isnan(1.0);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _633 = _629 || _631;
    float _635 = _611 * _621;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _639 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _641 = isnan(0.0);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _647 = _643 || _645;
    float _649 = 1.0 / _615;
    float _651 = in.m_70.x;
    float _653 = in.m_70.y;
    float _655 = in.m_70.z;
    float _657 = -_583;
    float _659 = _657 + 1.0;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _663 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].z, _637);
    bool _665 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _667 = isnan(_229);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -_611;
    float _679 = _677 + 1.0;
    float _681 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _661);
    float _683 = _647 ? _659 : 0.0;
    float _685 = _571 * _159;
    bool _687 = !_533;
    int _689 = _687 ? 0 : 1;
    float _691 = _617 * _159;
    float _693 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _663);
    float _695 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _681);
    float _697 = -_159;
    float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[81].x, _579);
    float _701 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _623);
    float _703 = _693;
    if (_633)
    {
        float _705 = _683 * _649;
        _163 = _705;
    }
    float _707 = _163;
    float _709 = _599 * (-2.0);
    bool _711 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _713 = isnan(_229);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = _675 * _679;
    int _725 = abs(_689);
    float _727 = -_675;
    float _729 = _727 + 1.0;
    float _731 = _231 + (-0.5);
    float _733 = fma(_325, _709, _325);
    float _735 = fma(_709, _651, _651);
    float _737 = _721 * _729;
    float _739 = -_721;
    float _741 = _739 + 1.0;
    float _743 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[196].x, _735);
    float _745 = float(_453);
    float _747 = _371 * _737;
    float _749 = float(_725);
    float _751 = _565 * (-2.0);
    float _753 = _365 * _737;
    float _755 = fma(_733, _707, _743);
    float _757 = _749 * _745;
    float _759 = fma(_751, _653, _653);
    float _761 = _233 + (-0.5);
    float _763 = fma(_353, _751, _353);
    float _765 = _757 * (-2.0);
    float _767 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[143].y, _753);
    float _769 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[196].y, _759);
    float _771 = in.m_72.x;
    float _773 = in.m_72.y;
    float _775 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[143].x, _747);
    float _777 = fma(_765, _655, _655);
    float _779 = fma(_763, _707, _769);
    float _781 = _755 * 0.15915493667125701904296875;
    float _783 = in.m_58.x;
    float _785 = in.m_58.y;
    float _787 = in.m_58.z;
    float _789 = _235 + (-0.5);
    float _791 = _779 * 0.15915493667125701904296875;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _793;
    float _797 = in.m_74.x;
    float _799 = in.m_74.y;
    float _801 = in.m_74.z;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _803;
    float _807 = fma(_329, _765, _329);
    float _809 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[196].z, _777);
    float _811 = fma(_795, _285, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _813 = fma(_805, _285, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _815 = fma(_415, _723, _775);
    float _817 = fma(_375, _723, _767);
    float _819 = fma(_807, _707, _809);
    float _821 = _781 * 6.283185482025146484375;
    float _823 = sin(_821);
    float _825 = fma(_811, _635, _815);
    float _827 = fma(_813, _635, _817);
    float _829 = _819 * 0.15915493667125701904296875;
    float _831 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _833 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[146].x, _825);
    float _835 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[146].y, _827);
    bool _837 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _839 = isnan(0.5);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _845 = _841 || _843;
    float _847 = _781 * 6.283185482025146484375;
    float _849 = cos(_847);
    float _851 = _833 * _771;
    float _853 = _835 * _773;
    float _855 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _857 = _853 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _859 = _785 * _799;
    float _861 = _791 * 6.283185482025146484375;
    float _863 = sin(_861);
    float _865 = _851 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _867 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _869 = fma(_783, _797, _859);
    float _871 = _865 * _855;
    float _873 = _857 * _867;
    float _875 = in.m_76.x;
    float _877 = in.m_76.y;
    float _879 = in.m_76.z;
    float _881 = _791 * 6.283185482025146484375;
    float _883 = cos(_881);
    float _885 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _887 = fma(_787, _801, _869);
    float _889 = _887 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _891 = _829 * 6.283185482025146484375;
    float _893 = cos(_891);
    float _895 = _823 * _863;
    float _897 = _849 * _863;
    float _899 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _901 = _829 * 6.283185482025146484375;
    float _903 = sin(_901);
    float _905 = _849 * _883;
    float _907 = _823 * _883;
    float _909 = _785 * _877;
    float _911 = _849 * _893;
    float _913 = _883 * _893;
    float _915 = _823 * _893;
    float _917 = _863 * _893;
    float _919 = _911 * _873;
    float _921 = fma(_783, _875, _909);
    float _923 = _915 * _873;
    float _925 = fma(_903, _905, _895);
    float _927 = -_873;
    float _929 = _903 * _927;
    float _931 = -_907;
    float _933 = fma(_903, _897, _931);
    float _935 = -_897;
    float _937 = fma(_903, _907, _935);
    float _939 = fma(_925, _871, _919);
    float _941 = fma(_913, _871, _929);
    float _943 = fma(_903, _895, _905);
    float _945 = fma(_937, _871, _923);
    float _947 = fma(_933, _885, _939);
    float _949 = fma(_917, _885, _941);
    float _951 = fma(_787, _879, _921);
    float _953 = fma(_943, _885, _945);
    float _955 = _947 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _957 = _947 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _959 = _951 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _961 = _947 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].x, _955);
    float _965 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _957);
    float _967 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].x, _961);
    float _969 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _963);
    float _971 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _965);
    float _973 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _967);
    float _975 = _969 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _977 = _971 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _979 = _889 + _975;
    float _981 = _959 + _977;
    float _983 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _985 = _979 + _983;
    float _987 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _989 = _981 + _987;
    float _991 = _985 * _985;
    float _993 = fma(_989, _989, _991);
    float _995 = in.m_78.x;
    float _997 = in.m_78.y;
    float _999 = in.m_78.z;
    float _1001 = sqrt(_993);
    bool _1003 = _1001 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _1001 + _1005;
    float _1009 = _785 * _997;
    float _1011 = fma(_783, _995, _1009);
    float _1013 = _973 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1015 = _875;
    float _1017 = _995;
    float _1019 = _1013;
    float _1021 = _1007;
    float _1023 = _787;
    float _1025 = _981;
    float _1027 = _979;
    int _1029 = 2;
    if (_1003)
    {
        float _1031 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1015 = _1031;
    }
    float _1033 = _1015;
    float _1035 = fma(_787, _999, _1011);
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_1003)
    {
        float _1039 = rsqrt(_993);
        _1017 = _1039;
    }
    float _1041 = _1017;
    float _1043 = _1037 + _1013;
    float _1045 = _1037 + _831;
    float _1047 = _1043;
    if (_1003)
    {
        float _1049 = _1043 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1019 = _1049;
    }
    float _1051 = _1019;
    float _1053 = _1033;
    if (_1003)
    {
        float _1055 = _1007 * _1033;
        _1021 = _1055;
    }
    float _1057 = _1021;
    if (_1003)
    {
        float _1059 = _1057 * 0.15915493667125701904296875;
        _1053 = _1059;
    }
    float _1061 = _1053;
    float _1063 = _1057;
    if (_1003)
    {
        float _1065 = _1061 * 6.283185482025146484375;
        float _1067 = cos(_1065);
        _1063 = _1067;
    }
    float _1069 = _1063;
    float _1071 = _785;
    if (_1003)
    {
        float _1073 = _1061 * 6.283185482025146484375;
        float _1075 = sin(_1073);
        _1071 = _1075;
    }
    float _1077 = _1071;
    if (_1003)
    {
        float _1079 = _1069 + (-1.0);
        _1023 = _1079;
    }
    float _1081 = _1023;
    float _1083 = _1081;
    if (_1003)
    {
        float _1085 = _1081 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1083 = _1085;
    }
    float _1087 = _1083;
    float _1089 = _1077;
    if (_1003)
    {
        float _1091 = fma(_1077, _1051, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1089 = _1091;
    }
    float _1093 = _1089;
    float _1095 = _1093;
    if (_1003)
    {
        float _1097 = fma(_1043, _1069, _1087);
        _1047 = _1097;
    }
    float _1099 = _1047;
    float _1101 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1003)
    {
        float _1103 = _1041 * _1093;
        _1095 = _1103;
    }
    float _1105 = _1095;
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1109 = _1099 + _1107;
    float _1111 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1101);
    if (_1003)
    {
        float _1113 = fma(_989, _1105, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1025 = _1113;
    }
    float _1115 = _1025;
    if (_1003)
    {
        float _1117 = fma(_985, _1105, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1027 = _1117;
    }
    float _1119 = _1027;
    float _1121 = _1109 * _1109;
    float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1125 = _1115 + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1129 = _1119 + _1127;
    float _1131 = fma(_1125, _1125, _1121);
    float _1133 = fma(_1129, _1129, _1131);
    float _1135 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1111);
    float _1137 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1139 = rsqrt(_1133);
    float _1141 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1143 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1137);
    float _1145 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1143);
    float _1147 = 1.0 / _1141;
    float _1149 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1151 = _1149 + _1141;
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1155 = sqrt(_1133);
    float _1157 = _1125 * _1153;
    float _1159 = _1129 * _1153;
    float _1161 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1163 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1165 = _1157 * _1157;
    float _1167 = _1159 * _1159;
    float _1169 = _1151 * _1147;
    float _1171 = _1169 * 0.5;
    float _1173 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1161);
    float _1175 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1163);
    float _1177 = _1165 + _1167;
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1181 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1179);
    float _1183 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1173);
    float _1185 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1175);
    float _1187 = sqrt(_1177);
    float _1189 = _1183 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1191 = _1185 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1193 = 1.0 / _1181;
    bool _1195 = _1187 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1197 = trunc(_1189);
    int _1199 = int(_1197);
    float _1201 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1203 = _1187 + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1207 = _1193 * _1205;
    float _1209 = trunc(_1191);
    int _1211 = int(_1209);
    bool _1213 = _1207 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1215 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1217 = _1207 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1219 = !_1213;
    int _1221 = _1219 ? 0 : 1;
    float _1223 = _1061;
    float _1225 = _1203;
    int _1227 = as_type<int>(_1153);
    float _1229 = _1177;
    float _1231 = _1157;
    float _1233 = _1159;
    float _1235 = _1165;
    float _1237 = _1167;
    float _1239 = _1191;
    if (_1195)
    {
        float _1241 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1223 = _1241;
    }
    float _1243 = _1223;
    int _1245 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1247 = _1199 + _1245;
    int _1249 = _1247 + 1;
    float _1251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1253 = precise::max(0.0, _1251);
    float _1255 = floor(_1215);
    int _1257 = _1249;
    if (!_1213)
    {
        _1029 = 1;
    }
    int _1259 = _1029;
    int _1261 = _1259;
    if (!_1217)
    {
        _1261 = _1221;
    }
    int _1263 = _1261;
    float _1265 = -_1153;
    float _1267 = -_1253;
    float _1269 = fma(_1109, _1265, _1267);
    int _1271 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1273 = _1211 + _1271;
    int _1275 = _1273 + 1;
    int _1277 = _1263 << 6;
    float _1279 = _1269;
    if (_1195)
    {
        float _1281 = _1203 * _1243;
        _1225 = _1281;
    }
    float _1283 = _1225;
    bool _1285 = _1249 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1287 = 0.0;
    if (_1195)
    {
        float _1289 = rsqrt(_1177);
        _1287 = _1289;
    }
    float _1291 = _1287;
    int _1293 = _1277 + 48;
    uint _1296 = uint(int(uint(_1293) >> uint(2)));
    uint _1298 = uint(int(uint(int(_1296)) >> uint(2)));
    int _1300 = int(_1296) & 3;
    float _1302 = (*spvDescriptorSet0.vp_c15)._m0[int(_1298)][_1300];
    int _1304 = int(_1296) + 1;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    int _1308 = _1304 & 3;
    float _1310 = (*spvDescriptorSet0.vp_c15)._m0[int(_1306)][_1308];
    float _1312 = 0.0;
    float _1314 = _1291;
    if (_1195)
    {
        float _1316 = _1283 * 0.15915493667125701904296875;
        _1312 = _1316;
    }
    float _1318 = _1312;
    int _1320 = _1249 | _1275;
    float _1322 = -_1255;
    float _1324 = _1215 + _1322;
    bool _1326 = _1320 < 0;
    bool _1328 = _1326 || _1285;
    float _1330 = 0.0;
    float _1332 = _1318;
    float _1334 = _1255;
    if (_1195)
    {
        float _1336 = _1318 * 6.283185482025146484375;
        float _1338 = sin(_1336);
        _1330 = _1338;
    }
    float _1340 = _1330;
    int _1342 = _1277 + 64;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    uint _1346 = uint(int(uint(int(_1344)) >> uint(2)));
    int _1348 = int(_1344) & 3;
    float _1350 = (*spvDescriptorSet0.vp_c15)._m0[int(_1346)][_1348];
    int _1352 = int(_1344) + 1;
    uint _1354 = uint(int(uint(_1352) >> uint(2)));
    int _1356 = _1352 & 3;
    float _1358 = (*spvDescriptorSet0.vp_c15)._m0[int(_1354)][_1356];
    bool _1360 = _1275 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1362 = _1360 || _1328;
    float _1364 = 0.0;
    if (_1195)
    {
        float _1366 = _1318 * 6.283185482025146484375;
        float _1368 = cos(_1366);
        _1364 = _1368;
    }
    float _1370 = _1364;
    int _1372 = _1277 + 80;
    uint _1374 = uint(int(uint(_1372) >> uint(2)));
    uint _1376 = uint(int(uint(int(_1374)) >> uint(2)));
    int _1378 = int(_1374) & 3;
    float _1380 = (*spvDescriptorSet0.vp_c15)._m0[int(_1376)][_1378];
    int _1382 = int(_1374) + 1;
    uint _1384 = uint(int(uint(_1382) >> uint(2)));
    int _1386 = _1382 & 3;
    float _1388 = (*spvDescriptorSet0.vp_c15)._m0[int(_1384)][_1386];
    if (!_1362)
    {
        int _1390 = _1275 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1392 = _1390 + _1249;
        _1227 = _1392;
    }
    int _1394 = _1227;
    int _1396 = _1277 + 96;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    uint _1400 = uint(int(uint(int(_1398)) >> uint(2)));
    int _1402 = int(_1398) & 3;
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[int(_1400)][_1402];
    int _1406 = int(_1398) + 1;
    uint _1408 = uint(int(uint(_1406) >> uint(2)));
    int _1410 = _1406 & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    if (_1195)
    {
        float _1414 = _1269 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1332 = _1414;
    }
    float _1416 = _1332;
    float _1418 = floor(_899);
    float _1420 = _1416;
    if (!_1362)
    {
        int _1422 = _1394 << 2;
        _1257 = _1422;
    }
    int _1424 = _1257;
    int _1426 = _1424;
    if (_1195)
    {
        float _1428 = fma(_1340, _1416, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1420 = _1428;
    }
    float _1430 = _1420;
    if (_1195)
    {
        float _1432 = _1370 + (-1.0);
        _1334 = _1432;
    }
    float _1434 = _1334;
    int _1436 = _1277 + 72;
    uint _1438 = uint(int(uint(_1436) >> uint(2)));
    uint _1440 = uint(int(uint(int(_1438)) >> uint(2)));
    int _1442 = int(_1438) & 3;
    float _1444 = (*spvDescriptorSet0.vp_c15)._m0[int(_1440)][_1442];
    int _1446 = int(_1438) + 1;
    uint _1448 = uint(int(uint(_1446) >> uint(2)));
    int _1450 = _1446 & 3;
    float _1452 = (*spvDescriptorSet0.vp_c15)._m0[int(_1448)][_1450];
    if (_1195)
    {
        float _1454 = _1291 * _1430;
        _1314 = _1454;
    }
    float _1456 = _1314;
    if (!_1362)
    {
        int _1458 = 12 & _1424;
        _1426 = _1458;
    }
    int _1460 = _1426;
    if (_1195)
    {
        float _1462 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1229 = _1462;
    }
    float _1464 = _1229;
    float _1466 = as_type<float>(_1275);
    int _1468 = as_type<int>(_1464);
    if (!_1362)
    {
        float _1470 = floor(_1191);
        _1466 = _1470;
    }
    float _1472 = _1466;
    if (_1195)
    {
        float _1474 = _1157 * _1456;
        _1231 = _1474;
    }
    float _1476 = _1231;
    if (_1195)
    {
        float _1478 = _1159 * _1456;
        _1233 = _1478;
    }
    float _1480 = _1233;
    if (_1195)
    {
        float _1482 = fma(_1269, _1370, _1464);
        _1279 = _1482;
    }
    float _1484 = _1279;
    int _1486 = _1277 + 104;
    uint _1488 = uint(int(uint(_1486) >> uint(2)));
    uint _1490 = uint(int(uint(int(_1488)) >> uint(2)));
    int _1492 = int(_1488) & 3;
    float _1494 = (*spvDescriptorSet0.vp_c15)._m0[int(_1490)][_1492];
    int _1496 = int(_1488) + 1;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    int _1500 = _1496 & 3;
    float _1502 = (*spvDescriptorSet0.vp_c15)._m0[int(_1498)][_1500];
    if (_1195)
    {
        float _1504 = _1476 * _1476;
        _1235 = _1504;
    }
    float _1506 = _1235;
    if (_1195)
    {
        float _1508 = _1480 * _1480;
        _1237 = _1508;
    }
    float _1510 = _1237;
    if (!_1362)
    {
        uint _1512 = uint(int(uint(_1394) >> uint(2)));
        _1468 = int(_1512);
    }
    int _1514 = _1468;
    float _1516 = fma(_1484, _1484, _1506);
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1520 = _1518 != 0;
    int _1522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1524 = _1522 != 0;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1528 = _1526 != 0;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1532 = _1530 != 0;
    int _1534 = _1277 + 56;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    uint _1538 = uint(int(uint(int(_1536)) >> uint(2)));
    int _1540 = int(_1536) & 3;
    float _1542 = (*spvDescriptorSet0.vp_c15)._m0[int(_1538)][_1540];
    int _1544 = int(_1536) + 1;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    int _1548 = _1544 & 3;
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[int(_1546)][_1548];
    float _1552 = _1516 + _1510;
    int _1554 = _1514;
    float _1556 = _1552;
    if (!_1362)
    {
        int _1558 = _1514 << 4;
        int _1560 = _1558 + _1460;
        _1554 = _1560;
    }
    int _1562 = _1554;
    float _1564 = _1045 * _1310;
    float _1566 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1568 = rsqrt(_1552);
    if (!_1362)
    {
        float _1570 = -_1472;
        float _1572 = _1191 + _1570;
        _1239 = _1572;
    }
    float _1574 = _1239;
    float _1576 = fma(_959, _1302, _1564);
    int _1578 = _1277 + 88;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    uint _1582 = uint(int(uint(int(_1580)) >> uint(2)));
    int _1584 = int(_1580) & 3;
    float _1586 = (*spvDescriptorSet0.vp_c15)._m0[int(_1582)][_1584];
    int _1588 = int(_1580) + 1;
    uint _1590 = uint(int(uint(_1588) >> uint(2)));
    int _1592 = _1588 & 3;
    float _1594 = (*spvDescriptorSet0.vp_c15)._m0[int(_1590)][_1592];
    float _1596 = _1045 * _1358;
    float _1598 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1600 = !_1524;
    int _1602 = _1600 ? 0 : 1;
    float _1604 = fma(_959, _1350, _1596);
    float _1606 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1598);
    if (_845)
    {
        _1556 = 1.0;
    }
    float _1608 = _1556;
    float _1610 = _1350;
    float _1612 = _1608;
    if (!_1362)
    {
        int _1614 = _1562 + 400;
        uint _1616 = uint(int(uint(_1614) >> uint(2)));
        uint _1618 = uint(int(uint(int(_1616)) >> uint(2)));
        int _1620 = int(_1616) & 3;
        float _1622 = (*spvDescriptorSet0.vp_c15)._m0[int(_1618)][_1620];
        _1610 = _1622;
    }
    float _1624 = _1610;
    float _1626 = _1045 * _1388;
    float _1628 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1606);
    float _1630 = -_1418;
    float _1632 = _899 + _1630;
    bool _1634 = !_1520;
    int _1636 = _1634 ? 0 : 1;
    float _1638 = _1568 * _1476;
    float _1640 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1642 = fma(_959, _1380, _1626);
    float _1644 = _1045 * _1412;
    float _1646 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1648 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1650 = _1568 * _1480;
    float _1652 = fma(_959, _1404, _1644);
    bool _1654 = !_1528;
    int _1656 = _1654 ? 0 : 1;
    bool _1658 = !_1532;
    int _1660 = _1658 ? 0 : 1;
    float _1662 = fma(_889, _1444, _1604);
    float _1664 = _1568 * _1484;
    float _1666 = _1662 + _1452;
    float _1668 = -_1646;
    float _1670 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1668);
    float _1672 = -_1648;
    float _1674 = fma(_1672, _1566, 1.0);
    float _1676 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1678 = fma(_889, _1494, _1652);
    float _1680 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1682 = -_1650;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1670);
    float _1686 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1676);
    float _1688 = _1678 + _1502;
    float _1690 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1680);
    float _1692 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1694 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1686);
    float _1696 = fma(_889, _1542, _1576);
    float _1698 = 1.0 / _1688;
    float _1700 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1690);
    float _1702 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1704 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1692);
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1708 = fma(_1155, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1706);
    float _1710 = precise::clamp(_1708, 0.0, 1.0);
    float _1712 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1714 = fma(_889, _1586, _1642);
    float _1716 = _1696 + _1550;
    float _1718 = -_1710;
    float _1720 = _1718 + 1.0;
    float _1722 = _1642;
    float _1724 = _1594;
    float _1726 = _1714;
    float _1728 = _1664;
    if (!_1362)
    {
        float _1730 = floor(_1189);
        _1722 = _1730;
    }
    float _1732 = _1722;
    float _1734 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1736 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1704);
    float _1738 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1734);
    float _1740 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1742 = _1716 * _1698;
    float _1744 = log2(_1674);
    float _1746 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1738);
    bool _1748 = _1742 >= 0.0;
    float _1750 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1746);
    float _1752 = abs(_1720);
    float _1754 = log2(_1752);
    if (!_845)
    {
        float _1756 = as_type<float>(in.m_82.w);
        int _1758 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1760 = _1758 == 4;
        bool _1762 = _1758 == 8;
        bool _1764 = _1758 == 12;
        int _1766 = as_type<int>(_1756) << 16;
        int _1768 = as_type<int>(_1756) << 8;
        int _1770 = as_type<int>(_1756) << 24;
        int _1772 = _1766 >> 24;
        int _1774 = _1768 >> 24;
        int _1776 = as_type<int>(_1756) >> 24;
        int _1778 = _1770 >> 24;
        float _1780 = float(_1772);
        float _1782 = float(_1774);
        float _1784 = float(_1776);
        float _1786 = _1780 * 0.0078740157186985015869140625;
        float _1788 = float(_1778);
        float _1790 = _1782 * 0.0078740157186985015869140625;
        float _1792 = _1784 * 0.0078740157186985015869140625;
        float _1794 = precise::min(_1786, 1.0);
        float _1796 = _1788 * 0.0078740157186985015869140625;
        float _1798 = precise::min(_1790, 1.0);
        float _1800 = precise::min(_1792, 1.0);
        float _1802 = precise::min(_1796, 1.0);
        float _1804 = precise::max(_1794, -1.0);
        float _1806 = precise::max(_1798, -1.0);
        float _1808 = precise::max(_1800, -1.0);
        float _1810 = precise::max(_1802, -1.0);
        float _1812 = _1810;
        if (_1760)
        {
            _1812 = _1804;
        }
        float _1814 = _1812;
        float _1816 = _1814;
        if (_1762)
        {
            _1816 = _1806;
        }
        float _1818 = _1816;
        float _1820 = _1818;
        if (_1764)
        {
            _1820 = _1808;
        }
        float _1822 = _1820;
        float _1824 = abs(_1822);
        float _1826 = (-0.0) + _1824;
        _1612 = _1826;
    }
    float _1828 = _1612;
    float _1830 = _1666 * _1698;
    bool _1832 = _1742 <= 1.0;
    bool _1834 = _1832 && _1748;
    float _1836 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1838 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1840 = _1828 != 0.0;
    bool _1842 = isnan(_1828);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan(0.0);
    bool _1848 = _1844 || _1846;
    float _1850 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1852 = _1830 >= 0.0;
    bool _1854 = _1852 && _1834;
    float _1856 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1836);
    float _1858 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1838);
    float _1860 = fma(_1684, -0.5, 0.5);
    bool _1862 = _1830 <= 1.0;
    bool _1864 = _1862 && _1854;
    float _1866 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1856);
    float _1868 = 1.0 / _1750;
    float _1870 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1858);
    float _1872 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1866);
    float _1874 = fma(_1684, 0.5, 0.5);
    float _1876 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1870);
    float _1878 = _1714 + _1594;
    float _1880 = _1744 * 0.693147182464599609375;
    float _1882 = sqrt(_1860);
    float _1884 = fma(_1874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1886 = _1860;
    float _1888 = _1830;
    float _1890 = _1876;
    float _1892 = _1872;
    if (_1848)
    {
        _1724 = _1872;
    }
    float _1894 = _1724;
    float _1896 = _1878 * _1698;
    float _1898 = _1894;
    if (_1848)
    {
        _1726 = _1876;
    }
    float _1900 = _1726;
    float _1902 = _1900;
    if (!_1848)
    {
        _1898 = 0.0;
        _1902 = 0.0;
    }
    float _1904 = _1898;
    float _1906 = _1902;
    float _1908 = fma(_1874, _1884, -0.212114393711090087890625);
    float _1910 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1912 = exp2(_1850);
    if (_1864)
    {
        float _1914 = float(_1263);
        _1886 = _1914;
    }
    float _1916 = _1886;
    float _1918 = _1664 + 1.0;
    float _1920 = fma(_1874, _1908, 1.570728778839111328125);
    float _1922 = _1868 * _1904;
    float _1924 = _1868 * _1906;
    float _1926 = fma(_1115, 6.2500002968590706586837768554688e-05, 0.5);
    float _1928 = fma(_1119, 6.2500002968590706586837768554688e-05, 0.5);
    float _1930 = _1916;
    if (_1864)
    {
        float _1932 = rint(_1916);
        float _1934 = precise::max(_1932, 0.0);
        uint _1936 = uint(_1934);
        uint _1938 = clamp(_1936, 0u, 65535u);
        _1930 = as_type<float>(_1938);
    }
    float _1940 = _1930;
    float _1942 = _1882 * 0.636619746685028076171875;
    float _1944 = fma(_1922, 0.5, 0.5);
    float _1946 = -_1920;
    float _1948 = fma(_1942, _1946, 1.0);
    float _1950 = _1624;
    if (!_1362)
    {
        float _1952 = rint(_1624);
        float _1954 = precise::max(_1952, 0.0);
        uint _1956 = uint(_1954);
        uint _1958 = clamp(_1956, 0u, 65535u);
        _1950 = as_type<float>(_1958);
    }
    float _1960 = _1950;
    float _1962 = -_1664;
    float _1964 = fma(_1912, _1918, _1962);
    if (!_1362)
    {
        float _1966 = -_1732;
        float _1968 = _1189 + _1966;
        _1728 = _1968;
    }
    float _1970 = _1728;
    float _1972 = fma(_1924, -0.5, 0.5);
    float2 _7021 = float2(_1926, _1928);
    float3 _1976 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_7021, float2(0.0), isnan(_7021)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_7021, float2(0.0), isnan(_7021)), level(0.0)).xyz;
    float _1978 = _1976.x;
    float _1980 = _1976.y;
    float _1982 = _1976.z;
    float _1984 = fma(_1964, 0.5, 0.5);
    if (_1864)
    {
        float3 _7044 = float3(_1742, _1830, float(as_type<int>(_1940)));
        float3 _7048 = select(_7044, float3(0.0), isnan(_7044));
        float _1986 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7048.xy, uint(rint(_7048.z)), _1896, level(0.0));
        _1888 = _1986;
    }
    float _1988 = _1888;
    float2 _7057 = float2(_1324, _1632);
    float _1990 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7057, float2(0.0), isnan(_7057)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7057, float2(0.0), isnan(_7057)), level(0.0)).x;
    float3 _7066 = float3(_1944, _1972, _1910);
    float _1992 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7066, float3(0.0), isnan(_7066)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7066, float3(0.0), isnan(_7066)), level(0.0)).x;
    float3 _7075 = float3(_1944, _1972, _1910);
    float4 _1995 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7075, float3(0.0), isnan(_7075)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7075, float3(0.0), isnan(_7075)), level(0.0)).xyzw;
    float _1997 = _1995.x;
    float _1999 = _1995.y;
    float _2001 = _1995.z;
    float _2003 = _1995.w;
    float2 _7091 = float2(_1948, _1984);
    float3 _2005 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7091, float2(0.0), isnan(_7091)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7091, float2(0.0), isnan(_7091)), level(0.0)).xyz;
    float _2007 = _2005.x;
    float _2009 = _2005.y;
    float _2011 = _2005.z;
    float _2013 = _1574;
    if (!_1362)
    {
        float3 _7112 = float3(_1970, _1574, float(as_type<int>(_1960)));
        float3 _7114 = select(_7112, float3(0.0), isnan(_7112));
        float _2015 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7114.xy, uint(rint(_7114.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7114.xy, uint(rint(_7114.z)), level(0.0)).x;
        _2013 = _2015;
    }
    float _2017 = _2013;
    float _2019 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2021 = int(_2019);
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2025 = _2023 != 0;
    float _2027 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2029 = abs(_513);
    float _2031 = -_695;
    float _2033 = _2031 + 1.0;
    int _2035 = abs(_1602);
    float _2037 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2027);
    int _2039 = abs(_1656);
    float _2041 = trunc(_685);
    int _2043 = int(_2041);
    int _2045 = abs(_1660);
    float _2047 = -_505;
    float _2049 = _2047 + 1.0;
    float _2051 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2053 = float(uint(_2021));
    float _2055 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2057 = int(_2055);
    int _2059 = ~_2021;
    int _2061 = _2059 + 1;
    float _2063 = float(uint(_2043));
    float _2065 = 1.0 / _2053;
    int _2067 = ~_2021;
    int _2069 = _2067 + 1;
    int _2071 = _2021 + (-1);
    float _2073 = float(uint(_2057));
    float _2075 = trunc(_691);
    int _2077 = int(_2075);
    int _2079 = ~_2057;
    int _2081 = _2079 + 1;
    int _2083 = as_type<int>(_2065) + (-2);
    float _2085 = 1.0 / _2073;
    float _2087 = as_type<float>(_2083) * _2063;
    float _2089 = exp2(_2051);
    float _2091 = trunc(_2087);
    float _2093 = precise::max(_2091, 0.0);
    uint _2095 = uint(_2093);
    int _2097 = _2069 * int(_2095);
    int _2099 = _2097 + _2043;
    float _2101 = float(uint(_2099));
    int _2103 = as_type<int>(_2085) + (-2);
    float _2105 = _2085;
    float _2107 = _2101;
    if (_2025)
    {
        float _2109 = in.m_68.x;
        _2105 = _2109;
    }
    float _2111 = _2105;
    float _2113 = as_type<float>(_2083) * _2101;
    if (_2025)
    {
        _2107 = 1.0;
    }
    float _2115 = _2107;
    float _2117 = _2115;
    if (!_2025)
    {
        _2117 = 7.345489978790283203125;
    }
    float _2119 = _2117;
    float _2121 = _2111;
    if (!_2025)
    {
        float _2123 = in.m_68.y;
        _2121 = _2123;
    }
    float _2125 = _2121;
    float _2127 = trunc(_2113);
    float _2129 = precise::max(_2127, 0.0);
    uint _2131 = uint(_2129);
    float _2133 = _2119 * _231;
    float _2135 = float(uint(_2077));
    float _2137 = as_type<float>(_2103) * _2135;
    float _2139 = floor(_2133);
    int _2141 = int(_2095) + int(_2131);
    float _2143 = trunc(_2137);
    float _2145 = precise::max(_2143, 0.0);
    uint _2147 = uint(_2145);
    float _2149 = float(_2021);
    float _2151 = float(_2043);
    int _2153 = _2061 * _2141;
    int _2155 = _2153 + _2043;
    bool _2157 = _2151 >= _2149;
    bool _2159 = isnan(_2151);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan(_2149);
    bool _2165 = _2161 || _2163;
    float _2167 = float(_2165);
    float _2169 = -_2139;
    float _2171 = _2133 + _2169;
    bool _2173 = uint(_2155) >= uint(_2021);
    float _2175 = _2171 * _2149;
    float _2177 = trunc(_2167);
    int _2179 = int(_2177);
    bool _2181 = !_2173;
    int _2183 = _2181 ? 0 : (-1);
    int _2185 = _2081 * int(_2147);
    int _2187 = _2185 + _2077;
    bool _2189 = _2021 == 0;
    int _2191 = ~_2141;
    int _2193 = _2191 + _2183;
    int _2195 = _2193 + 1;
    float _2197 = float(uint(_2187));
    float _2199 = trunc(_2175);
    int _2201 = int(_2199);
    int _2203 = _2021 * _2195;
    int _2205 = _2203 + _2043;
    float _2207 = as_type<float>(_2103) * _2197;
    float _2209 = _2149 * _459;
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2213 = _2211 != 0;
    int _2215 = ~_2179;
    int _2217 = _2215 + 1;
    int _2219 = _2217 + 1;
    float _2221 = trunc(_2209);
    int _2223 = int(_2221);
    bool _2225 = !_2189;
    float _2227 = _2225 ? as_type<float>(_2205) : as_type<float>(0xffffffffu /* nan */);
    bool _2229 = !_2213;
    int _2231 = _2229 ? 0 : 1;
    int _2233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2235 = _2233 != 0;
    int _2237 = as_type<int>(_2227) * _2219;
    float _2239 = _2227;
    if (_2025)
    {
        _2239 = 1.0;
    }
    float _2241 = _2239;
    float _2243 = trunc(_2207);
    float _2245 = precise::max(_2243, 0.0);
    uint _2247 = uint(_2245);
    float _2249 = _2241;
    if (!_2025)
    {
        _2249 = 1.2345600128173828125;
    }
    float _2251 = _2249;
    int _2253 = _2179 * _2071;
    int _2255 = _2253 + _2237;
    int _2257 = abs(_517);
    int _2259 = abs(_2231);
    float _2261 = _2251 * _2125;
    bool _2263 = !_2235;
    int _2265 = _2263 ? 0 : 1;
    int _2267 = _2255 * _2029;
    int _2269 = abs(_521);
    float _2271 = floor(_2261);
    int _2273 = _2201 * _2259;
    int _2275 = _2273 + _2043;
    int _2277 = ~_2057;
    int _2279 = _2277 + 1;
    int _2281 = abs(_2265);
    int _2283 = _2223 * _2257;
    int _2285 = _2283 + _2267;
    int _2287 = int(_2147) + int(_2247);
    float _2289 = float(_2057);
    int _2291 = _2279 * _2287;
    int _2293 = _2291 + _2077;
    float _2295 = float(_2077);
    float _2297 = -_2271;
    float _2299 = _2261 + _2297;
    bool _2301 = _2295 >= _2289;
    bool _2303 = isnan(_2295);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(_2289);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    int _2313 = _2275 * _2269;
    int _2315 = _2313 + _2285;
    bool _2317 = uint(_2293) >= uint(_2057);
    int _2319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2321 = _2319 != 0;
    int _2323 = _2201 * _2281;
    int _2325 = _2323 + _2315;
    float _2327 = trunc(_2311);
    int _2329 = int(_2327);
    bool _2331 = !_2317;
    int _2333 = _2331 ? 0 : (-1);
    float _2335 = _2299 * _2289;
    bool _2337 = _2057 == 0;
    float _2339 = _2289 * _459;
    float _2341 = float(uint(_2325));
    int _2343 = ~_2287;
    int _2345 = _2343 + _2333;
    int _2347 = _2345 + 1;
    float _2349 = trunc(_2335);
    int _2351 = int(_2349);
    bool _2353 = !_2321;
    int _2355 = _2353 ? 0 : 1;
    float _2357 = as_type<float>(_2083) * _2341;
    int _2359 = _2057 + (-1);
    int _2361 = _2057 * _2347;
    int _2363 = _2361 + _2077;
    int _2365 = abs(_2355);
    int _2367 = ~_2057;
    int _2369 = _2367 + 1;
    float _2371 = trunc(_2357);
    float _2373 = precise::max(_2371, 0.0);
    uint _2375 = uint(_2373);
    int _2377 = ~_2329;
    int _2379 = _2377 + 1;
    int _2381 = _2379 + 1;
    bool _2383 = !_2337;
    int _2385 = _2383 ? _2363 : (-1);
    int _2387 = _2385 * _2381;
    float _2389 = trunc(_2339);
    int _2391 = int(_2389);
    int _2393 = ~_2021;
    int _2395 = _2393 + 1;
    int _2397 = _2329 * _2359;
    int _2399 = _2397 + _2387;
    int _2401 = abs(_1636);
    int _2403 = _2399 * _2035;
    int _2405 = ~_2021;
    int _2407 = _2405 + 1;
    int _2409 = _2395 * int(_2375);
    int _2411 = _2409 + _2325;
    int _2413 = ~_2021;
    int _2415 = _2413 + 1;
    int _2417 = _2351 * _2365;
    int _2419 = _2417 + _2077;
    float _2421 = float(uint(_2411));
    int _2423 = _2391 * _2401;
    int _2425 = _2423 + _2403;
    float _2427 = as_type<float>(_2083) * _2421;
    int _2429 = _2419 * _2039;
    int _2431 = _2429 + _2425;
    float _2433 = float(uint(_2275));
    float _2435 = trunc(_2427);
    float _2437 = precise::max(_2435, 0.0);
    uint _2439 = uint(_2437);
    int _2441 = _2351 * _2045;
    int _2443 = _2441 + _2431;
    float _2445 = as_type<float>(_2083) * _2433;
    float _2447 = float(uint(_2443));
    float _2449 = float(uint(_2419));
    float _2451 = as_type<float>(_2103) * _2447;
    float _2453 = as_type<float>(_2103) * _2449;
    int _2455 = int(_2375) + int(_2439);
    float _2457 = trunc(_2451);
    float _2459 = precise::max(_2457, 0.0);
    uint _2461 = uint(_2459);
    int _2463 = ~_2057;
    int _2465 = _2463 + 1;
    int _2467 = _2415 * _2455;
    int _2469 = _2467 + _2325;
    float _2471 = trunc(_2445);
    float _2473 = precise::max(_2471, 0.0);
    uint _2475 = uint(_2473);
    bool _2477 = uint(_2469) >= uint(_2021);
    bool _2479 = !_2477;
    int _2481 = _2479 ? 0 : (-1);
    int _2483 = _2465 * int(_2461);
    int _2485 = _2483 + _2443;
    float _2487 = trunc(_2453);
    float _2489 = precise::max(_2487, 0.0);
    uint _2491 = uint(_2489);
    bool _2493 = _237 > 0.5;
    int _2495 = ~_2455;
    int _2497 = _2495 + _2481;
    int _2499 = _2497 + 1;
    float _2501 = float(uint(_2485));
    int _2503 = _2407 * int(_2475);
    int _2505 = _2503 + _2275;
    float _2507 = -_199;
    int _2509 = _2493 ? as_type<int>(_2507) : as_type<int>(_199);
    int _2511 = _2021 * _2499;
    int _2513 = _2511 + _2325;
    float _2515 = as_type<float>(_2103) * _2501;
    int _2517 = ~_2057;
    int _2519 = _2517 + 1;
    float _2521 = float(uint(_2505));
    float _2523 = trunc(_2515);
    float _2525 = precise::max(_2523, 0.0);
    uint _2527 = uint(_2525);
    bool _2529 = !_2189;
    int _2531 = _2529 ? _2513 : (-1);
    int _2533 = _2519 * int(_2491);
    int _2535 = _2533 + _2419;
    int _2537 = ~_2057;
    int _2539 = _2537 + 1;
    float _2541 = as_type<float>(_2083) * _2521;
    int _2543 = _2531 & 3;
    bool _2545 = _2543 != 0;
    int _2547 = _2531 & 3;
    bool _2549 = _2547 != 0;
    float _2551 = trunc(_2541);
    float _2553 = precise::max(_2551, 0.0);
    uint _2555 = uint(_2553);
    int _2557 = _2545 ? 0 : 1;
    out.m_84.x = _1978;
    out.m_84.y = _1980;
    out.m_84.z = _1982;
    bool _2559 = uint(_2547) > 1u;
    float _2561 = float(uint(_2535));
    int _2563 = ~_2557;
    int _2565 = _2563 + 1;
    int _2567 = _2565 + 1;
    float _2569 = -_1990;
    float _2571 = _2569 + 1.0;
    int _2573 = int(_2461) + int(_2527);
    float _2575 = as_type<float>(_2103) * _2561;
    bool _2577 = !_2549;
    int _2579 = _2577 ? 0 : 1;
    int _2581 = _2539 * _2573;
    int _2583 = _2581 + _2443;
    float _2585 = trunc(_2575);
    float _2587 = precise::max(_2585, 0.0);
    uint _2589 = uint(_2587);
    int _2591 = _2567;
    float _2593 = _1978;
    float _2595 = _1982;
    if (!_2559)
    {
        int _2597 = ~_2557;
        int _2599 = _2597 + 1;
        _2591 = _2599;
    }
    int _2601 = _2591;
    bool _2603 = uint(_2547) >= 2u;
    int _2605 = ~_2021;
    int _2607 = _2605 + 1;
    int _2609 = _2603 ? 0 : 1;
    bool _2611 = uint(_2583) >= uint(_2057);
    int _2613 = int(_2475) + int(_2555);
    bool _2615 = !_2611;
    int _2617 = _2615 ? 0 : (-1);
    int _2619 = abs(_2579);
    int _2621 = _2607 * _2613;
    int _2623 = _2621 + _2275;
    int _2625 = ~_2573;
    int _2627 = _2625 + _2617;
    int _2629 = _2627 + 1;
    int _2631 = int(_2491) + int(_2589);
    bool _2633 = uint(_2623) >= uint(_2021);
    int _2635 = _2057 * _2629;
    int _2637 = _2635 + _2443;
    int _2639 = _2531 >> 31;
    int _2641 = _2369 * _2631;
    int _2643 = _2641 + _2419;
    bool _2645 = !_2633;
    int _2647 = _2645 ? 0 : (-1);
    int _2649 = _2639 & 3;
    bool _2651 = !_2337;
    int _2653 = _2651 ? _2637 : (-1);
    int _2655 = _2531 + _2649;
    int _2657 = _2653 >> 31;
    bool _2659 = _2547 != 3;
    int _2661 = ~_2613;
    int _2663 = _2661 + _2647;
    int _2665 = _2663 + 1;
    int _2667 = _2657 & 3;
    int _2669 = _2655 >> 2;
    int _2671 = _2021 * _2665;
    int _2673 = _2671 + _2275;
    int _2675 = _2653 + _2667;
    int _2677 = ~_2609;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    int _2683 = _2675 >> 2;
    bool _2685 = !_2189;
    int _2687 = _2685 ? _2673 : (-1);
    int _2689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2691 = _2689 != 0;
    int _2693 = _2669 << 4;
    int _2695 = _2693 + 368;
    int _2697 = _2681;
    if (_2659)
    {
        int _2699 = ~_2609;
        int _2701 = _2699 + 1;
        _2697 = _2701;
    }
    int _2703 = _2697;
    int _2705 = _2683 << 4;
    int _2707 = _2705 + 512;
    uint _2709 = uint(int(uint(_2695) >> uint(2)));
    uint _2711 = uint(int(uint(int(_2709)) >> uint(2)));
    int _2713 = int(_2709) & 3;
    float _2715 = (*spvDescriptorSet0.vp_c9)._m0[int(_2711)][_2713];
    int _2717 = int(_2709) + 1;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    int _2721 = _2717 & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    int _2725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2727 = _2725 != 0;
    bool _2729 = !_2691;
    float _2731 = _2729 ? _199 : as_type<float>(_2509);
    int _2733 = _2653 & 3;
    bool _2735 = _2733 != 0;
    int _2737 = _2653 & 3;
    bool _2739 = _2737 != 0;
    int _2741 = _2707 + 8;
    uint _2743 = uint(int(uint(_2741) >> uint(2)));
    uint _2745 = uint(int(uint(int(_2743)) >> uint(2)));
    int _2747 = int(_2743) & 3;
    float _2749 = (*spvDescriptorSet0.vp_c9)._m0[int(_2745)][_2747];
    int _2751 = int(_2743) + 1;
    uint _2753 = uint(int(uint(_2751) >> uint(2)));
    int _2755 = _2751 & 3;
    float _2757 = (*spvDescriptorSet0.vp_c9)._m0[int(_2753)][_2755];
    bool _2759 = !_2727;
    int _2761 = _2759 ? 0 : 1;
    int _2763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2765 = _2763 != 0;
    int _2767 = _2735 ? 0 : 1;
    bool _2769 = !_2765;
    int _2771 = _2769 ? 0 : 1;
    uint _2773 = uint(int(uint(_2707) >> uint(2)));
    uint _2775 = uint(int(uint(int(_2773)) >> uint(2)));
    int _2777 = int(_2773) & 3;
    float _2779 = (*spvDescriptorSet0.vp_c9)._m0[int(_2775)][_2777];
    int _2781 = int(_2773) + 1;
    uint _2783 = uint(int(uint(_2781) >> uint(2)));
    int _2785 = _2781 & 3;
    float _2787 = (*spvDescriptorSet0.vp_c9)._m0[int(_2783)][_2785];
    bool _2789 = uint(_2737) > 1u;
    bool _2791 = _2547 != 3;
    bool _2793 = !_2739;
    int _2795 = _2793 ? 0 : 1;
    int _2797 = ~_2767;
    int _2799 = _2797 + 1;
    int _2801 = _2799 + 1;
    int _2803 = _2695 + 8;
    uint _2805 = uint(int(uint(_2803) >> uint(2)));
    uint _2807 = uint(int(uint(int(_2805)) >> uint(2)));
    int _2809 = int(_2805) & 3;
    float _2811 = (*spvDescriptorSet0.vp_c9)._m0[int(_2807)][_2809];
    int _2813 = int(_2805) + 1;
    uint _2815 = uint(int(uint(_2813) >> uint(2)));
    int _2817 = _2813 & 3;
    float _2819 = (*spvDescriptorSet0.vp_c9)._m0[int(_2815)][_2817];
    bool _2821 = uint(_2643) >= uint(_2057);
    float _2823 = _911 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2825 = abs(_2703);
    bool _2827 = !_2821;
    int _2829 = _2827 ? 0 : (-1);
    int _2831 = _2801;
    if (!_2789)
    {
        int _2833 = ~_2767;
        int _2835 = _2833 + 1;
        _2831 = _2835;
    }
    int _2837 = _2831;
    bool _2839 = !_2791;
    int _2841 = _2839 ? 0 : (-1);
    bool _2843 = uint(_2737) >= 2u;
    bool _2845 = _2737 != 3;
    int _2847 = _2843 ? 0 : 1;
    bool _2849 = _2737 != 3;
    int _2851 = ~_2631;
    int _2853 = _2851 + _2829;
    int _2855 = _2853 + 1;
    bool _2857 = !_2849;
    int _2859 = _2857 ? 0 : (-1);
    int _2861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2863 = _2861 != 0;
    int _2865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2867 = _2865 != 0;
    int _2869 = _2057 * _2855;
    int _2871 = _2869 + _2419;
    int _2873 = abs(_2601);
    int _2875 = ~_2847;
    int _2877 = _2875 + 1;
    int _2879 = _2877 + 1;
    int _2881 = _2879;
    if (_2845)
    {
        int _2883 = ~_2847;
        int _2885 = _2883 + 1;
        _2881 = _2885;
    }
    int _2887 = _2881;
    bool _2889 = _231 > 0.5;
    int _2891 = abs(_2837);
    bool _2893 = !_2337;
    int _2895 = _2893 ? _2871 : (-1);
    int _2897 = ~_2873;
    int _2899 = _2897 + 1;
    int _2901 = _2899 + 1;
    int _2903 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2905 = _2903 != 0;
    int _2907 = ~_2891;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    int _2913 = _2901 * as_type<int>(_2723);
    int _2915 = abs(_2795);
    int _2917 = _2911 * as_type<int>(_2787);
    int _2919 = ~_2619;
    int _2921 = _2919 + 1;
    int _2923 = _2921 + 1;
    int _2925 = ~_2915;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    float _2931 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2933 = int(_2931);
    int _2935 = abs(_2887);
    int _2937 = _2923 * as_type<int>(_2715);
    int _2939 = _2937 + _2913;
    int _2941 = _2929 * as_type<int>(_2779);
    int _2943 = _2941 + _2917;
    int _2945 = ~_2935;
    int _2947 = _2945 + 1;
    int _2949 = _2947 + 1;
    int _2951 = ~_2825;
    int _2953 = _2951 + 1;
    int _2955 = _2953 + 1;
    int _2957 = _2949 * as_type<int>(_2749);
    int _2959 = _2957 + _2943;
    int _2961 = _2955 * as_type<int>(_2811);
    int _2963 = _2961 + _2939;
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2967 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2969 = abs(_2859);
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2973 = -_195;
    int _2975 = _2889 ? as_type<int>(_2973) : as_type<int>(_195);
    float _2977 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2979 = int(_2977);
    bool _2981 = _233 > 0.5;
    float _2983 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2985 = ~_2969;
    int _2987 = _2985 + 1;
    int _2989 = _2987 + 1;
    float _2991 = _2965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2993 = float(uint(_2933));
    float _2995 = _2971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2997 = _2967 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2999 = abs(_2841);
    float _3001 = abs(_1207);
    float _3003 = log2(_3001);
    int _3005 = _2989 * as_type<int>(_2757);
    int _3007 = _3005 + _2959;
    int _3009 = abs(_2933);
    out.m_86.x = _2991;
    out.m_86.y = _2995;
    out.m_86.z = _2997;
    out.m_86.w = _2983;
    int _3011 = ~_2999;
    int _3013 = _3011 + 1;
    int _3015 = _3013 + 1;
    float _3017 = -_199;
    int _3019 = _2981 ? as_type<int>(_3017) : as_type<int>(_199);
    float _3021 = 1.0 / _2993;
    int _3023 = _3015 * as_type<int>(_2819);
    int _3025 = _3023 + _2963;
    int _3027 = abs(_2771);
    bool _3029 = _235 > 0.5;
    float _3031 = float(uint(_2979));
    float _3033 = _3003 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3035 = abs(_2761);
    float _3037 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3039 = ~_3035;
    int _3041 = _3039 + 1;
    int _3043 = _3041 + 1;
    float _3045 = 1.0 / _3031;
    float _3047 = _3037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3049 = _3025 * _3043;
    int _3051 = ~_3027;
    int _3053 = _3051 + 1;
    int _3055 = _3053 + 1;
    float _3057 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3059 = abs(_2979);
    int _3061 = _2687 * _3035;
    int _3063 = _3061 + _3049;
    float _3065 = float(uint(_3009));
    float _3067 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3069 = as_type<int>(_3021) + (-2);
    float _3071 = _911 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3073 = _3007 * _3055;
    float _3075 = float(uint(_3059));
    float _3077 = _911 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3079 = _3057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3081 = _3067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3083 = exp2(_3033);
    float _3085 = -_903;
    float _3087 = fma(_3085, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3071);
    float _3089 = float(uint(_3063));
    int _3091 = _2895 * _3027;
    int _3093 = _3091 + _3073;
    out.m_88.x = _3047;
    out.m_88.y = _3079;
    out.m_88.z = _3081;
    float _3095 = -_903;
    float _3097 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3077);
    float _3099 = -_903;
    float _3101 = fma(_3099, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2823);
    int _3103 = as_type<int>(_3045) + (-2);
    float _3105 = 1.0 / _3065;
    int _3107 = abs(_3063);
    float _3109 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3087);
    int _3111 = ~_2933;
    int _3113 = _3111 + 1;
    float _3115 = _925 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3117 = ~_2979;
    int _3119 = _3117 + 1;
    bool _3121 = !_2905;
    float _3123 = _3121 ? _195 : as_type<float>(_2975);
    float _3125 = 1.0 / _3075;
    float _3127 = as_type<float>(_3069) * _3089;
    float _3129 = float(uint(_3093));
    int _3131 = abs(_3093);
    float _3133 = fma(_3083, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3135 = precise::clamp(_3133, 0.0, 1.0);
    float _3137 = trunc(_3127);
    float _3139 = precise::max(_3137, 0.0);
    uint _3141 = uint(_3139);
    int _3143 = as_type<int>(_3105) + (-2);
    float _3145 = as_type<float>(_3103) * _3129;
    float _3147 = float(uint(_3107));
    float _3149 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3101);
    float _3151 = float(uint(_3131));
    float _3153 = _925 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3155 = _2933 == 0;
    float _3157 = trunc(_3145);
    float _3159 = precise::max(_3157, 0.0);
    uint _3161 = uint(_3159);
    int _3163 = as_type<int>(_3125) + (-2);
    float _3165 = as_type<float>(_3143) * _3147;
    float _3167 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3097);
    float _3169 = _925 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3171 = _1207 <= 8000.0;
    bool _3173 = isnan(_1207);
    bool _3175 = _3171 || _3173;
    bool _3177 = isnan(8000.0);
    bool _3179 = _3175 || _3177;
    float _3181 = float(_3179);
    float _3183 = as_type<float>(_3163) * _3151;
    float _3185 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3153);
    float _3187 = trunc(_3165);
    float _3189 = precise::max(_3187, 0.0);
    uint _3191 = uint(_3189);
    int _3193 = _3113 * int(_3141);
    int _3195 = _3193 + _3063;
    float _3197 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3169);
    float _3199 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3115);
    if (_1362)
    {
        _2593 = 1.0;
    }
    float _3201 = _2593;
    float _3203 = float(uint(_3195));
    float _3205 = _933 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3207 = trunc(_3183);
    float _3209 = precise::max(_3207, 0.0);
    uint _3211 = uint(_3209);
    int _3213 = _3119 * int(_3161);
    int _3215 = _3213 + _3093;
    float _3217 = as_type<float>(_3069) * _3203;
    float _3219 = _933 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3221 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3205);
    float _3223 = float(uint(_3215));
    float _3225 = _933 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3227 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3219);
    int _3229 = ~int(_3191);
    int _3231 = _3229 + 1;
    float _3233 = trunc(_3217);
    float _3235 = precise::max(_3233, 0.0);
    uint _3237 = uint(_3235);
    float _3239 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3225);
    float _3241 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3227);
    int _3243 = ~int(_3211);
    int _3245 = _3243 + 1;
    int _3247 = _3231 * _3009;
    int _3249 = _3247 + _3107;
    float _3251 = as_type<float>(_3103) * _3223;
    float _3253 = fma(_3135, -2.0, 3.0);
    float _3255 = _3135 * _3135;
    float _3257 = float(uint(_3249));
    int _3259 = _3245 * _3059;
    int _3261 = _3259 + _3131;
    float _3263 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3221);
    float _3265 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3239);
    float _3267 = trunc(_3251);
    float _3269 = precise::max(_3267, 0.0);
    uint _3271 = uint(_3269);
    float _3273 = as_type<float>(_3143) * _3257;
    float _3275 = float(uint(_3261));
    float _3277 = _3255 * _3253;
    int _3279 = int(_3141) + int(_3237);
    float _3281 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3197);
    float _3283 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3199);
    float _3285 = as_type<float>(_3163) * _3275;
    float _3287 = trunc(_3273);
    float _3289 = precise::max(_3287, 0.0);
    uint _3291 = uint(_3289);
    float _3293 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3185);
    int _3295 = ~_2933;
    int _3297 = _3295 + 1;
    float _3299 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3301 = !_2863;
    float _3303 = _3301 ? _199 : as_type<float>(_3019);
    float _3305 = -_195;
    int _3307 = _3029 ? as_type<int>(_3305) : as_type<int>(_195);
    int _3309 = _3297 * _3279;
    int _3311 = _3309 + _3063;
    float _3313 = trunc(_3285);
    float _3315 = precise::max(_3313, 0.0);
    uint _3317 = uint(_3315);
    float _3319 = _3299 * _3109;
    bool _3321 = !_2867;
    float _3323 = _3321 ? _195 : as_type<float>(_3307);
    float _3325 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3327 = uint(_3311) >= uint(_2933);
    out.m_90.x = _3293;
    out.m_90.y = _3281;
    out.m_90.z = _3283;
    int _3329 = ~_2979;
    int _3331 = _3329 + 1;
    float _3333 = fma(_3325, _3293, _3319);
    int _3335 = int(_3191) + int(_3291);
    float _3337 = _3299 * _3167;
    int _3339 = int(_3161) + int(_3271);
    float _3341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3343 = ~_3335;
    int _3345 = _3343 + 1;
    float _3347 = fma(_3325, _3281, _3337);
    int _3349 = int(_3211) + int(_3317);
    int _3351 = _3331 * _3339;
    int _3353 = _3351 + _3093;
    bool _3355 = !_3327;
    int _3357 = _3355 ? 0 : (-1);
    float _3359 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2037);
    int _3361 = ~_3349;
    int _3363 = _3361 + 1;
    int _3365 = ~_3279;
    int _3367 = _3365 + _3357;
    int _3369 = _3367 + 1;
    int _3371 = _3345 * _3009;
    int _3373 = _3371 + _3107;
    bool _3375 = uint(_3353) >= uint(_2979);
    float _3377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3379 = _3363 * _3059;
    int _3381 = _3379 + _3131;
    float _3383 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3359);
    int _3385 = _2933 * _3369;
    int _3387 = _3385 + _3063;
    bool _3389 = uint(_3373) >= uint(_3009);
    float _3391 = _3263 + _3347;
    bool _3393 = !_3375;
    int _3395 = _3393 ? 0 : (-1);
    out.gl_Position.x = _1872;
    out.gl_Position.y = _1876;
    out.gl_Position.z = _3383;
    out.gl_Position.w = _1750;
    bool _3397 = !_3155;
    int _3399 = _3397 ? _3387 : (-1);
    bool _3401 = uint(_3381) >= uint(_3059);
    float _3403 = _3341 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3405 = float(_3399);
    float _3407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3409 = _2933 == 0;
    int _3411 = _3063 ^ _2933;
    float _3413 = fma(_3403, _3405, _305);
    int _3415 = ~_3339;
    int _3417 = _3415 + _3395;
    int _3419 = _3417 + 1;
    bool _3421 = !_3401;
    int _3423 = _3421 ? 0 : (-1);
    int _3425 = _3093 ^ _2979;
    int _3427 = _2979 * _3419;
    int _3429 = _3427 + _3093;
    bool _3431 = !_3389;
    int _3433 = _3431 ? 0 : (-1);
    uint _3435 = uint(int(uint(_3411) >> uint(31)));
    int _3437 = ~_3423;
    int _3439 = _3349 + _3437;
    int _3441 = _3439 + 1;
    float _3443 = _3377 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3445 = _2979 == 0;
    float _3447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3449 = _2979 == 0;
    uint _3451 = uint(int(uint(_3425) >> uint(31)));
    float _3453 = fma(_3299, _3299, 1.0);
    int _3455 = ~_3433;
    int _3457 = _3335 + _3455;
    int _3459 = _3457 + 1;
    int _3461 = ~int(_3435);
    int _3463 = _3461 + 1;
    float _3465 = rsqrt(_3453);
    bool _3467 = !_3445;
    int _3469 = _3467 ? _3429 : (-1);
    int _3471 = ~int(_3451);
    int _3473 = _3471 + 1;
    int _3475 = _3459 ^ _3463;
    float _3477 = float(_3469);
    int _3479 = _3441 ^ _3473;
    float _3481 = _2731 + (-0.5);
    int _3483 = ~_3463;
    int _3485 = _3483 + _3475;
    int _3487 = _3485 + 1;
    float _3489 = _3123 + 0.5;
    float _3491 = fma(_3443, _3477, _699);
    int _3493 = ~_3473;
    int _3495 = _3493 + _3479;
    int _3497 = _3495 + 1;
    bool _3499 = !_3409;
    int _3501 = _3499 ? _3487 : (-1);
    float _3503 = fma(_3403, _3489, _3413);
    float _3505 = _3323 + 0.5;
    bool _3507 = !_3449;
    int _3509 = _3507 ? _3497 : (-1);
    float _3511 = _3407 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3513 = float(_3501);
    float _3515 = fma(_3443, _3505, _3491);
    float _3517 = float(_3509);
    float _3519 = _3447 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3521 = _3303 + (-0.5);
    float _3523 = -_311;
    float _3525 = fma(_3511, _3513, _3523);
    float _3527 = _3299 * _3465;
    float _3529 = -_701;
    float _3531 = fma(_3519, _3517, _3529);
    float _3533 = -_2049;
    float _3535 = fma(_3323, _3533, _3515);
    float _3537 = -_3511;
    float _3539 = fma(_3537, _3521, _3525);
    float _3541 = -_3263;
    float _3543 = _3527 * _3541;
    float _3545 = -_3519;
    float _3547 = fma(_3545, _3481, _3531);
    float _3549 = -_693;
    float _3551 = _3549 + 1.0;
    float _3553 = _3201;
    if (!_1848)
    {
        _703 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3555 = _703;
    float _3557 = fma(_3465, _3167, _3543);
    float _3559 = -_3241;
    float _3561 = _3527 * _3559;
    float _3563 = -_3265;
    float _3565 = _3527 * _3563;
    float _3567 = -_509;
    float _3569 = _3567 + 1.0;
    float _3571 = -_3551;
    float _3573 = fma(_3123, _3571, _3503);
    float _3575 = _3299 * _3149;
    float _3577 = fma(_3303, _2033, _3539);
    float _3579 = fma(_3465, _3109, _3561);
    float _3581 = fma(_3465, _3149, _3565);
    int _3583 = as_type<int>(_3555);
    if (!_1848)
    {
        float _3585 = _3555 * 5.0;
        _3583 = as_type<int>(_3585);
    }
    int _3587 = _3583;
    float _3589 = fma(_2731, _3569, _3547);
    float _3591 = -_3277;
    float _3593 = _3591 + 1.0;
    out.m_92.x = _3579;
    out.m_92.y = _3557;
    out.m_92.z = _3581;
    float _3595 = fma(_3325, _3283, _3575);
    if (!_1864)
    {
        _1890 = 1.0;
    }
    float _3597 = _1890;
    float _3599 = fma(_3593, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3277);
    float _3601 = _3597;
    if (!_1848)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9398 = as_type<float>(_3587);
        out.gl_Position.z = _9398;
    }
    float _3603 = _3241 + _3333;
    float _3605 = _3265 + _3595;
    float _3607 = _3181 * _3599;
    out.m_94.x = _3573;
    out.m_94.y = _3577;
    out.m_94.z = _3535;
    out.m_94.w = _3589;
    if (_1864)
    {
        bool _3609 = _1988 >= _1896;
        bool _3611 = isnan(_1988);
        bool _3613 = _3609 || _3611;
        bool _3615 = isnan(_1896);
        bool _3617 = _3613 || _3615;
        float _3619 = float(_3617);
        _3601 = _3619;
    }
    float _3621 = _3601;
    float _3623 = _3607 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3625 = _2571 * _3623;
    float _3627 = precise::clamp(_3625, 0.0, 1.0);
    float _3629 = _3623;
    float _3631 = _3621;
    if (!_1362)
    {
        int _3633 = _1394 << 4;
        int _3635 = _3633 + 2048;
        uint _3637 = uint(int(uint(_3635) >> uint(2)));
        uint _3639 = uint(int(uint(int(_3637)) >> uint(2)));
        int _3641 = int(_3637) & 3;
        float _3643 = (*spvDescriptorSet0.vp_c15)._m0[int(_3639)][_3641];
        int _3645 = int(_3637) + 1;
        uint _3647 = uint(int(uint(_3645) >> uint(2)));
        int _3649 = _3645 & 3;
        float _3651 = (*spvDescriptorSet0.vp_c15)._m0[int(_3647)][_3649];
        int _3653 = _3635 + 8;
        uint _3655 = uint(int(uint(_3653) >> uint(2)));
        uint _3657 = uint(int(uint(int(_3655)) >> uint(2)));
        int _3659 = int(_3655) & 3;
        float _3661 = (*spvDescriptorSet0.vp_c15)._m0[int(_3657)][_3659];
        int _3663 = int(_3655) + 1;
        uint _3665 = uint(int(uint(_3663) >> uint(2)));
        int _3667 = _3663 & 3;
        float _3669 = (*spvDescriptorSet0.vp_c15)._m0[int(_3665)][_3667];
        float _3671 = _1045 * _3651;
        float _3673 = fma(_959, _3643, _3671);
        float _3675 = fma(_889, _3661, _3673);
        float _3677 = _3675 + _3669;
        float _3679 = precise::clamp(_3677, 0.0, 1.0);
        float _3681 = -_3679;
        float _3683 = _3681 + _2017;
        float _3685 = fma(_3683, 500.0, 1.5);
        float _3687 = exp2(_3685);
        float _3689 = 0.0 + _3687;
        float _3691 = precise::clamp(_3689, 0.0, 1.0);
        _3553 = _3691;
        _3629 = _3669;
    }
    float _3693 = _3553;
    float _3695 = _3629;
    float _3697 = -_2089;
    float _3699 = _3697 + 1.0;
    float _3701 = _3621 * _3693;
    float _3703 = -_3627;
    float _3705 = fma(_3703, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_96.x = _3603;
    out.m_96.y = _3391;
    out.m_96.z = _3605;
    float _3707 = _3699 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3709 = _1155 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3711 = isnan(_1155);
    bool _3713 = _3709 || _3711;
    bool _3715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3717 = _3713 || _3715;
    float _3719 = -_3701;
    float _3721 = fma(_3719, _3705, 1.0);
    float _3723 = precise::clamp(_3721, 0.0, 1.0);
    float _3725 = _3707 * _1992;
    float _3727 = -_3707;
    float _3729 = _3727 + 1.0;
    float _3731 = _3723 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3733 = _1828 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3735 = _2003 * _3725;
    float _3737 = _2011 * _3725;
    float _3739 = _2003 * _3729;
    out.m_98.x = _3731;
    float _3741 = fma(_2007, _3735, _1997);
    float _3743 = fma(_2009, _3735, _1999);
    float _3745 = fma(_2003, _3737, _2001);
    float _3747 = _3733;
    float _3749 = _3695;
    float _3751 = _3735;
    float _3753 = _3731;
    if (!_1848)
    {
        _3747 = 0.0;
    }
    float _3755 = _3747;
    if (!_3717)
    {
        _3749 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3757 = _3749;
    out.m_100.x = _3741;
    out.m_100.y = _3743;
    out.m_100.z = _3745;
    out.m_100.w = _3739;
    float _3759 = _3757;
    float _3761 = _3757;
    if (!_3717)
    {
        _1892 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3763 = _1892;
    float _3765 = _3763;
    float _3767 = _3763;
    if (!_3717)
    {
        _3631 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3769 = _3631;
    float _3771 = _3769;
    float _3773 = _3769;
    if (!_3717)
    {
        _2595 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3775 = _2595;
    float _3777 = _3775;
    float _3779 = _3775;
    if (!_3717)
    {
        _3751 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3781 = _3751;
    float _3783 = _3781;
    float _3785 = _3781;
    if (!_3717)
    {
        _3753 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3787 = _3753;
    bool _3789 = !_3717;
    float _3791 = _3787;
    float _3793 = _3787;
    if (!_3789)
    {
        bool _3795 = _1155 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3797 = isnan(_1155);
        bool _3799 = _3795 || _3797;
        bool _3801 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3803 = _3799 || _3801;
        if (!_3803)
        {
            float _3805 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3807 = _1155 + _3805;
            float _3809 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3811 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3809;
            float _3813 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3815 = _3813 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3817 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3819 = _3817 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3821 = 1.0 / _3811;
            float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3825 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3827 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3829 = _3827 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3831 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3833 = _3831 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3835 = _3807 * _3821;
            float _3837 = precise::clamp(_3835, 0.0, 1.0);
            float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3841 = _3839 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3843 = fma(_3837, _3815, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3845 = fma(_3837, _3819, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3847 = fma(_3837, _3841, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3849 = fma(_3837, _3825, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3851 = fma(_3837, _3829, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3853 = fma(_3837, _3833, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3785 = _3843;
            _3767 = _3851;
            _3779 = _3845;
            _3761 = _3849;
            _3793 = _3847;
            _3773 = _3853;
            _3855 = true;
        }
        else
        {
            bool _3857 = _1155 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3859 = isnan(_1155);
            bool _3861 = _3857 || _3859;
            bool _3863 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3865 = _3861 || _3863;
            if (!_3865)
            {
                _3759 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3867 = _3759;
            _3761 = _3867;
            if (!_3865)
            {
                _3765 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3869 = _3765;
            _3767 = _3869;
            if (!_3865)
            {
                _3771 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3871 = _3771;
            _3773 = _3871;
            if (!_3865)
            {
                _3777 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3873 = _3777;
            _3779 = _3873;
            if (!_3865)
            {
                _3783 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3875 = _3783;
            _3785 = _3875;
            if (!_3865)
            {
                _3791 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3877 = _3791;
            bool _3879 = !_3865;
            _3793 = _3877;
            if (!_3879)
            {
                bool _3881 = _1155 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3883 = isnan(_1155);
                bool _3885 = _3881 || _3883;
                bool _3887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3889 = _3885 || _3887;
                if (!_3889)
                {
                    float _3891 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3893 = _1155 + _3891;
                    float _3895 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3897 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3895;
                    float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3901 = _3899 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3905 = _3903 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3907 = 1.0 / _3897;
                    float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3911 = _3909 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3919 = _3917 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3921 = _3893 * _3907;
                    float _3923 = precise::clamp(_3921, 0.0, 1.0);
                    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3929 = fma(_3923, _3901, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3931 = fma(_3923, _3905, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3933 = fma(_3923, _3927, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3935 = fma(_3923, _3911, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3937 = fma(_3923, _3915, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3939 = fma(_3923, _3919, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3785 = _3929;
                    _3767 = _3937;
                    _3779 = _3931;
                    _3761 = _3935;
                    _3793 = _3933;
                    _3773 = _3939;
                    _3855 = true;
                }
                else
                {
                    _3785 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3767 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3779 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3761 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3793 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3773 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3855 = false;
    float _3941 = _3785;
    float _3943 = _3767;
    float _3945 = _3779;
    float _3947 = _3761;
    float _3949 = _3793;
    float _3951 = _3773;
    float _3953 = fma(_3391, -0.5, 0.5);
    float _3955 = precise::clamp(_3953, 0.0, 1.0);
    float _3957 = -_3941;
    float _3959 = _3943 + _3957;
    float _3961 = -_3945;
    float _3963 = _3947 + _3961;
    float _3965 = -_3949;
    float _3967 = _3951 + _3965;
    bool _3969 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3971 = fma(_3955, _3959, _3941);
    float _3973 = fma(_3955, _3963, _3945);
    float _3975 = fma(_3955, _3967, _3949);
    float _3977 = _3755 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3979 = _3971 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _3981 = fma(_3973, 0.298911988735198974609375, _3979);
    out.m_98.w = _3977;
    float _3983 = fma(_3975, 0.114477999508380889892578125, _3981);
    out.m_102.x = 0.0;
    float _3985 = -_3983;
    float _3987 = _3973 + _3985;
    float _3989 = -_3983;
    float _3991 = _3971 + _3989;
    float _3993 = -_3983;
    float _3995 = _3975 + _3993;
    float _3997 = fma(_3987, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3983);
    float _3999 = fma(_3991, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3983);
    float _4001 = fma(_3995, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3983);
    out.m_104.x = _3997;
    out.m_104.y = _3999;
    out.m_104.z = _4001;
    if (!_3969)
    {
        return out;
    }
    float _4003 = -_1099;
    float _4005 = _4003 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4007 = -_1115;
    float _4009 = _4007 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4011 = -_1119;
    float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4015 = _4005 * _4005;
    float _4017 = fma(_4009, _4009, _4015);
    float _4019 = fma(_4013, _4013, _4017);
    float _4021 = sqrt(_4019);
    float _4023 = rsqrt(_4019);
    float _4025 = -_4021;
    float _4027 = _4025 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4029 = _4027 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4031 = precise::clamp(_4029, 0.0, 1.0);
    float _4033 = _4009 * _4023;
    float _4035 = _4005 * _4023;
    float _4037 = abs(_4031);
    float _4039 = log2(_4037);
    float _4041 = _4013 * _4023;
    float _4043 = _4033 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4045 = _3391 * _4035;
    float _4047 = -_4035;
    float _4049 = -_4043;
    float _4051 = fma(_4047, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4049);
    float _4053 = fma(_3603, _4033, _4045);
    float _4055 = -_4041;
    float _4057 = fma(_4055, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4051);
    float _4059 = fma(_3605, _4041, _4053);
    float _4061 = precise::clamp(_4059, 0.0, 1.0);
    float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4065 = _4057 + _4063;
    float _4067 = _4039 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4069 = _4065 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4071 = precise::clamp(_4069, 0.0, 1.0);
    float _4073 = exp2(_4067);
    float _4075 = _4073 * _4071;
    float _4077 = _4061 * _4075;
    float _4079 = _4077 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4081 = _4077 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4083 = _4077 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _4079;
    out.m_102.y = _4081;
    out.m_102.z = _4083;
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
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3855 = false;
    bool _221 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_58.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    float _131 = as_type<float>(_123);
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _129;
    float _135 = _133;
    if (!_127)
    {
        out.m_61.x = 0.0;
    }
    int _137 = 0;
    if (!_127)
    {
        float _139 = _133 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4142 = as_type<float>(_141);
        out.gl_Position.z = _4142;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_63.w;
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
        float _165 = float(_123);
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
        out.m_61.x = 0.0;
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
        float _4211 = as_type<float>(_179);
        out.gl_Position.z = _4211;
    }
    if (_173)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _203 = in.m_68.x;
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
        float _223 = float(_123);
        float _225 = 1.0 / _223;
        float _227 = _159 * _225;
        _219 = _227;
    }
    _221 = false;
    float _229 = _219;
    float _231 = in.m_68.x;
    float _233 = in.m_68.y;
    float _235 = in.m_68.z;
    float _237 = in.m_68.w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = _229 + _239;
    float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _245 = log2(_243);
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _261 = 1.0 / _249;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _267 = _265 != 0;
    float _269 = 1.0 / _253;
    float _271 = float(_123);
    float _273 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _275 = _231 * 2.0;
    float _277 = _233 * 2.0;
    float _279 = 1.0 / _257;
    float _281 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _283 = fma(_273, -2.0, _263);
    float _285 = _241 * _261;
    float _287 = _235 * 2.0;
    float _289 = -_259;
    float _291 = fma(_281, 2.0, _289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _229 + _293;
    float _297 = floor(_275);
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _301 = _229 + _299;
    float _303 = -_159;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[76].x, _291);
    float _307 = _295 * _269;
    float _309 = _231 + _233;
    float _311 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _283);
    float _313 = _301 * _279;
    float _315 = _235 + _231;
    float _317 = floor(_277);
    float _319 = _309 + (-1.0);
    float _321 = _315 + (-1.0);
    float _323 = _235 + _233;
    float _325 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _327 = floor(_287);
    float _329 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _331 = _323 + (-1.0);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _333;
    bool _337 = _297 > 0.0;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _343 = _297 >= 0.0;
    bool _345 = isnan(_297);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _355;
    int _359 = as_type<int>(_331);
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    if (_267)
    {
        _359 = 0;
    }
    int _363 = _359;
    float _365 = fma(_335, _307, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _367 = _363;
    if (!_267)
    {
        _367 = 1;
    }
    int _369 = _367;
    float _371 = fma(_357, _307, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _373 = _317 > 0.0;
    float _375 = fma(_341, _313, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _377 = _351 ? 0 : 1;
    float _379 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _381 = int(_379);
    bool _383 = _369 != 1;
    bool _385 = _327 > 0.0;
    bool _387 = _317 >= 0.0;
    bool _389 = isnan(_317);
    bool _391 = _387 || _389;
    bool _393 = isnan(0.0);
    bool _395 = _391 || _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _401 = _327 >= 0.0;
    bool _403 = isnan(_327);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = 1.0 / _271;
    float _413 = _395 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _415 = fma(_399, _313, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _417 = ~_377;
    int _419 = _417 + 1;
    int _421 = _419 + 1;
    int _423 = _421;
    float _425 = _413;
    if (!_337)
    {
        int _427 = ~_377;
        int _429 = _427 + 1;
        _423 = _429;
    }
    int _431 = _423;
    int _433 = _409 ? 0 : 1;
    float _435 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _437 = int(_435);
    int _439 = ~as_type<int>(_413);
    int _441 = _439 + 1;
    int _443 = _441 + 1;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _447 = _443;
    if (!_373)
    {
        int _449 = ~as_type<int>(_413);
        int _451 = _449 + 1;
        _447 = _451;
    }
    int _453 = _447;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_383)
    {
        _361 = _233;
    }
    float _457 = _361;
    float _459 = _411 * _159;
    float _461 = _457;
    if (!_383)
    {
        _425 = _235;
    }
    float _463 = _425;
    int _465 = ~_433;
    int _467 = _465 + 1;
    int _469 = _467 + 1;
    float _471 = _463;
    int _473 = _469;
    if (_383)
    {
        _461 = _231;
    }
    float _475 = _461;
    if (_383)
    {
        _471 = _233;
    }
    float _477 = _471;
    float _479 = _477;
    if (!_385)
    {
        int _481 = ~_433;
        int _483 = _481 + 1;
        _473 = _483;
    }
    int _485 = _473;
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[83].z, _445);
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _499 = _497 != 0;
    float _501 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[83].w, _455);
    float _503 = float(_431);
    float _505 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _487);
    if (!_383)
    {
        _131 = _235;
    }
    float _507 = _131;
    float _509 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _501);
    bool _511 = !_495;
    int _513 = _511 ? 0 : 1;
    bool _515 = !_491;
    int _517 = _515 ? 0 : 1;
    bool _519 = !_499;
    int _521 = _519 ? 0 : 1;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _529 = _527 != 0;
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _533 = _531 != 0;
    float _535 = _507;
    if (!_383)
    {
        _479 = _233;
    }
    float _537 = _479;
    float _539 = _537;
    if (_383)
    {
        _535 = _233;
    }
    float _541 = _535;
    bool _543 = !_529;
    int _545 = _543 ? 0 : 1;
    bool _547 = !_525;
    int _549 = _547 ? 0 : 1;
    int _551 = abs(_545);
    float _553 = float(_551);
    float _555 = float(_485);
    float _557 = _245 * _159;
    if (_383)
    {
        _539 = _231;
    }
    float _559 = _539;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _563 = float(_437);
    float _565 = _553 * _503;
    int _567 = abs(_549);
    float _569 = _541 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _571 = 1.0 / _563;
    float _573 = _559 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _575 = float(_381);
    float _577 = -_561;
    float _579 = fma(_573, 2.0, _577);
    float _581 = float(_567);
    float _583 = exp2(_557);
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _587 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _589 = isnan(_229);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = _581 * _555;
    bool _601 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _603 = isnan(_229);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _615 = 1.0 + _613;
    float _617 = 1.0 / _575;
    float _619 = -_597;
    float _621 = _619 + 1.0;
    float _623 = fma(_569, -2.0, _585);
    bool _625 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _627 = isnan(1.0);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _633 = _629 || _631;
    float _635 = _611 * _621;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _639 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _641 = isnan(0.0);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _647 = _643 || _645;
    float _649 = 1.0 / _615;
    float _651 = in.m_70.x;
    float _653 = in.m_70.y;
    float _655 = in.m_70.z;
    float _657 = -_583;
    float _659 = _657 + 1.0;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _663 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].z, _637);
    bool _665 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _667 = isnan(_229);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -_611;
    float _679 = _677 + 1.0;
    float _681 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _661);
    float _683 = _647 ? _659 : 0.0;
    float _685 = _571 * _159;
    bool _687 = !_533;
    int _689 = _687 ? 0 : 1;
    float _691 = _617 * _159;
    float _693 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _663);
    float _695 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _681);
    float _697 = -_159;
    float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[81].x, _579);
    float _701 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _623);
    float _703 = _693;
    if (_633)
    {
        float _705 = _683 * _649;
        _163 = _705;
    }
    float _707 = _163;
    float _709 = _599 * (-2.0);
    bool _711 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _713 = isnan(_229);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _719 = _715 || _717;
    float _721 = float(_719);
    float _723 = _675 * _679;
    int _725 = abs(_689);
    float _727 = -_675;
    float _729 = _727 + 1.0;
    float _731 = _231 + (-0.5);
    float _733 = fma(_325, _709, _325);
    float _735 = fma(_709, _651, _651);
    float _737 = _721 * _729;
    float _739 = -_721;
    float _741 = _739 + 1.0;
    float _743 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[196].x, _735);
    float _745 = float(_453);
    float _747 = _371 * _737;
    float _749 = float(_725);
    float _751 = _565 * (-2.0);
    float _753 = _365 * _737;
    float _755 = fma(_733, _707, _743);
    float _757 = _749 * _745;
    float _759 = fma(_751, _653, _653);
    float _761 = _233 + (-0.5);
    float _763 = fma(_353, _751, _353);
    float _765 = _757 * (-2.0);
    float _767 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[143].y, _753);
    float _769 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[196].y, _759);
    float _771 = in.m_72.x;
    float _773 = in.m_72.y;
    float _775 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[143].x, _747);
    float _777 = fma(_765, _655, _655);
    float _779 = fma(_763, _707, _769);
    float _781 = _755 * 0.15915493667125701904296875;
    float _783 = in.m_58.x;
    float _785 = in.m_58.y;
    float _787 = in.m_58.z;
    float _789 = _235 + (-0.5);
    float _791 = _779 * 0.15915493667125701904296875;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _793;
    float _797 = in.m_74.x;
    float _799 = in.m_74.y;
    float _801 = in.m_74.z;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _803;
    float _807 = fma(_329, _765, _329);
    float _809 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[196].z, _777);
    float _811 = fma(_795, _285, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _813 = fma(_805, _285, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _815 = fma(_415, _723, _775);
    float _817 = fma(_375, _723, _767);
    float _819 = fma(_807, _707, _809);
    float _821 = _781 * 6.283185482025146484375;
    float _823 = sin(_821);
    float _825 = fma(_811, _635, _815);
    float _827 = fma(_813, _635, _817);
    float _829 = _819 * 0.15915493667125701904296875;
    float _831 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _833 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[146].x, _825);
    float _835 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[146].y, _827);
    bool _837 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _839 = isnan(0.5);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _845 = _841 || _843;
    float _847 = _781 * 6.283185482025146484375;
    float _849 = cos(_847);
    float _851 = _833 * _771;
    float _853 = _835 * _773;
    float _855 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _857 = _853 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _859 = _785 * _799;
    float _861 = _791 * 6.283185482025146484375;
    float _863 = sin(_861);
    float _865 = _851 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _867 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _869 = fma(_783, _797, _859);
    float _871 = _865 * _855;
    float _873 = _857 * _867;
    float _875 = in.m_76.x;
    float _877 = in.m_76.y;
    float _879 = in.m_76.z;
    float _881 = _791 * 6.283185482025146484375;
    float _883 = cos(_881);
    float _885 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _887 = fma(_787, _801, _869);
    float _889 = _887 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _891 = _829 * 6.283185482025146484375;
    float _893 = cos(_891);
    float _895 = _823 * _863;
    float _897 = _849 * _863;
    float _899 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _901 = _829 * 6.283185482025146484375;
    float _903 = sin(_901);
    float _905 = _849 * _883;
    float _907 = _823 * _883;
    float _909 = _785 * _877;
    float _911 = _849 * _893;
    float _913 = _883 * _893;
    float _915 = _823 * _893;
    float _917 = _863 * _893;
    float _919 = _911 * _873;
    float _921 = fma(_783, _875, _909);
    float _923 = _915 * _873;
    float _925 = fma(_903, _905, _895);
    float _927 = -_873;
    float _929 = _903 * _927;
    float _931 = -_907;
    float _933 = fma(_903, _897, _931);
    float _935 = -_897;
    float _937 = fma(_903, _907, _935);
    float _939 = fma(_925, _871, _919);
    float _941 = fma(_913, _871, _929);
    float _943 = fma(_903, _895, _905);
    float _945 = fma(_937, _871, _923);
    float _947 = fma(_933, _885, _939);
    float _949 = fma(_917, _885, _941);
    float _951 = fma(_787, _879, _921);
    float _953 = fma(_943, _885, _945);
    float _955 = _947 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _957 = _947 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _959 = _951 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _961 = _947 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _963 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].x, _955);
    float _965 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _957);
    float _967 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].x, _961);
    float _969 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[26].z, _963);
    float _971 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[24].z, _965);
    float _973 = fma(_953, (*spvDescriptorSet0.vp_c8)._m0[25].z, _967);
    float _975 = _969 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _977 = _971 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _979 = _889 + _975;
    float _981 = _959 + _977;
    float _983 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _985 = _979 + _983;
    float _987 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _989 = _981 + _987;
    float _991 = _985 * _985;
    float _993 = fma(_989, _989, _991);
    float _995 = in.m_78.x;
    float _997 = in.m_78.y;
    float _999 = in.m_78.z;
    float _1001 = sqrt(_993);
    bool _1003 = _1001 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1005 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = _1001 + _1005;
    float _1009 = _785 * _997;
    float _1011 = fma(_783, _995, _1009);
    float _1013 = _973 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1015 = _875;
    float _1017 = _995;
    float _1019 = _1013;
    float _1021 = _1007;
    float _1023 = _787;
    float _1025 = _981;
    float _1027 = _979;
    int _1029 = 2;
    if (_1003)
    {
        float _1031 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1015 = _1031;
    }
    float _1033 = _1015;
    float _1035 = fma(_787, _999, _1011);
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_1003)
    {
        float _1039 = rsqrt(_993);
        _1017 = _1039;
    }
    float _1041 = _1017;
    float _1043 = _1037 + _1013;
    float _1045 = _1037 + _831;
    float _1047 = _1043;
    if (_1003)
    {
        float _1049 = _1043 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1019 = _1049;
    }
    float _1051 = _1019;
    float _1053 = _1033;
    if (_1003)
    {
        float _1055 = _1007 * _1033;
        _1021 = _1055;
    }
    float _1057 = _1021;
    if (_1003)
    {
        float _1059 = _1057 * 0.15915493667125701904296875;
        _1053 = _1059;
    }
    float _1061 = _1053;
    float _1063 = _1057;
    if (_1003)
    {
        float _1065 = _1061 * 6.283185482025146484375;
        float _1067 = cos(_1065);
        _1063 = _1067;
    }
    float _1069 = _1063;
    float _1071 = _785;
    if (_1003)
    {
        float _1073 = _1061 * 6.283185482025146484375;
        float _1075 = sin(_1073);
        _1071 = _1075;
    }
    float _1077 = _1071;
    if (_1003)
    {
        float _1079 = _1069 + (-1.0);
        _1023 = _1079;
    }
    float _1081 = _1023;
    float _1083 = _1081;
    if (_1003)
    {
        float _1085 = _1081 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1083 = _1085;
    }
    float _1087 = _1083;
    float _1089 = _1077;
    if (_1003)
    {
        float _1091 = fma(_1077, _1051, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1089 = _1091;
    }
    float _1093 = _1089;
    float _1095 = _1093;
    if (_1003)
    {
        float _1097 = fma(_1043, _1069, _1087);
        _1047 = _1097;
    }
    float _1099 = _1047;
    float _1101 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1003)
    {
        float _1103 = _1041 * _1093;
        _1095 = _1103;
    }
    float _1105 = _1095;
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1109 = _1099 + _1107;
    float _1111 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1101);
    if (_1003)
    {
        float _1113 = fma(_989, _1105, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1025 = _1113;
    }
    float _1115 = _1025;
    if (_1003)
    {
        float _1117 = fma(_985, _1105, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1027 = _1117;
    }
    float _1119 = _1027;
    float _1121 = _1109 * _1109;
    float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1125 = _1115 + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1129 = _1119 + _1127;
    float _1131 = fma(_1125, _1125, _1121);
    float _1133 = fma(_1129, _1129, _1131);
    float _1135 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1111);
    float _1137 = _1037 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1139 = rsqrt(_1133);
    float _1141 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1143 = fma(_959, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1137);
    float _1145 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1143);
    float _1147 = 1.0 / _1141;
    float _1149 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1151 = _1149 + _1141;
    float _1153 = _1139 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1155 = sqrt(_1133);
    float _1157 = _1125 * _1153;
    float _1159 = _1129 * _1153;
    float _1161 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1163 = _1045 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1165 = _1157 * _1157;
    float _1167 = _1159 * _1159;
    float _1169 = _1151 * _1147;
    float _1171 = _1169 * 0.5;
    float _1173 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1161);
    float _1175 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1163);
    float _1177 = _1165 + _1167;
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1181 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1179);
    float _1183 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1173);
    float _1185 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1175);
    float _1187 = sqrt(_1177);
    float _1189 = _1183 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1191 = _1185 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1193 = 1.0 / _1181;
    bool _1195 = _1187 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1197 = trunc(_1189);
    int _1199 = int(_1197);
    float _1201 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1203 = _1187 + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1207 = _1193 * _1205;
    float _1209 = trunc(_1191);
    int _1211 = int(_1209);
    bool _1213 = _1207 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1215 = fma(_959, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1217 = _1207 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1219 = !_1213;
    int _1221 = _1219 ? 0 : 1;
    float _1223 = _1061;
    float _1225 = _1203;
    int _1227 = as_type<int>(_1153);
    float _1229 = _1177;
    float _1231 = _1157;
    float _1233 = _1159;
    float _1235 = _1165;
    float _1237 = _1167;
    float _1239 = _1191;
    if (_1195)
    {
        float _1241 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1223 = _1241;
    }
    float _1243 = _1223;
    int _1245 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1247 = _1199 + _1245;
    int _1249 = _1247 + 1;
    float _1251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1253 = precise::max(0.0, _1251);
    float _1255 = floor(_1215);
    int _1257 = _1249;
    if (!_1213)
    {
        _1029 = 1;
    }
    int _1259 = _1029;
    int _1261 = _1259;
    if (!_1217)
    {
        _1261 = _1221;
    }
    int _1263 = _1261;
    float _1265 = -_1153;
    float _1267 = -_1253;
    float _1269 = fma(_1109, _1265, _1267);
    int _1271 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1273 = _1211 + _1271;
    int _1275 = _1273 + 1;
    int _1277 = _1263 << 6;
    float _1279 = _1269;
    if (_1195)
    {
        float _1281 = _1203 * _1243;
        _1225 = _1281;
    }
    float _1283 = _1225;
    bool _1285 = _1249 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1287 = 0.0;
    if (_1195)
    {
        float _1289 = rsqrt(_1177);
        _1287 = _1289;
    }
    float _1291 = _1287;
    int _1293 = _1277 + 48;
    uint _1296 = uint(int(uint(_1293) >> uint(2)));
    uint _1298 = uint(int(uint(int(_1296)) >> uint(2)));
    int _1300 = int(_1296) & 3;
    float _1302 = (*spvDescriptorSet0.vp_c15)._m0[int(_1298)][_1300];
    int _1304 = int(_1296) + 1;
    uint _1306 = uint(int(uint(_1304) >> uint(2)));
    int _1308 = _1304 & 3;
    float _1310 = (*spvDescriptorSet0.vp_c15)._m0[int(_1306)][_1308];
    float _1312 = 0.0;
    float _1314 = _1291;
    if (_1195)
    {
        float _1316 = _1283 * 0.15915493667125701904296875;
        _1312 = _1316;
    }
    float _1318 = _1312;
    int _1320 = _1249 | _1275;
    float _1322 = -_1255;
    float _1324 = _1215 + _1322;
    bool _1326 = _1320 < 0;
    bool _1328 = _1326 || _1285;
    float _1330 = 0.0;
    float _1332 = _1318;
    float _1334 = _1255;
    if (_1195)
    {
        float _1336 = _1318 * 6.283185482025146484375;
        float _1338 = sin(_1336);
        _1330 = _1338;
    }
    float _1340 = _1330;
    int _1342 = _1277 + 64;
    uint _1344 = uint(int(uint(_1342) >> uint(2)));
    uint _1346 = uint(int(uint(int(_1344)) >> uint(2)));
    int _1348 = int(_1344) & 3;
    float _1350 = (*spvDescriptorSet0.vp_c15)._m0[int(_1346)][_1348];
    int _1352 = int(_1344) + 1;
    uint _1354 = uint(int(uint(_1352) >> uint(2)));
    int _1356 = _1352 & 3;
    float _1358 = (*spvDescriptorSet0.vp_c15)._m0[int(_1354)][_1356];
    bool _1360 = _1275 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1362 = _1360 || _1328;
    float _1364 = 0.0;
    if (_1195)
    {
        float _1366 = _1318 * 6.283185482025146484375;
        float _1368 = cos(_1366);
        _1364 = _1368;
    }
    float _1370 = _1364;
    int _1372 = _1277 + 80;
    uint _1374 = uint(int(uint(_1372) >> uint(2)));
    uint _1376 = uint(int(uint(int(_1374)) >> uint(2)));
    int _1378 = int(_1374) & 3;
    float _1380 = (*spvDescriptorSet0.vp_c15)._m0[int(_1376)][_1378];
    int _1382 = int(_1374) + 1;
    uint _1384 = uint(int(uint(_1382) >> uint(2)));
    int _1386 = _1382 & 3;
    float _1388 = (*spvDescriptorSet0.vp_c15)._m0[int(_1384)][_1386];
    if (!_1362)
    {
        int _1390 = _1275 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1392 = _1390 + _1249;
        _1227 = _1392;
    }
    int _1394 = _1227;
    int _1396 = _1277 + 96;
    uint _1398 = uint(int(uint(_1396) >> uint(2)));
    uint _1400 = uint(int(uint(int(_1398)) >> uint(2)));
    int _1402 = int(_1398) & 3;
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[int(_1400)][_1402];
    int _1406 = int(_1398) + 1;
    uint _1408 = uint(int(uint(_1406) >> uint(2)));
    int _1410 = _1406 & 3;
    float _1412 = (*spvDescriptorSet0.vp_c15)._m0[int(_1408)][_1410];
    if (_1195)
    {
        float _1414 = _1269 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1332 = _1414;
    }
    float _1416 = _1332;
    float _1418 = floor(_899);
    float _1420 = _1416;
    if (!_1362)
    {
        int _1422 = _1394 << 2;
        _1257 = _1422;
    }
    int _1424 = _1257;
    int _1426 = _1424;
    if (_1195)
    {
        float _1428 = fma(_1340, _1416, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1420 = _1428;
    }
    float _1430 = _1420;
    if (_1195)
    {
        float _1432 = _1370 + (-1.0);
        _1334 = _1432;
    }
    float _1434 = _1334;
    int _1436 = _1277 + 72;
    uint _1438 = uint(int(uint(_1436) >> uint(2)));
    uint _1440 = uint(int(uint(int(_1438)) >> uint(2)));
    int _1442 = int(_1438) & 3;
    float _1444 = (*spvDescriptorSet0.vp_c15)._m0[int(_1440)][_1442];
    int _1446 = int(_1438) + 1;
    uint _1448 = uint(int(uint(_1446) >> uint(2)));
    int _1450 = _1446 & 3;
    float _1452 = (*spvDescriptorSet0.vp_c15)._m0[int(_1448)][_1450];
    if (_1195)
    {
        float _1454 = _1291 * _1430;
        _1314 = _1454;
    }
    float _1456 = _1314;
    if (!_1362)
    {
        int _1458 = 12 & _1424;
        _1426 = _1458;
    }
    int _1460 = _1426;
    if (_1195)
    {
        float _1462 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1229 = _1462;
    }
    float _1464 = _1229;
    float _1466 = as_type<float>(_1275);
    int _1468 = as_type<int>(_1464);
    if (!_1362)
    {
        float _1470 = floor(_1191);
        _1466 = _1470;
    }
    float _1472 = _1466;
    if (_1195)
    {
        float _1474 = _1157 * _1456;
        _1231 = _1474;
    }
    float _1476 = _1231;
    if (_1195)
    {
        float _1478 = _1159 * _1456;
        _1233 = _1478;
    }
    float _1480 = _1233;
    if (_1195)
    {
        float _1482 = fma(_1269, _1370, _1464);
        _1279 = _1482;
    }
    float _1484 = _1279;
    int _1486 = _1277 + 104;
    uint _1488 = uint(int(uint(_1486) >> uint(2)));
    uint _1490 = uint(int(uint(int(_1488)) >> uint(2)));
    int _1492 = int(_1488) & 3;
    float _1494 = (*spvDescriptorSet0.vp_c15)._m0[int(_1490)][_1492];
    int _1496 = int(_1488) + 1;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    int _1500 = _1496 & 3;
    float _1502 = (*spvDescriptorSet0.vp_c15)._m0[int(_1498)][_1500];
    if (_1195)
    {
        float _1504 = _1476 * _1476;
        _1235 = _1504;
    }
    float _1506 = _1235;
    if (_1195)
    {
        float _1508 = _1480 * _1480;
        _1237 = _1508;
    }
    float _1510 = _1237;
    if (!_1362)
    {
        uint _1512 = uint(int(uint(_1394) >> uint(2)));
        _1468 = int(_1512);
    }
    int _1514 = _1468;
    float _1516 = fma(_1484, _1484, _1506);
    int _1518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1520 = _1518 != 0;
    int _1522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1524 = _1522 != 0;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1528 = _1526 != 0;
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1532 = _1530 != 0;
    int _1534 = _1277 + 56;
    uint _1536 = uint(int(uint(_1534) >> uint(2)));
    uint _1538 = uint(int(uint(int(_1536)) >> uint(2)));
    int _1540 = int(_1536) & 3;
    float _1542 = (*spvDescriptorSet0.vp_c15)._m0[int(_1538)][_1540];
    int _1544 = int(_1536) + 1;
    uint _1546 = uint(int(uint(_1544) >> uint(2)));
    int _1548 = _1544 & 3;
    float _1550 = (*spvDescriptorSet0.vp_c15)._m0[int(_1546)][_1548];
    float _1552 = _1516 + _1510;
    int _1554 = _1514;
    float _1556 = _1552;
    if (!_1362)
    {
        int _1558 = _1514 << 4;
        int _1560 = _1558 + _1460;
        _1554 = _1560;
    }
    int _1562 = _1554;
    float _1564 = _1045 * _1310;
    float _1566 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1568 = rsqrt(_1552);
    if (!_1362)
    {
        float _1570 = -_1472;
        float _1572 = _1191 + _1570;
        _1239 = _1572;
    }
    float _1574 = _1239;
    float _1576 = fma(_959, _1302, _1564);
    int _1578 = _1277 + 88;
    uint _1580 = uint(int(uint(_1578) >> uint(2)));
    uint _1582 = uint(int(uint(int(_1580)) >> uint(2)));
    int _1584 = int(_1580) & 3;
    float _1586 = (*spvDescriptorSet0.vp_c15)._m0[int(_1582)][_1584];
    int _1588 = int(_1580) + 1;
    uint _1590 = uint(int(uint(_1588) >> uint(2)));
    int _1592 = _1588 & 3;
    float _1594 = (*spvDescriptorSet0.vp_c15)._m0[int(_1590)][_1592];
    float _1596 = _1045 * _1358;
    float _1598 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _1600 = !_1524;
    int _1602 = _1600 ? 0 : 1;
    float _1604 = fma(_959, _1350, _1596);
    float _1606 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1598);
    if (_845)
    {
        _1556 = 1.0;
    }
    float _1608 = _1556;
    float _1610 = _1350;
    float _1612 = _1608;
    if (!_1362)
    {
        int _1614 = _1562 + 400;
        uint _1616 = uint(int(uint(_1614) >> uint(2)));
        uint _1618 = uint(int(uint(int(_1616)) >> uint(2)));
        int _1620 = int(_1616) & 3;
        float _1622 = (*spvDescriptorSet0.vp_c15)._m0[int(_1618)][_1620];
        _1610 = _1622;
    }
    float _1624 = _1610;
    float _1626 = _1045 * _1388;
    float _1628 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1606);
    float _1630 = -_1418;
    float _1632 = _899 + _1630;
    bool _1634 = !_1520;
    int _1636 = _1634 ? 0 : 1;
    float _1638 = _1568 * _1476;
    float _1640 = _1628 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1642 = fma(_959, _1380, _1626);
    float _1644 = _1045 * _1412;
    float _1646 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1648 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1650 = _1568 * _1480;
    float _1652 = fma(_959, _1404, _1644);
    bool _1654 = !_1528;
    int _1656 = _1654 ? 0 : 1;
    bool _1658 = !_1532;
    int _1660 = _1658 ? 0 : 1;
    float _1662 = fma(_889, _1444, _1604);
    float _1664 = _1568 * _1484;
    float _1666 = _1662 + _1452;
    float _1668 = -_1646;
    float _1670 = fma(_1664, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1668);
    float _1672 = -_1648;
    float _1674 = fma(_1672, _1566, 1.0);
    float _1676 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1678 = fma(_889, _1494, _1652);
    float _1680 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1682 = -_1650;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1670);
    float _1686 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1676);
    float _1688 = _1678 + _1502;
    float _1690 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1680);
    float _1692 = _1099 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1694 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1686);
    float _1696 = fma(_889, _1542, _1576);
    float _1698 = 1.0 / _1688;
    float _1700 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1690);
    float _1702 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1704 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1692);
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1708 = fma(_1155, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1706);
    float _1710 = precise::clamp(_1708, 0.0, 1.0);
    float _1712 = _1700 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1714 = fma(_889, _1586, _1642);
    float _1716 = _1696 + _1550;
    float _1718 = -_1710;
    float _1720 = _1718 + 1.0;
    float _1722 = _1642;
    float _1724 = _1594;
    float _1726 = _1714;
    float _1728 = _1664;
    if (!_1362)
    {
        float _1730 = floor(_1189);
        _1722 = _1730;
    }
    float _1732 = _1722;
    float _1734 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1736 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1704);
    float _1738 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1734);
    float _1740 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1742 = _1716 * _1698;
    float _1744 = log2(_1674);
    float _1746 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1738);
    bool _1748 = _1742 >= 0.0;
    float _1750 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1746);
    float _1752 = abs(_1720);
    float _1754 = log2(_1752);
    if (!_845)
    {
        float _1756 = as_type<float>(in.m_82.w);
        int _1758 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _1760 = _1758 == 4;
        bool _1762 = _1758 == 8;
        bool _1764 = _1758 == 12;
        int _1766 = as_type<int>(_1756) << 16;
        int _1768 = as_type<int>(_1756) << 8;
        int _1770 = as_type<int>(_1756) << 24;
        int _1772 = _1766 >> 24;
        int _1774 = _1768 >> 24;
        int _1776 = as_type<int>(_1756) >> 24;
        int _1778 = _1770 >> 24;
        float _1780 = float(_1772);
        float _1782 = float(_1774);
        float _1784 = float(_1776);
        float _1786 = _1780 * 0.0078740157186985015869140625;
        float _1788 = float(_1778);
        float _1790 = _1782 * 0.0078740157186985015869140625;
        float _1792 = _1784 * 0.0078740157186985015869140625;
        float _1794 = precise::min(_1786, 1.0);
        float _1796 = _1788 * 0.0078740157186985015869140625;
        float _1798 = precise::min(_1790, 1.0);
        float _1800 = precise::min(_1792, 1.0);
        float _1802 = precise::min(_1796, 1.0);
        float _1804 = precise::max(_1794, -1.0);
        float _1806 = precise::max(_1798, -1.0);
        float _1808 = precise::max(_1800, -1.0);
        float _1810 = precise::max(_1802, -1.0);
        float _1812 = _1810;
        if (_1760)
        {
            _1812 = _1804;
        }
        float _1814 = _1812;
        float _1816 = _1814;
        if (_1762)
        {
            _1816 = _1806;
        }
        float _1818 = _1816;
        float _1820 = _1818;
        if (_1764)
        {
            _1820 = _1808;
        }
        float _1822 = _1820;
        float _1824 = abs(_1822);
        float _1826 = (-0.0) + _1824;
        _1612 = _1826;
    }
    float _1828 = _1612;
    float _1830 = _1666 * _1698;
    bool _1832 = _1742 <= 1.0;
    bool _1834 = _1832 && _1748;
    float _1836 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1838 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1840 = _1828 != 0.0;
    bool _1842 = isnan(_1828);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan(0.0);
    bool _1848 = _1844 || _1846;
    float _1850 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _1852 = _1830 >= 0.0;
    bool _1854 = _1852 && _1834;
    float _1856 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1836);
    float _1858 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1838);
    float _1860 = fma(_1684, -0.5, 0.5);
    bool _1862 = _1830 <= 1.0;
    bool _1864 = _1862 && _1854;
    float _1866 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1856);
    float _1868 = 1.0 / _1750;
    float _1870 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1858);
    float _1872 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1866);
    float _1874 = fma(_1684, 0.5, 0.5);
    float _1876 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1870);
    float _1878 = _1714 + _1594;
    float _1880 = _1744 * 0.693147182464599609375;
    float _1882 = sqrt(_1860);
    float _1884 = fma(_1874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1886 = _1860;
    float _1888 = _1830;
    float _1890 = _1876;
    float _1892 = _1872;
    if (_1848)
    {
        _1724 = _1872;
    }
    float _1894 = _1724;
    float _1896 = _1878 * _1698;
    float _1898 = _1894;
    if (_1848)
    {
        _1726 = _1876;
    }
    float _1900 = _1726;
    float _1902 = _1900;
    if (!_1848)
    {
        _1898 = 0.0;
        _1902 = 0.0;
    }
    float _1904 = _1898;
    float _1906 = _1902;
    float _1908 = fma(_1874, _1884, -0.212114393711090087890625);
    float _1910 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1912 = exp2(_1850);
    if (_1864)
    {
        float _1914 = float(_1263);
        _1886 = _1914;
    }
    float _1916 = _1886;
    float _1918 = _1664 + 1.0;
    float _1920 = fma(_1874, _1908, 1.570728778839111328125);
    float _1922 = _1868 * _1904;
    float _1924 = _1868 * _1906;
    float _1926 = fma(_1115, 6.2500002968590706586837768554688e-05, 0.5);
    float _1928 = fma(_1119, 6.2500002968590706586837768554688e-05, 0.5);
    float _1930 = _1916;
    if (_1864)
    {
        float _1932 = rint(_1916);
        float _1934 = precise::max(_1932, 0.0);
        uint _1936 = uint(_1934);
        uint _1938 = clamp(_1936, 0u, 65535u);
        _1930 = as_type<float>(_1938);
    }
    float _1940 = _1930;
    float _1942 = _1882 * 0.636619746685028076171875;
    float _1944 = fma(_1922, 0.5, 0.5);
    float _1946 = -_1920;
    float _1948 = fma(_1942, _1946, 1.0);
    float _1950 = _1624;
    if (!_1362)
    {
        float _1952 = rint(_1624);
        float _1954 = precise::max(_1952, 0.0);
        uint _1956 = uint(_1954);
        uint _1958 = clamp(_1956, 0u, 65535u);
        _1950 = as_type<float>(_1958);
    }
    float _1960 = _1950;
    float _1962 = -_1664;
    float _1964 = fma(_1912, _1918, _1962);
    if (!_1362)
    {
        float _1966 = -_1732;
        float _1968 = _1189 + _1966;
        _1728 = _1968;
    }
    float _1970 = _1728;
    float _1972 = fma(_1924, -0.5, 0.5);
    float2 _7021 = float2(_1926, _1928);
    float3 _1976 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_7021, float2(0.0), isnan(_7021)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_7021, float2(0.0), isnan(_7021)), level(0.0)).xyz;
    float _1978 = _1976.x;
    float _1980 = _1976.y;
    float _1982 = _1976.z;
    float _1984 = fma(_1964, 0.5, 0.5);
    if (_1864)
    {
        float3 _7044 = float3(_1742, _1830, float(as_type<int>(_1940)));
        float3 _7048 = select(_7044, float3(0.0), isnan(_7044));
        float _1986 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7048.xy, uint(rint(_7048.z)), _1896, level(0.0));
        _1888 = _1986;
    }
    float _1988 = _1888;
    float2 _7057 = float2(_1324, _1632);
    float _1990 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7057, float2(0.0), isnan(_7057)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7057, float2(0.0), isnan(_7057)), level(0.0)).x;
    float3 _7066 = float3(_1944, _1972, _1910);
    float _1992 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7066, float3(0.0), isnan(_7066)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7066, float3(0.0), isnan(_7066)), level(0.0)).x;
    float3 _7075 = float3(_1944, _1972, _1910);
    float4 _1995 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7075, float3(0.0), isnan(_7075)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7075, float3(0.0), isnan(_7075)), level(0.0)).xyzw;
    float _1997 = _1995.x;
    float _1999 = _1995.y;
    float _2001 = _1995.z;
    float _2003 = _1995.w;
    float2 _7091 = float2(_1948, _1984);
    float3 _2005 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7091, float2(0.0), isnan(_7091)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7091, float2(0.0), isnan(_7091)), level(0.0)).xyz;
    float _2007 = _2005.x;
    float _2009 = _2005.y;
    float _2011 = _2005.z;
    float _2013 = _1574;
    if (!_1362)
    {
        float3 _7112 = float3(_1970, _1574, float(as_type<int>(_1960)));
        float3 _7114 = select(_7112, float3(0.0), isnan(_7112));
        float _2015 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7114.xy, uint(rint(_7114.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7114.xy, uint(rint(_7114.z)), level(0.0)).x;
        _2013 = _2015;
    }
    float _2017 = _2013;
    float _2019 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2021 = int(_2019);
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2025 = _2023 != 0;
    float _2027 = _1702 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2029 = abs(_513);
    float _2031 = -_695;
    float _2033 = _2031 + 1.0;
    int _2035 = abs(_1602);
    float _2037 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2027);
    int _2039 = abs(_1656);
    float _2041 = trunc(_685);
    int _2043 = int(_2041);
    int _2045 = abs(_1660);
    float _2047 = -_505;
    float _2049 = _2047 + 1.0;
    float _2051 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2053 = float(uint(_2021));
    float _2055 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2057 = int(_2055);
    int _2059 = ~_2021;
    int _2061 = _2059 + 1;
    float _2063 = float(uint(_2043));
    float _2065 = 1.0 / _2053;
    int _2067 = ~_2021;
    int _2069 = _2067 + 1;
    int _2071 = _2021 + (-1);
    float _2073 = float(uint(_2057));
    float _2075 = trunc(_691);
    int _2077 = int(_2075);
    int _2079 = ~_2057;
    int _2081 = _2079 + 1;
    int _2083 = as_type<int>(_2065) + (-2);
    float _2085 = 1.0 / _2073;
    float _2087 = as_type<float>(_2083) * _2063;
    float _2089 = exp2(_2051);
    float _2091 = trunc(_2087);
    float _2093 = precise::max(_2091, 0.0);
    uint _2095 = uint(_2093);
    int _2097 = _2069 * int(_2095);
    int _2099 = _2097 + _2043;
    float _2101 = float(uint(_2099));
    int _2103 = as_type<int>(_2085) + (-2);
    float _2105 = _2085;
    float _2107 = _2101;
    if (_2025)
    {
        float _2109 = in.m_68.x;
        _2105 = _2109;
    }
    float _2111 = _2105;
    float _2113 = as_type<float>(_2083) * _2101;
    if (_2025)
    {
        _2107 = 1.0;
    }
    float _2115 = _2107;
    float _2117 = _2115;
    if (!_2025)
    {
        _2117 = 7.345489978790283203125;
    }
    float _2119 = _2117;
    float _2121 = _2111;
    if (!_2025)
    {
        float _2123 = in.m_68.y;
        _2121 = _2123;
    }
    float _2125 = _2121;
    float _2127 = trunc(_2113);
    float _2129 = precise::max(_2127, 0.0);
    uint _2131 = uint(_2129);
    float _2133 = _2119 * _231;
    float _2135 = float(uint(_2077));
    float _2137 = as_type<float>(_2103) * _2135;
    float _2139 = floor(_2133);
    int _2141 = int(_2095) + int(_2131);
    float _2143 = trunc(_2137);
    float _2145 = precise::max(_2143, 0.0);
    uint _2147 = uint(_2145);
    float _2149 = float(_2021);
    float _2151 = float(_2043);
    int _2153 = _2061 * _2141;
    int _2155 = _2153 + _2043;
    bool _2157 = _2151 >= _2149;
    bool _2159 = isnan(_2151);
    bool _2161 = _2157 || _2159;
    bool _2163 = isnan(_2149);
    bool _2165 = _2161 || _2163;
    float _2167 = float(_2165);
    float _2169 = -_2139;
    float _2171 = _2133 + _2169;
    bool _2173 = uint(_2155) >= uint(_2021);
    float _2175 = _2171 * _2149;
    float _2177 = trunc(_2167);
    int _2179 = int(_2177);
    bool _2181 = !_2173;
    int _2183 = _2181 ? 0 : (-1);
    int _2185 = _2081 * int(_2147);
    int _2187 = _2185 + _2077;
    bool _2189 = _2021 == 0;
    int _2191 = ~_2141;
    int _2193 = _2191 + _2183;
    int _2195 = _2193 + 1;
    float _2197 = float(uint(_2187));
    float _2199 = trunc(_2175);
    int _2201 = int(_2199);
    int _2203 = _2021 * _2195;
    int _2205 = _2203 + _2043;
    float _2207 = as_type<float>(_2103) * _2197;
    float _2209 = _2149 * _459;
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2213 = _2211 != 0;
    int _2215 = ~_2179;
    int _2217 = _2215 + 1;
    int _2219 = _2217 + 1;
    float _2221 = trunc(_2209);
    int _2223 = int(_2221);
    bool _2225 = !_2189;
    float _2227 = _2225 ? as_type<float>(_2205) : as_type<float>(0xffffffffu /* nan */);
    bool _2229 = !_2213;
    int _2231 = _2229 ? 0 : 1;
    int _2233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2235 = _2233 != 0;
    int _2237 = as_type<int>(_2227) * _2219;
    float _2239 = _2227;
    if (_2025)
    {
        _2239 = 1.0;
    }
    float _2241 = _2239;
    float _2243 = trunc(_2207);
    float _2245 = precise::max(_2243, 0.0);
    uint _2247 = uint(_2245);
    float _2249 = _2241;
    if (!_2025)
    {
        _2249 = 1.2345600128173828125;
    }
    float _2251 = _2249;
    int _2253 = _2179 * _2071;
    int _2255 = _2253 + _2237;
    int _2257 = abs(_517);
    int _2259 = abs(_2231);
    float _2261 = _2251 * _2125;
    bool _2263 = !_2235;
    int _2265 = _2263 ? 0 : 1;
    int _2267 = _2255 * _2029;
    int _2269 = abs(_521);
    float _2271 = floor(_2261);
    int _2273 = _2201 * _2259;
    int _2275 = _2273 + _2043;
    int _2277 = ~_2057;
    int _2279 = _2277 + 1;
    int _2281 = abs(_2265);
    int _2283 = _2223 * _2257;
    int _2285 = _2283 + _2267;
    int _2287 = int(_2147) + int(_2247);
    float _2289 = float(_2057);
    int _2291 = _2279 * _2287;
    int _2293 = _2291 + _2077;
    float _2295 = float(_2077);
    float _2297 = -_2271;
    float _2299 = _2261 + _2297;
    bool _2301 = _2295 >= _2289;
    bool _2303 = isnan(_2295);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(_2289);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    int _2313 = _2275 * _2269;
    int _2315 = _2313 + _2285;
    bool _2317 = uint(_2293) >= uint(_2057);
    int _2319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2321 = _2319 != 0;
    int _2323 = _2201 * _2281;
    int _2325 = _2323 + _2315;
    float _2327 = trunc(_2311);
    int _2329 = int(_2327);
    bool _2331 = !_2317;
    int _2333 = _2331 ? 0 : (-1);
    float _2335 = _2299 * _2289;
    bool _2337 = _2057 == 0;
    float _2339 = _2289 * _459;
    float _2341 = float(uint(_2325));
    int _2343 = ~_2287;
    int _2345 = _2343 + _2333;
    int _2347 = _2345 + 1;
    float _2349 = trunc(_2335);
    int _2351 = int(_2349);
    bool _2353 = !_2321;
    int _2355 = _2353 ? 0 : 1;
    float _2357 = as_type<float>(_2083) * _2341;
    int _2359 = _2057 + (-1);
    int _2361 = _2057 * _2347;
    int _2363 = _2361 + _2077;
    int _2365 = abs(_2355);
    int _2367 = ~_2057;
    int _2369 = _2367 + 1;
    float _2371 = trunc(_2357);
    float _2373 = precise::max(_2371, 0.0);
    uint _2375 = uint(_2373);
    int _2377 = ~_2329;
    int _2379 = _2377 + 1;
    int _2381 = _2379 + 1;
    bool _2383 = !_2337;
    int _2385 = _2383 ? _2363 : (-1);
    int _2387 = _2385 * _2381;
    float _2389 = trunc(_2339);
    int _2391 = int(_2389);
    int _2393 = ~_2021;
    int _2395 = _2393 + 1;
    int _2397 = _2329 * _2359;
    int _2399 = _2397 + _2387;
    int _2401 = abs(_1636);
    int _2403 = _2399 * _2035;
    int _2405 = ~_2021;
    int _2407 = _2405 + 1;
    int _2409 = _2395 * int(_2375);
    int _2411 = _2409 + _2325;
    int _2413 = ~_2021;
    int _2415 = _2413 + 1;
    int _2417 = _2351 * _2365;
    int _2419 = _2417 + _2077;
    float _2421 = float(uint(_2411));
    int _2423 = _2391 * _2401;
    int _2425 = _2423 + _2403;
    float _2427 = as_type<float>(_2083) * _2421;
    int _2429 = _2419 * _2039;
    int _2431 = _2429 + _2425;
    float _2433 = float(uint(_2275));
    float _2435 = trunc(_2427);
    float _2437 = precise::max(_2435, 0.0);
    uint _2439 = uint(_2437);
    int _2441 = _2351 * _2045;
    int _2443 = _2441 + _2431;
    float _2445 = as_type<float>(_2083) * _2433;
    float _2447 = float(uint(_2443));
    float _2449 = float(uint(_2419));
    float _2451 = as_type<float>(_2103) * _2447;
    float _2453 = as_type<float>(_2103) * _2449;
    int _2455 = int(_2375) + int(_2439);
    float _2457 = trunc(_2451);
    float _2459 = precise::max(_2457, 0.0);
    uint _2461 = uint(_2459);
    int _2463 = ~_2057;
    int _2465 = _2463 + 1;
    int _2467 = _2415 * _2455;
    int _2469 = _2467 + _2325;
    float _2471 = trunc(_2445);
    float _2473 = precise::max(_2471, 0.0);
    uint _2475 = uint(_2473);
    bool _2477 = uint(_2469) >= uint(_2021);
    bool _2479 = !_2477;
    int _2481 = _2479 ? 0 : (-1);
    int _2483 = _2465 * int(_2461);
    int _2485 = _2483 + _2443;
    float _2487 = trunc(_2453);
    float _2489 = precise::max(_2487, 0.0);
    uint _2491 = uint(_2489);
    bool _2493 = _237 > 0.5;
    int _2495 = ~_2455;
    int _2497 = _2495 + _2481;
    int _2499 = _2497 + 1;
    float _2501 = float(uint(_2485));
    int _2503 = _2407 * int(_2475);
    int _2505 = _2503 + _2275;
    float _2507 = -_199;
    int _2509 = _2493 ? as_type<int>(_2507) : as_type<int>(_199);
    int _2511 = _2021 * _2499;
    int _2513 = _2511 + _2325;
    float _2515 = as_type<float>(_2103) * _2501;
    int _2517 = ~_2057;
    int _2519 = _2517 + 1;
    float _2521 = float(uint(_2505));
    float _2523 = trunc(_2515);
    float _2525 = precise::max(_2523, 0.0);
    uint _2527 = uint(_2525);
    bool _2529 = !_2189;
    int _2531 = _2529 ? _2513 : (-1);
    int _2533 = _2519 * int(_2491);
    int _2535 = _2533 + _2419;
    int _2537 = ~_2057;
    int _2539 = _2537 + 1;
    float _2541 = as_type<float>(_2083) * _2521;
    int _2543 = _2531 & 3;
    bool _2545 = _2543 != 0;
    int _2547 = _2531 & 3;
    bool _2549 = _2547 != 0;
    float _2551 = trunc(_2541);
    float _2553 = precise::max(_2551, 0.0);
    uint _2555 = uint(_2553);
    int _2557 = _2545 ? 0 : 1;
    out.m_84.x = _1978;
    out.m_84.y = _1980;
    out.m_84.z = _1982;
    bool _2559 = uint(_2547) > 1u;
    float _2561 = float(uint(_2535));
    int _2563 = ~_2557;
    int _2565 = _2563 + 1;
    int _2567 = _2565 + 1;
    float _2569 = -_1990;
    float _2571 = _2569 + 1.0;
    int _2573 = int(_2461) + int(_2527);
    float _2575 = as_type<float>(_2103) * _2561;
    bool _2577 = !_2549;
    int _2579 = _2577 ? 0 : 1;
    int _2581 = _2539 * _2573;
    int _2583 = _2581 + _2443;
    float _2585 = trunc(_2575);
    float _2587 = precise::max(_2585, 0.0);
    uint _2589 = uint(_2587);
    int _2591 = _2567;
    float _2593 = _1978;
    float _2595 = _1982;
    if (!_2559)
    {
        int _2597 = ~_2557;
        int _2599 = _2597 + 1;
        _2591 = _2599;
    }
    int _2601 = _2591;
    bool _2603 = uint(_2547) >= 2u;
    int _2605 = ~_2021;
    int _2607 = _2605 + 1;
    int _2609 = _2603 ? 0 : 1;
    bool _2611 = uint(_2583) >= uint(_2057);
    int _2613 = int(_2475) + int(_2555);
    bool _2615 = !_2611;
    int _2617 = _2615 ? 0 : (-1);
    int _2619 = abs(_2579);
    int _2621 = _2607 * _2613;
    int _2623 = _2621 + _2275;
    int _2625 = ~_2573;
    int _2627 = _2625 + _2617;
    int _2629 = _2627 + 1;
    int _2631 = int(_2491) + int(_2589);
    bool _2633 = uint(_2623) >= uint(_2021);
    int _2635 = _2057 * _2629;
    int _2637 = _2635 + _2443;
    int _2639 = _2531 >> 31;
    int _2641 = _2369 * _2631;
    int _2643 = _2641 + _2419;
    bool _2645 = !_2633;
    int _2647 = _2645 ? 0 : (-1);
    int _2649 = _2639 & 3;
    bool _2651 = !_2337;
    int _2653 = _2651 ? _2637 : (-1);
    int _2655 = _2531 + _2649;
    int _2657 = _2653 >> 31;
    bool _2659 = _2547 != 3;
    int _2661 = ~_2613;
    int _2663 = _2661 + _2647;
    int _2665 = _2663 + 1;
    int _2667 = _2657 & 3;
    int _2669 = _2655 >> 2;
    int _2671 = _2021 * _2665;
    int _2673 = _2671 + _2275;
    int _2675 = _2653 + _2667;
    int _2677 = ~_2609;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    int _2683 = _2675 >> 2;
    bool _2685 = !_2189;
    int _2687 = _2685 ? _2673 : (-1);
    int _2689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2691 = _2689 != 0;
    int _2693 = _2669 << 4;
    int _2695 = _2693 + 368;
    int _2697 = _2681;
    if (_2659)
    {
        int _2699 = ~_2609;
        int _2701 = _2699 + 1;
        _2697 = _2701;
    }
    int _2703 = _2697;
    int _2705 = _2683 << 4;
    int _2707 = _2705 + 512;
    uint _2709 = uint(int(uint(_2695) >> uint(2)));
    uint _2711 = uint(int(uint(int(_2709)) >> uint(2)));
    int _2713 = int(_2709) & 3;
    float _2715 = (*spvDescriptorSet0.vp_c9)._m0[int(_2711)][_2713];
    int _2717 = int(_2709) + 1;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    int _2721 = _2717 & 3;
    float _2723 = (*spvDescriptorSet0.vp_c9)._m0[int(_2719)][_2721];
    int _2725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2727 = _2725 != 0;
    bool _2729 = !_2691;
    float _2731 = _2729 ? _199 : as_type<float>(_2509);
    int _2733 = _2653 & 3;
    bool _2735 = _2733 != 0;
    int _2737 = _2653 & 3;
    bool _2739 = _2737 != 0;
    int _2741 = _2707 + 8;
    uint _2743 = uint(int(uint(_2741) >> uint(2)));
    uint _2745 = uint(int(uint(int(_2743)) >> uint(2)));
    int _2747 = int(_2743) & 3;
    float _2749 = (*spvDescriptorSet0.vp_c9)._m0[int(_2745)][_2747];
    int _2751 = int(_2743) + 1;
    uint _2753 = uint(int(uint(_2751) >> uint(2)));
    int _2755 = _2751 & 3;
    float _2757 = (*spvDescriptorSet0.vp_c9)._m0[int(_2753)][_2755];
    bool _2759 = !_2727;
    int _2761 = _2759 ? 0 : 1;
    int _2763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2765 = _2763 != 0;
    int _2767 = _2735 ? 0 : 1;
    bool _2769 = !_2765;
    int _2771 = _2769 ? 0 : 1;
    uint _2773 = uint(int(uint(_2707) >> uint(2)));
    uint _2775 = uint(int(uint(int(_2773)) >> uint(2)));
    int _2777 = int(_2773) & 3;
    float _2779 = (*spvDescriptorSet0.vp_c9)._m0[int(_2775)][_2777];
    int _2781 = int(_2773) + 1;
    uint _2783 = uint(int(uint(_2781) >> uint(2)));
    int _2785 = _2781 & 3;
    float _2787 = (*spvDescriptorSet0.vp_c9)._m0[int(_2783)][_2785];
    bool _2789 = uint(_2737) > 1u;
    bool _2791 = _2547 != 3;
    bool _2793 = !_2739;
    int _2795 = _2793 ? 0 : 1;
    int _2797 = ~_2767;
    int _2799 = _2797 + 1;
    int _2801 = _2799 + 1;
    int _2803 = _2695 + 8;
    uint _2805 = uint(int(uint(_2803) >> uint(2)));
    uint _2807 = uint(int(uint(int(_2805)) >> uint(2)));
    int _2809 = int(_2805) & 3;
    float _2811 = (*spvDescriptorSet0.vp_c9)._m0[int(_2807)][_2809];
    int _2813 = int(_2805) + 1;
    uint _2815 = uint(int(uint(_2813) >> uint(2)));
    int _2817 = _2813 & 3;
    float _2819 = (*spvDescriptorSet0.vp_c9)._m0[int(_2815)][_2817];
    bool _2821 = uint(_2643) >= uint(_2057);
    float _2823 = _911 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2825 = abs(_2703);
    bool _2827 = !_2821;
    int _2829 = _2827 ? 0 : (-1);
    int _2831 = _2801;
    if (!_2789)
    {
        int _2833 = ~_2767;
        int _2835 = _2833 + 1;
        _2831 = _2835;
    }
    int _2837 = _2831;
    bool _2839 = !_2791;
    int _2841 = _2839 ? 0 : (-1);
    bool _2843 = uint(_2737) >= 2u;
    bool _2845 = _2737 != 3;
    int _2847 = _2843 ? 0 : 1;
    bool _2849 = _2737 != 3;
    int _2851 = ~_2631;
    int _2853 = _2851 + _2829;
    int _2855 = _2853 + 1;
    bool _2857 = !_2849;
    int _2859 = _2857 ? 0 : (-1);
    int _2861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2863 = _2861 != 0;
    int _2865 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2867 = _2865 != 0;
    int _2869 = _2057 * _2855;
    int _2871 = _2869 + _2419;
    int _2873 = abs(_2601);
    int _2875 = ~_2847;
    int _2877 = _2875 + 1;
    int _2879 = _2877 + 1;
    int _2881 = _2879;
    if (_2845)
    {
        int _2883 = ~_2847;
        int _2885 = _2883 + 1;
        _2881 = _2885;
    }
    int _2887 = _2881;
    bool _2889 = _231 > 0.5;
    int _2891 = abs(_2837);
    bool _2893 = !_2337;
    int _2895 = _2893 ? _2871 : (-1);
    int _2897 = ~_2873;
    int _2899 = _2897 + 1;
    int _2901 = _2899 + 1;
    int _2903 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2905 = _2903 != 0;
    int _2907 = ~_2891;
    int _2909 = _2907 + 1;
    int _2911 = _2909 + 1;
    int _2913 = _2901 * as_type<int>(_2723);
    int _2915 = abs(_2795);
    int _2917 = _2911 * as_type<int>(_2787);
    int _2919 = ~_2619;
    int _2921 = _2919 + 1;
    int _2923 = _2921 + 1;
    int _2925 = ~_2915;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    float _2931 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2933 = int(_2931);
    int _2935 = abs(_2887);
    int _2937 = _2923 * as_type<int>(_2715);
    int _2939 = _2937 + _2913;
    int _2941 = _2929 * as_type<int>(_2779);
    int _2943 = _2941 + _2917;
    int _2945 = ~_2935;
    int _2947 = _2945 + 1;
    int _2949 = _2947 + 1;
    int _2951 = ~_2825;
    int _2953 = _2951 + 1;
    int _2955 = _2953 + 1;
    int _2957 = _2949 * as_type<int>(_2749);
    int _2959 = _2957 + _2943;
    int _2961 = _2955 * as_type<int>(_2811);
    int _2963 = _2961 + _2939;
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2967 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2969 = abs(_2859);
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2973 = -_195;
    int _2975 = _2889 ? as_type<int>(_2973) : as_type<int>(_195);
    float _2977 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2979 = int(_2977);
    bool _2981 = _233 > 0.5;
    float _2983 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2985 = ~_2969;
    int _2987 = _2985 + 1;
    int _2989 = _2987 + 1;
    float _2991 = _2965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2993 = float(uint(_2933));
    float _2995 = _2971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2997 = _2967 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2999 = abs(_2841);
    float _3001 = abs(_1207);
    float _3003 = log2(_3001);
    int _3005 = _2989 * as_type<int>(_2757);
    int _3007 = _3005 + _2959;
    int _3009 = abs(_2933);
    out.m_86.x = _2991;
    out.m_86.y = _2995;
    out.m_86.z = _2997;
    out.m_86.w = _2983;
    int _3011 = ~_2999;
    int _3013 = _3011 + 1;
    int _3015 = _3013 + 1;
    float _3017 = -_199;
    int _3019 = _2981 ? as_type<int>(_3017) : as_type<int>(_199);
    float _3021 = 1.0 / _2993;
    int _3023 = _3015 * as_type<int>(_2819);
    int _3025 = _3023 + _2963;
    int _3027 = abs(_2771);
    bool _3029 = _235 > 0.5;
    float _3031 = float(uint(_2979));
    float _3033 = _3003 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3035 = abs(_2761);
    float _3037 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3039 = ~_3035;
    int _3041 = _3039 + 1;
    int _3043 = _3041 + 1;
    float _3045 = 1.0 / _3031;
    float _3047 = _3037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3049 = _3025 * _3043;
    int _3051 = ~_3027;
    int _3053 = _3051 + 1;
    int _3055 = _3053 + 1;
    float _3057 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3059 = abs(_2979);
    int _3061 = _2687 * _3035;
    int _3063 = _3061 + _3049;
    float _3065 = float(uint(_3009));
    float _3067 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3069 = as_type<int>(_3021) + (-2);
    float _3071 = _911 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3073 = _3007 * _3055;
    float _3075 = float(uint(_3059));
    float _3077 = _911 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3079 = _3057 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3081 = _3067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3083 = exp2(_3033);
    float _3085 = -_903;
    float _3087 = fma(_3085, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3071);
    float _3089 = float(uint(_3063));
    int _3091 = _2895 * _3027;
    int _3093 = _3091 + _3073;
    out.m_88.x = _3047;
    out.m_88.y = _3079;
    out.m_88.z = _3081;
    float _3095 = -_903;
    float _3097 = fma(_3095, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3077);
    float _3099 = -_903;
    float _3101 = fma(_3099, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2823);
    int _3103 = as_type<int>(_3045) + (-2);
    float _3105 = 1.0 / _3065;
    int _3107 = abs(_3063);
    float _3109 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3087);
    int _3111 = ~_2933;
    int _3113 = _3111 + 1;
    float _3115 = _925 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3117 = ~_2979;
    int _3119 = _3117 + 1;
    bool _3121 = !_2905;
    float _3123 = _3121 ? _195 : as_type<float>(_2975);
    float _3125 = 1.0 / _3075;
    float _3127 = as_type<float>(_3069) * _3089;
    float _3129 = float(uint(_3093));
    int _3131 = abs(_3093);
    float _3133 = fma(_3083, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3135 = precise::clamp(_3133, 0.0, 1.0);
    float _3137 = trunc(_3127);
    float _3139 = precise::max(_3137, 0.0);
    uint _3141 = uint(_3139);
    int _3143 = as_type<int>(_3105) + (-2);
    float _3145 = as_type<float>(_3103) * _3129;
    float _3147 = float(uint(_3107));
    float _3149 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3101);
    float _3151 = float(uint(_3131));
    float _3153 = _925 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3155 = _2933 == 0;
    float _3157 = trunc(_3145);
    float _3159 = precise::max(_3157, 0.0);
    uint _3161 = uint(_3159);
    int _3163 = as_type<int>(_3125) + (-2);
    float _3165 = as_type<float>(_3143) * _3147;
    float _3167 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3097);
    float _3169 = _925 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3171 = _1207 <= 8000.0;
    bool _3173 = isnan(_1207);
    bool _3175 = _3171 || _3173;
    bool _3177 = isnan(8000.0);
    bool _3179 = _3175 || _3177;
    float _3181 = float(_3179);
    float _3183 = as_type<float>(_3163) * _3151;
    float _3185 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3153);
    float _3187 = trunc(_3165);
    float _3189 = precise::max(_3187, 0.0);
    uint _3191 = uint(_3189);
    int _3193 = _3113 * int(_3141);
    int _3195 = _3193 + _3063;
    float _3197 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3169);
    float _3199 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3115);
    if (_1362)
    {
        _2593 = 1.0;
    }
    float _3201 = _2593;
    float _3203 = float(uint(_3195));
    float _3205 = _933 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3207 = trunc(_3183);
    float _3209 = precise::max(_3207, 0.0);
    uint _3211 = uint(_3209);
    int _3213 = _3119 * int(_3161);
    int _3215 = _3213 + _3093;
    float _3217 = as_type<float>(_3069) * _3203;
    float _3219 = _933 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3221 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3205);
    float _3223 = float(uint(_3215));
    float _3225 = _933 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3227 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3219);
    int _3229 = ~int(_3191);
    int _3231 = _3229 + 1;
    float _3233 = trunc(_3217);
    float _3235 = precise::max(_3233, 0.0);
    uint _3237 = uint(_3235);
    float _3239 = fma(_917, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3225);
    float _3241 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3227);
    int _3243 = ~int(_3211);
    int _3245 = _3243 + 1;
    int _3247 = _3231 * _3009;
    int _3249 = _3247 + _3107;
    float _3251 = as_type<float>(_3103) * _3223;
    float _3253 = fma(_3135, -2.0, 3.0);
    float _3255 = _3135 * _3135;
    float _3257 = float(uint(_3249));
    int _3259 = _3245 * _3059;
    int _3261 = _3259 + _3131;
    float _3263 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3221);
    float _3265 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3239);
    float _3267 = trunc(_3251);
    float _3269 = precise::max(_3267, 0.0);
    uint _3271 = uint(_3269);
    float _3273 = as_type<float>(_3143) * _3257;
    float _3275 = float(uint(_3261));
    float _3277 = _3255 * _3253;
    int _3279 = int(_3141) + int(_3237);
    float _3281 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3197);
    float _3283 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3199);
    float _3285 = as_type<float>(_3163) * _3275;
    float _3287 = trunc(_3273);
    float _3289 = precise::max(_3287, 0.0);
    uint _3291 = uint(_3289);
    float _3293 = fma(_937, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3185);
    int _3295 = ~_2933;
    int _3297 = _3295 + 1;
    float _3299 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3301 = !_2863;
    float _3303 = _3301 ? _199 : as_type<float>(_3019);
    float _3305 = -_195;
    int _3307 = _3029 ? as_type<int>(_3305) : as_type<int>(_195);
    int _3309 = _3297 * _3279;
    int _3311 = _3309 + _3063;
    float _3313 = trunc(_3285);
    float _3315 = precise::max(_3313, 0.0);
    uint _3317 = uint(_3315);
    float _3319 = _3299 * _3109;
    bool _3321 = !_2867;
    float _3323 = _3321 ? _195 : as_type<float>(_3307);
    float _3325 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3327 = uint(_3311) >= uint(_2933);
    out.m_90.x = _3293;
    out.m_90.y = _3281;
    out.m_90.z = _3283;
    int _3329 = ~_2979;
    int _3331 = _3329 + 1;
    float _3333 = fma(_3325, _3293, _3319);
    int _3335 = int(_3191) + int(_3291);
    float _3337 = _3299 * _3167;
    int _3339 = int(_3161) + int(_3271);
    float _3341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3343 = ~_3335;
    int _3345 = _3343 + 1;
    float _3347 = fma(_3325, _3281, _3337);
    int _3349 = int(_3211) + int(_3317);
    int _3351 = _3331 * _3339;
    int _3353 = _3351 + _3093;
    bool _3355 = !_3327;
    int _3357 = _3355 ? 0 : (-1);
    float _3359 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2037);
    int _3361 = ~_3349;
    int _3363 = _3361 + 1;
    int _3365 = ~_3279;
    int _3367 = _3365 + _3357;
    int _3369 = _3367 + 1;
    int _3371 = _3345 * _3009;
    int _3373 = _3371 + _3107;
    bool _3375 = uint(_3353) >= uint(_2979);
    float _3377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3379 = _3363 * _3059;
    int _3381 = _3379 + _3131;
    float _3383 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3359);
    int _3385 = _2933 * _3369;
    int _3387 = _3385 + _3063;
    bool _3389 = uint(_3373) >= uint(_3009);
    float _3391 = _3263 + _3347;
    bool _3393 = !_3375;
    int _3395 = _3393 ? 0 : (-1);
    out.gl_Position.x = _1872;
    out.gl_Position.y = _1876;
    out.gl_Position.z = _3383;
    out.gl_Position.w = _1750;
    bool _3397 = !_3155;
    int _3399 = _3397 ? _3387 : (-1);
    bool _3401 = uint(_3381) >= uint(_3059);
    float _3403 = _3341 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3405 = float(_3399);
    float _3407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3409 = _2933 == 0;
    int _3411 = _3063 ^ _2933;
    float _3413 = fma(_3403, _3405, _305);
    int _3415 = ~_3339;
    int _3417 = _3415 + _3395;
    int _3419 = _3417 + 1;
    bool _3421 = !_3401;
    int _3423 = _3421 ? 0 : (-1);
    int _3425 = _3093 ^ _2979;
    int _3427 = _2979 * _3419;
    int _3429 = _3427 + _3093;
    bool _3431 = !_3389;
    int _3433 = _3431 ? 0 : (-1);
    uint _3435 = uint(int(uint(_3411) >> uint(31)));
    int _3437 = ~_3423;
    int _3439 = _3349 + _3437;
    int _3441 = _3439 + 1;
    float _3443 = _3377 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3445 = _2979 == 0;
    float _3447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3449 = _2979 == 0;
    uint _3451 = uint(int(uint(_3425) >> uint(31)));
    float _3453 = fma(_3299, _3299, 1.0);
    int _3455 = ~_3433;
    int _3457 = _3335 + _3455;
    int _3459 = _3457 + 1;
    int _3461 = ~int(_3435);
    int _3463 = _3461 + 1;
    float _3465 = rsqrt(_3453);
    bool _3467 = !_3445;
    int _3469 = _3467 ? _3429 : (-1);
    int _3471 = ~int(_3451);
    int _3473 = _3471 + 1;
    int _3475 = _3459 ^ _3463;
    float _3477 = float(_3469);
    int _3479 = _3441 ^ _3473;
    float _3481 = _2731 + (-0.5);
    int _3483 = ~_3463;
    int _3485 = _3483 + _3475;
    int _3487 = _3485 + 1;
    float _3489 = _3123 + 0.5;
    float _3491 = fma(_3443, _3477, _699);
    int _3493 = ~_3473;
    int _3495 = _3493 + _3479;
    int _3497 = _3495 + 1;
    bool _3499 = !_3409;
    int _3501 = _3499 ? _3487 : (-1);
    float _3503 = fma(_3403, _3489, _3413);
    float _3505 = _3323 + 0.5;
    bool _3507 = !_3449;
    int _3509 = _3507 ? _3497 : (-1);
    float _3511 = _3407 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3513 = float(_3501);
    float _3515 = fma(_3443, _3505, _3491);
    float _3517 = float(_3509);
    float _3519 = _3447 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3521 = _3303 + (-0.5);
    float _3523 = -_311;
    float _3525 = fma(_3511, _3513, _3523);
    float _3527 = _3299 * _3465;
    float _3529 = -_701;
    float _3531 = fma(_3519, _3517, _3529);
    float _3533 = -_2049;
    float _3535 = fma(_3323, _3533, _3515);
    float _3537 = -_3511;
    float _3539 = fma(_3537, _3521, _3525);
    float _3541 = -_3263;
    float _3543 = _3527 * _3541;
    float _3545 = -_3519;
    float _3547 = fma(_3545, _3481, _3531);
    float _3549 = -_693;
    float _3551 = _3549 + 1.0;
    float _3553 = _3201;
    if (!_1848)
    {
        _703 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3555 = _703;
    float _3557 = fma(_3465, _3167, _3543);
    float _3559 = -_3241;
    float _3561 = _3527 * _3559;
    float _3563 = -_3265;
    float _3565 = _3527 * _3563;
    float _3567 = -_509;
    float _3569 = _3567 + 1.0;
    float _3571 = -_3551;
    float _3573 = fma(_3123, _3571, _3503);
    float _3575 = _3299 * _3149;
    float _3577 = fma(_3303, _2033, _3539);
    float _3579 = fma(_3465, _3109, _3561);
    float _3581 = fma(_3465, _3149, _3565);
    int _3583 = as_type<int>(_3555);
    if (!_1848)
    {
        float _3585 = _3555 * 5.0;
        _3583 = as_type<int>(_3585);
    }
    int _3587 = _3583;
    float _3589 = fma(_2731, _3569, _3547);
    float _3591 = -_3277;
    float _3593 = _3591 + 1.0;
    out.m_92.x = _3579;
    out.m_92.y = _3557;
    out.m_92.z = _3581;
    float _3595 = fma(_3325, _3283, _3575);
    if (!_1864)
    {
        _1890 = 1.0;
    }
    float _3597 = _1890;
    float _3599 = fma(_3593, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3277);
    float _3601 = _3597;
    if (!_1848)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9398 = as_type<float>(_3587);
        out.gl_Position.z = _9398;
    }
    float _3603 = _3241 + _3333;
    float _3605 = _3265 + _3595;
    float _3607 = _3181 * _3599;
    out.m_94.x = _3573;
    out.m_94.y = _3577;
    out.m_94.z = _3535;
    out.m_94.w = _3589;
    if (_1864)
    {
        bool _3609 = _1988 >= _1896;
        bool _3611 = isnan(_1988);
        bool _3613 = _3609 || _3611;
        bool _3615 = isnan(_1896);
        bool _3617 = _3613 || _3615;
        float _3619 = float(_3617);
        _3601 = _3619;
    }
    float _3621 = _3601;
    float _3623 = _3607 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3625 = _2571 * _3623;
    float _3627 = precise::clamp(_3625, 0.0, 1.0);
    float _3629 = _3623;
    float _3631 = _3621;
    if (!_1362)
    {
        int _3633 = _1394 << 4;
        int _3635 = _3633 + 2048;
        uint _3637 = uint(int(uint(_3635) >> uint(2)));
        uint _3639 = uint(int(uint(int(_3637)) >> uint(2)));
        int _3641 = int(_3637) & 3;
        float _3643 = (*spvDescriptorSet0.vp_c15)._m0[int(_3639)][_3641];
        int _3645 = int(_3637) + 1;
        uint _3647 = uint(int(uint(_3645) >> uint(2)));
        int _3649 = _3645 & 3;
        float _3651 = (*spvDescriptorSet0.vp_c15)._m0[int(_3647)][_3649];
        int _3653 = _3635 + 8;
        uint _3655 = uint(int(uint(_3653) >> uint(2)));
        uint _3657 = uint(int(uint(int(_3655)) >> uint(2)));
        int _3659 = int(_3655) & 3;
        float _3661 = (*spvDescriptorSet0.vp_c15)._m0[int(_3657)][_3659];
        int _3663 = int(_3655) + 1;
        uint _3665 = uint(int(uint(_3663) >> uint(2)));
        int _3667 = _3663 & 3;
        float _3669 = (*spvDescriptorSet0.vp_c15)._m0[int(_3665)][_3667];
        float _3671 = _1045 * _3651;
        float _3673 = fma(_959, _3643, _3671);
        float _3675 = fma(_889, _3661, _3673);
        float _3677 = _3675 + _3669;
        float _3679 = precise::clamp(_3677, 0.0, 1.0);
        float _3681 = -_3679;
        float _3683 = _3681 + _2017;
        float _3685 = fma(_3683, 500.0, 1.5);
        float _3687 = exp2(_3685);
        float _3689 = 0.0 + _3687;
        float _3691 = precise::clamp(_3689, 0.0, 1.0);
        _3553 = _3691;
        _3629 = _3669;
    }
    float _3693 = _3553;
    float _3695 = _3629;
    float _3697 = -_2089;
    float _3699 = _3697 + 1.0;
    float _3701 = _3621 * _3693;
    float _3703 = -_3627;
    float _3705 = fma(_3703, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_96.x = _3603;
    out.m_96.y = _3391;
    out.m_96.z = _3605;
    float _3707 = _3699 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3709 = _1155 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3711 = isnan(_1155);
    bool _3713 = _3709 || _3711;
    bool _3715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3717 = _3713 || _3715;
    float _3719 = -_3701;
    float _3721 = fma(_3719, _3705, 1.0);
    float _3723 = precise::clamp(_3721, 0.0, 1.0);
    float _3725 = _3707 * _1992;
    float _3727 = -_3707;
    float _3729 = _3727 + 1.0;
    float _3731 = _3723 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3733 = _1828 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3735 = _2003 * _3725;
    float _3737 = _2011 * _3725;
    float _3739 = _2003 * _3729;
    out.m_98.x = _3731;
    float _3741 = fma(_2007, _3735, _1997);
    float _3743 = fma(_2009, _3735, _1999);
    float _3745 = fma(_2003, _3737, _2001);
    float _3747 = _3733;
    float _3749 = _3695;
    float _3751 = _3735;
    float _3753 = _3731;
    if (!_1848)
    {
        _3747 = 0.0;
    }
    float _3755 = _3747;
    if (!_3717)
    {
        _3749 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3757 = _3749;
    out.m_100.x = _3741;
    out.m_100.y = _3743;
    out.m_100.z = _3745;
    out.m_100.w = _3739;
    float _3759 = _3757;
    float _3761 = _3757;
    if (!_3717)
    {
        _1892 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3763 = _1892;
    float _3765 = _3763;
    float _3767 = _3763;
    if (!_3717)
    {
        _3631 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3769 = _3631;
    float _3771 = _3769;
    float _3773 = _3769;
    if (!_3717)
    {
        _2595 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3775 = _2595;
    float _3777 = _3775;
    float _3779 = _3775;
    if (!_3717)
    {
        _3751 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3781 = _3751;
    float _3783 = _3781;
    float _3785 = _3781;
    if (!_3717)
    {
        _3753 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3787 = _3753;
    bool _3789 = !_3717;
    float _3791 = _3787;
    float _3793 = _3787;
    if (!_3789)
    {
        bool _3795 = _1155 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3797 = isnan(_1155);
        bool _3799 = _3795 || _3797;
        bool _3801 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3803 = _3799 || _3801;
        if (!_3803)
        {
            float _3805 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3807 = _1155 + _3805;
            float _3809 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3811 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3809;
            float _3813 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3815 = _3813 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3817 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3819 = _3817 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3821 = 1.0 / _3811;
            float _3823 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3825 = _3823 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3827 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3829 = _3827 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3831 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3833 = _3831 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3835 = _3807 * _3821;
            float _3837 = precise::clamp(_3835, 0.0, 1.0);
            float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3841 = _3839 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3843 = fma(_3837, _3815, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3845 = fma(_3837, _3819, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3847 = fma(_3837, _3841, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3849 = fma(_3837, _3825, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3851 = fma(_3837, _3829, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3853 = fma(_3837, _3833, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3785 = _3843;
            _3767 = _3851;
            _3779 = _3845;
            _3761 = _3849;
            _3793 = _3847;
            _3773 = _3853;
            _3855 = true;
        }
        else
        {
            bool _3857 = _1155 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3859 = isnan(_1155);
            bool _3861 = _3857 || _3859;
            bool _3863 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3865 = _3861 || _3863;
            if (!_3865)
            {
                _3759 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3867 = _3759;
            _3761 = _3867;
            if (!_3865)
            {
                _3765 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3869 = _3765;
            _3767 = _3869;
            if (!_3865)
            {
                _3771 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3871 = _3771;
            _3773 = _3871;
            if (!_3865)
            {
                _3777 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3873 = _3777;
            _3779 = _3873;
            if (!_3865)
            {
                _3783 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3875 = _3783;
            _3785 = _3875;
            if (!_3865)
            {
                _3791 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3877 = _3791;
            bool _3879 = !_3865;
            _3793 = _3877;
            if (!_3879)
            {
                bool _3881 = _1155 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3883 = isnan(_1155);
                bool _3885 = _3881 || _3883;
                bool _3887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3889 = _3885 || _3887;
                if (!_3889)
                {
                    float _3891 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3893 = _1155 + _3891;
                    float _3895 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3897 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3895;
                    float _3899 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3901 = _3899 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3905 = _3903 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3907 = 1.0 / _3897;
                    float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3911 = _3909 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3919 = _3917 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3921 = _3893 * _3907;
                    float _3923 = precise::clamp(_3921, 0.0, 1.0);
                    float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3929 = fma(_3923, _3901, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3931 = fma(_3923, _3905, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3933 = fma(_3923, _3927, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3935 = fma(_3923, _3911, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3937 = fma(_3923, _3915, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3939 = fma(_3923, _3919, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3785 = _3929;
                    _3767 = _3937;
                    _3779 = _3931;
                    _3761 = _3935;
                    _3793 = _3933;
                    _3773 = _3939;
                    _3855 = true;
                }
                else
                {
                    _3785 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3767 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3779 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3761 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3793 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3773 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3855 = false;
    float _3941 = _3785;
    float _3943 = _3767;
    float _3945 = _3779;
    float _3947 = _3761;
    float _3949 = _3793;
    float _3951 = _3773;
    float _3953 = fma(_3391, -0.5, 0.5);
    float _3955 = precise::clamp(_3953, 0.0, 1.0);
    float _3957 = -_3941;
    float _3959 = _3943 + _3957;
    float _3961 = -_3945;
    float _3963 = _3947 + _3961;
    float _3965 = -_3949;
    float _3967 = _3951 + _3965;
    bool _3969 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3971 = fma(_3955, _3959, _3941);
    float _3973 = fma(_3955, _3963, _3945);
    float _3975 = fma(_3955, _3967, _3949);
    float _3977 = _3755 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3979 = _3971 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _3981 = fma(_3973, 0.298911988735198974609375, _3979);
    out.m_98.w = _3977;
    float _3983 = fma(_3975, 0.114477999508380889892578125, _3981);
    out.m_102.x = 0.0;
    float _3985 = -_3983;
    float _3987 = _3973 + _3985;
    float _3989 = -_3983;
    float _3991 = _3971 + _3989;
    float _3993 = -_3983;
    float _3995 = _3975 + _3993;
    float _3997 = fma(_3987, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3983);
    float _3999 = fma(_3991, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3983);
    float _4001 = fma(_3995, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3983);
    out.m_104.x = _3997;
    out.m_104.y = _3999;
    out.m_104.z = _4001;
    if (!_3969)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4003 = -_1099;
    float _4005 = _4003 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4007 = -_1115;
    float _4009 = _4007 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4011 = -_1119;
    float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4015 = _4005 * _4005;
    float _4017 = fma(_4009, _4009, _4015);
    float _4019 = fma(_4013, _4013, _4017);
    float _4021 = sqrt(_4019);
    float _4023 = rsqrt(_4019);
    float _4025 = -_4021;
    float _4027 = _4025 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4029 = _4027 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4031 = precise::clamp(_4029, 0.0, 1.0);
    float _4033 = _4009 * _4023;
    float _4035 = _4005 * _4023;
    float _4037 = abs(_4031);
    float _4039 = log2(_4037);
    float _4041 = _4013 * _4023;
    float _4043 = _4033 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4045 = _3391 * _4035;
    float _4047 = -_4035;
    float _4049 = -_4043;
    float _4051 = fma(_4047, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4049);
    float _4053 = fma(_3603, _4033, _4045);
    float _4055 = -_4041;
    float _4057 = fma(_4055, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4051);
    float _4059 = fma(_3605, _4041, _4053);
    float _4061 = precise::clamp(_4059, 0.0, 1.0);
    float _4063 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4065 = _4057 + _4063;
    float _4067 = _4039 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4069 = _4065 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4071 = precise::clamp(_4069, 0.0, 1.0);
    float _4073 = exp2(_4067);
    float _4075 = _4073 * _4071;
    float _4077 = _4061 * _4075;
    float _4079 = _4077 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4081 = _4077 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4083 = _4077 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _4079;
    out.m_102.y = _4081;
    out.m_102.z = _4083;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

