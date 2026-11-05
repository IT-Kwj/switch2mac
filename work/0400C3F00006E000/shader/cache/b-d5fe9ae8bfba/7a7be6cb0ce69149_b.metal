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
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_16 [[id(9)]];
    sampler vp_t_tcb_16Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d_array<float> vp_t_tcb_14 [[id(15)]];
    sampler vp_t_tcb_14Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_14Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_100 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_98 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 m_96 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(1)]];
    float4 m_68 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_70 [[attribute(5)]];
    float4 m_72 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4465 = false;
    bool _3158 = false;
    bool _953 = false;
    bool _785 = false;
    bool _565 = false;
    bool _389 = false;
    bool _241 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_58.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_61.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4750 = as_type<float>(_135);
        out.gl_Position.z = _4750;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_63.w;
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
        _129 = _157;
    }
    float _159 = _129;
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
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4820 = as_type<float>(_173);
        out.gl_Position.z = _4820;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_68.x;
    float _179 = in.m_68.y;
    float _181 = in.m_68.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _199 = !_185;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _209 = !_189;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _215 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _217 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _219 = !_191;
    int _221 = as_type<int>(_213);
    float _239;
    if (!_219)
    {
        float _223 = in.m_70.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        float _243 = float(_119);
        float _245 = 1.0 / _243;
        float _247 = _153 * _245;
        _239 = _247;
    }
    _241 = false;
    float _249 = _239;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = _249 + _251;
    bool _255 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _257 = isnan(_249);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    bool _267 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _269 = isnan(_249);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _283 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = -_265;
    float _289 = _287 + 1.0;
    float _291 = 1.0 / _281;
    bool _293 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_249);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _277 * _289;
    float _307 = -_277;
    float _309 = _307 + 1.0;
    bool _311 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _313 = _303 * _309;
    float _315 = 1.0 / _285;
    float _317 = -_303;
    float _319 = _317 + 1.0;
    float _321 = _253 * _291;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _249 + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_329, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = fma(_333, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = _325 * _315;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = _335 * _313;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = _337 * _313;
    float _353 = fma(_343, _339, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _355 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[143].x, _345);
    float _357 = fma(_349, _339, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _359 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _361 = fma(_353, _305, _355);
    float _363 = fma(_357, _305, _359);
    float _365 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[145].x, _361);
    float _367 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[145].y, _363);
    bool _369 = !_311;
    float _387;
    if (!_369)
    {
        float _371 = in.m_70.x;
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _375 = _371 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _377 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[11].x, _153);
        float _379 = _377 * _373;
        float _381 = floor(_379);
        float _383 = -_381;
        float _385 = _379 + _383;
        _387 = _385;
        _389 = true;
    }
    else
    {
        float _391 = float(_119);
        float _393 = 1.0 / _391;
        float _395 = _153 * _393;
        _387 = _395;
    }
    _389 = false;
    float _397 = _387;
    float _399 = in.m_72.x;
    float _401 = in.m_72.y;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _405 = _397 + _403;
    bool _407 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _409 = isnan(_397);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _427 = 1.0 / _421;
    bool _429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _431 = 1.0 / _425;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _433;
    float _437 = _405 * _427;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _441 = _397 + _439;
    bool _443 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _445 = isnan(_397);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = _367 * _401;
    bool _457 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _459 = isnan(_397);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -_417;
    float _471 = _469 + 1.0;
    float _473 = fma(_435, _437, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _475 = _365 * _399;
    float _477 = _441 * _431;
    float _479 = _467 * _471;
    float _481 = -_467;
    float _483 = _481 + 1.0;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _489;
    float _493 = _453 * _483;
    float _495 = fma(_487, _437, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _497 = fma(_491, _437, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _499 = -_453;
    float _501 = _499 + 1.0;
    float _503 = _473 * _493;
    float _505 = _495 * _493;
    float _507 = _497 * _493;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _521 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].x, _507);
    float _523 = fma(_511, _477, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _525 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].y, _505);
    float _527 = fma(_515, _477, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _529 = fma(_519, _477, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _531 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].z, _503);
    float _533 = fma(_523, _479, _525);
    float _535 = fma(_527, _479, _521);
    float _537 = fma(_529, _479, _531);
    float _539 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[109].y, _533);
    float _541 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[109].x, _535);
    float _543 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[109].z, _537);
    bool _545 = !_429;
    float _563;
    if (!_545)
    {
        float _547 = in.m_70.x;
        float _549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _551 = _547 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _553 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _555 = _553 * _549;
        float _557 = floor(_555);
        float _559 = -_557;
        float _561 = _555 + _559;
        _563 = _561;
        _565 = true;
    }
    else
    {
        float _567 = float(_119);
        float _569 = 1.0 / _567;
        float _571 = _153 * _569;
        _563 = _571;
    }
    _565 = false;
    float _573 = _563;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _577 = _573 + _575;
    float _579 = _541 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _589 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _591 = isnan(_573);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _601;
    float _605 = 1.0 / _583;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _611 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _613 = isnan(_573);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = _539 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _629 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _631 = isnan(_573);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _643 = 1.0 / _587;
    float _645 = -_621;
    float _647 = _645 + 1.0;
    float _649 = _579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _653 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _599 * _647;
    bool _657 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _659 = _603 * _605;
    bool _661 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _663 = isnan(_573);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -_599;
    float _675 = _673 + 1.0;
    float _677 = 1.0 / _609;
    float _679 = fma(_659, _577, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _681;
    float _685 = _671 * _675;
    float _687 = -_671;
    float _689 = _687 + 1.0;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _695 = 1.0 / _627;
    float _697 = _639 * _689;
    float _699 = _693 * _643;
    float _701 = -_639;
    float _703 = _701 + 1.0;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _707 = _573 + _705;
    float _709 = _679 * _697;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _713 = _573 + _711;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _719 = _683 * _677;
    bool _721 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _723 = isnan(_573);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = fma(_699, _713, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _735 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[115].x, _709);
    float _737 = fma(_719, _707, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _741 = _573 + _739;
    float _743 = -_731;
    float _745 = _743 + 1.0;
    float _747 = fma(_733, _685, _735);
    float _749 = _717 * _695;
    float _751 = _621 * _745;
    float _753 = fma(_737, _655, _747);
    float _755 = fma(_749, _741, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _757 = fma(_755, _751, _753);
    float _759 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[119].x, _757);
    float _761 = _759 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _649;
    out.m_74.y = _651;
    out.m_74.z = _653;
    out.m_74.w = _761;
    bool _763 = !_657;
    float _765 = _655;
    float _783;
    if (!_763)
    {
        float _767 = in.m_70.x;
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _771 = _767 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[11].z, _153);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _783 = _781;
        _785 = true;
    }
    else
    {
        float _787 = float(_119);
        float _789 = 1.0 / _787;
        float _791 = _153 * _789;
        _783 = _791;
    }
    _785 = false;
    float _793 = _783;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _797 = _793 + _795;
    bool _799 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _801 = isnan(_793);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _813 = _793 + _811;
    bool _815 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _817 = isnan(_793);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _827;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _835 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _837 = isnan(_793);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = -_809;
    float _849 = _847 + 1.0;
    float _851 = 1.0 / _833;
    float _853 = _845 * _849;
    float _855 = -_845;
    float _857 = _855 + 1.0;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _859;
    bool _863 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _865 = 1.0 / _829;
    float _867 = _825 * _857;
    float _869 = -_825;
    float _871 = _869 + 1.0;
    float _873 = _797 * _865;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _875;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _879;
    float _883 = fma(_861, _873, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _885 = fma(_877, _873, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _887 = fma(_881, _873, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _889 = _813 * _851;
    float _891 = _883 * _867;
    float _893 = _885 * _867;
    float _895 = _887 * _867;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _903 = _901 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _909 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[123].x, _891);
    float _911 = fma(_899, _889, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _913 = fma(_903, _889, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _915 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[123].y, _893);
    float _917 = fma(_907, _889, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _919 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[123].z, _895);
    float _921 = fma(_911, _853, _909);
    float _923 = fma(_913, _853, _915);
    float _925 = fma(_917, _853, _919);
    float _927 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[125].x, _921);
    float _929 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[125].y, _923);
    float _931 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[125].z, _925);
    bool _933 = !_863;
    float _951;
    if (!_933)
    {
        float _935 = in.m_70.x;
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _939 = _935 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[11].w, _153);
        float _943 = _941 * _937;
        float _945 = floor(_943);
        float _947 = -_945;
        float _949 = _943 + _947;
        _951 = _949;
        _953 = true;
    }
    else
    {
        float _955 = float(_119);
        float _957 = 1.0 / _955;
        float _959 = _153 * _957;
        _951 = _959;
    }
    _953 = false;
    float _961 = _951;
    float _963 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _965 = int(_963);
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _969 = _961 + _967;
    float _971 = _927 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _975 = _973 != 0;
    bool _977 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _979 = isnan(_961);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    float _989 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _991 = int(_989);
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _997 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _999 = isnan(_961);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = float(_965);
    float _1011 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1013 = int(_1011);
    if (_975)
    {
        float _1015 = in.m_70.x;
        _765 = _1015;
    }
    float _1017 = _765;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1023 = _1017;
    if (!_975)
    {
        float _1025 = in.m_70.y;
        _1023 = _1025;
    }
    float _1027 = _1023;
    float _1029 = float(uint(_991));
    float _1031 = 1.0 / _1009;
    int _1033 = ~_991;
    int _1035 = _1033 + 1;
    int _1037 = ~_991;
    int _1039 = _1037 + 1;
    bool _1041 = _991 == 0;
    float _1043 = 1.0 / _1029;
    float _1045 = float(_1013);
    float _1047 = _1031 * _153;
    float _1049 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1051 = int(_1049);
    int _1053 = as_type<int>(_1043) + (-2);
    float _1055 = trunc(_1047);
    int _1057 = int(_1055);
    float _1059 = 1.0 / _1045;
    float _1061 = float(uint(_1051));
    int _1063 = ~_1051;
    int _1065 = _1063 + 1;
    float _1067 = float(uint(_1057));
    float _1069 = 1.0 / _1061;
    float _1071 = as_type<float>(_1053) * _1067;
    float _1073 = _1059 * _153;
    float _1075 = trunc(_1071);
    float _1077 = precise::max(_1075, 0.0);
    uint _1080 = uint(_1077);
    float _1082 = in.m_70.x;
    float _1084 = in.m_70.y;
    float _1086 = in.m_70.z;
    float _1088 = in.m_70.w;
    float _1090 = trunc(_1073);
    int _1092 = int(_1090);
    int _1094 = as_type<int>(_1069) + (-2);
    float _1096 = _1071;
    if (_975)
    {
        _1096 = 1.0;
    }
    float _1098 = _1096;
    float _1100 = _1098;
    if (!_975)
    {
        _1100 = 1.2345600128173828125;
    }
    float _1102 = _1100;
    int _1104 = _1035 * int(_1080);
    int _1106 = _1104 + _1057;
    float _1108 = 1.0 / _995;
    float _1110 = _1027 * _1102;
    float _1112 = float(uint(_1106));
    float _1114 = as_type<float>(_1106);
    if (_975)
    {
        _1114 = 1.0;
    }
    float _1116 = _1114;
    float _1118 = float(uint(_1092));
    float _1120 = as_type<float>(_1053) * _1112;
    float _1122 = _1116;
    if (!_975)
    {
        _1122 = 7.345489978790283203125;
    }
    float _1124 = _1122;
    float _1126 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1128 = ~_1051;
    int _1130 = _1128 + 1;
    float _1132 = as_type<float>(_1094) * _1118;
    float _1134 = trunc(_1120);
    float _1136 = precise::max(_1134, 0.0);
    uint _1138 = uint(_1136);
    float _1140 = _1124 * _1082;
    float _1142 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1144 = trunc(_1132);
    float _1146 = precise::max(_1144, 0.0);
    uint _1148 = uint(_1146);
    float _1150 = floor(_1140);
    int _1152 = int(_1080) + int(_1138);
    float _1154 = float(_119);
    float _1156 = float(_991);
    int _1158 = _1130 * int(_1148);
    int _1160 = _1158 + _1092;
    float _1162 = 1.0 / _1154;
    float _1164 = float(uint(_1160));
    float _1166 = -_1150;
    float _1168 = _1140 + _1166;
    float _1170 = floor(_1110);
    float _1172 = as_type<float>(_1094) * _1164;
    int _1174 = _1039 * _1152;
    int _1176 = _1174 + _1057;
    float _1178 = _1168 * _1156;
    float _1180 = float(_1051);
    float _1182 = trunc(_1172);
    float _1184 = precise::max(_1182, 0.0);
    uint _1186 = uint(_1184);
    bool _1188 = uint(_1176) >= uint(_991);
    float _1190 = float(_1057);
    bool _1192 = _1190 >= _1156;
    bool _1194 = isnan(_1190);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan(_1156);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = trunc(_1178);
    int _1206 = int(_1204);
    float _1208 = -_1170;
    float _1210 = _1110 + _1208;
    bool _1212 = !_1188;
    int _1214 = _1212 ? 0 : (-1);
    float _1216 = _1162 * _153;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1220 = _1218 != 0;
    int _1222 = ~_1152;
    int _1224 = _1222 + _1214;
    int _1226 = _1224 + 1;
    float _1228 = _1156 * _1216;
    float _1230 = trunc(_1202);
    int _1232 = int(_1230);
    bool _1234 = !_1220;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = float(_1092);
    int _1240 = abs(_1236);
    float _1242 = _1180 * _1216;
    bool _1244 = _1238 >= _1180;
    bool _1246 = isnan(_1238);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(_1180);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    float _1256 = _1210 * _1180;
    int _1258 = int(_1148) + int(_1186);
    int _1260 = _1206 * _1240;
    int _1262 = _1260 + _1057;
    int _1264 = _991 * _1226;
    int _1266 = _1264 + _1057;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1270 = _1268 != 0;
    float _1272 = trunc(_1256);
    int _1274 = int(_1272);
    int _1276 = ~_1232;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    bool _1282 = !_1041;
    int _1284 = _1282 ? _1266 : (-1);
    int _1286 = _1065 * _1258;
    int _1288 = _1286 + _1092;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1292 = _1290 != 0;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1296 = _1294 != 0;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1300 = _1298 != 0;
    float _1302 = trunc(_1228);
    int _1304 = int(_1302);
    int _1306 = _991 + (-1);
    int _1308 = _1284 * _1280;
    bool _1310 = uint(_1288) >= uint(_1051);
    bool _1312 = !_1296;
    int _1314 = _1312 ? 0 : 1;
    int _1316 = _1232 * _1306;
    int _1318 = _1316 + _1308;
    bool _1320 = !_1270;
    int _1322 = _1320 ? 0 : 1;
    float _1324 = trunc(_1254);
    int _1326 = int(_1324);
    int _1328 = abs(_1314);
    bool _1330 = !_1292;
    int _1332 = _1330 ? 0 : 1;
    bool _1334 = !_1310;
    int _1336 = _1334 ? 0 : (-1);
    int _1338 = _1318 * _1328;
    int _1340 = abs(_1322);
    float _1342 = trunc(_1242);
    int _1344 = int(_1342);
    int _1346 = abs(_1332);
    int _1348 = ~_1258;
    int _1350 = _1348 + _1336;
    int _1352 = _1350 + 1;
    int _1354 = _1274 * _1340;
    int _1356 = _1354 + _1092;
    bool _1358 = !_1300;
    int _1360 = _1358 ? 0 : 1;
    int _1362 = _1304 * _1346;
    int _1364 = _1362 + _1338;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1368 = _1366 != 0;
    int _1370 = _1051 * _1352;
    int _1372 = _1370 + _1092;
    int _1374 = abs(_1360);
    bool _1376 = _1051 == 0;
    bool _1378 = !_1368;
    int _1380 = _1378 ? 0 : 1;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1392 = _1390 != 0;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1396 = _1394 != 0;
    int _1398 = ~_1326;
    int _1400 = _1398 + 1;
    int _1402 = _1400 + 1;
    bool _1404 = !_1376;
    int _1406 = _1404 ? _1372 : (-1);
    int _1408 = abs(_1380);
    int _1410 = _1262 * _1374;
    int _1412 = _1410 + _1364;
    int _1414 = _1051 + (-1);
    int _1416 = _1406 * _1402;
    bool _1418 = !_1388;
    int _1420 = _1418 ? 0 : 1;
    int _1422 = _1326 * _1414;
    int _1424 = _1422 + _1416;
    int _1426 = abs(_1420);
    bool _1428 = !_1384;
    int _1430 = _1428 ? 0 : 1;
    int _1432 = _1206 * _1408;
    int _1434 = _1432 + _1412;
    bool _1436 = !_1392;
    int _1438 = _1436 ? 0 : 1;
    int _1440 = abs(_1430);
    bool _1442 = !_1396;
    int _1444 = _1442 ? 0 : 1;
    int _1446 = abs(_1438);
    int _1448 = _1424 * _1426;
    float _1450 = float(uint(_1434));
    int _1452 = abs(_1444);
    int _1454 = _1344 * _1440;
    int _1456 = _1454 + _1448;
    float _1458 = as_type<float>(_1053) * _1450;
    int _1460 = ~_1051;
    int _1462 = _1460 + 1;
    int _1464 = _1356 * _1446;
    int _1466 = _1464 + _1456;
    int _1468 = ~_991;
    int _1470 = _1468 + 1;
    float _1472 = trunc(_1458);
    float _1474 = precise::max(_1472, 0.0);
    uint _1476 = uint(_1474);
    bool _1478 = _991 == 0;
    int _1480 = _1274 * _1452;
    int _1482 = _1480 + _1466;
    int _1484 = ~_991;
    int _1486 = _1484 + 1;
    float _1488 = float(uint(_1482));
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1494 = as_type<float>(_1094) * _1488;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1498 = _1486 * int(_1476);
    int _1500 = _1498 + _1434;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1504 = trunc(_1494);
    float _1506 = precise::max(_1504, 0.0);
    uint _1508 = uint(_1506);
    float _1510 = fma(_1126, -2.0, _1496);
    float _1512 = -_1502;
    float _1514 = fma(_1142, 2.0, _1512);
    float _1516 = float(uint(_1500));
    float _1518 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1510);
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1520;
    float _1524 = 1.0 / _1492;
    float _1526 = as_type<float>(_1053) * _1516;
    float _1528 = -_153;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1514);
    float _1532 = trunc(_1526);
    float _1534 = precise::max(_1532, 0.0);
    uint _1536 = uint(_1534);
    int _1538 = _1462 * int(_1508);
    int _1540 = _1538 + _1482;
    float _1542 = float(uint(_1540));
    int _1544 = ~_1051;
    int _1546 = _1544 + 1;
    float _1548 = as_type<float>(_1094) * _1542;
    float _1550 = trunc(_1548);
    float _1552 = precise::max(_1550, 0.0);
    uint _1554 = uint(_1552);
    int _1556 = int(_1476) + int(_1536);
    int _1558 = _1470 * _1556;
    int _1560 = _1558 + _1434;
    bool _1562 = uint(_1560) >= uint(_991);
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1568 = !_1562;
    int _1570 = _1568 ? 0 : (-1);
    float _1572 = 1.0 / _1566;
    int _1574 = int(_1508) + int(_1554);
    int _1576 = ~_1556;
    int _1578 = _1576 + _1570;
    int _1580 = _1578 + 1;
    int _1582 = ~_1051;
    int _1584 = _1582 + 1;
    int _1586 = _1546 * _1574;
    int _1588 = _1586 + _1482;
    int _1590 = _991 * _1580;
    int _1592 = _1590 + _1434;
    bool _1594 = uint(_1588) >= uint(_1051);
    bool _1596 = !_1478;
    int _1598 = _1596 ? _1592 : (-1);
    bool _1600 = !_1594;
    int _1602 = _1600 ? 0 : (-1);
    float _1604 = _1522 * _1572;
    int _1606 = _1598 & 3;
    bool _1608 = _1606 != 0;
    int _1610 = _1598 & 3;
    bool _1612 = _1610 != 0;
    bool _1614 = uint(_1606) > 1u;
    int _1616 = ~_1574;
    int _1618 = _1616 + _1602;
    int _1620 = _1618 + 1;
    int _1622 = _1612 ? 0 : 1;
    bool _1624 = _1088 > 0.5;
    int _1626 = _1051 * _1620;
    int _1628 = _1626 + _1482;
    float _1630 = float(uint(_1262));
    bool _1632 = uint(_1606) >= 2u;
    bool _1634 = !_1376;
    int _1636 = _1634 ? _1628 : (-1);
    float _1638 = as_type<float>(_1053) * _1630;
    int _1640 = _1632 ? 0 : 1;
    bool _1642 = _1606 != 3;
    float _1644 = trunc(_1638);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    int _1650 = ~_1622;
    int _1652 = _1650 + 1;
    int _1654 = _1652 + 1;
    int _1656 = _1654;
    int _1658 = as_type<int>(_1638);
    if (!_1614)
    {
        int _1660 = ~_1622;
        int _1662 = _1660 + 1;
        _1656 = _1662;
    }
    int _1664 = _1656;
    float _1666 = -_211;
    int _1668 = _1624 ? as_type<int>(_1666) : as_type<int>(_211);
    int _1670 = _1636 & 3;
    bool _1672 = _1670 != 0;
    int _1674 = _1636 & 3;
    bool _1676 = _1674 != 0;
    float _1678 = float(uint(_1356));
    int _1680 = _1672 ? 0 : 1;
    bool _1682 = uint(_1674) > 1u;
    float _1684 = as_type<float>(_1094) * _1678;
    int _1686 = ~_1640;
    int _1688 = _1686 + 1;
    int _1690 = _1688 + 1;
    int _1692 = _1690;
    if (_1642)
    {
        int _1694 = ~_1640;
        int _1696 = _1694 + 1;
        _1692 = _1696;
    }
    int _1698 = _1692;
    float _1700 = trunc(_1684);
    float _1702 = precise::max(_1700, 0.0);
    uint _1704 = uint(_1702);
    int _1706 = ~_991;
    int _1708 = _1706 + 1;
    int _1710 = ~_1680;
    int _1712 = _1710 + 1;
    int _1714 = _1712 + 1;
    int _1716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1718 = _1716 != 0;
    int _1720 = _1708 * int(_1648);
    int _1722 = _1720 + _1262;
    bool _1724 = _1674 != 3;
    float _1726 = _1082 * 2.0;
    int _1728 = _1714;
    if (!_1682)
    {
        int _1730 = ~_1680;
        int _1732 = _1730 + 1;
        _1728 = _1732;
    }
    int _1734 = _1728;
    int _1736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1738 = _1736 != 0;
    float _1740 = float(uint(_1722));
    float _1742 = _1084 * 2.0;
    bool _1744 = !_1738;
    float _1746 = _1744 ? _211 : as_type<float>(_1668);
    float _1748 = floor(_1726);
    bool _1750 = uint(_1674) >= 2u;
    float _1752 = as_type<float>(_1053) * _1740;
    int _1754 = _1584 * int(_1704);
    int _1756 = _1754 + _1356;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1760 = _1758 != 0;
    int _1762 = _1750 ? 0 : 1;
    float _1764 = floor(_1742);
    bool _1766 = !_1760;
    int _1768 = _1766 ? 0 : 1;
    int _1770 = ~_1762;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    float _1776 = float(uint(_1756));
    bool _1778 = _1082 > 0.5;
    float _1780 = trunc(_1752);
    float _1782 = precise::max(_1780, 0.0);
    uint _1784 = uint(_1782);
    int _1786 = _1774;
    float _1788 = _1752;
    if (_1724)
    {
        int _1790 = ~_1762;
        int _1792 = _1790 + 1;
        _1786 = _1792;
    }
    int _1794 = _1786;
    bool _1796 = _1084 > 0.5;
    int _1798 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1800 = _1798 != 0;
    float _1802 = as_type<float>(_1094) * _1776;
    float _1804 = -_201;
    int _1806 = _1778 ? as_type<int>(_1804) : as_type<int>(_201);
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1810 = _1808 != 0;
    float _1812 = trunc(_1802);
    float _1814 = precise::max(_1812, 0.0);
    uint _1816 = uint(_1814);
    float _1818 = -_211;
    int _1820 = _1796 ? as_type<int>(_1818) : as_type<int>(_211);
    bool _1822 = !_1800;
    float _1824 = _1822 ? _201 : as_type<float>(_1806);
    bool _1826 = _1086 > 0.5;
    bool _1828 = !_1810;
    float _1830 = _1828 ? _211 : as_type<float>(_1820);
    bool _1832 = _1748 > 0.0;
    bool _1834 = _1748 >= 0.0;
    bool _1836 = isnan(_1748);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan(0.0);
    bool _1842 = _1838 || _1840;
    float _1844 = -_201;
    int _1846 = _1826 ? as_type<int>(_1844) : as_type<int>(_201);
    float _1848 = _1802;
    if (_1718)
    {
        _1658 = 0;
    }
    int _1850 = _1658;
    bool _1852 = _1764 >= 0.0;
    bool _1854 = isnan(_1764);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan(0.0);
    bool _1860 = _1856 || _1858;
    int _1862 = _1850;
    if (!_1718)
    {
        _1862 = 1;
    }
    int _1864 = _1862;
    int _1866 = _1842 ? 0 : 1;
    bool _1868 = _1764 > 0.0;
    int _1870 = ~_991;
    int _1872 = _1870 + 1;
    int _1874 = _1860 ? 0 : 1;
    bool _1876 = _1864 != 1;
    int _1878 = int(_1648) + int(_1784);
    int _1880 = ~_1866;
    int _1882 = _1880 + 1;
    int _1884 = _1882 + 1;
    int _1886 = _1884;
    if (!_1832)
    {
        int _1888 = ~_1866;
        int _1890 = _1888 + 1;
        _1886 = _1890;
    }
    int _1892 = _1886;
    int _1894 = _1872 * _1878;
    int _1896 = _1894 + _1262;
    int _1898 = int(_1704) + int(_1816);
    int _1900 = ~_1051;
    int _1902 = _1900 + 1;
    int _1904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1906 = _1904 != 0;
    float _1908 = as_type<float>(_1816);
    float _1910 = as_type<float>(_1896);
    if (!_1876)
    {
        _1848 = _1084;
    }
    float _1912 = _1848;
    int _1914 = _1902 * _1898;
    int _1916 = _1914 + _1356;
    bool _1918 = !_1906;
    float _1920 = _1918 ? _201 : as_type<float>(_1846);
    bool _1922 = uint(_1896) >= uint(_991);
    float _1924 = _1912;
    if (!_1876)
    {
        _1908 = _1084;
    }
    float _1926 = _1908;
    float _1928 = _1920 + 0.5;
    float _1930 = _1926;
    if (!_1876)
    {
        _1788 = _1086;
    }
    float _1932 = _1788;
    float _1934 = _1932;
    if (!_1876)
    {
        _1910 = _1086;
    }
    float _1936 = _1910;
    int _1938 = ~_1874;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    float _1944 = _1936;
    int _1946 = _1942;
    if (_1876)
    {
        _1924 = _1082;
    }
    float _1948 = _1924;
    if (_1876)
    {
        _1930 = _1082;
    }
    float _1950 = _1930;
    if (_1876)
    {
        _1934 = _1084;
    }
    float _1952 = _1934;
    if (_1876)
    {
        _1944 = _1084;
    }
    float _1954 = _1944;
    if (!_1868)
    {
        int _1956 = ~_1874;
        int _1958 = _1956 + 1;
        _1946 = _1958;
    }
    int _1960 = _1946;
    bool _1962 = uint(_1916) >= uint(_1051);
    float _1964 = in.m_58.x;
    float _1966 = in.m_58.y;
    float _1968 = in.m_58.z;
    bool _1970 = !_1922;
    int _1972 = _1970 ? 0 : (-1);
    int _1974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1976 = _1974 != 0;
    int _1978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1980 = _1978 != 0;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1984 = _1982 != 0;
    float _1986 = _1086 * 2.0;
    bool _1988 = !_1962;
    int _1990 = _1988 ? 0 : (-1);
    int _1992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1994 = _1992 != 0;
    float _1996 = floor(_1986);
    bool _1998 = !_1980;
    int _2000 = _1998 ? 0 : 1;
    int _2002 = ~_1898;
    int _2004 = _2002 + _1990;
    int _2006 = _2004 + 1;
    float _2008 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2008;
    float _2012 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2014 = _2012 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2016 = ~_1878;
    int _2018 = _2016 + _1972;
    int _2020 = _2018 + 1;
    float _2022 = _2010 * _1524;
    float _2024 = _2014 * _1108;
    float _2026 = _1086 + _1084;
    float _2028 = fma(_2022, _969, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2030 = _1051 * _2006;
    int _2032 = _2030 + _1356;
    float _2034 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2036 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2038 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _2040 = _1996 >= 0.0;
    bool _2042 = isnan(_1996);
    bool _2044 = _2040 || _2042;
    bool _2046 = isnan(0.0);
    bool _2048 = _2044 || _2046;
    float _2050 = fma(_1964, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2034);
    float _2052 = fma(_1964, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2036);
    float _2054 = fma(_1964, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2038);
    float _2056 = _1082 + _1084;
    float _2058 = _2026 + (-1.0);
    float _2060 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2050);
    bool _2062 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2064 = isnan(_961);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2070 = _2066 || _2068;
    float _2072 = float(_2070);
    float _2074 = _2056 + (-1.0);
    float _2076 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2078 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2054);
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2082 = _961 + _2080;
    float _2084 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2086 = -_2072;
    float _2088 = _2086 + 1.0;
    int _2090 = _2048 ? 0 : 1;
    float _2092 = _2060 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2094 = _1996 > 0.0;
    float _2096 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2052);
    float _2098 = _987 * _2088;
    float _2100 = -_987;
    float _2102 = _2100 + 1.0;
    bool _2104 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2106 = isnan(_961);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    float _2116 = _2096 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2118 = !_1976;
    int _2120 = _2118 ? 0 : 1;
    float _2122 = _1007 * _2102;
    float _2124 = -_1007;
    float _2126 = _2124 + 1.0;
    float _2128 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2130 = _961 + _2128;
    float _2132 = fma(_2024, _2082, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2134 = _1830 + (-0.5);
    float _2136 = _2114 * _2126;
    float _2138 = _1824 + 0.5;
    float _2140 = fma(_1604, _2130, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2142 = -_2114;
    float _2144 = _2142 + 1.0;
    float _2146 = _2028 * _2136;
    float _2148 = fma(_2138, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1530);
    float _2150 = -_2134;
    float _2152 = -_1518;
    float _2154 = fma(_2150, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2152);
    float _2156 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2158 = log2(_2156);
    float _2160 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2146);
    int _2162 = ~_2090;
    int _2164 = _2162 + 1;
    int _2166 = _2164 + 1;
    float _2168 = _2078 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2170 = _2166;
    float _2172 = _2116;
    if (!_2094)
    {
        int _2174 = ~_2090;
        int _2176 = _2174 + 1;
        _2170 = _2176;
    }
    int _2178 = _2170;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2182 = fma(_2132, _2122, _2160);
    float _2184 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2186 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2180);
    int _2188 = abs(_2120);
    float _2190 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2192 = fma(_2184, -2.0, _1019);
    int _2194 = abs(_2000);
    float _2196 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2198 = float(_2188);
    float _2200 = fma(_2140, _2098, _2182);
    float _2202 = float(_2178);
    float _2204 = _2158 * _153;
    float _2206 = float(_1892);
    float _2208 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2196);
    float _2210 = float(_2194);
    float _2212 = _2198 * _2202;
    int _2214 = _1598 >> 31;
    float _2216 = exp2(_2204);
    int _2218 = _1636 >> 31;
    float _2220 = _2210 * _2206;
    int _2222 = _2214 & 3;
    float _2224 = -_1021;
    float _2226 = fma(_2190, 2.0, _2224);
    int _2228 = _2218 & 3;
    float _2230 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2232 = _2092 + _2230;
    int _2234 = _1598 + _2222;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2238 = _2116 + _2236;
    int _2240 = _1636 + _2228;
    float _2242 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2246 = _2168 + _2244;
    float _2248 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2242);
    float _2250 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2252 = _2234 >> 2;
    float _2254 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2256 = -_2216;
    float _2258 = _2256 + 1.0;
    float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2262 = 1.0 + _2260;
    int _2264 = _2252 << 4;
    int _2266 = _2264 + 368;
    float _2268 = fma(_2072, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2200);
    int _2270 = _2240 >> 2;
    float _2272 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2248);
    bool _2274 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2276 = isnan(0.0);
    bool _2278 = _2274 || _2276;
    bool _2280 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2282 = _2278 || _2280;
    float _2284 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2250);
    float _2286 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2254);
    float _2288 = 1.0 / _2262;
    uint _2290 = uint(int(uint(_2266) >> uint(2)));
    uint _2292 = uint(int(uint(int(_2290)) >> uint(2)));
    int _2294 = int(_2290) & 3;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[int(_2292)][_2294];
    int _2298 = int(_2290) + 1;
    uint _2300 = uint(int(uint(_2298) >> uint(2)));
    int _2302 = _2298 & 3;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[int(_2300)][_2302];
    int _2306 = _2270 << 4;
    int _2308 = _2306 + 512;
    float _2310 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2286);
    float _2312 = _2282 ? _2258 : 0.0;
    float _2314 = -_153;
    float _2316 = fma(_2314, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2226);
    bool _2318 = !_1608;
    int _2320 = _2318 ? 0 : 1;
    float _2322 = _1746 + (-0.5);
    bool _2324 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2326 = isnan(1.0);
    bool _2328 = _2324 || _2326;
    bool _2330 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2332 = _2328 || _2330;
    int _2334 = _2266 + 8;
    uint _2336 = uint(int(uint(_2334) >> uint(2)));
    uint _2338 = uint(int(uint(int(_2336)) >> uint(2)));
    int _2340 = int(_2336) & 3;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[int(_2338)][_2340];
    int _2344 = int(_2336) + 1;
    uint _2346 = uint(int(uint(_2344) >> uint(2)));
    int _2348 = _2344 & 3;
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[int(_2346)][_2348];
    bool _2352 = _2272 >= 0.0;
    float _2354 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2192);
    float _2356 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2284);
    float _2358 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2186);
    float _2360 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2208);
    float _2362 = -_2322;
    float _2364 = -_2354;
    float _2366 = fma(_2362, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2364);
    float _2368 = _2212 * (-2.0);
    uint _2370 = uint(int(uint(_2308) >> uint(2)));
    uint _2372 = uint(int(uint(int(_2370)) >> uint(2)));
    int _2374 = int(_2370) & 3;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[int(_2372)][_2374];
    int _2378 = int(_2370) + 1;
    uint _2380 = uint(int(uint(_2378) >> uint(2)));
    int _2382 = _2378 & 3;
    float _2384 = (*spvDescriptorSet0.vp_c9)._m0[int(_2380)][_2382];
    float _2386 = _929 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2388 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2390 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_2332)
    {
        float _2392 = _2312 * _2288;
        _155 = _2392;
    }
    float _2394 = _155;
    float _2396 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2316);
    float _2398 = _931 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2400 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2402 = !_1676;
    int _2404 = _2402 ? 0 : 1;
    int _2406 = _991 * _2020;
    int _2408 = _2406 + _1262;
    float _2410 = _2398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2412 = _2220 * (-2.0);
    int _2414 = abs(_1664);
    int _2416 = _2308 + 8;
    uint _2418 = uint(int(uint(_2416) >> uint(2)));
    uint _2420 = uint(int(uint(int(_2418)) >> uint(2)));
    int _2422 = int(_2418) & 3;
    float _2424 = (*spvDescriptorSet0.vp_c9)._m0[int(_2420)][_2422];
    int _2426 = int(_2418) + 1;
    uint _2428 = uint(int(uint(_2426) >> uint(2)));
    int _2430 = _2426 & 3;
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[int(_2428)][_2430];
    int _2434 = abs(_2320);
    out.m_76.x = _2388;
    out.m_76.y = _2400;
    out.m_76.z = _2410;
    out.m_76.w = _2390;
    int _2436 = abs(_1734);
    float _2438 = fma(_2084, _2368, _2084);
    int _2440 = abs(_2404);
    float _2442 = in.m_78.x;
    float _2444 = in.m_78.y;
    float _2446 = in.m_78.z;
    float _2448 = fma(_2076, _2412, _2076);
    bool _2450 = _1606 != 3;
    if (_2352)
    {
        out.m_61.x = 0.0;
    }
    int _2452 = abs(_1794);
    bool _2454 = _991 == 0;
    bool _2456 = _1051 == 0;
    int _2458 = ~_2414;
    int _2460 = _2458 + 1;
    int _2462 = _2460 + 1;
    int _2464 = ~_2434;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    int _2470 = ~_2436;
    int _2472 = _2470 + 1;
    int _2474 = _2472 + 1;
    int _2476 = _2462 * as_type<int>(_2304);
    int _2478 = abs(_1698);
    int _2480 = _2468 * as_type<int>(_2296);
    int _2482 = _2480 + _2476;
    int _2484 = ~_2440;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    float _2490 = fma(_2368, _2442, _2442);
    bool _2492 = !_1994;
    int _2494 = _2492 ? 0 : 1;
    float _2496 = fma(_2412, _2444, _2444);
    bool _2498 = _1674 != 3;
    int _2500 = _2474 * as_type<int>(_2384);
    int _2502 = ~_2478;
    int _2504 = _2502 + 1;
    int _2506 = _2504 + 1;
    int _2508 = abs(_2494);
    int _2510 = _2488 * as_type<int>(_2376);
    int _2512 = _2510 + _2500;
    bool _2514 = !_2498;
    int _2516 = _2514 ? 0 : (-1);
    int _2518 = _2506 * as_type<int>(_2342);
    int _2520 = _2518 + _2482;
    bool _2522 = !_2450;
    int _2524 = _2522 ? 0 : (-1);
    int _2526 = abs(_2516);
    int _2528 = abs(_2524);
    int _2530 = ~_2452;
    int _2532 = _2530 + 1;
    int _2534 = _2532 + 1;
    int _2536 = ~_2528;
    int _2538 = _2536 + 1;
    int _2540 = _2538 + 1;
    int _2542 = abs(_1768);
    int _2544 = _2534 * as_type<int>(_2424);
    int _2546 = _2544 + _2512;
    int _2548 = ~_2526;
    int _2550 = _2548 + 1;
    int _2552 = _2550 + 1;
    int _2554 = _2540 * as_type<int>(_2350);
    int _2556 = _2554 + _2520;
    int _2558 = ~_2542;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    int _2564 = ~_2508;
    int _2566 = _2564 + 1;
    int _2568 = _2566 + 1;
    int _2570 = _2552 * as_type<int>(_2432);
    int _2572 = _2570 + _2546;
    bool _2574 = !_2454;
    int _2576 = _2574 ? _2408 : (-1);
    int _2578 = _2556 * _2562;
    bool _2580 = !_2456;
    int _2582 = _2580 ? _2032 : (-1);
    int _2584 = _2572 * _2568;
    float _2586 = _2232 * _2232;
    int _2588 = _2576 * _2542;
    int _2590 = _2588 + _2578;
    float _2592 = as_type<float>(_2526);
    if (_2352)
    {
        _2592 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2594 = _2592;
    int _2596 = _2582 * _2508;
    int _2598 = _2596 + _2584;
    float _2600 = fma(_2238, _2238, _2586);
    float _2602 = -_2356;
    float _2604 = _2602 + 1.0;
    float _2606 = -_2310;
    float _2608 = _2606 + 1.0;
    float _2610 = -_2358;
    float _2612 = _2610 + 1.0;
    float _2614 = fma(_2246, _2246, _2600);
    float _2616 = -_2360;
    float _2618 = _2616 + 1.0;
    float _2620 = _1082 + (-0.5);
    float _2622 = -_2604;
    float _2624 = fma(_1824, _2622, _2148);
    float _2626 = fma(_1830, _2608, _2154);
    float _2628 = -_2612;
    float _2630 = fma(_1920, _2628, _2396);
    float _2632 = rsqrt(_2614);
    float _2634 = fma(_1746, _2618, _2366);
    int _2636 = as_type<int>(_2594);
    if (_2352)
    {
        float _2638 = _2594 * 5.0;
        _2636 = as_type<int>(_2638);
    }
    int _2640 = _2636;
    float _2642 = float(_2590);
    float _2644 = fma(_2620, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2490);
    float _2646 = float(_2598);
    out.m_80.x = _2624;
    out.m_80.y = _2626;
    out.m_80.z = _2630;
    out.m_80.w = _2634;
    bool _2648 = !_1984;
    int _2650 = _2648 ? 0 : 1;
    float _2652 = fma(_2438, _2394, _2644);
    float _2654 = _1084 + (-0.5);
    if (_2352)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8514 = as_type<float>(_2640);
        out.gl_Position.z = _8514;
    }
    int _2656 = abs(_2650);
    out.m_82.x = _2642;
    out.m_82.y = _2646;
    float _2658 = _2232 * _2632;
    float _2660 = _2238 * _2632;
    int _2662 = as_type<int>(_2660);
    if (_2352)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2664 = -_2658;
    float _2666 = fma(_2664, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2092);
    float _2668 = _2246 * _2632;
    float _2670 = -_2660;
    float _2672 = fma(_2670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2116);
    float _2674 = float(_1960);
    float _2676 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2678 = _2666 + _2676;
    float _2680 = -_2668;
    float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2168);
    float _2684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2686 = _2672 + _2684;
    float _2688 = -_2658;
    float _2690 = fma(_2688, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2232);
    float _2692 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2694 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2696 = _2682 + _2694;
    float _2698 = float(_2656);
    float _2700 = fma(_2654, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2496);
    float _2702 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2692);
    float _2704 = -_2660;
    float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2238);
    float _2708 = _2690 * _2690;
    float _2710 = _2698 * _2674;
    float _2712 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2702);
    float _2714 = _1086 + _1082;
    float _2716 = fma(_2448, _2394, _2700);
    float _2718 = fma(_2706, _2706, _2708);
    float _2720 = -_2668;
    float _2722 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2246);
    bool _2724 = _2712 >= 0.0;
    float _2726 = _2714 + (-1.0);
    float _2728 = _2710 * (-2.0);
    float _2730 = _2652 * 0.15915493667125701904296875;
    float _2732 = _2716 * 0.15915493667125701904296875;
    float _2734 = fma(_2722, _2722, _2718);
    float _2736 = fma(_2726, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2738 = _1086 + (-0.5);
    float _2740 = fma(_2728, _2446, _2446);
    float _2742 = _2730 * 6.283185482025146484375;
    float _2744 = sin(_2742);
    float _2746 = fma(_2736, _2728, _2736);
    float _2748 = _2692;
    int _2750 = as_type<int>(_2738);
    int _2752 = as_type<int>(_2668);
    if (_2724)
    {
        _2748 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2754 = _2748;
    float _2756 = fma(_2738, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2740);
    if (_2724)
    {
        out.m_61.x = 0.0;
    }
    float _2758 = _2730 * 6.283185482025146484375;
    float _2760 = cos(_2758);
    if (_2724)
    {
        float _2762 = _2754 * 5.0;
        _2750 = as_type<int>(_2762);
    }
    int _2764 = _2750;
    float _2766 = fma(_2746, _2394, _2756);
    if (_2724)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8715 = as_type<float>(_2764);
        out.gl_Position.z = _8715;
    }
    float _2768 = _2766 * 0.15915493667125701904296875;
    float _2770 = _2732 * 6.283185482025146484375;
    float _2772 = sin(_2770);
    float _2774 = sqrt(_2734);
    float _2776 = _2732 * 6.283185482025146484375;
    float _2778 = cos(_2776);
    if (_2724)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2780 = _2768 * 6.283185482025146484375;
    float _2782 = cos(_2780);
    float _2784 = _2632 * _2774;
    float _2786 = _455 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _2790 = _475 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2792 = _2760 * _2778;
    float _2794 = _2784 * _2786;
    float _2796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _2798 = _2768 * 6.283185482025146484375;
    float _2800 = sin(_2798);
    float _2802 = _2784 * _2790;
    float _2804 = _2788 * _2794;
    float _2806 = _2744 * _2772;
    float _2808 = _2760 * _2772;
    float _2810 = _2744 * _2778;
    float _2812 = _2796 * _2802;
    float _2814 = _2760 * _2782;
    float _2816 = _2778 * _2782;
    float _2818 = _2744 * _2782;
    float _2820 = _2772 * _2782;
    float _2822 = _2814 * _2804;
    float _2824 = _2784 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2826 = _2824 * 0.5;
    float _2828 = _2818 * _2804;
    float _2830 = fma(_2800, _2792, _2806);
    float _2832 = -_2810;
    float _2834 = fma(_2800, _2808, _2832);
    float _2836 = -_2804;
    float _2838 = _2800 * _2836;
    float _2840 = -_2808;
    float _2842 = fma(_2800, _2810, _2840);
    float _2844 = fma(_2830, _2812, _2822);
    float _2846 = _2830 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2848 = fma(_2816, _2812, _2838);
    float _2850 = _2830 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2852 = fma(_2834, _2826, _2844);
    float _2854 = fma(_2800, _2806, _2792);
    float _2856 = fma(_2842, _2812, _2828);
    float _2858 = fma(_2820, _2826, _2848);
    float _2860 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2862 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2864 = fma(_2854, _2826, _2856);
    float _2866 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2868 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2860);
    float _2870 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2862);
    float _2872 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2874 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2866);
    float _2876 = fma(_2864, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2868);
    float _2878 = fma(_2864, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2870);
    float _2880 = fma(_2872, _2872, 1.0);
    float _2882 = fma(_2864, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2874);
    float _2884 = _2876 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2886 = _2878 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2888 = _2830 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2890 = _2834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2892 = _2116 + _2884;
    float _2894 = _2168 + _2886;
    float _2896 = rsqrt(_2880);
    float _2898 = _2834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2902 = _2892 + _2900;
    float _2904 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2906 = _2894 + _2904;
    float _2908 = _2834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2910 = _2882 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2912 = _2902 * _2902;
    float _2914 = _2906 * _2906;
    float _2916 = fma(_2816, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2888);
    float _2918 = fma(_2816, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2850);
    float _2920 = fma(_2816, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2846);
    float _2922 = _2912 + _2914;
    float _2924 = _2814 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2926 = _2814 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2928 = _2814 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2930 = sqrt(_2922);
    float _2932 = _2092 + _2910;
    float _2934 = -_2800;
    float _2936 = fma(_2934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2924);
    float _2938 = -_2800;
    float _2940 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2926);
    float _2942 = -_2800;
    float _2944 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2928);
    float _2946 = fma(_2820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2890);
    float _2948 = fma(_2820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2898);
    float _2950 = fma(_2820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2908);
    bool _2952 = _2930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2954 = _2910;
    float _2956 = _2820;
    float _2958 = _2890;
    float _2960 = _2924;
    float _2962 = _2926;
    float _2964 = _2932;
    if (!_2952)
    {
        _2954 = _2914;
    }
    float _2966 = _2954;
    float _2968 = _2966;
    if (!_2952)
    {
        _2956 = _2912;
    }
    float _2970 = _2956;
    float _2972 = _2970;
    if (!_2952)
    {
        _2958 = _2892;
    }
    float _2974 = _2958;
    float _2976 = _2974;
    if (!_2952)
    {
        _2960 = _2894;
    }
    float _2978 = _2960;
    float _2980 = _2978;
    if (!_2952)
    {
        _2962 = _2932;
    }
    float _2982 = _2962;
    bool _2984 = !_2952;
    float _2986 = _2982;
    if (!_2984)
    {
        float _2988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2992 = _2930 + _2990;
        float _2994 = rsqrt(_2922);
        float _2996 = _2992 * _2988;
        float _2998 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3000 = _2996 * 0.15915493667125701904296875;
        float _3002 = _3000 * 6.283185482025146484375;
        float _3004 = sin(_3002);
        float _3006 = _3000 * 6.283185482025146484375;
        float _3008 = cos(_3006);
        float _3010 = fma(_3004, _2998, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3012 = _2994 * _3010;
        float _3014 = _3008 + (-1.0);
        float _3016 = fma(_2902, _3012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3018 = fma(_2906, _3012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3020 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3022 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3024 = _3016 + _3022;
        float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3028 = _3018 + _3026;
        float _3030 = fma(_2932, _3008, _3020);
        float _3032 = _3024 * _3024;
        float _3034 = _3028 * _3028;
        _2986 = _3030;
        _2972 = _3032;
        _2968 = _3034;
        _2976 = _3016;
        _2980 = _3018;
    }
    float _3036 = _2986;
    float _3038 = _2972;
    float _3040 = _2968;
    float _3042 = _2976;
    float _3044 = _2980;
    float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3048 = _3036 + _3046;
    float _3050 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2936);
    float _3052 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2940);
    float _3054 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2944);
    float _3056 = fma(_3048, _3048, _3038);
    float _3058 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2946);
    float _3060 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2948);
    float _3062 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2950);
    float _3064 = _3056 + _3040;
    float _3066 = _2872 * _2896;
    float _3068 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2916);
    float _3070 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2918);
    float _3072 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3074 = _2872 * _3050;
    float _3076 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2920);
    float _3078 = _2872 * _3052;
    float _3080 = _2872 * _3054;
    float _3082 = -_3058;
    float _3084 = _3066 * _3082;
    float _3086 = -_3060;
    float _3088 = _3066 * _3086;
    float _3090 = -_3062;
    float _3092 = _3066 * _3090;
    float _3094 = sqrt(_3064);
    float _3096 = fma(_3072, _3068, _3074);
    float _3098 = fma(_3072, _3070, _3078);
    float _3100 = fma(_3072, _3076, _3080);
    float _3102 = fma(_2896, _3050, _3084);
    float _3104 = _3058 + _3096;
    float _3106 = fma(_2896, _3052, _3088);
    float _3108 = fma(_2896, _3054, _3092);
    float _3110 = _3060 + _3098;
    float _3112 = _3062 + _3100;
    out.m_84.x = _3068;
    out.m_84.y = _3070;
    out.m_84.z = _3076;
    out.m_86.x = _3102;
    out.m_86.y = _3106;
    out.m_86.z = _3108;
    bool _3114 = _3094 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3116 = isnan(_3094);
    bool _3118 = _3114 || _3116;
    bool _3120 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3122 = _3118 || _3120;
    out.m_88.x = _3104;
    out.m_88.y = _3110;
    out.m_88.z = _3112;
    if (!_3122)
    {
        _2964 = 1.0;
    }
    float _3124 = _2964;
    bool _3126 = !_3122;
    float _3128 = _3124;
    if (!_3126)
    {
        bool _3130 = _3094 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3132 = isnan(_3094);
        bool _3134 = _3130 || _3132;
        bool _3136 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3138 = _3134 || _3136;
        if (!_3138)
        {
            float _3140 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3142 = _3094 + _3140;
            float _3144 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3146 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3144;
            float _3148 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3150 = _3148 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3152 = 1.0 / _3146;
            float _3154 = _3142 * _3152;
            float _3156 = fma(_3154, _3150, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3128 = _3156;
            _3158 = true;
        }
        else
        {
            bool _3160 = _3094 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3162 = isnan(_3094);
            bool _3164 = _3160 || _3162;
            bool _3166 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3168 = _3164 || _3166;
            if (!_3168)
            {
                float _3170 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3172 = _3094 + _3170;
                float _3174 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3176 = _3174 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3178 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3180 = _3178 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3182 = 1.0 / _3176;
                float _3184 = _3172 * _3182;
                float _3186 = fma(_3184, _3180, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3128 = _3186;
                _3158 = true;
            }
            else
            {
                _3128 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3158 = false;
    float _3188 = _3128;
    float _3190 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3192 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3194 = floor(_3190);
    float _3196 = floor(_3192);
    float _3198 = -_3194;
    float _3200 = _3190 + _3198;
    float _3202 = -_3196;
    float _3204 = _3192 + _3202;
    float2 _9482 = float2(_3200, _3204);
    float _3206 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9482, float2(0.0), isnan(_9482)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9482, float2(0.0), isnan(_9482)), level(0.0)).x;
    float _3208 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3210 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3212 = _3036 + _3210;
    float _3214 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3208);
    float _3216 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3218 = _3042 + _3216;
    float _3220 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _3222 = fma(_3212, _3188, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3224 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3214);
    float _3226 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3228 = _2666 + _3220;
    float _3230 = _3224 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3232 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3226);
    float _3234 = -_2092;
    float _3236 = _3234 + _3222;
    float _3238 = _3228 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3240 = 1.0 / _3230;
    float _3242 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3232);
    float _3244 = _3236 * _3236;
    float _3246 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3238);
    float _3248 = _3242 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3250 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3246);
    float _3252 = _3248 + _3230;
    float _3254 = _3250 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3256 = fma(_3218, _3188, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3258 = trunc(_3254);
    int _3260 = int(_3258);
    float _3262 = _3252 * _3240;
    float _3264 = _3262 * 0.5;
    float _3266 = -_2116;
    float _3268 = _3266 + _3256;
    float _3270 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3272 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3270);
    float _3274 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3276 = _3044 + _3274;
    float _3278 = fma(_3268, _3268, _3244);
    float _3280 = fma(_3276, _3188, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3282 = 1.0 / _3272;
    float _3284 = -_2168;
    float _3286 = _3284 + _3280;
    int _3288 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3290 = _3260 + _3288;
    int _3292 = _3290 + 1;
    float _3294 = fma(_3286, _3286, _3278);
    float _3296 = sqrt(_3294);
    float _3298 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3300 = _3282 * _3298;
    float _3302 = _3228 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _3304 = _3300 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3306 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3302);
    bool _3308 = _3300 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _3310 = !_3304;
    int _3312 = _3310 ? 0 : 1;
    float _3314 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3306);
    float _3316 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3318 = 2;
    float _3320 = _3280;
    float _3322 = _3222;
    float _3324 = _3254;
    float _3326 = _3228;
    if (!_3304)
    {
        _3318 = 1;
    }
    int _3328 = _3318;
    float _3330 = trunc(_3316);
    int _3332 = int(_3330);
    int _3334 = _3328;
    if (!_3308)
    {
        _3334 = _3312;
    }
    int _3336 = _3334;
    bool _3338 = _3292 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3340 = _3336 << 6;
    bool _3342 = _3296 > 0.0;
    int _3344 = _3340 + 96;
    uint _3346 = uint(int(uint(_3344) >> uint(2)));
    uint _3348 = uint(int(uint(int(_3346)) >> uint(2)));
    int _3350 = int(_3346) & 3;
    float _3352 = (*spvDescriptorSet0.vp_c15)._m0[int(_3348)][_3350];
    int _3354 = int(_3346) + 1;
    uint _3356 = uint(int(uint(_3354) >> uint(2)));
    int _3358 = _3354 & 3;
    float _3360 = (*spvDescriptorSet0.vp_c15)._m0[int(_3356)][_3358];
    int _3362 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3364 = _3332 + _3362;
    int _3366 = _3364 + 1;
    int _3368 = _3340 + 104;
    uint _3370 = uint(int(uint(_3368) >> uint(2)));
    uint _3372 = uint(int(uint(int(_3370)) >> uint(2)));
    int _3374 = int(_3370) & 3;
    float _3376 = (*spvDescriptorSet0.vp_c15)._m0[int(_3372)][_3374];
    int _3378 = int(_3370) + 1;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    int _3382 = _3378 & 3;
    float _3384 = (*spvDescriptorSet0.vp_c15)._m0[int(_3380)][_3382];
    int _3386 = _3292 | _3366;
    bool _3388 = _3386 < 0;
    bool _3390 = _3388 || _3338;
    int _3392 = _3340 + 48;
    uint _3394 = uint(int(uint(_3392) >> uint(2)));
    uint _3396 = uint(int(uint(int(_3394)) >> uint(2)));
    int _3398 = int(_3394) & 3;
    float _3400 = (*spvDescriptorSet0.vp_c15)._m0[int(_3396)][_3398];
    int _3402 = int(_3394) + 1;
    uint _3404 = uint(int(uint(_3402) >> uint(2)));
    int _3406 = _3402 & 3;
    float _3408 = (*spvDescriptorSet0.vp_c15)._m0[int(_3404)][_3406];
    bool _3410 = _3366 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3412 = _3410 || _3390;
    int _3414 = _3340 + 56;
    uint _3416 = uint(int(uint(_3414) >> uint(2)));
    uint _3418 = uint(int(uint(int(_3416)) >> uint(2)));
    int _3420 = int(_3416) & 3;
    float _3422 = (*spvDescriptorSet0.vp_c15)._m0[int(_3418)][_3420];
    int _3424 = int(_3416) + 1;
    uint _3426 = uint(int(uint(_3424) >> uint(2)));
    int _3428 = _3424 & 3;
    float _3430 = (*spvDescriptorSet0.vp_c15)._m0[int(_3426)][_3428];
    int _3432 = _3340 + 64;
    uint _3434 = uint(int(uint(_3432) >> uint(2)));
    uint _3436 = uint(int(uint(int(_3434)) >> uint(2)));
    int _3438 = int(_3434) & 3;
    float _3440 = (*spvDescriptorSet0.vp_c15)._m0[int(_3436)][_3438];
    int _3442 = int(_3434) + 1;
    uint _3444 = uint(int(uint(_3442) >> uint(2)));
    int _3446 = _3442 & 3;
    float _3448 = (*spvDescriptorSet0.vp_c15)._m0[int(_3444)][_3446];
    float _3450 = _3296;
    if (!_3412)
    {
        float _3452 = floor(_3254);
        _3450 = _3452;
    }
    float _3454 = _3450;
    int _3456 = _3340 + 72;
    uint _3458 = uint(int(uint(_3456) >> uint(2)));
    uint _3460 = uint(int(uint(int(_3458)) >> uint(2)));
    int _3462 = int(_3458) & 3;
    float _3464 = (*spvDescriptorSet0.vp_c15)._m0[int(_3460)][_3462];
    int _3466 = int(_3458) + 1;
    uint _3468 = uint(int(uint(_3466) >> uint(2)));
    int _3470 = _3466 & 3;
    float _3472 = (*spvDescriptorSet0.vp_c15)._m0[int(_3468)][_3470];
    int _3474 = _3340 + 80;
    uint _3476 = uint(int(uint(_3474) >> uint(2)));
    uint _3478 = uint(int(uint(int(_3476)) >> uint(2)));
    int _3480 = int(_3476) & 3;
    float _3482 = (*spvDescriptorSet0.vp_c15)._m0[int(_3478)][_3480];
    int _3484 = int(_3476) + 1;
    uint _3486 = uint(int(uint(_3484) >> uint(2)));
    int _3488 = _3484 & 3;
    float _3490 = (*spvDescriptorSet0.vp_c15)._m0[int(_3486)][_3488];
    float _3492 = _3228 * _3360;
    float _3494 = fma(_2672, _3352, _3492);
    bool _3496 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3498 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3500 = _3496 || _3498;
    bool _3502 = isnan(0.5);
    bool _3504 = _3500 || _3502;
    float _3506 = fma(_2682, _3376, _3494);
    float _3508 = _3376;
    if (!_3342)
    {
        _3508 = _3256;
    }
    float _3510 = _3508;
    float _3512 = _3228 * _3408;
    bool _3514 = !_3342;
    float _3516 = _3510;
    if (!_3514)
    {
        float _3518 = _215 * _215;
        float _3520 = fma(_213, _213, _3518);
        float _3522 = fma(_217, _217, _3520);
        float _3524 = rsqrt(_3294);
        float _3526 = sqrt(_3522);
        float _3528 = _3268 * _3524;
        float _3530 = _3236 * _3524;
        float _3532 = _3286 * _3524;
        bool _3534 = _3526 > 0.0;
        float _3536 = _3524;
        if (!_3534)
        {
            _3536 = _3256;
        }
        float _3538 = _3536;
        bool _3540 = !_3534;
        _3516 = _3538;
        if (!_3540)
        {
            float _3542 = rsqrt(_3522);
            float _3544 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3546 = _215 * _3542;
            float _3548 = _213 * _3542;
            float _3550 = _217 * _3542;
            float _3552 = _3530 * _3546;
            float _3554 = fma(_3528, _3548, _3552);
            float _3556 = _3544 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3558 = fma(_3532, _3550, _3554);
            float _3560 = _3558 * _3556;
            float _3562 = fma(_213, _3560, _3256);
            float _3564 = fma(_215, _3560, _3222);
            float _3566 = fma(_217, _3560, _3280);
            _3516 = _3562;
            _3320 = _3566;
            _3322 = _3564;
        }
    }
    float _3568 = _3516;
    float _3570 = _3320;
    float _3572 = _3322;
    float _3574 = fma(_2672, _3400, _3512);
    float _3576 = _3506 + _3384;
    if (!_3412)
    {
        int _3578 = _3366 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3580 = _3578 + _3292;
        _221 = _3580;
    }
    int _3582 = _221;
    float _3584 = _3228 * _3448;
    float _3586 = fma(_2682, _3422, _3574);
    float _3588 = -_2660;
    float _3590 = fma(_3588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3568);
    float _3592 = 1.0 / _3576;
    float _3594 = fma(_2672, _3440, _3584);
    float _3596 = _3590;
    if (!_3412)
    {
        int _3598 = _3582 << 2;
        _2662 = _3598;
    }
    int _3600 = _2662;
    float _3602 = -_2668;
    float _3604 = fma(_3602, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3570);
    float _3606 = -_2658;
    float _3608 = fma(_3606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3572);
    float _3610 = fma(_2682, _3464, _3594);
    int _3612 = _3600;
    float _3614 = _3608;
    float _3616 = _3604;
    if (!_3412)
    {
        uint _3618 = uint(int(uint(_3582) >> uint(2)));
        _2752 = int(_3618);
    }
    int _3620 = _2752;
    if (!_3412)
    {
        int _3622 = 12 & _3600;
        _3612 = _3622;
    }
    int _3624 = _3612;
    if (!_3504)
    {
        float _3626 = _2678 * _2678;
        float _3628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3630 = -_2092;
        float _3632 = _3630 + _3572;
        float _3634 = -_2168;
        float _3636 = _3634 + _3570;
        float _3638 = fma(_2686, _2686, _3626);
        float _3640 = fma(_2696, _2696, _3638);
        float _3642 = 1.0 / _2784;
        float _3644 = sqrt(_3640);
        float _3646 = precise::min(_3644, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3648 = _3646 * _3628;
        float _3650 = _3648 * _3642;
        float _3652 = -_2116;
        float _3654 = _3652 + _3568;
        float _3656 = fma(_3632, _3650, _2666);
        float _3658 = fma(_3654, _3650, _2672);
        float _3660 = fma(_3636, _3650, _2682);
        _3614 = _3656;
        _3596 = _3658;
        _3616 = _3660;
    }
    float _3662 = _3614;
    float _3664 = _3596;
    float _3666 = _3616;
    if (!_3412)
    {
        int _3668 = _3620 << 4;
        int _3670 = _3668 + _3624;
        _2172 = as_type<float>(_3670);
    }
    float _3672 = _2172;
    int _3674 = _3340 + 88;
    uint _3676 = uint(int(uint(_3674) >> uint(2)));
    uint _3678 = uint(int(uint(int(_3676)) >> uint(2)));
    int _3680 = int(_3676) & 3;
    float _3682 = (*spvDescriptorSet0.vp_c15)._m0[int(_3678)][_3680];
    int _3684 = int(_3676) + 1;
    uint _3686 = uint(int(uint(_3684) >> uint(2)));
    int _3688 = _3684 & 3;
    float _3690 = (*spvDescriptorSet0.vp_c15)._m0[int(_3686)][_3688];
    float _3692 = _3586 + _3430;
    float _3694 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3696 = _3610 + _3472;
    float _3698 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3700 = _3692 * _3592;
    float _3702 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3694);
    float _3704 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3706 = _3672;
    float _3708 = _3700;
    if (!_3412)
    {
        int _3710 = as_type<int>(_3672) + 400;
        uint _3712 = uint(int(uint(_3710) >> uint(2)));
        uint _3714 = uint(int(uint(int(_3712)) >> uint(2)));
        int _3716 = int(_3712) & 3;
        float _3718 = (*spvDescriptorSet0.vp_c15)._m0[int(_3714)][_3716];
        _3706 = _3718;
    }
    float _3720 = _3706;
    float _3722 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3698);
    float _3724 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3702);
    bool _3726 = _3700 >= 0.0;
    float _3728 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3704);
    float _3730 = _3696 * _3592;
    float _3732 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3734 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3722);
    float _3736 = _3724 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3738 = _3700 <= 1.0;
    bool _3740 = _3738 && _3726;
    float _3742 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3728);
    float _3744 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3732);
    float _3746 = _3734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3748 = _3736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3750 = _3730 >= 0.0;
    bool _3752 = _3750 && _3740;
    float _3754 = _3742 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3756 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3744);
    float _3758 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3748);
    bool _3760 = _3730 <= 1.0;
    bool _3762 = _3760 && _3752;
    float _3764 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3766 = _3754 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3768 = _3756 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3770 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3758);
    float _3772 = _3228 * _3490;
    float _3774 = -_3766;
    float _3776 = fma(_3774, _3764, 1.0);
    float _3778 = _3736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3780 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3770);
    float _3782 = _3736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3784 = log2(_3776);
    float _3786 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3778);
    float _3788 = fma(_2672, _3482, _3772);
    float _3790 = _3778;
    if (_3762)
    {
        float _3792 = float(_3336);
        _3790 = _3792;
    }
    float _3794 = _3790;
    float _3796 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3782);
    float _3798 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3786);
    if (!_3412)
    {
        float _3800 = -_3454;
        float _3802 = _3254 + _3800;
        _3324 = _3802;
    }
    float _3804 = _3324;
    float _3806 = 1.0 / _3780;
    float _3808 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3796);
    float _3810 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3798);
    float _3812 = fma(_2682, _3682, _3788);
    float _3814 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3808);
    float _3816 = _3568;
    if (!_3412)
    {
        float _3818 = floor(_3316);
        _3816 = _3818;
    }
    float _3820 = _3816;
    float _3822 = _3812 + _3690;
    float _3824 = _3784 * 0.693147182464599609375;
    float _3826 = _3822 * _3592;
    float _3828 = _3824 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3830 = _3794;
    float _3832 = _3824;
    if (_3762)
    {
        float _3834 = rint(_3794);
        float _3836 = precise::max(_3834, 0.0);
        uint _3838 = uint(_3836);
        uint _3840 = clamp(_3838, 0u, 65535u);
        _3830 = as_type<float>(_3840);
    }
    float _3842 = _3830;
    float _3844 = _3810 * _3806;
    float _3846 = _3814 * _3806;
    float _3848 = fma(_3844, 0.5, 0.5);
    float _3850 = fma(_3846, -0.5, 0.5);
    float _3852 = _3782;
    float _3854 = _3720;
    if (!_3412)
    {
        float _3856 = rint(_3720);
        float _3858 = precise::max(_3856, 0.0);
        uint _3860 = uint(_3858);
        uint _3862 = clamp(_3860, 0u, 65535u);
        _3852 = as_type<float>(_3862);
    }
    float _3864 = _3852;
    float _3866 = _3820;
    if (!_3412)
    {
        float _3868 = -_3820;
        float _3870 = _3316 + _3868;
        _3866 = _3870;
    }
    float _3872 = _3866;
    float _3874 = _3730;
    if (_3762)
    {
        float3 _10613 = float3(_3700, _3730, float(as_type<int>(_3842)));
        float3 _10617 = select(_10613, float3(0.0), isnan(_10613));
        float _3876 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _10617.xy, uint(rint(_10617.z)), _3826, level(0.0));
        _3874 = _3876;
    }
    float _3878 = _3874;
    float3 _10627 = float3(_3848, _3850, _3828);
    float _3880 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10627, float3(0.0), isnan(_10627)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10627, float3(0.0), isnan(_10627)), level(0.0)).x;
    float3 _10636 = float3(_3848, _3850, _3828);
    float4 _3883 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10636, float3(0.0), isnan(_10636)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10636, float3(0.0), isnan(_10636)), level(0.0)).xyzw;
    float _3885 = _3883.x;
    float _3887 = _3883.y;
    float _3889 = _3883.z;
    float _3891 = _3883.w;
    float _3893 = _3804;
    if (!_3412)
    {
        float3 _10659 = float3(_3804, _3872, float(as_type<int>(_3864)));
        float3 _10661 = select(_10659, float3(0.0), isnan(_10659));
        float _3895 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10661.xy, uint(rint(_10661.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10661.xy, uint(rint(_10661.z)), level(0.0)).x;
        _3893 = _3895;
    }
    float _3897 = _3893;
    if (_3412)
    {
        _3832 = 1.0;
    }
    float _3899 = _3832;
    float _3901 = _3897;
    float _3903 = _3899;
    float _3905 = _3887;
    float _3907 = _3885;
    if (!_3412)
    {
        int _3909 = _3582 << 4;
        int _3911 = _3909 + 2048;
        uint _3913 = uint(int(uint(_3911) >> uint(2)));
        uint _3915 = uint(int(uint(int(_3913)) >> uint(2)));
        int _3917 = int(_3913) & 3;
        float _3919 = (*spvDescriptorSet0.vp_c15)._m0[int(_3915)][_3917];
        int _3921 = int(_3913) + 1;
        uint _3923 = uint(int(uint(_3921) >> uint(2)));
        int _3925 = _3921 & 3;
        float _3927 = (*spvDescriptorSet0.vp_c15)._m0[int(_3923)][_3925];
        int _3929 = _3911 + 8;
        uint _3931 = uint(int(uint(_3929) >> uint(2)));
        uint _3933 = uint(int(uint(int(_3931)) >> uint(2)));
        int _3935 = int(_3931) & 3;
        float _3937 = (*spvDescriptorSet0.vp_c15)._m0[int(_3933)][_3935];
        int _3939 = int(_3931) + 1;
        uint _3941 = uint(int(uint(_3939) >> uint(2)));
        int _3943 = _3939 & 3;
        float _3945 = (*spvDescriptorSet0.vp_c15)._m0[int(_3941)][_3943];
        float _3947 = _3228 * _3927;
        float _3949 = fma(_2672, _3919, _3947);
        float _3951 = fma(_2682, _3937, _3949);
        float _3953 = _3951 + _3945;
        float _3955 = precise::clamp(_3953, 0.0, 1.0);
        float _3957 = -_3955;
        float _3959 = _3957 + _3897;
        float _3961 = fma(_3959, 500.0, 1.5);
        float _3963 = exp2(_3961);
        float _3965 = 0.0 + _3963;
        float _3967 = precise::clamp(_3965, 0.0, 1.0);
        _3901 = _3963;
        _3708 = _3927;
        _3854 = _3937;
        _3326 = _3955;
        _3903 = _3967;
    }
    float _3969 = _3901;
    float _3971 = _3708;
    float _3973 = _3854;
    float _3975 = _3326;
    float _3977 = _3903;
    float _3979 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3981 = _3662 + _3979;
    float _3983 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3985 = _3664 + _3983;
    float _3987 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3989 = _3666 + _3987;
    float _3991 = _3981 * _3981;
    float _3993 = fma(_3985, _3985, _3991);
    float _3995 = fma(_3989, _3989, _3993);
    float _3997 = rsqrt(_3995);
    float _3999 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4001 = _3985 * _3999;
    float _4003 = _3989 * _3999;
    float _4005 = _4001 * _4001;
    float _4007 = _4003 * _4003;
    float _4009 = _4005 + _4007;
    float _4011 = sqrt(_4009);
    bool _4013 = _4011 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4017 = _4011 + _4015;
    float _4019 = _3997;
    float _4021 = _3973;
    float _4023 = _4017;
    float _4025 = _3969;
    float _4027 = _3981;
    float _4029 = _3975;
    float _4031 = _3999;
    if (_4013)
    {
        float _4033 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4019 = _4033;
    }
    float _4035 = _4019;
    if (_4013)
    {
        float _4037 = rsqrt(_4009);
        _4021 = _4037;
    }
    float _4039 = _4021;
    float _4041 = _4039;
    if (_4013)
    {
        float _4043 = _4017 * _4035;
        _4023 = _4043;
    }
    float _4045 = _4023;
    if (_4013)
    {
        float _4047 = _4045 * 0.15915493667125701904296875;
        _4025 = _4047;
    }
    float _4049 = _4025;
    float _4051 = _3989;
    if (_4013)
    {
        float _4053 = _4049 * 6.283185482025146484375;
        float _4055 = sin(_4053);
        _4051 = _4055;
    }
    float _4057 = _4051;
    float _4059 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4061 = precise::max(0.0, _4059);
    float _4063 = _3971;
    float _4065 = _4061;
    float _4067 = _4059;
    if (_4013)
    {
        float _4069 = _4049 * 6.283185482025146484375;
        float _4071 = cos(_4069);
        _4063 = _4071;
    }
    float _4073 = _4063;
    float _4075 = -_3999;
    float _4077 = -_4061;
    float _4079 = fma(_3981, _4075, _4077);
    if (!_4013)
    {
        _4027 = _4003;
    }
    float _4081 = _4027;
    float _4083 = _4081;
    if (_4013)
    {
        float _4085 = _4079 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4065 = _4085;
    }
    float _4087 = _4065;
    float _4089 = _4057;
    float _4091 = _4087;
    if (_4013)
    {
        float _4093 = fma(_4057, _4087, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4089 = _4093;
    }
    float _4095 = _4089;
    float _4097 = _4095;
    if (!_4013)
    {
        _4091 = _4001;
    }
    float _4099 = _4091;
    float _4101 = _4099;
    float _4103 = _4073;
    if (_4013)
    {
        float _4105 = _4073 + (-1.0);
        _4067 = _4105;
    }
    float _4107 = _4067;
    if (_4013)
    {
        float _4109 = _4039 * _4095;
        _4029 = _4109;
    }
    float _4111 = _4029;
    if (!_4013)
    {
        _4097 = _4079;
    }
    float _4113 = _4097;
    float _4115 = _4113;
    if (_4013)
    {
        float _4117 = _4107 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4031 = _4117;
    }
    float _4119 = _4031;
    if (_4013)
    {
        float _4121 = _4001 * _4111;
        _4101 = _4121;
    }
    float _4123 = _4101;
    if (!_4013)
    {
        _4041 = _4005;
    }
    float _4125 = _4041;
    float _4127 = _4125;
    if (_4013)
    {
        float _4129 = _4003 * _4111;
        _4083 = _4129;
    }
    float _4131 = _4083;
    if (_4013)
    {
        float _4133 = fma(_4079, _4073, _4119);
        _4115 = _4133;
    }
    float _4135 = _4115;
    if (_4013)
    {
        float _4137 = _4123 * _4123;
        _4127 = _4137;
    }
    float _4139 = _4127;
    if (!_4013)
    {
        _4103 = _4007;
    }
    float _4141 = _4103;
    float _4143 = sqrt(_3995);
    float _4145 = _4141;
    if (_4013)
    {
        float _4147 = _4131 * _4131;
        _4145 = _4147;
    }
    float _4149 = _4145;
    float _4151 = fma(_4135, _4135, _4139);
    float _4153 = _4151 + _4149;
    float _4155 = rsqrt(_4153);
    float _4157 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4159 = fma(_4143, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4157);
    float _4161 = precise::clamp(_4159, 0.0, 1.0);
    float _4163 = -_4161;
    float _4165 = _4163 + 1.0;
    float _4167 = _4155 * _4123;
    float _4169 = abs(_4165);
    float _4171 = log2(_4169);
    float _4173 = _4155 * _4135;
    float _4175 = _4155 * _4131;
    float _4177 = _4167 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4179 = -_4177;
    float _4181 = fma(_4173, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4179);
    float _4183 = -_4175;
    float _4185 = fma(_4183, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4181);
    float _4187 = fma(_4185, -0.5, 0.5);
    float _4189 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4191 = fma(_4185, 0.5, 0.5);
    float _4193 = _4173 + 1.0;
    float _4195 = sqrt(_4187);
    float _4197 = fma(_4191, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4199 = fma(_4191, _4197, -0.212114393711090087890625);
    float _4201 = exp2(_4189);
    float _4203 = fma(_4191, _4199, 1.570728778839111328125);
    float _4205 = _4195 * 0.636619746685028076171875;
    float _4207 = -_4203;
    float _4209 = fma(_4205, _4207, 1.0);
    float _4211 = -_4173;
    float _4213 = fma(_4201, _4193, _4211);
    float _4215 = fma(_4213, 0.5, 0.5);
    float2 _11144 = float2(_4209, _4215);
    float3 _4219 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11144, float2(0.0), isnan(_11144)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11144, float2(0.0), isnan(_11144)), level(0.0)).xyz;
    float _4221 = _4219.x;
    float _4223 = _4219.y;
    float _4225 = _4219.z;
    float _4227 = abs(_3300);
    float _4229 = log2(_4227);
    float _4231 = _3736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4233 = -_3206;
    float _4235 = _4233 + 1.0;
    out.m_90.x = _3664;
    out.m_90.y = _3662;
    out.m_90.z = _3666;
    float _4237 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4231);
    bool _4239 = _4143 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4241 = isnan(_4143);
    bool _4243 = _4239 || _4241;
    bool _4245 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4247 = _4243 || _4245;
    bool _4249 = _3300 <= 8000.0;
    bool _4251 = isnan(_3300);
    bool _4253 = _4249 || _4251;
    bool _4255 = isnan(8000.0);
    bool _4257 = _4253 || _4255;
    float _4259 = float(_4257);
    float _4261 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4237);
    float _4263 = _4229 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4265 = exp2(_4263);
    float _4267 = fma(_4265, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4269 = precise::clamp(_4267, 0.0, 1.0);
    float _4271 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4273 = fma(_4269, -2.0, 3.0);
    float _4275 = _4269 * _4269;
    float _4277 = _4265;
    if (!_4247)
    {
        _4277 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4279 = _4277;
    float _4281 = exp2(_4271);
    float _4283 = _4275 * _4273;
    float _4285 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4261);
    float _4287 = -_4283;
    float _4289 = _4287 + 1.0;
    float _4291 = _4285 + _3780;
    float _4293 = fma(_4289, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4283);
    float _4295 = _4291 * 0.5;
    float _4297 = _4259 * _4293;
    float _4299 = _4293;
    float _4301 = _3810;
    float _4303 = _4279;
    float _4305 = _4279;
    if (!_3762)
    {
        _4299 = 1.0;
    }
    float _4307 = _4299;
    float _4309 = -_4281;
    float _4311 = _4309 + 1.0;
    float _4313 = _4307;
    if (_3762)
    {
        bool _4315 = _3878 >= _3826;
        bool _4317 = isnan(_3878);
        bool _4319 = _4315 || _4317;
        bool _4321 = isnan(_3826);
        bool _4323 = _4319 || _4321;
        float _4325 = float(_4323);
        _4313 = _4325;
    }
    float _4327 = _4313;
    float _4329 = _4297 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_92.z = _4295;
    out.m_92.w = _3780;
    float _4331 = _4311 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4333 = _4235 * _4329;
    float _4335 = precise::clamp(_4333, 0.0, 1.0);
    float _4337 = _4327 * _3977;
    float _4339 = _4331 * _3880;
    float _4341 = -_4331;
    float _4343 = _4341 + 1.0;
    float _4345 = -_4335;
    float _4347 = fma(_4345, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _3810;
    out.gl_Position.y = _3814;
    out.gl_Position.z = _4285;
    out.gl_Position.w = _3780;
    float _4349 = _3891 * _4339;
    float _4351 = _4331;
    float _4353 = _4343;
    if (!_4247)
    {
        _4351 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4355 = _4351;
    float _4357 = -_4337;
    float _4359 = fma(_4357, _4347, 1.0);
    float _4361 = precise::clamp(_4359, 0.0, 1.0);
    float _4363 = _4361 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _4363;
    float _4365 = _4355;
    float _4367 = _4355;
    if (!_4247)
    {
        _4301 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4369 = _4301;
    float _4371 = _4225 * _4339;
    float _4373 = fma(_4221, _4349, _3885);
    float _4375 = fma(_4223, _4349, _3887);
    float _4377 = _3891 * _4343;
    float _4379 = fma(_3891, _4371, _3889);
    float _4381 = _4369;
    float _4383 = _4369;
    if (!_4247)
    {
        _4353 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4385 = _4353;
    float _4387 = _4385;
    float _4389 = _4385;
    if (!_4247)
    {
        _3905 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4391 = _3905;
    out.m_96.x = _4373;
    out.m_96.y = _4375;
    out.m_96.z = _4379;
    out.m_96.w = _4377;
    float _4393 = _4391;
    float _4395 = _4391;
    if (!_4247)
    {
        _3907 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4397 = _3907;
    bool _4399 = !_4247;
    float _4401 = _4397;
    float _4403 = _4397;
    if (!_4399)
    {
        bool _4405 = _4143 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4407 = isnan(_4143);
        bool _4409 = _4405 || _4407;
        bool _4411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4413 = _4409 || _4411;
        if (!_4413)
        {
            float _4415 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4417 = _4143 + _4415;
            float _4419 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4421 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4419;
            float _4423 = 1.0 / _4421;
            float _4425 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4427 = _4425 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4429 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4431 = _4429 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4433 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4435 = _4433 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4437 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4439 = _4437 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4441 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4443 = _4441 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4445 = _4417 * _4423;
            float _4447 = precise::clamp(_4445, 0.0, 1.0);
            float _4449 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4451 = _4449 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4453 = fma(_4447, _4427, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4455 = fma(_4447, _4451, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4457 = fma(_4447, _4431, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4459 = fma(_4447, _4435, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4461 = fma(_4447, _4439, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4463 = fma(_4447, _4443, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4305 = _4455;
            _4403 = _4461;
            _4383 = _4453;
            _4395 = _4459;
            _4389 = _4457;
            _4367 = _4463;
            _4465 = true;
        }
        else
        {
            bool _4467 = _4143 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4469 = isnan(_4143);
            bool _4471 = _4467 || _4469;
            bool _4473 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4475 = _4471 || _4473;
            if (!_4475)
            {
                _4381 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4477 = _4381;
            _4383 = _4477;
            if (!_4475)
            {
                _4303 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4479 = _4303;
            _4305 = _4479;
            if (!_4475)
            {
                _4387 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4481 = _4387;
            _4389 = _4481;
            if (!_4475)
            {
                _4393 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4483 = _4393;
            _4395 = _4483;
            if (!_4475)
            {
                _4401 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4485 = _4401;
            _4403 = _4485;
            if (!_4475)
            {
                _4365 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4487 = _4365;
            bool _4489 = !_4475;
            _4367 = _4487;
            if (!_4489)
            {
                bool _4491 = _4143 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4493 = isnan(_4143);
                bool _4495 = _4491 || _4493;
                bool _4497 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4499 = _4495 || _4497;
                if (!_4499)
                {
                    float _4501 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4503 = _4143 + _4501;
                    float _4505 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4507 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4505;
                    float _4509 = 1.0 / _4507;
                    float _4511 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4513 = _4511 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4515 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4517 = _4515 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4519 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4521 = _4519 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4523 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4525 = _4523 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4527 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4529 = _4527 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4531 = _4503 * _4509;
                    float _4533 = precise::clamp(_4531, 0.0, 1.0);
                    float _4535 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4537 = _4535 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4539 = fma(_4533, _4513, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4541 = fma(_4533, _4537, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4543 = fma(_4533, _4517, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4545 = fma(_4533, _4521, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4547 = fma(_4533, _4525, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4549 = fma(_4533, _4529, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4305 = _4541;
                    _4403 = _4547;
                    _4383 = _4539;
                    _4395 = _4545;
                    _4389 = _4543;
                    _4367 = _4549;
                    _4465 = true;
                }
                else
                {
                    _4305 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4403 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4383 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4395 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4389 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4367 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4465 = false;
    float _4551 = _4305;
    float _4553 = _4403;
    float _4555 = _4383;
    float _4557 = _4395;
    float _4559 = _4389;
    float _4561 = _4367;
    float _4563 = fma(_3110, -0.5, 0.5);
    float _4565 = precise::clamp(_4563, 0.0, 1.0);
    float _4567 = -_4551;
    float _4569 = _4567 + _4553;
    float _4571 = -_4555;
    float _4573 = _4571 + _4557;
    float _4575 = -_4559;
    float _4577 = _4575 + _4561;
    bool _4579 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4581 = fma(_4565, _4569, _4551);
    float _4583 = fma(_4565, _4573, _4555);
    float _4585 = fma(_4565, _4577, _4559);
    float _4587 = _4581 * 0.586610972881317138671875;
    out.m_98.x = 0.0;
    float _4589 = fma(_4583, 0.298911988735198974609375, _4587);
    float _4591 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4593 = fma(_4585, 0.114477999508380889892578125, _4589);
    out.m_61.x = _4591;
    float _4595 = -_4593;
    float _4597 = _4583 + _4595;
    float _4599 = -_4593;
    float _4601 = _4581 + _4599;
    float _4603 = -_4593;
    float _4605 = _4585 + _4603;
    float _4607 = fma(_4597, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4593);
    float _4609 = fma(_4601, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4593);
    float _4611 = fma(_4605, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4593);
    out.m_100.x = _4607;
    out.m_100.y = _4609;
    out.m_100.z = _4611;
    if (!_4579)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4613 = -_3662;
    float _4615 = _4613 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4617 = -_3664;
    float _4619 = _4617 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4621 = -_3666;
    float _4623 = _4621 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4625 = _4615 * _4615;
    float _4627 = fma(_4619, _4619, _4625);
    float _4629 = fma(_4623, _4623, _4627);
    float _4631 = sqrt(_4629);
    float _4633 = rsqrt(_4629);
    float _4635 = -_4631;
    float _4637 = _4635 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4639 = _4637 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4641 = precise::clamp(_4639, 0.0, 1.0);
    float _4643 = _4619 * _4633;
    float _4645 = _4615 * _4633;
    float _4647 = abs(_4641);
    float _4649 = log2(_4647);
    float _4651 = _4623 * _4633;
    float _4653 = _4643 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4655 = _3110 * _4645;
    float _4657 = -_4645;
    float _4659 = -_4653;
    float _4661 = fma(_4657, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4659);
    float _4663 = fma(_3104, _4643, _4655);
    float _4665 = -_4651;
    float _4667 = fma(_4665, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4661);
    float _4669 = fma(_3112, _4651, _4663);
    float _4671 = precise::clamp(_4669, 0.0, 1.0);
    float _4673 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4675 = _4667 + _4673;
    float _4677 = _4649 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4679 = _4675 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4681 = precise::clamp(_4679, 0.0, 1.0);
    float _4683 = exp2(_4677);
    float _4685 = _4683 * _4681;
    float _4687 = _4671 * _4685;
    float _4689 = _4687 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4691 = _4687 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4693 = _4687 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4689;
    out.m_98.y = _4691;
    out.m_98.z = _4693;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4465 = false;
    bool _3158 = false;
    bool _953 = false;
    bool _785 = false;
    bool _565 = false;
    bool _389 = false;
    bool _241 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_58.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_61.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4750 = as_type<float>(_135);
        out.gl_Position.z = _4750;
    }
    if (!_123)
    {
        return out;
    }
    float _139 = in.m_63.w;
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
        _129 = _157;
    }
    float _159 = _129;
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
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4820 = as_type<float>(_173);
        out.gl_Position.z = _4820;
    }
    if (_165)
    {
        return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_68.x;
    float _179 = in.m_68.y;
    float _181 = in.m_68.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _199 = !_185;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _209 = !_189;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _215 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _217 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _219 = !_191;
    int _221 = as_type<int>(_213);
    float _239;
    if (!_219)
    {
        float _223 = in.m_70.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        float _243 = float(_119);
        float _245 = 1.0 / _243;
        float _247 = _153 * _245;
        _239 = _247;
    }
    _241 = false;
    float _249 = _239;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = _249 + _251;
    bool _255 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _257 = isnan(_249);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    bool _267 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _269 = isnan(_249);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _283 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = -_265;
    float _289 = _287 + 1.0;
    float _291 = 1.0 / _281;
    bool _293 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_249);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _277 * _289;
    float _307 = -_277;
    float _309 = _307 + 1.0;
    bool _311 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _313 = _303 * _309;
    float _315 = 1.0 / _285;
    float _317 = -_303;
    float _319 = _317 + 1.0;
    float _321 = _253 * _291;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _249 + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_329, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = fma(_333, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = _325 * _315;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = _335 * _313;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = _337 * _313;
    float _353 = fma(_343, _339, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _355 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[143].x, _345);
    float _357 = fma(_349, _339, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _359 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _361 = fma(_353, _305, _355);
    float _363 = fma(_357, _305, _359);
    float _365 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[145].x, _361);
    float _367 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[145].y, _363);
    bool _369 = !_311;
    float _387;
    if (!_369)
    {
        float _371 = in.m_70.x;
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _375 = _371 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _377 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[11].x, _153);
        float _379 = _377 * _373;
        float _381 = floor(_379);
        float _383 = -_381;
        float _385 = _379 + _383;
        _387 = _385;
        _389 = true;
    }
    else
    {
        float _391 = float(_119);
        float _393 = 1.0 / _391;
        float _395 = _153 * _393;
        _387 = _395;
    }
    _389 = false;
    float _397 = _387;
    float _399 = in.m_72.x;
    float _401 = in.m_72.y;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _405 = _397 + _403;
    bool _407 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _409 = isnan(_397);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _427 = 1.0 / _421;
    bool _429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _431 = 1.0 / _425;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _433;
    float _437 = _405 * _427;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _441 = _397 + _439;
    bool _443 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _445 = isnan(_397);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = _367 * _401;
    bool _457 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _459 = isnan(_397);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -_417;
    float _471 = _469 + 1.0;
    float _473 = fma(_435, _437, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _475 = _365 * _399;
    float _477 = _441 * _431;
    float _479 = _467 * _471;
    float _481 = -_467;
    float _483 = _481 + 1.0;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _489;
    float _493 = _453 * _483;
    float _495 = fma(_487, _437, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _497 = fma(_491, _437, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _499 = -_453;
    float _501 = _499 + 1.0;
    float _503 = _473 * _493;
    float _505 = _495 * _493;
    float _507 = _497 * _493;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _521 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].x, _507);
    float _523 = fma(_511, _477, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _525 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].y, _505);
    float _527 = fma(_515, _477, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _529 = fma(_519, _477, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _531 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].z, _503);
    float _533 = fma(_523, _479, _525);
    float _535 = fma(_527, _479, _521);
    float _537 = fma(_529, _479, _531);
    float _539 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[109].y, _533);
    float _541 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[109].x, _535);
    float _543 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[109].z, _537);
    bool _545 = !_429;
    float _563;
    if (!_545)
    {
        float _547 = in.m_70.x;
        float _549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _551 = _547 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _553 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _555 = _553 * _549;
        float _557 = floor(_555);
        float _559 = -_557;
        float _561 = _555 + _559;
        _563 = _561;
        _565 = true;
    }
    else
    {
        float _567 = float(_119);
        float _569 = 1.0 / _567;
        float _571 = _153 * _569;
        _563 = _571;
    }
    _565 = false;
    float _573 = _563;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _577 = _573 + _575;
    float _579 = _541 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _589 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _591 = isnan(_573);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _601;
    float _605 = 1.0 / _583;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _611 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _613 = isnan(_573);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = _539 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _629 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _631 = isnan(_573);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _643 = 1.0 / _587;
    float _645 = -_621;
    float _647 = _645 + 1.0;
    float _649 = _579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _653 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _599 * _647;
    bool _657 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _659 = _603 * _605;
    bool _661 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _663 = isnan(_573);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -_599;
    float _675 = _673 + 1.0;
    float _677 = 1.0 / _609;
    float _679 = fma(_659, _577, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _681;
    float _685 = _671 * _675;
    float _687 = -_671;
    float _689 = _687 + 1.0;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _695 = 1.0 / _627;
    float _697 = _639 * _689;
    float _699 = _693 * _643;
    float _701 = -_639;
    float _703 = _701 + 1.0;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _707 = _573 + _705;
    float _709 = _679 * _697;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _713 = _573 + _711;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _719 = _683 * _677;
    bool _721 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _723 = isnan(_573);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = fma(_699, _713, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _735 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[115].x, _709);
    float _737 = fma(_719, _707, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _741 = _573 + _739;
    float _743 = -_731;
    float _745 = _743 + 1.0;
    float _747 = fma(_733, _685, _735);
    float _749 = _717 * _695;
    float _751 = _621 * _745;
    float _753 = fma(_737, _655, _747);
    float _755 = fma(_749, _741, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _757 = fma(_755, _751, _753);
    float _759 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[119].x, _757);
    float _761 = _759 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _649;
    out.m_74.y = _651;
    out.m_74.z = _653;
    out.m_74.w = _761;
    bool _763 = !_657;
    float _765 = _655;
    float _783;
    if (!_763)
    {
        float _767 = in.m_70.x;
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _771 = _767 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[11].z, _153);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _783 = _781;
        _785 = true;
    }
    else
    {
        float _787 = float(_119);
        float _789 = 1.0 / _787;
        float _791 = _153 * _789;
        _783 = _791;
    }
    _785 = false;
    float _793 = _783;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _797 = _793 + _795;
    bool _799 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _801 = isnan(_793);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _813 = _793 + _811;
    bool _815 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _817 = isnan(_793);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _827;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _835 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _837 = isnan(_793);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = -_809;
    float _849 = _847 + 1.0;
    float _851 = 1.0 / _833;
    float _853 = _845 * _849;
    float _855 = -_845;
    float _857 = _855 + 1.0;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _859;
    bool _863 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _865 = 1.0 / _829;
    float _867 = _825 * _857;
    float _869 = -_825;
    float _871 = _869 + 1.0;
    float _873 = _797 * _865;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _875;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _879;
    float _883 = fma(_861, _873, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _885 = fma(_877, _873, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _887 = fma(_881, _873, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _889 = _813 * _851;
    float _891 = _883 * _867;
    float _893 = _885 * _867;
    float _895 = _887 * _867;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _903 = _901 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _909 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[123].x, _891);
    float _911 = fma(_899, _889, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _913 = fma(_903, _889, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _915 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[123].y, _893);
    float _917 = fma(_907, _889, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _919 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[123].z, _895);
    float _921 = fma(_911, _853, _909);
    float _923 = fma(_913, _853, _915);
    float _925 = fma(_917, _853, _919);
    float _927 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[125].x, _921);
    float _929 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[125].y, _923);
    float _931 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[125].z, _925);
    bool _933 = !_863;
    float _951;
    if (!_933)
    {
        float _935 = in.m_70.x;
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _939 = _935 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[11].w, _153);
        float _943 = _941 * _937;
        float _945 = floor(_943);
        float _947 = -_945;
        float _949 = _943 + _947;
        _951 = _949;
        _953 = true;
    }
    else
    {
        float _955 = float(_119);
        float _957 = 1.0 / _955;
        float _959 = _153 * _957;
        _951 = _959;
    }
    _953 = false;
    float _961 = _951;
    float _963 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _965 = int(_963);
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _969 = _961 + _967;
    float _971 = _927 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _975 = _973 != 0;
    bool _977 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _979 = isnan(_961);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    float _989 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _991 = int(_989);
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _997 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _999 = isnan(_961);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = float(_965);
    float _1011 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1013 = int(_1011);
    if (_975)
    {
        float _1015 = in.m_70.x;
        _765 = _1015;
    }
    float _1017 = _765;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1023 = _1017;
    if (!_975)
    {
        float _1025 = in.m_70.y;
        _1023 = _1025;
    }
    float _1027 = _1023;
    float _1029 = float(uint(_991));
    float _1031 = 1.0 / _1009;
    int _1033 = ~_991;
    int _1035 = _1033 + 1;
    int _1037 = ~_991;
    int _1039 = _1037 + 1;
    bool _1041 = _991 == 0;
    float _1043 = 1.0 / _1029;
    float _1045 = float(_1013);
    float _1047 = _1031 * _153;
    float _1049 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1051 = int(_1049);
    int _1053 = as_type<int>(_1043) + (-2);
    float _1055 = trunc(_1047);
    int _1057 = int(_1055);
    float _1059 = 1.0 / _1045;
    float _1061 = float(uint(_1051));
    int _1063 = ~_1051;
    int _1065 = _1063 + 1;
    float _1067 = float(uint(_1057));
    float _1069 = 1.0 / _1061;
    float _1071 = as_type<float>(_1053) * _1067;
    float _1073 = _1059 * _153;
    float _1075 = trunc(_1071);
    float _1077 = precise::max(_1075, 0.0);
    uint _1080 = uint(_1077);
    float _1082 = in.m_70.x;
    float _1084 = in.m_70.y;
    float _1086 = in.m_70.z;
    float _1088 = in.m_70.w;
    float _1090 = trunc(_1073);
    int _1092 = int(_1090);
    int _1094 = as_type<int>(_1069) + (-2);
    float _1096 = _1071;
    if (_975)
    {
        _1096 = 1.0;
    }
    float _1098 = _1096;
    float _1100 = _1098;
    if (!_975)
    {
        _1100 = 1.2345600128173828125;
    }
    float _1102 = _1100;
    int _1104 = _1035 * int(_1080);
    int _1106 = _1104 + _1057;
    float _1108 = 1.0 / _995;
    float _1110 = _1027 * _1102;
    float _1112 = float(uint(_1106));
    float _1114 = as_type<float>(_1106);
    if (_975)
    {
        _1114 = 1.0;
    }
    float _1116 = _1114;
    float _1118 = float(uint(_1092));
    float _1120 = as_type<float>(_1053) * _1112;
    float _1122 = _1116;
    if (!_975)
    {
        _1122 = 7.345489978790283203125;
    }
    float _1124 = _1122;
    float _1126 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1128 = ~_1051;
    int _1130 = _1128 + 1;
    float _1132 = as_type<float>(_1094) * _1118;
    float _1134 = trunc(_1120);
    float _1136 = precise::max(_1134, 0.0);
    uint _1138 = uint(_1136);
    float _1140 = _1124 * _1082;
    float _1142 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1144 = trunc(_1132);
    float _1146 = precise::max(_1144, 0.0);
    uint _1148 = uint(_1146);
    float _1150 = floor(_1140);
    int _1152 = int(_1080) + int(_1138);
    float _1154 = float(_119);
    float _1156 = float(_991);
    int _1158 = _1130 * int(_1148);
    int _1160 = _1158 + _1092;
    float _1162 = 1.0 / _1154;
    float _1164 = float(uint(_1160));
    float _1166 = -_1150;
    float _1168 = _1140 + _1166;
    float _1170 = floor(_1110);
    float _1172 = as_type<float>(_1094) * _1164;
    int _1174 = _1039 * _1152;
    int _1176 = _1174 + _1057;
    float _1178 = _1168 * _1156;
    float _1180 = float(_1051);
    float _1182 = trunc(_1172);
    float _1184 = precise::max(_1182, 0.0);
    uint _1186 = uint(_1184);
    bool _1188 = uint(_1176) >= uint(_991);
    float _1190 = float(_1057);
    bool _1192 = _1190 >= _1156;
    bool _1194 = isnan(_1190);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan(_1156);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = trunc(_1178);
    int _1206 = int(_1204);
    float _1208 = -_1170;
    float _1210 = _1110 + _1208;
    bool _1212 = !_1188;
    int _1214 = _1212 ? 0 : (-1);
    float _1216 = _1162 * _153;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1220 = _1218 != 0;
    int _1222 = ~_1152;
    int _1224 = _1222 + _1214;
    int _1226 = _1224 + 1;
    float _1228 = _1156 * _1216;
    float _1230 = trunc(_1202);
    int _1232 = int(_1230);
    bool _1234 = !_1220;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = float(_1092);
    int _1240 = abs(_1236);
    float _1242 = _1180 * _1216;
    bool _1244 = _1238 >= _1180;
    bool _1246 = isnan(_1238);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(_1180);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    float _1256 = _1210 * _1180;
    int _1258 = int(_1148) + int(_1186);
    int _1260 = _1206 * _1240;
    int _1262 = _1260 + _1057;
    int _1264 = _991 * _1226;
    int _1266 = _1264 + _1057;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1270 = _1268 != 0;
    float _1272 = trunc(_1256);
    int _1274 = int(_1272);
    int _1276 = ~_1232;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    bool _1282 = !_1041;
    int _1284 = _1282 ? _1266 : (-1);
    int _1286 = _1065 * _1258;
    int _1288 = _1286 + _1092;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1292 = _1290 != 0;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1296 = _1294 != 0;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1300 = _1298 != 0;
    float _1302 = trunc(_1228);
    int _1304 = int(_1302);
    int _1306 = _991 + (-1);
    int _1308 = _1284 * _1280;
    bool _1310 = uint(_1288) >= uint(_1051);
    bool _1312 = !_1296;
    int _1314 = _1312 ? 0 : 1;
    int _1316 = _1232 * _1306;
    int _1318 = _1316 + _1308;
    bool _1320 = !_1270;
    int _1322 = _1320 ? 0 : 1;
    float _1324 = trunc(_1254);
    int _1326 = int(_1324);
    int _1328 = abs(_1314);
    bool _1330 = !_1292;
    int _1332 = _1330 ? 0 : 1;
    bool _1334 = !_1310;
    int _1336 = _1334 ? 0 : (-1);
    int _1338 = _1318 * _1328;
    int _1340 = abs(_1322);
    float _1342 = trunc(_1242);
    int _1344 = int(_1342);
    int _1346 = abs(_1332);
    int _1348 = ~_1258;
    int _1350 = _1348 + _1336;
    int _1352 = _1350 + 1;
    int _1354 = _1274 * _1340;
    int _1356 = _1354 + _1092;
    bool _1358 = !_1300;
    int _1360 = _1358 ? 0 : 1;
    int _1362 = _1304 * _1346;
    int _1364 = _1362 + _1338;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1368 = _1366 != 0;
    int _1370 = _1051 * _1352;
    int _1372 = _1370 + _1092;
    int _1374 = abs(_1360);
    bool _1376 = _1051 == 0;
    bool _1378 = !_1368;
    int _1380 = _1378 ? 0 : 1;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1392 = _1390 != 0;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1396 = _1394 != 0;
    int _1398 = ~_1326;
    int _1400 = _1398 + 1;
    int _1402 = _1400 + 1;
    bool _1404 = !_1376;
    int _1406 = _1404 ? _1372 : (-1);
    int _1408 = abs(_1380);
    int _1410 = _1262 * _1374;
    int _1412 = _1410 + _1364;
    int _1414 = _1051 + (-1);
    int _1416 = _1406 * _1402;
    bool _1418 = !_1388;
    int _1420 = _1418 ? 0 : 1;
    int _1422 = _1326 * _1414;
    int _1424 = _1422 + _1416;
    int _1426 = abs(_1420);
    bool _1428 = !_1384;
    int _1430 = _1428 ? 0 : 1;
    int _1432 = _1206 * _1408;
    int _1434 = _1432 + _1412;
    bool _1436 = !_1392;
    int _1438 = _1436 ? 0 : 1;
    int _1440 = abs(_1430);
    bool _1442 = !_1396;
    int _1444 = _1442 ? 0 : 1;
    int _1446 = abs(_1438);
    int _1448 = _1424 * _1426;
    float _1450 = float(uint(_1434));
    int _1452 = abs(_1444);
    int _1454 = _1344 * _1440;
    int _1456 = _1454 + _1448;
    float _1458 = as_type<float>(_1053) * _1450;
    int _1460 = ~_1051;
    int _1462 = _1460 + 1;
    int _1464 = _1356 * _1446;
    int _1466 = _1464 + _1456;
    int _1468 = ~_991;
    int _1470 = _1468 + 1;
    float _1472 = trunc(_1458);
    float _1474 = precise::max(_1472, 0.0);
    uint _1476 = uint(_1474);
    bool _1478 = _991 == 0;
    int _1480 = _1274 * _1452;
    int _1482 = _1480 + _1466;
    int _1484 = ~_991;
    int _1486 = _1484 + 1;
    float _1488 = float(uint(_1482));
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1494 = as_type<float>(_1094) * _1488;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1498 = _1486 * int(_1476);
    int _1500 = _1498 + _1434;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1504 = trunc(_1494);
    float _1506 = precise::max(_1504, 0.0);
    uint _1508 = uint(_1506);
    float _1510 = fma(_1126, -2.0, _1496);
    float _1512 = -_1502;
    float _1514 = fma(_1142, 2.0, _1512);
    float _1516 = float(uint(_1500));
    float _1518 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1510);
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1520;
    float _1524 = 1.0 / _1492;
    float _1526 = as_type<float>(_1053) * _1516;
    float _1528 = -_153;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1514);
    float _1532 = trunc(_1526);
    float _1534 = precise::max(_1532, 0.0);
    uint _1536 = uint(_1534);
    int _1538 = _1462 * int(_1508);
    int _1540 = _1538 + _1482;
    float _1542 = float(uint(_1540));
    int _1544 = ~_1051;
    int _1546 = _1544 + 1;
    float _1548 = as_type<float>(_1094) * _1542;
    float _1550 = trunc(_1548);
    float _1552 = precise::max(_1550, 0.0);
    uint _1554 = uint(_1552);
    int _1556 = int(_1476) + int(_1536);
    int _1558 = _1470 * _1556;
    int _1560 = _1558 + _1434;
    bool _1562 = uint(_1560) >= uint(_991);
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1568 = !_1562;
    int _1570 = _1568 ? 0 : (-1);
    float _1572 = 1.0 / _1566;
    int _1574 = int(_1508) + int(_1554);
    int _1576 = ~_1556;
    int _1578 = _1576 + _1570;
    int _1580 = _1578 + 1;
    int _1582 = ~_1051;
    int _1584 = _1582 + 1;
    int _1586 = _1546 * _1574;
    int _1588 = _1586 + _1482;
    int _1590 = _991 * _1580;
    int _1592 = _1590 + _1434;
    bool _1594 = uint(_1588) >= uint(_1051);
    bool _1596 = !_1478;
    int _1598 = _1596 ? _1592 : (-1);
    bool _1600 = !_1594;
    int _1602 = _1600 ? 0 : (-1);
    float _1604 = _1522 * _1572;
    int _1606 = _1598 & 3;
    bool _1608 = _1606 != 0;
    int _1610 = _1598 & 3;
    bool _1612 = _1610 != 0;
    bool _1614 = uint(_1606) > 1u;
    int _1616 = ~_1574;
    int _1618 = _1616 + _1602;
    int _1620 = _1618 + 1;
    int _1622 = _1612 ? 0 : 1;
    bool _1624 = _1088 > 0.5;
    int _1626 = _1051 * _1620;
    int _1628 = _1626 + _1482;
    float _1630 = float(uint(_1262));
    bool _1632 = uint(_1606) >= 2u;
    bool _1634 = !_1376;
    int _1636 = _1634 ? _1628 : (-1);
    float _1638 = as_type<float>(_1053) * _1630;
    int _1640 = _1632 ? 0 : 1;
    bool _1642 = _1606 != 3;
    float _1644 = trunc(_1638);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    int _1650 = ~_1622;
    int _1652 = _1650 + 1;
    int _1654 = _1652 + 1;
    int _1656 = _1654;
    int _1658 = as_type<int>(_1638);
    if (!_1614)
    {
        int _1660 = ~_1622;
        int _1662 = _1660 + 1;
        _1656 = _1662;
    }
    int _1664 = _1656;
    float _1666 = -_211;
    int _1668 = _1624 ? as_type<int>(_1666) : as_type<int>(_211);
    int _1670 = _1636 & 3;
    bool _1672 = _1670 != 0;
    int _1674 = _1636 & 3;
    bool _1676 = _1674 != 0;
    float _1678 = float(uint(_1356));
    int _1680 = _1672 ? 0 : 1;
    bool _1682 = uint(_1674) > 1u;
    float _1684 = as_type<float>(_1094) * _1678;
    int _1686 = ~_1640;
    int _1688 = _1686 + 1;
    int _1690 = _1688 + 1;
    int _1692 = _1690;
    if (_1642)
    {
        int _1694 = ~_1640;
        int _1696 = _1694 + 1;
        _1692 = _1696;
    }
    int _1698 = _1692;
    float _1700 = trunc(_1684);
    float _1702 = precise::max(_1700, 0.0);
    uint _1704 = uint(_1702);
    int _1706 = ~_991;
    int _1708 = _1706 + 1;
    int _1710 = ~_1680;
    int _1712 = _1710 + 1;
    int _1714 = _1712 + 1;
    int _1716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1718 = _1716 != 0;
    int _1720 = _1708 * int(_1648);
    int _1722 = _1720 + _1262;
    bool _1724 = _1674 != 3;
    float _1726 = _1082 * 2.0;
    int _1728 = _1714;
    if (!_1682)
    {
        int _1730 = ~_1680;
        int _1732 = _1730 + 1;
        _1728 = _1732;
    }
    int _1734 = _1728;
    int _1736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1738 = _1736 != 0;
    float _1740 = float(uint(_1722));
    float _1742 = _1084 * 2.0;
    bool _1744 = !_1738;
    float _1746 = _1744 ? _211 : as_type<float>(_1668);
    float _1748 = floor(_1726);
    bool _1750 = uint(_1674) >= 2u;
    float _1752 = as_type<float>(_1053) * _1740;
    int _1754 = _1584 * int(_1704);
    int _1756 = _1754 + _1356;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1760 = _1758 != 0;
    int _1762 = _1750 ? 0 : 1;
    float _1764 = floor(_1742);
    bool _1766 = !_1760;
    int _1768 = _1766 ? 0 : 1;
    int _1770 = ~_1762;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    float _1776 = float(uint(_1756));
    bool _1778 = _1082 > 0.5;
    float _1780 = trunc(_1752);
    float _1782 = precise::max(_1780, 0.0);
    uint _1784 = uint(_1782);
    int _1786 = _1774;
    float _1788 = _1752;
    if (_1724)
    {
        int _1790 = ~_1762;
        int _1792 = _1790 + 1;
        _1786 = _1792;
    }
    int _1794 = _1786;
    bool _1796 = _1084 > 0.5;
    int _1798 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1800 = _1798 != 0;
    float _1802 = as_type<float>(_1094) * _1776;
    float _1804 = -_201;
    int _1806 = _1778 ? as_type<int>(_1804) : as_type<int>(_201);
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1810 = _1808 != 0;
    float _1812 = trunc(_1802);
    float _1814 = precise::max(_1812, 0.0);
    uint _1816 = uint(_1814);
    float _1818 = -_211;
    int _1820 = _1796 ? as_type<int>(_1818) : as_type<int>(_211);
    bool _1822 = !_1800;
    float _1824 = _1822 ? _201 : as_type<float>(_1806);
    bool _1826 = _1086 > 0.5;
    bool _1828 = !_1810;
    float _1830 = _1828 ? _211 : as_type<float>(_1820);
    bool _1832 = _1748 > 0.0;
    bool _1834 = _1748 >= 0.0;
    bool _1836 = isnan(_1748);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan(0.0);
    bool _1842 = _1838 || _1840;
    float _1844 = -_201;
    int _1846 = _1826 ? as_type<int>(_1844) : as_type<int>(_201);
    float _1848 = _1802;
    if (_1718)
    {
        _1658 = 0;
    }
    int _1850 = _1658;
    bool _1852 = _1764 >= 0.0;
    bool _1854 = isnan(_1764);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan(0.0);
    bool _1860 = _1856 || _1858;
    int _1862 = _1850;
    if (!_1718)
    {
        _1862 = 1;
    }
    int _1864 = _1862;
    int _1866 = _1842 ? 0 : 1;
    bool _1868 = _1764 > 0.0;
    int _1870 = ~_991;
    int _1872 = _1870 + 1;
    int _1874 = _1860 ? 0 : 1;
    bool _1876 = _1864 != 1;
    int _1878 = int(_1648) + int(_1784);
    int _1880 = ~_1866;
    int _1882 = _1880 + 1;
    int _1884 = _1882 + 1;
    int _1886 = _1884;
    if (!_1832)
    {
        int _1888 = ~_1866;
        int _1890 = _1888 + 1;
        _1886 = _1890;
    }
    int _1892 = _1886;
    int _1894 = _1872 * _1878;
    int _1896 = _1894 + _1262;
    int _1898 = int(_1704) + int(_1816);
    int _1900 = ~_1051;
    int _1902 = _1900 + 1;
    int _1904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1906 = _1904 != 0;
    float _1908 = as_type<float>(_1816);
    float _1910 = as_type<float>(_1896);
    if (!_1876)
    {
        _1848 = _1084;
    }
    float _1912 = _1848;
    int _1914 = _1902 * _1898;
    int _1916 = _1914 + _1356;
    bool _1918 = !_1906;
    float _1920 = _1918 ? _201 : as_type<float>(_1846);
    bool _1922 = uint(_1896) >= uint(_991);
    float _1924 = _1912;
    if (!_1876)
    {
        _1908 = _1084;
    }
    float _1926 = _1908;
    float _1928 = _1920 + 0.5;
    float _1930 = _1926;
    if (!_1876)
    {
        _1788 = _1086;
    }
    float _1932 = _1788;
    float _1934 = _1932;
    if (!_1876)
    {
        _1910 = _1086;
    }
    float _1936 = _1910;
    int _1938 = ~_1874;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    float _1944 = _1936;
    int _1946 = _1942;
    if (_1876)
    {
        _1924 = _1082;
    }
    float _1948 = _1924;
    if (_1876)
    {
        _1930 = _1082;
    }
    float _1950 = _1930;
    if (_1876)
    {
        _1934 = _1084;
    }
    float _1952 = _1934;
    if (_1876)
    {
        _1944 = _1084;
    }
    float _1954 = _1944;
    if (!_1868)
    {
        int _1956 = ~_1874;
        int _1958 = _1956 + 1;
        _1946 = _1958;
    }
    int _1960 = _1946;
    bool _1962 = uint(_1916) >= uint(_1051);
    float _1964 = in.m_58.x;
    float _1966 = in.m_58.y;
    float _1968 = in.m_58.z;
    bool _1970 = !_1922;
    int _1972 = _1970 ? 0 : (-1);
    int _1974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1976 = _1974 != 0;
    int _1978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1980 = _1978 != 0;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1984 = _1982 != 0;
    float _1986 = _1086 * 2.0;
    bool _1988 = !_1962;
    int _1990 = _1988 ? 0 : (-1);
    int _1992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1994 = _1992 != 0;
    float _1996 = floor(_1986);
    bool _1998 = !_1980;
    int _2000 = _1998 ? 0 : 1;
    int _2002 = ~_1898;
    int _2004 = _2002 + _1990;
    int _2006 = _2004 + 1;
    float _2008 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2008;
    float _2012 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2014 = _2012 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2016 = ~_1878;
    int _2018 = _2016 + _1972;
    int _2020 = _2018 + 1;
    float _2022 = _2010 * _1524;
    float _2024 = _2014 * _1108;
    float _2026 = _1086 + _1084;
    float _2028 = fma(_2022, _969, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2030 = _1051 * _2006;
    int _2032 = _2030 + _1356;
    float _2034 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2036 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2038 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _2040 = _1996 >= 0.0;
    bool _2042 = isnan(_1996);
    bool _2044 = _2040 || _2042;
    bool _2046 = isnan(0.0);
    bool _2048 = _2044 || _2046;
    float _2050 = fma(_1964, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2034);
    float _2052 = fma(_1964, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2036);
    float _2054 = fma(_1964, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2038);
    float _2056 = _1082 + _1084;
    float _2058 = _2026 + (-1.0);
    float _2060 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2050);
    bool _2062 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2064 = isnan(_961);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2070 = _2066 || _2068;
    float _2072 = float(_2070);
    float _2074 = _2056 + (-1.0);
    float _2076 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2078 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2054);
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2082 = _961 + _2080;
    float _2084 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2086 = -_2072;
    float _2088 = _2086 + 1.0;
    int _2090 = _2048 ? 0 : 1;
    float _2092 = _2060 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2094 = _1996 > 0.0;
    float _2096 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2052);
    float _2098 = _987 * _2088;
    float _2100 = -_987;
    float _2102 = _2100 + 1.0;
    bool _2104 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2106 = isnan(_961);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    float _2116 = _2096 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2118 = !_1976;
    int _2120 = _2118 ? 0 : 1;
    float _2122 = _1007 * _2102;
    float _2124 = -_1007;
    float _2126 = _2124 + 1.0;
    float _2128 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2130 = _961 + _2128;
    float _2132 = fma(_2024, _2082, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2134 = _1830 + (-0.5);
    float _2136 = _2114 * _2126;
    float _2138 = _1824 + 0.5;
    float _2140 = fma(_1604, _2130, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2142 = -_2114;
    float _2144 = _2142 + 1.0;
    float _2146 = _2028 * _2136;
    float _2148 = fma(_2138, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1530);
    float _2150 = -_2134;
    float _2152 = -_1518;
    float _2154 = fma(_2150, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2152);
    float _2156 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2158 = log2(_2156);
    float _2160 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2146);
    int _2162 = ~_2090;
    int _2164 = _2162 + 1;
    int _2166 = _2164 + 1;
    float _2168 = _2078 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2170 = _2166;
    float _2172 = _2116;
    if (!_2094)
    {
        int _2174 = ~_2090;
        int _2176 = _2174 + 1;
        _2170 = _2176;
    }
    int _2178 = _2170;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2182 = fma(_2132, _2122, _2160);
    float _2184 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2186 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2180);
    int _2188 = abs(_2120);
    float _2190 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2192 = fma(_2184, -2.0, _1019);
    int _2194 = abs(_2000);
    float _2196 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2198 = float(_2188);
    float _2200 = fma(_2140, _2098, _2182);
    float _2202 = float(_2178);
    float _2204 = _2158 * _153;
    float _2206 = float(_1892);
    float _2208 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2196);
    float _2210 = float(_2194);
    float _2212 = _2198 * _2202;
    int _2214 = _1598 >> 31;
    float _2216 = exp2(_2204);
    int _2218 = _1636 >> 31;
    float _2220 = _2210 * _2206;
    int _2222 = _2214 & 3;
    float _2224 = -_1021;
    float _2226 = fma(_2190, 2.0, _2224);
    int _2228 = _2218 & 3;
    float _2230 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2232 = _2092 + _2230;
    int _2234 = _1598 + _2222;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2238 = _2116 + _2236;
    int _2240 = _1636 + _2228;
    float _2242 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2246 = _2168 + _2244;
    float _2248 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2242);
    float _2250 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2252 = _2234 >> 2;
    float _2254 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2256 = -_2216;
    float _2258 = _2256 + 1.0;
    float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2262 = 1.0 + _2260;
    int _2264 = _2252 << 4;
    int _2266 = _2264 + 368;
    float _2268 = fma(_2072, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2200);
    int _2270 = _2240 >> 2;
    float _2272 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2248);
    bool _2274 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2276 = isnan(0.0);
    bool _2278 = _2274 || _2276;
    bool _2280 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2282 = _2278 || _2280;
    float _2284 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2250);
    float _2286 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2254);
    float _2288 = 1.0 / _2262;
    uint _2290 = uint(int(uint(_2266) >> uint(2)));
    uint _2292 = uint(int(uint(int(_2290)) >> uint(2)));
    int _2294 = int(_2290) & 3;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[int(_2292)][_2294];
    int _2298 = int(_2290) + 1;
    uint _2300 = uint(int(uint(_2298) >> uint(2)));
    int _2302 = _2298 & 3;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[int(_2300)][_2302];
    int _2306 = _2270 << 4;
    int _2308 = _2306 + 512;
    float _2310 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2286);
    float _2312 = _2282 ? _2258 : 0.0;
    float _2314 = -_153;
    float _2316 = fma(_2314, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2226);
    bool _2318 = !_1608;
    int _2320 = _2318 ? 0 : 1;
    float _2322 = _1746 + (-0.5);
    bool _2324 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2326 = isnan(1.0);
    bool _2328 = _2324 || _2326;
    bool _2330 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2332 = _2328 || _2330;
    int _2334 = _2266 + 8;
    uint _2336 = uint(int(uint(_2334) >> uint(2)));
    uint _2338 = uint(int(uint(int(_2336)) >> uint(2)));
    int _2340 = int(_2336) & 3;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[int(_2338)][_2340];
    int _2344 = int(_2336) + 1;
    uint _2346 = uint(int(uint(_2344) >> uint(2)));
    int _2348 = _2344 & 3;
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[int(_2346)][_2348];
    bool _2352 = _2272 >= 0.0;
    float _2354 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2192);
    float _2356 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2284);
    float _2358 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2186);
    float _2360 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2208);
    float _2362 = -_2322;
    float _2364 = -_2354;
    float _2366 = fma(_2362, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2364);
    float _2368 = _2212 * (-2.0);
    uint _2370 = uint(int(uint(_2308) >> uint(2)));
    uint _2372 = uint(int(uint(int(_2370)) >> uint(2)));
    int _2374 = int(_2370) & 3;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[int(_2372)][_2374];
    int _2378 = int(_2370) + 1;
    uint _2380 = uint(int(uint(_2378) >> uint(2)));
    int _2382 = _2378 & 3;
    float _2384 = (*spvDescriptorSet0.vp_c9)._m0[int(_2380)][_2382];
    float _2386 = _929 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2388 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2390 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_2332)
    {
        float _2392 = _2312 * _2288;
        _155 = _2392;
    }
    float _2394 = _155;
    float _2396 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2316);
    float _2398 = _931 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2400 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2402 = !_1676;
    int _2404 = _2402 ? 0 : 1;
    int _2406 = _991 * _2020;
    int _2408 = _2406 + _1262;
    float _2410 = _2398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2412 = _2220 * (-2.0);
    int _2414 = abs(_1664);
    int _2416 = _2308 + 8;
    uint _2418 = uint(int(uint(_2416) >> uint(2)));
    uint _2420 = uint(int(uint(int(_2418)) >> uint(2)));
    int _2422 = int(_2418) & 3;
    float _2424 = (*spvDescriptorSet0.vp_c9)._m0[int(_2420)][_2422];
    int _2426 = int(_2418) + 1;
    uint _2428 = uint(int(uint(_2426) >> uint(2)));
    int _2430 = _2426 & 3;
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[int(_2428)][_2430];
    int _2434 = abs(_2320);
    out.m_76.x = _2388;
    out.m_76.y = _2400;
    out.m_76.z = _2410;
    out.m_76.w = _2390;
    int _2436 = abs(_1734);
    float _2438 = fma(_2084, _2368, _2084);
    int _2440 = abs(_2404);
    float _2442 = in.m_78.x;
    float _2444 = in.m_78.y;
    float _2446 = in.m_78.z;
    float _2448 = fma(_2076, _2412, _2076);
    bool _2450 = _1606 != 3;
    if (_2352)
    {
        out.m_61.x = 0.0;
    }
    int _2452 = abs(_1794);
    bool _2454 = _991 == 0;
    bool _2456 = _1051 == 0;
    int _2458 = ~_2414;
    int _2460 = _2458 + 1;
    int _2462 = _2460 + 1;
    int _2464 = ~_2434;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    int _2470 = ~_2436;
    int _2472 = _2470 + 1;
    int _2474 = _2472 + 1;
    int _2476 = _2462 * as_type<int>(_2304);
    int _2478 = abs(_1698);
    int _2480 = _2468 * as_type<int>(_2296);
    int _2482 = _2480 + _2476;
    int _2484 = ~_2440;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    float _2490 = fma(_2368, _2442, _2442);
    bool _2492 = !_1994;
    int _2494 = _2492 ? 0 : 1;
    float _2496 = fma(_2412, _2444, _2444);
    bool _2498 = _1674 != 3;
    int _2500 = _2474 * as_type<int>(_2384);
    int _2502 = ~_2478;
    int _2504 = _2502 + 1;
    int _2506 = _2504 + 1;
    int _2508 = abs(_2494);
    int _2510 = _2488 * as_type<int>(_2376);
    int _2512 = _2510 + _2500;
    bool _2514 = !_2498;
    int _2516 = _2514 ? 0 : (-1);
    int _2518 = _2506 * as_type<int>(_2342);
    int _2520 = _2518 + _2482;
    bool _2522 = !_2450;
    int _2524 = _2522 ? 0 : (-1);
    int _2526 = abs(_2516);
    int _2528 = abs(_2524);
    int _2530 = ~_2452;
    int _2532 = _2530 + 1;
    int _2534 = _2532 + 1;
    int _2536 = ~_2528;
    int _2538 = _2536 + 1;
    int _2540 = _2538 + 1;
    int _2542 = abs(_1768);
    int _2544 = _2534 * as_type<int>(_2424);
    int _2546 = _2544 + _2512;
    int _2548 = ~_2526;
    int _2550 = _2548 + 1;
    int _2552 = _2550 + 1;
    int _2554 = _2540 * as_type<int>(_2350);
    int _2556 = _2554 + _2520;
    int _2558 = ~_2542;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    int _2564 = ~_2508;
    int _2566 = _2564 + 1;
    int _2568 = _2566 + 1;
    int _2570 = _2552 * as_type<int>(_2432);
    int _2572 = _2570 + _2546;
    bool _2574 = !_2454;
    int _2576 = _2574 ? _2408 : (-1);
    int _2578 = _2556 * _2562;
    bool _2580 = !_2456;
    int _2582 = _2580 ? _2032 : (-1);
    int _2584 = _2572 * _2568;
    float _2586 = _2232 * _2232;
    int _2588 = _2576 * _2542;
    int _2590 = _2588 + _2578;
    float _2592 = as_type<float>(_2526);
    if (_2352)
    {
        _2592 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2594 = _2592;
    int _2596 = _2582 * _2508;
    int _2598 = _2596 + _2584;
    float _2600 = fma(_2238, _2238, _2586);
    float _2602 = -_2356;
    float _2604 = _2602 + 1.0;
    float _2606 = -_2310;
    float _2608 = _2606 + 1.0;
    float _2610 = -_2358;
    float _2612 = _2610 + 1.0;
    float _2614 = fma(_2246, _2246, _2600);
    float _2616 = -_2360;
    float _2618 = _2616 + 1.0;
    float _2620 = _1082 + (-0.5);
    float _2622 = -_2604;
    float _2624 = fma(_1824, _2622, _2148);
    float _2626 = fma(_1830, _2608, _2154);
    float _2628 = -_2612;
    float _2630 = fma(_1920, _2628, _2396);
    float _2632 = rsqrt(_2614);
    float _2634 = fma(_1746, _2618, _2366);
    int _2636 = as_type<int>(_2594);
    if (_2352)
    {
        float _2638 = _2594 * 5.0;
        _2636 = as_type<int>(_2638);
    }
    int _2640 = _2636;
    float _2642 = float(_2590);
    float _2644 = fma(_2620, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2490);
    float _2646 = float(_2598);
    out.m_80.x = _2624;
    out.m_80.y = _2626;
    out.m_80.z = _2630;
    out.m_80.w = _2634;
    bool _2648 = !_1984;
    int _2650 = _2648 ? 0 : 1;
    float _2652 = fma(_2438, _2394, _2644);
    float _2654 = _1084 + (-0.5);
    if (_2352)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8514 = as_type<float>(_2640);
        out.gl_Position.z = _8514;
    }
    int _2656 = abs(_2650);
    out.m_82.x = _2642;
    out.m_82.y = _2646;
    float _2658 = _2232 * _2632;
    float _2660 = _2238 * _2632;
    int _2662 = as_type<int>(_2660);
    if (_2352)
    {
        return out;
    }
    float _2664 = -_2658;
    float _2666 = fma(_2664, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2092);
    float _2668 = _2246 * _2632;
    float _2670 = -_2660;
    float _2672 = fma(_2670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2116);
    float _2674 = float(_1960);
    float _2676 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2678 = _2666 + _2676;
    float _2680 = -_2668;
    float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2168);
    float _2684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2686 = _2672 + _2684;
    float _2688 = -_2658;
    float _2690 = fma(_2688, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2232);
    float _2692 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2694 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2696 = _2682 + _2694;
    float _2698 = float(_2656);
    float _2700 = fma(_2654, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2496);
    float _2702 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2692);
    float _2704 = -_2660;
    float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2238);
    float _2708 = _2690 * _2690;
    float _2710 = _2698 * _2674;
    float _2712 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2702);
    float _2714 = _1086 + _1082;
    float _2716 = fma(_2448, _2394, _2700);
    float _2718 = fma(_2706, _2706, _2708);
    float _2720 = -_2668;
    float _2722 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2246);
    bool _2724 = _2712 >= 0.0;
    float _2726 = _2714 + (-1.0);
    float _2728 = _2710 * (-2.0);
    float _2730 = _2652 * 0.15915493667125701904296875;
    float _2732 = _2716 * 0.15915493667125701904296875;
    float _2734 = fma(_2722, _2722, _2718);
    float _2736 = fma(_2726, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2738 = _1086 + (-0.5);
    float _2740 = fma(_2728, _2446, _2446);
    float _2742 = _2730 * 6.283185482025146484375;
    float _2744 = sin(_2742);
    float _2746 = fma(_2736, _2728, _2736);
    float _2748 = _2692;
    int _2750 = as_type<int>(_2738);
    int _2752 = as_type<int>(_2668);
    if (_2724)
    {
        _2748 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2754 = _2748;
    float _2756 = fma(_2738, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2740);
    if (_2724)
    {
        out.m_61.x = 0.0;
    }
    float _2758 = _2730 * 6.283185482025146484375;
    float _2760 = cos(_2758);
    if (_2724)
    {
        float _2762 = _2754 * 5.0;
        _2750 = as_type<int>(_2762);
    }
    int _2764 = _2750;
    float _2766 = fma(_2746, _2394, _2756);
    if (_2724)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8715 = as_type<float>(_2764);
        out.gl_Position.z = _8715;
    }
    float _2768 = _2766 * 0.15915493667125701904296875;
    float _2770 = _2732 * 6.283185482025146484375;
    float _2772 = sin(_2770);
    float _2774 = sqrt(_2734);
    float _2776 = _2732 * 6.283185482025146484375;
    float _2778 = cos(_2776);
    if (_2724)
    {
        return out;
    }
    float _2780 = _2768 * 6.283185482025146484375;
    float _2782 = cos(_2780);
    float _2784 = _2632 * _2774;
    float _2786 = _455 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _2790 = _475 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2792 = _2760 * _2778;
    float _2794 = _2784 * _2786;
    float _2796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _2798 = _2768 * 6.283185482025146484375;
    float _2800 = sin(_2798);
    float _2802 = _2784 * _2790;
    float _2804 = _2788 * _2794;
    float _2806 = _2744 * _2772;
    float _2808 = _2760 * _2772;
    float _2810 = _2744 * _2778;
    float _2812 = _2796 * _2802;
    float _2814 = _2760 * _2782;
    float _2816 = _2778 * _2782;
    float _2818 = _2744 * _2782;
    float _2820 = _2772 * _2782;
    float _2822 = _2814 * _2804;
    float _2824 = _2784 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2826 = _2824 * 0.5;
    float _2828 = _2818 * _2804;
    float _2830 = fma(_2800, _2792, _2806);
    float _2832 = -_2810;
    float _2834 = fma(_2800, _2808, _2832);
    float _2836 = -_2804;
    float _2838 = _2800 * _2836;
    float _2840 = -_2808;
    float _2842 = fma(_2800, _2810, _2840);
    float _2844 = fma(_2830, _2812, _2822);
    float _2846 = _2830 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2848 = fma(_2816, _2812, _2838);
    float _2850 = _2830 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2852 = fma(_2834, _2826, _2844);
    float _2854 = fma(_2800, _2806, _2792);
    float _2856 = fma(_2842, _2812, _2828);
    float _2858 = fma(_2820, _2826, _2848);
    float _2860 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2862 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2864 = fma(_2854, _2826, _2856);
    float _2866 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2868 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2860);
    float _2870 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2862);
    float _2872 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2874 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2866);
    float _2876 = fma(_2864, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2868);
    float _2878 = fma(_2864, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2870);
    float _2880 = fma(_2872, _2872, 1.0);
    float _2882 = fma(_2864, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2874);
    float _2884 = _2876 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2886 = _2878 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2888 = _2830 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2890 = _2834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2892 = _2116 + _2884;
    float _2894 = _2168 + _2886;
    float _2896 = rsqrt(_2880);
    float _2898 = _2834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2902 = _2892 + _2900;
    float _2904 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2906 = _2894 + _2904;
    float _2908 = _2834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2910 = _2882 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2912 = _2902 * _2902;
    float _2914 = _2906 * _2906;
    float _2916 = fma(_2816, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2888);
    float _2918 = fma(_2816, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2850);
    float _2920 = fma(_2816, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2846);
    float _2922 = _2912 + _2914;
    float _2924 = _2814 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2926 = _2814 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2928 = _2814 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2930 = sqrt(_2922);
    float _2932 = _2092 + _2910;
    float _2934 = -_2800;
    float _2936 = fma(_2934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2924);
    float _2938 = -_2800;
    float _2940 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2926);
    float _2942 = -_2800;
    float _2944 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2928);
    float _2946 = fma(_2820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2890);
    float _2948 = fma(_2820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2898);
    float _2950 = fma(_2820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2908);
    bool _2952 = _2930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2954 = _2910;
    float _2956 = _2820;
    float _2958 = _2890;
    float _2960 = _2924;
    float _2962 = _2926;
    float _2964 = _2932;
    if (!_2952)
    {
        _2954 = _2914;
    }
    float _2966 = _2954;
    float _2968 = _2966;
    if (!_2952)
    {
        _2956 = _2912;
    }
    float _2970 = _2956;
    float _2972 = _2970;
    if (!_2952)
    {
        _2958 = _2892;
    }
    float _2974 = _2958;
    float _2976 = _2974;
    if (!_2952)
    {
        _2960 = _2894;
    }
    float _2978 = _2960;
    float _2980 = _2978;
    if (!_2952)
    {
        _2962 = _2932;
    }
    float _2982 = _2962;
    bool _2984 = !_2952;
    float _2986 = _2982;
    if (!_2984)
    {
        float _2988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2992 = _2930 + _2990;
        float _2994 = rsqrt(_2922);
        float _2996 = _2992 * _2988;
        float _2998 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3000 = _2996 * 0.15915493667125701904296875;
        float _3002 = _3000 * 6.283185482025146484375;
        float _3004 = sin(_3002);
        float _3006 = _3000 * 6.283185482025146484375;
        float _3008 = cos(_3006);
        float _3010 = fma(_3004, _2998, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3012 = _2994 * _3010;
        float _3014 = _3008 + (-1.0);
        float _3016 = fma(_2902, _3012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3018 = fma(_2906, _3012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3020 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3022 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3024 = _3016 + _3022;
        float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3028 = _3018 + _3026;
        float _3030 = fma(_2932, _3008, _3020);
        float _3032 = _3024 * _3024;
        float _3034 = _3028 * _3028;
        _2986 = _3030;
        _2972 = _3032;
        _2968 = _3034;
        _2976 = _3016;
        _2980 = _3018;
    }
    float _3036 = _2986;
    float _3038 = _2972;
    float _3040 = _2968;
    float _3042 = _2976;
    float _3044 = _2980;
    float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3048 = _3036 + _3046;
    float _3050 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2936);
    float _3052 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2940);
    float _3054 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2944);
    float _3056 = fma(_3048, _3048, _3038);
    float _3058 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2946);
    float _3060 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2948);
    float _3062 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2950);
    float _3064 = _3056 + _3040;
    float _3066 = _2872 * _2896;
    float _3068 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2916);
    float _3070 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2918);
    float _3072 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3074 = _2872 * _3050;
    float _3076 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2920);
    float _3078 = _2872 * _3052;
    float _3080 = _2872 * _3054;
    float _3082 = -_3058;
    float _3084 = _3066 * _3082;
    float _3086 = -_3060;
    float _3088 = _3066 * _3086;
    float _3090 = -_3062;
    float _3092 = _3066 * _3090;
    float _3094 = sqrt(_3064);
    float _3096 = fma(_3072, _3068, _3074);
    float _3098 = fma(_3072, _3070, _3078);
    float _3100 = fma(_3072, _3076, _3080);
    float _3102 = fma(_2896, _3050, _3084);
    float _3104 = _3058 + _3096;
    float _3106 = fma(_2896, _3052, _3088);
    float _3108 = fma(_2896, _3054, _3092);
    float _3110 = _3060 + _3098;
    float _3112 = _3062 + _3100;
    out.m_84.x = _3068;
    out.m_84.y = _3070;
    out.m_84.z = _3076;
    out.m_86.x = _3102;
    out.m_86.y = _3106;
    out.m_86.z = _3108;
    bool _3114 = _3094 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3116 = isnan(_3094);
    bool _3118 = _3114 || _3116;
    bool _3120 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3122 = _3118 || _3120;
    out.m_88.x = _3104;
    out.m_88.y = _3110;
    out.m_88.z = _3112;
    if (!_3122)
    {
        _2964 = 1.0;
    }
    float _3124 = _2964;
    bool _3126 = !_3122;
    float _3128 = _3124;
    if (!_3126)
    {
        bool _3130 = _3094 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3132 = isnan(_3094);
        bool _3134 = _3130 || _3132;
        bool _3136 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3138 = _3134 || _3136;
        if (!_3138)
        {
            float _3140 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3142 = _3094 + _3140;
            float _3144 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3146 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3144;
            float _3148 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3150 = _3148 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3152 = 1.0 / _3146;
            float _3154 = _3142 * _3152;
            float _3156 = fma(_3154, _3150, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3128 = _3156;
            _3158 = true;
        }
        else
        {
            bool _3160 = _3094 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3162 = isnan(_3094);
            bool _3164 = _3160 || _3162;
            bool _3166 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3168 = _3164 || _3166;
            if (!_3168)
            {
                float _3170 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3172 = _3094 + _3170;
                float _3174 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3176 = _3174 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3178 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3180 = _3178 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3182 = 1.0 / _3176;
                float _3184 = _3172 * _3182;
                float _3186 = fma(_3184, _3180, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3128 = _3186;
                _3158 = true;
            }
            else
            {
                _3128 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3158 = false;
    float _3188 = _3128;
    float _3190 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3192 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3194 = floor(_3190);
    float _3196 = floor(_3192);
    float _3198 = -_3194;
    float _3200 = _3190 + _3198;
    float _3202 = -_3196;
    float _3204 = _3192 + _3202;
    float2 _9482 = float2(_3200, _3204);
    float _3206 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9482, float2(0.0), isnan(_9482)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9482, float2(0.0), isnan(_9482)), level(0.0)).x;
    float _3208 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3210 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3212 = _3036 + _3210;
    float _3214 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3208);
    float _3216 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3218 = _3042 + _3216;
    float _3220 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _3222 = fma(_3212, _3188, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3224 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3214);
    float _3226 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3228 = _2666 + _3220;
    float _3230 = _3224 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3232 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3226);
    float _3234 = -_2092;
    float _3236 = _3234 + _3222;
    float _3238 = _3228 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3240 = 1.0 / _3230;
    float _3242 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3232);
    float _3244 = _3236 * _3236;
    float _3246 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3238);
    float _3248 = _3242 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3250 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3246);
    float _3252 = _3248 + _3230;
    float _3254 = _3250 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3256 = fma(_3218, _3188, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3258 = trunc(_3254);
    int _3260 = int(_3258);
    float _3262 = _3252 * _3240;
    float _3264 = _3262 * 0.5;
    float _3266 = -_2116;
    float _3268 = _3266 + _3256;
    float _3270 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3272 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3270);
    float _3274 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3276 = _3044 + _3274;
    float _3278 = fma(_3268, _3268, _3244);
    float _3280 = fma(_3276, _3188, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3282 = 1.0 / _3272;
    float _3284 = -_2168;
    float _3286 = _3284 + _3280;
    int _3288 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3290 = _3260 + _3288;
    int _3292 = _3290 + 1;
    float _3294 = fma(_3286, _3286, _3278);
    float _3296 = sqrt(_3294);
    float _3298 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3300 = _3282 * _3298;
    float _3302 = _3228 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _3304 = _3300 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3306 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3302);
    bool _3308 = _3300 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _3310 = !_3304;
    int _3312 = _3310 ? 0 : 1;
    float _3314 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3306);
    float _3316 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3318 = 2;
    float _3320 = _3280;
    float _3322 = _3222;
    float _3324 = _3254;
    float _3326 = _3228;
    if (!_3304)
    {
        _3318 = 1;
    }
    int _3328 = _3318;
    float _3330 = trunc(_3316);
    int _3332 = int(_3330);
    int _3334 = _3328;
    if (!_3308)
    {
        _3334 = _3312;
    }
    int _3336 = _3334;
    bool _3338 = _3292 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3340 = _3336 << 6;
    bool _3342 = _3296 > 0.0;
    int _3344 = _3340 + 96;
    uint _3346 = uint(int(uint(_3344) >> uint(2)));
    uint _3348 = uint(int(uint(int(_3346)) >> uint(2)));
    int _3350 = int(_3346) & 3;
    float _3352 = (*spvDescriptorSet0.vp_c15)._m0[int(_3348)][_3350];
    int _3354 = int(_3346) + 1;
    uint _3356 = uint(int(uint(_3354) >> uint(2)));
    int _3358 = _3354 & 3;
    float _3360 = (*spvDescriptorSet0.vp_c15)._m0[int(_3356)][_3358];
    int _3362 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3364 = _3332 + _3362;
    int _3366 = _3364 + 1;
    int _3368 = _3340 + 104;
    uint _3370 = uint(int(uint(_3368) >> uint(2)));
    uint _3372 = uint(int(uint(int(_3370)) >> uint(2)));
    int _3374 = int(_3370) & 3;
    float _3376 = (*spvDescriptorSet0.vp_c15)._m0[int(_3372)][_3374];
    int _3378 = int(_3370) + 1;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    int _3382 = _3378 & 3;
    float _3384 = (*spvDescriptorSet0.vp_c15)._m0[int(_3380)][_3382];
    int _3386 = _3292 | _3366;
    bool _3388 = _3386 < 0;
    bool _3390 = _3388 || _3338;
    int _3392 = _3340 + 48;
    uint _3394 = uint(int(uint(_3392) >> uint(2)));
    uint _3396 = uint(int(uint(int(_3394)) >> uint(2)));
    int _3398 = int(_3394) & 3;
    float _3400 = (*spvDescriptorSet0.vp_c15)._m0[int(_3396)][_3398];
    int _3402 = int(_3394) + 1;
    uint _3404 = uint(int(uint(_3402) >> uint(2)));
    int _3406 = _3402 & 3;
    float _3408 = (*spvDescriptorSet0.vp_c15)._m0[int(_3404)][_3406];
    bool _3410 = _3366 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3412 = _3410 || _3390;
    int _3414 = _3340 + 56;
    uint _3416 = uint(int(uint(_3414) >> uint(2)));
    uint _3418 = uint(int(uint(int(_3416)) >> uint(2)));
    int _3420 = int(_3416) & 3;
    float _3422 = (*spvDescriptorSet0.vp_c15)._m0[int(_3418)][_3420];
    int _3424 = int(_3416) + 1;
    uint _3426 = uint(int(uint(_3424) >> uint(2)));
    int _3428 = _3424 & 3;
    float _3430 = (*spvDescriptorSet0.vp_c15)._m0[int(_3426)][_3428];
    int _3432 = _3340 + 64;
    uint _3434 = uint(int(uint(_3432) >> uint(2)));
    uint _3436 = uint(int(uint(int(_3434)) >> uint(2)));
    int _3438 = int(_3434) & 3;
    float _3440 = (*spvDescriptorSet0.vp_c15)._m0[int(_3436)][_3438];
    int _3442 = int(_3434) + 1;
    uint _3444 = uint(int(uint(_3442) >> uint(2)));
    int _3446 = _3442 & 3;
    float _3448 = (*spvDescriptorSet0.vp_c15)._m0[int(_3444)][_3446];
    float _3450 = _3296;
    if (!_3412)
    {
        float _3452 = floor(_3254);
        _3450 = _3452;
    }
    float _3454 = _3450;
    int _3456 = _3340 + 72;
    uint _3458 = uint(int(uint(_3456) >> uint(2)));
    uint _3460 = uint(int(uint(int(_3458)) >> uint(2)));
    int _3462 = int(_3458) & 3;
    float _3464 = (*spvDescriptorSet0.vp_c15)._m0[int(_3460)][_3462];
    int _3466 = int(_3458) + 1;
    uint _3468 = uint(int(uint(_3466) >> uint(2)));
    int _3470 = _3466 & 3;
    float _3472 = (*spvDescriptorSet0.vp_c15)._m0[int(_3468)][_3470];
    int _3474 = _3340 + 80;
    uint _3476 = uint(int(uint(_3474) >> uint(2)));
    uint _3478 = uint(int(uint(int(_3476)) >> uint(2)));
    int _3480 = int(_3476) & 3;
    float _3482 = (*spvDescriptorSet0.vp_c15)._m0[int(_3478)][_3480];
    int _3484 = int(_3476) + 1;
    uint _3486 = uint(int(uint(_3484) >> uint(2)));
    int _3488 = _3484 & 3;
    float _3490 = (*spvDescriptorSet0.vp_c15)._m0[int(_3486)][_3488];
    float _3492 = _3228 * _3360;
    float _3494 = fma(_2672, _3352, _3492);
    bool _3496 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3498 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3500 = _3496 || _3498;
    bool _3502 = isnan(0.5);
    bool _3504 = _3500 || _3502;
    float _3506 = fma(_2682, _3376, _3494);
    float _3508 = _3376;
    if (!_3342)
    {
        _3508 = _3256;
    }
    float _3510 = _3508;
    float _3512 = _3228 * _3408;
    bool _3514 = !_3342;
    float _3516 = _3510;
    if (!_3514)
    {
        float _3518 = _215 * _215;
        float _3520 = fma(_213, _213, _3518);
        float _3522 = fma(_217, _217, _3520);
        float _3524 = rsqrt(_3294);
        float _3526 = sqrt(_3522);
        float _3528 = _3268 * _3524;
        float _3530 = _3236 * _3524;
        float _3532 = _3286 * _3524;
        bool _3534 = _3526 > 0.0;
        float _3536 = _3524;
        if (!_3534)
        {
            _3536 = _3256;
        }
        float _3538 = _3536;
        bool _3540 = !_3534;
        _3516 = _3538;
        if (!_3540)
        {
            float _3542 = rsqrt(_3522);
            float _3544 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3546 = _215 * _3542;
            float _3548 = _213 * _3542;
            float _3550 = _217 * _3542;
            float _3552 = _3530 * _3546;
            float _3554 = fma(_3528, _3548, _3552);
            float _3556 = _3544 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3558 = fma(_3532, _3550, _3554);
            float _3560 = _3558 * _3556;
            float _3562 = fma(_213, _3560, _3256);
            float _3564 = fma(_215, _3560, _3222);
            float _3566 = fma(_217, _3560, _3280);
            _3516 = _3562;
            _3320 = _3566;
            _3322 = _3564;
        }
    }
    float _3568 = _3516;
    float _3570 = _3320;
    float _3572 = _3322;
    float _3574 = fma(_2672, _3400, _3512);
    float _3576 = _3506 + _3384;
    if (!_3412)
    {
        int _3578 = _3366 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3580 = _3578 + _3292;
        _221 = _3580;
    }
    int _3582 = _221;
    float _3584 = _3228 * _3448;
    float _3586 = fma(_2682, _3422, _3574);
    float _3588 = -_2660;
    float _3590 = fma(_3588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3568);
    float _3592 = 1.0 / _3576;
    float _3594 = fma(_2672, _3440, _3584);
    float _3596 = _3590;
    if (!_3412)
    {
        int _3598 = _3582 << 2;
        _2662 = _3598;
    }
    int _3600 = _2662;
    float _3602 = -_2668;
    float _3604 = fma(_3602, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3570);
    float _3606 = -_2658;
    float _3608 = fma(_3606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3572);
    float _3610 = fma(_2682, _3464, _3594);
    int _3612 = _3600;
    float _3614 = _3608;
    float _3616 = _3604;
    if (!_3412)
    {
        uint _3618 = uint(int(uint(_3582) >> uint(2)));
        _2752 = int(_3618);
    }
    int _3620 = _2752;
    if (!_3412)
    {
        int _3622 = 12 & _3600;
        _3612 = _3622;
    }
    int _3624 = _3612;
    if (!_3504)
    {
        float _3626 = _2678 * _2678;
        float _3628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3630 = -_2092;
        float _3632 = _3630 + _3572;
        float _3634 = -_2168;
        float _3636 = _3634 + _3570;
        float _3638 = fma(_2686, _2686, _3626);
        float _3640 = fma(_2696, _2696, _3638);
        float _3642 = 1.0 / _2784;
        float _3644 = sqrt(_3640);
        float _3646 = precise::min(_3644, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3648 = _3646 * _3628;
        float _3650 = _3648 * _3642;
        float _3652 = -_2116;
        float _3654 = _3652 + _3568;
        float _3656 = fma(_3632, _3650, _2666);
        float _3658 = fma(_3654, _3650, _2672);
        float _3660 = fma(_3636, _3650, _2682);
        _3614 = _3656;
        _3596 = _3658;
        _3616 = _3660;
    }
    float _3662 = _3614;
    float _3664 = _3596;
    float _3666 = _3616;
    if (!_3412)
    {
        int _3668 = _3620 << 4;
        int _3670 = _3668 + _3624;
        _2172 = as_type<float>(_3670);
    }
    float _3672 = _2172;
    int _3674 = _3340 + 88;
    uint _3676 = uint(int(uint(_3674) >> uint(2)));
    uint _3678 = uint(int(uint(int(_3676)) >> uint(2)));
    int _3680 = int(_3676) & 3;
    float _3682 = (*spvDescriptorSet0.vp_c15)._m0[int(_3678)][_3680];
    int _3684 = int(_3676) + 1;
    uint _3686 = uint(int(uint(_3684) >> uint(2)));
    int _3688 = _3684 & 3;
    float _3690 = (*spvDescriptorSet0.vp_c15)._m0[int(_3686)][_3688];
    float _3692 = _3586 + _3430;
    float _3694 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3696 = _3610 + _3472;
    float _3698 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3700 = _3692 * _3592;
    float _3702 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3694);
    float _3704 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3706 = _3672;
    float _3708 = _3700;
    if (!_3412)
    {
        int _3710 = as_type<int>(_3672) + 400;
        uint _3712 = uint(int(uint(_3710) >> uint(2)));
        uint _3714 = uint(int(uint(int(_3712)) >> uint(2)));
        int _3716 = int(_3712) & 3;
        float _3718 = (*spvDescriptorSet0.vp_c15)._m0[int(_3714)][_3716];
        _3706 = _3718;
    }
    float _3720 = _3706;
    float _3722 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3698);
    float _3724 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3702);
    bool _3726 = _3700 >= 0.0;
    float _3728 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3704);
    float _3730 = _3696 * _3592;
    float _3732 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3734 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3722);
    float _3736 = _3724 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3738 = _3700 <= 1.0;
    bool _3740 = _3738 && _3726;
    float _3742 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3728);
    float _3744 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3732);
    float _3746 = _3734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3748 = _3736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3750 = _3730 >= 0.0;
    bool _3752 = _3750 && _3740;
    float _3754 = _3742 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3756 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3744);
    float _3758 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3748);
    bool _3760 = _3730 <= 1.0;
    bool _3762 = _3760 && _3752;
    float _3764 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3766 = _3754 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3768 = _3756 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3770 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3758);
    float _3772 = _3228 * _3490;
    float _3774 = -_3766;
    float _3776 = fma(_3774, _3764, 1.0);
    float _3778 = _3736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3780 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3770);
    float _3782 = _3736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3784 = log2(_3776);
    float _3786 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3778);
    float _3788 = fma(_2672, _3482, _3772);
    float _3790 = _3778;
    if (_3762)
    {
        float _3792 = float(_3336);
        _3790 = _3792;
    }
    float _3794 = _3790;
    float _3796 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3782);
    float _3798 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3786);
    if (!_3412)
    {
        float _3800 = -_3454;
        float _3802 = _3254 + _3800;
        _3324 = _3802;
    }
    float _3804 = _3324;
    float _3806 = 1.0 / _3780;
    float _3808 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3796);
    float _3810 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3798);
    float _3812 = fma(_2682, _3682, _3788);
    float _3814 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3808);
    float _3816 = _3568;
    if (!_3412)
    {
        float _3818 = floor(_3316);
        _3816 = _3818;
    }
    float _3820 = _3816;
    float _3822 = _3812 + _3690;
    float _3824 = _3784 * 0.693147182464599609375;
    float _3826 = _3822 * _3592;
    float _3828 = _3824 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3830 = _3794;
    float _3832 = _3824;
    if (_3762)
    {
        float _3834 = rint(_3794);
        float _3836 = precise::max(_3834, 0.0);
        uint _3838 = uint(_3836);
        uint _3840 = clamp(_3838, 0u, 65535u);
        _3830 = as_type<float>(_3840);
    }
    float _3842 = _3830;
    float _3844 = _3810 * _3806;
    float _3846 = _3814 * _3806;
    float _3848 = fma(_3844, 0.5, 0.5);
    float _3850 = fma(_3846, -0.5, 0.5);
    float _3852 = _3782;
    float _3854 = _3720;
    if (!_3412)
    {
        float _3856 = rint(_3720);
        float _3858 = precise::max(_3856, 0.0);
        uint _3860 = uint(_3858);
        uint _3862 = clamp(_3860, 0u, 65535u);
        _3852 = as_type<float>(_3862);
    }
    float _3864 = _3852;
    float _3866 = _3820;
    if (!_3412)
    {
        float _3868 = -_3820;
        float _3870 = _3316 + _3868;
        _3866 = _3870;
    }
    float _3872 = _3866;
    float _3874 = _3730;
    if (_3762)
    {
        float3 _10613 = float3(_3700, _3730, float(as_type<int>(_3842)));
        float3 _10617 = select(_10613, float3(0.0), isnan(_10613));
        float _3876 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _10617.xy, uint(rint(_10617.z)), _3826, level(0.0));
        _3874 = _3876;
    }
    float _3878 = _3874;
    float3 _10627 = float3(_3848, _3850, _3828);
    float _3880 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10627, float3(0.0), isnan(_10627)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10627, float3(0.0), isnan(_10627)), level(0.0)).x;
    float3 _10636 = float3(_3848, _3850, _3828);
    float4 _3883 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10636, float3(0.0), isnan(_10636)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10636, float3(0.0), isnan(_10636)), level(0.0)).xyzw;
    float _3885 = _3883.x;
    float _3887 = _3883.y;
    float _3889 = _3883.z;
    float _3891 = _3883.w;
    float _3893 = _3804;
    if (!_3412)
    {
        float3 _10659 = float3(_3804, _3872, float(as_type<int>(_3864)));
        float3 _10661 = select(_10659, float3(0.0), isnan(_10659));
        float _3895 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10661.xy, uint(rint(_10661.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10661.xy, uint(rint(_10661.z)), level(0.0)).x;
        _3893 = _3895;
    }
    float _3897 = _3893;
    if (_3412)
    {
        _3832 = 1.0;
    }
    float _3899 = _3832;
    float _3901 = _3897;
    float _3903 = _3899;
    float _3905 = _3887;
    float _3907 = _3885;
    if (!_3412)
    {
        int _3909 = _3582 << 4;
        int _3911 = _3909 + 2048;
        uint _3913 = uint(int(uint(_3911) >> uint(2)));
        uint _3915 = uint(int(uint(int(_3913)) >> uint(2)));
        int _3917 = int(_3913) & 3;
        float _3919 = (*spvDescriptorSet0.vp_c15)._m0[int(_3915)][_3917];
        int _3921 = int(_3913) + 1;
        uint _3923 = uint(int(uint(_3921) >> uint(2)));
        int _3925 = _3921 & 3;
        float _3927 = (*spvDescriptorSet0.vp_c15)._m0[int(_3923)][_3925];
        int _3929 = _3911 + 8;
        uint _3931 = uint(int(uint(_3929) >> uint(2)));
        uint _3933 = uint(int(uint(int(_3931)) >> uint(2)));
        int _3935 = int(_3931) & 3;
        float _3937 = (*spvDescriptorSet0.vp_c15)._m0[int(_3933)][_3935];
        int _3939 = int(_3931) + 1;
        uint _3941 = uint(int(uint(_3939) >> uint(2)));
        int _3943 = _3939 & 3;
        float _3945 = (*spvDescriptorSet0.vp_c15)._m0[int(_3941)][_3943];
        float _3947 = _3228 * _3927;
        float _3949 = fma(_2672, _3919, _3947);
        float _3951 = fma(_2682, _3937, _3949);
        float _3953 = _3951 + _3945;
        float _3955 = precise::clamp(_3953, 0.0, 1.0);
        float _3957 = -_3955;
        float _3959 = _3957 + _3897;
        float _3961 = fma(_3959, 500.0, 1.5);
        float _3963 = exp2(_3961);
        float _3965 = 0.0 + _3963;
        float _3967 = precise::clamp(_3965, 0.0, 1.0);
        _3901 = _3963;
        _3708 = _3927;
        _3854 = _3937;
        _3326 = _3955;
        _3903 = _3967;
    }
    float _3969 = _3901;
    float _3971 = _3708;
    float _3973 = _3854;
    float _3975 = _3326;
    float _3977 = _3903;
    float _3979 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3981 = _3662 + _3979;
    float _3983 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3985 = _3664 + _3983;
    float _3987 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3989 = _3666 + _3987;
    float _3991 = _3981 * _3981;
    float _3993 = fma(_3985, _3985, _3991);
    float _3995 = fma(_3989, _3989, _3993);
    float _3997 = rsqrt(_3995);
    float _3999 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4001 = _3985 * _3999;
    float _4003 = _3989 * _3999;
    float _4005 = _4001 * _4001;
    float _4007 = _4003 * _4003;
    float _4009 = _4005 + _4007;
    float _4011 = sqrt(_4009);
    bool _4013 = _4011 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4017 = _4011 + _4015;
    float _4019 = _3997;
    float _4021 = _3973;
    float _4023 = _4017;
    float _4025 = _3969;
    float _4027 = _3981;
    float _4029 = _3975;
    float _4031 = _3999;
    if (_4013)
    {
        float _4033 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4019 = _4033;
    }
    float _4035 = _4019;
    if (_4013)
    {
        float _4037 = rsqrt(_4009);
        _4021 = _4037;
    }
    float _4039 = _4021;
    float _4041 = _4039;
    if (_4013)
    {
        float _4043 = _4017 * _4035;
        _4023 = _4043;
    }
    float _4045 = _4023;
    if (_4013)
    {
        float _4047 = _4045 * 0.15915493667125701904296875;
        _4025 = _4047;
    }
    float _4049 = _4025;
    float _4051 = _3989;
    if (_4013)
    {
        float _4053 = _4049 * 6.283185482025146484375;
        float _4055 = sin(_4053);
        _4051 = _4055;
    }
    float _4057 = _4051;
    float _4059 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4061 = precise::max(0.0, _4059);
    float _4063 = _3971;
    float _4065 = _4061;
    float _4067 = _4059;
    if (_4013)
    {
        float _4069 = _4049 * 6.283185482025146484375;
        float _4071 = cos(_4069);
        _4063 = _4071;
    }
    float _4073 = _4063;
    float _4075 = -_3999;
    float _4077 = -_4061;
    float _4079 = fma(_3981, _4075, _4077);
    if (!_4013)
    {
        _4027 = _4003;
    }
    float _4081 = _4027;
    float _4083 = _4081;
    if (_4013)
    {
        float _4085 = _4079 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4065 = _4085;
    }
    float _4087 = _4065;
    float _4089 = _4057;
    float _4091 = _4087;
    if (_4013)
    {
        float _4093 = fma(_4057, _4087, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4089 = _4093;
    }
    float _4095 = _4089;
    float _4097 = _4095;
    if (!_4013)
    {
        _4091 = _4001;
    }
    float _4099 = _4091;
    float _4101 = _4099;
    float _4103 = _4073;
    if (_4013)
    {
        float _4105 = _4073 + (-1.0);
        _4067 = _4105;
    }
    float _4107 = _4067;
    if (_4013)
    {
        float _4109 = _4039 * _4095;
        _4029 = _4109;
    }
    float _4111 = _4029;
    if (!_4013)
    {
        _4097 = _4079;
    }
    float _4113 = _4097;
    float _4115 = _4113;
    if (_4013)
    {
        float _4117 = _4107 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4031 = _4117;
    }
    float _4119 = _4031;
    if (_4013)
    {
        float _4121 = _4001 * _4111;
        _4101 = _4121;
    }
    float _4123 = _4101;
    if (!_4013)
    {
        _4041 = _4005;
    }
    float _4125 = _4041;
    float _4127 = _4125;
    if (_4013)
    {
        float _4129 = _4003 * _4111;
        _4083 = _4129;
    }
    float _4131 = _4083;
    if (_4013)
    {
        float _4133 = fma(_4079, _4073, _4119);
        _4115 = _4133;
    }
    float _4135 = _4115;
    if (_4013)
    {
        float _4137 = _4123 * _4123;
        _4127 = _4137;
    }
    float _4139 = _4127;
    if (!_4013)
    {
        _4103 = _4007;
    }
    float _4141 = _4103;
    float _4143 = sqrt(_3995);
    float _4145 = _4141;
    if (_4013)
    {
        float _4147 = _4131 * _4131;
        _4145 = _4147;
    }
    float _4149 = _4145;
    float _4151 = fma(_4135, _4135, _4139);
    float _4153 = _4151 + _4149;
    float _4155 = rsqrt(_4153);
    float _4157 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4159 = fma(_4143, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4157);
    float _4161 = precise::clamp(_4159, 0.0, 1.0);
    float _4163 = -_4161;
    float _4165 = _4163 + 1.0;
    float _4167 = _4155 * _4123;
    float _4169 = abs(_4165);
    float _4171 = log2(_4169);
    float _4173 = _4155 * _4135;
    float _4175 = _4155 * _4131;
    float _4177 = _4167 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4179 = -_4177;
    float _4181 = fma(_4173, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4179);
    float _4183 = -_4175;
    float _4185 = fma(_4183, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4181);
    float _4187 = fma(_4185, -0.5, 0.5);
    float _4189 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4191 = fma(_4185, 0.5, 0.5);
    float _4193 = _4173 + 1.0;
    float _4195 = sqrt(_4187);
    float _4197 = fma(_4191, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4199 = fma(_4191, _4197, -0.212114393711090087890625);
    float _4201 = exp2(_4189);
    float _4203 = fma(_4191, _4199, 1.570728778839111328125);
    float _4205 = _4195 * 0.636619746685028076171875;
    float _4207 = -_4203;
    float _4209 = fma(_4205, _4207, 1.0);
    float _4211 = -_4173;
    float _4213 = fma(_4201, _4193, _4211);
    float _4215 = fma(_4213, 0.5, 0.5);
    float2 _11144 = float2(_4209, _4215);
    float3 _4219 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11144, float2(0.0), isnan(_11144)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11144, float2(0.0), isnan(_11144)), level(0.0)).xyz;
    float _4221 = _4219.x;
    float _4223 = _4219.y;
    float _4225 = _4219.z;
    float _4227 = abs(_3300);
    float _4229 = log2(_4227);
    float _4231 = _3736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4233 = -_3206;
    float _4235 = _4233 + 1.0;
    out.m_90.x = _3664;
    out.m_90.y = _3662;
    out.m_90.z = _3666;
    float _4237 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4231);
    bool _4239 = _4143 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4241 = isnan(_4143);
    bool _4243 = _4239 || _4241;
    bool _4245 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4247 = _4243 || _4245;
    bool _4249 = _3300 <= 8000.0;
    bool _4251 = isnan(_3300);
    bool _4253 = _4249 || _4251;
    bool _4255 = isnan(8000.0);
    bool _4257 = _4253 || _4255;
    float _4259 = float(_4257);
    float _4261 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4237);
    float _4263 = _4229 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4265 = exp2(_4263);
    float _4267 = fma(_4265, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4269 = precise::clamp(_4267, 0.0, 1.0);
    float _4271 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4273 = fma(_4269, -2.0, 3.0);
    float _4275 = _4269 * _4269;
    float _4277 = _4265;
    if (!_4247)
    {
        _4277 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4279 = _4277;
    float _4281 = exp2(_4271);
    float _4283 = _4275 * _4273;
    float _4285 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4261);
    float _4287 = -_4283;
    float _4289 = _4287 + 1.0;
    float _4291 = _4285 + _3780;
    float _4293 = fma(_4289, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4283);
    float _4295 = _4291 * 0.5;
    float _4297 = _4259 * _4293;
    float _4299 = _4293;
    float _4301 = _3810;
    float _4303 = _4279;
    float _4305 = _4279;
    if (!_3762)
    {
        _4299 = 1.0;
    }
    float _4307 = _4299;
    float _4309 = -_4281;
    float _4311 = _4309 + 1.0;
    float _4313 = _4307;
    if (_3762)
    {
        bool _4315 = _3878 >= _3826;
        bool _4317 = isnan(_3878);
        bool _4319 = _4315 || _4317;
        bool _4321 = isnan(_3826);
        bool _4323 = _4319 || _4321;
        float _4325 = float(_4323);
        _4313 = _4325;
    }
    float _4327 = _4313;
    float _4329 = _4297 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_92.z = _4295;
    out.m_92.w = _3780;
    float _4331 = _4311 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4333 = _4235 * _4329;
    float _4335 = precise::clamp(_4333, 0.0, 1.0);
    float _4337 = _4327 * _3977;
    float _4339 = _4331 * _3880;
    float _4341 = -_4331;
    float _4343 = _4341 + 1.0;
    float _4345 = -_4335;
    float _4347 = fma(_4345, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _3810;
    out.gl_Position.y = _3814;
    out.gl_Position.z = _4285;
    out.gl_Position.w = _3780;
    float _4349 = _3891 * _4339;
    float _4351 = _4331;
    float _4353 = _4343;
    if (!_4247)
    {
        _4351 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4355 = _4351;
    float _4357 = -_4337;
    float _4359 = fma(_4357, _4347, 1.0);
    float _4361 = precise::clamp(_4359, 0.0, 1.0);
    float _4363 = _4361 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _4363;
    float _4365 = _4355;
    float _4367 = _4355;
    if (!_4247)
    {
        _4301 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4369 = _4301;
    float _4371 = _4225 * _4339;
    float _4373 = fma(_4221, _4349, _3885);
    float _4375 = fma(_4223, _4349, _3887);
    float _4377 = _3891 * _4343;
    float _4379 = fma(_3891, _4371, _3889);
    float _4381 = _4369;
    float _4383 = _4369;
    if (!_4247)
    {
        _4353 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4385 = _4353;
    float _4387 = _4385;
    float _4389 = _4385;
    if (!_4247)
    {
        _3905 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4391 = _3905;
    out.m_96.x = _4373;
    out.m_96.y = _4375;
    out.m_96.z = _4379;
    out.m_96.w = _4377;
    float _4393 = _4391;
    float _4395 = _4391;
    if (!_4247)
    {
        _3907 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4397 = _3907;
    bool _4399 = !_4247;
    float _4401 = _4397;
    float _4403 = _4397;
    if (!_4399)
    {
        bool _4405 = _4143 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4407 = isnan(_4143);
        bool _4409 = _4405 || _4407;
        bool _4411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4413 = _4409 || _4411;
        if (!_4413)
        {
            float _4415 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4417 = _4143 + _4415;
            float _4419 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4421 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4419;
            float _4423 = 1.0 / _4421;
            float _4425 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4427 = _4425 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4429 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4431 = _4429 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4433 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4435 = _4433 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4437 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4439 = _4437 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4441 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4443 = _4441 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4445 = _4417 * _4423;
            float _4447 = precise::clamp(_4445, 0.0, 1.0);
            float _4449 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4451 = _4449 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4453 = fma(_4447, _4427, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4455 = fma(_4447, _4451, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4457 = fma(_4447, _4431, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4459 = fma(_4447, _4435, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4461 = fma(_4447, _4439, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4463 = fma(_4447, _4443, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4305 = _4455;
            _4403 = _4461;
            _4383 = _4453;
            _4395 = _4459;
            _4389 = _4457;
            _4367 = _4463;
            _4465 = true;
        }
        else
        {
            bool _4467 = _4143 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4469 = isnan(_4143);
            bool _4471 = _4467 || _4469;
            bool _4473 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4475 = _4471 || _4473;
            if (!_4475)
            {
                _4381 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4477 = _4381;
            _4383 = _4477;
            if (!_4475)
            {
                _4303 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4479 = _4303;
            _4305 = _4479;
            if (!_4475)
            {
                _4387 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4481 = _4387;
            _4389 = _4481;
            if (!_4475)
            {
                _4393 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4483 = _4393;
            _4395 = _4483;
            if (!_4475)
            {
                _4401 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4485 = _4401;
            _4403 = _4485;
            if (!_4475)
            {
                _4365 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4487 = _4365;
            bool _4489 = !_4475;
            _4367 = _4487;
            if (!_4489)
            {
                bool _4491 = _4143 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4493 = isnan(_4143);
                bool _4495 = _4491 || _4493;
                bool _4497 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4499 = _4495 || _4497;
                if (!_4499)
                {
                    float _4501 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4503 = _4143 + _4501;
                    float _4505 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4507 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4505;
                    float _4509 = 1.0 / _4507;
                    float _4511 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4513 = _4511 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4515 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4517 = _4515 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4519 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4521 = _4519 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4523 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4525 = _4523 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4527 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4529 = _4527 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4531 = _4503 * _4509;
                    float _4533 = precise::clamp(_4531, 0.0, 1.0);
                    float _4535 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4537 = _4535 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4539 = fma(_4533, _4513, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4541 = fma(_4533, _4537, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4543 = fma(_4533, _4517, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4545 = fma(_4533, _4521, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4547 = fma(_4533, _4525, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4549 = fma(_4533, _4529, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4305 = _4541;
                    _4403 = _4547;
                    _4383 = _4539;
                    _4395 = _4545;
                    _4389 = _4543;
                    _4367 = _4549;
                    _4465 = true;
                }
                else
                {
                    _4305 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4403 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4383 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4395 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4389 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4367 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4465 = false;
    float _4551 = _4305;
    float _4553 = _4403;
    float _4555 = _4383;
    float _4557 = _4395;
    float _4559 = _4389;
    float _4561 = _4367;
    float _4563 = fma(_3110, -0.5, 0.5);
    float _4565 = precise::clamp(_4563, 0.0, 1.0);
    float _4567 = -_4551;
    float _4569 = _4567 + _4553;
    float _4571 = -_4555;
    float _4573 = _4571 + _4557;
    float _4575 = -_4559;
    float _4577 = _4575 + _4561;
    bool _4579 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4581 = fma(_4565, _4569, _4551);
    float _4583 = fma(_4565, _4573, _4555);
    float _4585 = fma(_4565, _4577, _4559);
    float _4587 = _4581 * 0.586610972881317138671875;
    out.m_98.x = 0.0;
    float _4589 = fma(_4583, 0.298911988735198974609375, _4587);
    float _4591 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4593 = fma(_4585, 0.114477999508380889892578125, _4589);
    out.m_61.x = _4591;
    float _4595 = -_4593;
    float _4597 = _4583 + _4595;
    float _4599 = -_4593;
    float _4601 = _4581 + _4599;
    float _4603 = -_4593;
    float _4605 = _4585 + _4603;
    float _4607 = fma(_4597, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4593);
    float _4609 = fma(_4601, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4593);
    float _4611 = fma(_4605, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4593);
    out.m_100.x = _4607;
    out.m_100.y = _4609;
    out.m_100.z = _4611;
    if (!_4579)
    {
        return out;
    }
    float _4613 = -_3662;
    float _4615 = _4613 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4617 = -_3664;
    float _4619 = _4617 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4621 = -_3666;
    float _4623 = _4621 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4625 = _4615 * _4615;
    float _4627 = fma(_4619, _4619, _4625);
    float _4629 = fma(_4623, _4623, _4627);
    float _4631 = sqrt(_4629);
    float _4633 = rsqrt(_4629);
    float _4635 = -_4631;
    float _4637 = _4635 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4639 = _4637 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4641 = precise::clamp(_4639, 0.0, 1.0);
    float _4643 = _4619 * _4633;
    float _4645 = _4615 * _4633;
    float _4647 = abs(_4641);
    float _4649 = log2(_4647);
    float _4651 = _4623 * _4633;
    float _4653 = _4643 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4655 = _3110 * _4645;
    float _4657 = -_4645;
    float _4659 = -_4653;
    float _4661 = fma(_4657, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4659);
    float _4663 = fma(_3104, _4643, _4655);
    float _4665 = -_4651;
    float _4667 = fma(_4665, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4661);
    float _4669 = fma(_3112, _4651, _4663);
    float _4671 = precise::clamp(_4669, 0.0, 1.0);
    float _4673 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4675 = _4667 + _4673;
    float _4677 = _4649 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4679 = _4675 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4681 = precise::clamp(_4679, 0.0, 1.0);
    float _4683 = exp2(_4677);
    float _4685 = _4683 * _4681;
    float _4687 = _4671 * _4685;
    float _4689 = _4687 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4691 = _4687 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4693 = _4687 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4689;
    out.m_98.y = _4691;
    out.m_98.z = _4693;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4465 = false;
    bool _3158 = false;
    bool _953 = false;
    bool _785 = false;
    bool _565 = false;
    bool _389 = false;
    bool _241 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_58.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_61.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4750 = as_type<float>(_135);
        out.gl_Position.z = _4750;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_63.w;
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
        _129 = _157;
    }
    float _159 = _129;
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
        out.m_61.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4820 = as_type<float>(_173);
        out.gl_Position.z = _4820;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_68.x;
    float _179 = in.m_68.y;
    float _181 = in.m_68.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _199 = !_185;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _209 = !_189;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _215 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _217 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _219 = !_191;
    int _221 = as_type<int>(_213);
    float _239;
    if (!_219)
    {
        float _223 = in.m_70.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        float _243 = float(_119);
        float _245 = 1.0 / _243;
        float _247 = _153 * _245;
        _239 = _247;
    }
    _241 = false;
    float _249 = _239;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = _249 + _251;
    bool _255 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _257 = isnan(_249);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    bool _267 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _269 = isnan(_249);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _283 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = -_265;
    float _289 = _287 + 1.0;
    float _291 = 1.0 / _281;
    bool _293 = _249 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_249);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _277 * _289;
    float _307 = -_277;
    float _309 = _307 + 1.0;
    bool _311 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _313 = _303 * _309;
    float _315 = 1.0 / _285;
    float _317 = -_303;
    float _319 = _317 + 1.0;
    float _321 = _253 * _291;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _325 = _249 + _323;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = fma(_329, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _337 = fma(_333, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = _325 * _315;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _345 = _335 * _313;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _351 = _337 * _313;
    float _353 = fma(_343, _339, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _355 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[143].x, _345);
    float _357 = fma(_349, _339, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _359 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[143].y, _351);
    float _361 = fma(_353, _305, _355);
    float _363 = fma(_357, _305, _359);
    float _365 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[145].x, _361);
    float _367 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[145].y, _363);
    bool _369 = !_311;
    float _387;
    if (!_369)
    {
        float _371 = in.m_70.x;
        float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _375 = _371 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _377 = fma(_375, (*spvDescriptorSet0.vp_c9)._m0[11].x, _153);
        float _379 = _377 * _373;
        float _381 = floor(_379);
        float _383 = -_381;
        float _385 = _379 + _383;
        _387 = _385;
        _389 = true;
    }
    else
    {
        float _391 = float(_119);
        float _393 = 1.0 / _391;
        float _395 = _153 * _393;
        _387 = _395;
    }
    _389 = false;
    float _397 = _387;
    float _399 = in.m_72.x;
    float _401 = in.m_72.y;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _405 = _397 + _403;
    bool _407 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _409 = isnan(_397);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _427 = 1.0 / _421;
    bool _429 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _431 = 1.0 / _425;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _433;
    float _437 = _405 * _427;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _441 = _397 + _439;
    bool _443 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _445 = isnan(_397);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    float _455 = _367 * _401;
    bool _457 = _397 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _459 = isnan(_397);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -_417;
    float _471 = _469 + 1.0;
    float _473 = fma(_435, _437, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _475 = _365 * _399;
    float _477 = _441 * _431;
    float _479 = _467 * _471;
    float _481 = -_467;
    float _483 = _481 + 1.0;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _489;
    float _493 = _453 * _483;
    float _495 = fma(_487, _437, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _497 = fma(_491, _437, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _499 = -_453;
    float _501 = _499 + 1.0;
    float _503 = _473 * _493;
    float _505 = _495 * _493;
    float _507 = _497 * _493;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _521 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].x, _507);
    float _523 = fma(_511, _477, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _525 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].y, _505);
    float _527 = fma(_515, _477, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _529 = fma(_519, _477, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _531 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].z, _503);
    float _533 = fma(_523, _479, _525);
    float _535 = fma(_527, _479, _521);
    float _537 = fma(_529, _479, _531);
    float _539 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[109].y, _533);
    float _541 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[109].x, _535);
    float _543 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[109].z, _537);
    bool _545 = !_429;
    float _563;
    if (!_545)
    {
        float _547 = in.m_70.x;
        float _549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _551 = _547 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _553 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _555 = _553 * _549;
        float _557 = floor(_555);
        float _559 = -_557;
        float _561 = _555 + _559;
        _563 = _561;
        _565 = true;
    }
    else
    {
        float _567 = float(_119);
        float _569 = 1.0 / _567;
        float _571 = _153 * _569;
        _563 = _571;
    }
    _565 = false;
    float _573 = _563;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _577 = _573 + _575;
    float _579 = _541 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _589 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _591 = isnan(_573);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _601;
    float _605 = 1.0 / _583;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _611 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _613 = isnan(_573);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = _539 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _627 = _625 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _629 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _631 = isnan(_573);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = _543 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _643 = 1.0 / _587;
    float _645 = -_621;
    float _647 = _645 + 1.0;
    float _649 = _579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _651 = _623 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _653 = _641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _599 * _647;
    bool _657 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _659 = _603 * _605;
    bool _661 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _663 = isnan(_573);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -_599;
    float _675 = _673 + 1.0;
    float _677 = 1.0 / _609;
    float _679 = fma(_659, _577, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _681;
    float _685 = _671 * _675;
    float _687 = -_671;
    float _689 = _687 + 1.0;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _695 = 1.0 / _627;
    float _697 = _639 * _689;
    float _699 = _693 * _643;
    float _701 = -_639;
    float _703 = _701 + 1.0;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _707 = _573 + _705;
    float _709 = _679 * _697;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _713 = _573 + _711;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _719 = _683 * _677;
    bool _721 = _573 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _723 = isnan(_573);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = fma(_699, _713, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _735 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[115].x, _709);
    float _737 = fma(_719, _707, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _741 = _573 + _739;
    float _743 = -_731;
    float _745 = _743 + 1.0;
    float _747 = fma(_733, _685, _735);
    float _749 = _717 * _695;
    float _751 = _621 * _745;
    float _753 = fma(_737, _655, _747);
    float _755 = fma(_749, _741, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _757 = fma(_755, _751, _753);
    float _759 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[119].x, _757);
    float _761 = _759 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _649;
    out.m_74.y = _651;
    out.m_74.z = _653;
    out.m_74.w = _761;
    bool _763 = !_657;
    float _765 = _655;
    float _783;
    if (!_763)
    {
        float _767 = in.m_70.x;
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _771 = _767 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[11].z, _153);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _783 = _781;
        _785 = true;
    }
    else
    {
        float _787 = float(_119);
        float _789 = 1.0 / _787;
        float _791 = _153 * _789;
        _783 = _791;
    }
    _785 = false;
    float _793 = _783;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _797 = _793 + _795;
    bool _799 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _801 = isnan(_793);
    bool _803 = _799 || _801;
    bool _805 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _807 = _803 || _805;
    float _809 = float(_807);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _813 = _793 + _811;
    bool _815 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _817 = isnan(_793);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _827;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _835 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _837 = isnan(_793);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = -_809;
    float _849 = _847 + 1.0;
    float _851 = 1.0 / _833;
    float _853 = _845 * _849;
    float _855 = -_845;
    float _857 = _855 + 1.0;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _859;
    bool _863 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _865 = 1.0 / _829;
    float _867 = _825 * _857;
    float _869 = -_825;
    float _871 = _869 + 1.0;
    float _873 = _797 * _865;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _875;
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _879;
    float _883 = fma(_861, _873, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _885 = fma(_877, _873, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _887 = fma(_881, _873, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _889 = _813 * _851;
    float _891 = _883 * _867;
    float _893 = _885 * _867;
    float _895 = _887 * _867;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _903 = _901 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _909 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[123].x, _891);
    float _911 = fma(_899, _889, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _913 = fma(_903, _889, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _915 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[123].y, _893);
    float _917 = fma(_907, _889, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _919 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[123].z, _895);
    float _921 = fma(_911, _853, _909);
    float _923 = fma(_913, _853, _915);
    float _925 = fma(_917, _853, _919);
    float _927 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[125].x, _921);
    float _929 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[125].y, _923);
    float _931 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[125].z, _925);
    bool _933 = !_863;
    float _951;
    if (!_933)
    {
        float _935 = in.m_70.x;
        float _937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _939 = _935 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[11].w, _153);
        float _943 = _941 * _937;
        float _945 = floor(_943);
        float _947 = -_945;
        float _949 = _943 + _947;
        _951 = _949;
        _953 = true;
    }
    else
    {
        float _955 = float(_119);
        float _957 = 1.0 / _955;
        float _959 = _153 * _957;
        _951 = _959;
    }
    _953 = false;
    float _961 = _951;
    float _963 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _965 = int(_963);
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _969 = _961 + _967;
    float _971 = _927 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _975 = _973 != 0;
    bool _977 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _979 = isnan(_961);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _985 = _981 || _983;
    float _987 = float(_985);
    float _989 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _991 = int(_989);
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _997 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _999 = isnan(_961);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1005 = _1001 || _1003;
    float _1007 = float(_1005);
    float _1009 = float(_965);
    float _1011 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1013 = int(_1011);
    if (_975)
    {
        float _1015 = in.m_70.x;
        _765 = _1015;
    }
    float _1017 = _765;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1023 = _1017;
    if (!_975)
    {
        float _1025 = in.m_70.y;
        _1023 = _1025;
    }
    float _1027 = _1023;
    float _1029 = float(uint(_991));
    float _1031 = 1.0 / _1009;
    int _1033 = ~_991;
    int _1035 = _1033 + 1;
    int _1037 = ~_991;
    int _1039 = _1037 + 1;
    bool _1041 = _991 == 0;
    float _1043 = 1.0 / _1029;
    float _1045 = float(_1013);
    float _1047 = _1031 * _153;
    float _1049 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1051 = int(_1049);
    int _1053 = as_type<int>(_1043) + (-2);
    float _1055 = trunc(_1047);
    int _1057 = int(_1055);
    float _1059 = 1.0 / _1045;
    float _1061 = float(uint(_1051));
    int _1063 = ~_1051;
    int _1065 = _1063 + 1;
    float _1067 = float(uint(_1057));
    float _1069 = 1.0 / _1061;
    float _1071 = as_type<float>(_1053) * _1067;
    float _1073 = _1059 * _153;
    float _1075 = trunc(_1071);
    float _1077 = precise::max(_1075, 0.0);
    uint _1080 = uint(_1077);
    float _1082 = in.m_70.x;
    float _1084 = in.m_70.y;
    float _1086 = in.m_70.z;
    float _1088 = in.m_70.w;
    float _1090 = trunc(_1073);
    int _1092 = int(_1090);
    int _1094 = as_type<int>(_1069) + (-2);
    float _1096 = _1071;
    if (_975)
    {
        _1096 = 1.0;
    }
    float _1098 = _1096;
    float _1100 = _1098;
    if (!_975)
    {
        _1100 = 1.2345600128173828125;
    }
    float _1102 = _1100;
    int _1104 = _1035 * int(_1080);
    int _1106 = _1104 + _1057;
    float _1108 = 1.0 / _995;
    float _1110 = _1027 * _1102;
    float _1112 = float(uint(_1106));
    float _1114 = as_type<float>(_1106);
    if (_975)
    {
        _1114 = 1.0;
    }
    float _1116 = _1114;
    float _1118 = float(uint(_1092));
    float _1120 = as_type<float>(_1053) * _1112;
    float _1122 = _1116;
    if (!_975)
    {
        _1122 = 7.345489978790283203125;
    }
    float _1124 = _1122;
    float _1126 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1128 = ~_1051;
    int _1130 = _1128 + 1;
    float _1132 = as_type<float>(_1094) * _1118;
    float _1134 = trunc(_1120);
    float _1136 = precise::max(_1134, 0.0);
    uint _1138 = uint(_1136);
    float _1140 = _1124 * _1082;
    float _1142 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1144 = trunc(_1132);
    float _1146 = precise::max(_1144, 0.0);
    uint _1148 = uint(_1146);
    float _1150 = floor(_1140);
    int _1152 = int(_1080) + int(_1138);
    float _1154 = float(_119);
    float _1156 = float(_991);
    int _1158 = _1130 * int(_1148);
    int _1160 = _1158 + _1092;
    float _1162 = 1.0 / _1154;
    float _1164 = float(uint(_1160));
    float _1166 = -_1150;
    float _1168 = _1140 + _1166;
    float _1170 = floor(_1110);
    float _1172 = as_type<float>(_1094) * _1164;
    int _1174 = _1039 * _1152;
    int _1176 = _1174 + _1057;
    float _1178 = _1168 * _1156;
    float _1180 = float(_1051);
    float _1182 = trunc(_1172);
    float _1184 = precise::max(_1182, 0.0);
    uint _1186 = uint(_1184);
    bool _1188 = uint(_1176) >= uint(_991);
    float _1190 = float(_1057);
    bool _1192 = _1190 >= _1156;
    bool _1194 = isnan(_1190);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan(_1156);
    bool _1200 = _1196 || _1198;
    float _1202 = float(_1200);
    float _1204 = trunc(_1178);
    int _1206 = int(_1204);
    float _1208 = -_1170;
    float _1210 = _1110 + _1208;
    bool _1212 = !_1188;
    int _1214 = _1212 ? 0 : (-1);
    float _1216 = _1162 * _153;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1220 = _1218 != 0;
    int _1222 = ~_1152;
    int _1224 = _1222 + _1214;
    int _1226 = _1224 + 1;
    float _1228 = _1156 * _1216;
    float _1230 = trunc(_1202);
    int _1232 = int(_1230);
    bool _1234 = !_1220;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = float(_1092);
    int _1240 = abs(_1236);
    float _1242 = _1180 * _1216;
    bool _1244 = _1238 >= _1180;
    bool _1246 = isnan(_1238);
    bool _1248 = _1244 || _1246;
    bool _1250 = isnan(_1180);
    bool _1252 = _1248 || _1250;
    float _1254 = float(_1252);
    float _1256 = _1210 * _1180;
    int _1258 = int(_1148) + int(_1186);
    int _1260 = _1206 * _1240;
    int _1262 = _1260 + _1057;
    int _1264 = _991 * _1226;
    int _1266 = _1264 + _1057;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1270 = _1268 != 0;
    float _1272 = trunc(_1256);
    int _1274 = int(_1272);
    int _1276 = ~_1232;
    int _1278 = _1276 + 1;
    int _1280 = _1278 + 1;
    bool _1282 = !_1041;
    int _1284 = _1282 ? _1266 : (-1);
    int _1286 = _1065 * _1258;
    int _1288 = _1286 + _1092;
    int _1290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1292 = _1290 != 0;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1296 = _1294 != 0;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1300 = _1298 != 0;
    float _1302 = trunc(_1228);
    int _1304 = int(_1302);
    int _1306 = _991 + (-1);
    int _1308 = _1284 * _1280;
    bool _1310 = uint(_1288) >= uint(_1051);
    bool _1312 = !_1296;
    int _1314 = _1312 ? 0 : 1;
    int _1316 = _1232 * _1306;
    int _1318 = _1316 + _1308;
    bool _1320 = !_1270;
    int _1322 = _1320 ? 0 : 1;
    float _1324 = trunc(_1254);
    int _1326 = int(_1324);
    int _1328 = abs(_1314);
    bool _1330 = !_1292;
    int _1332 = _1330 ? 0 : 1;
    bool _1334 = !_1310;
    int _1336 = _1334 ? 0 : (-1);
    int _1338 = _1318 * _1328;
    int _1340 = abs(_1322);
    float _1342 = trunc(_1242);
    int _1344 = int(_1342);
    int _1346 = abs(_1332);
    int _1348 = ~_1258;
    int _1350 = _1348 + _1336;
    int _1352 = _1350 + 1;
    int _1354 = _1274 * _1340;
    int _1356 = _1354 + _1092;
    bool _1358 = !_1300;
    int _1360 = _1358 ? 0 : 1;
    int _1362 = _1304 * _1346;
    int _1364 = _1362 + _1338;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1368 = _1366 != 0;
    int _1370 = _1051 * _1352;
    int _1372 = _1370 + _1092;
    int _1374 = abs(_1360);
    bool _1376 = _1051 == 0;
    bool _1378 = !_1368;
    int _1380 = _1378 ? 0 : 1;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1384 = _1382 != 0;
    int _1386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1388 = _1386 != 0;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1392 = _1390 != 0;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1396 = _1394 != 0;
    int _1398 = ~_1326;
    int _1400 = _1398 + 1;
    int _1402 = _1400 + 1;
    bool _1404 = !_1376;
    int _1406 = _1404 ? _1372 : (-1);
    int _1408 = abs(_1380);
    int _1410 = _1262 * _1374;
    int _1412 = _1410 + _1364;
    int _1414 = _1051 + (-1);
    int _1416 = _1406 * _1402;
    bool _1418 = !_1388;
    int _1420 = _1418 ? 0 : 1;
    int _1422 = _1326 * _1414;
    int _1424 = _1422 + _1416;
    int _1426 = abs(_1420);
    bool _1428 = !_1384;
    int _1430 = _1428 ? 0 : 1;
    int _1432 = _1206 * _1408;
    int _1434 = _1432 + _1412;
    bool _1436 = !_1392;
    int _1438 = _1436 ? 0 : 1;
    int _1440 = abs(_1430);
    bool _1442 = !_1396;
    int _1444 = _1442 ? 0 : 1;
    int _1446 = abs(_1438);
    int _1448 = _1424 * _1426;
    float _1450 = float(uint(_1434));
    int _1452 = abs(_1444);
    int _1454 = _1344 * _1440;
    int _1456 = _1454 + _1448;
    float _1458 = as_type<float>(_1053) * _1450;
    int _1460 = ~_1051;
    int _1462 = _1460 + 1;
    int _1464 = _1356 * _1446;
    int _1466 = _1464 + _1456;
    int _1468 = ~_991;
    int _1470 = _1468 + 1;
    float _1472 = trunc(_1458);
    float _1474 = precise::max(_1472, 0.0);
    uint _1476 = uint(_1474);
    bool _1478 = _991 == 0;
    int _1480 = _1274 * _1452;
    int _1482 = _1480 + _1466;
    int _1484 = ~_991;
    int _1486 = _1484 + 1;
    float _1488 = float(uint(_1482));
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1494 = as_type<float>(_1094) * _1488;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1498 = _1486 * int(_1476);
    int _1500 = _1498 + _1434;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1504 = trunc(_1494);
    float _1506 = precise::max(_1504, 0.0);
    uint _1508 = uint(_1506);
    float _1510 = fma(_1126, -2.0, _1496);
    float _1512 = -_1502;
    float _1514 = fma(_1142, 2.0, _1512);
    float _1516 = float(uint(_1500));
    float _1518 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1510);
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1520;
    float _1524 = 1.0 / _1492;
    float _1526 = as_type<float>(_1053) * _1516;
    float _1528 = -_153;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1514);
    float _1532 = trunc(_1526);
    float _1534 = precise::max(_1532, 0.0);
    uint _1536 = uint(_1534);
    int _1538 = _1462 * int(_1508);
    int _1540 = _1538 + _1482;
    float _1542 = float(uint(_1540));
    int _1544 = ~_1051;
    int _1546 = _1544 + 1;
    float _1548 = as_type<float>(_1094) * _1542;
    float _1550 = trunc(_1548);
    float _1552 = precise::max(_1550, 0.0);
    uint _1554 = uint(_1552);
    int _1556 = int(_1476) + int(_1536);
    int _1558 = _1470 * _1556;
    int _1560 = _1558 + _1434;
    bool _1562 = uint(_1560) >= uint(_991);
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1568 = !_1562;
    int _1570 = _1568 ? 0 : (-1);
    float _1572 = 1.0 / _1566;
    int _1574 = int(_1508) + int(_1554);
    int _1576 = ~_1556;
    int _1578 = _1576 + _1570;
    int _1580 = _1578 + 1;
    int _1582 = ~_1051;
    int _1584 = _1582 + 1;
    int _1586 = _1546 * _1574;
    int _1588 = _1586 + _1482;
    int _1590 = _991 * _1580;
    int _1592 = _1590 + _1434;
    bool _1594 = uint(_1588) >= uint(_1051);
    bool _1596 = !_1478;
    int _1598 = _1596 ? _1592 : (-1);
    bool _1600 = !_1594;
    int _1602 = _1600 ? 0 : (-1);
    float _1604 = _1522 * _1572;
    int _1606 = _1598 & 3;
    bool _1608 = _1606 != 0;
    int _1610 = _1598 & 3;
    bool _1612 = _1610 != 0;
    bool _1614 = uint(_1606) > 1u;
    int _1616 = ~_1574;
    int _1618 = _1616 + _1602;
    int _1620 = _1618 + 1;
    int _1622 = _1612 ? 0 : 1;
    bool _1624 = _1088 > 0.5;
    int _1626 = _1051 * _1620;
    int _1628 = _1626 + _1482;
    float _1630 = float(uint(_1262));
    bool _1632 = uint(_1606) >= 2u;
    bool _1634 = !_1376;
    int _1636 = _1634 ? _1628 : (-1);
    float _1638 = as_type<float>(_1053) * _1630;
    int _1640 = _1632 ? 0 : 1;
    bool _1642 = _1606 != 3;
    float _1644 = trunc(_1638);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    int _1650 = ~_1622;
    int _1652 = _1650 + 1;
    int _1654 = _1652 + 1;
    int _1656 = _1654;
    int _1658 = as_type<int>(_1638);
    if (!_1614)
    {
        int _1660 = ~_1622;
        int _1662 = _1660 + 1;
        _1656 = _1662;
    }
    int _1664 = _1656;
    float _1666 = -_211;
    int _1668 = _1624 ? as_type<int>(_1666) : as_type<int>(_211);
    int _1670 = _1636 & 3;
    bool _1672 = _1670 != 0;
    int _1674 = _1636 & 3;
    bool _1676 = _1674 != 0;
    float _1678 = float(uint(_1356));
    int _1680 = _1672 ? 0 : 1;
    bool _1682 = uint(_1674) > 1u;
    float _1684 = as_type<float>(_1094) * _1678;
    int _1686 = ~_1640;
    int _1688 = _1686 + 1;
    int _1690 = _1688 + 1;
    int _1692 = _1690;
    if (_1642)
    {
        int _1694 = ~_1640;
        int _1696 = _1694 + 1;
        _1692 = _1696;
    }
    int _1698 = _1692;
    float _1700 = trunc(_1684);
    float _1702 = precise::max(_1700, 0.0);
    uint _1704 = uint(_1702);
    int _1706 = ~_991;
    int _1708 = _1706 + 1;
    int _1710 = ~_1680;
    int _1712 = _1710 + 1;
    int _1714 = _1712 + 1;
    int _1716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1718 = _1716 != 0;
    int _1720 = _1708 * int(_1648);
    int _1722 = _1720 + _1262;
    bool _1724 = _1674 != 3;
    float _1726 = _1082 * 2.0;
    int _1728 = _1714;
    if (!_1682)
    {
        int _1730 = ~_1680;
        int _1732 = _1730 + 1;
        _1728 = _1732;
    }
    int _1734 = _1728;
    int _1736 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1738 = _1736 != 0;
    float _1740 = float(uint(_1722));
    float _1742 = _1084 * 2.0;
    bool _1744 = !_1738;
    float _1746 = _1744 ? _211 : as_type<float>(_1668);
    float _1748 = floor(_1726);
    bool _1750 = uint(_1674) >= 2u;
    float _1752 = as_type<float>(_1053) * _1740;
    int _1754 = _1584 * int(_1704);
    int _1756 = _1754 + _1356;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1760 = _1758 != 0;
    int _1762 = _1750 ? 0 : 1;
    float _1764 = floor(_1742);
    bool _1766 = !_1760;
    int _1768 = _1766 ? 0 : 1;
    int _1770 = ~_1762;
    int _1772 = _1770 + 1;
    int _1774 = _1772 + 1;
    float _1776 = float(uint(_1756));
    bool _1778 = _1082 > 0.5;
    float _1780 = trunc(_1752);
    float _1782 = precise::max(_1780, 0.0);
    uint _1784 = uint(_1782);
    int _1786 = _1774;
    float _1788 = _1752;
    if (_1724)
    {
        int _1790 = ~_1762;
        int _1792 = _1790 + 1;
        _1786 = _1792;
    }
    int _1794 = _1786;
    bool _1796 = _1084 > 0.5;
    int _1798 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1800 = _1798 != 0;
    float _1802 = as_type<float>(_1094) * _1776;
    float _1804 = -_201;
    int _1806 = _1778 ? as_type<int>(_1804) : as_type<int>(_201);
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1810 = _1808 != 0;
    float _1812 = trunc(_1802);
    float _1814 = precise::max(_1812, 0.0);
    uint _1816 = uint(_1814);
    float _1818 = -_211;
    int _1820 = _1796 ? as_type<int>(_1818) : as_type<int>(_211);
    bool _1822 = !_1800;
    float _1824 = _1822 ? _201 : as_type<float>(_1806);
    bool _1826 = _1086 > 0.5;
    bool _1828 = !_1810;
    float _1830 = _1828 ? _211 : as_type<float>(_1820);
    bool _1832 = _1748 > 0.0;
    bool _1834 = _1748 >= 0.0;
    bool _1836 = isnan(_1748);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan(0.0);
    bool _1842 = _1838 || _1840;
    float _1844 = -_201;
    int _1846 = _1826 ? as_type<int>(_1844) : as_type<int>(_201);
    float _1848 = _1802;
    if (_1718)
    {
        _1658 = 0;
    }
    int _1850 = _1658;
    bool _1852 = _1764 >= 0.0;
    bool _1854 = isnan(_1764);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan(0.0);
    bool _1860 = _1856 || _1858;
    int _1862 = _1850;
    if (!_1718)
    {
        _1862 = 1;
    }
    int _1864 = _1862;
    int _1866 = _1842 ? 0 : 1;
    bool _1868 = _1764 > 0.0;
    int _1870 = ~_991;
    int _1872 = _1870 + 1;
    int _1874 = _1860 ? 0 : 1;
    bool _1876 = _1864 != 1;
    int _1878 = int(_1648) + int(_1784);
    int _1880 = ~_1866;
    int _1882 = _1880 + 1;
    int _1884 = _1882 + 1;
    int _1886 = _1884;
    if (!_1832)
    {
        int _1888 = ~_1866;
        int _1890 = _1888 + 1;
        _1886 = _1890;
    }
    int _1892 = _1886;
    int _1894 = _1872 * _1878;
    int _1896 = _1894 + _1262;
    int _1898 = int(_1704) + int(_1816);
    int _1900 = ~_1051;
    int _1902 = _1900 + 1;
    int _1904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1906 = _1904 != 0;
    float _1908 = as_type<float>(_1816);
    float _1910 = as_type<float>(_1896);
    if (!_1876)
    {
        _1848 = _1084;
    }
    float _1912 = _1848;
    int _1914 = _1902 * _1898;
    int _1916 = _1914 + _1356;
    bool _1918 = !_1906;
    float _1920 = _1918 ? _201 : as_type<float>(_1846);
    bool _1922 = uint(_1896) >= uint(_991);
    float _1924 = _1912;
    if (!_1876)
    {
        _1908 = _1084;
    }
    float _1926 = _1908;
    float _1928 = _1920 + 0.5;
    float _1930 = _1926;
    if (!_1876)
    {
        _1788 = _1086;
    }
    float _1932 = _1788;
    float _1934 = _1932;
    if (!_1876)
    {
        _1910 = _1086;
    }
    float _1936 = _1910;
    int _1938 = ~_1874;
    int _1940 = _1938 + 1;
    int _1942 = _1940 + 1;
    float _1944 = _1936;
    int _1946 = _1942;
    if (_1876)
    {
        _1924 = _1082;
    }
    float _1948 = _1924;
    if (_1876)
    {
        _1930 = _1082;
    }
    float _1950 = _1930;
    if (_1876)
    {
        _1934 = _1084;
    }
    float _1952 = _1934;
    if (_1876)
    {
        _1944 = _1084;
    }
    float _1954 = _1944;
    if (!_1868)
    {
        int _1956 = ~_1874;
        int _1958 = _1956 + 1;
        _1946 = _1958;
    }
    int _1960 = _1946;
    bool _1962 = uint(_1916) >= uint(_1051);
    float _1964 = in.m_58.x;
    float _1966 = in.m_58.y;
    float _1968 = in.m_58.z;
    bool _1970 = !_1922;
    int _1972 = _1970 ? 0 : (-1);
    int _1974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1976 = _1974 != 0;
    int _1978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1980 = _1978 != 0;
    int _1982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1984 = _1982 != 0;
    float _1986 = _1086 * 2.0;
    bool _1988 = !_1962;
    int _1990 = _1988 ? 0 : (-1);
    int _1992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1994 = _1992 != 0;
    float _1996 = floor(_1986);
    bool _1998 = !_1980;
    int _2000 = _1998 ? 0 : 1;
    int _2002 = ~_1898;
    int _2004 = _2002 + _1990;
    int _2006 = _2004 + 1;
    float _2008 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2008;
    float _2012 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2014 = _2012 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2016 = ~_1878;
    int _2018 = _2016 + _1972;
    int _2020 = _2018 + 1;
    float _2022 = _2010 * _1524;
    float _2024 = _2014 * _1108;
    float _2026 = _1086 + _1084;
    float _2028 = fma(_2022, _969, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2030 = _1051 * _2006;
    int _2032 = _2030 + _1356;
    float _2034 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2036 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2038 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _2040 = _1996 >= 0.0;
    bool _2042 = isnan(_1996);
    bool _2044 = _2040 || _2042;
    bool _2046 = isnan(0.0);
    bool _2048 = _2044 || _2046;
    float _2050 = fma(_1964, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2034);
    float _2052 = fma(_1964, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2036);
    float _2054 = fma(_1964, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2038);
    float _2056 = _1082 + _1084;
    float _2058 = _2026 + (-1.0);
    float _2060 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2050);
    bool _2062 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2064 = isnan(_961);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2070 = _2066 || _2068;
    float _2072 = float(_2070);
    float _2074 = _2056 + (-1.0);
    float _2076 = fma(_2058, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2078 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2054);
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2082 = _961 + _2080;
    float _2084 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2086 = -_2072;
    float _2088 = _2086 + 1.0;
    int _2090 = _2048 ? 0 : 1;
    float _2092 = _2060 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2094 = _1996 > 0.0;
    float _2096 = fma(_1968, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2052);
    float _2098 = _987 * _2088;
    float _2100 = -_987;
    float _2102 = _2100 + 1.0;
    bool _2104 = _961 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2106 = isnan(_961);
    bool _2108 = _2104 || _2106;
    bool _2110 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2112 = _2108 || _2110;
    float _2114 = float(_2112);
    float _2116 = _2096 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2118 = !_1976;
    int _2120 = _2118 ? 0 : 1;
    float _2122 = _1007 * _2102;
    float _2124 = -_1007;
    float _2126 = _2124 + 1.0;
    float _2128 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2130 = _961 + _2128;
    float _2132 = fma(_2024, _2082, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2134 = _1830 + (-0.5);
    float _2136 = _2114 * _2126;
    float _2138 = _1824 + 0.5;
    float _2140 = fma(_1604, _2130, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2142 = -_2114;
    float _2144 = _2142 + 1.0;
    float _2146 = _2028 * _2136;
    float _2148 = fma(_2138, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1530);
    float _2150 = -_2134;
    float _2152 = -_1518;
    float _2154 = fma(_2150, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2152);
    float _2156 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2158 = log2(_2156);
    float _2160 = fma(_2144, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2146);
    int _2162 = ~_2090;
    int _2164 = _2162 + 1;
    int _2166 = _2164 + 1;
    float _2168 = _2078 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2170 = _2166;
    float _2172 = _2116;
    if (!_2094)
    {
        int _2174 = ~_2090;
        int _2176 = _2174 + 1;
        _2170 = _2176;
    }
    int _2178 = _2170;
    float _2180 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2182 = fma(_2132, _2122, _2160);
    float _2184 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2186 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2180);
    int _2188 = abs(_2120);
    float _2190 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2192 = fma(_2184, -2.0, _1019);
    int _2194 = abs(_2000);
    float _2196 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2198 = float(_2188);
    float _2200 = fma(_2140, _2098, _2182);
    float _2202 = float(_2178);
    float _2204 = _2158 * _153;
    float _2206 = float(_1892);
    float _2208 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2196);
    float _2210 = float(_2194);
    float _2212 = _2198 * _2202;
    int _2214 = _1598 >> 31;
    float _2216 = exp2(_2204);
    int _2218 = _1636 >> 31;
    float _2220 = _2210 * _2206;
    int _2222 = _2214 & 3;
    float _2224 = -_1021;
    float _2226 = fma(_2190, 2.0, _2224);
    int _2228 = _2218 & 3;
    float _2230 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2232 = _2092 + _2230;
    int _2234 = _1598 + _2222;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2238 = _2116 + _2236;
    int _2240 = _1636 + _2228;
    float _2242 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2246 = _2168 + _2244;
    float _2248 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2242);
    float _2250 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2252 = _2234 >> 2;
    float _2254 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2256 = -_2216;
    float _2258 = _2256 + 1.0;
    float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2262 = 1.0 + _2260;
    int _2264 = _2252 << 4;
    int _2266 = _2264 + 368;
    float _2268 = fma(_2072, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2200);
    int _2270 = _2240 >> 2;
    float _2272 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2248);
    bool _2274 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2276 = isnan(0.0);
    bool _2278 = _2274 || _2276;
    bool _2280 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2282 = _2278 || _2280;
    float _2284 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2250);
    float _2286 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2254);
    float _2288 = 1.0 / _2262;
    uint _2290 = uint(int(uint(_2266) >> uint(2)));
    uint _2292 = uint(int(uint(int(_2290)) >> uint(2)));
    int _2294 = int(_2290) & 3;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[int(_2292)][_2294];
    int _2298 = int(_2290) + 1;
    uint _2300 = uint(int(uint(_2298) >> uint(2)));
    int _2302 = _2298 & 3;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[int(_2300)][_2302];
    int _2306 = _2270 << 4;
    int _2308 = _2306 + 512;
    float _2310 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2286);
    float _2312 = _2282 ? _2258 : 0.0;
    float _2314 = -_153;
    float _2316 = fma(_2314, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2226);
    bool _2318 = !_1608;
    int _2320 = _2318 ? 0 : 1;
    float _2322 = _1746 + (-0.5);
    bool _2324 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2326 = isnan(1.0);
    bool _2328 = _2324 || _2326;
    bool _2330 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2332 = _2328 || _2330;
    int _2334 = _2266 + 8;
    uint _2336 = uint(int(uint(_2334) >> uint(2)));
    uint _2338 = uint(int(uint(int(_2336)) >> uint(2)));
    int _2340 = int(_2336) & 3;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[int(_2338)][_2340];
    int _2344 = int(_2336) + 1;
    uint _2346 = uint(int(uint(_2344) >> uint(2)));
    int _2348 = _2344 & 3;
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[int(_2346)][_2348];
    bool _2352 = _2272 >= 0.0;
    float _2354 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2192);
    float _2356 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2284);
    float _2358 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2186);
    float _2360 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2208);
    float _2362 = -_2322;
    float _2364 = -_2354;
    float _2366 = fma(_2362, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2364);
    float _2368 = _2212 * (-2.0);
    uint _2370 = uint(int(uint(_2308) >> uint(2)));
    uint _2372 = uint(int(uint(int(_2370)) >> uint(2)));
    int _2374 = int(_2370) & 3;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[int(_2372)][_2374];
    int _2378 = int(_2370) + 1;
    uint _2380 = uint(int(uint(_2378) >> uint(2)));
    int _2382 = _2378 & 3;
    float _2384 = (*spvDescriptorSet0.vp_c9)._m0[int(_2380)][_2382];
    float _2386 = _929 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2388 = _971 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2390 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_2332)
    {
        float _2392 = _2312 * _2288;
        _155 = _2392;
    }
    float _2394 = _155;
    float _2396 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2316);
    float _2398 = _931 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2400 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2402 = !_1676;
    int _2404 = _2402 ? 0 : 1;
    int _2406 = _991 * _2020;
    int _2408 = _2406 + _1262;
    float _2410 = _2398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2412 = _2220 * (-2.0);
    int _2414 = abs(_1664);
    int _2416 = _2308 + 8;
    uint _2418 = uint(int(uint(_2416) >> uint(2)));
    uint _2420 = uint(int(uint(int(_2418)) >> uint(2)));
    int _2422 = int(_2418) & 3;
    float _2424 = (*spvDescriptorSet0.vp_c9)._m0[int(_2420)][_2422];
    int _2426 = int(_2418) + 1;
    uint _2428 = uint(int(uint(_2426) >> uint(2)));
    int _2430 = _2426 & 3;
    float _2432 = (*spvDescriptorSet0.vp_c9)._m0[int(_2428)][_2430];
    int _2434 = abs(_2320);
    out.m_76.x = _2388;
    out.m_76.y = _2400;
    out.m_76.z = _2410;
    out.m_76.w = _2390;
    int _2436 = abs(_1734);
    float _2438 = fma(_2084, _2368, _2084);
    int _2440 = abs(_2404);
    float _2442 = in.m_78.x;
    float _2444 = in.m_78.y;
    float _2446 = in.m_78.z;
    float _2448 = fma(_2076, _2412, _2076);
    bool _2450 = _1606 != 3;
    if (_2352)
    {
        out.m_61.x = 0.0;
    }
    int _2452 = abs(_1794);
    bool _2454 = _991 == 0;
    bool _2456 = _1051 == 0;
    int _2458 = ~_2414;
    int _2460 = _2458 + 1;
    int _2462 = _2460 + 1;
    int _2464 = ~_2434;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    int _2470 = ~_2436;
    int _2472 = _2470 + 1;
    int _2474 = _2472 + 1;
    int _2476 = _2462 * as_type<int>(_2304);
    int _2478 = abs(_1698);
    int _2480 = _2468 * as_type<int>(_2296);
    int _2482 = _2480 + _2476;
    int _2484 = ~_2440;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    float _2490 = fma(_2368, _2442, _2442);
    bool _2492 = !_1994;
    int _2494 = _2492 ? 0 : 1;
    float _2496 = fma(_2412, _2444, _2444);
    bool _2498 = _1674 != 3;
    int _2500 = _2474 * as_type<int>(_2384);
    int _2502 = ~_2478;
    int _2504 = _2502 + 1;
    int _2506 = _2504 + 1;
    int _2508 = abs(_2494);
    int _2510 = _2488 * as_type<int>(_2376);
    int _2512 = _2510 + _2500;
    bool _2514 = !_2498;
    int _2516 = _2514 ? 0 : (-1);
    int _2518 = _2506 * as_type<int>(_2342);
    int _2520 = _2518 + _2482;
    bool _2522 = !_2450;
    int _2524 = _2522 ? 0 : (-1);
    int _2526 = abs(_2516);
    int _2528 = abs(_2524);
    int _2530 = ~_2452;
    int _2532 = _2530 + 1;
    int _2534 = _2532 + 1;
    int _2536 = ~_2528;
    int _2538 = _2536 + 1;
    int _2540 = _2538 + 1;
    int _2542 = abs(_1768);
    int _2544 = _2534 * as_type<int>(_2424);
    int _2546 = _2544 + _2512;
    int _2548 = ~_2526;
    int _2550 = _2548 + 1;
    int _2552 = _2550 + 1;
    int _2554 = _2540 * as_type<int>(_2350);
    int _2556 = _2554 + _2520;
    int _2558 = ~_2542;
    int _2560 = _2558 + 1;
    int _2562 = _2560 + 1;
    int _2564 = ~_2508;
    int _2566 = _2564 + 1;
    int _2568 = _2566 + 1;
    int _2570 = _2552 * as_type<int>(_2432);
    int _2572 = _2570 + _2546;
    bool _2574 = !_2454;
    int _2576 = _2574 ? _2408 : (-1);
    int _2578 = _2556 * _2562;
    bool _2580 = !_2456;
    int _2582 = _2580 ? _2032 : (-1);
    int _2584 = _2572 * _2568;
    float _2586 = _2232 * _2232;
    int _2588 = _2576 * _2542;
    int _2590 = _2588 + _2578;
    float _2592 = as_type<float>(_2526);
    if (_2352)
    {
        _2592 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2594 = _2592;
    int _2596 = _2582 * _2508;
    int _2598 = _2596 + _2584;
    float _2600 = fma(_2238, _2238, _2586);
    float _2602 = -_2356;
    float _2604 = _2602 + 1.0;
    float _2606 = -_2310;
    float _2608 = _2606 + 1.0;
    float _2610 = -_2358;
    float _2612 = _2610 + 1.0;
    float _2614 = fma(_2246, _2246, _2600);
    float _2616 = -_2360;
    float _2618 = _2616 + 1.0;
    float _2620 = _1082 + (-0.5);
    float _2622 = -_2604;
    float _2624 = fma(_1824, _2622, _2148);
    float _2626 = fma(_1830, _2608, _2154);
    float _2628 = -_2612;
    float _2630 = fma(_1920, _2628, _2396);
    float _2632 = rsqrt(_2614);
    float _2634 = fma(_1746, _2618, _2366);
    int _2636 = as_type<int>(_2594);
    if (_2352)
    {
        float _2638 = _2594 * 5.0;
        _2636 = as_type<int>(_2638);
    }
    int _2640 = _2636;
    float _2642 = float(_2590);
    float _2644 = fma(_2620, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2490);
    float _2646 = float(_2598);
    out.m_80.x = _2624;
    out.m_80.y = _2626;
    out.m_80.z = _2630;
    out.m_80.w = _2634;
    bool _2648 = !_1984;
    int _2650 = _2648 ? 0 : 1;
    float _2652 = fma(_2438, _2394, _2644);
    float _2654 = _1084 + (-0.5);
    if (_2352)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8514 = as_type<float>(_2640);
        out.gl_Position.z = _8514;
    }
    int _2656 = abs(_2650);
    out.m_82.x = _2642;
    out.m_82.y = _2646;
    float _2658 = _2232 * _2632;
    float _2660 = _2238 * _2632;
    int _2662 = as_type<int>(_2660);
    if (_2352)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2664 = -_2658;
    float _2666 = fma(_2664, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2092);
    float _2668 = _2246 * _2632;
    float _2670 = -_2660;
    float _2672 = fma(_2670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2116);
    float _2674 = float(_1960);
    float _2676 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2678 = _2666 + _2676;
    float _2680 = -_2668;
    float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2168);
    float _2684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2686 = _2672 + _2684;
    float _2688 = -_2658;
    float _2690 = fma(_2688, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2232);
    float _2692 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2694 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2696 = _2682 + _2694;
    float _2698 = float(_2656);
    float _2700 = fma(_2654, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2496);
    float _2702 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2692);
    float _2704 = -_2660;
    float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2238);
    float _2708 = _2690 * _2690;
    float _2710 = _2698 * _2674;
    float _2712 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2702);
    float _2714 = _1086 + _1082;
    float _2716 = fma(_2448, _2394, _2700);
    float _2718 = fma(_2706, _2706, _2708);
    float _2720 = -_2668;
    float _2722 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2246);
    bool _2724 = _2712 >= 0.0;
    float _2726 = _2714 + (-1.0);
    float _2728 = _2710 * (-2.0);
    float _2730 = _2652 * 0.15915493667125701904296875;
    float _2732 = _2716 * 0.15915493667125701904296875;
    float _2734 = fma(_2722, _2722, _2718);
    float _2736 = fma(_2726, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2738 = _1086 + (-0.5);
    float _2740 = fma(_2728, _2446, _2446);
    float _2742 = _2730 * 6.283185482025146484375;
    float _2744 = sin(_2742);
    float _2746 = fma(_2736, _2728, _2736);
    float _2748 = _2692;
    int _2750 = as_type<int>(_2738);
    int _2752 = as_type<int>(_2668);
    if (_2724)
    {
        _2748 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2754 = _2748;
    float _2756 = fma(_2738, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2740);
    if (_2724)
    {
        out.m_61.x = 0.0;
    }
    float _2758 = _2730 * 6.283185482025146484375;
    float _2760 = cos(_2758);
    if (_2724)
    {
        float _2762 = _2754 * 5.0;
        _2750 = as_type<int>(_2762);
    }
    int _2764 = _2750;
    float _2766 = fma(_2746, _2394, _2756);
    if (_2724)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8715 = as_type<float>(_2764);
        out.gl_Position.z = _8715;
    }
    float _2768 = _2766 * 0.15915493667125701904296875;
    float _2770 = _2732 * 6.283185482025146484375;
    float _2772 = sin(_2770);
    float _2774 = sqrt(_2734);
    float _2776 = _2732 * 6.283185482025146484375;
    float _2778 = cos(_2776);
    if (_2724)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2780 = _2768 * 6.283185482025146484375;
    float _2782 = cos(_2780);
    float _2784 = _2632 * _2774;
    float _2786 = _455 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _2790 = _475 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2792 = _2760 * _2778;
    float _2794 = _2784 * _2786;
    float _2796 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _2798 = _2768 * 6.283185482025146484375;
    float _2800 = sin(_2798);
    float _2802 = _2784 * _2790;
    float _2804 = _2788 * _2794;
    float _2806 = _2744 * _2772;
    float _2808 = _2760 * _2772;
    float _2810 = _2744 * _2778;
    float _2812 = _2796 * _2802;
    float _2814 = _2760 * _2782;
    float _2816 = _2778 * _2782;
    float _2818 = _2744 * _2782;
    float _2820 = _2772 * _2782;
    float _2822 = _2814 * _2804;
    float _2824 = _2784 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2826 = _2824 * 0.5;
    float _2828 = _2818 * _2804;
    float _2830 = fma(_2800, _2792, _2806);
    float _2832 = -_2810;
    float _2834 = fma(_2800, _2808, _2832);
    float _2836 = -_2804;
    float _2838 = _2800 * _2836;
    float _2840 = -_2808;
    float _2842 = fma(_2800, _2810, _2840);
    float _2844 = fma(_2830, _2812, _2822);
    float _2846 = _2830 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2848 = fma(_2816, _2812, _2838);
    float _2850 = _2830 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2852 = fma(_2834, _2826, _2844);
    float _2854 = fma(_2800, _2806, _2792);
    float _2856 = fma(_2842, _2812, _2828);
    float _2858 = fma(_2820, _2826, _2848);
    float _2860 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2862 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2864 = fma(_2854, _2826, _2856);
    float _2866 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2868 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2860);
    float _2870 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2862);
    float _2872 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2874 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2866);
    float _2876 = fma(_2864, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2868);
    float _2878 = fma(_2864, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2870);
    float _2880 = fma(_2872, _2872, 1.0);
    float _2882 = fma(_2864, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2874);
    float _2884 = _2876 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2886 = _2878 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2888 = _2830 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2890 = _2834 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2892 = _2116 + _2884;
    float _2894 = _2168 + _2886;
    float _2896 = rsqrt(_2880);
    float _2898 = _2834 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2902 = _2892 + _2900;
    float _2904 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2906 = _2894 + _2904;
    float _2908 = _2834 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2910 = _2882 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2912 = _2902 * _2902;
    float _2914 = _2906 * _2906;
    float _2916 = fma(_2816, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2888);
    float _2918 = fma(_2816, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2850);
    float _2920 = fma(_2816, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2846);
    float _2922 = _2912 + _2914;
    float _2924 = _2814 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2926 = _2814 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2928 = _2814 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2930 = sqrt(_2922);
    float _2932 = _2092 + _2910;
    float _2934 = -_2800;
    float _2936 = fma(_2934, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2924);
    float _2938 = -_2800;
    float _2940 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2926);
    float _2942 = -_2800;
    float _2944 = fma(_2942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2928);
    float _2946 = fma(_2820, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2890);
    float _2948 = fma(_2820, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2898);
    float _2950 = fma(_2820, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2908);
    bool _2952 = _2930 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2954 = _2910;
    float _2956 = _2820;
    float _2958 = _2890;
    float _2960 = _2924;
    float _2962 = _2926;
    float _2964 = _2932;
    if (!_2952)
    {
        _2954 = _2914;
    }
    float _2966 = _2954;
    float _2968 = _2966;
    if (!_2952)
    {
        _2956 = _2912;
    }
    float _2970 = _2956;
    float _2972 = _2970;
    if (!_2952)
    {
        _2958 = _2892;
    }
    float _2974 = _2958;
    float _2976 = _2974;
    if (!_2952)
    {
        _2960 = _2894;
    }
    float _2978 = _2960;
    float _2980 = _2978;
    if (!_2952)
    {
        _2962 = _2932;
    }
    float _2982 = _2962;
    bool _2984 = !_2952;
    float _2986 = _2982;
    if (!_2984)
    {
        float _2988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2990 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2992 = _2930 + _2990;
        float _2994 = rsqrt(_2922);
        float _2996 = _2992 * _2988;
        float _2998 = _2932 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3000 = _2996 * 0.15915493667125701904296875;
        float _3002 = _3000 * 6.283185482025146484375;
        float _3004 = sin(_3002);
        float _3006 = _3000 * 6.283185482025146484375;
        float _3008 = cos(_3006);
        float _3010 = fma(_3004, _2998, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3012 = _2994 * _3010;
        float _3014 = _3008 + (-1.0);
        float _3016 = fma(_2902, _3012, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3018 = fma(_2906, _3012, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3020 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3022 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3024 = _3016 + _3022;
        float _3026 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3028 = _3018 + _3026;
        float _3030 = fma(_2932, _3008, _3020);
        float _3032 = _3024 * _3024;
        float _3034 = _3028 * _3028;
        _2986 = _3030;
        _2972 = _3032;
        _2968 = _3034;
        _2976 = _3016;
        _2980 = _3018;
    }
    float _3036 = _2986;
    float _3038 = _2972;
    float _3040 = _2968;
    float _3042 = _2976;
    float _3044 = _2980;
    float _3046 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3048 = _3036 + _3046;
    float _3050 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2936);
    float _3052 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2940);
    float _3054 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2944);
    float _3056 = fma(_3048, _3048, _3038);
    float _3058 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2946);
    float _3060 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2948);
    float _3062 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2950);
    float _3064 = _3056 + _3040;
    float _3066 = _2872 * _2896;
    float _3068 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2916);
    float _3070 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2918);
    float _3072 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3074 = _2872 * _3050;
    float _3076 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2920);
    float _3078 = _2872 * _3052;
    float _3080 = _2872 * _3054;
    float _3082 = -_3058;
    float _3084 = _3066 * _3082;
    float _3086 = -_3060;
    float _3088 = _3066 * _3086;
    float _3090 = -_3062;
    float _3092 = _3066 * _3090;
    float _3094 = sqrt(_3064);
    float _3096 = fma(_3072, _3068, _3074);
    float _3098 = fma(_3072, _3070, _3078);
    float _3100 = fma(_3072, _3076, _3080);
    float _3102 = fma(_2896, _3050, _3084);
    float _3104 = _3058 + _3096;
    float _3106 = fma(_2896, _3052, _3088);
    float _3108 = fma(_2896, _3054, _3092);
    float _3110 = _3060 + _3098;
    float _3112 = _3062 + _3100;
    out.m_84.x = _3068;
    out.m_84.y = _3070;
    out.m_84.z = _3076;
    out.m_86.x = _3102;
    out.m_86.y = _3106;
    out.m_86.z = _3108;
    bool _3114 = _3094 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3116 = isnan(_3094);
    bool _3118 = _3114 || _3116;
    bool _3120 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3122 = _3118 || _3120;
    out.m_88.x = _3104;
    out.m_88.y = _3110;
    out.m_88.z = _3112;
    if (!_3122)
    {
        _2964 = 1.0;
    }
    float _3124 = _2964;
    bool _3126 = !_3122;
    float _3128 = _3124;
    if (!_3126)
    {
        bool _3130 = _3094 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3132 = isnan(_3094);
        bool _3134 = _3130 || _3132;
        bool _3136 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3138 = _3134 || _3136;
        if (!_3138)
        {
            float _3140 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3142 = _3094 + _3140;
            float _3144 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3146 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3144;
            float _3148 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3150 = _3148 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3152 = 1.0 / _3146;
            float _3154 = _3142 * _3152;
            float _3156 = fma(_3154, _3150, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3128 = _3156;
            _3158 = true;
        }
        else
        {
            bool _3160 = _3094 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3162 = isnan(_3094);
            bool _3164 = _3160 || _3162;
            bool _3166 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3168 = _3164 || _3166;
            if (!_3168)
            {
                float _3170 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3172 = _3094 + _3170;
                float _3174 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3176 = _3174 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3178 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3180 = _3178 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3182 = 1.0 / _3176;
                float _3184 = _3172 * _3182;
                float _3186 = fma(_3184, _3180, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3128 = _3186;
                _3158 = true;
            }
            else
            {
                _3128 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3158 = false;
    float _3188 = _3128;
    float _3190 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3192 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3194 = floor(_3190);
    float _3196 = floor(_3192);
    float _3198 = -_3194;
    float _3200 = _3190 + _3198;
    float _3202 = -_3196;
    float _3204 = _3192 + _3202;
    float2 _9482 = float2(_3200, _3204);
    float _3206 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9482, float2(0.0), isnan(_9482)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9482, float2(0.0), isnan(_9482)), level(0.0)).x;
    float _3208 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3210 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3212 = _3036 + _3210;
    float _3214 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3208);
    float _3216 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3218 = _3042 + _3216;
    float _3220 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _3222 = fma(_3212, _3188, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3224 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3214);
    float _3226 = _2666 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3228 = _2666 + _3220;
    float _3230 = _3224 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3232 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3226);
    float _3234 = -_2092;
    float _3236 = _3234 + _3222;
    float _3238 = _3228 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _3240 = 1.0 / _3230;
    float _3242 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3232);
    float _3244 = _3236 * _3236;
    float _3246 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[126].x, _3238);
    float _3248 = _3242 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3250 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[126].z, _3246);
    float _3252 = _3248 + _3230;
    float _3254 = _3250 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _3256 = fma(_3218, _3188, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3258 = trunc(_3254);
    int _3260 = int(_3258);
    float _3262 = _3252 * _3240;
    float _3264 = _3262 * 0.5;
    float _3266 = -_2116;
    float _3268 = _3266 + _3256;
    float _3270 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3272 = fma(_3264, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3270);
    float _3274 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3276 = _3044 + _3274;
    float _3278 = fma(_3268, _3268, _3244);
    float _3280 = fma(_3276, _3188, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3282 = 1.0 / _3272;
    float _3284 = -_2168;
    float _3286 = _3284 + _3280;
    int _3288 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _3290 = _3260 + _3288;
    int _3292 = _3290 + 1;
    float _3294 = fma(_3286, _3286, _3278);
    float _3296 = sqrt(_3294);
    float _3298 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3300 = _3282 * _3298;
    float _3302 = _3228 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _3304 = _3300 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _3306 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[127].x, _3302);
    bool _3308 = _3300 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _3310 = !_3304;
    int _3312 = _3310 ? 0 : 1;
    float _3314 = fma(_2682, (*spvDescriptorSet0.vp_c15)._m0[127].z, _3306);
    float _3316 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _3318 = 2;
    float _3320 = _3280;
    float _3322 = _3222;
    float _3324 = _3254;
    float _3326 = _3228;
    if (!_3304)
    {
        _3318 = 1;
    }
    int _3328 = _3318;
    float _3330 = trunc(_3316);
    int _3332 = int(_3330);
    int _3334 = _3328;
    if (!_3308)
    {
        _3334 = _3312;
    }
    int _3336 = _3334;
    bool _3338 = _3292 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _3340 = _3336 << 6;
    bool _3342 = _3296 > 0.0;
    int _3344 = _3340 + 96;
    uint _3346 = uint(int(uint(_3344) >> uint(2)));
    uint _3348 = uint(int(uint(int(_3346)) >> uint(2)));
    int _3350 = int(_3346) & 3;
    float _3352 = (*spvDescriptorSet0.vp_c15)._m0[int(_3348)][_3350];
    int _3354 = int(_3346) + 1;
    uint _3356 = uint(int(uint(_3354) >> uint(2)));
    int _3358 = _3354 & 3;
    float _3360 = (*spvDescriptorSet0.vp_c15)._m0[int(_3356)][_3358];
    int _3362 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _3364 = _3332 + _3362;
    int _3366 = _3364 + 1;
    int _3368 = _3340 + 104;
    uint _3370 = uint(int(uint(_3368) >> uint(2)));
    uint _3372 = uint(int(uint(int(_3370)) >> uint(2)));
    int _3374 = int(_3370) & 3;
    float _3376 = (*spvDescriptorSet0.vp_c15)._m0[int(_3372)][_3374];
    int _3378 = int(_3370) + 1;
    uint _3380 = uint(int(uint(_3378) >> uint(2)));
    int _3382 = _3378 & 3;
    float _3384 = (*spvDescriptorSet0.vp_c15)._m0[int(_3380)][_3382];
    int _3386 = _3292 | _3366;
    bool _3388 = _3386 < 0;
    bool _3390 = _3388 || _3338;
    int _3392 = _3340 + 48;
    uint _3394 = uint(int(uint(_3392) >> uint(2)));
    uint _3396 = uint(int(uint(int(_3394)) >> uint(2)));
    int _3398 = int(_3394) & 3;
    float _3400 = (*spvDescriptorSet0.vp_c15)._m0[int(_3396)][_3398];
    int _3402 = int(_3394) + 1;
    uint _3404 = uint(int(uint(_3402) >> uint(2)));
    int _3406 = _3402 & 3;
    float _3408 = (*spvDescriptorSet0.vp_c15)._m0[int(_3404)][_3406];
    bool _3410 = _3366 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _3412 = _3410 || _3390;
    int _3414 = _3340 + 56;
    uint _3416 = uint(int(uint(_3414) >> uint(2)));
    uint _3418 = uint(int(uint(int(_3416)) >> uint(2)));
    int _3420 = int(_3416) & 3;
    float _3422 = (*spvDescriptorSet0.vp_c15)._m0[int(_3418)][_3420];
    int _3424 = int(_3416) + 1;
    uint _3426 = uint(int(uint(_3424) >> uint(2)));
    int _3428 = _3424 & 3;
    float _3430 = (*spvDescriptorSet0.vp_c15)._m0[int(_3426)][_3428];
    int _3432 = _3340 + 64;
    uint _3434 = uint(int(uint(_3432) >> uint(2)));
    uint _3436 = uint(int(uint(int(_3434)) >> uint(2)));
    int _3438 = int(_3434) & 3;
    float _3440 = (*spvDescriptorSet0.vp_c15)._m0[int(_3436)][_3438];
    int _3442 = int(_3434) + 1;
    uint _3444 = uint(int(uint(_3442) >> uint(2)));
    int _3446 = _3442 & 3;
    float _3448 = (*spvDescriptorSet0.vp_c15)._m0[int(_3444)][_3446];
    float _3450 = _3296;
    if (!_3412)
    {
        float _3452 = floor(_3254);
        _3450 = _3452;
    }
    float _3454 = _3450;
    int _3456 = _3340 + 72;
    uint _3458 = uint(int(uint(_3456) >> uint(2)));
    uint _3460 = uint(int(uint(int(_3458)) >> uint(2)));
    int _3462 = int(_3458) & 3;
    float _3464 = (*spvDescriptorSet0.vp_c15)._m0[int(_3460)][_3462];
    int _3466 = int(_3458) + 1;
    uint _3468 = uint(int(uint(_3466) >> uint(2)));
    int _3470 = _3466 & 3;
    float _3472 = (*spvDescriptorSet0.vp_c15)._m0[int(_3468)][_3470];
    int _3474 = _3340 + 80;
    uint _3476 = uint(int(uint(_3474) >> uint(2)));
    uint _3478 = uint(int(uint(int(_3476)) >> uint(2)));
    int _3480 = int(_3476) & 3;
    float _3482 = (*spvDescriptorSet0.vp_c15)._m0[int(_3478)][_3480];
    int _3484 = int(_3476) + 1;
    uint _3486 = uint(int(uint(_3484) >> uint(2)));
    int _3488 = _3484 & 3;
    float _3490 = (*spvDescriptorSet0.vp_c15)._m0[int(_3486)][_3488];
    float _3492 = _3228 * _3360;
    float _3494 = fma(_2672, _3352, _3492);
    bool _3496 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3498 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3500 = _3496 || _3498;
    bool _3502 = isnan(0.5);
    bool _3504 = _3500 || _3502;
    float _3506 = fma(_2682, _3376, _3494);
    float _3508 = _3376;
    if (!_3342)
    {
        _3508 = _3256;
    }
    float _3510 = _3508;
    float _3512 = _3228 * _3408;
    bool _3514 = !_3342;
    float _3516 = _3510;
    if (!_3514)
    {
        float _3518 = _215 * _215;
        float _3520 = fma(_213, _213, _3518);
        float _3522 = fma(_217, _217, _3520);
        float _3524 = rsqrt(_3294);
        float _3526 = sqrt(_3522);
        float _3528 = _3268 * _3524;
        float _3530 = _3236 * _3524;
        float _3532 = _3286 * _3524;
        bool _3534 = _3526 > 0.0;
        float _3536 = _3524;
        if (!_3534)
        {
            _3536 = _3256;
        }
        float _3538 = _3536;
        bool _3540 = !_3534;
        _3516 = _3538;
        if (!_3540)
        {
            float _3542 = rsqrt(_3522);
            float _3544 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3546 = _215 * _3542;
            float _3548 = _213 * _3542;
            float _3550 = _217 * _3542;
            float _3552 = _3530 * _3546;
            float _3554 = fma(_3528, _3548, _3552);
            float _3556 = _3544 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3558 = fma(_3532, _3550, _3554);
            float _3560 = _3558 * _3556;
            float _3562 = fma(_213, _3560, _3256);
            float _3564 = fma(_215, _3560, _3222);
            float _3566 = fma(_217, _3560, _3280);
            _3516 = _3562;
            _3320 = _3566;
            _3322 = _3564;
        }
    }
    float _3568 = _3516;
    float _3570 = _3320;
    float _3572 = _3322;
    float _3574 = fma(_2672, _3400, _3512);
    float _3576 = _3506 + _3384;
    if (!_3412)
    {
        int _3578 = _3366 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _3580 = _3578 + _3292;
        _221 = _3580;
    }
    int _3582 = _221;
    float _3584 = _3228 * _3448;
    float _3586 = fma(_2682, _3422, _3574);
    float _3588 = -_2660;
    float _3590 = fma(_3588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3568);
    float _3592 = 1.0 / _3576;
    float _3594 = fma(_2672, _3440, _3584);
    float _3596 = _3590;
    if (!_3412)
    {
        int _3598 = _3582 << 2;
        _2662 = _3598;
    }
    int _3600 = _2662;
    float _3602 = -_2668;
    float _3604 = fma(_3602, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3570);
    float _3606 = -_2658;
    float _3608 = fma(_3606, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3572);
    float _3610 = fma(_2682, _3464, _3594);
    int _3612 = _3600;
    float _3614 = _3608;
    float _3616 = _3604;
    if (!_3412)
    {
        uint _3618 = uint(int(uint(_3582) >> uint(2)));
        _2752 = int(_3618);
    }
    int _3620 = _2752;
    if (!_3412)
    {
        int _3622 = 12 & _3600;
        _3612 = _3622;
    }
    int _3624 = _3612;
    if (!_3504)
    {
        float _3626 = _2678 * _2678;
        float _3628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3630 = -_2092;
        float _3632 = _3630 + _3572;
        float _3634 = -_2168;
        float _3636 = _3634 + _3570;
        float _3638 = fma(_2686, _2686, _3626);
        float _3640 = fma(_2696, _2696, _3638);
        float _3642 = 1.0 / _2784;
        float _3644 = sqrt(_3640);
        float _3646 = precise::min(_3644, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3648 = _3646 * _3628;
        float _3650 = _3648 * _3642;
        float _3652 = -_2116;
        float _3654 = _3652 + _3568;
        float _3656 = fma(_3632, _3650, _2666);
        float _3658 = fma(_3654, _3650, _2672);
        float _3660 = fma(_3636, _3650, _2682);
        _3614 = _3656;
        _3596 = _3658;
        _3616 = _3660;
    }
    float _3662 = _3614;
    float _3664 = _3596;
    float _3666 = _3616;
    if (!_3412)
    {
        int _3668 = _3620 << 4;
        int _3670 = _3668 + _3624;
        _2172 = as_type<float>(_3670);
    }
    float _3672 = _2172;
    int _3674 = _3340 + 88;
    uint _3676 = uint(int(uint(_3674) >> uint(2)));
    uint _3678 = uint(int(uint(int(_3676)) >> uint(2)));
    int _3680 = int(_3676) & 3;
    float _3682 = (*spvDescriptorSet0.vp_c15)._m0[int(_3678)][_3680];
    int _3684 = int(_3676) + 1;
    uint _3686 = uint(int(uint(_3684) >> uint(2)));
    int _3688 = _3684 & 3;
    float _3690 = (*spvDescriptorSet0.vp_c15)._m0[int(_3686)][_3688];
    float _3692 = _3586 + _3430;
    float _3694 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3696 = _3610 + _3472;
    float _3698 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3700 = _3692 * _3592;
    float _3702 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3694);
    float _3704 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3706 = _3672;
    float _3708 = _3700;
    if (!_3412)
    {
        int _3710 = as_type<int>(_3672) + 400;
        uint _3712 = uint(int(uint(_3710) >> uint(2)));
        uint _3714 = uint(int(uint(int(_3712)) >> uint(2)));
        int _3716 = int(_3712) & 3;
        float _3718 = (*spvDescriptorSet0.vp_c15)._m0[int(_3714)][_3716];
        _3706 = _3718;
    }
    float _3720 = _3706;
    float _3722 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3698);
    float _3724 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3702);
    bool _3726 = _3700 >= 0.0;
    float _3728 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3704);
    float _3730 = _3696 * _3592;
    float _3732 = _3662 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3734 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3722);
    float _3736 = _3724 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3738 = _3700 <= 1.0;
    bool _3740 = _3738 && _3726;
    float _3742 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3728);
    float _3744 = fma(_3664, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3732);
    float _3746 = _3734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3748 = _3736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3750 = _3730 >= 0.0;
    bool _3752 = _3750 && _3740;
    float _3754 = _3742 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3756 = fma(_3666, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3744);
    float _3758 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3748);
    bool _3760 = _3730 <= 1.0;
    bool _3762 = _3760 && _3752;
    float _3764 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3766 = _3754 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3768 = _3756 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3770 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3758);
    float _3772 = _3228 * _3490;
    float _3774 = -_3766;
    float _3776 = fma(_3774, _3764, 1.0);
    float _3778 = _3736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3780 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3770);
    float _3782 = _3736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3784 = log2(_3776);
    float _3786 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3778);
    float _3788 = fma(_2672, _3482, _3772);
    float _3790 = _3778;
    if (_3762)
    {
        float _3792 = float(_3336);
        _3790 = _3792;
    }
    float _3794 = _3790;
    float _3796 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3782);
    float _3798 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3786);
    if (!_3412)
    {
        float _3800 = -_3454;
        float _3802 = _3254 + _3800;
        _3324 = _3802;
    }
    float _3804 = _3324;
    float _3806 = 1.0 / _3780;
    float _3808 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3796);
    float _3810 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3798);
    float _3812 = fma(_2682, _3682, _3788);
    float _3814 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3808);
    float _3816 = _3568;
    if (!_3412)
    {
        float _3818 = floor(_3316);
        _3816 = _3818;
    }
    float _3820 = _3816;
    float _3822 = _3812 + _3690;
    float _3824 = _3784 * 0.693147182464599609375;
    float _3826 = _3822 * _3592;
    float _3828 = _3824 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3830 = _3794;
    float _3832 = _3824;
    if (_3762)
    {
        float _3834 = rint(_3794);
        float _3836 = precise::max(_3834, 0.0);
        uint _3838 = uint(_3836);
        uint _3840 = clamp(_3838, 0u, 65535u);
        _3830 = as_type<float>(_3840);
    }
    float _3842 = _3830;
    float _3844 = _3810 * _3806;
    float _3846 = _3814 * _3806;
    float _3848 = fma(_3844, 0.5, 0.5);
    float _3850 = fma(_3846, -0.5, 0.5);
    float _3852 = _3782;
    float _3854 = _3720;
    if (!_3412)
    {
        float _3856 = rint(_3720);
        float _3858 = precise::max(_3856, 0.0);
        uint _3860 = uint(_3858);
        uint _3862 = clamp(_3860, 0u, 65535u);
        _3852 = as_type<float>(_3862);
    }
    float _3864 = _3852;
    float _3866 = _3820;
    if (!_3412)
    {
        float _3868 = -_3820;
        float _3870 = _3316 + _3868;
        _3866 = _3870;
    }
    float _3872 = _3866;
    float _3874 = _3730;
    if (_3762)
    {
        float3 _10613 = float3(_3700, _3730, float(as_type<int>(_3842)));
        float3 _10617 = select(_10613, float3(0.0), isnan(_10613));
        float _3876 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _10617.xy, uint(rint(_10617.z)), _3826, level(0.0));
        _3874 = _3876;
    }
    float _3878 = _3874;
    float3 _10627 = float3(_3848, _3850, _3828);
    float _3880 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10627, float3(0.0), isnan(_10627)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10627, float3(0.0), isnan(_10627)), level(0.0)).x;
    float3 _10636 = float3(_3848, _3850, _3828);
    float4 _3883 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10636, float3(0.0), isnan(_10636)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10636, float3(0.0), isnan(_10636)), level(0.0)).xyzw;
    float _3885 = _3883.x;
    float _3887 = _3883.y;
    float _3889 = _3883.z;
    float _3891 = _3883.w;
    float _3893 = _3804;
    if (!_3412)
    {
        float3 _10659 = float3(_3804, _3872, float(as_type<int>(_3864)));
        float3 _10661 = select(_10659, float3(0.0), isnan(_10659));
        float _3895 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _10661.xy, uint(rint(_10661.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _10661.xy, uint(rint(_10661.z)), level(0.0)).x;
        _3893 = _3895;
    }
    float _3897 = _3893;
    if (_3412)
    {
        _3832 = 1.0;
    }
    float _3899 = _3832;
    float _3901 = _3897;
    float _3903 = _3899;
    float _3905 = _3887;
    float _3907 = _3885;
    if (!_3412)
    {
        int _3909 = _3582 << 4;
        int _3911 = _3909 + 2048;
        uint _3913 = uint(int(uint(_3911) >> uint(2)));
        uint _3915 = uint(int(uint(int(_3913)) >> uint(2)));
        int _3917 = int(_3913) & 3;
        float _3919 = (*spvDescriptorSet0.vp_c15)._m0[int(_3915)][_3917];
        int _3921 = int(_3913) + 1;
        uint _3923 = uint(int(uint(_3921) >> uint(2)));
        int _3925 = _3921 & 3;
        float _3927 = (*spvDescriptorSet0.vp_c15)._m0[int(_3923)][_3925];
        int _3929 = _3911 + 8;
        uint _3931 = uint(int(uint(_3929) >> uint(2)));
        uint _3933 = uint(int(uint(int(_3931)) >> uint(2)));
        int _3935 = int(_3931) & 3;
        float _3937 = (*spvDescriptorSet0.vp_c15)._m0[int(_3933)][_3935];
        int _3939 = int(_3931) + 1;
        uint _3941 = uint(int(uint(_3939) >> uint(2)));
        int _3943 = _3939 & 3;
        float _3945 = (*spvDescriptorSet0.vp_c15)._m0[int(_3941)][_3943];
        float _3947 = _3228 * _3927;
        float _3949 = fma(_2672, _3919, _3947);
        float _3951 = fma(_2682, _3937, _3949);
        float _3953 = _3951 + _3945;
        float _3955 = precise::clamp(_3953, 0.0, 1.0);
        float _3957 = -_3955;
        float _3959 = _3957 + _3897;
        float _3961 = fma(_3959, 500.0, 1.5);
        float _3963 = exp2(_3961);
        float _3965 = 0.0 + _3963;
        float _3967 = precise::clamp(_3965, 0.0, 1.0);
        _3901 = _3963;
        _3708 = _3927;
        _3854 = _3937;
        _3326 = _3955;
        _3903 = _3967;
    }
    float _3969 = _3901;
    float _3971 = _3708;
    float _3973 = _3854;
    float _3975 = _3326;
    float _3977 = _3903;
    float _3979 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3981 = _3662 + _3979;
    float _3983 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3985 = _3664 + _3983;
    float _3987 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3989 = _3666 + _3987;
    float _3991 = _3981 * _3981;
    float _3993 = fma(_3985, _3985, _3991);
    float _3995 = fma(_3989, _3989, _3993);
    float _3997 = rsqrt(_3995);
    float _3999 = _3997 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4001 = _3985 * _3999;
    float _4003 = _3989 * _3999;
    float _4005 = _4001 * _4001;
    float _4007 = _4003 * _4003;
    float _4009 = _4005 + _4007;
    float _4011 = sqrt(_4009);
    bool _4013 = _4011 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4017 = _4011 + _4015;
    float _4019 = _3997;
    float _4021 = _3973;
    float _4023 = _4017;
    float _4025 = _3969;
    float _4027 = _3981;
    float _4029 = _3975;
    float _4031 = _3999;
    if (_4013)
    {
        float _4033 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4019 = _4033;
    }
    float _4035 = _4019;
    if (_4013)
    {
        float _4037 = rsqrt(_4009);
        _4021 = _4037;
    }
    float _4039 = _4021;
    float _4041 = _4039;
    if (_4013)
    {
        float _4043 = _4017 * _4035;
        _4023 = _4043;
    }
    float _4045 = _4023;
    if (_4013)
    {
        float _4047 = _4045 * 0.15915493667125701904296875;
        _4025 = _4047;
    }
    float _4049 = _4025;
    float _4051 = _3989;
    if (_4013)
    {
        float _4053 = _4049 * 6.283185482025146484375;
        float _4055 = sin(_4053);
        _4051 = _4055;
    }
    float _4057 = _4051;
    float _4059 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4061 = precise::max(0.0, _4059);
    float _4063 = _3971;
    float _4065 = _4061;
    float _4067 = _4059;
    if (_4013)
    {
        float _4069 = _4049 * 6.283185482025146484375;
        float _4071 = cos(_4069);
        _4063 = _4071;
    }
    float _4073 = _4063;
    float _4075 = -_3999;
    float _4077 = -_4061;
    float _4079 = fma(_3981, _4075, _4077);
    if (!_4013)
    {
        _4027 = _4003;
    }
    float _4081 = _4027;
    float _4083 = _4081;
    if (_4013)
    {
        float _4085 = _4079 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4065 = _4085;
    }
    float _4087 = _4065;
    float _4089 = _4057;
    float _4091 = _4087;
    if (_4013)
    {
        float _4093 = fma(_4057, _4087, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4089 = _4093;
    }
    float _4095 = _4089;
    float _4097 = _4095;
    if (!_4013)
    {
        _4091 = _4001;
    }
    float _4099 = _4091;
    float _4101 = _4099;
    float _4103 = _4073;
    if (_4013)
    {
        float _4105 = _4073 + (-1.0);
        _4067 = _4105;
    }
    float _4107 = _4067;
    if (_4013)
    {
        float _4109 = _4039 * _4095;
        _4029 = _4109;
    }
    float _4111 = _4029;
    if (!_4013)
    {
        _4097 = _4079;
    }
    float _4113 = _4097;
    float _4115 = _4113;
    if (_4013)
    {
        float _4117 = _4107 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4031 = _4117;
    }
    float _4119 = _4031;
    if (_4013)
    {
        float _4121 = _4001 * _4111;
        _4101 = _4121;
    }
    float _4123 = _4101;
    if (!_4013)
    {
        _4041 = _4005;
    }
    float _4125 = _4041;
    float _4127 = _4125;
    if (_4013)
    {
        float _4129 = _4003 * _4111;
        _4083 = _4129;
    }
    float _4131 = _4083;
    if (_4013)
    {
        float _4133 = fma(_4079, _4073, _4119);
        _4115 = _4133;
    }
    float _4135 = _4115;
    if (_4013)
    {
        float _4137 = _4123 * _4123;
        _4127 = _4137;
    }
    float _4139 = _4127;
    if (!_4013)
    {
        _4103 = _4007;
    }
    float _4141 = _4103;
    float _4143 = sqrt(_3995);
    float _4145 = _4141;
    if (_4013)
    {
        float _4147 = _4131 * _4131;
        _4145 = _4147;
    }
    float _4149 = _4145;
    float _4151 = fma(_4135, _4135, _4139);
    float _4153 = _4151 + _4149;
    float _4155 = rsqrt(_4153);
    float _4157 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4159 = fma(_4143, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4157);
    float _4161 = precise::clamp(_4159, 0.0, 1.0);
    float _4163 = -_4161;
    float _4165 = _4163 + 1.0;
    float _4167 = _4155 * _4123;
    float _4169 = abs(_4165);
    float _4171 = log2(_4169);
    float _4173 = _4155 * _4135;
    float _4175 = _4155 * _4131;
    float _4177 = _4167 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4179 = -_4177;
    float _4181 = fma(_4173, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4179);
    float _4183 = -_4175;
    float _4185 = fma(_4183, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4181);
    float _4187 = fma(_4185, -0.5, 0.5);
    float _4189 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4191 = fma(_4185, 0.5, 0.5);
    float _4193 = _4173 + 1.0;
    float _4195 = sqrt(_4187);
    float _4197 = fma(_4191, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4199 = fma(_4191, _4197, -0.212114393711090087890625);
    float _4201 = exp2(_4189);
    float _4203 = fma(_4191, _4199, 1.570728778839111328125);
    float _4205 = _4195 * 0.636619746685028076171875;
    float _4207 = -_4203;
    float _4209 = fma(_4205, _4207, 1.0);
    float _4211 = -_4173;
    float _4213 = fma(_4201, _4193, _4211);
    float _4215 = fma(_4213, 0.5, 0.5);
    float2 _11144 = float2(_4209, _4215);
    float3 _4219 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11144, float2(0.0), isnan(_11144)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11144, float2(0.0), isnan(_11144)), level(0.0)).xyz;
    float _4221 = _4219.x;
    float _4223 = _4219.y;
    float _4225 = _4219.z;
    float _4227 = abs(_3300);
    float _4229 = log2(_4227);
    float _4231 = _3736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4233 = -_3206;
    float _4235 = _4233 + 1.0;
    out.m_90.x = _3664;
    out.m_90.y = _3662;
    out.m_90.z = _3666;
    float _4237 = fma(_3746, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4231);
    bool _4239 = _4143 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4241 = isnan(_4143);
    bool _4243 = _4239 || _4241;
    bool _4245 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4247 = _4243 || _4245;
    bool _4249 = _3300 <= 8000.0;
    bool _4251 = isnan(_3300);
    bool _4253 = _4249 || _4251;
    bool _4255 = isnan(8000.0);
    bool _4257 = _4253 || _4255;
    float _4259 = float(_4257);
    float _4261 = fma(_3754, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4237);
    float _4263 = _4229 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4265 = exp2(_4263);
    float _4267 = fma(_4265, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4269 = precise::clamp(_4267, 0.0, 1.0);
    float _4271 = _4171 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4273 = fma(_4269, -2.0, 3.0);
    float _4275 = _4269 * _4269;
    float _4277 = _4265;
    if (!_4247)
    {
        _4277 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4279 = _4277;
    float _4281 = exp2(_4271);
    float _4283 = _4275 * _4273;
    float _4285 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4261);
    float _4287 = -_4283;
    float _4289 = _4287 + 1.0;
    float _4291 = _4285 + _3780;
    float _4293 = fma(_4289, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4283);
    float _4295 = _4291 * 0.5;
    float _4297 = _4259 * _4293;
    float _4299 = _4293;
    float _4301 = _3810;
    float _4303 = _4279;
    float _4305 = _4279;
    if (!_3762)
    {
        _4299 = 1.0;
    }
    float _4307 = _4299;
    float _4309 = -_4281;
    float _4311 = _4309 + 1.0;
    float _4313 = _4307;
    if (_3762)
    {
        bool _4315 = _3878 >= _3826;
        bool _4317 = isnan(_3878);
        bool _4319 = _4315 || _4317;
        bool _4321 = isnan(_3826);
        bool _4323 = _4319 || _4321;
        float _4325 = float(_4323);
        _4313 = _4325;
    }
    float _4327 = _4313;
    float _4329 = _4297 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_92.z = _4295;
    out.m_92.w = _3780;
    float _4331 = _4311 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4333 = _4235 * _4329;
    float _4335 = precise::clamp(_4333, 0.0, 1.0);
    float _4337 = _4327 * _3977;
    float _4339 = _4331 * _3880;
    float _4341 = -_4331;
    float _4343 = _4341 + 1.0;
    float _4345 = -_4335;
    float _4347 = fma(_4345, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.gl_Position.x = _3810;
    out.gl_Position.y = _3814;
    out.gl_Position.z = _4285;
    out.gl_Position.w = _3780;
    float _4349 = _3891 * _4339;
    float _4351 = _4331;
    float _4353 = _4343;
    if (!_4247)
    {
        _4351 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4355 = _4351;
    float _4357 = -_4337;
    float _4359 = fma(_4357, _4347, 1.0);
    float _4361 = precise::clamp(_4359, 0.0, 1.0);
    float _4363 = _4361 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_94.x = _4363;
    float _4365 = _4355;
    float _4367 = _4355;
    if (!_4247)
    {
        _4301 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4369 = _4301;
    float _4371 = _4225 * _4339;
    float _4373 = fma(_4221, _4349, _3885);
    float _4375 = fma(_4223, _4349, _3887);
    float _4377 = _3891 * _4343;
    float _4379 = fma(_3891, _4371, _3889);
    float _4381 = _4369;
    float _4383 = _4369;
    if (!_4247)
    {
        _4353 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4385 = _4353;
    float _4387 = _4385;
    float _4389 = _4385;
    if (!_4247)
    {
        _3905 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4391 = _3905;
    out.m_96.x = _4373;
    out.m_96.y = _4375;
    out.m_96.z = _4379;
    out.m_96.w = _4377;
    float _4393 = _4391;
    float _4395 = _4391;
    if (!_4247)
    {
        _3907 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4397 = _3907;
    bool _4399 = !_4247;
    float _4401 = _4397;
    float _4403 = _4397;
    if (!_4399)
    {
        bool _4405 = _4143 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4407 = isnan(_4143);
        bool _4409 = _4405 || _4407;
        bool _4411 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4413 = _4409 || _4411;
        if (!_4413)
        {
            float _4415 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4417 = _4143 + _4415;
            float _4419 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4421 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4419;
            float _4423 = 1.0 / _4421;
            float _4425 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4427 = _4425 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4429 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4431 = _4429 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4433 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4435 = _4433 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4437 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4439 = _4437 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4441 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4443 = _4441 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4445 = _4417 * _4423;
            float _4447 = precise::clamp(_4445, 0.0, 1.0);
            float _4449 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4451 = _4449 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4453 = fma(_4447, _4427, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4455 = fma(_4447, _4451, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4457 = fma(_4447, _4431, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4459 = fma(_4447, _4435, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4461 = fma(_4447, _4439, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4463 = fma(_4447, _4443, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4305 = _4455;
            _4403 = _4461;
            _4383 = _4453;
            _4395 = _4459;
            _4389 = _4457;
            _4367 = _4463;
            _4465 = true;
        }
        else
        {
            bool _4467 = _4143 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4469 = isnan(_4143);
            bool _4471 = _4467 || _4469;
            bool _4473 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4475 = _4471 || _4473;
            if (!_4475)
            {
                _4381 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4477 = _4381;
            _4383 = _4477;
            if (!_4475)
            {
                _4303 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4479 = _4303;
            _4305 = _4479;
            if (!_4475)
            {
                _4387 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4481 = _4387;
            _4389 = _4481;
            if (!_4475)
            {
                _4393 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4483 = _4393;
            _4395 = _4483;
            if (!_4475)
            {
                _4401 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4485 = _4401;
            _4403 = _4485;
            if (!_4475)
            {
                _4365 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4487 = _4365;
            bool _4489 = !_4475;
            _4367 = _4487;
            if (!_4489)
            {
                bool _4491 = _4143 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4493 = isnan(_4143);
                bool _4495 = _4491 || _4493;
                bool _4497 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4499 = _4495 || _4497;
                if (!_4499)
                {
                    float _4501 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4503 = _4143 + _4501;
                    float _4505 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4507 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4505;
                    float _4509 = 1.0 / _4507;
                    float _4511 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4513 = _4511 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4515 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4517 = _4515 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4519 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4521 = _4519 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4523 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4525 = _4523 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4527 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4529 = _4527 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4531 = _4503 * _4509;
                    float _4533 = precise::clamp(_4531, 0.0, 1.0);
                    float _4535 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4537 = _4535 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4539 = fma(_4533, _4513, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4541 = fma(_4533, _4537, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4543 = fma(_4533, _4517, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4545 = fma(_4533, _4521, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4547 = fma(_4533, _4525, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4549 = fma(_4533, _4529, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4305 = _4541;
                    _4403 = _4547;
                    _4383 = _4539;
                    _4395 = _4545;
                    _4389 = _4543;
                    _4367 = _4549;
                    _4465 = true;
                }
                else
                {
                    _4305 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4403 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4383 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4395 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4389 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4367 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4465 = false;
    float _4551 = _4305;
    float _4553 = _4403;
    float _4555 = _4383;
    float _4557 = _4395;
    float _4559 = _4389;
    float _4561 = _4367;
    float _4563 = fma(_3110, -0.5, 0.5);
    float _4565 = precise::clamp(_4563, 0.0, 1.0);
    float _4567 = -_4551;
    float _4569 = _4567 + _4553;
    float _4571 = -_4555;
    float _4573 = _4571 + _4557;
    float _4575 = -_4559;
    float _4577 = _4575 + _4561;
    bool _4579 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4581 = fma(_4565, _4569, _4551);
    float _4583 = fma(_4565, _4573, _4555);
    float _4585 = fma(_4565, _4577, _4559);
    float _4587 = _4581 * 0.586610972881317138671875;
    out.m_98.x = 0.0;
    float _4589 = fma(_4583, 0.298911988735198974609375, _4587);
    float _4591 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4593 = fma(_4585, 0.114477999508380889892578125, _4589);
    out.m_61.x = _4591;
    float _4595 = -_4593;
    float _4597 = _4583 + _4595;
    float _4599 = -_4593;
    float _4601 = _4581 + _4599;
    float _4603 = -_4593;
    float _4605 = _4585 + _4603;
    float _4607 = fma(_4597, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4593);
    float _4609 = fma(_4601, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4593);
    float _4611 = fma(_4605, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4593);
    out.m_100.x = _4607;
    out.m_100.y = _4609;
    out.m_100.z = _4611;
    if (!_4579)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4613 = -_3662;
    float _4615 = _4613 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4617 = -_3664;
    float _4619 = _4617 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4621 = -_3666;
    float _4623 = _4621 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4625 = _4615 * _4615;
    float _4627 = fma(_4619, _4619, _4625);
    float _4629 = fma(_4623, _4623, _4627);
    float _4631 = sqrt(_4629);
    float _4633 = rsqrt(_4629);
    float _4635 = -_4631;
    float _4637 = _4635 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4639 = _4637 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4641 = precise::clamp(_4639, 0.0, 1.0);
    float _4643 = _4619 * _4633;
    float _4645 = _4615 * _4633;
    float _4647 = abs(_4641);
    float _4649 = log2(_4647);
    float _4651 = _4623 * _4633;
    float _4653 = _4643 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4655 = _3110 * _4645;
    float _4657 = -_4645;
    float _4659 = -_4653;
    float _4661 = fma(_4657, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4659);
    float _4663 = fma(_3104, _4643, _4655);
    float _4665 = -_4651;
    float _4667 = fma(_4665, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4661);
    float _4669 = fma(_3112, _4651, _4663);
    float _4671 = precise::clamp(_4669, 0.0, 1.0);
    float _4673 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4675 = _4667 + _4673;
    float _4677 = _4649 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4679 = _4675 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4681 = precise::clamp(_4679, 0.0, 1.0);
    float _4683 = exp2(_4677);
    float _4685 = _4683 * _4681;
    float _4687 = _4671 * _4685;
    float _4689 = _4687 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4691 = _4687 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4693 = _4687 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_98.x = _4689;
    out.m_98.y = _4691;
    out.m_98.z = _4693;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

