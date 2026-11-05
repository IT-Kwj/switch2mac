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
    texture2d_array<float> vp_t_tcb_16 [[id(6)]];
    sampler vp_t_tcb_16Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_20 [[id(8)]];
    sampler vp_t_tcb_20Smplr [[id(9)]];
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
    float4 m_82 [[user(locn0)]];
    float4 m_84 [[user(locn1)]];
    float4 m_92 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_102 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_94 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_100 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 m_98 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3673 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_58.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_61.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3958 = as_type<float>(_137);
        out.gl_Position.z = _3958;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_63.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = _155;
    if (_151)
    {
        float _159 = float(_121);
        _131 = _159;
    }
    float _161 = _131;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    float _169 = _161;
    if (_167)
    {
        _169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _169;
    if (_167)
    {
        out.m_61.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4028 = as_type<float>(_175);
        out.gl_Position.z = _4028;
    }
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _215;
    if (!_197)
    {
        float _199 = in.m_68.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        float _219 = float(_121);
        float _221 = 1.0 / _219;
        float _223 = _155 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = in.m_68.x;
    float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _231 = log2(_229);
    float _233 = in.m_68.y;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _237 = in.m_68.z;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    int _243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _245 = _243 != 0;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _249 = 1.0 / _241;
    float _251 = _231 * _155;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = _225 + _253;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _261 = _227 * 2.0;
    float _263 = exp2(_251);
    float _265 = _233 * 2.0;
    float _267 = -_235;
    float _269 = fma(_259, 2.0, _267);
    float _271 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _273 = _227 + _233;
    float _275 = _237 * 2.0;
    float _277 = _255 * _249;
    float _279 = floor(_261);
    float _281 = fma(_271, -2.0, _247);
    float _283 = _273 + (-1.0);
    int _285 = as_type<int>(_273);
    if (_245)
    {
        _285 = 0;
    }
    int _287 = _285;
    float _289 = -_155;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[76].x, _269);
    int _293 = _287;
    if (!_245)
    {
        _293 = 1;
    }
    int _295 = _293;
    float _297 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _299 = floor(_265);
    float _301 = _227 + _237;
    bool _303 = _295 != 1;
    float _305 = _237 + _233;
    float _307 = -_263;
    float _309 = _307 + 1.0;
    float _311 = _301 + (-1.0);
    float _313 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _281);
    float _315 = floor(_275);
    bool _317 = _279 >= 0.0;
    bool _319 = isnan(_279);
    bool _321 = _317 || _319;
    bool _323 = isnan(0.0);
    bool _325 = _321 || _323;
    float _327 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _329 = _279 > 0.0;
    float _331 = _305 + (-1.0);
    int _333 = _325 ? 0 : 1;
    bool _335 = _299 >= 0.0;
    bool _337 = isnan(_299);
    bool _339 = _335 || _337;
    bool _341 = isnan(0.0);
    bool _343 = _339 || _341;
    bool _345 = _299 > 0.0;
    float _347 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _349 = _343 ? 0 : 1;
    float _351 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _353 = int(_351);
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _357 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (!_303)
    {
        _355 = _237;
    }
    float _359 = _355;
    bool _361 = _315 > 0.0;
    bool _363 = _315 >= 0.0;
    bool _365 = isnan(_315);
    bool _367 = _363 || _365;
    bool _369 = isnan(0.0);
    bool _371 = _367 || _369;
    int _373 = ~_349;
    int _375 = _373 + 1;
    int _377 = _375 + 1;
    int _379 = _371 ? 0 : 1;
    float _381 = _359;
    int _383 = _377;
    float _385 = _315;
    if (_303)
    {
        _381 = _233;
    }
    float _387 = _381;
    int _389 = ~_379;
    int _391 = _389 + 1;
    int _393 = _391 + 1;
    int _395 = _393;
    if (!_345)
    {
        int _397 = ~_349;
        int _399 = _397 + 1;
        _383 = _399;
    }
    int _401 = _383;
    if (!_361)
    {
        int _403 = ~_379;
        int _405 = _403 + 1;
        _395 = _405;
    }
    int _407 = _395;
    float _409 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[83].w, _257);
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _413 = _411 != 0;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _417 = _415 != 0;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _421 = _419 != 0;
    float _423 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _409);
    if (!_303)
    {
        _385 = _233;
    }
    float _425 = _385;
    bool _427 = !_417;
    int _429 = _427 ? 0 : 1;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _433 = !_413;
    int _435 = _433 ? 0 : 1;
    bool _437 = !_421;
    int _439 = _437 ? 0 : 1;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _451 = _449 != 0;
    float _453 = _425;
    if (_303)
    {
        _453 = _227;
    }
    float _455 = _453;
    float _457 = float(_121);
    bool _459 = !_443;
    int _461 = _459 ? 0 : 1;
    float _463 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[83].z, _431);
    float _465 = 1.0 / _457;
    int _467 = ~_333;
    int _469 = _467 + 1;
    int _471 = _469 + 1;
    int _473 = _471;
    float _475 = _455;
    float _477 = _457;
    if (!_329)
    {
        int _479 = ~_333;
        int _481 = _479 + 1;
        _473 = _481;
    }
    int _483 = _473;
    float _485 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _463);
    if (!_303)
    {
        _475 = _233;
    }
    float _487 = _475;
    float _489 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _491 = int(_489);
    float _493 = _487;
    if (!_303)
    {
        _477 = _237;
    }
    float _495 = _477;
    float _497 = _495;
    if (_303)
    {
        _497 = _233;
    }
    float _499 = _497;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_303)
    {
        _493 = _227;
    }
    float _503 = _493;
    int _505 = abs(_461);
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _509 = !_447;
    int _511 = _509 ? 0 : 1;
    float _513 = _503 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _515 = float(_505);
    float _517 = _465 * _155;
    float _519 = float(_407);
    float _521 = -_501;
    float _523 = fma(_513, 2.0, _521);
    int _525 = abs(_511);
    float _527 = float(_483);
    float _529 = _515 * _519;
    float _531 = in.m_70.x;
    float _533 = in.m_70.y;
    float _535 = in.m_70.z;
    float _537 = float(_491);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _541 = 1.0 + _539;
    float _543 = float(_353);
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _547 = 1.0 / _537;
    bool _549 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _551 = isnan(1.0);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _557 = _553 || _555;
    float _559 = -_155;
    float _561 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[81].x, _523);
    float _563 = fma(_507, -2.0, _545);
    bool _565 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _567 = isnan(0.0);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _573 = _569 || _571;
    float _575 = 1.0 / _543;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _579 = _573 ? _309 : 0.0;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _583 = 1.0 / _541;
    float _585 = float(_525);
    float _587 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[78].z, _581);
    float _589 = _529 * (-2.0);
    float _591 = _547 * _155;
    float _593 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _563);
    float _595 = _585 * _527;
    float _597 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _577);
    float _599 = _227 + (-0.5);
    float _601 = fma(_589, _531, _531);
    float _603 = fma(_297, _589, _297);
    float _605 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _597);
    float _607 = _595 * (-2.0);
    float _609 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[196].x, _601);
    bool _611 = !_451;
    int _613 = _611 ? 0 : 1;
    float _615 = _575 * _155;
    float _617 = fma(_347, _607, _347);
    float _619 = fma(_607, _533, _533);
    int _621 = abs(_613);
    float _623 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _587);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _625;
    if (_557)
    {
        float _629 = _579 * _583;
        _157 = _629;
    }
    float _631 = _157;
    float _633 = _233 + (-0.5);
    float _635 = float(_401);
    float _637 = fma(_603, _631, _609);
    float _639 = float(_621);
    float _641 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[196].y, _619);
    float _643 = _637 * 0.15915493667125701904296875;
    bool _645 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _647 = isnan(_225);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = _639 * _635;
    float _659 = fma(_617, _631, _641);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _661;
    float _665 = fma(_627, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _667 = _657 * (-2.0);
    float _669 = in.m_72.x;
    float _671 = in.m_72.y;
    float _673 = fma(_663, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _675 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _677 = isnan(_225);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -_655;
    float _689 = _687 + 1.0;
    float _691 = in.m_58.x;
    float _693 = in.m_58.y;
    float _695 = in.m_58.z;
    float _697 = fma(_667, _535, _535);
    float _699 = _237 + (-0.5);
    float _701 = _659 * 0.15915493667125701904296875;
    float _703 = in.m_74.x;
    float _705 = in.m_74.y;
    float _707 = in.m_74.z;
    float _709 = in.m_74.w;
    float _711 = _685 * _689;
    float _713 = fma(_327, _667, _327);
    float _715 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[196].z, _697);
    float _717 = -_685;
    float _719 = _717 + 1.0;
    float _721 = _665 * _711;
    float _723 = _673 * _711;
    float _725 = fma(_713, _631, _715);
    float _727 = _643 * 6.283185482025146484375;
    float _729 = sin(_727);
    float _731 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[143].x, _721);
    float _733 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[143].y, _723);
    float _735 = _725 * 0.15915493667125701904296875;
    float _737 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].x, _731);
    float _739 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].y, _733);
    float _741 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _743 = _643 * 6.283185482025146484375;
    float _745 = cos(_743);
    float _747 = _737 * _669;
    float _749 = _739 * _671;
    float _751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _755 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _757 = _701 * 6.283185482025146484375;
    float _759 = sin(_757);
    float _761 = _693 * _705;
    float _763 = _749 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _765 = _755 * _751;
    float _767 = fma(_691, _703, _761);
    float _769 = _763 * _753;
    float _771 = in.m_76.x;
    float _773 = in.m_76.y;
    float _775 = in.m_76.z;
    float _777 = in.m_76.w;
    float _779 = _701 * 6.283185482025146484375;
    float _781 = cos(_779);
    float _783 = fma(_695, _707, _767);
    float _785 = _735 * 6.283185482025146484375;
    float _787 = cos(_785);
    float _789 = _729 * _759;
    float _791 = _745 * _759;
    float _793 = _783 + _709;
    float _795 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _797 = _735 * 6.283185482025146484375;
    float _799 = sin(_797);
    float _801 = _745 * _781;
    float _803 = _729 * _781;
    float _805 = _693 * _773;
    float _807 = _745 * _787;
    float _809 = _729 * _787;
    float _811 = _781 * _787;
    float _813 = _759 * _787;
    float _815 = _807 * _769;
    float _817 = fma(_691, _771, _805);
    float _819 = fma(_799, _801, _789);
    float _821 = -_769;
    float _823 = _799 * _821;
    float _825 = -_803;
    float _827 = fma(_799, _791, _825);
    float _829 = -_791;
    float _831 = fma(_799, _803, _829);
    float _833 = fma(_819, _765, _815);
    float _835 = _809 * _769;
    float _837 = fma(_811, _765, _823);
    float _839 = fma(_799, _789, _801);
    float _841 = fma(_827, _741, _833);
    float _843 = fma(_831, _765, _835);
    float _845 = fma(_813, _741, _837);
    float _847 = fma(_695, _775, _817);
    float _849 = _841 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _851 = fma(_839, _741, _843);
    float _853 = _841 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _855 = _847 + _777;
    float _857 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].x, _849);
    float _859 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].x, _853);
    float _861 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].z, _857);
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].z, _859);
    float _865 = _861 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _867 = _863 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _869 = _793 + _865;
    float _871 = _855 + _867;
    float _873 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _875 = _869 + _873;
    float _877 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _879 = _871 + _877;
    float _881 = _875 * _875;
    float _883 = fma(_879, _879, _881);
    float _885 = in.m_78.x;
    float _887 = in.m_78.y;
    float _889 = in.m_78.z;
    float _891 = in.m_78.w;
    float _893 = sqrt(_883);
    bool _895 = _893 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _897 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _899 = _893 + _897;
    float _901 = _693 * _887;
    float _903 = fma(_691, _885, _901);
    float _905 = _801;
    float _907 = _899;
    float _909 = _783;
    float _911 = _695;
    float _913 = _871;
    float _915 = _869;
    int _917 = 2;
    if (_895)
    {
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _905 = _919;
    }
    float _921 = _905;
    float _923 = fma(_695, _889, _903);
    float _925 = _923 + _891;
    if (_895)
    {
        float _927 = _899 * _921;
        _907 = _927;
    }
    float _929 = _907;
    if (_895)
    {
        float _931 = _929 * 0.15915493667125701904296875;
        _909 = _931;
    }
    float _933 = _909;
    float _935 = _841 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _937 = _921;
    if (_895)
    {
        float _939 = _933 * 6.283185482025146484375;
        float _941 = cos(_939);
        _937 = _941;
    }
    float _943 = _937;
    float _945 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].x, _935);
    float _947 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].z, _945);
    float _949 = _691;
    if (_895)
    {
        float _951 = _933 * 6.283185482025146484375;
        float _953 = sin(_951);
        _949 = _953;
    }
    float _955 = _949;
    float _957 = _947 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _959 = _925 + _957;
    float _961 = _851;
    float _963 = _957;
    float _965 = _959;
    if (_895)
    {
        float _967 = rsqrt(_883);
        _961 = _967;
    }
    float _969 = _961;
    if (_895)
    {
        float _971 = _959 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _963 = _971;
    }
    float _973 = _963;
    if (_895)
    {
        float _975 = _943 + (-1.0);
        _911 = _975;
    }
    float _977 = _911;
    float _979 = _977;
    if (_895)
    {
        float _981 = _977 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _979 = _981;
    }
    float _983 = _979;
    float _985 = _955;
    if (_895)
    {
        float _987 = fma(_955, _973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _985 = _987;
    }
    float _989 = _985;
    float _991 = _989;
    if (_895)
    {
        float _993 = fma(_959, _943, _983);
        _965 = _993;
    }
    float _995 = _965;
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _999 = _995 + _997;
    if (_895)
    {
        float _1001 = _969 * _989;
        _991 = _1001;
    }
    float _1003 = _991;
    float _1005 = _999 * _999;
    if (_895)
    {
        float _1007 = fma(_879, _1003, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _913 = _1007;
    }
    float _1009 = _913;
    if (_895)
    {
        float _1011 = fma(_875, _1003, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _915 = _1011;
    }
    float _1013 = _915;
    float _1015 = _925 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1019 = _1009 + _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1023 = _1013 + _1021;
    float _1025 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1015);
    float _1027 = fma(_1019, _1019, _1005);
    float _1029 = fma(_1023, _1023, _1027);
    float _1031 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1025);
    float _1033 = _925 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1035 = rsqrt(_1029);
    float _1037 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1039 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1033);
    float _1041 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1039);
    float _1043 = 1.0 / _1037;
    float _1045 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1047 = _1045 + _1037;
    float _1049 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1051 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1053 = sqrt(_1029);
    float _1055 = _1019 * _1049;
    float _1057 = _1023 * _1049;
    float _1059 = _925 + _1051;
    float _1061 = _1055 * _1055;
    float _1063 = _1057 * _1057;
    float _1065 = _1047 * _1043;
    float _1067 = _1065 * 0.5;
    float _1069 = _1059 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1071 = _1059 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1073 = _1061 + _1063;
    float _1075 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1077 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1075);
    float _1079 = fma(_855, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1069);
    float _1081 = fma(_855, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1071);
    float _1083 = sqrt(_1073);
    float _1085 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1079);
    float _1087 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1081);
    float _1089 = _1085 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1091 = 1.0 / _1077;
    float _1093 = _1087 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1095 = _1083 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1099 = _1083 + _1097;
    float _1101 = trunc(_1089);
    int _1103 = int(_1101);
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1107 = _1091 * _1105;
    float _1109 = trunc(_1093);
    int _1111 = int(_1109);
    bool _1113 = _1107 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1115 = _1107 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1117 = !_1113;
    int _1119 = _1117 ? 0 : 1;
    float _1121 = _933;
    float _1123 = _1073;
    float _1125 = as_type<float>(_1119);
    float _1127 = _1055;
    float _1129 = _1057;
    float _1131 = _1061;
    float _1133 = _1063;
    if (_1095)
    {
        float _1135 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1121 = _1135;
    }
    float _1137 = _1121;
    int _1139 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1141 = _1103 + _1139;
    int _1143 = _1141 + 1;
    int _1145 = _1143;
    if (!_1113)
    {
        _917 = 1;
    }
    int _1147 = _917;
    int _1149 = _1147;
    if (_1095)
    {
        float _1151 = rsqrt(_1073);
        _1123 = _1151;
    }
    float _1153 = _1123;
    float _1155 = _1153;
    if (!_1115)
    {
        _1149 = _1119;
    }
    int _1157 = _1149;
    bool _1159 = _1143 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1161 = _1157 << 6;
    if (_1095)
    {
        float _1163 = _1099 * _1137;
        _1125 = _1163;
    }
    float _1165 = _1125;
    int _1167 = _1161 + 96;
    uint _1170 = uint(int(uint(_1167) >> uint(2)));
    uint _1172 = uint(int(uint(int(_1170)) >> uint(2)));
    int _1174 = int(_1170) & 3;
    float _1176 = (*spvDescriptorSet0.vp_c15)._m0[int(_1172)][_1174];
    int _1178 = int(_1170) + 1;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    int _1182 = _1178 & 3;
    float _1184 = (*spvDescriptorSet0.vp_c15)._m0[int(_1180)][_1182];
    float _1186 = 0.0;
    if (_1095)
    {
        float _1188 = _1165 * 0.15915493667125701904296875;
        _1186 = _1188;
    }
    float _1190 = _1186;
    float _1192 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1194 = 0.0;
    if (_1095)
    {
        float _1196 = _1190 * 6.283185482025146484375;
        float _1198 = sin(_1196);
        _1194 = _1198;
    }
    float _1200 = _1194;
    int _1202 = _1161 + 48;
    uint _1204 = uint(int(uint(_1202) >> uint(2)));
    uint _1206 = uint(int(uint(int(_1204)) >> uint(2)));
    int _1208 = int(_1204) & 3;
    float _1210 = (*spvDescriptorSet0.vp_c15)._m0[int(_1206)][_1208];
    int _1212 = int(_1204) + 1;
    uint _1214 = uint(int(uint(_1212) >> uint(2)));
    int _1216 = _1212 & 3;
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[int(_1214)][_1216];
    float _1220 = precise::max(0.0, _1192);
    float _1222 = 0.0;
    if (_1095)
    {
        float _1224 = _1190 * 6.283185482025146484375;
        float _1226 = cos(_1224);
        _1222 = _1226;
    }
    float _1228 = _1222;
    float _1230 = -_1049;
    float _1232 = -_1220;
    float _1234 = fma(_999, _1230, _1232);
    int _1236 = _1161 + 64;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    uint _1240 = uint(int(uint(int(_1238)) >> uint(2)));
    int _1242 = int(_1238) & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    int _1246 = int(_1238) + 1;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    int _1250 = _1246 & 3;
    float _1252 = (*spvDescriptorSet0.vp_c15)._m0[int(_1248)][_1250];
    float _1254 = fma(_855, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _1256 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1258 = _1111 + _1256;
    int _1260 = _1258 + 1;
    float _1262 = 0.0;
    if (_1095)
    {
        float _1264 = _1234 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1262 = _1264;
    }
    float _1266 = _1262;
    int _1268 = _1143 | _1260;
    float _1270 = _1266;
    float _1272 = as_type<float>(_1268);
    float _1274 = _1200;
    if (_1095)
    {
        float _1276 = fma(_1200, _1266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1270 = _1276;
    }
    float _1278 = _1270;
    int _1280 = _1161 + 56;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    uint _1284 = uint(int(uint(int(_1282)) >> uint(2)));
    int _1286 = int(_1282) & 3;
    float _1288 = (*spvDescriptorSet0.vp_c15)._m0[int(_1284)][_1286];
    int _1290 = int(_1282) + 1;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    int _1294 = _1290 & 3;
    float _1296 = (*spvDescriptorSet0.vp_c15)._m0[int(_1292)][_1294];
    float _1298 = floor(_1254);
    bool _1300 = _1268 < 0;
    bool _1302 = _1300 || _1159;
    if (_1095)
    {
        float _1304 = _1153 * _1278;
        _1155 = _1304;
    }
    float _1306 = _1155;
    if (!_1095)
    {
        _1272 = _1234;
    }
    float _1308 = _1272;
    float _1310 = _1308;
    if (_1095)
    {
        float _1312 = _1228 + (-1.0);
        _1274 = _1312;
    }
    float _1314 = _1274;
    bool _1316 = _1260 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1318 = _1316 || _1302;
    int _1320 = _1161 + 104;
    uint _1322 = uint(int(uint(_1320) >> uint(2)));
    uint _1324 = uint(int(uint(int(_1322)) >> uint(2)));
    int _1326 = int(_1322) & 3;
    float _1328 = (*spvDescriptorSet0.vp_c15)._m0[int(_1324)][_1326];
    int _1330 = int(_1322) + 1;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    int _1334 = _1330 & 3;
    float _1336 = (*spvDescriptorSet0.vp_c15)._m0[int(_1332)][_1334];
    if (_1095)
    {
        float _1338 = _1055 * _1306;
        _1127 = _1338;
    }
    float _1340 = _1127;
    if (_1095)
    {
        float _1342 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _357 = _1342;
    }
    float _1344 = _357;
    if (_1095)
    {
        float _1346 = _1057 * _1306;
        _1129 = _1346;
    }
    float _1348 = _1129;
    float _1350 = floor(_795);
    if (_1095)
    {
        float _1352 = _1340 * _1340;
        _1131 = _1352;
    }
    float _1354 = _1131;
    if (_1095)
    {
        float _1356 = fma(_1234, _1228, _1344);
        _1310 = _1356;
    }
    float _1358 = _1310;
    if (_1095)
    {
        float _1360 = _1348 * _1348;
        _1133 = _1360;
    }
    float _1362 = _1133;
    int _1364 = _1161 + 72;
    uint _1366 = uint(int(uint(_1364) >> uint(2)));
    uint _1368 = uint(int(uint(int(_1366)) >> uint(2)));
    int _1370 = int(_1366) & 3;
    float _1372 = (*spvDescriptorSet0.vp_c15)._m0[int(_1368)][_1370];
    int _1374 = int(_1366) + 1;
    uint _1376 = uint(int(uint(_1374) >> uint(2)));
    int _1378 = _1374 & 3;
    float _1380 = (*spvDescriptorSet0.vp_c15)._m0[int(_1376)][_1378];
    float _1382 = fma(_1358, _1358, _1354);
    int _1384 = as_type<int>(_1362);
    if (!_1318)
    {
        int _1386 = _1260 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1388 = _1386 + _1143;
        _1145 = _1388;
    }
    int _1390 = _1145;
    float _1392 = -_1298;
    float _1394 = _1254 + _1392;
    float _1396 = _1382 + _1362;
    float _1398 = _1059 * _1184;
    int _1400 = as_type<int>(_1298);
    if (!_1318)
    {
        int _1402 = _1390 << 2;
        _1400 = _1402;
    }
    int _1404 = _1400;
    int _1406 = _1404;
    if (!_1318)
    {
        uint _1408 = uint(int(uint(_1390) >> uint(2)));
        _1384 = int(_1408);
    }
    int _1410 = _1384;
    float _1412 = fma(_855, _1176, _1398);
    float _1414 = rsqrt(_1396);
    if (!_1318)
    {
        int _1416 = 12 & _1404;
        _1406 = _1416;
    }
    int _1418 = _1406;
    float _1420 = -_1350;
    float _1422 = _795 + _1420;
    float _1424 = _1059 * _1218;
    float _1426 = fma(_855, _1210, _1424);
    int _1428 = as_type<int>(_1424);
    if (!_1318)
    {
        int _1430 = _1410 << 4;
        int _1432 = _1430 + _1418;
        _1428 = _1432;
    }
    int _1434 = _1428;
    float _1436 = _1350;
    if (!_1318)
    {
        float _1438 = floor(_1093);
        _1436 = _1438;
    }
    float _1440 = _1436;
    float _1442 = _1059 * _1252;
    float _1444 = fma(_855, _1244, _1442);
    float _1446 = _1414 * _1340;
    float _1448 = _1414 * _1358;
    float _1450 = _1414 * _1348;
    float _1452 = fma(_793, _1288, _1426);
    float _1454 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    int _1456 = _1161 + 80;
    uint _1458 = uint(int(uint(_1456) >> uint(2)));
    uint _1460 = uint(int(uint(int(_1458)) >> uint(2)));
    int _1462 = int(_1458) & 3;
    float _1464 = (*spvDescriptorSet0.vp_c15)._m0[int(_1460)][_1462];
    int _1466 = int(_1458) + 1;
    uint _1468 = uint(int(uint(_1466) >> uint(2)));
    int _1470 = _1466 & 3;
    float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
    float _1474 = _1442;
    if (!_1318)
    {
        float _1476 = floor(_1089);
        _1474 = _1476;
    }
    float _1478 = _1474;
    float _1480 = _1452 + _1296;
    float _1482 = -_1454;
    float _1484 = fma(_1448, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1482);
    float _1486 = _1440;
    if (!_1318)
    {
        float _1488 = -_1440;
        float _1490 = _1093 + _1488;
        _1486 = _1490;
    }
    float _1492 = _1486;
    float _1494 = fma(_793, _1328, _1412);
    float _1496 = _995 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1498 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1500 = _1494 + _1336;
    float _1502 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1496);
    int _1504 = _1161 + 88;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
    int _1514 = int(_1506) + 1;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    int _1518 = _1514 & 3;
    float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
    float _1522 = fma(_793, _1372, _1444);
    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1526 = fma(_1053, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1524);
    float _1528 = precise::clamp(_1526, 0.0, 1.0);
    float _1530 = 1.0 / _1500;
    float _1532 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1502);
    float _1534 = _1522 + _1380;
    float _1536 = -_1528;
    float _1538 = _1536 + 1.0;
    float _1540 = -_1450;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1484);
    float _1544 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1546 = _1522;
    if (!_1318)
    {
        int _1548 = _1434 + 400;
        uint _1550 = uint(int(uint(_1548) >> uint(2)));
        uint _1552 = uint(int(uint(int(_1550)) >> uint(2)));
        int _1554 = int(_1550) & 3;
        float _1556 = (*spvDescriptorSet0.vp_c15)._m0[int(_1552)][_1554];
        _1546 = _1556;
    }
    float _1558 = _1546;
    float _1560 = abs(_1538);
    float _1562 = log2(_1560);
    float _1564 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1566 = fma(_1542, -0.5, 0.5);
    float _1568 = fma(_1542, 0.5, 0.5);
    float _1570 = -_1564;
    float _1572 = fma(_1570, _1498, 1.0);
    float _1574 = _995 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1576 = _1480 * _1530;
    float _1578 = _995 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1580 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1574);
    float _1582 = _1534 * _1530;
    float _1584 = _995 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1586 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1578);
    bool _1588 = _1576 >= 0.0;
    float _1590 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1580);
    float _1592 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1594 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1586);
    bool _1596 = _1576 <= 1.0;
    bool _1598 = _1596 && _1588;
    float _1600 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1584);
    float _1602 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1604 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1606 = _1582 >= 0.0;
    bool _1608 = _1606 && _1598;
    float _1610 = exp2(_1592);
    float _1612 = _1059 * _1472;
    float _1614 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1616 = _1582 <= 1.0;
    bool _1618 = _1616 && _1608;
    float _1620 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1600);
    float _1622 = fma(_855, _1464, _1612);
    float _1624 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1614);
    float _1626 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1628 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1630 = sqrt(_1566);
    float _1632 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1624);
    float _1634 = fma(_1568, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1636 = fma(_793, _1512, _1622);
    float _1638 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1632);
    float _1640 = _1448 + 1.0;
    float _1642 = log2(_1572);
    float _1644 = _1636 + _1520;
    float _1646 = _1566;
    float _1648 = _1568;
    float _1650 = _1582;
    float _1652 = _1638;
    if (_1618)
    {
        float _1654 = float(_1157);
        _1646 = _1654;
    }
    float _1656 = _1646;
    float _1658 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1660 = -_1448;
    float _1662 = fma(_1610, _1640, _1660);
    float _1664 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1626);
    float _1666 = fma(_1568, _1634, -0.212114393711090087890625);
    float _1668 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1658);
    float _1670 = 1.0 / _1638;
    float _1672 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1664);
    float _1674 = fma(_1568, _1666, 1.570728778839111328125);
    float _1676 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1668);
    float _1678 = _1630 * 0.636619746685028076171875;
    float _1680 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1672);
    if (!_1318)
    {
        float _1682 = -_1478;
        float _1684 = _1089 + _1682;
        _1648 = _1684;
    }
    float _1686 = _1648;
    float _1688 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1676);
    float _1690 = _1656;
    float _1692 = _1688;
    if (_1618)
    {
        float _1694 = rint(_1656);
        float _1696 = precise::max(_1694, 0.0);
        uint _1698 = uint(_1696);
        uint _1700 = clamp(_1698, 0u, 65535u);
        _1690 = as_type<float>(_1700);
    }
    float _1702 = _1690;
    float _1704 = _1644 * _1530;
    float _1706 = _1642 * 0.693147182464599609375;
    float _1708 = fma(_1009, 6.2500002968590706586837768554688e-05, 0.5);
    float _1710 = fma(_1013, 6.2500002968590706586837768554688e-05, 0.5);
    float _1712 = -_1674;
    float _1714 = fma(_1678, _1712, 1.0);
    float _1716 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1718 = fma(_1662, 0.5, 0.5);
    float _1720 = _1558;
    if (!_1318)
    {
        float _1722 = rint(_1558);
        float _1724 = precise::max(_1722, 0.0);
        uint _1726 = uint(_1724);
        uint _1728 = clamp(_1726, 0u, 65535u);
        _1720 = as_type<float>(_1728);
    }
    float _1730 = _1720;
    float _1732 = _1688 * _1670;
    float _1734 = _1680 * _1670;
    float _1736 = fma(_1732, 0.5, 0.5);
    float _1738 = fma(_1734, -0.5, 0.5);
    float _1740 = _1738;
    if (_1618)
    {
        float3 _6512 = float3(_1576, _1582, float(as_type<int>(_1702)));
        float3 _6516 = select(_6512, float3(0.0), isnan(_6512));
        float _1742 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6516.xy, uint(rint(_6516.z)), _1704, level(0.0));
        _1650 = _1742;
    }
    float _1744 = _1650;
    float2 _6526 = float2(_1708, _1710);
    float3 _1748 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6526, float2(0.0), isnan(_6526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6526, float2(0.0), isnan(_6526)), level(0.0)).xyz;
    float _1750 = _1748.x;
    float _1752 = _1748.y;
    float _1754 = _1748.z;
    float2 _6542 = float2(_1394, _1422);
    float _1756 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6542, float2(0.0), isnan(_6542)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6542, float2(0.0), isnan(_6542)), level(0.0)).x;
    float3 _6551 = float3(_1736, _1738, _1716);
    float _1758 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6551, float3(0.0), isnan(_6551)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6551, float3(0.0), isnan(_6551)), level(0.0)).x;
    float3 _6560 = float3(_1736, _1738, _1716);
    float4 _1761 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6560, float3(0.0), isnan(_6560)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6560, float3(0.0), isnan(_6560)), level(0.0)).xyzw;
    float _1763 = _1761.x;
    float _1765 = _1761.y;
    float _1767 = _1761.z;
    float _1769 = _1761.w;
    float2 _6576 = float2(_1714, _1718);
    float3 _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6576, float2(0.0), isnan(_6576)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6576, float2(0.0), isnan(_6576)), level(0.0)).xyz;
    float _1773 = _1771.x;
    float _1775 = _1771.y;
    float _1777 = _1771.z;
    float _1779 = _1492;
    if (!_1318)
    {
        float3 _6597 = float3(_1686, _1492, float(as_type<int>(_1730)));
        float3 _6599 = select(_6597, float3(0.0), isnan(_6597));
        float _1781 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6599.xy, uint(rint(_6599.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6599.xy, uint(rint(_6599.z)), level(0.0)).x;
        _1779 = _1781;
    }
    float _1783 = _1779;
    float _1785 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1787 = int(_1785);
    int _1789 = abs(_429);
    float _1791 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1793 = abs(_439);
    float _1795 = -_623;
    float _1797 = _1795 + 1.0;
    float _1799 = -_605;
    float _1801 = _1799 + 1.0;
    float _1803 = -_423;
    float _1805 = _1803 + 1.0;
    float _1807 = trunc(_615);
    int _1809 = int(_1807);
    float _1811 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1813 = float(uint(_1787));
    float _1815 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1817 = int(_1815);
    float _1819 = trunc(_591);
    int _1821 = int(_1819);
    if (_245)
    {
        _1740 = 1.0;
    }
    float _1823 = _1740;
    float _1825 = float(uint(_1809));
    int _1827 = ~_1787;
    int _1829 = _1827 + 1;
    float _1831 = _1823;
    if (!_245)
    {
        _1831 = 7.345489978790283203125;
    }
    float _1833 = _1831;
    float _1835 = 1.0 / _1813;
    float _1837 = float(uint(_1817));
    int _1839 = ~_1787;
    int _1841 = _1839 + 1;
    float _1843 = _1833 * _227;
    int _1845 = ~_1817;
    int _1847 = _1845 + 1;
    float _1849 = float(_1787);
    float _1851 = 1.0 / _1837;
    bool _1853 = _1787 == 0;
    int _1855 = as_type<int>(_1835) + (-2);
    float _1857 = exp2(_1811);
    float _1859 = as_type<float>(_1855) * _1825;
    float _1861 = trunc(_1859);
    float _1863 = precise::max(_1861, 0.0);
    uint _1865 = uint(_1863);
    int _1867 = _1829 * int(_1865);
    int _1869 = _1867 + _1809;
    float _1871 = float(uint(_1869));
    float _1873 = floor(_1843);
    float _1875 = as_type<float>(_1855) * _1871;
    int _1877 = as_type<int>(_1851) + (-2);
    float _1879 = float(uint(_1821));
    float _1881 = trunc(_1875);
    float _1883 = precise::max(_1881, 0.0);
    uint _1885 = uint(_1883);
    float _1887 = as_type<float>(_1877) * _1879;
    float _1889 = -_1873;
    float _1891 = _1843 + _1889;
    float _1893 = trunc(_1887);
    float _1895 = precise::max(_1893, 0.0);
    uint _1897 = uint(_1895);
    float _1899 = float(_1809);
    int _1901 = int(_1865) + int(_1885);
    bool _1903 = _1899 >= _1849;
    bool _1905 = isnan(_1899);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan(_1849);
    bool _1911 = _1907 || _1909;
    float _1913 = float(_1911);
    float _1915 = _1891 * _1849;
    float _1917 = as_type<float>(_1865);
    if (_245)
    {
        _1917 = 1.0;
    }
    float _1919 = _1917;
    int _1921 = _1841 * _1901;
    int _1923 = _1921 + _1809;
    float _1925 = trunc(_1913);
    int _1927 = int(_1925);
    int _1929 = _1847 * int(_1897);
    int _1931 = _1929 + _1821;
    float _1933 = _1919;
    float _1935 = as_type<float>(_1923);
    if (!_245)
    {
        _1933 = 1.2345600128173828125;
    }
    float _1937 = _1933;
    float _1939 = _1849 * _517;
    bool _1941 = uint(_1923) >= uint(_1787);
    float _1943 = float(uint(_1931));
    bool _1945 = !_1941;
    int _1947 = _1945 ? 0 : (-1);
    float _1949 = trunc(_1915);
    int _1951 = int(_1949);
    if (_245)
    {
        _1935 = _227;
    }
    float _1953 = _1935;
    float _1955 = as_type<float>(_1877) * _1943;
    int _1957 = ~_1901;
    int _1959 = _1957 + _1947;
    int _1961 = _1959 + 1;
    float _1963 = _1953;
    if (!_245)
    {
        _1963 = _233;
    }
    float _1965 = _1963;
    int _1967 = _1787 * _1961;
    int _1969 = _1967 + _1809;
    int _1971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1973 = _1971 != 0;
    float _1975 = trunc(_1955);
    float _1977 = precise::max(_1975, 0.0);
    uint _1979 = uint(_1977);
    int _1981 = ~_1927;
    int _1983 = _1981 + 1;
    int _1985 = _1983 + 1;
    float _1987 = _1937 * _1965;
    bool _1989 = !_1973;
    int _1991 = _1989 ? 0 : 1;
    bool _1993 = !_1853;
    int _1995 = _1993 ? _1969 : (-1);
    int _1997 = abs(_1991);
    float _1999 = trunc(_1939);
    int _2001 = int(_1999);
    int _2003 = _1787 + (-1);
    int _2005 = _1995 * _1985;
    int _2007 = abs(_435);
    int _2009 = _1927 * _2003;
    int _2011 = _2009 + _2005;
    float _2013 = floor(_1987);
    int _2015 = _1951 * _1997;
    int _2017 = _2015 + _1809;
    int _2019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2021 = _2019 != 0;
    int _2023 = _2011 * _1789;
    int _2025 = int(_1897) + int(_1979);
    bool _2027 = !_2021;
    int _2029 = _2027 ? 0 : 1;
    int _2031 = _2001 * _2007;
    int _2033 = _2031 + _2023;
    int _2035 = ~_1817;
    int _2037 = _2035 + 1;
    float _2039 = float(_1817);
    float _2041 = float(_1821);
    int _2043 = _2037 * _2025;
    int _2045 = _2043 + _1821;
    int _2047 = abs(_2029);
    float _2049 = -_2013;
    float _2051 = _1987 + _2049;
    float _2053 = _2039 * _517;
    bool _2055 = _2041 >= _2039;
    bool _2057 = isnan(_2041);
    bool _2059 = _2055 || _2057;
    bool _2061 = isnan(_2039);
    bool _2063 = _2059 || _2061;
    float _2065 = float(_2063);
    int _2067 = _2017 * _1793;
    int _2069 = _2067 + _2033;
    bool _2071 = uint(_2045) >= uint(_1817);
    float _2073 = trunc(_2053);
    int _2075 = int(_2073);
    int _2077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2079 = _2077 != 0;
    int _2081 = _1951 * _2047;
    int _2083 = _2081 + _2069;
    bool _2085 = !_2071;
    int _2087 = _2085 ? 0 : (-1);
    float _2089 = _2051 * _2039;
    bool _2091 = !_2079;
    int _2093 = _2091 ? 0 : 1;
    int _2095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2097 = _2095 != 0;
    int _2099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2101 = _2099 != 0;
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2105 = _2103 != 0;
    int _2107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2109 = _2107 != 0;
    float _2111 = trunc(_2065);
    int _2113 = int(_2111);
    int _2115 = ~_2025;
    int _2117 = _2115 + _2087;
    int _2119 = _2117 + 1;
    float _2121 = float(uint(_2083));
    bool _2123 = !_2101;
    int _2125 = _2123 ? 0 : 1;
    int _2127 = _1817 * _2119;
    int _2129 = _2127 + _1821;
    bool _2131 = _1817 == 0;
    float _2133 = trunc(_2089);
    int _2135 = int(_2133);
    float _2137 = as_type<float>(_1855) * _2121;
    int _2139 = abs(_2093);
    bool _2141 = !_2131;
    int _2143 = _2141 ? _2129 : (-1);
    float _2145 = trunc(_2137);
    float _2147 = precise::max(_2145, 0.0);
    uint _2149 = uint(_2147);
    int _2151 = ~_2113;
    int _2153 = _2151 + 1;
    int _2155 = _2153 + 1;
    int _2157 = _1817 + (-1);
    int _2159 = _2143 * _2155;
    int _2161 = ~_1787;
    int _2163 = _2161 + 1;
    int _2165 = _2135 * _2139;
    int _2167 = _2165 + _1821;
    int _2169 = abs(_2125);
    int _2171 = _2113 * _2157;
    int _2173 = _2171 + _2159;
    bool _2175 = !_2097;
    int _2177 = _2175 ? 0 : 1;
    bool _2179 = !_2105;
    int _2181 = _2179 ? 0 : 1;
    int _2183 = _2163 * int(_2149);
    int _2185 = _2183 + _2083;
    int _2187 = abs(_2177);
    bool _2189 = !_2109;
    int _2191 = _2189 ? 0 : 1;
    int _2193 = abs(_2181);
    int _2195 = _2173 * _2169;
    int _2197 = abs(_2191);
    float _2199 = float(uint(_2185));
    int _2201 = _2075 * _2187;
    int _2203 = _2201 + _2195;
    float _2205 = float(uint(_2017));
    float _2207 = as_type<float>(_1855) * _2199;
    float _2209 = float(uint(_2167));
    int _2211 = _2167 * _2193;
    int _2213 = _2211 + _2203;
    int _2215 = ~_1817;
    int _2217 = _2215 + 1;
    int _2219 = _2135 * _2197;
    int _2221 = _2219 + _2213;
    float _2223 = trunc(_2207);
    float _2225 = precise::max(_2223, 0.0);
    uint _2227 = uint(_2225);
    float _2229 = as_type<float>(_1855) * _2205;
    int _2231 = ~_1787;
    int _2233 = _2231 + 1;
    float _2235 = float(uint(_2221));
    int _2237 = ~_1787;
    int _2239 = _2237 + 1;
    float _2241 = trunc(_2229);
    float _2243 = precise::max(_2241, 0.0);
    uint _2245 = uint(_2243);
    float _2247 = as_type<float>(_1877) * _2235;
    float _2249 = trunc(_2247);
    float _2251 = precise::max(_2249, 0.0);
    uint _2253 = uint(_2251);
    int _2255 = int(_2149) + int(_2227);
    float _2257 = as_type<float>(_1877) * _2209;
    int _2259 = ~_1817;
    int _2261 = _2259 + 1;
    int _2263 = _2233 * _2255;
    int _2265 = _2263 + _2083;
    float _2267 = trunc(_2257);
    float _2269 = precise::max(_2267, 0.0);
    uint _2271 = uint(_2269);
    int _2273 = _2239 * int(_2245);
    int _2275 = _2273 + _2017;
    bool _2277 = uint(_2265) >= uint(_1787);
    float _2279 = float(uint(_2275));
    int _2281 = _2217 * int(_2253);
    int _2283 = _2281 + _2221;
    bool _2285 = !_2277;
    int _2287 = _2285 ? 0 : (-1);
    float _2289 = as_type<float>(_1855) * _2279;
    float _2291 = float(uint(_2283));
    int _2293 = ~_2255;
    int _2295 = _2293 + _2287;
    int _2297 = _2295 + 1;
    float _2299 = trunc(_2289);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = as_type<float>(_1877) * _2291;
    int _2307 = _1787 * _2297;
    int _2309 = _2307 + _2083;
    int _2311 = _2261 * int(_2271);
    int _2313 = _2311 + _2167;
    bool _2315 = !_1853;
    int _2317 = _2315 ? _2309 : (-1);
    float _2319 = trunc(_2305);
    float _2321 = precise::max(_2319, 0.0);
    uint _2323 = uint(_2321);
    float _2325 = float(uint(_2313));
    int _2327 = _2317 & 3;
    bool _2329 = _2327 != 0;
    int _2331 = _2317 & 3;
    bool _2333 = _2331 != 0;
    float _2335 = as_type<float>(_1877) * _2325;
    bool _2337 = uint(_2327) > 1u;
    out.m_80.x = _1750;
    out.m_80.y = _1752;
    out.m_80.z = _1754;
    int _2339 = int(_2245) + int(_2303);
    float _2341 = trunc(_2335);
    float _2343 = precise::max(_2341, 0.0);
    uint _2345 = uint(_2343);
    int _2347 = ~_1817;
    int _2349 = _2347 + 1;
    float _2351 = -_1756;
    float _2353 = _2351 + 1.0;
    int _2355 = ~_1787;
    int _2357 = _2355 + 1;
    int _2359 = _2333 ? 0 : 1;
    int _2361 = int(_2253) + int(_2323);
    int _2363 = _2357 * _2339;
    int _2365 = _2363 + _2017;
    int _2367 = ~_2359;
    int _2369 = _2367 + 1;
    int _2371 = _2369 + 1;
    bool _2373 = uint(_2327) >= 2u;
    int _2375 = _2349 * _2361;
    int _2377 = _2375 + _2221;
    int _2379 = _2371;
    float _2381 = _1752;
    float _2383 = _1750;
    if (!_2337)
    {
        int _2385 = ~_2359;
        int _2387 = _2385 + 1;
        _2379 = _2387;
    }
    int _2389 = _2379;
    bool _2391 = uint(_2365) >= uint(_1787);
    int _2393 = _2373 ? 0 : 1;
    bool _2395 = uint(_2377) >= uint(_1817);
    bool _2397 = !_2391;
    int _2399 = _2397 ? 0 : (-1);
    bool _2401 = !_2395;
    int _2403 = _2401 ? 0 : (-1);
    int _2405 = ~_2339;
    int _2407 = _2405 + _2399;
    int _2409 = _2407 + 1;
    bool _2411 = _2327 != 3;
    int _2413 = ~_1817;
    int _2415 = _2413 + 1;
    int _2417 = _1787 * _2409;
    int _2419 = _2417 + _2017;
    int _2421 = ~_2361;
    int _2423 = _2421 + _2403;
    int _2425 = _2423 + 1;
    int _2427 = int(_2271) + int(_2345);
    int _2429 = _1817 * _2425;
    int _2431 = _2429 + _2221;
    int _2433 = ~_2393;
    int _2435 = _2433 + 1;
    int _2437 = _2435 + 1;
    bool _2439 = !_2329;
    int _2441 = _2439 ? 0 : 1;
    int _2443 = _2415 * _2427;
    int _2445 = _2443 + _2167;
    int _2447 = _2437;
    if (_2411)
    {
        int _2449 = ~_2393;
        int _2451 = _2449 + 1;
        _2447 = _2451;
    }
    int _2453 = _2447;
    int _2455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2457 = _2455 != 0;
    bool _2459 = uint(_2445) >= uint(_1817);
    bool _2461 = !_2131;
    int _2463 = _2461 ? _2431 : (-1);
    bool _2465 = !_1853;
    int _2467 = _2465 ? _2419 : (-1);
    float _2469 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2471 = int(_2469);
    int _2473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2475 = _2473 != 0;
    bool _2477 = !_2457;
    int _2479 = _2477 ? 0 : 1;
    bool _2481 = !_2459;
    int _2483 = _2481 ? 0 : (-1);
    int _2485 = _2463 & 3;
    bool _2487 = _2485 != 0;
    int _2489 = _2317 >> 31;
    int _2491 = _2463 >> 31;
    bool _2493 = !_2475;
    int _2495 = _2493 ? 0 : 1;
    int _2497 = ~_2427;
    int _2499 = _2497 + _2483;
    int _2501 = _2499 + 1;
    int _2503 = _2463 & 3;
    bool _2505 = _2503 != 0;
    bool _2507 = !_2487;
    int _2509 = _2507 ? 0 : 1;
    int _2511 = _1817 * _2501;
    int _2513 = _2511 + _2167;
    int _2515 = _2489 & 3;
    int _2517 = _2491 & 3;
    bool _2519 = uint(_2485) > 1u;
    bool _2521 = _233 > 0.5;
    int _2523 = _2505 ? 0 : 1;
    int _2525 = _2317 + _2515;
    int _2527 = _2463 + _2517;
    bool _2529 = _2327 != 3;
    int _2531 = _2525 >> 2;
    int _2533 = _2527 >> 2;
    bool _2535 = !_2529;
    int _2537 = _2535 ? 0 : (-1);
    bool _2539 = uint(_2485) >= 2u;
    int _2541 = _2531 << 4;
    int _2543 = _2541 + 368;
    int _2545 = _2533 << 4;
    int _2547 = _2545 + 512;
    int _2549 = ~_2523;
    int _2551 = _2549 + 1;
    int _2553 = _2551 + 1;
    uint _2555 = uint(int(uint(_2543) >> uint(2)));
    uint _2557 = uint(int(uint(int(_2555)) >> uint(2)));
    int _2559 = int(_2555) & 3;
    float _2561 = (*spvDescriptorSet0.vp_c9)._m0[int(_2557)][_2559];
    int _2563 = int(_2555) + 1;
    uint _2565 = uint(int(uint(_2563) >> uint(2)));
    int _2567 = _2563 & 3;
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[int(_2565)][_2567];
    float _2571 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _2573 = _2553;
    if (!_2519)
    {
        int _2575 = ~_2523;
        int _2577 = _2575 + 1;
        _2573 = _2577;
    }
    int _2579 = _2573;
    int _2581 = _2539 ? 0 : 1;
    float _2583 = _2571 * _227;
    bool _2585 = _2485 != 3;
    float _2587 = in.m_68.w;
    bool _2589 = _2485 != 3;
    uint _2591 = uint(int(uint(_2547) >> uint(2)));
    uint _2593 = uint(int(uint(int(_2591)) >> uint(2)));
    int _2595 = int(_2591) & 3;
    float _2597 = (*spvDescriptorSet0.vp_c9)._m0[int(_2593)][_2595];
    int _2599 = int(_2591) + 1;
    uint _2601 = uint(int(uint(_2599) >> uint(2)));
    int _2603 = _2599 & 3;
    float _2605 = (*spvDescriptorSet0.vp_c9)._m0[int(_2601)][_2603];
    float _2607 = trunc(_2583);
    int _2609 = int(_2607);
    bool _2611 = !_2589;
    int _2613 = _2611 ? 0 : (-1);
    bool _2615 = _227 > 0.5;
    bool _2617 = _237 > 0.5;
    int _2619 = _2543 + 8;
    uint _2621 = uint(int(uint(_2619) >> uint(2)));
    uint _2623 = uint(int(uint(int(_2621)) >> uint(2)));
    int _2625 = int(_2621) & 3;
    float _2627 = (*spvDescriptorSet0.vp_c9)._m0[int(_2623)][_2625];
    int _2629 = int(_2621) + 1;
    uint _2631 = uint(int(uint(_2629) >> uint(2)));
    int _2633 = _2629 & 3;
    float _2635 = (*spvDescriptorSet0.vp_c9)._m0[int(_2631)][_2633];
    bool _2637 = !_2131;
    int _2639 = _2637 ? _2513 : (-1);
    float _2641 = -_191;
    int _2643 = _2617 ? as_type<int>(_2641) : as_type<int>(_191);
    int _2645 = ~_2581;
    int _2647 = _2645 + 1;
    int _2649 = _2647 + 1;
    int _2651 = _2547 + 8;
    uint _2653 = uint(int(uint(_2651) >> uint(2)));
    uint _2655 = uint(int(uint(int(_2653)) >> uint(2)));
    int _2657 = int(_2653) & 3;
    float _2659 = (*spvDescriptorSet0.vp_c9)._m0[int(_2655)][_2657];
    int _2661 = int(_2653) + 1;
    uint _2663 = uint(int(uint(_2661) >> uint(2)));
    int _2665 = _2661 & 3;
    float _2667 = (*spvDescriptorSet0.vp_c9)._m0[int(_2663)][_2665];
    int _2669 = _2609 << 4;
    int _2671 = _2669 + 1968;
    float _2673 = -_195;
    int _2675 = _2521 ? as_type<int>(_2673) : as_type<int>(_195);
    bool _2677 = _2587 > 0.5;
    int _2679 = _2649;
    if (_2585)
    {
        int _2681 = ~_2581;
        int _2683 = _2681 + 1;
        _2679 = _2683;
    }
    int _2685 = _2679;
    uint _2687 = uint(int(uint(_2671) >> uint(2)));
    uint _2689 = uint(int(uint(int(_2687)) >> uint(2)));
    int _2691 = int(_2687) & 3;
    float _2693 = (*spvDescriptorSet0.vp_c9)._m0[int(_2689)][_2691];
    int _2695 = int(_2687) + 1;
    uint _2697 = uint(int(uint(_2695) >> uint(2)));
    int _2699 = _2695 & 3;
    float _2701 = (*spvDescriptorSet0.vp_c9)._m0[int(_2697)][_2699];
    float _2703 = -_191;
    int _2705 = _2615 ? as_type<int>(_2703) : as_type<int>(_191);
    int _2707 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2709 = _2707 != 0;
    int _2711 = abs(_2579);
    int _2713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2715 = _2713 != 0;
    int _2717 = _2671 + 8;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    uint _2721 = uint(int(uint(int(_2719)) >> uint(2)));
    int _2723 = int(_2719) & 3;
    float _2725 = (*spvDescriptorSet0.vp_c9)._m0[int(_2721)][_2723];
    int _2727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2729 = _2727 != 0;
    int _2731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2733 = _2731 != 0;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2737 = ~_2711;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    float _2743 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2745 = abs(_2509);
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2749 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2751 = _2743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2753 = _2735 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2755 = _2747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2757 = _2741 * as_type<int>(_2605);
    int _2759 = abs(_2389);
    out.m_82.x = _2751;
    out.m_82.y = _2753;
    out.m_82.z = _2755;
    out.m_82.w = _2749;
    int _2761 = abs(_2441);
    float _2763 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2765 = int(_2763);
    int _2767 = ~_2761;
    int _2769 = _2767 + 1;
    int _2771 = _2769 + 1;
    int _2773 = ~_2759;
    int _2775 = _2773 + 1;
    int _2777 = _2775 + 1;
    int _2779 = abs(_2613);
    int _2781 = _2777 * as_type<int>(_2569);
    int _2783 = ~_2745;
    int _2785 = _2783 + 1;
    int _2787 = _2785 + 1;
    int _2789 = abs(_2685);
    int _2791 = _2771 * as_type<int>(_2561);
    int _2793 = _2791 + _2781;
    int _2795 = abs(_2453);
    int _2797 = _2787 * as_type<int>(_2597);
    int _2799 = _2797 + _2757;
    int _2801 = ~_2789;
    int _2803 = _2801 + 1;
    int _2805 = _2803 + 1;
    float _2807 = abs(_1107);
    float _2809 = log2(_2807);
    int _2811 = ~_2795;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    int _2817 = abs(_2537);
    int _2819 = _2805 * as_type<int>(_2659);
    int _2821 = _2819 + _2799;
    int _2823 = _2815 * as_type<int>(_2627);
    int _2825 = _2823 + _2793;
    int _2827 = ~_2817;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    float _2833 = _2725 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2835 = float(uint(_2471));
    int _2837 = ~_2779;
    int _2839 = _2837 + 1;
    int _2841 = _2839 + 1;
    int _2843 = _2831 * as_type<int>(_2635);
    int _2845 = _2843 + _2825;
    int _2847 = abs(_2471);
    float _2849 = 1.0 / _2835;
    float _2851 = float(uint(_2765));
    int _2853 = _2841 * as_type<int>(_2667);
    int _2855 = _2853 + _2821;
    float _2857 = _2701 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2859 = _2809 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2861 = _2693 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2863 = abs(_2479);
    float _2865 = 1.0 / _2851;
    int _2867 = abs(_2495);
    float _2869 = _2861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2871 = float(uint(_2847));
    float _2873 = _2857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2875 = ~_2863;
    int _2877 = _2875 + 1;
    int _2879 = _2877 + 1;
    float _2881 = _2833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2883 = ~_2867;
    int _2885 = _2883 + 1;
    int _2887 = _2885 + 1;
    float _2889 = exp2(_2859);
    int _2891 = abs(_2765);
    int _2893 = _2845 * _2879;
    int _2895 = as_type<int>(_2849) + (-2);
    int _2897 = _2855 * _2887;
    float _2899 = float(uint(_2891));
    int _2901 = _2467 * _2863;
    int _2903 = _2901 + _2893;
    float _2905 = _807 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2907 = 1.0 / _2871;
    int _2909 = _2639 * _2867;
    int _2911 = _2909 + _2897;
    out.m_84.x = _2869;
    out.m_84.y = _2873;
    out.m_84.z = _2881;
    float _2913 = _807 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2915 = _807 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2917 = -_799;
    float _2919 = fma(_2917, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2905);
    float _2921 = float(uint(_2903));
    float _2923 = 1.0 / _2899;
    float _2925 = fma(_2889, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2927 = precise::clamp(_2925, 0.0, 1.0);
    float _2929 = -_799;
    float _2931 = fma(_2929, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2913);
    float _2933 = -_799;
    float _2935 = fma(_2933, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2915);
    float _2937 = as_type<float>(_2895) * _2921;
    int _2939 = ~_2471;
    int _2941 = _2939 + 1;
    int _2943 = abs(_2903);
    float _2945 = trunc(_2937);
    float _2947 = precise::max(_2945, 0.0);
    uint _2949 = uint(_2947);
    int _2951 = as_type<int>(_2865) + (-2);
    float _2953 = float(uint(_2911));
    int _2955 = as_type<int>(_2907) + (-2);
    float _2957 = as_type<float>(_2951) * _2953;
    float _2959 = float(uint(_2943));
    float _2961 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2931);
    int _2963 = abs(_2911);
    float _2965 = _819 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2967 = as_type<int>(_2923) + (-2);
    float _2969 = trunc(_2957);
    float _2971 = precise::max(_2969, 0.0);
    uint _2973 = uint(_2971);
    float _2975 = as_type<float>(_2955) * _2959;
    float _2977 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2919);
    float _2979 = float(uint(_2963));
    float _2981 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2935);
    float _2983 = _819 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2985 = ~_2765;
    int _2987 = _2985 + 1;
    float _2989 = as_type<float>(_2967) * _2979;
    float _2991 = trunc(_2975);
    float _2993 = precise::max(_2991, 0.0);
    uint _2995 = uint(_2993);
    int _2997 = _2941 * int(_2949);
    int _2999 = _2997 + _2903;
    int _3001 = ~_2847;
    int _3003 = _3001 + 1;
    float _3005 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2965);
    int _3007 = ~_2891;
    int _3009 = _3007 + 1;
    float _3011 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2983);
    bool _3013 = !_2729;
    float _3015 = _3013 ? _191 : as_type<float>(_2643);
    int _3017 = _2987 * int(_2973);
    int _3019 = _3017 + _2911;
    float _3021 = trunc(_2989);
    float _3023 = precise::max(_3021, 0.0);
    uint _3025 = uint(_3023);
    float _3027 = _819 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3029 = float(uint(_2999));
    float _3031 = float(uint(_3019));
    float _3033 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3027);
    float _3035 = _827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3037 = as_type<float>(_2895) * _3029;
    float _3039 = _827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3041 = as_type<float>(_2951) * _3031;
    int _3043 = _3003 * int(_2995);
    int _3045 = _3043 + _2943;
    float _3047 = _827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3049 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3035);
    float _3051 = trunc(_3041);
    float _3053 = precise::max(_3051, 0.0);
    uint _3055 = uint(_3053);
    float _3057 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3039);
    float _3059 = float(uint(_3045));
    int _3061 = _3009 * int(_3025);
    int _3063 = _3061 + _2963;
    float _3065 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3047);
    float _3067 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3033);
    bool _3069 = !_2715;
    float _3071 = _3069 ? _195 : as_type<float>(_2675);
    float _3073 = as_type<float>(_2955) * _3059;
    float _3075 = trunc(_3037);
    float _3077 = precise::max(_3075, 0.0);
    uint _3079 = uint(_3077);
    float _3081 = float(uint(_3063));
    float _3083 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3005);
    float _3085 = fma(_2927, -2.0, 3.0);
    float _3087 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3049);
    bool _3089 = _1107 <= 8000.0;
    bool _3091 = isnan(_1107);
    bool _3093 = _3089 || _3091;
    bool _3095 = isnan(8000.0);
    bool _3097 = _3093 || _3095;
    float _3099 = float(_3097);
    float _3101 = as_type<float>(_2967) * _3081;
    float _3103 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3011);
    float _3105 = trunc(_3073);
    float _3107 = precise::max(_3105, 0.0);
    uint _3109 = uint(_3107);
    bool _3111 = !_2709;
    float _3113 = _3111 ? _191 : as_type<float>(_2705);
    float _3115 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3117 = -_195;
    int _3119 = _2677 ? as_type<int>(_3117) : as_type<int>(_195);
    float _3121 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3123 = int(_2973) + int(_3055);
    float _3125 = _3115 * _2977;
    int _3127 = ~_2471;
    int _3129 = _3127 + 1;
    float _3131 = trunc(_3101);
    float _3133 = precise::max(_3131, 0.0);
    uint _3135 = uint(_3133);
    int _3137 = int(_2949) + int(_3079);
    float _3139 = _3115 * _2961;
    int _3141 = ~_2765;
    int _3143 = _3141 + 1;
    float _3145 = fma(_3121, _3083, _3125);
    bool _3147 = !_2733;
    float _3149 = _3147 ? _195 : as_type<float>(_3119);
    float _3151 = _2927 * _2927;
    int _3153 = ~_2847;
    int _3155 = _3153 + 1;
    float _3157 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3057);
    out.m_86.x = _3083;
    out.m_86.y = _3103;
    out.m_86.z = _3067;
    float _3159 = fma(_3121, _3103, _3139);
    int _3161 = _3129 * _3137;
    int _3163 = _3161 + _2903;
    int _3165 = int(_2995) + int(_3109);
    int _3167 = _3143 * _3123;
    int _3169 = _3167 + _2911;
    bool _3171 = _2765 == 0;
    float _3173 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3065);
    int _3175 = int(_3025) + int(_3135);
    float _3177 = _3151 * _3085;
    bool _3179 = uint(_3163) >= uint(_2471);
    bool _3181 = uint(_3169) >= uint(_2765);
    int _3183 = ~_2891;
    int _3185 = _3183 + 1;
    float _3187 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1791);
    int _3189 = _3155 * _3165;
    int _3191 = _3189 + _2943;
    bool _3193 = !_3179;
    int _3195 = _3193 ? 0 : (-1);
    int _3197 = _3185 * _3175;
    int _3199 = _3197 + _2963;
    bool _3201 = !_3181;
    int _3203 = _3201 ? 0 : (-1);
    float _3205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3207 = uint(_3191) >= uint(_2847);
    float _3209 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3187);
    int _3211 = _2903 ^ _2471;
    bool _3213 = uint(_3199) >= uint(_2891);
    int _3215 = ~_3123;
    int _3217 = _3215 + _3203;
    int _3219 = _3217 + 1;
    float _3221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3223 = !_3207;
    int _3225 = _3223 ? 0 : (-1);
    uint _3227 = uint(int(uint(_3211) >> uint(31)));
    int _3229 = _2765 * _3219;
    int _3231 = _3229 + _2911;
    int _3233 = ~_3137;
    int _3235 = _3233 + _3195;
    int _3237 = _3235 + 1;
    int _3239 = ~_3225;
    int _3241 = _3165 + _3239;
    int _3243 = _3241 + 1;
    float _3245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3247 = ~int(_3227);
    int _3249 = _3247 + 1;
    int _3251 = _2471 * _3237;
    int _3253 = _3251 + _2903;
    int _3255 = _2911 ^ _2765;
    float _3257 = _3205 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3259 = _3243 ^ _3249;
    bool _3261 = _2471 == 0;
    float _3263 = _3221 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3265 = ~_3249;
    int _3267 = _3265 + _3259;
    int _3269 = _3267 + 1;
    bool _3271 = !_3213;
    int _3273 = _3271 ? 0 : (-1);
    uint _3275 = uint(int(uint(_3255) >> uint(31)));
    float _3277 = fma(_3115, _3115, 1.0);
    bool _3279 = !_3261;
    int _3281 = _3279 ? _3253 : (-1);
    float _3283 = _3245 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3285 = ~_3273;
    int _3287 = _3175 + _3285;
    int _3289 = _3287 + 1;
    int _3291 = ~int(_3275);
    int _3293 = _3291 + 1;
    float _3295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3297 = !_3171;
    int _3299 = _3297 ? _3231 : (-1);
    float _3301 = float(_3281);
    bool _3303 = _2471 == 0;
    int _3305 = _3289 ^ _3293;
    float _3307 = rsqrt(_3277);
    float _3309 = float(_3299);
    float _3311 = fma(_3257, _3301, _291);
    float _3313 = _3113 + 0.5;
    bool _3315 = _2765 == 0;
    int _3317 = ~_3293;
    int _3319 = _3317 + _3305;
    int _3321 = _3319 + 1;
    float _3323 = fma(_3257, _3313, _3311);
    bool _3325 = !_3303;
    int _3327 = _3325 ? _3269 : (-1);
    float _3329 = fma(_3283, _3309, _561);
    float _3331 = _3015 + 0.5;
    bool _3333 = !_3315;
    int _3335 = _3333 ? _3321 : (-1);
    float _3337 = float(_3327);
    float _3339 = fma(_3283, _3331, _3329);
    float _3341 = float(_3335);
    float _3343 = _3295 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3345 = _3071 + (-0.5);
    float _3347 = -_313;
    float _3349 = fma(_3263, _3337, _3347);
    float _3351 = _3115 * _3307;
    float _3353 = -_593;
    float _3355 = fma(_3343, _3341, _3353);
    float _3357 = _3149 + (-0.5);
    float _3359 = _3115 * _2981;
    float _3361 = -_3157;
    float _3363 = _3351 * _3361;
    float _3365 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3209);
    float _3367 = -_3263;
    float _3369 = fma(_3367, _3345, _3349);
    float _3371 = -_3087;
    float _3373 = _3351 * _3371;
    float _3375 = -_3343;
    float _3377 = fma(_3375, _3357, _3355);
    float _3379 = fma(_3307, _2961, _3363);
    float _3381 = -_3173;
    float _3383 = _3351 * _3381;
    float _3385 = -_485;
    float _3387 = _3385 + 1.0;
    float _3389 = _3365 + _1638;
    float _3391 = -_1797;
    float _3393 = fma(_3113, _3391, _3323);
    float _3395 = fma(_3307, _2977, _3373);
    float _3397 = fma(_3071, _1801, _3369);
    float _3399 = fma(_3307, _2981, _3383);
    float _3401 = -_3387;
    float _3403 = fma(_3015, _3401, _3339);
    float _3405 = _3389 * 0.5;
    float _3407 = fma(_3149, _1805, _3377);
    out.m_88.x = _3395;
    out.m_88.y = _3379;
    out.m_88.z = _3399;
    float _3409 = _3351;
    if (!_1618)
    {
        _3409 = 1.0;
    }
    float _3411 = _3409;
    float _3413 = fma(_3121, _3067, _3359);
    float _3415 = _3411;
    if (_1618)
    {
        bool _3417 = _1744 >= _1704;
        bool _3419 = isnan(_1744);
        bool _3421 = _3417 || _3419;
        bool _3423 = isnan(_1704);
        bool _3425 = _3421 || _3423;
        float _3427 = float(_3425);
        _3415 = _3427;
    }
    float _3429 = _3415;
    out.m_90.z = _3405;
    out.m_90.w = _1638;
    float _3431 = -_3177;
    float _3433 = _3431 + 1.0;
    float _3435 = _3087 + _3145;
    float _3437 = _3157 + _3159;
    out.m_92.x = _3393;
    out.m_92.y = _3397;
    out.m_92.z = _3403;
    out.m_92.w = _3407;
    float _3439 = fma(_3433, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3177);
    float _3441 = _3173 + _3413;
    out.gl_Position.x = _1688;
    out.gl_Position.y = _1680;
    out.gl_Position.z = _3365;
    out.gl_Position.w = _1638;
    float _3443 = _3099 * _3439;
    float _3445 = _3443 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3447 = _2353 * _3445;
    float _3449 = precise::clamp(_3447, 0.0, 1.0);
    if (_1318)
    {
        _1692 = 1.0;
    }
    float _3451 = _1692;
    float _3453 = _3451;
    if (!_1318)
    {
        int _3455 = _1390 << 4;
        int _3457 = _3455 + 2048;
        uint _3459 = uint(int(uint(_3457) >> uint(2)));
        uint _3461 = uint(int(uint(int(_3459)) >> uint(2)));
        int _3463 = int(_3459) & 3;
        float _3465 = (*spvDescriptorSet0.vp_c15)._m0[int(_3461)][_3463];
        int _3467 = int(_3459) + 1;
        uint _3469 = uint(int(uint(_3467) >> uint(2)));
        int _3471 = _3467 & 3;
        float _3473 = (*spvDescriptorSet0.vp_c15)._m0[int(_3469)][_3471];
        int _3475 = _3457 + 8;
        uint _3477 = uint(int(uint(_3475) >> uint(2)));
        uint _3479 = uint(int(uint(int(_3477)) >> uint(2)));
        int _3481 = int(_3477) & 3;
        float _3483 = (*spvDescriptorSet0.vp_c15)._m0[int(_3479)][_3481];
        int _3485 = int(_3477) + 1;
        uint _3487 = uint(int(uint(_3485) >> uint(2)));
        int _3489 = _3485 & 3;
        float _3491 = (*spvDescriptorSet0.vp_c15)._m0[int(_3487)][_3489];
        float _3493 = _1059 * _3473;
        float _3495 = fma(_855, _3465, _3493);
        float _3497 = fma(_793, _3483, _3495);
        float _3499 = _3497 + _3491;
        float _3501 = precise::clamp(_3499, 0.0, 1.0);
        float _3503 = -_3501;
        float _3505 = _3503 + _1783;
        float _3507 = fma(_3505, 500.0, 1.5);
        float _3509 = exp2(_3507);
        float _3511 = 0.0 + _3509;
        float _3513 = precise::clamp(_3511, 0.0, 1.0);
        _3453 = _3513;
        _1652 = _3491;
    }
    float _3515 = _3453;
    float _3517 = _1652;
    float _3519 = -_1857;
    float _3521 = _3519 + 1.0;
    float _3523 = _3429 * _3515;
    float _3525 = -_3449;
    float _3527 = fma(_3525, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_94.x = _3435;
    out.m_94.y = _3437;
    out.m_94.z = _3441;
    float _3529 = _3521 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3531 = _1053 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3533 = isnan(_1053);
    bool _3535 = _3531 || _3533;
    bool _3537 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3539 = _3535 || _3537;
    float _3541 = -_3523;
    float _3543 = fma(_3541, _3527, 1.0);
    float _3545 = precise::clamp(_3543, 0.0, 1.0);
    float _3547 = _3529 * _1758;
    float _3549 = -_3529;
    float _3551 = _3549 + 1.0;
    float _3553 = _3545 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3555 = _1769 * _3547;
    float _3557 = _1777 * _3547;
    float _3559 = _1769 * _3551;
    out.m_96.x = _3553;
    float _3561 = fma(_1773, _3555, _1763);
    float _3563 = fma(_1775, _3555, _1765);
    float _3565 = fma(_1769, _3557, _1767);
    float _3567 = _3517;
    float _3569 = _3551;
    float _3571 = _3555;
    float _3573 = _3553;
    if (!_3539)
    {
        _2381 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3575 = _2381;
    float _3577 = _3575;
    float _3579 = _3575;
    if (!_3539)
    {
        _2383 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3581 = _2383;
    out.m_98.x = _3561;
    out.m_98.y = _3563;
    out.m_98.z = _3565;
    out.m_98.w = _3559;
    float _3583 = _3581;
    float _3585 = _3581;
    if (!_3539)
    {
        _3567 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3587 = _3567;
    float _3589 = _3587;
    float _3591 = _3587;
    if (!_3539)
    {
        _3569 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3593 = _3569;
    float _3595 = _3593;
    float _3597 = _3593;
    if (!_3539)
    {
        _3571 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3599 = _3571;
    float _3601 = _3599;
    float _3603 = _3599;
    if (!_3539)
    {
        _3573 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3605 = _3573;
    bool _3607 = !_3539;
    float _3609 = _3605;
    float _3611 = _3605;
    if (!_3607)
    {
        bool _3613 = _1053 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3615 = isnan(_1053);
        bool _3617 = _3613 || _3615;
        bool _3619 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3621 = _3617 || _3619;
        if (!_3621)
        {
            float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3625 = _1053 + _3623;
            float _3627 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3629 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3627;
            float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3633 = _3631 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3635 = 1.0 / _3629;
            float _3637 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3639 = _3637 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3641 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3643 = _3641 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3647 = _3645 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3649 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3651 = _3649 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3653 = _3625 * _3635;
            float _3655 = precise::clamp(_3653, 0.0, 1.0);
            float _3657 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3659 = _3657 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3661 = fma(_3655, _3633, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3663 = fma(_3655, _3659, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3665 = fma(_3655, _3639, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3667 = fma(_3655, _3643, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3669 = fma(_3655, _3647, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3671 = fma(_3655, _3651, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3585 = _3665;
            _3603 = _3669;
            _3579 = _3661;
            _3597 = _3667;
            _3591 = _3663;
            _3611 = _3671;
            _3673 = true;
        }
        else
        {
            bool _3675 = _1053 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3677 = isnan(_1053);
            bool _3679 = _3675 || _3677;
            bool _3681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3683 = _3679 || _3681;
            if (!_3683)
            {
                _3577 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3685 = _3577;
            _3579 = _3685;
            if (!_3683)
            {
                _3583 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3687 = _3583;
            _3585 = _3687;
            if (!_3683)
            {
                _3589 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3689 = _3589;
            _3591 = _3689;
            if (!_3683)
            {
                _3595 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3691 = _3595;
            _3597 = _3691;
            if (!_3683)
            {
                _3601 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3693 = _3601;
            _3603 = _3693;
            if (!_3683)
            {
                _3609 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3695 = _3609;
            bool _3697 = !_3683;
            _3611 = _3695;
            if (!_3697)
            {
                bool _3699 = _1053 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3701 = isnan(_1053);
                bool _3703 = _3699 || _3701;
                bool _3705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3707 = _3703 || _3705;
                if (!_3707)
                {
                    float _3709 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3711 = _1053 + _3709;
                    float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3715 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3713;
                    float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3721 = 1.0 / _3715;
                    float _3723 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3725 = _3723 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3727 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3729 = _3727 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3733 = _3731 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3739 = _3711 * _3721;
                    float _3741 = precise::clamp(_3739, 0.0, 1.0);
                    float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3747 = fma(_3741, _3719, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3749 = fma(_3741, _3745, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3751 = fma(_3741, _3725, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3753 = fma(_3741, _3729, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3755 = fma(_3741, _3733, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3757 = fma(_3741, _3737, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3585 = _3751;
                    _3603 = _3755;
                    _3579 = _3747;
                    _3597 = _3753;
                    _3591 = _3749;
                    _3611 = _3757;
                    _3673 = true;
                }
                else
                {
                    _3585 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3603 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3579 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3597 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3591 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3611 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3673 = false;
    float _3759 = _3585;
    float _3761 = _3603;
    float _3763 = _3579;
    float _3765 = _3597;
    float _3767 = _3591;
    float _3769 = _3611;
    float _3771 = fma(_3437, -0.5, 0.5);
    float _3773 = precise::clamp(_3771, 0.0, 1.0);
    float _3775 = -_3759;
    float _3777 = _3775 + _3761;
    float _3779 = -_3763;
    float _3781 = _3779 + _3765;
    float _3783 = -_3767;
    float _3785 = _3783 + _3769;
    bool _3787 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3789 = fma(_3773, _3777, _3759);
    float _3791 = fma(_3773, _3781, _3763);
    float _3793 = fma(_3773, _3785, _3767);
    float _3795 = _3789 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _3797 = fma(_3791, 0.298911988735198974609375, _3795);
    float _3799 = fma(_3793, 0.114477999508380889892578125, _3797);
    out.m_100.x = 0.0;
    float _3801 = -_3799;
    float _3803 = _3791 + _3801;
    float _3805 = -_3799;
    float _3807 = _3789 + _3805;
    float _3809 = -_3799;
    float _3811 = _3793 + _3809;
    float _3813 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3815 = fma(_3803, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3799);
    float _3817 = fma(_3807, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3799);
    float _3819 = fma(_3811, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3799);
    out.m_96.w = _3813;
    out.m_102.x = _3815;
    out.m_102.y = _3817;
    out.m_102.z = _3819;
    if (!_3787)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3821 = -_995;
    float _3823 = _3821 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3825 = -_1009;
    float _3827 = _3825 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3829 = -_1013;
    float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3833 = _3823 * _3823;
    float _3835 = fma(_3827, _3827, _3833);
    float _3837 = fma(_3831, _3831, _3835);
    float _3839 = sqrt(_3837);
    float _3841 = rsqrt(_3837);
    float _3843 = -_3839;
    float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3847 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3849 = precise::clamp(_3847, 0.0, 1.0);
    float _3851 = _3827 * _3841;
    float _3853 = _3823 * _3841;
    float _3855 = abs(_3849);
    float _3857 = log2(_3855);
    float _3859 = _3831 * _3841;
    float _3861 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3863 = _3437 * _3853;
    float _3865 = -_3853;
    float _3867 = -_3861;
    float _3869 = fma(_3865, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3867);
    float _3871 = fma(_3435, _3851, _3863);
    float _3873 = -_3859;
    float _3875 = fma(_3873, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3869);
    float _3877 = fma(_3441, _3859, _3871);
    float _3879 = precise::clamp(_3877, 0.0, 1.0);
    float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3883 = _3875 + _3881;
    float _3885 = _3857 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3887 = _3883 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3889 = precise::clamp(_3887, 0.0, 1.0);
    float _3891 = exp2(_3885);
    float _3893 = _3891 * _3889;
    float _3895 = _3879 * _3893;
    float _3897 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3899 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3901 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_100.x = _3897;
    out.m_100.y = _3899;
    out.m_100.z = _3901;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3673 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_58.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_61.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3958 = as_type<float>(_137);
        out.gl_Position.z = _3958;
    }
    if (!_125)
    {
        return out;
    }
    float _141 = in.m_63.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = _155;
    if (_151)
    {
        float _159 = float(_121);
        _131 = _159;
    }
    float _161 = _131;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    float _169 = _161;
    if (_167)
    {
        _169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _169;
    if (_167)
    {
        out.m_61.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4028 = as_type<float>(_175);
        out.gl_Position.z = _4028;
    }
    if (_167)
    {
        return out;
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _215;
    if (!_197)
    {
        float _199 = in.m_68.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        float _219 = float(_121);
        float _221 = 1.0 / _219;
        float _223 = _155 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = in.m_68.x;
    float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _231 = log2(_229);
    float _233 = in.m_68.y;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _237 = in.m_68.z;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    int _243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _245 = _243 != 0;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _249 = 1.0 / _241;
    float _251 = _231 * _155;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = _225 + _253;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _261 = _227 * 2.0;
    float _263 = exp2(_251);
    float _265 = _233 * 2.0;
    float _267 = -_235;
    float _269 = fma(_259, 2.0, _267);
    float _271 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _273 = _227 + _233;
    float _275 = _237 * 2.0;
    float _277 = _255 * _249;
    float _279 = floor(_261);
    float _281 = fma(_271, -2.0, _247);
    float _283 = _273 + (-1.0);
    int _285 = as_type<int>(_273);
    if (_245)
    {
        _285 = 0;
    }
    int _287 = _285;
    float _289 = -_155;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[76].x, _269);
    int _293 = _287;
    if (!_245)
    {
        _293 = 1;
    }
    int _295 = _293;
    float _297 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _299 = floor(_265);
    float _301 = _227 + _237;
    bool _303 = _295 != 1;
    float _305 = _237 + _233;
    float _307 = -_263;
    float _309 = _307 + 1.0;
    float _311 = _301 + (-1.0);
    float _313 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _281);
    float _315 = floor(_275);
    bool _317 = _279 >= 0.0;
    bool _319 = isnan(_279);
    bool _321 = _317 || _319;
    bool _323 = isnan(0.0);
    bool _325 = _321 || _323;
    float _327 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _329 = _279 > 0.0;
    float _331 = _305 + (-1.0);
    int _333 = _325 ? 0 : 1;
    bool _335 = _299 >= 0.0;
    bool _337 = isnan(_299);
    bool _339 = _335 || _337;
    bool _341 = isnan(0.0);
    bool _343 = _339 || _341;
    bool _345 = _299 > 0.0;
    float _347 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _349 = _343 ? 0 : 1;
    float _351 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _353 = int(_351);
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _357 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (!_303)
    {
        _355 = _237;
    }
    float _359 = _355;
    bool _361 = _315 > 0.0;
    bool _363 = _315 >= 0.0;
    bool _365 = isnan(_315);
    bool _367 = _363 || _365;
    bool _369 = isnan(0.0);
    bool _371 = _367 || _369;
    int _373 = ~_349;
    int _375 = _373 + 1;
    int _377 = _375 + 1;
    int _379 = _371 ? 0 : 1;
    float _381 = _359;
    int _383 = _377;
    float _385 = _315;
    if (_303)
    {
        _381 = _233;
    }
    float _387 = _381;
    int _389 = ~_379;
    int _391 = _389 + 1;
    int _393 = _391 + 1;
    int _395 = _393;
    if (!_345)
    {
        int _397 = ~_349;
        int _399 = _397 + 1;
        _383 = _399;
    }
    int _401 = _383;
    if (!_361)
    {
        int _403 = ~_379;
        int _405 = _403 + 1;
        _395 = _405;
    }
    int _407 = _395;
    float _409 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[83].w, _257);
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _413 = _411 != 0;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _417 = _415 != 0;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _421 = _419 != 0;
    float _423 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _409);
    if (!_303)
    {
        _385 = _233;
    }
    float _425 = _385;
    bool _427 = !_417;
    int _429 = _427 ? 0 : 1;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _433 = !_413;
    int _435 = _433 ? 0 : 1;
    bool _437 = !_421;
    int _439 = _437 ? 0 : 1;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _451 = _449 != 0;
    float _453 = _425;
    if (_303)
    {
        _453 = _227;
    }
    float _455 = _453;
    float _457 = float(_121);
    bool _459 = !_443;
    int _461 = _459 ? 0 : 1;
    float _463 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[83].z, _431);
    float _465 = 1.0 / _457;
    int _467 = ~_333;
    int _469 = _467 + 1;
    int _471 = _469 + 1;
    int _473 = _471;
    float _475 = _455;
    float _477 = _457;
    if (!_329)
    {
        int _479 = ~_333;
        int _481 = _479 + 1;
        _473 = _481;
    }
    int _483 = _473;
    float _485 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _463);
    if (!_303)
    {
        _475 = _233;
    }
    float _487 = _475;
    float _489 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _491 = int(_489);
    float _493 = _487;
    if (!_303)
    {
        _477 = _237;
    }
    float _495 = _477;
    float _497 = _495;
    if (_303)
    {
        _497 = _233;
    }
    float _499 = _497;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_303)
    {
        _493 = _227;
    }
    float _503 = _493;
    int _505 = abs(_461);
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _509 = !_447;
    int _511 = _509 ? 0 : 1;
    float _513 = _503 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _515 = float(_505);
    float _517 = _465 * _155;
    float _519 = float(_407);
    float _521 = -_501;
    float _523 = fma(_513, 2.0, _521);
    int _525 = abs(_511);
    float _527 = float(_483);
    float _529 = _515 * _519;
    float _531 = in.m_70.x;
    float _533 = in.m_70.y;
    float _535 = in.m_70.z;
    float _537 = float(_491);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _541 = 1.0 + _539;
    float _543 = float(_353);
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _547 = 1.0 / _537;
    bool _549 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _551 = isnan(1.0);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _557 = _553 || _555;
    float _559 = -_155;
    float _561 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[81].x, _523);
    float _563 = fma(_507, -2.0, _545);
    bool _565 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _567 = isnan(0.0);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _573 = _569 || _571;
    float _575 = 1.0 / _543;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _579 = _573 ? _309 : 0.0;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _583 = 1.0 / _541;
    float _585 = float(_525);
    float _587 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[78].z, _581);
    float _589 = _529 * (-2.0);
    float _591 = _547 * _155;
    float _593 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _563);
    float _595 = _585 * _527;
    float _597 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _577);
    float _599 = _227 + (-0.5);
    float _601 = fma(_589, _531, _531);
    float _603 = fma(_297, _589, _297);
    float _605 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _597);
    float _607 = _595 * (-2.0);
    float _609 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[196].x, _601);
    bool _611 = !_451;
    int _613 = _611 ? 0 : 1;
    float _615 = _575 * _155;
    float _617 = fma(_347, _607, _347);
    float _619 = fma(_607, _533, _533);
    int _621 = abs(_613);
    float _623 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _587);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _625;
    if (_557)
    {
        float _629 = _579 * _583;
        _157 = _629;
    }
    float _631 = _157;
    float _633 = _233 + (-0.5);
    float _635 = float(_401);
    float _637 = fma(_603, _631, _609);
    float _639 = float(_621);
    float _641 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[196].y, _619);
    float _643 = _637 * 0.15915493667125701904296875;
    bool _645 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _647 = isnan(_225);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = _639 * _635;
    float _659 = fma(_617, _631, _641);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _661;
    float _665 = fma(_627, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _667 = _657 * (-2.0);
    float _669 = in.m_72.x;
    float _671 = in.m_72.y;
    float _673 = fma(_663, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _675 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _677 = isnan(_225);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -_655;
    float _689 = _687 + 1.0;
    float _691 = in.m_58.x;
    float _693 = in.m_58.y;
    float _695 = in.m_58.z;
    float _697 = fma(_667, _535, _535);
    float _699 = _237 + (-0.5);
    float _701 = _659 * 0.15915493667125701904296875;
    float _703 = in.m_74.x;
    float _705 = in.m_74.y;
    float _707 = in.m_74.z;
    float _709 = in.m_74.w;
    float _711 = _685 * _689;
    float _713 = fma(_327, _667, _327);
    float _715 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[196].z, _697);
    float _717 = -_685;
    float _719 = _717 + 1.0;
    float _721 = _665 * _711;
    float _723 = _673 * _711;
    float _725 = fma(_713, _631, _715);
    float _727 = _643 * 6.283185482025146484375;
    float _729 = sin(_727);
    float _731 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[143].x, _721);
    float _733 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[143].y, _723);
    float _735 = _725 * 0.15915493667125701904296875;
    float _737 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].x, _731);
    float _739 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].y, _733);
    float _741 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _743 = _643 * 6.283185482025146484375;
    float _745 = cos(_743);
    float _747 = _737 * _669;
    float _749 = _739 * _671;
    float _751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _755 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _757 = _701 * 6.283185482025146484375;
    float _759 = sin(_757);
    float _761 = _693 * _705;
    float _763 = _749 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _765 = _755 * _751;
    float _767 = fma(_691, _703, _761);
    float _769 = _763 * _753;
    float _771 = in.m_76.x;
    float _773 = in.m_76.y;
    float _775 = in.m_76.z;
    float _777 = in.m_76.w;
    float _779 = _701 * 6.283185482025146484375;
    float _781 = cos(_779);
    float _783 = fma(_695, _707, _767);
    float _785 = _735 * 6.283185482025146484375;
    float _787 = cos(_785);
    float _789 = _729 * _759;
    float _791 = _745 * _759;
    float _793 = _783 + _709;
    float _795 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _797 = _735 * 6.283185482025146484375;
    float _799 = sin(_797);
    float _801 = _745 * _781;
    float _803 = _729 * _781;
    float _805 = _693 * _773;
    float _807 = _745 * _787;
    float _809 = _729 * _787;
    float _811 = _781 * _787;
    float _813 = _759 * _787;
    float _815 = _807 * _769;
    float _817 = fma(_691, _771, _805);
    float _819 = fma(_799, _801, _789);
    float _821 = -_769;
    float _823 = _799 * _821;
    float _825 = -_803;
    float _827 = fma(_799, _791, _825);
    float _829 = -_791;
    float _831 = fma(_799, _803, _829);
    float _833 = fma(_819, _765, _815);
    float _835 = _809 * _769;
    float _837 = fma(_811, _765, _823);
    float _839 = fma(_799, _789, _801);
    float _841 = fma(_827, _741, _833);
    float _843 = fma(_831, _765, _835);
    float _845 = fma(_813, _741, _837);
    float _847 = fma(_695, _775, _817);
    float _849 = _841 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _851 = fma(_839, _741, _843);
    float _853 = _841 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _855 = _847 + _777;
    float _857 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].x, _849);
    float _859 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].x, _853);
    float _861 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].z, _857);
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].z, _859);
    float _865 = _861 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _867 = _863 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _869 = _793 + _865;
    float _871 = _855 + _867;
    float _873 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _875 = _869 + _873;
    float _877 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _879 = _871 + _877;
    float _881 = _875 * _875;
    float _883 = fma(_879, _879, _881);
    float _885 = in.m_78.x;
    float _887 = in.m_78.y;
    float _889 = in.m_78.z;
    float _891 = in.m_78.w;
    float _893 = sqrt(_883);
    bool _895 = _893 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _897 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _899 = _893 + _897;
    float _901 = _693 * _887;
    float _903 = fma(_691, _885, _901);
    float _905 = _801;
    float _907 = _899;
    float _909 = _783;
    float _911 = _695;
    float _913 = _871;
    float _915 = _869;
    int _917 = 2;
    if (_895)
    {
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _905 = _919;
    }
    float _921 = _905;
    float _923 = fma(_695, _889, _903);
    float _925 = _923 + _891;
    if (_895)
    {
        float _927 = _899 * _921;
        _907 = _927;
    }
    float _929 = _907;
    if (_895)
    {
        float _931 = _929 * 0.15915493667125701904296875;
        _909 = _931;
    }
    float _933 = _909;
    float _935 = _841 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _937 = _921;
    if (_895)
    {
        float _939 = _933 * 6.283185482025146484375;
        float _941 = cos(_939);
        _937 = _941;
    }
    float _943 = _937;
    float _945 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].x, _935);
    float _947 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].z, _945);
    float _949 = _691;
    if (_895)
    {
        float _951 = _933 * 6.283185482025146484375;
        float _953 = sin(_951);
        _949 = _953;
    }
    float _955 = _949;
    float _957 = _947 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _959 = _925 + _957;
    float _961 = _851;
    float _963 = _957;
    float _965 = _959;
    if (_895)
    {
        float _967 = rsqrt(_883);
        _961 = _967;
    }
    float _969 = _961;
    if (_895)
    {
        float _971 = _959 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _963 = _971;
    }
    float _973 = _963;
    if (_895)
    {
        float _975 = _943 + (-1.0);
        _911 = _975;
    }
    float _977 = _911;
    float _979 = _977;
    if (_895)
    {
        float _981 = _977 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _979 = _981;
    }
    float _983 = _979;
    float _985 = _955;
    if (_895)
    {
        float _987 = fma(_955, _973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _985 = _987;
    }
    float _989 = _985;
    float _991 = _989;
    if (_895)
    {
        float _993 = fma(_959, _943, _983);
        _965 = _993;
    }
    float _995 = _965;
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _999 = _995 + _997;
    if (_895)
    {
        float _1001 = _969 * _989;
        _991 = _1001;
    }
    float _1003 = _991;
    float _1005 = _999 * _999;
    if (_895)
    {
        float _1007 = fma(_879, _1003, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _913 = _1007;
    }
    float _1009 = _913;
    if (_895)
    {
        float _1011 = fma(_875, _1003, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _915 = _1011;
    }
    float _1013 = _915;
    float _1015 = _925 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1019 = _1009 + _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1023 = _1013 + _1021;
    float _1025 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1015);
    float _1027 = fma(_1019, _1019, _1005);
    float _1029 = fma(_1023, _1023, _1027);
    float _1031 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1025);
    float _1033 = _925 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1035 = rsqrt(_1029);
    float _1037 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1039 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1033);
    float _1041 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1039);
    float _1043 = 1.0 / _1037;
    float _1045 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1047 = _1045 + _1037;
    float _1049 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1051 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1053 = sqrt(_1029);
    float _1055 = _1019 * _1049;
    float _1057 = _1023 * _1049;
    float _1059 = _925 + _1051;
    float _1061 = _1055 * _1055;
    float _1063 = _1057 * _1057;
    float _1065 = _1047 * _1043;
    float _1067 = _1065 * 0.5;
    float _1069 = _1059 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1071 = _1059 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1073 = _1061 + _1063;
    float _1075 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1077 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1075);
    float _1079 = fma(_855, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1069);
    float _1081 = fma(_855, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1071);
    float _1083 = sqrt(_1073);
    float _1085 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1079);
    float _1087 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1081);
    float _1089 = _1085 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1091 = 1.0 / _1077;
    float _1093 = _1087 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1095 = _1083 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1099 = _1083 + _1097;
    float _1101 = trunc(_1089);
    int _1103 = int(_1101);
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1107 = _1091 * _1105;
    float _1109 = trunc(_1093);
    int _1111 = int(_1109);
    bool _1113 = _1107 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1115 = _1107 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1117 = !_1113;
    int _1119 = _1117 ? 0 : 1;
    float _1121 = _933;
    float _1123 = _1073;
    float _1125 = as_type<float>(_1119);
    float _1127 = _1055;
    float _1129 = _1057;
    float _1131 = _1061;
    float _1133 = _1063;
    if (_1095)
    {
        float _1135 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1121 = _1135;
    }
    float _1137 = _1121;
    int _1139 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1141 = _1103 + _1139;
    int _1143 = _1141 + 1;
    int _1145 = _1143;
    if (!_1113)
    {
        _917 = 1;
    }
    int _1147 = _917;
    int _1149 = _1147;
    if (_1095)
    {
        float _1151 = rsqrt(_1073);
        _1123 = _1151;
    }
    float _1153 = _1123;
    float _1155 = _1153;
    if (!_1115)
    {
        _1149 = _1119;
    }
    int _1157 = _1149;
    bool _1159 = _1143 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1161 = _1157 << 6;
    if (_1095)
    {
        float _1163 = _1099 * _1137;
        _1125 = _1163;
    }
    float _1165 = _1125;
    int _1167 = _1161 + 96;
    uint _1170 = uint(int(uint(_1167) >> uint(2)));
    uint _1172 = uint(int(uint(int(_1170)) >> uint(2)));
    int _1174 = int(_1170) & 3;
    float _1176 = (*spvDescriptorSet0.vp_c15)._m0[int(_1172)][_1174];
    int _1178 = int(_1170) + 1;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    int _1182 = _1178 & 3;
    float _1184 = (*spvDescriptorSet0.vp_c15)._m0[int(_1180)][_1182];
    float _1186 = 0.0;
    if (_1095)
    {
        float _1188 = _1165 * 0.15915493667125701904296875;
        _1186 = _1188;
    }
    float _1190 = _1186;
    float _1192 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1194 = 0.0;
    if (_1095)
    {
        float _1196 = _1190 * 6.283185482025146484375;
        float _1198 = sin(_1196);
        _1194 = _1198;
    }
    float _1200 = _1194;
    int _1202 = _1161 + 48;
    uint _1204 = uint(int(uint(_1202) >> uint(2)));
    uint _1206 = uint(int(uint(int(_1204)) >> uint(2)));
    int _1208 = int(_1204) & 3;
    float _1210 = (*spvDescriptorSet0.vp_c15)._m0[int(_1206)][_1208];
    int _1212 = int(_1204) + 1;
    uint _1214 = uint(int(uint(_1212) >> uint(2)));
    int _1216 = _1212 & 3;
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[int(_1214)][_1216];
    float _1220 = precise::max(0.0, _1192);
    float _1222 = 0.0;
    if (_1095)
    {
        float _1224 = _1190 * 6.283185482025146484375;
        float _1226 = cos(_1224);
        _1222 = _1226;
    }
    float _1228 = _1222;
    float _1230 = -_1049;
    float _1232 = -_1220;
    float _1234 = fma(_999, _1230, _1232);
    int _1236 = _1161 + 64;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    uint _1240 = uint(int(uint(int(_1238)) >> uint(2)));
    int _1242 = int(_1238) & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    int _1246 = int(_1238) + 1;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    int _1250 = _1246 & 3;
    float _1252 = (*spvDescriptorSet0.vp_c15)._m0[int(_1248)][_1250];
    float _1254 = fma(_855, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _1256 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1258 = _1111 + _1256;
    int _1260 = _1258 + 1;
    float _1262 = 0.0;
    if (_1095)
    {
        float _1264 = _1234 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1262 = _1264;
    }
    float _1266 = _1262;
    int _1268 = _1143 | _1260;
    float _1270 = _1266;
    float _1272 = as_type<float>(_1268);
    float _1274 = _1200;
    if (_1095)
    {
        float _1276 = fma(_1200, _1266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1270 = _1276;
    }
    float _1278 = _1270;
    int _1280 = _1161 + 56;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    uint _1284 = uint(int(uint(int(_1282)) >> uint(2)));
    int _1286 = int(_1282) & 3;
    float _1288 = (*spvDescriptorSet0.vp_c15)._m0[int(_1284)][_1286];
    int _1290 = int(_1282) + 1;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    int _1294 = _1290 & 3;
    float _1296 = (*spvDescriptorSet0.vp_c15)._m0[int(_1292)][_1294];
    float _1298 = floor(_1254);
    bool _1300 = _1268 < 0;
    bool _1302 = _1300 || _1159;
    if (_1095)
    {
        float _1304 = _1153 * _1278;
        _1155 = _1304;
    }
    float _1306 = _1155;
    if (!_1095)
    {
        _1272 = _1234;
    }
    float _1308 = _1272;
    float _1310 = _1308;
    if (_1095)
    {
        float _1312 = _1228 + (-1.0);
        _1274 = _1312;
    }
    float _1314 = _1274;
    bool _1316 = _1260 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1318 = _1316 || _1302;
    int _1320 = _1161 + 104;
    uint _1322 = uint(int(uint(_1320) >> uint(2)));
    uint _1324 = uint(int(uint(int(_1322)) >> uint(2)));
    int _1326 = int(_1322) & 3;
    float _1328 = (*spvDescriptorSet0.vp_c15)._m0[int(_1324)][_1326];
    int _1330 = int(_1322) + 1;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    int _1334 = _1330 & 3;
    float _1336 = (*spvDescriptorSet0.vp_c15)._m0[int(_1332)][_1334];
    if (_1095)
    {
        float _1338 = _1055 * _1306;
        _1127 = _1338;
    }
    float _1340 = _1127;
    if (_1095)
    {
        float _1342 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _357 = _1342;
    }
    float _1344 = _357;
    if (_1095)
    {
        float _1346 = _1057 * _1306;
        _1129 = _1346;
    }
    float _1348 = _1129;
    float _1350 = floor(_795);
    if (_1095)
    {
        float _1352 = _1340 * _1340;
        _1131 = _1352;
    }
    float _1354 = _1131;
    if (_1095)
    {
        float _1356 = fma(_1234, _1228, _1344);
        _1310 = _1356;
    }
    float _1358 = _1310;
    if (_1095)
    {
        float _1360 = _1348 * _1348;
        _1133 = _1360;
    }
    float _1362 = _1133;
    int _1364 = _1161 + 72;
    uint _1366 = uint(int(uint(_1364) >> uint(2)));
    uint _1368 = uint(int(uint(int(_1366)) >> uint(2)));
    int _1370 = int(_1366) & 3;
    float _1372 = (*spvDescriptorSet0.vp_c15)._m0[int(_1368)][_1370];
    int _1374 = int(_1366) + 1;
    uint _1376 = uint(int(uint(_1374) >> uint(2)));
    int _1378 = _1374 & 3;
    float _1380 = (*spvDescriptorSet0.vp_c15)._m0[int(_1376)][_1378];
    float _1382 = fma(_1358, _1358, _1354);
    int _1384 = as_type<int>(_1362);
    if (!_1318)
    {
        int _1386 = _1260 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1388 = _1386 + _1143;
        _1145 = _1388;
    }
    int _1390 = _1145;
    float _1392 = -_1298;
    float _1394 = _1254 + _1392;
    float _1396 = _1382 + _1362;
    float _1398 = _1059 * _1184;
    int _1400 = as_type<int>(_1298);
    if (!_1318)
    {
        int _1402 = _1390 << 2;
        _1400 = _1402;
    }
    int _1404 = _1400;
    int _1406 = _1404;
    if (!_1318)
    {
        uint _1408 = uint(int(uint(_1390) >> uint(2)));
        _1384 = int(_1408);
    }
    int _1410 = _1384;
    float _1412 = fma(_855, _1176, _1398);
    float _1414 = rsqrt(_1396);
    if (!_1318)
    {
        int _1416 = 12 & _1404;
        _1406 = _1416;
    }
    int _1418 = _1406;
    float _1420 = -_1350;
    float _1422 = _795 + _1420;
    float _1424 = _1059 * _1218;
    float _1426 = fma(_855, _1210, _1424);
    int _1428 = as_type<int>(_1424);
    if (!_1318)
    {
        int _1430 = _1410 << 4;
        int _1432 = _1430 + _1418;
        _1428 = _1432;
    }
    int _1434 = _1428;
    float _1436 = _1350;
    if (!_1318)
    {
        float _1438 = floor(_1093);
        _1436 = _1438;
    }
    float _1440 = _1436;
    float _1442 = _1059 * _1252;
    float _1444 = fma(_855, _1244, _1442);
    float _1446 = _1414 * _1340;
    float _1448 = _1414 * _1358;
    float _1450 = _1414 * _1348;
    float _1452 = fma(_793, _1288, _1426);
    float _1454 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    int _1456 = _1161 + 80;
    uint _1458 = uint(int(uint(_1456) >> uint(2)));
    uint _1460 = uint(int(uint(int(_1458)) >> uint(2)));
    int _1462 = int(_1458) & 3;
    float _1464 = (*spvDescriptorSet0.vp_c15)._m0[int(_1460)][_1462];
    int _1466 = int(_1458) + 1;
    uint _1468 = uint(int(uint(_1466) >> uint(2)));
    int _1470 = _1466 & 3;
    float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
    float _1474 = _1442;
    if (!_1318)
    {
        float _1476 = floor(_1089);
        _1474 = _1476;
    }
    float _1478 = _1474;
    float _1480 = _1452 + _1296;
    float _1482 = -_1454;
    float _1484 = fma(_1448, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1482);
    float _1486 = _1440;
    if (!_1318)
    {
        float _1488 = -_1440;
        float _1490 = _1093 + _1488;
        _1486 = _1490;
    }
    float _1492 = _1486;
    float _1494 = fma(_793, _1328, _1412);
    float _1496 = _995 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1498 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1500 = _1494 + _1336;
    float _1502 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1496);
    int _1504 = _1161 + 88;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
    int _1514 = int(_1506) + 1;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    int _1518 = _1514 & 3;
    float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
    float _1522 = fma(_793, _1372, _1444);
    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1526 = fma(_1053, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1524);
    float _1528 = precise::clamp(_1526, 0.0, 1.0);
    float _1530 = 1.0 / _1500;
    float _1532 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1502);
    float _1534 = _1522 + _1380;
    float _1536 = -_1528;
    float _1538 = _1536 + 1.0;
    float _1540 = -_1450;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1484);
    float _1544 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1546 = _1522;
    if (!_1318)
    {
        int _1548 = _1434 + 400;
        uint _1550 = uint(int(uint(_1548) >> uint(2)));
        uint _1552 = uint(int(uint(int(_1550)) >> uint(2)));
        int _1554 = int(_1550) & 3;
        float _1556 = (*spvDescriptorSet0.vp_c15)._m0[int(_1552)][_1554];
        _1546 = _1556;
    }
    float _1558 = _1546;
    float _1560 = abs(_1538);
    float _1562 = log2(_1560);
    float _1564 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1566 = fma(_1542, -0.5, 0.5);
    float _1568 = fma(_1542, 0.5, 0.5);
    float _1570 = -_1564;
    float _1572 = fma(_1570, _1498, 1.0);
    float _1574 = _995 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1576 = _1480 * _1530;
    float _1578 = _995 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1580 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1574);
    float _1582 = _1534 * _1530;
    float _1584 = _995 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1586 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1578);
    bool _1588 = _1576 >= 0.0;
    float _1590 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1580);
    float _1592 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1594 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1586);
    bool _1596 = _1576 <= 1.0;
    bool _1598 = _1596 && _1588;
    float _1600 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1584);
    float _1602 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1604 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1606 = _1582 >= 0.0;
    bool _1608 = _1606 && _1598;
    float _1610 = exp2(_1592);
    float _1612 = _1059 * _1472;
    float _1614 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1616 = _1582 <= 1.0;
    bool _1618 = _1616 && _1608;
    float _1620 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1600);
    float _1622 = fma(_855, _1464, _1612);
    float _1624 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1614);
    float _1626 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1628 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1630 = sqrt(_1566);
    float _1632 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1624);
    float _1634 = fma(_1568, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1636 = fma(_793, _1512, _1622);
    float _1638 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1632);
    float _1640 = _1448 + 1.0;
    float _1642 = log2(_1572);
    float _1644 = _1636 + _1520;
    float _1646 = _1566;
    float _1648 = _1568;
    float _1650 = _1582;
    float _1652 = _1638;
    if (_1618)
    {
        float _1654 = float(_1157);
        _1646 = _1654;
    }
    float _1656 = _1646;
    float _1658 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1660 = -_1448;
    float _1662 = fma(_1610, _1640, _1660);
    float _1664 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1626);
    float _1666 = fma(_1568, _1634, -0.212114393711090087890625);
    float _1668 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1658);
    float _1670 = 1.0 / _1638;
    float _1672 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1664);
    float _1674 = fma(_1568, _1666, 1.570728778839111328125);
    float _1676 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1668);
    float _1678 = _1630 * 0.636619746685028076171875;
    float _1680 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1672);
    if (!_1318)
    {
        float _1682 = -_1478;
        float _1684 = _1089 + _1682;
        _1648 = _1684;
    }
    float _1686 = _1648;
    float _1688 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1676);
    float _1690 = _1656;
    float _1692 = _1688;
    if (_1618)
    {
        float _1694 = rint(_1656);
        float _1696 = precise::max(_1694, 0.0);
        uint _1698 = uint(_1696);
        uint _1700 = clamp(_1698, 0u, 65535u);
        _1690 = as_type<float>(_1700);
    }
    float _1702 = _1690;
    float _1704 = _1644 * _1530;
    float _1706 = _1642 * 0.693147182464599609375;
    float _1708 = fma(_1009, 6.2500002968590706586837768554688e-05, 0.5);
    float _1710 = fma(_1013, 6.2500002968590706586837768554688e-05, 0.5);
    float _1712 = -_1674;
    float _1714 = fma(_1678, _1712, 1.0);
    float _1716 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1718 = fma(_1662, 0.5, 0.5);
    float _1720 = _1558;
    if (!_1318)
    {
        float _1722 = rint(_1558);
        float _1724 = precise::max(_1722, 0.0);
        uint _1726 = uint(_1724);
        uint _1728 = clamp(_1726, 0u, 65535u);
        _1720 = as_type<float>(_1728);
    }
    float _1730 = _1720;
    float _1732 = _1688 * _1670;
    float _1734 = _1680 * _1670;
    float _1736 = fma(_1732, 0.5, 0.5);
    float _1738 = fma(_1734, -0.5, 0.5);
    float _1740 = _1738;
    if (_1618)
    {
        float3 _6512 = float3(_1576, _1582, float(as_type<int>(_1702)));
        float3 _6516 = select(_6512, float3(0.0), isnan(_6512));
        float _1742 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6516.xy, uint(rint(_6516.z)), _1704, level(0.0));
        _1650 = _1742;
    }
    float _1744 = _1650;
    float2 _6526 = float2(_1708, _1710);
    float3 _1748 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6526, float2(0.0), isnan(_6526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6526, float2(0.0), isnan(_6526)), level(0.0)).xyz;
    float _1750 = _1748.x;
    float _1752 = _1748.y;
    float _1754 = _1748.z;
    float2 _6542 = float2(_1394, _1422);
    float _1756 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6542, float2(0.0), isnan(_6542)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6542, float2(0.0), isnan(_6542)), level(0.0)).x;
    float3 _6551 = float3(_1736, _1738, _1716);
    float _1758 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6551, float3(0.0), isnan(_6551)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6551, float3(0.0), isnan(_6551)), level(0.0)).x;
    float3 _6560 = float3(_1736, _1738, _1716);
    float4 _1761 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6560, float3(0.0), isnan(_6560)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6560, float3(0.0), isnan(_6560)), level(0.0)).xyzw;
    float _1763 = _1761.x;
    float _1765 = _1761.y;
    float _1767 = _1761.z;
    float _1769 = _1761.w;
    float2 _6576 = float2(_1714, _1718);
    float3 _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6576, float2(0.0), isnan(_6576)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6576, float2(0.0), isnan(_6576)), level(0.0)).xyz;
    float _1773 = _1771.x;
    float _1775 = _1771.y;
    float _1777 = _1771.z;
    float _1779 = _1492;
    if (!_1318)
    {
        float3 _6597 = float3(_1686, _1492, float(as_type<int>(_1730)));
        float3 _6599 = select(_6597, float3(0.0), isnan(_6597));
        float _1781 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6599.xy, uint(rint(_6599.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6599.xy, uint(rint(_6599.z)), level(0.0)).x;
        _1779 = _1781;
    }
    float _1783 = _1779;
    float _1785 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1787 = int(_1785);
    int _1789 = abs(_429);
    float _1791 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1793 = abs(_439);
    float _1795 = -_623;
    float _1797 = _1795 + 1.0;
    float _1799 = -_605;
    float _1801 = _1799 + 1.0;
    float _1803 = -_423;
    float _1805 = _1803 + 1.0;
    float _1807 = trunc(_615);
    int _1809 = int(_1807);
    float _1811 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1813 = float(uint(_1787));
    float _1815 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1817 = int(_1815);
    float _1819 = trunc(_591);
    int _1821 = int(_1819);
    if (_245)
    {
        _1740 = 1.0;
    }
    float _1823 = _1740;
    float _1825 = float(uint(_1809));
    int _1827 = ~_1787;
    int _1829 = _1827 + 1;
    float _1831 = _1823;
    if (!_245)
    {
        _1831 = 7.345489978790283203125;
    }
    float _1833 = _1831;
    float _1835 = 1.0 / _1813;
    float _1837 = float(uint(_1817));
    int _1839 = ~_1787;
    int _1841 = _1839 + 1;
    float _1843 = _1833 * _227;
    int _1845 = ~_1817;
    int _1847 = _1845 + 1;
    float _1849 = float(_1787);
    float _1851 = 1.0 / _1837;
    bool _1853 = _1787 == 0;
    int _1855 = as_type<int>(_1835) + (-2);
    float _1857 = exp2(_1811);
    float _1859 = as_type<float>(_1855) * _1825;
    float _1861 = trunc(_1859);
    float _1863 = precise::max(_1861, 0.0);
    uint _1865 = uint(_1863);
    int _1867 = _1829 * int(_1865);
    int _1869 = _1867 + _1809;
    float _1871 = float(uint(_1869));
    float _1873 = floor(_1843);
    float _1875 = as_type<float>(_1855) * _1871;
    int _1877 = as_type<int>(_1851) + (-2);
    float _1879 = float(uint(_1821));
    float _1881 = trunc(_1875);
    float _1883 = precise::max(_1881, 0.0);
    uint _1885 = uint(_1883);
    float _1887 = as_type<float>(_1877) * _1879;
    float _1889 = -_1873;
    float _1891 = _1843 + _1889;
    float _1893 = trunc(_1887);
    float _1895 = precise::max(_1893, 0.0);
    uint _1897 = uint(_1895);
    float _1899 = float(_1809);
    int _1901 = int(_1865) + int(_1885);
    bool _1903 = _1899 >= _1849;
    bool _1905 = isnan(_1899);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan(_1849);
    bool _1911 = _1907 || _1909;
    float _1913 = float(_1911);
    float _1915 = _1891 * _1849;
    float _1917 = as_type<float>(_1865);
    if (_245)
    {
        _1917 = 1.0;
    }
    float _1919 = _1917;
    int _1921 = _1841 * _1901;
    int _1923 = _1921 + _1809;
    float _1925 = trunc(_1913);
    int _1927 = int(_1925);
    int _1929 = _1847 * int(_1897);
    int _1931 = _1929 + _1821;
    float _1933 = _1919;
    float _1935 = as_type<float>(_1923);
    if (!_245)
    {
        _1933 = 1.2345600128173828125;
    }
    float _1937 = _1933;
    float _1939 = _1849 * _517;
    bool _1941 = uint(_1923) >= uint(_1787);
    float _1943 = float(uint(_1931));
    bool _1945 = !_1941;
    int _1947 = _1945 ? 0 : (-1);
    float _1949 = trunc(_1915);
    int _1951 = int(_1949);
    if (_245)
    {
        _1935 = _227;
    }
    float _1953 = _1935;
    float _1955 = as_type<float>(_1877) * _1943;
    int _1957 = ~_1901;
    int _1959 = _1957 + _1947;
    int _1961 = _1959 + 1;
    float _1963 = _1953;
    if (!_245)
    {
        _1963 = _233;
    }
    float _1965 = _1963;
    int _1967 = _1787 * _1961;
    int _1969 = _1967 + _1809;
    int _1971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1973 = _1971 != 0;
    float _1975 = trunc(_1955);
    float _1977 = precise::max(_1975, 0.0);
    uint _1979 = uint(_1977);
    int _1981 = ~_1927;
    int _1983 = _1981 + 1;
    int _1985 = _1983 + 1;
    float _1987 = _1937 * _1965;
    bool _1989 = !_1973;
    int _1991 = _1989 ? 0 : 1;
    bool _1993 = !_1853;
    int _1995 = _1993 ? _1969 : (-1);
    int _1997 = abs(_1991);
    float _1999 = trunc(_1939);
    int _2001 = int(_1999);
    int _2003 = _1787 + (-1);
    int _2005 = _1995 * _1985;
    int _2007 = abs(_435);
    int _2009 = _1927 * _2003;
    int _2011 = _2009 + _2005;
    float _2013 = floor(_1987);
    int _2015 = _1951 * _1997;
    int _2017 = _2015 + _1809;
    int _2019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2021 = _2019 != 0;
    int _2023 = _2011 * _1789;
    int _2025 = int(_1897) + int(_1979);
    bool _2027 = !_2021;
    int _2029 = _2027 ? 0 : 1;
    int _2031 = _2001 * _2007;
    int _2033 = _2031 + _2023;
    int _2035 = ~_1817;
    int _2037 = _2035 + 1;
    float _2039 = float(_1817);
    float _2041 = float(_1821);
    int _2043 = _2037 * _2025;
    int _2045 = _2043 + _1821;
    int _2047 = abs(_2029);
    float _2049 = -_2013;
    float _2051 = _1987 + _2049;
    float _2053 = _2039 * _517;
    bool _2055 = _2041 >= _2039;
    bool _2057 = isnan(_2041);
    bool _2059 = _2055 || _2057;
    bool _2061 = isnan(_2039);
    bool _2063 = _2059 || _2061;
    float _2065 = float(_2063);
    int _2067 = _2017 * _1793;
    int _2069 = _2067 + _2033;
    bool _2071 = uint(_2045) >= uint(_1817);
    float _2073 = trunc(_2053);
    int _2075 = int(_2073);
    int _2077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2079 = _2077 != 0;
    int _2081 = _1951 * _2047;
    int _2083 = _2081 + _2069;
    bool _2085 = !_2071;
    int _2087 = _2085 ? 0 : (-1);
    float _2089 = _2051 * _2039;
    bool _2091 = !_2079;
    int _2093 = _2091 ? 0 : 1;
    int _2095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2097 = _2095 != 0;
    int _2099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2101 = _2099 != 0;
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2105 = _2103 != 0;
    int _2107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2109 = _2107 != 0;
    float _2111 = trunc(_2065);
    int _2113 = int(_2111);
    int _2115 = ~_2025;
    int _2117 = _2115 + _2087;
    int _2119 = _2117 + 1;
    float _2121 = float(uint(_2083));
    bool _2123 = !_2101;
    int _2125 = _2123 ? 0 : 1;
    int _2127 = _1817 * _2119;
    int _2129 = _2127 + _1821;
    bool _2131 = _1817 == 0;
    float _2133 = trunc(_2089);
    int _2135 = int(_2133);
    float _2137 = as_type<float>(_1855) * _2121;
    int _2139 = abs(_2093);
    bool _2141 = !_2131;
    int _2143 = _2141 ? _2129 : (-1);
    float _2145 = trunc(_2137);
    float _2147 = precise::max(_2145, 0.0);
    uint _2149 = uint(_2147);
    int _2151 = ~_2113;
    int _2153 = _2151 + 1;
    int _2155 = _2153 + 1;
    int _2157 = _1817 + (-1);
    int _2159 = _2143 * _2155;
    int _2161 = ~_1787;
    int _2163 = _2161 + 1;
    int _2165 = _2135 * _2139;
    int _2167 = _2165 + _1821;
    int _2169 = abs(_2125);
    int _2171 = _2113 * _2157;
    int _2173 = _2171 + _2159;
    bool _2175 = !_2097;
    int _2177 = _2175 ? 0 : 1;
    bool _2179 = !_2105;
    int _2181 = _2179 ? 0 : 1;
    int _2183 = _2163 * int(_2149);
    int _2185 = _2183 + _2083;
    int _2187 = abs(_2177);
    bool _2189 = !_2109;
    int _2191 = _2189 ? 0 : 1;
    int _2193 = abs(_2181);
    int _2195 = _2173 * _2169;
    int _2197 = abs(_2191);
    float _2199 = float(uint(_2185));
    int _2201 = _2075 * _2187;
    int _2203 = _2201 + _2195;
    float _2205 = float(uint(_2017));
    float _2207 = as_type<float>(_1855) * _2199;
    float _2209 = float(uint(_2167));
    int _2211 = _2167 * _2193;
    int _2213 = _2211 + _2203;
    int _2215 = ~_1817;
    int _2217 = _2215 + 1;
    int _2219 = _2135 * _2197;
    int _2221 = _2219 + _2213;
    float _2223 = trunc(_2207);
    float _2225 = precise::max(_2223, 0.0);
    uint _2227 = uint(_2225);
    float _2229 = as_type<float>(_1855) * _2205;
    int _2231 = ~_1787;
    int _2233 = _2231 + 1;
    float _2235 = float(uint(_2221));
    int _2237 = ~_1787;
    int _2239 = _2237 + 1;
    float _2241 = trunc(_2229);
    float _2243 = precise::max(_2241, 0.0);
    uint _2245 = uint(_2243);
    float _2247 = as_type<float>(_1877) * _2235;
    float _2249 = trunc(_2247);
    float _2251 = precise::max(_2249, 0.0);
    uint _2253 = uint(_2251);
    int _2255 = int(_2149) + int(_2227);
    float _2257 = as_type<float>(_1877) * _2209;
    int _2259 = ~_1817;
    int _2261 = _2259 + 1;
    int _2263 = _2233 * _2255;
    int _2265 = _2263 + _2083;
    float _2267 = trunc(_2257);
    float _2269 = precise::max(_2267, 0.0);
    uint _2271 = uint(_2269);
    int _2273 = _2239 * int(_2245);
    int _2275 = _2273 + _2017;
    bool _2277 = uint(_2265) >= uint(_1787);
    float _2279 = float(uint(_2275));
    int _2281 = _2217 * int(_2253);
    int _2283 = _2281 + _2221;
    bool _2285 = !_2277;
    int _2287 = _2285 ? 0 : (-1);
    float _2289 = as_type<float>(_1855) * _2279;
    float _2291 = float(uint(_2283));
    int _2293 = ~_2255;
    int _2295 = _2293 + _2287;
    int _2297 = _2295 + 1;
    float _2299 = trunc(_2289);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = as_type<float>(_1877) * _2291;
    int _2307 = _1787 * _2297;
    int _2309 = _2307 + _2083;
    int _2311 = _2261 * int(_2271);
    int _2313 = _2311 + _2167;
    bool _2315 = !_1853;
    int _2317 = _2315 ? _2309 : (-1);
    float _2319 = trunc(_2305);
    float _2321 = precise::max(_2319, 0.0);
    uint _2323 = uint(_2321);
    float _2325 = float(uint(_2313));
    int _2327 = _2317 & 3;
    bool _2329 = _2327 != 0;
    int _2331 = _2317 & 3;
    bool _2333 = _2331 != 0;
    float _2335 = as_type<float>(_1877) * _2325;
    bool _2337 = uint(_2327) > 1u;
    out.m_80.x = _1750;
    out.m_80.y = _1752;
    out.m_80.z = _1754;
    int _2339 = int(_2245) + int(_2303);
    float _2341 = trunc(_2335);
    float _2343 = precise::max(_2341, 0.0);
    uint _2345 = uint(_2343);
    int _2347 = ~_1817;
    int _2349 = _2347 + 1;
    float _2351 = -_1756;
    float _2353 = _2351 + 1.0;
    int _2355 = ~_1787;
    int _2357 = _2355 + 1;
    int _2359 = _2333 ? 0 : 1;
    int _2361 = int(_2253) + int(_2323);
    int _2363 = _2357 * _2339;
    int _2365 = _2363 + _2017;
    int _2367 = ~_2359;
    int _2369 = _2367 + 1;
    int _2371 = _2369 + 1;
    bool _2373 = uint(_2327) >= 2u;
    int _2375 = _2349 * _2361;
    int _2377 = _2375 + _2221;
    int _2379 = _2371;
    float _2381 = _1752;
    float _2383 = _1750;
    if (!_2337)
    {
        int _2385 = ~_2359;
        int _2387 = _2385 + 1;
        _2379 = _2387;
    }
    int _2389 = _2379;
    bool _2391 = uint(_2365) >= uint(_1787);
    int _2393 = _2373 ? 0 : 1;
    bool _2395 = uint(_2377) >= uint(_1817);
    bool _2397 = !_2391;
    int _2399 = _2397 ? 0 : (-1);
    bool _2401 = !_2395;
    int _2403 = _2401 ? 0 : (-1);
    int _2405 = ~_2339;
    int _2407 = _2405 + _2399;
    int _2409 = _2407 + 1;
    bool _2411 = _2327 != 3;
    int _2413 = ~_1817;
    int _2415 = _2413 + 1;
    int _2417 = _1787 * _2409;
    int _2419 = _2417 + _2017;
    int _2421 = ~_2361;
    int _2423 = _2421 + _2403;
    int _2425 = _2423 + 1;
    int _2427 = int(_2271) + int(_2345);
    int _2429 = _1817 * _2425;
    int _2431 = _2429 + _2221;
    int _2433 = ~_2393;
    int _2435 = _2433 + 1;
    int _2437 = _2435 + 1;
    bool _2439 = !_2329;
    int _2441 = _2439 ? 0 : 1;
    int _2443 = _2415 * _2427;
    int _2445 = _2443 + _2167;
    int _2447 = _2437;
    if (_2411)
    {
        int _2449 = ~_2393;
        int _2451 = _2449 + 1;
        _2447 = _2451;
    }
    int _2453 = _2447;
    int _2455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2457 = _2455 != 0;
    bool _2459 = uint(_2445) >= uint(_1817);
    bool _2461 = !_2131;
    int _2463 = _2461 ? _2431 : (-1);
    bool _2465 = !_1853;
    int _2467 = _2465 ? _2419 : (-1);
    float _2469 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2471 = int(_2469);
    int _2473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2475 = _2473 != 0;
    bool _2477 = !_2457;
    int _2479 = _2477 ? 0 : 1;
    bool _2481 = !_2459;
    int _2483 = _2481 ? 0 : (-1);
    int _2485 = _2463 & 3;
    bool _2487 = _2485 != 0;
    int _2489 = _2317 >> 31;
    int _2491 = _2463 >> 31;
    bool _2493 = !_2475;
    int _2495 = _2493 ? 0 : 1;
    int _2497 = ~_2427;
    int _2499 = _2497 + _2483;
    int _2501 = _2499 + 1;
    int _2503 = _2463 & 3;
    bool _2505 = _2503 != 0;
    bool _2507 = !_2487;
    int _2509 = _2507 ? 0 : 1;
    int _2511 = _1817 * _2501;
    int _2513 = _2511 + _2167;
    int _2515 = _2489 & 3;
    int _2517 = _2491 & 3;
    bool _2519 = uint(_2485) > 1u;
    bool _2521 = _233 > 0.5;
    int _2523 = _2505 ? 0 : 1;
    int _2525 = _2317 + _2515;
    int _2527 = _2463 + _2517;
    bool _2529 = _2327 != 3;
    int _2531 = _2525 >> 2;
    int _2533 = _2527 >> 2;
    bool _2535 = !_2529;
    int _2537 = _2535 ? 0 : (-1);
    bool _2539 = uint(_2485) >= 2u;
    int _2541 = _2531 << 4;
    int _2543 = _2541 + 368;
    int _2545 = _2533 << 4;
    int _2547 = _2545 + 512;
    int _2549 = ~_2523;
    int _2551 = _2549 + 1;
    int _2553 = _2551 + 1;
    uint _2555 = uint(int(uint(_2543) >> uint(2)));
    uint _2557 = uint(int(uint(int(_2555)) >> uint(2)));
    int _2559 = int(_2555) & 3;
    float _2561 = (*spvDescriptorSet0.vp_c9)._m0[int(_2557)][_2559];
    int _2563 = int(_2555) + 1;
    uint _2565 = uint(int(uint(_2563) >> uint(2)));
    int _2567 = _2563 & 3;
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[int(_2565)][_2567];
    float _2571 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _2573 = _2553;
    if (!_2519)
    {
        int _2575 = ~_2523;
        int _2577 = _2575 + 1;
        _2573 = _2577;
    }
    int _2579 = _2573;
    int _2581 = _2539 ? 0 : 1;
    float _2583 = _2571 * _227;
    bool _2585 = _2485 != 3;
    float _2587 = in.m_68.w;
    bool _2589 = _2485 != 3;
    uint _2591 = uint(int(uint(_2547) >> uint(2)));
    uint _2593 = uint(int(uint(int(_2591)) >> uint(2)));
    int _2595 = int(_2591) & 3;
    float _2597 = (*spvDescriptorSet0.vp_c9)._m0[int(_2593)][_2595];
    int _2599 = int(_2591) + 1;
    uint _2601 = uint(int(uint(_2599) >> uint(2)));
    int _2603 = _2599 & 3;
    float _2605 = (*spvDescriptorSet0.vp_c9)._m0[int(_2601)][_2603];
    float _2607 = trunc(_2583);
    int _2609 = int(_2607);
    bool _2611 = !_2589;
    int _2613 = _2611 ? 0 : (-1);
    bool _2615 = _227 > 0.5;
    bool _2617 = _237 > 0.5;
    int _2619 = _2543 + 8;
    uint _2621 = uint(int(uint(_2619) >> uint(2)));
    uint _2623 = uint(int(uint(int(_2621)) >> uint(2)));
    int _2625 = int(_2621) & 3;
    float _2627 = (*spvDescriptorSet0.vp_c9)._m0[int(_2623)][_2625];
    int _2629 = int(_2621) + 1;
    uint _2631 = uint(int(uint(_2629) >> uint(2)));
    int _2633 = _2629 & 3;
    float _2635 = (*spvDescriptorSet0.vp_c9)._m0[int(_2631)][_2633];
    bool _2637 = !_2131;
    int _2639 = _2637 ? _2513 : (-1);
    float _2641 = -_191;
    int _2643 = _2617 ? as_type<int>(_2641) : as_type<int>(_191);
    int _2645 = ~_2581;
    int _2647 = _2645 + 1;
    int _2649 = _2647 + 1;
    int _2651 = _2547 + 8;
    uint _2653 = uint(int(uint(_2651) >> uint(2)));
    uint _2655 = uint(int(uint(int(_2653)) >> uint(2)));
    int _2657 = int(_2653) & 3;
    float _2659 = (*spvDescriptorSet0.vp_c9)._m0[int(_2655)][_2657];
    int _2661 = int(_2653) + 1;
    uint _2663 = uint(int(uint(_2661) >> uint(2)));
    int _2665 = _2661 & 3;
    float _2667 = (*spvDescriptorSet0.vp_c9)._m0[int(_2663)][_2665];
    int _2669 = _2609 << 4;
    int _2671 = _2669 + 1968;
    float _2673 = -_195;
    int _2675 = _2521 ? as_type<int>(_2673) : as_type<int>(_195);
    bool _2677 = _2587 > 0.5;
    int _2679 = _2649;
    if (_2585)
    {
        int _2681 = ~_2581;
        int _2683 = _2681 + 1;
        _2679 = _2683;
    }
    int _2685 = _2679;
    uint _2687 = uint(int(uint(_2671) >> uint(2)));
    uint _2689 = uint(int(uint(int(_2687)) >> uint(2)));
    int _2691 = int(_2687) & 3;
    float _2693 = (*spvDescriptorSet0.vp_c9)._m0[int(_2689)][_2691];
    int _2695 = int(_2687) + 1;
    uint _2697 = uint(int(uint(_2695) >> uint(2)));
    int _2699 = _2695 & 3;
    float _2701 = (*spvDescriptorSet0.vp_c9)._m0[int(_2697)][_2699];
    float _2703 = -_191;
    int _2705 = _2615 ? as_type<int>(_2703) : as_type<int>(_191);
    int _2707 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2709 = _2707 != 0;
    int _2711 = abs(_2579);
    int _2713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2715 = _2713 != 0;
    int _2717 = _2671 + 8;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    uint _2721 = uint(int(uint(int(_2719)) >> uint(2)));
    int _2723 = int(_2719) & 3;
    float _2725 = (*spvDescriptorSet0.vp_c9)._m0[int(_2721)][_2723];
    int _2727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2729 = _2727 != 0;
    int _2731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2733 = _2731 != 0;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2737 = ~_2711;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    float _2743 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2745 = abs(_2509);
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2749 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2751 = _2743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2753 = _2735 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2755 = _2747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2757 = _2741 * as_type<int>(_2605);
    int _2759 = abs(_2389);
    out.m_82.x = _2751;
    out.m_82.y = _2753;
    out.m_82.z = _2755;
    out.m_82.w = _2749;
    int _2761 = abs(_2441);
    float _2763 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2765 = int(_2763);
    int _2767 = ~_2761;
    int _2769 = _2767 + 1;
    int _2771 = _2769 + 1;
    int _2773 = ~_2759;
    int _2775 = _2773 + 1;
    int _2777 = _2775 + 1;
    int _2779 = abs(_2613);
    int _2781 = _2777 * as_type<int>(_2569);
    int _2783 = ~_2745;
    int _2785 = _2783 + 1;
    int _2787 = _2785 + 1;
    int _2789 = abs(_2685);
    int _2791 = _2771 * as_type<int>(_2561);
    int _2793 = _2791 + _2781;
    int _2795 = abs(_2453);
    int _2797 = _2787 * as_type<int>(_2597);
    int _2799 = _2797 + _2757;
    int _2801 = ~_2789;
    int _2803 = _2801 + 1;
    int _2805 = _2803 + 1;
    float _2807 = abs(_1107);
    float _2809 = log2(_2807);
    int _2811 = ~_2795;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    int _2817 = abs(_2537);
    int _2819 = _2805 * as_type<int>(_2659);
    int _2821 = _2819 + _2799;
    int _2823 = _2815 * as_type<int>(_2627);
    int _2825 = _2823 + _2793;
    int _2827 = ~_2817;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    float _2833 = _2725 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2835 = float(uint(_2471));
    int _2837 = ~_2779;
    int _2839 = _2837 + 1;
    int _2841 = _2839 + 1;
    int _2843 = _2831 * as_type<int>(_2635);
    int _2845 = _2843 + _2825;
    int _2847 = abs(_2471);
    float _2849 = 1.0 / _2835;
    float _2851 = float(uint(_2765));
    int _2853 = _2841 * as_type<int>(_2667);
    int _2855 = _2853 + _2821;
    float _2857 = _2701 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2859 = _2809 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2861 = _2693 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2863 = abs(_2479);
    float _2865 = 1.0 / _2851;
    int _2867 = abs(_2495);
    float _2869 = _2861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2871 = float(uint(_2847));
    float _2873 = _2857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2875 = ~_2863;
    int _2877 = _2875 + 1;
    int _2879 = _2877 + 1;
    float _2881 = _2833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2883 = ~_2867;
    int _2885 = _2883 + 1;
    int _2887 = _2885 + 1;
    float _2889 = exp2(_2859);
    int _2891 = abs(_2765);
    int _2893 = _2845 * _2879;
    int _2895 = as_type<int>(_2849) + (-2);
    int _2897 = _2855 * _2887;
    float _2899 = float(uint(_2891));
    int _2901 = _2467 * _2863;
    int _2903 = _2901 + _2893;
    float _2905 = _807 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2907 = 1.0 / _2871;
    int _2909 = _2639 * _2867;
    int _2911 = _2909 + _2897;
    out.m_84.x = _2869;
    out.m_84.y = _2873;
    out.m_84.z = _2881;
    float _2913 = _807 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2915 = _807 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2917 = -_799;
    float _2919 = fma(_2917, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2905);
    float _2921 = float(uint(_2903));
    float _2923 = 1.0 / _2899;
    float _2925 = fma(_2889, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2927 = precise::clamp(_2925, 0.0, 1.0);
    float _2929 = -_799;
    float _2931 = fma(_2929, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2913);
    float _2933 = -_799;
    float _2935 = fma(_2933, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2915);
    float _2937 = as_type<float>(_2895) * _2921;
    int _2939 = ~_2471;
    int _2941 = _2939 + 1;
    int _2943 = abs(_2903);
    float _2945 = trunc(_2937);
    float _2947 = precise::max(_2945, 0.0);
    uint _2949 = uint(_2947);
    int _2951 = as_type<int>(_2865) + (-2);
    float _2953 = float(uint(_2911));
    int _2955 = as_type<int>(_2907) + (-2);
    float _2957 = as_type<float>(_2951) * _2953;
    float _2959 = float(uint(_2943));
    float _2961 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2931);
    int _2963 = abs(_2911);
    float _2965 = _819 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2967 = as_type<int>(_2923) + (-2);
    float _2969 = trunc(_2957);
    float _2971 = precise::max(_2969, 0.0);
    uint _2973 = uint(_2971);
    float _2975 = as_type<float>(_2955) * _2959;
    float _2977 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2919);
    float _2979 = float(uint(_2963));
    float _2981 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2935);
    float _2983 = _819 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2985 = ~_2765;
    int _2987 = _2985 + 1;
    float _2989 = as_type<float>(_2967) * _2979;
    float _2991 = trunc(_2975);
    float _2993 = precise::max(_2991, 0.0);
    uint _2995 = uint(_2993);
    int _2997 = _2941 * int(_2949);
    int _2999 = _2997 + _2903;
    int _3001 = ~_2847;
    int _3003 = _3001 + 1;
    float _3005 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2965);
    int _3007 = ~_2891;
    int _3009 = _3007 + 1;
    float _3011 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2983);
    bool _3013 = !_2729;
    float _3015 = _3013 ? _191 : as_type<float>(_2643);
    int _3017 = _2987 * int(_2973);
    int _3019 = _3017 + _2911;
    float _3021 = trunc(_2989);
    float _3023 = precise::max(_3021, 0.0);
    uint _3025 = uint(_3023);
    float _3027 = _819 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3029 = float(uint(_2999));
    float _3031 = float(uint(_3019));
    float _3033 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3027);
    float _3035 = _827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3037 = as_type<float>(_2895) * _3029;
    float _3039 = _827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3041 = as_type<float>(_2951) * _3031;
    int _3043 = _3003 * int(_2995);
    int _3045 = _3043 + _2943;
    float _3047 = _827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3049 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3035);
    float _3051 = trunc(_3041);
    float _3053 = precise::max(_3051, 0.0);
    uint _3055 = uint(_3053);
    float _3057 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3039);
    float _3059 = float(uint(_3045));
    int _3061 = _3009 * int(_3025);
    int _3063 = _3061 + _2963;
    float _3065 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3047);
    float _3067 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3033);
    bool _3069 = !_2715;
    float _3071 = _3069 ? _195 : as_type<float>(_2675);
    float _3073 = as_type<float>(_2955) * _3059;
    float _3075 = trunc(_3037);
    float _3077 = precise::max(_3075, 0.0);
    uint _3079 = uint(_3077);
    float _3081 = float(uint(_3063));
    float _3083 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3005);
    float _3085 = fma(_2927, -2.0, 3.0);
    float _3087 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3049);
    bool _3089 = _1107 <= 8000.0;
    bool _3091 = isnan(_1107);
    bool _3093 = _3089 || _3091;
    bool _3095 = isnan(8000.0);
    bool _3097 = _3093 || _3095;
    float _3099 = float(_3097);
    float _3101 = as_type<float>(_2967) * _3081;
    float _3103 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3011);
    float _3105 = trunc(_3073);
    float _3107 = precise::max(_3105, 0.0);
    uint _3109 = uint(_3107);
    bool _3111 = !_2709;
    float _3113 = _3111 ? _191 : as_type<float>(_2705);
    float _3115 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3117 = -_195;
    int _3119 = _2677 ? as_type<int>(_3117) : as_type<int>(_195);
    float _3121 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3123 = int(_2973) + int(_3055);
    float _3125 = _3115 * _2977;
    int _3127 = ~_2471;
    int _3129 = _3127 + 1;
    float _3131 = trunc(_3101);
    float _3133 = precise::max(_3131, 0.0);
    uint _3135 = uint(_3133);
    int _3137 = int(_2949) + int(_3079);
    float _3139 = _3115 * _2961;
    int _3141 = ~_2765;
    int _3143 = _3141 + 1;
    float _3145 = fma(_3121, _3083, _3125);
    bool _3147 = !_2733;
    float _3149 = _3147 ? _195 : as_type<float>(_3119);
    float _3151 = _2927 * _2927;
    int _3153 = ~_2847;
    int _3155 = _3153 + 1;
    float _3157 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3057);
    out.m_86.x = _3083;
    out.m_86.y = _3103;
    out.m_86.z = _3067;
    float _3159 = fma(_3121, _3103, _3139);
    int _3161 = _3129 * _3137;
    int _3163 = _3161 + _2903;
    int _3165 = int(_2995) + int(_3109);
    int _3167 = _3143 * _3123;
    int _3169 = _3167 + _2911;
    bool _3171 = _2765 == 0;
    float _3173 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3065);
    int _3175 = int(_3025) + int(_3135);
    float _3177 = _3151 * _3085;
    bool _3179 = uint(_3163) >= uint(_2471);
    bool _3181 = uint(_3169) >= uint(_2765);
    int _3183 = ~_2891;
    int _3185 = _3183 + 1;
    float _3187 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1791);
    int _3189 = _3155 * _3165;
    int _3191 = _3189 + _2943;
    bool _3193 = !_3179;
    int _3195 = _3193 ? 0 : (-1);
    int _3197 = _3185 * _3175;
    int _3199 = _3197 + _2963;
    bool _3201 = !_3181;
    int _3203 = _3201 ? 0 : (-1);
    float _3205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3207 = uint(_3191) >= uint(_2847);
    float _3209 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3187);
    int _3211 = _2903 ^ _2471;
    bool _3213 = uint(_3199) >= uint(_2891);
    int _3215 = ~_3123;
    int _3217 = _3215 + _3203;
    int _3219 = _3217 + 1;
    float _3221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3223 = !_3207;
    int _3225 = _3223 ? 0 : (-1);
    uint _3227 = uint(int(uint(_3211) >> uint(31)));
    int _3229 = _2765 * _3219;
    int _3231 = _3229 + _2911;
    int _3233 = ~_3137;
    int _3235 = _3233 + _3195;
    int _3237 = _3235 + 1;
    int _3239 = ~_3225;
    int _3241 = _3165 + _3239;
    int _3243 = _3241 + 1;
    float _3245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3247 = ~int(_3227);
    int _3249 = _3247 + 1;
    int _3251 = _2471 * _3237;
    int _3253 = _3251 + _2903;
    int _3255 = _2911 ^ _2765;
    float _3257 = _3205 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3259 = _3243 ^ _3249;
    bool _3261 = _2471 == 0;
    float _3263 = _3221 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3265 = ~_3249;
    int _3267 = _3265 + _3259;
    int _3269 = _3267 + 1;
    bool _3271 = !_3213;
    int _3273 = _3271 ? 0 : (-1);
    uint _3275 = uint(int(uint(_3255) >> uint(31)));
    float _3277 = fma(_3115, _3115, 1.0);
    bool _3279 = !_3261;
    int _3281 = _3279 ? _3253 : (-1);
    float _3283 = _3245 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3285 = ~_3273;
    int _3287 = _3175 + _3285;
    int _3289 = _3287 + 1;
    int _3291 = ~int(_3275);
    int _3293 = _3291 + 1;
    float _3295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3297 = !_3171;
    int _3299 = _3297 ? _3231 : (-1);
    float _3301 = float(_3281);
    bool _3303 = _2471 == 0;
    int _3305 = _3289 ^ _3293;
    float _3307 = rsqrt(_3277);
    float _3309 = float(_3299);
    float _3311 = fma(_3257, _3301, _291);
    float _3313 = _3113 + 0.5;
    bool _3315 = _2765 == 0;
    int _3317 = ~_3293;
    int _3319 = _3317 + _3305;
    int _3321 = _3319 + 1;
    float _3323 = fma(_3257, _3313, _3311);
    bool _3325 = !_3303;
    int _3327 = _3325 ? _3269 : (-1);
    float _3329 = fma(_3283, _3309, _561);
    float _3331 = _3015 + 0.5;
    bool _3333 = !_3315;
    int _3335 = _3333 ? _3321 : (-1);
    float _3337 = float(_3327);
    float _3339 = fma(_3283, _3331, _3329);
    float _3341 = float(_3335);
    float _3343 = _3295 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3345 = _3071 + (-0.5);
    float _3347 = -_313;
    float _3349 = fma(_3263, _3337, _3347);
    float _3351 = _3115 * _3307;
    float _3353 = -_593;
    float _3355 = fma(_3343, _3341, _3353);
    float _3357 = _3149 + (-0.5);
    float _3359 = _3115 * _2981;
    float _3361 = -_3157;
    float _3363 = _3351 * _3361;
    float _3365 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3209);
    float _3367 = -_3263;
    float _3369 = fma(_3367, _3345, _3349);
    float _3371 = -_3087;
    float _3373 = _3351 * _3371;
    float _3375 = -_3343;
    float _3377 = fma(_3375, _3357, _3355);
    float _3379 = fma(_3307, _2961, _3363);
    float _3381 = -_3173;
    float _3383 = _3351 * _3381;
    float _3385 = -_485;
    float _3387 = _3385 + 1.0;
    float _3389 = _3365 + _1638;
    float _3391 = -_1797;
    float _3393 = fma(_3113, _3391, _3323);
    float _3395 = fma(_3307, _2977, _3373);
    float _3397 = fma(_3071, _1801, _3369);
    float _3399 = fma(_3307, _2981, _3383);
    float _3401 = -_3387;
    float _3403 = fma(_3015, _3401, _3339);
    float _3405 = _3389 * 0.5;
    float _3407 = fma(_3149, _1805, _3377);
    out.m_88.x = _3395;
    out.m_88.y = _3379;
    out.m_88.z = _3399;
    float _3409 = _3351;
    if (!_1618)
    {
        _3409 = 1.0;
    }
    float _3411 = _3409;
    float _3413 = fma(_3121, _3067, _3359);
    float _3415 = _3411;
    if (_1618)
    {
        bool _3417 = _1744 >= _1704;
        bool _3419 = isnan(_1744);
        bool _3421 = _3417 || _3419;
        bool _3423 = isnan(_1704);
        bool _3425 = _3421 || _3423;
        float _3427 = float(_3425);
        _3415 = _3427;
    }
    float _3429 = _3415;
    out.m_90.z = _3405;
    out.m_90.w = _1638;
    float _3431 = -_3177;
    float _3433 = _3431 + 1.0;
    float _3435 = _3087 + _3145;
    float _3437 = _3157 + _3159;
    out.m_92.x = _3393;
    out.m_92.y = _3397;
    out.m_92.z = _3403;
    out.m_92.w = _3407;
    float _3439 = fma(_3433, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3177);
    float _3441 = _3173 + _3413;
    out.gl_Position.x = _1688;
    out.gl_Position.y = _1680;
    out.gl_Position.z = _3365;
    out.gl_Position.w = _1638;
    float _3443 = _3099 * _3439;
    float _3445 = _3443 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3447 = _2353 * _3445;
    float _3449 = precise::clamp(_3447, 0.0, 1.0);
    if (_1318)
    {
        _1692 = 1.0;
    }
    float _3451 = _1692;
    float _3453 = _3451;
    if (!_1318)
    {
        int _3455 = _1390 << 4;
        int _3457 = _3455 + 2048;
        uint _3459 = uint(int(uint(_3457) >> uint(2)));
        uint _3461 = uint(int(uint(int(_3459)) >> uint(2)));
        int _3463 = int(_3459) & 3;
        float _3465 = (*spvDescriptorSet0.vp_c15)._m0[int(_3461)][_3463];
        int _3467 = int(_3459) + 1;
        uint _3469 = uint(int(uint(_3467) >> uint(2)));
        int _3471 = _3467 & 3;
        float _3473 = (*spvDescriptorSet0.vp_c15)._m0[int(_3469)][_3471];
        int _3475 = _3457 + 8;
        uint _3477 = uint(int(uint(_3475) >> uint(2)));
        uint _3479 = uint(int(uint(int(_3477)) >> uint(2)));
        int _3481 = int(_3477) & 3;
        float _3483 = (*spvDescriptorSet0.vp_c15)._m0[int(_3479)][_3481];
        int _3485 = int(_3477) + 1;
        uint _3487 = uint(int(uint(_3485) >> uint(2)));
        int _3489 = _3485 & 3;
        float _3491 = (*spvDescriptorSet0.vp_c15)._m0[int(_3487)][_3489];
        float _3493 = _1059 * _3473;
        float _3495 = fma(_855, _3465, _3493);
        float _3497 = fma(_793, _3483, _3495);
        float _3499 = _3497 + _3491;
        float _3501 = precise::clamp(_3499, 0.0, 1.0);
        float _3503 = -_3501;
        float _3505 = _3503 + _1783;
        float _3507 = fma(_3505, 500.0, 1.5);
        float _3509 = exp2(_3507);
        float _3511 = 0.0 + _3509;
        float _3513 = precise::clamp(_3511, 0.0, 1.0);
        _3453 = _3513;
        _1652 = _3491;
    }
    float _3515 = _3453;
    float _3517 = _1652;
    float _3519 = -_1857;
    float _3521 = _3519 + 1.0;
    float _3523 = _3429 * _3515;
    float _3525 = -_3449;
    float _3527 = fma(_3525, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_94.x = _3435;
    out.m_94.y = _3437;
    out.m_94.z = _3441;
    float _3529 = _3521 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3531 = _1053 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3533 = isnan(_1053);
    bool _3535 = _3531 || _3533;
    bool _3537 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3539 = _3535 || _3537;
    float _3541 = -_3523;
    float _3543 = fma(_3541, _3527, 1.0);
    float _3545 = precise::clamp(_3543, 0.0, 1.0);
    float _3547 = _3529 * _1758;
    float _3549 = -_3529;
    float _3551 = _3549 + 1.0;
    float _3553 = _3545 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3555 = _1769 * _3547;
    float _3557 = _1777 * _3547;
    float _3559 = _1769 * _3551;
    out.m_96.x = _3553;
    float _3561 = fma(_1773, _3555, _1763);
    float _3563 = fma(_1775, _3555, _1765);
    float _3565 = fma(_1769, _3557, _1767);
    float _3567 = _3517;
    float _3569 = _3551;
    float _3571 = _3555;
    float _3573 = _3553;
    if (!_3539)
    {
        _2381 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3575 = _2381;
    float _3577 = _3575;
    float _3579 = _3575;
    if (!_3539)
    {
        _2383 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3581 = _2383;
    out.m_98.x = _3561;
    out.m_98.y = _3563;
    out.m_98.z = _3565;
    out.m_98.w = _3559;
    float _3583 = _3581;
    float _3585 = _3581;
    if (!_3539)
    {
        _3567 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3587 = _3567;
    float _3589 = _3587;
    float _3591 = _3587;
    if (!_3539)
    {
        _3569 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3593 = _3569;
    float _3595 = _3593;
    float _3597 = _3593;
    if (!_3539)
    {
        _3571 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3599 = _3571;
    float _3601 = _3599;
    float _3603 = _3599;
    if (!_3539)
    {
        _3573 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3605 = _3573;
    bool _3607 = !_3539;
    float _3609 = _3605;
    float _3611 = _3605;
    if (!_3607)
    {
        bool _3613 = _1053 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3615 = isnan(_1053);
        bool _3617 = _3613 || _3615;
        bool _3619 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3621 = _3617 || _3619;
        if (!_3621)
        {
            float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3625 = _1053 + _3623;
            float _3627 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3629 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3627;
            float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3633 = _3631 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3635 = 1.0 / _3629;
            float _3637 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3639 = _3637 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3641 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3643 = _3641 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3647 = _3645 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3649 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3651 = _3649 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3653 = _3625 * _3635;
            float _3655 = precise::clamp(_3653, 0.0, 1.0);
            float _3657 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3659 = _3657 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3661 = fma(_3655, _3633, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3663 = fma(_3655, _3659, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3665 = fma(_3655, _3639, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3667 = fma(_3655, _3643, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3669 = fma(_3655, _3647, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3671 = fma(_3655, _3651, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3585 = _3665;
            _3603 = _3669;
            _3579 = _3661;
            _3597 = _3667;
            _3591 = _3663;
            _3611 = _3671;
            _3673 = true;
        }
        else
        {
            bool _3675 = _1053 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3677 = isnan(_1053);
            bool _3679 = _3675 || _3677;
            bool _3681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3683 = _3679 || _3681;
            if (!_3683)
            {
                _3577 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3685 = _3577;
            _3579 = _3685;
            if (!_3683)
            {
                _3583 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3687 = _3583;
            _3585 = _3687;
            if (!_3683)
            {
                _3589 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3689 = _3589;
            _3591 = _3689;
            if (!_3683)
            {
                _3595 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3691 = _3595;
            _3597 = _3691;
            if (!_3683)
            {
                _3601 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3693 = _3601;
            _3603 = _3693;
            if (!_3683)
            {
                _3609 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3695 = _3609;
            bool _3697 = !_3683;
            _3611 = _3695;
            if (!_3697)
            {
                bool _3699 = _1053 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3701 = isnan(_1053);
                bool _3703 = _3699 || _3701;
                bool _3705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3707 = _3703 || _3705;
                if (!_3707)
                {
                    float _3709 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3711 = _1053 + _3709;
                    float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3715 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3713;
                    float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3721 = 1.0 / _3715;
                    float _3723 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3725 = _3723 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3727 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3729 = _3727 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3733 = _3731 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3739 = _3711 * _3721;
                    float _3741 = precise::clamp(_3739, 0.0, 1.0);
                    float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3747 = fma(_3741, _3719, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3749 = fma(_3741, _3745, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3751 = fma(_3741, _3725, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3753 = fma(_3741, _3729, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3755 = fma(_3741, _3733, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3757 = fma(_3741, _3737, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3585 = _3751;
                    _3603 = _3755;
                    _3579 = _3747;
                    _3597 = _3753;
                    _3591 = _3749;
                    _3611 = _3757;
                    _3673 = true;
                }
                else
                {
                    _3585 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3603 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3579 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3597 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3591 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3611 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3673 = false;
    float _3759 = _3585;
    float _3761 = _3603;
    float _3763 = _3579;
    float _3765 = _3597;
    float _3767 = _3591;
    float _3769 = _3611;
    float _3771 = fma(_3437, -0.5, 0.5);
    float _3773 = precise::clamp(_3771, 0.0, 1.0);
    float _3775 = -_3759;
    float _3777 = _3775 + _3761;
    float _3779 = -_3763;
    float _3781 = _3779 + _3765;
    float _3783 = -_3767;
    float _3785 = _3783 + _3769;
    bool _3787 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3789 = fma(_3773, _3777, _3759);
    float _3791 = fma(_3773, _3781, _3763);
    float _3793 = fma(_3773, _3785, _3767);
    float _3795 = _3789 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _3797 = fma(_3791, 0.298911988735198974609375, _3795);
    float _3799 = fma(_3793, 0.114477999508380889892578125, _3797);
    out.m_100.x = 0.0;
    float _3801 = -_3799;
    float _3803 = _3791 + _3801;
    float _3805 = -_3799;
    float _3807 = _3789 + _3805;
    float _3809 = -_3799;
    float _3811 = _3793 + _3809;
    float _3813 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3815 = fma(_3803, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3799);
    float _3817 = fma(_3807, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3799);
    float _3819 = fma(_3811, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3799);
    out.m_96.w = _3813;
    out.m_102.x = _3815;
    out.m_102.y = _3817;
    out.m_102.z = _3819;
    if (!_3787)
    {
        return out;
    }
    float _3821 = -_995;
    float _3823 = _3821 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3825 = -_1009;
    float _3827 = _3825 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3829 = -_1013;
    float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3833 = _3823 * _3823;
    float _3835 = fma(_3827, _3827, _3833);
    float _3837 = fma(_3831, _3831, _3835);
    float _3839 = sqrt(_3837);
    float _3841 = rsqrt(_3837);
    float _3843 = -_3839;
    float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3847 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3849 = precise::clamp(_3847, 0.0, 1.0);
    float _3851 = _3827 * _3841;
    float _3853 = _3823 * _3841;
    float _3855 = abs(_3849);
    float _3857 = log2(_3855);
    float _3859 = _3831 * _3841;
    float _3861 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3863 = _3437 * _3853;
    float _3865 = -_3853;
    float _3867 = -_3861;
    float _3869 = fma(_3865, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3867);
    float _3871 = fma(_3435, _3851, _3863);
    float _3873 = -_3859;
    float _3875 = fma(_3873, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3869);
    float _3877 = fma(_3441, _3859, _3871);
    float _3879 = precise::clamp(_3877, 0.0, 1.0);
    float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3883 = _3875 + _3881;
    float _3885 = _3857 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3887 = _3883 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3889 = precise::clamp(_3887, 0.0, 1.0);
    float _3891 = exp2(_3885);
    float _3893 = _3891 * _3889;
    float _3895 = _3879 * _3893;
    float _3897 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3899 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3901 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_100.x = _3897;
    out.m_100.y = _3899;
    out.m_100.z = _3901;
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
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3673 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_58.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_61.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3958 = as_type<float>(_137);
        out.gl_Position.z = _3958;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_63.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = _155;
    if (_151)
    {
        float _159 = float(_121);
        _131 = _159;
    }
    float _161 = _131;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    float _169 = _161;
    if (_167)
    {
        _169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _169;
    if (_167)
    {
        out.m_61.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4028 = as_type<float>(_175);
        out.gl_Position.z = _4028;
    }
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _177 = as_type<float>(int(gl_VertexIndex));
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _181 = as_type<int>(_177) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_177) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_179;
    float _215;
    if (!_197)
    {
        float _199 = in.m_68.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        float _219 = float(_121);
        float _221 = 1.0 / _219;
        float _223 = _155 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = in.m_68.x;
    float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _231 = log2(_229);
    float _233 = in.m_68.y;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _237 = in.m_68.z;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    int _243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _245 = _243 != 0;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _249 = 1.0 / _241;
    float _251 = _231 * _155;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = _225 + _253;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _259 = _227 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _261 = _227 * 2.0;
    float _263 = exp2(_251);
    float _265 = _233 * 2.0;
    float _267 = -_235;
    float _269 = fma(_259, 2.0, _267);
    float _271 = _233 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _273 = _227 + _233;
    float _275 = _237 * 2.0;
    float _277 = _255 * _249;
    float _279 = floor(_261);
    float _281 = fma(_271, -2.0, _247);
    float _283 = _273 + (-1.0);
    int _285 = as_type<int>(_273);
    if (_245)
    {
        _285 = 0;
    }
    int _287 = _285;
    float _289 = -_155;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[76].x, _269);
    int _293 = _287;
    if (!_245)
    {
        _293 = 1;
    }
    int _295 = _293;
    float _297 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _299 = floor(_265);
    float _301 = _227 + _237;
    bool _303 = _295 != 1;
    float _305 = _237 + _233;
    float _307 = -_263;
    float _309 = _307 + 1.0;
    float _311 = _301 + (-1.0);
    float _313 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _281);
    float _315 = floor(_275);
    bool _317 = _279 >= 0.0;
    bool _319 = isnan(_279);
    bool _321 = _317 || _319;
    bool _323 = isnan(0.0);
    bool _325 = _321 || _323;
    float _327 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _329 = _279 > 0.0;
    float _331 = _305 + (-1.0);
    int _333 = _325 ? 0 : 1;
    bool _335 = _299 >= 0.0;
    bool _337 = isnan(_299);
    bool _339 = _335 || _337;
    bool _341 = isnan(0.0);
    bool _343 = _339 || _341;
    bool _345 = _299 > 0.0;
    float _347 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _349 = _343 ? 0 : 1;
    float _351 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _353 = int(_351);
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _357 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (!_303)
    {
        _355 = _237;
    }
    float _359 = _355;
    bool _361 = _315 > 0.0;
    bool _363 = _315 >= 0.0;
    bool _365 = isnan(_315);
    bool _367 = _363 || _365;
    bool _369 = isnan(0.0);
    bool _371 = _367 || _369;
    int _373 = ~_349;
    int _375 = _373 + 1;
    int _377 = _375 + 1;
    int _379 = _371 ? 0 : 1;
    float _381 = _359;
    int _383 = _377;
    float _385 = _315;
    if (_303)
    {
        _381 = _233;
    }
    float _387 = _381;
    int _389 = ~_379;
    int _391 = _389 + 1;
    int _393 = _391 + 1;
    int _395 = _393;
    if (!_345)
    {
        int _397 = ~_349;
        int _399 = _397 + 1;
        _383 = _399;
    }
    int _401 = _383;
    if (!_361)
    {
        int _403 = ~_379;
        int _405 = _403 + 1;
        _395 = _405;
    }
    int _407 = _395;
    float _409 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[83].w, _257);
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _413 = _411 != 0;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _417 = _415 != 0;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _421 = _419 != 0;
    float _423 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _409);
    if (!_303)
    {
        _385 = _233;
    }
    float _425 = _385;
    bool _427 = !_417;
    int _429 = _427 ? 0 : 1;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _433 = !_413;
    int _435 = _433 ? 0 : 1;
    bool _437 = !_421;
    int _439 = _437 ? 0 : 1;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _443 = _441 != 0;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _451 = _449 != 0;
    float _453 = _425;
    if (_303)
    {
        _453 = _227;
    }
    float _455 = _453;
    float _457 = float(_121);
    bool _459 = !_443;
    int _461 = _459 ? 0 : 1;
    float _463 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[83].z, _431);
    float _465 = 1.0 / _457;
    int _467 = ~_333;
    int _469 = _467 + 1;
    int _471 = _469 + 1;
    int _473 = _471;
    float _475 = _455;
    float _477 = _457;
    if (!_329)
    {
        int _479 = ~_333;
        int _481 = _479 + 1;
        _473 = _481;
    }
    int _483 = _473;
    float _485 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _463);
    if (!_303)
    {
        _475 = _233;
    }
    float _487 = _475;
    float _489 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _491 = int(_489);
    float _493 = _487;
    if (!_303)
    {
        _477 = _237;
    }
    float _495 = _477;
    float _497 = _495;
    if (_303)
    {
        _497 = _233;
    }
    float _499 = _497;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_303)
    {
        _493 = _227;
    }
    float _503 = _493;
    int _505 = abs(_461);
    float _507 = _499 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _509 = !_447;
    int _511 = _509 ? 0 : 1;
    float _513 = _503 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _515 = float(_505);
    float _517 = _465 * _155;
    float _519 = float(_407);
    float _521 = -_501;
    float _523 = fma(_513, 2.0, _521);
    int _525 = abs(_511);
    float _527 = float(_483);
    float _529 = _515 * _519;
    float _531 = in.m_70.x;
    float _533 = in.m_70.y;
    float _535 = in.m_70.z;
    float _537 = float(_491);
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _541 = 1.0 + _539;
    float _543 = float(_353);
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _547 = 1.0 / _537;
    bool _549 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _551 = isnan(1.0);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _557 = _553 || _555;
    float _559 = -_155;
    float _561 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[81].x, _523);
    float _563 = fma(_507, -2.0, _545);
    bool _565 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _567 = isnan(0.0);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _573 = _569 || _571;
    float _575 = 1.0 / _543;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _579 = _573 ? _309 : 0.0;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _583 = 1.0 / _541;
    float _585 = float(_525);
    float _587 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[78].z, _581);
    float _589 = _529 * (-2.0);
    float _591 = _547 * _155;
    float _593 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _563);
    float _595 = _585 * _527;
    float _597 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[78].w, _577);
    float _599 = _227 + (-0.5);
    float _601 = fma(_589, _531, _531);
    float _603 = fma(_297, _589, _297);
    float _605 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _597);
    float _607 = _595 * (-2.0);
    float _609 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[196].x, _601);
    bool _611 = !_451;
    int _613 = _611 ? 0 : 1;
    float _615 = _575 * _155;
    float _617 = fma(_347, _607, _347);
    float _619 = fma(_607, _533, _533);
    int _621 = abs(_613);
    float _623 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _587);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _625;
    if (_557)
    {
        float _629 = _579 * _583;
        _157 = _629;
    }
    float _631 = _157;
    float _633 = _233 + (-0.5);
    float _635 = float(_401);
    float _637 = fma(_603, _631, _609);
    float _639 = float(_621);
    float _641 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[196].y, _619);
    float _643 = _637 * 0.15915493667125701904296875;
    bool _645 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _647 = isnan(_225);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = _639 * _635;
    float _659 = fma(_617, _631, _641);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _661;
    float _665 = fma(_627, _277, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _667 = _657 * (-2.0);
    float _669 = in.m_72.x;
    float _671 = in.m_72.y;
    float _673 = fma(_663, _277, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _675 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _677 = isnan(_225);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -_655;
    float _689 = _687 + 1.0;
    float _691 = in.m_58.x;
    float _693 = in.m_58.y;
    float _695 = in.m_58.z;
    float _697 = fma(_667, _535, _535);
    float _699 = _237 + (-0.5);
    float _701 = _659 * 0.15915493667125701904296875;
    float _703 = in.m_74.x;
    float _705 = in.m_74.y;
    float _707 = in.m_74.z;
    float _709 = in.m_74.w;
    float _711 = _685 * _689;
    float _713 = fma(_327, _667, _327);
    float _715 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[196].z, _697);
    float _717 = -_685;
    float _719 = _717 + 1.0;
    float _721 = _665 * _711;
    float _723 = _673 * _711;
    float _725 = fma(_713, _631, _715);
    float _727 = _643 * 6.283185482025146484375;
    float _729 = sin(_727);
    float _731 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[143].x, _721);
    float _733 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[143].y, _723);
    float _735 = _725 * 0.15915493667125701904296875;
    float _737 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].x, _731);
    float _739 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[144].y, _733);
    float _741 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _743 = _643 * 6.283185482025146484375;
    float _745 = cos(_743);
    float _747 = _737 * _669;
    float _749 = _739 * _671;
    float _751 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _753 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _755 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _757 = _701 * 6.283185482025146484375;
    float _759 = sin(_757);
    float _761 = _693 * _705;
    float _763 = _749 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _765 = _755 * _751;
    float _767 = fma(_691, _703, _761);
    float _769 = _763 * _753;
    float _771 = in.m_76.x;
    float _773 = in.m_76.y;
    float _775 = in.m_76.z;
    float _777 = in.m_76.w;
    float _779 = _701 * 6.283185482025146484375;
    float _781 = cos(_779);
    float _783 = fma(_695, _707, _767);
    float _785 = _735 * 6.283185482025146484375;
    float _787 = cos(_785);
    float _789 = _729 * _759;
    float _791 = _745 * _759;
    float _793 = _783 + _709;
    float _795 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _797 = _735 * 6.283185482025146484375;
    float _799 = sin(_797);
    float _801 = _745 * _781;
    float _803 = _729 * _781;
    float _805 = _693 * _773;
    float _807 = _745 * _787;
    float _809 = _729 * _787;
    float _811 = _781 * _787;
    float _813 = _759 * _787;
    float _815 = _807 * _769;
    float _817 = fma(_691, _771, _805);
    float _819 = fma(_799, _801, _789);
    float _821 = -_769;
    float _823 = _799 * _821;
    float _825 = -_803;
    float _827 = fma(_799, _791, _825);
    float _829 = -_791;
    float _831 = fma(_799, _803, _829);
    float _833 = fma(_819, _765, _815);
    float _835 = _809 * _769;
    float _837 = fma(_811, _765, _823);
    float _839 = fma(_799, _789, _801);
    float _841 = fma(_827, _741, _833);
    float _843 = fma(_831, _765, _835);
    float _845 = fma(_813, _741, _837);
    float _847 = fma(_695, _775, _817);
    float _849 = _841 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _851 = fma(_839, _741, _843);
    float _853 = _841 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _855 = _847 + _777;
    float _857 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].x, _849);
    float _859 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].x, _853);
    float _861 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].z, _857);
    float _863 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].z, _859);
    float _865 = _861 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _867 = _863 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _869 = _793 + _865;
    float _871 = _855 + _867;
    float _873 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _875 = _869 + _873;
    float _877 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _879 = _871 + _877;
    float _881 = _875 * _875;
    float _883 = fma(_879, _879, _881);
    float _885 = in.m_78.x;
    float _887 = in.m_78.y;
    float _889 = in.m_78.z;
    float _891 = in.m_78.w;
    float _893 = sqrt(_883);
    bool _895 = _893 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _897 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _899 = _893 + _897;
    float _901 = _693 * _887;
    float _903 = fma(_691, _885, _901);
    float _905 = _801;
    float _907 = _899;
    float _909 = _783;
    float _911 = _695;
    float _913 = _871;
    float _915 = _869;
    int _917 = 2;
    if (_895)
    {
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _905 = _919;
    }
    float _921 = _905;
    float _923 = fma(_695, _889, _903);
    float _925 = _923 + _891;
    if (_895)
    {
        float _927 = _899 * _921;
        _907 = _927;
    }
    float _929 = _907;
    if (_895)
    {
        float _931 = _929 * 0.15915493667125701904296875;
        _909 = _931;
    }
    float _933 = _909;
    float _935 = _841 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _937 = _921;
    if (_895)
    {
        float _939 = _933 * 6.283185482025146484375;
        float _941 = cos(_939);
        _937 = _941;
    }
    float _943 = _937;
    float _945 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].x, _935);
    float _947 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].z, _945);
    float _949 = _691;
    if (_895)
    {
        float _951 = _933 * 6.283185482025146484375;
        float _953 = sin(_951);
        _949 = _953;
    }
    float _955 = _949;
    float _957 = _947 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _959 = _925 + _957;
    float _961 = _851;
    float _963 = _957;
    float _965 = _959;
    if (_895)
    {
        float _967 = rsqrt(_883);
        _961 = _967;
    }
    float _969 = _961;
    if (_895)
    {
        float _971 = _959 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _963 = _971;
    }
    float _973 = _963;
    if (_895)
    {
        float _975 = _943 + (-1.0);
        _911 = _975;
    }
    float _977 = _911;
    float _979 = _977;
    if (_895)
    {
        float _981 = _977 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _979 = _981;
    }
    float _983 = _979;
    float _985 = _955;
    if (_895)
    {
        float _987 = fma(_955, _973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _985 = _987;
    }
    float _989 = _985;
    float _991 = _989;
    if (_895)
    {
        float _993 = fma(_959, _943, _983);
        _965 = _993;
    }
    float _995 = _965;
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _999 = _995 + _997;
    if (_895)
    {
        float _1001 = _969 * _989;
        _991 = _1001;
    }
    float _1003 = _991;
    float _1005 = _999 * _999;
    if (_895)
    {
        float _1007 = fma(_879, _1003, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _913 = _1007;
    }
    float _1009 = _913;
    if (_895)
    {
        float _1011 = fma(_875, _1003, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _915 = _1011;
    }
    float _1013 = _915;
    float _1015 = _925 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1019 = _1009 + _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1023 = _1013 + _1021;
    float _1025 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1015);
    float _1027 = fma(_1019, _1019, _1005);
    float _1029 = fma(_1023, _1023, _1027);
    float _1031 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1025);
    float _1033 = _925 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1035 = rsqrt(_1029);
    float _1037 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1039 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1033);
    float _1041 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1039);
    float _1043 = 1.0 / _1037;
    float _1045 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1047 = _1045 + _1037;
    float _1049 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1051 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1053 = sqrt(_1029);
    float _1055 = _1019 * _1049;
    float _1057 = _1023 * _1049;
    float _1059 = _925 + _1051;
    float _1061 = _1055 * _1055;
    float _1063 = _1057 * _1057;
    float _1065 = _1047 * _1043;
    float _1067 = _1065 * 0.5;
    float _1069 = _1059 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1071 = _1059 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1073 = _1061 + _1063;
    float _1075 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1077 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1075);
    float _1079 = fma(_855, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1069);
    float _1081 = fma(_855, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1071);
    float _1083 = sqrt(_1073);
    float _1085 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1079);
    float _1087 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1081);
    float _1089 = _1085 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1091 = 1.0 / _1077;
    float _1093 = _1087 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _1095 = _1083 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1099 = _1083 + _1097;
    float _1101 = trunc(_1089);
    int _1103 = int(_1101);
    float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1107 = _1091 * _1105;
    float _1109 = trunc(_1093);
    int _1111 = int(_1109);
    bool _1113 = _1107 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1115 = _1107 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1117 = !_1113;
    int _1119 = _1117 ? 0 : 1;
    float _1121 = _933;
    float _1123 = _1073;
    float _1125 = as_type<float>(_1119);
    float _1127 = _1055;
    float _1129 = _1057;
    float _1131 = _1061;
    float _1133 = _1063;
    if (_1095)
    {
        float _1135 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1121 = _1135;
    }
    float _1137 = _1121;
    int _1139 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1141 = _1103 + _1139;
    int _1143 = _1141 + 1;
    int _1145 = _1143;
    if (!_1113)
    {
        _917 = 1;
    }
    int _1147 = _917;
    int _1149 = _1147;
    if (_1095)
    {
        float _1151 = rsqrt(_1073);
        _1123 = _1151;
    }
    float _1153 = _1123;
    float _1155 = _1153;
    if (!_1115)
    {
        _1149 = _1119;
    }
    int _1157 = _1149;
    bool _1159 = _1143 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1161 = _1157 << 6;
    if (_1095)
    {
        float _1163 = _1099 * _1137;
        _1125 = _1163;
    }
    float _1165 = _1125;
    int _1167 = _1161 + 96;
    uint _1170 = uint(int(uint(_1167) >> uint(2)));
    uint _1172 = uint(int(uint(int(_1170)) >> uint(2)));
    int _1174 = int(_1170) & 3;
    float _1176 = (*spvDescriptorSet0.vp_c15)._m0[int(_1172)][_1174];
    int _1178 = int(_1170) + 1;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    int _1182 = _1178 & 3;
    float _1184 = (*spvDescriptorSet0.vp_c15)._m0[int(_1180)][_1182];
    float _1186 = 0.0;
    if (_1095)
    {
        float _1188 = _1165 * 0.15915493667125701904296875;
        _1186 = _1188;
    }
    float _1190 = _1186;
    float _1192 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1194 = 0.0;
    if (_1095)
    {
        float _1196 = _1190 * 6.283185482025146484375;
        float _1198 = sin(_1196);
        _1194 = _1198;
    }
    float _1200 = _1194;
    int _1202 = _1161 + 48;
    uint _1204 = uint(int(uint(_1202) >> uint(2)));
    uint _1206 = uint(int(uint(int(_1204)) >> uint(2)));
    int _1208 = int(_1204) & 3;
    float _1210 = (*spvDescriptorSet0.vp_c15)._m0[int(_1206)][_1208];
    int _1212 = int(_1204) + 1;
    uint _1214 = uint(int(uint(_1212) >> uint(2)));
    int _1216 = _1212 & 3;
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[int(_1214)][_1216];
    float _1220 = precise::max(0.0, _1192);
    float _1222 = 0.0;
    if (_1095)
    {
        float _1224 = _1190 * 6.283185482025146484375;
        float _1226 = cos(_1224);
        _1222 = _1226;
    }
    float _1228 = _1222;
    float _1230 = -_1049;
    float _1232 = -_1220;
    float _1234 = fma(_999, _1230, _1232);
    int _1236 = _1161 + 64;
    uint _1238 = uint(int(uint(_1236) >> uint(2)));
    uint _1240 = uint(int(uint(int(_1238)) >> uint(2)));
    int _1242 = int(_1238) & 3;
    float _1244 = (*spvDescriptorSet0.vp_c15)._m0[int(_1240)][_1242];
    int _1246 = int(_1238) + 1;
    uint _1248 = uint(int(uint(_1246) >> uint(2)));
    int _1250 = _1246 & 3;
    float _1252 = (*spvDescriptorSet0.vp_c15)._m0[int(_1248)][_1250];
    float _1254 = fma(_855, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _1256 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1258 = _1111 + _1256;
    int _1260 = _1258 + 1;
    float _1262 = 0.0;
    if (_1095)
    {
        float _1264 = _1234 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1262 = _1264;
    }
    float _1266 = _1262;
    int _1268 = _1143 | _1260;
    float _1270 = _1266;
    float _1272 = as_type<float>(_1268);
    float _1274 = _1200;
    if (_1095)
    {
        float _1276 = fma(_1200, _1266, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1270 = _1276;
    }
    float _1278 = _1270;
    int _1280 = _1161 + 56;
    uint _1282 = uint(int(uint(_1280) >> uint(2)));
    uint _1284 = uint(int(uint(int(_1282)) >> uint(2)));
    int _1286 = int(_1282) & 3;
    float _1288 = (*spvDescriptorSet0.vp_c15)._m0[int(_1284)][_1286];
    int _1290 = int(_1282) + 1;
    uint _1292 = uint(int(uint(_1290) >> uint(2)));
    int _1294 = _1290 & 3;
    float _1296 = (*spvDescriptorSet0.vp_c15)._m0[int(_1292)][_1294];
    float _1298 = floor(_1254);
    bool _1300 = _1268 < 0;
    bool _1302 = _1300 || _1159;
    if (_1095)
    {
        float _1304 = _1153 * _1278;
        _1155 = _1304;
    }
    float _1306 = _1155;
    if (!_1095)
    {
        _1272 = _1234;
    }
    float _1308 = _1272;
    float _1310 = _1308;
    if (_1095)
    {
        float _1312 = _1228 + (-1.0);
        _1274 = _1312;
    }
    float _1314 = _1274;
    bool _1316 = _1260 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1318 = _1316 || _1302;
    int _1320 = _1161 + 104;
    uint _1322 = uint(int(uint(_1320) >> uint(2)));
    uint _1324 = uint(int(uint(int(_1322)) >> uint(2)));
    int _1326 = int(_1322) & 3;
    float _1328 = (*spvDescriptorSet0.vp_c15)._m0[int(_1324)][_1326];
    int _1330 = int(_1322) + 1;
    uint _1332 = uint(int(uint(_1330) >> uint(2)));
    int _1334 = _1330 & 3;
    float _1336 = (*spvDescriptorSet0.vp_c15)._m0[int(_1332)][_1334];
    if (_1095)
    {
        float _1338 = _1055 * _1306;
        _1127 = _1338;
    }
    float _1340 = _1127;
    if (_1095)
    {
        float _1342 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _357 = _1342;
    }
    float _1344 = _357;
    if (_1095)
    {
        float _1346 = _1057 * _1306;
        _1129 = _1346;
    }
    float _1348 = _1129;
    float _1350 = floor(_795);
    if (_1095)
    {
        float _1352 = _1340 * _1340;
        _1131 = _1352;
    }
    float _1354 = _1131;
    if (_1095)
    {
        float _1356 = fma(_1234, _1228, _1344);
        _1310 = _1356;
    }
    float _1358 = _1310;
    if (_1095)
    {
        float _1360 = _1348 * _1348;
        _1133 = _1360;
    }
    float _1362 = _1133;
    int _1364 = _1161 + 72;
    uint _1366 = uint(int(uint(_1364) >> uint(2)));
    uint _1368 = uint(int(uint(int(_1366)) >> uint(2)));
    int _1370 = int(_1366) & 3;
    float _1372 = (*spvDescriptorSet0.vp_c15)._m0[int(_1368)][_1370];
    int _1374 = int(_1366) + 1;
    uint _1376 = uint(int(uint(_1374) >> uint(2)));
    int _1378 = _1374 & 3;
    float _1380 = (*spvDescriptorSet0.vp_c15)._m0[int(_1376)][_1378];
    float _1382 = fma(_1358, _1358, _1354);
    int _1384 = as_type<int>(_1362);
    if (!_1318)
    {
        int _1386 = _1260 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1388 = _1386 + _1143;
        _1145 = _1388;
    }
    int _1390 = _1145;
    float _1392 = -_1298;
    float _1394 = _1254 + _1392;
    float _1396 = _1382 + _1362;
    float _1398 = _1059 * _1184;
    int _1400 = as_type<int>(_1298);
    if (!_1318)
    {
        int _1402 = _1390 << 2;
        _1400 = _1402;
    }
    int _1404 = _1400;
    int _1406 = _1404;
    if (!_1318)
    {
        uint _1408 = uint(int(uint(_1390) >> uint(2)));
        _1384 = int(_1408);
    }
    int _1410 = _1384;
    float _1412 = fma(_855, _1176, _1398);
    float _1414 = rsqrt(_1396);
    if (!_1318)
    {
        int _1416 = 12 & _1404;
        _1406 = _1416;
    }
    int _1418 = _1406;
    float _1420 = -_1350;
    float _1422 = _795 + _1420;
    float _1424 = _1059 * _1218;
    float _1426 = fma(_855, _1210, _1424);
    int _1428 = as_type<int>(_1424);
    if (!_1318)
    {
        int _1430 = _1410 << 4;
        int _1432 = _1430 + _1418;
        _1428 = _1432;
    }
    int _1434 = _1428;
    float _1436 = _1350;
    if (!_1318)
    {
        float _1438 = floor(_1093);
        _1436 = _1438;
    }
    float _1440 = _1436;
    float _1442 = _1059 * _1252;
    float _1444 = fma(_855, _1244, _1442);
    float _1446 = _1414 * _1340;
    float _1448 = _1414 * _1358;
    float _1450 = _1414 * _1348;
    float _1452 = fma(_793, _1288, _1426);
    float _1454 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    int _1456 = _1161 + 80;
    uint _1458 = uint(int(uint(_1456) >> uint(2)));
    uint _1460 = uint(int(uint(int(_1458)) >> uint(2)));
    int _1462 = int(_1458) & 3;
    float _1464 = (*spvDescriptorSet0.vp_c15)._m0[int(_1460)][_1462];
    int _1466 = int(_1458) + 1;
    uint _1468 = uint(int(uint(_1466) >> uint(2)));
    int _1470 = _1466 & 3;
    float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
    float _1474 = _1442;
    if (!_1318)
    {
        float _1476 = floor(_1089);
        _1474 = _1476;
    }
    float _1478 = _1474;
    float _1480 = _1452 + _1296;
    float _1482 = -_1454;
    float _1484 = fma(_1448, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1482);
    float _1486 = _1440;
    if (!_1318)
    {
        float _1488 = -_1440;
        float _1490 = _1093 + _1488;
        _1486 = _1490;
    }
    float _1492 = _1486;
    float _1494 = fma(_793, _1328, _1412);
    float _1496 = _995 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1498 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1500 = _1494 + _1336;
    float _1502 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1496);
    int _1504 = _1161 + 88;
    uint _1506 = uint(int(uint(_1504) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
    int _1514 = int(_1506) + 1;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    int _1518 = _1514 & 3;
    float _1520 = (*spvDescriptorSet0.vp_c15)._m0[int(_1516)][_1518];
    float _1522 = fma(_793, _1372, _1444);
    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1526 = fma(_1053, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1524);
    float _1528 = precise::clamp(_1526, 0.0, 1.0);
    float _1530 = 1.0 / _1500;
    float _1532 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1502);
    float _1534 = _1522 + _1380;
    float _1536 = -_1528;
    float _1538 = _1536 + 1.0;
    float _1540 = -_1450;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1484);
    float _1544 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1546 = _1522;
    if (!_1318)
    {
        int _1548 = _1434 + 400;
        uint _1550 = uint(int(uint(_1548) >> uint(2)));
        uint _1552 = uint(int(uint(int(_1550)) >> uint(2)));
        int _1554 = int(_1550) & 3;
        float _1556 = (*spvDescriptorSet0.vp_c15)._m0[int(_1552)][_1554];
        _1546 = _1556;
    }
    float _1558 = _1546;
    float _1560 = abs(_1538);
    float _1562 = log2(_1560);
    float _1564 = _1544 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1566 = fma(_1542, -0.5, 0.5);
    float _1568 = fma(_1542, 0.5, 0.5);
    float _1570 = -_1564;
    float _1572 = fma(_1570, _1498, 1.0);
    float _1574 = _995 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1576 = _1480 * _1530;
    float _1578 = _995 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1580 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1574);
    float _1582 = _1534 * _1530;
    float _1584 = _995 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1586 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1578);
    bool _1588 = _1576 >= 0.0;
    float _1590 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1580);
    float _1592 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1594 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1586);
    bool _1596 = _1576 <= 1.0;
    bool _1598 = _1596 && _1588;
    float _1600 = fma(_1009, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1584);
    float _1602 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1604 = _1594 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1606 = _1582 >= 0.0;
    bool _1608 = _1606 && _1598;
    float _1610 = exp2(_1592);
    float _1612 = _1059 * _1472;
    float _1614 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1616 = _1582 <= 1.0;
    bool _1618 = _1616 && _1608;
    float _1620 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1600);
    float _1622 = fma(_855, _1464, _1612);
    float _1624 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1614);
    float _1626 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1628 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1630 = sqrt(_1566);
    float _1632 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1624);
    float _1634 = fma(_1568, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1636 = fma(_793, _1512, _1622);
    float _1638 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1632);
    float _1640 = _1448 + 1.0;
    float _1642 = log2(_1572);
    float _1644 = _1636 + _1520;
    float _1646 = _1566;
    float _1648 = _1568;
    float _1650 = _1582;
    float _1652 = _1638;
    if (_1618)
    {
        float _1654 = float(_1157);
        _1646 = _1654;
    }
    float _1656 = _1646;
    float _1658 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1660 = -_1448;
    float _1662 = fma(_1610, _1640, _1660);
    float _1664 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1626);
    float _1666 = fma(_1568, _1634, -0.212114393711090087890625);
    float _1668 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1658);
    float _1670 = 1.0 / _1638;
    float _1672 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1664);
    float _1674 = fma(_1568, _1666, 1.570728778839111328125);
    float _1676 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1668);
    float _1678 = _1630 * 0.636619746685028076171875;
    float _1680 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1672);
    if (!_1318)
    {
        float _1682 = -_1478;
        float _1684 = _1089 + _1682;
        _1648 = _1684;
    }
    float _1686 = _1648;
    float _1688 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1676);
    float _1690 = _1656;
    float _1692 = _1688;
    if (_1618)
    {
        float _1694 = rint(_1656);
        float _1696 = precise::max(_1694, 0.0);
        uint _1698 = uint(_1696);
        uint _1700 = clamp(_1698, 0u, 65535u);
        _1690 = as_type<float>(_1700);
    }
    float _1702 = _1690;
    float _1704 = _1644 * _1530;
    float _1706 = _1642 * 0.693147182464599609375;
    float _1708 = fma(_1009, 6.2500002968590706586837768554688e-05, 0.5);
    float _1710 = fma(_1013, 6.2500002968590706586837768554688e-05, 0.5);
    float _1712 = -_1674;
    float _1714 = fma(_1678, _1712, 1.0);
    float _1716 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1718 = fma(_1662, 0.5, 0.5);
    float _1720 = _1558;
    if (!_1318)
    {
        float _1722 = rint(_1558);
        float _1724 = precise::max(_1722, 0.0);
        uint _1726 = uint(_1724);
        uint _1728 = clamp(_1726, 0u, 65535u);
        _1720 = as_type<float>(_1728);
    }
    float _1730 = _1720;
    float _1732 = _1688 * _1670;
    float _1734 = _1680 * _1670;
    float _1736 = fma(_1732, 0.5, 0.5);
    float _1738 = fma(_1734, -0.5, 0.5);
    float _1740 = _1738;
    if (_1618)
    {
        float3 _6512 = float3(_1576, _1582, float(as_type<int>(_1702)));
        float3 _6516 = select(_6512, float3(0.0), isnan(_6512));
        float _1742 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6516.xy, uint(rint(_6516.z)), _1704, level(0.0));
        _1650 = _1742;
    }
    float _1744 = _1650;
    float2 _6526 = float2(_1708, _1710);
    float3 _1748 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_6526, float2(0.0), isnan(_6526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_6526, float2(0.0), isnan(_6526)), level(0.0)).xyz;
    float _1750 = _1748.x;
    float _1752 = _1748.y;
    float _1754 = _1748.z;
    float2 _6542 = float2(_1394, _1422);
    float _1756 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6542, float2(0.0), isnan(_6542)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6542, float2(0.0), isnan(_6542)), level(0.0)).x;
    float3 _6551 = float3(_1736, _1738, _1716);
    float _1758 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6551, float3(0.0), isnan(_6551)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6551, float3(0.0), isnan(_6551)), level(0.0)).x;
    float3 _6560 = float3(_1736, _1738, _1716);
    float4 _1761 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6560, float3(0.0), isnan(_6560)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6560, float3(0.0), isnan(_6560)), level(0.0)).xyzw;
    float _1763 = _1761.x;
    float _1765 = _1761.y;
    float _1767 = _1761.z;
    float _1769 = _1761.w;
    float2 _6576 = float2(_1714, _1718);
    float3 _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6576, float2(0.0), isnan(_6576)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6576, float2(0.0), isnan(_6576)), level(0.0)).xyz;
    float _1773 = _1771.x;
    float _1775 = _1771.y;
    float _1777 = _1771.z;
    float _1779 = _1492;
    if (!_1318)
    {
        float3 _6597 = float3(_1686, _1492, float(as_type<int>(_1730)));
        float3 _6599 = select(_6597, float3(0.0), isnan(_6597));
        float _1781 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6599.xy, uint(rint(_6599.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6599.xy, uint(rint(_6599.z)), level(0.0)).x;
        _1779 = _1781;
    }
    float _1783 = _1779;
    float _1785 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1787 = int(_1785);
    int _1789 = abs(_429);
    float _1791 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1793 = abs(_439);
    float _1795 = -_623;
    float _1797 = _1795 + 1.0;
    float _1799 = -_605;
    float _1801 = _1799 + 1.0;
    float _1803 = -_423;
    float _1805 = _1803 + 1.0;
    float _1807 = trunc(_615);
    int _1809 = int(_1807);
    float _1811 = _1562 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1813 = float(uint(_1787));
    float _1815 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1817 = int(_1815);
    float _1819 = trunc(_591);
    int _1821 = int(_1819);
    if (_245)
    {
        _1740 = 1.0;
    }
    float _1823 = _1740;
    float _1825 = float(uint(_1809));
    int _1827 = ~_1787;
    int _1829 = _1827 + 1;
    float _1831 = _1823;
    if (!_245)
    {
        _1831 = 7.345489978790283203125;
    }
    float _1833 = _1831;
    float _1835 = 1.0 / _1813;
    float _1837 = float(uint(_1817));
    int _1839 = ~_1787;
    int _1841 = _1839 + 1;
    float _1843 = _1833 * _227;
    int _1845 = ~_1817;
    int _1847 = _1845 + 1;
    float _1849 = float(_1787);
    float _1851 = 1.0 / _1837;
    bool _1853 = _1787 == 0;
    int _1855 = as_type<int>(_1835) + (-2);
    float _1857 = exp2(_1811);
    float _1859 = as_type<float>(_1855) * _1825;
    float _1861 = trunc(_1859);
    float _1863 = precise::max(_1861, 0.0);
    uint _1865 = uint(_1863);
    int _1867 = _1829 * int(_1865);
    int _1869 = _1867 + _1809;
    float _1871 = float(uint(_1869));
    float _1873 = floor(_1843);
    float _1875 = as_type<float>(_1855) * _1871;
    int _1877 = as_type<int>(_1851) + (-2);
    float _1879 = float(uint(_1821));
    float _1881 = trunc(_1875);
    float _1883 = precise::max(_1881, 0.0);
    uint _1885 = uint(_1883);
    float _1887 = as_type<float>(_1877) * _1879;
    float _1889 = -_1873;
    float _1891 = _1843 + _1889;
    float _1893 = trunc(_1887);
    float _1895 = precise::max(_1893, 0.0);
    uint _1897 = uint(_1895);
    float _1899 = float(_1809);
    int _1901 = int(_1865) + int(_1885);
    bool _1903 = _1899 >= _1849;
    bool _1905 = isnan(_1899);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan(_1849);
    bool _1911 = _1907 || _1909;
    float _1913 = float(_1911);
    float _1915 = _1891 * _1849;
    float _1917 = as_type<float>(_1865);
    if (_245)
    {
        _1917 = 1.0;
    }
    float _1919 = _1917;
    int _1921 = _1841 * _1901;
    int _1923 = _1921 + _1809;
    float _1925 = trunc(_1913);
    int _1927 = int(_1925);
    int _1929 = _1847 * int(_1897);
    int _1931 = _1929 + _1821;
    float _1933 = _1919;
    float _1935 = as_type<float>(_1923);
    if (!_245)
    {
        _1933 = 1.2345600128173828125;
    }
    float _1937 = _1933;
    float _1939 = _1849 * _517;
    bool _1941 = uint(_1923) >= uint(_1787);
    float _1943 = float(uint(_1931));
    bool _1945 = !_1941;
    int _1947 = _1945 ? 0 : (-1);
    float _1949 = trunc(_1915);
    int _1951 = int(_1949);
    if (_245)
    {
        _1935 = _227;
    }
    float _1953 = _1935;
    float _1955 = as_type<float>(_1877) * _1943;
    int _1957 = ~_1901;
    int _1959 = _1957 + _1947;
    int _1961 = _1959 + 1;
    float _1963 = _1953;
    if (!_245)
    {
        _1963 = _233;
    }
    float _1965 = _1963;
    int _1967 = _1787 * _1961;
    int _1969 = _1967 + _1809;
    int _1971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1973 = _1971 != 0;
    float _1975 = trunc(_1955);
    float _1977 = precise::max(_1975, 0.0);
    uint _1979 = uint(_1977);
    int _1981 = ~_1927;
    int _1983 = _1981 + 1;
    int _1985 = _1983 + 1;
    float _1987 = _1937 * _1965;
    bool _1989 = !_1973;
    int _1991 = _1989 ? 0 : 1;
    bool _1993 = !_1853;
    int _1995 = _1993 ? _1969 : (-1);
    int _1997 = abs(_1991);
    float _1999 = trunc(_1939);
    int _2001 = int(_1999);
    int _2003 = _1787 + (-1);
    int _2005 = _1995 * _1985;
    int _2007 = abs(_435);
    int _2009 = _1927 * _2003;
    int _2011 = _2009 + _2005;
    float _2013 = floor(_1987);
    int _2015 = _1951 * _1997;
    int _2017 = _2015 + _1809;
    int _2019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2021 = _2019 != 0;
    int _2023 = _2011 * _1789;
    int _2025 = int(_1897) + int(_1979);
    bool _2027 = !_2021;
    int _2029 = _2027 ? 0 : 1;
    int _2031 = _2001 * _2007;
    int _2033 = _2031 + _2023;
    int _2035 = ~_1817;
    int _2037 = _2035 + 1;
    float _2039 = float(_1817);
    float _2041 = float(_1821);
    int _2043 = _2037 * _2025;
    int _2045 = _2043 + _1821;
    int _2047 = abs(_2029);
    float _2049 = -_2013;
    float _2051 = _1987 + _2049;
    float _2053 = _2039 * _517;
    bool _2055 = _2041 >= _2039;
    bool _2057 = isnan(_2041);
    bool _2059 = _2055 || _2057;
    bool _2061 = isnan(_2039);
    bool _2063 = _2059 || _2061;
    float _2065 = float(_2063);
    int _2067 = _2017 * _1793;
    int _2069 = _2067 + _2033;
    bool _2071 = uint(_2045) >= uint(_1817);
    float _2073 = trunc(_2053);
    int _2075 = int(_2073);
    int _2077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2079 = _2077 != 0;
    int _2081 = _1951 * _2047;
    int _2083 = _2081 + _2069;
    bool _2085 = !_2071;
    int _2087 = _2085 ? 0 : (-1);
    float _2089 = _2051 * _2039;
    bool _2091 = !_2079;
    int _2093 = _2091 ? 0 : 1;
    int _2095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2097 = _2095 != 0;
    int _2099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2101 = _2099 != 0;
    int _2103 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2105 = _2103 != 0;
    int _2107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2109 = _2107 != 0;
    float _2111 = trunc(_2065);
    int _2113 = int(_2111);
    int _2115 = ~_2025;
    int _2117 = _2115 + _2087;
    int _2119 = _2117 + 1;
    float _2121 = float(uint(_2083));
    bool _2123 = !_2101;
    int _2125 = _2123 ? 0 : 1;
    int _2127 = _1817 * _2119;
    int _2129 = _2127 + _1821;
    bool _2131 = _1817 == 0;
    float _2133 = trunc(_2089);
    int _2135 = int(_2133);
    float _2137 = as_type<float>(_1855) * _2121;
    int _2139 = abs(_2093);
    bool _2141 = !_2131;
    int _2143 = _2141 ? _2129 : (-1);
    float _2145 = trunc(_2137);
    float _2147 = precise::max(_2145, 0.0);
    uint _2149 = uint(_2147);
    int _2151 = ~_2113;
    int _2153 = _2151 + 1;
    int _2155 = _2153 + 1;
    int _2157 = _1817 + (-1);
    int _2159 = _2143 * _2155;
    int _2161 = ~_1787;
    int _2163 = _2161 + 1;
    int _2165 = _2135 * _2139;
    int _2167 = _2165 + _1821;
    int _2169 = abs(_2125);
    int _2171 = _2113 * _2157;
    int _2173 = _2171 + _2159;
    bool _2175 = !_2097;
    int _2177 = _2175 ? 0 : 1;
    bool _2179 = !_2105;
    int _2181 = _2179 ? 0 : 1;
    int _2183 = _2163 * int(_2149);
    int _2185 = _2183 + _2083;
    int _2187 = abs(_2177);
    bool _2189 = !_2109;
    int _2191 = _2189 ? 0 : 1;
    int _2193 = abs(_2181);
    int _2195 = _2173 * _2169;
    int _2197 = abs(_2191);
    float _2199 = float(uint(_2185));
    int _2201 = _2075 * _2187;
    int _2203 = _2201 + _2195;
    float _2205 = float(uint(_2017));
    float _2207 = as_type<float>(_1855) * _2199;
    float _2209 = float(uint(_2167));
    int _2211 = _2167 * _2193;
    int _2213 = _2211 + _2203;
    int _2215 = ~_1817;
    int _2217 = _2215 + 1;
    int _2219 = _2135 * _2197;
    int _2221 = _2219 + _2213;
    float _2223 = trunc(_2207);
    float _2225 = precise::max(_2223, 0.0);
    uint _2227 = uint(_2225);
    float _2229 = as_type<float>(_1855) * _2205;
    int _2231 = ~_1787;
    int _2233 = _2231 + 1;
    float _2235 = float(uint(_2221));
    int _2237 = ~_1787;
    int _2239 = _2237 + 1;
    float _2241 = trunc(_2229);
    float _2243 = precise::max(_2241, 0.0);
    uint _2245 = uint(_2243);
    float _2247 = as_type<float>(_1877) * _2235;
    float _2249 = trunc(_2247);
    float _2251 = precise::max(_2249, 0.0);
    uint _2253 = uint(_2251);
    int _2255 = int(_2149) + int(_2227);
    float _2257 = as_type<float>(_1877) * _2209;
    int _2259 = ~_1817;
    int _2261 = _2259 + 1;
    int _2263 = _2233 * _2255;
    int _2265 = _2263 + _2083;
    float _2267 = trunc(_2257);
    float _2269 = precise::max(_2267, 0.0);
    uint _2271 = uint(_2269);
    int _2273 = _2239 * int(_2245);
    int _2275 = _2273 + _2017;
    bool _2277 = uint(_2265) >= uint(_1787);
    float _2279 = float(uint(_2275));
    int _2281 = _2217 * int(_2253);
    int _2283 = _2281 + _2221;
    bool _2285 = !_2277;
    int _2287 = _2285 ? 0 : (-1);
    float _2289 = as_type<float>(_1855) * _2279;
    float _2291 = float(uint(_2283));
    int _2293 = ~_2255;
    int _2295 = _2293 + _2287;
    int _2297 = _2295 + 1;
    float _2299 = trunc(_2289);
    float _2301 = precise::max(_2299, 0.0);
    uint _2303 = uint(_2301);
    float _2305 = as_type<float>(_1877) * _2291;
    int _2307 = _1787 * _2297;
    int _2309 = _2307 + _2083;
    int _2311 = _2261 * int(_2271);
    int _2313 = _2311 + _2167;
    bool _2315 = !_1853;
    int _2317 = _2315 ? _2309 : (-1);
    float _2319 = trunc(_2305);
    float _2321 = precise::max(_2319, 0.0);
    uint _2323 = uint(_2321);
    float _2325 = float(uint(_2313));
    int _2327 = _2317 & 3;
    bool _2329 = _2327 != 0;
    int _2331 = _2317 & 3;
    bool _2333 = _2331 != 0;
    float _2335 = as_type<float>(_1877) * _2325;
    bool _2337 = uint(_2327) > 1u;
    out.m_80.x = _1750;
    out.m_80.y = _1752;
    out.m_80.z = _1754;
    int _2339 = int(_2245) + int(_2303);
    float _2341 = trunc(_2335);
    float _2343 = precise::max(_2341, 0.0);
    uint _2345 = uint(_2343);
    int _2347 = ~_1817;
    int _2349 = _2347 + 1;
    float _2351 = -_1756;
    float _2353 = _2351 + 1.0;
    int _2355 = ~_1787;
    int _2357 = _2355 + 1;
    int _2359 = _2333 ? 0 : 1;
    int _2361 = int(_2253) + int(_2323);
    int _2363 = _2357 * _2339;
    int _2365 = _2363 + _2017;
    int _2367 = ~_2359;
    int _2369 = _2367 + 1;
    int _2371 = _2369 + 1;
    bool _2373 = uint(_2327) >= 2u;
    int _2375 = _2349 * _2361;
    int _2377 = _2375 + _2221;
    int _2379 = _2371;
    float _2381 = _1752;
    float _2383 = _1750;
    if (!_2337)
    {
        int _2385 = ~_2359;
        int _2387 = _2385 + 1;
        _2379 = _2387;
    }
    int _2389 = _2379;
    bool _2391 = uint(_2365) >= uint(_1787);
    int _2393 = _2373 ? 0 : 1;
    bool _2395 = uint(_2377) >= uint(_1817);
    bool _2397 = !_2391;
    int _2399 = _2397 ? 0 : (-1);
    bool _2401 = !_2395;
    int _2403 = _2401 ? 0 : (-1);
    int _2405 = ~_2339;
    int _2407 = _2405 + _2399;
    int _2409 = _2407 + 1;
    bool _2411 = _2327 != 3;
    int _2413 = ~_1817;
    int _2415 = _2413 + 1;
    int _2417 = _1787 * _2409;
    int _2419 = _2417 + _2017;
    int _2421 = ~_2361;
    int _2423 = _2421 + _2403;
    int _2425 = _2423 + 1;
    int _2427 = int(_2271) + int(_2345);
    int _2429 = _1817 * _2425;
    int _2431 = _2429 + _2221;
    int _2433 = ~_2393;
    int _2435 = _2433 + 1;
    int _2437 = _2435 + 1;
    bool _2439 = !_2329;
    int _2441 = _2439 ? 0 : 1;
    int _2443 = _2415 * _2427;
    int _2445 = _2443 + _2167;
    int _2447 = _2437;
    if (_2411)
    {
        int _2449 = ~_2393;
        int _2451 = _2449 + 1;
        _2447 = _2451;
    }
    int _2453 = _2447;
    int _2455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2457 = _2455 != 0;
    bool _2459 = uint(_2445) >= uint(_1817);
    bool _2461 = !_2131;
    int _2463 = _2461 ? _2431 : (-1);
    bool _2465 = !_1853;
    int _2467 = _2465 ? _2419 : (-1);
    float _2469 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2471 = int(_2469);
    int _2473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2475 = _2473 != 0;
    bool _2477 = !_2457;
    int _2479 = _2477 ? 0 : 1;
    bool _2481 = !_2459;
    int _2483 = _2481 ? 0 : (-1);
    int _2485 = _2463 & 3;
    bool _2487 = _2485 != 0;
    int _2489 = _2317 >> 31;
    int _2491 = _2463 >> 31;
    bool _2493 = !_2475;
    int _2495 = _2493 ? 0 : 1;
    int _2497 = ~_2427;
    int _2499 = _2497 + _2483;
    int _2501 = _2499 + 1;
    int _2503 = _2463 & 3;
    bool _2505 = _2503 != 0;
    bool _2507 = !_2487;
    int _2509 = _2507 ? 0 : 1;
    int _2511 = _1817 * _2501;
    int _2513 = _2511 + _2167;
    int _2515 = _2489 & 3;
    int _2517 = _2491 & 3;
    bool _2519 = uint(_2485) > 1u;
    bool _2521 = _233 > 0.5;
    int _2523 = _2505 ? 0 : 1;
    int _2525 = _2317 + _2515;
    int _2527 = _2463 + _2517;
    bool _2529 = _2327 != 3;
    int _2531 = _2525 >> 2;
    int _2533 = _2527 >> 2;
    bool _2535 = !_2529;
    int _2537 = _2535 ? 0 : (-1);
    bool _2539 = uint(_2485) >= 2u;
    int _2541 = _2531 << 4;
    int _2543 = _2541 + 368;
    int _2545 = _2533 << 4;
    int _2547 = _2545 + 512;
    int _2549 = ~_2523;
    int _2551 = _2549 + 1;
    int _2553 = _2551 + 1;
    uint _2555 = uint(int(uint(_2543) >> uint(2)));
    uint _2557 = uint(int(uint(int(_2555)) >> uint(2)));
    int _2559 = int(_2555) & 3;
    float _2561 = (*spvDescriptorSet0.vp_c9)._m0[int(_2557)][_2559];
    int _2563 = int(_2555) + 1;
    uint _2565 = uint(int(uint(_2563) >> uint(2)));
    int _2567 = _2563 & 3;
    float _2569 = (*spvDescriptorSet0.vp_c9)._m0[int(_2565)][_2567];
    float _2571 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _2573 = _2553;
    if (!_2519)
    {
        int _2575 = ~_2523;
        int _2577 = _2575 + 1;
        _2573 = _2577;
    }
    int _2579 = _2573;
    int _2581 = _2539 ? 0 : 1;
    float _2583 = _2571 * _227;
    bool _2585 = _2485 != 3;
    float _2587 = in.m_68.w;
    bool _2589 = _2485 != 3;
    uint _2591 = uint(int(uint(_2547) >> uint(2)));
    uint _2593 = uint(int(uint(int(_2591)) >> uint(2)));
    int _2595 = int(_2591) & 3;
    float _2597 = (*spvDescriptorSet0.vp_c9)._m0[int(_2593)][_2595];
    int _2599 = int(_2591) + 1;
    uint _2601 = uint(int(uint(_2599) >> uint(2)));
    int _2603 = _2599 & 3;
    float _2605 = (*spvDescriptorSet0.vp_c9)._m0[int(_2601)][_2603];
    float _2607 = trunc(_2583);
    int _2609 = int(_2607);
    bool _2611 = !_2589;
    int _2613 = _2611 ? 0 : (-1);
    bool _2615 = _227 > 0.5;
    bool _2617 = _237 > 0.5;
    int _2619 = _2543 + 8;
    uint _2621 = uint(int(uint(_2619) >> uint(2)));
    uint _2623 = uint(int(uint(int(_2621)) >> uint(2)));
    int _2625 = int(_2621) & 3;
    float _2627 = (*spvDescriptorSet0.vp_c9)._m0[int(_2623)][_2625];
    int _2629 = int(_2621) + 1;
    uint _2631 = uint(int(uint(_2629) >> uint(2)));
    int _2633 = _2629 & 3;
    float _2635 = (*spvDescriptorSet0.vp_c9)._m0[int(_2631)][_2633];
    bool _2637 = !_2131;
    int _2639 = _2637 ? _2513 : (-1);
    float _2641 = -_191;
    int _2643 = _2617 ? as_type<int>(_2641) : as_type<int>(_191);
    int _2645 = ~_2581;
    int _2647 = _2645 + 1;
    int _2649 = _2647 + 1;
    int _2651 = _2547 + 8;
    uint _2653 = uint(int(uint(_2651) >> uint(2)));
    uint _2655 = uint(int(uint(int(_2653)) >> uint(2)));
    int _2657 = int(_2653) & 3;
    float _2659 = (*spvDescriptorSet0.vp_c9)._m0[int(_2655)][_2657];
    int _2661 = int(_2653) + 1;
    uint _2663 = uint(int(uint(_2661) >> uint(2)));
    int _2665 = _2661 & 3;
    float _2667 = (*spvDescriptorSet0.vp_c9)._m0[int(_2663)][_2665];
    int _2669 = _2609 << 4;
    int _2671 = _2669 + 1968;
    float _2673 = -_195;
    int _2675 = _2521 ? as_type<int>(_2673) : as_type<int>(_195);
    bool _2677 = _2587 > 0.5;
    int _2679 = _2649;
    if (_2585)
    {
        int _2681 = ~_2581;
        int _2683 = _2681 + 1;
        _2679 = _2683;
    }
    int _2685 = _2679;
    uint _2687 = uint(int(uint(_2671) >> uint(2)));
    uint _2689 = uint(int(uint(int(_2687)) >> uint(2)));
    int _2691 = int(_2687) & 3;
    float _2693 = (*spvDescriptorSet0.vp_c9)._m0[int(_2689)][_2691];
    int _2695 = int(_2687) + 1;
    uint _2697 = uint(int(uint(_2695) >> uint(2)));
    int _2699 = _2695 & 3;
    float _2701 = (*spvDescriptorSet0.vp_c9)._m0[int(_2697)][_2699];
    float _2703 = -_191;
    int _2705 = _2615 ? as_type<int>(_2703) : as_type<int>(_191);
    int _2707 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2709 = _2707 != 0;
    int _2711 = abs(_2579);
    int _2713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2715 = _2713 != 0;
    int _2717 = _2671 + 8;
    uint _2719 = uint(int(uint(_2717) >> uint(2)));
    uint _2721 = uint(int(uint(int(_2719)) >> uint(2)));
    int _2723 = int(_2719) & 3;
    float _2725 = (*spvDescriptorSet0.vp_c9)._m0[int(_2721)][_2723];
    int _2727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2729 = _2727 != 0;
    int _2731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2733 = _2731 != 0;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2737 = ~_2711;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    float _2743 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2745 = abs(_2509);
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2749 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2751 = _2743 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2753 = _2735 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2755 = _2747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2757 = _2741 * as_type<int>(_2605);
    int _2759 = abs(_2389);
    out.m_82.x = _2751;
    out.m_82.y = _2753;
    out.m_82.z = _2755;
    out.m_82.w = _2749;
    int _2761 = abs(_2441);
    float _2763 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2765 = int(_2763);
    int _2767 = ~_2761;
    int _2769 = _2767 + 1;
    int _2771 = _2769 + 1;
    int _2773 = ~_2759;
    int _2775 = _2773 + 1;
    int _2777 = _2775 + 1;
    int _2779 = abs(_2613);
    int _2781 = _2777 * as_type<int>(_2569);
    int _2783 = ~_2745;
    int _2785 = _2783 + 1;
    int _2787 = _2785 + 1;
    int _2789 = abs(_2685);
    int _2791 = _2771 * as_type<int>(_2561);
    int _2793 = _2791 + _2781;
    int _2795 = abs(_2453);
    int _2797 = _2787 * as_type<int>(_2597);
    int _2799 = _2797 + _2757;
    int _2801 = ~_2789;
    int _2803 = _2801 + 1;
    int _2805 = _2803 + 1;
    float _2807 = abs(_1107);
    float _2809 = log2(_2807);
    int _2811 = ~_2795;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    int _2817 = abs(_2537);
    int _2819 = _2805 * as_type<int>(_2659);
    int _2821 = _2819 + _2799;
    int _2823 = _2815 * as_type<int>(_2627);
    int _2825 = _2823 + _2793;
    int _2827 = ~_2817;
    int _2829 = _2827 + 1;
    int _2831 = _2829 + 1;
    float _2833 = _2725 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2835 = float(uint(_2471));
    int _2837 = ~_2779;
    int _2839 = _2837 + 1;
    int _2841 = _2839 + 1;
    int _2843 = _2831 * as_type<int>(_2635);
    int _2845 = _2843 + _2825;
    int _2847 = abs(_2471);
    float _2849 = 1.0 / _2835;
    float _2851 = float(uint(_2765));
    int _2853 = _2841 * as_type<int>(_2667);
    int _2855 = _2853 + _2821;
    float _2857 = _2701 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2859 = _2809 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2861 = _2693 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2863 = abs(_2479);
    float _2865 = 1.0 / _2851;
    int _2867 = abs(_2495);
    float _2869 = _2861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2871 = float(uint(_2847));
    float _2873 = _2857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2875 = ~_2863;
    int _2877 = _2875 + 1;
    int _2879 = _2877 + 1;
    float _2881 = _2833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2883 = ~_2867;
    int _2885 = _2883 + 1;
    int _2887 = _2885 + 1;
    float _2889 = exp2(_2859);
    int _2891 = abs(_2765);
    int _2893 = _2845 * _2879;
    int _2895 = as_type<int>(_2849) + (-2);
    int _2897 = _2855 * _2887;
    float _2899 = float(uint(_2891));
    int _2901 = _2467 * _2863;
    int _2903 = _2901 + _2893;
    float _2905 = _807 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2907 = 1.0 / _2871;
    int _2909 = _2639 * _2867;
    int _2911 = _2909 + _2897;
    out.m_84.x = _2869;
    out.m_84.y = _2873;
    out.m_84.z = _2881;
    float _2913 = _807 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2915 = _807 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2917 = -_799;
    float _2919 = fma(_2917, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2905);
    float _2921 = float(uint(_2903));
    float _2923 = 1.0 / _2899;
    float _2925 = fma(_2889, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2927 = precise::clamp(_2925, 0.0, 1.0);
    float _2929 = -_799;
    float _2931 = fma(_2929, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2913);
    float _2933 = -_799;
    float _2935 = fma(_2933, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2915);
    float _2937 = as_type<float>(_2895) * _2921;
    int _2939 = ~_2471;
    int _2941 = _2939 + 1;
    int _2943 = abs(_2903);
    float _2945 = trunc(_2937);
    float _2947 = precise::max(_2945, 0.0);
    uint _2949 = uint(_2947);
    int _2951 = as_type<int>(_2865) + (-2);
    float _2953 = float(uint(_2911));
    int _2955 = as_type<int>(_2907) + (-2);
    float _2957 = as_type<float>(_2951) * _2953;
    float _2959 = float(uint(_2943));
    float _2961 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2931);
    int _2963 = abs(_2911);
    float _2965 = _819 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2967 = as_type<int>(_2923) + (-2);
    float _2969 = trunc(_2957);
    float _2971 = precise::max(_2969, 0.0);
    uint _2973 = uint(_2971);
    float _2975 = as_type<float>(_2955) * _2959;
    float _2977 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2919);
    float _2979 = float(uint(_2963));
    float _2981 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2935);
    float _2983 = _819 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2985 = ~_2765;
    int _2987 = _2985 + 1;
    float _2989 = as_type<float>(_2967) * _2979;
    float _2991 = trunc(_2975);
    float _2993 = precise::max(_2991, 0.0);
    uint _2995 = uint(_2993);
    int _2997 = _2941 * int(_2949);
    int _2999 = _2997 + _2903;
    int _3001 = ~_2847;
    int _3003 = _3001 + 1;
    float _3005 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2965);
    int _3007 = ~_2891;
    int _3009 = _3007 + 1;
    float _3011 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2983);
    bool _3013 = !_2729;
    float _3015 = _3013 ? _191 : as_type<float>(_2643);
    int _3017 = _2987 * int(_2973);
    int _3019 = _3017 + _2911;
    float _3021 = trunc(_2989);
    float _3023 = precise::max(_3021, 0.0);
    uint _3025 = uint(_3023);
    float _3027 = _819 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3029 = float(uint(_2999));
    float _3031 = float(uint(_3019));
    float _3033 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3027);
    float _3035 = _827 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3037 = as_type<float>(_2895) * _3029;
    float _3039 = _827 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3041 = as_type<float>(_2951) * _3031;
    int _3043 = _3003 * int(_2995);
    int _3045 = _3043 + _2943;
    float _3047 = _827 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3049 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3035);
    float _3051 = trunc(_3041);
    float _3053 = precise::max(_3051, 0.0);
    uint _3055 = uint(_3053);
    float _3057 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3039);
    float _3059 = float(uint(_3045));
    int _3061 = _3009 * int(_3025);
    int _3063 = _3061 + _2963;
    float _3065 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3047);
    float _3067 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3033);
    bool _3069 = !_2715;
    float _3071 = _3069 ? _195 : as_type<float>(_2675);
    float _3073 = as_type<float>(_2955) * _3059;
    float _3075 = trunc(_3037);
    float _3077 = precise::max(_3075, 0.0);
    uint _3079 = uint(_3077);
    float _3081 = float(uint(_3063));
    float _3083 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3005);
    float _3085 = fma(_2927, -2.0, 3.0);
    float _3087 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3049);
    bool _3089 = _1107 <= 8000.0;
    bool _3091 = isnan(_1107);
    bool _3093 = _3089 || _3091;
    bool _3095 = isnan(8000.0);
    bool _3097 = _3093 || _3095;
    float _3099 = float(_3097);
    float _3101 = as_type<float>(_2967) * _3081;
    float _3103 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3011);
    float _3105 = trunc(_3073);
    float _3107 = precise::max(_3105, 0.0);
    uint _3109 = uint(_3107);
    bool _3111 = !_2709;
    float _3113 = _3111 ? _191 : as_type<float>(_2705);
    float _3115 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3117 = -_195;
    int _3119 = _2677 ? as_type<int>(_3117) : as_type<int>(_195);
    float _3121 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3123 = int(_2973) + int(_3055);
    float _3125 = _3115 * _2977;
    int _3127 = ~_2471;
    int _3129 = _3127 + 1;
    float _3131 = trunc(_3101);
    float _3133 = precise::max(_3131, 0.0);
    uint _3135 = uint(_3133);
    int _3137 = int(_2949) + int(_3079);
    float _3139 = _3115 * _2961;
    int _3141 = ~_2765;
    int _3143 = _3141 + 1;
    float _3145 = fma(_3121, _3083, _3125);
    bool _3147 = !_2733;
    float _3149 = _3147 ? _195 : as_type<float>(_3119);
    float _3151 = _2927 * _2927;
    int _3153 = ~_2847;
    int _3155 = _3153 + 1;
    float _3157 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3057);
    out.m_86.x = _3083;
    out.m_86.y = _3103;
    out.m_86.z = _3067;
    float _3159 = fma(_3121, _3103, _3139);
    int _3161 = _3129 * _3137;
    int _3163 = _3161 + _2903;
    int _3165 = int(_2995) + int(_3109);
    int _3167 = _3143 * _3123;
    int _3169 = _3167 + _2911;
    bool _3171 = _2765 == 0;
    float _3173 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3065);
    int _3175 = int(_3025) + int(_3135);
    float _3177 = _3151 * _3085;
    bool _3179 = uint(_3163) >= uint(_2471);
    bool _3181 = uint(_3169) >= uint(_2765);
    int _3183 = ~_2891;
    int _3185 = _3183 + 1;
    float _3187 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1791);
    int _3189 = _3155 * _3165;
    int _3191 = _3189 + _2943;
    bool _3193 = !_3179;
    int _3195 = _3193 ? 0 : (-1);
    int _3197 = _3185 * _3175;
    int _3199 = _3197 + _2963;
    bool _3201 = !_3181;
    int _3203 = _3201 ? 0 : (-1);
    float _3205 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3207 = uint(_3191) >= uint(_2847);
    float _3209 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3187);
    int _3211 = _2903 ^ _2471;
    bool _3213 = uint(_3199) >= uint(_2891);
    int _3215 = ~_3123;
    int _3217 = _3215 + _3203;
    int _3219 = _3217 + 1;
    float _3221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3223 = !_3207;
    int _3225 = _3223 ? 0 : (-1);
    uint _3227 = uint(int(uint(_3211) >> uint(31)));
    int _3229 = _2765 * _3219;
    int _3231 = _3229 + _2911;
    int _3233 = ~_3137;
    int _3235 = _3233 + _3195;
    int _3237 = _3235 + 1;
    int _3239 = ~_3225;
    int _3241 = _3165 + _3239;
    int _3243 = _3241 + 1;
    float _3245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3247 = ~int(_3227);
    int _3249 = _3247 + 1;
    int _3251 = _2471 * _3237;
    int _3253 = _3251 + _2903;
    int _3255 = _2911 ^ _2765;
    float _3257 = _3205 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3259 = _3243 ^ _3249;
    bool _3261 = _2471 == 0;
    float _3263 = _3221 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3265 = ~_3249;
    int _3267 = _3265 + _3259;
    int _3269 = _3267 + 1;
    bool _3271 = !_3213;
    int _3273 = _3271 ? 0 : (-1);
    uint _3275 = uint(int(uint(_3255) >> uint(31)));
    float _3277 = fma(_3115, _3115, 1.0);
    bool _3279 = !_3261;
    int _3281 = _3279 ? _3253 : (-1);
    float _3283 = _3245 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3285 = ~_3273;
    int _3287 = _3175 + _3285;
    int _3289 = _3287 + 1;
    int _3291 = ~int(_3275);
    int _3293 = _3291 + 1;
    float _3295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3297 = !_3171;
    int _3299 = _3297 ? _3231 : (-1);
    float _3301 = float(_3281);
    bool _3303 = _2471 == 0;
    int _3305 = _3289 ^ _3293;
    float _3307 = rsqrt(_3277);
    float _3309 = float(_3299);
    float _3311 = fma(_3257, _3301, _291);
    float _3313 = _3113 + 0.5;
    bool _3315 = _2765 == 0;
    int _3317 = ~_3293;
    int _3319 = _3317 + _3305;
    int _3321 = _3319 + 1;
    float _3323 = fma(_3257, _3313, _3311);
    bool _3325 = !_3303;
    int _3327 = _3325 ? _3269 : (-1);
    float _3329 = fma(_3283, _3309, _561);
    float _3331 = _3015 + 0.5;
    bool _3333 = !_3315;
    int _3335 = _3333 ? _3321 : (-1);
    float _3337 = float(_3327);
    float _3339 = fma(_3283, _3331, _3329);
    float _3341 = float(_3335);
    float _3343 = _3295 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3345 = _3071 + (-0.5);
    float _3347 = -_313;
    float _3349 = fma(_3263, _3337, _3347);
    float _3351 = _3115 * _3307;
    float _3353 = -_593;
    float _3355 = fma(_3343, _3341, _3353);
    float _3357 = _3149 + (-0.5);
    float _3359 = _3115 * _2981;
    float _3361 = -_3157;
    float _3363 = _3351 * _3361;
    float _3365 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3209);
    float _3367 = -_3263;
    float _3369 = fma(_3367, _3345, _3349);
    float _3371 = -_3087;
    float _3373 = _3351 * _3371;
    float _3375 = -_3343;
    float _3377 = fma(_3375, _3357, _3355);
    float _3379 = fma(_3307, _2961, _3363);
    float _3381 = -_3173;
    float _3383 = _3351 * _3381;
    float _3385 = -_485;
    float _3387 = _3385 + 1.0;
    float _3389 = _3365 + _1638;
    float _3391 = -_1797;
    float _3393 = fma(_3113, _3391, _3323);
    float _3395 = fma(_3307, _2977, _3373);
    float _3397 = fma(_3071, _1801, _3369);
    float _3399 = fma(_3307, _2981, _3383);
    float _3401 = -_3387;
    float _3403 = fma(_3015, _3401, _3339);
    float _3405 = _3389 * 0.5;
    float _3407 = fma(_3149, _1805, _3377);
    out.m_88.x = _3395;
    out.m_88.y = _3379;
    out.m_88.z = _3399;
    float _3409 = _3351;
    if (!_1618)
    {
        _3409 = 1.0;
    }
    float _3411 = _3409;
    float _3413 = fma(_3121, _3067, _3359);
    float _3415 = _3411;
    if (_1618)
    {
        bool _3417 = _1744 >= _1704;
        bool _3419 = isnan(_1744);
        bool _3421 = _3417 || _3419;
        bool _3423 = isnan(_1704);
        bool _3425 = _3421 || _3423;
        float _3427 = float(_3425);
        _3415 = _3427;
    }
    float _3429 = _3415;
    out.m_90.z = _3405;
    out.m_90.w = _1638;
    float _3431 = -_3177;
    float _3433 = _3431 + 1.0;
    float _3435 = _3087 + _3145;
    float _3437 = _3157 + _3159;
    out.m_92.x = _3393;
    out.m_92.y = _3397;
    out.m_92.z = _3403;
    out.m_92.w = _3407;
    float _3439 = fma(_3433, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3177);
    float _3441 = _3173 + _3413;
    out.gl_Position.x = _1688;
    out.gl_Position.y = _1680;
    out.gl_Position.z = _3365;
    out.gl_Position.w = _1638;
    float _3443 = _3099 * _3439;
    float _3445 = _3443 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3447 = _2353 * _3445;
    float _3449 = precise::clamp(_3447, 0.0, 1.0);
    if (_1318)
    {
        _1692 = 1.0;
    }
    float _3451 = _1692;
    float _3453 = _3451;
    if (!_1318)
    {
        int _3455 = _1390 << 4;
        int _3457 = _3455 + 2048;
        uint _3459 = uint(int(uint(_3457) >> uint(2)));
        uint _3461 = uint(int(uint(int(_3459)) >> uint(2)));
        int _3463 = int(_3459) & 3;
        float _3465 = (*spvDescriptorSet0.vp_c15)._m0[int(_3461)][_3463];
        int _3467 = int(_3459) + 1;
        uint _3469 = uint(int(uint(_3467) >> uint(2)));
        int _3471 = _3467 & 3;
        float _3473 = (*spvDescriptorSet0.vp_c15)._m0[int(_3469)][_3471];
        int _3475 = _3457 + 8;
        uint _3477 = uint(int(uint(_3475) >> uint(2)));
        uint _3479 = uint(int(uint(int(_3477)) >> uint(2)));
        int _3481 = int(_3477) & 3;
        float _3483 = (*spvDescriptorSet0.vp_c15)._m0[int(_3479)][_3481];
        int _3485 = int(_3477) + 1;
        uint _3487 = uint(int(uint(_3485) >> uint(2)));
        int _3489 = _3485 & 3;
        float _3491 = (*spvDescriptorSet0.vp_c15)._m0[int(_3487)][_3489];
        float _3493 = _1059 * _3473;
        float _3495 = fma(_855, _3465, _3493);
        float _3497 = fma(_793, _3483, _3495);
        float _3499 = _3497 + _3491;
        float _3501 = precise::clamp(_3499, 0.0, 1.0);
        float _3503 = -_3501;
        float _3505 = _3503 + _1783;
        float _3507 = fma(_3505, 500.0, 1.5);
        float _3509 = exp2(_3507);
        float _3511 = 0.0 + _3509;
        float _3513 = precise::clamp(_3511, 0.0, 1.0);
        _3453 = _3513;
        _1652 = _3491;
    }
    float _3515 = _3453;
    float _3517 = _1652;
    float _3519 = -_1857;
    float _3521 = _3519 + 1.0;
    float _3523 = _3429 * _3515;
    float _3525 = -_3449;
    float _3527 = fma(_3525, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_94.x = _3435;
    out.m_94.y = _3437;
    out.m_94.z = _3441;
    float _3529 = _3521 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3531 = _1053 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3533 = isnan(_1053);
    bool _3535 = _3531 || _3533;
    bool _3537 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3539 = _3535 || _3537;
    float _3541 = -_3523;
    float _3543 = fma(_3541, _3527, 1.0);
    float _3545 = precise::clamp(_3543, 0.0, 1.0);
    float _3547 = _3529 * _1758;
    float _3549 = -_3529;
    float _3551 = _3549 + 1.0;
    float _3553 = _3545 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3555 = _1769 * _3547;
    float _3557 = _1777 * _3547;
    float _3559 = _1769 * _3551;
    out.m_96.x = _3553;
    float _3561 = fma(_1773, _3555, _1763);
    float _3563 = fma(_1775, _3555, _1765);
    float _3565 = fma(_1769, _3557, _1767);
    float _3567 = _3517;
    float _3569 = _3551;
    float _3571 = _3555;
    float _3573 = _3553;
    if (!_3539)
    {
        _2381 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3575 = _2381;
    float _3577 = _3575;
    float _3579 = _3575;
    if (!_3539)
    {
        _2383 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3581 = _2383;
    out.m_98.x = _3561;
    out.m_98.y = _3563;
    out.m_98.z = _3565;
    out.m_98.w = _3559;
    float _3583 = _3581;
    float _3585 = _3581;
    if (!_3539)
    {
        _3567 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3587 = _3567;
    float _3589 = _3587;
    float _3591 = _3587;
    if (!_3539)
    {
        _3569 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3593 = _3569;
    float _3595 = _3593;
    float _3597 = _3593;
    if (!_3539)
    {
        _3571 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3599 = _3571;
    float _3601 = _3599;
    float _3603 = _3599;
    if (!_3539)
    {
        _3573 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3605 = _3573;
    bool _3607 = !_3539;
    float _3609 = _3605;
    float _3611 = _3605;
    if (!_3607)
    {
        bool _3613 = _1053 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3615 = isnan(_1053);
        bool _3617 = _3613 || _3615;
        bool _3619 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3621 = _3617 || _3619;
        if (!_3621)
        {
            float _3623 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3625 = _1053 + _3623;
            float _3627 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3629 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3627;
            float _3631 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3633 = _3631 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3635 = 1.0 / _3629;
            float _3637 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3639 = _3637 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3641 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3643 = _3641 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3647 = _3645 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3649 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3651 = _3649 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3653 = _3625 * _3635;
            float _3655 = precise::clamp(_3653, 0.0, 1.0);
            float _3657 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3659 = _3657 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3661 = fma(_3655, _3633, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3663 = fma(_3655, _3659, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3665 = fma(_3655, _3639, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3667 = fma(_3655, _3643, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3669 = fma(_3655, _3647, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3671 = fma(_3655, _3651, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3585 = _3665;
            _3603 = _3669;
            _3579 = _3661;
            _3597 = _3667;
            _3591 = _3663;
            _3611 = _3671;
            _3673 = true;
        }
        else
        {
            bool _3675 = _1053 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3677 = isnan(_1053);
            bool _3679 = _3675 || _3677;
            bool _3681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3683 = _3679 || _3681;
            if (!_3683)
            {
                _3577 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3685 = _3577;
            _3579 = _3685;
            if (!_3683)
            {
                _3583 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3687 = _3583;
            _3585 = _3687;
            if (!_3683)
            {
                _3589 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3689 = _3589;
            _3591 = _3689;
            if (!_3683)
            {
                _3595 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3691 = _3595;
            _3597 = _3691;
            if (!_3683)
            {
                _3601 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3693 = _3601;
            _3603 = _3693;
            if (!_3683)
            {
                _3609 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3695 = _3609;
            bool _3697 = !_3683;
            _3611 = _3695;
            if (!_3697)
            {
                bool _3699 = _1053 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3701 = isnan(_1053);
                bool _3703 = _3699 || _3701;
                bool _3705 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3707 = _3703 || _3705;
                if (!_3707)
                {
                    float _3709 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3711 = _1053 + _3709;
                    float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3715 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3713;
                    float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3721 = 1.0 / _3715;
                    float _3723 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3725 = _3723 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3727 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3729 = _3727 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3733 = _3731 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3735 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3737 = _3735 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3739 = _3711 * _3721;
                    float _3741 = precise::clamp(_3739, 0.0, 1.0);
                    float _3743 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3745 = _3743 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3747 = fma(_3741, _3719, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3749 = fma(_3741, _3745, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3751 = fma(_3741, _3725, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3753 = fma(_3741, _3729, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3755 = fma(_3741, _3733, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3757 = fma(_3741, _3737, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3585 = _3751;
                    _3603 = _3755;
                    _3579 = _3747;
                    _3597 = _3753;
                    _3591 = _3749;
                    _3611 = _3757;
                    _3673 = true;
                }
                else
                {
                    _3585 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3603 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3579 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3597 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3591 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3611 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3673 = false;
    float _3759 = _3585;
    float _3761 = _3603;
    float _3763 = _3579;
    float _3765 = _3597;
    float _3767 = _3591;
    float _3769 = _3611;
    float _3771 = fma(_3437, -0.5, 0.5);
    float _3773 = precise::clamp(_3771, 0.0, 1.0);
    float _3775 = -_3759;
    float _3777 = _3775 + _3761;
    float _3779 = -_3763;
    float _3781 = _3779 + _3765;
    float _3783 = -_3767;
    float _3785 = _3783 + _3769;
    bool _3787 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3789 = fma(_3773, _3777, _3759);
    float _3791 = fma(_3773, _3781, _3763);
    float _3793 = fma(_3773, _3785, _3767);
    float _3795 = _3789 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _3797 = fma(_3791, 0.298911988735198974609375, _3795);
    float _3799 = fma(_3793, 0.114477999508380889892578125, _3797);
    out.m_100.x = 0.0;
    float _3801 = -_3799;
    float _3803 = _3791 + _3801;
    float _3805 = -_3799;
    float _3807 = _3789 + _3805;
    float _3809 = -_3799;
    float _3811 = _3793 + _3809;
    float _3813 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3815 = fma(_3803, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3799);
    float _3817 = fma(_3807, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3799);
    float _3819 = fma(_3811, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3799);
    out.m_96.w = _3813;
    out.m_102.x = _3815;
    out.m_102.y = _3817;
    out.m_102.z = _3819;
    if (!_3787)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3821 = -_995;
    float _3823 = _3821 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3825 = -_1009;
    float _3827 = _3825 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3829 = -_1013;
    float _3831 = _3829 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3833 = _3823 * _3823;
    float _3835 = fma(_3827, _3827, _3833);
    float _3837 = fma(_3831, _3831, _3835);
    float _3839 = sqrt(_3837);
    float _3841 = rsqrt(_3837);
    float _3843 = -_3839;
    float _3845 = _3843 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3847 = _3845 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3849 = precise::clamp(_3847, 0.0, 1.0);
    float _3851 = _3827 * _3841;
    float _3853 = _3823 * _3841;
    float _3855 = abs(_3849);
    float _3857 = log2(_3855);
    float _3859 = _3831 * _3841;
    float _3861 = _3851 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3863 = _3437 * _3853;
    float _3865 = -_3853;
    float _3867 = -_3861;
    float _3869 = fma(_3865, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3867);
    float _3871 = fma(_3435, _3851, _3863);
    float _3873 = -_3859;
    float _3875 = fma(_3873, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3869);
    float _3877 = fma(_3441, _3859, _3871);
    float _3879 = precise::clamp(_3877, 0.0, 1.0);
    float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3883 = _3875 + _3881;
    float _3885 = _3857 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3887 = _3883 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3889 = precise::clamp(_3887, 0.0, 1.0);
    float _3891 = exp2(_3885);
    float _3893 = _3891 * _3889;
    float _3895 = _3879 * _3893;
    float _3897 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3899 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3901 = _3895 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_100.x = _3897;
    out.m_100.y = _3899;
    out.m_100.z = _3901;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

