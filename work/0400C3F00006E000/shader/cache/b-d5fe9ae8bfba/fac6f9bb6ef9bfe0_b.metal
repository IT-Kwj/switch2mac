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
    float4 m_94 [[user(locn2)]];
    float4 m_104 [[user(locn3)]];
    float4 m_112 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_98 [[user(locn12)]];
    float4 m_100 [[user(locn13)]];
    float4 m_96 [[user(locn14)]];
    float4 m_110 [[user(locn15)]];
    float4 m_102 [[user(locn16)]];
    float4 m_106 [[user(locn17)]];
    float4 m_108 [[user(locn18)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_88 [[attribute(1)]];
    float4 m_70 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_72 [[attribute(5)]];
    float4 m_74 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_112 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    bool _7281 = false;
    bool _5904 = false;
    bool _1141 = false;
    bool _821 = false;
    bool _641 = false;
    bool _453 = false;
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _126 = in.m_60.w;
    float _128 = trunc(_126);
    int _131 = int(_128);
    bool _135 = _131 >= 1;
    float _137 = 0.0;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    float _141 = _139;
    if (!_135)
    {
        out.m_63.x = 0.0;
    }
    int _143 = 0;
    if (!_135)
    {
        float _145 = _139 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    int _149 = _147;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7580 = as_type<float>(_147);
        out.gl_Position.z = _7580;
    }
    if (!_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_65.w;
    bool _153 = _151 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_151);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = -_151;
    float _165 = _163 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _167 = _165;
    if (_161)
    {
        float _169 = float(_131);
        _141 = _169;
    }
    float _171 = _141;
    bool _173 = _165 >= _171;
    bool _175 = !_161;
    bool _177 = _173 || _175;
    float _179 = _171;
    if (_177)
    {
        _179 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _181 = _179;
    if (_177)
    {
        out.m_63.x = 0.0;
    }
    if (_177)
    {
        float _183 = _181 * 5.0;
        _149 = as_type<int>(_183);
    }
    int _185 = _149;
    if (_177)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7650 = as_type<float>(_185);
        out.gl_Position.z = _7650;
    }
    if (_177)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_70.x;
    float _191 = in.m_70.y;
    float _193 = in.m_70.z;
    int _195 = as_type<int>(_187) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_187) & 2;
    bool _201 = _199 != 0;
    bool _203 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _205 = _191 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _207 = _191 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _209 = _191 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _211 = !_197;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[4].x, _205);
    float _217 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[5].x, _207);
    float _219 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[6].x, _209);
    bool _221 = !_201;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[4].z, _215);
    float _227 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[5].z, _217);
    float _229 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[6].z, _219);
    bool _231 = !_203;
    bool _233 = false;
    bool _235 = false;
    int _237 = as_type<int>(_225);
    int _239 = as_type<int>(_227);
    float _257;
    if (!_231)
    {
        float _241 = in.m_72.x;
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _241 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _165);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_131);
        float _263 = 1.0 / _261;
        float _265 = _165 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _267 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = _267 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _267 + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    bool _293 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _295 = isnan(_267);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = 1.0 / _283;
    bool _307 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _309 = 1.0 / _291;
    float _311 = 1.0 / _287;
    float _313 = _271 * _305;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -_303;
    float _329 = _327 + 1.0;
    float _331 = _325 * _329;
    float _333 = _275 * _309;
    bool _335 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _337 = isnan(_267);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -_325;
    float _349 = _347 + 1.0;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = _345 * _349;
    float _357 = -_345;
    float _359 = _357 + 1.0;
    float _361 = _279 * _311;
    bool _363 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _365 = isnan(_267);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = fma(_353, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = fma(_377, _313, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = _373 * _359;
    float _393 = fma(_383, _313, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _395 = fma(_387, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = -_373;
    float _399 = _397 + 1.0;
    float _401 = _389 * _391;
    float _403 = _393 * _391;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _405;
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].y, _403);
    float _417 = fma(_407, _333, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _419 = fma(_379, _355, _409);
    float _421 = fma(_413, _333, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_395, _355, _415);
    float _425 = fma(_417, _331, _419);
    float _427 = fma(_421, _331, _423);
    float _429 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].x, _425);
    float _431 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].y, _427);
    bool _433 = !_307;
    float _451;
    if (!_433)
    {
        float _435 = in.m_72.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _165);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_131);
        float _457 = 1.0 / _455;
        float _459 = _165 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _465 = _461 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _475 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _477 = isnan(_461);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _491 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _493 = isnan(_461);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = 1.0 / _469;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _505;
    float _509 = -_485;
    float _511 = _509 + 1.0;
    bool _513 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _515 = isnan(_461);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _527 = 1.0 / _473;
    float _529 = 1.0 / _489;
    float _531 = _507 * _503;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _537 = _501 * _511;
    float _539 = -_501;
    float _541 = _539 + 1.0;
    float _543 = fma(_531, _465, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _545;
    float _549 = _523 * _541;
    float _551 = _535 * _527;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _555 = _461 + _553;
    bool _557 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _559 = isnan(_461);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = _543 * _549;
    float _571 = -_523;
    float _573 = _571 + 1.0;
    float _575 = fma(_551, _555, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _579 = _461 + _577;
    float _581 = _547 * _529;
    float _583 = -_567;
    float _585 = _583 + 1.0;
    float _587 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[115].x, _569);
    float _589 = fma(_581, _579, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _591 = _485 * _585;
    float _593 = fma(_575, _537, _587);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _597 = fma(_589, _591, _593);
    float _599 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[118].x, _597);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _605 = in.m_74.x;
    float _607 = in.m_74.y;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _611 = _601 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _613 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _615 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_76.x = _599;
    out.m_76.y = _613;
    out.m_76.z = _615;
    out.m_76.w = _611;
    float _617 = _431 * _607;
    float _619 = _429 * _605;
    bool _621 = !_525;
    float _639;
    if (!_621)
    {
        float _623 = in.m_72.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[11].w, _165);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_131);
        float _645 = 1.0 / _643;
        float _647 = _165 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _659 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _661 = isnan(_649);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = 1.0 / _653;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _677 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _679 = isnan(_649);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _689;
    float _693 = -_669;
    float _695 = _693 + 1.0;
    bool _697 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _699 = isnan(_649);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    bool _709 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _711 = 1.0 / _657;
    float _713 = _687 * _695;
    float _715 = -_687;
    float _717 = _715 + 1.0;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _723 = _707 * _717;
    float _725 = -_707;
    float _727 = _725 + 1.0;
    float _729 = 1.0 / _675;
    float _731 = _691 * _671;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _735 = _649 + _733;
    float _737 = fma(_731, _735, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _741 = _649 + _739;
    float _743 = _721 * _711;
    bool _745 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _747 = isnan(_649);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _757;
    float _761 = _737 * _723;
    float _763 = fma(_743, _741, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _767 = _649 + _765;
    float _769 = -_755;
    float _771 = _769 + 1.0;
    float _773 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[131].x, _761);
    float _775 = _759 * _729;
    float _777 = _669 * _771;
    float _779 = fma(_763, _713, _773);
    float _781 = fma(_775, _767, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _783 = fma(_781, _777, _779);
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _791 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[134].x, _783);
    float _793 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _795 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _797 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _791 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _793;
    out.m_78.y = _795;
    out.m_78.z = _797;
    out.m_78.w = _799;
    bool _801 = !_709;
    float _819;
    if (!_801)
    {
        float _803 = in.m_72.x;
        float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _807 = _803 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[14].x, _165);
        float _811 = _809 * _805;
        float _813 = floor(_811);
        float _815 = -_813;
        float _817 = _811 + _815;
        _819 = _817;
        _821 = true;
    }
    else
    {
        float _823 = float(_131);
        float _825 = 1.0 / _823;
        float _827 = _165 * _825;
        _819 = _827;
    }
    _821 = false;
    float _829 = _819;
    bool _831 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _833 = isnan(_829);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    bool _843 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _845 = isnan(_829);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _859 = -_841;
    float _861 = _859 + 1.0;
    bool _863 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _865 = isnan(_829);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = 1.0 / _857;
    float _877 = -_853;
    float _879 = _877 + 1.0;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _881;
    float _885 = _853 * _861;
    bool _887 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _889 = isnan(_829);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = _873 * _879;
    float _901 = -_873;
    float _903 = _901 + 1.0;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _909 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _911 = isnan(_829);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = -_897;
    float _923 = _921 + 1.0;
    float _925 = _897 * _903;
    float _927 = 1.0 / _907;
    bool _929 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _931 = isnan(_829);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = _883 * _875;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _945 = _829 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _951 = fma(_941, _945, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _957 = -_919;
    float _959 = _957 + 1.0;
    float _961 = _919 * _923;
    bool _963 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _965 = isnan(_829);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = 1.0 / _949;
    float _977 = _939 * _959;
    float _979 = -_939;
    float _981 = _979 + 1.0;
    float _983 = _973 * _981;
    float _985 = -_973;
    float _987 = _985 + 1.0;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _997 = _951 * _983;
    float _999 = 1.0 / _955;
    float _1001 = _995 * _927;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1011 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[159].x, _997);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1017 = _1005 * _975;
    float _1019 = 1.0 / _1009;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1023 = _829 + _1021;
    bool _1025 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1027 = fma(_1001, _1023, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1031 = _829 + _1029;
    float _1033 = 1.0 / _991;
    float _1035 = fma(_1027, _977, _1011);
    float _1037 = fma(_1017, _1031, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1049 = _829 + _1047;
    float _1051 = fma(_1037, _961, _1035);
    float _1053 = 1.0 / _1015;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1057 = _1055 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1059 = _1041 * _1019;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1063 = _829 + _1061;
    float _1065 = _1057 * _999;
    float _1067 = _1045 * _1033;
    float _1069 = fma(_1065, _1049, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1071 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1073 = isnan(_829);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1083;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1089 = _829 + _1087;
    float _1091 = fma(_1067, _1063, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1093 = fma(_1069, _925, _1051);
    float _1095 = -_1081;
    float _1097 = _1095 + 1.0;
    float _1099 = _1085 * _1053;
    float _1101 = fma(_1059, _1089, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1105 = _829 + _1103;
    float _1107 = fma(_1091, _899, _1093);
    float _1109 = _841 * _1097;
    float _1111 = fma(_1099, _1105, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1113 = fma(_1101, _885, _1107);
    float _1115 = fma(_1111, _1109, _1113);
    float _1117 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1115);
    out.m_80.x = _1117;
    bool _1119 = !_1025;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1139;
    if (!_1119)
    {
        float _1123 = in.m_72.x;
        float _1125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1127 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1129 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[14].y, _165);
        float _1131 = _1129 * _1125;
        float _1133 = floor(_1131);
        float _1135 = -_1133;
        float _1137 = _1131 + _1135;
        _1139 = _1137;
        _1141 = true;
    }
    else
    {
        float _1143 = float(_131);
        float _1145 = 1.0 / _1143;
        float _1147 = _165 * _1145;
        _1139 = _1147;
    }
    _1141 = false;
    float _1149 = _1139;
    float _1151 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1153 = int(_1151);
    float _1155 = in.m_72.w;
    float _1157 = float(_131);
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1161 = _1159 != 0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1165 = _1163 != 0;
    float _1167 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1169 = int(_1167);
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1173 = _1171 != 0;
    float _1175 = float(_1153);
    float _1177 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1179 = int(_1177);
    float _1181 = as_type<float>(_131);
    if (_1161)
    {
        float _1183 = in.m_72.w;
        _1181 = _1183;
    }
    float _1185 = _1181;
    if (!_1161)
    {
        _1121 = _213;
    }
    float _1187 = _1121;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1191 = _1187;
    if (_1173)
    {
        float _1193 = in.m_72.w;
        _1189 = _1193;
    }
    float _1195 = _1189;
    float _1197 = float(uint(_1169));
    float _1199 = 1.0 / _1175;
    bool _1201 = _1155 > 0.5;
    int _1203 = ~_1169;
    int _1205 = _1203 + 1;
    float _1207 = float(_1169);
    float _1209 = 1.0 / _1197;
    float _1211 = float(_1179);
    float _1213 = _1199 * _165;
    float _1215 = _1197;
    bool _1217 = _1201;
    if (_1165)
    {
        float _1219 = in.m_72.z;
        _1215 = _1219;
    }
    float _1221 = _1215;
    float _1223 = 1.0 / _1211;
    float _1225 = _1185;
    if (_1161)
    {
        float _1227 = _1185 * 3.1415927410125732421875;
        _1225 = _1227;
    }
    float _1229 = _1225;
    float _1231 = _1195;
    float _1233 = _1229;
    if (_1173)
    {
        float _1235 = _1195 * 3.1415927410125732421875;
        _1231 = _1235;
    }
    float _1237 = _1231;
    int _1239 = as_type<int>(_1209) + (-2);
    float _1241 = _1237;
    if (_1173)
    {
        float _1243 = _1237 * 0.15915493667125701904296875;
        _1241 = _1243;
    }
    float _1245 = _1241;
    float _1247 = trunc(_1213);
    int _1249 = int(_1247);
    int _1251 = ~_1169;
    int _1253 = _1251 + 1;
    float _1255 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1257 = int(_1255);
    float _1259 = _1223 * _165;
    float _1261 = _1223;
    if (_1161)
    {
        float _1263 = _1229 * 0.15915493667125701904296875;
        _1261 = _1263;
    }
    float _1265 = _1261;
    if (_1165)
    {
        float _1267 = _1221 * 3.1415927410125732421875;
        _1233 = _1267;
    }
    float _1269 = _1233;
    float _1271 = float(uint(_1249));
    float _1273 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1275 = int(_1273);
    float _1277 = as_type<float>(_1239) * _1271;
    float _1279 = float(uint(_1257));
    float _1281 = trunc(_1277);
    float _1283 = precise::max(_1281, 0.0);
    uint _1286 = uint(_1283);
    float _1288 = 1.0 / _1279;
    float _1290 = float(_1275);
    float _1292 = trunc(_1259);
    int _1294 = int(_1292);
    float _1296 = _1279;
    if (_1165)
    {
        float _1298 = _1269 * 0.15915493667125701904296875;
        _1296 = _1298;
    }
    float _1300 = _1296;
    int _1302 = _1253 * int(_1286);
    int _1304 = _1302 + _1249;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1308 = _1306 != 0;
    float _1310 = _1300;
    float _1312 = as_type<float>(_1286);
    if (_1165)
    {
        float _1314 = _1300 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        _1310 = _1316;
    }
    float _1318 = _1310;
    float _1320 = float(uint(_1304));
    int _1322 = as_type<int>(_1288) + (-2);
    float _1324 = as_type<float>(_1239) * _1320;
    float _1326 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1328 = int(_1326);
    float _1330 = float(uint(_1294));
    float _1332 = 0.0;
    if (_1308)
    {
        _1332 = 1.0;
    }
    float _1334 = _1332;
    int _1336 = 0;
    float _1338 = _1334;
    if (_1308)
    {
        _1336 = 0;
    }
    int _1340 = _1336;
    float _1342 = as_type<float>(_1322) * _1330;
    float _1344 = _1221;
    int _1346 = as_type<int>(_1342);
    int _1348 = _1340;
    if (_1161)
    {
        float _1350 = _1265 * 6.283185482025146484375;
        float _1352 = sin(_1350);
        _1344 = _1352;
    }
    float _1354 = _1344;
    if (_1165)
    {
        bool _1356 = _1318 > 0.5;
        _233 = _1356;
    }
    bool _1358 = _233;
    float _1360 = trunc(_1324);
    float _1362 = precise::max(_1360, 0.0);
    uint _1364 = uint(_1362);
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1368 = _1265;
    float _1370 = as_type<float>(_1304);
    if (_1308)
    {
        float _1372 = in.m_72.x;
        float _1374 = in.m_72.y;
        float _1376 = in.m_72.z;
        _1366 = _1372;
        _1368 = _1374;
        _1370 = _1376;
    }
    float _1378 = _1366;
    float _1380 = _1368;
    float _1382 = _1370;
    float _1384 = float(uint(_1328));
    float _1386 = 0.0;
    if (_1173)
    {
        float _1388 = _1245 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        _1386 = _1390;
    }
    float _1392 = _1386;
    float _1394 = _1392;
    if (_1161)
    {
        bool _1396 = _1354 > 0.5;
        _235 = _1396;
    }
    bool _1398 = _235;
    int _1400 = int(_1201);
    int _1402 = _1173 ? 2 : 0;
    int _1404 = _1400 | _1402;
    int _1406 = _1161 ? 4 : 0;
    int _1408 = _1404 | _1406;
    int _1410 = _1165 ? 8 : 0;
    int _1412 = _1408 | _1410;
    int _1414 = _1398 ? 16 : 0;
    int _1416 = _1412 | _1414;
    int _1418 = _1358 ? 32 : 0;
    int _1420 = _1416 | _1418;
    int _1422 = _1308 ? 64 : 0;
    int _1424 = _1420 | _1422;
    int _1426 = _1424 & 1;
    float _1428 = as_type<float>(_1426);
    if (_1308)
    {
        _1428 = 1.0;
    }
    float _1430 = _1428;
    float _1432 = trunc(_1342);
    float _1434 = precise::max(_1432, 0.0);
    uint _1436 = uint(_1434);
    int _1438 = int(_1286) + int(_1364);
    int _1440 = ~_1257;
    int _1442 = _1440 + 1;
    float _1444 = as_type<float>(_1364);
    float _1446 = _1430;
    if (_1308)
    {
        _1444 = 1.0;
    }
    float _1448 = _1444;
    float _1450 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1452 = int(_1450);
    float _1454 = _1448;
    float _1456 = _1378;
    float _1458 = _1380;
    float _1460 = _1382;
    if (_1308)
    {
        _1312 = _1378;
    }
    float _1462 = _1312;
    float _1464 = _1462;
    if (_1308)
    {
        _1346 = 0;
    }
    int _1466 = _1346;
    float _1468 = 0.0;
    int _1470 = _1466;
    if (_1308)
    {
        _1468 = _1462;
    }
    float _1472 = _1468;
    float _1474 = 0.0;
    float _1476 = _1472;
    if (_1308)
    {
        _1474 = _1462;
    }
    float _1478 = _1474;
    float _1480 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1482 = int(_1480);
    float _1484 = 0.0;
    float _1486 = _1478;
    if (_1308)
    {
        _1484 = _1380;
    }
    float _1488 = _1484;
    int _1490 = _1442 * int(_1436);
    int _1492 = _1490 + _1294;
    int _1494 = 0;
    float _1496 = _1488;
    if (_1308)
    {
        _1494 = as_type<int>(_1382);
    }
    int _1498 = _1494;
    int _1500 = _1498;
    if (_1173)
    {
        bool _1502 = _1392 > 0.5;
        _1217 = _1502;
    }
    bool _1504 = _1217;
    float _1506 = 1.0 / _1157;
    float _1508 = 1.0 / _1290;
    float _1510 = 1.0 / _1384;
    if (!_1308)
    {
        float _1512 = in.m_72.x;
        float _1514 = in.m_72.y;
        float _1516 = in.m_72.z;
        float _1518 = _1512 * 3.1415927410125732421875;
        float _1520 = _1518 * 0.15915493667125701904296875;
        float _1522 = _1514 * 3.1415927410125732421875;
        float _1524 = _1522 * 0.15915493667125701904296875;
        float _1526 = _1516 * 3.1415927410125732421875;
        float _1528 = _1520 * 6.283185482025146484375;
        float _1530 = sin(_1528);
        float _1532 = _1526 * 0.15915493667125701904296875;
        float _1534 = _1524 * 6.283185482025146484375;
        float _1536 = sin(_1534);
        float _1538 = _1532 * 6.283185482025146484375;
        float _1540 = sin(_1538);
        _1454 = 7.345489978790283203125;
        _1456 = _1512;
        _1458 = _1514;
        _1460 = _1516;
        _1338 = 1.2345600128173828125;
        _1464 = _1514;
        _1446 = 5.839270114898681640625;
        _1476 = _1516;
        _1470 = 1;
        _1348 = 2;
        _1486 = _1530;
        _1496 = _1536;
        _1500 = as_type<int>(_1540);
    }
    float _1542 = _1454;
    float _1544 = _1456;
    float _1546 = _1458;
    float _1548 = _1460;
    float _1550 = _1338;
    float _1552 = _1464;
    float _1554 = _1446;
    float _1556 = _1476;
    int _1558 = _1470;
    int _1560 = _1348;
    float _1562 = _1486;
    float _1564 = _1496;
    int _1566 = _1500;
    float _1568 = _1542 * _1544;
    float _1570 = float(uint(_1492));
    int _1572 = _1205 * _1438;
    int _1574 = _1572 + _1249;
    float _1576 = float(_1249);
    float _1578 = floor(_1568);
    bool _1580 = _1546 > 0.5;
    float _1582 = as_type<float>(_1322) * _1570;
    if (!_1165)
    {
        _1394 = _213;
    }
    float _1584 = _1394;
    float _1586 = _1506 * _165;
    float _1588 = _1584;
    if (_1161)
    {
        float _1590 = -_213;
        float _1592 = _1398 ? _1590 : _213;
        _1191 = _1592;
    }
    float _1594 = _1191;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1598 = _1149 + _1596;
    if (_1165)
    {
        float _1600 = -_213;
        float _1602 = _1358 ? _1600 : _213;
        _1588 = _1602;
    }
    float _1604 = _1588;
    float _1606 = trunc(_1582);
    float _1608 = precise::max(_1606, 0.0);
    uint _1610 = uint(_1608);
    float _1612 = 0.0;
    if (!_1173)
    {
        _1612 = _223;
    }
    float _1614 = _1612;
    float _1616 = _1544 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1624 = _1622 != 0;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1628 = _1626 != 0;
    float _1630 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1632 = _1576 >= _1207;
    bool _1634 = isnan(_1576);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(_1207);
    bool _1640 = _1636 || _1638;
    float _1642 = float(_1640);
    float _1644 = _1614;
    if (_1173)
    {
        float _1646 = -_223;
        float _1648 = _1504 ? _1646 : _223;
        _1644 = _1648;
    }
    float _1650 = _1644;
    float _1652 = -_1578;
    float _1654 = _1568 + _1652;
    bool _1656 = _1548 > 0.5;
    float _1658 = trunc(_1642);
    int _1660 = int(_1658);
    bool _1662 = uint(_1574) >= uint(_1169);
    float _1664 = _1550 * _1552;
    float _1666 = -_213;
    int _1668 = _1580 ? as_type<int>(_1666) : as_type<int>(_213);
    float _1670 = -_223;
    int _1672 = _1656 ? as_type<int>(_1670) : as_type<int>(_223);
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1676 = _1674 != 0;
    float _1678 = floor(_1664);
    float _1680 = _1654 * _1207;
    bool _1682 = !_1662;
    int _1684 = _1682 ? 0 : (-1);
    float _1686 = _1207 * _1586;
    bool _1688 = !_1624;
    float _1690 = _1688 ? _213 : as_type<float>(_1668);
    bool _1692 = !_1628;
    float _1694 = _1692 ? _223 : as_type<float>(_1672);
    float _1696 = trunc(_1680);
    int _1698 = int(_1696);
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1702 = _1700 != 0;
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1706 = _1704 != 0;
    int _1708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1710 = _1708 != 0;
    int _1712 = ~_1438;
    int _1714 = _1712 + _1684;
    int _1716 = _1714 + 1;
    float _1718 = float(_1482);
    bool _1720 = !_1706;
    int _1722 = _1720 ? 0 : 1;
    int _1724 = _1169 * _1716;
    int _1726 = _1724 + _1249;
    bool _1728 = _1169 == 0;
    float _1730 = 1.0 / _1718;
    int _1732 = ~_1660;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    float _1738 = -_1678;
    float _1740 = _1664 + _1738;
    bool _1742 = !_1728;
    int _1744 = _1742 ? _1726 : (-1);
    int _1746 = int(_1436) + int(_1610);
    int _1748 = ~_1257;
    int _1750 = _1748 + 1;
    int _1752 = _1744 * _1736;
    int _1754 = _1169 + (-1);
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1758 = _1756 != 0;
    int _1760 = _1750 * _1746;
    int _1762 = _1760 + _1294;
    bool _1764 = _1155 > 0.5;
    int _1766 = _1660 * _1754;
    int _1768 = _1766 + _1752;
    bool _1770 = !_1676;
    int _1772 = _1770 ? 0 : 1;
    float _1774 = trunc(_1686);
    int _1776 = int(_1774);
    bool _1778 = !_1758;
    int _1780 = _1778 ? 0 : 1;
    float _1782 = -_223;
    int _1784 = _1764 ? as_type<int>(_1782) : as_type<int>(_223);
    bool _1786 = uint(_1762) >= uint(_1257);
    int _1788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1790 = _1788 != 0;
    int _1792 = abs(_1722);
    bool _1794 = !_1702;
    int _1796 = _1794 ? 0 : 1;
    bool _1798 = !_1710;
    int _1800 = _1798 ? 0 : 1;
    int _1802 = _1768 * _1792;
    bool _1804 = !_1620;
    float _1806 = _1804 ? _223 : as_type<float>(_1784);
    int _1808 = abs(_1772);
    bool _1810 = !_1790;
    float _1812 = _1810 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1814 = !_1786;
    int _1816 = _1814 ? 0 : (-1);
    int _1818 = _1698 * _1808;
    int _1820 = _1818 + _1249;
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1824 = _1822 != 0;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1828 = _1826 != 0;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1832 = _1830 != 0;
    int _1834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1836 = _1834 != 0;
    int _1838 = abs(_1796);
    int _1840 = abs(_1800);
    float _1842 = float(_1257);
    int _1844 = _1776 * _1838;
    int _1846 = _1844 + _1802;
    float _1848 = float(_1294);
    float _1850 = _1508 * _165;
    int _1852 = abs(_1780);
    float _1854 = _1842 * _1586;
    bool _1856 = !_1824;
    int _1858 = _1856 ? 0 : 1;
    float _1860 = _1740 * _1842;
    int _1862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _1864 = _1862 != 0;
    float _1866 = trunc(_1854);
    int _1868 = int(_1866);
    bool _1870 = _1848 >= _1842;
    bool _1872 = isnan(_1848);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan(_1842);
    bool _1878 = _1874 || _1876;
    float _1880 = float(_1878);
    int _1882 = _1820 * _1840;
    int _1884 = _1882 + _1846;
    float _1886 = _1730 * _165;
    int _1888 = ~_1746;
    int _1890 = _1888 + _1816;
    int _1892 = _1890 + 1;
    bool _1894 = _1257 == 0;
    float _1896 = trunc(_1880);
    int _1898 = int(_1896);
    int _1900 = _1698 * _1852;
    int _1902 = _1900 + _1884;
    int _1904 = _1257 + (-1);
    int _1906 = _1257 * _1892;
    int _1908 = _1906 + _1294;
    float _1910 = as_type<float>(_1852);
    float _1912 = _1812;
    float _1914 = _1730;
    float _1916 = as_type<float>(_1868);
    float _1918 = as_type<float>(_1902);
    if (_1864)
    {
        float _1920 = in.m_72.y;
        _1910 = _1920;
    }
    float _1922 = _1910;
    float _1924 = float(uint(_1452));
    float _1926 = float(uint(_1902));
    float _1928 = trunc(_1850);
    int _1930 = int(_1928);
    bool _1932 = !_1894;
    int _1934 = _1932 ? _1908 : (-1);
    bool _1936 = !_1828;
    int _1938 = _1936 ? 0 : 1;
    float _1940 = as_type<float>(_1239) * _1926;
    int _1942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1944 = _1942 != 0;
    int _1946 = abs(_1938);
    float _1948 = trunc(_1940);
    float _1950 = precise::max(_1948, 0.0);
    uint _1952 = uint(_1950);
    int _1954 = ~_1898;
    int _1956 = _1954 + 1;
    int _1958 = _1956 + 1;
    bool _1960 = !_1832;
    int _1962 = _1960 ? 0 : 1;
    bool _1964 = _1546 > 0.5;
    int _1966 = _1934 * _1958;
    int _1968 = ~_1169;
    int _1970 = _1968 + 1;
    float _1972 = trunc(_1860);
    int _1974 = int(_1972);
    int _1976 = abs(_1962);
    int _1978 = _1898 * _1904;
    int _1980 = _1978 + _1966;
    float _1982 = _1854;
    bool _1984 = _1944;
    if (_1944)
    {
        float _1986 = in.m_72.x;
        _1982 = _1986;
    }
    float _1988 = _1982;
    int _1990 = abs(as_type<int>(_1812));
    float _1992 = as_type<float>(_1990);
    if (_1864)
    {
        float _1994 = _1922 * 3.1415927410125732421875;
        _1912 = _1994;
    }
    float _1996 = _1912;
    int _1998 = abs(_1858);
    float _2000 = 1.0 / _1924;
    int _2002 = _1970 * int(_1952);
    int _2004 = _2002 + _1902;
    float _2006 = float(uint(_1930));
    float _2008 = float(uint(_2004));
    int _2010 = _1980 * _1946;
    float _2012 = trunc(_1886);
    int _2014 = int(_2012);
    int _2016 = _1974 * _1990;
    int _2018 = _2016 + _1294;
    if (_1864)
    {
        float _2020 = _1996 * 0.15915493667125701904296875;
        _1992 = _2020;
    }
    float _2022 = _1992;
    int _2024 = as_type<int>(_1510) + (-2);
    float _2026 = as_type<float>(_1239) * _2008;
    bool _2028 = !_1836;
    int _2030 = _2028 ? 0 : 1;
    int _2032 = _1868 * _1998;
    int _2034 = _2032 + _2010;
    float _2036 = float(uint(_1820));
    float _2038 = as_type<float>(_2024) * _2006;
    int _2040 = abs(_2030);
    int _2042 = _2018 * _1976;
    int _2044 = _2042 + _2034;
    float _2046 = trunc(_2026);
    float _2048 = precise::max(_2046, 0.0);
    uint _2050 = uint(_2048);
    int _2052 = as_type<int>(_2000) + (-2);
    float _2054 = _1988;
    if (_1944)
    {
        float _2056 = _1988 * 3.1415927410125732421875;
        _2054 = _2056;
    }
    float _2058 = _2054;
    int _2060 = _1974 * _2040;
    int _2062 = _2060 + _2044;
    int _2064 = ~_1328;
    int _2066 = _2064 + 1;
    float _2068 = float(uint(_2014));
    if (_1944)
    {
        float _2070 = _2058 * 0.15915493667125701904296875;
        _1914 = _2070;
    }
    float _2072 = _1914;
    float _2074 = trunc(_2038);
    float _2076 = precise::max(_2074, 0.0);
    uint _2078 = uint(_2076);
    float _2080 = float(uint(_2062));
    float _2082 = as_type<float>(_2052) * _2068;
    int _2084 = ~_1169;
    int _2086 = _2084 + 1;
    float _2088 = float(_1452);
    if (_1864)
    {
        float _2090 = _2022 * 6.283185482025146484375;
        float _2092 = sin(_2090);
        _1916 = _2092;
    }
    float _2094 = _1916;
    int _2096 = ~_1452;
    int _2098 = _2096 + 1;
    float _2100 = float(_2014);
    float _2102 = trunc(_2082);
    float _2104 = precise::max(_2102, 0.0);
    uint _2106 = uint(_2104);
    float _2108 = as_type<float>(_1322) * _2080;
    int _2110 = int(_1952) + int(_2050);
    float _2112 = _1554 * _1556;
    int _2114 = _2066 * int(_2078);
    int _2116 = _2114 + _1930;
    int _2118 = _2086 * _2110;
    int _2120 = _2118 + _1902;
    float _2122 = trunc(_2108);
    float _2124 = precise::max(_2122, 0.0);
    uint _2126 = uint(_2124);
    float _2128 = float(uint(_2116));
    bool _2130 = uint(_2120) >= uint(_1169);
    float _2132 = as_type<float>(_2024) * _2128;
    int _2134 = _2098 * int(_2106);
    int _2136 = _2134 + _2014;
    int _2138 = ~_1257;
    int _2140 = _2138 + 1;
    float _2142 = _2072;
    bool _2144 = _2130;
    if (_1944)
    {
        float _2146 = _2072 * 6.283185482025146484375;
        float _2148 = sin(_2146);
        _2142 = _2148;
    }
    float _2150 = _2142;
    bool _2152 = !_2130;
    float _2154 = _2152 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2156 = float(uint(_2136));
    int _2158 = ~_2110;
    int _2160 = _2158 + as_type<int>(_2154);
    int _2162 = _2160 + 1;
    int _2164 = _2140 * int(_2126);
    int _2166 = _2164 + _2062;
    float _2168 = _2154;
    if (!_1944)
    {
        _2168 = _213;
    }
    float _2170 = _2168;
    float _2172 = trunc(_2132);
    float _2174 = precise::max(_2172, 0.0);
    uint _2176 = uint(_2174);
    float _2178 = as_type<float>(_2052) * _2156;
    float _2180 = float(uint(_2166));
    int _2182 = _1169 * _2162;
    int _2184 = _2182 + _1902;
    float _2186 = _2170;
    if (!_1864)
    {
        _1918 = _223;
    }
    float _2188 = _1918;
    float _2190 = as_type<float>(_1322) * _2180;
    float _2192 = floor(_2112);
    float _2194 = _2188;
    if (_1944)
    {
        bool _2196 = _2150 > 0.5;
        _2144 = _2196;
    }
    bool _2198 = _2144;
    bool _2200 = !_1728;
    int _2202 = _2200 ? _2184 : (-1);
    if (_1944)
    {
        float _2204 = -_213;
        float _2206 = _2198 ? _2204 : _213;
        _2186 = _2206;
    }
    float _2208 = _2186;
    if (_1864)
    {
        bool _2210 = _2094 > 0.5;
        _1984 = _2210;
    }
    bool _2212 = _1984;
    float _2214 = trunc(_2178);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    int _2220 = ~_1328;
    int _2222 = _2220 + 1;
    int _2224 = int(_2078) + int(_2176);
    int _2226 = _2202 & 3;
    bool _2228 = _2226 != 0;
    if (_1864)
    {
        float _2230 = -_223;
        float _2232 = _2212 ? _2230 : _223;
        _2194 = _2232;
    }
    float _2234 = _2194;
    float _2236 = trunc(_2190);
    float _2238 = precise::max(_2236, 0.0);
    uint _2240 = uint(_2238);
    bool _2242 = uint(_2226) > 1u;
    int _2244 = _2222 * _2224;
    int _2246 = _2244 + _1930;
    int _2248 = _2202 & 3;
    bool _2250 = _2248 != 0;
    float _2252 = -_2192;
    float _2254 = _2112 + _2252;
    float _2256 = _1542 * _1552;
    float _2258 = float(_1328);
    int _2260 = _2250 ? 0 : 1;
    float _2262 = floor(_2256);
    bool _2264 = uint(_2246) >= uint(_1328);
    float _2266 = _2254 * _2258;
    int _2268 = int(_2106) + int(_2218);
    float _2270 = _2258 * _1586;
    float _2272 = float(_1930);
    int _2274 = int(_2126) + int(_2240);
    float _2276 = trunc(_2266);
    int _2278 = int(_2276);
    int _2280 = ~_1257;
    int _2282 = _2280 + 1;
    int _2284 = ~_1452;
    int _2286 = _2284 + 1;
    bool _2288 = _1548 > 0.5;
    bool _2290 = _2272 >= _2258;
    bool _2292 = isnan(_2272);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan(_2258);
    bool _2298 = _2294 || _2296;
    float _2300 = float(_2298);
    float _2302 = -_2262;
    float _2304 = _2256 + _2302;
    float _2306 = trunc(_2270);
    int _2308 = int(_2306);
    int _2310 = ~_2260;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    int _2316 = _2286 * _2268;
    int _2318 = _2316 + _2014;
    int _2320 = _2314;
    if (!_2242)
    {
        int _2322 = ~_2260;
        int _2324 = _2322 + 1;
        _2320 = _2324;
    }
    int _2326 = _2320;
    int _2328 = _2282 * _2274;
    int _2330 = _2328 + _2062;
    float _2332 = -_223;
    int _2334 = _1964 ? as_type<int>(_2332) : as_type<int>(_223);
    float _2336 = trunc(_2300);
    int _2338 = int(_2336);
    float _2340 = -_213;
    int _2342 = _2288 ? as_type<int>(_2340) : as_type<int>(_213);
    int _2344 = int(_2264);
    int _2346 = _2242 ? 2 : 0;
    int _2348 = _2344 | _2346;
    int _2350 = _2228 ? 4 : 0;
    int _2352 = _2348 | _2350;
    int _2354 = _1836 ? 8 : 0;
    int _2356 = _2352 | _2354;
    int _2358 = _1964 ? 16 : 0;
    int _2360 = _2356 | _2358;
    int _2362 = _2288 ? 32 : 0;
    int _2364 = _2360 | _2362;
    int _2366 = _1710 ? 64 : 0;
    int _2368 = _2364 | _2366;
    int _2370 = _2368 & 4;
    int _2372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2374 = _2372 != 0;
    int _2376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2378 = _2376 != 0;
    int _2380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2382 = _2380 != 0;
    int _2384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2386 = _2384 != 0;
    int _2388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2390 = _2388 != 0;
    bool _2392 = !_2386;
    int _2394 = _2392 ? 0 : 1;
    bool _2396 = !_2390;
    int _2398 = _2396 ? 0 : 1;
    bool _2400 = !_2264;
    int _2402 = _2400 ? 0 : (-1);
    int _2404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2406 = _2404 != 0;
    bool _2408 = uint(_2318) >= uint(_1452);
    float _2410 = as_type<float>(_1239) * _2036;
    bool _2412 = uint(_2330) >= uint(_1257);
    bool _2414 = uint(_2226) >= 2u;
    bool _2416 = !_2406;
    int _2418 = _2416 ? 0 : 1;
    float _2420 = trunc(_2410);
    float _2422 = precise::max(_2420, 0.0);
    uint _2424 = uint(_2422);
    bool _2426 = !_2408;
    int _2428 = _2426 ? 0 : (-1);
    bool _2430 = !_2412;
    int _2432 = _2430 ? 0 : (-1);
    int _2434 = _2414 ? 0 : 1;
    int _2436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2438 = _2436 != 0;
    int _2440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2442 = _2440 != 0;
    int _2444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2446 = _2444 != 0;
    int _2448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2450 = _2448 != 0;
    int _2452 = ~_2224;
    int _2454 = _2452 + _2402;
    int _2456 = _2454 + 1;
    int _2458 = ~_2338;
    int _2460 = _2458 + 1;
    int _2462 = _2460 + 1;
    bool _2464 = !_2442;
    int _2466 = _2464 ? 0 : 1;
    int _2468 = _1328 * _2456;
    int _2470 = _2468 + _1930;
    bool _2472 = _1328 == 0;
    int _2474 = abs(_2394);
    bool _2476 = !_2472;
    int _2478 = _2476 ? _2470 : (-1);
    bool _2480 = !_2378;
    int _2482 = _2480 ? 0 : 1;
    int _2484 = _2278 * _2474;
    int _2486 = _2484 + _1930;
    bool _2488 = _2100 >= _2088;
    bool _2490 = isnan(_2100);
    bool _2492 = _2488 || _2490;
    bool _2494 = isnan(_2088);
    bool _2496 = _2492 || _2494;
    float _2498 = float(_2496);
    int _2500 = _2478 * _2462;
    int _2502 = _1328 + (-1);
    float _2504 = _2088 * _1586;
    float _2506 = _2304 * _2088;
    bool _2508 = !_2374;
    int _2510 = _2508 ? 0 : 1;
    float _2512 = trunc(_2498);
    int _2514 = int(_2512);
    int _2516 = ~_1169;
    int _2518 = _2516 + 1;
    int _2520 = _2338 * _2502;
    int _2522 = _2520 + _2500;
    int _2524 = abs(_2482);
    bool _2526 = !_2382;
    int _2528 = _2526 ? 0 : 1;
    float _2530 = trunc(_2504);
    int _2532 = int(_2530);
    int _2534 = abs(_2510);
    int _2536 = _2518 * int(_2424);
    int _2538 = _2536 + _1820;
    int _2540 = abs(_2528);
    int _2542 = _2522 * _2524;
    float _2544 = float(uint(_2018));
    float _2546 = trunc(_2506);
    int _2548 = int(_2546);
    int _2550 = _2308 * _2534;
    int _2552 = _2550 + _2542;
    float _2554 = float(uint(_2538));
    float _2556 = as_type<float>(_1322) * _2544;
    int _2558 = ~_2268;
    int _2560 = _2558 + _2428;
    int _2562 = _2560 + 1;
    int _2564 = _2486 * _2540;
    int _2566 = _2564 + _2552;
    int _2568 = abs(_2398);
    float _2570 = as_type<float>(_1239) * _2554;
    bool _2572 = !_2438;
    int _2574 = _2572 ? 0 : 1;
    int _2576 = _1452 * _2562;
    int _2578 = _2576 + _2014;
    float _2580 = trunc(_2556);
    float _2582 = precise::max(_2580, 0.0);
    uint _2584 = uint(_2582);
    bool _2586 = _1452 == 0;
    int _2588 = abs(_2418);
    int _2590 = ~_2514;
    int _2592 = _2590 + 1;
    int _2594 = _2592 + 1;
    float _2596 = trunc(_2570);
    float _2598 = precise::max(_2596, 0.0);
    uint _2600 = uint(_2598);
    bool _2602 = !_2586;
    int _2604 = _2602 ? _2578 : (-1);
    int _2606 = _2278 * _2568;
    int _2608 = _2606 + _2566;
    float _2610 = float(uint(_2486));
    int _2612 = ~_1257;
    int _2614 = _2612 + 1;
    int _2616 = _2604 * _2594;
    int _2618 = _1452 + (-1);
    float _2620 = as_type<float>(_2024) * _2610;
    float _2622 = float(uint(_2608));
    int _2624 = _2514 * _2618;
    int _2626 = _2624 + _2616;
    int _2628 = abs(_2466);
    int _2630 = _2614 * int(_2584);
    int _2632 = _2630 + _2018;
    float _2634 = trunc(_2620);
    float _2636 = precise::max(_2634, 0.0);
    uint _2638 = uint(_2636);
    float _2640 = as_type<float>(_2024) * _2622;
    int _2642 = int(_2424) + int(_2600);
    int _2644 = _2626 * _2628;
    float _2646 = float(uint(_2632));
    int _2648 = abs(_2574);
    float _2650 = trunc(_2640);
    float _2652 = precise::max(_2650, 0.0);
    uint _2654 = uint(_2652);
    float _2656 = as_type<float>(_1322) * _2646;
    bool _2658 = !_2446;
    int _2660 = _2658 ? 0 : 1;
    int _2662 = ~_1169;
    int _2664 = _2662 + 1;
    int _2666 = _2532 * _2648;
    int _2668 = _2666 + _2644;
    bool _2670 = _2226 != 3;
    float _2672 = trunc(_2656);
    float _2674 = precise::max(_2672, 0.0);
    uint _2676 = uint(_2674);
    int _2678 = ~_1328;
    int _2680 = _2678 + 1;
    int _2682 = ~_1328;
    int _2684 = _2682 + 1;
    int _2686 = _2680 * int(_2638);
    int _2688 = _2686 + _2486;
    int _2690 = ~_2274;
    int _2692 = _2690 + _2432;
    int _2694 = _2692 + 1;
    int _2696 = _2684 * int(_2654);
    int _2698 = _2696 + _2608;
    int _2700 = abs(_2660);
    int _2702 = _2664 * _2642;
    int _2704 = _2702 + _1820;
    float _2706 = float(uint(_2688));
    int _2708 = _1257 * _2694;
    int _2710 = _2708 + _2062;
    int _2712 = ~_2434;
    int _2714 = _2712 + 1;
    int _2716 = _2714 + 1;
    int _2718 = _2716;
    if (_2670)
    {
        int _2720 = ~_2434;
        int _2722 = _2720 + 1;
        _2718 = _2722;
    }
    int _2724 = _2718;
    float _2726 = as_type<float>(_2024) * _2706;
    float _2728 = float(uint(_2698));
    bool _2730 = uint(_2704) >= uint(_1169);
    float _2732 = as_type<float>(_2024) * _2728;
    bool _2734 = !_2450;
    int _2736 = _2734 ? 0 : 1;
    float _2738 = trunc(_2726);
    float _2740 = precise::max(_2738, 0.0);
    uint _2742 = uint(_2740);
    bool _2744 = _1257 == 0;
    int _2746 = _2548 * _2588;
    int _2748 = _2746 + _2014;
    int _2750 = abs(_2736);
    int _2752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2754 = _2752 != 0;
    int _2756 = _2748 * _2700;
    int _2758 = _2756 + _2668;
    bool _2760 = !_2744;
    int _2762 = _2760 ? _2710 : (-1);
    float _2764 = trunc(_2732);
    float _2766 = precise::max(_2764, 0.0);
    uint _2768 = uint(_2766);
    bool _2770 = !_2754;
    int _2772 = _2770 ? 0 : 1;
    bool _2774 = !_2730;
    int _2776 = _2774 ? 0 : (-1);
    int _2778 = _2548 * _2750;
    int _2780 = _2778 + _2758;
    int _2782 = _2762 & 3;
    bool _2784 = _2782 != 0;
    int _2786 = _2762 & 3;
    bool _2788 = _2786 != 0;
    int _2790 = _2784 ? 0 : 1;
    bool _2792 = uint(_2786) > 1u;
    float _2794 = float(uint(_2780));
    int _2796 = ~_2642;
    int _2798 = _2796 + _2776;
    int _2800 = _2798 + 1;
    int _2802 = int(_2638) + int(_2742);
    float _2804 = as_type<float>(_2052) * _2794;
    int _2806 = ~_1328;
    int _2808 = _2806 + 1;
    int _2810 = _1169 * _2800;
    int _2812 = _2810 + _1820;
    int _2814 = ~_2790;
    int _2816 = _2814 + 1;
    int _2818 = _2816 + 1;
    int _2820 = int(_2584) + int(_2676);
    int _2822 = ~_1257;
    int _2824 = _2822 + 1;
    int _2826 = _2818;
    if (!_2792)
    {
        int _2828 = ~_2790;
        int _2830 = _2828 + 1;
        _2826 = _2830;
    }
    int _2832 = _2826;
    int _2834 = ~_1328;
    int _2836 = _2834 + 1;
    int _2838 = int(_2654) + int(_2768);
    float _2840 = trunc(_2804);
    float _2842 = precise::max(_2840, 0.0);
    uint _2844 = uint(_2842);
    bool _2846 = _1169 == 0;
    int _2848 = _2824 * _2820;
    int _2850 = _2848 + _2018;
    int _2852 = _2808 * _2838;
    int _2854 = _2852 + _2608;
    bool _2856 = uint(_2786) >= 2u;
    int _2858 = ~_1452;
    int _2860 = _2858 + 1;
    int _2862 = _2836 * _2802;
    int _2864 = _2862 + _2486;
    int _2866 = _2856 ? 0 : 1;
    bool _2868 = uint(_2854) >= uint(_1328);
    bool _2870 = !_2846;
    int _2872 = _2870 ? _2812 : (-1);
    bool _2874 = uint(_2850) >= uint(_1257);
    bool _2876 = !_2868;
    int _2878 = _2876 ? 0 : (-1);
    int _2880 = _2860 * int(_2844);
    int _2882 = _2880 + _2780;
    bool _2884 = !_2874;
    int _2886 = _2884 ? 0 : (-1);
    bool _2888 = _2786 != 3;
    int _2890 = ~_2838;
    int _2892 = _2890 + _2878;
    int _2894 = _2892 + 1;
    int _2896 = ~_2820;
    int _2898 = _2896 + _2886;
    int _2900 = _2898 + 1;
    bool _2902 = uint(_2864) >= uint(_1328);
    int _2904 = _1328 * _2894;
    int _2906 = _2904 + _2608;
    float _2908 = float(uint(_2882));
    int _2910 = _1257 * _2900;
    int _2912 = _2910 + _2018;
    bool _2914 = !_2902;
    int _2916 = _2914 ? 0 : (-1);
    bool _2918 = _1257 == 0;
    float _2920 = as_type<float>(_2052) * _2908;
    bool _2922 = !_2472;
    int _2924 = _2922 ? _2906 : (-1);
    int _2926 = ~_2866;
    int _2928 = _2926 + 1;
    int _2930 = _2928 + 1;
    float _2932 = trunc(_2920);
    float _2934 = precise::max(_2932, 0.0);
    uint _2936 = uint(_2934);
    bool _2938 = _2370 != 0;
    int _2940 = _2930;
    if (_2888)
    {
        int _2942 = ~_2866;
        int _2944 = _2942 + 1;
        _2940 = _2944;
    }
    int _2946 = _2940;
    bool _2948 = !_2918;
    int _2950 = _2948 ? _2912 : (-1);
    int _2952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2954 = _2952 != 0;
    int _2956 = _2924 & 3;
    bool _2958 = _2956 != 0;
    int _2960 = ~_2802;
    int _2962 = _2960 + _2916;
    int _2964 = _2962 + 1;
    bool _2966 = !_2938;
    int _2968 = _2966 ? 0 : 1;
    bool _2970 = !_2954;
    int _2972 = _2970 ? 0 : 1;
    int _2974 = _1328 * _2964;
    int _2976 = _2974 + _2486;
    bool _2978 = uint(_2956) > 1u;
    int _2980 = _2924 & 3;
    bool _2982 = _2980 != 0;
    int _2984 = _2982 ? 0 : 1;
    bool _2986 = _2956 != 3;
    float _2988 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2990 = _2988 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2992 = !_2788;
    int _2994 = _2992 ? 0 : 1;
    bool _2996 = uint(_2956) >= 2u;
    float _2998 = 1.0 / _2990;
    int _3000 = int(_2844) + int(_2936);
    int _3002 = ~_2984;
    int _3004 = _3002 + 1;
    int _3006 = _3004 + 1;
    int _3008 = _3006;
    if (!_2978)
    {
        int _3010 = ~_2984;
        int _3012 = _3010 + 1;
        _3008 = _3012;
    }
    int _3014 = _3008;
    int _3016 = _2996 ? 0 : 1;
    int _3018 = ~_3016;
    int _3020 = _3018 + 1;
    int _3022 = _3020 + 1;
    int _3024 = _3022;
    if (_2986)
    {
        int _3026 = ~_3016;
        int _3028 = _3026 + 1;
        _3024 = _3028;
    }
    int _3030 = _3024;
    float _3032 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3034 = _3032 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3036 = in.m_60.x;
    float _3038 = in.m_60.y;
    float _3040 = in.m_60.z;
    bool _3042 = _2786 != 3;
    int _3044 = ~_1452;
    int _3046 = _3044 + 1;
    float _3048 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3050 = _3048 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3052 = 1.0 / _3034;
    bool _3054 = _2226 != 3;
    int _3056 = _3046 * _3000;
    int _3058 = _3056 + _2780;
    float _3060 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3062 = _3060 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3064 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3066 = _3064 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3068 = 1.0 / _3050;
    int _3070 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3072 = _3070 != 0;
    float _3074 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3076 = _3074 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3078 = !_2958;
    int _3080 = _3078 ? 0 : 1;
    bool _3082 = !_3054;
    int _3084 = _3082 ? 0 : (-1);
    float _3086 = _3038 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _3088 = !_3042;
    int _3090 = _3088 ? 0 : (-1);
    float _3092 = 1.0 / _3066;
    bool _3094 = !_2472;
    int _3096 = _3094 ? _2976 : (-1);
    float _3098 = _3038 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _3100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3102 = _3100 != 0;
    float _3104 = _3038 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _3106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3108 = _3106 != 0;
    float _3110 = fma(_3036, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3086);
    int _3112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3114 = _3112 != 0;
    float _3116 = fma(_3036, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3098);
    int _3118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3120 = _3118 != 0;
    float _3122 = fma(_3036, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3104);
    bool _3124 = uint(_3058) >= uint(_1452);
    float _3126 = 1.0 / _3062;
    bool _3128 = !_3124;
    int _3130 = _3128 ? 0 : (-1);
    int _3132 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3134 = _3132 != 0;
    float _3136 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3138 = _3136 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3140 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3142 = _3140 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3144 = 1.0 / _3076;
    float _3146 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3148 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3146;
    float _3150 = _3138 * _3052;
    float _3152 = fma(_3040, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3116);
    int _3154 = ~_1452;
    int _3156 = _3154 + 1;
    float _3158 = _3148 * _2998;
    float _3160 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3162 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3160;
    float _3164 = 1.0 / _3142;
    float _3166 = fma(_3158, _1598, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3168 = _3162 * _3068;
    float _3170 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3172 = _3170 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3174 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3176 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3174;
    float _3178 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3180 = _3178 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3182 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3184 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3182;
    float _3186 = float(uint(_2748));
    float _3188 = _3172 * _3092;
    float _3190 = _3176 * _3126;
    float _3192 = _3180 * _3144;
    float _3194 = fma(_3040, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3122);
    float _3196 = as_type<float>(_2052) * _3186;
    bool _3198 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3200 = isnan(_1149);
    bool _3202 = _3198 || _3200;
    bool _3204 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3206 = _3202 || _3204;
    float _3208 = float(_3206);
    float _3210 = _3184 * _3164;
    float _3212 = fma(_3040, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3110);
    float _3214 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3216 = _1149 + _3214;
    float _3218 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3220 = _1149 + _3218;
    float _3222 = trunc(_3196);
    float _3224 = precise::max(_3222, 0.0);
    uint _3226 = uint(_3224);
    float _3228 = -_3208;
    float _3230 = _3228 + 1.0;
    float _3232 = fma(_3150, _3216, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3234 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3236 = _1149 + _3234;
    float _3238 = fma(_3168, _3220, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3240 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3242 = _1149 + _3240;
    bool _3244 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3246 = isnan(_1149);
    bool _3248 = _3244 || _3246;
    bool _3250 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3252 = _3248 || _3250;
    float _3254 = float(_3252);
    float _3256 = fma(_3188, _3236, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    bool _3258 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3260 = isnan(_1149);
    bool _3262 = _3258 || _3260;
    bool _3264 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3266 = _3262 || _3264;
    float _3268 = float(_3266);
    float _3270 = fma(_3190, _3242, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    int _3272 = ~_3000;
    int _3274 = _3272 + _3130;
    int _3276 = _3274 + 1;
    float _3278 = -_3254;
    float _3280 = _3278 + 1.0;
    int _3282 = abs(_2772);
    float _3284 = -_3268;
    float _3286 = _3284 + 1.0;
    float _3288 = _3268 * _3230;
    bool _3290 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3292 = isnan(_1149);
    bool _3294 = _3290 || _3292;
    bool _3296 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3298 = _3294 || _3296;
    float _3300 = float(_3298);
    int _3302 = _3156 * int(_3226);
    int _3304 = _3302 + _2748;
    float _3306 = _3254 * _3286;
    bool _3308 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3310 = isnan(_1149);
    bool _3312 = _3308 || _3310;
    bool _3314 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3316 = _3312 || _3314;
    float _3318 = float(_3316);
    int _3320 = _1452 * _3276;
    int _3322 = _3320 + _2780;
    float _3324 = _3300 * _3280;
    float _3326 = -_3300;
    float _3328 = _3326 + 1.0;
    bool _3330 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3332 = isnan(_1149);
    bool _3334 = _3330 || _3332;
    bool _3336 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3338 = _3334 || _3336;
    float _3340 = float(_3338);
    float _3342 = -_3318;
    float _3344 = _3342 + 1.0;
    float _3346 = float(uint(_3304));
    float _3348 = _3318 * _3328;
    float _3350 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3352 = _1149 + _3350;
    float _3354 = _3340 * _3344;
    float _3356 = -_3340;
    float _3358 = _3356 + 1.0;
    bool _3360 = !_2586;
    int _3362 = _3360 ? _3322 : (-1);
    float _3364 = as_type<float>(_2052) * _3346;
    bool _3366 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3368 = isnan(_1149);
    bool _3370 = _3366 || _3368;
    bool _3372 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3374 = _3370 || _3372;
    float _3376 = float(_3374);
    float _3378 = fma(_3192, _3352, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _3380 = !_3114;
    int _3382 = _3380 ? 0 : 1;
    float _3384 = trunc(_3364);
    float _3386 = precise::max(_3384, 0.0);
    uint _3388 = uint(_3386);
    int _3390 = _3362 & 3;
    bool _3392 = _3390 != 0;
    float _3394 = _3376 * _3358;
    bool _3396 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3398 = isnan(_1149);
    bool _3400 = _3396 || _3398;
    bool _3402 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3404 = _3400 || _3402;
    float _3406 = float(_3404);
    float _3408 = -_3376;
    float _3410 = _3408 + 1.0;
    bool _3412 = !_3120;
    int _3414 = _3412 ? 0 : 1;
    float _3416 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3418 = _1149 + _3416;
    bool _3420 = uint(_3390) > 1u;
    float _3422 = _3406 * _3410;
    int _3424 = _2202 >> 31;
    float _3426 = fma(_3210, _3418, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _3428 = !_3392;
    int _3430 = _3428 ? 0 : 1;
    float _3432 = _1149;
    if (_3102)
    {
        float _3434 = in.m_72.x;
        _3432 = _3434;
    }
    float _3436 = _3432;
    int _3438 = _3362 & 3;
    bool _3440 = _3438 != 0;
    float _3442 = _3166 * _3422;
    int _3444 = _3424 & 3;
    float _3446 = -_3406;
    float _3448 = _3446 + 1.0;
    int _3450 = _3440 ? 0 : 1;
    float _3452 = _3152 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _3454 = _2202 + _3444;
    float _3456 = fma(_3448, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3442);
    bool _3458 = _2956 != 3;
    float _3460 = _3212 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _3462 = ~_3450;
    int _3464 = _3462 + 1;
    int _3466 = _3464 + 1;
    float _3468 = fma(_3232, _3394, _3456);
    int _3470 = _3466;
    if (!_3420)
    {
        int _3472 = ~_3450;
        int _3474 = _3472 + 1;
        _3470 = _3474;
    }
    int _3476 = _3470;
    float _3478 = _3194 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _3480 = _3454 >> 2;
    float _3482 = fma(_3238, _3354, _3468);
    bool _3484 = !_3458;
    int _3486 = _3484 ? 0 : (-1);
    bool _3488 = uint(_3390) >= 2u;
    float _3490 = fma(_3256, _3348, _3482);
    int _3492 = _3480 << 4;
    int _3494 = _3492 + 368;
    int _3496 = _3488 ? 0 : 1;
    float _3498 = _3436;
    if (_3102)
    {
        float _3500 = _3436 * 3.1415927410125732421875;
        _3498 = _3500;
    }
    float _3502 = _3498;
    bool _3504 = _3390 != 3;
    float _3506 = fma(_3270, _3324, _3490);
    bool _3508 = _3390 != 3;
    float _3510 = 0.0;
    if (_3102)
    {
        float _3512 = _3502 * 0.15915493667125701904296875;
        _3510 = _3512;
    }
    float _3514 = _3510;
    uint _3516 = uint(int(uint(_3494) >> uint(2)));
    uint _3518 = uint(int(uint(int(_3516)) >> uint(2)));
    int _3520 = int(_3516) & 3;
    float _3522 = (*spvDescriptorSet0.vp_c9)._m0[int(_3518)][_3520];
    int _3524 = int(_3516) + 1;
    uint _3526 = uint(int(uint(_3524) >> uint(2)));
    int _3528 = _3524 & 3;
    float _3530 = (*spvDescriptorSet0.vp_c9)._m0[int(_3526)][_3528];
    int _3532 = _2762 >> 31;
    int _3534 = _2924 >> 31;
    int _3536 = _3532 & 3;
    float _3538 = _3514;
    if (_3102)
    {
        float _3540 = _3514 * 6.283185482025146484375;
        float _3542 = sin(_3540);
        _3538 = _3542;
    }
    float _3544 = _3538;
    int _3546 = ~_1452;
    int _3548 = _3546 + 1;
    int _3550 = _3534 & 3;
    int _3552 = _2762 + _3536;
    int _3554 = _3362 >> 31;
    int _3556 = int(_3226) + int(_3388);
    int _3558 = _2924 + _3550;
    int _3560 = _3552 >> 2;
    int _3562 = _3548 * _3556;
    int _3564 = _3562 + _2748;
    int _3566 = _3554 & 3;
    int _3568 = _3558 >> 2;
    int _3570 = _3560 << 4;
    int _3572 = _3570 + 512;
    int _3574 = _3362 + _3566;
    bool _3576 = !_3508;
    int _3578 = _3576 ? 0 : (-1);
    uint _3580 = uint(int(uint(_3572) >> uint(2)));
    uint _3582 = uint(int(uint(int(_3580)) >> uint(2)));
    int _3584 = int(_3580) & 3;
    float _3586 = (*spvDescriptorSet0.vp_c9)._m0[int(_3582)][_3584];
    int _3588 = int(_3580) + 1;
    uint _3590 = uint(int(uint(_3588) >> uint(2)));
    int _3592 = _3588 & 3;
    float _3594 = (*spvDescriptorSet0.vp_c9)._m0[int(_3590)][_3592];
    int _3596 = _3568 << 4;
    int _3598 = _3596 + 656;
    bool _3600 = uint(_3564) >= uint(_1452);
    int _3602 = _3574 >> 2;
    bool _3604 = !_3600;
    int _3606 = _3604 ? 0 : (-1);
    uint _3608 = uint(int(uint(_3598) >> uint(2)));
    uint _3610 = uint(int(uint(int(_3608)) >> uint(2)));
    int _3612 = int(_3608) & 3;
    float _3614 = (*spvDescriptorSet0.vp_c9)._m0[int(_3610)][_3612];
    int _3616 = int(_3608) + 1;
    uint _3618 = uint(int(uint(_3616) >> uint(2)));
    int _3620 = _3616 & 3;
    float _3622 = (*spvDescriptorSet0.vp_c9)._m0[int(_3618)][_3620];
    int _3624 = _3602 << 4;
    int _3626 = _3624 + 800;
    int _3628 = ~_3556;
    int _3630 = _3628 + _3606;
    int _3632 = _3630 + 1;
    float _3634 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3636 = _3600;
    if (_3102)
    {
        bool _3638 = _3544 > 0.5;
        _3636 = _3638;
    }
    bool _3640 = _3636;
    uint _3642 = uint(int(uint(_3626) >> uint(2)));
    uint _3644 = uint(int(uint(int(_3642)) >> uint(2)));
    int _3646 = int(_3642) & 3;
    float _3648 = (*spvDescriptorSet0.vp_c9)._m0[int(_3644)][_3646];
    int _3650 = int(_3642) + 1;
    uint _3652 = uint(int(uint(_3650) >> uint(2)));
    int _3654 = _3650 & 3;
    float _3656 = (*spvDescriptorSet0.vp_c9)._m0[int(_3652)][_3654];
    int _3658 = ~_3496;
    int _3660 = _3658 + 1;
    int _3662 = _3660 + 1;
    int _3664 = _1452 * _3632;
    int _3666 = _3664 + _2748;
    int _3668 = abs(_2326);
    float _3670 = -_3634;
    float _3672 = fma(_1616, 2.0, _3670);
    int _3674 = _3662;
    if (_3504)
    {
        int _3676 = ~_3496;
        int _3678 = _3676 + 1;
        _3674 = _3678;
    }
    int _3680 = _3674;
    float _3682 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3684 = int(_3682);
    bool _3686 = _1558 != 1;
    int _3688 = _3494 + 8;
    uint _3690 = uint(int(uint(_3688) >> uint(2)));
    uint _3692 = uint(int(uint(int(_3690)) >> uint(2)));
    int _3694 = int(_3690) & 3;
    float _3696 = (*spvDescriptorSet0.vp_c9)._m0[int(_3692)][_3694];
    int _3698 = int(_3690) + 1;
    uint _3700 = uint(int(uint(_3698) >> uint(2)));
    int _3702 = _3698 & 3;
    float _3704 = (*spvDescriptorSet0.vp_c9)._m0[int(_3700)][_3702];
    int _3706 = abs(_2968);
    float _3708 = -_165;
    float _3710 = fma(_3708, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3672);
    int _3712 = abs(_2832);
    int _3714 = ~_3668;
    int _3716 = _3714 + 1;
    int _3718 = _3716 + 1;
    int _3720 = _3572 + 8;
    uint _3722 = uint(int(uint(_3720) >> uint(2)));
    uint _3724 = uint(int(uint(int(_3722)) >> uint(2)));
    int _3726 = int(_3722) & 3;
    float _3728 = (*spvDescriptorSet0.vp_c9)._m0[int(_3724)][_3726];
    int _3730 = int(_3722) + 1;
    uint _3732 = uint(int(uint(_3730) >> uint(2)));
    int _3734 = _3730 & 3;
    float _3736 = (*spvDescriptorSet0.vp_c9)._m0[int(_3732)][_3734];
    int _3738 = abs(_2994);
    int _3740 = _3718 * as_type<int>(_3530);
    int _3742 = abs(_3014);
    float _3744 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _3746 = !_2586;
    int _3748 = _3746 ? _3666 : (-1);
    float _3750 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3752 = int(_3750);
    bool _3754 = _1560 != 2;
    int _3756 = _3598 + 8;
    uint _3758 = uint(int(uint(_3756) >> uint(2)));
    uint _3760 = uint(int(uint(int(_3758)) >> uint(2)));
    int _3762 = int(_3758) & 3;
    float _3764 = (*spvDescriptorSet0.vp_c9)._m0[int(_3760)][_3762];
    int _3766 = int(_3758) + 1;
    uint _3768 = uint(int(uint(_3766) >> uint(2)));
    int _3770 = _3766 & 3;
    float _3772 = (*spvDescriptorSet0.vp_c9)._m0[int(_3768)][_3770];
    float _3774 = fma(_1630, -2.0, _3744);
    int _3776 = abs(_3476);
    int _3778 = ~_3706;
    int _3780 = _3778 + 1;
    int _3782 = _3780 + 1;
    float _3784 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3774);
    int _3786 = ~_3712;
    int _3788 = _3786 + 1;
    int _3790 = _3788 + 1;
    int _3792 = _3626 + 8;
    uint _3794 = uint(int(uint(_3792) >> uint(2)));
    uint _3796 = uint(int(uint(int(_3794)) >> uint(2)));
    int _3798 = int(_3794) & 3;
    float _3800 = (*spvDescriptorSet0.vp_c9)._m0[int(_3796)][_3798];
    int _3802 = int(_3794) + 1;
    uint _3804 = uint(int(uint(_3802) >> uint(2)));
    int _3806 = _3802 & 3;
    float _3808 = (*spvDescriptorSet0.vp_c9)._m0[int(_3804)][_3806];
    int _3810 = _3782 * as_type<int>(_3522);
    int _3812 = _3810 + _3740;
    int _3814 = ~_3742;
    int _3816 = _3814 + 1;
    int _3818 = _3816 + 1;
    int _3820 = _3790 * as_type<int>(_3594);
    int _3822 = abs(_3080);
    int _3824 = ~_3738;
    int _3826 = _3824 + 1;
    int _3828 = _3826 + 1;
    int _3830 = ~_3822;
    int _3832 = _3830 + 1;
    int _3834 = _3832 + 1;
    int _3836 = _3818 * as_type<int>(_3622);
    int _3838 = ~_3776;
    int _3840 = _3838 + 1;
    int _3842 = _3840 + 1;
    int _3844 = _3828 * as_type<int>(_3586);
    int _3846 = _3844 + _3820;
    int _3848 = abs(_2724);
    int _3850 = _3834 * as_type<int>(_3614);
    int _3852 = _3850 + _3836;
    int _3854 = abs(_2946);
    float _3856 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3858 = int(_3856);
    int _3860 = abs(_3030);
    int _3862 = _3842 * as_type<int>(_3656);
    int _3864 = abs(_3430);
    int _3866 = ~_3848;
    int _3868 = _3866 + 1;
    int _3870 = _3868 + 1;
    int _3872 = abs(_3084);
    float _3874 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3876 = int(_3874);
    int _3878 = ~_3854;
    int _3880 = _3878 + 1;
    int _3882 = _3880 + 1;
    int _3884 = _3870 * as_type<int>(_3696);
    int _3886 = _3884 + _3812;
    int _3888 = ~_3860;
    int _3890 = _3888 + 1;
    int _3892 = _3890 + 1;
    int _3894 = ~_3872;
    int _3896 = _3894 + 1;
    int _3898 = _3896 + 1;
    int _3900 = _3882 * as_type<int>(_3728);
    int _3902 = _3900 + _3846;
    int _3904 = ~_3864;
    int _3906 = _3904 + 1;
    int _3908 = _3906 + 1;
    int _3910 = abs(_3090);
    int _3912 = abs(_3680);
    int _3914 = _3908 * as_type<int>(_3648);
    int _3916 = _3914 + _3862;
    int _3918 = ~_3910;
    int _3920 = _3918 + 1;
    int _3922 = _3920 + 1;
    int _3924 = _3892 * as_type<int>(_3764);
    int _3926 = _3924 + _3852;
    int _3928 = ~_3912;
    int _3930 = _3928 + 1;
    int _3932 = _3930 + 1;
    int _3934 = _3898 * as_type<int>(_3704);
    int _3936 = _3934 + _3886;
    int _3938 = abs(_3486);
    int _3940 = _3922 * as_type<int>(_3736);
    int _3942 = _3940 + _3902;
    int _3944 = abs(_3578);
    float _3946 = float(uint(_3684));
    int _3948 = _3932 * as_type<int>(_3800);
    int _3950 = _3948 + _3916;
    int _3952 = ~_3938;
    int _3954 = _3952 + 1;
    int _3956 = _3954 + 1;
    float _3958 = float(uint(_3752));
    float _3960 = 1.0 / _3946;
    int _3962 = ~_3944;
    int _3964 = _3962 + 1;
    int _3966 = _3964 + 1;
    int _3968 = _3956 * as_type<int>(_3772);
    int _3970 = _3968 + _3926;
    int _3972 = ~_3282;
    int _3974 = _3972 + 1;
    int _3976 = _3974 + 1;
    int _3978 = abs(_3876);
    int _3980 = _3966 * as_type<int>(_3808);
    int _3982 = _3980 + _3950;
    float _3984 = float(uint(_3876));
    float _3986 = 1.0 / _3958;
    int _3988 = _3936 * _3976;
    int _3990 = abs(_3752);
    int _3992 = _2872 * _3282;
    int _3994 = _3992 + _3988;
    int _3996 = abs(_3382);
    float _3998 = float(uint(_3990));
    float _4000 = 1.0 / _3984;
    int _4002 = abs(_2972);
    int _4004 = ~_3996;
    int _4006 = _4004 + 1;
    int _4008 = _4006 + 1;
    int _4010 = ~_4002;
    int _4012 = _4010 + 1;
    int _4014 = _4012 + 1;
    int _4016 = abs(_3684);
    int _4018 = _3970 * _4008;
    float _4020 = float(uint(_3858));
    int _4022 = _3942 * _4014;
    float _4024 = float(uint(_4016));
    float _4026 = 1.0 / _3998;
    float _4028 = float(uint(_3978));
    int _4030 = _2950 * _4002;
    int _4032 = _4030 + _4022;
    int _4034 = abs(_3414);
    int _4036 = _3096 * _3996;
    int _4038 = _4036 + _4018;
    int _4040 = as_type<int>(_3960) + (-2);
    int _4042 = ~_4034;
    int _4044 = _4042 + 1;
    int _4046 = _4044 + 1;
    float _4048 = 1.0 / _4020;
    float _4050 = float(uint(_3994));
    int _4052 = as_type<int>(_3986) + (-2);
    int _4054 = _3982 * _4046;
    float _4056 = float(uint(_4032));
    float _4058 = as_type<float>(_4040) * _4050;
    float _4060 = 1.0 / _4024;
    int _4062 = as_type<int>(_4000) + (-2);
    float _4064 = as_type<float>(_4052) * _4056;
    float _4066 = float(uint(_4038));
    float _4068 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _4070 = _1562 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _4072 = _3748 * _4034;
    int _4074 = _4072 + _4054;
    int _4076 = as_type<int>(_4026) + (-2);
    float _4078 = 1.0 / _4028;
    int _4080 = abs(_3858);
    float _4082 = as_type<float>(_4062) * _4066;
    float _4084 = -_4068;
    float _4086 = fma(_4070, 2.0, _4084);
    int _4088 = abs(_4038);
    float _4090 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _4092 = float(uint(_4080));
    float _4094 = -_165;
    float _4096 = fma(_4094, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4086);
    float _4098 = trunc(_4058);
    float _4100 = precise::max(_4098, 0.0);
    uint _4102 = uint(_4100);
    int _4104 = as_type<int>(_4048) + (-2);
    float _4106 = float(uint(_4074));
    float _4108 = 1.0 / _4092;
    int _4110 = as_type<int>(_4078) + (-2);
    float _4112 = as_type<float>(_4104) * _4106;
    int _4114 = ~_3752;
    int _4116 = _4114 + 1;
    float _4118 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _4120 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _4122 = ~_3684;
    int _4124 = _4122 + 1;
    float _4126 = trunc(_4064);
    float _4128 = precise::max(_4126, 0.0);
    uint _4130 = uint(_4128);
    int _4132 = abs(_4074);
    float _4134 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[93].z, _4118);
    int _4136 = abs(_3994);
    int _4138 = _4124 * int(_4102);
    int _4140 = _4138 + _3994;
    float _4142 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[93].w, _4120);
    int _4144 = as_type<int>(_4060) + (-2);
    float _4146 = trunc(_4082);
    float _4148 = precise::max(_4146, 0.0);
    uint _4150 = uint(_4148);
    int _4152 = as_type<int>(_4108) + (-2);
    float _4154 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4156 = float(uint(_4136));
    float _4158 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[92].z, _4134);
    int _4160 = abs(_4032);
    float _4162 = fma(_4090, -2.0, _4154);
    bool _4164 = !_3686;
    float _4166 = _4164 ? _1564 : _1562;
    float _4168 = trunc(_4112);
    float _4170 = precise::max(_4168, 0.0);
    uint _4172 = uint(_4170);
    float _4174 = float(uint(_4088));
    float _4176 = as_type<float>(_4144) * _4156;
    float _4178 = float(uint(_4160));
    float _4180 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4142);
    int _4182 = ~_3876;
    int _4184 = _4182 + 1;
    float _4186 = as_type<float>(_4110) * _4174;
    float _4188 = trunc(_4176);
    float _4190 = precise::max(_4188, 0.0);
    uint _4192 = uint(_4190);
    float _4194 = float(uint(_4132));
    float _4196 = as_type<float>(_4076) * _4178;
    int _4198 = _4184 * int(_4150);
    int _4200 = _4198 + _4038;
    int _4202 = ~_4016;
    int _4204 = _4202 + 1;
    int _4206 = _4116 * int(_4130);
    int _4208 = _4206 + _4032;
    float _4210 = as_type<float>(_4152) * _4194;
    float _4212 = float(uint(_4140));
    float _4214 = trunc(_4196);
    float _4216 = precise::max(_4214, 0.0);
    uint _4218 = uint(_4216);
    bool _4220 = !_3686;
    float _4222 = _4220 ? as_type<float>(_1566) : _1564;
    float _4224 = float(uint(_4208));
    float _4226 = as_type<float>(_4040) * _4212;
    float _4228 = _1544 + _1546;
    float _4230 = as_type<float>(_4052) * _4224;
    int _4232 = ~_3858;
    int _4234 = _4232 + 1;
    float _4236 = trunc(_4226);
    float _4238 = precise::max(_4236, 0.0);
    uint _4240 = uint(_4238);
    float _4242 = _4228 + (-1.0);
    float _4244 = float(uint(_4200));
    int _4246 = _4234 * int(_4172);
    int _4248 = _4246 + _4074;
    float _4250 = fma(_4242, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _4252 = ~_3990;
    int _4254 = _4252 + 1;
    float _4256 = as_type<float>(_4062) * _4244;
    float _4258 = trunc(_4230);
    float _4260 = precise::max(_4258, 0.0);
    uint _4262 = uint(_4260);
    int _4264 = ~_3978;
    int _4266 = _4264 + 1;
    int _4268 = _4204 * int(_4192);
    int _4270 = _4268 + _4136;
    float _4272 = float(uint(_4248));
    float _4274 = trunc(_4186);
    float _4276 = precise::max(_4274, 0.0);
    uint _4278 = uint(_4276);
    float _4280 = as_type<float>(_4104) * _4272;
    int _4282 = int(_4102) + int(_4240);
    int _4284 = _4254 * int(_4218);
    int _4286 = _4284 + _4160;
    float _4288 = float(uint(_4270));
    int _4290 = ~_4080;
    int _4292 = _4290 + 1;
    float _4294 = trunc(_4210);
    float _4296 = precise::max(_4294, 0.0);
    uint _4298 = uint(_4296);
    int _4300 = int(_4130) + int(_4262);
    float _4302 = as_type<float>(_4144) * _4288;
    float _4304 = float(uint(_4286));
    bool _4306 = !_3108;
    float _4308 = _4306 ? _213 : as_type<float>(_2342);
    bool _4310 = _1544 > 0.5;
    float _4312 = trunc(_4256);
    float _4314 = precise::max(_4312, 0.0);
    uint _4316 = uint(_4314);
    int _4318 = _4266 * int(_4278);
    int _4320 = _4318 + _4088;
    float _4322 = as_type<float>(_4076) * _4304;
    int _4324 = ~_3684;
    int _4326 = _4324 + 1;
    float _4328 = float(uint(_4320));
    int _4330 = _4292 * int(_4298);
    int _4332 = _4330 + _4132;
    float _4334 = trunc(_4280);
    float _4336 = precise::max(_4334, 0.0);
    uint _4338 = uint(_4336);
    float _4340 = -_213;
    int _4342 = _4310 ? as_type<int>(_4340) : as_type<int>(_213);
    float _4344 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4346 = as_type<float>(_4110) * _4328;
    float _4348 = float(uint(_4332));
    float _4350 = fma(_4166, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4344);
    int _4352 = int(_4150) + int(_4316);
    float _4354 = trunc(_4302);
    float _4356 = precise::max(_4354, 0.0);
    uint _4358 = uint(_4356);
    float _4360 = as_type<float>(_4152) * _4348;
    int _4362 = ~_3752;
    int _4364 = _4362 + 1;
    float _4366 = _4166 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _4368 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4350);
    int _4370 = _4326 * _4282;
    int _4372 = _4370 + _3994;
    float _4374 = as_type<float>(_4326);
    float _4376 = as_type<float>(_4372);
    float _4378 = as_type<float>(_4172);
    float _4380 = as_type<float>(_4192);
    float _4382 = _4302;
    if (_3754)
    {
        _4374 = _1544;
    }
    float _4384 = _4374;
    float _4386 = trunc(_4360);
    float _4388 = precise::max(_4386, 0.0);
    uint _4390 = uint(_4388);
    int _4392 = _4364 * _4300;
    int _4394 = _4392 + _4032;
    int _4396 = int(_4172) + int(_4338);
    float _4398 = -_4368;
    float _4400 = _4398 + 1.0;
    bool _4402 = !_3134;
    float _4404 = _4402 ? _213 : as_type<float>(_4342);
    bool _4406 = uint(_4394) >= uint(_3752);
    float _4408 = trunc(_4346);
    float _4410 = precise::max(_4408, 0.0);
    uint _4412 = uint(_4410);
    int _4414 = int(_4192) + int(_4358);
    int _4416 = ~_3858;
    int _4418 = _4416 + 1;
    int _4420 = ~_4016;
    int _4422 = _4420 + 1;
    bool _4424 = uint(_4372) >= uint(_3684);
    float _4426 = trunc(_4322);
    float _4428 = precise::max(_4426, 0.0);
    uint _4430 = uint(_4428);
    int _4432 = int(_4298) + int(_4390);
    int _4434 = _4418 * _4396;
    int _4436 = _4434 + _4074;
    float _4438 = as_type<float>(_4358);
    float _4440 = _4384;
    if (!_3686)
    {
        _4376 = _1548;
    }
    float _4442 = _4376;
    int _4444 = _4422 * _4414;
    int _4446 = _4444 + _4136;
    float _4448 = _4442;
    if (!_3686)
    {
        _4378 = _1548;
    }
    float _4450 = _4378;
    float _4452 = _4450;
    if (!_3686)
    {
        _4380 = _1546;
    }
    float _4454 = _4380;
    int _4456 = ~_3876;
    int _4458 = _4456 + 1;
    float _4460 = _4454;
    if (!_3686)
    {
        _4382 = _1546;
    }
    float _4462 = _4382;
    int _4464 = int(_4278) + int(_4412);
    int _4466 = _4458 * _4352;
    int _4468 = _4466 + _4038;
    int _4470 = ~_3978;
    int _4472 = _4470 + 1;
    float _4474 = _4462;
    if (_3686)
    {
        _4448 = _1546;
    }
    float _4476 = _4448;
    if (_3686)
    {
        _4452 = _1546;
    }
    float _4478 = _4452;
    int _4480 = _4472 * _4464;
    int _4482 = _4480 + _4088;
    if (_3686)
    {
        _4460 = _1544;
    }
    float _4484 = _4460;
    float _4486 = _4484;
    if (_3686)
    {
        _4474 = _1544;
    }
    float _4488 = _4474;
    int _4490 = ~_4080;
    int _4492 = _4490 + 1;
    bool _4494 = uint(_4468) >= uint(_3876);
    int _4496 = int(_4218) + int(_4430);
    int _4498 = _4492 * _4432;
    int _4500 = _4498 + _4132;
    int _4502 = ~_3990;
    int _4504 = _4502 + 1;
    if (_3754)
    {
        _4438 = _1546;
    }
    float _4506 = _4438;
    float _4508 = _4506;
    if (!_3754)
    {
        _4440 = _1548;
    }
    float _4510 = _4440;
    int _4512 = _4504 * _4496;
    int _4514 = _4512 + _4160;
    if (!_3754)
    {
        _4508 = _1544;
    }
    float _4516 = _4508;
    bool _4518 = !_4424;
    int _4520 = _4518 ? 0 : (-1);
    float _4522 = _4510 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _4524 = uint(_4436) >= uint(_3858);
    bool _4526 = !_4406;
    int _4528 = _4526 ? 0 : (-1);
    bool _4530 = uint(_4446) >= uint(_4016);
    bool _4532 = !_4494;
    int _4534 = _4532 ? 0 : (-1);
    int _4536 = ~_4282;
    int _4538 = _4536 + _4520;
    int _4540 = _4538 + 1;
    bool _4542 = !_4524;
    int _4544 = _4542 ? 0 : (-1);
    int _4546 = ~_4300;
    int _4548 = _4546 + _4528;
    int _4550 = _4548 + 1;
    bool _4552 = uint(_4500) >= uint(_4080);
    int _4554 = ~_4352;
    int _4556 = _4554 + _4534;
    int _4558 = _4556 + 1;
    int _4560 = _3994 ^ _3684;
    bool _4562 = uint(_4514) >= uint(_3990);
    int _4564 = _3684 * _4540;
    int _4566 = _4564 + _3994;
    bool _4568 = uint(_4482) >= uint(_3978);
    int _4570 = _3752 * _4550;
    int _4572 = _4570 + _4032;
    int _4574 = ~_4396;
    int _4576 = _4574 + _4544;
    int _4578 = _4576 + 1;
    float _4580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4582 = !_4552;
    int _4584 = _4582 ? 0 : (-1);
    bool _4586 = !_4530;
    int _4588 = _4586 ? 0 : (-1);
    int _4590 = _3858 * _4578;
    int _4592 = _4590 + _4074;
    bool _4594 = _3752 == 0;
    uint _4596 = uint(int(uint(_4560) >> uint(31)));
    bool _4598 = _3684 == 0;
    bool _4600 = !_4594;
    int _4602 = _4600 ? _4572 : (-1);
    int _4604 = ~_4588;
    int _4606 = _4414 + _4604;
    int _4608 = _4606 + 1;
    int _4610 = ~int(_4596);
    int _4612 = _4610 + 1;
    float _4614 = _4580 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4616 = !_4598;
    int _4618 = _4616 ? _4566 : (-1);
    bool _4620 = _3858 == 0;
    bool _4622 = _3752 == 0;
    int _4624 = _4032 ^ _3752;
    bool _4626 = !_4562;
    int _4628 = _4626 ? 0 : (-1);
    int _4630 = _4608 ^ _4612;
    bool _4632 = !_4568;
    int _4634 = _4632 ? 0 : (-1);
    bool _4636 = _3684 == 0;
    int _4638 = _3876 * _4558;
    int _4640 = _4638 + _4038;
    bool _4642 = !_4620;
    int _4644 = _4642 ? _4592 : (-1);
    bool _4646 = _3876 == 0;
    bool _4648 = _3876 == 0;
    int _4650 = _4038 ^ _3876;
    uint _4652 = uint(int(uint(_4624) >> uint(31)));
    int _4654 = ~_4612;
    int _4656 = _4654 + _4630;
    int _4658 = _4656 + 1;
    float _4660 = _1544 * 2.0;
    int _4662 = ~_4634;
    int _4664 = _4464 + _4662;
    int _4666 = _4664 + 1;
    uint _4668 = uint(int(uint(_4650) >> uint(31)));
    int _4670 = ~int(_4652);
    int _4672 = _4670 + 1;
    int _4674 = ~_4628;
    int _4676 = _4496 + _4674;
    int _4678 = _4676 + 1;
    float _4680 = floor(_4660);
    int _4682 = _4074 ^ _3858;
    float _4684 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4686 = _3452 + _4684;
    int _4688 = ~int(_4668);
    int _4690 = _4688 + 1;
    int _4692 = _4678 ^ _4672;
    uint _4694 = uint(int(uint(_4682) >> uint(31)));
    float _4696 = _1548 * 2.0;
    int _4698 = _4666 ^ _4690;
    bool _4700 = !_4636;
    int _4702 = _4700 ? _4658 : (-1);
    int _4704 = ~_4672;
    int _4706 = _4704 + _4692;
    int _4708 = _4706 + 1;
    float _4710 = _1546 + _1548;
    bool _4712 = _3858 == 0;
    float _4714 = _1546 * 2.0;
    int _4716 = ~_4584;
    int _4718 = _4432 + _4716;
    int _4720 = _4718 + 1;
    float _4722 = floor(_4696);
    int _4724 = ~int(_4694);
    int _4726 = _4724 + 1;
    float _4728 = _4710 + (-1.0);
    int _4730 = ~_4690;
    int _4732 = _4730 + _4698;
    int _4734 = _4732 + 1;
    int _4736 = _4720 ^ _4726;
    float _4738 = floor(_4714);
    bool _4740 = !_4646;
    int _4742 = _4740 ? _4640 : (-1);
    bool _4744 = !_4622;
    int _4746 = _4744 ? _4708 : (-1);
    bool _4748 = _4680 > 0.0;
    bool _4750 = _4680 >= 0.0;
    bool _4752 = isnan(_4680);
    bool _4754 = _4750 || _4752;
    bool _4756 = isnan(0.0);
    bool _4758 = _4754 || _4756;
    float _4760 = fma(_4728, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _4762 = ~_4726;
    int _4764 = _4762 + _4736;
    int _4766 = _4764 + 1;
    float _4768 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4770 = _3460 + _4768;
    float _4772 = _4686 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _4774 = _4758 ? 0 : 1;
    float _4776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4778 = !_4712;
    int _4780 = _4778 ? _4766 : (-1);
    float _4782 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4784 = _3478 + _4782;
    float _4786 = fma(_4770, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4772);
    bool _4788 = _4722 >= 0.0;
    bool _4790 = isnan(_4722);
    bool _4792 = _4788 || _4790;
    bool _4794 = isnan(0.0);
    bool _4796 = _4792 || _4794;
    bool _4798 = !_4648;
    int _4800 = _4798 ? _4734 : (-1);
    float _4802 = fma(_4784, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4786);
    int _4804 = _4796 ? 0 : 1;
    float _4806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _4808 = _4738 > 0.0;
    bool _4810 = _4802 >= 0.0;
    bool _4812 = _4738 >= 0.0;
    bool _4814 = isnan(_4738);
    bool _4816 = _4812 || _4814;
    bool _4818 = isnan(0.0);
    bool _4820 = _4816 || _4818;
    float _4822 = _4776 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4824 = ~_4774;
    int _4826 = _4824 + 1;
    int _4828 = _4826 + 1;
    float _4830 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _4832 = _4828;
    if (!_4748)
    {
        int _4834 = ~_4774;
        int _4836 = _4834 + 1;
        _4832 = _4836;
    }
    int _4838 = _4832;
    bool _4840 = _4722 > 0.0;
    float _4842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _4844 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _4846 = fma(_4222, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4830);
    float _4848 = _4222 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _4850 = fma(_4488, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4844);
    float _4852 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _4854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _4856 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4858 = _2208 + 0.5;
    float _4860 = fma(_4848, -2.0, _4852);
    float _4862 = -_2234;
    float _4864 = _4862 + 0.5;
    float _4866 = -_4856;
    float _4868 = fma(_4366, 2.0, _4866);
    float _4870 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _4872 = fma(_3378, _3306, _3506);
    float _4874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _4876 = _4858 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _4878 = fma(_4478, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4870);
    float _4880 = _4864 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _4882 = _4876 * _4842;
    float _4884 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _4886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _4888 = _4880 * _4854;
    float _4890 = _4484 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _4892 = -_4884;
    float _4894 = fma(_4522, 2.0, _4892);
    float _4896 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _4898 = as_type<int>(_4882);
    if (_4810)
    {
        _4486 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4900 = _4486;
    float _4902 = _4476 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _4904 = _4516 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _4906 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _4908 = _4874 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _4910 = _1604 + 0.5;
    float _4912 = -_165;
    float _4914 = fma(_4912, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4868);
    out.m_82.x = _4882;
    out.m_82.y = _4888;
    float _4916 = -_4896;
    float _4918 = fma(_4890, 2.0, _4916);
    float _4920 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _4922 = fma(_4908, _4910, _4914);
    float _4924 = fma(_3426, _3288, _4872);
    float _4926 = _4886 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _4928 = _1650 + (-0.5);
    float _4930 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4860);
    float _4932 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4846);
    if (_4810)
    {
        float _4934 = _4900 * 5.0;
        _4898 = as_type<int>(_4934);
    }
    int _4936 = _4898;
    float _4938 = fma(_4904, -2.0, _4906);
    float _4940 = fma(_4902, -2.0, _4920);
    float _4942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _4944 = -_4926;
    float _4946 = -_4930;
    float _4948 = fma(_4944, _4928, _4946);
    if (_4810)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14428 = as_type<float>(_4936);
        out.gl_Position.z = _14428;
    }
    float _4950 = fma(_3208, (*spvDescriptorSet0.vp_c9)._m0[174].x, _4924);
    float _4952 = float(_4602);
    float _4954 = -_165;
    float _4956 = fma(_4954, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4894);
    float _4958 = float(_4644);
    float _4960 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4938);
    float _4962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _4964 = float(_4618);
    out.m_84.x = _4950;
    float _4966 = float(_4742);
    float _4968 = _4806 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _4970 = float(_4800);
    float _4972 = -_4400;
    float _4974 = fma(_4972, _1604, _4922);
    float _4976 = -_4932;
    float _4978 = _4976 + 1.0;
    float _4980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _4982 = fma(_4614, _4964, _3710);
    float _4984 = _1690 + 0.5;
    float _4986 = fma(_4978, _1650, _4948);
    float _4988 = -_165;
    float _4990 = fma(_4988, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4918);
    float _4992 = float(_4702);
    float _4994 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4940);
    bool _4996 = !_3072;
    float _4998 = _4996 ? _223 : as_type<float>(_2334);
    float _5000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_86.x = _4974;
    out.m_86.y = _4986;
    float _5002 = fma(_4822, _4952, _4990);
    float _5004 = _4942 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _5006 = _4962 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _5008 = float(_4746);
    float _5010 = -_3784;
    float _5012 = fma(_4968, _4992, _5010);
    float _5014 = fma(_5004, _4958, _4096);
    float _5016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _5018 = fma(_5006, _4966, _4956);
    float _5020 = float(_4780);
    float _5022 = _4308 + 0.5;
    float _5024 = _4404 + 0.5;
    float _5026 = fma(_5006, _4984, _5018);
    float _5028 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4162);
    float _5030 = fma(_4822, _5022, _5002);
    float _5032 = _4980 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5034 = _1594 + 0.5;
    float _5036 = fma(_4614, _5024, _4982);
    float _5038 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4878);
    float _5040 = -_4994;
    float _5042 = fma(_5032, _5008, _5040);
    float _5044 = fma(_5004, _5034, _5014);
    float _5046 = _5000 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5048 = _1806 + (-0.5);
    float _5050 = _5016 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _5052 = -_4960;
    float _5054 = fma(_5046, _4970, _5052);
    float _5056 = _4998 + (-0.5);
    float _5058 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4850);
    float _5060 = -_5028;
    float _5062 = fma(_5050, _5020, _5060);
    float _5064 = _5028;
    if (!_3102)
    {
        _5064 = _223;
    }
    float _5066 = _5064;
    float _5068 = -_4968;
    float _5070 = fma(_5068, _5056, _5012);
    float _5072 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _5074 = -_5032;
    float _5076 = fma(_5074, _5048, _5042);
    float _5078 = _1694 + (-0.5);
    float _5080 = _5066;
    if (_3102)
    {
        float _5082 = -_223;
        float _5084 = _3640 ? _5082 : _223;
        _5080 = _5084;
    }
    float _5086 = _5080;
    float _5088 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[88].z, _5072);
    float _5090 = -_5046;
    float _5092 = fma(_5090, _5078, _5054);
    float _5094 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[87].z, _5088);
    float _5096 = _5086 + (-0.5);
    float _5098 = -_5058;
    float _5100 = _5098 + 1.0;
    int _5102 = ~_4804;
    int _5104 = _5102 + 1;
    int _5106 = _5104 + 1;
    float _5108 = -_5094;
    float _5110 = _5108 + 1.0;
    float _5112 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _5114 = -_5050;
    float _5116 = fma(_5114, _5096, _5062);
    float _5118 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _5120 = -_5110;
    float _5122 = fma(_1690, _5120, _5026);
    float _5124 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[78].z, _5112);
    float _5126 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _5128 = log2(_5126);
    float _5130 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[88].w, _5118);
    float _5132 = -_4158;
    float _5134 = _5132 + 1.0;
    float _5136 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[77].z, _5124);
    float _5138 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[87].w, _5130);
    float _5140 = -_5134;
    float _5142 = fma(_5140, _1594, _5044);
    float _5144 = -_5136;
    float _5146 = _5144 + 1.0;
    float _5148 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _5150 = _4686 * _4686;
    float _5152 = -_5138;
    float _5154 = _5152 + 1.0;
    float _5156 = -_5146;
    float _5158 = fma(_4404, _5156, _5036);
    float _5160 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[78].w, _5148);
    float _5162 = fma(_4770, _4770, _5150);
    float _5164 = fma(_1694, _5154, _5092);
    float _5166 = _5128 * _165;
    float _5168 = -_5038;
    float _5170 = _5168 + 1.0;
    float _5172 = fma(_4784, _4784, _5162);
    float _5174 = -_4180;
    float _5176 = _5174 + 1.0;
    float _5178 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[77].w, _5160);
    float _5180 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _5182 = 1.0 + _5180;
    float _5184 = exp2(_5166);
    float _5186 = fma(_5176, _5086, _5116);
    float _5188 = fma(_1806, _5170, _5076);
    float _5190 = in.m_88.x;
    float _5192 = in.m_88.y;
    float _5194 = in.m_88.z;
    float _5196 = -_5178;
    float _5198 = _5196 + 1.0;
    float _5200 = -_5100;
    float _5202 = fma(_4308, _5200, _5030);
    int _5204 = _5106;
    if (!_4840)
    {
        int _5206 = ~_4804;
        int _5208 = _5206 + 1;
        _5204 = _5208;
    }
    int _5210 = _5204;
    out.m_90.x = _5122;
    out.m_90.y = _5164;
    float _5212 = rsqrt(_5172);
    float _5214 = fma(_4998, _5198, _5070);
    int _5216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _5218 = _5216 != 0;
    int _5220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _5222 = _5220 != 0;
    int _5224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _5226 = _5224 != 0;
    out.m_92.x = _5142;
    out.m_92.y = _5186;
    bool _5228 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _5230 = isnan(0.0);
    bool _5232 = _5228 || _5230;
    bool _5234 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _5236 = _5232 || _5234;
    out.m_94.x = _5158;
    out.m_94.y = _5214;
    out.m_94.z = _5202;
    out.m_94.w = _5188;
    float _5238 = 1.0 / _5182;
    float _5240 = -_5184;
    float _5242 = _5240 + 1.0;
    bool _5244 = !_5222;
    int _5246 = _5244 ? 0 : 1;
    if (_4810)
    {
        out.m_63.x = 0.0;
    }
    bool _5248 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _5250 = isnan(1.0);
    bool _5252 = _5248 || _5250;
    bool _5254 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _5256 = _5252 || _5254;
    float _5258 = _5236 ? _5242 : 0.0;
    float _5260 = _4686 * _5212;
    float _5262 = _4770 * _5212;
    bool _5264 = !_5226;
    int _5266 = _5264 ? 0 : 1;
    bool _5268 = !_5218;
    int _5270 = _5268 ? 0 : 1;
    if (_4810)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5272 = -_5260;
    float _5274 = fma(_5272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3452);
    float _5276 = _4784 * _5212;
    float _5278 = -_5262;
    float _5280 = fma(_5278, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3460);
    int _5282 = abs(_5270);
    float _5284 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5286 = _5274 + _5284;
    float _5288 = -_5276;
    float _5290 = fma(_5288, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3478);
    float _5292 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5294 = _5280 + _5292;
    float _5296 = float(_5210);
    float _5298 = _5286 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5300 = float(_5282);
    float _5302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5304 = _5290 + _5302;
    int _5306 = as_type<int>(_5274);
    if (_5256)
    {
        float _5308 = _5258 * _5238;
        _167 = _5308;
    }
    float _5310 = _167;
    float _5312 = fma(_5294, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5298);
    float _5314 = -_5260;
    float _5316 = fma(_5314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4686);
    float _5318 = _5300 * _5296;
    float _5320 = -_5262;
    float _5322 = fma(_5320, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4770);
    float _5324 = fma(_5304, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5312);
    float _5326 = _5316 * _5316;
    float _5328 = _5318 * (-2.0);
    float _5330 = _1544 + (-0.5);
    int _5332 = abs(_5246);
    float _5334 = fma(_5322, _5322, _5326);
    bool _5336 = _5324 >= 0.0;
    float _5338 = -_5276;
    float _5340 = fma(_5338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4784);
    float _5342 = fma(_5328, _5190, _5190);
    float _5344 = fma(_4250, _5328, _4250);
    float _5346 = float(_4838);
    float _5348 = fma(_5340, _5340, _5334);
    float _5350 = fma(_5330, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5342);
    float _5352 = float(_5332);
    float _5354 = _1546 + (-0.5);
    int _5356 = _4820 ? 0 : 1;
    float _5358 = fma(_5344, _5310, _5350);
    float _5360 = sqrt(_5348);
    float _5362 = _5352 * _5346;
    float _5364 = _5340;
    if (_5336)
    {
        _5364 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5366 = _5364;
    float _5368 = _5358 * 0.15915493667125701904296875;
    int _5370 = as_type<int>(_5366);
    if (_5336)
    {
        out.m_63.x = 0.0;
    }
    float _5372 = _5362 * (-2.0);
    int _5374 = ~_5356;
    int _5376 = _5374 + 1;
    int _5378 = _5376 + 1;
    float _5380 = _5368 * 6.283185482025146484375;
    float _5382 = sin(_5380);
    int _5384 = _5378;
    if (_5336)
    {
        float _5386 = _5366 * 5.0;
        _5370 = as_type<int>(_5386);
    }
    int _5388 = _5370;
    float _5390 = fma(_4760, _5372, _4760);
    if (!_4808)
    {
        int _5392 = ~_5356;
        int _5394 = _5392 + 1;
        _5384 = _5394;
    }
    int _5396 = _5384;
    float _5398 = fma(_5372, _5192, _5192);
    int _5400 = abs(_5266);
    if (_5336)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _15159 = as_type<float>(_5388);
        out.gl_Position.z = _15159;
    }
    if (_5336)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5402 = -_3452;
    float _5404 = _5402 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5406 = float(_5396);
    float _5408 = -_3460;
    float _5410 = _5408 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5412 = _5404 * _5404;
    float _5414 = -_3478;
    float _5416 = _5414 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5418 = _1544 + _1548;
    float _5420 = float(_5400);
    float _5422 = fma(_5410, _5410, _5412);
    float _5424 = fma(_5354, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5398);
    float _5426 = _5418 + (-1.0);
    float _5428 = _1548 + (-0.5);
    float _5430 = fma(_5416, _5416, _5422);
    float _5432 = _5420 * _5406;
    float _5434 = fma(_5390, _5310, _5424);
    float _5436 = _5368 * 6.283185482025146484375;
    float _5438 = cos(_5436);
    float _5440 = _5432 * (-2.0);
    float _5442 = _617 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5444 = fma(_5426, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5446 = _5434 * 0.15915493667125701904296875;
    float _5448 = fma(_5440, _5194, _5194);
    float _5450 = fma(_5444, _5440, _5444);
    float _5452 = rsqrt(_5430);
    float _5454 = fma(_5428, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5448);
    float _5456 = fma(_5450, _5310, _5454);
    float _5458 = _5446 * 6.283185482025146484375;
    float _5460 = sin(_5458);
    float _5462 = _5456 * 0.15915493667125701904296875;
    float _5464 = _5410 * _5452;
    float _5466 = _5416 * _5452;
    float _5468 = _5404 * _5452;
    float _5470 = _5446 * 6.283185482025146484375;
    float _5472 = cos(_5470);
    float _5474 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5476 = _5464 * _5474;
    float _5478 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5480 = _5466 * _5478;
    float _5482 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5484 = _5468 * _5482;
    float _5486 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5488 = -_5476;
    float _5490 = fma(_5466, _5486, _5488);
    float _5492 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5494 = -_5480;
    float _5496 = fma(_5468, _5492, _5494);
    float _5498 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5500 = -_5484;
    float _5502 = fma(_5464, _5498, _5500);
    float _5504 = _5462 * 6.283185482025146484375;
    float _5506 = sin(_5504);
    float _5508 = _5490 * _5490;
    float _5510 = _5382 * _5460;
    float _5512 = _5212 * _5360;
    float _5514 = _5438 * _5460;
    float _5516 = fma(_5496, _5496, _5508);
    float _5518 = _5512 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _5520 = _5518 * 0.5;
    float _5522 = _5462 * 6.283185482025146484375;
    float _5524 = cos(_5522);
    float _5526 = fma(_5502, _5502, _5516);
    float _5528 = _5438 * _5472;
    float _5530 = _5382 * _5472;
    float _5532 = rsqrt(_5526);
    float _5534 = fma(_5506, _5528, _5510);
    float _5536 = fma(_5506, _5510, _5528);
    float _5538 = _5438 * _5524;
    float _5540 = _5472 * _5524;
    float _5542 = _5382 * _5524;
    float _5544 = _5460 * _5524;
    float _5546 = _619 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _5550 = _5512 * _5442;
    float _5552 = -_5514;
    float _5554 = fma(_5506, _5530, _5552);
    float _5556 = -_5530;
    float _5558 = fma(_5506, _5514, _5556);
    float _5560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _5562 = _5512 * _5546;
    float _5564 = _5548 * _5550;
    float _5566 = _5496 * _5532;
    float _5568 = _5490 * _5532;
    float _5570 = _5560 * _5562;
    float _5572 = _5538 * _5564;
    float _5574 = -_5564;
    float _5576 = _5506 * _5574;
    float _5578 = _5502 * _5532;
    float _5580 = _5466 * _5568;
    float _5582 = fma(_5534, _5570, _5572);
    float _5584 = _5468 * _5566;
    float _5586 = _5542 * _5564;
    float _5588 = fma(_5540, _5570, _5576);
    float _5590 = fma(_5558, _5520, _5582);
    float _5592 = -_5580;
    float _5594 = fma(_5468, _5578, _5592);
    float _5596 = -_5584;
    float _5598 = fma(_5464, _5568, _5596);
    float _5600 = fma(_5554, _5570, _5586);
    float _5602 = fma(_5544, _5520, _5588);
    float _5604 = _5594 * _5590;
    float _5606 = _5598 * _5590;
    float _5608 = fma(_5536, _5520, _5600);
    float _5610 = fma(_5566, _5602, _5604);
    float _5612 = fma(_5578, _5602, _5606);
    float _5614 = fma(_5464, _5608, _5610);
    float _5616 = fma(_5466, _5608, _5612);
    float _5618 = _3460 + _5614;
    float _5620 = _3478 + _5616;
    float _5622 = _5464 * _5578;
    float _5624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5626 = _5618 + _5624;
    float _5628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5630 = _5620 + _5628;
    float _5632 = -_5622;
    float _5634 = fma(_5466, _5566, _5632);
    float _5636 = _5626 * _5626;
    float _5638 = _5630 * _5630;
    float _5640 = _5634 * _5590;
    float _5642 = _5636 + _5638;
    float _5644 = fma(_5568, _5602, _5640);
    float _5646 = sqrt(_5642);
    float _5648 = fma(_5468, _5608, _5644);
    float _5650 = _3452 + _5648;
    bool _5652 = _5646 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5654 = _5622;
    float _5656 = _5618;
    float _5658 = _5620;
    float _5660 = _5636;
    float _5662 = _5638;
    if (!_5652)
    {
        _5654 = _5650;
    }
    float _5664 = _5654;
    bool _5666 = !_5652;
    float _5668 = _5664;
    if (!_5666)
    {
        float _5670 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5674 = _5646 + _5672;
        float _5676 = _5650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5678 = rsqrt(_5642);
        float _5680 = _5674 * _5670;
        float _5682 = _5680 * 0.15915493667125701904296875;
        float _5684 = _5682 * 6.283185482025146484375;
        float _5686 = sin(_5684);
        float _5688 = _5682 * 6.283185482025146484375;
        float _5690 = cos(_5688);
        float _5692 = fma(_5686, _5676, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5694 = _5678 * _5692;
        float _5696 = _5690 + (-1.0);
        float _5698 = fma(_5626, _5694, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5700 = fma(_5630, _5694, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5702 = _5696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5704 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5706 = _5698 + _5704;
        float _5708 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5710 = _5700 + _5708;
        float _5712 = fma(_5650, _5690, _5702);
        float _5714 = _5706 * _5706;
        float _5716 = _5710 * _5710;
        _5656 = _5698;
        _5658 = _5700;
        _5668 = _5712;
        _5660 = _5714;
        _5662 = _5716;
    }
    float _5718 = _5656;
    float _5720 = _5658;
    float _5722 = _5668;
    float _5724 = _5660;
    float _5726 = _5662;
    float _5728 = fma(_5718, 6.2500002968590706586837768554688e-05, 0.5);
    float _5730 = fma(_5720, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _15666 = float2(_5728, _5730);
    float3 _5734 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_15666, float2(0.0), isnan(_15666)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_15666, float2(0.0), isnan(_15666)), level(0.0)).xyz;
    float _5736 = _5734.x;
    float _5738 = _5734.y;
    float _5740 = _5734.z;
    float _5742 = _5534 * _5594;
    float _5744 = _5534 * _5634;
    float _5746 = _5534 * _5598;
    float _5748 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5750 = _5538 * _5598;
    float _5752 = _5558 * _5594;
    float _5754 = _5558 * _5634;
    float _5756 = _5558 * _5598;
    float _5758 = fma(_5540, _5566, _5742);
    float _5760 = fma(_5540, _5568, _5744);
    float _5762 = fma(_5540, _5578, _5746);
    float _5764 = fma(_5748, _5748, 1.0);
    float _5766 = _5538 * _5634;
    float _5768 = _5538 * _5594;
    float _5770 = fma(_5544, _5568, _5754);
    float _5772 = rsqrt(_5764);
    float _5774 = -_5506;
    float _5776 = fma(_5774, _5568, _5766);
    float _5778 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5780 = _5722 + _5778;
    float _5782 = -_5506;
    float _5784 = fma(_5782, _5566, _5768);
    float _5786 = -_5506;
    float _5788 = fma(_5786, _5578, _5750);
    float _5790 = fma(_5544, _5566, _5752);
    float _5792 = fma(_5780, _5780, _5724);
    float _5794 = fma(_5544, _5578, _5756);
    float _5796 = fma(_5542, _5464, _5784);
    float _5798 = fma(_5542, _5468, _5776);
    float _5800 = fma(_5542, _5466, _5788);
    float _5802 = fma(_5536, _5464, _5790);
    float _5804 = _5792 + _5726;
    float _5806 = fma(_5536, _5468, _5770);
    float _5808 = fma(_5536, _5466, _5794);
    float _5810 = fma(_5554, _5464, _5758);
    float _5812 = _5748 * _5772;
    float _5814 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5816 = _5748 * _5796;
    float _5818 = fma(_5554, _5468, _5760);
    float _5820 = _5748 * _5798;
    float _5822 = fma(_5554, _5466, _5762);
    float _5824 = _5748 * _5800;
    float _5826 = -_5802;
    float _5828 = _5812 * _5826;
    float _5830 = -_5806;
    float _5832 = _5812 * _5830;
    float _5834 = -_5808;
    float _5836 = _5812 * _5834;
    float _5838 = fma(_5814, _5810, _5816);
    float _5840 = sqrt(_5804);
    float _5842 = fma(_5814, _5818, _5820);
    float _5844 = fma(_5814, _5822, _5824);
    float _5846 = fma(_5772, _5796, _5828);
    float _5848 = fma(_5772, _5798, _5832);
    float _5850 = _5806 + _5842;
    float _5852 = fma(_5772, _5800, _5836);
    float _5854 = _5802 + _5838;
    float _5856 = _5808 + _5844;
    out.m_96.x = _5810;
    out.m_96.y = _5818;
    out.m_96.z = _5822;
    out.m_98.x = _5846;
    out.m_98.y = _5848;
    out.m_98.z = _5852;
    bool _5858 = _5840 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5860 = isnan(_5840);
    bool _5862 = _5858 || _5860;
    bool _5864 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5866 = _5862 || _5864;
    out.m_100.x = _5854;
    out.m_100.y = _5850;
    out.m_100.z = _5856;
    float _5868 = _5802;
    if (!_5866)
    {
        _5868 = 1.0;
    }
    float _5870 = _5868;
    out.m_102.x = _5736;
    out.m_102.y = _5738;
    out.m_102.z = _5740;
    bool _5872 = !_5866;
    float _5874 = _5870;
    if (!_5872)
    {
        bool _5876 = _5840 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5878 = isnan(_5840);
        bool _5880 = _5876 || _5878;
        bool _5882 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5884 = _5880 || _5882;
        if (!_5884)
        {
            float _5886 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5888 = _5840 + _5886;
            float _5890 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5892 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5890;
            float _5894 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5896 = _5894 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5898 = 1.0 / _5892;
            float _5900 = _5888 * _5898;
            float _5902 = fma(_5900, _5896, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5874 = _5902;
            _5904 = true;
        }
        else
        {
            bool _5906 = _5840 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5908 = isnan(_5840);
            bool _5910 = _5906 || _5908;
            bool _5912 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5914 = _5910 || _5912;
            if (!_5914)
            {
                float _5916 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5918 = _5840 + _5916;
                float _5920 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5922 = _5920 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5924 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5926 = _5924 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5928 = 1.0 / _5922;
                float _5930 = _5918 * _5928;
                float _5932 = fma(_5930, _5926, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5874 = _5932;
                _5904 = true;
            }
            else
            {
                _5874 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5904 = false;
    float _5934 = _5874;
    float _5936 = fma(_5280, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _5938 = fma(_5290, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _5940 = floor(_5936);
    float _5942 = floor(_5938);
    float _5944 = -_5940;
    float _5946 = _5936 + _5944;
    float _5948 = -_5942;
    float _5950 = _5938 + _5948;
    float2 _16060 = float2(_5946, _5950);
    float _5952 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16060, float2(0.0), isnan(_16060)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16060, float2(0.0), isnan(_16060)), level(0.0)).x;
    float _5954 = _5274 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5956 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5958 = _5718 + _5956;
    float _5960 = fma(_5280, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5954);
    float _5962 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5964 = _5720 + _5962;
    float _5966 = fma(_5958, _5934, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5968 = fma(_5290, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5960);
    float _5970 = _5274 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5972 = fma(_5964, _5934, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5974 = -_3460;
    float _5976 = _5974 + _5966;
    float _5978 = _5968 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5980 = fma(_5280, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5970);
    float _5982 = -_3478;
    float _5984 = _5982 + _5972;
    float _5986 = 1.0 / _5978;
    float _5988 = fma(_5290, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5980);
    float _5990 = _5988 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5992 = _5990 + _5978;
    float _5994 = _5992 * _5986;
    float _5996 = _5994 * 0.5;
    float _5998 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6000 = fma(_5996, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5998);
    float _6002 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _6004 = _5274 + _6002;
    float _6006 = 1.0 / _6000;
    float _6008 = _6004 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _6010 = fma(_5280, (*spvDescriptorSet0.vp_c15)._m0[126].x, _6008);
    float _6012 = fma(_5290, (*spvDescriptorSet0.vp_c15)._m0[126].z, _6010);
    float _6014 = _6012 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _6016 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6018 = _6006 * _6016;
    float _6020 = _6004 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _6022 = trunc(_6014);
    int _6024 = int(_6022);
    bool _6026 = _6018 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _6028 = fma(_5280, (*spvDescriptorSet0.vp_c15)._m0[127].x, _6020);
    bool _6030 = _6018 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _6032 = !_6026;
    int _6034 = _6032 ? 0 : 1;
    int _6036 = 2;
    if (!_6026)
    {
        _6036 = 1;
    }
    int _6038 = _6036;
    int _6040 = _6038;
    if (!_6030)
    {
        _6040 = _6034;
    }
    int _6042 = _6040;
    float _6044 = fma(_5290, (*spvDescriptorSet0.vp_c15)._m0[127].z, _6028);
    float _6046 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _6048 = _5722 + _6046;
    int _6050 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _6052 = _6024 + _6050;
    int _6054 = _6052 + 1;
    int _6056 = _6042 << 6;
    float _6058 = _6044 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _6060 = fma(_6048, _5934, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _6062 = _6054 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _6064 = _6056 + 96;
    uint _6066 = uint(int(uint(_6064) >> uint(2)));
    uint _6068 = uint(int(uint(int(_6066)) >> uint(2)));
    int _6070 = int(_6066) & 3;
    float _6072 = (*spvDescriptorSet0.vp_c15)._m0[int(_6068)][_6070];
    int _6074 = int(_6066) + 1;
    uint _6076 = uint(int(uint(_6074) >> uint(2)));
    int _6078 = _6074 & 3;
    float _6080 = (*spvDescriptorSet0.vp_c15)._m0[int(_6076)][_6078];
    float _6082 = trunc(_6058);
    int _6084 = int(_6082);
    float _6086 = -_3452;
    float _6088 = _6086 + _6060;
    float _6090 = _6088 * _6088;
    int _6092 = _6056 + 48;
    uint _6094 = uint(int(uint(_6092) >> uint(2)));
    uint _6096 = uint(int(uint(int(_6094)) >> uint(2)));
    int _6098 = int(_6094) & 3;
    float _6100 = (*spvDescriptorSet0.vp_c15)._m0[int(_6096)][_6098];
    int _6102 = int(_6094) + 1;
    uint _6104 = uint(int(uint(_6102) >> uint(2)));
    int _6106 = _6102 & 3;
    float _6108 = (*spvDescriptorSet0.vp_c15)._m0[int(_6104)][_6106];
    float _6110 = fma(_5976, _5976, _6090);
    float _6112 = fma(_5984, _5984, _6110);
    int _6114 = _6056 + 104;
    uint _6116 = uint(int(uint(_6114) >> uint(2)));
    uint _6118 = uint(int(uint(int(_6116)) >> uint(2)));
    int _6120 = int(_6116) & 3;
    float _6122 = (*spvDescriptorSet0.vp_c15)._m0[int(_6118)][_6120];
    int _6124 = int(_6116) + 1;
    uint _6126 = uint(int(uint(_6124) >> uint(2)));
    int _6128 = _6124 & 3;
    float _6130 = (*spvDescriptorSet0.vp_c15)._m0[int(_6126)][_6128];
    int _6132 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _6134 = _6084 + _6132;
    int _6136 = _6134 + 1;
    float _6138 = sqrt(_6112);
    int _6140 = _6054 | _6136;
    int _6142 = _6056 + 56;
    uint _6144 = uint(int(uint(_6142) >> uint(2)));
    uint _6146 = uint(int(uint(int(_6144)) >> uint(2)));
    int _6148 = int(_6144) & 3;
    float _6150 = (*spvDescriptorSet0.vp_c15)._m0[int(_6146)][_6148];
    int _6152 = int(_6144) + 1;
    uint _6154 = uint(int(uint(_6152) >> uint(2)));
    int _6156 = _6152 & 3;
    float _6158 = (*spvDescriptorSet0.vp_c15)._m0[int(_6154)][_6156];
    bool _6160 = _6140 < 0;
    bool _6162 = _6160 || _6062;
    bool _6164 = _6136 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _6166 = _6164 || _6162;
    bool _6168 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _6170 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _6172 = _6168 || _6170;
    bool _6174 = isnan(0.5);
    bool _6176 = _6172 || _6174;
    int _6178 = _6056 + 64;
    uint _6180 = uint(int(uint(_6178) >> uint(2)));
    uint _6182 = uint(int(uint(int(_6180)) >> uint(2)));
    int _6184 = int(_6180) & 3;
    float _6186 = (*spvDescriptorSet0.vp_c15)._m0[int(_6182)][_6184];
    int _6188 = int(_6180) + 1;
    uint _6190 = uint(int(uint(_6188) >> uint(2)));
    int _6192 = _6188 & 3;
    float _6194 = (*spvDescriptorSet0.vp_c15)._m0[int(_6190)][_6192];
    bool _6196 = _6138 > 0.0;
    int _6198 = _6056 + 72;
    uint _6200 = uint(int(uint(_6198) >> uint(2)));
    uint _6202 = uint(int(uint(int(_6200)) >> uint(2)));
    int _6204 = int(_6200) & 3;
    float _6206 = (*spvDescriptorSet0.vp_c15)._m0[int(_6202)][_6204];
    int _6208 = int(_6200) + 1;
    uint _6210 = uint(int(uint(_6208) >> uint(2)));
    int _6212 = _6208 & 3;
    float _6214 = (*spvDescriptorSet0.vp_c15)._m0[int(_6210)][_6212];
    float _6216 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _6218 = as_type<float>(_6042);
    if (!_6196)
    {
        _6216 = _5966;
    }
    float _6220 = _6216;
    int _6222 = _6056 + 80;
    uint _6224 = uint(int(uint(_6222) >> uint(2)));
    uint _6226 = uint(int(uint(int(_6224)) >> uint(2)));
    int _6228 = int(_6224) & 3;
    float _6230 = (*spvDescriptorSet0.vp_c15)._m0[int(_6226)][_6228];
    int _6232 = int(_6224) + 1;
    uint _6234 = uint(int(uint(_6232) >> uint(2)));
    int _6236 = _6232 & 3;
    float _6238 = (*spvDescriptorSet0.vp_c15)._m0[int(_6234)][_6236];
    float _6240 = _6004 * _6080;
    float _6242 = _6080;
    float _6244 = _6072;
    float _6246 = _6220;
    float _6248 = _6220;
    if (!_6166)
    {
        float _6250 = floor(_6014);
        _6242 = _6250;
    }
    float _6252 = _6242;
    float _6254 = fma(_5280, _6072, _6240);
    if (!_6196)
    {
        _6244 = _6060;
    }
    float _6256 = _6244;
    float _6258 = _6004 * _6108;
    float _6260 = _6108;
    float _6262 = _6256;
    float _6264 = _6256;
    if (!_6196)
    {
        _6260 = _5972;
    }
    float _6266 = _6260;
    float _6268 = fma(_5290, _6122, _6254);
    bool _6270 = !_6196;
    float _6272 = _6266;
    int _6274 = as_type<int>(_6130);
    float _6276 = _6206;
    if (!_6270)
    {
        float _6278 = _227 * _227;
        float _6280 = fma(_225, _225, _6278);
        float _6282 = fma(_229, _229, _6280);
        float _6284 = rsqrt(_6112);
        float _6286 = sqrt(_6282);
        float _6288 = _5976 * _6284;
        float _6290 = _6088 * _6284;
        float _6292 = _5984 * _6284;
        bool _6294 = _6286 > 0.0;
        float _6296 = _6286;
        if (!_6294)
        {
            _6246 = _5966;
        }
        float _6298 = _6246;
        _6248 = _6298;
        if (!_6294)
        {
            _6262 = _6060;
        }
        float _6300 = _6262;
        _6264 = _6300;
        if (!_6294)
        {
            _6296 = _5972;
        }
        float _6302 = _6296;
        bool _6304 = !_6294;
        _6272 = _6302;
        if (!_6304)
        {
            float _6306 = rsqrt(_6282);
            float _6308 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _6310 = _227 * _6306;
            float _6312 = _225 * _6306;
            float _6314 = _6290 * _6310;
            float _6316 = _229 * _6306;
            float _6318 = fma(_6288, _6312, _6314);
            float _6320 = _6308 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6322 = fma(_6292, _6316, _6318);
            float _6324 = _6322 * _6320;
            float _6326 = fma(_225, _6324, _5966);
            float _6328 = fma(_227, _6324, _6060);
            float _6330 = fma(_229, _6324, _5972);
            _6264 = _6328;
            _6248 = _6326;
            _6272 = _6330;
        }
    }
    float _6332 = _6264;
    float _6334 = _6248;
    float _6336 = _6272;
    float _6338 = _6004 * _6194;
    float _6340 = _6268 + _6130;
    if (!_6166)
    {
        int _6342 = _6136 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _6344 = _6342 + _6054;
        _6274 = _6344;
    }
    int _6346 = _6274;
    float _6348 = -_5260;
    float _6350 = fma(_6348, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6332);
    float _6352 = fma(_5280, _6186, _6338);
    float _6354 = fma(_5280, _6100, _6258);
    float _6356 = 1.0 / _6340;
    if (!_6166)
    {
        int _6358 = _6346 << 2;
        _237 = _6358;
    }
    int _6360 = _237;
    float _6362 = fma(_5290, _6206, _6352);
    float _6364 = fma(_5290, _6150, _6354);
    float _6366 = -_5262;
    float _6368 = fma(_6366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6334);
    float _6370 = -_5276;
    float _6372 = fma(_6370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6336);
    int _6374 = _6360;
    float _6376 = _6368;
    float _6378 = _6372;
    if (_6176)
    {
        _6276 = _6350;
    }
    float _6380 = _6276;
    float _6382 = _6380;
    if (!_6166)
    {
        uint _6384 = uint(int(uint(_6346) >> uint(2)));
        _239 = int(_6384);
    }
    int _6386 = _239;
    if (!_6166)
    {
        int _6388 = 12 & _6360;
        _6374 = _6388;
    }
    int _6390 = _6374;
    if (!_6176)
    {
        float _6392 = _5286 * _5286;
        float _6394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6396 = -_3478;
        float _6398 = _6396 + _6336;
        float _6400 = -_3460;
        float _6402 = _6400 + _6334;
        float _6404 = fma(_5294, _5294, _6392);
        float _6406 = fma(_5304, _5304, _6404);
        float _6408 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6410 = sqrt(_6406);
        float _6412 = 1.0 / _5512;
        float _6414 = _6408 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6416 = precise::min(_6410, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6418 = _6416 * _6394;
        float _6420 = -_3452;
        float _6422 = _6420 + _6332;
        float _6424 = _6418 * _6412;
        float _6426 = _6414 * _6424;
        float _6428 = _6398 * _6424;
        float _6430 = fma(_6422, _6426, _5274);
        float _6432 = fma(_6402, _6426, _5280);
        float _6434 = fma(_6414, _6428, _5290);
        _6382 = _6430;
        _6376 = _6432;
        _6378 = _6434;
    }
    float _6436 = _6382;
    float _6438 = _6376;
    float _6440 = _6378;
    if (!_6166)
    {
        int _6442 = _6386 << 4;
        int _6444 = _6442 + _6390;
        _5306 = _6444;
    }
    int _6446 = _5306;
    float _6448 = _6436 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _6450 = _6056 + 88;
    uint _6452 = uint(int(uint(_6450) >> uint(2)));
    uint _6454 = uint(int(uint(int(_6452)) >> uint(2)));
    int _6456 = int(_6452) & 3;
    float _6458 = (*spvDescriptorSet0.vp_c15)._m0[int(_6454)][_6456];
    int _6460 = int(_6452) + 1;
    uint _6462 = uint(int(uint(_6460) >> uint(2)));
    int _6464 = _6460 & 3;
    float _6466 = (*spvDescriptorSet0.vp_c15)._m0[int(_6462)][_6464];
    float _6468 = _6364 + _6158;
    float _6470 = _6436 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6472 = fma(_6438, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6448);
    float _6474 = _6362 + _6214;
    float _6476 = _6468 * _6356;
    float _6478 = _6436 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6480 = fma(_6438, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6470);
    float _6482 = _5262;
    if (!_6166)
    {
        int _6484 = _6446 + 400;
        uint _6486 = uint(int(uint(_6484) >> uint(2)));
        uint _6488 = uint(int(uint(int(_6486)) >> uint(2)));
        int _6490 = int(_6486) & 3;
        float _6492 = (*spvDescriptorSet0.vp_c15)._m0[int(_6488)][_6490];
        _6482 = _6492;
    }
    float _6494 = _6482;
    float _6496 = fma(_6440, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6472);
    float _6498 = fma(_6438, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6478);
    bool _6500 = _6476 >= 0.0;
    float _6502 = _6436 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6504 = fma(_6440, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6480);
    float _6506 = _6496 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6508 = _6474 * _6356;
    float _6510 = fma(_6440, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6498);
    bool _6512 = _6476 <= 1.0;
    bool _6514 = _6512 && _6500;
    float _6516 = fma(_6438, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6502);
    float _6518 = _6504 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6520 = _6506 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6522 = _6510 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _6524 = _6508 >= 0.0;
    bool _6526 = _6524 && _6514;
    float _6528 = fma(_6440, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6516);
    float _6530 = fma(_6518, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6520);
    float _6532 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _6534 = _6522 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _6536 = _6508 <= 1.0;
    bool _6538 = _6536 && _6526;
    float _6540 = _6528 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6542 = fma(_6522, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6530);
    float _6544 = _6004 * _6238;
    float _6546 = -_6534;
    float _6548 = fma(_6546, _6532, 1.0);
    float _6550 = _6506 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6552 = fma(_6540, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6542);
    float _6554 = fma(_5280, _6230, _6544);
    float _6556 = _6506 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6558 = fma(_6518, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6550);
    float _6560 = log2(_6548);
    float _6562 = fma(_6518, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6556);
    if (_6538)
    {
        float _6564 = float(_6042);
        _6218 = _6564;
    }
    float _6566 = _6218;
    float _6568 = fma(_6522, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6558);
    float _6570 = fma(_6522, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6562);
    float _6572 = 1.0 / _6552;
    float _6574 = fma(_6540, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6568);
    float _6576 = fma(_6540, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6570);
    float _6578 = fma(_5290, _6458, _6554);
    float _6580 = _6578 + _6466;
    float _6582 = _6332;
    float _6584 = _6466;
    float _6586 = _6566;
    float _6588 = _6576;
    float _6590 = _6574;
    if (!_6166)
    {
        float _6592 = floor(_6058);
        _6582 = _6592;
    }
    float _6594 = _6582;
    float _6596 = _6560 * 0.693147182464599609375;
    if (!_6166)
    {
        float _6598 = -_6252;
        float _6600 = _6014 + _6598;
        _6584 = _6600;
    }
    float _6602 = _6584;
    float _6604 = _6580 * _6356;
    float _6606 = _6596 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6608 = _6550;
    float _6610 = _6606;
    if (_6538)
    {
        float _6612 = rint(_6566);
        float _6614 = precise::max(_6612, 0.0);
        uint _6616 = uint(_6614);
        uint _6618 = clamp(_6616, 0u, 65535u);
        _6608 = as_type<float>(_6618);
    }
    float _6620 = _6608;
    float _6622 = _6576 * _6572;
    float _6624 = _6574 * _6572;
    float _6626 = fma(_6622, 0.5, 0.5);
    float _6628 = fma(_6624, -0.5, 0.5);
    float _6630 = _6580;
    if (!_6166)
    {
        float _6632 = rint(_6494);
        float _6634 = precise::max(_6632, 0.0);
        uint _6636 = uint(_6634);
        uint _6638 = clamp(_6636, 0u, 65535u);
        _6630 = as_type<float>(_6638);
    }
    float _6640 = _6630;
    float _6642 = _6594;
    if (!_6166)
    {
        float _6644 = -_6594;
        float _6646 = _6058 + _6644;
        _6642 = _6646;
    }
    float _6648 = _6642;
    float _6650 = _6508;
    if (_6538)
    {
        float3 _17238 = float3(_6476, _6508, float(as_type<int>(_6620)));
        float3 _17242 = select(_17238, float3(0.0), isnan(_17238));
        float _6652 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _17242.xy, uint(rint(_17242.z)), _6604, level(0.0));
        _6650 = _6652;
    }
    float _6654 = _6650;
    float3 _17252 = float3(_6626, _6628, _6606);
    float _6656 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_17252, float3(0.0), isnan(_17252)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_17252, float3(0.0), isnan(_17252)), level(0.0)).x;
    float3 _17261 = float3(_6626, _6628, _6606);
    float4 _6659 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_17261, float3(0.0), isnan(_17261)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_17261, float3(0.0), isnan(_17261)), level(0.0)).xyzw;
    float _6661 = _6659.x;
    float _6663 = _6659.y;
    float _6665 = _6659.z;
    float _6667 = _6659.w;
    float _6669 = _6602;
    if (!_6166)
    {
        float3 _17284 = float3(_6602, _6648, float(as_type<int>(_6640)));
        float3 _17286 = select(_17284, float3(0.0), isnan(_17284));
        float _6671 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _17286.xy, uint(rint(_17286.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _17286.xy, uint(rint(_17286.z)), level(0.0)).x;
        _6669 = _6671;
    }
    float _6673 = _6669;
    if (_6166)
    {
        _6586 = 1.0;
    }
    float _6675 = _6586;
    float _6677 = _6675;
    float _6679 = _6663;
    float _6681 = _6661;
    if (!_6166)
    {
        int _6683 = _6346 << 4;
        int _6685 = _6683 + 2048;
        uint _6687 = uint(int(uint(_6685) >> uint(2)));
        uint _6689 = uint(int(uint(int(_6687)) >> uint(2)));
        int _6691 = int(_6687) & 3;
        float _6693 = (*spvDescriptorSet0.vp_c15)._m0[int(_6689)][_6691];
        int _6695 = int(_6687) + 1;
        uint _6697 = uint(int(uint(_6695) >> uint(2)));
        int _6699 = _6695 & 3;
        float _6701 = (*spvDescriptorSet0.vp_c15)._m0[int(_6697)][_6699];
        int _6703 = _6685 + 8;
        uint _6705 = uint(int(uint(_6703) >> uint(2)));
        uint _6707 = uint(int(uint(int(_6705)) >> uint(2)));
        int _6709 = int(_6705) & 3;
        float _6711 = (*spvDescriptorSet0.vp_c15)._m0[int(_6707)][_6709];
        int _6713 = int(_6705) + 1;
        uint _6715 = uint(int(uint(_6713) >> uint(2)));
        int _6717 = _6713 & 3;
        float _6719 = (*spvDescriptorSet0.vp_c15)._m0[int(_6715)][_6717];
        float _6721 = _6004 * _6701;
        float _6723 = fma(_5280, _6693, _6721);
        float _6725 = fma(_5290, _6711, _6723);
        float _6727 = _6725 + _6719;
        float _6729 = precise::clamp(_6727, 0.0, 1.0);
        float _6731 = -_6729;
        float _6733 = _6731 + _6673;
        float _6735 = fma(_6733, 500.0, 1.5);
        float _6737 = exp2(_6735);
        float _6739 = 0.0 + _6737;
        float _6741 = precise::clamp(_6739, 0.0, 1.0);
        _6677 = _6741;
    }
    float _6743 = _6677;
    float _6745 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6747 = _6436 + _6745;
    float _6749 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6751 = _6438 + _6749;
    float _6753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6755 = _6440 + _6753;
    float _6757 = _6747 * _6747;
    float _6759 = fma(_6751, _6751, _6757);
    float _6761 = fma(_6755, _6755, _6759);
    float _6763 = rsqrt(_6761);
    float _6765 = _6763 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6767 = _6751 * _6765;
    float _6769 = _6755 * _6765;
    float _6771 = _6767 * _6767;
    float _6773 = _6769 * _6769;
    float _6775 = _6771 + _6773;
    float _6777 = sqrt(_6775);
    bool _6779 = _6777 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6781 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6783 = _6777 + _6781;
    float _6785 = _6759;
    float _6787 = _6763;
    float _6789 = _6783;
    float _6791 = _6747;
    float _6793 = _6765;
    if (_6779)
    {
        float _6795 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6785 = _6795;
    }
    float _6797 = _6785;
    if (_6779)
    {
        float _6799 = rsqrt(_6775);
        _6787 = _6799;
    }
    float _6801 = _6787;
    float _6803 = _6797;
    float _6805 = _6801;
    if (_6779)
    {
        float _6807 = _6783 * _6797;
        _6789 = _6807;
    }
    float _6809 = _6789;
    if (_6779)
    {
        float _6811 = _6809 * 0.15915493667125701904296875;
        _6803 = _6811;
    }
    float _6813 = _6803;
    float _6815 = _6755;
    float _6817 = _6813;
    if (_6779)
    {
        float _6819 = _6813 * 6.283185482025146484375;
        float _6821 = sin(_6819);
        _6815 = _6821;
    }
    float _6823 = _6815;
    float _6825 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6827 = precise::max(0.0, _6825);
    float _6829 = _6673;
    float _6831 = _6827;
    if (_6779)
    {
        float _6833 = _6813 * 6.283185482025146484375;
        float _6835 = cos(_6833);
        _6829 = _6835;
    }
    float _6837 = _6829;
    float _6839 = -_6765;
    float _6841 = -_6827;
    float _6843 = fma(_6747, _6839, _6841);
    if (_6779)
    {
        float _6845 = _6843 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6791 = _6845;
    }
    float _6847 = _6791;
    float _6849 = _6847;
    if (!_6779)
    {
        _6817 = _6771;
    }
    float _6851 = _6817;
    float _6853 = _6823;
    float _6855 = _6851;
    if (_6779)
    {
        float _6857 = fma(_6823, _6847, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6849 = _6857;
    }
    float _6859 = _6849;
    float _6861 = _6859;
    if (!_6779)
    {
        _6853 = _6843;
    }
    float _6863 = _6853;
    float _6865 = _6863;
    float _6867 = _6837;
    if (_6779)
    {
        float _6869 = _6837 + (-1.0);
        _6831 = _6869;
    }
    float _6871 = _6831;
    if (_6779)
    {
        float _6873 = _6801 * _6859;
        _6610 = _6873;
    }
    float _6875 = _6610;
    if (!_6779)
    {
        _6805 = _6767;
    }
    float _6877 = _6805;
    float _6879 = _6877;
    if (_6779)
    {
        float _6881 = _6871 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6793 = _6881;
    }
    float _6883 = _6793;
    if (_6779)
    {
        float _6885 = _6767 * _6875;
        _6879 = _6885;
    }
    float _6887 = _6879;
    if (!_6779)
    {
        _6861 = _6769;
    }
    float _6889 = _6861;
    float _6891 = _6889;
    if (_6779)
    {
        float _6893 = _6769 * _6875;
        _6891 = _6893;
    }
    float _6895 = _6891;
    if (_6779)
    {
        float _6897 = fma(_6843, _6837, _6883);
        _6865 = _6897;
    }
    float _6899 = _6865;
    if (_6779)
    {
        float _6901 = _6887 * _6887;
        _6855 = _6901;
    }
    float _6903 = _6855;
    if (!_6779)
    {
        _6867 = _6773;
    }
    float _6905 = _6867;
    float _6907 = _6905;
    if (_6779)
    {
        float _6909 = _6895 * _6895;
        _6907 = _6909;
    }
    float _6911 = _6907;
    float _6913 = sqrt(_6761);
    float _6915 = fma(_6899, _6899, _6903);
    float _6917 = _6915 + _6911;
    float _6919 = rsqrt(_6917);
    float _6921 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6923 = fma(_6913, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6921);
    float _6925 = precise::clamp(_6923, 0.0, 1.0);
    float _6927 = -_6925;
    float _6929 = _6927 + 1.0;
    float _6931 = abs(_6929);
    float _6933 = log2(_6931);
    float _6935 = _6919 * _6887;
    float _6937 = _6919 * _6899;
    float _6939 = _6919 * _6895;
    float _6941 = _6935 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6943 = -_6941;
    float _6945 = fma(_6937, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6943);
    float _6947 = -_6939;
    float _6949 = fma(_6947, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6945);
    float _6951 = _6933 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6953 = fma(_6949, -0.5, 0.5);
    float _6955 = exp2(_6951);
    float _6957 = fma(_6949, 0.5, 0.5);
    float _6959 = _6937 + 1.0;
    float _6961 = fma(_6957, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6963 = sqrt(_6953);
    float _6965 = fma(_6957, _6961, -0.212114393711090087890625);
    float _6967 = fma(_6957, _6965, 1.570728778839111328125);
    float _6969 = -_6937;
    float _6971 = fma(_6955, _6959, _6969);
    float _6973 = fma(_6971, 0.5, 0.5);
    float _6975 = _6963 * 0.636619746685028076171875;
    float _6977 = -_6967;
    float _6979 = fma(_6975, _6977, 1.0);
    float2 _17760 = float2(_6979, _6973);
    float3 _6981 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_17760, float2(0.0), isnan(_17760)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_17760, float2(0.0), isnan(_17760)), level(0.0)).xyz;
    float _6983 = _6981.x;
    float _6985 = _6981.y;
    float _6987 = _6981.z;
    float _6989 = abs(_6018);
    float _6991 = log2(_6989);
    float _6993 = _6933 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6995 = _6506 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _6997 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _6999 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _7001 = _6997 || _6999;
    bool _7003 = isnan(0.5);
    bool _7005 = _7001 || _7003;
    float _7007 = -_5952;
    float _7009 = _7007 + 1.0;
    float _7011 = exp2(_6993);
    float _7013 = fma(_6518, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6995);
    bool _7015 = _6018 <= 8000.0;
    bool _7017 = isnan(_6018);
    bool _7019 = _7015 || _7017;
    bool _7021 = isnan(8000.0);
    bool _7023 = _7019 || _7021;
    float _7025 = float(_7023);
    float _7027 = _6991 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _7029 = _6951;
    float _7031 = _7013;
    if (!_7005)
    {
        _7029 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _7033 = _7029;
    float _7035 = exp2(_7027);
    float _7037 = _7033;
    if (!_7005)
    {
        float _7039 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7041 = _7033 + _7039;
        _7037 = _7041;
    }
    float _7043 = _7037;
    float _7045 = -_7011;
    float _7047 = _7045 + 1.0;
    float _7049 = _6771;
    if (!_7005)
    {
        float _7051 = 1.0 / _7043;
        _7049 = _7051;
    }
    float _7053 = _7049;
    float _7055 = fma(_7035, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _7057 = precise::clamp(_7055, 0.0, 1.0);
    float _7059 = fma(_6522, (*spvDescriptorSet0.vp_c8)._m0[6].z, _7013);
    if (_7005)
    {
        _7031 = 1.0;
    }
    float _7061 = _7031;
    float _7063 = fma(_7057, -2.0, 3.0);
    float _7065 = _7057 * _7057;
    float _7067 = fma(_6540, (*spvDescriptorSet0.vp_c8)._m0[6].w, _7059);
    float _7069 = _7065 * _7063;
    float _7071 = _7067 + _6552;
    out.gl_Position.x = _6576;
    out.gl_Position.y = _6574;
    out.gl_Position.z = _7067;
    out.gl_Position.w = _6552;
    float _7073 = -_7069;
    float _7075 = _7073 + 1.0;
    float _7077 = _7071 * 0.5;
    float _7079 = fma(_7075, (*spvDescriptorSet0.vp_c15)._m0[654].w, _7069);
    float _7081 = _7069;
    float _7083 = _7061;
    if (!_7005)
    {
        float _7085 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7087 = _6018 + _7085;
        _7081 = _7087;
    }
    float _7089 = _7081;
    float _7091 = _6552 * 0.5;
    float _7093 = _6576 + _6552;
    float _7095 = _7025 * _7079;
    float _7097 = _7089;
    if (!_7005)
    {
        float _7099 = _7089 * _7053;
        float _7101 = precise::clamp(_7099, 0.0, 1.0);
        _7083 = _7101;
    }
    float _7103 = _7083;
    float _7105 = fma(_6574, -0.5, _7091);
    if (!_6538)
    {
        _7097 = 1.0;
    }
    float _7107 = _7097;
    float _7109 = _7095 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _7111 = _7107;
    if (_6538)
    {
        bool _7113 = _6654 >= _6604;
        bool _7115 = isnan(_6654);
        bool _7117 = _7113 || _7115;
        bool _7119 = isnan(_6604);
        bool _7121 = _7117 || _7119;
        float _7123 = float(_7121);
        _7111 = _7123;
    }
    float _7125 = _7111;
    float _7127 = _7047 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _7129 = _7093 * 0.5;
    float _7131 = _7009 * _7109;
    float _7133 = precise::clamp(_7131, 0.0, 1.0);
    bool _7135 = _6913 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _7137 = isnan(_6913);
    bool _7139 = _7135 || _7137;
    bool _7141 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _7143 = _7139 || _7141;
    float _7145 = _7127 * _6656;
    float _7147 = _7125 * _6743;
    float _7149 = -_7133;
    float _7151 = fma(_7149, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7153 = -_7127;
    float _7155 = _7153 + 1.0;
    float _7157 = _6667 * _7145;
    out.m_104.x = _7129;
    out.m_104.y = _7105;
    out.m_104.z = _7077;
    out.m_104.w = _6552;
    float _7159 = -_7147;
    float _7161 = fma(_7159, _7151, 1.0);
    float _7163 = precise::clamp(_7161, 0.0, 1.0);
    float _7165 = _6667 * _7155;
    float _7167 = _7103 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _7169 = _7163 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7171 = _7163;
    float _7173 = _7145;
    if (!_7143)
    {
        _6588 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _7175 = _6588;
    float _7177 = _7175;
    float _7179 = _7175;
    if (!_7143)
    {
        _6590 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _7181 = _6590;
    out.m_106.x = _7169;
    float _7183 = _7181;
    float _7185 = _7181;
    if (!_7143)
    {
        _7171 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7187 = _7171;
    float _7189 = _6987 * _7145;
    float _7191 = fma(_6983, _7157, _6661);
    float _7193 = fma(_6985, _7157, _6663);
    float _7195 = _7187;
    float _7197 = _7187;
    if (!_7143)
    {
        _6679 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _7199 = _6679;
    float _7201 = fma(_6667, _7189, _6665);
    float _7203 = _7199;
    float _7205 = _7199;
    if (!_7143)
    {
        _6681 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _7207 = _6681;
    float _7209 = _7207;
    float _7211 = _7207;
    if (!_7143)
    {
        _7173 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _7213 = _7173;
    out.m_108.x = _7191;
    out.m_108.y = _7193;
    out.m_108.z = _7201;
    out.m_108.w = _7165;
    bool _7215 = !_7143;
    float _7217 = _7213;
    float _7219 = _7213;
    if (!_7215)
    {
        bool _7221 = _6913 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7223 = isnan(_6913);
        bool _7225 = _7221 || _7223;
        bool _7227 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7229 = _7225 || _7227;
        if (!_7229)
        {
            float _7231 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7233 = _6913 + _7231;
            float _7235 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7237 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7235;
            float _7239 = 1.0 / _7237;
            float _7241 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7243 = _7241 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7245 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7247 = _7245 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7249 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7251 = _7249 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7253 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7255 = _7253 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7257 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7259 = _7257 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7261 = _7233 * _7239;
            float _7263 = precise::clamp(_7261, 0.0, 1.0);
            float _7265 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7267 = _7265 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7269 = fma(_7263, _7243, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7271 = fma(_7263, _7267, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7273 = fma(_7263, _7247, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7275 = fma(_7263, _7251, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7277 = fma(_7263, _7255, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7279 = fma(_7263, _7259, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _7185 = _7271;
            _7211 = _7277;
            _7179 = _7269;
            _7205 = _7275;
            _7197 = _7273;
            _7219 = _7279;
            _7281 = true;
        }
        else
        {
            bool _7283 = _6913 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7285 = isnan(_6913);
            bool _7287 = _7283 || _7285;
            bool _7289 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7291 = _7287 || _7289;
            if (!_7291)
            {
                _7177 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7293 = _7177;
            _7179 = _7293;
            if (!_7291)
            {
                _7183 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7295 = _7183;
            _7185 = _7295;
            if (!_7291)
            {
                _7195 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7297 = _7195;
            _7197 = _7297;
            if (!_7291)
            {
                _7203 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7299 = _7203;
            _7205 = _7299;
            if (!_7291)
            {
                _7209 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7301 = _7209;
            _7211 = _7301;
            if (!_7291)
            {
                _7217 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7303 = _7217;
            bool _7305 = !_7291;
            _7219 = _7303;
            if (!_7305)
            {
                bool _7307 = _6913 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7309 = isnan(_6913);
                bool _7311 = _7307 || _7309;
                bool _7313 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7315 = _7311 || _7313;
                if (!_7315)
                {
                    float _7317 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7319 = _6913 + _7317;
                    float _7321 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7323 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7321;
                    float _7325 = 1.0 / _7323;
                    float _7327 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7329 = _7327 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7331 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7333 = _7331 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7335 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7337 = _7335 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7339 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7341 = _7339 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7343 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7345 = _7343 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7347 = _7319 * _7325;
                    float _7349 = precise::clamp(_7347, 0.0, 1.0);
                    float _7351 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7353 = _7351 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7355 = fma(_7349, _7329, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7357 = fma(_7349, _7353, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7359 = fma(_7349, _7333, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7361 = fma(_7349, _7337, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7363 = fma(_7349, _7341, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7365 = fma(_7349, _7345, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _7185 = _7357;
                    _7211 = _7363;
                    _7179 = _7355;
                    _7205 = _7361;
                    _7197 = _7359;
                    _7219 = _7365;
                    _7281 = true;
                }
                else
                {
                    _7185 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _7211 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _7179 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _7205 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7197 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _7219 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7281 = false;
    float _7367 = _7185;
    float _7369 = _7211;
    float _7371 = _7179;
    float _7373 = _7205;
    float _7375 = _7197;
    float _7377 = _7219;
    float _7379 = fma(_5850, -0.5, 0.5);
    float _7381 = precise::clamp(_7379, 0.0, 1.0);
    float _7383 = -_7367;
    float _7385 = _7383 + _7369;
    float _7387 = _7167 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7389 = -_7371;
    float _7391 = _7389 + _7373;
    out.m_110.x = 0.0;
    float _7393 = fma(_7381, _7385, _7367);
    float _7395 = fma(_7381, _7391, _7371);
    out.m_63.x = _7387;
    float _7397 = -_7375;
    float _7399 = _7397 + _7377;
    float _7401 = _7393 * 0.586610972881317138671875;
    bool _7403 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7405 = fma(_7381, _7399, _7375);
    float _7407 = fma(_7395, 0.298911988735198974609375, _7401);
    bool _7409 = _7103 > 0.0;
    bool _7411 = isnan(_7103);
    bool _7413 = _7409 || _7411;
    bool _7415 = isnan(0.0);
    bool _7417 = _7413 || _7415;
    float _7419 = fma(_7405, 0.114477999508380889892578125, _7407);
    float _7421 = -_7419;
    float _7423 = _7395 + _7421;
    float _7425 = -_7419;
    float _7427 = _7393 + _7425;
    float _7429 = -_7419;
    float _7431 = _7405 + _7429;
    float _7433 = fma(_7423, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7419);
    float _7435 = fma(_7427, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7419);
    float _7437 = fma(_7431, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7419);
    bool _7439 = !_7403;
    if (!_7439)
    {
        float _7441 = -_6436;
        float _7443 = _7441 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7445 = -_6438;
        float _7447 = _7445 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7449 = -_6440;
        float _7451 = _7449 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7453 = _7443 * _7443;
        float _7455 = fma(_7447, _7447, _7453);
        float _7457 = fma(_7451, _7451, _7455);
        float _7459 = sqrt(_7457);
        float _7461 = rsqrt(_7457);
        float _7463 = -_7459;
        float _7465 = _7463 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7467 = _7465 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7469 = precise::clamp(_7467, 0.0, 1.0);
        float _7471 = _7447 * _7461;
        float _7473 = _7443 * _7461;
        float _7475 = abs(_7469);
        float _7477 = log2(_7475);
        float _7479 = _7451 * _7461;
        float _7481 = _7471 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7483 = _5850 * _7473;
        float _7485 = -_7473;
        float _7487 = -_7481;
        float _7489 = fma(_7485, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7487);
        float _7491 = fma(_5854, _7471, _7483);
        float _7493 = -_7479;
        float _7495 = fma(_7493, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7489);
        float _7497 = fma(_5856, _7479, _7491);
        float _7499 = precise::clamp(_7497, 0.0, 1.0);
        float _7501 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7503 = _7495 + _7501;
        float _7505 = _7477 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7507 = _7503 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7509 = precise::clamp(_7507, 0.0, 1.0);
        float _7511 = exp2(_7505);
        float _7513 = _7511 * _7509;
        float _7515 = _7499 * _7513;
        float _7517 = _7515 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7519 = _7515 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7521 = _7515 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_110.x = _7517;
        out.m_110.y = _7519;
        out.m_110.z = _7521;
    }
    out.m_112.x = _7433;
    out.m_112.y = _7435;
    out.m_112.z = _7437;
    if (_7417)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _7523 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7523;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_112 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    bool _7281 = false;
    bool _5904 = false;
    bool _1141 = false;
    bool _821 = false;
    bool _641 = false;
    bool _453 = false;
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _126 = in.m_60.w;
    float _128 = trunc(_126);
    int _131 = int(_128);
    bool _135 = _131 >= 1;
    float _137 = 0.0;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    float _141 = _139;
    if (!_135)
    {
        out.m_63.x = 0.0;
    }
    int _143 = 0;
    if (!_135)
    {
        float _145 = _139 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    int _149 = _147;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7580 = as_type<float>(_147);
        out.gl_Position.z = _7580;
    }
    if (!_135)
    {
        return out;
    }
    float _151 = in.m_65.w;
    bool _153 = _151 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_151);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = -_151;
    float _165 = _163 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _167 = _165;
    if (_161)
    {
        float _169 = float(_131);
        _141 = _169;
    }
    float _171 = _141;
    bool _173 = _165 >= _171;
    bool _175 = !_161;
    bool _177 = _173 || _175;
    float _179 = _171;
    if (_177)
    {
        _179 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _181 = _179;
    if (_177)
    {
        out.m_63.x = 0.0;
    }
    if (_177)
    {
        float _183 = _181 * 5.0;
        _149 = as_type<int>(_183);
    }
    int _185 = _149;
    if (_177)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7650 = as_type<float>(_185);
        out.gl_Position.z = _7650;
    }
    if (_177)
    {
        return out;
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_70.x;
    float _191 = in.m_70.y;
    float _193 = in.m_70.z;
    int _195 = as_type<int>(_187) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_187) & 2;
    bool _201 = _199 != 0;
    bool _203 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _205 = _191 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _207 = _191 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _209 = _191 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _211 = !_197;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[4].x, _205);
    float _217 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[5].x, _207);
    float _219 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[6].x, _209);
    bool _221 = !_201;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[4].z, _215);
    float _227 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[5].z, _217);
    float _229 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[6].z, _219);
    bool _231 = !_203;
    bool _233 = false;
    bool _235 = false;
    int _237 = as_type<int>(_225);
    int _239 = as_type<int>(_227);
    float _257;
    if (!_231)
    {
        float _241 = in.m_72.x;
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _241 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _165);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_131);
        float _263 = 1.0 / _261;
        float _265 = _165 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _267 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = _267 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _267 + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    bool _293 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _295 = isnan(_267);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = 1.0 / _283;
    bool _307 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _309 = 1.0 / _291;
    float _311 = 1.0 / _287;
    float _313 = _271 * _305;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -_303;
    float _329 = _327 + 1.0;
    float _331 = _325 * _329;
    float _333 = _275 * _309;
    bool _335 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _337 = isnan(_267);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -_325;
    float _349 = _347 + 1.0;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = _345 * _349;
    float _357 = -_345;
    float _359 = _357 + 1.0;
    float _361 = _279 * _311;
    bool _363 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _365 = isnan(_267);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = fma(_353, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = fma(_377, _313, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = _373 * _359;
    float _393 = fma(_383, _313, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _395 = fma(_387, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = -_373;
    float _399 = _397 + 1.0;
    float _401 = _389 * _391;
    float _403 = _393 * _391;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _405;
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].y, _403);
    float _417 = fma(_407, _333, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _419 = fma(_379, _355, _409);
    float _421 = fma(_413, _333, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_395, _355, _415);
    float _425 = fma(_417, _331, _419);
    float _427 = fma(_421, _331, _423);
    float _429 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].x, _425);
    float _431 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].y, _427);
    bool _433 = !_307;
    float _451;
    if (!_433)
    {
        float _435 = in.m_72.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _165);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_131);
        float _457 = 1.0 / _455;
        float _459 = _165 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _465 = _461 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _475 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _477 = isnan(_461);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _491 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _493 = isnan(_461);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = 1.0 / _469;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _505;
    float _509 = -_485;
    float _511 = _509 + 1.0;
    bool _513 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _515 = isnan(_461);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _527 = 1.0 / _473;
    float _529 = 1.0 / _489;
    float _531 = _507 * _503;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _537 = _501 * _511;
    float _539 = -_501;
    float _541 = _539 + 1.0;
    float _543 = fma(_531, _465, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _545;
    float _549 = _523 * _541;
    float _551 = _535 * _527;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _555 = _461 + _553;
    bool _557 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _559 = isnan(_461);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = _543 * _549;
    float _571 = -_523;
    float _573 = _571 + 1.0;
    float _575 = fma(_551, _555, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _579 = _461 + _577;
    float _581 = _547 * _529;
    float _583 = -_567;
    float _585 = _583 + 1.0;
    float _587 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[115].x, _569);
    float _589 = fma(_581, _579, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _591 = _485 * _585;
    float _593 = fma(_575, _537, _587);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _597 = fma(_589, _591, _593);
    float _599 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[118].x, _597);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _605 = in.m_74.x;
    float _607 = in.m_74.y;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _611 = _601 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _613 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _615 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_76.x = _599;
    out.m_76.y = _613;
    out.m_76.z = _615;
    out.m_76.w = _611;
    float _617 = _431 * _607;
    float _619 = _429 * _605;
    bool _621 = !_525;
    float _639;
    if (!_621)
    {
        float _623 = in.m_72.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[11].w, _165);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_131);
        float _645 = 1.0 / _643;
        float _647 = _165 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _659 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _661 = isnan(_649);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = 1.0 / _653;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _677 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _679 = isnan(_649);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _689;
    float _693 = -_669;
    float _695 = _693 + 1.0;
    bool _697 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _699 = isnan(_649);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    bool _709 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _711 = 1.0 / _657;
    float _713 = _687 * _695;
    float _715 = -_687;
    float _717 = _715 + 1.0;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _723 = _707 * _717;
    float _725 = -_707;
    float _727 = _725 + 1.0;
    float _729 = 1.0 / _675;
    float _731 = _691 * _671;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _735 = _649 + _733;
    float _737 = fma(_731, _735, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _741 = _649 + _739;
    float _743 = _721 * _711;
    bool _745 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _747 = isnan(_649);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _757;
    float _761 = _737 * _723;
    float _763 = fma(_743, _741, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _767 = _649 + _765;
    float _769 = -_755;
    float _771 = _769 + 1.0;
    float _773 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[131].x, _761);
    float _775 = _759 * _729;
    float _777 = _669 * _771;
    float _779 = fma(_763, _713, _773);
    float _781 = fma(_775, _767, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _783 = fma(_781, _777, _779);
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _791 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[134].x, _783);
    float _793 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _795 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _797 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _791 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _793;
    out.m_78.y = _795;
    out.m_78.z = _797;
    out.m_78.w = _799;
    bool _801 = !_709;
    float _819;
    if (!_801)
    {
        float _803 = in.m_72.x;
        float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _807 = _803 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[14].x, _165);
        float _811 = _809 * _805;
        float _813 = floor(_811);
        float _815 = -_813;
        float _817 = _811 + _815;
        _819 = _817;
        _821 = true;
    }
    else
    {
        float _823 = float(_131);
        float _825 = 1.0 / _823;
        float _827 = _165 * _825;
        _819 = _827;
    }
    _821 = false;
    float _829 = _819;
    bool _831 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _833 = isnan(_829);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    bool _843 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _845 = isnan(_829);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _859 = -_841;
    float _861 = _859 + 1.0;
    bool _863 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _865 = isnan(_829);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = 1.0 / _857;
    float _877 = -_853;
    float _879 = _877 + 1.0;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _881;
    float _885 = _853 * _861;
    bool _887 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _889 = isnan(_829);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = _873 * _879;
    float _901 = -_873;
    float _903 = _901 + 1.0;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _909 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _911 = isnan(_829);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = -_897;
    float _923 = _921 + 1.0;
    float _925 = _897 * _903;
    float _927 = 1.0 / _907;
    bool _929 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _931 = isnan(_829);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = _883 * _875;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _945 = _829 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _951 = fma(_941, _945, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _957 = -_919;
    float _959 = _957 + 1.0;
    float _961 = _919 * _923;
    bool _963 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _965 = isnan(_829);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = 1.0 / _949;
    float _977 = _939 * _959;
    float _979 = -_939;
    float _981 = _979 + 1.0;
    float _983 = _973 * _981;
    float _985 = -_973;
    float _987 = _985 + 1.0;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _997 = _951 * _983;
    float _999 = 1.0 / _955;
    float _1001 = _995 * _927;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1011 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[159].x, _997);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1017 = _1005 * _975;
    float _1019 = 1.0 / _1009;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1023 = _829 + _1021;
    bool _1025 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1027 = fma(_1001, _1023, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1031 = _829 + _1029;
    float _1033 = 1.0 / _991;
    float _1035 = fma(_1027, _977, _1011);
    float _1037 = fma(_1017, _1031, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1049 = _829 + _1047;
    float _1051 = fma(_1037, _961, _1035);
    float _1053 = 1.0 / _1015;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1057 = _1055 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1059 = _1041 * _1019;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1063 = _829 + _1061;
    float _1065 = _1057 * _999;
    float _1067 = _1045 * _1033;
    float _1069 = fma(_1065, _1049, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1071 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1073 = isnan(_829);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1083;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1089 = _829 + _1087;
    float _1091 = fma(_1067, _1063, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1093 = fma(_1069, _925, _1051);
    float _1095 = -_1081;
    float _1097 = _1095 + 1.0;
    float _1099 = _1085 * _1053;
    float _1101 = fma(_1059, _1089, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1105 = _829 + _1103;
    float _1107 = fma(_1091, _899, _1093);
    float _1109 = _841 * _1097;
    float _1111 = fma(_1099, _1105, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1113 = fma(_1101, _885, _1107);
    float _1115 = fma(_1111, _1109, _1113);
    float _1117 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1115);
    out.m_80.x = _1117;
    bool _1119 = !_1025;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1139;
    if (!_1119)
    {
        float _1123 = in.m_72.x;
        float _1125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1127 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1129 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[14].y, _165);
        float _1131 = _1129 * _1125;
        float _1133 = floor(_1131);
        float _1135 = -_1133;
        float _1137 = _1131 + _1135;
        _1139 = _1137;
        _1141 = true;
    }
    else
    {
        float _1143 = float(_131);
        float _1145 = 1.0 / _1143;
        float _1147 = _165 * _1145;
        _1139 = _1147;
    }
    _1141 = false;
    float _1149 = _1139;
    float _1151 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1153 = int(_1151);
    float _1155 = in.m_72.w;
    float _1157 = float(_131);
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1161 = _1159 != 0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1165 = _1163 != 0;
    float _1167 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1169 = int(_1167);
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1173 = _1171 != 0;
    float _1175 = float(_1153);
    float _1177 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1179 = int(_1177);
    float _1181 = as_type<float>(_131);
    if (_1161)
    {
        float _1183 = in.m_72.w;
        _1181 = _1183;
    }
    float _1185 = _1181;
    if (!_1161)
    {
        _1121 = _213;
    }
    float _1187 = _1121;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1191 = _1187;
    if (_1173)
    {
        float _1193 = in.m_72.w;
        _1189 = _1193;
    }
    float _1195 = _1189;
    float _1197 = float(uint(_1169));
    float _1199 = 1.0 / _1175;
    bool _1201 = _1155 > 0.5;
    int _1203 = ~_1169;
    int _1205 = _1203 + 1;
    float _1207 = float(_1169);
    float _1209 = 1.0 / _1197;
    float _1211 = float(_1179);
    float _1213 = _1199 * _165;
    float _1215 = _1197;
    bool _1217 = _1201;
    if (_1165)
    {
        float _1219 = in.m_72.z;
        _1215 = _1219;
    }
    float _1221 = _1215;
    float _1223 = 1.0 / _1211;
    float _1225 = _1185;
    if (_1161)
    {
        float _1227 = _1185 * 3.1415927410125732421875;
        _1225 = _1227;
    }
    float _1229 = _1225;
    float _1231 = _1195;
    float _1233 = _1229;
    if (_1173)
    {
        float _1235 = _1195 * 3.1415927410125732421875;
        _1231 = _1235;
    }
    float _1237 = _1231;
    int _1239 = as_type<int>(_1209) + (-2);
    float _1241 = _1237;
    if (_1173)
    {
        float _1243 = _1237 * 0.15915493667125701904296875;
        _1241 = _1243;
    }
    float _1245 = _1241;
    float _1247 = trunc(_1213);
    int _1249 = int(_1247);
    int _1251 = ~_1169;
    int _1253 = _1251 + 1;
    float _1255 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1257 = int(_1255);
    float _1259 = _1223 * _165;
    float _1261 = _1223;
    if (_1161)
    {
        float _1263 = _1229 * 0.15915493667125701904296875;
        _1261 = _1263;
    }
    float _1265 = _1261;
    if (_1165)
    {
        float _1267 = _1221 * 3.1415927410125732421875;
        _1233 = _1267;
    }
    float _1269 = _1233;
    float _1271 = float(uint(_1249));
    float _1273 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1275 = int(_1273);
    float _1277 = as_type<float>(_1239) * _1271;
    float _1279 = float(uint(_1257));
    float _1281 = trunc(_1277);
    float _1283 = precise::max(_1281, 0.0);
    uint _1286 = uint(_1283);
    float _1288 = 1.0 / _1279;
    float _1290 = float(_1275);
    float _1292 = trunc(_1259);
    int _1294 = int(_1292);
    float _1296 = _1279;
    if (_1165)
    {
        float _1298 = _1269 * 0.15915493667125701904296875;
        _1296 = _1298;
    }
    float _1300 = _1296;
    int _1302 = _1253 * int(_1286);
    int _1304 = _1302 + _1249;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1308 = _1306 != 0;
    float _1310 = _1300;
    float _1312 = as_type<float>(_1286);
    if (_1165)
    {
        float _1314 = _1300 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        _1310 = _1316;
    }
    float _1318 = _1310;
    float _1320 = float(uint(_1304));
    int _1322 = as_type<int>(_1288) + (-2);
    float _1324 = as_type<float>(_1239) * _1320;
    float _1326 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1328 = int(_1326);
    float _1330 = float(uint(_1294));
    float _1332 = 0.0;
    if (_1308)
    {
        _1332 = 1.0;
    }
    float _1334 = _1332;
    int _1336 = 0;
    float _1338 = _1334;
    if (_1308)
    {
        _1336 = 0;
    }
    int _1340 = _1336;
    float _1342 = as_type<float>(_1322) * _1330;
    float _1344 = _1221;
    int _1346 = as_type<int>(_1342);
    int _1348 = _1340;
    if (_1161)
    {
        float _1350 = _1265 * 6.283185482025146484375;
        float _1352 = sin(_1350);
        _1344 = _1352;
    }
    float _1354 = _1344;
    if (_1165)
    {
        bool _1356 = _1318 > 0.5;
        _233 = _1356;
    }
    bool _1358 = _233;
    float _1360 = trunc(_1324);
    float _1362 = precise::max(_1360, 0.0);
    uint _1364 = uint(_1362);
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1368 = _1265;
    float _1370 = as_type<float>(_1304);
    if (_1308)
    {
        float _1372 = in.m_72.x;
        float _1374 = in.m_72.y;
        float _1376 = in.m_72.z;
        _1366 = _1372;
        _1368 = _1374;
        _1370 = _1376;
    }
    float _1378 = _1366;
    float _1380 = _1368;
    float _1382 = _1370;
    float _1384 = float(uint(_1328));
    float _1386 = 0.0;
    if (_1173)
    {
        float _1388 = _1245 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        _1386 = _1390;
    }
    float _1392 = _1386;
    float _1394 = _1392;
    if (_1161)
    {
        bool _1396 = _1354 > 0.5;
        _235 = _1396;
    }
    bool _1398 = _235;
    int _1400 = int(_1201);
    int _1402 = _1173 ? 2 : 0;
    int _1404 = _1400 | _1402;
    int _1406 = _1161 ? 4 : 0;
    int _1408 = _1404 | _1406;
    int _1410 = _1165 ? 8 : 0;
    int _1412 = _1408 | _1410;
    int _1414 = _1398 ? 16 : 0;
    int _1416 = _1412 | _1414;
    int _1418 = _1358 ? 32 : 0;
    int _1420 = _1416 | _1418;
    int _1422 = _1308 ? 64 : 0;
    int _1424 = _1420 | _1422;
    int _1426 = _1424 & 1;
    float _1428 = as_type<float>(_1426);
    if (_1308)
    {
        _1428 = 1.0;
    }
    float _1430 = _1428;
    float _1432 = trunc(_1342);
    float _1434 = precise::max(_1432, 0.0);
    uint _1436 = uint(_1434);
    int _1438 = int(_1286) + int(_1364);
    int _1440 = ~_1257;
    int _1442 = _1440 + 1;
    float _1444 = as_type<float>(_1364);
    float _1446 = _1430;
    if (_1308)
    {
        _1444 = 1.0;
    }
    float _1448 = _1444;
    float _1450 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1452 = int(_1450);
    float _1454 = _1448;
    float _1456 = _1378;
    float _1458 = _1380;
    float _1460 = _1382;
    if (_1308)
    {
        _1312 = _1378;
    }
    float _1462 = _1312;
    float _1464 = _1462;
    if (_1308)
    {
        _1346 = 0;
    }
    int _1466 = _1346;
    float _1468 = 0.0;
    int _1470 = _1466;
    if (_1308)
    {
        _1468 = _1462;
    }
    float _1472 = _1468;
    float _1474 = 0.0;
    float _1476 = _1472;
    if (_1308)
    {
        _1474 = _1462;
    }
    float _1478 = _1474;
    float _1480 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1482 = int(_1480);
    float _1484 = 0.0;
    float _1486 = _1478;
    if (_1308)
    {
        _1484 = _1380;
    }
    float _1488 = _1484;
    int _1490 = _1442 * int(_1436);
    int _1492 = _1490 + _1294;
    int _1494 = 0;
    float _1496 = _1488;
    if (_1308)
    {
        _1494 = as_type<int>(_1382);
    }
    int _1498 = _1494;
    int _1500 = _1498;
    if (_1173)
    {
        bool _1502 = _1392 > 0.5;
        _1217 = _1502;
    }
    bool _1504 = _1217;
    float _1506 = 1.0 / _1157;
    float _1508 = 1.0 / _1290;
    float _1510 = 1.0 / _1384;
    if (!_1308)
    {
        float _1512 = in.m_72.x;
        float _1514 = in.m_72.y;
        float _1516 = in.m_72.z;
        float _1518 = _1512 * 3.1415927410125732421875;
        float _1520 = _1518 * 0.15915493667125701904296875;
        float _1522 = _1514 * 3.1415927410125732421875;
        float _1524 = _1522 * 0.15915493667125701904296875;
        float _1526 = _1516 * 3.1415927410125732421875;
        float _1528 = _1520 * 6.283185482025146484375;
        float _1530 = sin(_1528);
        float _1532 = _1526 * 0.15915493667125701904296875;
        float _1534 = _1524 * 6.283185482025146484375;
        float _1536 = sin(_1534);
        float _1538 = _1532 * 6.283185482025146484375;
        float _1540 = sin(_1538);
        _1454 = 7.345489978790283203125;
        _1456 = _1512;
        _1458 = _1514;
        _1460 = _1516;
        _1338 = 1.2345600128173828125;
        _1464 = _1514;
        _1446 = 5.839270114898681640625;
        _1476 = _1516;
        _1470 = 1;
        _1348 = 2;
        _1486 = _1530;
        _1496 = _1536;
        _1500 = as_type<int>(_1540);
    }
    float _1542 = _1454;
    float _1544 = _1456;
    float _1546 = _1458;
    float _1548 = _1460;
    float _1550 = _1338;
    float _1552 = _1464;
    float _1554 = _1446;
    float _1556 = _1476;
    int _1558 = _1470;
    int _1560 = _1348;
    float _1562 = _1486;
    float _1564 = _1496;
    int _1566 = _1500;
    float _1568 = _1542 * _1544;
    float _1570 = float(uint(_1492));
    int _1572 = _1205 * _1438;
    int _1574 = _1572 + _1249;
    float _1576 = float(_1249);
    float _1578 = floor(_1568);
    bool _1580 = _1546 > 0.5;
    float _1582 = as_type<float>(_1322) * _1570;
    if (!_1165)
    {
        _1394 = _213;
    }
    float _1584 = _1394;
    float _1586 = _1506 * _165;
    float _1588 = _1584;
    if (_1161)
    {
        float _1590 = -_213;
        float _1592 = _1398 ? _1590 : _213;
        _1191 = _1592;
    }
    float _1594 = _1191;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1598 = _1149 + _1596;
    if (_1165)
    {
        float _1600 = -_213;
        float _1602 = _1358 ? _1600 : _213;
        _1588 = _1602;
    }
    float _1604 = _1588;
    float _1606 = trunc(_1582);
    float _1608 = precise::max(_1606, 0.0);
    uint _1610 = uint(_1608);
    float _1612 = 0.0;
    if (!_1173)
    {
        _1612 = _223;
    }
    float _1614 = _1612;
    float _1616 = _1544 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1624 = _1622 != 0;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1628 = _1626 != 0;
    float _1630 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1632 = _1576 >= _1207;
    bool _1634 = isnan(_1576);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(_1207);
    bool _1640 = _1636 || _1638;
    float _1642 = float(_1640);
    float _1644 = _1614;
    if (_1173)
    {
        float _1646 = -_223;
        float _1648 = _1504 ? _1646 : _223;
        _1644 = _1648;
    }
    float _1650 = _1644;
    float _1652 = -_1578;
    float _1654 = _1568 + _1652;
    bool _1656 = _1548 > 0.5;
    float _1658 = trunc(_1642);
    int _1660 = int(_1658);
    bool _1662 = uint(_1574) >= uint(_1169);
    float _1664 = _1550 * _1552;
    float _1666 = -_213;
    int _1668 = _1580 ? as_type<int>(_1666) : as_type<int>(_213);
    float _1670 = -_223;
    int _1672 = _1656 ? as_type<int>(_1670) : as_type<int>(_223);
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1676 = _1674 != 0;
    float _1678 = floor(_1664);
    float _1680 = _1654 * _1207;
    bool _1682 = !_1662;
    int _1684 = _1682 ? 0 : (-1);
    float _1686 = _1207 * _1586;
    bool _1688 = !_1624;
    float _1690 = _1688 ? _213 : as_type<float>(_1668);
    bool _1692 = !_1628;
    float _1694 = _1692 ? _223 : as_type<float>(_1672);
    float _1696 = trunc(_1680);
    int _1698 = int(_1696);
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1702 = _1700 != 0;
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1706 = _1704 != 0;
    int _1708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1710 = _1708 != 0;
    int _1712 = ~_1438;
    int _1714 = _1712 + _1684;
    int _1716 = _1714 + 1;
    float _1718 = float(_1482);
    bool _1720 = !_1706;
    int _1722 = _1720 ? 0 : 1;
    int _1724 = _1169 * _1716;
    int _1726 = _1724 + _1249;
    bool _1728 = _1169 == 0;
    float _1730 = 1.0 / _1718;
    int _1732 = ~_1660;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    float _1738 = -_1678;
    float _1740 = _1664 + _1738;
    bool _1742 = !_1728;
    int _1744 = _1742 ? _1726 : (-1);
    int _1746 = int(_1436) + int(_1610);
    int _1748 = ~_1257;
    int _1750 = _1748 + 1;
    int _1752 = _1744 * _1736;
    int _1754 = _1169 + (-1);
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1758 = _1756 != 0;
    int _1760 = _1750 * _1746;
    int _1762 = _1760 + _1294;
    bool _1764 = _1155 > 0.5;
    int _1766 = _1660 * _1754;
    int _1768 = _1766 + _1752;
    bool _1770 = !_1676;
    int _1772 = _1770 ? 0 : 1;
    float _1774 = trunc(_1686);
    int _1776 = int(_1774);
    bool _1778 = !_1758;
    int _1780 = _1778 ? 0 : 1;
    float _1782 = -_223;
    int _1784 = _1764 ? as_type<int>(_1782) : as_type<int>(_223);
    bool _1786 = uint(_1762) >= uint(_1257);
    int _1788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1790 = _1788 != 0;
    int _1792 = abs(_1722);
    bool _1794 = !_1702;
    int _1796 = _1794 ? 0 : 1;
    bool _1798 = !_1710;
    int _1800 = _1798 ? 0 : 1;
    int _1802 = _1768 * _1792;
    bool _1804 = !_1620;
    float _1806 = _1804 ? _223 : as_type<float>(_1784);
    int _1808 = abs(_1772);
    bool _1810 = !_1790;
    float _1812 = _1810 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1814 = !_1786;
    int _1816 = _1814 ? 0 : (-1);
    int _1818 = _1698 * _1808;
    int _1820 = _1818 + _1249;
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1824 = _1822 != 0;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1828 = _1826 != 0;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1832 = _1830 != 0;
    int _1834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1836 = _1834 != 0;
    int _1838 = abs(_1796);
    int _1840 = abs(_1800);
    float _1842 = float(_1257);
    int _1844 = _1776 * _1838;
    int _1846 = _1844 + _1802;
    float _1848 = float(_1294);
    float _1850 = _1508 * _165;
    int _1852 = abs(_1780);
    float _1854 = _1842 * _1586;
    bool _1856 = !_1824;
    int _1858 = _1856 ? 0 : 1;
    float _1860 = _1740 * _1842;
    int _1862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _1864 = _1862 != 0;
    float _1866 = trunc(_1854);
    int _1868 = int(_1866);
    bool _1870 = _1848 >= _1842;
    bool _1872 = isnan(_1848);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan(_1842);
    bool _1878 = _1874 || _1876;
    float _1880 = float(_1878);
    int _1882 = _1820 * _1840;
    int _1884 = _1882 + _1846;
    float _1886 = _1730 * _165;
    int _1888 = ~_1746;
    int _1890 = _1888 + _1816;
    int _1892 = _1890 + 1;
    bool _1894 = _1257 == 0;
    float _1896 = trunc(_1880);
    int _1898 = int(_1896);
    int _1900 = _1698 * _1852;
    int _1902 = _1900 + _1884;
    int _1904 = _1257 + (-1);
    int _1906 = _1257 * _1892;
    int _1908 = _1906 + _1294;
    float _1910 = as_type<float>(_1852);
    float _1912 = _1812;
    float _1914 = _1730;
    float _1916 = as_type<float>(_1868);
    float _1918 = as_type<float>(_1902);
    if (_1864)
    {
        float _1920 = in.m_72.y;
        _1910 = _1920;
    }
    float _1922 = _1910;
    float _1924 = float(uint(_1452));
    float _1926 = float(uint(_1902));
    float _1928 = trunc(_1850);
    int _1930 = int(_1928);
    bool _1932 = !_1894;
    int _1934 = _1932 ? _1908 : (-1);
    bool _1936 = !_1828;
    int _1938 = _1936 ? 0 : 1;
    float _1940 = as_type<float>(_1239) * _1926;
    int _1942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1944 = _1942 != 0;
    int _1946 = abs(_1938);
    float _1948 = trunc(_1940);
    float _1950 = precise::max(_1948, 0.0);
    uint _1952 = uint(_1950);
    int _1954 = ~_1898;
    int _1956 = _1954 + 1;
    int _1958 = _1956 + 1;
    bool _1960 = !_1832;
    int _1962 = _1960 ? 0 : 1;
    bool _1964 = _1546 > 0.5;
    int _1966 = _1934 * _1958;
    int _1968 = ~_1169;
    int _1970 = _1968 + 1;
    float _1972 = trunc(_1860);
    int _1974 = int(_1972);
    int _1976 = abs(_1962);
    int _1978 = _1898 * _1904;
    int _1980 = _1978 + _1966;
    float _1982 = _1854;
    bool _1984 = _1944;
    if (_1944)
    {
        float _1986 = in.m_72.x;
        _1982 = _1986;
    }
    float _1988 = _1982;
    int _1990 = abs(as_type<int>(_1812));
    float _1992 = as_type<float>(_1990);
    if (_1864)
    {
        float _1994 = _1922 * 3.1415927410125732421875;
        _1912 = _1994;
    }
    float _1996 = _1912;
    int _1998 = abs(_1858);
    float _2000 = 1.0 / _1924;
    int _2002 = _1970 * int(_1952);
    int _2004 = _2002 + _1902;
    float _2006 = float(uint(_1930));
    float _2008 = float(uint(_2004));
    int _2010 = _1980 * _1946;
    float _2012 = trunc(_1886);
    int _2014 = int(_2012);
    int _2016 = _1974 * _1990;
    int _2018 = _2016 + _1294;
    if (_1864)
    {
        float _2020 = _1996 * 0.15915493667125701904296875;
        _1992 = _2020;
    }
    float _2022 = _1992;
    int _2024 = as_type<int>(_1510) + (-2);
    float _2026 = as_type<float>(_1239) * _2008;
    bool _2028 = !_1836;
    int _2030 = _2028 ? 0 : 1;
    int _2032 = _1868 * _1998;
    int _2034 = _2032 + _2010;
    float _2036 = float(uint(_1820));
    float _2038 = as_type<float>(_2024) * _2006;
    int _2040 = abs(_2030);
    int _2042 = _2018 * _1976;
    int _2044 = _2042 + _2034;
    float _2046 = trunc(_2026);
    float _2048 = precise::max(_2046, 0.0);
    uint _2050 = uint(_2048);
    int _2052 = as_type<int>(_2000) + (-2);
    float _2054 = _1988;
    if (_1944)
    {
        float _2056 = _1988 * 3.1415927410125732421875;
        _2054 = _2056;
    }
    float _2058 = _2054;
    int _2060 = _1974 * _2040;
    int _2062 = _2060 + _2044;
    int _2064 = ~_1328;
    int _2066 = _2064 + 1;
    float _2068 = float(uint(_2014));
    if (_1944)
    {
        float _2070 = _2058 * 0.15915493667125701904296875;
        _1914 = _2070;
    }
    float _2072 = _1914;
    float _2074 = trunc(_2038);
    float _2076 = precise::max(_2074, 0.0);
    uint _2078 = uint(_2076);
    float _2080 = float(uint(_2062));
    float _2082 = as_type<float>(_2052) * _2068;
    int _2084 = ~_1169;
    int _2086 = _2084 + 1;
    float _2088 = float(_1452);
    if (_1864)
    {
        float _2090 = _2022 * 6.283185482025146484375;
        float _2092 = sin(_2090);
        _1916 = _2092;
    }
    float _2094 = _1916;
    int _2096 = ~_1452;
    int _2098 = _2096 + 1;
    float _2100 = float(_2014);
    float _2102 = trunc(_2082);
    float _2104 = precise::max(_2102, 0.0);
    uint _2106 = uint(_2104);
    float _2108 = as_type<float>(_1322) * _2080;
    int _2110 = int(_1952) + int(_2050);
    float _2112 = _1554 * _1556;
    int _2114 = _2066 * int(_2078);
    int _2116 = _2114 + _1930;
    int _2118 = _2086 * _2110;
    int _2120 = _2118 + _1902;
    float _2122 = trunc(_2108);
    float _2124 = precise::max(_2122, 0.0);
    uint _2126 = uint(_2124);
    float _2128 = float(uint(_2116));
    bool _2130 = uint(_2120) >= uint(_1169);
    float _2132 = as_type<float>(_2024) * _2128;
    int _2134 = _2098 * int(_2106);
    int _2136 = _2134 + _2014;
    int _2138 = ~_1257;
    int _2140 = _2138 + 1;
    float _2142 = _2072;
    bool _2144 = _2130;
    if (_1944)
    {
        float _2146 = _2072 * 6.283185482025146484375;
        float _2148 = sin(_2146);
        _2142 = _2148;
    }
    float _2150 = _2142;
    bool _2152 = !_2130;
    float _2154 = _2152 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2156 = float(uint(_2136));
    int _2158 = ~_2110;
    int _2160 = _2158 + as_type<int>(_2154);
    int _2162 = _2160 + 1;
    int _2164 = _2140 * int(_2126);
    int _2166 = _2164 + _2062;
    float _2168 = _2154;
    if (!_1944)
    {
        _2168 = _213;
    }
    float _2170 = _2168;
    float _2172 = trunc(_2132);
    float _2174 = precise::max(_2172, 0.0);
    uint _2176 = uint(_2174);
    float _2178 = as_type<float>(_2052) * _2156;
    float _2180 = float(uint(_2166));
    int _2182 = _1169 * _2162;
    int _2184 = _2182 + _1902;
    float _2186 = _2170;
    if (!_1864)
    {
        _1918 = _223;
    }
    float _2188 = _1918;
    float _2190 = as_type<float>(_1322) * _2180;
    float _2192 = floor(_2112);
    float _2194 = _2188;
    if (_1944)
    {
        bool _2196 = _2150 > 0.5;
        _2144 = _2196;
    }
    bool _2198 = _2144;
    bool _2200 = !_1728;
    int _2202 = _2200 ? _2184 : (-1);
    if (_1944)
    {
        float _2204 = -_213;
        float _2206 = _2198 ? _2204 : _213;
        _2186 = _2206;
    }
    float _2208 = _2186;
    if (_1864)
    {
        bool _2210 = _2094 > 0.5;
        _1984 = _2210;
    }
    bool _2212 = _1984;
    float _2214 = trunc(_2178);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    int _2220 = ~_1328;
    int _2222 = _2220 + 1;
    int _2224 = int(_2078) + int(_2176);
    int _2226 = _2202 & 3;
    bool _2228 = _2226 != 0;
    if (_1864)
    {
        float _2230 = -_223;
        float _2232 = _2212 ? _2230 : _223;
        _2194 = _2232;
    }
    float _2234 = _2194;
    float _2236 = trunc(_2190);
    float _2238 = precise::max(_2236, 0.0);
    uint _2240 = uint(_2238);
    bool _2242 = uint(_2226) > 1u;
    int _2244 = _2222 * _2224;
    int _2246 = _2244 + _1930;
    int _2248 = _2202 & 3;
    bool _2250 = _2248 != 0;
    float _2252 = -_2192;
    float _2254 = _2112 + _2252;
    float _2256 = _1542 * _1552;
    float _2258 = float(_1328);
    int _2260 = _2250 ? 0 : 1;
    float _2262 = floor(_2256);
    bool _2264 = uint(_2246) >= uint(_1328);
    float _2266 = _2254 * _2258;
    int _2268 = int(_2106) + int(_2218);
    float _2270 = _2258 * _1586;
    float _2272 = float(_1930);
    int _2274 = int(_2126) + int(_2240);
    float _2276 = trunc(_2266);
    int _2278 = int(_2276);
    int _2280 = ~_1257;
    int _2282 = _2280 + 1;
    int _2284 = ~_1452;
    int _2286 = _2284 + 1;
    bool _2288 = _1548 > 0.5;
    bool _2290 = _2272 >= _2258;
    bool _2292 = isnan(_2272);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan(_2258);
    bool _2298 = _2294 || _2296;
    float _2300 = float(_2298);
    float _2302 = -_2262;
    float _2304 = _2256 + _2302;
    float _2306 = trunc(_2270);
    int _2308 = int(_2306);
    int _2310 = ~_2260;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    int _2316 = _2286 * _2268;
    int _2318 = _2316 + _2014;
    int _2320 = _2314;
    if (!_2242)
    {
        int _2322 = ~_2260;
        int _2324 = _2322 + 1;
        _2320 = _2324;
    }
    int _2326 = _2320;
    int _2328 = _2282 * _2274;
    int _2330 = _2328 + _2062;
    float _2332 = -_223;
    int _2334 = _1964 ? as_type<int>(_2332) : as_type<int>(_223);
    float _2336 = trunc(_2300);
    int _2338 = int(_2336);
    float _2340 = -_213;
    int _2342 = _2288 ? as_type<int>(_2340) : as_type<int>(_213);
    int _2344 = int(_2264);
    int _2346 = _2242 ? 2 : 0;
    int _2348 = _2344 | _2346;
    int _2350 = _2228 ? 4 : 0;
    int _2352 = _2348 | _2350;
    int _2354 = _1836 ? 8 : 0;
    int _2356 = _2352 | _2354;
    int _2358 = _1964 ? 16 : 0;
    int _2360 = _2356 | _2358;
    int _2362 = _2288 ? 32 : 0;
    int _2364 = _2360 | _2362;
    int _2366 = _1710 ? 64 : 0;
    int _2368 = _2364 | _2366;
    int _2370 = _2368 & 4;
    int _2372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2374 = _2372 != 0;
    int _2376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2378 = _2376 != 0;
    int _2380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2382 = _2380 != 0;
    int _2384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2386 = _2384 != 0;
    int _2388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2390 = _2388 != 0;
    bool _2392 = !_2386;
    int _2394 = _2392 ? 0 : 1;
    bool _2396 = !_2390;
    int _2398 = _2396 ? 0 : 1;
    bool _2400 = !_2264;
    int _2402 = _2400 ? 0 : (-1);
    int _2404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2406 = _2404 != 0;
    bool _2408 = uint(_2318) >= uint(_1452);
    float _2410 = as_type<float>(_1239) * _2036;
    bool _2412 = uint(_2330) >= uint(_1257);
    bool _2414 = uint(_2226) >= 2u;
    bool _2416 = !_2406;
    int _2418 = _2416 ? 0 : 1;
    float _2420 = trunc(_2410);
    float _2422 = precise::max(_2420, 0.0);
    uint _2424 = uint(_2422);
    bool _2426 = !_2408;
    int _2428 = _2426 ? 0 : (-1);
    bool _2430 = !_2412;
    int _2432 = _2430 ? 0 : (-1);
    int _2434 = _2414 ? 0 : 1;
    int _2436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2438 = _2436 != 0;
    int _2440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2442 = _2440 != 0;
    int _2444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2446 = _2444 != 0;
    int _2448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2450 = _2448 != 0;
    int _2452 = ~_2224;
    int _2454 = _2452 + _2402;
    int _2456 = _2454 + 1;
    int _2458 = ~_2338;
    int _2460 = _2458 + 1;
    int _2462 = _2460 + 1;
    bool _2464 = !_2442;
    int _2466 = _2464 ? 0 : 1;
    int _2468 = _1328 * _2456;
    int _2470 = _2468 + _1930;
    bool _2472 = _1328 == 0;
    int _2474 = abs(_2394);
    bool _2476 = !_2472;
    int _2478 = _2476 ? _2470 : (-1);
    bool _2480 = !_2378;
    int _2482 = _2480 ? 0 : 1;
    int _2484 = _2278 * _2474;
    int _2486 = _2484 + _1930;
    bool _2488 = _2100 >= _2088;
    bool _2490 = isnan(_2100);
    bool _2492 = _2488 || _2490;
    bool _2494 = isnan(_2088);
    bool _2496 = _2492 || _2494;
    float _2498 = float(_2496);
    int _2500 = _2478 * _2462;
    int _2502 = _1328 + (-1);
    float _2504 = _2088 * _1586;
    float _2506 = _2304 * _2088;
    bool _2508 = !_2374;
    int _2510 = _2508 ? 0 : 1;
    float _2512 = trunc(_2498);
    int _2514 = int(_2512);
    int _2516 = ~_1169;
    int _2518 = _2516 + 1;
    int _2520 = _2338 * _2502;
    int _2522 = _2520 + _2500;
    int _2524 = abs(_2482);
    bool _2526 = !_2382;
    int _2528 = _2526 ? 0 : 1;
    float _2530 = trunc(_2504);
    int _2532 = int(_2530);
    int _2534 = abs(_2510);
    int _2536 = _2518 * int(_2424);
    int _2538 = _2536 + _1820;
    int _2540 = abs(_2528);
    int _2542 = _2522 * _2524;
    float _2544 = float(uint(_2018));
    float _2546 = trunc(_2506);
    int _2548 = int(_2546);
    int _2550 = _2308 * _2534;
    int _2552 = _2550 + _2542;
    float _2554 = float(uint(_2538));
    float _2556 = as_type<float>(_1322) * _2544;
    int _2558 = ~_2268;
    int _2560 = _2558 + _2428;
    int _2562 = _2560 + 1;
    int _2564 = _2486 * _2540;
    int _2566 = _2564 + _2552;
    int _2568 = abs(_2398);
    float _2570 = as_type<float>(_1239) * _2554;
    bool _2572 = !_2438;
    int _2574 = _2572 ? 0 : 1;
    int _2576 = _1452 * _2562;
    int _2578 = _2576 + _2014;
    float _2580 = trunc(_2556);
    float _2582 = precise::max(_2580, 0.0);
    uint _2584 = uint(_2582);
    bool _2586 = _1452 == 0;
    int _2588 = abs(_2418);
    int _2590 = ~_2514;
    int _2592 = _2590 + 1;
    int _2594 = _2592 + 1;
    float _2596 = trunc(_2570);
    float _2598 = precise::max(_2596, 0.0);
    uint _2600 = uint(_2598);
    bool _2602 = !_2586;
    int _2604 = _2602 ? _2578 : (-1);
    int _2606 = _2278 * _2568;
    int _2608 = _2606 + _2566;
    float _2610 = float(uint(_2486));
    int _2612 = ~_1257;
    int _2614 = _2612 + 1;
    int _2616 = _2604 * _2594;
    int _2618 = _1452 + (-1);
    float _2620 = as_type<float>(_2024) * _2610;
    float _2622 = float(uint(_2608));
    int _2624 = _2514 * _2618;
    int _2626 = _2624 + _2616;
    int _2628 = abs(_2466);
    int _2630 = _2614 * int(_2584);
    int _2632 = _2630 + _2018;
    float _2634 = trunc(_2620);
    float _2636 = precise::max(_2634, 0.0);
    uint _2638 = uint(_2636);
    float _2640 = as_type<float>(_2024) * _2622;
    int _2642 = int(_2424) + int(_2600);
    int _2644 = _2626 * _2628;
    float _2646 = float(uint(_2632));
    int _2648 = abs(_2574);
    float _2650 = trunc(_2640);
    float _2652 = precise::max(_2650, 0.0);
    uint _2654 = uint(_2652);
    float _2656 = as_type<float>(_1322) * _2646;
    bool _2658 = !_2446;
    int _2660 = _2658 ? 0 : 1;
    int _2662 = ~_1169;
    int _2664 = _2662 + 1;
    int _2666 = _2532 * _2648;
    int _2668 = _2666 + _2644;
    bool _2670 = _2226 != 3;
    float _2672 = trunc(_2656);
    float _2674 = precise::max(_2672, 0.0);
    uint _2676 = uint(_2674);
    int _2678 = ~_1328;
    int _2680 = _2678 + 1;
    int _2682 = ~_1328;
    int _2684 = _2682 + 1;
    int _2686 = _2680 * int(_2638);
    int _2688 = _2686 + _2486;
    int _2690 = ~_2274;
    int _2692 = _2690 + _2432;
    int _2694 = _2692 + 1;
    int _2696 = _2684 * int(_2654);
    int _2698 = _2696 + _2608;
    int _2700 = abs(_2660);
    int _2702 = _2664 * _2642;
    int _2704 = _2702 + _1820;
    float _2706 = float(uint(_2688));
    int _2708 = _1257 * _2694;
    int _2710 = _2708 + _2062;
    int _2712 = ~_2434;
    int _2714 = _2712 + 1;
    int _2716 = _2714 + 1;
    int _2718 = _2716;
    if (_2670)
    {
        int _2720 = ~_2434;
        int _2722 = _2720 + 1;
        _2718 = _2722;
    }
    int _2724 = _2718;
    float _2726 = as_type<float>(_2024) * _2706;
    float _2728 = float(uint(_2698));
    bool _2730 = uint(_2704) >= uint(_1169);
    float _2732 = as_type<float>(_2024) * _2728;
    bool _2734 = !_2450;
    int _2736 = _2734 ? 0 : 1;
    float _2738 = trunc(_2726);
    float _2740 = precise::max(_2738, 0.0);
    uint _2742 = uint(_2740);
    bool _2744 = _1257 == 0;
    int _2746 = _2548 * _2588;
    int _2748 = _2746 + _2014;
    int _2750 = abs(_2736);
    int _2752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2754 = _2752 != 0;
    int _2756 = _2748 * _2700;
    int _2758 = _2756 + _2668;
    bool _2760 = !_2744;
    int _2762 = _2760 ? _2710 : (-1);
    float _2764 = trunc(_2732);
    float _2766 = precise::max(_2764, 0.0);
    uint _2768 = uint(_2766);
    bool _2770 = !_2754;
    int _2772 = _2770 ? 0 : 1;
    bool _2774 = !_2730;
    int _2776 = _2774 ? 0 : (-1);
    int _2778 = _2548 * _2750;
    int _2780 = _2778 + _2758;
    int _2782 = _2762 & 3;
    bool _2784 = _2782 != 0;
    int _2786 = _2762 & 3;
    bool _2788 = _2786 != 0;
    int _2790 = _2784 ? 0 : 1;
    bool _2792 = uint(_2786) > 1u;
    float _2794 = float(uint(_2780));
    int _2796 = ~_2642;
    int _2798 = _2796 + _2776;
    int _2800 = _2798 + 1;
    int _2802 = int(_2638) + int(_2742);
    float _2804 = as_type<float>(_2052) * _2794;
    int _2806 = ~_1328;
    int _2808 = _2806 + 1;
    int _2810 = _1169 * _2800;
    int _2812 = _2810 + _1820;
    int _2814 = ~_2790;
    int _2816 = _2814 + 1;
    int _2818 = _2816 + 1;
    int _2820 = int(_2584) + int(_2676);
    int _2822 = ~_1257;
    int _2824 = _2822 + 1;
    int _2826 = _2818;
    if (!_2792)
    {
        int _2828 = ~_2790;
        int _2830 = _2828 + 1;
        _2826 = _2830;
    }
    int _2832 = _2826;
    int _2834 = ~_1328;
    int _2836 = _2834 + 1;
    int _2838 = int(_2654) + int(_2768);
    float _2840 = trunc(_2804);
    float _2842 = precise::max(_2840, 0.0);
    uint _2844 = uint(_2842);
    bool _2846 = _1169 == 0;
    int _2848 = _2824 * _2820;
    int _2850 = _2848 + _2018;
    int _2852 = _2808 * _2838;
    int _2854 = _2852 + _2608;
    bool _2856 = uint(_2786) >= 2u;
    int _2858 = ~_1452;
    int _2860 = _2858 + 1;
    int _2862 = _2836 * _2802;
    int _2864 = _2862 + _2486;
    int _2866 = _2856 ? 0 : 1;
    bool _2868 = uint(_2854) >= uint(_1328);
    bool _2870 = !_2846;
    int _2872 = _2870 ? _2812 : (-1);
    bool _2874 = uint(_2850) >= uint(_1257);
    bool _2876 = !_2868;
    int _2878 = _2876 ? 0 : (-1);
    int _2880 = _2860 * int(_2844);
    int _2882 = _2880 + _2780;
    bool _2884 = !_2874;
    int _2886 = _2884 ? 0 : (-1);
    bool _2888 = _2786 != 3;
    int _2890 = ~_2838;
    int _2892 = _2890 + _2878;
    int _2894 = _2892 + 1;
    int _2896 = ~_2820;
    int _2898 = _2896 + _2886;
    int _2900 = _2898 + 1;
    bool _2902 = uint(_2864) >= uint(_1328);
    int _2904 = _1328 * _2894;
    int _2906 = _2904 + _2608;
    float _2908 = float(uint(_2882));
    int _2910 = _1257 * _2900;
    int _2912 = _2910 + _2018;
    bool _2914 = !_2902;
    int _2916 = _2914 ? 0 : (-1);
    bool _2918 = _1257 == 0;
    float _2920 = as_type<float>(_2052) * _2908;
    bool _2922 = !_2472;
    int _2924 = _2922 ? _2906 : (-1);
    int _2926 = ~_2866;
    int _2928 = _2926 + 1;
    int _2930 = _2928 + 1;
    float _2932 = trunc(_2920);
    float _2934 = precise::max(_2932, 0.0);
    uint _2936 = uint(_2934);
    bool _2938 = _2370 != 0;
    int _2940 = _2930;
    if (_2888)
    {
        int _2942 = ~_2866;
        int _2944 = _2942 + 1;
        _2940 = _2944;
    }
    int _2946 = _2940;
    bool _2948 = !_2918;
    int _2950 = _2948 ? _2912 : (-1);
    int _2952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2954 = _2952 != 0;
    int _2956 = _2924 & 3;
    bool _2958 = _2956 != 0;
    int _2960 = ~_2802;
    int _2962 = _2960 + _2916;
    int _2964 = _2962 + 1;
    bool _2966 = !_2938;
    int _2968 = _2966 ? 0 : 1;
    bool _2970 = !_2954;
    int _2972 = _2970 ? 0 : 1;
    int _2974 = _1328 * _2964;
    int _2976 = _2974 + _2486;
    bool _2978 = uint(_2956) > 1u;
    int _2980 = _2924 & 3;
    bool _2982 = _2980 != 0;
    int _2984 = _2982 ? 0 : 1;
    bool _2986 = _2956 != 3;
    float _2988 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2990 = _2988 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2992 = !_2788;
    int _2994 = _2992 ? 0 : 1;
    bool _2996 = uint(_2956) >= 2u;
    float _2998 = 1.0 / _2990;
    int _3000 = int(_2844) + int(_2936);
    int _3002 = ~_2984;
    int _3004 = _3002 + 1;
    int _3006 = _3004 + 1;
    int _3008 = _3006;
    if (!_2978)
    {
        int _3010 = ~_2984;
        int _3012 = _3010 + 1;
        _3008 = _3012;
    }
    int _3014 = _3008;
    int _3016 = _2996 ? 0 : 1;
    int _3018 = ~_3016;
    int _3020 = _3018 + 1;
    int _3022 = _3020 + 1;
    int _3024 = _3022;
    if (_2986)
    {
        int _3026 = ~_3016;
        int _3028 = _3026 + 1;
        _3024 = _3028;
    }
    int _3030 = _3024;
    float _3032 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3034 = _3032 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3036 = in.m_60.x;
    float _3038 = in.m_60.y;
    float _3040 = in.m_60.z;
    bool _3042 = _2786 != 3;
    int _3044 = ~_1452;
    int _3046 = _3044 + 1;
    float _3048 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3050 = _3048 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3052 = 1.0 / _3034;
    bool _3054 = _2226 != 3;
    int _3056 = _3046 * _3000;
    int _3058 = _3056 + _2780;
    float _3060 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3062 = _3060 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3064 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3066 = _3064 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3068 = 1.0 / _3050;
    int _3070 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3072 = _3070 != 0;
    float _3074 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3076 = _3074 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3078 = !_2958;
    int _3080 = _3078 ? 0 : 1;
    bool _3082 = !_3054;
    int _3084 = _3082 ? 0 : (-1);
    float _3086 = _3038 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _3088 = !_3042;
    int _3090 = _3088 ? 0 : (-1);
    float _3092 = 1.0 / _3066;
    bool _3094 = !_2472;
    int _3096 = _3094 ? _2976 : (-1);
    float _3098 = _3038 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _3100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3102 = _3100 != 0;
    float _3104 = _3038 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _3106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3108 = _3106 != 0;
    float _3110 = fma(_3036, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3086);
    int _3112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3114 = _3112 != 0;
    float _3116 = fma(_3036, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3098);
    int _3118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3120 = _3118 != 0;
    float _3122 = fma(_3036, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3104);
    bool _3124 = uint(_3058) >= uint(_1452);
    float _3126 = 1.0 / _3062;
    bool _3128 = !_3124;
    int _3130 = _3128 ? 0 : (-1);
    int _3132 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3134 = _3132 != 0;
    float _3136 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3138 = _3136 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3140 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3142 = _3140 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3144 = 1.0 / _3076;
    float _3146 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3148 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3146;
    float _3150 = _3138 * _3052;
    float _3152 = fma(_3040, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3116);
    int _3154 = ~_1452;
    int _3156 = _3154 + 1;
    float _3158 = _3148 * _2998;
    float _3160 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3162 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3160;
    float _3164 = 1.0 / _3142;
    float _3166 = fma(_3158, _1598, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3168 = _3162 * _3068;
    float _3170 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3172 = _3170 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3174 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3176 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3174;
    float _3178 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3180 = _3178 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3182 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3184 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3182;
    float _3186 = float(uint(_2748));
    float _3188 = _3172 * _3092;
    float _3190 = _3176 * _3126;
    float _3192 = _3180 * _3144;
    float _3194 = fma(_3040, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3122);
    float _3196 = as_type<float>(_2052) * _3186;
    bool _3198 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3200 = isnan(_1149);
    bool _3202 = _3198 || _3200;
    bool _3204 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3206 = _3202 || _3204;
    float _3208 = float(_3206);
    float _3210 = _3184 * _3164;
    float _3212 = fma(_3040, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3110);
    float _3214 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3216 = _1149 + _3214;
    float _3218 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3220 = _1149 + _3218;
    float _3222 = trunc(_3196);
    float _3224 = precise::max(_3222, 0.0);
    uint _3226 = uint(_3224);
    float _3228 = -_3208;
    float _3230 = _3228 + 1.0;
    float _3232 = fma(_3150, _3216, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3234 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3236 = _1149 + _3234;
    float _3238 = fma(_3168, _3220, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3240 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3242 = _1149 + _3240;
    bool _3244 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3246 = isnan(_1149);
    bool _3248 = _3244 || _3246;
    bool _3250 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3252 = _3248 || _3250;
    float _3254 = float(_3252);
    float _3256 = fma(_3188, _3236, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    bool _3258 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3260 = isnan(_1149);
    bool _3262 = _3258 || _3260;
    bool _3264 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3266 = _3262 || _3264;
    float _3268 = float(_3266);
    float _3270 = fma(_3190, _3242, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    int _3272 = ~_3000;
    int _3274 = _3272 + _3130;
    int _3276 = _3274 + 1;
    float _3278 = -_3254;
    float _3280 = _3278 + 1.0;
    int _3282 = abs(_2772);
    float _3284 = -_3268;
    float _3286 = _3284 + 1.0;
    float _3288 = _3268 * _3230;
    bool _3290 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3292 = isnan(_1149);
    bool _3294 = _3290 || _3292;
    bool _3296 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3298 = _3294 || _3296;
    float _3300 = float(_3298);
    int _3302 = _3156 * int(_3226);
    int _3304 = _3302 + _2748;
    float _3306 = _3254 * _3286;
    bool _3308 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3310 = isnan(_1149);
    bool _3312 = _3308 || _3310;
    bool _3314 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3316 = _3312 || _3314;
    float _3318 = float(_3316);
    int _3320 = _1452 * _3276;
    int _3322 = _3320 + _2780;
    float _3324 = _3300 * _3280;
    float _3326 = -_3300;
    float _3328 = _3326 + 1.0;
    bool _3330 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3332 = isnan(_1149);
    bool _3334 = _3330 || _3332;
    bool _3336 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3338 = _3334 || _3336;
    float _3340 = float(_3338);
    float _3342 = -_3318;
    float _3344 = _3342 + 1.0;
    float _3346 = float(uint(_3304));
    float _3348 = _3318 * _3328;
    float _3350 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3352 = _1149 + _3350;
    float _3354 = _3340 * _3344;
    float _3356 = -_3340;
    float _3358 = _3356 + 1.0;
    bool _3360 = !_2586;
    int _3362 = _3360 ? _3322 : (-1);
    float _3364 = as_type<float>(_2052) * _3346;
    bool _3366 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3368 = isnan(_1149);
    bool _3370 = _3366 || _3368;
    bool _3372 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3374 = _3370 || _3372;
    float _3376 = float(_3374);
    float _3378 = fma(_3192, _3352, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _3380 = !_3114;
    int _3382 = _3380 ? 0 : 1;
    float _3384 = trunc(_3364);
    float _3386 = precise::max(_3384, 0.0);
    uint _3388 = uint(_3386);
    int _3390 = _3362 & 3;
    bool _3392 = _3390 != 0;
    float _3394 = _3376 * _3358;
    bool _3396 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3398 = isnan(_1149);
    bool _3400 = _3396 || _3398;
    bool _3402 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3404 = _3400 || _3402;
    float _3406 = float(_3404);
    float _3408 = -_3376;
    float _3410 = _3408 + 1.0;
    bool _3412 = !_3120;
    int _3414 = _3412 ? 0 : 1;
    float _3416 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3418 = _1149 + _3416;
    bool _3420 = uint(_3390) > 1u;
    float _3422 = _3406 * _3410;
    int _3424 = _2202 >> 31;
    float _3426 = fma(_3210, _3418, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _3428 = !_3392;
    int _3430 = _3428 ? 0 : 1;
    float _3432 = _1149;
    if (_3102)
    {
        float _3434 = in.m_72.x;
        _3432 = _3434;
    }
    float _3436 = _3432;
    int _3438 = _3362 & 3;
    bool _3440 = _3438 != 0;
    float _3442 = _3166 * _3422;
    int _3444 = _3424 & 3;
    float _3446 = -_3406;
    float _3448 = _3446 + 1.0;
    int _3450 = _3440 ? 0 : 1;
    float _3452 = _3152 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _3454 = _2202 + _3444;
    float _3456 = fma(_3448, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3442);
    bool _3458 = _2956 != 3;
    float _3460 = _3212 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _3462 = ~_3450;
    int _3464 = _3462 + 1;
    int _3466 = _3464 + 1;
    float _3468 = fma(_3232, _3394, _3456);
    int _3470 = _3466;
    if (!_3420)
    {
        int _3472 = ~_3450;
        int _3474 = _3472 + 1;
        _3470 = _3474;
    }
    int _3476 = _3470;
    float _3478 = _3194 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _3480 = _3454 >> 2;
    float _3482 = fma(_3238, _3354, _3468);
    bool _3484 = !_3458;
    int _3486 = _3484 ? 0 : (-1);
    bool _3488 = uint(_3390) >= 2u;
    float _3490 = fma(_3256, _3348, _3482);
    int _3492 = _3480 << 4;
    int _3494 = _3492 + 368;
    int _3496 = _3488 ? 0 : 1;
    float _3498 = _3436;
    if (_3102)
    {
        float _3500 = _3436 * 3.1415927410125732421875;
        _3498 = _3500;
    }
    float _3502 = _3498;
    bool _3504 = _3390 != 3;
    float _3506 = fma(_3270, _3324, _3490);
    bool _3508 = _3390 != 3;
    float _3510 = 0.0;
    if (_3102)
    {
        float _3512 = _3502 * 0.15915493667125701904296875;
        _3510 = _3512;
    }
    float _3514 = _3510;
    uint _3516 = uint(int(uint(_3494) >> uint(2)));
    uint _3518 = uint(int(uint(int(_3516)) >> uint(2)));
    int _3520 = int(_3516) & 3;
    float _3522 = (*spvDescriptorSet0.vp_c9)._m0[int(_3518)][_3520];
    int _3524 = int(_3516) + 1;
    uint _3526 = uint(int(uint(_3524) >> uint(2)));
    int _3528 = _3524 & 3;
    float _3530 = (*spvDescriptorSet0.vp_c9)._m0[int(_3526)][_3528];
    int _3532 = _2762 >> 31;
    int _3534 = _2924 >> 31;
    int _3536 = _3532 & 3;
    float _3538 = _3514;
    if (_3102)
    {
        float _3540 = _3514 * 6.283185482025146484375;
        float _3542 = sin(_3540);
        _3538 = _3542;
    }
    float _3544 = _3538;
    int _3546 = ~_1452;
    int _3548 = _3546 + 1;
    int _3550 = _3534 & 3;
    int _3552 = _2762 + _3536;
    int _3554 = _3362 >> 31;
    int _3556 = int(_3226) + int(_3388);
    int _3558 = _2924 + _3550;
    int _3560 = _3552 >> 2;
    int _3562 = _3548 * _3556;
    int _3564 = _3562 + _2748;
    int _3566 = _3554 & 3;
    int _3568 = _3558 >> 2;
    int _3570 = _3560 << 4;
    int _3572 = _3570 + 512;
    int _3574 = _3362 + _3566;
    bool _3576 = !_3508;
    int _3578 = _3576 ? 0 : (-1);
    uint _3580 = uint(int(uint(_3572) >> uint(2)));
    uint _3582 = uint(int(uint(int(_3580)) >> uint(2)));
    int _3584 = int(_3580) & 3;
    float _3586 = (*spvDescriptorSet0.vp_c9)._m0[int(_3582)][_3584];
    int _3588 = int(_3580) + 1;
    uint _3590 = uint(int(uint(_3588) >> uint(2)));
    int _3592 = _3588 & 3;
    float _3594 = (*spvDescriptorSet0.vp_c9)._m0[int(_3590)][_3592];
    int _3596 = _3568 << 4;
    int _3598 = _3596 + 656;
    bool _3600 = uint(_3564) >= uint(_1452);
    int _3602 = _3574 >> 2;
    bool _3604 = !_3600;
    int _3606 = _3604 ? 0 : (-1);
    uint _3608 = uint(int(uint(_3598) >> uint(2)));
    uint _3610 = uint(int(uint(int(_3608)) >> uint(2)));
    int _3612 = int(_3608) & 3;
    float _3614 = (*spvDescriptorSet0.vp_c9)._m0[int(_3610)][_3612];
    int _3616 = int(_3608) + 1;
    uint _3618 = uint(int(uint(_3616) >> uint(2)));
    int _3620 = _3616 & 3;
    float _3622 = (*spvDescriptorSet0.vp_c9)._m0[int(_3618)][_3620];
    int _3624 = _3602 << 4;
    int _3626 = _3624 + 800;
    int _3628 = ~_3556;
    int _3630 = _3628 + _3606;
    int _3632 = _3630 + 1;
    float _3634 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3636 = _3600;
    if (_3102)
    {
        bool _3638 = _3544 > 0.5;
        _3636 = _3638;
    }
    bool _3640 = _3636;
    uint _3642 = uint(int(uint(_3626) >> uint(2)));
    uint _3644 = uint(int(uint(int(_3642)) >> uint(2)));
    int _3646 = int(_3642) & 3;
    float _3648 = (*spvDescriptorSet0.vp_c9)._m0[int(_3644)][_3646];
    int _3650 = int(_3642) + 1;
    uint _3652 = uint(int(uint(_3650) >> uint(2)));
    int _3654 = _3650 & 3;
    float _3656 = (*spvDescriptorSet0.vp_c9)._m0[int(_3652)][_3654];
    int _3658 = ~_3496;
    int _3660 = _3658 + 1;
    int _3662 = _3660 + 1;
    int _3664 = _1452 * _3632;
    int _3666 = _3664 + _2748;
    int _3668 = abs(_2326);
    float _3670 = -_3634;
    float _3672 = fma(_1616, 2.0, _3670);
    int _3674 = _3662;
    if (_3504)
    {
        int _3676 = ~_3496;
        int _3678 = _3676 + 1;
        _3674 = _3678;
    }
    int _3680 = _3674;
    float _3682 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3684 = int(_3682);
    bool _3686 = _1558 != 1;
    int _3688 = _3494 + 8;
    uint _3690 = uint(int(uint(_3688) >> uint(2)));
    uint _3692 = uint(int(uint(int(_3690)) >> uint(2)));
    int _3694 = int(_3690) & 3;
    float _3696 = (*spvDescriptorSet0.vp_c9)._m0[int(_3692)][_3694];
    int _3698 = int(_3690) + 1;
    uint _3700 = uint(int(uint(_3698) >> uint(2)));
    int _3702 = _3698 & 3;
    float _3704 = (*spvDescriptorSet0.vp_c9)._m0[int(_3700)][_3702];
    int _3706 = abs(_2968);
    float _3708 = -_165;
    float _3710 = fma(_3708, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3672);
    int _3712 = abs(_2832);
    int _3714 = ~_3668;
    int _3716 = _3714 + 1;
    int _3718 = _3716 + 1;
    int _3720 = _3572 + 8;
    uint _3722 = uint(int(uint(_3720) >> uint(2)));
    uint _3724 = uint(int(uint(int(_3722)) >> uint(2)));
    int _3726 = int(_3722) & 3;
    float _3728 = (*spvDescriptorSet0.vp_c9)._m0[int(_3724)][_3726];
    int _3730 = int(_3722) + 1;
    uint _3732 = uint(int(uint(_3730) >> uint(2)));
    int _3734 = _3730 & 3;
    float _3736 = (*spvDescriptorSet0.vp_c9)._m0[int(_3732)][_3734];
    int _3738 = abs(_2994);
    int _3740 = _3718 * as_type<int>(_3530);
    int _3742 = abs(_3014);
    float _3744 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _3746 = !_2586;
    int _3748 = _3746 ? _3666 : (-1);
    float _3750 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3752 = int(_3750);
    bool _3754 = _1560 != 2;
    int _3756 = _3598 + 8;
    uint _3758 = uint(int(uint(_3756) >> uint(2)));
    uint _3760 = uint(int(uint(int(_3758)) >> uint(2)));
    int _3762 = int(_3758) & 3;
    float _3764 = (*spvDescriptorSet0.vp_c9)._m0[int(_3760)][_3762];
    int _3766 = int(_3758) + 1;
    uint _3768 = uint(int(uint(_3766) >> uint(2)));
    int _3770 = _3766 & 3;
    float _3772 = (*spvDescriptorSet0.vp_c9)._m0[int(_3768)][_3770];
    float _3774 = fma(_1630, -2.0, _3744);
    int _3776 = abs(_3476);
    int _3778 = ~_3706;
    int _3780 = _3778 + 1;
    int _3782 = _3780 + 1;
    float _3784 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3774);
    int _3786 = ~_3712;
    int _3788 = _3786 + 1;
    int _3790 = _3788 + 1;
    int _3792 = _3626 + 8;
    uint _3794 = uint(int(uint(_3792) >> uint(2)));
    uint _3796 = uint(int(uint(int(_3794)) >> uint(2)));
    int _3798 = int(_3794) & 3;
    float _3800 = (*spvDescriptorSet0.vp_c9)._m0[int(_3796)][_3798];
    int _3802 = int(_3794) + 1;
    uint _3804 = uint(int(uint(_3802) >> uint(2)));
    int _3806 = _3802 & 3;
    float _3808 = (*spvDescriptorSet0.vp_c9)._m0[int(_3804)][_3806];
    int _3810 = _3782 * as_type<int>(_3522);
    int _3812 = _3810 + _3740;
    int _3814 = ~_3742;
    int _3816 = _3814 + 1;
    int _3818 = _3816 + 1;
    int _3820 = _3790 * as_type<int>(_3594);
    int _3822 = abs(_3080);
    int _3824 = ~_3738;
    int _3826 = _3824 + 1;
    int _3828 = _3826 + 1;
    int _3830 = ~_3822;
    int _3832 = _3830 + 1;
    int _3834 = _3832 + 1;
    int _3836 = _3818 * as_type<int>(_3622);
    int _3838 = ~_3776;
    int _3840 = _3838 + 1;
    int _3842 = _3840 + 1;
    int _3844 = _3828 * as_type<int>(_3586);
    int _3846 = _3844 + _3820;
    int _3848 = abs(_2724);
    int _3850 = _3834 * as_type<int>(_3614);
    int _3852 = _3850 + _3836;
    int _3854 = abs(_2946);
    float _3856 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3858 = int(_3856);
    int _3860 = abs(_3030);
    int _3862 = _3842 * as_type<int>(_3656);
    int _3864 = abs(_3430);
    int _3866 = ~_3848;
    int _3868 = _3866 + 1;
    int _3870 = _3868 + 1;
    int _3872 = abs(_3084);
    float _3874 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3876 = int(_3874);
    int _3878 = ~_3854;
    int _3880 = _3878 + 1;
    int _3882 = _3880 + 1;
    int _3884 = _3870 * as_type<int>(_3696);
    int _3886 = _3884 + _3812;
    int _3888 = ~_3860;
    int _3890 = _3888 + 1;
    int _3892 = _3890 + 1;
    int _3894 = ~_3872;
    int _3896 = _3894 + 1;
    int _3898 = _3896 + 1;
    int _3900 = _3882 * as_type<int>(_3728);
    int _3902 = _3900 + _3846;
    int _3904 = ~_3864;
    int _3906 = _3904 + 1;
    int _3908 = _3906 + 1;
    int _3910 = abs(_3090);
    int _3912 = abs(_3680);
    int _3914 = _3908 * as_type<int>(_3648);
    int _3916 = _3914 + _3862;
    int _3918 = ~_3910;
    int _3920 = _3918 + 1;
    int _3922 = _3920 + 1;
    int _3924 = _3892 * as_type<int>(_3764);
    int _3926 = _3924 + _3852;
    int _3928 = ~_3912;
    int _3930 = _3928 + 1;
    int _3932 = _3930 + 1;
    int _3934 = _3898 * as_type<int>(_3704);
    int _3936 = _3934 + _3886;
    int _3938 = abs(_3486);
    int _3940 = _3922 * as_type<int>(_3736);
    int _3942 = _3940 + _3902;
    int _3944 = abs(_3578);
    float _3946 = float(uint(_3684));
    int _3948 = _3932 * as_type<int>(_3800);
    int _3950 = _3948 + _3916;
    int _3952 = ~_3938;
    int _3954 = _3952 + 1;
    int _3956 = _3954 + 1;
    float _3958 = float(uint(_3752));
    float _3960 = 1.0 / _3946;
    int _3962 = ~_3944;
    int _3964 = _3962 + 1;
    int _3966 = _3964 + 1;
    int _3968 = _3956 * as_type<int>(_3772);
    int _3970 = _3968 + _3926;
    int _3972 = ~_3282;
    int _3974 = _3972 + 1;
    int _3976 = _3974 + 1;
    int _3978 = abs(_3876);
    int _3980 = _3966 * as_type<int>(_3808);
    int _3982 = _3980 + _3950;
    float _3984 = float(uint(_3876));
    float _3986 = 1.0 / _3958;
    int _3988 = _3936 * _3976;
    int _3990 = abs(_3752);
    int _3992 = _2872 * _3282;
    int _3994 = _3992 + _3988;
    int _3996 = abs(_3382);
    float _3998 = float(uint(_3990));
    float _4000 = 1.0 / _3984;
    int _4002 = abs(_2972);
    int _4004 = ~_3996;
    int _4006 = _4004 + 1;
    int _4008 = _4006 + 1;
    int _4010 = ~_4002;
    int _4012 = _4010 + 1;
    int _4014 = _4012 + 1;
    int _4016 = abs(_3684);
    int _4018 = _3970 * _4008;
    float _4020 = float(uint(_3858));
    int _4022 = _3942 * _4014;
    float _4024 = float(uint(_4016));
    float _4026 = 1.0 / _3998;
    float _4028 = float(uint(_3978));
    int _4030 = _2950 * _4002;
    int _4032 = _4030 + _4022;
    int _4034 = abs(_3414);
    int _4036 = _3096 * _3996;
    int _4038 = _4036 + _4018;
    int _4040 = as_type<int>(_3960) + (-2);
    int _4042 = ~_4034;
    int _4044 = _4042 + 1;
    int _4046 = _4044 + 1;
    float _4048 = 1.0 / _4020;
    float _4050 = float(uint(_3994));
    int _4052 = as_type<int>(_3986) + (-2);
    int _4054 = _3982 * _4046;
    float _4056 = float(uint(_4032));
    float _4058 = as_type<float>(_4040) * _4050;
    float _4060 = 1.0 / _4024;
    int _4062 = as_type<int>(_4000) + (-2);
    float _4064 = as_type<float>(_4052) * _4056;
    float _4066 = float(uint(_4038));
    float _4068 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _4070 = _1562 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _4072 = _3748 * _4034;
    int _4074 = _4072 + _4054;
    int _4076 = as_type<int>(_4026) + (-2);
    float _4078 = 1.0 / _4028;
    int _4080 = abs(_3858);
    float _4082 = as_type<float>(_4062) * _4066;
    float _4084 = -_4068;
    float _4086 = fma(_4070, 2.0, _4084);
    int _4088 = abs(_4038);
    float _4090 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _4092 = float(uint(_4080));
    float _4094 = -_165;
    float _4096 = fma(_4094, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4086);
    float _4098 = trunc(_4058);
    float _4100 = precise::max(_4098, 0.0);
    uint _4102 = uint(_4100);
    int _4104 = as_type<int>(_4048) + (-2);
    float _4106 = float(uint(_4074));
    float _4108 = 1.0 / _4092;
    int _4110 = as_type<int>(_4078) + (-2);
    float _4112 = as_type<float>(_4104) * _4106;
    int _4114 = ~_3752;
    int _4116 = _4114 + 1;
    float _4118 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _4120 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _4122 = ~_3684;
    int _4124 = _4122 + 1;
    float _4126 = trunc(_4064);
    float _4128 = precise::max(_4126, 0.0);
    uint _4130 = uint(_4128);
    int _4132 = abs(_4074);
    float _4134 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[93].z, _4118);
    int _4136 = abs(_3994);
    int _4138 = _4124 * int(_4102);
    int _4140 = _4138 + _3994;
    float _4142 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[93].w, _4120);
    int _4144 = as_type<int>(_4060) + (-2);
    float _4146 = trunc(_4082);
    float _4148 = precise::max(_4146, 0.0);
    uint _4150 = uint(_4148);
    int _4152 = as_type<int>(_4108) + (-2);
    float _4154 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4156 = float(uint(_4136));
    float _4158 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[92].z, _4134);
    int _4160 = abs(_4032);
    float _4162 = fma(_4090, -2.0, _4154);
    bool _4164 = !_3686;
    float _4166 = _4164 ? _1564 : _1562;
    float _4168 = trunc(_4112);
    float _4170 = precise::max(_4168, 0.0);
    uint _4172 = uint(_4170);
    float _4174 = float(uint(_4088));
    float _4176 = as_type<float>(_4144) * _4156;
    float _4178 = float(uint(_4160));
    float _4180 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4142);
    int _4182 = ~_3876;
    int _4184 = _4182 + 1;
    float _4186 = as_type<float>(_4110) * _4174;
    float _4188 = trunc(_4176);
    float _4190 = precise::max(_4188, 0.0);
    uint _4192 = uint(_4190);
    float _4194 = float(uint(_4132));
    float _4196 = as_type<float>(_4076) * _4178;
    int _4198 = _4184 * int(_4150);
    int _4200 = _4198 + _4038;
    int _4202 = ~_4016;
    int _4204 = _4202 + 1;
    int _4206 = _4116 * int(_4130);
    int _4208 = _4206 + _4032;
    float _4210 = as_type<float>(_4152) * _4194;
    float _4212 = float(uint(_4140));
    float _4214 = trunc(_4196);
    float _4216 = precise::max(_4214, 0.0);
    uint _4218 = uint(_4216);
    bool _4220 = !_3686;
    float _4222 = _4220 ? as_type<float>(_1566) : _1564;
    float _4224 = float(uint(_4208));
    float _4226 = as_type<float>(_4040) * _4212;
    float _4228 = _1544 + _1546;
    float _4230 = as_type<float>(_4052) * _4224;
    int _4232 = ~_3858;
    int _4234 = _4232 + 1;
    float _4236 = trunc(_4226);
    float _4238 = precise::max(_4236, 0.0);
    uint _4240 = uint(_4238);
    float _4242 = _4228 + (-1.0);
    float _4244 = float(uint(_4200));
    int _4246 = _4234 * int(_4172);
    int _4248 = _4246 + _4074;
    float _4250 = fma(_4242, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _4252 = ~_3990;
    int _4254 = _4252 + 1;
    float _4256 = as_type<float>(_4062) * _4244;
    float _4258 = trunc(_4230);
    float _4260 = precise::max(_4258, 0.0);
    uint _4262 = uint(_4260);
    int _4264 = ~_3978;
    int _4266 = _4264 + 1;
    int _4268 = _4204 * int(_4192);
    int _4270 = _4268 + _4136;
    float _4272 = float(uint(_4248));
    float _4274 = trunc(_4186);
    float _4276 = precise::max(_4274, 0.0);
    uint _4278 = uint(_4276);
    float _4280 = as_type<float>(_4104) * _4272;
    int _4282 = int(_4102) + int(_4240);
    int _4284 = _4254 * int(_4218);
    int _4286 = _4284 + _4160;
    float _4288 = float(uint(_4270));
    int _4290 = ~_4080;
    int _4292 = _4290 + 1;
    float _4294 = trunc(_4210);
    float _4296 = precise::max(_4294, 0.0);
    uint _4298 = uint(_4296);
    int _4300 = int(_4130) + int(_4262);
    float _4302 = as_type<float>(_4144) * _4288;
    float _4304 = float(uint(_4286));
    bool _4306 = !_3108;
    float _4308 = _4306 ? _213 : as_type<float>(_2342);
    bool _4310 = _1544 > 0.5;
    float _4312 = trunc(_4256);
    float _4314 = precise::max(_4312, 0.0);
    uint _4316 = uint(_4314);
    int _4318 = _4266 * int(_4278);
    int _4320 = _4318 + _4088;
    float _4322 = as_type<float>(_4076) * _4304;
    int _4324 = ~_3684;
    int _4326 = _4324 + 1;
    float _4328 = float(uint(_4320));
    int _4330 = _4292 * int(_4298);
    int _4332 = _4330 + _4132;
    float _4334 = trunc(_4280);
    float _4336 = precise::max(_4334, 0.0);
    uint _4338 = uint(_4336);
    float _4340 = -_213;
    int _4342 = _4310 ? as_type<int>(_4340) : as_type<int>(_213);
    float _4344 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4346 = as_type<float>(_4110) * _4328;
    float _4348 = float(uint(_4332));
    float _4350 = fma(_4166, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4344);
    int _4352 = int(_4150) + int(_4316);
    float _4354 = trunc(_4302);
    float _4356 = precise::max(_4354, 0.0);
    uint _4358 = uint(_4356);
    float _4360 = as_type<float>(_4152) * _4348;
    int _4362 = ~_3752;
    int _4364 = _4362 + 1;
    float _4366 = _4166 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _4368 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4350);
    int _4370 = _4326 * _4282;
    int _4372 = _4370 + _3994;
    float _4374 = as_type<float>(_4326);
    float _4376 = as_type<float>(_4372);
    float _4378 = as_type<float>(_4172);
    float _4380 = as_type<float>(_4192);
    float _4382 = _4302;
    if (_3754)
    {
        _4374 = _1544;
    }
    float _4384 = _4374;
    float _4386 = trunc(_4360);
    float _4388 = precise::max(_4386, 0.0);
    uint _4390 = uint(_4388);
    int _4392 = _4364 * _4300;
    int _4394 = _4392 + _4032;
    int _4396 = int(_4172) + int(_4338);
    float _4398 = -_4368;
    float _4400 = _4398 + 1.0;
    bool _4402 = !_3134;
    float _4404 = _4402 ? _213 : as_type<float>(_4342);
    bool _4406 = uint(_4394) >= uint(_3752);
    float _4408 = trunc(_4346);
    float _4410 = precise::max(_4408, 0.0);
    uint _4412 = uint(_4410);
    int _4414 = int(_4192) + int(_4358);
    int _4416 = ~_3858;
    int _4418 = _4416 + 1;
    int _4420 = ~_4016;
    int _4422 = _4420 + 1;
    bool _4424 = uint(_4372) >= uint(_3684);
    float _4426 = trunc(_4322);
    float _4428 = precise::max(_4426, 0.0);
    uint _4430 = uint(_4428);
    int _4432 = int(_4298) + int(_4390);
    int _4434 = _4418 * _4396;
    int _4436 = _4434 + _4074;
    float _4438 = as_type<float>(_4358);
    float _4440 = _4384;
    if (!_3686)
    {
        _4376 = _1548;
    }
    float _4442 = _4376;
    int _4444 = _4422 * _4414;
    int _4446 = _4444 + _4136;
    float _4448 = _4442;
    if (!_3686)
    {
        _4378 = _1548;
    }
    float _4450 = _4378;
    float _4452 = _4450;
    if (!_3686)
    {
        _4380 = _1546;
    }
    float _4454 = _4380;
    int _4456 = ~_3876;
    int _4458 = _4456 + 1;
    float _4460 = _4454;
    if (!_3686)
    {
        _4382 = _1546;
    }
    float _4462 = _4382;
    int _4464 = int(_4278) + int(_4412);
    int _4466 = _4458 * _4352;
    int _4468 = _4466 + _4038;
    int _4470 = ~_3978;
    int _4472 = _4470 + 1;
    float _4474 = _4462;
    if (_3686)
    {
        _4448 = _1546;
    }
    float _4476 = _4448;
    if (_3686)
    {
        _4452 = _1546;
    }
    float _4478 = _4452;
    int _4480 = _4472 * _4464;
    int _4482 = _4480 + _4088;
    if (_3686)
    {
        _4460 = _1544;
    }
    float _4484 = _4460;
    float _4486 = _4484;
    if (_3686)
    {
        _4474 = _1544;
    }
    float _4488 = _4474;
    int _4490 = ~_4080;
    int _4492 = _4490 + 1;
    bool _4494 = uint(_4468) >= uint(_3876);
    int _4496 = int(_4218) + int(_4430);
    int _4498 = _4492 * _4432;
    int _4500 = _4498 + _4132;
    int _4502 = ~_3990;
    int _4504 = _4502 + 1;
    if (_3754)
    {
        _4438 = _1546;
    }
    float _4506 = _4438;
    float _4508 = _4506;
    if (!_3754)
    {
        _4440 = _1548;
    }
    float _4510 = _4440;
    int _4512 = _4504 * _4496;
    int _4514 = _4512 + _4160;
    if (!_3754)
    {
        _4508 = _1544;
    }
    float _4516 = _4508;
    bool _4518 = !_4424;
    int _4520 = _4518 ? 0 : (-1);
    float _4522 = _4510 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _4524 = uint(_4436) >= uint(_3858);
    bool _4526 = !_4406;
    int _4528 = _4526 ? 0 : (-1);
    bool _4530 = uint(_4446) >= uint(_4016);
    bool _4532 = !_4494;
    int _4534 = _4532 ? 0 : (-1);
    int _4536 = ~_4282;
    int _4538 = _4536 + _4520;
    int _4540 = _4538 + 1;
    bool _4542 = !_4524;
    int _4544 = _4542 ? 0 : (-1);
    int _4546 = ~_4300;
    int _4548 = _4546 + _4528;
    int _4550 = _4548 + 1;
    bool _4552 = uint(_4500) >= uint(_4080);
    int _4554 = ~_4352;
    int _4556 = _4554 + _4534;
    int _4558 = _4556 + 1;
    int _4560 = _3994 ^ _3684;
    bool _4562 = uint(_4514) >= uint(_3990);
    int _4564 = _3684 * _4540;
    int _4566 = _4564 + _3994;
    bool _4568 = uint(_4482) >= uint(_3978);
    int _4570 = _3752 * _4550;
    int _4572 = _4570 + _4032;
    int _4574 = ~_4396;
    int _4576 = _4574 + _4544;
    int _4578 = _4576 + 1;
    float _4580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4582 = !_4552;
    int _4584 = _4582 ? 0 : (-1);
    bool _4586 = !_4530;
    int _4588 = _4586 ? 0 : (-1);
    int _4590 = _3858 * _4578;
    int _4592 = _4590 + _4074;
    bool _4594 = _3752 == 0;
    uint _4596 = uint(int(uint(_4560) >> uint(31)));
    bool _4598 = _3684 == 0;
    bool _4600 = !_4594;
    int _4602 = _4600 ? _4572 : (-1);
    int _4604 = ~_4588;
    int _4606 = _4414 + _4604;
    int _4608 = _4606 + 1;
    int _4610 = ~int(_4596);
    int _4612 = _4610 + 1;
    float _4614 = _4580 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4616 = !_4598;
    int _4618 = _4616 ? _4566 : (-1);
    bool _4620 = _3858 == 0;
    bool _4622 = _3752 == 0;
    int _4624 = _4032 ^ _3752;
    bool _4626 = !_4562;
    int _4628 = _4626 ? 0 : (-1);
    int _4630 = _4608 ^ _4612;
    bool _4632 = !_4568;
    int _4634 = _4632 ? 0 : (-1);
    bool _4636 = _3684 == 0;
    int _4638 = _3876 * _4558;
    int _4640 = _4638 + _4038;
    bool _4642 = !_4620;
    int _4644 = _4642 ? _4592 : (-1);
    bool _4646 = _3876 == 0;
    bool _4648 = _3876 == 0;
    int _4650 = _4038 ^ _3876;
    uint _4652 = uint(int(uint(_4624) >> uint(31)));
    int _4654 = ~_4612;
    int _4656 = _4654 + _4630;
    int _4658 = _4656 + 1;
    float _4660 = _1544 * 2.0;
    int _4662 = ~_4634;
    int _4664 = _4464 + _4662;
    int _4666 = _4664 + 1;
    uint _4668 = uint(int(uint(_4650) >> uint(31)));
    int _4670 = ~int(_4652);
    int _4672 = _4670 + 1;
    int _4674 = ~_4628;
    int _4676 = _4496 + _4674;
    int _4678 = _4676 + 1;
    float _4680 = floor(_4660);
    int _4682 = _4074 ^ _3858;
    float _4684 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4686 = _3452 + _4684;
    int _4688 = ~int(_4668);
    int _4690 = _4688 + 1;
    int _4692 = _4678 ^ _4672;
    uint _4694 = uint(int(uint(_4682) >> uint(31)));
    float _4696 = _1548 * 2.0;
    int _4698 = _4666 ^ _4690;
    bool _4700 = !_4636;
    int _4702 = _4700 ? _4658 : (-1);
    int _4704 = ~_4672;
    int _4706 = _4704 + _4692;
    int _4708 = _4706 + 1;
    float _4710 = _1546 + _1548;
    bool _4712 = _3858 == 0;
    float _4714 = _1546 * 2.0;
    int _4716 = ~_4584;
    int _4718 = _4432 + _4716;
    int _4720 = _4718 + 1;
    float _4722 = floor(_4696);
    int _4724 = ~int(_4694);
    int _4726 = _4724 + 1;
    float _4728 = _4710 + (-1.0);
    int _4730 = ~_4690;
    int _4732 = _4730 + _4698;
    int _4734 = _4732 + 1;
    int _4736 = _4720 ^ _4726;
    float _4738 = floor(_4714);
    bool _4740 = !_4646;
    int _4742 = _4740 ? _4640 : (-1);
    bool _4744 = !_4622;
    int _4746 = _4744 ? _4708 : (-1);
    bool _4748 = _4680 > 0.0;
    bool _4750 = _4680 >= 0.0;
    bool _4752 = isnan(_4680);
    bool _4754 = _4750 || _4752;
    bool _4756 = isnan(0.0);
    bool _4758 = _4754 || _4756;
    float _4760 = fma(_4728, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _4762 = ~_4726;
    int _4764 = _4762 + _4736;
    int _4766 = _4764 + 1;
    float _4768 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4770 = _3460 + _4768;
    float _4772 = _4686 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _4774 = _4758 ? 0 : 1;
    float _4776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4778 = !_4712;
    int _4780 = _4778 ? _4766 : (-1);
    float _4782 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4784 = _3478 + _4782;
    float _4786 = fma(_4770, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4772);
    bool _4788 = _4722 >= 0.0;
    bool _4790 = isnan(_4722);
    bool _4792 = _4788 || _4790;
    bool _4794 = isnan(0.0);
    bool _4796 = _4792 || _4794;
    bool _4798 = !_4648;
    int _4800 = _4798 ? _4734 : (-1);
    float _4802 = fma(_4784, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4786);
    int _4804 = _4796 ? 0 : 1;
    float _4806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _4808 = _4738 > 0.0;
    bool _4810 = _4802 >= 0.0;
    bool _4812 = _4738 >= 0.0;
    bool _4814 = isnan(_4738);
    bool _4816 = _4812 || _4814;
    bool _4818 = isnan(0.0);
    bool _4820 = _4816 || _4818;
    float _4822 = _4776 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4824 = ~_4774;
    int _4826 = _4824 + 1;
    int _4828 = _4826 + 1;
    float _4830 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _4832 = _4828;
    if (!_4748)
    {
        int _4834 = ~_4774;
        int _4836 = _4834 + 1;
        _4832 = _4836;
    }
    int _4838 = _4832;
    bool _4840 = _4722 > 0.0;
    float _4842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _4844 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _4846 = fma(_4222, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4830);
    float _4848 = _4222 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _4850 = fma(_4488, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4844);
    float _4852 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _4854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _4856 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4858 = _2208 + 0.5;
    float _4860 = fma(_4848, -2.0, _4852);
    float _4862 = -_2234;
    float _4864 = _4862 + 0.5;
    float _4866 = -_4856;
    float _4868 = fma(_4366, 2.0, _4866);
    float _4870 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _4872 = fma(_3378, _3306, _3506);
    float _4874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _4876 = _4858 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _4878 = fma(_4478, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4870);
    float _4880 = _4864 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _4882 = _4876 * _4842;
    float _4884 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _4886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _4888 = _4880 * _4854;
    float _4890 = _4484 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _4892 = -_4884;
    float _4894 = fma(_4522, 2.0, _4892);
    float _4896 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _4898 = as_type<int>(_4882);
    if (_4810)
    {
        _4486 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4900 = _4486;
    float _4902 = _4476 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _4904 = _4516 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _4906 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _4908 = _4874 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _4910 = _1604 + 0.5;
    float _4912 = -_165;
    float _4914 = fma(_4912, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4868);
    out.m_82.x = _4882;
    out.m_82.y = _4888;
    float _4916 = -_4896;
    float _4918 = fma(_4890, 2.0, _4916);
    float _4920 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _4922 = fma(_4908, _4910, _4914);
    float _4924 = fma(_3426, _3288, _4872);
    float _4926 = _4886 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _4928 = _1650 + (-0.5);
    float _4930 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4860);
    float _4932 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4846);
    if (_4810)
    {
        float _4934 = _4900 * 5.0;
        _4898 = as_type<int>(_4934);
    }
    int _4936 = _4898;
    float _4938 = fma(_4904, -2.0, _4906);
    float _4940 = fma(_4902, -2.0, _4920);
    float _4942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _4944 = -_4926;
    float _4946 = -_4930;
    float _4948 = fma(_4944, _4928, _4946);
    if (_4810)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14428 = as_type<float>(_4936);
        out.gl_Position.z = _14428;
    }
    float _4950 = fma(_3208, (*spvDescriptorSet0.vp_c9)._m0[174].x, _4924);
    float _4952 = float(_4602);
    float _4954 = -_165;
    float _4956 = fma(_4954, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4894);
    float _4958 = float(_4644);
    float _4960 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4938);
    float _4962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _4964 = float(_4618);
    out.m_84.x = _4950;
    float _4966 = float(_4742);
    float _4968 = _4806 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _4970 = float(_4800);
    float _4972 = -_4400;
    float _4974 = fma(_4972, _1604, _4922);
    float _4976 = -_4932;
    float _4978 = _4976 + 1.0;
    float _4980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _4982 = fma(_4614, _4964, _3710);
    float _4984 = _1690 + 0.5;
    float _4986 = fma(_4978, _1650, _4948);
    float _4988 = -_165;
    float _4990 = fma(_4988, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4918);
    float _4992 = float(_4702);
    float _4994 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4940);
    bool _4996 = !_3072;
    float _4998 = _4996 ? _223 : as_type<float>(_2334);
    float _5000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_86.x = _4974;
    out.m_86.y = _4986;
    float _5002 = fma(_4822, _4952, _4990);
    float _5004 = _4942 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _5006 = _4962 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _5008 = float(_4746);
    float _5010 = -_3784;
    float _5012 = fma(_4968, _4992, _5010);
    float _5014 = fma(_5004, _4958, _4096);
    float _5016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _5018 = fma(_5006, _4966, _4956);
    float _5020 = float(_4780);
    float _5022 = _4308 + 0.5;
    float _5024 = _4404 + 0.5;
    float _5026 = fma(_5006, _4984, _5018);
    float _5028 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4162);
    float _5030 = fma(_4822, _5022, _5002);
    float _5032 = _4980 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5034 = _1594 + 0.5;
    float _5036 = fma(_4614, _5024, _4982);
    float _5038 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4878);
    float _5040 = -_4994;
    float _5042 = fma(_5032, _5008, _5040);
    float _5044 = fma(_5004, _5034, _5014);
    float _5046 = _5000 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5048 = _1806 + (-0.5);
    float _5050 = _5016 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _5052 = -_4960;
    float _5054 = fma(_5046, _4970, _5052);
    float _5056 = _4998 + (-0.5);
    float _5058 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4850);
    float _5060 = -_5028;
    float _5062 = fma(_5050, _5020, _5060);
    float _5064 = _5028;
    if (!_3102)
    {
        _5064 = _223;
    }
    float _5066 = _5064;
    float _5068 = -_4968;
    float _5070 = fma(_5068, _5056, _5012);
    float _5072 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _5074 = -_5032;
    float _5076 = fma(_5074, _5048, _5042);
    float _5078 = _1694 + (-0.5);
    float _5080 = _5066;
    if (_3102)
    {
        float _5082 = -_223;
        float _5084 = _3640 ? _5082 : _223;
        _5080 = _5084;
    }
    float _5086 = _5080;
    float _5088 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[88].z, _5072);
    float _5090 = -_5046;
    float _5092 = fma(_5090, _5078, _5054);
    float _5094 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[87].z, _5088);
    float _5096 = _5086 + (-0.5);
    float _5098 = -_5058;
    float _5100 = _5098 + 1.0;
    int _5102 = ~_4804;
    int _5104 = _5102 + 1;
    int _5106 = _5104 + 1;
    float _5108 = -_5094;
    float _5110 = _5108 + 1.0;
    float _5112 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _5114 = -_5050;
    float _5116 = fma(_5114, _5096, _5062);
    float _5118 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _5120 = -_5110;
    float _5122 = fma(_1690, _5120, _5026);
    float _5124 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[78].z, _5112);
    float _5126 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _5128 = log2(_5126);
    float _5130 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[88].w, _5118);
    float _5132 = -_4158;
    float _5134 = _5132 + 1.0;
    float _5136 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[77].z, _5124);
    float _5138 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[87].w, _5130);
    float _5140 = -_5134;
    float _5142 = fma(_5140, _1594, _5044);
    float _5144 = -_5136;
    float _5146 = _5144 + 1.0;
    float _5148 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _5150 = _4686 * _4686;
    float _5152 = -_5138;
    float _5154 = _5152 + 1.0;
    float _5156 = -_5146;
    float _5158 = fma(_4404, _5156, _5036);
    float _5160 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[78].w, _5148);
    float _5162 = fma(_4770, _4770, _5150);
    float _5164 = fma(_1694, _5154, _5092);
    float _5166 = _5128 * _165;
    float _5168 = -_5038;
    float _5170 = _5168 + 1.0;
    float _5172 = fma(_4784, _4784, _5162);
    float _5174 = -_4180;
    float _5176 = _5174 + 1.0;
    float _5178 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[77].w, _5160);
    float _5180 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _5182 = 1.0 + _5180;
    float _5184 = exp2(_5166);
    float _5186 = fma(_5176, _5086, _5116);
    float _5188 = fma(_1806, _5170, _5076);
    float _5190 = in.m_88.x;
    float _5192 = in.m_88.y;
    float _5194 = in.m_88.z;
    float _5196 = -_5178;
    float _5198 = _5196 + 1.0;
    float _5200 = -_5100;
    float _5202 = fma(_4308, _5200, _5030);
    int _5204 = _5106;
    if (!_4840)
    {
        int _5206 = ~_4804;
        int _5208 = _5206 + 1;
        _5204 = _5208;
    }
    int _5210 = _5204;
    out.m_90.x = _5122;
    out.m_90.y = _5164;
    float _5212 = rsqrt(_5172);
    float _5214 = fma(_4998, _5198, _5070);
    int _5216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _5218 = _5216 != 0;
    int _5220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _5222 = _5220 != 0;
    int _5224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _5226 = _5224 != 0;
    out.m_92.x = _5142;
    out.m_92.y = _5186;
    bool _5228 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _5230 = isnan(0.0);
    bool _5232 = _5228 || _5230;
    bool _5234 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _5236 = _5232 || _5234;
    out.m_94.x = _5158;
    out.m_94.y = _5214;
    out.m_94.z = _5202;
    out.m_94.w = _5188;
    float _5238 = 1.0 / _5182;
    float _5240 = -_5184;
    float _5242 = _5240 + 1.0;
    bool _5244 = !_5222;
    int _5246 = _5244 ? 0 : 1;
    if (_4810)
    {
        out.m_63.x = 0.0;
    }
    bool _5248 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _5250 = isnan(1.0);
    bool _5252 = _5248 || _5250;
    bool _5254 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _5256 = _5252 || _5254;
    float _5258 = _5236 ? _5242 : 0.0;
    float _5260 = _4686 * _5212;
    float _5262 = _4770 * _5212;
    bool _5264 = !_5226;
    int _5266 = _5264 ? 0 : 1;
    bool _5268 = !_5218;
    int _5270 = _5268 ? 0 : 1;
    if (_4810)
    {
        return out;
    }
    float _5272 = -_5260;
    float _5274 = fma(_5272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3452);
    float _5276 = _4784 * _5212;
    float _5278 = -_5262;
    float _5280 = fma(_5278, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3460);
    int _5282 = abs(_5270);
    float _5284 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5286 = _5274 + _5284;
    float _5288 = -_5276;
    float _5290 = fma(_5288, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3478);
    float _5292 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5294 = _5280 + _5292;
    float _5296 = float(_5210);
    float _5298 = _5286 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5300 = float(_5282);
    float _5302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5304 = _5290 + _5302;
    int _5306 = as_type<int>(_5274);
    if (_5256)
    {
        float _5308 = _5258 * _5238;
        _167 = _5308;
    }
    float _5310 = _167;
    float _5312 = fma(_5294, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5298);
    float _5314 = -_5260;
    float _5316 = fma(_5314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4686);
    float _5318 = _5300 * _5296;
    float _5320 = -_5262;
    float _5322 = fma(_5320, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4770);
    float _5324 = fma(_5304, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5312);
    float _5326 = _5316 * _5316;
    float _5328 = _5318 * (-2.0);
    float _5330 = _1544 + (-0.5);
    int _5332 = abs(_5246);
    float _5334 = fma(_5322, _5322, _5326);
    bool _5336 = _5324 >= 0.0;
    float _5338 = -_5276;
    float _5340 = fma(_5338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4784);
    float _5342 = fma(_5328, _5190, _5190);
    float _5344 = fma(_4250, _5328, _4250);
    float _5346 = float(_4838);
    float _5348 = fma(_5340, _5340, _5334);
    float _5350 = fma(_5330, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5342);
    float _5352 = float(_5332);
    float _5354 = _1546 + (-0.5);
    int _5356 = _4820 ? 0 : 1;
    float _5358 = fma(_5344, _5310, _5350);
    float _5360 = sqrt(_5348);
    float _5362 = _5352 * _5346;
    float _5364 = _5340;
    if (_5336)
    {
        _5364 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5366 = _5364;
    float _5368 = _5358 * 0.15915493667125701904296875;
    int _5370 = as_type<int>(_5366);
    if (_5336)
    {
        out.m_63.x = 0.0;
    }
    float _5372 = _5362 * (-2.0);
    int _5374 = ~_5356;
    int _5376 = _5374 + 1;
    int _5378 = _5376 + 1;
    float _5380 = _5368 * 6.283185482025146484375;
    float _5382 = sin(_5380);
    int _5384 = _5378;
    if (_5336)
    {
        float _5386 = _5366 * 5.0;
        _5370 = as_type<int>(_5386);
    }
    int _5388 = _5370;
    float _5390 = fma(_4760, _5372, _4760);
    if (!_4808)
    {
        int _5392 = ~_5356;
        int _5394 = _5392 + 1;
        _5384 = _5394;
    }
    int _5396 = _5384;
    float _5398 = fma(_5372, _5192, _5192);
    int _5400 = abs(_5266);
    if (_5336)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _15159 = as_type<float>(_5388);
        out.gl_Position.z = _15159;
    }
    if (_5336)
    {
        return out;
    }
    float _5402 = -_3452;
    float _5404 = _5402 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5406 = float(_5396);
    float _5408 = -_3460;
    float _5410 = _5408 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5412 = _5404 * _5404;
    float _5414 = -_3478;
    float _5416 = _5414 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5418 = _1544 + _1548;
    float _5420 = float(_5400);
    float _5422 = fma(_5410, _5410, _5412);
    float _5424 = fma(_5354, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5398);
    float _5426 = _5418 + (-1.0);
    float _5428 = _1548 + (-0.5);
    float _5430 = fma(_5416, _5416, _5422);
    float _5432 = _5420 * _5406;
    float _5434 = fma(_5390, _5310, _5424);
    float _5436 = _5368 * 6.283185482025146484375;
    float _5438 = cos(_5436);
    float _5440 = _5432 * (-2.0);
    float _5442 = _617 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5444 = fma(_5426, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5446 = _5434 * 0.15915493667125701904296875;
    float _5448 = fma(_5440, _5194, _5194);
    float _5450 = fma(_5444, _5440, _5444);
    float _5452 = rsqrt(_5430);
    float _5454 = fma(_5428, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5448);
    float _5456 = fma(_5450, _5310, _5454);
    float _5458 = _5446 * 6.283185482025146484375;
    float _5460 = sin(_5458);
    float _5462 = _5456 * 0.15915493667125701904296875;
    float _5464 = _5410 * _5452;
    float _5466 = _5416 * _5452;
    float _5468 = _5404 * _5452;
    float _5470 = _5446 * 6.283185482025146484375;
    float _5472 = cos(_5470);
    float _5474 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5476 = _5464 * _5474;
    float _5478 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5480 = _5466 * _5478;
    float _5482 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5484 = _5468 * _5482;
    float _5486 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5488 = -_5476;
    float _5490 = fma(_5466, _5486, _5488);
    float _5492 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5494 = -_5480;
    float _5496 = fma(_5468, _5492, _5494);
    float _5498 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5500 = -_5484;
    float _5502 = fma(_5464, _5498, _5500);
    float _5504 = _5462 * 6.283185482025146484375;
    float _5506 = sin(_5504);
    float _5508 = _5490 * _5490;
    float _5510 = _5382 * _5460;
    float _5512 = _5212 * _5360;
    float _5514 = _5438 * _5460;
    float _5516 = fma(_5496, _5496, _5508);
    float _5518 = _5512 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _5520 = _5518 * 0.5;
    float _5522 = _5462 * 6.283185482025146484375;
    float _5524 = cos(_5522);
    float _5526 = fma(_5502, _5502, _5516);
    float _5528 = _5438 * _5472;
    float _5530 = _5382 * _5472;
    float _5532 = rsqrt(_5526);
    float _5534 = fma(_5506, _5528, _5510);
    float _5536 = fma(_5506, _5510, _5528);
    float _5538 = _5438 * _5524;
    float _5540 = _5472 * _5524;
    float _5542 = _5382 * _5524;
    float _5544 = _5460 * _5524;
    float _5546 = _619 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _5550 = _5512 * _5442;
    float _5552 = -_5514;
    float _5554 = fma(_5506, _5530, _5552);
    float _5556 = -_5530;
    float _5558 = fma(_5506, _5514, _5556);
    float _5560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _5562 = _5512 * _5546;
    float _5564 = _5548 * _5550;
    float _5566 = _5496 * _5532;
    float _5568 = _5490 * _5532;
    float _5570 = _5560 * _5562;
    float _5572 = _5538 * _5564;
    float _5574 = -_5564;
    float _5576 = _5506 * _5574;
    float _5578 = _5502 * _5532;
    float _5580 = _5466 * _5568;
    float _5582 = fma(_5534, _5570, _5572);
    float _5584 = _5468 * _5566;
    float _5586 = _5542 * _5564;
    float _5588 = fma(_5540, _5570, _5576);
    float _5590 = fma(_5558, _5520, _5582);
    float _5592 = -_5580;
    float _5594 = fma(_5468, _5578, _5592);
    float _5596 = -_5584;
    float _5598 = fma(_5464, _5568, _5596);
    float _5600 = fma(_5554, _5570, _5586);
    float _5602 = fma(_5544, _5520, _5588);
    float _5604 = _5594 * _5590;
    float _5606 = _5598 * _5590;
    float _5608 = fma(_5536, _5520, _5600);
    float _5610 = fma(_5566, _5602, _5604);
    float _5612 = fma(_5578, _5602, _5606);
    float _5614 = fma(_5464, _5608, _5610);
    float _5616 = fma(_5466, _5608, _5612);
    float _5618 = _3460 + _5614;
    float _5620 = _3478 + _5616;
    float _5622 = _5464 * _5578;
    float _5624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5626 = _5618 + _5624;
    float _5628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5630 = _5620 + _5628;
    float _5632 = -_5622;
    float _5634 = fma(_5466, _5566, _5632);
    float _5636 = _5626 * _5626;
    float _5638 = _5630 * _5630;
    float _5640 = _5634 * _5590;
    float _5642 = _5636 + _5638;
    float _5644 = fma(_5568, _5602, _5640);
    float _5646 = sqrt(_5642);
    float _5648 = fma(_5468, _5608, _5644);
    float _5650 = _3452 + _5648;
    bool _5652 = _5646 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5654 = _5622;
    float _5656 = _5618;
    float _5658 = _5620;
    float _5660 = _5636;
    float _5662 = _5638;
    if (!_5652)
    {
        _5654 = _5650;
    }
    float _5664 = _5654;
    bool _5666 = !_5652;
    float _5668 = _5664;
    if (!_5666)
    {
        float _5670 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5674 = _5646 + _5672;
        float _5676 = _5650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5678 = rsqrt(_5642);
        float _5680 = _5674 * _5670;
        float _5682 = _5680 * 0.15915493667125701904296875;
        float _5684 = _5682 * 6.283185482025146484375;
        float _5686 = sin(_5684);
        float _5688 = _5682 * 6.283185482025146484375;
        float _5690 = cos(_5688);
        float _5692 = fma(_5686, _5676, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5694 = _5678 * _5692;
        float _5696 = _5690 + (-1.0);
        float _5698 = fma(_5626, _5694, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5700 = fma(_5630, _5694, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5702 = _5696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5704 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5706 = _5698 + _5704;
        float _5708 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5710 = _5700 + _5708;
        float _5712 = fma(_5650, _5690, _5702);
        float _5714 = _5706 * _5706;
        float _5716 = _5710 * _5710;
        _5656 = _5698;
        _5658 = _5700;
        _5668 = _5712;
        _5660 = _5714;
        _5662 = _5716;
    }
    float _5718 = _5656;
    float _5720 = _5658;
    float _5722 = _5668;
    float _5724 = _5660;
    float _5726 = _5662;
    float _5728 = fma(_5718, 6.2500002968590706586837768554688e-05, 0.5);
    float _5730 = fma(_5720, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _15666 = float2(_5728, _5730);
    float3 _5734 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_15666, float2(0.0), isnan(_15666)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_15666, float2(0.0), isnan(_15666)), level(0.0)).xyz;
    float _5736 = _5734.x;
    float _5738 = _5734.y;
    float _5740 = _5734.z;
    float _5742 = _5534 * _5594;
    float _5744 = _5534 * _5634;
    float _5746 = _5534 * _5598;
    float _5748 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5750 = _5538 * _5598;
    float _5752 = _5558 * _5594;
    float _5754 = _5558 * _5634;
    float _5756 = _5558 * _5598;
    float _5758 = fma(_5540, _5566, _5742);
    float _5760 = fma(_5540, _5568, _5744);
    float _5762 = fma(_5540, _5578, _5746);
    float _5764 = fma(_5748, _5748, 1.0);
    float _5766 = _5538 * _5634;
    float _5768 = _5538 * _5594;
    float _5770 = fma(_5544, _5568, _5754);
    float _5772 = rsqrt(_5764);
    float _5774 = -_5506;
    float _5776 = fma(_5774, _5568, _5766);
    float _5778 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5780 = _5722 + _5778;
    float _5782 = -_5506;
    float _5784 = fma(_5782, _5566, _5768);
    float _5786 = -_5506;
    float _5788 = fma(_5786, _5578, _5750);
    float _5790 = fma(_5544, _5566, _5752);
    float _5792 = fma(_5780, _5780, _5724);
    float _5794 = fma(_5544, _5578, _5756);
    float _5796 = fma(_5542, _5464, _5784);
    float _5798 = fma(_5542, _5468, _5776);
    float _5800 = fma(_5542, _5466, _5788);
    float _5802 = fma(_5536, _5464, _5790);
    float _5804 = _5792 + _5726;
    float _5806 = fma(_5536, _5468, _5770);
    float _5808 = fma(_5536, _5466, _5794);
    float _5810 = fma(_5554, _5464, _5758);
    float _5812 = _5748 * _5772;
    float _5814 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5816 = _5748 * _5796;
    float _5818 = fma(_5554, _5468, _5760);
    float _5820 = _5748 * _5798;
    float _5822 = fma(_5554, _5466, _5762);
    float _5824 = _5748 * _5800;
    float _5826 = -_5802;
    float _5828 = _5812 * _5826;
    float _5830 = -_5806;
    float _5832 = _5812 * _5830;
    float _5834 = -_5808;
    float _5836 = _5812 * _5834;
    float _5838 = fma(_5814, _5810, _5816);
    float _5840 = sqrt(_5804);
    float _5842 = fma(_5814, _5818, _5820);
    float _5844 = fma(_5814, _5822, _5824);
    float _5846 = fma(_5772, _5796, _5828);
    float _5848 = fma(_5772, _5798, _5832);
    float _5850 = _5806 + _5842;
    float _5852 = fma(_5772, _5800, _5836);
    float _5854 = _5802 + _5838;
    float _5856 = _5808 + _5844;
    out.m_96.x = _5810;
    out.m_96.y = _5818;
    out.m_96.z = _5822;
    out.m_98.x = _5846;
    out.m_98.y = _5848;
    out.m_98.z = _5852;
    bool _5858 = _5840 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5860 = isnan(_5840);
    bool _5862 = _5858 || _5860;
    bool _5864 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5866 = _5862 || _5864;
    out.m_100.x = _5854;
    out.m_100.y = _5850;
    out.m_100.z = _5856;
    float _5868 = _5802;
    if (!_5866)
    {
        _5868 = 1.0;
    }
    float _5870 = _5868;
    out.m_102.x = _5736;
    out.m_102.y = _5738;
    out.m_102.z = _5740;
    bool _5872 = !_5866;
    float _5874 = _5870;
    if (!_5872)
    {
        bool _5876 = _5840 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5878 = isnan(_5840);
        bool _5880 = _5876 || _5878;
        bool _5882 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5884 = _5880 || _5882;
        if (!_5884)
        {
            float _5886 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5888 = _5840 + _5886;
            float _5890 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5892 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5890;
            float _5894 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5896 = _5894 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5898 = 1.0 / _5892;
            float _5900 = _5888 * _5898;
            float _5902 = fma(_5900, _5896, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5874 = _5902;
            _5904 = true;
        }
        else
        {
            bool _5906 = _5840 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5908 = isnan(_5840);
            bool _5910 = _5906 || _5908;
            bool _5912 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5914 = _5910 || _5912;
            if (!_5914)
            {
                float _5916 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5918 = _5840 + _5916;
                float _5920 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5922 = _5920 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5924 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5926 = _5924 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5928 = 1.0 / _5922;
                float _5930 = _5918 * _5928;
                float _5932 = fma(_5930, _5926, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5874 = _5932;
                _5904 = true;
            }
            else
            {
                _5874 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5904 = false;
    float _5934 = _5874;
    float _5936 = fma(_5280, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _5938 = fma(_5290, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _5940 = floor(_5936);
    float _5942 = floor(_5938);
    float _5944 = -_5940;
    float _5946 = _5936 + _5944;
    float _5948 = -_5942;
    float _5950 = _5938 + _5948;
    float2 _16060 = float2(_5946, _5950);
    float _5952 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16060, float2(0.0), isnan(_16060)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16060, float2(0.0), isnan(_16060)), level(0.0)).x;
    float _5954 = _5274 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5956 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5958 = _5718 + _5956;
    float _5960 = fma(_5280, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5954);
    float _5962 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5964 = _5720 + _5962;
    float _5966 = fma(_5958, _5934, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5968 = fma(_5290, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5960);
    float _5970 = _5274 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5972 = fma(_5964, _5934, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5974 = -_3460;
    float _5976 = _5974 + _5966;
    float _5978 = _5968 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5980 = fma(_5280, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5970);
    float _5982 = -_3478;
    float _5984 = _5982 + _5972;
    float _5986 = 1.0 / _5978;
    float _5988 = fma(_5290, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5980);
    float _5990 = _5988 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5992 = _5990 + _5978;
    float _5994 = _5992 * _5986;
    float _5996 = _5994 * 0.5;
    float _5998 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6000 = fma(_5996, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5998);
    float _6002 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _6004 = _5274 + _6002;
    float _6006 = 1.0 / _6000;
    float _6008 = _6004 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _6010 = fma(_5280, (*spvDescriptorSet0.vp_c15)._m0[126].x, _6008);
    float _6012 = fma(_5290, (*spvDescriptorSet0.vp_c15)._m0[126].z, _6010);
    float _6014 = _6012 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _6016 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6018 = _6006 * _6016;
    float _6020 = _6004 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _6022 = trunc(_6014);
    int _6024 = int(_6022);
    bool _6026 = _6018 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _6028 = fma(_5280, (*spvDescriptorSet0.vp_c15)._m0[127].x, _6020);
    bool _6030 = _6018 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _6032 = !_6026;
    int _6034 = _6032 ? 0 : 1;
    int _6036 = 2;
    if (!_6026)
    {
        _6036 = 1;
    }
    int _6038 = _6036;
    int _6040 = _6038;
    if (!_6030)
    {
        _6040 = _6034;
    }
    int _6042 = _6040;
    float _6044 = fma(_5290, (*spvDescriptorSet0.vp_c15)._m0[127].z, _6028);
    float _6046 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _6048 = _5722 + _6046;
    int _6050 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _6052 = _6024 + _6050;
    int _6054 = _6052 + 1;
    int _6056 = _6042 << 6;
    float _6058 = _6044 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _6060 = fma(_6048, _5934, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _6062 = _6054 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _6064 = _6056 + 96;
    uint _6066 = uint(int(uint(_6064) >> uint(2)));
    uint _6068 = uint(int(uint(int(_6066)) >> uint(2)));
    int _6070 = int(_6066) & 3;
    float _6072 = (*spvDescriptorSet0.vp_c15)._m0[int(_6068)][_6070];
    int _6074 = int(_6066) + 1;
    uint _6076 = uint(int(uint(_6074) >> uint(2)));
    int _6078 = _6074 & 3;
    float _6080 = (*spvDescriptorSet0.vp_c15)._m0[int(_6076)][_6078];
    float _6082 = trunc(_6058);
    int _6084 = int(_6082);
    float _6086 = -_3452;
    float _6088 = _6086 + _6060;
    float _6090 = _6088 * _6088;
    int _6092 = _6056 + 48;
    uint _6094 = uint(int(uint(_6092) >> uint(2)));
    uint _6096 = uint(int(uint(int(_6094)) >> uint(2)));
    int _6098 = int(_6094) & 3;
    float _6100 = (*spvDescriptorSet0.vp_c15)._m0[int(_6096)][_6098];
    int _6102 = int(_6094) + 1;
    uint _6104 = uint(int(uint(_6102) >> uint(2)));
    int _6106 = _6102 & 3;
    float _6108 = (*spvDescriptorSet0.vp_c15)._m0[int(_6104)][_6106];
    float _6110 = fma(_5976, _5976, _6090);
    float _6112 = fma(_5984, _5984, _6110);
    int _6114 = _6056 + 104;
    uint _6116 = uint(int(uint(_6114) >> uint(2)));
    uint _6118 = uint(int(uint(int(_6116)) >> uint(2)));
    int _6120 = int(_6116) & 3;
    float _6122 = (*spvDescriptorSet0.vp_c15)._m0[int(_6118)][_6120];
    int _6124 = int(_6116) + 1;
    uint _6126 = uint(int(uint(_6124) >> uint(2)));
    int _6128 = _6124 & 3;
    float _6130 = (*spvDescriptorSet0.vp_c15)._m0[int(_6126)][_6128];
    int _6132 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _6134 = _6084 + _6132;
    int _6136 = _6134 + 1;
    float _6138 = sqrt(_6112);
    int _6140 = _6054 | _6136;
    int _6142 = _6056 + 56;
    uint _6144 = uint(int(uint(_6142) >> uint(2)));
    uint _6146 = uint(int(uint(int(_6144)) >> uint(2)));
    int _6148 = int(_6144) & 3;
    float _6150 = (*spvDescriptorSet0.vp_c15)._m0[int(_6146)][_6148];
    int _6152 = int(_6144) + 1;
    uint _6154 = uint(int(uint(_6152) >> uint(2)));
    int _6156 = _6152 & 3;
    float _6158 = (*spvDescriptorSet0.vp_c15)._m0[int(_6154)][_6156];
    bool _6160 = _6140 < 0;
    bool _6162 = _6160 || _6062;
    bool _6164 = _6136 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _6166 = _6164 || _6162;
    bool _6168 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _6170 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _6172 = _6168 || _6170;
    bool _6174 = isnan(0.5);
    bool _6176 = _6172 || _6174;
    int _6178 = _6056 + 64;
    uint _6180 = uint(int(uint(_6178) >> uint(2)));
    uint _6182 = uint(int(uint(int(_6180)) >> uint(2)));
    int _6184 = int(_6180) & 3;
    float _6186 = (*spvDescriptorSet0.vp_c15)._m0[int(_6182)][_6184];
    int _6188 = int(_6180) + 1;
    uint _6190 = uint(int(uint(_6188) >> uint(2)));
    int _6192 = _6188 & 3;
    float _6194 = (*spvDescriptorSet0.vp_c15)._m0[int(_6190)][_6192];
    bool _6196 = _6138 > 0.0;
    int _6198 = _6056 + 72;
    uint _6200 = uint(int(uint(_6198) >> uint(2)));
    uint _6202 = uint(int(uint(int(_6200)) >> uint(2)));
    int _6204 = int(_6200) & 3;
    float _6206 = (*spvDescriptorSet0.vp_c15)._m0[int(_6202)][_6204];
    int _6208 = int(_6200) + 1;
    uint _6210 = uint(int(uint(_6208) >> uint(2)));
    int _6212 = _6208 & 3;
    float _6214 = (*spvDescriptorSet0.vp_c15)._m0[int(_6210)][_6212];
    float _6216 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _6218 = as_type<float>(_6042);
    if (!_6196)
    {
        _6216 = _5966;
    }
    float _6220 = _6216;
    int _6222 = _6056 + 80;
    uint _6224 = uint(int(uint(_6222) >> uint(2)));
    uint _6226 = uint(int(uint(int(_6224)) >> uint(2)));
    int _6228 = int(_6224) & 3;
    float _6230 = (*spvDescriptorSet0.vp_c15)._m0[int(_6226)][_6228];
    int _6232 = int(_6224) + 1;
    uint _6234 = uint(int(uint(_6232) >> uint(2)));
    int _6236 = _6232 & 3;
    float _6238 = (*spvDescriptorSet0.vp_c15)._m0[int(_6234)][_6236];
    float _6240 = _6004 * _6080;
    float _6242 = _6080;
    float _6244 = _6072;
    float _6246 = _6220;
    float _6248 = _6220;
    if (!_6166)
    {
        float _6250 = floor(_6014);
        _6242 = _6250;
    }
    float _6252 = _6242;
    float _6254 = fma(_5280, _6072, _6240);
    if (!_6196)
    {
        _6244 = _6060;
    }
    float _6256 = _6244;
    float _6258 = _6004 * _6108;
    float _6260 = _6108;
    float _6262 = _6256;
    float _6264 = _6256;
    if (!_6196)
    {
        _6260 = _5972;
    }
    float _6266 = _6260;
    float _6268 = fma(_5290, _6122, _6254);
    bool _6270 = !_6196;
    float _6272 = _6266;
    int _6274 = as_type<int>(_6130);
    float _6276 = _6206;
    if (!_6270)
    {
        float _6278 = _227 * _227;
        float _6280 = fma(_225, _225, _6278);
        float _6282 = fma(_229, _229, _6280);
        float _6284 = rsqrt(_6112);
        float _6286 = sqrt(_6282);
        float _6288 = _5976 * _6284;
        float _6290 = _6088 * _6284;
        float _6292 = _5984 * _6284;
        bool _6294 = _6286 > 0.0;
        float _6296 = _6286;
        if (!_6294)
        {
            _6246 = _5966;
        }
        float _6298 = _6246;
        _6248 = _6298;
        if (!_6294)
        {
            _6262 = _6060;
        }
        float _6300 = _6262;
        _6264 = _6300;
        if (!_6294)
        {
            _6296 = _5972;
        }
        float _6302 = _6296;
        bool _6304 = !_6294;
        _6272 = _6302;
        if (!_6304)
        {
            float _6306 = rsqrt(_6282);
            float _6308 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _6310 = _227 * _6306;
            float _6312 = _225 * _6306;
            float _6314 = _6290 * _6310;
            float _6316 = _229 * _6306;
            float _6318 = fma(_6288, _6312, _6314);
            float _6320 = _6308 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6322 = fma(_6292, _6316, _6318);
            float _6324 = _6322 * _6320;
            float _6326 = fma(_225, _6324, _5966);
            float _6328 = fma(_227, _6324, _6060);
            float _6330 = fma(_229, _6324, _5972);
            _6264 = _6328;
            _6248 = _6326;
            _6272 = _6330;
        }
    }
    float _6332 = _6264;
    float _6334 = _6248;
    float _6336 = _6272;
    float _6338 = _6004 * _6194;
    float _6340 = _6268 + _6130;
    if (!_6166)
    {
        int _6342 = _6136 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _6344 = _6342 + _6054;
        _6274 = _6344;
    }
    int _6346 = _6274;
    float _6348 = -_5260;
    float _6350 = fma(_6348, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6332);
    float _6352 = fma(_5280, _6186, _6338);
    float _6354 = fma(_5280, _6100, _6258);
    float _6356 = 1.0 / _6340;
    if (!_6166)
    {
        int _6358 = _6346 << 2;
        _237 = _6358;
    }
    int _6360 = _237;
    float _6362 = fma(_5290, _6206, _6352);
    float _6364 = fma(_5290, _6150, _6354);
    float _6366 = -_5262;
    float _6368 = fma(_6366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6334);
    float _6370 = -_5276;
    float _6372 = fma(_6370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6336);
    int _6374 = _6360;
    float _6376 = _6368;
    float _6378 = _6372;
    if (_6176)
    {
        _6276 = _6350;
    }
    float _6380 = _6276;
    float _6382 = _6380;
    if (!_6166)
    {
        uint _6384 = uint(int(uint(_6346) >> uint(2)));
        _239 = int(_6384);
    }
    int _6386 = _239;
    if (!_6166)
    {
        int _6388 = 12 & _6360;
        _6374 = _6388;
    }
    int _6390 = _6374;
    if (!_6176)
    {
        float _6392 = _5286 * _5286;
        float _6394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6396 = -_3478;
        float _6398 = _6396 + _6336;
        float _6400 = -_3460;
        float _6402 = _6400 + _6334;
        float _6404 = fma(_5294, _5294, _6392);
        float _6406 = fma(_5304, _5304, _6404);
        float _6408 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6410 = sqrt(_6406);
        float _6412 = 1.0 / _5512;
        float _6414 = _6408 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6416 = precise::min(_6410, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6418 = _6416 * _6394;
        float _6420 = -_3452;
        float _6422 = _6420 + _6332;
        float _6424 = _6418 * _6412;
        float _6426 = _6414 * _6424;
        float _6428 = _6398 * _6424;
        float _6430 = fma(_6422, _6426, _5274);
        float _6432 = fma(_6402, _6426, _5280);
        float _6434 = fma(_6414, _6428, _5290);
        _6382 = _6430;
        _6376 = _6432;
        _6378 = _6434;
    }
    float _6436 = _6382;
    float _6438 = _6376;
    float _6440 = _6378;
    if (!_6166)
    {
        int _6442 = _6386 << 4;
        int _6444 = _6442 + _6390;
        _5306 = _6444;
    }
    int _6446 = _5306;
    float _6448 = _6436 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _6450 = _6056 + 88;
    uint _6452 = uint(int(uint(_6450) >> uint(2)));
    uint _6454 = uint(int(uint(int(_6452)) >> uint(2)));
    int _6456 = int(_6452) & 3;
    float _6458 = (*spvDescriptorSet0.vp_c15)._m0[int(_6454)][_6456];
    int _6460 = int(_6452) + 1;
    uint _6462 = uint(int(uint(_6460) >> uint(2)));
    int _6464 = _6460 & 3;
    float _6466 = (*spvDescriptorSet0.vp_c15)._m0[int(_6462)][_6464];
    float _6468 = _6364 + _6158;
    float _6470 = _6436 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6472 = fma(_6438, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6448);
    float _6474 = _6362 + _6214;
    float _6476 = _6468 * _6356;
    float _6478 = _6436 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6480 = fma(_6438, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6470);
    float _6482 = _5262;
    if (!_6166)
    {
        int _6484 = _6446 + 400;
        uint _6486 = uint(int(uint(_6484) >> uint(2)));
        uint _6488 = uint(int(uint(int(_6486)) >> uint(2)));
        int _6490 = int(_6486) & 3;
        float _6492 = (*spvDescriptorSet0.vp_c15)._m0[int(_6488)][_6490];
        _6482 = _6492;
    }
    float _6494 = _6482;
    float _6496 = fma(_6440, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6472);
    float _6498 = fma(_6438, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6478);
    bool _6500 = _6476 >= 0.0;
    float _6502 = _6436 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6504 = fma(_6440, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6480);
    float _6506 = _6496 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6508 = _6474 * _6356;
    float _6510 = fma(_6440, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6498);
    bool _6512 = _6476 <= 1.0;
    bool _6514 = _6512 && _6500;
    float _6516 = fma(_6438, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6502);
    float _6518 = _6504 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6520 = _6506 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6522 = _6510 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _6524 = _6508 >= 0.0;
    bool _6526 = _6524 && _6514;
    float _6528 = fma(_6440, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6516);
    float _6530 = fma(_6518, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6520);
    float _6532 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _6534 = _6522 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _6536 = _6508 <= 1.0;
    bool _6538 = _6536 && _6526;
    float _6540 = _6528 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6542 = fma(_6522, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6530);
    float _6544 = _6004 * _6238;
    float _6546 = -_6534;
    float _6548 = fma(_6546, _6532, 1.0);
    float _6550 = _6506 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6552 = fma(_6540, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6542);
    float _6554 = fma(_5280, _6230, _6544);
    float _6556 = _6506 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6558 = fma(_6518, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6550);
    float _6560 = log2(_6548);
    float _6562 = fma(_6518, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6556);
    if (_6538)
    {
        float _6564 = float(_6042);
        _6218 = _6564;
    }
    float _6566 = _6218;
    float _6568 = fma(_6522, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6558);
    float _6570 = fma(_6522, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6562);
    float _6572 = 1.0 / _6552;
    float _6574 = fma(_6540, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6568);
    float _6576 = fma(_6540, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6570);
    float _6578 = fma(_5290, _6458, _6554);
    float _6580 = _6578 + _6466;
    float _6582 = _6332;
    float _6584 = _6466;
    float _6586 = _6566;
    float _6588 = _6576;
    float _6590 = _6574;
    if (!_6166)
    {
        float _6592 = floor(_6058);
        _6582 = _6592;
    }
    float _6594 = _6582;
    float _6596 = _6560 * 0.693147182464599609375;
    if (!_6166)
    {
        float _6598 = -_6252;
        float _6600 = _6014 + _6598;
        _6584 = _6600;
    }
    float _6602 = _6584;
    float _6604 = _6580 * _6356;
    float _6606 = _6596 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6608 = _6550;
    float _6610 = _6606;
    if (_6538)
    {
        float _6612 = rint(_6566);
        float _6614 = precise::max(_6612, 0.0);
        uint _6616 = uint(_6614);
        uint _6618 = clamp(_6616, 0u, 65535u);
        _6608 = as_type<float>(_6618);
    }
    float _6620 = _6608;
    float _6622 = _6576 * _6572;
    float _6624 = _6574 * _6572;
    float _6626 = fma(_6622, 0.5, 0.5);
    float _6628 = fma(_6624, -0.5, 0.5);
    float _6630 = _6580;
    if (!_6166)
    {
        float _6632 = rint(_6494);
        float _6634 = precise::max(_6632, 0.0);
        uint _6636 = uint(_6634);
        uint _6638 = clamp(_6636, 0u, 65535u);
        _6630 = as_type<float>(_6638);
    }
    float _6640 = _6630;
    float _6642 = _6594;
    if (!_6166)
    {
        float _6644 = -_6594;
        float _6646 = _6058 + _6644;
        _6642 = _6646;
    }
    float _6648 = _6642;
    float _6650 = _6508;
    if (_6538)
    {
        float3 _17238 = float3(_6476, _6508, float(as_type<int>(_6620)));
        float3 _17242 = select(_17238, float3(0.0), isnan(_17238));
        float _6652 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _17242.xy, uint(rint(_17242.z)), _6604, level(0.0));
        _6650 = _6652;
    }
    float _6654 = _6650;
    float3 _17252 = float3(_6626, _6628, _6606);
    float _6656 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_17252, float3(0.0), isnan(_17252)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_17252, float3(0.0), isnan(_17252)), level(0.0)).x;
    float3 _17261 = float3(_6626, _6628, _6606);
    float4 _6659 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_17261, float3(0.0), isnan(_17261)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_17261, float3(0.0), isnan(_17261)), level(0.0)).xyzw;
    float _6661 = _6659.x;
    float _6663 = _6659.y;
    float _6665 = _6659.z;
    float _6667 = _6659.w;
    float _6669 = _6602;
    if (!_6166)
    {
        float3 _17284 = float3(_6602, _6648, float(as_type<int>(_6640)));
        float3 _17286 = select(_17284, float3(0.0), isnan(_17284));
        float _6671 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _17286.xy, uint(rint(_17286.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _17286.xy, uint(rint(_17286.z)), level(0.0)).x;
        _6669 = _6671;
    }
    float _6673 = _6669;
    if (_6166)
    {
        _6586 = 1.0;
    }
    float _6675 = _6586;
    float _6677 = _6675;
    float _6679 = _6663;
    float _6681 = _6661;
    if (!_6166)
    {
        int _6683 = _6346 << 4;
        int _6685 = _6683 + 2048;
        uint _6687 = uint(int(uint(_6685) >> uint(2)));
        uint _6689 = uint(int(uint(int(_6687)) >> uint(2)));
        int _6691 = int(_6687) & 3;
        float _6693 = (*spvDescriptorSet0.vp_c15)._m0[int(_6689)][_6691];
        int _6695 = int(_6687) + 1;
        uint _6697 = uint(int(uint(_6695) >> uint(2)));
        int _6699 = _6695 & 3;
        float _6701 = (*spvDescriptorSet0.vp_c15)._m0[int(_6697)][_6699];
        int _6703 = _6685 + 8;
        uint _6705 = uint(int(uint(_6703) >> uint(2)));
        uint _6707 = uint(int(uint(int(_6705)) >> uint(2)));
        int _6709 = int(_6705) & 3;
        float _6711 = (*spvDescriptorSet0.vp_c15)._m0[int(_6707)][_6709];
        int _6713 = int(_6705) + 1;
        uint _6715 = uint(int(uint(_6713) >> uint(2)));
        int _6717 = _6713 & 3;
        float _6719 = (*spvDescriptorSet0.vp_c15)._m0[int(_6715)][_6717];
        float _6721 = _6004 * _6701;
        float _6723 = fma(_5280, _6693, _6721);
        float _6725 = fma(_5290, _6711, _6723);
        float _6727 = _6725 + _6719;
        float _6729 = precise::clamp(_6727, 0.0, 1.0);
        float _6731 = -_6729;
        float _6733 = _6731 + _6673;
        float _6735 = fma(_6733, 500.0, 1.5);
        float _6737 = exp2(_6735);
        float _6739 = 0.0 + _6737;
        float _6741 = precise::clamp(_6739, 0.0, 1.0);
        _6677 = _6741;
    }
    float _6743 = _6677;
    float _6745 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6747 = _6436 + _6745;
    float _6749 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6751 = _6438 + _6749;
    float _6753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6755 = _6440 + _6753;
    float _6757 = _6747 * _6747;
    float _6759 = fma(_6751, _6751, _6757);
    float _6761 = fma(_6755, _6755, _6759);
    float _6763 = rsqrt(_6761);
    float _6765 = _6763 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6767 = _6751 * _6765;
    float _6769 = _6755 * _6765;
    float _6771 = _6767 * _6767;
    float _6773 = _6769 * _6769;
    float _6775 = _6771 + _6773;
    float _6777 = sqrt(_6775);
    bool _6779 = _6777 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6781 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6783 = _6777 + _6781;
    float _6785 = _6759;
    float _6787 = _6763;
    float _6789 = _6783;
    float _6791 = _6747;
    float _6793 = _6765;
    if (_6779)
    {
        float _6795 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6785 = _6795;
    }
    float _6797 = _6785;
    if (_6779)
    {
        float _6799 = rsqrt(_6775);
        _6787 = _6799;
    }
    float _6801 = _6787;
    float _6803 = _6797;
    float _6805 = _6801;
    if (_6779)
    {
        float _6807 = _6783 * _6797;
        _6789 = _6807;
    }
    float _6809 = _6789;
    if (_6779)
    {
        float _6811 = _6809 * 0.15915493667125701904296875;
        _6803 = _6811;
    }
    float _6813 = _6803;
    float _6815 = _6755;
    float _6817 = _6813;
    if (_6779)
    {
        float _6819 = _6813 * 6.283185482025146484375;
        float _6821 = sin(_6819);
        _6815 = _6821;
    }
    float _6823 = _6815;
    float _6825 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6827 = precise::max(0.0, _6825);
    float _6829 = _6673;
    float _6831 = _6827;
    if (_6779)
    {
        float _6833 = _6813 * 6.283185482025146484375;
        float _6835 = cos(_6833);
        _6829 = _6835;
    }
    float _6837 = _6829;
    float _6839 = -_6765;
    float _6841 = -_6827;
    float _6843 = fma(_6747, _6839, _6841);
    if (_6779)
    {
        float _6845 = _6843 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6791 = _6845;
    }
    float _6847 = _6791;
    float _6849 = _6847;
    if (!_6779)
    {
        _6817 = _6771;
    }
    float _6851 = _6817;
    float _6853 = _6823;
    float _6855 = _6851;
    if (_6779)
    {
        float _6857 = fma(_6823, _6847, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6849 = _6857;
    }
    float _6859 = _6849;
    float _6861 = _6859;
    if (!_6779)
    {
        _6853 = _6843;
    }
    float _6863 = _6853;
    float _6865 = _6863;
    float _6867 = _6837;
    if (_6779)
    {
        float _6869 = _6837 + (-1.0);
        _6831 = _6869;
    }
    float _6871 = _6831;
    if (_6779)
    {
        float _6873 = _6801 * _6859;
        _6610 = _6873;
    }
    float _6875 = _6610;
    if (!_6779)
    {
        _6805 = _6767;
    }
    float _6877 = _6805;
    float _6879 = _6877;
    if (_6779)
    {
        float _6881 = _6871 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6793 = _6881;
    }
    float _6883 = _6793;
    if (_6779)
    {
        float _6885 = _6767 * _6875;
        _6879 = _6885;
    }
    float _6887 = _6879;
    if (!_6779)
    {
        _6861 = _6769;
    }
    float _6889 = _6861;
    float _6891 = _6889;
    if (_6779)
    {
        float _6893 = _6769 * _6875;
        _6891 = _6893;
    }
    float _6895 = _6891;
    if (_6779)
    {
        float _6897 = fma(_6843, _6837, _6883);
        _6865 = _6897;
    }
    float _6899 = _6865;
    if (_6779)
    {
        float _6901 = _6887 * _6887;
        _6855 = _6901;
    }
    float _6903 = _6855;
    if (!_6779)
    {
        _6867 = _6773;
    }
    float _6905 = _6867;
    float _6907 = _6905;
    if (_6779)
    {
        float _6909 = _6895 * _6895;
        _6907 = _6909;
    }
    float _6911 = _6907;
    float _6913 = sqrt(_6761);
    float _6915 = fma(_6899, _6899, _6903);
    float _6917 = _6915 + _6911;
    float _6919 = rsqrt(_6917);
    float _6921 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6923 = fma(_6913, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6921);
    float _6925 = precise::clamp(_6923, 0.0, 1.0);
    float _6927 = -_6925;
    float _6929 = _6927 + 1.0;
    float _6931 = abs(_6929);
    float _6933 = log2(_6931);
    float _6935 = _6919 * _6887;
    float _6937 = _6919 * _6899;
    float _6939 = _6919 * _6895;
    float _6941 = _6935 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6943 = -_6941;
    float _6945 = fma(_6937, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6943);
    float _6947 = -_6939;
    float _6949 = fma(_6947, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6945);
    float _6951 = _6933 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6953 = fma(_6949, -0.5, 0.5);
    float _6955 = exp2(_6951);
    float _6957 = fma(_6949, 0.5, 0.5);
    float _6959 = _6937 + 1.0;
    float _6961 = fma(_6957, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6963 = sqrt(_6953);
    float _6965 = fma(_6957, _6961, -0.212114393711090087890625);
    float _6967 = fma(_6957, _6965, 1.570728778839111328125);
    float _6969 = -_6937;
    float _6971 = fma(_6955, _6959, _6969);
    float _6973 = fma(_6971, 0.5, 0.5);
    float _6975 = _6963 * 0.636619746685028076171875;
    float _6977 = -_6967;
    float _6979 = fma(_6975, _6977, 1.0);
    float2 _17760 = float2(_6979, _6973);
    float3 _6981 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_17760, float2(0.0), isnan(_17760)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_17760, float2(0.0), isnan(_17760)), level(0.0)).xyz;
    float _6983 = _6981.x;
    float _6985 = _6981.y;
    float _6987 = _6981.z;
    float _6989 = abs(_6018);
    float _6991 = log2(_6989);
    float _6993 = _6933 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6995 = _6506 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _6997 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _6999 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _7001 = _6997 || _6999;
    bool _7003 = isnan(0.5);
    bool _7005 = _7001 || _7003;
    float _7007 = -_5952;
    float _7009 = _7007 + 1.0;
    float _7011 = exp2(_6993);
    float _7013 = fma(_6518, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6995);
    bool _7015 = _6018 <= 8000.0;
    bool _7017 = isnan(_6018);
    bool _7019 = _7015 || _7017;
    bool _7021 = isnan(8000.0);
    bool _7023 = _7019 || _7021;
    float _7025 = float(_7023);
    float _7027 = _6991 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _7029 = _6951;
    float _7031 = _7013;
    if (!_7005)
    {
        _7029 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _7033 = _7029;
    float _7035 = exp2(_7027);
    float _7037 = _7033;
    if (!_7005)
    {
        float _7039 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7041 = _7033 + _7039;
        _7037 = _7041;
    }
    float _7043 = _7037;
    float _7045 = -_7011;
    float _7047 = _7045 + 1.0;
    float _7049 = _6771;
    if (!_7005)
    {
        float _7051 = 1.0 / _7043;
        _7049 = _7051;
    }
    float _7053 = _7049;
    float _7055 = fma(_7035, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _7057 = precise::clamp(_7055, 0.0, 1.0);
    float _7059 = fma(_6522, (*spvDescriptorSet0.vp_c8)._m0[6].z, _7013);
    if (_7005)
    {
        _7031 = 1.0;
    }
    float _7061 = _7031;
    float _7063 = fma(_7057, -2.0, 3.0);
    float _7065 = _7057 * _7057;
    float _7067 = fma(_6540, (*spvDescriptorSet0.vp_c8)._m0[6].w, _7059);
    float _7069 = _7065 * _7063;
    float _7071 = _7067 + _6552;
    out.gl_Position.x = _6576;
    out.gl_Position.y = _6574;
    out.gl_Position.z = _7067;
    out.gl_Position.w = _6552;
    float _7073 = -_7069;
    float _7075 = _7073 + 1.0;
    float _7077 = _7071 * 0.5;
    float _7079 = fma(_7075, (*spvDescriptorSet0.vp_c15)._m0[654].w, _7069);
    float _7081 = _7069;
    float _7083 = _7061;
    if (!_7005)
    {
        float _7085 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7087 = _6018 + _7085;
        _7081 = _7087;
    }
    float _7089 = _7081;
    float _7091 = _6552 * 0.5;
    float _7093 = _6576 + _6552;
    float _7095 = _7025 * _7079;
    float _7097 = _7089;
    if (!_7005)
    {
        float _7099 = _7089 * _7053;
        float _7101 = precise::clamp(_7099, 0.0, 1.0);
        _7083 = _7101;
    }
    float _7103 = _7083;
    float _7105 = fma(_6574, -0.5, _7091);
    if (!_6538)
    {
        _7097 = 1.0;
    }
    float _7107 = _7097;
    float _7109 = _7095 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _7111 = _7107;
    if (_6538)
    {
        bool _7113 = _6654 >= _6604;
        bool _7115 = isnan(_6654);
        bool _7117 = _7113 || _7115;
        bool _7119 = isnan(_6604);
        bool _7121 = _7117 || _7119;
        float _7123 = float(_7121);
        _7111 = _7123;
    }
    float _7125 = _7111;
    float _7127 = _7047 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _7129 = _7093 * 0.5;
    float _7131 = _7009 * _7109;
    float _7133 = precise::clamp(_7131, 0.0, 1.0);
    bool _7135 = _6913 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _7137 = isnan(_6913);
    bool _7139 = _7135 || _7137;
    bool _7141 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _7143 = _7139 || _7141;
    float _7145 = _7127 * _6656;
    float _7147 = _7125 * _6743;
    float _7149 = -_7133;
    float _7151 = fma(_7149, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7153 = -_7127;
    float _7155 = _7153 + 1.0;
    float _7157 = _6667 * _7145;
    out.m_104.x = _7129;
    out.m_104.y = _7105;
    out.m_104.z = _7077;
    out.m_104.w = _6552;
    float _7159 = -_7147;
    float _7161 = fma(_7159, _7151, 1.0);
    float _7163 = precise::clamp(_7161, 0.0, 1.0);
    float _7165 = _6667 * _7155;
    float _7167 = _7103 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _7169 = _7163 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7171 = _7163;
    float _7173 = _7145;
    if (!_7143)
    {
        _6588 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _7175 = _6588;
    float _7177 = _7175;
    float _7179 = _7175;
    if (!_7143)
    {
        _6590 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _7181 = _6590;
    out.m_106.x = _7169;
    float _7183 = _7181;
    float _7185 = _7181;
    if (!_7143)
    {
        _7171 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7187 = _7171;
    float _7189 = _6987 * _7145;
    float _7191 = fma(_6983, _7157, _6661);
    float _7193 = fma(_6985, _7157, _6663);
    float _7195 = _7187;
    float _7197 = _7187;
    if (!_7143)
    {
        _6679 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _7199 = _6679;
    float _7201 = fma(_6667, _7189, _6665);
    float _7203 = _7199;
    float _7205 = _7199;
    if (!_7143)
    {
        _6681 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _7207 = _6681;
    float _7209 = _7207;
    float _7211 = _7207;
    if (!_7143)
    {
        _7173 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _7213 = _7173;
    out.m_108.x = _7191;
    out.m_108.y = _7193;
    out.m_108.z = _7201;
    out.m_108.w = _7165;
    bool _7215 = !_7143;
    float _7217 = _7213;
    float _7219 = _7213;
    if (!_7215)
    {
        bool _7221 = _6913 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7223 = isnan(_6913);
        bool _7225 = _7221 || _7223;
        bool _7227 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7229 = _7225 || _7227;
        if (!_7229)
        {
            float _7231 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7233 = _6913 + _7231;
            float _7235 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7237 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7235;
            float _7239 = 1.0 / _7237;
            float _7241 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7243 = _7241 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7245 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7247 = _7245 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7249 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7251 = _7249 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7253 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7255 = _7253 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7257 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7259 = _7257 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7261 = _7233 * _7239;
            float _7263 = precise::clamp(_7261, 0.0, 1.0);
            float _7265 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7267 = _7265 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7269 = fma(_7263, _7243, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7271 = fma(_7263, _7267, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7273 = fma(_7263, _7247, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7275 = fma(_7263, _7251, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7277 = fma(_7263, _7255, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7279 = fma(_7263, _7259, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _7185 = _7271;
            _7211 = _7277;
            _7179 = _7269;
            _7205 = _7275;
            _7197 = _7273;
            _7219 = _7279;
            _7281 = true;
        }
        else
        {
            bool _7283 = _6913 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7285 = isnan(_6913);
            bool _7287 = _7283 || _7285;
            bool _7289 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7291 = _7287 || _7289;
            if (!_7291)
            {
                _7177 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7293 = _7177;
            _7179 = _7293;
            if (!_7291)
            {
                _7183 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7295 = _7183;
            _7185 = _7295;
            if (!_7291)
            {
                _7195 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7297 = _7195;
            _7197 = _7297;
            if (!_7291)
            {
                _7203 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7299 = _7203;
            _7205 = _7299;
            if (!_7291)
            {
                _7209 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7301 = _7209;
            _7211 = _7301;
            if (!_7291)
            {
                _7217 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7303 = _7217;
            bool _7305 = !_7291;
            _7219 = _7303;
            if (!_7305)
            {
                bool _7307 = _6913 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7309 = isnan(_6913);
                bool _7311 = _7307 || _7309;
                bool _7313 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7315 = _7311 || _7313;
                if (!_7315)
                {
                    float _7317 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7319 = _6913 + _7317;
                    float _7321 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7323 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7321;
                    float _7325 = 1.0 / _7323;
                    float _7327 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7329 = _7327 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7331 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7333 = _7331 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7335 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7337 = _7335 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7339 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7341 = _7339 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7343 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7345 = _7343 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7347 = _7319 * _7325;
                    float _7349 = precise::clamp(_7347, 0.0, 1.0);
                    float _7351 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7353 = _7351 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7355 = fma(_7349, _7329, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7357 = fma(_7349, _7353, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7359 = fma(_7349, _7333, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7361 = fma(_7349, _7337, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7363 = fma(_7349, _7341, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7365 = fma(_7349, _7345, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _7185 = _7357;
                    _7211 = _7363;
                    _7179 = _7355;
                    _7205 = _7361;
                    _7197 = _7359;
                    _7219 = _7365;
                    _7281 = true;
                }
                else
                {
                    _7185 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _7211 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _7179 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _7205 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7197 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _7219 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7281 = false;
    float _7367 = _7185;
    float _7369 = _7211;
    float _7371 = _7179;
    float _7373 = _7205;
    float _7375 = _7197;
    float _7377 = _7219;
    float _7379 = fma(_5850, -0.5, 0.5);
    float _7381 = precise::clamp(_7379, 0.0, 1.0);
    float _7383 = -_7367;
    float _7385 = _7383 + _7369;
    float _7387 = _7167 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7389 = -_7371;
    float _7391 = _7389 + _7373;
    out.m_110.x = 0.0;
    float _7393 = fma(_7381, _7385, _7367);
    float _7395 = fma(_7381, _7391, _7371);
    out.m_63.x = _7387;
    float _7397 = -_7375;
    float _7399 = _7397 + _7377;
    float _7401 = _7393 * 0.586610972881317138671875;
    bool _7403 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7405 = fma(_7381, _7399, _7375);
    float _7407 = fma(_7395, 0.298911988735198974609375, _7401);
    bool _7409 = _7103 > 0.0;
    bool _7411 = isnan(_7103);
    bool _7413 = _7409 || _7411;
    bool _7415 = isnan(0.0);
    bool _7417 = _7413 || _7415;
    float _7419 = fma(_7405, 0.114477999508380889892578125, _7407);
    float _7421 = -_7419;
    float _7423 = _7395 + _7421;
    float _7425 = -_7419;
    float _7427 = _7393 + _7425;
    float _7429 = -_7419;
    float _7431 = _7405 + _7429;
    float _7433 = fma(_7423, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7419);
    float _7435 = fma(_7427, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7419);
    float _7437 = fma(_7431, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7419);
    bool _7439 = !_7403;
    if (!_7439)
    {
        float _7441 = -_6436;
        float _7443 = _7441 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7445 = -_6438;
        float _7447 = _7445 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7449 = -_6440;
        float _7451 = _7449 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7453 = _7443 * _7443;
        float _7455 = fma(_7447, _7447, _7453);
        float _7457 = fma(_7451, _7451, _7455);
        float _7459 = sqrt(_7457);
        float _7461 = rsqrt(_7457);
        float _7463 = -_7459;
        float _7465 = _7463 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7467 = _7465 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7469 = precise::clamp(_7467, 0.0, 1.0);
        float _7471 = _7447 * _7461;
        float _7473 = _7443 * _7461;
        float _7475 = abs(_7469);
        float _7477 = log2(_7475);
        float _7479 = _7451 * _7461;
        float _7481 = _7471 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7483 = _5850 * _7473;
        float _7485 = -_7473;
        float _7487 = -_7481;
        float _7489 = fma(_7485, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7487);
        float _7491 = fma(_5854, _7471, _7483);
        float _7493 = -_7479;
        float _7495 = fma(_7493, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7489);
        float _7497 = fma(_5856, _7479, _7491);
        float _7499 = precise::clamp(_7497, 0.0, 1.0);
        float _7501 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7503 = _7495 + _7501;
        float _7505 = _7477 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7507 = _7503 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7509 = precise::clamp(_7507, 0.0, 1.0);
        float _7511 = exp2(_7505);
        float _7513 = _7511 * _7509;
        float _7515 = _7499 * _7513;
        float _7517 = _7515 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7519 = _7515 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7521 = _7515 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_110.x = _7517;
        out.m_110.y = _7519;
        out.m_110.z = _7521;
    }
    out.m_112.x = _7433;
    out.m_112.y = _7435;
    out.m_112.z = _7437;
    if (_7417)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _7523 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7523;
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
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_112 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    bool _7281 = false;
    bool _5904 = false;
    bool _1141 = false;
    bool _821 = false;
    bool _641 = false;
    bool _453 = false;
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _126 = in.m_60.w;
    float _128 = trunc(_126);
    int _131 = int(_128);
    bool _135 = _131 >= 1;
    float _137 = 0.0;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    float _141 = _139;
    if (!_135)
    {
        out.m_63.x = 0.0;
    }
    int _143 = 0;
    if (!_135)
    {
        float _145 = _139 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    int _149 = _147;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7580 = as_type<float>(_147);
        out.gl_Position.z = _7580;
    }
    if (!_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_65.w;
    bool _153 = _151 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_151);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = -_151;
    float _165 = _163 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _167 = _165;
    if (_161)
    {
        float _169 = float(_131);
        _141 = _169;
    }
    float _171 = _141;
    bool _173 = _165 >= _171;
    bool _175 = !_161;
    bool _177 = _173 || _175;
    float _179 = _171;
    if (_177)
    {
        _179 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _181 = _179;
    if (_177)
    {
        out.m_63.x = 0.0;
    }
    if (_177)
    {
        float _183 = _181 * 5.0;
        _149 = as_type<int>(_183);
    }
    int _185 = _149;
    if (_177)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7650 = as_type<float>(_185);
        out.gl_Position.z = _7650;
    }
    if (_177)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = in.m_70.x;
    float _191 = in.m_70.y;
    float _193 = in.m_70.z;
    int _195 = as_type<int>(_187) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_187) & 2;
    bool _201 = _199 != 0;
    bool _203 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _205 = _191 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _207 = _191 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _209 = _191 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _211 = !_197;
    float _213 = _211 ? (-0.5) : 0.5;
    float _215 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[4].x, _205);
    float _217 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[5].x, _207);
    float _219 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[6].x, _209);
    bool _221 = !_201;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[4].z, _215);
    float _227 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[5].z, _217);
    float _229 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[6].z, _219);
    bool _231 = !_203;
    bool _233 = false;
    bool _235 = false;
    int _237 = as_type<int>(_225);
    int _239 = as_type<int>(_227);
    float _257;
    if (!_231)
    {
        float _241 = in.m_72.x;
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _241 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _165);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        float _261 = float(_131);
        float _263 = 1.0 / _261;
        float _265 = _165 * _263;
        _257 = _265;
    }
    _259 = false;
    float _267 = _257;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _271 = _267 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = _267 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _267 + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _287 = _285 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _289;
    bool _293 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _295 = isnan(_267);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = 1.0 / _283;
    bool _307 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _309 = 1.0 / _291;
    float _311 = 1.0 / _287;
    float _313 = _271 * _305;
    bool _315 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _317 = isnan(_267);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -_303;
    float _329 = _327 + 1.0;
    float _331 = _325 * _329;
    float _333 = _275 * _309;
    bool _335 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _337 = isnan(_267);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -_325;
    float _349 = _347 + 1.0;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _355 = _345 * _349;
    float _357 = -_345;
    float _359 = _357 + 1.0;
    float _361 = _279 * _311;
    bool _363 = _267 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _365 = isnan(_267);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _375;
    float _379 = fma(_353, _361, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = fma(_377, _313, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = _373 * _359;
    float _393 = fma(_383, _313, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _395 = fma(_387, _361, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = -_373;
    float _399 = _397 + 1.0;
    float _401 = _389 * _391;
    float _403 = _393 * _391;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _405;
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].y, _403);
    float _417 = fma(_407, _333, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _419 = fma(_379, _355, _409);
    float _421 = fma(_413, _333, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_395, _355, _415);
    float _425 = fma(_417, _331, _419);
    float _427 = fma(_421, _331, _423);
    float _429 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].x, _425);
    float _431 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[146].y, _427);
    bool _433 = !_307;
    float _451;
    if (!_433)
    {
        float _435 = in.m_72.x;
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _435 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _165);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _451 = _449;
        _453 = true;
    }
    else
    {
        float _455 = float(_131);
        float _457 = 1.0 / _455;
        float _459 = _165 * _457;
        _451 = _459;
    }
    _453 = false;
    float _461 = _451;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _465 = _461 + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _475 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _477 = isnan(_461);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _491 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _493 = isnan(_461);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = 1.0 / _469;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _505;
    float _509 = -_485;
    float _511 = _509 + 1.0;
    bool _513 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _515 = isnan(_461);
    bool _517 = _513 || _515;
    bool _519 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _521 = _517 || _519;
    float _523 = float(_521);
    bool _525 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _527 = 1.0 / _473;
    float _529 = 1.0 / _489;
    float _531 = _507 * _503;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _537 = _501 * _511;
    float _539 = -_501;
    float _541 = _539 + 1.0;
    float _543 = fma(_531, _465, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _545;
    float _549 = _523 * _541;
    float _551 = _535 * _527;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _555 = _461 + _553;
    bool _557 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _559 = isnan(_461);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = _543 * _549;
    float _571 = -_523;
    float _573 = _571 + 1.0;
    float _575 = fma(_551, _555, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _579 = _461 + _577;
    float _581 = _547 * _529;
    float _583 = -_567;
    float _585 = _583 + 1.0;
    float _587 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[115].x, _569);
    float _589 = fma(_581, _579, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _591 = _485 * _585;
    float _593 = fma(_575, _537, _587);
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _597 = fma(_589, _591, _593);
    float _599 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[118].x, _597);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _605 = in.m_74.x;
    float _607 = in.m_74.y;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _611 = _601 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _613 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _615 = _609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_76.x = _599;
    out.m_76.y = _613;
    out.m_76.z = _615;
    out.m_76.w = _611;
    float _617 = _431 * _607;
    float _619 = _429 * _605;
    bool _621 = !_525;
    float _639;
    if (!_621)
    {
        float _623 = in.m_72.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[11].w, _165);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_131);
        float _645 = 1.0 / _643;
        float _647 = _165 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _659 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _661 = isnan(_649);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = 1.0 / _653;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _677 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _679 = isnan(_649);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _689;
    float _693 = -_669;
    float _695 = _693 + 1.0;
    bool _697 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _699 = isnan(_649);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    bool _709 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _711 = 1.0 / _657;
    float _713 = _687 * _695;
    float _715 = -_687;
    float _717 = _715 + 1.0;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _723 = _707 * _717;
    float _725 = -_707;
    float _727 = _725 + 1.0;
    float _729 = 1.0 / _675;
    float _731 = _691 * _671;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _735 = _649 + _733;
    float _737 = fma(_731, _735, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _741 = _649 + _739;
    float _743 = _721 * _711;
    bool _745 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _747 = isnan(_649);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _757;
    float _761 = _737 * _723;
    float _763 = fma(_743, _741, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _767 = _649 + _765;
    float _769 = -_755;
    float _771 = _769 + 1.0;
    float _773 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[131].x, _761);
    float _775 = _759 * _729;
    float _777 = _669 * _771;
    float _779 = fma(_763, _713, _773);
    float _781 = fma(_775, _767, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _783 = fma(_781, _777, _779);
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _791 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[134].x, _783);
    float _793 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _795 = _787 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _797 = _789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _791 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _793;
    out.m_78.y = _795;
    out.m_78.z = _797;
    out.m_78.w = _799;
    bool _801 = !_709;
    float _819;
    if (!_801)
    {
        float _803 = in.m_72.x;
        float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _807 = _803 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _809 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[14].x, _165);
        float _811 = _809 * _805;
        float _813 = floor(_811);
        float _815 = -_813;
        float _817 = _811 + _815;
        _819 = _817;
        _821 = true;
    }
    else
    {
        float _823 = float(_131);
        float _825 = 1.0 / _823;
        float _827 = _165 * _825;
        _819 = _827;
    }
    _821 = false;
    float _829 = _819;
    bool _831 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _833 = isnan(_829);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    bool _843 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _845 = isnan(_829);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _859 = -_841;
    float _861 = _859 + 1.0;
    bool _863 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _865 = isnan(_829);
    bool _867 = _863 || _865;
    bool _869 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _871 = _867 || _869;
    float _873 = float(_871);
    float _875 = 1.0 / _857;
    float _877 = -_853;
    float _879 = _877 + 1.0;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _881;
    float _885 = _853 * _861;
    bool _887 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _889 = isnan(_829);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = _873 * _879;
    float _901 = -_873;
    float _903 = _901 + 1.0;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _909 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _911 = isnan(_829);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = -_897;
    float _923 = _921 + 1.0;
    float _925 = _897 * _903;
    float _927 = 1.0 / _907;
    bool _929 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _931 = isnan(_829);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = _883 * _875;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _945 = _829 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _951 = fma(_941, _945, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _957 = -_919;
    float _959 = _957 + 1.0;
    float _961 = _919 * _923;
    bool _963 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _965 = isnan(_829);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _971 = _967 || _969;
    float _973 = float(_971);
    float _975 = 1.0 / _949;
    float _977 = _939 * _959;
    float _979 = -_939;
    float _981 = _979 + 1.0;
    float _983 = _973 * _981;
    float _985 = -_973;
    float _987 = _985 + 1.0;
    float _989 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _991 = _989 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _995 = _993 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _997 = _951 * _983;
    float _999 = 1.0 / _955;
    float _1001 = _995 * _927;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1003;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1011 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[159].x, _997);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1017 = _1005 * _975;
    float _1019 = 1.0 / _1009;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1023 = _829 + _1021;
    bool _1025 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1027 = fma(_1001, _1023, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1031 = _829 + _1029;
    float _1033 = 1.0 / _991;
    float _1035 = fma(_1027, _977, _1011);
    float _1037 = fma(_1017, _1031, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1049 = _829 + _1047;
    float _1051 = fma(_1037, _961, _1035);
    float _1053 = 1.0 / _1015;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1057 = _1055 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1059 = _1041 * _1019;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1063 = _829 + _1061;
    float _1065 = _1057 * _999;
    float _1067 = _1045 * _1033;
    float _1069 = fma(_1065, _1049, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1071 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1073 = isnan(_829);
    bool _1075 = _1071 || _1073;
    bool _1077 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1079 = _1075 || _1077;
    float _1081 = float(_1079);
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1083;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1089 = _829 + _1087;
    float _1091 = fma(_1067, _1063, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1093 = fma(_1069, _925, _1051);
    float _1095 = -_1081;
    float _1097 = _1095 + 1.0;
    float _1099 = _1085 * _1053;
    float _1101 = fma(_1059, _1089, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1103 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1105 = _829 + _1103;
    float _1107 = fma(_1091, _899, _1093);
    float _1109 = _841 * _1097;
    float _1111 = fma(_1099, _1105, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1113 = fma(_1101, _885, _1107);
    float _1115 = fma(_1111, _1109, _1113);
    float _1117 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1115);
    out.m_80.x = _1117;
    bool _1119 = !_1025;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1139;
    if (!_1119)
    {
        float _1123 = in.m_72.x;
        float _1125 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1127 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1129 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[14].y, _165);
        float _1131 = _1129 * _1125;
        float _1133 = floor(_1131);
        float _1135 = -_1133;
        float _1137 = _1131 + _1135;
        _1139 = _1137;
        _1141 = true;
    }
    else
    {
        float _1143 = float(_131);
        float _1145 = 1.0 / _1143;
        float _1147 = _165 * _1145;
        _1139 = _1147;
    }
    _1141 = false;
    float _1149 = _1139;
    float _1151 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1153 = int(_1151);
    float _1155 = in.m_72.w;
    float _1157 = float(_131);
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1161 = _1159 != 0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1165 = _1163 != 0;
    float _1167 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1169 = int(_1167);
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _1173 = _1171 != 0;
    float _1175 = float(_1153);
    float _1177 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1179 = int(_1177);
    float _1181 = as_type<float>(_131);
    if (_1161)
    {
        float _1183 = in.m_72.w;
        _1181 = _1183;
    }
    float _1185 = _1181;
    if (!_1161)
    {
        _1121 = _213;
    }
    float _1187 = _1121;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1191 = _1187;
    if (_1173)
    {
        float _1193 = in.m_72.w;
        _1189 = _1193;
    }
    float _1195 = _1189;
    float _1197 = float(uint(_1169));
    float _1199 = 1.0 / _1175;
    bool _1201 = _1155 > 0.5;
    int _1203 = ~_1169;
    int _1205 = _1203 + 1;
    float _1207 = float(_1169);
    float _1209 = 1.0 / _1197;
    float _1211 = float(_1179);
    float _1213 = _1199 * _165;
    float _1215 = _1197;
    bool _1217 = _1201;
    if (_1165)
    {
        float _1219 = in.m_72.z;
        _1215 = _1219;
    }
    float _1221 = _1215;
    float _1223 = 1.0 / _1211;
    float _1225 = _1185;
    if (_1161)
    {
        float _1227 = _1185 * 3.1415927410125732421875;
        _1225 = _1227;
    }
    float _1229 = _1225;
    float _1231 = _1195;
    float _1233 = _1229;
    if (_1173)
    {
        float _1235 = _1195 * 3.1415927410125732421875;
        _1231 = _1235;
    }
    float _1237 = _1231;
    int _1239 = as_type<int>(_1209) + (-2);
    float _1241 = _1237;
    if (_1173)
    {
        float _1243 = _1237 * 0.15915493667125701904296875;
        _1241 = _1243;
    }
    float _1245 = _1241;
    float _1247 = trunc(_1213);
    int _1249 = int(_1247);
    int _1251 = ~_1169;
    int _1253 = _1251 + 1;
    float _1255 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1257 = int(_1255);
    float _1259 = _1223 * _165;
    float _1261 = _1223;
    if (_1161)
    {
        float _1263 = _1229 * 0.15915493667125701904296875;
        _1261 = _1263;
    }
    float _1265 = _1261;
    if (_1165)
    {
        float _1267 = _1221 * 3.1415927410125732421875;
        _1233 = _1267;
    }
    float _1269 = _1233;
    float _1271 = float(uint(_1249));
    float _1273 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1275 = int(_1273);
    float _1277 = as_type<float>(_1239) * _1271;
    float _1279 = float(uint(_1257));
    float _1281 = trunc(_1277);
    float _1283 = precise::max(_1281, 0.0);
    uint _1286 = uint(_1283);
    float _1288 = 1.0 / _1279;
    float _1290 = float(_1275);
    float _1292 = trunc(_1259);
    int _1294 = int(_1292);
    float _1296 = _1279;
    if (_1165)
    {
        float _1298 = _1269 * 0.15915493667125701904296875;
        _1296 = _1298;
    }
    float _1300 = _1296;
    int _1302 = _1253 * int(_1286);
    int _1304 = _1302 + _1249;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1308 = _1306 != 0;
    float _1310 = _1300;
    float _1312 = as_type<float>(_1286);
    if (_1165)
    {
        float _1314 = _1300 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        _1310 = _1316;
    }
    float _1318 = _1310;
    float _1320 = float(uint(_1304));
    int _1322 = as_type<int>(_1288) + (-2);
    float _1324 = as_type<float>(_1239) * _1320;
    float _1326 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1328 = int(_1326);
    float _1330 = float(uint(_1294));
    float _1332 = 0.0;
    if (_1308)
    {
        _1332 = 1.0;
    }
    float _1334 = _1332;
    int _1336 = 0;
    float _1338 = _1334;
    if (_1308)
    {
        _1336 = 0;
    }
    int _1340 = _1336;
    float _1342 = as_type<float>(_1322) * _1330;
    float _1344 = _1221;
    int _1346 = as_type<int>(_1342);
    int _1348 = _1340;
    if (_1161)
    {
        float _1350 = _1265 * 6.283185482025146484375;
        float _1352 = sin(_1350);
        _1344 = _1352;
    }
    float _1354 = _1344;
    if (_1165)
    {
        bool _1356 = _1318 > 0.5;
        _233 = _1356;
    }
    bool _1358 = _233;
    float _1360 = trunc(_1324);
    float _1362 = precise::max(_1360, 0.0);
    uint _1364 = uint(_1362);
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1368 = _1265;
    float _1370 = as_type<float>(_1304);
    if (_1308)
    {
        float _1372 = in.m_72.x;
        float _1374 = in.m_72.y;
        float _1376 = in.m_72.z;
        _1366 = _1372;
        _1368 = _1374;
        _1370 = _1376;
    }
    float _1378 = _1366;
    float _1380 = _1368;
    float _1382 = _1370;
    float _1384 = float(uint(_1328));
    float _1386 = 0.0;
    if (_1173)
    {
        float _1388 = _1245 * 6.283185482025146484375;
        float _1390 = sin(_1388);
        _1386 = _1390;
    }
    float _1392 = _1386;
    float _1394 = _1392;
    if (_1161)
    {
        bool _1396 = _1354 > 0.5;
        _235 = _1396;
    }
    bool _1398 = _235;
    int _1400 = int(_1201);
    int _1402 = _1173 ? 2 : 0;
    int _1404 = _1400 | _1402;
    int _1406 = _1161 ? 4 : 0;
    int _1408 = _1404 | _1406;
    int _1410 = _1165 ? 8 : 0;
    int _1412 = _1408 | _1410;
    int _1414 = _1398 ? 16 : 0;
    int _1416 = _1412 | _1414;
    int _1418 = _1358 ? 32 : 0;
    int _1420 = _1416 | _1418;
    int _1422 = _1308 ? 64 : 0;
    int _1424 = _1420 | _1422;
    int _1426 = _1424 & 1;
    float _1428 = as_type<float>(_1426);
    if (_1308)
    {
        _1428 = 1.0;
    }
    float _1430 = _1428;
    float _1432 = trunc(_1342);
    float _1434 = precise::max(_1432, 0.0);
    uint _1436 = uint(_1434);
    int _1438 = int(_1286) + int(_1364);
    int _1440 = ~_1257;
    int _1442 = _1440 + 1;
    float _1444 = as_type<float>(_1364);
    float _1446 = _1430;
    if (_1308)
    {
        _1444 = 1.0;
    }
    float _1448 = _1444;
    float _1450 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1452 = int(_1450);
    float _1454 = _1448;
    float _1456 = _1378;
    float _1458 = _1380;
    float _1460 = _1382;
    if (_1308)
    {
        _1312 = _1378;
    }
    float _1462 = _1312;
    float _1464 = _1462;
    if (_1308)
    {
        _1346 = 0;
    }
    int _1466 = _1346;
    float _1468 = 0.0;
    int _1470 = _1466;
    if (_1308)
    {
        _1468 = _1462;
    }
    float _1472 = _1468;
    float _1474 = 0.0;
    float _1476 = _1472;
    if (_1308)
    {
        _1474 = _1462;
    }
    float _1478 = _1474;
    float _1480 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1482 = int(_1480);
    float _1484 = 0.0;
    float _1486 = _1478;
    if (_1308)
    {
        _1484 = _1380;
    }
    float _1488 = _1484;
    int _1490 = _1442 * int(_1436);
    int _1492 = _1490 + _1294;
    int _1494 = 0;
    float _1496 = _1488;
    if (_1308)
    {
        _1494 = as_type<int>(_1382);
    }
    int _1498 = _1494;
    int _1500 = _1498;
    if (_1173)
    {
        bool _1502 = _1392 > 0.5;
        _1217 = _1502;
    }
    bool _1504 = _1217;
    float _1506 = 1.0 / _1157;
    float _1508 = 1.0 / _1290;
    float _1510 = 1.0 / _1384;
    if (!_1308)
    {
        float _1512 = in.m_72.x;
        float _1514 = in.m_72.y;
        float _1516 = in.m_72.z;
        float _1518 = _1512 * 3.1415927410125732421875;
        float _1520 = _1518 * 0.15915493667125701904296875;
        float _1522 = _1514 * 3.1415927410125732421875;
        float _1524 = _1522 * 0.15915493667125701904296875;
        float _1526 = _1516 * 3.1415927410125732421875;
        float _1528 = _1520 * 6.283185482025146484375;
        float _1530 = sin(_1528);
        float _1532 = _1526 * 0.15915493667125701904296875;
        float _1534 = _1524 * 6.283185482025146484375;
        float _1536 = sin(_1534);
        float _1538 = _1532 * 6.283185482025146484375;
        float _1540 = sin(_1538);
        _1454 = 7.345489978790283203125;
        _1456 = _1512;
        _1458 = _1514;
        _1460 = _1516;
        _1338 = 1.2345600128173828125;
        _1464 = _1514;
        _1446 = 5.839270114898681640625;
        _1476 = _1516;
        _1470 = 1;
        _1348 = 2;
        _1486 = _1530;
        _1496 = _1536;
        _1500 = as_type<int>(_1540);
    }
    float _1542 = _1454;
    float _1544 = _1456;
    float _1546 = _1458;
    float _1548 = _1460;
    float _1550 = _1338;
    float _1552 = _1464;
    float _1554 = _1446;
    float _1556 = _1476;
    int _1558 = _1470;
    int _1560 = _1348;
    float _1562 = _1486;
    float _1564 = _1496;
    int _1566 = _1500;
    float _1568 = _1542 * _1544;
    float _1570 = float(uint(_1492));
    int _1572 = _1205 * _1438;
    int _1574 = _1572 + _1249;
    float _1576 = float(_1249);
    float _1578 = floor(_1568);
    bool _1580 = _1546 > 0.5;
    float _1582 = as_type<float>(_1322) * _1570;
    if (!_1165)
    {
        _1394 = _213;
    }
    float _1584 = _1394;
    float _1586 = _1506 * _165;
    float _1588 = _1584;
    if (_1161)
    {
        float _1590 = -_213;
        float _1592 = _1398 ? _1590 : _213;
        _1191 = _1592;
    }
    float _1594 = _1191;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1598 = _1149 + _1596;
    if (_1165)
    {
        float _1600 = -_213;
        float _1602 = _1358 ? _1600 : _213;
        _1588 = _1602;
    }
    float _1604 = _1588;
    float _1606 = trunc(_1582);
    float _1608 = precise::max(_1606, 0.0);
    uint _1610 = uint(_1608);
    float _1612 = 0.0;
    if (!_1173)
    {
        _1612 = _223;
    }
    float _1614 = _1612;
    float _1616 = _1544 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1624 = _1622 != 0;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1628 = _1626 != 0;
    float _1630 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1632 = _1576 >= _1207;
    bool _1634 = isnan(_1576);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(_1207);
    bool _1640 = _1636 || _1638;
    float _1642 = float(_1640);
    float _1644 = _1614;
    if (_1173)
    {
        float _1646 = -_223;
        float _1648 = _1504 ? _1646 : _223;
        _1644 = _1648;
    }
    float _1650 = _1644;
    float _1652 = -_1578;
    float _1654 = _1568 + _1652;
    bool _1656 = _1548 > 0.5;
    float _1658 = trunc(_1642);
    int _1660 = int(_1658);
    bool _1662 = uint(_1574) >= uint(_1169);
    float _1664 = _1550 * _1552;
    float _1666 = -_213;
    int _1668 = _1580 ? as_type<int>(_1666) : as_type<int>(_213);
    float _1670 = -_223;
    int _1672 = _1656 ? as_type<int>(_1670) : as_type<int>(_223);
    int _1674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1676 = _1674 != 0;
    float _1678 = floor(_1664);
    float _1680 = _1654 * _1207;
    bool _1682 = !_1662;
    int _1684 = _1682 ? 0 : (-1);
    float _1686 = _1207 * _1586;
    bool _1688 = !_1624;
    float _1690 = _1688 ? _213 : as_type<float>(_1668);
    bool _1692 = !_1628;
    float _1694 = _1692 ? _223 : as_type<float>(_1672);
    float _1696 = trunc(_1680);
    int _1698 = int(_1696);
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1702 = _1700 != 0;
    int _1704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1706 = _1704 != 0;
    int _1708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1710 = _1708 != 0;
    int _1712 = ~_1438;
    int _1714 = _1712 + _1684;
    int _1716 = _1714 + 1;
    float _1718 = float(_1482);
    bool _1720 = !_1706;
    int _1722 = _1720 ? 0 : 1;
    int _1724 = _1169 * _1716;
    int _1726 = _1724 + _1249;
    bool _1728 = _1169 == 0;
    float _1730 = 1.0 / _1718;
    int _1732 = ~_1660;
    int _1734 = _1732 + 1;
    int _1736 = _1734 + 1;
    float _1738 = -_1678;
    float _1740 = _1664 + _1738;
    bool _1742 = !_1728;
    int _1744 = _1742 ? _1726 : (-1);
    int _1746 = int(_1436) + int(_1610);
    int _1748 = ~_1257;
    int _1750 = _1748 + 1;
    int _1752 = _1744 * _1736;
    int _1754 = _1169 + (-1);
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1758 = _1756 != 0;
    int _1760 = _1750 * _1746;
    int _1762 = _1760 + _1294;
    bool _1764 = _1155 > 0.5;
    int _1766 = _1660 * _1754;
    int _1768 = _1766 + _1752;
    bool _1770 = !_1676;
    int _1772 = _1770 ? 0 : 1;
    float _1774 = trunc(_1686);
    int _1776 = int(_1774);
    bool _1778 = !_1758;
    int _1780 = _1778 ? 0 : 1;
    float _1782 = -_223;
    int _1784 = _1764 ? as_type<int>(_1782) : as_type<int>(_223);
    bool _1786 = uint(_1762) >= uint(_1257);
    int _1788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1790 = _1788 != 0;
    int _1792 = abs(_1722);
    bool _1794 = !_1702;
    int _1796 = _1794 ? 0 : 1;
    bool _1798 = !_1710;
    int _1800 = _1798 ? 0 : 1;
    int _1802 = _1768 * _1792;
    bool _1804 = !_1620;
    float _1806 = _1804 ? _223 : as_type<float>(_1784);
    int _1808 = abs(_1772);
    bool _1810 = !_1790;
    float _1812 = _1810 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1814 = !_1786;
    int _1816 = _1814 ? 0 : (-1);
    int _1818 = _1698 * _1808;
    int _1820 = _1818 + _1249;
    int _1822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1824 = _1822 != 0;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1828 = _1826 != 0;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1832 = _1830 != 0;
    int _1834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1836 = _1834 != 0;
    int _1838 = abs(_1796);
    int _1840 = abs(_1800);
    float _1842 = float(_1257);
    int _1844 = _1776 * _1838;
    int _1846 = _1844 + _1802;
    float _1848 = float(_1294);
    float _1850 = _1508 * _165;
    int _1852 = abs(_1780);
    float _1854 = _1842 * _1586;
    bool _1856 = !_1824;
    int _1858 = _1856 ? 0 : 1;
    float _1860 = _1740 * _1842;
    int _1862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _1864 = _1862 != 0;
    float _1866 = trunc(_1854);
    int _1868 = int(_1866);
    bool _1870 = _1848 >= _1842;
    bool _1872 = isnan(_1848);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan(_1842);
    bool _1878 = _1874 || _1876;
    float _1880 = float(_1878);
    int _1882 = _1820 * _1840;
    int _1884 = _1882 + _1846;
    float _1886 = _1730 * _165;
    int _1888 = ~_1746;
    int _1890 = _1888 + _1816;
    int _1892 = _1890 + 1;
    bool _1894 = _1257 == 0;
    float _1896 = trunc(_1880);
    int _1898 = int(_1896);
    int _1900 = _1698 * _1852;
    int _1902 = _1900 + _1884;
    int _1904 = _1257 + (-1);
    int _1906 = _1257 * _1892;
    int _1908 = _1906 + _1294;
    float _1910 = as_type<float>(_1852);
    float _1912 = _1812;
    float _1914 = _1730;
    float _1916 = as_type<float>(_1868);
    float _1918 = as_type<float>(_1902);
    if (_1864)
    {
        float _1920 = in.m_72.y;
        _1910 = _1920;
    }
    float _1922 = _1910;
    float _1924 = float(uint(_1452));
    float _1926 = float(uint(_1902));
    float _1928 = trunc(_1850);
    int _1930 = int(_1928);
    bool _1932 = !_1894;
    int _1934 = _1932 ? _1908 : (-1);
    bool _1936 = !_1828;
    int _1938 = _1936 ? 0 : 1;
    float _1940 = as_type<float>(_1239) * _1926;
    int _1942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1944 = _1942 != 0;
    int _1946 = abs(_1938);
    float _1948 = trunc(_1940);
    float _1950 = precise::max(_1948, 0.0);
    uint _1952 = uint(_1950);
    int _1954 = ~_1898;
    int _1956 = _1954 + 1;
    int _1958 = _1956 + 1;
    bool _1960 = !_1832;
    int _1962 = _1960 ? 0 : 1;
    bool _1964 = _1546 > 0.5;
    int _1966 = _1934 * _1958;
    int _1968 = ~_1169;
    int _1970 = _1968 + 1;
    float _1972 = trunc(_1860);
    int _1974 = int(_1972);
    int _1976 = abs(_1962);
    int _1978 = _1898 * _1904;
    int _1980 = _1978 + _1966;
    float _1982 = _1854;
    bool _1984 = _1944;
    if (_1944)
    {
        float _1986 = in.m_72.x;
        _1982 = _1986;
    }
    float _1988 = _1982;
    int _1990 = abs(as_type<int>(_1812));
    float _1992 = as_type<float>(_1990);
    if (_1864)
    {
        float _1994 = _1922 * 3.1415927410125732421875;
        _1912 = _1994;
    }
    float _1996 = _1912;
    int _1998 = abs(_1858);
    float _2000 = 1.0 / _1924;
    int _2002 = _1970 * int(_1952);
    int _2004 = _2002 + _1902;
    float _2006 = float(uint(_1930));
    float _2008 = float(uint(_2004));
    int _2010 = _1980 * _1946;
    float _2012 = trunc(_1886);
    int _2014 = int(_2012);
    int _2016 = _1974 * _1990;
    int _2018 = _2016 + _1294;
    if (_1864)
    {
        float _2020 = _1996 * 0.15915493667125701904296875;
        _1992 = _2020;
    }
    float _2022 = _1992;
    int _2024 = as_type<int>(_1510) + (-2);
    float _2026 = as_type<float>(_1239) * _2008;
    bool _2028 = !_1836;
    int _2030 = _2028 ? 0 : 1;
    int _2032 = _1868 * _1998;
    int _2034 = _2032 + _2010;
    float _2036 = float(uint(_1820));
    float _2038 = as_type<float>(_2024) * _2006;
    int _2040 = abs(_2030);
    int _2042 = _2018 * _1976;
    int _2044 = _2042 + _2034;
    float _2046 = trunc(_2026);
    float _2048 = precise::max(_2046, 0.0);
    uint _2050 = uint(_2048);
    int _2052 = as_type<int>(_2000) + (-2);
    float _2054 = _1988;
    if (_1944)
    {
        float _2056 = _1988 * 3.1415927410125732421875;
        _2054 = _2056;
    }
    float _2058 = _2054;
    int _2060 = _1974 * _2040;
    int _2062 = _2060 + _2044;
    int _2064 = ~_1328;
    int _2066 = _2064 + 1;
    float _2068 = float(uint(_2014));
    if (_1944)
    {
        float _2070 = _2058 * 0.15915493667125701904296875;
        _1914 = _2070;
    }
    float _2072 = _1914;
    float _2074 = trunc(_2038);
    float _2076 = precise::max(_2074, 0.0);
    uint _2078 = uint(_2076);
    float _2080 = float(uint(_2062));
    float _2082 = as_type<float>(_2052) * _2068;
    int _2084 = ~_1169;
    int _2086 = _2084 + 1;
    float _2088 = float(_1452);
    if (_1864)
    {
        float _2090 = _2022 * 6.283185482025146484375;
        float _2092 = sin(_2090);
        _1916 = _2092;
    }
    float _2094 = _1916;
    int _2096 = ~_1452;
    int _2098 = _2096 + 1;
    float _2100 = float(_2014);
    float _2102 = trunc(_2082);
    float _2104 = precise::max(_2102, 0.0);
    uint _2106 = uint(_2104);
    float _2108 = as_type<float>(_1322) * _2080;
    int _2110 = int(_1952) + int(_2050);
    float _2112 = _1554 * _1556;
    int _2114 = _2066 * int(_2078);
    int _2116 = _2114 + _1930;
    int _2118 = _2086 * _2110;
    int _2120 = _2118 + _1902;
    float _2122 = trunc(_2108);
    float _2124 = precise::max(_2122, 0.0);
    uint _2126 = uint(_2124);
    float _2128 = float(uint(_2116));
    bool _2130 = uint(_2120) >= uint(_1169);
    float _2132 = as_type<float>(_2024) * _2128;
    int _2134 = _2098 * int(_2106);
    int _2136 = _2134 + _2014;
    int _2138 = ~_1257;
    int _2140 = _2138 + 1;
    float _2142 = _2072;
    bool _2144 = _2130;
    if (_1944)
    {
        float _2146 = _2072 * 6.283185482025146484375;
        float _2148 = sin(_2146);
        _2142 = _2148;
    }
    float _2150 = _2142;
    bool _2152 = !_2130;
    float _2154 = _2152 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2156 = float(uint(_2136));
    int _2158 = ~_2110;
    int _2160 = _2158 + as_type<int>(_2154);
    int _2162 = _2160 + 1;
    int _2164 = _2140 * int(_2126);
    int _2166 = _2164 + _2062;
    float _2168 = _2154;
    if (!_1944)
    {
        _2168 = _213;
    }
    float _2170 = _2168;
    float _2172 = trunc(_2132);
    float _2174 = precise::max(_2172, 0.0);
    uint _2176 = uint(_2174);
    float _2178 = as_type<float>(_2052) * _2156;
    float _2180 = float(uint(_2166));
    int _2182 = _1169 * _2162;
    int _2184 = _2182 + _1902;
    float _2186 = _2170;
    if (!_1864)
    {
        _1918 = _223;
    }
    float _2188 = _1918;
    float _2190 = as_type<float>(_1322) * _2180;
    float _2192 = floor(_2112);
    float _2194 = _2188;
    if (_1944)
    {
        bool _2196 = _2150 > 0.5;
        _2144 = _2196;
    }
    bool _2198 = _2144;
    bool _2200 = !_1728;
    int _2202 = _2200 ? _2184 : (-1);
    if (_1944)
    {
        float _2204 = -_213;
        float _2206 = _2198 ? _2204 : _213;
        _2186 = _2206;
    }
    float _2208 = _2186;
    if (_1864)
    {
        bool _2210 = _2094 > 0.5;
        _1984 = _2210;
    }
    bool _2212 = _1984;
    float _2214 = trunc(_2178);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    int _2220 = ~_1328;
    int _2222 = _2220 + 1;
    int _2224 = int(_2078) + int(_2176);
    int _2226 = _2202 & 3;
    bool _2228 = _2226 != 0;
    if (_1864)
    {
        float _2230 = -_223;
        float _2232 = _2212 ? _2230 : _223;
        _2194 = _2232;
    }
    float _2234 = _2194;
    float _2236 = trunc(_2190);
    float _2238 = precise::max(_2236, 0.0);
    uint _2240 = uint(_2238);
    bool _2242 = uint(_2226) > 1u;
    int _2244 = _2222 * _2224;
    int _2246 = _2244 + _1930;
    int _2248 = _2202 & 3;
    bool _2250 = _2248 != 0;
    float _2252 = -_2192;
    float _2254 = _2112 + _2252;
    float _2256 = _1542 * _1552;
    float _2258 = float(_1328);
    int _2260 = _2250 ? 0 : 1;
    float _2262 = floor(_2256);
    bool _2264 = uint(_2246) >= uint(_1328);
    float _2266 = _2254 * _2258;
    int _2268 = int(_2106) + int(_2218);
    float _2270 = _2258 * _1586;
    float _2272 = float(_1930);
    int _2274 = int(_2126) + int(_2240);
    float _2276 = trunc(_2266);
    int _2278 = int(_2276);
    int _2280 = ~_1257;
    int _2282 = _2280 + 1;
    int _2284 = ~_1452;
    int _2286 = _2284 + 1;
    bool _2288 = _1548 > 0.5;
    bool _2290 = _2272 >= _2258;
    bool _2292 = isnan(_2272);
    bool _2294 = _2290 || _2292;
    bool _2296 = isnan(_2258);
    bool _2298 = _2294 || _2296;
    float _2300 = float(_2298);
    float _2302 = -_2262;
    float _2304 = _2256 + _2302;
    float _2306 = trunc(_2270);
    int _2308 = int(_2306);
    int _2310 = ~_2260;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    int _2316 = _2286 * _2268;
    int _2318 = _2316 + _2014;
    int _2320 = _2314;
    if (!_2242)
    {
        int _2322 = ~_2260;
        int _2324 = _2322 + 1;
        _2320 = _2324;
    }
    int _2326 = _2320;
    int _2328 = _2282 * _2274;
    int _2330 = _2328 + _2062;
    float _2332 = -_223;
    int _2334 = _1964 ? as_type<int>(_2332) : as_type<int>(_223);
    float _2336 = trunc(_2300);
    int _2338 = int(_2336);
    float _2340 = -_213;
    int _2342 = _2288 ? as_type<int>(_2340) : as_type<int>(_213);
    int _2344 = int(_2264);
    int _2346 = _2242 ? 2 : 0;
    int _2348 = _2344 | _2346;
    int _2350 = _2228 ? 4 : 0;
    int _2352 = _2348 | _2350;
    int _2354 = _1836 ? 8 : 0;
    int _2356 = _2352 | _2354;
    int _2358 = _1964 ? 16 : 0;
    int _2360 = _2356 | _2358;
    int _2362 = _2288 ? 32 : 0;
    int _2364 = _2360 | _2362;
    int _2366 = _1710 ? 64 : 0;
    int _2368 = _2364 | _2366;
    int _2370 = _2368 & 4;
    int _2372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2374 = _2372 != 0;
    int _2376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2378 = _2376 != 0;
    int _2380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2382 = _2380 != 0;
    int _2384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2386 = _2384 != 0;
    int _2388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2390 = _2388 != 0;
    bool _2392 = !_2386;
    int _2394 = _2392 ? 0 : 1;
    bool _2396 = !_2390;
    int _2398 = _2396 ? 0 : 1;
    bool _2400 = !_2264;
    int _2402 = _2400 ? 0 : (-1);
    int _2404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2406 = _2404 != 0;
    bool _2408 = uint(_2318) >= uint(_1452);
    float _2410 = as_type<float>(_1239) * _2036;
    bool _2412 = uint(_2330) >= uint(_1257);
    bool _2414 = uint(_2226) >= 2u;
    bool _2416 = !_2406;
    int _2418 = _2416 ? 0 : 1;
    float _2420 = trunc(_2410);
    float _2422 = precise::max(_2420, 0.0);
    uint _2424 = uint(_2422);
    bool _2426 = !_2408;
    int _2428 = _2426 ? 0 : (-1);
    bool _2430 = !_2412;
    int _2432 = _2430 ? 0 : (-1);
    int _2434 = _2414 ? 0 : 1;
    int _2436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2438 = _2436 != 0;
    int _2440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2442 = _2440 != 0;
    int _2444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2446 = _2444 != 0;
    int _2448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2450 = _2448 != 0;
    int _2452 = ~_2224;
    int _2454 = _2452 + _2402;
    int _2456 = _2454 + 1;
    int _2458 = ~_2338;
    int _2460 = _2458 + 1;
    int _2462 = _2460 + 1;
    bool _2464 = !_2442;
    int _2466 = _2464 ? 0 : 1;
    int _2468 = _1328 * _2456;
    int _2470 = _2468 + _1930;
    bool _2472 = _1328 == 0;
    int _2474 = abs(_2394);
    bool _2476 = !_2472;
    int _2478 = _2476 ? _2470 : (-1);
    bool _2480 = !_2378;
    int _2482 = _2480 ? 0 : 1;
    int _2484 = _2278 * _2474;
    int _2486 = _2484 + _1930;
    bool _2488 = _2100 >= _2088;
    bool _2490 = isnan(_2100);
    bool _2492 = _2488 || _2490;
    bool _2494 = isnan(_2088);
    bool _2496 = _2492 || _2494;
    float _2498 = float(_2496);
    int _2500 = _2478 * _2462;
    int _2502 = _1328 + (-1);
    float _2504 = _2088 * _1586;
    float _2506 = _2304 * _2088;
    bool _2508 = !_2374;
    int _2510 = _2508 ? 0 : 1;
    float _2512 = trunc(_2498);
    int _2514 = int(_2512);
    int _2516 = ~_1169;
    int _2518 = _2516 + 1;
    int _2520 = _2338 * _2502;
    int _2522 = _2520 + _2500;
    int _2524 = abs(_2482);
    bool _2526 = !_2382;
    int _2528 = _2526 ? 0 : 1;
    float _2530 = trunc(_2504);
    int _2532 = int(_2530);
    int _2534 = abs(_2510);
    int _2536 = _2518 * int(_2424);
    int _2538 = _2536 + _1820;
    int _2540 = abs(_2528);
    int _2542 = _2522 * _2524;
    float _2544 = float(uint(_2018));
    float _2546 = trunc(_2506);
    int _2548 = int(_2546);
    int _2550 = _2308 * _2534;
    int _2552 = _2550 + _2542;
    float _2554 = float(uint(_2538));
    float _2556 = as_type<float>(_1322) * _2544;
    int _2558 = ~_2268;
    int _2560 = _2558 + _2428;
    int _2562 = _2560 + 1;
    int _2564 = _2486 * _2540;
    int _2566 = _2564 + _2552;
    int _2568 = abs(_2398);
    float _2570 = as_type<float>(_1239) * _2554;
    bool _2572 = !_2438;
    int _2574 = _2572 ? 0 : 1;
    int _2576 = _1452 * _2562;
    int _2578 = _2576 + _2014;
    float _2580 = trunc(_2556);
    float _2582 = precise::max(_2580, 0.0);
    uint _2584 = uint(_2582);
    bool _2586 = _1452 == 0;
    int _2588 = abs(_2418);
    int _2590 = ~_2514;
    int _2592 = _2590 + 1;
    int _2594 = _2592 + 1;
    float _2596 = trunc(_2570);
    float _2598 = precise::max(_2596, 0.0);
    uint _2600 = uint(_2598);
    bool _2602 = !_2586;
    int _2604 = _2602 ? _2578 : (-1);
    int _2606 = _2278 * _2568;
    int _2608 = _2606 + _2566;
    float _2610 = float(uint(_2486));
    int _2612 = ~_1257;
    int _2614 = _2612 + 1;
    int _2616 = _2604 * _2594;
    int _2618 = _1452 + (-1);
    float _2620 = as_type<float>(_2024) * _2610;
    float _2622 = float(uint(_2608));
    int _2624 = _2514 * _2618;
    int _2626 = _2624 + _2616;
    int _2628 = abs(_2466);
    int _2630 = _2614 * int(_2584);
    int _2632 = _2630 + _2018;
    float _2634 = trunc(_2620);
    float _2636 = precise::max(_2634, 0.0);
    uint _2638 = uint(_2636);
    float _2640 = as_type<float>(_2024) * _2622;
    int _2642 = int(_2424) + int(_2600);
    int _2644 = _2626 * _2628;
    float _2646 = float(uint(_2632));
    int _2648 = abs(_2574);
    float _2650 = trunc(_2640);
    float _2652 = precise::max(_2650, 0.0);
    uint _2654 = uint(_2652);
    float _2656 = as_type<float>(_1322) * _2646;
    bool _2658 = !_2446;
    int _2660 = _2658 ? 0 : 1;
    int _2662 = ~_1169;
    int _2664 = _2662 + 1;
    int _2666 = _2532 * _2648;
    int _2668 = _2666 + _2644;
    bool _2670 = _2226 != 3;
    float _2672 = trunc(_2656);
    float _2674 = precise::max(_2672, 0.0);
    uint _2676 = uint(_2674);
    int _2678 = ~_1328;
    int _2680 = _2678 + 1;
    int _2682 = ~_1328;
    int _2684 = _2682 + 1;
    int _2686 = _2680 * int(_2638);
    int _2688 = _2686 + _2486;
    int _2690 = ~_2274;
    int _2692 = _2690 + _2432;
    int _2694 = _2692 + 1;
    int _2696 = _2684 * int(_2654);
    int _2698 = _2696 + _2608;
    int _2700 = abs(_2660);
    int _2702 = _2664 * _2642;
    int _2704 = _2702 + _1820;
    float _2706 = float(uint(_2688));
    int _2708 = _1257 * _2694;
    int _2710 = _2708 + _2062;
    int _2712 = ~_2434;
    int _2714 = _2712 + 1;
    int _2716 = _2714 + 1;
    int _2718 = _2716;
    if (_2670)
    {
        int _2720 = ~_2434;
        int _2722 = _2720 + 1;
        _2718 = _2722;
    }
    int _2724 = _2718;
    float _2726 = as_type<float>(_2024) * _2706;
    float _2728 = float(uint(_2698));
    bool _2730 = uint(_2704) >= uint(_1169);
    float _2732 = as_type<float>(_2024) * _2728;
    bool _2734 = !_2450;
    int _2736 = _2734 ? 0 : 1;
    float _2738 = trunc(_2726);
    float _2740 = precise::max(_2738, 0.0);
    uint _2742 = uint(_2740);
    bool _2744 = _1257 == 0;
    int _2746 = _2548 * _2588;
    int _2748 = _2746 + _2014;
    int _2750 = abs(_2736);
    int _2752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2754 = _2752 != 0;
    int _2756 = _2748 * _2700;
    int _2758 = _2756 + _2668;
    bool _2760 = !_2744;
    int _2762 = _2760 ? _2710 : (-1);
    float _2764 = trunc(_2732);
    float _2766 = precise::max(_2764, 0.0);
    uint _2768 = uint(_2766);
    bool _2770 = !_2754;
    int _2772 = _2770 ? 0 : 1;
    bool _2774 = !_2730;
    int _2776 = _2774 ? 0 : (-1);
    int _2778 = _2548 * _2750;
    int _2780 = _2778 + _2758;
    int _2782 = _2762 & 3;
    bool _2784 = _2782 != 0;
    int _2786 = _2762 & 3;
    bool _2788 = _2786 != 0;
    int _2790 = _2784 ? 0 : 1;
    bool _2792 = uint(_2786) > 1u;
    float _2794 = float(uint(_2780));
    int _2796 = ~_2642;
    int _2798 = _2796 + _2776;
    int _2800 = _2798 + 1;
    int _2802 = int(_2638) + int(_2742);
    float _2804 = as_type<float>(_2052) * _2794;
    int _2806 = ~_1328;
    int _2808 = _2806 + 1;
    int _2810 = _1169 * _2800;
    int _2812 = _2810 + _1820;
    int _2814 = ~_2790;
    int _2816 = _2814 + 1;
    int _2818 = _2816 + 1;
    int _2820 = int(_2584) + int(_2676);
    int _2822 = ~_1257;
    int _2824 = _2822 + 1;
    int _2826 = _2818;
    if (!_2792)
    {
        int _2828 = ~_2790;
        int _2830 = _2828 + 1;
        _2826 = _2830;
    }
    int _2832 = _2826;
    int _2834 = ~_1328;
    int _2836 = _2834 + 1;
    int _2838 = int(_2654) + int(_2768);
    float _2840 = trunc(_2804);
    float _2842 = precise::max(_2840, 0.0);
    uint _2844 = uint(_2842);
    bool _2846 = _1169 == 0;
    int _2848 = _2824 * _2820;
    int _2850 = _2848 + _2018;
    int _2852 = _2808 * _2838;
    int _2854 = _2852 + _2608;
    bool _2856 = uint(_2786) >= 2u;
    int _2858 = ~_1452;
    int _2860 = _2858 + 1;
    int _2862 = _2836 * _2802;
    int _2864 = _2862 + _2486;
    int _2866 = _2856 ? 0 : 1;
    bool _2868 = uint(_2854) >= uint(_1328);
    bool _2870 = !_2846;
    int _2872 = _2870 ? _2812 : (-1);
    bool _2874 = uint(_2850) >= uint(_1257);
    bool _2876 = !_2868;
    int _2878 = _2876 ? 0 : (-1);
    int _2880 = _2860 * int(_2844);
    int _2882 = _2880 + _2780;
    bool _2884 = !_2874;
    int _2886 = _2884 ? 0 : (-1);
    bool _2888 = _2786 != 3;
    int _2890 = ~_2838;
    int _2892 = _2890 + _2878;
    int _2894 = _2892 + 1;
    int _2896 = ~_2820;
    int _2898 = _2896 + _2886;
    int _2900 = _2898 + 1;
    bool _2902 = uint(_2864) >= uint(_1328);
    int _2904 = _1328 * _2894;
    int _2906 = _2904 + _2608;
    float _2908 = float(uint(_2882));
    int _2910 = _1257 * _2900;
    int _2912 = _2910 + _2018;
    bool _2914 = !_2902;
    int _2916 = _2914 ? 0 : (-1);
    bool _2918 = _1257 == 0;
    float _2920 = as_type<float>(_2052) * _2908;
    bool _2922 = !_2472;
    int _2924 = _2922 ? _2906 : (-1);
    int _2926 = ~_2866;
    int _2928 = _2926 + 1;
    int _2930 = _2928 + 1;
    float _2932 = trunc(_2920);
    float _2934 = precise::max(_2932, 0.0);
    uint _2936 = uint(_2934);
    bool _2938 = _2370 != 0;
    int _2940 = _2930;
    if (_2888)
    {
        int _2942 = ~_2866;
        int _2944 = _2942 + 1;
        _2940 = _2944;
    }
    int _2946 = _2940;
    bool _2948 = !_2918;
    int _2950 = _2948 ? _2912 : (-1);
    int _2952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2954 = _2952 != 0;
    int _2956 = _2924 & 3;
    bool _2958 = _2956 != 0;
    int _2960 = ~_2802;
    int _2962 = _2960 + _2916;
    int _2964 = _2962 + 1;
    bool _2966 = !_2938;
    int _2968 = _2966 ? 0 : 1;
    bool _2970 = !_2954;
    int _2972 = _2970 ? 0 : 1;
    int _2974 = _1328 * _2964;
    int _2976 = _2974 + _2486;
    bool _2978 = uint(_2956) > 1u;
    int _2980 = _2924 & 3;
    bool _2982 = _2980 != 0;
    int _2984 = _2982 ? 0 : 1;
    bool _2986 = _2956 != 3;
    float _2988 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2990 = _2988 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2992 = !_2788;
    int _2994 = _2992 ? 0 : 1;
    bool _2996 = uint(_2956) >= 2u;
    float _2998 = 1.0 / _2990;
    int _3000 = int(_2844) + int(_2936);
    int _3002 = ~_2984;
    int _3004 = _3002 + 1;
    int _3006 = _3004 + 1;
    int _3008 = _3006;
    if (!_2978)
    {
        int _3010 = ~_2984;
        int _3012 = _3010 + 1;
        _3008 = _3012;
    }
    int _3014 = _3008;
    int _3016 = _2996 ? 0 : 1;
    int _3018 = ~_3016;
    int _3020 = _3018 + 1;
    int _3022 = _3020 + 1;
    int _3024 = _3022;
    if (_2986)
    {
        int _3026 = ~_3016;
        int _3028 = _3026 + 1;
        _3024 = _3028;
    }
    int _3030 = _3024;
    float _3032 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3034 = _3032 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3036 = in.m_60.x;
    float _3038 = in.m_60.y;
    float _3040 = in.m_60.z;
    bool _3042 = _2786 != 3;
    int _3044 = ~_1452;
    int _3046 = _3044 + 1;
    float _3048 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3050 = _3048 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3052 = 1.0 / _3034;
    bool _3054 = _2226 != 3;
    int _3056 = _3046 * _3000;
    int _3058 = _3056 + _2780;
    float _3060 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3062 = _3060 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3064 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3066 = _3064 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3068 = 1.0 / _3050;
    int _3070 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3072 = _3070 != 0;
    float _3074 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3076 = _3074 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3078 = !_2958;
    int _3080 = _3078 ? 0 : 1;
    bool _3082 = !_3054;
    int _3084 = _3082 ? 0 : (-1);
    float _3086 = _3038 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _3088 = !_3042;
    int _3090 = _3088 ? 0 : (-1);
    float _3092 = 1.0 / _3066;
    bool _3094 = !_2472;
    int _3096 = _3094 ? _2976 : (-1);
    float _3098 = _3038 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _3100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3102 = _3100 != 0;
    float _3104 = _3038 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _3106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3108 = _3106 != 0;
    float _3110 = fma(_3036, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3086);
    int _3112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3114 = _3112 != 0;
    float _3116 = fma(_3036, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3098);
    int _3118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3120 = _3118 != 0;
    float _3122 = fma(_3036, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3104);
    bool _3124 = uint(_3058) >= uint(_1452);
    float _3126 = 1.0 / _3062;
    bool _3128 = !_3124;
    int _3130 = _3128 ? 0 : (-1);
    int _3132 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3134 = _3132 != 0;
    float _3136 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3138 = _3136 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3140 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3142 = _3140 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3144 = 1.0 / _3076;
    float _3146 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3148 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3146;
    float _3150 = _3138 * _3052;
    float _3152 = fma(_3040, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3116);
    int _3154 = ~_1452;
    int _3156 = _3154 + 1;
    float _3158 = _3148 * _2998;
    float _3160 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3162 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3160;
    float _3164 = 1.0 / _3142;
    float _3166 = fma(_3158, _1598, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3168 = _3162 * _3068;
    float _3170 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3172 = _3170 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3174 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3176 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3174;
    float _3178 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3180 = _3178 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3182 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3184 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3182;
    float _3186 = float(uint(_2748));
    float _3188 = _3172 * _3092;
    float _3190 = _3176 * _3126;
    float _3192 = _3180 * _3144;
    float _3194 = fma(_3040, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3122);
    float _3196 = as_type<float>(_2052) * _3186;
    bool _3198 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3200 = isnan(_1149);
    bool _3202 = _3198 || _3200;
    bool _3204 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3206 = _3202 || _3204;
    float _3208 = float(_3206);
    float _3210 = _3184 * _3164;
    float _3212 = fma(_3040, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3110);
    float _3214 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3216 = _1149 + _3214;
    float _3218 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3220 = _1149 + _3218;
    float _3222 = trunc(_3196);
    float _3224 = precise::max(_3222, 0.0);
    uint _3226 = uint(_3224);
    float _3228 = -_3208;
    float _3230 = _3228 + 1.0;
    float _3232 = fma(_3150, _3216, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3234 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3236 = _1149 + _3234;
    float _3238 = fma(_3168, _3220, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3240 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3242 = _1149 + _3240;
    bool _3244 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3246 = isnan(_1149);
    bool _3248 = _3244 || _3246;
    bool _3250 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3252 = _3248 || _3250;
    float _3254 = float(_3252);
    float _3256 = fma(_3188, _3236, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    bool _3258 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3260 = isnan(_1149);
    bool _3262 = _3258 || _3260;
    bool _3264 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3266 = _3262 || _3264;
    float _3268 = float(_3266);
    float _3270 = fma(_3190, _3242, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    int _3272 = ~_3000;
    int _3274 = _3272 + _3130;
    int _3276 = _3274 + 1;
    float _3278 = -_3254;
    float _3280 = _3278 + 1.0;
    int _3282 = abs(_2772);
    float _3284 = -_3268;
    float _3286 = _3284 + 1.0;
    float _3288 = _3268 * _3230;
    bool _3290 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3292 = isnan(_1149);
    bool _3294 = _3290 || _3292;
    bool _3296 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3298 = _3294 || _3296;
    float _3300 = float(_3298);
    int _3302 = _3156 * int(_3226);
    int _3304 = _3302 + _2748;
    float _3306 = _3254 * _3286;
    bool _3308 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3310 = isnan(_1149);
    bool _3312 = _3308 || _3310;
    bool _3314 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3316 = _3312 || _3314;
    float _3318 = float(_3316);
    int _3320 = _1452 * _3276;
    int _3322 = _3320 + _2780;
    float _3324 = _3300 * _3280;
    float _3326 = -_3300;
    float _3328 = _3326 + 1.0;
    bool _3330 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3332 = isnan(_1149);
    bool _3334 = _3330 || _3332;
    bool _3336 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3338 = _3334 || _3336;
    float _3340 = float(_3338);
    float _3342 = -_3318;
    float _3344 = _3342 + 1.0;
    float _3346 = float(uint(_3304));
    float _3348 = _3318 * _3328;
    float _3350 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3352 = _1149 + _3350;
    float _3354 = _3340 * _3344;
    float _3356 = -_3340;
    float _3358 = _3356 + 1.0;
    bool _3360 = !_2586;
    int _3362 = _3360 ? _3322 : (-1);
    float _3364 = as_type<float>(_2052) * _3346;
    bool _3366 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3368 = isnan(_1149);
    bool _3370 = _3366 || _3368;
    bool _3372 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3374 = _3370 || _3372;
    float _3376 = float(_3374);
    float _3378 = fma(_3192, _3352, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _3380 = !_3114;
    int _3382 = _3380 ? 0 : 1;
    float _3384 = trunc(_3364);
    float _3386 = precise::max(_3384, 0.0);
    uint _3388 = uint(_3386);
    int _3390 = _3362 & 3;
    bool _3392 = _3390 != 0;
    float _3394 = _3376 * _3358;
    bool _3396 = _1149 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3398 = isnan(_1149);
    bool _3400 = _3396 || _3398;
    bool _3402 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3404 = _3400 || _3402;
    float _3406 = float(_3404);
    float _3408 = -_3376;
    float _3410 = _3408 + 1.0;
    bool _3412 = !_3120;
    int _3414 = _3412 ? 0 : 1;
    float _3416 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3418 = _1149 + _3416;
    bool _3420 = uint(_3390) > 1u;
    float _3422 = _3406 * _3410;
    int _3424 = _2202 >> 31;
    float _3426 = fma(_3210, _3418, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _3428 = !_3392;
    int _3430 = _3428 ? 0 : 1;
    float _3432 = _1149;
    if (_3102)
    {
        float _3434 = in.m_72.x;
        _3432 = _3434;
    }
    float _3436 = _3432;
    int _3438 = _3362 & 3;
    bool _3440 = _3438 != 0;
    float _3442 = _3166 * _3422;
    int _3444 = _3424 & 3;
    float _3446 = -_3406;
    float _3448 = _3446 + 1.0;
    int _3450 = _3440 ? 0 : 1;
    float _3452 = _3152 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _3454 = _2202 + _3444;
    float _3456 = fma(_3448, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3442);
    bool _3458 = _2956 != 3;
    float _3460 = _3212 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _3462 = ~_3450;
    int _3464 = _3462 + 1;
    int _3466 = _3464 + 1;
    float _3468 = fma(_3232, _3394, _3456);
    int _3470 = _3466;
    if (!_3420)
    {
        int _3472 = ~_3450;
        int _3474 = _3472 + 1;
        _3470 = _3474;
    }
    int _3476 = _3470;
    float _3478 = _3194 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _3480 = _3454 >> 2;
    float _3482 = fma(_3238, _3354, _3468);
    bool _3484 = !_3458;
    int _3486 = _3484 ? 0 : (-1);
    bool _3488 = uint(_3390) >= 2u;
    float _3490 = fma(_3256, _3348, _3482);
    int _3492 = _3480 << 4;
    int _3494 = _3492 + 368;
    int _3496 = _3488 ? 0 : 1;
    float _3498 = _3436;
    if (_3102)
    {
        float _3500 = _3436 * 3.1415927410125732421875;
        _3498 = _3500;
    }
    float _3502 = _3498;
    bool _3504 = _3390 != 3;
    float _3506 = fma(_3270, _3324, _3490);
    bool _3508 = _3390 != 3;
    float _3510 = 0.0;
    if (_3102)
    {
        float _3512 = _3502 * 0.15915493667125701904296875;
        _3510 = _3512;
    }
    float _3514 = _3510;
    uint _3516 = uint(int(uint(_3494) >> uint(2)));
    uint _3518 = uint(int(uint(int(_3516)) >> uint(2)));
    int _3520 = int(_3516) & 3;
    float _3522 = (*spvDescriptorSet0.vp_c9)._m0[int(_3518)][_3520];
    int _3524 = int(_3516) + 1;
    uint _3526 = uint(int(uint(_3524) >> uint(2)));
    int _3528 = _3524 & 3;
    float _3530 = (*spvDescriptorSet0.vp_c9)._m0[int(_3526)][_3528];
    int _3532 = _2762 >> 31;
    int _3534 = _2924 >> 31;
    int _3536 = _3532 & 3;
    float _3538 = _3514;
    if (_3102)
    {
        float _3540 = _3514 * 6.283185482025146484375;
        float _3542 = sin(_3540);
        _3538 = _3542;
    }
    float _3544 = _3538;
    int _3546 = ~_1452;
    int _3548 = _3546 + 1;
    int _3550 = _3534 & 3;
    int _3552 = _2762 + _3536;
    int _3554 = _3362 >> 31;
    int _3556 = int(_3226) + int(_3388);
    int _3558 = _2924 + _3550;
    int _3560 = _3552 >> 2;
    int _3562 = _3548 * _3556;
    int _3564 = _3562 + _2748;
    int _3566 = _3554 & 3;
    int _3568 = _3558 >> 2;
    int _3570 = _3560 << 4;
    int _3572 = _3570 + 512;
    int _3574 = _3362 + _3566;
    bool _3576 = !_3508;
    int _3578 = _3576 ? 0 : (-1);
    uint _3580 = uint(int(uint(_3572) >> uint(2)));
    uint _3582 = uint(int(uint(int(_3580)) >> uint(2)));
    int _3584 = int(_3580) & 3;
    float _3586 = (*spvDescriptorSet0.vp_c9)._m0[int(_3582)][_3584];
    int _3588 = int(_3580) + 1;
    uint _3590 = uint(int(uint(_3588) >> uint(2)));
    int _3592 = _3588 & 3;
    float _3594 = (*spvDescriptorSet0.vp_c9)._m0[int(_3590)][_3592];
    int _3596 = _3568 << 4;
    int _3598 = _3596 + 656;
    bool _3600 = uint(_3564) >= uint(_1452);
    int _3602 = _3574 >> 2;
    bool _3604 = !_3600;
    int _3606 = _3604 ? 0 : (-1);
    uint _3608 = uint(int(uint(_3598) >> uint(2)));
    uint _3610 = uint(int(uint(int(_3608)) >> uint(2)));
    int _3612 = int(_3608) & 3;
    float _3614 = (*spvDescriptorSet0.vp_c9)._m0[int(_3610)][_3612];
    int _3616 = int(_3608) + 1;
    uint _3618 = uint(int(uint(_3616) >> uint(2)));
    int _3620 = _3616 & 3;
    float _3622 = (*spvDescriptorSet0.vp_c9)._m0[int(_3618)][_3620];
    int _3624 = _3602 << 4;
    int _3626 = _3624 + 800;
    int _3628 = ~_3556;
    int _3630 = _3628 + _3606;
    int _3632 = _3630 + 1;
    float _3634 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3636 = _3600;
    if (_3102)
    {
        bool _3638 = _3544 > 0.5;
        _3636 = _3638;
    }
    bool _3640 = _3636;
    uint _3642 = uint(int(uint(_3626) >> uint(2)));
    uint _3644 = uint(int(uint(int(_3642)) >> uint(2)));
    int _3646 = int(_3642) & 3;
    float _3648 = (*spvDescriptorSet0.vp_c9)._m0[int(_3644)][_3646];
    int _3650 = int(_3642) + 1;
    uint _3652 = uint(int(uint(_3650) >> uint(2)));
    int _3654 = _3650 & 3;
    float _3656 = (*spvDescriptorSet0.vp_c9)._m0[int(_3652)][_3654];
    int _3658 = ~_3496;
    int _3660 = _3658 + 1;
    int _3662 = _3660 + 1;
    int _3664 = _1452 * _3632;
    int _3666 = _3664 + _2748;
    int _3668 = abs(_2326);
    float _3670 = -_3634;
    float _3672 = fma(_1616, 2.0, _3670);
    int _3674 = _3662;
    if (_3504)
    {
        int _3676 = ~_3496;
        int _3678 = _3676 + 1;
        _3674 = _3678;
    }
    int _3680 = _3674;
    float _3682 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3684 = int(_3682);
    bool _3686 = _1558 != 1;
    int _3688 = _3494 + 8;
    uint _3690 = uint(int(uint(_3688) >> uint(2)));
    uint _3692 = uint(int(uint(int(_3690)) >> uint(2)));
    int _3694 = int(_3690) & 3;
    float _3696 = (*spvDescriptorSet0.vp_c9)._m0[int(_3692)][_3694];
    int _3698 = int(_3690) + 1;
    uint _3700 = uint(int(uint(_3698) >> uint(2)));
    int _3702 = _3698 & 3;
    float _3704 = (*spvDescriptorSet0.vp_c9)._m0[int(_3700)][_3702];
    int _3706 = abs(_2968);
    float _3708 = -_165;
    float _3710 = fma(_3708, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3672);
    int _3712 = abs(_2832);
    int _3714 = ~_3668;
    int _3716 = _3714 + 1;
    int _3718 = _3716 + 1;
    int _3720 = _3572 + 8;
    uint _3722 = uint(int(uint(_3720) >> uint(2)));
    uint _3724 = uint(int(uint(int(_3722)) >> uint(2)));
    int _3726 = int(_3722) & 3;
    float _3728 = (*spvDescriptorSet0.vp_c9)._m0[int(_3724)][_3726];
    int _3730 = int(_3722) + 1;
    uint _3732 = uint(int(uint(_3730) >> uint(2)));
    int _3734 = _3730 & 3;
    float _3736 = (*spvDescriptorSet0.vp_c9)._m0[int(_3732)][_3734];
    int _3738 = abs(_2994);
    int _3740 = _3718 * as_type<int>(_3530);
    int _3742 = abs(_3014);
    float _3744 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _3746 = !_2586;
    int _3748 = _3746 ? _3666 : (-1);
    float _3750 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3752 = int(_3750);
    bool _3754 = _1560 != 2;
    int _3756 = _3598 + 8;
    uint _3758 = uint(int(uint(_3756) >> uint(2)));
    uint _3760 = uint(int(uint(int(_3758)) >> uint(2)));
    int _3762 = int(_3758) & 3;
    float _3764 = (*spvDescriptorSet0.vp_c9)._m0[int(_3760)][_3762];
    int _3766 = int(_3758) + 1;
    uint _3768 = uint(int(uint(_3766) >> uint(2)));
    int _3770 = _3766 & 3;
    float _3772 = (*spvDescriptorSet0.vp_c9)._m0[int(_3768)][_3770];
    float _3774 = fma(_1630, -2.0, _3744);
    int _3776 = abs(_3476);
    int _3778 = ~_3706;
    int _3780 = _3778 + 1;
    int _3782 = _3780 + 1;
    float _3784 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3774);
    int _3786 = ~_3712;
    int _3788 = _3786 + 1;
    int _3790 = _3788 + 1;
    int _3792 = _3626 + 8;
    uint _3794 = uint(int(uint(_3792) >> uint(2)));
    uint _3796 = uint(int(uint(int(_3794)) >> uint(2)));
    int _3798 = int(_3794) & 3;
    float _3800 = (*spvDescriptorSet0.vp_c9)._m0[int(_3796)][_3798];
    int _3802 = int(_3794) + 1;
    uint _3804 = uint(int(uint(_3802) >> uint(2)));
    int _3806 = _3802 & 3;
    float _3808 = (*spvDescriptorSet0.vp_c9)._m0[int(_3804)][_3806];
    int _3810 = _3782 * as_type<int>(_3522);
    int _3812 = _3810 + _3740;
    int _3814 = ~_3742;
    int _3816 = _3814 + 1;
    int _3818 = _3816 + 1;
    int _3820 = _3790 * as_type<int>(_3594);
    int _3822 = abs(_3080);
    int _3824 = ~_3738;
    int _3826 = _3824 + 1;
    int _3828 = _3826 + 1;
    int _3830 = ~_3822;
    int _3832 = _3830 + 1;
    int _3834 = _3832 + 1;
    int _3836 = _3818 * as_type<int>(_3622);
    int _3838 = ~_3776;
    int _3840 = _3838 + 1;
    int _3842 = _3840 + 1;
    int _3844 = _3828 * as_type<int>(_3586);
    int _3846 = _3844 + _3820;
    int _3848 = abs(_2724);
    int _3850 = _3834 * as_type<int>(_3614);
    int _3852 = _3850 + _3836;
    int _3854 = abs(_2946);
    float _3856 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3858 = int(_3856);
    int _3860 = abs(_3030);
    int _3862 = _3842 * as_type<int>(_3656);
    int _3864 = abs(_3430);
    int _3866 = ~_3848;
    int _3868 = _3866 + 1;
    int _3870 = _3868 + 1;
    int _3872 = abs(_3084);
    float _3874 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3876 = int(_3874);
    int _3878 = ~_3854;
    int _3880 = _3878 + 1;
    int _3882 = _3880 + 1;
    int _3884 = _3870 * as_type<int>(_3696);
    int _3886 = _3884 + _3812;
    int _3888 = ~_3860;
    int _3890 = _3888 + 1;
    int _3892 = _3890 + 1;
    int _3894 = ~_3872;
    int _3896 = _3894 + 1;
    int _3898 = _3896 + 1;
    int _3900 = _3882 * as_type<int>(_3728);
    int _3902 = _3900 + _3846;
    int _3904 = ~_3864;
    int _3906 = _3904 + 1;
    int _3908 = _3906 + 1;
    int _3910 = abs(_3090);
    int _3912 = abs(_3680);
    int _3914 = _3908 * as_type<int>(_3648);
    int _3916 = _3914 + _3862;
    int _3918 = ~_3910;
    int _3920 = _3918 + 1;
    int _3922 = _3920 + 1;
    int _3924 = _3892 * as_type<int>(_3764);
    int _3926 = _3924 + _3852;
    int _3928 = ~_3912;
    int _3930 = _3928 + 1;
    int _3932 = _3930 + 1;
    int _3934 = _3898 * as_type<int>(_3704);
    int _3936 = _3934 + _3886;
    int _3938 = abs(_3486);
    int _3940 = _3922 * as_type<int>(_3736);
    int _3942 = _3940 + _3902;
    int _3944 = abs(_3578);
    float _3946 = float(uint(_3684));
    int _3948 = _3932 * as_type<int>(_3800);
    int _3950 = _3948 + _3916;
    int _3952 = ~_3938;
    int _3954 = _3952 + 1;
    int _3956 = _3954 + 1;
    float _3958 = float(uint(_3752));
    float _3960 = 1.0 / _3946;
    int _3962 = ~_3944;
    int _3964 = _3962 + 1;
    int _3966 = _3964 + 1;
    int _3968 = _3956 * as_type<int>(_3772);
    int _3970 = _3968 + _3926;
    int _3972 = ~_3282;
    int _3974 = _3972 + 1;
    int _3976 = _3974 + 1;
    int _3978 = abs(_3876);
    int _3980 = _3966 * as_type<int>(_3808);
    int _3982 = _3980 + _3950;
    float _3984 = float(uint(_3876));
    float _3986 = 1.0 / _3958;
    int _3988 = _3936 * _3976;
    int _3990 = abs(_3752);
    int _3992 = _2872 * _3282;
    int _3994 = _3992 + _3988;
    int _3996 = abs(_3382);
    float _3998 = float(uint(_3990));
    float _4000 = 1.0 / _3984;
    int _4002 = abs(_2972);
    int _4004 = ~_3996;
    int _4006 = _4004 + 1;
    int _4008 = _4006 + 1;
    int _4010 = ~_4002;
    int _4012 = _4010 + 1;
    int _4014 = _4012 + 1;
    int _4016 = abs(_3684);
    int _4018 = _3970 * _4008;
    float _4020 = float(uint(_3858));
    int _4022 = _3942 * _4014;
    float _4024 = float(uint(_4016));
    float _4026 = 1.0 / _3998;
    float _4028 = float(uint(_3978));
    int _4030 = _2950 * _4002;
    int _4032 = _4030 + _4022;
    int _4034 = abs(_3414);
    int _4036 = _3096 * _3996;
    int _4038 = _4036 + _4018;
    int _4040 = as_type<int>(_3960) + (-2);
    int _4042 = ~_4034;
    int _4044 = _4042 + 1;
    int _4046 = _4044 + 1;
    float _4048 = 1.0 / _4020;
    float _4050 = float(uint(_3994));
    int _4052 = as_type<int>(_3986) + (-2);
    int _4054 = _3982 * _4046;
    float _4056 = float(uint(_4032));
    float _4058 = as_type<float>(_4040) * _4050;
    float _4060 = 1.0 / _4024;
    int _4062 = as_type<int>(_4000) + (-2);
    float _4064 = as_type<float>(_4052) * _4056;
    float _4066 = float(uint(_4038));
    float _4068 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _4070 = _1562 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _4072 = _3748 * _4034;
    int _4074 = _4072 + _4054;
    int _4076 = as_type<int>(_4026) + (-2);
    float _4078 = 1.0 / _4028;
    int _4080 = abs(_3858);
    float _4082 = as_type<float>(_4062) * _4066;
    float _4084 = -_4068;
    float _4086 = fma(_4070, 2.0, _4084);
    int _4088 = abs(_4038);
    float _4090 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _4092 = float(uint(_4080));
    float _4094 = -_165;
    float _4096 = fma(_4094, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4086);
    float _4098 = trunc(_4058);
    float _4100 = precise::max(_4098, 0.0);
    uint _4102 = uint(_4100);
    int _4104 = as_type<int>(_4048) + (-2);
    float _4106 = float(uint(_4074));
    float _4108 = 1.0 / _4092;
    int _4110 = as_type<int>(_4078) + (-2);
    float _4112 = as_type<float>(_4104) * _4106;
    int _4114 = ~_3752;
    int _4116 = _4114 + 1;
    float _4118 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _4120 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _4122 = ~_3684;
    int _4124 = _4122 + 1;
    float _4126 = trunc(_4064);
    float _4128 = precise::max(_4126, 0.0);
    uint _4130 = uint(_4128);
    int _4132 = abs(_4074);
    float _4134 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[93].z, _4118);
    int _4136 = abs(_3994);
    int _4138 = _4124 * int(_4102);
    int _4140 = _4138 + _3994;
    float _4142 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[93].w, _4120);
    int _4144 = as_type<int>(_4060) + (-2);
    float _4146 = trunc(_4082);
    float _4148 = precise::max(_4146, 0.0);
    uint _4150 = uint(_4148);
    int _4152 = as_type<int>(_4108) + (-2);
    float _4154 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4156 = float(uint(_4136));
    float _4158 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[92].z, _4134);
    int _4160 = abs(_4032);
    float _4162 = fma(_4090, -2.0, _4154);
    bool _4164 = !_3686;
    float _4166 = _4164 ? _1564 : _1562;
    float _4168 = trunc(_4112);
    float _4170 = precise::max(_4168, 0.0);
    uint _4172 = uint(_4170);
    float _4174 = float(uint(_4088));
    float _4176 = as_type<float>(_4144) * _4156;
    float _4178 = float(uint(_4160));
    float _4180 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4142);
    int _4182 = ~_3876;
    int _4184 = _4182 + 1;
    float _4186 = as_type<float>(_4110) * _4174;
    float _4188 = trunc(_4176);
    float _4190 = precise::max(_4188, 0.0);
    uint _4192 = uint(_4190);
    float _4194 = float(uint(_4132));
    float _4196 = as_type<float>(_4076) * _4178;
    int _4198 = _4184 * int(_4150);
    int _4200 = _4198 + _4038;
    int _4202 = ~_4016;
    int _4204 = _4202 + 1;
    int _4206 = _4116 * int(_4130);
    int _4208 = _4206 + _4032;
    float _4210 = as_type<float>(_4152) * _4194;
    float _4212 = float(uint(_4140));
    float _4214 = trunc(_4196);
    float _4216 = precise::max(_4214, 0.0);
    uint _4218 = uint(_4216);
    bool _4220 = !_3686;
    float _4222 = _4220 ? as_type<float>(_1566) : _1564;
    float _4224 = float(uint(_4208));
    float _4226 = as_type<float>(_4040) * _4212;
    float _4228 = _1544 + _1546;
    float _4230 = as_type<float>(_4052) * _4224;
    int _4232 = ~_3858;
    int _4234 = _4232 + 1;
    float _4236 = trunc(_4226);
    float _4238 = precise::max(_4236, 0.0);
    uint _4240 = uint(_4238);
    float _4242 = _4228 + (-1.0);
    float _4244 = float(uint(_4200));
    int _4246 = _4234 * int(_4172);
    int _4248 = _4246 + _4074;
    float _4250 = fma(_4242, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _4252 = ~_3990;
    int _4254 = _4252 + 1;
    float _4256 = as_type<float>(_4062) * _4244;
    float _4258 = trunc(_4230);
    float _4260 = precise::max(_4258, 0.0);
    uint _4262 = uint(_4260);
    int _4264 = ~_3978;
    int _4266 = _4264 + 1;
    int _4268 = _4204 * int(_4192);
    int _4270 = _4268 + _4136;
    float _4272 = float(uint(_4248));
    float _4274 = trunc(_4186);
    float _4276 = precise::max(_4274, 0.0);
    uint _4278 = uint(_4276);
    float _4280 = as_type<float>(_4104) * _4272;
    int _4282 = int(_4102) + int(_4240);
    int _4284 = _4254 * int(_4218);
    int _4286 = _4284 + _4160;
    float _4288 = float(uint(_4270));
    int _4290 = ~_4080;
    int _4292 = _4290 + 1;
    float _4294 = trunc(_4210);
    float _4296 = precise::max(_4294, 0.0);
    uint _4298 = uint(_4296);
    int _4300 = int(_4130) + int(_4262);
    float _4302 = as_type<float>(_4144) * _4288;
    float _4304 = float(uint(_4286));
    bool _4306 = !_3108;
    float _4308 = _4306 ? _213 : as_type<float>(_2342);
    bool _4310 = _1544 > 0.5;
    float _4312 = trunc(_4256);
    float _4314 = precise::max(_4312, 0.0);
    uint _4316 = uint(_4314);
    int _4318 = _4266 * int(_4278);
    int _4320 = _4318 + _4088;
    float _4322 = as_type<float>(_4076) * _4304;
    int _4324 = ~_3684;
    int _4326 = _4324 + 1;
    float _4328 = float(uint(_4320));
    int _4330 = _4292 * int(_4298);
    int _4332 = _4330 + _4132;
    float _4334 = trunc(_4280);
    float _4336 = precise::max(_4334, 0.0);
    uint _4338 = uint(_4336);
    float _4340 = -_213;
    int _4342 = _4310 ? as_type<int>(_4340) : as_type<int>(_213);
    float _4344 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4346 = as_type<float>(_4110) * _4328;
    float _4348 = float(uint(_4332));
    float _4350 = fma(_4166, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4344);
    int _4352 = int(_4150) + int(_4316);
    float _4354 = trunc(_4302);
    float _4356 = precise::max(_4354, 0.0);
    uint _4358 = uint(_4356);
    float _4360 = as_type<float>(_4152) * _4348;
    int _4362 = ~_3752;
    int _4364 = _4362 + 1;
    float _4366 = _4166 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _4368 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4350);
    int _4370 = _4326 * _4282;
    int _4372 = _4370 + _3994;
    float _4374 = as_type<float>(_4326);
    float _4376 = as_type<float>(_4372);
    float _4378 = as_type<float>(_4172);
    float _4380 = as_type<float>(_4192);
    float _4382 = _4302;
    if (_3754)
    {
        _4374 = _1544;
    }
    float _4384 = _4374;
    float _4386 = trunc(_4360);
    float _4388 = precise::max(_4386, 0.0);
    uint _4390 = uint(_4388);
    int _4392 = _4364 * _4300;
    int _4394 = _4392 + _4032;
    int _4396 = int(_4172) + int(_4338);
    float _4398 = -_4368;
    float _4400 = _4398 + 1.0;
    bool _4402 = !_3134;
    float _4404 = _4402 ? _213 : as_type<float>(_4342);
    bool _4406 = uint(_4394) >= uint(_3752);
    float _4408 = trunc(_4346);
    float _4410 = precise::max(_4408, 0.0);
    uint _4412 = uint(_4410);
    int _4414 = int(_4192) + int(_4358);
    int _4416 = ~_3858;
    int _4418 = _4416 + 1;
    int _4420 = ~_4016;
    int _4422 = _4420 + 1;
    bool _4424 = uint(_4372) >= uint(_3684);
    float _4426 = trunc(_4322);
    float _4428 = precise::max(_4426, 0.0);
    uint _4430 = uint(_4428);
    int _4432 = int(_4298) + int(_4390);
    int _4434 = _4418 * _4396;
    int _4436 = _4434 + _4074;
    float _4438 = as_type<float>(_4358);
    float _4440 = _4384;
    if (!_3686)
    {
        _4376 = _1548;
    }
    float _4442 = _4376;
    int _4444 = _4422 * _4414;
    int _4446 = _4444 + _4136;
    float _4448 = _4442;
    if (!_3686)
    {
        _4378 = _1548;
    }
    float _4450 = _4378;
    float _4452 = _4450;
    if (!_3686)
    {
        _4380 = _1546;
    }
    float _4454 = _4380;
    int _4456 = ~_3876;
    int _4458 = _4456 + 1;
    float _4460 = _4454;
    if (!_3686)
    {
        _4382 = _1546;
    }
    float _4462 = _4382;
    int _4464 = int(_4278) + int(_4412);
    int _4466 = _4458 * _4352;
    int _4468 = _4466 + _4038;
    int _4470 = ~_3978;
    int _4472 = _4470 + 1;
    float _4474 = _4462;
    if (_3686)
    {
        _4448 = _1546;
    }
    float _4476 = _4448;
    if (_3686)
    {
        _4452 = _1546;
    }
    float _4478 = _4452;
    int _4480 = _4472 * _4464;
    int _4482 = _4480 + _4088;
    if (_3686)
    {
        _4460 = _1544;
    }
    float _4484 = _4460;
    float _4486 = _4484;
    if (_3686)
    {
        _4474 = _1544;
    }
    float _4488 = _4474;
    int _4490 = ~_4080;
    int _4492 = _4490 + 1;
    bool _4494 = uint(_4468) >= uint(_3876);
    int _4496 = int(_4218) + int(_4430);
    int _4498 = _4492 * _4432;
    int _4500 = _4498 + _4132;
    int _4502 = ~_3990;
    int _4504 = _4502 + 1;
    if (_3754)
    {
        _4438 = _1546;
    }
    float _4506 = _4438;
    float _4508 = _4506;
    if (!_3754)
    {
        _4440 = _1548;
    }
    float _4510 = _4440;
    int _4512 = _4504 * _4496;
    int _4514 = _4512 + _4160;
    if (!_3754)
    {
        _4508 = _1544;
    }
    float _4516 = _4508;
    bool _4518 = !_4424;
    int _4520 = _4518 ? 0 : (-1);
    float _4522 = _4510 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _4524 = uint(_4436) >= uint(_3858);
    bool _4526 = !_4406;
    int _4528 = _4526 ? 0 : (-1);
    bool _4530 = uint(_4446) >= uint(_4016);
    bool _4532 = !_4494;
    int _4534 = _4532 ? 0 : (-1);
    int _4536 = ~_4282;
    int _4538 = _4536 + _4520;
    int _4540 = _4538 + 1;
    bool _4542 = !_4524;
    int _4544 = _4542 ? 0 : (-1);
    int _4546 = ~_4300;
    int _4548 = _4546 + _4528;
    int _4550 = _4548 + 1;
    bool _4552 = uint(_4500) >= uint(_4080);
    int _4554 = ~_4352;
    int _4556 = _4554 + _4534;
    int _4558 = _4556 + 1;
    int _4560 = _3994 ^ _3684;
    bool _4562 = uint(_4514) >= uint(_3990);
    int _4564 = _3684 * _4540;
    int _4566 = _4564 + _3994;
    bool _4568 = uint(_4482) >= uint(_3978);
    int _4570 = _3752 * _4550;
    int _4572 = _4570 + _4032;
    int _4574 = ~_4396;
    int _4576 = _4574 + _4544;
    int _4578 = _4576 + 1;
    float _4580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4582 = !_4552;
    int _4584 = _4582 ? 0 : (-1);
    bool _4586 = !_4530;
    int _4588 = _4586 ? 0 : (-1);
    int _4590 = _3858 * _4578;
    int _4592 = _4590 + _4074;
    bool _4594 = _3752 == 0;
    uint _4596 = uint(int(uint(_4560) >> uint(31)));
    bool _4598 = _3684 == 0;
    bool _4600 = !_4594;
    int _4602 = _4600 ? _4572 : (-1);
    int _4604 = ~_4588;
    int _4606 = _4414 + _4604;
    int _4608 = _4606 + 1;
    int _4610 = ~int(_4596);
    int _4612 = _4610 + 1;
    float _4614 = _4580 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4616 = !_4598;
    int _4618 = _4616 ? _4566 : (-1);
    bool _4620 = _3858 == 0;
    bool _4622 = _3752 == 0;
    int _4624 = _4032 ^ _3752;
    bool _4626 = !_4562;
    int _4628 = _4626 ? 0 : (-1);
    int _4630 = _4608 ^ _4612;
    bool _4632 = !_4568;
    int _4634 = _4632 ? 0 : (-1);
    bool _4636 = _3684 == 0;
    int _4638 = _3876 * _4558;
    int _4640 = _4638 + _4038;
    bool _4642 = !_4620;
    int _4644 = _4642 ? _4592 : (-1);
    bool _4646 = _3876 == 0;
    bool _4648 = _3876 == 0;
    int _4650 = _4038 ^ _3876;
    uint _4652 = uint(int(uint(_4624) >> uint(31)));
    int _4654 = ~_4612;
    int _4656 = _4654 + _4630;
    int _4658 = _4656 + 1;
    float _4660 = _1544 * 2.0;
    int _4662 = ~_4634;
    int _4664 = _4464 + _4662;
    int _4666 = _4664 + 1;
    uint _4668 = uint(int(uint(_4650) >> uint(31)));
    int _4670 = ~int(_4652);
    int _4672 = _4670 + 1;
    int _4674 = ~_4628;
    int _4676 = _4496 + _4674;
    int _4678 = _4676 + 1;
    float _4680 = floor(_4660);
    int _4682 = _4074 ^ _3858;
    float _4684 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4686 = _3452 + _4684;
    int _4688 = ~int(_4668);
    int _4690 = _4688 + 1;
    int _4692 = _4678 ^ _4672;
    uint _4694 = uint(int(uint(_4682) >> uint(31)));
    float _4696 = _1548 * 2.0;
    int _4698 = _4666 ^ _4690;
    bool _4700 = !_4636;
    int _4702 = _4700 ? _4658 : (-1);
    int _4704 = ~_4672;
    int _4706 = _4704 + _4692;
    int _4708 = _4706 + 1;
    float _4710 = _1546 + _1548;
    bool _4712 = _3858 == 0;
    float _4714 = _1546 * 2.0;
    int _4716 = ~_4584;
    int _4718 = _4432 + _4716;
    int _4720 = _4718 + 1;
    float _4722 = floor(_4696);
    int _4724 = ~int(_4694);
    int _4726 = _4724 + 1;
    float _4728 = _4710 + (-1.0);
    int _4730 = ~_4690;
    int _4732 = _4730 + _4698;
    int _4734 = _4732 + 1;
    int _4736 = _4720 ^ _4726;
    float _4738 = floor(_4714);
    bool _4740 = !_4646;
    int _4742 = _4740 ? _4640 : (-1);
    bool _4744 = !_4622;
    int _4746 = _4744 ? _4708 : (-1);
    bool _4748 = _4680 > 0.0;
    bool _4750 = _4680 >= 0.0;
    bool _4752 = isnan(_4680);
    bool _4754 = _4750 || _4752;
    bool _4756 = isnan(0.0);
    bool _4758 = _4754 || _4756;
    float _4760 = fma(_4728, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _4762 = ~_4726;
    int _4764 = _4762 + _4736;
    int _4766 = _4764 + 1;
    float _4768 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4770 = _3460 + _4768;
    float _4772 = _4686 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _4774 = _4758 ? 0 : 1;
    float _4776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4778 = !_4712;
    int _4780 = _4778 ? _4766 : (-1);
    float _4782 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4784 = _3478 + _4782;
    float _4786 = fma(_4770, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4772);
    bool _4788 = _4722 >= 0.0;
    bool _4790 = isnan(_4722);
    bool _4792 = _4788 || _4790;
    bool _4794 = isnan(0.0);
    bool _4796 = _4792 || _4794;
    bool _4798 = !_4648;
    int _4800 = _4798 ? _4734 : (-1);
    float _4802 = fma(_4784, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4786);
    int _4804 = _4796 ? 0 : 1;
    float _4806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _4808 = _4738 > 0.0;
    bool _4810 = _4802 >= 0.0;
    bool _4812 = _4738 >= 0.0;
    bool _4814 = isnan(_4738);
    bool _4816 = _4812 || _4814;
    bool _4818 = isnan(0.0);
    bool _4820 = _4816 || _4818;
    float _4822 = _4776 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4824 = ~_4774;
    int _4826 = _4824 + 1;
    int _4828 = _4826 + 1;
    float _4830 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _4832 = _4828;
    if (!_4748)
    {
        int _4834 = ~_4774;
        int _4836 = _4834 + 1;
        _4832 = _4836;
    }
    int _4838 = _4832;
    bool _4840 = _4722 > 0.0;
    float _4842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    float _4844 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _4846 = fma(_4222, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4830);
    float _4848 = _4222 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _4850 = fma(_4488, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4844);
    float _4852 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _4854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _4856 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _4858 = _2208 + 0.5;
    float _4860 = fma(_4848, -2.0, _4852);
    float _4862 = -_2234;
    float _4864 = _4862 + 0.5;
    float _4866 = -_4856;
    float _4868 = fma(_4366, 2.0, _4866);
    float _4870 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _4872 = fma(_3378, _3306, _3506);
    float _4874 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _4876 = _4858 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _4878 = fma(_4478, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4870);
    float _4880 = _4864 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _4882 = _4876 * _4842;
    float _4884 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _4886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _4888 = _4880 * _4854;
    float _4890 = _4484 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _4892 = -_4884;
    float _4894 = fma(_4522, 2.0, _4892);
    float _4896 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _4898 = as_type<int>(_4882);
    if (_4810)
    {
        _4486 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4900 = _4486;
    float _4902 = _4476 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _4904 = _4516 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _4906 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _4908 = _4874 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _4910 = _1604 + 0.5;
    float _4912 = -_165;
    float _4914 = fma(_4912, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4868);
    out.m_82.x = _4882;
    out.m_82.y = _4888;
    float _4916 = -_4896;
    float _4918 = fma(_4890, 2.0, _4916);
    float _4920 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _4922 = fma(_4908, _4910, _4914);
    float _4924 = fma(_3426, _3288, _4872);
    float _4926 = _4886 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _4928 = _1650 + (-0.5);
    float _4930 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4860);
    float _4932 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4846);
    if (_4810)
    {
        float _4934 = _4900 * 5.0;
        _4898 = as_type<int>(_4934);
    }
    int _4936 = _4898;
    float _4938 = fma(_4904, -2.0, _4906);
    float _4940 = fma(_4902, -2.0, _4920);
    float _4942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _4944 = -_4926;
    float _4946 = -_4930;
    float _4948 = fma(_4944, _4928, _4946);
    if (_4810)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14428 = as_type<float>(_4936);
        out.gl_Position.z = _14428;
    }
    float _4950 = fma(_3208, (*spvDescriptorSet0.vp_c9)._m0[174].x, _4924);
    float _4952 = float(_4602);
    float _4954 = -_165;
    float _4956 = fma(_4954, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4894);
    float _4958 = float(_4644);
    float _4960 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4938);
    float _4962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _4964 = float(_4618);
    out.m_84.x = _4950;
    float _4966 = float(_4742);
    float _4968 = _4806 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _4970 = float(_4800);
    float _4972 = -_4400;
    float _4974 = fma(_4972, _1604, _4922);
    float _4976 = -_4932;
    float _4978 = _4976 + 1.0;
    float _4980 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _4982 = fma(_4614, _4964, _3710);
    float _4984 = _1690 + 0.5;
    float _4986 = fma(_4978, _1650, _4948);
    float _4988 = -_165;
    float _4990 = fma(_4988, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4918);
    float _4992 = float(_4702);
    float _4994 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4940);
    bool _4996 = !_3072;
    float _4998 = _4996 ? _223 : as_type<float>(_2334);
    float _5000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_86.x = _4974;
    out.m_86.y = _4986;
    float _5002 = fma(_4822, _4952, _4990);
    float _5004 = _4942 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _5006 = _4962 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _5008 = float(_4746);
    float _5010 = -_3784;
    float _5012 = fma(_4968, _4992, _5010);
    float _5014 = fma(_5004, _4958, _4096);
    float _5016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _5018 = fma(_5006, _4966, _4956);
    float _5020 = float(_4780);
    float _5022 = _4308 + 0.5;
    float _5024 = _4404 + 0.5;
    float _5026 = fma(_5006, _4984, _5018);
    float _5028 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4162);
    float _5030 = fma(_4822, _5022, _5002);
    float _5032 = _4980 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5034 = _1594 + 0.5;
    float _5036 = fma(_4614, _5024, _4982);
    float _5038 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4878);
    float _5040 = -_4994;
    float _5042 = fma(_5032, _5008, _5040);
    float _5044 = fma(_5004, _5034, _5014);
    float _5046 = _5000 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5048 = _1806 + (-0.5);
    float _5050 = _5016 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _5052 = -_4960;
    float _5054 = fma(_5046, _4970, _5052);
    float _5056 = _4998 + (-0.5);
    float _5058 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4850);
    float _5060 = -_5028;
    float _5062 = fma(_5050, _5020, _5060);
    float _5064 = _5028;
    if (!_3102)
    {
        _5064 = _223;
    }
    float _5066 = _5064;
    float _5068 = -_4968;
    float _5070 = fma(_5068, _5056, _5012);
    float _5072 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _5074 = -_5032;
    float _5076 = fma(_5074, _5048, _5042);
    float _5078 = _1694 + (-0.5);
    float _5080 = _5066;
    if (_3102)
    {
        float _5082 = -_223;
        float _5084 = _3640 ? _5082 : _223;
        _5080 = _5084;
    }
    float _5086 = _5080;
    float _5088 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[88].z, _5072);
    float _5090 = -_5046;
    float _5092 = fma(_5090, _5078, _5054);
    float _5094 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[87].z, _5088);
    float _5096 = _5086 + (-0.5);
    float _5098 = -_5058;
    float _5100 = _5098 + 1.0;
    int _5102 = ~_4804;
    int _5104 = _5102 + 1;
    int _5106 = _5104 + 1;
    float _5108 = -_5094;
    float _5110 = _5108 + 1.0;
    float _5112 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _5114 = -_5050;
    float _5116 = fma(_5114, _5096, _5062);
    float _5118 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _5120 = -_5110;
    float _5122 = fma(_1690, _5120, _5026);
    float _5124 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[78].z, _5112);
    float _5126 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _5128 = log2(_5126);
    float _5130 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[88].w, _5118);
    float _5132 = -_4158;
    float _5134 = _5132 + 1.0;
    float _5136 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[77].z, _5124);
    float _5138 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[87].w, _5130);
    float _5140 = -_5134;
    float _5142 = fma(_5140, _1594, _5044);
    float _5144 = -_5136;
    float _5146 = _5144 + 1.0;
    float _5148 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _5150 = _4686 * _4686;
    float _5152 = -_5138;
    float _5154 = _5152 + 1.0;
    float _5156 = -_5146;
    float _5158 = fma(_4404, _5156, _5036);
    float _5160 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[78].w, _5148);
    float _5162 = fma(_4770, _4770, _5150);
    float _5164 = fma(_1694, _5154, _5092);
    float _5166 = _5128 * _165;
    float _5168 = -_5038;
    float _5170 = _5168 + 1.0;
    float _5172 = fma(_4784, _4784, _5162);
    float _5174 = -_4180;
    float _5176 = _5174 + 1.0;
    float _5178 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[77].w, _5160);
    float _5180 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _5182 = 1.0 + _5180;
    float _5184 = exp2(_5166);
    float _5186 = fma(_5176, _5086, _5116);
    float _5188 = fma(_1806, _5170, _5076);
    float _5190 = in.m_88.x;
    float _5192 = in.m_88.y;
    float _5194 = in.m_88.z;
    float _5196 = -_5178;
    float _5198 = _5196 + 1.0;
    float _5200 = -_5100;
    float _5202 = fma(_4308, _5200, _5030);
    int _5204 = _5106;
    if (!_4840)
    {
        int _5206 = ~_4804;
        int _5208 = _5206 + 1;
        _5204 = _5208;
    }
    int _5210 = _5204;
    out.m_90.x = _5122;
    out.m_90.y = _5164;
    float _5212 = rsqrt(_5172);
    float _5214 = fma(_4998, _5198, _5070);
    int _5216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _5218 = _5216 != 0;
    int _5220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _5222 = _5220 != 0;
    int _5224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _5226 = _5224 != 0;
    out.m_92.x = _5142;
    out.m_92.y = _5186;
    bool _5228 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _5230 = isnan(0.0);
    bool _5232 = _5228 || _5230;
    bool _5234 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _5236 = _5232 || _5234;
    out.m_94.x = _5158;
    out.m_94.y = _5214;
    out.m_94.z = _5202;
    out.m_94.w = _5188;
    float _5238 = 1.0 / _5182;
    float _5240 = -_5184;
    float _5242 = _5240 + 1.0;
    bool _5244 = !_5222;
    int _5246 = _5244 ? 0 : 1;
    if (_4810)
    {
        out.m_63.x = 0.0;
    }
    bool _5248 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _5250 = isnan(1.0);
    bool _5252 = _5248 || _5250;
    bool _5254 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _5256 = _5252 || _5254;
    float _5258 = _5236 ? _5242 : 0.0;
    float _5260 = _4686 * _5212;
    float _5262 = _4770 * _5212;
    bool _5264 = !_5226;
    int _5266 = _5264 ? 0 : 1;
    bool _5268 = !_5218;
    int _5270 = _5268 ? 0 : 1;
    if (_4810)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5272 = -_5260;
    float _5274 = fma(_5272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3452);
    float _5276 = _4784 * _5212;
    float _5278 = -_5262;
    float _5280 = fma(_5278, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3460);
    int _5282 = abs(_5270);
    float _5284 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5286 = _5274 + _5284;
    float _5288 = -_5276;
    float _5290 = fma(_5288, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3478);
    float _5292 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5294 = _5280 + _5292;
    float _5296 = float(_5210);
    float _5298 = _5286 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5300 = float(_5282);
    float _5302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5304 = _5290 + _5302;
    int _5306 = as_type<int>(_5274);
    if (_5256)
    {
        float _5308 = _5258 * _5238;
        _167 = _5308;
    }
    float _5310 = _167;
    float _5312 = fma(_5294, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5298);
    float _5314 = -_5260;
    float _5316 = fma(_5314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4686);
    float _5318 = _5300 * _5296;
    float _5320 = -_5262;
    float _5322 = fma(_5320, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4770);
    float _5324 = fma(_5304, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5312);
    float _5326 = _5316 * _5316;
    float _5328 = _5318 * (-2.0);
    float _5330 = _1544 + (-0.5);
    int _5332 = abs(_5246);
    float _5334 = fma(_5322, _5322, _5326);
    bool _5336 = _5324 >= 0.0;
    float _5338 = -_5276;
    float _5340 = fma(_5338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4784);
    float _5342 = fma(_5328, _5190, _5190);
    float _5344 = fma(_4250, _5328, _4250);
    float _5346 = float(_4838);
    float _5348 = fma(_5340, _5340, _5334);
    float _5350 = fma(_5330, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5342);
    float _5352 = float(_5332);
    float _5354 = _1546 + (-0.5);
    int _5356 = _4820 ? 0 : 1;
    float _5358 = fma(_5344, _5310, _5350);
    float _5360 = sqrt(_5348);
    float _5362 = _5352 * _5346;
    float _5364 = _5340;
    if (_5336)
    {
        _5364 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5366 = _5364;
    float _5368 = _5358 * 0.15915493667125701904296875;
    int _5370 = as_type<int>(_5366);
    if (_5336)
    {
        out.m_63.x = 0.0;
    }
    float _5372 = _5362 * (-2.0);
    int _5374 = ~_5356;
    int _5376 = _5374 + 1;
    int _5378 = _5376 + 1;
    float _5380 = _5368 * 6.283185482025146484375;
    float _5382 = sin(_5380);
    int _5384 = _5378;
    if (_5336)
    {
        float _5386 = _5366 * 5.0;
        _5370 = as_type<int>(_5386);
    }
    int _5388 = _5370;
    float _5390 = fma(_4760, _5372, _4760);
    if (!_4808)
    {
        int _5392 = ~_5356;
        int _5394 = _5392 + 1;
        _5384 = _5394;
    }
    int _5396 = _5384;
    float _5398 = fma(_5372, _5192, _5192);
    int _5400 = abs(_5266);
    if (_5336)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _15159 = as_type<float>(_5388);
        out.gl_Position.z = _15159;
    }
    if (_5336)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5402 = -_3452;
    float _5404 = _5402 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5406 = float(_5396);
    float _5408 = -_3460;
    float _5410 = _5408 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5412 = _5404 * _5404;
    float _5414 = -_3478;
    float _5416 = _5414 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5418 = _1544 + _1548;
    float _5420 = float(_5400);
    float _5422 = fma(_5410, _5410, _5412);
    float _5424 = fma(_5354, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5398);
    float _5426 = _5418 + (-1.0);
    float _5428 = _1548 + (-0.5);
    float _5430 = fma(_5416, _5416, _5422);
    float _5432 = _5420 * _5406;
    float _5434 = fma(_5390, _5310, _5424);
    float _5436 = _5368 * 6.283185482025146484375;
    float _5438 = cos(_5436);
    float _5440 = _5432 * (-2.0);
    float _5442 = _617 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5444 = fma(_5426, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5446 = _5434 * 0.15915493667125701904296875;
    float _5448 = fma(_5440, _5194, _5194);
    float _5450 = fma(_5444, _5440, _5444);
    float _5452 = rsqrt(_5430);
    float _5454 = fma(_5428, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5448);
    float _5456 = fma(_5450, _5310, _5454);
    float _5458 = _5446 * 6.283185482025146484375;
    float _5460 = sin(_5458);
    float _5462 = _5456 * 0.15915493667125701904296875;
    float _5464 = _5410 * _5452;
    float _5466 = _5416 * _5452;
    float _5468 = _5404 * _5452;
    float _5470 = _5446 * 6.283185482025146484375;
    float _5472 = cos(_5470);
    float _5474 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5476 = _5464 * _5474;
    float _5478 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5480 = _5466 * _5478;
    float _5482 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5484 = _5468 * _5482;
    float _5486 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5488 = -_5476;
    float _5490 = fma(_5466, _5486, _5488);
    float _5492 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5494 = -_5480;
    float _5496 = fma(_5468, _5492, _5494);
    float _5498 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5500 = -_5484;
    float _5502 = fma(_5464, _5498, _5500);
    float _5504 = _5462 * 6.283185482025146484375;
    float _5506 = sin(_5504);
    float _5508 = _5490 * _5490;
    float _5510 = _5382 * _5460;
    float _5512 = _5212 * _5360;
    float _5514 = _5438 * _5460;
    float _5516 = fma(_5496, _5496, _5508);
    float _5518 = _5512 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _5520 = _5518 * 0.5;
    float _5522 = _5462 * 6.283185482025146484375;
    float _5524 = cos(_5522);
    float _5526 = fma(_5502, _5502, _5516);
    float _5528 = _5438 * _5472;
    float _5530 = _5382 * _5472;
    float _5532 = rsqrt(_5526);
    float _5534 = fma(_5506, _5528, _5510);
    float _5536 = fma(_5506, _5510, _5528);
    float _5538 = _5438 * _5524;
    float _5540 = _5472 * _5524;
    float _5542 = _5382 * _5524;
    float _5544 = _5460 * _5524;
    float _5546 = _619 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5548 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _5550 = _5512 * _5442;
    float _5552 = -_5514;
    float _5554 = fma(_5506, _5530, _5552);
    float _5556 = -_5530;
    float _5558 = fma(_5506, _5514, _5556);
    float _5560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _5562 = _5512 * _5546;
    float _5564 = _5548 * _5550;
    float _5566 = _5496 * _5532;
    float _5568 = _5490 * _5532;
    float _5570 = _5560 * _5562;
    float _5572 = _5538 * _5564;
    float _5574 = -_5564;
    float _5576 = _5506 * _5574;
    float _5578 = _5502 * _5532;
    float _5580 = _5466 * _5568;
    float _5582 = fma(_5534, _5570, _5572);
    float _5584 = _5468 * _5566;
    float _5586 = _5542 * _5564;
    float _5588 = fma(_5540, _5570, _5576);
    float _5590 = fma(_5558, _5520, _5582);
    float _5592 = -_5580;
    float _5594 = fma(_5468, _5578, _5592);
    float _5596 = -_5584;
    float _5598 = fma(_5464, _5568, _5596);
    float _5600 = fma(_5554, _5570, _5586);
    float _5602 = fma(_5544, _5520, _5588);
    float _5604 = _5594 * _5590;
    float _5606 = _5598 * _5590;
    float _5608 = fma(_5536, _5520, _5600);
    float _5610 = fma(_5566, _5602, _5604);
    float _5612 = fma(_5578, _5602, _5606);
    float _5614 = fma(_5464, _5608, _5610);
    float _5616 = fma(_5466, _5608, _5612);
    float _5618 = _3460 + _5614;
    float _5620 = _3478 + _5616;
    float _5622 = _5464 * _5578;
    float _5624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5626 = _5618 + _5624;
    float _5628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5630 = _5620 + _5628;
    float _5632 = -_5622;
    float _5634 = fma(_5466, _5566, _5632);
    float _5636 = _5626 * _5626;
    float _5638 = _5630 * _5630;
    float _5640 = _5634 * _5590;
    float _5642 = _5636 + _5638;
    float _5644 = fma(_5568, _5602, _5640);
    float _5646 = sqrt(_5642);
    float _5648 = fma(_5468, _5608, _5644);
    float _5650 = _3452 + _5648;
    bool _5652 = _5646 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5654 = _5622;
    float _5656 = _5618;
    float _5658 = _5620;
    float _5660 = _5636;
    float _5662 = _5638;
    if (!_5652)
    {
        _5654 = _5650;
    }
    float _5664 = _5654;
    bool _5666 = !_5652;
    float _5668 = _5664;
    if (!_5666)
    {
        float _5670 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5672 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5674 = _5646 + _5672;
        float _5676 = _5650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5678 = rsqrt(_5642);
        float _5680 = _5674 * _5670;
        float _5682 = _5680 * 0.15915493667125701904296875;
        float _5684 = _5682 * 6.283185482025146484375;
        float _5686 = sin(_5684);
        float _5688 = _5682 * 6.283185482025146484375;
        float _5690 = cos(_5688);
        float _5692 = fma(_5686, _5676, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5694 = _5678 * _5692;
        float _5696 = _5690 + (-1.0);
        float _5698 = fma(_5626, _5694, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5700 = fma(_5630, _5694, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5702 = _5696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5704 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5706 = _5698 + _5704;
        float _5708 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5710 = _5700 + _5708;
        float _5712 = fma(_5650, _5690, _5702);
        float _5714 = _5706 * _5706;
        float _5716 = _5710 * _5710;
        _5656 = _5698;
        _5658 = _5700;
        _5668 = _5712;
        _5660 = _5714;
        _5662 = _5716;
    }
    float _5718 = _5656;
    float _5720 = _5658;
    float _5722 = _5668;
    float _5724 = _5660;
    float _5726 = _5662;
    float _5728 = fma(_5718, 6.2500002968590706586837768554688e-05, 0.5);
    float _5730 = fma(_5720, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _15666 = float2(_5728, _5730);
    float3 _5734 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_15666, float2(0.0), isnan(_15666)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_15666, float2(0.0), isnan(_15666)), level(0.0)).xyz;
    float _5736 = _5734.x;
    float _5738 = _5734.y;
    float _5740 = _5734.z;
    float _5742 = _5534 * _5594;
    float _5744 = _5534 * _5634;
    float _5746 = _5534 * _5598;
    float _5748 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5750 = _5538 * _5598;
    float _5752 = _5558 * _5594;
    float _5754 = _5558 * _5634;
    float _5756 = _5558 * _5598;
    float _5758 = fma(_5540, _5566, _5742);
    float _5760 = fma(_5540, _5568, _5744);
    float _5762 = fma(_5540, _5578, _5746);
    float _5764 = fma(_5748, _5748, 1.0);
    float _5766 = _5538 * _5634;
    float _5768 = _5538 * _5594;
    float _5770 = fma(_5544, _5568, _5754);
    float _5772 = rsqrt(_5764);
    float _5774 = -_5506;
    float _5776 = fma(_5774, _5568, _5766);
    float _5778 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5780 = _5722 + _5778;
    float _5782 = -_5506;
    float _5784 = fma(_5782, _5566, _5768);
    float _5786 = -_5506;
    float _5788 = fma(_5786, _5578, _5750);
    float _5790 = fma(_5544, _5566, _5752);
    float _5792 = fma(_5780, _5780, _5724);
    float _5794 = fma(_5544, _5578, _5756);
    float _5796 = fma(_5542, _5464, _5784);
    float _5798 = fma(_5542, _5468, _5776);
    float _5800 = fma(_5542, _5466, _5788);
    float _5802 = fma(_5536, _5464, _5790);
    float _5804 = _5792 + _5726;
    float _5806 = fma(_5536, _5468, _5770);
    float _5808 = fma(_5536, _5466, _5794);
    float _5810 = fma(_5554, _5464, _5758);
    float _5812 = _5748 * _5772;
    float _5814 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5816 = _5748 * _5796;
    float _5818 = fma(_5554, _5468, _5760);
    float _5820 = _5748 * _5798;
    float _5822 = fma(_5554, _5466, _5762);
    float _5824 = _5748 * _5800;
    float _5826 = -_5802;
    float _5828 = _5812 * _5826;
    float _5830 = -_5806;
    float _5832 = _5812 * _5830;
    float _5834 = -_5808;
    float _5836 = _5812 * _5834;
    float _5838 = fma(_5814, _5810, _5816);
    float _5840 = sqrt(_5804);
    float _5842 = fma(_5814, _5818, _5820);
    float _5844 = fma(_5814, _5822, _5824);
    float _5846 = fma(_5772, _5796, _5828);
    float _5848 = fma(_5772, _5798, _5832);
    float _5850 = _5806 + _5842;
    float _5852 = fma(_5772, _5800, _5836);
    float _5854 = _5802 + _5838;
    float _5856 = _5808 + _5844;
    out.m_96.x = _5810;
    out.m_96.y = _5818;
    out.m_96.z = _5822;
    out.m_98.x = _5846;
    out.m_98.y = _5848;
    out.m_98.z = _5852;
    bool _5858 = _5840 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5860 = isnan(_5840);
    bool _5862 = _5858 || _5860;
    bool _5864 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5866 = _5862 || _5864;
    out.m_100.x = _5854;
    out.m_100.y = _5850;
    out.m_100.z = _5856;
    float _5868 = _5802;
    if (!_5866)
    {
        _5868 = 1.0;
    }
    float _5870 = _5868;
    out.m_102.x = _5736;
    out.m_102.y = _5738;
    out.m_102.z = _5740;
    bool _5872 = !_5866;
    float _5874 = _5870;
    if (!_5872)
    {
        bool _5876 = _5840 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5878 = isnan(_5840);
        bool _5880 = _5876 || _5878;
        bool _5882 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5884 = _5880 || _5882;
        if (!_5884)
        {
            float _5886 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5888 = _5840 + _5886;
            float _5890 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5892 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5890;
            float _5894 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5896 = _5894 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5898 = 1.0 / _5892;
            float _5900 = _5888 * _5898;
            float _5902 = fma(_5900, _5896, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5874 = _5902;
            _5904 = true;
        }
        else
        {
            bool _5906 = _5840 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5908 = isnan(_5840);
            bool _5910 = _5906 || _5908;
            bool _5912 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5914 = _5910 || _5912;
            if (!_5914)
            {
                float _5916 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5918 = _5840 + _5916;
                float _5920 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5922 = _5920 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5924 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5926 = _5924 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5928 = 1.0 / _5922;
                float _5930 = _5918 * _5928;
                float _5932 = fma(_5930, _5926, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5874 = _5932;
                _5904 = true;
            }
            else
            {
                _5874 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5904 = false;
    float _5934 = _5874;
    float _5936 = fma(_5280, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _5938 = fma(_5290, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _5940 = floor(_5936);
    float _5942 = floor(_5938);
    float _5944 = -_5940;
    float _5946 = _5936 + _5944;
    float _5948 = -_5942;
    float _5950 = _5938 + _5948;
    float2 _16060 = float2(_5946, _5950);
    float _5952 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16060, float2(0.0), isnan(_16060)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16060, float2(0.0), isnan(_16060)), level(0.0)).x;
    float _5954 = _5274 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5956 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5958 = _5718 + _5956;
    float _5960 = fma(_5280, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5954);
    float _5962 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5964 = _5720 + _5962;
    float _5966 = fma(_5958, _5934, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5968 = fma(_5290, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5960);
    float _5970 = _5274 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5972 = fma(_5964, _5934, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5974 = -_3460;
    float _5976 = _5974 + _5966;
    float _5978 = _5968 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5980 = fma(_5280, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5970);
    float _5982 = -_3478;
    float _5984 = _5982 + _5972;
    float _5986 = 1.0 / _5978;
    float _5988 = fma(_5290, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5980);
    float _5990 = _5988 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5992 = _5990 + _5978;
    float _5994 = _5992 * _5986;
    float _5996 = _5994 * 0.5;
    float _5998 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6000 = fma(_5996, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5998);
    float _6002 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _6004 = _5274 + _6002;
    float _6006 = 1.0 / _6000;
    float _6008 = _6004 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _6010 = fma(_5280, (*spvDescriptorSet0.vp_c15)._m0[126].x, _6008);
    float _6012 = fma(_5290, (*spvDescriptorSet0.vp_c15)._m0[126].z, _6010);
    float _6014 = _6012 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _6016 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6018 = _6006 * _6016;
    float _6020 = _6004 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _6022 = trunc(_6014);
    int _6024 = int(_6022);
    bool _6026 = _6018 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _6028 = fma(_5280, (*spvDescriptorSet0.vp_c15)._m0[127].x, _6020);
    bool _6030 = _6018 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _6032 = !_6026;
    int _6034 = _6032 ? 0 : 1;
    int _6036 = 2;
    if (!_6026)
    {
        _6036 = 1;
    }
    int _6038 = _6036;
    int _6040 = _6038;
    if (!_6030)
    {
        _6040 = _6034;
    }
    int _6042 = _6040;
    float _6044 = fma(_5290, (*spvDescriptorSet0.vp_c15)._m0[127].z, _6028);
    float _6046 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _6048 = _5722 + _6046;
    int _6050 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _6052 = _6024 + _6050;
    int _6054 = _6052 + 1;
    int _6056 = _6042 << 6;
    float _6058 = _6044 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _6060 = fma(_6048, _5934, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _6062 = _6054 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _6064 = _6056 + 96;
    uint _6066 = uint(int(uint(_6064) >> uint(2)));
    uint _6068 = uint(int(uint(int(_6066)) >> uint(2)));
    int _6070 = int(_6066) & 3;
    float _6072 = (*spvDescriptorSet0.vp_c15)._m0[int(_6068)][_6070];
    int _6074 = int(_6066) + 1;
    uint _6076 = uint(int(uint(_6074) >> uint(2)));
    int _6078 = _6074 & 3;
    float _6080 = (*spvDescriptorSet0.vp_c15)._m0[int(_6076)][_6078];
    float _6082 = trunc(_6058);
    int _6084 = int(_6082);
    float _6086 = -_3452;
    float _6088 = _6086 + _6060;
    float _6090 = _6088 * _6088;
    int _6092 = _6056 + 48;
    uint _6094 = uint(int(uint(_6092) >> uint(2)));
    uint _6096 = uint(int(uint(int(_6094)) >> uint(2)));
    int _6098 = int(_6094) & 3;
    float _6100 = (*spvDescriptorSet0.vp_c15)._m0[int(_6096)][_6098];
    int _6102 = int(_6094) + 1;
    uint _6104 = uint(int(uint(_6102) >> uint(2)));
    int _6106 = _6102 & 3;
    float _6108 = (*spvDescriptorSet0.vp_c15)._m0[int(_6104)][_6106];
    float _6110 = fma(_5976, _5976, _6090);
    float _6112 = fma(_5984, _5984, _6110);
    int _6114 = _6056 + 104;
    uint _6116 = uint(int(uint(_6114) >> uint(2)));
    uint _6118 = uint(int(uint(int(_6116)) >> uint(2)));
    int _6120 = int(_6116) & 3;
    float _6122 = (*spvDescriptorSet0.vp_c15)._m0[int(_6118)][_6120];
    int _6124 = int(_6116) + 1;
    uint _6126 = uint(int(uint(_6124) >> uint(2)));
    int _6128 = _6124 & 3;
    float _6130 = (*spvDescriptorSet0.vp_c15)._m0[int(_6126)][_6128];
    int _6132 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _6134 = _6084 + _6132;
    int _6136 = _6134 + 1;
    float _6138 = sqrt(_6112);
    int _6140 = _6054 | _6136;
    int _6142 = _6056 + 56;
    uint _6144 = uint(int(uint(_6142) >> uint(2)));
    uint _6146 = uint(int(uint(int(_6144)) >> uint(2)));
    int _6148 = int(_6144) & 3;
    float _6150 = (*spvDescriptorSet0.vp_c15)._m0[int(_6146)][_6148];
    int _6152 = int(_6144) + 1;
    uint _6154 = uint(int(uint(_6152) >> uint(2)));
    int _6156 = _6152 & 3;
    float _6158 = (*spvDescriptorSet0.vp_c15)._m0[int(_6154)][_6156];
    bool _6160 = _6140 < 0;
    bool _6162 = _6160 || _6062;
    bool _6164 = _6136 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _6166 = _6164 || _6162;
    bool _6168 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _6170 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _6172 = _6168 || _6170;
    bool _6174 = isnan(0.5);
    bool _6176 = _6172 || _6174;
    int _6178 = _6056 + 64;
    uint _6180 = uint(int(uint(_6178) >> uint(2)));
    uint _6182 = uint(int(uint(int(_6180)) >> uint(2)));
    int _6184 = int(_6180) & 3;
    float _6186 = (*spvDescriptorSet0.vp_c15)._m0[int(_6182)][_6184];
    int _6188 = int(_6180) + 1;
    uint _6190 = uint(int(uint(_6188) >> uint(2)));
    int _6192 = _6188 & 3;
    float _6194 = (*spvDescriptorSet0.vp_c15)._m0[int(_6190)][_6192];
    bool _6196 = _6138 > 0.0;
    int _6198 = _6056 + 72;
    uint _6200 = uint(int(uint(_6198) >> uint(2)));
    uint _6202 = uint(int(uint(int(_6200)) >> uint(2)));
    int _6204 = int(_6200) & 3;
    float _6206 = (*spvDescriptorSet0.vp_c15)._m0[int(_6202)][_6204];
    int _6208 = int(_6200) + 1;
    uint _6210 = uint(int(uint(_6208) >> uint(2)));
    int _6212 = _6208 & 3;
    float _6214 = (*spvDescriptorSet0.vp_c15)._m0[int(_6210)][_6212];
    float _6216 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _6218 = as_type<float>(_6042);
    if (!_6196)
    {
        _6216 = _5966;
    }
    float _6220 = _6216;
    int _6222 = _6056 + 80;
    uint _6224 = uint(int(uint(_6222) >> uint(2)));
    uint _6226 = uint(int(uint(int(_6224)) >> uint(2)));
    int _6228 = int(_6224) & 3;
    float _6230 = (*spvDescriptorSet0.vp_c15)._m0[int(_6226)][_6228];
    int _6232 = int(_6224) + 1;
    uint _6234 = uint(int(uint(_6232) >> uint(2)));
    int _6236 = _6232 & 3;
    float _6238 = (*spvDescriptorSet0.vp_c15)._m0[int(_6234)][_6236];
    float _6240 = _6004 * _6080;
    float _6242 = _6080;
    float _6244 = _6072;
    float _6246 = _6220;
    float _6248 = _6220;
    if (!_6166)
    {
        float _6250 = floor(_6014);
        _6242 = _6250;
    }
    float _6252 = _6242;
    float _6254 = fma(_5280, _6072, _6240);
    if (!_6196)
    {
        _6244 = _6060;
    }
    float _6256 = _6244;
    float _6258 = _6004 * _6108;
    float _6260 = _6108;
    float _6262 = _6256;
    float _6264 = _6256;
    if (!_6196)
    {
        _6260 = _5972;
    }
    float _6266 = _6260;
    float _6268 = fma(_5290, _6122, _6254);
    bool _6270 = !_6196;
    float _6272 = _6266;
    int _6274 = as_type<int>(_6130);
    float _6276 = _6206;
    if (!_6270)
    {
        float _6278 = _227 * _227;
        float _6280 = fma(_225, _225, _6278);
        float _6282 = fma(_229, _229, _6280);
        float _6284 = rsqrt(_6112);
        float _6286 = sqrt(_6282);
        float _6288 = _5976 * _6284;
        float _6290 = _6088 * _6284;
        float _6292 = _5984 * _6284;
        bool _6294 = _6286 > 0.0;
        float _6296 = _6286;
        if (!_6294)
        {
            _6246 = _5966;
        }
        float _6298 = _6246;
        _6248 = _6298;
        if (!_6294)
        {
            _6262 = _6060;
        }
        float _6300 = _6262;
        _6264 = _6300;
        if (!_6294)
        {
            _6296 = _5972;
        }
        float _6302 = _6296;
        bool _6304 = !_6294;
        _6272 = _6302;
        if (!_6304)
        {
            float _6306 = rsqrt(_6282);
            float _6308 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _6310 = _227 * _6306;
            float _6312 = _225 * _6306;
            float _6314 = _6290 * _6310;
            float _6316 = _229 * _6306;
            float _6318 = fma(_6288, _6312, _6314);
            float _6320 = _6308 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6322 = fma(_6292, _6316, _6318);
            float _6324 = _6322 * _6320;
            float _6326 = fma(_225, _6324, _5966);
            float _6328 = fma(_227, _6324, _6060);
            float _6330 = fma(_229, _6324, _5972);
            _6264 = _6328;
            _6248 = _6326;
            _6272 = _6330;
        }
    }
    float _6332 = _6264;
    float _6334 = _6248;
    float _6336 = _6272;
    float _6338 = _6004 * _6194;
    float _6340 = _6268 + _6130;
    if (!_6166)
    {
        int _6342 = _6136 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _6344 = _6342 + _6054;
        _6274 = _6344;
    }
    int _6346 = _6274;
    float _6348 = -_5260;
    float _6350 = fma(_6348, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6332);
    float _6352 = fma(_5280, _6186, _6338);
    float _6354 = fma(_5280, _6100, _6258);
    float _6356 = 1.0 / _6340;
    if (!_6166)
    {
        int _6358 = _6346 << 2;
        _237 = _6358;
    }
    int _6360 = _237;
    float _6362 = fma(_5290, _6206, _6352);
    float _6364 = fma(_5290, _6150, _6354);
    float _6366 = -_5262;
    float _6368 = fma(_6366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6334);
    float _6370 = -_5276;
    float _6372 = fma(_6370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6336);
    int _6374 = _6360;
    float _6376 = _6368;
    float _6378 = _6372;
    if (_6176)
    {
        _6276 = _6350;
    }
    float _6380 = _6276;
    float _6382 = _6380;
    if (!_6166)
    {
        uint _6384 = uint(int(uint(_6346) >> uint(2)));
        _239 = int(_6384);
    }
    int _6386 = _239;
    if (!_6166)
    {
        int _6388 = 12 & _6360;
        _6374 = _6388;
    }
    int _6390 = _6374;
    if (!_6176)
    {
        float _6392 = _5286 * _5286;
        float _6394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6396 = -_3478;
        float _6398 = _6396 + _6336;
        float _6400 = -_3460;
        float _6402 = _6400 + _6334;
        float _6404 = fma(_5294, _5294, _6392);
        float _6406 = fma(_5304, _5304, _6404);
        float _6408 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6410 = sqrt(_6406);
        float _6412 = 1.0 / _5512;
        float _6414 = _6408 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6416 = precise::min(_6410, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6418 = _6416 * _6394;
        float _6420 = -_3452;
        float _6422 = _6420 + _6332;
        float _6424 = _6418 * _6412;
        float _6426 = _6414 * _6424;
        float _6428 = _6398 * _6424;
        float _6430 = fma(_6422, _6426, _5274);
        float _6432 = fma(_6402, _6426, _5280);
        float _6434 = fma(_6414, _6428, _5290);
        _6382 = _6430;
        _6376 = _6432;
        _6378 = _6434;
    }
    float _6436 = _6382;
    float _6438 = _6376;
    float _6440 = _6378;
    if (!_6166)
    {
        int _6442 = _6386 << 4;
        int _6444 = _6442 + _6390;
        _5306 = _6444;
    }
    int _6446 = _5306;
    float _6448 = _6436 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    int _6450 = _6056 + 88;
    uint _6452 = uint(int(uint(_6450) >> uint(2)));
    uint _6454 = uint(int(uint(int(_6452)) >> uint(2)));
    int _6456 = int(_6452) & 3;
    float _6458 = (*spvDescriptorSet0.vp_c15)._m0[int(_6454)][_6456];
    int _6460 = int(_6452) + 1;
    uint _6462 = uint(int(uint(_6460) >> uint(2)));
    int _6464 = _6460 & 3;
    float _6466 = (*spvDescriptorSet0.vp_c15)._m0[int(_6462)][_6464];
    float _6468 = _6364 + _6158;
    float _6470 = _6436 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6472 = fma(_6438, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6448);
    float _6474 = _6362 + _6214;
    float _6476 = _6468 * _6356;
    float _6478 = _6436 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6480 = fma(_6438, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6470);
    float _6482 = _5262;
    if (!_6166)
    {
        int _6484 = _6446 + 400;
        uint _6486 = uint(int(uint(_6484) >> uint(2)));
        uint _6488 = uint(int(uint(int(_6486)) >> uint(2)));
        int _6490 = int(_6486) & 3;
        float _6492 = (*spvDescriptorSet0.vp_c15)._m0[int(_6488)][_6490];
        _6482 = _6492;
    }
    float _6494 = _6482;
    float _6496 = fma(_6440, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6472);
    float _6498 = fma(_6438, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6478);
    bool _6500 = _6476 >= 0.0;
    float _6502 = _6436 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6504 = fma(_6440, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6480);
    float _6506 = _6496 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6508 = _6474 * _6356;
    float _6510 = fma(_6440, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6498);
    bool _6512 = _6476 <= 1.0;
    bool _6514 = _6512 && _6500;
    float _6516 = fma(_6438, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6502);
    float _6518 = _6504 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6520 = _6506 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6522 = _6510 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _6524 = _6508 >= 0.0;
    bool _6526 = _6524 && _6514;
    float _6528 = fma(_6440, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6516);
    float _6530 = fma(_6518, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6520);
    float _6532 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _6534 = _6522 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _6536 = _6508 <= 1.0;
    bool _6538 = _6536 && _6526;
    float _6540 = _6528 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6542 = fma(_6522, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6530);
    float _6544 = _6004 * _6238;
    float _6546 = -_6534;
    float _6548 = fma(_6546, _6532, 1.0);
    float _6550 = _6506 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6552 = fma(_6540, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6542);
    float _6554 = fma(_5280, _6230, _6544);
    float _6556 = _6506 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6558 = fma(_6518, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6550);
    float _6560 = log2(_6548);
    float _6562 = fma(_6518, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6556);
    if (_6538)
    {
        float _6564 = float(_6042);
        _6218 = _6564;
    }
    float _6566 = _6218;
    float _6568 = fma(_6522, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6558);
    float _6570 = fma(_6522, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6562);
    float _6572 = 1.0 / _6552;
    float _6574 = fma(_6540, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6568);
    float _6576 = fma(_6540, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6570);
    float _6578 = fma(_5290, _6458, _6554);
    float _6580 = _6578 + _6466;
    float _6582 = _6332;
    float _6584 = _6466;
    float _6586 = _6566;
    float _6588 = _6576;
    float _6590 = _6574;
    if (!_6166)
    {
        float _6592 = floor(_6058);
        _6582 = _6592;
    }
    float _6594 = _6582;
    float _6596 = _6560 * 0.693147182464599609375;
    if (!_6166)
    {
        float _6598 = -_6252;
        float _6600 = _6014 + _6598;
        _6584 = _6600;
    }
    float _6602 = _6584;
    float _6604 = _6580 * _6356;
    float _6606 = _6596 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6608 = _6550;
    float _6610 = _6606;
    if (_6538)
    {
        float _6612 = rint(_6566);
        float _6614 = precise::max(_6612, 0.0);
        uint _6616 = uint(_6614);
        uint _6618 = clamp(_6616, 0u, 65535u);
        _6608 = as_type<float>(_6618);
    }
    float _6620 = _6608;
    float _6622 = _6576 * _6572;
    float _6624 = _6574 * _6572;
    float _6626 = fma(_6622, 0.5, 0.5);
    float _6628 = fma(_6624, -0.5, 0.5);
    float _6630 = _6580;
    if (!_6166)
    {
        float _6632 = rint(_6494);
        float _6634 = precise::max(_6632, 0.0);
        uint _6636 = uint(_6634);
        uint _6638 = clamp(_6636, 0u, 65535u);
        _6630 = as_type<float>(_6638);
    }
    float _6640 = _6630;
    float _6642 = _6594;
    if (!_6166)
    {
        float _6644 = -_6594;
        float _6646 = _6058 + _6644;
        _6642 = _6646;
    }
    float _6648 = _6642;
    float _6650 = _6508;
    if (_6538)
    {
        float3 _17238 = float3(_6476, _6508, float(as_type<int>(_6620)));
        float3 _17242 = select(_17238, float3(0.0), isnan(_17238));
        float _6652 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _17242.xy, uint(rint(_17242.z)), _6604, level(0.0));
        _6650 = _6652;
    }
    float _6654 = _6650;
    float3 _17252 = float3(_6626, _6628, _6606);
    float _6656 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_17252, float3(0.0), isnan(_17252)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_17252, float3(0.0), isnan(_17252)), level(0.0)).x;
    float3 _17261 = float3(_6626, _6628, _6606);
    float4 _6659 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_17261, float3(0.0), isnan(_17261)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_17261, float3(0.0), isnan(_17261)), level(0.0)).xyzw;
    float _6661 = _6659.x;
    float _6663 = _6659.y;
    float _6665 = _6659.z;
    float _6667 = _6659.w;
    float _6669 = _6602;
    if (!_6166)
    {
        float3 _17284 = float3(_6602, _6648, float(as_type<int>(_6640)));
        float3 _17286 = select(_17284, float3(0.0), isnan(_17284));
        float _6671 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _17286.xy, uint(rint(_17286.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _17286.xy, uint(rint(_17286.z)), level(0.0)).x;
        _6669 = _6671;
    }
    float _6673 = _6669;
    if (_6166)
    {
        _6586 = 1.0;
    }
    float _6675 = _6586;
    float _6677 = _6675;
    float _6679 = _6663;
    float _6681 = _6661;
    if (!_6166)
    {
        int _6683 = _6346 << 4;
        int _6685 = _6683 + 2048;
        uint _6687 = uint(int(uint(_6685) >> uint(2)));
        uint _6689 = uint(int(uint(int(_6687)) >> uint(2)));
        int _6691 = int(_6687) & 3;
        float _6693 = (*spvDescriptorSet0.vp_c15)._m0[int(_6689)][_6691];
        int _6695 = int(_6687) + 1;
        uint _6697 = uint(int(uint(_6695) >> uint(2)));
        int _6699 = _6695 & 3;
        float _6701 = (*spvDescriptorSet0.vp_c15)._m0[int(_6697)][_6699];
        int _6703 = _6685 + 8;
        uint _6705 = uint(int(uint(_6703) >> uint(2)));
        uint _6707 = uint(int(uint(int(_6705)) >> uint(2)));
        int _6709 = int(_6705) & 3;
        float _6711 = (*spvDescriptorSet0.vp_c15)._m0[int(_6707)][_6709];
        int _6713 = int(_6705) + 1;
        uint _6715 = uint(int(uint(_6713) >> uint(2)));
        int _6717 = _6713 & 3;
        float _6719 = (*spvDescriptorSet0.vp_c15)._m0[int(_6715)][_6717];
        float _6721 = _6004 * _6701;
        float _6723 = fma(_5280, _6693, _6721);
        float _6725 = fma(_5290, _6711, _6723);
        float _6727 = _6725 + _6719;
        float _6729 = precise::clamp(_6727, 0.0, 1.0);
        float _6731 = -_6729;
        float _6733 = _6731 + _6673;
        float _6735 = fma(_6733, 500.0, 1.5);
        float _6737 = exp2(_6735);
        float _6739 = 0.0 + _6737;
        float _6741 = precise::clamp(_6739, 0.0, 1.0);
        _6677 = _6741;
    }
    float _6743 = _6677;
    float _6745 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6747 = _6436 + _6745;
    float _6749 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6751 = _6438 + _6749;
    float _6753 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6755 = _6440 + _6753;
    float _6757 = _6747 * _6747;
    float _6759 = fma(_6751, _6751, _6757);
    float _6761 = fma(_6755, _6755, _6759);
    float _6763 = rsqrt(_6761);
    float _6765 = _6763 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6767 = _6751 * _6765;
    float _6769 = _6755 * _6765;
    float _6771 = _6767 * _6767;
    float _6773 = _6769 * _6769;
    float _6775 = _6771 + _6773;
    float _6777 = sqrt(_6775);
    bool _6779 = _6777 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6781 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6783 = _6777 + _6781;
    float _6785 = _6759;
    float _6787 = _6763;
    float _6789 = _6783;
    float _6791 = _6747;
    float _6793 = _6765;
    if (_6779)
    {
        float _6795 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6785 = _6795;
    }
    float _6797 = _6785;
    if (_6779)
    {
        float _6799 = rsqrt(_6775);
        _6787 = _6799;
    }
    float _6801 = _6787;
    float _6803 = _6797;
    float _6805 = _6801;
    if (_6779)
    {
        float _6807 = _6783 * _6797;
        _6789 = _6807;
    }
    float _6809 = _6789;
    if (_6779)
    {
        float _6811 = _6809 * 0.15915493667125701904296875;
        _6803 = _6811;
    }
    float _6813 = _6803;
    float _6815 = _6755;
    float _6817 = _6813;
    if (_6779)
    {
        float _6819 = _6813 * 6.283185482025146484375;
        float _6821 = sin(_6819);
        _6815 = _6821;
    }
    float _6823 = _6815;
    float _6825 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6827 = precise::max(0.0, _6825);
    float _6829 = _6673;
    float _6831 = _6827;
    if (_6779)
    {
        float _6833 = _6813 * 6.283185482025146484375;
        float _6835 = cos(_6833);
        _6829 = _6835;
    }
    float _6837 = _6829;
    float _6839 = -_6765;
    float _6841 = -_6827;
    float _6843 = fma(_6747, _6839, _6841);
    if (_6779)
    {
        float _6845 = _6843 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6791 = _6845;
    }
    float _6847 = _6791;
    float _6849 = _6847;
    if (!_6779)
    {
        _6817 = _6771;
    }
    float _6851 = _6817;
    float _6853 = _6823;
    float _6855 = _6851;
    if (_6779)
    {
        float _6857 = fma(_6823, _6847, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6849 = _6857;
    }
    float _6859 = _6849;
    float _6861 = _6859;
    if (!_6779)
    {
        _6853 = _6843;
    }
    float _6863 = _6853;
    float _6865 = _6863;
    float _6867 = _6837;
    if (_6779)
    {
        float _6869 = _6837 + (-1.0);
        _6831 = _6869;
    }
    float _6871 = _6831;
    if (_6779)
    {
        float _6873 = _6801 * _6859;
        _6610 = _6873;
    }
    float _6875 = _6610;
    if (!_6779)
    {
        _6805 = _6767;
    }
    float _6877 = _6805;
    float _6879 = _6877;
    if (_6779)
    {
        float _6881 = _6871 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6793 = _6881;
    }
    float _6883 = _6793;
    if (_6779)
    {
        float _6885 = _6767 * _6875;
        _6879 = _6885;
    }
    float _6887 = _6879;
    if (!_6779)
    {
        _6861 = _6769;
    }
    float _6889 = _6861;
    float _6891 = _6889;
    if (_6779)
    {
        float _6893 = _6769 * _6875;
        _6891 = _6893;
    }
    float _6895 = _6891;
    if (_6779)
    {
        float _6897 = fma(_6843, _6837, _6883);
        _6865 = _6897;
    }
    float _6899 = _6865;
    if (_6779)
    {
        float _6901 = _6887 * _6887;
        _6855 = _6901;
    }
    float _6903 = _6855;
    if (!_6779)
    {
        _6867 = _6773;
    }
    float _6905 = _6867;
    float _6907 = _6905;
    if (_6779)
    {
        float _6909 = _6895 * _6895;
        _6907 = _6909;
    }
    float _6911 = _6907;
    float _6913 = sqrt(_6761);
    float _6915 = fma(_6899, _6899, _6903);
    float _6917 = _6915 + _6911;
    float _6919 = rsqrt(_6917);
    float _6921 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6923 = fma(_6913, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6921);
    float _6925 = precise::clamp(_6923, 0.0, 1.0);
    float _6927 = -_6925;
    float _6929 = _6927 + 1.0;
    float _6931 = abs(_6929);
    float _6933 = log2(_6931);
    float _6935 = _6919 * _6887;
    float _6937 = _6919 * _6899;
    float _6939 = _6919 * _6895;
    float _6941 = _6935 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6943 = -_6941;
    float _6945 = fma(_6937, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6943);
    float _6947 = -_6939;
    float _6949 = fma(_6947, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6945);
    float _6951 = _6933 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6953 = fma(_6949, -0.5, 0.5);
    float _6955 = exp2(_6951);
    float _6957 = fma(_6949, 0.5, 0.5);
    float _6959 = _6937 + 1.0;
    float _6961 = fma(_6957, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6963 = sqrt(_6953);
    float _6965 = fma(_6957, _6961, -0.212114393711090087890625);
    float _6967 = fma(_6957, _6965, 1.570728778839111328125);
    float _6969 = -_6937;
    float _6971 = fma(_6955, _6959, _6969);
    float _6973 = fma(_6971, 0.5, 0.5);
    float _6975 = _6963 * 0.636619746685028076171875;
    float _6977 = -_6967;
    float _6979 = fma(_6975, _6977, 1.0);
    float2 _17760 = float2(_6979, _6973);
    float3 _6981 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_17760, float2(0.0), isnan(_17760)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_17760, float2(0.0), isnan(_17760)), level(0.0)).xyz;
    float _6983 = _6981.x;
    float _6985 = _6981.y;
    float _6987 = _6981.z;
    float _6989 = abs(_6018);
    float _6991 = log2(_6989);
    float _6993 = _6933 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6995 = _6506 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _6997 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _6999 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _7001 = _6997 || _6999;
    bool _7003 = isnan(0.5);
    bool _7005 = _7001 || _7003;
    float _7007 = -_5952;
    float _7009 = _7007 + 1.0;
    float _7011 = exp2(_6993);
    float _7013 = fma(_6518, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6995);
    bool _7015 = _6018 <= 8000.0;
    bool _7017 = isnan(_6018);
    bool _7019 = _7015 || _7017;
    bool _7021 = isnan(8000.0);
    bool _7023 = _7019 || _7021;
    float _7025 = float(_7023);
    float _7027 = _6991 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _7029 = _6951;
    float _7031 = _7013;
    if (!_7005)
    {
        _7029 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _7033 = _7029;
    float _7035 = exp2(_7027);
    float _7037 = _7033;
    if (!_7005)
    {
        float _7039 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7041 = _7033 + _7039;
        _7037 = _7041;
    }
    float _7043 = _7037;
    float _7045 = -_7011;
    float _7047 = _7045 + 1.0;
    float _7049 = _6771;
    if (!_7005)
    {
        float _7051 = 1.0 / _7043;
        _7049 = _7051;
    }
    float _7053 = _7049;
    float _7055 = fma(_7035, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _7057 = precise::clamp(_7055, 0.0, 1.0);
    float _7059 = fma(_6522, (*spvDescriptorSet0.vp_c8)._m0[6].z, _7013);
    if (_7005)
    {
        _7031 = 1.0;
    }
    float _7061 = _7031;
    float _7063 = fma(_7057, -2.0, 3.0);
    float _7065 = _7057 * _7057;
    float _7067 = fma(_6540, (*spvDescriptorSet0.vp_c8)._m0[6].w, _7059);
    float _7069 = _7065 * _7063;
    float _7071 = _7067 + _6552;
    out.gl_Position.x = _6576;
    out.gl_Position.y = _6574;
    out.gl_Position.z = _7067;
    out.gl_Position.w = _6552;
    float _7073 = -_7069;
    float _7075 = _7073 + 1.0;
    float _7077 = _7071 * 0.5;
    float _7079 = fma(_7075, (*spvDescriptorSet0.vp_c15)._m0[654].w, _7069);
    float _7081 = _7069;
    float _7083 = _7061;
    if (!_7005)
    {
        float _7085 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _7087 = _6018 + _7085;
        _7081 = _7087;
    }
    float _7089 = _7081;
    float _7091 = _6552 * 0.5;
    float _7093 = _6576 + _6552;
    float _7095 = _7025 * _7079;
    float _7097 = _7089;
    if (!_7005)
    {
        float _7099 = _7089 * _7053;
        float _7101 = precise::clamp(_7099, 0.0, 1.0);
        _7083 = _7101;
    }
    float _7103 = _7083;
    float _7105 = fma(_6574, -0.5, _7091);
    if (!_6538)
    {
        _7097 = 1.0;
    }
    float _7107 = _7097;
    float _7109 = _7095 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _7111 = _7107;
    if (_6538)
    {
        bool _7113 = _6654 >= _6604;
        bool _7115 = isnan(_6654);
        bool _7117 = _7113 || _7115;
        bool _7119 = isnan(_6604);
        bool _7121 = _7117 || _7119;
        float _7123 = float(_7121);
        _7111 = _7123;
    }
    float _7125 = _7111;
    float _7127 = _7047 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _7129 = _7093 * 0.5;
    float _7131 = _7009 * _7109;
    float _7133 = precise::clamp(_7131, 0.0, 1.0);
    bool _7135 = _6913 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _7137 = isnan(_6913);
    bool _7139 = _7135 || _7137;
    bool _7141 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _7143 = _7139 || _7141;
    float _7145 = _7127 * _6656;
    float _7147 = _7125 * _6743;
    float _7149 = -_7133;
    float _7151 = fma(_7149, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _7153 = -_7127;
    float _7155 = _7153 + 1.0;
    float _7157 = _6667 * _7145;
    out.m_104.x = _7129;
    out.m_104.y = _7105;
    out.m_104.z = _7077;
    out.m_104.w = _6552;
    float _7159 = -_7147;
    float _7161 = fma(_7159, _7151, 1.0);
    float _7163 = precise::clamp(_7161, 0.0, 1.0);
    float _7165 = _6667 * _7155;
    float _7167 = _7103 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _7169 = _7163 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _7171 = _7163;
    float _7173 = _7145;
    if (!_7143)
    {
        _6588 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _7175 = _6588;
    float _7177 = _7175;
    float _7179 = _7175;
    if (!_7143)
    {
        _6590 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _7181 = _6590;
    out.m_106.x = _7169;
    float _7183 = _7181;
    float _7185 = _7181;
    if (!_7143)
    {
        _7171 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _7187 = _7171;
    float _7189 = _6987 * _7145;
    float _7191 = fma(_6983, _7157, _6661);
    float _7193 = fma(_6985, _7157, _6663);
    float _7195 = _7187;
    float _7197 = _7187;
    if (!_7143)
    {
        _6679 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _7199 = _6679;
    float _7201 = fma(_6667, _7189, _6665);
    float _7203 = _7199;
    float _7205 = _7199;
    if (!_7143)
    {
        _6681 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _7207 = _6681;
    float _7209 = _7207;
    float _7211 = _7207;
    if (!_7143)
    {
        _7173 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _7213 = _7173;
    out.m_108.x = _7191;
    out.m_108.y = _7193;
    out.m_108.z = _7201;
    out.m_108.w = _7165;
    bool _7215 = !_7143;
    float _7217 = _7213;
    float _7219 = _7213;
    if (!_7215)
    {
        bool _7221 = _6913 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _7223 = isnan(_6913);
        bool _7225 = _7221 || _7223;
        bool _7227 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _7229 = _7225 || _7227;
        if (!_7229)
        {
            float _7231 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7233 = _6913 + _7231;
            float _7235 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _7237 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _7235;
            float _7239 = 1.0 / _7237;
            float _7241 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _7243 = _7241 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _7245 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _7247 = _7245 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _7249 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _7251 = _7249 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _7253 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _7255 = _7253 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _7257 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _7259 = _7257 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _7261 = _7233 * _7239;
            float _7263 = precise::clamp(_7261, 0.0, 1.0);
            float _7265 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _7267 = _7265 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _7269 = fma(_7263, _7243, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _7271 = fma(_7263, _7267, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _7273 = fma(_7263, _7247, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _7275 = fma(_7263, _7251, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _7277 = fma(_7263, _7255, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _7279 = fma(_7263, _7259, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _7185 = _7271;
            _7211 = _7277;
            _7179 = _7269;
            _7205 = _7275;
            _7197 = _7273;
            _7219 = _7279;
            _7281 = true;
        }
        else
        {
            bool _7283 = _6913 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _7285 = isnan(_6913);
            bool _7287 = _7283 || _7285;
            bool _7289 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _7291 = _7287 || _7289;
            if (!_7291)
            {
                _7177 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _7293 = _7177;
            _7179 = _7293;
            if (!_7291)
            {
                _7183 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _7295 = _7183;
            _7185 = _7295;
            if (!_7291)
            {
                _7195 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _7297 = _7195;
            _7197 = _7297;
            if (!_7291)
            {
                _7203 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _7299 = _7203;
            _7205 = _7299;
            if (!_7291)
            {
                _7209 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _7301 = _7209;
            _7211 = _7301;
            if (!_7291)
            {
                _7217 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _7303 = _7217;
            bool _7305 = !_7291;
            _7219 = _7303;
            if (!_7305)
            {
                bool _7307 = _6913 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _7309 = isnan(_6913);
                bool _7311 = _7307 || _7309;
                bool _7313 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _7315 = _7311 || _7313;
                if (!_7315)
                {
                    float _7317 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7319 = _6913 + _7317;
                    float _7321 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _7323 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _7321;
                    float _7325 = 1.0 / _7323;
                    float _7327 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _7329 = _7327 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _7331 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _7333 = _7331 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _7335 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _7337 = _7335 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _7339 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _7341 = _7339 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _7343 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _7345 = _7343 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _7347 = _7319 * _7325;
                    float _7349 = precise::clamp(_7347, 0.0, 1.0);
                    float _7351 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _7353 = _7351 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _7355 = fma(_7349, _7329, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _7357 = fma(_7349, _7353, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _7359 = fma(_7349, _7333, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _7361 = fma(_7349, _7337, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _7363 = fma(_7349, _7341, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _7365 = fma(_7349, _7345, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _7185 = _7357;
                    _7211 = _7363;
                    _7179 = _7355;
                    _7205 = _7361;
                    _7197 = _7359;
                    _7219 = _7365;
                    _7281 = true;
                }
                else
                {
                    _7185 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _7211 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _7179 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _7205 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _7197 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _7219 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _7281 = false;
    float _7367 = _7185;
    float _7369 = _7211;
    float _7371 = _7179;
    float _7373 = _7205;
    float _7375 = _7197;
    float _7377 = _7219;
    float _7379 = fma(_5850, -0.5, 0.5);
    float _7381 = precise::clamp(_7379, 0.0, 1.0);
    float _7383 = -_7367;
    float _7385 = _7383 + _7369;
    float _7387 = _7167 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _7389 = -_7371;
    float _7391 = _7389 + _7373;
    out.m_110.x = 0.0;
    float _7393 = fma(_7381, _7385, _7367);
    float _7395 = fma(_7381, _7391, _7371);
    out.m_63.x = _7387;
    float _7397 = -_7375;
    float _7399 = _7397 + _7377;
    float _7401 = _7393 * 0.586610972881317138671875;
    bool _7403 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _7405 = fma(_7381, _7399, _7375);
    float _7407 = fma(_7395, 0.298911988735198974609375, _7401);
    bool _7409 = _7103 > 0.0;
    bool _7411 = isnan(_7103);
    bool _7413 = _7409 || _7411;
    bool _7415 = isnan(0.0);
    bool _7417 = _7413 || _7415;
    float _7419 = fma(_7405, 0.114477999508380889892578125, _7407);
    float _7421 = -_7419;
    float _7423 = _7395 + _7421;
    float _7425 = -_7419;
    float _7427 = _7393 + _7425;
    float _7429 = -_7419;
    float _7431 = _7405 + _7429;
    float _7433 = fma(_7423, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7419);
    float _7435 = fma(_7427, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7419);
    float _7437 = fma(_7431, (*spvDescriptorSet0.vp_c13)._m0[1].z, _7419);
    bool _7439 = !_7403;
    if (!_7439)
    {
        float _7441 = -_6436;
        float _7443 = _7441 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _7445 = -_6438;
        float _7447 = _7445 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _7449 = -_6440;
        float _7451 = _7449 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _7453 = _7443 * _7443;
        float _7455 = fma(_7447, _7447, _7453);
        float _7457 = fma(_7451, _7451, _7455);
        float _7459 = sqrt(_7457);
        float _7461 = rsqrt(_7457);
        float _7463 = -_7459;
        float _7465 = _7463 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _7467 = _7465 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _7469 = precise::clamp(_7467, 0.0, 1.0);
        float _7471 = _7447 * _7461;
        float _7473 = _7443 * _7461;
        float _7475 = abs(_7469);
        float _7477 = log2(_7475);
        float _7479 = _7451 * _7461;
        float _7481 = _7471 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _7483 = _5850 * _7473;
        float _7485 = -_7473;
        float _7487 = -_7481;
        float _7489 = fma(_7485, (*spvDescriptorSet0.vp_c15)._m0[656].y, _7487);
        float _7491 = fma(_5854, _7471, _7483);
        float _7493 = -_7479;
        float _7495 = fma(_7493, (*spvDescriptorSet0.vp_c15)._m0[656].z, _7489);
        float _7497 = fma(_5856, _7479, _7491);
        float _7499 = precise::clamp(_7497, 0.0, 1.0);
        float _7501 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _7503 = _7495 + _7501;
        float _7505 = _7477 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _7507 = _7503 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _7509 = precise::clamp(_7507, 0.0, 1.0);
        float _7511 = exp2(_7505);
        float _7513 = _7511 * _7509;
        float _7515 = _7499 * _7513;
        float _7517 = _7515 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _7519 = _7515 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _7521 = _7515 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_110.x = _7517;
        out.m_110.y = _7519;
        out.m_110.z = _7521;
    }
    out.m_112.x = _7433;
    out.m_112.y = _7435;
    out.m_112.z = _7437;
    if (_7417)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _7523 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _7523;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

