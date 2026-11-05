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
    float4 m_76 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_86 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_100 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_84 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_98 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 m_94 [[user(locn13)]];
    float4 m_96 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_74 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3803 = false;
    bool _2686 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_60.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    float _127 = as_type<float>(_119);
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _125;
    float _131 = _129;
    if (!_123)
    {
        out.m_63.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4090 = as_type<float>(_137);
        out.gl_Position.z = _4090;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_65.w;
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
        float _159 = float(_119);
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
        out.m_63.x = 0.0;
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
        float _4160 = as_type<float>(_175);
        out.gl_Position.z = _4160;
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
        float _199 = in.m_70.x;
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
        float _219 = float(_119);
        float _221 = 1.0 / _219;
        float _223 = _155 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = in.m_70.x;
    float _229 = in.m_70.y;
    float _231 = in.m_70.z;
    float _233 = in.m_70.w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _225 + _235;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _247 = _245 != 0;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _255 = 1.0 / _243;
    float _257 = float(_119);
    float _259 = 1.0 / _251;
    float _261 = _227 * 2.0;
    float _263 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _265 = _229 * 2.0;
    float _267 = _227 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _271 = floor(_261);
    float _273 = fma(_263, -2.0, _239);
    float _275 = _231 * 2.0;
    float _277 = -_253;
    float _279 = fma(_267, 2.0, _277);
    float _281 = _231 + _227;
    float _283 = _227 + _229;
    float _285 = _237 * _255;
    float _287 = floor(_265);
    float _289 = _281 + (-1.0);
    float _291 = _283 + (-1.0);
    int _293 = as_type<int>(_283);
    if (_247)
    {
        _293 = 0;
    }
    int _295 = _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _225 + _297;
    float _301 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _303 = _295;
    if (!_247)
    {
        _303 = 1;
    }
    int _305 = _303;
    float _307 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _309 = floor(_275);
    bool _311 = _271 >= 0.0;
    bool _313 = isnan(_271);
    bool _315 = _311 || _313;
    bool _317 = isnan(0.0);
    bool _319 = _315 || _317;
    float _321 = _299 * _259;
    bool _323 = _271 > 0.0;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _327 = _319 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _329 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _273);
    bool _331 = _305 != 1;
    float _333 = _231 + _229;
    bool _335 = _287 >= 0.0;
    bool _337 = isnan(_287);
    bool _339 = _335 || _337;
    bool _341 = isnan(0.0);
    bool _343 = _339 || _341;
    float _345 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _347 = int(_345);
    bool _349 = _287 > 0.0;
    float _351 = _333 + (-1.0);
    int _353 = _343 ? 0 : 1;
    float _355 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _357 = _309 > 0.0;
    float _359 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _361 = log2(_359);
    bool _363 = _309 >= 0.0;
    bool _365 = isnan(_309);
    bool _367 = _363 || _365;
    bool _369 = isnan(0.0);
    bool _371 = _367 || _369;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _375 = ~_353;
    int _377 = _375 + 1;
    int _379 = _377 + 1;
    int _381 = _371 ? 0 : 1;
    int _383 = _379;
    float _385 = _351;
    float _387 = as_type<float>(_347);
    float _389 = _327;
    if (!_349)
    {
        int _391 = ~_353;
        int _393 = _391 + 1;
        _383 = _393;
    }
    int _395 = _383;
    float _397 = 1.0 / _257;
    int _399 = ~_381;
    int _401 = _399 + 1;
    int _403 = _401 + 1;
    int _405 = _403;
    if (!_331)
    {
        _385 = _229;
    }
    float _407 = _385;
    float _409 = _407;
    if (!_357)
    {
        int _411 = ~_381;
        int _413 = _411 + 1;
        _405 = _413;
    }
    int _415 = _405;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _419 = _417 != 0;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _427 = _425 != 0;
    float _429 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _431 = int(_429);
    if (_331)
    {
        _409 = _227;
    }
    float _433 = _409;
    float _435 = float(_415);
    bool _437 = !_423;
    int _439 = _437 ? 0 : 1;
    float _441 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[83].z, _373);
    bool _443 = !_419;
    int _445 = _443 ? 0 : 1;
    float _447 = _397 * _155;
    bool _449 = !_427;
    int _451 = _449 ? 0 : 1;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _459 = _457 != 0;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _463 = _461 != 0;
    float _465 = float(_347);
    if (!_331)
    {
        _127 = _231;
    }
    float _467 = _127;
    bool _469 = !_455;
    int _471 = _469 ? 0 : 1;
    float _473 = float(_431);
    float _475 = 1.0 / _465;
    int _477 = abs(_471);
    bool _479 = !_459;
    int _481 = _479 ? 0 : 1;
    float _483 = float(_477);
    float _485 = _467;
    if (!_331)
    {
        _387 = _229;
    }
    float _487 = _387;
    float _489 = 1.0 / _473;
    float _491 = _487;
    if (_331)
    {
        _485 = _229;
    }
    float _493 = _485;
    float _495 = _483 * _435;
    if (_331)
    {
        _491 = _227;
    }
    float _497 = _491;
    int _499 = abs(_481);
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _503 = _497 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _505 = _361 * _155;
    float _507 = fma(_501, -2.0, _269);
    float _509 = in.m_72.x;
    float _511 = in.m_72.y;
    float _513 = in.m_72.z;
    int _515 = ~as_type<int>(_327);
    int _517 = _515 + 1;
    int _519 = _517 + 1;
    float _521 = -_325;
    float _523 = fma(_503, 2.0, _521);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _527 = _519;
    if (!_323)
    {
        int _529 = ~as_type<int>(_327);
        int _531 = _529 + 1;
        _527 = _531;
    }
    int _533 = _527;
    float _535 = exp2(_505);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _539 = 1.0 + _537;
    if (!_331)
    {
        _389 = _231;
    }
    float _541 = _389;
    float _543 = _495 * (-2.0);
    float _545 = _541;
    if (_331)
    {
        _545 = _229;
    }
    float _547 = _545;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _551 = float(_533);
    float _553 = 1.0 / _539;
    float _555 = float(_499);
    float _557 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[83].w, _525);
    float _559 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[78].z, _549);
    float _561 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _441);
    float _563 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _557);
    float _565 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _507);
    float _567 = float(_395);
    float _569 = _555 * _551;
    bool _571 = !_463;
    int _573 = _571 ? 0 : 1;
    float _575 = fma(_543, _509, _509);
    bool _577 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _579 = isnan(1.0);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _585 = _581 || _583;
    float _587 = -_535;
    float _589 = _587 + 1.0;
    int _591 = abs(_573);
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _595 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _603 = _599 || _601;
    float _605 = _569 * (-2.0);
    float _607 = float(_591);
    float _609 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].w, _593);
    float _611 = _603 ? _589 : 0.0;
    float _613 = -_155;
    float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[81].x, _523);
    float _617 = fma(_605, _511, _511);
    float _619 = _607 * _567;
    float _621 = _229 + (-0.5);
    float _623 = _227 + (-0.5);
    float _625 = _619 * (-2.0);
    float _627 = _475 * _155;
    float _629 = -_155;
    float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[76].x, _279);
    float _633 = fma(_355, _605, _355);
    float _635 = _489 * _155;
    float _637 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _559);
    float _639 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _609);
    float _641 = fma(_625, _513, _513);
    float _643 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[196].y, _617);
    if (_585)
    {
        float _645 = _611 * _553;
        _157 = _645;
    }
    float _647 = _157;
    float _649 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[196].x, _575);
    float _651 = _231 + (-0.5);
    bool _653 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _655 = isnan(_225);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _665;
    float _669 = fma(_301, _625, _301);
    float _671 = fma(_307, _543, _307);
    bool _673 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _675 = isnan(_225);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[196].z, _641);
    float _687 = fma(_667, _285, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _689 = -_663;
    float _691 = _689 + 1.0;
    float _693 = fma(_633, _647, _643);
    bool _695 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _697 = isnan(_225);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _707;
    float _711 = -_683;
    float _713 = _711 + 1.0;
    float _715 = in.m_74.x;
    float _717 = in.m_74.y;
    float _719 = _683 * _691;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _725 = fma(_709, _285, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _727 = _705 * _713;
    float _729 = -_705;
    float _731 = _729 + 1.0;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _737 = fma(_671, _647, _649);
    float _739 = _725 * _727;
    float _741 = _687 * _727;
    float _743 = fma(_669, _647, _685);
    float _745 = fma(_723, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _747 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[143].y, _739);
    float _749 = fma(_735, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _751 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[143].x, _741);
    float _753 = _737 * 0.15915493667125701904296875;
    float _755 = _693 * 0.15915493667125701904296875;
    float _757 = fma(_749, _719, _747);
    float _759 = fma(_745, _719, _751);
    float _761 = _743 * 0.15915493667125701904296875;
    float _763 = _753 * 6.283185482025146484375;
    float _765 = cos(_763);
    float _767 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[145].y, _757);
    float _769 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[145].x, _759);
    float _771 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _773 = _767 * _717;
    float _775 = _769 * _715;
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _779 = _755 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = _773 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _785 = _775 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _787 = _783 * _771;
    float _789 = _785 * _777;
    float _791 = _755 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = in.m_60.x;
    float _797 = in.m_60.y;
    float _799 = in.m_60.z;
    float _801 = _753 * 6.283185482025146484375;
    float _803 = sin(_801);
    float _805 = _765 * _781;
    float _807 = _761 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _765 * _793;
    float _813 = _761 * 6.283185482025146484375;
    float _815 = sin(_813);
    float _817 = _803 * _781;
    float _819 = _803 * _793;
    float _821 = _765 * _809;
    float _823 = _803 * _809;
    float _825 = _793 * _809;
    float _827 = _781 * _809;
    float _829 = _821 * _787;
    float _831 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _833 = fma(_815, _811, _817);
    float _835 = -_805;
    float _837 = fma(_815, _819, _835);
    float _839 = -_819;
    float _841 = fma(_815, _805, _839);
    float _843 = -_787;
    float _845 = _815 * _843;
    float _847 = fma(_833, _789, _829);
    float _849 = _823 * _787;
    float _851 = fma(_815, _817, _811);
    float _853 = fma(_825, _789, _845);
    float _855 = fma(_841, _831, _847);
    float _857 = fma(_837, _789, _849);
    float _859 = _797 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _861 = fma(_827, _831, _853);
    float _863 = _797 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _865 = _855 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _867 = _855 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _869 = fma(_851, _831, _857);
    float _871 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[4].x, _863);
    float _873 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[6].x, _859);
    float _875 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[24].x, _865);
    float _877 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[26].x, _867);
    float _879 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[4].z, _871);
    float _881 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[6].z, _873);
    float _883 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _875);
    float _885 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _877);
    float _887 = _879 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _889 = _881 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _891 = _883 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _893 = _885 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _895 = _797 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _897 = _855 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _899 = _887 + _891;
    float _901 = _889 + _893;
    float _903 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[5].x, _895);
    float _905 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[25].x, _897);
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _909 = _899 + _907;
    float _911 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _913 = _901 + _911;
    float _915 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[5].z, _903);
    float _917 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _905);
    float _919 = _909 * _909;
    float _921 = _913 * _913;
    float _923 = _915 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _925 = _917 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _927 = _919 + _921;
    float _929 = _923 + _925;
    float _931 = sqrt(_927);
    bool _933 = _931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _935 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _937 = _931 + _935;
    float _939 = 0.0;
    float _941 = _915;
    float _943 = _897;
    float _945 = _799;
    float _947 = _901;
    float _949 = _929;
    float _951 = _919;
    if (_933)
    {
        float _953 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _939 = _953;
    }
    float _955 = _939;
    if (_933)
    {
        float _957 = _929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _941 = _957;
    }
    float _959 = _941;
    float _961 = _959;
    if (!_933)
    {
        _943 = _899;
    }
    float _963 = _943;
    float _965 = _963;
    if (_933)
    {
        float _967 = rsqrt(_927);
        _945 = _967;
    }
    float _969 = _945;
    float _971 = _955;
    if (_933)
    {
        float _973 = _937 * _955;
        _971 = _973;
    }
    float _975 = _971;
    float _977 = _975;
    if (_933)
    {
        float _979 = _975 * 0.15915493667125701904296875;
        _977 = _979;
    }
    float _981 = _977;
    float _983 = _795;
    if (_933)
    {
        float _985 = _981 * 6.283185482025146484375;
        float _987 = sin(_985);
        _983 = _987;
    }
    float _989 = _983;
    if (_933)
    {
        float _991 = fma(_989, _959, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _961 = _991;
    }
    float _993 = _961;
    float _995 = _993;
    if (_933)
    {
        float _997 = _969 * _993;
        _995 = _997;
    }
    float _999 = _995;
    if (_933)
    {
        float _1001 = fma(_909, _999, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _965 = _1001;
    }
    float _1003 = _965;
    if (_933)
    {
        float _1005 = fma(_913, _999, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _947 = _1005;
    }
    float _1007 = _947;
    float _1009 = fma(_1003, 6.2500002968590706586837768554688e-05, 0.5);
    float _1011 = fma(_1007, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5472 = float2(_1009, _1011);
    float3 _1015 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5472, float2(0.0), isnan(_5472)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5472, float2(0.0), isnan(_5472)), level(0.0)).xyz;
    float _1017 = _1015.x;
    float _1019 = _1015.y;
    float _1021 = _1015.z;
    float _1023 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1025 = int(_1023);
    float _1027 = 0.0;
    if (_247)
    {
        _1027 = 1.0;
    }
    float _1029 = _1027;
    float _1031 = 0.0;
    float _1033 = _1029;
    if (_247)
    {
        float _1035 = in.m_70.x;
        _1031 = _1035;
    }
    float _1037 = _1031;
    if (!_247)
    {
        _1033 = 7.345489978790283203125;
    }
    float _1039 = _1033;
    float _1041 = -_639;
    float _1043 = _1041 + 1.0;
    float _1045 = _1037;
    if (!_247)
    {
        float _1047 = in.m_70.y;
        _1045 = _1047;
    }
    float _1049 = _1045;
    float _1051 = -_561;
    float _1053 = _1051 + 1.0;
    float _1055 = trunc(_627);
    int _1057 = int(_1055);
    float _1059 = -_637;
    float _1061 = _1059 + 1.0;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1065 = -_563;
    float _1067 = _1065 + 1.0;
    float _1069 = float(uint(_1025));
    float _1071 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1073 = int(_1071);
    float _1075 = _1039 * _227;
    float _1077 = float(_1025);
    bool _1079 = _1025 == 0;
    float _1081 = float(uint(_1057));
    float _1083 = 1.0 / _1069;
    float _1085 = float(_1057);
    float _1087 = float(uint(_1073));
    float _1089 = trunc(_635);
    int _1091 = int(_1089);
    int _1093 = ~_1025;
    int _1095 = _1093 + 1;
    int _1097 = ~_1073;
    int _1099 = _1097 + 1;
    bool _1101 = _1073 == 0;
    int _1103 = as_type<int>(_1083) + (-2);
    float _1105 = 1.0 / _1087;
    float _1107 = as_type<float>(_1103) * _1081;
    float _1109 = float(uint(_1091));
    float _1111 = floor(_1075);
    float _1113 = trunc(_1107);
    float _1115 = precise::max(_1113, 0.0);
    uint _1118 = uint(_1115);
    int _1120 = _1095 * int(_1118);
    int _1122 = _1120 + _1057;
    float _1124 = float(uint(_1122));
    int _1126 = as_type<int>(_1105) + (-2);
    float _1128 = as_type<float>(_1103) * _1124;
    float _1130 = as_type<float>(_1126) * _1109;
    bool _1132 = _1085 >= _1077;
    bool _1134 = isnan(_1085);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(_1077);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = -_1111;
    float _1146 = _1075 + _1144;
    float _1148 = trunc(_1128);
    float _1150 = precise::max(_1148, 0.0);
    uint _1152 = uint(_1150);
    int _1154 = ~_1025;
    int _1156 = _1154 + 1;
    float _1158 = trunc(_1130);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    int _1164 = int(_1118) + int(_1152);
    float _1166 = trunc(_1142);
    int _1168 = int(_1166);
    float _1170 = _1146 * _1077;
    float _1172 = _1146;
    float _1174 = _1061;
    if (_247)
    {
        _1172 = 1.0;
    }
    float _1176 = _1172;
    float _1178 = _1176;
    if (!_247)
    {
        _1178 = 1.2345600128173828125;
    }
    float _1180 = _1178;
    int _1182 = _1156 * _1164;
    int _1184 = _1182 + _1057;
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1188 = _1186 != 0;
    int _1190 = _1099 * int(_1162);
    int _1192 = _1190 + _1091;
    float _1194 = trunc(_1170);
    int _1196 = int(_1194);
    float _1198 = _1049 * _1180;
    bool _1200 = uint(_1184) >= uint(_1025);
    float _1202 = float(uint(_1192));
    bool _1204 = !_1200;
    int _1206 = _1204 ? 0 : (-1);
    float _1208 = as_type<float>(_1126) * _1202;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1212 = _1210 != 0;
    int _1214 = ~_1164;
    int _1216 = _1214 + _1206;
    int _1218 = _1216 + 1;
    float _1220 = trunc(_1208);
    float _1222 = precise::max(_1220, 0.0);
    uint _1224 = uint(_1222);
    bool _1226 = !_1212;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = _1077 * _447;
    int _1232 = ~_1073;
    int _1234 = _1232 + 1;
    int _1236 = abs(_1228);
    int _1238 = _1025 * _1218;
    int _1240 = _1238 + _1057;
    float _1242 = trunc(_1230);
    int _1244 = int(_1242);
    int _1246 = ~_1168;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    bool _1252 = !_1079;
    int _1254 = _1252 ? _1240 : (-1);
    int _1256 = _1196 * _1236;
    int _1258 = _1256 + _1057;
    int _1260 = _1025 + (-1);
    int _1262 = int(_1162) + int(_1224);
    int _1264 = _1254 * _1250;
    int _1266 = abs(_439);
    int _1268 = _1168 * _1260;
    int _1270 = _1268 + _1264;
    float _1272 = floor(_1198);
    float _1274 = float(_1073);
    int _1276 = _1234 * _1262;
    int _1278 = _1276 + _1091;
    float _1280 = float(_1091);
    int _1282 = abs(_445);
    bool _1284 = _1280 >= _1274;
    bool _1286 = isnan(_1280);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan(_1274);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    bool _1296 = uint(_1278) >= uint(_1073);
    int _1298 = _1270 * _1266;
    int _1300 = abs(_451);
    float _1302 = trunc(_1294);
    int _1304 = int(_1302);
    bool _1306 = !_1296;
    int _1308 = _1306 ? 0 : (-1);
    float _1310 = -_1272;
    float _1312 = _1198 + _1310;
    int _1314 = _1244 * _1282;
    int _1316 = _1314 + _1298;
    int _1318 = ~_1262;
    int _1320 = _1318 + _1308;
    int _1322 = _1320 + 1;
    float _1324 = _1312 * _1274;
    bool _1326 = !_1188;
    int _1328 = _1326 ? 0 : 1;
    int _1330 = _1258 * _1300;
    int _1332 = _1330 + _1316;
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1336 = _1334 != 0;
    int _1338 = _1073 * _1322;
    int _1340 = _1338 + _1091;
    int _1342 = abs(_1328);
    float _1344 = trunc(_1324);
    int _1346 = int(_1344);
    bool _1348 = !_1336;
    int _1350 = _1348 ? 0 : 1;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1354 = _1352 != 0;
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1366 = _1364 != 0;
    float _1368 = _1274 * _447;
    int _1370 = ~_1304;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = _1196 * _1342;
    int _1378 = _1376 + _1332;
    bool _1380 = !_1101;
    int _1382 = _1380 ? _1340 : (-1);
    float _1384 = trunc(_1368);
    int _1386 = int(_1384);
    bool _1388 = !_1358;
    int _1390 = _1388 ? 0 : 1;
    int _1392 = abs(_1350);
    int _1394 = _1382 * _1374;
    int _1396 = _1073 + (-1);
    int _1398 = abs(_1390);
    float _1400 = float(uint(_1378));
    int _1402 = _1304 * _1396;
    int _1404 = _1402 + _1394;
    bool _1406 = !_1354;
    int _1408 = _1406 ? 0 : 1;
    float _1410 = as_type<float>(_1103) * _1400;
    int _1412 = _1346 * _1392;
    int _1414 = _1412 + _1091;
    int _1416 = abs(_1408);
    bool _1418 = !_1362;
    int _1420 = _1418 ? 0 : 1;
    int _1422 = _1404 * _1398;
    float _1424 = trunc(_1410);
    float _1426 = precise::max(_1424, 0.0);
    uint _1428 = uint(_1426);
    int _1430 = ~_1025;
    int _1432 = _1430 + 1;
    float _1434 = float(uint(_1258));
    int _1436 = _1386 * _1416;
    int _1438 = _1436 + _1422;
    int _1440 = abs(_1420);
    float _1442 = as_type<float>(_1103) * _1434;
    float _1444 = float(uint(_1414));
    bool _1446 = !_1366;
    int _1448 = _1446 ? 0 : 1;
    float _1450 = as_type<float>(_1126) * _1444;
    int _1452 = abs(_1448);
    int _1454 = _1414 * _1440;
    int _1456 = _1454 + _1438;
    float _1458 = trunc(_1442);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    int _1464 = _1432 * int(_1428);
    int _1466 = _1464 + _1378;
    int _1468 = _1346 * _1452;
    int _1470 = _1468 + _1456;
    float _1472 = float(uint(_1466));
    float _1474 = float(uint(_1470));
    float _1476 = trunc(_1450);
    float _1478 = precise::max(_1476, 0.0);
    uint _1480 = uint(_1478);
    int _1482 = ~_1025;
    int _1484 = _1482 + 1;
    float _1486 = as_type<float>(_1103) * _1472;
    int _1488 = ~_1073;
    int _1490 = _1488 + 1;
    float _1492 = as_type<float>(_1126) * _1474;
    int _1494 = _1484 * int(_1462);
    int _1496 = _1494 + _1258;
    float _1498 = trunc(_1486);
    float _1500 = precise::max(_1498, 0.0);
    uint _1502 = uint(_1500);
    int _1504 = ~_1025;
    int _1506 = _1504 + 1;
    float _1508 = float(uint(_1496));
    float _1510 = trunc(_1492);
    float _1512 = precise::max(_1510, 0.0);
    uint _1514 = uint(_1512);
    int _1516 = _1490 * int(_1480);
    int _1518 = _1516 + _1414;
    int _1520 = ~_1073;
    int _1522 = _1520 + 1;
    float _1524 = as_type<float>(_1103) * _1508;
    float _1526 = float(uint(_1518));
    int _1528 = int(_1428) + int(_1502);
    float _1530 = trunc(_1524);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    float _1536 = as_type<float>(_1126) * _1526;
    int _1538 = _1522 * int(_1514);
    int _1540 = _1538 + _1470;
    float _1542 = trunc(_1536);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    float _1548 = float(uint(_1540));
    int _1550 = _1506 * _1528;
    int _1552 = _1550 + _1378;
    int _1554 = int(_1462) + int(_1534);
    float _1556 = as_type<float>(_1126) * _1548;
    bool _1558 = uint(_1552) >= uint(_1025);
    bool _1560 = !_1558;
    int _1562 = _1560 ? 0 : (-1);
    float _1564 = trunc(_1556);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = int(_1480) + int(_1546);
    int _1572 = ~_1528;
    int _1574 = _1572 + _1562;
    int _1576 = _1574 + 1;
    int _1578 = _1025 * _1576;
    int _1580 = _1578 + _1378;
    int _1582 = ~_1025;
    int _1584 = _1582 + 1;
    int _1586 = ~_1073;
    int _1588 = _1586 + 1;
    bool _1590 = !_1079;
    int _1592 = _1590 ? _1580 : (-1);
    int _1594 = _1584 * _1554;
    int _1596 = _1594 + _1258;
    int _1598 = int(_1514) + int(_1568);
    int _1600 = _1592 & 3;
    bool _1602 = _1600 != 0;
    int _1604 = _1592 & 3;
    bool _1606 = _1604 != 0;
    int _1608 = _1588 * _1598;
    int _1610 = _1608 + _1470;
    bool _1612 = uint(_1600) >= 2u;
    int _1614 = _1606 ? 0 : 1;
    bool _1616 = uint(_1596) >= uint(_1025);
    int _1618 = _1612 ? 0 : 1;
    bool _1620 = uint(_1610) >= uint(_1073);
    bool _1622 = !_1616;
    int _1624 = _1622 ? 0 : (-1);
    bool _1626 = !_1620;
    int _1628 = _1626 ? 0 : (-1);
    bool _1630 = uint(_1600) > 1u;
    int _1632 = ~_1554;
    int _1634 = _1632 + _1624;
    int _1636 = _1634 + 1;
    int _1638 = ~_1598;
    int _1640 = _1638 + _1628;
    int _1642 = _1640 + 1;
    int _1644 = ~_1073;
    int _1646 = _1644 + 1;
    int _1648 = _1025 * _1636;
    int _1650 = _1648 + _1258;
    bool _1652 = _1600 != 3;
    int _1654 = _1073 * _1642;
    int _1656 = _1654 + _1470;
    int _1658 = ~_1614;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    int _1664 = _1646 * _1570;
    int _1666 = _1664 + _1414;
    bool _1668 = !_1079;
    int _1670 = _1668 ? _1650 : (-1);
    int _1672 = _1662;
    if (!_1630)
    {
        int _1674 = ~_1614;
        int _1676 = _1674 + 1;
        _1672 = _1676;
    }
    int _1678 = _1672;
    bool _1680 = !_1101;
    int _1682 = _1680 ? _1656 : (-1);
    bool _1684 = _233 > 0.5;
    bool _1686 = uint(_1666) >= uint(_1073);
    int _1688 = ~_1618;
    int _1690 = _1688 + 1;
    int _1692 = _1690 + 1;
    int _1694 = _1592 >> 31;
    int _1696 = _1692;
    if (_1652)
    {
        int _1698 = ~_1618;
        int _1700 = _1698 + 1;
        _1696 = _1700;
    }
    int _1702 = _1696;
    int _1704 = _1682 >> 31;
    float _1706 = -_195;
    int _1708 = _1684 ? as_type<int>(_1706) : as_type<int>(_195);
    bool _1710 = !_1602;
    int _1712 = _1710 ? 0 : 1;
    bool _1714 = !_1686;
    int _1716 = _1714 ? 0 : (-1);
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1720 = _1718 != 0;
    int _1722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1724 = _1722 != 0;
    int _1726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1728 = _1726 != 0;
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1732 = _1730 != 0;
    int _1734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1736 = _1734 != 0;
    int _1738 = _1694 & 3;
    int _1740 = _1704 & 3;
    int _1742 = _1592 + _1738;
    int _1744 = _1682 + _1740;
    bool _1746 = !_1720;
    int _1748 = _1746 ? 0 : 1;
    int _1750 = _1682 & 3;
    bool _1752 = _1750 != 0;
    int _1754 = _1742 >> 2;
    bool _1756 = !_1728;
    int _1758 = _1756 ? 0 : 1;
    int _1760 = _1744 >> 2;
    int _1762 = _1682 & 3;
    bool _1764 = _1762 != 0;
    bool _1766 = !_1752;
    int _1768 = _1766 ? 0 : 1;
    bool _1770 = uint(_1750) > 1u;
    int _1772 = _1754 << 4;
    int _1774 = _1772 + 368;
    int _1776 = _1760 << 4;
    int _1778 = _1776 + 512;
    int _1780 = _1764 ? 0 : 1;
    bool _1782 = _1600 != 3;
    uint _1784 = uint(int(uint(_1778) >> uint(2)));
    uint _1786 = uint(int(uint(int(_1784)) >> uint(2)));
    int _1788 = int(_1784) & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    int _1792 = int(_1784) + 1;
    uint _1794 = uint(int(uint(_1792) >> uint(2)));
    int _1796 = _1792 & 3;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[int(_1794)][_1796];
    int _1800 = ~_1780;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    int _1806 = ~_1570;
    int _1808 = _1806 + _1716;
    int _1810 = _1808 + 1;
    int _1812 = _1804;
    if (!_1770)
    {
        int _1814 = ~_1780;
        int _1816 = _1814 + 1;
        _1812 = _1816;
    }
    int _1818 = _1812;
    bool _1820 = !_1782;
    int _1822 = _1820 ? 0 : (-1);
    uint _1824 = uint(int(uint(_1774) >> uint(2)));
    uint _1826 = uint(int(uint(int(_1824)) >> uint(2)));
    int _1828 = int(_1824) & 3;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[int(_1826)][_1828];
    int _1832 = int(_1824) + 1;
    uint _1834 = uint(int(uint(_1832) >> uint(2)));
    int _1836 = _1832 & 3;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[int(_1834)][_1836];
    bool _1840 = _1750 != 3;
    int _1842 = _1073 * _1810;
    int _1844 = _1842 + _1414;
    bool _1846 = uint(_1750) >= 2u;
    int _1848 = _1846 ? 0 : 1;
    int _1850 = _1778 + 8;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    uint _1854 = uint(int(uint(int(_1852)) >> uint(2)));
    int _1856 = int(_1852) & 3;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[int(_1854)][_1856];
    int _1860 = int(_1852) + 1;
    uint _1862 = uint(int(uint(_1860) >> uint(2)));
    int _1864 = _1860 & 3;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[int(_1862)][_1864];
    bool _1868 = _1750 != 3;
    int _1870 = ~_1848;
    int _1872 = _1870 + 1;
    int _1874 = _1872 + 1;
    bool _1876 = !_1101;
    int _1878 = _1876 ? _1844 : (-1);
    int _1880 = _1874;
    if (_1840)
    {
        int _1882 = ~_1848;
        int _1884 = _1882 + 1;
        _1880 = _1884;
    }
    int _1886 = _1880;
    int _1888 = _1774 + 8;
    uint _1890 = uint(int(uint(_1888) >> uint(2)));
    uint _1892 = uint(int(uint(int(_1890)) >> uint(2)));
    int _1894 = int(_1890) & 3;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[int(_1892)][_1894];
    int _1898 = int(_1890) + 1;
    uint _1900 = uint(int(uint(_1898) >> uint(2)));
    int _1902 = _1898 & 3;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[int(_1900)][_1902];
    int _1906 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1908 = _1906 != 0;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1914 = abs(_1818);
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1918 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1922 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1926 = abs(_1678);
    int _1928 = abs(_1712);
    out.m_76.x = _1918;
    out.m_76.y = _1922;
    out.m_76.z = _1924;
    out.m_76.w = _1920;
    bool _1930 = !_1868;
    int _1932 = _1930 ? 0 : (-1);
    bool _1934 = _227 > 0.5;
    bool _1936 = _229 > 0.5;
    int _1938 = ~_1926;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1946 = -_191;
    int _1948 = _1934 ? as_type<int>(_1946) : as_type<int>(_191);
    float _1950 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1952 = int(_1950);
    int _1954 = _1942 * as_type<int>(_1838);
    float _1956 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1958 = abs(_1768);
    float _1960 = _841 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1962 = ~_1914;
    int _1964 = _1962 + 1;
    int _1966 = _1964 + 1;
    bool _1968 = _231 > 0.5;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1972 = ~_1928;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    int _1978 = _1966 * as_type<int>(_1798);
    int _1980 = ~_1958;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    float _1986 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1988 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1990 = _1976 * as_type<int>(_1830);
    int _1992 = _1990 + _1954;
    int _1994 = abs(_1702);
    int _1996 = _1984 * as_type<int>(_1790);
    int _1998 = _1996 + _1978;
    int _2000 = abs(_1886);
    float _2002 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2004 = int(_2002);
    out.m_78.x = _1956;
    out.m_78.y = _1986;
    out.m_78.z = _1988;
    int _2006 = abs(_1822);
    float _2008 = _821 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2010 = abs(_1932);
    float _2012 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2014 = ~_1994;
    int _2016 = _2014 + 1;
    int _2018 = _2016 + 1;
    float _2020 = as_type<float>(_1886);
    if (_933)
    {
        float _2022 = _981 * 6.283185482025146484375;
        float _2024 = cos(_2022);
        _2020 = _2024;
    }
    float _2026 = _2020;
    bool _2028 = !_1724;
    float _2030 = _2028 ? _195 : as_type<float>(_1708);
    float _2032 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2012);
    bool _2034 = !_1908;
    float _2036 = _2034 ? _191 : as_type<float>(_1948);
    int _2038 = _2018 * as_type<int>(_1896);
    int _2040 = _2038 + _1992;
    int _2042 = ~_2000;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    float _2048 = float(uint(_1952));
    float _2050 = _841 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2052 = _2046 * as_type<int>(_1858);
    int _2054 = _2052 + _1998;
    int _2056 = ~_2010;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    int _2062 = ~_2006;
    int _2064 = _2062 + 1;
    int _2066 = _2064 + 1;
    float _2068 = 1.0 / _2048;
    int _2070 = abs(_1748);
    int _2072 = _2060 * as_type<int>(_1866);
    int _2074 = _2072 + _2054;
    int _2076 = abs(_1952);
    int _2078 = _2066 * as_type<int>(_1904);
    int _2080 = _2078 + _2040;
    int _2082 = abs(_1758);
    float _2084 = -_815;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2008);
    int _2088 = ~_2070;
    int _2090 = _2088 + 1;
    int _2092 = _2090 + 1;
    float _2094 = float(uint(_2004));
    int _2096 = abs(_2004);
    int _2098 = _2080 * _2092;
    float _2100 = 1.0 / _2094;
    int _2102 = ~_2082;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    int _2108 = _1670 * _2070;
    int _2110 = _2108 + _2098;
    float _2112 = float(uint(_2096));
    float _2114 = _821 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2116 = float(uint(_2076));
    int _2118 = _2074 * _2106;
    int _2120 = ~_1952;
    int _2122 = _2120 + 1;
    float _2124 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2126 = _821 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2128 = 1.0 / _2112;
    int _2130 = _1878 * _2082;
    int _2132 = _2130 + _2118;
    int _2134 = as_type<int>(_2068) + (-2);
    float _2136 = -_815;
    float _2138 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2126);
    float _2140 = float(uint(_2110));
    float _2142 = -_815;
    float _2144 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2114);
    int _2146 = as_type<int>(_2100) + (-2);
    float _2148 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2150 = 1.0 / _2116;
    float _2152 = as_type<float>(_2134) * _2140;
    float _2154 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2138);
    int _2156 = abs(_2132);
    float _2158 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2144);
    int _2160 = abs(_2110);
    float _2162 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2148);
    float _2164 = trunc(_2152);
    float _2166 = precise::max(_2164, 0.0);
    uint _2168 = uint(_2166);
    float _2170 = float(uint(_2132));
    float _2172 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2124);
    int _2174 = as_type<int>(_2128) + (-2);
    float _2176 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1960);
    float _2178 = as_type<float>(_2146) * _2170;
    float _2180 = float(uint(_2160));
    float _2182 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2086);
    int _2184 = as_type<int>(_2150) + (-2);
    float _2186 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2162);
    float _2188 = float(uint(_2156));
    float _2190 = trunc(_2178);
    float _2192 = precise::max(_2190, 0.0);
    uint _2194 = uint(_2192);
    int _2196 = ~_2096;
    int _2198 = _2196 + 1;
    float _2200 = as_type<float>(_2184) * _2180;
    float _2202 = _841 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2204 = as_type<float>(_2174) * _2188;
    float _2206 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2050);
    int _2208 = _2122 * int(_2168);
    int _2210 = _2208 + _2110;
    float _2212 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2202);
    float _2214 = trunc(_2200);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    float _2220 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2206);
    float _2222 = _2202;
    float _2224 = as_type<float>(_2198);
    float _2226 = _2032;
    if (_933)
    {
        float _2228 = _2026 + (-1.0);
        _2222 = _2228;
    }
    float _2230 = _2222;
    float _2232 = float(uint(_2210));
    float _2234 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2212);
    float _2236 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2176);
    int _2238 = ~_2076;
    int _2240 = _2238 + 1;
    float _2242 = _2230;
    if (_933)
    {
        float _2244 = _2230 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2242 = _2244;
    }
    float _2246 = _2242;
    float _2248 = trunc(_2204);
    float _2250 = precise::max(_2248, 0.0);
    uint _2252 = uint(_2250);
    int _2254 = ~_2004;
    int _2256 = _2254 + 1;
    float _2258 = as_type<float>(_2134) * _2232;
    if (_933)
    {
        float _2260 = fma(_929, _2026, _2246);
        _949 = _2260;
    }
    float _2262 = _949;
    float _2264 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2266 = _2256 * int(_2194);
    int _2268 = _2266 + _2132;
    bool _2270 = _2004 == 0;
    int _2272 = _2240 * int(_2218);
    int _2274 = _2272 + _2160;
    float _2276 = trunc(_2258);
    float _2278 = precise::max(_2276, 0.0);
    uint _2280 = uint(_2278);
    float _2282 = float(uint(_2268));
    float _2284 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2286 = float(uint(_2274));
    float _2288 = -_195;
    int _2290 = _1936 ? as_type<int>(_2288) : as_type<int>(_195);
    int _2292 = _2198 * int(_2252);
    int _2294 = _2292 + _2156;
    if (_933)
    {
        float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2298 = _1003 + _2296;
        _2224 = _2298;
    }
    float _2300 = _2224;
    float _2302 = _2284 * _2158;
    bool _2304 = !_1732;
    float _2306 = _2304 ? _195 : as_type<float>(_2290);
    float _2308 = float(uint(_2294));
    float _2310 = as_type<float>(_2146) * _2282;
    float _2312 = _2302;
    if (_933)
    {
        float _2314 = _2300 * _2300;
        _951 = _2314;
    }
    float _2316 = _951;
    float _2318 = -_191;
    int _2320 = _1968 ? as_type<int>(_2318) : as_type<int>(_191);
    float _2322 = as_type<float>(_2184) * _2286;
    float _2324 = as_type<float>(_2174) * _2308;
    float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2328 = _2262 + _2326;
    float _2330 = trunc(_2310);
    float _2332 = precise::max(_2330, 0.0);
    uint _2334 = uint(_2332);
    bool _2336 = !_1736;
    float _2338 = _2336 ? _191 : as_type<float>(_2320);
    float _2340 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2032);
    float _2342 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2172);
    if (!_933)
    {
        _2226 = _921;
    }
    float _2344 = _2226;
    float _2346 = _2284 * _2154;
    float _2348 = fma(_2264, _2340, _2302);
    float _2350 = _2344;
    if (_933)
    {
        float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2354 = _1007 + _2352;
        _2312 = _2354;
    }
    float _2356 = _2312;
    float _2358 = trunc(_2322);
    float _2360 = precise::max(_2358, 0.0);
    uint _2362 = uint(_2360);
    float _2364 = _2284 * _2182;
    float _2366 = fma(_2264, _2186, _2346);
    if (_933)
    {
        float _2368 = _2356 * _2356;
        _2350 = _2368;
    }
    float _2370 = _2350;
    bool _2372 = _2004 == 0;
    float _2374 = fma(_2264, _2342, _2364);
    out.m_80.x = _2340;
    out.m_80.y = _2186;
    out.m_80.z = _2342;
    float _2376 = trunc(_2324);
    float _2378 = precise::max(_2376, 0.0);
    uint _2380 = uint(_2378);
    float _2382 = fma(_2328, _2328, _2316);
    int _2384 = int(_2168) + int(_2280);
    int _2386 = ~_2076;
    int _2388 = _2386 + 1;
    int _2390 = int(_2194) + int(_2334);
    int _2392 = int(_2218) + int(_2362);
    float _2394 = _2382 + _2370;
    int _2396 = ~_2004;
    int _2398 = _2396 + 1;
    int _2400 = ~_1952;
    int _2402 = _2400 + 1;
    int _2404 = _2398 * _2390;
    int _2406 = _2404 + _2132;
    int _2408 = int(_2252) + int(_2380);
    int _2410 = _2388 * _2392;
    int _2412 = _2410 + _2160;
    int _2414 = ~_2096;
    int _2416 = _2414 + 1;
    int _2418 = _2402 * _2384;
    int _2420 = _2418 + _2110;
    bool _2422 = uint(_2406) >= uint(_2004);
    float _2424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2426 = uint(_2412) >= uint(_2076);
    int _2428 = _2416 * _2408;
    int _2430 = _2428 + _2156;
    bool _2432 = uint(_2420) >= uint(_1952);
    bool _2434 = !_2422;
    int _2436 = _2434 ? 0 : (-1);
    bool _2438 = !_2432;
    int _2440 = _2438 ? 0 : (-1);
    float _2442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2444 = uint(_2430) >= uint(_2096);
    int _2446 = _2110 ^ _1952;
    int _2448 = ~_2390;
    int _2450 = _2448 + _2436;
    int _2452 = _2450 + 1;
    int _2454 = ~_2384;
    int _2456 = _2454 + _2440;
    int _2458 = _2456 + 1;
    float _2460 = _2424 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2462 = !_2426;
    int _2464 = _2462 ? 0 : (-1);
    float _2466 = sqrt(_2394);
    uint _2468 = uint(int(uint(_2446) >> uint(31)));
    int _2470 = _1952 * _2458;
    int _2472 = _2470 + _2110;
    int _2474 = _2132 ^ _2004;
    int _2476 = _2004 * _2452;
    int _2478 = _2476 + _2132;
    bool _2480 = _1952 == 0;
    float _2482 = _2442 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2484 = _1952 == 0;
    int _2486 = ~_2464;
    int _2488 = _2392 + _2486;
    int _2490 = _2488 + 1;
    float _2492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2494 = ~int(_2468);
    int _2496 = _2494 + 1;
    bool _2498 = !_2444;
    float _2500 = _2498 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    uint _2502 = uint(int(uint(_2474) >> uint(31)));
    int _2504 = _2490 ^ _2496;
    float _2506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2508 = !_2480;
    int _2510 = _2508 ? _2472 : (-1);
    int _2512 = ~as_type<int>(_2500);
    int _2514 = _2408 + _2512;
    int _2516 = _2514 + 1;
    int _2518 = ~int(_2502);
    int _2520 = _2518 + 1;
    int _2522 = ~_2496;
    int _2524 = _2522 + _2504;
    int _2526 = _2524 + 1;
    float _2528 = fma(_2284, _2284, 1.0);
    float _2530 = float(_2510);
    int _2532 = _2516 ^ _2520;
    bool _2534 = !_2270;
    int _2536 = _2534 ? _2478 : (-1);
    float _2538 = fma(_2460, _2530, _631);
    float _2540 = rsqrt(_2528);
    int _2542 = ~_2520;
    int _2544 = _2542 + _2532;
    int _2546 = _2544 + 1;
    float _2548 = _2492 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2550 = !_2484;
    int _2552 = _2550 ? _2526 : (-1);
    float _2554 = _2506 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2556 = float(_2536);
    float _2558 = _2036 + 0.5;
    float _2560 = float(_2552);
    out.m_82.x = _1017;
    out.m_82.y = _1019;
    out.m_82.z = _1021;
    bool _2562 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2564 = isnan(_2466);
    bool _2566 = _2562 || _2564;
    bool _2568 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2570 = _2566 || _2568;
    float _2572 = fma(_2548, _2556, _615);
    bool _2574 = !_2372;
    int _2576 = _2574 ? _2546 : (-1);
    float _2578 = -_329;
    float _2580 = fma(_2482, _2560, _2578);
    float _2582 = _2338 + 0.5;
    float _2584 = fma(_2460, _2558, _2538);
    float _2586 = float(_2576);
    float _2588 = _2306 + (-0.5);
    float _2590 = fma(_2548, _2582, _2572);
    float _2592 = _2284 * _2540;
    float _2594 = -_1061;
    float _2596 = fma(_2036, _2594, _2584);
    float _2598 = -_565;
    float _2600 = fma(_2554, _2586, _2598);
    float _2602 = _2030 + (-0.5);
    float _2604 = -_2482;
    float _2606 = fma(_2604, _2588, _2580);
    float _2608 = -_2220;
    float _2610 = _2592 * _2608;
    float _2612 = -_2234;
    float _2614 = _2592 * _2612;
    float _2616 = -_2236;
    float _2618 = _2592 * _2616;
    float _2620 = -_2554;
    float _2622 = fma(_2620, _2602, _2600);
    float _2624 = fma(_2540, _2158, _2610);
    float _2626 = fma(_2540, _2154, _2614);
    float _2628 = -_1053;
    float _2630 = fma(_2338, _2628, _2590);
    float _2632 = fma(_2306, _1043, _2606);
    float _2634 = fma(_2540, _2182, _2618);
    float _2636 = _2220 + _2348;
    float _2638 = fma(_2030, _1067, _2622);
    float _2640 = _2234 + _2366;
    float _2642 = _2236 + _2374;
    out.m_84.x = _2624;
    out.m_84.y = _2626;
    out.m_84.z = _2634;
    float _2644 = as_type<float>(_2384);
    float _2646 = _2370;
    float _2648 = _2500;
    float _2650 = _2618;
    if (!_2570)
    {
        _1174 = 1.0;
    }
    float _2652 = _1174;
    out.m_86.x = _2596;
    out.m_86.y = _2632;
    out.m_86.z = _2630;
    out.m_86.w = _2638;
    out.m_88.x = _2636;
    out.m_88.y = _2640;
    out.m_88.z = _2642;
    bool _2654 = !_2570;
    float _2656 = _2652;
    if (!_2654)
    {
        bool _2658 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2660 = isnan(_2466);
        bool _2662 = _2658 || _2660;
        bool _2664 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2666 = _2662 || _2664;
        if (!_2666)
        {
            float _2668 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2670 = _2466 + _2668;
            float _2672 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2674 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2672;
            float _2676 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2678 = _2676 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2680 = 1.0 / _2674;
            float _2682 = _2670 * _2680;
            float _2684 = fma(_2682, _2678, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2656 = _2684;
            _2686 = true;
        }
        else
        {
            bool _2688 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2690 = isnan(_2466);
            bool _2692 = _2688 || _2690;
            bool _2694 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2696 = _2692 || _2694;
            if (!_2696)
            {
                float _2698 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2700 = _2466 + _2698;
                float _2702 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2704 = _2702 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2706 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2708 = _2706 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2710 = 1.0 / _2704;
                float _2712 = _2700 * _2710;
                float _2714 = fma(_2712, _2708, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2656 = _2714;
                _2686 = true;
            }
            else
            {
                _2656 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2686 = false;
    float _2716 = _2656;
    float _2718 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2720 = _2262 + _2718;
    float _2722 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2724 = _1003 + _2722;
    float _2726 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2728 = _1007 + _2726;
    float _2730 = fma(_2720, _2716, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2732 = fma(_2724, _2716, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2734 = fma(_2728, _2716, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2736 = _923 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2740 = _2730 + _2738;
    float _2742 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2744 = _2732 + _2742;
    float _2746 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2748 = _2734 + _2746;
    float _2750 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2736);
    float _2752 = _2740 * _2740;
    float _2754 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2750);
    float _2756 = fma(_2744, _2744, _2752);
    float _2758 = _923 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2760 = _2754 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2762 = fma(_2748, _2748, _2756);
    float _2764 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2758);
    float _2766 = 1.0 / _2760;
    float _2768 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2770 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2764);
    float _2772 = _2770 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2774 = rsqrt(_2762);
    float _2776 = _2772 + _2760;
    float _2778 = _2776 * _2766;
    float _2780 = _2778 * 0.5;
    float _2782 = floor(_2768);
    float _2784 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2786 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2784);
    float _2788 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2790 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2792 = _923 + _2788;
    float _2794 = 1.0 / _2786;
    float _2796 = _2744 * _2790;
    float _2798 = _2748 * _2790;
    float _2800 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2802 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2804 = _2796 * _2796;
    float _2806 = _2798 * _2798;
    float _2808 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2800);
    float _2810 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2802);
    float _2812 = -_2782;
    float _2814 = _2768 + _2812;
    float _2816 = _2804 + _2806;
    float _2818 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2808);
    float _2820 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2810);
    float _2822 = sqrt(_2762);
    float _2824 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2826 = _2794 * _2824;
    float _2828 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2830 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2832 = _2826 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2834 = sqrt(_2816);
    bool _2836 = _2826 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2838 = trunc(_2828);
    int _2840 = int(_2838);
    int _2842 = 2;
    float _2844 = _2816;
    float _2846 = _2790;
    float _2848 = _2796;
    float _2850 = _2804;
    if (!_2832)
    {
        _2842 = 1;
    }
    int _2852 = _2842;
    bool _2854 = _2834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2858 = _2834 + _2856;
    float _2860 = trunc(_2830);
    int _2862 = int(_2860);
    int _2864 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2866 = _2840 + _2864;
    int _2868 = _2866 + 1;
    float _2870 = _2760;
    float _2872 = _2858;
    int _2874 = _2852;
    if (_2854)
    {
        float _2876 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2870 = _2876;
    }
    float _2878 = _2870;
    int _2880 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2882 = _2862 + _2880;
    int _2884 = _2882 + 1;
    if (_2854)
    {
        float _2886 = rsqrt(_2816);
        _2844 = _2886;
    }
    float _2888 = _2844;
    float _2890 = _2888;
    if (_2854)
    {
        float _2892 = _2858 * _2878;
        _2872 = _2892;
    }
    float _2894 = _2872;
    if (_2854)
    {
        float _2896 = _2894 * 0.15915493667125701904296875;
        _2644 = _2896;
    }
    float _2898 = _2644;
    bool _2900 = !_2832;
    int _2902 = _2900 ? 0 : 1;
    float _2904 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2906 = _2820;
    if (_2854)
    {
        float _2908 = _2898 * 6.283185482025146484375;
        float _2910 = sin(_2908);
        _2906 = _2910;
    }
    float _2912 = _2906;
    if (!_2836)
    {
        _2874 = _2902;
    }
    int _2914 = _2874;
    float _2916 = precise::max(0.0, _2904);
    int _2918 = _2914 << 6;
    bool _2920 = _2868 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2922 = -_2790;
    float _2924 = -_2916;
    float _2926 = fma(_2740, _2922, _2924);
    int _2928 = _2918 + 96;
    uint _2930 = uint(int(uint(_2928) >> uint(2)));
    uint _2932 = uint(int(uint(int(_2930)) >> uint(2)));
    int _2934 = int(_2930) & 3;
    float _2936 = (*spvDescriptorSet0.vp_c15)._m0[int(_2932)][_2934];
    int _2938 = int(_2930) + 1;
    uint _2940 = uint(int(uint(_2938) >> uint(2)));
    int _2942 = _2938 & 3;
    float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
    int _2946 = _2868 | _2884;
    float _2948 = _2898;
    float _2950 = as_type<float>(_2946);
    float _2952 = _2926;
    if (_2854)
    {
        float _2954 = _2898 * 6.283185482025146484375;
        float _2956 = cos(_2954);
        _2948 = _2956;
    }
    float _2958 = _2948;
    if (_2854)
    {
        float _2960 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2846 = _2960;
    }
    float _2962 = _2846;
    bool _2964 = _2946 < 0;
    bool _2966 = _2964 || _2920;
    if (_2854)
    {
        float _2968 = fma(_2912, _2962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2950 = _2968;
    }
    float _2970 = _2950;
    int _2972 = _2918 + 48;
    uint _2974 = uint(int(uint(_2972) >> uint(2)));
    uint _2976 = uint(int(uint(int(_2974)) >> uint(2)));
    int _2978 = int(_2974) & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    int _2982 = int(_2974) + 1;
    uint _2984 = uint(int(uint(_2982) >> uint(2)));
    int _2986 = _2982 & 3;
    float _2988 = (*spvDescriptorSet0.vp_c15)._m0[int(_2984)][_2986];
    float _2990 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2992 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_2854)
    {
        float _2994 = _2888 * _2970;
        _2646 = _2994;
    }
    float _2996 = _2646;
    bool _2998 = _2884 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3000 = _2998 || _2966;
    float _3002 = fma(_2732, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2990);
    float _3004 = floor(_2992);
    if (_2854)
    {
        float _3006 = _2796 * _2996;
        _2848 = _3006;
    }
    float _3008 = _2848;
    int _3010 = _2918 + 104;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    uint _3014 = uint(int(uint(int(_3012)) >> uint(2)));
    int _3016 = int(_3012) & 3;
    float _3018 = (*spvDescriptorSet0.vp_c15)._m0[int(_3014)][_3016];
    int _3020 = int(_3012) + 1;
    uint _3022 = uint(int(uint(_3020) >> uint(2)));
    int _3024 = _3020 & 3;
    float _3026 = (*spvDescriptorSet0.vp_c15)._m0[int(_3022)][_3024];
    float _3028 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3002);
    float _3030 = _3028;
    if (_2854)
    {
        float _3032 = _2958 + (-1.0);
        _2890 = _3032;
    }
    float _3034 = _2890;
    float _3036 = _3034;
    if (_2854)
    {
        float _3038 = _3008 * _3008;
        _2850 = _3038;
    }
    float _3040 = _2850;
    if (_2854)
    {
        float _3042 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2648 = _3042;
    }
    float _3044 = _2648;
    if (!_2854)
    {
        _3036 = _2798;
    }
    float _3046 = _3036;
    int _3048 = _2918 + 64;
    uint _3050 = uint(int(uint(_3048) >> uint(2)));
    uint _3052 = uint(int(uint(int(_3050)) >> uint(2)));
    int _3054 = int(_3050) & 3;
    float _3056 = (*spvDescriptorSet0.vp_c15)._m0[int(_3052)][_3054];
    int _3058 = int(_3050) + 1;
    uint _3060 = uint(int(uint(_3058) >> uint(2)));
    int _3062 = _3058 & 3;
    float _3064 = (*spvDescriptorSet0.vp_c15)._m0[int(_3060)][_3062];
    float _3066 = _3046;
    if (_2854)
    {
        float _3068 = _2798 * _2996;
        _3066 = _3068;
    }
    float _3070 = _3066;
    if (_2854)
    {
        float _3072 = fma(_2926, _2958, _3044);
        _2952 = _3072;
    }
    float _3074 = _2952;
    float _3076 = _3028 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_2854)
    {
        _3030 = _2806;
    }
    float _3078 = _3030;
    float _3080 = _3078;
    if (_2854)
    {
        float _3082 = _3070 * _3070;
        _3080 = _3082;
    }
    float _3084 = _3080;
    float _3086 = fma(_3074, _3074, _3040);
    if (!_3000)
    {
        float _3088 = floor(_2830);
        _2650 = _3088;
    }
    float _3090 = _2650;
    int _3092 = _2918 + 80;
    uint _3094 = uint(int(uint(_3092) >> uint(2)));
    uint _3096 = uint(int(uint(int(_3094)) >> uint(2)));
    int _3098 = int(_3094) & 3;
    float _3100 = (*spvDescriptorSet0.vp_c15)._m0[int(_3096)][_3098];
    int _3102 = int(_3094) + 1;
    uint _3104 = uint(int(uint(_3102) >> uint(2)));
    int _3106 = _3102 & 3;
    float _3108 = (*spvDescriptorSet0.vp_c15)._m0[int(_3104)][_3106];
    float _3110 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3112 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3114 = -_3004;
    float _3116 = _2992 + _3114;
    float _3118 = _3086 + _3084;
    float _3120 = -_3112;
    float _3122 = fma(_3120, _3110, 1.0);
    int _3124 = as_type<int>(_3112);
    if (!_3000)
    {
        int _3126 = _2884 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3128 = _3126 + _2868;
        _3124 = _3128;
    }
    int _3130 = _3124;
    int _3132 = _2918 + 56;
    uint _3134 = uint(int(uint(_3132) >> uint(2)));
    uint _3136 = uint(int(uint(int(_3134)) >> uint(2)));
    int _3138 = int(_3134) & 3;
    float _3140 = (*spvDescriptorSet0.vp_c15)._m0[int(_3136)][_3138];
    int _3142 = int(_3134) + 1;
    uint _3144 = uint(int(uint(_3142) >> uint(2)));
    int _3146 = _3142 & 3;
    float _3148 = (*spvDescriptorSet0.vp_c15)._m0[int(_3144)][_3146];
    float _3150 = log2(_3122);
    int _3152 = _2918 + 88;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    uint _3156 = uint(int(uint(int(_3154)) >> uint(2)));
    int _3158 = int(_3154) & 3;
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[int(_3156)][_3158];
    int _3162 = int(_3154) + 1;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    int _3166 = _3162 & 3;
    float _3168 = (*spvDescriptorSet0.vp_c15)._m0[int(_3164)][_3166];
    float _3170 = _2792 * _2944;
    float _3172 = fma(_887, _2936, _3170);
    int _3174 = _2918 + 72;
    uint _3176 = uint(int(uint(_3174) >> uint(2)));
    uint _3178 = uint(int(uint(int(_3176)) >> uint(2)));
    int _3180 = int(_3176) & 3;
    float _3182 = (*spvDescriptorSet0.vp_c15)._m0[int(_3178)][_3180];
    int _3184 = int(_3176) + 1;
    uint _3186 = uint(int(uint(_3184) >> uint(2)));
    int _3188 = _3184 & 3;
    float _3190 = (*spvDescriptorSet0.vp_c15)._m0[int(_3186)][_3188];
    float _3192 = _2792 * _2988;
    float _3194 = rsqrt(_3118);
    float _3196 = _3150 * 0.693147182464599609375;
    float _3198 = fma(_887, _2980, _3192);
    int _3200 = as_type<int>(_3192);
    int _3202 = as_type<int>(_2936);
    if (!_3000)
    {
        int _3204 = _3130 << 2;
        _3200 = _3204;
    }
    int _3206 = _3200;
    float _3208 = fma(_889, _3018, _3172);
    int _3210 = _3206;
    if (!_3000)
    {
        int _3212 = 12 & _3206;
        _3210 = _3212;
    }
    int _3214 = _3210;
    float _3216 = _3208 + _3026;
    float _3218 = _2792 * _3064;
    float _3220 = _3064;
    int _3222 = as_type<int>(_3108);
    if (!_3000)
    {
        float _3224 = -_3090;
        float _3226 = _2830 + _3224;
        _3220 = _3226;
    }
    float _3228 = _3220;
    float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3232 = fma(_2822, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3230);
    float _3234 = precise::clamp(_3232, 0.0, 1.0);
    float _3236 = _3194 * _3008;
    float _3238 = fma(_887, _3056, _3218);
    float _3240 = _3194 * _3074;
    float _3242 = _3194 * _3070;
    float _3244 = _3236 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3246 = _2792 * _3108;
    if (!_3000)
    {
        uint _3248 = uint(int(uint(_3130) >> uint(2)));
        _3222 = int(_3248);
    }
    int _3250 = _3222;
    float2 _8836 = float2(_2814, _3116);
    float _3252 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8836, float2(0.0), isnan(_8836)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8836, float2(0.0), isnan(_8836)), level(0.0)).x;
    float _3254 = _3196 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3256 = fma(_887, _3100, _3246);
    float _3258 = -_3234;
    float _3260 = _3258 + 1.0;
    if (!_3000)
    {
        int _3262 = _3250 << 4;
        int _3264 = _3262 + _3214;
        _3202 = _3264;
    }
    int _3266 = _3202;
    float _3268 = fma(_889, _3140, _3198);
    float _3270 = 1.0 / _3216;
    float _3272 = _3234;
    if (!_3000)
    {
        int _3274 = _3266 + 400;
        uint _3276 = uint(int(uint(_3274) >> uint(2)));
        uint _3278 = uint(int(uint(int(_3276)) >> uint(2)));
        int _3280 = int(_3276) & 3;
        float _3282 = (*spvDescriptorSet0.vp_c15)._m0[int(_3278)][_3280];
        _3272 = _3282;
    }
    float _3284 = _3272;
    float _3286 = _3268 + _3148;
    float _3288 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3290 = fma(_889, _3160, _3256);
    float _3292 = -_3244;
    float _3294 = fma(_3240, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3292);
    float _3296 = abs(_3260);
    float _3298 = log2(_3296);
    float _3300 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3302 = fma(_2732, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3288);
    float _3304 = -_3242;
    float _3306 = fma(_3304, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3294);
    float _3308 = _3240 + 1.0;
    float _3310 = fma(_2732, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3300);
    float _3312 = fma(_889, _3182, _3238);
    float _3314 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3302);
    float _3316 = _3286 * _3270;
    float _3318 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3310);
    float _3320 = _3312 + _3190;
    float _3322 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3324 = fma(_3306, -0.5, 0.5);
    bool _3326 = _3316 >= 0.0;
    float _3328 = _3320 * _3270;
    float _3330 = fma(_2732, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3322);
    float _3332 = _3298 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _3334 = _3316 <= 1.0;
    bool _3336 = _3334 && _3326;
    float _3338 = _3318 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3340 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3330);
    float _3342 = exp2(_3332);
    bool _3344 = _3328 >= 0.0;
    bool _3346 = _3344 && _3336;
    float _3348 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3350 = _3340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3352 = fma(_3306, 0.5, 0.5);
    bool _3354 = _3328 <= 1.0;
    bool _3356 = _3354 && _3346;
    float _3358 = _3314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3360 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3348);
    float _3362 = sqrt(_3324);
    float _3364 = _3290 + _3168;
    float _3366 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3360);
    float _3368 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3370 = fma(_3352, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3372 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3366);
    float _3374 = -_3240;
    float _3376 = fma(_3342, _3308, _3374);
    float _3378 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3368);
    float _3380 = fma(_3352, _3370, -0.212114393711090087890625);
    float _3382 = 1.0 / _3372;
    float _3384 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3386 = _3308;
    if (_3356)
    {
        float _3388 = float(_2914);
        _3386 = _3388;
    }
    float _3390 = _3386;
    float _3392 = fma(_3352, _3380, 1.570728778839111328125);
    float _3394 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3378);
    float _3396 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3384);
    float _3398 = _3362 * 0.636619746685028076171875;
    float _3400 = _3364 * _3270;
    float _3402 = _3390;
    float _3404 = _3400;
    if (_3356)
    {
        float _3406 = rint(_3390);
        float _3408 = precise::max(_3406, 0.0);
        uint _3410 = uint(_3408);
        uint _3412 = clamp(_3410, 0u, 65535u);
        _3402 = as_type<float>(_3412);
    }
    float _3414 = _3402;
    float _3416 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3396);
    float _3418 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3394);
    float _3420 = -_3392;
    float _3422 = fma(_3398, _3420, 1.0);
    float _3424 = fma(_3376, 0.5, 0.5);
    float _3426 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3416);
    float _3428 = _3314;
    if (!_3000)
    {
        float _3430 = floor(_2828);
        _3428 = _3430;
    }
    float _3432 = _3428;
    float _3434 = _3418 * _3382;
    float _3436 = _3426 * _3382;
    float _3438 = fma(_3434, 0.5, 0.5);
    float _3440 = fma(_3436, -0.5, 0.5);
    float _3442 = _3414;
    if (_3356)
    {
        float3 _9165 = float3(_3316, _3328, float(as_type<int>(_3414)));
        float3 _9169 = select(_9165, float3(0.0), isnan(_9165));
        float _3444 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9169.xy, uint(rint(_9169.z)), _3400, level(0.0));
        _3442 = _3444;
    }
    float _3446 = _3442;
    float _3448 = _3270;
    if (!_3000)
    {
        float _3450 = rint(_3284);
        float _3452 = precise::max(_3450, 0.0);
        uint _3454 = uint(_3452);
        uint _3456 = clamp(_3454, 0u, 65535u);
        _3448 = as_type<float>(_3456);
    }
    float _3458 = _3448;
    float3 _9195 = float3(_3438, _3440, _3254);
    float _3460 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9195, float3(0.0), isnan(_9195)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9195, float3(0.0), isnan(_9195)), level(0.0)).x;
    float _3462 = _3432;
    if (!_3000)
    {
        float _3464 = -_3432;
        float _3466 = _2828 + _3464;
        _3462 = _3466;
    }
    float _3468 = _3462;
    float3 _9216 = float3(_3438, _3440, _3254);
    float4 _3471 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9216, float3(0.0), isnan(_9216)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9216, float3(0.0), isnan(_9216)), level(0.0)).xyzw;
    float _3473 = _3471.x;
    float _3475 = _3471.y;
    float _3477 = _3471.z;
    float _3479 = _3471.w;
    float2 _9232 = float2(_3422, _3424);
    float3 _3481 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9232, float2(0.0), isnan(_9232)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9232, float2(0.0), isnan(_9232)), level(0.0)).xyz;
    float _3483 = _3481.x;
    float _3485 = _3481.y;
    float _3487 = _3481.z;
    float _3489 = _3458;
    float _3491 = _3468;
    if (!_3000)
    {
        float3 _9254 = float3(_3468, _3228, float(as_type<int>(_3458)));
        float3 _9256 = select(_9254, float3(0.0), isnan(_9254));
        float _3493 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9256.xy, uint(rint(_9256.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9256.xy, uint(rint(_9256.z)), level(0.0)).x;
        _3489 = _3493;
    }
    float _3495 = _3489;
    float _3497 = abs(_2826);
    float _3499 = log2(_3497);
    float _3501 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3503 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3501);
    float _3505 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3503);
    bool _3507 = _2826 <= 8000.0;
    bool _3509 = isnan(_2826);
    bool _3511 = _3507 || _3509;
    bool _3513 = isnan(8000.0);
    bool _3515 = _3511 || _3513;
    float _3517 = float(_3515);
    float _3519 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3505);
    float _3521 = _3298 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3523 = _3499 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_3356)
    {
        _3491 = 1.0;
    }
    float _3525 = _3491;
    out.gl_Position.x = _3418;
    out.gl_Position.y = _3426;
    out.gl_Position.z = _3519;
    out.gl_Position.w = _3372;
    float _3527 = exp2(_3521);
    float _3529 = exp2(_3523);
    float _3531 = fma(_3529, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3533 = precise::clamp(_3531, 0.0, 1.0);
    float _3535 = fma(_3533, -2.0, 3.0);
    float _3537 = _3533 * _3533;
    float _3539 = _3537 * _3535;
    float _3541 = _3519 + _3372;
    float _3543 = _3541 * 0.5;
    float _3545 = -_3539;
    float _3547 = _3545 + 1.0;
    out.m_90.z = _3543;
    out.m_90.w = _3372;
    float _3549 = fma(_3547, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3539);
    float _3551 = _3517 * _3549;
    float _3553 = -_3527;
    float _3555 = _3553 + 1.0;
    float _3557 = _3551 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3559 = _3555 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3561 = -_3252;
    float _3563 = _3561 + 1.0;
    float _3565 = _3563 * _3557;
    float _3567 = precise::clamp(_3565, 0.0, 1.0);
    float _3569 = _3557;
    float _3571 = _3525;
    float _3573 = _3567;
    if (_3000)
    {
        _3569 = 1.0;
    }
    float _3575 = _3569;
    float _3577 = _3575;
    if (_3356)
    {
        bool _3579 = _3446 >= _3400;
        bool _3581 = isnan(_3446);
        bool _3583 = _3579 || _3581;
        bool _3585 = isnan(_3400);
        bool _3587 = _3583 || _3585;
        float _3589 = float(_3587);
        _3571 = _3589;
    }
    float _3591 = _3571;
    if (!_3000)
    {
        int _3593 = _3130 << 4;
        int _3595 = _3593 + 2048;
        uint _3597 = uint(int(uint(_3595) >> uint(2)));
        uint _3599 = uint(int(uint(int(_3597)) >> uint(2)));
        int _3601 = int(_3597) & 3;
        float _3603 = (*spvDescriptorSet0.vp_c15)._m0[int(_3599)][_3601];
        int _3605 = int(_3597) + 1;
        uint _3607 = uint(int(uint(_3605) >> uint(2)));
        int _3609 = _3605 & 3;
        float _3611 = (*spvDescriptorSet0.vp_c15)._m0[int(_3607)][_3609];
        int _3613 = _3595 + 8;
        uint _3615 = uint(int(uint(_3613) >> uint(2)));
        uint _3617 = uint(int(uint(int(_3615)) >> uint(2)));
        int _3619 = int(_3615) & 3;
        float _3621 = (*spvDescriptorSet0.vp_c15)._m0[int(_3617)][_3619];
        int _3623 = int(_3615) + 1;
        uint _3625 = uint(int(uint(_3623) >> uint(2)));
        int _3627 = _3623 & 3;
        float _3629 = (*spvDescriptorSet0.vp_c15)._m0[int(_3625)][_3627];
        float _3631 = _2792 * _3611;
        float _3633 = fma(_887, _3603, _3631);
        float _3635 = fma(_889, _3621, _3633);
        float _3637 = _3635 + _3629;
        float _3639 = precise::clamp(_3637, 0.0, 1.0);
        float _3641 = -_3639;
        float _3643 = _3641 + _3495;
        float _3645 = fma(_3643, 500.0, 1.5);
        float _3647 = exp2(_3645);
        float _3649 = 0.0 + _3647;
        float _3651 = precise::clamp(_3649, 0.0, 1.0);
        _3577 = _3651;
    }
    float _3653 = _3577;
    float _3655 = _3591 * _3653;
    float _3657 = _3559 * _3460;
    float _3659 = -_3567;
    float _3661 = fma(_3659, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3663 = -_3559;
    float _3665 = _3663 + 1.0;
    out.m_92.x = _2732;
    out.m_92.y = _2730;
    out.m_92.z = _2734;
    float _3667 = _3479 * _3657;
    float _3669 = -_3655;
    float _3671 = fma(_3669, _3661, 1.0);
    float _3673 = precise::clamp(_3671, 0.0, 1.0);
    float _3675 = _3487 * _3657;
    float _3677 = _3479 * _3665;
    float _3679 = fma(_3483, _3667, _3473);
    float _3681 = fma(_3485, _3667, _3475);
    float _3683 = _3673 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3685 = fma(_3479, _3675, _3477);
    bool _3687 = _2822 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3689 = isnan(_2822);
    bool _3691 = _3687 || _3689;
    bool _3693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3695 = _3691 || _3693;
    out.m_94.x = _3683;
    out.m_96.x = _3679;
    out.m_96.y = _3681;
    out.m_96.z = _3685;
    out.m_96.w = _3677;
    float _3697 = _3667;
    float _3699 = _3655;
    float _3701 = _3673;
    float _3703 = _3665;
    if (!_3695)
    {
        _3404 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3705 = _3404;
    float _3707 = _3705;
    float _3709 = _3705;
    if (!_3695)
    {
        _3573 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3711 = _3573;
    float _3713 = _3711;
    float _3715 = _3711;
    if (!_3695)
    {
        _3697 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3717 = _3697;
    float _3719 = _3717;
    float _3721 = _3717;
    if (!_3695)
    {
        _3699 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3723 = _3699;
    float _3725 = _3723;
    float _3727 = _3723;
    if (!_3695)
    {
        _3701 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3729 = _3701;
    float _3731 = _3729;
    float _3733 = _3729;
    if (!_3695)
    {
        _3703 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3735 = _3703;
    bool _3737 = !_3695;
    float _3739 = _3735;
    float _3741 = _3735;
    if (!_3737)
    {
        bool _3743 = _2822 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3745 = isnan(_2822);
        bool _3747 = _3743 || _3745;
        bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3751 = _3747 || _3749;
        if (!_3751)
        {
            float _3753 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3755 = _2822 + _3753;
            float _3757 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3759 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3757;
            float _3761 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3763 = _3761 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3765 = 1.0 / _3759;
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3771 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3775 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3777 = _3775 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3779 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3781 = _3779 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3783 = _3755 * _3765;
            float _3785 = precise::clamp(_3783, 0.0, 1.0);
            float _3787 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3789 = _3787 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3791 = fma(_3785, _3763, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3793 = fma(_3785, _3789, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3795 = fma(_3785, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3797 = fma(_3785, _3773, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3799 = fma(_3785, _3777, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3801 = fma(_3785, _3781, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3715 = _3795;
            _3733 = _3799;
            _3709 = _3791;
            _3727 = _3797;
            _3721 = _3793;
            _3741 = _3801;
            _3803 = true;
        }
        else
        {
            bool _3805 = _2822 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3807 = isnan(_2822);
            bool _3809 = _3805 || _3807;
            bool _3811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3813 = _3809 || _3811;
            if (!_3813)
            {
                _3707 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3815 = _3707;
            _3709 = _3815;
            if (!_3813)
            {
                _3713 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3817 = _3713;
            _3715 = _3817;
            if (!_3813)
            {
                _3719 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3819 = _3719;
            _3721 = _3819;
            if (!_3813)
            {
                _3725 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3821 = _3725;
            _3727 = _3821;
            if (!_3813)
            {
                _3731 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3823 = _3731;
            _3733 = _3823;
            if (!_3813)
            {
                _3739 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3825 = _3739;
            bool _3827 = !_3813;
            _3741 = _3825;
            if (!_3827)
            {
                bool _3829 = _2822 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3831 = isnan(_2822);
                bool _3833 = _3829 || _3831;
                bool _3835 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3837 = _3833 || _3835;
                if (!_3837)
                {
                    float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3841 = _2822 + _3839;
                    float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3845 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3843;
                    float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3851 = 1.0 / _3845;
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3869 = _3841 * _3851;
                    float _3871 = precise::clamp(_3869, 0.0, 1.0);
                    float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3877 = fma(_3871, _3849, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3879 = fma(_3871, _3875, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3881 = fma(_3871, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3883 = fma(_3871, _3859, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3885 = fma(_3871, _3863, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3887 = fma(_3871, _3867, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3715 = _3881;
                    _3733 = _3885;
                    _3709 = _3877;
                    _3727 = _3883;
                    _3721 = _3879;
                    _3741 = _3887;
                    _3803 = true;
                }
                else
                {
                    _3715 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3733 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3709 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3727 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3721 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3741 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3803 = false;
    float _3889 = _3715;
    float _3891 = _3733;
    float _3893 = _3709;
    float _3895 = _3727;
    float _3897 = _3721;
    float _3899 = _3741;
    float _3901 = fma(_2640, -0.5, 0.5);
    float _3903 = precise::clamp(_3901, 0.0, 1.0);
    float _3905 = -_3889;
    float _3907 = _3905 + _3891;
    float _3909 = -_3893;
    float _3911 = _3909 + _3895;
    float _3913 = -_3897;
    float _3915 = _3913 + _3899;
    bool _3917 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3919 = fma(_3903, _3907, _3889);
    float _3921 = fma(_3903, _3911, _3893);
    float _3923 = fma(_3903, _3915, _3897);
    float _3925 = _3919 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _3927 = fma(_3921, 0.298911988735198974609375, _3925);
    float _3929 = fma(_3923, 0.114477999508380889892578125, _3927);
    out.m_98.x = 0.0;
    float _3931 = -_3929;
    float _3933 = _3921 + _3931;
    float _3935 = -_3929;
    float _3937 = _3919 + _3935;
    float _3939 = -_3929;
    float _3941 = _3923 + _3939;
    float _3943 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3945 = fma(_3933, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3929);
    float _3947 = fma(_3937, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3929);
    float _3949 = fma(_3941, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3929);
    out.m_94.w = _3943;
    out.m_100.x = _3945;
    out.m_100.y = _3947;
    out.m_100.z = _3949;
    if (!_3917)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3951 = -_2730;
    float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3955 = -_2732;
    float _3957 = _3955 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3959 = -_2734;
    float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3963 = _3953 * _3953;
    float _3965 = fma(_3957, _3957, _3963);
    float _3967 = fma(_3961, _3961, _3965);
    float _3969 = sqrt(_3967);
    float _3971 = rsqrt(_3967);
    float _3973 = -_3969;
    float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3977 = _3975 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3979 = precise::clamp(_3977, 0.0, 1.0);
    float _3981 = _3957 * _3971;
    float _3983 = _3953 * _3971;
    float _3985 = abs(_3979);
    float _3987 = log2(_3985);
    float _3989 = _3961 * _3971;
    float _3991 = _3981 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3993 = _2640 * _3983;
    float _3995 = -_3983;
    float _3997 = -_3991;
    float _3999 = fma(_3995, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3997);
    float _4001 = fma(_2636, _3981, _3993);
    float _4003 = -_3989;
    float _4005 = fma(_4003, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3999);
    float _4007 = fma(_2642, _3989, _4001);
    float _4009 = precise::clamp(_4007, 0.0, 1.0);
    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4013 = _4005 + _4011;
    float _4015 = _3987 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4017 = _4013 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4019 = precise::clamp(_4017, 0.0, 1.0);
    float _4021 = exp2(_4015);
    float _4023 = _4021 * _4019;
    float _4025 = _4009 * _4023;
    float _4027 = _4025 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4029 = _4025 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4031 = _4025 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4027;
    out.m_98.y = _4029;
    out.m_98.z = _4031;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3803 = false;
    bool _2686 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_60.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    float _127 = as_type<float>(_119);
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _125;
    float _131 = _129;
    if (!_123)
    {
        out.m_63.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4090 = as_type<float>(_137);
        out.gl_Position.z = _4090;
    }
    if (!_123)
    {
        return out;
    }
    float _141 = in.m_65.w;
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
        float _159 = float(_119);
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
        out.m_63.x = 0.0;
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
        float _4160 = as_type<float>(_175);
        out.gl_Position.z = _4160;
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
        float _199 = in.m_70.x;
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
        float _219 = float(_119);
        float _221 = 1.0 / _219;
        float _223 = _155 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = in.m_70.x;
    float _229 = in.m_70.y;
    float _231 = in.m_70.z;
    float _233 = in.m_70.w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _225 + _235;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _247 = _245 != 0;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _255 = 1.0 / _243;
    float _257 = float(_119);
    float _259 = 1.0 / _251;
    float _261 = _227 * 2.0;
    float _263 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _265 = _229 * 2.0;
    float _267 = _227 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _271 = floor(_261);
    float _273 = fma(_263, -2.0, _239);
    float _275 = _231 * 2.0;
    float _277 = -_253;
    float _279 = fma(_267, 2.0, _277);
    float _281 = _231 + _227;
    float _283 = _227 + _229;
    float _285 = _237 * _255;
    float _287 = floor(_265);
    float _289 = _281 + (-1.0);
    float _291 = _283 + (-1.0);
    int _293 = as_type<int>(_283);
    if (_247)
    {
        _293 = 0;
    }
    int _295 = _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _225 + _297;
    float _301 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _303 = _295;
    if (!_247)
    {
        _303 = 1;
    }
    int _305 = _303;
    float _307 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _309 = floor(_275);
    bool _311 = _271 >= 0.0;
    bool _313 = isnan(_271);
    bool _315 = _311 || _313;
    bool _317 = isnan(0.0);
    bool _319 = _315 || _317;
    float _321 = _299 * _259;
    bool _323 = _271 > 0.0;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _327 = _319 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _329 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _273);
    bool _331 = _305 != 1;
    float _333 = _231 + _229;
    bool _335 = _287 >= 0.0;
    bool _337 = isnan(_287);
    bool _339 = _335 || _337;
    bool _341 = isnan(0.0);
    bool _343 = _339 || _341;
    float _345 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _347 = int(_345);
    bool _349 = _287 > 0.0;
    float _351 = _333 + (-1.0);
    int _353 = _343 ? 0 : 1;
    float _355 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _357 = _309 > 0.0;
    float _359 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _361 = log2(_359);
    bool _363 = _309 >= 0.0;
    bool _365 = isnan(_309);
    bool _367 = _363 || _365;
    bool _369 = isnan(0.0);
    bool _371 = _367 || _369;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _375 = ~_353;
    int _377 = _375 + 1;
    int _379 = _377 + 1;
    int _381 = _371 ? 0 : 1;
    int _383 = _379;
    float _385 = _351;
    float _387 = as_type<float>(_347);
    float _389 = _327;
    if (!_349)
    {
        int _391 = ~_353;
        int _393 = _391 + 1;
        _383 = _393;
    }
    int _395 = _383;
    float _397 = 1.0 / _257;
    int _399 = ~_381;
    int _401 = _399 + 1;
    int _403 = _401 + 1;
    int _405 = _403;
    if (!_331)
    {
        _385 = _229;
    }
    float _407 = _385;
    float _409 = _407;
    if (!_357)
    {
        int _411 = ~_381;
        int _413 = _411 + 1;
        _405 = _413;
    }
    int _415 = _405;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _419 = _417 != 0;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _427 = _425 != 0;
    float _429 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _431 = int(_429);
    if (_331)
    {
        _409 = _227;
    }
    float _433 = _409;
    float _435 = float(_415);
    bool _437 = !_423;
    int _439 = _437 ? 0 : 1;
    float _441 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[83].z, _373);
    bool _443 = !_419;
    int _445 = _443 ? 0 : 1;
    float _447 = _397 * _155;
    bool _449 = !_427;
    int _451 = _449 ? 0 : 1;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _459 = _457 != 0;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _463 = _461 != 0;
    float _465 = float(_347);
    if (!_331)
    {
        _127 = _231;
    }
    float _467 = _127;
    bool _469 = !_455;
    int _471 = _469 ? 0 : 1;
    float _473 = float(_431);
    float _475 = 1.0 / _465;
    int _477 = abs(_471);
    bool _479 = !_459;
    int _481 = _479 ? 0 : 1;
    float _483 = float(_477);
    float _485 = _467;
    if (!_331)
    {
        _387 = _229;
    }
    float _487 = _387;
    float _489 = 1.0 / _473;
    float _491 = _487;
    if (_331)
    {
        _485 = _229;
    }
    float _493 = _485;
    float _495 = _483 * _435;
    if (_331)
    {
        _491 = _227;
    }
    float _497 = _491;
    int _499 = abs(_481);
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _503 = _497 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _505 = _361 * _155;
    float _507 = fma(_501, -2.0, _269);
    float _509 = in.m_72.x;
    float _511 = in.m_72.y;
    float _513 = in.m_72.z;
    int _515 = ~as_type<int>(_327);
    int _517 = _515 + 1;
    int _519 = _517 + 1;
    float _521 = -_325;
    float _523 = fma(_503, 2.0, _521);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _527 = _519;
    if (!_323)
    {
        int _529 = ~as_type<int>(_327);
        int _531 = _529 + 1;
        _527 = _531;
    }
    int _533 = _527;
    float _535 = exp2(_505);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _539 = 1.0 + _537;
    if (!_331)
    {
        _389 = _231;
    }
    float _541 = _389;
    float _543 = _495 * (-2.0);
    float _545 = _541;
    if (_331)
    {
        _545 = _229;
    }
    float _547 = _545;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _551 = float(_533);
    float _553 = 1.0 / _539;
    float _555 = float(_499);
    float _557 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[83].w, _525);
    float _559 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[78].z, _549);
    float _561 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _441);
    float _563 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _557);
    float _565 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _507);
    float _567 = float(_395);
    float _569 = _555 * _551;
    bool _571 = !_463;
    int _573 = _571 ? 0 : 1;
    float _575 = fma(_543, _509, _509);
    bool _577 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _579 = isnan(1.0);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _585 = _581 || _583;
    float _587 = -_535;
    float _589 = _587 + 1.0;
    int _591 = abs(_573);
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _595 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _603 = _599 || _601;
    float _605 = _569 * (-2.0);
    float _607 = float(_591);
    float _609 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].w, _593);
    float _611 = _603 ? _589 : 0.0;
    float _613 = -_155;
    float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[81].x, _523);
    float _617 = fma(_605, _511, _511);
    float _619 = _607 * _567;
    float _621 = _229 + (-0.5);
    float _623 = _227 + (-0.5);
    float _625 = _619 * (-2.0);
    float _627 = _475 * _155;
    float _629 = -_155;
    float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[76].x, _279);
    float _633 = fma(_355, _605, _355);
    float _635 = _489 * _155;
    float _637 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _559);
    float _639 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _609);
    float _641 = fma(_625, _513, _513);
    float _643 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[196].y, _617);
    if (_585)
    {
        float _645 = _611 * _553;
        _157 = _645;
    }
    float _647 = _157;
    float _649 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[196].x, _575);
    float _651 = _231 + (-0.5);
    bool _653 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _655 = isnan(_225);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _665;
    float _669 = fma(_301, _625, _301);
    float _671 = fma(_307, _543, _307);
    bool _673 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _675 = isnan(_225);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[196].z, _641);
    float _687 = fma(_667, _285, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _689 = -_663;
    float _691 = _689 + 1.0;
    float _693 = fma(_633, _647, _643);
    bool _695 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _697 = isnan(_225);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _707;
    float _711 = -_683;
    float _713 = _711 + 1.0;
    float _715 = in.m_74.x;
    float _717 = in.m_74.y;
    float _719 = _683 * _691;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _725 = fma(_709, _285, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _727 = _705 * _713;
    float _729 = -_705;
    float _731 = _729 + 1.0;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _737 = fma(_671, _647, _649);
    float _739 = _725 * _727;
    float _741 = _687 * _727;
    float _743 = fma(_669, _647, _685);
    float _745 = fma(_723, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _747 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[143].y, _739);
    float _749 = fma(_735, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _751 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[143].x, _741);
    float _753 = _737 * 0.15915493667125701904296875;
    float _755 = _693 * 0.15915493667125701904296875;
    float _757 = fma(_749, _719, _747);
    float _759 = fma(_745, _719, _751);
    float _761 = _743 * 0.15915493667125701904296875;
    float _763 = _753 * 6.283185482025146484375;
    float _765 = cos(_763);
    float _767 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[145].y, _757);
    float _769 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[145].x, _759);
    float _771 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _773 = _767 * _717;
    float _775 = _769 * _715;
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _779 = _755 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = _773 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _785 = _775 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _787 = _783 * _771;
    float _789 = _785 * _777;
    float _791 = _755 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = in.m_60.x;
    float _797 = in.m_60.y;
    float _799 = in.m_60.z;
    float _801 = _753 * 6.283185482025146484375;
    float _803 = sin(_801);
    float _805 = _765 * _781;
    float _807 = _761 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _765 * _793;
    float _813 = _761 * 6.283185482025146484375;
    float _815 = sin(_813);
    float _817 = _803 * _781;
    float _819 = _803 * _793;
    float _821 = _765 * _809;
    float _823 = _803 * _809;
    float _825 = _793 * _809;
    float _827 = _781 * _809;
    float _829 = _821 * _787;
    float _831 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _833 = fma(_815, _811, _817);
    float _835 = -_805;
    float _837 = fma(_815, _819, _835);
    float _839 = -_819;
    float _841 = fma(_815, _805, _839);
    float _843 = -_787;
    float _845 = _815 * _843;
    float _847 = fma(_833, _789, _829);
    float _849 = _823 * _787;
    float _851 = fma(_815, _817, _811);
    float _853 = fma(_825, _789, _845);
    float _855 = fma(_841, _831, _847);
    float _857 = fma(_837, _789, _849);
    float _859 = _797 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _861 = fma(_827, _831, _853);
    float _863 = _797 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _865 = _855 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _867 = _855 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _869 = fma(_851, _831, _857);
    float _871 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[4].x, _863);
    float _873 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[6].x, _859);
    float _875 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[24].x, _865);
    float _877 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[26].x, _867);
    float _879 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[4].z, _871);
    float _881 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[6].z, _873);
    float _883 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _875);
    float _885 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _877);
    float _887 = _879 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _889 = _881 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _891 = _883 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _893 = _885 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _895 = _797 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _897 = _855 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _899 = _887 + _891;
    float _901 = _889 + _893;
    float _903 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[5].x, _895);
    float _905 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[25].x, _897);
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _909 = _899 + _907;
    float _911 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _913 = _901 + _911;
    float _915 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[5].z, _903);
    float _917 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _905);
    float _919 = _909 * _909;
    float _921 = _913 * _913;
    float _923 = _915 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _925 = _917 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _927 = _919 + _921;
    float _929 = _923 + _925;
    float _931 = sqrt(_927);
    bool _933 = _931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _935 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _937 = _931 + _935;
    float _939 = 0.0;
    float _941 = _915;
    float _943 = _897;
    float _945 = _799;
    float _947 = _901;
    float _949 = _929;
    float _951 = _919;
    if (_933)
    {
        float _953 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _939 = _953;
    }
    float _955 = _939;
    if (_933)
    {
        float _957 = _929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _941 = _957;
    }
    float _959 = _941;
    float _961 = _959;
    if (!_933)
    {
        _943 = _899;
    }
    float _963 = _943;
    float _965 = _963;
    if (_933)
    {
        float _967 = rsqrt(_927);
        _945 = _967;
    }
    float _969 = _945;
    float _971 = _955;
    if (_933)
    {
        float _973 = _937 * _955;
        _971 = _973;
    }
    float _975 = _971;
    float _977 = _975;
    if (_933)
    {
        float _979 = _975 * 0.15915493667125701904296875;
        _977 = _979;
    }
    float _981 = _977;
    float _983 = _795;
    if (_933)
    {
        float _985 = _981 * 6.283185482025146484375;
        float _987 = sin(_985);
        _983 = _987;
    }
    float _989 = _983;
    if (_933)
    {
        float _991 = fma(_989, _959, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _961 = _991;
    }
    float _993 = _961;
    float _995 = _993;
    if (_933)
    {
        float _997 = _969 * _993;
        _995 = _997;
    }
    float _999 = _995;
    if (_933)
    {
        float _1001 = fma(_909, _999, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _965 = _1001;
    }
    float _1003 = _965;
    if (_933)
    {
        float _1005 = fma(_913, _999, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _947 = _1005;
    }
    float _1007 = _947;
    float _1009 = fma(_1003, 6.2500002968590706586837768554688e-05, 0.5);
    float _1011 = fma(_1007, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5472 = float2(_1009, _1011);
    float3 _1015 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5472, float2(0.0), isnan(_5472)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5472, float2(0.0), isnan(_5472)), level(0.0)).xyz;
    float _1017 = _1015.x;
    float _1019 = _1015.y;
    float _1021 = _1015.z;
    float _1023 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1025 = int(_1023);
    float _1027 = 0.0;
    if (_247)
    {
        _1027 = 1.0;
    }
    float _1029 = _1027;
    float _1031 = 0.0;
    float _1033 = _1029;
    if (_247)
    {
        float _1035 = in.m_70.x;
        _1031 = _1035;
    }
    float _1037 = _1031;
    if (!_247)
    {
        _1033 = 7.345489978790283203125;
    }
    float _1039 = _1033;
    float _1041 = -_639;
    float _1043 = _1041 + 1.0;
    float _1045 = _1037;
    if (!_247)
    {
        float _1047 = in.m_70.y;
        _1045 = _1047;
    }
    float _1049 = _1045;
    float _1051 = -_561;
    float _1053 = _1051 + 1.0;
    float _1055 = trunc(_627);
    int _1057 = int(_1055);
    float _1059 = -_637;
    float _1061 = _1059 + 1.0;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1065 = -_563;
    float _1067 = _1065 + 1.0;
    float _1069 = float(uint(_1025));
    float _1071 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1073 = int(_1071);
    float _1075 = _1039 * _227;
    float _1077 = float(_1025);
    bool _1079 = _1025 == 0;
    float _1081 = float(uint(_1057));
    float _1083 = 1.0 / _1069;
    float _1085 = float(_1057);
    float _1087 = float(uint(_1073));
    float _1089 = trunc(_635);
    int _1091 = int(_1089);
    int _1093 = ~_1025;
    int _1095 = _1093 + 1;
    int _1097 = ~_1073;
    int _1099 = _1097 + 1;
    bool _1101 = _1073 == 0;
    int _1103 = as_type<int>(_1083) + (-2);
    float _1105 = 1.0 / _1087;
    float _1107 = as_type<float>(_1103) * _1081;
    float _1109 = float(uint(_1091));
    float _1111 = floor(_1075);
    float _1113 = trunc(_1107);
    float _1115 = precise::max(_1113, 0.0);
    uint _1118 = uint(_1115);
    int _1120 = _1095 * int(_1118);
    int _1122 = _1120 + _1057;
    float _1124 = float(uint(_1122));
    int _1126 = as_type<int>(_1105) + (-2);
    float _1128 = as_type<float>(_1103) * _1124;
    float _1130 = as_type<float>(_1126) * _1109;
    bool _1132 = _1085 >= _1077;
    bool _1134 = isnan(_1085);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(_1077);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = -_1111;
    float _1146 = _1075 + _1144;
    float _1148 = trunc(_1128);
    float _1150 = precise::max(_1148, 0.0);
    uint _1152 = uint(_1150);
    int _1154 = ~_1025;
    int _1156 = _1154 + 1;
    float _1158 = trunc(_1130);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    int _1164 = int(_1118) + int(_1152);
    float _1166 = trunc(_1142);
    int _1168 = int(_1166);
    float _1170 = _1146 * _1077;
    float _1172 = _1146;
    float _1174 = _1061;
    if (_247)
    {
        _1172 = 1.0;
    }
    float _1176 = _1172;
    float _1178 = _1176;
    if (!_247)
    {
        _1178 = 1.2345600128173828125;
    }
    float _1180 = _1178;
    int _1182 = _1156 * _1164;
    int _1184 = _1182 + _1057;
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1188 = _1186 != 0;
    int _1190 = _1099 * int(_1162);
    int _1192 = _1190 + _1091;
    float _1194 = trunc(_1170);
    int _1196 = int(_1194);
    float _1198 = _1049 * _1180;
    bool _1200 = uint(_1184) >= uint(_1025);
    float _1202 = float(uint(_1192));
    bool _1204 = !_1200;
    int _1206 = _1204 ? 0 : (-1);
    float _1208 = as_type<float>(_1126) * _1202;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1212 = _1210 != 0;
    int _1214 = ~_1164;
    int _1216 = _1214 + _1206;
    int _1218 = _1216 + 1;
    float _1220 = trunc(_1208);
    float _1222 = precise::max(_1220, 0.0);
    uint _1224 = uint(_1222);
    bool _1226 = !_1212;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = _1077 * _447;
    int _1232 = ~_1073;
    int _1234 = _1232 + 1;
    int _1236 = abs(_1228);
    int _1238 = _1025 * _1218;
    int _1240 = _1238 + _1057;
    float _1242 = trunc(_1230);
    int _1244 = int(_1242);
    int _1246 = ~_1168;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    bool _1252 = !_1079;
    int _1254 = _1252 ? _1240 : (-1);
    int _1256 = _1196 * _1236;
    int _1258 = _1256 + _1057;
    int _1260 = _1025 + (-1);
    int _1262 = int(_1162) + int(_1224);
    int _1264 = _1254 * _1250;
    int _1266 = abs(_439);
    int _1268 = _1168 * _1260;
    int _1270 = _1268 + _1264;
    float _1272 = floor(_1198);
    float _1274 = float(_1073);
    int _1276 = _1234 * _1262;
    int _1278 = _1276 + _1091;
    float _1280 = float(_1091);
    int _1282 = abs(_445);
    bool _1284 = _1280 >= _1274;
    bool _1286 = isnan(_1280);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan(_1274);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    bool _1296 = uint(_1278) >= uint(_1073);
    int _1298 = _1270 * _1266;
    int _1300 = abs(_451);
    float _1302 = trunc(_1294);
    int _1304 = int(_1302);
    bool _1306 = !_1296;
    int _1308 = _1306 ? 0 : (-1);
    float _1310 = -_1272;
    float _1312 = _1198 + _1310;
    int _1314 = _1244 * _1282;
    int _1316 = _1314 + _1298;
    int _1318 = ~_1262;
    int _1320 = _1318 + _1308;
    int _1322 = _1320 + 1;
    float _1324 = _1312 * _1274;
    bool _1326 = !_1188;
    int _1328 = _1326 ? 0 : 1;
    int _1330 = _1258 * _1300;
    int _1332 = _1330 + _1316;
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1336 = _1334 != 0;
    int _1338 = _1073 * _1322;
    int _1340 = _1338 + _1091;
    int _1342 = abs(_1328);
    float _1344 = trunc(_1324);
    int _1346 = int(_1344);
    bool _1348 = !_1336;
    int _1350 = _1348 ? 0 : 1;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1354 = _1352 != 0;
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1366 = _1364 != 0;
    float _1368 = _1274 * _447;
    int _1370 = ~_1304;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = _1196 * _1342;
    int _1378 = _1376 + _1332;
    bool _1380 = !_1101;
    int _1382 = _1380 ? _1340 : (-1);
    float _1384 = trunc(_1368);
    int _1386 = int(_1384);
    bool _1388 = !_1358;
    int _1390 = _1388 ? 0 : 1;
    int _1392 = abs(_1350);
    int _1394 = _1382 * _1374;
    int _1396 = _1073 + (-1);
    int _1398 = abs(_1390);
    float _1400 = float(uint(_1378));
    int _1402 = _1304 * _1396;
    int _1404 = _1402 + _1394;
    bool _1406 = !_1354;
    int _1408 = _1406 ? 0 : 1;
    float _1410 = as_type<float>(_1103) * _1400;
    int _1412 = _1346 * _1392;
    int _1414 = _1412 + _1091;
    int _1416 = abs(_1408);
    bool _1418 = !_1362;
    int _1420 = _1418 ? 0 : 1;
    int _1422 = _1404 * _1398;
    float _1424 = trunc(_1410);
    float _1426 = precise::max(_1424, 0.0);
    uint _1428 = uint(_1426);
    int _1430 = ~_1025;
    int _1432 = _1430 + 1;
    float _1434 = float(uint(_1258));
    int _1436 = _1386 * _1416;
    int _1438 = _1436 + _1422;
    int _1440 = abs(_1420);
    float _1442 = as_type<float>(_1103) * _1434;
    float _1444 = float(uint(_1414));
    bool _1446 = !_1366;
    int _1448 = _1446 ? 0 : 1;
    float _1450 = as_type<float>(_1126) * _1444;
    int _1452 = abs(_1448);
    int _1454 = _1414 * _1440;
    int _1456 = _1454 + _1438;
    float _1458 = trunc(_1442);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    int _1464 = _1432 * int(_1428);
    int _1466 = _1464 + _1378;
    int _1468 = _1346 * _1452;
    int _1470 = _1468 + _1456;
    float _1472 = float(uint(_1466));
    float _1474 = float(uint(_1470));
    float _1476 = trunc(_1450);
    float _1478 = precise::max(_1476, 0.0);
    uint _1480 = uint(_1478);
    int _1482 = ~_1025;
    int _1484 = _1482 + 1;
    float _1486 = as_type<float>(_1103) * _1472;
    int _1488 = ~_1073;
    int _1490 = _1488 + 1;
    float _1492 = as_type<float>(_1126) * _1474;
    int _1494 = _1484 * int(_1462);
    int _1496 = _1494 + _1258;
    float _1498 = trunc(_1486);
    float _1500 = precise::max(_1498, 0.0);
    uint _1502 = uint(_1500);
    int _1504 = ~_1025;
    int _1506 = _1504 + 1;
    float _1508 = float(uint(_1496));
    float _1510 = trunc(_1492);
    float _1512 = precise::max(_1510, 0.0);
    uint _1514 = uint(_1512);
    int _1516 = _1490 * int(_1480);
    int _1518 = _1516 + _1414;
    int _1520 = ~_1073;
    int _1522 = _1520 + 1;
    float _1524 = as_type<float>(_1103) * _1508;
    float _1526 = float(uint(_1518));
    int _1528 = int(_1428) + int(_1502);
    float _1530 = trunc(_1524);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    float _1536 = as_type<float>(_1126) * _1526;
    int _1538 = _1522 * int(_1514);
    int _1540 = _1538 + _1470;
    float _1542 = trunc(_1536);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    float _1548 = float(uint(_1540));
    int _1550 = _1506 * _1528;
    int _1552 = _1550 + _1378;
    int _1554 = int(_1462) + int(_1534);
    float _1556 = as_type<float>(_1126) * _1548;
    bool _1558 = uint(_1552) >= uint(_1025);
    bool _1560 = !_1558;
    int _1562 = _1560 ? 0 : (-1);
    float _1564 = trunc(_1556);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = int(_1480) + int(_1546);
    int _1572 = ~_1528;
    int _1574 = _1572 + _1562;
    int _1576 = _1574 + 1;
    int _1578 = _1025 * _1576;
    int _1580 = _1578 + _1378;
    int _1582 = ~_1025;
    int _1584 = _1582 + 1;
    int _1586 = ~_1073;
    int _1588 = _1586 + 1;
    bool _1590 = !_1079;
    int _1592 = _1590 ? _1580 : (-1);
    int _1594 = _1584 * _1554;
    int _1596 = _1594 + _1258;
    int _1598 = int(_1514) + int(_1568);
    int _1600 = _1592 & 3;
    bool _1602 = _1600 != 0;
    int _1604 = _1592 & 3;
    bool _1606 = _1604 != 0;
    int _1608 = _1588 * _1598;
    int _1610 = _1608 + _1470;
    bool _1612 = uint(_1600) >= 2u;
    int _1614 = _1606 ? 0 : 1;
    bool _1616 = uint(_1596) >= uint(_1025);
    int _1618 = _1612 ? 0 : 1;
    bool _1620 = uint(_1610) >= uint(_1073);
    bool _1622 = !_1616;
    int _1624 = _1622 ? 0 : (-1);
    bool _1626 = !_1620;
    int _1628 = _1626 ? 0 : (-1);
    bool _1630 = uint(_1600) > 1u;
    int _1632 = ~_1554;
    int _1634 = _1632 + _1624;
    int _1636 = _1634 + 1;
    int _1638 = ~_1598;
    int _1640 = _1638 + _1628;
    int _1642 = _1640 + 1;
    int _1644 = ~_1073;
    int _1646 = _1644 + 1;
    int _1648 = _1025 * _1636;
    int _1650 = _1648 + _1258;
    bool _1652 = _1600 != 3;
    int _1654 = _1073 * _1642;
    int _1656 = _1654 + _1470;
    int _1658 = ~_1614;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    int _1664 = _1646 * _1570;
    int _1666 = _1664 + _1414;
    bool _1668 = !_1079;
    int _1670 = _1668 ? _1650 : (-1);
    int _1672 = _1662;
    if (!_1630)
    {
        int _1674 = ~_1614;
        int _1676 = _1674 + 1;
        _1672 = _1676;
    }
    int _1678 = _1672;
    bool _1680 = !_1101;
    int _1682 = _1680 ? _1656 : (-1);
    bool _1684 = _233 > 0.5;
    bool _1686 = uint(_1666) >= uint(_1073);
    int _1688 = ~_1618;
    int _1690 = _1688 + 1;
    int _1692 = _1690 + 1;
    int _1694 = _1592 >> 31;
    int _1696 = _1692;
    if (_1652)
    {
        int _1698 = ~_1618;
        int _1700 = _1698 + 1;
        _1696 = _1700;
    }
    int _1702 = _1696;
    int _1704 = _1682 >> 31;
    float _1706 = -_195;
    int _1708 = _1684 ? as_type<int>(_1706) : as_type<int>(_195);
    bool _1710 = !_1602;
    int _1712 = _1710 ? 0 : 1;
    bool _1714 = !_1686;
    int _1716 = _1714 ? 0 : (-1);
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1720 = _1718 != 0;
    int _1722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1724 = _1722 != 0;
    int _1726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1728 = _1726 != 0;
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1732 = _1730 != 0;
    int _1734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1736 = _1734 != 0;
    int _1738 = _1694 & 3;
    int _1740 = _1704 & 3;
    int _1742 = _1592 + _1738;
    int _1744 = _1682 + _1740;
    bool _1746 = !_1720;
    int _1748 = _1746 ? 0 : 1;
    int _1750 = _1682 & 3;
    bool _1752 = _1750 != 0;
    int _1754 = _1742 >> 2;
    bool _1756 = !_1728;
    int _1758 = _1756 ? 0 : 1;
    int _1760 = _1744 >> 2;
    int _1762 = _1682 & 3;
    bool _1764 = _1762 != 0;
    bool _1766 = !_1752;
    int _1768 = _1766 ? 0 : 1;
    bool _1770 = uint(_1750) > 1u;
    int _1772 = _1754 << 4;
    int _1774 = _1772 + 368;
    int _1776 = _1760 << 4;
    int _1778 = _1776 + 512;
    int _1780 = _1764 ? 0 : 1;
    bool _1782 = _1600 != 3;
    uint _1784 = uint(int(uint(_1778) >> uint(2)));
    uint _1786 = uint(int(uint(int(_1784)) >> uint(2)));
    int _1788 = int(_1784) & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    int _1792 = int(_1784) + 1;
    uint _1794 = uint(int(uint(_1792) >> uint(2)));
    int _1796 = _1792 & 3;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[int(_1794)][_1796];
    int _1800 = ~_1780;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    int _1806 = ~_1570;
    int _1808 = _1806 + _1716;
    int _1810 = _1808 + 1;
    int _1812 = _1804;
    if (!_1770)
    {
        int _1814 = ~_1780;
        int _1816 = _1814 + 1;
        _1812 = _1816;
    }
    int _1818 = _1812;
    bool _1820 = !_1782;
    int _1822 = _1820 ? 0 : (-1);
    uint _1824 = uint(int(uint(_1774) >> uint(2)));
    uint _1826 = uint(int(uint(int(_1824)) >> uint(2)));
    int _1828 = int(_1824) & 3;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[int(_1826)][_1828];
    int _1832 = int(_1824) + 1;
    uint _1834 = uint(int(uint(_1832) >> uint(2)));
    int _1836 = _1832 & 3;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[int(_1834)][_1836];
    bool _1840 = _1750 != 3;
    int _1842 = _1073 * _1810;
    int _1844 = _1842 + _1414;
    bool _1846 = uint(_1750) >= 2u;
    int _1848 = _1846 ? 0 : 1;
    int _1850 = _1778 + 8;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    uint _1854 = uint(int(uint(int(_1852)) >> uint(2)));
    int _1856 = int(_1852) & 3;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[int(_1854)][_1856];
    int _1860 = int(_1852) + 1;
    uint _1862 = uint(int(uint(_1860) >> uint(2)));
    int _1864 = _1860 & 3;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[int(_1862)][_1864];
    bool _1868 = _1750 != 3;
    int _1870 = ~_1848;
    int _1872 = _1870 + 1;
    int _1874 = _1872 + 1;
    bool _1876 = !_1101;
    int _1878 = _1876 ? _1844 : (-1);
    int _1880 = _1874;
    if (_1840)
    {
        int _1882 = ~_1848;
        int _1884 = _1882 + 1;
        _1880 = _1884;
    }
    int _1886 = _1880;
    int _1888 = _1774 + 8;
    uint _1890 = uint(int(uint(_1888) >> uint(2)));
    uint _1892 = uint(int(uint(int(_1890)) >> uint(2)));
    int _1894 = int(_1890) & 3;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[int(_1892)][_1894];
    int _1898 = int(_1890) + 1;
    uint _1900 = uint(int(uint(_1898) >> uint(2)));
    int _1902 = _1898 & 3;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[int(_1900)][_1902];
    int _1906 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1908 = _1906 != 0;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1914 = abs(_1818);
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1918 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1922 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1926 = abs(_1678);
    int _1928 = abs(_1712);
    out.m_76.x = _1918;
    out.m_76.y = _1922;
    out.m_76.z = _1924;
    out.m_76.w = _1920;
    bool _1930 = !_1868;
    int _1932 = _1930 ? 0 : (-1);
    bool _1934 = _227 > 0.5;
    bool _1936 = _229 > 0.5;
    int _1938 = ~_1926;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1946 = -_191;
    int _1948 = _1934 ? as_type<int>(_1946) : as_type<int>(_191);
    float _1950 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1952 = int(_1950);
    int _1954 = _1942 * as_type<int>(_1838);
    float _1956 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1958 = abs(_1768);
    float _1960 = _841 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1962 = ~_1914;
    int _1964 = _1962 + 1;
    int _1966 = _1964 + 1;
    bool _1968 = _231 > 0.5;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1972 = ~_1928;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    int _1978 = _1966 * as_type<int>(_1798);
    int _1980 = ~_1958;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    float _1986 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1988 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1990 = _1976 * as_type<int>(_1830);
    int _1992 = _1990 + _1954;
    int _1994 = abs(_1702);
    int _1996 = _1984 * as_type<int>(_1790);
    int _1998 = _1996 + _1978;
    int _2000 = abs(_1886);
    float _2002 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2004 = int(_2002);
    out.m_78.x = _1956;
    out.m_78.y = _1986;
    out.m_78.z = _1988;
    int _2006 = abs(_1822);
    float _2008 = _821 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2010 = abs(_1932);
    float _2012 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2014 = ~_1994;
    int _2016 = _2014 + 1;
    int _2018 = _2016 + 1;
    float _2020 = as_type<float>(_1886);
    if (_933)
    {
        float _2022 = _981 * 6.283185482025146484375;
        float _2024 = cos(_2022);
        _2020 = _2024;
    }
    float _2026 = _2020;
    bool _2028 = !_1724;
    float _2030 = _2028 ? _195 : as_type<float>(_1708);
    float _2032 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2012);
    bool _2034 = !_1908;
    float _2036 = _2034 ? _191 : as_type<float>(_1948);
    int _2038 = _2018 * as_type<int>(_1896);
    int _2040 = _2038 + _1992;
    int _2042 = ~_2000;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    float _2048 = float(uint(_1952));
    float _2050 = _841 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2052 = _2046 * as_type<int>(_1858);
    int _2054 = _2052 + _1998;
    int _2056 = ~_2010;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    int _2062 = ~_2006;
    int _2064 = _2062 + 1;
    int _2066 = _2064 + 1;
    float _2068 = 1.0 / _2048;
    int _2070 = abs(_1748);
    int _2072 = _2060 * as_type<int>(_1866);
    int _2074 = _2072 + _2054;
    int _2076 = abs(_1952);
    int _2078 = _2066 * as_type<int>(_1904);
    int _2080 = _2078 + _2040;
    int _2082 = abs(_1758);
    float _2084 = -_815;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2008);
    int _2088 = ~_2070;
    int _2090 = _2088 + 1;
    int _2092 = _2090 + 1;
    float _2094 = float(uint(_2004));
    int _2096 = abs(_2004);
    int _2098 = _2080 * _2092;
    float _2100 = 1.0 / _2094;
    int _2102 = ~_2082;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    int _2108 = _1670 * _2070;
    int _2110 = _2108 + _2098;
    float _2112 = float(uint(_2096));
    float _2114 = _821 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2116 = float(uint(_2076));
    int _2118 = _2074 * _2106;
    int _2120 = ~_1952;
    int _2122 = _2120 + 1;
    float _2124 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2126 = _821 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2128 = 1.0 / _2112;
    int _2130 = _1878 * _2082;
    int _2132 = _2130 + _2118;
    int _2134 = as_type<int>(_2068) + (-2);
    float _2136 = -_815;
    float _2138 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2126);
    float _2140 = float(uint(_2110));
    float _2142 = -_815;
    float _2144 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2114);
    int _2146 = as_type<int>(_2100) + (-2);
    float _2148 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2150 = 1.0 / _2116;
    float _2152 = as_type<float>(_2134) * _2140;
    float _2154 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2138);
    int _2156 = abs(_2132);
    float _2158 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2144);
    int _2160 = abs(_2110);
    float _2162 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2148);
    float _2164 = trunc(_2152);
    float _2166 = precise::max(_2164, 0.0);
    uint _2168 = uint(_2166);
    float _2170 = float(uint(_2132));
    float _2172 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2124);
    int _2174 = as_type<int>(_2128) + (-2);
    float _2176 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1960);
    float _2178 = as_type<float>(_2146) * _2170;
    float _2180 = float(uint(_2160));
    float _2182 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2086);
    int _2184 = as_type<int>(_2150) + (-2);
    float _2186 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2162);
    float _2188 = float(uint(_2156));
    float _2190 = trunc(_2178);
    float _2192 = precise::max(_2190, 0.0);
    uint _2194 = uint(_2192);
    int _2196 = ~_2096;
    int _2198 = _2196 + 1;
    float _2200 = as_type<float>(_2184) * _2180;
    float _2202 = _841 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2204 = as_type<float>(_2174) * _2188;
    float _2206 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2050);
    int _2208 = _2122 * int(_2168);
    int _2210 = _2208 + _2110;
    float _2212 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2202);
    float _2214 = trunc(_2200);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    float _2220 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2206);
    float _2222 = _2202;
    float _2224 = as_type<float>(_2198);
    float _2226 = _2032;
    if (_933)
    {
        float _2228 = _2026 + (-1.0);
        _2222 = _2228;
    }
    float _2230 = _2222;
    float _2232 = float(uint(_2210));
    float _2234 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2212);
    float _2236 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2176);
    int _2238 = ~_2076;
    int _2240 = _2238 + 1;
    float _2242 = _2230;
    if (_933)
    {
        float _2244 = _2230 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2242 = _2244;
    }
    float _2246 = _2242;
    float _2248 = trunc(_2204);
    float _2250 = precise::max(_2248, 0.0);
    uint _2252 = uint(_2250);
    int _2254 = ~_2004;
    int _2256 = _2254 + 1;
    float _2258 = as_type<float>(_2134) * _2232;
    if (_933)
    {
        float _2260 = fma(_929, _2026, _2246);
        _949 = _2260;
    }
    float _2262 = _949;
    float _2264 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2266 = _2256 * int(_2194);
    int _2268 = _2266 + _2132;
    bool _2270 = _2004 == 0;
    int _2272 = _2240 * int(_2218);
    int _2274 = _2272 + _2160;
    float _2276 = trunc(_2258);
    float _2278 = precise::max(_2276, 0.0);
    uint _2280 = uint(_2278);
    float _2282 = float(uint(_2268));
    float _2284 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2286 = float(uint(_2274));
    float _2288 = -_195;
    int _2290 = _1936 ? as_type<int>(_2288) : as_type<int>(_195);
    int _2292 = _2198 * int(_2252);
    int _2294 = _2292 + _2156;
    if (_933)
    {
        float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2298 = _1003 + _2296;
        _2224 = _2298;
    }
    float _2300 = _2224;
    float _2302 = _2284 * _2158;
    bool _2304 = !_1732;
    float _2306 = _2304 ? _195 : as_type<float>(_2290);
    float _2308 = float(uint(_2294));
    float _2310 = as_type<float>(_2146) * _2282;
    float _2312 = _2302;
    if (_933)
    {
        float _2314 = _2300 * _2300;
        _951 = _2314;
    }
    float _2316 = _951;
    float _2318 = -_191;
    int _2320 = _1968 ? as_type<int>(_2318) : as_type<int>(_191);
    float _2322 = as_type<float>(_2184) * _2286;
    float _2324 = as_type<float>(_2174) * _2308;
    float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2328 = _2262 + _2326;
    float _2330 = trunc(_2310);
    float _2332 = precise::max(_2330, 0.0);
    uint _2334 = uint(_2332);
    bool _2336 = !_1736;
    float _2338 = _2336 ? _191 : as_type<float>(_2320);
    float _2340 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2032);
    float _2342 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2172);
    if (!_933)
    {
        _2226 = _921;
    }
    float _2344 = _2226;
    float _2346 = _2284 * _2154;
    float _2348 = fma(_2264, _2340, _2302);
    float _2350 = _2344;
    if (_933)
    {
        float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2354 = _1007 + _2352;
        _2312 = _2354;
    }
    float _2356 = _2312;
    float _2358 = trunc(_2322);
    float _2360 = precise::max(_2358, 0.0);
    uint _2362 = uint(_2360);
    float _2364 = _2284 * _2182;
    float _2366 = fma(_2264, _2186, _2346);
    if (_933)
    {
        float _2368 = _2356 * _2356;
        _2350 = _2368;
    }
    float _2370 = _2350;
    bool _2372 = _2004 == 0;
    float _2374 = fma(_2264, _2342, _2364);
    out.m_80.x = _2340;
    out.m_80.y = _2186;
    out.m_80.z = _2342;
    float _2376 = trunc(_2324);
    float _2378 = precise::max(_2376, 0.0);
    uint _2380 = uint(_2378);
    float _2382 = fma(_2328, _2328, _2316);
    int _2384 = int(_2168) + int(_2280);
    int _2386 = ~_2076;
    int _2388 = _2386 + 1;
    int _2390 = int(_2194) + int(_2334);
    int _2392 = int(_2218) + int(_2362);
    float _2394 = _2382 + _2370;
    int _2396 = ~_2004;
    int _2398 = _2396 + 1;
    int _2400 = ~_1952;
    int _2402 = _2400 + 1;
    int _2404 = _2398 * _2390;
    int _2406 = _2404 + _2132;
    int _2408 = int(_2252) + int(_2380);
    int _2410 = _2388 * _2392;
    int _2412 = _2410 + _2160;
    int _2414 = ~_2096;
    int _2416 = _2414 + 1;
    int _2418 = _2402 * _2384;
    int _2420 = _2418 + _2110;
    bool _2422 = uint(_2406) >= uint(_2004);
    float _2424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2426 = uint(_2412) >= uint(_2076);
    int _2428 = _2416 * _2408;
    int _2430 = _2428 + _2156;
    bool _2432 = uint(_2420) >= uint(_1952);
    bool _2434 = !_2422;
    int _2436 = _2434 ? 0 : (-1);
    bool _2438 = !_2432;
    int _2440 = _2438 ? 0 : (-1);
    float _2442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2444 = uint(_2430) >= uint(_2096);
    int _2446 = _2110 ^ _1952;
    int _2448 = ~_2390;
    int _2450 = _2448 + _2436;
    int _2452 = _2450 + 1;
    int _2454 = ~_2384;
    int _2456 = _2454 + _2440;
    int _2458 = _2456 + 1;
    float _2460 = _2424 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2462 = !_2426;
    int _2464 = _2462 ? 0 : (-1);
    float _2466 = sqrt(_2394);
    uint _2468 = uint(int(uint(_2446) >> uint(31)));
    int _2470 = _1952 * _2458;
    int _2472 = _2470 + _2110;
    int _2474 = _2132 ^ _2004;
    int _2476 = _2004 * _2452;
    int _2478 = _2476 + _2132;
    bool _2480 = _1952 == 0;
    float _2482 = _2442 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2484 = _1952 == 0;
    int _2486 = ~_2464;
    int _2488 = _2392 + _2486;
    int _2490 = _2488 + 1;
    float _2492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2494 = ~int(_2468);
    int _2496 = _2494 + 1;
    bool _2498 = !_2444;
    float _2500 = _2498 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    uint _2502 = uint(int(uint(_2474) >> uint(31)));
    int _2504 = _2490 ^ _2496;
    float _2506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2508 = !_2480;
    int _2510 = _2508 ? _2472 : (-1);
    int _2512 = ~as_type<int>(_2500);
    int _2514 = _2408 + _2512;
    int _2516 = _2514 + 1;
    int _2518 = ~int(_2502);
    int _2520 = _2518 + 1;
    int _2522 = ~_2496;
    int _2524 = _2522 + _2504;
    int _2526 = _2524 + 1;
    float _2528 = fma(_2284, _2284, 1.0);
    float _2530 = float(_2510);
    int _2532 = _2516 ^ _2520;
    bool _2534 = !_2270;
    int _2536 = _2534 ? _2478 : (-1);
    float _2538 = fma(_2460, _2530, _631);
    float _2540 = rsqrt(_2528);
    int _2542 = ~_2520;
    int _2544 = _2542 + _2532;
    int _2546 = _2544 + 1;
    float _2548 = _2492 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2550 = !_2484;
    int _2552 = _2550 ? _2526 : (-1);
    float _2554 = _2506 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2556 = float(_2536);
    float _2558 = _2036 + 0.5;
    float _2560 = float(_2552);
    out.m_82.x = _1017;
    out.m_82.y = _1019;
    out.m_82.z = _1021;
    bool _2562 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2564 = isnan(_2466);
    bool _2566 = _2562 || _2564;
    bool _2568 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2570 = _2566 || _2568;
    float _2572 = fma(_2548, _2556, _615);
    bool _2574 = !_2372;
    int _2576 = _2574 ? _2546 : (-1);
    float _2578 = -_329;
    float _2580 = fma(_2482, _2560, _2578);
    float _2582 = _2338 + 0.5;
    float _2584 = fma(_2460, _2558, _2538);
    float _2586 = float(_2576);
    float _2588 = _2306 + (-0.5);
    float _2590 = fma(_2548, _2582, _2572);
    float _2592 = _2284 * _2540;
    float _2594 = -_1061;
    float _2596 = fma(_2036, _2594, _2584);
    float _2598 = -_565;
    float _2600 = fma(_2554, _2586, _2598);
    float _2602 = _2030 + (-0.5);
    float _2604 = -_2482;
    float _2606 = fma(_2604, _2588, _2580);
    float _2608 = -_2220;
    float _2610 = _2592 * _2608;
    float _2612 = -_2234;
    float _2614 = _2592 * _2612;
    float _2616 = -_2236;
    float _2618 = _2592 * _2616;
    float _2620 = -_2554;
    float _2622 = fma(_2620, _2602, _2600);
    float _2624 = fma(_2540, _2158, _2610);
    float _2626 = fma(_2540, _2154, _2614);
    float _2628 = -_1053;
    float _2630 = fma(_2338, _2628, _2590);
    float _2632 = fma(_2306, _1043, _2606);
    float _2634 = fma(_2540, _2182, _2618);
    float _2636 = _2220 + _2348;
    float _2638 = fma(_2030, _1067, _2622);
    float _2640 = _2234 + _2366;
    float _2642 = _2236 + _2374;
    out.m_84.x = _2624;
    out.m_84.y = _2626;
    out.m_84.z = _2634;
    float _2644 = as_type<float>(_2384);
    float _2646 = _2370;
    float _2648 = _2500;
    float _2650 = _2618;
    if (!_2570)
    {
        _1174 = 1.0;
    }
    float _2652 = _1174;
    out.m_86.x = _2596;
    out.m_86.y = _2632;
    out.m_86.z = _2630;
    out.m_86.w = _2638;
    out.m_88.x = _2636;
    out.m_88.y = _2640;
    out.m_88.z = _2642;
    bool _2654 = !_2570;
    float _2656 = _2652;
    if (!_2654)
    {
        bool _2658 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2660 = isnan(_2466);
        bool _2662 = _2658 || _2660;
        bool _2664 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2666 = _2662 || _2664;
        if (!_2666)
        {
            float _2668 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2670 = _2466 + _2668;
            float _2672 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2674 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2672;
            float _2676 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2678 = _2676 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2680 = 1.0 / _2674;
            float _2682 = _2670 * _2680;
            float _2684 = fma(_2682, _2678, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2656 = _2684;
            _2686 = true;
        }
        else
        {
            bool _2688 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2690 = isnan(_2466);
            bool _2692 = _2688 || _2690;
            bool _2694 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2696 = _2692 || _2694;
            if (!_2696)
            {
                float _2698 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2700 = _2466 + _2698;
                float _2702 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2704 = _2702 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2706 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2708 = _2706 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2710 = 1.0 / _2704;
                float _2712 = _2700 * _2710;
                float _2714 = fma(_2712, _2708, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2656 = _2714;
                _2686 = true;
            }
            else
            {
                _2656 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2686 = false;
    float _2716 = _2656;
    float _2718 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2720 = _2262 + _2718;
    float _2722 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2724 = _1003 + _2722;
    float _2726 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2728 = _1007 + _2726;
    float _2730 = fma(_2720, _2716, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2732 = fma(_2724, _2716, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2734 = fma(_2728, _2716, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2736 = _923 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2740 = _2730 + _2738;
    float _2742 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2744 = _2732 + _2742;
    float _2746 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2748 = _2734 + _2746;
    float _2750 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2736);
    float _2752 = _2740 * _2740;
    float _2754 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2750);
    float _2756 = fma(_2744, _2744, _2752);
    float _2758 = _923 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2760 = _2754 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2762 = fma(_2748, _2748, _2756);
    float _2764 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2758);
    float _2766 = 1.0 / _2760;
    float _2768 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2770 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2764);
    float _2772 = _2770 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2774 = rsqrt(_2762);
    float _2776 = _2772 + _2760;
    float _2778 = _2776 * _2766;
    float _2780 = _2778 * 0.5;
    float _2782 = floor(_2768);
    float _2784 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2786 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2784);
    float _2788 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2790 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2792 = _923 + _2788;
    float _2794 = 1.0 / _2786;
    float _2796 = _2744 * _2790;
    float _2798 = _2748 * _2790;
    float _2800 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2802 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2804 = _2796 * _2796;
    float _2806 = _2798 * _2798;
    float _2808 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2800);
    float _2810 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2802);
    float _2812 = -_2782;
    float _2814 = _2768 + _2812;
    float _2816 = _2804 + _2806;
    float _2818 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2808);
    float _2820 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2810);
    float _2822 = sqrt(_2762);
    float _2824 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2826 = _2794 * _2824;
    float _2828 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2830 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2832 = _2826 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2834 = sqrt(_2816);
    bool _2836 = _2826 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2838 = trunc(_2828);
    int _2840 = int(_2838);
    int _2842 = 2;
    float _2844 = _2816;
    float _2846 = _2790;
    float _2848 = _2796;
    float _2850 = _2804;
    if (!_2832)
    {
        _2842 = 1;
    }
    int _2852 = _2842;
    bool _2854 = _2834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2858 = _2834 + _2856;
    float _2860 = trunc(_2830);
    int _2862 = int(_2860);
    int _2864 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2866 = _2840 + _2864;
    int _2868 = _2866 + 1;
    float _2870 = _2760;
    float _2872 = _2858;
    int _2874 = _2852;
    if (_2854)
    {
        float _2876 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2870 = _2876;
    }
    float _2878 = _2870;
    int _2880 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2882 = _2862 + _2880;
    int _2884 = _2882 + 1;
    if (_2854)
    {
        float _2886 = rsqrt(_2816);
        _2844 = _2886;
    }
    float _2888 = _2844;
    float _2890 = _2888;
    if (_2854)
    {
        float _2892 = _2858 * _2878;
        _2872 = _2892;
    }
    float _2894 = _2872;
    if (_2854)
    {
        float _2896 = _2894 * 0.15915493667125701904296875;
        _2644 = _2896;
    }
    float _2898 = _2644;
    bool _2900 = !_2832;
    int _2902 = _2900 ? 0 : 1;
    float _2904 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2906 = _2820;
    if (_2854)
    {
        float _2908 = _2898 * 6.283185482025146484375;
        float _2910 = sin(_2908);
        _2906 = _2910;
    }
    float _2912 = _2906;
    if (!_2836)
    {
        _2874 = _2902;
    }
    int _2914 = _2874;
    float _2916 = precise::max(0.0, _2904);
    int _2918 = _2914 << 6;
    bool _2920 = _2868 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2922 = -_2790;
    float _2924 = -_2916;
    float _2926 = fma(_2740, _2922, _2924);
    int _2928 = _2918 + 96;
    uint _2930 = uint(int(uint(_2928) >> uint(2)));
    uint _2932 = uint(int(uint(int(_2930)) >> uint(2)));
    int _2934 = int(_2930) & 3;
    float _2936 = (*spvDescriptorSet0.vp_c15)._m0[int(_2932)][_2934];
    int _2938 = int(_2930) + 1;
    uint _2940 = uint(int(uint(_2938) >> uint(2)));
    int _2942 = _2938 & 3;
    float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
    int _2946 = _2868 | _2884;
    float _2948 = _2898;
    float _2950 = as_type<float>(_2946);
    float _2952 = _2926;
    if (_2854)
    {
        float _2954 = _2898 * 6.283185482025146484375;
        float _2956 = cos(_2954);
        _2948 = _2956;
    }
    float _2958 = _2948;
    if (_2854)
    {
        float _2960 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2846 = _2960;
    }
    float _2962 = _2846;
    bool _2964 = _2946 < 0;
    bool _2966 = _2964 || _2920;
    if (_2854)
    {
        float _2968 = fma(_2912, _2962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2950 = _2968;
    }
    float _2970 = _2950;
    int _2972 = _2918 + 48;
    uint _2974 = uint(int(uint(_2972) >> uint(2)));
    uint _2976 = uint(int(uint(int(_2974)) >> uint(2)));
    int _2978 = int(_2974) & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    int _2982 = int(_2974) + 1;
    uint _2984 = uint(int(uint(_2982) >> uint(2)));
    int _2986 = _2982 & 3;
    float _2988 = (*spvDescriptorSet0.vp_c15)._m0[int(_2984)][_2986];
    float _2990 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2992 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_2854)
    {
        float _2994 = _2888 * _2970;
        _2646 = _2994;
    }
    float _2996 = _2646;
    bool _2998 = _2884 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3000 = _2998 || _2966;
    float _3002 = fma(_2732, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2990);
    float _3004 = floor(_2992);
    if (_2854)
    {
        float _3006 = _2796 * _2996;
        _2848 = _3006;
    }
    float _3008 = _2848;
    int _3010 = _2918 + 104;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    uint _3014 = uint(int(uint(int(_3012)) >> uint(2)));
    int _3016 = int(_3012) & 3;
    float _3018 = (*spvDescriptorSet0.vp_c15)._m0[int(_3014)][_3016];
    int _3020 = int(_3012) + 1;
    uint _3022 = uint(int(uint(_3020) >> uint(2)));
    int _3024 = _3020 & 3;
    float _3026 = (*spvDescriptorSet0.vp_c15)._m0[int(_3022)][_3024];
    float _3028 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3002);
    float _3030 = _3028;
    if (_2854)
    {
        float _3032 = _2958 + (-1.0);
        _2890 = _3032;
    }
    float _3034 = _2890;
    float _3036 = _3034;
    if (_2854)
    {
        float _3038 = _3008 * _3008;
        _2850 = _3038;
    }
    float _3040 = _2850;
    if (_2854)
    {
        float _3042 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2648 = _3042;
    }
    float _3044 = _2648;
    if (!_2854)
    {
        _3036 = _2798;
    }
    float _3046 = _3036;
    int _3048 = _2918 + 64;
    uint _3050 = uint(int(uint(_3048) >> uint(2)));
    uint _3052 = uint(int(uint(int(_3050)) >> uint(2)));
    int _3054 = int(_3050) & 3;
    float _3056 = (*spvDescriptorSet0.vp_c15)._m0[int(_3052)][_3054];
    int _3058 = int(_3050) + 1;
    uint _3060 = uint(int(uint(_3058) >> uint(2)));
    int _3062 = _3058 & 3;
    float _3064 = (*spvDescriptorSet0.vp_c15)._m0[int(_3060)][_3062];
    float _3066 = _3046;
    if (_2854)
    {
        float _3068 = _2798 * _2996;
        _3066 = _3068;
    }
    float _3070 = _3066;
    if (_2854)
    {
        float _3072 = fma(_2926, _2958, _3044);
        _2952 = _3072;
    }
    float _3074 = _2952;
    float _3076 = _3028 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_2854)
    {
        _3030 = _2806;
    }
    float _3078 = _3030;
    float _3080 = _3078;
    if (_2854)
    {
        float _3082 = _3070 * _3070;
        _3080 = _3082;
    }
    float _3084 = _3080;
    float _3086 = fma(_3074, _3074, _3040);
    if (!_3000)
    {
        float _3088 = floor(_2830);
        _2650 = _3088;
    }
    float _3090 = _2650;
    int _3092 = _2918 + 80;
    uint _3094 = uint(int(uint(_3092) >> uint(2)));
    uint _3096 = uint(int(uint(int(_3094)) >> uint(2)));
    int _3098 = int(_3094) & 3;
    float _3100 = (*spvDescriptorSet0.vp_c15)._m0[int(_3096)][_3098];
    int _3102 = int(_3094) + 1;
    uint _3104 = uint(int(uint(_3102) >> uint(2)));
    int _3106 = _3102 & 3;
    float _3108 = (*spvDescriptorSet0.vp_c15)._m0[int(_3104)][_3106];
    float _3110 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3112 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3114 = -_3004;
    float _3116 = _2992 + _3114;
    float _3118 = _3086 + _3084;
    float _3120 = -_3112;
    float _3122 = fma(_3120, _3110, 1.0);
    int _3124 = as_type<int>(_3112);
    if (!_3000)
    {
        int _3126 = _2884 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3128 = _3126 + _2868;
        _3124 = _3128;
    }
    int _3130 = _3124;
    int _3132 = _2918 + 56;
    uint _3134 = uint(int(uint(_3132) >> uint(2)));
    uint _3136 = uint(int(uint(int(_3134)) >> uint(2)));
    int _3138 = int(_3134) & 3;
    float _3140 = (*spvDescriptorSet0.vp_c15)._m0[int(_3136)][_3138];
    int _3142 = int(_3134) + 1;
    uint _3144 = uint(int(uint(_3142) >> uint(2)));
    int _3146 = _3142 & 3;
    float _3148 = (*spvDescriptorSet0.vp_c15)._m0[int(_3144)][_3146];
    float _3150 = log2(_3122);
    int _3152 = _2918 + 88;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    uint _3156 = uint(int(uint(int(_3154)) >> uint(2)));
    int _3158 = int(_3154) & 3;
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[int(_3156)][_3158];
    int _3162 = int(_3154) + 1;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    int _3166 = _3162 & 3;
    float _3168 = (*spvDescriptorSet0.vp_c15)._m0[int(_3164)][_3166];
    float _3170 = _2792 * _2944;
    float _3172 = fma(_887, _2936, _3170);
    int _3174 = _2918 + 72;
    uint _3176 = uint(int(uint(_3174) >> uint(2)));
    uint _3178 = uint(int(uint(int(_3176)) >> uint(2)));
    int _3180 = int(_3176) & 3;
    float _3182 = (*spvDescriptorSet0.vp_c15)._m0[int(_3178)][_3180];
    int _3184 = int(_3176) + 1;
    uint _3186 = uint(int(uint(_3184) >> uint(2)));
    int _3188 = _3184 & 3;
    float _3190 = (*spvDescriptorSet0.vp_c15)._m0[int(_3186)][_3188];
    float _3192 = _2792 * _2988;
    float _3194 = rsqrt(_3118);
    float _3196 = _3150 * 0.693147182464599609375;
    float _3198 = fma(_887, _2980, _3192);
    int _3200 = as_type<int>(_3192);
    int _3202 = as_type<int>(_2936);
    if (!_3000)
    {
        int _3204 = _3130 << 2;
        _3200 = _3204;
    }
    int _3206 = _3200;
    float _3208 = fma(_889, _3018, _3172);
    int _3210 = _3206;
    if (!_3000)
    {
        int _3212 = 12 & _3206;
        _3210 = _3212;
    }
    int _3214 = _3210;
    float _3216 = _3208 + _3026;
    float _3218 = _2792 * _3064;
    float _3220 = _3064;
    int _3222 = as_type<int>(_3108);
    if (!_3000)
    {
        float _3224 = -_3090;
        float _3226 = _2830 + _3224;
        _3220 = _3226;
    }
    float _3228 = _3220;
    float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3232 = fma(_2822, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3230);
    float _3234 = precise::clamp(_3232, 0.0, 1.0);
    float _3236 = _3194 * _3008;
    float _3238 = fma(_887, _3056, _3218);
    float _3240 = _3194 * _3074;
    float _3242 = _3194 * _3070;
    float _3244 = _3236 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3246 = _2792 * _3108;
    if (!_3000)
    {
        uint _3248 = uint(int(uint(_3130) >> uint(2)));
        _3222 = int(_3248);
    }
    int _3250 = _3222;
    float2 _8836 = float2(_2814, _3116);
    float _3252 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8836, float2(0.0), isnan(_8836)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8836, float2(0.0), isnan(_8836)), level(0.0)).x;
    float _3254 = _3196 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3256 = fma(_887, _3100, _3246);
    float _3258 = -_3234;
    float _3260 = _3258 + 1.0;
    if (!_3000)
    {
        int _3262 = _3250 << 4;
        int _3264 = _3262 + _3214;
        _3202 = _3264;
    }
    int _3266 = _3202;
    float _3268 = fma(_889, _3140, _3198);
    float _3270 = 1.0 / _3216;
    float _3272 = _3234;
    if (!_3000)
    {
        int _3274 = _3266 + 400;
        uint _3276 = uint(int(uint(_3274) >> uint(2)));
        uint _3278 = uint(int(uint(int(_3276)) >> uint(2)));
        int _3280 = int(_3276) & 3;
        float _3282 = (*spvDescriptorSet0.vp_c15)._m0[int(_3278)][_3280];
        _3272 = _3282;
    }
    float _3284 = _3272;
    float _3286 = _3268 + _3148;
    float _3288 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3290 = fma(_889, _3160, _3256);
    float _3292 = -_3244;
    float _3294 = fma(_3240, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3292);
    float _3296 = abs(_3260);
    float _3298 = log2(_3296);
    float _3300 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3302 = fma(_2732, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3288);
    float _3304 = -_3242;
    float _3306 = fma(_3304, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3294);
    float _3308 = _3240 + 1.0;
    float _3310 = fma(_2732, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3300);
    float _3312 = fma(_889, _3182, _3238);
    float _3314 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3302);
    float _3316 = _3286 * _3270;
    float _3318 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3310);
    float _3320 = _3312 + _3190;
    float _3322 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3324 = fma(_3306, -0.5, 0.5);
    bool _3326 = _3316 >= 0.0;
    float _3328 = _3320 * _3270;
    float _3330 = fma(_2732, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3322);
    float _3332 = _3298 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _3334 = _3316 <= 1.0;
    bool _3336 = _3334 && _3326;
    float _3338 = _3318 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3340 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3330);
    float _3342 = exp2(_3332);
    bool _3344 = _3328 >= 0.0;
    bool _3346 = _3344 && _3336;
    float _3348 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3350 = _3340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3352 = fma(_3306, 0.5, 0.5);
    bool _3354 = _3328 <= 1.0;
    bool _3356 = _3354 && _3346;
    float _3358 = _3314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3360 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3348);
    float _3362 = sqrt(_3324);
    float _3364 = _3290 + _3168;
    float _3366 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3360);
    float _3368 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3370 = fma(_3352, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3372 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3366);
    float _3374 = -_3240;
    float _3376 = fma(_3342, _3308, _3374);
    float _3378 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3368);
    float _3380 = fma(_3352, _3370, -0.212114393711090087890625);
    float _3382 = 1.0 / _3372;
    float _3384 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3386 = _3308;
    if (_3356)
    {
        float _3388 = float(_2914);
        _3386 = _3388;
    }
    float _3390 = _3386;
    float _3392 = fma(_3352, _3380, 1.570728778839111328125);
    float _3394 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3378);
    float _3396 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3384);
    float _3398 = _3362 * 0.636619746685028076171875;
    float _3400 = _3364 * _3270;
    float _3402 = _3390;
    float _3404 = _3400;
    if (_3356)
    {
        float _3406 = rint(_3390);
        float _3408 = precise::max(_3406, 0.0);
        uint _3410 = uint(_3408);
        uint _3412 = clamp(_3410, 0u, 65535u);
        _3402 = as_type<float>(_3412);
    }
    float _3414 = _3402;
    float _3416 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3396);
    float _3418 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3394);
    float _3420 = -_3392;
    float _3422 = fma(_3398, _3420, 1.0);
    float _3424 = fma(_3376, 0.5, 0.5);
    float _3426 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3416);
    float _3428 = _3314;
    if (!_3000)
    {
        float _3430 = floor(_2828);
        _3428 = _3430;
    }
    float _3432 = _3428;
    float _3434 = _3418 * _3382;
    float _3436 = _3426 * _3382;
    float _3438 = fma(_3434, 0.5, 0.5);
    float _3440 = fma(_3436, -0.5, 0.5);
    float _3442 = _3414;
    if (_3356)
    {
        float3 _9165 = float3(_3316, _3328, float(as_type<int>(_3414)));
        float3 _9169 = select(_9165, float3(0.0), isnan(_9165));
        float _3444 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9169.xy, uint(rint(_9169.z)), _3400, level(0.0));
        _3442 = _3444;
    }
    float _3446 = _3442;
    float _3448 = _3270;
    if (!_3000)
    {
        float _3450 = rint(_3284);
        float _3452 = precise::max(_3450, 0.0);
        uint _3454 = uint(_3452);
        uint _3456 = clamp(_3454, 0u, 65535u);
        _3448 = as_type<float>(_3456);
    }
    float _3458 = _3448;
    float3 _9195 = float3(_3438, _3440, _3254);
    float _3460 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9195, float3(0.0), isnan(_9195)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9195, float3(0.0), isnan(_9195)), level(0.0)).x;
    float _3462 = _3432;
    if (!_3000)
    {
        float _3464 = -_3432;
        float _3466 = _2828 + _3464;
        _3462 = _3466;
    }
    float _3468 = _3462;
    float3 _9216 = float3(_3438, _3440, _3254);
    float4 _3471 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9216, float3(0.0), isnan(_9216)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9216, float3(0.0), isnan(_9216)), level(0.0)).xyzw;
    float _3473 = _3471.x;
    float _3475 = _3471.y;
    float _3477 = _3471.z;
    float _3479 = _3471.w;
    float2 _9232 = float2(_3422, _3424);
    float3 _3481 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9232, float2(0.0), isnan(_9232)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9232, float2(0.0), isnan(_9232)), level(0.0)).xyz;
    float _3483 = _3481.x;
    float _3485 = _3481.y;
    float _3487 = _3481.z;
    float _3489 = _3458;
    float _3491 = _3468;
    if (!_3000)
    {
        float3 _9254 = float3(_3468, _3228, float(as_type<int>(_3458)));
        float3 _9256 = select(_9254, float3(0.0), isnan(_9254));
        float _3493 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9256.xy, uint(rint(_9256.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9256.xy, uint(rint(_9256.z)), level(0.0)).x;
        _3489 = _3493;
    }
    float _3495 = _3489;
    float _3497 = abs(_2826);
    float _3499 = log2(_3497);
    float _3501 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3503 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3501);
    float _3505 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3503);
    bool _3507 = _2826 <= 8000.0;
    bool _3509 = isnan(_2826);
    bool _3511 = _3507 || _3509;
    bool _3513 = isnan(8000.0);
    bool _3515 = _3511 || _3513;
    float _3517 = float(_3515);
    float _3519 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3505);
    float _3521 = _3298 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3523 = _3499 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_3356)
    {
        _3491 = 1.0;
    }
    float _3525 = _3491;
    out.gl_Position.x = _3418;
    out.gl_Position.y = _3426;
    out.gl_Position.z = _3519;
    out.gl_Position.w = _3372;
    float _3527 = exp2(_3521);
    float _3529 = exp2(_3523);
    float _3531 = fma(_3529, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3533 = precise::clamp(_3531, 0.0, 1.0);
    float _3535 = fma(_3533, -2.0, 3.0);
    float _3537 = _3533 * _3533;
    float _3539 = _3537 * _3535;
    float _3541 = _3519 + _3372;
    float _3543 = _3541 * 0.5;
    float _3545 = -_3539;
    float _3547 = _3545 + 1.0;
    out.m_90.z = _3543;
    out.m_90.w = _3372;
    float _3549 = fma(_3547, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3539);
    float _3551 = _3517 * _3549;
    float _3553 = -_3527;
    float _3555 = _3553 + 1.0;
    float _3557 = _3551 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3559 = _3555 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3561 = -_3252;
    float _3563 = _3561 + 1.0;
    float _3565 = _3563 * _3557;
    float _3567 = precise::clamp(_3565, 0.0, 1.0);
    float _3569 = _3557;
    float _3571 = _3525;
    float _3573 = _3567;
    if (_3000)
    {
        _3569 = 1.0;
    }
    float _3575 = _3569;
    float _3577 = _3575;
    if (_3356)
    {
        bool _3579 = _3446 >= _3400;
        bool _3581 = isnan(_3446);
        bool _3583 = _3579 || _3581;
        bool _3585 = isnan(_3400);
        bool _3587 = _3583 || _3585;
        float _3589 = float(_3587);
        _3571 = _3589;
    }
    float _3591 = _3571;
    if (!_3000)
    {
        int _3593 = _3130 << 4;
        int _3595 = _3593 + 2048;
        uint _3597 = uint(int(uint(_3595) >> uint(2)));
        uint _3599 = uint(int(uint(int(_3597)) >> uint(2)));
        int _3601 = int(_3597) & 3;
        float _3603 = (*spvDescriptorSet0.vp_c15)._m0[int(_3599)][_3601];
        int _3605 = int(_3597) + 1;
        uint _3607 = uint(int(uint(_3605) >> uint(2)));
        int _3609 = _3605 & 3;
        float _3611 = (*spvDescriptorSet0.vp_c15)._m0[int(_3607)][_3609];
        int _3613 = _3595 + 8;
        uint _3615 = uint(int(uint(_3613) >> uint(2)));
        uint _3617 = uint(int(uint(int(_3615)) >> uint(2)));
        int _3619 = int(_3615) & 3;
        float _3621 = (*spvDescriptorSet0.vp_c15)._m0[int(_3617)][_3619];
        int _3623 = int(_3615) + 1;
        uint _3625 = uint(int(uint(_3623) >> uint(2)));
        int _3627 = _3623 & 3;
        float _3629 = (*spvDescriptorSet0.vp_c15)._m0[int(_3625)][_3627];
        float _3631 = _2792 * _3611;
        float _3633 = fma(_887, _3603, _3631);
        float _3635 = fma(_889, _3621, _3633);
        float _3637 = _3635 + _3629;
        float _3639 = precise::clamp(_3637, 0.0, 1.0);
        float _3641 = -_3639;
        float _3643 = _3641 + _3495;
        float _3645 = fma(_3643, 500.0, 1.5);
        float _3647 = exp2(_3645);
        float _3649 = 0.0 + _3647;
        float _3651 = precise::clamp(_3649, 0.0, 1.0);
        _3577 = _3651;
    }
    float _3653 = _3577;
    float _3655 = _3591 * _3653;
    float _3657 = _3559 * _3460;
    float _3659 = -_3567;
    float _3661 = fma(_3659, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3663 = -_3559;
    float _3665 = _3663 + 1.0;
    out.m_92.x = _2732;
    out.m_92.y = _2730;
    out.m_92.z = _2734;
    float _3667 = _3479 * _3657;
    float _3669 = -_3655;
    float _3671 = fma(_3669, _3661, 1.0);
    float _3673 = precise::clamp(_3671, 0.0, 1.0);
    float _3675 = _3487 * _3657;
    float _3677 = _3479 * _3665;
    float _3679 = fma(_3483, _3667, _3473);
    float _3681 = fma(_3485, _3667, _3475);
    float _3683 = _3673 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3685 = fma(_3479, _3675, _3477);
    bool _3687 = _2822 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3689 = isnan(_2822);
    bool _3691 = _3687 || _3689;
    bool _3693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3695 = _3691 || _3693;
    out.m_94.x = _3683;
    out.m_96.x = _3679;
    out.m_96.y = _3681;
    out.m_96.z = _3685;
    out.m_96.w = _3677;
    float _3697 = _3667;
    float _3699 = _3655;
    float _3701 = _3673;
    float _3703 = _3665;
    if (!_3695)
    {
        _3404 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3705 = _3404;
    float _3707 = _3705;
    float _3709 = _3705;
    if (!_3695)
    {
        _3573 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3711 = _3573;
    float _3713 = _3711;
    float _3715 = _3711;
    if (!_3695)
    {
        _3697 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3717 = _3697;
    float _3719 = _3717;
    float _3721 = _3717;
    if (!_3695)
    {
        _3699 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3723 = _3699;
    float _3725 = _3723;
    float _3727 = _3723;
    if (!_3695)
    {
        _3701 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3729 = _3701;
    float _3731 = _3729;
    float _3733 = _3729;
    if (!_3695)
    {
        _3703 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3735 = _3703;
    bool _3737 = !_3695;
    float _3739 = _3735;
    float _3741 = _3735;
    if (!_3737)
    {
        bool _3743 = _2822 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3745 = isnan(_2822);
        bool _3747 = _3743 || _3745;
        bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3751 = _3747 || _3749;
        if (!_3751)
        {
            float _3753 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3755 = _2822 + _3753;
            float _3757 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3759 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3757;
            float _3761 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3763 = _3761 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3765 = 1.0 / _3759;
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3771 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3775 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3777 = _3775 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3779 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3781 = _3779 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3783 = _3755 * _3765;
            float _3785 = precise::clamp(_3783, 0.0, 1.0);
            float _3787 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3789 = _3787 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3791 = fma(_3785, _3763, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3793 = fma(_3785, _3789, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3795 = fma(_3785, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3797 = fma(_3785, _3773, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3799 = fma(_3785, _3777, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3801 = fma(_3785, _3781, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3715 = _3795;
            _3733 = _3799;
            _3709 = _3791;
            _3727 = _3797;
            _3721 = _3793;
            _3741 = _3801;
            _3803 = true;
        }
        else
        {
            bool _3805 = _2822 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3807 = isnan(_2822);
            bool _3809 = _3805 || _3807;
            bool _3811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3813 = _3809 || _3811;
            if (!_3813)
            {
                _3707 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3815 = _3707;
            _3709 = _3815;
            if (!_3813)
            {
                _3713 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3817 = _3713;
            _3715 = _3817;
            if (!_3813)
            {
                _3719 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3819 = _3719;
            _3721 = _3819;
            if (!_3813)
            {
                _3725 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3821 = _3725;
            _3727 = _3821;
            if (!_3813)
            {
                _3731 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3823 = _3731;
            _3733 = _3823;
            if (!_3813)
            {
                _3739 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3825 = _3739;
            bool _3827 = !_3813;
            _3741 = _3825;
            if (!_3827)
            {
                bool _3829 = _2822 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3831 = isnan(_2822);
                bool _3833 = _3829 || _3831;
                bool _3835 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3837 = _3833 || _3835;
                if (!_3837)
                {
                    float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3841 = _2822 + _3839;
                    float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3845 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3843;
                    float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3851 = 1.0 / _3845;
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3869 = _3841 * _3851;
                    float _3871 = precise::clamp(_3869, 0.0, 1.0);
                    float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3877 = fma(_3871, _3849, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3879 = fma(_3871, _3875, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3881 = fma(_3871, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3883 = fma(_3871, _3859, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3885 = fma(_3871, _3863, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3887 = fma(_3871, _3867, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3715 = _3881;
                    _3733 = _3885;
                    _3709 = _3877;
                    _3727 = _3883;
                    _3721 = _3879;
                    _3741 = _3887;
                    _3803 = true;
                }
                else
                {
                    _3715 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3733 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3709 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3727 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3721 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3741 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3803 = false;
    float _3889 = _3715;
    float _3891 = _3733;
    float _3893 = _3709;
    float _3895 = _3727;
    float _3897 = _3721;
    float _3899 = _3741;
    float _3901 = fma(_2640, -0.5, 0.5);
    float _3903 = precise::clamp(_3901, 0.0, 1.0);
    float _3905 = -_3889;
    float _3907 = _3905 + _3891;
    float _3909 = -_3893;
    float _3911 = _3909 + _3895;
    float _3913 = -_3897;
    float _3915 = _3913 + _3899;
    bool _3917 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3919 = fma(_3903, _3907, _3889);
    float _3921 = fma(_3903, _3911, _3893);
    float _3923 = fma(_3903, _3915, _3897);
    float _3925 = _3919 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _3927 = fma(_3921, 0.298911988735198974609375, _3925);
    float _3929 = fma(_3923, 0.114477999508380889892578125, _3927);
    out.m_98.x = 0.0;
    float _3931 = -_3929;
    float _3933 = _3921 + _3931;
    float _3935 = -_3929;
    float _3937 = _3919 + _3935;
    float _3939 = -_3929;
    float _3941 = _3923 + _3939;
    float _3943 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3945 = fma(_3933, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3929);
    float _3947 = fma(_3937, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3929);
    float _3949 = fma(_3941, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3929);
    out.m_94.w = _3943;
    out.m_100.x = _3945;
    out.m_100.y = _3947;
    out.m_100.z = _3949;
    if (!_3917)
    {
        return out;
    }
    float _3951 = -_2730;
    float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3955 = -_2732;
    float _3957 = _3955 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3959 = -_2734;
    float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3963 = _3953 * _3953;
    float _3965 = fma(_3957, _3957, _3963);
    float _3967 = fma(_3961, _3961, _3965);
    float _3969 = sqrt(_3967);
    float _3971 = rsqrt(_3967);
    float _3973 = -_3969;
    float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3977 = _3975 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3979 = precise::clamp(_3977, 0.0, 1.0);
    float _3981 = _3957 * _3971;
    float _3983 = _3953 * _3971;
    float _3985 = abs(_3979);
    float _3987 = log2(_3985);
    float _3989 = _3961 * _3971;
    float _3991 = _3981 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3993 = _2640 * _3983;
    float _3995 = -_3983;
    float _3997 = -_3991;
    float _3999 = fma(_3995, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3997);
    float _4001 = fma(_2636, _3981, _3993);
    float _4003 = -_3989;
    float _4005 = fma(_4003, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3999);
    float _4007 = fma(_2642, _3989, _4001);
    float _4009 = precise::clamp(_4007, 0.0, 1.0);
    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4013 = _4005 + _4011;
    float _4015 = _3987 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4017 = _4013 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4019 = precise::clamp(_4017, 0.0, 1.0);
    float _4021 = exp2(_4015);
    float _4023 = _4021 * _4019;
    float _4025 = _4009 * _4023;
    float _4027 = _4025 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4029 = _4025 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4031 = _4025 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4027;
    out.m_98.y = _4029;
    out.m_98.z = _4031;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3803 = false;
    bool _2686 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_60.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    float _127 = as_type<float>(_119);
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _125;
    float _131 = _129;
    if (!_123)
    {
        out.m_63.x = 0.0;
    }
    int _133 = 0;
    if (!_123)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4090 = as_type<float>(_137);
        out.gl_Position.z = _4090;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_65.w;
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
        float _159 = float(_119);
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
        out.m_63.x = 0.0;
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
        float _4160 = as_type<float>(_175);
        out.gl_Position.z = _4160;
    }
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _199 = in.m_70.x;
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
        float _219 = float(_119);
        float _221 = 1.0 / _219;
        float _223 = _155 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = in.m_70.x;
    float _229 = in.m_70.y;
    float _231 = in.m_70.z;
    float _233 = in.m_70.w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _225 + _235;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _247 = _245 != 0;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _249 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _255 = 1.0 / _243;
    float _257 = float(_119);
    float _259 = 1.0 / _251;
    float _261 = _227 * 2.0;
    float _263 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _265 = _229 * 2.0;
    float _267 = _227 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _271 = floor(_261);
    float _273 = fma(_263, -2.0, _239);
    float _275 = _231 * 2.0;
    float _277 = -_253;
    float _279 = fma(_267, 2.0, _277);
    float _281 = _231 + _227;
    float _283 = _227 + _229;
    float _285 = _237 * _255;
    float _287 = floor(_265);
    float _289 = _281 + (-1.0);
    float _291 = _283 + (-1.0);
    int _293 = as_type<int>(_283);
    if (_247)
    {
        _293 = 0;
    }
    int _295 = _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _225 + _297;
    float _301 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _303 = _295;
    if (!_247)
    {
        _303 = 1;
    }
    int _305 = _303;
    float _307 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _309 = floor(_275);
    bool _311 = _271 >= 0.0;
    bool _313 = isnan(_271);
    bool _315 = _311 || _313;
    bool _317 = isnan(0.0);
    bool _319 = _315 || _317;
    float _321 = _299 * _259;
    bool _323 = _271 > 0.0;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _327 = _319 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _329 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[76].y, _273);
    bool _331 = _305 != 1;
    float _333 = _231 + _229;
    bool _335 = _287 >= 0.0;
    bool _337 = isnan(_287);
    bool _339 = _335 || _337;
    bool _341 = isnan(0.0);
    bool _343 = _339 || _341;
    float _345 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _347 = int(_345);
    bool _349 = _287 > 0.0;
    float _351 = _333 + (-1.0);
    int _353 = _343 ? 0 : 1;
    float _355 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _357 = _309 > 0.0;
    float _359 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _361 = log2(_359);
    bool _363 = _309 >= 0.0;
    bool _365 = isnan(_309);
    bool _367 = _363 || _365;
    bool _369 = isnan(0.0);
    bool _371 = _367 || _369;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _375 = ~_353;
    int _377 = _375 + 1;
    int _379 = _377 + 1;
    int _381 = _371 ? 0 : 1;
    int _383 = _379;
    float _385 = _351;
    float _387 = as_type<float>(_347);
    float _389 = _327;
    if (!_349)
    {
        int _391 = ~_353;
        int _393 = _391 + 1;
        _383 = _393;
    }
    int _395 = _383;
    float _397 = 1.0 / _257;
    int _399 = ~_381;
    int _401 = _399 + 1;
    int _403 = _401 + 1;
    int _405 = _403;
    if (!_331)
    {
        _385 = _229;
    }
    float _407 = _385;
    float _409 = _407;
    if (!_357)
    {
        int _411 = ~_381;
        int _413 = _411 + 1;
        _405 = _413;
    }
    int _415 = _405;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _419 = _417 != 0;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _427 = _425 != 0;
    float _429 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _431 = int(_429);
    if (_331)
    {
        _409 = _227;
    }
    float _433 = _409;
    float _435 = float(_415);
    bool _437 = !_423;
    int _439 = _437 ? 0 : 1;
    float _441 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[83].z, _373);
    bool _443 = !_419;
    int _445 = _443 ? 0 : 1;
    float _447 = _397 * _155;
    bool _449 = !_427;
    int _451 = _449 ? 0 : 1;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _459 = _457 != 0;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _463 = _461 != 0;
    float _465 = float(_347);
    if (!_331)
    {
        _127 = _231;
    }
    float _467 = _127;
    bool _469 = !_455;
    int _471 = _469 ? 0 : 1;
    float _473 = float(_431);
    float _475 = 1.0 / _465;
    int _477 = abs(_471);
    bool _479 = !_459;
    int _481 = _479 ? 0 : 1;
    float _483 = float(_477);
    float _485 = _467;
    if (!_331)
    {
        _387 = _229;
    }
    float _487 = _387;
    float _489 = 1.0 / _473;
    float _491 = _487;
    if (_331)
    {
        _485 = _229;
    }
    float _493 = _485;
    float _495 = _483 * _435;
    if (_331)
    {
        _491 = _227;
    }
    float _497 = _491;
    int _499 = abs(_481);
    float _501 = _493 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _503 = _497 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _505 = _361 * _155;
    float _507 = fma(_501, -2.0, _269);
    float _509 = in.m_72.x;
    float _511 = in.m_72.y;
    float _513 = in.m_72.z;
    int _515 = ~as_type<int>(_327);
    int _517 = _515 + 1;
    int _519 = _517 + 1;
    float _521 = -_325;
    float _523 = fma(_503, 2.0, _521);
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _527 = _519;
    if (!_323)
    {
        int _529 = ~as_type<int>(_327);
        int _531 = _529 + 1;
        _527 = _531;
    }
    int _533 = _527;
    float _535 = exp2(_505);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _539 = 1.0 + _537;
    if (!_331)
    {
        _389 = _231;
    }
    float _541 = _389;
    float _543 = _495 * (-2.0);
    float _545 = _541;
    if (_331)
    {
        _545 = _229;
    }
    float _547 = _545;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _551 = float(_533);
    float _553 = 1.0 / _539;
    float _555 = float(_499);
    float _557 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[83].w, _525);
    float _559 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[78].z, _549);
    float _561 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _441);
    float _563 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _557);
    float _565 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _507);
    float _567 = float(_395);
    float _569 = _555 * _551;
    bool _571 = !_463;
    int _573 = _571 ? 0 : 1;
    float _575 = fma(_543, _509, _509);
    bool _577 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _579 = isnan(1.0);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _585 = _581 || _583;
    float _587 = -_535;
    float _589 = _587 + 1.0;
    int _591 = abs(_573);
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _595 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _603 = _599 || _601;
    float _605 = _569 * (-2.0);
    float _607 = float(_591);
    float _609 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].w, _593);
    float _611 = _603 ? _589 : 0.0;
    float _613 = -_155;
    float _615 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[81].x, _523);
    float _617 = fma(_605, _511, _511);
    float _619 = _607 * _567;
    float _621 = _229 + (-0.5);
    float _623 = _227 + (-0.5);
    float _625 = _619 * (-2.0);
    float _627 = _475 * _155;
    float _629 = -_155;
    float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[76].x, _279);
    float _633 = fma(_355, _605, _355);
    float _635 = _489 * _155;
    float _637 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].z, _559);
    float _639 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[77].w, _609);
    float _641 = fma(_625, _513, _513);
    float _643 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[196].y, _617);
    if (_585)
    {
        float _645 = _611 * _553;
        _157 = _645;
    }
    float _647 = _157;
    float _649 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[196].x, _575);
    float _651 = _231 + (-0.5);
    bool _653 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _655 = isnan(_225);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _665;
    float _669 = fma(_301, _625, _301);
    float _671 = fma(_307, _543, _307);
    bool _673 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _675 = isnan(_225);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[196].z, _641);
    float _687 = fma(_667, _285, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _689 = -_663;
    float _691 = _689 + 1.0;
    float _693 = fma(_633, _647, _643);
    bool _695 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _697 = isnan(_225);
    bool _699 = _695 || _697;
    bool _701 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _703 = _699 || _701;
    float _705 = float(_703);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _707;
    float _711 = -_683;
    float _713 = _711 + 1.0;
    float _715 = in.m_74.x;
    float _717 = in.m_74.y;
    float _719 = _683 * _691;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _725 = fma(_709, _285, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _727 = _705 * _713;
    float _729 = -_705;
    float _731 = _729 + 1.0;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _737 = fma(_671, _647, _649);
    float _739 = _725 * _727;
    float _741 = _687 * _727;
    float _743 = fma(_669, _647, _685);
    float _745 = fma(_723, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _747 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[143].y, _739);
    float _749 = fma(_735, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _751 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[143].x, _741);
    float _753 = _737 * 0.15915493667125701904296875;
    float _755 = _693 * 0.15915493667125701904296875;
    float _757 = fma(_749, _719, _747);
    float _759 = fma(_745, _719, _751);
    float _761 = _743 * 0.15915493667125701904296875;
    float _763 = _753 * 6.283185482025146484375;
    float _765 = cos(_763);
    float _767 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[145].y, _757);
    float _769 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[145].x, _759);
    float _771 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _773 = _767 * _717;
    float _775 = _769 * _715;
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _779 = _755 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = _773 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _785 = _775 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _787 = _783 * _771;
    float _789 = _785 * _777;
    float _791 = _755 * 6.283185482025146484375;
    float _793 = cos(_791);
    float _795 = in.m_60.x;
    float _797 = in.m_60.y;
    float _799 = in.m_60.z;
    float _801 = _753 * 6.283185482025146484375;
    float _803 = sin(_801);
    float _805 = _765 * _781;
    float _807 = _761 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _765 * _793;
    float _813 = _761 * 6.283185482025146484375;
    float _815 = sin(_813);
    float _817 = _803 * _781;
    float _819 = _803 * _793;
    float _821 = _765 * _809;
    float _823 = _803 * _809;
    float _825 = _793 * _809;
    float _827 = _781 * _809;
    float _829 = _821 * _787;
    float _831 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _833 = fma(_815, _811, _817);
    float _835 = -_805;
    float _837 = fma(_815, _819, _835);
    float _839 = -_819;
    float _841 = fma(_815, _805, _839);
    float _843 = -_787;
    float _845 = _815 * _843;
    float _847 = fma(_833, _789, _829);
    float _849 = _823 * _787;
    float _851 = fma(_815, _817, _811);
    float _853 = fma(_825, _789, _845);
    float _855 = fma(_841, _831, _847);
    float _857 = fma(_837, _789, _849);
    float _859 = _797 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _861 = fma(_827, _831, _853);
    float _863 = _797 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _865 = _855 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _867 = _855 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _869 = fma(_851, _831, _857);
    float _871 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[4].x, _863);
    float _873 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[6].x, _859);
    float _875 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[24].x, _865);
    float _877 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[26].x, _867);
    float _879 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[4].z, _871);
    float _881 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[6].z, _873);
    float _883 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[24].z, _875);
    float _885 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[26].z, _877);
    float _887 = _879 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _889 = _881 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _891 = _883 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _893 = _885 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _895 = _797 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _897 = _855 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _899 = _887 + _891;
    float _901 = _889 + _893;
    float _903 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[5].x, _895);
    float _905 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[25].x, _897);
    float _907 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _909 = _899 + _907;
    float _911 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _913 = _901 + _911;
    float _915 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[5].z, _903);
    float _917 = fma(_869, (*spvDescriptorSet0.vp_c8)._m0[25].z, _905);
    float _919 = _909 * _909;
    float _921 = _913 * _913;
    float _923 = _915 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _925 = _917 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _927 = _919 + _921;
    float _929 = _923 + _925;
    float _931 = sqrt(_927);
    bool _933 = _931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _935 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _937 = _931 + _935;
    float _939 = 0.0;
    float _941 = _915;
    float _943 = _897;
    float _945 = _799;
    float _947 = _901;
    float _949 = _929;
    float _951 = _919;
    if (_933)
    {
        float _953 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _939 = _953;
    }
    float _955 = _939;
    if (_933)
    {
        float _957 = _929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _941 = _957;
    }
    float _959 = _941;
    float _961 = _959;
    if (!_933)
    {
        _943 = _899;
    }
    float _963 = _943;
    float _965 = _963;
    if (_933)
    {
        float _967 = rsqrt(_927);
        _945 = _967;
    }
    float _969 = _945;
    float _971 = _955;
    if (_933)
    {
        float _973 = _937 * _955;
        _971 = _973;
    }
    float _975 = _971;
    float _977 = _975;
    if (_933)
    {
        float _979 = _975 * 0.15915493667125701904296875;
        _977 = _979;
    }
    float _981 = _977;
    float _983 = _795;
    if (_933)
    {
        float _985 = _981 * 6.283185482025146484375;
        float _987 = sin(_985);
        _983 = _987;
    }
    float _989 = _983;
    if (_933)
    {
        float _991 = fma(_989, _959, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _961 = _991;
    }
    float _993 = _961;
    float _995 = _993;
    if (_933)
    {
        float _997 = _969 * _993;
        _995 = _997;
    }
    float _999 = _995;
    if (_933)
    {
        float _1001 = fma(_909, _999, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _965 = _1001;
    }
    float _1003 = _965;
    if (_933)
    {
        float _1005 = fma(_913, _999, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _947 = _1005;
    }
    float _1007 = _947;
    float _1009 = fma(_1003, 6.2500002968590706586837768554688e-05, 0.5);
    float _1011 = fma(_1007, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5472 = float2(_1009, _1011);
    float3 _1015 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5472, float2(0.0), isnan(_5472)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5472, float2(0.0), isnan(_5472)), level(0.0)).xyz;
    float _1017 = _1015.x;
    float _1019 = _1015.y;
    float _1021 = _1015.z;
    float _1023 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1025 = int(_1023);
    float _1027 = 0.0;
    if (_247)
    {
        _1027 = 1.0;
    }
    float _1029 = _1027;
    float _1031 = 0.0;
    float _1033 = _1029;
    if (_247)
    {
        float _1035 = in.m_70.x;
        _1031 = _1035;
    }
    float _1037 = _1031;
    if (!_247)
    {
        _1033 = 7.345489978790283203125;
    }
    float _1039 = _1033;
    float _1041 = -_639;
    float _1043 = _1041 + 1.0;
    float _1045 = _1037;
    if (!_247)
    {
        float _1047 = in.m_70.y;
        _1045 = _1047;
    }
    float _1049 = _1045;
    float _1051 = -_561;
    float _1053 = _1051 + 1.0;
    float _1055 = trunc(_627);
    int _1057 = int(_1055);
    float _1059 = -_637;
    float _1061 = _1059 + 1.0;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1065 = -_563;
    float _1067 = _1065 + 1.0;
    float _1069 = float(uint(_1025));
    float _1071 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1073 = int(_1071);
    float _1075 = _1039 * _227;
    float _1077 = float(_1025);
    bool _1079 = _1025 == 0;
    float _1081 = float(uint(_1057));
    float _1083 = 1.0 / _1069;
    float _1085 = float(_1057);
    float _1087 = float(uint(_1073));
    float _1089 = trunc(_635);
    int _1091 = int(_1089);
    int _1093 = ~_1025;
    int _1095 = _1093 + 1;
    int _1097 = ~_1073;
    int _1099 = _1097 + 1;
    bool _1101 = _1073 == 0;
    int _1103 = as_type<int>(_1083) + (-2);
    float _1105 = 1.0 / _1087;
    float _1107 = as_type<float>(_1103) * _1081;
    float _1109 = float(uint(_1091));
    float _1111 = floor(_1075);
    float _1113 = trunc(_1107);
    float _1115 = precise::max(_1113, 0.0);
    uint _1118 = uint(_1115);
    int _1120 = _1095 * int(_1118);
    int _1122 = _1120 + _1057;
    float _1124 = float(uint(_1122));
    int _1126 = as_type<int>(_1105) + (-2);
    float _1128 = as_type<float>(_1103) * _1124;
    float _1130 = as_type<float>(_1126) * _1109;
    bool _1132 = _1085 >= _1077;
    bool _1134 = isnan(_1085);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(_1077);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = -_1111;
    float _1146 = _1075 + _1144;
    float _1148 = trunc(_1128);
    float _1150 = precise::max(_1148, 0.0);
    uint _1152 = uint(_1150);
    int _1154 = ~_1025;
    int _1156 = _1154 + 1;
    float _1158 = trunc(_1130);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    int _1164 = int(_1118) + int(_1152);
    float _1166 = trunc(_1142);
    int _1168 = int(_1166);
    float _1170 = _1146 * _1077;
    float _1172 = _1146;
    float _1174 = _1061;
    if (_247)
    {
        _1172 = 1.0;
    }
    float _1176 = _1172;
    float _1178 = _1176;
    if (!_247)
    {
        _1178 = 1.2345600128173828125;
    }
    float _1180 = _1178;
    int _1182 = _1156 * _1164;
    int _1184 = _1182 + _1057;
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1188 = _1186 != 0;
    int _1190 = _1099 * int(_1162);
    int _1192 = _1190 + _1091;
    float _1194 = trunc(_1170);
    int _1196 = int(_1194);
    float _1198 = _1049 * _1180;
    bool _1200 = uint(_1184) >= uint(_1025);
    float _1202 = float(uint(_1192));
    bool _1204 = !_1200;
    int _1206 = _1204 ? 0 : (-1);
    float _1208 = as_type<float>(_1126) * _1202;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1212 = _1210 != 0;
    int _1214 = ~_1164;
    int _1216 = _1214 + _1206;
    int _1218 = _1216 + 1;
    float _1220 = trunc(_1208);
    float _1222 = precise::max(_1220, 0.0);
    uint _1224 = uint(_1222);
    bool _1226 = !_1212;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = _1077 * _447;
    int _1232 = ~_1073;
    int _1234 = _1232 + 1;
    int _1236 = abs(_1228);
    int _1238 = _1025 * _1218;
    int _1240 = _1238 + _1057;
    float _1242 = trunc(_1230);
    int _1244 = int(_1242);
    int _1246 = ~_1168;
    int _1248 = _1246 + 1;
    int _1250 = _1248 + 1;
    bool _1252 = !_1079;
    int _1254 = _1252 ? _1240 : (-1);
    int _1256 = _1196 * _1236;
    int _1258 = _1256 + _1057;
    int _1260 = _1025 + (-1);
    int _1262 = int(_1162) + int(_1224);
    int _1264 = _1254 * _1250;
    int _1266 = abs(_439);
    int _1268 = _1168 * _1260;
    int _1270 = _1268 + _1264;
    float _1272 = floor(_1198);
    float _1274 = float(_1073);
    int _1276 = _1234 * _1262;
    int _1278 = _1276 + _1091;
    float _1280 = float(_1091);
    int _1282 = abs(_445);
    bool _1284 = _1280 >= _1274;
    bool _1286 = isnan(_1280);
    bool _1288 = _1284 || _1286;
    bool _1290 = isnan(_1274);
    bool _1292 = _1288 || _1290;
    float _1294 = float(_1292);
    bool _1296 = uint(_1278) >= uint(_1073);
    int _1298 = _1270 * _1266;
    int _1300 = abs(_451);
    float _1302 = trunc(_1294);
    int _1304 = int(_1302);
    bool _1306 = !_1296;
    int _1308 = _1306 ? 0 : (-1);
    float _1310 = -_1272;
    float _1312 = _1198 + _1310;
    int _1314 = _1244 * _1282;
    int _1316 = _1314 + _1298;
    int _1318 = ~_1262;
    int _1320 = _1318 + _1308;
    int _1322 = _1320 + 1;
    float _1324 = _1312 * _1274;
    bool _1326 = !_1188;
    int _1328 = _1326 ? 0 : 1;
    int _1330 = _1258 * _1300;
    int _1332 = _1330 + _1316;
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1336 = _1334 != 0;
    int _1338 = _1073 * _1322;
    int _1340 = _1338 + _1091;
    int _1342 = abs(_1328);
    float _1344 = trunc(_1324);
    int _1346 = int(_1344);
    bool _1348 = !_1336;
    int _1350 = _1348 ? 0 : 1;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1354 = _1352 != 0;
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1366 = _1364 != 0;
    float _1368 = _1274 * _447;
    int _1370 = ~_1304;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = _1196 * _1342;
    int _1378 = _1376 + _1332;
    bool _1380 = !_1101;
    int _1382 = _1380 ? _1340 : (-1);
    float _1384 = trunc(_1368);
    int _1386 = int(_1384);
    bool _1388 = !_1358;
    int _1390 = _1388 ? 0 : 1;
    int _1392 = abs(_1350);
    int _1394 = _1382 * _1374;
    int _1396 = _1073 + (-1);
    int _1398 = abs(_1390);
    float _1400 = float(uint(_1378));
    int _1402 = _1304 * _1396;
    int _1404 = _1402 + _1394;
    bool _1406 = !_1354;
    int _1408 = _1406 ? 0 : 1;
    float _1410 = as_type<float>(_1103) * _1400;
    int _1412 = _1346 * _1392;
    int _1414 = _1412 + _1091;
    int _1416 = abs(_1408);
    bool _1418 = !_1362;
    int _1420 = _1418 ? 0 : 1;
    int _1422 = _1404 * _1398;
    float _1424 = trunc(_1410);
    float _1426 = precise::max(_1424, 0.0);
    uint _1428 = uint(_1426);
    int _1430 = ~_1025;
    int _1432 = _1430 + 1;
    float _1434 = float(uint(_1258));
    int _1436 = _1386 * _1416;
    int _1438 = _1436 + _1422;
    int _1440 = abs(_1420);
    float _1442 = as_type<float>(_1103) * _1434;
    float _1444 = float(uint(_1414));
    bool _1446 = !_1366;
    int _1448 = _1446 ? 0 : 1;
    float _1450 = as_type<float>(_1126) * _1444;
    int _1452 = abs(_1448);
    int _1454 = _1414 * _1440;
    int _1456 = _1454 + _1438;
    float _1458 = trunc(_1442);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    int _1464 = _1432 * int(_1428);
    int _1466 = _1464 + _1378;
    int _1468 = _1346 * _1452;
    int _1470 = _1468 + _1456;
    float _1472 = float(uint(_1466));
    float _1474 = float(uint(_1470));
    float _1476 = trunc(_1450);
    float _1478 = precise::max(_1476, 0.0);
    uint _1480 = uint(_1478);
    int _1482 = ~_1025;
    int _1484 = _1482 + 1;
    float _1486 = as_type<float>(_1103) * _1472;
    int _1488 = ~_1073;
    int _1490 = _1488 + 1;
    float _1492 = as_type<float>(_1126) * _1474;
    int _1494 = _1484 * int(_1462);
    int _1496 = _1494 + _1258;
    float _1498 = trunc(_1486);
    float _1500 = precise::max(_1498, 0.0);
    uint _1502 = uint(_1500);
    int _1504 = ~_1025;
    int _1506 = _1504 + 1;
    float _1508 = float(uint(_1496));
    float _1510 = trunc(_1492);
    float _1512 = precise::max(_1510, 0.0);
    uint _1514 = uint(_1512);
    int _1516 = _1490 * int(_1480);
    int _1518 = _1516 + _1414;
    int _1520 = ~_1073;
    int _1522 = _1520 + 1;
    float _1524 = as_type<float>(_1103) * _1508;
    float _1526 = float(uint(_1518));
    int _1528 = int(_1428) + int(_1502);
    float _1530 = trunc(_1524);
    float _1532 = precise::max(_1530, 0.0);
    uint _1534 = uint(_1532);
    float _1536 = as_type<float>(_1126) * _1526;
    int _1538 = _1522 * int(_1514);
    int _1540 = _1538 + _1470;
    float _1542 = trunc(_1536);
    float _1544 = precise::max(_1542, 0.0);
    uint _1546 = uint(_1544);
    float _1548 = float(uint(_1540));
    int _1550 = _1506 * _1528;
    int _1552 = _1550 + _1378;
    int _1554 = int(_1462) + int(_1534);
    float _1556 = as_type<float>(_1126) * _1548;
    bool _1558 = uint(_1552) >= uint(_1025);
    bool _1560 = !_1558;
    int _1562 = _1560 ? 0 : (-1);
    float _1564 = trunc(_1556);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = int(_1480) + int(_1546);
    int _1572 = ~_1528;
    int _1574 = _1572 + _1562;
    int _1576 = _1574 + 1;
    int _1578 = _1025 * _1576;
    int _1580 = _1578 + _1378;
    int _1582 = ~_1025;
    int _1584 = _1582 + 1;
    int _1586 = ~_1073;
    int _1588 = _1586 + 1;
    bool _1590 = !_1079;
    int _1592 = _1590 ? _1580 : (-1);
    int _1594 = _1584 * _1554;
    int _1596 = _1594 + _1258;
    int _1598 = int(_1514) + int(_1568);
    int _1600 = _1592 & 3;
    bool _1602 = _1600 != 0;
    int _1604 = _1592 & 3;
    bool _1606 = _1604 != 0;
    int _1608 = _1588 * _1598;
    int _1610 = _1608 + _1470;
    bool _1612 = uint(_1600) >= 2u;
    int _1614 = _1606 ? 0 : 1;
    bool _1616 = uint(_1596) >= uint(_1025);
    int _1618 = _1612 ? 0 : 1;
    bool _1620 = uint(_1610) >= uint(_1073);
    bool _1622 = !_1616;
    int _1624 = _1622 ? 0 : (-1);
    bool _1626 = !_1620;
    int _1628 = _1626 ? 0 : (-1);
    bool _1630 = uint(_1600) > 1u;
    int _1632 = ~_1554;
    int _1634 = _1632 + _1624;
    int _1636 = _1634 + 1;
    int _1638 = ~_1598;
    int _1640 = _1638 + _1628;
    int _1642 = _1640 + 1;
    int _1644 = ~_1073;
    int _1646 = _1644 + 1;
    int _1648 = _1025 * _1636;
    int _1650 = _1648 + _1258;
    bool _1652 = _1600 != 3;
    int _1654 = _1073 * _1642;
    int _1656 = _1654 + _1470;
    int _1658 = ~_1614;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    int _1664 = _1646 * _1570;
    int _1666 = _1664 + _1414;
    bool _1668 = !_1079;
    int _1670 = _1668 ? _1650 : (-1);
    int _1672 = _1662;
    if (!_1630)
    {
        int _1674 = ~_1614;
        int _1676 = _1674 + 1;
        _1672 = _1676;
    }
    int _1678 = _1672;
    bool _1680 = !_1101;
    int _1682 = _1680 ? _1656 : (-1);
    bool _1684 = _233 > 0.5;
    bool _1686 = uint(_1666) >= uint(_1073);
    int _1688 = ~_1618;
    int _1690 = _1688 + 1;
    int _1692 = _1690 + 1;
    int _1694 = _1592 >> 31;
    int _1696 = _1692;
    if (_1652)
    {
        int _1698 = ~_1618;
        int _1700 = _1698 + 1;
        _1696 = _1700;
    }
    int _1702 = _1696;
    int _1704 = _1682 >> 31;
    float _1706 = -_195;
    int _1708 = _1684 ? as_type<int>(_1706) : as_type<int>(_195);
    bool _1710 = !_1602;
    int _1712 = _1710 ? 0 : 1;
    bool _1714 = !_1686;
    int _1716 = _1714 ? 0 : (-1);
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1720 = _1718 != 0;
    int _1722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1724 = _1722 != 0;
    int _1726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1728 = _1726 != 0;
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1732 = _1730 != 0;
    int _1734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1736 = _1734 != 0;
    int _1738 = _1694 & 3;
    int _1740 = _1704 & 3;
    int _1742 = _1592 + _1738;
    int _1744 = _1682 + _1740;
    bool _1746 = !_1720;
    int _1748 = _1746 ? 0 : 1;
    int _1750 = _1682 & 3;
    bool _1752 = _1750 != 0;
    int _1754 = _1742 >> 2;
    bool _1756 = !_1728;
    int _1758 = _1756 ? 0 : 1;
    int _1760 = _1744 >> 2;
    int _1762 = _1682 & 3;
    bool _1764 = _1762 != 0;
    bool _1766 = !_1752;
    int _1768 = _1766 ? 0 : 1;
    bool _1770 = uint(_1750) > 1u;
    int _1772 = _1754 << 4;
    int _1774 = _1772 + 368;
    int _1776 = _1760 << 4;
    int _1778 = _1776 + 512;
    int _1780 = _1764 ? 0 : 1;
    bool _1782 = _1600 != 3;
    uint _1784 = uint(int(uint(_1778) >> uint(2)));
    uint _1786 = uint(int(uint(int(_1784)) >> uint(2)));
    int _1788 = int(_1784) & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    int _1792 = int(_1784) + 1;
    uint _1794 = uint(int(uint(_1792) >> uint(2)));
    int _1796 = _1792 & 3;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[int(_1794)][_1796];
    int _1800 = ~_1780;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    int _1806 = ~_1570;
    int _1808 = _1806 + _1716;
    int _1810 = _1808 + 1;
    int _1812 = _1804;
    if (!_1770)
    {
        int _1814 = ~_1780;
        int _1816 = _1814 + 1;
        _1812 = _1816;
    }
    int _1818 = _1812;
    bool _1820 = !_1782;
    int _1822 = _1820 ? 0 : (-1);
    uint _1824 = uint(int(uint(_1774) >> uint(2)));
    uint _1826 = uint(int(uint(int(_1824)) >> uint(2)));
    int _1828 = int(_1824) & 3;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[int(_1826)][_1828];
    int _1832 = int(_1824) + 1;
    uint _1834 = uint(int(uint(_1832) >> uint(2)));
    int _1836 = _1832 & 3;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[int(_1834)][_1836];
    bool _1840 = _1750 != 3;
    int _1842 = _1073 * _1810;
    int _1844 = _1842 + _1414;
    bool _1846 = uint(_1750) >= 2u;
    int _1848 = _1846 ? 0 : 1;
    int _1850 = _1778 + 8;
    uint _1852 = uint(int(uint(_1850) >> uint(2)));
    uint _1854 = uint(int(uint(int(_1852)) >> uint(2)));
    int _1856 = int(_1852) & 3;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[int(_1854)][_1856];
    int _1860 = int(_1852) + 1;
    uint _1862 = uint(int(uint(_1860) >> uint(2)));
    int _1864 = _1860 & 3;
    float _1866 = (*spvDescriptorSet0.vp_c9)._m0[int(_1862)][_1864];
    bool _1868 = _1750 != 3;
    int _1870 = ~_1848;
    int _1872 = _1870 + 1;
    int _1874 = _1872 + 1;
    bool _1876 = !_1101;
    int _1878 = _1876 ? _1844 : (-1);
    int _1880 = _1874;
    if (_1840)
    {
        int _1882 = ~_1848;
        int _1884 = _1882 + 1;
        _1880 = _1884;
    }
    int _1886 = _1880;
    int _1888 = _1774 + 8;
    uint _1890 = uint(int(uint(_1888) >> uint(2)));
    uint _1892 = uint(int(uint(int(_1890)) >> uint(2)));
    int _1894 = int(_1890) & 3;
    float _1896 = (*spvDescriptorSet0.vp_c9)._m0[int(_1892)][_1894];
    int _1898 = int(_1890) + 1;
    uint _1900 = uint(int(uint(_1898) >> uint(2)));
    int _1902 = _1898 & 3;
    float _1904 = (*spvDescriptorSet0.vp_c9)._m0[int(_1900)][_1902];
    int _1906 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1908 = _1906 != 0;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1914 = abs(_1818);
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1918 = _1910 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1920 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1922 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1924 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1926 = abs(_1678);
    int _1928 = abs(_1712);
    out.m_76.x = _1918;
    out.m_76.y = _1922;
    out.m_76.z = _1924;
    out.m_76.w = _1920;
    bool _1930 = !_1868;
    int _1932 = _1930 ? 0 : (-1);
    bool _1934 = _227 > 0.5;
    bool _1936 = _229 > 0.5;
    int _1938 = ~_1926;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1946 = -_191;
    int _1948 = _1934 ? as_type<int>(_1946) : as_type<int>(_191);
    float _1950 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1952 = int(_1950);
    int _1954 = _1942 * as_type<int>(_1838);
    float _1956 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1958 = abs(_1768);
    float _1960 = _841 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1962 = ~_1914;
    int _1964 = _1962 + 1;
    int _1966 = _1964 + 1;
    bool _1968 = _231 > 0.5;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1972 = ~_1928;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    int _1978 = _1966 * as_type<int>(_1798);
    int _1980 = ~_1958;
    int _1982 = _1980 + 1;
    int _1984 = _1982 + 1;
    float _1986 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1988 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1990 = _1976 * as_type<int>(_1830);
    int _1992 = _1990 + _1954;
    int _1994 = abs(_1702);
    int _1996 = _1984 * as_type<int>(_1790);
    int _1998 = _1996 + _1978;
    int _2000 = abs(_1886);
    float _2002 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2004 = int(_2002);
    out.m_78.x = _1956;
    out.m_78.y = _1986;
    out.m_78.z = _1988;
    int _2006 = abs(_1822);
    float _2008 = _821 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2010 = abs(_1932);
    float _2012 = _833 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2014 = ~_1994;
    int _2016 = _2014 + 1;
    int _2018 = _2016 + 1;
    float _2020 = as_type<float>(_1886);
    if (_933)
    {
        float _2022 = _981 * 6.283185482025146484375;
        float _2024 = cos(_2022);
        _2020 = _2024;
    }
    float _2026 = _2020;
    bool _2028 = !_1724;
    float _2030 = _2028 ? _195 : as_type<float>(_1708);
    float _2032 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2012);
    bool _2034 = !_1908;
    float _2036 = _2034 ? _191 : as_type<float>(_1948);
    int _2038 = _2018 * as_type<int>(_1896);
    int _2040 = _2038 + _1992;
    int _2042 = ~_2000;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    float _2048 = float(uint(_1952));
    float _2050 = _841 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2052 = _2046 * as_type<int>(_1858);
    int _2054 = _2052 + _1998;
    int _2056 = ~_2010;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    int _2062 = ~_2006;
    int _2064 = _2062 + 1;
    int _2066 = _2064 + 1;
    float _2068 = 1.0 / _2048;
    int _2070 = abs(_1748);
    int _2072 = _2060 * as_type<int>(_1866);
    int _2074 = _2072 + _2054;
    int _2076 = abs(_1952);
    int _2078 = _2066 * as_type<int>(_1904);
    int _2080 = _2078 + _2040;
    int _2082 = abs(_1758);
    float _2084 = -_815;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2008);
    int _2088 = ~_2070;
    int _2090 = _2088 + 1;
    int _2092 = _2090 + 1;
    float _2094 = float(uint(_2004));
    int _2096 = abs(_2004);
    int _2098 = _2080 * _2092;
    float _2100 = 1.0 / _2094;
    int _2102 = ~_2082;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    int _2108 = _1670 * _2070;
    int _2110 = _2108 + _2098;
    float _2112 = float(uint(_2096));
    float _2114 = _821 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2116 = float(uint(_2076));
    int _2118 = _2074 * _2106;
    int _2120 = ~_1952;
    int _2122 = _2120 + 1;
    float _2124 = _833 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2126 = _821 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2128 = 1.0 / _2112;
    int _2130 = _1878 * _2082;
    int _2132 = _2130 + _2118;
    int _2134 = as_type<int>(_2068) + (-2);
    float _2136 = -_815;
    float _2138 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2126);
    float _2140 = float(uint(_2110));
    float _2142 = -_815;
    float _2144 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2114);
    int _2146 = as_type<int>(_2100) + (-2);
    float _2148 = _833 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2150 = 1.0 / _2116;
    float _2152 = as_type<float>(_2134) * _2140;
    float _2154 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2138);
    int _2156 = abs(_2132);
    float _2158 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2144);
    int _2160 = abs(_2110);
    float _2162 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2148);
    float _2164 = trunc(_2152);
    float _2166 = precise::max(_2164, 0.0);
    uint _2168 = uint(_2166);
    float _2170 = float(uint(_2132));
    float _2172 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2124);
    int _2174 = as_type<int>(_2128) + (-2);
    float _2176 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1960);
    float _2178 = as_type<float>(_2146) * _2170;
    float _2180 = float(uint(_2160));
    float _2182 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2086);
    int _2184 = as_type<int>(_2150) + (-2);
    float _2186 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2162);
    float _2188 = float(uint(_2156));
    float _2190 = trunc(_2178);
    float _2192 = precise::max(_2190, 0.0);
    uint _2194 = uint(_2192);
    int _2196 = ~_2096;
    int _2198 = _2196 + 1;
    float _2200 = as_type<float>(_2184) * _2180;
    float _2202 = _841 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2204 = as_type<float>(_2174) * _2188;
    float _2206 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2050);
    int _2208 = _2122 * int(_2168);
    int _2210 = _2208 + _2110;
    float _2212 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2202);
    float _2214 = trunc(_2200);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    float _2220 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2206);
    float _2222 = _2202;
    float _2224 = as_type<float>(_2198);
    float _2226 = _2032;
    if (_933)
    {
        float _2228 = _2026 + (-1.0);
        _2222 = _2228;
    }
    float _2230 = _2222;
    float _2232 = float(uint(_2210));
    float _2234 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2212);
    float _2236 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2176);
    int _2238 = ~_2076;
    int _2240 = _2238 + 1;
    float _2242 = _2230;
    if (_933)
    {
        float _2244 = _2230 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2242 = _2244;
    }
    float _2246 = _2242;
    float _2248 = trunc(_2204);
    float _2250 = precise::max(_2248, 0.0);
    uint _2252 = uint(_2250);
    int _2254 = ~_2004;
    int _2256 = _2254 + 1;
    float _2258 = as_type<float>(_2134) * _2232;
    if (_933)
    {
        float _2260 = fma(_929, _2026, _2246);
        _949 = _2260;
    }
    float _2262 = _949;
    float _2264 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2266 = _2256 * int(_2194);
    int _2268 = _2266 + _2132;
    bool _2270 = _2004 == 0;
    int _2272 = _2240 * int(_2218);
    int _2274 = _2272 + _2160;
    float _2276 = trunc(_2258);
    float _2278 = precise::max(_2276, 0.0);
    uint _2280 = uint(_2278);
    float _2282 = float(uint(_2268));
    float _2284 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2286 = float(uint(_2274));
    float _2288 = -_195;
    int _2290 = _1936 ? as_type<int>(_2288) : as_type<int>(_195);
    int _2292 = _2198 * int(_2252);
    int _2294 = _2292 + _2156;
    if (_933)
    {
        float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2298 = _1003 + _2296;
        _2224 = _2298;
    }
    float _2300 = _2224;
    float _2302 = _2284 * _2158;
    bool _2304 = !_1732;
    float _2306 = _2304 ? _195 : as_type<float>(_2290);
    float _2308 = float(uint(_2294));
    float _2310 = as_type<float>(_2146) * _2282;
    float _2312 = _2302;
    if (_933)
    {
        float _2314 = _2300 * _2300;
        _951 = _2314;
    }
    float _2316 = _951;
    float _2318 = -_191;
    int _2320 = _1968 ? as_type<int>(_2318) : as_type<int>(_191);
    float _2322 = as_type<float>(_2184) * _2286;
    float _2324 = as_type<float>(_2174) * _2308;
    float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2328 = _2262 + _2326;
    float _2330 = trunc(_2310);
    float _2332 = precise::max(_2330, 0.0);
    uint _2334 = uint(_2332);
    bool _2336 = !_1736;
    float _2338 = _2336 ? _191 : as_type<float>(_2320);
    float _2340 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2032);
    float _2342 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2172);
    if (!_933)
    {
        _2226 = _921;
    }
    float _2344 = _2226;
    float _2346 = _2284 * _2154;
    float _2348 = fma(_2264, _2340, _2302);
    float _2350 = _2344;
    if (_933)
    {
        float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2354 = _1007 + _2352;
        _2312 = _2354;
    }
    float _2356 = _2312;
    float _2358 = trunc(_2322);
    float _2360 = precise::max(_2358, 0.0);
    uint _2362 = uint(_2360);
    float _2364 = _2284 * _2182;
    float _2366 = fma(_2264, _2186, _2346);
    if (_933)
    {
        float _2368 = _2356 * _2356;
        _2350 = _2368;
    }
    float _2370 = _2350;
    bool _2372 = _2004 == 0;
    float _2374 = fma(_2264, _2342, _2364);
    out.m_80.x = _2340;
    out.m_80.y = _2186;
    out.m_80.z = _2342;
    float _2376 = trunc(_2324);
    float _2378 = precise::max(_2376, 0.0);
    uint _2380 = uint(_2378);
    float _2382 = fma(_2328, _2328, _2316);
    int _2384 = int(_2168) + int(_2280);
    int _2386 = ~_2076;
    int _2388 = _2386 + 1;
    int _2390 = int(_2194) + int(_2334);
    int _2392 = int(_2218) + int(_2362);
    float _2394 = _2382 + _2370;
    int _2396 = ~_2004;
    int _2398 = _2396 + 1;
    int _2400 = ~_1952;
    int _2402 = _2400 + 1;
    int _2404 = _2398 * _2390;
    int _2406 = _2404 + _2132;
    int _2408 = int(_2252) + int(_2380);
    int _2410 = _2388 * _2392;
    int _2412 = _2410 + _2160;
    int _2414 = ~_2096;
    int _2416 = _2414 + 1;
    int _2418 = _2402 * _2384;
    int _2420 = _2418 + _2110;
    bool _2422 = uint(_2406) >= uint(_2004);
    float _2424 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2426 = uint(_2412) >= uint(_2076);
    int _2428 = _2416 * _2408;
    int _2430 = _2428 + _2156;
    bool _2432 = uint(_2420) >= uint(_1952);
    bool _2434 = !_2422;
    int _2436 = _2434 ? 0 : (-1);
    bool _2438 = !_2432;
    int _2440 = _2438 ? 0 : (-1);
    float _2442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2444 = uint(_2430) >= uint(_2096);
    int _2446 = _2110 ^ _1952;
    int _2448 = ~_2390;
    int _2450 = _2448 + _2436;
    int _2452 = _2450 + 1;
    int _2454 = ~_2384;
    int _2456 = _2454 + _2440;
    int _2458 = _2456 + 1;
    float _2460 = _2424 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2462 = !_2426;
    int _2464 = _2462 ? 0 : (-1);
    float _2466 = sqrt(_2394);
    uint _2468 = uint(int(uint(_2446) >> uint(31)));
    int _2470 = _1952 * _2458;
    int _2472 = _2470 + _2110;
    int _2474 = _2132 ^ _2004;
    int _2476 = _2004 * _2452;
    int _2478 = _2476 + _2132;
    bool _2480 = _1952 == 0;
    float _2482 = _2442 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2484 = _1952 == 0;
    int _2486 = ~_2464;
    int _2488 = _2392 + _2486;
    int _2490 = _2488 + 1;
    float _2492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2494 = ~int(_2468);
    int _2496 = _2494 + 1;
    bool _2498 = !_2444;
    float _2500 = _2498 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    uint _2502 = uint(int(uint(_2474) >> uint(31)));
    int _2504 = _2490 ^ _2496;
    float _2506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2508 = !_2480;
    int _2510 = _2508 ? _2472 : (-1);
    int _2512 = ~as_type<int>(_2500);
    int _2514 = _2408 + _2512;
    int _2516 = _2514 + 1;
    int _2518 = ~int(_2502);
    int _2520 = _2518 + 1;
    int _2522 = ~_2496;
    int _2524 = _2522 + _2504;
    int _2526 = _2524 + 1;
    float _2528 = fma(_2284, _2284, 1.0);
    float _2530 = float(_2510);
    int _2532 = _2516 ^ _2520;
    bool _2534 = !_2270;
    int _2536 = _2534 ? _2478 : (-1);
    float _2538 = fma(_2460, _2530, _631);
    float _2540 = rsqrt(_2528);
    int _2542 = ~_2520;
    int _2544 = _2542 + _2532;
    int _2546 = _2544 + 1;
    float _2548 = _2492 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2550 = !_2484;
    int _2552 = _2550 ? _2526 : (-1);
    float _2554 = _2506 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2556 = float(_2536);
    float _2558 = _2036 + 0.5;
    float _2560 = float(_2552);
    out.m_82.x = _1017;
    out.m_82.y = _1019;
    out.m_82.z = _1021;
    bool _2562 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2564 = isnan(_2466);
    bool _2566 = _2562 || _2564;
    bool _2568 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2570 = _2566 || _2568;
    float _2572 = fma(_2548, _2556, _615);
    bool _2574 = !_2372;
    int _2576 = _2574 ? _2546 : (-1);
    float _2578 = -_329;
    float _2580 = fma(_2482, _2560, _2578);
    float _2582 = _2338 + 0.5;
    float _2584 = fma(_2460, _2558, _2538);
    float _2586 = float(_2576);
    float _2588 = _2306 + (-0.5);
    float _2590 = fma(_2548, _2582, _2572);
    float _2592 = _2284 * _2540;
    float _2594 = -_1061;
    float _2596 = fma(_2036, _2594, _2584);
    float _2598 = -_565;
    float _2600 = fma(_2554, _2586, _2598);
    float _2602 = _2030 + (-0.5);
    float _2604 = -_2482;
    float _2606 = fma(_2604, _2588, _2580);
    float _2608 = -_2220;
    float _2610 = _2592 * _2608;
    float _2612 = -_2234;
    float _2614 = _2592 * _2612;
    float _2616 = -_2236;
    float _2618 = _2592 * _2616;
    float _2620 = -_2554;
    float _2622 = fma(_2620, _2602, _2600);
    float _2624 = fma(_2540, _2158, _2610);
    float _2626 = fma(_2540, _2154, _2614);
    float _2628 = -_1053;
    float _2630 = fma(_2338, _2628, _2590);
    float _2632 = fma(_2306, _1043, _2606);
    float _2634 = fma(_2540, _2182, _2618);
    float _2636 = _2220 + _2348;
    float _2638 = fma(_2030, _1067, _2622);
    float _2640 = _2234 + _2366;
    float _2642 = _2236 + _2374;
    out.m_84.x = _2624;
    out.m_84.y = _2626;
    out.m_84.z = _2634;
    float _2644 = as_type<float>(_2384);
    float _2646 = _2370;
    float _2648 = _2500;
    float _2650 = _2618;
    if (!_2570)
    {
        _1174 = 1.0;
    }
    float _2652 = _1174;
    out.m_86.x = _2596;
    out.m_86.y = _2632;
    out.m_86.z = _2630;
    out.m_86.w = _2638;
    out.m_88.x = _2636;
    out.m_88.y = _2640;
    out.m_88.z = _2642;
    bool _2654 = !_2570;
    float _2656 = _2652;
    if (!_2654)
    {
        bool _2658 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2660 = isnan(_2466);
        bool _2662 = _2658 || _2660;
        bool _2664 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2666 = _2662 || _2664;
        if (!_2666)
        {
            float _2668 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2670 = _2466 + _2668;
            float _2672 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2674 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2672;
            float _2676 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2678 = _2676 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2680 = 1.0 / _2674;
            float _2682 = _2670 * _2680;
            float _2684 = fma(_2682, _2678, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2656 = _2684;
            _2686 = true;
        }
        else
        {
            bool _2688 = _2466 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2690 = isnan(_2466);
            bool _2692 = _2688 || _2690;
            bool _2694 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2696 = _2692 || _2694;
            if (!_2696)
            {
                float _2698 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2700 = _2466 + _2698;
                float _2702 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2704 = _2702 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2706 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2708 = _2706 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2710 = 1.0 / _2704;
                float _2712 = _2700 * _2710;
                float _2714 = fma(_2712, _2708, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2656 = _2714;
                _2686 = true;
            }
            else
            {
                _2656 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2686 = false;
    float _2716 = _2656;
    float _2718 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2720 = _2262 + _2718;
    float _2722 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2724 = _1003 + _2722;
    float _2726 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2728 = _1007 + _2726;
    float _2730 = fma(_2720, _2716, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2732 = fma(_2724, _2716, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2734 = fma(_2728, _2716, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2736 = _923 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2740 = _2730 + _2738;
    float _2742 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2744 = _2732 + _2742;
    float _2746 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2748 = _2734 + _2746;
    float _2750 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2736);
    float _2752 = _2740 * _2740;
    float _2754 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2750);
    float _2756 = fma(_2744, _2744, _2752);
    float _2758 = _923 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2760 = _2754 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2762 = fma(_2748, _2748, _2756);
    float _2764 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2758);
    float _2766 = 1.0 / _2760;
    float _2768 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2770 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2764);
    float _2772 = _2770 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2774 = rsqrt(_2762);
    float _2776 = _2772 + _2760;
    float _2778 = _2776 * _2766;
    float _2780 = _2778 * 0.5;
    float _2782 = floor(_2768);
    float _2784 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2786 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2784);
    float _2788 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2790 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2792 = _923 + _2788;
    float _2794 = 1.0 / _2786;
    float _2796 = _2744 * _2790;
    float _2798 = _2748 * _2790;
    float _2800 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2802 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2804 = _2796 * _2796;
    float _2806 = _2798 * _2798;
    float _2808 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2800);
    float _2810 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2802);
    float _2812 = -_2782;
    float _2814 = _2768 + _2812;
    float _2816 = _2804 + _2806;
    float _2818 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2808);
    float _2820 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2810);
    float _2822 = sqrt(_2762);
    float _2824 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2826 = _2794 * _2824;
    float _2828 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2830 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2832 = _2826 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2834 = sqrt(_2816);
    bool _2836 = _2826 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2838 = trunc(_2828);
    int _2840 = int(_2838);
    int _2842 = 2;
    float _2844 = _2816;
    float _2846 = _2790;
    float _2848 = _2796;
    float _2850 = _2804;
    if (!_2832)
    {
        _2842 = 1;
    }
    int _2852 = _2842;
    bool _2854 = _2834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2856 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2858 = _2834 + _2856;
    float _2860 = trunc(_2830);
    int _2862 = int(_2860);
    int _2864 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2866 = _2840 + _2864;
    int _2868 = _2866 + 1;
    float _2870 = _2760;
    float _2872 = _2858;
    int _2874 = _2852;
    if (_2854)
    {
        float _2876 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2870 = _2876;
    }
    float _2878 = _2870;
    int _2880 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2882 = _2862 + _2880;
    int _2884 = _2882 + 1;
    if (_2854)
    {
        float _2886 = rsqrt(_2816);
        _2844 = _2886;
    }
    float _2888 = _2844;
    float _2890 = _2888;
    if (_2854)
    {
        float _2892 = _2858 * _2878;
        _2872 = _2892;
    }
    float _2894 = _2872;
    if (_2854)
    {
        float _2896 = _2894 * 0.15915493667125701904296875;
        _2644 = _2896;
    }
    float _2898 = _2644;
    bool _2900 = !_2832;
    int _2902 = _2900 ? 0 : 1;
    float _2904 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2906 = _2820;
    if (_2854)
    {
        float _2908 = _2898 * 6.283185482025146484375;
        float _2910 = sin(_2908);
        _2906 = _2910;
    }
    float _2912 = _2906;
    if (!_2836)
    {
        _2874 = _2902;
    }
    int _2914 = _2874;
    float _2916 = precise::max(0.0, _2904);
    int _2918 = _2914 << 6;
    bool _2920 = _2868 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2922 = -_2790;
    float _2924 = -_2916;
    float _2926 = fma(_2740, _2922, _2924);
    int _2928 = _2918 + 96;
    uint _2930 = uint(int(uint(_2928) >> uint(2)));
    uint _2932 = uint(int(uint(int(_2930)) >> uint(2)));
    int _2934 = int(_2930) & 3;
    float _2936 = (*spvDescriptorSet0.vp_c15)._m0[int(_2932)][_2934];
    int _2938 = int(_2930) + 1;
    uint _2940 = uint(int(uint(_2938) >> uint(2)));
    int _2942 = _2938 & 3;
    float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
    int _2946 = _2868 | _2884;
    float _2948 = _2898;
    float _2950 = as_type<float>(_2946);
    float _2952 = _2926;
    if (_2854)
    {
        float _2954 = _2898 * 6.283185482025146484375;
        float _2956 = cos(_2954);
        _2948 = _2956;
    }
    float _2958 = _2948;
    if (_2854)
    {
        float _2960 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2846 = _2960;
    }
    float _2962 = _2846;
    bool _2964 = _2946 < 0;
    bool _2966 = _2964 || _2920;
    if (_2854)
    {
        float _2968 = fma(_2912, _2962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2950 = _2968;
    }
    float _2970 = _2950;
    int _2972 = _2918 + 48;
    uint _2974 = uint(int(uint(_2972) >> uint(2)));
    uint _2976 = uint(int(uint(int(_2974)) >> uint(2)));
    int _2978 = int(_2974) & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    int _2982 = int(_2974) + 1;
    uint _2984 = uint(int(uint(_2982) >> uint(2)));
    int _2986 = _2982 & 3;
    float _2988 = (*spvDescriptorSet0.vp_c15)._m0[int(_2984)][_2986];
    float _2990 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2992 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (_2854)
    {
        float _2994 = _2888 * _2970;
        _2646 = _2994;
    }
    float _2996 = _2646;
    bool _2998 = _2884 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3000 = _2998 || _2966;
    float _3002 = fma(_2732, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2990);
    float _3004 = floor(_2992);
    if (_2854)
    {
        float _3006 = _2796 * _2996;
        _2848 = _3006;
    }
    float _3008 = _2848;
    int _3010 = _2918 + 104;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    uint _3014 = uint(int(uint(int(_3012)) >> uint(2)));
    int _3016 = int(_3012) & 3;
    float _3018 = (*spvDescriptorSet0.vp_c15)._m0[int(_3014)][_3016];
    int _3020 = int(_3012) + 1;
    uint _3022 = uint(int(uint(_3020) >> uint(2)));
    int _3024 = _3020 & 3;
    float _3026 = (*spvDescriptorSet0.vp_c15)._m0[int(_3022)][_3024];
    float _3028 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3002);
    float _3030 = _3028;
    if (_2854)
    {
        float _3032 = _2958 + (-1.0);
        _2890 = _3032;
    }
    float _3034 = _2890;
    float _3036 = _3034;
    if (_2854)
    {
        float _3038 = _3008 * _3008;
        _2850 = _3038;
    }
    float _3040 = _2850;
    if (_2854)
    {
        float _3042 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2648 = _3042;
    }
    float _3044 = _2648;
    if (!_2854)
    {
        _3036 = _2798;
    }
    float _3046 = _3036;
    int _3048 = _2918 + 64;
    uint _3050 = uint(int(uint(_3048) >> uint(2)));
    uint _3052 = uint(int(uint(int(_3050)) >> uint(2)));
    int _3054 = int(_3050) & 3;
    float _3056 = (*spvDescriptorSet0.vp_c15)._m0[int(_3052)][_3054];
    int _3058 = int(_3050) + 1;
    uint _3060 = uint(int(uint(_3058) >> uint(2)));
    int _3062 = _3058 & 3;
    float _3064 = (*spvDescriptorSet0.vp_c15)._m0[int(_3060)][_3062];
    float _3066 = _3046;
    if (_2854)
    {
        float _3068 = _2798 * _2996;
        _3066 = _3068;
    }
    float _3070 = _3066;
    if (_2854)
    {
        float _3072 = fma(_2926, _2958, _3044);
        _2952 = _3072;
    }
    float _3074 = _2952;
    float _3076 = _3028 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (!_2854)
    {
        _3030 = _2806;
    }
    float _3078 = _3030;
    float _3080 = _3078;
    if (_2854)
    {
        float _3082 = _3070 * _3070;
        _3080 = _3082;
    }
    float _3084 = _3080;
    float _3086 = fma(_3074, _3074, _3040);
    if (!_3000)
    {
        float _3088 = floor(_2830);
        _2650 = _3088;
    }
    float _3090 = _2650;
    int _3092 = _2918 + 80;
    uint _3094 = uint(int(uint(_3092) >> uint(2)));
    uint _3096 = uint(int(uint(int(_3094)) >> uint(2)));
    int _3098 = int(_3094) & 3;
    float _3100 = (*spvDescriptorSet0.vp_c15)._m0[int(_3096)][_3098];
    int _3102 = int(_3094) + 1;
    uint _3104 = uint(int(uint(_3102) >> uint(2)));
    int _3106 = _3102 & 3;
    float _3108 = (*spvDescriptorSet0.vp_c15)._m0[int(_3104)][_3106];
    float _3110 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3112 = _3076 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3114 = -_3004;
    float _3116 = _2992 + _3114;
    float _3118 = _3086 + _3084;
    float _3120 = -_3112;
    float _3122 = fma(_3120, _3110, 1.0);
    int _3124 = as_type<int>(_3112);
    if (!_3000)
    {
        int _3126 = _2884 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3128 = _3126 + _2868;
        _3124 = _3128;
    }
    int _3130 = _3124;
    int _3132 = _2918 + 56;
    uint _3134 = uint(int(uint(_3132) >> uint(2)));
    uint _3136 = uint(int(uint(int(_3134)) >> uint(2)));
    int _3138 = int(_3134) & 3;
    float _3140 = (*spvDescriptorSet0.vp_c15)._m0[int(_3136)][_3138];
    int _3142 = int(_3134) + 1;
    uint _3144 = uint(int(uint(_3142) >> uint(2)));
    int _3146 = _3142 & 3;
    float _3148 = (*spvDescriptorSet0.vp_c15)._m0[int(_3144)][_3146];
    float _3150 = log2(_3122);
    int _3152 = _2918 + 88;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    uint _3156 = uint(int(uint(int(_3154)) >> uint(2)));
    int _3158 = int(_3154) & 3;
    float _3160 = (*spvDescriptorSet0.vp_c15)._m0[int(_3156)][_3158];
    int _3162 = int(_3154) + 1;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    int _3166 = _3162 & 3;
    float _3168 = (*spvDescriptorSet0.vp_c15)._m0[int(_3164)][_3166];
    float _3170 = _2792 * _2944;
    float _3172 = fma(_887, _2936, _3170);
    int _3174 = _2918 + 72;
    uint _3176 = uint(int(uint(_3174) >> uint(2)));
    uint _3178 = uint(int(uint(int(_3176)) >> uint(2)));
    int _3180 = int(_3176) & 3;
    float _3182 = (*spvDescriptorSet0.vp_c15)._m0[int(_3178)][_3180];
    int _3184 = int(_3176) + 1;
    uint _3186 = uint(int(uint(_3184) >> uint(2)));
    int _3188 = _3184 & 3;
    float _3190 = (*spvDescriptorSet0.vp_c15)._m0[int(_3186)][_3188];
    float _3192 = _2792 * _2988;
    float _3194 = rsqrt(_3118);
    float _3196 = _3150 * 0.693147182464599609375;
    float _3198 = fma(_887, _2980, _3192);
    int _3200 = as_type<int>(_3192);
    int _3202 = as_type<int>(_2936);
    if (!_3000)
    {
        int _3204 = _3130 << 2;
        _3200 = _3204;
    }
    int _3206 = _3200;
    float _3208 = fma(_889, _3018, _3172);
    int _3210 = _3206;
    if (!_3000)
    {
        int _3212 = 12 & _3206;
        _3210 = _3212;
    }
    int _3214 = _3210;
    float _3216 = _3208 + _3026;
    float _3218 = _2792 * _3064;
    float _3220 = _3064;
    int _3222 = as_type<int>(_3108);
    if (!_3000)
    {
        float _3224 = -_3090;
        float _3226 = _2830 + _3224;
        _3220 = _3226;
    }
    float _3228 = _3220;
    float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3232 = fma(_2822, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3230);
    float _3234 = precise::clamp(_3232, 0.0, 1.0);
    float _3236 = _3194 * _3008;
    float _3238 = fma(_887, _3056, _3218);
    float _3240 = _3194 * _3074;
    float _3242 = _3194 * _3070;
    float _3244 = _3236 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3246 = _2792 * _3108;
    if (!_3000)
    {
        uint _3248 = uint(int(uint(_3130) >> uint(2)));
        _3222 = int(_3248);
    }
    int _3250 = _3222;
    float2 _8836 = float2(_2814, _3116);
    float _3252 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8836, float2(0.0), isnan(_8836)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8836, float2(0.0), isnan(_8836)), level(0.0)).x;
    float _3254 = _3196 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3256 = fma(_887, _3100, _3246);
    float _3258 = -_3234;
    float _3260 = _3258 + 1.0;
    if (!_3000)
    {
        int _3262 = _3250 << 4;
        int _3264 = _3262 + _3214;
        _3202 = _3264;
    }
    int _3266 = _3202;
    float _3268 = fma(_889, _3140, _3198);
    float _3270 = 1.0 / _3216;
    float _3272 = _3234;
    if (!_3000)
    {
        int _3274 = _3266 + 400;
        uint _3276 = uint(int(uint(_3274) >> uint(2)));
        uint _3278 = uint(int(uint(int(_3276)) >> uint(2)));
        int _3280 = int(_3276) & 3;
        float _3282 = (*spvDescriptorSet0.vp_c15)._m0[int(_3278)][_3280];
        _3272 = _3282;
    }
    float _3284 = _3272;
    float _3286 = _3268 + _3148;
    float _3288 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3290 = fma(_889, _3160, _3256);
    float _3292 = -_3244;
    float _3294 = fma(_3240, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3292);
    float _3296 = abs(_3260);
    float _3298 = log2(_3296);
    float _3300 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3302 = fma(_2732, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3288);
    float _3304 = -_3242;
    float _3306 = fma(_3304, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3294);
    float _3308 = _3240 + 1.0;
    float _3310 = fma(_2732, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3300);
    float _3312 = fma(_889, _3182, _3238);
    float _3314 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3302);
    float _3316 = _3286 * _3270;
    float _3318 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3310);
    float _3320 = _3312 + _3190;
    float _3322 = _2730 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3324 = fma(_3306, -0.5, 0.5);
    bool _3326 = _3316 >= 0.0;
    float _3328 = _3320 * _3270;
    float _3330 = fma(_2732, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3322);
    float _3332 = _3298 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _3334 = _3316 <= 1.0;
    bool _3336 = _3334 && _3326;
    float _3338 = _3318 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3340 = fma(_2734, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3330);
    float _3342 = exp2(_3332);
    bool _3344 = _3328 >= 0.0;
    bool _3346 = _3344 && _3336;
    float _3348 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3350 = _3340 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3352 = fma(_3306, 0.5, 0.5);
    bool _3354 = _3328 <= 1.0;
    bool _3356 = _3354 && _3346;
    float _3358 = _3314 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3360 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3348);
    float _3362 = sqrt(_3324);
    float _3364 = _3290 + _3168;
    float _3366 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3360);
    float _3368 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3370 = fma(_3352, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3372 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3366);
    float _3374 = -_3240;
    float _3376 = fma(_3342, _3308, _3374);
    float _3378 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3368);
    float _3380 = fma(_3352, _3370, -0.212114393711090087890625);
    float _3382 = 1.0 / _3372;
    float _3384 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3386 = _3308;
    if (_3356)
    {
        float _3388 = float(_2914);
        _3386 = _3388;
    }
    float _3390 = _3386;
    float _3392 = fma(_3352, _3380, 1.570728778839111328125);
    float _3394 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3378);
    float _3396 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3384);
    float _3398 = _3362 * 0.636619746685028076171875;
    float _3400 = _3364 * _3270;
    float _3402 = _3390;
    float _3404 = _3400;
    if (_3356)
    {
        float _3406 = rint(_3390);
        float _3408 = precise::max(_3406, 0.0);
        uint _3410 = uint(_3408);
        uint _3412 = clamp(_3410, 0u, 65535u);
        _3402 = as_type<float>(_3412);
    }
    float _3414 = _3402;
    float _3416 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3396);
    float _3418 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3394);
    float _3420 = -_3392;
    float _3422 = fma(_3398, _3420, 1.0);
    float _3424 = fma(_3376, 0.5, 0.5);
    float _3426 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3416);
    float _3428 = _3314;
    if (!_3000)
    {
        float _3430 = floor(_2828);
        _3428 = _3430;
    }
    float _3432 = _3428;
    float _3434 = _3418 * _3382;
    float _3436 = _3426 * _3382;
    float _3438 = fma(_3434, 0.5, 0.5);
    float _3440 = fma(_3436, -0.5, 0.5);
    float _3442 = _3414;
    if (_3356)
    {
        float3 _9165 = float3(_3316, _3328, float(as_type<int>(_3414)));
        float3 _9169 = select(_9165, float3(0.0), isnan(_9165));
        float _3444 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9169.xy, uint(rint(_9169.z)), _3400, level(0.0));
        _3442 = _3444;
    }
    float _3446 = _3442;
    float _3448 = _3270;
    if (!_3000)
    {
        float _3450 = rint(_3284);
        float _3452 = precise::max(_3450, 0.0);
        uint _3454 = uint(_3452);
        uint _3456 = clamp(_3454, 0u, 65535u);
        _3448 = as_type<float>(_3456);
    }
    float _3458 = _3448;
    float3 _9195 = float3(_3438, _3440, _3254);
    float _3460 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9195, float3(0.0), isnan(_9195)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9195, float3(0.0), isnan(_9195)), level(0.0)).x;
    float _3462 = _3432;
    if (!_3000)
    {
        float _3464 = -_3432;
        float _3466 = _2828 + _3464;
        _3462 = _3466;
    }
    float _3468 = _3462;
    float3 _9216 = float3(_3438, _3440, _3254);
    float4 _3471 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9216, float3(0.0), isnan(_9216)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9216, float3(0.0), isnan(_9216)), level(0.0)).xyzw;
    float _3473 = _3471.x;
    float _3475 = _3471.y;
    float _3477 = _3471.z;
    float _3479 = _3471.w;
    float2 _9232 = float2(_3422, _3424);
    float3 _3481 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9232, float2(0.0), isnan(_9232)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9232, float2(0.0), isnan(_9232)), level(0.0)).xyz;
    float _3483 = _3481.x;
    float _3485 = _3481.y;
    float _3487 = _3481.z;
    float _3489 = _3458;
    float _3491 = _3468;
    if (!_3000)
    {
        float3 _9254 = float3(_3468, _3228, float(as_type<int>(_3458)));
        float3 _9256 = select(_9254, float3(0.0), isnan(_9254));
        float _3493 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9256.xy, uint(rint(_9256.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9256.xy, uint(rint(_9256.z)), level(0.0)).x;
        _3489 = _3493;
    }
    float _3495 = _3489;
    float _3497 = abs(_2826);
    float _3499 = log2(_3497);
    float _3501 = _3338 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3503 = fma(_3350, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3501);
    float _3505 = fma(_3076, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3503);
    bool _3507 = _2826 <= 8000.0;
    bool _3509 = isnan(_2826);
    bool _3511 = _3507 || _3509;
    bool _3513 = isnan(8000.0);
    bool _3515 = _3511 || _3513;
    float _3517 = float(_3515);
    float _3519 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3505);
    float _3521 = _3298 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3523 = _3499 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_3356)
    {
        _3491 = 1.0;
    }
    float _3525 = _3491;
    out.gl_Position.x = _3418;
    out.gl_Position.y = _3426;
    out.gl_Position.z = _3519;
    out.gl_Position.w = _3372;
    float _3527 = exp2(_3521);
    float _3529 = exp2(_3523);
    float _3531 = fma(_3529, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3533 = precise::clamp(_3531, 0.0, 1.0);
    float _3535 = fma(_3533, -2.0, 3.0);
    float _3537 = _3533 * _3533;
    float _3539 = _3537 * _3535;
    float _3541 = _3519 + _3372;
    float _3543 = _3541 * 0.5;
    float _3545 = -_3539;
    float _3547 = _3545 + 1.0;
    out.m_90.z = _3543;
    out.m_90.w = _3372;
    float _3549 = fma(_3547, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3539);
    float _3551 = _3517 * _3549;
    float _3553 = -_3527;
    float _3555 = _3553 + 1.0;
    float _3557 = _3551 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3559 = _3555 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3561 = -_3252;
    float _3563 = _3561 + 1.0;
    float _3565 = _3563 * _3557;
    float _3567 = precise::clamp(_3565, 0.0, 1.0);
    float _3569 = _3557;
    float _3571 = _3525;
    float _3573 = _3567;
    if (_3000)
    {
        _3569 = 1.0;
    }
    float _3575 = _3569;
    float _3577 = _3575;
    if (_3356)
    {
        bool _3579 = _3446 >= _3400;
        bool _3581 = isnan(_3446);
        bool _3583 = _3579 || _3581;
        bool _3585 = isnan(_3400);
        bool _3587 = _3583 || _3585;
        float _3589 = float(_3587);
        _3571 = _3589;
    }
    float _3591 = _3571;
    if (!_3000)
    {
        int _3593 = _3130 << 4;
        int _3595 = _3593 + 2048;
        uint _3597 = uint(int(uint(_3595) >> uint(2)));
        uint _3599 = uint(int(uint(int(_3597)) >> uint(2)));
        int _3601 = int(_3597) & 3;
        float _3603 = (*spvDescriptorSet0.vp_c15)._m0[int(_3599)][_3601];
        int _3605 = int(_3597) + 1;
        uint _3607 = uint(int(uint(_3605) >> uint(2)));
        int _3609 = _3605 & 3;
        float _3611 = (*spvDescriptorSet0.vp_c15)._m0[int(_3607)][_3609];
        int _3613 = _3595 + 8;
        uint _3615 = uint(int(uint(_3613) >> uint(2)));
        uint _3617 = uint(int(uint(int(_3615)) >> uint(2)));
        int _3619 = int(_3615) & 3;
        float _3621 = (*spvDescriptorSet0.vp_c15)._m0[int(_3617)][_3619];
        int _3623 = int(_3615) + 1;
        uint _3625 = uint(int(uint(_3623) >> uint(2)));
        int _3627 = _3623 & 3;
        float _3629 = (*spvDescriptorSet0.vp_c15)._m0[int(_3625)][_3627];
        float _3631 = _2792 * _3611;
        float _3633 = fma(_887, _3603, _3631);
        float _3635 = fma(_889, _3621, _3633);
        float _3637 = _3635 + _3629;
        float _3639 = precise::clamp(_3637, 0.0, 1.0);
        float _3641 = -_3639;
        float _3643 = _3641 + _3495;
        float _3645 = fma(_3643, 500.0, 1.5);
        float _3647 = exp2(_3645);
        float _3649 = 0.0 + _3647;
        float _3651 = precise::clamp(_3649, 0.0, 1.0);
        _3577 = _3651;
    }
    float _3653 = _3577;
    float _3655 = _3591 * _3653;
    float _3657 = _3559 * _3460;
    float _3659 = -_3567;
    float _3661 = fma(_3659, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3663 = -_3559;
    float _3665 = _3663 + 1.0;
    out.m_92.x = _2732;
    out.m_92.y = _2730;
    out.m_92.z = _2734;
    float _3667 = _3479 * _3657;
    float _3669 = -_3655;
    float _3671 = fma(_3669, _3661, 1.0);
    float _3673 = precise::clamp(_3671, 0.0, 1.0);
    float _3675 = _3487 * _3657;
    float _3677 = _3479 * _3665;
    float _3679 = fma(_3483, _3667, _3473);
    float _3681 = fma(_3485, _3667, _3475);
    float _3683 = _3673 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3685 = fma(_3479, _3675, _3477);
    bool _3687 = _2822 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3689 = isnan(_2822);
    bool _3691 = _3687 || _3689;
    bool _3693 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3695 = _3691 || _3693;
    out.m_94.x = _3683;
    out.m_96.x = _3679;
    out.m_96.y = _3681;
    out.m_96.z = _3685;
    out.m_96.w = _3677;
    float _3697 = _3667;
    float _3699 = _3655;
    float _3701 = _3673;
    float _3703 = _3665;
    if (!_3695)
    {
        _3404 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3705 = _3404;
    float _3707 = _3705;
    float _3709 = _3705;
    if (!_3695)
    {
        _3573 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3711 = _3573;
    float _3713 = _3711;
    float _3715 = _3711;
    if (!_3695)
    {
        _3697 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3717 = _3697;
    float _3719 = _3717;
    float _3721 = _3717;
    if (!_3695)
    {
        _3699 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3723 = _3699;
    float _3725 = _3723;
    float _3727 = _3723;
    if (!_3695)
    {
        _3701 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3729 = _3701;
    float _3731 = _3729;
    float _3733 = _3729;
    if (!_3695)
    {
        _3703 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3735 = _3703;
    bool _3737 = !_3695;
    float _3739 = _3735;
    float _3741 = _3735;
    if (!_3737)
    {
        bool _3743 = _2822 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3745 = isnan(_2822);
        bool _3747 = _3743 || _3745;
        bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3751 = _3747 || _3749;
        if (!_3751)
        {
            float _3753 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3755 = _2822 + _3753;
            float _3757 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3759 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3757;
            float _3761 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3763 = _3761 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3765 = 1.0 / _3759;
            float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3769 = _3767 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3771 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3773 = _3771 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3775 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3777 = _3775 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3779 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3781 = _3779 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3783 = _3755 * _3765;
            float _3785 = precise::clamp(_3783, 0.0, 1.0);
            float _3787 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3789 = _3787 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3791 = fma(_3785, _3763, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3793 = fma(_3785, _3789, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3795 = fma(_3785, _3769, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3797 = fma(_3785, _3773, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3799 = fma(_3785, _3777, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3801 = fma(_3785, _3781, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3715 = _3795;
            _3733 = _3799;
            _3709 = _3791;
            _3727 = _3797;
            _3721 = _3793;
            _3741 = _3801;
            _3803 = true;
        }
        else
        {
            bool _3805 = _2822 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3807 = isnan(_2822);
            bool _3809 = _3805 || _3807;
            bool _3811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3813 = _3809 || _3811;
            if (!_3813)
            {
                _3707 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3815 = _3707;
            _3709 = _3815;
            if (!_3813)
            {
                _3713 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3817 = _3713;
            _3715 = _3817;
            if (!_3813)
            {
                _3719 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3819 = _3719;
            _3721 = _3819;
            if (!_3813)
            {
                _3725 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3821 = _3725;
            _3727 = _3821;
            if (!_3813)
            {
                _3731 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3823 = _3731;
            _3733 = _3823;
            if (!_3813)
            {
                _3739 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3825 = _3739;
            bool _3827 = !_3813;
            _3741 = _3825;
            if (!_3827)
            {
                bool _3829 = _2822 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3831 = isnan(_2822);
                bool _3833 = _3829 || _3831;
                bool _3835 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3837 = _3833 || _3835;
                if (!_3837)
                {
                    float _3839 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3841 = _2822 + _3839;
                    float _3843 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3845 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3843;
                    float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3849 = _3847 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3851 = 1.0 / _3845;
                    float _3853 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3855 = _3853 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3857 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3859 = _3857 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3863 = _3861 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3867 = _3865 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3869 = _3841 * _3851;
                    float _3871 = precise::clamp(_3869, 0.0, 1.0);
                    float _3873 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3875 = _3873 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3877 = fma(_3871, _3849, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3879 = fma(_3871, _3875, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3881 = fma(_3871, _3855, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3883 = fma(_3871, _3859, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3885 = fma(_3871, _3863, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3887 = fma(_3871, _3867, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3715 = _3881;
                    _3733 = _3885;
                    _3709 = _3877;
                    _3727 = _3883;
                    _3721 = _3879;
                    _3741 = _3887;
                    _3803 = true;
                }
                else
                {
                    _3715 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3733 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3709 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3727 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3721 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3741 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3803 = false;
    float _3889 = _3715;
    float _3891 = _3733;
    float _3893 = _3709;
    float _3895 = _3727;
    float _3897 = _3721;
    float _3899 = _3741;
    float _3901 = fma(_2640, -0.5, 0.5);
    float _3903 = precise::clamp(_3901, 0.0, 1.0);
    float _3905 = -_3889;
    float _3907 = _3905 + _3891;
    float _3909 = -_3893;
    float _3911 = _3909 + _3895;
    float _3913 = -_3897;
    float _3915 = _3913 + _3899;
    bool _3917 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3919 = fma(_3903, _3907, _3889);
    float _3921 = fma(_3903, _3911, _3893);
    float _3923 = fma(_3903, _3915, _3897);
    float _3925 = _3919 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _3927 = fma(_3921, 0.298911988735198974609375, _3925);
    float _3929 = fma(_3923, 0.114477999508380889892578125, _3927);
    out.m_98.x = 0.0;
    float _3931 = -_3929;
    float _3933 = _3921 + _3931;
    float _3935 = -_3929;
    float _3937 = _3919 + _3935;
    float _3939 = -_3929;
    float _3941 = _3923 + _3939;
    float _3943 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3945 = fma(_3933, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3929);
    float _3947 = fma(_3937, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3929);
    float _3949 = fma(_3941, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3929);
    out.m_94.w = _3943;
    out.m_100.x = _3945;
    out.m_100.y = _3947;
    out.m_100.z = _3949;
    if (!_3917)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3951 = -_2730;
    float _3953 = _3951 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3955 = -_2732;
    float _3957 = _3955 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3959 = -_2734;
    float _3961 = _3959 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3963 = _3953 * _3953;
    float _3965 = fma(_3957, _3957, _3963);
    float _3967 = fma(_3961, _3961, _3965);
    float _3969 = sqrt(_3967);
    float _3971 = rsqrt(_3967);
    float _3973 = -_3969;
    float _3975 = _3973 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3977 = _3975 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3979 = precise::clamp(_3977, 0.0, 1.0);
    float _3981 = _3957 * _3971;
    float _3983 = _3953 * _3971;
    float _3985 = abs(_3979);
    float _3987 = log2(_3985);
    float _3989 = _3961 * _3971;
    float _3991 = _3981 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3993 = _2640 * _3983;
    float _3995 = -_3983;
    float _3997 = -_3991;
    float _3999 = fma(_3995, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3997);
    float _4001 = fma(_2636, _3981, _3993);
    float _4003 = -_3989;
    float _4005 = fma(_4003, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3999);
    float _4007 = fma(_2642, _3989, _4001);
    float _4009 = precise::clamp(_4007, 0.0, 1.0);
    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4013 = _4005 + _4011;
    float _4015 = _3987 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4017 = _4013 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4019 = precise::clamp(_4017, 0.0, 1.0);
    float _4021 = exp2(_4015);
    float _4023 = _4021 * _4019;
    float _4025 = _4009 * _4023;
    float _4027 = _4025 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4029 = _4025 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4031 = _4025 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4027;
    out.m_98.y = _4029;
    out.m_98.z = _4031;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

