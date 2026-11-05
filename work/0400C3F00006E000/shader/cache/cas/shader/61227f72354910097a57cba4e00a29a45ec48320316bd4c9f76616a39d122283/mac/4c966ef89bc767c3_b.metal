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
    float4 m_84 [[user(locn1)]];
    float4 m_102 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_88 [[user(locn6)]];
    float4 m_94 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_100 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 m_98 [[user(locn12)]];
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
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3819 = false;
    bool _2700 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_60.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_121);
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _127;
    float _133 = _131;
    if (!_125)
    {
        out.m_63.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4106 = as_type<float>(_139);
        out.gl_Position.z = _4106;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_65.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_121);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4176 = as_type<float>(_177);
        out.gl_Position.z = _4176;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _217;
    if (!_199)
    {
        float _201 = in.m_70.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        float _221 = float(_121);
        float _223 = 1.0 / _221;
        float _225 = _157 * _223;
        _217 = _225;
    }
    _219 = false;
    float _227 = _217;
    float _229 = in.m_70.x;
    float _231 = in.m_70.y;
    float _233 = in.m_70.z;
    float _235 = in.m_70.w;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _239 = _227 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _251 = 1.0 / _243;
    int _253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _255 = _253 != 0;
    float _257 = 1.0 / _247;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _263;
    float _267 = float(_121);
    float _269 = _229 * 2.0;
    float _271 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _273 = _231 * 2.0;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _227 + _275;
    float _279 = floor(_269);
    float _281 = -_249;
    float _283 = fma(_271, 2.0, _281);
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _287 = _277 * _251;
    float _289 = _229 + _231;
    float _291 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _293 = _239 * _257;
    float _295 = _289 + (-1.0);
    float _297 = _233 * 2.0;
    float _299 = _233 + _231;
    float _301 = floor(_273);
    float _303 = fma(_291, -2.0, _285);
    float _305 = _233 + _229;
    float _307 = _299 + (-1.0);
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _311 = _279 >= 0.0;
    bool _313 = isnan(_279);
    bool _315 = _311 || _313;
    bool _317 = isnan(0.0);
    bool _319 = _315 || _317;
    float _321 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _323 = floor(_297);
    int _325 = as_type<int>(_307);
    if (_255)
    {
        _325 = 0;
    }
    int _327 = _325;
    float _329 = _305 + (-1.0);
    int _331 = _327;
    if (!_255)
    {
        _331 = 1;
    }
    int _333 = _331;
    float _335 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _337 = _279 > 0.0;
    float _339 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _341 = fma(_261, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _345 = int(_343);
    bool _347 = _301 >= 0.0;
    bool _349 = isnan(_301);
    bool _351 = _347 || _349;
    bool _353 = isnan(0.0);
    bool _355 = _351 || _353;
    float _357 = fma(_265, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _359 = _301 > 0.0;
    float _361 = _229 + (-0.5);
    int _363 = _355 ? 0 : 1;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _371 = int(_369);
    bool _373 = _323 > 0.0;
    bool _375 = _323 >= 0.0;
    bool _377 = isnan(_323);
    bool _379 = _375 || _377;
    bool _381 = isnan(0.0);
    bool _383 = _379 || _381;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _387 = _319 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _389 = _333 != 1;
    float _391 = 1.0 / _267;
    int _393 = _383 ? 0 : 1;
    int _395 = ~as_type<int>(_387);
    int _397 = _395 + 1;
    int _399 = _397 + 1;
    int _401 = _399;
    float _403 = _387;
    float _405 = _301;
    if (!_337)
    {
        int _407 = ~as_type<int>(_387);
        int _409 = _407 + 1;
        _401 = _409;
    }
    int _411 = _401;
    int _413 = ~_393;
    int _415 = _413 + 1;
    int _417 = _415 + 1;
    int _419 = _417;
    if (!_373)
    {
        int _421 = ~_393;
        int _423 = _421 + 1;
        _419 = _423;
    }
    int _425 = _419;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _429 = _427 != 0;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _437 = _435 != 0;
    float _439 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _441 = log2(_439);
    if (!_389)
    {
        _403 = _231;
    }
    float _443 = _403;
    float _445 = _443;
    if (_389)
    {
        _445 = _229;
    }
    float _447 = _445;
    float _449 = _391 * _157;
    bool _451 = !_433;
    int _453 = _451 ? 0 : 1;
    bool _455 = !_437;
    int _457 = _455 ? 0 : 1;
    float _459 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[83].z, _309);
    bool _461 = !_429;
    int _463 = _461 ? 0 : 1;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _475 = _473 != 0;
    float _477 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _459);
    if (!_389)
    {
        _129 = _231;
    }
    float _479 = _129;
    int _481 = ~_363;
    int _483 = _481 + 1;
    int _485 = _483 + 1;
    float _487 = _479;
    int _489 = _485;
    if (_389)
    {
        _487 = _229;
    }
    float _491 = _487;
    if (!_359)
    {
        int _493 = ~_363;
        int _495 = _493 + 1;
        _489 = _495;
    }
    int _497 = _489;
    float _499 = float(_345);
    float _501 = _491 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _503 = !_467;
    int _505 = _503 ? 0 : 1;
    float _507 = 1.0 / _499;
    float _509 = -_385;
    float _511 = fma(_501, 2.0, _509);
    float _513 = float(_411);
    float _515 = _441 * _157;
    float _517 = _501;
    if (!_389)
    {
        _405 = _233;
    }
    float _519 = _405;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _523 = float(_497);
    int _525 = abs(_505);
    float _527 = exp2(_515);
    float _529 = _519;
    if (_389)
    {
        _529 = _231;
    }
    float _531 = _529;
    float _533 = float(_371);
    if (!_389)
    {
        _517 = _233;
    }
    float _535 = _517;
    float _537 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[83].w, _521);
    float _539 = float(_525);
    float _541 = 1.0 / _533;
    float _543 = float(_425);
    float _545 = -_157;
    float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[76].x, _283);
    float _549 = _507 * _157;
    float _551 = _535;
    if (_389)
    {
        _551 = _231;
    }
    float _553 = _551;
    float _555 = _539 * _543;
    bool _557 = !_471;
    int _559 = _557 ? 0 : 1;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _563 = in.m_72.x;
    float _565 = in.m_72.y;
    float _567 = in.m_72.z;
    float _569 = _553 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _571 = !_475;
    int _573 = _571 ? 0 : 1;
    float _575 = _555 * (-2.0);
    int _577 = abs(_559);
    float _579 = fma(_569, -2.0, _561);
    float _581 = _541 * _157;
    float _583 = fma(_335, _575, _335);
    int _585 = abs(_573);
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _589 = float(_577);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _593 = 1.0 + _591;
    float _595 = float(_585);
    bool _597 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _605 = _601 || _603;
    float _607 = _589 * _513;
    float _609 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].z, _587);
    float _611 = 1.0 / _593;
    float _613 = _595 * _523;
    float _615 = -_527;
    float _617 = _615 + 1.0;
    float _619 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _303);
    bool _621 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _623 = isnan(1.0);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _629 = _625 || _627;
    float _631 = fma(_575, _563, _563);
    float _633 = _605 ? _617 : 0.0;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _637 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _537);
    float _639 = -_157;
    float _641 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[81].x, _511);
    float _643 = _607 * (-2.0);
    float _645 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].w, _635);
    float _647 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[196].x, _631);
    float _649 = _613 * (-2.0);
    float _651 = fma(_321, _643, _321);
    float _653 = fma(_643, _565, _565);
    float _655 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _609);
    float _657 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _645);
    float _659 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _579);
    float _661 = _231 + (-0.5);
    bool _663 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _665 = isnan(_227);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    if (_629)
    {
        float _675 = _633 * _611;
        _159 = _675;
    }
    float _677 = _159;
    float _679 = fma(_649, _567, _567);
    float _681 = fma(_339, _649, _339);
    float _683 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[196].y, _653);
    bool _685 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _687 = isnan(_227);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = fma(_583, _677, _647);
    float _699 = -_673;
    float _701 = _699 + 1.0;
    float _703 = fma(_651, _677, _683);
    bool _705 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _707 = isnan(_227);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = _697 * 0.15915493667125701904296875;
    float _719 = _695 * _701;
    float _721 = -_695;
    float _723 = _721 + 1.0;
    float _725 = in.m_74.x;
    float _727 = in.m_74.y;
    float _729 = _703 * 0.15915493667125701904296875;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _735 = _715 * _723;
    float _737 = _233 + (-0.5);
    float _739 = -_715;
    float _741 = _739 + 1.0;
    float _743 = fma(_733, _293, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _745 = _357 * _735;
    float _747 = _341 * _735;
    float _749 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[196].z, _679);
    float _751 = in.m_76.x;
    float _753 = in.m_76.y;
    float _755 = in.m_76.z;
    float _757 = fma(_367, _293, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _759 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[143].y, _745);
    float _761 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[143].x, _747);
    float _763 = in.m_60.x;
    float _765 = in.m_60.y;
    float _767 = in.m_60.z;
    float _769 = fma(_681, _677, _749);
    float _771 = fma(_757, _719, _759);
    float _773 = fma(_743, _719, _761);
    float _775 = _717 * 6.283185482025146484375;
    float _777 = cos(_775);
    float _779 = _769 * 0.15915493667125701904296875;
    float _781 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[145].y, _771);
    float _783 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[145].x, _773);
    float _785 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _787 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _789 = _781 * _727;
    float _791 = _783 * _725;
    float _793 = _729 * 6.283185482025146484375;
    float _795 = sin(_793);
    float _797 = _789 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _799 = _791 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _801 = in.m_78.x;
    float _803 = in.m_78.y;
    float _805 = in.m_78.z;
    float _807 = _797 * _787;
    float _809 = _799 * _785;
    float _811 = _729 * 6.283185482025146484375;
    float _813 = cos(_811);
    float _815 = _765 * _753;
    float _817 = _717 * 6.283185482025146484375;
    float _819 = sin(_817);
    float _821 = fma(_763, _751, _815);
    float _823 = fma(_767, _755, _821);
    float _825 = _779 * 6.283185482025146484375;
    float _827 = cos(_825);
    float _829 = _777 * _813;
    float _831 = _779 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _819 * _795;
    float _837 = _819 * _813;
    float _839 = _813 * _827;
    float _841 = _777 * _795;
    float _843 = _777 * _827;
    float _845 = _819 * _827;
    float _847 = _795 * _827;
    float _849 = _843 * _807;
    float _851 = _845 * _807;
    float _853 = fma(_833, _829, _835);
    float _855 = -_841;
    float _857 = fma(_833, _837, _855);
    float _859 = -_837;
    float _861 = fma(_833, _841, _859);
    float _863 = -_807;
    float _865 = _833 * _863;
    float _867 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _869 = fma(_853, _809, _849);
    float _871 = fma(_833, _835, _829);
    float _873 = fma(_839, _809, _865);
    float _875 = _765 * _803;
    float _877 = fma(_861, _867, _869);
    float _879 = fma(_857, _809, _851);
    float _881 = fma(_847, _867, _873);
    float _883 = fma(_763, _801, _875);
    float _885 = _877 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _887 = _877 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _889 = fma(_871, _867, _879);
    float _891 = fma(_767, _805, _883);
    float _893 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].x, _885);
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _887);
    float _897 = _823 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _899 = _891 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _901 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].z, _893);
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].z, _895);
    float _905 = _901 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _907 = _903 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _909 = _897 + _905;
    float _911 = _899 + _907;
    float _913 = in.m_80.x;
    float _915 = in.m_80.y;
    float _917 = in.m_80.z;
    float _919 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _921 = _909 + _919;
    float _923 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _925 = _911 + _923;
    float _927 = _921 * _921;
    float _929 = _925 * _925;
    float _931 = _927 + _929;
    float _933 = sqrt(_931);
    float _935 = _765 * _915;
    float _937 = fma(_763, _913, _935);
    bool _939 = _933 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _941 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _943 = _933 + _941;
    float _945 = fma(_767, _917, _937);
    float _947 = _851;
    float _949 = _931;
    float _951 = _943;
    float _953 = _877;
    float _955 = _765;
    float _957 = _909;
    float _959 = _911;
    float _961 = _927;
    float _963 = _929;
    if (_939)
    {
        float _965 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _947 = _965;
    }
    float _967 = _947;
    if (_939)
    {
        float _969 = rsqrt(_931);
        _949 = _969;
    }
    float _971 = _949;
    float _973 = _971;
    if (_939)
    {
        float _975 = _943 * _967;
        _951 = _975;
    }
    float _977 = _951;
    float _979 = _877 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_939)
    {
        float _981 = _977 * 0.15915493667125701904296875;
        _953 = _981;
    }
    float _983 = _953;
    float _985 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _979);
    float _987 = _945 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _989 = _763;
    if (_939)
    {
        float _991 = _983 * 6.283185482025146484375;
        float _993 = sin(_991);
        _989 = _993;
    }
    float _995 = _989;
    float _997 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].z, _985);
    float _999 = _997 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1001 = _987 + _999;
    float _1003 = _1001;
    if (_939)
    {
        float _1005 = _1001 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _955 = _1005;
    }
    float _1007 = _955;
    float _1009 = _995;
    if (_939)
    {
        float _1011 = fma(_995, _1007, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1009 = _1011;
    }
    float _1013 = _1009;
    float _1015 = _1013;
    if (_939)
    {
        float _1017 = _971 * _1013;
        _1015 = _1017;
    }
    float _1019 = _1015;
    if (_939)
    {
        float _1021 = fma(_921, _1019, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _957 = _1021;
    }
    float _1023 = _957;
    float _1025 = _1023;
    if (_939)
    {
        float _1027 = fma(_925, _1019, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _959 = _1027;
    }
    float _1029 = _959;
    float _1031 = fma(_1023, 6.2500002968590706586837768554688e-05, 0.5);
    float _1033 = fma(_1029, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5493 = float2(_1031, _1033);
    float3 _1037 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5493, float2(0.0), isnan(_5493)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5493, float2(0.0), isnan(_5493)), level(0.0)).xyz;
    float _1039 = _1037.x;
    float _1041 = _1037.y;
    float _1043 = _1037.z;
    float _1045 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1047 = int(_1045);
    float _1049 = _1029;
    if (_255)
    {
        float _1051 = in.m_70.x;
        _973 = _1051;
    }
    float _1053 = _973;
    float _1055 = 0.0;
    if (_255)
    {
        _1055 = 1.0;
    }
    float _1057 = _1055;
    float _1059 = -_477;
    float _1061 = _1059 + 1.0;
    float _1063 = _1057;
    if (!_255)
    {
        _1063 = 1.2345600128173828125;
    }
    float _1065 = _1063;
    float _1067 = _1053;
    if (!_255)
    {
        float _1069 = in.m_70.y;
        _1067 = _1069;
    }
    float _1071 = _1067;
    int _1073 = abs(_453);
    float _1075 = -_655;
    float _1077 = _1075 + 1.0;
    float _1079 = trunc(_549);
    int _1081 = int(_1079);
    float _1083 = -_657;
    float _1085 = _1083 + 1.0;
    float _1087 = -_637;
    float _1089 = _1087 + 1.0;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1093 = float(uint(_1047));
    float _1095 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1097 = int(_1095);
    int _1099 = ~_1047;
    int _1101 = _1099 + 1;
    float _1103 = float(_1047);
    bool _1105 = _1047 == 0;
    float _1107 = float(uint(_1081));
    float _1109 = 1.0 / _1093;
    float _1111 = float(_1081);
    float _1113 = _1065 * _1071;
    float _1115 = float(uint(_1097));
    float _1117 = trunc(_581);
    int _1119 = int(_1117);
    int _1121 = ~_1097;
    int _1123 = _1121 + 1;
    bool _1125 = _1097 == 0;
    int _1127 = as_type<int>(_1109) + (-2);
    float _1129 = 1.0 / _1115;
    float _1131 = _1109;
    float _1133 = _1089;
    if (_255)
    {
        _1131 = 1.0;
    }
    float _1135 = _1131;
    float _1137 = _1135;
    if (!_255)
    {
        _1137 = 7.345489978790283203125;
    }
    float _1139 = _1137;
    float _1141 = as_type<float>(_1127) * _1107;
    int _1143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1145 = _1143 != 0;
    float _1147 = trunc(_1141);
    float _1149 = precise::max(_1147, 0.0);
    uint _1152 = uint(_1149);
    float _1154 = _1139 * _229;
    int _1156 = as_type<int>(_1129) + (-2);
    float _1158 = float(uint(_1119));
    int _1160 = _1101 * int(_1152);
    int _1162 = _1160 + _1081;
    float _1164 = as_type<float>(_1156) * _1158;
    bool _1166 = _1111 >= _1103;
    bool _1168 = isnan(_1111);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan(_1103);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    int _1178 = ~_1047;
    int _1180 = _1178 + 1;
    float _1182 = float(uint(_1162));
    float _1184 = trunc(_1164);
    float _1186 = precise::max(_1184, 0.0);
    uint _1188 = uint(_1186);
    float _1190 = as_type<float>(_1127) * _1182;
    float _1192 = floor(_1154);
    float _1194 = trunc(_1190);
    float _1196 = precise::max(_1194, 0.0);
    uint _1198 = uint(_1196);
    float _1200 = -_1192;
    float _1202 = _1154 + _1200;
    float _1204 = trunc(_1176);
    int _1206 = int(_1204);
    float _1208 = _1202 * _1103;
    int _1210 = _1123 * int(_1188);
    int _1212 = _1210 + _1119;
    float _1214 = _1103 * _449;
    int _1216 = int(_1152) + int(_1198);
    float _1218 = trunc(_1208);
    int _1220 = int(_1218);
    float _1222 = float(uint(_1212));
    int _1224 = _1180 * _1216;
    int _1226 = _1224 + _1081;
    float _1228 = as_type<float>(_1156) * _1222;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1232 = _1230 != 0;
    float _1234 = trunc(_1214);
    int _1236 = int(_1234);
    bool _1238 = uint(_1226) >= uint(_1047);
    bool _1240 = !_1232;
    int _1242 = _1240 ? 0 : 1;
    bool _1244 = !_1238;
    int _1246 = _1244 ? 0 : (-1);
    int _1248 = abs(_1242);
    float _1250 = trunc(_1228);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    int _1256 = ~_1216;
    int _1258 = _1256 + _1246;
    int _1260 = _1258 + 1;
    int _1262 = ~_1206;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    int _1268 = ~_1097;
    int _1270 = _1268 + 1;
    int _1272 = _1047 * _1260;
    int _1274 = _1272 + _1081;
    int _1276 = _1220 * _1248;
    int _1278 = _1276 + _1081;
    bool _1280 = !_1105;
    int _1282 = _1280 ? _1274 : (-1);
    int _1284 = int(_1188) + int(_1254);
    int _1286 = _1282 * _1266;
    int _1288 = _1047 + (-1);
    float _1290 = floor(_1113);
    int _1292 = _1270 * _1284;
    int _1294 = _1292 + _1119;
    float _1296 = float(_1119);
    int _1298 = _1206 * _1288;
    int _1300 = _1298 + _1286;
    float _1302 = float(_1097);
    int _1304 = abs(_463);
    int _1306 = _1300 * _1073;
    bool _1308 = _1296 >= _1302;
    bool _1310 = isnan(_1296);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan(_1302);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    int _1320 = abs(_457);
    bool _1322 = uint(_1294) >= uint(_1097);
    float _1324 = trunc(_1318);
    int _1326 = int(_1324);
    bool _1328 = !_1322;
    int _1330 = _1328 ? 0 : (-1);
    int _1332 = _1236 * _1304;
    int _1334 = _1332 + _1306;
    bool _1336 = !_1145;
    int _1338 = _1336 ? 0 : 1;
    float _1340 = -_1290;
    float _1342 = _1113 + _1340;
    int _1344 = ~_1284;
    int _1346 = _1344 + _1330;
    int _1348 = _1346 + 1;
    int _1350 = _1278 * _1320;
    int _1352 = _1350 + _1334;
    int _1354 = abs(_1338);
    float _1356 = _1342 * _1302;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1360 = _1358 != 0;
    int _1362 = _1097 * _1348;
    int _1364 = _1362 + _1119;
    float _1366 = _1302 * _449;
    bool _1368 = !_1360;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = trunc(_1356);
    int _1374 = int(_1372);
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1378 = _1376 != 0;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1382 = _1380 != 0;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1386 = _1384 != 0;
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1390 = _1388 != 0;
    int _1392 = _1220 * _1354;
    int _1394 = _1392 + _1352;
    int _1396 = ~_1326;
    int _1398 = _1396 + 1;
    int _1400 = _1398 + 1;
    bool _1402 = !_1125;
    int _1404 = _1402 ? _1364 : (-1);
    bool _1406 = !_1382;
    int _1408 = _1406 ? 0 : 1;
    float _1410 = trunc(_1366);
    int _1412 = int(_1410);
    float _1414 = float(uint(_1394));
    int _1416 = _1404 * _1400;
    int _1418 = abs(_1370);
    int _1420 = _1097 + (-1);
    float _1422 = as_type<float>(_1127) * _1414;
    bool _1424 = !_1378;
    int _1426 = _1424 ? 0 : 1;
    int _1428 = abs(_1408);
    int _1430 = _1326 * _1420;
    int _1432 = _1430 + _1416;
    int _1434 = abs(_1426);
    float _1436 = trunc(_1422);
    float _1438 = precise::max(_1436, 0.0);
    uint _1440 = uint(_1438);
    int _1442 = _1374 * _1418;
    int _1444 = _1442 + _1119;
    bool _1446 = !_1386;
    int _1448 = _1446 ? 0 : 1;
    int _1450 = _1432 * _1428;
    int _1452 = ~_1047;
    int _1454 = _1452 + 1;
    float _1456 = float(uint(_1278));
    int _1458 = _1412 * _1434;
    int _1460 = _1458 + _1450;
    bool _1462 = !_1390;
    int _1464 = _1462 ? 0 : 1;
    int _1466 = abs(_1448);
    float _1468 = as_type<float>(_1127) * _1456;
    int _1470 = abs(_1464);
    int _1472 = _1444 * _1466;
    int _1474 = _1472 + _1460;
    float _1476 = trunc(_1468);
    float _1478 = precise::max(_1476, 0.0);
    uint _1480 = uint(_1478);
    int _1482 = _1454 * int(_1440);
    int _1484 = _1482 + _1394;
    float _1486 = float(uint(_1444));
    int _1488 = _1374 * _1470;
    int _1490 = _1488 + _1474;
    int _1492 = ~_1097;
    int _1494 = _1492 + 1;
    float _1496 = float(uint(_1484));
    float _1498 = as_type<float>(_1156) * _1486;
    float _1500 = float(uint(_1490));
    int _1502 = ~_1047;
    int _1504 = _1502 + 1;
    float _1506 = trunc(_1498);
    float _1508 = precise::max(_1506, 0.0);
    uint _1510 = uint(_1508);
    float _1512 = as_type<float>(_1127) * _1496;
    float _1514 = as_type<float>(_1156) * _1500;
    int _1516 = _1504 * int(_1480);
    int _1518 = _1516 + _1278;
    float _1520 = trunc(_1512);
    float _1522 = precise::max(_1520, 0.0);
    uint _1524 = uint(_1522);
    int _1526 = ~_1097;
    int _1528 = _1526 + 1;
    float _1530 = float(uint(_1518));
    float _1532 = trunc(_1514);
    float _1534 = precise::max(_1532, 0.0);
    uint _1536 = uint(_1534);
    int _1538 = _1494 * int(_1510);
    int _1540 = _1538 + _1444;
    float _1542 = as_type<float>(_1127) * _1530;
    int _1544 = ~_1047;
    int _1546 = _1544 + 1;
    float _1548 = float(uint(_1540));
    float _1550 = trunc(_1542);
    float _1552 = precise::max(_1550, 0.0);
    uint _1554 = uint(_1552);
    int _1556 = int(_1440) + int(_1524);
    float _1558 = as_type<float>(_1156) * _1548;
    int _1560 = _1528 * int(_1536);
    int _1562 = _1560 + _1490;
    float _1564 = trunc(_1558);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = _1546 * _1556;
    int _1572 = _1570 + _1394;
    float _1574 = float(uint(_1562));
    bool _1576 = uint(_1572) >= uint(_1047);
    int _1578 = int(_1480) + int(_1554);
    float _1580 = as_type<float>(_1156) * _1574;
    bool _1582 = !_1576;
    int _1584 = _1582 ? 0 : (-1);
    int _1586 = ~_1097;
    int _1588 = _1586 + 1;
    float _1590 = trunc(_1580);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    int _1596 = ~_1556;
    int _1598 = _1596 + _1584;
    int _1600 = _1598 + 1;
    int _1602 = int(_1510) + int(_1568);
    int _1604 = _1047 * _1600;
    int _1606 = _1604 + _1394;
    int _1608 = ~_1047;
    int _1610 = _1608 + 1;
    int _1612 = _1588 * _1602;
    int _1614 = _1612 + _1444;
    int _1616 = ~_1097;
    int _1618 = _1616 + 1;
    bool _1620 = !_1105;
    int _1622 = _1620 ? _1606 : (-1);
    int _1624 = _1610 * _1578;
    int _1626 = _1624 + _1278;
    int _1628 = _1622 & 3;
    bool _1630 = _1628 != 0;
    int _1632 = int(_1536) + int(_1594);
    int _1634 = _1622 & 3;
    bool _1636 = _1634 != 0;
    int _1638 = _1630 ? 0 : 1;
    int _1640 = _1618 * _1632;
    int _1642 = _1640 + _1490;
    bool _1644 = uint(_1634) >= 2u;
    bool _1646 = uint(_1626) >= uint(_1047);
    int _1648 = _1644 ? 0 : 1;
    bool _1650 = uint(_1642) >= uint(_1097);
    bool _1652 = uint(_1634) > 1u;
    bool _1654 = !_1646;
    int _1656 = _1654 ? 0 : (-1);
    bool _1658 = !_1650;
    int _1660 = _1658 ? 0 : (-1);
    int _1662 = ~_1578;
    int _1664 = _1662 + _1656;
    int _1666 = _1664 + 1;
    int _1668 = ~_1632;
    int _1670 = _1668 + _1660;
    int _1672 = _1670 + 1;
    bool _1674 = _235 > 0.5;
    int _1676 = _1047 * _1666;
    int _1678 = _1676 + _1278;
    int _1680 = ~_1638;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    int _1686 = _1097 * _1672;
    int _1688 = _1686 + _1490;
    int _1690 = _1684;
    if (!_1652)
    {
        int _1692 = ~_1638;
        int _1694 = _1692 + 1;
        _1690 = _1694;
    }
    int _1696 = _1690;
    float _1698 = -_197;
    int _1700 = _1674 ? as_type<int>(_1698) : as_type<int>(_197);
    int _1702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1704 = _1702 != 0;
    bool _1706 = !_1125;
    int _1708 = _1706 ? _1688 : (-1);
    bool _1710 = _1634 != 3;
    bool _1712 = !_1105;
    int _1714 = _1712 ? _1678 : (-1);
    int _1716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1718 = _1716 != 0;
    bool _1720 = !_1704;
    int _1722 = _1720 ? 0 : 1;
    int _1724 = _1622 >> 31;
    int _1726 = _1708 & 3;
    bool _1728 = _1726 != 0;
    int _1730 = _1708 >> 31;
    bool _1732 = !_1718;
    int _1734 = _1732 ? 0 : 1;
    int _1736 = _1724 & 3;
    bool _1738 = uint(_1614) >= uint(_1097);
    int _1740 = _1708 & 3;
    bool _1742 = _1740 != 0;
    bool _1744 = !_1728;
    float _1746 = _1744 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1748 = _1730 & 3;
    bool _1750 = uint(_1726) > 1u;
    int _1752 = _1622 + _1736;
    bool _1754 = !_1738;
    int _1756 = _1754 ? 0 : (-1);
    int _1758 = _1742 ? 0 : 1;
    int _1760 = _1708 + _1748;
    int _1762 = ~_1648;
    int _1764 = _1762 + 1;
    int _1766 = _1764 + 1;
    bool _1768 = _1634 != 3;
    int _1770 = _1766;
    float _1772 = _1746;
    if (_1710)
    {
        int _1774 = ~_1648;
        int _1776 = _1774 + 1;
        _1770 = _1776;
    }
    int _1778 = _1770;
    bool _1780 = !_1636;
    int _1782 = _1780 ? 0 : 1;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1786 = _1784 != 0;
    int _1788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1790 = _1788 != 0;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1794 = _1792 != 0;
    int _1796 = _1752 >> 2;
    int _1798 = ~_1602;
    int _1800 = _1798 + _1756;
    int _1802 = _1800 + 1;
    int _1804 = _1760 >> 2;
    bool _1806 = !_1768;
    int _1808 = _1806 ? 0 : (-1);
    int _1810 = _1097 * _1802;
    int _1812 = _1810 + _1444;
    bool _1814 = uint(_1726) >= 2u;
    int _1816 = _1796 << 4;
    int _1818 = _1816 + 368;
    int _1820 = _1804 << 4;
    int _1822 = _1820 + 512;
    int _1824 = ~_1758;
    int _1826 = _1824 + 1;
    int _1828 = _1826 + 1;
    uint _1830 = uint(int(uint(_1818) >> uint(2)));
    uint _1832 = uint(int(uint(int(_1830)) >> uint(2)));
    int _1834 = int(_1830) & 3;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[int(_1832)][_1834];
    int _1838 = int(_1830) + 1;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    int _1842 = _1838 & 3;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[int(_1840)][_1842];
    int _1846 = _1828;
    if (!_1750)
    {
        int _1848 = ~_1758;
        int _1850 = _1848 + 1;
        _1846 = _1850;
    }
    int _1852 = _1846;
    int _1854 = _1814 ? 0 : 1;
    bool _1856 = _1726 != 3;
    bool _1858 = _1726 != 3;
    int _1860 = _1818 + 8;
    uint _1862 = uint(int(uint(_1860) >> uint(2)));
    uint _1864 = uint(int(uint(int(_1862)) >> uint(2)));
    int _1866 = int(_1862) & 3;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[int(_1864)][_1866];
    int _1870 = int(_1862) + 1;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    int _1874 = _1870 & 3;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[int(_1872)][_1874];
    int _1878 = ~_1854;
    int _1880 = _1878 + 1;
    int _1882 = _1880 + 1;
    bool _1884 = !_1125;
    int _1886 = _1884 ? _1812 : (-1);
    uint _1888 = uint(int(uint(_1822) >> uint(2)));
    uint _1890 = uint(int(uint(int(_1888)) >> uint(2)));
    int _1892 = int(_1888) & 3;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[int(_1890)][_1892];
    int _1896 = int(_1888) + 1;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    int _1900 = _1896 & 3;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[int(_1898)][_1900];
    int _1904 = _1882;
    if (_1856)
    {
        int _1906 = ~_1854;
        int _1908 = _1906 + 1;
        _1904 = _1908;
    }
    int _1910 = _1904;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1914 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1916 = _1914 != 0;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1920 = _1822 + 8;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    uint _1924 = uint(int(uint(int(_1922)) >> uint(2)));
    int _1926 = int(_1922) & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = int(_1922) + 1;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    int _1934 = _1930 & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    float _1938 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1940 = abs(_1852);
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1944 = abs(_1696);
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1948 = abs(_1782);
    float _1950 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1952 = !_1858;
    int _1954 = _1952 ? 0 : (-1);
    float _1956 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1958 = _229 > 0.5;
    bool _1960 = _231 > 0.5;
    out.m_82.x = _1950;
    out.m_82.y = _1938;
    out.m_82.z = _1956;
    out.m_82.w = _1918;
    int _1962 = ~_1944;
    int _1964 = _1962 + 1;
    int _1966 = _1964 + 1;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1970 = -_193;
    int _1972 = _1958 ? as_type<int>(_1970) : as_type<int>(_193);
    float _1974 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1976 = _233 > 0.5;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1980 = _1966 * as_type<int>(_1844);
    int _1982 = abs(_1778);
    float _1984 = _1968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1986 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1988 = int(_1986);
    float _1990 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1992 = abs(as_type<int>(_1746));
    if (_939)
    {
        float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1996 = _1023 + _1994;
        _1772 = _1996;
    }
    float _1998 = _1772;
    int _2000 = ~_1940;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    int _2006 = ~_1948;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    out.m_84.x = _1974;
    out.m_84.y = _1984;
    out.m_84.z = _1990;
    int _2012 = ~_1992;
    int _2014 = _2012 + 1;
    int _2016 = _2014 + 1;
    int _2018 = _2004 * as_type<int>(_1902);
    int _2020 = abs(_1808);
    int _2022 = _2010 * as_type<int>(_1836);
    int _2024 = _2022 + _1980;
    int _2026 = abs(_1954);
    int _2028 = _2016 * as_type<int>(_1894);
    int _2030 = _2028 + _2018;
    float _2032 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2034 = int(_2032);
    int _2036 = abs(_1910);
    float _2038 = _843 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2040 = ~_1982;
    int _2042 = _2040 + 1;
    int _2044 = _2042 + 1;
    float _2046 = _853 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2048 = _843 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2050 = float(uint(_1988));
    int _2052 = _2044 * as_type<int>(_1868);
    int _2054 = _2052 + _2024;
    int _2056 = ~_2020;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    float _2062 = _853 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2064 = ~_2036;
    int _2066 = _2064 + 1;
    int _2068 = _2066 + 1;
    if (_939)
    {
        float _2070 = _1998 * _1998;
        _961 = _2070;
    }
    float _2072 = _961;
    float _2074 = 1.0 / _2050;
    int _2076 = _2060 * as_type<int>(_1876);
    int _2078 = _2076 + _2054;
    int _2080 = abs(_1722);
    int _2082 = _2068 * as_type<int>(_1928);
    int _2084 = _2082 + _2030;
    int _2086 = abs(_1988);
    int _2088 = ~_2080;
    int _2090 = _2088 + 1;
    int _2092 = _2090 + 1;
    int _2094 = ~_2026;
    int _2096 = _2094 + 1;
    int _2098 = _2096 + 1;
    float _2100 = float(uint(_2034));
    int _2102 = _2078 * _2092;
    int _2104 = _2098 * as_type<int>(_1936);
    int _2106 = _2104 + _2084;
    int _2108 = abs(_1734);
    float _2110 = _843 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2112 = _1714 * _2080;
    int _2114 = _2112 + _2102;
    float _2116 = 1.0 / _2100;
    float _2118 = float(uint(_2086));
    float _2120 = -_833;
    float _2122 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2038);
    int _2124 = abs(_2034);
    float _2126 = -_833;
    float _2128 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2110);
    int _2130 = as_type<int>(_2074) + (-2);
    float _2132 = _861 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2134 = float(uint(_2114));
    float _2136 = 1.0 / _2118;
    float _2138 = -_833;
    float _2140 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2048);
    int _2142 = ~_2108;
    int _2144 = _2142 + 1;
    int _2146 = _2144 + 1;
    float _2148 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2122);
    float _2150 = float(uint(_2124));
    float _2152 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2140);
    float _2154 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2128);
    float _2156 = _853 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2158 = as_type<float>(_2130) * _2134;
    int _2160 = _2106 * _2146;
    float _2162 = 1.0 / _2150;
    float _2164 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2156);
    int _2166 = abs(_2114);
    int _2168 = _1886 * _2108;
    int _2170 = _2168 + _2160;
    float _2172 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2046);
    float _2174 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2062);
    int _2176 = as_type<int>(_2116) + (-2);
    float _2178 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2164);
    float _2180 = trunc(_2158);
    float _2182 = precise::max(_2180, 0.0);
    uint _2184 = uint(_2182);
    float _2186 = float(uint(_2170));
    int _2188 = abs(_2170);
    float _2190 = as_type<float>(_2176) * _2186;
    float _2192 = float(uint(_2166));
    float _2194 = as_type<float>(_2106);
    if (_939)
    {
        float _2196 = _983 * 6.283185482025146484375;
        float _2198 = cos(_2196);
        _2194 = _2198;
    }
    float _2200 = _2194;
    int _2202 = ~_1988;
    int _2204 = _2202 + 1;
    float _2206 = _861 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2208 = as_type<int>(_2162) + (-2);
    float _2210 = float(uint(_2188));
    bool _2212 = !_1786;
    float _2214 = _2212 ? _197 : as_type<float>(_1700);
    float _2216 = trunc(_2190);
    float _2218 = precise::max(_2216, 0.0);
    uint _2220 = uint(_2218);
    int _2222 = as_type<int>(_2136) + (-2);
    float _2224 = _861 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2226 = !_1916;
    float _2228 = _2226 ? _193 : as_type<float>(_1972);
    bool _2230 = _2034 == 0;
    float _2232 = as_type<float>(_2222) * _2192;
    float _2234 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2206);
    int _2236 = _2204 * int(_2184);
    int _2238 = _2236 + _2114;
    float _2240 = as_type<float>(_2208) * _2210;
    float _2242 = trunc(_2232);
    float _2244 = precise::max(_2242, 0.0);
    uint _2246 = uint(_2244);
    float _2248 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2224);
    float _2250 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2132);
    float _2252 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    float _2254 = float(uint(_2238));
    float _2256 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2248);
    float _2258 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2250);
    int _2260 = ~_2086;
    int _2262 = _2260 + 1;
    float _2264 = trunc(_2240);
    float _2266 = precise::max(_2264, 0.0);
    uint _2268 = uint(_2266);
    int _2270 = ~_2034;
    int _2272 = _2270 + 1;
    float _2274 = as_type<float>(_2130) * _2254;
    float _2276 = as_type<float>(_2262);
    if (_939)
    {
        float _2278 = _2200 + (-1.0);
        _2276 = _2278;
    }
    float _2280 = _2276;
    int _2282 = ~_2124;
    int _2284 = _2282 + 1;
    int _2286 = _2272 * int(_2220);
    int _2288 = _2286 + _2170;
    int _2290 = _2262 * int(_2246);
    int _2292 = _2290 + _2166;
    float _2294 = _2280;
    if (_939)
    {
        float _2296 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2294 = _2296;
    }
    float _2298 = _2294;
    float _2300 = trunc(_2274);
    float _2302 = precise::max(_2300, 0.0);
    uint _2304 = uint(_2302);
    float _2306 = float(uint(_2288));
    float _2308 = float(uint(_2292));
    if (_939)
    {
        float _2310 = fma(_1001, _2200, _2298);
        _1003 = _2310;
    }
    float _2312 = _1003;
    float _2314 = -_197;
    int _2316 = _1960 ? as_type<int>(_2314) : as_type<int>(_197);
    int _2318 = _2284 * int(_2268);
    int _2320 = _2318 + _2188;
    float _2322 = as_type<float>(_2222) * _2308;
    bool _2324 = !_1790;
    float _2326 = _2324 ? _197 : as_type<float>(_2316);
    float _2328 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2330 = float(uint(_2320));
    float _2332 = as_type<float>(_2176) * _2306;
    float _2334 = -_193;
    int _2336 = _1976 ? as_type<int>(_2334) : as_type<int>(_193);
    float _2338 = trunc(_2322);
    float _2340 = precise::max(_2338, 0.0);
    uint _2342 = uint(_2340);
    float _2344 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    float _2346 = as_type<float>(_2208) * _2330;
    bool _2348 = !_1794;
    float _2350 = _2348 ? _193 : as_type<float>(_2336);
    float _2352 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2354 = _2328 * _2152;
    float _2356 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2174);
    float _2358 = _2328 * _2154;
    float _2360 = trunc(_2332);
    float _2362 = precise::max(_2360, 0.0);
    uint _2364 = uint(_2362);
    float _2366 = fma(_2352, _2178, _2354);
    float _2368 = _2354;
    if (_939)
    {
        float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2372 = _1029 + _2370;
        _2368 = _2372;
    }
    float _2374 = _2368;
    float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2378 = _2312 + _2376;
    out.m_86.x = _2178;
    out.m_86.y = _2344;
    out.m_86.z = _2356;
    if (_939)
    {
        float _2380 = _2374 * _2374;
        _963 = _2380;
    }
    float _2382 = _963;
    int _2384 = int(_2184) + int(_2304);
    float _2386 = trunc(_2346);
    float _2388 = precise::max(_2386, 0.0);
    uint _2390 = uint(_2388);
    float _2392 = _2328 * _2148;
    int _2394 = ~_1988;
    int _2396 = _2394 + 1;
    float _2398 = fma(_2378, _2378, _2072);
    bool _2400 = _2034 == 0;
    float _2402 = fma(_2352, _2344, _2392);
    float _2404 = fma(_2352, _2356, _2358);
    int _2406 = ~_2086;
    int _2408 = _2406 + 1;
    int _2410 = int(_2220) + int(_2364);
    int _2412 = ~_2034;
    int _2414 = _2412 + 1;
    int _2416 = int(_2246) + int(_2342);
    int _2418 = int(_2268) + int(_2390);
    int _2420 = _2396 * _2384;
    int _2422 = _2420 + _2114;
    int _2424 = ~_2124;
    int _2426 = _2424 + 1;
    int _2428 = _2408 * _2416;
    int _2430 = _2428 + _2166;
    float _2432 = _2398 + _2382;
    int _2434 = _2414 * _2410;
    int _2436 = _2434 + _2170;
    bool _2438 = uint(_2422) >= uint(_1988);
    int _2440 = _2426 * _2418;
    int _2442 = _2440 + _2188;
    float _2444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2446 = uint(_2430) >= uint(_2086);
    bool _2448 = uint(_2436) >= uint(_2034);
    bool _2450 = !_2438;
    int _2452 = _2450 ? 0 : (-1);
    bool _2454 = !_2448;
    int _2456 = _2454 ? 0 : (-1);
    float _2458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2460 = ~_2384;
    int _2462 = _2460 + _2452;
    int _2464 = _2462 + 1;
    bool _2466 = uint(_2442) >= uint(_2124);
    int _2468 = ~_2410;
    int _2470 = _2468 + _2456;
    int _2472 = _2470 + 1;
    int _2474 = _1988 * _2464;
    int _2476 = _2474 + _2114;
    int _2478 = _2114 ^ _1988;
    float _2480 = sqrt(_2432);
    bool _2482 = !_2466;
    int _2484 = _2482 ? 0 : (-1);
    int _2486 = _2034 * _2472;
    int _2488 = _2486 + _2170;
    bool _2490 = !_2446;
    int _2492 = _2490 ? 0 : (-1);
    uint _2494 = uint(int(uint(_2478) >> uint(31)));
    bool _2496 = _1988 == 0;
    float _2498 = _2458 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2500 = _1988 == 0;
    float _2502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2504 = _2170 ^ _2034;
    int _2506 = ~_2484;
    int _2508 = _2418 + _2506;
    int _2510 = _2508 + 1;
    int _2512 = ~_2492;
    int _2514 = _2416 + _2512;
    int _2516 = _2514 + 1;
    float _2518 = fma(_2328, _2328, 1.0);
    int _2520 = ~int(_2494);
    int _2522 = _2520 + 1;
    float _2524 = _2444 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2526 = !_2496;
    int _2528 = _2526 ? _2476 : (-1);
    float _2530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2532 = uint(int(uint(_2504) >> uint(31)));
    int _2534 = _2516 ^ _2522;
    float _2536 = float(_2528);
    int _2538 = ~int(_2532);
    int _2540 = _2538 + 1;
    int _2542 = ~_2522;
    int _2544 = _2542 + _2534;
    int _2546 = _2544 + 1;
    float _2548 = fma(_2524, _2536, _547);
    bool _2550 = !_2230;
    int _2552 = _2550 ? _2488 : (-1);
    float _2554 = rsqrt(_2518);
    int _2556 = _2510 ^ _2540;
    float _2558 = float(_2552);
    float _2560 = _2502 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2562 = ~_2540;
    int _2564 = _2562 + _2556;
    int _2566 = _2564 + 1;
    float _2568 = _2228 + 0.5;
    bool _2570 = !_2500;
    int _2572 = _2570 ? _2546 : (-1);
    float _2574 = fma(_2560, _2558, _641);
    bool _2576 = !_2400;
    int _2578 = _2576 ? _2566 : (-1);
    float _2580 = fma(_2524, _2568, _2548);
    float _2582 = float(_2572);
    float _2584 = _2350 + 0.5;
    float _2586 = float(_2578);
    float _2588 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2590 = -_1077;
    float _2592 = fma(_2228, _2590, _2580);
    float _2594 = -_619;
    float _2596 = fma(_2498, _2582, _2594);
    float _2598 = _2326 + (-0.5);
    float _2600 = fma(_2560, _2584, _2574);
    float _2602 = _2328 * _2554;
    float _2604 = -_659;
    float _2606 = fma(_2588, _2586, _2604);
    float _2608 = _2214 + (-0.5);
    float _2610 = -_2498;
    float _2612 = fma(_2610, _2598, _2596);
    float _2614 = -_2252;
    float _2616 = _2602 * _2614;
    float _2618 = -_2256;
    float _2620 = _2602 * _2618;
    float _2622 = -_2258;
    float _2624 = _2602 * _2622;
    float _2626 = -_2588;
    float _2628 = fma(_2626, _2608, _2606);
    float _2630 = fma(_2554, _2148, _2616);
    float _2632 = fma(_2554, _2152, _2620);
    float _2634 = -_1061;
    float _2636 = fma(_2350, _2634, _2600);
    float _2638 = fma(_2554, _2154, _2624);
    float _2640 = _2256 + _2366;
    float _2642 = fma(_2326, _1085, _2612);
    float _2644 = fma(_2214, _1089, _2628);
    float _2646 = _2252 + _2402;
    float _2648 = _2258 + _2404;
    out.m_88.x = _2632;
    out.m_88.y = _2630;
    out.m_88.z = _2638;
    bool _2650 = _2480 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2652 = isnan(_2480);
    bool _2654 = _2650 || _2652;
    bool _2656 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2658 = _2654 || _2656;
    out.m_90.x = _2592;
    out.m_90.y = _2642;
    out.m_90.z = _2636;
    out.m_90.w = _2644;
    out.m_92.x = _1039;
    out.m_92.y = _1041;
    out.m_92.z = _1043;
    out.m_94.x = _2640;
    out.m_94.y = _2646;
    out.m_94.z = _2648;
    float _2660 = _2518;
    float _2662 = as_type<float>(_2422);
    float _2664 = as_type<float>(_2540);
    if (!_2658)
    {
        _1133 = 1.0;
    }
    float _2666 = _1133;
    bool _2668 = !_2658;
    float _2670 = _2666;
    if (!_2668)
    {
        bool _2672 = _2480 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2674 = isnan(_2480);
        bool _2676 = _2672 || _2674;
        bool _2678 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2680 = _2676 || _2678;
        if (!_2680)
        {
            float _2682 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2684 = _2480 + _2682;
            float _2686 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2688 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2686;
            float _2690 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2692 = _2690 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2694 = 1.0 / _2688;
            float _2696 = _2684 * _2694;
            float _2698 = fma(_2696, _2692, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2670 = _2698;
            _2700 = true;
        }
        else
        {
            bool _2702 = _2480 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2704 = isnan(_2480);
            bool _2706 = _2702 || _2704;
            bool _2708 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2710 = _2706 || _2708;
            if (!_2710)
            {
                float _2712 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2714 = _2480 + _2712;
                float _2716 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2718 = _2716 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2720 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2722 = _2720 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2724 = 1.0 / _2718;
                float _2726 = _2714 * _2724;
                float _2728 = fma(_2726, _2722, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2670 = _2728;
                _2700 = true;
            }
            else
            {
                _2670 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2700 = false;
    float _2730 = _2670;
    float _2732 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2734 = _2312 + _2732;
    float _2736 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2738 = _1023 + _2736;
    float _2740 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2742 = _1029 + _2740;
    float _2744 = fma(_2734, _2730, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2746 = fma(_2738, _2730, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2748 = fma(_2742, _2730, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2750 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2752 = _2744 + _2750;
    float _2754 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2756 = _2746 + _2754;
    float _2758 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2760 = _2748 + _2758;
    float _2762 = _2752 * _2752;
    float _2764 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2766 = fma(_2756, _2756, _2762);
    float _2768 = _987 + _2764;
    float _2770 = fma(_2760, _2760, _2766);
    float _2772 = _987 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2774 = rsqrt(_2770);
    float _2776 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2772);
    float _2778 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2776);
    float _2780 = sqrt(_2770);
    float _2782 = _2778 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2784 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2786 = _987 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2788 = _2756 * _2784;
    float _2790 = _2760 * _2784;
    float _2792 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2786);
    float _2794 = _2788 * _2788;
    float _2796 = _2790 * _2790;
    float _2798 = 1.0 / _2782;
    float _2800 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2792);
    float _2802 = _2794 + _2796;
    float _2804 = _2800 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2806 = sqrt(_2802);
    float _2808 = _2804 + _2782;
    float _2810 = _2808 * _2798;
    float _2812 = _2810 * 0.5;
    float _2814 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2816 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2814);
    float _2818 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2820 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _2822 = _2806 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2826 = _2806 + _2824;
    float _2828 = 1.0 / _2816;
    float _2830 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2820);
    float _2832 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2834 = fma(_899, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2830);
    float _2836 = floor(_2818);
    float _2838 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2840 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    int _2842 = 2;
    float _2844 = _2784;
    float _2846 = _2788;
    float _2848 = _2794;
    if (_2822)
    {
        float _2850 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2840 = _2850;
    }
    float _2852 = _2840;
    float _2854 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2856 = _2828 * _2854;
    float _2858 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2832);
    bool _2860 = _2856 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2862 = fma(_899, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2858);
    bool _2864 = _2856 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2866 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2868 = trunc(_2838);
    int _2870 = int(_2868);
    float _2872 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2874 = -_2836;
    float _2876 = _2818 + _2874;
    float _2878 = precise::max(0.0, _2866);
    float _2880 = _2862;
    int _2882 = as_type<int>(_2872);
    if (_2822)
    {
        float _2884 = _2826 * _2852;
        _2880 = _2884;
    }
    float _2886 = _2880;
    float _2888 = trunc(_2872);
    int _2890 = int(_2888);
    if (!_2860)
    {
        _2842 = 1;
    }
    int _2892 = _2842;
    int _2894 = _2892;
    if (_2822)
    {
        float _2896 = _2886 * 0.15915493667125701904296875;
        _1025 = _2896;
    }
    float _2898 = _1025;
    bool _2900 = !_2860;
    int _2902 = _2900 ? 0 : 1;
    float _2904 = -_2784;
    float _2906 = -_2878;
    float _2908 = fma(_2752, _2904, _2906);
    if (!_2864)
    {
        _2894 = _2902;
    }
    int _2910 = _2894;
    float _2912 = _2834;
    float _2914 = as_type<float>(_2910);
    if (_2822)
    {
        float _2916 = _2898 * 6.283185482025146484375;
        float _2918 = sin(_2916);
        _2912 = _2918;
    }
    float _2920 = _2912;
    if (_2822)
    {
        float _2922 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2844 = _2922;
    }
    float _2924 = _2844;
    int _2926 = _2910 << 6;
    int _2928 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2930 = _2870 + _2928;
    int _2932 = _2930 + 1;
    float _2934 = fma(_899, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _2936 = _2926 + 48;
    uint _2938 = uint(int(uint(_2936) >> uint(2)));
    uint _2940 = uint(int(uint(int(_2938)) >> uint(2)));
    int _2942 = int(_2938) & 3;
    float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
    int _2946 = int(_2938) + 1;
    uint _2948 = uint(int(uint(_2946) >> uint(2)));
    int _2950 = _2946 & 3;
    float _2952 = (*spvDescriptorSet0.vp_c15)._m0[int(_2948)][_2950];
    float _2954 = _2802;
    if (_2822)
    {
        float _2956 = rsqrt(_2802);
        _2954 = _2956;
    }
    float _2958 = _2954;
    int _2960 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2962 = _2890 + _2960;
    int _2964 = _2962 + 1;
    bool _2966 = _2932 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2968 = _2932 | _2964;
    int _2970 = _2926 + 96;
    uint _2972 = uint(int(uint(_2970) >> uint(2)));
    uint _2974 = uint(int(uint(int(_2972)) >> uint(2)));
    int _2976 = int(_2972) & 3;
    float _2978 = (*spvDescriptorSet0.vp_c15)._m0[int(_2974)][_2976];
    int _2980 = int(_2972) + 1;
    uint _2982 = uint(int(uint(_2980) >> uint(2)));
    int _2984 = _2980 & 3;
    float _2986 = (*spvDescriptorSet0.vp_c15)._m0[int(_2982)][_2984];
    if (_2822)
    {
        float _2988 = fma(_2920, _2924, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2660 = _2988;
    }
    float _2990 = _2660;
    float _2992 = _2898;
    float _2994 = _2990;
    if (_2822)
    {
        float _2996 = _2898 * 6.283185482025146484375;
        float _2998 = cos(_2996);
        _2992 = _2998;
    }
    float _3000 = _2992;
    float _3002 = _2744 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _3004 = _2968 < 0;
    bool _3006 = _3004 || _2966;
    float _3008 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3002);
    int _3010 = _2926 + 56;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    uint _3014 = uint(int(uint(int(_3012)) >> uint(2)));
    int _3016 = int(_3012) & 3;
    float _3018 = (*spvDescriptorSet0.vp_c15)._m0[int(_3014)][_3016];
    int _3020 = int(_3012) + 1;
    uint _3022 = uint(int(uint(_3020) >> uint(2)));
    int _3024 = _3020 & 3;
    float _3026 = (*spvDescriptorSet0.vp_c15)._m0[int(_3022)][_3024];
    float _3028 = _2958;
    if (_2822)
    {
        float _3030 = _2958 * _2990;
        _2662 = _3030;
    }
    float _3032 = _2662;
    float _3034 = floor(_2934);
    bool _3036 = _2964 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3038 = _3036 || _3006;
    float _3040 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3008);
    float _3042 = _3040;
    if (_2822)
    {
        float _3044 = _2788 * _3032;
        _2846 = _3044;
    }
    float _3046 = _2846;
    if (!_2822)
    {
        _2994 = _2908;
    }
    float _3048 = _2994;
    int _3050 = _2926 + 104;
    uint _3052 = uint(int(uint(_3050) >> uint(2)));
    uint _3054 = uint(int(uint(int(_3052)) >> uint(2)));
    int _3056 = int(_3052) & 3;
    float _3058 = (*spvDescriptorSet0.vp_c15)._m0[int(_3054)][_3056];
    int _3060 = int(_3052) + 1;
    uint _3062 = uint(int(uint(_3060) >> uint(2)));
    int _3064 = _3060 & 3;
    float _3066 = (*spvDescriptorSet0.vp_c15)._m0[int(_3062)][_3064];
    float _3068 = _3048;
    if (_2822)
    {
        float _3070 = _3046 * _3046;
        _2848 = _3070;
    }
    float _3072 = _2848;
    if (_2822)
    {
        float _3074 = _3000 + (-1.0);
        _3028 = _3074;
    }
    float _3076 = _3028;
    float _3078 = _3076;
    if (_2822)
    {
        float _3080 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1049 = _3080;
    }
    float _3082 = _1049;
    if (!_2822)
    {
        _3078 = _2790;
    }
    float _3084 = _3078;
    int _3086 = _2926 + 64;
    uint _3088 = uint(int(uint(_3086) >> uint(2)));
    uint _3090 = uint(int(uint(int(_3088)) >> uint(2)));
    int _3092 = int(_3088) & 3;
    float _3094 = (*spvDescriptorSet0.vp_c15)._m0[int(_3090)][_3092];
    int _3096 = int(_3088) + 1;
    uint _3098 = uint(int(uint(_3096) >> uint(2)));
    int _3100 = _3096 & 3;
    float _3102 = (*spvDescriptorSet0.vp_c15)._m0[int(_3098)][_3100];
    float _3104 = _3084;
    if (_2822)
    {
        float _3106 = _2790 * _3032;
        _3104 = _3106;
    }
    float _3108 = _3104;
    float _3110 = _3040 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_2822)
    {
        float _3112 = fma(_2908, _3000, _3082);
        _3068 = _3112;
    }
    float _3114 = _3068;
    if (!_2822)
    {
        _3042 = _2796;
    }
    float _3116 = _3042;
    float _3118 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3120 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3122 = fma(_3114, _3114, _3072);
    int _3124 = _2926 + 80;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    uint _3128 = uint(int(uint(int(_3126)) >> uint(2)));
    int _3130 = int(_3126) & 3;
    float _3132 = (*spvDescriptorSet0.vp_c15)._m0[int(_3128)][_3130];
    int _3134 = int(_3126) + 1;
    uint _3136 = uint(int(uint(_3134) >> uint(2)));
    int _3138 = _3134 & 3;
    float _3140 = (*spvDescriptorSet0.vp_c15)._m0[int(_3136)][_3138];
    float _3142 = -_3034;
    float _3144 = _2934 + _3142;
    float _3146 = -_3120;
    float _3148 = fma(_3146, _3118, 1.0);
    int _3150 = as_type<int>(_3120);
    float _3152 = _3116;
    if (!_3038)
    {
        int _3154 = _2964 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3156 = _3154 + _2932;
        _3150 = _3156;
    }
    int _3158 = _3150;
    if (_2822)
    {
        float _3160 = _3108 * _3108;
        _3152 = _3160;
    }
    float _3162 = _3152;
    if (!_3038)
    {
        float _3164 = floor(_2872);
        _2664 = _3164;
    }
    float _3166 = _2664;
    int _3168 = _2926 + 72;
    uint _3170 = uint(int(uint(_3168) >> uint(2)));
    uint _3172 = uint(int(uint(int(_3170)) >> uint(2)));
    int _3174 = int(_3170) & 3;
    float _3176 = (*spvDescriptorSet0.vp_c15)._m0[int(_3172)][_3174];
    int _3178 = int(_3170) + 1;
    uint _3180 = uint(int(uint(_3178) >> uint(2)));
    int _3182 = _3178 & 3;
    float _3184 = (*spvDescriptorSet0.vp_c15)._m0[int(_3180)][_3182];
    float _3186 = _2768 * _2952;
    float _3188 = _3122 + _3162;
    float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3192 = fma(_2780, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3190);
    float _3194 = precise::clamp(_3192, 0.0, 1.0);
    float _3196 = fma(_897, _2944, _3186);
    float _3198 = rsqrt(_3188);
    float _3200 = -_3194;
    float _3202 = _3200 + 1.0;
    int _3204 = _2926 + 88;
    uint _3206 = uint(int(uint(_3204) >> uint(2)));
    uint _3208 = uint(int(uint(int(_3206)) >> uint(2)));
    int _3210 = int(_3206) & 3;
    float _3212 = (*spvDescriptorSet0.vp_c15)._m0[int(_3208)][_3210];
    int _3214 = int(_3206) + 1;
    uint _3216 = uint(int(uint(_3214) >> uint(2)));
    int _3218 = _3214 & 3;
    float _3220 = (*spvDescriptorSet0.vp_c15)._m0[int(_3216)][_3218];
    float _3222 = _2768 * _2986;
    int _3224 = as_type<int>(_3186);
    int _3226 = as_type<int>(_2978);
    if (!_3038)
    {
        int _3228 = _3158 << 2;
        _3224 = _3228;
    }
    int _3230 = _3224;
    float _3232 = fma(_897, _2978, _3222);
    int _3234 = _3230;
    if (!_3038)
    {
        int _3236 = 12 & _3230;
        _3234 = _3236;
    }
    int _3238 = _3234;
    float _3240 = fma(_899, _3018, _3196);
    float _3242 = _3198 * _3046;
    float _3244 = _3198 * _3114;
    float _3246 = fma(_899, _3058, _3232);
    float _3248 = _3240 + _3026;
    float _3250 = abs(_3202);
    float _3252 = log2(_3250);
    float _3254 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3256 = _3246 + _3066;
    float _3258 = _2744 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3260 = _3198 * _3108;
    float _3262 = -_3254;
    float _3264 = fma(_3244, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3262);
    float _3266 = _2768 * _3102;
    float _3268 = _3102;
    if (!_3038)
    {
        float _3270 = -_3166;
        float _3272 = _2872 + _3270;
        _3268 = _3272;
    }
    float _3274 = _3268;
    float _3276 = 1.0 / _3256;
    float _3278 = -_3260;
    float _3280 = fma(_3278, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3264);
    float _3282 = fma(_897, _3094, _3266);
    float _3284 = _2744 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (!_3038)
    {
        uint _3286 = uint(int(uint(_3158) >> uint(2)));
        _2882 = int(_3286);
    }
    int _3288 = _2882;
    float _3290 = _2768 * _3140;
    float _3292 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3284);
    if (!_3038)
    {
        int _3294 = _3288 << 4;
        int _3296 = _3294 + _3238;
        _3226 = _3296;
    }
    int _3298 = _3226;
    float _3300 = fma(_3280, -0.5, 0.5);
    float _3302 = fma(_897, _3132, _3290);
    float _3304 = fma(_3280, 0.5, 0.5);
    float _3306 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3292);
    float _3308 = _3202;
    if (!_3038)
    {
        int _3310 = _3298 + 400;
        uint _3312 = uint(int(uint(_3310) >> uint(2)));
        uint _3314 = uint(int(uint(int(_3312)) >> uint(2)));
        int _3316 = int(_3312) & 3;
        float _3318 = (*spvDescriptorSet0.vp_c15)._m0[int(_3314)][_3316];
        _3308 = _3318;
    }
    float _3320 = _3308;
    float _3322 = fma(_899, _3176, _3282);
    float _3324 = sqrt(_3300);
    float _3326 = _3248 * _3276;
    float _3328 = _3322 + _3184;
    float _3330 = _2744 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _3332 = _3326 >= 0.0;
    float _3334 = fma(_899, _3212, _3302);
    float _3336 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3330);
    float _3338 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3258);
    bool _3340 = _3326 <= 1.0;
    bool _3342 = _3340 && _3332;
    float _3344 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3346 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3336);
    float _3348 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3338);
    float _3350 = fma(_3304, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3352 = exp2(_3344);
    float _3354 = _3346 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3356 = _3328 * _3276;
    float _3358 = _3348 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3360 = fma(_3304, _3350, -0.212114393711090087890625);
    float _3362 = _3334 + _3220;
    float _3364 = _3244 + 1.0;
    float _3366 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3368 = _3356 >= 0.0;
    bool _3370 = _3368 && _3342;
    float _3372 = log2(_3148);
    float _3374 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3376 = fma(_3354, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3366);
    bool _3378 = _3356 <= 1.0;
    bool _3380 = _3378 && _3370;
    float _3382 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3384 = _3324 * 0.636619746685028076171875;
    float _3386 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3376);
    float _3388 = -_3244;
    float _3390 = fma(_3352, _3364, _3388);
    float _3392 = as_type<float>(_3288);
    float _3394 = _3384;
    if (!_3038)
    {
        float _3396 = floor(_2838);
        _3392 = _3396;
    }
    float _3398 = _3392;
    float _3400 = _3306 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3402 = fma(_3354, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3374);
    float _3404 = _3362 * _3276;
    float _3406 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3386);
    float _3408 = fma(_3304, _3360, 1.570728778839111328125);
    float _3410 = fma(_3354, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3382);
    float _3412 = _3406;
    if (_3380)
    {
        float _3414 = float(_2910);
        _2914 = _3414;
    }
    float _3416 = _2914;
    float _3418 = 1.0 / _3406;
    float _3420 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3402);
    float _3422 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3410);
    float _3424 = _3372 * 0.693147182464599609375;
    float _3426 = -_3408;
    float _3428 = fma(_3384, _3426, 1.0);
    float _3430 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3420);
    float _3432 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3422);
    float2 _9140 = float2(_2876, _3144);
    float _3434 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9140, float2(0.0), isnan(_9140)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9140, float2(0.0), isnan(_9140)), level(0.0)).x;
    float _3436 = _3410;
    float _3438 = _3432;
    if (_3380)
    {
        float _3440 = rint(_3416);
        float _3442 = precise::max(_3440, 0.0);
        uint _3444 = uint(_3442);
        uint _3446 = clamp(_3444, 0u, 65535u);
        _3436 = as_type<float>(_3446);
    }
    float _3448 = _3436;
    if (!_3038)
    {
        float _3450 = -_3398;
        float _3452 = _2838 + _3450;
        _3394 = _3452;
    }
    float _3454 = _3394;
    float _3456 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3458 = fma(_3390, 0.5, 0.5);
    float _3460 = _3430 * _3418;
    float _3462 = _3432 * _3418;
    float _3464 = _3276;
    if (!_3038)
    {
        float _3466 = rint(_3320);
        float _3468 = precise::max(_3466, 0.0);
        uint _3470 = uint(_3468);
        uint _3472 = clamp(_3470, 0u, 65535u);
        _3464 = as_type<float>(_3472);
    }
    float _3474 = _3464;
    float _3476 = fma(_3460, 0.5, 0.5);
    float _3478 = fma(_3462, -0.5, 0.5);
    float _3480 = _3448;
    if (_3380)
    {
        float3 _9215 = float3(_3326, _3356, float(as_type<int>(_3448)));
        float3 _9219 = select(_9215, float3(0.0), isnan(_9215));
        float _3482 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9219.xy, uint(rint(_9219.z)), _3404, level(0.0));
        _3480 = _3482;
    }
    float _3484 = _3480;
    float3 _9229 = float3(_3476, _3478, _3456);
    float _3486 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9229, float3(0.0), isnan(_9229)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9229, float3(0.0), isnan(_9229)), level(0.0)).x;
    float3 _9238 = float3(_3476, _3478, _3456);
    float4 _3489 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9238, float3(0.0), isnan(_9238)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9238, float3(0.0), isnan(_9238)), level(0.0)).xyzw;
    float _3491 = _3489.x;
    float _3493 = _3489.y;
    float _3495 = _3489.z;
    float _3497 = _3489.w;
    float2 _9254 = float2(_3428, _3458);
    float3 _3499 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9254, float2(0.0), isnan(_9254)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9254, float2(0.0), isnan(_9254)), level(0.0)).xyz;
    float _3501 = _3499.x;
    float _3503 = _3499.y;
    float _3505 = _3499.z;
    float _3507 = _3474;
    if (!_3038)
    {
        float3 _9275 = float3(_3454, _3274, float(as_type<int>(_3474)));
        float3 _9277 = select(_9275, float3(0.0), isnan(_9275));
        float _3509 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9277.xy, uint(rint(_9277.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9277.xy, uint(rint(_9277.z)), level(0.0)).x;
        _3507 = _3509;
    }
    float _3511 = _3507;
    float _3513 = abs(_2856);
    float _3515 = log2(_3513);
    float _3517 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3519 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3521 = fma(_3354, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3517);
    float _3523 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3521);
    float _3525 = exp2(_3519);
    bool _3527 = _2856 <= 8000.0;
    bool _3529 = isnan(_2856);
    bool _3531 = _3527 || _3529;
    bool _3533 = isnan(8000.0);
    bool _3535 = _3531 || _3533;
    float _3537 = float(_3535);
    float _3539 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3523);
    float _3541 = _3515 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3430;
    out.gl_Position.y = _3432;
    out.gl_Position.z = _3539;
    out.gl_Position.w = _3406;
    float _3543 = exp2(_3541);
    float _3545 = fma(_3543, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3547 = precise::clamp(_3545, 0.0, 1.0);
    float _3549 = fma(_3547, -2.0, 3.0);
    float _3551 = _3547 * _3547;
    float _3553 = _3551 * _3549;
    float _3555 = -_3553;
    float _3557 = _3555 + 1.0;
    float _3559 = fma(_3557, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3553);
    float _3561 = _3557;
    float _3563 = _3539;
    if (!_3380)
    {
        _3561 = 1.0;
    }
    float _3565 = _3561;
    float _3567 = _3537 * _3559;
    float _3569 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3571 = -_3525;
    float _3573 = _3571 + 1.0;
    float _3575 = -_3434;
    float _3577 = _3575 + 1.0;
    float _3579 = _3577 * _3569;
    float _3581 = precise::clamp(_3579, 0.0, 1.0);
    float _3583 = _3565;
    float _3585 = _3573;
    if (_3380)
    {
        bool _3587 = _3484 >= _3404;
        bool _3589 = isnan(_3484);
        bool _3591 = _3587 || _3589;
        bool _3593 = isnan(_3404);
        bool _3595 = _3591 || _3593;
        float _3597 = float(_3595);
        _3583 = _3597;
    }
    float _3599 = _3583;
    float _3601 = _3573 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_3038)
    {
        _3585 = 1.0;
    }
    float _3603 = _3585;
    float _3605 = _3603;
    if (!_3038)
    {
        int _3607 = _3158 << 4;
        int _3609 = _3607 + 2048;
        uint _3611 = uint(int(uint(_3609) >> uint(2)));
        uint _3613 = uint(int(uint(int(_3611)) >> uint(2)));
        int _3615 = int(_3611) & 3;
        float _3617 = (*spvDescriptorSet0.vp_c15)._m0[int(_3613)][_3615];
        int _3619 = int(_3611) + 1;
        uint _3621 = uint(int(uint(_3619) >> uint(2)));
        int _3623 = _3619 & 3;
        float _3625 = (*spvDescriptorSet0.vp_c15)._m0[int(_3621)][_3623];
        int _3627 = _3609 + 8;
        uint _3629 = uint(int(uint(_3627) >> uint(2)));
        uint _3631 = uint(int(uint(int(_3629)) >> uint(2)));
        int _3633 = int(_3629) & 3;
        float _3635 = (*spvDescriptorSet0.vp_c15)._m0[int(_3631)][_3633];
        int _3637 = int(_3629) + 1;
        uint _3639 = uint(int(uint(_3637) >> uint(2)));
        int _3641 = _3637 & 3;
        float _3643 = (*spvDescriptorSet0.vp_c15)._m0[int(_3639)][_3641];
        float _3645 = _2768 * _3625;
        float _3647 = fma(_897, _3617, _3645);
        float _3649 = fma(_899, _3635, _3647);
        float _3651 = _3649 + _3643;
        float _3653 = precise::clamp(_3651, 0.0, 1.0);
        float _3655 = -_3653;
        float _3657 = _3655 + _3511;
        float _3659 = fma(_3657, 500.0, 1.5);
        float _3661 = exp2(_3659);
        float _3663 = 0.0 + _3661;
        float _3665 = precise::clamp(_3663, 0.0, 1.0);
        _3605 = _3665;
        _3438 = _3643;
    }
    float _3667 = _3605;
    float _3669 = _3438;
    float _3671 = _3599 * _3667;
    float _3673 = _3601 * _3486;
    float _3675 = -_3581;
    float _3677 = fma(_3675, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3679 = -_3601;
    float _3681 = _3679 + 1.0;
    bool _3683 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3685 = isnan(_2780);
    bool _3687 = _3683 || _3685;
    bool _3689 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3691 = _3687 || _3689;
    float _3693 = _3497 * _3673;
    float _3695 = -_3671;
    float _3697 = fma(_3695, _3677, 1.0);
    float _3699 = precise::clamp(_3697, 0.0, 1.0);
    float _3701 = _3505 * _3673;
    float _3703 = _3497 * _3681;
    float _3705 = fma(_3501, _3693, _3491);
    float _3707 = fma(_3503, _3693, _3493);
    float _3709 = _3699 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3711 = fma(_3497, _3701, _3495);
    out.m_96.x = _3709;
    float _3713 = _3669;
    float _3715 = _3693;
    float _3717 = _3677;
    float _3719 = _3699;
    if (!_3691)
    {
        _3412 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3721 = _3412;
    float _3723 = _3721;
    float _3725 = _3721;
    if (!_3691)
    {
        _3563 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3727 = _3563;
    out.m_98.x = _3705;
    out.m_98.y = _3707;
    out.m_98.z = _3711;
    out.m_98.w = _3703;
    float _3729 = _3727;
    float _3731 = _3727;
    if (!_3691)
    {
        _3713 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3733 = _3713;
    float _3735 = _3733;
    float _3737 = _3733;
    if (!_3691)
    {
        _3715 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3739 = _3715;
    float _3741 = _3739;
    float _3743 = _3739;
    if (!_3691)
    {
        _3717 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3745 = _3717;
    float _3747 = _3745;
    float _3749 = _3745;
    if (!_3691)
    {
        _3719 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3751 = _3719;
    bool _3753 = !_3691;
    float _3755 = _3751;
    float _3757 = _3751;
    if (!_3753)
    {
        bool _3759 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3761 = isnan(_2780);
        bool _3763 = _3759 || _3761;
        bool _3765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3767 = _3763 || _3765;
        if (!_3767)
        {
            float _3769 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3771 = _2780 + _3769;
            float _3773 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3775 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3773;
            float _3777 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3779 = _3777 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3781 = 1.0 / _3775;
            float _3783 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3785 = _3783 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3787 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3789 = _3787 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3793 = _3791 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3799 = _3771 * _3781;
            float _3801 = precise::clamp(_3799, 0.0, 1.0);
            float _3803 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3805 = _3803 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3807 = fma(_3801, _3779, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3809 = fma(_3801, _3805, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3811 = fma(_3801, _3785, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3813 = fma(_3801, _3789, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3815 = fma(_3801, _3793, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3817 = fma(_3801, _3797, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3731 = _3811;
            _3749 = _3815;
            _3725 = _3807;
            _3743 = _3813;
            _3737 = _3809;
            _3757 = _3817;
            _3819 = true;
        }
        else
        {
            bool _3821 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3823 = isnan(_2780);
            bool _3825 = _3821 || _3823;
            bool _3827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3829 = _3825 || _3827;
            if (!_3829)
            {
                _3723 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3831 = _3723;
            _3725 = _3831;
            if (!_3829)
            {
                _3729 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3833 = _3729;
            _3731 = _3833;
            if (!_3829)
            {
                _3735 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3835 = _3735;
            _3737 = _3835;
            if (!_3829)
            {
                _3741 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3837 = _3741;
            _3743 = _3837;
            if (!_3829)
            {
                _3747 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3839 = _3747;
            _3749 = _3839;
            if (!_3829)
            {
                _3755 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3841 = _3755;
            bool _3843 = !_3829;
            _3757 = _3841;
            if (!_3843)
            {
                bool _3845 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3847 = isnan(_2780);
                bool _3849 = _3845 || _3847;
                bool _3851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3853 = _3849 || _3851;
                if (!_3853)
                {
                    float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3857 = _2780 + _3855;
                    float _3859 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3861 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3859;
                    float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3867 = 1.0 / _3861;
                    float _3869 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3885 = _3857 * _3867;
                    float _3887 = precise::clamp(_3885, 0.0, 1.0);
                    float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3893 = fma(_3887, _3865, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3895 = fma(_3887, _3891, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3897 = fma(_3887, _3871, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3899 = fma(_3887, _3875, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3901 = fma(_3887, _3879, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3903 = fma(_3887, _3883, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3731 = _3897;
                    _3749 = _3901;
                    _3725 = _3893;
                    _3743 = _3899;
                    _3737 = _3895;
                    _3757 = _3903;
                    _3819 = true;
                }
                else
                {
                    _3731 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3749 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3725 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3743 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3737 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3757 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3819 = false;
    float _3905 = _3731;
    float _3907 = _3749;
    float _3909 = _3725;
    float _3911 = _3743;
    float _3913 = _3737;
    float _3915 = _3757;
    float _3917 = fma(_2646, -0.5, 0.5);
    float _3919 = precise::clamp(_3917, 0.0, 1.0);
    float _3921 = -_3905;
    float _3923 = _3921 + _3907;
    float _3925 = -_3909;
    float _3927 = _3925 + _3911;
    float _3929 = -_3913;
    float _3931 = _3929 + _3915;
    bool _3933 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3935 = fma(_3919, _3923, _3905);
    float _3937 = fma(_3919, _3927, _3909);
    float _3939 = fma(_3919, _3931, _3913);
    float _3941 = _3935 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _3943 = fma(_3937, 0.298911988735198974609375, _3941);
    float _3945 = fma(_3939, 0.114477999508380889892578125, _3943);
    out.m_100.x = 0.0;
    float _3947 = -_3945;
    float _3949 = _3937 + _3947;
    float _3951 = -_3945;
    float _3953 = _3935 + _3951;
    float _3955 = -_3945;
    float _3957 = _3939 + _3955;
    float _3959 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3961 = fma(_3949, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    float _3963 = fma(_3953, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    float _3965 = fma(_3957, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    out.m_96.w = _3959;
    out.m_102.x = _3961;
    out.m_102.y = _3963;
    out.m_102.z = _3965;
    if (!_3933)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3967 = -_2744;
    float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3971 = -_2746;
    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3975 = -_2748;
    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3979 = _3969 * _3969;
    float _3981 = fma(_3973, _3973, _3979);
    float _3983 = fma(_3977, _3977, _3981);
    float _3985 = sqrt(_3983);
    float _3987 = rsqrt(_3983);
    float _3989 = -_3985;
    float _3991 = _3989 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3993 = _3991 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3995 = precise::clamp(_3993, 0.0, 1.0);
    float _3997 = _3973 * _3987;
    float _3999 = _3969 * _3987;
    float _4001 = abs(_3995);
    float _4003 = log2(_4001);
    float _4005 = _3977 * _3987;
    float _4007 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4009 = _2646 * _3999;
    float _4011 = -_3999;
    float _4013 = -_4007;
    float _4015 = fma(_4011, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4013);
    float _4017 = fma(_2640, _3997, _4009);
    float _4019 = -_4005;
    float _4021 = fma(_4019, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4015);
    float _4023 = fma(_2648, _4005, _4017);
    float _4025 = precise::clamp(_4023, 0.0, 1.0);
    float _4027 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4029 = _4021 + _4027;
    float _4031 = _4003 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4033 = _4029 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4035 = precise::clamp(_4033, 0.0, 1.0);
    float _4037 = exp2(_4031);
    float _4039 = _4037 * _4035;
    float _4041 = _4025 * _4039;
    float _4043 = _4041 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4045 = _4041 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4047 = _4041 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_100.x = _4043;
    out.m_100.y = _4045;
    out.m_100.z = _4047;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3819 = false;
    bool _2700 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_60.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_121);
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _127;
    float _133 = _131;
    if (!_125)
    {
        out.m_63.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4106 = as_type<float>(_139);
        out.gl_Position.z = _4106;
    }
    if (!_125)
    {
        return out;
    }
    float _143 = in.m_65.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_121);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4176 = as_type<float>(_177);
        out.gl_Position.z = _4176;
    }
    if (_169)
    {
        return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _217;
    if (!_199)
    {
        float _201 = in.m_70.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        float _221 = float(_121);
        float _223 = 1.0 / _221;
        float _225 = _157 * _223;
        _217 = _225;
    }
    _219 = false;
    float _227 = _217;
    float _229 = in.m_70.x;
    float _231 = in.m_70.y;
    float _233 = in.m_70.z;
    float _235 = in.m_70.w;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _239 = _227 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _251 = 1.0 / _243;
    int _253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _255 = _253 != 0;
    float _257 = 1.0 / _247;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _263;
    float _267 = float(_121);
    float _269 = _229 * 2.0;
    float _271 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _273 = _231 * 2.0;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _227 + _275;
    float _279 = floor(_269);
    float _281 = -_249;
    float _283 = fma(_271, 2.0, _281);
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _287 = _277 * _251;
    float _289 = _229 + _231;
    float _291 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _293 = _239 * _257;
    float _295 = _289 + (-1.0);
    float _297 = _233 * 2.0;
    float _299 = _233 + _231;
    float _301 = floor(_273);
    float _303 = fma(_291, -2.0, _285);
    float _305 = _233 + _229;
    float _307 = _299 + (-1.0);
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _311 = _279 >= 0.0;
    bool _313 = isnan(_279);
    bool _315 = _311 || _313;
    bool _317 = isnan(0.0);
    bool _319 = _315 || _317;
    float _321 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _323 = floor(_297);
    int _325 = as_type<int>(_307);
    if (_255)
    {
        _325 = 0;
    }
    int _327 = _325;
    float _329 = _305 + (-1.0);
    int _331 = _327;
    if (!_255)
    {
        _331 = 1;
    }
    int _333 = _331;
    float _335 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _337 = _279 > 0.0;
    float _339 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _341 = fma(_261, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _345 = int(_343);
    bool _347 = _301 >= 0.0;
    bool _349 = isnan(_301);
    bool _351 = _347 || _349;
    bool _353 = isnan(0.0);
    bool _355 = _351 || _353;
    float _357 = fma(_265, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _359 = _301 > 0.0;
    float _361 = _229 + (-0.5);
    int _363 = _355 ? 0 : 1;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _371 = int(_369);
    bool _373 = _323 > 0.0;
    bool _375 = _323 >= 0.0;
    bool _377 = isnan(_323);
    bool _379 = _375 || _377;
    bool _381 = isnan(0.0);
    bool _383 = _379 || _381;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _387 = _319 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _389 = _333 != 1;
    float _391 = 1.0 / _267;
    int _393 = _383 ? 0 : 1;
    int _395 = ~as_type<int>(_387);
    int _397 = _395 + 1;
    int _399 = _397 + 1;
    int _401 = _399;
    float _403 = _387;
    float _405 = _301;
    if (!_337)
    {
        int _407 = ~as_type<int>(_387);
        int _409 = _407 + 1;
        _401 = _409;
    }
    int _411 = _401;
    int _413 = ~_393;
    int _415 = _413 + 1;
    int _417 = _415 + 1;
    int _419 = _417;
    if (!_373)
    {
        int _421 = ~_393;
        int _423 = _421 + 1;
        _419 = _423;
    }
    int _425 = _419;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _429 = _427 != 0;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _437 = _435 != 0;
    float _439 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _441 = log2(_439);
    if (!_389)
    {
        _403 = _231;
    }
    float _443 = _403;
    float _445 = _443;
    if (_389)
    {
        _445 = _229;
    }
    float _447 = _445;
    float _449 = _391 * _157;
    bool _451 = !_433;
    int _453 = _451 ? 0 : 1;
    bool _455 = !_437;
    int _457 = _455 ? 0 : 1;
    float _459 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[83].z, _309);
    bool _461 = !_429;
    int _463 = _461 ? 0 : 1;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _475 = _473 != 0;
    float _477 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _459);
    if (!_389)
    {
        _129 = _231;
    }
    float _479 = _129;
    int _481 = ~_363;
    int _483 = _481 + 1;
    int _485 = _483 + 1;
    float _487 = _479;
    int _489 = _485;
    if (_389)
    {
        _487 = _229;
    }
    float _491 = _487;
    if (!_359)
    {
        int _493 = ~_363;
        int _495 = _493 + 1;
        _489 = _495;
    }
    int _497 = _489;
    float _499 = float(_345);
    float _501 = _491 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _503 = !_467;
    int _505 = _503 ? 0 : 1;
    float _507 = 1.0 / _499;
    float _509 = -_385;
    float _511 = fma(_501, 2.0, _509);
    float _513 = float(_411);
    float _515 = _441 * _157;
    float _517 = _501;
    if (!_389)
    {
        _405 = _233;
    }
    float _519 = _405;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _523 = float(_497);
    int _525 = abs(_505);
    float _527 = exp2(_515);
    float _529 = _519;
    if (_389)
    {
        _529 = _231;
    }
    float _531 = _529;
    float _533 = float(_371);
    if (!_389)
    {
        _517 = _233;
    }
    float _535 = _517;
    float _537 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[83].w, _521);
    float _539 = float(_525);
    float _541 = 1.0 / _533;
    float _543 = float(_425);
    float _545 = -_157;
    float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[76].x, _283);
    float _549 = _507 * _157;
    float _551 = _535;
    if (_389)
    {
        _551 = _231;
    }
    float _553 = _551;
    float _555 = _539 * _543;
    bool _557 = !_471;
    int _559 = _557 ? 0 : 1;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _563 = in.m_72.x;
    float _565 = in.m_72.y;
    float _567 = in.m_72.z;
    float _569 = _553 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _571 = !_475;
    int _573 = _571 ? 0 : 1;
    float _575 = _555 * (-2.0);
    int _577 = abs(_559);
    float _579 = fma(_569, -2.0, _561);
    float _581 = _541 * _157;
    float _583 = fma(_335, _575, _335);
    int _585 = abs(_573);
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _589 = float(_577);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _593 = 1.0 + _591;
    float _595 = float(_585);
    bool _597 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _605 = _601 || _603;
    float _607 = _589 * _513;
    float _609 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].z, _587);
    float _611 = 1.0 / _593;
    float _613 = _595 * _523;
    float _615 = -_527;
    float _617 = _615 + 1.0;
    float _619 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _303);
    bool _621 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _623 = isnan(1.0);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _629 = _625 || _627;
    float _631 = fma(_575, _563, _563);
    float _633 = _605 ? _617 : 0.0;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _637 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _537);
    float _639 = -_157;
    float _641 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[81].x, _511);
    float _643 = _607 * (-2.0);
    float _645 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].w, _635);
    float _647 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[196].x, _631);
    float _649 = _613 * (-2.0);
    float _651 = fma(_321, _643, _321);
    float _653 = fma(_643, _565, _565);
    float _655 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _609);
    float _657 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _645);
    float _659 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _579);
    float _661 = _231 + (-0.5);
    bool _663 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _665 = isnan(_227);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    if (_629)
    {
        float _675 = _633 * _611;
        _159 = _675;
    }
    float _677 = _159;
    float _679 = fma(_649, _567, _567);
    float _681 = fma(_339, _649, _339);
    float _683 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[196].y, _653);
    bool _685 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _687 = isnan(_227);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = fma(_583, _677, _647);
    float _699 = -_673;
    float _701 = _699 + 1.0;
    float _703 = fma(_651, _677, _683);
    bool _705 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _707 = isnan(_227);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = _697 * 0.15915493667125701904296875;
    float _719 = _695 * _701;
    float _721 = -_695;
    float _723 = _721 + 1.0;
    float _725 = in.m_74.x;
    float _727 = in.m_74.y;
    float _729 = _703 * 0.15915493667125701904296875;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _735 = _715 * _723;
    float _737 = _233 + (-0.5);
    float _739 = -_715;
    float _741 = _739 + 1.0;
    float _743 = fma(_733, _293, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _745 = _357 * _735;
    float _747 = _341 * _735;
    float _749 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[196].z, _679);
    float _751 = in.m_76.x;
    float _753 = in.m_76.y;
    float _755 = in.m_76.z;
    float _757 = fma(_367, _293, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _759 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[143].y, _745);
    float _761 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[143].x, _747);
    float _763 = in.m_60.x;
    float _765 = in.m_60.y;
    float _767 = in.m_60.z;
    float _769 = fma(_681, _677, _749);
    float _771 = fma(_757, _719, _759);
    float _773 = fma(_743, _719, _761);
    float _775 = _717 * 6.283185482025146484375;
    float _777 = cos(_775);
    float _779 = _769 * 0.15915493667125701904296875;
    float _781 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[145].y, _771);
    float _783 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[145].x, _773);
    float _785 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _787 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _789 = _781 * _727;
    float _791 = _783 * _725;
    float _793 = _729 * 6.283185482025146484375;
    float _795 = sin(_793);
    float _797 = _789 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _799 = _791 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _801 = in.m_78.x;
    float _803 = in.m_78.y;
    float _805 = in.m_78.z;
    float _807 = _797 * _787;
    float _809 = _799 * _785;
    float _811 = _729 * 6.283185482025146484375;
    float _813 = cos(_811);
    float _815 = _765 * _753;
    float _817 = _717 * 6.283185482025146484375;
    float _819 = sin(_817);
    float _821 = fma(_763, _751, _815);
    float _823 = fma(_767, _755, _821);
    float _825 = _779 * 6.283185482025146484375;
    float _827 = cos(_825);
    float _829 = _777 * _813;
    float _831 = _779 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _819 * _795;
    float _837 = _819 * _813;
    float _839 = _813 * _827;
    float _841 = _777 * _795;
    float _843 = _777 * _827;
    float _845 = _819 * _827;
    float _847 = _795 * _827;
    float _849 = _843 * _807;
    float _851 = _845 * _807;
    float _853 = fma(_833, _829, _835);
    float _855 = -_841;
    float _857 = fma(_833, _837, _855);
    float _859 = -_837;
    float _861 = fma(_833, _841, _859);
    float _863 = -_807;
    float _865 = _833 * _863;
    float _867 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _869 = fma(_853, _809, _849);
    float _871 = fma(_833, _835, _829);
    float _873 = fma(_839, _809, _865);
    float _875 = _765 * _803;
    float _877 = fma(_861, _867, _869);
    float _879 = fma(_857, _809, _851);
    float _881 = fma(_847, _867, _873);
    float _883 = fma(_763, _801, _875);
    float _885 = _877 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _887 = _877 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _889 = fma(_871, _867, _879);
    float _891 = fma(_767, _805, _883);
    float _893 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].x, _885);
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _887);
    float _897 = _823 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _899 = _891 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _901 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].z, _893);
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].z, _895);
    float _905 = _901 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _907 = _903 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _909 = _897 + _905;
    float _911 = _899 + _907;
    float _913 = in.m_80.x;
    float _915 = in.m_80.y;
    float _917 = in.m_80.z;
    float _919 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _921 = _909 + _919;
    float _923 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _925 = _911 + _923;
    float _927 = _921 * _921;
    float _929 = _925 * _925;
    float _931 = _927 + _929;
    float _933 = sqrt(_931);
    float _935 = _765 * _915;
    float _937 = fma(_763, _913, _935);
    bool _939 = _933 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _941 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _943 = _933 + _941;
    float _945 = fma(_767, _917, _937);
    float _947 = _851;
    float _949 = _931;
    float _951 = _943;
    float _953 = _877;
    float _955 = _765;
    float _957 = _909;
    float _959 = _911;
    float _961 = _927;
    float _963 = _929;
    if (_939)
    {
        float _965 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _947 = _965;
    }
    float _967 = _947;
    if (_939)
    {
        float _969 = rsqrt(_931);
        _949 = _969;
    }
    float _971 = _949;
    float _973 = _971;
    if (_939)
    {
        float _975 = _943 * _967;
        _951 = _975;
    }
    float _977 = _951;
    float _979 = _877 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_939)
    {
        float _981 = _977 * 0.15915493667125701904296875;
        _953 = _981;
    }
    float _983 = _953;
    float _985 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _979);
    float _987 = _945 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _989 = _763;
    if (_939)
    {
        float _991 = _983 * 6.283185482025146484375;
        float _993 = sin(_991);
        _989 = _993;
    }
    float _995 = _989;
    float _997 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].z, _985);
    float _999 = _997 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1001 = _987 + _999;
    float _1003 = _1001;
    if (_939)
    {
        float _1005 = _1001 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _955 = _1005;
    }
    float _1007 = _955;
    float _1009 = _995;
    if (_939)
    {
        float _1011 = fma(_995, _1007, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1009 = _1011;
    }
    float _1013 = _1009;
    float _1015 = _1013;
    if (_939)
    {
        float _1017 = _971 * _1013;
        _1015 = _1017;
    }
    float _1019 = _1015;
    if (_939)
    {
        float _1021 = fma(_921, _1019, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _957 = _1021;
    }
    float _1023 = _957;
    float _1025 = _1023;
    if (_939)
    {
        float _1027 = fma(_925, _1019, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _959 = _1027;
    }
    float _1029 = _959;
    float _1031 = fma(_1023, 6.2500002968590706586837768554688e-05, 0.5);
    float _1033 = fma(_1029, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5493 = float2(_1031, _1033);
    float3 _1037 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5493, float2(0.0), isnan(_5493)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5493, float2(0.0), isnan(_5493)), level(0.0)).xyz;
    float _1039 = _1037.x;
    float _1041 = _1037.y;
    float _1043 = _1037.z;
    float _1045 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1047 = int(_1045);
    float _1049 = _1029;
    if (_255)
    {
        float _1051 = in.m_70.x;
        _973 = _1051;
    }
    float _1053 = _973;
    float _1055 = 0.0;
    if (_255)
    {
        _1055 = 1.0;
    }
    float _1057 = _1055;
    float _1059 = -_477;
    float _1061 = _1059 + 1.0;
    float _1063 = _1057;
    if (!_255)
    {
        _1063 = 1.2345600128173828125;
    }
    float _1065 = _1063;
    float _1067 = _1053;
    if (!_255)
    {
        float _1069 = in.m_70.y;
        _1067 = _1069;
    }
    float _1071 = _1067;
    int _1073 = abs(_453);
    float _1075 = -_655;
    float _1077 = _1075 + 1.0;
    float _1079 = trunc(_549);
    int _1081 = int(_1079);
    float _1083 = -_657;
    float _1085 = _1083 + 1.0;
    float _1087 = -_637;
    float _1089 = _1087 + 1.0;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1093 = float(uint(_1047));
    float _1095 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1097 = int(_1095);
    int _1099 = ~_1047;
    int _1101 = _1099 + 1;
    float _1103 = float(_1047);
    bool _1105 = _1047 == 0;
    float _1107 = float(uint(_1081));
    float _1109 = 1.0 / _1093;
    float _1111 = float(_1081);
    float _1113 = _1065 * _1071;
    float _1115 = float(uint(_1097));
    float _1117 = trunc(_581);
    int _1119 = int(_1117);
    int _1121 = ~_1097;
    int _1123 = _1121 + 1;
    bool _1125 = _1097 == 0;
    int _1127 = as_type<int>(_1109) + (-2);
    float _1129 = 1.0 / _1115;
    float _1131 = _1109;
    float _1133 = _1089;
    if (_255)
    {
        _1131 = 1.0;
    }
    float _1135 = _1131;
    float _1137 = _1135;
    if (!_255)
    {
        _1137 = 7.345489978790283203125;
    }
    float _1139 = _1137;
    float _1141 = as_type<float>(_1127) * _1107;
    int _1143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1145 = _1143 != 0;
    float _1147 = trunc(_1141);
    float _1149 = precise::max(_1147, 0.0);
    uint _1152 = uint(_1149);
    float _1154 = _1139 * _229;
    int _1156 = as_type<int>(_1129) + (-2);
    float _1158 = float(uint(_1119));
    int _1160 = _1101 * int(_1152);
    int _1162 = _1160 + _1081;
    float _1164 = as_type<float>(_1156) * _1158;
    bool _1166 = _1111 >= _1103;
    bool _1168 = isnan(_1111);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan(_1103);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    int _1178 = ~_1047;
    int _1180 = _1178 + 1;
    float _1182 = float(uint(_1162));
    float _1184 = trunc(_1164);
    float _1186 = precise::max(_1184, 0.0);
    uint _1188 = uint(_1186);
    float _1190 = as_type<float>(_1127) * _1182;
    float _1192 = floor(_1154);
    float _1194 = trunc(_1190);
    float _1196 = precise::max(_1194, 0.0);
    uint _1198 = uint(_1196);
    float _1200 = -_1192;
    float _1202 = _1154 + _1200;
    float _1204 = trunc(_1176);
    int _1206 = int(_1204);
    float _1208 = _1202 * _1103;
    int _1210 = _1123 * int(_1188);
    int _1212 = _1210 + _1119;
    float _1214 = _1103 * _449;
    int _1216 = int(_1152) + int(_1198);
    float _1218 = trunc(_1208);
    int _1220 = int(_1218);
    float _1222 = float(uint(_1212));
    int _1224 = _1180 * _1216;
    int _1226 = _1224 + _1081;
    float _1228 = as_type<float>(_1156) * _1222;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1232 = _1230 != 0;
    float _1234 = trunc(_1214);
    int _1236 = int(_1234);
    bool _1238 = uint(_1226) >= uint(_1047);
    bool _1240 = !_1232;
    int _1242 = _1240 ? 0 : 1;
    bool _1244 = !_1238;
    int _1246 = _1244 ? 0 : (-1);
    int _1248 = abs(_1242);
    float _1250 = trunc(_1228);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    int _1256 = ~_1216;
    int _1258 = _1256 + _1246;
    int _1260 = _1258 + 1;
    int _1262 = ~_1206;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    int _1268 = ~_1097;
    int _1270 = _1268 + 1;
    int _1272 = _1047 * _1260;
    int _1274 = _1272 + _1081;
    int _1276 = _1220 * _1248;
    int _1278 = _1276 + _1081;
    bool _1280 = !_1105;
    int _1282 = _1280 ? _1274 : (-1);
    int _1284 = int(_1188) + int(_1254);
    int _1286 = _1282 * _1266;
    int _1288 = _1047 + (-1);
    float _1290 = floor(_1113);
    int _1292 = _1270 * _1284;
    int _1294 = _1292 + _1119;
    float _1296 = float(_1119);
    int _1298 = _1206 * _1288;
    int _1300 = _1298 + _1286;
    float _1302 = float(_1097);
    int _1304 = abs(_463);
    int _1306 = _1300 * _1073;
    bool _1308 = _1296 >= _1302;
    bool _1310 = isnan(_1296);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan(_1302);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    int _1320 = abs(_457);
    bool _1322 = uint(_1294) >= uint(_1097);
    float _1324 = trunc(_1318);
    int _1326 = int(_1324);
    bool _1328 = !_1322;
    int _1330 = _1328 ? 0 : (-1);
    int _1332 = _1236 * _1304;
    int _1334 = _1332 + _1306;
    bool _1336 = !_1145;
    int _1338 = _1336 ? 0 : 1;
    float _1340 = -_1290;
    float _1342 = _1113 + _1340;
    int _1344 = ~_1284;
    int _1346 = _1344 + _1330;
    int _1348 = _1346 + 1;
    int _1350 = _1278 * _1320;
    int _1352 = _1350 + _1334;
    int _1354 = abs(_1338);
    float _1356 = _1342 * _1302;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1360 = _1358 != 0;
    int _1362 = _1097 * _1348;
    int _1364 = _1362 + _1119;
    float _1366 = _1302 * _449;
    bool _1368 = !_1360;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = trunc(_1356);
    int _1374 = int(_1372);
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1378 = _1376 != 0;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1382 = _1380 != 0;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1386 = _1384 != 0;
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1390 = _1388 != 0;
    int _1392 = _1220 * _1354;
    int _1394 = _1392 + _1352;
    int _1396 = ~_1326;
    int _1398 = _1396 + 1;
    int _1400 = _1398 + 1;
    bool _1402 = !_1125;
    int _1404 = _1402 ? _1364 : (-1);
    bool _1406 = !_1382;
    int _1408 = _1406 ? 0 : 1;
    float _1410 = trunc(_1366);
    int _1412 = int(_1410);
    float _1414 = float(uint(_1394));
    int _1416 = _1404 * _1400;
    int _1418 = abs(_1370);
    int _1420 = _1097 + (-1);
    float _1422 = as_type<float>(_1127) * _1414;
    bool _1424 = !_1378;
    int _1426 = _1424 ? 0 : 1;
    int _1428 = abs(_1408);
    int _1430 = _1326 * _1420;
    int _1432 = _1430 + _1416;
    int _1434 = abs(_1426);
    float _1436 = trunc(_1422);
    float _1438 = precise::max(_1436, 0.0);
    uint _1440 = uint(_1438);
    int _1442 = _1374 * _1418;
    int _1444 = _1442 + _1119;
    bool _1446 = !_1386;
    int _1448 = _1446 ? 0 : 1;
    int _1450 = _1432 * _1428;
    int _1452 = ~_1047;
    int _1454 = _1452 + 1;
    float _1456 = float(uint(_1278));
    int _1458 = _1412 * _1434;
    int _1460 = _1458 + _1450;
    bool _1462 = !_1390;
    int _1464 = _1462 ? 0 : 1;
    int _1466 = abs(_1448);
    float _1468 = as_type<float>(_1127) * _1456;
    int _1470 = abs(_1464);
    int _1472 = _1444 * _1466;
    int _1474 = _1472 + _1460;
    float _1476 = trunc(_1468);
    float _1478 = precise::max(_1476, 0.0);
    uint _1480 = uint(_1478);
    int _1482 = _1454 * int(_1440);
    int _1484 = _1482 + _1394;
    float _1486 = float(uint(_1444));
    int _1488 = _1374 * _1470;
    int _1490 = _1488 + _1474;
    int _1492 = ~_1097;
    int _1494 = _1492 + 1;
    float _1496 = float(uint(_1484));
    float _1498 = as_type<float>(_1156) * _1486;
    float _1500 = float(uint(_1490));
    int _1502 = ~_1047;
    int _1504 = _1502 + 1;
    float _1506 = trunc(_1498);
    float _1508 = precise::max(_1506, 0.0);
    uint _1510 = uint(_1508);
    float _1512 = as_type<float>(_1127) * _1496;
    float _1514 = as_type<float>(_1156) * _1500;
    int _1516 = _1504 * int(_1480);
    int _1518 = _1516 + _1278;
    float _1520 = trunc(_1512);
    float _1522 = precise::max(_1520, 0.0);
    uint _1524 = uint(_1522);
    int _1526 = ~_1097;
    int _1528 = _1526 + 1;
    float _1530 = float(uint(_1518));
    float _1532 = trunc(_1514);
    float _1534 = precise::max(_1532, 0.0);
    uint _1536 = uint(_1534);
    int _1538 = _1494 * int(_1510);
    int _1540 = _1538 + _1444;
    float _1542 = as_type<float>(_1127) * _1530;
    int _1544 = ~_1047;
    int _1546 = _1544 + 1;
    float _1548 = float(uint(_1540));
    float _1550 = trunc(_1542);
    float _1552 = precise::max(_1550, 0.0);
    uint _1554 = uint(_1552);
    int _1556 = int(_1440) + int(_1524);
    float _1558 = as_type<float>(_1156) * _1548;
    int _1560 = _1528 * int(_1536);
    int _1562 = _1560 + _1490;
    float _1564 = trunc(_1558);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = _1546 * _1556;
    int _1572 = _1570 + _1394;
    float _1574 = float(uint(_1562));
    bool _1576 = uint(_1572) >= uint(_1047);
    int _1578 = int(_1480) + int(_1554);
    float _1580 = as_type<float>(_1156) * _1574;
    bool _1582 = !_1576;
    int _1584 = _1582 ? 0 : (-1);
    int _1586 = ~_1097;
    int _1588 = _1586 + 1;
    float _1590 = trunc(_1580);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    int _1596 = ~_1556;
    int _1598 = _1596 + _1584;
    int _1600 = _1598 + 1;
    int _1602 = int(_1510) + int(_1568);
    int _1604 = _1047 * _1600;
    int _1606 = _1604 + _1394;
    int _1608 = ~_1047;
    int _1610 = _1608 + 1;
    int _1612 = _1588 * _1602;
    int _1614 = _1612 + _1444;
    int _1616 = ~_1097;
    int _1618 = _1616 + 1;
    bool _1620 = !_1105;
    int _1622 = _1620 ? _1606 : (-1);
    int _1624 = _1610 * _1578;
    int _1626 = _1624 + _1278;
    int _1628 = _1622 & 3;
    bool _1630 = _1628 != 0;
    int _1632 = int(_1536) + int(_1594);
    int _1634 = _1622 & 3;
    bool _1636 = _1634 != 0;
    int _1638 = _1630 ? 0 : 1;
    int _1640 = _1618 * _1632;
    int _1642 = _1640 + _1490;
    bool _1644 = uint(_1634) >= 2u;
    bool _1646 = uint(_1626) >= uint(_1047);
    int _1648 = _1644 ? 0 : 1;
    bool _1650 = uint(_1642) >= uint(_1097);
    bool _1652 = uint(_1634) > 1u;
    bool _1654 = !_1646;
    int _1656 = _1654 ? 0 : (-1);
    bool _1658 = !_1650;
    int _1660 = _1658 ? 0 : (-1);
    int _1662 = ~_1578;
    int _1664 = _1662 + _1656;
    int _1666 = _1664 + 1;
    int _1668 = ~_1632;
    int _1670 = _1668 + _1660;
    int _1672 = _1670 + 1;
    bool _1674 = _235 > 0.5;
    int _1676 = _1047 * _1666;
    int _1678 = _1676 + _1278;
    int _1680 = ~_1638;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    int _1686 = _1097 * _1672;
    int _1688 = _1686 + _1490;
    int _1690 = _1684;
    if (!_1652)
    {
        int _1692 = ~_1638;
        int _1694 = _1692 + 1;
        _1690 = _1694;
    }
    int _1696 = _1690;
    float _1698 = -_197;
    int _1700 = _1674 ? as_type<int>(_1698) : as_type<int>(_197);
    int _1702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1704 = _1702 != 0;
    bool _1706 = !_1125;
    int _1708 = _1706 ? _1688 : (-1);
    bool _1710 = _1634 != 3;
    bool _1712 = !_1105;
    int _1714 = _1712 ? _1678 : (-1);
    int _1716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1718 = _1716 != 0;
    bool _1720 = !_1704;
    int _1722 = _1720 ? 0 : 1;
    int _1724 = _1622 >> 31;
    int _1726 = _1708 & 3;
    bool _1728 = _1726 != 0;
    int _1730 = _1708 >> 31;
    bool _1732 = !_1718;
    int _1734 = _1732 ? 0 : 1;
    int _1736 = _1724 & 3;
    bool _1738 = uint(_1614) >= uint(_1097);
    int _1740 = _1708 & 3;
    bool _1742 = _1740 != 0;
    bool _1744 = !_1728;
    float _1746 = _1744 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1748 = _1730 & 3;
    bool _1750 = uint(_1726) > 1u;
    int _1752 = _1622 + _1736;
    bool _1754 = !_1738;
    int _1756 = _1754 ? 0 : (-1);
    int _1758 = _1742 ? 0 : 1;
    int _1760 = _1708 + _1748;
    int _1762 = ~_1648;
    int _1764 = _1762 + 1;
    int _1766 = _1764 + 1;
    bool _1768 = _1634 != 3;
    int _1770 = _1766;
    float _1772 = _1746;
    if (_1710)
    {
        int _1774 = ~_1648;
        int _1776 = _1774 + 1;
        _1770 = _1776;
    }
    int _1778 = _1770;
    bool _1780 = !_1636;
    int _1782 = _1780 ? 0 : 1;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1786 = _1784 != 0;
    int _1788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1790 = _1788 != 0;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1794 = _1792 != 0;
    int _1796 = _1752 >> 2;
    int _1798 = ~_1602;
    int _1800 = _1798 + _1756;
    int _1802 = _1800 + 1;
    int _1804 = _1760 >> 2;
    bool _1806 = !_1768;
    int _1808 = _1806 ? 0 : (-1);
    int _1810 = _1097 * _1802;
    int _1812 = _1810 + _1444;
    bool _1814 = uint(_1726) >= 2u;
    int _1816 = _1796 << 4;
    int _1818 = _1816 + 368;
    int _1820 = _1804 << 4;
    int _1822 = _1820 + 512;
    int _1824 = ~_1758;
    int _1826 = _1824 + 1;
    int _1828 = _1826 + 1;
    uint _1830 = uint(int(uint(_1818) >> uint(2)));
    uint _1832 = uint(int(uint(int(_1830)) >> uint(2)));
    int _1834 = int(_1830) & 3;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[int(_1832)][_1834];
    int _1838 = int(_1830) + 1;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    int _1842 = _1838 & 3;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[int(_1840)][_1842];
    int _1846 = _1828;
    if (!_1750)
    {
        int _1848 = ~_1758;
        int _1850 = _1848 + 1;
        _1846 = _1850;
    }
    int _1852 = _1846;
    int _1854 = _1814 ? 0 : 1;
    bool _1856 = _1726 != 3;
    bool _1858 = _1726 != 3;
    int _1860 = _1818 + 8;
    uint _1862 = uint(int(uint(_1860) >> uint(2)));
    uint _1864 = uint(int(uint(int(_1862)) >> uint(2)));
    int _1866 = int(_1862) & 3;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[int(_1864)][_1866];
    int _1870 = int(_1862) + 1;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    int _1874 = _1870 & 3;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[int(_1872)][_1874];
    int _1878 = ~_1854;
    int _1880 = _1878 + 1;
    int _1882 = _1880 + 1;
    bool _1884 = !_1125;
    int _1886 = _1884 ? _1812 : (-1);
    uint _1888 = uint(int(uint(_1822) >> uint(2)));
    uint _1890 = uint(int(uint(int(_1888)) >> uint(2)));
    int _1892 = int(_1888) & 3;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[int(_1890)][_1892];
    int _1896 = int(_1888) + 1;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    int _1900 = _1896 & 3;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[int(_1898)][_1900];
    int _1904 = _1882;
    if (_1856)
    {
        int _1906 = ~_1854;
        int _1908 = _1906 + 1;
        _1904 = _1908;
    }
    int _1910 = _1904;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1914 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1916 = _1914 != 0;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1920 = _1822 + 8;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    uint _1924 = uint(int(uint(int(_1922)) >> uint(2)));
    int _1926 = int(_1922) & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = int(_1922) + 1;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    int _1934 = _1930 & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    float _1938 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1940 = abs(_1852);
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1944 = abs(_1696);
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1948 = abs(_1782);
    float _1950 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1952 = !_1858;
    int _1954 = _1952 ? 0 : (-1);
    float _1956 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1958 = _229 > 0.5;
    bool _1960 = _231 > 0.5;
    out.m_82.x = _1950;
    out.m_82.y = _1938;
    out.m_82.z = _1956;
    out.m_82.w = _1918;
    int _1962 = ~_1944;
    int _1964 = _1962 + 1;
    int _1966 = _1964 + 1;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1970 = -_193;
    int _1972 = _1958 ? as_type<int>(_1970) : as_type<int>(_193);
    float _1974 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1976 = _233 > 0.5;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1980 = _1966 * as_type<int>(_1844);
    int _1982 = abs(_1778);
    float _1984 = _1968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1986 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1988 = int(_1986);
    float _1990 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1992 = abs(as_type<int>(_1746));
    if (_939)
    {
        float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1996 = _1023 + _1994;
        _1772 = _1996;
    }
    float _1998 = _1772;
    int _2000 = ~_1940;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    int _2006 = ~_1948;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    out.m_84.x = _1974;
    out.m_84.y = _1984;
    out.m_84.z = _1990;
    int _2012 = ~_1992;
    int _2014 = _2012 + 1;
    int _2016 = _2014 + 1;
    int _2018 = _2004 * as_type<int>(_1902);
    int _2020 = abs(_1808);
    int _2022 = _2010 * as_type<int>(_1836);
    int _2024 = _2022 + _1980;
    int _2026 = abs(_1954);
    int _2028 = _2016 * as_type<int>(_1894);
    int _2030 = _2028 + _2018;
    float _2032 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2034 = int(_2032);
    int _2036 = abs(_1910);
    float _2038 = _843 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2040 = ~_1982;
    int _2042 = _2040 + 1;
    int _2044 = _2042 + 1;
    float _2046 = _853 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2048 = _843 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2050 = float(uint(_1988));
    int _2052 = _2044 * as_type<int>(_1868);
    int _2054 = _2052 + _2024;
    int _2056 = ~_2020;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    float _2062 = _853 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2064 = ~_2036;
    int _2066 = _2064 + 1;
    int _2068 = _2066 + 1;
    if (_939)
    {
        float _2070 = _1998 * _1998;
        _961 = _2070;
    }
    float _2072 = _961;
    float _2074 = 1.0 / _2050;
    int _2076 = _2060 * as_type<int>(_1876);
    int _2078 = _2076 + _2054;
    int _2080 = abs(_1722);
    int _2082 = _2068 * as_type<int>(_1928);
    int _2084 = _2082 + _2030;
    int _2086 = abs(_1988);
    int _2088 = ~_2080;
    int _2090 = _2088 + 1;
    int _2092 = _2090 + 1;
    int _2094 = ~_2026;
    int _2096 = _2094 + 1;
    int _2098 = _2096 + 1;
    float _2100 = float(uint(_2034));
    int _2102 = _2078 * _2092;
    int _2104 = _2098 * as_type<int>(_1936);
    int _2106 = _2104 + _2084;
    int _2108 = abs(_1734);
    float _2110 = _843 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2112 = _1714 * _2080;
    int _2114 = _2112 + _2102;
    float _2116 = 1.0 / _2100;
    float _2118 = float(uint(_2086));
    float _2120 = -_833;
    float _2122 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2038);
    int _2124 = abs(_2034);
    float _2126 = -_833;
    float _2128 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2110);
    int _2130 = as_type<int>(_2074) + (-2);
    float _2132 = _861 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2134 = float(uint(_2114));
    float _2136 = 1.0 / _2118;
    float _2138 = -_833;
    float _2140 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2048);
    int _2142 = ~_2108;
    int _2144 = _2142 + 1;
    int _2146 = _2144 + 1;
    float _2148 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2122);
    float _2150 = float(uint(_2124));
    float _2152 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2140);
    float _2154 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2128);
    float _2156 = _853 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2158 = as_type<float>(_2130) * _2134;
    int _2160 = _2106 * _2146;
    float _2162 = 1.0 / _2150;
    float _2164 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2156);
    int _2166 = abs(_2114);
    int _2168 = _1886 * _2108;
    int _2170 = _2168 + _2160;
    float _2172 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2046);
    float _2174 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2062);
    int _2176 = as_type<int>(_2116) + (-2);
    float _2178 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2164);
    float _2180 = trunc(_2158);
    float _2182 = precise::max(_2180, 0.0);
    uint _2184 = uint(_2182);
    float _2186 = float(uint(_2170));
    int _2188 = abs(_2170);
    float _2190 = as_type<float>(_2176) * _2186;
    float _2192 = float(uint(_2166));
    float _2194 = as_type<float>(_2106);
    if (_939)
    {
        float _2196 = _983 * 6.283185482025146484375;
        float _2198 = cos(_2196);
        _2194 = _2198;
    }
    float _2200 = _2194;
    int _2202 = ~_1988;
    int _2204 = _2202 + 1;
    float _2206 = _861 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2208 = as_type<int>(_2162) + (-2);
    float _2210 = float(uint(_2188));
    bool _2212 = !_1786;
    float _2214 = _2212 ? _197 : as_type<float>(_1700);
    float _2216 = trunc(_2190);
    float _2218 = precise::max(_2216, 0.0);
    uint _2220 = uint(_2218);
    int _2222 = as_type<int>(_2136) + (-2);
    float _2224 = _861 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2226 = !_1916;
    float _2228 = _2226 ? _193 : as_type<float>(_1972);
    bool _2230 = _2034 == 0;
    float _2232 = as_type<float>(_2222) * _2192;
    float _2234 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2206);
    int _2236 = _2204 * int(_2184);
    int _2238 = _2236 + _2114;
    float _2240 = as_type<float>(_2208) * _2210;
    float _2242 = trunc(_2232);
    float _2244 = precise::max(_2242, 0.0);
    uint _2246 = uint(_2244);
    float _2248 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2224);
    float _2250 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2132);
    float _2252 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    float _2254 = float(uint(_2238));
    float _2256 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2248);
    float _2258 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2250);
    int _2260 = ~_2086;
    int _2262 = _2260 + 1;
    float _2264 = trunc(_2240);
    float _2266 = precise::max(_2264, 0.0);
    uint _2268 = uint(_2266);
    int _2270 = ~_2034;
    int _2272 = _2270 + 1;
    float _2274 = as_type<float>(_2130) * _2254;
    float _2276 = as_type<float>(_2262);
    if (_939)
    {
        float _2278 = _2200 + (-1.0);
        _2276 = _2278;
    }
    float _2280 = _2276;
    int _2282 = ~_2124;
    int _2284 = _2282 + 1;
    int _2286 = _2272 * int(_2220);
    int _2288 = _2286 + _2170;
    int _2290 = _2262 * int(_2246);
    int _2292 = _2290 + _2166;
    float _2294 = _2280;
    if (_939)
    {
        float _2296 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2294 = _2296;
    }
    float _2298 = _2294;
    float _2300 = trunc(_2274);
    float _2302 = precise::max(_2300, 0.0);
    uint _2304 = uint(_2302);
    float _2306 = float(uint(_2288));
    float _2308 = float(uint(_2292));
    if (_939)
    {
        float _2310 = fma(_1001, _2200, _2298);
        _1003 = _2310;
    }
    float _2312 = _1003;
    float _2314 = -_197;
    int _2316 = _1960 ? as_type<int>(_2314) : as_type<int>(_197);
    int _2318 = _2284 * int(_2268);
    int _2320 = _2318 + _2188;
    float _2322 = as_type<float>(_2222) * _2308;
    bool _2324 = !_1790;
    float _2326 = _2324 ? _197 : as_type<float>(_2316);
    float _2328 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2330 = float(uint(_2320));
    float _2332 = as_type<float>(_2176) * _2306;
    float _2334 = -_193;
    int _2336 = _1976 ? as_type<int>(_2334) : as_type<int>(_193);
    float _2338 = trunc(_2322);
    float _2340 = precise::max(_2338, 0.0);
    uint _2342 = uint(_2340);
    float _2344 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    float _2346 = as_type<float>(_2208) * _2330;
    bool _2348 = !_1794;
    float _2350 = _2348 ? _193 : as_type<float>(_2336);
    float _2352 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2354 = _2328 * _2152;
    float _2356 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2174);
    float _2358 = _2328 * _2154;
    float _2360 = trunc(_2332);
    float _2362 = precise::max(_2360, 0.0);
    uint _2364 = uint(_2362);
    float _2366 = fma(_2352, _2178, _2354);
    float _2368 = _2354;
    if (_939)
    {
        float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2372 = _1029 + _2370;
        _2368 = _2372;
    }
    float _2374 = _2368;
    float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2378 = _2312 + _2376;
    out.m_86.x = _2178;
    out.m_86.y = _2344;
    out.m_86.z = _2356;
    if (_939)
    {
        float _2380 = _2374 * _2374;
        _963 = _2380;
    }
    float _2382 = _963;
    int _2384 = int(_2184) + int(_2304);
    float _2386 = trunc(_2346);
    float _2388 = precise::max(_2386, 0.0);
    uint _2390 = uint(_2388);
    float _2392 = _2328 * _2148;
    int _2394 = ~_1988;
    int _2396 = _2394 + 1;
    float _2398 = fma(_2378, _2378, _2072);
    bool _2400 = _2034 == 0;
    float _2402 = fma(_2352, _2344, _2392);
    float _2404 = fma(_2352, _2356, _2358);
    int _2406 = ~_2086;
    int _2408 = _2406 + 1;
    int _2410 = int(_2220) + int(_2364);
    int _2412 = ~_2034;
    int _2414 = _2412 + 1;
    int _2416 = int(_2246) + int(_2342);
    int _2418 = int(_2268) + int(_2390);
    int _2420 = _2396 * _2384;
    int _2422 = _2420 + _2114;
    int _2424 = ~_2124;
    int _2426 = _2424 + 1;
    int _2428 = _2408 * _2416;
    int _2430 = _2428 + _2166;
    float _2432 = _2398 + _2382;
    int _2434 = _2414 * _2410;
    int _2436 = _2434 + _2170;
    bool _2438 = uint(_2422) >= uint(_1988);
    int _2440 = _2426 * _2418;
    int _2442 = _2440 + _2188;
    float _2444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2446 = uint(_2430) >= uint(_2086);
    bool _2448 = uint(_2436) >= uint(_2034);
    bool _2450 = !_2438;
    int _2452 = _2450 ? 0 : (-1);
    bool _2454 = !_2448;
    int _2456 = _2454 ? 0 : (-1);
    float _2458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2460 = ~_2384;
    int _2462 = _2460 + _2452;
    int _2464 = _2462 + 1;
    bool _2466 = uint(_2442) >= uint(_2124);
    int _2468 = ~_2410;
    int _2470 = _2468 + _2456;
    int _2472 = _2470 + 1;
    int _2474 = _1988 * _2464;
    int _2476 = _2474 + _2114;
    int _2478 = _2114 ^ _1988;
    float _2480 = sqrt(_2432);
    bool _2482 = !_2466;
    int _2484 = _2482 ? 0 : (-1);
    int _2486 = _2034 * _2472;
    int _2488 = _2486 + _2170;
    bool _2490 = !_2446;
    int _2492 = _2490 ? 0 : (-1);
    uint _2494 = uint(int(uint(_2478) >> uint(31)));
    bool _2496 = _1988 == 0;
    float _2498 = _2458 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2500 = _1988 == 0;
    float _2502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2504 = _2170 ^ _2034;
    int _2506 = ~_2484;
    int _2508 = _2418 + _2506;
    int _2510 = _2508 + 1;
    int _2512 = ~_2492;
    int _2514 = _2416 + _2512;
    int _2516 = _2514 + 1;
    float _2518 = fma(_2328, _2328, 1.0);
    int _2520 = ~int(_2494);
    int _2522 = _2520 + 1;
    float _2524 = _2444 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2526 = !_2496;
    int _2528 = _2526 ? _2476 : (-1);
    float _2530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2532 = uint(int(uint(_2504) >> uint(31)));
    int _2534 = _2516 ^ _2522;
    float _2536 = float(_2528);
    int _2538 = ~int(_2532);
    int _2540 = _2538 + 1;
    int _2542 = ~_2522;
    int _2544 = _2542 + _2534;
    int _2546 = _2544 + 1;
    float _2548 = fma(_2524, _2536, _547);
    bool _2550 = !_2230;
    int _2552 = _2550 ? _2488 : (-1);
    float _2554 = rsqrt(_2518);
    int _2556 = _2510 ^ _2540;
    float _2558 = float(_2552);
    float _2560 = _2502 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2562 = ~_2540;
    int _2564 = _2562 + _2556;
    int _2566 = _2564 + 1;
    float _2568 = _2228 + 0.5;
    bool _2570 = !_2500;
    int _2572 = _2570 ? _2546 : (-1);
    float _2574 = fma(_2560, _2558, _641);
    bool _2576 = !_2400;
    int _2578 = _2576 ? _2566 : (-1);
    float _2580 = fma(_2524, _2568, _2548);
    float _2582 = float(_2572);
    float _2584 = _2350 + 0.5;
    float _2586 = float(_2578);
    float _2588 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2590 = -_1077;
    float _2592 = fma(_2228, _2590, _2580);
    float _2594 = -_619;
    float _2596 = fma(_2498, _2582, _2594);
    float _2598 = _2326 + (-0.5);
    float _2600 = fma(_2560, _2584, _2574);
    float _2602 = _2328 * _2554;
    float _2604 = -_659;
    float _2606 = fma(_2588, _2586, _2604);
    float _2608 = _2214 + (-0.5);
    float _2610 = -_2498;
    float _2612 = fma(_2610, _2598, _2596);
    float _2614 = -_2252;
    float _2616 = _2602 * _2614;
    float _2618 = -_2256;
    float _2620 = _2602 * _2618;
    float _2622 = -_2258;
    float _2624 = _2602 * _2622;
    float _2626 = -_2588;
    float _2628 = fma(_2626, _2608, _2606);
    float _2630 = fma(_2554, _2148, _2616);
    float _2632 = fma(_2554, _2152, _2620);
    float _2634 = -_1061;
    float _2636 = fma(_2350, _2634, _2600);
    float _2638 = fma(_2554, _2154, _2624);
    float _2640 = _2256 + _2366;
    float _2642 = fma(_2326, _1085, _2612);
    float _2644 = fma(_2214, _1089, _2628);
    float _2646 = _2252 + _2402;
    float _2648 = _2258 + _2404;
    out.m_88.x = _2632;
    out.m_88.y = _2630;
    out.m_88.z = _2638;
    bool _2650 = _2480 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2652 = isnan(_2480);
    bool _2654 = _2650 || _2652;
    bool _2656 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2658 = _2654 || _2656;
    out.m_90.x = _2592;
    out.m_90.y = _2642;
    out.m_90.z = _2636;
    out.m_90.w = _2644;
    out.m_92.x = _1039;
    out.m_92.y = _1041;
    out.m_92.z = _1043;
    out.m_94.x = _2640;
    out.m_94.y = _2646;
    out.m_94.z = _2648;
    float _2660 = _2518;
    float _2662 = as_type<float>(_2422);
    float _2664 = as_type<float>(_2540);
    if (!_2658)
    {
        _1133 = 1.0;
    }
    float _2666 = _1133;
    bool _2668 = !_2658;
    float _2670 = _2666;
    if (!_2668)
    {
        bool _2672 = _2480 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2674 = isnan(_2480);
        bool _2676 = _2672 || _2674;
        bool _2678 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2680 = _2676 || _2678;
        if (!_2680)
        {
            float _2682 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2684 = _2480 + _2682;
            float _2686 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2688 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2686;
            float _2690 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2692 = _2690 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2694 = 1.0 / _2688;
            float _2696 = _2684 * _2694;
            float _2698 = fma(_2696, _2692, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2670 = _2698;
            _2700 = true;
        }
        else
        {
            bool _2702 = _2480 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2704 = isnan(_2480);
            bool _2706 = _2702 || _2704;
            bool _2708 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2710 = _2706 || _2708;
            if (!_2710)
            {
                float _2712 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2714 = _2480 + _2712;
                float _2716 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2718 = _2716 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2720 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2722 = _2720 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2724 = 1.0 / _2718;
                float _2726 = _2714 * _2724;
                float _2728 = fma(_2726, _2722, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2670 = _2728;
                _2700 = true;
            }
            else
            {
                _2670 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2700 = false;
    float _2730 = _2670;
    float _2732 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2734 = _2312 + _2732;
    float _2736 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2738 = _1023 + _2736;
    float _2740 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2742 = _1029 + _2740;
    float _2744 = fma(_2734, _2730, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2746 = fma(_2738, _2730, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2748 = fma(_2742, _2730, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2750 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2752 = _2744 + _2750;
    float _2754 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2756 = _2746 + _2754;
    float _2758 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2760 = _2748 + _2758;
    float _2762 = _2752 * _2752;
    float _2764 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2766 = fma(_2756, _2756, _2762);
    float _2768 = _987 + _2764;
    float _2770 = fma(_2760, _2760, _2766);
    float _2772 = _987 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2774 = rsqrt(_2770);
    float _2776 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2772);
    float _2778 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2776);
    float _2780 = sqrt(_2770);
    float _2782 = _2778 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2784 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2786 = _987 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2788 = _2756 * _2784;
    float _2790 = _2760 * _2784;
    float _2792 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2786);
    float _2794 = _2788 * _2788;
    float _2796 = _2790 * _2790;
    float _2798 = 1.0 / _2782;
    float _2800 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2792);
    float _2802 = _2794 + _2796;
    float _2804 = _2800 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2806 = sqrt(_2802);
    float _2808 = _2804 + _2782;
    float _2810 = _2808 * _2798;
    float _2812 = _2810 * 0.5;
    float _2814 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2816 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2814);
    float _2818 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2820 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _2822 = _2806 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2826 = _2806 + _2824;
    float _2828 = 1.0 / _2816;
    float _2830 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2820);
    float _2832 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2834 = fma(_899, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2830);
    float _2836 = floor(_2818);
    float _2838 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2840 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    int _2842 = 2;
    float _2844 = _2784;
    float _2846 = _2788;
    float _2848 = _2794;
    if (_2822)
    {
        float _2850 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2840 = _2850;
    }
    float _2852 = _2840;
    float _2854 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2856 = _2828 * _2854;
    float _2858 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2832);
    bool _2860 = _2856 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2862 = fma(_899, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2858);
    bool _2864 = _2856 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2866 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2868 = trunc(_2838);
    int _2870 = int(_2868);
    float _2872 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2874 = -_2836;
    float _2876 = _2818 + _2874;
    float _2878 = precise::max(0.0, _2866);
    float _2880 = _2862;
    int _2882 = as_type<int>(_2872);
    if (_2822)
    {
        float _2884 = _2826 * _2852;
        _2880 = _2884;
    }
    float _2886 = _2880;
    float _2888 = trunc(_2872);
    int _2890 = int(_2888);
    if (!_2860)
    {
        _2842 = 1;
    }
    int _2892 = _2842;
    int _2894 = _2892;
    if (_2822)
    {
        float _2896 = _2886 * 0.15915493667125701904296875;
        _1025 = _2896;
    }
    float _2898 = _1025;
    bool _2900 = !_2860;
    int _2902 = _2900 ? 0 : 1;
    float _2904 = -_2784;
    float _2906 = -_2878;
    float _2908 = fma(_2752, _2904, _2906);
    if (!_2864)
    {
        _2894 = _2902;
    }
    int _2910 = _2894;
    float _2912 = _2834;
    float _2914 = as_type<float>(_2910);
    if (_2822)
    {
        float _2916 = _2898 * 6.283185482025146484375;
        float _2918 = sin(_2916);
        _2912 = _2918;
    }
    float _2920 = _2912;
    if (_2822)
    {
        float _2922 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2844 = _2922;
    }
    float _2924 = _2844;
    int _2926 = _2910 << 6;
    int _2928 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2930 = _2870 + _2928;
    int _2932 = _2930 + 1;
    float _2934 = fma(_899, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _2936 = _2926 + 48;
    uint _2938 = uint(int(uint(_2936) >> uint(2)));
    uint _2940 = uint(int(uint(int(_2938)) >> uint(2)));
    int _2942 = int(_2938) & 3;
    float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
    int _2946 = int(_2938) + 1;
    uint _2948 = uint(int(uint(_2946) >> uint(2)));
    int _2950 = _2946 & 3;
    float _2952 = (*spvDescriptorSet0.vp_c15)._m0[int(_2948)][_2950];
    float _2954 = _2802;
    if (_2822)
    {
        float _2956 = rsqrt(_2802);
        _2954 = _2956;
    }
    float _2958 = _2954;
    int _2960 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2962 = _2890 + _2960;
    int _2964 = _2962 + 1;
    bool _2966 = _2932 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2968 = _2932 | _2964;
    int _2970 = _2926 + 96;
    uint _2972 = uint(int(uint(_2970) >> uint(2)));
    uint _2974 = uint(int(uint(int(_2972)) >> uint(2)));
    int _2976 = int(_2972) & 3;
    float _2978 = (*spvDescriptorSet0.vp_c15)._m0[int(_2974)][_2976];
    int _2980 = int(_2972) + 1;
    uint _2982 = uint(int(uint(_2980) >> uint(2)));
    int _2984 = _2980 & 3;
    float _2986 = (*spvDescriptorSet0.vp_c15)._m0[int(_2982)][_2984];
    if (_2822)
    {
        float _2988 = fma(_2920, _2924, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2660 = _2988;
    }
    float _2990 = _2660;
    float _2992 = _2898;
    float _2994 = _2990;
    if (_2822)
    {
        float _2996 = _2898 * 6.283185482025146484375;
        float _2998 = cos(_2996);
        _2992 = _2998;
    }
    float _3000 = _2992;
    float _3002 = _2744 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _3004 = _2968 < 0;
    bool _3006 = _3004 || _2966;
    float _3008 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3002);
    int _3010 = _2926 + 56;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    uint _3014 = uint(int(uint(int(_3012)) >> uint(2)));
    int _3016 = int(_3012) & 3;
    float _3018 = (*spvDescriptorSet0.vp_c15)._m0[int(_3014)][_3016];
    int _3020 = int(_3012) + 1;
    uint _3022 = uint(int(uint(_3020) >> uint(2)));
    int _3024 = _3020 & 3;
    float _3026 = (*spvDescriptorSet0.vp_c15)._m0[int(_3022)][_3024];
    float _3028 = _2958;
    if (_2822)
    {
        float _3030 = _2958 * _2990;
        _2662 = _3030;
    }
    float _3032 = _2662;
    float _3034 = floor(_2934);
    bool _3036 = _2964 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3038 = _3036 || _3006;
    float _3040 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3008);
    float _3042 = _3040;
    if (_2822)
    {
        float _3044 = _2788 * _3032;
        _2846 = _3044;
    }
    float _3046 = _2846;
    if (!_2822)
    {
        _2994 = _2908;
    }
    float _3048 = _2994;
    int _3050 = _2926 + 104;
    uint _3052 = uint(int(uint(_3050) >> uint(2)));
    uint _3054 = uint(int(uint(int(_3052)) >> uint(2)));
    int _3056 = int(_3052) & 3;
    float _3058 = (*spvDescriptorSet0.vp_c15)._m0[int(_3054)][_3056];
    int _3060 = int(_3052) + 1;
    uint _3062 = uint(int(uint(_3060) >> uint(2)));
    int _3064 = _3060 & 3;
    float _3066 = (*spvDescriptorSet0.vp_c15)._m0[int(_3062)][_3064];
    float _3068 = _3048;
    if (_2822)
    {
        float _3070 = _3046 * _3046;
        _2848 = _3070;
    }
    float _3072 = _2848;
    if (_2822)
    {
        float _3074 = _3000 + (-1.0);
        _3028 = _3074;
    }
    float _3076 = _3028;
    float _3078 = _3076;
    if (_2822)
    {
        float _3080 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1049 = _3080;
    }
    float _3082 = _1049;
    if (!_2822)
    {
        _3078 = _2790;
    }
    float _3084 = _3078;
    int _3086 = _2926 + 64;
    uint _3088 = uint(int(uint(_3086) >> uint(2)));
    uint _3090 = uint(int(uint(int(_3088)) >> uint(2)));
    int _3092 = int(_3088) & 3;
    float _3094 = (*spvDescriptorSet0.vp_c15)._m0[int(_3090)][_3092];
    int _3096 = int(_3088) + 1;
    uint _3098 = uint(int(uint(_3096) >> uint(2)));
    int _3100 = _3096 & 3;
    float _3102 = (*spvDescriptorSet0.vp_c15)._m0[int(_3098)][_3100];
    float _3104 = _3084;
    if (_2822)
    {
        float _3106 = _2790 * _3032;
        _3104 = _3106;
    }
    float _3108 = _3104;
    float _3110 = _3040 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_2822)
    {
        float _3112 = fma(_2908, _3000, _3082);
        _3068 = _3112;
    }
    float _3114 = _3068;
    if (!_2822)
    {
        _3042 = _2796;
    }
    float _3116 = _3042;
    float _3118 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3120 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3122 = fma(_3114, _3114, _3072);
    int _3124 = _2926 + 80;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    uint _3128 = uint(int(uint(int(_3126)) >> uint(2)));
    int _3130 = int(_3126) & 3;
    float _3132 = (*spvDescriptorSet0.vp_c15)._m0[int(_3128)][_3130];
    int _3134 = int(_3126) + 1;
    uint _3136 = uint(int(uint(_3134) >> uint(2)));
    int _3138 = _3134 & 3;
    float _3140 = (*spvDescriptorSet0.vp_c15)._m0[int(_3136)][_3138];
    float _3142 = -_3034;
    float _3144 = _2934 + _3142;
    float _3146 = -_3120;
    float _3148 = fma(_3146, _3118, 1.0);
    int _3150 = as_type<int>(_3120);
    float _3152 = _3116;
    if (!_3038)
    {
        int _3154 = _2964 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3156 = _3154 + _2932;
        _3150 = _3156;
    }
    int _3158 = _3150;
    if (_2822)
    {
        float _3160 = _3108 * _3108;
        _3152 = _3160;
    }
    float _3162 = _3152;
    if (!_3038)
    {
        float _3164 = floor(_2872);
        _2664 = _3164;
    }
    float _3166 = _2664;
    int _3168 = _2926 + 72;
    uint _3170 = uint(int(uint(_3168) >> uint(2)));
    uint _3172 = uint(int(uint(int(_3170)) >> uint(2)));
    int _3174 = int(_3170) & 3;
    float _3176 = (*spvDescriptorSet0.vp_c15)._m0[int(_3172)][_3174];
    int _3178 = int(_3170) + 1;
    uint _3180 = uint(int(uint(_3178) >> uint(2)));
    int _3182 = _3178 & 3;
    float _3184 = (*spvDescriptorSet0.vp_c15)._m0[int(_3180)][_3182];
    float _3186 = _2768 * _2952;
    float _3188 = _3122 + _3162;
    float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3192 = fma(_2780, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3190);
    float _3194 = precise::clamp(_3192, 0.0, 1.0);
    float _3196 = fma(_897, _2944, _3186);
    float _3198 = rsqrt(_3188);
    float _3200 = -_3194;
    float _3202 = _3200 + 1.0;
    int _3204 = _2926 + 88;
    uint _3206 = uint(int(uint(_3204) >> uint(2)));
    uint _3208 = uint(int(uint(int(_3206)) >> uint(2)));
    int _3210 = int(_3206) & 3;
    float _3212 = (*spvDescriptorSet0.vp_c15)._m0[int(_3208)][_3210];
    int _3214 = int(_3206) + 1;
    uint _3216 = uint(int(uint(_3214) >> uint(2)));
    int _3218 = _3214 & 3;
    float _3220 = (*spvDescriptorSet0.vp_c15)._m0[int(_3216)][_3218];
    float _3222 = _2768 * _2986;
    int _3224 = as_type<int>(_3186);
    int _3226 = as_type<int>(_2978);
    if (!_3038)
    {
        int _3228 = _3158 << 2;
        _3224 = _3228;
    }
    int _3230 = _3224;
    float _3232 = fma(_897, _2978, _3222);
    int _3234 = _3230;
    if (!_3038)
    {
        int _3236 = 12 & _3230;
        _3234 = _3236;
    }
    int _3238 = _3234;
    float _3240 = fma(_899, _3018, _3196);
    float _3242 = _3198 * _3046;
    float _3244 = _3198 * _3114;
    float _3246 = fma(_899, _3058, _3232);
    float _3248 = _3240 + _3026;
    float _3250 = abs(_3202);
    float _3252 = log2(_3250);
    float _3254 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3256 = _3246 + _3066;
    float _3258 = _2744 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3260 = _3198 * _3108;
    float _3262 = -_3254;
    float _3264 = fma(_3244, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3262);
    float _3266 = _2768 * _3102;
    float _3268 = _3102;
    if (!_3038)
    {
        float _3270 = -_3166;
        float _3272 = _2872 + _3270;
        _3268 = _3272;
    }
    float _3274 = _3268;
    float _3276 = 1.0 / _3256;
    float _3278 = -_3260;
    float _3280 = fma(_3278, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3264);
    float _3282 = fma(_897, _3094, _3266);
    float _3284 = _2744 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (!_3038)
    {
        uint _3286 = uint(int(uint(_3158) >> uint(2)));
        _2882 = int(_3286);
    }
    int _3288 = _2882;
    float _3290 = _2768 * _3140;
    float _3292 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3284);
    if (!_3038)
    {
        int _3294 = _3288 << 4;
        int _3296 = _3294 + _3238;
        _3226 = _3296;
    }
    int _3298 = _3226;
    float _3300 = fma(_3280, -0.5, 0.5);
    float _3302 = fma(_897, _3132, _3290);
    float _3304 = fma(_3280, 0.5, 0.5);
    float _3306 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3292);
    float _3308 = _3202;
    if (!_3038)
    {
        int _3310 = _3298 + 400;
        uint _3312 = uint(int(uint(_3310) >> uint(2)));
        uint _3314 = uint(int(uint(int(_3312)) >> uint(2)));
        int _3316 = int(_3312) & 3;
        float _3318 = (*spvDescriptorSet0.vp_c15)._m0[int(_3314)][_3316];
        _3308 = _3318;
    }
    float _3320 = _3308;
    float _3322 = fma(_899, _3176, _3282);
    float _3324 = sqrt(_3300);
    float _3326 = _3248 * _3276;
    float _3328 = _3322 + _3184;
    float _3330 = _2744 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _3332 = _3326 >= 0.0;
    float _3334 = fma(_899, _3212, _3302);
    float _3336 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3330);
    float _3338 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3258);
    bool _3340 = _3326 <= 1.0;
    bool _3342 = _3340 && _3332;
    float _3344 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3346 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3336);
    float _3348 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3338);
    float _3350 = fma(_3304, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3352 = exp2(_3344);
    float _3354 = _3346 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3356 = _3328 * _3276;
    float _3358 = _3348 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3360 = fma(_3304, _3350, -0.212114393711090087890625);
    float _3362 = _3334 + _3220;
    float _3364 = _3244 + 1.0;
    float _3366 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3368 = _3356 >= 0.0;
    bool _3370 = _3368 && _3342;
    float _3372 = log2(_3148);
    float _3374 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3376 = fma(_3354, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3366);
    bool _3378 = _3356 <= 1.0;
    bool _3380 = _3378 && _3370;
    float _3382 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3384 = _3324 * 0.636619746685028076171875;
    float _3386 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3376);
    float _3388 = -_3244;
    float _3390 = fma(_3352, _3364, _3388);
    float _3392 = as_type<float>(_3288);
    float _3394 = _3384;
    if (!_3038)
    {
        float _3396 = floor(_2838);
        _3392 = _3396;
    }
    float _3398 = _3392;
    float _3400 = _3306 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3402 = fma(_3354, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3374);
    float _3404 = _3362 * _3276;
    float _3406 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3386);
    float _3408 = fma(_3304, _3360, 1.570728778839111328125);
    float _3410 = fma(_3354, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3382);
    float _3412 = _3406;
    if (_3380)
    {
        float _3414 = float(_2910);
        _2914 = _3414;
    }
    float _3416 = _2914;
    float _3418 = 1.0 / _3406;
    float _3420 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3402);
    float _3422 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3410);
    float _3424 = _3372 * 0.693147182464599609375;
    float _3426 = -_3408;
    float _3428 = fma(_3384, _3426, 1.0);
    float _3430 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3420);
    float _3432 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3422);
    float2 _9140 = float2(_2876, _3144);
    float _3434 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9140, float2(0.0), isnan(_9140)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9140, float2(0.0), isnan(_9140)), level(0.0)).x;
    float _3436 = _3410;
    float _3438 = _3432;
    if (_3380)
    {
        float _3440 = rint(_3416);
        float _3442 = precise::max(_3440, 0.0);
        uint _3444 = uint(_3442);
        uint _3446 = clamp(_3444, 0u, 65535u);
        _3436 = as_type<float>(_3446);
    }
    float _3448 = _3436;
    if (!_3038)
    {
        float _3450 = -_3398;
        float _3452 = _2838 + _3450;
        _3394 = _3452;
    }
    float _3454 = _3394;
    float _3456 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3458 = fma(_3390, 0.5, 0.5);
    float _3460 = _3430 * _3418;
    float _3462 = _3432 * _3418;
    float _3464 = _3276;
    if (!_3038)
    {
        float _3466 = rint(_3320);
        float _3468 = precise::max(_3466, 0.0);
        uint _3470 = uint(_3468);
        uint _3472 = clamp(_3470, 0u, 65535u);
        _3464 = as_type<float>(_3472);
    }
    float _3474 = _3464;
    float _3476 = fma(_3460, 0.5, 0.5);
    float _3478 = fma(_3462, -0.5, 0.5);
    float _3480 = _3448;
    if (_3380)
    {
        float3 _9215 = float3(_3326, _3356, float(as_type<int>(_3448)));
        float3 _9219 = select(_9215, float3(0.0), isnan(_9215));
        float _3482 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9219.xy, uint(rint(_9219.z)), _3404, level(0.0));
        _3480 = _3482;
    }
    float _3484 = _3480;
    float3 _9229 = float3(_3476, _3478, _3456);
    float _3486 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9229, float3(0.0), isnan(_9229)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9229, float3(0.0), isnan(_9229)), level(0.0)).x;
    float3 _9238 = float3(_3476, _3478, _3456);
    float4 _3489 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9238, float3(0.0), isnan(_9238)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9238, float3(0.0), isnan(_9238)), level(0.0)).xyzw;
    float _3491 = _3489.x;
    float _3493 = _3489.y;
    float _3495 = _3489.z;
    float _3497 = _3489.w;
    float2 _9254 = float2(_3428, _3458);
    float3 _3499 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9254, float2(0.0), isnan(_9254)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9254, float2(0.0), isnan(_9254)), level(0.0)).xyz;
    float _3501 = _3499.x;
    float _3503 = _3499.y;
    float _3505 = _3499.z;
    float _3507 = _3474;
    if (!_3038)
    {
        float3 _9275 = float3(_3454, _3274, float(as_type<int>(_3474)));
        float3 _9277 = select(_9275, float3(0.0), isnan(_9275));
        float _3509 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9277.xy, uint(rint(_9277.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9277.xy, uint(rint(_9277.z)), level(0.0)).x;
        _3507 = _3509;
    }
    float _3511 = _3507;
    float _3513 = abs(_2856);
    float _3515 = log2(_3513);
    float _3517 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3519 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3521 = fma(_3354, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3517);
    float _3523 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3521);
    float _3525 = exp2(_3519);
    bool _3527 = _2856 <= 8000.0;
    bool _3529 = isnan(_2856);
    bool _3531 = _3527 || _3529;
    bool _3533 = isnan(8000.0);
    bool _3535 = _3531 || _3533;
    float _3537 = float(_3535);
    float _3539 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3523);
    float _3541 = _3515 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3430;
    out.gl_Position.y = _3432;
    out.gl_Position.z = _3539;
    out.gl_Position.w = _3406;
    float _3543 = exp2(_3541);
    float _3545 = fma(_3543, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3547 = precise::clamp(_3545, 0.0, 1.0);
    float _3549 = fma(_3547, -2.0, 3.0);
    float _3551 = _3547 * _3547;
    float _3553 = _3551 * _3549;
    float _3555 = -_3553;
    float _3557 = _3555 + 1.0;
    float _3559 = fma(_3557, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3553);
    float _3561 = _3557;
    float _3563 = _3539;
    if (!_3380)
    {
        _3561 = 1.0;
    }
    float _3565 = _3561;
    float _3567 = _3537 * _3559;
    float _3569 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3571 = -_3525;
    float _3573 = _3571 + 1.0;
    float _3575 = -_3434;
    float _3577 = _3575 + 1.0;
    float _3579 = _3577 * _3569;
    float _3581 = precise::clamp(_3579, 0.0, 1.0);
    float _3583 = _3565;
    float _3585 = _3573;
    if (_3380)
    {
        bool _3587 = _3484 >= _3404;
        bool _3589 = isnan(_3484);
        bool _3591 = _3587 || _3589;
        bool _3593 = isnan(_3404);
        bool _3595 = _3591 || _3593;
        float _3597 = float(_3595);
        _3583 = _3597;
    }
    float _3599 = _3583;
    float _3601 = _3573 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_3038)
    {
        _3585 = 1.0;
    }
    float _3603 = _3585;
    float _3605 = _3603;
    if (!_3038)
    {
        int _3607 = _3158 << 4;
        int _3609 = _3607 + 2048;
        uint _3611 = uint(int(uint(_3609) >> uint(2)));
        uint _3613 = uint(int(uint(int(_3611)) >> uint(2)));
        int _3615 = int(_3611) & 3;
        float _3617 = (*spvDescriptorSet0.vp_c15)._m0[int(_3613)][_3615];
        int _3619 = int(_3611) + 1;
        uint _3621 = uint(int(uint(_3619) >> uint(2)));
        int _3623 = _3619 & 3;
        float _3625 = (*spvDescriptorSet0.vp_c15)._m0[int(_3621)][_3623];
        int _3627 = _3609 + 8;
        uint _3629 = uint(int(uint(_3627) >> uint(2)));
        uint _3631 = uint(int(uint(int(_3629)) >> uint(2)));
        int _3633 = int(_3629) & 3;
        float _3635 = (*spvDescriptorSet0.vp_c15)._m0[int(_3631)][_3633];
        int _3637 = int(_3629) + 1;
        uint _3639 = uint(int(uint(_3637) >> uint(2)));
        int _3641 = _3637 & 3;
        float _3643 = (*spvDescriptorSet0.vp_c15)._m0[int(_3639)][_3641];
        float _3645 = _2768 * _3625;
        float _3647 = fma(_897, _3617, _3645);
        float _3649 = fma(_899, _3635, _3647);
        float _3651 = _3649 + _3643;
        float _3653 = precise::clamp(_3651, 0.0, 1.0);
        float _3655 = -_3653;
        float _3657 = _3655 + _3511;
        float _3659 = fma(_3657, 500.0, 1.5);
        float _3661 = exp2(_3659);
        float _3663 = 0.0 + _3661;
        float _3665 = precise::clamp(_3663, 0.0, 1.0);
        _3605 = _3665;
        _3438 = _3643;
    }
    float _3667 = _3605;
    float _3669 = _3438;
    float _3671 = _3599 * _3667;
    float _3673 = _3601 * _3486;
    float _3675 = -_3581;
    float _3677 = fma(_3675, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3679 = -_3601;
    float _3681 = _3679 + 1.0;
    bool _3683 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3685 = isnan(_2780);
    bool _3687 = _3683 || _3685;
    bool _3689 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3691 = _3687 || _3689;
    float _3693 = _3497 * _3673;
    float _3695 = -_3671;
    float _3697 = fma(_3695, _3677, 1.0);
    float _3699 = precise::clamp(_3697, 0.0, 1.0);
    float _3701 = _3505 * _3673;
    float _3703 = _3497 * _3681;
    float _3705 = fma(_3501, _3693, _3491);
    float _3707 = fma(_3503, _3693, _3493);
    float _3709 = _3699 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3711 = fma(_3497, _3701, _3495);
    out.m_96.x = _3709;
    float _3713 = _3669;
    float _3715 = _3693;
    float _3717 = _3677;
    float _3719 = _3699;
    if (!_3691)
    {
        _3412 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3721 = _3412;
    float _3723 = _3721;
    float _3725 = _3721;
    if (!_3691)
    {
        _3563 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3727 = _3563;
    out.m_98.x = _3705;
    out.m_98.y = _3707;
    out.m_98.z = _3711;
    out.m_98.w = _3703;
    float _3729 = _3727;
    float _3731 = _3727;
    if (!_3691)
    {
        _3713 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3733 = _3713;
    float _3735 = _3733;
    float _3737 = _3733;
    if (!_3691)
    {
        _3715 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3739 = _3715;
    float _3741 = _3739;
    float _3743 = _3739;
    if (!_3691)
    {
        _3717 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3745 = _3717;
    float _3747 = _3745;
    float _3749 = _3745;
    if (!_3691)
    {
        _3719 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3751 = _3719;
    bool _3753 = !_3691;
    float _3755 = _3751;
    float _3757 = _3751;
    if (!_3753)
    {
        bool _3759 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3761 = isnan(_2780);
        bool _3763 = _3759 || _3761;
        bool _3765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3767 = _3763 || _3765;
        if (!_3767)
        {
            float _3769 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3771 = _2780 + _3769;
            float _3773 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3775 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3773;
            float _3777 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3779 = _3777 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3781 = 1.0 / _3775;
            float _3783 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3785 = _3783 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3787 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3789 = _3787 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3793 = _3791 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3799 = _3771 * _3781;
            float _3801 = precise::clamp(_3799, 0.0, 1.0);
            float _3803 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3805 = _3803 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3807 = fma(_3801, _3779, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3809 = fma(_3801, _3805, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3811 = fma(_3801, _3785, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3813 = fma(_3801, _3789, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3815 = fma(_3801, _3793, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3817 = fma(_3801, _3797, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3731 = _3811;
            _3749 = _3815;
            _3725 = _3807;
            _3743 = _3813;
            _3737 = _3809;
            _3757 = _3817;
            _3819 = true;
        }
        else
        {
            bool _3821 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3823 = isnan(_2780);
            bool _3825 = _3821 || _3823;
            bool _3827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3829 = _3825 || _3827;
            if (!_3829)
            {
                _3723 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3831 = _3723;
            _3725 = _3831;
            if (!_3829)
            {
                _3729 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3833 = _3729;
            _3731 = _3833;
            if (!_3829)
            {
                _3735 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3835 = _3735;
            _3737 = _3835;
            if (!_3829)
            {
                _3741 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3837 = _3741;
            _3743 = _3837;
            if (!_3829)
            {
                _3747 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3839 = _3747;
            _3749 = _3839;
            if (!_3829)
            {
                _3755 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3841 = _3755;
            bool _3843 = !_3829;
            _3757 = _3841;
            if (!_3843)
            {
                bool _3845 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3847 = isnan(_2780);
                bool _3849 = _3845 || _3847;
                bool _3851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3853 = _3849 || _3851;
                if (!_3853)
                {
                    float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3857 = _2780 + _3855;
                    float _3859 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3861 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3859;
                    float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3867 = 1.0 / _3861;
                    float _3869 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3885 = _3857 * _3867;
                    float _3887 = precise::clamp(_3885, 0.0, 1.0);
                    float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3893 = fma(_3887, _3865, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3895 = fma(_3887, _3891, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3897 = fma(_3887, _3871, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3899 = fma(_3887, _3875, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3901 = fma(_3887, _3879, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3903 = fma(_3887, _3883, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3731 = _3897;
                    _3749 = _3901;
                    _3725 = _3893;
                    _3743 = _3899;
                    _3737 = _3895;
                    _3757 = _3903;
                    _3819 = true;
                }
                else
                {
                    _3731 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3749 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3725 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3743 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3737 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3757 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3819 = false;
    float _3905 = _3731;
    float _3907 = _3749;
    float _3909 = _3725;
    float _3911 = _3743;
    float _3913 = _3737;
    float _3915 = _3757;
    float _3917 = fma(_2646, -0.5, 0.5);
    float _3919 = precise::clamp(_3917, 0.0, 1.0);
    float _3921 = -_3905;
    float _3923 = _3921 + _3907;
    float _3925 = -_3909;
    float _3927 = _3925 + _3911;
    float _3929 = -_3913;
    float _3931 = _3929 + _3915;
    bool _3933 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3935 = fma(_3919, _3923, _3905);
    float _3937 = fma(_3919, _3927, _3909);
    float _3939 = fma(_3919, _3931, _3913);
    float _3941 = _3935 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _3943 = fma(_3937, 0.298911988735198974609375, _3941);
    float _3945 = fma(_3939, 0.114477999508380889892578125, _3943);
    out.m_100.x = 0.0;
    float _3947 = -_3945;
    float _3949 = _3937 + _3947;
    float _3951 = -_3945;
    float _3953 = _3935 + _3951;
    float _3955 = -_3945;
    float _3957 = _3939 + _3955;
    float _3959 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3961 = fma(_3949, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    float _3963 = fma(_3953, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    float _3965 = fma(_3957, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    out.m_96.w = _3959;
    out.m_102.x = _3961;
    out.m_102.y = _3963;
    out.m_102.z = _3965;
    if (!_3933)
    {
        return out;
    }
    float _3967 = -_2744;
    float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3971 = -_2746;
    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3975 = -_2748;
    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3979 = _3969 * _3969;
    float _3981 = fma(_3973, _3973, _3979);
    float _3983 = fma(_3977, _3977, _3981);
    float _3985 = sqrt(_3983);
    float _3987 = rsqrt(_3983);
    float _3989 = -_3985;
    float _3991 = _3989 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3993 = _3991 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3995 = precise::clamp(_3993, 0.0, 1.0);
    float _3997 = _3973 * _3987;
    float _3999 = _3969 * _3987;
    float _4001 = abs(_3995);
    float _4003 = log2(_4001);
    float _4005 = _3977 * _3987;
    float _4007 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4009 = _2646 * _3999;
    float _4011 = -_3999;
    float _4013 = -_4007;
    float _4015 = fma(_4011, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4013);
    float _4017 = fma(_2640, _3997, _4009);
    float _4019 = -_4005;
    float _4021 = fma(_4019, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4015);
    float _4023 = fma(_2648, _4005, _4017);
    float _4025 = precise::clamp(_4023, 0.0, 1.0);
    float _4027 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4029 = _4021 + _4027;
    float _4031 = _4003 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4033 = _4029 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4035 = precise::clamp(_4033, 0.0, 1.0);
    float _4037 = exp2(_4031);
    float _4039 = _4037 * _4035;
    float _4041 = _4025 * _4039;
    float _4043 = _4041 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4045 = _4041 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4047 = _4041 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_100.x = _4043;
    out.m_100.y = _4045;
    out.m_100.z = _4047;
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
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3819 = false;
    bool _2700 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_60.w;
    float _118 = trunc(_116);
    int _121 = int(_118);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_121);
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _127;
    float _133 = _131;
    if (!_125)
    {
        out.m_63.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _131 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4106 = as_type<float>(_139);
        out.gl_Position.z = _4106;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_65.w;
    bool _145 = _143 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_143);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = -_143;
    float _157 = _155 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _159 = _157;
    if (_153)
    {
        float _161 = float(_121);
        _133 = _161;
    }
    float _163 = _133;
    bool _165 = _157 >= _163;
    bool _167 = !_153;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_63.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _141 = as_type<int>(_175);
    }
    int _177 = _141;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4176 = as_type<float>(_177);
        out.gl_Position.z = _4176;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = as_type<int>(_179) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_179) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_181;
    float _217;
    if (!_199)
    {
        float _201 = in.m_70.x;
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _201 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _157);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        float _221 = float(_121);
        float _223 = 1.0 / _221;
        float _225 = _157 * _223;
        _217 = _225;
    }
    _219 = false;
    float _227 = _217;
    float _229 = in.m_70.x;
    float _231 = in.m_70.y;
    float _233 = in.m_70.z;
    float _235 = in.m_70.w;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _239 = _227 + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _245 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _251 = 1.0 / _243;
    int _253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _255 = _253 != 0;
    float _257 = 1.0 / _247;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _263;
    float _267 = float(_121);
    float _269 = _229 * 2.0;
    float _271 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _273 = _231 * 2.0;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _227 + _275;
    float _279 = floor(_269);
    float _281 = -_249;
    float _283 = fma(_271, 2.0, _281);
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _287 = _277 * _251;
    float _289 = _229 + _231;
    float _291 = _231 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _293 = _239 * _257;
    float _295 = _289 + (-1.0);
    float _297 = _233 * 2.0;
    float _299 = _233 + _231;
    float _301 = floor(_273);
    float _303 = fma(_291, -2.0, _285);
    float _305 = _233 + _229;
    float _307 = _299 + (-1.0);
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _311 = _279 >= 0.0;
    bool _313 = isnan(_279);
    bool _315 = _311 || _313;
    bool _317 = isnan(0.0);
    bool _319 = _315 || _317;
    float _321 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _323 = floor(_297);
    int _325 = as_type<int>(_307);
    if (_255)
    {
        _325 = 0;
    }
    int _327 = _325;
    float _329 = _305 + (-1.0);
    int _331 = _327;
    if (!_255)
    {
        _331 = 1;
    }
    int _333 = _331;
    float _335 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _337 = _279 > 0.0;
    float _339 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _341 = fma(_261, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _345 = int(_343);
    bool _347 = _301 >= 0.0;
    bool _349 = isnan(_301);
    bool _351 = _347 || _349;
    bool _353 = isnan(0.0);
    bool _355 = _351 || _353;
    float _357 = fma(_265, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _359 = _301 > 0.0;
    float _361 = _229 + (-0.5);
    int _363 = _355 ? 0 : 1;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _371 = int(_369);
    bool _373 = _323 > 0.0;
    bool _375 = _323 >= 0.0;
    bool _377 = isnan(_323);
    bool _379 = _375 || _377;
    bool _381 = isnan(0.0);
    bool _383 = _379 || _381;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _387 = _319 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _389 = _333 != 1;
    float _391 = 1.0 / _267;
    int _393 = _383 ? 0 : 1;
    int _395 = ~as_type<int>(_387);
    int _397 = _395 + 1;
    int _399 = _397 + 1;
    int _401 = _399;
    float _403 = _387;
    float _405 = _301;
    if (!_337)
    {
        int _407 = ~as_type<int>(_387);
        int _409 = _407 + 1;
        _401 = _409;
    }
    int _411 = _401;
    int _413 = ~_393;
    int _415 = _413 + 1;
    int _417 = _415 + 1;
    int _419 = _417;
    if (!_373)
    {
        int _421 = ~_393;
        int _423 = _421 + 1;
        _419 = _423;
    }
    int _425 = _419;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _429 = _427 != 0;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _437 = _435 != 0;
    float _439 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _441 = log2(_439);
    if (!_389)
    {
        _403 = _231;
    }
    float _443 = _403;
    float _445 = _443;
    if (_389)
    {
        _445 = _229;
    }
    float _447 = _445;
    float _449 = _391 * _157;
    bool _451 = !_433;
    int _453 = _451 ? 0 : 1;
    bool _455 = !_437;
    int _457 = _455 ? 0 : 1;
    float _459 = fma(_447, (*spvDescriptorSet0.vp_c9)._m0[83].z, _309);
    bool _461 = !_429;
    int _463 = _461 ? 0 : 1;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _475 = _473 != 0;
    float _477 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].z, _459);
    if (!_389)
    {
        _129 = _231;
    }
    float _479 = _129;
    int _481 = ~_363;
    int _483 = _481 + 1;
    int _485 = _483 + 1;
    float _487 = _479;
    int _489 = _485;
    if (_389)
    {
        _487 = _229;
    }
    float _491 = _487;
    if (!_359)
    {
        int _493 = ~_363;
        int _495 = _493 + 1;
        _489 = _495;
    }
    int _497 = _489;
    float _499 = float(_345);
    float _501 = _491 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _503 = !_467;
    int _505 = _503 ? 0 : 1;
    float _507 = 1.0 / _499;
    float _509 = -_385;
    float _511 = fma(_501, 2.0, _509);
    float _513 = float(_411);
    float _515 = _441 * _157;
    float _517 = _501;
    if (!_389)
    {
        _405 = _233;
    }
    float _519 = _405;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _523 = float(_497);
    int _525 = abs(_505);
    float _527 = exp2(_515);
    float _529 = _519;
    if (_389)
    {
        _529 = _231;
    }
    float _531 = _529;
    float _533 = float(_371);
    if (!_389)
    {
        _517 = _233;
    }
    float _535 = _517;
    float _537 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[83].w, _521);
    float _539 = float(_525);
    float _541 = 1.0 / _533;
    float _543 = float(_425);
    float _545 = -_157;
    float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[76].x, _283);
    float _549 = _507 * _157;
    float _551 = _535;
    if (_389)
    {
        _551 = _231;
    }
    float _553 = _551;
    float _555 = _539 * _543;
    bool _557 = !_471;
    int _559 = _557 ? 0 : 1;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _563 = in.m_72.x;
    float _565 = in.m_72.y;
    float _567 = in.m_72.z;
    float _569 = _553 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _571 = !_475;
    int _573 = _571 ? 0 : 1;
    float _575 = _555 * (-2.0);
    int _577 = abs(_559);
    float _579 = fma(_569, -2.0, _561);
    float _581 = _541 * _157;
    float _583 = fma(_335, _575, _335);
    int _585 = abs(_573);
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _589 = float(_577);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _593 = 1.0 + _591;
    float _595 = float(_585);
    bool _597 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _605 = _601 || _603;
    float _607 = _589 * _513;
    float _609 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].z, _587);
    float _611 = 1.0 / _593;
    float _613 = _595 * _523;
    float _615 = -_527;
    float _617 = _615 + 1.0;
    float _619 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[76].y, _303);
    bool _621 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _623 = isnan(1.0);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _629 = _625 || _627;
    float _631 = fma(_575, _563, _563);
    float _633 = _605 ? _617 : 0.0;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _637 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[82].w, _537);
    float _639 = -_157;
    float _641 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[81].x, _511);
    float _643 = _607 * (-2.0);
    float _645 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[78].w, _635);
    float _647 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[196].x, _631);
    float _649 = _613 * (-2.0);
    float _651 = fma(_321, _643, _321);
    float _653 = fma(_643, _565, _565);
    float _655 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].z, _609);
    float _657 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[77].w, _645);
    float _659 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[81].y, _579);
    float _661 = _231 + (-0.5);
    bool _663 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _665 = isnan(_227);
    bool _667 = _663 || _665;
    bool _669 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _671 = _667 || _669;
    float _673 = float(_671);
    if (_629)
    {
        float _675 = _633 * _611;
        _159 = _675;
    }
    float _677 = _159;
    float _679 = fma(_649, _567, _567);
    float _681 = fma(_339, _649, _339);
    float _683 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[196].y, _653);
    bool _685 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _687 = isnan(_227);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = fma(_583, _677, _647);
    float _699 = -_673;
    float _701 = _699 + 1.0;
    float _703 = fma(_651, _677, _683);
    bool _705 = _227 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _707 = isnan(_227);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = _697 * 0.15915493667125701904296875;
    float _719 = _695 * _701;
    float _721 = -_695;
    float _723 = _721 + 1.0;
    float _725 = in.m_74.x;
    float _727 = in.m_74.y;
    float _729 = _703 * 0.15915493667125701904296875;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _733 = _731 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _735 = _715 * _723;
    float _737 = _233 + (-0.5);
    float _739 = -_715;
    float _741 = _739 + 1.0;
    float _743 = fma(_733, _293, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _745 = _357 * _735;
    float _747 = _341 * _735;
    float _749 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[196].z, _679);
    float _751 = in.m_76.x;
    float _753 = in.m_76.y;
    float _755 = in.m_76.z;
    float _757 = fma(_367, _293, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _759 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[143].y, _745);
    float _761 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[143].x, _747);
    float _763 = in.m_60.x;
    float _765 = in.m_60.y;
    float _767 = in.m_60.z;
    float _769 = fma(_681, _677, _749);
    float _771 = fma(_757, _719, _759);
    float _773 = fma(_743, _719, _761);
    float _775 = _717 * 6.283185482025146484375;
    float _777 = cos(_775);
    float _779 = _769 * 0.15915493667125701904296875;
    float _781 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[145].y, _771);
    float _783 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[145].x, _773);
    float _785 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _787 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _789 = _781 * _727;
    float _791 = _783 * _725;
    float _793 = _729 * 6.283185482025146484375;
    float _795 = sin(_793);
    float _797 = _789 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _799 = _791 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _801 = in.m_78.x;
    float _803 = in.m_78.y;
    float _805 = in.m_78.z;
    float _807 = _797 * _787;
    float _809 = _799 * _785;
    float _811 = _729 * 6.283185482025146484375;
    float _813 = cos(_811);
    float _815 = _765 * _753;
    float _817 = _717 * 6.283185482025146484375;
    float _819 = sin(_817);
    float _821 = fma(_763, _751, _815);
    float _823 = fma(_767, _755, _821);
    float _825 = _779 * 6.283185482025146484375;
    float _827 = cos(_825);
    float _829 = _777 * _813;
    float _831 = _779 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _819 * _795;
    float _837 = _819 * _813;
    float _839 = _813 * _827;
    float _841 = _777 * _795;
    float _843 = _777 * _827;
    float _845 = _819 * _827;
    float _847 = _795 * _827;
    float _849 = _843 * _807;
    float _851 = _845 * _807;
    float _853 = fma(_833, _829, _835);
    float _855 = -_841;
    float _857 = fma(_833, _837, _855);
    float _859 = -_837;
    float _861 = fma(_833, _841, _859);
    float _863 = -_807;
    float _865 = _833 * _863;
    float _867 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _869 = fma(_853, _809, _849);
    float _871 = fma(_833, _835, _829);
    float _873 = fma(_839, _809, _865);
    float _875 = _765 * _803;
    float _877 = fma(_861, _867, _869);
    float _879 = fma(_857, _809, _851);
    float _881 = fma(_847, _867, _873);
    float _883 = fma(_763, _801, _875);
    float _885 = _877 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _887 = _877 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _889 = fma(_871, _867, _879);
    float _891 = fma(_767, _805, _883);
    float _893 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].x, _885);
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _887);
    float _897 = _823 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _899 = _891 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _901 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[24].z, _893);
    float _903 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[26].z, _895);
    float _905 = _901 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _907 = _903 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _909 = _897 + _905;
    float _911 = _899 + _907;
    float _913 = in.m_80.x;
    float _915 = in.m_80.y;
    float _917 = in.m_80.z;
    float _919 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _921 = _909 + _919;
    float _923 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _925 = _911 + _923;
    float _927 = _921 * _921;
    float _929 = _925 * _925;
    float _931 = _927 + _929;
    float _933 = sqrt(_931);
    float _935 = _765 * _915;
    float _937 = fma(_763, _913, _935);
    bool _939 = _933 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _941 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _943 = _933 + _941;
    float _945 = fma(_767, _917, _937);
    float _947 = _851;
    float _949 = _931;
    float _951 = _943;
    float _953 = _877;
    float _955 = _765;
    float _957 = _909;
    float _959 = _911;
    float _961 = _927;
    float _963 = _929;
    if (_939)
    {
        float _965 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _947 = _965;
    }
    float _967 = _947;
    if (_939)
    {
        float _969 = rsqrt(_931);
        _949 = _969;
    }
    float _971 = _949;
    float _973 = _971;
    if (_939)
    {
        float _975 = _943 * _967;
        _951 = _975;
    }
    float _977 = _951;
    float _979 = _877 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_939)
    {
        float _981 = _977 * 0.15915493667125701904296875;
        _953 = _981;
    }
    float _983 = _953;
    float _985 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _979);
    float _987 = _945 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _989 = _763;
    if (_939)
    {
        float _991 = _983 * 6.283185482025146484375;
        float _993 = sin(_991);
        _989 = _993;
    }
    float _995 = _989;
    float _997 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[25].z, _985);
    float _999 = _997 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1001 = _987 + _999;
    float _1003 = _1001;
    if (_939)
    {
        float _1005 = _1001 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _955 = _1005;
    }
    float _1007 = _955;
    float _1009 = _995;
    if (_939)
    {
        float _1011 = fma(_995, _1007, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1009 = _1011;
    }
    float _1013 = _1009;
    float _1015 = _1013;
    if (_939)
    {
        float _1017 = _971 * _1013;
        _1015 = _1017;
    }
    float _1019 = _1015;
    if (_939)
    {
        float _1021 = fma(_921, _1019, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _957 = _1021;
    }
    float _1023 = _957;
    float _1025 = _1023;
    if (_939)
    {
        float _1027 = fma(_925, _1019, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _959 = _1027;
    }
    float _1029 = _959;
    float _1031 = fma(_1023, 6.2500002968590706586837768554688e-05, 0.5);
    float _1033 = fma(_1029, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5493 = float2(_1031, _1033);
    float3 _1037 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5493, float2(0.0), isnan(_5493)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5493, float2(0.0), isnan(_5493)), level(0.0)).xyz;
    float _1039 = _1037.x;
    float _1041 = _1037.y;
    float _1043 = _1037.z;
    float _1045 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1047 = int(_1045);
    float _1049 = _1029;
    if (_255)
    {
        float _1051 = in.m_70.x;
        _973 = _1051;
    }
    float _1053 = _973;
    float _1055 = 0.0;
    if (_255)
    {
        _1055 = 1.0;
    }
    float _1057 = _1055;
    float _1059 = -_477;
    float _1061 = _1059 + 1.0;
    float _1063 = _1057;
    if (!_255)
    {
        _1063 = 1.2345600128173828125;
    }
    float _1065 = _1063;
    float _1067 = _1053;
    if (!_255)
    {
        float _1069 = in.m_70.y;
        _1067 = _1069;
    }
    float _1071 = _1067;
    int _1073 = abs(_453);
    float _1075 = -_655;
    float _1077 = _1075 + 1.0;
    float _1079 = trunc(_549);
    int _1081 = int(_1079);
    float _1083 = -_657;
    float _1085 = _1083 + 1.0;
    float _1087 = -_637;
    float _1089 = _1087 + 1.0;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1093 = float(uint(_1047));
    float _1095 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1097 = int(_1095);
    int _1099 = ~_1047;
    int _1101 = _1099 + 1;
    float _1103 = float(_1047);
    bool _1105 = _1047 == 0;
    float _1107 = float(uint(_1081));
    float _1109 = 1.0 / _1093;
    float _1111 = float(_1081);
    float _1113 = _1065 * _1071;
    float _1115 = float(uint(_1097));
    float _1117 = trunc(_581);
    int _1119 = int(_1117);
    int _1121 = ~_1097;
    int _1123 = _1121 + 1;
    bool _1125 = _1097 == 0;
    int _1127 = as_type<int>(_1109) + (-2);
    float _1129 = 1.0 / _1115;
    float _1131 = _1109;
    float _1133 = _1089;
    if (_255)
    {
        _1131 = 1.0;
    }
    float _1135 = _1131;
    float _1137 = _1135;
    if (!_255)
    {
        _1137 = 7.345489978790283203125;
    }
    float _1139 = _1137;
    float _1141 = as_type<float>(_1127) * _1107;
    int _1143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1145 = _1143 != 0;
    float _1147 = trunc(_1141);
    float _1149 = precise::max(_1147, 0.0);
    uint _1152 = uint(_1149);
    float _1154 = _1139 * _229;
    int _1156 = as_type<int>(_1129) + (-2);
    float _1158 = float(uint(_1119));
    int _1160 = _1101 * int(_1152);
    int _1162 = _1160 + _1081;
    float _1164 = as_type<float>(_1156) * _1158;
    bool _1166 = _1111 >= _1103;
    bool _1168 = isnan(_1111);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan(_1103);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    int _1178 = ~_1047;
    int _1180 = _1178 + 1;
    float _1182 = float(uint(_1162));
    float _1184 = trunc(_1164);
    float _1186 = precise::max(_1184, 0.0);
    uint _1188 = uint(_1186);
    float _1190 = as_type<float>(_1127) * _1182;
    float _1192 = floor(_1154);
    float _1194 = trunc(_1190);
    float _1196 = precise::max(_1194, 0.0);
    uint _1198 = uint(_1196);
    float _1200 = -_1192;
    float _1202 = _1154 + _1200;
    float _1204 = trunc(_1176);
    int _1206 = int(_1204);
    float _1208 = _1202 * _1103;
    int _1210 = _1123 * int(_1188);
    int _1212 = _1210 + _1119;
    float _1214 = _1103 * _449;
    int _1216 = int(_1152) + int(_1198);
    float _1218 = trunc(_1208);
    int _1220 = int(_1218);
    float _1222 = float(uint(_1212));
    int _1224 = _1180 * _1216;
    int _1226 = _1224 + _1081;
    float _1228 = as_type<float>(_1156) * _1222;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1232 = _1230 != 0;
    float _1234 = trunc(_1214);
    int _1236 = int(_1234);
    bool _1238 = uint(_1226) >= uint(_1047);
    bool _1240 = !_1232;
    int _1242 = _1240 ? 0 : 1;
    bool _1244 = !_1238;
    int _1246 = _1244 ? 0 : (-1);
    int _1248 = abs(_1242);
    float _1250 = trunc(_1228);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    int _1256 = ~_1216;
    int _1258 = _1256 + _1246;
    int _1260 = _1258 + 1;
    int _1262 = ~_1206;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    int _1268 = ~_1097;
    int _1270 = _1268 + 1;
    int _1272 = _1047 * _1260;
    int _1274 = _1272 + _1081;
    int _1276 = _1220 * _1248;
    int _1278 = _1276 + _1081;
    bool _1280 = !_1105;
    int _1282 = _1280 ? _1274 : (-1);
    int _1284 = int(_1188) + int(_1254);
    int _1286 = _1282 * _1266;
    int _1288 = _1047 + (-1);
    float _1290 = floor(_1113);
    int _1292 = _1270 * _1284;
    int _1294 = _1292 + _1119;
    float _1296 = float(_1119);
    int _1298 = _1206 * _1288;
    int _1300 = _1298 + _1286;
    float _1302 = float(_1097);
    int _1304 = abs(_463);
    int _1306 = _1300 * _1073;
    bool _1308 = _1296 >= _1302;
    bool _1310 = isnan(_1296);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan(_1302);
    bool _1316 = _1312 || _1314;
    float _1318 = float(_1316);
    int _1320 = abs(_457);
    bool _1322 = uint(_1294) >= uint(_1097);
    float _1324 = trunc(_1318);
    int _1326 = int(_1324);
    bool _1328 = !_1322;
    int _1330 = _1328 ? 0 : (-1);
    int _1332 = _1236 * _1304;
    int _1334 = _1332 + _1306;
    bool _1336 = !_1145;
    int _1338 = _1336 ? 0 : 1;
    float _1340 = -_1290;
    float _1342 = _1113 + _1340;
    int _1344 = ~_1284;
    int _1346 = _1344 + _1330;
    int _1348 = _1346 + 1;
    int _1350 = _1278 * _1320;
    int _1352 = _1350 + _1334;
    int _1354 = abs(_1338);
    float _1356 = _1342 * _1302;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1360 = _1358 != 0;
    int _1362 = _1097 * _1348;
    int _1364 = _1362 + _1119;
    float _1366 = _1302 * _449;
    bool _1368 = !_1360;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = trunc(_1356);
    int _1374 = int(_1372);
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1378 = _1376 != 0;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1382 = _1380 != 0;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1386 = _1384 != 0;
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1390 = _1388 != 0;
    int _1392 = _1220 * _1354;
    int _1394 = _1392 + _1352;
    int _1396 = ~_1326;
    int _1398 = _1396 + 1;
    int _1400 = _1398 + 1;
    bool _1402 = !_1125;
    int _1404 = _1402 ? _1364 : (-1);
    bool _1406 = !_1382;
    int _1408 = _1406 ? 0 : 1;
    float _1410 = trunc(_1366);
    int _1412 = int(_1410);
    float _1414 = float(uint(_1394));
    int _1416 = _1404 * _1400;
    int _1418 = abs(_1370);
    int _1420 = _1097 + (-1);
    float _1422 = as_type<float>(_1127) * _1414;
    bool _1424 = !_1378;
    int _1426 = _1424 ? 0 : 1;
    int _1428 = abs(_1408);
    int _1430 = _1326 * _1420;
    int _1432 = _1430 + _1416;
    int _1434 = abs(_1426);
    float _1436 = trunc(_1422);
    float _1438 = precise::max(_1436, 0.0);
    uint _1440 = uint(_1438);
    int _1442 = _1374 * _1418;
    int _1444 = _1442 + _1119;
    bool _1446 = !_1386;
    int _1448 = _1446 ? 0 : 1;
    int _1450 = _1432 * _1428;
    int _1452 = ~_1047;
    int _1454 = _1452 + 1;
    float _1456 = float(uint(_1278));
    int _1458 = _1412 * _1434;
    int _1460 = _1458 + _1450;
    bool _1462 = !_1390;
    int _1464 = _1462 ? 0 : 1;
    int _1466 = abs(_1448);
    float _1468 = as_type<float>(_1127) * _1456;
    int _1470 = abs(_1464);
    int _1472 = _1444 * _1466;
    int _1474 = _1472 + _1460;
    float _1476 = trunc(_1468);
    float _1478 = precise::max(_1476, 0.0);
    uint _1480 = uint(_1478);
    int _1482 = _1454 * int(_1440);
    int _1484 = _1482 + _1394;
    float _1486 = float(uint(_1444));
    int _1488 = _1374 * _1470;
    int _1490 = _1488 + _1474;
    int _1492 = ~_1097;
    int _1494 = _1492 + 1;
    float _1496 = float(uint(_1484));
    float _1498 = as_type<float>(_1156) * _1486;
    float _1500 = float(uint(_1490));
    int _1502 = ~_1047;
    int _1504 = _1502 + 1;
    float _1506 = trunc(_1498);
    float _1508 = precise::max(_1506, 0.0);
    uint _1510 = uint(_1508);
    float _1512 = as_type<float>(_1127) * _1496;
    float _1514 = as_type<float>(_1156) * _1500;
    int _1516 = _1504 * int(_1480);
    int _1518 = _1516 + _1278;
    float _1520 = trunc(_1512);
    float _1522 = precise::max(_1520, 0.0);
    uint _1524 = uint(_1522);
    int _1526 = ~_1097;
    int _1528 = _1526 + 1;
    float _1530 = float(uint(_1518));
    float _1532 = trunc(_1514);
    float _1534 = precise::max(_1532, 0.0);
    uint _1536 = uint(_1534);
    int _1538 = _1494 * int(_1510);
    int _1540 = _1538 + _1444;
    float _1542 = as_type<float>(_1127) * _1530;
    int _1544 = ~_1047;
    int _1546 = _1544 + 1;
    float _1548 = float(uint(_1540));
    float _1550 = trunc(_1542);
    float _1552 = precise::max(_1550, 0.0);
    uint _1554 = uint(_1552);
    int _1556 = int(_1440) + int(_1524);
    float _1558 = as_type<float>(_1156) * _1548;
    int _1560 = _1528 * int(_1536);
    int _1562 = _1560 + _1490;
    float _1564 = trunc(_1558);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = _1546 * _1556;
    int _1572 = _1570 + _1394;
    float _1574 = float(uint(_1562));
    bool _1576 = uint(_1572) >= uint(_1047);
    int _1578 = int(_1480) + int(_1554);
    float _1580 = as_type<float>(_1156) * _1574;
    bool _1582 = !_1576;
    int _1584 = _1582 ? 0 : (-1);
    int _1586 = ~_1097;
    int _1588 = _1586 + 1;
    float _1590 = trunc(_1580);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    int _1596 = ~_1556;
    int _1598 = _1596 + _1584;
    int _1600 = _1598 + 1;
    int _1602 = int(_1510) + int(_1568);
    int _1604 = _1047 * _1600;
    int _1606 = _1604 + _1394;
    int _1608 = ~_1047;
    int _1610 = _1608 + 1;
    int _1612 = _1588 * _1602;
    int _1614 = _1612 + _1444;
    int _1616 = ~_1097;
    int _1618 = _1616 + 1;
    bool _1620 = !_1105;
    int _1622 = _1620 ? _1606 : (-1);
    int _1624 = _1610 * _1578;
    int _1626 = _1624 + _1278;
    int _1628 = _1622 & 3;
    bool _1630 = _1628 != 0;
    int _1632 = int(_1536) + int(_1594);
    int _1634 = _1622 & 3;
    bool _1636 = _1634 != 0;
    int _1638 = _1630 ? 0 : 1;
    int _1640 = _1618 * _1632;
    int _1642 = _1640 + _1490;
    bool _1644 = uint(_1634) >= 2u;
    bool _1646 = uint(_1626) >= uint(_1047);
    int _1648 = _1644 ? 0 : 1;
    bool _1650 = uint(_1642) >= uint(_1097);
    bool _1652 = uint(_1634) > 1u;
    bool _1654 = !_1646;
    int _1656 = _1654 ? 0 : (-1);
    bool _1658 = !_1650;
    int _1660 = _1658 ? 0 : (-1);
    int _1662 = ~_1578;
    int _1664 = _1662 + _1656;
    int _1666 = _1664 + 1;
    int _1668 = ~_1632;
    int _1670 = _1668 + _1660;
    int _1672 = _1670 + 1;
    bool _1674 = _235 > 0.5;
    int _1676 = _1047 * _1666;
    int _1678 = _1676 + _1278;
    int _1680 = ~_1638;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    int _1686 = _1097 * _1672;
    int _1688 = _1686 + _1490;
    int _1690 = _1684;
    if (!_1652)
    {
        int _1692 = ~_1638;
        int _1694 = _1692 + 1;
        _1690 = _1694;
    }
    int _1696 = _1690;
    float _1698 = -_197;
    int _1700 = _1674 ? as_type<int>(_1698) : as_type<int>(_197);
    int _1702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1704 = _1702 != 0;
    bool _1706 = !_1125;
    int _1708 = _1706 ? _1688 : (-1);
    bool _1710 = _1634 != 3;
    bool _1712 = !_1105;
    int _1714 = _1712 ? _1678 : (-1);
    int _1716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1718 = _1716 != 0;
    bool _1720 = !_1704;
    int _1722 = _1720 ? 0 : 1;
    int _1724 = _1622 >> 31;
    int _1726 = _1708 & 3;
    bool _1728 = _1726 != 0;
    int _1730 = _1708 >> 31;
    bool _1732 = !_1718;
    int _1734 = _1732 ? 0 : 1;
    int _1736 = _1724 & 3;
    bool _1738 = uint(_1614) >= uint(_1097);
    int _1740 = _1708 & 3;
    bool _1742 = _1740 != 0;
    bool _1744 = !_1728;
    float _1746 = _1744 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1748 = _1730 & 3;
    bool _1750 = uint(_1726) > 1u;
    int _1752 = _1622 + _1736;
    bool _1754 = !_1738;
    int _1756 = _1754 ? 0 : (-1);
    int _1758 = _1742 ? 0 : 1;
    int _1760 = _1708 + _1748;
    int _1762 = ~_1648;
    int _1764 = _1762 + 1;
    int _1766 = _1764 + 1;
    bool _1768 = _1634 != 3;
    int _1770 = _1766;
    float _1772 = _1746;
    if (_1710)
    {
        int _1774 = ~_1648;
        int _1776 = _1774 + 1;
        _1770 = _1776;
    }
    int _1778 = _1770;
    bool _1780 = !_1636;
    int _1782 = _1780 ? 0 : 1;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1786 = _1784 != 0;
    int _1788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1790 = _1788 != 0;
    int _1792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1794 = _1792 != 0;
    int _1796 = _1752 >> 2;
    int _1798 = ~_1602;
    int _1800 = _1798 + _1756;
    int _1802 = _1800 + 1;
    int _1804 = _1760 >> 2;
    bool _1806 = !_1768;
    int _1808 = _1806 ? 0 : (-1);
    int _1810 = _1097 * _1802;
    int _1812 = _1810 + _1444;
    bool _1814 = uint(_1726) >= 2u;
    int _1816 = _1796 << 4;
    int _1818 = _1816 + 368;
    int _1820 = _1804 << 4;
    int _1822 = _1820 + 512;
    int _1824 = ~_1758;
    int _1826 = _1824 + 1;
    int _1828 = _1826 + 1;
    uint _1830 = uint(int(uint(_1818) >> uint(2)));
    uint _1832 = uint(int(uint(int(_1830)) >> uint(2)));
    int _1834 = int(_1830) & 3;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[int(_1832)][_1834];
    int _1838 = int(_1830) + 1;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    int _1842 = _1838 & 3;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[int(_1840)][_1842];
    int _1846 = _1828;
    if (!_1750)
    {
        int _1848 = ~_1758;
        int _1850 = _1848 + 1;
        _1846 = _1850;
    }
    int _1852 = _1846;
    int _1854 = _1814 ? 0 : 1;
    bool _1856 = _1726 != 3;
    bool _1858 = _1726 != 3;
    int _1860 = _1818 + 8;
    uint _1862 = uint(int(uint(_1860) >> uint(2)));
    uint _1864 = uint(int(uint(int(_1862)) >> uint(2)));
    int _1866 = int(_1862) & 3;
    float _1868 = (*spvDescriptorSet0.vp_c9)._m0[int(_1864)][_1866];
    int _1870 = int(_1862) + 1;
    uint _1872 = uint(int(uint(_1870) >> uint(2)));
    int _1874 = _1870 & 3;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[int(_1872)][_1874];
    int _1878 = ~_1854;
    int _1880 = _1878 + 1;
    int _1882 = _1880 + 1;
    bool _1884 = !_1125;
    int _1886 = _1884 ? _1812 : (-1);
    uint _1888 = uint(int(uint(_1822) >> uint(2)));
    uint _1890 = uint(int(uint(int(_1888)) >> uint(2)));
    int _1892 = int(_1888) & 3;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[int(_1890)][_1892];
    int _1896 = int(_1888) + 1;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    int _1900 = _1896 & 3;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[int(_1898)][_1900];
    int _1904 = _1882;
    if (_1856)
    {
        int _1906 = ~_1854;
        int _1908 = _1906 + 1;
        _1904 = _1908;
    }
    int _1910 = _1904;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1914 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1916 = _1914 != 0;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1920 = _1822 + 8;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    uint _1924 = uint(int(uint(int(_1922)) >> uint(2)));
    int _1926 = int(_1922) & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = int(_1922) + 1;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    int _1934 = _1930 & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    float _1938 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1940 = abs(_1852);
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1944 = abs(_1696);
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1948 = abs(_1782);
    float _1950 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1952 = !_1858;
    int _1954 = _1952 ? 0 : (-1);
    float _1956 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1958 = _229 > 0.5;
    bool _1960 = _231 > 0.5;
    out.m_82.x = _1950;
    out.m_82.y = _1938;
    out.m_82.z = _1956;
    out.m_82.w = _1918;
    int _1962 = ~_1944;
    int _1964 = _1962 + 1;
    int _1966 = _1964 + 1;
    float _1968 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1970 = -_193;
    int _1972 = _1958 ? as_type<int>(_1970) : as_type<int>(_193);
    float _1974 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1976 = _233 > 0.5;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1980 = _1966 * as_type<int>(_1844);
    int _1982 = abs(_1778);
    float _1984 = _1968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1986 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1988 = int(_1986);
    float _1990 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1992 = abs(as_type<int>(_1746));
    if (_939)
    {
        float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1996 = _1023 + _1994;
        _1772 = _1996;
    }
    float _1998 = _1772;
    int _2000 = ~_1940;
    int _2002 = _2000 + 1;
    int _2004 = _2002 + 1;
    int _2006 = ~_1948;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    out.m_84.x = _1974;
    out.m_84.y = _1984;
    out.m_84.z = _1990;
    int _2012 = ~_1992;
    int _2014 = _2012 + 1;
    int _2016 = _2014 + 1;
    int _2018 = _2004 * as_type<int>(_1902);
    int _2020 = abs(_1808);
    int _2022 = _2010 * as_type<int>(_1836);
    int _2024 = _2022 + _1980;
    int _2026 = abs(_1954);
    int _2028 = _2016 * as_type<int>(_1894);
    int _2030 = _2028 + _2018;
    float _2032 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2034 = int(_2032);
    int _2036 = abs(_1910);
    float _2038 = _843 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2040 = ~_1982;
    int _2042 = _2040 + 1;
    int _2044 = _2042 + 1;
    float _2046 = _853 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2048 = _843 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2050 = float(uint(_1988));
    int _2052 = _2044 * as_type<int>(_1868);
    int _2054 = _2052 + _2024;
    int _2056 = ~_2020;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    float _2062 = _853 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2064 = ~_2036;
    int _2066 = _2064 + 1;
    int _2068 = _2066 + 1;
    if (_939)
    {
        float _2070 = _1998 * _1998;
        _961 = _2070;
    }
    float _2072 = _961;
    float _2074 = 1.0 / _2050;
    int _2076 = _2060 * as_type<int>(_1876);
    int _2078 = _2076 + _2054;
    int _2080 = abs(_1722);
    int _2082 = _2068 * as_type<int>(_1928);
    int _2084 = _2082 + _2030;
    int _2086 = abs(_1988);
    int _2088 = ~_2080;
    int _2090 = _2088 + 1;
    int _2092 = _2090 + 1;
    int _2094 = ~_2026;
    int _2096 = _2094 + 1;
    int _2098 = _2096 + 1;
    float _2100 = float(uint(_2034));
    int _2102 = _2078 * _2092;
    int _2104 = _2098 * as_type<int>(_1936);
    int _2106 = _2104 + _2084;
    int _2108 = abs(_1734);
    float _2110 = _843 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2112 = _1714 * _2080;
    int _2114 = _2112 + _2102;
    float _2116 = 1.0 / _2100;
    float _2118 = float(uint(_2086));
    float _2120 = -_833;
    float _2122 = fma(_2120, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2038);
    int _2124 = abs(_2034);
    float _2126 = -_833;
    float _2128 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2110);
    int _2130 = as_type<int>(_2074) + (-2);
    float _2132 = _861 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2134 = float(uint(_2114));
    float _2136 = 1.0 / _2118;
    float _2138 = -_833;
    float _2140 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2048);
    int _2142 = ~_2108;
    int _2144 = _2142 + 1;
    int _2146 = _2144 + 1;
    float _2148 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2122);
    float _2150 = float(uint(_2124));
    float _2152 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2140);
    float _2154 = fma(_845, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2128);
    float _2156 = _853 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2158 = as_type<float>(_2130) * _2134;
    int _2160 = _2106 * _2146;
    float _2162 = 1.0 / _2150;
    float _2164 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2156);
    int _2166 = abs(_2114);
    int _2168 = _1886 * _2108;
    int _2170 = _2168 + _2160;
    float _2172 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2046);
    float _2174 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2062);
    int _2176 = as_type<int>(_2116) + (-2);
    float _2178 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2164);
    float _2180 = trunc(_2158);
    float _2182 = precise::max(_2180, 0.0);
    uint _2184 = uint(_2182);
    float _2186 = float(uint(_2170));
    int _2188 = abs(_2170);
    float _2190 = as_type<float>(_2176) * _2186;
    float _2192 = float(uint(_2166));
    float _2194 = as_type<float>(_2106);
    if (_939)
    {
        float _2196 = _983 * 6.283185482025146484375;
        float _2198 = cos(_2196);
        _2194 = _2198;
    }
    float _2200 = _2194;
    int _2202 = ~_1988;
    int _2204 = _2202 + 1;
    float _2206 = _861 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2208 = as_type<int>(_2162) + (-2);
    float _2210 = float(uint(_2188));
    bool _2212 = !_1786;
    float _2214 = _2212 ? _197 : as_type<float>(_1700);
    float _2216 = trunc(_2190);
    float _2218 = precise::max(_2216, 0.0);
    uint _2220 = uint(_2218);
    int _2222 = as_type<int>(_2136) + (-2);
    float _2224 = _861 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2226 = !_1916;
    float _2228 = _2226 ? _193 : as_type<float>(_1972);
    bool _2230 = _2034 == 0;
    float _2232 = as_type<float>(_2222) * _2192;
    float _2234 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2206);
    int _2236 = _2204 * int(_2184);
    int _2238 = _2236 + _2114;
    float _2240 = as_type<float>(_2208) * _2210;
    float _2242 = trunc(_2232);
    float _2244 = precise::max(_2242, 0.0);
    uint _2246 = uint(_2244);
    float _2248 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2224);
    float _2250 = fma(_847, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2132);
    float _2252 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    float _2254 = float(uint(_2238));
    float _2256 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2248);
    float _2258 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2250);
    int _2260 = ~_2086;
    int _2262 = _2260 + 1;
    float _2264 = trunc(_2240);
    float _2266 = precise::max(_2264, 0.0);
    uint _2268 = uint(_2266);
    int _2270 = ~_2034;
    int _2272 = _2270 + 1;
    float _2274 = as_type<float>(_2130) * _2254;
    float _2276 = as_type<float>(_2262);
    if (_939)
    {
        float _2278 = _2200 + (-1.0);
        _2276 = _2278;
    }
    float _2280 = _2276;
    int _2282 = ~_2124;
    int _2284 = _2282 + 1;
    int _2286 = _2272 * int(_2220);
    int _2288 = _2286 + _2170;
    int _2290 = _2262 * int(_2246);
    int _2292 = _2290 + _2166;
    float _2294 = _2280;
    if (_939)
    {
        float _2296 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2294 = _2296;
    }
    float _2298 = _2294;
    float _2300 = trunc(_2274);
    float _2302 = precise::max(_2300, 0.0);
    uint _2304 = uint(_2302);
    float _2306 = float(uint(_2288));
    float _2308 = float(uint(_2292));
    if (_939)
    {
        float _2310 = fma(_1001, _2200, _2298);
        _1003 = _2310;
    }
    float _2312 = _1003;
    float _2314 = -_197;
    int _2316 = _1960 ? as_type<int>(_2314) : as_type<int>(_197);
    int _2318 = _2284 * int(_2268);
    int _2320 = _2318 + _2188;
    float _2322 = as_type<float>(_2222) * _2308;
    bool _2324 = !_1790;
    float _2326 = _2324 ? _197 : as_type<float>(_2316);
    float _2328 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2330 = float(uint(_2320));
    float _2332 = as_type<float>(_2176) * _2306;
    float _2334 = -_193;
    int _2336 = _1976 ? as_type<int>(_2334) : as_type<int>(_193);
    float _2338 = trunc(_2322);
    float _2340 = precise::max(_2338, 0.0);
    uint _2342 = uint(_2340);
    float _2344 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    float _2346 = as_type<float>(_2208) * _2330;
    bool _2348 = !_1794;
    float _2350 = _2348 ? _193 : as_type<float>(_2336);
    float _2352 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2354 = _2328 * _2152;
    float _2356 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2174);
    float _2358 = _2328 * _2154;
    float _2360 = trunc(_2332);
    float _2362 = precise::max(_2360, 0.0);
    uint _2364 = uint(_2362);
    float _2366 = fma(_2352, _2178, _2354);
    float _2368 = _2354;
    if (_939)
    {
        float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2372 = _1029 + _2370;
        _2368 = _2372;
    }
    float _2374 = _2368;
    float _2376 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2378 = _2312 + _2376;
    out.m_86.x = _2178;
    out.m_86.y = _2344;
    out.m_86.z = _2356;
    if (_939)
    {
        float _2380 = _2374 * _2374;
        _963 = _2380;
    }
    float _2382 = _963;
    int _2384 = int(_2184) + int(_2304);
    float _2386 = trunc(_2346);
    float _2388 = precise::max(_2386, 0.0);
    uint _2390 = uint(_2388);
    float _2392 = _2328 * _2148;
    int _2394 = ~_1988;
    int _2396 = _2394 + 1;
    float _2398 = fma(_2378, _2378, _2072);
    bool _2400 = _2034 == 0;
    float _2402 = fma(_2352, _2344, _2392);
    float _2404 = fma(_2352, _2356, _2358);
    int _2406 = ~_2086;
    int _2408 = _2406 + 1;
    int _2410 = int(_2220) + int(_2364);
    int _2412 = ~_2034;
    int _2414 = _2412 + 1;
    int _2416 = int(_2246) + int(_2342);
    int _2418 = int(_2268) + int(_2390);
    int _2420 = _2396 * _2384;
    int _2422 = _2420 + _2114;
    int _2424 = ~_2124;
    int _2426 = _2424 + 1;
    int _2428 = _2408 * _2416;
    int _2430 = _2428 + _2166;
    float _2432 = _2398 + _2382;
    int _2434 = _2414 * _2410;
    int _2436 = _2434 + _2170;
    bool _2438 = uint(_2422) >= uint(_1988);
    int _2440 = _2426 * _2418;
    int _2442 = _2440 + _2188;
    float _2444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2446 = uint(_2430) >= uint(_2086);
    bool _2448 = uint(_2436) >= uint(_2034);
    bool _2450 = !_2438;
    int _2452 = _2450 ? 0 : (-1);
    bool _2454 = !_2448;
    int _2456 = _2454 ? 0 : (-1);
    float _2458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2460 = ~_2384;
    int _2462 = _2460 + _2452;
    int _2464 = _2462 + 1;
    bool _2466 = uint(_2442) >= uint(_2124);
    int _2468 = ~_2410;
    int _2470 = _2468 + _2456;
    int _2472 = _2470 + 1;
    int _2474 = _1988 * _2464;
    int _2476 = _2474 + _2114;
    int _2478 = _2114 ^ _1988;
    float _2480 = sqrt(_2432);
    bool _2482 = !_2466;
    int _2484 = _2482 ? 0 : (-1);
    int _2486 = _2034 * _2472;
    int _2488 = _2486 + _2170;
    bool _2490 = !_2446;
    int _2492 = _2490 ? 0 : (-1);
    uint _2494 = uint(int(uint(_2478) >> uint(31)));
    bool _2496 = _1988 == 0;
    float _2498 = _2458 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2500 = _1988 == 0;
    float _2502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2504 = _2170 ^ _2034;
    int _2506 = ~_2484;
    int _2508 = _2418 + _2506;
    int _2510 = _2508 + 1;
    int _2512 = ~_2492;
    int _2514 = _2416 + _2512;
    int _2516 = _2514 + 1;
    float _2518 = fma(_2328, _2328, 1.0);
    int _2520 = ~int(_2494);
    int _2522 = _2520 + 1;
    float _2524 = _2444 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2526 = !_2496;
    int _2528 = _2526 ? _2476 : (-1);
    float _2530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2532 = uint(int(uint(_2504) >> uint(31)));
    int _2534 = _2516 ^ _2522;
    float _2536 = float(_2528);
    int _2538 = ~int(_2532);
    int _2540 = _2538 + 1;
    int _2542 = ~_2522;
    int _2544 = _2542 + _2534;
    int _2546 = _2544 + 1;
    float _2548 = fma(_2524, _2536, _547);
    bool _2550 = !_2230;
    int _2552 = _2550 ? _2488 : (-1);
    float _2554 = rsqrt(_2518);
    int _2556 = _2510 ^ _2540;
    float _2558 = float(_2552);
    float _2560 = _2502 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2562 = ~_2540;
    int _2564 = _2562 + _2556;
    int _2566 = _2564 + 1;
    float _2568 = _2228 + 0.5;
    bool _2570 = !_2500;
    int _2572 = _2570 ? _2546 : (-1);
    float _2574 = fma(_2560, _2558, _641);
    bool _2576 = !_2400;
    int _2578 = _2576 ? _2566 : (-1);
    float _2580 = fma(_2524, _2568, _2548);
    float _2582 = float(_2572);
    float _2584 = _2350 + 0.5;
    float _2586 = float(_2578);
    float _2588 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2590 = -_1077;
    float _2592 = fma(_2228, _2590, _2580);
    float _2594 = -_619;
    float _2596 = fma(_2498, _2582, _2594);
    float _2598 = _2326 + (-0.5);
    float _2600 = fma(_2560, _2584, _2574);
    float _2602 = _2328 * _2554;
    float _2604 = -_659;
    float _2606 = fma(_2588, _2586, _2604);
    float _2608 = _2214 + (-0.5);
    float _2610 = -_2498;
    float _2612 = fma(_2610, _2598, _2596);
    float _2614 = -_2252;
    float _2616 = _2602 * _2614;
    float _2618 = -_2256;
    float _2620 = _2602 * _2618;
    float _2622 = -_2258;
    float _2624 = _2602 * _2622;
    float _2626 = -_2588;
    float _2628 = fma(_2626, _2608, _2606);
    float _2630 = fma(_2554, _2148, _2616);
    float _2632 = fma(_2554, _2152, _2620);
    float _2634 = -_1061;
    float _2636 = fma(_2350, _2634, _2600);
    float _2638 = fma(_2554, _2154, _2624);
    float _2640 = _2256 + _2366;
    float _2642 = fma(_2326, _1085, _2612);
    float _2644 = fma(_2214, _1089, _2628);
    float _2646 = _2252 + _2402;
    float _2648 = _2258 + _2404;
    out.m_88.x = _2632;
    out.m_88.y = _2630;
    out.m_88.z = _2638;
    bool _2650 = _2480 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2652 = isnan(_2480);
    bool _2654 = _2650 || _2652;
    bool _2656 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2658 = _2654 || _2656;
    out.m_90.x = _2592;
    out.m_90.y = _2642;
    out.m_90.z = _2636;
    out.m_90.w = _2644;
    out.m_92.x = _1039;
    out.m_92.y = _1041;
    out.m_92.z = _1043;
    out.m_94.x = _2640;
    out.m_94.y = _2646;
    out.m_94.z = _2648;
    float _2660 = _2518;
    float _2662 = as_type<float>(_2422);
    float _2664 = as_type<float>(_2540);
    if (!_2658)
    {
        _1133 = 1.0;
    }
    float _2666 = _1133;
    bool _2668 = !_2658;
    float _2670 = _2666;
    if (!_2668)
    {
        bool _2672 = _2480 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2674 = isnan(_2480);
        bool _2676 = _2672 || _2674;
        bool _2678 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2680 = _2676 || _2678;
        if (!_2680)
        {
            float _2682 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2684 = _2480 + _2682;
            float _2686 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2688 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2686;
            float _2690 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2692 = _2690 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2694 = 1.0 / _2688;
            float _2696 = _2684 * _2694;
            float _2698 = fma(_2696, _2692, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2670 = _2698;
            _2700 = true;
        }
        else
        {
            bool _2702 = _2480 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2704 = isnan(_2480);
            bool _2706 = _2702 || _2704;
            bool _2708 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2710 = _2706 || _2708;
            if (!_2710)
            {
                float _2712 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2714 = _2480 + _2712;
                float _2716 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2718 = _2716 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2720 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2722 = _2720 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2724 = 1.0 / _2718;
                float _2726 = _2714 * _2724;
                float _2728 = fma(_2726, _2722, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2670 = _2728;
                _2700 = true;
            }
            else
            {
                _2670 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2700 = false;
    float _2730 = _2670;
    float _2732 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2734 = _2312 + _2732;
    float _2736 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2738 = _1023 + _2736;
    float _2740 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2742 = _1029 + _2740;
    float _2744 = fma(_2734, _2730, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2746 = fma(_2738, _2730, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2748 = fma(_2742, _2730, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2750 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2752 = _2744 + _2750;
    float _2754 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2756 = _2746 + _2754;
    float _2758 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2760 = _2748 + _2758;
    float _2762 = _2752 * _2752;
    float _2764 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2766 = fma(_2756, _2756, _2762);
    float _2768 = _987 + _2764;
    float _2770 = fma(_2760, _2760, _2766);
    float _2772 = _987 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2774 = rsqrt(_2770);
    float _2776 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2772);
    float _2778 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2776);
    float _2780 = sqrt(_2770);
    float _2782 = _2778 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2784 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2786 = _987 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2788 = _2756 * _2784;
    float _2790 = _2760 * _2784;
    float _2792 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2786);
    float _2794 = _2788 * _2788;
    float _2796 = _2790 * _2790;
    float _2798 = 1.0 / _2782;
    float _2800 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2792);
    float _2802 = _2794 + _2796;
    float _2804 = _2800 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2806 = sqrt(_2802);
    float _2808 = _2804 + _2782;
    float _2810 = _2808 * _2798;
    float _2812 = _2810 * 0.5;
    float _2814 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2816 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2814);
    float _2818 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2820 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _2822 = _2806 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2826 = _2806 + _2824;
    float _2828 = 1.0 / _2816;
    float _2830 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2820);
    float _2832 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2834 = fma(_899, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2830);
    float _2836 = floor(_2818);
    float _2838 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2840 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    int _2842 = 2;
    float _2844 = _2784;
    float _2846 = _2788;
    float _2848 = _2794;
    if (_2822)
    {
        float _2850 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2840 = _2850;
    }
    float _2852 = _2840;
    float _2854 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2856 = _2828 * _2854;
    float _2858 = fma(_897, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2832);
    bool _2860 = _2856 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2862 = fma(_899, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2858);
    bool _2864 = _2856 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2866 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2868 = trunc(_2838);
    int _2870 = int(_2868);
    float _2872 = _2862 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2874 = -_2836;
    float _2876 = _2818 + _2874;
    float _2878 = precise::max(0.0, _2866);
    float _2880 = _2862;
    int _2882 = as_type<int>(_2872);
    if (_2822)
    {
        float _2884 = _2826 * _2852;
        _2880 = _2884;
    }
    float _2886 = _2880;
    float _2888 = trunc(_2872);
    int _2890 = int(_2888);
    if (!_2860)
    {
        _2842 = 1;
    }
    int _2892 = _2842;
    int _2894 = _2892;
    if (_2822)
    {
        float _2896 = _2886 * 0.15915493667125701904296875;
        _1025 = _2896;
    }
    float _2898 = _1025;
    bool _2900 = !_2860;
    int _2902 = _2900 ? 0 : 1;
    float _2904 = -_2784;
    float _2906 = -_2878;
    float _2908 = fma(_2752, _2904, _2906);
    if (!_2864)
    {
        _2894 = _2902;
    }
    int _2910 = _2894;
    float _2912 = _2834;
    float _2914 = as_type<float>(_2910);
    if (_2822)
    {
        float _2916 = _2898 * 6.283185482025146484375;
        float _2918 = sin(_2916);
        _2912 = _2918;
    }
    float _2920 = _2912;
    if (_2822)
    {
        float _2922 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2844 = _2922;
    }
    float _2924 = _2844;
    int _2926 = _2910 << 6;
    int _2928 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2930 = _2870 + _2928;
    int _2932 = _2930 + 1;
    float _2934 = fma(_899, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    int _2936 = _2926 + 48;
    uint _2938 = uint(int(uint(_2936) >> uint(2)));
    uint _2940 = uint(int(uint(int(_2938)) >> uint(2)));
    int _2942 = int(_2938) & 3;
    float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
    int _2946 = int(_2938) + 1;
    uint _2948 = uint(int(uint(_2946) >> uint(2)));
    int _2950 = _2946 & 3;
    float _2952 = (*spvDescriptorSet0.vp_c15)._m0[int(_2948)][_2950];
    float _2954 = _2802;
    if (_2822)
    {
        float _2956 = rsqrt(_2802);
        _2954 = _2956;
    }
    float _2958 = _2954;
    int _2960 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2962 = _2890 + _2960;
    int _2964 = _2962 + 1;
    bool _2966 = _2932 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2968 = _2932 | _2964;
    int _2970 = _2926 + 96;
    uint _2972 = uint(int(uint(_2970) >> uint(2)));
    uint _2974 = uint(int(uint(int(_2972)) >> uint(2)));
    int _2976 = int(_2972) & 3;
    float _2978 = (*spvDescriptorSet0.vp_c15)._m0[int(_2974)][_2976];
    int _2980 = int(_2972) + 1;
    uint _2982 = uint(int(uint(_2980) >> uint(2)));
    int _2984 = _2980 & 3;
    float _2986 = (*spvDescriptorSet0.vp_c15)._m0[int(_2982)][_2984];
    if (_2822)
    {
        float _2988 = fma(_2920, _2924, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2660 = _2988;
    }
    float _2990 = _2660;
    float _2992 = _2898;
    float _2994 = _2990;
    if (_2822)
    {
        float _2996 = _2898 * 6.283185482025146484375;
        float _2998 = cos(_2996);
        _2992 = _2998;
    }
    float _3000 = _2992;
    float _3002 = _2744 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _3004 = _2968 < 0;
    bool _3006 = _3004 || _2966;
    float _3008 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3002);
    int _3010 = _2926 + 56;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    uint _3014 = uint(int(uint(int(_3012)) >> uint(2)));
    int _3016 = int(_3012) & 3;
    float _3018 = (*spvDescriptorSet0.vp_c15)._m0[int(_3014)][_3016];
    int _3020 = int(_3012) + 1;
    uint _3022 = uint(int(uint(_3020) >> uint(2)));
    int _3024 = _3020 & 3;
    float _3026 = (*spvDescriptorSet0.vp_c15)._m0[int(_3022)][_3024];
    float _3028 = _2958;
    if (_2822)
    {
        float _3030 = _2958 * _2990;
        _2662 = _3030;
    }
    float _3032 = _2662;
    float _3034 = floor(_2934);
    bool _3036 = _2964 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3038 = _3036 || _3006;
    float _3040 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3008);
    float _3042 = _3040;
    if (_2822)
    {
        float _3044 = _2788 * _3032;
        _2846 = _3044;
    }
    float _3046 = _2846;
    if (!_2822)
    {
        _2994 = _2908;
    }
    float _3048 = _2994;
    int _3050 = _2926 + 104;
    uint _3052 = uint(int(uint(_3050) >> uint(2)));
    uint _3054 = uint(int(uint(int(_3052)) >> uint(2)));
    int _3056 = int(_3052) & 3;
    float _3058 = (*spvDescriptorSet0.vp_c15)._m0[int(_3054)][_3056];
    int _3060 = int(_3052) + 1;
    uint _3062 = uint(int(uint(_3060) >> uint(2)));
    int _3064 = _3060 & 3;
    float _3066 = (*spvDescriptorSet0.vp_c15)._m0[int(_3062)][_3064];
    float _3068 = _3048;
    if (_2822)
    {
        float _3070 = _3046 * _3046;
        _2848 = _3070;
    }
    float _3072 = _2848;
    if (_2822)
    {
        float _3074 = _3000 + (-1.0);
        _3028 = _3074;
    }
    float _3076 = _3028;
    float _3078 = _3076;
    if (_2822)
    {
        float _3080 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1049 = _3080;
    }
    float _3082 = _1049;
    if (!_2822)
    {
        _3078 = _2790;
    }
    float _3084 = _3078;
    int _3086 = _2926 + 64;
    uint _3088 = uint(int(uint(_3086) >> uint(2)));
    uint _3090 = uint(int(uint(int(_3088)) >> uint(2)));
    int _3092 = int(_3088) & 3;
    float _3094 = (*spvDescriptorSet0.vp_c15)._m0[int(_3090)][_3092];
    int _3096 = int(_3088) + 1;
    uint _3098 = uint(int(uint(_3096) >> uint(2)));
    int _3100 = _3096 & 3;
    float _3102 = (*spvDescriptorSet0.vp_c15)._m0[int(_3098)][_3100];
    float _3104 = _3084;
    if (_2822)
    {
        float _3106 = _2790 * _3032;
        _3104 = _3106;
    }
    float _3108 = _3104;
    float _3110 = _3040 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_2822)
    {
        float _3112 = fma(_2908, _3000, _3082);
        _3068 = _3112;
    }
    float _3114 = _3068;
    if (!_2822)
    {
        _3042 = _2796;
    }
    float _3116 = _3042;
    float _3118 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3120 = _3110 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3122 = fma(_3114, _3114, _3072);
    int _3124 = _2926 + 80;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    uint _3128 = uint(int(uint(int(_3126)) >> uint(2)));
    int _3130 = int(_3126) & 3;
    float _3132 = (*spvDescriptorSet0.vp_c15)._m0[int(_3128)][_3130];
    int _3134 = int(_3126) + 1;
    uint _3136 = uint(int(uint(_3134) >> uint(2)));
    int _3138 = _3134 & 3;
    float _3140 = (*spvDescriptorSet0.vp_c15)._m0[int(_3136)][_3138];
    float _3142 = -_3034;
    float _3144 = _2934 + _3142;
    float _3146 = -_3120;
    float _3148 = fma(_3146, _3118, 1.0);
    int _3150 = as_type<int>(_3120);
    float _3152 = _3116;
    if (!_3038)
    {
        int _3154 = _2964 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3156 = _3154 + _2932;
        _3150 = _3156;
    }
    int _3158 = _3150;
    if (_2822)
    {
        float _3160 = _3108 * _3108;
        _3152 = _3160;
    }
    float _3162 = _3152;
    if (!_3038)
    {
        float _3164 = floor(_2872);
        _2664 = _3164;
    }
    float _3166 = _2664;
    int _3168 = _2926 + 72;
    uint _3170 = uint(int(uint(_3168) >> uint(2)));
    uint _3172 = uint(int(uint(int(_3170)) >> uint(2)));
    int _3174 = int(_3170) & 3;
    float _3176 = (*spvDescriptorSet0.vp_c15)._m0[int(_3172)][_3174];
    int _3178 = int(_3170) + 1;
    uint _3180 = uint(int(uint(_3178) >> uint(2)));
    int _3182 = _3178 & 3;
    float _3184 = (*spvDescriptorSet0.vp_c15)._m0[int(_3180)][_3182];
    float _3186 = _2768 * _2952;
    float _3188 = _3122 + _3162;
    float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3192 = fma(_2780, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3190);
    float _3194 = precise::clamp(_3192, 0.0, 1.0);
    float _3196 = fma(_897, _2944, _3186);
    float _3198 = rsqrt(_3188);
    float _3200 = -_3194;
    float _3202 = _3200 + 1.0;
    int _3204 = _2926 + 88;
    uint _3206 = uint(int(uint(_3204) >> uint(2)));
    uint _3208 = uint(int(uint(int(_3206)) >> uint(2)));
    int _3210 = int(_3206) & 3;
    float _3212 = (*spvDescriptorSet0.vp_c15)._m0[int(_3208)][_3210];
    int _3214 = int(_3206) + 1;
    uint _3216 = uint(int(uint(_3214) >> uint(2)));
    int _3218 = _3214 & 3;
    float _3220 = (*spvDescriptorSet0.vp_c15)._m0[int(_3216)][_3218];
    float _3222 = _2768 * _2986;
    int _3224 = as_type<int>(_3186);
    int _3226 = as_type<int>(_2978);
    if (!_3038)
    {
        int _3228 = _3158 << 2;
        _3224 = _3228;
    }
    int _3230 = _3224;
    float _3232 = fma(_897, _2978, _3222);
    int _3234 = _3230;
    if (!_3038)
    {
        int _3236 = 12 & _3230;
        _3234 = _3236;
    }
    int _3238 = _3234;
    float _3240 = fma(_899, _3018, _3196);
    float _3242 = _3198 * _3046;
    float _3244 = _3198 * _3114;
    float _3246 = fma(_899, _3058, _3232);
    float _3248 = _3240 + _3026;
    float _3250 = abs(_3202);
    float _3252 = log2(_3250);
    float _3254 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3256 = _3246 + _3066;
    float _3258 = _2744 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3260 = _3198 * _3108;
    float _3262 = -_3254;
    float _3264 = fma(_3244, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3262);
    float _3266 = _2768 * _3102;
    float _3268 = _3102;
    if (!_3038)
    {
        float _3270 = -_3166;
        float _3272 = _2872 + _3270;
        _3268 = _3272;
    }
    float _3274 = _3268;
    float _3276 = 1.0 / _3256;
    float _3278 = -_3260;
    float _3280 = fma(_3278, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3264);
    float _3282 = fma(_897, _3094, _3266);
    float _3284 = _2744 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (!_3038)
    {
        uint _3286 = uint(int(uint(_3158) >> uint(2)));
        _2882 = int(_3286);
    }
    int _3288 = _2882;
    float _3290 = _2768 * _3140;
    float _3292 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3284);
    if (!_3038)
    {
        int _3294 = _3288 << 4;
        int _3296 = _3294 + _3238;
        _3226 = _3296;
    }
    int _3298 = _3226;
    float _3300 = fma(_3280, -0.5, 0.5);
    float _3302 = fma(_897, _3132, _3290);
    float _3304 = fma(_3280, 0.5, 0.5);
    float _3306 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3292);
    float _3308 = _3202;
    if (!_3038)
    {
        int _3310 = _3298 + 400;
        uint _3312 = uint(int(uint(_3310) >> uint(2)));
        uint _3314 = uint(int(uint(int(_3312)) >> uint(2)));
        int _3316 = int(_3312) & 3;
        float _3318 = (*spvDescriptorSet0.vp_c15)._m0[int(_3314)][_3316];
        _3308 = _3318;
    }
    float _3320 = _3308;
    float _3322 = fma(_899, _3176, _3282);
    float _3324 = sqrt(_3300);
    float _3326 = _3248 * _3276;
    float _3328 = _3322 + _3184;
    float _3330 = _2744 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _3332 = _3326 >= 0.0;
    float _3334 = fma(_899, _3212, _3302);
    float _3336 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3330);
    float _3338 = fma(_2746, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3258);
    bool _3340 = _3326 <= 1.0;
    bool _3342 = _3340 && _3332;
    float _3344 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3346 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3336);
    float _3348 = fma(_2748, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3338);
    float _3350 = fma(_3304, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3352 = exp2(_3344);
    float _3354 = _3346 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3356 = _3328 * _3276;
    float _3358 = _3348 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3360 = fma(_3304, _3350, -0.212114393711090087890625);
    float _3362 = _3334 + _3220;
    float _3364 = _3244 + 1.0;
    float _3366 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3368 = _3356 >= 0.0;
    bool _3370 = _3368 && _3342;
    float _3372 = log2(_3148);
    float _3374 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3376 = fma(_3354, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3366);
    bool _3378 = _3356 <= 1.0;
    bool _3380 = _3378 && _3370;
    float _3382 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3384 = _3324 * 0.636619746685028076171875;
    float _3386 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3376);
    float _3388 = -_3244;
    float _3390 = fma(_3352, _3364, _3388);
    float _3392 = as_type<float>(_3288);
    float _3394 = _3384;
    if (!_3038)
    {
        float _3396 = floor(_2838);
        _3392 = _3396;
    }
    float _3398 = _3392;
    float _3400 = _3306 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3402 = fma(_3354, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3374);
    float _3404 = _3362 * _3276;
    float _3406 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3386);
    float _3408 = fma(_3304, _3360, 1.570728778839111328125);
    float _3410 = fma(_3354, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3382);
    float _3412 = _3406;
    if (_3380)
    {
        float _3414 = float(_2910);
        _2914 = _3414;
    }
    float _3416 = _2914;
    float _3418 = 1.0 / _3406;
    float _3420 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3402);
    float _3422 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3410);
    float _3424 = _3372 * 0.693147182464599609375;
    float _3426 = -_3408;
    float _3428 = fma(_3384, _3426, 1.0);
    float _3430 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3420);
    float _3432 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3422);
    float2 _9140 = float2(_2876, _3144);
    float _3434 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9140, float2(0.0), isnan(_9140)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9140, float2(0.0), isnan(_9140)), level(0.0)).x;
    float _3436 = _3410;
    float _3438 = _3432;
    if (_3380)
    {
        float _3440 = rint(_3416);
        float _3442 = precise::max(_3440, 0.0);
        uint _3444 = uint(_3442);
        uint _3446 = clamp(_3444, 0u, 65535u);
        _3436 = as_type<float>(_3446);
    }
    float _3448 = _3436;
    if (!_3038)
    {
        float _3450 = -_3398;
        float _3452 = _2838 + _3450;
        _3394 = _3452;
    }
    float _3454 = _3394;
    float _3456 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3458 = fma(_3390, 0.5, 0.5);
    float _3460 = _3430 * _3418;
    float _3462 = _3432 * _3418;
    float _3464 = _3276;
    if (!_3038)
    {
        float _3466 = rint(_3320);
        float _3468 = precise::max(_3466, 0.0);
        uint _3470 = uint(_3468);
        uint _3472 = clamp(_3470, 0u, 65535u);
        _3464 = as_type<float>(_3472);
    }
    float _3474 = _3464;
    float _3476 = fma(_3460, 0.5, 0.5);
    float _3478 = fma(_3462, -0.5, 0.5);
    float _3480 = _3448;
    if (_3380)
    {
        float3 _9215 = float3(_3326, _3356, float(as_type<int>(_3448)));
        float3 _9219 = select(_9215, float3(0.0), isnan(_9215));
        float _3482 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9219.xy, uint(rint(_9219.z)), _3404, level(0.0));
        _3480 = _3482;
    }
    float _3484 = _3480;
    float3 _9229 = float3(_3476, _3478, _3456);
    float _3486 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9229, float3(0.0), isnan(_9229)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9229, float3(0.0), isnan(_9229)), level(0.0)).x;
    float3 _9238 = float3(_3476, _3478, _3456);
    float4 _3489 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9238, float3(0.0), isnan(_9238)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9238, float3(0.0), isnan(_9238)), level(0.0)).xyzw;
    float _3491 = _3489.x;
    float _3493 = _3489.y;
    float _3495 = _3489.z;
    float _3497 = _3489.w;
    float2 _9254 = float2(_3428, _3458);
    float3 _3499 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9254, float2(0.0), isnan(_9254)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9254, float2(0.0), isnan(_9254)), level(0.0)).xyz;
    float _3501 = _3499.x;
    float _3503 = _3499.y;
    float _3505 = _3499.z;
    float _3507 = _3474;
    if (!_3038)
    {
        float3 _9275 = float3(_3454, _3274, float(as_type<int>(_3474)));
        float3 _9277 = select(_9275, float3(0.0), isnan(_9275));
        float _3509 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9277.xy, uint(rint(_9277.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9277.xy, uint(rint(_9277.z)), level(0.0)).x;
        _3507 = _3509;
    }
    float _3511 = _3507;
    float _3513 = abs(_2856);
    float _3515 = log2(_3513);
    float _3517 = _3358 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3519 = _3252 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3521 = fma(_3354, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3517);
    float _3523 = fma(_3110, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3521);
    float _3525 = exp2(_3519);
    bool _3527 = _2856 <= 8000.0;
    bool _3529 = isnan(_2856);
    bool _3531 = _3527 || _3529;
    bool _3533 = isnan(8000.0);
    bool _3535 = _3531 || _3533;
    float _3537 = float(_3535);
    float _3539 = fma(_3400, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3523);
    float _3541 = _3515 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.gl_Position.x = _3430;
    out.gl_Position.y = _3432;
    out.gl_Position.z = _3539;
    out.gl_Position.w = _3406;
    float _3543 = exp2(_3541);
    float _3545 = fma(_3543, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3547 = precise::clamp(_3545, 0.0, 1.0);
    float _3549 = fma(_3547, -2.0, 3.0);
    float _3551 = _3547 * _3547;
    float _3553 = _3551 * _3549;
    float _3555 = -_3553;
    float _3557 = _3555 + 1.0;
    float _3559 = fma(_3557, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3553);
    float _3561 = _3557;
    float _3563 = _3539;
    if (!_3380)
    {
        _3561 = 1.0;
    }
    float _3565 = _3561;
    float _3567 = _3537 * _3559;
    float _3569 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3571 = -_3525;
    float _3573 = _3571 + 1.0;
    float _3575 = -_3434;
    float _3577 = _3575 + 1.0;
    float _3579 = _3577 * _3569;
    float _3581 = precise::clamp(_3579, 0.0, 1.0);
    float _3583 = _3565;
    float _3585 = _3573;
    if (_3380)
    {
        bool _3587 = _3484 >= _3404;
        bool _3589 = isnan(_3484);
        bool _3591 = _3587 || _3589;
        bool _3593 = isnan(_3404);
        bool _3595 = _3591 || _3593;
        float _3597 = float(_3595);
        _3583 = _3597;
    }
    float _3599 = _3583;
    float _3601 = _3573 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (_3038)
    {
        _3585 = 1.0;
    }
    float _3603 = _3585;
    float _3605 = _3603;
    if (!_3038)
    {
        int _3607 = _3158 << 4;
        int _3609 = _3607 + 2048;
        uint _3611 = uint(int(uint(_3609) >> uint(2)));
        uint _3613 = uint(int(uint(int(_3611)) >> uint(2)));
        int _3615 = int(_3611) & 3;
        float _3617 = (*spvDescriptorSet0.vp_c15)._m0[int(_3613)][_3615];
        int _3619 = int(_3611) + 1;
        uint _3621 = uint(int(uint(_3619) >> uint(2)));
        int _3623 = _3619 & 3;
        float _3625 = (*spvDescriptorSet0.vp_c15)._m0[int(_3621)][_3623];
        int _3627 = _3609 + 8;
        uint _3629 = uint(int(uint(_3627) >> uint(2)));
        uint _3631 = uint(int(uint(int(_3629)) >> uint(2)));
        int _3633 = int(_3629) & 3;
        float _3635 = (*spvDescriptorSet0.vp_c15)._m0[int(_3631)][_3633];
        int _3637 = int(_3629) + 1;
        uint _3639 = uint(int(uint(_3637) >> uint(2)));
        int _3641 = _3637 & 3;
        float _3643 = (*spvDescriptorSet0.vp_c15)._m0[int(_3639)][_3641];
        float _3645 = _2768 * _3625;
        float _3647 = fma(_897, _3617, _3645);
        float _3649 = fma(_899, _3635, _3647);
        float _3651 = _3649 + _3643;
        float _3653 = precise::clamp(_3651, 0.0, 1.0);
        float _3655 = -_3653;
        float _3657 = _3655 + _3511;
        float _3659 = fma(_3657, 500.0, 1.5);
        float _3661 = exp2(_3659);
        float _3663 = 0.0 + _3661;
        float _3665 = precise::clamp(_3663, 0.0, 1.0);
        _3605 = _3665;
        _3438 = _3643;
    }
    float _3667 = _3605;
    float _3669 = _3438;
    float _3671 = _3599 * _3667;
    float _3673 = _3601 * _3486;
    float _3675 = -_3581;
    float _3677 = fma(_3675, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3679 = -_3601;
    float _3681 = _3679 + 1.0;
    bool _3683 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3685 = isnan(_2780);
    bool _3687 = _3683 || _3685;
    bool _3689 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3691 = _3687 || _3689;
    float _3693 = _3497 * _3673;
    float _3695 = -_3671;
    float _3697 = fma(_3695, _3677, 1.0);
    float _3699 = precise::clamp(_3697, 0.0, 1.0);
    float _3701 = _3505 * _3673;
    float _3703 = _3497 * _3681;
    float _3705 = fma(_3501, _3693, _3491);
    float _3707 = fma(_3503, _3693, _3493);
    float _3709 = _3699 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3711 = fma(_3497, _3701, _3495);
    out.m_96.x = _3709;
    float _3713 = _3669;
    float _3715 = _3693;
    float _3717 = _3677;
    float _3719 = _3699;
    if (!_3691)
    {
        _3412 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3721 = _3412;
    float _3723 = _3721;
    float _3725 = _3721;
    if (!_3691)
    {
        _3563 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3727 = _3563;
    out.m_98.x = _3705;
    out.m_98.y = _3707;
    out.m_98.z = _3711;
    out.m_98.w = _3703;
    float _3729 = _3727;
    float _3731 = _3727;
    if (!_3691)
    {
        _3713 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3733 = _3713;
    float _3735 = _3733;
    float _3737 = _3733;
    if (!_3691)
    {
        _3715 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3739 = _3715;
    float _3741 = _3739;
    float _3743 = _3739;
    if (!_3691)
    {
        _3717 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3745 = _3717;
    float _3747 = _3745;
    float _3749 = _3745;
    if (!_3691)
    {
        _3719 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3751 = _3719;
    bool _3753 = !_3691;
    float _3755 = _3751;
    float _3757 = _3751;
    if (!_3753)
    {
        bool _3759 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3761 = isnan(_2780);
        bool _3763 = _3759 || _3761;
        bool _3765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3767 = _3763 || _3765;
        if (!_3767)
        {
            float _3769 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3771 = _2780 + _3769;
            float _3773 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3775 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3773;
            float _3777 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3779 = _3777 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3781 = 1.0 / _3775;
            float _3783 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3785 = _3783 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3787 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3789 = _3787 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3793 = _3791 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3799 = _3771 * _3781;
            float _3801 = precise::clamp(_3799, 0.0, 1.0);
            float _3803 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3805 = _3803 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3807 = fma(_3801, _3779, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3809 = fma(_3801, _3805, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3811 = fma(_3801, _3785, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3813 = fma(_3801, _3789, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3815 = fma(_3801, _3793, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3817 = fma(_3801, _3797, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3731 = _3811;
            _3749 = _3815;
            _3725 = _3807;
            _3743 = _3813;
            _3737 = _3809;
            _3757 = _3817;
            _3819 = true;
        }
        else
        {
            bool _3821 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3823 = isnan(_2780);
            bool _3825 = _3821 || _3823;
            bool _3827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3829 = _3825 || _3827;
            if (!_3829)
            {
                _3723 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3831 = _3723;
            _3725 = _3831;
            if (!_3829)
            {
                _3729 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3833 = _3729;
            _3731 = _3833;
            if (!_3829)
            {
                _3735 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3835 = _3735;
            _3737 = _3835;
            if (!_3829)
            {
                _3741 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3837 = _3741;
            _3743 = _3837;
            if (!_3829)
            {
                _3747 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3839 = _3747;
            _3749 = _3839;
            if (!_3829)
            {
                _3755 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3841 = _3755;
            bool _3843 = !_3829;
            _3757 = _3841;
            if (!_3843)
            {
                bool _3845 = _2780 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3847 = isnan(_2780);
                bool _3849 = _3845 || _3847;
                bool _3851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3853 = _3849 || _3851;
                if (!_3853)
                {
                    float _3855 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3857 = _2780 + _3855;
                    float _3859 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3861 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3859;
                    float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3865 = _3863 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3867 = 1.0 / _3861;
                    float _3869 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3871 = _3869 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3877 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3879 = _3877 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3885 = _3857 * _3867;
                    float _3887 = precise::clamp(_3885, 0.0, 1.0);
                    float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3893 = fma(_3887, _3865, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3895 = fma(_3887, _3891, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3897 = fma(_3887, _3871, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3899 = fma(_3887, _3875, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3901 = fma(_3887, _3879, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3903 = fma(_3887, _3883, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3731 = _3897;
                    _3749 = _3901;
                    _3725 = _3893;
                    _3743 = _3899;
                    _3737 = _3895;
                    _3757 = _3903;
                    _3819 = true;
                }
                else
                {
                    _3731 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3749 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3725 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3743 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3737 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3757 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3819 = false;
    float _3905 = _3731;
    float _3907 = _3749;
    float _3909 = _3725;
    float _3911 = _3743;
    float _3913 = _3737;
    float _3915 = _3757;
    float _3917 = fma(_2646, -0.5, 0.5);
    float _3919 = precise::clamp(_3917, 0.0, 1.0);
    float _3921 = -_3905;
    float _3923 = _3921 + _3907;
    float _3925 = -_3909;
    float _3927 = _3925 + _3911;
    float _3929 = -_3913;
    float _3931 = _3929 + _3915;
    bool _3933 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3935 = fma(_3919, _3923, _3905);
    float _3937 = fma(_3919, _3927, _3909);
    float _3939 = fma(_3919, _3931, _3913);
    float _3941 = _3935 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _3943 = fma(_3937, 0.298911988735198974609375, _3941);
    float _3945 = fma(_3939, 0.114477999508380889892578125, _3943);
    out.m_100.x = 0.0;
    float _3947 = -_3945;
    float _3949 = _3937 + _3947;
    float _3951 = -_3945;
    float _3953 = _3935 + _3951;
    float _3955 = -_3945;
    float _3957 = _3939 + _3955;
    float _3959 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3961 = fma(_3949, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    float _3963 = fma(_3953, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    float _3965 = fma(_3957, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3945);
    out.m_96.w = _3959;
    out.m_102.x = _3961;
    out.m_102.y = _3963;
    out.m_102.z = _3965;
    if (!_3933)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3967 = -_2744;
    float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3971 = -_2746;
    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3975 = -_2748;
    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3979 = _3969 * _3969;
    float _3981 = fma(_3973, _3973, _3979);
    float _3983 = fma(_3977, _3977, _3981);
    float _3985 = sqrt(_3983);
    float _3987 = rsqrt(_3983);
    float _3989 = -_3985;
    float _3991 = _3989 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3993 = _3991 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3995 = precise::clamp(_3993, 0.0, 1.0);
    float _3997 = _3973 * _3987;
    float _3999 = _3969 * _3987;
    float _4001 = abs(_3995);
    float _4003 = log2(_4001);
    float _4005 = _3977 * _3987;
    float _4007 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4009 = _2646 * _3999;
    float _4011 = -_3999;
    float _4013 = -_4007;
    float _4015 = fma(_4011, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4013);
    float _4017 = fma(_2640, _3997, _4009);
    float _4019 = -_4005;
    float _4021 = fma(_4019, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4015);
    float _4023 = fma(_2648, _4005, _4017);
    float _4025 = precise::clamp(_4023, 0.0, 1.0);
    float _4027 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4029 = _4021 + _4027;
    float _4031 = _4003 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4033 = _4029 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4035 = precise::clamp(_4033, 0.0, 1.0);
    float _4037 = exp2(_4031);
    float _4039 = _4037 * _4035;
    float _4041 = _4025 * _4039;
    float _4043 = _4041 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4045 = _4041 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4047 = _4041 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_100.x = _4043;
    out.m_100.y = _4045;
    out.m_100.z = _4047;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

