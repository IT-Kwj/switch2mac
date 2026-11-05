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
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_106 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_84 [[user(locn5)]];
    float4 m_98 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 m_96 [[user(locn12)]];
    float4 m_92 [[user(locn13)]];
    float4 m_104 [[user(locn14)]];
    float4 m_100 [[user(locn15)]];
    float4 m_102 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_86 [[attribute(1)]];
    float4 m_70 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_60 [[attribute(4)]];
    float4 m_72 [[attribute(5)]];
    float4 m_74 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5355 = false;
    bool _4006 = false;
    bool _449 = false;
    bool _343 = false;
    bool _247 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_58.w;
    float _122 = in.m_60.w;
    float _124 = trunc(_120);
    int _127 = int(_124);
    float _129 = -_122;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_63.y = _131;
    bool _135 = _127 >= 1;
    float _137 = 0.0;
    float _139 = as_type<float>(_127);
    float _141 = _131;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _137;
    if (!_135)
    {
        out.m_65.x = 0.0;
    }
    int _145 = 0;
    if (!_135)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    int _151 = _149;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5666 = as_type<float>(_149);
        out.gl_Position.z = _5666;
    }
    if (!_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _153 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_122);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = float(_127);
    bool _165 = _131 >= _163;
    bool _167 = !_161;
    bool _169 = _165 || _167;
    float _171 = 1.0 / _163;
    if (_169)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _139;
    if (_169)
    {
        out.m_65.x = 0.0;
    }
    float _175 = _131 * _171;
    float _177 = _175;
    if (_169)
    {
        float _179 = _173 * 5.0;
        _151 = as_type<int>(_179);
    }
    int _181 = _151;
    out.m_63.x = _175;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5729 = as_type<float>(_181);
        out.gl_Position.z = _5729;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_70.x;
    float _187 = in.m_70.y;
    float _189 = in.m_70.z;
    int _191 = as_type<int>(_183) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_183) & 2;
    bool _197 = _195 != 0;
    bool _199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _201 = _187 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _203 = _187 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _205 = _187 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _207 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[4].x, _201);
    float _209 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[5].x, _203);
    float _211 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[6].x, _205);
    float _213 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[4].z, _207);
    float _215 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[5].z, _209);
    float _217 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[6].z, _211);
    bool _219 = !_193;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_197;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_199;
    float _245;
    if (!_227)
    {
        float _229 = in.m_72.x;
        float _231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _233 = _229 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _237 = _235 * _231;
        float _239 = floor(_237);
        float _241 = -_239;
        float _243 = _237 + _241;
        _245 = _243;
        _247 = true;
    }
    else
    {
        _245 = _175;
    }
    _247 = false;
    float _249 = _245;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = _249 + _251;
    bool _255 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _257 = isnan(_249);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -_265;
    float _273 = _271 + 1.0;
    bool _275 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _277 = isnan(_249);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _287;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = 1.0 / _269;
    float _295 = _285 * _273;
    float _297 = -_285;
    float _299 = _297 + 1.0;
    float _301 = _253 * _293;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _303;
    float _307 = fma(_289, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _309 = fma(_305, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _311 = _307 * _295;
    float _313 = _309 * _295;
    float _315 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].x, _311);
    float _317 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].y, _313);
    float _319 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[144].x, _315);
    float _321 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[144].y, _317);
    bool _323 = !_291;
    float _341;
    if (!_323)
    {
        float _325 = in.m_72.x;
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _329 = _325 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        _341 = _175;
    }
    _343 = false;
    float _345 = _341;
    float _347 = in.m_74.x;
    float _349 = in.m_74.y;
    bool _351 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _353 = isnan(_345);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _367 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _369 = isnan(_345);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _385 = _345 + _383;
    float _387 = -_361;
    float _389 = _387 + 1.0;
    bool _391 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _393 = 1.0 / _365;
    float _395 = _377 * _389;
    float _397 = -_377;
    float _399 = _397 + 1.0;
    float _401 = _321 * _349;
    float _403 = _319 * _347;
    float _405 = _381 * _393;
    float _407 = fma(_405, _385, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _411 = _407 * _395;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _415 = _409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _417 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[115].x, _411);
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _421 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[116].x, _417);
    float _425 = _419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _427 = _423 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_76.x = _425;
    out.m_76.y = _421;
    out.m_76.z = _415;
    out.m_76.w = _427;
    bool _429 = !_391;
    float _447;
    if (!_429)
    {
        float _431 = in.m_72.x;
        float _433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _435 = _431 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _439 = _437 * _433;
        float _441 = floor(_439);
        float _443 = -_441;
        float _445 = _439 + _443;
        _447 = _445;
        _449 = true;
    }
    else
    {
        _447 = _175;
    }
    _449 = false;
    float _451 = _447;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _455 = _451 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _465 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _467 = isnan(_451);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _477;
    float _481 = 1.0 / _459;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _487 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _489 = isnan(_451);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _503 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _505 = isnan(_451);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = 1.0 / _463;
    float _517 = -_497;
    float _519 = _517 + 1.0;
    bool _521 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _523 = _475 * _519;
    float _525 = _479 * _481;
    bool _527 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _529 = isnan(_451);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -_475;
    float _541 = _539 + 1.0;
    float _543 = 1.0 / _485;
    float _545 = fma(_525, _455, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _547;
    float _551 = _537 * _541;
    float _553 = -_537;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _561 = 1.0 / _501;
    float _563 = _513 * _555;
    float _565 = _559 * _515;
    float _567 = -_513;
    float _569 = _567 + 1.0;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _573 = _451 + _571;
    float _575 = _545 * _563;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _579 = _451 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _585 = _549 * _543;
    bool _587 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _589 = isnan(_451);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = fma(_565, _579, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _601 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[131].x, _575);
    float _603 = fma(_585, _573, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _607 = _451 + _605;
    float _609 = -_597;
    float _611 = _609 + 1.0;
    float _613 = fma(_599, _551, _601);
    float _615 = _583 * _561;
    float _617 = _497 * _611;
    float _619 = fma(_603, _523, _613);
    float _621 = fma(_615, _607, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _625 = fma(_621, _617, _619);
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _629 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _633 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[135].x, _625);
    float _635 = _627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _639 = _633 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _629;
    out.m_78.y = _635;
    out.m_78.z = _637;
    out.m_78.w = _639;
    bool _641 = !_521;
    float _643 = _551;
    if (!_641)
    {
        float _645 = in.m_72.x;
        float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _649 = _645 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _651 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _653 = _651 * _647;
        float _655 = floor(_653);
        float _657 = -_655;
        float _659 = _653 + _657;
        _177 = _659;
    }
    float _661 = _177;
    float _663 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _665 = int(_663);
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _669 = _667 != 0;
    float _671 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _673 = int(_671);
    float _675 = float(_665);
    float _677 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _679 = int(_677);
    if (_669)
    {
        _643 = 1.0;
    }
    float _681 = _643;
    float _683 = float(_673);
    float _685 = 1.0 / _675;
    float _687 = 1.0 / _683;
    float _689 = float(uint(_679));
    int _691 = ~_679;
    int _693 = _691 + 1;
    float _695 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _697 = int(_695);
    float _699 = _685 * _131;
    float _701 = _683;
    float _703 = _685;
    float _705 = _681;
    if (_669)
    {
        float _707 = in.m_72.x;
        float _709 = in.m_72.y;
        _701 = _707;
        _703 = _709;
    }
    float _711 = _701;
    float _713 = _703;
    float _715 = _687 * _131;
    float _717 = 1.0 / _689;
    float _719 = float(uint(_697));
    float _721 = trunc(_715);
    int _723 = int(_721);
    float _725 = 1.0 / _719;
    int _727 = as_type<int>(_717) + (-2);
    int _729 = as_type<int>(_717);
    if (_669)
    {
        _729 = 0;
    }
    int _731 = _729;
    float _733 = 0.0;
    float _735 = _711;
    float _737 = _713;
    int _739 = _731;
    if (_669)
    {
        _733 = _713;
    }
    float _741 = _733;
    float _743 = trunc(_699);
    int _745 = int(_743);
    float _747 = float(uint(_723));
    float _749 = as_type<float>(_727) * _747;
    float _751 = _747;
    float _753 = _741;
    if (_669)
    {
        _751 = _711;
    }
    float _755 = _751;
    float _757 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _759 = int(_757);
    int _761 = as_type<int>(_725) + (-2);
    float _763 = 0.0;
    float _765 = _755;
    if (_669)
    {
        _763 = _755;
    }
    float _767 = _763;
    float _769 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _771 = int(_769);
    float _773 = float(uint(_745));
    float _775 = as_type<float>(_761) * _773;
    float _777 = _773;
    float _779 = _767;
    if (_669)
    {
        _777 = 1.0;
    }
    float _781 = _777;
    float _783 = trunc(_749);
    float _785 = precise::max(_783, 0.0);
    uint _788 = uint(_785);
    float _790 = float(uint(_759));
    float _792 = trunc(_775);
    float _794 = precise::max(_792, 0.0);
    uint _796 = uint(_794);
    float _798 = float(_771);
    float _800 = 1.0 / _798;
    float _802 = 1.0 / _790;
    float _804 = _798;
    int _806 = as_type<int>(_790);
    float _808 = _781;
    if (_669)
    {
        _804 = _755;
    }
    float _810 = _804;
    float _812 = _810;
    if (_669)
    {
        _806 = 0;
    }
    int _814 = _806;
    int _816 = _814;
    if (!_669)
    {
        float _818 = in.m_72.x;
        float _820 = in.m_72.y;
        float _822 = in.m_72.z;
        float _824 = _818 * 3.1415927410125732421875;
        float _826 = _824 * 0.15915493667125701904296875;
        float _828 = _820 * 3.1415927410125732421875;
        float _830 = _828 * 0.15915493667125701904296875;
        float _832 = _826 * 6.283185482025146484375;
        float _834 = sin(_832);
        float _836 = _830 * 6.283185482025146484375;
        float _838 = sin(_836);
        _705 = 7.345489978790283203125;
        _735 = _818;
        _808 = 5.839270114898681640625;
        _812 = _822;
        _765 = _820;
        _737 = _820;
        _739 = 1;
        _753 = _838;
        _816 = 2;
        _779 = _834;
    }
    float _840 = _705;
    float _842 = _735;
    float _844 = _808;
    float _846 = _812;
    float _848 = _765;
    float _850 = _737;
    int _852 = _739;
    float _854 = _753;
    int _856 = _816;
    float _858 = _779;
    int _860 = _693 * int(_788);
    int _862 = _860 + _723;
    int _864 = ~_697;
    int _866 = _864 + 1;
    float _868 = _800 * _131;
    float _870 = _840 * _842;
    float _872 = in.m_72.z;
    float _874 = in.m_72.w;
    float _876 = _844 * _846;
    float _878 = float(uint(_862));
    int _880 = _866 * int(_796);
    int _882 = _880 + _745;
    float _884 = floor(_870);
    float _886 = float(_679);
    float _888 = _840 * _848;
    float _890 = as_type<float>(_727) * _878;
    float _892 = float(uint(_882));
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _896 = _661 + _894;
    float _898 = float(_723);
    float _900 = _850 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _902 = trunc(_868);
    int _904 = int(_902);
    float _906 = as_type<float>(_761) * _892;
    bool _908 = _898 >= _886;
    bool _910 = isnan(_898);
    bool _912 = _908 || _910;
    bool _914 = isnan(_886);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = _842 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _922 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _924 = as_type<int>(_802) + (-2);
    float _926 = trunc(_890);
    float _928 = precise::max(_926, 0.0);
    uint _930 = uint(_928);
    float _932 = -_884;
    float _934 = _870 + _932;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _938 = _936 != 0;
    bool _940 = _874 > 0.5;
    bool _942 = _872 > 0.5;
    float _944 = floor(_876);
    float _946 = float(uint(_904));
    bool _948 = _850 > 0.5;
    int _950 = ~_679;
    int _952 = _950 + 1;
    float _954 = as_type<float>(_924) * _946;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _958 = _956 != 0;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _962 = _960 != 0;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _966 = _964 != 0;
    float _968 = trunc(_906);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    int _974 = int(_788) + int(_930);
    int _976 = ~_697;
    int _978 = _976 + 1;
    float _980 = -_221;
    int _982 = _948 ? as_type<int>(_980) : as_type<int>(_221);
    float _984 = -_944;
    float _986 = _876 + _984;
    float _988 = -_225;
    int _990 = _942 ? as_type<int>(_988) : as_type<int>(_225);
    float _992 = trunc(_954);
    float _994 = precise::max(_992, 0.0);
    uint _996 = uint(_994);
    int _998 = _952 * _974;
    int _1000 = _998 + _723;
    bool _1002 = !_966;
    float _1004 = _1002 ? _225 : as_type<float>(_990);
    float _1006 = _934 * _886;
    int _1008 = int(_796) + int(_972);
    float _1010 = floor(_888);
    int _1012 = int(_940);
    int _1014 = _942 ? 2 : 0;
    int _1016 = _1012 | _1014;
    int _1018 = _938 ? 4 : 0;
    int _1020 = _1016 | _1018;
    int _1022 = _958 ? 8 : 0;
    int _1024 = _1020 | _1022;
    int _1026 = _962 ? 16 : 0;
    int _1028 = _1024 | _1026;
    int _1030 = _966 ? 32 : 0;
    int _1032 = _1028 | _1030;
    int _1034 = _948 ? 64 : 0;
    int _1036 = _1032 | _1034;
    int _1038 = _1036 & 64;
    bool _1040 = !_962;
    float _1042 = _1040 ? _221 : as_type<float>(_982);
    int _1044 = _978 * _1008;
    int _1046 = _1044 + _745;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1050 = _1048 != 0;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1054 = _1052 != 0;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1058 = _1056 != 0;
    bool _1060 = !_938;
    int _1062 = _1060 ? 0 : 1;
    float _1064 = trunc(_1006);
    int _1066 = int(_1064);
    float _1068 = float(_697);
    float _1070 = float(_745);
    bool _1072 = uint(_1000) >= uint(_679);
    float _1074 = _986 * _1068;
    int _1076 = ~_759;
    int _1078 = _1076 + 1;
    float _1080 = trunc(_918);
    int _1082 = int(_1080);
    bool _1084 = !_1054;
    int _1086 = _1084 ? 0 : 1;
    bool _1088 = !_1050;
    int _1090 = _1088 ? 0 : 1;
    int _1092 = _1078 * int(_996);
    int _1094 = _1092 + _904;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1098 = _1096 != 0;
    bool _1100 = uint(_1046) >= uint(_697);
    float _1102 = trunc(_1074);
    int _1104 = int(_1102);
    bool _1106 = _1070 >= _1068;
    bool _1108 = isnan(_1070);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(_1068);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    bool _1118 = !_1058;
    int _1120 = _1118 ? 0 : 1;
    bool _1122 = !_1098;
    int _1124 = _1122 ? 0 : 1;
    bool _1126 = !_1100;
    int _1128 = _1126 ? 0 : (-1);
    float _1130 = trunc(_1116);
    int _1132 = int(_1130);
    bool _1134 = !_1072;
    int _1136 = _1134 ? 0 : (-1);
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1140 = _1138 != 0;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1144 = _1142 != 0;
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1148 = _1146 != 0;
    int _1150 = abs(_1062);
    int _1152 = ~_974;
    int _1154 = _1152 + _1136;
    int _1156 = _1154 + 1;
    float _1158 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1160 = log2(_1158);
    float _1162 = -_1010;
    float _1164 = _888 + _1162;
    float _1166 = float(uint(_1094));
    int _1168 = _1066 * _1150;
    int _1170 = _1168 + _723;
    bool _1172 = !_1144;
    int _1174 = _1172 ? 0 : 1;
    int _1176 = _679 * _1156;
    int _1178 = _1176 + _723;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1182 = _1180 != 0;
    float _1184 = as_type<float>(_924) * _1166;
    bool _1186 = _1038 != 0;
    float _1188 = _171 * _131;
    int _1190 = ~_1008;
    int _1192 = _1190 + _1128;
    int _1194 = _1192 + 1;
    bool _1196 = !_1182;
    int _1198 = _1196 ? 0 : 1;
    float _1200 = _886 * _1188;
    bool _1202 = _679 == 0;
    int _1204 = _697 * _1194;
    int _1206 = _1204 + _745;
    bool _1208 = !_1140;
    int _1210 = _1208 ? 0 : 1;
    float _1212 = trunc(_1184);
    float _1214 = precise::max(_1212, 0.0);
    uint _1216 = uint(_1214);
    bool _1218 = _697 == 0;
    float _1220 = _1068 * _1188;
    int _1222 = ~_1082;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    bool _1228 = !_1202;
    int _1230 = _1228 ? _1178 : (-1);
    int _1232 = ~_1132;
    int _1234 = _1232 + 1;
    int _1236 = _1234 + 1;
    float _1238 = trunc(_1200);
    int _1240 = int(_1238);
    bool _1242 = !_1218;
    int _1244 = _1242 ? _1206 : (-1);
    int _1246 = _1230 * _1226;
    int _1248 = _679 + (-1);
    int _1250 = abs(_1086);
    int _1252 = _1244 * _1236;
    int _1254 = _697 + (-1);
    int _1256 = _1082 * _1248;
    int _1258 = _1256 + _1246;
    int _1260 = abs(_1174);
    float _1262 = trunc(_1220);
    int _1264 = int(_1262);
    int _1266 = abs(_1090);
    int _1268 = _1132 * _1254;
    int _1270 = _1268 + _1252;
    int _1272 = _1258 * _1250;
    int _1274 = abs(_1198);
    float _1276 = _842 * 2.0;
    int _1278 = ~_759;
    int _1280 = _1278 + 1;
    int _1282 = _1270 * _1260;
    int _1284 = abs(_1120);
    int _1286 = _1240 * _1266;
    int _1288 = _1286 + _1272;
    int _1290 = abs(_1124);
    int _1292 = _1104 * _1274;
    int _1294 = _1292 + _745;
    int _1296 = int(_996) + int(_1216);
    int _1298 = _1170 * _1284;
    int _1300 = _1298 + _1288;
    float _1302 = floor(_1276);
    int _1304 = abs(_1210);
    int _1306 = _1280 * _1296;
    int _1308 = _1306 + _904;
    float _1310 = -_225;
    int _1312 = _940 ? as_type<int>(_1310) : as_type<int>(_225);
    int _1314 = _1066 * _1290;
    int _1316 = _1314 + _1300;
    float _1318 = -_221;
    int _1320 = _942 ? as_type<int>(_1318) : as_type<int>(_221);
    int _1322 = _1264 * _1304;
    int _1324 = _1322 + _1282;
    bool _1326 = uint(_1308) >= uint(_759);
    float _1328 = float(_759);
    float _1330 = float(_904);
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1334 = _1332 != 0;
    float _1336 = _1328 * _1188;
    bool _1338 = !_1148;
    int _1340 = _1338 ? 0 : 1;
    float _1342 = float(uint(_1316));
    bool _1344 = _1330 >= _1328;
    bool _1346 = isnan(_1330);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan(_1328);
    bool _1352 = _1348 || _1350;
    float _1354 = float(_1352);
    float _1356 = _1164 * _1328;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1360 = _1358 != 0;
    float _1362 = as_type<float>(_727) * _1342;
    bool _1364 = !_1334;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = trunc(_1336);
    int _1370 = int(_1368);
    int _1372 = abs(_1340);
    bool _1374 = !_958;
    float _1376 = _1374 ? _225 : as_type<float>(_1312);
    bool _1378 = !_1360;
    int _1380 = _1378 ? 0 : 1;
    int _1382 = abs(_1366);
    float _1384 = trunc(_1362);
    float _1386 = precise::max(_1384, 0.0);
    uint _1388 = uint(_1386);
    bool _1390 = !_1326;
    int _1392 = _1390 ? 0 : (-1);
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1396 = _1394 != 0;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1400 = _1398 != 0;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1408 = _1406 != 0;
    int _1410 = _1294 * _1372;
    int _1412 = _1410 + _1324;
    float _1414 = trunc(_1354);
    int _1416 = int(_1414);
    int _1418 = ~_679;
    int _1420 = _1418 + 1;
    bool _1422 = !_1400;
    int _1424 = _1422 ? 0 : 1;
    int _1426 = _1104 * _1382;
    int _1428 = _1426 + _1412;
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1432 = _1430 != 0;
    int _1434 = ~_1296;
    int _1436 = _1434 + _1392;
    int _1438 = _1436 + 1;
    int _1440 = _1420 * int(_1388);
    int _1442 = _1440 + _1316;
    float _1444 = float(uint(_1428));
    float _1446 = trunc(_1356);
    int _1448 = int(_1446);
    bool _1450 = !_1396;
    int _1452 = _1450 ? 0 : 1;
    int _1454 = _759 * _1438;
    int _1456 = _1454 + _904;
    bool _1458 = _759 == 0;
    float _1460 = as_type<float>(_761) * _1444;
    float _1462 = float(uint(_1442));
    int _1464 = ~_1416;
    int _1466 = _1464 + 1;
    int _1468 = _1466 + 1;
    float _1470 = _1444;
    if (_1432)
    {
        float _1472 = in.m_72.w;
        _1470 = _1472;
    }
    float _1474 = _1470;
    bool _1476 = !_1458;
    int _1478 = _1476 ? _1456 : (-1);
    float _1480 = as_type<float>(_727) * _1462;
    float _1482 = trunc(_1460);
    float _1484 = precise::max(_1482, 0.0);
    uint _1486 = uint(_1484);
    int _1488 = abs(_1424);
    int _1490 = _1478 * _1468;
    int _1492 = _759 + (-1);
    int _1494 = abs(_1452);
    float _1496 = trunc(_1480);
    float _1498 = precise::max(_1496, 0.0);
    uint _1500 = uint(_1498);
    int _1502 = abs(_1380);
    int _1504 = _1416 * _1492;
    int _1506 = _1504 + _1490;
    int _1508 = _1506 * _1488;
    int _1510 = ~_697;
    int _1512 = _1510 + 1;
    bool _1514 = _679 == 0;
    int _1516 = _1370 * _1494;
    int _1518 = _1516 + _1508;
    int _1520 = _1448 * _1502;
    int _1522 = _1520 + _904;
    float _1524 = as_type<float>(_1502);
    if (_1432)
    {
        float _1526 = _1474 * 3.1415927410125732421875;
        _1524 = _1526;
    }
    float _1528 = _1524;
    int _1530 = ~_679;
    int _1532 = _1530 + 1;
    int _1534 = _1512 * int(_1486);
    int _1536 = _1534 + _1428;
    float _1538 = _1528;
    if (_1432)
    {
        float _1540 = _1528 * 0.15915493667125701904296875;
        _1538 = _1540;
    }
    float _1542 = _1538;
    int _1544 = int(_1388) + int(_1500);
    bool _1546 = !_1404;
    int _1548 = _1546 ? 0 : 1;
    float _1550 = float(uint(_1536));
    float _1552 = _1542;
    if (_1432)
    {
        float _1554 = _1542 * 6.283185482025146484375;
        float _1556 = sin(_1554);
        _1552 = _1556;
    }
    float _1558 = _1552;
    int _1560 = _1532 * _1544;
    int _1562 = _1560 + _1316;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1566 = _1564 != 0;
    int _1568 = abs(_1548);
    float _1570 = as_type<float>(_761) * _1550;
    bool _1572 = !_1408;
    int _1574 = _1572 ? 0 : 1;
    bool _1576 = uint(_1562) >= uint(_679);
    int _1578 = _1522 * _1568;
    int _1580 = _1578 + _1518;
    float _1582 = float(uint(_1170));
    float _1584 = trunc(_1570);
    float _1586 = precise::max(_1584, 0.0);
    uint _1588 = uint(_1586);
    int _1590 = abs(_1574);
    bool _1592 = !_1576;
    int _1594 = _1592 ? 0 : (-1);
    float _1596 = as_type<float>(_727) * _1582;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1600 = _1598 != 0;
    int _1602 = _1448 * _1590;
    int _1604 = _1602 + _1580;
    int _1606 = ~_1544;
    int _1608 = _1606 + _1594;
    int _1610 = _1608 + 1;
    float _1612 = as_type<float>(_1490);
    bool _1614 = _1600;
    if (_1566)
    {
        float _1616 = in.m_72.x;
        _1612 = _1616;
    }
    float _1618 = _1612;
    bool _1620 = !_1600;
    float _1622 = _1620 ? _221 : as_type<float>(_1320);
    float _1624 = trunc(_1596);
    float _1626 = precise::max(_1624, 0.0);
    uint _1628 = uint(_1626);
    if (_1432)
    {
        bool _1630 = _1558 > 0.5;
        _1614 = _1630;
    }
    bool _1632 = _1614;
    int _1634 = _679 * _1610;
    int _1636 = _1634 + _1316;
    float _1638 = float(uint(_1604));
    int _1640 = ~_679;
    int _1642 = _1640 + 1;
    bool _1644 = !_1514;
    int _1646 = _1644 ? _1636 : (-1);
    float _1648 = as_type<float>(_924) * _1638;
    float _1650 = 0.0;
    float _1652 = _1638;
    if (!_1432)
    {
        _1650 = _221;
    }
    float _1654 = _1650;
    float _1656 = trunc(_1648);
    float _1658 = precise::max(_1656, 0.0);
    uint _1660 = uint(_1658);
    float _1662 = _1654;
    if (_1432)
    {
        float _1664 = -_221;
        float _1666 = _1632 ? _1664 : _221;
        _1662 = _1666;
    }
    float _1668 = _1662;
    int _1670 = _1646 & 3;
    bool _1672 = _1670 != 0;
    int _1674 = _1642 * int(_1628);
    int _1676 = _1674 + _1170;
    int _1678 = _1646 & 3;
    bool _1680 = _1678 != 0;
    int _1682 = _1672 ? 0 : 1;
    bool _1684 = uint(_1678) > 1u;
    if (_1566)
    {
        float _1686 = _1618 * 3.1415927410125732421875;
        _1652 = _1686;
    }
    float _1688 = _1652;
    int _1690 = int(_1486) + int(_1588);
    float _1692 = float(uint(_1294));
    float _1694 = _1688;
    if (_1566)
    {
        float _1696 = _1688 * 0.15915493667125701904296875;
        _1694 = _1696;
    }
    float _1698 = _1694;
    float _1700 = float(uint(_1676));
    int _1702 = ~_759;
    int _1704 = _1702 + 1;
    float _1706 = as_type<float>(_761) * _1692;
    int _1708 = ~_697;
    int _1710 = _1708 + 1;
    float _1712 = as_type<float>(_727) * _1700;
    int _1714 = ~_1682;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    int _1720 = _1704 * int(_1660);
    int _1722 = _1720 + _1604;
    float _1724 = -_225;
    int _1726 = _1186 ? as_type<int>(_1724) : as_type<int>(_225);
    int _1728 = _1710 * _1690;
    int _1730 = _1728 + _1428;
    float _1732 = trunc(_1706);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    int _1738 = _1718;
    if (!_1684)
    {
        int _1740 = ~_1682;
        int _1742 = _1740 + 1;
        _1738 = _1742;
    }
    int _1744 = _1738;
    bool _1746 = uint(_1678) >= 2u;
    int _1748 = ~_697;
    int _1750 = _1748 + 1;
    float _1752 = float(uint(_1722));
    float _1754 = _1698;
    if (_1566)
    {
        float _1756 = _1698 * 6.283185482025146484375;
        float _1758 = sin(_1756);
        _1754 = _1758;
    }
    float _1760 = _1754;
    bool _1762 = uint(_1730) >= uint(_697);
    int _1764 = _1746 ? 0 : 1;
    float _1766 = as_type<float>(_924) * _1752;
    bool _1768 = _1678 != 3;
    float _1770 = trunc(_1712);
    float _1772 = precise::max(_1770, 0.0);
    uint _1774 = uint(_1772);
    bool _1776 = !_1762;
    int _1778 = _1776 ? 0 : (-1);
    int _1780 = _1750 * int(_1736);
    int _1782 = _1780 + _1294;
    int _1784 = ~_1764;
    int _1786 = _1784 + 1;
    int _1788 = _1786 + 1;
    int _1790 = ~_1690;
    int _1792 = _1790 + _1778;
    int _1794 = _1792 + 1;
    float _1796 = trunc(_1766);
    float _1798 = precise::max(_1796, 0.0);
    uint _1800 = uint(_1798);
    float _1802 = float(uint(_1782));
    int _1804 = _697 * _1794;
    int _1806 = _1804 + _1428;
    float _1808 = 0.0;
    int _1810 = _1788;
    bool _1812 = _1768;
    if (!_1566)
    {
        _1808 = _225;
    }
    float _1814 = _1808;
    float _1816 = _1814;
    if (_1768)
    {
        int _1818 = ~_1764;
        int _1820 = _1818 + 1;
        _1810 = _1820;
    }
    int _1822 = _1810;
    float _1824 = as_type<float>(_761) * _1802;
    if (_1566)
    {
        bool _1826 = _1760 > 0.5;
        _1812 = _1826;
    }
    bool _1828 = _1812;
    bool _1830 = !_1218;
    int _1832 = _1830 ? _1806 : (-1);
    int _1834 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1836 = _1834 != 0;
    float _1838 = trunc(_1824);
    float _1840 = precise::max(_1838, 0.0);
    uint _1842 = uint(_1840);
    if (_1566)
    {
        float _1844 = -_225;
        float _1846 = _1828 ? _1844 : _225;
        _1816 = _1846;
    }
    float _1848 = _1816;
    int _1850 = _1832 & 3;
    bool _1852 = _1850 != 0;
    bool _1854 = !_1836;
    float _1856 = _1854 ? _225 : as_type<float>(_1726);
    float _1858 = _1848 + (-0.5);
    bool _1860 = uint(_1850) > 1u;
    int _1862 = int(_1660) + int(_1800);
    int _1864 = ~_759;
    int _1866 = _1864 + 1;
    int _1868 = _1832 & 3;
    bool _1870 = _1868 != 0;
    int _1872 = int(_1628) + int(_1774);
    int _1874 = _1866 * _1862;
    int _1876 = _1874 + _1604;
    int _1878 = ~_679;
    int _1880 = _1878 + 1;
    int _1882 = _1870 ? 0 : 1;
    int _1884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1886 = _1884 != 0;
    int _1888 = _1880 * _1872;
    int _1890 = _1888 + _1170;
    float _1892 = float(uint(_1522));
    bool _1894 = !_1886;
    int _1896 = _1894 ? 0 : 1;
    bool _1898 = uint(_1876) >= uint(_759);
    float _1900 = as_type<float>(_924) * _1892;
    int _1902 = ~_1882;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = _1906;
    if (!_1860)
    {
        int _1910 = ~_1882;
        int _1912 = _1910 + 1;
        _1908 = _1912;
    }
    int _1914 = _1908;
    float _1916 = trunc(_1900);
    float _1918 = precise::max(_1916, 0.0);
    uint _1920 = uint(_1918);
    bool _1922 = uint(_1890) >= uint(_679);
    bool _1924 = !_1898;
    int _1926 = _1924 ? 0 : (-1);
    bool _1928 = _1850 != 3;
    bool _1930 = !_1922;
    int _1932 = _1930 ? 0 : (-1);
    bool _1934 = uint(_1850) >= 2u;
    int _1936 = ~_1862;
    int _1938 = _1936 + _1926;
    int _1940 = _1938 + 1;
    int _1942 = ~_697;
    int _1944 = _1942 + 1;
    int _1946 = int(_1736) + int(_1842);
    int _1948 = _759 * _1940;
    int _1950 = _1948 + _1604;
    int _1952 = _1934 ? 0 : 1;
    int _1954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1956 = _1954 != 0;
    int _1958 = _1944 * _1946;
    int _1960 = _1958 + _1294;
    int _1962 = ~_759;
    int _1964 = _1962 + 1;
    int _1966 = ~_1952;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    int _1972 = _1970;
    int _1974 = _1914;
    if (_1928)
    {
        int _1976 = ~_1952;
        int _1978 = _1976 + 1;
        _1972 = _1978;
    }
    int _1980 = _1972;
    int _1982 = _1964 * int(_1920);
    int _1984 = _1982 + _1522;
    int _1986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _1988 = _1986 != 0;
    bool _1990 = !_1956;
    int _1992 = _1990 ? 0 : 1;
    bool _1994 = uint(_1960) >= uint(_697);
    bool _1996 = !_1458;
    int _1998 = _1996 ? _1950 : (-1);
    bool _2000 = !_1988;
    int _2002 = _2000 ? 0 : 1;
    bool _2004 = !_1994;
    int _2006 = _2004 ? 0 : (-1);
    int _2008 = _1998 & 3;
    bool _2010 = _2008 != 0;
    int _2012 = _1998 & 3;
    bool _2014 = _2012 != 0;
    float _2016 = float(uint(_1984));
    int _2018 = _2010 ? 0 : 1;
    bool _2020 = uint(_2012) > 1u;
    float _2022 = as_type<float>(_924) * _2016;
    int _2024 = ~_2018;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = ~_759;
    int _2032 = _2030 + 1;
    float _2034 = trunc(_2022);
    float _2036 = precise::max(_2034, 0.0);
    uint _2038 = uint(_2036);
    float _2040 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2042 = _2040 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2044 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2046 = _2044 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2048 = _2028;
    if (!_2020)
    {
        int _2050 = ~_2018;
        int _2052 = _2050 + 1;
        _2048 = _2052;
    }
    int _2054 = _2048;
    float _2056 = 1.0 / _2042;
    bool _2058 = uint(_2012) >= 2u;
    int _2060 = ~_1946;
    int _2062 = _2060 + _2006;
    int _2064 = _2062 + 1;
    int _2066 = _2058 ? 0 : 1;
    bool _2068 = _2012 != 3;
    float _2070 = 1.0 / _2046;
    int _2072 = int(_1920) + int(_2038);
    int _2074 = _697 * _2064;
    int _2076 = _2074 + _1294;
    int _2078 = ~_2066;
    int _2080 = _2078 + 1;
    int _2082 = _2080 + 1;
    int _2084 = _2032 * _2072;
    int _2086 = _2084 + _1522;
    bool _2088 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2090 = isnan(_661);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2096 = _2092 || _2094;
    float _2098 = float(_2096);
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2102 = _2100 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2104 = _2082;
    if (_2068)
    {
        int _2106 = ~_2066;
        int _2108 = _2106 + 1;
        _2104 = _2108;
    }
    int _2110 = _2104;
    bool _2112 = uint(_2086) >= uint(_759);
    float _2114 = -_2098;
    float _2116 = _2114 + 1.0;
    float _2118 = 1.0 / _2102;
    bool _2120 = !_2112;
    int _2122 = _2120 ? 0 : (-1);
    bool _2124 = _842 > 0.5;
    float _2126 = -_221;
    int _2128 = _2124 ? as_type<int>(_2126) : as_type<int>(_221);
    int _2130 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2132 = _2130 != 0;
    float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2136 = _2134 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2138 = !_2132;
    float _2140 = _2138 ? _221 : as_type<float>(_2128);
    float _2142 = 1.0 / _2136;
    bool _2144 = _852 != 1;
    float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2146;
    float _2150 = in.m_58.x;
    float _2152 = in.m_58.y;
    float _2154 = in.m_58.z;
    int _2156 = ~_2072;
    int _2158 = _2156 + _2122;
    int _2160 = _2158 + 1;
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2164 = abs(_1744);
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2168 = abs(_2054);
    float _2170 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2162);
    float _2172 = 0.0;
    float _2174 = _2136;
    if (!_2144)
    {
        _2172 = _850;
    }
    float _2176 = _2172;
    float _2178 = _854 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2180 = 0.0;
    float _2182 = _2176;
    if (!_2144)
    {
        _2180 = _850;
    }
    float _2184 = _2180;
    float _2186 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2170);
    float _2188 = 0.0;
    float _2190 = _2184;
    if (!_2144)
    {
        _2188 = _872;
    }
    float _2192 = _2188;
    int _2194 = _759 * _2160;
    int _2196 = _2194 + _1522;
    float _2198 = _2192;
    if (!_2144)
    {
        _2174 = _872;
    }
    float _2200 = _2174;
    float _2202 = _2200;
    if (_2144)
    {
        _2182 = _842;
    }
    float _2204 = _2182;
    if (_2144)
    {
        _2190 = _842;
    }
    float _2206 = _2190;
    if (_2144)
    {
        _2198 = _850;
    }
    float _2208 = _2198;
    float _2210 = _2152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_2144)
    {
        _2202 = _850;
    }
    float _2212 = _2202;
    float _2214 = _2152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2216 = _856 != 2;
    float _2218 = _2152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2220 = _850 * 2.0;
    float _2222 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2210);
    float _2224 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2214);
    float _2226 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2218);
    float _2228 = floor(_2220);
    float _2230 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2234 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2222);
    float _2236 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2224);
    float _2238 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2226);
    bool _2240 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2242 = isnan(_661);
    bool _2244 = _2240 || _2242;
    bool _2246 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2248 = _2244 || _2246;
    float _2250 = float(_2248);
    float _2252 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2254 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2252;
    float _2256 = 0.0;
    if (_2216)
    {
        _2256 = _842;
    }
    float _2258 = _2256;
    float _2260 = 1.0 / _2232;
    float _2262 = 0.0;
    float _2264 = _2258;
    if (_2216)
    {
        _2262 = _850;
    }
    float _2266 = _2262;
    float _2268 = _2254 * _2142;
    float _2270 = _2266;
    if (!_2216)
    {
        _2264 = _872;
    }
    float _2272 = _2264;
    float _2274 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2276 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2274;
    if (!_2216)
    {
        _2270 = _842;
    }
    float _2278 = _2270;
    float _2280 = -_2250;
    float _2282 = _2280 + 1.0;
    bool _2284 = _1302 >= 0.0;
    bool _2286 = isnan(_1302);
    bool _2288 = _2284 || _2286;
    bool _2290 = isnan(0.0);
    bool _2292 = _2288 || _2290;
    float _2294 = _2276 * _2056;
    float _2296 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2298 = _2296 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2300 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2302 = isnan(_661);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2308 = _2304 || _2306;
    float _2310 = float(_2308);
    float _2312 = _2278 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2314 = _2292 ? 0 : 1;
    float _2316 = _2298 * _2070;
    bool _2318 = _1302 > 0.0;
    float _2320 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2322 = _2320 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2324 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2326 = _2324 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2328 = _872 * 2.0;
    float _2330 = _2322 * _2118;
    int _2332 = ~_2314;
    int _2334 = _2332 + 1;
    int _2336 = _2334 + 1;
    float _2338 = 1.0 / _2326;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2342 = _2340 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2344 = -_2310;
    float _2346 = _2344 + 1.0;
    float _2348 = _2208 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2350 = _2204 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2352 = abs(_1896);
    float _2354 = _2098 * _2346;
    int _2356 = _2336;
    float _2358 = _2350;
    if (!_2318)
    {
        int _2360 = ~_2314;
        int _2362 = _2360 + 1;
        _2356 = _2362;
    }
    int _2364 = _2356;
    float _2366 = floor(_2328);
    bool _2368 = _2228 >= 0.0;
    bool _2370 = isnan(_2228);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan(0.0);
    bool _2376 = _2372 || _2374;
    float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2378;
    bool _2382 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2384 = isnan(_661);
    bool _2386 = _2382 || _2384;
    bool _2388 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2390 = _2386 || _2388;
    float _2392 = float(_2390);
    float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2396 = _2394 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2398 = _2376 ? 0 : 1;
    float _2400 = _2380 * _2260;
    bool _2402 = _2228 > 0.0;
    float _2404 = -_2392;
    float _2406 = _2404 + 1.0;
    float _2408 = 1.0 / _2342;
    bool _2410 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2412 = isnan(_661);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2418 = _2414 || _2416;
    float _2420 = float(_2418);
    float _2422 = _2396 * _2338;
    int _2424 = ~_2398;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    float _2430 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2432 = _661 + _2430;
    int _2434 = ~_1872;
    int _2436 = _2434 + _1932;
    int _2438 = _2436 + 1;
    float _2440 = _2420 * _2116;
    float _2442 = -_2420;
    float _2444 = _2442 + 1.0;
    bool _2446 = !_1458;
    int _2448 = _2446 ? _2196 : (-1);
    int _2450 = _679 * _2438;
    int _2452 = _2450 + _1170;
    int _2454 = _2428;
    if (!_2402)
    {
        int _2456 = ~_2398;
        int _2458 = _2456 + 1;
        _2454 = _2458;
    }
    int _2460 = _2454;
    float _2462 = _2392 * _2444;
    bool _2464 = !_1218;
    int _2466 = _2464 ? _2076 : (-1);
    bool _2468 = !_1680;
    int _2470 = _2468 ? 0 : 1;
    float _2472 = _2148 * _2408;
    int _2474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2476 = _2474 != 0;
    int _2478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2480 = _2478 != 0;
    int _2482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2484 = _2482 != 0;
    bool _2486 = _2366 >= 0.0;
    bool _2488 = isnan(_2366);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan(0.0);
    bool _2494 = _2490 || _2492;
    bool _2496 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2498 = isnan(_661);
    bool _2500 = _2496 || _2498;
    bool _2502 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2504 = _2500 || _2502;
    float _2506 = float(_2504);
    bool _2508 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2510 = isnan(_661);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2516 = _2512 || _2514;
    float _2518 = float(_2516);
    int _2520 = _2494 ? 0 : 1;
    float _2522 = -_2506;
    float _2524 = _2522 + 1.0;
    bool _2526 = _2366 > 0.0;
    float _2528 = _2506 * _2406;
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2532 = _661 + _2530;
    float _2534 = -_2518;
    float _2536 = _2534 + 1.0;
    float _2538 = _2518 * _2524;
    float _2540 = fma(_2330, _2432, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2542 = fma(_2268, _2532, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2544 = _2250 * _2536;
    float _2546 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2548 = _661 + _2546;
    bool _2550 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2552 = isnan(_661);
    bool _2554 = _2550 || _2552;
    bool _2556 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2558 = _2554 || _2556;
    float _2560 = float(_2558);
    float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2564 = _661 + _2562;
    float _2566 = fma(_2316, _2548, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2570 = _661 + _2568;
    float _2572 = _2560 * _2282;
    float _2574 = fma(_2294, _2564, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2576 = fma(_2400, _896, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2578 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2580 = _661 + _2578;
    float _2582 = fma(_2472, _2570, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2584 = _2542 * _2572;
    float _2586 = -_2560;
    float _2588 = _2586 + 1.0;
    float _2590 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2592 = ~_2520;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    float _2598 = fma(_2588, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2584);
    int _2600 = _2596;
    if (!_2526)
    {
        int _2602 = ~_2520;
        int _2604 = _2602 + 1;
        _2600 = _2604;
    }
    int _2606 = _2600;
    float _2608 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2610 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2590);
    float _2612 = fma(_2422, _2580, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2614 = fma(_2540, _2544, _2598);
    float _2616 = _850 + _842;
    float _2618 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2608);
    float _2620 = _850 + _872;
    float _2622 = _850 + (-0.5);
    float _2624 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2626 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2630 = fma(_2574, _2538, _2614);
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2634 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2624);
    float _2636 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2626);
    float _2638 = _842 + _872;
    float _2640 = _842 + (-0.5);
    float _2642 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2628);
    float _2644 = _858 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2646 = fma(_2178, -2.0, _2632);
    float _2648 = _2236 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2650 = _2234 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2652 = -_2166;
    float _2654 = fma(_2644, 2.0, _2652);
    float _2656 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2658 = fma(_2566, _2528, _2630);
    float _2660 = _2238 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2662 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2664 = _2648 + _2662;
    int _2666 = _1832 >> 31;
    float _2668 = -_2656;
    float _2670 = fma(_920, 2.0, _2668);
    float _2672 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2674 = _2650 + _2672;
    float _2676 = _2664 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2678 = _2666 & 3;
    float _2680 = fma(_2576, _2462, _2658);
    float _2682 = fma(_2674, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2676);
    int _2684 = _1832 + _2678;
    float _2686 = _2616 + (-1.0);
    float _2688 = fma(_2612, _2440, _2680);
    int _2690 = _2684 >> 2;
    float _2692 = fma(_2686, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2694 = !_1852;
    int _2696 = _2694 ? 0 : 1;
    float _2698 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2700 = _2660 + _2698;
    int _2702 = _2690 << 4;
    int _2704 = _2702 + 656;
    float _2706 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2708 = _1850 != 3;
    float _2710 = fma(_2700, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2682);
    uint _2712 = uint(int(uint(_2704) >> uint(2)));
    uint _2714 = uint(int(uint(int(_2712)) >> uint(2)));
    int _2716 = int(_2712) & 3;
    float _2718 = (*spvDescriptorSet0.vp_c9)._m0[int(_2714)][_2716];
    int _2720 = int(_2712) + 1;
    uint _2722 = uint(int(uint(_2720) >> uint(2)));
    int _2724 = _2720 & 3;
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[int(_2722)][_2724];
    float _2728 = fma(_900, -2.0, _2706);
    float _2730 = -_131;
    float _2732 = fma(_2730, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2654);
    bool _2734 = !_2708;
    int _2736 = _2734 ? 0 : (-1);
    float _2738 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2740 = _2710 >= 0.0;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2744 = _1668 + 0.5;
    float _2746 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2738);
    float _2748 = -_131;
    float _2750 = fma(_2748, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2670);
    float _2752 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2742);
    float _2754 = fma(_2744, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2732);
    int _2756 = _2704 + 8;
    uint _2758 = uint(int(uint(_2756) >> uint(2)));
    uint _2760 = uint(int(uint(int(_2758)) >> uint(2)));
    int _2762 = int(_2758) & 3;
    float _2764 = (*spvDescriptorSet0.vp_c9)._m0[int(_2760)][_2762];
    int _2766 = int(_2758) + 1;
    uint _2768 = uint(int(uint(_2766) >> uint(2)));
    int _2770 = _2766 & 3;
    float _2772 = (*spvDescriptorSet0.vp_c9)._m0[int(_2768)][_2770];
    float _2774 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2728);
    float _2776 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2646);
    float _2778 = _1856 + (-0.5);
    float _2780 = _2140 + 0.5;
    float _2782 = -_2778;
    float _2784 = -_2774;
    float _2786 = fma(_2782, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2784);
    float _2788 = fma(_2780, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2750);
    float _2790 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2792 = _2272 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2794 = fma(_2582, _2354, _2688);
    float _2796 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2798 = fma(_2348, -2.0, _2790);
    int _2800 = abs(_2696);
    float _2802 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2804 = fma(_2312, -2.0, _2796);
    int _2806 = abs(_1914);
    int _2808 = abs(_1980);
    float _2810 = -_2802;
    float _2812 = fma(_2350, 2.0, _2810);
    int _2814 = ~_2806;
    int _2816 = _2814 + 1;
    int _2818 = _2816 + 1;
    float _2820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2822 = ~_2800;
    int _2824 = _2822 + 1;
    int _2826 = _2824 + 1;
    float _2828 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2642);
    if (_2740)
    {
        _2358 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2830 = _2358;
    float _2832 = -_1858;
    float _2834 = -_2776;
    float _2836 = fma(_2832, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2834);
    float _2838 = -_2828;
    float _2840 = _2838 + 1.0;
    int _2842 = abs(_2736);
    if (_2740)
    {
        float _2844 = _2830 * 5.0;
        _1974 = as_type<int>(_2844);
    }
    int _2846 = _1974;
    float _2848 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2798);
    float _2850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2852 = _2818 * as_type<int>(_2726);
    int _2854 = ~_2808;
    int _2856 = _2854 + 1;
    int _2858 = _2856 + 1;
    if (_2740)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9615 = as_type<float>(_2846);
        out.gl_Position.z = _9615;
    }
    bool _2860 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2862 = isnan(0.0);
    bool _2864 = _2860 || _2862;
    bool _2866 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2868 = _2864 || _2866;
    int _2870 = _2826 * as_type<int>(_2718);
    int _2872 = _2870 + _2852;
    int _2874 = abs(_1992);
    float _2876 = _2820 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2878 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2880 = int(_2878);
    float _2882 = fma(_2310, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2794);
    float _2884 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2634);
    float _2886 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2618);
    float _2888 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2636);
    int _2890 = _2858 * as_type<int>(_2764);
    int _2892 = _2890 + _2872;
    float _2894 = _1160 * _131;
    int _2896 = ~_2842;
    int _2898 = _2896 + 1;
    int _2900 = _2898 + 1;
    float _2902 = -_2186;
    float _2904 = _2902 + 1.0;
    int _2906 = ~_2874;
    int _2908 = _2906 + 1;
    int _2910 = _2908 + 1;
    float _2912 = _2850 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2914 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2916 = exp2(_2894);
    float _2918 = float(uint(_2880));
    int _2920 = _2900 * as_type<int>(_2772);
    int _2922 = _2920 + _2892;
    float _2924 = _1622 + 0.5;
    float _2926 = -_2914;
    float _2928 = fma(_2792, 2.0, _2926);
    float _2930 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2610);
    int _2932 = _2922 * _2910;
    float _2934 = -_2840;
    float _2936 = fma(_2934, _1668, _2754);
    float _2938 = 1.0 / _2918;
    float _2940 = _1376 + (-0.5);
    float _2942 = fma(_2904, _1848, _2836);
    float _2944 = -_131;
    float _2946 = fma(_2944, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2812);
    float _2948 = -_2912;
    float _2950 = -_2848;
    float _2952 = fma(_2948, _2940, _2950);
    int _2954 = _2466 * _2874;
    int _2956 = _2954 + _2932;
    out.m_80.x = _2936;
    out.m_80.y = _2942;
    float _2958 = fma(_2876, _2924, _2946);
    float _2960 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2962 = 1.0 + _2960;
    float _2964 = -_2916;
    float _2966 = _2964 + 1.0;
    float _2968 = float(uint(_2956));
    float _2970 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2746);
    float _2972 = 1.0 / _2962;
    float _2974 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2752);
    float _2976 = _2868 ? _2966 : 0.0;
    float _2978 = -_131;
    float _2980 = fma(_2978, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2928);
    int _2982 = as_type<int>(_2938) + (-2);
    float _2984 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2804);
    bool _2986 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2988 = isnan(1.0);
    bool _2990 = _2986 || _2988;
    bool _2992 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2994 = _2990 || _2992;
    out.m_82.x = _2882;
    int _2996 = abs(_2880);
    float _2998 = as_type<float>(_2982) * _2968;
    int _3000 = _1998 >> 31;
    float _3002 = -_2974;
    float _3004 = _3002 + 1.0;
    float _3006 = trunc(_2998);
    float _3008 = precise::max(_3006, 0.0);
    uint _3010 = uint(_3008);
    int _3012 = _1646 >> 31;
    float _3014 = _2664 * _2664;
    float _3016 = float(uint(_2996));
    float _3018 = fma(_1376, _3004, _2952);
    int _3020 = ~_2880;
    int _3022 = _3020 + 1;
    if (_2994)
    {
        float _3024 = _2976 * _2972;
        _141 = _3024;
    }
    float _3026 = _141;
    int _3028 = _3000 & 3;
    float _3030 = -_2888;
    float _3032 = _3030 + 1.0;
    float _3034 = 1.0 / _3016;
    int _3036 = _3012 & 3;
    float _3038 = fma(_2674, _2674, _3014);
    int _3040 = _1998 + _3028;
    float _3042 = -_2884;
    float _3044 = _3042 + 1.0;
    int _3046 = _1646 + _3036;
    float _3048 = fma(_2700, _2700, _3038);
    int _3050 = _3022 * int(_3010);
    int _3052 = _3050 + _2956;
    int _3054 = _3040 >> 2;
    float _3056 = -_3044;
    float _3058 = fma(_2140, _3056, _2788);
    float _3060 = rsqrt(_3048);
    int _3062 = _3046 >> 2;
    float _3064 = _922 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3066 = float(uint(_3052));
    float _3068 = -_2970;
    float _3070 = _3068 + 1.0;
    int _3072 = _3054 << 4;
    int _3074 = _3072 + 800;
    if (_2740)
    {
        out.m_65.x = 0.0;
    }
    int _3076 = abs(_2956);
    float _3078 = as_type<float>(_2982) * _3066;
    int _3080 = _3062 << 4;
    int _3082 = _3080 + 368;
    uint _3084 = uint(int(uint(_3074) >> uint(2)));
    uint _3086 = uint(int(uint(int(_3084)) >> uint(2)));
    int _3088 = int(_3084) & 3;
    float _3090 = (*spvDescriptorSet0.vp_c9)._m0[int(_3086)][_3088];
    int _3092 = int(_3084) + 1;
    uint _3094 = uint(int(uint(_3092) >> uint(2)));
    int _3096 = _3092 & 3;
    float _3098 = (*spvDescriptorSet0.vp_c9)._m0[int(_3094)][_3096];
    int _3100 = as_type<int>(_3034) + (-2);
    float _3102 = -_2886;
    float _3104 = _3102 + 1.0;
    float _3106 = float(uint(_3076));
    float _3108 = -_3070;
    float _3110 = fma(_1622, _3108, _2958);
    bool _3112 = !_2476;
    int _3114 = _3112 ? 0 : 1;
    float _3116 = _3064 * _3060;
    float _3118 = fma(_1856, _3104, _2786);
    uint _3120 = uint(int(uint(_3082) >> uint(2)));
    uint _3122 = uint(int(uint(int(_3120)) >> uint(2)));
    int _3124 = int(_3120) & 3;
    float _3126 = (*spvDescriptorSet0.vp_c9)._m0[int(_3122)][_3124];
    int _3128 = int(_3120) + 1;
    uint _3130 = uint(int(uint(_3128) >> uint(2)));
    int _3132 = _3128 & 3;
    float _3134 = (*spvDescriptorSet0.vp_c9)._m0[int(_3130)][_3132];
    float _3136 = as_type<float>(_3100) * _3106;
    float _3138 = _2664 * _3116;
    float _3140 = _2674 * _3116;
    int _3142 = ~_2996;
    int _3144 = _3142 + 1;
    out.m_84.x = _3058;
    out.m_84.y = _3118;
    out.m_84.z = _3110;
    out.m_84.w = _3018;
    float _3146 = -_3138;
    float _3148 = _2664 + _3146;
    float _3150 = trunc(_3136);
    float _3152 = precise::max(_3150, 0.0);
    uint _3154 = uint(_3152);
    int _3156 = abs(_3114);
    float _3158 = -_3140;
    float _3160 = _2674 + _3158;
    float _3162 = _3148 * _3148;
    float _3164 = _2700 * _3116;
    float _3166 = float(_2606);
    float _3168 = fma(_3160, _3160, _3162);
    float _3170 = float(_3156);
    float _3172 = trunc(_3078);
    float _3174 = precise::max(_3172, 0.0);
    uint _3176 = uint(_3174);
    int _3178 = ~_2880;
    int _3180 = _3178 + 1;
    float _3182 = -_3164;
    float _3184 = _2700 + _3182;
    int _3186 = _3074 + 8;
    uint _3188 = uint(int(uint(_3186) >> uint(2)));
    uint _3190 = uint(int(uint(int(_3188)) >> uint(2)));
    int _3192 = int(_3188) & 3;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[int(_3190)][_3192];
    int _3196 = int(_3188) + 1;
    uint _3198 = uint(int(uint(_3196) >> uint(2)));
    int _3200 = _3196 & 3;
    float _3202 = (*spvDescriptorSet0.vp_c9)._m0[int(_3198)][_3200];
    float _3204 = _3170 * _3166;
    int _3206 = _3144 * int(_3154);
    int _3208 = _3206 + _3076;
    bool _3210 = !_2014;
    int _3212 = _3210 ? 0 : 1;
    int _3214 = _3082 + 8;
    uint _3216 = uint(int(uint(_3214) >> uint(2)));
    uint _3218 = uint(int(uint(int(_3216)) >> uint(2)));
    int _3220 = int(_3216) & 3;
    float _3222 = (*spvDescriptorSet0.vp_c9)._m0[int(_3218)][_3220];
    int _3224 = int(_3216) + 1;
    uint _3226 = uint(int(uint(_3224) >> uint(2)));
    int _3228 = _3224 & 3;
    float _3230 = (*spvDescriptorSet0.vp_c9)._m0[int(_3226)][_3228];
    float _3232 = float(uint(_3208));
    int _3234 = ~_2168;
    int _3236 = _3234 + 1;
    int _3238 = _3236 + 1;
    int _3240 = int(_3010) + int(_3176);
    float _3242 = as_type<float>(_3100) * _3232;
    int _3244 = abs(_2470);
    int _3246 = ~_2164;
    int _3248 = _3246 + 1;
    int _3250 = _3248 + 1;
    float _3252 = trunc(_3242);
    float _3254 = precise::max(_3252, 0.0);
    uint _3256 = uint(_3254);
    bool _3258 = _1678 != 3;
    int _3260 = _3180 * _3240;
    int _3262 = _3260 + _2956;
    int _3264 = ~_2996;
    int _3266 = _3264 + 1;
    int _3268 = _3238 * as_type<int>(_3098);
    int _3270 = abs(_3212);
    int _3272 = ~_3270;
    int _3274 = _3272 + 1;
    int _3276 = _3274 + 1;
    int _3278 = _3250 * as_type<int>(_3134);
    bool _3280 = !_3258;
    int _3282 = _3280 ? 0 : (-1);
    int _3284 = ~_3244;
    int _3286 = _3284 + 1;
    int _3288 = _3286 + 1;
    int _3290 = _3276 * as_type<int>(_3090);
    int _3292 = _3290 + _3268;
    bool _3294 = uint(_3262) >= uint(_2880);
    int _3296 = int(_3154) + int(_3256);
    int _3298 = _3288 * as_type<int>(_3126);
    int _3300 = _3298 + _3278;
    bool _3302 = !_3294;
    int _3304 = _3302 ? 0 : (-1);
    int _3306 = abs(_2110);
    int _3308 = _3266 * _3296;
    int _3310 = _3308 + _3076;
    bool _3312 = _2012 != 3;
    float _3314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3316 = ~_3240;
    int _3318 = _3316 + _3304;
    int _3320 = _3318 + 1;
    int _3322 = ~_3306;
    int _3324 = _3322 + 1;
    int _3326 = _3324 + 1;
    bool _3328 = !_3312;
    int _3330 = _3328 ? 0 : (-1);
    int _3332 = _2880 * _3320;
    int _3334 = _3332 + _2956;
    bool _3336 = uint(_3310) >= uint(_2996);
    int _3338 = _3326 * as_type<int>(_3194);
    int _3340 = _3338 + _3292;
    int _3342 = _2956 ^ _2880;
    float _3344 = _1042 + 0.5;
    int _3346 = abs(_3330);
    int _3348 = abs(_1822);
    float _3350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3352 = !_3336;
    int _3354 = _3352 ? 0 : (-1);
    uint _3356 = uint(int(uint(_3342) >> uint(31)));
    int _3358 = abs(_3282);
    int _3360 = ~_3348;
    int _3362 = _3360 + 1;
    int _3364 = _3362 + 1;
    int _3366 = ~_3354;
    int _3368 = _3296 + _3366;
    int _3370 = _3368 + 1;
    int _3372 = ~int(_3356);
    int _3374 = _3372 + 1;
    int _3376 = _3364 * as_type<int>(_3222);
    int _3378 = _3376 + _3300;
    int _3380 = ~_3358;
    int _3382 = _3380 + 1;
    int _3384 = _3382 + 1;
    bool _3386 = _2880 == 0;
    int _3388 = ~_3346;
    int _3390 = _3388 + 1;
    int _3392 = _3390 + 1;
    int _3394 = _3384 * as_type<int>(_3230);
    int _3396 = _3394 + _3378;
    int _3398 = _3370 ^ _3374;
    int _3400 = ~_2352;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    int _3406 = _3392 * as_type<int>(_3202);
    int _3408 = _3406 + _3340;
    bool _3410 = !_3386;
    int _3412 = _3410 ? _3334 : (-1);
    float _3414 = in.m_86.x;
    float _3416 = in.m_86.y;
    float _3418 = in.m_86.z;
    int _3420 = abs(_2002);
    float _3422 = _3350 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3424 = _2880 == 0;
    int _3426 = _3396 * _3404;
    int _3428 = ~_3374;
    int _3430 = _3428 + _3398;
    int _3432 = _3430 + 1;
    int _3434 = ~_3420;
    int _3436 = _3434 + 1;
    int _3438 = _3436 + 1;
    bool _3440 = !_3424;
    int _3442 = _3440 ? _3432 : (-1);
    bool _3444 = _679 == 0;
    int _3446 = _3408 * _3438;
    float _3448 = float(_3412);
    float _3450 = _3314 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3452 = float(_3442);
    int _3454 = _2448 * _3420;
    int _3456 = _3454 + _3446;
    bool _3458 = !_3444;
    int _3460 = _3458 ? _2452 : (-1);
    float _3462 = fma(_3422, _3448, _2980);
    float _3464 = _3204 * (-2.0);
    float _3466 = -_2984;
    float _3468 = fma(_3450, _3452, _3466);
    float _3470 = _1004 + (-0.5);
    int _3472 = _3460 * _2352;
    int _3474 = _3472 + _3426;
    float _3476 = fma(_3422, _3344, _3462);
    float _3478 = -_2930;
    float _3480 = _3478 + 1.0;
    float _3482 = -_3450;
    float _3484 = fma(_3482, _3470, _3468);
    float _3486 = fma(_2692, _3464, _2692);
    float _3488 = float(_3474);
    float _3490 = -_3032;
    float _3492 = fma(_1042, _3490, _3476);
    float _3494 = float(_3456);
    float _3496 = fma(_1004, _3480, _3484);
    float _3498 = fma(_3464, _3414, _3414);
    bool _3500 = !_2480;
    int _3502 = _3500 ? 0 : 1;
    out.m_88.x = _3488;
    bool _3504 = !_2484;
    int _3506 = _3504 ? 0 : 1;
    int _3508 = abs(_3502);
    out.m_88.w = _3494;
    out.m_90.x = _3492;
    out.m_90.y = _3496;
    float _3510 = _3418;
    if (_2740)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3512 = -_3138;
    float _3514 = _2648 + _3512;
    float _3516 = -_3140;
    float _3518 = _2650 + _3516;
    float _3520 = fma(_2640, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3498);
    float _3522 = float(_2364);
    float _3524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3526 = _3514 + _3524;
    float _3528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3530 = _3518 + _3528;
    float _3532 = float(_3508);
    float _3534 = _2620 + (-1.0);
    float _3536 = _3526 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3538 = _2638 + (-1.0);
    float _3540 = _3532 * _3522;
    float _3542 = fma(_3530, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3536);
    float _3544 = -_3164;
    float _3546 = _2660 + _3544;
    int _3548 = abs(_3506);
    float _3550 = fma(_3534, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3552 = float(_2460);
    float _3554 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3556 = _3546 + _3554;
    float _3558 = float(_3548);
    float _3560 = _872 + (-0.5);
    float _3562 = fma(_3486, _3026, _3520);
    float _3564 = fma(_3556, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3542);
    float _3566 = _3540 * (-2.0);
    float _3568 = _3558 * _3552;
    float _3570 = fma(_3184, _3184, _3168);
    float _3572 = _3562 * 0.15915493667125701904296875;
    float _3574 = fma(_3566, _3416, _3416);
    float _3576 = fma(_3550, _3566, _3550);
    float _3578 = _3568 * (-2.0);
    bool _3580 = _3564 >= 0.0;
    float _3582 = fma(_2622, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3574);
    float _3584 = sqrt(_3570);
    float _3586 = fma(_3538, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3588 = fma(_3578, _3418, _3418);
    float _3590 = fma(_3576, _3026, _3582);
    float _3592 = fma(_3586, _3578, _3586);
    float _3594 = fma(_3560, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3588);
    float _3596 = _3590 * 0.15915493667125701904296875;
    float _3598 = _3572 * 6.283185482025146484375;
    float _3600 = sin(_3598);
    float _3602 = fma(_3592, _3026, _3594);
    int _3604 = as_type<int>(_3576);
    if (_3580)
    {
        _3510 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3606 = _3510;
    int _3608 = as_type<int>(_3606);
    if (_3580)
    {
        out.m_65.x = 0.0;
    }
    float _3610 = _3602 * 0.15915493667125701904296875;
    float _3612 = _3572 * 6.283185482025146484375;
    float _3614 = cos(_3612);
    if (_3580)
    {
        float _3616 = _3606 * 5.0;
        _3608 = as_type<int>(_3616);
    }
    int _3618 = _3608;
    if (_3580)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10728 = as_type<float>(_3618);
        out.gl_Position.z = _10728;
    }
    float _3620 = _3596 * 6.283185482025146484375;
    float _3622 = sin(_3620);
    float _3624 = _3596 * 6.283185482025146484375;
    float _3626 = cos(_3624);
    if (_3580)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3628 = _3610 * 6.283185482025146484375;
    float _3630 = cos(_3628);
    float _3632 = _3060 * _3584;
    float _3634 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3638 = _3614 * _3626;
    float _3640 = _922 * _3632;
    float _3642 = _3632 * _3634;
    float _3644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _3646 = _3610 * 6.283185482025146484375;
    float _3648 = sin(_3646);
    float _3650 = _3614 * _3622;
    float _3652 = _3636 * _3642;
    float _3654 = _3600 * _3622;
    float _3656 = _3600 * _3626;
    float _3658 = _3644 * _3640;
    float _3660 = _3632 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3662 = _3660 * 0.5;
    float _3664 = _3614 * _3630;
    float _3666 = _3626 * _3630;
    float _3668 = _3600 * _3630;
    float _3670 = _3622 * _3630;
    float _3672 = _3664 * _3652;
    float _3674 = fma(_3648, _3638, _3654);
    float _3676 = -_3656;
    float _3678 = fma(_3648, _3650, _3676);
    float _3680 = -_3652;
    float _3682 = _3648 * _3680;
    float _3684 = -_3650;
    float _3686 = fma(_3648, _3656, _3684);
    float _3688 = fma(_3674, _3658, _3672);
    float _3690 = _3668 * _3652;
    float _3692 = fma(_3666, _3658, _3682);
    float _3694 = fma(_3648, _3654, _3638);
    float _3696 = fma(_3678, _3662, _3688);
    float _3698 = fma(_3686, _3658, _3690);
    float _3700 = fma(_3670, _3662, _3692);
    float _3702 = _3674 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3704 = _3696 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3706 = _3696 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3708 = fma(_3694, _3662, _3698);
    float _3710 = _3696 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3712 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3704);
    float _3714 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3706);
    float _3716 = _3664 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3718 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3702);
    float _3720 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3712);
    float _3722 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3714);
    float _3724 = _3720 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3726 = _3722 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3728 = _3674 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3730 = _2650 + _3724;
    float _3732 = _2660 + _3726;
    float _3734 = _3674 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3736 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3738 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3740 = _3730 + _3738;
    float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3744 = _3732 + _3742;
    float _3746 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3734);
    float _3748 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3710);
    float _3750 = _3740 * _3740;
    float _3752 = _3744 * _3744;
    float _3754 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3728);
    float _3756 = _3664 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3758 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3748);
    float _3760 = _3750 + _3752;
    float _3762 = _3664 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3764 = -_3648;
    float _3766 = fma(_3764, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3756);
    float _3768 = _3758 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3770 = sqrt(_3760);
    float _3772 = -_3648;
    float _3774 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3762);
    float _3776 = _3678 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3778 = _3678 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3780 = fma(_3736, _3736, 1.0);
    float _3782 = _3678 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3784 = _2648 + _3768;
    float _3786 = -_3648;
    float _3788 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3716);
    float _3790 = rsqrt(_3780);
    float _3792 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3776);
    float _3794 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3778);
    float _3796 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3782);
    bool _3798 = _3770 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3800 = _3782;
    float _3802 = _3670;
    float _3804 = _3776;
    float _3806 = _3780;
    float _3808 = _3768;
    float _3810 = _3740;
    if (!_3798)
    {
        _3800 = _3752;
    }
    float _3812 = _3800;
    float _3814 = _3812;
    if (!_3798)
    {
        _3802 = _3750;
    }
    float _3816 = _3802;
    float _3818 = _3816;
    if (!_3798)
    {
        _3804 = _3730;
    }
    float _3820 = _3804;
    float _3822 = _3820;
    if (!_3798)
    {
        _3806 = _3732;
    }
    float _3824 = _3806;
    float _3826 = _3824;
    if (!_3798)
    {
        _3808 = _3784;
    }
    float _3828 = _3808;
    bool _3830 = !_3798;
    float _3832 = _3828;
    if (!_3830)
    {
        float _3834 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3838 = _3770 + _3836;
        float _3840 = _3784 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3842 = rsqrt(_3760);
        float _3844 = _3838 * _3834;
        float _3846 = _3844 * 0.15915493667125701904296875;
        float _3848 = _3846 * 6.283185482025146484375;
        float _3850 = sin(_3848);
        float _3852 = _3846 * 6.283185482025146484375;
        float _3854 = cos(_3852);
        float _3856 = fma(_3850, _3840, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3858 = _3842 * _3856;
        float _3860 = _3854 + (-1.0);
        float _3862 = fma(_3740, _3858, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3864 = fma(_3744, _3858, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3866 = _3860 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3868 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3870 = _3862 + _3868;
        float _3872 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3874 = _3864 + _3872;
        float _3876 = fma(_3784, _3854, _3866);
        float _3878 = _3870 * _3870;
        float _3880 = _3874 * _3874;
        _3832 = _3876;
        _3818 = _3878;
        _3814 = _3880;
        _3822 = _3862;
        _3826 = _3864;
    }
    float _3882 = _3832;
    float _3884 = _3818;
    float _3886 = _3814;
    float _3888 = _3822;
    float _3890 = _3826;
    float _3892 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3894 = _3882 + _3892;
    float _3896 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3766);
    float _3898 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3788);
    float _3900 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3774);
    float _3902 = fma(_3894, _3894, _3884);
    float _3904 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3792);
    float _3906 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3794);
    float _3908 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3796);
    float _3910 = _3902 + _3886;
    float _3912 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3754);
    float _3914 = _3736 * _3790;
    float _3916 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3746);
    float _3918 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3920 = _3736 * _3896;
    float _3922 = _3736 * _3898;
    float _3924 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3718);
    float _3926 = _3736 * _3900;
    float _3928 = -_3904;
    float _3930 = _3914 * _3928;
    float _3932 = -_3906;
    float _3934 = _3914 * _3932;
    float _3936 = -_3908;
    float _3938 = _3914 * _3936;
    float _3940 = sqrt(_3910);
    float _3942 = fma(_3918, _3912, _3920);
    float _3944 = fma(_3918, _3916, _3922);
    float _3946 = fma(_3918, _3924, _3926);
    float _3948 = fma(_3790, _3896, _3930);
    float _3950 = fma(_3790, _3898, _3934);
    float _3952 = _3906 + _3944;
    float _3954 = fma(_3790, _3900, _3938);
    float _3956 = _3904 + _3942;
    float _3958 = _3908 + _3946;
    out.m_92.x = _3912;
    out.m_92.y = _3916;
    out.m_92.z = _3924;
    out.m_94.x = _3948;
    out.m_94.y = _3950;
    out.m_94.z = _3954;
    bool _3960 = _3940 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3962 = isnan(_3940);
    bool _3964 = _3960 || _3962;
    bool _3966 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3968 = _3964 || _3966;
    out.m_96.x = _3956;
    out.m_96.y = _3952;
    out.m_96.z = _3958;
    float _3970 = _3904;
    if (!_3968)
    {
        _3970 = 1.0;
    }
    float _3972 = _3970;
    bool _3974 = !_3968;
    float _3976 = _3972;
    if (!_3974)
    {
        bool _3978 = _3940 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3980 = isnan(_3940);
        bool _3982 = _3978 || _3980;
        bool _3984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3986 = _3982 || _3984;
        if (!_3986)
        {
            float _3988 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3990 = _3940 + _3988;
            float _3992 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3994 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3992;
            float _3996 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3998 = _3996 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4000 = 1.0 / _3994;
            float _4002 = _3990 * _4000;
            float _4004 = fma(_4002, _3998, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3976 = _4004;
            _4006 = true;
        }
        else
        {
            bool _4008 = _3940 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4010 = isnan(_3940);
            bool _4012 = _4008 || _4010;
            bool _4014 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4016 = _4012 || _4014;
            if (!_4016)
            {
                float _4018 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4020 = _3940 + _4018;
                float _4022 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4024 = _4022 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4026 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4028 = _4026 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4030 = 1.0 / _4024;
                float _4032 = _4020 * _4030;
                float _4034 = fma(_4032, _4028, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3976 = _4034;
                _4006 = true;
            }
            else
            {
                _3976 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4006 = false;
    float _4036 = _3976;
    float _4038 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4040 = _3882 + _4038;
    float _4042 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4044 = _3888 + _4042;
    float _4046 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4048 = _3890 + _4046;
    float _4050 = fma(_4040, _4036, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4052 = fma(_4044, _4036, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4054 = fma(_4048, _4036, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4056 = _3514 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4058 = -_2648;
    float _4060 = _4058 + _4050;
    float _4062 = -_2650;
    float _4064 = _4062 + _4052;
    float _4066 = -_2660;
    float _4068 = _4066 + _4054;
    float _4070 = fma(_3518, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4056);
    float _4072 = _4060 * _4060;
    float _4074 = _3514 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4076 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4070);
    float _4078 = fma(_4064, _4064, _4072);
    float _4080 = _4076 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4082 = fma(_4068, _4068, _4078);
    float _4084 = sqrt(_4082);
    bool _4086 = _4084 > 0.0;
    float _4088 = _4084;
    float _4090 = _4044;
    float _4092 = _4076;
    float _4094 = _4068;
    if (!_4086)
    {
        _4088 = _4052;
    }
    float _4096 = _4088;
    float _4098 = _4096;
    if (!_4086)
    {
        _4090 = _4050;
    }
    float _4100 = _4090;
    float _4102 = _4100;
    float _4104 = _4100;
    if (!_4086)
    {
        _4092 = _4054;
    }
    float _4106 = _4092;
    bool _4108 = !_4086;
    float _4110 = _4106;
    if (!_4108)
    {
        float _4112 = _215 * _215;
        float _4114 = fma(_213, _213, _4112);
        float _4116 = fma(_217, _217, _4114);
        float _4118 = rsqrt(_4082);
        float _4120 = sqrt(_4116);
        float _4122 = _4064 * _4118;
        float _4124 = _4060 * _4118;
        float _4126 = _4068 * _4118;
        bool _4128 = _4120 > 0.0;
        float _4130 = _4118;
        float _4132 = _4120;
        _4094 = _4126;
        if (!_4128)
        {
            _4130 = _4052;
        }
        float _4134 = _4130;
        _4098 = _4134;
        if (!_4128)
        {
            _4102 = _4050;
        }
        float _4136 = _4102;
        _4104 = _4136;
        if (!_4128)
        {
            _4132 = _4054;
        }
        float _4138 = _4132;
        bool _4140 = !_4128;
        _4110 = _4138;
        if (!_4140)
        {
            float _4142 = rsqrt(_4116);
            float _4144 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4146 = _215 * _4142;
            float _4148 = _213 * _4142;
            float _4150 = _217 * _4142;
            float _4152 = _4124 * _4146;
            float _4154 = fma(_4122, _4148, _4152);
            float _4156 = _4144 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4158 = fma(_4126, _4150, _4154);
            float _4160 = _4158 * _4156;
            float _4162 = fma(_213, _4160, _4052);
            float _4164 = fma(_215, _4160, _4050);
            float _4166 = fma(_217, _4160, _4054);
            _4104 = _4164;
            _4098 = _4162;
            _4110 = _4166;
        }
    }
    float _4168 = _4104;
    float _4170 = _4098;
    float _4172 = _4110;
    float _4174 = _4094;
    float _4176 = fma(_3518, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4074);
    float _4178 = 1.0 / _4080;
    float _4180 = -_3138;
    float _4182 = _4180 + _4168;
    float _4184 = -_3140;
    float _4186 = _4184 + _4170;
    float _4188 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4176);
    float _4190 = -_3164;
    float _4192 = _4190 + _4172;
    float _4194 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4196 = _4182 + _4194;
    float _4198 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4200 = _4186 + _4198;
    float _4202 = _4188 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4204 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4206 = _4192 + _4204;
    float _4208 = _4196 * _4196;
    float _4210 = _4202 + _4080;
    float _4212 = fma(_4200, _4200, _4208);
    float _4214 = _4210 * _4178;
    float _4216 = _4214 * 0.5;
    float _4218 = fma(_4206, _4206, _4212);
    float _4220 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4222 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4224 = fma(_4216, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4222);
    float _4226 = rsqrt(_4218);
    float _4228 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4230 = 1.0 / _4224;
    float _4232 = _4226 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4234 = _3514 + _4228;
    float _4236 = sqrt(_4218);
    float _4238 = _4200 * _4232;
    float _4240 = _4206 * _4232;
    float _4242 = _4234 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4244 = _4234 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4246 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4248 = _4230 * _4246;
    float _4250 = _4238 * _4238;
    float _4252 = _4240 * _4240;
    float _4254 = fma(_3518, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4242);
    float _4256 = fma(_3518, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4244);
    bool _4258 = _4248 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4260 = _4250 + _4252;
    bool _4262 = _4248 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4264 = fma(_3546, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4254);
    float _4266 = fma(_3546, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4256);
    float _4268 = sqrt(_4260);
    float _4270 = _4264 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _4272 = !_4258;
    int _4274 = _4272 ? 0 : 1;
    float _4276 = _4266 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _4278 = 2;
    float _4280 = _4234;
    if (!_4258)
    {
        _4278 = 1;
    }
    int _4282 = _4278;
    float _4284 = trunc(_4270);
    int _4286 = int(_4284);
    int _4288 = _4282;
    if (!_4262)
    {
        _4288 = _4274;
    }
    int _4290 = _4288;
    float _4292 = fma(_3518, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _4294 = _4290 << 6;
    bool _4296 = _4268 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4298 = trunc(_4276);
    int _4300 = int(_4298);
    int _4302 = _4294 + 96;
    uint _4304 = uint(int(uint(_4302) >> uint(2)));
    uint _4306 = uint(int(uint(int(_4304)) >> uint(2)));
    int _4308 = int(_4304) & 3;
    float _4310 = (*spvDescriptorSet0.vp_c15)._m0[int(_4306)][_4308];
    int _4312 = int(_4304) + 1;
    uint _4314 = uint(int(uint(_4312) >> uint(2)));
    int _4316 = _4312 & 3;
    float _4318 = (*spvDescriptorSet0.vp_c15)._m0[int(_4314)][_4316];
    float _4320 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4322 = _4268 + _4320;
    int _4324 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4326 = _4286 + _4324;
    int _4328 = _4326 + 1;
    int _4330 = _4294 + 48;
    uint _4332 = uint(int(uint(_4330) >> uint(2)));
    uint _4334 = uint(int(uint(int(_4332)) >> uint(2)));
    int _4336 = int(_4332) & 3;
    float _4338 = (*spvDescriptorSet0.vp_c15)._m0[int(_4334)][_4336];
    int _4340 = int(_4332) + 1;
    uint _4342 = uint(int(uint(_4340) >> uint(2)));
    int _4344 = _4340 & 3;
    float _4346 = (*spvDescriptorSet0.vp_c15)._m0[int(_4342)][_4344];
    float _4348 = floor(_4292);
    bool _4350 = _4328 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4352 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4354 = _4300 + _4352;
    int _4356 = _4354 + 1;
    int _4358 = _4294 + 104;
    uint _4360 = uint(int(uint(_4358) >> uint(2)));
    uint _4362 = uint(int(uint(int(_4360)) >> uint(2)));
    int _4364 = int(_4360) & 3;
    float _4366 = (*spvDescriptorSet0.vp_c15)._m0[int(_4362)][_4364];
    int _4368 = int(_4360) + 1;
    uint _4370 = uint(int(uint(_4368) >> uint(2)));
    int _4372 = _4368 & 3;
    float _4374 = (*spvDescriptorSet0.vp_c15)._m0[int(_4370)][_4372];
    int _4376 = as_type<int>(_3732);
    float _4378 = _4322;
    int _4380 = as_type<int>(_4292);
    float _4382 = as_type<float>(_4290);
    if (_4296)
    {
        float _4384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4376 = as_type<int>(_4384);
    }
    int _4386 = _4376;
    int _4388 = _4328 | _4356;
    bool _4390 = _4388 < 0;
    bool _4392 = _4390 || _4350;
    int _4394 = _4294 + 64;
    uint _4396 = uint(int(uint(_4394) >> uint(2)));
    uint _4398 = uint(int(uint(int(_4396)) >> uint(2)));
    int _4400 = int(_4396) & 3;
    float _4402 = (*spvDescriptorSet0.vp_c15)._m0[int(_4398)][_4400];
    int _4404 = int(_4396) + 1;
    uint _4406 = uint(int(uint(_4404) >> uint(2)));
    int _4408 = _4404 & 3;
    float _4410 = (*spvDescriptorSet0.vp_c15)._m0[int(_4406)][_4408];
    float _4412 = -_4348;
    float _4414 = _4292 + _4412;
    bool _4416 = _4356 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4418 = _4416 || _4392;
    int _4420 = _4294 + 56;
    uint _4422 = uint(int(uint(_4420) >> uint(2)));
    uint _4424 = uint(int(uint(int(_4422)) >> uint(2)));
    int _4426 = int(_4422) & 3;
    float _4428 = (*spvDescriptorSet0.vp_c15)._m0[int(_4424)][_4426];
    int _4430 = int(_4422) + 1;
    uint _4432 = uint(int(uint(_4430) >> uint(2)));
    int _4434 = _4430 & 3;
    float _4436 = (*spvDescriptorSet0.vp_c15)._m0[int(_4432)][_4434];
    int _4438 = _4386;
    if (_4296)
    {
        float _4440 = _4322 * as_type<float>(_4386);
        _4378 = _4440;
    }
    float _4442 = _4378;
    int _4444 = as_type<int>(_4442);
    if (_4296)
    {
        float _4446 = _4442 * 0.15915493667125701904296875;
        _3810 = _4446;
    }
    float _4448 = _3810;
    float _4450 = _4448;
    if (!_4418)
    {
        int _4452 = _4356 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4454 = _4452 + _4328;
        _4444 = _4454;
    }
    int _4456 = _4444;
    float _4458 = _3900;
    if (_4296)
    {
        float _4460 = _4448 * 6.283185482025146484375;
        float _4462 = cos(_4460);
        _4458 = _4462;
    }
    float _4464 = _4458;
    float _4466 = precise::max(0.0, _4220);
    if (!_4418)
    {
        int _4468 = _4456 << 2;
        _4438 = _4468;
    }
    int _4470 = _4438;
    float _4472 = -_4232;
    float _4474 = -_4466;
    float _4476 = fma(_4196, _4472, _4474);
    float _4478 = _4234 * _4318;
    float _4480 = as_type<float>(_4356);
    int _4482 = _4470;
    float _4484 = _4478;
    float _4486 = _4476;
    if (_4296)
    {
        float _4488 = _4448 * 6.283185482025146484375;
        float _4490 = sin(_4488);
        _4480 = _4490;
    }
    float _4492 = _4480;
    if (!_4418)
    {
        uint _4494 = uint(int(uint(_4456) >> uint(2)));
        _4380 = int(_4494);
    }
    int _4496 = _4380;
    float _4498 = fma(_3518, _4310, _4478);
    float _4500 = _4498;
    float _4502 = as_type<float>(_4496);
    if (!_4418)
    {
        int _4504 = 12 & _4470;
        _4482 = _4504;
    }
    int _4506 = _4482;
    float _4508 = _4234 * _4346;
    float _4510 = _4220;
    float _4512 = _4338;
    float _4514 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (_4296)
    {
        float _4516 = rsqrt(_4260);
        _4510 = _4516;
    }
    float _4518 = _4510;
    if (_4296)
    {
        float _4520 = _4476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4450 = _4520;
    }
    float _4522 = _4450;
    float _4524 = _4522;
    if (_4296)
    {
        float _4526 = _4464 + (-1.0);
        _4484 = _4526;
    }
    float _4528 = _4484;
    float _4530 = fma(_3518, _4338, _4508);
    if (!_4418)
    {
        int _4532 = _4496 << 4;
        int _4534 = _4532 + _4506;
        _3604 = _4534;
    }
    int _4536 = _3604;
    float _4538 = fma(_3546, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_4296)
    {
        _4512 = _4476;
    }
    float _4540 = _4512;
    float _4542 = fma(_3546, _4366, _4498);
    float _4544 = _4540;
    float _4546 = _4366;
    if (_4296)
    {
        float _4548 = fma(_4492, _4522, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4524 = _4548;
    }
    float _4550 = _4524;
    float _4552 = _4550;
    if (_4296)
    {
        float _4554 = _4528 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4500 = _4554;
    }
    float _4556 = _4500;
    if (!_4296)
    {
        _4514 = _4238;
    }
    float _4558 = _4514;
    float _4560 = _4174;
    float _4562 = _4558;
    if (!_4418)
    {
        int _4564 = _4536 + 400;
        uint _4566 = uint(int(uint(_4564) >> uint(2)));
        uint _4568 = uint(int(uint(int(_4566)) >> uint(2)));
        int _4570 = int(_4566) & 3;
        float _4572 = (*spvDescriptorSet0.vp_c15)._m0[int(_4568)][_4570];
        _4560 = _4572;
    }
    float _4574 = _4560;
    if (!_4296)
    {
        _4502 = _4240;
    }
    float _4576 = _4502;
    float _4578 = _4576;
    if (_4296)
    {
        float _4580 = fma(_4476, _4464, _4556);
        _4544 = _4580;
    }
    float _4582 = _4544;
    if (!_4296)
    {
        _4486 = _4250;
    }
    float _4584 = _4486;
    float _4586 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4588 = _4584;
    float _4590 = _4518;
    if (_4296)
    {
        float _4592 = _4518 * _4550;
        _4552 = _4592;
    }
    float _4594 = _4552;
    if (!_4296)
    {
        _4546 = _4252;
    }
    float _4596 = _4546;
    float _4598 = floor(_4538);
    int _4600 = _4294 + 72;
    uint _4602 = uint(int(uint(_4600) >> uint(2)));
    uint _4604 = uint(int(uint(int(_4602)) >> uint(2)));
    int _4606 = int(_4602) & 3;
    float _4608 = (*spvDescriptorSet0.vp_c15)._m0[int(_4604)][_4606];
    int _4610 = int(_4602) + 1;
    uint _4612 = uint(int(uint(_4610) >> uint(2)));
    int _4614 = _4610 & 3;
    float _4616 = (*spvDescriptorSet0.vp_c15)._m0[int(_4612)][_4614];
    float _4618 = _4596;
    if (_4296)
    {
        float _4620 = _4238 * _4594;
        _4562 = _4620;
    }
    float _4622 = _4562;
    if (_4296)
    {
        float _4624 = _4240 * _4594;
        _4578 = _4624;
    }
    float _4626 = _4578;
    float _4628 = _4234 * _4410;
    float _4630 = fma(_3546, _4428, _4530);
    if (_4296)
    {
        float _4632 = _4622 * _4622;
        _4588 = _4632;
    }
    float _4634 = _4588;
    if (_4296)
    {
        float _4636 = _4626 * _4626;
        _4618 = _4636;
    }
    float _4638 = _4618;
    float _4640 = fma(_3518, _4402, _4628);
    float _4642 = _4542 + _4374;
    float _4644 = fma(_4582, _4582, _4634);
    float _4646 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4648 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4650 = fma(_4186, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4586);
    float _4652 = _4644 + _4638;
    float _4654 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _4656 = _4294 + 80;
    uint _4658 = uint(int(uint(_4656) >> uint(2)));
    uint _4660 = uint(int(uint(int(_4658)) >> uint(2)));
    int _4662 = int(_4658) & 3;
    float _4664 = (*spvDescriptorSet0.vp_c15)._m0[int(_4660)][_4662];
    int _4666 = int(_4658) + 1;
    uint _4668 = uint(int(uint(_4666) >> uint(2)));
    int _4670 = _4666 & 3;
    float _4672 = (*spvDescriptorSet0.vp_c15)._m0[int(_4668)][_4670];
    float _4674 = fma(_4186, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4646);
    float _4676 = rsqrt(_4652);
    float _4678 = fma(_4186, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4654);
    float _4680 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4682 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4674);
    float _4684 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4650);
    float _4686 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4678);
    int _4688 = _4294 + 88;
    uint _4690 = uint(int(uint(_4688) >> uint(2)));
    uint _4692 = uint(int(uint(int(_4690)) >> uint(2)));
    int _4694 = int(_4690) & 3;
    float _4696 = (*spvDescriptorSet0.vp_c15)._m0[int(_4692)][_4694];
    int _4698 = int(_4690) + 1;
    uint _4700 = uint(int(uint(_4698) >> uint(2)));
    int _4702 = _4698 & 3;
    float _4704 = (*spvDescriptorSet0.vp_c15)._m0[int(_4700)][_4702];
    float _4706 = fma(_4186, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4680);
    float _4708 = 1.0 / _4642;
    float _4710 = _4686 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4712 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4714 = fma(_4236, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4712);
    float _4716 = precise::clamp(_4714, 0.0, 1.0);
    float _4718 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4706);
    float _4720 = _4630 + _4436;
    float _4722 = _4710 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4724 = _4684 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4726 = _4718 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4728 = _4676 * _4622;
    float _4730 = -_4722;
    float _4732 = fma(_4730, _4648, 1.0);
    float _4734 = _4682 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4736 = _4726 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4738 = _4728 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4740 = -_4598;
    float _4742 = _4538 + _4740;
    float _4744 = _4492;
    if (!_4418)
    {
        float _4746 = floor(_4276);
        _4744 = _4746;
    }
    float _4748 = _4744;
    float _4750 = fma(_4734, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4736);
    float _4752 = -_4716;
    float _4754 = _4752 + 1.0;
    float _4756 = _4676 * _4582;
    float _4758 = _4676 * _4626;
    float _4760 = _4720 * _4708;
    float _4762 = fma(_4710, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4750);
    float _4764 = -_4738;
    float _4766 = fma(_4756, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4764);
    float _4768 = abs(_4754);
    float _4770 = log2(_4768);
    float _4772 = fma(_3546, _4608, _4640);
    bool _4774 = _4760 >= 0.0;
    float _4776 = fma(_4724, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4762);
    float _4778 = -_4758;
    float _4780 = fma(_4778, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4766);
    float _4782 = _4772 + _4616;
    bool _4784 = _4760 <= 1.0;
    bool _4786 = _4784 && _4774;
    float _4788 = fma(_4780, -0.5, 0.5);
    float _4790 = _4782 * _4708;
    float _4792 = fma(_4780, 0.5, 0.5);
    float _4794 = _4754;
    if (!_4418)
    {
        float _4796 = floor(_4270);
        _4590 = _4796;
    }
    float _4798 = _4590;
    float _4800 = _4726 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4802 = _4748;
    if (!_4418)
    {
        float _4804 = -_4748;
        float _4806 = _4276 + _4804;
        _4794 = _4806;
    }
    float _4808 = _4794;
    bool _4810 = _4790 >= 0.0;
    bool _4812 = _4810 && _4786;
    float _4814 = _4234 * _4672;
    float _4816 = _4770 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _4818 = _4790 <= 1.0;
    bool _4820 = _4818 && _4812;
    float _4822 = sqrt(_4788);
    float _4824 = fma(_3518, _4664, _4814);
    float _4826 = fma(_3546, _4696, _4824);
    float _4828 = fma(_4792, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4830 = exp2(_4816);
    float _4832 = _4726 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4834 = _4826 + _4704;
    float _4836 = fma(_4792, _4828, -0.212114393711090087890625);
    if (_4820)
    {
        float _4838 = float(_4290);
        _4382 = _4838;
    }
    float _4840 = _4382;
    float _4842 = fma(_4734, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4832);
    float _4844 = _4756 + 1.0;
    float _4846 = fma(_4792, _4836, 1.570728778839111328125);
    float _4848 = log2(_4732);
    float _4850 = fma(_4734, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4800);
    float _4852 = fma(_4710, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4842);
    float _4854 = _4822 * 0.636619746685028076171875;
    if (!_4418)
    {
        float _4856 = -_4798;
        float _4858 = _4270 + _4856;
        _4802 = _4858;
    }
    float _4860 = _4802;
    float _4862 = fma(_4710, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4850);
    float _4864 = fma(_4724, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4852);
    float _4866 = -_4846;
    float _4868 = fma(_4854, _4866, 1.0);
    float _4870 = 1.0 / _4776;
    float _4872 = -_4756;
    float _4874 = fma(_4830, _4844, _4872);
    float _4876 = fma(_4724, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4862);
    float _4878 = _4834 * _4708;
    float _4880 = _4538;
    float _4882 = _4864;
    float _4884 = _4876;
    if (!_4418)
    {
        float _4886 = rint(_4574);
        float _4888 = precise::max(_4886, 0.0);
        uint _4890 = uint(_4888);
        uint _4892 = clamp(_4890, 0u, 65535u);
        _4880 = as_type<float>(_4892);
    }
    float _4894 = _4880;
    float _4896 = _4848 * 0.693147182464599609375;
    float _4898 = fma(_4874, 0.5, 0.5);
    float2 _12884 = float2(_4414, _4742);
    float _4900 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12884, float2(0.0), isnan(_12884)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12884, float2(0.0), isnan(_12884)), level(0.0)).x;
    float _4902 = _4896 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4904 = _4840;
    if (_4820)
    {
        float _4906 = rint(_4840);
        float _4908 = precise::max(_4906, 0.0);
        uint _4910 = uint(_4908);
        uint _4912 = clamp(_4910, 0u, 65535u);
        _4904 = as_type<float>(_4912);
    }
    float _4914 = _4904;
    float _4916 = _4864 * _4870;
    float _4918 = _4876 * _4870;
    float _4920 = fma(_4916, 0.5, 0.5);
    float _4922 = fma(_4918, -0.5, 0.5);
    float _4924 = _4894;
    if (!_4418)
    {
        float3 _12930 = float3(_4860, _4808, float(as_type<int>(_4894)));
        float3 _12934 = select(_12930, float3(0.0), isnan(_12930));
        float _4926 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12934.xy, uint(rint(_12934.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12934.xy, uint(rint(_12934.z)), level(0.0)).x;
        _4924 = _4926;
    }
    float _4928 = _4924;
    float _4930 = _4870;
    if (_4820)
    {
        float3 _12949 = float3(_4760, _4790, float(as_type<int>(_4914)));
        float3 _12951 = select(_12949, float3(0.0), isnan(_12949));
        float _4932 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12951.xy, uint(rint(_12951.z)), _4878, level(0.0));
        _4930 = _4932;
    }
    float _4934 = _4930;
    float3 _12961 = float3(_4920, _4922, _4902);
    float _4936 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12961, float3(0.0), isnan(_12961)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12961, float3(0.0), isnan(_12961)), level(0.0)).x;
    float3 _12970 = float3(_4920, _4922, _4902);
    float4 _4939 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12970, float3(0.0), isnan(_12970)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12970, float3(0.0), isnan(_12970)), level(0.0)).xyzw;
    float _4941 = _4939.x;
    float _4943 = _4939.y;
    float _4945 = _4939.z;
    float _4947 = _4939.w;
    float2 _12986 = float2(_4868, _4898);
    float3 _4951 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12986, float2(0.0), isnan(_12986)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12986, float2(0.0), isnan(_12986)), level(0.0)).xyz;
    float _4953 = _4951.x;
    float _4955 = _4951.y;
    float _4957 = _4951.z;
    float _4959 = abs(_4248);
    float _4961 = log2(_4959);
    float _4963 = _4726 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4965 = fma(_4734, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4963);
    float _4967 = fma(_4710, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4965);
    float _4969 = _4961 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4971 = exp2(_4969);
    float _4973 = fma(_4724, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4967);
    float _4975 = _4864 + _4776;
    float _4977 = _4776 * 0.5;
    float _4979 = _4973 + _4776;
    out.gl_Position.x = _4864;
    out.gl_Position.y = _4876;
    out.gl_Position.z = _4973;
    out.gl_Position.w = _4776;
    float _4981 = _4975 * 0.5;
    float _4983 = fma(_4876, -0.5, _4977);
    float _4985 = _4979 * 0.5;
    out.m_98.x = _4981;
    out.m_98.y = _4983;
    out.m_98.z = _4985;
    out.m_98.w = _4776;
    float _4987 = fma(_4971, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4989 = precise::clamp(_4987, 0.0, 1.0);
    float _4991 = fma(_4989, -2.0, 3.0);
    bool _4993 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4995 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4997 = _4993 || _4995;
    bool _4999 = isnan(0.5);
    bool _5001 = _4997 || _4999;
    float _5003 = _4770 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5005 = _4989 * _4989;
    float _5007 = _5005 * _4991;
    float _5009 = exp2(_5003);
    bool _5011 = _4248 <= 8000.0;
    bool _5013 = isnan(_4248);
    bool _5015 = _5011 || _5013;
    bool _5017 = isnan(8000.0);
    bool _5019 = _5015 || _5017;
    float _5021 = float(_5019);
    float _5023 = -_5007;
    float _5025 = _5023 + 1.0;
    float _5027 = _4973;
    if (_5001)
    {
        _4882 = 1.0;
    }
    float _5029 = _4882;
    float _5031 = fma(_5025, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5007);
    float _5033 = _5021 * _5031;
    float _5035 = _5029;
    if (!_5001)
    {
        float _5037 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _5039 = _5037 * 0.15915493667125701904296875;
        float _5041 = _5039 * 6.283185482025146484375;
        float _5043 = cos(_5041);
        float _5045 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _5047 = _5045 * 0.15915493667125701904296875;
        float _5049 = _5039 * 6.283185482025146484375;
        float _5051 = sin(_5049);
        float _5053 = 1.0 / _5043;
        float _5055 = _5047 * 6.283185482025146484375;
        float _5057 = cos(_5055);
        float _5059 = _5051 * _5053;
        float _5061 = _5047 * 6.283185482025146484375;
        float _5063 = sin(_5061);
        float _5065 = _5057 * _5059;
        float _5067 = 1.0 / _5065;
        float _5069 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5071 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5069;
        float _5073 = 1.0 / _5071;
        float _5075 = _5063 * _5067;
        float _5077 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5079 = fma(_4248, _5075, _5077);
        float _5081 = _5079 * _5073;
        float _5083 = precise::clamp(_5081, 0.0, 1.0);
        _5027 = _5073;
        _4884 = _5067;
        _5035 = _5083;
    }
    float _5085 = _5027;
    float _5087 = _4884;
    float _5089 = _5035;
    float _5091 = _5033 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5093 = -_4900;
    float _5095 = _5093 + 1.0;
    float _5097 = -_5009;
    float _5099 = _5097 + 1.0;
    float _5101 = _5085;
    float _5103 = _5087;
    float _5105 = _5091;
    if (!_4820)
    {
        _5101 = 1.0;
    }
    float _5107 = _5101;
    float _5109 = _5095 * _5091;
    float _5111 = precise::clamp(_5109, 0.0, 1.0);
    float _5113 = _5107;
    if (_4820)
    {
        bool _5115 = _4934 >= _4878;
        bool _5117 = isnan(_4934);
        bool _5119 = _5115 || _5117;
        bool _5121 = isnan(_4878);
        bool _5123 = _5119 || _5121;
        float _5125 = float(_5123);
        _5113 = _5125;
    }
    float _5127 = _5113;
    float _5129 = _5099 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5131 = _5129;
    if (_4418)
    {
        _5103 = 1.0;
    }
    float _5133 = _5103;
    float _5135 = _5133;
    if (!_4418)
    {
        int _5137 = _4456 << 4;
        int _5139 = _5137 + 2048;
        uint _5141 = uint(int(uint(_5139) >> uint(2)));
        uint _5143 = uint(int(uint(int(_5141)) >> uint(2)));
        int _5145 = int(_5141) & 3;
        float _5147 = (*spvDescriptorSet0.vp_c15)._m0[int(_5143)][_5145];
        int _5149 = int(_5141) + 1;
        uint _5151 = uint(int(uint(_5149) >> uint(2)));
        int _5153 = _5149 & 3;
        float _5155 = (*spvDescriptorSet0.vp_c15)._m0[int(_5151)][_5153];
        int _5157 = _5139 + 8;
        uint _5159 = uint(int(uint(_5157) >> uint(2)));
        uint _5161 = uint(int(uint(int(_5159)) >> uint(2)));
        int _5163 = int(_5159) & 3;
        float _5165 = (*spvDescriptorSet0.vp_c15)._m0[int(_5161)][_5163];
        int _5167 = int(_5159) + 1;
        uint _5169 = uint(int(uint(_5167) >> uint(2)));
        int _5171 = _5167 & 3;
        float _5173 = (*spvDescriptorSet0.vp_c15)._m0[int(_5169)][_5171];
        float _5175 = _4234 * _5155;
        float _5177 = fma(_3518, _5147, _5175);
        float _5179 = fma(_3546, _5165, _5177);
        float _5181 = _5179 + _5173;
        float _5183 = precise::clamp(_5181, 0.0, 1.0);
        float _5185 = -_5183;
        float _5187 = _5185 + _4928;
        float _5189 = fma(_5187, 500.0, 1.5);
        float _5191 = exp2(_5189);
        float _5193 = 0.0 + _5191;
        float _5195 = precise::clamp(_5193, 0.0, 1.0);
        _5135 = _5195;
        _5105 = _5147;
        _4280 = 500.0;
    }
    float _5197 = _5135;
    float _5199 = _5105;
    float _5201 = _4280;
    float _5203 = _5127 * _5197;
    float _5205 = _5129 * _4936;
    float _5207 = -_5111;
    float _5209 = fma(_5207, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5211 = -_5129;
    float _5213 = _5211 + 1.0;
    bool _5215 = _4236 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5217 = isnan(_4236);
    bool _5219 = _5215 || _5217;
    bool _5221 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5223 = _5219 || _5221;
    float _5225 = _4947 * _5205;
    float _5227 = -_5203;
    float _5229 = fma(_5227, _5209, 1.0);
    float _5231 = precise::clamp(_5229, 0.0, 1.0);
    float _5233 = _4957 * _5205;
    float _5235 = _4947 * _5213;
    float _5237 = fma(_4953, _5225, _4941);
    float _5239 = fma(_4955, _5225, _4943);
    float _5241 = _5231 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5243 = fma(_4947, _5233, _4945);
    float _5245 = _5089 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_100.x = _5241;
    float _5247 = _5199;
    float _5249 = _5201;
    float _5251 = _5213;
    float _5253 = _5231;
    float _5255 = _5225;
    if (!_5223)
    {
        _5131 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5257 = _5131;
    float _5259 = _5257;
    float _5261 = _5257;
    if (!_5223)
    {
        _5247 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5263 = _5247;
    out.m_102.x = _5237;
    out.m_102.y = _5239;
    out.m_102.z = _5243;
    out.m_102.w = _5235;
    float _5265 = _5263;
    float _5267 = _5263;
    if (!_5223)
    {
        _5249 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5269 = _5249;
    float _5271 = _5269;
    float _5273 = _5269;
    if (!_5223)
    {
        _5251 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5275 = _5251;
    float _5277 = _5275;
    float _5279 = _5275;
    if (!_5223)
    {
        _5253 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5281 = _5253;
    float _5283 = _5281;
    float _5285 = _5281;
    if (!_5223)
    {
        _5255 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5287 = _5255;
    bool _5289 = !_5223;
    float _5291 = _5287;
    float _5293 = _5287;
    if (!_5289)
    {
        bool _5295 = _4236 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5297 = isnan(_4236);
        bool _5299 = _5295 || _5297;
        bool _5301 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5303 = _5299 || _5301;
        if (!_5303)
        {
            float _5305 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5307 = _4236 + _5305;
            float _5309 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5311 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5309;
            float _5313 = 1.0 / _5311;
            float _5315 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5317 = _5315 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5319 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5321 = _5319 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5323 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5325 = _5323 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5327 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5329 = _5327 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5331 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5333 = _5331 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5335 = _5307 * _5313;
            float _5337 = precise::clamp(_5335, 0.0, 1.0);
            float _5339 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5341 = _5339 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5343 = fma(_5337, _5317, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5345 = fma(_5337, _5341, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5347 = fma(_5337, _5321, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5349 = fma(_5337, _5325, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5351 = fma(_5337, _5329, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5353 = fma(_5337, _5333, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5267 = _5343;
            _5285 = _5351;
            _5261 = _5345;
            _5279 = _5349;
            _5273 = _5347;
            _5293 = _5353;
            _5355 = true;
        }
        else
        {
            bool _5357 = _4236 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5359 = isnan(_4236);
            bool _5361 = _5357 || _5359;
            bool _5363 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5365 = _5361 || _5363;
            if (!_5365)
            {
                _5259 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5367 = _5259;
            _5261 = _5367;
            if (!_5365)
            {
                _5265 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5369 = _5265;
            _5267 = _5369;
            if (!_5365)
            {
                _5271 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5371 = _5271;
            _5273 = _5371;
            if (!_5365)
            {
                _5277 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5373 = _5277;
            _5279 = _5373;
            if (!_5365)
            {
                _5283 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5375 = _5283;
            _5285 = _5375;
            if (!_5365)
            {
                _5291 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5377 = _5291;
            bool _5379 = !_5365;
            _5293 = _5377;
            if (!_5379)
            {
                bool _5381 = _4236 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5383 = isnan(_4236);
                bool _5385 = _5381 || _5383;
                bool _5387 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5389 = _5385 || _5387;
                if (!_5389)
                {
                    float _5391 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5393 = _4236 + _5391;
                    float _5395 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5397 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5395;
                    float _5399 = 1.0 / _5397;
                    float _5401 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5403 = _5401 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5405 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5407 = _5405 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5409 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5411 = _5409 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5413 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5415 = _5413 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5417 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5419 = _5417 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5421 = _5393 * _5399;
                    float _5423 = precise::clamp(_5421, 0.0, 1.0);
                    float _5425 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5427 = _5425 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5429 = fma(_5423, _5403, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5431 = fma(_5423, _5427, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5433 = fma(_5423, _5407, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5435 = fma(_5423, _5411, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5437 = fma(_5423, _5415, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5439 = fma(_5423, _5419, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5267 = _5429;
                    _5285 = _5437;
                    _5261 = _5431;
                    _5279 = _5435;
                    _5273 = _5433;
                    _5293 = _5439;
                    _5355 = true;
                }
                else
                {
                    _5267 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5285 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5261 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5279 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5273 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5293 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5355 = false;
    float _5441 = _5267;
    float _5443 = _5285;
    float _5445 = _5261;
    float _5447 = _5279;
    float _5449 = _5273;
    float _5451 = _5293;
    float _5453 = fma(_3952, -0.5, 0.5);
    float _5455 = precise::clamp(_5453, 0.0, 1.0);
    float _5457 = -_5441;
    float _5459 = _5457 + _5443;
    float _5461 = _5245 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5463 = -_5445;
    float _5465 = _5463 + _5447;
    out.m_104.x = 0.0;
    float _5467 = fma(_5455, _5459, _5441);
    float _5469 = fma(_5455, _5465, _5445);
    out.m_65.x = _5461;
    float _5471 = -_5449;
    float _5473 = _5471 + _5451;
    float _5475 = _5467 * 0.586610972881317138671875;
    bool _5477 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5479 = fma(_5455, _5473, _5449);
    float _5481 = fma(_5469, 0.298911988735198974609375, _5475);
    bool _5483 = _5089 > 0.0;
    bool _5485 = isnan(_5089);
    bool _5487 = _5483 || _5485;
    bool _5489 = isnan(0.0);
    bool _5491 = _5487 || _5489;
    float _5493 = fma(_5479, 0.114477999508380889892578125, _5481);
    float _5495 = -_5493;
    float _5497 = _5469 + _5495;
    float _5499 = -_5493;
    float _5501 = _5467 + _5499;
    float _5503 = -_5493;
    float _5505 = _5479 + _5503;
    float _5507 = fma(_5497, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5493);
    float _5509 = fma(_5501, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5493);
    float _5511 = fma(_5505, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5493);
    bool _5513 = !_5477;
    if (!_5513)
    {
        float _5515 = -_4182;
        float _5517 = _5515 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5519 = -_4186;
        float _5521 = _5519 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5523 = -_4192;
        float _5525 = _5523 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5527 = _5517 * _5517;
        float _5529 = fma(_5521, _5521, _5527);
        float _5531 = fma(_5525, _5525, _5529);
        float _5533 = sqrt(_5531);
        float _5535 = rsqrt(_5531);
        float _5537 = -_5533;
        float _5539 = _5537 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5541 = _5539 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5543 = precise::clamp(_5541, 0.0, 1.0);
        float _5545 = _5521 * _5535;
        float _5547 = _5517 * _5535;
        float _5549 = abs(_5543);
        float _5551 = log2(_5549);
        float _5553 = _5525 * _5535;
        float _5555 = _5545 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5557 = _3952 * _5547;
        float _5559 = -_5547;
        float _5561 = -_5555;
        float _5563 = fma(_5559, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5561);
        float _5565 = fma(_3956, _5545, _5557);
        float _5567 = -_5553;
        float _5569 = fma(_5567, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5563);
        float _5571 = fma(_3958, _5553, _5565);
        float _5573 = precise::clamp(_5571, 0.0, 1.0);
        float _5575 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5577 = _5569 + _5575;
        float _5579 = _5551 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5581 = _5577 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5583 = precise::clamp(_5581, 0.0, 1.0);
        float _5585 = exp2(_5579);
        float _5587 = _5585 * _5583;
        float _5589 = _5573 * _5587;
        float _5591 = _5589 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5593 = _5589 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5595 = _5589 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _5591;
        out.m_104.y = _5593;
        out.m_104.z = _5595;
    }
    out.m_106.x = _5507;
    out.m_106.y = _5509;
    out.m_106.z = _5511;
    if (_5491)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_65.x = 0.0;
    float _5597 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5597;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5355 = false;
    bool _4006 = false;
    bool _449 = false;
    bool _343 = false;
    bool _247 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_58.w;
    float _122 = in.m_60.w;
    float _124 = trunc(_120);
    int _127 = int(_124);
    float _129 = -_122;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_63.y = _131;
    bool _135 = _127 >= 1;
    float _137 = 0.0;
    float _139 = as_type<float>(_127);
    float _141 = _131;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _137;
    if (!_135)
    {
        out.m_65.x = 0.0;
    }
    int _145 = 0;
    if (!_135)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    int _151 = _149;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5666 = as_type<float>(_149);
        out.gl_Position.z = _5666;
    }
    if (!_135)
    {
        return out;
    }
    bool _153 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_122);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = float(_127);
    bool _165 = _131 >= _163;
    bool _167 = !_161;
    bool _169 = _165 || _167;
    float _171 = 1.0 / _163;
    if (_169)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _139;
    if (_169)
    {
        out.m_65.x = 0.0;
    }
    float _175 = _131 * _171;
    float _177 = _175;
    if (_169)
    {
        float _179 = _173 * 5.0;
        _151 = as_type<int>(_179);
    }
    int _181 = _151;
    out.m_63.x = _175;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5729 = as_type<float>(_181);
        out.gl_Position.z = _5729;
    }
    if (_169)
    {
        return out;
    }
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_70.x;
    float _187 = in.m_70.y;
    float _189 = in.m_70.z;
    int _191 = as_type<int>(_183) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_183) & 2;
    bool _197 = _195 != 0;
    bool _199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _201 = _187 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _203 = _187 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _205 = _187 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _207 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[4].x, _201);
    float _209 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[5].x, _203);
    float _211 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[6].x, _205);
    float _213 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[4].z, _207);
    float _215 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[5].z, _209);
    float _217 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[6].z, _211);
    bool _219 = !_193;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_197;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_199;
    float _245;
    if (!_227)
    {
        float _229 = in.m_72.x;
        float _231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _233 = _229 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _237 = _235 * _231;
        float _239 = floor(_237);
        float _241 = -_239;
        float _243 = _237 + _241;
        _245 = _243;
        _247 = true;
    }
    else
    {
        _245 = _175;
    }
    _247 = false;
    float _249 = _245;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = _249 + _251;
    bool _255 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _257 = isnan(_249);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -_265;
    float _273 = _271 + 1.0;
    bool _275 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _277 = isnan(_249);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _287;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = 1.0 / _269;
    float _295 = _285 * _273;
    float _297 = -_285;
    float _299 = _297 + 1.0;
    float _301 = _253 * _293;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _303;
    float _307 = fma(_289, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _309 = fma(_305, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _311 = _307 * _295;
    float _313 = _309 * _295;
    float _315 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].x, _311);
    float _317 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].y, _313);
    float _319 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[144].x, _315);
    float _321 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[144].y, _317);
    bool _323 = !_291;
    float _341;
    if (!_323)
    {
        float _325 = in.m_72.x;
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _329 = _325 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        _341 = _175;
    }
    _343 = false;
    float _345 = _341;
    float _347 = in.m_74.x;
    float _349 = in.m_74.y;
    bool _351 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _353 = isnan(_345);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _367 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _369 = isnan(_345);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _385 = _345 + _383;
    float _387 = -_361;
    float _389 = _387 + 1.0;
    bool _391 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _393 = 1.0 / _365;
    float _395 = _377 * _389;
    float _397 = -_377;
    float _399 = _397 + 1.0;
    float _401 = _321 * _349;
    float _403 = _319 * _347;
    float _405 = _381 * _393;
    float _407 = fma(_405, _385, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _411 = _407 * _395;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _415 = _409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _417 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[115].x, _411);
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _421 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[116].x, _417);
    float _425 = _419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _427 = _423 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_76.x = _425;
    out.m_76.y = _421;
    out.m_76.z = _415;
    out.m_76.w = _427;
    bool _429 = !_391;
    float _447;
    if (!_429)
    {
        float _431 = in.m_72.x;
        float _433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _435 = _431 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _439 = _437 * _433;
        float _441 = floor(_439);
        float _443 = -_441;
        float _445 = _439 + _443;
        _447 = _445;
        _449 = true;
    }
    else
    {
        _447 = _175;
    }
    _449 = false;
    float _451 = _447;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _455 = _451 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _465 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _467 = isnan(_451);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _477;
    float _481 = 1.0 / _459;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _487 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _489 = isnan(_451);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _503 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _505 = isnan(_451);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = 1.0 / _463;
    float _517 = -_497;
    float _519 = _517 + 1.0;
    bool _521 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _523 = _475 * _519;
    float _525 = _479 * _481;
    bool _527 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _529 = isnan(_451);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -_475;
    float _541 = _539 + 1.0;
    float _543 = 1.0 / _485;
    float _545 = fma(_525, _455, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _547;
    float _551 = _537 * _541;
    float _553 = -_537;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _561 = 1.0 / _501;
    float _563 = _513 * _555;
    float _565 = _559 * _515;
    float _567 = -_513;
    float _569 = _567 + 1.0;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _573 = _451 + _571;
    float _575 = _545 * _563;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _579 = _451 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _585 = _549 * _543;
    bool _587 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _589 = isnan(_451);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = fma(_565, _579, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _601 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[131].x, _575);
    float _603 = fma(_585, _573, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _607 = _451 + _605;
    float _609 = -_597;
    float _611 = _609 + 1.0;
    float _613 = fma(_599, _551, _601);
    float _615 = _583 * _561;
    float _617 = _497 * _611;
    float _619 = fma(_603, _523, _613);
    float _621 = fma(_615, _607, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _625 = fma(_621, _617, _619);
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _629 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _633 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[135].x, _625);
    float _635 = _627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _639 = _633 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _629;
    out.m_78.y = _635;
    out.m_78.z = _637;
    out.m_78.w = _639;
    bool _641 = !_521;
    float _643 = _551;
    if (!_641)
    {
        float _645 = in.m_72.x;
        float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _649 = _645 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _651 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _653 = _651 * _647;
        float _655 = floor(_653);
        float _657 = -_655;
        float _659 = _653 + _657;
        _177 = _659;
    }
    float _661 = _177;
    float _663 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _665 = int(_663);
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _669 = _667 != 0;
    float _671 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _673 = int(_671);
    float _675 = float(_665);
    float _677 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _679 = int(_677);
    if (_669)
    {
        _643 = 1.0;
    }
    float _681 = _643;
    float _683 = float(_673);
    float _685 = 1.0 / _675;
    float _687 = 1.0 / _683;
    float _689 = float(uint(_679));
    int _691 = ~_679;
    int _693 = _691 + 1;
    float _695 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _697 = int(_695);
    float _699 = _685 * _131;
    float _701 = _683;
    float _703 = _685;
    float _705 = _681;
    if (_669)
    {
        float _707 = in.m_72.x;
        float _709 = in.m_72.y;
        _701 = _707;
        _703 = _709;
    }
    float _711 = _701;
    float _713 = _703;
    float _715 = _687 * _131;
    float _717 = 1.0 / _689;
    float _719 = float(uint(_697));
    float _721 = trunc(_715);
    int _723 = int(_721);
    float _725 = 1.0 / _719;
    int _727 = as_type<int>(_717) + (-2);
    int _729 = as_type<int>(_717);
    if (_669)
    {
        _729 = 0;
    }
    int _731 = _729;
    float _733 = 0.0;
    float _735 = _711;
    float _737 = _713;
    int _739 = _731;
    if (_669)
    {
        _733 = _713;
    }
    float _741 = _733;
    float _743 = trunc(_699);
    int _745 = int(_743);
    float _747 = float(uint(_723));
    float _749 = as_type<float>(_727) * _747;
    float _751 = _747;
    float _753 = _741;
    if (_669)
    {
        _751 = _711;
    }
    float _755 = _751;
    float _757 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _759 = int(_757);
    int _761 = as_type<int>(_725) + (-2);
    float _763 = 0.0;
    float _765 = _755;
    if (_669)
    {
        _763 = _755;
    }
    float _767 = _763;
    float _769 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _771 = int(_769);
    float _773 = float(uint(_745));
    float _775 = as_type<float>(_761) * _773;
    float _777 = _773;
    float _779 = _767;
    if (_669)
    {
        _777 = 1.0;
    }
    float _781 = _777;
    float _783 = trunc(_749);
    float _785 = precise::max(_783, 0.0);
    uint _788 = uint(_785);
    float _790 = float(uint(_759));
    float _792 = trunc(_775);
    float _794 = precise::max(_792, 0.0);
    uint _796 = uint(_794);
    float _798 = float(_771);
    float _800 = 1.0 / _798;
    float _802 = 1.0 / _790;
    float _804 = _798;
    int _806 = as_type<int>(_790);
    float _808 = _781;
    if (_669)
    {
        _804 = _755;
    }
    float _810 = _804;
    float _812 = _810;
    if (_669)
    {
        _806 = 0;
    }
    int _814 = _806;
    int _816 = _814;
    if (!_669)
    {
        float _818 = in.m_72.x;
        float _820 = in.m_72.y;
        float _822 = in.m_72.z;
        float _824 = _818 * 3.1415927410125732421875;
        float _826 = _824 * 0.15915493667125701904296875;
        float _828 = _820 * 3.1415927410125732421875;
        float _830 = _828 * 0.15915493667125701904296875;
        float _832 = _826 * 6.283185482025146484375;
        float _834 = sin(_832);
        float _836 = _830 * 6.283185482025146484375;
        float _838 = sin(_836);
        _705 = 7.345489978790283203125;
        _735 = _818;
        _808 = 5.839270114898681640625;
        _812 = _822;
        _765 = _820;
        _737 = _820;
        _739 = 1;
        _753 = _838;
        _816 = 2;
        _779 = _834;
    }
    float _840 = _705;
    float _842 = _735;
    float _844 = _808;
    float _846 = _812;
    float _848 = _765;
    float _850 = _737;
    int _852 = _739;
    float _854 = _753;
    int _856 = _816;
    float _858 = _779;
    int _860 = _693 * int(_788);
    int _862 = _860 + _723;
    int _864 = ~_697;
    int _866 = _864 + 1;
    float _868 = _800 * _131;
    float _870 = _840 * _842;
    float _872 = in.m_72.z;
    float _874 = in.m_72.w;
    float _876 = _844 * _846;
    float _878 = float(uint(_862));
    int _880 = _866 * int(_796);
    int _882 = _880 + _745;
    float _884 = floor(_870);
    float _886 = float(_679);
    float _888 = _840 * _848;
    float _890 = as_type<float>(_727) * _878;
    float _892 = float(uint(_882));
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _896 = _661 + _894;
    float _898 = float(_723);
    float _900 = _850 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _902 = trunc(_868);
    int _904 = int(_902);
    float _906 = as_type<float>(_761) * _892;
    bool _908 = _898 >= _886;
    bool _910 = isnan(_898);
    bool _912 = _908 || _910;
    bool _914 = isnan(_886);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = _842 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _922 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _924 = as_type<int>(_802) + (-2);
    float _926 = trunc(_890);
    float _928 = precise::max(_926, 0.0);
    uint _930 = uint(_928);
    float _932 = -_884;
    float _934 = _870 + _932;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _938 = _936 != 0;
    bool _940 = _874 > 0.5;
    bool _942 = _872 > 0.5;
    float _944 = floor(_876);
    float _946 = float(uint(_904));
    bool _948 = _850 > 0.5;
    int _950 = ~_679;
    int _952 = _950 + 1;
    float _954 = as_type<float>(_924) * _946;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _958 = _956 != 0;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _962 = _960 != 0;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _966 = _964 != 0;
    float _968 = trunc(_906);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    int _974 = int(_788) + int(_930);
    int _976 = ~_697;
    int _978 = _976 + 1;
    float _980 = -_221;
    int _982 = _948 ? as_type<int>(_980) : as_type<int>(_221);
    float _984 = -_944;
    float _986 = _876 + _984;
    float _988 = -_225;
    int _990 = _942 ? as_type<int>(_988) : as_type<int>(_225);
    float _992 = trunc(_954);
    float _994 = precise::max(_992, 0.0);
    uint _996 = uint(_994);
    int _998 = _952 * _974;
    int _1000 = _998 + _723;
    bool _1002 = !_966;
    float _1004 = _1002 ? _225 : as_type<float>(_990);
    float _1006 = _934 * _886;
    int _1008 = int(_796) + int(_972);
    float _1010 = floor(_888);
    int _1012 = int(_940);
    int _1014 = _942 ? 2 : 0;
    int _1016 = _1012 | _1014;
    int _1018 = _938 ? 4 : 0;
    int _1020 = _1016 | _1018;
    int _1022 = _958 ? 8 : 0;
    int _1024 = _1020 | _1022;
    int _1026 = _962 ? 16 : 0;
    int _1028 = _1024 | _1026;
    int _1030 = _966 ? 32 : 0;
    int _1032 = _1028 | _1030;
    int _1034 = _948 ? 64 : 0;
    int _1036 = _1032 | _1034;
    int _1038 = _1036 & 64;
    bool _1040 = !_962;
    float _1042 = _1040 ? _221 : as_type<float>(_982);
    int _1044 = _978 * _1008;
    int _1046 = _1044 + _745;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1050 = _1048 != 0;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1054 = _1052 != 0;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1058 = _1056 != 0;
    bool _1060 = !_938;
    int _1062 = _1060 ? 0 : 1;
    float _1064 = trunc(_1006);
    int _1066 = int(_1064);
    float _1068 = float(_697);
    float _1070 = float(_745);
    bool _1072 = uint(_1000) >= uint(_679);
    float _1074 = _986 * _1068;
    int _1076 = ~_759;
    int _1078 = _1076 + 1;
    float _1080 = trunc(_918);
    int _1082 = int(_1080);
    bool _1084 = !_1054;
    int _1086 = _1084 ? 0 : 1;
    bool _1088 = !_1050;
    int _1090 = _1088 ? 0 : 1;
    int _1092 = _1078 * int(_996);
    int _1094 = _1092 + _904;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1098 = _1096 != 0;
    bool _1100 = uint(_1046) >= uint(_697);
    float _1102 = trunc(_1074);
    int _1104 = int(_1102);
    bool _1106 = _1070 >= _1068;
    bool _1108 = isnan(_1070);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(_1068);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    bool _1118 = !_1058;
    int _1120 = _1118 ? 0 : 1;
    bool _1122 = !_1098;
    int _1124 = _1122 ? 0 : 1;
    bool _1126 = !_1100;
    int _1128 = _1126 ? 0 : (-1);
    float _1130 = trunc(_1116);
    int _1132 = int(_1130);
    bool _1134 = !_1072;
    int _1136 = _1134 ? 0 : (-1);
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1140 = _1138 != 0;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1144 = _1142 != 0;
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1148 = _1146 != 0;
    int _1150 = abs(_1062);
    int _1152 = ~_974;
    int _1154 = _1152 + _1136;
    int _1156 = _1154 + 1;
    float _1158 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1160 = log2(_1158);
    float _1162 = -_1010;
    float _1164 = _888 + _1162;
    float _1166 = float(uint(_1094));
    int _1168 = _1066 * _1150;
    int _1170 = _1168 + _723;
    bool _1172 = !_1144;
    int _1174 = _1172 ? 0 : 1;
    int _1176 = _679 * _1156;
    int _1178 = _1176 + _723;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1182 = _1180 != 0;
    float _1184 = as_type<float>(_924) * _1166;
    bool _1186 = _1038 != 0;
    float _1188 = _171 * _131;
    int _1190 = ~_1008;
    int _1192 = _1190 + _1128;
    int _1194 = _1192 + 1;
    bool _1196 = !_1182;
    int _1198 = _1196 ? 0 : 1;
    float _1200 = _886 * _1188;
    bool _1202 = _679 == 0;
    int _1204 = _697 * _1194;
    int _1206 = _1204 + _745;
    bool _1208 = !_1140;
    int _1210 = _1208 ? 0 : 1;
    float _1212 = trunc(_1184);
    float _1214 = precise::max(_1212, 0.0);
    uint _1216 = uint(_1214);
    bool _1218 = _697 == 0;
    float _1220 = _1068 * _1188;
    int _1222 = ~_1082;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    bool _1228 = !_1202;
    int _1230 = _1228 ? _1178 : (-1);
    int _1232 = ~_1132;
    int _1234 = _1232 + 1;
    int _1236 = _1234 + 1;
    float _1238 = trunc(_1200);
    int _1240 = int(_1238);
    bool _1242 = !_1218;
    int _1244 = _1242 ? _1206 : (-1);
    int _1246 = _1230 * _1226;
    int _1248 = _679 + (-1);
    int _1250 = abs(_1086);
    int _1252 = _1244 * _1236;
    int _1254 = _697 + (-1);
    int _1256 = _1082 * _1248;
    int _1258 = _1256 + _1246;
    int _1260 = abs(_1174);
    float _1262 = trunc(_1220);
    int _1264 = int(_1262);
    int _1266 = abs(_1090);
    int _1268 = _1132 * _1254;
    int _1270 = _1268 + _1252;
    int _1272 = _1258 * _1250;
    int _1274 = abs(_1198);
    float _1276 = _842 * 2.0;
    int _1278 = ~_759;
    int _1280 = _1278 + 1;
    int _1282 = _1270 * _1260;
    int _1284 = abs(_1120);
    int _1286 = _1240 * _1266;
    int _1288 = _1286 + _1272;
    int _1290 = abs(_1124);
    int _1292 = _1104 * _1274;
    int _1294 = _1292 + _745;
    int _1296 = int(_996) + int(_1216);
    int _1298 = _1170 * _1284;
    int _1300 = _1298 + _1288;
    float _1302 = floor(_1276);
    int _1304 = abs(_1210);
    int _1306 = _1280 * _1296;
    int _1308 = _1306 + _904;
    float _1310 = -_225;
    int _1312 = _940 ? as_type<int>(_1310) : as_type<int>(_225);
    int _1314 = _1066 * _1290;
    int _1316 = _1314 + _1300;
    float _1318 = -_221;
    int _1320 = _942 ? as_type<int>(_1318) : as_type<int>(_221);
    int _1322 = _1264 * _1304;
    int _1324 = _1322 + _1282;
    bool _1326 = uint(_1308) >= uint(_759);
    float _1328 = float(_759);
    float _1330 = float(_904);
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1334 = _1332 != 0;
    float _1336 = _1328 * _1188;
    bool _1338 = !_1148;
    int _1340 = _1338 ? 0 : 1;
    float _1342 = float(uint(_1316));
    bool _1344 = _1330 >= _1328;
    bool _1346 = isnan(_1330);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan(_1328);
    bool _1352 = _1348 || _1350;
    float _1354 = float(_1352);
    float _1356 = _1164 * _1328;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1360 = _1358 != 0;
    float _1362 = as_type<float>(_727) * _1342;
    bool _1364 = !_1334;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = trunc(_1336);
    int _1370 = int(_1368);
    int _1372 = abs(_1340);
    bool _1374 = !_958;
    float _1376 = _1374 ? _225 : as_type<float>(_1312);
    bool _1378 = !_1360;
    int _1380 = _1378 ? 0 : 1;
    int _1382 = abs(_1366);
    float _1384 = trunc(_1362);
    float _1386 = precise::max(_1384, 0.0);
    uint _1388 = uint(_1386);
    bool _1390 = !_1326;
    int _1392 = _1390 ? 0 : (-1);
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1396 = _1394 != 0;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1400 = _1398 != 0;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1408 = _1406 != 0;
    int _1410 = _1294 * _1372;
    int _1412 = _1410 + _1324;
    float _1414 = trunc(_1354);
    int _1416 = int(_1414);
    int _1418 = ~_679;
    int _1420 = _1418 + 1;
    bool _1422 = !_1400;
    int _1424 = _1422 ? 0 : 1;
    int _1426 = _1104 * _1382;
    int _1428 = _1426 + _1412;
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1432 = _1430 != 0;
    int _1434 = ~_1296;
    int _1436 = _1434 + _1392;
    int _1438 = _1436 + 1;
    int _1440 = _1420 * int(_1388);
    int _1442 = _1440 + _1316;
    float _1444 = float(uint(_1428));
    float _1446 = trunc(_1356);
    int _1448 = int(_1446);
    bool _1450 = !_1396;
    int _1452 = _1450 ? 0 : 1;
    int _1454 = _759 * _1438;
    int _1456 = _1454 + _904;
    bool _1458 = _759 == 0;
    float _1460 = as_type<float>(_761) * _1444;
    float _1462 = float(uint(_1442));
    int _1464 = ~_1416;
    int _1466 = _1464 + 1;
    int _1468 = _1466 + 1;
    float _1470 = _1444;
    if (_1432)
    {
        float _1472 = in.m_72.w;
        _1470 = _1472;
    }
    float _1474 = _1470;
    bool _1476 = !_1458;
    int _1478 = _1476 ? _1456 : (-1);
    float _1480 = as_type<float>(_727) * _1462;
    float _1482 = trunc(_1460);
    float _1484 = precise::max(_1482, 0.0);
    uint _1486 = uint(_1484);
    int _1488 = abs(_1424);
    int _1490 = _1478 * _1468;
    int _1492 = _759 + (-1);
    int _1494 = abs(_1452);
    float _1496 = trunc(_1480);
    float _1498 = precise::max(_1496, 0.0);
    uint _1500 = uint(_1498);
    int _1502 = abs(_1380);
    int _1504 = _1416 * _1492;
    int _1506 = _1504 + _1490;
    int _1508 = _1506 * _1488;
    int _1510 = ~_697;
    int _1512 = _1510 + 1;
    bool _1514 = _679 == 0;
    int _1516 = _1370 * _1494;
    int _1518 = _1516 + _1508;
    int _1520 = _1448 * _1502;
    int _1522 = _1520 + _904;
    float _1524 = as_type<float>(_1502);
    if (_1432)
    {
        float _1526 = _1474 * 3.1415927410125732421875;
        _1524 = _1526;
    }
    float _1528 = _1524;
    int _1530 = ~_679;
    int _1532 = _1530 + 1;
    int _1534 = _1512 * int(_1486);
    int _1536 = _1534 + _1428;
    float _1538 = _1528;
    if (_1432)
    {
        float _1540 = _1528 * 0.15915493667125701904296875;
        _1538 = _1540;
    }
    float _1542 = _1538;
    int _1544 = int(_1388) + int(_1500);
    bool _1546 = !_1404;
    int _1548 = _1546 ? 0 : 1;
    float _1550 = float(uint(_1536));
    float _1552 = _1542;
    if (_1432)
    {
        float _1554 = _1542 * 6.283185482025146484375;
        float _1556 = sin(_1554);
        _1552 = _1556;
    }
    float _1558 = _1552;
    int _1560 = _1532 * _1544;
    int _1562 = _1560 + _1316;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1566 = _1564 != 0;
    int _1568 = abs(_1548);
    float _1570 = as_type<float>(_761) * _1550;
    bool _1572 = !_1408;
    int _1574 = _1572 ? 0 : 1;
    bool _1576 = uint(_1562) >= uint(_679);
    int _1578 = _1522 * _1568;
    int _1580 = _1578 + _1518;
    float _1582 = float(uint(_1170));
    float _1584 = trunc(_1570);
    float _1586 = precise::max(_1584, 0.0);
    uint _1588 = uint(_1586);
    int _1590 = abs(_1574);
    bool _1592 = !_1576;
    int _1594 = _1592 ? 0 : (-1);
    float _1596 = as_type<float>(_727) * _1582;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1600 = _1598 != 0;
    int _1602 = _1448 * _1590;
    int _1604 = _1602 + _1580;
    int _1606 = ~_1544;
    int _1608 = _1606 + _1594;
    int _1610 = _1608 + 1;
    float _1612 = as_type<float>(_1490);
    bool _1614 = _1600;
    if (_1566)
    {
        float _1616 = in.m_72.x;
        _1612 = _1616;
    }
    float _1618 = _1612;
    bool _1620 = !_1600;
    float _1622 = _1620 ? _221 : as_type<float>(_1320);
    float _1624 = trunc(_1596);
    float _1626 = precise::max(_1624, 0.0);
    uint _1628 = uint(_1626);
    if (_1432)
    {
        bool _1630 = _1558 > 0.5;
        _1614 = _1630;
    }
    bool _1632 = _1614;
    int _1634 = _679 * _1610;
    int _1636 = _1634 + _1316;
    float _1638 = float(uint(_1604));
    int _1640 = ~_679;
    int _1642 = _1640 + 1;
    bool _1644 = !_1514;
    int _1646 = _1644 ? _1636 : (-1);
    float _1648 = as_type<float>(_924) * _1638;
    float _1650 = 0.0;
    float _1652 = _1638;
    if (!_1432)
    {
        _1650 = _221;
    }
    float _1654 = _1650;
    float _1656 = trunc(_1648);
    float _1658 = precise::max(_1656, 0.0);
    uint _1660 = uint(_1658);
    float _1662 = _1654;
    if (_1432)
    {
        float _1664 = -_221;
        float _1666 = _1632 ? _1664 : _221;
        _1662 = _1666;
    }
    float _1668 = _1662;
    int _1670 = _1646 & 3;
    bool _1672 = _1670 != 0;
    int _1674 = _1642 * int(_1628);
    int _1676 = _1674 + _1170;
    int _1678 = _1646 & 3;
    bool _1680 = _1678 != 0;
    int _1682 = _1672 ? 0 : 1;
    bool _1684 = uint(_1678) > 1u;
    if (_1566)
    {
        float _1686 = _1618 * 3.1415927410125732421875;
        _1652 = _1686;
    }
    float _1688 = _1652;
    int _1690 = int(_1486) + int(_1588);
    float _1692 = float(uint(_1294));
    float _1694 = _1688;
    if (_1566)
    {
        float _1696 = _1688 * 0.15915493667125701904296875;
        _1694 = _1696;
    }
    float _1698 = _1694;
    float _1700 = float(uint(_1676));
    int _1702 = ~_759;
    int _1704 = _1702 + 1;
    float _1706 = as_type<float>(_761) * _1692;
    int _1708 = ~_697;
    int _1710 = _1708 + 1;
    float _1712 = as_type<float>(_727) * _1700;
    int _1714 = ~_1682;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    int _1720 = _1704 * int(_1660);
    int _1722 = _1720 + _1604;
    float _1724 = -_225;
    int _1726 = _1186 ? as_type<int>(_1724) : as_type<int>(_225);
    int _1728 = _1710 * _1690;
    int _1730 = _1728 + _1428;
    float _1732 = trunc(_1706);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    int _1738 = _1718;
    if (!_1684)
    {
        int _1740 = ~_1682;
        int _1742 = _1740 + 1;
        _1738 = _1742;
    }
    int _1744 = _1738;
    bool _1746 = uint(_1678) >= 2u;
    int _1748 = ~_697;
    int _1750 = _1748 + 1;
    float _1752 = float(uint(_1722));
    float _1754 = _1698;
    if (_1566)
    {
        float _1756 = _1698 * 6.283185482025146484375;
        float _1758 = sin(_1756);
        _1754 = _1758;
    }
    float _1760 = _1754;
    bool _1762 = uint(_1730) >= uint(_697);
    int _1764 = _1746 ? 0 : 1;
    float _1766 = as_type<float>(_924) * _1752;
    bool _1768 = _1678 != 3;
    float _1770 = trunc(_1712);
    float _1772 = precise::max(_1770, 0.0);
    uint _1774 = uint(_1772);
    bool _1776 = !_1762;
    int _1778 = _1776 ? 0 : (-1);
    int _1780 = _1750 * int(_1736);
    int _1782 = _1780 + _1294;
    int _1784 = ~_1764;
    int _1786 = _1784 + 1;
    int _1788 = _1786 + 1;
    int _1790 = ~_1690;
    int _1792 = _1790 + _1778;
    int _1794 = _1792 + 1;
    float _1796 = trunc(_1766);
    float _1798 = precise::max(_1796, 0.0);
    uint _1800 = uint(_1798);
    float _1802 = float(uint(_1782));
    int _1804 = _697 * _1794;
    int _1806 = _1804 + _1428;
    float _1808 = 0.0;
    int _1810 = _1788;
    bool _1812 = _1768;
    if (!_1566)
    {
        _1808 = _225;
    }
    float _1814 = _1808;
    float _1816 = _1814;
    if (_1768)
    {
        int _1818 = ~_1764;
        int _1820 = _1818 + 1;
        _1810 = _1820;
    }
    int _1822 = _1810;
    float _1824 = as_type<float>(_761) * _1802;
    if (_1566)
    {
        bool _1826 = _1760 > 0.5;
        _1812 = _1826;
    }
    bool _1828 = _1812;
    bool _1830 = !_1218;
    int _1832 = _1830 ? _1806 : (-1);
    int _1834 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1836 = _1834 != 0;
    float _1838 = trunc(_1824);
    float _1840 = precise::max(_1838, 0.0);
    uint _1842 = uint(_1840);
    if (_1566)
    {
        float _1844 = -_225;
        float _1846 = _1828 ? _1844 : _225;
        _1816 = _1846;
    }
    float _1848 = _1816;
    int _1850 = _1832 & 3;
    bool _1852 = _1850 != 0;
    bool _1854 = !_1836;
    float _1856 = _1854 ? _225 : as_type<float>(_1726);
    float _1858 = _1848 + (-0.5);
    bool _1860 = uint(_1850) > 1u;
    int _1862 = int(_1660) + int(_1800);
    int _1864 = ~_759;
    int _1866 = _1864 + 1;
    int _1868 = _1832 & 3;
    bool _1870 = _1868 != 0;
    int _1872 = int(_1628) + int(_1774);
    int _1874 = _1866 * _1862;
    int _1876 = _1874 + _1604;
    int _1878 = ~_679;
    int _1880 = _1878 + 1;
    int _1882 = _1870 ? 0 : 1;
    int _1884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1886 = _1884 != 0;
    int _1888 = _1880 * _1872;
    int _1890 = _1888 + _1170;
    float _1892 = float(uint(_1522));
    bool _1894 = !_1886;
    int _1896 = _1894 ? 0 : 1;
    bool _1898 = uint(_1876) >= uint(_759);
    float _1900 = as_type<float>(_924) * _1892;
    int _1902 = ~_1882;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = _1906;
    if (!_1860)
    {
        int _1910 = ~_1882;
        int _1912 = _1910 + 1;
        _1908 = _1912;
    }
    int _1914 = _1908;
    float _1916 = trunc(_1900);
    float _1918 = precise::max(_1916, 0.0);
    uint _1920 = uint(_1918);
    bool _1922 = uint(_1890) >= uint(_679);
    bool _1924 = !_1898;
    int _1926 = _1924 ? 0 : (-1);
    bool _1928 = _1850 != 3;
    bool _1930 = !_1922;
    int _1932 = _1930 ? 0 : (-1);
    bool _1934 = uint(_1850) >= 2u;
    int _1936 = ~_1862;
    int _1938 = _1936 + _1926;
    int _1940 = _1938 + 1;
    int _1942 = ~_697;
    int _1944 = _1942 + 1;
    int _1946 = int(_1736) + int(_1842);
    int _1948 = _759 * _1940;
    int _1950 = _1948 + _1604;
    int _1952 = _1934 ? 0 : 1;
    int _1954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1956 = _1954 != 0;
    int _1958 = _1944 * _1946;
    int _1960 = _1958 + _1294;
    int _1962 = ~_759;
    int _1964 = _1962 + 1;
    int _1966 = ~_1952;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    int _1972 = _1970;
    int _1974 = _1914;
    if (_1928)
    {
        int _1976 = ~_1952;
        int _1978 = _1976 + 1;
        _1972 = _1978;
    }
    int _1980 = _1972;
    int _1982 = _1964 * int(_1920);
    int _1984 = _1982 + _1522;
    int _1986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _1988 = _1986 != 0;
    bool _1990 = !_1956;
    int _1992 = _1990 ? 0 : 1;
    bool _1994 = uint(_1960) >= uint(_697);
    bool _1996 = !_1458;
    int _1998 = _1996 ? _1950 : (-1);
    bool _2000 = !_1988;
    int _2002 = _2000 ? 0 : 1;
    bool _2004 = !_1994;
    int _2006 = _2004 ? 0 : (-1);
    int _2008 = _1998 & 3;
    bool _2010 = _2008 != 0;
    int _2012 = _1998 & 3;
    bool _2014 = _2012 != 0;
    float _2016 = float(uint(_1984));
    int _2018 = _2010 ? 0 : 1;
    bool _2020 = uint(_2012) > 1u;
    float _2022 = as_type<float>(_924) * _2016;
    int _2024 = ~_2018;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = ~_759;
    int _2032 = _2030 + 1;
    float _2034 = trunc(_2022);
    float _2036 = precise::max(_2034, 0.0);
    uint _2038 = uint(_2036);
    float _2040 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2042 = _2040 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2044 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2046 = _2044 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2048 = _2028;
    if (!_2020)
    {
        int _2050 = ~_2018;
        int _2052 = _2050 + 1;
        _2048 = _2052;
    }
    int _2054 = _2048;
    float _2056 = 1.0 / _2042;
    bool _2058 = uint(_2012) >= 2u;
    int _2060 = ~_1946;
    int _2062 = _2060 + _2006;
    int _2064 = _2062 + 1;
    int _2066 = _2058 ? 0 : 1;
    bool _2068 = _2012 != 3;
    float _2070 = 1.0 / _2046;
    int _2072 = int(_1920) + int(_2038);
    int _2074 = _697 * _2064;
    int _2076 = _2074 + _1294;
    int _2078 = ~_2066;
    int _2080 = _2078 + 1;
    int _2082 = _2080 + 1;
    int _2084 = _2032 * _2072;
    int _2086 = _2084 + _1522;
    bool _2088 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2090 = isnan(_661);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2096 = _2092 || _2094;
    float _2098 = float(_2096);
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2102 = _2100 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2104 = _2082;
    if (_2068)
    {
        int _2106 = ~_2066;
        int _2108 = _2106 + 1;
        _2104 = _2108;
    }
    int _2110 = _2104;
    bool _2112 = uint(_2086) >= uint(_759);
    float _2114 = -_2098;
    float _2116 = _2114 + 1.0;
    float _2118 = 1.0 / _2102;
    bool _2120 = !_2112;
    int _2122 = _2120 ? 0 : (-1);
    bool _2124 = _842 > 0.5;
    float _2126 = -_221;
    int _2128 = _2124 ? as_type<int>(_2126) : as_type<int>(_221);
    int _2130 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2132 = _2130 != 0;
    float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2136 = _2134 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2138 = !_2132;
    float _2140 = _2138 ? _221 : as_type<float>(_2128);
    float _2142 = 1.0 / _2136;
    bool _2144 = _852 != 1;
    float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2146;
    float _2150 = in.m_58.x;
    float _2152 = in.m_58.y;
    float _2154 = in.m_58.z;
    int _2156 = ~_2072;
    int _2158 = _2156 + _2122;
    int _2160 = _2158 + 1;
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2164 = abs(_1744);
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2168 = abs(_2054);
    float _2170 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2162);
    float _2172 = 0.0;
    float _2174 = _2136;
    if (!_2144)
    {
        _2172 = _850;
    }
    float _2176 = _2172;
    float _2178 = _854 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2180 = 0.0;
    float _2182 = _2176;
    if (!_2144)
    {
        _2180 = _850;
    }
    float _2184 = _2180;
    float _2186 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2170);
    float _2188 = 0.0;
    float _2190 = _2184;
    if (!_2144)
    {
        _2188 = _872;
    }
    float _2192 = _2188;
    int _2194 = _759 * _2160;
    int _2196 = _2194 + _1522;
    float _2198 = _2192;
    if (!_2144)
    {
        _2174 = _872;
    }
    float _2200 = _2174;
    float _2202 = _2200;
    if (_2144)
    {
        _2182 = _842;
    }
    float _2204 = _2182;
    if (_2144)
    {
        _2190 = _842;
    }
    float _2206 = _2190;
    if (_2144)
    {
        _2198 = _850;
    }
    float _2208 = _2198;
    float _2210 = _2152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_2144)
    {
        _2202 = _850;
    }
    float _2212 = _2202;
    float _2214 = _2152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2216 = _856 != 2;
    float _2218 = _2152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2220 = _850 * 2.0;
    float _2222 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2210);
    float _2224 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2214);
    float _2226 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2218);
    float _2228 = floor(_2220);
    float _2230 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2234 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2222);
    float _2236 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2224);
    float _2238 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2226);
    bool _2240 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2242 = isnan(_661);
    bool _2244 = _2240 || _2242;
    bool _2246 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2248 = _2244 || _2246;
    float _2250 = float(_2248);
    float _2252 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2254 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2252;
    float _2256 = 0.0;
    if (_2216)
    {
        _2256 = _842;
    }
    float _2258 = _2256;
    float _2260 = 1.0 / _2232;
    float _2262 = 0.0;
    float _2264 = _2258;
    if (_2216)
    {
        _2262 = _850;
    }
    float _2266 = _2262;
    float _2268 = _2254 * _2142;
    float _2270 = _2266;
    if (!_2216)
    {
        _2264 = _872;
    }
    float _2272 = _2264;
    float _2274 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2276 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2274;
    if (!_2216)
    {
        _2270 = _842;
    }
    float _2278 = _2270;
    float _2280 = -_2250;
    float _2282 = _2280 + 1.0;
    bool _2284 = _1302 >= 0.0;
    bool _2286 = isnan(_1302);
    bool _2288 = _2284 || _2286;
    bool _2290 = isnan(0.0);
    bool _2292 = _2288 || _2290;
    float _2294 = _2276 * _2056;
    float _2296 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2298 = _2296 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2300 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2302 = isnan(_661);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2308 = _2304 || _2306;
    float _2310 = float(_2308);
    float _2312 = _2278 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2314 = _2292 ? 0 : 1;
    float _2316 = _2298 * _2070;
    bool _2318 = _1302 > 0.0;
    float _2320 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2322 = _2320 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2324 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2326 = _2324 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2328 = _872 * 2.0;
    float _2330 = _2322 * _2118;
    int _2332 = ~_2314;
    int _2334 = _2332 + 1;
    int _2336 = _2334 + 1;
    float _2338 = 1.0 / _2326;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2342 = _2340 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2344 = -_2310;
    float _2346 = _2344 + 1.0;
    float _2348 = _2208 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2350 = _2204 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2352 = abs(_1896);
    float _2354 = _2098 * _2346;
    int _2356 = _2336;
    float _2358 = _2350;
    if (!_2318)
    {
        int _2360 = ~_2314;
        int _2362 = _2360 + 1;
        _2356 = _2362;
    }
    int _2364 = _2356;
    float _2366 = floor(_2328);
    bool _2368 = _2228 >= 0.0;
    bool _2370 = isnan(_2228);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan(0.0);
    bool _2376 = _2372 || _2374;
    float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2378;
    bool _2382 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2384 = isnan(_661);
    bool _2386 = _2382 || _2384;
    bool _2388 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2390 = _2386 || _2388;
    float _2392 = float(_2390);
    float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2396 = _2394 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2398 = _2376 ? 0 : 1;
    float _2400 = _2380 * _2260;
    bool _2402 = _2228 > 0.0;
    float _2404 = -_2392;
    float _2406 = _2404 + 1.0;
    float _2408 = 1.0 / _2342;
    bool _2410 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2412 = isnan(_661);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2418 = _2414 || _2416;
    float _2420 = float(_2418);
    float _2422 = _2396 * _2338;
    int _2424 = ~_2398;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    float _2430 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2432 = _661 + _2430;
    int _2434 = ~_1872;
    int _2436 = _2434 + _1932;
    int _2438 = _2436 + 1;
    float _2440 = _2420 * _2116;
    float _2442 = -_2420;
    float _2444 = _2442 + 1.0;
    bool _2446 = !_1458;
    int _2448 = _2446 ? _2196 : (-1);
    int _2450 = _679 * _2438;
    int _2452 = _2450 + _1170;
    int _2454 = _2428;
    if (!_2402)
    {
        int _2456 = ~_2398;
        int _2458 = _2456 + 1;
        _2454 = _2458;
    }
    int _2460 = _2454;
    float _2462 = _2392 * _2444;
    bool _2464 = !_1218;
    int _2466 = _2464 ? _2076 : (-1);
    bool _2468 = !_1680;
    int _2470 = _2468 ? 0 : 1;
    float _2472 = _2148 * _2408;
    int _2474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2476 = _2474 != 0;
    int _2478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2480 = _2478 != 0;
    int _2482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2484 = _2482 != 0;
    bool _2486 = _2366 >= 0.0;
    bool _2488 = isnan(_2366);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan(0.0);
    bool _2494 = _2490 || _2492;
    bool _2496 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2498 = isnan(_661);
    bool _2500 = _2496 || _2498;
    bool _2502 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2504 = _2500 || _2502;
    float _2506 = float(_2504);
    bool _2508 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2510 = isnan(_661);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2516 = _2512 || _2514;
    float _2518 = float(_2516);
    int _2520 = _2494 ? 0 : 1;
    float _2522 = -_2506;
    float _2524 = _2522 + 1.0;
    bool _2526 = _2366 > 0.0;
    float _2528 = _2506 * _2406;
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2532 = _661 + _2530;
    float _2534 = -_2518;
    float _2536 = _2534 + 1.0;
    float _2538 = _2518 * _2524;
    float _2540 = fma(_2330, _2432, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2542 = fma(_2268, _2532, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2544 = _2250 * _2536;
    float _2546 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2548 = _661 + _2546;
    bool _2550 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2552 = isnan(_661);
    bool _2554 = _2550 || _2552;
    bool _2556 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2558 = _2554 || _2556;
    float _2560 = float(_2558);
    float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2564 = _661 + _2562;
    float _2566 = fma(_2316, _2548, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2570 = _661 + _2568;
    float _2572 = _2560 * _2282;
    float _2574 = fma(_2294, _2564, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2576 = fma(_2400, _896, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2578 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2580 = _661 + _2578;
    float _2582 = fma(_2472, _2570, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2584 = _2542 * _2572;
    float _2586 = -_2560;
    float _2588 = _2586 + 1.0;
    float _2590 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2592 = ~_2520;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    float _2598 = fma(_2588, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2584);
    int _2600 = _2596;
    if (!_2526)
    {
        int _2602 = ~_2520;
        int _2604 = _2602 + 1;
        _2600 = _2604;
    }
    int _2606 = _2600;
    float _2608 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2610 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2590);
    float _2612 = fma(_2422, _2580, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2614 = fma(_2540, _2544, _2598);
    float _2616 = _850 + _842;
    float _2618 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2608);
    float _2620 = _850 + _872;
    float _2622 = _850 + (-0.5);
    float _2624 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2626 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2630 = fma(_2574, _2538, _2614);
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2634 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2624);
    float _2636 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2626);
    float _2638 = _842 + _872;
    float _2640 = _842 + (-0.5);
    float _2642 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2628);
    float _2644 = _858 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2646 = fma(_2178, -2.0, _2632);
    float _2648 = _2236 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2650 = _2234 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2652 = -_2166;
    float _2654 = fma(_2644, 2.0, _2652);
    float _2656 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2658 = fma(_2566, _2528, _2630);
    float _2660 = _2238 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2662 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2664 = _2648 + _2662;
    int _2666 = _1832 >> 31;
    float _2668 = -_2656;
    float _2670 = fma(_920, 2.0, _2668);
    float _2672 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2674 = _2650 + _2672;
    float _2676 = _2664 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2678 = _2666 & 3;
    float _2680 = fma(_2576, _2462, _2658);
    float _2682 = fma(_2674, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2676);
    int _2684 = _1832 + _2678;
    float _2686 = _2616 + (-1.0);
    float _2688 = fma(_2612, _2440, _2680);
    int _2690 = _2684 >> 2;
    float _2692 = fma(_2686, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2694 = !_1852;
    int _2696 = _2694 ? 0 : 1;
    float _2698 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2700 = _2660 + _2698;
    int _2702 = _2690 << 4;
    int _2704 = _2702 + 656;
    float _2706 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2708 = _1850 != 3;
    float _2710 = fma(_2700, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2682);
    uint _2712 = uint(int(uint(_2704) >> uint(2)));
    uint _2714 = uint(int(uint(int(_2712)) >> uint(2)));
    int _2716 = int(_2712) & 3;
    float _2718 = (*spvDescriptorSet0.vp_c9)._m0[int(_2714)][_2716];
    int _2720 = int(_2712) + 1;
    uint _2722 = uint(int(uint(_2720) >> uint(2)));
    int _2724 = _2720 & 3;
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[int(_2722)][_2724];
    float _2728 = fma(_900, -2.0, _2706);
    float _2730 = -_131;
    float _2732 = fma(_2730, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2654);
    bool _2734 = !_2708;
    int _2736 = _2734 ? 0 : (-1);
    float _2738 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2740 = _2710 >= 0.0;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2744 = _1668 + 0.5;
    float _2746 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2738);
    float _2748 = -_131;
    float _2750 = fma(_2748, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2670);
    float _2752 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2742);
    float _2754 = fma(_2744, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2732);
    int _2756 = _2704 + 8;
    uint _2758 = uint(int(uint(_2756) >> uint(2)));
    uint _2760 = uint(int(uint(int(_2758)) >> uint(2)));
    int _2762 = int(_2758) & 3;
    float _2764 = (*spvDescriptorSet0.vp_c9)._m0[int(_2760)][_2762];
    int _2766 = int(_2758) + 1;
    uint _2768 = uint(int(uint(_2766) >> uint(2)));
    int _2770 = _2766 & 3;
    float _2772 = (*spvDescriptorSet0.vp_c9)._m0[int(_2768)][_2770];
    float _2774 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2728);
    float _2776 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2646);
    float _2778 = _1856 + (-0.5);
    float _2780 = _2140 + 0.5;
    float _2782 = -_2778;
    float _2784 = -_2774;
    float _2786 = fma(_2782, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2784);
    float _2788 = fma(_2780, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2750);
    float _2790 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2792 = _2272 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2794 = fma(_2582, _2354, _2688);
    float _2796 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2798 = fma(_2348, -2.0, _2790);
    int _2800 = abs(_2696);
    float _2802 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2804 = fma(_2312, -2.0, _2796);
    int _2806 = abs(_1914);
    int _2808 = abs(_1980);
    float _2810 = -_2802;
    float _2812 = fma(_2350, 2.0, _2810);
    int _2814 = ~_2806;
    int _2816 = _2814 + 1;
    int _2818 = _2816 + 1;
    float _2820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2822 = ~_2800;
    int _2824 = _2822 + 1;
    int _2826 = _2824 + 1;
    float _2828 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2642);
    if (_2740)
    {
        _2358 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2830 = _2358;
    float _2832 = -_1858;
    float _2834 = -_2776;
    float _2836 = fma(_2832, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2834);
    float _2838 = -_2828;
    float _2840 = _2838 + 1.0;
    int _2842 = abs(_2736);
    if (_2740)
    {
        float _2844 = _2830 * 5.0;
        _1974 = as_type<int>(_2844);
    }
    int _2846 = _1974;
    float _2848 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2798);
    float _2850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2852 = _2818 * as_type<int>(_2726);
    int _2854 = ~_2808;
    int _2856 = _2854 + 1;
    int _2858 = _2856 + 1;
    if (_2740)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9615 = as_type<float>(_2846);
        out.gl_Position.z = _9615;
    }
    bool _2860 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2862 = isnan(0.0);
    bool _2864 = _2860 || _2862;
    bool _2866 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2868 = _2864 || _2866;
    int _2870 = _2826 * as_type<int>(_2718);
    int _2872 = _2870 + _2852;
    int _2874 = abs(_1992);
    float _2876 = _2820 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2878 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2880 = int(_2878);
    float _2882 = fma(_2310, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2794);
    float _2884 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2634);
    float _2886 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2618);
    float _2888 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2636);
    int _2890 = _2858 * as_type<int>(_2764);
    int _2892 = _2890 + _2872;
    float _2894 = _1160 * _131;
    int _2896 = ~_2842;
    int _2898 = _2896 + 1;
    int _2900 = _2898 + 1;
    float _2902 = -_2186;
    float _2904 = _2902 + 1.0;
    int _2906 = ~_2874;
    int _2908 = _2906 + 1;
    int _2910 = _2908 + 1;
    float _2912 = _2850 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2914 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2916 = exp2(_2894);
    float _2918 = float(uint(_2880));
    int _2920 = _2900 * as_type<int>(_2772);
    int _2922 = _2920 + _2892;
    float _2924 = _1622 + 0.5;
    float _2926 = -_2914;
    float _2928 = fma(_2792, 2.0, _2926);
    float _2930 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2610);
    int _2932 = _2922 * _2910;
    float _2934 = -_2840;
    float _2936 = fma(_2934, _1668, _2754);
    float _2938 = 1.0 / _2918;
    float _2940 = _1376 + (-0.5);
    float _2942 = fma(_2904, _1848, _2836);
    float _2944 = -_131;
    float _2946 = fma(_2944, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2812);
    float _2948 = -_2912;
    float _2950 = -_2848;
    float _2952 = fma(_2948, _2940, _2950);
    int _2954 = _2466 * _2874;
    int _2956 = _2954 + _2932;
    out.m_80.x = _2936;
    out.m_80.y = _2942;
    float _2958 = fma(_2876, _2924, _2946);
    float _2960 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2962 = 1.0 + _2960;
    float _2964 = -_2916;
    float _2966 = _2964 + 1.0;
    float _2968 = float(uint(_2956));
    float _2970 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2746);
    float _2972 = 1.0 / _2962;
    float _2974 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2752);
    float _2976 = _2868 ? _2966 : 0.0;
    float _2978 = -_131;
    float _2980 = fma(_2978, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2928);
    int _2982 = as_type<int>(_2938) + (-2);
    float _2984 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2804);
    bool _2986 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2988 = isnan(1.0);
    bool _2990 = _2986 || _2988;
    bool _2992 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2994 = _2990 || _2992;
    out.m_82.x = _2882;
    int _2996 = abs(_2880);
    float _2998 = as_type<float>(_2982) * _2968;
    int _3000 = _1998 >> 31;
    float _3002 = -_2974;
    float _3004 = _3002 + 1.0;
    float _3006 = trunc(_2998);
    float _3008 = precise::max(_3006, 0.0);
    uint _3010 = uint(_3008);
    int _3012 = _1646 >> 31;
    float _3014 = _2664 * _2664;
    float _3016 = float(uint(_2996));
    float _3018 = fma(_1376, _3004, _2952);
    int _3020 = ~_2880;
    int _3022 = _3020 + 1;
    if (_2994)
    {
        float _3024 = _2976 * _2972;
        _141 = _3024;
    }
    float _3026 = _141;
    int _3028 = _3000 & 3;
    float _3030 = -_2888;
    float _3032 = _3030 + 1.0;
    float _3034 = 1.0 / _3016;
    int _3036 = _3012 & 3;
    float _3038 = fma(_2674, _2674, _3014);
    int _3040 = _1998 + _3028;
    float _3042 = -_2884;
    float _3044 = _3042 + 1.0;
    int _3046 = _1646 + _3036;
    float _3048 = fma(_2700, _2700, _3038);
    int _3050 = _3022 * int(_3010);
    int _3052 = _3050 + _2956;
    int _3054 = _3040 >> 2;
    float _3056 = -_3044;
    float _3058 = fma(_2140, _3056, _2788);
    float _3060 = rsqrt(_3048);
    int _3062 = _3046 >> 2;
    float _3064 = _922 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3066 = float(uint(_3052));
    float _3068 = -_2970;
    float _3070 = _3068 + 1.0;
    int _3072 = _3054 << 4;
    int _3074 = _3072 + 800;
    if (_2740)
    {
        out.m_65.x = 0.0;
    }
    int _3076 = abs(_2956);
    float _3078 = as_type<float>(_2982) * _3066;
    int _3080 = _3062 << 4;
    int _3082 = _3080 + 368;
    uint _3084 = uint(int(uint(_3074) >> uint(2)));
    uint _3086 = uint(int(uint(int(_3084)) >> uint(2)));
    int _3088 = int(_3084) & 3;
    float _3090 = (*spvDescriptorSet0.vp_c9)._m0[int(_3086)][_3088];
    int _3092 = int(_3084) + 1;
    uint _3094 = uint(int(uint(_3092) >> uint(2)));
    int _3096 = _3092 & 3;
    float _3098 = (*spvDescriptorSet0.vp_c9)._m0[int(_3094)][_3096];
    int _3100 = as_type<int>(_3034) + (-2);
    float _3102 = -_2886;
    float _3104 = _3102 + 1.0;
    float _3106 = float(uint(_3076));
    float _3108 = -_3070;
    float _3110 = fma(_1622, _3108, _2958);
    bool _3112 = !_2476;
    int _3114 = _3112 ? 0 : 1;
    float _3116 = _3064 * _3060;
    float _3118 = fma(_1856, _3104, _2786);
    uint _3120 = uint(int(uint(_3082) >> uint(2)));
    uint _3122 = uint(int(uint(int(_3120)) >> uint(2)));
    int _3124 = int(_3120) & 3;
    float _3126 = (*spvDescriptorSet0.vp_c9)._m0[int(_3122)][_3124];
    int _3128 = int(_3120) + 1;
    uint _3130 = uint(int(uint(_3128) >> uint(2)));
    int _3132 = _3128 & 3;
    float _3134 = (*spvDescriptorSet0.vp_c9)._m0[int(_3130)][_3132];
    float _3136 = as_type<float>(_3100) * _3106;
    float _3138 = _2664 * _3116;
    float _3140 = _2674 * _3116;
    int _3142 = ~_2996;
    int _3144 = _3142 + 1;
    out.m_84.x = _3058;
    out.m_84.y = _3118;
    out.m_84.z = _3110;
    out.m_84.w = _3018;
    float _3146 = -_3138;
    float _3148 = _2664 + _3146;
    float _3150 = trunc(_3136);
    float _3152 = precise::max(_3150, 0.0);
    uint _3154 = uint(_3152);
    int _3156 = abs(_3114);
    float _3158 = -_3140;
    float _3160 = _2674 + _3158;
    float _3162 = _3148 * _3148;
    float _3164 = _2700 * _3116;
    float _3166 = float(_2606);
    float _3168 = fma(_3160, _3160, _3162);
    float _3170 = float(_3156);
    float _3172 = trunc(_3078);
    float _3174 = precise::max(_3172, 0.0);
    uint _3176 = uint(_3174);
    int _3178 = ~_2880;
    int _3180 = _3178 + 1;
    float _3182 = -_3164;
    float _3184 = _2700 + _3182;
    int _3186 = _3074 + 8;
    uint _3188 = uint(int(uint(_3186) >> uint(2)));
    uint _3190 = uint(int(uint(int(_3188)) >> uint(2)));
    int _3192 = int(_3188) & 3;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[int(_3190)][_3192];
    int _3196 = int(_3188) + 1;
    uint _3198 = uint(int(uint(_3196) >> uint(2)));
    int _3200 = _3196 & 3;
    float _3202 = (*spvDescriptorSet0.vp_c9)._m0[int(_3198)][_3200];
    float _3204 = _3170 * _3166;
    int _3206 = _3144 * int(_3154);
    int _3208 = _3206 + _3076;
    bool _3210 = !_2014;
    int _3212 = _3210 ? 0 : 1;
    int _3214 = _3082 + 8;
    uint _3216 = uint(int(uint(_3214) >> uint(2)));
    uint _3218 = uint(int(uint(int(_3216)) >> uint(2)));
    int _3220 = int(_3216) & 3;
    float _3222 = (*spvDescriptorSet0.vp_c9)._m0[int(_3218)][_3220];
    int _3224 = int(_3216) + 1;
    uint _3226 = uint(int(uint(_3224) >> uint(2)));
    int _3228 = _3224 & 3;
    float _3230 = (*spvDescriptorSet0.vp_c9)._m0[int(_3226)][_3228];
    float _3232 = float(uint(_3208));
    int _3234 = ~_2168;
    int _3236 = _3234 + 1;
    int _3238 = _3236 + 1;
    int _3240 = int(_3010) + int(_3176);
    float _3242 = as_type<float>(_3100) * _3232;
    int _3244 = abs(_2470);
    int _3246 = ~_2164;
    int _3248 = _3246 + 1;
    int _3250 = _3248 + 1;
    float _3252 = trunc(_3242);
    float _3254 = precise::max(_3252, 0.0);
    uint _3256 = uint(_3254);
    bool _3258 = _1678 != 3;
    int _3260 = _3180 * _3240;
    int _3262 = _3260 + _2956;
    int _3264 = ~_2996;
    int _3266 = _3264 + 1;
    int _3268 = _3238 * as_type<int>(_3098);
    int _3270 = abs(_3212);
    int _3272 = ~_3270;
    int _3274 = _3272 + 1;
    int _3276 = _3274 + 1;
    int _3278 = _3250 * as_type<int>(_3134);
    bool _3280 = !_3258;
    int _3282 = _3280 ? 0 : (-1);
    int _3284 = ~_3244;
    int _3286 = _3284 + 1;
    int _3288 = _3286 + 1;
    int _3290 = _3276 * as_type<int>(_3090);
    int _3292 = _3290 + _3268;
    bool _3294 = uint(_3262) >= uint(_2880);
    int _3296 = int(_3154) + int(_3256);
    int _3298 = _3288 * as_type<int>(_3126);
    int _3300 = _3298 + _3278;
    bool _3302 = !_3294;
    int _3304 = _3302 ? 0 : (-1);
    int _3306 = abs(_2110);
    int _3308 = _3266 * _3296;
    int _3310 = _3308 + _3076;
    bool _3312 = _2012 != 3;
    float _3314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3316 = ~_3240;
    int _3318 = _3316 + _3304;
    int _3320 = _3318 + 1;
    int _3322 = ~_3306;
    int _3324 = _3322 + 1;
    int _3326 = _3324 + 1;
    bool _3328 = !_3312;
    int _3330 = _3328 ? 0 : (-1);
    int _3332 = _2880 * _3320;
    int _3334 = _3332 + _2956;
    bool _3336 = uint(_3310) >= uint(_2996);
    int _3338 = _3326 * as_type<int>(_3194);
    int _3340 = _3338 + _3292;
    int _3342 = _2956 ^ _2880;
    float _3344 = _1042 + 0.5;
    int _3346 = abs(_3330);
    int _3348 = abs(_1822);
    float _3350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3352 = !_3336;
    int _3354 = _3352 ? 0 : (-1);
    uint _3356 = uint(int(uint(_3342) >> uint(31)));
    int _3358 = abs(_3282);
    int _3360 = ~_3348;
    int _3362 = _3360 + 1;
    int _3364 = _3362 + 1;
    int _3366 = ~_3354;
    int _3368 = _3296 + _3366;
    int _3370 = _3368 + 1;
    int _3372 = ~int(_3356);
    int _3374 = _3372 + 1;
    int _3376 = _3364 * as_type<int>(_3222);
    int _3378 = _3376 + _3300;
    int _3380 = ~_3358;
    int _3382 = _3380 + 1;
    int _3384 = _3382 + 1;
    bool _3386 = _2880 == 0;
    int _3388 = ~_3346;
    int _3390 = _3388 + 1;
    int _3392 = _3390 + 1;
    int _3394 = _3384 * as_type<int>(_3230);
    int _3396 = _3394 + _3378;
    int _3398 = _3370 ^ _3374;
    int _3400 = ~_2352;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    int _3406 = _3392 * as_type<int>(_3202);
    int _3408 = _3406 + _3340;
    bool _3410 = !_3386;
    int _3412 = _3410 ? _3334 : (-1);
    float _3414 = in.m_86.x;
    float _3416 = in.m_86.y;
    float _3418 = in.m_86.z;
    int _3420 = abs(_2002);
    float _3422 = _3350 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3424 = _2880 == 0;
    int _3426 = _3396 * _3404;
    int _3428 = ~_3374;
    int _3430 = _3428 + _3398;
    int _3432 = _3430 + 1;
    int _3434 = ~_3420;
    int _3436 = _3434 + 1;
    int _3438 = _3436 + 1;
    bool _3440 = !_3424;
    int _3442 = _3440 ? _3432 : (-1);
    bool _3444 = _679 == 0;
    int _3446 = _3408 * _3438;
    float _3448 = float(_3412);
    float _3450 = _3314 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3452 = float(_3442);
    int _3454 = _2448 * _3420;
    int _3456 = _3454 + _3446;
    bool _3458 = !_3444;
    int _3460 = _3458 ? _2452 : (-1);
    float _3462 = fma(_3422, _3448, _2980);
    float _3464 = _3204 * (-2.0);
    float _3466 = -_2984;
    float _3468 = fma(_3450, _3452, _3466);
    float _3470 = _1004 + (-0.5);
    int _3472 = _3460 * _2352;
    int _3474 = _3472 + _3426;
    float _3476 = fma(_3422, _3344, _3462);
    float _3478 = -_2930;
    float _3480 = _3478 + 1.0;
    float _3482 = -_3450;
    float _3484 = fma(_3482, _3470, _3468);
    float _3486 = fma(_2692, _3464, _2692);
    float _3488 = float(_3474);
    float _3490 = -_3032;
    float _3492 = fma(_1042, _3490, _3476);
    float _3494 = float(_3456);
    float _3496 = fma(_1004, _3480, _3484);
    float _3498 = fma(_3464, _3414, _3414);
    bool _3500 = !_2480;
    int _3502 = _3500 ? 0 : 1;
    out.m_88.x = _3488;
    bool _3504 = !_2484;
    int _3506 = _3504 ? 0 : 1;
    int _3508 = abs(_3502);
    out.m_88.w = _3494;
    out.m_90.x = _3492;
    out.m_90.y = _3496;
    float _3510 = _3418;
    if (_2740)
    {
        return out;
    }
    float _3512 = -_3138;
    float _3514 = _2648 + _3512;
    float _3516 = -_3140;
    float _3518 = _2650 + _3516;
    float _3520 = fma(_2640, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3498);
    float _3522 = float(_2364);
    float _3524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3526 = _3514 + _3524;
    float _3528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3530 = _3518 + _3528;
    float _3532 = float(_3508);
    float _3534 = _2620 + (-1.0);
    float _3536 = _3526 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3538 = _2638 + (-1.0);
    float _3540 = _3532 * _3522;
    float _3542 = fma(_3530, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3536);
    float _3544 = -_3164;
    float _3546 = _2660 + _3544;
    int _3548 = abs(_3506);
    float _3550 = fma(_3534, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3552 = float(_2460);
    float _3554 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3556 = _3546 + _3554;
    float _3558 = float(_3548);
    float _3560 = _872 + (-0.5);
    float _3562 = fma(_3486, _3026, _3520);
    float _3564 = fma(_3556, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3542);
    float _3566 = _3540 * (-2.0);
    float _3568 = _3558 * _3552;
    float _3570 = fma(_3184, _3184, _3168);
    float _3572 = _3562 * 0.15915493667125701904296875;
    float _3574 = fma(_3566, _3416, _3416);
    float _3576 = fma(_3550, _3566, _3550);
    float _3578 = _3568 * (-2.0);
    bool _3580 = _3564 >= 0.0;
    float _3582 = fma(_2622, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3574);
    float _3584 = sqrt(_3570);
    float _3586 = fma(_3538, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3588 = fma(_3578, _3418, _3418);
    float _3590 = fma(_3576, _3026, _3582);
    float _3592 = fma(_3586, _3578, _3586);
    float _3594 = fma(_3560, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3588);
    float _3596 = _3590 * 0.15915493667125701904296875;
    float _3598 = _3572 * 6.283185482025146484375;
    float _3600 = sin(_3598);
    float _3602 = fma(_3592, _3026, _3594);
    int _3604 = as_type<int>(_3576);
    if (_3580)
    {
        _3510 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3606 = _3510;
    int _3608 = as_type<int>(_3606);
    if (_3580)
    {
        out.m_65.x = 0.0;
    }
    float _3610 = _3602 * 0.15915493667125701904296875;
    float _3612 = _3572 * 6.283185482025146484375;
    float _3614 = cos(_3612);
    if (_3580)
    {
        float _3616 = _3606 * 5.0;
        _3608 = as_type<int>(_3616);
    }
    int _3618 = _3608;
    if (_3580)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10728 = as_type<float>(_3618);
        out.gl_Position.z = _10728;
    }
    float _3620 = _3596 * 6.283185482025146484375;
    float _3622 = sin(_3620);
    float _3624 = _3596 * 6.283185482025146484375;
    float _3626 = cos(_3624);
    if (_3580)
    {
        return out;
    }
    float _3628 = _3610 * 6.283185482025146484375;
    float _3630 = cos(_3628);
    float _3632 = _3060 * _3584;
    float _3634 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3638 = _3614 * _3626;
    float _3640 = _922 * _3632;
    float _3642 = _3632 * _3634;
    float _3644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _3646 = _3610 * 6.283185482025146484375;
    float _3648 = sin(_3646);
    float _3650 = _3614 * _3622;
    float _3652 = _3636 * _3642;
    float _3654 = _3600 * _3622;
    float _3656 = _3600 * _3626;
    float _3658 = _3644 * _3640;
    float _3660 = _3632 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3662 = _3660 * 0.5;
    float _3664 = _3614 * _3630;
    float _3666 = _3626 * _3630;
    float _3668 = _3600 * _3630;
    float _3670 = _3622 * _3630;
    float _3672 = _3664 * _3652;
    float _3674 = fma(_3648, _3638, _3654);
    float _3676 = -_3656;
    float _3678 = fma(_3648, _3650, _3676);
    float _3680 = -_3652;
    float _3682 = _3648 * _3680;
    float _3684 = -_3650;
    float _3686 = fma(_3648, _3656, _3684);
    float _3688 = fma(_3674, _3658, _3672);
    float _3690 = _3668 * _3652;
    float _3692 = fma(_3666, _3658, _3682);
    float _3694 = fma(_3648, _3654, _3638);
    float _3696 = fma(_3678, _3662, _3688);
    float _3698 = fma(_3686, _3658, _3690);
    float _3700 = fma(_3670, _3662, _3692);
    float _3702 = _3674 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3704 = _3696 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3706 = _3696 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3708 = fma(_3694, _3662, _3698);
    float _3710 = _3696 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3712 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3704);
    float _3714 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3706);
    float _3716 = _3664 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3718 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3702);
    float _3720 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3712);
    float _3722 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3714);
    float _3724 = _3720 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3726 = _3722 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3728 = _3674 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3730 = _2650 + _3724;
    float _3732 = _2660 + _3726;
    float _3734 = _3674 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3736 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3738 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3740 = _3730 + _3738;
    float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3744 = _3732 + _3742;
    float _3746 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3734);
    float _3748 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3710);
    float _3750 = _3740 * _3740;
    float _3752 = _3744 * _3744;
    float _3754 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3728);
    float _3756 = _3664 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3758 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3748);
    float _3760 = _3750 + _3752;
    float _3762 = _3664 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3764 = -_3648;
    float _3766 = fma(_3764, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3756);
    float _3768 = _3758 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3770 = sqrt(_3760);
    float _3772 = -_3648;
    float _3774 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3762);
    float _3776 = _3678 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3778 = _3678 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3780 = fma(_3736, _3736, 1.0);
    float _3782 = _3678 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3784 = _2648 + _3768;
    float _3786 = -_3648;
    float _3788 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3716);
    float _3790 = rsqrt(_3780);
    float _3792 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3776);
    float _3794 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3778);
    float _3796 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3782);
    bool _3798 = _3770 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3800 = _3782;
    float _3802 = _3670;
    float _3804 = _3776;
    float _3806 = _3780;
    float _3808 = _3768;
    float _3810 = _3740;
    if (!_3798)
    {
        _3800 = _3752;
    }
    float _3812 = _3800;
    float _3814 = _3812;
    if (!_3798)
    {
        _3802 = _3750;
    }
    float _3816 = _3802;
    float _3818 = _3816;
    if (!_3798)
    {
        _3804 = _3730;
    }
    float _3820 = _3804;
    float _3822 = _3820;
    if (!_3798)
    {
        _3806 = _3732;
    }
    float _3824 = _3806;
    float _3826 = _3824;
    if (!_3798)
    {
        _3808 = _3784;
    }
    float _3828 = _3808;
    bool _3830 = !_3798;
    float _3832 = _3828;
    if (!_3830)
    {
        float _3834 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3838 = _3770 + _3836;
        float _3840 = _3784 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3842 = rsqrt(_3760);
        float _3844 = _3838 * _3834;
        float _3846 = _3844 * 0.15915493667125701904296875;
        float _3848 = _3846 * 6.283185482025146484375;
        float _3850 = sin(_3848);
        float _3852 = _3846 * 6.283185482025146484375;
        float _3854 = cos(_3852);
        float _3856 = fma(_3850, _3840, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3858 = _3842 * _3856;
        float _3860 = _3854 + (-1.0);
        float _3862 = fma(_3740, _3858, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3864 = fma(_3744, _3858, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3866 = _3860 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3868 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3870 = _3862 + _3868;
        float _3872 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3874 = _3864 + _3872;
        float _3876 = fma(_3784, _3854, _3866);
        float _3878 = _3870 * _3870;
        float _3880 = _3874 * _3874;
        _3832 = _3876;
        _3818 = _3878;
        _3814 = _3880;
        _3822 = _3862;
        _3826 = _3864;
    }
    float _3882 = _3832;
    float _3884 = _3818;
    float _3886 = _3814;
    float _3888 = _3822;
    float _3890 = _3826;
    float _3892 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3894 = _3882 + _3892;
    float _3896 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3766);
    float _3898 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3788);
    float _3900 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3774);
    float _3902 = fma(_3894, _3894, _3884);
    float _3904 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3792);
    float _3906 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3794);
    float _3908 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3796);
    float _3910 = _3902 + _3886;
    float _3912 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3754);
    float _3914 = _3736 * _3790;
    float _3916 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3746);
    float _3918 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3920 = _3736 * _3896;
    float _3922 = _3736 * _3898;
    float _3924 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3718);
    float _3926 = _3736 * _3900;
    float _3928 = -_3904;
    float _3930 = _3914 * _3928;
    float _3932 = -_3906;
    float _3934 = _3914 * _3932;
    float _3936 = -_3908;
    float _3938 = _3914 * _3936;
    float _3940 = sqrt(_3910);
    float _3942 = fma(_3918, _3912, _3920);
    float _3944 = fma(_3918, _3916, _3922);
    float _3946 = fma(_3918, _3924, _3926);
    float _3948 = fma(_3790, _3896, _3930);
    float _3950 = fma(_3790, _3898, _3934);
    float _3952 = _3906 + _3944;
    float _3954 = fma(_3790, _3900, _3938);
    float _3956 = _3904 + _3942;
    float _3958 = _3908 + _3946;
    out.m_92.x = _3912;
    out.m_92.y = _3916;
    out.m_92.z = _3924;
    out.m_94.x = _3948;
    out.m_94.y = _3950;
    out.m_94.z = _3954;
    bool _3960 = _3940 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3962 = isnan(_3940);
    bool _3964 = _3960 || _3962;
    bool _3966 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3968 = _3964 || _3966;
    out.m_96.x = _3956;
    out.m_96.y = _3952;
    out.m_96.z = _3958;
    float _3970 = _3904;
    if (!_3968)
    {
        _3970 = 1.0;
    }
    float _3972 = _3970;
    bool _3974 = !_3968;
    float _3976 = _3972;
    if (!_3974)
    {
        bool _3978 = _3940 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3980 = isnan(_3940);
        bool _3982 = _3978 || _3980;
        bool _3984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3986 = _3982 || _3984;
        if (!_3986)
        {
            float _3988 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3990 = _3940 + _3988;
            float _3992 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3994 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3992;
            float _3996 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3998 = _3996 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4000 = 1.0 / _3994;
            float _4002 = _3990 * _4000;
            float _4004 = fma(_4002, _3998, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3976 = _4004;
            _4006 = true;
        }
        else
        {
            bool _4008 = _3940 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4010 = isnan(_3940);
            bool _4012 = _4008 || _4010;
            bool _4014 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4016 = _4012 || _4014;
            if (!_4016)
            {
                float _4018 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4020 = _3940 + _4018;
                float _4022 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4024 = _4022 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4026 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4028 = _4026 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4030 = 1.0 / _4024;
                float _4032 = _4020 * _4030;
                float _4034 = fma(_4032, _4028, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3976 = _4034;
                _4006 = true;
            }
            else
            {
                _3976 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4006 = false;
    float _4036 = _3976;
    float _4038 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4040 = _3882 + _4038;
    float _4042 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4044 = _3888 + _4042;
    float _4046 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4048 = _3890 + _4046;
    float _4050 = fma(_4040, _4036, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4052 = fma(_4044, _4036, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4054 = fma(_4048, _4036, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4056 = _3514 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4058 = -_2648;
    float _4060 = _4058 + _4050;
    float _4062 = -_2650;
    float _4064 = _4062 + _4052;
    float _4066 = -_2660;
    float _4068 = _4066 + _4054;
    float _4070 = fma(_3518, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4056);
    float _4072 = _4060 * _4060;
    float _4074 = _3514 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4076 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4070);
    float _4078 = fma(_4064, _4064, _4072);
    float _4080 = _4076 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4082 = fma(_4068, _4068, _4078);
    float _4084 = sqrt(_4082);
    bool _4086 = _4084 > 0.0;
    float _4088 = _4084;
    float _4090 = _4044;
    float _4092 = _4076;
    float _4094 = _4068;
    if (!_4086)
    {
        _4088 = _4052;
    }
    float _4096 = _4088;
    float _4098 = _4096;
    if (!_4086)
    {
        _4090 = _4050;
    }
    float _4100 = _4090;
    float _4102 = _4100;
    float _4104 = _4100;
    if (!_4086)
    {
        _4092 = _4054;
    }
    float _4106 = _4092;
    bool _4108 = !_4086;
    float _4110 = _4106;
    if (!_4108)
    {
        float _4112 = _215 * _215;
        float _4114 = fma(_213, _213, _4112);
        float _4116 = fma(_217, _217, _4114);
        float _4118 = rsqrt(_4082);
        float _4120 = sqrt(_4116);
        float _4122 = _4064 * _4118;
        float _4124 = _4060 * _4118;
        float _4126 = _4068 * _4118;
        bool _4128 = _4120 > 0.0;
        float _4130 = _4118;
        float _4132 = _4120;
        _4094 = _4126;
        if (!_4128)
        {
            _4130 = _4052;
        }
        float _4134 = _4130;
        _4098 = _4134;
        if (!_4128)
        {
            _4102 = _4050;
        }
        float _4136 = _4102;
        _4104 = _4136;
        if (!_4128)
        {
            _4132 = _4054;
        }
        float _4138 = _4132;
        bool _4140 = !_4128;
        _4110 = _4138;
        if (!_4140)
        {
            float _4142 = rsqrt(_4116);
            float _4144 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4146 = _215 * _4142;
            float _4148 = _213 * _4142;
            float _4150 = _217 * _4142;
            float _4152 = _4124 * _4146;
            float _4154 = fma(_4122, _4148, _4152);
            float _4156 = _4144 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4158 = fma(_4126, _4150, _4154);
            float _4160 = _4158 * _4156;
            float _4162 = fma(_213, _4160, _4052);
            float _4164 = fma(_215, _4160, _4050);
            float _4166 = fma(_217, _4160, _4054);
            _4104 = _4164;
            _4098 = _4162;
            _4110 = _4166;
        }
    }
    float _4168 = _4104;
    float _4170 = _4098;
    float _4172 = _4110;
    float _4174 = _4094;
    float _4176 = fma(_3518, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4074);
    float _4178 = 1.0 / _4080;
    float _4180 = -_3138;
    float _4182 = _4180 + _4168;
    float _4184 = -_3140;
    float _4186 = _4184 + _4170;
    float _4188 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4176);
    float _4190 = -_3164;
    float _4192 = _4190 + _4172;
    float _4194 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4196 = _4182 + _4194;
    float _4198 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4200 = _4186 + _4198;
    float _4202 = _4188 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4204 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4206 = _4192 + _4204;
    float _4208 = _4196 * _4196;
    float _4210 = _4202 + _4080;
    float _4212 = fma(_4200, _4200, _4208);
    float _4214 = _4210 * _4178;
    float _4216 = _4214 * 0.5;
    float _4218 = fma(_4206, _4206, _4212);
    float _4220 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4222 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4224 = fma(_4216, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4222);
    float _4226 = rsqrt(_4218);
    float _4228 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4230 = 1.0 / _4224;
    float _4232 = _4226 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4234 = _3514 + _4228;
    float _4236 = sqrt(_4218);
    float _4238 = _4200 * _4232;
    float _4240 = _4206 * _4232;
    float _4242 = _4234 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4244 = _4234 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4246 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4248 = _4230 * _4246;
    float _4250 = _4238 * _4238;
    float _4252 = _4240 * _4240;
    float _4254 = fma(_3518, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4242);
    float _4256 = fma(_3518, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4244);
    bool _4258 = _4248 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4260 = _4250 + _4252;
    bool _4262 = _4248 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4264 = fma(_3546, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4254);
    float _4266 = fma(_3546, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4256);
    float _4268 = sqrt(_4260);
    float _4270 = _4264 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _4272 = !_4258;
    int _4274 = _4272 ? 0 : 1;
    float _4276 = _4266 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _4278 = 2;
    float _4280 = _4234;
    if (!_4258)
    {
        _4278 = 1;
    }
    int _4282 = _4278;
    float _4284 = trunc(_4270);
    int _4286 = int(_4284);
    int _4288 = _4282;
    if (!_4262)
    {
        _4288 = _4274;
    }
    int _4290 = _4288;
    float _4292 = fma(_3518, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _4294 = _4290 << 6;
    bool _4296 = _4268 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4298 = trunc(_4276);
    int _4300 = int(_4298);
    int _4302 = _4294 + 96;
    uint _4304 = uint(int(uint(_4302) >> uint(2)));
    uint _4306 = uint(int(uint(int(_4304)) >> uint(2)));
    int _4308 = int(_4304) & 3;
    float _4310 = (*spvDescriptorSet0.vp_c15)._m0[int(_4306)][_4308];
    int _4312 = int(_4304) + 1;
    uint _4314 = uint(int(uint(_4312) >> uint(2)));
    int _4316 = _4312 & 3;
    float _4318 = (*spvDescriptorSet0.vp_c15)._m0[int(_4314)][_4316];
    float _4320 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4322 = _4268 + _4320;
    int _4324 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4326 = _4286 + _4324;
    int _4328 = _4326 + 1;
    int _4330 = _4294 + 48;
    uint _4332 = uint(int(uint(_4330) >> uint(2)));
    uint _4334 = uint(int(uint(int(_4332)) >> uint(2)));
    int _4336 = int(_4332) & 3;
    float _4338 = (*spvDescriptorSet0.vp_c15)._m0[int(_4334)][_4336];
    int _4340 = int(_4332) + 1;
    uint _4342 = uint(int(uint(_4340) >> uint(2)));
    int _4344 = _4340 & 3;
    float _4346 = (*spvDescriptorSet0.vp_c15)._m0[int(_4342)][_4344];
    float _4348 = floor(_4292);
    bool _4350 = _4328 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4352 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4354 = _4300 + _4352;
    int _4356 = _4354 + 1;
    int _4358 = _4294 + 104;
    uint _4360 = uint(int(uint(_4358) >> uint(2)));
    uint _4362 = uint(int(uint(int(_4360)) >> uint(2)));
    int _4364 = int(_4360) & 3;
    float _4366 = (*spvDescriptorSet0.vp_c15)._m0[int(_4362)][_4364];
    int _4368 = int(_4360) + 1;
    uint _4370 = uint(int(uint(_4368) >> uint(2)));
    int _4372 = _4368 & 3;
    float _4374 = (*spvDescriptorSet0.vp_c15)._m0[int(_4370)][_4372];
    int _4376 = as_type<int>(_3732);
    float _4378 = _4322;
    int _4380 = as_type<int>(_4292);
    float _4382 = as_type<float>(_4290);
    if (_4296)
    {
        float _4384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4376 = as_type<int>(_4384);
    }
    int _4386 = _4376;
    int _4388 = _4328 | _4356;
    bool _4390 = _4388 < 0;
    bool _4392 = _4390 || _4350;
    int _4394 = _4294 + 64;
    uint _4396 = uint(int(uint(_4394) >> uint(2)));
    uint _4398 = uint(int(uint(int(_4396)) >> uint(2)));
    int _4400 = int(_4396) & 3;
    float _4402 = (*spvDescriptorSet0.vp_c15)._m0[int(_4398)][_4400];
    int _4404 = int(_4396) + 1;
    uint _4406 = uint(int(uint(_4404) >> uint(2)));
    int _4408 = _4404 & 3;
    float _4410 = (*spvDescriptorSet0.vp_c15)._m0[int(_4406)][_4408];
    float _4412 = -_4348;
    float _4414 = _4292 + _4412;
    bool _4416 = _4356 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4418 = _4416 || _4392;
    int _4420 = _4294 + 56;
    uint _4422 = uint(int(uint(_4420) >> uint(2)));
    uint _4424 = uint(int(uint(int(_4422)) >> uint(2)));
    int _4426 = int(_4422) & 3;
    float _4428 = (*spvDescriptorSet0.vp_c15)._m0[int(_4424)][_4426];
    int _4430 = int(_4422) + 1;
    uint _4432 = uint(int(uint(_4430) >> uint(2)));
    int _4434 = _4430 & 3;
    float _4436 = (*spvDescriptorSet0.vp_c15)._m0[int(_4432)][_4434];
    int _4438 = _4386;
    if (_4296)
    {
        float _4440 = _4322 * as_type<float>(_4386);
        _4378 = _4440;
    }
    float _4442 = _4378;
    int _4444 = as_type<int>(_4442);
    if (_4296)
    {
        float _4446 = _4442 * 0.15915493667125701904296875;
        _3810 = _4446;
    }
    float _4448 = _3810;
    float _4450 = _4448;
    if (!_4418)
    {
        int _4452 = _4356 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4454 = _4452 + _4328;
        _4444 = _4454;
    }
    int _4456 = _4444;
    float _4458 = _3900;
    if (_4296)
    {
        float _4460 = _4448 * 6.283185482025146484375;
        float _4462 = cos(_4460);
        _4458 = _4462;
    }
    float _4464 = _4458;
    float _4466 = precise::max(0.0, _4220);
    if (!_4418)
    {
        int _4468 = _4456 << 2;
        _4438 = _4468;
    }
    int _4470 = _4438;
    float _4472 = -_4232;
    float _4474 = -_4466;
    float _4476 = fma(_4196, _4472, _4474);
    float _4478 = _4234 * _4318;
    float _4480 = as_type<float>(_4356);
    int _4482 = _4470;
    float _4484 = _4478;
    float _4486 = _4476;
    if (_4296)
    {
        float _4488 = _4448 * 6.283185482025146484375;
        float _4490 = sin(_4488);
        _4480 = _4490;
    }
    float _4492 = _4480;
    if (!_4418)
    {
        uint _4494 = uint(int(uint(_4456) >> uint(2)));
        _4380 = int(_4494);
    }
    int _4496 = _4380;
    float _4498 = fma(_3518, _4310, _4478);
    float _4500 = _4498;
    float _4502 = as_type<float>(_4496);
    if (!_4418)
    {
        int _4504 = 12 & _4470;
        _4482 = _4504;
    }
    int _4506 = _4482;
    float _4508 = _4234 * _4346;
    float _4510 = _4220;
    float _4512 = _4338;
    float _4514 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (_4296)
    {
        float _4516 = rsqrt(_4260);
        _4510 = _4516;
    }
    float _4518 = _4510;
    if (_4296)
    {
        float _4520 = _4476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4450 = _4520;
    }
    float _4522 = _4450;
    float _4524 = _4522;
    if (_4296)
    {
        float _4526 = _4464 + (-1.0);
        _4484 = _4526;
    }
    float _4528 = _4484;
    float _4530 = fma(_3518, _4338, _4508);
    if (!_4418)
    {
        int _4532 = _4496 << 4;
        int _4534 = _4532 + _4506;
        _3604 = _4534;
    }
    int _4536 = _3604;
    float _4538 = fma(_3546, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_4296)
    {
        _4512 = _4476;
    }
    float _4540 = _4512;
    float _4542 = fma(_3546, _4366, _4498);
    float _4544 = _4540;
    float _4546 = _4366;
    if (_4296)
    {
        float _4548 = fma(_4492, _4522, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4524 = _4548;
    }
    float _4550 = _4524;
    float _4552 = _4550;
    if (_4296)
    {
        float _4554 = _4528 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4500 = _4554;
    }
    float _4556 = _4500;
    if (!_4296)
    {
        _4514 = _4238;
    }
    float _4558 = _4514;
    float _4560 = _4174;
    float _4562 = _4558;
    if (!_4418)
    {
        int _4564 = _4536 + 400;
        uint _4566 = uint(int(uint(_4564) >> uint(2)));
        uint _4568 = uint(int(uint(int(_4566)) >> uint(2)));
        int _4570 = int(_4566) & 3;
        float _4572 = (*spvDescriptorSet0.vp_c15)._m0[int(_4568)][_4570];
        _4560 = _4572;
    }
    float _4574 = _4560;
    if (!_4296)
    {
        _4502 = _4240;
    }
    float _4576 = _4502;
    float _4578 = _4576;
    if (_4296)
    {
        float _4580 = fma(_4476, _4464, _4556);
        _4544 = _4580;
    }
    float _4582 = _4544;
    if (!_4296)
    {
        _4486 = _4250;
    }
    float _4584 = _4486;
    float _4586 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4588 = _4584;
    float _4590 = _4518;
    if (_4296)
    {
        float _4592 = _4518 * _4550;
        _4552 = _4592;
    }
    float _4594 = _4552;
    if (!_4296)
    {
        _4546 = _4252;
    }
    float _4596 = _4546;
    float _4598 = floor(_4538);
    int _4600 = _4294 + 72;
    uint _4602 = uint(int(uint(_4600) >> uint(2)));
    uint _4604 = uint(int(uint(int(_4602)) >> uint(2)));
    int _4606 = int(_4602) & 3;
    float _4608 = (*spvDescriptorSet0.vp_c15)._m0[int(_4604)][_4606];
    int _4610 = int(_4602) + 1;
    uint _4612 = uint(int(uint(_4610) >> uint(2)));
    int _4614 = _4610 & 3;
    float _4616 = (*spvDescriptorSet0.vp_c15)._m0[int(_4612)][_4614];
    float _4618 = _4596;
    if (_4296)
    {
        float _4620 = _4238 * _4594;
        _4562 = _4620;
    }
    float _4622 = _4562;
    if (_4296)
    {
        float _4624 = _4240 * _4594;
        _4578 = _4624;
    }
    float _4626 = _4578;
    float _4628 = _4234 * _4410;
    float _4630 = fma(_3546, _4428, _4530);
    if (_4296)
    {
        float _4632 = _4622 * _4622;
        _4588 = _4632;
    }
    float _4634 = _4588;
    if (_4296)
    {
        float _4636 = _4626 * _4626;
        _4618 = _4636;
    }
    float _4638 = _4618;
    float _4640 = fma(_3518, _4402, _4628);
    float _4642 = _4542 + _4374;
    float _4644 = fma(_4582, _4582, _4634);
    float _4646 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4648 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4650 = fma(_4186, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4586);
    float _4652 = _4644 + _4638;
    float _4654 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _4656 = _4294 + 80;
    uint _4658 = uint(int(uint(_4656) >> uint(2)));
    uint _4660 = uint(int(uint(int(_4658)) >> uint(2)));
    int _4662 = int(_4658) & 3;
    float _4664 = (*spvDescriptorSet0.vp_c15)._m0[int(_4660)][_4662];
    int _4666 = int(_4658) + 1;
    uint _4668 = uint(int(uint(_4666) >> uint(2)));
    int _4670 = _4666 & 3;
    float _4672 = (*spvDescriptorSet0.vp_c15)._m0[int(_4668)][_4670];
    float _4674 = fma(_4186, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4646);
    float _4676 = rsqrt(_4652);
    float _4678 = fma(_4186, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4654);
    float _4680 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4682 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4674);
    float _4684 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4650);
    float _4686 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4678);
    int _4688 = _4294 + 88;
    uint _4690 = uint(int(uint(_4688) >> uint(2)));
    uint _4692 = uint(int(uint(int(_4690)) >> uint(2)));
    int _4694 = int(_4690) & 3;
    float _4696 = (*spvDescriptorSet0.vp_c15)._m0[int(_4692)][_4694];
    int _4698 = int(_4690) + 1;
    uint _4700 = uint(int(uint(_4698) >> uint(2)));
    int _4702 = _4698 & 3;
    float _4704 = (*spvDescriptorSet0.vp_c15)._m0[int(_4700)][_4702];
    float _4706 = fma(_4186, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4680);
    float _4708 = 1.0 / _4642;
    float _4710 = _4686 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4712 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4714 = fma(_4236, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4712);
    float _4716 = precise::clamp(_4714, 0.0, 1.0);
    float _4718 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4706);
    float _4720 = _4630 + _4436;
    float _4722 = _4710 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4724 = _4684 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4726 = _4718 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4728 = _4676 * _4622;
    float _4730 = -_4722;
    float _4732 = fma(_4730, _4648, 1.0);
    float _4734 = _4682 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4736 = _4726 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4738 = _4728 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4740 = -_4598;
    float _4742 = _4538 + _4740;
    float _4744 = _4492;
    if (!_4418)
    {
        float _4746 = floor(_4276);
        _4744 = _4746;
    }
    float _4748 = _4744;
    float _4750 = fma(_4734, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4736);
    float _4752 = -_4716;
    float _4754 = _4752 + 1.0;
    float _4756 = _4676 * _4582;
    float _4758 = _4676 * _4626;
    float _4760 = _4720 * _4708;
    float _4762 = fma(_4710, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4750);
    float _4764 = -_4738;
    float _4766 = fma(_4756, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4764);
    float _4768 = abs(_4754);
    float _4770 = log2(_4768);
    float _4772 = fma(_3546, _4608, _4640);
    bool _4774 = _4760 >= 0.0;
    float _4776 = fma(_4724, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4762);
    float _4778 = -_4758;
    float _4780 = fma(_4778, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4766);
    float _4782 = _4772 + _4616;
    bool _4784 = _4760 <= 1.0;
    bool _4786 = _4784 && _4774;
    float _4788 = fma(_4780, -0.5, 0.5);
    float _4790 = _4782 * _4708;
    float _4792 = fma(_4780, 0.5, 0.5);
    float _4794 = _4754;
    if (!_4418)
    {
        float _4796 = floor(_4270);
        _4590 = _4796;
    }
    float _4798 = _4590;
    float _4800 = _4726 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4802 = _4748;
    if (!_4418)
    {
        float _4804 = -_4748;
        float _4806 = _4276 + _4804;
        _4794 = _4806;
    }
    float _4808 = _4794;
    bool _4810 = _4790 >= 0.0;
    bool _4812 = _4810 && _4786;
    float _4814 = _4234 * _4672;
    float _4816 = _4770 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _4818 = _4790 <= 1.0;
    bool _4820 = _4818 && _4812;
    float _4822 = sqrt(_4788);
    float _4824 = fma(_3518, _4664, _4814);
    float _4826 = fma(_3546, _4696, _4824);
    float _4828 = fma(_4792, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4830 = exp2(_4816);
    float _4832 = _4726 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4834 = _4826 + _4704;
    float _4836 = fma(_4792, _4828, -0.212114393711090087890625);
    if (_4820)
    {
        float _4838 = float(_4290);
        _4382 = _4838;
    }
    float _4840 = _4382;
    float _4842 = fma(_4734, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4832);
    float _4844 = _4756 + 1.0;
    float _4846 = fma(_4792, _4836, 1.570728778839111328125);
    float _4848 = log2(_4732);
    float _4850 = fma(_4734, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4800);
    float _4852 = fma(_4710, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4842);
    float _4854 = _4822 * 0.636619746685028076171875;
    if (!_4418)
    {
        float _4856 = -_4798;
        float _4858 = _4270 + _4856;
        _4802 = _4858;
    }
    float _4860 = _4802;
    float _4862 = fma(_4710, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4850);
    float _4864 = fma(_4724, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4852);
    float _4866 = -_4846;
    float _4868 = fma(_4854, _4866, 1.0);
    float _4870 = 1.0 / _4776;
    float _4872 = -_4756;
    float _4874 = fma(_4830, _4844, _4872);
    float _4876 = fma(_4724, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4862);
    float _4878 = _4834 * _4708;
    float _4880 = _4538;
    float _4882 = _4864;
    float _4884 = _4876;
    if (!_4418)
    {
        float _4886 = rint(_4574);
        float _4888 = precise::max(_4886, 0.0);
        uint _4890 = uint(_4888);
        uint _4892 = clamp(_4890, 0u, 65535u);
        _4880 = as_type<float>(_4892);
    }
    float _4894 = _4880;
    float _4896 = _4848 * 0.693147182464599609375;
    float _4898 = fma(_4874, 0.5, 0.5);
    float2 _12884 = float2(_4414, _4742);
    float _4900 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12884, float2(0.0), isnan(_12884)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12884, float2(0.0), isnan(_12884)), level(0.0)).x;
    float _4902 = _4896 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4904 = _4840;
    if (_4820)
    {
        float _4906 = rint(_4840);
        float _4908 = precise::max(_4906, 0.0);
        uint _4910 = uint(_4908);
        uint _4912 = clamp(_4910, 0u, 65535u);
        _4904 = as_type<float>(_4912);
    }
    float _4914 = _4904;
    float _4916 = _4864 * _4870;
    float _4918 = _4876 * _4870;
    float _4920 = fma(_4916, 0.5, 0.5);
    float _4922 = fma(_4918, -0.5, 0.5);
    float _4924 = _4894;
    if (!_4418)
    {
        float3 _12930 = float3(_4860, _4808, float(as_type<int>(_4894)));
        float3 _12934 = select(_12930, float3(0.0), isnan(_12930));
        float _4926 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12934.xy, uint(rint(_12934.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12934.xy, uint(rint(_12934.z)), level(0.0)).x;
        _4924 = _4926;
    }
    float _4928 = _4924;
    float _4930 = _4870;
    if (_4820)
    {
        float3 _12949 = float3(_4760, _4790, float(as_type<int>(_4914)));
        float3 _12951 = select(_12949, float3(0.0), isnan(_12949));
        float _4932 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12951.xy, uint(rint(_12951.z)), _4878, level(0.0));
        _4930 = _4932;
    }
    float _4934 = _4930;
    float3 _12961 = float3(_4920, _4922, _4902);
    float _4936 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12961, float3(0.0), isnan(_12961)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12961, float3(0.0), isnan(_12961)), level(0.0)).x;
    float3 _12970 = float3(_4920, _4922, _4902);
    float4 _4939 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12970, float3(0.0), isnan(_12970)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12970, float3(0.0), isnan(_12970)), level(0.0)).xyzw;
    float _4941 = _4939.x;
    float _4943 = _4939.y;
    float _4945 = _4939.z;
    float _4947 = _4939.w;
    float2 _12986 = float2(_4868, _4898);
    float3 _4951 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12986, float2(0.0), isnan(_12986)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12986, float2(0.0), isnan(_12986)), level(0.0)).xyz;
    float _4953 = _4951.x;
    float _4955 = _4951.y;
    float _4957 = _4951.z;
    float _4959 = abs(_4248);
    float _4961 = log2(_4959);
    float _4963 = _4726 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4965 = fma(_4734, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4963);
    float _4967 = fma(_4710, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4965);
    float _4969 = _4961 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4971 = exp2(_4969);
    float _4973 = fma(_4724, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4967);
    float _4975 = _4864 + _4776;
    float _4977 = _4776 * 0.5;
    float _4979 = _4973 + _4776;
    out.gl_Position.x = _4864;
    out.gl_Position.y = _4876;
    out.gl_Position.z = _4973;
    out.gl_Position.w = _4776;
    float _4981 = _4975 * 0.5;
    float _4983 = fma(_4876, -0.5, _4977);
    float _4985 = _4979 * 0.5;
    out.m_98.x = _4981;
    out.m_98.y = _4983;
    out.m_98.z = _4985;
    out.m_98.w = _4776;
    float _4987 = fma(_4971, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4989 = precise::clamp(_4987, 0.0, 1.0);
    float _4991 = fma(_4989, -2.0, 3.0);
    bool _4993 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4995 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4997 = _4993 || _4995;
    bool _4999 = isnan(0.5);
    bool _5001 = _4997 || _4999;
    float _5003 = _4770 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5005 = _4989 * _4989;
    float _5007 = _5005 * _4991;
    float _5009 = exp2(_5003);
    bool _5011 = _4248 <= 8000.0;
    bool _5013 = isnan(_4248);
    bool _5015 = _5011 || _5013;
    bool _5017 = isnan(8000.0);
    bool _5019 = _5015 || _5017;
    float _5021 = float(_5019);
    float _5023 = -_5007;
    float _5025 = _5023 + 1.0;
    float _5027 = _4973;
    if (_5001)
    {
        _4882 = 1.0;
    }
    float _5029 = _4882;
    float _5031 = fma(_5025, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5007);
    float _5033 = _5021 * _5031;
    float _5035 = _5029;
    if (!_5001)
    {
        float _5037 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _5039 = _5037 * 0.15915493667125701904296875;
        float _5041 = _5039 * 6.283185482025146484375;
        float _5043 = cos(_5041);
        float _5045 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _5047 = _5045 * 0.15915493667125701904296875;
        float _5049 = _5039 * 6.283185482025146484375;
        float _5051 = sin(_5049);
        float _5053 = 1.0 / _5043;
        float _5055 = _5047 * 6.283185482025146484375;
        float _5057 = cos(_5055);
        float _5059 = _5051 * _5053;
        float _5061 = _5047 * 6.283185482025146484375;
        float _5063 = sin(_5061);
        float _5065 = _5057 * _5059;
        float _5067 = 1.0 / _5065;
        float _5069 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5071 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5069;
        float _5073 = 1.0 / _5071;
        float _5075 = _5063 * _5067;
        float _5077 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5079 = fma(_4248, _5075, _5077);
        float _5081 = _5079 * _5073;
        float _5083 = precise::clamp(_5081, 0.0, 1.0);
        _5027 = _5073;
        _4884 = _5067;
        _5035 = _5083;
    }
    float _5085 = _5027;
    float _5087 = _4884;
    float _5089 = _5035;
    float _5091 = _5033 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5093 = -_4900;
    float _5095 = _5093 + 1.0;
    float _5097 = -_5009;
    float _5099 = _5097 + 1.0;
    float _5101 = _5085;
    float _5103 = _5087;
    float _5105 = _5091;
    if (!_4820)
    {
        _5101 = 1.0;
    }
    float _5107 = _5101;
    float _5109 = _5095 * _5091;
    float _5111 = precise::clamp(_5109, 0.0, 1.0);
    float _5113 = _5107;
    if (_4820)
    {
        bool _5115 = _4934 >= _4878;
        bool _5117 = isnan(_4934);
        bool _5119 = _5115 || _5117;
        bool _5121 = isnan(_4878);
        bool _5123 = _5119 || _5121;
        float _5125 = float(_5123);
        _5113 = _5125;
    }
    float _5127 = _5113;
    float _5129 = _5099 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5131 = _5129;
    if (_4418)
    {
        _5103 = 1.0;
    }
    float _5133 = _5103;
    float _5135 = _5133;
    if (!_4418)
    {
        int _5137 = _4456 << 4;
        int _5139 = _5137 + 2048;
        uint _5141 = uint(int(uint(_5139) >> uint(2)));
        uint _5143 = uint(int(uint(int(_5141)) >> uint(2)));
        int _5145 = int(_5141) & 3;
        float _5147 = (*spvDescriptorSet0.vp_c15)._m0[int(_5143)][_5145];
        int _5149 = int(_5141) + 1;
        uint _5151 = uint(int(uint(_5149) >> uint(2)));
        int _5153 = _5149 & 3;
        float _5155 = (*spvDescriptorSet0.vp_c15)._m0[int(_5151)][_5153];
        int _5157 = _5139 + 8;
        uint _5159 = uint(int(uint(_5157) >> uint(2)));
        uint _5161 = uint(int(uint(int(_5159)) >> uint(2)));
        int _5163 = int(_5159) & 3;
        float _5165 = (*spvDescriptorSet0.vp_c15)._m0[int(_5161)][_5163];
        int _5167 = int(_5159) + 1;
        uint _5169 = uint(int(uint(_5167) >> uint(2)));
        int _5171 = _5167 & 3;
        float _5173 = (*spvDescriptorSet0.vp_c15)._m0[int(_5169)][_5171];
        float _5175 = _4234 * _5155;
        float _5177 = fma(_3518, _5147, _5175);
        float _5179 = fma(_3546, _5165, _5177);
        float _5181 = _5179 + _5173;
        float _5183 = precise::clamp(_5181, 0.0, 1.0);
        float _5185 = -_5183;
        float _5187 = _5185 + _4928;
        float _5189 = fma(_5187, 500.0, 1.5);
        float _5191 = exp2(_5189);
        float _5193 = 0.0 + _5191;
        float _5195 = precise::clamp(_5193, 0.0, 1.0);
        _5135 = _5195;
        _5105 = _5147;
        _4280 = 500.0;
    }
    float _5197 = _5135;
    float _5199 = _5105;
    float _5201 = _4280;
    float _5203 = _5127 * _5197;
    float _5205 = _5129 * _4936;
    float _5207 = -_5111;
    float _5209 = fma(_5207, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5211 = -_5129;
    float _5213 = _5211 + 1.0;
    bool _5215 = _4236 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5217 = isnan(_4236);
    bool _5219 = _5215 || _5217;
    bool _5221 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5223 = _5219 || _5221;
    float _5225 = _4947 * _5205;
    float _5227 = -_5203;
    float _5229 = fma(_5227, _5209, 1.0);
    float _5231 = precise::clamp(_5229, 0.0, 1.0);
    float _5233 = _4957 * _5205;
    float _5235 = _4947 * _5213;
    float _5237 = fma(_4953, _5225, _4941);
    float _5239 = fma(_4955, _5225, _4943);
    float _5241 = _5231 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5243 = fma(_4947, _5233, _4945);
    float _5245 = _5089 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_100.x = _5241;
    float _5247 = _5199;
    float _5249 = _5201;
    float _5251 = _5213;
    float _5253 = _5231;
    float _5255 = _5225;
    if (!_5223)
    {
        _5131 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5257 = _5131;
    float _5259 = _5257;
    float _5261 = _5257;
    if (!_5223)
    {
        _5247 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5263 = _5247;
    out.m_102.x = _5237;
    out.m_102.y = _5239;
    out.m_102.z = _5243;
    out.m_102.w = _5235;
    float _5265 = _5263;
    float _5267 = _5263;
    if (!_5223)
    {
        _5249 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5269 = _5249;
    float _5271 = _5269;
    float _5273 = _5269;
    if (!_5223)
    {
        _5251 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5275 = _5251;
    float _5277 = _5275;
    float _5279 = _5275;
    if (!_5223)
    {
        _5253 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5281 = _5253;
    float _5283 = _5281;
    float _5285 = _5281;
    if (!_5223)
    {
        _5255 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5287 = _5255;
    bool _5289 = !_5223;
    float _5291 = _5287;
    float _5293 = _5287;
    if (!_5289)
    {
        bool _5295 = _4236 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5297 = isnan(_4236);
        bool _5299 = _5295 || _5297;
        bool _5301 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5303 = _5299 || _5301;
        if (!_5303)
        {
            float _5305 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5307 = _4236 + _5305;
            float _5309 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5311 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5309;
            float _5313 = 1.0 / _5311;
            float _5315 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5317 = _5315 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5319 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5321 = _5319 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5323 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5325 = _5323 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5327 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5329 = _5327 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5331 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5333 = _5331 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5335 = _5307 * _5313;
            float _5337 = precise::clamp(_5335, 0.0, 1.0);
            float _5339 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5341 = _5339 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5343 = fma(_5337, _5317, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5345 = fma(_5337, _5341, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5347 = fma(_5337, _5321, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5349 = fma(_5337, _5325, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5351 = fma(_5337, _5329, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5353 = fma(_5337, _5333, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5267 = _5343;
            _5285 = _5351;
            _5261 = _5345;
            _5279 = _5349;
            _5273 = _5347;
            _5293 = _5353;
            _5355 = true;
        }
        else
        {
            bool _5357 = _4236 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5359 = isnan(_4236);
            bool _5361 = _5357 || _5359;
            bool _5363 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5365 = _5361 || _5363;
            if (!_5365)
            {
                _5259 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5367 = _5259;
            _5261 = _5367;
            if (!_5365)
            {
                _5265 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5369 = _5265;
            _5267 = _5369;
            if (!_5365)
            {
                _5271 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5371 = _5271;
            _5273 = _5371;
            if (!_5365)
            {
                _5277 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5373 = _5277;
            _5279 = _5373;
            if (!_5365)
            {
                _5283 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5375 = _5283;
            _5285 = _5375;
            if (!_5365)
            {
                _5291 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5377 = _5291;
            bool _5379 = !_5365;
            _5293 = _5377;
            if (!_5379)
            {
                bool _5381 = _4236 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5383 = isnan(_4236);
                bool _5385 = _5381 || _5383;
                bool _5387 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5389 = _5385 || _5387;
                if (!_5389)
                {
                    float _5391 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5393 = _4236 + _5391;
                    float _5395 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5397 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5395;
                    float _5399 = 1.0 / _5397;
                    float _5401 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5403 = _5401 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5405 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5407 = _5405 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5409 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5411 = _5409 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5413 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5415 = _5413 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5417 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5419 = _5417 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5421 = _5393 * _5399;
                    float _5423 = precise::clamp(_5421, 0.0, 1.0);
                    float _5425 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5427 = _5425 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5429 = fma(_5423, _5403, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5431 = fma(_5423, _5427, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5433 = fma(_5423, _5407, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5435 = fma(_5423, _5411, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5437 = fma(_5423, _5415, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5439 = fma(_5423, _5419, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5267 = _5429;
                    _5285 = _5437;
                    _5261 = _5431;
                    _5279 = _5435;
                    _5273 = _5433;
                    _5293 = _5439;
                    _5355 = true;
                }
                else
                {
                    _5267 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5285 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5261 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5279 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5273 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5293 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5355 = false;
    float _5441 = _5267;
    float _5443 = _5285;
    float _5445 = _5261;
    float _5447 = _5279;
    float _5449 = _5273;
    float _5451 = _5293;
    float _5453 = fma(_3952, -0.5, 0.5);
    float _5455 = precise::clamp(_5453, 0.0, 1.0);
    float _5457 = -_5441;
    float _5459 = _5457 + _5443;
    float _5461 = _5245 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5463 = -_5445;
    float _5465 = _5463 + _5447;
    out.m_104.x = 0.0;
    float _5467 = fma(_5455, _5459, _5441);
    float _5469 = fma(_5455, _5465, _5445);
    out.m_65.x = _5461;
    float _5471 = -_5449;
    float _5473 = _5471 + _5451;
    float _5475 = _5467 * 0.586610972881317138671875;
    bool _5477 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5479 = fma(_5455, _5473, _5449);
    float _5481 = fma(_5469, 0.298911988735198974609375, _5475);
    bool _5483 = _5089 > 0.0;
    bool _5485 = isnan(_5089);
    bool _5487 = _5483 || _5485;
    bool _5489 = isnan(0.0);
    bool _5491 = _5487 || _5489;
    float _5493 = fma(_5479, 0.114477999508380889892578125, _5481);
    float _5495 = -_5493;
    float _5497 = _5469 + _5495;
    float _5499 = -_5493;
    float _5501 = _5467 + _5499;
    float _5503 = -_5493;
    float _5505 = _5479 + _5503;
    float _5507 = fma(_5497, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5493);
    float _5509 = fma(_5501, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5493);
    float _5511 = fma(_5505, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5493);
    bool _5513 = !_5477;
    if (!_5513)
    {
        float _5515 = -_4182;
        float _5517 = _5515 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5519 = -_4186;
        float _5521 = _5519 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5523 = -_4192;
        float _5525 = _5523 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5527 = _5517 * _5517;
        float _5529 = fma(_5521, _5521, _5527);
        float _5531 = fma(_5525, _5525, _5529);
        float _5533 = sqrt(_5531);
        float _5535 = rsqrt(_5531);
        float _5537 = -_5533;
        float _5539 = _5537 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5541 = _5539 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5543 = precise::clamp(_5541, 0.0, 1.0);
        float _5545 = _5521 * _5535;
        float _5547 = _5517 * _5535;
        float _5549 = abs(_5543);
        float _5551 = log2(_5549);
        float _5553 = _5525 * _5535;
        float _5555 = _5545 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5557 = _3952 * _5547;
        float _5559 = -_5547;
        float _5561 = -_5555;
        float _5563 = fma(_5559, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5561);
        float _5565 = fma(_3956, _5545, _5557);
        float _5567 = -_5553;
        float _5569 = fma(_5567, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5563);
        float _5571 = fma(_3958, _5553, _5565);
        float _5573 = precise::clamp(_5571, 0.0, 1.0);
        float _5575 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5577 = _5569 + _5575;
        float _5579 = _5551 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5581 = _5577 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5583 = precise::clamp(_5581, 0.0, 1.0);
        float _5585 = exp2(_5579);
        float _5587 = _5585 * _5583;
        float _5589 = _5573 * _5587;
        float _5591 = _5589 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5593 = _5589 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5595 = _5589 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _5591;
        out.m_104.y = _5593;
        out.m_104.z = _5595;
    }
    out.m_106.x = _5507;
    out.m_106.y = _5509;
    out.m_106.z = _5511;
    if (_5491)
    {
        return out;
    }
    out.m_65.x = 0.0;
    float _5597 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5597;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5355 = false;
    bool _4006 = false;
    bool _449 = false;
    bool _343 = false;
    bool _247 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_58.w;
    float _122 = in.m_60.w;
    float _124 = trunc(_120);
    int _127 = int(_124);
    float _129 = -_122;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_63.y = _131;
    bool _135 = _127 >= 1;
    float _137 = 0.0;
    float _139 = as_type<float>(_127);
    float _141 = _131;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _137;
    if (!_135)
    {
        out.m_65.x = 0.0;
    }
    int _145 = 0;
    if (!_135)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    int _151 = _149;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5666 = as_type<float>(_149);
        out.gl_Position.z = _5666;
    }
    if (!_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _153 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_122);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = float(_127);
    bool _165 = _131 >= _163;
    bool _167 = !_161;
    bool _169 = _165 || _167;
    float _171 = 1.0 / _163;
    if (_169)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _139;
    if (_169)
    {
        out.m_65.x = 0.0;
    }
    float _175 = _131 * _171;
    float _177 = _175;
    if (_169)
    {
        float _179 = _173 * 5.0;
        _151 = as_type<int>(_179);
    }
    int _181 = _151;
    out.m_63.x = _175;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5729 = as_type<float>(_181);
        out.gl_Position.z = _5729;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _183 = as_type<float>(int(gl_VertexIndex));
    float _185 = in.m_70.x;
    float _187 = in.m_70.y;
    float _189 = in.m_70.z;
    int _191 = as_type<int>(_183) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_183) & 2;
    bool _197 = _195 != 0;
    bool _199 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _201 = _187 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _203 = _187 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _205 = _187 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _207 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[4].x, _201);
    float _209 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[5].x, _203);
    float _211 = fma(_185, (*spvDescriptorSet0.vp_c10)._m0[6].x, _205);
    float _213 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[4].z, _207);
    float _215 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[5].z, _209);
    float _217 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[6].z, _211);
    bool _219 = !_193;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_197;
    float _225 = _223 ? (-0.5) : 0.5;
    bool _227 = !_199;
    float _245;
    if (!_227)
    {
        float _229 = in.m_72.x;
        float _231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _233 = _229 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _237 = _235 * _231;
        float _239 = floor(_237);
        float _241 = -_239;
        float _243 = _237 + _241;
        _245 = _243;
        _247 = true;
    }
    else
    {
        _245 = _175;
    }
    _247 = false;
    float _249 = _245;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = _249 + _251;
    bool _255 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _257 = isnan(_249);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -_265;
    float _273 = _271 + 1.0;
    bool _275 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _277 = isnan(_249);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _287;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = 1.0 / _269;
    float _295 = _285 * _273;
    float _297 = -_285;
    float _299 = _297 + 1.0;
    float _301 = _253 * _293;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _305 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _303;
    float _307 = fma(_289, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _309 = fma(_305, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _311 = _307 * _295;
    float _313 = _309 * _295;
    float _315 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].x, _311);
    float _317 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].y, _313);
    float _319 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[144].x, _315);
    float _321 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[144].y, _317);
    bool _323 = !_291;
    float _341;
    if (!_323)
    {
        float _325 = in.m_72.x;
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _329 = _325 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        _341 = _175;
    }
    _343 = false;
    float _345 = _341;
    float _347 = in.m_74.x;
    float _349 = in.m_74.y;
    bool _351 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _353 = isnan(_345);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _367 = _345 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _369 = isnan(_345);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _385 = _345 + _383;
    float _387 = -_361;
    float _389 = _387 + 1.0;
    bool _391 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _393 = 1.0 / _365;
    float _395 = _377 * _389;
    float _397 = -_377;
    float _399 = _397 + 1.0;
    float _401 = _321 * _349;
    float _403 = _319 * _347;
    float _405 = _381 * _393;
    float _407 = fma(_405, _385, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _411 = _407 * _395;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _415 = _409 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _417 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[115].x, _411);
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _421 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[116].x, _417);
    float _425 = _419 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _427 = _423 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_76.x = _425;
    out.m_76.y = _421;
    out.m_76.z = _415;
    out.m_76.w = _427;
    bool _429 = !_391;
    float _447;
    if (!_429)
    {
        float _431 = in.m_72.x;
        float _433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _435 = _431 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _437 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _439 = _437 * _433;
        float _441 = floor(_439);
        float _443 = -_441;
        float _445 = _439 + _443;
        _447 = _445;
        _449 = true;
    }
    else
    {
        _447 = _175;
    }
    _449 = false;
    float _451 = _447;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _455 = _451 + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _465 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _467 = isnan(_451);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _477;
    float _481 = 1.0 / _459;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _487 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _489 = isnan(_451);
    bool _491 = _487 || _489;
    bool _493 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _495 = _491 || _493;
    float _497 = float(_495);
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _503 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _505 = isnan(_451);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = 1.0 / _463;
    float _517 = -_497;
    float _519 = _517 + 1.0;
    bool _521 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _523 = _475 * _519;
    float _525 = _479 * _481;
    bool _527 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _529 = isnan(_451);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -_475;
    float _541 = _539 + 1.0;
    float _543 = 1.0 / _485;
    float _545 = fma(_525, _455, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _547;
    float _551 = _537 * _541;
    float _553 = -_537;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _561 = 1.0 / _501;
    float _563 = _513 * _555;
    float _565 = _559 * _515;
    float _567 = -_513;
    float _569 = _567 + 1.0;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _573 = _451 + _571;
    float _575 = _545 * _563;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _579 = _451 + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _585 = _549 * _543;
    bool _587 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _589 = isnan(_451);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = fma(_565, _579, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _601 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[131].x, _575);
    float _603 = fma(_585, _573, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _607 = _451 + _605;
    float _609 = -_597;
    float _611 = _609 + 1.0;
    float _613 = fma(_599, _551, _601);
    float _615 = _583 * _561;
    float _617 = _497 * _611;
    float _619 = fma(_603, _523, _613);
    float _621 = fma(_615, _607, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _625 = fma(_621, _617, _619);
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _629 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _633 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[135].x, _625);
    float _635 = _627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _637 = _631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _639 = _633 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _629;
    out.m_78.y = _635;
    out.m_78.z = _637;
    out.m_78.w = _639;
    bool _641 = !_521;
    float _643 = _551;
    if (!_641)
    {
        float _645 = in.m_72.x;
        float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _649 = _645 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _651 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _653 = _651 * _647;
        float _655 = floor(_653);
        float _657 = -_655;
        float _659 = _653 + _657;
        _177 = _659;
    }
    float _661 = _177;
    float _663 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _665 = int(_663);
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _669 = _667 != 0;
    float _671 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _673 = int(_671);
    float _675 = float(_665);
    float _677 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _679 = int(_677);
    if (_669)
    {
        _643 = 1.0;
    }
    float _681 = _643;
    float _683 = float(_673);
    float _685 = 1.0 / _675;
    float _687 = 1.0 / _683;
    float _689 = float(uint(_679));
    int _691 = ~_679;
    int _693 = _691 + 1;
    float _695 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _697 = int(_695);
    float _699 = _685 * _131;
    float _701 = _683;
    float _703 = _685;
    float _705 = _681;
    if (_669)
    {
        float _707 = in.m_72.x;
        float _709 = in.m_72.y;
        _701 = _707;
        _703 = _709;
    }
    float _711 = _701;
    float _713 = _703;
    float _715 = _687 * _131;
    float _717 = 1.0 / _689;
    float _719 = float(uint(_697));
    float _721 = trunc(_715);
    int _723 = int(_721);
    float _725 = 1.0 / _719;
    int _727 = as_type<int>(_717) + (-2);
    int _729 = as_type<int>(_717);
    if (_669)
    {
        _729 = 0;
    }
    int _731 = _729;
    float _733 = 0.0;
    float _735 = _711;
    float _737 = _713;
    int _739 = _731;
    if (_669)
    {
        _733 = _713;
    }
    float _741 = _733;
    float _743 = trunc(_699);
    int _745 = int(_743);
    float _747 = float(uint(_723));
    float _749 = as_type<float>(_727) * _747;
    float _751 = _747;
    float _753 = _741;
    if (_669)
    {
        _751 = _711;
    }
    float _755 = _751;
    float _757 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _759 = int(_757);
    int _761 = as_type<int>(_725) + (-2);
    float _763 = 0.0;
    float _765 = _755;
    if (_669)
    {
        _763 = _755;
    }
    float _767 = _763;
    float _769 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _771 = int(_769);
    float _773 = float(uint(_745));
    float _775 = as_type<float>(_761) * _773;
    float _777 = _773;
    float _779 = _767;
    if (_669)
    {
        _777 = 1.0;
    }
    float _781 = _777;
    float _783 = trunc(_749);
    float _785 = precise::max(_783, 0.0);
    uint _788 = uint(_785);
    float _790 = float(uint(_759));
    float _792 = trunc(_775);
    float _794 = precise::max(_792, 0.0);
    uint _796 = uint(_794);
    float _798 = float(_771);
    float _800 = 1.0 / _798;
    float _802 = 1.0 / _790;
    float _804 = _798;
    int _806 = as_type<int>(_790);
    float _808 = _781;
    if (_669)
    {
        _804 = _755;
    }
    float _810 = _804;
    float _812 = _810;
    if (_669)
    {
        _806 = 0;
    }
    int _814 = _806;
    int _816 = _814;
    if (!_669)
    {
        float _818 = in.m_72.x;
        float _820 = in.m_72.y;
        float _822 = in.m_72.z;
        float _824 = _818 * 3.1415927410125732421875;
        float _826 = _824 * 0.15915493667125701904296875;
        float _828 = _820 * 3.1415927410125732421875;
        float _830 = _828 * 0.15915493667125701904296875;
        float _832 = _826 * 6.283185482025146484375;
        float _834 = sin(_832);
        float _836 = _830 * 6.283185482025146484375;
        float _838 = sin(_836);
        _705 = 7.345489978790283203125;
        _735 = _818;
        _808 = 5.839270114898681640625;
        _812 = _822;
        _765 = _820;
        _737 = _820;
        _739 = 1;
        _753 = _838;
        _816 = 2;
        _779 = _834;
    }
    float _840 = _705;
    float _842 = _735;
    float _844 = _808;
    float _846 = _812;
    float _848 = _765;
    float _850 = _737;
    int _852 = _739;
    float _854 = _753;
    int _856 = _816;
    float _858 = _779;
    int _860 = _693 * int(_788);
    int _862 = _860 + _723;
    int _864 = ~_697;
    int _866 = _864 + 1;
    float _868 = _800 * _131;
    float _870 = _840 * _842;
    float _872 = in.m_72.z;
    float _874 = in.m_72.w;
    float _876 = _844 * _846;
    float _878 = float(uint(_862));
    int _880 = _866 * int(_796);
    int _882 = _880 + _745;
    float _884 = floor(_870);
    float _886 = float(_679);
    float _888 = _840 * _848;
    float _890 = as_type<float>(_727) * _878;
    float _892 = float(uint(_882));
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _896 = _661 + _894;
    float _898 = float(_723);
    float _900 = _850 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _902 = trunc(_868);
    int _904 = int(_902);
    float _906 = as_type<float>(_761) * _892;
    bool _908 = _898 >= _886;
    bool _910 = isnan(_898);
    bool _912 = _908 || _910;
    bool _914 = isnan(_886);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = _842 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _922 = _403 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _924 = as_type<int>(_802) + (-2);
    float _926 = trunc(_890);
    float _928 = precise::max(_926, 0.0);
    uint _930 = uint(_928);
    float _932 = -_884;
    float _934 = _870 + _932;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _938 = _936 != 0;
    bool _940 = _874 > 0.5;
    bool _942 = _872 > 0.5;
    float _944 = floor(_876);
    float _946 = float(uint(_904));
    bool _948 = _850 > 0.5;
    int _950 = ~_679;
    int _952 = _950 + 1;
    float _954 = as_type<float>(_924) * _946;
    int _956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _958 = _956 != 0;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _962 = _960 != 0;
    int _964 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _966 = _964 != 0;
    float _968 = trunc(_906);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    int _974 = int(_788) + int(_930);
    int _976 = ~_697;
    int _978 = _976 + 1;
    float _980 = -_221;
    int _982 = _948 ? as_type<int>(_980) : as_type<int>(_221);
    float _984 = -_944;
    float _986 = _876 + _984;
    float _988 = -_225;
    int _990 = _942 ? as_type<int>(_988) : as_type<int>(_225);
    float _992 = trunc(_954);
    float _994 = precise::max(_992, 0.0);
    uint _996 = uint(_994);
    int _998 = _952 * _974;
    int _1000 = _998 + _723;
    bool _1002 = !_966;
    float _1004 = _1002 ? _225 : as_type<float>(_990);
    float _1006 = _934 * _886;
    int _1008 = int(_796) + int(_972);
    float _1010 = floor(_888);
    int _1012 = int(_940);
    int _1014 = _942 ? 2 : 0;
    int _1016 = _1012 | _1014;
    int _1018 = _938 ? 4 : 0;
    int _1020 = _1016 | _1018;
    int _1022 = _958 ? 8 : 0;
    int _1024 = _1020 | _1022;
    int _1026 = _962 ? 16 : 0;
    int _1028 = _1024 | _1026;
    int _1030 = _966 ? 32 : 0;
    int _1032 = _1028 | _1030;
    int _1034 = _948 ? 64 : 0;
    int _1036 = _1032 | _1034;
    int _1038 = _1036 & 64;
    bool _1040 = !_962;
    float _1042 = _1040 ? _221 : as_type<float>(_982);
    int _1044 = _978 * _1008;
    int _1046 = _1044 + _745;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1050 = _1048 != 0;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1054 = _1052 != 0;
    int _1056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1058 = _1056 != 0;
    bool _1060 = !_938;
    int _1062 = _1060 ? 0 : 1;
    float _1064 = trunc(_1006);
    int _1066 = int(_1064);
    float _1068 = float(_697);
    float _1070 = float(_745);
    bool _1072 = uint(_1000) >= uint(_679);
    float _1074 = _986 * _1068;
    int _1076 = ~_759;
    int _1078 = _1076 + 1;
    float _1080 = trunc(_918);
    int _1082 = int(_1080);
    bool _1084 = !_1054;
    int _1086 = _1084 ? 0 : 1;
    bool _1088 = !_1050;
    int _1090 = _1088 ? 0 : 1;
    int _1092 = _1078 * int(_996);
    int _1094 = _1092 + _904;
    int _1096 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1098 = _1096 != 0;
    bool _1100 = uint(_1046) >= uint(_697);
    float _1102 = trunc(_1074);
    int _1104 = int(_1102);
    bool _1106 = _1070 >= _1068;
    bool _1108 = isnan(_1070);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(_1068);
    bool _1114 = _1110 || _1112;
    float _1116 = float(_1114);
    bool _1118 = !_1058;
    int _1120 = _1118 ? 0 : 1;
    bool _1122 = !_1098;
    int _1124 = _1122 ? 0 : 1;
    bool _1126 = !_1100;
    int _1128 = _1126 ? 0 : (-1);
    float _1130 = trunc(_1116);
    int _1132 = int(_1130);
    bool _1134 = !_1072;
    int _1136 = _1134 ? 0 : (-1);
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1140 = _1138 != 0;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1144 = _1142 != 0;
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1148 = _1146 != 0;
    int _1150 = abs(_1062);
    int _1152 = ~_974;
    int _1154 = _1152 + _1136;
    int _1156 = _1154 + 1;
    float _1158 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1160 = log2(_1158);
    float _1162 = -_1010;
    float _1164 = _888 + _1162;
    float _1166 = float(uint(_1094));
    int _1168 = _1066 * _1150;
    int _1170 = _1168 + _723;
    bool _1172 = !_1144;
    int _1174 = _1172 ? 0 : 1;
    int _1176 = _679 * _1156;
    int _1178 = _1176 + _723;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1182 = _1180 != 0;
    float _1184 = as_type<float>(_924) * _1166;
    bool _1186 = _1038 != 0;
    float _1188 = _171 * _131;
    int _1190 = ~_1008;
    int _1192 = _1190 + _1128;
    int _1194 = _1192 + 1;
    bool _1196 = !_1182;
    int _1198 = _1196 ? 0 : 1;
    float _1200 = _886 * _1188;
    bool _1202 = _679 == 0;
    int _1204 = _697 * _1194;
    int _1206 = _1204 + _745;
    bool _1208 = !_1140;
    int _1210 = _1208 ? 0 : 1;
    float _1212 = trunc(_1184);
    float _1214 = precise::max(_1212, 0.0);
    uint _1216 = uint(_1214);
    bool _1218 = _697 == 0;
    float _1220 = _1068 * _1188;
    int _1222 = ~_1082;
    int _1224 = _1222 + 1;
    int _1226 = _1224 + 1;
    bool _1228 = !_1202;
    int _1230 = _1228 ? _1178 : (-1);
    int _1232 = ~_1132;
    int _1234 = _1232 + 1;
    int _1236 = _1234 + 1;
    float _1238 = trunc(_1200);
    int _1240 = int(_1238);
    bool _1242 = !_1218;
    int _1244 = _1242 ? _1206 : (-1);
    int _1246 = _1230 * _1226;
    int _1248 = _679 + (-1);
    int _1250 = abs(_1086);
    int _1252 = _1244 * _1236;
    int _1254 = _697 + (-1);
    int _1256 = _1082 * _1248;
    int _1258 = _1256 + _1246;
    int _1260 = abs(_1174);
    float _1262 = trunc(_1220);
    int _1264 = int(_1262);
    int _1266 = abs(_1090);
    int _1268 = _1132 * _1254;
    int _1270 = _1268 + _1252;
    int _1272 = _1258 * _1250;
    int _1274 = abs(_1198);
    float _1276 = _842 * 2.0;
    int _1278 = ~_759;
    int _1280 = _1278 + 1;
    int _1282 = _1270 * _1260;
    int _1284 = abs(_1120);
    int _1286 = _1240 * _1266;
    int _1288 = _1286 + _1272;
    int _1290 = abs(_1124);
    int _1292 = _1104 * _1274;
    int _1294 = _1292 + _745;
    int _1296 = int(_996) + int(_1216);
    int _1298 = _1170 * _1284;
    int _1300 = _1298 + _1288;
    float _1302 = floor(_1276);
    int _1304 = abs(_1210);
    int _1306 = _1280 * _1296;
    int _1308 = _1306 + _904;
    float _1310 = -_225;
    int _1312 = _940 ? as_type<int>(_1310) : as_type<int>(_225);
    int _1314 = _1066 * _1290;
    int _1316 = _1314 + _1300;
    float _1318 = -_221;
    int _1320 = _942 ? as_type<int>(_1318) : as_type<int>(_221);
    int _1322 = _1264 * _1304;
    int _1324 = _1322 + _1282;
    bool _1326 = uint(_1308) >= uint(_759);
    float _1328 = float(_759);
    float _1330 = float(_904);
    int _1332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1334 = _1332 != 0;
    float _1336 = _1328 * _1188;
    bool _1338 = !_1148;
    int _1340 = _1338 ? 0 : 1;
    float _1342 = float(uint(_1316));
    bool _1344 = _1330 >= _1328;
    bool _1346 = isnan(_1330);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan(_1328);
    bool _1352 = _1348 || _1350;
    float _1354 = float(_1352);
    float _1356 = _1164 * _1328;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1360 = _1358 != 0;
    float _1362 = as_type<float>(_727) * _1342;
    bool _1364 = !_1334;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = trunc(_1336);
    int _1370 = int(_1368);
    int _1372 = abs(_1340);
    bool _1374 = !_958;
    float _1376 = _1374 ? _225 : as_type<float>(_1312);
    bool _1378 = !_1360;
    int _1380 = _1378 ? 0 : 1;
    int _1382 = abs(_1366);
    float _1384 = trunc(_1362);
    float _1386 = precise::max(_1384, 0.0);
    uint _1388 = uint(_1386);
    bool _1390 = !_1326;
    int _1392 = _1390 ? 0 : (-1);
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1396 = _1394 != 0;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1400 = _1398 != 0;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1408 = _1406 != 0;
    int _1410 = _1294 * _1372;
    int _1412 = _1410 + _1324;
    float _1414 = trunc(_1354);
    int _1416 = int(_1414);
    int _1418 = ~_679;
    int _1420 = _1418 + 1;
    bool _1422 = !_1400;
    int _1424 = _1422 ? 0 : 1;
    int _1426 = _1104 * _1382;
    int _1428 = _1426 + _1412;
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1432 = _1430 != 0;
    int _1434 = ~_1296;
    int _1436 = _1434 + _1392;
    int _1438 = _1436 + 1;
    int _1440 = _1420 * int(_1388);
    int _1442 = _1440 + _1316;
    float _1444 = float(uint(_1428));
    float _1446 = trunc(_1356);
    int _1448 = int(_1446);
    bool _1450 = !_1396;
    int _1452 = _1450 ? 0 : 1;
    int _1454 = _759 * _1438;
    int _1456 = _1454 + _904;
    bool _1458 = _759 == 0;
    float _1460 = as_type<float>(_761) * _1444;
    float _1462 = float(uint(_1442));
    int _1464 = ~_1416;
    int _1466 = _1464 + 1;
    int _1468 = _1466 + 1;
    float _1470 = _1444;
    if (_1432)
    {
        float _1472 = in.m_72.w;
        _1470 = _1472;
    }
    float _1474 = _1470;
    bool _1476 = !_1458;
    int _1478 = _1476 ? _1456 : (-1);
    float _1480 = as_type<float>(_727) * _1462;
    float _1482 = trunc(_1460);
    float _1484 = precise::max(_1482, 0.0);
    uint _1486 = uint(_1484);
    int _1488 = abs(_1424);
    int _1490 = _1478 * _1468;
    int _1492 = _759 + (-1);
    int _1494 = abs(_1452);
    float _1496 = trunc(_1480);
    float _1498 = precise::max(_1496, 0.0);
    uint _1500 = uint(_1498);
    int _1502 = abs(_1380);
    int _1504 = _1416 * _1492;
    int _1506 = _1504 + _1490;
    int _1508 = _1506 * _1488;
    int _1510 = ~_697;
    int _1512 = _1510 + 1;
    bool _1514 = _679 == 0;
    int _1516 = _1370 * _1494;
    int _1518 = _1516 + _1508;
    int _1520 = _1448 * _1502;
    int _1522 = _1520 + _904;
    float _1524 = as_type<float>(_1502);
    if (_1432)
    {
        float _1526 = _1474 * 3.1415927410125732421875;
        _1524 = _1526;
    }
    float _1528 = _1524;
    int _1530 = ~_679;
    int _1532 = _1530 + 1;
    int _1534 = _1512 * int(_1486);
    int _1536 = _1534 + _1428;
    float _1538 = _1528;
    if (_1432)
    {
        float _1540 = _1528 * 0.15915493667125701904296875;
        _1538 = _1540;
    }
    float _1542 = _1538;
    int _1544 = int(_1388) + int(_1500);
    bool _1546 = !_1404;
    int _1548 = _1546 ? 0 : 1;
    float _1550 = float(uint(_1536));
    float _1552 = _1542;
    if (_1432)
    {
        float _1554 = _1542 * 6.283185482025146484375;
        float _1556 = sin(_1554);
        _1552 = _1556;
    }
    float _1558 = _1552;
    int _1560 = _1532 * _1544;
    int _1562 = _1560 + _1316;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1566 = _1564 != 0;
    int _1568 = abs(_1548);
    float _1570 = as_type<float>(_761) * _1550;
    bool _1572 = !_1408;
    int _1574 = _1572 ? 0 : 1;
    bool _1576 = uint(_1562) >= uint(_679);
    int _1578 = _1522 * _1568;
    int _1580 = _1578 + _1518;
    float _1582 = float(uint(_1170));
    float _1584 = trunc(_1570);
    float _1586 = precise::max(_1584, 0.0);
    uint _1588 = uint(_1586);
    int _1590 = abs(_1574);
    bool _1592 = !_1576;
    int _1594 = _1592 ? 0 : (-1);
    float _1596 = as_type<float>(_727) * _1582;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1600 = _1598 != 0;
    int _1602 = _1448 * _1590;
    int _1604 = _1602 + _1580;
    int _1606 = ~_1544;
    int _1608 = _1606 + _1594;
    int _1610 = _1608 + 1;
    float _1612 = as_type<float>(_1490);
    bool _1614 = _1600;
    if (_1566)
    {
        float _1616 = in.m_72.x;
        _1612 = _1616;
    }
    float _1618 = _1612;
    bool _1620 = !_1600;
    float _1622 = _1620 ? _221 : as_type<float>(_1320);
    float _1624 = trunc(_1596);
    float _1626 = precise::max(_1624, 0.0);
    uint _1628 = uint(_1626);
    if (_1432)
    {
        bool _1630 = _1558 > 0.5;
        _1614 = _1630;
    }
    bool _1632 = _1614;
    int _1634 = _679 * _1610;
    int _1636 = _1634 + _1316;
    float _1638 = float(uint(_1604));
    int _1640 = ~_679;
    int _1642 = _1640 + 1;
    bool _1644 = !_1514;
    int _1646 = _1644 ? _1636 : (-1);
    float _1648 = as_type<float>(_924) * _1638;
    float _1650 = 0.0;
    float _1652 = _1638;
    if (!_1432)
    {
        _1650 = _221;
    }
    float _1654 = _1650;
    float _1656 = trunc(_1648);
    float _1658 = precise::max(_1656, 0.0);
    uint _1660 = uint(_1658);
    float _1662 = _1654;
    if (_1432)
    {
        float _1664 = -_221;
        float _1666 = _1632 ? _1664 : _221;
        _1662 = _1666;
    }
    float _1668 = _1662;
    int _1670 = _1646 & 3;
    bool _1672 = _1670 != 0;
    int _1674 = _1642 * int(_1628);
    int _1676 = _1674 + _1170;
    int _1678 = _1646 & 3;
    bool _1680 = _1678 != 0;
    int _1682 = _1672 ? 0 : 1;
    bool _1684 = uint(_1678) > 1u;
    if (_1566)
    {
        float _1686 = _1618 * 3.1415927410125732421875;
        _1652 = _1686;
    }
    float _1688 = _1652;
    int _1690 = int(_1486) + int(_1588);
    float _1692 = float(uint(_1294));
    float _1694 = _1688;
    if (_1566)
    {
        float _1696 = _1688 * 0.15915493667125701904296875;
        _1694 = _1696;
    }
    float _1698 = _1694;
    float _1700 = float(uint(_1676));
    int _1702 = ~_759;
    int _1704 = _1702 + 1;
    float _1706 = as_type<float>(_761) * _1692;
    int _1708 = ~_697;
    int _1710 = _1708 + 1;
    float _1712 = as_type<float>(_727) * _1700;
    int _1714 = ~_1682;
    int _1716 = _1714 + 1;
    int _1718 = _1716 + 1;
    int _1720 = _1704 * int(_1660);
    int _1722 = _1720 + _1604;
    float _1724 = -_225;
    int _1726 = _1186 ? as_type<int>(_1724) : as_type<int>(_225);
    int _1728 = _1710 * _1690;
    int _1730 = _1728 + _1428;
    float _1732 = trunc(_1706);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    int _1738 = _1718;
    if (!_1684)
    {
        int _1740 = ~_1682;
        int _1742 = _1740 + 1;
        _1738 = _1742;
    }
    int _1744 = _1738;
    bool _1746 = uint(_1678) >= 2u;
    int _1748 = ~_697;
    int _1750 = _1748 + 1;
    float _1752 = float(uint(_1722));
    float _1754 = _1698;
    if (_1566)
    {
        float _1756 = _1698 * 6.283185482025146484375;
        float _1758 = sin(_1756);
        _1754 = _1758;
    }
    float _1760 = _1754;
    bool _1762 = uint(_1730) >= uint(_697);
    int _1764 = _1746 ? 0 : 1;
    float _1766 = as_type<float>(_924) * _1752;
    bool _1768 = _1678 != 3;
    float _1770 = trunc(_1712);
    float _1772 = precise::max(_1770, 0.0);
    uint _1774 = uint(_1772);
    bool _1776 = !_1762;
    int _1778 = _1776 ? 0 : (-1);
    int _1780 = _1750 * int(_1736);
    int _1782 = _1780 + _1294;
    int _1784 = ~_1764;
    int _1786 = _1784 + 1;
    int _1788 = _1786 + 1;
    int _1790 = ~_1690;
    int _1792 = _1790 + _1778;
    int _1794 = _1792 + 1;
    float _1796 = trunc(_1766);
    float _1798 = precise::max(_1796, 0.0);
    uint _1800 = uint(_1798);
    float _1802 = float(uint(_1782));
    int _1804 = _697 * _1794;
    int _1806 = _1804 + _1428;
    float _1808 = 0.0;
    int _1810 = _1788;
    bool _1812 = _1768;
    if (!_1566)
    {
        _1808 = _225;
    }
    float _1814 = _1808;
    float _1816 = _1814;
    if (_1768)
    {
        int _1818 = ~_1764;
        int _1820 = _1818 + 1;
        _1810 = _1820;
    }
    int _1822 = _1810;
    float _1824 = as_type<float>(_761) * _1802;
    if (_1566)
    {
        bool _1826 = _1760 > 0.5;
        _1812 = _1826;
    }
    bool _1828 = _1812;
    bool _1830 = !_1218;
    int _1832 = _1830 ? _1806 : (-1);
    int _1834 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1836 = _1834 != 0;
    float _1838 = trunc(_1824);
    float _1840 = precise::max(_1838, 0.0);
    uint _1842 = uint(_1840);
    if (_1566)
    {
        float _1844 = -_225;
        float _1846 = _1828 ? _1844 : _225;
        _1816 = _1846;
    }
    float _1848 = _1816;
    int _1850 = _1832 & 3;
    bool _1852 = _1850 != 0;
    bool _1854 = !_1836;
    float _1856 = _1854 ? _225 : as_type<float>(_1726);
    float _1858 = _1848 + (-0.5);
    bool _1860 = uint(_1850) > 1u;
    int _1862 = int(_1660) + int(_1800);
    int _1864 = ~_759;
    int _1866 = _1864 + 1;
    int _1868 = _1832 & 3;
    bool _1870 = _1868 != 0;
    int _1872 = int(_1628) + int(_1774);
    int _1874 = _1866 * _1862;
    int _1876 = _1874 + _1604;
    int _1878 = ~_679;
    int _1880 = _1878 + 1;
    int _1882 = _1870 ? 0 : 1;
    int _1884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1886 = _1884 != 0;
    int _1888 = _1880 * _1872;
    int _1890 = _1888 + _1170;
    float _1892 = float(uint(_1522));
    bool _1894 = !_1886;
    int _1896 = _1894 ? 0 : 1;
    bool _1898 = uint(_1876) >= uint(_759);
    float _1900 = as_type<float>(_924) * _1892;
    int _1902 = ~_1882;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = _1906;
    if (!_1860)
    {
        int _1910 = ~_1882;
        int _1912 = _1910 + 1;
        _1908 = _1912;
    }
    int _1914 = _1908;
    float _1916 = trunc(_1900);
    float _1918 = precise::max(_1916, 0.0);
    uint _1920 = uint(_1918);
    bool _1922 = uint(_1890) >= uint(_679);
    bool _1924 = !_1898;
    int _1926 = _1924 ? 0 : (-1);
    bool _1928 = _1850 != 3;
    bool _1930 = !_1922;
    int _1932 = _1930 ? 0 : (-1);
    bool _1934 = uint(_1850) >= 2u;
    int _1936 = ~_1862;
    int _1938 = _1936 + _1926;
    int _1940 = _1938 + 1;
    int _1942 = ~_697;
    int _1944 = _1942 + 1;
    int _1946 = int(_1736) + int(_1842);
    int _1948 = _759 * _1940;
    int _1950 = _1948 + _1604;
    int _1952 = _1934 ? 0 : 1;
    int _1954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1956 = _1954 != 0;
    int _1958 = _1944 * _1946;
    int _1960 = _1958 + _1294;
    int _1962 = ~_759;
    int _1964 = _1962 + 1;
    int _1966 = ~_1952;
    int _1968 = _1966 + 1;
    int _1970 = _1968 + 1;
    int _1972 = _1970;
    int _1974 = _1914;
    if (_1928)
    {
        int _1976 = ~_1952;
        int _1978 = _1976 + 1;
        _1972 = _1978;
    }
    int _1980 = _1972;
    int _1982 = _1964 * int(_1920);
    int _1984 = _1982 + _1522;
    int _1986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _1988 = _1986 != 0;
    bool _1990 = !_1956;
    int _1992 = _1990 ? 0 : 1;
    bool _1994 = uint(_1960) >= uint(_697);
    bool _1996 = !_1458;
    int _1998 = _1996 ? _1950 : (-1);
    bool _2000 = !_1988;
    int _2002 = _2000 ? 0 : 1;
    bool _2004 = !_1994;
    int _2006 = _2004 ? 0 : (-1);
    int _2008 = _1998 & 3;
    bool _2010 = _2008 != 0;
    int _2012 = _1998 & 3;
    bool _2014 = _2012 != 0;
    float _2016 = float(uint(_1984));
    int _2018 = _2010 ? 0 : 1;
    bool _2020 = uint(_2012) > 1u;
    float _2022 = as_type<float>(_924) * _2016;
    int _2024 = ~_2018;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    int _2030 = ~_759;
    int _2032 = _2030 + 1;
    float _2034 = trunc(_2022);
    float _2036 = precise::max(_2034, 0.0);
    uint _2038 = uint(_2036);
    float _2040 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2042 = _2040 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2044 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2046 = _2044 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2048 = _2028;
    if (!_2020)
    {
        int _2050 = ~_2018;
        int _2052 = _2050 + 1;
        _2048 = _2052;
    }
    int _2054 = _2048;
    float _2056 = 1.0 / _2042;
    bool _2058 = uint(_2012) >= 2u;
    int _2060 = ~_1946;
    int _2062 = _2060 + _2006;
    int _2064 = _2062 + 1;
    int _2066 = _2058 ? 0 : 1;
    bool _2068 = _2012 != 3;
    float _2070 = 1.0 / _2046;
    int _2072 = int(_1920) + int(_2038);
    int _2074 = _697 * _2064;
    int _2076 = _2074 + _1294;
    int _2078 = ~_2066;
    int _2080 = _2078 + 1;
    int _2082 = _2080 + 1;
    int _2084 = _2032 * _2072;
    int _2086 = _2084 + _1522;
    bool _2088 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2090 = isnan(_661);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2096 = _2092 || _2094;
    float _2098 = float(_2096);
    float _2100 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2102 = _2100 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2104 = _2082;
    if (_2068)
    {
        int _2106 = ~_2066;
        int _2108 = _2106 + 1;
        _2104 = _2108;
    }
    int _2110 = _2104;
    bool _2112 = uint(_2086) >= uint(_759);
    float _2114 = -_2098;
    float _2116 = _2114 + 1.0;
    float _2118 = 1.0 / _2102;
    bool _2120 = !_2112;
    int _2122 = _2120 ? 0 : (-1);
    bool _2124 = _842 > 0.5;
    float _2126 = -_221;
    int _2128 = _2124 ? as_type<int>(_2126) : as_type<int>(_221);
    int _2130 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2132 = _2130 != 0;
    float _2134 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2136 = _2134 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2138 = !_2132;
    float _2140 = _2138 ? _221 : as_type<float>(_2128);
    float _2142 = 1.0 / _2136;
    bool _2144 = _852 != 1;
    float _2146 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2146;
    float _2150 = in.m_58.x;
    float _2152 = in.m_58.y;
    float _2154 = in.m_58.z;
    int _2156 = ~_2072;
    int _2158 = _2156 + _2122;
    int _2160 = _2158 + 1;
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2164 = abs(_1744);
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2168 = abs(_2054);
    float _2170 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2162);
    float _2172 = 0.0;
    float _2174 = _2136;
    if (!_2144)
    {
        _2172 = _850;
    }
    float _2176 = _2172;
    float _2178 = _854 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2180 = 0.0;
    float _2182 = _2176;
    if (!_2144)
    {
        _2180 = _850;
    }
    float _2184 = _2180;
    float _2186 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2170);
    float _2188 = 0.0;
    float _2190 = _2184;
    if (!_2144)
    {
        _2188 = _872;
    }
    float _2192 = _2188;
    int _2194 = _759 * _2160;
    int _2196 = _2194 + _1522;
    float _2198 = _2192;
    if (!_2144)
    {
        _2174 = _872;
    }
    float _2200 = _2174;
    float _2202 = _2200;
    if (_2144)
    {
        _2182 = _842;
    }
    float _2204 = _2182;
    if (_2144)
    {
        _2190 = _842;
    }
    float _2206 = _2190;
    if (_2144)
    {
        _2198 = _850;
    }
    float _2208 = _2198;
    float _2210 = _2152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_2144)
    {
        _2202 = _850;
    }
    float _2212 = _2202;
    float _2214 = _2152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2216 = _856 != 2;
    float _2218 = _2152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2220 = _850 * 2.0;
    float _2222 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2210);
    float _2224 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2214);
    float _2226 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2218);
    float _2228 = floor(_2220);
    float _2230 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2234 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2222);
    float _2236 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2224);
    float _2238 = fma(_2154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2226);
    bool _2240 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2242 = isnan(_661);
    bool _2244 = _2240 || _2242;
    bool _2246 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2248 = _2244 || _2246;
    float _2250 = float(_2248);
    float _2252 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2254 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2252;
    float _2256 = 0.0;
    if (_2216)
    {
        _2256 = _842;
    }
    float _2258 = _2256;
    float _2260 = 1.0 / _2232;
    float _2262 = 0.0;
    float _2264 = _2258;
    if (_2216)
    {
        _2262 = _850;
    }
    float _2266 = _2262;
    float _2268 = _2254 * _2142;
    float _2270 = _2266;
    if (!_2216)
    {
        _2264 = _872;
    }
    float _2272 = _2264;
    float _2274 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2276 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2274;
    if (!_2216)
    {
        _2270 = _842;
    }
    float _2278 = _2270;
    float _2280 = -_2250;
    float _2282 = _2280 + 1.0;
    bool _2284 = _1302 >= 0.0;
    bool _2286 = isnan(_1302);
    bool _2288 = _2284 || _2286;
    bool _2290 = isnan(0.0);
    bool _2292 = _2288 || _2290;
    float _2294 = _2276 * _2056;
    float _2296 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2298 = _2296 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2300 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2302 = isnan(_661);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2308 = _2304 || _2306;
    float _2310 = float(_2308);
    float _2312 = _2278 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2314 = _2292 ? 0 : 1;
    float _2316 = _2298 * _2070;
    bool _2318 = _1302 > 0.0;
    float _2320 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2322 = _2320 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2324 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2326 = _2324 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2328 = _872 * 2.0;
    float _2330 = _2322 * _2118;
    int _2332 = ~_2314;
    int _2334 = _2332 + 1;
    int _2336 = _2334 + 1;
    float _2338 = 1.0 / _2326;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2342 = _2340 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2344 = -_2310;
    float _2346 = _2344 + 1.0;
    float _2348 = _2208 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2350 = _2204 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2352 = abs(_1896);
    float _2354 = _2098 * _2346;
    int _2356 = _2336;
    float _2358 = _2350;
    if (!_2318)
    {
        int _2360 = ~_2314;
        int _2362 = _2360 + 1;
        _2356 = _2362;
    }
    int _2364 = _2356;
    float _2366 = floor(_2328);
    bool _2368 = _2228 >= 0.0;
    bool _2370 = isnan(_2228);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan(0.0);
    bool _2376 = _2372 || _2374;
    float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2378;
    bool _2382 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2384 = isnan(_661);
    bool _2386 = _2382 || _2384;
    bool _2388 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2390 = _2386 || _2388;
    float _2392 = float(_2390);
    float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2396 = _2394 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2398 = _2376 ? 0 : 1;
    float _2400 = _2380 * _2260;
    bool _2402 = _2228 > 0.0;
    float _2404 = -_2392;
    float _2406 = _2404 + 1.0;
    float _2408 = 1.0 / _2342;
    bool _2410 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2412 = isnan(_661);
    bool _2414 = _2410 || _2412;
    bool _2416 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2418 = _2414 || _2416;
    float _2420 = float(_2418);
    float _2422 = _2396 * _2338;
    int _2424 = ~_2398;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    float _2430 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2432 = _661 + _2430;
    int _2434 = ~_1872;
    int _2436 = _2434 + _1932;
    int _2438 = _2436 + 1;
    float _2440 = _2420 * _2116;
    float _2442 = -_2420;
    float _2444 = _2442 + 1.0;
    bool _2446 = !_1458;
    int _2448 = _2446 ? _2196 : (-1);
    int _2450 = _679 * _2438;
    int _2452 = _2450 + _1170;
    int _2454 = _2428;
    if (!_2402)
    {
        int _2456 = ~_2398;
        int _2458 = _2456 + 1;
        _2454 = _2458;
    }
    int _2460 = _2454;
    float _2462 = _2392 * _2444;
    bool _2464 = !_1218;
    int _2466 = _2464 ? _2076 : (-1);
    bool _2468 = !_1680;
    int _2470 = _2468 ? 0 : 1;
    float _2472 = _2148 * _2408;
    int _2474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2476 = _2474 != 0;
    int _2478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2480 = _2478 != 0;
    int _2482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2484 = _2482 != 0;
    bool _2486 = _2366 >= 0.0;
    bool _2488 = isnan(_2366);
    bool _2490 = _2486 || _2488;
    bool _2492 = isnan(0.0);
    bool _2494 = _2490 || _2492;
    bool _2496 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2498 = isnan(_661);
    bool _2500 = _2496 || _2498;
    bool _2502 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2504 = _2500 || _2502;
    float _2506 = float(_2504);
    bool _2508 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2510 = isnan(_661);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2516 = _2512 || _2514;
    float _2518 = float(_2516);
    int _2520 = _2494 ? 0 : 1;
    float _2522 = -_2506;
    float _2524 = _2522 + 1.0;
    bool _2526 = _2366 > 0.0;
    float _2528 = _2506 * _2406;
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2532 = _661 + _2530;
    float _2534 = -_2518;
    float _2536 = _2534 + 1.0;
    float _2538 = _2518 * _2524;
    float _2540 = fma(_2330, _2432, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2542 = fma(_2268, _2532, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2544 = _2250 * _2536;
    float _2546 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2548 = _661 + _2546;
    bool _2550 = _661 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2552 = isnan(_661);
    bool _2554 = _2550 || _2552;
    bool _2556 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2558 = _2554 || _2556;
    float _2560 = float(_2558);
    float _2562 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2564 = _661 + _2562;
    float _2566 = fma(_2316, _2548, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2570 = _661 + _2568;
    float _2572 = _2560 * _2282;
    float _2574 = fma(_2294, _2564, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2576 = fma(_2400, _896, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2578 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2580 = _661 + _2578;
    float _2582 = fma(_2472, _2570, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2584 = _2542 * _2572;
    float _2586 = -_2560;
    float _2588 = _2586 + 1.0;
    float _2590 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2592 = ~_2520;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    float _2598 = fma(_2588, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2584);
    int _2600 = _2596;
    if (!_2526)
    {
        int _2602 = ~_2520;
        int _2604 = _2602 + 1;
        _2600 = _2604;
    }
    int _2606 = _2600;
    float _2608 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2610 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2590);
    float _2612 = fma(_2422, _2580, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2614 = fma(_2540, _2544, _2598);
    float _2616 = _850 + _842;
    float _2618 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2608);
    float _2620 = _850 + _872;
    float _2622 = _850 + (-0.5);
    float _2624 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2626 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2630 = fma(_2574, _2538, _2614);
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2634 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2624);
    float _2636 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2626);
    float _2638 = _842 + _872;
    float _2640 = _842 + (-0.5);
    float _2642 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2628);
    float _2644 = _858 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2646 = fma(_2178, -2.0, _2632);
    float _2648 = _2236 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2650 = _2234 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2652 = -_2166;
    float _2654 = fma(_2644, 2.0, _2652);
    float _2656 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2658 = fma(_2566, _2528, _2630);
    float _2660 = _2238 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2662 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2664 = _2648 + _2662;
    int _2666 = _1832 >> 31;
    float _2668 = -_2656;
    float _2670 = fma(_920, 2.0, _2668);
    float _2672 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2674 = _2650 + _2672;
    float _2676 = _2664 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2678 = _2666 & 3;
    float _2680 = fma(_2576, _2462, _2658);
    float _2682 = fma(_2674, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2676);
    int _2684 = _1832 + _2678;
    float _2686 = _2616 + (-1.0);
    float _2688 = fma(_2612, _2440, _2680);
    int _2690 = _2684 >> 2;
    float _2692 = fma(_2686, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2694 = !_1852;
    int _2696 = _2694 ? 0 : 1;
    float _2698 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2700 = _2660 + _2698;
    int _2702 = _2690 << 4;
    int _2704 = _2702 + 656;
    float _2706 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2708 = _1850 != 3;
    float _2710 = fma(_2700, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2682);
    uint _2712 = uint(int(uint(_2704) >> uint(2)));
    uint _2714 = uint(int(uint(int(_2712)) >> uint(2)));
    int _2716 = int(_2712) & 3;
    float _2718 = (*spvDescriptorSet0.vp_c9)._m0[int(_2714)][_2716];
    int _2720 = int(_2712) + 1;
    uint _2722 = uint(int(uint(_2720) >> uint(2)));
    int _2724 = _2720 & 3;
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[int(_2722)][_2724];
    float _2728 = fma(_900, -2.0, _2706);
    float _2730 = -_131;
    float _2732 = fma(_2730, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2654);
    bool _2734 = !_2708;
    int _2736 = _2734 ? 0 : (-1);
    float _2738 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2740 = _2710 >= 0.0;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2744 = _1668 + 0.5;
    float _2746 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2738);
    float _2748 = -_131;
    float _2750 = fma(_2748, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2670);
    float _2752 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2742);
    float _2754 = fma(_2744, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2732);
    int _2756 = _2704 + 8;
    uint _2758 = uint(int(uint(_2756) >> uint(2)));
    uint _2760 = uint(int(uint(int(_2758)) >> uint(2)));
    int _2762 = int(_2758) & 3;
    float _2764 = (*spvDescriptorSet0.vp_c9)._m0[int(_2760)][_2762];
    int _2766 = int(_2758) + 1;
    uint _2768 = uint(int(uint(_2766) >> uint(2)));
    int _2770 = _2766 & 3;
    float _2772 = (*spvDescriptorSet0.vp_c9)._m0[int(_2768)][_2770];
    float _2774 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2728);
    float _2776 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2646);
    float _2778 = _1856 + (-0.5);
    float _2780 = _2140 + 0.5;
    float _2782 = -_2778;
    float _2784 = -_2774;
    float _2786 = fma(_2782, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2784);
    float _2788 = fma(_2780, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2750);
    float _2790 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2792 = _2272 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2794 = fma(_2582, _2354, _2688);
    float _2796 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2798 = fma(_2348, -2.0, _2790);
    int _2800 = abs(_2696);
    float _2802 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2804 = fma(_2312, -2.0, _2796);
    int _2806 = abs(_1914);
    int _2808 = abs(_1980);
    float _2810 = -_2802;
    float _2812 = fma(_2350, 2.0, _2810);
    int _2814 = ~_2806;
    int _2816 = _2814 + 1;
    int _2818 = _2816 + 1;
    float _2820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2822 = ~_2800;
    int _2824 = _2822 + 1;
    int _2826 = _2824 + 1;
    float _2828 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2642);
    if (_2740)
    {
        _2358 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2830 = _2358;
    float _2832 = -_1858;
    float _2834 = -_2776;
    float _2836 = fma(_2832, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2834);
    float _2838 = -_2828;
    float _2840 = _2838 + 1.0;
    int _2842 = abs(_2736);
    if (_2740)
    {
        float _2844 = _2830 * 5.0;
        _1974 = as_type<int>(_2844);
    }
    int _2846 = _1974;
    float _2848 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2798);
    float _2850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2852 = _2818 * as_type<int>(_2726);
    int _2854 = ~_2808;
    int _2856 = _2854 + 1;
    int _2858 = _2856 + 1;
    if (_2740)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9615 = as_type<float>(_2846);
        out.gl_Position.z = _9615;
    }
    bool _2860 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2862 = isnan(0.0);
    bool _2864 = _2860 || _2862;
    bool _2866 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2868 = _2864 || _2866;
    int _2870 = _2826 * as_type<int>(_2718);
    int _2872 = _2870 + _2852;
    int _2874 = abs(_1992);
    float _2876 = _2820 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2878 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2880 = int(_2878);
    float _2882 = fma(_2310, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2794);
    float _2884 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2634);
    float _2886 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2618);
    float _2888 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2636);
    int _2890 = _2858 * as_type<int>(_2764);
    int _2892 = _2890 + _2872;
    float _2894 = _1160 * _131;
    int _2896 = ~_2842;
    int _2898 = _2896 + 1;
    int _2900 = _2898 + 1;
    float _2902 = -_2186;
    float _2904 = _2902 + 1.0;
    int _2906 = ~_2874;
    int _2908 = _2906 + 1;
    int _2910 = _2908 + 1;
    float _2912 = _2850 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2914 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2916 = exp2(_2894);
    float _2918 = float(uint(_2880));
    int _2920 = _2900 * as_type<int>(_2772);
    int _2922 = _2920 + _2892;
    float _2924 = _1622 + 0.5;
    float _2926 = -_2914;
    float _2928 = fma(_2792, 2.0, _2926);
    float _2930 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2610);
    int _2932 = _2922 * _2910;
    float _2934 = -_2840;
    float _2936 = fma(_2934, _1668, _2754);
    float _2938 = 1.0 / _2918;
    float _2940 = _1376 + (-0.5);
    float _2942 = fma(_2904, _1848, _2836);
    float _2944 = -_131;
    float _2946 = fma(_2944, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2812);
    float _2948 = -_2912;
    float _2950 = -_2848;
    float _2952 = fma(_2948, _2940, _2950);
    int _2954 = _2466 * _2874;
    int _2956 = _2954 + _2932;
    out.m_80.x = _2936;
    out.m_80.y = _2942;
    float _2958 = fma(_2876, _2924, _2946);
    float _2960 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2962 = 1.0 + _2960;
    float _2964 = -_2916;
    float _2966 = _2964 + 1.0;
    float _2968 = float(uint(_2956));
    float _2970 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2746);
    float _2972 = 1.0 / _2962;
    float _2974 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2752);
    float _2976 = _2868 ? _2966 : 0.0;
    float _2978 = -_131;
    float _2980 = fma(_2978, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2928);
    int _2982 = as_type<int>(_2938) + (-2);
    float _2984 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2804);
    bool _2986 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2988 = isnan(1.0);
    bool _2990 = _2986 || _2988;
    bool _2992 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2994 = _2990 || _2992;
    out.m_82.x = _2882;
    int _2996 = abs(_2880);
    float _2998 = as_type<float>(_2982) * _2968;
    int _3000 = _1998 >> 31;
    float _3002 = -_2974;
    float _3004 = _3002 + 1.0;
    float _3006 = trunc(_2998);
    float _3008 = precise::max(_3006, 0.0);
    uint _3010 = uint(_3008);
    int _3012 = _1646 >> 31;
    float _3014 = _2664 * _2664;
    float _3016 = float(uint(_2996));
    float _3018 = fma(_1376, _3004, _2952);
    int _3020 = ~_2880;
    int _3022 = _3020 + 1;
    if (_2994)
    {
        float _3024 = _2976 * _2972;
        _141 = _3024;
    }
    float _3026 = _141;
    int _3028 = _3000 & 3;
    float _3030 = -_2888;
    float _3032 = _3030 + 1.0;
    float _3034 = 1.0 / _3016;
    int _3036 = _3012 & 3;
    float _3038 = fma(_2674, _2674, _3014);
    int _3040 = _1998 + _3028;
    float _3042 = -_2884;
    float _3044 = _3042 + 1.0;
    int _3046 = _1646 + _3036;
    float _3048 = fma(_2700, _2700, _3038);
    int _3050 = _3022 * int(_3010);
    int _3052 = _3050 + _2956;
    int _3054 = _3040 >> 2;
    float _3056 = -_3044;
    float _3058 = fma(_2140, _3056, _2788);
    float _3060 = rsqrt(_3048);
    int _3062 = _3046 >> 2;
    float _3064 = _922 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3066 = float(uint(_3052));
    float _3068 = -_2970;
    float _3070 = _3068 + 1.0;
    int _3072 = _3054 << 4;
    int _3074 = _3072 + 800;
    if (_2740)
    {
        out.m_65.x = 0.0;
    }
    int _3076 = abs(_2956);
    float _3078 = as_type<float>(_2982) * _3066;
    int _3080 = _3062 << 4;
    int _3082 = _3080 + 368;
    uint _3084 = uint(int(uint(_3074) >> uint(2)));
    uint _3086 = uint(int(uint(int(_3084)) >> uint(2)));
    int _3088 = int(_3084) & 3;
    float _3090 = (*spvDescriptorSet0.vp_c9)._m0[int(_3086)][_3088];
    int _3092 = int(_3084) + 1;
    uint _3094 = uint(int(uint(_3092) >> uint(2)));
    int _3096 = _3092 & 3;
    float _3098 = (*spvDescriptorSet0.vp_c9)._m0[int(_3094)][_3096];
    int _3100 = as_type<int>(_3034) + (-2);
    float _3102 = -_2886;
    float _3104 = _3102 + 1.0;
    float _3106 = float(uint(_3076));
    float _3108 = -_3070;
    float _3110 = fma(_1622, _3108, _2958);
    bool _3112 = !_2476;
    int _3114 = _3112 ? 0 : 1;
    float _3116 = _3064 * _3060;
    float _3118 = fma(_1856, _3104, _2786);
    uint _3120 = uint(int(uint(_3082) >> uint(2)));
    uint _3122 = uint(int(uint(int(_3120)) >> uint(2)));
    int _3124 = int(_3120) & 3;
    float _3126 = (*spvDescriptorSet0.vp_c9)._m0[int(_3122)][_3124];
    int _3128 = int(_3120) + 1;
    uint _3130 = uint(int(uint(_3128) >> uint(2)));
    int _3132 = _3128 & 3;
    float _3134 = (*spvDescriptorSet0.vp_c9)._m0[int(_3130)][_3132];
    float _3136 = as_type<float>(_3100) * _3106;
    float _3138 = _2664 * _3116;
    float _3140 = _2674 * _3116;
    int _3142 = ~_2996;
    int _3144 = _3142 + 1;
    out.m_84.x = _3058;
    out.m_84.y = _3118;
    out.m_84.z = _3110;
    out.m_84.w = _3018;
    float _3146 = -_3138;
    float _3148 = _2664 + _3146;
    float _3150 = trunc(_3136);
    float _3152 = precise::max(_3150, 0.0);
    uint _3154 = uint(_3152);
    int _3156 = abs(_3114);
    float _3158 = -_3140;
    float _3160 = _2674 + _3158;
    float _3162 = _3148 * _3148;
    float _3164 = _2700 * _3116;
    float _3166 = float(_2606);
    float _3168 = fma(_3160, _3160, _3162);
    float _3170 = float(_3156);
    float _3172 = trunc(_3078);
    float _3174 = precise::max(_3172, 0.0);
    uint _3176 = uint(_3174);
    int _3178 = ~_2880;
    int _3180 = _3178 + 1;
    float _3182 = -_3164;
    float _3184 = _2700 + _3182;
    int _3186 = _3074 + 8;
    uint _3188 = uint(int(uint(_3186) >> uint(2)));
    uint _3190 = uint(int(uint(int(_3188)) >> uint(2)));
    int _3192 = int(_3188) & 3;
    float _3194 = (*spvDescriptorSet0.vp_c9)._m0[int(_3190)][_3192];
    int _3196 = int(_3188) + 1;
    uint _3198 = uint(int(uint(_3196) >> uint(2)));
    int _3200 = _3196 & 3;
    float _3202 = (*spvDescriptorSet0.vp_c9)._m0[int(_3198)][_3200];
    float _3204 = _3170 * _3166;
    int _3206 = _3144 * int(_3154);
    int _3208 = _3206 + _3076;
    bool _3210 = !_2014;
    int _3212 = _3210 ? 0 : 1;
    int _3214 = _3082 + 8;
    uint _3216 = uint(int(uint(_3214) >> uint(2)));
    uint _3218 = uint(int(uint(int(_3216)) >> uint(2)));
    int _3220 = int(_3216) & 3;
    float _3222 = (*spvDescriptorSet0.vp_c9)._m0[int(_3218)][_3220];
    int _3224 = int(_3216) + 1;
    uint _3226 = uint(int(uint(_3224) >> uint(2)));
    int _3228 = _3224 & 3;
    float _3230 = (*spvDescriptorSet0.vp_c9)._m0[int(_3226)][_3228];
    float _3232 = float(uint(_3208));
    int _3234 = ~_2168;
    int _3236 = _3234 + 1;
    int _3238 = _3236 + 1;
    int _3240 = int(_3010) + int(_3176);
    float _3242 = as_type<float>(_3100) * _3232;
    int _3244 = abs(_2470);
    int _3246 = ~_2164;
    int _3248 = _3246 + 1;
    int _3250 = _3248 + 1;
    float _3252 = trunc(_3242);
    float _3254 = precise::max(_3252, 0.0);
    uint _3256 = uint(_3254);
    bool _3258 = _1678 != 3;
    int _3260 = _3180 * _3240;
    int _3262 = _3260 + _2956;
    int _3264 = ~_2996;
    int _3266 = _3264 + 1;
    int _3268 = _3238 * as_type<int>(_3098);
    int _3270 = abs(_3212);
    int _3272 = ~_3270;
    int _3274 = _3272 + 1;
    int _3276 = _3274 + 1;
    int _3278 = _3250 * as_type<int>(_3134);
    bool _3280 = !_3258;
    int _3282 = _3280 ? 0 : (-1);
    int _3284 = ~_3244;
    int _3286 = _3284 + 1;
    int _3288 = _3286 + 1;
    int _3290 = _3276 * as_type<int>(_3090);
    int _3292 = _3290 + _3268;
    bool _3294 = uint(_3262) >= uint(_2880);
    int _3296 = int(_3154) + int(_3256);
    int _3298 = _3288 * as_type<int>(_3126);
    int _3300 = _3298 + _3278;
    bool _3302 = !_3294;
    int _3304 = _3302 ? 0 : (-1);
    int _3306 = abs(_2110);
    int _3308 = _3266 * _3296;
    int _3310 = _3308 + _3076;
    bool _3312 = _2012 != 3;
    float _3314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3316 = ~_3240;
    int _3318 = _3316 + _3304;
    int _3320 = _3318 + 1;
    int _3322 = ~_3306;
    int _3324 = _3322 + 1;
    int _3326 = _3324 + 1;
    bool _3328 = !_3312;
    int _3330 = _3328 ? 0 : (-1);
    int _3332 = _2880 * _3320;
    int _3334 = _3332 + _2956;
    bool _3336 = uint(_3310) >= uint(_2996);
    int _3338 = _3326 * as_type<int>(_3194);
    int _3340 = _3338 + _3292;
    int _3342 = _2956 ^ _2880;
    float _3344 = _1042 + 0.5;
    int _3346 = abs(_3330);
    int _3348 = abs(_1822);
    float _3350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3352 = !_3336;
    int _3354 = _3352 ? 0 : (-1);
    uint _3356 = uint(int(uint(_3342) >> uint(31)));
    int _3358 = abs(_3282);
    int _3360 = ~_3348;
    int _3362 = _3360 + 1;
    int _3364 = _3362 + 1;
    int _3366 = ~_3354;
    int _3368 = _3296 + _3366;
    int _3370 = _3368 + 1;
    int _3372 = ~int(_3356);
    int _3374 = _3372 + 1;
    int _3376 = _3364 * as_type<int>(_3222);
    int _3378 = _3376 + _3300;
    int _3380 = ~_3358;
    int _3382 = _3380 + 1;
    int _3384 = _3382 + 1;
    bool _3386 = _2880 == 0;
    int _3388 = ~_3346;
    int _3390 = _3388 + 1;
    int _3392 = _3390 + 1;
    int _3394 = _3384 * as_type<int>(_3230);
    int _3396 = _3394 + _3378;
    int _3398 = _3370 ^ _3374;
    int _3400 = ~_2352;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    int _3406 = _3392 * as_type<int>(_3202);
    int _3408 = _3406 + _3340;
    bool _3410 = !_3386;
    int _3412 = _3410 ? _3334 : (-1);
    float _3414 = in.m_86.x;
    float _3416 = in.m_86.y;
    float _3418 = in.m_86.z;
    int _3420 = abs(_2002);
    float _3422 = _3350 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3424 = _2880 == 0;
    int _3426 = _3396 * _3404;
    int _3428 = ~_3374;
    int _3430 = _3428 + _3398;
    int _3432 = _3430 + 1;
    int _3434 = ~_3420;
    int _3436 = _3434 + 1;
    int _3438 = _3436 + 1;
    bool _3440 = !_3424;
    int _3442 = _3440 ? _3432 : (-1);
    bool _3444 = _679 == 0;
    int _3446 = _3408 * _3438;
    float _3448 = float(_3412);
    float _3450 = _3314 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3452 = float(_3442);
    int _3454 = _2448 * _3420;
    int _3456 = _3454 + _3446;
    bool _3458 = !_3444;
    int _3460 = _3458 ? _2452 : (-1);
    float _3462 = fma(_3422, _3448, _2980);
    float _3464 = _3204 * (-2.0);
    float _3466 = -_2984;
    float _3468 = fma(_3450, _3452, _3466);
    float _3470 = _1004 + (-0.5);
    int _3472 = _3460 * _2352;
    int _3474 = _3472 + _3426;
    float _3476 = fma(_3422, _3344, _3462);
    float _3478 = -_2930;
    float _3480 = _3478 + 1.0;
    float _3482 = -_3450;
    float _3484 = fma(_3482, _3470, _3468);
    float _3486 = fma(_2692, _3464, _2692);
    float _3488 = float(_3474);
    float _3490 = -_3032;
    float _3492 = fma(_1042, _3490, _3476);
    float _3494 = float(_3456);
    float _3496 = fma(_1004, _3480, _3484);
    float _3498 = fma(_3464, _3414, _3414);
    bool _3500 = !_2480;
    int _3502 = _3500 ? 0 : 1;
    out.m_88.x = _3488;
    bool _3504 = !_2484;
    int _3506 = _3504 ? 0 : 1;
    int _3508 = abs(_3502);
    out.m_88.w = _3494;
    out.m_90.x = _3492;
    out.m_90.y = _3496;
    float _3510 = _3418;
    if (_2740)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3512 = -_3138;
    float _3514 = _2648 + _3512;
    float _3516 = -_3140;
    float _3518 = _2650 + _3516;
    float _3520 = fma(_2640, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3498);
    float _3522 = float(_2364);
    float _3524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3526 = _3514 + _3524;
    float _3528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3530 = _3518 + _3528;
    float _3532 = float(_3508);
    float _3534 = _2620 + (-1.0);
    float _3536 = _3526 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3538 = _2638 + (-1.0);
    float _3540 = _3532 * _3522;
    float _3542 = fma(_3530, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3536);
    float _3544 = -_3164;
    float _3546 = _2660 + _3544;
    int _3548 = abs(_3506);
    float _3550 = fma(_3534, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3552 = float(_2460);
    float _3554 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3556 = _3546 + _3554;
    float _3558 = float(_3548);
    float _3560 = _872 + (-0.5);
    float _3562 = fma(_3486, _3026, _3520);
    float _3564 = fma(_3556, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3542);
    float _3566 = _3540 * (-2.0);
    float _3568 = _3558 * _3552;
    float _3570 = fma(_3184, _3184, _3168);
    float _3572 = _3562 * 0.15915493667125701904296875;
    float _3574 = fma(_3566, _3416, _3416);
    float _3576 = fma(_3550, _3566, _3550);
    float _3578 = _3568 * (-2.0);
    bool _3580 = _3564 >= 0.0;
    float _3582 = fma(_2622, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3574);
    float _3584 = sqrt(_3570);
    float _3586 = fma(_3538, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3588 = fma(_3578, _3418, _3418);
    float _3590 = fma(_3576, _3026, _3582);
    float _3592 = fma(_3586, _3578, _3586);
    float _3594 = fma(_3560, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3588);
    float _3596 = _3590 * 0.15915493667125701904296875;
    float _3598 = _3572 * 6.283185482025146484375;
    float _3600 = sin(_3598);
    float _3602 = fma(_3592, _3026, _3594);
    int _3604 = as_type<int>(_3576);
    if (_3580)
    {
        _3510 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3606 = _3510;
    int _3608 = as_type<int>(_3606);
    if (_3580)
    {
        out.m_65.x = 0.0;
    }
    float _3610 = _3602 * 0.15915493667125701904296875;
    float _3612 = _3572 * 6.283185482025146484375;
    float _3614 = cos(_3612);
    if (_3580)
    {
        float _3616 = _3606 * 5.0;
        _3608 = as_type<int>(_3616);
    }
    int _3618 = _3608;
    if (_3580)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10728 = as_type<float>(_3618);
        out.gl_Position.z = _10728;
    }
    float _3620 = _3596 * 6.283185482025146484375;
    float _3622 = sin(_3620);
    float _3624 = _3596 * 6.283185482025146484375;
    float _3626 = cos(_3624);
    if (_3580)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3628 = _3610 * 6.283185482025146484375;
    float _3630 = cos(_3628);
    float _3632 = _3060 * _3584;
    float _3634 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3636 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3638 = _3614 * _3626;
    float _3640 = _922 * _3632;
    float _3642 = _3632 * _3634;
    float _3644 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _3646 = _3610 * 6.283185482025146484375;
    float _3648 = sin(_3646);
    float _3650 = _3614 * _3622;
    float _3652 = _3636 * _3642;
    float _3654 = _3600 * _3622;
    float _3656 = _3600 * _3626;
    float _3658 = _3644 * _3640;
    float _3660 = _3632 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3662 = _3660 * 0.5;
    float _3664 = _3614 * _3630;
    float _3666 = _3626 * _3630;
    float _3668 = _3600 * _3630;
    float _3670 = _3622 * _3630;
    float _3672 = _3664 * _3652;
    float _3674 = fma(_3648, _3638, _3654);
    float _3676 = -_3656;
    float _3678 = fma(_3648, _3650, _3676);
    float _3680 = -_3652;
    float _3682 = _3648 * _3680;
    float _3684 = -_3650;
    float _3686 = fma(_3648, _3656, _3684);
    float _3688 = fma(_3674, _3658, _3672);
    float _3690 = _3668 * _3652;
    float _3692 = fma(_3666, _3658, _3682);
    float _3694 = fma(_3648, _3654, _3638);
    float _3696 = fma(_3678, _3662, _3688);
    float _3698 = fma(_3686, _3658, _3690);
    float _3700 = fma(_3670, _3662, _3692);
    float _3702 = _3674 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3704 = _3696 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3706 = _3696 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3708 = fma(_3694, _3662, _3698);
    float _3710 = _3696 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3712 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3704);
    float _3714 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3706);
    float _3716 = _3664 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3718 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3702);
    float _3720 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3712);
    float _3722 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3714);
    float _3724 = _3720 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3726 = _3722 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3728 = _3674 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3730 = _2650 + _3724;
    float _3732 = _2660 + _3726;
    float _3734 = _3674 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3736 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3738 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3740 = _3730 + _3738;
    float _3742 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3744 = _3732 + _3742;
    float _3746 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3734);
    float _3748 = fma(_3700, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3710);
    float _3750 = _3740 * _3740;
    float _3752 = _3744 * _3744;
    float _3754 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3728);
    float _3756 = _3664 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3758 = fma(_3708, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3748);
    float _3760 = _3750 + _3752;
    float _3762 = _3664 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3764 = -_3648;
    float _3766 = fma(_3764, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3756);
    float _3768 = _3758 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3770 = sqrt(_3760);
    float _3772 = -_3648;
    float _3774 = fma(_3772, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3762);
    float _3776 = _3678 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3778 = _3678 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3780 = fma(_3736, _3736, 1.0);
    float _3782 = _3678 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3784 = _2648 + _3768;
    float _3786 = -_3648;
    float _3788 = fma(_3786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3716);
    float _3790 = rsqrt(_3780);
    float _3792 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3776);
    float _3794 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3778);
    float _3796 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3782);
    bool _3798 = _3770 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3800 = _3782;
    float _3802 = _3670;
    float _3804 = _3776;
    float _3806 = _3780;
    float _3808 = _3768;
    float _3810 = _3740;
    if (!_3798)
    {
        _3800 = _3752;
    }
    float _3812 = _3800;
    float _3814 = _3812;
    if (!_3798)
    {
        _3802 = _3750;
    }
    float _3816 = _3802;
    float _3818 = _3816;
    if (!_3798)
    {
        _3804 = _3730;
    }
    float _3820 = _3804;
    float _3822 = _3820;
    if (!_3798)
    {
        _3806 = _3732;
    }
    float _3824 = _3806;
    float _3826 = _3824;
    if (!_3798)
    {
        _3808 = _3784;
    }
    float _3828 = _3808;
    bool _3830 = !_3798;
    float _3832 = _3828;
    if (!_3830)
    {
        float _3834 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3836 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3838 = _3770 + _3836;
        float _3840 = _3784 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3842 = rsqrt(_3760);
        float _3844 = _3838 * _3834;
        float _3846 = _3844 * 0.15915493667125701904296875;
        float _3848 = _3846 * 6.283185482025146484375;
        float _3850 = sin(_3848);
        float _3852 = _3846 * 6.283185482025146484375;
        float _3854 = cos(_3852);
        float _3856 = fma(_3850, _3840, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3858 = _3842 * _3856;
        float _3860 = _3854 + (-1.0);
        float _3862 = fma(_3740, _3858, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3864 = fma(_3744, _3858, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3866 = _3860 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3868 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3870 = _3862 + _3868;
        float _3872 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3874 = _3864 + _3872;
        float _3876 = fma(_3784, _3854, _3866);
        float _3878 = _3870 * _3870;
        float _3880 = _3874 * _3874;
        _3832 = _3876;
        _3818 = _3878;
        _3814 = _3880;
        _3822 = _3862;
        _3826 = _3864;
    }
    float _3882 = _3832;
    float _3884 = _3818;
    float _3886 = _3814;
    float _3888 = _3822;
    float _3890 = _3826;
    float _3892 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3894 = _3882 + _3892;
    float _3896 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3766);
    float _3898 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3788);
    float _3900 = fma(_3668, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3774);
    float _3902 = fma(_3894, _3894, _3884);
    float _3904 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3792);
    float _3906 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3794);
    float _3908 = fma(_3694, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3796);
    float _3910 = _3902 + _3886;
    float _3912 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3754);
    float _3914 = _3736 * _3790;
    float _3916 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3746);
    float _3918 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3920 = _3736 * _3896;
    float _3922 = _3736 * _3898;
    float _3924 = fma(_3686, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3718);
    float _3926 = _3736 * _3900;
    float _3928 = -_3904;
    float _3930 = _3914 * _3928;
    float _3932 = -_3906;
    float _3934 = _3914 * _3932;
    float _3936 = -_3908;
    float _3938 = _3914 * _3936;
    float _3940 = sqrt(_3910);
    float _3942 = fma(_3918, _3912, _3920);
    float _3944 = fma(_3918, _3916, _3922);
    float _3946 = fma(_3918, _3924, _3926);
    float _3948 = fma(_3790, _3896, _3930);
    float _3950 = fma(_3790, _3898, _3934);
    float _3952 = _3906 + _3944;
    float _3954 = fma(_3790, _3900, _3938);
    float _3956 = _3904 + _3942;
    float _3958 = _3908 + _3946;
    out.m_92.x = _3912;
    out.m_92.y = _3916;
    out.m_92.z = _3924;
    out.m_94.x = _3948;
    out.m_94.y = _3950;
    out.m_94.z = _3954;
    bool _3960 = _3940 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3962 = isnan(_3940);
    bool _3964 = _3960 || _3962;
    bool _3966 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3968 = _3964 || _3966;
    out.m_96.x = _3956;
    out.m_96.y = _3952;
    out.m_96.z = _3958;
    float _3970 = _3904;
    if (!_3968)
    {
        _3970 = 1.0;
    }
    float _3972 = _3970;
    bool _3974 = !_3968;
    float _3976 = _3972;
    if (!_3974)
    {
        bool _3978 = _3940 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3980 = isnan(_3940);
        bool _3982 = _3978 || _3980;
        bool _3984 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3986 = _3982 || _3984;
        if (!_3986)
        {
            float _3988 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3990 = _3940 + _3988;
            float _3992 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3994 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3992;
            float _3996 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3998 = _3996 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4000 = 1.0 / _3994;
            float _4002 = _3990 * _4000;
            float _4004 = fma(_4002, _3998, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3976 = _4004;
            _4006 = true;
        }
        else
        {
            bool _4008 = _3940 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4010 = isnan(_3940);
            bool _4012 = _4008 || _4010;
            bool _4014 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4016 = _4012 || _4014;
            if (!_4016)
            {
                float _4018 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4020 = _3940 + _4018;
                float _4022 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4024 = _4022 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4026 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4028 = _4026 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4030 = 1.0 / _4024;
                float _4032 = _4020 * _4030;
                float _4034 = fma(_4032, _4028, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3976 = _4034;
                _4006 = true;
            }
            else
            {
                _3976 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4006 = false;
    float _4036 = _3976;
    float _4038 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4040 = _3882 + _4038;
    float _4042 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4044 = _3888 + _4042;
    float _4046 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4048 = _3890 + _4046;
    float _4050 = fma(_4040, _4036, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4052 = fma(_4044, _4036, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4054 = fma(_4048, _4036, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4056 = _3514 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4058 = -_2648;
    float _4060 = _4058 + _4050;
    float _4062 = -_2650;
    float _4064 = _4062 + _4052;
    float _4066 = -_2660;
    float _4068 = _4066 + _4054;
    float _4070 = fma(_3518, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4056);
    float _4072 = _4060 * _4060;
    float _4074 = _3514 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4076 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4070);
    float _4078 = fma(_4064, _4064, _4072);
    float _4080 = _4076 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4082 = fma(_4068, _4068, _4078);
    float _4084 = sqrt(_4082);
    bool _4086 = _4084 > 0.0;
    float _4088 = _4084;
    float _4090 = _4044;
    float _4092 = _4076;
    float _4094 = _4068;
    if (!_4086)
    {
        _4088 = _4052;
    }
    float _4096 = _4088;
    float _4098 = _4096;
    if (!_4086)
    {
        _4090 = _4050;
    }
    float _4100 = _4090;
    float _4102 = _4100;
    float _4104 = _4100;
    if (!_4086)
    {
        _4092 = _4054;
    }
    float _4106 = _4092;
    bool _4108 = !_4086;
    float _4110 = _4106;
    if (!_4108)
    {
        float _4112 = _215 * _215;
        float _4114 = fma(_213, _213, _4112);
        float _4116 = fma(_217, _217, _4114);
        float _4118 = rsqrt(_4082);
        float _4120 = sqrt(_4116);
        float _4122 = _4064 * _4118;
        float _4124 = _4060 * _4118;
        float _4126 = _4068 * _4118;
        bool _4128 = _4120 > 0.0;
        float _4130 = _4118;
        float _4132 = _4120;
        _4094 = _4126;
        if (!_4128)
        {
            _4130 = _4052;
        }
        float _4134 = _4130;
        _4098 = _4134;
        if (!_4128)
        {
            _4102 = _4050;
        }
        float _4136 = _4102;
        _4104 = _4136;
        if (!_4128)
        {
            _4132 = _4054;
        }
        float _4138 = _4132;
        bool _4140 = !_4128;
        _4110 = _4138;
        if (!_4140)
        {
            float _4142 = rsqrt(_4116);
            float _4144 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4146 = _215 * _4142;
            float _4148 = _213 * _4142;
            float _4150 = _217 * _4142;
            float _4152 = _4124 * _4146;
            float _4154 = fma(_4122, _4148, _4152);
            float _4156 = _4144 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4158 = fma(_4126, _4150, _4154);
            float _4160 = _4158 * _4156;
            float _4162 = fma(_213, _4160, _4052);
            float _4164 = fma(_215, _4160, _4050);
            float _4166 = fma(_217, _4160, _4054);
            _4104 = _4164;
            _4098 = _4162;
            _4110 = _4166;
        }
    }
    float _4168 = _4104;
    float _4170 = _4098;
    float _4172 = _4110;
    float _4174 = _4094;
    float _4176 = fma(_3518, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4074);
    float _4178 = 1.0 / _4080;
    float _4180 = -_3138;
    float _4182 = _4180 + _4168;
    float _4184 = -_3140;
    float _4186 = _4184 + _4170;
    float _4188 = fma(_3546, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4176);
    float _4190 = -_3164;
    float _4192 = _4190 + _4172;
    float _4194 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4196 = _4182 + _4194;
    float _4198 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4200 = _4186 + _4198;
    float _4202 = _4188 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4204 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4206 = _4192 + _4204;
    float _4208 = _4196 * _4196;
    float _4210 = _4202 + _4080;
    float _4212 = fma(_4200, _4200, _4208);
    float _4214 = _4210 * _4178;
    float _4216 = _4214 * 0.5;
    float _4218 = fma(_4206, _4206, _4212);
    float _4220 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4222 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4224 = fma(_4216, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4222);
    float _4226 = rsqrt(_4218);
    float _4228 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4230 = 1.0 / _4224;
    float _4232 = _4226 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4234 = _3514 + _4228;
    float _4236 = sqrt(_4218);
    float _4238 = _4200 * _4232;
    float _4240 = _4206 * _4232;
    float _4242 = _4234 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4244 = _4234 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4246 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4248 = _4230 * _4246;
    float _4250 = _4238 * _4238;
    float _4252 = _4240 * _4240;
    float _4254 = fma(_3518, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4242);
    float _4256 = fma(_3518, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4244);
    bool _4258 = _4248 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4260 = _4250 + _4252;
    bool _4262 = _4248 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4264 = fma(_3546, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4254);
    float _4266 = fma(_3546, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4256);
    float _4268 = sqrt(_4260);
    float _4270 = _4264 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _4272 = !_4258;
    int _4274 = _4272 ? 0 : 1;
    float _4276 = _4266 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _4278 = 2;
    float _4280 = _4234;
    if (!_4258)
    {
        _4278 = 1;
    }
    int _4282 = _4278;
    float _4284 = trunc(_4270);
    int _4286 = int(_4284);
    int _4288 = _4282;
    if (!_4262)
    {
        _4288 = _4274;
    }
    int _4290 = _4288;
    float _4292 = fma(_3518, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _4294 = _4290 << 6;
    bool _4296 = _4268 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4298 = trunc(_4276);
    int _4300 = int(_4298);
    int _4302 = _4294 + 96;
    uint _4304 = uint(int(uint(_4302) >> uint(2)));
    uint _4306 = uint(int(uint(int(_4304)) >> uint(2)));
    int _4308 = int(_4304) & 3;
    float _4310 = (*spvDescriptorSet0.vp_c15)._m0[int(_4306)][_4308];
    int _4312 = int(_4304) + 1;
    uint _4314 = uint(int(uint(_4312) >> uint(2)));
    int _4316 = _4312 & 3;
    float _4318 = (*spvDescriptorSet0.vp_c15)._m0[int(_4314)][_4316];
    float _4320 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4322 = _4268 + _4320;
    int _4324 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4326 = _4286 + _4324;
    int _4328 = _4326 + 1;
    int _4330 = _4294 + 48;
    uint _4332 = uint(int(uint(_4330) >> uint(2)));
    uint _4334 = uint(int(uint(int(_4332)) >> uint(2)));
    int _4336 = int(_4332) & 3;
    float _4338 = (*spvDescriptorSet0.vp_c15)._m0[int(_4334)][_4336];
    int _4340 = int(_4332) + 1;
    uint _4342 = uint(int(uint(_4340) >> uint(2)));
    int _4344 = _4340 & 3;
    float _4346 = (*spvDescriptorSet0.vp_c15)._m0[int(_4342)][_4344];
    float _4348 = floor(_4292);
    bool _4350 = _4328 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4352 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4354 = _4300 + _4352;
    int _4356 = _4354 + 1;
    int _4358 = _4294 + 104;
    uint _4360 = uint(int(uint(_4358) >> uint(2)));
    uint _4362 = uint(int(uint(int(_4360)) >> uint(2)));
    int _4364 = int(_4360) & 3;
    float _4366 = (*spvDescriptorSet0.vp_c15)._m0[int(_4362)][_4364];
    int _4368 = int(_4360) + 1;
    uint _4370 = uint(int(uint(_4368) >> uint(2)));
    int _4372 = _4368 & 3;
    float _4374 = (*spvDescriptorSet0.vp_c15)._m0[int(_4370)][_4372];
    int _4376 = as_type<int>(_3732);
    float _4378 = _4322;
    int _4380 = as_type<int>(_4292);
    float _4382 = as_type<float>(_4290);
    if (_4296)
    {
        float _4384 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4376 = as_type<int>(_4384);
    }
    int _4386 = _4376;
    int _4388 = _4328 | _4356;
    bool _4390 = _4388 < 0;
    bool _4392 = _4390 || _4350;
    int _4394 = _4294 + 64;
    uint _4396 = uint(int(uint(_4394) >> uint(2)));
    uint _4398 = uint(int(uint(int(_4396)) >> uint(2)));
    int _4400 = int(_4396) & 3;
    float _4402 = (*spvDescriptorSet0.vp_c15)._m0[int(_4398)][_4400];
    int _4404 = int(_4396) + 1;
    uint _4406 = uint(int(uint(_4404) >> uint(2)));
    int _4408 = _4404 & 3;
    float _4410 = (*spvDescriptorSet0.vp_c15)._m0[int(_4406)][_4408];
    float _4412 = -_4348;
    float _4414 = _4292 + _4412;
    bool _4416 = _4356 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4418 = _4416 || _4392;
    int _4420 = _4294 + 56;
    uint _4422 = uint(int(uint(_4420) >> uint(2)));
    uint _4424 = uint(int(uint(int(_4422)) >> uint(2)));
    int _4426 = int(_4422) & 3;
    float _4428 = (*spvDescriptorSet0.vp_c15)._m0[int(_4424)][_4426];
    int _4430 = int(_4422) + 1;
    uint _4432 = uint(int(uint(_4430) >> uint(2)));
    int _4434 = _4430 & 3;
    float _4436 = (*spvDescriptorSet0.vp_c15)._m0[int(_4432)][_4434];
    int _4438 = _4386;
    if (_4296)
    {
        float _4440 = _4322 * as_type<float>(_4386);
        _4378 = _4440;
    }
    float _4442 = _4378;
    int _4444 = as_type<int>(_4442);
    if (_4296)
    {
        float _4446 = _4442 * 0.15915493667125701904296875;
        _3810 = _4446;
    }
    float _4448 = _3810;
    float _4450 = _4448;
    if (!_4418)
    {
        int _4452 = _4356 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4454 = _4452 + _4328;
        _4444 = _4454;
    }
    int _4456 = _4444;
    float _4458 = _3900;
    if (_4296)
    {
        float _4460 = _4448 * 6.283185482025146484375;
        float _4462 = cos(_4460);
        _4458 = _4462;
    }
    float _4464 = _4458;
    float _4466 = precise::max(0.0, _4220);
    if (!_4418)
    {
        int _4468 = _4456 << 2;
        _4438 = _4468;
    }
    int _4470 = _4438;
    float _4472 = -_4232;
    float _4474 = -_4466;
    float _4476 = fma(_4196, _4472, _4474);
    float _4478 = _4234 * _4318;
    float _4480 = as_type<float>(_4356);
    int _4482 = _4470;
    float _4484 = _4478;
    float _4486 = _4476;
    if (_4296)
    {
        float _4488 = _4448 * 6.283185482025146484375;
        float _4490 = sin(_4488);
        _4480 = _4490;
    }
    float _4492 = _4480;
    if (!_4418)
    {
        uint _4494 = uint(int(uint(_4456) >> uint(2)));
        _4380 = int(_4494);
    }
    int _4496 = _4380;
    float _4498 = fma(_3518, _4310, _4478);
    float _4500 = _4498;
    float _4502 = as_type<float>(_4496);
    if (!_4418)
    {
        int _4504 = 12 & _4470;
        _4482 = _4504;
    }
    int _4506 = _4482;
    float _4508 = _4234 * _4346;
    float _4510 = _4220;
    float _4512 = _4338;
    float _4514 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (_4296)
    {
        float _4516 = rsqrt(_4260);
        _4510 = _4516;
    }
    float _4518 = _4510;
    if (_4296)
    {
        float _4520 = _4476 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4450 = _4520;
    }
    float _4522 = _4450;
    float _4524 = _4522;
    if (_4296)
    {
        float _4526 = _4464 + (-1.0);
        _4484 = _4526;
    }
    float _4528 = _4484;
    float _4530 = fma(_3518, _4338, _4508);
    if (!_4418)
    {
        int _4532 = _4496 << 4;
        int _4534 = _4532 + _4506;
        _3604 = _4534;
    }
    int _4536 = _3604;
    float _4538 = fma(_3546, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_4296)
    {
        _4512 = _4476;
    }
    float _4540 = _4512;
    float _4542 = fma(_3546, _4366, _4498);
    float _4544 = _4540;
    float _4546 = _4366;
    if (_4296)
    {
        float _4548 = fma(_4492, _4522, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4524 = _4548;
    }
    float _4550 = _4524;
    float _4552 = _4550;
    if (_4296)
    {
        float _4554 = _4528 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4500 = _4554;
    }
    float _4556 = _4500;
    if (!_4296)
    {
        _4514 = _4238;
    }
    float _4558 = _4514;
    float _4560 = _4174;
    float _4562 = _4558;
    if (!_4418)
    {
        int _4564 = _4536 + 400;
        uint _4566 = uint(int(uint(_4564) >> uint(2)));
        uint _4568 = uint(int(uint(int(_4566)) >> uint(2)));
        int _4570 = int(_4566) & 3;
        float _4572 = (*spvDescriptorSet0.vp_c15)._m0[int(_4568)][_4570];
        _4560 = _4572;
    }
    float _4574 = _4560;
    if (!_4296)
    {
        _4502 = _4240;
    }
    float _4576 = _4502;
    float _4578 = _4576;
    if (_4296)
    {
        float _4580 = fma(_4476, _4464, _4556);
        _4544 = _4580;
    }
    float _4582 = _4544;
    if (!_4296)
    {
        _4486 = _4250;
    }
    float _4584 = _4486;
    float _4586 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4588 = _4584;
    float _4590 = _4518;
    if (_4296)
    {
        float _4592 = _4518 * _4550;
        _4552 = _4592;
    }
    float _4594 = _4552;
    if (!_4296)
    {
        _4546 = _4252;
    }
    float _4596 = _4546;
    float _4598 = floor(_4538);
    int _4600 = _4294 + 72;
    uint _4602 = uint(int(uint(_4600) >> uint(2)));
    uint _4604 = uint(int(uint(int(_4602)) >> uint(2)));
    int _4606 = int(_4602) & 3;
    float _4608 = (*spvDescriptorSet0.vp_c15)._m0[int(_4604)][_4606];
    int _4610 = int(_4602) + 1;
    uint _4612 = uint(int(uint(_4610) >> uint(2)));
    int _4614 = _4610 & 3;
    float _4616 = (*spvDescriptorSet0.vp_c15)._m0[int(_4612)][_4614];
    float _4618 = _4596;
    if (_4296)
    {
        float _4620 = _4238 * _4594;
        _4562 = _4620;
    }
    float _4622 = _4562;
    if (_4296)
    {
        float _4624 = _4240 * _4594;
        _4578 = _4624;
    }
    float _4626 = _4578;
    float _4628 = _4234 * _4410;
    float _4630 = fma(_3546, _4428, _4530);
    if (_4296)
    {
        float _4632 = _4622 * _4622;
        _4588 = _4632;
    }
    float _4634 = _4588;
    if (_4296)
    {
        float _4636 = _4626 * _4626;
        _4618 = _4636;
    }
    float _4638 = _4618;
    float _4640 = fma(_3518, _4402, _4628);
    float _4642 = _4542 + _4374;
    float _4644 = fma(_4582, _4582, _4634);
    float _4646 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4648 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4650 = fma(_4186, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4586);
    float _4652 = _4644 + _4638;
    float _4654 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _4656 = _4294 + 80;
    uint _4658 = uint(int(uint(_4656) >> uint(2)));
    uint _4660 = uint(int(uint(int(_4658)) >> uint(2)));
    int _4662 = int(_4658) & 3;
    float _4664 = (*spvDescriptorSet0.vp_c15)._m0[int(_4660)][_4662];
    int _4666 = int(_4658) + 1;
    uint _4668 = uint(int(uint(_4666) >> uint(2)));
    int _4670 = _4666 & 3;
    float _4672 = (*spvDescriptorSet0.vp_c15)._m0[int(_4668)][_4670];
    float _4674 = fma(_4186, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4646);
    float _4676 = rsqrt(_4652);
    float _4678 = fma(_4186, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4654);
    float _4680 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4682 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4674);
    float _4684 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4650);
    float _4686 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4678);
    int _4688 = _4294 + 88;
    uint _4690 = uint(int(uint(_4688) >> uint(2)));
    uint _4692 = uint(int(uint(int(_4690)) >> uint(2)));
    int _4694 = int(_4690) & 3;
    float _4696 = (*spvDescriptorSet0.vp_c15)._m0[int(_4692)][_4694];
    int _4698 = int(_4690) + 1;
    uint _4700 = uint(int(uint(_4698) >> uint(2)));
    int _4702 = _4698 & 3;
    float _4704 = (*spvDescriptorSet0.vp_c15)._m0[int(_4700)][_4702];
    float _4706 = fma(_4186, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4680);
    float _4708 = 1.0 / _4642;
    float _4710 = _4686 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4712 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4714 = fma(_4236, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4712);
    float _4716 = precise::clamp(_4714, 0.0, 1.0);
    float _4718 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4706);
    float _4720 = _4630 + _4436;
    float _4722 = _4710 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4724 = _4684 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4726 = _4718 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4728 = _4676 * _4622;
    float _4730 = -_4722;
    float _4732 = fma(_4730, _4648, 1.0);
    float _4734 = _4682 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4736 = _4726 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4738 = _4728 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4740 = -_4598;
    float _4742 = _4538 + _4740;
    float _4744 = _4492;
    if (!_4418)
    {
        float _4746 = floor(_4276);
        _4744 = _4746;
    }
    float _4748 = _4744;
    float _4750 = fma(_4734, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4736);
    float _4752 = -_4716;
    float _4754 = _4752 + 1.0;
    float _4756 = _4676 * _4582;
    float _4758 = _4676 * _4626;
    float _4760 = _4720 * _4708;
    float _4762 = fma(_4710, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4750);
    float _4764 = -_4738;
    float _4766 = fma(_4756, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4764);
    float _4768 = abs(_4754);
    float _4770 = log2(_4768);
    float _4772 = fma(_3546, _4608, _4640);
    bool _4774 = _4760 >= 0.0;
    float _4776 = fma(_4724, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4762);
    float _4778 = -_4758;
    float _4780 = fma(_4778, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4766);
    float _4782 = _4772 + _4616;
    bool _4784 = _4760 <= 1.0;
    bool _4786 = _4784 && _4774;
    float _4788 = fma(_4780, -0.5, 0.5);
    float _4790 = _4782 * _4708;
    float _4792 = fma(_4780, 0.5, 0.5);
    float _4794 = _4754;
    if (!_4418)
    {
        float _4796 = floor(_4270);
        _4590 = _4796;
    }
    float _4798 = _4590;
    float _4800 = _4726 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4802 = _4748;
    if (!_4418)
    {
        float _4804 = -_4748;
        float _4806 = _4276 + _4804;
        _4794 = _4806;
    }
    float _4808 = _4794;
    bool _4810 = _4790 >= 0.0;
    bool _4812 = _4810 && _4786;
    float _4814 = _4234 * _4672;
    float _4816 = _4770 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _4818 = _4790 <= 1.0;
    bool _4820 = _4818 && _4812;
    float _4822 = sqrt(_4788);
    float _4824 = fma(_3518, _4664, _4814);
    float _4826 = fma(_3546, _4696, _4824);
    float _4828 = fma(_4792, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4830 = exp2(_4816);
    float _4832 = _4726 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4834 = _4826 + _4704;
    float _4836 = fma(_4792, _4828, -0.212114393711090087890625);
    if (_4820)
    {
        float _4838 = float(_4290);
        _4382 = _4838;
    }
    float _4840 = _4382;
    float _4842 = fma(_4734, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4832);
    float _4844 = _4756 + 1.0;
    float _4846 = fma(_4792, _4836, 1.570728778839111328125);
    float _4848 = log2(_4732);
    float _4850 = fma(_4734, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4800);
    float _4852 = fma(_4710, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4842);
    float _4854 = _4822 * 0.636619746685028076171875;
    if (!_4418)
    {
        float _4856 = -_4798;
        float _4858 = _4270 + _4856;
        _4802 = _4858;
    }
    float _4860 = _4802;
    float _4862 = fma(_4710, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4850);
    float _4864 = fma(_4724, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4852);
    float _4866 = -_4846;
    float _4868 = fma(_4854, _4866, 1.0);
    float _4870 = 1.0 / _4776;
    float _4872 = -_4756;
    float _4874 = fma(_4830, _4844, _4872);
    float _4876 = fma(_4724, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4862);
    float _4878 = _4834 * _4708;
    float _4880 = _4538;
    float _4882 = _4864;
    float _4884 = _4876;
    if (!_4418)
    {
        float _4886 = rint(_4574);
        float _4888 = precise::max(_4886, 0.0);
        uint _4890 = uint(_4888);
        uint _4892 = clamp(_4890, 0u, 65535u);
        _4880 = as_type<float>(_4892);
    }
    float _4894 = _4880;
    float _4896 = _4848 * 0.693147182464599609375;
    float _4898 = fma(_4874, 0.5, 0.5);
    float2 _12884 = float2(_4414, _4742);
    float _4900 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12884, float2(0.0), isnan(_12884)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12884, float2(0.0), isnan(_12884)), level(0.0)).x;
    float _4902 = _4896 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4904 = _4840;
    if (_4820)
    {
        float _4906 = rint(_4840);
        float _4908 = precise::max(_4906, 0.0);
        uint _4910 = uint(_4908);
        uint _4912 = clamp(_4910, 0u, 65535u);
        _4904 = as_type<float>(_4912);
    }
    float _4914 = _4904;
    float _4916 = _4864 * _4870;
    float _4918 = _4876 * _4870;
    float _4920 = fma(_4916, 0.5, 0.5);
    float _4922 = fma(_4918, -0.5, 0.5);
    float _4924 = _4894;
    if (!_4418)
    {
        float3 _12930 = float3(_4860, _4808, float(as_type<int>(_4894)));
        float3 _12934 = select(_12930, float3(0.0), isnan(_12930));
        float _4926 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12934.xy, uint(rint(_12934.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12934.xy, uint(rint(_12934.z)), level(0.0)).x;
        _4924 = _4926;
    }
    float _4928 = _4924;
    float _4930 = _4870;
    if (_4820)
    {
        float3 _12949 = float3(_4760, _4790, float(as_type<int>(_4914)));
        float3 _12951 = select(_12949, float3(0.0), isnan(_12949));
        float _4932 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12951.xy, uint(rint(_12951.z)), _4878, level(0.0));
        _4930 = _4932;
    }
    float _4934 = _4930;
    float3 _12961 = float3(_4920, _4922, _4902);
    float _4936 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12961, float3(0.0), isnan(_12961)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12961, float3(0.0), isnan(_12961)), level(0.0)).x;
    float3 _12970 = float3(_4920, _4922, _4902);
    float4 _4939 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12970, float3(0.0), isnan(_12970)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12970, float3(0.0), isnan(_12970)), level(0.0)).xyzw;
    float _4941 = _4939.x;
    float _4943 = _4939.y;
    float _4945 = _4939.z;
    float _4947 = _4939.w;
    float2 _12986 = float2(_4868, _4898);
    float3 _4951 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12986, float2(0.0), isnan(_12986)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12986, float2(0.0), isnan(_12986)), level(0.0)).xyz;
    float _4953 = _4951.x;
    float _4955 = _4951.y;
    float _4957 = _4951.z;
    float _4959 = abs(_4248);
    float _4961 = log2(_4959);
    float _4963 = _4726 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4965 = fma(_4734, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4963);
    float _4967 = fma(_4710, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4965);
    float _4969 = _4961 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4971 = exp2(_4969);
    float _4973 = fma(_4724, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4967);
    float _4975 = _4864 + _4776;
    float _4977 = _4776 * 0.5;
    float _4979 = _4973 + _4776;
    out.gl_Position.x = _4864;
    out.gl_Position.y = _4876;
    out.gl_Position.z = _4973;
    out.gl_Position.w = _4776;
    float _4981 = _4975 * 0.5;
    float _4983 = fma(_4876, -0.5, _4977);
    float _4985 = _4979 * 0.5;
    out.m_98.x = _4981;
    out.m_98.y = _4983;
    out.m_98.z = _4985;
    out.m_98.w = _4776;
    float _4987 = fma(_4971, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4989 = precise::clamp(_4987, 0.0, 1.0);
    float _4991 = fma(_4989, -2.0, 3.0);
    bool _4993 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4995 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4997 = _4993 || _4995;
    bool _4999 = isnan(0.5);
    bool _5001 = _4997 || _4999;
    float _5003 = _4770 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5005 = _4989 * _4989;
    float _5007 = _5005 * _4991;
    float _5009 = exp2(_5003);
    bool _5011 = _4248 <= 8000.0;
    bool _5013 = isnan(_4248);
    bool _5015 = _5011 || _5013;
    bool _5017 = isnan(8000.0);
    bool _5019 = _5015 || _5017;
    float _5021 = float(_5019);
    float _5023 = -_5007;
    float _5025 = _5023 + 1.0;
    float _5027 = _4973;
    if (_5001)
    {
        _4882 = 1.0;
    }
    float _5029 = _4882;
    float _5031 = fma(_5025, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5007);
    float _5033 = _5021 * _5031;
    float _5035 = _5029;
    if (!_5001)
    {
        float _5037 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _5039 = _5037 * 0.15915493667125701904296875;
        float _5041 = _5039 * 6.283185482025146484375;
        float _5043 = cos(_5041);
        float _5045 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _5047 = _5045 * 0.15915493667125701904296875;
        float _5049 = _5039 * 6.283185482025146484375;
        float _5051 = sin(_5049);
        float _5053 = 1.0 / _5043;
        float _5055 = _5047 * 6.283185482025146484375;
        float _5057 = cos(_5055);
        float _5059 = _5051 * _5053;
        float _5061 = _5047 * 6.283185482025146484375;
        float _5063 = sin(_5061);
        float _5065 = _5057 * _5059;
        float _5067 = 1.0 / _5065;
        float _5069 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5071 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5069;
        float _5073 = 1.0 / _5071;
        float _5075 = _5063 * _5067;
        float _5077 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5079 = fma(_4248, _5075, _5077);
        float _5081 = _5079 * _5073;
        float _5083 = precise::clamp(_5081, 0.0, 1.0);
        _5027 = _5073;
        _4884 = _5067;
        _5035 = _5083;
    }
    float _5085 = _5027;
    float _5087 = _4884;
    float _5089 = _5035;
    float _5091 = _5033 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5093 = -_4900;
    float _5095 = _5093 + 1.0;
    float _5097 = -_5009;
    float _5099 = _5097 + 1.0;
    float _5101 = _5085;
    float _5103 = _5087;
    float _5105 = _5091;
    if (!_4820)
    {
        _5101 = 1.0;
    }
    float _5107 = _5101;
    float _5109 = _5095 * _5091;
    float _5111 = precise::clamp(_5109, 0.0, 1.0);
    float _5113 = _5107;
    if (_4820)
    {
        bool _5115 = _4934 >= _4878;
        bool _5117 = isnan(_4934);
        bool _5119 = _5115 || _5117;
        bool _5121 = isnan(_4878);
        bool _5123 = _5119 || _5121;
        float _5125 = float(_5123);
        _5113 = _5125;
    }
    float _5127 = _5113;
    float _5129 = _5099 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5131 = _5129;
    if (_4418)
    {
        _5103 = 1.0;
    }
    float _5133 = _5103;
    float _5135 = _5133;
    if (!_4418)
    {
        int _5137 = _4456 << 4;
        int _5139 = _5137 + 2048;
        uint _5141 = uint(int(uint(_5139) >> uint(2)));
        uint _5143 = uint(int(uint(int(_5141)) >> uint(2)));
        int _5145 = int(_5141) & 3;
        float _5147 = (*spvDescriptorSet0.vp_c15)._m0[int(_5143)][_5145];
        int _5149 = int(_5141) + 1;
        uint _5151 = uint(int(uint(_5149) >> uint(2)));
        int _5153 = _5149 & 3;
        float _5155 = (*spvDescriptorSet0.vp_c15)._m0[int(_5151)][_5153];
        int _5157 = _5139 + 8;
        uint _5159 = uint(int(uint(_5157) >> uint(2)));
        uint _5161 = uint(int(uint(int(_5159)) >> uint(2)));
        int _5163 = int(_5159) & 3;
        float _5165 = (*spvDescriptorSet0.vp_c15)._m0[int(_5161)][_5163];
        int _5167 = int(_5159) + 1;
        uint _5169 = uint(int(uint(_5167) >> uint(2)));
        int _5171 = _5167 & 3;
        float _5173 = (*spvDescriptorSet0.vp_c15)._m0[int(_5169)][_5171];
        float _5175 = _4234 * _5155;
        float _5177 = fma(_3518, _5147, _5175);
        float _5179 = fma(_3546, _5165, _5177);
        float _5181 = _5179 + _5173;
        float _5183 = precise::clamp(_5181, 0.0, 1.0);
        float _5185 = -_5183;
        float _5187 = _5185 + _4928;
        float _5189 = fma(_5187, 500.0, 1.5);
        float _5191 = exp2(_5189);
        float _5193 = 0.0 + _5191;
        float _5195 = precise::clamp(_5193, 0.0, 1.0);
        _5135 = _5195;
        _5105 = _5147;
        _4280 = 500.0;
    }
    float _5197 = _5135;
    float _5199 = _5105;
    float _5201 = _4280;
    float _5203 = _5127 * _5197;
    float _5205 = _5129 * _4936;
    float _5207 = -_5111;
    float _5209 = fma(_5207, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5211 = -_5129;
    float _5213 = _5211 + 1.0;
    bool _5215 = _4236 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5217 = isnan(_4236);
    bool _5219 = _5215 || _5217;
    bool _5221 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5223 = _5219 || _5221;
    float _5225 = _4947 * _5205;
    float _5227 = -_5203;
    float _5229 = fma(_5227, _5209, 1.0);
    float _5231 = precise::clamp(_5229, 0.0, 1.0);
    float _5233 = _4957 * _5205;
    float _5235 = _4947 * _5213;
    float _5237 = fma(_4953, _5225, _4941);
    float _5239 = fma(_4955, _5225, _4943);
    float _5241 = _5231 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5243 = fma(_4947, _5233, _4945);
    float _5245 = _5089 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_100.x = _5241;
    float _5247 = _5199;
    float _5249 = _5201;
    float _5251 = _5213;
    float _5253 = _5231;
    float _5255 = _5225;
    if (!_5223)
    {
        _5131 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5257 = _5131;
    float _5259 = _5257;
    float _5261 = _5257;
    if (!_5223)
    {
        _5247 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5263 = _5247;
    out.m_102.x = _5237;
    out.m_102.y = _5239;
    out.m_102.z = _5243;
    out.m_102.w = _5235;
    float _5265 = _5263;
    float _5267 = _5263;
    if (!_5223)
    {
        _5249 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5269 = _5249;
    float _5271 = _5269;
    float _5273 = _5269;
    if (!_5223)
    {
        _5251 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5275 = _5251;
    float _5277 = _5275;
    float _5279 = _5275;
    if (!_5223)
    {
        _5253 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5281 = _5253;
    float _5283 = _5281;
    float _5285 = _5281;
    if (!_5223)
    {
        _5255 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5287 = _5255;
    bool _5289 = !_5223;
    float _5291 = _5287;
    float _5293 = _5287;
    if (!_5289)
    {
        bool _5295 = _4236 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5297 = isnan(_4236);
        bool _5299 = _5295 || _5297;
        bool _5301 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5303 = _5299 || _5301;
        if (!_5303)
        {
            float _5305 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5307 = _4236 + _5305;
            float _5309 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5311 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5309;
            float _5313 = 1.0 / _5311;
            float _5315 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5317 = _5315 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5319 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5321 = _5319 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5323 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5325 = _5323 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5327 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5329 = _5327 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5331 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5333 = _5331 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5335 = _5307 * _5313;
            float _5337 = precise::clamp(_5335, 0.0, 1.0);
            float _5339 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5341 = _5339 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5343 = fma(_5337, _5317, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5345 = fma(_5337, _5341, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5347 = fma(_5337, _5321, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5349 = fma(_5337, _5325, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5351 = fma(_5337, _5329, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5353 = fma(_5337, _5333, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5267 = _5343;
            _5285 = _5351;
            _5261 = _5345;
            _5279 = _5349;
            _5273 = _5347;
            _5293 = _5353;
            _5355 = true;
        }
        else
        {
            bool _5357 = _4236 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5359 = isnan(_4236);
            bool _5361 = _5357 || _5359;
            bool _5363 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5365 = _5361 || _5363;
            if (!_5365)
            {
                _5259 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5367 = _5259;
            _5261 = _5367;
            if (!_5365)
            {
                _5265 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5369 = _5265;
            _5267 = _5369;
            if (!_5365)
            {
                _5271 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5371 = _5271;
            _5273 = _5371;
            if (!_5365)
            {
                _5277 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5373 = _5277;
            _5279 = _5373;
            if (!_5365)
            {
                _5283 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5375 = _5283;
            _5285 = _5375;
            if (!_5365)
            {
                _5291 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5377 = _5291;
            bool _5379 = !_5365;
            _5293 = _5377;
            if (!_5379)
            {
                bool _5381 = _4236 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5383 = isnan(_4236);
                bool _5385 = _5381 || _5383;
                bool _5387 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5389 = _5385 || _5387;
                if (!_5389)
                {
                    float _5391 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5393 = _4236 + _5391;
                    float _5395 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5397 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5395;
                    float _5399 = 1.0 / _5397;
                    float _5401 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5403 = _5401 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5405 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5407 = _5405 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5409 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5411 = _5409 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5413 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5415 = _5413 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5417 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5419 = _5417 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5421 = _5393 * _5399;
                    float _5423 = precise::clamp(_5421, 0.0, 1.0);
                    float _5425 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5427 = _5425 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5429 = fma(_5423, _5403, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5431 = fma(_5423, _5427, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5433 = fma(_5423, _5407, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5435 = fma(_5423, _5411, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5437 = fma(_5423, _5415, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5439 = fma(_5423, _5419, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5267 = _5429;
                    _5285 = _5437;
                    _5261 = _5431;
                    _5279 = _5435;
                    _5273 = _5433;
                    _5293 = _5439;
                    _5355 = true;
                }
                else
                {
                    _5267 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5285 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5261 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5279 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5273 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5293 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5355 = false;
    float _5441 = _5267;
    float _5443 = _5285;
    float _5445 = _5261;
    float _5447 = _5279;
    float _5449 = _5273;
    float _5451 = _5293;
    float _5453 = fma(_3952, -0.5, 0.5);
    float _5455 = precise::clamp(_5453, 0.0, 1.0);
    float _5457 = -_5441;
    float _5459 = _5457 + _5443;
    float _5461 = _5245 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5463 = -_5445;
    float _5465 = _5463 + _5447;
    out.m_104.x = 0.0;
    float _5467 = fma(_5455, _5459, _5441);
    float _5469 = fma(_5455, _5465, _5445);
    out.m_65.x = _5461;
    float _5471 = -_5449;
    float _5473 = _5471 + _5451;
    float _5475 = _5467 * 0.586610972881317138671875;
    bool _5477 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5479 = fma(_5455, _5473, _5449);
    float _5481 = fma(_5469, 0.298911988735198974609375, _5475);
    bool _5483 = _5089 > 0.0;
    bool _5485 = isnan(_5089);
    bool _5487 = _5483 || _5485;
    bool _5489 = isnan(0.0);
    bool _5491 = _5487 || _5489;
    float _5493 = fma(_5479, 0.114477999508380889892578125, _5481);
    float _5495 = -_5493;
    float _5497 = _5469 + _5495;
    float _5499 = -_5493;
    float _5501 = _5467 + _5499;
    float _5503 = -_5493;
    float _5505 = _5479 + _5503;
    float _5507 = fma(_5497, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5493);
    float _5509 = fma(_5501, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5493);
    float _5511 = fma(_5505, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5493);
    bool _5513 = !_5477;
    if (!_5513)
    {
        float _5515 = -_4182;
        float _5517 = _5515 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5519 = -_4186;
        float _5521 = _5519 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5523 = -_4192;
        float _5525 = _5523 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5527 = _5517 * _5517;
        float _5529 = fma(_5521, _5521, _5527);
        float _5531 = fma(_5525, _5525, _5529);
        float _5533 = sqrt(_5531);
        float _5535 = rsqrt(_5531);
        float _5537 = -_5533;
        float _5539 = _5537 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5541 = _5539 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5543 = precise::clamp(_5541, 0.0, 1.0);
        float _5545 = _5521 * _5535;
        float _5547 = _5517 * _5535;
        float _5549 = abs(_5543);
        float _5551 = log2(_5549);
        float _5553 = _5525 * _5535;
        float _5555 = _5545 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5557 = _3952 * _5547;
        float _5559 = -_5547;
        float _5561 = -_5555;
        float _5563 = fma(_5559, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5561);
        float _5565 = fma(_3956, _5545, _5557);
        float _5567 = -_5553;
        float _5569 = fma(_5567, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5563);
        float _5571 = fma(_3958, _5553, _5565);
        float _5573 = precise::clamp(_5571, 0.0, 1.0);
        float _5575 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5577 = _5569 + _5575;
        float _5579 = _5551 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5581 = _5577 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5583 = precise::clamp(_5581, 0.0, 1.0);
        float _5585 = exp2(_5579);
        float _5587 = _5585 * _5583;
        float _5589 = _5573 * _5587;
        float _5591 = _5589 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5593 = _5589 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5595 = _5589 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _5591;
        out.m_104.y = _5593;
        out.m_104.z = _5595;
    }
    out.m_106.x = _5507;
    out.m_106.y = _5509;
    out.m_106.z = _5511;
    if (_5491)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_65.x = 0.0;
    float _5597 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5597;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

