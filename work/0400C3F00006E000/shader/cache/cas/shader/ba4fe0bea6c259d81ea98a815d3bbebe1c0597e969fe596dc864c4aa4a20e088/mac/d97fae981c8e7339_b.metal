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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_16 [[id(8)]];
    sampler vp_t_tcb_16Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d_array<float> vp_t_tcb_14 [[id(14)]];
    sampler vp_t_tcb_14Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_14Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_80 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_96 [[user(locn7)]];
    float4 m_94 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_90 [[user(locn10)]];
    float4 m_100 [[user(locn11)]];
    float4 m_59 [[user(locn12)]];
    float4 m_98 [[user(locn13)]];
    float4 m_84 [[user(locn14)]];
    float4 m_106 [[user(locn15)]];
    float4 m_102 [[user(locn16)]];
    float4 m_104 [[user(locn17)]];
    float4 m_82 [[user(locn18)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_66 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _7627 = false;
    bool _1421 = false;
    bool _1263 = false;
    bool _1121 = false;
    bool _839 = false;
    bool _545 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _7926 = as_type<float>(_141);
        out.gl_Position.z = _7926;
    }
    if (!_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_61.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_155)
    {
        float _161 = float(_125);
        _135 = _161;
    }
    float _163 = _135;
    bool _165 = _159 >= _163;
    bool _167 = !_155;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_59.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _143 = as_type<int>(_175);
    }
    int _177 = _143;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7995 = as_type<float>(_177);
        out.gl_Position.z = _7995;
    }
    if (_169)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_66.w;
    float _183 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _185 = in.m_56.x;
    float _187 = in.m_56.y;
    float _189 = in.m_56.z;
    float _191 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _183);
    float _193 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _191);
    float _197 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _193);
    float _199 = sqrt(_195);
    int _201 = as_type<int>(_179) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_179) & 2;
    bool _207 = _205 != 0;
    float _209 = in.m_61.x;
    float _211 = in.m_61.y;
    float _213 = in.m_61.z;
    bool _215 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _219 = _215 || _217;
    bool _221 = isnan(1.0);
    bool _223 = _219 || _221;
    bool _225 = !_203;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _231 = !_207;
    float _233 = _231 ? (-0.5) : 0.5;
    float _235 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _229);
    float _237 = _159 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _239 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _197);
    float _241 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _235);
    float _243 = _235;
    float _245 = _195;
    float _247 = _197;
    float _249 = _237;
    bool _251 = _223;
    if (!_223)
    {
        float _253 = _237 * _237;
        float _255 = _253 * 0.5;
        _243 = _255;
    }
    float _257 = _243;
    float _259 = _257;
    if (!_223)
    {
        float _261 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _261;
    }
    float _263 = _259;
    bool _265 = !_223;
    float _267 = _263;
    if (!_265)
    {
        float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = log2(_269);
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = _237 * _271;
        float _281 = 1.0 / _275;
        float _283 = _277 * 0.693147182464599609375;
        float _285 = exp2(_279);
        float _287 = 1.0 / _283;
        float _289 = _285 + (-1.0);
        float _291 = -_289;
        float _293 = fma(_291, _287, _237);
        float _295 = _293 * _281;
        float _297 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _287;
        _267 = _297;
        _247 = _285;
    }
    float _299 = _245;
    float _301 = _267;
    float _303 = _247;
    bool _305 = !_223;
    float _307 = _299;
    float _309 = _303;
    if (!_305)
    {
        float _311 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = log2(_311);
        float _315 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _317 = _315 + 1.0;
        float _319 = 1.0 / _317;
        float _321 = _237 * _313;
        float _323 = exp2(_321);
        float _325 = -_323;
        float _327 = _325 + 1.0;
        float _329 = _327 * _319;
        _307 = _323;
        _309 = _317;
        _249 = _329;
    }
    float _331 = _307;
    float _333 = _309;
    float _335 = _249;
    float _337 = _331;
    float _339 = _333;
    if (!_223)
    {
        float _341 = _159 * _159;
        float _343 = _341 * 0.5;
        _337 = _343;
    }
    float _345 = _337;
    float _347 = _345;
    if (!_223)
    {
        _339 = _159;
    }
    float _349 = _339;
    float _351 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _353 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _355 = _349;
    if (!_223)
    {
        float _357 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _347 = _357;
    }
    float _359 = _347;
    bool _361 = !_223;
    float _363 = _359;
    if (!_361)
    {
        float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _367 = log2(_365);
        float _369 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _371 = _369 + 1.0;
        float _373 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _375 = _159 * _367;
        float _377 = 1.0 / _371;
        float _379 = _373 * 0.693147182464599609375;
        float _381 = exp2(_375);
        float _383 = 1.0 / _379;
        float _385 = _381 + (-1.0);
        float _387 = -_385;
        float _389 = fma(_387, _383, _159);
        float _391 = _389 * _377;
        float _393 = _391 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _363 = _393;
    }
    float _395 = _363;
    bool _397 = !_223;
    if (!_397)
    {
        float _399 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _401 = log2(_399);
        float _403 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _405 = _403 + 1.0;
        float _407 = 1.0 / _405;
        float _409 = _159 * _401;
        float _411 = exp2(_409);
        float _413 = -_411;
        float _415 = _413 + 1.0;
        float _417 = _415 * _407;
        _355 = _417;
    }
    float _419 = _355;
    float _421 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _423 = _395 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _425 = fma(_335, _209, _351);
    float _427 = fma(_335, _211, _353);
    float _429 = fma(_335, _213, _421);
    float _431 = _395 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _433 = fma(_419, _211, _423);
    float _435 = fma(_427, _181, _187);
    float _437 = sqrt(_239);
    float _439 = _395 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _441 = fma(_419, _209, _431);
    float _443 = -_433;
    float _445 = _427 + _443;
    float _447 = fma(_425, _181, _185);
    float _449 = fma(_419, _213, _439);
    float _451 = -_441;
    float _453 = _425 + _451;
    float _455 = _445 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _457 = sqrt(_241);
    float _459 = -_449;
    float _461 = _429 + _459;
    float _463 = _445 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _465 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[14].y, _455);
    float _467 = _445 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _469 = _445 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _471 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[14].x, _463);
    float _473 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[16].y, _465);
    float _475 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[14].z, _467);
    float _477 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[14].w, _469);
    float _479 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[16].x, _471);
    float _481 = _437 * _473;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _485 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[16].z, _475);
    float _487 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[16].w, _477);
    float _489 = _481 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _491 = _481 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _493 = _199 * _479;
    float _495 = _481 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _497 = _457 * _485;
    float _499 = fma(_429, _181, _189);
    float _501 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[24].x, _489);
    float _503 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[25].x, _491);
    float _505 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[26].x, _495);
    float _507 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[24].z, _501);
    float _509 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[25].z, _503);
    float _511 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[26].z, _505);
    float _513 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[24].w, _507);
    float _515 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[25].w, _509);
    float _517 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[26].w, _511);
    bool _519 = !_483;
    float _521 = _515;
    float _523 = _513;
    float _525 = _517;
    float _543;
    if (!_519)
    {
        float _527 = in.m_68.x;
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _531 = _527 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_125);
        float _549 = 1.0 / _547;
        float _551 = _159 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _557 = _553 + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _567;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _575 = 1.0 / _561;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _577;
    float _581 = 1.0 / _569;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _585 = _553 + _583;
    bool _587 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _589 = 1.0 / _565;
    float _591 = _585 * _575;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _595 = _553 + _593;
    bool _597 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _599 = isnan(_553);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    bool _609 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _611 = isnan(_553);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = 1.0 / _573;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _625 = _553 + _623;
    float _627 = _595 * _581;
    bool _629 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _631 = isnan(_553);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = 1.0 / _579;
    float _643 = _557 * _589;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _647 = _553 + _645;
    float _649 = -_639;
    float _651 = _649 + 1.0;
    float _653 = _625 * _621;
    float _655 = -_607;
    float _657 = _655 + 1.0;
    float _659 = _619 * _651;
    bool _661 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _663 = isnan(_553);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = _639 * _657;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _675;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _679;
    float _683 = _647 * _641;
    bool _685 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _687 = isnan(_553);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -_619;
    float _699 = _697 + 1.0;
    float _701 = fma(_677, _591, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _703 = fma(_681, _591, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _705 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _707 = isnan(_553);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = _695 * _699;
    float _719 = -_695;
    float _721 = _719 + 1.0;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _731 = _671 * _721;
    float _733 = -_671;
    float _735 = _733 + 1.0;
    float _737 = -_715;
    float _739 = _737 + 1.0;
    float _741 = fma(_725, _643, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _743 = fma(_729, _643, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _745 = _715 * _735;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _747;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _751;
    float _755 = _701 * _745;
    float _757 = _703 * _745;
    float _759 = fma(_749, _627, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _761 = fma(_753, _627, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _763 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[143].x, _755);
    float _765 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[143].y, _757);
    float _767 = in.m_66.x;
    float _769 = in.m_66.y;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _775 = fma(_741, _731, _763);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _781 = fma(_743, _731, _765);
    float _783 = fma(_773, _653, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _785;
    float _789 = fma(_759, _717, _775);
    float _791 = fma(_779, _653, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _793;
    float _797 = fma(_761, _717, _781);
    float _799 = fma(_787, _683, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _801 = fma(_783, _659, _789);
    float _803 = fma(_795, _683, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _805 = fma(_791, _659, _797);
    float _807 = fma(_799, _673, _801);
    float _809 = fma(_803, _673, _805);
    float _811 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[148].x, _807);
    float _813 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[148].y, _809);
    float _815 = _811 * _767;
    float _817 = _813 * _769;
    bool _819 = !_587;
    float _837;
    if (!_819)
    {
        float _821 = in.m_68.x;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _825 = _821 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[11].x, _159);
        float _829 = _827 * _823;
        float _831 = floor(_829);
        float _833 = -_831;
        float _835 = _829 + _833;
        _837 = _835;
        _839 = true;
    }
    else
    {
        float _841 = float(_125);
        float _843 = 1.0 / _841;
        float _845 = _159 * _843;
        _837 = _845;
    }
    _839 = false;
    float _847 = _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _851 = _847 + _849;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _855 = _847 + _853;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _859 = _847 + _857;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _877 = 1.0 / _863;
    bool _879 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _881 = 1.0 / _867;
    bool _883 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _885 = isnan(_847);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = 1.0 / _871;
    float _897 = _855 * _877;
    bool _899 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _901 = isnan(_847);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = 1.0 / _875;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _915 = _847 + _913;
    float _917 = _915 * _881;
    bool _919 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _921 = isnan(_847);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = _851 * _895;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _933;
    float _937 = -_929;
    float _939 = _937 + 1.0;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _941;
    float _945 = _893 * _939;
    float _947 = _859 * _911;
    bool _949 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _951 = isnan(_847);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _961;
    float _965 = -_893;
    float _967 = _965 + 1.0;
    bool _969 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _971 = isnan(_847);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    float _981 = fma(_943, _931, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _983 = -_959;
    float _985 = _983 + 1.0;
    float _987 = fma(_935, _931, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _989 = fma(_963, _931, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _991 = _959 * _967;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _997 = _979 * _985;
    float _999 = -_979;
    float _1001 = _999 + 1.0;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1011 = fma(_995, _947, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1013 = _909 * _1001;
    float _1015 = fma(_1005, _947, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1017 = fma(_1009, _947, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1019 = -_909;
    float _1021 = _1019 + 1.0;
    float _1023 = _981 * _1013;
    float _1025 = _987 * _1013;
    float _1027 = _989 * _1013;
    float _1029 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1023);
    float _1031 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1025);
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1033;
    float _1037 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1027);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1039;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1043;
    float _1047 = fma(_1015, _997, _1029);
    float _1049 = fma(_1017, _997, _1031);
    float _1051 = fma(_1011, _997, _1037);
    float _1053 = fma(_1041, _897, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1055 = fma(_1035, _897, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1057 = fma(_1045, _897, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1065 = _1063 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1069 = _1067 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1071 = fma(_1053, _991, _1047);
    float _1073 = fma(_1061, _917, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1075 = fma(_1065, _917, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1077 = fma(_1069, _917, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1079 = fma(_1055, _991, _1049);
    float _1081 = fma(_1057, _991, _1051);
    float _1083 = fma(_1073, _945, _1071);
    float _1085 = fma(_1075, _945, _1079);
    float _1087 = fma(_1077, _945, _1081);
    float _1089 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1083);
    float _1091 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1085);
    float _1093 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1087);
    bool _1095 = !_879;
    float _1097 = _897;
    float _1099 = _1091;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1119;
    if (!_1095)
    {
        float _1103 = in.m_68.x;
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1107 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[11].y, _159);
        float _1111 = _1109 * _1105;
        float _1113 = floor(_1111);
        float _1115 = -_1113;
        float _1117 = _1111 + _1115;
        _1119 = _1117;
        _1121 = true;
    }
    else
    {
        float _1123 = float(_125);
        float _1125 = 1.0 / _1123;
        float _1127 = _159 * _1125;
        _1119 = _1127;
    }
    _1121 = false;
    float _1129 = _1119;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1133 = _1129 + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1139 = _1129 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1141 = isnan(_1129);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1155 = _1129 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1157 = isnan(_1129);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1167;
    bool _1171 = _1129 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1173 = isnan(_1129);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = 1.0 / _1137;
    float _1185 = -_1149;
    float _1187 = _1185 + 1.0;
    bool _1189 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1191 = 1.0 / _1153;
    float _1193 = _1169 * _1183;
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1197 = _1195 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1199 = fma(_1193, _1133, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1201 = _1165 * _1187;
    float _1203 = -_1181;
    float _1205 = _1203 + 1.0;
    float _1207 = -_1165;
    float _1209 = _1207 + 1.0;
    float _1211 = _1197 * _1191;
    float _1213 = _1199 * _1201;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1217 = _1129 + _1215;
    float _1219 = _1149 * _1205;
    float _1221 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1223 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1213);
    float _1225 = fma(_1211, _1217, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1227 = _1093 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1229 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1231 = fma(_1225, _1219, _1223);
    float _1233 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1235 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1231);
    float _1239 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1241 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _1229;
    out.m_70.y = _1239;
    out.m_70.z = _1235;
    out.m_70.w = _1241;
    bool _1243 = !_1189;
    float _1261;
    if (!_1243)
    {
        float _1245 = in.m_68.x;
        float _1247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1249 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[11].w, _159);
        float _1253 = _1251 * _1247;
        float _1255 = floor(_1253);
        float _1257 = -_1255;
        float _1259 = _1253 + _1257;
        _1261 = _1259;
        _1263 = true;
    }
    else
    {
        float _1265 = float(_125);
        float _1267 = 1.0 / _1265;
        float _1269 = _159 * _1267;
        _1261 = _1269;
    }
    _1263 = false;
    float _1271 = _1261;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1275 = _1271 + _1273;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1279 = _1277 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1281 = _1271 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1283 = isnan(_1271);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1295 = _1293 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1297 = _1271 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1299 = isnan(_1271);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1305 = _1301 || _1303;
    float _1307 = float(_1305);
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1309;
    bool _1313 = _1271 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1315 = isnan(_1271);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    float _1325 = 1.0 / _1279;
    float _1327 = -_1291;
    float _1329 = _1327 + 1.0;
    bool _1331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1333 = 1.0 / _1295;
    float _1335 = _1311 * _1325;
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1341 = fma(_1335, _1275, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1343 = _1307 * _1329;
    float _1345 = -_1323;
    float _1347 = _1345 + 1.0;
    float _1349 = -_1307;
    float _1351 = _1349 + 1.0;
    float _1353 = _1339 * _1333;
    float _1355 = _1341 * _1343;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1359 = _1271 + _1357;
    float _1361 = _1291 * _1347;
    float _1363 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1355);
    float _1365 = fma(_1353, _1359, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1367 = fma(_1365, _1361, _1363);
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1375 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1367);
    float _1377 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1379 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1381 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1383 = _1375 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _1377;
    out.m_72.y = _1379;
    out.m_72.z = _1381;
    out.m_72.w = _1383;
    bool _1385 = !_1331;
    float _1387 = _1371;
    float _1389 = _1383;
    float _1391 = _1381;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1395 = _1375;
    float _1397 = _1355;
    bool _1399 = _1331;
    float _1417;
    float _1419;
    if (!_1385)
    {
        float _1401 = in.m_68.x;
        float _1403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1405 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[14].x, _159);
        float _1409 = _1407 * _1403;
        float _1411 = floor(_1409);
        float _1413 = -_1411;
        float _1415 = _1409 + _1413;
        _1417 = _1409;
        _1387 = _1411;
        _1419 = _1415;
        _1421 = true;
    }
    else
    {
        float _1423 = float(_125);
        float _1425 = 1.0 / _1423;
        float _1427 = _159 * _1425;
        _1417 = _1425;
        _1419 = _1427;
    }
    _1421 = false;
    float _1429 = _1417;
    float _1431 = _1387;
    float _1433 = _1419;
    float _1435 = in.m_68.w;
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1439 = _1437 != 0;
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1443 = _1441 != 0;
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1447 = _1445 != 0;
    int _1449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1451 = _1449 != 0;
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1455 = _1453 != 0;
    float _1457 = _1429;
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _1461 = _1433;
    if (_1439)
    {
        float _1463 = in.m_68.x;
        _1457 = _1463;
    }
    float _1465 = _1457;
    if (!_1439)
    {
        _1097 = _233;
    }
    float _1467 = _1097;
    float _1469 = _1431;
    float _1471 = _1467;
    if (_1443)
    {
        float _1473 = in.m_68.z;
        _1469 = _1473;
    }
    float _1475 = _1469;
    if (!_1443)
    {
        _1389 = _227;
    }
    float _1477 = _1389;
    float _1479 = 0.0;
    float _1481 = _1477;
    if (_1455)
    {
        _1479 = 1.0;
    }
    float _1483 = _1479;
    float _1485 = _1483;
    if (!_1447)
    {
        _1391 = _233;
    }
    float _1487 = _1391;
    float _1489 = _1373;
    float _1491 = _1487;
    if (_1447)
    {
        float _1493 = in.m_68.w;
        _1489 = _1493;
    }
    float _1495 = _1489;
    float _1497 = 0.0;
    if (_1455)
    {
        _1497 = 1.0;
    }
    float _1499 = _1497;
    float _1501 = 0.0;
    float _1503 = _1499;
    if (_1455)
    {
        _1501 = 1.0;
    }
    float _1505 = _1501;
    int _1507 = 0;
    float _1509 = _1505;
    if (_1455)
    {
        _1507 = 0;
    }
    int _1511 = _1507;
    int _1513 = _1511;
    if (_1455)
    {
        _1459 = 0;
    }
    int _1515 = _1459;
    float _1517 = _1465;
    int _1519 = _1515;
    if (_1439)
    {
        float _1521 = _1465 * 3.1415927410125732421875;
        _1517 = _1521;
    }
    float _1523 = _1517;
    float _1525 = _1523;
    if (_1439)
    {
        float _1527 = _1523 * 0.15915493667125701904296875;
        _1393 = _1527;
    }
    float _1529 = _1393;
    if (_1443)
    {
        float _1531 = _1475 * 3.1415927410125732421875;
        _1525 = _1531;
    }
    float _1533 = _1525;
    if (_1447)
    {
        float _1535 = _1495 * 3.1415927410125732421875;
        _1395 = _1535;
    }
    float _1537 = _1395;
    float _1539 = _1537;
    if (_1443)
    {
        float _1541 = _1533 * 0.15915493667125701904296875;
        _1397 = _1541;
    }
    float _1543 = _1397;
    float _1545 = _1529;
    if (_1439)
    {
        float _1547 = _1529 * 6.283185482025146484375;
        float _1549 = sin(_1547);
        _1545 = _1549;
    }
    float _1551 = _1545;
    float _1553 = _1533;
    float _1555 = _1475;
    float _1557 = _1495;
    if (_1455)
    {
        float _1559 = in.m_68.x;
        float _1561 = in.m_68.y;
        float _1563 = in.m_68.z;
        _1553 = _1559;
        _1555 = _1561;
        _1557 = _1563;
    }
    float _1565 = _1553;
    float _1567 = _1555;
    float _1569 = _1557;
    if (_1447)
    {
        float _1571 = _1537 * 0.15915493667125701904296875;
        _1539 = _1571;
    }
    float _1573 = _1539;
    float _1575 = _1543;
    if (_1443)
    {
        float _1577 = _1543 * 6.283185482025146484375;
        float _1579 = sin(_1577);
        _1575 = _1579;
    }
    float _1581 = _1575;
    float _1583 = _1573;
    if (_1447)
    {
        float _1585 = _1573 * 6.283185482025146484375;
        float _1587 = sin(_1585);
        _1583 = _1587;
    }
    float _1589 = _1583;
    float _1591 = _1551;
    if (_1439)
    {
        bool _1593 = _1551 > 0.5;
        _1399 = _1593;
    }
    bool _1595 = _1399;
    bool _1597 = _1595;
    if (_1439)
    {
        float _1599 = -_233;
        float _1601 = _1595 ? _1599 : _233;
        _1471 = _1601;
    }
    float _1603 = _1471;
    float _1605 = _1567;
    float _1607 = _1565;
    float _1609 = _1569;
    if (_1455)
    {
        _1591 = _1565;
    }
    float _1611 = _1591;
    float _1613 = _1611;
    if (_1443)
    {
        bool _1615 = _1581 > 0.5;
        _251 = _1615;
    }
    bool _1617 = _251;
    int _1619 = int(_1595);
    int _1621 = _1447 ? 2 : 0;
    int _1623 = _1619 | _1621;
    int _1625 = _1617 ? 4 : 0;
    int _1627 = _1623 | _1625;
    int _1629 = _1443 ? 8 : 0;
    int _1631 = _1627 | _1629;
    int _1633 = _1455 ? 16 : 0;
    int _1635 = _1631 | _1633;
    int _1637 = _1451 ? 32 : 0;
    int _1639 = _1635 | _1637;
    int _1641 = false ? 64 : 0;
    int _1643 = _1639 | _1641;
    int _1645 = _1643 & 32;
    if (_1455)
    {
        _1099 = _1611;
    }
    float _1647 = _1099;
    float _1649 = _1647;
    if (_1447)
    {
        bool _1651 = _1589 > 0.5;
        _1597 = _1651;
    }
    bool _1653 = _1597;
    int _1655 = 0;
    if (_1455)
    {
        _1655 = as_type<int>(_1611);
    }
    int _1657 = _1655;
    int _1659 = _1657;
    if (_1455)
    {
        _1101 = as_type<int>(_1567);
    }
    int _1661 = _1101;
    int _1663 = 0;
    int _1665 = _1661;
    if (_1455)
    {
        _1663 = as_type<int>(_1569);
    }
    int _1667 = _1663;
    int _1669 = _1667;
    if (!_1455)
    {
        float _1671 = in.m_68.x;
        float _1673 = in.m_68.y;
        float _1675 = in.m_68.z;
        float _1677 = _1671 * 3.1415927410125732421875;
        float _1679 = _1677 * 0.15915493667125701904296875;
        float _1681 = _1673 * 3.1415927410125732421875;
        float _1683 = _1681 * 0.15915493667125701904296875;
        float _1685 = _1675 * 3.1415927410125732421875;
        float _1687 = _1679 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        float _1691 = _1685 * 0.15915493667125701904296875;
        float _1693 = _1683 * 6.283185482025146484375;
        float _1695 = sin(_1693);
        float _1697 = _1691 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        _1605 = _1673;
        _1649 = _1675;
        _1509 = 5.839270114898681640625;
        _1607 = _1671;
        _1609 = _1675;
        _1613 = _1673;
        _1503 = 1.2345600128173828125;
        _1485 = 7.345489978790283203125;
        _1519 = 2;
        _1513 = 1;
        _1665 = as_type<int>(_1695);
        _1659 = as_type<int>(_1689);
        _1669 = as_type<int>(_1699);
    }
    float _1701 = _1605;
    float _1703 = _1649;
    float _1705 = _1509;
    float _1707 = _1607;
    float _1709 = _1609;
    float _1711 = _1613;
    float _1713 = _1503;
    float _1715 = _1485;
    int _1717 = _1519;
    int _1719 = _1513;
    int _1721 = _1665;
    int _1723 = _1659;
    int _1725 = _1669;
    float _1727 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1729 = int(_1727);
    int _1731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1733 = _1731 != 0;
    bool _1735 = _1701 > 0.5;
    float _1737 = _1703 * _1705;
    float _1739 = _1701 + _1707;
    if (_1443)
    {
        float _1741 = -_227;
        float _1743 = _1617 ? _1741 : _227;
        _1481 = _1743;
    }
    float _1745 = _1481;
    float _1747 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1749 = int(_1747);
    if (_1447)
    {
        float _1751 = -_233;
        float _1753 = _1653 ? _1751 : _233;
        _1491 = _1753;
    }
    float _1755 = _1491;
    float _1757 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1761 = _1759 != 0;
    int _1763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1765 = _1763 != 0;
    int _1767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1769 = _1767 != 0;
    float _1771 = _1701 + _1709;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1775 = _1773 != 0;
    float _1777 = _1707 + _1709;
    bool _1779 = _1709 > 0.5;
    float _1781 = _817 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1783 = float(_1729);
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1787 = _1785 != 0;
    float _1789 = -_227;
    int _1791 = _1735 ? as_type<int>(_1789) : as_type<int>(_227);
    float _1793 = 1.0 / _1783;
    bool _1795 = !_1775;
    int _1797 = _1795 ? 0 : 1;
    float _1799 = float(uint(_1749));
    int _1801 = ~_1749;
    int _1803 = _1801 + 1;
    float _1805 = -_233;
    int _1807 = _1779 ? as_type<int>(_1805) : as_type<int>(_233);
    float _1809 = 1.0 / _1799;
    bool _1811 = _1435 > 0.5;
    int _1813 = int(_1811);
    int _1815 = _1779 ? 2 : 0;
    int _1817 = _1813 | _1815;
    int _1819 = _1617 ? 4 : 0;
    int _1821 = _1817 | _1819;
    int _1823 = _1761 ? 8 : 0;
    int _1825 = _1821 | _1823;
    int _1827 = _1765 ? 16 : 0;
    int _1829 = _1825 | _1827;
    int _1831 = _1769 ? 32 : 0;
    int _1833 = _1829 | _1831;
    int _1835 = _1735 ? 64 : 0;
    int _1837 = _1833 | _1835;
    int _1839 = _1837 & 64;
    bool _1841 = !_1765;
    float _1843 = _1841 ? _227 : as_type<float>(_1791);
    bool _1845 = !_1769;
    float _1847 = _1845 ? _233 : as_type<float>(_1807);
    float _1849 = _159 * _1793;
    float _1851 = -_233;
    int _1853 = _1811 ? as_type<int>(_1851) : as_type<int>(_233);
    int _1855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1857 = _1855 != 0;
    int _1859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1861 = _1859 != 0;
    int _1863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1865 = _1863 != 0;
    float _1867 = trunc(_1849);
    int _1869 = int(_1867);
    int _1871 = int(_1811);
    int _1873 = _1779 ? 2 : 0;
    int _1875 = _1871 | _1873;
    int _1877 = _1617 ? 4 : 0;
    int _1879 = _1875 | _1877;
    int _1881 = _1761 ? 8 : 0;
    int _1883 = _1879 | _1881;
    int _1885 = _1857 ? 16 : 0;
    int _1887 = _1883 | _1885;
    int _1889 = _1861 ? 32 : 0;
    int _1891 = _1887 | _1889;
    int _1893 = _1865 ? 64 : 0;
    int _1895 = _1891 | _1893;
    int _1897 = _1895 & 2;
    bool _1899 = !_1761;
    float _1901 = _1899 ? _233 : as_type<float>(_1853);
    int _1903 = as_type<int>(_1809) + (-2);
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1907 = _1905 != 0;
    int _1909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1911 = _1909 != 0;
    int _1913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1915 = _1913 != 0;
    int _1917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1919 = _1917 != 0;
    int _1921 = ~_1749;
    int _1923 = _1921 + 1;
    float _1925 = float(_125);
    bool _1927 = !_1911;
    int _1929 = _1927 ? 0 : 1;
    float _1931 = 1.0 / _1925;
    float _1933 = float(uint(_1869));
    float _1935 = float(_1869);
    bool _1937 = !_1857;
    int _1939 = _1937 ? 0 : 1;
    float _1941 = as_type<float>(_1903) * _1933;
    bool _1943 = _1749 == 0;
    bool _1945 = !_1861;
    int _1947 = _1945 ? 0 : 1;
    bool _1949 = !_1865;
    int _1951 = _1949 ? 0 : 1;
    float _1953 = trunc(_1941);
    float _1955 = precise::max(_1953, 0.0);
    uint _1958 = uint(_1955);
    int _1960 = abs(_1947);
    int _1962 = abs(_1951);
    int _1964 = _1803 * int(_1958);
    int _1966 = _1964 + _1869;
    float _1968 = float(uint(_1966));
    float _1970 = as_type<float>(_1903) * _1968;
    float _1972 = trunc(_1970);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    int _1978 = int(_1958) + int(_1976);
    float _1980 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1982 = int(_1980);
    int _1984 = _1923 * _1978;
    int _1986 = _1984 + _1869;
    bool _1988 = uint(_1986) >= uint(_1749);
    float _1990 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1992 = int(_1990);
    bool _1994 = !_1988;
    int _1996 = _1994 ? 0 : (-1);
    float _1998 = float(_1982);
    int _2000 = ~_1978;
    int _2002 = _2000 + _1996;
    int _2004 = _2002 + 1;
    float _2006 = 1.0 / _1998;
    float _2008 = float(uint(_1992));
    int _2010 = ~_1992;
    int _2012 = _2010 + 1;
    float _2014 = 1.0 / _2008;
    float _2016 = float(_1992);
    bool _2018 = _1992 == 0;
    float _2020 = _159 * _2006;
    float _2022 = _1711 * _1713;
    bool _2024 = !_1733;
    int _2026 = _2024 ? 0 : 1;
    float _2028 = _1711 * _1715;
    float _2030 = trunc(_2020);
    int _2032 = int(_2030);
    int _2034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2036 = _2034 != 0;
    int _2038 = as_type<int>(_2014) + (-2);
    int _2040 = abs(_2026);
    bool _2042 = !_2036;
    int _2044 = _2042 ? 0 : 1;
    int _2046 = ~_1992;
    int _2048 = _2046 + 1;
    int _2050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2052 = _2050 != 0;
    bool _2054 = !_2052;
    int _2056 = _2054 ? 0 : 1;
    float _2058 = float(uint(_2032));
    int _2060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2062 = _2060 != 0;
    float _2064 = as_type<float>(_2038) * _2058;
    float _2066 = trunc(_2064);
    float _2068 = precise::max(_2066, 0.0);
    uint _2070 = uint(_2068);
    int _2072 = _2012 * int(_2070);
    int _2074 = _2072 + _2032;
    float _2076 = float(uint(_2074));
    float _2078 = as_type<float>(_2038) * _2076;
    float _2080 = trunc(_2078);
    float _2082 = precise::max(_2080, 0.0);
    uint _2084 = uint(_2082);
    float _2086 = floor(_2022);
    int _2088 = int(_2070) + int(_2084);
    float _2090 = float(_1749);
    int _2092 = _2048 * _2088;
    int _2094 = _2092 + _2032;
    float _2096 = -_2086;
    float _2098 = _2022 + _2096;
    bool _2100 = uint(_2094) >= uint(_1992);
    float _2102 = _1707 * _1715;
    float _2104 = _2098 * _2016;
    bool _2106 = !_2100;
    int _2108 = _2106 ? 0 : (-1);
    float _2110 = floor(_2102);
    int _2112 = ~_2088;
    int _2114 = _2112 + _2108;
    int _2116 = _2114 + 1;
    int _2118 = _1992 * _2116;
    int _2120 = _2118 + _2032;
    float _2122 = trunc(_2104);
    int _2124 = int(_2122);
    bool _2126 = !_2018;
    int _2128 = _2126 ? _2120 : (-1);
    float _2130 = -_2110;
    float _2132 = _2102 + _2130;
    bool _2134 = _1935 >= _2090;
    bool _2136 = isnan(_1935);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan(_2090);
    bool _2142 = _2138 || _2140;
    float _2144 = float(_2142);
    float _2146 = float(_2032);
    float _2148 = _2132 * _2090;
    bool _2150 = _2146 >= _2016;
    bool _2152 = isnan(_2146);
    bool _2154 = _2150 || _2152;
    bool _2156 = isnan(_2016);
    bool _2158 = _2154 || _2156;
    float _2160 = float(_2158);
    float _2162 = trunc(_2148);
    int _2164 = int(_2162);
    float _2166 = _159 * _1931;
    float _2168 = _2166 * _2090;
    float _2170 = _2166 * _2016;
    float _2172 = trunc(_2144);
    int _2174 = int(_2172);
    int _2176 = _1749 * _2004;
    int _2178 = _2176 + _1869;
    bool _2180 = !_1915;
    int _2182 = _2180 ? 0 : 1;
    bool _2184 = !_1943;
    int _2186 = _2184 ? _2178 : (-1);
    float _2188 = trunc(_2160);
    int _2190 = int(_2188);
    int _2192 = _2164 * _2040;
    int _2194 = _2192 + _1869;
    int _2196 = _1749 + (-1);
    bool _2198 = !_1907;
    int _2200 = _2198 ? 0 : 1;
    int _2202 = ~_2174;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    float _2208 = trunc(_2168);
    int _2210 = int(_2208);
    int _2212 = abs(_2200);
    int _2214 = _2186 * _2206;
    int _2216 = abs(_2044);
    int _2218 = ~_2190;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    int _2224 = _2174 * _2196;
    int _2226 = _2224 + _2214;
    float _2228 = trunc(_2170);
    int _2230 = int(_2228);
    int _2232 = abs(_1939);
    int _2234 = _2128 * _2222;
    int _2236 = abs(_1929);
    int _2238 = _1992 + (-1);
    int _2240 = _2226 * _1960;
    int _2242 = _2190 * _2238;
    int _2244 = _2242 + _2234;
    int _2246 = ~_1992;
    int _2248 = _2246 + 1;
    int _2250 = _2210 * _2232;
    int _2252 = _2250 + _2240;
    int _2254 = _2124 * _2216;
    int _2256 = _2254 + _2032;
    int _2258 = abs(_1797);
    int _2260 = _2244 * _2236;
    bool _2262 = !_1919;
    int _2264 = _2262 ? 0 : 1;
    int _2266 = abs(_2182);
    int _2268 = _2230 * _2212;
    int _2270 = _2268 + _2260;
    int _2272 = abs(_2264);
    int _2274 = _2194 * _1962;
    int _2276 = _2274 + _2252;
    int _2278 = _2256 * _2266;
    int _2280 = _2278 + _2270;
    int _2282 = _2164 * _2258;
    int _2284 = _2282 + _2276;
    int _2286 = _2124 * _2272;
    int _2288 = _2286 + _2280;
    float _2290 = float(uint(_2284));
    float _2292 = float(uint(_2288));
    float _2294 = as_type<float>(_1903) * _2290;
    float _2296 = as_type<float>(_2038) * _2292;
    int _2298 = ~_1749;
    int _2300 = _2298 + 1;
    float _2302 = trunc(_2294);
    float _2304 = precise::max(_2302, 0.0);
    uint _2306 = uint(_2304);
    float _2308 = trunc(_2296);
    float _2310 = precise::max(_2308, 0.0);
    uint _2312 = uint(_2310);
    int _2314 = _2300 * int(_2306);
    int _2316 = _2314 + _2284;
    float _2318 = float(uint(_2316));
    int _2320 = _2248 * int(_2312);
    int _2322 = _2320 + _2288;
    float _2324 = as_type<float>(_1903) * _2318;
    float _2326 = float(uint(_2322));
    float _2328 = trunc(_2324);
    float _2330 = precise::max(_2328, 0.0);
    uint _2332 = uint(_2330);
    int _2334 = ~_1749;
    int _2336 = _2334 + 1;
    float _2338 = as_type<float>(_2038) * _2326;
    float _2340 = trunc(_2338);
    float _2342 = precise::max(_2340, 0.0);
    uint _2344 = uint(_2342);
    int _2346 = int(_2306) + int(_2332);
    int _2348 = ~_1992;
    int _2350 = _2348 + 1;
    int _2352 = _2336 * _2346;
    int _2354 = _2352 + _2284;
    int _2356 = int(_2312) + int(_2344);
    float _2358 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _2360 = int(_2358);
    bool _2362 = uint(_2354) >= uint(_1749);
    int _2364 = _2350 * _2356;
    int _2366 = _2364 + _2288;
    bool _2368 = !_2362;
    int _2370 = _2368 ? 0 : (-1);
    bool _2372 = uint(_2366) >= uint(_1992);
    float _2374 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2376 = int(_2374);
    int _2378 = ~_2346;
    int _2380 = _2378 + _2370;
    int _2382 = _2380 + 1;
    bool _2384 = !_2372;
    int _2386 = _2384 ? 0 : (-1);
    int _2388 = _1749 * _2382;
    int _2390 = _2388 + _2284;
    float _2392 = float(_2360);
    int _2394 = ~_2356;
    int _2396 = _2394 + _2386;
    int _2398 = _2396 + 1;
    bool _2400 = !_1943;
    int _2402 = _2400 ? _2390 : (-1);
    float _2404 = 1.0 / _2392;
    int _2406 = _1992 * _2398;
    int _2408 = _2406 + _2288;
    int _2410 = _2402 & 3;
    bool _2412 = _2410 != 0;
    int _2414 = _2402 & 3;
    bool _2416 = _2414 != 0;
    bool _2418 = !_2018;
    int _2420 = _2418 ? _2408 : (-1);
    int _2422 = _2412 ? 0 : 1;
    int _2424 = _2420 & 3;
    bool _2426 = _2424 != 0;
    float _2428 = float(uint(_2376));
    int _2430 = _2426 ? 0 : 1;
    float _2432 = _159 * _2404;
    bool _2434 = uint(_2414) > 1u;
    float _2436 = 1.0 / _2428;
    int _2438 = int(_2434);
    int _2440 = _2416 ? 2 : 0;
    int _2442 = _2438 | _2440;
    int _2444 = _1915 ? 4 : 0;
    int _2446 = _2442 | _2444;
    int _2448 = _1919 ? 8 : 0;
    int _2450 = _2446 | _2448;
    int _2452 = _1943 ? 16 : 0;
    int _2454 = _2450 | _2452;
    int _2456 = _2018 ? 32 : 0;
    int _2458 = _2454 | _2456;
    int _2460 = _1865 ? 64 : 0;
    int _2462 = _2458 | _2460;
    int _2464 = _2462 & 2;
    int _2466 = _2420 & 3;
    bool _2468 = _2466 != 0;
    int _2470 = ~_2422;
    int _2472 = _2470 + 1;
    int _2474 = _2472 + 1;
    int _2476 = int(_2434);
    int _2478 = _2468 ? 2 : 0;
    int _2480 = _2476 | _2478;
    int _2482 = _1915 ? 4 : 0;
    int _2484 = _2480 | _2482;
    int _2486 = _1919 ? 8 : 0;
    int _2488 = _2484 | _2486;
    int _2490 = _1943 ? 16 : 0;
    int _2492 = _2488 | _2490;
    int _2494 = _2018 ? 32 : 0;
    int _2496 = _2492 | _2494;
    int _2498 = _1865 ? 64 : 0;
    int _2500 = _2496 | _2498;
    int _2502 = _2500 & 2;
    float _2504 = trunc(_2432);
    int _2506 = int(_2504);
    int _2508 = ~_2376;
    int _2510 = _2508 + 1;
    int _2512 = _2474;
    float _2514 = as_type<float>(_2502);
    float _2516 = as_type<float>(_2464);
    float _2518 = as_type<float>(_2256);
    float _2520 = as_type<float>(_2376);
    if (!_2434)
    {
        int _2522 = ~_2422;
        int _2524 = _2522 + 1;
        _2512 = _2524;
    }
    int _2526 = _2512;
    bool _2528 = uint(_2466) > 1u;
    int _2530 = as_type<int>(_2436) + (-2);
    int _2532 = ~_2430;
    int _2534 = _2532 + 1;
    int _2536 = _2534 + 1;
    float _2538 = float(uint(_2506));
    float _2540 = float(_2506);
    int _2542 = _2536;
    if (!_2528)
    {
        int _2544 = ~_2430;
        int _2546 = _2544 + 1;
        _2542 = _2546;
    }
    int _2548 = _2542;
    float _2550 = as_type<float>(_2530) * _2538;
    int _2552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2554 = _2552 != 0;
    float _2556 = trunc(_2550);
    float _2558 = precise::max(_2556, 0.0);
    uint _2560 = uint(_2558);
    int _2562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2564 = _2562 != 0;
    int _2566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2568 = _2566 != 0;
    int _2570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2572 = _2570 != 0;
    bool _2574 = !_2554;
    int _2576 = _2574 ? 0 : 1;
    bool _2578 = !_2568;
    int _2580 = _2578 ? 0 : 1;
    bool _2582 = _1839 != 0;
    int _2584 = ~_2376;
    int _2586 = _2584 + 1;
    int _2588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2590 = _2588 != 0;
    int _2592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2594 = _2592 != 0;
    int _2596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2598 = _2596 != 0;
    int _2600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2602 = _2600 != 0;
    bool _2604 = !_2564;
    int _2606 = _2604 ? 0 : 1;
    int _2608 = _2586 * int(_2560);
    int _2610 = _2608 + _2506;
    bool _2612 = !_2590;
    int _2614 = _2612 ? 0 : 1;
    bool _2616 = _2376 == 0;
    float _2618 = float(uint(_2610));
    float _2620 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2622 = int(_2620);
    bool _2624 = !_2572;
    int _2626 = _2624 ? 0 : 1;
    float _2628 = as_type<float>(_2530) * _2618;
    int _2630 = abs(_2580);
    int _2632 = abs(_2576);
    bool _2634 = !_2602;
    int _2636 = _2634 ? 0 : 1;
    float _2638 = trunc(_2628);
    float _2640 = precise::max(_2638, 0.0);
    uint _2642 = uint(_2640);
    bool _2644 = !_2594;
    int _2646 = _2644 ? 0 : 1;
    bool _2648 = !_2598;
    int _2650 = _2648 ? 0 : 1;
    int _2652 = abs(_2646);
    int _2654 = ~_2622;
    int _2656 = _2654 + 1;
    bool _2658 = _2622 == 0;
    bool _2660 = _1992 == 0;
    int _2662 = int(_2560) + int(_2642);
    float _2664 = float(uint(_2622));
    int _2666 = _2510 * _2662;
    int _2668 = _2666 + _2506;
    bool _2670 = uint(_2668) >= uint(_2376);
    float _2672 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _2674 = int(_2672);
    bool _2676 = !_2670;
    int _2678 = _2676 ? 0 : (-1);
    int _2680 = ~_2662;
    int _2682 = _2680 + _2678;
    int _2684 = _2682 + 1;
    int _2686 = _2376 * _2684;
    int _2688 = _2686 + _2506;
    float _2690 = float(_2674);
    float _2692 = 1.0 / _2664;
    bool _2694 = !_2616;
    int _2696 = _2694 ? _2688 : (-1);
    float _2698 = 1.0 / _2690;
    int _2700 = ~_2622;
    int _2702 = _2700 + 1;
    int _2704 = as_type<int>(_2692) + (-2);
    float _2706 = _159 * _2698;
    float _2708 = trunc(_2706);
    int _2710 = int(_2708);
    float _2712 = float(uint(_2710));
    float _2714 = as_type<float>(_2704) * _2712;
    float _2716 = trunc(_2714);
    float _2718 = precise::max(_2716, 0.0);
    uint _2720 = uint(_2718);
    int _2722 = _2656 * int(_2720);
    int _2724 = _2722 + _2710;
    float _2726 = float(_2376);
    float _2728 = float(uint(_2724));
    bool _2730 = _2540 >= _2726;
    bool _2732 = isnan(_2540);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan(_2726);
    bool _2738 = _2734 || _2736;
    float _2740 = float(_2738);
    float _2742 = as_type<float>(_2704) * _2728;
    float _2744 = trunc(_2740);
    int _2746 = int(_2744);
    float _2748 = trunc(_2742);
    float _2750 = precise::max(_2748, 0.0);
    uint _2752 = uint(_2750);
    int _2754 = int(_2720) + int(_2752);
    float _2756 = floor(_1737);
    int _2758 = _2702 * _2754;
    int _2760 = _2758 + _2710;
    bool _2762 = uint(_2760) >= uint(_2622);
    bool _2764 = !_2762;
    int _2766 = _2764 ? 0 : (-1);
    float _2768 = -_2756;
    float _2770 = _1737 + _2768;
    int _2772 = _2376 + (-1);
    int _2774 = ~_2754;
    int _2776 = _2774 + _2766;
    int _2778 = _2776 + 1;
    float _2780 = _2770 * _2726;
    float _2782 = _2166 * _2726;
    int _2784 = ~_2746;
    int _2786 = _2784 + 1;
    int _2788 = _2786 + 1;
    float _2790 = trunc(_2780);
    int _2792 = int(_2790);
    int _2794 = _2696 * _2788;
    int _2796 = abs(_2056);
    bool _2798 = !_2062;
    int _2800 = _2798 ? 0 : 1;
    int _2802 = _2746 * _2772;
    int _2804 = _2802 + _2794;
    float _2806 = trunc(_2782);
    int _2808 = int(_2806);
    int _2810 = abs(_2606);
    bool _2812 = _1717 != 2;
    int _2814 = abs(_2626);
    int _2816 = _2804 * _2630;
    int _2818 = _2792 * _2796;
    int _2820 = _2818 + _2506;
    int _2822 = _2808 * _2810;
    int _2824 = _2822 + _2816;
    int _2826 = ~_2376;
    int _2828 = _2826 + 1;
    int _2830 = _2820 * _2814;
    int _2832 = _2830 + _2824;
    int _2834 = ~_2376;
    int _2836 = _2834 + 1;
    int _2838 = _2792 * _2632;
    int _2840 = _2838 + _2832;
    float _2842 = float(uint(_2840));
    float _2844 = as_type<float>(_2530) * _2842;
    float _2846 = trunc(_2844);
    float _2848 = precise::max(_2846, 0.0);
    uint _2850 = uint(_2848);
    float _2852 = floor(_2028);
    int _2854 = _2836 * int(_2850);
    int _2856 = _2854 + _2840;
    float _2858 = float(uint(_2856));
    float _2860 = -_2852;
    float _2862 = _2028 + _2860;
    int _2864 = _2622 + (-1);
    float _2866 = as_type<float>(_2530) * _2858;
    float _2868 = trunc(_2866);
    float _2870 = precise::max(_2868, 0.0);
    uint _2872 = uint(_2870);
    int _2874 = int(_2850) + int(_2872);
    float _2876 = float(_2622);
    int _2878 = _2828 * _2874;
    int _2880 = _2878 + _2840;
    float _2882 = _2862 * _2876;
    float _2884 = _2166 * _2876;
    bool _2886 = uint(_2880) >= uint(_2376);
    float _2888 = float(_2710);
    float _2890 = trunc(_2882);
    int _2892 = int(_2890);
    bool _2894 = !_2886;
    int _2896 = _2894 ? 0 : (-1);
    bool _2898 = _2888 >= _2876;
    bool _2900 = isnan(_2888);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan(_2876);
    bool _2906 = _2902 || _2904;
    float _2908 = float(_2906);
    int _2910 = _2622 * _2778;
    int _2912 = _2910 + _2710;
    int _2914 = ~_2874;
    int _2916 = _2914 + _2896;
    int _2918 = _2916 + 1;
    float _2920 = trunc(_2884);
    int _2922 = int(_2920);
    bool _2924 = !_2658;
    int _2926 = _2924 ? _2912 : (-1);
    float _2928 = trunc(_2908);
    int _2930 = int(_2928);
    int _2932 = ~_2930;
    int _2934 = _2932 + 1;
    int _2936 = _2934 + 1;
    int _2938 = _2926 * _2936;
    int _2940 = abs(_2800);
    int _2942 = _2930 * _2864;
    int _2944 = _2942 + _2938;
    int _2946 = abs(_2614);
    int _2948 = _2892 * _2940;
    int _2950 = _2948 + _2710;
    int _2952 = abs(_2650);
    int _2954 = _2944 * _2652;
    int _2956 = abs(_2636);
    int _2958 = _2922 * _2946;
    int _2960 = _2958 + _2954;
    int _2962 = ~_2622;
    int _2964 = _2962 + 1;
    int _2966 = _2950 * _2952;
    int _2968 = _2966 + _2960;
    int _2970 = _2892 * _2956;
    int _2972 = _2970 + _2968;
    int _2974 = ~_2622;
    int _2976 = _2974 + 1;
    float _2978 = float(uint(_2972));
    float _2980 = as_type<float>(_2704) * _2978;
    float _2982 = trunc(_2980);
    float _2984 = precise::max(_2982, 0.0);
    uint _2986 = uint(_2984);
    int _2988 = _2976 * int(_2986);
    int _2990 = _2988 + _2972;
    float _2992 = float(uint(_2990));
    float _2994 = as_type<float>(_2704) * _2992;
    float _2996 = trunc(_2994);
    float _2998 = precise::max(_2996, 0.0);
    uint _3000 = uint(_2998);
    int _3002 = int(_2986) + int(_3000);
    int _3004 = _2964 * _3002;
    int _3006 = _3004 + _2972;
    bool _3008 = uint(_3006) >= uint(_2622);
    int _3010 = _2376 * _2918;
    int _3012 = _3010 + _2840;
    int _3014 = ~_2376;
    int _3016 = _3014 + 1;
    bool _3018 = !_3008;
    int _3020 = _3018 ? 0 : (-1);
    bool _3022 = !_2616;
    int _3024 = _3022 ? _3012 : (-1);
    int _3026 = ~_3002;
    int _3028 = _3026 + _3020;
    int _3030 = _3028 + 1;
    int _3032 = _3024 & 3;
    bool _3034 = _3032 != 0;
    int _3036 = _3024 & 3;
    bool _3038 = _3036 != 0;
    int _3040 = _2622 * _3030;
    int _3042 = _3040 + _2972;
    int _3044 = _3034 ? 0 : 1;
    int _3046 = ~_1749;
    int _3048 = _3046 + 1;
    bool _3050 = !_2658;
    int _3052 = _3050 ? _3042 : (-1);
    int _3054 = ~_3044;
    int _3056 = _3054 + 1;
    int _3058 = _3056 + 1;
    int _3060 = _3052 & 3;
    bool _3062 = _3060 != 0;
    int _3064 = _3062 ? 0 : 1;
    bool _3066 = uint(_3036) > 1u;
    int _3068 = _3058;
    if (!_3066)
    {
        int _3070 = ~_3044;
        int _3072 = _3070 + 1;
        _3068 = _3072;
    }
    int _3074 = _3068;
    int _3076 = _3052 & 3;
    bool _3078 = _3076 != 0;
    int _3080 = ~_3064;
    int _3082 = _3080 + 1;
    int _3084 = _3082 + 1;
    bool _3086 = uint(_3076) > 1u;
    int _3088 = _3084;
    if (!_3086)
    {
        int _3090 = ~_3064;
        int _3092 = _3090 + 1;
        _3088 = _3092;
    }
    int _3094 = _3088;
    bool _3096 = uint(_2414) >= 2u;
    int _3098 = _3096 ? 0 : 1;
    bool _3100 = uint(_2466) >= 2u;
    int _3102 = ~_3098;
    int _3104 = _3102 + 1;
    int _3106 = _3104 + 1;
    int _3108 = _3100 ? 0 : 1;
    bool _3110 = _2414 != 3;
    int _3112 = ~_3108;
    int _3114 = _3112 + 1;
    int _3116 = _3114 + 1;
    int _3118 = _3106;
    int _3120 = _3116;
    if (_3110)
    {
        int _3122 = ~_3098;
        int _3124 = _3122 + 1;
        _3118 = _3124;
    }
    int _3126 = _3118;
    bool _3128 = _2466 != 3;
    if (_3128)
    {
        int _3130 = ~_3108;
        int _3132 = _3130 + 1;
        _3120 = _3132;
    }
    int _3134 = _3120;
    bool _3136 = uint(_3036) >= 2u;
    int _3138 = _3136 ? 0 : 1;
    bool _3140 = uint(_3076) >= 2u;
    int _3142 = ~_3138;
    int _3144 = _3142 + 1;
    int _3146 = _3144 + 1;
    int _3148 = _3140 ? 0 : 1;
    bool _3150 = _3036 != 3;
    int _3152 = ~_3148;
    int _3154 = _3152 + 1;
    int _3156 = _3154 + 1;
    int _3158 = _3146;
    int _3160 = _3156;
    if (_3150)
    {
        int _3162 = ~_3138;
        int _3164 = _3162 + 1;
        _3158 = _3164;
    }
    int _3166 = _3158;
    bool _3168 = _3076 != 3;
    float _3170 = -_233;
    int _3172 = _2582 ? as_type<int>(_3170) : as_type<int>(_233);
    bool _3174 = _2464 != 0;
    if (_3168)
    {
        int _3176 = ~_3148;
        int _3178 = _3176 + 1;
        _3160 = _3178;
    }
    int _3180 = _3160;
    float _3182 = float(uint(_2194));
    float _3184 = as_type<float>(_1903) * _3182;
    float _3186 = trunc(_3184);
    float _3188 = precise::max(_3186, 0.0);
    uint _3190 = uint(_3188);
    int _3192 = _3048 * int(_3190);
    int _3194 = _3192 + _2194;
    float _3196 = float(uint(_3194));
    int _3198 = ~_1749;
    int _3200 = _3198 + 1;
    float _3202 = as_type<float>(_1903) * _3196;
    float _3204 = trunc(_3202);
    float _3206 = precise::max(_3204, 0.0);
    uint _3208 = uint(_3206);
    int _3210 = ~_2376;
    int _3212 = _3210 + 1;
    int _3214 = int(_3190) + int(_3208);
    float _3216 = float(uint(_2256));
    int _3218 = ~_1992;
    int _3220 = _3218 + 1;
    int _3222 = _3200 * _3214;
    int _3224 = _3222 + _2194;
    float _3226 = as_type<float>(_2038) * _3216;
    bool _3228 = uint(_3224) >= uint(_1749);
    float _3230 = trunc(_3226);
    float _3232 = precise::max(_3230, 0.0);
    uint _3234 = uint(_3232);
    bool _3236 = !_3228;
    int _3238 = _3236 ? 0 : (-1);
    int _3240 = ~_3214;
    int _3242 = _3240 + _3238;
    int _3244 = _3242 + 1;
    int _3246 = _1749 * _3244;
    int _3248 = _3246 + _2194;
    float _3250 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3252 = _3250 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _3254 = _3220 * int(_3234);
    int _3256 = _3254 + _2256;
    float _3258 = 1.0 / _3252;
    float _3260 = float(uint(_3256));
    int _3262 = ~_1992;
    int _3264 = _3262 + 1;
    float _3266 = as_type<float>(_2038) * _3260;
    float _3268 = trunc(_3266);
    float _3270 = precise::max(_3268, 0.0);
    uint _3272 = uint(_3270);
    int _3274 = int(_3234) + int(_3272);
    float _3276 = float(uint(_2820));
    float _3278 = as_type<float>(_2530) * _3276;
    int _3280 = _3264 * _3274;
    int _3282 = _3280 + _2256;
    float _3284 = trunc(_3278);
    float _3286 = precise::max(_3284, 0.0);
    uint _3288 = uint(_3286);
    bool _3290 = uint(_3282) >= uint(_1992);
    bool _3292 = !_3290;
    int _3294 = _3292 ? 0 : (-1);
    int _3296 = ~_2622;
    int _3298 = _3296 + 1;
    int _3300 = ~_3274;
    int _3302 = _3300 + _3294;
    int _3304 = _3302 + 1;
    int _3306 = _3212 * int(_3288);
    int _3308 = _3306 + _2820;
    int _3310 = _1992 * _3304;
    int _3312 = _3310 + _2256;
    float _3314 = _1707 * 2.0;
    float _3316 = float(uint(_3308));
    float _3318 = floor(_3314);
    float _3320 = as_type<float>(_2530) * _3316;
    float _3322 = float(uint(_2950));
    float _3324 = as_type<float>(_2704) * _3322;
    float _3326 = trunc(_3320);
    float _3328 = precise::max(_3326, 0.0);
    uint _3330 = uint(_3328);
    float _3332 = trunc(_3324);
    float _3334 = precise::max(_3332, 0.0);
    uint _3336 = uint(_3334);
    int _3338 = int(_3288) + int(_3330);
    bool _3340 = !_2660;
    int _3342 = _3340 ? _3312 : (-1);
    float _3344 = _1701 * 2.0;
    int _3346 = _3016 * _3338;
    int _3348 = _3346 + _2820;
    int _3350 = _3298 * int(_3336);
    int _3352 = _3350 + _2950;
    float _3354 = floor(_3344);
    bool _3356 = uint(_3348) >= uint(_2376);
    float _3358 = float(uint(_3352));
    int _3360 = ~_2622;
    int _3362 = _3360 + 1;
    bool _3364 = !_3356;
    int _3366 = _3364 ? 0 : (-1);
    float _3368 = as_type<float>(_2704) * _3358;
    int _3370 = ~_3338;
    int _3372 = _3370 + _3366;
    int _3374 = _3372 + 1;
    float _3376 = trunc(_3368);
    float _3378 = precise::max(_3376, 0.0);
    uint _3380 = uint(_3378);
    int _3382 = _2376 * _3374;
    int _3384 = _3382 + _2820;
    bool _3386 = !_3078;
    int _3388 = _3386 ? 0 : 1;
    bool _3390 = _3036 != 3;
    bool _3392 = !_2616;
    int _3394 = _3392 ? _3384 : (-1);
    int _3396 = abs(_3388);
    int _3398 = int(_3336) + int(_3380);
    int _3400 = _3362 * _3398;
    int _3402 = _3400 + _2950;
    bool _3404 = uint(_3402) >= uint(_2622);
    bool _3406 = !_3404;
    int _3408 = _3406 ? 0 : (-1);
    bool _3410 = _1749 == 0;
    bool _3412 = !_3174;
    int _3414 = _3412 ? 0 : 1;
    bool _3416 = !_3410;
    int _3418 = _3416 ? _3248 : (-1);
    bool _3420 = _1719 != 1;
    bool _3422 = _2502 != 0;
    bool _3424 = !_1787;
    int _3426 = _3424 ? 0 : 1;
    int _3428 = ~_3398;
    int _3430 = _3428 + _3408;
    int _3432 = _3430 + 1;
    bool _3434 = !_3038;
    int _3436 = _3434 ? 0 : 1;
    bool _3438 = _2466 != 3;
    int _3440 = _2622 * _3432;
    int _3442 = _3440 + _2950;
    bool _3444 = !_3390;
    int _3446 = _3444 ? 0 : (-1);
    float _3448 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3450 = log2(_3448);
    bool _3452 = !_3438;
    int _3454 = _3452 ? 0 : (-1);
    float _3456 = as_type<float>(_3338);
    float _3458 = _3368;
    if (_2812)
    {
        _2514 = _1707;
    }
    float _3460 = _2514;
    float _3462 = _3460;
    if (_2812)
    {
        _2516 = _1701;
    }
    float _3464 = _2516;
    float _3466 = _3464;
    if (!_2812)
    {
        _3462 = _1709;
    }
    float _3468 = _3462;
    if (!_2812)
    {
        _3466 = _1707;
    }
    float _3470 = _3466;
    int _3472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3474 = _3472 != 0;
    bool _3476 = !_2658;
    int _3478 = _3476 ? _3442 : (-1);
    bool _3480 = !_3420;
    float _3482 = _3480 ? as_type<float>(_1721) : as_type<float>(_1723);
    float _3484 = _159 * _3450;
    bool _3486 = !_3420;
    float _3488 = _3486 ? as_type<float>(_1725) : as_type<float>(_1721);
    bool _3490 = !_3474;
    int _3492 = _3490 ? 0 : 1;
    int _3494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3496 = _3494 != 0;
    float _3498 = exp2(_3484);
    if (!_3420)
    {
        _3456 = _1709;
    }
    float _3500 = _3456;
    float _3502 = _3500;
    if (!_3420)
    {
        _2518 = _1709;
    }
    float _3504 = _2518;
    float _3506 = _3504;
    if (!_3420)
    {
        _3458 = _1701;
    }
    float _3508 = _3458;
    float _3510 = _3508;
    if (!_3420)
    {
        _2520 = _1701;
    }
    float _3512 = _2520;
    float _3514 = _3512;
    if (_3420)
    {
        _3502 = _1701;
    }
    float _3516 = _3502;
    if (_3420)
    {
        _3506 = _1701;
    }
    float _3518 = _3506;
    if (_3420)
    {
        _3510 = _1707;
    }
    float _3520 = _3510;
    if (_3420)
    {
        _3514 = _1707;
    }
    float _3522 = _3514;
    float _3524 = -_3498;
    float _3526 = _3524 + 1.0;
    bool _3528 = _3318 >= 0.0;
    bool _3530 = isnan(_3318);
    bool _3532 = _3528 || _3530;
    bool _3534 = isnan(0.0);
    bool _3536 = _3532 || _3534;
    float _3538 = _3520 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3540 = _3536 ? 0 : 1;
    bool _3542 = _3318 > 0.0;
    int _3544 = ~_3540;
    int _3546 = _3544 + 1;
    int _3548 = _3546 + 1;
    int _3550 = _3548;
    if (!_3542)
    {
        int _3552 = ~_3540;
        int _3554 = _3552 + 1;
        _3550 = _3554;
    }
    int _3556 = _3550;
    bool _3558 = _3354 >= 0.0;
    bool _3560 = isnan(_3354);
    bool _3562 = _3558 || _3560;
    bool _3564 = isnan(0.0);
    bool _3566 = _3562 || _3564;
    int _3568 = _3566 ? 0 : 1;
    bool _3570 = _3354 > 0.0;
    float _3572 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3574 = _3572 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _3576 = ~_3568;
    int _3578 = _3576 + 1;
    int _3580 = _3578 + 1;
    float _3582 = 1.0 / _3574;
    int _3584 = _3580;
    if (!_3570)
    {
        int _3586 = ~_3568;
        int _3588 = _3586 + 1;
        _3584 = _3588;
    }
    int _3590 = _3584;
    float _3592 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3594 = _3592 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3596 = _2414 != 3;
    float _3598 = 1.0 / _3594;
    bool _3600 = !_3596;
    int _3602 = _3600 ? 0 : (-1);
    bool _3604 = _3076 != 3;
    float _3606 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3608 = _3606 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3610 = !_3422;
    int _3612 = _3610 ? 0 : 1;
    float _3614 = 1.0 / _3608;
    int _3616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3618 = _3616 != 0;
    int _3620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3622 = _3620 != 0;
    int _3624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3626 = _3624 != 0;
    float _3628 = _435 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _3630 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3632 = _3630 != 0;
    bool _3634 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3636 = isnan(0.0);
    bool _3638 = _3634 || _3636;
    bool _3640 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3642 = _3638 || _3640;
    float _3644 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[14].z, _3628);
    float _3646 = _3642 ? _3526 : 0.0;
    float _3648 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3650 = _3648 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _3652 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3654 = _3652 != 0;
    float _3656 = _435 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _3658 = _435 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _3660 = _435 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    bool _3662 = !_3622;
    int _3664 = _3662 ? 0 : 1;
    float _3666 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[14].x, _3656);
    bool _3668 = _1645 != 0;
    float _3670 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[14].y, _3658);
    float _3672 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[14].w, _3660);
    float _3674 = 1.0 / _3650;
    float _3676 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3678 = _3676 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3680 = fma(_499, (*spvDescriptorSet0.vp_c10)._m0[16].x, _3666);
    float _3682 = fma(_499, (*spvDescriptorSet0.vp_c10)._m0[16].y, _3670);
    float _3684 = 1.0 / _3678;
    float _3686 = fma(_499, (*spvDescriptorSet0.vp_c10)._m0[16].z, _3644);
    float _3688 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3690 = _3688 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3692 = fma(_499, (*spvDescriptorSet0.vp_c10)._m0[16].w, _3672);
    float _3694 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3696 = _3694 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3698 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3700 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3698;
    float _3702 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3704 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3702;
    float _3706 = 0.0;
    if (_3668)
    {
        float _3708 = in.m_68.w;
        _3706 = _3708;
    }
    float _3710 = _3706;
    float _3712 = 1.0 / _3690;
    float _3714 = _3696 * _3598;
    float _3716 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3718 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3716;
    float _3720 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3722 = _3720 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3724 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3726 = _3724 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _3728 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3730 = isnan(_1433);
    bool _3732 = _3728 || _3730;
    bool _3734 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3736 = _3732 || _3734;
    float _3738 = float(_3736);
    float _3740 = _3704 * _3614;
    float _3742 = _3718 * _3674;
    float _3744 = _3722 * _3258;
    float _3746 = _3726 * _3684;
    float _3748 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3750 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3748;
    float _3752 = _3700 * _3582;
    float _3754 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3756 = _1433 + _3754;
    bool _3758 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3760 = isnan(_1433);
    bool _3762 = _3758 || _3760;
    bool _3764 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3766 = _3762 || _3764;
    float _3768 = float(_3766);
    float _3770 = -_3738;
    float _3772 = _3770 + 1.0;
    float _3774 = _3750 * _3712;
    float _3776 = fma(_3752, _3756, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _3778 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3780 = isnan(_1433);
    bool _3782 = _3778 || _3780;
    bool _3784 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3786 = _3782 || _3784;
    float _3788 = float(_3786);
    float _3790 = _3768 * _3772;
    float _3792 = -_3768;
    float _3794 = _3792 + 1.0;
    float _3796 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3798 = _1433 + _3796;
    bool _3800 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3802 = isnan(_1433);
    bool _3804 = _3800 || _3802;
    bool _3806 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3808 = _3804 || _3806;
    float _3810 = float(_3808);
    float _3812 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3814 = _1433 + _3812;
    float _3816 = _3788 * _3794;
    float _3818 = -_3788;
    float _3820 = _3818 + 1.0;
    float _3822 = fma(_3714, _3798, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _3824 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3826 = isnan(_1433);
    bool _3828 = _3824 || _3826;
    bool _3830 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3832 = _3828 || _3830;
    float _3834 = float(_3832);
    float _3836 = fma(_3740, _3814, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3838 = _3810 * _3820;
    float _3840 = -_3810;
    float _3842 = _3840 + 1.0;
    bool _3844 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3846 = isnan(_1433);
    bool _3848 = _3844 || _3846;
    bool _3850 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3852 = _3848 || _3850;
    float _3854 = float(_3852);
    float _3856 = -_3834;
    float _3858 = _3856 + 1.0;
    bool _3860 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3862 = isnan(_1433);
    bool _3864 = _3860 || _3862;
    bool _3866 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3868 = _3864 || _3866;
    float _3870 = float(_3868);
    float _3872 = _3834 * _3842;
    float _3874 = _3854 * _3858;
    float _3876 = -_3854;
    float _3878 = _3876 + 1.0;
    float _3880 = -_3870;
    float _3882 = _3880 + 1.0;
    float _3884 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3886 = _1433 + _3884;
    float _3888 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3890 = 1.0 + _3888;
    float _3892 = _3870 * _3878;
    float _3894 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3896 = _1433 + _3894;
    float _3898 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3900 = _1433 + _3898;
    float _3902 = 1.0 / _3890;
    float _3904 = fma(_3744, _3886, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3906 = fma(_3746, _3896, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3908 = _1709 * 2.0;
    float _3910 = fma(_3774, _3900, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _3912 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3914 = isnan(_1433);
    bool _3916 = _3912 || _3914;
    bool _3918 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3920 = _3916 || _3918;
    float _3922 = float(_3920);
    float _3924 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3926 = _1433 + _3924;
    if (_3668)
    {
        float _3928 = _3710 * 3.1415927410125732421875;
        _1461 = _3928;
    }
    float _3930 = _1461;
    float _3932 = floor(_3908);
    float _3934 = _3682 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _3936 = _3922 * _3882;
    float _3938 = _3930;
    if (_3668)
    {
        float _3940 = _3930 * 0.15915493667125701904296875;
        _3938 = _3940;
    }
    float _3942 = _3938;
    float _3944 = fma(_3742, _3926, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3946 = _437 * _3934;
    float _3948 = _3776 * _3936;
    float _3950 = _3680 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _3952 = _3646 * _3902;
    float _3954 = _3942;
    if (_3668)
    {
        float _3956 = _3942 * 6.283185482025146484375;
        float _3958 = sin(_3956);
        _3954 = _3958;
    }
    float _3960 = _3954;
    float _3962 = _3946 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3964 = _3946 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3966 = _199 * _3950;
    float _3968 = _3946 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3970 = !_3604;
    int _3972 = _3970 ? 0 : (-1);
    float _3974 = -_3922;
    float _3976 = _3974 + 1.0;
    bool _3978 = _3932 > 0.0;
    float _3980 = fma(_3966, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3962);
    bool _3982 = _3932 >= 0.0;
    bool _3984 = isnan(_3932);
    bool _3986 = _3982 || _3984;
    bool _3988 = isnan(0.0);
    bool _3990 = _3986 || _3988;
    float _3992 = fma(_3966, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3964);
    float _3994 = fma(_3966, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3968);
    float _3996 = _3686 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    int _3998 = _3990 ? 0 : 1;
    float _4000 = fma(_3976, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3948);
    float _4002 = _3692 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _4004 = _457 * _3996;
    int _4006 = ~_3998;
    int _4008 = _4006 + 1;
    int _4010 = _4008 + 1;
    float _4012 = fma(_3822, _3892, _4000);
    bool _4014 = _3990;
    int _4016 = _4010;
    if (_3668)
    {
        bool _4018 = _3960 > 0.5;
        _4014 = _4018;
    }
    bool _4020 = _4014;
    float _4022 = fma(_4004, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3980);
    if (!_3978)
    {
        int _4024 = ~_3998;
        int _4026 = _4024 + 1;
        _4016 = _4026;
    }
    int _4028 = _4016;
    float _4030 = fma(_4004, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3992);
    float _4032 = fma(_4004, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3994);
    float _4034 = fma(_3836, _3874, _4012);
    bool _4036 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4038 = isnan(1.0);
    bool _4040 = _4036 || _4038;
    bool _4042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4044 = _4040 || _4042;
    float _4046 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4048 = fma(_4002, (*spvDescriptorSet0.vp_c8)._m0[26].w, _4032);
    float _4050 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _4052 = !_4044;
    float _4054 = _4052 ? _159 : _3952;
    float _4056 = fma(_4002, (*spvDescriptorSet0.vp_c8)._m0[24].w, _4022);
    float _4058 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4046);
    float _4060 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4050);
    float _4062 = _1701 + (-0.5);
    float _4064 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _4066 = fma(_4002, (*spvDescriptorSet0.vp_c8)._m0[25].w, _4030);
    float _4068 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _4070 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _4072 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _4074 = !_3626;
    int _4076 = _4074 ? 0 : 1;
    float _4078 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4064);
    bool _4080 = _1897 != 0;
    float _4082 = fma(as_type<float>(_1721), (*spvDescriptorSet0.vp_c9)._m0[93].w, _4068);
    bool _4084 = _1707 > 0.5;
    float _4086 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4070);
    float _4088 = _1707 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _4090 = _1707 + (-0.5);
    float _4092 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4094 = fma(as_type<float>(_1723), (*spvDescriptorSet0.vp_c9)._m0[93].z, _4072);
    float _4096 = as_type<float>(_1721) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _4098 = fma(_3904, _3872, _4034);
    float _4100 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _4102 = as_type<float>(_1723) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _4104 = _1709 + (-0.5);
    float _4106 = fma(_4096, -2.0, _4092);
    float _4108 = fma(_3944, _3838, _4098);
    float _4110 = -_4100;
    float _4112 = fma(_4102, 2.0, _4110);
    float _4114 = _1739 + (-1.0);
    float _4116 = _1771 + (-1.0);
    float _4118 = _1777 + (-1.0);
    float _4120 = fma(_3906, _3816, _4108);
    float _4122 = fma(_4114, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _4124 = fma(_4116, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _4126 = fma(_4118, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _4128 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _4130 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _4132 = fma(_3910, _3790, _4120);
    float _4134 = _4066 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _4136 = fma(_3522, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4128);
    float _4138 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4140 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _4142 = fma(_1757, -2.0, _4130);
    float _4144 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4146 = _4056 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _4148 = -_4134;
    float _4150 = _4148 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4152 = fma(_3482, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4138);
    float _4154 = _3482 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _4156 = fma(_3518, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4140);
    float _4158 = -_4146;
    float _4160 = _4158 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4162 = _4150 * _4150;
    float _4164 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4166 = _4134 + _4164;
    float _4168 = -_4144;
    float _4170 = fma(_4154, 2.0, _4168);
    float _4172 = _4048 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _4174 = fma(_4160, _4160, _4162);
    float _4176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4178 = _4146 + _4176;
    float _4180 = _4166 * _4166;
    float _4182 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4184 = _4172 + _4182;
    float _4186 = -_4172;
    float _4188 = _4186 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4190 = fma(_4178, _4178, _4180);
    float _4192 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _4194 = fma(_4188, _4188, _4174);
    float _4196 = fma(_4184, _4184, _4190);
    float _4198 = -_4192;
    float _4200 = fma(_4088, 2.0, _4198);
    float _4202 = rsqrt(_4194);
    float _4204 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _4206 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _4208 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _4210 = !_3618;
    int _4212 = _4210 ? 0 : 1;
    float _4214 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _4216 = fma(_3488, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4206);
    float _4218 = sqrt(_4196);
    float _4220 = _3516 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _4222 = _3488 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _4224 = -_4208;
    float _4226 = fma(_3538, 2.0, _4224);
    int _4228 = abs(_4076);
    float _4230 = fma(_4220, -2.0, _4204);
    float _4232 = _815 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _4234 = fma(_4222, -2.0, _4214);
    float _4236 = rsqrt(_4196);
    float _4238 = fma(_3738, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4132);
    float _4240 = _4232 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _4242 = _4188 * _4202;
    int _4244 = abs(_4212);
    float _4246 = _4160 * _4202;
    int _4248 = abs(_3664);
    float _4250 = _4150 * _4202;
    float _4252 = _4218 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _4254 = float(_4028);
    float _4256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _4258 = float(_4228);
    float _4260 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4152);
    float _4262 = precise::min(_4240, _4252);
    float _4264 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4216);
    float _4266 = float(_4244);
    float _4268 = in.m_74.x;
    float _4270 = in.m_74.y;
    float _4272 = in.m_74.z;
    float _4274 = float(_3556);
    float _4276 = _4236 * _4262;
    float _4278 = float(_4248);
    float _4280 = _4266 * _4254;
    float _4282 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4284 = _4246 * _4282;
    float _4286 = float(_3590);
    float _4288 = _4166 * _4276;
    float _4290 = _4278 * _4274;
    float _4292 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4294 = _4242 * _4292;
    float _4296 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4298 = -_4284;
    float _4300 = fma(_4242, _4296, _4298);
    float _4302 = _4258 * _4286;
    float _4304 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4306 = _4250 * _4304;
    float _4308 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4310 = -_4294;
    float _4312 = fma(_4250, _4308, _4310);
    float _4314 = _4300 * _4300;
    float _4316 = -_4288;
    float _4318 = _4166 + _4316;
    float _4320 = _4178 * _4276;
    float _4322 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4324 = -_4306;
    float _4326 = fma(_4246, _4322, _4324);
    float _4328 = fma(_4312, _4312, _4314);
    float _4330 = _4318 * _4318;
    float _4332 = -_4320;
    float _4334 = _4178 + _4332;
    float _4336 = _4184 * _4276;
    float _4338 = _4280 * (-2.0);
    float _4340 = fma(_4326, _4326, _4328);
    float _4342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _4344 = fma(_4334, _4334, _4330);
    float _4346 = -_4336;
    float _4348 = _4184 + _4346;
    float _4350 = fma(_4338, _4268, _4268);
    float _4352 = fma(_4122, _4338, _4122);
    float _4354 = _4256 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _4356 = fma(_4348, _4348, _4344);
    float _4358 = fma(_4090, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4350);
    float _4360 = _1745 + 0.5;
    float _4362 = -_159;
    float _4364 = fma(_4362, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4170);
    float _4366 = _4290 * (-2.0);
    float _4368 = fma(_4054, _4352, _4358);
    float _4370 = sqrt(_4356);
    float _4372 = fma(_4354, _4360, _4364);
    float _4374 = _4302 * (-2.0);
    float _4376 = fma(_4366, _4270, _4270);
    float _4378 = _4368 * 0.15915493667125701904296875;
    float _4380 = _4342 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _4382 = fma(_4374, _4272, _4272);
    float _4384 = fma(_4062, (*spvDescriptorSet0.vp_c9)._m0[196].y, _4376);
    float _4386 = _1755 + (-0.5);
    float _4388 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4234);
    float _4390 = fma(_4104, (*spvDescriptorSet0.vp_c9)._m0[196].z, _4382);
    float _4392 = fma(_4124, _4366, _4124);
    float _4394 = fma(_4126, _4374, _4126);
    float _4396 = -_4380;
    float _4398 = -_4388;
    float _4400 = fma(_4396, _4386, _4398);
    float _4402 = -_4260;
    float _4404 = _4402 + 1.0;
    float _4406 = fma(_4054, _4392, _4384);
    float _4408 = fma(_4054, _4394, _4390);
    float _4410 = -_4404;
    float _4412 = fma(_4410, _1745, _4372);
    float _4414 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _4416 = _3468 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _4418 = _4406 * 0.15915493667125701904296875;
    float _4420 = _3470 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _4422 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _4424 = -_4414;
    float _4426 = fma(_4416, 2.0, _4424);
    float _4428 = _4408 * 0.15915493667125701904296875;
    float _4430 = _4378 * 6.283185482025146484375;
    float _4432 = sin(_4430);
    float _4434 = fma(_4420, -2.0, _4422);
    float _4436 = -_4264;
    float _4438 = _4436 + 1.0;
    float _4440 = _4236 * _4370;
    out.m_76.x = _4238;
    float _4442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _227);
    float _4444 = fma(_4438, _1755, _4400);
    float _4446 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _233);
    float _4448 = _4378 * 6.283185482025146484375;
    float _4450 = cos(_4448);
    float _4452 = _1781 * _4440;
    float _4454 = _4232 * _4440;
    out.m_78.x = _4412;
    out.m_78.y = _4444;
    float _4456 = _4440 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _4458 = _4456 * 0.5;
    float _4460 = _4452 * _4446;
    float _4462 = _4454 * _4442;
    out.m_80.x = _4454;
    float _4464 = _4418 * 6.283185482025146484375;
    float _4466 = sin(_4464);
    int _4468 = abs(_2548);
    out.m_82.w = _4262;
    bool _4470 = !_3632;
    float _4472 = _4470 ? _233 : as_type<float>(_3172);
    int _4474 = ~_4468;
    int _4476 = _4474 + 1;
    int _4478 = _4476 + 1;
    float _4480 = _4418 * 6.283185482025146484375;
    float _4482 = cos(_4480);
    float _4484 = rsqrt(_4340);
    float _4486 = _4432 * _4466;
    float _4488 = _4450 * _4466;
    float _4490 = _4428 * 6.283185482025146484375;
    float _4492 = cos(_4490);
    float _4494 = _4450 * _4482;
    float _4496 = _4432 * _4482;
    float _4498 = _4428 * 6.283185482025146484375;
    float _4500 = sin(_4498);
    float _4502 = _4326 * _4484;
    float _4504 = _4312 * _4484;
    float _4506 = _4300 * _4484;
    float _4508 = _4250 * _4504;
    float _4510 = _4432 * _4492;
    int _4512 = _2420 >> 31;
    float _4514 = _4450 * _4492;
    int _4516 = _2402 >> 31;
    float _4518 = _4482 * _4492;
    int _4520 = _4512 & 3;
    float _4522 = _4466 * _4492;
    int _4524 = _4516 & 3;
    float _4526 = fma(_4500, _4494, _4486);
    float _4528 = fma(_4500, _4486, _4494);
    float _4530 = _4246 * _4502;
    int _4532 = _2420 + _4520;
    float _4534 = _4242 * _4506;
    float _4536 = -_4488;
    float _4538 = fma(_4500, _4496, _4536);
    float _4540 = -_4530;
    float _4542 = fma(_4242, _4504, _4540);
    float _4544 = -_4496;
    float _4546 = fma(_4500, _4488, _4544);
    int _4548 = _2402 + _4524;
    float _4550 = -_4534;
    float _4552 = fma(_4250, _4502, _4550);
    int _4554 = _3024 >> 31;
    float _4556 = _4514 * _4542;
    int _4558 = _4548 >> 2;
    float _4560 = -_4460;
    float _4562 = _4500 * _4560;
    int _4564 = _4554 & 3;
    float _4566 = -_4500;
    float _4568 = fma(_4566, _4506, _4556);
    float _4570 = _4514 * _4552;
    int _4572 = _3052 >> 31;
    float _4574 = -_4508;
    float _4576 = fma(_4246, _4506, _4574);
    int _4578 = _4558 << 4;
    int _4580 = _4578 + 368;
    float _4582 = -_4500;
    float _4584 = fma(_4582, _4504, _4570);
    int _4586 = _4572 & 3;
    float _4588 = _4514 * _4460;
    uint _4590 = uint(int(uint(_4580) >> uint(2)));
    uint _4592 = uint(int(uint(int(_4590)) >> uint(2)));
    int _4594 = int(_4590) & 3;
    float _4596 = (*spvDescriptorSet0.vp_c9)._m0[int(_4592)][_4594];
    int _4598 = int(_4590) + 1;
    uint _4600 = uint(int(uint(_4598) >> uint(2)));
    int _4602 = _4598 & 3;
    float _4604 = (*spvDescriptorSet0.vp_c9)._m0[int(_4600)][_4602];
    int _4606 = _3024 + _4564;
    float _4608 = _4510 * _4460;
    int _4610 = _3052 + _4586;
    float _4612 = fma(_4518, _4462, _4562);
    int _4614 = _4606 >> 2;
    float _4616 = _4526 * _4552;
    int _4618 = _4610 >> 2;
    float _4620 = _4526 * _4542;
    int _4622 = _4532 >> 2;
    float _4624 = _4514 * _4576;
    int _4626 = _4614 << 4;
    int _4628 = _4626 + 656;
    float _4630 = fma(_4526, _4462, _4588);
    int _4632 = _4618 << 4;
    int _4634 = _4632 + 800;
    float _4636 = _4526 * _4576;
    int _4638 = _4622 << 4;
    int _4640 = _4638 + 512;
    float _4642 = fma(_4538, _4462, _4608);
    float _4644 = fma(_4518, _4504, _4616);
    float _4646 = fma(_4518, _4506, _4620);
    float _4648 = -_4500;
    float _4650 = fma(_4648, _4502, _4624);
    uint _4652 = uint(int(uint(_4628) >> uint(2)));
    uint _4654 = uint(int(uint(int(_4652)) >> uint(2)));
    int _4656 = int(_4652) & 3;
    float _4658 = (*spvDescriptorSet0.vp_c9)._m0[int(_4654)][_4656];
    int _4660 = int(_4652) + 1;
    uint _4662 = uint(int(uint(_4660) >> uint(2)));
    int _4664 = _4660 & 3;
    float _4666 = (*spvDescriptorSet0.vp_c9)._m0[int(_4662)][_4664];
    float _4668 = _4546 * _4542;
    float _4670 = fma(_4518, _4502, _4636);
    float _4672 = fma(_4510, _4246, _4584);
    float _4674 = fma(_4510, _4250, _4568);
    float _4676 = fma(_4510, _4242, _4650);
    float _4678 = _4546 * _4552;
    float _4680 = _4546 * _4576;
    uint _4682 = uint(int(uint(_4634) >> uint(2)));
    uint _4684 = uint(int(uint(int(_4682)) >> uint(2)));
    int _4686 = int(_4682) & 3;
    float _4688 = (*spvDescriptorSet0.vp_c9)._m0[int(_4684)][_4686];
    int _4690 = int(_4682) + 1;
    uint _4692 = uint(int(uint(_4690) >> uint(2)));
    int _4694 = _4690 & 3;
    float _4696 = (*spvDescriptorSet0.vp_c9)._m0[int(_4692)][_4694];
    float _4698 = fma(_4522, _4506, _4668);
    float _4700 = fma(_4546, _4458, _4630);
    float _4702 = fma(_4522, _4458, _4612);
    float _4704 = fma(_4522, _4504, _4678);
    float _4706 = fma(_4522, _4502, _4680);
    int _4708 = abs(_2526);
    float _4710 = _4552 * _4700;
    uint _4712 = uint(int(uint(_4640) >> uint(2)));
    uint _4714 = uint(int(uint(int(_4712)) >> uint(2)));
    int _4716 = int(_4712) & 3;
    float _4718 = (*spvDescriptorSet0.vp_c9)._m0[int(_4714)][_4716];
    int _4720 = int(_4712) + 1;
    uint _4722 = uint(int(uint(_4720) >> uint(2)));
    int _4724 = _4720 & 3;
    float _4726 = (*spvDescriptorSet0.vp_c9)._m0[int(_4722)][_4724];
    float _4728 = _4576 * _4700;
    int _4730 = ~_4708;
    int _4732 = _4730 + 1;
    int _4734 = _4732 + 1;
    float _4736 = fma(_4528, _4458, _4642);
    int _4738 = abs(_3074);
    float _4740 = fma(_4504, _4702, _4710);
    float _4742 = fma(_4502, _4702, _4728);
    int _4744 = abs(_3612);
    int _4746 = _4640 + 8;
    uint _4748 = uint(int(uint(_4746) >> uint(2)));
    uint _4750 = uint(int(uint(int(_4748)) >> uint(2)));
    int _4752 = int(_4748) & 3;
    float _4754 = (*spvDescriptorSet0.vp_c9)._m0[int(_4750)][_4752];
    int _4756 = int(_4748) + 1;
    uint _4758 = uint(int(uint(_4756) >> uint(2)));
    int _4760 = _4756 & 3;
    float _4762 = (*spvDescriptorSet0.vp_c9)._m0[int(_4758)][_4760];
    int _4764 = abs(_3094);
    float _4766 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4768 = int(_4766);
    int _4770 = ~_4744;
    int _4772 = _4770 + 1;
    int _4774 = _4772 + 1;
    int _4776 = _4734 * as_type<int>(_4604);
    int _4778 = abs(_3414);
    float _4780 = fma(_4242, _4736, _4742);
    int _4782 = ~_4764;
    int _4784 = _4782 + 1;
    int _4786 = _4784 + 1;
    int _4788 = _4628 + 8;
    uint _4790 = uint(int(uint(_4788) >> uint(2)));
    uint _4792 = uint(int(uint(int(_4790)) >> uint(2)));
    int _4794 = int(_4790) & 3;
    float _4796 = (*spvDescriptorSet0.vp_c9)._m0[int(_4792)][_4794];
    int _4798 = int(_4790) + 1;
    uint _4800 = uint(int(uint(_4798) >> uint(2)));
    int _4802 = _4798 & 3;
    float _4804 = (*spvDescriptorSet0.vp_c9)._m0[int(_4800)][_4802];
    int _4806 = ~_4778;
    int _4808 = _4806 + 1;
    int _4810 = _4808 + 1;
    float _4812 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4814 = int(_4812);
    float _4816 = fma(_4528, _4246, _4704);
    float _4818 = fma(_4528, _4250, _4698);
    float _4820 = fma(_4528, _4242, _4706);
    int _4822 = _4810 * as_type<int>(_4596);
    int _4824 = _4822 + _4776;
    int _4826 = abs(_3126);
    int _4828 = _4580 + 8;
    uint _4830 = uint(int(uint(_4828) >> uint(2)));
    uint _4832 = uint(int(uint(int(_4830)) >> uint(2)));
    int _4834 = int(_4830) & 3;
    float _4836 = (*spvDescriptorSet0.vp_c9)._m0[int(_4832)][_4834];
    int _4838 = int(_4830) + 1;
    uint _4840 = uint(int(uint(_4838) >> uint(2)));
    int _4842 = _4838 & 3;
    float _4844 = (*spvDescriptorSet0.vp_c9)._m0[int(_4840)][_4842];
    float _4846 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4848 = int(_4846);
    int _4850 = ~_4826;
    int _4852 = _4850 + 1;
    int _4854 = _4852 + 1;
    int _4856 = _4634 + 8;
    uint _4858 = uint(int(uint(_4856) >> uint(2)));
    uint _4860 = uint(int(uint(int(_4858)) >> uint(2)));
    int _4862 = int(_4858) & 3;
    float _4864 = (*spvDescriptorSet0.vp_c9)._m0[int(_4860)][_4862];
    int _4866 = int(_4858) + 1;
    uint _4868 = uint(int(uint(_4866) >> uint(2)));
    int _4870 = _4866 & 3;
    float _4872 = (*spvDescriptorSet0.vp_c9)._m0[int(_4868)][_4870];
    int _4874 = ~_4738;
    int _4876 = _4874 + 1;
    int _4878 = _4876 + 1;
    int _4880 = ~_4814;
    int _4882 = _4880 + 1;
    int _4884 = _4878 * as_type<int>(_4666);
    float _4886 = float(uint(_4768));
    int _4888 = _4786 * as_type<int>(_4696);
    int _4890 = abs(_3436);
    float _4892 = _4542 * _4700;
    int _4894 = abs(_3134);
    float _4896 = 1.0 / _4886;
    float _4898 = fma(_4506, _4702, _4892);
    int _4900 = ~_4890;
    int _4902 = _4900 + 1;
    int _4904 = _4902 + 1;
    int _4906 = _4478 * as_type<int>(_4726);
    int _4908 = ~_3396;
    int _4910 = _4908 + 1;
    int _4912 = _4910 + 1;
    float _4914 = float(uint(_4848));
    int _4916 = _4774 * as_type<int>(_4718);
    int _4918 = _4916 + _4906;
    int _4920 = ~_4894;
    int _4922 = _4920 + 1;
    int _4924 = _4922 + 1;
    int _4926 = _4904 * as_type<int>(_4658);
    int _4928 = _4926 + _4884;
    float _4930 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4932 = int(_4930);
    int _4934 = _4912 * as_type<int>(_4688);
    int _4936 = _4934 + _4888;
    int _4938 = abs(_3602);
    int _4940 = _4924 * as_type<int>(_4754);
    int _4942 = _4940 + _4918;
    int _4944 = abs(_3166);
    int _4946 = abs(_3180);
    int _4948 = ~_4944;
    int _4950 = _4948 + 1;
    int _4952 = _4950 + 1;
    int _4954 = ~_4938;
    int _4956 = _4954 + 1;
    int _4958 = _4956 + 1;
    int _4960 = ~_4946;
    int _4962 = _4960 + 1;
    int _4964 = _4962 + 1;
    int _4966 = _4952 * as_type<int>(_4796);
    int _4968 = _4966 + _4928;
    int _4970 = abs(_3446);
    float _4972 = float(uint(_4814));
    int _4974 = _4854 * as_type<int>(_4836);
    int _4976 = _4974 + _4824;
    int _4978 = ~_4970;
    int _4980 = _4978 + 1;
    int _4982 = _4980 + 1;
    float _4984 = 1.0 / _4914;
    int _4986 = abs(_3492);
    int _4988 = _4958 * as_type<int>(_4844);
    int _4990 = _4988 + _4976;
    int _4992 = abs(_3454);
    bool _4994 = !_3496;
    int _4996 = _4994 ? 0 : 1;
    int _4998 = abs(_4932);
    int _5000 = _4964 * as_type<int>(_4864);
    int _5002 = _5000 + _4936;
    int _5004 = ~_4992;
    int _5006 = _5004 + 1;
    int _5008 = _5006 + 1;
    float _5010 = 1.0 / _4972;
    int _5012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _5014 = _5012 != 0;
    int _5016 = abs(_4996);
    int _5018 = _5008 * as_type<int>(_4762);
    int _5020 = _5018 + _4942;
    bool _5022 = !_5014;
    int _5024 = _5022 ? 0 : 1;
    int _5026 = ~_4986;
    int _5028 = _5026 + 1;
    int _5030 = _5028 + 1;
    int _5032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _5034 = _5032 != 0;
    int _5036 = _4982 * as_type<int>(_4804);
    int _5038 = _5036 + _4968;
    int _5040 = abs(_3972);
    float _5042 = _4172 + _4780;
    int _5044 = ~_5016;
    int _5046 = _5044 + 1;
    int _5048 = _5046 + 1;
    int _5050 = ~_5040;
    int _5052 = _5050 + 1;
    int _5054 = _5052 + 1;
    float _5056 = float(uint(_4932));
    int _5058 = abs(_4768);
    int _5060 = _5054 * as_type<int>(_4872);
    int _5062 = _5060 + _5002;
    float _5064 = fma(_4246, _4736, _4740);
    int _5066 = _4990 * _5030;
    int _5068 = abs(_3426);
    float _5070 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5072 = _5042 + _5070;
    float _5074 = _4146 + _5064;
    int _5076 = _5020 * _5048;
    float _5078 = _5072 * _5072;
    float _5080 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5082 = _5074 + _5080;
    int _5084 = _3342 * _5016;
    int _5086 = _5084 + _5076;
    int _5088 = ~_5068;
    int _5090 = _5088 + 1;
    int _5092 = _5090 + 1;
    int _5094 = _3418 * _4986;
    int _5096 = _5094 + _5066;
    float _5098 = fma(_5082, _5082, _5078);
    int _5100 = abs(_5024);
    float _5102 = 1.0 / _5056;
    int _5104 = _5038 * _5092;
    int _5106 = as_type<int>(_4984) + (-2);
    int _5108 = _3394 * _5068;
    int _5110 = _5108 + _5104;
    float _5112 = float(uint(_5086));
    float _5114 = sqrt(_5098);
    int _5116 = as_type<int>(_4896) + (-2);
    float _5118 = float(uint(_5096));
    float _5120 = as_type<float>(_5106) * _5112;
    float _5122 = float(uint(_5058));
    int _5124 = ~_5100;
    int _5126 = _5124 + 1;
    int _5128 = _5126 + 1;
    float _5130 = as_type<float>(_5116) * _5118;
    int _5132 = as_type<int>(_5102) + (-2);
    float _5134 = 1.0 / _5122;
    int _5136 = _5062 * _5128;
    int _5138 = abs(_4848);
    float _5140 = float(uint(_5110));
    int _5142 = _3478 * _5100;
    int _5144 = _5142 + _5136;
    int _5146 = ~_4848;
    int _5148 = _5146 + 1;
    float _5150 = trunc(_5120);
    float _5152 = precise::max(_5150, 0.0);
    uint _5154 = uint(_5152);
    int _5156 = abs(_4814);
    float _5158 = as_type<float>(_5132) * _5140;
    int _5160 = as_type<int>(_5010) + (-2);
    float _5162 = float(uint(_5138));
    float _5164 = trunc(_5130);
    float _5166 = precise::max(_5164, 0.0);
    uint _5168 = uint(_5166);
    float _5170 = float(uint(_5156));
    float _5172 = float(uint(_5144));
    int _5174 = ~_4768;
    int _5176 = _5174 + 1;
    int _5178 = as_type<int>(_5134) + (-2);
    int _5180 = _5148 * int(_5154);
    int _5182 = _5180 + _5086;
    float _5184 = 1.0 / _5162;
    float _5186 = as_type<float>(_5160) * _5172;
    float _5188 = float(uint(_4998));
    float _5190 = float(uint(_5182));
    int _5192 = abs(_5086);
    int _5194 = _5176 * int(_5168);
    int _5196 = _5194 + _5096;
    float _5198 = 1.0 / _5170;
    float _5200 = as_type<float>(_5106) * _5190;
    int _5202 = abs(_5144);
    float _5204 = float(uint(_5196));
    float _5206 = 1.0 / _5188;
    float _5208 = as_type<float>(_5116) * _5204;
    float _5210 = fma(_4538, _4246, _4644);
    float _5212 = fma(_4538, _4250, _4646);
    int _5214 = as_type<int>(_5184) + (-2);
    float _5216 = fma(_4250, _4736, _4898);
    float _5218 = float(uint(_5192));
    float _5220 = trunc(_5158);
    float _5222 = precise::max(_5220, 0.0);
    uint _5224 = uint(_5222);
    int _5226 = as_type<int>(_5198) + (-2);
    float _5228 = _4134 + _5216;
    float _5230 = float(uint(_5202));
    float _5232 = as_type<float>(_5214) * _5218;
    int _5234 = abs(_5096);
    float _5236 = fma(_4538, _4242, _4670);
    float _5238 = _233 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5240 = trunc(_5186);
    float _5242 = precise::max(_5240, 0.0);
    uint _5244 = uint(_5242);
    float _5246 = float(uint(_5234));
    float _5248 = as_type<float>(_5226) * _5230;
    int _5250 = ~_4932;
    int _5252 = _5250 + 1;
    out.m_84.x = _5210;
    out.m_84.y = _5212;
    out.m_84.z = _5236;
    float _5254 = as_type<float>(_5178) * _5246;
    float _5256 = -_227;
    int _5258 = _4080 ? as_type<int>(_5256) : as_type<int>(_227);
    float _5260 = trunc(_5232);
    float _5262 = precise::max(_5260, 0.0);
    uint _5264 = uint(_5262);
    float _5266 = -_227;
    int _5268 = _4084 ? as_type<int>(_5266) : as_type<int>(_227);
    int _5270 = abs(_5110);
    int _5272 = as_type<int>(_5206) + (-2);
    float _5274 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5276 = _5184;
    float _5278 = _5074;
    float _5280 = _5042;
    if (!_3668)
    {
        _5276 = _227;
    }
    float _5282 = _5276;
    int _5284 = _4882 * int(_5244);
    int _5286 = _5284 + _5144;
    float _5288 = _5282;
    if (_3668)
    {
        float _5290 = -_227;
        float _5292 = _4020 ? _5290 : _227;
        _5288 = _5292;
    }
    float _5294 = _5288;
    float _5296 = trunc(_5254);
    float _5298 = precise::max(_5296, 0.0);
    uint _5300 = uint(_5298);
    bool _5302 = !_5034;
    float _5304 = _5302 ? _227 : as_type<float>(_5258);
    bool _5306 = !_3654;
    float _5308 = _5306 ? _227 : as_type<float>(_5268);
    int _5310 = _5252 * int(_5224);
    int _5312 = _5310 + _5110;
    float _5314 = float(uint(_5270));
    float _5316 = _5238 * _4672;
    float _5318 = float(uint(_5286));
    float _5320 = _5238 * _4676;
    float _5322 = float(uint(_5312));
    float _5324 = as_type<float>(_5272) * _5314;
    float _5326 = _5238 * _4674;
    float _5328 = fma(_5274, _5210, _5316);
    float _5330 = as_type<float>(_5160) * _5318;
    float _5332 = as_type<float>(_5132) * _5322;
    float _5334 = fma(_5274, _5212, _5326);
    float _5336 = fma(_5274, _5236, _5320);
    bool _5338 = _5114 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5340 = trunc(_5324);
    float _5342 = precise::max(_5340, 0.0);
    uint _5344 = uint(_5342);
    int _5346 = ~_5058;
    int _5348 = _5346 + 1;
    int _5350 = ~_5138;
    int _5352 = _5350 + 1;
    float _5354 = trunc(_5248);
    float _5356 = precise::max(_5354, 0.0);
    uint _5358 = uint(_5356);
    int _5360 = ~_4998;
    int _5362 = _5360 + 1;
    int _5364 = _5348 * int(_5300);
    int _5366 = _5364 + _5234;
    float _5368 = as_type<float>(_5348);
    if (!_5338)
    {
        _5368 = _5074;
    }
    float _5370 = _5368;
    int _5372 = _5352 * int(_5264);
    int _5374 = _5372 + _5192;
    float _5376 = _5370;
    if (!_5338)
    {
        _5278 = _5042;
    }
    float _5378 = _5278;
    float _5380 = trunc(_5208);
    float _5382 = precise::max(_5380, 0.0);
    uint _5384 = uint(_5382);
    float _5386 = float(uint(_5366));
    float _5388 = _5378;
    if (!_5338)
    {
        _5280 = _5228;
    }
    float _5390 = _5280;
    float _5392 = trunc(_5200);
    float _5394 = precise::max(_5392, 0.0);
    uint _5396 = uint(_5394);
    float _5398 = trunc(_5332);
    float _5400 = precise::max(_5398, 0.0);
    uint _5402 = uint(_5400);
    float _5404 = trunc(_5330);
    float _5406 = precise::max(_5404, 0.0);
    uint _5408 = uint(_5406);
    bool _5410 = !_5338;
    float _5412 = _5390;
    if (!_5410)
    {
        float _5414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5418 = _5114 + _5416;
        float _5420 = rsqrt(_5098);
        float _5422 = _5418 * _5414;
        float _5424 = _5228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5426 = _5422 * 0.15915493667125701904296875;
        float _5428 = _5426 * 6.283185482025146484375;
        float _5430 = cos(_5428);
        float _5432 = _5426 * 6.283185482025146484375;
        float _5434 = sin(_5432);
        float _5436 = _5430 + (-1.0);
        float _5438 = _5436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5440 = fma(_5434, _5424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5442 = fma(_5228, _5430, _5438);
        float _5444 = _5420 * _5440;
        float _5446 = fma(_5082, _5444, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5448 = fma(_5072, _5444, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5412 = _5442;
        _5376 = _5446;
        _5388 = _5448;
    }
    float _5450 = _5412;
    float _5452 = _5376;
    float _5454 = _5388;
    int _5456 = _5362 * int(_5344);
    int _5458 = _5456 + _5270;
    int _5460 = ~_5156;
    int _5462 = _5460 + 1;
    float _5464 = as_type<float>(_5178) * _5386;
    float _5466 = float(uint(_5374));
    float _5468 = -_159;
    float _5470 = fma(_5468, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4426);
    float _5472 = float(uint(_5458));
    float _5474 = trunc(_5464);
    float _5476 = precise::max(_5474, 0.0);
    uint _5478 = uint(_5476);
    int _5480 = int(_5244) + int(_5408);
    float _5482 = as_type<float>(_5214) * _5466;
    int _5484 = int(_5168) + int(_5384);
    float _5486 = as_type<float>(_5272) * _5472;
    int _5488 = _5462 * int(_5358);
    int _5490 = _5488 + _5202;
    int _5492 = int(_5154) + int(_5396);
    float _5494 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _4142);
    int _5496 = ~_4768;
    int _5498 = _5496 + 1;
    float _5500 = trunc(_5482);
    float _5502 = precise::max(_5500, 0.0);
    uint _5504 = uint(_5502);
    float _5506 = float(uint(_5490));
    float _5508 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4230);
    int _5510 = ~_4848;
    int _5512 = _5510 + 1;
    float _5514 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4106);
    int _5516 = ~_4932;
    int _5518 = _5516 + 1;
    float _5520 = as_type<float>(_5226) * _5506;
    int _5522 = ~_4814;
    int _5524 = _5522 + 1;
    int _5526 = _5512 * _5492;
    int _5528 = _5526 + _5086;
    int _5530 = int(_5224) + int(_5402);
    int _5532 = _5498 * _5484;
    int _5534 = _5532 + _5096;
    float _5536 = trunc(_5520);
    float _5538 = precise::max(_5536, 0.0);
    uint _5540 = uint(_5538);
    float _5542 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4082);
    bool _5544 = uint(_5534) >= uint(_4768);
    int _5546 = _5518 * _5530;
    int _5548 = _5546 + _5110;
    int _5550 = int(_5300) + int(_5478);
    int _5552 = _5524 * _5480;
    int _5554 = _5552 + _5144;
    int _5556 = int(_5264) + int(_5504);
    float _5558 = trunc(_5486);
    float _5560 = precise::max(_5558, 0.0);
    uint _5562 = uint(_5560);
    bool _5564 = uint(_5548) >= uint(_4932);
    float _5566 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4434);
    bool _5568 = uint(_5554) >= uint(_4814);
    float _5570 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[92].z, _4094);
    int _5572 = ~_5058;
    int _5574 = _5572 + 1;
    float _5576 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4060);
    int _5578 = ~_5138;
    int _5580 = _5578 + 1;
    float _5582 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4156);
    int _5584 = int(_5358) + int(_5540);
    int _5586 = _5574 * _5550;
    int _5588 = _5586 + _5234;
    bool _5590 = uint(_5528) >= uint(_4848);
    int _5592 = _5580 * _5556;
    int _5594 = _5592 + _5192;
    int _5596 = ~_4998;
    int _5598 = _5596 + 1;
    float _5600 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4086);
    bool _5602 = !_5544;
    int _5604 = _5602 ? 0 : (-1);
    float _5606 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4078);
    int _5608 = int(_5344) + int(_5562);
    float _5610 = -_5600;
    float _5612 = _5610 + 1.0;
    int _5614 = ~_5484;
    int _5616 = _5614 + _5604;
    int _5618 = _5616 + 1;
    float _5620 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4058);
    bool _5622 = uint(_5594) >= uint(_5138);
    int _5624 = _5598 * _5608;
    int _5626 = _5624 + _5270;
    bool _5628 = !_5590;
    int _5630 = _5628 ? 0 : (-1);
    int _5632 = _4768 * _5618;
    int _5634 = _5632 + _5096;
    int _5636 = ~_5156;
    int _5638 = _5636 + 1;
    float _5640 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4136);
    int _5642 = ~_5492;
    int _5644 = _5642 + _5630;
    int _5646 = _5644 + 1;
    float _5648 = -_5576;
    float _5650 = _5648 + 1.0;
    bool _5652 = _4768 == 0;
    int _5654 = _5638 * _5584;
    int _5656 = _5654 + _5202;
    bool _5658 = uint(_5626) >= uint(_4998);
    int _5660 = _4848 * _5646;
    int _5662 = _5660 + _5086;
    bool _5664 = uint(_5588) >= uint(_5058);
    float _5666 = -_5606;
    float _5668 = _5666 + 1.0;
    bool _5670 = !_5564;
    int _5672 = _5670 ? 0 : (-1);
    float _5674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _5676 = !_5652;
    int _5678 = _5676 ? _5634 : (-1);
    float _5680 = -_5640;
    float _5682 = _5680 + 1.0;
    int _5684 = ~_5530;
    int _5686 = _5684 + _5672;
    int _5688 = _5686 + 1;
    bool _5690 = _4848 == 0;
    int _5692 = _5096 ^ _4768;
    int _5694 = _4932 * _5688;
    int _5696 = _5694 + _5110;
    bool _5698 = !_5622;
    int _5700 = _5698 ? 0 : (-1);
    float _5702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _5704 = !_5690;
    int _5706 = _5704 ? _5662 : (-1);
    bool _5708 = uint(_5656) >= uint(_5156);
    int _5710 = _5086 ^ _4848;
    float _5712 = _5674 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _5714 = _4932 == 0;
    float _5716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _5718 = _4932 == 0;
    int _5720 = _5110 ^ _4932;
    bool _5722 = !_5568;
    int _5724 = _5722 ? 0 : (-1);
    bool _5726 = !_5658;
    int _5728 = _5726 ? 0 : (-1);
    uint _5730 = uint(int(uint(_5692) >> uint(31)));
    bool _5732 = !_5664;
    int _5734 = _5732 ? 0 : (-1);
    uint _5736 = uint(int(uint(_5710) >> uint(31)));
    int _5738 = ~_5728;
    int _5740 = _5608 + _5738;
    int _5742 = _5740 + 1;
    float _5744 = _5716 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _5746 = ~_5480;
    int _5748 = _5746 + _5724;
    int _5750 = _5748 + 1;
    int _5752 = ~int(_5730);
    int _5754 = _5752 + 1;
    float _5756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _5758 = ~_5734;
    int _5760 = _5550 + _5758;
    int _5762 = _5760 + 1;
    int _5764 = _4814 * _5750;
    int _5766 = _5764 + _5144;
    float _5768 = float(_5678);
    float _5770 = -_159;
    float _5772 = fma(_5770, (*spvDescriptorSet0.vp_c9)._m0[76].x, _4200);
    int _5774 = ~_5700;
    int _5776 = _5556 + _5774;
    int _5778 = _5776 + 1;
    int _5780 = ~int(_5736);
    int _5782 = _5780 + 1;
    float _5784 = fma(_5712, _5768, _5772);
    bool _5786 = !_5708;
    int _5788 = _5786 ? 0 : (-1);
    float _5790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5792 = _5778 ^ _5782;
    uint _5794 = uint(int(uint(_5720) >> uint(31)));
    int _5796 = ~_5788;
    int _5798 = _5584 + _5796;
    int _5800 = _5798 + 1;
    float _5802 = _5756 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _5804 = ~_5782;
    int _5806 = _5804 + _5792;
    int _5808 = _5806 + 1;
    float _5810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    int _5812 = ~int(_5794);
    int _5814 = _5812 + 1;
    bool _5816 = !_5714;
    int _5818 = _5816 ? _5696 : (-1);
    int _5820 = _5144 ^ _4814;
    float _5822 = -_5542;
    float _5824 = _5822 + 1.0;
    float _5826 = float(_5818);
    bool _5828 = _4814 == 0;
    uint _5830 = uint(int(uint(_5820) >> uint(31)));
    float _5832 = fma(_5802, _5826, _5470);
    bool _5834 = !_5828;
    int _5836 = _5834 ? _5766 : (-1);
    int _5838 = ~int(_5830);
    int _5840 = _5838 + 1;
    float _5842 = _5810 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _5844 = _5762 ^ _5754;
    float _5846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _5848 = float(_5836);
    float _5850 = _5308 + 0.5;
    int _5852 = _5800 ^ _5840;
    bool _5854 = _4768 == 0;
    float _5856 = fma(_5712, _5850, _5784);
    int _5858 = ~_5754;
    int _5860 = _5858 + _5844;
    int _5862 = _5860 + 1;
    float _5864 = -_159;
    float _5866 = fma(_5864, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4226);
    int _5868 = _5742 ^ _5814;
    float _5870 = _5702 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _5872 = float(_5706);
    float _5874 = -_5668;
    float _5876 = fma(_5308, _5874, _5856);
    int _5878 = ~_5840;
    int _5880 = _5878 + _5852;
    int _5882 = _5880 + 1;
    float _5884 = -_4336;
    float _5886 = _4172 + _5884;
    int _5888 = ~_5814;
    int _5890 = _5888 + _5868;
    int _5892 = _5890 + 1;
    float _5894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _5896 = !_5854;
    int _5898 = _5896 ? _5862 : (-1);
    float _5900 = -_159;
    float _5902 = fma(_5900, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4112);
    float _5904 = fma(_5744, _5872, _5866);
    float _5906 = _5304 + 0.5;
    float _5908 = float(_5898);
    float _5910 = fma(_5842, _5848, _5902);
    bool _5912 = _4848 == 0;
    float _5914 = _5294 + 0.5;
    bool _5916 = _4814 == 0;
    float _5918 = fma(_5744, _5906, _5904);
    bool _5920 = !_5912;
    int _5922 = _5920 ? _5808 : (-1);
    float _5924 = _1843 + 0.5;
    float _5926 = -_5494;
    float _5928 = fma(_5870, _5908, _5926);
    float _5930 = fma(_5842, _5914, _5910);
    bool _5932 = !_5718;
    int _5934 = _5932 ? _5892 : (-1);
    float _5936 = fma(_5802, _5924, _5832);
    bool _5938 = !_5916;
    int _5940 = _5938 ? _5882 : (-1);
    float _5942 = _5790 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5944 = float(_5934);
    float _5946 = _4472 + (-0.5);
    float _5948 = float(_5922);
    float _5950 = _5894 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _5952 = float(_5940);
    float _5954 = fma(_5238, _5238, 1.0);
    float _5956 = _5846 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5958 = -_5870;
    float _5960 = fma(_5958, _5946, _5928);
    float _5962 = -_5508;
    float _5964 = fma(_5942, _5948, _5962);
    float _5966 = -_5514;
    float _5968 = fma(_5950, _5952, _5966);
    float _5970 = _1901 + (-0.5);
    float _5972 = _1603 + (-0.5);
    float _5974 = rsqrt(_5954);
    float _5976 = -_5566;
    float _5978 = fma(_5956, _5944, _5976);
    float _5980 = -_5942;
    float _5982 = fma(_5980, _5970, _5964);
    float _5984 = -_5950;
    float _5986 = fma(_5984, _5972, _5968);
    float _5988 = -_4134;
    float _5990 = _5988 + _5450;
    float _5992 = _1847 + (-0.5);
    float _5994 = -_5570;
    float _5996 = _5994 + 1.0;
    float _5998 = fma(_5824, _1603, _5986);
    float _6000 = _5990 * _5990;
    float _6002 = -_4146;
    float _6004 = _6002 + _5452;
    float _6006 = -_5956;
    float _6008 = fma(_6006, _5992, _5978);
    float _6010 = -_5996;
    float _6012 = fma(_6010, _5294, _5930);
    float _6014 = -_4172;
    float _6016 = _6014 + _5454;
    float _6018 = fma(_6004, _6004, _6000);
    float _6020 = fma(_1847, _5650, _6008);
    float _6022 = -_5582;
    float _6024 = _6022 + 1.0;
    float _6026 = _5238 * _5974;
    float _6028 = fma(_6016, _6016, _6018);
    float _6030 = -_5612;
    float _6032 = fma(_1843, _6030, _5936);
    float _6034 = fma(_1901, _6024, _5982);
    float _6036 = -_4818;
    float _6038 = _6026 * _6036;
    float _6040 = sqrt(_6028);
    float _6042 = -_4820;
    float _6044 = _6026 * _6042;
    float _6046 = _4816 + _5328;
    float _6048 = fma(_5974, _4674, _6038);
    float _6050 = _4818 + _5334;
    float _6052 = fma(_5974, _4676, _6044);
    float _6054 = _4820 + _5336;
    out.m_86.x = _6032;
    out.m_86.y = _6020;
    float _6056 = -_4816;
    float _6058 = _6026 * _6056;
    float _6060 = -_5620;
    float _6062 = _6060 + 1.0;
    float _6064 = -_5682;
    float _6066 = fma(_5304, _6064, _5918);
    out.m_88.x = _6012;
    out.m_88.y = _5998;
    float _6068 = fma(_5974, _4672, _6058);
    float _6070 = fma(_4472, _6062, _5960);
    float _6072 = -_4320;
    float _6074 = _6072 + _5452;
    out.m_90.x = _6046;
    out.m_90.y = _6050;
    out.m_90.z = _6054;
    bool _6076 = _6040 > 0.0;
    float _6078 = -_4288;
    float _6080 = _6078 + _5450;
    float _6082 = -_4336;
    float _6084 = _6082 + _5454;
    out.m_92.x = _6068;
    out.m_92.y = _6048;
    out.m_92.z = _6052;
    float _6086 = -_4320;
    float _6088 = _4146 + _6086;
    float _6090 = -_4288;
    float _6092 = _4134 + _6090;
    out.m_94.x = _5876;
    out.m_94.y = _6070;
    out.m_94.z = _6066;
    out.m_94.w = _6034;
    float _6094 = _5450;
    float _6096 = _6052;
    float _6098 = _6070;
    float _6100 = _5876;
    float _6102 = _6048;
    float _6104 = _5582;
    if (!_6076)
    {
        _6094 = _6074;
    }
    float _6106 = _6094;
    float _6108 = _6106;
    float _6110 = _6106;
    if (!_6076)
    {
        _6096 = _6080;
    }
    float _6112 = _6096;
    float _6114 = _6112;
    float _6116 = _6112;
    if (!_6076)
    {
        _6098 = _6084;
    }
    float _6118 = _6098;
    bool _6120 = !_6076;
    float _6122 = _6118;
    float _6124 = _6118;
    if (!_6120)
    {
        bool _6126 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _6128 = _6068;
        if (_6126)
        {
            float _6130 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _6128 = _6130;
        }
        float _6132 = _6128;
        float _6134 = _6132;
        if (_6126)
        {
            float _6136 = _513 * _6132;
            _6100 = _6136;
        }
        float _6138 = _6100;
        float _6140 = _6138;
        if (_6126)
        {
            float _6142 = _515 * _6132;
            _6102 = _6142;
        }
        float _6144 = _6102;
        float _6146 = _6144;
        if (_6126)
        {
            float _6148 = _517 * _6132;
            _6134 = _6148;
        }
        float _6150 = _6134;
        float _6152 = _6150;
        float _6154 = _6150;
        if (!_6126)
        {
            bool _6156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _6158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _6160 = _6156 || _6158;
            bool _6162 = isnan(1.0);
            bool _6164 = _6160 || _6162;
            float _6166 = _159 + 1.0;
            float _6168 = _6166;
            if (!_6164)
            {
                float _6170 = _6166 * _6166;
                float _6172 = _6170 * 0.5;
                _6152 = _6172;
            }
            float _6174 = _6152;
            float _6176 = _6174;
            if (!_6164)
            {
                float _6178 = _6174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _6176 = _6178;
            }
            float _6180 = _6176;
            bool _6182 = !_6164;
            float _6184 = _6180;
            if (!_6182)
            {
                float _6186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6188 = log2(_6186);
                float _6190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6192 = _6188 * _6166;
                float _6194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _6196 = 1.0 + _6194;
                float _6198 = 1.0 / _6196;
                float _6200 = _6190 * 0.693147182464599609375;
                float _6202 = exp2(_6192);
                float _6204 = 1.0 / _6200;
                float _6206 = _6202 + (-1.0);
                float _6208 = -_6206;
                float _6210 = fma(_6208, _6204, _6166);
                float _6212 = _6210 * _6198;
                float _6214 = _6212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _6184 = _6214;
            }
            float _6216 = _6184;
            float _6218 = _6216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _6220 = _6216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _6222 = !_6164;
            if (!_6222)
            {
                float _6224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6226 = log2(_6224);
                float _6228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _6230 = 1.0 + _6228;
                float _6232 = 1.0 / _6230;
                float _6234 = _6226 * _6166;
                float _6236 = exp2(_6234);
                float _6238 = -_6236;
                float _6240 = _6238 + 1.0;
                float _6242 = _6240 * _6232;
                _6168 = _6242;
            }
            float _6244 = _6168;
            float _6246 = fma(_6244, _211, _6220);
            float _6248 = _6216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _6250 = fma(_6244, _209, _6218);
            float _6252 = -_433;
            float _6254 = _6252 + _6246;
            float _6256 = fma(_6244, _213, _6248);
            float _6258 = -_441;
            float _6260 = _6258 + _6250;
            float _6262 = _6254 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _6264 = _6254 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _6266 = -_449;
            float _6268 = _6266 + _6256;
            float _6270 = fma(_6260, (*spvDescriptorSet0.vp_c10)._m0[14].y, _6262);
            float _6272 = fma(_6260, (*spvDescriptorSet0.vp_c10)._m0[14].x, _6264);
            float _6274 = _6254 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _6276 = _6254 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _6278 = fma(_6268, (*spvDescriptorSet0.vp_c10)._m0[16].y, _6270);
            float _6280 = fma(_6268, (*spvDescriptorSet0.vp_c10)._m0[16].x, _6272);
            float _6282 = fma(_6260, (*spvDescriptorSet0.vp_c10)._m0[14].z, _6274);
            float _6284 = fma(_6260, (*spvDescriptorSet0.vp_c10)._m0[14].w, _6276);
            float _6286 = _437 * _6278;
            float _6288 = _199 * _6280;
            float _6290 = fma(_6268, (*spvDescriptorSet0.vp_c10)._m0[16].z, _6282);
            float _6292 = fma(_6268, (*spvDescriptorSet0.vp_c10)._m0[16].w, _6284);
            float _6294 = _6286 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _6296 = _6286 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _6298 = _6286 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _6300 = _457 * _6290;
            float _6302 = fma(_6288, (*spvDescriptorSet0.vp_c8)._m0[24].x, _6294);
            float _6304 = fma(_6288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _6296);
            float _6306 = fma(_6288, (*spvDescriptorSet0.vp_c8)._m0[26].x, _6298);
            float _6308 = fma(_6300, (*spvDescriptorSet0.vp_c8)._m0[24].z, _6302);
            float _6310 = fma(_6300, (*spvDescriptorSet0.vp_c8)._m0[25].z, _6304);
            float _6312 = fma(_6300, (*spvDescriptorSet0.vp_c8)._m0[26].z, _6306);
            float _6314 = fma(_6292, (*spvDescriptorSet0.vp_c8)._m0[24].w, _6308);
            float _6316 = fma(_6292, (*spvDescriptorSet0.vp_c8)._m0[25].w, _6310);
            float _6318 = fma(_6292, (*spvDescriptorSet0.vp_c8)._m0[26].w, _6312);
            _521 = _6316;
            _523 = _6314;
            _525 = _6318;
            _6140 = _6314;
            _6146 = _6316;
            _6154 = _6318;
            _6122 = _6248;
            _6114 = _6310;
        }
        float _6320 = _521;
        float _6322 = _523;
        float _6324 = _525;
        float _6326 = _6140;
        float _6328 = _6146;
        float _6330 = _6154;
        float _6332 = _6122;
        float _6334 = _6114;
        float _6336 = _6320 * _6320;
        float _6338 = rsqrt(_6028);
        float _6340 = fma(_6322, _6322, _6336);
        float _6342 = fma(_6324, _6324, _6340);
        float _6344 = sqrt(_6342);
        float _6346 = _6004 * _6338;
        float _6348 = _5990 * _6338;
        float _6350 = _6016 * _6338;
        bool _6352 = _6344 > 0.0;
        float _6354 = _6334;
        float _6356 = _6332;
        if (!_6352)
        {
            _6108 = _6074;
        }
        float _6358 = _6108;
        _6110 = _6358;
        if (!_6352)
        {
            _6354 = _6080;
        }
        float _6360 = _6354;
        _6116 = _6360;
        if (!_6352)
        {
            _6356 = _6084;
        }
        float _6362 = _6356;
        bool _6364 = !_6352;
        _6124 = _6362;
        if (!_6364)
        {
            float _6366 = rsqrt(_6342);
            float _6368 = _6366 * _6320;
            float _6370 = _6366 * _6322;
            float _6372 = _6366 * _6324;
            float _6374 = _6348 * _6368;
            float _6376 = fma(_6346, _6370, _6374);
            float _6378 = fma(_6350, _6372, _6376);
            float _6380 = _6378 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6382 = fma(_6326, _6380, _6074);
            float _6384 = fma(_6328, _6380, _6080);
            float _6386 = fma(_6330, _6380, _6084);
            _6124 = _6386;
            _6116 = _6384;
            _6110 = _6382;
        }
    }
    float _6388 = _6124;
    float _6390 = _6116;
    float _6392 = _6110;
    float _6394 = fma(_6088, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6396 = fma(_5886, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6398 = floor(_6394);
    float _6400 = floor(_6396);
    float _6402 = -_6398;
    float _6404 = _6394 + _6402;
    float _6406 = -_6400;
    float _6408 = _6396 + _6406;
    float2 _17130 = float2(_6404, _6408);
    float _6410 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_17130, float2(0.0), isnan(_17130)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_17130, float2(0.0), isnan(_17130)), level(0.0)).x;
    float _6412 = _6092 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _6414 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _6416 = fma(_6088, (*spvDescriptorSet0.vp_c8)._m0[11].x, _6412);
    bool _6418 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _6420 = isnan(0.5);
    bool _6422 = _6418 || _6420;
    bool _6424 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _6426 = _6422 || _6424;
    float _6428 = _6092 + _6414;
    float _6430 = fma(_5886, (*spvDescriptorSet0.vp_c8)._m0[11].z, _6416);
    float _6432 = _6092 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6434 = _6430 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6436 = fma(_6088, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6432);
    float _6438 = 1.0 / _6434;
    float _6440 = fma(_5886, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6436);
    float _6442 = _6440 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6444 = _6442 + _6434;
    float _6446 = _6444 * _6438;
    float _6448 = _6446 * 0.5;
    float _6450 = _6428 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _6452 = _6438;
    int _6454 = 2;
    if (_6426)
    {
        _6452 = _6388;
    }
    float _6456 = _6452;
    float _6458 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6460 = fma(_6448, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6458);
    float _6462 = fma(_6088, (*spvDescriptorSet0.vp_c15)._m0[126].x, _6450);
    float _6464 = fma(_5886, (*spvDescriptorSet0.vp_c15)._m0[126].z, _6462);
    float _6466 = 1.0 / _6460;
    float _6468 = _6464 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _6470 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6472 = _6466 * _6470;
    float _6474 = _6428 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _6476 = _6472 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _6478 = fma(_6088, (*spvDescriptorSet0.vp_c15)._m0[127].x, _6474);
    bool _6480 = _6472 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _6482 = !_6476;
    int _6484 = _6482 ? 0 : 1;
    float _6486 = fma(_5886, (*spvDescriptorSet0.vp_c15)._m0[127].z, _6478);
    float _6488 = _6486 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _6490 = _6456;
    if (!_6476)
    {
        _6454 = 1;
    }
    int _6492 = _6454;
    float _6494 = trunc(_6488);
    int _6496 = int(_6494);
    int _6498 = _6492;
    if (!_6480)
    {
        _6498 = _6484;
    }
    int _6500 = _6498;
    int _6502 = _6500 << 6;
    float _6504 = trunc(_6468);
    int _6506 = int(_6504);
    int _6508 = _6502 + 48;
    uint _6510 = uint(int(uint(_6508) >> uint(2)));
    uint _6512 = uint(int(uint(int(_6510)) >> uint(2)));
    int _6514 = int(_6510) & 3;
    float _6516 = (*spvDescriptorSet0.vp_c15)._m0[int(_6512)][_6514];
    int _6518 = int(_6510) + 1;
    uint _6520 = uint(int(uint(_6518) >> uint(2)));
    int _6522 = _6518 & 3;
    float _6524 = (*spvDescriptorSet0.vp_c15)._m0[int(_6520)][_6522];
    int _6526 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _6528 = _6496 + _6526;
    int _6530 = _6528 + 1;
    int _6532 = _6502 + 56;
    uint _6534 = uint(int(uint(_6532) >> uint(2)));
    uint _6536 = uint(int(uint(int(_6534)) >> uint(2)));
    int _6538 = int(_6534) & 3;
    float _6540 = (*spvDescriptorSet0.vp_c15)._m0[int(_6536)][_6538];
    int _6542 = int(_6534) + 1;
    uint _6544 = uint(int(uint(_6542) >> uint(2)));
    int _6546 = _6542 & 3;
    float _6548 = (*spvDescriptorSet0.vp_c15)._m0[int(_6544)][_6546];
    float _6550 = as_type<float>(_6496);
    float _6552 = as_type<float>(_6500);
    if (_6426)
    {
        _6550 = _6390;
    }
    float _6554 = _6550;
    int _6556 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _6558 = _6506 + _6556;
    int _6560 = _6558 + 1;
    int _6562 = _6502 + 64;
    uint _6564 = uint(int(uint(_6562) >> uint(2)));
    uint _6566 = uint(int(uint(int(_6564)) >> uint(2)));
    int _6568 = int(_6564) & 3;
    float _6570 = (*spvDescriptorSet0.vp_c15)._m0[int(_6566)][_6568];
    int _6572 = int(_6564) + 1;
    uint _6574 = uint(int(uint(_6572) >> uint(2)));
    int _6576 = _6572 & 3;
    float _6578 = (*spvDescriptorSet0.vp_c15)._m0[int(_6574)][_6576];
    bool _6580 = _6560 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _6582 = _6560 | _6530;
    int _6584 = _6502 + 72;
    uint _6586 = uint(int(uint(_6584) >> uint(2)));
    uint _6588 = uint(int(uint(int(_6586)) >> uint(2)));
    int _6590 = int(_6586) & 3;
    float _6592 = (*spvDescriptorSet0.vp_c15)._m0[int(_6588)][_6590];
    int _6594 = int(_6586) + 1;
    uint _6596 = uint(int(uint(_6594) >> uint(2)));
    int _6598 = _6594 & 3;
    float _6600 = (*spvDescriptorSet0.vp_c15)._m0[int(_6596)][_6598];
    bool _6602 = _6582 < 0;
    bool _6604 = _6602 || _6580;
    float _6606 = as_type<float>(_6582);
    float _6608 = _6554;
    int _6610 = _6560;
    if (_6426)
    {
        _6606 = _6392;
    }
    float _6612 = _6606;
    bool _6614 = _6530 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _6616 = _6614 || _6604;
    int _6618 = _6502 + 96;
    uint _6620 = uint(int(uint(_6618) >> uint(2)));
    uint _6622 = uint(int(uint(int(_6620)) >> uint(2)));
    int _6624 = int(_6620) & 3;
    float _6626 = (*spvDescriptorSet0.vp_c15)._m0[int(_6622)][_6624];
    int _6628 = int(_6620) + 1;
    uint _6630 = uint(int(uint(_6628) >> uint(2)));
    int _6632 = _6628 & 3;
    float _6634 = (*spvDescriptorSet0.vp_c15)._m0[int(_6630)][_6632];
    int _6636 = _6502 + 104;
    uint _6638 = uint(int(uint(_6636) >> uint(2)));
    uint _6640 = uint(int(uint(int(_6638)) >> uint(2)));
    int _6642 = int(_6638) & 3;
    float _6644 = (*spvDescriptorSet0.vp_c15)._m0[int(_6640)][_6642];
    int _6646 = int(_6638) + 1;
    uint _6648 = uint(int(uint(_6646) >> uint(2)));
    int _6650 = _6646 & 3;
    float _6652 = (*spvDescriptorSet0.vp_c15)._m0[int(_6648)][_6650];
    float _6654 = _6612;
    int _6656 = as_type<int>(_6524);
    int _6658 = as_type<int>(_6516);
    if (!_6426)
    {
        float _6660 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _6662 = _6092 + _6660;
        float _6664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _6666 = _6088 + _6664;
        float _6668 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6670 = -_6088;
        float _6672 = _6670 + _6392;
        float _6674 = _6662 * _6662;
        float _6676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _6678 = _5886 + _6676;
        float _6680 = -_6092;
        float _6682 = _6680 + _6390;
        float _6684 = -_5886;
        float _6686 = _6684 + _6388;
        float _6688 = fma(_6666, _6666, _6674);
        float _6690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6692 = fma(_6678, _6678, _6688);
        float _6694 = sqrt(_6692);
        float _6696 = _6668 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6698 = precise::min(_6694, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6700 = _6698 * _6690;
        float _6702 = _6696 * _6700;
        float _6704 = fma(_6672, _6702, _6088);
        float _6706 = fma(_6682, _6702, _6092);
        float _6708 = fma(_6686, _6702, _5886);
        _6608 = _6706;
        _6654 = _6704;
        _6490 = _6708;
    }
    float _6710 = _6608;
    float _6712 = _6654;
    float _6714 = _6490;
    float _6716 = _6428 * _6634;
    if (!_6616)
    {
        int _6718 = _6530 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _6720 = _6718 + _6560;
        _6610 = _6720;
    }
    int _6722 = _6610;
    float _6724 = _6710 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6726 = _6428 * _6578;
    float _6728 = fma(_6088, _6626, _6716);
    float _6730 = _6428 * _6524;
    float _6732 = fma(_6712, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6724);
    if (!_6616)
    {
        int _6734 = _6722 << 2;
        _6656 = _6734;
    }
    int _6736 = _6656;
    float _6738 = fma(_5886, _6644, _6728);
    float _6740 = fma(_6088, _6516, _6730);
    int _6742 = _6502 + 80;
    uint _6744 = uint(int(uint(_6742) >> uint(2)));
    uint _6746 = uint(int(uint(int(_6744)) >> uint(2)));
    int _6748 = int(_6744) & 3;
    float _6750 = (*spvDescriptorSet0.vp_c15)._m0[int(_6746)][_6748];
    int _6752 = int(_6744) + 1;
    uint _6754 = uint(int(uint(_6752) >> uint(2)));
    int _6756 = _6752 & 3;
    float _6758 = (*spvDescriptorSet0.vp_c15)._m0[int(_6754)][_6756];
    float _6760 = fma(_6714, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6732);
    float _6762 = _6738 + _6652;
    int _6764 = _6736;
    if (!_6616)
    {
        uint _6766 = uint(int(uint(_6722) >> uint(2)));
        _6658 = int(_6766);
    }
    int _6768 = _6658;
    float _6770 = fma(_6088, _6570, _6726);
    int _6772 = _6768;
    if (!_6616)
    {
        int _6774 = 12 & _6736;
        _6764 = _6774;
    }
    int _6776 = _6764;
    float _6778 = 1.0 / _6762;
    float _6780 = fma(_5886, _6540, _6740);
    int _6782 = _6502 + 88;
    uint _6784 = uint(int(uint(_6782) >> uint(2)));
    uint _6786 = uint(int(uint(int(_6784)) >> uint(2)));
    int _6788 = int(_6784) & 3;
    float _6790 = (*spvDescriptorSet0.vp_c15)._m0[int(_6786)][_6788];
    int _6792 = int(_6784) + 1;
    uint _6794 = uint(int(uint(_6792) >> uint(2)));
    int _6796 = _6792 & 3;
    float _6798 = (*spvDescriptorSet0.vp_c15)._m0[int(_6794)][_6796];
    if (!_6616)
    {
        int _6800 = _6768 << 4;
        int _6802 = _6800 + _6776;
        _6772 = _6802;
    }
    int _6804 = _6772;
    float _6806 = _6710 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6808 = fma(_5886, _6592, _6770);
    float _6810 = _6710 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6812 = _6780 + _6548;
    float _6814 = fma(_6712, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6806);
    float _6816 = _6808 + _6600;
    float _6818 = _6644;
    if (!_6616)
    {
        int _6820 = _6804 + 400;
        uint _6822 = uint(int(uint(_6820) >> uint(2)));
        uint _6824 = uint(int(uint(int(_6822)) >> uint(2)));
        int _6826 = int(_6822) & 3;
        float _6828 = (*spvDescriptorSet0.vp_c15)._m0[int(_6824)][_6826];
        _6818 = _6828;
    }
    float _6830 = _6818;
    float _6832 = fma(_6712, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6810);
    float _6834 = fma(_6714, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6814);
    float _6836 = _6710 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6838 = _6760 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6840 = fma(_6714, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6832);
    float _6842 = _6812 * _6778;
    float _6844 = _6834 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6846 = _6816 * _6778;
    float _6848 = fma(_6712, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6836);
    float _6850 = _6840 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6852 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _6854 = _6842 >= 0.0;
    float _6856 = fma(_6714, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6848);
    float _6858 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _6860 = fma(_6850, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6852);
    bool _6862 = _6842 <= 1.0;
    bool _6864 = _6862 && _6854;
    float _6866 = _6856 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6868 = _6838 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6870 = fma(_6838, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6860);
    bool _6872 = _6846 >= 0.0;
    bool _6874 = _6872 && _6864;
    float _6876 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6878 = -_6868;
    float _6880 = fma(_6878, _6858, 1.0);
    float _6882 = fma(_6866, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6870);
    bool _6884 = _6846 <= 1.0;
    bool _6886 = _6884 && _6874;
    float _6888 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6890 = fma(_6850, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6876);
    float _6892 = 1.0 / _6882;
    float _6894 = fma(_6850, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6888);
    float _6896 = _6428 * _6758;
    float _6898 = fma(_6838, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6894);
    float _6900 = log2(_6880);
    float _6902 = fma(_6088, _6750, _6896);
    float _6904 = fma(_6838, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6890);
    float _6906 = _6778;
    float _6908 = _6866;
    float _6910 = _6882;
    if (_6886)
    {
        float _6912 = float(_6500);
        _6552 = _6912;
    }
    float _6914 = _6552;
    float _6916 = fma(_6866, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6898);
    float _6918 = fma(_5886, _6790, _6902);
    float _6920 = fma(_6866, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6904);
    float _6922 = _6880;
    float _6924 = _6914;
    if (!_6616)
    {
        float _6926 = floor(_6488);
        _6922 = _6926;
    }
    float _6928 = _6922;
    float _6930 = _6918 + _6798;
    float _6932 = _6916 * _6892;
    float _6934 = _6920 * _6892;
    float _6936 = _6930 * _6778;
    float _6938 = fma(_6934, -0.5, 0.5);
    float _6940 = _6868;
    if (!_6616)
    {
        float _6942 = floor(_6468);
        _6940 = _6942;
    }
    float _6944 = _6940;
    float _6946 = _6900 * 0.693147182464599609375;
    float _6948 = _6946 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6950 = _6876;
    float _6952 = _6948;
    if (_6886)
    {
        float _6954 = rint(_6914);
        float _6956 = precise::max(_6954, 0.0);
        uint _6958 = uint(_6956);
        uint _6960 = clamp(_6958, 0u, 65535u);
        _6950 = as_type<float>(_6960);
    }
    float _6962 = _6950;
    float _6964 = _6928;
    if (!_6616)
    {
        float _6966 = -_6928;
        float _6968 = _6488 + _6966;
        _6964 = _6968;
    }
    float _6970 = _6964;
    float _6972 = fma(_6932, 0.5, 0.5);
    float _6974 = _6892;
    if (!_6616)
    {
        float _6976 = rint(_6830);
        float _6978 = precise::max(_6976, 0.0);
        uint _6980 = uint(_6978);
        uint _6982 = clamp(_6980, 0u, 65535u);
        _6974 = as_type<float>(_6982);
    }
    float _6984 = _6974;
    float _6986 = _6944;
    if (!_6616)
    {
        float _6988 = -_6944;
        float _6990 = _6468 + _6988;
        _6906 = _6990;
    }
    float _6992 = _6906;
    float _6994 = _6846;
    if (_6886)
    {
        float3 _18116 = float3(_6842, _6846, float(as_type<int>(_6962)));
        float3 _18120 = select(_18116, float3(0.0), isnan(_18116));
        float _6996 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _18120.xy, uint(rint(_18120.z)), _6936, level(0.0));
        _6994 = _6996;
    }
    float _6998 = _6994;
    float3 _18130 = float3(_6972, _6938, _6948);
    float _7000 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_18130, float3(0.0), isnan(_18130)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_18130, float3(0.0), isnan(_18130)), level(0.0)).x;
    float3 _18139 = float3(_6972, _6938, _6948);
    float4 _7003 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_18139, float3(0.0), isnan(_18139)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_18139, float3(0.0), isnan(_18139)), level(0.0)).xyzw;
    float _7005 = _7003.x;
    float _7007 = _7003.y;
    float _7009 = _7003.z;
    float _7011 = _7003.w;
    float _7013 = _6970;
    float _7015 = _6984;
    if (!_6616)
    {
        float3 _18163 = float3(_6992, _6970, float(as_type<int>(_6984)));
        float3 _18165 = select(_18163, float3(0.0), isnan(_18163));
        float _7017 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _18165.xy, uint(rint(_18165.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _18165.xy, uint(rint(_18165.z)), level(0.0)).x;
        _7013 = _7017;
    }
    float _7019 = _7013;
    if (_6616)
    {
        _6924 = 1.0;
    }
    float _7021 = _6924;
    float _7023 = _7021;
    if (!_6616)
    {
        int _7025 = _6722 << 4;
        int _7027 = _7025 + 2048;
        uint _7029 = uint(int(uint(_7027) >> uint(2)));
        uint _7031 = uint(int(uint(int(_7029)) >> uint(2)));
        int _7033 = int(_7029) & 3;
        float _7035 = (*spvDescriptorSet0.vp_c15)._m0[int(_7031)][_7033];
        int _7037 = int(_7029) + 1;
        uint _7039 = uint(int(uint(_7037) >> uint(2)));
        int _7041 = _7037 & 3;
        float _7043 = (*spvDescriptorSet0.vp_c15)._m0[int(_7039)][_7041];
        int _7045 = _7027 + 8;
        uint _7047 = uint(int(uint(_7045) >> uint(2)));
        uint _7049 = uint(int(uint(int(_7047)) >> uint(2)));
        int _7051 = int(_7047) & 3;
        float _7053 = (*spvDescriptorSet0.vp_c15)._m0[int(_7049)][_7051];
        int _7055 = int(_7047) + 1;
        uint _7057 = uint(int(uint(_7055) >> uint(2)));
        int _7059 = _7055 & 3;
        float _7061 = (*spvDescriptorSet0.vp_c15)._m0[int(_7057)][_7059];
        float _7063 = _6428 * _7043;
        float _7065 = fma(_6088, _7035, _7063);
        float _7067 = fma(_5886, _7053, _7065);
        float _7069 = _7067 + _7061;
        float _7071 = precise::clamp(_7069, 0.0, 1.0);
        float _7073 = -_7071;
        float _7075 = _7073 + _7019;
        float _7077 = fma(_7075, 500.0, 1.5);
        float _7079 = exp2(_7077);
        float _7081 = 0.0 + _7079;
        float _7083 = precise::clamp(_7081, 0.0, 1.0);
        _7015 = _7053;
        _7023 = _7083;
    }
    float _7085 = _7015;
    float _7087 = _7023;
    float _7089 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _7091 = _6710 + _7089;
    float _7093 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _7095 = _6712 + _7093;
    float _7097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _7099 = _6714 + _7097;
    float _7101 = _7091 * _7091;
    float _7103 = fma(_7095, _7095, _7101);
    float _7105 = fma(_7099, _7099, _7103);
    float _7107 = rsqrt(_7105);
    float _7109 = _7107 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _7111 = _7095 * _7109;
    float _7113 = _7099 * _7109;
    float _7115 = _7111 * _7111;
    float _7117 = _7113 * _7113;
    float _7119 = _7115 + _7117;
    float _7121 = sqrt(_7119);
    bool _7123 = _7121 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _7125 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _7127 = _7121 + _7125;
    float _7129 = _7107;
    float _7131 = _7127;
    float _7133 = _7091;
    float _7135 = _7085;
    if (_7123)
    {
        float _7137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _7129 = _7137;
    }
    float _7139 = _7129;
    if (_7123)
    {
        float _7141 = rsqrt(_7119);
        _6986 = _7141;
    }
    float _7143 = _6986;
    float _7145 = _7143;
    if (_7123)
    {
        float _7147 = _7127 * _7139;
        _7131 = _7147;
    }
    float _7149 = _7131;
    float _7151 = sqrt(_7105);
    if (_7123)
    {
        float _7153 = _7149 * 0.15915493667125701904296875;
        _6952 = _7153;
    }
    float _7155 = _6952;
    float _7157 = _7099;
    if (_7123)
    {
        float _7159 = _7155 * 6.283185482025146484375;
        float _7161 = sin(_7159);
        _7157 = _7161;
    }
    float _7163 = _7157;
    float _7165 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _7167 = precise::max(0.0, _7165);
    float _7169 = _7139;
    float _7171 = _7167;
    if (_7123)
    {
        float _7173 = _7155 * 6.283185482025146484375;
        float _7175 = cos(_7173);
        _7169 = _7175;
    }
    float _7177 = _7169;
    float _7179 = -_7109;
    float _7181 = -_7167;
    float _7183 = fma(_7091, _7179, _7181);
    if (_7123)
    {
        float _7185 = _7183 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _7133 = _7185;
    }
    float _7187 = _7133;
    float _7189 = _7187;
    float _7191 = _7163;
    if (_7123)
    {
        float _7193 = fma(_7163, _7187, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _7189 = _7193;
    }
    float _7195 = _7189;
    float _7197 = _7195;
    if (!_7123)
    {
        _7191 = _7111;
    }
    float _7199 = _7191;
    float _7201 = _7199;
    if (_7123)
    {
        float _7203 = _7143 * _7195;
        _6104 = _7203;
    }
    float _7205 = _6104;
    float _7207 = _7177;
    if (_7123)
    {
        float _7209 = _7177 + (-1.0);
        _7171 = _7209;
    }
    float _7211 = _7171;
    float _7213 = _7211;
    if (!_7123)
    {
        _7197 = _7183;
    }
    float _7215 = _7197;
    float _7217 = _7215;
    if (_7123)
    {
        float _7219 = _7111 * _7205;
        _7201 = _7219;
    }
    float _7221 = _7201;
    if (_7123)
    {
        float _7223 = _7211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _7135 = _7223;
    }
    float _7225 = _7135;
    float _7227 = _7225;
    if (!_7123)
    {
        _7213 = _7113;
    }
    float _7229 = _7213;
    float _7231 = _7229;
    if (_7123)
    {
        float _7233 = _7113 * _7205;
        _7231 = _7233;
    }
    float _7235 = _7231;
    if (!_7123)
    {
        _7145 = _7115;
    }
    float _7237 = _7145;
    float _7239 = _7237;
    if (_7123)
    {
        float _7241 = fma(_7183, _7177, _7225);
        _7217 = _7241;
    }
    float _7243 = _7217;
    if (_7123)
    {
        float _7245 = _7221 * _7221;
        _7239 = _7245;
    }
    float _7247 = _7239;
    if (!_7123)
    {
        _7207 = _7117;
    }
    float _7249 = _7207;
    float _7251 = _7249;
    if (_7123)
    {
        float _7253 = _7235 * _7235;
        _7251 = _7253;
    }
    float _7255 = _7251;
    float _7257 = fma(_7243, _7243, _7247);
    float _7259 = _7257 + _7255;
    float _7261 = rsqrt(_7259);
    float _7263 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _7265 = fma(_7151, (*spvDescriptorSet0.vp_c15)._m0[23].w, _7263);
    float _7267 = precise::clamp(_7265, 0.0, 1.0);
    float _7269 = -_7267;
    float _7271 = _7269 + 1.0;
    float _7273 = abs(_7271);
    float _7275 = log2(_7273);
    float _7277 = _7261 * _7221;
    float _7279 = _7261 * _7243;
    float _7281 = _7261 * _7235;
    float _7283 = _7277 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _7285 = -_7283;
    float _7287 = fma(_7279, (*spvDescriptorSet0.vp_c15)._m0[21].y, _7285);
    float _7289 = -_7281;
    float _7291 = fma(_7289, (*spvDescriptorSet0.vp_c15)._m0[21].z, _7287);
    float _7293 = _7275 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _7295 = fma(_7291, -0.5, 0.5);
    float _7297 = fma(_7291, 0.5, 0.5);
    float _7299 = exp2(_7293);
    float _7301 = fma(_7297, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _7303 = fma(_7297, _7301, -0.212114393711090087890625);
    float _7305 = _7279 + 1.0;
    float _7307 = sqrt(_7295);
    float _7309 = fma(_7297, _7303, 1.570728778839111328125);
    float _7311 = -_7279;
    float _7313 = fma(_7299, _7305, _7311);
    float _7315 = fma(_7313, 0.5, 0.5);
    float _7317 = _7307 * 0.636619746685028076171875;
    float _7319 = -_7309;
    float _7321 = fma(_7317, _7319, 1.0);
    float2 _18636 = float2(_7321, _7315);
    float3 _7325 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_18636, float2(0.0), isnan(_18636)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_18636, float2(0.0), isnan(_18636)), level(0.0)).xyz;
    float _7327 = _7325.x;
    float _7329 = _7325.y;
    float _7331 = _7325.z;
    float _7333 = abs(_6472);
    float _7335 = log2(_7333);
    float _7337 = _7275 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _7339 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _7341 = isnan(0.5);
    bool _7343 = _7339 || _7341;
    bool _7345 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _7347 = _7343 || _7345;
    float _7349 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _7351 = -_6410;
    float _7353 = _7351 + 1.0;
    out.m_96.x = _6088;
    out.m_96.y = _6092;
    out.m_96.z = _5886;
    float _7355 = exp2(_7337);
    float _7357 = fma(_6850, (*spvDescriptorSet0.vp_c8)._m0[6].x, _7349);
    out.m_98.x = _6712;
    out.m_98.y = _6710;
    out.m_98.z = _6714;
    float _7359 = fma(_6838, (*spvDescriptorSet0.vp_c8)._m0[6].z, _7357);
    float _7361 = _7335 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _7363 = fma(_6866, (*spvDescriptorSet0.vp_c8)._m0[6].w, _7359);
    float _7365 = _7357;
    float _7367 = _7363;
    if (!_7347)
    {
        _7227 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _7369 = _7227;
    if (!_7347)
    {
        float _7371 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7373 = _6472 + _7371;
        _6908 = _7373;
    }
    float _7375 = _6908;
    if (_7347)
    {
        _7365 = 1.0;
    }
    float _7377 = _7365;
    float _7379 = exp2(_7361);
    out.gl_Position.x = _6916;
    out.gl_Position.y = _6920;
    out.gl_Position.z = _7363;
    out.gl_Position.w = _6882;
    float _7381 = -_7355;
    float _7383 = _7381 + 1.0;
    float _7385 = _7363 + _6882;
    float _7387 = _7385 * 0.5;
    float _7389 = fma(_7379, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _7391 = precise::clamp(_7389, 0.0, 1.0);
    bool _7393 = _6472 <= 8000.0;
    bool _7395 = isnan(_6472);
    bool _7397 = _7393 || _7395;
    bool _7399 = isnan(8000.0);
    bool _7401 = _7397 || _7399;
    float _7403 = float(_7401);
    float _7405 = _6916 + _6882;
    float _7407 = fma(_7391, -2.0, 3.0);
    float _7409 = _7391 * _7391;
    float _7411 = _7409 * _7407;
    float _7413 = _7409;
    float _7415 = _7405;
    float _7417 = _7377;
    if (!_7347)
    {
        float _7419 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7421 = _7369 + _7419;
        _7413 = _7421;
    }
    float _7423 = _7413;
    float _7425 = _7405 * 0.5;
    if (!_6886)
    {
        _7415 = 1.0;
    }
    float _7427 = _7415;
    float _7429 = -_7411;
    float _7431 = _7429 + 1.0;
    float _7433 = _7427;
    if (_6886)
    {
        bool _7435 = _6998 >= _6936;
        bool _7437 = isnan(_6998);
        bool _7439 = _7435 || _7437;
        bool _7441 = isnan(_6936);
        bool _7443 = _7439 || _7441;
        float _7445 = float(_7443);
        _7433 = _7445;
    }
    float _7447 = _7433;
    float _7449 = _7383 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _7451 = _7423;
    if (!_7347)
    {
        float _7453 = 1.0 / _7423;
        _7451 = _7453;
    }
    float _7455 = _7451;
    float _7457 = fma(_7431, (*spvDescriptorSet0.vp_c15)._m0[654].w, _7411);
    float _7459 = _6882 * 0.5;
    float _7461 = _7447 * _7087;
    float _7463 = -_7449;
    float _7465 = _7463 + 1.0;
    float _7467 = _7403 * _7457;
    float _7469 = fma(_6920, -0.5, _7459);
    bool _7471 = _7151 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _7473 = isnan(_7151);
    bool _7475 = _7471 || _7473;
    bool _7477 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _7479 = _7475 || _7477;
    float _7481 = _7467 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _7483 = _7011 * _7465;
    out.m_100.x = _7425;
    out.m_100.y = _7469;
    out.m_100.z = _7387;
    out.m_100.w = _6882;
    float _7485 = _7353 * _7481;
    float _7487 = precise::clamp(_7485, 0.0, 1.0);
    float _7489 = _7449 * _7000;
    float _7491 = _7461;
    float _7493 = _7465;
    if (!_7347)
    {
        float _7495 = _7375 * _7455;
        float _7497 = precise::clamp(_7495, 0.0, 1.0);
        _7417 = _7497;
    }
    float _7499 = _7417;
    float _7501 = -_7487;
    float _7503 = fma(_7501, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7505 = _7011 * _7489;
    float _7507 = _7505;
    if (!_7479)
    {
        _6910 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _7509 = _6910;
    float _7511 = -_7461;
    float _7513 = fma(_7511, _7503, 1.0);
    float _7515 = precise::clamp(_7513, 0.0, 1.0);
    float _7517 = _7515;
    float _7519 = _7509;
    float _7521 = _7509;
    if (!_7479)
    {
        _7491 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _7523 = _7491;
    float _7525 = _7523;
    float _7527 = _7523;
    if (!_7479)
    {
        _7367 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _7529 = _7367;
    float _7531 = _7515 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7533 = _7529;
    float _7535 = _7529;
    if (!_7479)
    {
        _7493 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _7537 = _7493;
    float _7539 = _7537;
    float _7541 = _7537;
    if (!_7479)
    {
        _7517 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7543 = _7517;
    out.m_102.x = _7531;
    float _7545 = _7331 * _7489;
    float _7547 = fma(_7327, _7505, _7005);
    float _7549 = fma(_7329, _7505, _7007);
    float _7551 = _7499 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _7553 = fma(_7011, _7545, _7009);
    float _7555 = _7543;
    float _7557 = _7543;
    if (!_7479)
    {
        _7507 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _7559 = _7507;
    out.m_104.x = _7547;
    out.m_104.y = _7549;
    out.m_104.z = _7553;
    out.m_104.w = _7483;
    bool _7561 = !_7479;
    float _7563 = _7559;
    float _7565 = _7559;
    if (!_7561)
    {
        bool _7567 = _7151 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7569 = isnan(_7151);
        bool _7571 = _7567 || _7569;
        bool _7573 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7575 = _7571 || _7573;
        if (!_7575)
        {
            float _7577 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7579 = _7151 + _7577;
            float _7581 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7583 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7581;
            float _7585 = 1.0 / _7583;
            float _7587 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7589 = _7587 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7591 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7593 = _7591 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7595 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7597 = _7595 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7599 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7601 = _7599 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7603 = _7579 * _7585;
            float _7605 = precise::clamp(_7603, 0.0, 1.0);
            float _7607 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7609 = _7607 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7611 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7613 = _7611 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7615 = fma(_7605, _7589, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7617 = fma(_7605, _7609, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7619 = fma(_7605, _7613, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7621 = fma(_7605, _7593, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7623 = fma(_7605, _7597, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7625 = fma(_7605, _7601, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _7541 = _7617;
            _7521 = _7623;
            _7565 = _7615;
            _7527 = _7621;
            _7557 = _7619;
            _7535 = _7625;
            _7627 = true;
        }
        else
        {
            bool _7629 = _7151 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7631 = isnan(_7151);
            bool _7633 = _7629 || _7631;
            bool _7635 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7637 = _7633 || _7635;
            if (!_7637)
            {
                _7525 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7639 = _7525;
            _7527 = _7639;
            if (!_7637)
            {
                _7519 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7641 = _7519;
            _7521 = _7641;
            if (!_7637)
            {
                _7533 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7643 = _7533;
            _7535 = _7643;
            if (!_7637)
            {
                _7563 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7645 = _7563;
            _7565 = _7645;
            if (!_7637)
            {
                _7539 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7647 = _7539;
            _7541 = _7647;
            if (!_7637)
            {
                _7555 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7649 = _7555;
            bool _7651 = !_7637;
            _7557 = _7649;
            if (!_7651)
            {
                bool _7653 = _7151 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7655 = isnan(_7151);
                bool _7657 = _7653 || _7655;
                bool _7659 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7661 = _7657 || _7659;
                if (!_7661)
                {
                    float _7663 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7665 = _7151 + _7663;
                    float _7667 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7669 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7667;
                    float _7671 = 1.0 / _7669;
                    float _7673 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7675 = _7673 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7677 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7679 = _7677 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7681 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7683 = _7681 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7685 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7687 = _7685 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7689 = _7665 * _7671;
                    float _7691 = precise::clamp(_7689, 0.0, 1.0);
                    float _7693 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7695 = _7693 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7697 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7699 = _7697 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7701 = fma(_7691, _7675, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7703 = fma(_7691, _7695, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7705 = fma(_7691, _7699, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7707 = fma(_7691, _7679, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7709 = fma(_7691, _7683, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7711 = fma(_7691, _7687, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _7541 = _7703;
                    _7521 = _7709;
                    _7565 = _7701;
                    _7527 = _7707;
                    _7557 = _7705;
                    _7535 = _7711;
                    _7627 = true;
                }
                else
                {
                    _7541 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _7521 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _7565 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _7527 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7557 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _7535 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7627 = false;
    float _7713 = _7541;
    float _7715 = _7521;
    float _7717 = _7565;
    float _7719 = _7527;
    float _7721 = _7557;
    float _7723 = _7535;
    float _7725 = fma(_6050, -0.5, 0.5);
    float _7727 = precise::clamp(_7725, 0.0, 1.0);
    float _7729 = -_7713;
    float _7731 = _7715 + _7729;
    float _7733 = _7551 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7735 = -_7717;
    float _7737 = _7719 + _7735;
    float _7739 = fma(_7727, _7731, _7713);
    out.m_106.x = 0.0;
    float _7741 = -_7721;
    float _7743 = _7723 + _7741;
    float _7745 = fma(_7727, _7737, _7717);
    float _7747 = _7739 * 0.586610972881317138671875;
    out.m_59.x = _7733;
    bool _7749 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7751 = fma(_7727, _7743, _7721);
    float _7753 = fma(_7745, 0.298911988735198974609375, _7747);
    bool _7755 = _7499 > 0.0;
    bool _7757 = isnan(_7499);
    bool _7759 = _7755 || _7757;
    bool _7761 = isnan(0.0);
    bool _7763 = _7759 || _7761;
    float _7765 = fma(_7751, 0.114477999508380889892578125, _7753);
    float _7767 = -_7765;
    float _7769 = _7745 + _7767;
    float _7771 = -_7765;
    float _7773 = _7739 + _7771;
    float _7775 = -_7765;
    float _7777 = _7751 + _7775;
    float _7779 = fma(_7769, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7765);
    float _7781 = fma(_7773, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7765);
    float _7783 = fma(_7777, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7765);
    bool _7785 = !_7749;
    if (!_7785)
    {
        float _7787 = -_6710;
        float _7789 = _7787 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7791 = -_6712;
        float _7793 = _7791 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7795 = -_6714;
        float _7797 = _7795 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7799 = _7789 * _7789;
        float _7801 = fma(_7793, _7793, _7799);
        float _7803 = fma(_7797, _7797, _7801);
        float _7805 = sqrt(_7803);
        float _7807 = rsqrt(_7803);
        float _7809 = -_7805;
        float _7811 = _7809 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7813 = _7811 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7815 = precise::clamp(_7813, 0.0, 1.0);
        float _7817 = _7793 * _7807;
        float _7819 = _7789 * _7807;
        float _7821 = abs(_7815);
        float _7823 = log2(_7821);
        float _7825 = _7797 * _7807;
        float _7827 = _7817 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7829 = _6050 * _7819;
        float _7831 = -_7819;
        float _7833 = -_7827;
        float _7835 = fma(_7831, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7833);
        float _7837 = fma(_6046, _7817, _7829);
        float _7839 = -_7825;
        float _7841 = fma(_7839, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7835);
        float _7843 = fma(_6054, _7825, _7837);
        float _7845 = precise::clamp(_7843, 0.0, 1.0);
        float _7847 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7849 = _7841 + _7847;
        float _7851 = _7823 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7853 = _7849 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7855 = precise::clamp(_7853, 0.0, 1.0);
        float _7857 = exp2(_7851);
        float _7859 = _7857 * _7855;
        float _7861 = _7845 * _7859;
        float _7863 = _7861 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7865 = _7861 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7867 = _7861 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _7863;
        out.m_106.y = _7865;
        out.m_106.z = _7867;
    }
    out.m_82.x = _7779;
    out.m_82.y = _7781;
    out.m_82.z = _7783;
    if (_7763)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _7869 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7869;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _7627 = false;
    bool _1421 = false;
    bool _1263 = false;
    bool _1121 = false;
    bool _839 = false;
    bool _545 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _7926 = as_type<float>(_141);
        out.gl_Position.z = _7926;
    }
    if (!_129)
    {
        return out;
    }
    float _145 = in.m_61.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_155)
    {
        float _161 = float(_125);
        _135 = _161;
    }
    float _163 = _135;
    bool _165 = _159 >= _163;
    bool _167 = !_155;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_59.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _143 = as_type<int>(_175);
    }
    int _177 = _143;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7995 = as_type<float>(_177);
        out.gl_Position.z = _7995;
    }
    if (_169)
    {
        return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_66.w;
    float _183 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _185 = in.m_56.x;
    float _187 = in.m_56.y;
    float _189 = in.m_56.z;
    float _191 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _183);
    float _193 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _191);
    float _197 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _193);
    float _199 = sqrt(_195);
    int _201 = as_type<int>(_179) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_179) & 2;
    bool _207 = _205 != 0;
    float _209 = in.m_61.x;
    float _211 = in.m_61.y;
    float _213 = in.m_61.z;
    bool _215 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _219 = _215 || _217;
    bool _221 = isnan(1.0);
    bool _223 = _219 || _221;
    bool _225 = !_203;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _231 = !_207;
    float _233 = _231 ? (-0.5) : 0.5;
    float _235 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _229);
    float _237 = _159 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _239 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _197);
    float _241 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _235);
    float _243 = _235;
    float _245 = _195;
    float _247 = _197;
    float _249 = _237;
    bool _251 = _223;
    if (!_223)
    {
        float _253 = _237 * _237;
        float _255 = _253 * 0.5;
        _243 = _255;
    }
    float _257 = _243;
    float _259 = _257;
    if (!_223)
    {
        float _261 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _261;
    }
    float _263 = _259;
    bool _265 = !_223;
    float _267 = _263;
    if (!_265)
    {
        float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = log2(_269);
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = _237 * _271;
        float _281 = 1.0 / _275;
        float _283 = _277 * 0.693147182464599609375;
        float _285 = exp2(_279);
        float _287 = 1.0 / _283;
        float _289 = _285 + (-1.0);
        float _291 = -_289;
        float _293 = fma(_291, _287, _237);
        float _295 = _293 * _281;
        float _297 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _287;
        _267 = _297;
        _247 = _285;
    }
    float _299 = _245;
    float _301 = _267;
    float _303 = _247;
    bool _305 = !_223;
    float _307 = _299;
    float _309 = _303;
    if (!_305)
    {
        float _311 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = log2(_311);
        float _315 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _317 = _315 + 1.0;
        float _319 = 1.0 / _317;
        float _321 = _237 * _313;
        float _323 = exp2(_321);
        float _325 = -_323;
        float _327 = _325 + 1.0;
        float _329 = _327 * _319;
        _307 = _323;
        _309 = _317;
        _249 = _329;
    }
    float _331 = _307;
    float _333 = _309;
    float _335 = _249;
    float _337 = _331;
    float _339 = _333;
    if (!_223)
    {
        float _341 = _159 * _159;
        float _343 = _341 * 0.5;
        _337 = _343;
    }
    float _345 = _337;
    float _347 = _345;
    if (!_223)
    {
        _339 = _159;
    }
    float _349 = _339;
    float _351 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _353 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _355 = _349;
    if (!_223)
    {
        float _357 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _347 = _357;
    }
    float _359 = _347;
    bool _361 = !_223;
    float _363 = _359;
    if (!_361)
    {
        float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _367 = log2(_365);
        float _369 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _371 = _369 + 1.0;
        float _373 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _375 = _159 * _367;
        float _377 = 1.0 / _371;
        float _379 = _373 * 0.693147182464599609375;
        float _381 = exp2(_375);
        float _383 = 1.0 / _379;
        float _385 = _381 + (-1.0);
        float _387 = -_385;
        float _389 = fma(_387, _383, _159);
        float _391 = _389 * _377;
        float _393 = _391 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _363 = _393;
    }
    float _395 = _363;
    bool _397 = !_223;
    if (!_397)
    {
        float _399 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _401 = log2(_399);
        float _403 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _405 = _403 + 1.0;
        float _407 = 1.0 / _405;
        float _409 = _159 * _401;
        float _411 = exp2(_409);
        float _413 = -_411;
        float _415 = _413 + 1.0;
        float _417 = _415 * _407;
        _355 = _417;
    }
    float _419 = _355;
    float _421 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _423 = _395 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _425 = fma(_335, _209, _351);
    float _427 = fma(_335, _211, _353);
    float _429 = fma(_335, _213, _421);
    float _431 = _395 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _433 = fma(_419, _211, _423);
    float _435 = fma(_427, _181, _187);
    float _437 = sqrt(_239);
    float _439 = _395 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _441 = fma(_419, _209, _431);
    float _443 = -_433;
    float _445 = _427 + _443;
    float _447 = fma(_425, _181, _185);
    float _449 = fma(_419, _213, _439);
    float _451 = -_441;
    float _453 = _425 + _451;
    float _455 = _445 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _457 = sqrt(_241);
    float _459 = -_449;
    float _461 = _429 + _459;
    float _463 = _445 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _465 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[14].y, _455);
    float _467 = _445 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _469 = _445 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _471 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[14].x, _463);
    float _473 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[16].y, _465);
    float _475 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[14].z, _467);
    float _477 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[14].w, _469);
    float _479 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[16].x, _471);
    float _481 = _437 * _473;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _485 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[16].z, _475);
    float _487 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[16].w, _477);
    float _489 = _481 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _491 = _481 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _493 = _199 * _479;
    float _495 = _481 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _497 = _457 * _485;
    float _499 = fma(_429, _181, _189);
    float _501 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[24].x, _489);
    float _503 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[25].x, _491);
    float _505 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[26].x, _495);
    float _507 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[24].z, _501);
    float _509 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[25].z, _503);
    float _511 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[26].z, _505);
    float _513 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[24].w, _507);
    float _515 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[25].w, _509);
    float _517 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[26].w, _511);
    bool _519 = !_483;
    float _521 = _515;
    float _523 = _513;
    float _525 = _517;
    float _543;
    if (!_519)
    {
        float _527 = in.m_68.x;
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _531 = _527 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_125);
        float _549 = 1.0 / _547;
        float _551 = _159 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _557 = _553 + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _567;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _575 = 1.0 / _561;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _577;
    float _581 = 1.0 / _569;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _585 = _553 + _583;
    bool _587 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _589 = 1.0 / _565;
    float _591 = _585 * _575;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _595 = _553 + _593;
    bool _597 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _599 = isnan(_553);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    bool _609 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _611 = isnan(_553);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = 1.0 / _573;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _625 = _553 + _623;
    float _627 = _595 * _581;
    bool _629 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _631 = isnan(_553);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = 1.0 / _579;
    float _643 = _557 * _589;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _647 = _553 + _645;
    float _649 = -_639;
    float _651 = _649 + 1.0;
    float _653 = _625 * _621;
    float _655 = -_607;
    float _657 = _655 + 1.0;
    float _659 = _619 * _651;
    bool _661 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _663 = isnan(_553);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = _639 * _657;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _675;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _679;
    float _683 = _647 * _641;
    bool _685 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _687 = isnan(_553);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -_619;
    float _699 = _697 + 1.0;
    float _701 = fma(_677, _591, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _703 = fma(_681, _591, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _705 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _707 = isnan(_553);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = _695 * _699;
    float _719 = -_695;
    float _721 = _719 + 1.0;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _731 = _671 * _721;
    float _733 = -_671;
    float _735 = _733 + 1.0;
    float _737 = -_715;
    float _739 = _737 + 1.0;
    float _741 = fma(_725, _643, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _743 = fma(_729, _643, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _745 = _715 * _735;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _747;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _751;
    float _755 = _701 * _745;
    float _757 = _703 * _745;
    float _759 = fma(_749, _627, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _761 = fma(_753, _627, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _763 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[143].x, _755);
    float _765 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[143].y, _757);
    float _767 = in.m_66.x;
    float _769 = in.m_66.y;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _775 = fma(_741, _731, _763);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _781 = fma(_743, _731, _765);
    float _783 = fma(_773, _653, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _785;
    float _789 = fma(_759, _717, _775);
    float _791 = fma(_779, _653, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _793;
    float _797 = fma(_761, _717, _781);
    float _799 = fma(_787, _683, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _801 = fma(_783, _659, _789);
    float _803 = fma(_795, _683, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _805 = fma(_791, _659, _797);
    float _807 = fma(_799, _673, _801);
    float _809 = fma(_803, _673, _805);
    float _811 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[148].x, _807);
    float _813 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[148].y, _809);
    float _815 = _811 * _767;
    float _817 = _813 * _769;
    bool _819 = !_587;
    float _837;
    if (!_819)
    {
        float _821 = in.m_68.x;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _825 = _821 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[11].x, _159);
        float _829 = _827 * _823;
        float _831 = floor(_829);
        float _833 = -_831;
        float _835 = _829 + _833;
        _837 = _835;
        _839 = true;
    }
    else
    {
        float _841 = float(_125);
        float _843 = 1.0 / _841;
        float _845 = _159 * _843;
        _837 = _845;
    }
    _839 = false;
    float _847 = _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _851 = _847 + _849;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _855 = _847 + _853;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _859 = _847 + _857;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _877 = 1.0 / _863;
    bool _879 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _881 = 1.0 / _867;
    bool _883 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _885 = isnan(_847);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = 1.0 / _871;
    float _897 = _855 * _877;
    bool _899 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _901 = isnan(_847);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = 1.0 / _875;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _915 = _847 + _913;
    float _917 = _915 * _881;
    bool _919 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _921 = isnan(_847);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = _851 * _895;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _933;
    float _937 = -_929;
    float _939 = _937 + 1.0;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _941;
    float _945 = _893 * _939;
    float _947 = _859 * _911;
    bool _949 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _951 = isnan(_847);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _961;
    float _965 = -_893;
    float _967 = _965 + 1.0;
    bool _969 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _971 = isnan(_847);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    float _981 = fma(_943, _931, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _983 = -_959;
    float _985 = _983 + 1.0;
    float _987 = fma(_935, _931, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _989 = fma(_963, _931, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _991 = _959 * _967;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _997 = _979 * _985;
    float _999 = -_979;
    float _1001 = _999 + 1.0;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1011 = fma(_995, _947, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1013 = _909 * _1001;
    float _1015 = fma(_1005, _947, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1017 = fma(_1009, _947, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1019 = -_909;
    float _1021 = _1019 + 1.0;
    float _1023 = _981 * _1013;
    float _1025 = _987 * _1013;
    float _1027 = _989 * _1013;
    float _1029 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1023);
    float _1031 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1025);
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1033;
    float _1037 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1027);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1039;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1043;
    float _1047 = fma(_1015, _997, _1029);
    float _1049 = fma(_1017, _997, _1031);
    float _1051 = fma(_1011, _997, _1037);
    float _1053 = fma(_1041, _897, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1055 = fma(_1035, _897, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1057 = fma(_1045, _897, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1065 = _1063 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1069 = _1067 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1071 = fma(_1053, _991, _1047);
    float _1073 = fma(_1061, _917, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1075 = fma(_1065, _917, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1077 = fma(_1069, _917, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1079 = fma(_1055, _991, _1049);
    float _1081 = fma(_1057, _991, _1051);
    float _1083 = fma(_1073, _945, _1071);
    float _1085 = fma(_1075, _945, _1079);
    float _1087 = fma(_1077, _945, _1081);
    float _1089 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1083);
    float _1091 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1085);
    float _1093 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1087);
    bool _1095 = !_879;
    float _1097 = _897;
    float _1099 = _1091;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1119;
    if (!_1095)
    {
        float _1103 = in.m_68.x;
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1107 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[11].y, _159);
        float _1111 = _1109 * _1105;
        float _1113 = floor(_1111);
        float _1115 = -_1113;
        float _1117 = _1111 + _1115;
        _1119 = _1117;
        _1121 = true;
    }
    else
    {
        float _1123 = float(_125);
        float _1125 = 1.0 / _1123;
        float _1127 = _159 * _1125;
        _1119 = _1127;
    }
    _1121 = false;
    float _1129 = _1119;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1133 = _1129 + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1139 = _1129 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1141 = isnan(_1129);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1155 = _1129 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1157 = isnan(_1129);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1167;
    bool _1171 = _1129 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1173 = isnan(_1129);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = 1.0 / _1137;
    float _1185 = -_1149;
    float _1187 = _1185 + 1.0;
    bool _1189 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1191 = 1.0 / _1153;
    float _1193 = _1169 * _1183;
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1197 = _1195 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1199 = fma(_1193, _1133, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1201 = _1165 * _1187;
    float _1203 = -_1181;
    float _1205 = _1203 + 1.0;
    float _1207 = -_1165;
    float _1209 = _1207 + 1.0;
    float _1211 = _1197 * _1191;
    float _1213 = _1199 * _1201;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1217 = _1129 + _1215;
    float _1219 = _1149 * _1205;
    float _1221 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1223 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1213);
    float _1225 = fma(_1211, _1217, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1227 = _1093 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1229 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1231 = fma(_1225, _1219, _1223);
    float _1233 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1235 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1231);
    float _1239 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1241 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _1229;
    out.m_70.y = _1239;
    out.m_70.z = _1235;
    out.m_70.w = _1241;
    bool _1243 = !_1189;
    float _1261;
    if (!_1243)
    {
        float _1245 = in.m_68.x;
        float _1247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1249 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[11].w, _159);
        float _1253 = _1251 * _1247;
        float _1255 = floor(_1253);
        float _1257 = -_1255;
        float _1259 = _1253 + _1257;
        _1261 = _1259;
        _1263 = true;
    }
    else
    {
        float _1265 = float(_125);
        float _1267 = 1.0 / _1265;
        float _1269 = _159 * _1267;
        _1261 = _1269;
    }
    _1263 = false;
    float _1271 = _1261;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1275 = _1271 + _1273;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1279 = _1277 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1281 = _1271 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1283 = isnan(_1271);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1295 = _1293 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1297 = _1271 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1299 = isnan(_1271);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1305 = _1301 || _1303;
    float _1307 = float(_1305);
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1309;
    bool _1313 = _1271 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1315 = isnan(_1271);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    float _1325 = 1.0 / _1279;
    float _1327 = -_1291;
    float _1329 = _1327 + 1.0;
    bool _1331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1333 = 1.0 / _1295;
    float _1335 = _1311 * _1325;
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1341 = fma(_1335, _1275, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1343 = _1307 * _1329;
    float _1345 = -_1323;
    float _1347 = _1345 + 1.0;
    float _1349 = -_1307;
    float _1351 = _1349 + 1.0;
    float _1353 = _1339 * _1333;
    float _1355 = _1341 * _1343;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1359 = _1271 + _1357;
    float _1361 = _1291 * _1347;
    float _1363 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1355);
    float _1365 = fma(_1353, _1359, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1367 = fma(_1365, _1361, _1363);
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1375 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1367);
    float _1377 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1379 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1381 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1383 = _1375 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _1377;
    out.m_72.y = _1379;
    out.m_72.z = _1381;
    out.m_72.w = _1383;
    bool _1385 = !_1331;
    float _1387 = _1371;
    float _1389 = _1383;
    float _1391 = _1381;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1395 = _1375;
    float _1397 = _1355;
    bool _1399 = _1331;
    float _1417;
    float _1419;
    if (!_1385)
    {
        float _1401 = in.m_68.x;
        float _1403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1405 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[14].x, _159);
        float _1409 = _1407 * _1403;
        float _1411 = floor(_1409);
        float _1413 = -_1411;
        float _1415 = _1409 + _1413;
        _1417 = _1409;
        _1387 = _1411;
        _1419 = _1415;
        _1421 = true;
    }
    else
    {
        float _1423 = float(_125);
        float _1425 = 1.0 / _1423;
        float _1427 = _159 * _1425;
        _1417 = _1425;
        _1419 = _1427;
    }
    _1421 = false;
    float _1429 = _1417;
    float _1431 = _1387;
    float _1433 = _1419;
    float _1435 = in.m_68.w;
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1439 = _1437 != 0;
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1443 = _1441 != 0;
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1447 = _1445 != 0;
    int _1449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1451 = _1449 != 0;
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1455 = _1453 != 0;
    float _1457 = _1429;
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _1461 = _1433;
    if (_1439)
    {
        float _1463 = in.m_68.x;
        _1457 = _1463;
    }
    float _1465 = _1457;
    if (!_1439)
    {
        _1097 = _233;
    }
    float _1467 = _1097;
    float _1469 = _1431;
    float _1471 = _1467;
    if (_1443)
    {
        float _1473 = in.m_68.z;
        _1469 = _1473;
    }
    float _1475 = _1469;
    if (!_1443)
    {
        _1389 = _227;
    }
    float _1477 = _1389;
    float _1479 = 0.0;
    float _1481 = _1477;
    if (_1455)
    {
        _1479 = 1.0;
    }
    float _1483 = _1479;
    float _1485 = _1483;
    if (!_1447)
    {
        _1391 = _233;
    }
    float _1487 = _1391;
    float _1489 = _1373;
    float _1491 = _1487;
    if (_1447)
    {
        float _1493 = in.m_68.w;
        _1489 = _1493;
    }
    float _1495 = _1489;
    float _1497 = 0.0;
    if (_1455)
    {
        _1497 = 1.0;
    }
    float _1499 = _1497;
    float _1501 = 0.0;
    float _1503 = _1499;
    if (_1455)
    {
        _1501 = 1.0;
    }
    float _1505 = _1501;
    int _1507 = 0;
    float _1509 = _1505;
    if (_1455)
    {
        _1507 = 0;
    }
    int _1511 = _1507;
    int _1513 = _1511;
    if (_1455)
    {
        _1459 = 0;
    }
    int _1515 = _1459;
    float _1517 = _1465;
    int _1519 = _1515;
    if (_1439)
    {
        float _1521 = _1465 * 3.1415927410125732421875;
        _1517 = _1521;
    }
    float _1523 = _1517;
    float _1525 = _1523;
    if (_1439)
    {
        float _1527 = _1523 * 0.15915493667125701904296875;
        _1393 = _1527;
    }
    float _1529 = _1393;
    if (_1443)
    {
        float _1531 = _1475 * 3.1415927410125732421875;
        _1525 = _1531;
    }
    float _1533 = _1525;
    if (_1447)
    {
        float _1535 = _1495 * 3.1415927410125732421875;
        _1395 = _1535;
    }
    float _1537 = _1395;
    float _1539 = _1537;
    if (_1443)
    {
        float _1541 = _1533 * 0.15915493667125701904296875;
        _1397 = _1541;
    }
    float _1543 = _1397;
    float _1545 = _1529;
    if (_1439)
    {
        float _1547 = _1529 * 6.283185482025146484375;
        float _1549 = sin(_1547);
        _1545 = _1549;
    }
    float _1551 = _1545;
    float _1553 = _1533;
    float _1555 = _1475;
    float _1557 = _1495;
    if (_1455)
    {
        float _1559 = in.m_68.x;
        float _1561 = in.m_68.y;
        float _1563 = in.m_68.z;
        _1553 = _1559;
        _1555 = _1561;
        _1557 = _1563;
    }
    float _1565 = _1553;
    float _1567 = _1555;
    float _1569 = _1557;
    if (_1447)
    {
        float _1571 = _1537 * 0.15915493667125701904296875;
        _1539 = _1571;
    }
    float _1573 = _1539;
    float _1575 = _1543;
    if (_1443)
    {
        float _1577 = _1543 * 6.283185482025146484375;
        float _1579 = sin(_1577);
        _1575 = _1579;
    }
    float _1581 = _1575;
    float _1583 = _1573;
    if (_1447)
    {
        float _1585 = _1573 * 6.283185482025146484375;
        float _1587 = sin(_1585);
        _1583 = _1587;
    }
    float _1589 = _1583;
    float _1591 = _1551;
    if (_1439)
    {
        bool _1593 = _1551 > 0.5;
        _1399 = _1593;
    }
    bool _1595 = _1399;
    bool _1597 = _1595;
    if (_1439)
    {
        float _1599 = -_233;
        float _1601 = _1595 ? _1599 : _233;
        _1471 = _1601;
    }
    float _1603 = _1471;
    float _1605 = _1567;
    float _1607 = _1565;
    float _1609 = _1569;
    if (_1455)
    {
        _1591 = _1565;
    }
    float _1611 = _1591;
    float _1613 = _1611;
    if (_1443)
    {
        bool _1615 = _1581 > 0.5;
        _251 = _1615;
    }
    bool _1617 = _251;
    int _1619 = int(_1595);
    int _1621 = _1447 ? 2 : 0;
    int _1623 = _1619 | _1621;
    int _1625 = _1617 ? 4 : 0;
    int _1627 = _1623 | _1625;
    int _1629 = _1443 ? 8 : 0;
    int _1631 = _1627 | _1629;
    int _1633 = _1455 ? 16 : 0;
    int _1635 = _1631 | _1633;
    int _1637 = _1451 ? 32 : 0;
    int _1639 = _1635 | _1637;
    int _1641 = false ? 64 : 0;
    int _1643 = _1639 | _1641;
    int _1645 = _1643 & 32;
    if (_1455)
    {
        _1099 = _1611;
    }
    float _1647 = _1099;
    float _1649 = _1647;
    if (_1447)
    {
        bool _1651 = _1589 > 0.5;
        _1597 = _1651;
    }
    bool _1653 = _1597;
    int _1655 = 0;
    if (_1455)
    {
        _1655 = as_type<int>(_1611);
    }
    int _1657 = _1655;
    int _1659 = _1657;
    if (_1455)
    {
        _1101 = as_type<int>(_1567);
    }
    int _1661 = _1101;
    int _1663 = 0;
    int _1665 = _1661;
    if (_1455)
    {
        _1663 = as_type<int>(_1569);
    }
    int _1667 = _1663;
    int _1669 = _1667;
    if (!_1455)
    {
        float _1671 = in.m_68.x;
        float _1673 = in.m_68.y;
        float _1675 = in.m_68.z;
        float _1677 = _1671 * 3.1415927410125732421875;
        float _1679 = _1677 * 0.15915493667125701904296875;
        float _1681 = _1673 * 3.1415927410125732421875;
        float _1683 = _1681 * 0.15915493667125701904296875;
        float _1685 = _1675 * 3.1415927410125732421875;
        float _1687 = _1679 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        float _1691 = _1685 * 0.15915493667125701904296875;
        float _1693 = _1683 * 6.283185482025146484375;
        float _1695 = sin(_1693);
        float _1697 = _1691 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        _1605 = _1673;
        _1649 = _1675;
        _1509 = 5.839270114898681640625;
        _1607 = _1671;
        _1609 = _1675;
        _1613 = _1673;
        _1503 = 1.2345600128173828125;
        _1485 = 7.345489978790283203125;
        _1519 = 2;
        _1513 = 1;
        _1665 = as_type<int>(_1695);
        _1659 = as_type<int>(_1689);
        _1669 = as_type<int>(_1699);
    }
    float _1701 = _1605;
    float _1703 = _1649;
    float _1705 = _1509;
    float _1707 = _1607;
    float _1709 = _1609;
    float _1711 = _1613;
    float _1713 = _1503;
    float _1715 = _1485;
    int _1717 = _1519;
    int _1719 = _1513;
    int _1721 = _1665;
    int _1723 = _1659;
    int _1725 = _1669;
    float _1727 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1729 = int(_1727);
    int _1731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1733 = _1731 != 0;
    bool _1735 = _1701 > 0.5;
    float _1737 = _1703 * _1705;
    float _1739 = _1701 + _1707;
    if (_1443)
    {
        float _1741 = -_227;
        float _1743 = _1617 ? _1741 : _227;
        _1481 = _1743;
    }
    float _1745 = _1481;
    float _1747 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1749 = int(_1747);
    if (_1447)
    {
        float _1751 = -_233;
        float _1753 = _1653 ? _1751 : _233;
        _1491 = _1753;
    }
    float _1755 = _1491;
    float _1757 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1761 = _1759 != 0;
    int _1763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1765 = _1763 != 0;
    int _1767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1769 = _1767 != 0;
    float _1771 = _1701 + _1709;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1775 = _1773 != 0;
    float _1777 = _1707 + _1709;
    bool _1779 = _1709 > 0.5;
    float _1781 = _817 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1783 = float(_1729);
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1787 = _1785 != 0;
    float _1789 = -_227;
    int _1791 = _1735 ? as_type<int>(_1789) : as_type<int>(_227);
    float _1793 = 1.0 / _1783;
    bool _1795 = !_1775;
    int _1797 = _1795 ? 0 : 1;
    float _1799 = float(uint(_1749));
    int _1801 = ~_1749;
    int _1803 = _1801 + 1;
    float _1805 = -_233;
    int _1807 = _1779 ? as_type<int>(_1805) : as_type<int>(_233);
    float _1809 = 1.0 / _1799;
    bool _1811 = _1435 > 0.5;
    int _1813 = int(_1811);
    int _1815 = _1779 ? 2 : 0;
    int _1817 = _1813 | _1815;
    int _1819 = _1617 ? 4 : 0;
    int _1821 = _1817 | _1819;
    int _1823 = _1761 ? 8 : 0;
    int _1825 = _1821 | _1823;
    int _1827 = _1765 ? 16 : 0;
    int _1829 = _1825 | _1827;
    int _1831 = _1769 ? 32 : 0;
    int _1833 = _1829 | _1831;
    int _1835 = _1735 ? 64 : 0;
    int _1837 = _1833 | _1835;
    int _1839 = _1837 & 64;
    bool _1841 = !_1765;
    float _1843 = _1841 ? _227 : as_type<float>(_1791);
    bool _1845 = !_1769;
    float _1847 = _1845 ? _233 : as_type<float>(_1807);
    float _1849 = _159 * _1793;
    float _1851 = -_233;
    int _1853 = _1811 ? as_type<int>(_1851) : as_type<int>(_233);
    int _1855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1857 = _1855 != 0;
    int _1859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1861 = _1859 != 0;
    int _1863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1865 = _1863 != 0;
    float _1867 = trunc(_1849);
    int _1869 = int(_1867);
    int _1871 = int(_1811);
    int _1873 = _1779 ? 2 : 0;
    int _1875 = _1871 | _1873;
    int _1877 = _1617 ? 4 : 0;
    int _1879 = _1875 | _1877;
    int _1881 = _1761 ? 8 : 0;
    int _1883 = _1879 | _1881;
    int _1885 = _1857 ? 16 : 0;
    int _1887 = _1883 | _1885;
    int _1889 = _1861 ? 32 : 0;
    int _1891 = _1887 | _1889;
    int _1893 = _1865 ? 64 : 0;
    int _1895 = _1891 | _1893;
    int _1897 = _1895 & 2;
    bool _1899 = !_1761;
    float _1901 = _1899 ? _233 : as_type<float>(_1853);
    int _1903 = as_type<int>(_1809) + (-2);
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1907 = _1905 != 0;
    int _1909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1911 = _1909 != 0;
    int _1913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1915 = _1913 != 0;
    int _1917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1919 = _1917 != 0;
    int _1921 = ~_1749;
    int _1923 = _1921 + 1;
    float _1925 = float(_125);
    bool _1927 = !_1911;
    int _1929 = _1927 ? 0 : 1;
    float _1931 = 1.0 / _1925;
    float _1933 = float(uint(_1869));
    float _1935 = float(_1869);
    bool _1937 = !_1857;
    int _1939 = _1937 ? 0 : 1;
    float _1941 = as_type<float>(_1903) * _1933;
    bool _1943 = _1749 == 0;
    bool _1945 = !_1861;
    int _1947 = _1945 ? 0 : 1;
    bool _1949 = !_1865;
    int _1951 = _1949 ? 0 : 1;
    float _1953 = trunc(_1941);
    float _1955 = precise::max(_1953, 0.0);
    uint _1958 = uint(_1955);
    int _1960 = abs(_1947);
    int _1962 = abs(_1951);
    int _1964 = _1803 * int(_1958);
    int _1966 = _1964 + _1869;
    float _1968 = float(uint(_1966));
    float _1970 = as_type<float>(_1903) * _1968;
    float _1972 = trunc(_1970);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    int _1978 = int(_1958) + int(_1976);
    float _1980 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1982 = int(_1980);
    int _1984 = _1923 * _1978;
    int _1986 = _1984 + _1869;
    bool _1988 = uint(_1986) >= uint(_1749);
    float _1990 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1992 = int(_1990);
    bool _1994 = !_1988;
    int _1996 = _1994 ? 0 : (-1);
    float _1998 = float(_1982);
    int _2000 = ~_1978;
    int _2002 = _2000 + _1996;
    int _2004 = _2002 + 1;
    float _2006 = 1.0 / _1998;
    float _2008 = float(uint(_1992));
    int _2010 = ~_1992;
    int _2012 = _2010 + 1;
    float _2014 = 1.0 / _2008;
    float _2016 = float(_1992);
    bool _2018 = _1992 == 0;
    float _2020 = _159 * _2006;
    float _2022 = _1711 * _1713;
    bool _2024 = !_1733;
    int _2026 = _2024 ? 0 : 1;
    float _2028 = _1711 * _1715;
    float _2030 = trunc(_2020);
    int _2032 = int(_2030);
    int _2034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2036 = _2034 != 0;
    int _2038 = as_type<int>(_2014) + (-2);
    int _2040 = abs(_2026);
    bool _2042 = !_2036;
    int _2044 = _2042 ? 0 : 1;
    int _2046 = ~_1992;
    int _2048 = _2046 + 1;
    int _2050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2052 = _2050 != 0;
    bool _2054 = !_2052;
    int _2056 = _2054 ? 0 : 1;
    float _2058 = float(uint(_2032));
    int _2060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2062 = _2060 != 0;
    float _2064 = as_type<float>(_2038) * _2058;
    float _2066 = trunc(_2064);
    float _2068 = precise::max(_2066, 0.0);
    uint _2070 = uint(_2068);
    int _2072 = _2012 * int(_2070);
    int _2074 = _2072 + _2032;
    float _2076 = float(uint(_2074));
    float _2078 = as_type<float>(_2038) * _2076;
    float _2080 = trunc(_2078);
    float _2082 = precise::max(_2080, 0.0);
    uint _2084 = uint(_2082);
    float _2086 = floor(_2022);
    int _2088 = int(_2070) + int(_2084);
    float _2090 = float(_1749);
    int _2092 = _2048 * _2088;
    int _2094 = _2092 + _2032;
    float _2096 = -_2086;
    float _2098 = _2022 + _2096;
    bool _2100 = uint(_2094) >= uint(_1992);
    float _2102 = _1707 * _1715;
    float _2104 = _2098 * _2016;
    bool _2106 = !_2100;
    int _2108 = _2106 ? 0 : (-1);
    float _2110 = floor(_2102);
    int _2112 = ~_2088;
    int _2114 = _2112 + _2108;
    int _2116 = _2114 + 1;
    int _2118 = _1992 * _2116;
    int _2120 = _2118 + _2032;
    float _2122 = trunc(_2104);
    int _2124 = int(_2122);
    bool _2126 = !_2018;
    int _2128 = _2126 ? _2120 : (-1);
    float _2130 = -_2110;
    float _2132 = _2102 + _2130;
    bool _2134 = _1935 >= _2090;
    bool _2136 = isnan(_1935);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan(_2090);
    bool _2142 = _2138 || _2140;
    float _2144 = float(_2142);
    float _2146 = float(_2032);
    float _2148 = _2132 * _2090;
    bool _2150 = _2146 >= _2016;
    bool _2152 = isnan(_2146);
    bool _2154 = _2150 || _2152;
    bool _2156 = isnan(_2016);
    bool _2158 = _2154 || _2156;
    float _2160 = float(_2158);
    float _2162 = trunc(_2148);
    int _2164 = int(_2162);
    float _2166 = _159 * _1931;
    float _2168 = _2166 * _2090;
    float _2170 = _2166 * _2016;
    float _2172 = trunc(_2144);
    int _2174 = int(_2172);
    int _2176 = _1749 * _2004;
    int _2178 = _2176 + _1869;
    bool _2180 = !_1915;
    int _2182 = _2180 ? 0 : 1;
    bool _2184 = !_1943;
    int _2186 = _2184 ? _2178 : (-1);
    float _2188 = trunc(_2160);
    int _2190 = int(_2188);
    int _2192 = _2164 * _2040;
    int _2194 = _2192 + _1869;
    int _2196 = _1749 + (-1);
    bool _2198 = !_1907;
    int _2200 = _2198 ? 0 : 1;
    int _2202 = ~_2174;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    float _2208 = trunc(_2168);
    int _2210 = int(_2208);
    int _2212 = abs(_2200);
    int _2214 = _2186 * _2206;
    int _2216 = abs(_2044);
    int _2218 = ~_2190;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    int _2224 = _2174 * _2196;
    int _2226 = _2224 + _2214;
    float _2228 = trunc(_2170);
    int _2230 = int(_2228);
    int _2232 = abs(_1939);
    int _2234 = _2128 * _2222;
    int _2236 = abs(_1929);
    int _2238 = _1992 + (-1);
    int _2240 = _2226 * _1960;
    int _2242 = _2190 * _2238;
    int _2244 = _2242 + _2234;
    int _2246 = ~_1992;
    int _2248 = _2246 + 1;
    int _2250 = _2210 * _2232;
    int _2252 = _2250 + _2240;
    int _2254 = _2124 * _2216;
    int _2256 = _2254 + _2032;
    int _2258 = abs(_1797);
    int _2260 = _2244 * _2236;
    bool _2262 = !_1919;
    int _2264 = _2262 ? 0 : 1;
    int _2266 = abs(_2182);
    int _2268 = _2230 * _2212;
    int _2270 = _2268 + _2260;
    int _2272 = abs(_2264);
    int _2274 = _2194 * _1962;
    int _2276 = _2274 + _2252;
    int _2278 = _2256 * _2266;
    int _2280 = _2278 + _2270;
    int _2282 = _2164 * _2258;
    int _2284 = _2282 + _2276;
    int _2286 = _2124 * _2272;
    int _2288 = _2286 + _2280;
    float _2290 = float(uint(_2284));
    float _2292 = float(uint(_2288));
    float _2294 = as_type<float>(_1903) * _2290;
    float _2296 = as_type<float>(_2038) * _2292;
    int _2298 = ~_1749;
    int _2300 = _2298 + 1;
    float _2302 = trunc(_2294);
    float _2304 = precise::max(_2302, 0.0);
    uint _2306 = uint(_2304);
    float _2308 = trunc(_2296);
    float _2310 = precise::max(_2308, 0.0);
    uint _2312 = uint(_2310);
    int _2314 = _2300 * int(_2306);
    int _2316 = _2314 + _2284;
    float _2318 = float(uint(_2316));
    int _2320 = _2248 * int(_2312);
    int _2322 = _2320 + _2288;
    float _2324 = as_type<float>(_1903) * _2318;
    float _2326 = float(uint(_2322));
    float _2328 = trunc(_2324);
    float _2330 = precise::max(_2328, 0.0);
    uint _2332 = uint(_2330);
    int _2334 = ~_1749;
    int _2336 = _2334 + 1;
    float _2338 = as_type<float>(_2038) * _2326;
    float _2340 = trunc(_2338);
    float _2342 = precise::max(_2340, 0.0);
    uint _2344 = uint(_2342);
    int _2346 = int(_2306) + int(_2332);
    int _2348 = ~_1992;
    int _2350 = _2348 + 1;
    int _2352 = _2336 * _2346;
    int _2354 = _2352 + _2284;
    int _2356 = int(_2312) + int(_2344);
    float _2358 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _2360 = int(_2358);
    bool _2362 = uint(_2354) >= uint(_1749);
    int _2364 = _2350 * _2356;
    int _2366 = _2364 + _2288;
    bool _2368 = !_2362;
    int _2370 = _2368 ? 0 : (-1);
    bool _2372 = uint(_2366) >= uint(_1992);
    float _2374 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2376 = int(_2374);
    int _2378 = ~_2346;
    int _2380 = _2378 + _2370;
    int _2382 = _2380 + 1;
    bool _2384 = !_2372;
    int _2386 = _2384 ? 0 : (-1);
    int _2388 = _1749 * _2382;
    int _2390 = _2388 + _2284;
    float _2392 = float(_2360);
    int _2394 = ~_2356;
    int _2396 = _2394 + _2386;
    int _2398 = _2396 + 1;
    bool _2400 = !_1943;
    int _2402 = _2400 ? _2390 : (-1);
    float _2404 = 1.0 / _2392;
    int _2406 = _1992 * _2398;
    int _2408 = _2406 + _2288;
    int _2410 = _2402 & 3;
    bool _2412 = _2410 != 0;
    int _2414 = _2402 & 3;
    bool _2416 = _2414 != 0;
    bool _2418 = !_2018;
    int _2420 = _2418 ? _2408 : (-1);
    int _2422 = _2412 ? 0 : 1;
    int _2424 = _2420 & 3;
    bool _2426 = _2424 != 0;
    float _2428 = float(uint(_2376));
    int _2430 = _2426 ? 0 : 1;
    float _2432 = _159 * _2404;
    bool _2434 = uint(_2414) > 1u;
    float _2436 = 1.0 / _2428;
    int _2438 = int(_2434);
    int _2440 = _2416 ? 2 : 0;
    int _2442 = _2438 | _2440;
    int _2444 = _1915 ? 4 : 0;
    int _2446 = _2442 | _2444;
    int _2448 = _1919 ? 8 : 0;
    int _2450 = _2446 | _2448;
    int _2452 = _1943 ? 16 : 0;
    int _2454 = _2450 | _2452;
    int _2456 = _2018 ? 32 : 0;
    int _2458 = _2454 | _2456;
    int _2460 = _1865 ? 64 : 0;
    int _2462 = _2458 | _2460;
    int _2464 = _2462 & 2;
    int _2466 = _2420 & 3;
    bool _2468 = _2466 != 0;
    int _2470 = ~_2422;
    int _2472 = _2470 + 1;
    int _2474 = _2472 + 1;
    int _2476 = int(_2434);
    int _2478 = _2468 ? 2 : 0;
    int _2480 = _2476 | _2478;
    int _2482 = _1915 ? 4 : 0;
    int _2484 = _2480 | _2482;
    int _2486 = _1919 ? 8 : 0;
    int _2488 = _2484 | _2486;
    int _2490 = _1943 ? 16 : 0;
    int _2492 = _2488 | _2490;
    int _2494 = _2018 ? 32 : 0;
    int _2496 = _2492 | _2494;
    int _2498 = _1865 ? 64 : 0;
    int _2500 = _2496 | _2498;
    int _2502 = _2500 & 2;
    float _2504 = trunc(_2432);
    int _2506 = int(_2504);
    int _2508 = ~_2376;
    int _2510 = _2508 + 1;
    int _2512 = _2474;
    float _2514 = as_type<float>(_2502);
    float _2516 = as_type<float>(_2464);
    float _2518 = as_type<float>(_2256);
    float _2520 = as_type<float>(_2376);
    if (!_2434)
    {
        int _2522 = ~_2422;
        int _2524 = _2522 + 1;
        _2512 = _2524;
    }
    int _2526 = _2512;
    bool _2528 = uint(_2466) > 1u;
    int _2530 = as_type<int>(_2436) + (-2);
    int _2532 = ~_2430;
    int _2534 = _2532 + 1;
    int _2536 = _2534 + 1;
    float _2538 = float(uint(_2506));
    float _2540 = float(_2506);
    int _2542 = _2536;
    if (!_2528)
    {
        int _2544 = ~_2430;
        int _2546 = _2544 + 1;
        _2542 = _2546;
    }
    int _2548 = _2542;
    float _2550 = as_type<float>(_2530) * _2538;
    int _2552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2554 = _2552 != 0;
    float _2556 = trunc(_2550);
    float _2558 = precise::max(_2556, 0.0);
    uint _2560 = uint(_2558);
    int _2562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2564 = _2562 != 0;
    int _2566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2568 = _2566 != 0;
    int _2570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2572 = _2570 != 0;
    bool _2574 = !_2554;
    int _2576 = _2574 ? 0 : 1;
    bool _2578 = !_2568;
    int _2580 = _2578 ? 0 : 1;
    bool _2582 = _1839 != 0;
    int _2584 = ~_2376;
    int _2586 = _2584 + 1;
    int _2588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2590 = _2588 != 0;
    int _2592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2594 = _2592 != 0;
    int _2596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2598 = _2596 != 0;
    int _2600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2602 = _2600 != 0;
    bool _2604 = !_2564;
    int _2606 = _2604 ? 0 : 1;
    int _2608 = _2586 * int(_2560);
    int _2610 = _2608 + _2506;
    bool _2612 = !_2590;
    int _2614 = _2612 ? 0 : 1;
    bool _2616 = _2376 == 0;
    float _2618 = float(uint(_2610));
    float _2620 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2622 = int(_2620);
    bool _2624 = !_2572;
    int _2626 = _2624 ? 0 : 1;
    float _2628 = as_type<float>(_2530) * _2618;
    int _2630 = abs(_2580);
    int _2632 = abs(_2576);
    bool _2634 = !_2602;
    int _2636 = _2634 ? 0 : 1;
    float _2638 = trunc(_2628);
    float _2640 = precise::max(_2638, 0.0);
    uint _2642 = uint(_2640);
    bool _2644 = !_2594;
    int _2646 = _2644 ? 0 : 1;
    bool _2648 = !_2598;
    int _2650 = _2648 ? 0 : 1;
    int _2652 = abs(_2646);
    int _2654 = ~_2622;
    int _2656 = _2654 + 1;
    bool _2658 = _2622 == 0;
    bool _2660 = _1992 == 0;
    int _2662 = int(_2560) + int(_2642);
    float _2664 = float(uint(_2622));
    int _2666 = _2510 * _2662;
    int _2668 = _2666 + _2506;
    bool _2670 = uint(_2668) >= uint(_2376);
    float _2672 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _2674 = int(_2672);
    bool _2676 = !_2670;
    int _2678 = _2676 ? 0 : (-1);
    int _2680 = ~_2662;
    int _2682 = _2680 + _2678;
    int _2684 = _2682 + 1;
    int _2686 = _2376 * _2684;
    int _2688 = _2686 + _2506;
    float _2690 = float(_2674);
    float _2692 = 1.0 / _2664;
    bool _2694 = !_2616;
    int _2696 = _2694 ? _2688 : (-1);
    float _2698 = 1.0 / _2690;
    int _2700 = ~_2622;
    int _2702 = _2700 + 1;
    int _2704 = as_type<int>(_2692) + (-2);
    float _2706 = _159 * _2698;
    float _2708 = trunc(_2706);
    int _2710 = int(_2708);
    float _2712 = float(uint(_2710));
    float _2714 = as_type<float>(_2704) * _2712;
    float _2716 = trunc(_2714);
    float _2718 = precise::max(_2716, 0.0);
    uint _2720 = uint(_2718);
    int _2722 = _2656 * int(_2720);
    int _2724 = _2722 + _2710;
    float _2726 = float(_2376);
    float _2728 = float(uint(_2724));
    bool _2730 = _2540 >= _2726;
    bool _2732 = isnan(_2540);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan(_2726);
    bool _2738 = _2734 || _2736;
    float _2740 = float(_2738);
    float _2742 = as_type<float>(_2704) * _2728;
    float _2744 = trunc(_2740);
    int _2746 = int(_2744);
    float _2748 = trunc(_2742);
    float _2750 = precise::max(_2748, 0.0);
    uint _2752 = uint(_2750);
    int _2754 = int(_2720) + int(_2752);
    float _2756 = floor(_1737);
    int _2758 = _2702 * _2754;
    int _2760 = _2758 + _2710;
    bool _2762 = uint(_2760) >= uint(_2622);
    bool _2764 = !_2762;
    int _2766 = _2764 ? 0 : (-1);
    float _2768 = -_2756;
    float _2770 = _1737 + _2768;
    int _2772 = _2376 + (-1);
    int _2774 = ~_2754;
    int _2776 = _2774 + _2766;
    int _2778 = _2776 + 1;
    float _2780 = _2770 * _2726;
    float _2782 = _2166 * _2726;
    int _2784 = ~_2746;
    int _2786 = _2784 + 1;
    int _2788 = _2786 + 1;
    float _2790 = trunc(_2780);
    int _2792 = int(_2790);
    int _2794 = _2696 * _2788;
    int _2796 = abs(_2056);
    bool _2798 = !_2062;
    int _2800 = _2798 ? 0 : 1;
    int _2802 = _2746 * _2772;
    int _2804 = _2802 + _2794;
    float _2806 = trunc(_2782);
    int _2808 = int(_2806);
    int _2810 = abs(_2606);
    bool _2812 = _1717 != 2;
    int _2814 = abs(_2626);
    int _2816 = _2804 * _2630;
    int _2818 = _2792 * _2796;
    int _2820 = _2818 + _2506;
    int _2822 = _2808 * _2810;
    int _2824 = _2822 + _2816;
    int _2826 = ~_2376;
    int _2828 = _2826 + 1;
    int _2830 = _2820 * _2814;
    int _2832 = _2830 + _2824;
    int _2834 = ~_2376;
    int _2836 = _2834 + 1;
    int _2838 = _2792 * _2632;
    int _2840 = _2838 + _2832;
    float _2842 = float(uint(_2840));
    float _2844 = as_type<float>(_2530) * _2842;
    float _2846 = trunc(_2844);
    float _2848 = precise::max(_2846, 0.0);
    uint _2850 = uint(_2848);
    float _2852 = floor(_2028);
    int _2854 = _2836 * int(_2850);
    int _2856 = _2854 + _2840;
    float _2858 = float(uint(_2856));
    float _2860 = -_2852;
    float _2862 = _2028 + _2860;
    int _2864 = _2622 + (-1);
    float _2866 = as_type<float>(_2530) * _2858;
    float _2868 = trunc(_2866);
    float _2870 = precise::max(_2868, 0.0);
    uint _2872 = uint(_2870);
    int _2874 = int(_2850) + int(_2872);
    float _2876 = float(_2622);
    int _2878 = _2828 * _2874;
    int _2880 = _2878 + _2840;
    float _2882 = _2862 * _2876;
    float _2884 = _2166 * _2876;
    bool _2886 = uint(_2880) >= uint(_2376);
    float _2888 = float(_2710);
    float _2890 = trunc(_2882);
    int _2892 = int(_2890);
    bool _2894 = !_2886;
    int _2896 = _2894 ? 0 : (-1);
    bool _2898 = _2888 >= _2876;
    bool _2900 = isnan(_2888);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan(_2876);
    bool _2906 = _2902 || _2904;
    float _2908 = float(_2906);
    int _2910 = _2622 * _2778;
    int _2912 = _2910 + _2710;
    int _2914 = ~_2874;
    int _2916 = _2914 + _2896;
    int _2918 = _2916 + 1;
    float _2920 = trunc(_2884);
    int _2922 = int(_2920);
    bool _2924 = !_2658;
    int _2926 = _2924 ? _2912 : (-1);
    float _2928 = trunc(_2908);
    int _2930 = int(_2928);
    int _2932 = ~_2930;
    int _2934 = _2932 + 1;
    int _2936 = _2934 + 1;
    int _2938 = _2926 * _2936;
    int _2940 = abs(_2800);
    int _2942 = _2930 * _2864;
    int _2944 = _2942 + _2938;
    int _2946 = abs(_2614);
    int _2948 = _2892 * _2940;
    int _2950 = _2948 + _2710;
    int _2952 = abs(_2650);
    int _2954 = _2944 * _2652;
    int _2956 = abs(_2636);
    int _2958 = _2922 * _2946;
    int _2960 = _2958 + _2954;
    int _2962 = ~_2622;
    int _2964 = _2962 + 1;
    int _2966 = _2950 * _2952;
    int _2968 = _2966 + _2960;
    int _2970 = _2892 * _2956;
    int _2972 = _2970 + _2968;
    int _2974 = ~_2622;
    int _2976 = _2974 + 1;
    float _2978 = float(uint(_2972));
    float _2980 = as_type<float>(_2704) * _2978;
    float _2982 = trunc(_2980);
    float _2984 = precise::max(_2982, 0.0);
    uint _2986 = uint(_2984);
    int _2988 = _2976 * int(_2986);
    int _2990 = _2988 + _2972;
    float _2992 = float(uint(_2990));
    float _2994 = as_type<float>(_2704) * _2992;
    float _2996 = trunc(_2994);
    float _2998 = precise::max(_2996, 0.0);
    uint _3000 = uint(_2998);
    int _3002 = int(_2986) + int(_3000);
    int _3004 = _2964 * _3002;
    int _3006 = _3004 + _2972;
    bool _3008 = uint(_3006) >= uint(_2622);
    int _3010 = _2376 * _2918;
    int _3012 = _3010 + _2840;
    int _3014 = ~_2376;
    int _3016 = _3014 + 1;
    bool _3018 = !_3008;
    int _3020 = _3018 ? 0 : (-1);
    bool _3022 = !_2616;
    int _3024 = _3022 ? _3012 : (-1);
    int _3026 = ~_3002;
    int _3028 = _3026 + _3020;
    int _3030 = _3028 + 1;
    int _3032 = _3024 & 3;
    bool _3034 = _3032 != 0;
    int _3036 = _3024 & 3;
    bool _3038 = _3036 != 0;
    int _3040 = _2622 * _3030;
    int _3042 = _3040 + _2972;
    int _3044 = _3034 ? 0 : 1;
    int _3046 = ~_1749;
    int _3048 = _3046 + 1;
    bool _3050 = !_2658;
    int _3052 = _3050 ? _3042 : (-1);
    int _3054 = ~_3044;
    int _3056 = _3054 + 1;
    int _3058 = _3056 + 1;
    int _3060 = _3052 & 3;
    bool _3062 = _3060 != 0;
    int _3064 = _3062 ? 0 : 1;
    bool _3066 = uint(_3036) > 1u;
    int _3068 = _3058;
    if (!_3066)
    {
        int _3070 = ~_3044;
        int _3072 = _3070 + 1;
        _3068 = _3072;
    }
    int _3074 = _3068;
    int _3076 = _3052 & 3;
    bool _3078 = _3076 != 0;
    int _3080 = ~_3064;
    int _3082 = _3080 + 1;
    int _3084 = _3082 + 1;
    bool _3086 = uint(_3076) > 1u;
    int _3088 = _3084;
    if (!_3086)
    {
        int _3090 = ~_3064;
        int _3092 = _3090 + 1;
        _3088 = _3092;
    }
    int _3094 = _3088;
    bool _3096 = uint(_2414) >= 2u;
    int _3098 = _3096 ? 0 : 1;
    bool _3100 = uint(_2466) >= 2u;
    int _3102 = ~_3098;
    int _3104 = _3102 + 1;
    int _3106 = _3104 + 1;
    int _3108 = _3100 ? 0 : 1;
    bool _3110 = _2414 != 3;
    int _3112 = ~_3108;
    int _3114 = _3112 + 1;
    int _3116 = _3114 + 1;
    int _3118 = _3106;
    int _3120 = _3116;
    if (_3110)
    {
        int _3122 = ~_3098;
        int _3124 = _3122 + 1;
        _3118 = _3124;
    }
    int _3126 = _3118;
    bool _3128 = _2466 != 3;
    if (_3128)
    {
        int _3130 = ~_3108;
        int _3132 = _3130 + 1;
        _3120 = _3132;
    }
    int _3134 = _3120;
    bool _3136 = uint(_3036) >= 2u;
    int _3138 = _3136 ? 0 : 1;
    bool _3140 = uint(_3076) >= 2u;
    int _3142 = ~_3138;
    int _3144 = _3142 + 1;
    int _3146 = _3144 + 1;
    int _3148 = _3140 ? 0 : 1;
    bool _3150 = _3036 != 3;
    int _3152 = ~_3148;
    int _3154 = _3152 + 1;
    int _3156 = _3154 + 1;
    int _3158 = _3146;
    int _3160 = _3156;
    if (_3150)
    {
        int _3162 = ~_3138;
        int _3164 = _3162 + 1;
        _3158 = _3164;
    }
    int _3166 = _3158;
    bool _3168 = _3076 != 3;
    float _3170 = -_233;
    int _3172 = _2582 ? as_type<int>(_3170) : as_type<int>(_233);
    bool _3174 = _2464 != 0;
    if (_3168)
    {
        int _3176 = ~_3148;
        int _3178 = _3176 + 1;
        _3160 = _3178;
    }
    int _3180 = _3160;
    float _3182 = float(uint(_2194));
    float _3184 = as_type<float>(_1903) * _3182;
    float _3186 = trunc(_3184);
    float _3188 = precise::max(_3186, 0.0);
    uint _3190 = uint(_3188);
    int _3192 = _3048 * int(_3190);
    int _3194 = _3192 + _2194;
    float _3196 = float(uint(_3194));
    int _3198 = ~_1749;
    int _3200 = _3198 + 1;
    float _3202 = as_type<float>(_1903) * _3196;
    float _3204 = trunc(_3202);
    float _3206 = precise::max(_3204, 0.0);
    uint _3208 = uint(_3206);
    int _3210 = ~_2376;
    int _3212 = _3210 + 1;
    int _3214 = int(_3190) + int(_3208);
    float _3216 = float(uint(_2256));
    int _3218 = ~_1992;
    int _3220 = _3218 + 1;
    int _3222 = _3200 * _3214;
    int _3224 = _3222 + _2194;
    float _3226 = as_type<float>(_2038) * _3216;
    bool _3228 = uint(_3224) >= uint(_1749);
    float _3230 = trunc(_3226);
    float _3232 = precise::max(_3230, 0.0);
    uint _3234 = uint(_3232);
    bool _3236 = !_3228;
    int _3238 = _3236 ? 0 : (-1);
    int _3240 = ~_3214;
    int _3242 = _3240 + _3238;
    int _3244 = _3242 + 1;
    int _3246 = _1749 * _3244;
    int _3248 = _3246 + _2194;
    float _3250 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3252 = _3250 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _3254 = _3220 * int(_3234);
    int _3256 = _3254 + _2256;
    float _3258 = 1.0 / _3252;
    float _3260 = float(uint(_3256));
    int _3262 = ~_1992;
    int _3264 = _3262 + 1;
    float _3266 = as_type<float>(_2038) * _3260;
    float _3268 = trunc(_3266);
    float _3270 = precise::max(_3268, 0.0);
    uint _3272 = uint(_3270);
    int _3274 = int(_3234) + int(_3272);
    float _3276 = float(uint(_2820));
    float _3278 = as_type<float>(_2530) * _3276;
    int _3280 = _3264 * _3274;
    int _3282 = _3280 + _2256;
    float _3284 = trunc(_3278);
    float _3286 = precise::max(_3284, 0.0);
    uint _3288 = uint(_3286);
    bool _3290 = uint(_3282) >= uint(_1992);
    bool _3292 = !_3290;
    int _3294 = _3292 ? 0 : (-1);
    int _3296 = ~_2622;
    int _3298 = _3296 + 1;
    int _3300 = ~_3274;
    int _3302 = _3300 + _3294;
    int _3304 = _3302 + 1;
    int _3306 = _3212 * int(_3288);
    int _3308 = _3306 + _2820;
    int _3310 = _1992 * _3304;
    int _3312 = _3310 + _2256;
    float _3314 = _1707 * 2.0;
    float _3316 = float(uint(_3308));
    float _3318 = floor(_3314);
    float _3320 = as_type<float>(_2530) * _3316;
    float _3322 = float(uint(_2950));
    float _3324 = as_type<float>(_2704) * _3322;
    float _3326 = trunc(_3320);
    float _3328 = precise::max(_3326, 0.0);
    uint _3330 = uint(_3328);
    float _3332 = trunc(_3324);
    float _3334 = precise::max(_3332, 0.0);
    uint _3336 = uint(_3334);
    int _3338 = int(_3288) + int(_3330);
    bool _3340 = !_2660;
    int _3342 = _3340 ? _3312 : (-1);
    float _3344 = _1701 * 2.0;
    int _3346 = _3016 * _3338;
    int _3348 = _3346 + _2820;
    int _3350 = _3298 * int(_3336);
    int _3352 = _3350 + _2950;
    float _3354 = floor(_3344);
    bool _3356 = uint(_3348) >= uint(_2376);
    float _3358 = float(uint(_3352));
    int _3360 = ~_2622;
    int _3362 = _3360 + 1;
    bool _3364 = !_3356;
    int _3366 = _3364 ? 0 : (-1);
    float _3368 = as_type<float>(_2704) * _3358;
    int _3370 = ~_3338;
    int _3372 = _3370 + _3366;
    int _3374 = _3372 + 1;
    float _3376 = trunc(_3368);
    float _3378 = precise::max(_3376, 0.0);
    uint _3380 = uint(_3378);
    int _3382 = _2376 * _3374;
    int _3384 = _3382 + _2820;
    bool _3386 = !_3078;
    int _3388 = _3386 ? 0 : 1;
    bool _3390 = _3036 != 3;
    bool _3392 = !_2616;
    int _3394 = _3392 ? _3384 : (-1);
    int _3396 = abs(_3388);
    int _3398 = int(_3336) + int(_3380);
    int _3400 = _3362 * _3398;
    int _3402 = _3400 + _2950;
    bool _3404 = uint(_3402) >= uint(_2622);
    bool _3406 = !_3404;
    int _3408 = _3406 ? 0 : (-1);
    bool _3410 = _1749 == 0;
    bool _3412 = !_3174;
    int _3414 = _3412 ? 0 : 1;
    bool _3416 = !_3410;
    int _3418 = _3416 ? _3248 : (-1);
    bool _3420 = _1719 != 1;
    bool _3422 = _2502 != 0;
    bool _3424 = !_1787;
    int _3426 = _3424 ? 0 : 1;
    int _3428 = ~_3398;
    int _3430 = _3428 + _3408;
    int _3432 = _3430 + 1;
    bool _3434 = !_3038;
    int _3436 = _3434 ? 0 : 1;
    bool _3438 = _2466 != 3;
    int _3440 = _2622 * _3432;
    int _3442 = _3440 + _2950;
    bool _3444 = !_3390;
    int _3446 = _3444 ? 0 : (-1);
    float _3448 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3450 = log2(_3448);
    bool _3452 = !_3438;
    int _3454 = _3452 ? 0 : (-1);
    float _3456 = as_type<float>(_3338);
    float _3458 = _3368;
    if (_2812)
    {
        _2514 = _1707;
    }
    float _3460 = _2514;
    float _3462 = _3460;
    if (_2812)
    {
        _2516 = _1701;
    }
    float _3464 = _2516;
    float _3466 = _3464;
    if (!_2812)
    {
        _3462 = _1709;
    }
    float _3468 = _3462;
    if (!_2812)
    {
        _3466 = _1707;
    }
    float _3470 = _3466;
    int _3472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3474 = _3472 != 0;
    bool _3476 = !_2658;
    int _3478 = _3476 ? _3442 : (-1);
    bool _3480 = !_3420;
    float _3482 = _3480 ? as_type<float>(_1721) : as_type<float>(_1723);
    float _3484 = _159 * _3450;
    bool _3486 = !_3420;
    float _3488 = _3486 ? as_type<float>(_1725) : as_type<float>(_1721);
    bool _3490 = !_3474;
    int _3492 = _3490 ? 0 : 1;
    int _3494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3496 = _3494 != 0;
    float _3498 = exp2(_3484);
    if (!_3420)
    {
        _3456 = _1709;
    }
    float _3500 = _3456;
    float _3502 = _3500;
    if (!_3420)
    {
        _2518 = _1709;
    }
    float _3504 = _2518;
    float _3506 = _3504;
    if (!_3420)
    {
        _3458 = _1701;
    }
    float _3508 = _3458;
    float _3510 = _3508;
    if (!_3420)
    {
        _2520 = _1701;
    }
    float _3512 = _2520;
    float _3514 = _3512;
    if (_3420)
    {
        _3502 = _1701;
    }
    float _3516 = _3502;
    if (_3420)
    {
        _3506 = _1701;
    }
    float _3518 = _3506;
    if (_3420)
    {
        _3510 = _1707;
    }
    float _3520 = _3510;
    if (_3420)
    {
        _3514 = _1707;
    }
    float _3522 = _3514;
    float _3524 = -_3498;
    float _3526 = _3524 + 1.0;
    bool _3528 = _3318 >= 0.0;
    bool _3530 = isnan(_3318);
    bool _3532 = _3528 || _3530;
    bool _3534 = isnan(0.0);
    bool _3536 = _3532 || _3534;
    float _3538 = _3520 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3540 = _3536 ? 0 : 1;
    bool _3542 = _3318 > 0.0;
    int _3544 = ~_3540;
    int _3546 = _3544 + 1;
    int _3548 = _3546 + 1;
    int _3550 = _3548;
    if (!_3542)
    {
        int _3552 = ~_3540;
        int _3554 = _3552 + 1;
        _3550 = _3554;
    }
    int _3556 = _3550;
    bool _3558 = _3354 >= 0.0;
    bool _3560 = isnan(_3354);
    bool _3562 = _3558 || _3560;
    bool _3564 = isnan(0.0);
    bool _3566 = _3562 || _3564;
    int _3568 = _3566 ? 0 : 1;
    bool _3570 = _3354 > 0.0;
    float _3572 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3574 = _3572 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _3576 = ~_3568;
    int _3578 = _3576 + 1;
    int _3580 = _3578 + 1;
    float _3582 = 1.0 / _3574;
    int _3584 = _3580;
    if (!_3570)
    {
        int _3586 = ~_3568;
        int _3588 = _3586 + 1;
        _3584 = _3588;
    }
    int _3590 = _3584;
    float _3592 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3594 = _3592 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3596 = _2414 != 3;
    float _3598 = 1.0 / _3594;
    bool _3600 = !_3596;
    int _3602 = _3600 ? 0 : (-1);
    bool _3604 = _3076 != 3;
    float _3606 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3608 = _3606 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3610 = !_3422;
    int _3612 = _3610 ? 0 : 1;
    float _3614 = 1.0 / _3608;
    int _3616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3618 = _3616 != 0;
    int _3620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3622 = _3620 != 0;
    int _3624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3626 = _3624 != 0;
    float _3628 = _435 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _3630 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3632 = _3630 != 0;
    bool _3634 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3636 = isnan(0.0);
    bool _3638 = _3634 || _3636;
    bool _3640 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3642 = _3638 || _3640;
    float _3644 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[14].z, _3628);
    float _3646 = _3642 ? _3526 : 0.0;
    float _3648 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3650 = _3648 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _3652 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3654 = _3652 != 0;
    float _3656 = _435 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _3658 = _435 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _3660 = _435 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    bool _3662 = !_3622;
    int _3664 = _3662 ? 0 : 1;
    float _3666 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[14].x, _3656);
    bool _3668 = _1645 != 0;
    float _3670 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[14].y, _3658);
    float _3672 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[14].w, _3660);
    float _3674 = 1.0 / _3650;
    float _3676 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3678 = _3676 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3680 = fma(_499, (*spvDescriptorSet0.vp_c10)._m0[16].x, _3666);
    float _3682 = fma(_499, (*spvDescriptorSet0.vp_c10)._m0[16].y, _3670);
    float _3684 = 1.0 / _3678;
    float _3686 = fma(_499, (*spvDescriptorSet0.vp_c10)._m0[16].z, _3644);
    float _3688 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3690 = _3688 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3692 = fma(_499, (*spvDescriptorSet0.vp_c10)._m0[16].w, _3672);
    float _3694 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3696 = _3694 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3698 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3700 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3698;
    float _3702 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3704 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3702;
    float _3706 = 0.0;
    if (_3668)
    {
        float _3708 = in.m_68.w;
        _3706 = _3708;
    }
    float _3710 = _3706;
    float _3712 = 1.0 / _3690;
    float _3714 = _3696 * _3598;
    float _3716 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3718 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3716;
    float _3720 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3722 = _3720 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3724 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3726 = _3724 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _3728 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3730 = isnan(_1433);
    bool _3732 = _3728 || _3730;
    bool _3734 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3736 = _3732 || _3734;
    float _3738 = float(_3736);
    float _3740 = _3704 * _3614;
    float _3742 = _3718 * _3674;
    float _3744 = _3722 * _3258;
    float _3746 = _3726 * _3684;
    float _3748 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3750 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3748;
    float _3752 = _3700 * _3582;
    float _3754 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3756 = _1433 + _3754;
    bool _3758 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3760 = isnan(_1433);
    bool _3762 = _3758 || _3760;
    bool _3764 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3766 = _3762 || _3764;
    float _3768 = float(_3766);
    float _3770 = -_3738;
    float _3772 = _3770 + 1.0;
    float _3774 = _3750 * _3712;
    float _3776 = fma(_3752, _3756, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _3778 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3780 = isnan(_1433);
    bool _3782 = _3778 || _3780;
    bool _3784 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3786 = _3782 || _3784;
    float _3788 = float(_3786);
    float _3790 = _3768 * _3772;
    float _3792 = -_3768;
    float _3794 = _3792 + 1.0;
    float _3796 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3798 = _1433 + _3796;
    bool _3800 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3802 = isnan(_1433);
    bool _3804 = _3800 || _3802;
    bool _3806 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3808 = _3804 || _3806;
    float _3810 = float(_3808);
    float _3812 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3814 = _1433 + _3812;
    float _3816 = _3788 * _3794;
    float _3818 = -_3788;
    float _3820 = _3818 + 1.0;
    float _3822 = fma(_3714, _3798, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _3824 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3826 = isnan(_1433);
    bool _3828 = _3824 || _3826;
    bool _3830 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3832 = _3828 || _3830;
    float _3834 = float(_3832);
    float _3836 = fma(_3740, _3814, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3838 = _3810 * _3820;
    float _3840 = -_3810;
    float _3842 = _3840 + 1.0;
    bool _3844 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3846 = isnan(_1433);
    bool _3848 = _3844 || _3846;
    bool _3850 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3852 = _3848 || _3850;
    float _3854 = float(_3852);
    float _3856 = -_3834;
    float _3858 = _3856 + 1.0;
    bool _3860 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3862 = isnan(_1433);
    bool _3864 = _3860 || _3862;
    bool _3866 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3868 = _3864 || _3866;
    float _3870 = float(_3868);
    float _3872 = _3834 * _3842;
    float _3874 = _3854 * _3858;
    float _3876 = -_3854;
    float _3878 = _3876 + 1.0;
    float _3880 = -_3870;
    float _3882 = _3880 + 1.0;
    float _3884 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3886 = _1433 + _3884;
    float _3888 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3890 = 1.0 + _3888;
    float _3892 = _3870 * _3878;
    float _3894 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3896 = _1433 + _3894;
    float _3898 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3900 = _1433 + _3898;
    float _3902 = 1.0 / _3890;
    float _3904 = fma(_3744, _3886, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3906 = fma(_3746, _3896, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3908 = _1709 * 2.0;
    float _3910 = fma(_3774, _3900, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _3912 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3914 = isnan(_1433);
    bool _3916 = _3912 || _3914;
    bool _3918 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3920 = _3916 || _3918;
    float _3922 = float(_3920);
    float _3924 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3926 = _1433 + _3924;
    if (_3668)
    {
        float _3928 = _3710 * 3.1415927410125732421875;
        _1461 = _3928;
    }
    float _3930 = _1461;
    float _3932 = floor(_3908);
    float _3934 = _3682 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _3936 = _3922 * _3882;
    float _3938 = _3930;
    if (_3668)
    {
        float _3940 = _3930 * 0.15915493667125701904296875;
        _3938 = _3940;
    }
    float _3942 = _3938;
    float _3944 = fma(_3742, _3926, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3946 = _437 * _3934;
    float _3948 = _3776 * _3936;
    float _3950 = _3680 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _3952 = _3646 * _3902;
    float _3954 = _3942;
    if (_3668)
    {
        float _3956 = _3942 * 6.283185482025146484375;
        float _3958 = sin(_3956);
        _3954 = _3958;
    }
    float _3960 = _3954;
    float _3962 = _3946 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3964 = _3946 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3966 = _199 * _3950;
    float _3968 = _3946 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3970 = !_3604;
    int _3972 = _3970 ? 0 : (-1);
    float _3974 = -_3922;
    float _3976 = _3974 + 1.0;
    bool _3978 = _3932 > 0.0;
    float _3980 = fma(_3966, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3962);
    bool _3982 = _3932 >= 0.0;
    bool _3984 = isnan(_3932);
    bool _3986 = _3982 || _3984;
    bool _3988 = isnan(0.0);
    bool _3990 = _3986 || _3988;
    float _3992 = fma(_3966, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3964);
    float _3994 = fma(_3966, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3968);
    float _3996 = _3686 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    int _3998 = _3990 ? 0 : 1;
    float _4000 = fma(_3976, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3948);
    float _4002 = _3692 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _4004 = _457 * _3996;
    int _4006 = ~_3998;
    int _4008 = _4006 + 1;
    int _4010 = _4008 + 1;
    float _4012 = fma(_3822, _3892, _4000);
    bool _4014 = _3990;
    int _4016 = _4010;
    if (_3668)
    {
        bool _4018 = _3960 > 0.5;
        _4014 = _4018;
    }
    bool _4020 = _4014;
    float _4022 = fma(_4004, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3980);
    if (!_3978)
    {
        int _4024 = ~_3998;
        int _4026 = _4024 + 1;
        _4016 = _4026;
    }
    int _4028 = _4016;
    float _4030 = fma(_4004, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3992);
    float _4032 = fma(_4004, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3994);
    float _4034 = fma(_3836, _3874, _4012);
    bool _4036 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4038 = isnan(1.0);
    bool _4040 = _4036 || _4038;
    bool _4042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4044 = _4040 || _4042;
    float _4046 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4048 = fma(_4002, (*spvDescriptorSet0.vp_c8)._m0[26].w, _4032);
    float _4050 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _4052 = !_4044;
    float _4054 = _4052 ? _159 : _3952;
    float _4056 = fma(_4002, (*spvDescriptorSet0.vp_c8)._m0[24].w, _4022);
    float _4058 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4046);
    float _4060 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4050);
    float _4062 = _1701 + (-0.5);
    float _4064 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _4066 = fma(_4002, (*spvDescriptorSet0.vp_c8)._m0[25].w, _4030);
    float _4068 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _4070 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _4072 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _4074 = !_3626;
    int _4076 = _4074 ? 0 : 1;
    float _4078 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4064);
    bool _4080 = _1897 != 0;
    float _4082 = fma(as_type<float>(_1721), (*spvDescriptorSet0.vp_c9)._m0[93].w, _4068);
    bool _4084 = _1707 > 0.5;
    float _4086 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4070);
    float _4088 = _1707 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _4090 = _1707 + (-0.5);
    float _4092 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4094 = fma(as_type<float>(_1723), (*spvDescriptorSet0.vp_c9)._m0[93].z, _4072);
    float _4096 = as_type<float>(_1721) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _4098 = fma(_3904, _3872, _4034);
    float _4100 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _4102 = as_type<float>(_1723) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _4104 = _1709 + (-0.5);
    float _4106 = fma(_4096, -2.0, _4092);
    float _4108 = fma(_3944, _3838, _4098);
    float _4110 = -_4100;
    float _4112 = fma(_4102, 2.0, _4110);
    float _4114 = _1739 + (-1.0);
    float _4116 = _1771 + (-1.0);
    float _4118 = _1777 + (-1.0);
    float _4120 = fma(_3906, _3816, _4108);
    float _4122 = fma(_4114, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _4124 = fma(_4116, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _4126 = fma(_4118, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _4128 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _4130 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _4132 = fma(_3910, _3790, _4120);
    float _4134 = _4066 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _4136 = fma(_3522, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4128);
    float _4138 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4140 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _4142 = fma(_1757, -2.0, _4130);
    float _4144 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4146 = _4056 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _4148 = -_4134;
    float _4150 = _4148 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4152 = fma(_3482, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4138);
    float _4154 = _3482 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _4156 = fma(_3518, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4140);
    float _4158 = -_4146;
    float _4160 = _4158 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4162 = _4150 * _4150;
    float _4164 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4166 = _4134 + _4164;
    float _4168 = -_4144;
    float _4170 = fma(_4154, 2.0, _4168);
    float _4172 = _4048 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _4174 = fma(_4160, _4160, _4162);
    float _4176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4178 = _4146 + _4176;
    float _4180 = _4166 * _4166;
    float _4182 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4184 = _4172 + _4182;
    float _4186 = -_4172;
    float _4188 = _4186 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4190 = fma(_4178, _4178, _4180);
    float _4192 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _4194 = fma(_4188, _4188, _4174);
    float _4196 = fma(_4184, _4184, _4190);
    float _4198 = -_4192;
    float _4200 = fma(_4088, 2.0, _4198);
    float _4202 = rsqrt(_4194);
    float _4204 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _4206 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _4208 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _4210 = !_3618;
    int _4212 = _4210 ? 0 : 1;
    float _4214 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _4216 = fma(_3488, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4206);
    float _4218 = sqrt(_4196);
    float _4220 = _3516 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _4222 = _3488 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _4224 = -_4208;
    float _4226 = fma(_3538, 2.0, _4224);
    int _4228 = abs(_4076);
    float _4230 = fma(_4220, -2.0, _4204);
    float _4232 = _815 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _4234 = fma(_4222, -2.0, _4214);
    float _4236 = rsqrt(_4196);
    float _4238 = fma(_3738, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4132);
    float _4240 = _4232 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _4242 = _4188 * _4202;
    int _4244 = abs(_4212);
    float _4246 = _4160 * _4202;
    int _4248 = abs(_3664);
    float _4250 = _4150 * _4202;
    float _4252 = _4218 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _4254 = float(_4028);
    float _4256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _4258 = float(_4228);
    float _4260 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4152);
    float _4262 = precise::min(_4240, _4252);
    float _4264 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4216);
    float _4266 = float(_4244);
    float _4268 = in.m_74.x;
    float _4270 = in.m_74.y;
    float _4272 = in.m_74.z;
    float _4274 = float(_3556);
    float _4276 = _4236 * _4262;
    float _4278 = float(_4248);
    float _4280 = _4266 * _4254;
    float _4282 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4284 = _4246 * _4282;
    float _4286 = float(_3590);
    float _4288 = _4166 * _4276;
    float _4290 = _4278 * _4274;
    float _4292 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4294 = _4242 * _4292;
    float _4296 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4298 = -_4284;
    float _4300 = fma(_4242, _4296, _4298);
    float _4302 = _4258 * _4286;
    float _4304 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4306 = _4250 * _4304;
    float _4308 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4310 = -_4294;
    float _4312 = fma(_4250, _4308, _4310);
    float _4314 = _4300 * _4300;
    float _4316 = -_4288;
    float _4318 = _4166 + _4316;
    float _4320 = _4178 * _4276;
    float _4322 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4324 = -_4306;
    float _4326 = fma(_4246, _4322, _4324);
    float _4328 = fma(_4312, _4312, _4314);
    float _4330 = _4318 * _4318;
    float _4332 = -_4320;
    float _4334 = _4178 + _4332;
    float _4336 = _4184 * _4276;
    float _4338 = _4280 * (-2.0);
    float _4340 = fma(_4326, _4326, _4328);
    float _4342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _4344 = fma(_4334, _4334, _4330);
    float _4346 = -_4336;
    float _4348 = _4184 + _4346;
    float _4350 = fma(_4338, _4268, _4268);
    float _4352 = fma(_4122, _4338, _4122);
    float _4354 = _4256 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _4356 = fma(_4348, _4348, _4344);
    float _4358 = fma(_4090, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4350);
    float _4360 = _1745 + 0.5;
    float _4362 = -_159;
    float _4364 = fma(_4362, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4170);
    float _4366 = _4290 * (-2.0);
    float _4368 = fma(_4054, _4352, _4358);
    float _4370 = sqrt(_4356);
    float _4372 = fma(_4354, _4360, _4364);
    float _4374 = _4302 * (-2.0);
    float _4376 = fma(_4366, _4270, _4270);
    float _4378 = _4368 * 0.15915493667125701904296875;
    float _4380 = _4342 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _4382 = fma(_4374, _4272, _4272);
    float _4384 = fma(_4062, (*spvDescriptorSet0.vp_c9)._m0[196].y, _4376);
    float _4386 = _1755 + (-0.5);
    float _4388 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4234);
    float _4390 = fma(_4104, (*spvDescriptorSet0.vp_c9)._m0[196].z, _4382);
    float _4392 = fma(_4124, _4366, _4124);
    float _4394 = fma(_4126, _4374, _4126);
    float _4396 = -_4380;
    float _4398 = -_4388;
    float _4400 = fma(_4396, _4386, _4398);
    float _4402 = -_4260;
    float _4404 = _4402 + 1.0;
    float _4406 = fma(_4054, _4392, _4384);
    float _4408 = fma(_4054, _4394, _4390);
    float _4410 = -_4404;
    float _4412 = fma(_4410, _1745, _4372);
    float _4414 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _4416 = _3468 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _4418 = _4406 * 0.15915493667125701904296875;
    float _4420 = _3470 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _4422 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _4424 = -_4414;
    float _4426 = fma(_4416, 2.0, _4424);
    float _4428 = _4408 * 0.15915493667125701904296875;
    float _4430 = _4378 * 6.283185482025146484375;
    float _4432 = sin(_4430);
    float _4434 = fma(_4420, -2.0, _4422);
    float _4436 = -_4264;
    float _4438 = _4436 + 1.0;
    float _4440 = _4236 * _4370;
    out.m_76.x = _4238;
    float _4442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _227);
    float _4444 = fma(_4438, _1755, _4400);
    float _4446 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _233);
    float _4448 = _4378 * 6.283185482025146484375;
    float _4450 = cos(_4448);
    float _4452 = _1781 * _4440;
    float _4454 = _4232 * _4440;
    out.m_78.x = _4412;
    out.m_78.y = _4444;
    float _4456 = _4440 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _4458 = _4456 * 0.5;
    float _4460 = _4452 * _4446;
    float _4462 = _4454 * _4442;
    out.m_80.x = _4454;
    float _4464 = _4418 * 6.283185482025146484375;
    float _4466 = sin(_4464);
    int _4468 = abs(_2548);
    out.m_82.w = _4262;
    bool _4470 = !_3632;
    float _4472 = _4470 ? _233 : as_type<float>(_3172);
    int _4474 = ~_4468;
    int _4476 = _4474 + 1;
    int _4478 = _4476 + 1;
    float _4480 = _4418 * 6.283185482025146484375;
    float _4482 = cos(_4480);
    float _4484 = rsqrt(_4340);
    float _4486 = _4432 * _4466;
    float _4488 = _4450 * _4466;
    float _4490 = _4428 * 6.283185482025146484375;
    float _4492 = cos(_4490);
    float _4494 = _4450 * _4482;
    float _4496 = _4432 * _4482;
    float _4498 = _4428 * 6.283185482025146484375;
    float _4500 = sin(_4498);
    float _4502 = _4326 * _4484;
    float _4504 = _4312 * _4484;
    float _4506 = _4300 * _4484;
    float _4508 = _4250 * _4504;
    float _4510 = _4432 * _4492;
    int _4512 = _2420 >> 31;
    float _4514 = _4450 * _4492;
    int _4516 = _2402 >> 31;
    float _4518 = _4482 * _4492;
    int _4520 = _4512 & 3;
    float _4522 = _4466 * _4492;
    int _4524 = _4516 & 3;
    float _4526 = fma(_4500, _4494, _4486);
    float _4528 = fma(_4500, _4486, _4494);
    float _4530 = _4246 * _4502;
    int _4532 = _2420 + _4520;
    float _4534 = _4242 * _4506;
    float _4536 = -_4488;
    float _4538 = fma(_4500, _4496, _4536);
    float _4540 = -_4530;
    float _4542 = fma(_4242, _4504, _4540);
    float _4544 = -_4496;
    float _4546 = fma(_4500, _4488, _4544);
    int _4548 = _2402 + _4524;
    float _4550 = -_4534;
    float _4552 = fma(_4250, _4502, _4550);
    int _4554 = _3024 >> 31;
    float _4556 = _4514 * _4542;
    int _4558 = _4548 >> 2;
    float _4560 = -_4460;
    float _4562 = _4500 * _4560;
    int _4564 = _4554 & 3;
    float _4566 = -_4500;
    float _4568 = fma(_4566, _4506, _4556);
    float _4570 = _4514 * _4552;
    int _4572 = _3052 >> 31;
    float _4574 = -_4508;
    float _4576 = fma(_4246, _4506, _4574);
    int _4578 = _4558 << 4;
    int _4580 = _4578 + 368;
    float _4582 = -_4500;
    float _4584 = fma(_4582, _4504, _4570);
    int _4586 = _4572 & 3;
    float _4588 = _4514 * _4460;
    uint _4590 = uint(int(uint(_4580) >> uint(2)));
    uint _4592 = uint(int(uint(int(_4590)) >> uint(2)));
    int _4594 = int(_4590) & 3;
    float _4596 = (*spvDescriptorSet0.vp_c9)._m0[int(_4592)][_4594];
    int _4598 = int(_4590) + 1;
    uint _4600 = uint(int(uint(_4598) >> uint(2)));
    int _4602 = _4598 & 3;
    float _4604 = (*spvDescriptorSet0.vp_c9)._m0[int(_4600)][_4602];
    int _4606 = _3024 + _4564;
    float _4608 = _4510 * _4460;
    int _4610 = _3052 + _4586;
    float _4612 = fma(_4518, _4462, _4562);
    int _4614 = _4606 >> 2;
    float _4616 = _4526 * _4552;
    int _4618 = _4610 >> 2;
    float _4620 = _4526 * _4542;
    int _4622 = _4532 >> 2;
    float _4624 = _4514 * _4576;
    int _4626 = _4614 << 4;
    int _4628 = _4626 + 656;
    float _4630 = fma(_4526, _4462, _4588);
    int _4632 = _4618 << 4;
    int _4634 = _4632 + 800;
    float _4636 = _4526 * _4576;
    int _4638 = _4622 << 4;
    int _4640 = _4638 + 512;
    float _4642 = fma(_4538, _4462, _4608);
    float _4644 = fma(_4518, _4504, _4616);
    float _4646 = fma(_4518, _4506, _4620);
    float _4648 = -_4500;
    float _4650 = fma(_4648, _4502, _4624);
    uint _4652 = uint(int(uint(_4628) >> uint(2)));
    uint _4654 = uint(int(uint(int(_4652)) >> uint(2)));
    int _4656 = int(_4652) & 3;
    float _4658 = (*spvDescriptorSet0.vp_c9)._m0[int(_4654)][_4656];
    int _4660 = int(_4652) + 1;
    uint _4662 = uint(int(uint(_4660) >> uint(2)));
    int _4664 = _4660 & 3;
    float _4666 = (*spvDescriptorSet0.vp_c9)._m0[int(_4662)][_4664];
    float _4668 = _4546 * _4542;
    float _4670 = fma(_4518, _4502, _4636);
    float _4672 = fma(_4510, _4246, _4584);
    float _4674 = fma(_4510, _4250, _4568);
    float _4676 = fma(_4510, _4242, _4650);
    float _4678 = _4546 * _4552;
    float _4680 = _4546 * _4576;
    uint _4682 = uint(int(uint(_4634) >> uint(2)));
    uint _4684 = uint(int(uint(int(_4682)) >> uint(2)));
    int _4686 = int(_4682) & 3;
    float _4688 = (*spvDescriptorSet0.vp_c9)._m0[int(_4684)][_4686];
    int _4690 = int(_4682) + 1;
    uint _4692 = uint(int(uint(_4690) >> uint(2)));
    int _4694 = _4690 & 3;
    float _4696 = (*spvDescriptorSet0.vp_c9)._m0[int(_4692)][_4694];
    float _4698 = fma(_4522, _4506, _4668);
    float _4700 = fma(_4546, _4458, _4630);
    float _4702 = fma(_4522, _4458, _4612);
    float _4704 = fma(_4522, _4504, _4678);
    float _4706 = fma(_4522, _4502, _4680);
    int _4708 = abs(_2526);
    float _4710 = _4552 * _4700;
    uint _4712 = uint(int(uint(_4640) >> uint(2)));
    uint _4714 = uint(int(uint(int(_4712)) >> uint(2)));
    int _4716 = int(_4712) & 3;
    float _4718 = (*spvDescriptorSet0.vp_c9)._m0[int(_4714)][_4716];
    int _4720 = int(_4712) + 1;
    uint _4722 = uint(int(uint(_4720) >> uint(2)));
    int _4724 = _4720 & 3;
    float _4726 = (*spvDescriptorSet0.vp_c9)._m0[int(_4722)][_4724];
    float _4728 = _4576 * _4700;
    int _4730 = ~_4708;
    int _4732 = _4730 + 1;
    int _4734 = _4732 + 1;
    float _4736 = fma(_4528, _4458, _4642);
    int _4738 = abs(_3074);
    float _4740 = fma(_4504, _4702, _4710);
    float _4742 = fma(_4502, _4702, _4728);
    int _4744 = abs(_3612);
    int _4746 = _4640 + 8;
    uint _4748 = uint(int(uint(_4746) >> uint(2)));
    uint _4750 = uint(int(uint(int(_4748)) >> uint(2)));
    int _4752 = int(_4748) & 3;
    float _4754 = (*spvDescriptorSet0.vp_c9)._m0[int(_4750)][_4752];
    int _4756 = int(_4748) + 1;
    uint _4758 = uint(int(uint(_4756) >> uint(2)));
    int _4760 = _4756 & 3;
    float _4762 = (*spvDescriptorSet0.vp_c9)._m0[int(_4758)][_4760];
    int _4764 = abs(_3094);
    float _4766 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4768 = int(_4766);
    int _4770 = ~_4744;
    int _4772 = _4770 + 1;
    int _4774 = _4772 + 1;
    int _4776 = _4734 * as_type<int>(_4604);
    int _4778 = abs(_3414);
    float _4780 = fma(_4242, _4736, _4742);
    int _4782 = ~_4764;
    int _4784 = _4782 + 1;
    int _4786 = _4784 + 1;
    int _4788 = _4628 + 8;
    uint _4790 = uint(int(uint(_4788) >> uint(2)));
    uint _4792 = uint(int(uint(int(_4790)) >> uint(2)));
    int _4794 = int(_4790) & 3;
    float _4796 = (*spvDescriptorSet0.vp_c9)._m0[int(_4792)][_4794];
    int _4798 = int(_4790) + 1;
    uint _4800 = uint(int(uint(_4798) >> uint(2)));
    int _4802 = _4798 & 3;
    float _4804 = (*spvDescriptorSet0.vp_c9)._m0[int(_4800)][_4802];
    int _4806 = ~_4778;
    int _4808 = _4806 + 1;
    int _4810 = _4808 + 1;
    float _4812 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4814 = int(_4812);
    float _4816 = fma(_4528, _4246, _4704);
    float _4818 = fma(_4528, _4250, _4698);
    float _4820 = fma(_4528, _4242, _4706);
    int _4822 = _4810 * as_type<int>(_4596);
    int _4824 = _4822 + _4776;
    int _4826 = abs(_3126);
    int _4828 = _4580 + 8;
    uint _4830 = uint(int(uint(_4828) >> uint(2)));
    uint _4832 = uint(int(uint(int(_4830)) >> uint(2)));
    int _4834 = int(_4830) & 3;
    float _4836 = (*spvDescriptorSet0.vp_c9)._m0[int(_4832)][_4834];
    int _4838 = int(_4830) + 1;
    uint _4840 = uint(int(uint(_4838) >> uint(2)));
    int _4842 = _4838 & 3;
    float _4844 = (*spvDescriptorSet0.vp_c9)._m0[int(_4840)][_4842];
    float _4846 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4848 = int(_4846);
    int _4850 = ~_4826;
    int _4852 = _4850 + 1;
    int _4854 = _4852 + 1;
    int _4856 = _4634 + 8;
    uint _4858 = uint(int(uint(_4856) >> uint(2)));
    uint _4860 = uint(int(uint(int(_4858)) >> uint(2)));
    int _4862 = int(_4858) & 3;
    float _4864 = (*spvDescriptorSet0.vp_c9)._m0[int(_4860)][_4862];
    int _4866 = int(_4858) + 1;
    uint _4868 = uint(int(uint(_4866) >> uint(2)));
    int _4870 = _4866 & 3;
    float _4872 = (*spvDescriptorSet0.vp_c9)._m0[int(_4868)][_4870];
    int _4874 = ~_4738;
    int _4876 = _4874 + 1;
    int _4878 = _4876 + 1;
    int _4880 = ~_4814;
    int _4882 = _4880 + 1;
    int _4884 = _4878 * as_type<int>(_4666);
    float _4886 = float(uint(_4768));
    int _4888 = _4786 * as_type<int>(_4696);
    int _4890 = abs(_3436);
    float _4892 = _4542 * _4700;
    int _4894 = abs(_3134);
    float _4896 = 1.0 / _4886;
    float _4898 = fma(_4506, _4702, _4892);
    int _4900 = ~_4890;
    int _4902 = _4900 + 1;
    int _4904 = _4902 + 1;
    int _4906 = _4478 * as_type<int>(_4726);
    int _4908 = ~_3396;
    int _4910 = _4908 + 1;
    int _4912 = _4910 + 1;
    float _4914 = float(uint(_4848));
    int _4916 = _4774 * as_type<int>(_4718);
    int _4918 = _4916 + _4906;
    int _4920 = ~_4894;
    int _4922 = _4920 + 1;
    int _4924 = _4922 + 1;
    int _4926 = _4904 * as_type<int>(_4658);
    int _4928 = _4926 + _4884;
    float _4930 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4932 = int(_4930);
    int _4934 = _4912 * as_type<int>(_4688);
    int _4936 = _4934 + _4888;
    int _4938 = abs(_3602);
    int _4940 = _4924 * as_type<int>(_4754);
    int _4942 = _4940 + _4918;
    int _4944 = abs(_3166);
    int _4946 = abs(_3180);
    int _4948 = ~_4944;
    int _4950 = _4948 + 1;
    int _4952 = _4950 + 1;
    int _4954 = ~_4938;
    int _4956 = _4954 + 1;
    int _4958 = _4956 + 1;
    int _4960 = ~_4946;
    int _4962 = _4960 + 1;
    int _4964 = _4962 + 1;
    int _4966 = _4952 * as_type<int>(_4796);
    int _4968 = _4966 + _4928;
    int _4970 = abs(_3446);
    float _4972 = float(uint(_4814));
    int _4974 = _4854 * as_type<int>(_4836);
    int _4976 = _4974 + _4824;
    int _4978 = ~_4970;
    int _4980 = _4978 + 1;
    int _4982 = _4980 + 1;
    float _4984 = 1.0 / _4914;
    int _4986 = abs(_3492);
    int _4988 = _4958 * as_type<int>(_4844);
    int _4990 = _4988 + _4976;
    int _4992 = abs(_3454);
    bool _4994 = !_3496;
    int _4996 = _4994 ? 0 : 1;
    int _4998 = abs(_4932);
    int _5000 = _4964 * as_type<int>(_4864);
    int _5002 = _5000 + _4936;
    int _5004 = ~_4992;
    int _5006 = _5004 + 1;
    int _5008 = _5006 + 1;
    float _5010 = 1.0 / _4972;
    int _5012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _5014 = _5012 != 0;
    int _5016 = abs(_4996);
    int _5018 = _5008 * as_type<int>(_4762);
    int _5020 = _5018 + _4942;
    bool _5022 = !_5014;
    int _5024 = _5022 ? 0 : 1;
    int _5026 = ~_4986;
    int _5028 = _5026 + 1;
    int _5030 = _5028 + 1;
    int _5032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _5034 = _5032 != 0;
    int _5036 = _4982 * as_type<int>(_4804);
    int _5038 = _5036 + _4968;
    int _5040 = abs(_3972);
    float _5042 = _4172 + _4780;
    int _5044 = ~_5016;
    int _5046 = _5044 + 1;
    int _5048 = _5046 + 1;
    int _5050 = ~_5040;
    int _5052 = _5050 + 1;
    int _5054 = _5052 + 1;
    float _5056 = float(uint(_4932));
    int _5058 = abs(_4768);
    int _5060 = _5054 * as_type<int>(_4872);
    int _5062 = _5060 + _5002;
    float _5064 = fma(_4246, _4736, _4740);
    int _5066 = _4990 * _5030;
    int _5068 = abs(_3426);
    float _5070 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5072 = _5042 + _5070;
    float _5074 = _4146 + _5064;
    int _5076 = _5020 * _5048;
    float _5078 = _5072 * _5072;
    float _5080 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5082 = _5074 + _5080;
    int _5084 = _3342 * _5016;
    int _5086 = _5084 + _5076;
    int _5088 = ~_5068;
    int _5090 = _5088 + 1;
    int _5092 = _5090 + 1;
    int _5094 = _3418 * _4986;
    int _5096 = _5094 + _5066;
    float _5098 = fma(_5082, _5082, _5078);
    int _5100 = abs(_5024);
    float _5102 = 1.0 / _5056;
    int _5104 = _5038 * _5092;
    int _5106 = as_type<int>(_4984) + (-2);
    int _5108 = _3394 * _5068;
    int _5110 = _5108 + _5104;
    float _5112 = float(uint(_5086));
    float _5114 = sqrt(_5098);
    int _5116 = as_type<int>(_4896) + (-2);
    float _5118 = float(uint(_5096));
    float _5120 = as_type<float>(_5106) * _5112;
    float _5122 = float(uint(_5058));
    int _5124 = ~_5100;
    int _5126 = _5124 + 1;
    int _5128 = _5126 + 1;
    float _5130 = as_type<float>(_5116) * _5118;
    int _5132 = as_type<int>(_5102) + (-2);
    float _5134 = 1.0 / _5122;
    int _5136 = _5062 * _5128;
    int _5138 = abs(_4848);
    float _5140 = float(uint(_5110));
    int _5142 = _3478 * _5100;
    int _5144 = _5142 + _5136;
    int _5146 = ~_4848;
    int _5148 = _5146 + 1;
    float _5150 = trunc(_5120);
    float _5152 = precise::max(_5150, 0.0);
    uint _5154 = uint(_5152);
    int _5156 = abs(_4814);
    float _5158 = as_type<float>(_5132) * _5140;
    int _5160 = as_type<int>(_5010) + (-2);
    float _5162 = float(uint(_5138));
    float _5164 = trunc(_5130);
    float _5166 = precise::max(_5164, 0.0);
    uint _5168 = uint(_5166);
    float _5170 = float(uint(_5156));
    float _5172 = float(uint(_5144));
    int _5174 = ~_4768;
    int _5176 = _5174 + 1;
    int _5178 = as_type<int>(_5134) + (-2);
    int _5180 = _5148 * int(_5154);
    int _5182 = _5180 + _5086;
    float _5184 = 1.0 / _5162;
    float _5186 = as_type<float>(_5160) * _5172;
    float _5188 = float(uint(_4998));
    float _5190 = float(uint(_5182));
    int _5192 = abs(_5086);
    int _5194 = _5176 * int(_5168);
    int _5196 = _5194 + _5096;
    float _5198 = 1.0 / _5170;
    float _5200 = as_type<float>(_5106) * _5190;
    int _5202 = abs(_5144);
    float _5204 = float(uint(_5196));
    float _5206 = 1.0 / _5188;
    float _5208 = as_type<float>(_5116) * _5204;
    float _5210 = fma(_4538, _4246, _4644);
    float _5212 = fma(_4538, _4250, _4646);
    int _5214 = as_type<int>(_5184) + (-2);
    float _5216 = fma(_4250, _4736, _4898);
    float _5218 = float(uint(_5192));
    float _5220 = trunc(_5158);
    float _5222 = precise::max(_5220, 0.0);
    uint _5224 = uint(_5222);
    int _5226 = as_type<int>(_5198) + (-2);
    float _5228 = _4134 + _5216;
    float _5230 = float(uint(_5202));
    float _5232 = as_type<float>(_5214) * _5218;
    int _5234 = abs(_5096);
    float _5236 = fma(_4538, _4242, _4670);
    float _5238 = _233 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5240 = trunc(_5186);
    float _5242 = precise::max(_5240, 0.0);
    uint _5244 = uint(_5242);
    float _5246 = float(uint(_5234));
    float _5248 = as_type<float>(_5226) * _5230;
    int _5250 = ~_4932;
    int _5252 = _5250 + 1;
    out.m_84.x = _5210;
    out.m_84.y = _5212;
    out.m_84.z = _5236;
    float _5254 = as_type<float>(_5178) * _5246;
    float _5256 = -_227;
    int _5258 = _4080 ? as_type<int>(_5256) : as_type<int>(_227);
    float _5260 = trunc(_5232);
    float _5262 = precise::max(_5260, 0.0);
    uint _5264 = uint(_5262);
    float _5266 = -_227;
    int _5268 = _4084 ? as_type<int>(_5266) : as_type<int>(_227);
    int _5270 = abs(_5110);
    int _5272 = as_type<int>(_5206) + (-2);
    float _5274 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5276 = _5184;
    float _5278 = _5074;
    float _5280 = _5042;
    if (!_3668)
    {
        _5276 = _227;
    }
    float _5282 = _5276;
    int _5284 = _4882 * int(_5244);
    int _5286 = _5284 + _5144;
    float _5288 = _5282;
    if (_3668)
    {
        float _5290 = -_227;
        float _5292 = _4020 ? _5290 : _227;
        _5288 = _5292;
    }
    float _5294 = _5288;
    float _5296 = trunc(_5254);
    float _5298 = precise::max(_5296, 0.0);
    uint _5300 = uint(_5298);
    bool _5302 = !_5034;
    float _5304 = _5302 ? _227 : as_type<float>(_5258);
    bool _5306 = !_3654;
    float _5308 = _5306 ? _227 : as_type<float>(_5268);
    int _5310 = _5252 * int(_5224);
    int _5312 = _5310 + _5110;
    float _5314 = float(uint(_5270));
    float _5316 = _5238 * _4672;
    float _5318 = float(uint(_5286));
    float _5320 = _5238 * _4676;
    float _5322 = float(uint(_5312));
    float _5324 = as_type<float>(_5272) * _5314;
    float _5326 = _5238 * _4674;
    float _5328 = fma(_5274, _5210, _5316);
    float _5330 = as_type<float>(_5160) * _5318;
    float _5332 = as_type<float>(_5132) * _5322;
    float _5334 = fma(_5274, _5212, _5326);
    float _5336 = fma(_5274, _5236, _5320);
    bool _5338 = _5114 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5340 = trunc(_5324);
    float _5342 = precise::max(_5340, 0.0);
    uint _5344 = uint(_5342);
    int _5346 = ~_5058;
    int _5348 = _5346 + 1;
    int _5350 = ~_5138;
    int _5352 = _5350 + 1;
    float _5354 = trunc(_5248);
    float _5356 = precise::max(_5354, 0.0);
    uint _5358 = uint(_5356);
    int _5360 = ~_4998;
    int _5362 = _5360 + 1;
    int _5364 = _5348 * int(_5300);
    int _5366 = _5364 + _5234;
    float _5368 = as_type<float>(_5348);
    if (!_5338)
    {
        _5368 = _5074;
    }
    float _5370 = _5368;
    int _5372 = _5352 * int(_5264);
    int _5374 = _5372 + _5192;
    float _5376 = _5370;
    if (!_5338)
    {
        _5278 = _5042;
    }
    float _5378 = _5278;
    float _5380 = trunc(_5208);
    float _5382 = precise::max(_5380, 0.0);
    uint _5384 = uint(_5382);
    float _5386 = float(uint(_5366));
    float _5388 = _5378;
    if (!_5338)
    {
        _5280 = _5228;
    }
    float _5390 = _5280;
    float _5392 = trunc(_5200);
    float _5394 = precise::max(_5392, 0.0);
    uint _5396 = uint(_5394);
    float _5398 = trunc(_5332);
    float _5400 = precise::max(_5398, 0.0);
    uint _5402 = uint(_5400);
    float _5404 = trunc(_5330);
    float _5406 = precise::max(_5404, 0.0);
    uint _5408 = uint(_5406);
    bool _5410 = !_5338;
    float _5412 = _5390;
    if (!_5410)
    {
        float _5414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5418 = _5114 + _5416;
        float _5420 = rsqrt(_5098);
        float _5422 = _5418 * _5414;
        float _5424 = _5228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5426 = _5422 * 0.15915493667125701904296875;
        float _5428 = _5426 * 6.283185482025146484375;
        float _5430 = cos(_5428);
        float _5432 = _5426 * 6.283185482025146484375;
        float _5434 = sin(_5432);
        float _5436 = _5430 + (-1.0);
        float _5438 = _5436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5440 = fma(_5434, _5424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5442 = fma(_5228, _5430, _5438);
        float _5444 = _5420 * _5440;
        float _5446 = fma(_5082, _5444, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5448 = fma(_5072, _5444, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5412 = _5442;
        _5376 = _5446;
        _5388 = _5448;
    }
    float _5450 = _5412;
    float _5452 = _5376;
    float _5454 = _5388;
    int _5456 = _5362 * int(_5344);
    int _5458 = _5456 + _5270;
    int _5460 = ~_5156;
    int _5462 = _5460 + 1;
    float _5464 = as_type<float>(_5178) * _5386;
    float _5466 = float(uint(_5374));
    float _5468 = -_159;
    float _5470 = fma(_5468, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4426);
    float _5472 = float(uint(_5458));
    float _5474 = trunc(_5464);
    float _5476 = precise::max(_5474, 0.0);
    uint _5478 = uint(_5476);
    int _5480 = int(_5244) + int(_5408);
    float _5482 = as_type<float>(_5214) * _5466;
    int _5484 = int(_5168) + int(_5384);
    float _5486 = as_type<float>(_5272) * _5472;
    int _5488 = _5462 * int(_5358);
    int _5490 = _5488 + _5202;
    int _5492 = int(_5154) + int(_5396);
    float _5494 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _4142);
    int _5496 = ~_4768;
    int _5498 = _5496 + 1;
    float _5500 = trunc(_5482);
    float _5502 = precise::max(_5500, 0.0);
    uint _5504 = uint(_5502);
    float _5506 = float(uint(_5490));
    float _5508 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4230);
    int _5510 = ~_4848;
    int _5512 = _5510 + 1;
    float _5514 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4106);
    int _5516 = ~_4932;
    int _5518 = _5516 + 1;
    float _5520 = as_type<float>(_5226) * _5506;
    int _5522 = ~_4814;
    int _5524 = _5522 + 1;
    int _5526 = _5512 * _5492;
    int _5528 = _5526 + _5086;
    int _5530 = int(_5224) + int(_5402);
    int _5532 = _5498 * _5484;
    int _5534 = _5532 + _5096;
    float _5536 = trunc(_5520);
    float _5538 = precise::max(_5536, 0.0);
    uint _5540 = uint(_5538);
    float _5542 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4082);
    bool _5544 = uint(_5534) >= uint(_4768);
    int _5546 = _5518 * _5530;
    int _5548 = _5546 + _5110;
    int _5550 = int(_5300) + int(_5478);
    int _5552 = _5524 * _5480;
    int _5554 = _5552 + _5144;
    int _5556 = int(_5264) + int(_5504);
    float _5558 = trunc(_5486);
    float _5560 = precise::max(_5558, 0.0);
    uint _5562 = uint(_5560);
    bool _5564 = uint(_5548) >= uint(_4932);
    float _5566 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4434);
    bool _5568 = uint(_5554) >= uint(_4814);
    float _5570 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[92].z, _4094);
    int _5572 = ~_5058;
    int _5574 = _5572 + 1;
    float _5576 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4060);
    int _5578 = ~_5138;
    int _5580 = _5578 + 1;
    float _5582 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4156);
    int _5584 = int(_5358) + int(_5540);
    int _5586 = _5574 * _5550;
    int _5588 = _5586 + _5234;
    bool _5590 = uint(_5528) >= uint(_4848);
    int _5592 = _5580 * _5556;
    int _5594 = _5592 + _5192;
    int _5596 = ~_4998;
    int _5598 = _5596 + 1;
    float _5600 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4086);
    bool _5602 = !_5544;
    int _5604 = _5602 ? 0 : (-1);
    float _5606 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4078);
    int _5608 = int(_5344) + int(_5562);
    float _5610 = -_5600;
    float _5612 = _5610 + 1.0;
    int _5614 = ~_5484;
    int _5616 = _5614 + _5604;
    int _5618 = _5616 + 1;
    float _5620 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4058);
    bool _5622 = uint(_5594) >= uint(_5138);
    int _5624 = _5598 * _5608;
    int _5626 = _5624 + _5270;
    bool _5628 = !_5590;
    int _5630 = _5628 ? 0 : (-1);
    int _5632 = _4768 * _5618;
    int _5634 = _5632 + _5096;
    int _5636 = ~_5156;
    int _5638 = _5636 + 1;
    float _5640 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4136);
    int _5642 = ~_5492;
    int _5644 = _5642 + _5630;
    int _5646 = _5644 + 1;
    float _5648 = -_5576;
    float _5650 = _5648 + 1.0;
    bool _5652 = _4768 == 0;
    int _5654 = _5638 * _5584;
    int _5656 = _5654 + _5202;
    bool _5658 = uint(_5626) >= uint(_4998);
    int _5660 = _4848 * _5646;
    int _5662 = _5660 + _5086;
    bool _5664 = uint(_5588) >= uint(_5058);
    float _5666 = -_5606;
    float _5668 = _5666 + 1.0;
    bool _5670 = !_5564;
    int _5672 = _5670 ? 0 : (-1);
    float _5674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _5676 = !_5652;
    int _5678 = _5676 ? _5634 : (-1);
    float _5680 = -_5640;
    float _5682 = _5680 + 1.0;
    int _5684 = ~_5530;
    int _5686 = _5684 + _5672;
    int _5688 = _5686 + 1;
    bool _5690 = _4848 == 0;
    int _5692 = _5096 ^ _4768;
    int _5694 = _4932 * _5688;
    int _5696 = _5694 + _5110;
    bool _5698 = !_5622;
    int _5700 = _5698 ? 0 : (-1);
    float _5702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _5704 = !_5690;
    int _5706 = _5704 ? _5662 : (-1);
    bool _5708 = uint(_5656) >= uint(_5156);
    int _5710 = _5086 ^ _4848;
    float _5712 = _5674 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _5714 = _4932 == 0;
    float _5716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _5718 = _4932 == 0;
    int _5720 = _5110 ^ _4932;
    bool _5722 = !_5568;
    int _5724 = _5722 ? 0 : (-1);
    bool _5726 = !_5658;
    int _5728 = _5726 ? 0 : (-1);
    uint _5730 = uint(int(uint(_5692) >> uint(31)));
    bool _5732 = !_5664;
    int _5734 = _5732 ? 0 : (-1);
    uint _5736 = uint(int(uint(_5710) >> uint(31)));
    int _5738 = ~_5728;
    int _5740 = _5608 + _5738;
    int _5742 = _5740 + 1;
    float _5744 = _5716 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _5746 = ~_5480;
    int _5748 = _5746 + _5724;
    int _5750 = _5748 + 1;
    int _5752 = ~int(_5730);
    int _5754 = _5752 + 1;
    float _5756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _5758 = ~_5734;
    int _5760 = _5550 + _5758;
    int _5762 = _5760 + 1;
    int _5764 = _4814 * _5750;
    int _5766 = _5764 + _5144;
    float _5768 = float(_5678);
    float _5770 = -_159;
    float _5772 = fma(_5770, (*spvDescriptorSet0.vp_c9)._m0[76].x, _4200);
    int _5774 = ~_5700;
    int _5776 = _5556 + _5774;
    int _5778 = _5776 + 1;
    int _5780 = ~int(_5736);
    int _5782 = _5780 + 1;
    float _5784 = fma(_5712, _5768, _5772);
    bool _5786 = !_5708;
    int _5788 = _5786 ? 0 : (-1);
    float _5790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5792 = _5778 ^ _5782;
    uint _5794 = uint(int(uint(_5720) >> uint(31)));
    int _5796 = ~_5788;
    int _5798 = _5584 + _5796;
    int _5800 = _5798 + 1;
    float _5802 = _5756 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _5804 = ~_5782;
    int _5806 = _5804 + _5792;
    int _5808 = _5806 + 1;
    float _5810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    int _5812 = ~int(_5794);
    int _5814 = _5812 + 1;
    bool _5816 = !_5714;
    int _5818 = _5816 ? _5696 : (-1);
    int _5820 = _5144 ^ _4814;
    float _5822 = -_5542;
    float _5824 = _5822 + 1.0;
    float _5826 = float(_5818);
    bool _5828 = _4814 == 0;
    uint _5830 = uint(int(uint(_5820) >> uint(31)));
    float _5832 = fma(_5802, _5826, _5470);
    bool _5834 = !_5828;
    int _5836 = _5834 ? _5766 : (-1);
    int _5838 = ~int(_5830);
    int _5840 = _5838 + 1;
    float _5842 = _5810 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _5844 = _5762 ^ _5754;
    float _5846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _5848 = float(_5836);
    float _5850 = _5308 + 0.5;
    int _5852 = _5800 ^ _5840;
    bool _5854 = _4768 == 0;
    float _5856 = fma(_5712, _5850, _5784);
    int _5858 = ~_5754;
    int _5860 = _5858 + _5844;
    int _5862 = _5860 + 1;
    float _5864 = -_159;
    float _5866 = fma(_5864, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4226);
    int _5868 = _5742 ^ _5814;
    float _5870 = _5702 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _5872 = float(_5706);
    float _5874 = -_5668;
    float _5876 = fma(_5308, _5874, _5856);
    int _5878 = ~_5840;
    int _5880 = _5878 + _5852;
    int _5882 = _5880 + 1;
    float _5884 = -_4336;
    float _5886 = _4172 + _5884;
    int _5888 = ~_5814;
    int _5890 = _5888 + _5868;
    int _5892 = _5890 + 1;
    float _5894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _5896 = !_5854;
    int _5898 = _5896 ? _5862 : (-1);
    float _5900 = -_159;
    float _5902 = fma(_5900, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4112);
    float _5904 = fma(_5744, _5872, _5866);
    float _5906 = _5304 + 0.5;
    float _5908 = float(_5898);
    float _5910 = fma(_5842, _5848, _5902);
    bool _5912 = _4848 == 0;
    float _5914 = _5294 + 0.5;
    bool _5916 = _4814 == 0;
    float _5918 = fma(_5744, _5906, _5904);
    bool _5920 = !_5912;
    int _5922 = _5920 ? _5808 : (-1);
    float _5924 = _1843 + 0.5;
    float _5926 = -_5494;
    float _5928 = fma(_5870, _5908, _5926);
    float _5930 = fma(_5842, _5914, _5910);
    bool _5932 = !_5718;
    int _5934 = _5932 ? _5892 : (-1);
    float _5936 = fma(_5802, _5924, _5832);
    bool _5938 = !_5916;
    int _5940 = _5938 ? _5882 : (-1);
    float _5942 = _5790 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5944 = float(_5934);
    float _5946 = _4472 + (-0.5);
    float _5948 = float(_5922);
    float _5950 = _5894 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _5952 = float(_5940);
    float _5954 = fma(_5238, _5238, 1.0);
    float _5956 = _5846 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5958 = -_5870;
    float _5960 = fma(_5958, _5946, _5928);
    float _5962 = -_5508;
    float _5964 = fma(_5942, _5948, _5962);
    float _5966 = -_5514;
    float _5968 = fma(_5950, _5952, _5966);
    float _5970 = _1901 + (-0.5);
    float _5972 = _1603 + (-0.5);
    float _5974 = rsqrt(_5954);
    float _5976 = -_5566;
    float _5978 = fma(_5956, _5944, _5976);
    float _5980 = -_5942;
    float _5982 = fma(_5980, _5970, _5964);
    float _5984 = -_5950;
    float _5986 = fma(_5984, _5972, _5968);
    float _5988 = -_4134;
    float _5990 = _5988 + _5450;
    float _5992 = _1847 + (-0.5);
    float _5994 = -_5570;
    float _5996 = _5994 + 1.0;
    float _5998 = fma(_5824, _1603, _5986);
    float _6000 = _5990 * _5990;
    float _6002 = -_4146;
    float _6004 = _6002 + _5452;
    float _6006 = -_5956;
    float _6008 = fma(_6006, _5992, _5978);
    float _6010 = -_5996;
    float _6012 = fma(_6010, _5294, _5930);
    float _6014 = -_4172;
    float _6016 = _6014 + _5454;
    float _6018 = fma(_6004, _6004, _6000);
    float _6020 = fma(_1847, _5650, _6008);
    float _6022 = -_5582;
    float _6024 = _6022 + 1.0;
    float _6026 = _5238 * _5974;
    float _6028 = fma(_6016, _6016, _6018);
    float _6030 = -_5612;
    float _6032 = fma(_1843, _6030, _5936);
    float _6034 = fma(_1901, _6024, _5982);
    float _6036 = -_4818;
    float _6038 = _6026 * _6036;
    float _6040 = sqrt(_6028);
    float _6042 = -_4820;
    float _6044 = _6026 * _6042;
    float _6046 = _4816 + _5328;
    float _6048 = fma(_5974, _4674, _6038);
    float _6050 = _4818 + _5334;
    float _6052 = fma(_5974, _4676, _6044);
    float _6054 = _4820 + _5336;
    out.m_86.x = _6032;
    out.m_86.y = _6020;
    float _6056 = -_4816;
    float _6058 = _6026 * _6056;
    float _6060 = -_5620;
    float _6062 = _6060 + 1.0;
    float _6064 = -_5682;
    float _6066 = fma(_5304, _6064, _5918);
    out.m_88.x = _6012;
    out.m_88.y = _5998;
    float _6068 = fma(_5974, _4672, _6058);
    float _6070 = fma(_4472, _6062, _5960);
    float _6072 = -_4320;
    float _6074 = _6072 + _5452;
    out.m_90.x = _6046;
    out.m_90.y = _6050;
    out.m_90.z = _6054;
    bool _6076 = _6040 > 0.0;
    float _6078 = -_4288;
    float _6080 = _6078 + _5450;
    float _6082 = -_4336;
    float _6084 = _6082 + _5454;
    out.m_92.x = _6068;
    out.m_92.y = _6048;
    out.m_92.z = _6052;
    float _6086 = -_4320;
    float _6088 = _4146 + _6086;
    float _6090 = -_4288;
    float _6092 = _4134 + _6090;
    out.m_94.x = _5876;
    out.m_94.y = _6070;
    out.m_94.z = _6066;
    out.m_94.w = _6034;
    float _6094 = _5450;
    float _6096 = _6052;
    float _6098 = _6070;
    float _6100 = _5876;
    float _6102 = _6048;
    float _6104 = _5582;
    if (!_6076)
    {
        _6094 = _6074;
    }
    float _6106 = _6094;
    float _6108 = _6106;
    float _6110 = _6106;
    if (!_6076)
    {
        _6096 = _6080;
    }
    float _6112 = _6096;
    float _6114 = _6112;
    float _6116 = _6112;
    if (!_6076)
    {
        _6098 = _6084;
    }
    float _6118 = _6098;
    bool _6120 = !_6076;
    float _6122 = _6118;
    float _6124 = _6118;
    if (!_6120)
    {
        bool _6126 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _6128 = _6068;
        if (_6126)
        {
            float _6130 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _6128 = _6130;
        }
        float _6132 = _6128;
        float _6134 = _6132;
        if (_6126)
        {
            float _6136 = _513 * _6132;
            _6100 = _6136;
        }
        float _6138 = _6100;
        float _6140 = _6138;
        if (_6126)
        {
            float _6142 = _515 * _6132;
            _6102 = _6142;
        }
        float _6144 = _6102;
        float _6146 = _6144;
        if (_6126)
        {
            float _6148 = _517 * _6132;
            _6134 = _6148;
        }
        float _6150 = _6134;
        float _6152 = _6150;
        float _6154 = _6150;
        if (!_6126)
        {
            bool _6156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _6158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _6160 = _6156 || _6158;
            bool _6162 = isnan(1.0);
            bool _6164 = _6160 || _6162;
            float _6166 = _159 + 1.0;
            float _6168 = _6166;
            if (!_6164)
            {
                float _6170 = _6166 * _6166;
                float _6172 = _6170 * 0.5;
                _6152 = _6172;
            }
            float _6174 = _6152;
            float _6176 = _6174;
            if (!_6164)
            {
                float _6178 = _6174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _6176 = _6178;
            }
            float _6180 = _6176;
            bool _6182 = !_6164;
            float _6184 = _6180;
            if (!_6182)
            {
                float _6186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6188 = log2(_6186);
                float _6190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6192 = _6188 * _6166;
                float _6194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _6196 = 1.0 + _6194;
                float _6198 = 1.0 / _6196;
                float _6200 = _6190 * 0.693147182464599609375;
                float _6202 = exp2(_6192);
                float _6204 = 1.0 / _6200;
                float _6206 = _6202 + (-1.0);
                float _6208 = -_6206;
                float _6210 = fma(_6208, _6204, _6166);
                float _6212 = _6210 * _6198;
                float _6214 = _6212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _6184 = _6214;
            }
            float _6216 = _6184;
            float _6218 = _6216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _6220 = _6216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _6222 = !_6164;
            if (!_6222)
            {
                float _6224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6226 = log2(_6224);
                float _6228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _6230 = 1.0 + _6228;
                float _6232 = 1.0 / _6230;
                float _6234 = _6226 * _6166;
                float _6236 = exp2(_6234);
                float _6238 = -_6236;
                float _6240 = _6238 + 1.0;
                float _6242 = _6240 * _6232;
                _6168 = _6242;
            }
            float _6244 = _6168;
            float _6246 = fma(_6244, _211, _6220);
            float _6248 = _6216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _6250 = fma(_6244, _209, _6218);
            float _6252 = -_433;
            float _6254 = _6252 + _6246;
            float _6256 = fma(_6244, _213, _6248);
            float _6258 = -_441;
            float _6260 = _6258 + _6250;
            float _6262 = _6254 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _6264 = _6254 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _6266 = -_449;
            float _6268 = _6266 + _6256;
            float _6270 = fma(_6260, (*spvDescriptorSet0.vp_c10)._m0[14].y, _6262);
            float _6272 = fma(_6260, (*spvDescriptorSet0.vp_c10)._m0[14].x, _6264);
            float _6274 = _6254 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _6276 = _6254 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _6278 = fma(_6268, (*spvDescriptorSet0.vp_c10)._m0[16].y, _6270);
            float _6280 = fma(_6268, (*spvDescriptorSet0.vp_c10)._m0[16].x, _6272);
            float _6282 = fma(_6260, (*spvDescriptorSet0.vp_c10)._m0[14].z, _6274);
            float _6284 = fma(_6260, (*spvDescriptorSet0.vp_c10)._m0[14].w, _6276);
            float _6286 = _437 * _6278;
            float _6288 = _199 * _6280;
            float _6290 = fma(_6268, (*spvDescriptorSet0.vp_c10)._m0[16].z, _6282);
            float _6292 = fma(_6268, (*spvDescriptorSet0.vp_c10)._m0[16].w, _6284);
            float _6294 = _6286 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _6296 = _6286 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _6298 = _6286 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _6300 = _457 * _6290;
            float _6302 = fma(_6288, (*spvDescriptorSet0.vp_c8)._m0[24].x, _6294);
            float _6304 = fma(_6288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _6296);
            float _6306 = fma(_6288, (*spvDescriptorSet0.vp_c8)._m0[26].x, _6298);
            float _6308 = fma(_6300, (*spvDescriptorSet0.vp_c8)._m0[24].z, _6302);
            float _6310 = fma(_6300, (*spvDescriptorSet0.vp_c8)._m0[25].z, _6304);
            float _6312 = fma(_6300, (*spvDescriptorSet0.vp_c8)._m0[26].z, _6306);
            float _6314 = fma(_6292, (*spvDescriptorSet0.vp_c8)._m0[24].w, _6308);
            float _6316 = fma(_6292, (*spvDescriptorSet0.vp_c8)._m0[25].w, _6310);
            float _6318 = fma(_6292, (*spvDescriptorSet0.vp_c8)._m0[26].w, _6312);
            _521 = _6316;
            _523 = _6314;
            _525 = _6318;
            _6140 = _6314;
            _6146 = _6316;
            _6154 = _6318;
            _6122 = _6248;
            _6114 = _6310;
        }
        float _6320 = _521;
        float _6322 = _523;
        float _6324 = _525;
        float _6326 = _6140;
        float _6328 = _6146;
        float _6330 = _6154;
        float _6332 = _6122;
        float _6334 = _6114;
        float _6336 = _6320 * _6320;
        float _6338 = rsqrt(_6028);
        float _6340 = fma(_6322, _6322, _6336);
        float _6342 = fma(_6324, _6324, _6340);
        float _6344 = sqrt(_6342);
        float _6346 = _6004 * _6338;
        float _6348 = _5990 * _6338;
        float _6350 = _6016 * _6338;
        bool _6352 = _6344 > 0.0;
        float _6354 = _6334;
        float _6356 = _6332;
        if (!_6352)
        {
            _6108 = _6074;
        }
        float _6358 = _6108;
        _6110 = _6358;
        if (!_6352)
        {
            _6354 = _6080;
        }
        float _6360 = _6354;
        _6116 = _6360;
        if (!_6352)
        {
            _6356 = _6084;
        }
        float _6362 = _6356;
        bool _6364 = !_6352;
        _6124 = _6362;
        if (!_6364)
        {
            float _6366 = rsqrt(_6342);
            float _6368 = _6366 * _6320;
            float _6370 = _6366 * _6322;
            float _6372 = _6366 * _6324;
            float _6374 = _6348 * _6368;
            float _6376 = fma(_6346, _6370, _6374);
            float _6378 = fma(_6350, _6372, _6376);
            float _6380 = _6378 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6382 = fma(_6326, _6380, _6074);
            float _6384 = fma(_6328, _6380, _6080);
            float _6386 = fma(_6330, _6380, _6084);
            _6124 = _6386;
            _6116 = _6384;
            _6110 = _6382;
        }
    }
    float _6388 = _6124;
    float _6390 = _6116;
    float _6392 = _6110;
    float _6394 = fma(_6088, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6396 = fma(_5886, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6398 = floor(_6394);
    float _6400 = floor(_6396);
    float _6402 = -_6398;
    float _6404 = _6394 + _6402;
    float _6406 = -_6400;
    float _6408 = _6396 + _6406;
    float2 _17130 = float2(_6404, _6408);
    float _6410 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_17130, float2(0.0), isnan(_17130)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_17130, float2(0.0), isnan(_17130)), level(0.0)).x;
    float _6412 = _6092 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _6414 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _6416 = fma(_6088, (*spvDescriptorSet0.vp_c8)._m0[11].x, _6412);
    bool _6418 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _6420 = isnan(0.5);
    bool _6422 = _6418 || _6420;
    bool _6424 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _6426 = _6422 || _6424;
    float _6428 = _6092 + _6414;
    float _6430 = fma(_5886, (*spvDescriptorSet0.vp_c8)._m0[11].z, _6416);
    float _6432 = _6092 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6434 = _6430 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6436 = fma(_6088, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6432);
    float _6438 = 1.0 / _6434;
    float _6440 = fma(_5886, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6436);
    float _6442 = _6440 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6444 = _6442 + _6434;
    float _6446 = _6444 * _6438;
    float _6448 = _6446 * 0.5;
    float _6450 = _6428 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _6452 = _6438;
    int _6454 = 2;
    if (_6426)
    {
        _6452 = _6388;
    }
    float _6456 = _6452;
    float _6458 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6460 = fma(_6448, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6458);
    float _6462 = fma(_6088, (*spvDescriptorSet0.vp_c15)._m0[126].x, _6450);
    float _6464 = fma(_5886, (*spvDescriptorSet0.vp_c15)._m0[126].z, _6462);
    float _6466 = 1.0 / _6460;
    float _6468 = _6464 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _6470 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6472 = _6466 * _6470;
    float _6474 = _6428 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _6476 = _6472 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _6478 = fma(_6088, (*spvDescriptorSet0.vp_c15)._m0[127].x, _6474);
    bool _6480 = _6472 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _6482 = !_6476;
    int _6484 = _6482 ? 0 : 1;
    float _6486 = fma(_5886, (*spvDescriptorSet0.vp_c15)._m0[127].z, _6478);
    float _6488 = _6486 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _6490 = _6456;
    if (!_6476)
    {
        _6454 = 1;
    }
    int _6492 = _6454;
    float _6494 = trunc(_6488);
    int _6496 = int(_6494);
    int _6498 = _6492;
    if (!_6480)
    {
        _6498 = _6484;
    }
    int _6500 = _6498;
    int _6502 = _6500 << 6;
    float _6504 = trunc(_6468);
    int _6506 = int(_6504);
    int _6508 = _6502 + 48;
    uint _6510 = uint(int(uint(_6508) >> uint(2)));
    uint _6512 = uint(int(uint(int(_6510)) >> uint(2)));
    int _6514 = int(_6510) & 3;
    float _6516 = (*spvDescriptorSet0.vp_c15)._m0[int(_6512)][_6514];
    int _6518 = int(_6510) + 1;
    uint _6520 = uint(int(uint(_6518) >> uint(2)));
    int _6522 = _6518 & 3;
    float _6524 = (*spvDescriptorSet0.vp_c15)._m0[int(_6520)][_6522];
    int _6526 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _6528 = _6496 + _6526;
    int _6530 = _6528 + 1;
    int _6532 = _6502 + 56;
    uint _6534 = uint(int(uint(_6532) >> uint(2)));
    uint _6536 = uint(int(uint(int(_6534)) >> uint(2)));
    int _6538 = int(_6534) & 3;
    float _6540 = (*spvDescriptorSet0.vp_c15)._m0[int(_6536)][_6538];
    int _6542 = int(_6534) + 1;
    uint _6544 = uint(int(uint(_6542) >> uint(2)));
    int _6546 = _6542 & 3;
    float _6548 = (*spvDescriptorSet0.vp_c15)._m0[int(_6544)][_6546];
    float _6550 = as_type<float>(_6496);
    float _6552 = as_type<float>(_6500);
    if (_6426)
    {
        _6550 = _6390;
    }
    float _6554 = _6550;
    int _6556 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _6558 = _6506 + _6556;
    int _6560 = _6558 + 1;
    int _6562 = _6502 + 64;
    uint _6564 = uint(int(uint(_6562) >> uint(2)));
    uint _6566 = uint(int(uint(int(_6564)) >> uint(2)));
    int _6568 = int(_6564) & 3;
    float _6570 = (*spvDescriptorSet0.vp_c15)._m0[int(_6566)][_6568];
    int _6572 = int(_6564) + 1;
    uint _6574 = uint(int(uint(_6572) >> uint(2)));
    int _6576 = _6572 & 3;
    float _6578 = (*spvDescriptorSet0.vp_c15)._m0[int(_6574)][_6576];
    bool _6580 = _6560 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _6582 = _6560 | _6530;
    int _6584 = _6502 + 72;
    uint _6586 = uint(int(uint(_6584) >> uint(2)));
    uint _6588 = uint(int(uint(int(_6586)) >> uint(2)));
    int _6590 = int(_6586) & 3;
    float _6592 = (*spvDescriptorSet0.vp_c15)._m0[int(_6588)][_6590];
    int _6594 = int(_6586) + 1;
    uint _6596 = uint(int(uint(_6594) >> uint(2)));
    int _6598 = _6594 & 3;
    float _6600 = (*spvDescriptorSet0.vp_c15)._m0[int(_6596)][_6598];
    bool _6602 = _6582 < 0;
    bool _6604 = _6602 || _6580;
    float _6606 = as_type<float>(_6582);
    float _6608 = _6554;
    int _6610 = _6560;
    if (_6426)
    {
        _6606 = _6392;
    }
    float _6612 = _6606;
    bool _6614 = _6530 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _6616 = _6614 || _6604;
    int _6618 = _6502 + 96;
    uint _6620 = uint(int(uint(_6618) >> uint(2)));
    uint _6622 = uint(int(uint(int(_6620)) >> uint(2)));
    int _6624 = int(_6620) & 3;
    float _6626 = (*spvDescriptorSet0.vp_c15)._m0[int(_6622)][_6624];
    int _6628 = int(_6620) + 1;
    uint _6630 = uint(int(uint(_6628) >> uint(2)));
    int _6632 = _6628 & 3;
    float _6634 = (*spvDescriptorSet0.vp_c15)._m0[int(_6630)][_6632];
    int _6636 = _6502 + 104;
    uint _6638 = uint(int(uint(_6636) >> uint(2)));
    uint _6640 = uint(int(uint(int(_6638)) >> uint(2)));
    int _6642 = int(_6638) & 3;
    float _6644 = (*spvDescriptorSet0.vp_c15)._m0[int(_6640)][_6642];
    int _6646 = int(_6638) + 1;
    uint _6648 = uint(int(uint(_6646) >> uint(2)));
    int _6650 = _6646 & 3;
    float _6652 = (*spvDescriptorSet0.vp_c15)._m0[int(_6648)][_6650];
    float _6654 = _6612;
    int _6656 = as_type<int>(_6524);
    int _6658 = as_type<int>(_6516);
    if (!_6426)
    {
        float _6660 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _6662 = _6092 + _6660;
        float _6664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _6666 = _6088 + _6664;
        float _6668 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6670 = -_6088;
        float _6672 = _6670 + _6392;
        float _6674 = _6662 * _6662;
        float _6676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _6678 = _5886 + _6676;
        float _6680 = -_6092;
        float _6682 = _6680 + _6390;
        float _6684 = -_5886;
        float _6686 = _6684 + _6388;
        float _6688 = fma(_6666, _6666, _6674);
        float _6690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6692 = fma(_6678, _6678, _6688);
        float _6694 = sqrt(_6692);
        float _6696 = _6668 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6698 = precise::min(_6694, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6700 = _6698 * _6690;
        float _6702 = _6696 * _6700;
        float _6704 = fma(_6672, _6702, _6088);
        float _6706 = fma(_6682, _6702, _6092);
        float _6708 = fma(_6686, _6702, _5886);
        _6608 = _6706;
        _6654 = _6704;
        _6490 = _6708;
    }
    float _6710 = _6608;
    float _6712 = _6654;
    float _6714 = _6490;
    float _6716 = _6428 * _6634;
    if (!_6616)
    {
        int _6718 = _6530 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _6720 = _6718 + _6560;
        _6610 = _6720;
    }
    int _6722 = _6610;
    float _6724 = _6710 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6726 = _6428 * _6578;
    float _6728 = fma(_6088, _6626, _6716);
    float _6730 = _6428 * _6524;
    float _6732 = fma(_6712, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6724);
    if (!_6616)
    {
        int _6734 = _6722 << 2;
        _6656 = _6734;
    }
    int _6736 = _6656;
    float _6738 = fma(_5886, _6644, _6728);
    float _6740 = fma(_6088, _6516, _6730);
    int _6742 = _6502 + 80;
    uint _6744 = uint(int(uint(_6742) >> uint(2)));
    uint _6746 = uint(int(uint(int(_6744)) >> uint(2)));
    int _6748 = int(_6744) & 3;
    float _6750 = (*spvDescriptorSet0.vp_c15)._m0[int(_6746)][_6748];
    int _6752 = int(_6744) + 1;
    uint _6754 = uint(int(uint(_6752) >> uint(2)));
    int _6756 = _6752 & 3;
    float _6758 = (*spvDescriptorSet0.vp_c15)._m0[int(_6754)][_6756];
    float _6760 = fma(_6714, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6732);
    float _6762 = _6738 + _6652;
    int _6764 = _6736;
    if (!_6616)
    {
        uint _6766 = uint(int(uint(_6722) >> uint(2)));
        _6658 = int(_6766);
    }
    int _6768 = _6658;
    float _6770 = fma(_6088, _6570, _6726);
    int _6772 = _6768;
    if (!_6616)
    {
        int _6774 = 12 & _6736;
        _6764 = _6774;
    }
    int _6776 = _6764;
    float _6778 = 1.0 / _6762;
    float _6780 = fma(_5886, _6540, _6740);
    int _6782 = _6502 + 88;
    uint _6784 = uint(int(uint(_6782) >> uint(2)));
    uint _6786 = uint(int(uint(int(_6784)) >> uint(2)));
    int _6788 = int(_6784) & 3;
    float _6790 = (*spvDescriptorSet0.vp_c15)._m0[int(_6786)][_6788];
    int _6792 = int(_6784) + 1;
    uint _6794 = uint(int(uint(_6792) >> uint(2)));
    int _6796 = _6792 & 3;
    float _6798 = (*spvDescriptorSet0.vp_c15)._m0[int(_6794)][_6796];
    if (!_6616)
    {
        int _6800 = _6768 << 4;
        int _6802 = _6800 + _6776;
        _6772 = _6802;
    }
    int _6804 = _6772;
    float _6806 = _6710 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6808 = fma(_5886, _6592, _6770);
    float _6810 = _6710 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6812 = _6780 + _6548;
    float _6814 = fma(_6712, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6806);
    float _6816 = _6808 + _6600;
    float _6818 = _6644;
    if (!_6616)
    {
        int _6820 = _6804 + 400;
        uint _6822 = uint(int(uint(_6820) >> uint(2)));
        uint _6824 = uint(int(uint(int(_6822)) >> uint(2)));
        int _6826 = int(_6822) & 3;
        float _6828 = (*spvDescriptorSet0.vp_c15)._m0[int(_6824)][_6826];
        _6818 = _6828;
    }
    float _6830 = _6818;
    float _6832 = fma(_6712, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6810);
    float _6834 = fma(_6714, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6814);
    float _6836 = _6710 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6838 = _6760 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6840 = fma(_6714, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6832);
    float _6842 = _6812 * _6778;
    float _6844 = _6834 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6846 = _6816 * _6778;
    float _6848 = fma(_6712, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6836);
    float _6850 = _6840 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6852 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _6854 = _6842 >= 0.0;
    float _6856 = fma(_6714, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6848);
    float _6858 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _6860 = fma(_6850, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6852);
    bool _6862 = _6842 <= 1.0;
    bool _6864 = _6862 && _6854;
    float _6866 = _6856 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6868 = _6838 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6870 = fma(_6838, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6860);
    bool _6872 = _6846 >= 0.0;
    bool _6874 = _6872 && _6864;
    float _6876 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6878 = -_6868;
    float _6880 = fma(_6878, _6858, 1.0);
    float _6882 = fma(_6866, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6870);
    bool _6884 = _6846 <= 1.0;
    bool _6886 = _6884 && _6874;
    float _6888 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6890 = fma(_6850, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6876);
    float _6892 = 1.0 / _6882;
    float _6894 = fma(_6850, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6888);
    float _6896 = _6428 * _6758;
    float _6898 = fma(_6838, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6894);
    float _6900 = log2(_6880);
    float _6902 = fma(_6088, _6750, _6896);
    float _6904 = fma(_6838, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6890);
    float _6906 = _6778;
    float _6908 = _6866;
    float _6910 = _6882;
    if (_6886)
    {
        float _6912 = float(_6500);
        _6552 = _6912;
    }
    float _6914 = _6552;
    float _6916 = fma(_6866, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6898);
    float _6918 = fma(_5886, _6790, _6902);
    float _6920 = fma(_6866, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6904);
    float _6922 = _6880;
    float _6924 = _6914;
    if (!_6616)
    {
        float _6926 = floor(_6488);
        _6922 = _6926;
    }
    float _6928 = _6922;
    float _6930 = _6918 + _6798;
    float _6932 = _6916 * _6892;
    float _6934 = _6920 * _6892;
    float _6936 = _6930 * _6778;
    float _6938 = fma(_6934, -0.5, 0.5);
    float _6940 = _6868;
    if (!_6616)
    {
        float _6942 = floor(_6468);
        _6940 = _6942;
    }
    float _6944 = _6940;
    float _6946 = _6900 * 0.693147182464599609375;
    float _6948 = _6946 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6950 = _6876;
    float _6952 = _6948;
    if (_6886)
    {
        float _6954 = rint(_6914);
        float _6956 = precise::max(_6954, 0.0);
        uint _6958 = uint(_6956);
        uint _6960 = clamp(_6958, 0u, 65535u);
        _6950 = as_type<float>(_6960);
    }
    float _6962 = _6950;
    float _6964 = _6928;
    if (!_6616)
    {
        float _6966 = -_6928;
        float _6968 = _6488 + _6966;
        _6964 = _6968;
    }
    float _6970 = _6964;
    float _6972 = fma(_6932, 0.5, 0.5);
    float _6974 = _6892;
    if (!_6616)
    {
        float _6976 = rint(_6830);
        float _6978 = precise::max(_6976, 0.0);
        uint _6980 = uint(_6978);
        uint _6982 = clamp(_6980, 0u, 65535u);
        _6974 = as_type<float>(_6982);
    }
    float _6984 = _6974;
    float _6986 = _6944;
    if (!_6616)
    {
        float _6988 = -_6944;
        float _6990 = _6468 + _6988;
        _6906 = _6990;
    }
    float _6992 = _6906;
    float _6994 = _6846;
    if (_6886)
    {
        float3 _18116 = float3(_6842, _6846, float(as_type<int>(_6962)));
        float3 _18120 = select(_18116, float3(0.0), isnan(_18116));
        float _6996 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _18120.xy, uint(rint(_18120.z)), _6936, level(0.0));
        _6994 = _6996;
    }
    float _6998 = _6994;
    float3 _18130 = float3(_6972, _6938, _6948);
    float _7000 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_18130, float3(0.0), isnan(_18130)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_18130, float3(0.0), isnan(_18130)), level(0.0)).x;
    float3 _18139 = float3(_6972, _6938, _6948);
    float4 _7003 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_18139, float3(0.0), isnan(_18139)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_18139, float3(0.0), isnan(_18139)), level(0.0)).xyzw;
    float _7005 = _7003.x;
    float _7007 = _7003.y;
    float _7009 = _7003.z;
    float _7011 = _7003.w;
    float _7013 = _6970;
    float _7015 = _6984;
    if (!_6616)
    {
        float3 _18163 = float3(_6992, _6970, float(as_type<int>(_6984)));
        float3 _18165 = select(_18163, float3(0.0), isnan(_18163));
        float _7017 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _18165.xy, uint(rint(_18165.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _18165.xy, uint(rint(_18165.z)), level(0.0)).x;
        _7013 = _7017;
    }
    float _7019 = _7013;
    if (_6616)
    {
        _6924 = 1.0;
    }
    float _7021 = _6924;
    float _7023 = _7021;
    if (!_6616)
    {
        int _7025 = _6722 << 4;
        int _7027 = _7025 + 2048;
        uint _7029 = uint(int(uint(_7027) >> uint(2)));
        uint _7031 = uint(int(uint(int(_7029)) >> uint(2)));
        int _7033 = int(_7029) & 3;
        float _7035 = (*spvDescriptorSet0.vp_c15)._m0[int(_7031)][_7033];
        int _7037 = int(_7029) + 1;
        uint _7039 = uint(int(uint(_7037) >> uint(2)));
        int _7041 = _7037 & 3;
        float _7043 = (*spvDescriptorSet0.vp_c15)._m0[int(_7039)][_7041];
        int _7045 = _7027 + 8;
        uint _7047 = uint(int(uint(_7045) >> uint(2)));
        uint _7049 = uint(int(uint(int(_7047)) >> uint(2)));
        int _7051 = int(_7047) & 3;
        float _7053 = (*spvDescriptorSet0.vp_c15)._m0[int(_7049)][_7051];
        int _7055 = int(_7047) + 1;
        uint _7057 = uint(int(uint(_7055) >> uint(2)));
        int _7059 = _7055 & 3;
        float _7061 = (*spvDescriptorSet0.vp_c15)._m0[int(_7057)][_7059];
        float _7063 = _6428 * _7043;
        float _7065 = fma(_6088, _7035, _7063);
        float _7067 = fma(_5886, _7053, _7065);
        float _7069 = _7067 + _7061;
        float _7071 = precise::clamp(_7069, 0.0, 1.0);
        float _7073 = -_7071;
        float _7075 = _7073 + _7019;
        float _7077 = fma(_7075, 500.0, 1.5);
        float _7079 = exp2(_7077);
        float _7081 = 0.0 + _7079;
        float _7083 = precise::clamp(_7081, 0.0, 1.0);
        _7015 = _7053;
        _7023 = _7083;
    }
    float _7085 = _7015;
    float _7087 = _7023;
    float _7089 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _7091 = _6710 + _7089;
    float _7093 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _7095 = _6712 + _7093;
    float _7097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _7099 = _6714 + _7097;
    float _7101 = _7091 * _7091;
    float _7103 = fma(_7095, _7095, _7101);
    float _7105 = fma(_7099, _7099, _7103);
    float _7107 = rsqrt(_7105);
    float _7109 = _7107 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _7111 = _7095 * _7109;
    float _7113 = _7099 * _7109;
    float _7115 = _7111 * _7111;
    float _7117 = _7113 * _7113;
    float _7119 = _7115 + _7117;
    float _7121 = sqrt(_7119);
    bool _7123 = _7121 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _7125 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _7127 = _7121 + _7125;
    float _7129 = _7107;
    float _7131 = _7127;
    float _7133 = _7091;
    float _7135 = _7085;
    if (_7123)
    {
        float _7137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _7129 = _7137;
    }
    float _7139 = _7129;
    if (_7123)
    {
        float _7141 = rsqrt(_7119);
        _6986 = _7141;
    }
    float _7143 = _6986;
    float _7145 = _7143;
    if (_7123)
    {
        float _7147 = _7127 * _7139;
        _7131 = _7147;
    }
    float _7149 = _7131;
    float _7151 = sqrt(_7105);
    if (_7123)
    {
        float _7153 = _7149 * 0.15915493667125701904296875;
        _6952 = _7153;
    }
    float _7155 = _6952;
    float _7157 = _7099;
    if (_7123)
    {
        float _7159 = _7155 * 6.283185482025146484375;
        float _7161 = sin(_7159);
        _7157 = _7161;
    }
    float _7163 = _7157;
    float _7165 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _7167 = precise::max(0.0, _7165);
    float _7169 = _7139;
    float _7171 = _7167;
    if (_7123)
    {
        float _7173 = _7155 * 6.283185482025146484375;
        float _7175 = cos(_7173);
        _7169 = _7175;
    }
    float _7177 = _7169;
    float _7179 = -_7109;
    float _7181 = -_7167;
    float _7183 = fma(_7091, _7179, _7181);
    if (_7123)
    {
        float _7185 = _7183 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _7133 = _7185;
    }
    float _7187 = _7133;
    float _7189 = _7187;
    float _7191 = _7163;
    if (_7123)
    {
        float _7193 = fma(_7163, _7187, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _7189 = _7193;
    }
    float _7195 = _7189;
    float _7197 = _7195;
    if (!_7123)
    {
        _7191 = _7111;
    }
    float _7199 = _7191;
    float _7201 = _7199;
    if (_7123)
    {
        float _7203 = _7143 * _7195;
        _6104 = _7203;
    }
    float _7205 = _6104;
    float _7207 = _7177;
    if (_7123)
    {
        float _7209 = _7177 + (-1.0);
        _7171 = _7209;
    }
    float _7211 = _7171;
    float _7213 = _7211;
    if (!_7123)
    {
        _7197 = _7183;
    }
    float _7215 = _7197;
    float _7217 = _7215;
    if (_7123)
    {
        float _7219 = _7111 * _7205;
        _7201 = _7219;
    }
    float _7221 = _7201;
    if (_7123)
    {
        float _7223 = _7211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _7135 = _7223;
    }
    float _7225 = _7135;
    float _7227 = _7225;
    if (!_7123)
    {
        _7213 = _7113;
    }
    float _7229 = _7213;
    float _7231 = _7229;
    if (_7123)
    {
        float _7233 = _7113 * _7205;
        _7231 = _7233;
    }
    float _7235 = _7231;
    if (!_7123)
    {
        _7145 = _7115;
    }
    float _7237 = _7145;
    float _7239 = _7237;
    if (_7123)
    {
        float _7241 = fma(_7183, _7177, _7225);
        _7217 = _7241;
    }
    float _7243 = _7217;
    if (_7123)
    {
        float _7245 = _7221 * _7221;
        _7239 = _7245;
    }
    float _7247 = _7239;
    if (!_7123)
    {
        _7207 = _7117;
    }
    float _7249 = _7207;
    float _7251 = _7249;
    if (_7123)
    {
        float _7253 = _7235 * _7235;
        _7251 = _7253;
    }
    float _7255 = _7251;
    float _7257 = fma(_7243, _7243, _7247);
    float _7259 = _7257 + _7255;
    float _7261 = rsqrt(_7259);
    float _7263 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _7265 = fma(_7151, (*spvDescriptorSet0.vp_c15)._m0[23].w, _7263);
    float _7267 = precise::clamp(_7265, 0.0, 1.0);
    float _7269 = -_7267;
    float _7271 = _7269 + 1.0;
    float _7273 = abs(_7271);
    float _7275 = log2(_7273);
    float _7277 = _7261 * _7221;
    float _7279 = _7261 * _7243;
    float _7281 = _7261 * _7235;
    float _7283 = _7277 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _7285 = -_7283;
    float _7287 = fma(_7279, (*spvDescriptorSet0.vp_c15)._m0[21].y, _7285);
    float _7289 = -_7281;
    float _7291 = fma(_7289, (*spvDescriptorSet0.vp_c15)._m0[21].z, _7287);
    float _7293 = _7275 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _7295 = fma(_7291, -0.5, 0.5);
    float _7297 = fma(_7291, 0.5, 0.5);
    float _7299 = exp2(_7293);
    float _7301 = fma(_7297, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _7303 = fma(_7297, _7301, -0.212114393711090087890625);
    float _7305 = _7279 + 1.0;
    float _7307 = sqrt(_7295);
    float _7309 = fma(_7297, _7303, 1.570728778839111328125);
    float _7311 = -_7279;
    float _7313 = fma(_7299, _7305, _7311);
    float _7315 = fma(_7313, 0.5, 0.5);
    float _7317 = _7307 * 0.636619746685028076171875;
    float _7319 = -_7309;
    float _7321 = fma(_7317, _7319, 1.0);
    float2 _18636 = float2(_7321, _7315);
    float3 _7325 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_18636, float2(0.0), isnan(_18636)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_18636, float2(0.0), isnan(_18636)), level(0.0)).xyz;
    float _7327 = _7325.x;
    float _7329 = _7325.y;
    float _7331 = _7325.z;
    float _7333 = abs(_6472);
    float _7335 = log2(_7333);
    float _7337 = _7275 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _7339 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _7341 = isnan(0.5);
    bool _7343 = _7339 || _7341;
    bool _7345 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _7347 = _7343 || _7345;
    float _7349 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _7351 = -_6410;
    float _7353 = _7351 + 1.0;
    out.m_96.x = _6088;
    out.m_96.y = _6092;
    out.m_96.z = _5886;
    float _7355 = exp2(_7337);
    float _7357 = fma(_6850, (*spvDescriptorSet0.vp_c8)._m0[6].x, _7349);
    out.m_98.x = _6712;
    out.m_98.y = _6710;
    out.m_98.z = _6714;
    float _7359 = fma(_6838, (*spvDescriptorSet0.vp_c8)._m0[6].z, _7357);
    float _7361 = _7335 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _7363 = fma(_6866, (*spvDescriptorSet0.vp_c8)._m0[6].w, _7359);
    float _7365 = _7357;
    float _7367 = _7363;
    if (!_7347)
    {
        _7227 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _7369 = _7227;
    if (!_7347)
    {
        float _7371 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7373 = _6472 + _7371;
        _6908 = _7373;
    }
    float _7375 = _6908;
    if (_7347)
    {
        _7365 = 1.0;
    }
    float _7377 = _7365;
    float _7379 = exp2(_7361);
    out.gl_Position.x = _6916;
    out.gl_Position.y = _6920;
    out.gl_Position.z = _7363;
    out.gl_Position.w = _6882;
    float _7381 = -_7355;
    float _7383 = _7381 + 1.0;
    float _7385 = _7363 + _6882;
    float _7387 = _7385 * 0.5;
    float _7389 = fma(_7379, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _7391 = precise::clamp(_7389, 0.0, 1.0);
    bool _7393 = _6472 <= 8000.0;
    bool _7395 = isnan(_6472);
    bool _7397 = _7393 || _7395;
    bool _7399 = isnan(8000.0);
    bool _7401 = _7397 || _7399;
    float _7403 = float(_7401);
    float _7405 = _6916 + _6882;
    float _7407 = fma(_7391, -2.0, 3.0);
    float _7409 = _7391 * _7391;
    float _7411 = _7409 * _7407;
    float _7413 = _7409;
    float _7415 = _7405;
    float _7417 = _7377;
    if (!_7347)
    {
        float _7419 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7421 = _7369 + _7419;
        _7413 = _7421;
    }
    float _7423 = _7413;
    float _7425 = _7405 * 0.5;
    if (!_6886)
    {
        _7415 = 1.0;
    }
    float _7427 = _7415;
    float _7429 = -_7411;
    float _7431 = _7429 + 1.0;
    float _7433 = _7427;
    if (_6886)
    {
        bool _7435 = _6998 >= _6936;
        bool _7437 = isnan(_6998);
        bool _7439 = _7435 || _7437;
        bool _7441 = isnan(_6936);
        bool _7443 = _7439 || _7441;
        float _7445 = float(_7443);
        _7433 = _7445;
    }
    float _7447 = _7433;
    float _7449 = _7383 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _7451 = _7423;
    if (!_7347)
    {
        float _7453 = 1.0 / _7423;
        _7451 = _7453;
    }
    float _7455 = _7451;
    float _7457 = fma(_7431, (*spvDescriptorSet0.vp_c15)._m0[654].w, _7411);
    float _7459 = _6882 * 0.5;
    float _7461 = _7447 * _7087;
    float _7463 = -_7449;
    float _7465 = _7463 + 1.0;
    float _7467 = _7403 * _7457;
    float _7469 = fma(_6920, -0.5, _7459);
    bool _7471 = _7151 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _7473 = isnan(_7151);
    bool _7475 = _7471 || _7473;
    bool _7477 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _7479 = _7475 || _7477;
    float _7481 = _7467 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _7483 = _7011 * _7465;
    out.m_100.x = _7425;
    out.m_100.y = _7469;
    out.m_100.z = _7387;
    out.m_100.w = _6882;
    float _7485 = _7353 * _7481;
    float _7487 = precise::clamp(_7485, 0.0, 1.0);
    float _7489 = _7449 * _7000;
    float _7491 = _7461;
    float _7493 = _7465;
    if (!_7347)
    {
        float _7495 = _7375 * _7455;
        float _7497 = precise::clamp(_7495, 0.0, 1.0);
        _7417 = _7497;
    }
    float _7499 = _7417;
    float _7501 = -_7487;
    float _7503 = fma(_7501, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7505 = _7011 * _7489;
    float _7507 = _7505;
    if (!_7479)
    {
        _6910 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _7509 = _6910;
    float _7511 = -_7461;
    float _7513 = fma(_7511, _7503, 1.0);
    float _7515 = precise::clamp(_7513, 0.0, 1.0);
    float _7517 = _7515;
    float _7519 = _7509;
    float _7521 = _7509;
    if (!_7479)
    {
        _7491 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _7523 = _7491;
    float _7525 = _7523;
    float _7527 = _7523;
    if (!_7479)
    {
        _7367 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _7529 = _7367;
    float _7531 = _7515 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7533 = _7529;
    float _7535 = _7529;
    if (!_7479)
    {
        _7493 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _7537 = _7493;
    float _7539 = _7537;
    float _7541 = _7537;
    if (!_7479)
    {
        _7517 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7543 = _7517;
    out.m_102.x = _7531;
    float _7545 = _7331 * _7489;
    float _7547 = fma(_7327, _7505, _7005);
    float _7549 = fma(_7329, _7505, _7007);
    float _7551 = _7499 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _7553 = fma(_7011, _7545, _7009);
    float _7555 = _7543;
    float _7557 = _7543;
    if (!_7479)
    {
        _7507 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _7559 = _7507;
    out.m_104.x = _7547;
    out.m_104.y = _7549;
    out.m_104.z = _7553;
    out.m_104.w = _7483;
    bool _7561 = !_7479;
    float _7563 = _7559;
    float _7565 = _7559;
    if (!_7561)
    {
        bool _7567 = _7151 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7569 = isnan(_7151);
        bool _7571 = _7567 || _7569;
        bool _7573 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7575 = _7571 || _7573;
        if (!_7575)
        {
            float _7577 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7579 = _7151 + _7577;
            float _7581 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7583 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7581;
            float _7585 = 1.0 / _7583;
            float _7587 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7589 = _7587 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7591 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7593 = _7591 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7595 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7597 = _7595 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7599 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7601 = _7599 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7603 = _7579 * _7585;
            float _7605 = precise::clamp(_7603, 0.0, 1.0);
            float _7607 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7609 = _7607 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7611 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7613 = _7611 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7615 = fma(_7605, _7589, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7617 = fma(_7605, _7609, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7619 = fma(_7605, _7613, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7621 = fma(_7605, _7593, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7623 = fma(_7605, _7597, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7625 = fma(_7605, _7601, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _7541 = _7617;
            _7521 = _7623;
            _7565 = _7615;
            _7527 = _7621;
            _7557 = _7619;
            _7535 = _7625;
            _7627 = true;
        }
        else
        {
            bool _7629 = _7151 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7631 = isnan(_7151);
            bool _7633 = _7629 || _7631;
            bool _7635 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7637 = _7633 || _7635;
            if (!_7637)
            {
                _7525 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7639 = _7525;
            _7527 = _7639;
            if (!_7637)
            {
                _7519 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7641 = _7519;
            _7521 = _7641;
            if (!_7637)
            {
                _7533 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7643 = _7533;
            _7535 = _7643;
            if (!_7637)
            {
                _7563 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7645 = _7563;
            _7565 = _7645;
            if (!_7637)
            {
                _7539 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7647 = _7539;
            _7541 = _7647;
            if (!_7637)
            {
                _7555 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7649 = _7555;
            bool _7651 = !_7637;
            _7557 = _7649;
            if (!_7651)
            {
                bool _7653 = _7151 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7655 = isnan(_7151);
                bool _7657 = _7653 || _7655;
                bool _7659 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7661 = _7657 || _7659;
                if (!_7661)
                {
                    float _7663 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7665 = _7151 + _7663;
                    float _7667 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7669 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7667;
                    float _7671 = 1.0 / _7669;
                    float _7673 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7675 = _7673 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7677 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7679 = _7677 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7681 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7683 = _7681 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7685 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7687 = _7685 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7689 = _7665 * _7671;
                    float _7691 = precise::clamp(_7689, 0.0, 1.0);
                    float _7693 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7695 = _7693 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7697 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7699 = _7697 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7701 = fma(_7691, _7675, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7703 = fma(_7691, _7695, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7705 = fma(_7691, _7699, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7707 = fma(_7691, _7679, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7709 = fma(_7691, _7683, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7711 = fma(_7691, _7687, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _7541 = _7703;
                    _7521 = _7709;
                    _7565 = _7701;
                    _7527 = _7707;
                    _7557 = _7705;
                    _7535 = _7711;
                    _7627 = true;
                }
                else
                {
                    _7541 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _7521 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _7565 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _7527 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7557 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _7535 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7627 = false;
    float _7713 = _7541;
    float _7715 = _7521;
    float _7717 = _7565;
    float _7719 = _7527;
    float _7721 = _7557;
    float _7723 = _7535;
    float _7725 = fma(_6050, -0.5, 0.5);
    float _7727 = precise::clamp(_7725, 0.0, 1.0);
    float _7729 = -_7713;
    float _7731 = _7715 + _7729;
    float _7733 = _7551 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7735 = -_7717;
    float _7737 = _7719 + _7735;
    float _7739 = fma(_7727, _7731, _7713);
    out.m_106.x = 0.0;
    float _7741 = -_7721;
    float _7743 = _7723 + _7741;
    float _7745 = fma(_7727, _7737, _7717);
    float _7747 = _7739 * 0.586610972881317138671875;
    out.m_59.x = _7733;
    bool _7749 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7751 = fma(_7727, _7743, _7721);
    float _7753 = fma(_7745, 0.298911988735198974609375, _7747);
    bool _7755 = _7499 > 0.0;
    bool _7757 = isnan(_7499);
    bool _7759 = _7755 || _7757;
    bool _7761 = isnan(0.0);
    bool _7763 = _7759 || _7761;
    float _7765 = fma(_7751, 0.114477999508380889892578125, _7753);
    float _7767 = -_7765;
    float _7769 = _7745 + _7767;
    float _7771 = -_7765;
    float _7773 = _7739 + _7771;
    float _7775 = -_7765;
    float _7777 = _7751 + _7775;
    float _7779 = fma(_7769, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7765);
    float _7781 = fma(_7773, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7765);
    float _7783 = fma(_7777, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7765);
    bool _7785 = !_7749;
    if (!_7785)
    {
        float _7787 = -_6710;
        float _7789 = _7787 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7791 = -_6712;
        float _7793 = _7791 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7795 = -_6714;
        float _7797 = _7795 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7799 = _7789 * _7789;
        float _7801 = fma(_7793, _7793, _7799);
        float _7803 = fma(_7797, _7797, _7801);
        float _7805 = sqrt(_7803);
        float _7807 = rsqrt(_7803);
        float _7809 = -_7805;
        float _7811 = _7809 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7813 = _7811 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7815 = precise::clamp(_7813, 0.0, 1.0);
        float _7817 = _7793 * _7807;
        float _7819 = _7789 * _7807;
        float _7821 = abs(_7815);
        float _7823 = log2(_7821);
        float _7825 = _7797 * _7807;
        float _7827 = _7817 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7829 = _6050 * _7819;
        float _7831 = -_7819;
        float _7833 = -_7827;
        float _7835 = fma(_7831, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7833);
        float _7837 = fma(_6046, _7817, _7829);
        float _7839 = -_7825;
        float _7841 = fma(_7839, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7835);
        float _7843 = fma(_6054, _7825, _7837);
        float _7845 = precise::clamp(_7843, 0.0, 1.0);
        float _7847 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7849 = _7841 + _7847;
        float _7851 = _7823 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7853 = _7849 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7855 = precise::clamp(_7853, 0.0, 1.0);
        float _7857 = exp2(_7851);
        float _7859 = _7857 * _7855;
        float _7861 = _7845 * _7859;
        float _7863 = _7861 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7865 = _7861 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7867 = _7861 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _7863;
        out.m_106.y = _7865;
        out.m_106.z = _7867;
    }
    out.m_82.x = _7779;
    out.m_82.y = _7781;
    out.m_82.z = _7783;
    if (_7763)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _7869 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7869;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _7627 = false;
    bool _1421 = false;
    bool _1263 = false;
    bool _1121 = false;
    bool _839 = false;
    bool _545 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _7926 = as_type<float>(_141);
        out.gl_Position.z = _7926;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_61.w;
    bool _147 = _145 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_145);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = -_145;
    float _159 = _157 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_155)
    {
        float _161 = float(_125);
        _135 = _161;
    }
    float _163 = _135;
    bool _165 = _159 >= _163;
    bool _167 = !_155;
    bool _169 = _165 || _167;
    float _171 = _163;
    if (_169)
    {
        _171 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _173 = _171;
    if (_169)
    {
        out.m_59.x = 0.0;
    }
    if (_169)
    {
        float _175 = _173 * 5.0;
        _143 = as_type<int>(_175);
    }
    int _177 = _143;
    if (_169)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7995 = as_type<float>(_177);
        out.gl_Position.z = _7995;
    }
    if (_169)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_66.w;
    float _183 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _185 = in.m_56.x;
    float _187 = in.m_56.y;
    float _189 = in.m_56.z;
    float _191 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _183);
    float _193 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _191);
    float _197 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _193);
    float _199 = sqrt(_195);
    int _201 = as_type<int>(_179) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_179) & 2;
    bool _207 = _205 != 0;
    float _209 = in.m_61.x;
    float _211 = in.m_61.y;
    float _213 = in.m_61.z;
    bool _215 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _219 = _215 || _217;
    bool _221 = isnan(1.0);
    bool _223 = _219 || _221;
    bool _225 = !_203;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    bool _231 = !_207;
    float _233 = _231 ? (-0.5) : 0.5;
    float _235 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _229);
    float _237 = _159 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _239 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _197);
    float _241 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _235);
    float _243 = _235;
    float _245 = _195;
    float _247 = _197;
    float _249 = _237;
    bool _251 = _223;
    if (!_223)
    {
        float _253 = _237 * _237;
        float _255 = _253 * 0.5;
        _243 = _255;
    }
    float _257 = _243;
    float _259 = _257;
    if (!_223)
    {
        float _261 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _259 = _261;
    }
    float _263 = _259;
    bool _265 = !_223;
    float _267 = _263;
    if (!_265)
    {
        float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = log2(_269);
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = _237 * _271;
        float _281 = 1.0 / _275;
        float _283 = _277 * 0.693147182464599609375;
        float _285 = exp2(_279);
        float _287 = 1.0 / _283;
        float _289 = _285 + (-1.0);
        float _291 = -_289;
        float _293 = fma(_291, _287, _237);
        float _295 = _293 * _281;
        float _297 = _295 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _245 = _287;
        _267 = _297;
        _247 = _285;
    }
    float _299 = _245;
    float _301 = _267;
    float _303 = _247;
    bool _305 = !_223;
    float _307 = _299;
    float _309 = _303;
    if (!_305)
    {
        float _311 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = log2(_311);
        float _315 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _317 = _315 + 1.0;
        float _319 = 1.0 / _317;
        float _321 = _237 * _313;
        float _323 = exp2(_321);
        float _325 = -_323;
        float _327 = _325 + 1.0;
        float _329 = _327 * _319;
        _307 = _323;
        _309 = _317;
        _249 = _329;
    }
    float _331 = _307;
    float _333 = _309;
    float _335 = _249;
    float _337 = _331;
    float _339 = _333;
    if (!_223)
    {
        float _341 = _159 * _159;
        float _343 = _341 * 0.5;
        _337 = _343;
    }
    float _345 = _337;
    float _347 = _345;
    if (!_223)
    {
        _339 = _159;
    }
    float _349 = _339;
    float _351 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _353 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _355 = _349;
    if (!_223)
    {
        float _357 = _345 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _347 = _357;
    }
    float _359 = _347;
    bool _361 = !_223;
    float _363 = _359;
    if (!_361)
    {
        float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _367 = log2(_365);
        float _369 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _371 = _369 + 1.0;
        float _373 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _375 = _159 * _367;
        float _377 = 1.0 / _371;
        float _379 = _373 * 0.693147182464599609375;
        float _381 = exp2(_375);
        float _383 = 1.0 / _379;
        float _385 = _381 + (-1.0);
        float _387 = -_385;
        float _389 = fma(_387, _383, _159);
        float _391 = _389 * _377;
        float _393 = _391 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _363 = _393;
    }
    float _395 = _363;
    bool _397 = !_223;
    if (!_397)
    {
        float _399 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _401 = log2(_399);
        float _403 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _405 = _403 + 1.0;
        float _407 = 1.0 / _405;
        float _409 = _159 * _401;
        float _411 = exp2(_409);
        float _413 = -_411;
        float _415 = _413 + 1.0;
        float _417 = _415 * _407;
        _355 = _417;
    }
    float _419 = _355;
    float _421 = _301 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _423 = _395 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _425 = fma(_335, _209, _351);
    float _427 = fma(_335, _211, _353);
    float _429 = fma(_335, _213, _421);
    float _431 = _395 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _433 = fma(_419, _211, _423);
    float _435 = fma(_427, _181, _187);
    float _437 = sqrt(_239);
    float _439 = _395 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _441 = fma(_419, _209, _431);
    float _443 = -_433;
    float _445 = _427 + _443;
    float _447 = fma(_425, _181, _185);
    float _449 = fma(_419, _213, _439);
    float _451 = -_441;
    float _453 = _425 + _451;
    float _455 = _445 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _457 = sqrt(_241);
    float _459 = -_449;
    float _461 = _429 + _459;
    float _463 = _445 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _465 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[14].y, _455);
    float _467 = _445 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _469 = _445 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _471 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[14].x, _463);
    float _473 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[16].y, _465);
    float _475 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[14].z, _467);
    float _477 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[14].w, _469);
    float _479 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[16].x, _471);
    float _481 = _437 * _473;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _485 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[16].z, _475);
    float _487 = fma(_461, (*spvDescriptorSet0.vp_c10)._m0[16].w, _477);
    float _489 = _481 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _491 = _481 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _493 = _199 * _479;
    float _495 = _481 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _497 = _457 * _485;
    float _499 = fma(_429, _181, _189);
    float _501 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[24].x, _489);
    float _503 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[25].x, _491);
    float _505 = fma(_493, (*spvDescriptorSet0.vp_c8)._m0[26].x, _495);
    float _507 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[24].z, _501);
    float _509 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[25].z, _503);
    float _511 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[26].z, _505);
    float _513 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[24].w, _507);
    float _515 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[25].w, _509);
    float _517 = fma(_487, (*spvDescriptorSet0.vp_c8)._m0[26].w, _511);
    bool _519 = !_483;
    float _521 = _515;
    float _523 = _513;
    float _525 = _517;
    float _543;
    if (!_519)
    {
        float _527 = in.m_68.x;
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _531 = _527 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[12].x, _159);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_125);
        float _549 = 1.0 / _547;
        float _551 = _159 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _557 = _553 + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _567;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _575 = 1.0 / _561;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _577;
    float _581 = 1.0 / _569;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _585 = _553 + _583;
    bool _587 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _589 = 1.0 / _565;
    float _591 = _585 * _575;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _595 = _553 + _593;
    bool _597 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _599 = isnan(_553);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    bool _609 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _611 = isnan(_553);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = 1.0 / _573;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _625 = _553 + _623;
    float _627 = _595 * _581;
    bool _629 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _631 = isnan(_553);
    bool _633 = _629 || _631;
    bool _635 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _637 = _633 || _635;
    float _639 = float(_637);
    float _641 = 1.0 / _579;
    float _643 = _557 * _589;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _647 = _553 + _645;
    float _649 = -_639;
    float _651 = _649 + 1.0;
    float _653 = _625 * _621;
    float _655 = -_607;
    float _657 = _655 + 1.0;
    float _659 = _619 * _651;
    bool _661 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _663 = isnan(_553);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = _639 * _657;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _675;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _679;
    float _683 = _647 * _641;
    bool _685 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _687 = isnan(_553);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _693 = _689 || _691;
    float _695 = float(_693);
    float _697 = -_619;
    float _699 = _697 + 1.0;
    float _701 = fma(_677, _591, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _703 = fma(_681, _591, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _705 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _707 = isnan(_553);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = _695 * _699;
    float _719 = -_695;
    float _721 = _719 + 1.0;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _729 = _727 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _731 = _671 * _721;
    float _733 = -_671;
    float _735 = _733 + 1.0;
    float _737 = -_715;
    float _739 = _737 + 1.0;
    float _741 = fma(_725, _643, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _743 = fma(_729, _643, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _745 = _715 * _735;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _747;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _751;
    float _755 = _701 * _745;
    float _757 = _703 * _745;
    float _759 = fma(_749, _627, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _761 = fma(_753, _627, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _763 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[143].x, _755);
    float _765 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[143].y, _757);
    float _767 = in.m_66.x;
    float _769 = in.m_66.y;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _775 = fma(_741, _731, _763);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _781 = fma(_743, _731, _765);
    float _783 = fma(_773, _653, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _785;
    float _789 = fma(_759, _717, _775);
    float _791 = fma(_779, _653, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _793;
    float _797 = fma(_761, _717, _781);
    float _799 = fma(_787, _683, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _801 = fma(_783, _659, _789);
    float _803 = fma(_795, _683, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _805 = fma(_791, _659, _797);
    float _807 = fma(_799, _673, _801);
    float _809 = fma(_803, _673, _805);
    float _811 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[148].x, _807);
    float _813 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[148].y, _809);
    float _815 = _811 * _767;
    float _817 = _813 * _769;
    bool _819 = !_587;
    float _837;
    if (!_819)
    {
        float _821 = in.m_68.x;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _825 = _821 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[11].x, _159);
        float _829 = _827 * _823;
        float _831 = floor(_829);
        float _833 = -_831;
        float _835 = _829 + _833;
        _837 = _835;
        _839 = true;
    }
    else
    {
        float _841 = float(_125);
        float _843 = 1.0 / _841;
        float _845 = _159 * _843;
        _837 = _845;
    }
    _839 = false;
    float _847 = _837;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _851 = _847 + _849;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _855 = _847 + _853;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _859 = _847 + _857;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _869;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _877 = 1.0 / _863;
    bool _879 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _881 = 1.0 / _867;
    bool _883 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _885 = isnan(_847);
    bool _887 = _883 || _885;
    bool _889 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _891 = _887 || _889;
    float _893 = float(_891);
    float _895 = 1.0 / _871;
    float _897 = _855 * _877;
    bool _899 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _901 = isnan(_847);
    bool _903 = _899 || _901;
    bool _905 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _907 = _903 || _905;
    float _909 = float(_907);
    float _911 = 1.0 / _875;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _915 = _847 + _913;
    float _917 = _915 * _881;
    bool _919 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _921 = isnan(_847);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = _851 * _895;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _933;
    float _937 = -_929;
    float _939 = _937 + 1.0;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _941;
    float _945 = _893 * _939;
    float _947 = _859 * _911;
    bool _949 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _951 = isnan(_847);
    bool _953 = _949 || _951;
    bool _955 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _957 = _953 || _955;
    float _959 = float(_957);
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _961;
    float _965 = -_893;
    float _967 = _965 + 1.0;
    bool _969 = _847 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _971 = isnan(_847);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    float _981 = fma(_943, _931, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _983 = -_959;
    float _985 = _983 + 1.0;
    float _987 = fma(_935, _931, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _989 = fma(_963, _931, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _991 = _959 * _967;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _997 = _979 * _985;
    float _999 = -_979;
    float _1001 = _999 + 1.0;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1011 = fma(_995, _947, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1013 = _909 * _1001;
    float _1015 = fma(_1005, _947, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1017 = fma(_1009, _947, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1019 = -_909;
    float _1021 = _1019 + 1.0;
    float _1023 = _981 * _1013;
    float _1025 = _987 * _1013;
    float _1027 = _989 * _1013;
    float _1029 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1023);
    float _1031 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1025);
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1033;
    float _1037 = fma(_1021, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1027);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1039;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _1043;
    float _1047 = fma(_1015, _997, _1029);
    float _1049 = fma(_1017, _997, _1031);
    float _1051 = fma(_1011, _997, _1037);
    float _1053 = fma(_1041, _897, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _1055 = fma(_1035, _897, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1057 = fma(_1045, _897, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _1061 = _1059 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _1065 = _1063 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _1069 = _1067 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1071 = fma(_1053, _991, _1047);
    float _1073 = fma(_1061, _917, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _1075 = fma(_1065, _917, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _1077 = fma(_1069, _917, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1079 = fma(_1055, _991, _1049);
    float _1081 = fma(_1057, _991, _1051);
    float _1083 = fma(_1073, _945, _1071);
    float _1085 = fma(_1075, _945, _1079);
    float _1087 = fma(_1077, _945, _1081);
    float _1089 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[111].x, _1083);
    float _1091 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[111].y, _1085);
    float _1093 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[111].z, _1087);
    bool _1095 = !_879;
    float _1097 = _897;
    float _1099 = _1091;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _1119;
    if (!_1095)
    {
        float _1103 = in.m_68.x;
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1107 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[11].y, _159);
        float _1111 = _1109 * _1105;
        float _1113 = floor(_1111);
        float _1115 = -_1113;
        float _1117 = _1111 + _1115;
        _1119 = _1117;
        _1121 = true;
    }
    else
    {
        float _1123 = float(_125);
        float _1125 = 1.0 / _1123;
        float _1127 = _159 * _1125;
        _1119 = _1127;
    }
    _1121 = false;
    float _1129 = _1119;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1133 = _1129 + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1139 = _1129 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1141 = isnan(_1129);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1155 = _1129 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1157 = isnan(_1129);
    bool _1159 = _1155 || _1157;
    bool _1161 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1163 = _1159 || _1161;
    float _1165 = float(_1163);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1167;
    bool _1171 = _1129 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1173 = isnan(_1129);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = 1.0 / _1137;
    float _1185 = -_1149;
    float _1187 = _1185 + 1.0;
    bool _1189 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1191 = 1.0 / _1153;
    float _1193 = _1169 * _1183;
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1197 = _1195 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1199 = fma(_1193, _1133, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1201 = _1165 * _1187;
    float _1203 = -_1181;
    float _1205 = _1203 + 1.0;
    float _1207 = -_1165;
    float _1209 = _1207 + 1.0;
    float _1211 = _1197 * _1191;
    float _1213 = _1199 * _1201;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1217 = _1129 + _1215;
    float _1219 = _1149 * _1205;
    float _1221 = _1089 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1223 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1213);
    float _1225 = fma(_1211, _1217, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1227 = _1093 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1229 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1231 = fma(_1225, _1219, _1223);
    float _1233 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1235 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1237 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1231);
    float _1239 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1241 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _1229;
    out.m_70.y = _1239;
    out.m_70.z = _1235;
    out.m_70.w = _1241;
    bool _1243 = !_1189;
    float _1261;
    if (!_1243)
    {
        float _1245 = in.m_68.x;
        float _1247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1249 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[11].w, _159);
        float _1253 = _1251 * _1247;
        float _1255 = floor(_1253);
        float _1257 = -_1255;
        float _1259 = _1253 + _1257;
        _1261 = _1259;
        _1263 = true;
    }
    else
    {
        float _1265 = float(_125);
        float _1267 = 1.0 / _1265;
        float _1269 = _159 * _1267;
        _1261 = _1269;
    }
    _1263 = false;
    float _1271 = _1261;
    float _1273 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1275 = _1271 + _1273;
    float _1277 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1279 = _1277 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1281 = _1271 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1283 = isnan(_1271);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1295 = _1293 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1297 = _1271 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1299 = isnan(_1271);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1305 = _1301 || _1303;
    float _1307 = float(_1305);
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1309;
    bool _1313 = _1271 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1315 = isnan(_1271);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1321 = _1317 || _1319;
    float _1323 = float(_1321);
    float _1325 = 1.0 / _1279;
    float _1327 = -_1291;
    float _1329 = _1327 + 1.0;
    bool _1331 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1333 = 1.0 / _1295;
    float _1335 = _1311 * _1325;
    float _1337 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1341 = fma(_1335, _1275, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1343 = _1307 * _1329;
    float _1345 = -_1323;
    float _1347 = _1345 + 1.0;
    float _1349 = -_1307;
    float _1351 = _1349 + 1.0;
    float _1353 = _1339 * _1333;
    float _1355 = _1341 * _1343;
    float _1357 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1359 = _1271 + _1357;
    float _1361 = _1291 * _1347;
    float _1363 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1355);
    float _1365 = fma(_1353, _1359, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1367 = fma(_1365, _1361, _1363);
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1373 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1375 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1367);
    float _1377 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1379 = _1371 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1381 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1383 = _1375 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _1377;
    out.m_72.y = _1379;
    out.m_72.z = _1381;
    out.m_72.w = _1383;
    bool _1385 = !_1331;
    float _1387 = _1371;
    float _1389 = _1383;
    float _1391 = _1381;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1395 = _1375;
    float _1397 = _1355;
    bool _1399 = _1331;
    float _1417;
    float _1419;
    if (!_1385)
    {
        float _1401 = in.m_68.x;
        float _1403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1405 = _1401 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1407 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[14].x, _159);
        float _1409 = _1407 * _1403;
        float _1411 = floor(_1409);
        float _1413 = -_1411;
        float _1415 = _1409 + _1413;
        _1417 = _1409;
        _1387 = _1411;
        _1419 = _1415;
        _1421 = true;
    }
    else
    {
        float _1423 = float(_125);
        float _1425 = 1.0 / _1423;
        float _1427 = _159 * _1425;
        _1417 = _1425;
        _1419 = _1427;
    }
    _1421 = false;
    float _1429 = _1417;
    float _1431 = _1387;
    float _1433 = _1419;
    float _1435 = in.m_68.w;
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1439 = _1437 != 0;
    int _1441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1443 = _1441 != 0;
    int _1445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1447 = _1445 != 0;
    int _1449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1451 = _1449 != 0;
    int _1453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1455 = _1453 != 0;
    float _1457 = _1429;
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _1461 = _1433;
    if (_1439)
    {
        float _1463 = in.m_68.x;
        _1457 = _1463;
    }
    float _1465 = _1457;
    if (!_1439)
    {
        _1097 = _233;
    }
    float _1467 = _1097;
    float _1469 = _1431;
    float _1471 = _1467;
    if (_1443)
    {
        float _1473 = in.m_68.z;
        _1469 = _1473;
    }
    float _1475 = _1469;
    if (!_1443)
    {
        _1389 = _227;
    }
    float _1477 = _1389;
    float _1479 = 0.0;
    float _1481 = _1477;
    if (_1455)
    {
        _1479 = 1.0;
    }
    float _1483 = _1479;
    float _1485 = _1483;
    if (!_1447)
    {
        _1391 = _233;
    }
    float _1487 = _1391;
    float _1489 = _1373;
    float _1491 = _1487;
    if (_1447)
    {
        float _1493 = in.m_68.w;
        _1489 = _1493;
    }
    float _1495 = _1489;
    float _1497 = 0.0;
    if (_1455)
    {
        _1497 = 1.0;
    }
    float _1499 = _1497;
    float _1501 = 0.0;
    float _1503 = _1499;
    if (_1455)
    {
        _1501 = 1.0;
    }
    float _1505 = _1501;
    int _1507 = 0;
    float _1509 = _1505;
    if (_1455)
    {
        _1507 = 0;
    }
    int _1511 = _1507;
    int _1513 = _1511;
    if (_1455)
    {
        _1459 = 0;
    }
    int _1515 = _1459;
    float _1517 = _1465;
    int _1519 = _1515;
    if (_1439)
    {
        float _1521 = _1465 * 3.1415927410125732421875;
        _1517 = _1521;
    }
    float _1523 = _1517;
    float _1525 = _1523;
    if (_1439)
    {
        float _1527 = _1523 * 0.15915493667125701904296875;
        _1393 = _1527;
    }
    float _1529 = _1393;
    if (_1443)
    {
        float _1531 = _1475 * 3.1415927410125732421875;
        _1525 = _1531;
    }
    float _1533 = _1525;
    if (_1447)
    {
        float _1535 = _1495 * 3.1415927410125732421875;
        _1395 = _1535;
    }
    float _1537 = _1395;
    float _1539 = _1537;
    if (_1443)
    {
        float _1541 = _1533 * 0.15915493667125701904296875;
        _1397 = _1541;
    }
    float _1543 = _1397;
    float _1545 = _1529;
    if (_1439)
    {
        float _1547 = _1529 * 6.283185482025146484375;
        float _1549 = sin(_1547);
        _1545 = _1549;
    }
    float _1551 = _1545;
    float _1553 = _1533;
    float _1555 = _1475;
    float _1557 = _1495;
    if (_1455)
    {
        float _1559 = in.m_68.x;
        float _1561 = in.m_68.y;
        float _1563 = in.m_68.z;
        _1553 = _1559;
        _1555 = _1561;
        _1557 = _1563;
    }
    float _1565 = _1553;
    float _1567 = _1555;
    float _1569 = _1557;
    if (_1447)
    {
        float _1571 = _1537 * 0.15915493667125701904296875;
        _1539 = _1571;
    }
    float _1573 = _1539;
    float _1575 = _1543;
    if (_1443)
    {
        float _1577 = _1543 * 6.283185482025146484375;
        float _1579 = sin(_1577);
        _1575 = _1579;
    }
    float _1581 = _1575;
    float _1583 = _1573;
    if (_1447)
    {
        float _1585 = _1573 * 6.283185482025146484375;
        float _1587 = sin(_1585);
        _1583 = _1587;
    }
    float _1589 = _1583;
    float _1591 = _1551;
    if (_1439)
    {
        bool _1593 = _1551 > 0.5;
        _1399 = _1593;
    }
    bool _1595 = _1399;
    bool _1597 = _1595;
    if (_1439)
    {
        float _1599 = -_233;
        float _1601 = _1595 ? _1599 : _233;
        _1471 = _1601;
    }
    float _1603 = _1471;
    float _1605 = _1567;
    float _1607 = _1565;
    float _1609 = _1569;
    if (_1455)
    {
        _1591 = _1565;
    }
    float _1611 = _1591;
    float _1613 = _1611;
    if (_1443)
    {
        bool _1615 = _1581 > 0.5;
        _251 = _1615;
    }
    bool _1617 = _251;
    int _1619 = int(_1595);
    int _1621 = _1447 ? 2 : 0;
    int _1623 = _1619 | _1621;
    int _1625 = _1617 ? 4 : 0;
    int _1627 = _1623 | _1625;
    int _1629 = _1443 ? 8 : 0;
    int _1631 = _1627 | _1629;
    int _1633 = _1455 ? 16 : 0;
    int _1635 = _1631 | _1633;
    int _1637 = _1451 ? 32 : 0;
    int _1639 = _1635 | _1637;
    int _1641 = false ? 64 : 0;
    int _1643 = _1639 | _1641;
    int _1645 = _1643 & 32;
    if (_1455)
    {
        _1099 = _1611;
    }
    float _1647 = _1099;
    float _1649 = _1647;
    if (_1447)
    {
        bool _1651 = _1589 > 0.5;
        _1597 = _1651;
    }
    bool _1653 = _1597;
    int _1655 = 0;
    if (_1455)
    {
        _1655 = as_type<int>(_1611);
    }
    int _1657 = _1655;
    int _1659 = _1657;
    if (_1455)
    {
        _1101 = as_type<int>(_1567);
    }
    int _1661 = _1101;
    int _1663 = 0;
    int _1665 = _1661;
    if (_1455)
    {
        _1663 = as_type<int>(_1569);
    }
    int _1667 = _1663;
    int _1669 = _1667;
    if (!_1455)
    {
        float _1671 = in.m_68.x;
        float _1673 = in.m_68.y;
        float _1675 = in.m_68.z;
        float _1677 = _1671 * 3.1415927410125732421875;
        float _1679 = _1677 * 0.15915493667125701904296875;
        float _1681 = _1673 * 3.1415927410125732421875;
        float _1683 = _1681 * 0.15915493667125701904296875;
        float _1685 = _1675 * 3.1415927410125732421875;
        float _1687 = _1679 * 6.283185482025146484375;
        float _1689 = sin(_1687);
        float _1691 = _1685 * 0.15915493667125701904296875;
        float _1693 = _1683 * 6.283185482025146484375;
        float _1695 = sin(_1693);
        float _1697 = _1691 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        _1605 = _1673;
        _1649 = _1675;
        _1509 = 5.839270114898681640625;
        _1607 = _1671;
        _1609 = _1675;
        _1613 = _1673;
        _1503 = 1.2345600128173828125;
        _1485 = 7.345489978790283203125;
        _1519 = 2;
        _1513 = 1;
        _1665 = as_type<int>(_1695);
        _1659 = as_type<int>(_1689);
        _1669 = as_type<int>(_1699);
    }
    float _1701 = _1605;
    float _1703 = _1649;
    float _1705 = _1509;
    float _1707 = _1607;
    float _1709 = _1609;
    float _1711 = _1613;
    float _1713 = _1503;
    float _1715 = _1485;
    int _1717 = _1519;
    int _1719 = _1513;
    int _1721 = _1665;
    int _1723 = _1659;
    int _1725 = _1669;
    float _1727 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1729 = int(_1727);
    int _1731 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1733 = _1731 != 0;
    bool _1735 = _1701 > 0.5;
    float _1737 = _1703 * _1705;
    float _1739 = _1701 + _1707;
    if (_1443)
    {
        float _1741 = -_227;
        float _1743 = _1617 ? _1741 : _227;
        _1481 = _1743;
    }
    float _1745 = _1481;
    float _1747 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1749 = int(_1747);
    if (_1447)
    {
        float _1751 = -_233;
        float _1753 = _1653 ? _1751 : _233;
        _1491 = _1753;
    }
    float _1755 = _1491;
    float _1757 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1761 = _1759 != 0;
    int _1763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1765 = _1763 != 0;
    int _1767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1769 = _1767 != 0;
    float _1771 = _1701 + _1709;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1775 = _1773 != 0;
    float _1777 = _1707 + _1709;
    bool _1779 = _1709 > 0.5;
    float _1781 = _817 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1783 = float(_1729);
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1787 = _1785 != 0;
    float _1789 = -_227;
    int _1791 = _1735 ? as_type<int>(_1789) : as_type<int>(_227);
    float _1793 = 1.0 / _1783;
    bool _1795 = !_1775;
    int _1797 = _1795 ? 0 : 1;
    float _1799 = float(uint(_1749));
    int _1801 = ~_1749;
    int _1803 = _1801 + 1;
    float _1805 = -_233;
    int _1807 = _1779 ? as_type<int>(_1805) : as_type<int>(_233);
    float _1809 = 1.0 / _1799;
    bool _1811 = _1435 > 0.5;
    int _1813 = int(_1811);
    int _1815 = _1779 ? 2 : 0;
    int _1817 = _1813 | _1815;
    int _1819 = _1617 ? 4 : 0;
    int _1821 = _1817 | _1819;
    int _1823 = _1761 ? 8 : 0;
    int _1825 = _1821 | _1823;
    int _1827 = _1765 ? 16 : 0;
    int _1829 = _1825 | _1827;
    int _1831 = _1769 ? 32 : 0;
    int _1833 = _1829 | _1831;
    int _1835 = _1735 ? 64 : 0;
    int _1837 = _1833 | _1835;
    int _1839 = _1837 & 64;
    bool _1841 = !_1765;
    float _1843 = _1841 ? _227 : as_type<float>(_1791);
    bool _1845 = !_1769;
    float _1847 = _1845 ? _233 : as_type<float>(_1807);
    float _1849 = _159 * _1793;
    float _1851 = -_233;
    int _1853 = _1811 ? as_type<int>(_1851) : as_type<int>(_233);
    int _1855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1857 = _1855 != 0;
    int _1859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1861 = _1859 != 0;
    int _1863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1865 = _1863 != 0;
    float _1867 = trunc(_1849);
    int _1869 = int(_1867);
    int _1871 = int(_1811);
    int _1873 = _1779 ? 2 : 0;
    int _1875 = _1871 | _1873;
    int _1877 = _1617 ? 4 : 0;
    int _1879 = _1875 | _1877;
    int _1881 = _1761 ? 8 : 0;
    int _1883 = _1879 | _1881;
    int _1885 = _1857 ? 16 : 0;
    int _1887 = _1883 | _1885;
    int _1889 = _1861 ? 32 : 0;
    int _1891 = _1887 | _1889;
    int _1893 = _1865 ? 64 : 0;
    int _1895 = _1891 | _1893;
    int _1897 = _1895 & 2;
    bool _1899 = !_1761;
    float _1901 = _1899 ? _233 : as_type<float>(_1853);
    int _1903 = as_type<int>(_1809) + (-2);
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1907 = _1905 != 0;
    int _1909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1911 = _1909 != 0;
    int _1913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1915 = _1913 != 0;
    int _1917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1919 = _1917 != 0;
    int _1921 = ~_1749;
    int _1923 = _1921 + 1;
    float _1925 = float(_125);
    bool _1927 = !_1911;
    int _1929 = _1927 ? 0 : 1;
    float _1931 = 1.0 / _1925;
    float _1933 = float(uint(_1869));
    float _1935 = float(_1869);
    bool _1937 = !_1857;
    int _1939 = _1937 ? 0 : 1;
    float _1941 = as_type<float>(_1903) * _1933;
    bool _1943 = _1749 == 0;
    bool _1945 = !_1861;
    int _1947 = _1945 ? 0 : 1;
    bool _1949 = !_1865;
    int _1951 = _1949 ? 0 : 1;
    float _1953 = trunc(_1941);
    float _1955 = precise::max(_1953, 0.0);
    uint _1958 = uint(_1955);
    int _1960 = abs(_1947);
    int _1962 = abs(_1951);
    int _1964 = _1803 * int(_1958);
    int _1966 = _1964 + _1869;
    float _1968 = float(uint(_1966));
    float _1970 = as_type<float>(_1903) * _1968;
    float _1972 = trunc(_1970);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    int _1978 = int(_1958) + int(_1976);
    float _1980 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1982 = int(_1980);
    int _1984 = _1923 * _1978;
    int _1986 = _1984 + _1869;
    bool _1988 = uint(_1986) >= uint(_1749);
    float _1990 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1992 = int(_1990);
    bool _1994 = !_1988;
    int _1996 = _1994 ? 0 : (-1);
    float _1998 = float(_1982);
    int _2000 = ~_1978;
    int _2002 = _2000 + _1996;
    int _2004 = _2002 + 1;
    float _2006 = 1.0 / _1998;
    float _2008 = float(uint(_1992));
    int _2010 = ~_1992;
    int _2012 = _2010 + 1;
    float _2014 = 1.0 / _2008;
    float _2016 = float(_1992);
    bool _2018 = _1992 == 0;
    float _2020 = _159 * _2006;
    float _2022 = _1711 * _1713;
    bool _2024 = !_1733;
    int _2026 = _2024 ? 0 : 1;
    float _2028 = _1711 * _1715;
    float _2030 = trunc(_2020);
    int _2032 = int(_2030);
    int _2034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2036 = _2034 != 0;
    int _2038 = as_type<int>(_2014) + (-2);
    int _2040 = abs(_2026);
    bool _2042 = !_2036;
    int _2044 = _2042 ? 0 : 1;
    int _2046 = ~_1992;
    int _2048 = _2046 + 1;
    int _2050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2052 = _2050 != 0;
    bool _2054 = !_2052;
    int _2056 = _2054 ? 0 : 1;
    float _2058 = float(uint(_2032));
    int _2060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2062 = _2060 != 0;
    float _2064 = as_type<float>(_2038) * _2058;
    float _2066 = trunc(_2064);
    float _2068 = precise::max(_2066, 0.0);
    uint _2070 = uint(_2068);
    int _2072 = _2012 * int(_2070);
    int _2074 = _2072 + _2032;
    float _2076 = float(uint(_2074));
    float _2078 = as_type<float>(_2038) * _2076;
    float _2080 = trunc(_2078);
    float _2082 = precise::max(_2080, 0.0);
    uint _2084 = uint(_2082);
    float _2086 = floor(_2022);
    int _2088 = int(_2070) + int(_2084);
    float _2090 = float(_1749);
    int _2092 = _2048 * _2088;
    int _2094 = _2092 + _2032;
    float _2096 = -_2086;
    float _2098 = _2022 + _2096;
    bool _2100 = uint(_2094) >= uint(_1992);
    float _2102 = _1707 * _1715;
    float _2104 = _2098 * _2016;
    bool _2106 = !_2100;
    int _2108 = _2106 ? 0 : (-1);
    float _2110 = floor(_2102);
    int _2112 = ~_2088;
    int _2114 = _2112 + _2108;
    int _2116 = _2114 + 1;
    int _2118 = _1992 * _2116;
    int _2120 = _2118 + _2032;
    float _2122 = trunc(_2104);
    int _2124 = int(_2122);
    bool _2126 = !_2018;
    int _2128 = _2126 ? _2120 : (-1);
    float _2130 = -_2110;
    float _2132 = _2102 + _2130;
    bool _2134 = _1935 >= _2090;
    bool _2136 = isnan(_1935);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan(_2090);
    bool _2142 = _2138 || _2140;
    float _2144 = float(_2142);
    float _2146 = float(_2032);
    float _2148 = _2132 * _2090;
    bool _2150 = _2146 >= _2016;
    bool _2152 = isnan(_2146);
    bool _2154 = _2150 || _2152;
    bool _2156 = isnan(_2016);
    bool _2158 = _2154 || _2156;
    float _2160 = float(_2158);
    float _2162 = trunc(_2148);
    int _2164 = int(_2162);
    float _2166 = _159 * _1931;
    float _2168 = _2166 * _2090;
    float _2170 = _2166 * _2016;
    float _2172 = trunc(_2144);
    int _2174 = int(_2172);
    int _2176 = _1749 * _2004;
    int _2178 = _2176 + _1869;
    bool _2180 = !_1915;
    int _2182 = _2180 ? 0 : 1;
    bool _2184 = !_1943;
    int _2186 = _2184 ? _2178 : (-1);
    float _2188 = trunc(_2160);
    int _2190 = int(_2188);
    int _2192 = _2164 * _2040;
    int _2194 = _2192 + _1869;
    int _2196 = _1749 + (-1);
    bool _2198 = !_1907;
    int _2200 = _2198 ? 0 : 1;
    int _2202 = ~_2174;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    float _2208 = trunc(_2168);
    int _2210 = int(_2208);
    int _2212 = abs(_2200);
    int _2214 = _2186 * _2206;
    int _2216 = abs(_2044);
    int _2218 = ~_2190;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    int _2224 = _2174 * _2196;
    int _2226 = _2224 + _2214;
    float _2228 = trunc(_2170);
    int _2230 = int(_2228);
    int _2232 = abs(_1939);
    int _2234 = _2128 * _2222;
    int _2236 = abs(_1929);
    int _2238 = _1992 + (-1);
    int _2240 = _2226 * _1960;
    int _2242 = _2190 * _2238;
    int _2244 = _2242 + _2234;
    int _2246 = ~_1992;
    int _2248 = _2246 + 1;
    int _2250 = _2210 * _2232;
    int _2252 = _2250 + _2240;
    int _2254 = _2124 * _2216;
    int _2256 = _2254 + _2032;
    int _2258 = abs(_1797);
    int _2260 = _2244 * _2236;
    bool _2262 = !_1919;
    int _2264 = _2262 ? 0 : 1;
    int _2266 = abs(_2182);
    int _2268 = _2230 * _2212;
    int _2270 = _2268 + _2260;
    int _2272 = abs(_2264);
    int _2274 = _2194 * _1962;
    int _2276 = _2274 + _2252;
    int _2278 = _2256 * _2266;
    int _2280 = _2278 + _2270;
    int _2282 = _2164 * _2258;
    int _2284 = _2282 + _2276;
    int _2286 = _2124 * _2272;
    int _2288 = _2286 + _2280;
    float _2290 = float(uint(_2284));
    float _2292 = float(uint(_2288));
    float _2294 = as_type<float>(_1903) * _2290;
    float _2296 = as_type<float>(_2038) * _2292;
    int _2298 = ~_1749;
    int _2300 = _2298 + 1;
    float _2302 = trunc(_2294);
    float _2304 = precise::max(_2302, 0.0);
    uint _2306 = uint(_2304);
    float _2308 = trunc(_2296);
    float _2310 = precise::max(_2308, 0.0);
    uint _2312 = uint(_2310);
    int _2314 = _2300 * int(_2306);
    int _2316 = _2314 + _2284;
    float _2318 = float(uint(_2316));
    int _2320 = _2248 * int(_2312);
    int _2322 = _2320 + _2288;
    float _2324 = as_type<float>(_1903) * _2318;
    float _2326 = float(uint(_2322));
    float _2328 = trunc(_2324);
    float _2330 = precise::max(_2328, 0.0);
    uint _2332 = uint(_2330);
    int _2334 = ~_1749;
    int _2336 = _2334 + 1;
    float _2338 = as_type<float>(_2038) * _2326;
    float _2340 = trunc(_2338);
    float _2342 = precise::max(_2340, 0.0);
    uint _2344 = uint(_2342);
    int _2346 = int(_2306) + int(_2332);
    int _2348 = ~_1992;
    int _2350 = _2348 + 1;
    int _2352 = _2336 * _2346;
    int _2354 = _2352 + _2284;
    int _2356 = int(_2312) + int(_2344);
    float _2358 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _2360 = int(_2358);
    bool _2362 = uint(_2354) >= uint(_1749);
    int _2364 = _2350 * _2356;
    int _2366 = _2364 + _2288;
    bool _2368 = !_2362;
    int _2370 = _2368 ? 0 : (-1);
    bool _2372 = uint(_2366) >= uint(_1992);
    float _2374 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2376 = int(_2374);
    int _2378 = ~_2346;
    int _2380 = _2378 + _2370;
    int _2382 = _2380 + 1;
    bool _2384 = !_2372;
    int _2386 = _2384 ? 0 : (-1);
    int _2388 = _1749 * _2382;
    int _2390 = _2388 + _2284;
    float _2392 = float(_2360);
    int _2394 = ~_2356;
    int _2396 = _2394 + _2386;
    int _2398 = _2396 + 1;
    bool _2400 = !_1943;
    int _2402 = _2400 ? _2390 : (-1);
    float _2404 = 1.0 / _2392;
    int _2406 = _1992 * _2398;
    int _2408 = _2406 + _2288;
    int _2410 = _2402 & 3;
    bool _2412 = _2410 != 0;
    int _2414 = _2402 & 3;
    bool _2416 = _2414 != 0;
    bool _2418 = !_2018;
    int _2420 = _2418 ? _2408 : (-1);
    int _2422 = _2412 ? 0 : 1;
    int _2424 = _2420 & 3;
    bool _2426 = _2424 != 0;
    float _2428 = float(uint(_2376));
    int _2430 = _2426 ? 0 : 1;
    float _2432 = _159 * _2404;
    bool _2434 = uint(_2414) > 1u;
    float _2436 = 1.0 / _2428;
    int _2438 = int(_2434);
    int _2440 = _2416 ? 2 : 0;
    int _2442 = _2438 | _2440;
    int _2444 = _1915 ? 4 : 0;
    int _2446 = _2442 | _2444;
    int _2448 = _1919 ? 8 : 0;
    int _2450 = _2446 | _2448;
    int _2452 = _1943 ? 16 : 0;
    int _2454 = _2450 | _2452;
    int _2456 = _2018 ? 32 : 0;
    int _2458 = _2454 | _2456;
    int _2460 = _1865 ? 64 : 0;
    int _2462 = _2458 | _2460;
    int _2464 = _2462 & 2;
    int _2466 = _2420 & 3;
    bool _2468 = _2466 != 0;
    int _2470 = ~_2422;
    int _2472 = _2470 + 1;
    int _2474 = _2472 + 1;
    int _2476 = int(_2434);
    int _2478 = _2468 ? 2 : 0;
    int _2480 = _2476 | _2478;
    int _2482 = _1915 ? 4 : 0;
    int _2484 = _2480 | _2482;
    int _2486 = _1919 ? 8 : 0;
    int _2488 = _2484 | _2486;
    int _2490 = _1943 ? 16 : 0;
    int _2492 = _2488 | _2490;
    int _2494 = _2018 ? 32 : 0;
    int _2496 = _2492 | _2494;
    int _2498 = _1865 ? 64 : 0;
    int _2500 = _2496 | _2498;
    int _2502 = _2500 & 2;
    float _2504 = trunc(_2432);
    int _2506 = int(_2504);
    int _2508 = ~_2376;
    int _2510 = _2508 + 1;
    int _2512 = _2474;
    float _2514 = as_type<float>(_2502);
    float _2516 = as_type<float>(_2464);
    float _2518 = as_type<float>(_2256);
    float _2520 = as_type<float>(_2376);
    if (!_2434)
    {
        int _2522 = ~_2422;
        int _2524 = _2522 + 1;
        _2512 = _2524;
    }
    int _2526 = _2512;
    bool _2528 = uint(_2466) > 1u;
    int _2530 = as_type<int>(_2436) + (-2);
    int _2532 = ~_2430;
    int _2534 = _2532 + 1;
    int _2536 = _2534 + 1;
    float _2538 = float(uint(_2506));
    float _2540 = float(_2506);
    int _2542 = _2536;
    if (!_2528)
    {
        int _2544 = ~_2430;
        int _2546 = _2544 + 1;
        _2542 = _2546;
    }
    int _2548 = _2542;
    float _2550 = as_type<float>(_2530) * _2538;
    int _2552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2554 = _2552 != 0;
    float _2556 = trunc(_2550);
    float _2558 = precise::max(_2556, 0.0);
    uint _2560 = uint(_2558);
    int _2562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2564 = _2562 != 0;
    int _2566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2568 = _2566 != 0;
    int _2570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2572 = _2570 != 0;
    bool _2574 = !_2554;
    int _2576 = _2574 ? 0 : 1;
    bool _2578 = !_2568;
    int _2580 = _2578 ? 0 : 1;
    bool _2582 = _1839 != 0;
    int _2584 = ~_2376;
    int _2586 = _2584 + 1;
    int _2588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2590 = _2588 != 0;
    int _2592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2594 = _2592 != 0;
    int _2596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2598 = _2596 != 0;
    int _2600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2602 = _2600 != 0;
    bool _2604 = !_2564;
    int _2606 = _2604 ? 0 : 1;
    int _2608 = _2586 * int(_2560);
    int _2610 = _2608 + _2506;
    bool _2612 = !_2590;
    int _2614 = _2612 ? 0 : 1;
    bool _2616 = _2376 == 0;
    float _2618 = float(uint(_2610));
    float _2620 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2622 = int(_2620);
    bool _2624 = !_2572;
    int _2626 = _2624 ? 0 : 1;
    float _2628 = as_type<float>(_2530) * _2618;
    int _2630 = abs(_2580);
    int _2632 = abs(_2576);
    bool _2634 = !_2602;
    int _2636 = _2634 ? 0 : 1;
    float _2638 = trunc(_2628);
    float _2640 = precise::max(_2638, 0.0);
    uint _2642 = uint(_2640);
    bool _2644 = !_2594;
    int _2646 = _2644 ? 0 : 1;
    bool _2648 = !_2598;
    int _2650 = _2648 ? 0 : 1;
    int _2652 = abs(_2646);
    int _2654 = ~_2622;
    int _2656 = _2654 + 1;
    bool _2658 = _2622 == 0;
    bool _2660 = _1992 == 0;
    int _2662 = int(_2560) + int(_2642);
    float _2664 = float(uint(_2622));
    int _2666 = _2510 * _2662;
    int _2668 = _2666 + _2506;
    bool _2670 = uint(_2668) >= uint(_2376);
    float _2672 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _2674 = int(_2672);
    bool _2676 = !_2670;
    int _2678 = _2676 ? 0 : (-1);
    int _2680 = ~_2662;
    int _2682 = _2680 + _2678;
    int _2684 = _2682 + 1;
    int _2686 = _2376 * _2684;
    int _2688 = _2686 + _2506;
    float _2690 = float(_2674);
    float _2692 = 1.0 / _2664;
    bool _2694 = !_2616;
    int _2696 = _2694 ? _2688 : (-1);
    float _2698 = 1.0 / _2690;
    int _2700 = ~_2622;
    int _2702 = _2700 + 1;
    int _2704 = as_type<int>(_2692) + (-2);
    float _2706 = _159 * _2698;
    float _2708 = trunc(_2706);
    int _2710 = int(_2708);
    float _2712 = float(uint(_2710));
    float _2714 = as_type<float>(_2704) * _2712;
    float _2716 = trunc(_2714);
    float _2718 = precise::max(_2716, 0.0);
    uint _2720 = uint(_2718);
    int _2722 = _2656 * int(_2720);
    int _2724 = _2722 + _2710;
    float _2726 = float(_2376);
    float _2728 = float(uint(_2724));
    bool _2730 = _2540 >= _2726;
    bool _2732 = isnan(_2540);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan(_2726);
    bool _2738 = _2734 || _2736;
    float _2740 = float(_2738);
    float _2742 = as_type<float>(_2704) * _2728;
    float _2744 = trunc(_2740);
    int _2746 = int(_2744);
    float _2748 = trunc(_2742);
    float _2750 = precise::max(_2748, 0.0);
    uint _2752 = uint(_2750);
    int _2754 = int(_2720) + int(_2752);
    float _2756 = floor(_1737);
    int _2758 = _2702 * _2754;
    int _2760 = _2758 + _2710;
    bool _2762 = uint(_2760) >= uint(_2622);
    bool _2764 = !_2762;
    int _2766 = _2764 ? 0 : (-1);
    float _2768 = -_2756;
    float _2770 = _1737 + _2768;
    int _2772 = _2376 + (-1);
    int _2774 = ~_2754;
    int _2776 = _2774 + _2766;
    int _2778 = _2776 + 1;
    float _2780 = _2770 * _2726;
    float _2782 = _2166 * _2726;
    int _2784 = ~_2746;
    int _2786 = _2784 + 1;
    int _2788 = _2786 + 1;
    float _2790 = trunc(_2780);
    int _2792 = int(_2790);
    int _2794 = _2696 * _2788;
    int _2796 = abs(_2056);
    bool _2798 = !_2062;
    int _2800 = _2798 ? 0 : 1;
    int _2802 = _2746 * _2772;
    int _2804 = _2802 + _2794;
    float _2806 = trunc(_2782);
    int _2808 = int(_2806);
    int _2810 = abs(_2606);
    bool _2812 = _1717 != 2;
    int _2814 = abs(_2626);
    int _2816 = _2804 * _2630;
    int _2818 = _2792 * _2796;
    int _2820 = _2818 + _2506;
    int _2822 = _2808 * _2810;
    int _2824 = _2822 + _2816;
    int _2826 = ~_2376;
    int _2828 = _2826 + 1;
    int _2830 = _2820 * _2814;
    int _2832 = _2830 + _2824;
    int _2834 = ~_2376;
    int _2836 = _2834 + 1;
    int _2838 = _2792 * _2632;
    int _2840 = _2838 + _2832;
    float _2842 = float(uint(_2840));
    float _2844 = as_type<float>(_2530) * _2842;
    float _2846 = trunc(_2844);
    float _2848 = precise::max(_2846, 0.0);
    uint _2850 = uint(_2848);
    float _2852 = floor(_2028);
    int _2854 = _2836 * int(_2850);
    int _2856 = _2854 + _2840;
    float _2858 = float(uint(_2856));
    float _2860 = -_2852;
    float _2862 = _2028 + _2860;
    int _2864 = _2622 + (-1);
    float _2866 = as_type<float>(_2530) * _2858;
    float _2868 = trunc(_2866);
    float _2870 = precise::max(_2868, 0.0);
    uint _2872 = uint(_2870);
    int _2874 = int(_2850) + int(_2872);
    float _2876 = float(_2622);
    int _2878 = _2828 * _2874;
    int _2880 = _2878 + _2840;
    float _2882 = _2862 * _2876;
    float _2884 = _2166 * _2876;
    bool _2886 = uint(_2880) >= uint(_2376);
    float _2888 = float(_2710);
    float _2890 = trunc(_2882);
    int _2892 = int(_2890);
    bool _2894 = !_2886;
    int _2896 = _2894 ? 0 : (-1);
    bool _2898 = _2888 >= _2876;
    bool _2900 = isnan(_2888);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan(_2876);
    bool _2906 = _2902 || _2904;
    float _2908 = float(_2906);
    int _2910 = _2622 * _2778;
    int _2912 = _2910 + _2710;
    int _2914 = ~_2874;
    int _2916 = _2914 + _2896;
    int _2918 = _2916 + 1;
    float _2920 = trunc(_2884);
    int _2922 = int(_2920);
    bool _2924 = !_2658;
    int _2926 = _2924 ? _2912 : (-1);
    float _2928 = trunc(_2908);
    int _2930 = int(_2928);
    int _2932 = ~_2930;
    int _2934 = _2932 + 1;
    int _2936 = _2934 + 1;
    int _2938 = _2926 * _2936;
    int _2940 = abs(_2800);
    int _2942 = _2930 * _2864;
    int _2944 = _2942 + _2938;
    int _2946 = abs(_2614);
    int _2948 = _2892 * _2940;
    int _2950 = _2948 + _2710;
    int _2952 = abs(_2650);
    int _2954 = _2944 * _2652;
    int _2956 = abs(_2636);
    int _2958 = _2922 * _2946;
    int _2960 = _2958 + _2954;
    int _2962 = ~_2622;
    int _2964 = _2962 + 1;
    int _2966 = _2950 * _2952;
    int _2968 = _2966 + _2960;
    int _2970 = _2892 * _2956;
    int _2972 = _2970 + _2968;
    int _2974 = ~_2622;
    int _2976 = _2974 + 1;
    float _2978 = float(uint(_2972));
    float _2980 = as_type<float>(_2704) * _2978;
    float _2982 = trunc(_2980);
    float _2984 = precise::max(_2982, 0.0);
    uint _2986 = uint(_2984);
    int _2988 = _2976 * int(_2986);
    int _2990 = _2988 + _2972;
    float _2992 = float(uint(_2990));
    float _2994 = as_type<float>(_2704) * _2992;
    float _2996 = trunc(_2994);
    float _2998 = precise::max(_2996, 0.0);
    uint _3000 = uint(_2998);
    int _3002 = int(_2986) + int(_3000);
    int _3004 = _2964 * _3002;
    int _3006 = _3004 + _2972;
    bool _3008 = uint(_3006) >= uint(_2622);
    int _3010 = _2376 * _2918;
    int _3012 = _3010 + _2840;
    int _3014 = ~_2376;
    int _3016 = _3014 + 1;
    bool _3018 = !_3008;
    int _3020 = _3018 ? 0 : (-1);
    bool _3022 = !_2616;
    int _3024 = _3022 ? _3012 : (-1);
    int _3026 = ~_3002;
    int _3028 = _3026 + _3020;
    int _3030 = _3028 + 1;
    int _3032 = _3024 & 3;
    bool _3034 = _3032 != 0;
    int _3036 = _3024 & 3;
    bool _3038 = _3036 != 0;
    int _3040 = _2622 * _3030;
    int _3042 = _3040 + _2972;
    int _3044 = _3034 ? 0 : 1;
    int _3046 = ~_1749;
    int _3048 = _3046 + 1;
    bool _3050 = !_2658;
    int _3052 = _3050 ? _3042 : (-1);
    int _3054 = ~_3044;
    int _3056 = _3054 + 1;
    int _3058 = _3056 + 1;
    int _3060 = _3052 & 3;
    bool _3062 = _3060 != 0;
    int _3064 = _3062 ? 0 : 1;
    bool _3066 = uint(_3036) > 1u;
    int _3068 = _3058;
    if (!_3066)
    {
        int _3070 = ~_3044;
        int _3072 = _3070 + 1;
        _3068 = _3072;
    }
    int _3074 = _3068;
    int _3076 = _3052 & 3;
    bool _3078 = _3076 != 0;
    int _3080 = ~_3064;
    int _3082 = _3080 + 1;
    int _3084 = _3082 + 1;
    bool _3086 = uint(_3076) > 1u;
    int _3088 = _3084;
    if (!_3086)
    {
        int _3090 = ~_3064;
        int _3092 = _3090 + 1;
        _3088 = _3092;
    }
    int _3094 = _3088;
    bool _3096 = uint(_2414) >= 2u;
    int _3098 = _3096 ? 0 : 1;
    bool _3100 = uint(_2466) >= 2u;
    int _3102 = ~_3098;
    int _3104 = _3102 + 1;
    int _3106 = _3104 + 1;
    int _3108 = _3100 ? 0 : 1;
    bool _3110 = _2414 != 3;
    int _3112 = ~_3108;
    int _3114 = _3112 + 1;
    int _3116 = _3114 + 1;
    int _3118 = _3106;
    int _3120 = _3116;
    if (_3110)
    {
        int _3122 = ~_3098;
        int _3124 = _3122 + 1;
        _3118 = _3124;
    }
    int _3126 = _3118;
    bool _3128 = _2466 != 3;
    if (_3128)
    {
        int _3130 = ~_3108;
        int _3132 = _3130 + 1;
        _3120 = _3132;
    }
    int _3134 = _3120;
    bool _3136 = uint(_3036) >= 2u;
    int _3138 = _3136 ? 0 : 1;
    bool _3140 = uint(_3076) >= 2u;
    int _3142 = ~_3138;
    int _3144 = _3142 + 1;
    int _3146 = _3144 + 1;
    int _3148 = _3140 ? 0 : 1;
    bool _3150 = _3036 != 3;
    int _3152 = ~_3148;
    int _3154 = _3152 + 1;
    int _3156 = _3154 + 1;
    int _3158 = _3146;
    int _3160 = _3156;
    if (_3150)
    {
        int _3162 = ~_3138;
        int _3164 = _3162 + 1;
        _3158 = _3164;
    }
    int _3166 = _3158;
    bool _3168 = _3076 != 3;
    float _3170 = -_233;
    int _3172 = _2582 ? as_type<int>(_3170) : as_type<int>(_233);
    bool _3174 = _2464 != 0;
    if (_3168)
    {
        int _3176 = ~_3148;
        int _3178 = _3176 + 1;
        _3160 = _3178;
    }
    int _3180 = _3160;
    float _3182 = float(uint(_2194));
    float _3184 = as_type<float>(_1903) * _3182;
    float _3186 = trunc(_3184);
    float _3188 = precise::max(_3186, 0.0);
    uint _3190 = uint(_3188);
    int _3192 = _3048 * int(_3190);
    int _3194 = _3192 + _2194;
    float _3196 = float(uint(_3194));
    int _3198 = ~_1749;
    int _3200 = _3198 + 1;
    float _3202 = as_type<float>(_1903) * _3196;
    float _3204 = trunc(_3202);
    float _3206 = precise::max(_3204, 0.0);
    uint _3208 = uint(_3206);
    int _3210 = ~_2376;
    int _3212 = _3210 + 1;
    int _3214 = int(_3190) + int(_3208);
    float _3216 = float(uint(_2256));
    int _3218 = ~_1992;
    int _3220 = _3218 + 1;
    int _3222 = _3200 * _3214;
    int _3224 = _3222 + _2194;
    float _3226 = as_type<float>(_2038) * _3216;
    bool _3228 = uint(_3224) >= uint(_1749);
    float _3230 = trunc(_3226);
    float _3232 = precise::max(_3230, 0.0);
    uint _3234 = uint(_3232);
    bool _3236 = !_3228;
    int _3238 = _3236 ? 0 : (-1);
    int _3240 = ~_3214;
    int _3242 = _3240 + _3238;
    int _3244 = _3242 + 1;
    int _3246 = _1749 * _3244;
    int _3248 = _3246 + _2194;
    float _3250 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3252 = _3250 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _3254 = _3220 * int(_3234);
    int _3256 = _3254 + _2256;
    float _3258 = 1.0 / _3252;
    float _3260 = float(uint(_3256));
    int _3262 = ~_1992;
    int _3264 = _3262 + 1;
    float _3266 = as_type<float>(_2038) * _3260;
    float _3268 = trunc(_3266);
    float _3270 = precise::max(_3268, 0.0);
    uint _3272 = uint(_3270);
    int _3274 = int(_3234) + int(_3272);
    float _3276 = float(uint(_2820));
    float _3278 = as_type<float>(_2530) * _3276;
    int _3280 = _3264 * _3274;
    int _3282 = _3280 + _2256;
    float _3284 = trunc(_3278);
    float _3286 = precise::max(_3284, 0.0);
    uint _3288 = uint(_3286);
    bool _3290 = uint(_3282) >= uint(_1992);
    bool _3292 = !_3290;
    int _3294 = _3292 ? 0 : (-1);
    int _3296 = ~_2622;
    int _3298 = _3296 + 1;
    int _3300 = ~_3274;
    int _3302 = _3300 + _3294;
    int _3304 = _3302 + 1;
    int _3306 = _3212 * int(_3288);
    int _3308 = _3306 + _2820;
    int _3310 = _1992 * _3304;
    int _3312 = _3310 + _2256;
    float _3314 = _1707 * 2.0;
    float _3316 = float(uint(_3308));
    float _3318 = floor(_3314);
    float _3320 = as_type<float>(_2530) * _3316;
    float _3322 = float(uint(_2950));
    float _3324 = as_type<float>(_2704) * _3322;
    float _3326 = trunc(_3320);
    float _3328 = precise::max(_3326, 0.0);
    uint _3330 = uint(_3328);
    float _3332 = trunc(_3324);
    float _3334 = precise::max(_3332, 0.0);
    uint _3336 = uint(_3334);
    int _3338 = int(_3288) + int(_3330);
    bool _3340 = !_2660;
    int _3342 = _3340 ? _3312 : (-1);
    float _3344 = _1701 * 2.0;
    int _3346 = _3016 * _3338;
    int _3348 = _3346 + _2820;
    int _3350 = _3298 * int(_3336);
    int _3352 = _3350 + _2950;
    float _3354 = floor(_3344);
    bool _3356 = uint(_3348) >= uint(_2376);
    float _3358 = float(uint(_3352));
    int _3360 = ~_2622;
    int _3362 = _3360 + 1;
    bool _3364 = !_3356;
    int _3366 = _3364 ? 0 : (-1);
    float _3368 = as_type<float>(_2704) * _3358;
    int _3370 = ~_3338;
    int _3372 = _3370 + _3366;
    int _3374 = _3372 + 1;
    float _3376 = trunc(_3368);
    float _3378 = precise::max(_3376, 0.0);
    uint _3380 = uint(_3378);
    int _3382 = _2376 * _3374;
    int _3384 = _3382 + _2820;
    bool _3386 = !_3078;
    int _3388 = _3386 ? 0 : 1;
    bool _3390 = _3036 != 3;
    bool _3392 = !_2616;
    int _3394 = _3392 ? _3384 : (-1);
    int _3396 = abs(_3388);
    int _3398 = int(_3336) + int(_3380);
    int _3400 = _3362 * _3398;
    int _3402 = _3400 + _2950;
    bool _3404 = uint(_3402) >= uint(_2622);
    bool _3406 = !_3404;
    int _3408 = _3406 ? 0 : (-1);
    bool _3410 = _1749 == 0;
    bool _3412 = !_3174;
    int _3414 = _3412 ? 0 : 1;
    bool _3416 = !_3410;
    int _3418 = _3416 ? _3248 : (-1);
    bool _3420 = _1719 != 1;
    bool _3422 = _2502 != 0;
    bool _3424 = !_1787;
    int _3426 = _3424 ? 0 : 1;
    int _3428 = ~_3398;
    int _3430 = _3428 + _3408;
    int _3432 = _3430 + 1;
    bool _3434 = !_3038;
    int _3436 = _3434 ? 0 : 1;
    bool _3438 = _2466 != 3;
    int _3440 = _2622 * _3432;
    int _3442 = _3440 + _2950;
    bool _3444 = !_3390;
    int _3446 = _3444 ? 0 : (-1);
    float _3448 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3450 = log2(_3448);
    bool _3452 = !_3438;
    int _3454 = _3452 ? 0 : (-1);
    float _3456 = as_type<float>(_3338);
    float _3458 = _3368;
    if (_2812)
    {
        _2514 = _1707;
    }
    float _3460 = _2514;
    float _3462 = _3460;
    if (_2812)
    {
        _2516 = _1701;
    }
    float _3464 = _2516;
    float _3466 = _3464;
    if (!_2812)
    {
        _3462 = _1709;
    }
    float _3468 = _3462;
    if (!_2812)
    {
        _3466 = _1707;
    }
    float _3470 = _3466;
    int _3472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3474 = _3472 != 0;
    bool _3476 = !_2658;
    int _3478 = _3476 ? _3442 : (-1);
    bool _3480 = !_3420;
    float _3482 = _3480 ? as_type<float>(_1721) : as_type<float>(_1723);
    float _3484 = _159 * _3450;
    bool _3486 = !_3420;
    float _3488 = _3486 ? as_type<float>(_1725) : as_type<float>(_1721);
    bool _3490 = !_3474;
    int _3492 = _3490 ? 0 : 1;
    int _3494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3496 = _3494 != 0;
    float _3498 = exp2(_3484);
    if (!_3420)
    {
        _3456 = _1709;
    }
    float _3500 = _3456;
    float _3502 = _3500;
    if (!_3420)
    {
        _2518 = _1709;
    }
    float _3504 = _2518;
    float _3506 = _3504;
    if (!_3420)
    {
        _3458 = _1701;
    }
    float _3508 = _3458;
    float _3510 = _3508;
    if (!_3420)
    {
        _2520 = _1701;
    }
    float _3512 = _2520;
    float _3514 = _3512;
    if (_3420)
    {
        _3502 = _1701;
    }
    float _3516 = _3502;
    if (_3420)
    {
        _3506 = _1701;
    }
    float _3518 = _3506;
    if (_3420)
    {
        _3510 = _1707;
    }
    float _3520 = _3510;
    if (_3420)
    {
        _3514 = _1707;
    }
    float _3522 = _3514;
    float _3524 = -_3498;
    float _3526 = _3524 + 1.0;
    bool _3528 = _3318 >= 0.0;
    bool _3530 = isnan(_3318);
    bool _3532 = _3528 || _3530;
    bool _3534 = isnan(0.0);
    bool _3536 = _3532 || _3534;
    float _3538 = _3520 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3540 = _3536 ? 0 : 1;
    bool _3542 = _3318 > 0.0;
    int _3544 = ~_3540;
    int _3546 = _3544 + 1;
    int _3548 = _3546 + 1;
    int _3550 = _3548;
    if (!_3542)
    {
        int _3552 = ~_3540;
        int _3554 = _3552 + 1;
        _3550 = _3554;
    }
    int _3556 = _3550;
    bool _3558 = _3354 >= 0.0;
    bool _3560 = isnan(_3354);
    bool _3562 = _3558 || _3560;
    bool _3564 = isnan(0.0);
    bool _3566 = _3562 || _3564;
    int _3568 = _3566 ? 0 : 1;
    bool _3570 = _3354 > 0.0;
    float _3572 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3574 = _3572 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _3576 = ~_3568;
    int _3578 = _3576 + 1;
    int _3580 = _3578 + 1;
    float _3582 = 1.0 / _3574;
    int _3584 = _3580;
    if (!_3570)
    {
        int _3586 = ~_3568;
        int _3588 = _3586 + 1;
        _3584 = _3588;
    }
    int _3590 = _3584;
    float _3592 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3594 = _3592 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3596 = _2414 != 3;
    float _3598 = 1.0 / _3594;
    bool _3600 = !_3596;
    int _3602 = _3600 ? 0 : (-1);
    bool _3604 = _3076 != 3;
    float _3606 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3608 = _3606 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3610 = !_3422;
    int _3612 = _3610 ? 0 : 1;
    float _3614 = 1.0 / _3608;
    int _3616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3618 = _3616 != 0;
    int _3620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3622 = _3620 != 0;
    int _3624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3626 = _3624 != 0;
    float _3628 = _435 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _3630 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3632 = _3630 != 0;
    bool _3634 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3636 = isnan(0.0);
    bool _3638 = _3634 || _3636;
    bool _3640 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3642 = _3638 || _3640;
    float _3644 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[14].z, _3628);
    float _3646 = _3642 ? _3526 : 0.0;
    float _3648 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3650 = _3648 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _3652 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3654 = _3652 != 0;
    float _3656 = _435 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _3658 = _435 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _3660 = _435 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    bool _3662 = !_3622;
    int _3664 = _3662 ? 0 : 1;
    float _3666 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[14].x, _3656);
    bool _3668 = _1645 != 0;
    float _3670 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[14].y, _3658);
    float _3672 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[14].w, _3660);
    float _3674 = 1.0 / _3650;
    float _3676 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3678 = _3676 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3680 = fma(_499, (*spvDescriptorSet0.vp_c10)._m0[16].x, _3666);
    float _3682 = fma(_499, (*spvDescriptorSet0.vp_c10)._m0[16].y, _3670);
    float _3684 = 1.0 / _3678;
    float _3686 = fma(_499, (*spvDescriptorSet0.vp_c10)._m0[16].z, _3644);
    float _3688 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3690 = _3688 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3692 = fma(_499, (*spvDescriptorSet0.vp_c10)._m0[16].w, _3672);
    float _3694 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3696 = _3694 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3698 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3700 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3698;
    float _3702 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3704 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3702;
    float _3706 = 0.0;
    if (_3668)
    {
        float _3708 = in.m_68.w;
        _3706 = _3708;
    }
    float _3710 = _3706;
    float _3712 = 1.0 / _3690;
    float _3714 = _3696 * _3598;
    float _3716 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3718 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3716;
    float _3720 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3722 = _3720 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3724 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3726 = _3724 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _3728 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3730 = isnan(_1433);
    bool _3732 = _3728 || _3730;
    bool _3734 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3736 = _3732 || _3734;
    float _3738 = float(_3736);
    float _3740 = _3704 * _3614;
    float _3742 = _3718 * _3674;
    float _3744 = _3722 * _3258;
    float _3746 = _3726 * _3684;
    float _3748 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3750 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3748;
    float _3752 = _3700 * _3582;
    float _3754 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3756 = _1433 + _3754;
    bool _3758 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3760 = isnan(_1433);
    bool _3762 = _3758 || _3760;
    bool _3764 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3766 = _3762 || _3764;
    float _3768 = float(_3766);
    float _3770 = -_3738;
    float _3772 = _3770 + 1.0;
    float _3774 = _3750 * _3712;
    float _3776 = fma(_3752, _3756, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _3778 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3780 = isnan(_1433);
    bool _3782 = _3778 || _3780;
    bool _3784 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3786 = _3782 || _3784;
    float _3788 = float(_3786);
    float _3790 = _3768 * _3772;
    float _3792 = -_3768;
    float _3794 = _3792 + 1.0;
    float _3796 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3798 = _1433 + _3796;
    bool _3800 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3802 = isnan(_1433);
    bool _3804 = _3800 || _3802;
    bool _3806 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3808 = _3804 || _3806;
    float _3810 = float(_3808);
    float _3812 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3814 = _1433 + _3812;
    float _3816 = _3788 * _3794;
    float _3818 = -_3788;
    float _3820 = _3818 + 1.0;
    float _3822 = fma(_3714, _3798, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _3824 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3826 = isnan(_1433);
    bool _3828 = _3824 || _3826;
    bool _3830 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3832 = _3828 || _3830;
    float _3834 = float(_3832);
    float _3836 = fma(_3740, _3814, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3838 = _3810 * _3820;
    float _3840 = -_3810;
    float _3842 = _3840 + 1.0;
    bool _3844 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3846 = isnan(_1433);
    bool _3848 = _3844 || _3846;
    bool _3850 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3852 = _3848 || _3850;
    float _3854 = float(_3852);
    float _3856 = -_3834;
    float _3858 = _3856 + 1.0;
    bool _3860 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3862 = isnan(_1433);
    bool _3864 = _3860 || _3862;
    bool _3866 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3868 = _3864 || _3866;
    float _3870 = float(_3868);
    float _3872 = _3834 * _3842;
    float _3874 = _3854 * _3858;
    float _3876 = -_3854;
    float _3878 = _3876 + 1.0;
    float _3880 = -_3870;
    float _3882 = _3880 + 1.0;
    float _3884 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3886 = _1433 + _3884;
    float _3888 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3890 = 1.0 + _3888;
    float _3892 = _3870 * _3878;
    float _3894 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3896 = _1433 + _3894;
    float _3898 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3900 = _1433 + _3898;
    float _3902 = 1.0 / _3890;
    float _3904 = fma(_3744, _3886, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _3906 = fma(_3746, _3896, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3908 = _1709 * 2.0;
    float _3910 = fma(_3774, _3900, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _3912 = _1433 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3914 = isnan(_1433);
    bool _3916 = _3912 || _3914;
    bool _3918 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3920 = _3916 || _3918;
    float _3922 = float(_3920);
    float _3924 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3926 = _1433 + _3924;
    if (_3668)
    {
        float _3928 = _3710 * 3.1415927410125732421875;
        _1461 = _3928;
    }
    float _3930 = _1461;
    float _3932 = floor(_3908);
    float _3934 = _3682 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _3936 = _3922 * _3882;
    float _3938 = _3930;
    if (_3668)
    {
        float _3940 = _3930 * 0.15915493667125701904296875;
        _3938 = _3940;
    }
    float _3942 = _3938;
    float _3944 = fma(_3742, _3926, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3946 = _437 * _3934;
    float _3948 = _3776 * _3936;
    float _3950 = _3680 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _3952 = _3646 * _3902;
    float _3954 = _3942;
    if (_3668)
    {
        float _3956 = _3942 * 6.283185482025146484375;
        float _3958 = sin(_3956);
        _3954 = _3958;
    }
    float _3960 = _3954;
    float _3962 = _3946 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3964 = _3946 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3966 = _199 * _3950;
    float _3968 = _3946 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3970 = !_3604;
    int _3972 = _3970 ? 0 : (-1);
    float _3974 = -_3922;
    float _3976 = _3974 + 1.0;
    bool _3978 = _3932 > 0.0;
    float _3980 = fma(_3966, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3962);
    bool _3982 = _3932 >= 0.0;
    bool _3984 = isnan(_3932);
    bool _3986 = _3982 || _3984;
    bool _3988 = isnan(0.0);
    bool _3990 = _3986 || _3988;
    float _3992 = fma(_3966, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3964);
    float _3994 = fma(_3966, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3968);
    float _3996 = _3686 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    int _3998 = _3990 ? 0 : 1;
    float _4000 = fma(_3976, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3948);
    float _4002 = _3692 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _4004 = _457 * _3996;
    int _4006 = ~_3998;
    int _4008 = _4006 + 1;
    int _4010 = _4008 + 1;
    float _4012 = fma(_3822, _3892, _4000);
    bool _4014 = _3990;
    int _4016 = _4010;
    if (_3668)
    {
        bool _4018 = _3960 > 0.5;
        _4014 = _4018;
    }
    bool _4020 = _4014;
    float _4022 = fma(_4004, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3980);
    if (!_3978)
    {
        int _4024 = ~_3998;
        int _4026 = _4024 + 1;
        _4016 = _4026;
    }
    int _4028 = _4016;
    float _4030 = fma(_4004, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3992);
    float _4032 = fma(_4004, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3994);
    float _4034 = fma(_3836, _3874, _4012);
    bool _4036 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4038 = isnan(1.0);
    bool _4040 = _4036 || _4038;
    bool _4042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4044 = _4040 || _4042;
    float _4046 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4048 = fma(_4002, (*spvDescriptorSet0.vp_c8)._m0[26].w, _4032);
    float _4050 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _4052 = !_4044;
    float _4054 = _4052 ? _159 : _3952;
    float _4056 = fma(_4002, (*spvDescriptorSet0.vp_c8)._m0[24].w, _4022);
    float _4058 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4046);
    float _4060 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4050);
    float _4062 = _1701 + (-0.5);
    float _4064 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _4066 = fma(_4002, (*spvDescriptorSet0.vp_c8)._m0[25].w, _4030);
    float _4068 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _4070 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _4072 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _4074 = !_3626;
    int _4076 = _4074 ? 0 : 1;
    float _4078 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4064);
    bool _4080 = _1897 != 0;
    float _4082 = fma(as_type<float>(_1721), (*spvDescriptorSet0.vp_c9)._m0[93].w, _4068);
    bool _4084 = _1707 > 0.5;
    float _4086 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4070);
    float _4088 = _1707 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _4090 = _1707 + (-0.5);
    float _4092 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4094 = fma(as_type<float>(_1723), (*spvDescriptorSet0.vp_c9)._m0[93].z, _4072);
    float _4096 = as_type<float>(_1721) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _4098 = fma(_3904, _3872, _4034);
    float _4100 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _4102 = as_type<float>(_1723) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _4104 = _1709 + (-0.5);
    float _4106 = fma(_4096, -2.0, _4092);
    float _4108 = fma(_3944, _3838, _4098);
    float _4110 = -_4100;
    float _4112 = fma(_4102, 2.0, _4110);
    float _4114 = _1739 + (-1.0);
    float _4116 = _1771 + (-1.0);
    float _4118 = _1777 + (-1.0);
    float _4120 = fma(_3906, _3816, _4108);
    float _4122 = fma(_4114, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _4124 = fma(_4116, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _4126 = fma(_4118, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _4128 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _4130 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _4132 = fma(_3910, _3790, _4120);
    float _4134 = _4066 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _4136 = fma(_3522, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4128);
    float _4138 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4140 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _4142 = fma(_1757, -2.0, _4130);
    float _4144 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4146 = _4056 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _4148 = -_4134;
    float _4150 = _4148 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4152 = fma(_3482, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4138);
    float _4154 = _3482 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _4156 = fma(_3518, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4140);
    float _4158 = -_4146;
    float _4160 = _4158 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4162 = _4150 * _4150;
    float _4164 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4166 = _4134 + _4164;
    float _4168 = -_4144;
    float _4170 = fma(_4154, 2.0, _4168);
    float _4172 = _4048 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _4174 = fma(_4160, _4160, _4162);
    float _4176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4178 = _4146 + _4176;
    float _4180 = _4166 * _4166;
    float _4182 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4184 = _4172 + _4182;
    float _4186 = -_4172;
    float _4188 = _4186 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4190 = fma(_4178, _4178, _4180);
    float _4192 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _4194 = fma(_4188, _4188, _4174);
    float _4196 = fma(_4184, _4184, _4190);
    float _4198 = -_4192;
    float _4200 = fma(_4088, 2.0, _4198);
    float _4202 = rsqrt(_4194);
    float _4204 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _4206 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _4208 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _4210 = !_3618;
    int _4212 = _4210 ? 0 : 1;
    float _4214 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _4216 = fma(_3488, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4206);
    float _4218 = sqrt(_4196);
    float _4220 = _3516 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _4222 = _3488 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _4224 = -_4208;
    float _4226 = fma(_3538, 2.0, _4224);
    int _4228 = abs(_4076);
    float _4230 = fma(_4220, -2.0, _4204);
    float _4232 = _815 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _4234 = fma(_4222, -2.0, _4214);
    float _4236 = rsqrt(_4196);
    float _4238 = fma(_3738, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4132);
    float _4240 = _4232 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _4242 = _4188 * _4202;
    int _4244 = abs(_4212);
    float _4246 = _4160 * _4202;
    int _4248 = abs(_3664);
    float _4250 = _4150 * _4202;
    float _4252 = _4218 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _4254 = float(_4028);
    float _4256 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _4258 = float(_4228);
    float _4260 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4152);
    float _4262 = precise::min(_4240, _4252);
    float _4264 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4216);
    float _4266 = float(_4244);
    float _4268 = in.m_74.x;
    float _4270 = in.m_74.y;
    float _4272 = in.m_74.z;
    float _4274 = float(_3556);
    float _4276 = _4236 * _4262;
    float _4278 = float(_4248);
    float _4280 = _4266 * _4254;
    float _4282 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4284 = _4246 * _4282;
    float _4286 = float(_3590);
    float _4288 = _4166 * _4276;
    float _4290 = _4278 * _4274;
    float _4292 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4294 = _4242 * _4292;
    float _4296 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4298 = -_4284;
    float _4300 = fma(_4242, _4296, _4298);
    float _4302 = _4258 * _4286;
    float _4304 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _4306 = _4250 * _4304;
    float _4308 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _4310 = -_4294;
    float _4312 = fma(_4250, _4308, _4310);
    float _4314 = _4300 * _4300;
    float _4316 = -_4288;
    float _4318 = _4166 + _4316;
    float _4320 = _4178 * _4276;
    float _4322 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4324 = -_4306;
    float _4326 = fma(_4246, _4322, _4324);
    float _4328 = fma(_4312, _4312, _4314);
    float _4330 = _4318 * _4318;
    float _4332 = -_4320;
    float _4334 = _4178 + _4332;
    float _4336 = _4184 * _4276;
    float _4338 = _4280 * (-2.0);
    float _4340 = fma(_4326, _4326, _4328);
    float _4342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _4344 = fma(_4334, _4334, _4330);
    float _4346 = -_4336;
    float _4348 = _4184 + _4346;
    float _4350 = fma(_4338, _4268, _4268);
    float _4352 = fma(_4122, _4338, _4122);
    float _4354 = _4256 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _4356 = fma(_4348, _4348, _4344);
    float _4358 = fma(_4090, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4350);
    float _4360 = _1745 + 0.5;
    float _4362 = -_159;
    float _4364 = fma(_4362, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4170);
    float _4366 = _4290 * (-2.0);
    float _4368 = fma(_4054, _4352, _4358);
    float _4370 = sqrt(_4356);
    float _4372 = fma(_4354, _4360, _4364);
    float _4374 = _4302 * (-2.0);
    float _4376 = fma(_4366, _4270, _4270);
    float _4378 = _4368 * 0.15915493667125701904296875;
    float _4380 = _4342 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _4382 = fma(_4374, _4272, _4272);
    float _4384 = fma(_4062, (*spvDescriptorSet0.vp_c9)._m0[196].y, _4376);
    float _4386 = _1755 + (-0.5);
    float _4388 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4234);
    float _4390 = fma(_4104, (*spvDescriptorSet0.vp_c9)._m0[196].z, _4382);
    float _4392 = fma(_4124, _4366, _4124);
    float _4394 = fma(_4126, _4374, _4126);
    float _4396 = -_4380;
    float _4398 = -_4388;
    float _4400 = fma(_4396, _4386, _4398);
    float _4402 = -_4260;
    float _4404 = _4402 + 1.0;
    float _4406 = fma(_4054, _4392, _4384);
    float _4408 = fma(_4054, _4394, _4390);
    float _4410 = -_4404;
    float _4412 = fma(_4410, _1745, _4372);
    float _4414 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _4416 = _3468 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _4418 = _4406 * 0.15915493667125701904296875;
    float _4420 = _3470 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _4422 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _4424 = -_4414;
    float _4426 = fma(_4416, 2.0, _4424);
    float _4428 = _4408 * 0.15915493667125701904296875;
    float _4430 = _4378 * 6.283185482025146484375;
    float _4432 = sin(_4430);
    float _4434 = fma(_4420, -2.0, _4422);
    float _4436 = -_4264;
    float _4438 = _4436 + 1.0;
    float _4440 = _4236 * _4370;
    out.m_76.x = _4238;
    float _4442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _227);
    float _4444 = fma(_4438, _1755, _4400);
    float _4446 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _233);
    float _4448 = _4378 * 6.283185482025146484375;
    float _4450 = cos(_4448);
    float _4452 = _1781 * _4440;
    float _4454 = _4232 * _4440;
    out.m_78.x = _4412;
    out.m_78.y = _4444;
    float _4456 = _4440 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _4458 = _4456 * 0.5;
    float _4460 = _4452 * _4446;
    float _4462 = _4454 * _4442;
    out.m_80.x = _4454;
    float _4464 = _4418 * 6.283185482025146484375;
    float _4466 = sin(_4464);
    int _4468 = abs(_2548);
    out.m_82.w = _4262;
    bool _4470 = !_3632;
    float _4472 = _4470 ? _233 : as_type<float>(_3172);
    int _4474 = ~_4468;
    int _4476 = _4474 + 1;
    int _4478 = _4476 + 1;
    float _4480 = _4418 * 6.283185482025146484375;
    float _4482 = cos(_4480);
    float _4484 = rsqrt(_4340);
    float _4486 = _4432 * _4466;
    float _4488 = _4450 * _4466;
    float _4490 = _4428 * 6.283185482025146484375;
    float _4492 = cos(_4490);
    float _4494 = _4450 * _4482;
    float _4496 = _4432 * _4482;
    float _4498 = _4428 * 6.283185482025146484375;
    float _4500 = sin(_4498);
    float _4502 = _4326 * _4484;
    float _4504 = _4312 * _4484;
    float _4506 = _4300 * _4484;
    float _4508 = _4250 * _4504;
    float _4510 = _4432 * _4492;
    int _4512 = _2420 >> 31;
    float _4514 = _4450 * _4492;
    int _4516 = _2402 >> 31;
    float _4518 = _4482 * _4492;
    int _4520 = _4512 & 3;
    float _4522 = _4466 * _4492;
    int _4524 = _4516 & 3;
    float _4526 = fma(_4500, _4494, _4486);
    float _4528 = fma(_4500, _4486, _4494);
    float _4530 = _4246 * _4502;
    int _4532 = _2420 + _4520;
    float _4534 = _4242 * _4506;
    float _4536 = -_4488;
    float _4538 = fma(_4500, _4496, _4536);
    float _4540 = -_4530;
    float _4542 = fma(_4242, _4504, _4540);
    float _4544 = -_4496;
    float _4546 = fma(_4500, _4488, _4544);
    int _4548 = _2402 + _4524;
    float _4550 = -_4534;
    float _4552 = fma(_4250, _4502, _4550);
    int _4554 = _3024 >> 31;
    float _4556 = _4514 * _4542;
    int _4558 = _4548 >> 2;
    float _4560 = -_4460;
    float _4562 = _4500 * _4560;
    int _4564 = _4554 & 3;
    float _4566 = -_4500;
    float _4568 = fma(_4566, _4506, _4556);
    float _4570 = _4514 * _4552;
    int _4572 = _3052 >> 31;
    float _4574 = -_4508;
    float _4576 = fma(_4246, _4506, _4574);
    int _4578 = _4558 << 4;
    int _4580 = _4578 + 368;
    float _4582 = -_4500;
    float _4584 = fma(_4582, _4504, _4570);
    int _4586 = _4572 & 3;
    float _4588 = _4514 * _4460;
    uint _4590 = uint(int(uint(_4580) >> uint(2)));
    uint _4592 = uint(int(uint(int(_4590)) >> uint(2)));
    int _4594 = int(_4590) & 3;
    float _4596 = (*spvDescriptorSet0.vp_c9)._m0[int(_4592)][_4594];
    int _4598 = int(_4590) + 1;
    uint _4600 = uint(int(uint(_4598) >> uint(2)));
    int _4602 = _4598 & 3;
    float _4604 = (*spvDescriptorSet0.vp_c9)._m0[int(_4600)][_4602];
    int _4606 = _3024 + _4564;
    float _4608 = _4510 * _4460;
    int _4610 = _3052 + _4586;
    float _4612 = fma(_4518, _4462, _4562);
    int _4614 = _4606 >> 2;
    float _4616 = _4526 * _4552;
    int _4618 = _4610 >> 2;
    float _4620 = _4526 * _4542;
    int _4622 = _4532 >> 2;
    float _4624 = _4514 * _4576;
    int _4626 = _4614 << 4;
    int _4628 = _4626 + 656;
    float _4630 = fma(_4526, _4462, _4588);
    int _4632 = _4618 << 4;
    int _4634 = _4632 + 800;
    float _4636 = _4526 * _4576;
    int _4638 = _4622 << 4;
    int _4640 = _4638 + 512;
    float _4642 = fma(_4538, _4462, _4608);
    float _4644 = fma(_4518, _4504, _4616);
    float _4646 = fma(_4518, _4506, _4620);
    float _4648 = -_4500;
    float _4650 = fma(_4648, _4502, _4624);
    uint _4652 = uint(int(uint(_4628) >> uint(2)));
    uint _4654 = uint(int(uint(int(_4652)) >> uint(2)));
    int _4656 = int(_4652) & 3;
    float _4658 = (*spvDescriptorSet0.vp_c9)._m0[int(_4654)][_4656];
    int _4660 = int(_4652) + 1;
    uint _4662 = uint(int(uint(_4660) >> uint(2)));
    int _4664 = _4660 & 3;
    float _4666 = (*spvDescriptorSet0.vp_c9)._m0[int(_4662)][_4664];
    float _4668 = _4546 * _4542;
    float _4670 = fma(_4518, _4502, _4636);
    float _4672 = fma(_4510, _4246, _4584);
    float _4674 = fma(_4510, _4250, _4568);
    float _4676 = fma(_4510, _4242, _4650);
    float _4678 = _4546 * _4552;
    float _4680 = _4546 * _4576;
    uint _4682 = uint(int(uint(_4634) >> uint(2)));
    uint _4684 = uint(int(uint(int(_4682)) >> uint(2)));
    int _4686 = int(_4682) & 3;
    float _4688 = (*spvDescriptorSet0.vp_c9)._m0[int(_4684)][_4686];
    int _4690 = int(_4682) + 1;
    uint _4692 = uint(int(uint(_4690) >> uint(2)));
    int _4694 = _4690 & 3;
    float _4696 = (*spvDescriptorSet0.vp_c9)._m0[int(_4692)][_4694];
    float _4698 = fma(_4522, _4506, _4668);
    float _4700 = fma(_4546, _4458, _4630);
    float _4702 = fma(_4522, _4458, _4612);
    float _4704 = fma(_4522, _4504, _4678);
    float _4706 = fma(_4522, _4502, _4680);
    int _4708 = abs(_2526);
    float _4710 = _4552 * _4700;
    uint _4712 = uint(int(uint(_4640) >> uint(2)));
    uint _4714 = uint(int(uint(int(_4712)) >> uint(2)));
    int _4716 = int(_4712) & 3;
    float _4718 = (*spvDescriptorSet0.vp_c9)._m0[int(_4714)][_4716];
    int _4720 = int(_4712) + 1;
    uint _4722 = uint(int(uint(_4720) >> uint(2)));
    int _4724 = _4720 & 3;
    float _4726 = (*spvDescriptorSet0.vp_c9)._m0[int(_4722)][_4724];
    float _4728 = _4576 * _4700;
    int _4730 = ~_4708;
    int _4732 = _4730 + 1;
    int _4734 = _4732 + 1;
    float _4736 = fma(_4528, _4458, _4642);
    int _4738 = abs(_3074);
    float _4740 = fma(_4504, _4702, _4710);
    float _4742 = fma(_4502, _4702, _4728);
    int _4744 = abs(_3612);
    int _4746 = _4640 + 8;
    uint _4748 = uint(int(uint(_4746) >> uint(2)));
    uint _4750 = uint(int(uint(int(_4748)) >> uint(2)));
    int _4752 = int(_4748) & 3;
    float _4754 = (*spvDescriptorSet0.vp_c9)._m0[int(_4750)][_4752];
    int _4756 = int(_4748) + 1;
    uint _4758 = uint(int(uint(_4756) >> uint(2)));
    int _4760 = _4756 & 3;
    float _4762 = (*spvDescriptorSet0.vp_c9)._m0[int(_4758)][_4760];
    int _4764 = abs(_3094);
    float _4766 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4768 = int(_4766);
    int _4770 = ~_4744;
    int _4772 = _4770 + 1;
    int _4774 = _4772 + 1;
    int _4776 = _4734 * as_type<int>(_4604);
    int _4778 = abs(_3414);
    float _4780 = fma(_4242, _4736, _4742);
    int _4782 = ~_4764;
    int _4784 = _4782 + 1;
    int _4786 = _4784 + 1;
    int _4788 = _4628 + 8;
    uint _4790 = uint(int(uint(_4788) >> uint(2)));
    uint _4792 = uint(int(uint(int(_4790)) >> uint(2)));
    int _4794 = int(_4790) & 3;
    float _4796 = (*spvDescriptorSet0.vp_c9)._m0[int(_4792)][_4794];
    int _4798 = int(_4790) + 1;
    uint _4800 = uint(int(uint(_4798) >> uint(2)));
    int _4802 = _4798 & 3;
    float _4804 = (*spvDescriptorSet0.vp_c9)._m0[int(_4800)][_4802];
    int _4806 = ~_4778;
    int _4808 = _4806 + 1;
    int _4810 = _4808 + 1;
    float _4812 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4814 = int(_4812);
    float _4816 = fma(_4528, _4246, _4704);
    float _4818 = fma(_4528, _4250, _4698);
    float _4820 = fma(_4528, _4242, _4706);
    int _4822 = _4810 * as_type<int>(_4596);
    int _4824 = _4822 + _4776;
    int _4826 = abs(_3126);
    int _4828 = _4580 + 8;
    uint _4830 = uint(int(uint(_4828) >> uint(2)));
    uint _4832 = uint(int(uint(int(_4830)) >> uint(2)));
    int _4834 = int(_4830) & 3;
    float _4836 = (*spvDescriptorSet0.vp_c9)._m0[int(_4832)][_4834];
    int _4838 = int(_4830) + 1;
    uint _4840 = uint(int(uint(_4838) >> uint(2)));
    int _4842 = _4838 & 3;
    float _4844 = (*spvDescriptorSet0.vp_c9)._m0[int(_4840)][_4842];
    float _4846 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4848 = int(_4846);
    int _4850 = ~_4826;
    int _4852 = _4850 + 1;
    int _4854 = _4852 + 1;
    int _4856 = _4634 + 8;
    uint _4858 = uint(int(uint(_4856) >> uint(2)));
    uint _4860 = uint(int(uint(int(_4858)) >> uint(2)));
    int _4862 = int(_4858) & 3;
    float _4864 = (*spvDescriptorSet0.vp_c9)._m0[int(_4860)][_4862];
    int _4866 = int(_4858) + 1;
    uint _4868 = uint(int(uint(_4866) >> uint(2)));
    int _4870 = _4866 & 3;
    float _4872 = (*spvDescriptorSet0.vp_c9)._m0[int(_4868)][_4870];
    int _4874 = ~_4738;
    int _4876 = _4874 + 1;
    int _4878 = _4876 + 1;
    int _4880 = ~_4814;
    int _4882 = _4880 + 1;
    int _4884 = _4878 * as_type<int>(_4666);
    float _4886 = float(uint(_4768));
    int _4888 = _4786 * as_type<int>(_4696);
    int _4890 = abs(_3436);
    float _4892 = _4542 * _4700;
    int _4894 = abs(_3134);
    float _4896 = 1.0 / _4886;
    float _4898 = fma(_4506, _4702, _4892);
    int _4900 = ~_4890;
    int _4902 = _4900 + 1;
    int _4904 = _4902 + 1;
    int _4906 = _4478 * as_type<int>(_4726);
    int _4908 = ~_3396;
    int _4910 = _4908 + 1;
    int _4912 = _4910 + 1;
    float _4914 = float(uint(_4848));
    int _4916 = _4774 * as_type<int>(_4718);
    int _4918 = _4916 + _4906;
    int _4920 = ~_4894;
    int _4922 = _4920 + 1;
    int _4924 = _4922 + 1;
    int _4926 = _4904 * as_type<int>(_4658);
    int _4928 = _4926 + _4884;
    float _4930 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4932 = int(_4930);
    int _4934 = _4912 * as_type<int>(_4688);
    int _4936 = _4934 + _4888;
    int _4938 = abs(_3602);
    int _4940 = _4924 * as_type<int>(_4754);
    int _4942 = _4940 + _4918;
    int _4944 = abs(_3166);
    int _4946 = abs(_3180);
    int _4948 = ~_4944;
    int _4950 = _4948 + 1;
    int _4952 = _4950 + 1;
    int _4954 = ~_4938;
    int _4956 = _4954 + 1;
    int _4958 = _4956 + 1;
    int _4960 = ~_4946;
    int _4962 = _4960 + 1;
    int _4964 = _4962 + 1;
    int _4966 = _4952 * as_type<int>(_4796);
    int _4968 = _4966 + _4928;
    int _4970 = abs(_3446);
    float _4972 = float(uint(_4814));
    int _4974 = _4854 * as_type<int>(_4836);
    int _4976 = _4974 + _4824;
    int _4978 = ~_4970;
    int _4980 = _4978 + 1;
    int _4982 = _4980 + 1;
    float _4984 = 1.0 / _4914;
    int _4986 = abs(_3492);
    int _4988 = _4958 * as_type<int>(_4844);
    int _4990 = _4988 + _4976;
    int _4992 = abs(_3454);
    bool _4994 = !_3496;
    int _4996 = _4994 ? 0 : 1;
    int _4998 = abs(_4932);
    int _5000 = _4964 * as_type<int>(_4864);
    int _5002 = _5000 + _4936;
    int _5004 = ~_4992;
    int _5006 = _5004 + 1;
    int _5008 = _5006 + 1;
    float _5010 = 1.0 / _4972;
    int _5012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _5014 = _5012 != 0;
    int _5016 = abs(_4996);
    int _5018 = _5008 * as_type<int>(_4762);
    int _5020 = _5018 + _4942;
    bool _5022 = !_5014;
    int _5024 = _5022 ? 0 : 1;
    int _5026 = ~_4986;
    int _5028 = _5026 + 1;
    int _5030 = _5028 + 1;
    int _5032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _5034 = _5032 != 0;
    int _5036 = _4982 * as_type<int>(_4804);
    int _5038 = _5036 + _4968;
    int _5040 = abs(_3972);
    float _5042 = _4172 + _4780;
    int _5044 = ~_5016;
    int _5046 = _5044 + 1;
    int _5048 = _5046 + 1;
    int _5050 = ~_5040;
    int _5052 = _5050 + 1;
    int _5054 = _5052 + 1;
    float _5056 = float(uint(_4932));
    int _5058 = abs(_4768);
    int _5060 = _5054 * as_type<int>(_4872);
    int _5062 = _5060 + _5002;
    float _5064 = fma(_4246, _4736, _4740);
    int _5066 = _4990 * _5030;
    int _5068 = abs(_3426);
    float _5070 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5072 = _5042 + _5070;
    float _5074 = _4146 + _5064;
    int _5076 = _5020 * _5048;
    float _5078 = _5072 * _5072;
    float _5080 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5082 = _5074 + _5080;
    int _5084 = _3342 * _5016;
    int _5086 = _5084 + _5076;
    int _5088 = ~_5068;
    int _5090 = _5088 + 1;
    int _5092 = _5090 + 1;
    int _5094 = _3418 * _4986;
    int _5096 = _5094 + _5066;
    float _5098 = fma(_5082, _5082, _5078);
    int _5100 = abs(_5024);
    float _5102 = 1.0 / _5056;
    int _5104 = _5038 * _5092;
    int _5106 = as_type<int>(_4984) + (-2);
    int _5108 = _3394 * _5068;
    int _5110 = _5108 + _5104;
    float _5112 = float(uint(_5086));
    float _5114 = sqrt(_5098);
    int _5116 = as_type<int>(_4896) + (-2);
    float _5118 = float(uint(_5096));
    float _5120 = as_type<float>(_5106) * _5112;
    float _5122 = float(uint(_5058));
    int _5124 = ~_5100;
    int _5126 = _5124 + 1;
    int _5128 = _5126 + 1;
    float _5130 = as_type<float>(_5116) * _5118;
    int _5132 = as_type<int>(_5102) + (-2);
    float _5134 = 1.0 / _5122;
    int _5136 = _5062 * _5128;
    int _5138 = abs(_4848);
    float _5140 = float(uint(_5110));
    int _5142 = _3478 * _5100;
    int _5144 = _5142 + _5136;
    int _5146 = ~_4848;
    int _5148 = _5146 + 1;
    float _5150 = trunc(_5120);
    float _5152 = precise::max(_5150, 0.0);
    uint _5154 = uint(_5152);
    int _5156 = abs(_4814);
    float _5158 = as_type<float>(_5132) * _5140;
    int _5160 = as_type<int>(_5010) + (-2);
    float _5162 = float(uint(_5138));
    float _5164 = trunc(_5130);
    float _5166 = precise::max(_5164, 0.0);
    uint _5168 = uint(_5166);
    float _5170 = float(uint(_5156));
    float _5172 = float(uint(_5144));
    int _5174 = ~_4768;
    int _5176 = _5174 + 1;
    int _5178 = as_type<int>(_5134) + (-2);
    int _5180 = _5148 * int(_5154);
    int _5182 = _5180 + _5086;
    float _5184 = 1.0 / _5162;
    float _5186 = as_type<float>(_5160) * _5172;
    float _5188 = float(uint(_4998));
    float _5190 = float(uint(_5182));
    int _5192 = abs(_5086);
    int _5194 = _5176 * int(_5168);
    int _5196 = _5194 + _5096;
    float _5198 = 1.0 / _5170;
    float _5200 = as_type<float>(_5106) * _5190;
    int _5202 = abs(_5144);
    float _5204 = float(uint(_5196));
    float _5206 = 1.0 / _5188;
    float _5208 = as_type<float>(_5116) * _5204;
    float _5210 = fma(_4538, _4246, _4644);
    float _5212 = fma(_4538, _4250, _4646);
    int _5214 = as_type<int>(_5184) + (-2);
    float _5216 = fma(_4250, _4736, _4898);
    float _5218 = float(uint(_5192));
    float _5220 = trunc(_5158);
    float _5222 = precise::max(_5220, 0.0);
    uint _5224 = uint(_5222);
    int _5226 = as_type<int>(_5198) + (-2);
    float _5228 = _4134 + _5216;
    float _5230 = float(uint(_5202));
    float _5232 = as_type<float>(_5214) * _5218;
    int _5234 = abs(_5096);
    float _5236 = fma(_4538, _4242, _4670);
    float _5238 = _233 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5240 = trunc(_5186);
    float _5242 = precise::max(_5240, 0.0);
    uint _5244 = uint(_5242);
    float _5246 = float(uint(_5234));
    float _5248 = as_type<float>(_5226) * _5230;
    int _5250 = ~_4932;
    int _5252 = _5250 + 1;
    out.m_84.x = _5210;
    out.m_84.y = _5212;
    out.m_84.z = _5236;
    float _5254 = as_type<float>(_5178) * _5246;
    float _5256 = -_227;
    int _5258 = _4080 ? as_type<int>(_5256) : as_type<int>(_227);
    float _5260 = trunc(_5232);
    float _5262 = precise::max(_5260, 0.0);
    uint _5264 = uint(_5262);
    float _5266 = -_227;
    int _5268 = _4084 ? as_type<int>(_5266) : as_type<int>(_227);
    int _5270 = abs(_5110);
    int _5272 = as_type<int>(_5206) + (-2);
    float _5274 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5276 = _5184;
    float _5278 = _5074;
    float _5280 = _5042;
    if (!_3668)
    {
        _5276 = _227;
    }
    float _5282 = _5276;
    int _5284 = _4882 * int(_5244);
    int _5286 = _5284 + _5144;
    float _5288 = _5282;
    if (_3668)
    {
        float _5290 = -_227;
        float _5292 = _4020 ? _5290 : _227;
        _5288 = _5292;
    }
    float _5294 = _5288;
    float _5296 = trunc(_5254);
    float _5298 = precise::max(_5296, 0.0);
    uint _5300 = uint(_5298);
    bool _5302 = !_5034;
    float _5304 = _5302 ? _227 : as_type<float>(_5258);
    bool _5306 = !_3654;
    float _5308 = _5306 ? _227 : as_type<float>(_5268);
    int _5310 = _5252 * int(_5224);
    int _5312 = _5310 + _5110;
    float _5314 = float(uint(_5270));
    float _5316 = _5238 * _4672;
    float _5318 = float(uint(_5286));
    float _5320 = _5238 * _4676;
    float _5322 = float(uint(_5312));
    float _5324 = as_type<float>(_5272) * _5314;
    float _5326 = _5238 * _4674;
    float _5328 = fma(_5274, _5210, _5316);
    float _5330 = as_type<float>(_5160) * _5318;
    float _5332 = as_type<float>(_5132) * _5322;
    float _5334 = fma(_5274, _5212, _5326);
    float _5336 = fma(_5274, _5236, _5320);
    bool _5338 = _5114 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5340 = trunc(_5324);
    float _5342 = precise::max(_5340, 0.0);
    uint _5344 = uint(_5342);
    int _5346 = ~_5058;
    int _5348 = _5346 + 1;
    int _5350 = ~_5138;
    int _5352 = _5350 + 1;
    float _5354 = trunc(_5248);
    float _5356 = precise::max(_5354, 0.0);
    uint _5358 = uint(_5356);
    int _5360 = ~_4998;
    int _5362 = _5360 + 1;
    int _5364 = _5348 * int(_5300);
    int _5366 = _5364 + _5234;
    float _5368 = as_type<float>(_5348);
    if (!_5338)
    {
        _5368 = _5074;
    }
    float _5370 = _5368;
    int _5372 = _5352 * int(_5264);
    int _5374 = _5372 + _5192;
    float _5376 = _5370;
    if (!_5338)
    {
        _5278 = _5042;
    }
    float _5378 = _5278;
    float _5380 = trunc(_5208);
    float _5382 = precise::max(_5380, 0.0);
    uint _5384 = uint(_5382);
    float _5386 = float(uint(_5366));
    float _5388 = _5378;
    if (!_5338)
    {
        _5280 = _5228;
    }
    float _5390 = _5280;
    float _5392 = trunc(_5200);
    float _5394 = precise::max(_5392, 0.0);
    uint _5396 = uint(_5394);
    float _5398 = trunc(_5332);
    float _5400 = precise::max(_5398, 0.0);
    uint _5402 = uint(_5400);
    float _5404 = trunc(_5330);
    float _5406 = precise::max(_5404, 0.0);
    uint _5408 = uint(_5406);
    bool _5410 = !_5338;
    float _5412 = _5390;
    if (!_5410)
    {
        float _5414 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5416 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5418 = _5114 + _5416;
        float _5420 = rsqrt(_5098);
        float _5422 = _5418 * _5414;
        float _5424 = _5228 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5426 = _5422 * 0.15915493667125701904296875;
        float _5428 = _5426 * 6.283185482025146484375;
        float _5430 = cos(_5428);
        float _5432 = _5426 * 6.283185482025146484375;
        float _5434 = sin(_5432);
        float _5436 = _5430 + (-1.0);
        float _5438 = _5436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5440 = fma(_5434, _5424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5442 = fma(_5228, _5430, _5438);
        float _5444 = _5420 * _5440;
        float _5446 = fma(_5082, _5444, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5448 = fma(_5072, _5444, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5412 = _5442;
        _5376 = _5446;
        _5388 = _5448;
    }
    float _5450 = _5412;
    float _5452 = _5376;
    float _5454 = _5388;
    int _5456 = _5362 * int(_5344);
    int _5458 = _5456 + _5270;
    int _5460 = ~_5156;
    int _5462 = _5460 + 1;
    float _5464 = as_type<float>(_5178) * _5386;
    float _5466 = float(uint(_5374));
    float _5468 = -_159;
    float _5470 = fma(_5468, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4426);
    float _5472 = float(uint(_5458));
    float _5474 = trunc(_5464);
    float _5476 = precise::max(_5474, 0.0);
    uint _5478 = uint(_5476);
    int _5480 = int(_5244) + int(_5408);
    float _5482 = as_type<float>(_5214) * _5466;
    int _5484 = int(_5168) + int(_5384);
    float _5486 = as_type<float>(_5272) * _5472;
    int _5488 = _5462 * int(_5358);
    int _5490 = _5488 + _5202;
    int _5492 = int(_5154) + int(_5396);
    float _5494 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[76].y, _4142);
    int _5496 = ~_4768;
    int _5498 = _5496 + 1;
    float _5500 = trunc(_5482);
    float _5502 = precise::max(_5500, 0.0);
    uint _5504 = uint(_5502);
    float _5506 = float(uint(_5490));
    float _5508 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4230);
    int _5510 = ~_4848;
    int _5512 = _5510 + 1;
    float _5514 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4106);
    int _5516 = ~_4932;
    int _5518 = _5516 + 1;
    float _5520 = as_type<float>(_5226) * _5506;
    int _5522 = ~_4814;
    int _5524 = _5522 + 1;
    int _5526 = _5512 * _5492;
    int _5528 = _5526 + _5086;
    int _5530 = int(_5224) + int(_5402);
    int _5532 = _5498 * _5484;
    int _5534 = _5532 + _5096;
    float _5536 = trunc(_5520);
    float _5538 = precise::max(_5536, 0.0);
    uint _5540 = uint(_5538);
    float _5542 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4082);
    bool _5544 = uint(_5534) >= uint(_4768);
    int _5546 = _5518 * _5530;
    int _5548 = _5546 + _5110;
    int _5550 = int(_5300) + int(_5478);
    int _5552 = _5524 * _5480;
    int _5554 = _5552 + _5144;
    int _5556 = int(_5264) + int(_5504);
    float _5558 = trunc(_5486);
    float _5560 = precise::max(_5558, 0.0);
    uint _5562 = uint(_5560);
    bool _5564 = uint(_5548) >= uint(_4932);
    float _5566 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4434);
    bool _5568 = uint(_5554) >= uint(_4814);
    float _5570 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[92].z, _4094);
    int _5572 = ~_5058;
    int _5574 = _5572 + 1;
    float _5576 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4060);
    int _5578 = ~_5138;
    int _5580 = _5578 + 1;
    float _5582 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4156);
    int _5584 = int(_5358) + int(_5540);
    int _5586 = _5574 * _5550;
    int _5588 = _5586 + _5234;
    bool _5590 = uint(_5528) >= uint(_4848);
    int _5592 = _5580 * _5556;
    int _5594 = _5592 + _5192;
    int _5596 = ~_4998;
    int _5598 = _5596 + 1;
    float _5600 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4086);
    bool _5602 = !_5544;
    int _5604 = _5602 ? 0 : (-1);
    float _5606 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4078);
    int _5608 = int(_5344) + int(_5562);
    float _5610 = -_5600;
    float _5612 = _5610 + 1.0;
    int _5614 = ~_5484;
    int _5616 = _5614 + _5604;
    int _5618 = _5616 + 1;
    float _5620 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4058);
    bool _5622 = uint(_5594) >= uint(_5138);
    int _5624 = _5598 * _5608;
    int _5626 = _5624 + _5270;
    bool _5628 = !_5590;
    int _5630 = _5628 ? 0 : (-1);
    int _5632 = _4768 * _5618;
    int _5634 = _5632 + _5096;
    int _5636 = ~_5156;
    int _5638 = _5636 + 1;
    float _5640 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4136);
    int _5642 = ~_5492;
    int _5644 = _5642 + _5630;
    int _5646 = _5644 + 1;
    float _5648 = -_5576;
    float _5650 = _5648 + 1.0;
    bool _5652 = _4768 == 0;
    int _5654 = _5638 * _5584;
    int _5656 = _5654 + _5202;
    bool _5658 = uint(_5626) >= uint(_4998);
    int _5660 = _4848 * _5646;
    int _5662 = _5660 + _5086;
    bool _5664 = uint(_5588) >= uint(_5058);
    float _5666 = -_5606;
    float _5668 = _5666 + 1.0;
    bool _5670 = !_5564;
    int _5672 = _5670 ? 0 : (-1);
    float _5674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _5676 = !_5652;
    int _5678 = _5676 ? _5634 : (-1);
    float _5680 = -_5640;
    float _5682 = _5680 + 1.0;
    int _5684 = ~_5530;
    int _5686 = _5684 + _5672;
    int _5688 = _5686 + 1;
    bool _5690 = _4848 == 0;
    int _5692 = _5096 ^ _4768;
    int _5694 = _4932 * _5688;
    int _5696 = _5694 + _5110;
    bool _5698 = !_5622;
    int _5700 = _5698 ? 0 : (-1);
    float _5702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _5704 = !_5690;
    int _5706 = _5704 ? _5662 : (-1);
    bool _5708 = uint(_5656) >= uint(_5156);
    int _5710 = _5086 ^ _4848;
    float _5712 = _5674 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _5714 = _4932 == 0;
    float _5716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _5718 = _4932 == 0;
    int _5720 = _5110 ^ _4932;
    bool _5722 = !_5568;
    int _5724 = _5722 ? 0 : (-1);
    bool _5726 = !_5658;
    int _5728 = _5726 ? 0 : (-1);
    uint _5730 = uint(int(uint(_5692) >> uint(31)));
    bool _5732 = !_5664;
    int _5734 = _5732 ? 0 : (-1);
    uint _5736 = uint(int(uint(_5710) >> uint(31)));
    int _5738 = ~_5728;
    int _5740 = _5608 + _5738;
    int _5742 = _5740 + 1;
    float _5744 = _5716 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _5746 = ~_5480;
    int _5748 = _5746 + _5724;
    int _5750 = _5748 + 1;
    int _5752 = ~int(_5730);
    int _5754 = _5752 + 1;
    float _5756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _5758 = ~_5734;
    int _5760 = _5550 + _5758;
    int _5762 = _5760 + 1;
    int _5764 = _4814 * _5750;
    int _5766 = _5764 + _5144;
    float _5768 = float(_5678);
    float _5770 = -_159;
    float _5772 = fma(_5770, (*spvDescriptorSet0.vp_c9)._m0[76].x, _4200);
    int _5774 = ~_5700;
    int _5776 = _5556 + _5774;
    int _5778 = _5776 + 1;
    int _5780 = ~int(_5736);
    int _5782 = _5780 + 1;
    float _5784 = fma(_5712, _5768, _5772);
    bool _5786 = !_5708;
    int _5788 = _5786 ? 0 : (-1);
    float _5790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5792 = _5778 ^ _5782;
    uint _5794 = uint(int(uint(_5720) >> uint(31)));
    int _5796 = ~_5788;
    int _5798 = _5584 + _5796;
    int _5800 = _5798 + 1;
    float _5802 = _5756 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _5804 = ~_5782;
    int _5806 = _5804 + _5792;
    int _5808 = _5806 + 1;
    float _5810 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    int _5812 = ~int(_5794);
    int _5814 = _5812 + 1;
    bool _5816 = !_5714;
    int _5818 = _5816 ? _5696 : (-1);
    int _5820 = _5144 ^ _4814;
    float _5822 = -_5542;
    float _5824 = _5822 + 1.0;
    float _5826 = float(_5818);
    bool _5828 = _4814 == 0;
    uint _5830 = uint(int(uint(_5820) >> uint(31)));
    float _5832 = fma(_5802, _5826, _5470);
    bool _5834 = !_5828;
    int _5836 = _5834 ? _5766 : (-1);
    int _5838 = ~int(_5830);
    int _5840 = _5838 + 1;
    float _5842 = _5810 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _5844 = _5762 ^ _5754;
    float _5846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _5848 = float(_5836);
    float _5850 = _5308 + 0.5;
    int _5852 = _5800 ^ _5840;
    bool _5854 = _4768 == 0;
    float _5856 = fma(_5712, _5850, _5784);
    int _5858 = ~_5754;
    int _5860 = _5858 + _5844;
    int _5862 = _5860 + 1;
    float _5864 = -_159;
    float _5866 = fma(_5864, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4226);
    int _5868 = _5742 ^ _5814;
    float _5870 = _5702 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _5872 = float(_5706);
    float _5874 = -_5668;
    float _5876 = fma(_5308, _5874, _5856);
    int _5878 = ~_5840;
    int _5880 = _5878 + _5852;
    int _5882 = _5880 + 1;
    float _5884 = -_4336;
    float _5886 = _4172 + _5884;
    int _5888 = ~_5814;
    int _5890 = _5888 + _5868;
    int _5892 = _5890 + 1;
    float _5894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _5896 = !_5854;
    int _5898 = _5896 ? _5862 : (-1);
    float _5900 = -_159;
    float _5902 = fma(_5900, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4112);
    float _5904 = fma(_5744, _5872, _5866);
    float _5906 = _5304 + 0.5;
    float _5908 = float(_5898);
    float _5910 = fma(_5842, _5848, _5902);
    bool _5912 = _4848 == 0;
    float _5914 = _5294 + 0.5;
    bool _5916 = _4814 == 0;
    float _5918 = fma(_5744, _5906, _5904);
    bool _5920 = !_5912;
    int _5922 = _5920 ? _5808 : (-1);
    float _5924 = _1843 + 0.5;
    float _5926 = -_5494;
    float _5928 = fma(_5870, _5908, _5926);
    float _5930 = fma(_5842, _5914, _5910);
    bool _5932 = !_5718;
    int _5934 = _5932 ? _5892 : (-1);
    float _5936 = fma(_5802, _5924, _5832);
    bool _5938 = !_5916;
    int _5940 = _5938 ? _5882 : (-1);
    float _5942 = _5790 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5944 = float(_5934);
    float _5946 = _4472 + (-0.5);
    float _5948 = float(_5922);
    float _5950 = _5894 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _5952 = float(_5940);
    float _5954 = fma(_5238, _5238, 1.0);
    float _5956 = _5846 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5958 = -_5870;
    float _5960 = fma(_5958, _5946, _5928);
    float _5962 = -_5508;
    float _5964 = fma(_5942, _5948, _5962);
    float _5966 = -_5514;
    float _5968 = fma(_5950, _5952, _5966);
    float _5970 = _1901 + (-0.5);
    float _5972 = _1603 + (-0.5);
    float _5974 = rsqrt(_5954);
    float _5976 = -_5566;
    float _5978 = fma(_5956, _5944, _5976);
    float _5980 = -_5942;
    float _5982 = fma(_5980, _5970, _5964);
    float _5984 = -_5950;
    float _5986 = fma(_5984, _5972, _5968);
    float _5988 = -_4134;
    float _5990 = _5988 + _5450;
    float _5992 = _1847 + (-0.5);
    float _5994 = -_5570;
    float _5996 = _5994 + 1.0;
    float _5998 = fma(_5824, _1603, _5986);
    float _6000 = _5990 * _5990;
    float _6002 = -_4146;
    float _6004 = _6002 + _5452;
    float _6006 = -_5956;
    float _6008 = fma(_6006, _5992, _5978);
    float _6010 = -_5996;
    float _6012 = fma(_6010, _5294, _5930);
    float _6014 = -_4172;
    float _6016 = _6014 + _5454;
    float _6018 = fma(_6004, _6004, _6000);
    float _6020 = fma(_1847, _5650, _6008);
    float _6022 = -_5582;
    float _6024 = _6022 + 1.0;
    float _6026 = _5238 * _5974;
    float _6028 = fma(_6016, _6016, _6018);
    float _6030 = -_5612;
    float _6032 = fma(_1843, _6030, _5936);
    float _6034 = fma(_1901, _6024, _5982);
    float _6036 = -_4818;
    float _6038 = _6026 * _6036;
    float _6040 = sqrt(_6028);
    float _6042 = -_4820;
    float _6044 = _6026 * _6042;
    float _6046 = _4816 + _5328;
    float _6048 = fma(_5974, _4674, _6038);
    float _6050 = _4818 + _5334;
    float _6052 = fma(_5974, _4676, _6044);
    float _6054 = _4820 + _5336;
    out.m_86.x = _6032;
    out.m_86.y = _6020;
    float _6056 = -_4816;
    float _6058 = _6026 * _6056;
    float _6060 = -_5620;
    float _6062 = _6060 + 1.0;
    float _6064 = -_5682;
    float _6066 = fma(_5304, _6064, _5918);
    out.m_88.x = _6012;
    out.m_88.y = _5998;
    float _6068 = fma(_5974, _4672, _6058);
    float _6070 = fma(_4472, _6062, _5960);
    float _6072 = -_4320;
    float _6074 = _6072 + _5452;
    out.m_90.x = _6046;
    out.m_90.y = _6050;
    out.m_90.z = _6054;
    bool _6076 = _6040 > 0.0;
    float _6078 = -_4288;
    float _6080 = _6078 + _5450;
    float _6082 = -_4336;
    float _6084 = _6082 + _5454;
    out.m_92.x = _6068;
    out.m_92.y = _6048;
    out.m_92.z = _6052;
    float _6086 = -_4320;
    float _6088 = _4146 + _6086;
    float _6090 = -_4288;
    float _6092 = _4134 + _6090;
    out.m_94.x = _5876;
    out.m_94.y = _6070;
    out.m_94.z = _6066;
    out.m_94.w = _6034;
    float _6094 = _5450;
    float _6096 = _6052;
    float _6098 = _6070;
    float _6100 = _5876;
    float _6102 = _6048;
    float _6104 = _5582;
    if (!_6076)
    {
        _6094 = _6074;
    }
    float _6106 = _6094;
    float _6108 = _6106;
    float _6110 = _6106;
    if (!_6076)
    {
        _6096 = _6080;
    }
    float _6112 = _6096;
    float _6114 = _6112;
    float _6116 = _6112;
    if (!_6076)
    {
        _6098 = _6084;
    }
    float _6118 = _6098;
    bool _6120 = !_6076;
    float _6122 = _6118;
    float _6124 = _6118;
    if (!_6120)
    {
        bool _6126 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _6128 = _6068;
        if (_6126)
        {
            float _6130 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _6128 = _6130;
        }
        float _6132 = _6128;
        float _6134 = _6132;
        if (_6126)
        {
            float _6136 = _513 * _6132;
            _6100 = _6136;
        }
        float _6138 = _6100;
        float _6140 = _6138;
        if (_6126)
        {
            float _6142 = _515 * _6132;
            _6102 = _6142;
        }
        float _6144 = _6102;
        float _6146 = _6144;
        if (_6126)
        {
            float _6148 = _517 * _6132;
            _6134 = _6148;
        }
        float _6150 = _6134;
        float _6152 = _6150;
        float _6154 = _6150;
        if (!_6126)
        {
            bool _6156 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _6158 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _6160 = _6156 || _6158;
            bool _6162 = isnan(1.0);
            bool _6164 = _6160 || _6162;
            float _6166 = _159 + 1.0;
            float _6168 = _6166;
            if (!_6164)
            {
                float _6170 = _6166 * _6166;
                float _6172 = _6170 * 0.5;
                _6152 = _6172;
            }
            float _6174 = _6152;
            float _6176 = _6174;
            if (!_6164)
            {
                float _6178 = _6174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _6176 = _6178;
            }
            float _6180 = _6176;
            bool _6182 = !_6164;
            float _6184 = _6180;
            if (!_6182)
            {
                float _6186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6188 = log2(_6186);
                float _6190 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6192 = _6188 * _6166;
                float _6194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _6196 = 1.0 + _6194;
                float _6198 = 1.0 / _6196;
                float _6200 = _6190 * 0.693147182464599609375;
                float _6202 = exp2(_6192);
                float _6204 = 1.0 / _6200;
                float _6206 = _6202 + (-1.0);
                float _6208 = -_6206;
                float _6210 = fma(_6208, _6204, _6166);
                float _6212 = _6210 * _6198;
                float _6214 = _6212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _6184 = _6214;
            }
            float _6216 = _6184;
            float _6218 = _6216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _6220 = _6216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _6222 = !_6164;
            if (!_6222)
            {
                float _6224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _6226 = log2(_6224);
                float _6228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _6230 = 1.0 + _6228;
                float _6232 = 1.0 / _6230;
                float _6234 = _6226 * _6166;
                float _6236 = exp2(_6234);
                float _6238 = -_6236;
                float _6240 = _6238 + 1.0;
                float _6242 = _6240 * _6232;
                _6168 = _6242;
            }
            float _6244 = _6168;
            float _6246 = fma(_6244, _211, _6220);
            float _6248 = _6216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _6250 = fma(_6244, _209, _6218);
            float _6252 = -_433;
            float _6254 = _6252 + _6246;
            float _6256 = fma(_6244, _213, _6248);
            float _6258 = -_441;
            float _6260 = _6258 + _6250;
            float _6262 = _6254 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _6264 = _6254 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _6266 = -_449;
            float _6268 = _6266 + _6256;
            float _6270 = fma(_6260, (*spvDescriptorSet0.vp_c10)._m0[14].y, _6262);
            float _6272 = fma(_6260, (*spvDescriptorSet0.vp_c10)._m0[14].x, _6264);
            float _6274 = _6254 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _6276 = _6254 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _6278 = fma(_6268, (*spvDescriptorSet0.vp_c10)._m0[16].y, _6270);
            float _6280 = fma(_6268, (*spvDescriptorSet0.vp_c10)._m0[16].x, _6272);
            float _6282 = fma(_6260, (*spvDescriptorSet0.vp_c10)._m0[14].z, _6274);
            float _6284 = fma(_6260, (*spvDescriptorSet0.vp_c10)._m0[14].w, _6276);
            float _6286 = _437 * _6278;
            float _6288 = _199 * _6280;
            float _6290 = fma(_6268, (*spvDescriptorSet0.vp_c10)._m0[16].z, _6282);
            float _6292 = fma(_6268, (*spvDescriptorSet0.vp_c10)._m0[16].w, _6284);
            float _6294 = _6286 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _6296 = _6286 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _6298 = _6286 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _6300 = _457 * _6290;
            float _6302 = fma(_6288, (*spvDescriptorSet0.vp_c8)._m0[24].x, _6294);
            float _6304 = fma(_6288, (*spvDescriptorSet0.vp_c8)._m0[25].x, _6296);
            float _6306 = fma(_6288, (*spvDescriptorSet0.vp_c8)._m0[26].x, _6298);
            float _6308 = fma(_6300, (*spvDescriptorSet0.vp_c8)._m0[24].z, _6302);
            float _6310 = fma(_6300, (*spvDescriptorSet0.vp_c8)._m0[25].z, _6304);
            float _6312 = fma(_6300, (*spvDescriptorSet0.vp_c8)._m0[26].z, _6306);
            float _6314 = fma(_6292, (*spvDescriptorSet0.vp_c8)._m0[24].w, _6308);
            float _6316 = fma(_6292, (*spvDescriptorSet0.vp_c8)._m0[25].w, _6310);
            float _6318 = fma(_6292, (*spvDescriptorSet0.vp_c8)._m0[26].w, _6312);
            _521 = _6316;
            _523 = _6314;
            _525 = _6318;
            _6140 = _6314;
            _6146 = _6316;
            _6154 = _6318;
            _6122 = _6248;
            _6114 = _6310;
        }
        float _6320 = _521;
        float _6322 = _523;
        float _6324 = _525;
        float _6326 = _6140;
        float _6328 = _6146;
        float _6330 = _6154;
        float _6332 = _6122;
        float _6334 = _6114;
        float _6336 = _6320 * _6320;
        float _6338 = rsqrt(_6028);
        float _6340 = fma(_6322, _6322, _6336);
        float _6342 = fma(_6324, _6324, _6340);
        float _6344 = sqrt(_6342);
        float _6346 = _6004 * _6338;
        float _6348 = _5990 * _6338;
        float _6350 = _6016 * _6338;
        bool _6352 = _6344 > 0.0;
        float _6354 = _6334;
        float _6356 = _6332;
        if (!_6352)
        {
            _6108 = _6074;
        }
        float _6358 = _6108;
        _6110 = _6358;
        if (!_6352)
        {
            _6354 = _6080;
        }
        float _6360 = _6354;
        _6116 = _6360;
        if (!_6352)
        {
            _6356 = _6084;
        }
        float _6362 = _6356;
        bool _6364 = !_6352;
        _6124 = _6362;
        if (!_6364)
        {
            float _6366 = rsqrt(_6342);
            float _6368 = _6366 * _6320;
            float _6370 = _6366 * _6322;
            float _6372 = _6366 * _6324;
            float _6374 = _6348 * _6368;
            float _6376 = fma(_6346, _6370, _6374);
            float _6378 = fma(_6350, _6372, _6376);
            float _6380 = _6378 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6382 = fma(_6326, _6380, _6074);
            float _6384 = fma(_6328, _6380, _6080);
            float _6386 = fma(_6330, _6380, _6084);
            _6124 = _6386;
            _6116 = _6384;
            _6110 = _6382;
        }
    }
    float _6388 = _6124;
    float _6390 = _6116;
    float _6392 = _6110;
    float _6394 = fma(_6088, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6396 = fma(_5886, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6398 = floor(_6394);
    float _6400 = floor(_6396);
    float _6402 = -_6398;
    float _6404 = _6394 + _6402;
    float _6406 = -_6400;
    float _6408 = _6396 + _6406;
    float2 _17130 = float2(_6404, _6408);
    float _6410 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_17130, float2(0.0), isnan(_17130)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_17130, float2(0.0), isnan(_17130)), level(0.0)).x;
    float _6412 = _6092 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _6414 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _6416 = fma(_6088, (*spvDescriptorSet0.vp_c8)._m0[11].x, _6412);
    bool _6418 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _6420 = isnan(0.5);
    bool _6422 = _6418 || _6420;
    bool _6424 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _6426 = _6422 || _6424;
    float _6428 = _6092 + _6414;
    float _6430 = fma(_5886, (*spvDescriptorSet0.vp_c8)._m0[11].z, _6416);
    float _6432 = _6092 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6434 = _6430 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6436 = fma(_6088, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6432);
    float _6438 = 1.0 / _6434;
    float _6440 = fma(_5886, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6436);
    float _6442 = _6440 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6444 = _6442 + _6434;
    float _6446 = _6444 * _6438;
    float _6448 = _6446 * 0.5;
    float _6450 = _6428 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _6452 = _6438;
    int _6454 = 2;
    if (_6426)
    {
        _6452 = _6388;
    }
    float _6456 = _6452;
    float _6458 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6460 = fma(_6448, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6458);
    float _6462 = fma(_6088, (*spvDescriptorSet0.vp_c15)._m0[126].x, _6450);
    float _6464 = fma(_5886, (*spvDescriptorSet0.vp_c15)._m0[126].z, _6462);
    float _6466 = 1.0 / _6460;
    float _6468 = _6464 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _6470 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6472 = _6466 * _6470;
    float _6474 = _6428 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _6476 = _6472 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _6478 = fma(_6088, (*spvDescriptorSet0.vp_c15)._m0[127].x, _6474);
    bool _6480 = _6472 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _6482 = !_6476;
    int _6484 = _6482 ? 0 : 1;
    float _6486 = fma(_5886, (*spvDescriptorSet0.vp_c15)._m0[127].z, _6478);
    float _6488 = _6486 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _6490 = _6456;
    if (!_6476)
    {
        _6454 = 1;
    }
    int _6492 = _6454;
    float _6494 = trunc(_6488);
    int _6496 = int(_6494);
    int _6498 = _6492;
    if (!_6480)
    {
        _6498 = _6484;
    }
    int _6500 = _6498;
    int _6502 = _6500 << 6;
    float _6504 = trunc(_6468);
    int _6506 = int(_6504);
    int _6508 = _6502 + 48;
    uint _6510 = uint(int(uint(_6508) >> uint(2)));
    uint _6512 = uint(int(uint(int(_6510)) >> uint(2)));
    int _6514 = int(_6510) & 3;
    float _6516 = (*spvDescriptorSet0.vp_c15)._m0[int(_6512)][_6514];
    int _6518 = int(_6510) + 1;
    uint _6520 = uint(int(uint(_6518) >> uint(2)));
    int _6522 = _6518 & 3;
    float _6524 = (*spvDescriptorSet0.vp_c15)._m0[int(_6520)][_6522];
    int _6526 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _6528 = _6496 + _6526;
    int _6530 = _6528 + 1;
    int _6532 = _6502 + 56;
    uint _6534 = uint(int(uint(_6532) >> uint(2)));
    uint _6536 = uint(int(uint(int(_6534)) >> uint(2)));
    int _6538 = int(_6534) & 3;
    float _6540 = (*spvDescriptorSet0.vp_c15)._m0[int(_6536)][_6538];
    int _6542 = int(_6534) + 1;
    uint _6544 = uint(int(uint(_6542) >> uint(2)));
    int _6546 = _6542 & 3;
    float _6548 = (*spvDescriptorSet0.vp_c15)._m0[int(_6544)][_6546];
    float _6550 = as_type<float>(_6496);
    float _6552 = as_type<float>(_6500);
    if (_6426)
    {
        _6550 = _6390;
    }
    float _6554 = _6550;
    int _6556 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _6558 = _6506 + _6556;
    int _6560 = _6558 + 1;
    int _6562 = _6502 + 64;
    uint _6564 = uint(int(uint(_6562) >> uint(2)));
    uint _6566 = uint(int(uint(int(_6564)) >> uint(2)));
    int _6568 = int(_6564) & 3;
    float _6570 = (*spvDescriptorSet0.vp_c15)._m0[int(_6566)][_6568];
    int _6572 = int(_6564) + 1;
    uint _6574 = uint(int(uint(_6572) >> uint(2)));
    int _6576 = _6572 & 3;
    float _6578 = (*spvDescriptorSet0.vp_c15)._m0[int(_6574)][_6576];
    bool _6580 = _6560 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _6582 = _6560 | _6530;
    int _6584 = _6502 + 72;
    uint _6586 = uint(int(uint(_6584) >> uint(2)));
    uint _6588 = uint(int(uint(int(_6586)) >> uint(2)));
    int _6590 = int(_6586) & 3;
    float _6592 = (*spvDescriptorSet0.vp_c15)._m0[int(_6588)][_6590];
    int _6594 = int(_6586) + 1;
    uint _6596 = uint(int(uint(_6594) >> uint(2)));
    int _6598 = _6594 & 3;
    float _6600 = (*spvDescriptorSet0.vp_c15)._m0[int(_6596)][_6598];
    bool _6602 = _6582 < 0;
    bool _6604 = _6602 || _6580;
    float _6606 = as_type<float>(_6582);
    float _6608 = _6554;
    int _6610 = _6560;
    if (_6426)
    {
        _6606 = _6392;
    }
    float _6612 = _6606;
    bool _6614 = _6530 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _6616 = _6614 || _6604;
    int _6618 = _6502 + 96;
    uint _6620 = uint(int(uint(_6618) >> uint(2)));
    uint _6622 = uint(int(uint(int(_6620)) >> uint(2)));
    int _6624 = int(_6620) & 3;
    float _6626 = (*spvDescriptorSet0.vp_c15)._m0[int(_6622)][_6624];
    int _6628 = int(_6620) + 1;
    uint _6630 = uint(int(uint(_6628) >> uint(2)));
    int _6632 = _6628 & 3;
    float _6634 = (*spvDescriptorSet0.vp_c15)._m0[int(_6630)][_6632];
    int _6636 = _6502 + 104;
    uint _6638 = uint(int(uint(_6636) >> uint(2)));
    uint _6640 = uint(int(uint(int(_6638)) >> uint(2)));
    int _6642 = int(_6638) & 3;
    float _6644 = (*spvDescriptorSet0.vp_c15)._m0[int(_6640)][_6642];
    int _6646 = int(_6638) + 1;
    uint _6648 = uint(int(uint(_6646) >> uint(2)));
    int _6650 = _6646 & 3;
    float _6652 = (*spvDescriptorSet0.vp_c15)._m0[int(_6648)][_6650];
    float _6654 = _6612;
    int _6656 = as_type<int>(_6524);
    int _6658 = as_type<int>(_6516);
    if (!_6426)
    {
        float _6660 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _6662 = _6092 + _6660;
        float _6664 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _6666 = _6088 + _6664;
        float _6668 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6670 = -_6088;
        float _6672 = _6670 + _6392;
        float _6674 = _6662 * _6662;
        float _6676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _6678 = _5886 + _6676;
        float _6680 = -_6092;
        float _6682 = _6680 + _6390;
        float _6684 = -_5886;
        float _6686 = _6684 + _6388;
        float _6688 = fma(_6666, _6666, _6674);
        float _6690 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6692 = fma(_6678, _6678, _6688);
        float _6694 = sqrt(_6692);
        float _6696 = _6668 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6698 = precise::min(_6694, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6700 = _6698 * _6690;
        float _6702 = _6696 * _6700;
        float _6704 = fma(_6672, _6702, _6088);
        float _6706 = fma(_6682, _6702, _6092);
        float _6708 = fma(_6686, _6702, _5886);
        _6608 = _6706;
        _6654 = _6704;
        _6490 = _6708;
    }
    float _6710 = _6608;
    float _6712 = _6654;
    float _6714 = _6490;
    float _6716 = _6428 * _6634;
    if (!_6616)
    {
        int _6718 = _6530 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _6720 = _6718 + _6560;
        _6610 = _6720;
    }
    int _6722 = _6610;
    float _6724 = _6710 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6726 = _6428 * _6578;
    float _6728 = fma(_6088, _6626, _6716);
    float _6730 = _6428 * _6524;
    float _6732 = fma(_6712, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6724);
    if (!_6616)
    {
        int _6734 = _6722 << 2;
        _6656 = _6734;
    }
    int _6736 = _6656;
    float _6738 = fma(_5886, _6644, _6728);
    float _6740 = fma(_6088, _6516, _6730);
    int _6742 = _6502 + 80;
    uint _6744 = uint(int(uint(_6742) >> uint(2)));
    uint _6746 = uint(int(uint(int(_6744)) >> uint(2)));
    int _6748 = int(_6744) & 3;
    float _6750 = (*spvDescriptorSet0.vp_c15)._m0[int(_6746)][_6748];
    int _6752 = int(_6744) + 1;
    uint _6754 = uint(int(uint(_6752) >> uint(2)));
    int _6756 = _6752 & 3;
    float _6758 = (*spvDescriptorSet0.vp_c15)._m0[int(_6754)][_6756];
    float _6760 = fma(_6714, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6732);
    float _6762 = _6738 + _6652;
    int _6764 = _6736;
    if (!_6616)
    {
        uint _6766 = uint(int(uint(_6722) >> uint(2)));
        _6658 = int(_6766);
    }
    int _6768 = _6658;
    float _6770 = fma(_6088, _6570, _6726);
    int _6772 = _6768;
    if (!_6616)
    {
        int _6774 = 12 & _6736;
        _6764 = _6774;
    }
    int _6776 = _6764;
    float _6778 = 1.0 / _6762;
    float _6780 = fma(_5886, _6540, _6740);
    int _6782 = _6502 + 88;
    uint _6784 = uint(int(uint(_6782) >> uint(2)));
    uint _6786 = uint(int(uint(int(_6784)) >> uint(2)));
    int _6788 = int(_6784) & 3;
    float _6790 = (*spvDescriptorSet0.vp_c15)._m0[int(_6786)][_6788];
    int _6792 = int(_6784) + 1;
    uint _6794 = uint(int(uint(_6792) >> uint(2)));
    int _6796 = _6792 & 3;
    float _6798 = (*spvDescriptorSet0.vp_c15)._m0[int(_6794)][_6796];
    if (!_6616)
    {
        int _6800 = _6768 << 4;
        int _6802 = _6800 + _6776;
        _6772 = _6802;
    }
    int _6804 = _6772;
    float _6806 = _6710 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6808 = fma(_5886, _6592, _6770);
    float _6810 = _6710 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6812 = _6780 + _6548;
    float _6814 = fma(_6712, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6806);
    float _6816 = _6808 + _6600;
    float _6818 = _6644;
    if (!_6616)
    {
        int _6820 = _6804 + 400;
        uint _6822 = uint(int(uint(_6820) >> uint(2)));
        uint _6824 = uint(int(uint(int(_6822)) >> uint(2)));
        int _6826 = int(_6822) & 3;
        float _6828 = (*spvDescriptorSet0.vp_c15)._m0[int(_6824)][_6826];
        _6818 = _6828;
    }
    float _6830 = _6818;
    float _6832 = fma(_6712, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6810);
    float _6834 = fma(_6714, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6814);
    float _6836 = _6710 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6838 = _6760 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6840 = fma(_6714, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6832);
    float _6842 = _6812 * _6778;
    float _6844 = _6834 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6846 = _6816 * _6778;
    float _6848 = fma(_6712, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6836);
    float _6850 = _6840 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6852 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _6854 = _6842 >= 0.0;
    float _6856 = fma(_6714, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6848);
    float _6858 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _6860 = fma(_6850, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6852);
    bool _6862 = _6842 <= 1.0;
    bool _6864 = _6862 && _6854;
    float _6866 = _6856 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6868 = _6838 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6870 = fma(_6838, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6860);
    bool _6872 = _6846 >= 0.0;
    bool _6874 = _6872 && _6864;
    float _6876 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6878 = -_6868;
    float _6880 = fma(_6878, _6858, 1.0);
    float _6882 = fma(_6866, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6870);
    bool _6884 = _6846 <= 1.0;
    bool _6886 = _6884 && _6874;
    float _6888 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6890 = fma(_6850, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6876);
    float _6892 = 1.0 / _6882;
    float _6894 = fma(_6850, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6888);
    float _6896 = _6428 * _6758;
    float _6898 = fma(_6838, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6894);
    float _6900 = log2(_6880);
    float _6902 = fma(_6088, _6750, _6896);
    float _6904 = fma(_6838, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6890);
    float _6906 = _6778;
    float _6908 = _6866;
    float _6910 = _6882;
    if (_6886)
    {
        float _6912 = float(_6500);
        _6552 = _6912;
    }
    float _6914 = _6552;
    float _6916 = fma(_6866, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6898);
    float _6918 = fma(_5886, _6790, _6902);
    float _6920 = fma(_6866, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6904);
    float _6922 = _6880;
    float _6924 = _6914;
    if (!_6616)
    {
        float _6926 = floor(_6488);
        _6922 = _6926;
    }
    float _6928 = _6922;
    float _6930 = _6918 + _6798;
    float _6932 = _6916 * _6892;
    float _6934 = _6920 * _6892;
    float _6936 = _6930 * _6778;
    float _6938 = fma(_6934, -0.5, 0.5);
    float _6940 = _6868;
    if (!_6616)
    {
        float _6942 = floor(_6468);
        _6940 = _6942;
    }
    float _6944 = _6940;
    float _6946 = _6900 * 0.693147182464599609375;
    float _6948 = _6946 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6950 = _6876;
    float _6952 = _6948;
    if (_6886)
    {
        float _6954 = rint(_6914);
        float _6956 = precise::max(_6954, 0.0);
        uint _6958 = uint(_6956);
        uint _6960 = clamp(_6958, 0u, 65535u);
        _6950 = as_type<float>(_6960);
    }
    float _6962 = _6950;
    float _6964 = _6928;
    if (!_6616)
    {
        float _6966 = -_6928;
        float _6968 = _6488 + _6966;
        _6964 = _6968;
    }
    float _6970 = _6964;
    float _6972 = fma(_6932, 0.5, 0.5);
    float _6974 = _6892;
    if (!_6616)
    {
        float _6976 = rint(_6830);
        float _6978 = precise::max(_6976, 0.0);
        uint _6980 = uint(_6978);
        uint _6982 = clamp(_6980, 0u, 65535u);
        _6974 = as_type<float>(_6982);
    }
    float _6984 = _6974;
    float _6986 = _6944;
    if (!_6616)
    {
        float _6988 = -_6944;
        float _6990 = _6468 + _6988;
        _6906 = _6990;
    }
    float _6992 = _6906;
    float _6994 = _6846;
    if (_6886)
    {
        float3 _18116 = float3(_6842, _6846, float(as_type<int>(_6962)));
        float3 _18120 = select(_18116, float3(0.0), isnan(_18116));
        float _6996 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _18120.xy, uint(rint(_18120.z)), _6936, level(0.0));
        _6994 = _6996;
    }
    float _6998 = _6994;
    float3 _18130 = float3(_6972, _6938, _6948);
    float _7000 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_18130, float3(0.0), isnan(_18130)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_18130, float3(0.0), isnan(_18130)), level(0.0)).x;
    float3 _18139 = float3(_6972, _6938, _6948);
    float4 _7003 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_18139, float3(0.0), isnan(_18139)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_18139, float3(0.0), isnan(_18139)), level(0.0)).xyzw;
    float _7005 = _7003.x;
    float _7007 = _7003.y;
    float _7009 = _7003.z;
    float _7011 = _7003.w;
    float _7013 = _6970;
    float _7015 = _6984;
    if (!_6616)
    {
        float3 _18163 = float3(_6992, _6970, float(as_type<int>(_6984)));
        float3 _18165 = select(_18163, float3(0.0), isnan(_18163));
        float _7017 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _18165.xy, uint(rint(_18165.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _18165.xy, uint(rint(_18165.z)), level(0.0)).x;
        _7013 = _7017;
    }
    float _7019 = _7013;
    if (_6616)
    {
        _6924 = 1.0;
    }
    float _7021 = _6924;
    float _7023 = _7021;
    if (!_6616)
    {
        int _7025 = _6722 << 4;
        int _7027 = _7025 + 2048;
        uint _7029 = uint(int(uint(_7027) >> uint(2)));
        uint _7031 = uint(int(uint(int(_7029)) >> uint(2)));
        int _7033 = int(_7029) & 3;
        float _7035 = (*spvDescriptorSet0.vp_c15)._m0[int(_7031)][_7033];
        int _7037 = int(_7029) + 1;
        uint _7039 = uint(int(uint(_7037) >> uint(2)));
        int _7041 = _7037 & 3;
        float _7043 = (*spvDescriptorSet0.vp_c15)._m0[int(_7039)][_7041];
        int _7045 = _7027 + 8;
        uint _7047 = uint(int(uint(_7045) >> uint(2)));
        uint _7049 = uint(int(uint(int(_7047)) >> uint(2)));
        int _7051 = int(_7047) & 3;
        float _7053 = (*spvDescriptorSet0.vp_c15)._m0[int(_7049)][_7051];
        int _7055 = int(_7047) + 1;
        uint _7057 = uint(int(uint(_7055) >> uint(2)));
        int _7059 = _7055 & 3;
        float _7061 = (*spvDescriptorSet0.vp_c15)._m0[int(_7057)][_7059];
        float _7063 = _6428 * _7043;
        float _7065 = fma(_6088, _7035, _7063);
        float _7067 = fma(_5886, _7053, _7065);
        float _7069 = _7067 + _7061;
        float _7071 = precise::clamp(_7069, 0.0, 1.0);
        float _7073 = -_7071;
        float _7075 = _7073 + _7019;
        float _7077 = fma(_7075, 500.0, 1.5);
        float _7079 = exp2(_7077);
        float _7081 = 0.0 + _7079;
        float _7083 = precise::clamp(_7081, 0.0, 1.0);
        _7015 = _7053;
        _7023 = _7083;
    }
    float _7085 = _7015;
    float _7087 = _7023;
    float _7089 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _7091 = _6710 + _7089;
    float _7093 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _7095 = _6712 + _7093;
    float _7097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _7099 = _6714 + _7097;
    float _7101 = _7091 * _7091;
    float _7103 = fma(_7095, _7095, _7101);
    float _7105 = fma(_7099, _7099, _7103);
    float _7107 = rsqrt(_7105);
    float _7109 = _7107 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _7111 = _7095 * _7109;
    float _7113 = _7099 * _7109;
    float _7115 = _7111 * _7111;
    float _7117 = _7113 * _7113;
    float _7119 = _7115 + _7117;
    float _7121 = sqrt(_7119);
    bool _7123 = _7121 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _7125 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _7127 = _7121 + _7125;
    float _7129 = _7107;
    float _7131 = _7127;
    float _7133 = _7091;
    float _7135 = _7085;
    if (_7123)
    {
        float _7137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _7129 = _7137;
    }
    float _7139 = _7129;
    if (_7123)
    {
        float _7141 = rsqrt(_7119);
        _6986 = _7141;
    }
    float _7143 = _6986;
    float _7145 = _7143;
    if (_7123)
    {
        float _7147 = _7127 * _7139;
        _7131 = _7147;
    }
    float _7149 = _7131;
    float _7151 = sqrt(_7105);
    if (_7123)
    {
        float _7153 = _7149 * 0.15915493667125701904296875;
        _6952 = _7153;
    }
    float _7155 = _6952;
    float _7157 = _7099;
    if (_7123)
    {
        float _7159 = _7155 * 6.283185482025146484375;
        float _7161 = sin(_7159);
        _7157 = _7161;
    }
    float _7163 = _7157;
    float _7165 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _7167 = precise::max(0.0, _7165);
    float _7169 = _7139;
    float _7171 = _7167;
    if (_7123)
    {
        float _7173 = _7155 * 6.283185482025146484375;
        float _7175 = cos(_7173);
        _7169 = _7175;
    }
    float _7177 = _7169;
    float _7179 = -_7109;
    float _7181 = -_7167;
    float _7183 = fma(_7091, _7179, _7181);
    if (_7123)
    {
        float _7185 = _7183 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _7133 = _7185;
    }
    float _7187 = _7133;
    float _7189 = _7187;
    float _7191 = _7163;
    if (_7123)
    {
        float _7193 = fma(_7163, _7187, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _7189 = _7193;
    }
    float _7195 = _7189;
    float _7197 = _7195;
    if (!_7123)
    {
        _7191 = _7111;
    }
    float _7199 = _7191;
    float _7201 = _7199;
    if (_7123)
    {
        float _7203 = _7143 * _7195;
        _6104 = _7203;
    }
    float _7205 = _6104;
    float _7207 = _7177;
    if (_7123)
    {
        float _7209 = _7177 + (-1.0);
        _7171 = _7209;
    }
    float _7211 = _7171;
    float _7213 = _7211;
    if (!_7123)
    {
        _7197 = _7183;
    }
    float _7215 = _7197;
    float _7217 = _7215;
    if (_7123)
    {
        float _7219 = _7111 * _7205;
        _7201 = _7219;
    }
    float _7221 = _7201;
    if (_7123)
    {
        float _7223 = _7211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _7135 = _7223;
    }
    float _7225 = _7135;
    float _7227 = _7225;
    if (!_7123)
    {
        _7213 = _7113;
    }
    float _7229 = _7213;
    float _7231 = _7229;
    if (_7123)
    {
        float _7233 = _7113 * _7205;
        _7231 = _7233;
    }
    float _7235 = _7231;
    if (!_7123)
    {
        _7145 = _7115;
    }
    float _7237 = _7145;
    float _7239 = _7237;
    if (_7123)
    {
        float _7241 = fma(_7183, _7177, _7225);
        _7217 = _7241;
    }
    float _7243 = _7217;
    if (_7123)
    {
        float _7245 = _7221 * _7221;
        _7239 = _7245;
    }
    float _7247 = _7239;
    if (!_7123)
    {
        _7207 = _7117;
    }
    float _7249 = _7207;
    float _7251 = _7249;
    if (_7123)
    {
        float _7253 = _7235 * _7235;
        _7251 = _7253;
    }
    float _7255 = _7251;
    float _7257 = fma(_7243, _7243, _7247);
    float _7259 = _7257 + _7255;
    float _7261 = rsqrt(_7259);
    float _7263 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _7265 = fma(_7151, (*spvDescriptorSet0.vp_c15)._m0[23].w, _7263);
    float _7267 = precise::clamp(_7265, 0.0, 1.0);
    float _7269 = -_7267;
    float _7271 = _7269 + 1.0;
    float _7273 = abs(_7271);
    float _7275 = log2(_7273);
    float _7277 = _7261 * _7221;
    float _7279 = _7261 * _7243;
    float _7281 = _7261 * _7235;
    float _7283 = _7277 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _7285 = -_7283;
    float _7287 = fma(_7279, (*spvDescriptorSet0.vp_c15)._m0[21].y, _7285);
    float _7289 = -_7281;
    float _7291 = fma(_7289, (*spvDescriptorSet0.vp_c15)._m0[21].z, _7287);
    float _7293 = _7275 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _7295 = fma(_7291, -0.5, 0.5);
    float _7297 = fma(_7291, 0.5, 0.5);
    float _7299 = exp2(_7293);
    float _7301 = fma(_7297, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _7303 = fma(_7297, _7301, -0.212114393711090087890625);
    float _7305 = _7279 + 1.0;
    float _7307 = sqrt(_7295);
    float _7309 = fma(_7297, _7303, 1.570728778839111328125);
    float _7311 = -_7279;
    float _7313 = fma(_7299, _7305, _7311);
    float _7315 = fma(_7313, 0.5, 0.5);
    float _7317 = _7307 * 0.636619746685028076171875;
    float _7319 = -_7309;
    float _7321 = fma(_7317, _7319, 1.0);
    float2 _18636 = float2(_7321, _7315);
    float3 _7325 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_18636, float2(0.0), isnan(_18636)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_18636, float2(0.0), isnan(_18636)), level(0.0)).xyz;
    float _7327 = _7325.x;
    float _7329 = _7325.y;
    float _7331 = _7325.z;
    float _7333 = abs(_6472);
    float _7335 = log2(_7333);
    float _7337 = _7275 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _7339 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _7341 = isnan(0.5);
    bool _7343 = _7339 || _7341;
    bool _7345 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _7347 = _7343 || _7345;
    float _7349 = _6844 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _7351 = -_6410;
    float _7353 = _7351 + 1.0;
    out.m_96.x = _6088;
    out.m_96.y = _6092;
    out.m_96.z = _5886;
    float _7355 = exp2(_7337);
    float _7357 = fma(_6850, (*spvDescriptorSet0.vp_c8)._m0[6].x, _7349);
    out.m_98.x = _6712;
    out.m_98.y = _6710;
    out.m_98.z = _6714;
    float _7359 = fma(_6838, (*spvDescriptorSet0.vp_c8)._m0[6].z, _7357);
    float _7361 = _7335 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _7363 = fma(_6866, (*spvDescriptorSet0.vp_c8)._m0[6].w, _7359);
    float _7365 = _7357;
    float _7367 = _7363;
    if (!_7347)
    {
        _7227 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _7369 = _7227;
    if (!_7347)
    {
        float _7371 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7373 = _6472 + _7371;
        _6908 = _7373;
    }
    float _7375 = _6908;
    if (_7347)
    {
        _7365 = 1.0;
    }
    float _7377 = _7365;
    float _7379 = exp2(_7361);
    out.gl_Position.x = _6916;
    out.gl_Position.y = _6920;
    out.gl_Position.z = _7363;
    out.gl_Position.w = _6882;
    float _7381 = -_7355;
    float _7383 = _7381 + 1.0;
    float _7385 = _7363 + _6882;
    float _7387 = _7385 * 0.5;
    float _7389 = fma(_7379, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _7391 = precise::clamp(_7389, 0.0, 1.0);
    bool _7393 = _6472 <= 8000.0;
    bool _7395 = isnan(_6472);
    bool _7397 = _7393 || _7395;
    bool _7399 = isnan(8000.0);
    bool _7401 = _7397 || _7399;
    float _7403 = float(_7401);
    float _7405 = _6916 + _6882;
    float _7407 = fma(_7391, -2.0, 3.0);
    float _7409 = _7391 * _7391;
    float _7411 = _7409 * _7407;
    float _7413 = _7409;
    float _7415 = _7405;
    float _7417 = _7377;
    if (!_7347)
    {
        float _7419 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7421 = _7369 + _7419;
        _7413 = _7421;
    }
    float _7423 = _7413;
    float _7425 = _7405 * 0.5;
    if (!_6886)
    {
        _7415 = 1.0;
    }
    float _7427 = _7415;
    float _7429 = -_7411;
    float _7431 = _7429 + 1.0;
    float _7433 = _7427;
    if (_6886)
    {
        bool _7435 = _6998 >= _6936;
        bool _7437 = isnan(_6998);
        bool _7439 = _7435 || _7437;
        bool _7441 = isnan(_6936);
        bool _7443 = _7439 || _7441;
        float _7445 = float(_7443);
        _7433 = _7445;
    }
    float _7447 = _7433;
    float _7449 = _7383 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _7451 = _7423;
    if (!_7347)
    {
        float _7453 = 1.0 / _7423;
        _7451 = _7453;
    }
    float _7455 = _7451;
    float _7457 = fma(_7431, (*spvDescriptorSet0.vp_c15)._m0[654].w, _7411);
    float _7459 = _6882 * 0.5;
    float _7461 = _7447 * _7087;
    float _7463 = -_7449;
    float _7465 = _7463 + 1.0;
    float _7467 = _7403 * _7457;
    float _7469 = fma(_6920, -0.5, _7459);
    bool _7471 = _7151 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _7473 = isnan(_7151);
    bool _7475 = _7471 || _7473;
    bool _7477 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _7479 = _7475 || _7477;
    float _7481 = _7467 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _7483 = _7011 * _7465;
    out.m_100.x = _7425;
    out.m_100.y = _7469;
    out.m_100.z = _7387;
    out.m_100.w = _6882;
    float _7485 = _7353 * _7481;
    float _7487 = precise::clamp(_7485, 0.0, 1.0);
    float _7489 = _7449 * _7000;
    float _7491 = _7461;
    float _7493 = _7465;
    if (!_7347)
    {
        float _7495 = _7375 * _7455;
        float _7497 = precise::clamp(_7495, 0.0, 1.0);
        _7417 = _7497;
    }
    float _7499 = _7417;
    float _7501 = -_7487;
    float _7503 = fma(_7501, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7505 = _7011 * _7489;
    float _7507 = _7505;
    if (!_7479)
    {
        _6910 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _7509 = _6910;
    float _7511 = -_7461;
    float _7513 = fma(_7511, _7503, 1.0);
    float _7515 = precise::clamp(_7513, 0.0, 1.0);
    float _7517 = _7515;
    float _7519 = _7509;
    float _7521 = _7509;
    if (!_7479)
    {
        _7491 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _7523 = _7491;
    float _7525 = _7523;
    float _7527 = _7523;
    if (!_7479)
    {
        _7367 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _7529 = _7367;
    float _7531 = _7515 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7533 = _7529;
    float _7535 = _7529;
    if (!_7479)
    {
        _7493 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _7537 = _7493;
    float _7539 = _7537;
    float _7541 = _7537;
    if (!_7479)
    {
        _7517 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7543 = _7517;
    out.m_102.x = _7531;
    float _7545 = _7331 * _7489;
    float _7547 = fma(_7327, _7505, _7005);
    float _7549 = fma(_7329, _7505, _7007);
    float _7551 = _7499 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _7553 = fma(_7011, _7545, _7009);
    float _7555 = _7543;
    float _7557 = _7543;
    if (!_7479)
    {
        _7507 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _7559 = _7507;
    out.m_104.x = _7547;
    out.m_104.y = _7549;
    out.m_104.z = _7553;
    out.m_104.w = _7483;
    bool _7561 = !_7479;
    float _7563 = _7559;
    float _7565 = _7559;
    if (!_7561)
    {
        bool _7567 = _7151 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7569 = isnan(_7151);
        bool _7571 = _7567 || _7569;
        bool _7573 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7575 = _7571 || _7573;
        if (!_7575)
        {
            float _7577 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7579 = _7151 + _7577;
            float _7581 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7583 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7581;
            float _7585 = 1.0 / _7583;
            float _7587 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7589 = _7587 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7591 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7593 = _7591 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7595 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7597 = _7595 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7599 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7601 = _7599 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7603 = _7579 * _7585;
            float _7605 = precise::clamp(_7603, 0.0, 1.0);
            float _7607 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7609 = _7607 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7611 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7613 = _7611 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7615 = fma(_7605, _7589, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7617 = fma(_7605, _7609, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7619 = fma(_7605, _7613, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7621 = fma(_7605, _7593, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7623 = fma(_7605, _7597, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7625 = fma(_7605, _7601, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _7541 = _7617;
            _7521 = _7623;
            _7565 = _7615;
            _7527 = _7621;
            _7557 = _7619;
            _7535 = _7625;
            _7627 = true;
        }
        else
        {
            bool _7629 = _7151 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7631 = isnan(_7151);
            bool _7633 = _7629 || _7631;
            bool _7635 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7637 = _7633 || _7635;
            if (!_7637)
            {
                _7525 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7639 = _7525;
            _7527 = _7639;
            if (!_7637)
            {
                _7519 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7641 = _7519;
            _7521 = _7641;
            if (!_7637)
            {
                _7533 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7643 = _7533;
            _7535 = _7643;
            if (!_7637)
            {
                _7563 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7645 = _7563;
            _7565 = _7645;
            if (!_7637)
            {
                _7539 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7647 = _7539;
            _7541 = _7647;
            if (!_7637)
            {
                _7555 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7649 = _7555;
            bool _7651 = !_7637;
            _7557 = _7649;
            if (!_7651)
            {
                bool _7653 = _7151 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7655 = isnan(_7151);
                bool _7657 = _7653 || _7655;
                bool _7659 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7661 = _7657 || _7659;
                if (!_7661)
                {
                    float _7663 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7665 = _7151 + _7663;
                    float _7667 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7669 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7667;
                    float _7671 = 1.0 / _7669;
                    float _7673 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7675 = _7673 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7677 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7679 = _7677 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7681 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7683 = _7681 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7685 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7687 = _7685 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7689 = _7665 * _7671;
                    float _7691 = precise::clamp(_7689, 0.0, 1.0);
                    float _7693 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7695 = _7693 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7697 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7699 = _7697 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7701 = fma(_7691, _7675, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7703 = fma(_7691, _7695, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7705 = fma(_7691, _7699, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7707 = fma(_7691, _7679, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7709 = fma(_7691, _7683, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7711 = fma(_7691, _7687, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _7541 = _7703;
                    _7521 = _7709;
                    _7565 = _7701;
                    _7527 = _7707;
                    _7557 = _7705;
                    _7535 = _7711;
                    _7627 = true;
                }
                else
                {
                    _7541 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _7521 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _7565 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _7527 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7557 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _7535 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7627 = false;
    float _7713 = _7541;
    float _7715 = _7521;
    float _7717 = _7565;
    float _7719 = _7527;
    float _7721 = _7557;
    float _7723 = _7535;
    float _7725 = fma(_6050, -0.5, 0.5);
    float _7727 = precise::clamp(_7725, 0.0, 1.0);
    float _7729 = -_7713;
    float _7731 = _7715 + _7729;
    float _7733 = _7551 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7735 = -_7717;
    float _7737 = _7719 + _7735;
    float _7739 = fma(_7727, _7731, _7713);
    out.m_106.x = 0.0;
    float _7741 = -_7721;
    float _7743 = _7723 + _7741;
    float _7745 = fma(_7727, _7737, _7717);
    float _7747 = _7739 * 0.586610972881317138671875;
    out.m_59.x = _7733;
    bool _7749 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7751 = fma(_7727, _7743, _7721);
    float _7753 = fma(_7745, 0.298911988735198974609375, _7747);
    bool _7755 = _7499 > 0.0;
    bool _7757 = isnan(_7499);
    bool _7759 = _7755 || _7757;
    bool _7761 = isnan(0.0);
    bool _7763 = _7759 || _7761;
    float _7765 = fma(_7751, 0.114477999508380889892578125, _7753);
    float _7767 = -_7765;
    float _7769 = _7745 + _7767;
    float _7771 = -_7765;
    float _7773 = _7739 + _7771;
    float _7775 = -_7765;
    float _7777 = _7751 + _7775;
    float _7779 = fma(_7769, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7765);
    float _7781 = fma(_7773, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7765);
    float _7783 = fma(_7777, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7765);
    bool _7785 = !_7749;
    if (!_7785)
    {
        float _7787 = -_6710;
        float _7789 = _7787 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7791 = -_6712;
        float _7793 = _7791 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7795 = -_6714;
        float _7797 = _7795 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7799 = _7789 * _7789;
        float _7801 = fma(_7793, _7793, _7799);
        float _7803 = fma(_7797, _7797, _7801);
        float _7805 = sqrt(_7803);
        float _7807 = rsqrt(_7803);
        float _7809 = -_7805;
        float _7811 = _7809 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7813 = _7811 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7815 = precise::clamp(_7813, 0.0, 1.0);
        float _7817 = _7793 * _7807;
        float _7819 = _7789 * _7807;
        float _7821 = abs(_7815);
        float _7823 = log2(_7821);
        float _7825 = _7797 * _7807;
        float _7827 = _7817 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7829 = _6050 * _7819;
        float _7831 = -_7819;
        float _7833 = -_7827;
        float _7835 = fma(_7831, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7833);
        float _7837 = fma(_6046, _7817, _7829);
        float _7839 = -_7825;
        float _7841 = fma(_7839, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7835);
        float _7843 = fma(_6054, _7825, _7837);
        float _7845 = precise::clamp(_7843, 0.0, 1.0);
        float _7847 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7849 = _7841 + _7847;
        float _7851 = _7823 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7853 = _7849 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7855 = precise::clamp(_7853, 0.0, 1.0);
        float _7857 = exp2(_7851);
        float _7859 = _7857 * _7855;
        float _7861 = _7845 * _7859;
        float _7863 = _7861 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7865 = _7861 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7867 = _7861 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _7863;
        out.m_106.y = _7865;
        out.m_106.z = _7867;
    }
    out.m_82.x = _7779;
    out.m_82.y = _7781;
    out.m_82.z = _7783;
    if (_7763)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _7869 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7869;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

