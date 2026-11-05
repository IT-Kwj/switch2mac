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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_22 [[id(7)]];
    sampler vp_t_tcb_22Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_14 [[id(11)]];
    sampler vp_t_tcb_14Smplr [[id(12)]];
    texture2d_array<float> vp_t_tcb_16 [[id(13)]];
    sampler vp_t_tcb_16Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_32 [[id(15)]];
    sampler vp_t_tcb_32Smplr [[id(16)]];
    texture3d<float> vp_t_tcb_30 [[id(17)]];
    sampler vp_t_tcb_30Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_22Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_14Smplr_w [[id(23)]];
    sampler vp_t_tcb_32Smplr_w [[id(24)]];
    sampler vp_t_tcb_30Smplr_w [[id(25)]];
    sampler vp_t_tcb_1CSmplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_72 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3115 = false;
    bool _1561 = false;
    bool _421 = false;
    bool _309 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_60.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_63.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3414 = as_type<float>(_127);
        out.gl_Position.z = _3414;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_65.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_63.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3483 = as_type<float>(_165);
        out.gl_Position.z = _3483;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _205;
    if (!_187)
    {
        float _189 = in.m_70.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        float _209 = float(_111);
        float _211 = 1.0 / _209;
        float _213 = _145 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_70.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_111);
        float _313 = 1.0 / _311;
        float _315 = _145 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    bool _319 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _321 = isnan(_317);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _335 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _337 = isnan(_317);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _317 + _351;
    float _355 = -_329;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _361 = 1.0 / _333;
    float _363 = _345 * _357;
    float _365 = -_345;
    float _367 = _365 + 1.0;
    float _369 = _349 * _361;
    float _371 = fma(_369, _353, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _373 = _371 * _363;
    float _375 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[115].x, _373);
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _383 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[116].x, _375);
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = _383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _393 = in.m_72.x;
    float _395 = in.m_72.y;
    out.m_74.x = _385;
    out.m_74.y = _387;
    out.m_74.z = _389;
    out.m_74.w = _391;
    float _397 = _287 * _395;
    float _399 = _285 * _393;
    bool _401 = !_359;
    float _419;
    if (!_401)
    {
        float _403 = in.m_70.x;
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _407 = _403 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_111);
        float _425 = 1.0 / _423;
        float _427 = _145 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = in.m_70.x;
    float _433 = in.m_70.y;
    float _435 = in.m_70.z;
    float _437 = in.m_70.w;
    float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _441 = in.m_60.x;
    float _443 = in.m_60.y;
    float _445 = in.m_60.z;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _457 = _455 != 0;
    float _459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _463 = _461 != 0;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _467 = _465 != 0;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _475 = 1.0 / _471;
    float _477 = _435 * 2.0;
    bool _479 = _437 > 0.5;
    float _481 = _431 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _483 = _433 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _485 = _431 > 0.5;
    float _487 = floor(_477);
    float _489 = -_185;
    int _491 = _479 ? as_type<int>(_489) : as_type<int>(_185);
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _495 = _433 > 0.5;
    float _497 = _431 * 2.0;
    float _499 = -_181;
    int _501 = _485 ? as_type<int>(_499) : as_type<int>(_181);
    float _503 = -_493;
    float _505 = fma(_481, 2.0, _503);
    float _507 = -_185;
    int _509 = _495 ? as_type<int>(_507) : as_type<int>(_185);
    float _511 = fma(_483, -2.0, _473);
    bool _513 = !_449;
    float _515 = _513 ? _181 : as_type<float>(_501);
    float _517 = _443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _529 = _527 != 0;
    float _531 = _443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _533 = _443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _535;
    float _539 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _517);
    float _541 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
    float _543 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _533);
    float _545 = _433 + _435;
    float _547 = _537 * _475;
    float _549 = floor(_497);
    float _551 = _433 * 2.0;
    bool _553 = !_453;
    float _555 = _553 ? _185 : as_type<float>(_509);
    float _557 = _545 + (-1.0);
    bool _559 = _435 > 0.5;
    float _561 = _433 + _431;
    float _563 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
    float _565 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _567 = floor(_551);
    float _569 = -_181;
    int _571 = _559 ? as_type<int>(_569) : as_type<int>(_181);
    float _573 = _561 + (-1.0);
    bool _575 = _487 > 0.0;
    float _577 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].z, _541);
    bool _579 = !_457;
    float _581 = _579 ? _181 : as_type<float>(_571);
    float _583 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].z, _543);
    bool _585 = _487 >= 0.0;
    bool _587 = isnan(_487);
    bool _589 = _585 || _587;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _599 = _429 + _597;
    int _601 = _593 ? 0 : 1;
    float _603 = _577 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _605 = _549 >= 0.0;
    bool _607 = isnan(_549);
    bool _609 = _605 || _607;
    bool _611 = isnan(0.0);
    bool _613 = _609 || _611;
    float _615 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _617 = ~_601;
    int _619 = _617 + 1;
    int _621 = _619 + 1;
    float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _625 = _621;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _629 = _487;
    float _631 = _573;
    if (!_575)
    {
        int _633 = ~_601;
        int _635 = _633 + 1;
        _625 = _635;
    }
    int _637 = _625;
    float _639 = _563 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _641 = _613 ? 0 : 1;
    float _643 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _645 = _603 + _643;
    if (!_467)
    {
        _627 = _433;
    }
    float _647 = _627;
    float _649 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _651 = _639 + _649;
    float _653 = _647;
    if (!_467)
    {
        _629 = _435;
    }
    float _655 = _629;
    float _657 = _583 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _659 = _655;
    if (!_467)
    {
        _631 = _435;
    }
    float _661 = _631;
    bool _663 = _567 > 0.0;
    float _665 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _667 = _657 + _665;
    bool _669 = _567 >= 0.0;
    bool _671 = isnan(_567);
    bool _673 = _669 || _671;
    bool _675 = isnan(0.0);
    bool _677 = _673 || _675;
    float _679 = _595 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _681 = _661;
    if (_467)
    {
        _653 = _431;
    }
    float _683 = _653;
    float _685 = -_145;
    float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[76].x, _505);
    if (_467)
    {
        _659 = _433;
    }
    float _689 = _659;
    float _691 = _515 + 0.5;
    if (_467)
    {
        _681 = _433;
    }
    float _693 = _681;
    bool _695 = _549 > 0.0;
    float _697 = fma(_547, _599, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _699 = fma(_679, _691, _687);
    bool _701 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _703 = isnan(_429);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = _555 + (-0.5);
    bool _715 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _717 = isnan(_429);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _729 = _623 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _731 = -_711;
    float _733 = _731 + 1.0;
    float _735 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[83].w, _727);
    float _737 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _511);
    float _739 = _725 * _733;
    float _741 = -_725;
    float _743 = _741 + 1.0;
    float _745 = -_729;
    float _747 = -_737;
    float _749 = fma(_745, _713, _747);
    float _751 = _683 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _753 = _697 * _739;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _759 = _689 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _761 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[131].x, _753);
    float _763 = -_755;
    float _765 = fma(_751, 2.0, _763);
    float _767 = _439 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _769 = _581 + 0.5;
    float _771 = -_145;
    float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[81].x, _765);
    bool _775 = !_463;
    float _777 = _775 ? _185 : as_type<float>(_491);
    float _779 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[83].z, _757);
    float _781 = _459 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _783 = fma(_767, _769, _773);
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _787 = !_521;
    int _789 = _787 ? 0 : 1;
    float _791 = _777 + (-0.5);
    float _793 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _735);
    float _795 = fma(_759, -2.0, _785);
    int _797 = abs(_789);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _801 = _645 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _803 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _795);
    float _805 = -_793;
    float _807 = _805 + 1.0;
    float _809 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[28].x, _801);
    float _811 = -_781;
    float _813 = -_803;
    float _815 = fma(_811, _791, _813);
    float _817 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[132].x, _761);
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _821 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[28].z, _809);
    float _823 = float(_797);
    float _825 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _827 = log2(_825);
    float _829 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[78].z, _819);
    float _831 = float(_637);
    float _833 = fma(_777, _807, _815);
    float _835 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[78].w, _799);
    float _837 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _829);
    float _839 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _779);
    float _841 = _645 * _645;
    float _843 = _823 * _831;
    float _845 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _835);
    bool _847 = _821 >= 0.0;
    float _849 = -_837;
    float _851 = _849 + 1.0;
    float _853 = -_839;
    float _855 = _853 + 1.0;
    float _857 = fma(_651, _651, _841);
    float _859 = -_845;
    float _861 = _859 + 1.0;
    float _863 = _827 * _145;
    float _865 = -_855;
    float _867 = fma(_581, _865, _783);
    float _869 = fma(_667, _667, _857);
    float _871 = -_851;
    float _873 = fma(_515, _871, _699);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _877 = in.m_76.x;
    float _879 = in.m_76.y;
    float _881 = in.m_76.z;
    float _883 = fma(_555, _861, _749);
    float _885 = exp2(_863);
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _889 = 1.0 + _887;
    float _891 = _749;
    if (_847)
    {
        _891 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _893 = _891;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _897 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _901 = _817 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _903 = rsqrt(_869);
    float _905 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _909 = as_type<int>(_893);
    if (_847)
    {
        float _911 = _893 * 5.0;
        _909 = as_type<int>(_911);
    }
    int _913 = _909;
    bool _915 = !_525;
    int _917 = _915 ? 0 : 1;
    out.m_78.x = _873;
    out.m_78.y = _883;
    out.m_78.z = _867;
    out.m_78.w = _833;
    int _919 = ~_641;
    int _921 = _919 + 1;
    int _923 = _921 + 1;
    float _925 = 1.0 / _889;
    int _927 = abs(_917);
    out.m_80.x = _897;
    out.m_80.y = _905;
    out.m_80.z = _907;
    out.m_80.w = _901;
    int _929 = _923;
    if (!_695)
    {
        int _931 = ~_641;
        int _933 = _931 + 1;
        _929 = _933;
    }
    int _935 = _929;
    bool _937 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _939 = isnan(0.0);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _945 = _941 || _943;
    if (_847)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4755 = as_type<float>(_913);
        out.gl_Position.z = _4755;
    }
    bool _947 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _949 = isnan(1.0);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _955 = _951 || _953;
    if (_847)
    {
        out.m_63.x = 0.0;
    }
    float _957 = -_885;
    float _959 = _957 + 1.0;
    bool _961 = !_529;
    int _963 = _961 ? 0 : 1;
    float _965 = _645 * _903;
    float _967 = _651 * _903;
    if (_847)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _969 = -_965;
    float _971 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[18].w, _603);
    float _973 = _667 * _903;
    float _975 = -_967;
    float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _979 = float(_927);
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _983 = _971 + _981;
    float _985 = -_973;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[18].w, _657);
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _991 = _977 + _989;
    float _993 = float(_935);
    float _995 = _983 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _999 = _987 + _997;
    float _1001 = _945 ? _959 : 0.0;
    float _1003 = _843 * (-2.0);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[28].x, _995);
    float _1007 = _979 * _993;
    float _1009 = _431 + (-0.5);
    float _1011 = _1003;
    float _1013 = _983;
    if (_955)
    {
        float _1015 = _1001 * _925;
        _149 = _1015;
    }
    float _1017 = _149;
    float _1019 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1005);
    float _1021 = fma(_1003, _877, _877);
    float _1023 = fma(_615, _1003, _615);
    float _1025 = _1007 * (-2.0);
    int _1027 = _677 ? 0 : 1;
    float _1029 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1021);
    bool _1031 = _1019 >= 0.0;
    float _1033 = fma(_1025, _879, _879);
    int _1035 = abs(_963);
    float _1037 = fma(_1023, _1017, _1029);
    int _1039 = ~_1027;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    float _1045 = fma(_565, _1025, _565);
    float _1047 = _1037 * 0.15915493667125701904296875;
    int _1049 = _1043;
    if (!_663)
    {
        int _1051 = ~_1027;
        int _1053 = _1051 + 1;
        _1049 = _1053;
    }
    int _1055 = _1049;
    float _1057 = _433 + (-0.5);
    float _1059 = float(_1035);
    float _1061 = _1047 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = float(_1055);
    float _1067 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1033);
    int _1069 = _1055;
    if (_1031)
    {
        _1011 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1071 = _1011;
    if (_1031)
    {
        out.m_63.x = 0.0;
    }
    float _1073 = _1059 * _1065;
    float _1075 = fma(_1045, _1017, _1067);
    if (_1031)
    {
        float _1077 = _1071 * 5.0;
        _1069 = as_type<int>(_1077);
    }
    int _1079 = _1069;
    float _1081 = _1047 * 6.283185482025146484375;
    float _1083 = cos(_1081);
    if (_1031)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4978 = as_type<float>(_1079);
        out.gl_Position.z = _4978;
    }
    if (_1031)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1085 = -_603;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1089 = -_639;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1093 = _1075 * 0.15915493667125701904296875;
    float _1095 = -_657;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = _1087 * _1087;
    float _1101 = -_965;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[18].w, _645);
    float _1105 = _1073 * (-2.0);
    float _1107 = -_967;
    float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _651);
    float _1111 = fma(_1091, _1091, _1099);
    float _1113 = _1103 * _1103;
    float _1115 = _435 + _431;
    float _1117 = -_973;
    float _1119 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[18].w, _667);
    float _1121 = fma(_1097, _1097, _1111);
    float _1123 = fma(_1109, _1109, _1113);
    float _1125 = _1115 + (-1.0);
    float _1127 = _435 + (-0.5);
    float _1129 = fma(_1105, _881, _881);
    float _1131 = fma(_1119, _1119, _1123);
    float _1133 = rsqrt(_1121);
    float _1135 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1137 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1129);
    float _1139 = fma(_1135, _1105, _1135);
    float _1141 = sqrt(_1131);
    float _1143 = fma(_1139, _1017, _1137);
    float _1145 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _1149 = _1143 * 0.15915493667125701904296875;
    float _1151 = _1091 * _1133;
    float _1153 = _1097 * _1133;
    float _1155 = _1087 * _1133;
    float _1157 = _1093 * 6.283185482025146484375;
    float _1159 = sin(_1157);
    float _1161 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1163 = _1151 * _1161;
    float _1165 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1167 = _1153 * _1165;
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1171 = _1155 * _1169;
    float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1175 = -_1163;
    float _1177 = fma(_1153, _1173, _1175);
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1181 = -_1167;
    float _1183 = fma(_1155, _1179, _1181);
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1187 = -_1171;
    float _1189 = fma(_1151, _1185, _1187);
    float _1191 = _1093 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = _903 * _1141;
    float _1197 = _1195 * _1145;
    float _1199 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1201 = _1199 * 0.5;
    float _1203 = _1149 * 6.283185482025146484375;
    float _1205 = sin(_1203);
    float _1207 = _1177 * _1177;
    float _1209 = _1063 * _1159;
    float _1211 = fma(_1183, _1183, _1207);
    float _1213 = _1083 * _1159;
    float _1215 = _1149 * 6.283185482025146484375;
    float _1217 = cos(_1215);
    float _1219 = fma(_1189, _1189, _1211);
    float _1221 = _1083 * _1193;
    float _1223 = rsqrt(_1219);
    float _1225 = fma(_1205, _1221, _1209);
    float _1227 = fma(_1205, _1209, _1221);
    float _1229 = _1063 * _1193;
    float _1231 = _1083 * _1217;
    float _1233 = _1193 * _1217;
    float _1235 = _1063 * _1217;
    float _1237 = _1159 * _1217;
    float _1239 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1241 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1243 = -_1229;
    float _1245 = fma(_1205, _1213, _1243);
    float _1247 = _1195 * _1239;
    float _1249 = _1241 * _1197;
    float _1251 = -_1213;
    float _1253 = fma(_1205, _1229, _1251);
    float _1255 = _1183 * _1223;
    float _1257 = _1147 * _1247;
    float _1259 = _1177 * _1223;
    float _1261 = _1231 * _1249;
    float _1263 = _1189 * _1223;
    float _1265 = -_1249;
    float _1267 = _1205 * _1265;
    float _1269 = _1153 * _1259;
    float _1271 = fma(_1225, _1257, _1261);
    float _1273 = _1155 * _1255;
    float _1275 = _1235 * _1249;
    float _1277 = fma(_1233, _1257, _1267);
    float _1279 = fma(_1245, _1201, _1271);
    float _1281 = -_1269;
    float _1283 = fma(_1155, _1263, _1281);
    float _1285 = -_1273;
    float _1287 = fma(_1151, _1259, _1285);
    float _1289 = fma(_1253, _1257, _1275);
    float _1291 = fma(_1237, _1201, _1277);
    float _1293 = _1283 * _1279;
    float _1295 = _1287 * _1279;
    float _1297 = fma(_1227, _1201, _1289);
    float _1299 = _1151 * _1263;
    float _1301 = fma(_1255, _1291, _1293);
    float _1303 = fma(_1263, _1291, _1295);
    float _1305 = _1231 * _1283;
    float _1307 = -_1299;
    float _1309 = fma(_1153, _1255, _1307);
    float _1311 = fma(_1151, _1297, _1301);
    float _1313 = fma(_1153, _1297, _1303);
    float _1315 = _1231 * _1287;
    float _1317 = _1309 * _1279;
    float _1319 = _639 + _1311;
    float _1321 = _657 + _1313;
    float _1323 = _1231 * _1309;
    float _1325 = _1225 * _1283;
    float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1329 = _1319 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1333 = _1321 + _1331;
    float _1335 = _1225 * _1309;
    float _1337 = _1225 * _1287;
    float _1339 = _1329 * _1329;
    float _1341 = _1333 * _1333;
    float _1343 = _1245 * _1287;
    float _1345 = fma(_1259, _1291, _1317);
    float _1347 = _1245 * _1283;
    float _1349 = _1339 + _1341;
    float _1351 = _1245 * _1309;
    float _1353 = fma(_1155, _1297, _1345);
    float _1355 = -_1205;
    float _1357 = fma(_1355, _1255, _1305);
    float _1359 = sqrt(_1349);
    float _1361 = -_1205;
    float _1363 = fma(_1361, _1259, _1323);
    float _1365 = -_1205;
    float _1367 = fma(_1365, _1263, _1315);
    float _1369 = _603 + _1353;
    float _1371 = fma(_1233, _1255, _1325);
    float _1373 = fma(_1233, _1259, _1335);
    float _1375 = fma(_1233, _1263, _1337);
    float _1377 = fma(_1237, _1255, _1347);
    float _1379 = fma(_1237, _1259, _1351);
    float _1381 = fma(_1235, _1151, _1357);
    float _1383 = fma(_1235, _1155, _1363);
    float _1385 = fma(_1237, _1263, _1343);
    float _1387 = fma(_1235, _1153, _1367);
    bool _1389 = _1359 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1391 = _1255;
    float _1393 = _1339;
    float _1395 = _1341;
    float _1397 = _1319;
    float _1399 = _1321;
    float _1401 = _1383;
    int _1403 = as_type<int>(_1347);
    float _1405 = _1343;
    float _1407 = _1305;
    if (!_1389)
    {
        _1391 = _1369;
    }
    float _1409 = _1391;
    bool _1411 = !_1389;
    float _1413 = _1409;
    if (!_1411)
    {
        float _1415 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1419 = _1359 + _1417;
        float _1421 = rsqrt(_1349);
        float _1423 = _1419 * _1415;
        float _1425 = _1369 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1427 = _1423 * 0.15915493667125701904296875;
        float _1429 = _1427 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        float _1433 = _1427 * 6.283185482025146484375;
        float _1435 = cos(_1433);
        float _1437 = fma(_1431, _1425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1439 = _1421 * _1437;
        float _1441 = _1435 + (-1.0);
        float _1443 = fma(_1329, _1439, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1445 = fma(_1333, _1439, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1447 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1451 = _1443 + _1449;
        float _1453 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1455 = _1445 + _1453;
        float _1457 = fma(_1369, _1435, _1447);
        float _1459 = _1451 * _1451;
        float _1461 = _1455 * _1455;
        _1413 = _1457;
        _1393 = _1459;
        _1395 = _1461;
        _1397 = _1443;
        _1399 = _1445;
    }
    float _1463 = _1413;
    float _1465 = _1393;
    float _1467 = _1395;
    float _1469 = _1397;
    float _1471 = _1399;
    float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1475 = _1463 + _1473;
    float _1477 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1479 = fma(_1253, _1151, _1371);
    float _1481 = fma(_1227, _1151, _1377);
    float _1483 = fma(_1475, _1475, _1465);
    float _1485 = fma(_1227, _1155, _1379);
    float _1487 = fma(_1227, _1153, _1385);
    float _1489 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1491 = _1483 + _1467;
    float _1493 = _1477 * _1381;
    float _1495 = fma(_1253, _1155, _1373);
    float _1497 = fma(_1253, _1153, _1375);
    float _1499 = _1477 * _1383;
    float _1501 = _1477 * _1387;
    float _1503 = sqrt(_1491);
    float _1505 = fma(_1489, _1479, _1493);
    float _1507 = fma(_1489, _1495, _1499);
    float _1509 = fma(_1489, _1497, _1501);
    float _1511 = _1481 + _1505;
    float _1513 = _1485 + _1507;
    float _1515 = _1487 + _1509;
    out.m_82.x = _1511;
    out.m_82.y = _1513;
    out.m_82.z = _1515;
    bool _1517 = _1503 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1519 = isnan(_1503);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1525 = _1521 || _1523;
    if (!_1525)
    {
        _1401 = 1.0;
    }
    float _1527 = _1401;
    bool _1529 = !_1525;
    float _1531 = _1527;
    if (!_1529)
    {
        bool _1533 = _1503 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1535 = isnan(_1503);
        bool _1537 = _1533 || _1535;
        bool _1539 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1541 = _1537 || _1539;
        if (!_1541)
        {
            float _1543 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1545 = _1503 + _1543;
            float _1547 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1549 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1547;
            float _1551 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1553 = _1551 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1555 = 1.0 / _1549;
            float _1557 = _1545 * _1555;
            float _1559 = fma(_1557, _1553, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1531 = _1559;
            _1561 = true;
        }
        else
        {
            bool _1563 = _1503 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1565 = isnan(_1503);
            bool _1567 = _1563 || _1565;
            bool _1569 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1571 = _1567 || _1569;
            if (!_1571)
            {
                float _1573 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1575 = _1503 + _1573;
                float _1577 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1579 = _1577 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1581 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1583 = _1581 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1585 = 1.0 / _1579;
                float _1587 = _1575 * _1585;
                float _1589 = fma(_1587, _1583, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1531 = _1589;
                _1561 = true;
            }
            else
            {
                _1531 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1561 = false;
    float _1591 = _1531;
    float _1593 = _971 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1595 = _971 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1597 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1593);
    float _1599 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1597);
    float _1601 = _971 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1603 = fma(_977, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1605 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1607 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1601);
    float _1609 = floor(_1603);
    float _1611 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1607);
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1615 = 1.0 / _1605;
    float _1617 = _1613 + _1605;
    float _1619 = -_1609;
    float _1621 = _1603 + _1619;
    float _1623 = _977 * (*spvDescriptorSet0.vp_c15)._m0[127].x;
    float _1625 = fma(_1595, (*spvDescriptorSet0.vp_c15)._m0[127].y, _1623);
    float _1627 = _1617 * _1615;
    float _1629 = _1627 * 0.5;
    float _1631 = _977 * (*spvDescriptorSet0.vp_c15)._m0[126].x;
    float _1633 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1625);
    float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1637 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1635);
    float _1639 = fma(_1595, (*spvDescriptorSet0.vp_c15)._m0[126].y, _1631);
    float _1641 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1643 = 1.0 / _1637;
    float _1645 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1647 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1639);
    float _1649 = _971 + _1645;
    float _1651 = _1647 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1653 = trunc(_1641);
    int _1655 = int(_1653);
    float _1657 = fma(_1649, (*spvDescriptorSet0.vp_c15)._m0[126].y, _1631);
    float _1659 = fma(_1649, (*spvDescriptorSet0.vp_c15)._m0[127].y, _1623);
    float _1661 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1657);
    float _1663 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1659);
    float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1667 = _1643 * _1665;
    float _1669 = _1661 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1671 = _1663 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1673 = trunc(_1651);
    int _1675 = int(_1673);
    bool _1677 = _1667 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1679 = _1667 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1681 = !_1677;
    int _1683 = _1681 ? 0 : 1;
    float _1685 = trunc(_1669);
    int _1687 = int(_1685);
    int _1689 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1691 = _1655 + _1689;
    int _1693 = _1691 + 1;
    int _1695 = 2;
    int _1697 = _1693;
    float _1699 = _1641;
    if (!_1677)
    {
        _1695 = 1;
    }
    int _1701 = _1695;
    float _1703 = trunc(_1671);
    int _1705 = int(_1703);
    int _1707 = _1701;
    if (!_1679)
    {
        _1707 = _1683;
    }
    int _1709 = _1707;
    int _1711 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1713 = _1675 + _1711;
    int _1715 = _1713 + 1;
    int _1717 = _1709 << 6;
    bool _1719 = _1715 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1721 = _1717 + 96;
    uint _1724 = uint(int(uint(_1721) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c15)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c15)._m0[int(_1734)][_1736];
    int _1740 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1742 = _1687 + _1740;
    int _1744 = _1742 + 1;
    int _1746 = _1715 | _1693;
    bool _1748 = _1744 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1750 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1752 = _1705 + _1750;
    int _1754 = _1752 + 1;
    int _1756 = _1717 + 104;
    uint _1758 = uint(int(uint(_1756) >> uint(2)));
    uint _1760 = uint(int(uint(int(_1758)) >> uint(2)));
    int _1762 = int(_1758) & 3;
    float _1764 = (*spvDescriptorSet0.vp_c15)._m0[int(_1760)][_1762];
    int _1766 = int(_1758) + 1;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    int _1770 = _1766 & 3;
    float _1772 = (*spvDescriptorSet0.vp_c15)._m0[int(_1768)][_1770];
    bool _1774 = _1746 < 0;
    bool _1776 = _1774 || _1719;
    int _1778 = _1744 | _1754;
    bool _1780 = _1693 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1782 = _1780 || _1776;
    bool _1784 = _1778 < 0;
    bool _1786 = _1784 || _1748;
    int _1788 = _1717 + 48;
    uint _1790 = uint(int(uint(_1788) >> uint(2)));
    uint _1792 = uint(int(uint(int(_1790)) >> uint(2)));
    int _1794 = int(_1790) & 3;
    float _1796 = (*spvDescriptorSet0.vp_c15)._m0[int(_1792)][_1794];
    int _1798 = int(_1790) + 1;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    int _1802 = _1798 & 3;
    float _1804 = (*spvDescriptorSet0.vp_c15)._m0[int(_1800)][_1802];
    bool _1806 = _1754 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1808 = _1806 || _1786;
    int _1810 = _1717 + 64;
    uint _1812 = uint(int(uint(_1810) >> uint(2)));
    uint _1814 = uint(int(uint(int(_1812)) >> uint(2)));
    int _1816 = int(_1812) & 3;
    float _1818 = (*spvDescriptorSet0.vp_c15)._m0[int(_1814)][_1816];
    int _1820 = int(_1812) + 1;
    uint _1822 = uint(int(uint(_1820) >> uint(2)));
    int _1824 = _1820 & 3;
    float _1826 = (*spvDescriptorSet0.vp_c15)._m0[int(_1822)][_1824];
    int _1828 = _1715;
    int _1830 = _1744;
    float _1832 = as_type<float>(_1709);
    if (!_1782)
    {
        int _1834 = _1693 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1836 = _1834 + _1715;
        _1828 = _1836;
    }
    int _1838 = _1828;
    if (!_1808)
    {
        int _1840 = _1754 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1842 = _1840 + _1744;
        _1830 = _1842;
    }
    int _1844 = _1830;
    int _1846 = _1717 + 56;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    uint _1850 = uint(int(uint(int(_1848)) >> uint(2)));
    int _1852 = int(_1848) & 3;
    float _1854 = (*spvDescriptorSet0.vp_c15)._m0[int(_1850)][_1852];
    int _1856 = int(_1848) + 1;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    int _1860 = _1856 & 3;
    float _1862 = (*spvDescriptorSet0.vp_c15)._m0[int(_1858)][_1860];
    float _1864 = 0.0;
    if (!_1808)
    {
        float _1866 = floor(_1671);
        _1864 = _1866;
    }
    float _1868 = _1864;
    if (!_1808)
    {
        int _1870 = _1844 << 2;
        _1403 = _1870;
    }
    int _1872 = _1403;
    int _1874 = _1872;
    if (!_1808)
    {
        uint _1876 = uint(int(uint(_1844) >> uint(2)));
        _1697 = int(_1876);
    }
    int _1878 = _1697;
    float _1880 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_1808)
    {
        int _1882 = 12 & _1872;
        _1874 = _1882;
    }
    int _1884 = _1874;
    int _1886 = _1717 + 72;
    uint _1888 = uint(int(uint(_1886) >> uint(2)));
    uint _1890 = uint(int(uint(int(_1888)) >> uint(2)));
    int _1892 = int(_1888) & 3;
    float _1894 = (*spvDescriptorSet0.vp_c15)._m0[int(_1890)][_1892];
    int _1896 = int(_1888) + 1;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    int _1900 = _1896 & 3;
    float _1902 = (*spvDescriptorSet0.vp_c15)._m0[int(_1898)][_1900];
    if (!_1808)
    {
        int _1904 = _1878 << 4;
        int _1906 = _1904 + _1884;
        _1405 = as_type<float>(_1906);
    }
    float _1908 = _1405;
    float _1910 = _1649 * _1738;
    float _1912 = _1908;
    int _1914 = as_type<int>(_1910);
    int _1916 = as_type<int>(_1730);
    if (!_1808)
    {
        int _1918 = as_type<int>(_1908) + 400;
        uint _1920 = uint(int(uint(_1918) >> uint(2)));
        uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
        int _1924 = int(_1920) & 3;
        float _1926 = (*spvDescriptorSet0.vp_c15)._m0[int(_1922)][_1924];
        _1912 = _1926;
    }
    float _1928 = _1912;
    float _1930 = fma(_977, _1730, _1910);
    if (!_1782)
    {
        int _1932 = _1838 << 2;
        _1914 = _1932;
    }
    int _1934 = _1914;
    float _1936 = _1868;
    int _1938 = _1934;
    if (!_1808)
    {
        float _1940 = -_1868;
        float _1942 = _1671 + _1940;
        _1936 = _1942;
    }
    float _1944 = _1936;
    if (!_1782)
    {
        uint _1946 = uint(int(uint(_1838) >> uint(2)));
        _1916 = int(_1946);
    }
    int _1948 = _1916;
    float _1950 = fma(_987, _1764, _1930);
    if (!_1782)
    {
        int _1952 = 12 & _1934;
        _1938 = _1952;
    }
    int _1954 = _1938;
    float _1956 = floor(_1880);
    float _1958 = _1950 + _1772;
    if (!_1782)
    {
        int _1960 = _1948 << 4;
        int _1962 = _1960 + _1954;
        _1407 = as_type<float>(_1962);
    }
    float _1964 = _1407;
    int _1966 = _1717 + 88;
    uint _1968 = uint(int(uint(_1966) >> uint(2)));
    uint _1970 = uint(int(uint(int(_1968)) >> uint(2)));
    int _1972 = int(_1968) & 3;
    float _1974 = (*spvDescriptorSet0.vp_c15)._m0[int(_1970)][_1972];
    int _1976 = int(_1968) + 1;
    uint _1978 = uint(int(uint(_1976) >> uint(2)));
    int _1980 = _1976 & 3;
    float _1982 = (*spvDescriptorSet0.vp_c15)._m0[int(_1978)][_1980];
    float _1984 = _1649 * _1804;
    float _1986 = 1.0 / _1958;
    float _1988 = fma(_977, _1796, _1984);
    int _1990 = _1717 + 80;
    uint _1992 = uint(int(uint(_1990) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c15)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c15)._m0[int(_2002)][_2004];
    float _2008 = _1649 * _1826;
    float _2010 = _1826;
    float _2012 = _2008;
    if (!_1782)
    {
        float _2014 = floor(_1651);
        _2010 = _2014;
    }
    float _2016 = _2010;
    float _2018 = -_1956;
    float _2020 = _1880 + _2018;
    float _2022 = fma(_977, _1818, _2008);
    float _2024 = _1964;
    if (!_1782)
    {
        int _2026 = as_type<int>(_1964) + 400;
        uint _2028 = uint(int(uint(_2026) >> uint(2)));
        uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
        int _2032 = int(_2028) & 3;
        float _2034 = (*spvDescriptorSet0.vp_c15)._m0[int(_2030)][_2032];
        _2024 = _2034;
    }
    float _2036 = _2024;
    float _2038 = fma(_987, _1854, _1988);
    float _2040 = _1854;
    if (!_1808)
    {
        float _2042 = floor(_1669);
        _2012 = _2042;
    }
    float _2044 = _2012;
    float _2046 = _2038 + _1862;
    float _2048 = _2046 * _1986;
    float _2050 = _1862;
    if (!_1782)
    {
        float _2052 = floor(_1641);
        _2050 = _2052;
    }
    float _2054 = _2050;
    float _2056 = fma(_987, _1894, _2022);
    float _2058 = _2016;
    if (!_1782)
    {
        float _2060 = -_2016;
        float _2062 = _1651 + _2060;
        _2058 = _2062;
    }
    float _2064 = _2058;
    bool _2066 = _2048 >= 0.0;
    float _2068 = _2056 + _1902;
    bool _2070 = _2048 <= 1.0;
    bool _2072 = _2070 && _2066;
    float _2074 = _2064;
    if (!_1808)
    {
        float _2076 = rint(_1928);
        float _2078 = precise::max(_2076, 0.0);
        uint _2080 = uint(_2078);
        uint _2082 = clamp(_2080, 0u, 65535u);
        _2040 = as_type<float>(_2082);
    }
    float _2084 = _2040;
    float _2086 = _2068 * _1986;
    bool _2088 = _2086 >= 0.0;
    bool _2090 = _2088 && _2072;
    float _2092 = _2054;
    float _2094 = _2086;
    if (!_1782)
    {
        float _2096 = -_2054;
        float _2098 = _1641 + _2096;
        _1699 = _2098;
    }
    float _2100 = _1699;
    if (!_1808)
    {
        float _2102 = -_2044;
        float _2104 = _1669 + _2102;
        _2092 = _2104;
    }
    float _2106 = _2092;
    bool _2108 = _2086 <= 1.0;
    bool _2110 = _2108 && _2090;
    float _2112 = _1649 * _2006;
    float _2114 = fma(_977, _1998, _2112);
    if (_2110)
    {
        float _2116 = float(_1709);
        _1832 = _2116;
    }
    float _2118 = _1832;
    float _2120 = _1818;
    if (!_1782)
    {
        float _2122 = rint(_2036);
        float _2124 = precise::max(_2122, 0.0);
        uint _2126 = uint(_2124);
        uint _2128 = clamp(_2126, 0u, 65535u);
        _2120 = as_type<float>(_2128);
    }
    float _2130 = _2120;
    float _2132 = fma(_987, _1974, _2114);
    float _2134 = fma(_977, 6.2500002968590706586837768554688e-05, 0.5);
    float _2136 = _2132 + _1982;
    float _2138 = fma(_987, 6.2500002968590706586837768554688e-05, 0.5);
    float _2140 = _2112;
    if (_2110)
    {
        float _2142 = rint(_2118);
        float _2144 = precise::max(_2142, 0.0);
        uint _2146 = uint(_2144);
        uint _2148 = clamp(_2146, 0u, 65535u);
        _2140 = as_type<float>(_2148);
    }
    float _2150 = _2140;
    float _2152 = _2136 * _1986;
    float2 _6727 = float2(_2134, _2138);
    float _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_6727, float2(0.0), isnan(_6727)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_6727, float2(0.0), isnan(_6727)), level(0.0)).x;
    float2 _6737 = float2(_1621, _2020);
    float _2156 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6737, float2(0.0), isnan(_6737)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6737, float2(0.0), isnan(_6737)), level(0.0)).x;
    float _2158 = _2130;
    if (!_1782)
    {
        float3 _6752 = float3(_2064, _2100, float(as_type<int>(_2130)));
        float3 _6756 = select(_6752, float3(0.0), isnan(_6752));
        float _2160 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6756.xy, uint(rint(_6756.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6756.xy, uint(rint(_6756.z)), level(0.0)).x;
        _2158 = _2160;
    }
    float _2162 = _2158;
    float _2164 = _2084;
    if (!_1808)
    {
        float3 _6772 = float3(_2106, _1944, float(as_type<int>(_2084)));
        float3 _6774 = select(_6772, float3(0.0), isnan(_6772));
        float _2166 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6774.xy, uint(rint(_6774.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6774.xy, uint(rint(_6774.z)), level(0.0)).x;
        _2164 = _2166;
    }
    float _2168 = _2164;
    float _2170 = _1651;
    if (_2110)
    {
        float3 _6789 = float3(_2048, _2086, float(as_type<int>(_2150)));
        float3 _6791 = select(_6789, float3(0.0), isnan(_6789));
        float _2172 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6791.xy, uint(rint(_6791.z)), _2152, level(0.0));
        _2170 = _2172;
    }
    float _2174 = _2170;
    float _2176 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2178 = _1463 + _2176;
    float _2180 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2182 = _1469 + _2180;
    bool _2184 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2186 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(0.5);
    bool _2192 = _2188 || _2190;
    float _2194 = fma(_2178, _1591, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2196 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2198 = _1471 + _2196;
    float _2200 = fma(_2182, _1591, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2202 = -_965;
    float _2204 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2194);
    float _2206 = fma(_2198, _1591, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2208 = -_967;
    float _2210 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2200);
    float _2212 = -_973;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2206);
    float _2216 = _2210;
    float _2218 = _2214;
    if (_2192)
    {
        _2094 = _2204;
    }
    float _2220 = _2094;
    float _2222 = _2220;
    if (!_2192)
    {
        float _2224 = _983 * _983;
        float _2226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2228 = -_657;
        float _2230 = _2228 + _2206;
        float _2232 = -_603;
        float _2234 = _2232 + _2194;
        float _2236 = fma(_991, _991, _2224);
        float _2238 = -_639;
        float _2240 = _2238 + _2200;
        float _2242 = fma(_999, _999, _2236);
        float _2244 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2246 = sqrt(_2242);
        float _2248 = 1.0 / _1195;
        float _2250 = _2244 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2252 = precise::min(_2246, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2254 = _2252 * _2226;
        float _2256 = _2254 * _2248;
        float _2258 = _2250 * _2256;
        float _2260 = _2230 * _2256;
        float _2262 = fma(_2234, _2258, _971);
        float _2264 = fma(_2240, _2258, _977);
        float _2266 = fma(_2250, _2260, _987);
        _2222 = _2262;
        _2216 = _2264;
        _2218 = _2266;
    }
    float _2268 = _2222;
    float _2270 = _2216;
    float _2272 = _2218;
    float _2274 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2276 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2278 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _2280 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2282 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan(0.5);
    bool _2288 = _2284 || _2286;
    float _2290 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2274);
    float _2292 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2276);
    float _2294 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2296 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2278);
    float _2298 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2290);
    float _2300 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2292);
    float _2302 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2294);
    float _2304 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2296);
    float _2306 = _2298 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2308 = _2300 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2310 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2302);
    float _2312 = _2304 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2314 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2316 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2318 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2320 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2322 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2314);
    float _2324 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2316);
    float _2326 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2318);
    float _2328 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2320);
    float _2330 = abs(_2154);
    bool _2332 = _2330 != 0.0;
    bool _2334 = isnan(_2330);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan(0.0);
    bool _2340 = _2336 || _2338;
    float _2342 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2322);
    float _2344 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2346 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2324);
    float _2348 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2326);
    float _2350 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2328);
    float _2352 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2342);
    float _2354 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2346);
    float _2356 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2348);
    float _2358 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2350);
    float _2360 = _2308;
    float _2362 = _2350;
    float _2364 = _2326;
    float _2366 = _2358;
    if (_2288)
    {
        _2360 = 1.0;
    }
    float _2368 = _2360;
    float _2370 = _2368;
    if (_2340)
    {
        _2074 = _2358;
    }
    float _2372 = _2074;
    float _2374 = _2372;
    if (!_2340)
    {
        _2374 = 0.0;
    }
    float _2376 = _2374;
    float _2378 = _2376;
    if (!_2288)
    {
        float _2380 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2382 = _2380 * 0.15915493667125701904296875;
        float _2384 = _2382 * 6.283185482025146484375;
        float _2386 = cos(_2384);
        float _2388 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2390 = _2388 * 0.15915493667125701904296875;
        float _2392 = _2382 * 6.283185482025146484375;
        float _2394 = sin(_2392);
        float _2396 = 1.0 / _2386;
        float _2398 = _2390 * 6.283185482025146484375;
        float _2400 = cos(_2398);
        float _2402 = _2394 * _2396;
        float _2404 = _2390 * 6.283185482025146484375;
        float _2406 = sin(_2404);
        float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2410 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2408;
        float _2412 = _2400 * _2402;
        float _2414 = 1.0 / _2410;
        float _2416 = 1.0 / _2412;
        float _2418 = _2406 * _2416;
        float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2422 = fma(_1667, _2418, _2420);
        float _2424 = _2422 * _2414;
        float _2426 = precise::clamp(_2424, 0.0, 1.0);
        _2362 = _2414;
        _1013 = _2390;
        _2364 = _2416;
        _2370 = _2426;
    }
    float _2428 = _2362;
    float _2430 = _1013;
    float _2432 = _2364;
    float _2434 = _2370;
    out.gl_Position.x = _2352;
    out.gl_Position.y = _2354;
    out.gl_Position.z = _2356;
    out.gl_Position.w = _2358;
    float _2436 = _2428;
    float _2438 = _2430;
    float _2440 = _2432;
    if (!_2340)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1782)
    {
        int _2442 = _1838 << 4;
        int _2444 = _2442 + 2048;
        uint _2446 = uint(int(uint(_2444) >> uint(2)));
        uint _2448 = uint(int(uint(int(_2446)) >> uint(2)));
        int _2450 = int(_2446) & 3;
        float _2452 = (*spvDescriptorSet0.vp_c15)._m0[int(_2448)][_2450];
        int _2454 = int(_2446) + 1;
        uint _2456 = uint(int(uint(_2454) >> uint(2)));
        int _2458 = _2454 & 3;
        float _2460 = (*spvDescriptorSet0.vp_c15)._m0[int(_2456)][_2458];
        int _2462 = _2444 + 8;
        uint _2464 = uint(int(uint(_2462) >> uint(2)));
        uint _2466 = uint(int(uint(int(_2464)) >> uint(2)));
        int _2468 = int(_2464) & 3;
        float _2470 = (*spvDescriptorSet0.vp_c15)._m0[int(_2466)][_2468];
        int _2472 = int(_2464) + 1;
        uint _2474 = uint(int(uint(_2472) >> uint(2)));
        int _2476 = _2472 & 3;
        float _2478 = (*spvDescriptorSet0.vp_c15)._m0[int(_2474)][_2476];
        float _2480 = _1595 * _2460;
        float _2482 = fma(_977, _2452, _2480);
        float _2484 = fma(_987, _2470, _2482);
        float _2486 = _2484 + _2478;
        float _2488 = precise::clamp(_2486, 0.0, 1.0);
        float _2490 = -_2488;
        float _2492 = _2490 + _2162;
        float _2494 = fma(_2492, 500.0, 1.5);
        float _2496 = exp2(_2494);
        float _2498 = 0.0 + _2496;
        float _2500 = precise::clamp(_2498, 0.0, 1.0);
        bool _2502 = _2500 >= 1.0;
        bool _2504 = isnan(_2500);
        bool _2506 = _2502 || _2504;
        bool _2508 = isnan(1.0);
        bool _2510 = _2506 || _2508;
        _2436 = _2452;
        _2438 = _2460;
        if (!_2510)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_2510)
        {
            _2378 = 0.0;
        }
    }
    float _2512 = _2436;
    float _2514 = _2438;
    float _2516 = _2378;
    float _2518 = _2514;
    float _2520 = _2512;
    if (_1808)
    {
        _2440 = 1.0;
    }
    float _2522 = _2440;
    float _2524 = _2522;
    if (!_1808)
    {
        int _2526 = _1844 << 4;
        int _2528 = _2526 + 2048;
        uint _2530 = uint(int(uint(_2528) >> uint(2)));
        uint _2532 = uint(int(uint(int(_2530)) >> uint(2)));
        int _2534 = int(_2530) & 3;
        float _2536 = (*spvDescriptorSet0.vp_c15)._m0[int(_2532)][_2534];
        int _2538 = int(_2530) + 1;
        uint _2540 = uint(int(uint(_2538) >> uint(2)));
        int _2542 = _2538 & 3;
        float _2544 = (*spvDescriptorSet0.vp_c15)._m0[int(_2540)][_2542];
        int _2546 = _2528 + 8;
        uint _2548 = uint(int(uint(_2546) >> uint(2)));
        uint _2550 = uint(int(uint(int(_2548)) >> uint(2)));
        int _2552 = int(_2548) & 3;
        float _2554 = (*spvDescriptorSet0.vp_c15)._m0[int(_2550)][_2552];
        int _2556 = int(_2548) + 1;
        uint _2558 = uint(int(uint(_2556) >> uint(2)));
        int _2560 = _2556 & 3;
        float _2562 = (*spvDescriptorSet0.vp_c15)._m0[int(_2558)][_2560];
        float _2564 = _1649 * _2544;
        float _2566 = fma(_977, _2536, _2564);
        float _2568 = fma(_987, _2554, _2566);
        float _2570 = _2568 + _2562;
        float _2572 = precise::clamp(_2570, 0.0, 1.0);
        float _2574 = -_2572;
        float _2576 = _2574 + _2168;
        float _2578 = fma(_2576, 500.0, 1.5);
        float _2580 = exp2(_2578);
        float _2582 = 0.0 + _2580;
        float _2584 = precise::clamp(_2582, 0.0, 1.0);
        _2518 = _2544;
        _2520 = _2536;
        _2524 = _2584;
    }
    float _2586 = _2518;
    float _2588 = _2520;
    float _2590 = _2524;
    float _2592 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2594 = _2268 + _2592;
    float _2596 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2598 = _2270 + _2596;
    float _2600 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2602 = _2272 + _2600;
    float _2604 = _2594 * _2594;
    float _2606 = fma(_2598, _2598, _2604);
    float _2608 = fma(_2602, _2602, _2606);
    float _2610 = rsqrt(_2608);
    float _2612 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2614 = _2598 * _2612;
    float _2616 = _2602 * _2612;
    float _2618 = _2614 * _2614;
    float _2620 = _2616 * _2616;
    float _2622 = _2618 + _2620;
    float _2624 = sqrt(_2622);
    bool _2626 = _2624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2630 = _2624 + _2628;
    float _2632 = _2602;
    float _2634 = _2622;
    float _2636 = _2630;
    float _2638 = _2586;
    float _2640 = _2588;
    float _2642 = _2594;
    float _2644 = _2614;
    if (_2626)
    {
        float _2646 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2632 = _2646;
    }
    float _2648 = _2632;
    if (_2626)
    {
        float _2650 = rsqrt(_2622);
        _2634 = _2650;
    }
    float _2652 = _2634;
    float _2654 = _2652;
    if (_2626)
    {
        float _2656 = _2630 * _2648;
        _2636 = _2656;
    }
    float _2658 = _2636;
    if (_2626)
    {
        float _2660 = _2658 * 0.15915493667125701904296875;
        _2638 = _2660;
    }
    float _2662 = _2638;
    float _2664 = _2648;
    if (_2626)
    {
        float _2666 = _2662 * 6.283185482025146484375;
        float _2668 = sin(_2666);
        _2664 = _2668;
    }
    float _2670 = _2664;
    float _2672 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2674 = precise::max(0.0, _2672);
    float _2676 = _2604;
    float _2678 = _2674;
    if (_2626)
    {
        float _2680 = _2662 * 6.283185482025146484375;
        float _2682 = cos(_2680);
        _2676 = _2682;
    }
    float _2684 = _2676;
    float _2686 = -_2612;
    float _2688 = -_2674;
    float _2690 = fma(_2594, _2686, _2688);
    if (_2626)
    {
        float _2692 = _2690 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2678 = _2692;
    }
    float _2694 = _2678;
    float _2696 = _2670;
    float _2698 = _2694;
    if (_2626)
    {
        float _2700 = fma(_2670, _2694, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2640 = _2700;
    }
    float _2702 = _2640;
    float _2704 = _2702;
    if (!_2626)
    {
        _2696 = _2690;
    }
    float _2706 = _2696;
    float _2708 = _2706;
    float _2710 = _2684;
    if (_2626)
    {
        float _2712 = _2684 + (-1.0);
        _2642 = _2712;
    }
    float _2714 = _2642;
    float _2716 = _2714;
    if (_2626)
    {
        float _2718 = _2652 * _2702;
        _2704 = _2718;
    }
    float _2720 = _2704;
    if (!_2626)
    {
        _2654 = _2618;
    }
    float _2722 = _2654;
    float _2724 = _2722;
    if (_2626)
    {
        float _2726 = _2714 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2698 = _2726;
    }
    float _2728 = _2698;
    if (_2626)
    {
        float _2730 = _2614 * _2720;
        _2644 = _2730;
    }
    float _2732 = _2644;
    if (!_2626)
    {
        _2716 = _2616;
    }
    float _2734 = _2716;
    float _2736 = _2734;
    if (_2626)
    {
        float _2738 = _2616 * _2720;
        _2736 = _2738;
    }
    float _2740 = _2736;
    if (_2626)
    {
        float _2742 = fma(_2690, _2684, _2728);
        _2708 = _2742;
    }
    float _2744 = _2708;
    if (_2626)
    {
        float _2746 = _2732 * _2732;
        _2724 = _2746;
    }
    float _2748 = _2724;
    float _2750 = sqrt(_2608);
    if (!_2626)
    {
        _2710 = _2620;
    }
    float _2752 = _2710;
    float _2754 = _2752;
    if (_2626)
    {
        float _2756 = _2740 * _2740;
        _2754 = _2756;
    }
    float _2758 = _2754;
    float _2760 = fma(_2744, _2744, _2748);
    float _2762 = _2760 + _2758;
    float _2764 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2766 = 1.0 / _2516;
    float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2770 = fma(_2750, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2768);
    float _2772 = precise::clamp(_2770, 0.0, 1.0);
    float _2774 = rsqrt(_2762);
    float _2776 = -_2772;
    float _2778 = _2776 + 1.0;
    float _2780 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2782 = -_2780;
    float _2784 = fma(_2782, _2764, 1.0);
    float _2786 = abs(_2778);
    float _2788 = log2(_2786);
    float _2790 = _2352 * _2766;
    float _2792 = fma(_2790, 0.5, 0.5);
    float _2794 = _2774 * _2732;
    float _2796 = _2774 * _2744;
    float _2798 = _2774 * _2740;
    float _2800 = log2(_2784);
    float _2802 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2804 = -_2802;
    float _2806 = fma(_2796, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2804);
    float _2808 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2810 = -_2798;
    float _2812 = fma(_2810, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2806);
    float _2814 = _2796 + 1.0;
    float _2816 = exp2(_2808);
    float _2818 = fma(_2812, -0.5, 0.5);
    float _2820 = fma(_2812, 0.5, 0.5);
    float _2822 = _2800 * 0.693147182464599609375;
    float _2824 = fma(_2820, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2826 = sqrt(_2818);
    float _2828 = fma(_2820, _2824, -0.212114393711090087890625);
    float _2830 = fma(_2820, _2828, 1.570728778839111328125);
    float _2832 = _2354 * _2766;
    float _2834 = -_2796;
    float _2836 = fma(_2816, _2814, _2834);
    float _2838 = _2822 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2840 = fma(_2832, -0.5, 0.5);
    float _2842 = fma(_2836, 0.5, 0.5);
    float _2844 = _2826 * 0.636619746685028076171875;
    float3 _7856 = float3(_2792, _2840, _2838);
    float _2846 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7856, float3(0.0), isnan(_7856)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7856, float3(0.0), isnan(_7856)), level(0.0)).x;
    float _2848 = -_2830;
    float _2850 = fma(_2844, _2848, 1.0);
    float3 _7870 = float3(_2792, _2840, _2838);
    float4 _2853 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7870, float3(0.0), isnan(_7870)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7870, float3(0.0), isnan(_7870)), level(0.0)).xyzw;
    float _2855 = _2853.x;
    float _2857 = _2853.y;
    float _2859 = _2853.z;
    float _2861 = _2853.w;
    float2 _7886 = float2(_2850, _2842);
    float3 _2865 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7886, float2(0.0), isnan(_7886)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7886, float2(0.0), isnan(_7886)), level(0.0)).xyz;
    float _2867 = _2865.x;
    float _2869 = _2865.y;
    float _2871 = _2865.z;
    float _2873 = abs(_1667);
    float _2875 = log2(_2873);
    float _2877 = _2358 * 0.5;
    float _2879 = _2356 + _2358;
    float _2881 = _2352 + _2358;
    float _2883 = -_2156;
    float _2885 = _2883 + 1.0;
    float _2887 = fma(_2354, -0.5, _2877);
    float _2889 = _2879 * 0.5;
    float _2891 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2893 = _1667 <= 8000.0;
    bool _2895 = isnan(_1667);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan(8000.0);
    bool _2901 = _2897 || _2899;
    float _2903 = float(_2901);
    float _2905 = _2881 * 0.5;
    float _2907 = _2788;
    if (!_2110)
    {
        _2907 = 1.0;
    }
    float _2909 = _2907;
    float _2911 = _2909;
    if (_2110)
    {
        bool _2913 = _2174 >= _2152;
        bool _2915 = isnan(_2174);
        bool _2917 = _2913 || _2915;
        bool _2919 = isnan(_2152);
        bool _2921 = _2917 || _2919;
        float _2923 = float(_2921);
        _2911 = _2923;
    }
    float _2925 = _2911;
    float _2927 = exp2(_2891);
    float _2929 = _2875 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_84.x = _2905;
    out.m_84.y = _2887;
    out.m_84.z = _2889;
    out.m_84.w = _2358;
    bool _2931 = _2750 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2933 = isnan(_2750);
    bool _2935 = _2931 || _2933;
    bool _2937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2939 = _2935 || _2937;
    float _2941 = _2925 * _2590;
    float _2943 = exp2(_2929);
    if (!_2939)
    {
        _2366 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2945 = _2366;
    float _2947 = fma(_2943, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2949 = precise::clamp(_2947, 0.0, 1.0);
    float _2951 = fma(_2949, -2.0, 3.0);
    float _2953 = _2949 * _2949;
    float _2955 = _2953 * _2951;
    float _2957 = -_2955;
    float _2959 = _2957 + 1.0;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2955);
    float _2963 = _2903 * _2961;
    float _2965 = _2963 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2967 = -_2927;
    float _2969 = _2967 + 1.0;
    float _2971 = _2885 * _2965;
    float _2973 = precise::clamp(_2971, 0.0, 1.0);
    float _2975 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2977 = _2965;
    float _2979 = _2945;
    float _2981 = _2945;
    if (!_2939)
    {
        _2977 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2983 = _2977;
    float _2985 = -_2973;
    float _2987 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2989 = _2434 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2991 = -_2941;
    float _2993 = fma(_2991, _2987, 1.0);
    float _2995 = precise::clamp(_2993, 0.0, 1.0);
    float _2997 = _2987;
    float _2999 = _2995;
    float _3001 = _2983;
    float _3003 = _2983;
    if (!_2939)
    {
        _2997 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3005 = _2997;
    float _3007 = _2995 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3009 = _3005;
    float _3011 = _3005;
    if (!_2939)
    {
        _2999 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3013 = _2999;
    out.m_86.x = _3007;
    float _3015 = _2975 * _2846;
    float _3017 = -_2975;
    float _3019 = _3017 + 1.0;
    float _3021 = _2861 * _3015;
    float _3023 = _2861 * _3019;
    float _3025 = _3019;
    float _3027 = _3015;
    float _3029 = _3013;
    float _3031 = _3013;
    if (!_2939)
    {
        _3025 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3033 = _3025;
    float _3035 = _2871 * _3015;
    float _3037 = fma(_2867, _3021, _2855);
    float _3039 = fma(_2869, _3021, _2857);
    float _3041 = _3033;
    float _3043 = _3033;
    if (!_2939)
    {
        _3027 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3045 = _3027;
    float _3047 = fma(_2861, _3035, _2859);
    out.m_88.x = _3037;
    out.m_88.y = _3039;
    out.m_88.z = _3047;
    out.m_88.w = _3023;
    bool _3049 = !_2939;
    float _3051 = _3045;
    float _3053 = _3045;
    if (!_3049)
    {
        bool _3055 = _2750 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3057 = isnan(_2750);
        bool _3059 = _3055 || _3057;
        bool _3061 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3063 = _3059 || _3061;
        if (!_3063)
        {
            float _3065 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3067 = _2750 + _3065;
            float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3071 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3069;
            float _3073 = 1.0 / _3071;
            float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3079 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3081 = _3079 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3085 = _3083 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3087 = _3067 * _3073;
            float _3089 = precise::clamp(_3087, 0.0, 1.0);
            float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3093 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3095 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3097 = _3095 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3099 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3101 = _3099 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3103 = fma(_3089, _3085, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _3105 = fma(_3089, _3093, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3107 = fma(_3089, _3097, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3109 = fma(_3089, _3101, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3111 = fma(_3089, _3077, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3113 = fma(_3089, _3081, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            _3003 = _3107;
            _3011 = _3113;
            _2981 = _3105;
            _3043 = _3111;
            _3053 = _3109;
            _3031 = _3103;
            _3115 = true;
        }
        else
        {
            bool _3117 = _2750 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3119 = isnan(_2750);
            bool _3121 = _3117 || _3119;
            bool _3123 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3125 = _3121 || _3123;
            if (!_3125)
            {
                _2979 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3127 = _2979;
            _2981 = _3127;
            if (!_3125)
            {
                _3001 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3129 = _3001;
            _3003 = _3129;
            if (!_3125)
            {
                _3051 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3131 = _3051;
            _3053 = _3131;
            if (!_3125)
            {
                _3041 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3133 = _3041;
            _3043 = _3133;
            if (!_3125)
            {
                _3009 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3135 = _3009;
            _3011 = _3135;
            if (!_3125)
            {
                _3029 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3137 = _3029;
            bool _3139 = !_3125;
            _3031 = _3137;
            if (!_3139)
            {
                bool _3141 = _2750 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3143 = isnan(_2750);
                bool _3145 = _3141 || _3143;
                bool _3147 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3149 = _3145 || _3147;
                if (!_3149)
                {
                    float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3153 = _2750 + _3151;
                    float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3157 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3155;
                    float _3159 = 1.0 / _3157;
                    float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3165 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3167 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3169 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3173 = _3153 * _3159;
                    float _3175 = precise::clamp(_3173, 0.0, 1.0);
                    float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3181 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3187 = _3185 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3189 = fma(_3175, _3171, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _3191 = fma(_3175, _3179, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3193 = fma(_3175, _3183, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3195 = fma(_3175, _3187, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3197 = fma(_3175, _3163, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3199 = fma(_3175, _3167, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    _3003 = _3193;
                    _3011 = _3199;
                    _2981 = _3191;
                    _3043 = _3197;
                    _3053 = _3195;
                    _3031 = _3189;
                    _3115 = true;
                }
                else
                {
                    _3003 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3011 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2981 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3043 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3053 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3031 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3115 = false;
    float _3201 = _3003;
    float _3203 = _3011;
    float _3205 = _2981;
    float _3207 = _3043;
    float _3209 = _3053;
    float _3211 = _3031;
    float _3213 = _2989 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3215 = fma(_1513, -0.5, 0.5);
    float _3217 = precise::clamp(_3215, 0.0, 1.0);
    float _3219 = -_3201;
    float _3221 = _3219 + _3203;
    float _3223 = -_3205;
    float _3225 = _3223 + _3207;
    out.m_90.x = 0.0;
    float _3227 = -_3209;
    float _3229 = _3227 + _3211;
    float _3231 = fma(_3217, _3221, _3201);
    float _3233 = fma(_3217, _3225, _3205);
    bool _3235 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3237 = _3231 * 0.586610972881317138671875;
    float _3239 = fma(_3217, _3229, _3209);
    out.m_63.x = _3213;
    bool _3241 = _2434 > 0.0;
    bool _3243 = isnan(_2434);
    bool _3245 = _3241 || _3243;
    bool _3247 = isnan(0.0);
    bool _3249 = _3245 || _3247;
    float _3251 = fma(_3233, 0.298911988735198974609375, _3237);
    float _3253 = fma(_3239, 0.114477999508380889892578125, _3251);
    float _3255 = -_3253;
    float _3257 = _3233 + _3255;
    float _3259 = -_3253;
    float _3261 = _3231 + _3259;
    float _3263 = -_3253;
    float _3265 = _3239 + _3263;
    float _3267 = fma(_3257, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3253);
    float _3269 = fma(_3261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3253);
    float _3271 = fma(_3265, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3253);
    bool _3273 = !_3235;
    if (!_3273)
    {
        float _3275 = -_2268;
        float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3279 = -_2270;
        float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3283 = -_2272;
        float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3287 = _3277 * _3277;
        float _3289 = fma(_3281, _3281, _3287);
        float _3291 = fma(_3285, _3285, _3289);
        float _3293 = sqrt(_3291);
        float _3295 = rsqrt(_3291);
        float _3297 = -_3293;
        float _3299 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3301 = _3299 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3303 = precise::clamp(_3301, 0.0, 1.0);
        float _3305 = _3281 * _3295;
        float _3307 = _3277 * _3295;
        float _3309 = abs(_3303);
        float _3311 = log2(_3309);
        float _3313 = _3285 * _3295;
        float _3315 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3317 = _1513 * _3307;
        float _3319 = -_3307;
        float _3321 = -_3315;
        float _3323 = fma(_3319, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3321);
        float _3325 = fma(_1511, _3305, _3317);
        float _3327 = -_3313;
        float _3329 = fma(_3327, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3323);
        float _3331 = fma(_1515, _3313, _3325);
        float _3333 = precise::clamp(_3331, 0.0, 1.0);
        float _3335 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3337 = _3329 + _3335;
        float _3339 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3341 = _3337 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3343 = precise::clamp(_3341, 0.0, 1.0);
        float _3345 = exp2(_3339);
        float _3347 = _3345 * _3343;
        float _3349 = _3333 * _3347;
        float _3351 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3353 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3355 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3351;
        out.m_90.y = _3353;
        out.m_90.z = _3355;
    }
    out.m_92.x = _3267;
    out.m_92.y = _3269;
    out.m_92.z = _3271;
    if (_3249)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _3357 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3357;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3115 = false;
    bool _1561 = false;
    bool _421 = false;
    bool _309 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_60.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_63.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3414 = as_type<float>(_127);
        out.gl_Position.z = _3414;
    }
    if (!_115)
    {
        return out;
    }
    float _131 = in.m_65.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_63.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3483 = as_type<float>(_165);
        out.gl_Position.z = _3483;
    }
    if (_159)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _205;
    if (!_187)
    {
        float _189 = in.m_70.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        float _209 = float(_111);
        float _211 = 1.0 / _209;
        float _213 = _145 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_70.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_111);
        float _313 = 1.0 / _311;
        float _315 = _145 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    bool _319 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _321 = isnan(_317);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _335 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _337 = isnan(_317);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _317 + _351;
    float _355 = -_329;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _361 = 1.0 / _333;
    float _363 = _345 * _357;
    float _365 = -_345;
    float _367 = _365 + 1.0;
    float _369 = _349 * _361;
    float _371 = fma(_369, _353, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _373 = _371 * _363;
    float _375 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[115].x, _373);
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _383 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[116].x, _375);
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = _383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _393 = in.m_72.x;
    float _395 = in.m_72.y;
    out.m_74.x = _385;
    out.m_74.y = _387;
    out.m_74.z = _389;
    out.m_74.w = _391;
    float _397 = _287 * _395;
    float _399 = _285 * _393;
    bool _401 = !_359;
    float _419;
    if (!_401)
    {
        float _403 = in.m_70.x;
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _407 = _403 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_111);
        float _425 = 1.0 / _423;
        float _427 = _145 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = in.m_70.x;
    float _433 = in.m_70.y;
    float _435 = in.m_70.z;
    float _437 = in.m_70.w;
    float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _441 = in.m_60.x;
    float _443 = in.m_60.y;
    float _445 = in.m_60.z;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _457 = _455 != 0;
    float _459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _463 = _461 != 0;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _467 = _465 != 0;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _475 = 1.0 / _471;
    float _477 = _435 * 2.0;
    bool _479 = _437 > 0.5;
    float _481 = _431 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _483 = _433 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _485 = _431 > 0.5;
    float _487 = floor(_477);
    float _489 = -_185;
    int _491 = _479 ? as_type<int>(_489) : as_type<int>(_185);
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _495 = _433 > 0.5;
    float _497 = _431 * 2.0;
    float _499 = -_181;
    int _501 = _485 ? as_type<int>(_499) : as_type<int>(_181);
    float _503 = -_493;
    float _505 = fma(_481, 2.0, _503);
    float _507 = -_185;
    int _509 = _495 ? as_type<int>(_507) : as_type<int>(_185);
    float _511 = fma(_483, -2.0, _473);
    bool _513 = !_449;
    float _515 = _513 ? _181 : as_type<float>(_501);
    float _517 = _443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _529 = _527 != 0;
    float _531 = _443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _533 = _443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _535;
    float _539 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _517);
    float _541 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
    float _543 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _533);
    float _545 = _433 + _435;
    float _547 = _537 * _475;
    float _549 = floor(_497);
    float _551 = _433 * 2.0;
    bool _553 = !_453;
    float _555 = _553 ? _185 : as_type<float>(_509);
    float _557 = _545 + (-1.0);
    bool _559 = _435 > 0.5;
    float _561 = _433 + _431;
    float _563 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
    float _565 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _567 = floor(_551);
    float _569 = -_181;
    int _571 = _559 ? as_type<int>(_569) : as_type<int>(_181);
    float _573 = _561 + (-1.0);
    bool _575 = _487 > 0.0;
    float _577 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].z, _541);
    bool _579 = !_457;
    float _581 = _579 ? _181 : as_type<float>(_571);
    float _583 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].z, _543);
    bool _585 = _487 >= 0.0;
    bool _587 = isnan(_487);
    bool _589 = _585 || _587;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _599 = _429 + _597;
    int _601 = _593 ? 0 : 1;
    float _603 = _577 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _605 = _549 >= 0.0;
    bool _607 = isnan(_549);
    bool _609 = _605 || _607;
    bool _611 = isnan(0.0);
    bool _613 = _609 || _611;
    float _615 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _617 = ~_601;
    int _619 = _617 + 1;
    int _621 = _619 + 1;
    float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _625 = _621;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _629 = _487;
    float _631 = _573;
    if (!_575)
    {
        int _633 = ~_601;
        int _635 = _633 + 1;
        _625 = _635;
    }
    int _637 = _625;
    float _639 = _563 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _641 = _613 ? 0 : 1;
    float _643 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _645 = _603 + _643;
    if (!_467)
    {
        _627 = _433;
    }
    float _647 = _627;
    float _649 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _651 = _639 + _649;
    float _653 = _647;
    if (!_467)
    {
        _629 = _435;
    }
    float _655 = _629;
    float _657 = _583 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _659 = _655;
    if (!_467)
    {
        _631 = _435;
    }
    float _661 = _631;
    bool _663 = _567 > 0.0;
    float _665 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _667 = _657 + _665;
    bool _669 = _567 >= 0.0;
    bool _671 = isnan(_567);
    bool _673 = _669 || _671;
    bool _675 = isnan(0.0);
    bool _677 = _673 || _675;
    float _679 = _595 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _681 = _661;
    if (_467)
    {
        _653 = _431;
    }
    float _683 = _653;
    float _685 = -_145;
    float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[76].x, _505);
    if (_467)
    {
        _659 = _433;
    }
    float _689 = _659;
    float _691 = _515 + 0.5;
    if (_467)
    {
        _681 = _433;
    }
    float _693 = _681;
    bool _695 = _549 > 0.0;
    float _697 = fma(_547, _599, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _699 = fma(_679, _691, _687);
    bool _701 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _703 = isnan(_429);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = _555 + (-0.5);
    bool _715 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _717 = isnan(_429);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _729 = _623 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _731 = -_711;
    float _733 = _731 + 1.0;
    float _735 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[83].w, _727);
    float _737 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _511);
    float _739 = _725 * _733;
    float _741 = -_725;
    float _743 = _741 + 1.0;
    float _745 = -_729;
    float _747 = -_737;
    float _749 = fma(_745, _713, _747);
    float _751 = _683 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _753 = _697 * _739;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _759 = _689 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _761 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[131].x, _753);
    float _763 = -_755;
    float _765 = fma(_751, 2.0, _763);
    float _767 = _439 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _769 = _581 + 0.5;
    float _771 = -_145;
    float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[81].x, _765);
    bool _775 = !_463;
    float _777 = _775 ? _185 : as_type<float>(_491);
    float _779 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[83].z, _757);
    float _781 = _459 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _783 = fma(_767, _769, _773);
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _787 = !_521;
    int _789 = _787 ? 0 : 1;
    float _791 = _777 + (-0.5);
    float _793 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _735);
    float _795 = fma(_759, -2.0, _785);
    int _797 = abs(_789);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _801 = _645 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _803 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _795);
    float _805 = -_793;
    float _807 = _805 + 1.0;
    float _809 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[28].x, _801);
    float _811 = -_781;
    float _813 = -_803;
    float _815 = fma(_811, _791, _813);
    float _817 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[132].x, _761);
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _821 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[28].z, _809);
    float _823 = float(_797);
    float _825 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _827 = log2(_825);
    float _829 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[78].z, _819);
    float _831 = float(_637);
    float _833 = fma(_777, _807, _815);
    float _835 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[78].w, _799);
    float _837 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _829);
    float _839 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _779);
    float _841 = _645 * _645;
    float _843 = _823 * _831;
    float _845 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _835);
    bool _847 = _821 >= 0.0;
    float _849 = -_837;
    float _851 = _849 + 1.0;
    float _853 = -_839;
    float _855 = _853 + 1.0;
    float _857 = fma(_651, _651, _841);
    float _859 = -_845;
    float _861 = _859 + 1.0;
    float _863 = _827 * _145;
    float _865 = -_855;
    float _867 = fma(_581, _865, _783);
    float _869 = fma(_667, _667, _857);
    float _871 = -_851;
    float _873 = fma(_515, _871, _699);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _877 = in.m_76.x;
    float _879 = in.m_76.y;
    float _881 = in.m_76.z;
    float _883 = fma(_555, _861, _749);
    float _885 = exp2(_863);
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _889 = 1.0 + _887;
    float _891 = _749;
    if (_847)
    {
        _891 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _893 = _891;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _897 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _901 = _817 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _903 = rsqrt(_869);
    float _905 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _909 = as_type<int>(_893);
    if (_847)
    {
        float _911 = _893 * 5.0;
        _909 = as_type<int>(_911);
    }
    int _913 = _909;
    bool _915 = !_525;
    int _917 = _915 ? 0 : 1;
    out.m_78.x = _873;
    out.m_78.y = _883;
    out.m_78.z = _867;
    out.m_78.w = _833;
    int _919 = ~_641;
    int _921 = _919 + 1;
    int _923 = _921 + 1;
    float _925 = 1.0 / _889;
    int _927 = abs(_917);
    out.m_80.x = _897;
    out.m_80.y = _905;
    out.m_80.z = _907;
    out.m_80.w = _901;
    int _929 = _923;
    if (!_695)
    {
        int _931 = ~_641;
        int _933 = _931 + 1;
        _929 = _933;
    }
    int _935 = _929;
    bool _937 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _939 = isnan(0.0);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _945 = _941 || _943;
    if (_847)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4755 = as_type<float>(_913);
        out.gl_Position.z = _4755;
    }
    bool _947 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _949 = isnan(1.0);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _955 = _951 || _953;
    if (_847)
    {
        out.m_63.x = 0.0;
    }
    float _957 = -_885;
    float _959 = _957 + 1.0;
    bool _961 = !_529;
    int _963 = _961 ? 0 : 1;
    float _965 = _645 * _903;
    float _967 = _651 * _903;
    if (_847)
    {
        return out;
    }
    float _969 = -_965;
    float _971 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[18].w, _603);
    float _973 = _667 * _903;
    float _975 = -_967;
    float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _979 = float(_927);
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _983 = _971 + _981;
    float _985 = -_973;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[18].w, _657);
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _991 = _977 + _989;
    float _993 = float(_935);
    float _995 = _983 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _999 = _987 + _997;
    float _1001 = _945 ? _959 : 0.0;
    float _1003 = _843 * (-2.0);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[28].x, _995);
    float _1007 = _979 * _993;
    float _1009 = _431 + (-0.5);
    float _1011 = _1003;
    float _1013 = _983;
    if (_955)
    {
        float _1015 = _1001 * _925;
        _149 = _1015;
    }
    float _1017 = _149;
    float _1019 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1005);
    float _1021 = fma(_1003, _877, _877);
    float _1023 = fma(_615, _1003, _615);
    float _1025 = _1007 * (-2.0);
    int _1027 = _677 ? 0 : 1;
    float _1029 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1021);
    bool _1031 = _1019 >= 0.0;
    float _1033 = fma(_1025, _879, _879);
    int _1035 = abs(_963);
    float _1037 = fma(_1023, _1017, _1029);
    int _1039 = ~_1027;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    float _1045 = fma(_565, _1025, _565);
    float _1047 = _1037 * 0.15915493667125701904296875;
    int _1049 = _1043;
    if (!_663)
    {
        int _1051 = ~_1027;
        int _1053 = _1051 + 1;
        _1049 = _1053;
    }
    int _1055 = _1049;
    float _1057 = _433 + (-0.5);
    float _1059 = float(_1035);
    float _1061 = _1047 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = float(_1055);
    float _1067 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1033);
    int _1069 = _1055;
    if (_1031)
    {
        _1011 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1071 = _1011;
    if (_1031)
    {
        out.m_63.x = 0.0;
    }
    float _1073 = _1059 * _1065;
    float _1075 = fma(_1045, _1017, _1067);
    if (_1031)
    {
        float _1077 = _1071 * 5.0;
        _1069 = as_type<int>(_1077);
    }
    int _1079 = _1069;
    float _1081 = _1047 * 6.283185482025146484375;
    float _1083 = cos(_1081);
    if (_1031)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4978 = as_type<float>(_1079);
        out.gl_Position.z = _4978;
    }
    if (_1031)
    {
        return out;
    }
    float _1085 = -_603;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1089 = -_639;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1093 = _1075 * 0.15915493667125701904296875;
    float _1095 = -_657;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = _1087 * _1087;
    float _1101 = -_965;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[18].w, _645);
    float _1105 = _1073 * (-2.0);
    float _1107 = -_967;
    float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _651);
    float _1111 = fma(_1091, _1091, _1099);
    float _1113 = _1103 * _1103;
    float _1115 = _435 + _431;
    float _1117 = -_973;
    float _1119 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[18].w, _667);
    float _1121 = fma(_1097, _1097, _1111);
    float _1123 = fma(_1109, _1109, _1113);
    float _1125 = _1115 + (-1.0);
    float _1127 = _435 + (-0.5);
    float _1129 = fma(_1105, _881, _881);
    float _1131 = fma(_1119, _1119, _1123);
    float _1133 = rsqrt(_1121);
    float _1135 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1137 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1129);
    float _1139 = fma(_1135, _1105, _1135);
    float _1141 = sqrt(_1131);
    float _1143 = fma(_1139, _1017, _1137);
    float _1145 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _1149 = _1143 * 0.15915493667125701904296875;
    float _1151 = _1091 * _1133;
    float _1153 = _1097 * _1133;
    float _1155 = _1087 * _1133;
    float _1157 = _1093 * 6.283185482025146484375;
    float _1159 = sin(_1157);
    float _1161 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1163 = _1151 * _1161;
    float _1165 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1167 = _1153 * _1165;
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1171 = _1155 * _1169;
    float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1175 = -_1163;
    float _1177 = fma(_1153, _1173, _1175);
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1181 = -_1167;
    float _1183 = fma(_1155, _1179, _1181);
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1187 = -_1171;
    float _1189 = fma(_1151, _1185, _1187);
    float _1191 = _1093 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = _903 * _1141;
    float _1197 = _1195 * _1145;
    float _1199 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1201 = _1199 * 0.5;
    float _1203 = _1149 * 6.283185482025146484375;
    float _1205 = sin(_1203);
    float _1207 = _1177 * _1177;
    float _1209 = _1063 * _1159;
    float _1211 = fma(_1183, _1183, _1207);
    float _1213 = _1083 * _1159;
    float _1215 = _1149 * 6.283185482025146484375;
    float _1217 = cos(_1215);
    float _1219 = fma(_1189, _1189, _1211);
    float _1221 = _1083 * _1193;
    float _1223 = rsqrt(_1219);
    float _1225 = fma(_1205, _1221, _1209);
    float _1227 = fma(_1205, _1209, _1221);
    float _1229 = _1063 * _1193;
    float _1231 = _1083 * _1217;
    float _1233 = _1193 * _1217;
    float _1235 = _1063 * _1217;
    float _1237 = _1159 * _1217;
    float _1239 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1241 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1243 = -_1229;
    float _1245 = fma(_1205, _1213, _1243);
    float _1247 = _1195 * _1239;
    float _1249 = _1241 * _1197;
    float _1251 = -_1213;
    float _1253 = fma(_1205, _1229, _1251);
    float _1255 = _1183 * _1223;
    float _1257 = _1147 * _1247;
    float _1259 = _1177 * _1223;
    float _1261 = _1231 * _1249;
    float _1263 = _1189 * _1223;
    float _1265 = -_1249;
    float _1267 = _1205 * _1265;
    float _1269 = _1153 * _1259;
    float _1271 = fma(_1225, _1257, _1261);
    float _1273 = _1155 * _1255;
    float _1275 = _1235 * _1249;
    float _1277 = fma(_1233, _1257, _1267);
    float _1279 = fma(_1245, _1201, _1271);
    float _1281 = -_1269;
    float _1283 = fma(_1155, _1263, _1281);
    float _1285 = -_1273;
    float _1287 = fma(_1151, _1259, _1285);
    float _1289 = fma(_1253, _1257, _1275);
    float _1291 = fma(_1237, _1201, _1277);
    float _1293 = _1283 * _1279;
    float _1295 = _1287 * _1279;
    float _1297 = fma(_1227, _1201, _1289);
    float _1299 = _1151 * _1263;
    float _1301 = fma(_1255, _1291, _1293);
    float _1303 = fma(_1263, _1291, _1295);
    float _1305 = _1231 * _1283;
    float _1307 = -_1299;
    float _1309 = fma(_1153, _1255, _1307);
    float _1311 = fma(_1151, _1297, _1301);
    float _1313 = fma(_1153, _1297, _1303);
    float _1315 = _1231 * _1287;
    float _1317 = _1309 * _1279;
    float _1319 = _639 + _1311;
    float _1321 = _657 + _1313;
    float _1323 = _1231 * _1309;
    float _1325 = _1225 * _1283;
    float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1329 = _1319 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1333 = _1321 + _1331;
    float _1335 = _1225 * _1309;
    float _1337 = _1225 * _1287;
    float _1339 = _1329 * _1329;
    float _1341 = _1333 * _1333;
    float _1343 = _1245 * _1287;
    float _1345 = fma(_1259, _1291, _1317);
    float _1347 = _1245 * _1283;
    float _1349 = _1339 + _1341;
    float _1351 = _1245 * _1309;
    float _1353 = fma(_1155, _1297, _1345);
    float _1355 = -_1205;
    float _1357 = fma(_1355, _1255, _1305);
    float _1359 = sqrt(_1349);
    float _1361 = -_1205;
    float _1363 = fma(_1361, _1259, _1323);
    float _1365 = -_1205;
    float _1367 = fma(_1365, _1263, _1315);
    float _1369 = _603 + _1353;
    float _1371 = fma(_1233, _1255, _1325);
    float _1373 = fma(_1233, _1259, _1335);
    float _1375 = fma(_1233, _1263, _1337);
    float _1377 = fma(_1237, _1255, _1347);
    float _1379 = fma(_1237, _1259, _1351);
    float _1381 = fma(_1235, _1151, _1357);
    float _1383 = fma(_1235, _1155, _1363);
    float _1385 = fma(_1237, _1263, _1343);
    float _1387 = fma(_1235, _1153, _1367);
    bool _1389 = _1359 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1391 = _1255;
    float _1393 = _1339;
    float _1395 = _1341;
    float _1397 = _1319;
    float _1399 = _1321;
    float _1401 = _1383;
    int _1403 = as_type<int>(_1347);
    float _1405 = _1343;
    float _1407 = _1305;
    if (!_1389)
    {
        _1391 = _1369;
    }
    float _1409 = _1391;
    bool _1411 = !_1389;
    float _1413 = _1409;
    if (!_1411)
    {
        float _1415 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1419 = _1359 + _1417;
        float _1421 = rsqrt(_1349);
        float _1423 = _1419 * _1415;
        float _1425 = _1369 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1427 = _1423 * 0.15915493667125701904296875;
        float _1429 = _1427 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        float _1433 = _1427 * 6.283185482025146484375;
        float _1435 = cos(_1433);
        float _1437 = fma(_1431, _1425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1439 = _1421 * _1437;
        float _1441 = _1435 + (-1.0);
        float _1443 = fma(_1329, _1439, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1445 = fma(_1333, _1439, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1447 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1451 = _1443 + _1449;
        float _1453 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1455 = _1445 + _1453;
        float _1457 = fma(_1369, _1435, _1447);
        float _1459 = _1451 * _1451;
        float _1461 = _1455 * _1455;
        _1413 = _1457;
        _1393 = _1459;
        _1395 = _1461;
        _1397 = _1443;
        _1399 = _1445;
    }
    float _1463 = _1413;
    float _1465 = _1393;
    float _1467 = _1395;
    float _1469 = _1397;
    float _1471 = _1399;
    float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1475 = _1463 + _1473;
    float _1477 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1479 = fma(_1253, _1151, _1371);
    float _1481 = fma(_1227, _1151, _1377);
    float _1483 = fma(_1475, _1475, _1465);
    float _1485 = fma(_1227, _1155, _1379);
    float _1487 = fma(_1227, _1153, _1385);
    float _1489 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1491 = _1483 + _1467;
    float _1493 = _1477 * _1381;
    float _1495 = fma(_1253, _1155, _1373);
    float _1497 = fma(_1253, _1153, _1375);
    float _1499 = _1477 * _1383;
    float _1501 = _1477 * _1387;
    float _1503 = sqrt(_1491);
    float _1505 = fma(_1489, _1479, _1493);
    float _1507 = fma(_1489, _1495, _1499);
    float _1509 = fma(_1489, _1497, _1501);
    float _1511 = _1481 + _1505;
    float _1513 = _1485 + _1507;
    float _1515 = _1487 + _1509;
    out.m_82.x = _1511;
    out.m_82.y = _1513;
    out.m_82.z = _1515;
    bool _1517 = _1503 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1519 = isnan(_1503);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1525 = _1521 || _1523;
    if (!_1525)
    {
        _1401 = 1.0;
    }
    float _1527 = _1401;
    bool _1529 = !_1525;
    float _1531 = _1527;
    if (!_1529)
    {
        bool _1533 = _1503 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1535 = isnan(_1503);
        bool _1537 = _1533 || _1535;
        bool _1539 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1541 = _1537 || _1539;
        if (!_1541)
        {
            float _1543 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1545 = _1503 + _1543;
            float _1547 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1549 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1547;
            float _1551 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1553 = _1551 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1555 = 1.0 / _1549;
            float _1557 = _1545 * _1555;
            float _1559 = fma(_1557, _1553, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1531 = _1559;
            _1561 = true;
        }
        else
        {
            bool _1563 = _1503 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1565 = isnan(_1503);
            bool _1567 = _1563 || _1565;
            bool _1569 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1571 = _1567 || _1569;
            if (!_1571)
            {
                float _1573 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1575 = _1503 + _1573;
                float _1577 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1579 = _1577 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1581 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1583 = _1581 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1585 = 1.0 / _1579;
                float _1587 = _1575 * _1585;
                float _1589 = fma(_1587, _1583, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1531 = _1589;
                _1561 = true;
            }
            else
            {
                _1531 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1561 = false;
    float _1591 = _1531;
    float _1593 = _971 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1595 = _971 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1597 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1593);
    float _1599 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1597);
    float _1601 = _971 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1603 = fma(_977, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1605 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1607 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1601);
    float _1609 = floor(_1603);
    float _1611 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1607);
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1615 = 1.0 / _1605;
    float _1617 = _1613 + _1605;
    float _1619 = -_1609;
    float _1621 = _1603 + _1619;
    float _1623 = _977 * (*spvDescriptorSet0.vp_c15)._m0[127].x;
    float _1625 = fma(_1595, (*spvDescriptorSet0.vp_c15)._m0[127].y, _1623);
    float _1627 = _1617 * _1615;
    float _1629 = _1627 * 0.5;
    float _1631 = _977 * (*spvDescriptorSet0.vp_c15)._m0[126].x;
    float _1633 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1625);
    float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1637 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1635);
    float _1639 = fma(_1595, (*spvDescriptorSet0.vp_c15)._m0[126].y, _1631);
    float _1641 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1643 = 1.0 / _1637;
    float _1645 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1647 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1639);
    float _1649 = _971 + _1645;
    float _1651 = _1647 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1653 = trunc(_1641);
    int _1655 = int(_1653);
    float _1657 = fma(_1649, (*spvDescriptorSet0.vp_c15)._m0[126].y, _1631);
    float _1659 = fma(_1649, (*spvDescriptorSet0.vp_c15)._m0[127].y, _1623);
    float _1661 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1657);
    float _1663 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1659);
    float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1667 = _1643 * _1665;
    float _1669 = _1661 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1671 = _1663 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1673 = trunc(_1651);
    int _1675 = int(_1673);
    bool _1677 = _1667 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1679 = _1667 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1681 = !_1677;
    int _1683 = _1681 ? 0 : 1;
    float _1685 = trunc(_1669);
    int _1687 = int(_1685);
    int _1689 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1691 = _1655 + _1689;
    int _1693 = _1691 + 1;
    int _1695 = 2;
    int _1697 = _1693;
    float _1699 = _1641;
    if (!_1677)
    {
        _1695 = 1;
    }
    int _1701 = _1695;
    float _1703 = trunc(_1671);
    int _1705 = int(_1703);
    int _1707 = _1701;
    if (!_1679)
    {
        _1707 = _1683;
    }
    int _1709 = _1707;
    int _1711 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1713 = _1675 + _1711;
    int _1715 = _1713 + 1;
    int _1717 = _1709 << 6;
    bool _1719 = _1715 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1721 = _1717 + 96;
    uint _1724 = uint(int(uint(_1721) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c15)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c15)._m0[int(_1734)][_1736];
    int _1740 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1742 = _1687 + _1740;
    int _1744 = _1742 + 1;
    int _1746 = _1715 | _1693;
    bool _1748 = _1744 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1750 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1752 = _1705 + _1750;
    int _1754 = _1752 + 1;
    int _1756 = _1717 + 104;
    uint _1758 = uint(int(uint(_1756) >> uint(2)));
    uint _1760 = uint(int(uint(int(_1758)) >> uint(2)));
    int _1762 = int(_1758) & 3;
    float _1764 = (*spvDescriptorSet0.vp_c15)._m0[int(_1760)][_1762];
    int _1766 = int(_1758) + 1;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    int _1770 = _1766 & 3;
    float _1772 = (*spvDescriptorSet0.vp_c15)._m0[int(_1768)][_1770];
    bool _1774 = _1746 < 0;
    bool _1776 = _1774 || _1719;
    int _1778 = _1744 | _1754;
    bool _1780 = _1693 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1782 = _1780 || _1776;
    bool _1784 = _1778 < 0;
    bool _1786 = _1784 || _1748;
    int _1788 = _1717 + 48;
    uint _1790 = uint(int(uint(_1788) >> uint(2)));
    uint _1792 = uint(int(uint(int(_1790)) >> uint(2)));
    int _1794 = int(_1790) & 3;
    float _1796 = (*spvDescriptorSet0.vp_c15)._m0[int(_1792)][_1794];
    int _1798 = int(_1790) + 1;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    int _1802 = _1798 & 3;
    float _1804 = (*spvDescriptorSet0.vp_c15)._m0[int(_1800)][_1802];
    bool _1806 = _1754 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1808 = _1806 || _1786;
    int _1810 = _1717 + 64;
    uint _1812 = uint(int(uint(_1810) >> uint(2)));
    uint _1814 = uint(int(uint(int(_1812)) >> uint(2)));
    int _1816 = int(_1812) & 3;
    float _1818 = (*spvDescriptorSet0.vp_c15)._m0[int(_1814)][_1816];
    int _1820 = int(_1812) + 1;
    uint _1822 = uint(int(uint(_1820) >> uint(2)));
    int _1824 = _1820 & 3;
    float _1826 = (*spvDescriptorSet0.vp_c15)._m0[int(_1822)][_1824];
    int _1828 = _1715;
    int _1830 = _1744;
    float _1832 = as_type<float>(_1709);
    if (!_1782)
    {
        int _1834 = _1693 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1836 = _1834 + _1715;
        _1828 = _1836;
    }
    int _1838 = _1828;
    if (!_1808)
    {
        int _1840 = _1754 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1842 = _1840 + _1744;
        _1830 = _1842;
    }
    int _1844 = _1830;
    int _1846 = _1717 + 56;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    uint _1850 = uint(int(uint(int(_1848)) >> uint(2)));
    int _1852 = int(_1848) & 3;
    float _1854 = (*spvDescriptorSet0.vp_c15)._m0[int(_1850)][_1852];
    int _1856 = int(_1848) + 1;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    int _1860 = _1856 & 3;
    float _1862 = (*spvDescriptorSet0.vp_c15)._m0[int(_1858)][_1860];
    float _1864 = 0.0;
    if (!_1808)
    {
        float _1866 = floor(_1671);
        _1864 = _1866;
    }
    float _1868 = _1864;
    if (!_1808)
    {
        int _1870 = _1844 << 2;
        _1403 = _1870;
    }
    int _1872 = _1403;
    int _1874 = _1872;
    if (!_1808)
    {
        uint _1876 = uint(int(uint(_1844) >> uint(2)));
        _1697 = int(_1876);
    }
    int _1878 = _1697;
    float _1880 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_1808)
    {
        int _1882 = 12 & _1872;
        _1874 = _1882;
    }
    int _1884 = _1874;
    int _1886 = _1717 + 72;
    uint _1888 = uint(int(uint(_1886) >> uint(2)));
    uint _1890 = uint(int(uint(int(_1888)) >> uint(2)));
    int _1892 = int(_1888) & 3;
    float _1894 = (*spvDescriptorSet0.vp_c15)._m0[int(_1890)][_1892];
    int _1896 = int(_1888) + 1;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    int _1900 = _1896 & 3;
    float _1902 = (*spvDescriptorSet0.vp_c15)._m0[int(_1898)][_1900];
    if (!_1808)
    {
        int _1904 = _1878 << 4;
        int _1906 = _1904 + _1884;
        _1405 = as_type<float>(_1906);
    }
    float _1908 = _1405;
    float _1910 = _1649 * _1738;
    float _1912 = _1908;
    int _1914 = as_type<int>(_1910);
    int _1916 = as_type<int>(_1730);
    if (!_1808)
    {
        int _1918 = as_type<int>(_1908) + 400;
        uint _1920 = uint(int(uint(_1918) >> uint(2)));
        uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
        int _1924 = int(_1920) & 3;
        float _1926 = (*spvDescriptorSet0.vp_c15)._m0[int(_1922)][_1924];
        _1912 = _1926;
    }
    float _1928 = _1912;
    float _1930 = fma(_977, _1730, _1910);
    if (!_1782)
    {
        int _1932 = _1838 << 2;
        _1914 = _1932;
    }
    int _1934 = _1914;
    float _1936 = _1868;
    int _1938 = _1934;
    if (!_1808)
    {
        float _1940 = -_1868;
        float _1942 = _1671 + _1940;
        _1936 = _1942;
    }
    float _1944 = _1936;
    if (!_1782)
    {
        uint _1946 = uint(int(uint(_1838) >> uint(2)));
        _1916 = int(_1946);
    }
    int _1948 = _1916;
    float _1950 = fma(_987, _1764, _1930);
    if (!_1782)
    {
        int _1952 = 12 & _1934;
        _1938 = _1952;
    }
    int _1954 = _1938;
    float _1956 = floor(_1880);
    float _1958 = _1950 + _1772;
    if (!_1782)
    {
        int _1960 = _1948 << 4;
        int _1962 = _1960 + _1954;
        _1407 = as_type<float>(_1962);
    }
    float _1964 = _1407;
    int _1966 = _1717 + 88;
    uint _1968 = uint(int(uint(_1966) >> uint(2)));
    uint _1970 = uint(int(uint(int(_1968)) >> uint(2)));
    int _1972 = int(_1968) & 3;
    float _1974 = (*spvDescriptorSet0.vp_c15)._m0[int(_1970)][_1972];
    int _1976 = int(_1968) + 1;
    uint _1978 = uint(int(uint(_1976) >> uint(2)));
    int _1980 = _1976 & 3;
    float _1982 = (*spvDescriptorSet0.vp_c15)._m0[int(_1978)][_1980];
    float _1984 = _1649 * _1804;
    float _1986 = 1.0 / _1958;
    float _1988 = fma(_977, _1796, _1984);
    int _1990 = _1717 + 80;
    uint _1992 = uint(int(uint(_1990) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c15)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c15)._m0[int(_2002)][_2004];
    float _2008 = _1649 * _1826;
    float _2010 = _1826;
    float _2012 = _2008;
    if (!_1782)
    {
        float _2014 = floor(_1651);
        _2010 = _2014;
    }
    float _2016 = _2010;
    float _2018 = -_1956;
    float _2020 = _1880 + _2018;
    float _2022 = fma(_977, _1818, _2008);
    float _2024 = _1964;
    if (!_1782)
    {
        int _2026 = as_type<int>(_1964) + 400;
        uint _2028 = uint(int(uint(_2026) >> uint(2)));
        uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
        int _2032 = int(_2028) & 3;
        float _2034 = (*spvDescriptorSet0.vp_c15)._m0[int(_2030)][_2032];
        _2024 = _2034;
    }
    float _2036 = _2024;
    float _2038 = fma(_987, _1854, _1988);
    float _2040 = _1854;
    if (!_1808)
    {
        float _2042 = floor(_1669);
        _2012 = _2042;
    }
    float _2044 = _2012;
    float _2046 = _2038 + _1862;
    float _2048 = _2046 * _1986;
    float _2050 = _1862;
    if (!_1782)
    {
        float _2052 = floor(_1641);
        _2050 = _2052;
    }
    float _2054 = _2050;
    float _2056 = fma(_987, _1894, _2022);
    float _2058 = _2016;
    if (!_1782)
    {
        float _2060 = -_2016;
        float _2062 = _1651 + _2060;
        _2058 = _2062;
    }
    float _2064 = _2058;
    bool _2066 = _2048 >= 0.0;
    float _2068 = _2056 + _1902;
    bool _2070 = _2048 <= 1.0;
    bool _2072 = _2070 && _2066;
    float _2074 = _2064;
    if (!_1808)
    {
        float _2076 = rint(_1928);
        float _2078 = precise::max(_2076, 0.0);
        uint _2080 = uint(_2078);
        uint _2082 = clamp(_2080, 0u, 65535u);
        _2040 = as_type<float>(_2082);
    }
    float _2084 = _2040;
    float _2086 = _2068 * _1986;
    bool _2088 = _2086 >= 0.0;
    bool _2090 = _2088 && _2072;
    float _2092 = _2054;
    float _2094 = _2086;
    if (!_1782)
    {
        float _2096 = -_2054;
        float _2098 = _1641 + _2096;
        _1699 = _2098;
    }
    float _2100 = _1699;
    if (!_1808)
    {
        float _2102 = -_2044;
        float _2104 = _1669 + _2102;
        _2092 = _2104;
    }
    float _2106 = _2092;
    bool _2108 = _2086 <= 1.0;
    bool _2110 = _2108 && _2090;
    float _2112 = _1649 * _2006;
    float _2114 = fma(_977, _1998, _2112);
    if (_2110)
    {
        float _2116 = float(_1709);
        _1832 = _2116;
    }
    float _2118 = _1832;
    float _2120 = _1818;
    if (!_1782)
    {
        float _2122 = rint(_2036);
        float _2124 = precise::max(_2122, 0.0);
        uint _2126 = uint(_2124);
        uint _2128 = clamp(_2126, 0u, 65535u);
        _2120 = as_type<float>(_2128);
    }
    float _2130 = _2120;
    float _2132 = fma(_987, _1974, _2114);
    float _2134 = fma(_977, 6.2500002968590706586837768554688e-05, 0.5);
    float _2136 = _2132 + _1982;
    float _2138 = fma(_987, 6.2500002968590706586837768554688e-05, 0.5);
    float _2140 = _2112;
    if (_2110)
    {
        float _2142 = rint(_2118);
        float _2144 = precise::max(_2142, 0.0);
        uint _2146 = uint(_2144);
        uint _2148 = clamp(_2146, 0u, 65535u);
        _2140 = as_type<float>(_2148);
    }
    float _2150 = _2140;
    float _2152 = _2136 * _1986;
    float2 _6727 = float2(_2134, _2138);
    float _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_6727, float2(0.0), isnan(_6727)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_6727, float2(0.0), isnan(_6727)), level(0.0)).x;
    float2 _6737 = float2(_1621, _2020);
    float _2156 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6737, float2(0.0), isnan(_6737)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6737, float2(0.0), isnan(_6737)), level(0.0)).x;
    float _2158 = _2130;
    if (!_1782)
    {
        float3 _6752 = float3(_2064, _2100, float(as_type<int>(_2130)));
        float3 _6756 = select(_6752, float3(0.0), isnan(_6752));
        float _2160 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6756.xy, uint(rint(_6756.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6756.xy, uint(rint(_6756.z)), level(0.0)).x;
        _2158 = _2160;
    }
    float _2162 = _2158;
    float _2164 = _2084;
    if (!_1808)
    {
        float3 _6772 = float3(_2106, _1944, float(as_type<int>(_2084)));
        float3 _6774 = select(_6772, float3(0.0), isnan(_6772));
        float _2166 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6774.xy, uint(rint(_6774.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6774.xy, uint(rint(_6774.z)), level(0.0)).x;
        _2164 = _2166;
    }
    float _2168 = _2164;
    float _2170 = _1651;
    if (_2110)
    {
        float3 _6789 = float3(_2048, _2086, float(as_type<int>(_2150)));
        float3 _6791 = select(_6789, float3(0.0), isnan(_6789));
        float _2172 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6791.xy, uint(rint(_6791.z)), _2152, level(0.0));
        _2170 = _2172;
    }
    float _2174 = _2170;
    float _2176 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2178 = _1463 + _2176;
    float _2180 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2182 = _1469 + _2180;
    bool _2184 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2186 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(0.5);
    bool _2192 = _2188 || _2190;
    float _2194 = fma(_2178, _1591, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2196 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2198 = _1471 + _2196;
    float _2200 = fma(_2182, _1591, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2202 = -_965;
    float _2204 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2194);
    float _2206 = fma(_2198, _1591, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2208 = -_967;
    float _2210 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2200);
    float _2212 = -_973;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2206);
    float _2216 = _2210;
    float _2218 = _2214;
    if (_2192)
    {
        _2094 = _2204;
    }
    float _2220 = _2094;
    float _2222 = _2220;
    if (!_2192)
    {
        float _2224 = _983 * _983;
        float _2226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2228 = -_657;
        float _2230 = _2228 + _2206;
        float _2232 = -_603;
        float _2234 = _2232 + _2194;
        float _2236 = fma(_991, _991, _2224);
        float _2238 = -_639;
        float _2240 = _2238 + _2200;
        float _2242 = fma(_999, _999, _2236);
        float _2244 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2246 = sqrt(_2242);
        float _2248 = 1.0 / _1195;
        float _2250 = _2244 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2252 = precise::min(_2246, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2254 = _2252 * _2226;
        float _2256 = _2254 * _2248;
        float _2258 = _2250 * _2256;
        float _2260 = _2230 * _2256;
        float _2262 = fma(_2234, _2258, _971);
        float _2264 = fma(_2240, _2258, _977);
        float _2266 = fma(_2250, _2260, _987);
        _2222 = _2262;
        _2216 = _2264;
        _2218 = _2266;
    }
    float _2268 = _2222;
    float _2270 = _2216;
    float _2272 = _2218;
    float _2274 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2276 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2278 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _2280 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2282 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan(0.5);
    bool _2288 = _2284 || _2286;
    float _2290 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2274);
    float _2292 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2276);
    float _2294 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2296 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2278);
    float _2298 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2290);
    float _2300 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2292);
    float _2302 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2294);
    float _2304 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2296);
    float _2306 = _2298 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2308 = _2300 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2310 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2302);
    float _2312 = _2304 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2314 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2316 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2318 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2320 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2322 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2314);
    float _2324 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2316);
    float _2326 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2318);
    float _2328 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2320);
    float _2330 = abs(_2154);
    bool _2332 = _2330 != 0.0;
    bool _2334 = isnan(_2330);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan(0.0);
    bool _2340 = _2336 || _2338;
    float _2342 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2322);
    float _2344 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2346 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2324);
    float _2348 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2326);
    float _2350 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2328);
    float _2352 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2342);
    float _2354 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2346);
    float _2356 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2348);
    float _2358 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2350);
    float _2360 = _2308;
    float _2362 = _2350;
    float _2364 = _2326;
    float _2366 = _2358;
    if (_2288)
    {
        _2360 = 1.0;
    }
    float _2368 = _2360;
    float _2370 = _2368;
    if (_2340)
    {
        _2074 = _2358;
    }
    float _2372 = _2074;
    float _2374 = _2372;
    if (!_2340)
    {
        _2374 = 0.0;
    }
    float _2376 = _2374;
    float _2378 = _2376;
    if (!_2288)
    {
        float _2380 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2382 = _2380 * 0.15915493667125701904296875;
        float _2384 = _2382 * 6.283185482025146484375;
        float _2386 = cos(_2384);
        float _2388 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2390 = _2388 * 0.15915493667125701904296875;
        float _2392 = _2382 * 6.283185482025146484375;
        float _2394 = sin(_2392);
        float _2396 = 1.0 / _2386;
        float _2398 = _2390 * 6.283185482025146484375;
        float _2400 = cos(_2398);
        float _2402 = _2394 * _2396;
        float _2404 = _2390 * 6.283185482025146484375;
        float _2406 = sin(_2404);
        float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2410 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2408;
        float _2412 = _2400 * _2402;
        float _2414 = 1.0 / _2410;
        float _2416 = 1.0 / _2412;
        float _2418 = _2406 * _2416;
        float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2422 = fma(_1667, _2418, _2420);
        float _2424 = _2422 * _2414;
        float _2426 = precise::clamp(_2424, 0.0, 1.0);
        _2362 = _2414;
        _1013 = _2390;
        _2364 = _2416;
        _2370 = _2426;
    }
    float _2428 = _2362;
    float _2430 = _1013;
    float _2432 = _2364;
    float _2434 = _2370;
    out.gl_Position.x = _2352;
    out.gl_Position.y = _2354;
    out.gl_Position.z = _2356;
    out.gl_Position.w = _2358;
    float _2436 = _2428;
    float _2438 = _2430;
    float _2440 = _2432;
    if (!_2340)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1782)
    {
        int _2442 = _1838 << 4;
        int _2444 = _2442 + 2048;
        uint _2446 = uint(int(uint(_2444) >> uint(2)));
        uint _2448 = uint(int(uint(int(_2446)) >> uint(2)));
        int _2450 = int(_2446) & 3;
        float _2452 = (*spvDescriptorSet0.vp_c15)._m0[int(_2448)][_2450];
        int _2454 = int(_2446) + 1;
        uint _2456 = uint(int(uint(_2454) >> uint(2)));
        int _2458 = _2454 & 3;
        float _2460 = (*spvDescriptorSet0.vp_c15)._m0[int(_2456)][_2458];
        int _2462 = _2444 + 8;
        uint _2464 = uint(int(uint(_2462) >> uint(2)));
        uint _2466 = uint(int(uint(int(_2464)) >> uint(2)));
        int _2468 = int(_2464) & 3;
        float _2470 = (*spvDescriptorSet0.vp_c15)._m0[int(_2466)][_2468];
        int _2472 = int(_2464) + 1;
        uint _2474 = uint(int(uint(_2472) >> uint(2)));
        int _2476 = _2472 & 3;
        float _2478 = (*spvDescriptorSet0.vp_c15)._m0[int(_2474)][_2476];
        float _2480 = _1595 * _2460;
        float _2482 = fma(_977, _2452, _2480);
        float _2484 = fma(_987, _2470, _2482);
        float _2486 = _2484 + _2478;
        float _2488 = precise::clamp(_2486, 0.0, 1.0);
        float _2490 = -_2488;
        float _2492 = _2490 + _2162;
        float _2494 = fma(_2492, 500.0, 1.5);
        float _2496 = exp2(_2494);
        float _2498 = 0.0 + _2496;
        float _2500 = precise::clamp(_2498, 0.0, 1.0);
        bool _2502 = _2500 >= 1.0;
        bool _2504 = isnan(_2500);
        bool _2506 = _2502 || _2504;
        bool _2508 = isnan(1.0);
        bool _2510 = _2506 || _2508;
        _2436 = _2452;
        _2438 = _2460;
        if (!_2510)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_2510)
        {
            _2378 = 0.0;
        }
    }
    float _2512 = _2436;
    float _2514 = _2438;
    float _2516 = _2378;
    float _2518 = _2514;
    float _2520 = _2512;
    if (_1808)
    {
        _2440 = 1.0;
    }
    float _2522 = _2440;
    float _2524 = _2522;
    if (!_1808)
    {
        int _2526 = _1844 << 4;
        int _2528 = _2526 + 2048;
        uint _2530 = uint(int(uint(_2528) >> uint(2)));
        uint _2532 = uint(int(uint(int(_2530)) >> uint(2)));
        int _2534 = int(_2530) & 3;
        float _2536 = (*spvDescriptorSet0.vp_c15)._m0[int(_2532)][_2534];
        int _2538 = int(_2530) + 1;
        uint _2540 = uint(int(uint(_2538) >> uint(2)));
        int _2542 = _2538 & 3;
        float _2544 = (*spvDescriptorSet0.vp_c15)._m0[int(_2540)][_2542];
        int _2546 = _2528 + 8;
        uint _2548 = uint(int(uint(_2546) >> uint(2)));
        uint _2550 = uint(int(uint(int(_2548)) >> uint(2)));
        int _2552 = int(_2548) & 3;
        float _2554 = (*spvDescriptorSet0.vp_c15)._m0[int(_2550)][_2552];
        int _2556 = int(_2548) + 1;
        uint _2558 = uint(int(uint(_2556) >> uint(2)));
        int _2560 = _2556 & 3;
        float _2562 = (*spvDescriptorSet0.vp_c15)._m0[int(_2558)][_2560];
        float _2564 = _1649 * _2544;
        float _2566 = fma(_977, _2536, _2564);
        float _2568 = fma(_987, _2554, _2566);
        float _2570 = _2568 + _2562;
        float _2572 = precise::clamp(_2570, 0.0, 1.0);
        float _2574 = -_2572;
        float _2576 = _2574 + _2168;
        float _2578 = fma(_2576, 500.0, 1.5);
        float _2580 = exp2(_2578);
        float _2582 = 0.0 + _2580;
        float _2584 = precise::clamp(_2582, 0.0, 1.0);
        _2518 = _2544;
        _2520 = _2536;
        _2524 = _2584;
    }
    float _2586 = _2518;
    float _2588 = _2520;
    float _2590 = _2524;
    float _2592 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2594 = _2268 + _2592;
    float _2596 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2598 = _2270 + _2596;
    float _2600 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2602 = _2272 + _2600;
    float _2604 = _2594 * _2594;
    float _2606 = fma(_2598, _2598, _2604);
    float _2608 = fma(_2602, _2602, _2606);
    float _2610 = rsqrt(_2608);
    float _2612 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2614 = _2598 * _2612;
    float _2616 = _2602 * _2612;
    float _2618 = _2614 * _2614;
    float _2620 = _2616 * _2616;
    float _2622 = _2618 + _2620;
    float _2624 = sqrt(_2622);
    bool _2626 = _2624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2630 = _2624 + _2628;
    float _2632 = _2602;
    float _2634 = _2622;
    float _2636 = _2630;
    float _2638 = _2586;
    float _2640 = _2588;
    float _2642 = _2594;
    float _2644 = _2614;
    if (_2626)
    {
        float _2646 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2632 = _2646;
    }
    float _2648 = _2632;
    if (_2626)
    {
        float _2650 = rsqrt(_2622);
        _2634 = _2650;
    }
    float _2652 = _2634;
    float _2654 = _2652;
    if (_2626)
    {
        float _2656 = _2630 * _2648;
        _2636 = _2656;
    }
    float _2658 = _2636;
    if (_2626)
    {
        float _2660 = _2658 * 0.15915493667125701904296875;
        _2638 = _2660;
    }
    float _2662 = _2638;
    float _2664 = _2648;
    if (_2626)
    {
        float _2666 = _2662 * 6.283185482025146484375;
        float _2668 = sin(_2666);
        _2664 = _2668;
    }
    float _2670 = _2664;
    float _2672 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2674 = precise::max(0.0, _2672);
    float _2676 = _2604;
    float _2678 = _2674;
    if (_2626)
    {
        float _2680 = _2662 * 6.283185482025146484375;
        float _2682 = cos(_2680);
        _2676 = _2682;
    }
    float _2684 = _2676;
    float _2686 = -_2612;
    float _2688 = -_2674;
    float _2690 = fma(_2594, _2686, _2688);
    if (_2626)
    {
        float _2692 = _2690 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2678 = _2692;
    }
    float _2694 = _2678;
    float _2696 = _2670;
    float _2698 = _2694;
    if (_2626)
    {
        float _2700 = fma(_2670, _2694, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2640 = _2700;
    }
    float _2702 = _2640;
    float _2704 = _2702;
    if (!_2626)
    {
        _2696 = _2690;
    }
    float _2706 = _2696;
    float _2708 = _2706;
    float _2710 = _2684;
    if (_2626)
    {
        float _2712 = _2684 + (-1.0);
        _2642 = _2712;
    }
    float _2714 = _2642;
    float _2716 = _2714;
    if (_2626)
    {
        float _2718 = _2652 * _2702;
        _2704 = _2718;
    }
    float _2720 = _2704;
    if (!_2626)
    {
        _2654 = _2618;
    }
    float _2722 = _2654;
    float _2724 = _2722;
    if (_2626)
    {
        float _2726 = _2714 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2698 = _2726;
    }
    float _2728 = _2698;
    if (_2626)
    {
        float _2730 = _2614 * _2720;
        _2644 = _2730;
    }
    float _2732 = _2644;
    if (!_2626)
    {
        _2716 = _2616;
    }
    float _2734 = _2716;
    float _2736 = _2734;
    if (_2626)
    {
        float _2738 = _2616 * _2720;
        _2736 = _2738;
    }
    float _2740 = _2736;
    if (_2626)
    {
        float _2742 = fma(_2690, _2684, _2728);
        _2708 = _2742;
    }
    float _2744 = _2708;
    if (_2626)
    {
        float _2746 = _2732 * _2732;
        _2724 = _2746;
    }
    float _2748 = _2724;
    float _2750 = sqrt(_2608);
    if (!_2626)
    {
        _2710 = _2620;
    }
    float _2752 = _2710;
    float _2754 = _2752;
    if (_2626)
    {
        float _2756 = _2740 * _2740;
        _2754 = _2756;
    }
    float _2758 = _2754;
    float _2760 = fma(_2744, _2744, _2748);
    float _2762 = _2760 + _2758;
    float _2764 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2766 = 1.0 / _2516;
    float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2770 = fma(_2750, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2768);
    float _2772 = precise::clamp(_2770, 0.0, 1.0);
    float _2774 = rsqrt(_2762);
    float _2776 = -_2772;
    float _2778 = _2776 + 1.0;
    float _2780 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2782 = -_2780;
    float _2784 = fma(_2782, _2764, 1.0);
    float _2786 = abs(_2778);
    float _2788 = log2(_2786);
    float _2790 = _2352 * _2766;
    float _2792 = fma(_2790, 0.5, 0.5);
    float _2794 = _2774 * _2732;
    float _2796 = _2774 * _2744;
    float _2798 = _2774 * _2740;
    float _2800 = log2(_2784);
    float _2802 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2804 = -_2802;
    float _2806 = fma(_2796, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2804);
    float _2808 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2810 = -_2798;
    float _2812 = fma(_2810, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2806);
    float _2814 = _2796 + 1.0;
    float _2816 = exp2(_2808);
    float _2818 = fma(_2812, -0.5, 0.5);
    float _2820 = fma(_2812, 0.5, 0.5);
    float _2822 = _2800 * 0.693147182464599609375;
    float _2824 = fma(_2820, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2826 = sqrt(_2818);
    float _2828 = fma(_2820, _2824, -0.212114393711090087890625);
    float _2830 = fma(_2820, _2828, 1.570728778839111328125);
    float _2832 = _2354 * _2766;
    float _2834 = -_2796;
    float _2836 = fma(_2816, _2814, _2834);
    float _2838 = _2822 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2840 = fma(_2832, -0.5, 0.5);
    float _2842 = fma(_2836, 0.5, 0.5);
    float _2844 = _2826 * 0.636619746685028076171875;
    float3 _7856 = float3(_2792, _2840, _2838);
    float _2846 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7856, float3(0.0), isnan(_7856)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7856, float3(0.0), isnan(_7856)), level(0.0)).x;
    float _2848 = -_2830;
    float _2850 = fma(_2844, _2848, 1.0);
    float3 _7870 = float3(_2792, _2840, _2838);
    float4 _2853 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7870, float3(0.0), isnan(_7870)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7870, float3(0.0), isnan(_7870)), level(0.0)).xyzw;
    float _2855 = _2853.x;
    float _2857 = _2853.y;
    float _2859 = _2853.z;
    float _2861 = _2853.w;
    float2 _7886 = float2(_2850, _2842);
    float3 _2865 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7886, float2(0.0), isnan(_7886)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7886, float2(0.0), isnan(_7886)), level(0.0)).xyz;
    float _2867 = _2865.x;
    float _2869 = _2865.y;
    float _2871 = _2865.z;
    float _2873 = abs(_1667);
    float _2875 = log2(_2873);
    float _2877 = _2358 * 0.5;
    float _2879 = _2356 + _2358;
    float _2881 = _2352 + _2358;
    float _2883 = -_2156;
    float _2885 = _2883 + 1.0;
    float _2887 = fma(_2354, -0.5, _2877);
    float _2889 = _2879 * 0.5;
    float _2891 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2893 = _1667 <= 8000.0;
    bool _2895 = isnan(_1667);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan(8000.0);
    bool _2901 = _2897 || _2899;
    float _2903 = float(_2901);
    float _2905 = _2881 * 0.5;
    float _2907 = _2788;
    if (!_2110)
    {
        _2907 = 1.0;
    }
    float _2909 = _2907;
    float _2911 = _2909;
    if (_2110)
    {
        bool _2913 = _2174 >= _2152;
        bool _2915 = isnan(_2174);
        bool _2917 = _2913 || _2915;
        bool _2919 = isnan(_2152);
        bool _2921 = _2917 || _2919;
        float _2923 = float(_2921);
        _2911 = _2923;
    }
    float _2925 = _2911;
    float _2927 = exp2(_2891);
    float _2929 = _2875 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_84.x = _2905;
    out.m_84.y = _2887;
    out.m_84.z = _2889;
    out.m_84.w = _2358;
    bool _2931 = _2750 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2933 = isnan(_2750);
    bool _2935 = _2931 || _2933;
    bool _2937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2939 = _2935 || _2937;
    float _2941 = _2925 * _2590;
    float _2943 = exp2(_2929);
    if (!_2939)
    {
        _2366 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2945 = _2366;
    float _2947 = fma(_2943, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2949 = precise::clamp(_2947, 0.0, 1.0);
    float _2951 = fma(_2949, -2.0, 3.0);
    float _2953 = _2949 * _2949;
    float _2955 = _2953 * _2951;
    float _2957 = -_2955;
    float _2959 = _2957 + 1.0;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2955);
    float _2963 = _2903 * _2961;
    float _2965 = _2963 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2967 = -_2927;
    float _2969 = _2967 + 1.0;
    float _2971 = _2885 * _2965;
    float _2973 = precise::clamp(_2971, 0.0, 1.0);
    float _2975 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2977 = _2965;
    float _2979 = _2945;
    float _2981 = _2945;
    if (!_2939)
    {
        _2977 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2983 = _2977;
    float _2985 = -_2973;
    float _2987 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2989 = _2434 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2991 = -_2941;
    float _2993 = fma(_2991, _2987, 1.0);
    float _2995 = precise::clamp(_2993, 0.0, 1.0);
    float _2997 = _2987;
    float _2999 = _2995;
    float _3001 = _2983;
    float _3003 = _2983;
    if (!_2939)
    {
        _2997 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3005 = _2997;
    float _3007 = _2995 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3009 = _3005;
    float _3011 = _3005;
    if (!_2939)
    {
        _2999 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3013 = _2999;
    out.m_86.x = _3007;
    float _3015 = _2975 * _2846;
    float _3017 = -_2975;
    float _3019 = _3017 + 1.0;
    float _3021 = _2861 * _3015;
    float _3023 = _2861 * _3019;
    float _3025 = _3019;
    float _3027 = _3015;
    float _3029 = _3013;
    float _3031 = _3013;
    if (!_2939)
    {
        _3025 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3033 = _3025;
    float _3035 = _2871 * _3015;
    float _3037 = fma(_2867, _3021, _2855);
    float _3039 = fma(_2869, _3021, _2857);
    float _3041 = _3033;
    float _3043 = _3033;
    if (!_2939)
    {
        _3027 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3045 = _3027;
    float _3047 = fma(_2861, _3035, _2859);
    out.m_88.x = _3037;
    out.m_88.y = _3039;
    out.m_88.z = _3047;
    out.m_88.w = _3023;
    bool _3049 = !_2939;
    float _3051 = _3045;
    float _3053 = _3045;
    if (!_3049)
    {
        bool _3055 = _2750 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3057 = isnan(_2750);
        bool _3059 = _3055 || _3057;
        bool _3061 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3063 = _3059 || _3061;
        if (!_3063)
        {
            float _3065 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3067 = _2750 + _3065;
            float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3071 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3069;
            float _3073 = 1.0 / _3071;
            float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3079 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3081 = _3079 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3085 = _3083 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3087 = _3067 * _3073;
            float _3089 = precise::clamp(_3087, 0.0, 1.0);
            float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3093 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3095 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3097 = _3095 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3099 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3101 = _3099 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3103 = fma(_3089, _3085, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _3105 = fma(_3089, _3093, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3107 = fma(_3089, _3097, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3109 = fma(_3089, _3101, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3111 = fma(_3089, _3077, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3113 = fma(_3089, _3081, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            _3003 = _3107;
            _3011 = _3113;
            _2981 = _3105;
            _3043 = _3111;
            _3053 = _3109;
            _3031 = _3103;
            _3115 = true;
        }
        else
        {
            bool _3117 = _2750 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3119 = isnan(_2750);
            bool _3121 = _3117 || _3119;
            bool _3123 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3125 = _3121 || _3123;
            if (!_3125)
            {
                _2979 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3127 = _2979;
            _2981 = _3127;
            if (!_3125)
            {
                _3001 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3129 = _3001;
            _3003 = _3129;
            if (!_3125)
            {
                _3051 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3131 = _3051;
            _3053 = _3131;
            if (!_3125)
            {
                _3041 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3133 = _3041;
            _3043 = _3133;
            if (!_3125)
            {
                _3009 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3135 = _3009;
            _3011 = _3135;
            if (!_3125)
            {
                _3029 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3137 = _3029;
            bool _3139 = !_3125;
            _3031 = _3137;
            if (!_3139)
            {
                bool _3141 = _2750 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3143 = isnan(_2750);
                bool _3145 = _3141 || _3143;
                bool _3147 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3149 = _3145 || _3147;
                if (!_3149)
                {
                    float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3153 = _2750 + _3151;
                    float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3157 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3155;
                    float _3159 = 1.0 / _3157;
                    float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3165 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3167 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3169 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3173 = _3153 * _3159;
                    float _3175 = precise::clamp(_3173, 0.0, 1.0);
                    float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3181 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3187 = _3185 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3189 = fma(_3175, _3171, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _3191 = fma(_3175, _3179, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3193 = fma(_3175, _3183, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3195 = fma(_3175, _3187, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3197 = fma(_3175, _3163, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3199 = fma(_3175, _3167, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    _3003 = _3193;
                    _3011 = _3199;
                    _2981 = _3191;
                    _3043 = _3197;
                    _3053 = _3195;
                    _3031 = _3189;
                    _3115 = true;
                }
                else
                {
                    _3003 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3011 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2981 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3043 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3053 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3031 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3115 = false;
    float _3201 = _3003;
    float _3203 = _3011;
    float _3205 = _2981;
    float _3207 = _3043;
    float _3209 = _3053;
    float _3211 = _3031;
    float _3213 = _2989 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3215 = fma(_1513, -0.5, 0.5);
    float _3217 = precise::clamp(_3215, 0.0, 1.0);
    float _3219 = -_3201;
    float _3221 = _3219 + _3203;
    float _3223 = -_3205;
    float _3225 = _3223 + _3207;
    out.m_90.x = 0.0;
    float _3227 = -_3209;
    float _3229 = _3227 + _3211;
    float _3231 = fma(_3217, _3221, _3201);
    float _3233 = fma(_3217, _3225, _3205);
    bool _3235 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3237 = _3231 * 0.586610972881317138671875;
    float _3239 = fma(_3217, _3229, _3209);
    out.m_63.x = _3213;
    bool _3241 = _2434 > 0.0;
    bool _3243 = isnan(_2434);
    bool _3245 = _3241 || _3243;
    bool _3247 = isnan(0.0);
    bool _3249 = _3245 || _3247;
    float _3251 = fma(_3233, 0.298911988735198974609375, _3237);
    float _3253 = fma(_3239, 0.114477999508380889892578125, _3251);
    float _3255 = -_3253;
    float _3257 = _3233 + _3255;
    float _3259 = -_3253;
    float _3261 = _3231 + _3259;
    float _3263 = -_3253;
    float _3265 = _3239 + _3263;
    float _3267 = fma(_3257, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3253);
    float _3269 = fma(_3261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3253);
    float _3271 = fma(_3265, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3253);
    bool _3273 = !_3235;
    if (!_3273)
    {
        float _3275 = -_2268;
        float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3279 = -_2270;
        float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3283 = -_2272;
        float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3287 = _3277 * _3277;
        float _3289 = fma(_3281, _3281, _3287);
        float _3291 = fma(_3285, _3285, _3289);
        float _3293 = sqrt(_3291);
        float _3295 = rsqrt(_3291);
        float _3297 = -_3293;
        float _3299 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3301 = _3299 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3303 = precise::clamp(_3301, 0.0, 1.0);
        float _3305 = _3281 * _3295;
        float _3307 = _3277 * _3295;
        float _3309 = abs(_3303);
        float _3311 = log2(_3309);
        float _3313 = _3285 * _3295;
        float _3315 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3317 = _1513 * _3307;
        float _3319 = -_3307;
        float _3321 = -_3315;
        float _3323 = fma(_3319, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3321);
        float _3325 = fma(_1511, _3305, _3317);
        float _3327 = -_3313;
        float _3329 = fma(_3327, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3323);
        float _3331 = fma(_1515, _3313, _3325);
        float _3333 = precise::clamp(_3331, 0.0, 1.0);
        float _3335 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3337 = _3329 + _3335;
        float _3339 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3341 = _3337 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3343 = precise::clamp(_3341, 0.0, 1.0);
        float _3345 = exp2(_3339);
        float _3347 = _3345 * _3343;
        float _3349 = _3333 * _3347;
        float _3351 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3353 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3355 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3351;
        out.m_90.y = _3353;
        out.m_90.z = _3355;
    }
    out.m_92.x = _3267;
    out.m_92.y = _3269;
    out.m_92.z = _3271;
    if (_3249)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _3357 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3357;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3115 = false;
    bool _1561 = false;
    bool _421 = false;
    bool _309 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_60.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_63.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3414 = as_type<float>(_127);
        out.gl_Position.z = _3414;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_65.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_63.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3483 = as_type<float>(_165);
        out.gl_Position.z = _3483;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _205;
    if (!_187)
    {
        float _189 = in.m_70.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        float _209 = float(_111);
        float _211 = 1.0 / _209;
        float _213 = _145 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_70.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_111);
        float _313 = 1.0 / _311;
        float _315 = _145 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    bool _319 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _321 = isnan(_317);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _335 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _337 = isnan(_317);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _317 + _351;
    float _355 = -_329;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _361 = 1.0 / _333;
    float _363 = _345 * _357;
    float _365 = -_345;
    float _367 = _365 + 1.0;
    float _369 = _349 * _361;
    float _371 = fma(_369, _353, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _373 = _371 * _363;
    float _375 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[115].x, _373);
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _383 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[116].x, _375);
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = _383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _393 = in.m_72.x;
    float _395 = in.m_72.y;
    out.m_74.x = _385;
    out.m_74.y = _387;
    out.m_74.z = _389;
    out.m_74.w = _391;
    float _397 = _287 * _395;
    float _399 = _285 * _393;
    bool _401 = !_359;
    float _419;
    if (!_401)
    {
        float _403 = in.m_70.x;
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _407 = _403 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _409 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _411 = _409 * _405;
        float _413 = floor(_411);
        float _415 = -_413;
        float _417 = _411 + _415;
        _419 = _417;
        _421 = true;
    }
    else
    {
        float _423 = float(_111);
        float _425 = 1.0 / _423;
        float _427 = _145 * _425;
        _419 = _427;
    }
    _421 = false;
    float _429 = _419;
    float _431 = in.m_70.x;
    float _433 = in.m_70.y;
    float _435 = in.m_70.z;
    float _437 = in.m_70.w;
    float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _441 = in.m_60.x;
    float _443 = in.m_60.y;
    float _445 = in.m_60.z;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _453 = _451 != 0;
    int _455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _457 = _455 != 0;
    float _459 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _463 = _461 != 0;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _467 = _465 != 0;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _475 = 1.0 / _471;
    float _477 = _435 * 2.0;
    bool _479 = _437 > 0.5;
    float _481 = _431 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _483 = _433 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _485 = _431 > 0.5;
    float _487 = floor(_477);
    float _489 = -_185;
    int _491 = _479 ? as_type<int>(_489) : as_type<int>(_185);
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _495 = _433 > 0.5;
    float _497 = _431 * 2.0;
    float _499 = -_181;
    int _501 = _485 ? as_type<int>(_499) : as_type<int>(_181);
    float _503 = -_493;
    float _505 = fma(_481, 2.0, _503);
    float _507 = -_185;
    int _509 = _495 ? as_type<int>(_507) : as_type<int>(_185);
    float _511 = fma(_483, -2.0, _473);
    bool _513 = !_449;
    float _515 = _513 ? _181 : as_type<float>(_501);
    float _517 = _443 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _521 = _519 != 0;
    int _523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _525 = _523 != 0;
    int _527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _529 = _527 != 0;
    float _531 = _443 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _533 = _443 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _535;
    float _539 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _517);
    float _541 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _531);
    float _543 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _533);
    float _545 = _433 + _435;
    float _547 = _537 * _475;
    float _549 = floor(_497);
    float _551 = _433 * 2.0;
    bool _553 = !_453;
    float _555 = _553 ? _185 : as_type<float>(_509);
    float _557 = _545 + (-1.0);
    bool _559 = _435 > 0.5;
    float _561 = _433 + _431;
    float _563 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
    float _565 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _567 = floor(_551);
    float _569 = -_181;
    int _571 = _559 ? as_type<int>(_569) : as_type<int>(_181);
    float _573 = _561 + (-1.0);
    bool _575 = _487 > 0.0;
    float _577 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].z, _541);
    bool _579 = !_457;
    float _581 = _579 ? _181 : as_type<float>(_571);
    float _583 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].z, _543);
    bool _585 = _487 >= 0.0;
    bool _587 = isnan(_487);
    bool _589 = _585 || _587;
    bool _591 = isnan(0.0);
    bool _593 = _589 || _591;
    float _595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _599 = _429 + _597;
    int _601 = _593 ? 0 : 1;
    float _603 = _577 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _605 = _549 >= 0.0;
    bool _607 = isnan(_549);
    bool _609 = _605 || _607;
    bool _611 = isnan(0.0);
    bool _613 = _609 || _611;
    float _615 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _617 = ~_601;
    int _619 = _617 + 1;
    int _621 = _619 + 1;
    float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _625 = _621;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _629 = _487;
    float _631 = _573;
    if (!_575)
    {
        int _633 = ~_601;
        int _635 = _633 + 1;
        _625 = _635;
    }
    int _637 = _625;
    float _639 = _563 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _641 = _613 ? 0 : 1;
    float _643 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _645 = _603 + _643;
    if (!_467)
    {
        _627 = _433;
    }
    float _647 = _627;
    float _649 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _651 = _639 + _649;
    float _653 = _647;
    if (!_467)
    {
        _629 = _435;
    }
    float _655 = _629;
    float _657 = _583 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _659 = _655;
    if (!_467)
    {
        _631 = _435;
    }
    float _661 = _631;
    bool _663 = _567 > 0.0;
    float _665 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _667 = _657 + _665;
    bool _669 = _567 >= 0.0;
    bool _671 = isnan(_567);
    bool _673 = _669 || _671;
    bool _675 = isnan(0.0);
    bool _677 = _673 || _675;
    float _679 = _595 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _681 = _661;
    if (_467)
    {
        _653 = _431;
    }
    float _683 = _653;
    float _685 = -_145;
    float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[76].x, _505);
    if (_467)
    {
        _659 = _433;
    }
    float _689 = _659;
    float _691 = _515 + 0.5;
    if (_467)
    {
        _681 = _433;
    }
    float _693 = _681;
    bool _695 = _549 > 0.0;
    float _697 = fma(_547, _599, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _699 = fma(_679, _691, _687);
    bool _701 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _703 = isnan(_429);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = _555 + (-0.5);
    bool _715 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _717 = isnan(_429);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _729 = _623 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _731 = -_711;
    float _733 = _731 + 1.0;
    float _735 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[83].w, _727);
    float _737 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _511);
    float _739 = _725 * _733;
    float _741 = -_725;
    float _743 = _741 + 1.0;
    float _745 = -_729;
    float _747 = -_737;
    float _749 = fma(_745, _713, _747);
    float _751 = _683 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _753 = _697 * _739;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _759 = _689 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _761 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[131].x, _753);
    float _763 = -_755;
    float _765 = fma(_751, 2.0, _763);
    float _767 = _439 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _769 = _581 + 0.5;
    float _771 = -_145;
    float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[81].x, _765);
    bool _775 = !_463;
    float _777 = _775 ? _185 : as_type<float>(_491);
    float _779 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[83].z, _757);
    float _781 = _459 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _783 = fma(_767, _769, _773);
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _787 = !_521;
    int _789 = _787 ? 0 : 1;
    float _791 = _777 + (-0.5);
    float _793 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _735);
    float _795 = fma(_759, -2.0, _785);
    int _797 = abs(_789);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _801 = _645 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _803 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _795);
    float _805 = -_793;
    float _807 = _805 + 1.0;
    float _809 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[28].x, _801);
    float _811 = -_781;
    float _813 = -_803;
    float _815 = fma(_811, _791, _813);
    float _817 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[132].x, _761);
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _821 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[28].z, _809);
    float _823 = float(_797);
    float _825 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _827 = log2(_825);
    float _829 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[78].z, _819);
    float _831 = float(_637);
    float _833 = fma(_777, _807, _815);
    float _835 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[78].w, _799);
    float _837 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _829);
    float _839 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _779);
    float _841 = _645 * _645;
    float _843 = _823 * _831;
    float _845 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _835);
    bool _847 = _821 >= 0.0;
    float _849 = -_837;
    float _851 = _849 + 1.0;
    float _853 = -_839;
    float _855 = _853 + 1.0;
    float _857 = fma(_651, _651, _841);
    float _859 = -_845;
    float _861 = _859 + 1.0;
    float _863 = _827 * _145;
    float _865 = -_855;
    float _867 = fma(_581, _865, _783);
    float _869 = fma(_667, _667, _857);
    float _871 = -_851;
    float _873 = fma(_515, _871, _699);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _877 = in.m_76.x;
    float _879 = in.m_76.y;
    float _881 = in.m_76.z;
    float _883 = fma(_555, _861, _749);
    float _885 = exp2(_863);
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _889 = 1.0 + _887;
    float _891 = _749;
    if (_847)
    {
        _891 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _893 = _891;
    float _895 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _897 = _875 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _901 = _817 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _903 = rsqrt(_869);
    float _905 = _895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _907 = _899 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _909 = as_type<int>(_893);
    if (_847)
    {
        float _911 = _893 * 5.0;
        _909 = as_type<int>(_911);
    }
    int _913 = _909;
    bool _915 = !_525;
    int _917 = _915 ? 0 : 1;
    out.m_78.x = _873;
    out.m_78.y = _883;
    out.m_78.z = _867;
    out.m_78.w = _833;
    int _919 = ~_641;
    int _921 = _919 + 1;
    int _923 = _921 + 1;
    float _925 = 1.0 / _889;
    int _927 = abs(_917);
    out.m_80.x = _897;
    out.m_80.y = _905;
    out.m_80.z = _907;
    out.m_80.w = _901;
    int _929 = _923;
    if (!_695)
    {
        int _931 = ~_641;
        int _933 = _931 + 1;
        _929 = _933;
    }
    int _935 = _929;
    bool _937 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _939 = isnan(0.0);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _945 = _941 || _943;
    if (_847)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4755 = as_type<float>(_913);
        out.gl_Position.z = _4755;
    }
    bool _947 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _949 = isnan(1.0);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _955 = _951 || _953;
    if (_847)
    {
        out.m_63.x = 0.0;
    }
    float _957 = -_885;
    float _959 = _957 + 1.0;
    bool _961 = !_529;
    int _963 = _961 ? 0 : 1;
    float _965 = _645 * _903;
    float _967 = _651 * _903;
    if (_847)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _969 = -_965;
    float _971 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[18].w, _603);
    float _973 = _667 * _903;
    float _975 = -_967;
    float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _979 = float(_927);
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _983 = _971 + _981;
    float _985 = -_973;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[18].w, _657);
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _991 = _977 + _989;
    float _993 = float(_935);
    float _995 = _983 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _999 = _987 + _997;
    float _1001 = _945 ? _959 : 0.0;
    float _1003 = _843 * (-2.0);
    float _1005 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[28].x, _995);
    float _1007 = _979 * _993;
    float _1009 = _431 + (-0.5);
    float _1011 = _1003;
    float _1013 = _983;
    if (_955)
    {
        float _1015 = _1001 * _925;
        _149 = _1015;
    }
    float _1017 = _149;
    float _1019 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1005);
    float _1021 = fma(_1003, _877, _877);
    float _1023 = fma(_615, _1003, _615);
    float _1025 = _1007 * (-2.0);
    int _1027 = _677 ? 0 : 1;
    float _1029 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1021);
    bool _1031 = _1019 >= 0.0;
    float _1033 = fma(_1025, _879, _879);
    int _1035 = abs(_963);
    float _1037 = fma(_1023, _1017, _1029);
    int _1039 = ~_1027;
    int _1041 = _1039 + 1;
    int _1043 = _1041 + 1;
    float _1045 = fma(_565, _1025, _565);
    float _1047 = _1037 * 0.15915493667125701904296875;
    int _1049 = _1043;
    if (!_663)
    {
        int _1051 = ~_1027;
        int _1053 = _1051 + 1;
        _1049 = _1053;
    }
    int _1055 = _1049;
    float _1057 = _433 + (-0.5);
    float _1059 = float(_1035);
    float _1061 = _1047 * 6.283185482025146484375;
    float _1063 = sin(_1061);
    float _1065 = float(_1055);
    float _1067 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1033);
    int _1069 = _1055;
    if (_1031)
    {
        _1011 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1071 = _1011;
    if (_1031)
    {
        out.m_63.x = 0.0;
    }
    float _1073 = _1059 * _1065;
    float _1075 = fma(_1045, _1017, _1067);
    if (_1031)
    {
        float _1077 = _1071 * 5.0;
        _1069 = as_type<int>(_1077);
    }
    int _1079 = _1069;
    float _1081 = _1047 * 6.283185482025146484375;
    float _1083 = cos(_1081);
    if (_1031)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4978 = as_type<float>(_1079);
        out.gl_Position.z = _4978;
    }
    if (_1031)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1085 = -_603;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1089 = -_639;
    float _1091 = _1089 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1093 = _1075 * 0.15915493667125701904296875;
    float _1095 = -_657;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = _1087 * _1087;
    float _1101 = -_965;
    float _1103 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[18].w, _645);
    float _1105 = _1073 * (-2.0);
    float _1107 = -_967;
    float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _651);
    float _1111 = fma(_1091, _1091, _1099);
    float _1113 = _1103 * _1103;
    float _1115 = _435 + _431;
    float _1117 = -_973;
    float _1119 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[18].w, _667);
    float _1121 = fma(_1097, _1097, _1111);
    float _1123 = fma(_1109, _1109, _1113);
    float _1125 = _1115 + (-1.0);
    float _1127 = _435 + (-0.5);
    float _1129 = fma(_1105, _881, _881);
    float _1131 = fma(_1119, _1119, _1123);
    float _1133 = rsqrt(_1121);
    float _1135 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1137 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1129);
    float _1139 = fma(_1135, _1105, _1135);
    float _1141 = sqrt(_1131);
    float _1143 = fma(_1139, _1017, _1137);
    float _1145 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _1149 = _1143 * 0.15915493667125701904296875;
    float _1151 = _1091 * _1133;
    float _1153 = _1097 * _1133;
    float _1155 = _1087 * _1133;
    float _1157 = _1093 * 6.283185482025146484375;
    float _1159 = sin(_1157);
    float _1161 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1163 = _1151 * _1161;
    float _1165 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1167 = _1153 * _1165;
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1171 = _1155 * _1169;
    float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1175 = -_1163;
    float _1177 = fma(_1153, _1173, _1175);
    float _1179 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1181 = -_1167;
    float _1183 = fma(_1155, _1179, _1181);
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1187 = -_1171;
    float _1189 = fma(_1151, _1185, _1187);
    float _1191 = _1093 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = _903 * _1141;
    float _1197 = _1195 * _1145;
    float _1199 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1201 = _1199 * 0.5;
    float _1203 = _1149 * 6.283185482025146484375;
    float _1205 = sin(_1203);
    float _1207 = _1177 * _1177;
    float _1209 = _1063 * _1159;
    float _1211 = fma(_1183, _1183, _1207);
    float _1213 = _1083 * _1159;
    float _1215 = _1149 * 6.283185482025146484375;
    float _1217 = cos(_1215);
    float _1219 = fma(_1189, _1189, _1211);
    float _1221 = _1083 * _1193;
    float _1223 = rsqrt(_1219);
    float _1225 = fma(_1205, _1221, _1209);
    float _1227 = fma(_1205, _1209, _1221);
    float _1229 = _1063 * _1193;
    float _1231 = _1083 * _1217;
    float _1233 = _1193 * _1217;
    float _1235 = _1063 * _1217;
    float _1237 = _1159 * _1217;
    float _1239 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1241 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1243 = -_1229;
    float _1245 = fma(_1205, _1213, _1243);
    float _1247 = _1195 * _1239;
    float _1249 = _1241 * _1197;
    float _1251 = -_1213;
    float _1253 = fma(_1205, _1229, _1251);
    float _1255 = _1183 * _1223;
    float _1257 = _1147 * _1247;
    float _1259 = _1177 * _1223;
    float _1261 = _1231 * _1249;
    float _1263 = _1189 * _1223;
    float _1265 = -_1249;
    float _1267 = _1205 * _1265;
    float _1269 = _1153 * _1259;
    float _1271 = fma(_1225, _1257, _1261);
    float _1273 = _1155 * _1255;
    float _1275 = _1235 * _1249;
    float _1277 = fma(_1233, _1257, _1267);
    float _1279 = fma(_1245, _1201, _1271);
    float _1281 = -_1269;
    float _1283 = fma(_1155, _1263, _1281);
    float _1285 = -_1273;
    float _1287 = fma(_1151, _1259, _1285);
    float _1289 = fma(_1253, _1257, _1275);
    float _1291 = fma(_1237, _1201, _1277);
    float _1293 = _1283 * _1279;
    float _1295 = _1287 * _1279;
    float _1297 = fma(_1227, _1201, _1289);
    float _1299 = _1151 * _1263;
    float _1301 = fma(_1255, _1291, _1293);
    float _1303 = fma(_1263, _1291, _1295);
    float _1305 = _1231 * _1283;
    float _1307 = -_1299;
    float _1309 = fma(_1153, _1255, _1307);
    float _1311 = fma(_1151, _1297, _1301);
    float _1313 = fma(_1153, _1297, _1303);
    float _1315 = _1231 * _1287;
    float _1317 = _1309 * _1279;
    float _1319 = _639 + _1311;
    float _1321 = _657 + _1313;
    float _1323 = _1231 * _1309;
    float _1325 = _1225 * _1283;
    float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1329 = _1319 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1333 = _1321 + _1331;
    float _1335 = _1225 * _1309;
    float _1337 = _1225 * _1287;
    float _1339 = _1329 * _1329;
    float _1341 = _1333 * _1333;
    float _1343 = _1245 * _1287;
    float _1345 = fma(_1259, _1291, _1317);
    float _1347 = _1245 * _1283;
    float _1349 = _1339 + _1341;
    float _1351 = _1245 * _1309;
    float _1353 = fma(_1155, _1297, _1345);
    float _1355 = -_1205;
    float _1357 = fma(_1355, _1255, _1305);
    float _1359 = sqrt(_1349);
    float _1361 = -_1205;
    float _1363 = fma(_1361, _1259, _1323);
    float _1365 = -_1205;
    float _1367 = fma(_1365, _1263, _1315);
    float _1369 = _603 + _1353;
    float _1371 = fma(_1233, _1255, _1325);
    float _1373 = fma(_1233, _1259, _1335);
    float _1375 = fma(_1233, _1263, _1337);
    float _1377 = fma(_1237, _1255, _1347);
    float _1379 = fma(_1237, _1259, _1351);
    float _1381 = fma(_1235, _1151, _1357);
    float _1383 = fma(_1235, _1155, _1363);
    float _1385 = fma(_1237, _1263, _1343);
    float _1387 = fma(_1235, _1153, _1367);
    bool _1389 = _1359 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1391 = _1255;
    float _1393 = _1339;
    float _1395 = _1341;
    float _1397 = _1319;
    float _1399 = _1321;
    float _1401 = _1383;
    int _1403 = as_type<int>(_1347);
    float _1405 = _1343;
    float _1407 = _1305;
    if (!_1389)
    {
        _1391 = _1369;
    }
    float _1409 = _1391;
    bool _1411 = !_1389;
    float _1413 = _1409;
    if (!_1411)
    {
        float _1415 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1419 = _1359 + _1417;
        float _1421 = rsqrt(_1349);
        float _1423 = _1419 * _1415;
        float _1425 = _1369 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1427 = _1423 * 0.15915493667125701904296875;
        float _1429 = _1427 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        float _1433 = _1427 * 6.283185482025146484375;
        float _1435 = cos(_1433);
        float _1437 = fma(_1431, _1425, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1439 = _1421 * _1437;
        float _1441 = _1435 + (-1.0);
        float _1443 = fma(_1329, _1439, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1445 = fma(_1333, _1439, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1447 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1451 = _1443 + _1449;
        float _1453 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1455 = _1445 + _1453;
        float _1457 = fma(_1369, _1435, _1447);
        float _1459 = _1451 * _1451;
        float _1461 = _1455 * _1455;
        _1413 = _1457;
        _1393 = _1459;
        _1395 = _1461;
        _1397 = _1443;
        _1399 = _1445;
    }
    float _1463 = _1413;
    float _1465 = _1393;
    float _1467 = _1395;
    float _1469 = _1397;
    float _1471 = _1399;
    float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1475 = _1463 + _1473;
    float _1477 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1479 = fma(_1253, _1151, _1371);
    float _1481 = fma(_1227, _1151, _1377);
    float _1483 = fma(_1475, _1475, _1465);
    float _1485 = fma(_1227, _1155, _1379);
    float _1487 = fma(_1227, _1153, _1385);
    float _1489 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1491 = _1483 + _1467;
    float _1493 = _1477 * _1381;
    float _1495 = fma(_1253, _1155, _1373);
    float _1497 = fma(_1253, _1153, _1375);
    float _1499 = _1477 * _1383;
    float _1501 = _1477 * _1387;
    float _1503 = sqrt(_1491);
    float _1505 = fma(_1489, _1479, _1493);
    float _1507 = fma(_1489, _1495, _1499);
    float _1509 = fma(_1489, _1497, _1501);
    float _1511 = _1481 + _1505;
    float _1513 = _1485 + _1507;
    float _1515 = _1487 + _1509;
    out.m_82.x = _1511;
    out.m_82.y = _1513;
    out.m_82.z = _1515;
    bool _1517 = _1503 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1519 = isnan(_1503);
    bool _1521 = _1517 || _1519;
    bool _1523 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1525 = _1521 || _1523;
    if (!_1525)
    {
        _1401 = 1.0;
    }
    float _1527 = _1401;
    bool _1529 = !_1525;
    float _1531 = _1527;
    if (!_1529)
    {
        bool _1533 = _1503 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1535 = isnan(_1503);
        bool _1537 = _1533 || _1535;
        bool _1539 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1541 = _1537 || _1539;
        if (!_1541)
        {
            float _1543 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1545 = _1503 + _1543;
            float _1547 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1549 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1547;
            float _1551 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1553 = _1551 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1555 = 1.0 / _1549;
            float _1557 = _1545 * _1555;
            float _1559 = fma(_1557, _1553, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1531 = _1559;
            _1561 = true;
        }
        else
        {
            bool _1563 = _1503 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1565 = isnan(_1503);
            bool _1567 = _1563 || _1565;
            bool _1569 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1571 = _1567 || _1569;
            if (!_1571)
            {
                float _1573 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1575 = _1503 + _1573;
                float _1577 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1579 = _1577 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1581 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1583 = _1581 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1585 = 1.0 / _1579;
                float _1587 = _1575 * _1585;
                float _1589 = fma(_1587, _1583, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1531 = _1589;
                _1561 = true;
            }
            else
            {
                _1531 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1561 = false;
    float _1591 = _1531;
    float _1593 = _971 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1595 = _971 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1597 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1593);
    float _1599 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1597);
    float _1601 = _971 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1603 = fma(_977, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1605 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1607 = fma(_977, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1601);
    float _1609 = floor(_1603);
    float _1611 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1607);
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1615 = 1.0 / _1605;
    float _1617 = _1613 + _1605;
    float _1619 = -_1609;
    float _1621 = _1603 + _1619;
    float _1623 = _977 * (*spvDescriptorSet0.vp_c15)._m0[127].x;
    float _1625 = fma(_1595, (*spvDescriptorSet0.vp_c15)._m0[127].y, _1623);
    float _1627 = _1617 * _1615;
    float _1629 = _1627 * 0.5;
    float _1631 = _977 * (*spvDescriptorSet0.vp_c15)._m0[126].x;
    float _1633 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1625);
    float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1637 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1635);
    float _1639 = fma(_1595, (*spvDescriptorSet0.vp_c15)._m0[126].y, _1631);
    float _1641 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1643 = 1.0 / _1637;
    float _1645 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1647 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1639);
    float _1649 = _971 + _1645;
    float _1651 = _1647 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1653 = trunc(_1641);
    int _1655 = int(_1653);
    float _1657 = fma(_1649, (*spvDescriptorSet0.vp_c15)._m0[126].y, _1631);
    float _1659 = fma(_1649, (*spvDescriptorSet0.vp_c15)._m0[127].y, _1623);
    float _1661 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1657);
    float _1663 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1659);
    float _1665 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1667 = _1643 * _1665;
    float _1669 = _1661 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1671 = _1663 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1673 = trunc(_1651);
    int _1675 = int(_1673);
    bool _1677 = _1667 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1679 = _1667 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1681 = !_1677;
    int _1683 = _1681 ? 0 : 1;
    float _1685 = trunc(_1669);
    int _1687 = int(_1685);
    int _1689 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1691 = _1655 + _1689;
    int _1693 = _1691 + 1;
    int _1695 = 2;
    int _1697 = _1693;
    float _1699 = _1641;
    if (!_1677)
    {
        _1695 = 1;
    }
    int _1701 = _1695;
    float _1703 = trunc(_1671);
    int _1705 = int(_1703);
    int _1707 = _1701;
    if (!_1679)
    {
        _1707 = _1683;
    }
    int _1709 = _1707;
    int _1711 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1713 = _1675 + _1711;
    int _1715 = _1713 + 1;
    int _1717 = _1709 << 6;
    bool _1719 = _1715 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1721 = _1717 + 96;
    uint _1724 = uint(int(uint(_1721) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c15)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c15)._m0[int(_1734)][_1736];
    int _1740 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1742 = _1687 + _1740;
    int _1744 = _1742 + 1;
    int _1746 = _1715 | _1693;
    bool _1748 = _1744 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1750 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1752 = _1705 + _1750;
    int _1754 = _1752 + 1;
    int _1756 = _1717 + 104;
    uint _1758 = uint(int(uint(_1756) >> uint(2)));
    uint _1760 = uint(int(uint(int(_1758)) >> uint(2)));
    int _1762 = int(_1758) & 3;
    float _1764 = (*spvDescriptorSet0.vp_c15)._m0[int(_1760)][_1762];
    int _1766 = int(_1758) + 1;
    uint _1768 = uint(int(uint(_1766) >> uint(2)));
    int _1770 = _1766 & 3;
    float _1772 = (*spvDescriptorSet0.vp_c15)._m0[int(_1768)][_1770];
    bool _1774 = _1746 < 0;
    bool _1776 = _1774 || _1719;
    int _1778 = _1744 | _1754;
    bool _1780 = _1693 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1782 = _1780 || _1776;
    bool _1784 = _1778 < 0;
    bool _1786 = _1784 || _1748;
    int _1788 = _1717 + 48;
    uint _1790 = uint(int(uint(_1788) >> uint(2)));
    uint _1792 = uint(int(uint(int(_1790)) >> uint(2)));
    int _1794 = int(_1790) & 3;
    float _1796 = (*spvDescriptorSet0.vp_c15)._m0[int(_1792)][_1794];
    int _1798 = int(_1790) + 1;
    uint _1800 = uint(int(uint(_1798) >> uint(2)));
    int _1802 = _1798 & 3;
    float _1804 = (*spvDescriptorSet0.vp_c15)._m0[int(_1800)][_1802];
    bool _1806 = _1754 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1808 = _1806 || _1786;
    int _1810 = _1717 + 64;
    uint _1812 = uint(int(uint(_1810) >> uint(2)));
    uint _1814 = uint(int(uint(int(_1812)) >> uint(2)));
    int _1816 = int(_1812) & 3;
    float _1818 = (*spvDescriptorSet0.vp_c15)._m0[int(_1814)][_1816];
    int _1820 = int(_1812) + 1;
    uint _1822 = uint(int(uint(_1820) >> uint(2)));
    int _1824 = _1820 & 3;
    float _1826 = (*spvDescriptorSet0.vp_c15)._m0[int(_1822)][_1824];
    int _1828 = _1715;
    int _1830 = _1744;
    float _1832 = as_type<float>(_1709);
    if (!_1782)
    {
        int _1834 = _1693 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1836 = _1834 + _1715;
        _1828 = _1836;
    }
    int _1838 = _1828;
    if (!_1808)
    {
        int _1840 = _1754 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1842 = _1840 + _1744;
        _1830 = _1842;
    }
    int _1844 = _1830;
    int _1846 = _1717 + 56;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    uint _1850 = uint(int(uint(int(_1848)) >> uint(2)));
    int _1852 = int(_1848) & 3;
    float _1854 = (*spvDescriptorSet0.vp_c15)._m0[int(_1850)][_1852];
    int _1856 = int(_1848) + 1;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    int _1860 = _1856 & 3;
    float _1862 = (*spvDescriptorSet0.vp_c15)._m0[int(_1858)][_1860];
    float _1864 = 0.0;
    if (!_1808)
    {
        float _1866 = floor(_1671);
        _1864 = _1866;
    }
    float _1868 = _1864;
    if (!_1808)
    {
        int _1870 = _1844 << 2;
        _1403 = _1870;
    }
    int _1872 = _1403;
    int _1874 = _1872;
    if (!_1808)
    {
        uint _1876 = uint(int(uint(_1844) >> uint(2)));
        _1697 = int(_1876);
    }
    int _1878 = _1697;
    float _1880 = fma(_987, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_1808)
    {
        int _1882 = 12 & _1872;
        _1874 = _1882;
    }
    int _1884 = _1874;
    int _1886 = _1717 + 72;
    uint _1888 = uint(int(uint(_1886) >> uint(2)));
    uint _1890 = uint(int(uint(int(_1888)) >> uint(2)));
    int _1892 = int(_1888) & 3;
    float _1894 = (*spvDescriptorSet0.vp_c15)._m0[int(_1890)][_1892];
    int _1896 = int(_1888) + 1;
    uint _1898 = uint(int(uint(_1896) >> uint(2)));
    int _1900 = _1896 & 3;
    float _1902 = (*spvDescriptorSet0.vp_c15)._m0[int(_1898)][_1900];
    if (!_1808)
    {
        int _1904 = _1878 << 4;
        int _1906 = _1904 + _1884;
        _1405 = as_type<float>(_1906);
    }
    float _1908 = _1405;
    float _1910 = _1649 * _1738;
    float _1912 = _1908;
    int _1914 = as_type<int>(_1910);
    int _1916 = as_type<int>(_1730);
    if (!_1808)
    {
        int _1918 = as_type<int>(_1908) + 400;
        uint _1920 = uint(int(uint(_1918) >> uint(2)));
        uint _1922 = uint(int(uint(int(_1920)) >> uint(2)));
        int _1924 = int(_1920) & 3;
        float _1926 = (*spvDescriptorSet0.vp_c15)._m0[int(_1922)][_1924];
        _1912 = _1926;
    }
    float _1928 = _1912;
    float _1930 = fma(_977, _1730, _1910);
    if (!_1782)
    {
        int _1932 = _1838 << 2;
        _1914 = _1932;
    }
    int _1934 = _1914;
    float _1936 = _1868;
    int _1938 = _1934;
    if (!_1808)
    {
        float _1940 = -_1868;
        float _1942 = _1671 + _1940;
        _1936 = _1942;
    }
    float _1944 = _1936;
    if (!_1782)
    {
        uint _1946 = uint(int(uint(_1838) >> uint(2)));
        _1916 = int(_1946);
    }
    int _1948 = _1916;
    float _1950 = fma(_987, _1764, _1930);
    if (!_1782)
    {
        int _1952 = 12 & _1934;
        _1938 = _1952;
    }
    int _1954 = _1938;
    float _1956 = floor(_1880);
    float _1958 = _1950 + _1772;
    if (!_1782)
    {
        int _1960 = _1948 << 4;
        int _1962 = _1960 + _1954;
        _1407 = as_type<float>(_1962);
    }
    float _1964 = _1407;
    int _1966 = _1717 + 88;
    uint _1968 = uint(int(uint(_1966) >> uint(2)));
    uint _1970 = uint(int(uint(int(_1968)) >> uint(2)));
    int _1972 = int(_1968) & 3;
    float _1974 = (*spvDescriptorSet0.vp_c15)._m0[int(_1970)][_1972];
    int _1976 = int(_1968) + 1;
    uint _1978 = uint(int(uint(_1976) >> uint(2)));
    int _1980 = _1976 & 3;
    float _1982 = (*spvDescriptorSet0.vp_c15)._m0[int(_1978)][_1980];
    float _1984 = _1649 * _1804;
    float _1986 = 1.0 / _1958;
    float _1988 = fma(_977, _1796, _1984);
    int _1990 = _1717 + 80;
    uint _1992 = uint(int(uint(_1990) >> uint(2)));
    uint _1994 = uint(int(uint(int(_1992)) >> uint(2)));
    int _1996 = int(_1992) & 3;
    float _1998 = (*spvDescriptorSet0.vp_c15)._m0[int(_1994)][_1996];
    int _2000 = int(_1992) + 1;
    uint _2002 = uint(int(uint(_2000) >> uint(2)));
    int _2004 = _2000 & 3;
    float _2006 = (*spvDescriptorSet0.vp_c15)._m0[int(_2002)][_2004];
    float _2008 = _1649 * _1826;
    float _2010 = _1826;
    float _2012 = _2008;
    if (!_1782)
    {
        float _2014 = floor(_1651);
        _2010 = _2014;
    }
    float _2016 = _2010;
    float _2018 = -_1956;
    float _2020 = _1880 + _2018;
    float _2022 = fma(_977, _1818, _2008);
    float _2024 = _1964;
    if (!_1782)
    {
        int _2026 = as_type<int>(_1964) + 400;
        uint _2028 = uint(int(uint(_2026) >> uint(2)));
        uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
        int _2032 = int(_2028) & 3;
        float _2034 = (*spvDescriptorSet0.vp_c15)._m0[int(_2030)][_2032];
        _2024 = _2034;
    }
    float _2036 = _2024;
    float _2038 = fma(_987, _1854, _1988);
    float _2040 = _1854;
    if (!_1808)
    {
        float _2042 = floor(_1669);
        _2012 = _2042;
    }
    float _2044 = _2012;
    float _2046 = _2038 + _1862;
    float _2048 = _2046 * _1986;
    float _2050 = _1862;
    if (!_1782)
    {
        float _2052 = floor(_1641);
        _2050 = _2052;
    }
    float _2054 = _2050;
    float _2056 = fma(_987, _1894, _2022);
    float _2058 = _2016;
    if (!_1782)
    {
        float _2060 = -_2016;
        float _2062 = _1651 + _2060;
        _2058 = _2062;
    }
    float _2064 = _2058;
    bool _2066 = _2048 >= 0.0;
    float _2068 = _2056 + _1902;
    bool _2070 = _2048 <= 1.0;
    bool _2072 = _2070 && _2066;
    float _2074 = _2064;
    if (!_1808)
    {
        float _2076 = rint(_1928);
        float _2078 = precise::max(_2076, 0.0);
        uint _2080 = uint(_2078);
        uint _2082 = clamp(_2080, 0u, 65535u);
        _2040 = as_type<float>(_2082);
    }
    float _2084 = _2040;
    float _2086 = _2068 * _1986;
    bool _2088 = _2086 >= 0.0;
    bool _2090 = _2088 && _2072;
    float _2092 = _2054;
    float _2094 = _2086;
    if (!_1782)
    {
        float _2096 = -_2054;
        float _2098 = _1641 + _2096;
        _1699 = _2098;
    }
    float _2100 = _1699;
    if (!_1808)
    {
        float _2102 = -_2044;
        float _2104 = _1669 + _2102;
        _2092 = _2104;
    }
    float _2106 = _2092;
    bool _2108 = _2086 <= 1.0;
    bool _2110 = _2108 && _2090;
    float _2112 = _1649 * _2006;
    float _2114 = fma(_977, _1998, _2112);
    if (_2110)
    {
        float _2116 = float(_1709);
        _1832 = _2116;
    }
    float _2118 = _1832;
    float _2120 = _1818;
    if (!_1782)
    {
        float _2122 = rint(_2036);
        float _2124 = precise::max(_2122, 0.0);
        uint _2126 = uint(_2124);
        uint _2128 = clamp(_2126, 0u, 65535u);
        _2120 = as_type<float>(_2128);
    }
    float _2130 = _2120;
    float _2132 = fma(_987, _1974, _2114);
    float _2134 = fma(_977, 6.2500002968590706586837768554688e-05, 0.5);
    float _2136 = _2132 + _1982;
    float _2138 = fma(_987, 6.2500002968590706586837768554688e-05, 0.5);
    float _2140 = _2112;
    if (_2110)
    {
        float _2142 = rint(_2118);
        float _2144 = precise::max(_2142, 0.0);
        uint _2146 = uint(_2144);
        uint _2148 = clamp(_2146, 0u, 65535u);
        _2140 = as_type<float>(_2148);
    }
    float _2150 = _2140;
    float _2152 = _2136 * _1986;
    float2 _6727 = float2(_2134, _2138);
    float _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_22.sample(spvDescriptorSet0.vp_t_tcb_22Smplr, select(_6727, float2(0.0), isnan(_6727)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_22, spvDescriptorSet0.vp_t_tcb_22Smplr_w, select(_6727, float2(0.0), isnan(_6727)), level(0.0)).x;
    float2 _6737 = float2(_1621, _2020);
    float _2156 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6737, float2(0.0), isnan(_6737)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6737, float2(0.0), isnan(_6737)), level(0.0)).x;
    float _2158 = _2130;
    if (!_1782)
    {
        float3 _6752 = float3(_2064, _2100, float(as_type<int>(_2130)));
        float3 _6756 = select(_6752, float3(0.0), isnan(_6752));
        float _2160 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6756.xy, uint(rint(_6756.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6756.xy, uint(rint(_6756.z)), level(0.0)).x;
        _2158 = _2160;
    }
    float _2162 = _2158;
    float _2164 = _2084;
    if (!_1808)
    {
        float3 _6772 = float3(_2106, _1944, float(as_type<int>(_2084)));
        float3 _6774 = select(_6772, float3(0.0), isnan(_6772));
        float _2166 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6774.xy, uint(rint(_6774.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6774.xy, uint(rint(_6774.z)), level(0.0)).x;
        _2164 = _2166;
    }
    float _2168 = _2164;
    float _2170 = _1651;
    if (_2110)
    {
        float3 _6789 = float3(_2048, _2086, float(as_type<int>(_2150)));
        float3 _6791 = select(_6789, float3(0.0), isnan(_6789));
        float _2172 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6791.xy, uint(rint(_6791.z)), _2152, level(0.0));
        _2170 = _2172;
    }
    float _2174 = _2170;
    float _2176 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2178 = _1463 + _2176;
    float _2180 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2182 = _1469 + _2180;
    bool _2184 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2186 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2188 = _2184 || _2186;
    bool _2190 = isnan(0.5);
    bool _2192 = _2188 || _2190;
    float _2194 = fma(_2178, _1591, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2196 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2198 = _1471 + _2196;
    float _2200 = fma(_2182, _1591, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2202 = -_965;
    float _2204 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2194);
    float _2206 = fma(_2198, _1591, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2208 = -_967;
    float _2210 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2200);
    float _2212 = -_973;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2206);
    float _2216 = _2210;
    float _2218 = _2214;
    if (_2192)
    {
        _2094 = _2204;
    }
    float _2220 = _2094;
    float _2222 = _2220;
    if (!_2192)
    {
        float _2224 = _983 * _983;
        float _2226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2228 = -_657;
        float _2230 = _2228 + _2206;
        float _2232 = -_603;
        float _2234 = _2232 + _2194;
        float _2236 = fma(_991, _991, _2224);
        float _2238 = -_639;
        float _2240 = _2238 + _2200;
        float _2242 = fma(_999, _999, _2236);
        float _2244 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2246 = sqrt(_2242);
        float _2248 = 1.0 / _1195;
        float _2250 = _2244 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2252 = precise::min(_2246, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2254 = _2252 * _2226;
        float _2256 = _2254 * _2248;
        float _2258 = _2250 * _2256;
        float _2260 = _2230 * _2256;
        float _2262 = fma(_2234, _2258, _971);
        float _2264 = fma(_2240, _2258, _977);
        float _2266 = fma(_2250, _2260, _987);
        _2222 = _2262;
        _2216 = _2264;
        _2218 = _2266;
    }
    float _2268 = _2222;
    float _2270 = _2216;
    float _2272 = _2218;
    float _2274 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2276 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2278 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    bool _2280 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2282 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2284 = _2280 || _2282;
    bool _2286 = isnan(0.5);
    bool _2288 = _2284 || _2286;
    float _2290 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2274);
    float _2292 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2276);
    float _2294 = _2268 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2296 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2278);
    float _2298 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2290);
    float _2300 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2292);
    float _2302 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2294);
    float _2304 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2296);
    float _2306 = _2298 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2308 = _2300 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2310 = fma(_2272, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2302);
    float _2312 = _2304 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2314 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2316 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2318 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2320 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2322 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2314);
    float _2324 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2316);
    float _2326 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2318);
    float _2328 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2320);
    float _2330 = abs(_2154);
    bool _2332 = _2330 != 0.0;
    bool _2334 = isnan(_2330);
    bool _2336 = _2332 || _2334;
    bool _2338 = isnan(0.0);
    bool _2340 = _2336 || _2338;
    float _2342 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2322);
    float _2344 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2346 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2324);
    float _2348 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2326);
    float _2350 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2328);
    float _2352 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2342);
    float _2354 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2346);
    float _2356 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2348);
    float _2358 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2350);
    float _2360 = _2308;
    float _2362 = _2350;
    float _2364 = _2326;
    float _2366 = _2358;
    if (_2288)
    {
        _2360 = 1.0;
    }
    float _2368 = _2360;
    float _2370 = _2368;
    if (_2340)
    {
        _2074 = _2358;
    }
    float _2372 = _2074;
    float _2374 = _2372;
    if (!_2340)
    {
        _2374 = 0.0;
    }
    float _2376 = _2374;
    float _2378 = _2376;
    if (!_2288)
    {
        float _2380 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2382 = _2380 * 0.15915493667125701904296875;
        float _2384 = _2382 * 6.283185482025146484375;
        float _2386 = cos(_2384);
        float _2388 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2390 = _2388 * 0.15915493667125701904296875;
        float _2392 = _2382 * 6.283185482025146484375;
        float _2394 = sin(_2392);
        float _2396 = 1.0 / _2386;
        float _2398 = _2390 * 6.283185482025146484375;
        float _2400 = cos(_2398);
        float _2402 = _2394 * _2396;
        float _2404 = _2390 * 6.283185482025146484375;
        float _2406 = sin(_2404);
        float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2410 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2408;
        float _2412 = _2400 * _2402;
        float _2414 = 1.0 / _2410;
        float _2416 = 1.0 / _2412;
        float _2418 = _2406 * _2416;
        float _2420 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2422 = fma(_1667, _2418, _2420);
        float _2424 = _2422 * _2414;
        float _2426 = precise::clamp(_2424, 0.0, 1.0);
        _2362 = _2414;
        _1013 = _2390;
        _2364 = _2416;
        _2370 = _2426;
    }
    float _2428 = _2362;
    float _2430 = _1013;
    float _2432 = _2364;
    float _2434 = _2370;
    out.gl_Position.x = _2352;
    out.gl_Position.y = _2354;
    out.gl_Position.z = _2356;
    out.gl_Position.w = _2358;
    float _2436 = _2428;
    float _2438 = _2430;
    float _2440 = _2432;
    if (!_2340)
    {
        out.gl_Position.w = 0.0;
    }
    if (!_1782)
    {
        int _2442 = _1838 << 4;
        int _2444 = _2442 + 2048;
        uint _2446 = uint(int(uint(_2444) >> uint(2)));
        uint _2448 = uint(int(uint(int(_2446)) >> uint(2)));
        int _2450 = int(_2446) & 3;
        float _2452 = (*spvDescriptorSet0.vp_c15)._m0[int(_2448)][_2450];
        int _2454 = int(_2446) + 1;
        uint _2456 = uint(int(uint(_2454) >> uint(2)));
        int _2458 = _2454 & 3;
        float _2460 = (*spvDescriptorSet0.vp_c15)._m0[int(_2456)][_2458];
        int _2462 = _2444 + 8;
        uint _2464 = uint(int(uint(_2462) >> uint(2)));
        uint _2466 = uint(int(uint(int(_2464)) >> uint(2)));
        int _2468 = int(_2464) & 3;
        float _2470 = (*spvDescriptorSet0.vp_c15)._m0[int(_2466)][_2468];
        int _2472 = int(_2464) + 1;
        uint _2474 = uint(int(uint(_2472) >> uint(2)));
        int _2476 = _2472 & 3;
        float _2478 = (*spvDescriptorSet0.vp_c15)._m0[int(_2474)][_2476];
        float _2480 = _1595 * _2460;
        float _2482 = fma(_977, _2452, _2480);
        float _2484 = fma(_987, _2470, _2482);
        float _2486 = _2484 + _2478;
        float _2488 = precise::clamp(_2486, 0.0, 1.0);
        float _2490 = -_2488;
        float _2492 = _2490 + _2162;
        float _2494 = fma(_2492, 500.0, 1.5);
        float _2496 = exp2(_2494);
        float _2498 = 0.0 + _2496;
        float _2500 = precise::clamp(_2498, 0.0, 1.0);
        bool _2502 = _2500 >= 1.0;
        bool _2504 = isnan(_2500);
        bool _2506 = _2502 || _2504;
        bool _2508 = isnan(1.0);
        bool _2510 = _2506 || _2508;
        _2436 = _2452;
        _2438 = _2460;
        if (!_2510)
        {
            out.gl_Position.w = 0.0;
        }
        if (!_2510)
        {
            _2378 = 0.0;
        }
    }
    float _2512 = _2436;
    float _2514 = _2438;
    float _2516 = _2378;
    float _2518 = _2514;
    float _2520 = _2512;
    if (_1808)
    {
        _2440 = 1.0;
    }
    float _2522 = _2440;
    float _2524 = _2522;
    if (!_1808)
    {
        int _2526 = _1844 << 4;
        int _2528 = _2526 + 2048;
        uint _2530 = uint(int(uint(_2528) >> uint(2)));
        uint _2532 = uint(int(uint(int(_2530)) >> uint(2)));
        int _2534 = int(_2530) & 3;
        float _2536 = (*spvDescriptorSet0.vp_c15)._m0[int(_2532)][_2534];
        int _2538 = int(_2530) + 1;
        uint _2540 = uint(int(uint(_2538) >> uint(2)));
        int _2542 = _2538 & 3;
        float _2544 = (*spvDescriptorSet0.vp_c15)._m0[int(_2540)][_2542];
        int _2546 = _2528 + 8;
        uint _2548 = uint(int(uint(_2546) >> uint(2)));
        uint _2550 = uint(int(uint(int(_2548)) >> uint(2)));
        int _2552 = int(_2548) & 3;
        float _2554 = (*spvDescriptorSet0.vp_c15)._m0[int(_2550)][_2552];
        int _2556 = int(_2548) + 1;
        uint _2558 = uint(int(uint(_2556) >> uint(2)));
        int _2560 = _2556 & 3;
        float _2562 = (*spvDescriptorSet0.vp_c15)._m0[int(_2558)][_2560];
        float _2564 = _1649 * _2544;
        float _2566 = fma(_977, _2536, _2564);
        float _2568 = fma(_987, _2554, _2566);
        float _2570 = _2568 + _2562;
        float _2572 = precise::clamp(_2570, 0.0, 1.0);
        float _2574 = -_2572;
        float _2576 = _2574 + _2168;
        float _2578 = fma(_2576, 500.0, 1.5);
        float _2580 = exp2(_2578);
        float _2582 = 0.0 + _2580;
        float _2584 = precise::clamp(_2582, 0.0, 1.0);
        _2518 = _2544;
        _2520 = _2536;
        _2524 = _2584;
    }
    float _2586 = _2518;
    float _2588 = _2520;
    float _2590 = _2524;
    float _2592 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2594 = _2268 + _2592;
    float _2596 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2598 = _2270 + _2596;
    float _2600 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2602 = _2272 + _2600;
    float _2604 = _2594 * _2594;
    float _2606 = fma(_2598, _2598, _2604);
    float _2608 = fma(_2602, _2602, _2606);
    float _2610 = rsqrt(_2608);
    float _2612 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2614 = _2598 * _2612;
    float _2616 = _2602 * _2612;
    float _2618 = _2614 * _2614;
    float _2620 = _2616 * _2616;
    float _2622 = _2618 + _2620;
    float _2624 = sqrt(_2622);
    bool _2626 = _2624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2628 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2630 = _2624 + _2628;
    float _2632 = _2602;
    float _2634 = _2622;
    float _2636 = _2630;
    float _2638 = _2586;
    float _2640 = _2588;
    float _2642 = _2594;
    float _2644 = _2614;
    if (_2626)
    {
        float _2646 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2632 = _2646;
    }
    float _2648 = _2632;
    if (_2626)
    {
        float _2650 = rsqrt(_2622);
        _2634 = _2650;
    }
    float _2652 = _2634;
    float _2654 = _2652;
    if (_2626)
    {
        float _2656 = _2630 * _2648;
        _2636 = _2656;
    }
    float _2658 = _2636;
    if (_2626)
    {
        float _2660 = _2658 * 0.15915493667125701904296875;
        _2638 = _2660;
    }
    float _2662 = _2638;
    float _2664 = _2648;
    if (_2626)
    {
        float _2666 = _2662 * 6.283185482025146484375;
        float _2668 = sin(_2666);
        _2664 = _2668;
    }
    float _2670 = _2664;
    float _2672 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2674 = precise::max(0.0, _2672);
    float _2676 = _2604;
    float _2678 = _2674;
    if (_2626)
    {
        float _2680 = _2662 * 6.283185482025146484375;
        float _2682 = cos(_2680);
        _2676 = _2682;
    }
    float _2684 = _2676;
    float _2686 = -_2612;
    float _2688 = -_2674;
    float _2690 = fma(_2594, _2686, _2688);
    if (_2626)
    {
        float _2692 = _2690 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2678 = _2692;
    }
    float _2694 = _2678;
    float _2696 = _2670;
    float _2698 = _2694;
    if (_2626)
    {
        float _2700 = fma(_2670, _2694, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2640 = _2700;
    }
    float _2702 = _2640;
    float _2704 = _2702;
    if (!_2626)
    {
        _2696 = _2690;
    }
    float _2706 = _2696;
    float _2708 = _2706;
    float _2710 = _2684;
    if (_2626)
    {
        float _2712 = _2684 + (-1.0);
        _2642 = _2712;
    }
    float _2714 = _2642;
    float _2716 = _2714;
    if (_2626)
    {
        float _2718 = _2652 * _2702;
        _2704 = _2718;
    }
    float _2720 = _2704;
    if (!_2626)
    {
        _2654 = _2618;
    }
    float _2722 = _2654;
    float _2724 = _2722;
    if (_2626)
    {
        float _2726 = _2714 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2698 = _2726;
    }
    float _2728 = _2698;
    if (_2626)
    {
        float _2730 = _2614 * _2720;
        _2644 = _2730;
    }
    float _2732 = _2644;
    if (!_2626)
    {
        _2716 = _2616;
    }
    float _2734 = _2716;
    float _2736 = _2734;
    if (_2626)
    {
        float _2738 = _2616 * _2720;
        _2736 = _2738;
    }
    float _2740 = _2736;
    if (_2626)
    {
        float _2742 = fma(_2690, _2684, _2728);
        _2708 = _2742;
    }
    float _2744 = _2708;
    if (_2626)
    {
        float _2746 = _2732 * _2732;
        _2724 = _2746;
    }
    float _2748 = _2724;
    float _2750 = sqrt(_2608);
    if (!_2626)
    {
        _2710 = _2620;
    }
    float _2752 = _2710;
    float _2754 = _2752;
    if (_2626)
    {
        float _2756 = _2740 * _2740;
        _2754 = _2756;
    }
    float _2758 = _2754;
    float _2760 = fma(_2744, _2744, _2748);
    float _2762 = _2760 + _2758;
    float _2764 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2766 = 1.0 / _2516;
    float _2768 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2770 = fma(_2750, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2768);
    float _2772 = precise::clamp(_2770, 0.0, 1.0);
    float _2774 = rsqrt(_2762);
    float _2776 = -_2772;
    float _2778 = _2776 + 1.0;
    float _2780 = _2312 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2782 = -_2780;
    float _2784 = fma(_2782, _2764, 1.0);
    float _2786 = abs(_2778);
    float _2788 = log2(_2786);
    float _2790 = _2352 * _2766;
    float _2792 = fma(_2790, 0.5, 0.5);
    float _2794 = _2774 * _2732;
    float _2796 = _2774 * _2744;
    float _2798 = _2774 * _2740;
    float _2800 = log2(_2784);
    float _2802 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2804 = -_2802;
    float _2806 = fma(_2796, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2804);
    float _2808 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2810 = -_2798;
    float _2812 = fma(_2810, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2806);
    float _2814 = _2796 + 1.0;
    float _2816 = exp2(_2808);
    float _2818 = fma(_2812, -0.5, 0.5);
    float _2820 = fma(_2812, 0.5, 0.5);
    float _2822 = _2800 * 0.693147182464599609375;
    float _2824 = fma(_2820, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2826 = sqrt(_2818);
    float _2828 = fma(_2820, _2824, -0.212114393711090087890625);
    float _2830 = fma(_2820, _2828, 1.570728778839111328125);
    float _2832 = _2354 * _2766;
    float _2834 = -_2796;
    float _2836 = fma(_2816, _2814, _2834);
    float _2838 = _2822 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2840 = fma(_2832, -0.5, 0.5);
    float _2842 = fma(_2836, 0.5, 0.5);
    float _2844 = _2826 * 0.636619746685028076171875;
    float3 _7856 = float3(_2792, _2840, _2838);
    float _2846 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7856, float3(0.0), isnan(_7856)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7856, float3(0.0), isnan(_7856)), level(0.0)).x;
    float _2848 = -_2830;
    float _2850 = fma(_2844, _2848, 1.0);
    float3 _7870 = float3(_2792, _2840, _2838);
    float4 _2853 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7870, float3(0.0), isnan(_7870)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7870, float3(0.0), isnan(_7870)), level(0.0)).xyzw;
    float _2855 = _2853.x;
    float _2857 = _2853.y;
    float _2859 = _2853.z;
    float _2861 = _2853.w;
    float2 _7886 = float2(_2850, _2842);
    float3 _2865 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7886, float2(0.0), isnan(_7886)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7886, float2(0.0), isnan(_7886)), level(0.0)).xyz;
    float _2867 = _2865.x;
    float _2869 = _2865.y;
    float _2871 = _2865.z;
    float _2873 = abs(_1667);
    float _2875 = log2(_2873);
    float _2877 = _2358 * 0.5;
    float _2879 = _2356 + _2358;
    float _2881 = _2352 + _2358;
    float _2883 = -_2156;
    float _2885 = _2883 + 1.0;
    float _2887 = fma(_2354, -0.5, _2877);
    float _2889 = _2879 * 0.5;
    float _2891 = _2788 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2893 = _1667 <= 8000.0;
    bool _2895 = isnan(_1667);
    bool _2897 = _2893 || _2895;
    bool _2899 = isnan(8000.0);
    bool _2901 = _2897 || _2899;
    float _2903 = float(_2901);
    float _2905 = _2881 * 0.5;
    float _2907 = _2788;
    if (!_2110)
    {
        _2907 = 1.0;
    }
    float _2909 = _2907;
    float _2911 = _2909;
    if (_2110)
    {
        bool _2913 = _2174 >= _2152;
        bool _2915 = isnan(_2174);
        bool _2917 = _2913 || _2915;
        bool _2919 = isnan(_2152);
        bool _2921 = _2917 || _2919;
        float _2923 = float(_2921);
        _2911 = _2923;
    }
    float _2925 = _2911;
    float _2927 = exp2(_2891);
    float _2929 = _2875 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_84.x = _2905;
    out.m_84.y = _2887;
    out.m_84.z = _2889;
    out.m_84.w = _2358;
    bool _2931 = _2750 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2933 = isnan(_2750);
    bool _2935 = _2931 || _2933;
    bool _2937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2939 = _2935 || _2937;
    float _2941 = _2925 * _2590;
    float _2943 = exp2(_2929);
    if (!_2939)
    {
        _2366 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2945 = _2366;
    float _2947 = fma(_2943, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2949 = precise::clamp(_2947, 0.0, 1.0);
    float _2951 = fma(_2949, -2.0, 3.0);
    float _2953 = _2949 * _2949;
    float _2955 = _2953 * _2951;
    float _2957 = -_2955;
    float _2959 = _2957 + 1.0;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2955);
    float _2963 = _2903 * _2961;
    float _2965 = _2963 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2967 = -_2927;
    float _2969 = _2967 + 1.0;
    float _2971 = _2885 * _2965;
    float _2973 = precise::clamp(_2971, 0.0, 1.0);
    float _2975 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2977 = _2965;
    float _2979 = _2945;
    float _2981 = _2945;
    if (!_2939)
    {
        _2977 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2983 = _2977;
    float _2985 = -_2973;
    float _2987 = fma(_2985, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2989 = _2434 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2991 = -_2941;
    float _2993 = fma(_2991, _2987, 1.0);
    float _2995 = precise::clamp(_2993, 0.0, 1.0);
    float _2997 = _2987;
    float _2999 = _2995;
    float _3001 = _2983;
    float _3003 = _2983;
    if (!_2939)
    {
        _2997 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3005 = _2997;
    float _3007 = _2995 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3009 = _3005;
    float _3011 = _3005;
    if (!_2939)
    {
        _2999 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3013 = _2999;
    out.m_86.x = _3007;
    float _3015 = _2975 * _2846;
    float _3017 = -_2975;
    float _3019 = _3017 + 1.0;
    float _3021 = _2861 * _3015;
    float _3023 = _2861 * _3019;
    float _3025 = _3019;
    float _3027 = _3015;
    float _3029 = _3013;
    float _3031 = _3013;
    if (!_2939)
    {
        _3025 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3033 = _3025;
    float _3035 = _2871 * _3015;
    float _3037 = fma(_2867, _3021, _2855);
    float _3039 = fma(_2869, _3021, _2857);
    float _3041 = _3033;
    float _3043 = _3033;
    if (!_2939)
    {
        _3027 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3045 = _3027;
    float _3047 = fma(_2861, _3035, _2859);
    out.m_88.x = _3037;
    out.m_88.y = _3039;
    out.m_88.z = _3047;
    out.m_88.w = _3023;
    bool _3049 = !_2939;
    float _3051 = _3045;
    float _3053 = _3045;
    if (!_3049)
    {
        bool _3055 = _2750 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3057 = isnan(_2750);
        bool _3059 = _3055 || _3057;
        bool _3061 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3063 = _3059 || _3061;
        if (!_3063)
        {
            float _3065 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3067 = _2750 + _3065;
            float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3071 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3069;
            float _3073 = 1.0 / _3071;
            float _3075 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3077 = _3075 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3079 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3081 = _3079 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3083 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3085 = _3083 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3087 = _3067 * _3073;
            float _3089 = precise::clamp(_3087, 0.0, 1.0);
            float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3093 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3095 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3097 = _3095 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3099 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3101 = _3099 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3103 = fma(_3089, _3085, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _3105 = fma(_3089, _3093, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3107 = fma(_3089, _3097, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3109 = fma(_3089, _3101, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3111 = fma(_3089, _3077, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3113 = fma(_3089, _3081, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            _3003 = _3107;
            _3011 = _3113;
            _2981 = _3105;
            _3043 = _3111;
            _3053 = _3109;
            _3031 = _3103;
            _3115 = true;
        }
        else
        {
            bool _3117 = _2750 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3119 = isnan(_2750);
            bool _3121 = _3117 || _3119;
            bool _3123 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3125 = _3121 || _3123;
            if (!_3125)
            {
                _2979 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3127 = _2979;
            _2981 = _3127;
            if (!_3125)
            {
                _3001 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3129 = _3001;
            _3003 = _3129;
            if (!_3125)
            {
                _3051 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3131 = _3051;
            _3053 = _3131;
            if (!_3125)
            {
                _3041 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3133 = _3041;
            _3043 = _3133;
            if (!_3125)
            {
                _3009 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3135 = _3009;
            _3011 = _3135;
            if (!_3125)
            {
                _3029 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3137 = _3029;
            bool _3139 = !_3125;
            _3031 = _3137;
            if (!_3139)
            {
                bool _3141 = _2750 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3143 = isnan(_2750);
                bool _3145 = _3141 || _3143;
                bool _3147 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3149 = _3145 || _3147;
                if (!_3149)
                {
                    float _3151 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3153 = _2750 + _3151;
                    float _3155 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3157 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3155;
                    float _3159 = 1.0 / _3157;
                    float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3163 = _3161 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3165 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3167 = _3165 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3169 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3173 = _3153 * _3159;
                    float _3175 = precise::clamp(_3173, 0.0, 1.0);
                    float _3177 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3179 = _3177 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3181 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3183 = _3181 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3187 = _3185 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3189 = fma(_3175, _3171, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _3191 = fma(_3175, _3179, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3193 = fma(_3175, _3183, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3195 = fma(_3175, _3187, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3197 = fma(_3175, _3163, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3199 = fma(_3175, _3167, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    _3003 = _3193;
                    _3011 = _3199;
                    _2981 = _3191;
                    _3043 = _3197;
                    _3053 = _3195;
                    _3031 = _3189;
                    _3115 = true;
                }
                else
                {
                    _3003 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3011 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2981 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3043 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3053 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3031 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3115 = false;
    float _3201 = _3003;
    float _3203 = _3011;
    float _3205 = _2981;
    float _3207 = _3043;
    float _3209 = _3053;
    float _3211 = _3031;
    float _3213 = _2989 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3215 = fma(_1513, -0.5, 0.5);
    float _3217 = precise::clamp(_3215, 0.0, 1.0);
    float _3219 = -_3201;
    float _3221 = _3219 + _3203;
    float _3223 = -_3205;
    float _3225 = _3223 + _3207;
    out.m_90.x = 0.0;
    float _3227 = -_3209;
    float _3229 = _3227 + _3211;
    float _3231 = fma(_3217, _3221, _3201);
    float _3233 = fma(_3217, _3225, _3205);
    bool _3235 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3237 = _3231 * 0.586610972881317138671875;
    float _3239 = fma(_3217, _3229, _3209);
    out.m_63.x = _3213;
    bool _3241 = _2434 > 0.0;
    bool _3243 = isnan(_2434);
    bool _3245 = _3241 || _3243;
    bool _3247 = isnan(0.0);
    bool _3249 = _3245 || _3247;
    float _3251 = fma(_3233, 0.298911988735198974609375, _3237);
    float _3253 = fma(_3239, 0.114477999508380889892578125, _3251);
    float _3255 = -_3253;
    float _3257 = _3233 + _3255;
    float _3259 = -_3253;
    float _3261 = _3231 + _3259;
    float _3263 = -_3253;
    float _3265 = _3239 + _3263;
    float _3267 = fma(_3257, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3253);
    float _3269 = fma(_3261, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3253);
    float _3271 = fma(_3265, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3253);
    bool _3273 = !_3235;
    if (!_3273)
    {
        float _3275 = -_2268;
        float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3279 = -_2270;
        float _3281 = _3279 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3283 = -_2272;
        float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3287 = _3277 * _3277;
        float _3289 = fma(_3281, _3281, _3287);
        float _3291 = fma(_3285, _3285, _3289);
        float _3293 = sqrt(_3291);
        float _3295 = rsqrt(_3291);
        float _3297 = -_3293;
        float _3299 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3301 = _3299 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3303 = precise::clamp(_3301, 0.0, 1.0);
        float _3305 = _3281 * _3295;
        float _3307 = _3277 * _3295;
        float _3309 = abs(_3303);
        float _3311 = log2(_3309);
        float _3313 = _3285 * _3295;
        float _3315 = _3305 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3317 = _1513 * _3307;
        float _3319 = -_3307;
        float _3321 = -_3315;
        float _3323 = fma(_3319, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3321);
        float _3325 = fma(_1511, _3305, _3317);
        float _3327 = -_3313;
        float _3329 = fma(_3327, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3323);
        float _3331 = fma(_1515, _3313, _3325);
        float _3333 = precise::clamp(_3331, 0.0, 1.0);
        float _3335 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3337 = _3329 + _3335;
        float _3339 = _3311 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3341 = _3337 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3343 = precise::clamp(_3341, 0.0, 1.0);
        float _3345 = exp2(_3339);
        float _3347 = _3345 * _3343;
        float _3349 = _3333 * _3347;
        float _3351 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3353 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3355 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3351;
        out.m_90.y = _3353;
        out.m_90.z = _3355;
    }
    out.m_92.x = _3267;
    out.m_92.y = _3269;
    out.m_92.z = _3271;
    if (_3249)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _3357 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3357;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

