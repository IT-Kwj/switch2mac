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
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_14Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_72 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
    float4 m_70 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3235 = false;
    bool _531 = false;
    bool _339 = false;
    bool _237 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _3488 = as_type<float>(_127);
        out.gl_Position.z = _3488;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_61.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_59.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3558 = as_type<float>(_165);
        out.gl_Position.z = _3558;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_66.x;
    float _171 = in.m_66.y;
    float _173 = in.m_66.z;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_177;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _207 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _209 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _211 = !_183;
    float _213 = _205;
    float _215 = _207;
    float _217 = _209;
    float _235;
    if (!_211)
    {
        float _219 = in.m_68.x;
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _223 = _219 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _227 = _225 * _221;
        float _229 = floor(_227);
        float _231 = -_229;
        float _233 = _227 + _231;
        _235 = _233;
        _237 = true;
    }
    else
    {
        float _239 = float(_111);
        float _241 = 1.0 / _239;
        float _243 = _145 * _241;
        _235 = _243;
    }
    _237 = false;
    float _245 = _235;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _245 + _247;
    bool _251 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _253 = isnan(_245);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -_261;
    float _269 = _267 + 1.0;
    bool _271 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _273 = isnan(_245);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _283;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _289 = 1.0 / _265;
    float _291 = _281 * _269;
    float _293 = -_281;
    float _295 = _293 + 1.0;
    float _297 = _249 * _289;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _299;
    float _303 = fma(_285, _297, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _305 = fma(_301, _297, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _307 = _303 * _291;
    float _309 = _305 * _291;
    float _311 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].x, _307);
    float _313 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].y, _309);
    float _315 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[144].x, _311);
    float _317 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[144].y, _313);
    bool _319 = !_287;
    float _337;
    if (!_319)
    {
        float _321 = in.m_68.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_111);
        float _343 = 1.0 / _341;
        float _345 = _145 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _337;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _351 = _347 + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _361 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _363 = isnan(_347);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _377 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _379 = isnan(_347);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = 1.0 / _355;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _391;
    float _395 = -_371;
    float _397 = _395 + 1.0;
    bool _399 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _401 = isnan(_347);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    bool _411 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _413 = 1.0 / _359;
    float _415 = 1.0 / _375;
    float _417 = _393 * _389;
    float _419 = -_387;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _427 = _387 * _397;
    float _429 = fma(_417, _351, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _431 = _409 * _421;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _433;
    float _437 = _425 * _413;
    bool _439 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _441 = isnan(_347);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _453 = _347 + _451;
    float _455 = _429 * _431;
    float _457 = -_409;
    float _459 = _457 + 1.0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _463 = _347 + _461;
    float _465 = fma(_437, _453, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _467 = -_449;
    float _469 = _467 + 1.0;
    float _471 = _435 * _415;
    float _473 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[115].x, _455);
    float _475 = _371 * _469;
    float _477 = fma(_471, _463, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _479 = fma(_465, _427, _473);
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _483 = fma(_477, _475, _479);
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _487 = _481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _489 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[118].x, _483);
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = _485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _489 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _497 = in.m_70.x;
    float _499 = in.m_70.y;
    float _501 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _487;
    out.m_72.y = _501;
    out.m_72.z = _493;
    out.m_72.w = _495;
    float _503 = _317 * _499;
    float _505 = _315 * _497;
    bool _507 = !_411;
    float _527;
    float _529;
    if (!_507)
    {
        float _509 = in.m_68.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _513 = float(_111);
        float _515 = _509 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _517 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _519 = _517 * _511;
        float _521 = floor(_519);
        float _523 = -_521;
        float _525 = _519 + _523;
        _527 = _513;
        _529 = _525;
        _531 = true;
    }
    else
    {
        float _533 = float(_111);
        float _535 = 1.0 / _533;
        float _537 = _145 * _535;
        _527 = _533;
        _529 = _537;
    }
    _531 = false;
    float _539 = _527;
    float _541 = _529;
    float _543 = in.m_56.x;
    float _545 = in.m_56.y;
    float _547 = in.m_56.z;
    float _549 = _545 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _551 = _545 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _553 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[4].x, _549);
    float _555 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[6].x, _551);
    float _557 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[4].z, _553);
    float _559 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[6].z, _555);
    float _561 = _557 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _563 = _559 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _565 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _567 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _569 = floor(_565);
    float _571 = floor(_567);
    float _573 = -_569;
    float _575 = _565 + _573;
    float _577 = -_571;
    float _579 = _567 + _577;
    float2 _4227 = float2(_575, _579);
    float _581 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4227, float2(0.0), isnan(_4227)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4227, float2(0.0), isnan(_4227)), level(0.0)).x;
    float _583 = in.m_68.x;
    float _585 = in.m_68.y;
    float _587 = in.m_68.z;
    float _589 = in.m_68.w;
    float _591 = _545 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _595 = int(_593);
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _599 = _597 != 0;
    float _601 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[5].x, _591);
    float _603 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _611 = _609 != 0;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _615 = _613 != 0;
    float _617 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[5].z, _601);
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _621 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _623 = log2(_621);
    bool _625 = !_611;
    int _627 = _625 ? 0 : 1;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _631 = !_607;
    int _633 = _631 ? 0 : 1;
    float _635 = _617 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _637 = !_615;
    int _639 = _637 ? 0 : 1;
    float _641 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _643 = _635 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _645 = _583 * 2.0;
    float _647 = _587 * 2.0;
    float _649 = _585 * 2.0;
    float _651 = _583 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _653 = floor(_645);
    float _655 = _543;
    float _657 = _601;
    if (!_599)
    {
        _655 = _587;
    }
    float _659 = _655;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _663 = -_619;
    float _665 = fma(_651, 2.0, _663);
    float _667 = _585 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _669 = _659;
    if (_599)
    {
        _669 = _585;
    }
    float _671 = _669;
    float _673 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[11].x, _643);
    float _675 = _671;
    if (!_599)
    {
        _657 = _585;
    }
    float _677 = _657;
    float _679 = floor(_647);
    float _681 = _585 + _583;
    float _683 = fma(_667, -2.0, _629);
    float _685 = _677;
    if (_599)
    {
        _685 = _583;
    }
    float _687 = _685;
    float _689 = -_145;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[76].x, _665);
    float _693 = _681 + (-1.0);
    float _695 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _683);
    float _697 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[11].z, _673);
    float _699 = floor(_649);
    bool _701 = _653 > 0.0;
    float _703 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _705 = _653 >= 0.0;
    bool _707 = isnan(_653);
    bool _709 = _705 || _707;
    bool _711 = isnan(0.0);
    bool _713 = _709 || _711;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _717 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _721 = _719 != 0;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _725 = _723 != 0;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _729 = _727 != 0;
    float _731 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _733 = int(_731);
    bool _735 = _679 >= 0.0;
    bool _737 = isnan(_679);
    bool _739 = _735 || _737;
    bool _741 = isnan(0.0);
    bool _743 = _739 || _741;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _747 = _713 ? 0 : 1;
    float _749 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[78].w, _715);
    int _751 = _743 ? 0 : 1;
    float _753 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[83].w, _745);
    bool _755 = _679 > 0.0;
    float _757 = _687 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _759 = !_721;
    int _761 = _759 ? 0 : 1;
    float _763 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _749);
    bool _765 = _699 > 0.0;
    float _767 = -_661;
    float _769 = fma(_757, 2.0, _767);
    bool _771 = _699 >= 0.0;
    bool _773 = isnan(_699);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    float _781 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _753);
    float _783 = -_145;
    float _785 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[81].x, _769);
    if (!_599)
    {
        _675 = _587;
    }
    float _787 = _675;
    int _789 = ~_751;
    int _791 = _789 + 1;
    int _793 = _791 + 1;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _797 = _787;
    int _799 = _793;
    if (_599)
    {
        _797 = _585;
    }
    float _801 = _797;
    if (!_755)
    {
        int _803 = ~_751;
        int _805 = _803 + 1;
        _799 = _805;
    }
    int _807 = _799;
    float _809 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[83].z, _795);
    float _811 = _801 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _813 = abs(_761);
    float _815 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _809);
    int _817 = _779 ? 0 : 1;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _821 = float(_733);
    int _823 = ~_817;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    float _829 = fma(_811, -2.0, _819);
    float _831 = float(_813);
    float _833 = 1.0 / _821;
    float _835 = float(_807);
    float _837 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _829);
    int _839 = _827;
    if (!_765)
    {
        int _841 = ~_817;
        int _843 = _841 + 1;
        _839 = _843;
    }
    int _845 = _839;
    float _847 = _623 * _145;
    int _849 = ~_747;
    int _851 = _849 + 1;
    int _853 = _851 + 1;
    float _855 = _831 * _835;
    int _857 = _853;
    if (!_701)
    {
        int _859 = ~_747;
        int _861 = _859 + 1;
        _857 = _861;
    }
    int _863 = _857;
    float _865 = in.m_74.x;
    float _867 = in.m_74.y;
    float _869 = in.m_74.z;
    bool _871 = !_725;
    int _873 = _871 ? 0 : 1;
    float _875 = exp2(_847);
    float _877 = _855 * (-2.0);
    int _879 = abs(_873);
    float _881 = _635 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _885 = 1.0 + _883;
    float _887 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[10].x, _881);
    bool _889 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _891 = isnan(1.0);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _897 = _893 || _895;
    float _899 = 1.0 / _885;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _903 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[10].z, _887);
    float _905 = float(_863);
    float _907 = _833 * _145;
    float _909 = float(_879);
    float _911 = -_875;
    float _913 = _911 + 1.0;
    bool _915 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _917 = isnan(0.0);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _923 = _919 || _921;
    float _925 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[78].z, _901);
    float _927 = _697 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _929 = _903 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _931 = float(_595);
    float _933 = _909 * _905;
    float _935 = 1.0 / _927;
    float _937 = _923 ? _913 : 0.0;
    float _939 = _929 + _927;
    float _941 = _583 + (-0.5);
    float _943 = _931 * _145;
    float _945 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _925);
    if (_897)
    {
        float _947 = _937 * _899;
        _147 = _947;
    }
    float _949 = _147;
    float _951 = fma(_703, _877, _703);
    float _953 = fma(_877, _865, _865);
    bool _955 = !_729;
    int _957 = _955 ? 0 : 1;
    float _959 = float(_845);
    float _961 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].x, _953);
    int _963 = abs(_957);
    float _965 = _585 + _587;
    float _967 = _939 * _935;
    float _969 = _967 * 0.5;
    float _971 = fma(_951, _949, _961);
    float _973 = _965 + (-1.0);
    float _975 = _933 * (-2.0);
    float _977 = float(_963);
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _981 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[30].w, _979);
    float _983 = _971 * 0.15915493667125701904296875;
    float _985 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _987 = fma(_975, _867, _867);
    float _989 = _977 * _959;
    float _991 = _585 + (-0.5);
    float _993 = _587 + _583;
    float _995 = fma(_985, _975, _985);
    float _997 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[196].y, _987);
    float _999 = _993 + (-1.0);
    float _1001 = _989 * (-2.0);
    float _1003 = 1.0 / _981;
    float _1005 = fma(_995, _949, _997);
    float _1007 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1009 = fma(_1001, _869, _869);
    float _1011 = _587 + (-0.5);
    float _1013 = _1005 * 0.15915493667125701904296875;
    float _1015 = fma(_1007, _1001, _1007);
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1019 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1009);
    float _1021 = _983 * 6.283185482025146484375;
    float _1023 = sin(_1021);
    float _1025 = _641 * _1017;
    float _1027 = fma(_1015, _949, _1019);
    float _1029 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1031 = _1027 * 0.15915493667125701904296875;
    float _1033 = _983 * 6.283185482025146484375;
    float _1035 = cos(_1033);
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1039 = _1003 * _1037;
    float _1041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1043 = _635 + _1029;
    bool _1045 = _1039 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1047 = _603 * _1041;
    float _1049 = _1013 * 6.283185482025146484375;
    float _1051 = sin(_1049);
    bool _1053 = _1039 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1055 = _1013 * 6.283185482025146484375;
    float _1057 = cos(_1055);
    int _1059 = 2;
    if (!_1045)
    {
        _1059 = 1;
    }
    int _1061 = _1059;
    float _1063 = _1031 * 6.283185482025146484375;
    float _1065 = cos(_1063);
    float _1067 = _1023 * _1051;
    float _1069 = _1035 * _1051;
    float _1071 = _1031 * 6.283185482025146484375;
    float _1073 = sin(_1071);
    float _1075 = _1023 * _1057;
    float _1077 = _1035 * _1057;
    float _1079 = _1023 * _1065;
    float _1081 = _1057 * _1065;
    float _1083 = _1035 * _1065;
    float _1085 = _1051 * _1065;
    float _1087 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1089 = _1083 * _1025;
    float _1091 = fma(_1073, _1077, _1067);
    float _1093 = fma(_1073, _1067, _1077);
    bool _1095 = !_1045;
    int _1097 = _1095 ? 0 : 1;
    float _1099 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1087);
    float _1101 = -_1069;
    float _1103 = fma(_1073, _1075, _1101);
    float _1105 = -_1075;
    float _1107 = fma(_1073, _1069, _1105);
    int _1109 = _1061;
    if (!_1053)
    {
        _1109 = _1097;
    }
    int _1111 = _1109;
    float _1113 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1099);
    float _1115 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _1117 = _1111 << 6;
    float _1119 = _1113 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1121 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1115);
    float _1123 = -_1025;
    float _1125 = _1073 * _1123;
    float _1127 = fma(_1091, _1047, _1089);
    float _1129 = _1079 * _1025;
    float _1131 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1121);
    float _1133 = fma(_1081, _1047, _1125);
    float _1135 = fma(_1107, _717, _1127);
    float _1137 = fma(_1103, _1047, _1129);
    float _1139 = _1131 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1141 = fma(_1085, _717, _1133);
    float _1143 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1145 = fma(_1093, _717, _1137);
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1149 = trunc(_1119);
    int _1151 = int(_1149);
    float _1153 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1143);
    int _1155 = _1117 + 64;
    uint _1158 = uint(int(uint(_1155) >> uint(2)));
    uint _1160 = uint(int(uint(int(_1158)) >> uint(2)));
    int _1162 = int(_1158) & 3;
    float _1164 = (*spvDescriptorSet0.vp_c15)._m0[int(_1160)][_1162];
    int _1166 = int(_1158) + 1;
    uint _1168 = uint(int(uint(_1166) >> uint(2)));
    int _1170 = _1166 & 3;
    float _1172 = (*spvDescriptorSet0.vp_c15)._m0[int(_1168)][_1170];
    float _1174 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1147);
    float _1176 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1153);
    float _1180 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1174);
    float _1182 = trunc(_1139);
    int _1184 = int(_1182);
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1188 = _1117 + 48;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    uint _1192 = uint(int(uint(int(_1190)) >> uint(2)));
    int _1194 = int(_1190) & 3;
    float _1196 = (*spvDescriptorSet0.vp_c15)._m0[int(_1192)][_1194];
    int _1198 = int(_1190) + 1;
    uint _1200 = uint(int(uint(_1198) >> uint(2)));
    int _1202 = _1198 & 3;
    float _1204 = (*spvDescriptorSet0.vp_c15)._m0[int(_1200)][_1202];
    float _1206 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1208 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1210 = _563 + _1186;
    float _1212 = _561 + _1206;
    int _1214 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1216 = _1151 + _1214;
    int _1218 = _1216 + 1;
    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1222 = _1210 + _1220;
    int _1224 = _1117 + 56;
    uint _1226 = uint(int(uint(_1224) >> uint(2)));
    uint _1228 = uint(int(uint(int(_1226)) >> uint(2)));
    int _1230 = int(_1226) & 3;
    float _1232 = (*spvDescriptorSet0.vp_c15)._m0[int(_1228)][_1230];
    int _1234 = int(_1226) + 1;
    uint _1236 = uint(int(uint(_1234) >> uint(2)));
    int _1238 = _1234 & 3;
    float _1240 = (*spvDescriptorSet0.vp_c15)._m0[int(_1236)][_1238];
    float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1244 = _1212 + _1242;
    bool _1246 = _1218 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1248 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1208);
    int _1250 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1252 = _1184 + _1250;
    int _1254 = _1252 + 1;
    float _1256 = _1222 * _1222;
    int _1258 = _1117 + 72;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    uint _1262 = uint(int(uint(int(_1260)) >> uint(2)));
    int _1264 = int(_1260) & 3;
    float _1266 = (*spvDescriptorSet0.vp_c15)._m0[int(_1262)][_1264];
    int _1268 = int(_1260) + 1;
    uint _1270 = uint(int(uint(_1268) >> uint(2)));
    int _1272 = _1268 & 3;
    float _1274 = (*spvDescriptorSet0.vp_c15)._m0[int(_1270)][_1272];
    float _1276 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1278 = _1218 | _1254;
    float _1280 = fma(_1244, _1244, _1256);
    float _1282 = _635 + _1276;
    bool _1284 = _1278 < 0;
    bool _1286 = _1284 || _1246;
    int _1288 = _1117 + 96;
    uint _1290 = uint(int(uint(_1288) >> uint(2)));
    uint _1292 = uint(int(uint(int(_1290)) >> uint(2)));
    int _1294 = int(_1290) & 3;
    float _1296 = (*spvDescriptorSet0.vp_c15)._m0[int(_1292)][_1294];
    int _1298 = int(_1290) + 1;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    int _1302 = _1298 & 3;
    float _1304 = (*spvDescriptorSet0.vp_c15)._m0[int(_1300)][_1302];
    float _1306 = sqrt(_1280);
    bool _1308 = _1254 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1310 = _1308 || _1286;
    int _1312 = _1117 + 104;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    uint _1316 = uint(int(uint(int(_1314)) >> uint(2)));
    int _1318 = int(_1314) & 3;
    float _1320 = (*spvDescriptorSet0.vp_c15)._m0[int(_1316)][_1318];
    int _1322 = int(_1314) + 1;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    int _1326 = _1322 & 3;
    float _1328 = (*spvDescriptorSet0.vp_c15)._m0[int(_1324)][_1326];
    int _1330 = as_type<int>(_1141);
    int _1332 = _1254;
    float _1334 = _1145;
    float _1336 = _1212;
    float _1338 = _1210;
    float _1340 = as_type<float>(_1218);
    if (!_1310)
    {
        int _1342 = _1254 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1344 = _1342 + _1218;
        _1330 = _1344;
    }
    int _1346 = _1330;
    bool _1348 = _1306 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1350 = _1306;
    if (!_1310)
    {
        int _1352 = _1346 << 2;
        _1332 = _1352;
    }
    int _1354 = _1332;
    int _1356 = 0;
    int _1358 = _1354;
    if (!_1310)
    {
        uint _1360 = uint(int(uint(_1346) >> uint(2)));
        _1356 = int(_1360);
    }
    int _1362 = _1356;
    int _1364 = _1362;
    if (!_1310)
    {
        int _1366 = 12 & _1354;
        _1358 = _1366;
    }
    int _1368 = _1358;
    if (!_1310)
    {
        int _1370 = _1362 << 4;
        int _1372 = _1370 + _1368;
        _1364 = _1372;
    }
    int _1374 = _1364;
    if (!_1348)
    {
        _1334 = _1212;
    }
    float _1376 = _1334;
    float _1378 = _1376;
    if (!_1348)
    {
        _1336 = _1282;
    }
    float _1380 = _1336;
    bool _1382 = !_1348;
    float _1384 = _1380;
    if (!_1382)
    {
        float _1386 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1390 = _1306 + _1388;
        float _1392 = rsqrt(_1280);
        float _1394 = _1390 * _1386;
        float _1396 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1398 = _1394 * 0.15915493667125701904296875;
        float _1400 = _1398 * 6.283185482025146484375;
        float _1402 = sin(_1400);
        float _1404 = _1398 * 6.283185482025146484375;
        float _1406 = cos(_1404);
        float _1408 = fma(_1402, _1396, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1410 = _1392 * _1408;
        float _1412 = _1406 + (-1.0);
        float _1414 = fma(_1244, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1416 = fma(_1222, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1418 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1420 = fma(_1282, _1406, _1418);
        _1384 = _1420;
        _1378 = _1414;
        _1338 = _1416;
        _1350 = _1418;
        _1340 = _1412;
    }
    float _1422 = _1384;
    float _1424 = _1378;
    float _1426 = _1338;
    float _1428 = _1350;
    float _1430 = _1340;
    float _1432 = -_635;
    float _1434 = _1432 + _1422;
    int _1436 = _1117 + 80;
    uint _1438 = uint(int(uint(_1436) >> uint(2)));
    uint _1440 = uint(int(uint(int(_1438)) >> uint(2)));
    int _1442 = int(_1438) & 3;
    float _1444 = (*spvDescriptorSet0.vp_c15)._m0[int(_1440)][_1442];
    int _1446 = int(_1438) + 1;
    uint _1448 = uint(int(uint(_1446) >> uint(2)));
    int _1450 = _1446 & 3;
    float _1452 = (*spvDescriptorSet0.vp_c15)._m0[int(_1448)][_1450];
    float _1454 = -_561;
    float _1456 = _1454 + _1424;
    float _1458 = -_563;
    float _1460 = _1458 + _1426;
    float _1462 = _1434 * _1434;
    float _1464 = _1043 * _1304;
    float _1466 = _1043 * _1172;
    float _1468 = _1430;
    float _1470 = _1424;
    float _1472 = _1422;
    float _1474 = _1426;
    if (!_1310)
    {
        float _1476 = floor(_1119);
        _1468 = _1476;
    }
    float _1478 = _1468;
    float _1480 = fma(_1456, _1456, _1462);
    int _1482 = _1117 + 88;
    uint _1484 = uint(int(uint(_1482) >> uint(2)));
    uint _1486 = uint(int(uint(int(_1484)) >> uint(2)));
    int _1488 = int(_1484) & 3;
    float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
    int _1492 = int(_1484) + 1;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    int _1496 = _1492 & 3;
    float _1498 = (*spvDescriptorSet0.vp_c15)._m0[int(_1494)][_1496];
    float _1500 = fma(_561, _1296, _1464);
    float _1502 = fma(_561, _1164, _1466);
    float _1504 = fma(_1460, _1460, _1480);
    float _1506 = fma(_563, _1320, _1500);
    float _1508 = _1043 * _1204;
    float _1510 = sqrt(_1504);
    float _1512 = _1428;
    float _1514 = _1508;
    if (!_1310)
    {
        int _1516 = _1374 + 400;
        uint _1518 = uint(int(uint(_1516) >> uint(2)));
        uint _1520 = uint(int(uint(int(_1518)) >> uint(2)));
        int _1522 = int(_1518) & 3;
        float _1524 = (*spvDescriptorSet0.vp_c15)._m0[int(_1520)][_1522];
        _1512 = _1524;
    }
    float _1526 = _1512;
    float _1528 = _1506 + _1328;
    float _1530 = fma(_561, _1196, _1508);
    float _1532 = fma(_563, _1266, _1502);
    bool _1534 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1536 = isnan(0.5);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1542 = _1538 || _1540;
    float _1544 = fma(_563, _1232, _1530);
    float _1546 = _1320;
    float _1548 = _1528;
    if (!_1310)
    {
        float _1550 = floor(_1139);
        _1546 = _1550;
    }
    float _1552 = _1546;
    float _1554 = _1532 + _1274;
    float _1556 = _1544 + _1240;
    bool _1558 = _1510 > 0.0;
    float _1560 = 1.0 / _1528;
    bool _1562 = !_1558;
    if (!_1562)
    {
        float _1564 = _207 * _207;
        float _1566 = rsqrt(_1504);
        float _1568 = fma(_205, _205, _1564);
        float _1570 = fma(_209, _209, _1568);
        float _1572 = sqrt(_1570);
        float _1574 = _1456 * _1566;
        float _1576 = _1434 * _1566;
        float _1578 = _1460 * _1566;
        bool _1580 = _1572 > 0.0;
        bool _1582 = !_1580;
        _1514 = _1576;
        if (!_1582)
        {
            float _1584 = rsqrt(_1570);
            float _1586 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1588 = _207 * _1584;
            float _1590 = _205 * _1584;
            float _1592 = _1576 * _1588;
            float _1594 = _209 * _1584;
            float _1596 = fma(_1574, _1590, _1592);
            float _1598 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1600 = fma(_1578, _1594, _1596);
            float _1602 = _1600 * _1598;
            float _1604 = fma(_205, _1602, _1424);
            float _1606 = fma(_207, _1602, _1422);
            float _1608 = fma(_209, _1602, _1426);
            _1470 = _1604;
            _1472 = _1606;
            _1474 = _1608;
        }
    }
    float _1610 = _1470;
    float _1612 = _1472;
    float _1614 = _1474;
    float _1616 = _1514;
    float _1618 = _1612;
    float _1620 = _1616;
    if (_1542)
    {
        _213 = _1610;
    }
    float _1622 = _213;
    float _1624 = _1622;
    if (_1542)
    {
        _215 = _1612;
    }
    float _1626 = _215;
    float _1628 = _1626;
    if (_1542)
    {
        _217 = _1614;
    }
    float _1630 = _217;
    float _1632 = _1630;
    if (!_1542)
    {
        float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1636 = _635 + _1634;
        float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1640 = _561 + _1638;
        float _1642 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1644 = -_635;
        float _1646 = _1644 + _1612;
        float _1648 = _1636 * _1636;
        float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1652 = _563 + _1650;
        float _1654 = -_561;
        float _1656 = _1654 + _1610;
        float _1658 = -_563;
        float _1660 = _1658 + _1614;
        float _1662 = fma(_1640, _1640, _1648);
        float _1664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1666 = fma(_1652, _1652, _1662);
        float _1668 = sqrt(_1666);
        float _1670 = _1642 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1672 = precise::min(_1668, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1674 = _1672 * _1664;
        float _1676 = _1670 * _1674;
        float _1678 = fma(_1646, _1676, _635);
        float _1680 = fma(_1656, _1676, _561);
        float _1682 = fma(_1660, _1676, _563);
        _1628 = _1678;
        _1624 = _1680;
        _1632 = _1682;
        _1618 = _1646;
    }
    float _1684 = _1628;
    float _1686 = _1624;
    float _1688 = _1632;
    float _1690 = _1618;
    float _1692 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1696 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1698 = _1556 * _1560;
    float _1700 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1692);
    float _1702 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1694);
    float _1704 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1696);
    float _1706 = _1690;
    if (!_1310)
    {
        float _1708 = rint(_1526);
        float _1710 = precise::max(_1708, 0.0);
        uint _1712 = uint(_1710);
        uint _1714 = clamp(_1712, 0u, 65535u);
        _1620 = as_type<float>(_1714);
    }
    float _1716 = _1620;
    float _1718 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1700);
    bool _1720 = _1698 >= 0.0;
    float _1722 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1704);
    float _1726 = _1554 * _1560;
    bool _1728 = _1698 <= 1.0;
    bool _1730 = _1728 && _1720;
    float _1732 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1734 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1736 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1702);
    float _1738 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1740 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1742 = _1726 >= 0.0;
    bool _1744 = _1742 && _1730;
    float _1746 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1748 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1750 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1732);
    bool _1752 = _1726 <= 1.0;
    bool _1754 = _1752 && _1744;
    float _1756 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1758 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1748);
    float _1760 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_1310)
    {
        float _1762 = -_1552;
        float _1764 = _1139 + _1762;
        _1706 = _1764;
    }
    float _1766 = _1706;
    float _1768 = -_1756;
    float _1770 = fma(_1768, _1734, 1.0);
    float _1772 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1774 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1758);
    float _1776 = _1043 * _1452;
    float _1778 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1780 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1774);
    float _1782 = log2(_1770);
    float _1784 = fma(_561, _1444, _1776);
    if (_1754)
    {
        float _1786 = float(_1111);
        _1548 = _1786;
    }
    float _1788 = _1548;
    float _1790 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1778);
    float _1792 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1760);
    float _1794 = fma(_563, _1490, _1784);
    float _1796 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1790);
    float _1798 = 1.0 / _1780;
    float _1800 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1792);
    float _1802 = _1794 + _1498;
    float _1804 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1796);
    float _1806 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1800);
    float _1808 = _1800;
    if (!_1310)
    {
        float _1810 = -_1478;
        float _1812 = _1119 + _1810;
        _1808 = _1812;
    }
    float _1814 = _1808;
    float _1816 = _1784;
    if (_1754)
    {
        float _1818 = rint(_1788);
        float _1820 = precise::max(_1818, 0.0);
        uint _1822 = uint(_1820);
        uint _1824 = clamp(_1822, 0u, 65535u);
        _1816 = as_type<float>(_1824);
    }
    float _1826 = _1816;
    float _1828 = _1782 * 0.693147182464599609375;
    float _1830 = _1802 * _1560;
    float _1832 = _1804 * _1798;
    float _1834 = _1806 * _1798;
    float _1836 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1838 = fma(_1832, 0.5, 0.5);
    float _1840 = fma(_1834, -0.5, 0.5);
    float _1842 = _1766;
    float _1844 = _1838;
    float _1846 = _1836;
    if (!_1310)
    {
        float3 _6262 = float3(_1814, _1766, float(as_type<int>(_1716)));
        float3 _6266 = select(_6262, float3(0.0), isnan(_6262));
        float _1848 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6266.xy, uint(rint(_6266.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6266.xy, uint(rint(_6266.z)), level(0.0)).x;
        _1842 = _1848;
    }
    float _1850 = _1842;
    float _1852 = _1726;
    if (_1754)
    {
        float3 _6281 = float3(_1698, _1726, float(as_type<int>(_1826)));
        float3 _6283 = select(_6281, float3(0.0), isnan(_6281));
        float _1854 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6283.xy, uint(rint(_6283.z)), _1830, level(0.0));
        _1852 = _1854;
    }
    float _1856 = _1852;
    float3 _6293 = float3(_1838, _1840, _1836);
    float _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6293, float3(0.0), isnan(_6293)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6293, float3(0.0), isnan(_6293)), level(0.0)).x;
    float3 _6302 = float3(_1838, _1840, _1836);
    float4 _1861 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6302, float3(0.0), isnan(_6302)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6302, float3(0.0), isnan(_6302)), level(0.0)).xyzw;
    float _1863 = _1861.x;
    float _1865 = _1861.y;
    float _1867 = _1861.z;
    float _1869 = _1861.w;
    float _1871 = float(uint(_595));
    float _1873 = trunc(_907);
    int _1875 = int(_1873);
    float _1877 = 1.0 / _1871;
    float _1879 = float(uint(_1875));
    int _1881 = as_type<int>(_1877) + (-2);
    float _1883 = as_type<float>(_1881) * _1879;
    float _1885 = trunc(_1883);
    float _1887 = precise::max(_1885, 0.0);
    uint _1889 = uint(_1887);
    int _1891 = ~_595;
    int _1893 = _1891 + 1;
    int _1895 = ~_595;
    int _1897 = _1895 + 1;
    float _1899 = 1.0 / _539;
    int _1901 = _1893 * int(_1889);
    int _1903 = _1901 + _1875;
    float _1905 = float(uint(_1903));
    float _1907 = _943 * _1899;
    float _1909 = _1899;
    float _1911 = as_type<float>(_1889);
    if (_1310)
    {
        _1909 = 1.0;
    }
    float _1913 = _1909;
    float _1915 = as_type<float>(_1881) * _1905;
    bool _1917 = !_599;
    float _1919 = _1917 ? 7.345489978790283203125 : 1.0;
    float _1921 = trunc(_1915);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    bool _1927 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1929 = isnan(0.5);
    bool _1931 = _1927 || _1929;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1935 = _1931 || _1933;
    float _1937 = _1919 * _583;
    float _1939 = floor(_1937);
    float _1941 = _1913;
    if (_1935)
    {
        _1844 = 1.0;
    }
    float _1943 = _1844;
    int _1945 = int(_1889) + int(_1925);
    int _1947 = _1897 * _1945;
    int _1949 = _1947 + _1875;
    float _1951 = -_1939;
    float _1953 = _1937 + _1951;
    bool _1955 = uint(_1949) >= uint(_595);
    float _1957 = float(_1875);
    bool _1959 = !_1955;
    int _1961 = _1959 ? 0 : (-1);
    bool _1963 = _1957 >= _931;
    bool _1965 = isnan(_1957);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(_931);
    bool _1971 = _1967 || _1969;
    float _1973 = float(_1971);
    float _1975 = _1953 * _931;
    int _1977 = ~_1945;
    int _1979 = _1977 + _1961;
    int _1981 = _1979 + 1;
    float _1983 = _1957;
    float _1985 = _1943;
    if (_1935)
    {
        _1983 = 1.0;
    }
    float _1987 = _1983;
    float _1989 = _1987;
    if (!_1935)
    {
        float _1991 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1993 = _1991 * 0.15915493667125701904296875;
        float _1995 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1997 = _1993 * 6.283185482025146484375;
        float _1999 = cos(_1997);
        float _2001 = _1995 * 0.15915493667125701904296875;
        float _2003 = _1993 * 6.283185482025146484375;
        float _2005 = sin(_2003);
        float _2007 = 1.0 / _1999;
        float _2009 = _2001 * 6.283185482025146484375;
        float _2011 = cos(_2009);
        float _2013 = _2005 * _2007;
        float _2015 = _2001 * 6.283185482025146484375;
        float _2017 = sin(_2015);
        float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2021 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2019;
        float _2023 = _2011 * _2013;
        float _2025 = 1.0 / _2021;
        float _2027 = 1.0 / _2023;
        float _2029 = _2017 * _2027;
        float _2031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2033 = fma(_1039, _2029, _2031);
        float _2035 = _2033 * _2025;
        float _2037 = precise::clamp(_2035, 0.0, 1.0);
        _1911 = _2013;
        _1985 = _2037;
    }
    float _2039 = _1911;
    float _2041 = _1985;
    float _2043 = _2039;
    if (!_1935)
    {
        float _2045 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2047 = _2045 * 0.15915493667125701904296875;
        float _2049 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2051 = _2047 * 6.283185482025146484375;
        float _2053 = cos(_2051);
        float _2055 = _2049 * 0.15915493667125701904296875;
        float _2057 = _2047 * 6.283185482025146484375;
        float _2059 = sin(_2057);
        float _2061 = 1.0 / _2053;
        float _2063 = _2055 * 6.283185482025146484375;
        float _2065 = cos(_2063);
        float _2067 = _2059 * _2061;
        float _2069 = _2055 * 6.283185482025146484375;
        float _2071 = sin(_2069);
        float _2073 = _2065 * _2067;
        float _2075 = 1.0 / _2073;
        float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2079 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2077;
        float _2081 = 1.0 / _2079;
        float _2083 = _2071 * _2075;
        float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2087 = fma(_1039, _2083, _2085);
        float _2089 = _2087 * _2081;
        float _2091 = precise::clamp(_2089, 0.0, 1.0);
        float _2093 = -_2091;
        float _2095 = _2093 + 1.0;
        _2043 = _2061;
        _1846 = _2073;
        _1989 = _2095;
    }
    float _2097 = _2043;
    float _2099 = _1846;
    float _2101 = _1989;
    float _2103 = _2099;
    if (!_1310)
    {
        int _2105 = _1346 << 4;
        int _2107 = _2105 + 2048;
        uint _2109 = uint(int(uint(_2107) >> uint(2)));
        uint _2111 = uint(int(uint(int(_2109)) >> uint(2)));
        int _2113 = int(_2109) & 3;
        float _2115 = (*spvDescriptorSet0.vp_c15)._m0[int(_2111)][_2113];
        int _2117 = int(_2109) + 1;
        uint _2119 = uint(int(uint(_2117) >> uint(2)));
        int _2121 = _2117 & 3;
        float _2123 = (*spvDescriptorSet0.vp_c15)._m0[int(_2119)][_2121];
        int _2125 = _2107 + 8;
        uint _2127 = uint(int(uint(_2125) >> uint(2)));
        uint _2129 = uint(int(uint(int(_2127)) >> uint(2)));
        int _2131 = int(_2127) & 3;
        float _2133 = (*spvDescriptorSet0.vp_c15)._m0[int(_2129)][_2131];
        int _2135 = int(_2127) + 1;
        uint _2137 = uint(int(uint(_2135) >> uint(2)));
        int _2139 = _2135 & 3;
        float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
        float _2143 = _1043 * _2123;
        float _2145 = fma(_561, _2115, _2143);
        float _2147 = fma(_563, _2133, _2145);
        float _2149 = _2147 + _2141;
        float _2151 = precise::clamp(_2149, 0.0, 1.0);
        float _2153 = -_2151;
        float _2155 = _2153 + _1850;
        float _2157 = fma(_2155, 500.0, 1.5);
        float _2159 = exp2(_2157);
        float _2161 = 0.0 + _2159;
        float _2163 = precise::clamp(_2161, 0.0, 1.0);
        _1941 = _2163;
    }
    float _2165 = _1941;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2169 = _1684 + _2167;
    float _2171 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2173 = _1686 + _2171;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2177 = _1688 + _2175;
    float _2179 = trunc(_1973);
    int _2181 = int(_2179);
    float _2183 = _2169 * _2169;
    int _2185 = _595 * _1981;
    int _2187 = _2185 + _1875;
    float _2189 = fma(_2173, _2173, _2183);
    float _2191 = trunc(_1975);
    int _2193 = int(_2191);
    float _2195 = fma(_2177, _2177, _2189);
    float _2197 = rsqrt(_2195);
    float _2199 = sqrt(_2195);
    float _2201 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2203 = _2173 * _2201;
    float _2205 = _2177 * _2201;
    float _2207 = _2203 * _2203;
    float _2209 = _2205 * _2205;
    float _2211 = _2207 + _2209;
    float _2213 = sqrt(_2211);
    bool _2215 = _2213 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2219 = _2213 + _2217;
    float _2221 = _1850;
    float _2223 = _2211;
    float _2225 = _2219;
    float _2227 = _2201;
    float _2229 = _2205;
    float _2231 = _2207;
    float _2233 = _2209;
    if (_2215)
    {
        float _2235 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2221 = _2235;
    }
    float _2237 = _2221;
    if (_2215)
    {
        float _2239 = rsqrt(_2211);
        _2223 = _2239;
    }
    float _2241 = _2223;
    if (_2215)
    {
        float _2243 = _2219 * _2237;
        _2225 = _2243;
    }
    float _2245 = _2225;
    if (_2215)
    {
        float _2247 = _2245 * 0.15915493667125701904296875;
        _2103 = _2247;
    }
    float _2249 = _2103;
    float _2251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2253 = _2097;
    if (_2215)
    {
        float _2255 = _2249 * 6.283185482025146484375;
        float _2257 = sin(_2255);
        _2253 = _2257;
    }
    float _2259 = _2253;
    float _2261 = precise::max(0.0, _2251);
    float _2263 = _2245;
    float _2265 = _2261;
    if (_2215)
    {
        float _2267 = _2249 * 6.283185482025146484375;
        float _2269 = cos(_2267);
        _2263 = _2269;
    }
    float _2271 = _2263;
    float _2273 = -_2201;
    float _2275 = -_2261;
    float _2277 = fma(_2169, _2273, _2275);
    float _2279 = _2277;
    if (_2215)
    {
        float _2281 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2227 = _2281;
    }
    float _2283 = _2227;
    float _2285 = _2259;
    float _2287 = _2283;
    if (_2215)
    {
        float _2289 = fma(_2259, _2283, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2285 = _2289;
    }
    float _2291 = _2285;
    float _2293 = _2291;
    if (!_2215)
    {
        _2287 = _2203;
    }
    float _2295 = _2287;
    float _2297 = _2295;
    if (_2215)
    {
        float _2299 = _2241 * _2291;
        _2293 = _2299;
    }
    float _2301 = _2293;
    if (_2215)
    {
        float _2303 = _2271 + (-1.0);
        _2265 = _2303;
    }
    float _2305 = _2265;
    float _2307 = _2305;
    if (_2215)
    {
        float _2309 = _2203 * _2301;
        _2297 = _2309;
    }
    float _2311 = _2297;
    if (_2215)
    {
        float _2313 = _2205 * _2301;
        _2229 = _2313;
    }
    float _2315 = _2229;
    if (_2215)
    {
        float _2317 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2307 = _2317;
    }
    float _2319 = _2307;
    if (_2215)
    {
        float _2321 = _2311 * _2311;
        _2231 = _2321;
    }
    float _2323 = _2231;
    if (_2215)
    {
        float _2325 = _2315 * _2315;
        _2233 = _2325;
    }
    float _2327 = _2233;
    if (_2215)
    {
        float _2329 = fma(_2277, _2271, _2319);
        _2279 = _2329;
    }
    float _2331 = _2279;
    bool _2333 = _595 == 0;
    float _2335 = fma(_2331, _2331, _2323);
    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2339 = fma(_2199, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2337);
    float _2341 = precise::clamp(_2339, 0.0, 1.0);
    bool _2343 = !_2333;
    int _2345 = _2343 ? _2187 : (-1);
    float _2347 = _2335 + _2327;
    float _2349 = -_2341;
    float _2351 = _2349 + 1.0;
    float _2353 = rsqrt(_2347);
    float _2355 = abs(_2351);
    float _2357 = log2(_2355);
    float _2359 = _2353 * _2311;
    float _2361 = _2353 * _2331;
    float _2363 = _2353 * _2315;
    float _2365 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2367 = _2361 + 1.0;
    float _2369 = -_2365;
    float _2371 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2369);
    float _2373 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2375 = -_2363;
    float _2377 = fma(_2375, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2371);
    float _2379 = exp2(_2373);
    float _2381 = fma(_2377, -0.5, 0.5);
    float _2383 = fma(_2377, 0.5, 0.5);
    float _2385 = fma(_2383, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2387 = sqrt(_2381);
    float _2389 = fma(_2383, _2385, -0.212114393711090087890625);
    float _2391 = fma(_2383, _2389, 1.570728778839111328125);
    float _2393 = -_2361;
    float _2395 = fma(_2379, _2367, _2393);
    float _2397 = fma(_2395, 0.5, 0.5);
    int _2399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2401 = _2399 != 0;
    float _2403 = _2387 * 0.636619746685028076171875;
    float _2405 = -_2391;
    float _2407 = fma(_2403, _2405, 1.0);
    int _2409 = ~_2181;
    int _2411 = _2409 + 1;
    int _2413 = _2411 + 1;
    float2 _7083 = float2(_2407, _2397);
    float3 _2417 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7083, float2(0.0), isnan(_7083)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7083, float2(0.0), isnan(_7083)), level(0.0)).xyz;
    float _2419 = _2417.x;
    float _2421 = _2417.y;
    float _2423 = _2417.z;
    float _2425 = trunc(_1907);
    int _2427 = int(_2425);
    int _2429 = _595 + (-1);
    int _2431 = _2345 * _2413;
    bool _2433 = !_2401;
    int _2435 = _2433 ? 0 : 1;
    float _2437 = -_945;
    float _2439 = _2437 + 1.0;
    int _2441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2443 = _2441 != 0;
    int _2445 = _2181 * _2429;
    int _2447 = _2445 + _2431;
    int _2449 = abs(_627);
    float _2451 = -_763;
    float _2453 = _2451 + 1.0;
    int _2455 = abs(_633);
    float _2457 = -_815;
    float _2459 = _2457 + 1.0;
    float _2461 = -_781;
    float _2463 = _2461 + 1.0;
    int _2465 = abs(_2435);
    float _2467 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2469 = !_2443;
    int _2471 = _2469 ? 0 : 1;
    float _2473 = -_581;
    float _2475 = _2473 + 1.0;
    int _2477 = abs(_639);
    int _2479 = _2447 * _2449;
    int _2481 = _2193 * _2465;
    int _2483 = _2481 + _1875;
    int _2485 = abs(_2471);
    float _2487 = exp2(_2467);
    int _2489 = _2427 * _2455;
    int _2491 = _2489 + _2479;
    int _2493 = ~_595;
    int _2495 = _2493 + 1;
    bool _2497 = _583 > 0.5;
    int _2499 = _2483 * _2477;
    int _2501 = _2499 + _2491;
    bool _2503 = _589 > 0.5;
    float _2505 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2507 = _541 + _2505;
    bool _2509 = _585 > 0.5;
    int _2511 = _2193 * _2485;
    int _2513 = _2511 + _2501;
    int _2515 = ~_595;
    int _2517 = _2515 + 1;
    bool _2519 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2521 = isnan(_541);
    bool _2523 = _2519 || _2521;
    bool _2525 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2527 = _2523 || _2525;
    float _2529 = float(_2527);
    float _2531 = float(uint(_2513));
    int _2533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2535 = _2533 != 0;
    float _2537 = -_193;
    int _2539 = _2497 ? as_type<int>(_2537) : as_type<int>(_193);
    float _2541 = as_type<float>(_1881) * _2531;
    int _2543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2545 = _2543 != 0;
    float _2547 = float(uint(_2483));
    float _2549 = trunc(_2541);
    float _2551 = precise::max(_2549, 0.0);
    uint _2553 = uint(_2551);
    float _2555 = as_type<float>(_1881) * _2547;
    int _2557 = _2517 * int(_2553);
    int _2559 = _2557 + _2513;
    float _2561 = float(uint(_2559));
    float _2563 = as_type<float>(_1881) * _2561;
    float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2567 = _2565 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2569 = trunc(_2563);
    float _2571 = precise::max(_2569, 0.0);
    uint _2573 = uint(_2571);
    float _2575 = 1.0 / _2567;
    int _2577 = int(_2553) + int(_2573);
    float _2579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2581 = -_203;
    int _2583 = _2509 ? as_type<int>(_2581) : as_type<int>(_203);
    int _2585 = _2495 * _2577;
    int _2587 = _2585 + _2513;
    int _2589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2591 = _2589 != 0;
    float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2595 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2593;
    bool _2597 = uint(_2587) >= uint(_595);
    float _2599 = _2595 * _2575;
    bool _2601 = !_2597;
    int _2603 = _2601 ? 0 : (-1);
    float _2605 = fma(_2599, _2507, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2607 = _587 > 0.5;
    float _2609 = -_2529;
    float _2611 = _2609 + 1.0;
    int _2613 = ~_2577;
    int _2615 = _2613 + _2603;
    int _2617 = _2615 + 1;
    float _2619 = _2579 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2621 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2623 = isnan(_541);
    bool _2625 = _2621 || _2623;
    bool _2627 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2629 = _2625 || _2627;
    float _2631 = float(_2629);
    float _2633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2635 = !_2535;
    float _2637 = _2635 ? _193 : as_type<float>(_2539);
    int _2639 = _595 * _2617;
    int _2641 = _2639 + _2513;
    bool _2643 = !_2545;
    float _2645 = _2643 ? _203 : as_type<float>(_2583);
    float _2647 = _2631 * _2611;
    int _2649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2651 = _2649 != 0;
    float _2653 = _2637 + 0.5;
    bool _2655 = !_2333;
    int _2657 = _2655 ? _2641 : (-1);
    float _2659 = _2645 + (-0.5);
    float _2661 = _2605 * _2647;
    float _2663 = -_193;
    int _2665 = _2607 ? as_type<int>(_2663) : as_type<int>(_193);
    float _2667 = fma(_2653, (*spvDescriptorSet0.vp_c9)._m0[80].x, _691);
    float _2669 = -_2659;
    float _2671 = -_695;
    float _2673 = fma(_2669, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2671);
    float _2675 = -_2631;
    float _2677 = _2675 + 1.0;
    float _2679 = -_203;
    int _2681 = _2503 ? as_type<int>(_2679) : as_type<int>(_203);
    float _2683 = trunc(_2555);
    float _2685 = precise::max(_2683, 0.0);
    uint _2687 = uint(_2685);
    bool _2689 = !_2651;
    float _2691 = _2689 ? _193 : as_type<float>(_2665);
    float _2693 = _2633 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2695 = !_2591;
    float _2697 = _2695 ? _203 : as_type<float>(_2681);
    float _2699 = fma(_2677, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2661);
    float _2701 = fma(_2645, _2453, _2673);
    float _2703 = _2691 + 0.5;
    int _2705 = _2657 & 3;
    bool _2707 = _2705 != 0;
    float _2709 = _2697 + (-0.5);
    float _2711 = fma(_2529, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2699);
    float _2713 = fma(_2619, _2703, _785);
    int _2715 = _2657 >> 31;
    float _2717 = -_2693;
    float _2719 = -_837;
    float _2721 = fma(_2717, _2709, _2719);
    int _2723 = ~_595;
    int _2725 = _2723 + 1;
    float _2727 = abs(_1039);
    float _2729 = log2(_2727);
    int _2731 = _2715 & 3;
    float _2733 = -_2439;
    float _2735 = fma(_2637, _2733, _2667);
    float _2737 = fma(_2697, _2463, _2721);
    int _2739 = _2725 * int(_2687);
    int _2741 = _2739 + _2483;
    int _2743 = _2657 + _2731;
    float _2745 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2747 = _2657 & 3;
    bool _2749 = _2747 != 0;
    float _2751 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2753 = _2743 >> 2;
    float _2755 = -_1073;
    float _2757 = fma(_2755, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2745);
    float _2759 = float(uint(_2741));
    float _2761 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2763 = _2753 << 4;
    int _2765 = _2763 + 368;
    float _2767 = -_2459;
    float _2769 = fma(_2691, _2767, _2713);
    bool _2771 = uint(_2747) > 1u;
    float _2773 = as_type<float>(_1881) * _2759;
    uint _2775 = uint(int(uint(_2765) >> uint(2)));
    uint _2777 = uint(int(uint(int(_2775)) >> uint(2)));
    int _2779 = int(_2775) & 3;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[int(_2777)][_2779];
    int _2783 = int(_2775) + 1;
    uint _2785 = uint(int(uint(_2783) >> uint(2)));
    int _2787 = _2783 & 3;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[int(_2785)][_2787];
    float _2791 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_76.x = _2735;
    out.m_76.y = _2701;
    out.m_76.z = _2769;
    out.m_76.w = _2737;
    float _2793 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2795 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2797 = trunc(_2773);
    float _2799 = precise::max(_2797, 0.0);
    uint _2801 = uint(_2799);
    float _2803 = _2711 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2805 = -_1073;
    float _2807 = fma(_2805, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2795);
    int _2809 = ~_595;
    int _2811 = _2809 + 1;
    int _2813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2815 = _2813 != 0;
    out.m_78.w = _2803;
    float _2817 = exp2(_2791);
    bool _2819 = _1039 <= 8000.0;
    bool _2821 = isnan(_1039);
    bool _2823 = _2819 || _2821;
    bool _2825 = isnan(8000.0);
    bool _2827 = _2823 || _2825;
    float _2829 = float(_2827);
    int _2831 = _2765 + 8;
    uint _2833 = uint(int(uint(_2831) >> uint(2)));
    uint _2835 = uint(int(uint(int(_2833)) >> uint(2)));
    int _2837 = int(_2833) & 3;
    float _2839 = (*spvDescriptorSet0.vp_c9)._m0[int(_2835)][_2837];
    int _2841 = int(_2833) + 1;
    uint _2843 = uint(int(uint(_2841) >> uint(2)));
    int _2845 = _2841 & 3;
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[int(_2843)][_2845];
    float _2849 = -_1073;
    float _2851 = fma(_2849, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2793);
    int _2853 = _2707 ? 0 : 1;
    float _2855 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2857 = int(_2687) + int(_2801);
    float _2859 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2851);
    float _2861 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2757);
    float _2863 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2807);
    float _2865 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2855);
    int _2867 = _2811 * _2857;
    int _2869 = _2867 + _2483;
    float _2871 = _2751 * _2861;
    float _2873 = fma(_2817, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2875 = precise::clamp(_2873, 0.0, 1.0);
    int _2877 = ~_2853;
    int _2879 = _2877 + 1;
    int _2881 = _2879 + 1;
    float _2883 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2885 = _2881;
    if (!_2771)
    {
        int _2887 = ~_2853;
        int _2889 = _2887 + 1;
        _2885 = _2889;
    }
    int _2891 = _2885;
    float _2893 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2761);
    bool _2895 = !_2749;
    int _2897 = _2895 ? 0 : 1;
    float _2899 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2883);
    int _2901 = abs(_2891);
    bool _2903 = _2747 != 3;
    bool _2905 = uint(_2869) >= uint(_595);
    int _2907 = abs(_2897);
    bool _2909 = uint(_2747) >= 2u;
    bool _2911 = !_2905;
    int _2913 = _2911 ? 0 : (-1);
    int _2915 = ~_2901;
    int _2917 = _2915 + 1;
    int _2919 = _2917 + 1;
    int _2921 = _2909 ? 0 : 1;
    int _2923 = ~_2857;
    int _2925 = _2923 + _2913;
    int _2927 = _2925 + 1;
    int _2929 = _2919 * as_type<int>(_2789);
    int _2931 = ~_2907;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    float _2937 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2939 = ~_2921;
    int _2941 = _2939 + 1;
    int _2943 = _2941 + 1;
    int _2945 = _595 * _2927;
    int _2947 = _2945 + _2483;
    bool _2949 = _2747 != 3;
    int _2951 = _2935 * as_type<int>(_2781);
    int _2953 = _2951 + _2929;
    int _2955 = _2943;
    if (_2903)
    {
        int _2957 = ~_2921;
        int _2959 = _2957 + 1;
        _2955 = _2959;
    }
    int _2961 = _2955;
    float _2963 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2965 = !_2815;
    int _2967 = _2965 ? 0 : 1;
    float _2969 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2937);
    bool _2971 = !_2949;
    int _2973 = _2971 ? 0 : (-1);
    float _2975 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2963);
    int _2977 = abs(_2961);
    float _2979 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2893);
    int _2981 = abs(_2967);
    float _2983 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2975);
    int _2985 = abs(_2973);
    float _2987 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2989 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2987);
    int _2991 = ~_2977;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    int _2997 = ~_2985;
    int _2999 = _2997 + 1;
    int _3001 = _2999 + 1;
    float _3003 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2989);
    int _3005 = _2995 * as_type<int>(_2839);
    int _3007 = _3005 + _2953;
    float _3009 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3011 = _2751 * _2863;
    float _3013 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2969);
    int _3015 = _3001 * as_type<int>(_2847);
    int _3017 = _3015 + _3007;
    float _3019 = _2751 * _2859;
    float _3021 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2865);
    float _3023 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3025 = ~_2981;
    int _3027 = _3025 + 1;
    int _3029 = _3027 + 1;
    float _3031 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2899);
    float _3033 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3009);
    float _3035 = fma(_3023, _3021, _3019);
    float _3037 = fma(_3023, _2979, _2871);
    float _3039 = fma(_3023, _3031, _3011);
    int _3041 = _3017 * _3029;
    bool _3043 = !_2333;
    int _3045 = _3043 ? _2947 : (-1);
    float _3047 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3033);
    float _3049 = _3013 + _3039;
    float _3051 = fma(_2875, -2.0, 3.0);
    float _3053 = _2875 * _2875;
    int _3055 = _3045 * _2981;
    int _3057 = _3055 + _3041;
    float _3059 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3047);
    float _3061 = _1780 * 0.5;
    float _3063 = _3053 * _3051;
    float _3065 = _3059 + _1780;
    float _3067 = float(_3057);
    float _3069 = _1804 + _1780;
    out.gl_Position.x = _1804;
    out.gl_Position.y = _1806;
    out.gl_Position.z = _3059;
    out.gl_Position.w = _1780;
    float _3071 = _3065 * 0.5;
    float _3073 = fma(_1806, -0.5, _3061);
    float _3075 = _3069 * 0.5;
    float _3077 = _2983 + _3035;
    float _3079 = _3003 + _3037;
    out.m_80.x = _3067;
    out.m_82.x = _3075;
    out.m_82.y = _3073;
    out.m_82.z = _3071;
    out.m_82.w = _1780;
    float _3081 = -_3063;
    float _3083 = _3081 + 1.0;
    out.m_84.x = _3077;
    out.m_84.y = _3079;
    out.m_84.z = _3049;
    float _3085 = fma(_3083, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3063);
    float _3087 = _2829 * _3085;
    float _3089 = -_2487;
    float _3091 = _3089 + 1.0;
    float _3093 = _3073;
    float _3095 = _3071;
    if (!_1754)
    {
        _3093 = 1.0;
    }
    float _3097 = _3093;
    float _3099 = _3087 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3101 = _3097;
    if (_1754)
    {
        bool _3103 = _1856 >= _1830;
        bool _3105 = isnan(_1856);
        bool _3107 = _3103 || _3105;
        bool _3109 = isnan(_1830);
        bool _3111 = _3107 || _3109;
        float _3113 = float(_3111);
        _3101 = _3113;
    }
    float _3115 = _3101;
    float _3117 = _3091 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3119 = _2199 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3121 = isnan(_2199);
    bool _3123 = _3119 || _3121;
    bool _3125 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3127 = _3123 || _3125;
    float _3129 = _2475 * _3099;
    float _3131 = precise::clamp(_3129, 0.0, 1.0);
    float _3133 = _3117 * _1858;
    float _3135 = _3115 * _2165;
    float _3137 = -_3131;
    float _3139 = fma(_3137, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3141 = -_3117;
    float _3143 = _3141 + 1.0;
    float _3145 = _1869 * _3133;
    float _3147 = _2423 * _3133;
    float _3149 = -_3135;
    float _3151 = fma(_3149, _3139, 1.0);
    float _3153 = precise::clamp(_3151, 0.0, 1.0);
    float _3155 = _1869 * _3143;
    float _3157 = fma(_2419, _3145, _1863);
    float _3159 = fma(_2421, _3145, _1865);
    float _3161 = _3153 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3163 = fma(_1869, _3147, _1867);
    float _3165 = _2041 * _2101;
    float _3167 = _3153;
    float _3169 = _3165;
    if (!_3127)
    {
        _3095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3171 = _3095;
    out.m_86.x = _3161;
    float _3173 = _3165 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3175 = _3171;
    float _3177 = _3171;
    if (!_3127)
    {
        _3167 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3179 = _3167;
    out.m_88.x = _3157;
    out.m_88.y = _3159;
    out.m_88.z = _3163;
    out.m_88.w = _3155;
    float _3181 = _3179;
    float _3183 = _3179;
    if (!_3127)
    {
        _3169 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3185 = _3169;
    bool _3187 = !_3127;
    float _3189 = _3185;
    float _3191 = _3185;
    if (!_3187)
    {
        bool _3193 = _2199 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3195 = isnan(_2199);
        bool _3197 = _3193 || _3195;
        bool _3199 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3201 = _3197 || _3199;
        if (!_3201)
        {
            float _3203 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3205 = _2199 + _3203;
            float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3209 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3207;
            float _3211 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3219 = 1.0 / _3209;
            float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3223 = _3221 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3225 = _3205 * _3219;
            float _3227 = precise::clamp(_3225, 0.0, 1.0);
            float _3229 = fma(_3227, _3213, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3231 = fma(_3227, _3217, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3233 = fma(_3227, _3223, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3183 = _3231;
            _3177 = _3229;
            _3191 = _3233;
            _3235 = true;
        }
        else
        {
            bool _3237 = _2199 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3239 = isnan(_2199);
            bool _3241 = _3237 || _3239;
            bool _3243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3245 = _3241 || _3243;
            if (!_3245)
            {
                _3175 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3247 = _3175;
            _3177 = _3247;
            if (!_3245)
            {
                _3181 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3249 = _3181;
            _3183 = _3249;
            if (!_3245)
            {
                _3189 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3251 = _3189;
            bool _3253 = !_3245;
            _3191 = _3251;
            if (!_3253)
            {
                bool _3255 = _2199 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3257 = isnan(_2199);
                bool _3259 = _3255 || _3257;
                bool _3261 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3263 = _3259 || _3261;
                if (!_3263)
                {
                    float _3265 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3267 = _2199 + _3265;
                    float _3269 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3271 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3269;
                    float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3275 = _3273 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3277 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3279 = _3277 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3281 = 1.0 / _3271;
                    float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3287 = _3267 * _3281;
                    float _3289 = precise::clamp(_3287, 0.0, 1.0);
                    float _3291 = fma(_3289, _3275, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3293 = fma(_3289, _3279, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3295 = fma(_3289, _3285, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3183 = _3293;
                    _3177 = _3291;
                    _3191 = _3295;
                    _3235 = true;
                }
                else
                {
                    _3183 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3177 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3191 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3235 = false;
    float _3297 = _3183;
    float _3299 = _3177;
    float _3301 = _3191;
    float _3303 = _3173 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_90.x = 0.0;
    float _3305 = _3297 * 0.586610972881317138671875;
    bool _3307 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_59.x = _3303;
    float _3309 = fma(_3299, 0.298911988735198974609375, _3305);
    bool _3311 = _2041 > 0.0;
    bool _3313 = isnan(_2041);
    bool _3315 = _3311 || _3313;
    bool _3317 = isnan(0.0);
    bool _3319 = _3315 || _3317;
    float _3321 = fma(_3301, 0.114477999508380889892578125, _3309);
    bool _3323 = _2101 <= 0.0;
    bool _3325 = !_3319;
    bool _3327 = _3323 || _3325;
    float _3329 = -_3321;
    float _3331 = _3329 + _3299;
    float _3333 = -_3321;
    float _3335 = _3333 + _3297;
    float _3337 = -_3321;
    float _3339 = _3337 + _3301;
    float _3341 = fma(_3331, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3321);
    float _3343 = fma(_3335, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3321);
    float _3345 = fma(_3339, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3321);
    bool _3347 = !_3307;
    if (!_3347)
    {
        float _3349 = -_1684;
        float _3351 = _3349 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3353 = -_1686;
        float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3357 = -_1688;
        float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3361 = _3351 * _3351;
        float _3363 = fma(_3355, _3355, _3361);
        float _3365 = fma(_3359, _3359, _3363);
        float _3367 = sqrt(_3365);
        float _3369 = rsqrt(_3365);
        float _3371 = -_3367;
        float _3373 = _3371 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3375 = _3373 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3377 = precise::clamp(_3375, 0.0, 1.0);
        float _3379 = _3355 * _3369;
        float _3381 = _3351 * _3369;
        float _3383 = abs(_3377);
        float _3385 = log2(_3383);
        float _3387 = _3359 * _3369;
        float _3389 = _3379 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3391 = _3079 * _3381;
        float _3393 = -_3381;
        float _3395 = -_3389;
        float _3397 = fma(_3393, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3395);
        float _3399 = fma(_3077, _3379, _3391);
        float _3401 = -_3387;
        float _3403 = fma(_3401, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3397);
        float _3405 = fma(_3049, _3387, _3399);
        float _3407 = precise::clamp(_3405, 0.0, 1.0);
        float _3409 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3411 = _3403 + _3409;
        float _3413 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3415 = _3411 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3417 = precise::clamp(_3415, 0.0, 1.0);
        float _3419 = exp2(_3413);
        float _3421 = _3419 * _3417;
        float _3423 = _3407 * _3421;
        float _3425 = _3423 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3427 = _3423 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3429 = _3423 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3425;
        out.m_90.y = _3427;
        out.m_90.z = _3429;
    }
    out.m_92.x = _3341;
    out.m_92.y = _3343;
    out.m_92.z = _3345;
    if (!_3327)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _3431 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3431;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3235 = false;
    bool _531 = false;
    bool _339 = false;
    bool _237 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _3488 = as_type<float>(_127);
        out.gl_Position.z = _3488;
    }
    if (!_115)
    {
        return out;
    }
    float _131 = in.m_61.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_59.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3558 = as_type<float>(_165);
        out.gl_Position.z = _3558;
    }
    if (_157)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_66.x;
    float _171 = in.m_66.y;
    float _173 = in.m_66.z;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_177;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _207 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _209 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _211 = !_183;
    float _213 = _205;
    float _215 = _207;
    float _217 = _209;
    float _235;
    if (!_211)
    {
        float _219 = in.m_68.x;
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _223 = _219 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _227 = _225 * _221;
        float _229 = floor(_227);
        float _231 = -_229;
        float _233 = _227 + _231;
        _235 = _233;
        _237 = true;
    }
    else
    {
        float _239 = float(_111);
        float _241 = 1.0 / _239;
        float _243 = _145 * _241;
        _235 = _243;
    }
    _237 = false;
    float _245 = _235;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _245 + _247;
    bool _251 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _253 = isnan(_245);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -_261;
    float _269 = _267 + 1.0;
    bool _271 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _273 = isnan(_245);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _283;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _289 = 1.0 / _265;
    float _291 = _281 * _269;
    float _293 = -_281;
    float _295 = _293 + 1.0;
    float _297 = _249 * _289;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _299;
    float _303 = fma(_285, _297, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _305 = fma(_301, _297, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _307 = _303 * _291;
    float _309 = _305 * _291;
    float _311 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].x, _307);
    float _313 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].y, _309);
    float _315 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[144].x, _311);
    float _317 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[144].y, _313);
    bool _319 = !_287;
    float _337;
    if (!_319)
    {
        float _321 = in.m_68.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_111);
        float _343 = 1.0 / _341;
        float _345 = _145 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _337;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _351 = _347 + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _361 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _363 = isnan(_347);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _377 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _379 = isnan(_347);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = 1.0 / _355;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _391;
    float _395 = -_371;
    float _397 = _395 + 1.0;
    bool _399 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _401 = isnan(_347);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    bool _411 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _413 = 1.0 / _359;
    float _415 = 1.0 / _375;
    float _417 = _393 * _389;
    float _419 = -_387;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _427 = _387 * _397;
    float _429 = fma(_417, _351, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _431 = _409 * _421;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _433;
    float _437 = _425 * _413;
    bool _439 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _441 = isnan(_347);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _453 = _347 + _451;
    float _455 = _429 * _431;
    float _457 = -_409;
    float _459 = _457 + 1.0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _463 = _347 + _461;
    float _465 = fma(_437, _453, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _467 = -_449;
    float _469 = _467 + 1.0;
    float _471 = _435 * _415;
    float _473 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[115].x, _455);
    float _475 = _371 * _469;
    float _477 = fma(_471, _463, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _479 = fma(_465, _427, _473);
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _483 = fma(_477, _475, _479);
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _487 = _481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _489 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[118].x, _483);
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = _485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _489 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _497 = in.m_70.x;
    float _499 = in.m_70.y;
    float _501 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _487;
    out.m_72.y = _501;
    out.m_72.z = _493;
    out.m_72.w = _495;
    float _503 = _317 * _499;
    float _505 = _315 * _497;
    bool _507 = !_411;
    float _527;
    float _529;
    if (!_507)
    {
        float _509 = in.m_68.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _513 = float(_111);
        float _515 = _509 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _517 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _519 = _517 * _511;
        float _521 = floor(_519);
        float _523 = -_521;
        float _525 = _519 + _523;
        _527 = _513;
        _529 = _525;
        _531 = true;
    }
    else
    {
        float _533 = float(_111);
        float _535 = 1.0 / _533;
        float _537 = _145 * _535;
        _527 = _533;
        _529 = _537;
    }
    _531 = false;
    float _539 = _527;
    float _541 = _529;
    float _543 = in.m_56.x;
    float _545 = in.m_56.y;
    float _547 = in.m_56.z;
    float _549 = _545 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _551 = _545 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _553 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[4].x, _549);
    float _555 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[6].x, _551);
    float _557 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[4].z, _553);
    float _559 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[6].z, _555);
    float _561 = _557 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _563 = _559 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _565 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _567 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _569 = floor(_565);
    float _571 = floor(_567);
    float _573 = -_569;
    float _575 = _565 + _573;
    float _577 = -_571;
    float _579 = _567 + _577;
    float2 _4227 = float2(_575, _579);
    float _581 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4227, float2(0.0), isnan(_4227)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4227, float2(0.0), isnan(_4227)), level(0.0)).x;
    float _583 = in.m_68.x;
    float _585 = in.m_68.y;
    float _587 = in.m_68.z;
    float _589 = in.m_68.w;
    float _591 = _545 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _595 = int(_593);
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _599 = _597 != 0;
    float _601 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[5].x, _591);
    float _603 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _611 = _609 != 0;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _615 = _613 != 0;
    float _617 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[5].z, _601);
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _621 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _623 = log2(_621);
    bool _625 = !_611;
    int _627 = _625 ? 0 : 1;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _631 = !_607;
    int _633 = _631 ? 0 : 1;
    float _635 = _617 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _637 = !_615;
    int _639 = _637 ? 0 : 1;
    float _641 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _643 = _635 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _645 = _583 * 2.0;
    float _647 = _587 * 2.0;
    float _649 = _585 * 2.0;
    float _651 = _583 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _653 = floor(_645);
    float _655 = _543;
    float _657 = _601;
    if (!_599)
    {
        _655 = _587;
    }
    float _659 = _655;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _663 = -_619;
    float _665 = fma(_651, 2.0, _663);
    float _667 = _585 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _669 = _659;
    if (_599)
    {
        _669 = _585;
    }
    float _671 = _669;
    float _673 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[11].x, _643);
    float _675 = _671;
    if (!_599)
    {
        _657 = _585;
    }
    float _677 = _657;
    float _679 = floor(_647);
    float _681 = _585 + _583;
    float _683 = fma(_667, -2.0, _629);
    float _685 = _677;
    if (_599)
    {
        _685 = _583;
    }
    float _687 = _685;
    float _689 = -_145;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[76].x, _665);
    float _693 = _681 + (-1.0);
    float _695 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _683);
    float _697 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[11].z, _673);
    float _699 = floor(_649);
    bool _701 = _653 > 0.0;
    float _703 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _705 = _653 >= 0.0;
    bool _707 = isnan(_653);
    bool _709 = _705 || _707;
    bool _711 = isnan(0.0);
    bool _713 = _709 || _711;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _717 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _721 = _719 != 0;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _725 = _723 != 0;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _729 = _727 != 0;
    float _731 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _733 = int(_731);
    bool _735 = _679 >= 0.0;
    bool _737 = isnan(_679);
    bool _739 = _735 || _737;
    bool _741 = isnan(0.0);
    bool _743 = _739 || _741;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _747 = _713 ? 0 : 1;
    float _749 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[78].w, _715);
    int _751 = _743 ? 0 : 1;
    float _753 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[83].w, _745);
    bool _755 = _679 > 0.0;
    float _757 = _687 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _759 = !_721;
    int _761 = _759 ? 0 : 1;
    float _763 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _749);
    bool _765 = _699 > 0.0;
    float _767 = -_661;
    float _769 = fma(_757, 2.0, _767);
    bool _771 = _699 >= 0.0;
    bool _773 = isnan(_699);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    float _781 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _753);
    float _783 = -_145;
    float _785 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[81].x, _769);
    if (!_599)
    {
        _675 = _587;
    }
    float _787 = _675;
    int _789 = ~_751;
    int _791 = _789 + 1;
    int _793 = _791 + 1;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _797 = _787;
    int _799 = _793;
    if (_599)
    {
        _797 = _585;
    }
    float _801 = _797;
    if (!_755)
    {
        int _803 = ~_751;
        int _805 = _803 + 1;
        _799 = _805;
    }
    int _807 = _799;
    float _809 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[83].z, _795);
    float _811 = _801 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _813 = abs(_761);
    float _815 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _809);
    int _817 = _779 ? 0 : 1;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _821 = float(_733);
    int _823 = ~_817;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    float _829 = fma(_811, -2.0, _819);
    float _831 = float(_813);
    float _833 = 1.0 / _821;
    float _835 = float(_807);
    float _837 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _829);
    int _839 = _827;
    if (!_765)
    {
        int _841 = ~_817;
        int _843 = _841 + 1;
        _839 = _843;
    }
    int _845 = _839;
    float _847 = _623 * _145;
    int _849 = ~_747;
    int _851 = _849 + 1;
    int _853 = _851 + 1;
    float _855 = _831 * _835;
    int _857 = _853;
    if (!_701)
    {
        int _859 = ~_747;
        int _861 = _859 + 1;
        _857 = _861;
    }
    int _863 = _857;
    float _865 = in.m_74.x;
    float _867 = in.m_74.y;
    float _869 = in.m_74.z;
    bool _871 = !_725;
    int _873 = _871 ? 0 : 1;
    float _875 = exp2(_847);
    float _877 = _855 * (-2.0);
    int _879 = abs(_873);
    float _881 = _635 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _885 = 1.0 + _883;
    float _887 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[10].x, _881);
    bool _889 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _891 = isnan(1.0);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _897 = _893 || _895;
    float _899 = 1.0 / _885;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _903 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[10].z, _887);
    float _905 = float(_863);
    float _907 = _833 * _145;
    float _909 = float(_879);
    float _911 = -_875;
    float _913 = _911 + 1.0;
    bool _915 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _917 = isnan(0.0);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _923 = _919 || _921;
    float _925 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[78].z, _901);
    float _927 = _697 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _929 = _903 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _931 = float(_595);
    float _933 = _909 * _905;
    float _935 = 1.0 / _927;
    float _937 = _923 ? _913 : 0.0;
    float _939 = _929 + _927;
    float _941 = _583 + (-0.5);
    float _943 = _931 * _145;
    float _945 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _925);
    if (_897)
    {
        float _947 = _937 * _899;
        _147 = _947;
    }
    float _949 = _147;
    float _951 = fma(_703, _877, _703);
    float _953 = fma(_877, _865, _865);
    bool _955 = !_729;
    int _957 = _955 ? 0 : 1;
    float _959 = float(_845);
    float _961 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].x, _953);
    int _963 = abs(_957);
    float _965 = _585 + _587;
    float _967 = _939 * _935;
    float _969 = _967 * 0.5;
    float _971 = fma(_951, _949, _961);
    float _973 = _965 + (-1.0);
    float _975 = _933 * (-2.0);
    float _977 = float(_963);
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _981 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[30].w, _979);
    float _983 = _971 * 0.15915493667125701904296875;
    float _985 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _987 = fma(_975, _867, _867);
    float _989 = _977 * _959;
    float _991 = _585 + (-0.5);
    float _993 = _587 + _583;
    float _995 = fma(_985, _975, _985);
    float _997 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[196].y, _987);
    float _999 = _993 + (-1.0);
    float _1001 = _989 * (-2.0);
    float _1003 = 1.0 / _981;
    float _1005 = fma(_995, _949, _997);
    float _1007 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1009 = fma(_1001, _869, _869);
    float _1011 = _587 + (-0.5);
    float _1013 = _1005 * 0.15915493667125701904296875;
    float _1015 = fma(_1007, _1001, _1007);
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1019 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1009);
    float _1021 = _983 * 6.283185482025146484375;
    float _1023 = sin(_1021);
    float _1025 = _641 * _1017;
    float _1027 = fma(_1015, _949, _1019);
    float _1029 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1031 = _1027 * 0.15915493667125701904296875;
    float _1033 = _983 * 6.283185482025146484375;
    float _1035 = cos(_1033);
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1039 = _1003 * _1037;
    float _1041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1043 = _635 + _1029;
    bool _1045 = _1039 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1047 = _603 * _1041;
    float _1049 = _1013 * 6.283185482025146484375;
    float _1051 = sin(_1049);
    bool _1053 = _1039 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1055 = _1013 * 6.283185482025146484375;
    float _1057 = cos(_1055);
    int _1059 = 2;
    if (!_1045)
    {
        _1059 = 1;
    }
    int _1061 = _1059;
    float _1063 = _1031 * 6.283185482025146484375;
    float _1065 = cos(_1063);
    float _1067 = _1023 * _1051;
    float _1069 = _1035 * _1051;
    float _1071 = _1031 * 6.283185482025146484375;
    float _1073 = sin(_1071);
    float _1075 = _1023 * _1057;
    float _1077 = _1035 * _1057;
    float _1079 = _1023 * _1065;
    float _1081 = _1057 * _1065;
    float _1083 = _1035 * _1065;
    float _1085 = _1051 * _1065;
    float _1087 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1089 = _1083 * _1025;
    float _1091 = fma(_1073, _1077, _1067);
    float _1093 = fma(_1073, _1067, _1077);
    bool _1095 = !_1045;
    int _1097 = _1095 ? 0 : 1;
    float _1099 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1087);
    float _1101 = -_1069;
    float _1103 = fma(_1073, _1075, _1101);
    float _1105 = -_1075;
    float _1107 = fma(_1073, _1069, _1105);
    int _1109 = _1061;
    if (!_1053)
    {
        _1109 = _1097;
    }
    int _1111 = _1109;
    float _1113 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1099);
    float _1115 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _1117 = _1111 << 6;
    float _1119 = _1113 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1121 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1115);
    float _1123 = -_1025;
    float _1125 = _1073 * _1123;
    float _1127 = fma(_1091, _1047, _1089);
    float _1129 = _1079 * _1025;
    float _1131 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1121);
    float _1133 = fma(_1081, _1047, _1125);
    float _1135 = fma(_1107, _717, _1127);
    float _1137 = fma(_1103, _1047, _1129);
    float _1139 = _1131 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1141 = fma(_1085, _717, _1133);
    float _1143 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1145 = fma(_1093, _717, _1137);
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1149 = trunc(_1119);
    int _1151 = int(_1149);
    float _1153 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1143);
    int _1155 = _1117 + 64;
    uint _1158 = uint(int(uint(_1155) >> uint(2)));
    uint _1160 = uint(int(uint(int(_1158)) >> uint(2)));
    int _1162 = int(_1158) & 3;
    float _1164 = (*spvDescriptorSet0.vp_c15)._m0[int(_1160)][_1162];
    int _1166 = int(_1158) + 1;
    uint _1168 = uint(int(uint(_1166) >> uint(2)));
    int _1170 = _1166 & 3;
    float _1172 = (*spvDescriptorSet0.vp_c15)._m0[int(_1168)][_1170];
    float _1174 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1147);
    float _1176 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1153);
    float _1180 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1174);
    float _1182 = trunc(_1139);
    int _1184 = int(_1182);
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1188 = _1117 + 48;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    uint _1192 = uint(int(uint(int(_1190)) >> uint(2)));
    int _1194 = int(_1190) & 3;
    float _1196 = (*spvDescriptorSet0.vp_c15)._m0[int(_1192)][_1194];
    int _1198 = int(_1190) + 1;
    uint _1200 = uint(int(uint(_1198) >> uint(2)));
    int _1202 = _1198 & 3;
    float _1204 = (*spvDescriptorSet0.vp_c15)._m0[int(_1200)][_1202];
    float _1206 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1208 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1210 = _563 + _1186;
    float _1212 = _561 + _1206;
    int _1214 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1216 = _1151 + _1214;
    int _1218 = _1216 + 1;
    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1222 = _1210 + _1220;
    int _1224 = _1117 + 56;
    uint _1226 = uint(int(uint(_1224) >> uint(2)));
    uint _1228 = uint(int(uint(int(_1226)) >> uint(2)));
    int _1230 = int(_1226) & 3;
    float _1232 = (*spvDescriptorSet0.vp_c15)._m0[int(_1228)][_1230];
    int _1234 = int(_1226) + 1;
    uint _1236 = uint(int(uint(_1234) >> uint(2)));
    int _1238 = _1234 & 3;
    float _1240 = (*spvDescriptorSet0.vp_c15)._m0[int(_1236)][_1238];
    float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1244 = _1212 + _1242;
    bool _1246 = _1218 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1248 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1208);
    int _1250 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1252 = _1184 + _1250;
    int _1254 = _1252 + 1;
    float _1256 = _1222 * _1222;
    int _1258 = _1117 + 72;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    uint _1262 = uint(int(uint(int(_1260)) >> uint(2)));
    int _1264 = int(_1260) & 3;
    float _1266 = (*spvDescriptorSet0.vp_c15)._m0[int(_1262)][_1264];
    int _1268 = int(_1260) + 1;
    uint _1270 = uint(int(uint(_1268) >> uint(2)));
    int _1272 = _1268 & 3;
    float _1274 = (*spvDescriptorSet0.vp_c15)._m0[int(_1270)][_1272];
    float _1276 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1278 = _1218 | _1254;
    float _1280 = fma(_1244, _1244, _1256);
    float _1282 = _635 + _1276;
    bool _1284 = _1278 < 0;
    bool _1286 = _1284 || _1246;
    int _1288 = _1117 + 96;
    uint _1290 = uint(int(uint(_1288) >> uint(2)));
    uint _1292 = uint(int(uint(int(_1290)) >> uint(2)));
    int _1294 = int(_1290) & 3;
    float _1296 = (*spvDescriptorSet0.vp_c15)._m0[int(_1292)][_1294];
    int _1298 = int(_1290) + 1;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    int _1302 = _1298 & 3;
    float _1304 = (*spvDescriptorSet0.vp_c15)._m0[int(_1300)][_1302];
    float _1306 = sqrt(_1280);
    bool _1308 = _1254 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1310 = _1308 || _1286;
    int _1312 = _1117 + 104;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    uint _1316 = uint(int(uint(int(_1314)) >> uint(2)));
    int _1318 = int(_1314) & 3;
    float _1320 = (*spvDescriptorSet0.vp_c15)._m0[int(_1316)][_1318];
    int _1322 = int(_1314) + 1;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    int _1326 = _1322 & 3;
    float _1328 = (*spvDescriptorSet0.vp_c15)._m0[int(_1324)][_1326];
    int _1330 = as_type<int>(_1141);
    int _1332 = _1254;
    float _1334 = _1145;
    float _1336 = _1212;
    float _1338 = _1210;
    float _1340 = as_type<float>(_1218);
    if (!_1310)
    {
        int _1342 = _1254 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1344 = _1342 + _1218;
        _1330 = _1344;
    }
    int _1346 = _1330;
    bool _1348 = _1306 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1350 = _1306;
    if (!_1310)
    {
        int _1352 = _1346 << 2;
        _1332 = _1352;
    }
    int _1354 = _1332;
    int _1356 = 0;
    int _1358 = _1354;
    if (!_1310)
    {
        uint _1360 = uint(int(uint(_1346) >> uint(2)));
        _1356 = int(_1360);
    }
    int _1362 = _1356;
    int _1364 = _1362;
    if (!_1310)
    {
        int _1366 = 12 & _1354;
        _1358 = _1366;
    }
    int _1368 = _1358;
    if (!_1310)
    {
        int _1370 = _1362 << 4;
        int _1372 = _1370 + _1368;
        _1364 = _1372;
    }
    int _1374 = _1364;
    if (!_1348)
    {
        _1334 = _1212;
    }
    float _1376 = _1334;
    float _1378 = _1376;
    if (!_1348)
    {
        _1336 = _1282;
    }
    float _1380 = _1336;
    bool _1382 = !_1348;
    float _1384 = _1380;
    if (!_1382)
    {
        float _1386 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1390 = _1306 + _1388;
        float _1392 = rsqrt(_1280);
        float _1394 = _1390 * _1386;
        float _1396 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1398 = _1394 * 0.15915493667125701904296875;
        float _1400 = _1398 * 6.283185482025146484375;
        float _1402 = sin(_1400);
        float _1404 = _1398 * 6.283185482025146484375;
        float _1406 = cos(_1404);
        float _1408 = fma(_1402, _1396, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1410 = _1392 * _1408;
        float _1412 = _1406 + (-1.0);
        float _1414 = fma(_1244, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1416 = fma(_1222, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1418 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1420 = fma(_1282, _1406, _1418);
        _1384 = _1420;
        _1378 = _1414;
        _1338 = _1416;
        _1350 = _1418;
        _1340 = _1412;
    }
    float _1422 = _1384;
    float _1424 = _1378;
    float _1426 = _1338;
    float _1428 = _1350;
    float _1430 = _1340;
    float _1432 = -_635;
    float _1434 = _1432 + _1422;
    int _1436 = _1117 + 80;
    uint _1438 = uint(int(uint(_1436) >> uint(2)));
    uint _1440 = uint(int(uint(int(_1438)) >> uint(2)));
    int _1442 = int(_1438) & 3;
    float _1444 = (*spvDescriptorSet0.vp_c15)._m0[int(_1440)][_1442];
    int _1446 = int(_1438) + 1;
    uint _1448 = uint(int(uint(_1446) >> uint(2)));
    int _1450 = _1446 & 3;
    float _1452 = (*spvDescriptorSet0.vp_c15)._m0[int(_1448)][_1450];
    float _1454 = -_561;
    float _1456 = _1454 + _1424;
    float _1458 = -_563;
    float _1460 = _1458 + _1426;
    float _1462 = _1434 * _1434;
    float _1464 = _1043 * _1304;
    float _1466 = _1043 * _1172;
    float _1468 = _1430;
    float _1470 = _1424;
    float _1472 = _1422;
    float _1474 = _1426;
    if (!_1310)
    {
        float _1476 = floor(_1119);
        _1468 = _1476;
    }
    float _1478 = _1468;
    float _1480 = fma(_1456, _1456, _1462);
    int _1482 = _1117 + 88;
    uint _1484 = uint(int(uint(_1482) >> uint(2)));
    uint _1486 = uint(int(uint(int(_1484)) >> uint(2)));
    int _1488 = int(_1484) & 3;
    float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
    int _1492 = int(_1484) + 1;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    int _1496 = _1492 & 3;
    float _1498 = (*spvDescriptorSet0.vp_c15)._m0[int(_1494)][_1496];
    float _1500 = fma(_561, _1296, _1464);
    float _1502 = fma(_561, _1164, _1466);
    float _1504 = fma(_1460, _1460, _1480);
    float _1506 = fma(_563, _1320, _1500);
    float _1508 = _1043 * _1204;
    float _1510 = sqrt(_1504);
    float _1512 = _1428;
    float _1514 = _1508;
    if (!_1310)
    {
        int _1516 = _1374 + 400;
        uint _1518 = uint(int(uint(_1516) >> uint(2)));
        uint _1520 = uint(int(uint(int(_1518)) >> uint(2)));
        int _1522 = int(_1518) & 3;
        float _1524 = (*spvDescriptorSet0.vp_c15)._m0[int(_1520)][_1522];
        _1512 = _1524;
    }
    float _1526 = _1512;
    float _1528 = _1506 + _1328;
    float _1530 = fma(_561, _1196, _1508);
    float _1532 = fma(_563, _1266, _1502);
    bool _1534 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1536 = isnan(0.5);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1542 = _1538 || _1540;
    float _1544 = fma(_563, _1232, _1530);
    float _1546 = _1320;
    float _1548 = _1528;
    if (!_1310)
    {
        float _1550 = floor(_1139);
        _1546 = _1550;
    }
    float _1552 = _1546;
    float _1554 = _1532 + _1274;
    float _1556 = _1544 + _1240;
    bool _1558 = _1510 > 0.0;
    float _1560 = 1.0 / _1528;
    bool _1562 = !_1558;
    if (!_1562)
    {
        float _1564 = _207 * _207;
        float _1566 = rsqrt(_1504);
        float _1568 = fma(_205, _205, _1564);
        float _1570 = fma(_209, _209, _1568);
        float _1572 = sqrt(_1570);
        float _1574 = _1456 * _1566;
        float _1576 = _1434 * _1566;
        float _1578 = _1460 * _1566;
        bool _1580 = _1572 > 0.0;
        bool _1582 = !_1580;
        _1514 = _1576;
        if (!_1582)
        {
            float _1584 = rsqrt(_1570);
            float _1586 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1588 = _207 * _1584;
            float _1590 = _205 * _1584;
            float _1592 = _1576 * _1588;
            float _1594 = _209 * _1584;
            float _1596 = fma(_1574, _1590, _1592);
            float _1598 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1600 = fma(_1578, _1594, _1596);
            float _1602 = _1600 * _1598;
            float _1604 = fma(_205, _1602, _1424);
            float _1606 = fma(_207, _1602, _1422);
            float _1608 = fma(_209, _1602, _1426);
            _1470 = _1604;
            _1472 = _1606;
            _1474 = _1608;
        }
    }
    float _1610 = _1470;
    float _1612 = _1472;
    float _1614 = _1474;
    float _1616 = _1514;
    float _1618 = _1612;
    float _1620 = _1616;
    if (_1542)
    {
        _213 = _1610;
    }
    float _1622 = _213;
    float _1624 = _1622;
    if (_1542)
    {
        _215 = _1612;
    }
    float _1626 = _215;
    float _1628 = _1626;
    if (_1542)
    {
        _217 = _1614;
    }
    float _1630 = _217;
    float _1632 = _1630;
    if (!_1542)
    {
        float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1636 = _635 + _1634;
        float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1640 = _561 + _1638;
        float _1642 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1644 = -_635;
        float _1646 = _1644 + _1612;
        float _1648 = _1636 * _1636;
        float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1652 = _563 + _1650;
        float _1654 = -_561;
        float _1656 = _1654 + _1610;
        float _1658 = -_563;
        float _1660 = _1658 + _1614;
        float _1662 = fma(_1640, _1640, _1648);
        float _1664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1666 = fma(_1652, _1652, _1662);
        float _1668 = sqrt(_1666);
        float _1670 = _1642 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1672 = precise::min(_1668, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1674 = _1672 * _1664;
        float _1676 = _1670 * _1674;
        float _1678 = fma(_1646, _1676, _635);
        float _1680 = fma(_1656, _1676, _561);
        float _1682 = fma(_1660, _1676, _563);
        _1628 = _1678;
        _1624 = _1680;
        _1632 = _1682;
        _1618 = _1646;
    }
    float _1684 = _1628;
    float _1686 = _1624;
    float _1688 = _1632;
    float _1690 = _1618;
    float _1692 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1696 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1698 = _1556 * _1560;
    float _1700 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1692);
    float _1702 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1694);
    float _1704 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1696);
    float _1706 = _1690;
    if (!_1310)
    {
        float _1708 = rint(_1526);
        float _1710 = precise::max(_1708, 0.0);
        uint _1712 = uint(_1710);
        uint _1714 = clamp(_1712, 0u, 65535u);
        _1620 = as_type<float>(_1714);
    }
    float _1716 = _1620;
    float _1718 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1700);
    bool _1720 = _1698 >= 0.0;
    float _1722 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1704);
    float _1726 = _1554 * _1560;
    bool _1728 = _1698 <= 1.0;
    bool _1730 = _1728 && _1720;
    float _1732 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1734 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1736 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1702);
    float _1738 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1740 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1742 = _1726 >= 0.0;
    bool _1744 = _1742 && _1730;
    float _1746 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1748 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1750 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1732);
    bool _1752 = _1726 <= 1.0;
    bool _1754 = _1752 && _1744;
    float _1756 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1758 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1748);
    float _1760 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_1310)
    {
        float _1762 = -_1552;
        float _1764 = _1139 + _1762;
        _1706 = _1764;
    }
    float _1766 = _1706;
    float _1768 = -_1756;
    float _1770 = fma(_1768, _1734, 1.0);
    float _1772 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1774 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1758);
    float _1776 = _1043 * _1452;
    float _1778 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1780 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1774);
    float _1782 = log2(_1770);
    float _1784 = fma(_561, _1444, _1776);
    if (_1754)
    {
        float _1786 = float(_1111);
        _1548 = _1786;
    }
    float _1788 = _1548;
    float _1790 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1778);
    float _1792 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1760);
    float _1794 = fma(_563, _1490, _1784);
    float _1796 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1790);
    float _1798 = 1.0 / _1780;
    float _1800 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1792);
    float _1802 = _1794 + _1498;
    float _1804 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1796);
    float _1806 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1800);
    float _1808 = _1800;
    if (!_1310)
    {
        float _1810 = -_1478;
        float _1812 = _1119 + _1810;
        _1808 = _1812;
    }
    float _1814 = _1808;
    float _1816 = _1784;
    if (_1754)
    {
        float _1818 = rint(_1788);
        float _1820 = precise::max(_1818, 0.0);
        uint _1822 = uint(_1820);
        uint _1824 = clamp(_1822, 0u, 65535u);
        _1816 = as_type<float>(_1824);
    }
    float _1826 = _1816;
    float _1828 = _1782 * 0.693147182464599609375;
    float _1830 = _1802 * _1560;
    float _1832 = _1804 * _1798;
    float _1834 = _1806 * _1798;
    float _1836 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1838 = fma(_1832, 0.5, 0.5);
    float _1840 = fma(_1834, -0.5, 0.5);
    float _1842 = _1766;
    float _1844 = _1838;
    float _1846 = _1836;
    if (!_1310)
    {
        float3 _6262 = float3(_1814, _1766, float(as_type<int>(_1716)));
        float3 _6266 = select(_6262, float3(0.0), isnan(_6262));
        float _1848 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6266.xy, uint(rint(_6266.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6266.xy, uint(rint(_6266.z)), level(0.0)).x;
        _1842 = _1848;
    }
    float _1850 = _1842;
    float _1852 = _1726;
    if (_1754)
    {
        float3 _6281 = float3(_1698, _1726, float(as_type<int>(_1826)));
        float3 _6283 = select(_6281, float3(0.0), isnan(_6281));
        float _1854 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6283.xy, uint(rint(_6283.z)), _1830, level(0.0));
        _1852 = _1854;
    }
    float _1856 = _1852;
    float3 _6293 = float3(_1838, _1840, _1836);
    float _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6293, float3(0.0), isnan(_6293)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6293, float3(0.0), isnan(_6293)), level(0.0)).x;
    float3 _6302 = float3(_1838, _1840, _1836);
    float4 _1861 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6302, float3(0.0), isnan(_6302)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6302, float3(0.0), isnan(_6302)), level(0.0)).xyzw;
    float _1863 = _1861.x;
    float _1865 = _1861.y;
    float _1867 = _1861.z;
    float _1869 = _1861.w;
    float _1871 = float(uint(_595));
    float _1873 = trunc(_907);
    int _1875 = int(_1873);
    float _1877 = 1.0 / _1871;
    float _1879 = float(uint(_1875));
    int _1881 = as_type<int>(_1877) + (-2);
    float _1883 = as_type<float>(_1881) * _1879;
    float _1885 = trunc(_1883);
    float _1887 = precise::max(_1885, 0.0);
    uint _1889 = uint(_1887);
    int _1891 = ~_595;
    int _1893 = _1891 + 1;
    int _1895 = ~_595;
    int _1897 = _1895 + 1;
    float _1899 = 1.0 / _539;
    int _1901 = _1893 * int(_1889);
    int _1903 = _1901 + _1875;
    float _1905 = float(uint(_1903));
    float _1907 = _943 * _1899;
    float _1909 = _1899;
    float _1911 = as_type<float>(_1889);
    if (_1310)
    {
        _1909 = 1.0;
    }
    float _1913 = _1909;
    float _1915 = as_type<float>(_1881) * _1905;
    bool _1917 = !_599;
    float _1919 = _1917 ? 7.345489978790283203125 : 1.0;
    float _1921 = trunc(_1915);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    bool _1927 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1929 = isnan(0.5);
    bool _1931 = _1927 || _1929;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1935 = _1931 || _1933;
    float _1937 = _1919 * _583;
    float _1939 = floor(_1937);
    float _1941 = _1913;
    if (_1935)
    {
        _1844 = 1.0;
    }
    float _1943 = _1844;
    int _1945 = int(_1889) + int(_1925);
    int _1947 = _1897 * _1945;
    int _1949 = _1947 + _1875;
    float _1951 = -_1939;
    float _1953 = _1937 + _1951;
    bool _1955 = uint(_1949) >= uint(_595);
    float _1957 = float(_1875);
    bool _1959 = !_1955;
    int _1961 = _1959 ? 0 : (-1);
    bool _1963 = _1957 >= _931;
    bool _1965 = isnan(_1957);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(_931);
    bool _1971 = _1967 || _1969;
    float _1973 = float(_1971);
    float _1975 = _1953 * _931;
    int _1977 = ~_1945;
    int _1979 = _1977 + _1961;
    int _1981 = _1979 + 1;
    float _1983 = _1957;
    float _1985 = _1943;
    if (_1935)
    {
        _1983 = 1.0;
    }
    float _1987 = _1983;
    float _1989 = _1987;
    if (!_1935)
    {
        float _1991 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1993 = _1991 * 0.15915493667125701904296875;
        float _1995 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1997 = _1993 * 6.283185482025146484375;
        float _1999 = cos(_1997);
        float _2001 = _1995 * 0.15915493667125701904296875;
        float _2003 = _1993 * 6.283185482025146484375;
        float _2005 = sin(_2003);
        float _2007 = 1.0 / _1999;
        float _2009 = _2001 * 6.283185482025146484375;
        float _2011 = cos(_2009);
        float _2013 = _2005 * _2007;
        float _2015 = _2001 * 6.283185482025146484375;
        float _2017 = sin(_2015);
        float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2021 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2019;
        float _2023 = _2011 * _2013;
        float _2025 = 1.0 / _2021;
        float _2027 = 1.0 / _2023;
        float _2029 = _2017 * _2027;
        float _2031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2033 = fma(_1039, _2029, _2031);
        float _2035 = _2033 * _2025;
        float _2037 = precise::clamp(_2035, 0.0, 1.0);
        _1911 = _2013;
        _1985 = _2037;
    }
    float _2039 = _1911;
    float _2041 = _1985;
    float _2043 = _2039;
    if (!_1935)
    {
        float _2045 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2047 = _2045 * 0.15915493667125701904296875;
        float _2049 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2051 = _2047 * 6.283185482025146484375;
        float _2053 = cos(_2051);
        float _2055 = _2049 * 0.15915493667125701904296875;
        float _2057 = _2047 * 6.283185482025146484375;
        float _2059 = sin(_2057);
        float _2061 = 1.0 / _2053;
        float _2063 = _2055 * 6.283185482025146484375;
        float _2065 = cos(_2063);
        float _2067 = _2059 * _2061;
        float _2069 = _2055 * 6.283185482025146484375;
        float _2071 = sin(_2069);
        float _2073 = _2065 * _2067;
        float _2075 = 1.0 / _2073;
        float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2079 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2077;
        float _2081 = 1.0 / _2079;
        float _2083 = _2071 * _2075;
        float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2087 = fma(_1039, _2083, _2085);
        float _2089 = _2087 * _2081;
        float _2091 = precise::clamp(_2089, 0.0, 1.0);
        float _2093 = -_2091;
        float _2095 = _2093 + 1.0;
        _2043 = _2061;
        _1846 = _2073;
        _1989 = _2095;
    }
    float _2097 = _2043;
    float _2099 = _1846;
    float _2101 = _1989;
    float _2103 = _2099;
    if (!_1310)
    {
        int _2105 = _1346 << 4;
        int _2107 = _2105 + 2048;
        uint _2109 = uint(int(uint(_2107) >> uint(2)));
        uint _2111 = uint(int(uint(int(_2109)) >> uint(2)));
        int _2113 = int(_2109) & 3;
        float _2115 = (*spvDescriptorSet0.vp_c15)._m0[int(_2111)][_2113];
        int _2117 = int(_2109) + 1;
        uint _2119 = uint(int(uint(_2117) >> uint(2)));
        int _2121 = _2117 & 3;
        float _2123 = (*spvDescriptorSet0.vp_c15)._m0[int(_2119)][_2121];
        int _2125 = _2107 + 8;
        uint _2127 = uint(int(uint(_2125) >> uint(2)));
        uint _2129 = uint(int(uint(int(_2127)) >> uint(2)));
        int _2131 = int(_2127) & 3;
        float _2133 = (*spvDescriptorSet0.vp_c15)._m0[int(_2129)][_2131];
        int _2135 = int(_2127) + 1;
        uint _2137 = uint(int(uint(_2135) >> uint(2)));
        int _2139 = _2135 & 3;
        float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
        float _2143 = _1043 * _2123;
        float _2145 = fma(_561, _2115, _2143);
        float _2147 = fma(_563, _2133, _2145);
        float _2149 = _2147 + _2141;
        float _2151 = precise::clamp(_2149, 0.0, 1.0);
        float _2153 = -_2151;
        float _2155 = _2153 + _1850;
        float _2157 = fma(_2155, 500.0, 1.5);
        float _2159 = exp2(_2157);
        float _2161 = 0.0 + _2159;
        float _2163 = precise::clamp(_2161, 0.0, 1.0);
        _1941 = _2163;
    }
    float _2165 = _1941;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2169 = _1684 + _2167;
    float _2171 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2173 = _1686 + _2171;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2177 = _1688 + _2175;
    float _2179 = trunc(_1973);
    int _2181 = int(_2179);
    float _2183 = _2169 * _2169;
    int _2185 = _595 * _1981;
    int _2187 = _2185 + _1875;
    float _2189 = fma(_2173, _2173, _2183);
    float _2191 = trunc(_1975);
    int _2193 = int(_2191);
    float _2195 = fma(_2177, _2177, _2189);
    float _2197 = rsqrt(_2195);
    float _2199 = sqrt(_2195);
    float _2201 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2203 = _2173 * _2201;
    float _2205 = _2177 * _2201;
    float _2207 = _2203 * _2203;
    float _2209 = _2205 * _2205;
    float _2211 = _2207 + _2209;
    float _2213 = sqrt(_2211);
    bool _2215 = _2213 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2219 = _2213 + _2217;
    float _2221 = _1850;
    float _2223 = _2211;
    float _2225 = _2219;
    float _2227 = _2201;
    float _2229 = _2205;
    float _2231 = _2207;
    float _2233 = _2209;
    if (_2215)
    {
        float _2235 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2221 = _2235;
    }
    float _2237 = _2221;
    if (_2215)
    {
        float _2239 = rsqrt(_2211);
        _2223 = _2239;
    }
    float _2241 = _2223;
    if (_2215)
    {
        float _2243 = _2219 * _2237;
        _2225 = _2243;
    }
    float _2245 = _2225;
    if (_2215)
    {
        float _2247 = _2245 * 0.15915493667125701904296875;
        _2103 = _2247;
    }
    float _2249 = _2103;
    float _2251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2253 = _2097;
    if (_2215)
    {
        float _2255 = _2249 * 6.283185482025146484375;
        float _2257 = sin(_2255);
        _2253 = _2257;
    }
    float _2259 = _2253;
    float _2261 = precise::max(0.0, _2251);
    float _2263 = _2245;
    float _2265 = _2261;
    if (_2215)
    {
        float _2267 = _2249 * 6.283185482025146484375;
        float _2269 = cos(_2267);
        _2263 = _2269;
    }
    float _2271 = _2263;
    float _2273 = -_2201;
    float _2275 = -_2261;
    float _2277 = fma(_2169, _2273, _2275);
    float _2279 = _2277;
    if (_2215)
    {
        float _2281 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2227 = _2281;
    }
    float _2283 = _2227;
    float _2285 = _2259;
    float _2287 = _2283;
    if (_2215)
    {
        float _2289 = fma(_2259, _2283, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2285 = _2289;
    }
    float _2291 = _2285;
    float _2293 = _2291;
    if (!_2215)
    {
        _2287 = _2203;
    }
    float _2295 = _2287;
    float _2297 = _2295;
    if (_2215)
    {
        float _2299 = _2241 * _2291;
        _2293 = _2299;
    }
    float _2301 = _2293;
    if (_2215)
    {
        float _2303 = _2271 + (-1.0);
        _2265 = _2303;
    }
    float _2305 = _2265;
    float _2307 = _2305;
    if (_2215)
    {
        float _2309 = _2203 * _2301;
        _2297 = _2309;
    }
    float _2311 = _2297;
    if (_2215)
    {
        float _2313 = _2205 * _2301;
        _2229 = _2313;
    }
    float _2315 = _2229;
    if (_2215)
    {
        float _2317 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2307 = _2317;
    }
    float _2319 = _2307;
    if (_2215)
    {
        float _2321 = _2311 * _2311;
        _2231 = _2321;
    }
    float _2323 = _2231;
    if (_2215)
    {
        float _2325 = _2315 * _2315;
        _2233 = _2325;
    }
    float _2327 = _2233;
    if (_2215)
    {
        float _2329 = fma(_2277, _2271, _2319);
        _2279 = _2329;
    }
    float _2331 = _2279;
    bool _2333 = _595 == 0;
    float _2335 = fma(_2331, _2331, _2323);
    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2339 = fma(_2199, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2337);
    float _2341 = precise::clamp(_2339, 0.0, 1.0);
    bool _2343 = !_2333;
    int _2345 = _2343 ? _2187 : (-1);
    float _2347 = _2335 + _2327;
    float _2349 = -_2341;
    float _2351 = _2349 + 1.0;
    float _2353 = rsqrt(_2347);
    float _2355 = abs(_2351);
    float _2357 = log2(_2355);
    float _2359 = _2353 * _2311;
    float _2361 = _2353 * _2331;
    float _2363 = _2353 * _2315;
    float _2365 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2367 = _2361 + 1.0;
    float _2369 = -_2365;
    float _2371 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2369);
    float _2373 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2375 = -_2363;
    float _2377 = fma(_2375, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2371);
    float _2379 = exp2(_2373);
    float _2381 = fma(_2377, -0.5, 0.5);
    float _2383 = fma(_2377, 0.5, 0.5);
    float _2385 = fma(_2383, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2387 = sqrt(_2381);
    float _2389 = fma(_2383, _2385, -0.212114393711090087890625);
    float _2391 = fma(_2383, _2389, 1.570728778839111328125);
    float _2393 = -_2361;
    float _2395 = fma(_2379, _2367, _2393);
    float _2397 = fma(_2395, 0.5, 0.5);
    int _2399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2401 = _2399 != 0;
    float _2403 = _2387 * 0.636619746685028076171875;
    float _2405 = -_2391;
    float _2407 = fma(_2403, _2405, 1.0);
    int _2409 = ~_2181;
    int _2411 = _2409 + 1;
    int _2413 = _2411 + 1;
    float2 _7083 = float2(_2407, _2397);
    float3 _2417 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7083, float2(0.0), isnan(_7083)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7083, float2(0.0), isnan(_7083)), level(0.0)).xyz;
    float _2419 = _2417.x;
    float _2421 = _2417.y;
    float _2423 = _2417.z;
    float _2425 = trunc(_1907);
    int _2427 = int(_2425);
    int _2429 = _595 + (-1);
    int _2431 = _2345 * _2413;
    bool _2433 = !_2401;
    int _2435 = _2433 ? 0 : 1;
    float _2437 = -_945;
    float _2439 = _2437 + 1.0;
    int _2441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2443 = _2441 != 0;
    int _2445 = _2181 * _2429;
    int _2447 = _2445 + _2431;
    int _2449 = abs(_627);
    float _2451 = -_763;
    float _2453 = _2451 + 1.0;
    int _2455 = abs(_633);
    float _2457 = -_815;
    float _2459 = _2457 + 1.0;
    float _2461 = -_781;
    float _2463 = _2461 + 1.0;
    int _2465 = abs(_2435);
    float _2467 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2469 = !_2443;
    int _2471 = _2469 ? 0 : 1;
    float _2473 = -_581;
    float _2475 = _2473 + 1.0;
    int _2477 = abs(_639);
    int _2479 = _2447 * _2449;
    int _2481 = _2193 * _2465;
    int _2483 = _2481 + _1875;
    int _2485 = abs(_2471);
    float _2487 = exp2(_2467);
    int _2489 = _2427 * _2455;
    int _2491 = _2489 + _2479;
    int _2493 = ~_595;
    int _2495 = _2493 + 1;
    bool _2497 = _583 > 0.5;
    int _2499 = _2483 * _2477;
    int _2501 = _2499 + _2491;
    bool _2503 = _589 > 0.5;
    float _2505 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2507 = _541 + _2505;
    bool _2509 = _585 > 0.5;
    int _2511 = _2193 * _2485;
    int _2513 = _2511 + _2501;
    int _2515 = ~_595;
    int _2517 = _2515 + 1;
    bool _2519 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2521 = isnan(_541);
    bool _2523 = _2519 || _2521;
    bool _2525 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2527 = _2523 || _2525;
    float _2529 = float(_2527);
    float _2531 = float(uint(_2513));
    int _2533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2535 = _2533 != 0;
    float _2537 = -_193;
    int _2539 = _2497 ? as_type<int>(_2537) : as_type<int>(_193);
    float _2541 = as_type<float>(_1881) * _2531;
    int _2543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2545 = _2543 != 0;
    float _2547 = float(uint(_2483));
    float _2549 = trunc(_2541);
    float _2551 = precise::max(_2549, 0.0);
    uint _2553 = uint(_2551);
    float _2555 = as_type<float>(_1881) * _2547;
    int _2557 = _2517 * int(_2553);
    int _2559 = _2557 + _2513;
    float _2561 = float(uint(_2559));
    float _2563 = as_type<float>(_1881) * _2561;
    float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2567 = _2565 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2569 = trunc(_2563);
    float _2571 = precise::max(_2569, 0.0);
    uint _2573 = uint(_2571);
    float _2575 = 1.0 / _2567;
    int _2577 = int(_2553) + int(_2573);
    float _2579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2581 = -_203;
    int _2583 = _2509 ? as_type<int>(_2581) : as_type<int>(_203);
    int _2585 = _2495 * _2577;
    int _2587 = _2585 + _2513;
    int _2589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2591 = _2589 != 0;
    float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2595 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2593;
    bool _2597 = uint(_2587) >= uint(_595);
    float _2599 = _2595 * _2575;
    bool _2601 = !_2597;
    int _2603 = _2601 ? 0 : (-1);
    float _2605 = fma(_2599, _2507, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2607 = _587 > 0.5;
    float _2609 = -_2529;
    float _2611 = _2609 + 1.0;
    int _2613 = ~_2577;
    int _2615 = _2613 + _2603;
    int _2617 = _2615 + 1;
    float _2619 = _2579 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2621 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2623 = isnan(_541);
    bool _2625 = _2621 || _2623;
    bool _2627 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2629 = _2625 || _2627;
    float _2631 = float(_2629);
    float _2633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2635 = !_2535;
    float _2637 = _2635 ? _193 : as_type<float>(_2539);
    int _2639 = _595 * _2617;
    int _2641 = _2639 + _2513;
    bool _2643 = !_2545;
    float _2645 = _2643 ? _203 : as_type<float>(_2583);
    float _2647 = _2631 * _2611;
    int _2649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2651 = _2649 != 0;
    float _2653 = _2637 + 0.5;
    bool _2655 = !_2333;
    int _2657 = _2655 ? _2641 : (-1);
    float _2659 = _2645 + (-0.5);
    float _2661 = _2605 * _2647;
    float _2663 = -_193;
    int _2665 = _2607 ? as_type<int>(_2663) : as_type<int>(_193);
    float _2667 = fma(_2653, (*spvDescriptorSet0.vp_c9)._m0[80].x, _691);
    float _2669 = -_2659;
    float _2671 = -_695;
    float _2673 = fma(_2669, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2671);
    float _2675 = -_2631;
    float _2677 = _2675 + 1.0;
    float _2679 = -_203;
    int _2681 = _2503 ? as_type<int>(_2679) : as_type<int>(_203);
    float _2683 = trunc(_2555);
    float _2685 = precise::max(_2683, 0.0);
    uint _2687 = uint(_2685);
    bool _2689 = !_2651;
    float _2691 = _2689 ? _193 : as_type<float>(_2665);
    float _2693 = _2633 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2695 = !_2591;
    float _2697 = _2695 ? _203 : as_type<float>(_2681);
    float _2699 = fma(_2677, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2661);
    float _2701 = fma(_2645, _2453, _2673);
    float _2703 = _2691 + 0.5;
    int _2705 = _2657 & 3;
    bool _2707 = _2705 != 0;
    float _2709 = _2697 + (-0.5);
    float _2711 = fma(_2529, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2699);
    float _2713 = fma(_2619, _2703, _785);
    int _2715 = _2657 >> 31;
    float _2717 = -_2693;
    float _2719 = -_837;
    float _2721 = fma(_2717, _2709, _2719);
    int _2723 = ~_595;
    int _2725 = _2723 + 1;
    float _2727 = abs(_1039);
    float _2729 = log2(_2727);
    int _2731 = _2715 & 3;
    float _2733 = -_2439;
    float _2735 = fma(_2637, _2733, _2667);
    float _2737 = fma(_2697, _2463, _2721);
    int _2739 = _2725 * int(_2687);
    int _2741 = _2739 + _2483;
    int _2743 = _2657 + _2731;
    float _2745 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2747 = _2657 & 3;
    bool _2749 = _2747 != 0;
    float _2751 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2753 = _2743 >> 2;
    float _2755 = -_1073;
    float _2757 = fma(_2755, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2745);
    float _2759 = float(uint(_2741));
    float _2761 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2763 = _2753 << 4;
    int _2765 = _2763 + 368;
    float _2767 = -_2459;
    float _2769 = fma(_2691, _2767, _2713);
    bool _2771 = uint(_2747) > 1u;
    float _2773 = as_type<float>(_1881) * _2759;
    uint _2775 = uint(int(uint(_2765) >> uint(2)));
    uint _2777 = uint(int(uint(int(_2775)) >> uint(2)));
    int _2779 = int(_2775) & 3;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[int(_2777)][_2779];
    int _2783 = int(_2775) + 1;
    uint _2785 = uint(int(uint(_2783) >> uint(2)));
    int _2787 = _2783 & 3;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[int(_2785)][_2787];
    float _2791 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_76.x = _2735;
    out.m_76.y = _2701;
    out.m_76.z = _2769;
    out.m_76.w = _2737;
    float _2793 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2795 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2797 = trunc(_2773);
    float _2799 = precise::max(_2797, 0.0);
    uint _2801 = uint(_2799);
    float _2803 = _2711 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2805 = -_1073;
    float _2807 = fma(_2805, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2795);
    int _2809 = ~_595;
    int _2811 = _2809 + 1;
    int _2813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2815 = _2813 != 0;
    out.m_78.w = _2803;
    float _2817 = exp2(_2791);
    bool _2819 = _1039 <= 8000.0;
    bool _2821 = isnan(_1039);
    bool _2823 = _2819 || _2821;
    bool _2825 = isnan(8000.0);
    bool _2827 = _2823 || _2825;
    float _2829 = float(_2827);
    int _2831 = _2765 + 8;
    uint _2833 = uint(int(uint(_2831) >> uint(2)));
    uint _2835 = uint(int(uint(int(_2833)) >> uint(2)));
    int _2837 = int(_2833) & 3;
    float _2839 = (*spvDescriptorSet0.vp_c9)._m0[int(_2835)][_2837];
    int _2841 = int(_2833) + 1;
    uint _2843 = uint(int(uint(_2841) >> uint(2)));
    int _2845 = _2841 & 3;
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[int(_2843)][_2845];
    float _2849 = -_1073;
    float _2851 = fma(_2849, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2793);
    int _2853 = _2707 ? 0 : 1;
    float _2855 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2857 = int(_2687) + int(_2801);
    float _2859 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2851);
    float _2861 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2757);
    float _2863 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2807);
    float _2865 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2855);
    int _2867 = _2811 * _2857;
    int _2869 = _2867 + _2483;
    float _2871 = _2751 * _2861;
    float _2873 = fma(_2817, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2875 = precise::clamp(_2873, 0.0, 1.0);
    int _2877 = ~_2853;
    int _2879 = _2877 + 1;
    int _2881 = _2879 + 1;
    float _2883 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2885 = _2881;
    if (!_2771)
    {
        int _2887 = ~_2853;
        int _2889 = _2887 + 1;
        _2885 = _2889;
    }
    int _2891 = _2885;
    float _2893 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2761);
    bool _2895 = !_2749;
    int _2897 = _2895 ? 0 : 1;
    float _2899 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2883);
    int _2901 = abs(_2891);
    bool _2903 = _2747 != 3;
    bool _2905 = uint(_2869) >= uint(_595);
    int _2907 = abs(_2897);
    bool _2909 = uint(_2747) >= 2u;
    bool _2911 = !_2905;
    int _2913 = _2911 ? 0 : (-1);
    int _2915 = ~_2901;
    int _2917 = _2915 + 1;
    int _2919 = _2917 + 1;
    int _2921 = _2909 ? 0 : 1;
    int _2923 = ~_2857;
    int _2925 = _2923 + _2913;
    int _2927 = _2925 + 1;
    int _2929 = _2919 * as_type<int>(_2789);
    int _2931 = ~_2907;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    float _2937 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2939 = ~_2921;
    int _2941 = _2939 + 1;
    int _2943 = _2941 + 1;
    int _2945 = _595 * _2927;
    int _2947 = _2945 + _2483;
    bool _2949 = _2747 != 3;
    int _2951 = _2935 * as_type<int>(_2781);
    int _2953 = _2951 + _2929;
    int _2955 = _2943;
    if (_2903)
    {
        int _2957 = ~_2921;
        int _2959 = _2957 + 1;
        _2955 = _2959;
    }
    int _2961 = _2955;
    float _2963 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2965 = !_2815;
    int _2967 = _2965 ? 0 : 1;
    float _2969 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2937);
    bool _2971 = !_2949;
    int _2973 = _2971 ? 0 : (-1);
    float _2975 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2963);
    int _2977 = abs(_2961);
    float _2979 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2893);
    int _2981 = abs(_2967);
    float _2983 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2975);
    int _2985 = abs(_2973);
    float _2987 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2989 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2987);
    int _2991 = ~_2977;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    int _2997 = ~_2985;
    int _2999 = _2997 + 1;
    int _3001 = _2999 + 1;
    float _3003 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2989);
    int _3005 = _2995 * as_type<int>(_2839);
    int _3007 = _3005 + _2953;
    float _3009 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3011 = _2751 * _2863;
    float _3013 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2969);
    int _3015 = _3001 * as_type<int>(_2847);
    int _3017 = _3015 + _3007;
    float _3019 = _2751 * _2859;
    float _3021 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2865);
    float _3023 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3025 = ~_2981;
    int _3027 = _3025 + 1;
    int _3029 = _3027 + 1;
    float _3031 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2899);
    float _3033 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3009);
    float _3035 = fma(_3023, _3021, _3019);
    float _3037 = fma(_3023, _2979, _2871);
    float _3039 = fma(_3023, _3031, _3011);
    int _3041 = _3017 * _3029;
    bool _3043 = !_2333;
    int _3045 = _3043 ? _2947 : (-1);
    float _3047 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3033);
    float _3049 = _3013 + _3039;
    float _3051 = fma(_2875, -2.0, 3.0);
    float _3053 = _2875 * _2875;
    int _3055 = _3045 * _2981;
    int _3057 = _3055 + _3041;
    float _3059 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3047);
    float _3061 = _1780 * 0.5;
    float _3063 = _3053 * _3051;
    float _3065 = _3059 + _1780;
    float _3067 = float(_3057);
    float _3069 = _1804 + _1780;
    out.gl_Position.x = _1804;
    out.gl_Position.y = _1806;
    out.gl_Position.z = _3059;
    out.gl_Position.w = _1780;
    float _3071 = _3065 * 0.5;
    float _3073 = fma(_1806, -0.5, _3061);
    float _3075 = _3069 * 0.5;
    float _3077 = _2983 + _3035;
    float _3079 = _3003 + _3037;
    out.m_80.x = _3067;
    out.m_82.x = _3075;
    out.m_82.y = _3073;
    out.m_82.z = _3071;
    out.m_82.w = _1780;
    float _3081 = -_3063;
    float _3083 = _3081 + 1.0;
    out.m_84.x = _3077;
    out.m_84.y = _3079;
    out.m_84.z = _3049;
    float _3085 = fma(_3083, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3063);
    float _3087 = _2829 * _3085;
    float _3089 = -_2487;
    float _3091 = _3089 + 1.0;
    float _3093 = _3073;
    float _3095 = _3071;
    if (!_1754)
    {
        _3093 = 1.0;
    }
    float _3097 = _3093;
    float _3099 = _3087 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3101 = _3097;
    if (_1754)
    {
        bool _3103 = _1856 >= _1830;
        bool _3105 = isnan(_1856);
        bool _3107 = _3103 || _3105;
        bool _3109 = isnan(_1830);
        bool _3111 = _3107 || _3109;
        float _3113 = float(_3111);
        _3101 = _3113;
    }
    float _3115 = _3101;
    float _3117 = _3091 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3119 = _2199 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3121 = isnan(_2199);
    bool _3123 = _3119 || _3121;
    bool _3125 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3127 = _3123 || _3125;
    float _3129 = _2475 * _3099;
    float _3131 = precise::clamp(_3129, 0.0, 1.0);
    float _3133 = _3117 * _1858;
    float _3135 = _3115 * _2165;
    float _3137 = -_3131;
    float _3139 = fma(_3137, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3141 = -_3117;
    float _3143 = _3141 + 1.0;
    float _3145 = _1869 * _3133;
    float _3147 = _2423 * _3133;
    float _3149 = -_3135;
    float _3151 = fma(_3149, _3139, 1.0);
    float _3153 = precise::clamp(_3151, 0.0, 1.0);
    float _3155 = _1869 * _3143;
    float _3157 = fma(_2419, _3145, _1863);
    float _3159 = fma(_2421, _3145, _1865);
    float _3161 = _3153 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3163 = fma(_1869, _3147, _1867);
    float _3165 = _2041 * _2101;
    float _3167 = _3153;
    float _3169 = _3165;
    if (!_3127)
    {
        _3095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3171 = _3095;
    out.m_86.x = _3161;
    float _3173 = _3165 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3175 = _3171;
    float _3177 = _3171;
    if (!_3127)
    {
        _3167 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3179 = _3167;
    out.m_88.x = _3157;
    out.m_88.y = _3159;
    out.m_88.z = _3163;
    out.m_88.w = _3155;
    float _3181 = _3179;
    float _3183 = _3179;
    if (!_3127)
    {
        _3169 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3185 = _3169;
    bool _3187 = !_3127;
    float _3189 = _3185;
    float _3191 = _3185;
    if (!_3187)
    {
        bool _3193 = _2199 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3195 = isnan(_2199);
        bool _3197 = _3193 || _3195;
        bool _3199 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3201 = _3197 || _3199;
        if (!_3201)
        {
            float _3203 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3205 = _2199 + _3203;
            float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3209 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3207;
            float _3211 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3219 = 1.0 / _3209;
            float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3223 = _3221 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3225 = _3205 * _3219;
            float _3227 = precise::clamp(_3225, 0.0, 1.0);
            float _3229 = fma(_3227, _3213, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3231 = fma(_3227, _3217, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3233 = fma(_3227, _3223, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3183 = _3231;
            _3177 = _3229;
            _3191 = _3233;
            _3235 = true;
        }
        else
        {
            bool _3237 = _2199 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3239 = isnan(_2199);
            bool _3241 = _3237 || _3239;
            bool _3243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3245 = _3241 || _3243;
            if (!_3245)
            {
                _3175 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3247 = _3175;
            _3177 = _3247;
            if (!_3245)
            {
                _3181 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3249 = _3181;
            _3183 = _3249;
            if (!_3245)
            {
                _3189 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3251 = _3189;
            bool _3253 = !_3245;
            _3191 = _3251;
            if (!_3253)
            {
                bool _3255 = _2199 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3257 = isnan(_2199);
                bool _3259 = _3255 || _3257;
                bool _3261 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3263 = _3259 || _3261;
                if (!_3263)
                {
                    float _3265 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3267 = _2199 + _3265;
                    float _3269 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3271 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3269;
                    float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3275 = _3273 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3277 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3279 = _3277 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3281 = 1.0 / _3271;
                    float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3287 = _3267 * _3281;
                    float _3289 = precise::clamp(_3287, 0.0, 1.0);
                    float _3291 = fma(_3289, _3275, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3293 = fma(_3289, _3279, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3295 = fma(_3289, _3285, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3183 = _3293;
                    _3177 = _3291;
                    _3191 = _3295;
                    _3235 = true;
                }
                else
                {
                    _3183 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3177 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3191 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3235 = false;
    float _3297 = _3183;
    float _3299 = _3177;
    float _3301 = _3191;
    float _3303 = _3173 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_90.x = 0.0;
    float _3305 = _3297 * 0.586610972881317138671875;
    bool _3307 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_59.x = _3303;
    float _3309 = fma(_3299, 0.298911988735198974609375, _3305);
    bool _3311 = _2041 > 0.0;
    bool _3313 = isnan(_2041);
    bool _3315 = _3311 || _3313;
    bool _3317 = isnan(0.0);
    bool _3319 = _3315 || _3317;
    float _3321 = fma(_3301, 0.114477999508380889892578125, _3309);
    bool _3323 = _2101 <= 0.0;
    bool _3325 = !_3319;
    bool _3327 = _3323 || _3325;
    float _3329 = -_3321;
    float _3331 = _3329 + _3299;
    float _3333 = -_3321;
    float _3335 = _3333 + _3297;
    float _3337 = -_3321;
    float _3339 = _3337 + _3301;
    float _3341 = fma(_3331, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3321);
    float _3343 = fma(_3335, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3321);
    float _3345 = fma(_3339, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3321);
    bool _3347 = !_3307;
    if (!_3347)
    {
        float _3349 = -_1684;
        float _3351 = _3349 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3353 = -_1686;
        float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3357 = -_1688;
        float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3361 = _3351 * _3351;
        float _3363 = fma(_3355, _3355, _3361);
        float _3365 = fma(_3359, _3359, _3363);
        float _3367 = sqrt(_3365);
        float _3369 = rsqrt(_3365);
        float _3371 = -_3367;
        float _3373 = _3371 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3375 = _3373 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3377 = precise::clamp(_3375, 0.0, 1.0);
        float _3379 = _3355 * _3369;
        float _3381 = _3351 * _3369;
        float _3383 = abs(_3377);
        float _3385 = log2(_3383);
        float _3387 = _3359 * _3369;
        float _3389 = _3379 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3391 = _3079 * _3381;
        float _3393 = -_3381;
        float _3395 = -_3389;
        float _3397 = fma(_3393, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3395);
        float _3399 = fma(_3077, _3379, _3391);
        float _3401 = -_3387;
        float _3403 = fma(_3401, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3397);
        float _3405 = fma(_3049, _3387, _3399);
        float _3407 = precise::clamp(_3405, 0.0, 1.0);
        float _3409 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3411 = _3403 + _3409;
        float _3413 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3415 = _3411 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3417 = precise::clamp(_3415, 0.0, 1.0);
        float _3419 = exp2(_3413);
        float _3421 = _3419 * _3417;
        float _3423 = _3407 * _3421;
        float _3425 = _3423 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3427 = _3423 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3429 = _3423 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3425;
        out.m_90.y = _3427;
        out.m_90.z = _3429;
    }
    out.m_92.x = _3341;
    out.m_92.y = _3343;
    out.m_92.z = _3345;
    if (!_3327)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _3431 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3431;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3235 = false;
    bool _531 = false;
    bool _339 = false;
    bool _237 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _3488 = as_type<float>(_127);
        out.gl_Position.z = _3488;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_61.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_59.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3558 = as_type<float>(_165);
        out.gl_Position.z = _3558;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_66.x;
    float _171 = in.m_66.y;
    float _173 = in.m_66.z;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_177;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _207 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _209 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _211 = !_183;
    float _213 = _205;
    float _215 = _207;
    float _217 = _209;
    float _235;
    if (!_211)
    {
        float _219 = in.m_68.x;
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _223 = _219 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _227 = _225 * _221;
        float _229 = floor(_227);
        float _231 = -_229;
        float _233 = _227 + _231;
        _235 = _233;
        _237 = true;
    }
    else
    {
        float _239 = float(_111);
        float _241 = 1.0 / _239;
        float _243 = _145 * _241;
        _235 = _243;
    }
    _237 = false;
    float _245 = _235;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _245 + _247;
    bool _251 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _253 = isnan(_245);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -_261;
    float _269 = _267 + 1.0;
    bool _271 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _273 = isnan(_245);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _283;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _289 = 1.0 / _265;
    float _291 = _281 * _269;
    float _293 = -_281;
    float _295 = _293 + 1.0;
    float _297 = _249 * _289;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _299;
    float _303 = fma(_285, _297, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _305 = fma(_301, _297, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _307 = _303 * _291;
    float _309 = _305 * _291;
    float _311 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].x, _307);
    float _313 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].y, _309);
    float _315 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[144].x, _311);
    float _317 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[144].y, _313);
    bool _319 = !_287;
    float _337;
    if (!_319)
    {
        float _321 = in.m_68.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_111);
        float _343 = 1.0 / _341;
        float _345 = _145 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _337;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _351 = _347 + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _361 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _363 = isnan(_347);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _377 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _379 = isnan(_347);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = 1.0 / _355;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _391;
    float _395 = -_371;
    float _397 = _395 + 1.0;
    bool _399 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _401 = isnan(_347);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    bool _411 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _413 = 1.0 / _359;
    float _415 = 1.0 / _375;
    float _417 = _393 * _389;
    float _419 = -_387;
    float _421 = _419 + 1.0;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _427 = _387 * _397;
    float _429 = fma(_417, _351, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _431 = _409 * _421;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _433;
    float _437 = _425 * _413;
    bool _439 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _441 = isnan(_347);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _453 = _347 + _451;
    float _455 = _429 * _431;
    float _457 = -_409;
    float _459 = _457 + 1.0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _463 = _347 + _461;
    float _465 = fma(_437, _453, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _467 = -_449;
    float _469 = _467 + 1.0;
    float _471 = _435 * _415;
    float _473 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[115].x, _455);
    float _475 = _371 * _469;
    float _477 = fma(_471, _463, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _479 = fma(_465, _427, _473);
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _483 = fma(_477, _475, _479);
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _487 = _481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _489 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[118].x, _483);
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _493 = _485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _489 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _497 = in.m_70.x;
    float _499 = in.m_70.y;
    float _501 = _491 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _487;
    out.m_72.y = _501;
    out.m_72.z = _493;
    out.m_72.w = _495;
    float _503 = _317 * _499;
    float _505 = _315 * _497;
    bool _507 = !_411;
    float _527;
    float _529;
    if (!_507)
    {
        float _509 = in.m_68.x;
        float _511 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _513 = float(_111);
        float _515 = _509 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _517 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _519 = _517 * _511;
        float _521 = floor(_519);
        float _523 = -_521;
        float _525 = _519 + _523;
        _527 = _513;
        _529 = _525;
        _531 = true;
    }
    else
    {
        float _533 = float(_111);
        float _535 = 1.0 / _533;
        float _537 = _145 * _535;
        _527 = _533;
        _529 = _537;
    }
    _531 = false;
    float _539 = _527;
    float _541 = _529;
    float _543 = in.m_56.x;
    float _545 = in.m_56.y;
    float _547 = in.m_56.z;
    float _549 = _545 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _551 = _545 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _553 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[4].x, _549);
    float _555 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[6].x, _551);
    float _557 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[4].z, _553);
    float _559 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[6].z, _555);
    float _561 = _557 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _563 = _559 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _565 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _567 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _569 = floor(_565);
    float _571 = floor(_567);
    float _573 = -_569;
    float _575 = _565 + _573;
    float _577 = -_571;
    float _579 = _567 + _577;
    float2 _4227 = float2(_575, _579);
    float _581 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4227, float2(0.0), isnan(_4227)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4227, float2(0.0), isnan(_4227)), level(0.0)).x;
    float _583 = in.m_68.x;
    float _585 = in.m_68.y;
    float _587 = in.m_68.z;
    float _589 = in.m_68.w;
    float _591 = _545 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _595 = int(_593);
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _599 = _597 != 0;
    float _601 = fma(_543, (*spvDescriptorSet0.vp_c10)._m0[5].x, _591);
    float _603 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _607 = _605 != 0;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _611 = _609 != 0;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _615 = _613 != 0;
    float _617 = fma(_547, (*spvDescriptorSet0.vp_c10)._m0[5].z, _601);
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _621 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _623 = log2(_621);
    bool _625 = !_611;
    int _627 = _625 ? 0 : 1;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _631 = !_607;
    int _633 = _631 ? 0 : 1;
    float _635 = _617 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _637 = !_615;
    int _639 = _637 ? 0 : 1;
    float _641 = _503 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _643 = _635 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _645 = _583 * 2.0;
    float _647 = _587 * 2.0;
    float _649 = _585 * 2.0;
    float _651 = _583 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _653 = floor(_645);
    float _655 = _543;
    float _657 = _601;
    if (!_599)
    {
        _655 = _587;
    }
    float _659 = _655;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _663 = -_619;
    float _665 = fma(_651, 2.0, _663);
    float _667 = _585 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _669 = _659;
    if (_599)
    {
        _669 = _585;
    }
    float _671 = _669;
    float _673 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[11].x, _643);
    float _675 = _671;
    if (!_599)
    {
        _657 = _585;
    }
    float _677 = _657;
    float _679 = floor(_647);
    float _681 = _585 + _583;
    float _683 = fma(_667, -2.0, _629);
    float _685 = _677;
    if (_599)
    {
        _685 = _583;
    }
    float _687 = _685;
    float _689 = -_145;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[76].x, _665);
    float _693 = _681 + (-1.0);
    float _695 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _683);
    float _697 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[11].z, _673);
    float _699 = floor(_649);
    bool _701 = _653 > 0.0;
    float _703 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _705 = _653 >= 0.0;
    bool _707 = isnan(_653);
    bool _709 = _705 || _707;
    bool _711 = isnan(0.0);
    bool _713 = _709 || _711;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _717 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _721 = _719 != 0;
    int _723 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _725 = _723 != 0;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _729 = _727 != 0;
    float _731 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _733 = int(_731);
    bool _735 = _679 >= 0.0;
    bool _737 = isnan(_679);
    bool _739 = _735 || _737;
    bool _741 = isnan(0.0);
    bool _743 = _739 || _741;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _747 = _713 ? 0 : 1;
    float _749 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[78].w, _715);
    int _751 = _743 ? 0 : 1;
    float _753 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[83].w, _745);
    bool _755 = _679 > 0.0;
    float _757 = _687 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _759 = !_721;
    int _761 = _759 ? 0 : 1;
    float _763 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _749);
    bool _765 = _699 > 0.0;
    float _767 = -_661;
    float _769 = fma(_757, 2.0, _767);
    bool _771 = _699 >= 0.0;
    bool _773 = isnan(_699);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    float _781 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _753);
    float _783 = -_145;
    float _785 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[81].x, _769);
    if (!_599)
    {
        _675 = _587;
    }
    float _787 = _675;
    int _789 = ~_751;
    int _791 = _789 + 1;
    int _793 = _791 + 1;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _797 = _787;
    int _799 = _793;
    if (_599)
    {
        _797 = _585;
    }
    float _801 = _797;
    if (!_755)
    {
        int _803 = ~_751;
        int _805 = _803 + 1;
        _799 = _805;
    }
    int _807 = _799;
    float _809 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[83].z, _795);
    float _811 = _801 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _813 = abs(_761);
    float _815 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _809);
    int _817 = _779 ? 0 : 1;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _821 = float(_733);
    int _823 = ~_817;
    int _825 = _823 + 1;
    int _827 = _825 + 1;
    float _829 = fma(_811, -2.0, _819);
    float _831 = float(_813);
    float _833 = 1.0 / _821;
    float _835 = float(_807);
    float _837 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _829);
    int _839 = _827;
    if (!_765)
    {
        int _841 = ~_817;
        int _843 = _841 + 1;
        _839 = _843;
    }
    int _845 = _839;
    float _847 = _623 * _145;
    int _849 = ~_747;
    int _851 = _849 + 1;
    int _853 = _851 + 1;
    float _855 = _831 * _835;
    int _857 = _853;
    if (!_701)
    {
        int _859 = ~_747;
        int _861 = _859 + 1;
        _857 = _861;
    }
    int _863 = _857;
    float _865 = in.m_74.x;
    float _867 = in.m_74.y;
    float _869 = in.m_74.z;
    bool _871 = !_725;
    int _873 = _871 ? 0 : 1;
    float _875 = exp2(_847);
    float _877 = _855 * (-2.0);
    int _879 = abs(_873);
    float _881 = _635 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _885 = 1.0 + _883;
    float _887 = fma(_561, (*spvDescriptorSet0.vp_c8)._m0[10].x, _881);
    bool _889 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _891 = isnan(1.0);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _897 = _893 || _895;
    float _899 = 1.0 / _885;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _903 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[10].z, _887);
    float _905 = float(_863);
    float _907 = _833 * _145;
    float _909 = float(_879);
    float _911 = -_875;
    float _913 = _911 + 1.0;
    bool _915 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _917 = isnan(0.0);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _923 = _919 || _921;
    float _925 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[78].z, _901);
    float _927 = _697 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _929 = _903 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _931 = float(_595);
    float _933 = _909 * _905;
    float _935 = 1.0 / _927;
    float _937 = _923 ? _913 : 0.0;
    float _939 = _929 + _927;
    float _941 = _583 + (-0.5);
    float _943 = _931 * _145;
    float _945 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _925);
    if (_897)
    {
        float _947 = _937 * _899;
        _147 = _947;
    }
    float _949 = _147;
    float _951 = fma(_703, _877, _703);
    float _953 = fma(_877, _865, _865);
    bool _955 = !_729;
    int _957 = _955 ? 0 : 1;
    float _959 = float(_845);
    float _961 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].x, _953);
    int _963 = abs(_957);
    float _965 = _585 + _587;
    float _967 = _939 * _935;
    float _969 = _967 * 0.5;
    float _971 = fma(_951, _949, _961);
    float _973 = _965 + (-1.0);
    float _975 = _933 * (-2.0);
    float _977 = float(_963);
    float _979 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _981 = fma(_969, (*spvDescriptorSet0.vp_c8)._m0[30].w, _979);
    float _983 = _971 * 0.15915493667125701904296875;
    float _985 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _987 = fma(_975, _867, _867);
    float _989 = _977 * _959;
    float _991 = _585 + (-0.5);
    float _993 = _587 + _583;
    float _995 = fma(_985, _975, _985);
    float _997 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[196].y, _987);
    float _999 = _993 + (-1.0);
    float _1001 = _989 * (-2.0);
    float _1003 = 1.0 / _981;
    float _1005 = fma(_995, _949, _997);
    float _1007 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1009 = fma(_1001, _869, _869);
    float _1011 = _587 + (-0.5);
    float _1013 = _1005 * 0.15915493667125701904296875;
    float _1015 = fma(_1007, _1001, _1007);
    float _1017 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1019 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1009);
    float _1021 = _983 * 6.283185482025146484375;
    float _1023 = sin(_1021);
    float _1025 = _641 * _1017;
    float _1027 = fma(_1015, _949, _1019);
    float _1029 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1031 = _1027 * 0.15915493667125701904296875;
    float _1033 = _983 * 6.283185482025146484375;
    float _1035 = cos(_1033);
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1039 = _1003 * _1037;
    float _1041 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1043 = _635 + _1029;
    bool _1045 = _1039 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1047 = _603 * _1041;
    float _1049 = _1013 * 6.283185482025146484375;
    float _1051 = sin(_1049);
    bool _1053 = _1039 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1055 = _1013 * 6.283185482025146484375;
    float _1057 = cos(_1055);
    int _1059 = 2;
    if (!_1045)
    {
        _1059 = 1;
    }
    int _1061 = _1059;
    float _1063 = _1031 * 6.283185482025146484375;
    float _1065 = cos(_1063);
    float _1067 = _1023 * _1051;
    float _1069 = _1035 * _1051;
    float _1071 = _1031 * 6.283185482025146484375;
    float _1073 = sin(_1071);
    float _1075 = _1023 * _1057;
    float _1077 = _1035 * _1057;
    float _1079 = _1023 * _1065;
    float _1081 = _1057 * _1065;
    float _1083 = _1035 * _1065;
    float _1085 = _1051 * _1065;
    float _1087 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1089 = _1083 * _1025;
    float _1091 = fma(_1073, _1077, _1067);
    float _1093 = fma(_1073, _1067, _1077);
    bool _1095 = !_1045;
    int _1097 = _1095 ? 0 : 1;
    float _1099 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1087);
    float _1101 = -_1069;
    float _1103 = fma(_1073, _1075, _1101);
    float _1105 = -_1075;
    float _1107 = fma(_1073, _1069, _1105);
    int _1109 = _1061;
    if (!_1053)
    {
        _1109 = _1097;
    }
    int _1111 = _1109;
    float _1113 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1099);
    float _1115 = _1043 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _1117 = _1111 << 6;
    float _1119 = _1113 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1121 = fma(_561, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1115);
    float _1123 = -_1025;
    float _1125 = _1073 * _1123;
    float _1127 = fma(_1091, _1047, _1089);
    float _1129 = _1079 * _1025;
    float _1131 = fma(_563, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1121);
    float _1133 = fma(_1081, _1047, _1125);
    float _1135 = fma(_1107, _717, _1127);
    float _1137 = fma(_1103, _1047, _1129);
    float _1139 = _1131 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1141 = fma(_1085, _717, _1133);
    float _1143 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1145 = fma(_1093, _717, _1137);
    float _1147 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1149 = trunc(_1119);
    int _1151 = int(_1149);
    float _1153 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1143);
    int _1155 = _1117 + 64;
    uint _1158 = uint(int(uint(_1155) >> uint(2)));
    uint _1160 = uint(int(uint(int(_1158)) >> uint(2)));
    int _1162 = int(_1158) & 3;
    float _1164 = (*spvDescriptorSet0.vp_c15)._m0[int(_1160)][_1162];
    int _1166 = int(_1158) + 1;
    uint _1168 = uint(int(uint(_1166) >> uint(2)));
    int _1170 = _1166 & 3;
    float _1172 = (*spvDescriptorSet0.vp_c15)._m0[int(_1168)][_1170];
    float _1174 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1147);
    float _1176 = _1135 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1153);
    float _1180 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1174);
    float _1182 = trunc(_1139);
    int _1184 = int(_1182);
    float _1186 = _1178 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1188 = _1117 + 48;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    uint _1192 = uint(int(uint(int(_1190)) >> uint(2)));
    int _1194 = int(_1190) & 3;
    float _1196 = (*spvDescriptorSet0.vp_c15)._m0[int(_1192)][_1194];
    int _1198 = int(_1190) + 1;
    uint _1200 = uint(int(uint(_1198) >> uint(2)));
    int _1202 = _1198 & 3;
    float _1204 = (*spvDescriptorSet0.vp_c15)._m0[int(_1200)][_1202];
    float _1206 = _1180 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1208 = fma(_1141, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1210 = _563 + _1186;
    float _1212 = _561 + _1206;
    int _1214 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1216 = _1151 + _1214;
    int _1218 = _1216 + 1;
    float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1222 = _1210 + _1220;
    int _1224 = _1117 + 56;
    uint _1226 = uint(int(uint(_1224) >> uint(2)));
    uint _1228 = uint(int(uint(int(_1226)) >> uint(2)));
    int _1230 = int(_1226) & 3;
    float _1232 = (*spvDescriptorSet0.vp_c15)._m0[int(_1228)][_1230];
    int _1234 = int(_1226) + 1;
    uint _1236 = uint(int(uint(_1234) >> uint(2)));
    int _1238 = _1234 & 3;
    float _1240 = (*spvDescriptorSet0.vp_c15)._m0[int(_1236)][_1238];
    float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1244 = _1212 + _1242;
    bool _1246 = _1218 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1248 = fma(_1145, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1208);
    int _1250 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1252 = _1184 + _1250;
    int _1254 = _1252 + 1;
    float _1256 = _1222 * _1222;
    int _1258 = _1117 + 72;
    uint _1260 = uint(int(uint(_1258) >> uint(2)));
    uint _1262 = uint(int(uint(int(_1260)) >> uint(2)));
    int _1264 = int(_1260) & 3;
    float _1266 = (*spvDescriptorSet0.vp_c15)._m0[int(_1262)][_1264];
    int _1268 = int(_1260) + 1;
    uint _1270 = uint(int(uint(_1268) >> uint(2)));
    int _1272 = _1268 & 3;
    float _1274 = (*spvDescriptorSet0.vp_c15)._m0[int(_1270)][_1272];
    float _1276 = _1248 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1278 = _1218 | _1254;
    float _1280 = fma(_1244, _1244, _1256);
    float _1282 = _635 + _1276;
    bool _1284 = _1278 < 0;
    bool _1286 = _1284 || _1246;
    int _1288 = _1117 + 96;
    uint _1290 = uint(int(uint(_1288) >> uint(2)));
    uint _1292 = uint(int(uint(int(_1290)) >> uint(2)));
    int _1294 = int(_1290) & 3;
    float _1296 = (*spvDescriptorSet0.vp_c15)._m0[int(_1292)][_1294];
    int _1298 = int(_1290) + 1;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    int _1302 = _1298 & 3;
    float _1304 = (*spvDescriptorSet0.vp_c15)._m0[int(_1300)][_1302];
    float _1306 = sqrt(_1280);
    bool _1308 = _1254 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1310 = _1308 || _1286;
    int _1312 = _1117 + 104;
    uint _1314 = uint(int(uint(_1312) >> uint(2)));
    uint _1316 = uint(int(uint(int(_1314)) >> uint(2)));
    int _1318 = int(_1314) & 3;
    float _1320 = (*spvDescriptorSet0.vp_c15)._m0[int(_1316)][_1318];
    int _1322 = int(_1314) + 1;
    uint _1324 = uint(int(uint(_1322) >> uint(2)));
    int _1326 = _1322 & 3;
    float _1328 = (*spvDescriptorSet0.vp_c15)._m0[int(_1324)][_1326];
    int _1330 = as_type<int>(_1141);
    int _1332 = _1254;
    float _1334 = _1145;
    float _1336 = _1212;
    float _1338 = _1210;
    float _1340 = as_type<float>(_1218);
    if (!_1310)
    {
        int _1342 = _1254 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1344 = _1342 + _1218;
        _1330 = _1344;
    }
    int _1346 = _1330;
    bool _1348 = _1306 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1350 = _1306;
    if (!_1310)
    {
        int _1352 = _1346 << 2;
        _1332 = _1352;
    }
    int _1354 = _1332;
    int _1356 = 0;
    int _1358 = _1354;
    if (!_1310)
    {
        uint _1360 = uint(int(uint(_1346) >> uint(2)));
        _1356 = int(_1360);
    }
    int _1362 = _1356;
    int _1364 = _1362;
    if (!_1310)
    {
        int _1366 = 12 & _1354;
        _1358 = _1366;
    }
    int _1368 = _1358;
    if (!_1310)
    {
        int _1370 = _1362 << 4;
        int _1372 = _1370 + _1368;
        _1364 = _1372;
    }
    int _1374 = _1364;
    if (!_1348)
    {
        _1334 = _1212;
    }
    float _1376 = _1334;
    float _1378 = _1376;
    if (!_1348)
    {
        _1336 = _1282;
    }
    float _1380 = _1336;
    bool _1382 = !_1348;
    float _1384 = _1380;
    if (!_1382)
    {
        float _1386 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1390 = _1306 + _1388;
        float _1392 = rsqrt(_1280);
        float _1394 = _1390 * _1386;
        float _1396 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1398 = _1394 * 0.15915493667125701904296875;
        float _1400 = _1398 * 6.283185482025146484375;
        float _1402 = sin(_1400);
        float _1404 = _1398 * 6.283185482025146484375;
        float _1406 = cos(_1404);
        float _1408 = fma(_1402, _1396, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1410 = _1392 * _1408;
        float _1412 = _1406 + (-1.0);
        float _1414 = fma(_1244, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1416 = fma(_1222, _1410, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1418 = _1412 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1420 = fma(_1282, _1406, _1418);
        _1384 = _1420;
        _1378 = _1414;
        _1338 = _1416;
        _1350 = _1418;
        _1340 = _1412;
    }
    float _1422 = _1384;
    float _1424 = _1378;
    float _1426 = _1338;
    float _1428 = _1350;
    float _1430 = _1340;
    float _1432 = -_635;
    float _1434 = _1432 + _1422;
    int _1436 = _1117 + 80;
    uint _1438 = uint(int(uint(_1436) >> uint(2)));
    uint _1440 = uint(int(uint(int(_1438)) >> uint(2)));
    int _1442 = int(_1438) & 3;
    float _1444 = (*spvDescriptorSet0.vp_c15)._m0[int(_1440)][_1442];
    int _1446 = int(_1438) + 1;
    uint _1448 = uint(int(uint(_1446) >> uint(2)));
    int _1450 = _1446 & 3;
    float _1452 = (*spvDescriptorSet0.vp_c15)._m0[int(_1448)][_1450];
    float _1454 = -_561;
    float _1456 = _1454 + _1424;
    float _1458 = -_563;
    float _1460 = _1458 + _1426;
    float _1462 = _1434 * _1434;
    float _1464 = _1043 * _1304;
    float _1466 = _1043 * _1172;
    float _1468 = _1430;
    float _1470 = _1424;
    float _1472 = _1422;
    float _1474 = _1426;
    if (!_1310)
    {
        float _1476 = floor(_1119);
        _1468 = _1476;
    }
    float _1478 = _1468;
    float _1480 = fma(_1456, _1456, _1462);
    int _1482 = _1117 + 88;
    uint _1484 = uint(int(uint(_1482) >> uint(2)));
    uint _1486 = uint(int(uint(int(_1484)) >> uint(2)));
    int _1488 = int(_1484) & 3;
    float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
    int _1492 = int(_1484) + 1;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    int _1496 = _1492 & 3;
    float _1498 = (*spvDescriptorSet0.vp_c15)._m0[int(_1494)][_1496];
    float _1500 = fma(_561, _1296, _1464);
    float _1502 = fma(_561, _1164, _1466);
    float _1504 = fma(_1460, _1460, _1480);
    float _1506 = fma(_563, _1320, _1500);
    float _1508 = _1043 * _1204;
    float _1510 = sqrt(_1504);
    float _1512 = _1428;
    float _1514 = _1508;
    if (!_1310)
    {
        int _1516 = _1374 + 400;
        uint _1518 = uint(int(uint(_1516) >> uint(2)));
        uint _1520 = uint(int(uint(int(_1518)) >> uint(2)));
        int _1522 = int(_1518) & 3;
        float _1524 = (*spvDescriptorSet0.vp_c15)._m0[int(_1520)][_1522];
        _1512 = _1524;
    }
    float _1526 = _1512;
    float _1528 = _1506 + _1328;
    float _1530 = fma(_561, _1196, _1508);
    float _1532 = fma(_563, _1266, _1502);
    bool _1534 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1536 = isnan(0.5);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1542 = _1538 || _1540;
    float _1544 = fma(_563, _1232, _1530);
    float _1546 = _1320;
    float _1548 = _1528;
    if (!_1310)
    {
        float _1550 = floor(_1139);
        _1546 = _1550;
    }
    float _1552 = _1546;
    float _1554 = _1532 + _1274;
    float _1556 = _1544 + _1240;
    bool _1558 = _1510 > 0.0;
    float _1560 = 1.0 / _1528;
    bool _1562 = !_1558;
    if (!_1562)
    {
        float _1564 = _207 * _207;
        float _1566 = rsqrt(_1504);
        float _1568 = fma(_205, _205, _1564);
        float _1570 = fma(_209, _209, _1568);
        float _1572 = sqrt(_1570);
        float _1574 = _1456 * _1566;
        float _1576 = _1434 * _1566;
        float _1578 = _1460 * _1566;
        bool _1580 = _1572 > 0.0;
        bool _1582 = !_1580;
        _1514 = _1576;
        if (!_1582)
        {
            float _1584 = rsqrt(_1570);
            float _1586 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1588 = _207 * _1584;
            float _1590 = _205 * _1584;
            float _1592 = _1576 * _1588;
            float _1594 = _209 * _1584;
            float _1596 = fma(_1574, _1590, _1592);
            float _1598 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1600 = fma(_1578, _1594, _1596);
            float _1602 = _1600 * _1598;
            float _1604 = fma(_205, _1602, _1424);
            float _1606 = fma(_207, _1602, _1422);
            float _1608 = fma(_209, _1602, _1426);
            _1470 = _1604;
            _1472 = _1606;
            _1474 = _1608;
        }
    }
    float _1610 = _1470;
    float _1612 = _1472;
    float _1614 = _1474;
    float _1616 = _1514;
    float _1618 = _1612;
    float _1620 = _1616;
    if (_1542)
    {
        _213 = _1610;
    }
    float _1622 = _213;
    float _1624 = _1622;
    if (_1542)
    {
        _215 = _1612;
    }
    float _1626 = _215;
    float _1628 = _1626;
    if (_1542)
    {
        _217 = _1614;
    }
    float _1630 = _217;
    float _1632 = _1630;
    if (!_1542)
    {
        float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1636 = _635 + _1634;
        float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1640 = _561 + _1638;
        float _1642 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1644 = -_635;
        float _1646 = _1644 + _1612;
        float _1648 = _1636 * _1636;
        float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1652 = _563 + _1650;
        float _1654 = -_561;
        float _1656 = _1654 + _1610;
        float _1658 = -_563;
        float _1660 = _1658 + _1614;
        float _1662 = fma(_1640, _1640, _1648);
        float _1664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1666 = fma(_1652, _1652, _1662);
        float _1668 = sqrt(_1666);
        float _1670 = _1642 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1672 = precise::min(_1668, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1674 = _1672 * _1664;
        float _1676 = _1670 * _1674;
        float _1678 = fma(_1646, _1676, _635);
        float _1680 = fma(_1656, _1676, _561);
        float _1682 = fma(_1660, _1676, _563);
        _1628 = _1678;
        _1624 = _1680;
        _1632 = _1682;
        _1618 = _1646;
    }
    float _1684 = _1628;
    float _1686 = _1624;
    float _1688 = _1632;
    float _1690 = _1618;
    float _1692 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1694 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1696 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1698 = _1556 * _1560;
    float _1700 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1692);
    float _1702 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1694);
    float _1704 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1696);
    float _1706 = _1690;
    if (!_1310)
    {
        float _1708 = rint(_1526);
        float _1710 = precise::max(_1708, 0.0);
        uint _1712 = uint(_1710);
        uint _1714 = clamp(_1712, 0u, 65535u);
        _1620 = as_type<float>(_1714);
    }
    float _1716 = _1620;
    float _1718 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1700);
    bool _1720 = _1698 >= 0.0;
    float _1722 = _1684 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1704);
    float _1726 = _1554 * _1560;
    bool _1728 = _1698 <= 1.0;
    bool _1730 = _1728 && _1720;
    float _1732 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1734 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1736 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1702);
    float _1738 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1740 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1742 = _1726 >= 0.0;
    bool _1744 = _1742 && _1730;
    float _1746 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1748 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1750 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1732);
    bool _1752 = _1726 <= 1.0;
    bool _1754 = _1752 && _1744;
    float _1756 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1758 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1748);
    float _1760 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    if (!_1310)
    {
        float _1762 = -_1552;
        float _1764 = _1139 + _1762;
        _1706 = _1764;
    }
    float _1766 = _1706;
    float _1768 = -_1756;
    float _1770 = fma(_1768, _1734, 1.0);
    float _1772 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1774 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1758);
    float _1776 = _1043 * _1452;
    float _1778 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1780 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1774);
    float _1782 = log2(_1770);
    float _1784 = fma(_561, _1444, _1776);
    if (_1754)
    {
        float _1786 = float(_1111);
        _1548 = _1786;
    }
    float _1788 = _1548;
    float _1790 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1778);
    float _1792 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1760);
    float _1794 = fma(_563, _1490, _1784);
    float _1796 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1790);
    float _1798 = 1.0 / _1780;
    float _1800 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1792);
    float _1802 = _1794 + _1498;
    float _1804 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1796);
    float _1806 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1800);
    float _1808 = _1800;
    if (!_1310)
    {
        float _1810 = -_1478;
        float _1812 = _1119 + _1810;
        _1808 = _1812;
    }
    float _1814 = _1808;
    float _1816 = _1784;
    if (_1754)
    {
        float _1818 = rint(_1788);
        float _1820 = precise::max(_1818, 0.0);
        uint _1822 = uint(_1820);
        uint _1824 = clamp(_1822, 0u, 65535u);
        _1816 = as_type<float>(_1824);
    }
    float _1826 = _1816;
    float _1828 = _1782 * 0.693147182464599609375;
    float _1830 = _1802 * _1560;
    float _1832 = _1804 * _1798;
    float _1834 = _1806 * _1798;
    float _1836 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1838 = fma(_1832, 0.5, 0.5);
    float _1840 = fma(_1834, -0.5, 0.5);
    float _1842 = _1766;
    float _1844 = _1838;
    float _1846 = _1836;
    if (!_1310)
    {
        float3 _6262 = float3(_1814, _1766, float(as_type<int>(_1716)));
        float3 _6266 = select(_6262, float3(0.0), isnan(_6262));
        float _1848 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6266.xy, uint(rint(_6266.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6266.xy, uint(rint(_6266.z)), level(0.0)).x;
        _1842 = _1848;
    }
    float _1850 = _1842;
    float _1852 = _1726;
    if (_1754)
    {
        float3 _6281 = float3(_1698, _1726, float(as_type<int>(_1826)));
        float3 _6283 = select(_6281, float3(0.0), isnan(_6281));
        float _1854 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6283.xy, uint(rint(_6283.z)), _1830, level(0.0));
        _1852 = _1854;
    }
    float _1856 = _1852;
    float3 _6293 = float3(_1838, _1840, _1836);
    float _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6293, float3(0.0), isnan(_6293)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6293, float3(0.0), isnan(_6293)), level(0.0)).x;
    float3 _6302 = float3(_1838, _1840, _1836);
    float4 _1861 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6302, float3(0.0), isnan(_6302)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6302, float3(0.0), isnan(_6302)), level(0.0)).xyzw;
    float _1863 = _1861.x;
    float _1865 = _1861.y;
    float _1867 = _1861.z;
    float _1869 = _1861.w;
    float _1871 = float(uint(_595));
    float _1873 = trunc(_907);
    int _1875 = int(_1873);
    float _1877 = 1.0 / _1871;
    float _1879 = float(uint(_1875));
    int _1881 = as_type<int>(_1877) + (-2);
    float _1883 = as_type<float>(_1881) * _1879;
    float _1885 = trunc(_1883);
    float _1887 = precise::max(_1885, 0.0);
    uint _1889 = uint(_1887);
    int _1891 = ~_595;
    int _1893 = _1891 + 1;
    int _1895 = ~_595;
    int _1897 = _1895 + 1;
    float _1899 = 1.0 / _539;
    int _1901 = _1893 * int(_1889);
    int _1903 = _1901 + _1875;
    float _1905 = float(uint(_1903));
    float _1907 = _943 * _1899;
    float _1909 = _1899;
    float _1911 = as_type<float>(_1889);
    if (_1310)
    {
        _1909 = 1.0;
    }
    float _1913 = _1909;
    float _1915 = as_type<float>(_1881) * _1905;
    bool _1917 = !_599;
    float _1919 = _1917 ? 7.345489978790283203125 : 1.0;
    float _1921 = trunc(_1915);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    bool _1927 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1929 = isnan(0.5);
    bool _1931 = _1927 || _1929;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1935 = _1931 || _1933;
    float _1937 = _1919 * _583;
    float _1939 = floor(_1937);
    float _1941 = _1913;
    if (_1935)
    {
        _1844 = 1.0;
    }
    float _1943 = _1844;
    int _1945 = int(_1889) + int(_1925);
    int _1947 = _1897 * _1945;
    int _1949 = _1947 + _1875;
    float _1951 = -_1939;
    float _1953 = _1937 + _1951;
    bool _1955 = uint(_1949) >= uint(_595);
    float _1957 = float(_1875);
    bool _1959 = !_1955;
    int _1961 = _1959 ? 0 : (-1);
    bool _1963 = _1957 >= _931;
    bool _1965 = isnan(_1957);
    bool _1967 = _1963 || _1965;
    bool _1969 = isnan(_931);
    bool _1971 = _1967 || _1969;
    float _1973 = float(_1971);
    float _1975 = _1953 * _931;
    int _1977 = ~_1945;
    int _1979 = _1977 + _1961;
    int _1981 = _1979 + 1;
    float _1983 = _1957;
    float _1985 = _1943;
    if (_1935)
    {
        _1983 = 1.0;
    }
    float _1987 = _1983;
    float _1989 = _1987;
    if (!_1935)
    {
        float _1991 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1993 = _1991 * 0.15915493667125701904296875;
        float _1995 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1997 = _1993 * 6.283185482025146484375;
        float _1999 = cos(_1997);
        float _2001 = _1995 * 0.15915493667125701904296875;
        float _2003 = _1993 * 6.283185482025146484375;
        float _2005 = sin(_2003);
        float _2007 = 1.0 / _1999;
        float _2009 = _2001 * 6.283185482025146484375;
        float _2011 = cos(_2009);
        float _2013 = _2005 * _2007;
        float _2015 = _2001 * 6.283185482025146484375;
        float _2017 = sin(_2015);
        float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2021 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2019;
        float _2023 = _2011 * _2013;
        float _2025 = 1.0 / _2021;
        float _2027 = 1.0 / _2023;
        float _2029 = _2017 * _2027;
        float _2031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2033 = fma(_1039, _2029, _2031);
        float _2035 = _2033 * _2025;
        float _2037 = precise::clamp(_2035, 0.0, 1.0);
        _1911 = _2013;
        _1985 = _2037;
    }
    float _2039 = _1911;
    float _2041 = _1985;
    float _2043 = _2039;
    if (!_1935)
    {
        float _2045 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2047 = _2045 * 0.15915493667125701904296875;
        float _2049 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2051 = _2047 * 6.283185482025146484375;
        float _2053 = cos(_2051);
        float _2055 = _2049 * 0.15915493667125701904296875;
        float _2057 = _2047 * 6.283185482025146484375;
        float _2059 = sin(_2057);
        float _2061 = 1.0 / _2053;
        float _2063 = _2055 * 6.283185482025146484375;
        float _2065 = cos(_2063);
        float _2067 = _2059 * _2061;
        float _2069 = _2055 * 6.283185482025146484375;
        float _2071 = sin(_2069);
        float _2073 = _2065 * _2067;
        float _2075 = 1.0 / _2073;
        float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2079 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2077;
        float _2081 = 1.0 / _2079;
        float _2083 = _2071 * _2075;
        float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2087 = fma(_1039, _2083, _2085);
        float _2089 = _2087 * _2081;
        float _2091 = precise::clamp(_2089, 0.0, 1.0);
        float _2093 = -_2091;
        float _2095 = _2093 + 1.0;
        _2043 = _2061;
        _1846 = _2073;
        _1989 = _2095;
    }
    float _2097 = _2043;
    float _2099 = _1846;
    float _2101 = _1989;
    float _2103 = _2099;
    if (!_1310)
    {
        int _2105 = _1346 << 4;
        int _2107 = _2105 + 2048;
        uint _2109 = uint(int(uint(_2107) >> uint(2)));
        uint _2111 = uint(int(uint(int(_2109)) >> uint(2)));
        int _2113 = int(_2109) & 3;
        float _2115 = (*spvDescriptorSet0.vp_c15)._m0[int(_2111)][_2113];
        int _2117 = int(_2109) + 1;
        uint _2119 = uint(int(uint(_2117) >> uint(2)));
        int _2121 = _2117 & 3;
        float _2123 = (*spvDescriptorSet0.vp_c15)._m0[int(_2119)][_2121];
        int _2125 = _2107 + 8;
        uint _2127 = uint(int(uint(_2125) >> uint(2)));
        uint _2129 = uint(int(uint(int(_2127)) >> uint(2)));
        int _2131 = int(_2127) & 3;
        float _2133 = (*spvDescriptorSet0.vp_c15)._m0[int(_2129)][_2131];
        int _2135 = int(_2127) + 1;
        uint _2137 = uint(int(uint(_2135) >> uint(2)));
        int _2139 = _2135 & 3;
        float _2141 = (*spvDescriptorSet0.vp_c15)._m0[int(_2137)][_2139];
        float _2143 = _1043 * _2123;
        float _2145 = fma(_561, _2115, _2143);
        float _2147 = fma(_563, _2133, _2145);
        float _2149 = _2147 + _2141;
        float _2151 = precise::clamp(_2149, 0.0, 1.0);
        float _2153 = -_2151;
        float _2155 = _2153 + _1850;
        float _2157 = fma(_2155, 500.0, 1.5);
        float _2159 = exp2(_2157);
        float _2161 = 0.0 + _2159;
        float _2163 = precise::clamp(_2161, 0.0, 1.0);
        _1941 = _2163;
    }
    float _2165 = _1941;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2169 = _1684 + _2167;
    float _2171 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2173 = _1686 + _2171;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2177 = _1688 + _2175;
    float _2179 = trunc(_1973);
    int _2181 = int(_2179);
    float _2183 = _2169 * _2169;
    int _2185 = _595 * _1981;
    int _2187 = _2185 + _1875;
    float _2189 = fma(_2173, _2173, _2183);
    float _2191 = trunc(_1975);
    int _2193 = int(_2191);
    float _2195 = fma(_2177, _2177, _2189);
    float _2197 = rsqrt(_2195);
    float _2199 = sqrt(_2195);
    float _2201 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2203 = _2173 * _2201;
    float _2205 = _2177 * _2201;
    float _2207 = _2203 * _2203;
    float _2209 = _2205 * _2205;
    float _2211 = _2207 + _2209;
    float _2213 = sqrt(_2211);
    bool _2215 = _2213 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2219 = _2213 + _2217;
    float _2221 = _1850;
    float _2223 = _2211;
    float _2225 = _2219;
    float _2227 = _2201;
    float _2229 = _2205;
    float _2231 = _2207;
    float _2233 = _2209;
    if (_2215)
    {
        float _2235 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2221 = _2235;
    }
    float _2237 = _2221;
    if (_2215)
    {
        float _2239 = rsqrt(_2211);
        _2223 = _2239;
    }
    float _2241 = _2223;
    if (_2215)
    {
        float _2243 = _2219 * _2237;
        _2225 = _2243;
    }
    float _2245 = _2225;
    if (_2215)
    {
        float _2247 = _2245 * 0.15915493667125701904296875;
        _2103 = _2247;
    }
    float _2249 = _2103;
    float _2251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2253 = _2097;
    if (_2215)
    {
        float _2255 = _2249 * 6.283185482025146484375;
        float _2257 = sin(_2255);
        _2253 = _2257;
    }
    float _2259 = _2253;
    float _2261 = precise::max(0.0, _2251);
    float _2263 = _2245;
    float _2265 = _2261;
    if (_2215)
    {
        float _2267 = _2249 * 6.283185482025146484375;
        float _2269 = cos(_2267);
        _2263 = _2269;
    }
    float _2271 = _2263;
    float _2273 = -_2201;
    float _2275 = -_2261;
    float _2277 = fma(_2169, _2273, _2275);
    float _2279 = _2277;
    if (_2215)
    {
        float _2281 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2227 = _2281;
    }
    float _2283 = _2227;
    float _2285 = _2259;
    float _2287 = _2283;
    if (_2215)
    {
        float _2289 = fma(_2259, _2283, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2285 = _2289;
    }
    float _2291 = _2285;
    float _2293 = _2291;
    if (!_2215)
    {
        _2287 = _2203;
    }
    float _2295 = _2287;
    float _2297 = _2295;
    if (_2215)
    {
        float _2299 = _2241 * _2291;
        _2293 = _2299;
    }
    float _2301 = _2293;
    if (_2215)
    {
        float _2303 = _2271 + (-1.0);
        _2265 = _2303;
    }
    float _2305 = _2265;
    float _2307 = _2305;
    if (_2215)
    {
        float _2309 = _2203 * _2301;
        _2297 = _2309;
    }
    float _2311 = _2297;
    if (_2215)
    {
        float _2313 = _2205 * _2301;
        _2229 = _2313;
    }
    float _2315 = _2229;
    if (_2215)
    {
        float _2317 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2307 = _2317;
    }
    float _2319 = _2307;
    if (_2215)
    {
        float _2321 = _2311 * _2311;
        _2231 = _2321;
    }
    float _2323 = _2231;
    if (_2215)
    {
        float _2325 = _2315 * _2315;
        _2233 = _2325;
    }
    float _2327 = _2233;
    if (_2215)
    {
        float _2329 = fma(_2277, _2271, _2319);
        _2279 = _2329;
    }
    float _2331 = _2279;
    bool _2333 = _595 == 0;
    float _2335 = fma(_2331, _2331, _2323);
    float _2337 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2339 = fma(_2199, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2337);
    float _2341 = precise::clamp(_2339, 0.0, 1.0);
    bool _2343 = !_2333;
    int _2345 = _2343 ? _2187 : (-1);
    float _2347 = _2335 + _2327;
    float _2349 = -_2341;
    float _2351 = _2349 + 1.0;
    float _2353 = rsqrt(_2347);
    float _2355 = abs(_2351);
    float _2357 = log2(_2355);
    float _2359 = _2353 * _2311;
    float _2361 = _2353 * _2331;
    float _2363 = _2353 * _2315;
    float _2365 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2367 = _2361 + 1.0;
    float _2369 = -_2365;
    float _2371 = fma(_2361, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2369);
    float _2373 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2375 = -_2363;
    float _2377 = fma(_2375, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2371);
    float _2379 = exp2(_2373);
    float _2381 = fma(_2377, -0.5, 0.5);
    float _2383 = fma(_2377, 0.5, 0.5);
    float _2385 = fma(_2383, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2387 = sqrt(_2381);
    float _2389 = fma(_2383, _2385, -0.212114393711090087890625);
    float _2391 = fma(_2383, _2389, 1.570728778839111328125);
    float _2393 = -_2361;
    float _2395 = fma(_2379, _2367, _2393);
    float _2397 = fma(_2395, 0.5, 0.5);
    int _2399 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2401 = _2399 != 0;
    float _2403 = _2387 * 0.636619746685028076171875;
    float _2405 = -_2391;
    float _2407 = fma(_2403, _2405, 1.0);
    int _2409 = ~_2181;
    int _2411 = _2409 + 1;
    int _2413 = _2411 + 1;
    float2 _7083 = float2(_2407, _2397);
    float3 _2417 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7083, float2(0.0), isnan(_7083)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7083, float2(0.0), isnan(_7083)), level(0.0)).xyz;
    float _2419 = _2417.x;
    float _2421 = _2417.y;
    float _2423 = _2417.z;
    float _2425 = trunc(_1907);
    int _2427 = int(_2425);
    int _2429 = _595 + (-1);
    int _2431 = _2345 * _2413;
    bool _2433 = !_2401;
    int _2435 = _2433 ? 0 : 1;
    float _2437 = -_945;
    float _2439 = _2437 + 1.0;
    int _2441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2443 = _2441 != 0;
    int _2445 = _2181 * _2429;
    int _2447 = _2445 + _2431;
    int _2449 = abs(_627);
    float _2451 = -_763;
    float _2453 = _2451 + 1.0;
    int _2455 = abs(_633);
    float _2457 = -_815;
    float _2459 = _2457 + 1.0;
    float _2461 = -_781;
    float _2463 = _2461 + 1.0;
    int _2465 = abs(_2435);
    float _2467 = _2357 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2469 = !_2443;
    int _2471 = _2469 ? 0 : 1;
    float _2473 = -_581;
    float _2475 = _2473 + 1.0;
    int _2477 = abs(_639);
    int _2479 = _2447 * _2449;
    int _2481 = _2193 * _2465;
    int _2483 = _2481 + _1875;
    int _2485 = abs(_2471);
    float _2487 = exp2(_2467);
    int _2489 = _2427 * _2455;
    int _2491 = _2489 + _2479;
    int _2493 = ~_595;
    int _2495 = _2493 + 1;
    bool _2497 = _583 > 0.5;
    int _2499 = _2483 * _2477;
    int _2501 = _2499 + _2491;
    bool _2503 = _589 > 0.5;
    float _2505 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2507 = _541 + _2505;
    bool _2509 = _585 > 0.5;
    int _2511 = _2193 * _2485;
    int _2513 = _2511 + _2501;
    int _2515 = ~_595;
    int _2517 = _2515 + 1;
    bool _2519 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2521 = isnan(_541);
    bool _2523 = _2519 || _2521;
    bool _2525 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2527 = _2523 || _2525;
    float _2529 = float(_2527);
    float _2531 = float(uint(_2513));
    int _2533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2535 = _2533 != 0;
    float _2537 = -_193;
    int _2539 = _2497 ? as_type<int>(_2537) : as_type<int>(_193);
    float _2541 = as_type<float>(_1881) * _2531;
    int _2543 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2545 = _2543 != 0;
    float _2547 = float(uint(_2483));
    float _2549 = trunc(_2541);
    float _2551 = precise::max(_2549, 0.0);
    uint _2553 = uint(_2551);
    float _2555 = as_type<float>(_1881) * _2547;
    int _2557 = _2517 * int(_2553);
    int _2559 = _2557 + _2513;
    float _2561 = float(uint(_2559));
    float _2563 = as_type<float>(_1881) * _2561;
    float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2567 = _2565 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2569 = trunc(_2563);
    float _2571 = precise::max(_2569, 0.0);
    uint _2573 = uint(_2571);
    float _2575 = 1.0 / _2567;
    int _2577 = int(_2553) + int(_2573);
    float _2579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2581 = -_203;
    int _2583 = _2509 ? as_type<int>(_2581) : as_type<int>(_203);
    int _2585 = _2495 * _2577;
    int _2587 = _2585 + _2513;
    int _2589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2591 = _2589 != 0;
    float _2593 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2595 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2593;
    bool _2597 = uint(_2587) >= uint(_595);
    float _2599 = _2595 * _2575;
    bool _2601 = !_2597;
    int _2603 = _2601 ? 0 : (-1);
    float _2605 = fma(_2599, _2507, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2607 = _587 > 0.5;
    float _2609 = -_2529;
    float _2611 = _2609 + 1.0;
    int _2613 = ~_2577;
    int _2615 = _2613 + _2603;
    int _2617 = _2615 + 1;
    float _2619 = _2579 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2621 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2623 = isnan(_541);
    bool _2625 = _2621 || _2623;
    bool _2627 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2629 = _2625 || _2627;
    float _2631 = float(_2629);
    float _2633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2635 = !_2535;
    float _2637 = _2635 ? _193 : as_type<float>(_2539);
    int _2639 = _595 * _2617;
    int _2641 = _2639 + _2513;
    bool _2643 = !_2545;
    float _2645 = _2643 ? _203 : as_type<float>(_2583);
    float _2647 = _2631 * _2611;
    int _2649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2651 = _2649 != 0;
    float _2653 = _2637 + 0.5;
    bool _2655 = !_2333;
    int _2657 = _2655 ? _2641 : (-1);
    float _2659 = _2645 + (-0.5);
    float _2661 = _2605 * _2647;
    float _2663 = -_193;
    int _2665 = _2607 ? as_type<int>(_2663) : as_type<int>(_193);
    float _2667 = fma(_2653, (*spvDescriptorSet0.vp_c9)._m0[80].x, _691);
    float _2669 = -_2659;
    float _2671 = -_695;
    float _2673 = fma(_2669, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2671);
    float _2675 = -_2631;
    float _2677 = _2675 + 1.0;
    float _2679 = -_203;
    int _2681 = _2503 ? as_type<int>(_2679) : as_type<int>(_203);
    float _2683 = trunc(_2555);
    float _2685 = precise::max(_2683, 0.0);
    uint _2687 = uint(_2685);
    bool _2689 = !_2651;
    float _2691 = _2689 ? _193 : as_type<float>(_2665);
    float _2693 = _2633 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2695 = !_2591;
    float _2697 = _2695 ? _203 : as_type<float>(_2681);
    float _2699 = fma(_2677, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2661);
    float _2701 = fma(_2645, _2453, _2673);
    float _2703 = _2691 + 0.5;
    int _2705 = _2657 & 3;
    bool _2707 = _2705 != 0;
    float _2709 = _2697 + (-0.5);
    float _2711 = fma(_2529, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2699);
    float _2713 = fma(_2619, _2703, _785);
    int _2715 = _2657 >> 31;
    float _2717 = -_2693;
    float _2719 = -_837;
    float _2721 = fma(_2717, _2709, _2719);
    int _2723 = ~_595;
    int _2725 = _2723 + 1;
    float _2727 = abs(_1039);
    float _2729 = log2(_2727);
    int _2731 = _2715 & 3;
    float _2733 = -_2439;
    float _2735 = fma(_2637, _2733, _2667);
    float _2737 = fma(_2697, _2463, _2721);
    int _2739 = _2725 * int(_2687);
    int _2741 = _2739 + _2483;
    int _2743 = _2657 + _2731;
    float _2745 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2747 = _2657 & 3;
    bool _2749 = _2747 != 0;
    float _2751 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2753 = _2743 >> 2;
    float _2755 = -_1073;
    float _2757 = fma(_2755, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2745);
    float _2759 = float(uint(_2741));
    float _2761 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2763 = _2753 << 4;
    int _2765 = _2763 + 368;
    float _2767 = -_2459;
    float _2769 = fma(_2691, _2767, _2713);
    bool _2771 = uint(_2747) > 1u;
    float _2773 = as_type<float>(_1881) * _2759;
    uint _2775 = uint(int(uint(_2765) >> uint(2)));
    uint _2777 = uint(int(uint(int(_2775)) >> uint(2)));
    int _2779 = int(_2775) & 3;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[int(_2777)][_2779];
    int _2783 = int(_2775) + 1;
    uint _2785 = uint(int(uint(_2783) >> uint(2)));
    int _2787 = _2783 & 3;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[int(_2785)][_2787];
    float _2791 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_76.x = _2735;
    out.m_76.y = _2701;
    out.m_76.z = _2769;
    out.m_76.w = _2737;
    float _2793 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2795 = _1083 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2797 = trunc(_2773);
    float _2799 = precise::max(_2797, 0.0);
    uint _2801 = uint(_2799);
    float _2803 = _2711 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2805 = -_1073;
    float _2807 = fma(_2805, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2795);
    int _2809 = ~_595;
    int _2811 = _2809 + 1;
    int _2813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2815 = _2813 != 0;
    out.m_78.w = _2803;
    float _2817 = exp2(_2791);
    bool _2819 = _1039 <= 8000.0;
    bool _2821 = isnan(_1039);
    bool _2823 = _2819 || _2821;
    bool _2825 = isnan(8000.0);
    bool _2827 = _2823 || _2825;
    float _2829 = float(_2827);
    int _2831 = _2765 + 8;
    uint _2833 = uint(int(uint(_2831) >> uint(2)));
    uint _2835 = uint(int(uint(int(_2833)) >> uint(2)));
    int _2837 = int(_2833) & 3;
    float _2839 = (*spvDescriptorSet0.vp_c9)._m0[int(_2835)][_2837];
    int _2841 = int(_2833) + 1;
    uint _2843 = uint(int(uint(_2841) >> uint(2)));
    int _2845 = _2841 & 3;
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[int(_2843)][_2845];
    float _2849 = -_1073;
    float _2851 = fma(_2849, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2793);
    int _2853 = _2707 ? 0 : 1;
    float _2855 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2857 = int(_2687) + int(_2801);
    float _2859 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2851);
    float _2861 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2757);
    float _2863 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2807);
    float _2865 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2855);
    int _2867 = _2811 * _2857;
    int _2869 = _2867 + _2483;
    float _2871 = _2751 * _2861;
    float _2873 = fma(_2817, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2875 = precise::clamp(_2873, 0.0, 1.0);
    int _2877 = ~_2853;
    int _2879 = _2877 + 1;
    int _2881 = _2879 + 1;
    float _2883 = _1091 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2885 = _2881;
    if (!_2771)
    {
        int _2887 = ~_2853;
        int _2889 = _2887 + 1;
        _2885 = _2889;
    }
    int _2891 = _2885;
    float _2893 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2761);
    bool _2895 = !_2749;
    int _2897 = _2895 ? 0 : 1;
    float _2899 = fma(_1081, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2883);
    int _2901 = abs(_2891);
    bool _2903 = _2747 != 3;
    bool _2905 = uint(_2869) >= uint(_595);
    int _2907 = abs(_2897);
    bool _2909 = uint(_2747) >= 2u;
    bool _2911 = !_2905;
    int _2913 = _2911 ? 0 : (-1);
    int _2915 = ~_2901;
    int _2917 = _2915 + 1;
    int _2919 = _2917 + 1;
    int _2921 = _2909 ? 0 : 1;
    int _2923 = ~_2857;
    int _2925 = _2923 + _2913;
    int _2927 = _2925 + 1;
    int _2929 = _2919 * as_type<int>(_2789);
    int _2931 = ~_2907;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    float _2937 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2939 = ~_2921;
    int _2941 = _2939 + 1;
    int _2943 = _2941 + 1;
    int _2945 = _595 * _2927;
    int _2947 = _2945 + _2483;
    bool _2949 = _2747 != 3;
    int _2951 = _2935 * as_type<int>(_2781);
    int _2953 = _2951 + _2929;
    int _2955 = _2943;
    if (_2903)
    {
        int _2957 = ~_2921;
        int _2959 = _2957 + 1;
        _2955 = _2959;
    }
    int _2961 = _2955;
    float _2963 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2965 = !_2815;
    int _2967 = _2965 ? 0 : 1;
    float _2969 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2937);
    bool _2971 = !_2949;
    int _2973 = _2971 ? 0 : (-1);
    float _2975 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2963);
    int _2977 = abs(_2961);
    float _2979 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2893);
    int _2981 = abs(_2967);
    float _2983 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2975);
    int _2985 = abs(_2973);
    float _2987 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2989 = fma(_1085, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2987);
    int _2991 = ~_2977;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    int _2997 = ~_2985;
    int _2999 = _2997 + 1;
    int _3001 = _2999 + 1;
    float _3003 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2989);
    int _3005 = _2995 * as_type<int>(_2839);
    int _3007 = _3005 + _2953;
    float _3009 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3011 = _2751 * _2863;
    float _3013 = fma(_1093, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2969);
    int _3015 = _3001 * as_type<int>(_2847);
    int _3017 = _3015 + _3007;
    float _3019 = _2751 * _2859;
    float _3021 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2865);
    float _3023 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3025 = ~_2981;
    int _3027 = _3025 + 1;
    int _3029 = _3027 + 1;
    float _3031 = fma(_1103, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2899);
    float _3033 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3009);
    float _3035 = fma(_3023, _3021, _3019);
    float _3037 = fma(_3023, _2979, _2871);
    float _3039 = fma(_3023, _3031, _3011);
    int _3041 = _3017 * _3029;
    bool _3043 = !_2333;
    int _3045 = _3043 ? _2947 : (-1);
    float _3047 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3033);
    float _3049 = _3013 + _3039;
    float _3051 = fma(_2875, -2.0, 3.0);
    float _3053 = _2875 * _2875;
    int _3055 = _3045 * _2981;
    int _3057 = _3055 + _3041;
    float _3059 = fma(_1772, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3047);
    float _3061 = _1780 * 0.5;
    float _3063 = _3053 * _3051;
    float _3065 = _3059 + _1780;
    float _3067 = float(_3057);
    float _3069 = _1804 + _1780;
    out.gl_Position.x = _1804;
    out.gl_Position.y = _1806;
    out.gl_Position.z = _3059;
    out.gl_Position.w = _1780;
    float _3071 = _3065 * 0.5;
    float _3073 = fma(_1806, -0.5, _3061);
    float _3075 = _3069 * 0.5;
    float _3077 = _2983 + _3035;
    float _3079 = _3003 + _3037;
    out.m_80.x = _3067;
    out.m_82.x = _3075;
    out.m_82.y = _3073;
    out.m_82.z = _3071;
    out.m_82.w = _1780;
    float _3081 = -_3063;
    float _3083 = _3081 + 1.0;
    out.m_84.x = _3077;
    out.m_84.y = _3079;
    out.m_84.z = _3049;
    float _3085 = fma(_3083, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3063);
    float _3087 = _2829 * _3085;
    float _3089 = -_2487;
    float _3091 = _3089 + 1.0;
    float _3093 = _3073;
    float _3095 = _3071;
    if (!_1754)
    {
        _3093 = 1.0;
    }
    float _3097 = _3093;
    float _3099 = _3087 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3101 = _3097;
    if (_1754)
    {
        bool _3103 = _1856 >= _1830;
        bool _3105 = isnan(_1856);
        bool _3107 = _3103 || _3105;
        bool _3109 = isnan(_1830);
        bool _3111 = _3107 || _3109;
        float _3113 = float(_3111);
        _3101 = _3113;
    }
    float _3115 = _3101;
    float _3117 = _3091 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3119 = _2199 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3121 = isnan(_2199);
    bool _3123 = _3119 || _3121;
    bool _3125 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3127 = _3123 || _3125;
    float _3129 = _2475 * _3099;
    float _3131 = precise::clamp(_3129, 0.0, 1.0);
    float _3133 = _3117 * _1858;
    float _3135 = _3115 * _2165;
    float _3137 = -_3131;
    float _3139 = fma(_3137, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3141 = -_3117;
    float _3143 = _3141 + 1.0;
    float _3145 = _1869 * _3133;
    float _3147 = _2423 * _3133;
    float _3149 = -_3135;
    float _3151 = fma(_3149, _3139, 1.0);
    float _3153 = precise::clamp(_3151, 0.0, 1.0);
    float _3155 = _1869 * _3143;
    float _3157 = fma(_2419, _3145, _1863);
    float _3159 = fma(_2421, _3145, _1865);
    float _3161 = _3153 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3163 = fma(_1869, _3147, _1867);
    float _3165 = _2041 * _2101;
    float _3167 = _3153;
    float _3169 = _3165;
    if (!_3127)
    {
        _3095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3171 = _3095;
    out.m_86.x = _3161;
    float _3173 = _3165 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3175 = _3171;
    float _3177 = _3171;
    if (!_3127)
    {
        _3167 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3179 = _3167;
    out.m_88.x = _3157;
    out.m_88.y = _3159;
    out.m_88.z = _3163;
    out.m_88.w = _3155;
    float _3181 = _3179;
    float _3183 = _3179;
    if (!_3127)
    {
        _3169 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3185 = _3169;
    bool _3187 = !_3127;
    float _3189 = _3185;
    float _3191 = _3185;
    if (!_3187)
    {
        bool _3193 = _2199 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3195 = isnan(_2199);
        bool _3197 = _3193 || _3195;
        bool _3199 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3201 = _3197 || _3199;
        if (!_3201)
        {
            float _3203 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3205 = _2199 + _3203;
            float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3209 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3207;
            float _3211 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3213 = _3211 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3215 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3217 = _3215 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3219 = 1.0 / _3209;
            float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3223 = _3221 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3225 = _3205 * _3219;
            float _3227 = precise::clamp(_3225, 0.0, 1.0);
            float _3229 = fma(_3227, _3213, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3231 = fma(_3227, _3217, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3233 = fma(_3227, _3223, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3183 = _3231;
            _3177 = _3229;
            _3191 = _3233;
            _3235 = true;
        }
        else
        {
            bool _3237 = _2199 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3239 = isnan(_2199);
            bool _3241 = _3237 || _3239;
            bool _3243 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3245 = _3241 || _3243;
            if (!_3245)
            {
                _3175 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3247 = _3175;
            _3177 = _3247;
            if (!_3245)
            {
                _3181 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3249 = _3181;
            _3183 = _3249;
            if (!_3245)
            {
                _3189 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3251 = _3189;
            bool _3253 = !_3245;
            _3191 = _3251;
            if (!_3253)
            {
                bool _3255 = _2199 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3257 = isnan(_2199);
                bool _3259 = _3255 || _3257;
                bool _3261 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3263 = _3259 || _3261;
                if (!_3263)
                {
                    float _3265 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3267 = _2199 + _3265;
                    float _3269 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3271 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3269;
                    float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3275 = _3273 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3277 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3279 = _3277 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3281 = 1.0 / _3271;
                    float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3287 = _3267 * _3281;
                    float _3289 = precise::clamp(_3287, 0.0, 1.0);
                    float _3291 = fma(_3289, _3275, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3293 = fma(_3289, _3279, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3295 = fma(_3289, _3285, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3183 = _3293;
                    _3177 = _3291;
                    _3191 = _3295;
                    _3235 = true;
                }
                else
                {
                    _3183 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3177 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3191 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3235 = false;
    float _3297 = _3183;
    float _3299 = _3177;
    float _3301 = _3191;
    float _3303 = _3173 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_90.x = 0.0;
    float _3305 = _3297 * 0.586610972881317138671875;
    bool _3307 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_59.x = _3303;
    float _3309 = fma(_3299, 0.298911988735198974609375, _3305);
    bool _3311 = _2041 > 0.0;
    bool _3313 = isnan(_2041);
    bool _3315 = _3311 || _3313;
    bool _3317 = isnan(0.0);
    bool _3319 = _3315 || _3317;
    float _3321 = fma(_3301, 0.114477999508380889892578125, _3309);
    bool _3323 = _2101 <= 0.0;
    bool _3325 = !_3319;
    bool _3327 = _3323 || _3325;
    float _3329 = -_3321;
    float _3331 = _3329 + _3299;
    float _3333 = -_3321;
    float _3335 = _3333 + _3297;
    float _3337 = -_3321;
    float _3339 = _3337 + _3301;
    float _3341 = fma(_3331, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3321);
    float _3343 = fma(_3335, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3321);
    float _3345 = fma(_3339, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3321);
    bool _3347 = !_3307;
    if (!_3347)
    {
        float _3349 = -_1684;
        float _3351 = _3349 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3353 = -_1686;
        float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3357 = -_1688;
        float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3361 = _3351 * _3351;
        float _3363 = fma(_3355, _3355, _3361);
        float _3365 = fma(_3359, _3359, _3363);
        float _3367 = sqrt(_3365);
        float _3369 = rsqrt(_3365);
        float _3371 = -_3367;
        float _3373 = _3371 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3375 = _3373 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3377 = precise::clamp(_3375, 0.0, 1.0);
        float _3379 = _3355 * _3369;
        float _3381 = _3351 * _3369;
        float _3383 = abs(_3377);
        float _3385 = log2(_3383);
        float _3387 = _3359 * _3369;
        float _3389 = _3379 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3391 = _3079 * _3381;
        float _3393 = -_3381;
        float _3395 = -_3389;
        float _3397 = fma(_3393, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3395);
        float _3399 = fma(_3077, _3379, _3391);
        float _3401 = -_3387;
        float _3403 = fma(_3401, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3397);
        float _3405 = fma(_3049, _3387, _3399);
        float _3407 = precise::clamp(_3405, 0.0, 1.0);
        float _3409 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3411 = _3403 + _3409;
        float _3413 = _3385 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3415 = _3411 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3417 = precise::clamp(_3415, 0.0, 1.0);
        float _3419 = exp2(_3413);
        float _3421 = _3419 * _3417;
        float _3423 = _3407 * _3421;
        float _3425 = _3423 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3427 = _3423 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3429 = _3423 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3425;
        out.m_90.y = _3427;
        out.m_90.z = _3429;
    }
    out.m_92.x = _3341;
    out.m_92.y = _3343;
    out.m_92.z = _3345;
    if (!_3327)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _3431 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3431;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

