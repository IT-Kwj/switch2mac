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
    texture2d_array<float> vp_t_tcb_14 [[id(17)]];
    sampler vp_t_tcb_14Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_20Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_14Smplr_w [[id(25)]];
    sampler vp_t_tcb_1CSmplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_86 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_100 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_98 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 m_96 [[user(locn13)]];
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
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3953 = false;
    bool _2728 = false;
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
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4239 = as_type<float>(_137);
        out.gl_Position.z = _4239;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_65.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _131 = _157;
    }
    float _159 = _131;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_63.x = 0.0;
    }
    int _171 = 0;
    if (_165)
    {
        float _173 = _169 * 5.0;
        _171 = as_type<int>(_173);
    }
    int _175 = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4309 = as_type<float>(_175);
        out.gl_Position.z = _4309;
    }
    if (_165)
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
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
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
        float _223 = _153 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = in.m_70.x;
    float _229 = in.m_70.y;
    float _231 = in.m_70.z;
    float _233 = in.m_70.w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = _225 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _249 = 1.0 / _241;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _251;
    int _255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _257 = _255 != 0;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _261 = 1.0 / _245;
    float _263 = _227 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _265 = _227 * 2.0;
    float _267 = 1.0 / _253;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _225 + _269;
    float _273 = -_247;
    float _275 = fma(_263, 2.0, _273);
    float _277 = _231 * 2.0;
    float _279 = _229 * 2.0;
    float _281 = _271 * _249;
    float _283 = _227 + _229;
    float _285 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _287 = floor(_265);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _225 + _289;
    float _293 = _283 + (-1.0);
    float _295 = _231 + _229;
    float _297 = _291 * _261;
    float _299 = _231 + _227;
    float _301 = _295 + (-1.0);
    float _303 = floor(_277);
    float _305 = fma(_285, -2.0, _259);
    float _307 = _299 + (-1.0);
    float _309 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _311 = as_type<int>(_301);
    if (_257)
    {
        _311 = 0;
    }
    int _313 = _311;
    float _315 = _237 * _267;
    int _317 = _313;
    if (!_257)
    {
        _317 = 1;
    }
    int _319 = _317;
    float _321 = floor(_279);
    bool _323 = _287 >= 0.0;
    bool _325 = isnan(_287);
    bool _327 = _323 || _325;
    bool _329 = isnan(0.0);
    bool _331 = _327 || _329;
    float _333 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _335 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _337 = _287 > 0.0;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _343 = _303 > 0.0;
    float _345 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _347 = int(_345);
    bool _349 = _303 >= 0.0;
    bool _351 = isnan(_303);
    bool _353 = _349 || _351;
    bool _355 = isnan(0.0);
    bool _357 = _353 || _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    float _363 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _305);
    float _365 = _331 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _367 = fma(_361, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _369 = _321 > 0.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    bool _375 = _319 != 1;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _381 = _321 >= 0.0;
    bool _383 = isnan(_321);
    bool _385 = _381 || _383;
    bool _387 = isnan(0.0);
    bool _389 = _385 || _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _395 = _357 ? 0 : 1;
    float _397 = fma(_379, _297, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _399 = _389 ? 0 : 1;
    float _401 = fma(_393, _297, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _403 = ~as_type<int>(_365);
    int _405 = _403 + 1;
    int _407 = _405 + 1;
    float _409 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _411 = int(_409);
    int _413 = ~_399;
    int _415 = _413 + 1;
    int _417 = _415 + 1;
    float _419 = fma(_373, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _421 = ~_395;
    int _423 = _421 + 1;
    int _425 = _423 + 1;
    int _427 = _407;
    int _429 = _417;
    int _431 = _425;
    float _433 = _365;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    if (!_337)
    {
        int _437 = ~as_type<int>(_365);
        int _439 = _437 + 1;
        _427 = _439;
    }
    int _441 = _427;
    if (!_369)
    {
        int _443 = ~_399;
        int _445 = _443 + 1;
        _429 = _445;
    }
    int _447 = _429;
    if (!_343)
    {
        int _449 = ~_395;
        int _451 = _449 + 1;
        _431 = _451;
    }
    int _453 = _431;
    if (!_375)
    {
        _433 = _231;
    }
    float _455 = _433;
    float _457 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _459 = log2(_457);
    float _461 = float(_119);
    float _463 = _455;
    if (_375)
    {
        _463 = _229;
    }
    float _465 = _463;
    if (!_375)
    {
        _127 = _229;
    }
    float _467 = _127;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _479 = _477 != 0;
    float _481 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[83].w, _339);
    float _483 = _467;
    if (_375)
    {
        _483 = _227;
    }
    float _485 = _483;
    float _487 = 1.0 / _461;
    float _489 = float(_347);
    bool _491 = !_475;
    int _493 = _491 ? 0 : 1;
    float _495 = _485 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _497 = !_471;
    int _499 = _497 ? 0 : 1;
    bool _501 = !_479;
    int _503 = _501 ? 0 : 1;
    float _505 = -_341;
    float _507 = fma(_495, 2.0, _505);
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _511 = _509 != 0;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _519 = _517 != 0;
    float _521 = 1.0 / _489;
    float _523 = float(_411);
    float _525 = _495;
    if (!_375)
    {
        _525 = _231;
    }
    float _527 = _525;
    float _529 = _487 * _153;
    bool _531 = !_511;
    int _533 = _531 ? 0 : 1;
    float _535 = 1.0 / _523;
    float _537 = _527;
    if (_375)
    {
        _537 = _229;
    }
    float _539 = _537;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _543 = float(_441);
    float _545 = _459 * _153;
    int _547 = abs(_533);
    float _549 = _539 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _551 = _521 * _153;
    bool _553 = !_519;
    int _555 = _553 ? 0 : 1;
    float _557 = fma(_549, -2.0, _541);
    float _559 = float(_447);
    float _561 = exp2(_545);
    float _563 = float(_547);
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_375)
    {
        _435 = _229;
    }
    float _567 = _435;
    float _569 = _535 * _153;
    float _571 = float(_453);
    float _573 = _567;
    if (_375)
    {
        _573 = _227;
    }
    float _575 = _573;
    float _577 = _563 * _571;
    int _579 = abs(_555);
    float _581 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[83].z, _565);
    float _583 = in.m_72.x;
    float _585 = in.m_72.y;
    float _587 = in.m_72.z;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _591 = 1.0 + _589;
    float _593 = float(_579);
    float _595 = -_561;
    float _597 = _595 + 1.0;
    bool _599 = !_515;
    int _601 = _599 ? 0 : 1;
    float _603 = 1.0 / _591;
    float _605 = _593 * _559;
    int _607 = abs(_601);
    float _609 = -_153;
    float _611 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[76].x, _275);
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _615 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _617 = isnan(1.0);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _623 = _619 || _621;
    float _625 = _605 * (-2.0);
    float _627 = float(_607);
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _631 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _633 = isnan(0.0);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _639 = _635 || _637;
    float _641 = _577 * (-2.0);
    bool _643 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _645 = isnan(_225);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = _627 * _543;
    float _657 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[78].z, _613);
    float _659 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].w, _629);
    float _661 = _639 ? _597 : 0.0;
    float _663 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _581);
    float _665 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _481);
    float _667 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _657);
    float _669 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _659);
    float _671 = -_153;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[81].x, _507);
    float _675 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _557);
    if (_623)
    {
        float _677 = _661 * _603;
        _155 = _677;
    }
    float _679 = _155;
    bool _681 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _683 = isnan(_225);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -_653;
    float _695 = _693 + 1.0;
    float _697 = fma(_641, _583, _583);
    float _699 = fma(_333, _641, _333);
    bool _701 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _703 = isnan(_225);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = _691 * _695;
    float _715 = -_691;
    float _717 = _715 + 1.0;
    float _719 = _227 + (-0.5);
    float _721 = _655 * (-2.0);
    bool _723 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _725 = isnan(_225);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = _711 * _717;
    float _737 = -_711;
    float _739 = _737 + 1.0;
    float _741 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[196].x, _697);
    float _743 = fma(_309, _721, _309);
    float _745 = fma(_721, _585, _585);
    float _747 = _229 + (-0.5);
    float _749 = _733 * _739;
    float _751 = -_733;
    float _753 = _751 + 1.0;
    float _755 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[196].y, _745);
    float _757 = _367 * _749;
    float _759 = _419 * _749;
    float _761 = fma(_335, _625, _335);
    float _763 = in.m_74.x;
    float _765 = in.m_74.y;
    float _767 = fma(_743, _679, _755);
    float _769 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[143].y, _759);
    float _771 = fma(_625, _587, _587);
    float _773 = _767 * 0.15915493667125701904296875;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _779;
    float _783 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[143].x, _757);
    float _785 = _231 + (-0.5);
    float _787 = fma(_777, _315, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _789 = fma(_401, _735, _769);
    float _791 = fma(_781, _315, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _793 = fma(_397, _735, _783);
    float _795 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[196].z, _771);
    float _797 = fma(_787, _713, _789);
    float _799 = fma(_699, _679, _741);
    float _801 = fma(_791, _713, _793);
    float _803 = fma(_761, _679, _795);
    float _805 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[146].y, _797);
    float _807 = _799 * 0.15915493667125701904296875;
    float _809 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[146].x, _801);
    float _811 = _803 * 0.15915493667125701904296875;
    float _813 = _773 * 6.283185482025146484375;
    float _815 = sin(_813);
    float _817 = _805 * _765;
    float _819 = _809 * _763;
    float _821 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _823 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _825 = _817 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _827 = _819 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _829 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _831 = _807 * 6.283185482025146484375;
    float _833 = cos(_831);
    float _835 = _825 * _823;
    float _837 = _827 * _821;
    float _839 = in.m_60.x;
    float _841 = in.m_60.y;
    float _843 = in.m_60.z;
    float _845 = _773 * 6.283185482025146484375;
    float _847 = cos(_845);
    float _849 = _807 * 6.283185482025146484375;
    float _851 = sin(_849);
    float _853 = _833 * _815;
    float _855 = _811 * 6.283185482025146484375;
    float _857 = cos(_855);
    float _859 = _833 * _847;
    float _861 = _811 * 6.283185482025146484375;
    float _863 = sin(_861);
    float _865 = _851 * _815;
    float _867 = _851 * _847;
    float _869 = _833 * _857;
    float _871 = _851 * _857;
    float _873 = _847 * _857;
    float _875 = _815 * _857;
    float _877 = _869 * _835;
    float _879 = -_853;
    float _881 = fma(_863, _867, _879);
    float _883 = fma(_863, _859, _865);
    float _885 = -_867;
    float _887 = fma(_863, _853, _885);
    float _889 = -_835;
    float _891 = _863 * _889;
    float _893 = _871 * _835;
    float _895 = fma(_883, _837, _877);
    float _897 = fma(_863, _865, _859);
    float _899 = fma(_873, _837, _891);
    float _901 = fma(_881, _837, _893);
    float _903 = fma(_887, _829, _895);
    float _905 = _841 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _907 = fma(_875, _829, _899);
    float _909 = _841 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _911 = _903 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _913 = _903 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _915 = fma(_897, _829, _901);
    float _917 = fma(_839, (*spvDescriptorSet0.vp_c10)._m0[4].x, _909);
    float _919 = fma(_839, (*spvDescriptorSet0.vp_c10)._m0[6].x, _905);
    float _921 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[24].x, _911);
    float _923 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[26].x, _913);
    float _925 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[4].z, _917);
    float _927 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[6].z, _919);
    float _929 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].z, _921);
    float _931 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].z, _923);
    float _933 = _925 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _935 = _927 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _937 = _929 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _939 = _931 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _941 = _841 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _943 = _903 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _945 = _933 + _937;
    float _947 = _935 + _939;
    float _949 = fma(_839, (*spvDescriptorSet0.vp_c10)._m0[5].x, _941);
    float _951 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[25].x, _943);
    float _953 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _955 = _945 + _953;
    float _957 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _959 = _947 + _957;
    float _961 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[5].z, _949);
    float _963 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].z, _951);
    float _965 = _955 * _955;
    float _967 = _959 * _959;
    float _969 = _961 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _971 = _963 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _973 = _965 + _967;
    float _975 = _969 + _971;
    float _977 = sqrt(_973);
    bool _979 = _977 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _981 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _983 = _977 + _981;
    float _985 = 0.0;
    float _987 = _961;
    float _989 = _943;
    float _991 = _843;
    float _993 = _947;
    float _995 = _975;
    float _997 = _965;
    if (_979)
    {
        float _999 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _985 = _999;
    }
    float _1001 = _985;
    if (_979)
    {
        float _1003 = _975 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _987 = _1003;
    }
    float _1005 = _987;
    float _1007 = _1005;
    if (!_979)
    {
        _989 = _945;
    }
    float _1009 = _989;
    float _1011 = _1009;
    if (_979)
    {
        float _1013 = rsqrt(_973);
        _991 = _1013;
    }
    float _1015 = _991;
    float _1017 = _1001;
    if (_979)
    {
        float _1019 = _983 * _1001;
        _1017 = _1019;
    }
    float _1021 = _1017;
    float _1023 = _1021;
    if (_979)
    {
        float _1025 = _1021 * 0.15915493667125701904296875;
        _1023 = _1025;
    }
    float _1027 = _1023;
    float _1029 = _839;
    if (_979)
    {
        float _1031 = _1027 * 6.283185482025146484375;
        float _1033 = sin(_1031);
        _1029 = _1033;
    }
    float _1035 = _1029;
    if (_979)
    {
        float _1037 = fma(_1035, _1005, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1007 = _1037;
    }
    float _1039 = _1007;
    float _1041 = _1039;
    if (_979)
    {
        float _1043 = _1015 * _1039;
        _1041 = _1043;
    }
    float _1045 = _1041;
    if (_979)
    {
        float _1047 = fma(_955, _1045, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1011 = _1047;
    }
    float _1049 = _1011;
    if (_979)
    {
        float _1051 = fma(_959, _1045, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _993 = _1051;
    }
    float _1053 = _993;
    float _1055 = fma(_1049, 6.2500002968590706586837768554688e-05, 0.5);
    float _1057 = fma(_1053, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5696 = float2(_1055, _1057);
    float3 _1061 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5696, float2(0.0), isnan(_5696)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5696, float2(0.0), isnan(_5696)), level(0.0)).xyz;
    float _1063 = _1061.x;
    float _1065 = _1061.y;
    float _1067 = _1061.z;
    float _1069 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1071 = int(_1069);
    float _1073 = 0.0;
    if (_257)
    {
        float _1075 = in.m_70.x;
        _1073 = _1075;
    }
    float _1077 = _1073;
    float _1079 = -_669;
    float _1081 = _1079 + 1.0;
    float _1083 = -_663;
    float _1085 = _1083 + 1.0;
    float _1087 = _1077;
    if (!_257)
    {
        float _1089 = in.m_70.y;
        _1087 = _1089;
    }
    float _1091 = _1087;
    float _1093 = -_667;
    float _1095 = _1093 + 1.0;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1099 = trunc(_551);
    int _1101 = int(_1099);
    float _1103 = -_665;
    float _1105 = _1103 + 1.0;
    float _1107 = float(uint(_1071));
    float _1109 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1111 = int(_1109);
    int _1113 = ~_1071;
    int _1115 = _1113 + 1;
    bool _1117 = _1071 == 0;
    float _1119 = float(uint(_1101));
    float _1121 = 1.0 / _1107;
    float _1123 = float(_1101);
    float _1125 = float(uint(_1111));
    float _1127 = _1107;
    if (_257)
    {
        _1127 = 1.0;
    }
    float _1129 = _1127;
    float _1131 = _1129;
    if (!_257)
    {
        _1131 = 7.345489978790283203125;
    }
    float _1133 = _1131;
    float _1135 = 1.0 / _1125;
    bool _1137 = _1111 == 0;
    int _1139 = as_type<int>(_1121) + (-2);
    float _1141 = _1133 * _227;
    float _1143 = as_type<float>(_1139) * _1119;
    float _1145 = floor(_1141);
    float _1147 = trunc(_1143);
    float _1149 = precise::max(_1147, 0.0);
    uint _1152 = uint(_1149);
    float _1154 = trunc(_569);
    int _1156 = int(_1154);
    float _1158 = -_1145;
    float _1160 = _1141 + _1158;
    int _1162 = _1115 * int(_1152);
    int _1164 = _1162 + _1101;
    int _1166 = ~_1111;
    int _1168 = _1166 + 1;
    float _1170 = float(uint(_1164));
    int _1172 = as_type<int>(_1135) + (-2);
    float _1174 = float(uint(_1156));
    float _1176 = as_type<float>(_1139) * _1170;
    float _1178 = as_type<float>(_1172) * _1174;
    float _1180 = trunc(_1176);
    float _1182 = precise::max(_1180, 0.0);
    uint _1184 = uint(_1182);
    float _1186 = float(_1071);
    bool _1188 = _1123 >= _1186;
    bool _1190 = isnan(_1123);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan(_1186);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = trunc(_1178);
    float _1202 = precise::max(_1200, 0.0);
    uint _1204 = uint(_1202);
    int _1206 = ~_1071;
    int _1208 = _1206 + 1;
    int _1210 = int(_1152) + int(_1184);
    float _1212 = _1160 * _1186;
    float _1214 = trunc(_1198);
    int _1216 = int(_1214);
    float _1218 = as_type<float>(_1184);
    if (_257)
    {
        _1218 = 1.0;
    }
    float _1220 = _1218;
    float _1222 = _1220;
    if (!_257)
    {
        _1222 = 1.2345600128173828125;
    }
    float _1224 = _1222;
    int _1226 = _1208 * _1210;
    int _1228 = _1226 + _1101;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1232 = _1230 != 0;
    int _1234 = _1168 * int(_1204);
    int _1236 = _1234 + _1156;
    float _1238 = trunc(_1212);
    int _1240 = int(_1238);
    bool _1242 = uint(_1228) >= uint(_1071);
    float _1244 = _1091 * _1224;
    float _1246 = float(uint(_1236));
    float _1248 = _1186 * _529;
    bool _1250 = !_1242;
    int _1252 = _1250 ? 0 : (-1);
    float _1254 = as_type<float>(_1172) * _1246;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1258 = _1256 != 0;
    float _1260 = trunc(_1248);
    int _1262 = int(_1260);
    int _1264 = ~_1210;
    int _1266 = _1264 + _1252;
    int _1268 = _1266 + 1;
    bool _1270 = !_1258;
    int _1272 = _1270 ? 0 : 1;
    int _1274 = ~_1111;
    int _1276 = _1274 + 1;
    int _1278 = _1071 * _1268;
    int _1280 = _1278 + _1101;
    int _1282 = abs(_1272);
    float _1284 = trunc(_1254);
    float _1286 = precise::max(_1284, 0.0);
    uint _1288 = uint(_1286);
    int _1290 = ~_1216;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    bool _1296 = !_1117;
    int _1298 = _1296 ? _1280 : (-1);
    int _1300 = _1240 * _1282;
    int _1302 = _1300 + _1101;
    int _1304 = _1071 + (-1);
    int _1306 = _1298 * _1294;
    int _1308 = abs(_499);
    int _1310 = int(_1204) + int(_1288);
    int _1312 = _1216 * _1304;
    int _1314 = _1312 + _1306;
    int _1316 = abs(_493);
    float _1318 = floor(_1244);
    float _1320 = float(_1111);
    int _1322 = _1276 * _1310;
    int _1324 = _1322 + _1156;
    float _1326 = float(_1156);
    bool _1328 = _1326 >= _1320;
    bool _1330 = isnan(_1326);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan(_1320);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    bool _1340 = uint(_1324) >= uint(_1111);
    int _1342 = _1314 * _1316;
    int _1344 = abs(_503);
    float _1346 = trunc(_1338);
    int _1348 = int(_1346);
    bool _1350 = !_1340;
    int _1352 = _1350 ? 0 : (-1);
    float _1354 = -_1318;
    float _1356 = _1244 + _1354;
    int _1358 = ~_1310;
    int _1360 = _1358 + _1352;
    int _1362 = _1360 + 1;
    bool _1364 = !_1232;
    int _1366 = _1364 ? 0 : 1;
    int _1368 = _1262 * _1308;
    int _1370 = _1368 + _1342;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1374 = _1372 != 0;
    int _1376 = _1111 * _1362;
    int _1378 = _1376 + _1156;
    int _1380 = abs(_1366);
    int _1382 = _1302 * _1344;
    int _1384 = _1382 + _1370;
    bool _1386 = !_1374;
    int _1388 = _1386 ? 0 : 1;
    float _1390 = _1320 * _529;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1394 = _1392 != 0;
    int _1396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1398 = _1396 != 0;
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1402 = _1400 != 0;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1406 = _1404 != 0;
    float _1408 = _1356 * _1320;
    int _1410 = _1240 * _1380;
    int _1412 = _1410 + _1384;
    int _1414 = ~_1348;
    int _1416 = _1414 + 1;
    int _1418 = _1416 + 1;
    bool _1420 = !_1137;
    int _1422 = _1420 ? _1378 : (-1);
    float _1424 = trunc(_1390);
    int _1426 = int(_1424);
    bool _1428 = !_1398;
    int _1430 = _1428 ? 0 : 1;
    int _1432 = abs(_1388);
    int _1434 = _1422 * _1418;
    float _1436 = float(uint(_1412));
    bool _1438 = !_1394;
    int _1440 = _1438 ? 0 : 1;
    float _1442 = trunc(_1408);
    int _1444 = int(_1442);
    int _1446 = _1111 + (-1);
    float _1448 = as_type<float>(_1139) * _1436;
    int _1450 = abs(_1430);
    int _1452 = _1348 * _1446;
    int _1454 = _1452 + _1434;
    int _1456 = abs(_1440);
    float _1458 = trunc(_1448);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    int _1464 = ~_1071;
    int _1466 = _1464 + 1;
    int _1468 = _1454 * _1450;
    bool _1470 = !_1402;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = _1444 * _1432;
    int _1476 = _1474 + _1156;
    float _1478 = float(uint(_1302));
    int _1480 = _1426 * _1456;
    int _1482 = _1480 + _1468;
    bool _1484 = !_1406;
    int _1486 = _1484 ? 0 : 1;
    int _1488 = abs(_1472);
    float _1490 = as_type<float>(_1139) * _1478;
    int _1492 = abs(_1486);
    int _1494 = _1466 * int(_1462);
    int _1496 = _1494 + _1412;
    float _1498 = float(uint(_1476));
    float _1500 = trunc(_1490);
    float _1502 = precise::max(_1500, 0.0);
    uint _1504 = uint(_1502);
    float _1506 = float(uint(_1496));
    float _1508 = as_type<float>(_1172) * _1498;
    int _1510 = _1476 * _1488;
    int _1512 = _1510 + _1482;
    int _1514 = ~_1071;
    int _1516 = _1514 + 1;
    float _1518 = as_type<float>(_1139) * _1506;
    int _1520 = _1444 * _1492;
    int _1522 = _1520 + _1512;
    float _1524 = trunc(_1508);
    float _1526 = precise::max(_1524, 0.0);
    uint _1528 = uint(_1526);
    int _1530 = ~_1111;
    int _1532 = _1530 + 1;
    float _1534 = float(uint(_1522));
    float _1536 = trunc(_1518);
    float _1538 = precise::max(_1536, 0.0);
    uint _1540 = uint(_1538);
    float _1542 = as_type<float>(_1172) * _1534;
    int _1544 = _1516 * int(_1504);
    int _1546 = _1544 + _1302;
    float _1548 = float(uint(_1546));
    float _1550 = trunc(_1542);
    float _1552 = precise::max(_1550, 0.0);
    uint _1554 = uint(_1552);
    int _1556 = ~_1111;
    int _1558 = _1556 + 1;
    int _1560 = _1532 * int(_1528);
    int _1562 = _1560 + _1476;
    float _1564 = as_type<float>(_1139) * _1548;
    int _1566 = ~_1071;
    int _1568 = _1566 + 1;
    float _1570 = float(uint(_1562));
    int _1572 = int(_1462) + int(_1540);
    float _1574 = trunc(_1564);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    float _1580 = as_type<float>(_1172) * _1570;
    int _1582 = _1558 * int(_1554);
    int _1584 = _1582 + _1522;
    int _1586 = _1568 * _1572;
    int _1588 = _1586 + _1412;
    float _1590 = trunc(_1580);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    float _1596 = float(uint(_1584));
    bool _1598 = uint(_1588) >= uint(_1071);
    float _1600 = as_type<float>(_1172) * _1596;
    bool _1602 = !_1598;
    int _1604 = _1602 ? 0 : (-1);
    int _1606 = int(_1504) + int(_1578);
    int _1608 = ~_1572;
    int _1610 = _1608 + _1604;
    int _1612 = _1610 + 1;
    float _1614 = trunc(_1600);
    float _1616 = precise::max(_1614, 0.0);
    uint _1618 = uint(_1616);
    int _1620 = ~_1111;
    int _1622 = _1620 + 1;
    int _1624 = int(_1528) + int(_1594);
    int _1626 = _1071 * _1612;
    int _1628 = _1626 + _1412;
    int _1630 = ~_1111;
    int _1632 = _1630 + 1;
    int _1634 = ~_1071;
    int _1636 = _1634 + 1;
    bool _1638 = !_1117;
    int _1640 = _1638 ? _1628 : (-1);
    int _1642 = _1636 * _1606;
    int _1644 = _1642 + _1302;
    int _1646 = _1640 & 3;
    bool _1648 = _1646 != 0;
    int _1650 = int(_1554) + int(_1618);
    int _1652 = _1640 & 3;
    bool _1654 = _1652 != 0;
    int _1656 = _1648 ? 0 : 1;
    int _1658 = _1632 * _1650;
    int _1660 = _1658 + _1522;
    bool _1662 = uint(_1652) >= 2u;
    bool _1664 = uint(_1644) >= uint(_1071);
    int _1666 = _1662 ? 0 : 1;
    bool _1668 = uint(_1660) >= uint(_1111);
    bool _1670 = !_1664;
    int _1672 = _1670 ? 0 : (-1);
    bool _1674 = !_1668;
    int _1676 = _1674 ? 0 : (-1);
    bool _1678 = _1652 != 3;
    int _1680 = ~_1650;
    int _1682 = _1680 + _1676;
    int _1684 = _1682 + 1;
    int _1686 = ~_1606;
    int _1688 = _1686 + _1672;
    int _1690 = _1688 + 1;
    int _1692 = _1622 * _1624;
    int _1694 = _1692 + _1476;
    int _1696 = _1640 >> 31;
    int _1698 = _1111 * _1684;
    int _1700 = _1698 + _1522;
    bool _1702 = uint(_1652) > 1u;
    int _1704 = _1071 * _1690;
    int _1706 = _1704 + _1302;
    bool _1708 = _233 > 0.5;
    bool _1710 = !_1137;
    int _1712 = _1710 ? _1700 : (-1);
    int _1714 = ~_1666;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    int _1720 = _1712 >> 31;
    int _1722 = _1718;
    if (_1678)
    {
        int _1724 = ~_1666;
        int _1726 = _1724 + 1;
        _1722 = _1726;
    }
    int _1728 = _1722;
    int _1730 = _1696 & 3;
    float _1732 = -_195;
    int _1734 = _1708 ? as_type<int>(_1732) : as_type<int>(_195);
    int _1736 = _1720 & 3;
    int _1738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1740 = _1738 != 0;
    bool _1742 = !_1117;
    int _1744 = _1742 ? _1706 : (-1);
    int _1746 = _1640 + _1730;
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1750 = _1748 != 0;
    int _1752 = _1712 + _1736;
    bool _1754 = !_1740;
    int _1756 = _1754 ? 0 : 1;
    int _1758 = _1712 & 3;
    bool _1760 = _1758 != 0;
    int _1762 = _1746 >> 2;
    int _1764 = ~_1656;
    int _1766 = _1764 + 1;
    int _1768 = _1766 + 1;
    bool _1770 = !_1750;
    int _1772 = _1770 ? 0 : 1;
    int _1774 = _1752 >> 2;
    int _1776 = _1768;
    if (!_1702)
    {
        int _1778 = ~_1656;
        int _1780 = _1778 + 1;
        _1776 = _1780;
    }
    int _1782 = _1776;
    int _1784 = _1712 & 3;
    bool _1786 = _1784 != 0;
    bool _1788 = uint(_1694) >= uint(_1111);
    bool _1790 = !_1760;
    int _1792 = _1790 ? 0 : 1;
    bool _1794 = uint(_1758) > 1u;
    int _1796 = _1762 << 4;
    int _1798 = _1796 + 368;
    int _1800 = _1774 << 4;
    int _1802 = _1800 + 512;
    int _1804 = _1786 ? 0 : 1;
    bool _1806 = !_1654;
    int _1808 = _1806 ? 0 : 1;
    bool _1810 = !_1788;
    int _1812 = _1810 ? 0 : (-1);
    bool _1814 = _1652 != 3;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1818 = _1816 != 0;
    uint _1820 = uint(int(uint(_1798) >> uint(2)));
    uint _1822 = uint(int(uint(int(_1820)) >> uint(2)));
    int _1824 = int(_1820) & 3;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[int(_1822)][_1824];
    int _1828 = int(_1820) + 1;
    uint _1830 = uint(int(uint(_1828) >> uint(2)));
    int _1832 = _1828 & 3;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[int(_1830)][_1832];
    int _1836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1838 = _1836 != 0;
    int _1840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1842 = _1840 != 0;
    int _1844 = ~_1804;
    int _1846 = _1844 + 1;
    int _1848 = _1846 + 1;
    int _1850 = ~_1624;
    int _1852 = _1850 + _1812;
    int _1854 = _1852 + 1;
    uint _1856 = uint(int(uint(_1802) >> uint(2)));
    uint _1858 = uint(int(uint(int(_1856)) >> uint(2)));
    int _1860 = int(_1856) & 3;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[int(_1858)][_1860];
    int _1864 = int(_1856) + 1;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    int _1868 = _1864 & 3;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[int(_1866)][_1868];
    int _1872 = _1848;
    if (!_1794)
    {
        int _1874 = ~_1804;
        int _1876 = _1874 + 1;
        _1872 = _1876;
    }
    int _1878 = _1872;
    bool _1880 = !_1814;
    int _1882 = _1880 ? 0 : (-1);
    int _1884 = _1111 * _1854;
    int _1886 = _1884 + _1476;
    bool _1888 = _1758 != 3;
    bool _1890 = uint(_1758) >= 2u;
    int _1892 = _1802 + 8;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    uint _1896 = uint(int(uint(int(_1894)) >> uint(2)));
    int _1898 = int(_1894) & 3;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[int(_1896)][_1898];
    int _1902 = int(_1894) + 1;
    uint _1904 = uint(int(uint(_1902) >> uint(2)));
    int _1906 = _1902 & 3;
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[int(_1904)][_1906];
    int _1910 = _1890 ? 0 : 1;
    bool _1912 = _1758 != 3;
    int _1914 = ~_1910;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    int _1920 = _1798 + 8;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    uint _1924 = uint(int(uint(int(_1922)) >> uint(2)));
    int _1926 = int(_1922) & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = int(_1922) + 1;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    int _1934 = _1930 & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    bool _1938 = !_1137;
    int _1940 = _1938 ? _1886 : (-1);
    int _1942 = _1918;
    if (_1888)
    {
        int _1944 = ~_1910;
        int _1946 = _1944 + 1;
        _1942 = _1946;
    }
    int _1948 = _1942;
    int _1950 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1952 = _1950 != 0;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1958 = abs(_1878);
    float _1960 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1962 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1966 = _1956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1968 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1970 = abs(_1782);
    int _1972 = abs(_1808);
    out.m_76.x = _1962;
    out.m_76.y = _1966;
    out.m_76.z = _1968;
    out.m_76.w = _1964;
    bool _1974 = !_1912;
    int _1976 = _1974 ? 0 : (-1);
    bool _1978 = _227 > 0.5;
    bool _1980 = _229 > 0.5;
    int _1982 = ~_1970;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1990 = -_191;
    int _1992 = _1978 ? as_type<int>(_1990) : as_type<int>(_191);
    float _1994 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1996 = int(_1994);
    int _1998 = _1986 * as_type<int>(_1834);
    float _2000 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2002 = abs(_1792);
    float _2004 = _887 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2006 = ~_1958;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    bool _2012 = _231 > 0.5;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2016 = ~_1972;
    int _2018 = _2016 + 1;
    int _2020 = _2018 + 1;
    int _2022 = _2010 * as_type<int>(_1870);
    int _2024 = ~_2002;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    float _2030 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2032 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2034 = _2020 * as_type<int>(_1826);
    int _2036 = _2034 + _1998;
    int _2038 = abs(_1728);
    int _2040 = _2028 * as_type<int>(_1862);
    int _2042 = _2040 + _2022;
    int _2044 = abs(_1948);
    float _2046 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2048 = int(_2046);
    out.m_78.x = _2000;
    out.m_78.y = _2030;
    out.m_78.z = _2032;
    int _2050 = abs(_1882);
    float _2052 = _869 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2054 = abs(_1976);
    float _2056 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2058 = ~_2038;
    int _2060 = _2058 + 1;
    int _2062 = _2060 + 1;
    float _2064 = as_type<float>(_1948);
    if (_979)
    {
        float _2066 = _1027 * 6.283185482025146484375;
        float _2068 = cos(_2066);
        _2064 = _2068;
    }
    float _2070 = _2064;
    bool _2072 = !_1818;
    float _2074 = _2072 ? _195 : as_type<float>(_1734);
    float _2076 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2056);
    bool _2078 = !_1952;
    float _2080 = _2078 ? _191 : as_type<float>(_1992);
    int _2082 = _2062 * as_type<int>(_1928);
    int _2084 = _2082 + _2036;
    int _2086 = ~_2044;
    int _2088 = _2086 + 1;
    int _2090 = _2088 + 1;
    float _2092 = float(uint(_1996));
    float _2094 = _887 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2096 = _2090 * as_type<int>(_1900);
    int _2098 = _2096 + _2042;
    int _2100 = ~_2054;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    int _2106 = ~_2050;
    int _2108 = _2106 + 1;
    int _2110 = _2108 + 1;
    float _2112 = 1.0 / _2092;
    int _2114 = abs(_1756);
    int _2116 = _2104 * as_type<int>(_1908);
    int _2118 = _2116 + _2098;
    int _2120 = abs(_1996);
    int _2122 = _2110 * as_type<int>(_1936);
    int _2124 = _2122 + _2084;
    int _2126 = abs(_1772);
    float _2128 = -_863;
    float _2130 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2052);
    int _2132 = ~_2114;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    float _2138 = float(uint(_2048));
    int _2140 = abs(_2048);
    int _2142 = _2124 * _2136;
    float _2144 = 1.0 / _2138;
    int _2146 = ~_2126;
    int _2148 = _2146 + 1;
    int _2150 = _2148 + 1;
    int _2152 = _1744 * _2114;
    int _2154 = _2152 + _2142;
    float _2156 = float(uint(_2140));
    float _2158 = _869 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2160 = float(uint(_2120));
    int _2162 = _2118 * _2150;
    int _2164 = ~_1996;
    int _2166 = _2164 + 1;
    float _2168 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2170 = _869 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2172 = 1.0 / _2156;
    int _2174 = _1940 * _2126;
    int _2176 = _2174 + _2162;
    int _2178 = as_type<int>(_2112) + (-2);
    float _2180 = -_863;
    float _2182 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2170);
    float _2184 = float(uint(_2154));
    float _2186 = -_863;
    float _2188 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2158);
    int _2190 = as_type<int>(_2144) + (-2);
    float _2192 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2194 = 1.0 / _2160;
    float _2196 = as_type<float>(_2178) * _2184;
    float _2198 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2182);
    int _2200 = abs(_2176);
    float _2202 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2188);
    int _2204 = abs(_2154);
    float _2206 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2192);
    float _2208 = trunc(_2196);
    float _2210 = precise::max(_2208, 0.0);
    uint _2212 = uint(_2210);
    float _2214 = float(uint(_2176));
    float _2216 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2168);
    int _2218 = as_type<int>(_2172) + (-2);
    float _2220 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2004);
    float _2222 = as_type<float>(_2190) * _2214;
    float _2224 = float(uint(_2204));
    float _2226 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2130);
    int _2228 = as_type<int>(_2194) + (-2);
    float _2230 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2206);
    float _2232 = float(uint(_2200));
    float _2234 = trunc(_2222);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    int _2240 = ~_2140;
    int _2242 = _2240 + 1;
    float _2244 = as_type<float>(_2228) * _2224;
    float _2246 = _887 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2248 = as_type<float>(_2218) * _2232;
    float _2250 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2094);
    int _2252 = _2166 * int(_2212);
    int _2254 = _2252 + _2154;
    float _2256 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2246);
    float _2258 = trunc(_2244);
    float _2260 = precise::max(_2258, 0.0);
    uint _2262 = uint(_2260);
    float _2264 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2250);
    float _2266 = _2246;
    float _2268 = as_type<float>(_2242);
    float _2270 = _2076;
    if (_979)
    {
        float _2272 = _2070 + (-1.0);
        _2266 = _2272;
    }
    float _2274 = _2266;
    float _2276 = float(uint(_2254));
    float _2278 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2256);
    float _2280 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2220);
    int _2282 = ~_2120;
    int _2284 = _2282 + 1;
    float _2286 = _2274;
    float _2288 = _2278;
    if (_979)
    {
        float _2290 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2286 = _2290;
    }
    float _2292 = _2286;
    float _2294 = trunc(_2248);
    float _2296 = precise::max(_2294, 0.0);
    uint _2298 = uint(_2296);
    int _2300 = ~_2048;
    int _2302 = _2300 + 1;
    float _2304 = as_type<float>(_2178) * _2276;
    if (_979)
    {
        float _2306 = fma(_975, _2070, _2292);
        _995 = _2306;
    }
    float _2308 = _995;
    float _2310 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2312 = _2302 * int(_2238);
    int _2314 = _2312 + _2176;
    bool _2316 = _2048 == 0;
    int _2318 = _2284 * int(_2262);
    int _2320 = _2318 + _2204;
    float _2322 = trunc(_2304);
    float _2324 = precise::max(_2322, 0.0);
    uint _2326 = uint(_2324);
    float _2328 = float(uint(_2314));
    float _2330 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2332 = float(uint(_2320));
    float _2334 = -_195;
    int _2336 = _1980 ? as_type<int>(_2334) : as_type<int>(_195);
    int _2338 = _2242 * int(_2298);
    int _2340 = _2338 + _2200;
    if (_979)
    {
        float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2344 = _1049 + _2342;
        _2268 = _2344;
    }
    float _2346 = _2268;
    float _2348 = _2330 * _2202;
    bool _2350 = !_1838;
    float _2352 = _2350 ? _195 : as_type<float>(_2336);
    float _2354 = float(uint(_2340));
    float _2356 = as_type<float>(_2190) * _2328;
    float _2358 = _2348;
    if (_979)
    {
        float _2360 = _2346 * _2346;
        _997 = _2360;
    }
    float _2362 = _997;
    float _2364 = -_191;
    int _2366 = _2012 ? as_type<int>(_2364) : as_type<int>(_191);
    float _2368 = as_type<float>(_2228) * _2332;
    float _2370 = as_type<float>(_2218) * _2354;
    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2374 = _2308 + _2372;
    float _2376 = trunc(_2356);
    float _2378 = precise::max(_2376, 0.0);
    uint _2380 = uint(_2378);
    bool _2382 = !_1842;
    float _2384 = _2382 ? _191 : as_type<float>(_2366);
    float _2386 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2076);
    float _2388 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2216);
    float _2390 = _2388;
    if (!_979)
    {
        _2270 = _967;
    }
    float _2392 = _2270;
    float _2394 = _2330 * _2198;
    float _2396 = fma(_2310, _2386, _2348);
    float _2398 = _2392;
    float _2400 = _2396;
    if (_979)
    {
        float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2404 = _1053 + _2402;
        _2358 = _2404;
    }
    float _2406 = _2358;
    float _2408 = trunc(_2368);
    float _2410 = precise::max(_2408, 0.0);
    uint _2412 = uint(_2410);
    float _2414 = _2330 * _2226;
    float _2416 = fma(_2310, _2230, _2394);
    if (_979)
    {
        float _2418 = _2406 * _2406;
        _2398 = _2418;
    }
    float _2420 = _2398;
    bool _2422 = _2048 == 0;
    float _2424 = fma(_2310, _2388, _2414);
    out.m_80.x = _2386;
    out.m_80.y = _2230;
    out.m_80.z = _2388;
    float _2426 = trunc(_2370);
    float _2428 = precise::max(_2426, 0.0);
    uint _2430 = uint(_2428);
    float _2432 = fma(_2374, _2374, _2362);
    int _2434 = int(_2212) + int(_2326);
    int _2436 = ~_2120;
    int _2438 = _2436 + 1;
    int _2440 = int(_2238) + int(_2380);
    int _2442 = int(_2262) + int(_2412);
    float _2444 = _2432 + _2420;
    int _2446 = ~_2048;
    int _2448 = _2446 + 1;
    int _2450 = ~_1996;
    int _2452 = _2450 + 1;
    int _2454 = _2448 * _2440;
    int _2456 = _2454 + _2176;
    int _2458 = int(_2298) + int(_2430);
    int _2460 = _2438 * _2442;
    int _2462 = _2460 + _2204;
    int _2464 = ~_2140;
    int _2466 = _2464 + 1;
    int _2468 = _2452 * _2434;
    int _2470 = _2468 + _2154;
    bool _2472 = uint(_2456) >= uint(_2048);
    float _2474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2476 = uint(_2462) >= uint(_2120);
    int _2478 = _2466 * _2458;
    int _2480 = _2478 + _2200;
    bool _2482 = uint(_2470) >= uint(_1996);
    bool _2484 = !_2472;
    int _2486 = _2484 ? 0 : (-1);
    bool _2488 = !_2482;
    int _2490 = _2488 ? 0 : (-1);
    float _2492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2494 = uint(_2480) >= uint(_2140);
    int _2496 = _2154 ^ _1996;
    int _2498 = ~_2440;
    int _2500 = _2498 + _2486;
    int _2502 = _2500 + 1;
    int _2504 = ~_2434;
    int _2506 = _2504 + _2490;
    int _2508 = _2506 + 1;
    float _2510 = _2474 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2512 = !_2476;
    int _2514 = _2512 ? 0 : (-1);
    float _2516 = sqrt(_2444);
    uint _2518 = uint(int(uint(_2496) >> uint(31)));
    int _2520 = _1996 * _2508;
    int _2522 = _2520 + _2154;
    int _2524 = _2176 ^ _2048;
    int _2526 = _2048 * _2502;
    int _2528 = _2526 + _2176;
    bool _2530 = _1996 == 0;
    float _2532 = _2492 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2534 = _1996 == 0;
    int _2536 = ~_2514;
    int _2538 = _2442 + _2536;
    int _2540 = _2538 + 1;
    float _2542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2544 = ~int(_2518);
    int _2546 = _2544 + 1;
    bool _2548 = !_2494;
    int _2550 = _2548 ? 0 : (-1);
    uint _2552 = uint(int(uint(_2524) >> uint(31)));
    int _2554 = _2540 ^ _2546;
    float _2556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2558 = !_2530;
    int _2560 = _2558 ? _2522 : (-1);
    int _2562 = ~_2550;
    int _2564 = _2458 + _2562;
    int _2566 = _2564 + 1;
    int _2568 = ~int(_2552);
    int _2570 = _2568 + 1;
    int _2572 = ~_2546;
    int _2574 = _2572 + _2554;
    int _2576 = _2574 + 1;
    float _2578 = fma(_2330, _2330, 1.0);
    float _2580 = float(_2560);
    int _2582 = _2566 ^ _2570;
    bool _2584 = !_2316;
    int _2586 = _2584 ? _2528 : (-1);
    float _2588 = fma(_2510, _2580, _611);
    float _2590 = rsqrt(_2578);
    int _2592 = ~_2570;
    int _2594 = _2592 + _2582;
    int _2596 = _2594 + 1;
    float _2598 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2600 = !_2534;
    int _2602 = _2600 ? _2576 : (-1);
    float _2604 = _2556 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2606 = float(_2586);
    float _2608 = _2080 + 0.5;
    float _2610 = float(_2602);
    out.m_82.x = _1063;
    out.m_82.y = _1065;
    out.m_82.z = _1067;
    bool _2612 = _2516 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2614 = isnan(_2516);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2620 = _2616 || _2618;
    float _2622 = fma(_2598, _2606, _673);
    bool _2624 = !_2422;
    int _2626 = _2624 ? _2596 : (-1);
    float _2628 = -_363;
    float _2630 = fma(_2532, _2610, _2628);
    float _2632 = _2384 + 0.5;
    float _2634 = fma(_2510, _2608, _2588);
    float _2636 = float(_2626);
    float _2638 = _2352 + (-0.5);
    float _2640 = fma(_2598, _2632, _2622);
    float _2642 = _2330 * _2590;
    float _2644 = -_1095;
    float _2646 = fma(_2080, _2644, _2634);
    float _2648 = -_675;
    float _2650 = fma(_2604, _2636, _2648);
    float _2652 = _2074 + (-0.5);
    float _2654 = -_2532;
    float _2656 = fma(_2654, _2638, _2630);
    float _2658 = -_2264;
    float _2660 = _2642 * _2658;
    float _2662 = -_2278;
    float _2664 = _2642 * _2662;
    float _2666 = -_2280;
    float _2668 = _2642 * _2666;
    float _2670 = -_2604;
    float _2672 = fma(_2670, _2652, _2650);
    float _2674 = fma(_2590, _2202, _2660);
    float _2676 = fma(_2590, _2198, _2664);
    float _2678 = -_1085;
    float _2680 = fma(_2384, _2678, _2640);
    float _2682 = fma(_2352, _1081, _2656);
    float _2684 = fma(_2590, _2226, _2668);
    float _2686 = _2264 + _2396;
    float _2688 = fma(_2074, _1105, _2672);
    float _2690 = _2278 + _2416;
    float _2692 = _2280 + _2424;
    out.m_84.x = _2674;
    out.m_84.y = _2676;
    out.m_84.z = _2684;
    if (!_2620)
    {
        _2288 = 1.0;
    }
    float _2694 = _2288;
    out.m_86.x = _2646;
    out.m_86.y = _2682;
    out.m_86.z = _2680;
    out.m_86.w = _2688;
    out.m_88.x = _2686;
    out.m_88.y = _2690;
    out.m_88.z = _2692;
    bool _2696 = !_2620;
    float _2698 = _2694;
    if (!_2696)
    {
        bool _2700 = _2516 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2702 = isnan(_2516);
        bool _2704 = _2700 || _2702;
        bool _2706 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2708 = _2704 || _2706;
        if (!_2708)
        {
            float _2710 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2712 = _2516 + _2710;
            float _2714 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2716 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2714;
            float _2718 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2722 = 1.0 / _2716;
            float _2724 = _2712 * _2722;
            float _2726 = fma(_2724, _2720, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2698 = _2726;
            _2728 = true;
        }
        else
        {
            bool _2730 = _2516 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2732 = isnan(_2516);
            bool _2734 = _2730 || _2732;
            bool _2736 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2738 = _2734 || _2736;
            if (!_2738)
            {
                float _2740 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2742 = _2516 + _2740;
                float _2744 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2746 = _2744 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2748 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2750 = _2748 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2752 = 1.0 / _2746;
                float _2754 = _2742 * _2752;
                float _2756 = fma(_2754, _2750, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2698 = _2756;
                _2728 = true;
            }
            else
            {
                _2698 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2728 = false;
    float _2758 = _2698;
    float _2760 = fma(_933, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2762 = fma(_935, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2764 = floor(_2760);
    float _2766 = floor(_2762);
    float _2768 = -_2764;
    float _2770 = _2760 + _2768;
    float _2772 = -_2766;
    float _2774 = _2762 + _2772;
    float2 _8185 = float2(_2770, _2774);
    float _2776 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8185, float2(0.0), isnan(_8185)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8185, float2(0.0), isnan(_8185)), level(0.0)).x;
    float _2778 = _969 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2780 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2782 = _1049 + _2780;
    float _2784 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2778);
    float _2786 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2788 = _1053 + _2786;
    float _2790 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2792 = fma(_2782, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2794 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2784);
    float _2796 = _969 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2798 = _969 + _2790;
    float _2800 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2802 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2796);
    float _2804 = fma(_2788, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2806 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2808 = 1.0 / _2800;
    float _2810 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2802);
    float _2812 = fma(_933, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2806);
    float _2814 = _2810 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2816 = _2814 + _2800;
    float _2818 = _2816 * _2808;
    float _2820 = _2818 * 0.5;
    float _2822 = fma(_935, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2812);
    float _2824 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2826 = fma(_2820, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2824);
    float _2828 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2830 = 1.0 / _2826;
    bool _2832 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2834 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2836 = _2832 || _2834;
    bool _2838 = isnan(0.5);
    bool _2840 = _2836 || _2838;
    float _2842 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2844 = _2308 + _2842;
    float _2846 = fma(_2844, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2848 = trunc(_2828);
    int _2850 = int(_2848);
    float _2852 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2854 = fma(_933, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2852);
    float _2856 = _2844;
    int _2858 = 2;
    int _2860 = as_type<int>(_2758);
    if (_2840)
    {
        _2856 = _2846;
    }
    float _2862 = _2856;
    float _2864 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2866 = _2830 * _2864;
    float _2868 = fma(_935, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2854);
    float _2870 = _2862;
    if (_2840)
    {
        _2390 = _2804;
    }
    float _2872 = _2390;
    bool _2874 = _2866 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2876 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2878 = _2866 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2880 = !_2874;
    int _2882 = _2880 ? 0 : 1;
    float _2884 = trunc(_2876);
    int _2886 = int(_2884);
    int _2888 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2890 = _2850 + _2888;
    int _2892 = _2890 + 1;
    float _2894 = _2872;
    if (!_2874)
    {
        _2858 = 1;
    }
    int _2896 = _2858;
    int _2898 = _2896;
    if (!_2878)
    {
        _2898 = _2882;
    }
    int _2900 = _2898;
    bool _2902 = _2892 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2904 = _2900 << 6;
    int _2906 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2908 = _2886 + _2906;
    int _2910 = _2908 + 1;
    int _2912 = _2904 + 48;
    uint _2914 = uint(int(uint(_2912) >> uint(2)));
    uint _2916 = uint(int(uint(int(_2914)) >> uint(2)));
    int _2918 = int(_2914) & 3;
    float _2920 = (*spvDescriptorSet0.vp_c15)._m0[int(_2916)][_2918];
    int _2922 = int(_2914) + 1;
    uint _2924 = uint(int(uint(_2922) >> uint(2)));
    int _2926 = _2922 & 3;
    float _2928 = (*spvDescriptorSet0.vp_c15)._m0[int(_2924)][_2926];
    int _2930 = _2892 | _2910;
    bool _2932 = _2930 < 0;
    bool _2934 = _2932 || _2902;
    int _2936 = _2904 + 56;
    uint _2938 = uint(int(uint(_2936) >> uint(2)));
    uint _2940 = uint(int(uint(int(_2938)) >> uint(2)));
    int _2942 = int(_2938) & 3;
    float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
    int _2946 = int(_2938) + 1;
    uint _2948 = uint(int(uint(_2946) >> uint(2)));
    int _2950 = _2946 & 3;
    float _2952 = (*spvDescriptorSet0.vp_c15)._m0[int(_2948)][_2950];
    float _2954 = as_type<float>(_2930);
    float _2956 = as_type<float>(_2900);
    if (_2840)
    {
        _2954 = _2792;
    }
    float _2958 = _2954;
    bool _2960 = _2910 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2962 = _2960 || _2934;
    int _2964 = _2904 + 64;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    int _2982 = _2904 + 72;
    uint _2984 = uint(int(uint(_2982) >> uint(2)));
    uint _2986 = uint(int(uint(int(_2984)) >> uint(2)));
    int _2988 = int(_2984) & 3;
    float _2990 = (*spvDescriptorSet0.vp_c15)._m0[int(_2986)][_2988];
    int _2992 = int(_2984) + 1;
    uint _2994 = uint(int(uint(_2992) >> uint(2)));
    int _2996 = _2992 & 3;
    float _2998 = (*spvDescriptorSet0.vp_c15)._m0[int(_2994)][_2996];
    int _3000 = _2904 + 96;
    uint _3002 = uint(int(uint(_3000) >> uint(2)));
    uint _3004 = uint(int(uint(int(_3002)) >> uint(2)));
    int _3006 = int(_3002) & 3;
    float _3008 = (*spvDescriptorSet0.vp_c15)._m0[int(_3004)][_3006];
    int _3010 = int(_3002) + 1;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    int _3014 = _3010 & 3;
    float _3016 = (*spvDescriptorSet0.vp_c15)._m0[int(_3012)][_3014];
    int _3018 = _2904 + 104;
    uint _3020 = uint(int(uint(_3018) >> uint(2)));
    uint _3022 = uint(int(uint(int(_3020)) >> uint(2)));
    int _3024 = int(_3020) & 3;
    float _3026 = (*spvDescriptorSet0.vp_c15)._m0[int(_3022)][_3024];
    int _3028 = int(_3020) + 1;
    uint _3030 = uint(int(uint(_3028) >> uint(2)));
    int _3032 = _3028 & 3;
    float _3034 = (*spvDescriptorSet0.vp_c15)._m0[int(_3030)][_3032];
    float _3036 = _2958;
    int _3038 = as_type<int>(_3026);
    if (!_2840)
    {
        float _3040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3042 = _969 + _3040;
        float _3044 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3046 = _933 + _3044;
        float _3048 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3050 = _3042 * _3042;
        float _3052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3054 = _935 + _3052;
        float _3056 = fma(_3046, _3046, _3050);
        float _3058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3060 = fma(_3054, _3054, _3056);
        float _3062 = sqrt(_3060);
        float _3064 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3066 = -_969;
        float _3068 = _3066 + _2846;
        float _3070 = precise::min(_3062, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3072 = _3070 * _3058;
        float _3074 = -_935;
        float _3076 = _3074 + _2804;
        float _3078 = _3064 * _3072;
        float _3080 = -_933;
        float _3082 = _3080 + _2792;
        float _3084 = fma(_3068, _3078, _969);
        float _3086 = fma(_3082, _3078, _933);
        float _3088 = fma(_3076, _3078, _935);
        _2870 = _3084;
        _3036 = _3086;
        _2894 = _3088;
        _2860 = as_type<int>(_3068);
    }
    float _3090 = _2870;
    float _3092 = _3036;
    float _3094 = _2894;
    int _3096 = _2860;
    float _3098 = _2798 * _3016;
    float _3100 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3102 = _3096;
    if (!_2962)
    {
        int _3104 = _2910 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3106 = _3104 + _2892;
        _3102 = _3106;
    }
    int _3108 = _3102;
    float _3110 = _2798 * _2928;
    float _3112 = fma(_933, _3008, _3098);
    float _3114 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3100);
    float _3116 = _2798 * _2980;
    float _3118 = fma(_933, _2920, _3110);
    float _3120 = fma(_935, _3026, _3112);
    float _3122 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3114);
    int _3124 = as_type<int>(_3122);
    float _3126 = as_type<float>(_3108);
    if (!_2962)
    {
        int _3128 = _3108 << 2;
        _3038 = _3128;
    }
    int _3130 = _3038;
    float _3132 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3134 = _3120 + _3034;
    float _3136 = _3122 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3138 = fma(_933, _2972, _3116);
    int _3140 = _3130;
    int _3142 = as_type<int>(_3132);
    if (!_2962)
    {
        uint _3144 = uint(int(uint(_3108) >> uint(2)));
        _3124 = int(_3144);
    }
    int _3146 = _3124;
    float _3148 = fma(_935, _2944, _3118);
    float _3150 = _3136 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3152 = 1.0 / _3134;
    if (!_2962)
    {
        int _3154 = 12 & _3130;
        _3140 = _3154;
    }
    int _3156 = _3140;
    int _3158 = _2904 + 80;
    uint _3160 = uint(int(uint(_3158) >> uint(2)));
    uint _3162 = uint(int(uint(int(_3160)) >> uint(2)));
    int _3164 = int(_3160) & 3;
    float _3166 = (*spvDescriptorSet0.vp_c15)._m0[int(_3162)][_3164];
    int _3168 = int(_3160) + 1;
    uint _3170 = uint(int(uint(_3168) >> uint(2)));
    int _3172 = _3168 & 3;
    float _3174 = (*spvDescriptorSet0.vp_c15)._m0[int(_3170)][_3172];
    float _3176 = -_3150;
    float _3178 = fma(_3176, _3132, 1.0);
    float _3180 = fma(_935, _2990, _3138);
    if (!_2962)
    {
        int _3182 = _3146 << 4;
        int _3184 = _3182 + _3156;
        _3142 = _3184;
    }
    int _3186 = _3142;
    float _3188 = _3148 + _2952;
    float _3190 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3192 = _3180 + _2998;
    float _3194 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _3196 = _2904 + 88;
    uint _3198 = uint(int(uint(_3196) >> uint(2)));
    uint _3200 = uint(int(uint(int(_3198)) >> uint(2)));
    int _3202 = int(_3198) & 3;
    float _3204 = (*spvDescriptorSet0.vp_c15)._m0[int(_3200)][_3202];
    int _3206 = int(_3198) + 1;
    uint _3208 = uint(int(uint(_3206) >> uint(2)));
    int _3210 = _3206 & 3;
    float _3212 = (*spvDescriptorSet0.vp_c15)._m0[int(_3208)][_3210];
    float _3214 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3190);
    float _3216 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3218 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3194);
    float _3220 = _2804;
    float _3222 = _3192;
    if (!_2962)
    {
        float _3224 = floor(_2876);
        _3220 = _3224;
    }
    float _3226 = _3220;
    float _3228 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3214);
    float _3230 = _3188 * _3152;
    float _3232 = _3192 * _3152;
    float _3234 = _3188;
    float _3236 = _3152;
    if (!_2962)
    {
        int _3238 = _3186 + 400;
        uint _3240 = uint(int(uint(_3238) >> uint(2)));
        uint _3242 = uint(int(uint(int(_3240)) >> uint(2)));
        int _3244 = int(_3240) & 3;
        float _3246 = (*spvDescriptorSet0.vp_c15)._m0[int(_3242)][_3244];
        _3234 = _3246;
    }
    float _3248 = _3234;
    float _3250 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3218);
    float _3252 = _3228 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3254 = _3230 >= 0.0;
    float _3256 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3216);
    float _3258 = _3250 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3260 = _3252 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3262 = _3230 <= 1.0;
    bool _3264 = _3262 && _3254;
    float _3266 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3256);
    float _3268 = log2(_3178);
    float _3270 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3260);
    bool _3272 = _3232 >= 0.0;
    bool _3274 = _3272 && _3264;
    float _3276 = _3266 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3278 = _3252 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3280 = fma(_3136, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3270);
    bool _3282 = _3232 <= 1.0;
    bool _3284 = _3282 && _3274;
    float _3286 = _3252 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3288 = _2846;
    if (!_2962)
    {
        float _3290 = floor(_2828);
        _3288 = _3290;
    }
    float _3292 = _3288;
    float _3294 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3280);
    float _3296 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3278);
    float _3298 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3286);
    float _3300 = _3226;
    if (!_2962)
    {
        float _3302 = -_3226;
        float _3304 = _2876 + _3302;
        _3300 = _3304;
    }
    float _3306 = _3300;
    float _3308 = fma(_3136, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3296);
    float _3310 = fma(_3136, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3298);
    float _3312 = 1.0 / _3294;
    float _3314 = _3268 * 0.693147182464599609375;
    float _3316 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3308);
    if (_3284)
    {
        float _3318 = float(_2900);
        _2956 = _3318;
    }
    float _3320 = _2956;
    float _3322 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3310);
    float _3324 = _2798 * _3174;
    if (!_2962)
    {
        float _3326 = -_3292;
        float _3328 = _2828 + _3326;
        _3222 = _3328;
    }
    float _3330 = _3222;
    float _3332 = _3320;
    if (_3284)
    {
        float _3334 = rint(_3320);
        float _3336 = precise::max(_3334, 0.0);
        uint _3338 = uint(_3336);
        uint _3340 = clamp(_3338, 0u, 65535u);
        _3332 = as_type<float>(_3340);
    }
    float _3342 = _3332;
    float _3344 = fma(_933, _3166, _3324);
    float _3346 = _3314 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3348 = fma(_935, _3204, _3344);
    float _3350 = _3322 * _3312;
    float _3352 = _3348 + _3212;
    float _3354 = _3316 * _3312;
    float _3356 = fma(_3350, -0.5, 0.5);
    float _3358 = _3308;
    if (!_2962)
    {
        float _3360 = rint(_3248);
        float _3362 = precise::max(_3360, 0.0);
        uint _3364 = uint(_3362);
        uint _3366 = clamp(_3364, 0u, 65535u);
        _3358 = as_type<float>(_3366);
    }
    float _3368 = _3358;
    float _3370 = _3352 * _3152;
    float _3372 = fma(_3354, 0.5, 0.5);
    float _3374 = _3232;
    float _3376 = _3370;
    if (_3284)
    {
        float3 _9211 = float3(_3230, _3232, float(as_type<int>(_3342)));
        float3 _9215 = select(_9211, float3(0.0), isnan(_9211));
        float _3378 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9215.xy, uint(rint(_9215.z)), _3370, level(0.0));
        _3374 = _3378;
    }
    float _3380 = _3374;
    float3 _9225 = float3(_3372, _3356, _3346);
    float _3382 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9225, float3(0.0), isnan(_9225)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9225, float3(0.0), isnan(_9225)), level(0.0)).x;
    float3 _9234 = float3(_3372, _3356, _3346);
    float4 _3385 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9234, float3(0.0), isnan(_9234)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9234, float3(0.0), isnan(_9234)), level(0.0)).xyzw;
    float _3387 = _3385.x;
    float _3389 = _3385.y;
    float _3391 = _3385.z;
    float _3393 = _3385.w;
    float _3395 = _3330;
    float _3397 = _3368;
    if (!_2962)
    {
        float3 _9258 = float3(_3330, _3306, float(as_type<int>(_3368)));
        float3 _9260 = select(_9258, float3(0.0), isnan(_9258));
        float _3399 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9260.xy, uint(rint(_9260.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9260.xy, uint(rint(_9260.z)), level(0.0)).x;
        _3395 = _3399;
    }
    float _3401 = _3395;
    if (_2962)
    {
        _3236 = 1.0;
    }
    float _3403 = _3236;
    float _3405 = _3403;
    if (!_2962)
    {
        int _3407 = _3108 << 4;
        int _3409 = _3407 + 2048;
        uint _3411 = uint(int(uint(_3409) >> uint(2)));
        uint _3413 = uint(int(uint(int(_3411)) >> uint(2)));
        int _3415 = int(_3411) & 3;
        float _3417 = (*spvDescriptorSet0.vp_c15)._m0[int(_3413)][_3415];
        int _3419 = int(_3411) + 1;
        uint _3421 = uint(int(uint(_3419) >> uint(2)));
        int _3423 = _3419 & 3;
        float _3425 = (*spvDescriptorSet0.vp_c15)._m0[int(_3421)][_3423];
        int _3427 = _3409 + 8;
        uint _3429 = uint(int(uint(_3427) >> uint(2)));
        uint _3431 = uint(int(uint(int(_3429)) >> uint(2)));
        int _3433 = int(_3429) & 3;
        float _3435 = (*spvDescriptorSet0.vp_c15)._m0[int(_3431)][_3433];
        int _3437 = int(_3429) + 1;
        uint _3439 = uint(int(uint(_3437) >> uint(2)));
        int _3441 = _3437 & 3;
        float _3443 = (*spvDescriptorSet0.vp_c15)._m0[int(_3439)][_3441];
        float _3445 = _2798 * _3425;
        float _3447 = fma(_933, _3417, _3445);
        float _3449 = fma(_935, _3435, _3447);
        float _3451 = _3449 + _3443;
        float _3453 = precise::clamp(_3451, 0.0, 1.0);
        float _3455 = -_3453;
        float _3457 = _3455 + _3401;
        float _3459 = fma(_3457, 500.0, 1.5);
        float _3461 = exp2(_3459);
        float _3463 = 0.0 + _3461;
        float _3465 = precise::clamp(_3463, 0.0, 1.0);
        _3126 = as_type<float>(_3409);
        _3405 = _3465;
    }
    float _3467 = _3126;
    float _3469 = _3405;
    float _3471 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3473 = _3090 + _3471;
    float _3475 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3477 = _3092 + _3475;
    float _3479 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3481 = _3094 + _3479;
    float _3483 = _3473 * _3473;
    float _3485 = fma(_3477, _3477, _3483);
    float _3487 = fma(_3481, _3481, _3485);
    float _3489 = rsqrt(_3487);
    float _3491 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3493 = _3477 * _3491;
    float _3495 = _3481 * _3491;
    float _3497 = _3493 * _3493;
    float _3499 = _3495 * _3495;
    float _3501 = _3497 + _3499;
    float _3503 = sqrt(_3501);
    bool _3505 = _3503 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3507 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3509 = _3503 + _3507;
    float _3511 = _3481;
    float _3513 = _3467;
    float _3515 = _3509;
    float _3517 = _3473;
    if (_3505)
    {
        float _3519 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3511 = _3519;
    }
    float _3521 = _3511;
    if (_3505)
    {
        float _3523 = rsqrt(_3501);
        _3513 = _3523;
    }
    float _3525 = _3513;
    float _3527 = _3525;
    if (_3505)
    {
        float _3529 = _3509 * _3521;
        _3515 = _3529;
    }
    float _3531 = _3515;
    if (_3505)
    {
        float _3533 = _3531 * 0.15915493667125701904296875;
        _3397 = _3533;
    }
    float _3535 = _3397;
    float _3537 = _3489;
    float _3539 = _3535;
    if (_3505)
    {
        float _3541 = _3535 * 6.283185482025146484375;
        float _3543 = sin(_3541);
        _3537 = _3543;
    }
    float _3545 = _3537;
    float _3547 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3549 = precise::max(0.0, _3547);
    float _3551 = _3485;
    float _3553 = _3549;
    float _3555 = _3547;
    if (_3505)
    {
        float _3557 = _3535 * 6.283185482025146484375;
        float _3559 = cos(_3557);
        _3551 = _3559;
    }
    float _3561 = _3551;
    float _3563 = -_3491;
    float _3565 = -_3549;
    float _3567 = fma(_3473, _3563, _3565);
    if (!_3505)
    {
        _3553 = _3495;
    }
    float _3569 = _3553;
    float _3571 = _3569;
    if (_3505)
    {
        float _3573 = _3567 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3555 = _3573;
    }
    float _3575 = _3555;
    float _3577 = _3545;
    float _3579 = _3575;
    if (_3505)
    {
        float _3581 = fma(_3545, _3575, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3517 = _3581;
    }
    float _3583 = _3517;
    float _3585 = _3583;
    if (!_3505)
    {
        _3577 = _3493;
    }
    float _3587 = _3577;
    float _3589 = _3587;
    float _3591 = _3561;
    if (_3505)
    {
        float _3593 = _3561 + (-1.0);
        _3579 = _3593;
    }
    float _3595 = _3579;
    if (_3505)
    {
        float _3597 = _3525 * _3583;
        _2400 = _3597;
    }
    float _3599 = _2400;
    if (!_3505)
    {
        _3585 = _3567;
    }
    float _3601 = _3585;
    float _3603 = _3601;
    if (_3505)
    {
        float _3605 = _3595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3539 = _3605;
    }
    float _3607 = _3539;
    if (_3505)
    {
        float _3609 = _3493 * _3599;
        _3589 = _3609;
    }
    float _3611 = _3589;
    if (!_3505)
    {
        _3527 = _3497;
    }
    float _3613 = _3527;
    float _3615 = _3613;
    if (_3505)
    {
        float _3617 = _3495 * _3599;
        _3571 = _3617;
    }
    float _3619 = _3571;
    if (_3505)
    {
        float _3621 = fma(_3567, _3561, _3607);
        _3603 = _3621;
    }
    float _3623 = _3603;
    if (_3505)
    {
        float _3625 = _3611 * _3611;
        _3615 = _3625;
    }
    float _3627 = _3615;
    if (!_3505)
    {
        _3591 = _3499;
    }
    float _3629 = _3591;
    float _3631 = _3629;
    if (_3505)
    {
        float _3633 = _3619 * _3619;
        _3631 = _3633;
    }
    float _3635 = _3631;
    float _3637 = sqrt(_3487);
    float _3639 = fma(_3623, _3623, _3627);
    float _3641 = _3639 + _3635;
    float _3643 = rsqrt(_3641);
    float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3647 = fma(_3637, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3645);
    float _3649 = precise::clamp(_3647, 0.0, 1.0);
    float _3651 = -_3649;
    float _3653 = _3651 + 1.0;
    float _3655 = _3643 * _3611;
    float _3657 = _3643 * _3623;
    float _3659 = _3643 * _3619;
    float _3661 = abs(_3653);
    float _3663 = log2(_3661);
    float _3665 = _3655 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3667 = -_3665;
    float _3669 = fma(_3657, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3667);
    float _3671 = -_3659;
    float _3673 = fma(_3671, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3669);
    float _3675 = fma(_3673, -0.5, 0.5);
    float _3677 = fma(_3673, 0.5, 0.5);
    float _3679 = _3663 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3681 = fma(_3677, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3683 = sqrt(_3675);
    float _3685 = fma(_3677, _3681, -0.212114393711090087890625);
    float _3687 = _3657 + 1.0;
    float _3689 = fma(_3677, _3685, 1.570728778839111328125);
    float _3691 = exp2(_3679);
    float _3693 = _3683 * 0.636619746685028076171875;
    float _3695 = -_3657;
    float _3697 = fma(_3691, _3687, _3695);
    float _3699 = -_3689;
    float _3701 = fma(_3693, _3699, 1.0);
    float _3703 = fma(_3697, 0.5, 0.5);
    float2 _9733 = float2(_3701, _3703);
    float3 _3705 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9733, float2(0.0), isnan(_9733)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9733, float2(0.0), isnan(_9733)), level(0.0)).xyz;
    float _3707 = _3705.x;
    float _3709 = _3705.y;
    float _3711 = _3705.z;
    float _3713 = abs(_2866);
    float _3715 = log2(_3713);
    float _3717 = _3252 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3719 = -_2776;
    float _3721 = _3719 + 1.0;
    out.m_90.x = _3092;
    out.m_90.y = _3090;
    out.m_90.z = _3094;
    float _3723 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3717);
    bool _3725 = _2866 <= 8000.0;
    bool _3727 = isnan(_2866);
    bool _3729 = _3725 || _3727;
    bool _3731 = isnan(8000.0);
    bool _3733 = _3729 || _3731;
    float _3735 = float(_3733);
    float _3737 = _3715 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3739 = fma(_3136, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3723);
    float _3741 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3739);
    float _3743 = exp2(_3737);
    float _3745 = fma(_3743, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3747 = precise::clamp(_3745, 0.0, 1.0);
    float _3749 = fma(_3747, -2.0, 3.0);
    float _3751 = _3747 * _3747;
    float _3753 = _3751 * _3749;
    float _3755 = _3663 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3757 = -_3753;
    float _3759 = _3757 + 1.0;
    float _3761 = exp2(_3755);
    float _3763 = fma(_3759, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3753);
    float _3765 = _3741 + _3294;
    float _3767 = _3735 * _3763;
    float _3769 = _3765 * 0.5;
    float _3771 = _3765;
    if (!_3284)
    {
        _3771 = 1.0;
    }
    float _3773 = _3771;
    out.gl_Position.x = _3316;
    out.gl_Position.y = _3322;
    out.gl_Position.z = _3741;
    out.gl_Position.w = _3294;
    float _3775 = _3767 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3777 = _3773;
    if (_3284)
    {
        bool _3779 = _3380 >= _3370;
        bool _3781 = isnan(_3380);
        bool _3783 = _3779 || _3781;
        bool _3785 = isnan(_3370);
        bool _3787 = _3783 || _3785;
        float _3789 = float(_3787);
        _3777 = _3789;
    }
    float _3791 = _3777;
    out.m_92.z = _3769;
    out.m_92.w = _3294;
    float _3793 = _3721 * _3775;
    float _3795 = precise::clamp(_3793, 0.0, 1.0);
    bool _3797 = _3637 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3799 = isnan(_3637);
    bool _3801 = _3797 || _3799;
    bool _3803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3805 = _3801 || _3803;
    float _3807 = _3791 * _3469;
    float _3809 = -_3761;
    float _3811 = _3809 + 1.0;
    float _3813 = -_3795;
    float _3815 = fma(_3813, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3817 = _3811 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3819 = -_3807;
    float _3821 = fma(_3819, _3815, 1.0);
    float _3823 = precise::clamp(_3821, 0.0, 1.0);
    float _3825 = _3817 * _3382;
    float _3827 = -_3817;
    float _3829 = _3827 + 1.0;
    float _3831 = _3823 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3833 = _3807;
    float _3835 = _3829;
    float _3837 = _3823;
    float _3839 = _3825;
    if (!_3805)
    {
        _3376 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3841 = _3376;
    float _3843 = _3393 * _3825;
    float _3845 = _3393 * _3829;
    float _3847 = _3843;
    float _3849 = _3841;
    float _3851 = _3841;
    if (!_3805)
    {
        _3833 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3853 = _3833;
    out.m_94.x = _3831;
    float _3855 = _3853;
    float _3857 = _3853;
    if (!_3805)
    {
        _3835 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3859 = _3835;
    float _3861 = _3859;
    float _3863 = _3859;
    if (!_3805)
    {
        _3837 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3865 = _3837;
    float _3867 = _3711 * _3825;
    float _3869 = fma(_3707, _3843, _3387);
    float _3871 = fma(_3709, _3843, _3389);
    float _3873 = _3865;
    float _3875 = _3865;
    if (!_3805)
    {
        _3847 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3877 = _3847;
    float _3879 = fma(_3393, _3867, _3391);
    float _3881 = _3877;
    float _3883 = _3877;
    if (!_3805)
    {
        _3839 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3885 = _3839;
    out.m_96.x = _3869;
    out.m_96.y = _3871;
    out.m_96.z = _3879;
    out.m_96.w = _3845;
    bool _3887 = !_3805;
    float _3889 = _3885;
    float _3891 = _3885;
    if (!_3887)
    {
        bool _3893 = _3637 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3895 = isnan(_3637);
        bool _3897 = _3893 || _3895;
        bool _3899 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3901 = _3897 || _3899;
        if (!_3901)
        {
            float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3905 = _3637 + _3903;
            float _3907 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3909 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3907;
            float _3911 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3913 = _3911 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3915 = 1.0 / _3909;
            float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3919 = _3917 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3923 = _3921 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3931 = _3929 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3933 = _3905 * _3915;
            float _3935 = precise::clamp(_3933, 0.0, 1.0);
            float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3939 = _3937 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3941 = fma(_3935, _3913, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3943 = fma(_3935, _3939, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3945 = fma(_3935, _3919, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3947 = fma(_3935, _3923, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3949 = fma(_3935, _3927, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3951 = fma(_3935, _3931, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3891 = _3941;
            _3863 = _3949;
            _3883 = _3945;
            _3857 = _3947;
            _3851 = _3943;
            _3875 = _3951;
            _3953 = true;
        }
        else
        {
            bool _3955 = _3637 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3957 = isnan(_3637);
            bool _3959 = _3955 || _3957;
            bool _3961 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3963 = _3959 || _3961;
            if (!_3963)
            {
                _3881 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3965 = _3881;
            _3883 = _3965;
            if (!_3963)
            {
                _3889 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3967 = _3889;
            _3891 = _3967;
            if (!_3963)
            {
                _3849 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3969 = _3849;
            _3851 = _3969;
            if (!_3963)
            {
                _3855 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3971 = _3855;
            _3857 = _3971;
            if (!_3963)
            {
                _3861 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3973 = _3861;
            _3863 = _3973;
            if (!_3963)
            {
                _3873 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3975 = _3873;
            bool _3977 = !_3963;
            _3875 = _3975;
            if (!_3977)
            {
                bool _3979 = _3637 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3981 = isnan(_3637);
                bool _3983 = _3979 || _3981;
                bool _3985 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3987 = _3983 || _3985;
                if (!_3987)
                {
                    float _3989 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3991 = _3637 + _3989;
                    float _3993 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3995 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3993;
                    float _3997 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3999 = _3997 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4001 = 1.0 / _3995;
                    float _4003 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4005 = _4003 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4007 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4009 = _4007 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4017 = _4015 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4019 = _3991 * _4001;
                    float _4021 = precise::clamp(_4019, 0.0, 1.0);
                    float _4023 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4025 = _4023 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4027 = fma(_4021, _3999, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4029 = fma(_4021, _4025, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4031 = fma(_4021, _4005, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4033 = fma(_4021, _4009, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4035 = fma(_4021, _4013, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4037 = fma(_4021, _4017, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3891 = _4027;
                    _3863 = _4035;
                    _3883 = _4031;
                    _3857 = _4033;
                    _3851 = _4029;
                    _3875 = _4037;
                    _3953 = true;
                }
                else
                {
                    _3891 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3863 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3883 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3857 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3851 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3875 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3953 = false;
    float _4039 = _3891;
    float _4041 = _3863;
    float _4043 = _3883;
    float _4045 = _3857;
    float _4047 = _3851;
    float _4049 = _3875;
    float _4051 = fma(_2690, -0.5, 0.5);
    float _4053 = precise::clamp(_4051, 0.0, 1.0);
    float _4055 = -_4039;
    float _4057 = _4055 + _4041;
    float _4059 = -_4043;
    float _4061 = _4059 + _4045;
    float _4063 = -_4047;
    float _4065 = _4063 + _4049;
    bool _4067 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4069 = fma(_4053, _4057, _4039);
    float _4071 = fma(_4053, _4061, _4043);
    float _4073 = fma(_4053, _4065, _4047);
    float _4075 = _4069 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _4077 = fma(_4071, 0.298911988735198974609375, _4075);
    float _4079 = fma(_4073, 0.114477999508380889892578125, _4077);
    out.m_98.x = 0.0;
    float _4081 = -_4079;
    float _4083 = _4071 + _4081;
    float _4085 = -_4079;
    float _4087 = _4069 + _4085;
    float _4089 = -_4079;
    float _4091 = _4073 + _4089;
    float _4093 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4095 = fma(_4083, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    float _4097 = fma(_4087, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    float _4099 = fma(_4091, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    out.m_94.w = _4093;
    out.m_100.x = _4095;
    out.m_100.y = _4097;
    out.m_100.z = _4099;
    if (!_4067)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4101 = -_3090;
    float _4103 = _4101 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4105 = -_3092;
    float _4107 = _4105 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4109 = -_3094;
    float _4111 = _4109 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4113 = _4103 * _4103;
    float _4115 = fma(_4107, _4107, _4113);
    float _4117 = fma(_4111, _4111, _4115);
    float _4119 = sqrt(_4117);
    float _4121 = rsqrt(_4117);
    float _4123 = -_4119;
    float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4127 = _4125 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4129 = precise::clamp(_4127, 0.0, 1.0);
    float _4131 = _4107 * _4121;
    float _4133 = _4103 * _4121;
    float _4135 = abs(_4129);
    float _4137 = log2(_4135);
    float _4139 = _4111 * _4121;
    float _4141 = _4131 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4143 = _2690 * _4133;
    float _4145 = -_4133;
    float _4147 = -_4141;
    float _4149 = fma(_4145, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4147);
    float _4151 = fma(_2686, _4131, _4143);
    float _4153 = -_4139;
    float _4155 = fma(_4153, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4149);
    float _4157 = fma(_2692, _4139, _4151);
    float _4159 = precise::clamp(_4157, 0.0, 1.0);
    float _4161 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4163 = _4155 + _4161;
    float _4165 = _4137 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4167 = _4163 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4169 = precise::clamp(_4167, 0.0, 1.0);
    float _4171 = exp2(_4165);
    float _4173 = _4171 * _4169;
    float _4175 = _4159 * _4173;
    float _4177 = _4175 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4179 = _4175 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4181 = _4175 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4177;
    out.m_98.y = _4179;
    out.m_98.z = _4181;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3953 = false;
    bool _2728 = false;
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
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4239 = as_type<float>(_137);
        out.gl_Position.z = _4239;
    }
    if (!_123)
    {
        return out;
    }
    float _139 = in.m_65.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _131 = _157;
    }
    float _159 = _131;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_63.x = 0.0;
    }
    int _171 = 0;
    if (_165)
    {
        float _173 = _169 * 5.0;
        _171 = as_type<int>(_173);
    }
    int _175 = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4309 = as_type<float>(_175);
        out.gl_Position.z = _4309;
    }
    if (_165)
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
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
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
        float _223 = _153 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = in.m_70.x;
    float _229 = in.m_70.y;
    float _231 = in.m_70.z;
    float _233 = in.m_70.w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = _225 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _249 = 1.0 / _241;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _251;
    int _255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _257 = _255 != 0;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _261 = 1.0 / _245;
    float _263 = _227 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _265 = _227 * 2.0;
    float _267 = 1.0 / _253;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _225 + _269;
    float _273 = -_247;
    float _275 = fma(_263, 2.0, _273);
    float _277 = _231 * 2.0;
    float _279 = _229 * 2.0;
    float _281 = _271 * _249;
    float _283 = _227 + _229;
    float _285 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _287 = floor(_265);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _225 + _289;
    float _293 = _283 + (-1.0);
    float _295 = _231 + _229;
    float _297 = _291 * _261;
    float _299 = _231 + _227;
    float _301 = _295 + (-1.0);
    float _303 = floor(_277);
    float _305 = fma(_285, -2.0, _259);
    float _307 = _299 + (-1.0);
    float _309 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _311 = as_type<int>(_301);
    if (_257)
    {
        _311 = 0;
    }
    int _313 = _311;
    float _315 = _237 * _267;
    int _317 = _313;
    if (!_257)
    {
        _317 = 1;
    }
    int _319 = _317;
    float _321 = floor(_279);
    bool _323 = _287 >= 0.0;
    bool _325 = isnan(_287);
    bool _327 = _323 || _325;
    bool _329 = isnan(0.0);
    bool _331 = _327 || _329;
    float _333 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _335 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _337 = _287 > 0.0;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _343 = _303 > 0.0;
    float _345 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _347 = int(_345);
    bool _349 = _303 >= 0.0;
    bool _351 = isnan(_303);
    bool _353 = _349 || _351;
    bool _355 = isnan(0.0);
    bool _357 = _353 || _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    float _363 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _305);
    float _365 = _331 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _367 = fma(_361, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _369 = _321 > 0.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    bool _375 = _319 != 1;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _381 = _321 >= 0.0;
    bool _383 = isnan(_321);
    bool _385 = _381 || _383;
    bool _387 = isnan(0.0);
    bool _389 = _385 || _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _395 = _357 ? 0 : 1;
    float _397 = fma(_379, _297, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _399 = _389 ? 0 : 1;
    float _401 = fma(_393, _297, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _403 = ~as_type<int>(_365);
    int _405 = _403 + 1;
    int _407 = _405 + 1;
    float _409 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _411 = int(_409);
    int _413 = ~_399;
    int _415 = _413 + 1;
    int _417 = _415 + 1;
    float _419 = fma(_373, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _421 = ~_395;
    int _423 = _421 + 1;
    int _425 = _423 + 1;
    int _427 = _407;
    int _429 = _417;
    int _431 = _425;
    float _433 = _365;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    if (!_337)
    {
        int _437 = ~as_type<int>(_365);
        int _439 = _437 + 1;
        _427 = _439;
    }
    int _441 = _427;
    if (!_369)
    {
        int _443 = ~_399;
        int _445 = _443 + 1;
        _429 = _445;
    }
    int _447 = _429;
    if (!_343)
    {
        int _449 = ~_395;
        int _451 = _449 + 1;
        _431 = _451;
    }
    int _453 = _431;
    if (!_375)
    {
        _433 = _231;
    }
    float _455 = _433;
    float _457 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _459 = log2(_457);
    float _461 = float(_119);
    float _463 = _455;
    if (_375)
    {
        _463 = _229;
    }
    float _465 = _463;
    if (!_375)
    {
        _127 = _229;
    }
    float _467 = _127;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _479 = _477 != 0;
    float _481 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[83].w, _339);
    float _483 = _467;
    if (_375)
    {
        _483 = _227;
    }
    float _485 = _483;
    float _487 = 1.0 / _461;
    float _489 = float(_347);
    bool _491 = !_475;
    int _493 = _491 ? 0 : 1;
    float _495 = _485 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _497 = !_471;
    int _499 = _497 ? 0 : 1;
    bool _501 = !_479;
    int _503 = _501 ? 0 : 1;
    float _505 = -_341;
    float _507 = fma(_495, 2.0, _505);
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _511 = _509 != 0;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _519 = _517 != 0;
    float _521 = 1.0 / _489;
    float _523 = float(_411);
    float _525 = _495;
    if (!_375)
    {
        _525 = _231;
    }
    float _527 = _525;
    float _529 = _487 * _153;
    bool _531 = !_511;
    int _533 = _531 ? 0 : 1;
    float _535 = 1.0 / _523;
    float _537 = _527;
    if (_375)
    {
        _537 = _229;
    }
    float _539 = _537;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _543 = float(_441);
    float _545 = _459 * _153;
    int _547 = abs(_533);
    float _549 = _539 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _551 = _521 * _153;
    bool _553 = !_519;
    int _555 = _553 ? 0 : 1;
    float _557 = fma(_549, -2.0, _541);
    float _559 = float(_447);
    float _561 = exp2(_545);
    float _563 = float(_547);
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_375)
    {
        _435 = _229;
    }
    float _567 = _435;
    float _569 = _535 * _153;
    float _571 = float(_453);
    float _573 = _567;
    if (_375)
    {
        _573 = _227;
    }
    float _575 = _573;
    float _577 = _563 * _571;
    int _579 = abs(_555);
    float _581 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[83].z, _565);
    float _583 = in.m_72.x;
    float _585 = in.m_72.y;
    float _587 = in.m_72.z;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _591 = 1.0 + _589;
    float _593 = float(_579);
    float _595 = -_561;
    float _597 = _595 + 1.0;
    bool _599 = !_515;
    int _601 = _599 ? 0 : 1;
    float _603 = 1.0 / _591;
    float _605 = _593 * _559;
    int _607 = abs(_601);
    float _609 = -_153;
    float _611 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[76].x, _275);
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _615 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _617 = isnan(1.0);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _623 = _619 || _621;
    float _625 = _605 * (-2.0);
    float _627 = float(_607);
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _631 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _633 = isnan(0.0);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _639 = _635 || _637;
    float _641 = _577 * (-2.0);
    bool _643 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _645 = isnan(_225);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = _627 * _543;
    float _657 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[78].z, _613);
    float _659 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].w, _629);
    float _661 = _639 ? _597 : 0.0;
    float _663 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _581);
    float _665 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _481);
    float _667 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _657);
    float _669 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _659);
    float _671 = -_153;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[81].x, _507);
    float _675 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _557);
    if (_623)
    {
        float _677 = _661 * _603;
        _155 = _677;
    }
    float _679 = _155;
    bool _681 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _683 = isnan(_225);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -_653;
    float _695 = _693 + 1.0;
    float _697 = fma(_641, _583, _583);
    float _699 = fma(_333, _641, _333);
    bool _701 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _703 = isnan(_225);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = _691 * _695;
    float _715 = -_691;
    float _717 = _715 + 1.0;
    float _719 = _227 + (-0.5);
    float _721 = _655 * (-2.0);
    bool _723 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _725 = isnan(_225);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = _711 * _717;
    float _737 = -_711;
    float _739 = _737 + 1.0;
    float _741 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[196].x, _697);
    float _743 = fma(_309, _721, _309);
    float _745 = fma(_721, _585, _585);
    float _747 = _229 + (-0.5);
    float _749 = _733 * _739;
    float _751 = -_733;
    float _753 = _751 + 1.0;
    float _755 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[196].y, _745);
    float _757 = _367 * _749;
    float _759 = _419 * _749;
    float _761 = fma(_335, _625, _335);
    float _763 = in.m_74.x;
    float _765 = in.m_74.y;
    float _767 = fma(_743, _679, _755);
    float _769 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[143].y, _759);
    float _771 = fma(_625, _587, _587);
    float _773 = _767 * 0.15915493667125701904296875;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _779;
    float _783 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[143].x, _757);
    float _785 = _231 + (-0.5);
    float _787 = fma(_777, _315, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _789 = fma(_401, _735, _769);
    float _791 = fma(_781, _315, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _793 = fma(_397, _735, _783);
    float _795 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[196].z, _771);
    float _797 = fma(_787, _713, _789);
    float _799 = fma(_699, _679, _741);
    float _801 = fma(_791, _713, _793);
    float _803 = fma(_761, _679, _795);
    float _805 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[146].y, _797);
    float _807 = _799 * 0.15915493667125701904296875;
    float _809 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[146].x, _801);
    float _811 = _803 * 0.15915493667125701904296875;
    float _813 = _773 * 6.283185482025146484375;
    float _815 = sin(_813);
    float _817 = _805 * _765;
    float _819 = _809 * _763;
    float _821 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _823 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _825 = _817 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _827 = _819 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _829 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _831 = _807 * 6.283185482025146484375;
    float _833 = cos(_831);
    float _835 = _825 * _823;
    float _837 = _827 * _821;
    float _839 = in.m_60.x;
    float _841 = in.m_60.y;
    float _843 = in.m_60.z;
    float _845 = _773 * 6.283185482025146484375;
    float _847 = cos(_845);
    float _849 = _807 * 6.283185482025146484375;
    float _851 = sin(_849);
    float _853 = _833 * _815;
    float _855 = _811 * 6.283185482025146484375;
    float _857 = cos(_855);
    float _859 = _833 * _847;
    float _861 = _811 * 6.283185482025146484375;
    float _863 = sin(_861);
    float _865 = _851 * _815;
    float _867 = _851 * _847;
    float _869 = _833 * _857;
    float _871 = _851 * _857;
    float _873 = _847 * _857;
    float _875 = _815 * _857;
    float _877 = _869 * _835;
    float _879 = -_853;
    float _881 = fma(_863, _867, _879);
    float _883 = fma(_863, _859, _865);
    float _885 = -_867;
    float _887 = fma(_863, _853, _885);
    float _889 = -_835;
    float _891 = _863 * _889;
    float _893 = _871 * _835;
    float _895 = fma(_883, _837, _877);
    float _897 = fma(_863, _865, _859);
    float _899 = fma(_873, _837, _891);
    float _901 = fma(_881, _837, _893);
    float _903 = fma(_887, _829, _895);
    float _905 = _841 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _907 = fma(_875, _829, _899);
    float _909 = _841 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _911 = _903 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _913 = _903 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _915 = fma(_897, _829, _901);
    float _917 = fma(_839, (*spvDescriptorSet0.vp_c10)._m0[4].x, _909);
    float _919 = fma(_839, (*spvDescriptorSet0.vp_c10)._m0[6].x, _905);
    float _921 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[24].x, _911);
    float _923 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[26].x, _913);
    float _925 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[4].z, _917);
    float _927 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[6].z, _919);
    float _929 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].z, _921);
    float _931 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].z, _923);
    float _933 = _925 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _935 = _927 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _937 = _929 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _939 = _931 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _941 = _841 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _943 = _903 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _945 = _933 + _937;
    float _947 = _935 + _939;
    float _949 = fma(_839, (*spvDescriptorSet0.vp_c10)._m0[5].x, _941);
    float _951 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[25].x, _943);
    float _953 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _955 = _945 + _953;
    float _957 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _959 = _947 + _957;
    float _961 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[5].z, _949);
    float _963 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].z, _951);
    float _965 = _955 * _955;
    float _967 = _959 * _959;
    float _969 = _961 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _971 = _963 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _973 = _965 + _967;
    float _975 = _969 + _971;
    float _977 = sqrt(_973);
    bool _979 = _977 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _981 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _983 = _977 + _981;
    float _985 = 0.0;
    float _987 = _961;
    float _989 = _943;
    float _991 = _843;
    float _993 = _947;
    float _995 = _975;
    float _997 = _965;
    if (_979)
    {
        float _999 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _985 = _999;
    }
    float _1001 = _985;
    if (_979)
    {
        float _1003 = _975 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _987 = _1003;
    }
    float _1005 = _987;
    float _1007 = _1005;
    if (!_979)
    {
        _989 = _945;
    }
    float _1009 = _989;
    float _1011 = _1009;
    if (_979)
    {
        float _1013 = rsqrt(_973);
        _991 = _1013;
    }
    float _1015 = _991;
    float _1017 = _1001;
    if (_979)
    {
        float _1019 = _983 * _1001;
        _1017 = _1019;
    }
    float _1021 = _1017;
    float _1023 = _1021;
    if (_979)
    {
        float _1025 = _1021 * 0.15915493667125701904296875;
        _1023 = _1025;
    }
    float _1027 = _1023;
    float _1029 = _839;
    if (_979)
    {
        float _1031 = _1027 * 6.283185482025146484375;
        float _1033 = sin(_1031);
        _1029 = _1033;
    }
    float _1035 = _1029;
    if (_979)
    {
        float _1037 = fma(_1035, _1005, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1007 = _1037;
    }
    float _1039 = _1007;
    float _1041 = _1039;
    if (_979)
    {
        float _1043 = _1015 * _1039;
        _1041 = _1043;
    }
    float _1045 = _1041;
    if (_979)
    {
        float _1047 = fma(_955, _1045, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1011 = _1047;
    }
    float _1049 = _1011;
    if (_979)
    {
        float _1051 = fma(_959, _1045, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _993 = _1051;
    }
    float _1053 = _993;
    float _1055 = fma(_1049, 6.2500002968590706586837768554688e-05, 0.5);
    float _1057 = fma(_1053, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5696 = float2(_1055, _1057);
    float3 _1061 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5696, float2(0.0), isnan(_5696)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5696, float2(0.0), isnan(_5696)), level(0.0)).xyz;
    float _1063 = _1061.x;
    float _1065 = _1061.y;
    float _1067 = _1061.z;
    float _1069 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1071 = int(_1069);
    float _1073 = 0.0;
    if (_257)
    {
        float _1075 = in.m_70.x;
        _1073 = _1075;
    }
    float _1077 = _1073;
    float _1079 = -_669;
    float _1081 = _1079 + 1.0;
    float _1083 = -_663;
    float _1085 = _1083 + 1.0;
    float _1087 = _1077;
    if (!_257)
    {
        float _1089 = in.m_70.y;
        _1087 = _1089;
    }
    float _1091 = _1087;
    float _1093 = -_667;
    float _1095 = _1093 + 1.0;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1099 = trunc(_551);
    int _1101 = int(_1099);
    float _1103 = -_665;
    float _1105 = _1103 + 1.0;
    float _1107 = float(uint(_1071));
    float _1109 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1111 = int(_1109);
    int _1113 = ~_1071;
    int _1115 = _1113 + 1;
    bool _1117 = _1071 == 0;
    float _1119 = float(uint(_1101));
    float _1121 = 1.0 / _1107;
    float _1123 = float(_1101);
    float _1125 = float(uint(_1111));
    float _1127 = _1107;
    if (_257)
    {
        _1127 = 1.0;
    }
    float _1129 = _1127;
    float _1131 = _1129;
    if (!_257)
    {
        _1131 = 7.345489978790283203125;
    }
    float _1133 = _1131;
    float _1135 = 1.0 / _1125;
    bool _1137 = _1111 == 0;
    int _1139 = as_type<int>(_1121) + (-2);
    float _1141 = _1133 * _227;
    float _1143 = as_type<float>(_1139) * _1119;
    float _1145 = floor(_1141);
    float _1147 = trunc(_1143);
    float _1149 = precise::max(_1147, 0.0);
    uint _1152 = uint(_1149);
    float _1154 = trunc(_569);
    int _1156 = int(_1154);
    float _1158 = -_1145;
    float _1160 = _1141 + _1158;
    int _1162 = _1115 * int(_1152);
    int _1164 = _1162 + _1101;
    int _1166 = ~_1111;
    int _1168 = _1166 + 1;
    float _1170 = float(uint(_1164));
    int _1172 = as_type<int>(_1135) + (-2);
    float _1174 = float(uint(_1156));
    float _1176 = as_type<float>(_1139) * _1170;
    float _1178 = as_type<float>(_1172) * _1174;
    float _1180 = trunc(_1176);
    float _1182 = precise::max(_1180, 0.0);
    uint _1184 = uint(_1182);
    float _1186 = float(_1071);
    bool _1188 = _1123 >= _1186;
    bool _1190 = isnan(_1123);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan(_1186);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = trunc(_1178);
    float _1202 = precise::max(_1200, 0.0);
    uint _1204 = uint(_1202);
    int _1206 = ~_1071;
    int _1208 = _1206 + 1;
    int _1210 = int(_1152) + int(_1184);
    float _1212 = _1160 * _1186;
    float _1214 = trunc(_1198);
    int _1216 = int(_1214);
    float _1218 = as_type<float>(_1184);
    if (_257)
    {
        _1218 = 1.0;
    }
    float _1220 = _1218;
    float _1222 = _1220;
    if (!_257)
    {
        _1222 = 1.2345600128173828125;
    }
    float _1224 = _1222;
    int _1226 = _1208 * _1210;
    int _1228 = _1226 + _1101;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1232 = _1230 != 0;
    int _1234 = _1168 * int(_1204);
    int _1236 = _1234 + _1156;
    float _1238 = trunc(_1212);
    int _1240 = int(_1238);
    bool _1242 = uint(_1228) >= uint(_1071);
    float _1244 = _1091 * _1224;
    float _1246 = float(uint(_1236));
    float _1248 = _1186 * _529;
    bool _1250 = !_1242;
    int _1252 = _1250 ? 0 : (-1);
    float _1254 = as_type<float>(_1172) * _1246;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1258 = _1256 != 0;
    float _1260 = trunc(_1248);
    int _1262 = int(_1260);
    int _1264 = ~_1210;
    int _1266 = _1264 + _1252;
    int _1268 = _1266 + 1;
    bool _1270 = !_1258;
    int _1272 = _1270 ? 0 : 1;
    int _1274 = ~_1111;
    int _1276 = _1274 + 1;
    int _1278 = _1071 * _1268;
    int _1280 = _1278 + _1101;
    int _1282 = abs(_1272);
    float _1284 = trunc(_1254);
    float _1286 = precise::max(_1284, 0.0);
    uint _1288 = uint(_1286);
    int _1290 = ~_1216;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    bool _1296 = !_1117;
    int _1298 = _1296 ? _1280 : (-1);
    int _1300 = _1240 * _1282;
    int _1302 = _1300 + _1101;
    int _1304 = _1071 + (-1);
    int _1306 = _1298 * _1294;
    int _1308 = abs(_499);
    int _1310 = int(_1204) + int(_1288);
    int _1312 = _1216 * _1304;
    int _1314 = _1312 + _1306;
    int _1316 = abs(_493);
    float _1318 = floor(_1244);
    float _1320 = float(_1111);
    int _1322 = _1276 * _1310;
    int _1324 = _1322 + _1156;
    float _1326 = float(_1156);
    bool _1328 = _1326 >= _1320;
    bool _1330 = isnan(_1326);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan(_1320);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    bool _1340 = uint(_1324) >= uint(_1111);
    int _1342 = _1314 * _1316;
    int _1344 = abs(_503);
    float _1346 = trunc(_1338);
    int _1348 = int(_1346);
    bool _1350 = !_1340;
    int _1352 = _1350 ? 0 : (-1);
    float _1354 = -_1318;
    float _1356 = _1244 + _1354;
    int _1358 = ~_1310;
    int _1360 = _1358 + _1352;
    int _1362 = _1360 + 1;
    bool _1364 = !_1232;
    int _1366 = _1364 ? 0 : 1;
    int _1368 = _1262 * _1308;
    int _1370 = _1368 + _1342;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1374 = _1372 != 0;
    int _1376 = _1111 * _1362;
    int _1378 = _1376 + _1156;
    int _1380 = abs(_1366);
    int _1382 = _1302 * _1344;
    int _1384 = _1382 + _1370;
    bool _1386 = !_1374;
    int _1388 = _1386 ? 0 : 1;
    float _1390 = _1320 * _529;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1394 = _1392 != 0;
    int _1396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1398 = _1396 != 0;
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1402 = _1400 != 0;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1406 = _1404 != 0;
    float _1408 = _1356 * _1320;
    int _1410 = _1240 * _1380;
    int _1412 = _1410 + _1384;
    int _1414 = ~_1348;
    int _1416 = _1414 + 1;
    int _1418 = _1416 + 1;
    bool _1420 = !_1137;
    int _1422 = _1420 ? _1378 : (-1);
    float _1424 = trunc(_1390);
    int _1426 = int(_1424);
    bool _1428 = !_1398;
    int _1430 = _1428 ? 0 : 1;
    int _1432 = abs(_1388);
    int _1434 = _1422 * _1418;
    float _1436 = float(uint(_1412));
    bool _1438 = !_1394;
    int _1440 = _1438 ? 0 : 1;
    float _1442 = trunc(_1408);
    int _1444 = int(_1442);
    int _1446 = _1111 + (-1);
    float _1448 = as_type<float>(_1139) * _1436;
    int _1450 = abs(_1430);
    int _1452 = _1348 * _1446;
    int _1454 = _1452 + _1434;
    int _1456 = abs(_1440);
    float _1458 = trunc(_1448);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    int _1464 = ~_1071;
    int _1466 = _1464 + 1;
    int _1468 = _1454 * _1450;
    bool _1470 = !_1402;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = _1444 * _1432;
    int _1476 = _1474 + _1156;
    float _1478 = float(uint(_1302));
    int _1480 = _1426 * _1456;
    int _1482 = _1480 + _1468;
    bool _1484 = !_1406;
    int _1486 = _1484 ? 0 : 1;
    int _1488 = abs(_1472);
    float _1490 = as_type<float>(_1139) * _1478;
    int _1492 = abs(_1486);
    int _1494 = _1466 * int(_1462);
    int _1496 = _1494 + _1412;
    float _1498 = float(uint(_1476));
    float _1500 = trunc(_1490);
    float _1502 = precise::max(_1500, 0.0);
    uint _1504 = uint(_1502);
    float _1506 = float(uint(_1496));
    float _1508 = as_type<float>(_1172) * _1498;
    int _1510 = _1476 * _1488;
    int _1512 = _1510 + _1482;
    int _1514 = ~_1071;
    int _1516 = _1514 + 1;
    float _1518 = as_type<float>(_1139) * _1506;
    int _1520 = _1444 * _1492;
    int _1522 = _1520 + _1512;
    float _1524 = trunc(_1508);
    float _1526 = precise::max(_1524, 0.0);
    uint _1528 = uint(_1526);
    int _1530 = ~_1111;
    int _1532 = _1530 + 1;
    float _1534 = float(uint(_1522));
    float _1536 = trunc(_1518);
    float _1538 = precise::max(_1536, 0.0);
    uint _1540 = uint(_1538);
    float _1542 = as_type<float>(_1172) * _1534;
    int _1544 = _1516 * int(_1504);
    int _1546 = _1544 + _1302;
    float _1548 = float(uint(_1546));
    float _1550 = trunc(_1542);
    float _1552 = precise::max(_1550, 0.0);
    uint _1554 = uint(_1552);
    int _1556 = ~_1111;
    int _1558 = _1556 + 1;
    int _1560 = _1532 * int(_1528);
    int _1562 = _1560 + _1476;
    float _1564 = as_type<float>(_1139) * _1548;
    int _1566 = ~_1071;
    int _1568 = _1566 + 1;
    float _1570 = float(uint(_1562));
    int _1572 = int(_1462) + int(_1540);
    float _1574 = trunc(_1564);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    float _1580 = as_type<float>(_1172) * _1570;
    int _1582 = _1558 * int(_1554);
    int _1584 = _1582 + _1522;
    int _1586 = _1568 * _1572;
    int _1588 = _1586 + _1412;
    float _1590 = trunc(_1580);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    float _1596 = float(uint(_1584));
    bool _1598 = uint(_1588) >= uint(_1071);
    float _1600 = as_type<float>(_1172) * _1596;
    bool _1602 = !_1598;
    int _1604 = _1602 ? 0 : (-1);
    int _1606 = int(_1504) + int(_1578);
    int _1608 = ~_1572;
    int _1610 = _1608 + _1604;
    int _1612 = _1610 + 1;
    float _1614 = trunc(_1600);
    float _1616 = precise::max(_1614, 0.0);
    uint _1618 = uint(_1616);
    int _1620 = ~_1111;
    int _1622 = _1620 + 1;
    int _1624 = int(_1528) + int(_1594);
    int _1626 = _1071 * _1612;
    int _1628 = _1626 + _1412;
    int _1630 = ~_1111;
    int _1632 = _1630 + 1;
    int _1634 = ~_1071;
    int _1636 = _1634 + 1;
    bool _1638 = !_1117;
    int _1640 = _1638 ? _1628 : (-1);
    int _1642 = _1636 * _1606;
    int _1644 = _1642 + _1302;
    int _1646 = _1640 & 3;
    bool _1648 = _1646 != 0;
    int _1650 = int(_1554) + int(_1618);
    int _1652 = _1640 & 3;
    bool _1654 = _1652 != 0;
    int _1656 = _1648 ? 0 : 1;
    int _1658 = _1632 * _1650;
    int _1660 = _1658 + _1522;
    bool _1662 = uint(_1652) >= 2u;
    bool _1664 = uint(_1644) >= uint(_1071);
    int _1666 = _1662 ? 0 : 1;
    bool _1668 = uint(_1660) >= uint(_1111);
    bool _1670 = !_1664;
    int _1672 = _1670 ? 0 : (-1);
    bool _1674 = !_1668;
    int _1676 = _1674 ? 0 : (-1);
    bool _1678 = _1652 != 3;
    int _1680 = ~_1650;
    int _1682 = _1680 + _1676;
    int _1684 = _1682 + 1;
    int _1686 = ~_1606;
    int _1688 = _1686 + _1672;
    int _1690 = _1688 + 1;
    int _1692 = _1622 * _1624;
    int _1694 = _1692 + _1476;
    int _1696 = _1640 >> 31;
    int _1698 = _1111 * _1684;
    int _1700 = _1698 + _1522;
    bool _1702 = uint(_1652) > 1u;
    int _1704 = _1071 * _1690;
    int _1706 = _1704 + _1302;
    bool _1708 = _233 > 0.5;
    bool _1710 = !_1137;
    int _1712 = _1710 ? _1700 : (-1);
    int _1714 = ~_1666;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    int _1720 = _1712 >> 31;
    int _1722 = _1718;
    if (_1678)
    {
        int _1724 = ~_1666;
        int _1726 = _1724 + 1;
        _1722 = _1726;
    }
    int _1728 = _1722;
    int _1730 = _1696 & 3;
    float _1732 = -_195;
    int _1734 = _1708 ? as_type<int>(_1732) : as_type<int>(_195);
    int _1736 = _1720 & 3;
    int _1738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1740 = _1738 != 0;
    bool _1742 = !_1117;
    int _1744 = _1742 ? _1706 : (-1);
    int _1746 = _1640 + _1730;
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1750 = _1748 != 0;
    int _1752 = _1712 + _1736;
    bool _1754 = !_1740;
    int _1756 = _1754 ? 0 : 1;
    int _1758 = _1712 & 3;
    bool _1760 = _1758 != 0;
    int _1762 = _1746 >> 2;
    int _1764 = ~_1656;
    int _1766 = _1764 + 1;
    int _1768 = _1766 + 1;
    bool _1770 = !_1750;
    int _1772 = _1770 ? 0 : 1;
    int _1774 = _1752 >> 2;
    int _1776 = _1768;
    if (!_1702)
    {
        int _1778 = ~_1656;
        int _1780 = _1778 + 1;
        _1776 = _1780;
    }
    int _1782 = _1776;
    int _1784 = _1712 & 3;
    bool _1786 = _1784 != 0;
    bool _1788 = uint(_1694) >= uint(_1111);
    bool _1790 = !_1760;
    int _1792 = _1790 ? 0 : 1;
    bool _1794 = uint(_1758) > 1u;
    int _1796 = _1762 << 4;
    int _1798 = _1796 + 368;
    int _1800 = _1774 << 4;
    int _1802 = _1800 + 512;
    int _1804 = _1786 ? 0 : 1;
    bool _1806 = !_1654;
    int _1808 = _1806 ? 0 : 1;
    bool _1810 = !_1788;
    int _1812 = _1810 ? 0 : (-1);
    bool _1814 = _1652 != 3;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1818 = _1816 != 0;
    uint _1820 = uint(int(uint(_1798) >> uint(2)));
    uint _1822 = uint(int(uint(int(_1820)) >> uint(2)));
    int _1824 = int(_1820) & 3;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[int(_1822)][_1824];
    int _1828 = int(_1820) + 1;
    uint _1830 = uint(int(uint(_1828) >> uint(2)));
    int _1832 = _1828 & 3;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[int(_1830)][_1832];
    int _1836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1838 = _1836 != 0;
    int _1840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1842 = _1840 != 0;
    int _1844 = ~_1804;
    int _1846 = _1844 + 1;
    int _1848 = _1846 + 1;
    int _1850 = ~_1624;
    int _1852 = _1850 + _1812;
    int _1854 = _1852 + 1;
    uint _1856 = uint(int(uint(_1802) >> uint(2)));
    uint _1858 = uint(int(uint(int(_1856)) >> uint(2)));
    int _1860 = int(_1856) & 3;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[int(_1858)][_1860];
    int _1864 = int(_1856) + 1;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    int _1868 = _1864 & 3;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[int(_1866)][_1868];
    int _1872 = _1848;
    if (!_1794)
    {
        int _1874 = ~_1804;
        int _1876 = _1874 + 1;
        _1872 = _1876;
    }
    int _1878 = _1872;
    bool _1880 = !_1814;
    int _1882 = _1880 ? 0 : (-1);
    int _1884 = _1111 * _1854;
    int _1886 = _1884 + _1476;
    bool _1888 = _1758 != 3;
    bool _1890 = uint(_1758) >= 2u;
    int _1892 = _1802 + 8;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    uint _1896 = uint(int(uint(int(_1894)) >> uint(2)));
    int _1898 = int(_1894) & 3;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[int(_1896)][_1898];
    int _1902 = int(_1894) + 1;
    uint _1904 = uint(int(uint(_1902) >> uint(2)));
    int _1906 = _1902 & 3;
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[int(_1904)][_1906];
    int _1910 = _1890 ? 0 : 1;
    bool _1912 = _1758 != 3;
    int _1914 = ~_1910;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    int _1920 = _1798 + 8;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    uint _1924 = uint(int(uint(int(_1922)) >> uint(2)));
    int _1926 = int(_1922) & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = int(_1922) + 1;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    int _1934 = _1930 & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    bool _1938 = !_1137;
    int _1940 = _1938 ? _1886 : (-1);
    int _1942 = _1918;
    if (_1888)
    {
        int _1944 = ~_1910;
        int _1946 = _1944 + 1;
        _1942 = _1946;
    }
    int _1948 = _1942;
    int _1950 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1952 = _1950 != 0;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1958 = abs(_1878);
    float _1960 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1962 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1966 = _1956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1968 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1970 = abs(_1782);
    int _1972 = abs(_1808);
    out.m_76.x = _1962;
    out.m_76.y = _1966;
    out.m_76.z = _1968;
    out.m_76.w = _1964;
    bool _1974 = !_1912;
    int _1976 = _1974 ? 0 : (-1);
    bool _1978 = _227 > 0.5;
    bool _1980 = _229 > 0.5;
    int _1982 = ~_1970;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1990 = -_191;
    int _1992 = _1978 ? as_type<int>(_1990) : as_type<int>(_191);
    float _1994 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1996 = int(_1994);
    int _1998 = _1986 * as_type<int>(_1834);
    float _2000 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2002 = abs(_1792);
    float _2004 = _887 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2006 = ~_1958;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    bool _2012 = _231 > 0.5;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2016 = ~_1972;
    int _2018 = _2016 + 1;
    int _2020 = _2018 + 1;
    int _2022 = _2010 * as_type<int>(_1870);
    int _2024 = ~_2002;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    float _2030 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2032 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2034 = _2020 * as_type<int>(_1826);
    int _2036 = _2034 + _1998;
    int _2038 = abs(_1728);
    int _2040 = _2028 * as_type<int>(_1862);
    int _2042 = _2040 + _2022;
    int _2044 = abs(_1948);
    float _2046 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2048 = int(_2046);
    out.m_78.x = _2000;
    out.m_78.y = _2030;
    out.m_78.z = _2032;
    int _2050 = abs(_1882);
    float _2052 = _869 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2054 = abs(_1976);
    float _2056 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2058 = ~_2038;
    int _2060 = _2058 + 1;
    int _2062 = _2060 + 1;
    float _2064 = as_type<float>(_1948);
    if (_979)
    {
        float _2066 = _1027 * 6.283185482025146484375;
        float _2068 = cos(_2066);
        _2064 = _2068;
    }
    float _2070 = _2064;
    bool _2072 = !_1818;
    float _2074 = _2072 ? _195 : as_type<float>(_1734);
    float _2076 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2056);
    bool _2078 = !_1952;
    float _2080 = _2078 ? _191 : as_type<float>(_1992);
    int _2082 = _2062 * as_type<int>(_1928);
    int _2084 = _2082 + _2036;
    int _2086 = ~_2044;
    int _2088 = _2086 + 1;
    int _2090 = _2088 + 1;
    float _2092 = float(uint(_1996));
    float _2094 = _887 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2096 = _2090 * as_type<int>(_1900);
    int _2098 = _2096 + _2042;
    int _2100 = ~_2054;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    int _2106 = ~_2050;
    int _2108 = _2106 + 1;
    int _2110 = _2108 + 1;
    float _2112 = 1.0 / _2092;
    int _2114 = abs(_1756);
    int _2116 = _2104 * as_type<int>(_1908);
    int _2118 = _2116 + _2098;
    int _2120 = abs(_1996);
    int _2122 = _2110 * as_type<int>(_1936);
    int _2124 = _2122 + _2084;
    int _2126 = abs(_1772);
    float _2128 = -_863;
    float _2130 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2052);
    int _2132 = ~_2114;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    float _2138 = float(uint(_2048));
    int _2140 = abs(_2048);
    int _2142 = _2124 * _2136;
    float _2144 = 1.0 / _2138;
    int _2146 = ~_2126;
    int _2148 = _2146 + 1;
    int _2150 = _2148 + 1;
    int _2152 = _1744 * _2114;
    int _2154 = _2152 + _2142;
    float _2156 = float(uint(_2140));
    float _2158 = _869 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2160 = float(uint(_2120));
    int _2162 = _2118 * _2150;
    int _2164 = ~_1996;
    int _2166 = _2164 + 1;
    float _2168 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2170 = _869 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2172 = 1.0 / _2156;
    int _2174 = _1940 * _2126;
    int _2176 = _2174 + _2162;
    int _2178 = as_type<int>(_2112) + (-2);
    float _2180 = -_863;
    float _2182 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2170);
    float _2184 = float(uint(_2154));
    float _2186 = -_863;
    float _2188 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2158);
    int _2190 = as_type<int>(_2144) + (-2);
    float _2192 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2194 = 1.0 / _2160;
    float _2196 = as_type<float>(_2178) * _2184;
    float _2198 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2182);
    int _2200 = abs(_2176);
    float _2202 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2188);
    int _2204 = abs(_2154);
    float _2206 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2192);
    float _2208 = trunc(_2196);
    float _2210 = precise::max(_2208, 0.0);
    uint _2212 = uint(_2210);
    float _2214 = float(uint(_2176));
    float _2216 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2168);
    int _2218 = as_type<int>(_2172) + (-2);
    float _2220 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2004);
    float _2222 = as_type<float>(_2190) * _2214;
    float _2224 = float(uint(_2204));
    float _2226 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2130);
    int _2228 = as_type<int>(_2194) + (-2);
    float _2230 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2206);
    float _2232 = float(uint(_2200));
    float _2234 = trunc(_2222);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    int _2240 = ~_2140;
    int _2242 = _2240 + 1;
    float _2244 = as_type<float>(_2228) * _2224;
    float _2246 = _887 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2248 = as_type<float>(_2218) * _2232;
    float _2250 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2094);
    int _2252 = _2166 * int(_2212);
    int _2254 = _2252 + _2154;
    float _2256 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2246);
    float _2258 = trunc(_2244);
    float _2260 = precise::max(_2258, 0.0);
    uint _2262 = uint(_2260);
    float _2264 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2250);
    float _2266 = _2246;
    float _2268 = as_type<float>(_2242);
    float _2270 = _2076;
    if (_979)
    {
        float _2272 = _2070 + (-1.0);
        _2266 = _2272;
    }
    float _2274 = _2266;
    float _2276 = float(uint(_2254));
    float _2278 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2256);
    float _2280 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2220);
    int _2282 = ~_2120;
    int _2284 = _2282 + 1;
    float _2286 = _2274;
    float _2288 = _2278;
    if (_979)
    {
        float _2290 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2286 = _2290;
    }
    float _2292 = _2286;
    float _2294 = trunc(_2248);
    float _2296 = precise::max(_2294, 0.0);
    uint _2298 = uint(_2296);
    int _2300 = ~_2048;
    int _2302 = _2300 + 1;
    float _2304 = as_type<float>(_2178) * _2276;
    if (_979)
    {
        float _2306 = fma(_975, _2070, _2292);
        _995 = _2306;
    }
    float _2308 = _995;
    float _2310 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2312 = _2302 * int(_2238);
    int _2314 = _2312 + _2176;
    bool _2316 = _2048 == 0;
    int _2318 = _2284 * int(_2262);
    int _2320 = _2318 + _2204;
    float _2322 = trunc(_2304);
    float _2324 = precise::max(_2322, 0.0);
    uint _2326 = uint(_2324);
    float _2328 = float(uint(_2314));
    float _2330 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2332 = float(uint(_2320));
    float _2334 = -_195;
    int _2336 = _1980 ? as_type<int>(_2334) : as_type<int>(_195);
    int _2338 = _2242 * int(_2298);
    int _2340 = _2338 + _2200;
    if (_979)
    {
        float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2344 = _1049 + _2342;
        _2268 = _2344;
    }
    float _2346 = _2268;
    float _2348 = _2330 * _2202;
    bool _2350 = !_1838;
    float _2352 = _2350 ? _195 : as_type<float>(_2336);
    float _2354 = float(uint(_2340));
    float _2356 = as_type<float>(_2190) * _2328;
    float _2358 = _2348;
    if (_979)
    {
        float _2360 = _2346 * _2346;
        _997 = _2360;
    }
    float _2362 = _997;
    float _2364 = -_191;
    int _2366 = _2012 ? as_type<int>(_2364) : as_type<int>(_191);
    float _2368 = as_type<float>(_2228) * _2332;
    float _2370 = as_type<float>(_2218) * _2354;
    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2374 = _2308 + _2372;
    float _2376 = trunc(_2356);
    float _2378 = precise::max(_2376, 0.0);
    uint _2380 = uint(_2378);
    bool _2382 = !_1842;
    float _2384 = _2382 ? _191 : as_type<float>(_2366);
    float _2386 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2076);
    float _2388 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2216);
    float _2390 = _2388;
    if (!_979)
    {
        _2270 = _967;
    }
    float _2392 = _2270;
    float _2394 = _2330 * _2198;
    float _2396 = fma(_2310, _2386, _2348);
    float _2398 = _2392;
    float _2400 = _2396;
    if (_979)
    {
        float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2404 = _1053 + _2402;
        _2358 = _2404;
    }
    float _2406 = _2358;
    float _2408 = trunc(_2368);
    float _2410 = precise::max(_2408, 0.0);
    uint _2412 = uint(_2410);
    float _2414 = _2330 * _2226;
    float _2416 = fma(_2310, _2230, _2394);
    if (_979)
    {
        float _2418 = _2406 * _2406;
        _2398 = _2418;
    }
    float _2420 = _2398;
    bool _2422 = _2048 == 0;
    float _2424 = fma(_2310, _2388, _2414);
    out.m_80.x = _2386;
    out.m_80.y = _2230;
    out.m_80.z = _2388;
    float _2426 = trunc(_2370);
    float _2428 = precise::max(_2426, 0.0);
    uint _2430 = uint(_2428);
    float _2432 = fma(_2374, _2374, _2362);
    int _2434 = int(_2212) + int(_2326);
    int _2436 = ~_2120;
    int _2438 = _2436 + 1;
    int _2440 = int(_2238) + int(_2380);
    int _2442 = int(_2262) + int(_2412);
    float _2444 = _2432 + _2420;
    int _2446 = ~_2048;
    int _2448 = _2446 + 1;
    int _2450 = ~_1996;
    int _2452 = _2450 + 1;
    int _2454 = _2448 * _2440;
    int _2456 = _2454 + _2176;
    int _2458 = int(_2298) + int(_2430);
    int _2460 = _2438 * _2442;
    int _2462 = _2460 + _2204;
    int _2464 = ~_2140;
    int _2466 = _2464 + 1;
    int _2468 = _2452 * _2434;
    int _2470 = _2468 + _2154;
    bool _2472 = uint(_2456) >= uint(_2048);
    float _2474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2476 = uint(_2462) >= uint(_2120);
    int _2478 = _2466 * _2458;
    int _2480 = _2478 + _2200;
    bool _2482 = uint(_2470) >= uint(_1996);
    bool _2484 = !_2472;
    int _2486 = _2484 ? 0 : (-1);
    bool _2488 = !_2482;
    int _2490 = _2488 ? 0 : (-1);
    float _2492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2494 = uint(_2480) >= uint(_2140);
    int _2496 = _2154 ^ _1996;
    int _2498 = ~_2440;
    int _2500 = _2498 + _2486;
    int _2502 = _2500 + 1;
    int _2504 = ~_2434;
    int _2506 = _2504 + _2490;
    int _2508 = _2506 + 1;
    float _2510 = _2474 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2512 = !_2476;
    int _2514 = _2512 ? 0 : (-1);
    float _2516 = sqrt(_2444);
    uint _2518 = uint(int(uint(_2496) >> uint(31)));
    int _2520 = _1996 * _2508;
    int _2522 = _2520 + _2154;
    int _2524 = _2176 ^ _2048;
    int _2526 = _2048 * _2502;
    int _2528 = _2526 + _2176;
    bool _2530 = _1996 == 0;
    float _2532 = _2492 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2534 = _1996 == 0;
    int _2536 = ~_2514;
    int _2538 = _2442 + _2536;
    int _2540 = _2538 + 1;
    float _2542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2544 = ~int(_2518);
    int _2546 = _2544 + 1;
    bool _2548 = !_2494;
    int _2550 = _2548 ? 0 : (-1);
    uint _2552 = uint(int(uint(_2524) >> uint(31)));
    int _2554 = _2540 ^ _2546;
    float _2556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2558 = !_2530;
    int _2560 = _2558 ? _2522 : (-1);
    int _2562 = ~_2550;
    int _2564 = _2458 + _2562;
    int _2566 = _2564 + 1;
    int _2568 = ~int(_2552);
    int _2570 = _2568 + 1;
    int _2572 = ~_2546;
    int _2574 = _2572 + _2554;
    int _2576 = _2574 + 1;
    float _2578 = fma(_2330, _2330, 1.0);
    float _2580 = float(_2560);
    int _2582 = _2566 ^ _2570;
    bool _2584 = !_2316;
    int _2586 = _2584 ? _2528 : (-1);
    float _2588 = fma(_2510, _2580, _611);
    float _2590 = rsqrt(_2578);
    int _2592 = ~_2570;
    int _2594 = _2592 + _2582;
    int _2596 = _2594 + 1;
    float _2598 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2600 = !_2534;
    int _2602 = _2600 ? _2576 : (-1);
    float _2604 = _2556 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2606 = float(_2586);
    float _2608 = _2080 + 0.5;
    float _2610 = float(_2602);
    out.m_82.x = _1063;
    out.m_82.y = _1065;
    out.m_82.z = _1067;
    bool _2612 = _2516 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2614 = isnan(_2516);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2620 = _2616 || _2618;
    float _2622 = fma(_2598, _2606, _673);
    bool _2624 = !_2422;
    int _2626 = _2624 ? _2596 : (-1);
    float _2628 = -_363;
    float _2630 = fma(_2532, _2610, _2628);
    float _2632 = _2384 + 0.5;
    float _2634 = fma(_2510, _2608, _2588);
    float _2636 = float(_2626);
    float _2638 = _2352 + (-0.5);
    float _2640 = fma(_2598, _2632, _2622);
    float _2642 = _2330 * _2590;
    float _2644 = -_1095;
    float _2646 = fma(_2080, _2644, _2634);
    float _2648 = -_675;
    float _2650 = fma(_2604, _2636, _2648);
    float _2652 = _2074 + (-0.5);
    float _2654 = -_2532;
    float _2656 = fma(_2654, _2638, _2630);
    float _2658 = -_2264;
    float _2660 = _2642 * _2658;
    float _2662 = -_2278;
    float _2664 = _2642 * _2662;
    float _2666 = -_2280;
    float _2668 = _2642 * _2666;
    float _2670 = -_2604;
    float _2672 = fma(_2670, _2652, _2650);
    float _2674 = fma(_2590, _2202, _2660);
    float _2676 = fma(_2590, _2198, _2664);
    float _2678 = -_1085;
    float _2680 = fma(_2384, _2678, _2640);
    float _2682 = fma(_2352, _1081, _2656);
    float _2684 = fma(_2590, _2226, _2668);
    float _2686 = _2264 + _2396;
    float _2688 = fma(_2074, _1105, _2672);
    float _2690 = _2278 + _2416;
    float _2692 = _2280 + _2424;
    out.m_84.x = _2674;
    out.m_84.y = _2676;
    out.m_84.z = _2684;
    if (!_2620)
    {
        _2288 = 1.0;
    }
    float _2694 = _2288;
    out.m_86.x = _2646;
    out.m_86.y = _2682;
    out.m_86.z = _2680;
    out.m_86.w = _2688;
    out.m_88.x = _2686;
    out.m_88.y = _2690;
    out.m_88.z = _2692;
    bool _2696 = !_2620;
    float _2698 = _2694;
    if (!_2696)
    {
        bool _2700 = _2516 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2702 = isnan(_2516);
        bool _2704 = _2700 || _2702;
        bool _2706 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2708 = _2704 || _2706;
        if (!_2708)
        {
            float _2710 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2712 = _2516 + _2710;
            float _2714 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2716 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2714;
            float _2718 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2722 = 1.0 / _2716;
            float _2724 = _2712 * _2722;
            float _2726 = fma(_2724, _2720, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2698 = _2726;
            _2728 = true;
        }
        else
        {
            bool _2730 = _2516 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2732 = isnan(_2516);
            bool _2734 = _2730 || _2732;
            bool _2736 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2738 = _2734 || _2736;
            if (!_2738)
            {
                float _2740 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2742 = _2516 + _2740;
                float _2744 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2746 = _2744 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2748 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2750 = _2748 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2752 = 1.0 / _2746;
                float _2754 = _2742 * _2752;
                float _2756 = fma(_2754, _2750, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2698 = _2756;
                _2728 = true;
            }
            else
            {
                _2698 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2728 = false;
    float _2758 = _2698;
    float _2760 = fma(_933, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2762 = fma(_935, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2764 = floor(_2760);
    float _2766 = floor(_2762);
    float _2768 = -_2764;
    float _2770 = _2760 + _2768;
    float _2772 = -_2766;
    float _2774 = _2762 + _2772;
    float2 _8185 = float2(_2770, _2774);
    float _2776 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8185, float2(0.0), isnan(_8185)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8185, float2(0.0), isnan(_8185)), level(0.0)).x;
    float _2778 = _969 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2780 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2782 = _1049 + _2780;
    float _2784 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2778);
    float _2786 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2788 = _1053 + _2786;
    float _2790 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2792 = fma(_2782, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2794 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2784);
    float _2796 = _969 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2798 = _969 + _2790;
    float _2800 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2802 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2796);
    float _2804 = fma(_2788, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2806 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2808 = 1.0 / _2800;
    float _2810 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2802);
    float _2812 = fma(_933, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2806);
    float _2814 = _2810 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2816 = _2814 + _2800;
    float _2818 = _2816 * _2808;
    float _2820 = _2818 * 0.5;
    float _2822 = fma(_935, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2812);
    float _2824 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2826 = fma(_2820, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2824);
    float _2828 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2830 = 1.0 / _2826;
    bool _2832 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2834 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2836 = _2832 || _2834;
    bool _2838 = isnan(0.5);
    bool _2840 = _2836 || _2838;
    float _2842 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2844 = _2308 + _2842;
    float _2846 = fma(_2844, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2848 = trunc(_2828);
    int _2850 = int(_2848);
    float _2852 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2854 = fma(_933, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2852);
    float _2856 = _2844;
    int _2858 = 2;
    int _2860 = as_type<int>(_2758);
    if (_2840)
    {
        _2856 = _2846;
    }
    float _2862 = _2856;
    float _2864 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2866 = _2830 * _2864;
    float _2868 = fma(_935, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2854);
    float _2870 = _2862;
    if (_2840)
    {
        _2390 = _2804;
    }
    float _2872 = _2390;
    bool _2874 = _2866 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2876 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2878 = _2866 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2880 = !_2874;
    int _2882 = _2880 ? 0 : 1;
    float _2884 = trunc(_2876);
    int _2886 = int(_2884);
    int _2888 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2890 = _2850 + _2888;
    int _2892 = _2890 + 1;
    float _2894 = _2872;
    if (!_2874)
    {
        _2858 = 1;
    }
    int _2896 = _2858;
    int _2898 = _2896;
    if (!_2878)
    {
        _2898 = _2882;
    }
    int _2900 = _2898;
    bool _2902 = _2892 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2904 = _2900 << 6;
    int _2906 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2908 = _2886 + _2906;
    int _2910 = _2908 + 1;
    int _2912 = _2904 + 48;
    uint _2914 = uint(int(uint(_2912) >> uint(2)));
    uint _2916 = uint(int(uint(int(_2914)) >> uint(2)));
    int _2918 = int(_2914) & 3;
    float _2920 = (*spvDescriptorSet0.vp_c15)._m0[int(_2916)][_2918];
    int _2922 = int(_2914) + 1;
    uint _2924 = uint(int(uint(_2922) >> uint(2)));
    int _2926 = _2922 & 3;
    float _2928 = (*spvDescriptorSet0.vp_c15)._m0[int(_2924)][_2926];
    int _2930 = _2892 | _2910;
    bool _2932 = _2930 < 0;
    bool _2934 = _2932 || _2902;
    int _2936 = _2904 + 56;
    uint _2938 = uint(int(uint(_2936) >> uint(2)));
    uint _2940 = uint(int(uint(int(_2938)) >> uint(2)));
    int _2942 = int(_2938) & 3;
    float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
    int _2946 = int(_2938) + 1;
    uint _2948 = uint(int(uint(_2946) >> uint(2)));
    int _2950 = _2946 & 3;
    float _2952 = (*spvDescriptorSet0.vp_c15)._m0[int(_2948)][_2950];
    float _2954 = as_type<float>(_2930);
    float _2956 = as_type<float>(_2900);
    if (_2840)
    {
        _2954 = _2792;
    }
    float _2958 = _2954;
    bool _2960 = _2910 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2962 = _2960 || _2934;
    int _2964 = _2904 + 64;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    int _2982 = _2904 + 72;
    uint _2984 = uint(int(uint(_2982) >> uint(2)));
    uint _2986 = uint(int(uint(int(_2984)) >> uint(2)));
    int _2988 = int(_2984) & 3;
    float _2990 = (*spvDescriptorSet0.vp_c15)._m0[int(_2986)][_2988];
    int _2992 = int(_2984) + 1;
    uint _2994 = uint(int(uint(_2992) >> uint(2)));
    int _2996 = _2992 & 3;
    float _2998 = (*spvDescriptorSet0.vp_c15)._m0[int(_2994)][_2996];
    int _3000 = _2904 + 96;
    uint _3002 = uint(int(uint(_3000) >> uint(2)));
    uint _3004 = uint(int(uint(int(_3002)) >> uint(2)));
    int _3006 = int(_3002) & 3;
    float _3008 = (*spvDescriptorSet0.vp_c15)._m0[int(_3004)][_3006];
    int _3010 = int(_3002) + 1;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    int _3014 = _3010 & 3;
    float _3016 = (*spvDescriptorSet0.vp_c15)._m0[int(_3012)][_3014];
    int _3018 = _2904 + 104;
    uint _3020 = uint(int(uint(_3018) >> uint(2)));
    uint _3022 = uint(int(uint(int(_3020)) >> uint(2)));
    int _3024 = int(_3020) & 3;
    float _3026 = (*spvDescriptorSet0.vp_c15)._m0[int(_3022)][_3024];
    int _3028 = int(_3020) + 1;
    uint _3030 = uint(int(uint(_3028) >> uint(2)));
    int _3032 = _3028 & 3;
    float _3034 = (*spvDescriptorSet0.vp_c15)._m0[int(_3030)][_3032];
    float _3036 = _2958;
    int _3038 = as_type<int>(_3026);
    if (!_2840)
    {
        float _3040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3042 = _969 + _3040;
        float _3044 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3046 = _933 + _3044;
        float _3048 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3050 = _3042 * _3042;
        float _3052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3054 = _935 + _3052;
        float _3056 = fma(_3046, _3046, _3050);
        float _3058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3060 = fma(_3054, _3054, _3056);
        float _3062 = sqrt(_3060);
        float _3064 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3066 = -_969;
        float _3068 = _3066 + _2846;
        float _3070 = precise::min(_3062, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3072 = _3070 * _3058;
        float _3074 = -_935;
        float _3076 = _3074 + _2804;
        float _3078 = _3064 * _3072;
        float _3080 = -_933;
        float _3082 = _3080 + _2792;
        float _3084 = fma(_3068, _3078, _969);
        float _3086 = fma(_3082, _3078, _933);
        float _3088 = fma(_3076, _3078, _935);
        _2870 = _3084;
        _3036 = _3086;
        _2894 = _3088;
        _2860 = as_type<int>(_3068);
    }
    float _3090 = _2870;
    float _3092 = _3036;
    float _3094 = _2894;
    int _3096 = _2860;
    float _3098 = _2798 * _3016;
    float _3100 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3102 = _3096;
    if (!_2962)
    {
        int _3104 = _2910 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3106 = _3104 + _2892;
        _3102 = _3106;
    }
    int _3108 = _3102;
    float _3110 = _2798 * _2928;
    float _3112 = fma(_933, _3008, _3098);
    float _3114 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3100);
    float _3116 = _2798 * _2980;
    float _3118 = fma(_933, _2920, _3110);
    float _3120 = fma(_935, _3026, _3112);
    float _3122 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3114);
    int _3124 = as_type<int>(_3122);
    float _3126 = as_type<float>(_3108);
    if (!_2962)
    {
        int _3128 = _3108 << 2;
        _3038 = _3128;
    }
    int _3130 = _3038;
    float _3132 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3134 = _3120 + _3034;
    float _3136 = _3122 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3138 = fma(_933, _2972, _3116);
    int _3140 = _3130;
    int _3142 = as_type<int>(_3132);
    if (!_2962)
    {
        uint _3144 = uint(int(uint(_3108) >> uint(2)));
        _3124 = int(_3144);
    }
    int _3146 = _3124;
    float _3148 = fma(_935, _2944, _3118);
    float _3150 = _3136 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3152 = 1.0 / _3134;
    if (!_2962)
    {
        int _3154 = 12 & _3130;
        _3140 = _3154;
    }
    int _3156 = _3140;
    int _3158 = _2904 + 80;
    uint _3160 = uint(int(uint(_3158) >> uint(2)));
    uint _3162 = uint(int(uint(int(_3160)) >> uint(2)));
    int _3164 = int(_3160) & 3;
    float _3166 = (*spvDescriptorSet0.vp_c15)._m0[int(_3162)][_3164];
    int _3168 = int(_3160) + 1;
    uint _3170 = uint(int(uint(_3168) >> uint(2)));
    int _3172 = _3168 & 3;
    float _3174 = (*spvDescriptorSet0.vp_c15)._m0[int(_3170)][_3172];
    float _3176 = -_3150;
    float _3178 = fma(_3176, _3132, 1.0);
    float _3180 = fma(_935, _2990, _3138);
    if (!_2962)
    {
        int _3182 = _3146 << 4;
        int _3184 = _3182 + _3156;
        _3142 = _3184;
    }
    int _3186 = _3142;
    float _3188 = _3148 + _2952;
    float _3190 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3192 = _3180 + _2998;
    float _3194 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _3196 = _2904 + 88;
    uint _3198 = uint(int(uint(_3196) >> uint(2)));
    uint _3200 = uint(int(uint(int(_3198)) >> uint(2)));
    int _3202 = int(_3198) & 3;
    float _3204 = (*spvDescriptorSet0.vp_c15)._m0[int(_3200)][_3202];
    int _3206 = int(_3198) + 1;
    uint _3208 = uint(int(uint(_3206) >> uint(2)));
    int _3210 = _3206 & 3;
    float _3212 = (*spvDescriptorSet0.vp_c15)._m0[int(_3208)][_3210];
    float _3214 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3190);
    float _3216 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3218 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3194);
    float _3220 = _2804;
    float _3222 = _3192;
    if (!_2962)
    {
        float _3224 = floor(_2876);
        _3220 = _3224;
    }
    float _3226 = _3220;
    float _3228 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3214);
    float _3230 = _3188 * _3152;
    float _3232 = _3192 * _3152;
    float _3234 = _3188;
    float _3236 = _3152;
    if (!_2962)
    {
        int _3238 = _3186 + 400;
        uint _3240 = uint(int(uint(_3238) >> uint(2)));
        uint _3242 = uint(int(uint(int(_3240)) >> uint(2)));
        int _3244 = int(_3240) & 3;
        float _3246 = (*spvDescriptorSet0.vp_c15)._m0[int(_3242)][_3244];
        _3234 = _3246;
    }
    float _3248 = _3234;
    float _3250 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3218);
    float _3252 = _3228 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3254 = _3230 >= 0.0;
    float _3256 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3216);
    float _3258 = _3250 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3260 = _3252 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3262 = _3230 <= 1.0;
    bool _3264 = _3262 && _3254;
    float _3266 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3256);
    float _3268 = log2(_3178);
    float _3270 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3260);
    bool _3272 = _3232 >= 0.0;
    bool _3274 = _3272 && _3264;
    float _3276 = _3266 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3278 = _3252 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3280 = fma(_3136, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3270);
    bool _3282 = _3232 <= 1.0;
    bool _3284 = _3282 && _3274;
    float _3286 = _3252 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3288 = _2846;
    if (!_2962)
    {
        float _3290 = floor(_2828);
        _3288 = _3290;
    }
    float _3292 = _3288;
    float _3294 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3280);
    float _3296 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3278);
    float _3298 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3286);
    float _3300 = _3226;
    if (!_2962)
    {
        float _3302 = -_3226;
        float _3304 = _2876 + _3302;
        _3300 = _3304;
    }
    float _3306 = _3300;
    float _3308 = fma(_3136, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3296);
    float _3310 = fma(_3136, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3298);
    float _3312 = 1.0 / _3294;
    float _3314 = _3268 * 0.693147182464599609375;
    float _3316 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3308);
    if (_3284)
    {
        float _3318 = float(_2900);
        _2956 = _3318;
    }
    float _3320 = _2956;
    float _3322 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3310);
    float _3324 = _2798 * _3174;
    if (!_2962)
    {
        float _3326 = -_3292;
        float _3328 = _2828 + _3326;
        _3222 = _3328;
    }
    float _3330 = _3222;
    float _3332 = _3320;
    if (_3284)
    {
        float _3334 = rint(_3320);
        float _3336 = precise::max(_3334, 0.0);
        uint _3338 = uint(_3336);
        uint _3340 = clamp(_3338, 0u, 65535u);
        _3332 = as_type<float>(_3340);
    }
    float _3342 = _3332;
    float _3344 = fma(_933, _3166, _3324);
    float _3346 = _3314 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3348 = fma(_935, _3204, _3344);
    float _3350 = _3322 * _3312;
    float _3352 = _3348 + _3212;
    float _3354 = _3316 * _3312;
    float _3356 = fma(_3350, -0.5, 0.5);
    float _3358 = _3308;
    if (!_2962)
    {
        float _3360 = rint(_3248);
        float _3362 = precise::max(_3360, 0.0);
        uint _3364 = uint(_3362);
        uint _3366 = clamp(_3364, 0u, 65535u);
        _3358 = as_type<float>(_3366);
    }
    float _3368 = _3358;
    float _3370 = _3352 * _3152;
    float _3372 = fma(_3354, 0.5, 0.5);
    float _3374 = _3232;
    float _3376 = _3370;
    if (_3284)
    {
        float3 _9211 = float3(_3230, _3232, float(as_type<int>(_3342)));
        float3 _9215 = select(_9211, float3(0.0), isnan(_9211));
        float _3378 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9215.xy, uint(rint(_9215.z)), _3370, level(0.0));
        _3374 = _3378;
    }
    float _3380 = _3374;
    float3 _9225 = float3(_3372, _3356, _3346);
    float _3382 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9225, float3(0.0), isnan(_9225)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9225, float3(0.0), isnan(_9225)), level(0.0)).x;
    float3 _9234 = float3(_3372, _3356, _3346);
    float4 _3385 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9234, float3(0.0), isnan(_9234)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9234, float3(0.0), isnan(_9234)), level(0.0)).xyzw;
    float _3387 = _3385.x;
    float _3389 = _3385.y;
    float _3391 = _3385.z;
    float _3393 = _3385.w;
    float _3395 = _3330;
    float _3397 = _3368;
    if (!_2962)
    {
        float3 _9258 = float3(_3330, _3306, float(as_type<int>(_3368)));
        float3 _9260 = select(_9258, float3(0.0), isnan(_9258));
        float _3399 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9260.xy, uint(rint(_9260.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9260.xy, uint(rint(_9260.z)), level(0.0)).x;
        _3395 = _3399;
    }
    float _3401 = _3395;
    if (_2962)
    {
        _3236 = 1.0;
    }
    float _3403 = _3236;
    float _3405 = _3403;
    if (!_2962)
    {
        int _3407 = _3108 << 4;
        int _3409 = _3407 + 2048;
        uint _3411 = uint(int(uint(_3409) >> uint(2)));
        uint _3413 = uint(int(uint(int(_3411)) >> uint(2)));
        int _3415 = int(_3411) & 3;
        float _3417 = (*spvDescriptorSet0.vp_c15)._m0[int(_3413)][_3415];
        int _3419 = int(_3411) + 1;
        uint _3421 = uint(int(uint(_3419) >> uint(2)));
        int _3423 = _3419 & 3;
        float _3425 = (*spvDescriptorSet0.vp_c15)._m0[int(_3421)][_3423];
        int _3427 = _3409 + 8;
        uint _3429 = uint(int(uint(_3427) >> uint(2)));
        uint _3431 = uint(int(uint(int(_3429)) >> uint(2)));
        int _3433 = int(_3429) & 3;
        float _3435 = (*spvDescriptorSet0.vp_c15)._m0[int(_3431)][_3433];
        int _3437 = int(_3429) + 1;
        uint _3439 = uint(int(uint(_3437) >> uint(2)));
        int _3441 = _3437 & 3;
        float _3443 = (*spvDescriptorSet0.vp_c15)._m0[int(_3439)][_3441];
        float _3445 = _2798 * _3425;
        float _3447 = fma(_933, _3417, _3445);
        float _3449 = fma(_935, _3435, _3447);
        float _3451 = _3449 + _3443;
        float _3453 = precise::clamp(_3451, 0.0, 1.0);
        float _3455 = -_3453;
        float _3457 = _3455 + _3401;
        float _3459 = fma(_3457, 500.0, 1.5);
        float _3461 = exp2(_3459);
        float _3463 = 0.0 + _3461;
        float _3465 = precise::clamp(_3463, 0.0, 1.0);
        _3126 = as_type<float>(_3409);
        _3405 = _3465;
    }
    float _3467 = _3126;
    float _3469 = _3405;
    float _3471 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3473 = _3090 + _3471;
    float _3475 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3477 = _3092 + _3475;
    float _3479 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3481 = _3094 + _3479;
    float _3483 = _3473 * _3473;
    float _3485 = fma(_3477, _3477, _3483);
    float _3487 = fma(_3481, _3481, _3485);
    float _3489 = rsqrt(_3487);
    float _3491 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3493 = _3477 * _3491;
    float _3495 = _3481 * _3491;
    float _3497 = _3493 * _3493;
    float _3499 = _3495 * _3495;
    float _3501 = _3497 + _3499;
    float _3503 = sqrt(_3501);
    bool _3505 = _3503 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3507 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3509 = _3503 + _3507;
    float _3511 = _3481;
    float _3513 = _3467;
    float _3515 = _3509;
    float _3517 = _3473;
    if (_3505)
    {
        float _3519 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3511 = _3519;
    }
    float _3521 = _3511;
    if (_3505)
    {
        float _3523 = rsqrt(_3501);
        _3513 = _3523;
    }
    float _3525 = _3513;
    float _3527 = _3525;
    if (_3505)
    {
        float _3529 = _3509 * _3521;
        _3515 = _3529;
    }
    float _3531 = _3515;
    if (_3505)
    {
        float _3533 = _3531 * 0.15915493667125701904296875;
        _3397 = _3533;
    }
    float _3535 = _3397;
    float _3537 = _3489;
    float _3539 = _3535;
    if (_3505)
    {
        float _3541 = _3535 * 6.283185482025146484375;
        float _3543 = sin(_3541);
        _3537 = _3543;
    }
    float _3545 = _3537;
    float _3547 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3549 = precise::max(0.0, _3547);
    float _3551 = _3485;
    float _3553 = _3549;
    float _3555 = _3547;
    if (_3505)
    {
        float _3557 = _3535 * 6.283185482025146484375;
        float _3559 = cos(_3557);
        _3551 = _3559;
    }
    float _3561 = _3551;
    float _3563 = -_3491;
    float _3565 = -_3549;
    float _3567 = fma(_3473, _3563, _3565);
    if (!_3505)
    {
        _3553 = _3495;
    }
    float _3569 = _3553;
    float _3571 = _3569;
    if (_3505)
    {
        float _3573 = _3567 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3555 = _3573;
    }
    float _3575 = _3555;
    float _3577 = _3545;
    float _3579 = _3575;
    if (_3505)
    {
        float _3581 = fma(_3545, _3575, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3517 = _3581;
    }
    float _3583 = _3517;
    float _3585 = _3583;
    if (!_3505)
    {
        _3577 = _3493;
    }
    float _3587 = _3577;
    float _3589 = _3587;
    float _3591 = _3561;
    if (_3505)
    {
        float _3593 = _3561 + (-1.0);
        _3579 = _3593;
    }
    float _3595 = _3579;
    if (_3505)
    {
        float _3597 = _3525 * _3583;
        _2400 = _3597;
    }
    float _3599 = _2400;
    if (!_3505)
    {
        _3585 = _3567;
    }
    float _3601 = _3585;
    float _3603 = _3601;
    if (_3505)
    {
        float _3605 = _3595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3539 = _3605;
    }
    float _3607 = _3539;
    if (_3505)
    {
        float _3609 = _3493 * _3599;
        _3589 = _3609;
    }
    float _3611 = _3589;
    if (!_3505)
    {
        _3527 = _3497;
    }
    float _3613 = _3527;
    float _3615 = _3613;
    if (_3505)
    {
        float _3617 = _3495 * _3599;
        _3571 = _3617;
    }
    float _3619 = _3571;
    if (_3505)
    {
        float _3621 = fma(_3567, _3561, _3607);
        _3603 = _3621;
    }
    float _3623 = _3603;
    if (_3505)
    {
        float _3625 = _3611 * _3611;
        _3615 = _3625;
    }
    float _3627 = _3615;
    if (!_3505)
    {
        _3591 = _3499;
    }
    float _3629 = _3591;
    float _3631 = _3629;
    if (_3505)
    {
        float _3633 = _3619 * _3619;
        _3631 = _3633;
    }
    float _3635 = _3631;
    float _3637 = sqrt(_3487);
    float _3639 = fma(_3623, _3623, _3627);
    float _3641 = _3639 + _3635;
    float _3643 = rsqrt(_3641);
    float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3647 = fma(_3637, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3645);
    float _3649 = precise::clamp(_3647, 0.0, 1.0);
    float _3651 = -_3649;
    float _3653 = _3651 + 1.0;
    float _3655 = _3643 * _3611;
    float _3657 = _3643 * _3623;
    float _3659 = _3643 * _3619;
    float _3661 = abs(_3653);
    float _3663 = log2(_3661);
    float _3665 = _3655 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3667 = -_3665;
    float _3669 = fma(_3657, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3667);
    float _3671 = -_3659;
    float _3673 = fma(_3671, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3669);
    float _3675 = fma(_3673, -0.5, 0.5);
    float _3677 = fma(_3673, 0.5, 0.5);
    float _3679 = _3663 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3681 = fma(_3677, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3683 = sqrt(_3675);
    float _3685 = fma(_3677, _3681, -0.212114393711090087890625);
    float _3687 = _3657 + 1.0;
    float _3689 = fma(_3677, _3685, 1.570728778839111328125);
    float _3691 = exp2(_3679);
    float _3693 = _3683 * 0.636619746685028076171875;
    float _3695 = -_3657;
    float _3697 = fma(_3691, _3687, _3695);
    float _3699 = -_3689;
    float _3701 = fma(_3693, _3699, 1.0);
    float _3703 = fma(_3697, 0.5, 0.5);
    float2 _9733 = float2(_3701, _3703);
    float3 _3705 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9733, float2(0.0), isnan(_9733)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9733, float2(0.0), isnan(_9733)), level(0.0)).xyz;
    float _3707 = _3705.x;
    float _3709 = _3705.y;
    float _3711 = _3705.z;
    float _3713 = abs(_2866);
    float _3715 = log2(_3713);
    float _3717 = _3252 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3719 = -_2776;
    float _3721 = _3719 + 1.0;
    out.m_90.x = _3092;
    out.m_90.y = _3090;
    out.m_90.z = _3094;
    float _3723 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3717);
    bool _3725 = _2866 <= 8000.0;
    bool _3727 = isnan(_2866);
    bool _3729 = _3725 || _3727;
    bool _3731 = isnan(8000.0);
    bool _3733 = _3729 || _3731;
    float _3735 = float(_3733);
    float _3737 = _3715 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3739 = fma(_3136, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3723);
    float _3741 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3739);
    float _3743 = exp2(_3737);
    float _3745 = fma(_3743, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3747 = precise::clamp(_3745, 0.0, 1.0);
    float _3749 = fma(_3747, -2.0, 3.0);
    float _3751 = _3747 * _3747;
    float _3753 = _3751 * _3749;
    float _3755 = _3663 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3757 = -_3753;
    float _3759 = _3757 + 1.0;
    float _3761 = exp2(_3755);
    float _3763 = fma(_3759, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3753);
    float _3765 = _3741 + _3294;
    float _3767 = _3735 * _3763;
    float _3769 = _3765 * 0.5;
    float _3771 = _3765;
    if (!_3284)
    {
        _3771 = 1.0;
    }
    float _3773 = _3771;
    out.gl_Position.x = _3316;
    out.gl_Position.y = _3322;
    out.gl_Position.z = _3741;
    out.gl_Position.w = _3294;
    float _3775 = _3767 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3777 = _3773;
    if (_3284)
    {
        bool _3779 = _3380 >= _3370;
        bool _3781 = isnan(_3380);
        bool _3783 = _3779 || _3781;
        bool _3785 = isnan(_3370);
        bool _3787 = _3783 || _3785;
        float _3789 = float(_3787);
        _3777 = _3789;
    }
    float _3791 = _3777;
    out.m_92.z = _3769;
    out.m_92.w = _3294;
    float _3793 = _3721 * _3775;
    float _3795 = precise::clamp(_3793, 0.0, 1.0);
    bool _3797 = _3637 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3799 = isnan(_3637);
    bool _3801 = _3797 || _3799;
    bool _3803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3805 = _3801 || _3803;
    float _3807 = _3791 * _3469;
    float _3809 = -_3761;
    float _3811 = _3809 + 1.0;
    float _3813 = -_3795;
    float _3815 = fma(_3813, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3817 = _3811 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3819 = -_3807;
    float _3821 = fma(_3819, _3815, 1.0);
    float _3823 = precise::clamp(_3821, 0.0, 1.0);
    float _3825 = _3817 * _3382;
    float _3827 = -_3817;
    float _3829 = _3827 + 1.0;
    float _3831 = _3823 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3833 = _3807;
    float _3835 = _3829;
    float _3837 = _3823;
    float _3839 = _3825;
    if (!_3805)
    {
        _3376 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3841 = _3376;
    float _3843 = _3393 * _3825;
    float _3845 = _3393 * _3829;
    float _3847 = _3843;
    float _3849 = _3841;
    float _3851 = _3841;
    if (!_3805)
    {
        _3833 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3853 = _3833;
    out.m_94.x = _3831;
    float _3855 = _3853;
    float _3857 = _3853;
    if (!_3805)
    {
        _3835 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3859 = _3835;
    float _3861 = _3859;
    float _3863 = _3859;
    if (!_3805)
    {
        _3837 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3865 = _3837;
    float _3867 = _3711 * _3825;
    float _3869 = fma(_3707, _3843, _3387);
    float _3871 = fma(_3709, _3843, _3389);
    float _3873 = _3865;
    float _3875 = _3865;
    if (!_3805)
    {
        _3847 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3877 = _3847;
    float _3879 = fma(_3393, _3867, _3391);
    float _3881 = _3877;
    float _3883 = _3877;
    if (!_3805)
    {
        _3839 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3885 = _3839;
    out.m_96.x = _3869;
    out.m_96.y = _3871;
    out.m_96.z = _3879;
    out.m_96.w = _3845;
    bool _3887 = !_3805;
    float _3889 = _3885;
    float _3891 = _3885;
    if (!_3887)
    {
        bool _3893 = _3637 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3895 = isnan(_3637);
        bool _3897 = _3893 || _3895;
        bool _3899 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3901 = _3897 || _3899;
        if (!_3901)
        {
            float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3905 = _3637 + _3903;
            float _3907 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3909 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3907;
            float _3911 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3913 = _3911 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3915 = 1.0 / _3909;
            float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3919 = _3917 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3923 = _3921 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3931 = _3929 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3933 = _3905 * _3915;
            float _3935 = precise::clamp(_3933, 0.0, 1.0);
            float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3939 = _3937 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3941 = fma(_3935, _3913, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3943 = fma(_3935, _3939, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3945 = fma(_3935, _3919, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3947 = fma(_3935, _3923, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3949 = fma(_3935, _3927, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3951 = fma(_3935, _3931, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3891 = _3941;
            _3863 = _3949;
            _3883 = _3945;
            _3857 = _3947;
            _3851 = _3943;
            _3875 = _3951;
            _3953 = true;
        }
        else
        {
            bool _3955 = _3637 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3957 = isnan(_3637);
            bool _3959 = _3955 || _3957;
            bool _3961 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3963 = _3959 || _3961;
            if (!_3963)
            {
                _3881 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3965 = _3881;
            _3883 = _3965;
            if (!_3963)
            {
                _3889 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3967 = _3889;
            _3891 = _3967;
            if (!_3963)
            {
                _3849 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3969 = _3849;
            _3851 = _3969;
            if (!_3963)
            {
                _3855 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3971 = _3855;
            _3857 = _3971;
            if (!_3963)
            {
                _3861 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3973 = _3861;
            _3863 = _3973;
            if (!_3963)
            {
                _3873 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3975 = _3873;
            bool _3977 = !_3963;
            _3875 = _3975;
            if (!_3977)
            {
                bool _3979 = _3637 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3981 = isnan(_3637);
                bool _3983 = _3979 || _3981;
                bool _3985 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3987 = _3983 || _3985;
                if (!_3987)
                {
                    float _3989 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3991 = _3637 + _3989;
                    float _3993 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3995 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3993;
                    float _3997 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3999 = _3997 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4001 = 1.0 / _3995;
                    float _4003 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4005 = _4003 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4007 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4009 = _4007 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4017 = _4015 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4019 = _3991 * _4001;
                    float _4021 = precise::clamp(_4019, 0.0, 1.0);
                    float _4023 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4025 = _4023 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4027 = fma(_4021, _3999, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4029 = fma(_4021, _4025, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4031 = fma(_4021, _4005, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4033 = fma(_4021, _4009, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4035 = fma(_4021, _4013, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4037 = fma(_4021, _4017, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3891 = _4027;
                    _3863 = _4035;
                    _3883 = _4031;
                    _3857 = _4033;
                    _3851 = _4029;
                    _3875 = _4037;
                    _3953 = true;
                }
                else
                {
                    _3891 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3863 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3883 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3857 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3851 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3875 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3953 = false;
    float _4039 = _3891;
    float _4041 = _3863;
    float _4043 = _3883;
    float _4045 = _3857;
    float _4047 = _3851;
    float _4049 = _3875;
    float _4051 = fma(_2690, -0.5, 0.5);
    float _4053 = precise::clamp(_4051, 0.0, 1.0);
    float _4055 = -_4039;
    float _4057 = _4055 + _4041;
    float _4059 = -_4043;
    float _4061 = _4059 + _4045;
    float _4063 = -_4047;
    float _4065 = _4063 + _4049;
    bool _4067 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4069 = fma(_4053, _4057, _4039);
    float _4071 = fma(_4053, _4061, _4043);
    float _4073 = fma(_4053, _4065, _4047);
    float _4075 = _4069 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _4077 = fma(_4071, 0.298911988735198974609375, _4075);
    float _4079 = fma(_4073, 0.114477999508380889892578125, _4077);
    out.m_98.x = 0.0;
    float _4081 = -_4079;
    float _4083 = _4071 + _4081;
    float _4085 = -_4079;
    float _4087 = _4069 + _4085;
    float _4089 = -_4079;
    float _4091 = _4073 + _4089;
    float _4093 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4095 = fma(_4083, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    float _4097 = fma(_4087, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    float _4099 = fma(_4091, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    out.m_94.w = _4093;
    out.m_100.x = _4095;
    out.m_100.y = _4097;
    out.m_100.z = _4099;
    if (!_4067)
    {
        return out;
    }
    float _4101 = -_3090;
    float _4103 = _4101 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4105 = -_3092;
    float _4107 = _4105 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4109 = -_3094;
    float _4111 = _4109 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4113 = _4103 * _4103;
    float _4115 = fma(_4107, _4107, _4113);
    float _4117 = fma(_4111, _4111, _4115);
    float _4119 = sqrt(_4117);
    float _4121 = rsqrt(_4117);
    float _4123 = -_4119;
    float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4127 = _4125 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4129 = precise::clamp(_4127, 0.0, 1.0);
    float _4131 = _4107 * _4121;
    float _4133 = _4103 * _4121;
    float _4135 = abs(_4129);
    float _4137 = log2(_4135);
    float _4139 = _4111 * _4121;
    float _4141 = _4131 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4143 = _2690 * _4133;
    float _4145 = -_4133;
    float _4147 = -_4141;
    float _4149 = fma(_4145, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4147);
    float _4151 = fma(_2686, _4131, _4143);
    float _4153 = -_4139;
    float _4155 = fma(_4153, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4149);
    float _4157 = fma(_2692, _4139, _4151);
    float _4159 = precise::clamp(_4157, 0.0, 1.0);
    float _4161 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4163 = _4155 + _4161;
    float _4165 = _4137 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4167 = _4163 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4169 = precise::clamp(_4167, 0.0, 1.0);
    float _4171 = exp2(_4165);
    float _4173 = _4171 * _4169;
    float _4175 = _4159 * _4173;
    float _4177 = _4175 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4179 = _4175 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4181 = _4175 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4177;
    out.m_98.y = _4179;
    out.m_98.z = _4181;
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
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3953 = false;
    bool _2728 = false;
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
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4239 = as_type<float>(_137);
        out.gl_Position.z = _4239;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_65.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _131 = _157;
    }
    float _159 = _131;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_63.x = 0.0;
    }
    int _171 = 0;
    if (_165)
    {
        float _173 = _169 * 5.0;
        _171 = as_type<int>(_173);
    }
    int _175 = _171;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4309 = as_type<float>(_175);
        out.gl_Position.z = _4309;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
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
        float _223 = _153 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = in.m_70.x;
    float _229 = in.m_70.y;
    float _231 = in.m_70.z;
    float _233 = in.m_70.w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = _225 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _249 = 1.0 / _241;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _251;
    int _255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _257 = _255 != 0;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _261 = 1.0 / _245;
    float _263 = _227 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _265 = _227 * 2.0;
    float _267 = 1.0 / _253;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _225 + _269;
    float _273 = -_247;
    float _275 = fma(_263, 2.0, _273);
    float _277 = _231 * 2.0;
    float _279 = _229 * 2.0;
    float _281 = _271 * _249;
    float _283 = _227 + _229;
    float _285 = _229 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _287 = floor(_265);
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _225 + _289;
    float _293 = _283 + (-1.0);
    float _295 = _231 + _229;
    float _297 = _291 * _261;
    float _299 = _231 + _227;
    float _301 = _295 + (-1.0);
    float _303 = floor(_277);
    float _305 = fma(_285, -2.0, _259);
    float _307 = _299 + (-1.0);
    float _309 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _311 = as_type<int>(_301);
    if (_257)
    {
        _311 = 0;
    }
    int _313 = _311;
    float _315 = _237 * _267;
    int _317 = _313;
    if (!_257)
    {
        _317 = 1;
    }
    int _319 = _317;
    float _321 = floor(_279);
    bool _323 = _287 >= 0.0;
    bool _325 = isnan(_287);
    bool _327 = _323 || _325;
    bool _329 = isnan(0.0);
    bool _331 = _327 || _329;
    float _333 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _335 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _337 = _287 > 0.0;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _343 = _303 > 0.0;
    float _345 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _347 = int(_345);
    bool _349 = _303 >= 0.0;
    bool _351 = isnan(_303);
    bool _353 = _349 || _351;
    bool _355 = isnan(0.0);
    bool _357 = _353 || _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    float _363 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _305);
    float _365 = _331 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _367 = fma(_361, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _369 = _321 > 0.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    bool _375 = _319 != 1;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _381 = _321 >= 0.0;
    bool _383 = isnan(_321);
    bool _385 = _381 || _383;
    bool _387 = isnan(0.0);
    bool _389 = _385 || _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _395 = _357 ? 0 : 1;
    float _397 = fma(_379, _297, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _399 = _389 ? 0 : 1;
    float _401 = fma(_393, _297, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _403 = ~as_type<int>(_365);
    int _405 = _403 + 1;
    int _407 = _405 + 1;
    float _409 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _411 = int(_409);
    int _413 = ~_399;
    int _415 = _413 + 1;
    int _417 = _415 + 1;
    float _419 = fma(_373, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _421 = ~_395;
    int _423 = _421 + 1;
    int _425 = _423 + 1;
    int _427 = _407;
    int _429 = _417;
    int _431 = _425;
    float _433 = _365;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    if (!_337)
    {
        int _437 = ~as_type<int>(_365);
        int _439 = _437 + 1;
        _427 = _439;
    }
    int _441 = _427;
    if (!_369)
    {
        int _443 = ~_399;
        int _445 = _443 + 1;
        _429 = _445;
    }
    int _447 = _429;
    if (!_343)
    {
        int _449 = ~_395;
        int _451 = _449 + 1;
        _431 = _451;
    }
    int _453 = _431;
    if (!_375)
    {
        _433 = _231;
    }
    float _455 = _433;
    float _457 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _459 = log2(_457);
    float _461 = float(_119);
    float _463 = _455;
    if (_375)
    {
        _463 = _229;
    }
    float _465 = _463;
    if (!_375)
    {
        _127 = _229;
    }
    float _467 = _127;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _475 = _473 != 0;
    int _477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _479 = _477 != 0;
    float _481 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[83].w, _339);
    float _483 = _467;
    if (_375)
    {
        _483 = _227;
    }
    float _485 = _483;
    float _487 = 1.0 / _461;
    float _489 = float(_347);
    bool _491 = !_475;
    int _493 = _491 ? 0 : 1;
    float _495 = _485 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _497 = !_471;
    int _499 = _497 ? 0 : 1;
    bool _501 = !_479;
    int _503 = _501 ? 0 : 1;
    float _505 = -_341;
    float _507 = fma(_495, 2.0, _505);
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _511 = _509 != 0;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _519 = _517 != 0;
    float _521 = 1.0 / _489;
    float _523 = float(_411);
    float _525 = _495;
    if (!_375)
    {
        _525 = _231;
    }
    float _527 = _525;
    float _529 = _487 * _153;
    bool _531 = !_511;
    int _533 = _531 ? 0 : 1;
    float _535 = 1.0 / _523;
    float _537 = _527;
    if (_375)
    {
        _537 = _229;
    }
    float _539 = _537;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _543 = float(_441);
    float _545 = _459 * _153;
    int _547 = abs(_533);
    float _549 = _539 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _551 = _521 * _153;
    bool _553 = !_519;
    int _555 = _553 ? 0 : 1;
    float _557 = fma(_549, -2.0, _541);
    float _559 = float(_447);
    float _561 = exp2(_545);
    float _563 = float(_547);
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_375)
    {
        _435 = _229;
    }
    float _567 = _435;
    float _569 = _535 * _153;
    float _571 = float(_453);
    float _573 = _567;
    if (_375)
    {
        _573 = _227;
    }
    float _575 = _573;
    float _577 = _563 * _571;
    int _579 = abs(_555);
    float _581 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[83].z, _565);
    float _583 = in.m_72.x;
    float _585 = in.m_72.y;
    float _587 = in.m_72.z;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _591 = 1.0 + _589;
    float _593 = float(_579);
    float _595 = -_561;
    float _597 = _595 + 1.0;
    bool _599 = !_515;
    int _601 = _599 ? 0 : 1;
    float _603 = 1.0 / _591;
    float _605 = _593 * _559;
    int _607 = abs(_601);
    float _609 = -_153;
    float _611 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[76].x, _275);
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _615 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _617 = isnan(1.0);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _623 = _619 || _621;
    float _625 = _605 * (-2.0);
    float _627 = float(_607);
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _631 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _633 = isnan(0.0);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _639 = _635 || _637;
    float _641 = _577 * (-2.0);
    bool _643 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _645 = isnan(_225);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = _627 * _543;
    float _657 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[78].z, _613);
    float _659 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[78].w, _629);
    float _661 = _639 ? _597 : 0.0;
    float _663 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _581);
    float _665 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _481);
    float _667 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _657);
    float _669 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _659);
    float _671 = -_153;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[81].x, _507);
    float _675 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _557);
    if (_623)
    {
        float _677 = _661 * _603;
        _155 = _677;
    }
    float _679 = _155;
    bool _681 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _683 = isnan(_225);
    bool _685 = _681 || _683;
    bool _687 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _689 = _685 || _687;
    float _691 = float(_689);
    float _693 = -_653;
    float _695 = _693 + 1.0;
    float _697 = fma(_641, _583, _583);
    float _699 = fma(_333, _641, _333);
    bool _701 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _703 = isnan(_225);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = _691 * _695;
    float _715 = -_691;
    float _717 = _715 + 1.0;
    float _719 = _227 + (-0.5);
    float _721 = _655 * (-2.0);
    bool _723 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _725 = isnan(_225);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = _711 * _717;
    float _737 = -_711;
    float _739 = _737 + 1.0;
    float _741 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[196].x, _697);
    float _743 = fma(_309, _721, _309);
    float _745 = fma(_721, _585, _585);
    float _747 = _229 + (-0.5);
    float _749 = _733 * _739;
    float _751 = -_733;
    float _753 = _751 + 1.0;
    float _755 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[196].y, _745);
    float _757 = _367 * _749;
    float _759 = _419 * _749;
    float _761 = fma(_335, _625, _335);
    float _763 = in.m_74.x;
    float _765 = in.m_74.y;
    float _767 = fma(_743, _679, _755);
    float _769 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[143].y, _759);
    float _771 = fma(_625, _587, _587);
    float _773 = _767 * 0.15915493667125701904296875;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _779;
    float _783 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[143].x, _757);
    float _785 = _231 + (-0.5);
    float _787 = fma(_777, _315, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _789 = fma(_401, _735, _769);
    float _791 = fma(_781, _315, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _793 = fma(_397, _735, _783);
    float _795 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[196].z, _771);
    float _797 = fma(_787, _713, _789);
    float _799 = fma(_699, _679, _741);
    float _801 = fma(_791, _713, _793);
    float _803 = fma(_761, _679, _795);
    float _805 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[146].y, _797);
    float _807 = _799 * 0.15915493667125701904296875;
    float _809 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[146].x, _801);
    float _811 = _803 * 0.15915493667125701904296875;
    float _813 = _773 * 6.283185482025146484375;
    float _815 = sin(_813);
    float _817 = _805 * _765;
    float _819 = _809 * _763;
    float _821 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _823 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _825 = _817 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _827 = _819 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _829 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _831 = _807 * 6.283185482025146484375;
    float _833 = cos(_831);
    float _835 = _825 * _823;
    float _837 = _827 * _821;
    float _839 = in.m_60.x;
    float _841 = in.m_60.y;
    float _843 = in.m_60.z;
    float _845 = _773 * 6.283185482025146484375;
    float _847 = cos(_845);
    float _849 = _807 * 6.283185482025146484375;
    float _851 = sin(_849);
    float _853 = _833 * _815;
    float _855 = _811 * 6.283185482025146484375;
    float _857 = cos(_855);
    float _859 = _833 * _847;
    float _861 = _811 * 6.283185482025146484375;
    float _863 = sin(_861);
    float _865 = _851 * _815;
    float _867 = _851 * _847;
    float _869 = _833 * _857;
    float _871 = _851 * _857;
    float _873 = _847 * _857;
    float _875 = _815 * _857;
    float _877 = _869 * _835;
    float _879 = -_853;
    float _881 = fma(_863, _867, _879);
    float _883 = fma(_863, _859, _865);
    float _885 = -_867;
    float _887 = fma(_863, _853, _885);
    float _889 = -_835;
    float _891 = _863 * _889;
    float _893 = _871 * _835;
    float _895 = fma(_883, _837, _877);
    float _897 = fma(_863, _865, _859);
    float _899 = fma(_873, _837, _891);
    float _901 = fma(_881, _837, _893);
    float _903 = fma(_887, _829, _895);
    float _905 = _841 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _907 = fma(_875, _829, _899);
    float _909 = _841 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _911 = _903 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _913 = _903 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _915 = fma(_897, _829, _901);
    float _917 = fma(_839, (*spvDescriptorSet0.vp_c10)._m0[4].x, _909);
    float _919 = fma(_839, (*spvDescriptorSet0.vp_c10)._m0[6].x, _905);
    float _921 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[24].x, _911);
    float _923 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[26].x, _913);
    float _925 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[4].z, _917);
    float _927 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[6].z, _919);
    float _929 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[24].z, _921);
    float _931 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[26].z, _923);
    float _933 = _925 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _935 = _927 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _937 = _929 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _939 = _931 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _941 = _841 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _943 = _903 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _945 = _933 + _937;
    float _947 = _935 + _939;
    float _949 = fma(_839, (*spvDescriptorSet0.vp_c10)._m0[5].x, _941);
    float _951 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[25].x, _943);
    float _953 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _955 = _945 + _953;
    float _957 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _959 = _947 + _957;
    float _961 = fma(_843, (*spvDescriptorSet0.vp_c10)._m0[5].z, _949);
    float _963 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[25].z, _951);
    float _965 = _955 * _955;
    float _967 = _959 * _959;
    float _969 = _961 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _971 = _963 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _973 = _965 + _967;
    float _975 = _969 + _971;
    float _977 = sqrt(_973);
    bool _979 = _977 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _981 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _983 = _977 + _981;
    float _985 = 0.0;
    float _987 = _961;
    float _989 = _943;
    float _991 = _843;
    float _993 = _947;
    float _995 = _975;
    float _997 = _965;
    if (_979)
    {
        float _999 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _985 = _999;
    }
    float _1001 = _985;
    if (_979)
    {
        float _1003 = _975 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _987 = _1003;
    }
    float _1005 = _987;
    float _1007 = _1005;
    if (!_979)
    {
        _989 = _945;
    }
    float _1009 = _989;
    float _1011 = _1009;
    if (_979)
    {
        float _1013 = rsqrt(_973);
        _991 = _1013;
    }
    float _1015 = _991;
    float _1017 = _1001;
    if (_979)
    {
        float _1019 = _983 * _1001;
        _1017 = _1019;
    }
    float _1021 = _1017;
    float _1023 = _1021;
    if (_979)
    {
        float _1025 = _1021 * 0.15915493667125701904296875;
        _1023 = _1025;
    }
    float _1027 = _1023;
    float _1029 = _839;
    if (_979)
    {
        float _1031 = _1027 * 6.283185482025146484375;
        float _1033 = sin(_1031);
        _1029 = _1033;
    }
    float _1035 = _1029;
    if (_979)
    {
        float _1037 = fma(_1035, _1005, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1007 = _1037;
    }
    float _1039 = _1007;
    float _1041 = _1039;
    if (_979)
    {
        float _1043 = _1015 * _1039;
        _1041 = _1043;
    }
    float _1045 = _1041;
    if (_979)
    {
        float _1047 = fma(_955, _1045, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1011 = _1047;
    }
    float _1049 = _1011;
    if (_979)
    {
        float _1051 = fma(_959, _1045, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _993 = _1051;
    }
    float _1053 = _993;
    float _1055 = fma(_1049, 6.2500002968590706586837768554688e-05, 0.5);
    float _1057 = fma(_1053, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _5696 = float2(_1055, _1057);
    float3 _1061 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_5696, float2(0.0), isnan(_5696)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_5696, float2(0.0), isnan(_5696)), level(0.0)).xyz;
    float _1063 = _1061.x;
    float _1065 = _1061.y;
    float _1067 = _1061.z;
    float _1069 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1071 = int(_1069);
    float _1073 = 0.0;
    if (_257)
    {
        float _1075 = in.m_70.x;
        _1073 = _1075;
    }
    float _1077 = _1073;
    float _1079 = -_669;
    float _1081 = _1079 + 1.0;
    float _1083 = -_663;
    float _1085 = _1083 + 1.0;
    float _1087 = _1077;
    if (!_257)
    {
        float _1089 = in.m_70.y;
        _1087 = _1089;
    }
    float _1091 = _1087;
    float _1093 = -_667;
    float _1095 = _1093 + 1.0;
    float _1097 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1099 = trunc(_551);
    int _1101 = int(_1099);
    float _1103 = -_665;
    float _1105 = _1103 + 1.0;
    float _1107 = float(uint(_1071));
    float _1109 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1111 = int(_1109);
    int _1113 = ~_1071;
    int _1115 = _1113 + 1;
    bool _1117 = _1071 == 0;
    float _1119 = float(uint(_1101));
    float _1121 = 1.0 / _1107;
    float _1123 = float(_1101);
    float _1125 = float(uint(_1111));
    float _1127 = _1107;
    if (_257)
    {
        _1127 = 1.0;
    }
    float _1129 = _1127;
    float _1131 = _1129;
    if (!_257)
    {
        _1131 = 7.345489978790283203125;
    }
    float _1133 = _1131;
    float _1135 = 1.0 / _1125;
    bool _1137 = _1111 == 0;
    int _1139 = as_type<int>(_1121) + (-2);
    float _1141 = _1133 * _227;
    float _1143 = as_type<float>(_1139) * _1119;
    float _1145 = floor(_1141);
    float _1147 = trunc(_1143);
    float _1149 = precise::max(_1147, 0.0);
    uint _1152 = uint(_1149);
    float _1154 = trunc(_569);
    int _1156 = int(_1154);
    float _1158 = -_1145;
    float _1160 = _1141 + _1158;
    int _1162 = _1115 * int(_1152);
    int _1164 = _1162 + _1101;
    int _1166 = ~_1111;
    int _1168 = _1166 + 1;
    float _1170 = float(uint(_1164));
    int _1172 = as_type<int>(_1135) + (-2);
    float _1174 = float(uint(_1156));
    float _1176 = as_type<float>(_1139) * _1170;
    float _1178 = as_type<float>(_1172) * _1174;
    float _1180 = trunc(_1176);
    float _1182 = precise::max(_1180, 0.0);
    uint _1184 = uint(_1182);
    float _1186 = float(_1071);
    bool _1188 = _1123 >= _1186;
    bool _1190 = isnan(_1123);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan(_1186);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = trunc(_1178);
    float _1202 = precise::max(_1200, 0.0);
    uint _1204 = uint(_1202);
    int _1206 = ~_1071;
    int _1208 = _1206 + 1;
    int _1210 = int(_1152) + int(_1184);
    float _1212 = _1160 * _1186;
    float _1214 = trunc(_1198);
    int _1216 = int(_1214);
    float _1218 = as_type<float>(_1184);
    if (_257)
    {
        _1218 = 1.0;
    }
    float _1220 = _1218;
    float _1222 = _1220;
    if (!_257)
    {
        _1222 = 1.2345600128173828125;
    }
    float _1224 = _1222;
    int _1226 = _1208 * _1210;
    int _1228 = _1226 + _1101;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1232 = _1230 != 0;
    int _1234 = _1168 * int(_1204);
    int _1236 = _1234 + _1156;
    float _1238 = trunc(_1212);
    int _1240 = int(_1238);
    bool _1242 = uint(_1228) >= uint(_1071);
    float _1244 = _1091 * _1224;
    float _1246 = float(uint(_1236));
    float _1248 = _1186 * _529;
    bool _1250 = !_1242;
    int _1252 = _1250 ? 0 : (-1);
    float _1254 = as_type<float>(_1172) * _1246;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1258 = _1256 != 0;
    float _1260 = trunc(_1248);
    int _1262 = int(_1260);
    int _1264 = ~_1210;
    int _1266 = _1264 + _1252;
    int _1268 = _1266 + 1;
    bool _1270 = !_1258;
    int _1272 = _1270 ? 0 : 1;
    int _1274 = ~_1111;
    int _1276 = _1274 + 1;
    int _1278 = _1071 * _1268;
    int _1280 = _1278 + _1101;
    int _1282 = abs(_1272);
    float _1284 = trunc(_1254);
    float _1286 = precise::max(_1284, 0.0);
    uint _1288 = uint(_1286);
    int _1290 = ~_1216;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    bool _1296 = !_1117;
    int _1298 = _1296 ? _1280 : (-1);
    int _1300 = _1240 * _1282;
    int _1302 = _1300 + _1101;
    int _1304 = _1071 + (-1);
    int _1306 = _1298 * _1294;
    int _1308 = abs(_499);
    int _1310 = int(_1204) + int(_1288);
    int _1312 = _1216 * _1304;
    int _1314 = _1312 + _1306;
    int _1316 = abs(_493);
    float _1318 = floor(_1244);
    float _1320 = float(_1111);
    int _1322 = _1276 * _1310;
    int _1324 = _1322 + _1156;
    float _1326 = float(_1156);
    bool _1328 = _1326 >= _1320;
    bool _1330 = isnan(_1326);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan(_1320);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    bool _1340 = uint(_1324) >= uint(_1111);
    int _1342 = _1314 * _1316;
    int _1344 = abs(_503);
    float _1346 = trunc(_1338);
    int _1348 = int(_1346);
    bool _1350 = !_1340;
    int _1352 = _1350 ? 0 : (-1);
    float _1354 = -_1318;
    float _1356 = _1244 + _1354;
    int _1358 = ~_1310;
    int _1360 = _1358 + _1352;
    int _1362 = _1360 + 1;
    bool _1364 = !_1232;
    int _1366 = _1364 ? 0 : 1;
    int _1368 = _1262 * _1308;
    int _1370 = _1368 + _1342;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1374 = _1372 != 0;
    int _1376 = _1111 * _1362;
    int _1378 = _1376 + _1156;
    int _1380 = abs(_1366);
    int _1382 = _1302 * _1344;
    int _1384 = _1382 + _1370;
    bool _1386 = !_1374;
    int _1388 = _1386 ? 0 : 1;
    float _1390 = _1320 * _529;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1394 = _1392 != 0;
    int _1396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1398 = _1396 != 0;
    int _1400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1402 = _1400 != 0;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1406 = _1404 != 0;
    float _1408 = _1356 * _1320;
    int _1410 = _1240 * _1380;
    int _1412 = _1410 + _1384;
    int _1414 = ~_1348;
    int _1416 = _1414 + 1;
    int _1418 = _1416 + 1;
    bool _1420 = !_1137;
    int _1422 = _1420 ? _1378 : (-1);
    float _1424 = trunc(_1390);
    int _1426 = int(_1424);
    bool _1428 = !_1398;
    int _1430 = _1428 ? 0 : 1;
    int _1432 = abs(_1388);
    int _1434 = _1422 * _1418;
    float _1436 = float(uint(_1412));
    bool _1438 = !_1394;
    int _1440 = _1438 ? 0 : 1;
    float _1442 = trunc(_1408);
    int _1444 = int(_1442);
    int _1446 = _1111 + (-1);
    float _1448 = as_type<float>(_1139) * _1436;
    int _1450 = abs(_1430);
    int _1452 = _1348 * _1446;
    int _1454 = _1452 + _1434;
    int _1456 = abs(_1440);
    float _1458 = trunc(_1448);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    int _1464 = ~_1071;
    int _1466 = _1464 + 1;
    int _1468 = _1454 * _1450;
    bool _1470 = !_1402;
    int _1472 = _1470 ? 0 : 1;
    int _1474 = _1444 * _1432;
    int _1476 = _1474 + _1156;
    float _1478 = float(uint(_1302));
    int _1480 = _1426 * _1456;
    int _1482 = _1480 + _1468;
    bool _1484 = !_1406;
    int _1486 = _1484 ? 0 : 1;
    int _1488 = abs(_1472);
    float _1490 = as_type<float>(_1139) * _1478;
    int _1492 = abs(_1486);
    int _1494 = _1466 * int(_1462);
    int _1496 = _1494 + _1412;
    float _1498 = float(uint(_1476));
    float _1500 = trunc(_1490);
    float _1502 = precise::max(_1500, 0.0);
    uint _1504 = uint(_1502);
    float _1506 = float(uint(_1496));
    float _1508 = as_type<float>(_1172) * _1498;
    int _1510 = _1476 * _1488;
    int _1512 = _1510 + _1482;
    int _1514 = ~_1071;
    int _1516 = _1514 + 1;
    float _1518 = as_type<float>(_1139) * _1506;
    int _1520 = _1444 * _1492;
    int _1522 = _1520 + _1512;
    float _1524 = trunc(_1508);
    float _1526 = precise::max(_1524, 0.0);
    uint _1528 = uint(_1526);
    int _1530 = ~_1111;
    int _1532 = _1530 + 1;
    float _1534 = float(uint(_1522));
    float _1536 = trunc(_1518);
    float _1538 = precise::max(_1536, 0.0);
    uint _1540 = uint(_1538);
    float _1542 = as_type<float>(_1172) * _1534;
    int _1544 = _1516 * int(_1504);
    int _1546 = _1544 + _1302;
    float _1548 = float(uint(_1546));
    float _1550 = trunc(_1542);
    float _1552 = precise::max(_1550, 0.0);
    uint _1554 = uint(_1552);
    int _1556 = ~_1111;
    int _1558 = _1556 + 1;
    int _1560 = _1532 * int(_1528);
    int _1562 = _1560 + _1476;
    float _1564 = as_type<float>(_1139) * _1548;
    int _1566 = ~_1071;
    int _1568 = _1566 + 1;
    float _1570 = float(uint(_1562));
    int _1572 = int(_1462) + int(_1540);
    float _1574 = trunc(_1564);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    float _1580 = as_type<float>(_1172) * _1570;
    int _1582 = _1558 * int(_1554);
    int _1584 = _1582 + _1522;
    int _1586 = _1568 * _1572;
    int _1588 = _1586 + _1412;
    float _1590 = trunc(_1580);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    float _1596 = float(uint(_1584));
    bool _1598 = uint(_1588) >= uint(_1071);
    float _1600 = as_type<float>(_1172) * _1596;
    bool _1602 = !_1598;
    int _1604 = _1602 ? 0 : (-1);
    int _1606 = int(_1504) + int(_1578);
    int _1608 = ~_1572;
    int _1610 = _1608 + _1604;
    int _1612 = _1610 + 1;
    float _1614 = trunc(_1600);
    float _1616 = precise::max(_1614, 0.0);
    uint _1618 = uint(_1616);
    int _1620 = ~_1111;
    int _1622 = _1620 + 1;
    int _1624 = int(_1528) + int(_1594);
    int _1626 = _1071 * _1612;
    int _1628 = _1626 + _1412;
    int _1630 = ~_1111;
    int _1632 = _1630 + 1;
    int _1634 = ~_1071;
    int _1636 = _1634 + 1;
    bool _1638 = !_1117;
    int _1640 = _1638 ? _1628 : (-1);
    int _1642 = _1636 * _1606;
    int _1644 = _1642 + _1302;
    int _1646 = _1640 & 3;
    bool _1648 = _1646 != 0;
    int _1650 = int(_1554) + int(_1618);
    int _1652 = _1640 & 3;
    bool _1654 = _1652 != 0;
    int _1656 = _1648 ? 0 : 1;
    int _1658 = _1632 * _1650;
    int _1660 = _1658 + _1522;
    bool _1662 = uint(_1652) >= 2u;
    bool _1664 = uint(_1644) >= uint(_1071);
    int _1666 = _1662 ? 0 : 1;
    bool _1668 = uint(_1660) >= uint(_1111);
    bool _1670 = !_1664;
    int _1672 = _1670 ? 0 : (-1);
    bool _1674 = !_1668;
    int _1676 = _1674 ? 0 : (-1);
    bool _1678 = _1652 != 3;
    int _1680 = ~_1650;
    int _1682 = _1680 + _1676;
    int _1684 = _1682 + 1;
    int _1686 = ~_1606;
    int _1688 = _1686 + _1672;
    int _1690 = _1688 + 1;
    int _1692 = _1622 * _1624;
    int _1694 = _1692 + _1476;
    int _1696 = _1640 >> 31;
    int _1698 = _1111 * _1684;
    int _1700 = _1698 + _1522;
    bool _1702 = uint(_1652) > 1u;
    int _1704 = _1071 * _1690;
    int _1706 = _1704 + _1302;
    bool _1708 = _233 > 0.5;
    bool _1710 = !_1137;
    int _1712 = _1710 ? _1700 : (-1);
    int _1714 = ~_1666;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    int _1720 = _1712 >> 31;
    int _1722 = _1718;
    if (_1678)
    {
        int _1724 = ~_1666;
        int _1726 = _1724 + 1;
        _1722 = _1726;
    }
    int _1728 = _1722;
    int _1730 = _1696 & 3;
    float _1732 = -_195;
    int _1734 = _1708 ? as_type<int>(_1732) : as_type<int>(_195);
    int _1736 = _1720 & 3;
    int _1738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1740 = _1738 != 0;
    bool _1742 = !_1117;
    int _1744 = _1742 ? _1706 : (-1);
    int _1746 = _1640 + _1730;
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1750 = _1748 != 0;
    int _1752 = _1712 + _1736;
    bool _1754 = !_1740;
    int _1756 = _1754 ? 0 : 1;
    int _1758 = _1712 & 3;
    bool _1760 = _1758 != 0;
    int _1762 = _1746 >> 2;
    int _1764 = ~_1656;
    int _1766 = _1764 + 1;
    int _1768 = _1766 + 1;
    bool _1770 = !_1750;
    int _1772 = _1770 ? 0 : 1;
    int _1774 = _1752 >> 2;
    int _1776 = _1768;
    if (!_1702)
    {
        int _1778 = ~_1656;
        int _1780 = _1778 + 1;
        _1776 = _1780;
    }
    int _1782 = _1776;
    int _1784 = _1712 & 3;
    bool _1786 = _1784 != 0;
    bool _1788 = uint(_1694) >= uint(_1111);
    bool _1790 = !_1760;
    int _1792 = _1790 ? 0 : 1;
    bool _1794 = uint(_1758) > 1u;
    int _1796 = _1762 << 4;
    int _1798 = _1796 + 368;
    int _1800 = _1774 << 4;
    int _1802 = _1800 + 512;
    int _1804 = _1786 ? 0 : 1;
    bool _1806 = !_1654;
    int _1808 = _1806 ? 0 : 1;
    bool _1810 = !_1788;
    int _1812 = _1810 ? 0 : (-1);
    bool _1814 = _1652 != 3;
    int _1816 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1818 = _1816 != 0;
    uint _1820 = uint(int(uint(_1798) >> uint(2)));
    uint _1822 = uint(int(uint(int(_1820)) >> uint(2)));
    int _1824 = int(_1820) & 3;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[int(_1822)][_1824];
    int _1828 = int(_1820) + 1;
    uint _1830 = uint(int(uint(_1828) >> uint(2)));
    int _1832 = _1828 & 3;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[int(_1830)][_1832];
    int _1836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1838 = _1836 != 0;
    int _1840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1842 = _1840 != 0;
    int _1844 = ~_1804;
    int _1846 = _1844 + 1;
    int _1848 = _1846 + 1;
    int _1850 = ~_1624;
    int _1852 = _1850 + _1812;
    int _1854 = _1852 + 1;
    uint _1856 = uint(int(uint(_1802) >> uint(2)));
    uint _1858 = uint(int(uint(int(_1856)) >> uint(2)));
    int _1860 = int(_1856) & 3;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[int(_1858)][_1860];
    int _1864 = int(_1856) + 1;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    int _1868 = _1864 & 3;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[int(_1866)][_1868];
    int _1872 = _1848;
    if (!_1794)
    {
        int _1874 = ~_1804;
        int _1876 = _1874 + 1;
        _1872 = _1876;
    }
    int _1878 = _1872;
    bool _1880 = !_1814;
    int _1882 = _1880 ? 0 : (-1);
    int _1884 = _1111 * _1854;
    int _1886 = _1884 + _1476;
    bool _1888 = _1758 != 3;
    bool _1890 = uint(_1758) >= 2u;
    int _1892 = _1802 + 8;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    uint _1896 = uint(int(uint(int(_1894)) >> uint(2)));
    int _1898 = int(_1894) & 3;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[int(_1896)][_1898];
    int _1902 = int(_1894) + 1;
    uint _1904 = uint(int(uint(_1902) >> uint(2)));
    int _1906 = _1902 & 3;
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[int(_1904)][_1906];
    int _1910 = _1890 ? 0 : 1;
    bool _1912 = _1758 != 3;
    int _1914 = ~_1910;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    int _1920 = _1798 + 8;
    uint _1922 = uint(int(uint(_1920) >> uint(2)));
    uint _1924 = uint(int(uint(int(_1922)) >> uint(2)));
    int _1926 = int(_1922) & 3;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[int(_1924)][_1926];
    int _1930 = int(_1922) + 1;
    uint _1932 = uint(int(uint(_1930) >> uint(2)));
    int _1934 = _1930 & 3;
    float _1936 = (*spvDescriptorSet0.vp_c9)._m0[int(_1932)][_1934];
    bool _1938 = !_1137;
    int _1940 = _1938 ? _1886 : (-1);
    int _1942 = _1918;
    if (_1888)
    {
        int _1944 = ~_1910;
        int _1946 = _1944 + 1;
        _1942 = _1946;
    }
    int _1948 = _1942;
    int _1950 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1952 = _1950 != 0;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1958 = abs(_1878);
    float _1960 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1962 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1966 = _1956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1968 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1970 = abs(_1782);
    int _1972 = abs(_1808);
    out.m_76.x = _1962;
    out.m_76.y = _1966;
    out.m_76.z = _1968;
    out.m_76.w = _1964;
    bool _1974 = !_1912;
    int _1976 = _1974 ? 0 : (-1);
    bool _1978 = _227 > 0.5;
    bool _1980 = _229 > 0.5;
    int _1982 = ~_1970;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1990 = -_191;
    int _1992 = _1978 ? as_type<int>(_1990) : as_type<int>(_191);
    float _1994 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1996 = int(_1994);
    int _1998 = _1986 * as_type<int>(_1834);
    float _2000 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2002 = abs(_1792);
    float _2004 = _887 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2006 = ~_1958;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    bool _2012 = _231 > 0.5;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2016 = ~_1972;
    int _2018 = _2016 + 1;
    int _2020 = _2018 + 1;
    int _2022 = _2010 * as_type<int>(_1870);
    int _2024 = ~_2002;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    float _2030 = _1988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2032 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2034 = _2020 * as_type<int>(_1826);
    int _2036 = _2034 + _1998;
    int _2038 = abs(_1728);
    int _2040 = _2028 * as_type<int>(_1862);
    int _2042 = _2040 + _2022;
    int _2044 = abs(_1948);
    float _2046 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2048 = int(_2046);
    out.m_78.x = _2000;
    out.m_78.y = _2030;
    out.m_78.z = _2032;
    int _2050 = abs(_1882);
    float _2052 = _869 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2054 = abs(_1976);
    float _2056 = _883 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2058 = ~_2038;
    int _2060 = _2058 + 1;
    int _2062 = _2060 + 1;
    float _2064 = as_type<float>(_1948);
    if (_979)
    {
        float _2066 = _1027 * 6.283185482025146484375;
        float _2068 = cos(_2066);
        _2064 = _2068;
    }
    float _2070 = _2064;
    bool _2072 = !_1818;
    float _2074 = _2072 ? _195 : as_type<float>(_1734);
    float _2076 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2056);
    bool _2078 = !_1952;
    float _2080 = _2078 ? _191 : as_type<float>(_1992);
    int _2082 = _2062 * as_type<int>(_1928);
    int _2084 = _2082 + _2036;
    int _2086 = ~_2044;
    int _2088 = _2086 + 1;
    int _2090 = _2088 + 1;
    float _2092 = float(uint(_1996));
    float _2094 = _887 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2096 = _2090 * as_type<int>(_1900);
    int _2098 = _2096 + _2042;
    int _2100 = ~_2054;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    int _2106 = ~_2050;
    int _2108 = _2106 + 1;
    int _2110 = _2108 + 1;
    float _2112 = 1.0 / _2092;
    int _2114 = abs(_1756);
    int _2116 = _2104 * as_type<int>(_1908);
    int _2118 = _2116 + _2098;
    int _2120 = abs(_1996);
    int _2122 = _2110 * as_type<int>(_1936);
    int _2124 = _2122 + _2084;
    int _2126 = abs(_1772);
    float _2128 = -_863;
    float _2130 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2052);
    int _2132 = ~_2114;
    int _2134 = _2132 + 1;
    int _2136 = _2134 + 1;
    float _2138 = float(uint(_2048));
    int _2140 = abs(_2048);
    int _2142 = _2124 * _2136;
    float _2144 = 1.0 / _2138;
    int _2146 = ~_2126;
    int _2148 = _2146 + 1;
    int _2150 = _2148 + 1;
    int _2152 = _1744 * _2114;
    int _2154 = _2152 + _2142;
    float _2156 = float(uint(_2140));
    float _2158 = _869 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2160 = float(uint(_2120));
    int _2162 = _2118 * _2150;
    int _2164 = ~_1996;
    int _2166 = _2164 + 1;
    float _2168 = _883 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2170 = _869 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2172 = 1.0 / _2156;
    int _2174 = _1940 * _2126;
    int _2176 = _2174 + _2162;
    int _2178 = as_type<int>(_2112) + (-2);
    float _2180 = -_863;
    float _2182 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2170);
    float _2184 = float(uint(_2154));
    float _2186 = -_863;
    float _2188 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2158);
    int _2190 = as_type<int>(_2144) + (-2);
    float _2192 = _883 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2194 = 1.0 / _2160;
    float _2196 = as_type<float>(_2178) * _2184;
    float _2198 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2182);
    int _2200 = abs(_2176);
    float _2202 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2188);
    int _2204 = abs(_2154);
    float _2206 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2192);
    float _2208 = trunc(_2196);
    float _2210 = precise::max(_2208, 0.0);
    uint _2212 = uint(_2210);
    float _2214 = float(uint(_2176));
    float _2216 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2168);
    int _2218 = as_type<int>(_2172) + (-2);
    float _2220 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2004);
    float _2222 = as_type<float>(_2190) * _2214;
    float _2224 = float(uint(_2204));
    float _2226 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2130);
    int _2228 = as_type<int>(_2194) + (-2);
    float _2230 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2206);
    float _2232 = float(uint(_2200));
    float _2234 = trunc(_2222);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    int _2240 = ~_2140;
    int _2242 = _2240 + 1;
    float _2244 = as_type<float>(_2228) * _2224;
    float _2246 = _887 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2248 = as_type<float>(_2218) * _2232;
    float _2250 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2094);
    int _2252 = _2166 * int(_2212);
    int _2254 = _2252 + _2154;
    float _2256 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2246);
    float _2258 = trunc(_2244);
    float _2260 = precise::max(_2258, 0.0);
    uint _2262 = uint(_2260);
    float _2264 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2250);
    float _2266 = _2246;
    float _2268 = as_type<float>(_2242);
    float _2270 = _2076;
    if (_979)
    {
        float _2272 = _2070 + (-1.0);
        _2266 = _2272;
    }
    float _2274 = _2266;
    float _2276 = float(uint(_2254));
    float _2278 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2256);
    float _2280 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2220);
    int _2282 = ~_2120;
    int _2284 = _2282 + 1;
    float _2286 = _2274;
    float _2288 = _2278;
    if (_979)
    {
        float _2290 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2286 = _2290;
    }
    float _2292 = _2286;
    float _2294 = trunc(_2248);
    float _2296 = precise::max(_2294, 0.0);
    uint _2298 = uint(_2296);
    int _2300 = ~_2048;
    int _2302 = _2300 + 1;
    float _2304 = as_type<float>(_2178) * _2276;
    if (_979)
    {
        float _2306 = fma(_975, _2070, _2292);
        _995 = _2306;
    }
    float _2308 = _995;
    float _2310 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2312 = _2302 * int(_2238);
    int _2314 = _2312 + _2176;
    bool _2316 = _2048 == 0;
    int _2318 = _2284 * int(_2262);
    int _2320 = _2318 + _2204;
    float _2322 = trunc(_2304);
    float _2324 = precise::max(_2322, 0.0);
    uint _2326 = uint(_2324);
    float _2328 = float(uint(_2314));
    float _2330 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2332 = float(uint(_2320));
    float _2334 = -_195;
    int _2336 = _1980 ? as_type<int>(_2334) : as_type<int>(_195);
    int _2338 = _2242 * int(_2298);
    int _2340 = _2338 + _2200;
    if (_979)
    {
        float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2344 = _1049 + _2342;
        _2268 = _2344;
    }
    float _2346 = _2268;
    float _2348 = _2330 * _2202;
    bool _2350 = !_1838;
    float _2352 = _2350 ? _195 : as_type<float>(_2336);
    float _2354 = float(uint(_2340));
    float _2356 = as_type<float>(_2190) * _2328;
    float _2358 = _2348;
    if (_979)
    {
        float _2360 = _2346 * _2346;
        _997 = _2360;
    }
    float _2362 = _997;
    float _2364 = -_191;
    int _2366 = _2012 ? as_type<int>(_2364) : as_type<int>(_191);
    float _2368 = as_type<float>(_2228) * _2332;
    float _2370 = as_type<float>(_2218) * _2354;
    float _2372 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2374 = _2308 + _2372;
    float _2376 = trunc(_2356);
    float _2378 = precise::max(_2376, 0.0);
    uint _2380 = uint(_2378);
    bool _2382 = !_1842;
    float _2384 = _2382 ? _191 : as_type<float>(_2366);
    float _2386 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2076);
    float _2388 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2216);
    float _2390 = _2388;
    if (!_979)
    {
        _2270 = _967;
    }
    float _2392 = _2270;
    float _2394 = _2330 * _2198;
    float _2396 = fma(_2310, _2386, _2348);
    float _2398 = _2392;
    float _2400 = _2396;
    if (_979)
    {
        float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2404 = _1053 + _2402;
        _2358 = _2404;
    }
    float _2406 = _2358;
    float _2408 = trunc(_2368);
    float _2410 = precise::max(_2408, 0.0);
    uint _2412 = uint(_2410);
    float _2414 = _2330 * _2226;
    float _2416 = fma(_2310, _2230, _2394);
    if (_979)
    {
        float _2418 = _2406 * _2406;
        _2398 = _2418;
    }
    float _2420 = _2398;
    bool _2422 = _2048 == 0;
    float _2424 = fma(_2310, _2388, _2414);
    out.m_80.x = _2386;
    out.m_80.y = _2230;
    out.m_80.z = _2388;
    float _2426 = trunc(_2370);
    float _2428 = precise::max(_2426, 0.0);
    uint _2430 = uint(_2428);
    float _2432 = fma(_2374, _2374, _2362);
    int _2434 = int(_2212) + int(_2326);
    int _2436 = ~_2120;
    int _2438 = _2436 + 1;
    int _2440 = int(_2238) + int(_2380);
    int _2442 = int(_2262) + int(_2412);
    float _2444 = _2432 + _2420;
    int _2446 = ~_2048;
    int _2448 = _2446 + 1;
    int _2450 = ~_1996;
    int _2452 = _2450 + 1;
    int _2454 = _2448 * _2440;
    int _2456 = _2454 + _2176;
    int _2458 = int(_2298) + int(_2430);
    int _2460 = _2438 * _2442;
    int _2462 = _2460 + _2204;
    int _2464 = ~_2140;
    int _2466 = _2464 + 1;
    int _2468 = _2452 * _2434;
    int _2470 = _2468 + _2154;
    bool _2472 = uint(_2456) >= uint(_2048);
    float _2474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2476 = uint(_2462) >= uint(_2120);
    int _2478 = _2466 * _2458;
    int _2480 = _2478 + _2200;
    bool _2482 = uint(_2470) >= uint(_1996);
    bool _2484 = !_2472;
    int _2486 = _2484 ? 0 : (-1);
    bool _2488 = !_2482;
    int _2490 = _2488 ? 0 : (-1);
    float _2492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2494 = uint(_2480) >= uint(_2140);
    int _2496 = _2154 ^ _1996;
    int _2498 = ~_2440;
    int _2500 = _2498 + _2486;
    int _2502 = _2500 + 1;
    int _2504 = ~_2434;
    int _2506 = _2504 + _2490;
    int _2508 = _2506 + 1;
    float _2510 = _2474 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2512 = !_2476;
    int _2514 = _2512 ? 0 : (-1);
    float _2516 = sqrt(_2444);
    uint _2518 = uint(int(uint(_2496) >> uint(31)));
    int _2520 = _1996 * _2508;
    int _2522 = _2520 + _2154;
    int _2524 = _2176 ^ _2048;
    int _2526 = _2048 * _2502;
    int _2528 = _2526 + _2176;
    bool _2530 = _1996 == 0;
    float _2532 = _2492 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2534 = _1996 == 0;
    int _2536 = ~_2514;
    int _2538 = _2442 + _2536;
    int _2540 = _2538 + 1;
    float _2542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2544 = ~int(_2518);
    int _2546 = _2544 + 1;
    bool _2548 = !_2494;
    int _2550 = _2548 ? 0 : (-1);
    uint _2552 = uint(int(uint(_2524) >> uint(31)));
    int _2554 = _2540 ^ _2546;
    float _2556 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2558 = !_2530;
    int _2560 = _2558 ? _2522 : (-1);
    int _2562 = ~_2550;
    int _2564 = _2458 + _2562;
    int _2566 = _2564 + 1;
    int _2568 = ~int(_2552);
    int _2570 = _2568 + 1;
    int _2572 = ~_2546;
    int _2574 = _2572 + _2554;
    int _2576 = _2574 + 1;
    float _2578 = fma(_2330, _2330, 1.0);
    float _2580 = float(_2560);
    int _2582 = _2566 ^ _2570;
    bool _2584 = !_2316;
    int _2586 = _2584 ? _2528 : (-1);
    float _2588 = fma(_2510, _2580, _611);
    float _2590 = rsqrt(_2578);
    int _2592 = ~_2570;
    int _2594 = _2592 + _2582;
    int _2596 = _2594 + 1;
    float _2598 = _2542 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2600 = !_2534;
    int _2602 = _2600 ? _2576 : (-1);
    float _2604 = _2556 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2606 = float(_2586);
    float _2608 = _2080 + 0.5;
    float _2610 = float(_2602);
    out.m_82.x = _1063;
    out.m_82.y = _1065;
    out.m_82.z = _1067;
    bool _2612 = _2516 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2614 = isnan(_2516);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2620 = _2616 || _2618;
    float _2622 = fma(_2598, _2606, _673);
    bool _2624 = !_2422;
    int _2626 = _2624 ? _2596 : (-1);
    float _2628 = -_363;
    float _2630 = fma(_2532, _2610, _2628);
    float _2632 = _2384 + 0.5;
    float _2634 = fma(_2510, _2608, _2588);
    float _2636 = float(_2626);
    float _2638 = _2352 + (-0.5);
    float _2640 = fma(_2598, _2632, _2622);
    float _2642 = _2330 * _2590;
    float _2644 = -_1095;
    float _2646 = fma(_2080, _2644, _2634);
    float _2648 = -_675;
    float _2650 = fma(_2604, _2636, _2648);
    float _2652 = _2074 + (-0.5);
    float _2654 = -_2532;
    float _2656 = fma(_2654, _2638, _2630);
    float _2658 = -_2264;
    float _2660 = _2642 * _2658;
    float _2662 = -_2278;
    float _2664 = _2642 * _2662;
    float _2666 = -_2280;
    float _2668 = _2642 * _2666;
    float _2670 = -_2604;
    float _2672 = fma(_2670, _2652, _2650);
    float _2674 = fma(_2590, _2202, _2660);
    float _2676 = fma(_2590, _2198, _2664);
    float _2678 = -_1085;
    float _2680 = fma(_2384, _2678, _2640);
    float _2682 = fma(_2352, _1081, _2656);
    float _2684 = fma(_2590, _2226, _2668);
    float _2686 = _2264 + _2396;
    float _2688 = fma(_2074, _1105, _2672);
    float _2690 = _2278 + _2416;
    float _2692 = _2280 + _2424;
    out.m_84.x = _2674;
    out.m_84.y = _2676;
    out.m_84.z = _2684;
    if (!_2620)
    {
        _2288 = 1.0;
    }
    float _2694 = _2288;
    out.m_86.x = _2646;
    out.m_86.y = _2682;
    out.m_86.z = _2680;
    out.m_86.w = _2688;
    out.m_88.x = _2686;
    out.m_88.y = _2690;
    out.m_88.z = _2692;
    bool _2696 = !_2620;
    float _2698 = _2694;
    if (!_2696)
    {
        bool _2700 = _2516 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2702 = isnan(_2516);
        bool _2704 = _2700 || _2702;
        bool _2706 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2708 = _2704 || _2706;
        if (!_2708)
        {
            float _2710 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2712 = _2516 + _2710;
            float _2714 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2716 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2714;
            float _2718 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2720 = _2718 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2722 = 1.0 / _2716;
            float _2724 = _2712 * _2722;
            float _2726 = fma(_2724, _2720, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2698 = _2726;
            _2728 = true;
        }
        else
        {
            bool _2730 = _2516 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2732 = isnan(_2516);
            bool _2734 = _2730 || _2732;
            bool _2736 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2738 = _2734 || _2736;
            if (!_2738)
            {
                float _2740 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2742 = _2516 + _2740;
                float _2744 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2746 = _2744 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2748 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2750 = _2748 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2752 = 1.0 / _2746;
                float _2754 = _2742 * _2752;
                float _2756 = fma(_2754, _2750, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2698 = _2756;
                _2728 = true;
            }
            else
            {
                _2698 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2728 = false;
    float _2758 = _2698;
    float _2760 = fma(_933, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2762 = fma(_935, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2764 = floor(_2760);
    float _2766 = floor(_2762);
    float _2768 = -_2764;
    float _2770 = _2760 + _2768;
    float _2772 = -_2766;
    float _2774 = _2762 + _2772;
    float2 _8185 = float2(_2770, _2774);
    float _2776 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8185, float2(0.0), isnan(_8185)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8185, float2(0.0), isnan(_8185)), level(0.0)).x;
    float _2778 = _969 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2780 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2782 = _1049 + _2780;
    float _2784 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2778);
    float _2786 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2788 = _1053 + _2786;
    float _2790 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2792 = fma(_2782, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2794 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2784);
    float _2796 = _969 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2798 = _969 + _2790;
    float _2800 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2802 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2796);
    float _2804 = fma(_2788, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2806 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2808 = 1.0 / _2800;
    float _2810 = fma(_935, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2802);
    float _2812 = fma(_933, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2806);
    float _2814 = _2810 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2816 = _2814 + _2800;
    float _2818 = _2816 * _2808;
    float _2820 = _2818 * 0.5;
    float _2822 = fma(_935, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2812);
    float _2824 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2826 = fma(_2820, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2824);
    float _2828 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2830 = 1.0 / _2826;
    bool _2832 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2834 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2836 = _2832 || _2834;
    bool _2838 = isnan(0.5);
    bool _2840 = _2836 || _2838;
    float _2842 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2844 = _2308 + _2842;
    float _2846 = fma(_2844, _2758, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2848 = trunc(_2828);
    int _2850 = int(_2848);
    float _2852 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2854 = fma(_933, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2852);
    float _2856 = _2844;
    int _2858 = 2;
    int _2860 = as_type<int>(_2758);
    if (_2840)
    {
        _2856 = _2846;
    }
    float _2862 = _2856;
    float _2864 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2866 = _2830 * _2864;
    float _2868 = fma(_935, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2854);
    float _2870 = _2862;
    if (_2840)
    {
        _2390 = _2804;
    }
    float _2872 = _2390;
    bool _2874 = _2866 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _2876 = _2868 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    bool _2878 = _2866 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _2880 = !_2874;
    int _2882 = _2880 ? 0 : 1;
    float _2884 = trunc(_2876);
    int _2886 = int(_2884);
    int _2888 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2890 = _2850 + _2888;
    int _2892 = _2890 + 1;
    float _2894 = _2872;
    if (!_2874)
    {
        _2858 = 1;
    }
    int _2896 = _2858;
    int _2898 = _2896;
    if (!_2878)
    {
        _2898 = _2882;
    }
    int _2900 = _2898;
    bool _2902 = _2892 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _2904 = _2900 << 6;
    int _2906 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2908 = _2886 + _2906;
    int _2910 = _2908 + 1;
    int _2912 = _2904 + 48;
    uint _2914 = uint(int(uint(_2912) >> uint(2)));
    uint _2916 = uint(int(uint(int(_2914)) >> uint(2)));
    int _2918 = int(_2914) & 3;
    float _2920 = (*spvDescriptorSet0.vp_c15)._m0[int(_2916)][_2918];
    int _2922 = int(_2914) + 1;
    uint _2924 = uint(int(uint(_2922) >> uint(2)));
    int _2926 = _2922 & 3;
    float _2928 = (*spvDescriptorSet0.vp_c15)._m0[int(_2924)][_2926];
    int _2930 = _2892 | _2910;
    bool _2932 = _2930 < 0;
    bool _2934 = _2932 || _2902;
    int _2936 = _2904 + 56;
    uint _2938 = uint(int(uint(_2936) >> uint(2)));
    uint _2940 = uint(int(uint(int(_2938)) >> uint(2)));
    int _2942 = int(_2938) & 3;
    float _2944 = (*spvDescriptorSet0.vp_c15)._m0[int(_2940)][_2942];
    int _2946 = int(_2938) + 1;
    uint _2948 = uint(int(uint(_2946) >> uint(2)));
    int _2950 = _2946 & 3;
    float _2952 = (*spvDescriptorSet0.vp_c15)._m0[int(_2948)][_2950];
    float _2954 = as_type<float>(_2930);
    float _2956 = as_type<float>(_2900);
    if (_2840)
    {
        _2954 = _2792;
    }
    float _2958 = _2954;
    bool _2960 = _2910 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2962 = _2960 || _2934;
    int _2964 = _2904 + 64;
    uint _2966 = uint(int(uint(_2964) >> uint(2)));
    uint _2968 = uint(int(uint(int(_2966)) >> uint(2)));
    int _2970 = int(_2966) & 3;
    float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
    int _2974 = int(_2966) + 1;
    uint _2976 = uint(int(uint(_2974) >> uint(2)));
    int _2978 = _2974 & 3;
    float _2980 = (*spvDescriptorSet0.vp_c15)._m0[int(_2976)][_2978];
    int _2982 = _2904 + 72;
    uint _2984 = uint(int(uint(_2982) >> uint(2)));
    uint _2986 = uint(int(uint(int(_2984)) >> uint(2)));
    int _2988 = int(_2984) & 3;
    float _2990 = (*spvDescriptorSet0.vp_c15)._m0[int(_2986)][_2988];
    int _2992 = int(_2984) + 1;
    uint _2994 = uint(int(uint(_2992) >> uint(2)));
    int _2996 = _2992 & 3;
    float _2998 = (*spvDescriptorSet0.vp_c15)._m0[int(_2994)][_2996];
    int _3000 = _2904 + 96;
    uint _3002 = uint(int(uint(_3000) >> uint(2)));
    uint _3004 = uint(int(uint(int(_3002)) >> uint(2)));
    int _3006 = int(_3002) & 3;
    float _3008 = (*spvDescriptorSet0.vp_c15)._m0[int(_3004)][_3006];
    int _3010 = int(_3002) + 1;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    int _3014 = _3010 & 3;
    float _3016 = (*spvDescriptorSet0.vp_c15)._m0[int(_3012)][_3014];
    int _3018 = _2904 + 104;
    uint _3020 = uint(int(uint(_3018) >> uint(2)));
    uint _3022 = uint(int(uint(int(_3020)) >> uint(2)));
    int _3024 = int(_3020) & 3;
    float _3026 = (*spvDescriptorSet0.vp_c15)._m0[int(_3022)][_3024];
    int _3028 = int(_3020) + 1;
    uint _3030 = uint(int(uint(_3028) >> uint(2)));
    int _3032 = _3028 & 3;
    float _3034 = (*spvDescriptorSet0.vp_c15)._m0[int(_3030)][_3032];
    float _3036 = _2958;
    int _3038 = as_type<int>(_3026);
    if (!_2840)
    {
        float _3040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3042 = _969 + _3040;
        float _3044 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3046 = _933 + _3044;
        float _3048 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3050 = _3042 * _3042;
        float _3052 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3054 = _935 + _3052;
        float _3056 = fma(_3046, _3046, _3050);
        float _3058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3060 = fma(_3054, _3054, _3056);
        float _3062 = sqrt(_3060);
        float _3064 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3066 = -_969;
        float _3068 = _3066 + _2846;
        float _3070 = precise::min(_3062, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3072 = _3070 * _3058;
        float _3074 = -_935;
        float _3076 = _3074 + _2804;
        float _3078 = _3064 * _3072;
        float _3080 = -_933;
        float _3082 = _3080 + _2792;
        float _3084 = fma(_3068, _3078, _969);
        float _3086 = fma(_3082, _3078, _933);
        float _3088 = fma(_3076, _3078, _935);
        _2870 = _3084;
        _3036 = _3086;
        _2894 = _3088;
        _2860 = as_type<int>(_3068);
    }
    float _3090 = _2870;
    float _3092 = _3036;
    float _3094 = _2894;
    int _3096 = _2860;
    float _3098 = _2798 * _3016;
    float _3100 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _3102 = _3096;
    if (!_2962)
    {
        int _3104 = _2910 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3106 = _3104 + _2892;
        _3102 = _3106;
    }
    int _3108 = _3102;
    float _3110 = _2798 * _2928;
    float _3112 = fma(_933, _3008, _3098);
    float _3114 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3100);
    float _3116 = _2798 * _2980;
    float _3118 = fma(_933, _2920, _3110);
    float _3120 = fma(_935, _3026, _3112);
    float _3122 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3114);
    int _3124 = as_type<int>(_3122);
    float _3126 = as_type<float>(_3108);
    if (!_2962)
    {
        int _3128 = _3108 << 2;
        _3038 = _3128;
    }
    int _3130 = _3038;
    float _3132 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3134 = _3120 + _3034;
    float _3136 = _3122 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3138 = fma(_933, _2972, _3116);
    int _3140 = _3130;
    int _3142 = as_type<int>(_3132);
    if (!_2962)
    {
        uint _3144 = uint(int(uint(_3108) >> uint(2)));
        _3124 = int(_3144);
    }
    int _3146 = _3124;
    float _3148 = fma(_935, _2944, _3118);
    float _3150 = _3136 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3152 = 1.0 / _3134;
    if (!_2962)
    {
        int _3154 = 12 & _3130;
        _3140 = _3154;
    }
    int _3156 = _3140;
    int _3158 = _2904 + 80;
    uint _3160 = uint(int(uint(_3158) >> uint(2)));
    uint _3162 = uint(int(uint(int(_3160)) >> uint(2)));
    int _3164 = int(_3160) & 3;
    float _3166 = (*spvDescriptorSet0.vp_c15)._m0[int(_3162)][_3164];
    int _3168 = int(_3160) + 1;
    uint _3170 = uint(int(uint(_3168) >> uint(2)));
    int _3172 = _3168 & 3;
    float _3174 = (*spvDescriptorSet0.vp_c15)._m0[int(_3170)][_3172];
    float _3176 = -_3150;
    float _3178 = fma(_3176, _3132, 1.0);
    float _3180 = fma(_935, _2990, _3138);
    if (!_2962)
    {
        int _3182 = _3146 << 4;
        int _3184 = _3182 + _3156;
        _3142 = _3184;
    }
    int _3186 = _3142;
    float _3188 = _3148 + _2952;
    float _3190 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3192 = _3180 + _2998;
    float _3194 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    int _3196 = _2904 + 88;
    uint _3198 = uint(int(uint(_3196) >> uint(2)));
    uint _3200 = uint(int(uint(int(_3198)) >> uint(2)));
    int _3202 = int(_3198) & 3;
    float _3204 = (*spvDescriptorSet0.vp_c15)._m0[int(_3200)][_3202];
    int _3206 = int(_3198) + 1;
    uint _3208 = uint(int(uint(_3206) >> uint(2)));
    int _3210 = _3206 & 3;
    float _3212 = (*spvDescriptorSet0.vp_c15)._m0[int(_3208)][_3210];
    float _3214 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3190);
    float _3216 = _3090 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3218 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3194);
    float _3220 = _2804;
    float _3222 = _3192;
    if (!_2962)
    {
        float _3224 = floor(_2876);
        _3220 = _3224;
    }
    float _3226 = _3220;
    float _3228 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3214);
    float _3230 = _3188 * _3152;
    float _3232 = _3192 * _3152;
    float _3234 = _3188;
    float _3236 = _3152;
    if (!_2962)
    {
        int _3238 = _3186 + 400;
        uint _3240 = uint(int(uint(_3238) >> uint(2)));
        uint _3242 = uint(int(uint(int(_3240)) >> uint(2)));
        int _3244 = int(_3240) & 3;
        float _3246 = (*spvDescriptorSet0.vp_c15)._m0[int(_3242)][_3244];
        _3234 = _3246;
    }
    float _3248 = _3234;
    float _3250 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3218);
    float _3252 = _3228 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3254 = _3230 >= 0.0;
    float _3256 = fma(_3092, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3216);
    float _3258 = _3250 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3260 = _3252 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3262 = _3230 <= 1.0;
    bool _3264 = _3262 && _3254;
    float _3266 = fma(_3094, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3256);
    float _3268 = log2(_3178);
    float _3270 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3260);
    bool _3272 = _3232 >= 0.0;
    bool _3274 = _3272 && _3264;
    float _3276 = _3266 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3278 = _3252 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3280 = fma(_3136, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3270);
    bool _3282 = _3232 <= 1.0;
    bool _3284 = _3282 && _3274;
    float _3286 = _3252 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3288 = _2846;
    if (!_2962)
    {
        float _3290 = floor(_2828);
        _3288 = _3290;
    }
    float _3292 = _3288;
    float _3294 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3280);
    float _3296 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3278);
    float _3298 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3286);
    float _3300 = _3226;
    if (!_2962)
    {
        float _3302 = -_3226;
        float _3304 = _2876 + _3302;
        _3300 = _3304;
    }
    float _3306 = _3300;
    float _3308 = fma(_3136, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3296);
    float _3310 = fma(_3136, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3298);
    float _3312 = 1.0 / _3294;
    float _3314 = _3268 * 0.693147182464599609375;
    float _3316 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3308);
    if (_3284)
    {
        float _3318 = float(_2900);
        _2956 = _3318;
    }
    float _3320 = _2956;
    float _3322 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3310);
    float _3324 = _2798 * _3174;
    if (!_2962)
    {
        float _3326 = -_3292;
        float _3328 = _2828 + _3326;
        _3222 = _3328;
    }
    float _3330 = _3222;
    float _3332 = _3320;
    if (_3284)
    {
        float _3334 = rint(_3320);
        float _3336 = precise::max(_3334, 0.0);
        uint _3338 = uint(_3336);
        uint _3340 = clamp(_3338, 0u, 65535u);
        _3332 = as_type<float>(_3340);
    }
    float _3342 = _3332;
    float _3344 = fma(_933, _3166, _3324);
    float _3346 = _3314 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3348 = fma(_935, _3204, _3344);
    float _3350 = _3322 * _3312;
    float _3352 = _3348 + _3212;
    float _3354 = _3316 * _3312;
    float _3356 = fma(_3350, -0.5, 0.5);
    float _3358 = _3308;
    if (!_2962)
    {
        float _3360 = rint(_3248);
        float _3362 = precise::max(_3360, 0.0);
        uint _3364 = uint(_3362);
        uint _3366 = clamp(_3364, 0u, 65535u);
        _3358 = as_type<float>(_3366);
    }
    float _3368 = _3358;
    float _3370 = _3352 * _3152;
    float _3372 = fma(_3354, 0.5, 0.5);
    float _3374 = _3232;
    float _3376 = _3370;
    if (_3284)
    {
        float3 _9211 = float3(_3230, _3232, float(as_type<int>(_3342)));
        float3 _9215 = select(_9211, float3(0.0), isnan(_9211));
        float _3378 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9215.xy, uint(rint(_9215.z)), _3370, level(0.0));
        _3374 = _3378;
    }
    float _3380 = _3374;
    float3 _9225 = float3(_3372, _3356, _3346);
    float _3382 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9225, float3(0.0), isnan(_9225)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9225, float3(0.0), isnan(_9225)), level(0.0)).x;
    float3 _9234 = float3(_3372, _3356, _3346);
    float4 _3385 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9234, float3(0.0), isnan(_9234)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9234, float3(0.0), isnan(_9234)), level(0.0)).xyzw;
    float _3387 = _3385.x;
    float _3389 = _3385.y;
    float _3391 = _3385.z;
    float _3393 = _3385.w;
    float _3395 = _3330;
    float _3397 = _3368;
    if (!_2962)
    {
        float3 _9258 = float3(_3330, _3306, float(as_type<int>(_3368)));
        float3 _9260 = select(_9258, float3(0.0), isnan(_9258));
        float _3399 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9260.xy, uint(rint(_9260.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9260.xy, uint(rint(_9260.z)), level(0.0)).x;
        _3395 = _3399;
    }
    float _3401 = _3395;
    if (_2962)
    {
        _3236 = 1.0;
    }
    float _3403 = _3236;
    float _3405 = _3403;
    if (!_2962)
    {
        int _3407 = _3108 << 4;
        int _3409 = _3407 + 2048;
        uint _3411 = uint(int(uint(_3409) >> uint(2)));
        uint _3413 = uint(int(uint(int(_3411)) >> uint(2)));
        int _3415 = int(_3411) & 3;
        float _3417 = (*spvDescriptorSet0.vp_c15)._m0[int(_3413)][_3415];
        int _3419 = int(_3411) + 1;
        uint _3421 = uint(int(uint(_3419) >> uint(2)));
        int _3423 = _3419 & 3;
        float _3425 = (*spvDescriptorSet0.vp_c15)._m0[int(_3421)][_3423];
        int _3427 = _3409 + 8;
        uint _3429 = uint(int(uint(_3427) >> uint(2)));
        uint _3431 = uint(int(uint(int(_3429)) >> uint(2)));
        int _3433 = int(_3429) & 3;
        float _3435 = (*spvDescriptorSet0.vp_c15)._m0[int(_3431)][_3433];
        int _3437 = int(_3429) + 1;
        uint _3439 = uint(int(uint(_3437) >> uint(2)));
        int _3441 = _3437 & 3;
        float _3443 = (*spvDescriptorSet0.vp_c15)._m0[int(_3439)][_3441];
        float _3445 = _2798 * _3425;
        float _3447 = fma(_933, _3417, _3445);
        float _3449 = fma(_935, _3435, _3447);
        float _3451 = _3449 + _3443;
        float _3453 = precise::clamp(_3451, 0.0, 1.0);
        float _3455 = -_3453;
        float _3457 = _3455 + _3401;
        float _3459 = fma(_3457, 500.0, 1.5);
        float _3461 = exp2(_3459);
        float _3463 = 0.0 + _3461;
        float _3465 = precise::clamp(_3463, 0.0, 1.0);
        _3126 = as_type<float>(_3409);
        _3405 = _3465;
    }
    float _3467 = _3126;
    float _3469 = _3405;
    float _3471 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3473 = _3090 + _3471;
    float _3475 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3477 = _3092 + _3475;
    float _3479 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3481 = _3094 + _3479;
    float _3483 = _3473 * _3473;
    float _3485 = fma(_3477, _3477, _3483);
    float _3487 = fma(_3481, _3481, _3485);
    float _3489 = rsqrt(_3487);
    float _3491 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3493 = _3477 * _3491;
    float _3495 = _3481 * _3491;
    float _3497 = _3493 * _3493;
    float _3499 = _3495 * _3495;
    float _3501 = _3497 + _3499;
    float _3503 = sqrt(_3501);
    bool _3505 = _3503 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3507 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3509 = _3503 + _3507;
    float _3511 = _3481;
    float _3513 = _3467;
    float _3515 = _3509;
    float _3517 = _3473;
    if (_3505)
    {
        float _3519 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3511 = _3519;
    }
    float _3521 = _3511;
    if (_3505)
    {
        float _3523 = rsqrt(_3501);
        _3513 = _3523;
    }
    float _3525 = _3513;
    float _3527 = _3525;
    if (_3505)
    {
        float _3529 = _3509 * _3521;
        _3515 = _3529;
    }
    float _3531 = _3515;
    if (_3505)
    {
        float _3533 = _3531 * 0.15915493667125701904296875;
        _3397 = _3533;
    }
    float _3535 = _3397;
    float _3537 = _3489;
    float _3539 = _3535;
    if (_3505)
    {
        float _3541 = _3535 * 6.283185482025146484375;
        float _3543 = sin(_3541);
        _3537 = _3543;
    }
    float _3545 = _3537;
    float _3547 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3549 = precise::max(0.0, _3547);
    float _3551 = _3485;
    float _3553 = _3549;
    float _3555 = _3547;
    if (_3505)
    {
        float _3557 = _3535 * 6.283185482025146484375;
        float _3559 = cos(_3557);
        _3551 = _3559;
    }
    float _3561 = _3551;
    float _3563 = -_3491;
    float _3565 = -_3549;
    float _3567 = fma(_3473, _3563, _3565);
    if (!_3505)
    {
        _3553 = _3495;
    }
    float _3569 = _3553;
    float _3571 = _3569;
    if (_3505)
    {
        float _3573 = _3567 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3555 = _3573;
    }
    float _3575 = _3555;
    float _3577 = _3545;
    float _3579 = _3575;
    if (_3505)
    {
        float _3581 = fma(_3545, _3575, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3517 = _3581;
    }
    float _3583 = _3517;
    float _3585 = _3583;
    if (!_3505)
    {
        _3577 = _3493;
    }
    float _3587 = _3577;
    float _3589 = _3587;
    float _3591 = _3561;
    if (_3505)
    {
        float _3593 = _3561 + (-1.0);
        _3579 = _3593;
    }
    float _3595 = _3579;
    if (_3505)
    {
        float _3597 = _3525 * _3583;
        _2400 = _3597;
    }
    float _3599 = _2400;
    if (!_3505)
    {
        _3585 = _3567;
    }
    float _3601 = _3585;
    float _3603 = _3601;
    if (_3505)
    {
        float _3605 = _3595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3539 = _3605;
    }
    float _3607 = _3539;
    if (_3505)
    {
        float _3609 = _3493 * _3599;
        _3589 = _3609;
    }
    float _3611 = _3589;
    if (!_3505)
    {
        _3527 = _3497;
    }
    float _3613 = _3527;
    float _3615 = _3613;
    if (_3505)
    {
        float _3617 = _3495 * _3599;
        _3571 = _3617;
    }
    float _3619 = _3571;
    if (_3505)
    {
        float _3621 = fma(_3567, _3561, _3607);
        _3603 = _3621;
    }
    float _3623 = _3603;
    if (_3505)
    {
        float _3625 = _3611 * _3611;
        _3615 = _3625;
    }
    float _3627 = _3615;
    if (!_3505)
    {
        _3591 = _3499;
    }
    float _3629 = _3591;
    float _3631 = _3629;
    if (_3505)
    {
        float _3633 = _3619 * _3619;
        _3631 = _3633;
    }
    float _3635 = _3631;
    float _3637 = sqrt(_3487);
    float _3639 = fma(_3623, _3623, _3627);
    float _3641 = _3639 + _3635;
    float _3643 = rsqrt(_3641);
    float _3645 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3647 = fma(_3637, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3645);
    float _3649 = precise::clamp(_3647, 0.0, 1.0);
    float _3651 = -_3649;
    float _3653 = _3651 + 1.0;
    float _3655 = _3643 * _3611;
    float _3657 = _3643 * _3623;
    float _3659 = _3643 * _3619;
    float _3661 = abs(_3653);
    float _3663 = log2(_3661);
    float _3665 = _3655 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3667 = -_3665;
    float _3669 = fma(_3657, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3667);
    float _3671 = -_3659;
    float _3673 = fma(_3671, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3669);
    float _3675 = fma(_3673, -0.5, 0.5);
    float _3677 = fma(_3673, 0.5, 0.5);
    float _3679 = _3663 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3681 = fma(_3677, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3683 = sqrt(_3675);
    float _3685 = fma(_3677, _3681, -0.212114393711090087890625);
    float _3687 = _3657 + 1.0;
    float _3689 = fma(_3677, _3685, 1.570728778839111328125);
    float _3691 = exp2(_3679);
    float _3693 = _3683 * 0.636619746685028076171875;
    float _3695 = -_3657;
    float _3697 = fma(_3691, _3687, _3695);
    float _3699 = -_3689;
    float _3701 = fma(_3693, _3699, 1.0);
    float _3703 = fma(_3697, 0.5, 0.5);
    float2 _9733 = float2(_3701, _3703);
    float3 _3705 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9733, float2(0.0), isnan(_9733)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9733, float2(0.0), isnan(_9733)), level(0.0)).xyz;
    float _3707 = _3705.x;
    float _3709 = _3705.y;
    float _3711 = _3705.z;
    float _3713 = abs(_2866);
    float _3715 = log2(_3713);
    float _3717 = _3252 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3719 = -_2776;
    float _3721 = _3719 + 1.0;
    out.m_90.x = _3092;
    out.m_90.y = _3090;
    out.m_90.z = _3094;
    float _3723 = fma(_3258, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3717);
    bool _3725 = _2866 <= 8000.0;
    bool _3727 = isnan(_2866);
    bool _3729 = _3725 || _3727;
    bool _3731 = isnan(8000.0);
    bool _3733 = _3729 || _3731;
    float _3735 = float(_3733);
    float _3737 = _3715 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3739 = fma(_3136, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3723);
    float _3741 = fma(_3276, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3739);
    float _3743 = exp2(_3737);
    float _3745 = fma(_3743, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3747 = precise::clamp(_3745, 0.0, 1.0);
    float _3749 = fma(_3747, -2.0, 3.0);
    float _3751 = _3747 * _3747;
    float _3753 = _3751 * _3749;
    float _3755 = _3663 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3757 = -_3753;
    float _3759 = _3757 + 1.0;
    float _3761 = exp2(_3755);
    float _3763 = fma(_3759, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3753);
    float _3765 = _3741 + _3294;
    float _3767 = _3735 * _3763;
    float _3769 = _3765 * 0.5;
    float _3771 = _3765;
    if (!_3284)
    {
        _3771 = 1.0;
    }
    float _3773 = _3771;
    out.gl_Position.x = _3316;
    out.gl_Position.y = _3322;
    out.gl_Position.z = _3741;
    out.gl_Position.w = _3294;
    float _3775 = _3767 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3777 = _3773;
    if (_3284)
    {
        bool _3779 = _3380 >= _3370;
        bool _3781 = isnan(_3380);
        bool _3783 = _3779 || _3781;
        bool _3785 = isnan(_3370);
        bool _3787 = _3783 || _3785;
        float _3789 = float(_3787);
        _3777 = _3789;
    }
    float _3791 = _3777;
    out.m_92.z = _3769;
    out.m_92.w = _3294;
    float _3793 = _3721 * _3775;
    float _3795 = precise::clamp(_3793, 0.0, 1.0);
    bool _3797 = _3637 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3799 = isnan(_3637);
    bool _3801 = _3797 || _3799;
    bool _3803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3805 = _3801 || _3803;
    float _3807 = _3791 * _3469;
    float _3809 = -_3761;
    float _3811 = _3809 + 1.0;
    float _3813 = -_3795;
    float _3815 = fma(_3813, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3817 = _3811 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3819 = -_3807;
    float _3821 = fma(_3819, _3815, 1.0);
    float _3823 = precise::clamp(_3821, 0.0, 1.0);
    float _3825 = _3817 * _3382;
    float _3827 = -_3817;
    float _3829 = _3827 + 1.0;
    float _3831 = _3823 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3833 = _3807;
    float _3835 = _3829;
    float _3837 = _3823;
    float _3839 = _3825;
    if (!_3805)
    {
        _3376 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3841 = _3376;
    float _3843 = _3393 * _3825;
    float _3845 = _3393 * _3829;
    float _3847 = _3843;
    float _3849 = _3841;
    float _3851 = _3841;
    if (!_3805)
    {
        _3833 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3853 = _3833;
    out.m_94.x = _3831;
    float _3855 = _3853;
    float _3857 = _3853;
    if (!_3805)
    {
        _3835 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3859 = _3835;
    float _3861 = _3859;
    float _3863 = _3859;
    if (!_3805)
    {
        _3837 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3865 = _3837;
    float _3867 = _3711 * _3825;
    float _3869 = fma(_3707, _3843, _3387);
    float _3871 = fma(_3709, _3843, _3389);
    float _3873 = _3865;
    float _3875 = _3865;
    if (!_3805)
    {
        _3847 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3877 = _3847;
    float _3879 = fma(_3393, _3867, _3391);
    float _3881 = _3877;
    float _3883 = _3877;
    if (!_3805)
    {
        _3839 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3885 = _3839;
    out.m_96.x = _3869;
    out.m_96.y = _3871;
    out.m_96.z = _3879;
    out.m_96.w = _3845;
    bool _3887 = !_3805;
    float _3889 = _3885;
    float _3891 = _3885;
    if (!_3887)
    {
        bool _3893 = _3637 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3895 = isnan(_3637);
        bool _3897 = _3893 || _3895;
        bool _3899 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3901 = _3897 || _3899;
        if (!_3901)
        {
            float _3903 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3905 = _3637 + _3903;
            float _3907 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3909 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3907;
            float _3911 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3913 = _3911 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3915 = 1.0 / _3909;
            float _3917 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3919 = _3917 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3923 = _3921 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3927 = _3925 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3929 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3931 = _3929 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3933 = _3905 * _3915;
            float _3935 = precise::clamp(_3933, 0.0, 1.0);
            float _3937 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3939 = _3937 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3941 = fma(_3935, _3913, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3943 = fma(_3935, _3939, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3945 = fma(_3935, _3919, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3947 = fma(_3935, _3923, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3949 = fma(_3935, _3927, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3951 = fma(_3935, _3931, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3891 = _3941;
            _3863 = _3949;
            _3883 = _3945;
            _3857 = _3947;
            _3851 = _3943;
            _3875 = _3951;
            _3953 = true;
        }
        else
        {
            bool _3955 = _3637 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3957 = isnan(_3637);
            bool _3959 = _3955 || _3957;
            bool _3961 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3963 = _3959 || _3961;
            if (!_3963)
            {
                _3881 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3965 = _3881;
            _3883 = _3965;
            if (!_3963)
            {
                _3889 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3967 = _3889;
            _3891 = _3967;
            if (!_3963)
            {
                _3849 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3969 = _3849;
            _3851 = _3969;
            if (!_3963)
            {
                _3855 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3971 = _3855;
            _3857 = _3971;
            if (!_3963)
            {
                _3861 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3973 = _3861;
            _3863 = _3973;
            if (!_3963)
            {
                _3873 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3975 = _3873;
            bool _3977 = !_3963;
            _3875 = _3975;
            if (!_3977)
            {
                bool _3979 = _3637 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3981 = isnan(_3637);
                bool _3983 = _3979 || _3981;
                bool _3985 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3987 = _3983 || _3985;
                if (!_3987)
                {
                    float _3989 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3991 = _3637 + _3989;
                    float _3993 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3995 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3993;
                    float _3997 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3999 = _3997 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4001 = 1.0 / _3995;
                    float _4003 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4005 = _4003 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4007 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4009 = _4007 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4013 = _4011 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4017 = _4015 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4019 = _3991 * _4001;
                    float _4021 = precise::clamp(_4019, 0.0, 1.0);
                    float _4023 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4025 = _4023 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4027 = fma(_4021, _3999, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4029 = fma(_4021, _4025, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4031 = fma(_4021, _4005, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4033 = fma(_4021, _4009, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4035 = fma(_4021, _4013, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4037 = fma(_4021, _4017, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3891 = _4027;
                    _3863 = _4035;
                    _3883 = _4031;
                    _3857 = _4033;
                    _3851 = _4029;
                    _3875 = _4037;
                    _3953 = true;
                }
                else
                {
                    _3891 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3863 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3883 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3857 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3851 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3875 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3953 = false;
    float _4039 = _3891;
    float _4041 = _3863;
    float _4043 = _3883;
    float _4045 = _3857;
    float _4047 = _3851;
    float _4049 = _3875;
    float _4051 = fma(_2690, -0.5, 0.5);
    float _4053 = precise::clamp(_4051, 0.0, 1.0);
    float _4055 = -_4039;
    float _4057 = _4055 + _4041;
    float _4059 = -_4043;
    float _4061 = _4059 + _4045;
    float _4063 = -_4047;
    float _4065 = _4063 + _4049;
    bool _4067 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4069 = fma(_4053, _4057, _4039);
    float _4071 = fma(_4053, _4061, _4043);
    float _4073 = fma(_4053, _4065, _4047);
    float _4075 = _4069 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _4077 = fma(_4071, 0.298911988735198974609375, _4075);
    float _4079 = fma(_4073, 0.114477999508380889892578125, _4077);
    out.m_98.x = 0.0;
    float _4081 = -_4079;
    float _4083 = _4071 + _4081;
    float _4085 = -_4079;
    float _4087 = _4069 + _4085;
    float _4089 = -_4079;
    float _4091 = _4073 + _4089;
    float _4093 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4095 = fma(_4083, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    float _4097 = fma(_4087, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    float _4099 = fma(_4091, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4079);
    out.m_94.w = _4093;
    out.m_100.x = _4095;
    out.m_100.y = _4097;
    out.m_100.z = _4099;
    if (!_4067)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4101 = -_3090;
    float _4103 = _4101 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4105 = -_3092;
    float _4107 = _4105 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4109 = -_3094;
    float _4111 = _4109 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4113 = _4103 * _4103;
    float _4115 = fma(_4107, _4107, _4113);
    float _4117 = fma(_4111, _4111, _4115);
    float _4119 = sqrt(_4117);
    float _4121 = rsqrt(_4117);
    float _4123 = -_4119;
    float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4127 = _4125 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4129 = precise::clamp(_4127, 0.0, 1.0);
    float _4131 = _4107 * _4121;
    float _4133 = _4103 * _4121;
    float _4135 = abs(_4129);
    float _4137 = log2(_4135);
    float _4139 = _4111 * _4121;
    float _4141 = _4131 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4143 = _2690 * _4133;
    float _4145 = -_4133;
    float _4147 = -_4141;
    float _4149 = fma(_4145, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4147);
    float _4151 = fma(_2686, _4131, _4143);
    float _4153 = -_4139;
    float _4155 = fma(_4153, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4149);
    float _4157 = fma(_2692, _4139, _4151);
    float _4159 = precise::clamp(_4157, 0.0, 1.0);
    float _4161 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4163 = _4155 + _4161;
    float _4165 = _4137 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4167 = _4163 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4169 = precise::clamp(_4167, 0.0, 1.0);
    float _4171 = exp2(_4165);
    float _4173 = _4171 * _4169;
    float _4175 = _4159 * _4173;
    float _4177 = _4175 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4179 = _4175 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4181 = _4175 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4177;
    out.m_98.y = _4179;
    out.m_98.z = _4181;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

