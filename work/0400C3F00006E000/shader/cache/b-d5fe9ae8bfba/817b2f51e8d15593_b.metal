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
    bool _5317 = false;
    bool _3968 = false;
    bool _489 = false;
    bool _345 = false;
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
        float _5628 = as_type<float>(_149);
        out.gl_Position.z = _5628;
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
        float _5691 = as_type<float>(_181);
        out.gl_Position.z = _5691;
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
    float _325 = _319;
    float _343;
    if (!_323)
    {
        float _327 = in.m_72.x;
        float _329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _331 = _327 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _335 = _333 * _329;
        float _337 = floor(_335);
        float _339 = -_337;
        float _341 = _335 + _339;
        _343 = _341;
        _345 = true;
    }
    else
    {
        _343 = _175;
    }
    _345 = false;
    float _347 = _343;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _351 = _347 + _349;
    float _353 = in.m_74.x;
    float _355 = in.m_74.y;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _361 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _363 = isnan(_347);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _377 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _379 = isnan(_347);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _389;
    bool _393 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _395 = isnan(_347);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = 1.0 / _359;
    float _407 = -_371;
    float _409 = _407 + 1.0;
    bool _411 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _413 = 1.0 / _375;
    float _415 = _391 * _405;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _421 = -_403;
    float _423 = _421 + 1.0;
    float _425 = _319 * _353;
    float _427 = fma(_415, _351, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _429 = _387 * _409;
    float _431 = -_387;
    float _433 = _431 + 1.0;
    float _435 = _371 * _423;
    float _437 = _419 * _413;
    float _439 = _427 * _429;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _443 = _347 + _441;
    float _445 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[115].x, _439);
    float _447 = fma(_437, _443, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _451 = fma(_447, _435, _445);
    float _453 = _321 * _355;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _457 = _449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _459 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[117].x, _451);
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _459 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _467 = _461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_76.x = _457;
    out.m_76.y = _463;
    out.m_76.z = _467;
    out.m_76.w = _465;
    bool _469 = !_411;
    float _487;
    if (!_469)
    {
        float _471 = in.m_72.x;
        float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _475 = _471 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _477 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _479 = _477 * _473;
        float _481 = floor(_479);
        float _483 = -_481;
        float _485 = _479 + _483;
        _487 = _485;
        _489 = true;
    }
    else
    {
        _487 = _175;
    }
    _489 = false;
    float _491 = _487;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _495 = _491 + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _501 = _491 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _503 = isnan(_491);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _517 = _491 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _519 = isnan(_491);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _529;
    bool _533 = _491 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _535 = isnan(_491);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = 1.0 / _499;
    float _547 = -_511;
    float _549 = _547 + 1.0;
    bool _551 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _553 = 1.0 / _515;
    float _555 = _531 * _545;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _561 = -_543;
    float _563 = _561 + 1.0;
    float _565 = fma(_555, _495, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _567 = _527 * _549;
    float _569 = -_527;
    float _571 = _569 + 1.0;
    float _573 = _511 * _563;
    float _575 = _559 * _553;
    float _577 = _565 * _567;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _581 = _491 + _579;
    float _583 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[131].x, _577);
    float _585 = fma(_575, _581, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _589 = fma(_585, _573, _583);
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _593 = _587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _597 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[133].x, _589);
    float _599 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = _597 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _593;
    out.m_78.y = _599;
    out.m_78.z = _601;
    out.m_78.w = _603;
    bool _605 = !_551;
    if (!_605)
    {
        float _607 = in.m_72.x;
        float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _611 = _607 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _615 = _613 * _609;
        float _617 = floor(_615);
        float _619 = -_617;
        float _621 = _615 + _619;
        _177 = _621;
    }
    float _623 = _177;
    float _625 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _627 = int(_625);
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _631 = _629 != 0;
    float _633 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _635 = int(_633);
    float _637 = float(_627);
    float _639 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _641 = int(_639);
    if (_631)
    {
        _325 = 1.0;
    }
    float _643 = _325;
    float _645 = float(_635);
    float _647 = 1.0 / _637;
    float _649 = 1.0 / _645;
    float _651 = float(uint(_641));
    int _653 = ~_641;
    int _655 = _653 + 1;
    float _657 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _659 = int(_657);
    float _661 = _647 * _131;
    float _663 = _645;
    float _665 = _647;
    float _667 = _643;
    if (_631)
    {
        float _669 = in.m_72.x;
        float _671 = in.m_72.y;
        _663 = _669;
        _665 = _671;
    }
    float _673 = _663;
    float _675 = _665;
    float _677 = _649 * _131;
    float _679 = 1.0 / _651;
    float _681 = float(uint(_659));
    float _683 = trunc(_677);
    int _685 = int(_683);
    float _687 = 1.0 / _681;
    int _689 = as_type<int>(_679) + (-2);
    int _691 = as_type<int>(_679);
    if (_631)
    {
        _691 = 0;
    }
    int _693 = _691;
    float _695 = 0.0;
    float _697 = _673;
    float _699 = _675;
    int _701 = _693;
    if (_631)
    {
        _695 = _675;
    }
    float _703 = _695;
    float _705 = trunc(_661);
    int _707 = int(_705);
    float _709 = float(uint(_685));
    float _711 = as_type<float>(_689) * _709;
    float _713 = _709;
    float _715 = _703;
    if (_631)
    {
        _713 = _673;
    }
    float _717 = _713;
    float _719 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _721 = int(_719);
    int _723 = as_type<int>(_687) + (-2);
    float _725 = 0.0;
    float _727 = _717;
    if (_631)
    {
        _725 = _717;
    }
    float _729 = _725;
    float _731 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _733 = int(_731);
    float _735 = float(uint(_707));
    float _737 = as_type<float>(_723) * _735;
    float _739 = _735;
    float _741 = _729;
    if (_631)
    {
        _739 = 1.0;
    }
    float _743 = _739;
    float _745 = trunc(_711);
    float _747 = precise::max(_745, 0.0);
    uint _750 = uint(_747);
    float _752 = float(uint(_721));
    float _754 = trunc(_737);
    float _756 = precise::max(_754, 0.0);
    uint _758 = uint(_756);
    float _760 = float(_733);
    float _762 = 1.0 / _760;
    float _764 = 1.0 / _752;
    float _766 = _760;
    int _768 = as_type<int>(_752);
    float _770 = _743;
    if (_631)
    {
        _766 = _717;
    }
    float _772 = _766;
    float _774 = _772;
    if (_631)
    {
        _768 = 0;
    }
    int _776 = _768;
    int _778 = _776;
    if (!_631)
    {
        float _780 = in.m_72.x;
        float _782 = in.m_72.y;
        float _784 = in.m_72.z;
        float _786 = _780 * 3.1415927410125732421875;
        float _788 = _786 * 0.15915493667125701904296875;
        float _790 = _782 * 3.1415927410125732421875;
        float _792 = _790 * 0.15915493667125701904296875;
        float _794 = _788 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = _792 * 6.283185482025146484375;
        float _800 = sin(_798);
        _667 = 7.345489978790283203125;
        _697 = _780;
        _770 = 5.839270114898681640625;
        _774 = _784;
        _727 = _782;
        _699 = _782;
        _701 = 1;
        _715 = _800;
        _778 = 2;
        _741 = _796;
    }
    float _802 = _667;
    float _804 = _697;
    float _806 = _770;
    float _808 = _774;
    float _810 = _727;
    float _812 = _699;
    int _814 = _701;
    float _816 = _715;
    int _818 = _778;
    float _820 = _741;
    int _822 = _655 * int(_750);
    int _824 = _822 + _685;
    int _826 = ~_659;
    int _828 = _826 + 1;
    float _830 = _762 * _131;
    float _832 = _802 * _804;
    float _834 = in.m_72.z;
    float _836 = in.m_72.w;
    float _838 = _806 * _808;
    float _840 = float(uint(_824));
    int _842 = _828 * int(_758);
    int _844 = _842 + _707;
    float _846 = floor(_832);
    float _848 = float(_641);
    float _850 = _802 * _810;
    float _852 = as_type<float>(_689) * _840;
    float _854 = float(uint(_844));
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _858 = _623 + _856;
    float _860 = float(_685);
    float _862 = _812 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _864 = trunc(_830);
    int _866 = int(_864);
    float _868 = as_type<float>(_723) * _854;
    bool _870 = _860 >= _848;
    bool _872 = isnan(_860);
    bool _874 = _870 || _872;
    bool _876 = isnan(_848);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = _804 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _884 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _886 = as_type<int>(_764) + (-2);
    float _888 = trunc(_852);
    float _890 = precise::max(_888, 0.0);
    uint _892 = uint(_890);
    float _894 = -_846;
    float _896 = _832 + _894;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _900 = _898 != 0;
    bool _902 = _836 > 0.5;
    bool _904 = _834 > 0.5;
    float _906 = floor(_838);
    float _908 = float(uint(_866));
    bool _910 = _812 > 0.5;
    int _912 = ~_641;
    int _914 = _912 + 1;
    float _916 = as_type<float>(_886) * _908;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _928 = _926 != 0;
    float _930 = trunc(_868);
    float _932 = precise::max(_930, 0.0);
    uint _934 = uint(_932);
    int _936 = int(_750) + int(_892);
    int _938 = ~_659;
    int _940 = _938 + 1;
    float _942 = -_221;
    int _944 = _910 ? as_type<int>(_942) : as_type<int>(_221);
    float _946 = -_906;
    float _948 = _838 + _946;
    float _950 = -_225;
    int _952 = _904 ? as_type<int>(_950) : as_type<int>(_225);
    float _954 = trunc(_916);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    int _960 = _914 * _936;
    int _962 = _960 + _685;
    bool _964 = !_928;
    float _966 = _964 ? _225 : as_type<float>(_952);
    float _968 = _896 * _848;
    int _970 = int(_758) + int(_934);
    float _972 = floor(_850);
    int _974 = int(_902);
    int _976 = _904 ? 2 : 0;
    int _978 = _974 | _976;
    int _980 = _900 ? 4 : 0;
    int _982 = _978 | _980;
    int _984 = _920 ? 8 : 0;
    int _986 = _982 | _984;
    int _988 = _924 ? 16 : 0;
    int _990 = _986 | _988;
    int _992 = _928 ? 32 : 0;
    int _994 = _990 | _992;
    int _996 = _910 ? 64 : 0;
    int _998 = _994 | _996;
    int _1000 = _998 & 64;
    bool _1002 = !_924;
    float _1004 = _1002 ? _221 : as_type<float>(_944);
    int _1006 = _940 * _970;
    int _1008 = _1006 + _707;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1012 = _1010 != 0;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1016 = _1014 != 0;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1020 = _1018 != 0;
    bool _1022 = !_900;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = trunc(_968);
    int _1028 = int(_1026);
    float _1030 = float(_659);
    float _1032 = float(_707);
    bool _1034 = uint(_962) >= uint(_641);
    float _1036 = _948 * _1030;
    int _1038 = ~_721;
    int _1040 = _1038 + 1;
    float _1042 = trunc(_880);
    int _1044 = int(_1042);
    bool _1046 = !_1016;
    int _1048 = _1046 ? 0 : 1;
    bool _1050 = !_1012;
    int _1052 = _1050 ? 0 : 1;
    int _1054 = _1040 * int(_958);
    int _1056 = _1054 + _866;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1060 = _1058 != 0;
    bool _1062 = uint(_1008) >= uint(_659);
    float _1064 = trunc(_1036);
    int _1066 = int(_1064);
    bool _1068 = _1032 >= _1030;
    bool _1070 = isnan(_1032);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(_1030);
    bool _1076 = _1072 || _1074;
    float _1078 = float(_1076);
    bool _1080 = !_1020;
    int _1082 = _1080 ? 0 : 1;
    bool _1084 = !_1060;
    int _1086 = _1084 ? 0 : 1;
    bool _1088 = !_1062;
    int _1090 = _1088 ? 0 : (-1);
    float _1092 = trunc(_1078);
    int _1094 = int(_1092);
    bool _1096 = !_1034;
    int _1098 = _1096 ? 0 : (-1);
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1110 = _1108 != 0;
    int _1112 = abs(_1024);
    int _1114 = ~_936;
    int _1116 = _1114 + _1098;
    int _1118 = _1116 + 1;
    float _1120 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1122 = log2(_1120);
    float _1124 = -_972;
    float _1126 = _850 + _1124;
    float _1128 = float(uint(_1056));
    int _1130 = _1028 * _1112;
    int _1132 = _1130 + _685;
    bool _1134 = !_1106;
    int _1136 = _1134 ? 0 : 1;
    int _1138 = _641 * _1118;
    int _1140 = _1138 + _685;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1144 = _1142 != 0;
    float _1146 = as_type<float>(_886) * _1128;
    bool _1148 = _1000 != 0;
    float _1150 = _171 * _131;
    int _1152 = ~_970;
    int _1154 = _1152 + _1090;
    int _1156 = _1154 + 1;
    bool _1158 = !_1144;
    int _1160 = _1158 ? 0 : 1;
    float _1162 = _848 * _1150;
    bool _1164 = _641 == 0;
    int _1166 = _659 * _1156;
    int _1168 = _1166 + _707;
    bool _1170 = !_1102;
    int _1172 = _1170 ? 0 : 1;
    float _1174 = trunc(_1146);
    float _1176 = precise::max(_1174, 0.0);
    uint _1178 = uint(_1176);
    bool _1180 = _659 == 0;
    float _1182 = _1030 * _1150;
    int _1184 = ~_1044;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    bool _1190 = !_1164;
    int _1192 = _1190 ? _1140 : (-1);
    int _1194 = ~_1094;
    int _1196 = _1194 + 1;
    int _1198 = _1196 + 1;
    float _1200 = trunc(_1162);
    int _1202 = int(_1200);
    bool _1204 = !_1180;
    int _1206 = _1204 ? _1168 : (-1);
    int _1208 = _1192 * _1188;
    int _1210 = _641 + (-1);
    int _1212 = abs(_1048);
    int _1214 = _1206 * _1198;
    int _1216 = _659 + (-1);
    int _1218 = _1044 * _1210;
    int _1220 = _1218 + _1208;
    int _1222 = abs(_1136);
    float _1224 = trunc(_1182);
    int _1226 = int(_1224);
    int _1228 = abs(_1052);
    int _1230 = _1094 * _1216;
    int _1232 = _1230 + _1214;
    int _1234 = _1220 * _1212;
    int _1236 = abs(_1160);
    float _1238 = _804 * 2.0;
    int _1240 = ~_721;
    int _1242 = _1240 + 1;
    int _1244 = _1232 * _1222;
    int _1246 = abs(_1082);
    int _1248 = _1202 * _1228;
    int _1250 = _1248 + _1234;
    int _1252 = abs(_1086);
    int _1254 = _1066 * _1236;
    int _1256 = _1254 + _707;
    int _1258 = int(_958) + int(_1178);
    int _1260 = _1132 * _1246;
    int _1262 = _1260 + _1250;
    float _1264 = floor(_1238);
    int _1266 = abs(_1172);
    int _1268 = _1242 * _1258;
    int _1270 = _1268 + _866;
    float _1272 = -_225;
    int _1274 = _902 ? as_type<int>(_1272) : as_type<int>(_225);
    int _1276 = _1028 * _1252;
    int _1278 = _1276 + _1262;
    float _1280 = -_221;
    int _1282 = _904 ? as_type<int>(_1280) : as_type<int>(_221);
    int _1284 = _1226 * _1266;
    int _1286 = _1284 + _1244;
    bool _1288 = uint(_1270) >= uint(_721);
    float _1290 = float(_721);
    float _1292 = float(_866);
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1296 = _1294 != 0;
    float _1298 = _1290 * _1150;
    bool _1300 = !_1110;
    int _1302 = _1300 ? 0 : 1;
    float _1304 = float(uint(_1278));
    bool _1306 = _1292 >= _1290;
    bool _1308 = isnan(_1292);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan(_1290);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = _1126 * _1290;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1322 = _1320 != 0;
    float _1324 = as_type<float>(_689) * _1304;
    bool _1326 = !_1296;
    int _1328 = _1326 ? 0 : 1;
    float _1330 = trunc(_1298);
    int _1332 = int(_1330);
    int _1334 = abs(_1302);
    bool _1336 = !_920;
    float _1338 = _1336 ? _225 : as_type<float>(_1274);
    bool _1340 = !_1322;
    int _1342 = _1340 ? 0 : 1;
    int _1344 = abs(_1328);
    float _1346 = trunc(_1324);
    float _1348 = precise::max(_1346, 0.0);
    uint _1350 = uint(_1348);
    bool _1352 = !_1288;
    int _1354 = _1352 ? 0 : (-1);
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1370 = _1368 != 0;
    int _1372 = _1256 * _1334;
    int _1374 = _1372 + _1286;
    float _1376 = trunc(_1316);
    int _1378 = int(_1376);
    int _1380 = ~_641;
    int _1382 = _1380 + 1;
    bool _1384 = !_1362;
    int _1386 = _1384 ? 0 : 1;
    int _1388 = _1066 * _1344;
    int _1390 = _1388 + _1374;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1394 = _1392 != 0;
    int _1396 = ~_1258;
    int _1398 = _1396 + _1354;
    int _1400 = _1398 + 1;
    int _1402 = _1382 * int(_1350);
    int _1404 = _1402 + _1278;
    float _1406 = float(uint(_1390));
    float _1408 = trunc(_1318);
    int _1410 = int(_1408);
    bool _1412 = !_1358;
    int _1414 = _1412 ? 0 : 1;
    int _1416 = _721 * _1400;
    int _1418 = _1416 + _866;
    bool _1420 = _721 == 0;
    float _1422 = as_type<float>(_723) * _1406;
    float _1424 = float(uint(_1404));
    int _1426 = ~_1378;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    float _1432 = _1406;
    if (_1394)
    {
        float _1434 = in.m_72.w;
        _1432 = _1434;
    }
    float _1436 = _1432;
    bool _1438 = !_1420;
    int _1440 = _1438 ? _1418 : (-1);
    float _1442 = as_type<float>(_689) * _1424;
    float _1444 = trunc(_1422);
    float _1446 = precise::max(_1444, 0.0);
    uint _1448 = uint(_1446);
    int _1450 = abs(_1386);
    int _1452 = _1440 * _1430;
    int _1454 = _721 + (-1);
    int _1456 = abs(_1414);
    float _1458 = trunc(_1442);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    int _1464 = abs(_1342);
    int _1466 = _1378 * _1454;
    int _1468 = _1466 + _1452;
    int _1470 = _1468 * _1450;
    int _1472 = ~_659;
    int _1474 = _1472 + 1;
    bool _1476 = _641 == 0;
    int _1478 = _1332 * _1456;
    int _1480 = _1478 + _1470;
    int _1482 = _1410 * _1464;
    int _1484 = _1482 + _866;
    float _1486 = as_type<float>(_1464);
    if (_1394)
    {
        float _1488 = _1436 * 3.1415927410125732421875;
        _1486 = _1488;
    }
    float _1490 = _1486;
    int _1492 = ~_641;
    int _1494 = _1492 + 1;
    int _1496 = _1474 * int(_1448);
    int _1498 = _1496 + _1390;
    float _1500 = _1490;
    if (_1394)
    {
        float _1502 = _1490 * 0.15915493667125701904296875;
        _1500 = _1502;
    }
    float _1504 = _1500;
    int _1506 = int(_1350) + int(_1462);
    bool _1508 = !_1366;
    int _1510 = _1508 ? 0 : 1;
    float _1512 = float(uint(_1498));
    float _1514 = _1504;
    if (_1394)
    {
        float _1516 = _1504 * 6.283185482025146484375;
        float _1518 = sin(_1516);
        _1514 = _1518;
    }
    float _1520 = _1514;
    int _1522 = _1494 * _1506;
    int _1524 = _1522 + _1278;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1528 = _1526 != 0;
    int _1530 = abs(_1510);
    float _1532 = as_type<float>(_723) * _1512;
    bool _1534 = !_1370;
    int _1536 = _1534 ? 0 : 1;
    bool _1538 = uint(_1524) >= uint(_641);
    int _1540 = _1484 * _1530;
    int _1542 = _1540 + _1480;
    float _1544 = float(uint(_1132));
    float _1546 = trunc(_1532);
    float _1548 = precise::max(_1546, 0.0);
    uint _1550 = uint(_1548);
    int _1552 = abs(_1536);
    bool _1554 = !_1538;
    int _1556 = _1554 ? 0 : (-1);
    float _1558 = as_type<float>(_689) * _1544;
    int _1560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1562 = _1560 != 0;
    int _1564 = _1410 * _1552;
    int _1566 = _1564 + _1542;
    int _1568 = ~_1506;
    int _1570 = _1568 + _1556;
    int _1572 = _1570 + 1;
    float _1574 = as_type<float>(_1452);
    bool _1576 = _1562;
    if (_1528)
    {
        float _1578 = in.m_72.x;
        _1574 = _1578;
    }
    float _1580 = _1574;
    bool _1582 = !_1562;
    float _1584 = _1582 ? _221 : as_type<float>(_1282);
    float _1586 = trunc(_1558);
    float _1588 = precise::max(_1586, 0.0);
    uint _1590 = uint(_1588);
    if (_1394)
    {
        bool _1592 = _1520 > 0.5;
        _1576 = _1592;
    }
    bool _1594 = _1576;
    int _1596 = _641 * _1572;
    int _1598 = _1596 + _1278;
    float _1600 = float(uint(_1566));
    int _1602 = ~_641;
    int _1604 = _1602 + 1;
    bool _1606 = !_1476;
    int _1608 = _1606 ? _1598 : (-1);
    float _1610 = as_type<float>(_886) * _1600;
    float _1612 = 0.0;
    float _1614 = _1600;
    if (!_1394)
    {
        _1612 = _221;
    }
    float _1616 = _1612;
    float _1618 = trunc(_1610);
    float _1620 = precise::max(_1618, 0.0);
    uint _1622 = uint(_1620);
    float _1624 = _1616;
    if (_1394)
    {
        float _1626 = -_221;
        float _1628 = _1594 ? _1626 : _221;
        _1624 = _1628;
    }
    float _1630 = _1624;
    int _1632 = _1608 & 3;
    bool _1634 = _1632 != 0;
    int _1636 = _1604 * int(_1590);
    int _1638 = _1636 + _1132;
    int _1640 = _1608 & 3;
    bool _1642 = _1640 != 0;
    int _1644 = _1634 ? 0 : 1;
    bool _1646 = uint(_1640) > 1u;
    if (_1528)
    {
        float _1648 = _1580 * 3.1415927410125732421875;
        _1614 = _1648;
    }
    float _1650 = _1614;
    int _1652 = int(_1448) + int(_1550);
    float _1654 = float(uint(_1256));
    float _1656 = _1650;
    if (_1528)
    {
        float _1658 = _1650 * 0.15915493667125701904296875;
        _1656 = _1658;
    }
    float _1660 = _1656;
    float _1662 = float(uint(_1638));
    int _1664 = ~_721;
    int _1666 = _1664 + 1;
    float _1668 = as_type<float>(_723) * _1654;
    int _1670 = ~_659;
    int _1672 = _1670 + 1;
    float _1674 = as_type<float>(_689) * _1662;
    int _1676 = ~_1644;
    int _1678 = _1676 + 1;
    int _1680 = _1678 + 1;
    int _1682 = _1666 * int(_1622);
    int _1684 = _1682 + _1566;
    float _1686 = -_225;
    int _1688 = _1148 ? as_type<int>(_1686) : as_type<int>(_225);
    int _1690 = _1672 * _1652;
    int _1692 = _1690 + _1390;
    float _1694 = trunc(_1668);
    float _1696 = precise::max(_1694, 0.0);
    uint _1698 = uint(_1696);
    int _1700 = _1680;
    if (!_1646)
    {
        int _1702 = ~_1644;
        int _1704 = _1702 + 1;
        _1700 = _1704;
    }
    int _1706 = _1700;
    bool _1708 = uint(_1640) >= 2u;
    int _1710 = ~_659;
    int _1712 = _1710 + 1;
    float _1714 = float(uint(_1684));
    float _1716 = _1660;
    if (_1528)
    {
        float _1718 = _1660 * 6.283185482025146484375;
        float _1720 = sin(_1718);
        _1716 = _1720;
    }
    float _1722 = _1716;
    bool _1724 = uint(_1692) >= uint(_659);
    int _1726 = _1708 ? 0 : 1;
    float _1728 = as_type<float>(_886) * _1714;
    bool _1730 = _1640 != 3;
    float _1732 = trunc(_1674);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    bool _1738 = !_1724;
    int _1740 = _1738 ? 0 : (-1);
    int _1742 = _1712 * int(_1698);
    int _1744 = _1742 + _1256;
    int _1746 = ~_1726;
    int _1748 = _1746 + 1;
    int _1750 = _1748 + 1;
    int _1752 = ~_1652;
    int _1754 = _1752 + _1740;
    int _1756 = _1754 + 1;
    float _1758 = trunc(_1728);
    float _1760 = precise::max(_1758, 0.0);
    uint _1762 = uint(_1760);
    float _1764 = float(uint(_1744));
    int _1766 = _659 * _1756;
    int _1768 = _1766 + _1390;
    float _1770 = 0.0;
    int _1772 = _1750;
    bool _1774 = _1730;
    if (!_1528)
    {
        _1770 = _225;
    }
    float _1776 = _1770;
    float _1778 = _1776;
    if (_1730)
    {
        int _1780 = ~_1726;
        int _1782 = _1780 + 1;
        _1772 = _1782;
    }
    int _1784 = _1772;
    float _1786 = as_type<float>(_723) * _1764;
    if (_1528)
    {
        bool _1788 = _1722 > 0.5;
        _1774 = _1788;
    }
    bool _1790 = _1774;
    bool _1792 = !_1180;
    int _1794 = _1792 ? _1768 : (-1);
    int _1796 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1798 = _1796 != 0;
    float _1800 = trunc(_1786);
    float _1802 = precise::max(_1800, 0.0);
    uint _1804 = uint(_1802);
    if (_1528)
    {
        float _1806 = -_225;
        float _1808 = _1790 ? _1806 : _225;
        _1778 = _1808;
    }
    float _1810 = _1778;
    int _1812 = _1794 & 3;
    bool _1814 = _1812 != 0;
    bool _1816 = !_1798;
    float _1818 = _1816 ? _225 : as_type<float>(_1688);
    float _1820 = _1810 + (-0.5);
    bool _1822 = uint(_1812) > 1u;
    int _1824 = int(_1622) + int(_1762);
    int _1826 = ~_721;
    int _1828 = _1826 + 1;
    int _1830 = _1794 & 3;
    bool _1832 = _1830 != 0;
    int _1834 = int(_1590) + int(_1736);
    int _1836 = _1828 * _1824;
    int _1838 = _1836 + _1566;
    int _1840 = ~_641;
    int _1842 = _1840 + 1;
    int _1844 = _1832 ? 0 : 1;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1848 = _1846 != 0;
    int _1850 = _1842 * _1834;
    int _1852 = _1850 + _1132;
    float _1854 = float(uint(_1484));
    bool _1856 = !_1848;
    int _1858 = _1856 ? 0 : 1;
    bool _1860 = uint(_1838) >= uint(_721);
    float _1862 = as_type<float>(_886) * _1854;
    int _1864 = ~_1844;
    int _1866 = _1864 + 1;
    int _1868 = _1866 + 1;
    int _1870 = _1868;
    if (!_1822)
    {
        int _1872 = ~_1844;
        int _1874 = _1872 + 1;
        _1870 = _1874;
    }
    int _1876 = _1870;
    float _1878 = trunc(_1862);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    bool _1884 = uint(_1852) >= uint(_641);
    bool _1886 = !_1860;
    int _1888 = _1886 ? 0 : (-1);
    bool _1890 = _1812 != 3;
    bool _1892 = !_1884;
    int _1894 = _1892 ? 0 : (-1);
    bool _1896 = uint(_1812) >= 2u;
    int _1898 = ~_1824;
    int _1900 = _1898 + _1888;
    int _1902 = _1900 + 1;
    int _1904 = ~_659;
    int _1906 = _1904 + 1;
    int _1908 = int(_1698) + int(_1804);
    int _1910 = _721 * _1902;
    int _1912 = _1910 + _1566;
    int _1914 = _1896 ? 0 : 1;
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1918 = _1916 != 0;
    int _1920 = _1906 * _1908;
    int _1922 = _1920 + _1256;
    int _1924 = ~_721;
    int _1926 = _1924 + 1;
    int _1928 = ~_1914;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = _1932;
    int _1936 = _1876;
    if (_1890)
    {
        int _1938 = ~_1914;
        int _1940 = _1938 + 1;
        _1934 = _1940;
    }
    int _1942 = _1934;
    int _1944 = _1926 * int(_1882);
    int _1946 = _1944 + _1484;
    int _1948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _1950 = _1948 != 0;
    bool _1952 = !_1918;
    int _1954 = _1952 ? 0 : 1;
    bool _1956 = uint(_1922) >= uint(_659);
    bool _1958 = !_1420;
    int _1960 = _1958 ? _1912 : (-1);
    bool _1962 = !_1950;
    int _1964 = _1962 ? 0 : 1;
    bool _1966 = !_1956;
    int _1968 = _1966 ? 0 : (-1);
    int _1970 = _1960 & 3;
    bool _1972 = _1970 != 0;
    int _1974 = _1960 & 3;
    bool _1976 = _1974 != 0;
    float _1978 = float(uint(_1946));
    int _1980 = _1972 ? 0 : 1;
    bool _1982 = uint(_1974) > 1u;
    float _1984 = as_type<float>(_886) * _1978;
    int _1986 = ~_1980;
    int _1988 = _1986 + 1;
    int _1990 = _1988 + 1;
    int _1992 = ~_721;
    int _1994 = _1992 + 1;
    float _1996 = trunc(_1984);
    float _1998 = precise::max(_1996, 0.0);
    uint _2000 = uint(_1998);
    float _2002 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2004 = _2002 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2008 = _2006 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2010 = _1990;
    if (!_1982)
    {
        int _2012 = ~_1980;
        int _2014 = _2012 + 1;
        _2010 = _2014;
    }
    int _2016 = _2010;
    float _2018 = 1.0 / _2004;
    bool _2020 = uint(_1974) >= 2u;
    int _2022 = ~_1908;
    int _2024 = _2022 + _1968;
    int _2026 = _2024 + 1;
    int _2028 = _2020 ? 0 : 1;
    bool _2030 = _1974 != 3;
    float _2032 = 1.0 / _2008;
    int _2034 = int(_1882) + int(_2000);
    int _2036 = _659 * _2026;
    int _2038 = _2036 + _1256;
    int _2040 = ~_2028;
    int _2042 = _2040 + 1;
    int _2044 = _2042 + 1;
    int _2046 = _1994 * _2034;
    int _2048 = _2046 + _1484;
    bool _2050 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2052 = isnan(_623);
    bool _2054 = _2050 || _2052;
    bool _2056 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2058 = _2054 || _2056;
    float _2060 = float(_2058);
    float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2064 = _2062 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2066 = _2044;
    if (_2030)
    {
        int _2068 = ~_2028;
        int _2070 = _2068 + 1;
        _2066 = _2070;
    }
    int _2072 = _2066;
    bool _2074 = uint(_2048) >= uint(_721);
    float _2076 = -_2060;
    float _2078 = _2076 + 1.0;
    float _2080 = 1.0 / _2064;
    bool _2082 = !_2074;
    int _2084 = _2082 ? 0 : (-1);
    bool _2086 = _804 > 0.5;
    float _2088 = -_221;
    int _2090 = _2086 ? as_type<int>(_2088) : as_type<int>(_221);
    int _2092 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2094 = _2092 != 0;
    float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2098 = _2096 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2100 = !_2094;
    float _2102 = _2100 ? _221 : as_type<float>(_2090);
    float _2104 = 1.0 / _2098;
    bool _2106 = _814 != 1;
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2108;
    float _2112 = in.m_58.x;
    float _2114 = in.m_58.y;
    float _2116 = in.m_58.z;
    int _2118 = ~_2034;
    int _2120 = _2118 + _2084;
    int _2122 = _2120 + 1;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2126 = abs(_1706);
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2130 = abs(_2016);
    float _2132 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2124);
    float _2134 = 0.0;
    float _2136 = _2098;
    if (!_2106)
    {
        _2134 = _812;
    }
    float _2138 = _2134;
    float _2140 = _816 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2142 = 0.0;
    float _2144 = _2138;
    if (!_2106)
    {
        _2142 = _812;
    }
    float _2146 = _2142;
    float _2148 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2132);
    float _2150 = 0.0;
    float _2152 = _2146;
    if (!_2106)
    {
        _2150 = _834;
    }
    float _2154 = _2150;
    int _2156 = _721 * _2122;
    int _2158 = _2156 + _1484;
    float _2160 = _2154;
    if (!_2106)
    {
        _2136 = _834;
    }
    float _2162 = _2136;
    float _2164 = _2162;
    if (_2106)
    {
        _2144 = _804;
    }
    float _2166 = _2144;
    if (_2106)
    {
        _2152 = _804;
    }
    float _2168 = _2152;
    if (_2106)
    {
        _2160 = _812;
    }
    float _2170 = _2160;
    float _2172 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_2106)
    {
        _2164 = _812;
    }
    float _2174 = _2164;
    float _2176 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2178 = _818 != 2;
    float _2180 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2182 = _812 * 2.0;
    float _2184 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2172);
    float _2186 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2176);
    float _2188 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2180);
    float _2190 = floor(_2182);
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2196 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2184);
    float _2198 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2186);
    float _2200 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2188);
    bool _2202 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2204 = isnan(_623);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2214;
    float _2218 = 0.0;
    if (_2178)
    {
        _2218 = _804;
    }
    float _2220 = _2218;
    float _2222 = 1.0 / _2194;
    float _2224 = 0.0;
    float _2226 = _2220;
    if (_2178)
    {
        _2224 = _812;
    }
    float _2228 = _2224;
    float _2230 = _2216 * _2104;
    float _2232 = _2228;
    if (!_2178)
    {
        _2226 = _834;
    }
    float _2234 = _2226;
    float _2236 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2236;
    if (!_2178)
    {
        _2232 = _804;
    }
    float _2240 = _2232;
    float _2242 = -_2212;
    float _2244 = _2242 + 1.0;
    bool _2246 = _1264 >= 0.0;
    bool _2248 = isnan(_1264);
    bool _2250 = _2246 || _2248;
    bool _2252 = isnan(0.0);
    bool _2254 = _2250 || _2252;
    float _2256 = _2238 * _2018;
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2260 = _2258 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2262 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2264 = isnan(_623);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2270 = _2266 || _2268;
    float _2272 = float(_2270);
    float _2274 = _2240 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2276 = _2254 ? 0 : 1;
    float _2278 = _2260 * _2032;
    bool _2280 = _1264 > 0.0;
    float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2288 = _2286 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2290 = _834 * 2.0;
    float _2292 = _2284 * _2080;
    int _2294 = ~_2276;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    float _2300 = 1.0 / _2288;
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2304 = _2302 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2306 = -_2272;
    float _2308 = _2306 + 1.0;
    float _2310 = _2170 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2312 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2314 = abs(_1858);
    float _2316 = _2060 * _2308;
    int _2318 = _2298;
    float _2320 = _2312;
    if (!_2280)
    {
        int _2322 = ~_2276;
        int _2324 = _2322 + 1;
        _2318 = _2324;
    }
    int _2326 = _2318;
    float _2328 = floor(_2290);
    bool _2330 = _2190 >= 0.0;
    bool _2332 = isnan(_2190);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan(0.0);
    bool _2338 = _2334 || _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2340;
    bool _2344 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2346 = isnan(_623);
    bool _2348 = _2344 || _2346;
    bool _2350 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2352 = _2348 || _2350;
    float _2354 = float(_2352);
    float _2356 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2358 = _2356 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2360 = _2338 ? 0 : 1;
    float _2362 = _2342 * _2222;
    bool _2364 = _2190 > 0.0;
    float _2366 = -_2354;
    float _2368 = _2366 + 1.0;
    float _2370 = 1.0 / _2304;
    bool _2372 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2374 = isnan(_623);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2380 = _2376 || _2378;
    float _2382 = float(_2380);
    float _2384 = _2358 * _2300;
    int _2386 = ~_2360;
    int _2388 = _2386 + 1;
    int _2390 = _2388 + 1;
    float _2392 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2394 = _623 + _2392;
    int _2396 = ~_1834;
    int _2398 = _2396 + _1894;
    int _2400 = _2398 + 1;
    float _2402 = _2382 * _2078;
    float _2404 = -_2382;
    float _2406 = _2404 + 1.0;
    bool _2408 = !_1420;
    int _2410 = _2408 ? _2158 : (-1);
    int _2412 = _641 * _2400;
    int _2414 = _2412 + _1132;
    int _2416 = _2390;
    if (!_2364)
    {
        int _2418 = ~_2360;
        int _2420 = _2418 + 1;
        _2416 = _2420;
    }
    int _2422 = _2416;
    float _2424 = _2354 * _2406;
    bool _2426 = !_1180;
    int _2428 = _2426 ? _2038 : (-1);
    bool _2430 = !_1642;
    int _2432 = _2430 ? 0 : 1;
    float _2434 = _2110 * _2370;
    int _2436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2438 = _2436 != 0;
    int _2440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2442 = _2440 != 0;
    int _2444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2446 = _2444 != 0;
    bool _2448 = _2328 >= 0.0;
    bool _2450 = isnan(_2328);
    bool _2452 = _2448 || _2450;
    bool _2454 = isnan(0.0);
    bool _2456 = _2452 || _2454;
    bool _2458 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2460 = isnan(_623);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2466 = _2462 || _2464;
    float _2468 = float(_2466);
    bool _2470 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2472 = isnan(_623);
    bool _2474 = _2470 || _2472;
    bool _2476 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2478 = _2474 || _2476;
    float _2480 = float(_2478);
    int _2482 = _2456 ? 0 : 1;
    float _2484 = -_2468;
    float _2486 = _2484 + 1.0;
    bool _2488 = _2328 > 0.0;
    float _2490 = _2468 * _2368;
    float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2494 = _623 + _2492;
    float _2496 = -_2480;
    float _2498 = _2496 + 1.0;
    float _2500 = _2480 * _2486;
    float _2502 = fma(_2292, _2394, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2504 = fma(_2230, _2494, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2506 = _2212 * _2498;
    float _2508 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2510 = _623 + _2508;
    bool _2512 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2514 = isnan(_623);
    bool _2516 = _2512 || _2514;
    bool _2518 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2520 = _2516 || _2518;
    float _2522 = float(_2520);
    float _2524 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2526 = _623 + _2524;
    float _2528 = fma(_2278, _2510, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2532 = _623 + _2530;
    float _2534 = _2522 * _2244;
    float _2536 = fma(_2256, _2526, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2538 = fma(_2362, _858, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2540 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2542 = _623 + _2540;
    float _2544 = fma(_2434, _2532, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2546 = _2504 * _2534;
    float _2548 = -_2522;
    float _2550 = _2548 + 1.0;
    float _2552 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2554 = ~_2482;
    int _2556 = _2554 + 1;
    int _2558 = _2556 + 1;
    float _2560 = fma(_2550, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2546);
    int _2562 = _2558;
    if (!_2488)
    {
        int _2564 = ~_2482;
        int _2566 = _2564 + 1;
        _2562 = _2566;
    }
    int _2568 = _2562;
    float _2570 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2572 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2552);
    float _2574 = fma(_2384, _2542, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2576 = fma(_2502, _2506, _2560);
    float _2578 = _812 + _804;
    float _2580 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2570);
    float _2582 = _812 + _834;
    float _2584 = _812 + (-0.5);
    float _2586 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2588 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2590 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2592 = fma(_2536, _2500, _2576);
    float _2594 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2596 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2586);
    float _2598 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2588);
    float _2600 = _804 + _834;
    float _2602 = _804 + (-0.5);
    float _2604 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2590);
    float _2606 = _820 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2608 = fma(_2140, -2.0, _2594);
    float _2610 = _2198 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2612 = _2196 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2614 = -_2128;
    float _2616 = fma(_2606, 2.0, _2614);
    float _2618 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2620 = fma(_2528, _2490, _2592);
    float _2622 = _2200 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2624 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2626 = _2610 + _2624;
    int _2628 = _1794 >> 31;
    float _2630 = -_2618;
    float _2632 = fma(_882, 2.0, _2630);
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2636 = _2612 + _2634;
    float _2638 = _2626 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2640 = _2628 & 3;
    float _2642 = fma(_2538, _2424, _2620);
    float _2644 = fma(_2636, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2638);
    int _2646 = _1794 + _2640;
    float _2648 = _2578 + (-1.0);
    float _2650 = fma(_2574, _2402, _2642);
    int _2652 = _2646 >> 2;
    float _2654 = fma(_2648, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2656 = !_1814;
    int _2658 = _2656 ? 0 : 1;
    float _2660 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2662 = _2622 + _2660;
    int _2664 = _2652 << 4;
    int _2666 = _2664 + 656;
    float _2668 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2670 = _1812 != 3;
    float _2672 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2644);
    uint _2674 = uint(int(uint(_2666) >> uint(2)));
    uint _2676 = uint(int(uint(int(_2674)) >> uint(2)));
    int _2678 = int(_2674) & 3;
    float _2680 = (*spvDescriptorSet0.vp_c9)._m0[int(_2676)][_2678];
    int _2682 = int(_2674) + 1;
    uint _2684 = uint(int(uint(_2682) >> uint(2)));
    int _2686 = _2682 & 3;
    float _2688 = (*spvDescriptorSet0.vp_c9)._m0[int(_2684)][_2686];
    float _2690 = fma(_862, -2.0, _2668);
    float _2692 = -_131;
    float _2694 = fma(_2692, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2616);
    bool _2696 = !_2670;
    int _2698 = _2696 ? 0 : (-1);
    float _2700 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2702 = _2672 >= 0.0;
    float _2704 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2706 = _1630 + 0.5;
    float _2708 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2700);
    float _2710 = -_131;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2632);
    float _2714 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2704);
    float _2716 = fma(_2706, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2694);
    int _2718 = _2666 + 8;
    uint _2720 = uint(int(uint(_2718) >> uint(2)));
    uint _2722 = uint(int(uint(int(_2720)) >> uint(2)));
    int _2724 = int(_2720) & 3;
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[int(_2722)][_2724];
    int _2728 = int(_2720) + 1;
    uint _2730 = uint(int(uint(_2728) >> uint(2)));
    int _2732 = _2728 & 3;
    float _2734 = (*spvDescriptorSet0.vp_c9)._m0[int(_2730)][_2732];
    float _2736 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2690);
    float _2738 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2608);
    float _2740 = _1818 + (-0.5);
    float _2742 = _2102 + 0.5;
    float _2744 = -_2740;
    float _2746 = -_2736;
    float _2748 = fma(_2744, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2746);
    float _2750 = fma(_2742, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2712);
    float _2752 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2754 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2756 = fma(_2544, _2316, _2650);
    float _2758 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2760 = fma(_2310, -2.0, _2752);
    int _2762 = abs(_2658);
    float _2764 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2766 = fma(_2274, -2.0, _2758);
    int _2768 = abs(_1876);
    int _2770 = abs(_1942);
    float _2772 = -_2764;
    float _2774 = fma(_2312, 2.0, _2772);
    int _2776 = ~_2768;
    int _2778 = _2776 + 1;
    int _2780 = _2778 + 1;
    float _2782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2784 = ~_2762;
    int _2786 = _2784 + 1;
    int _2788 = _2786 + 1;
    float _2790 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2604);
    if (_2702)
    {
        _2320 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2792 = _2320;
    float _2794 = -_1820;
    float _2796 = -_2738;
    float _2798 = fma(_2794, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2796);
    float _2800 = -_2790;
    float _2802 = _2800 + 1.0;
    int _2804 = abs(_2698);
    if (_2702)
    {
        float _2806 = _2792 * 5.0;
        _1936 = as_type<int>(_2806);
    }
    int _2808 = _1936;
    float _2810 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2760);
    float _2812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2814 = _2780 * as_type<int>(_2688);
    int _2816 = ~_2770;
    int _2818 = _2816 + 1;
    int _2820 = _2818 + 1;
    if (_2702)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9518 = as_type<float>(_2808);
        out.gl_Position.z = _9518;
    }
    bool _2822 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2824 = isnan(0.0);
    bool _2826 = _2822 || _2824;
    bool _2828 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2830 = _2826 || _2828;
    int _2832 = _2788 * as_type<int>(_2680);
    int _2834 = _2832 + _2814;
    int _2836 = abs(_1954);
    float _2838 = _2782 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2840 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2842 = int(_2840);
    float _2844 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2756);
    float _2846 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2596);
    float _2848 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2580);
    float _2850 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2598);
    int _2852 = _2820 * as_type<int>(_2726);
    int _2854 = _2852 + _2834;
    float _2856 = _1122 * _131;
    int _2858 = ~_2804;
    int _2860 = _2858 + 1;
    int _2862 = _2860 + 1;
    float _2864 = -_2148;
    float _2866 = _2864 + 1.0;
    int _2868 = ~_2836;
    int _2870 = _2868 + 1;
    int _2872 = _2870 + 1;
    float _2874 = _2812 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2876 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2878 = exp2(_2856);
    float _2880 = float(uint(_2842));
    int _2882 = _2862 * as_type<int>(_2734);
    int _2884 = _2882 + _2854;
    float _2886 = _1584 + 0.5;
    float _2888 = -_2876;
    float _2890 = fma(_2754, 2.0, _2888);
    float _2892 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2572);
    int _2894 = _2884 * _2872;
    float _2896 = -_2802;
    float _2898 = fma(_2896, _1630, _2716);
    float _2900 = 1.0 / _2880;
    float _2902 = _1338 + (-0.5);
    float _2904 = fma(_2866, _1810, _2798);
    float _2906 = -_131;
    float _2908 = fma(_2906, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2774);
    float _2910 = -_2874;
    float _2912 = -_2810;
    float _2914 = fma(_2910, _2902, _2912);
    int _2916 = _2428 * _2836;
    int _2918 = _2916 + _2894;
    out.m_80.x = _2898;
    out.m_80.y = _2904;
    float _2920 = fma(_2838, _2886, _2908);
    float _2922 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2924 = 1.0 + _2922;
    float _2926 = -_2878;
    float _2928 = _2926 + 1.0;
    float _2930 = float(uint(_2918));
    float _2932 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2708);
    float _2934 = 1.0 / _2924;
    float _2936 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2714);
    float _2938 = _2830 ? _2928 : 0.0;
    float _2940 = -_131;
    float _2942 = fma(_2940, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2890);
    int _2944 = as_type<int>(_2900) + (-2);
    float _2946 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2766);
    bool _2948 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2950 = isnan(1.0);
    bool _2952 = _2948 || _2950;
    bool _2954 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2956 = _2952 || _2954;
    out.m_82.x = _2844;
    int _2958 = abs(_2842);
    float _2960 = as_type<float>(_2944) * _2930;
    int _2962 = _1960 >> 31;
    float _2964 = -_2936;
    float _2966 = _2964 + 1.0;
    float _2968 = trunc(_2960);
    float _2970 = precise::max(_2968, 0.0);
    uint _2972 = uint(_2970);
    int _2974 = _1608 >> 31;
    float _2976 = _2626 * _2626;
    float _2978 = float(uint(_2958));
    float _2980 = fma(_1338, _2966, _2914);
    int _2982 = ~_2842;
    int _2984 = _2982 + 1;
    if (_2956)
    {
        float _2986 = _2938 * _2934;
        _141 = _2986;
    }
    float _2988 = _141;
    int _2990 = _2962 & 3;
    float _2992 = -_2850;
    float _2994 = _2992 + 1.0;
    float _2996 = 1.0 / _2978;
    int _2998 = _2974 & 3;
    float _3000 = fma(_2636, _2636, _2976);
    int _3002 = _1960 + _2990;
    float _3004 = -_2846;
    float _3006 = _3004 + 1.0;
    int _3008 = _1608 + _2998;
    float _3010 = fma(_2662, _2662, _3000);
    int _3012 = _2984 * int(_2972);
    int _3014 = _3012 + _2918;
    int _3016 = _3002 >> 2;
    float _3018 = -_3006;
    float _3020 = fma(_2102, _3018, _2750);
    float _3022 = rsqrt(_3010);
    int _3024 = _3008 >> 2;
    float _3026 = _884 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3028 = float(uint(_3014));
    float _3030 = -_2932;
    float _3032 = _3030 + 1.0;
    int _3034 = _3016 << 4;
    int _3036 = _3034 + 800;
    if (_2702)
    {
        out.m_65.x = 0.0;
    }
    int _3038 = abs(_2918);
    float _3040 = as_type<float>(_2944) * _3028;
    int _3042 = _3024 << 4;
    int _3044 = _3042 + 368;
    uint _3046 = uint(int(uint(_3036) >> uint(2)));
    uint _3048 = uint(int(uint(int(_3046)) >> uint(2)));
    int _3050 = int(_3046) & 3;
    float _3052 = (*spvDescriptorSet0.vp_c9)._m0[int(_3048)][_3050];
    int _3054 = int(_3046) + 1;
    uint _3056 = uint(int(uint(_3054) >> uint(2)));
    int _3058 = _3054 & 3;
    float _3060 = (*spvDescriptorSet0.vp_c9)._m0[int(_3056)][_3058];
    int _3062 = as_type<int>(_2996) + (-2);
    float _3064 = -_2848;
    float _3066 = _3064 + 1.0;
    float _3068 = float(uint(_3038));
    float _3070 = -_3032;
    float _3072 = fma(_1584, _3070, _2920);
    bool _3074 = !_2438;
    int _3076 = _3074 ? 0 : 1;
    float _3078 = _3026 * _3022;
    float _3080 = fma(_1818, _3066, _2748);
    uint _3082 = uint(int(uint(_3044) >> uint(2)));
    uint _3084 = uint(int(uint(int(_3082)) >> uint(2)));
    int _3086 = int(_3082) & 3;
    float _3088 = (*spvDescriptorSet0.vp_c9)._m0[int(_3084)][_3086];
    int _3090 = int(_3082) + 1;
    uint _3092 = uint(int(uint(_3090) >> uint(2)));
    int _3094 = _3090 & 3;
    float _3096 = (*spvDescriptorSet0.vp_c9)._m0[int(_3092)][_3094];
    float _3098 = as_type<float>(_3062) * _3068;
    float _3100 = _2626 * _3078;
    float _3102 = _2636 * _3078;
    int _3104 = ~_2958;
    int _3106 = _3104 + 1;
    out.m_84.x = _3020;
    out.m_84.y = _3080;
    out.m_84.z = _3072;
    out.m_84.w = _2980;
    float _3108 = -_3100;
    float _3110 = _2626 + _3108;
    float _3112 = trunc(_3098);
    float _3114 = precise::max(_3112, 0.0);
    uint _3116 = uint(_3114);
    int _3118 = abs(_3076);
    float _3120 = -_3102;
    float _3122 = _2636 + _3120;
    float _3124 = _3110 * _3110;
    float _3126 = _2662 * _3078;
    float _3128 = float(_2568);
    float _3130 = fma(_3122, _3122, _3124);
    float _3132 = float(_3118);
    float _3134 = trunc(_3040);
    float _3136 = precise::max(_3134, 0.0);
    uint _3138 = uint(_3136);
    int _3140 = ~_2842;
    int _3142 = _3140 + 1;
    float _3144 = -_3126;
    float _3146 = _2662 + _3144;
    int _3148 = _3036 + 8;
    uint _3150 = uint(int(uint(_3148) >> uint(2)));
    uint _3152 = uint(int(uint(int(_3150)) >> uint(2)));
    int _3154 = int(_3150) & 3;
    float _3156 = (*spvDescriptorSet0.vp_c9)._m0[int(_3152)][_3154];
    int _3158 = int(_3150) + 1;
    uint _3160 = uint(int(uint(_3158) >> uint(2)));
    int _3162 = _3158 & 3;
    float _3164 = (*spvDescriptorSet0.vp_c9)._m0[int(_3160)][_3162];
    float _3166 = _3132 * _3128;
    int _3168 = _3106 * int(_3116);
    int _3170 = _3168 + _3038;
    bool _3172 = !_1976;
    int _3174 = _3172 ? 0 : 1;
    int _3176 = _3044 + 8;
    uint _3178 = uint(int(uint(_3176) >> uint(2)));
    uint _3180 = uint(int(uint(int(_3178)) >> uint(2)));
    int _3182 = int(_3178) & 3;
    float _3184 = (*spvDescriptorSet0.vp_c9)._m0[int(_3180)][_3182];
    int _3186 = int(_3178) + 1;
    uint _3188 = uint(int(uint(_3186) >> uint(2)));
    int _3190 = _3186 & 3;
    float _3192 = (*spvDescriptorSet0.vp_c9)._m0[int(_3188)][_3190];
    float _3194 = float(uint(_3170));
    int _3196 = ~_2130;
    int _3198 = _3196 + 1;
    int _3200 = _3198 + 1;
    int _3202 = int(_2972) + int(_3138);
    float _3204 = as_type<float>(_3062) * _3194;
    int _3206 = abs(_2432);
    int _3208 = ~_2126;
    int _3210 = _3208 + 1;
    int _3212 = _3210 + 1;
    float _3214 = trunc(_3204);
    float _3216 = precise::max(_3214, 0.0);
    uint _3218 = uint(_3216);
    bool _3220 = _1640 != 3;
    int _3222 = _3142 * _3202;
    int _3224 = _3222 + _2918;
    int _3226 = ~_2958;
    int _3228 = _3226 + 1;
    int _3230 = _3200 * as_type<int>(_3060);
    int _3232 = abs(_3174);
    int _3234 = ~_3232;
    int _3236 = _3234 + 1;
    int _3238 = _3236 + 1;
    int _3240 = _3212 * as_type<int>(_3096);
    bool _3242 = !_3220;
    int _3244 = _3242 ? 0 : (-1);
    int _3246 = ~_3206;
    int _3248 = _3246 + 1;
    int _3250 = _3248 + 1;
    int _3252 = _3238 * as_type<int>(_3052);
    int _3254 = _3252 + _3230;
    bool _3256 = uint(_3224) >= uint(_2842);
    int _3258 = int(_3116) + int(_3218);
    int _3260 = _3250 * as_type<int>(_3088);
    int _3262 = _3260 + _3240;
    bool _3264 = !_3256;
    int _3266 = _3264 ? 0 : (-1);
    int _3268 = abs(_2072);
    int _3270 = _3228 * _3258;
    int _3272 = _3270 + _3038;
    bool _3274 = _1974 != 3;
    float _3276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3278 = ~_3202;
    int _3280 = _3278 + _3266;
    int _3282 = _3280 + 1;
    int _3284 = ~_3268;
    int _3286 = _3284 + 1;
    int _3288 = _3286 + 1;
    bool _3290 = !_3274;
    int _3292 = _3290 ? 0 : (-1);
    int _3294 = _2842 * _3282;
    int _3296 = _3294 + _2918;
    bool _3298 = uint(_3272) >= uint(_2958);
    int _3300 = _3288 * as_type<int>(_3156);
    int _3302 = _3300 + _3254;
    int _3304 = _2918 ^ _2842;
    float _3306 = _1004 + 0.5;
    int _3308 = abs(_3292);
    int _3310 = abs(_1784);
    float _3312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3314 = !_3298;
    int _3316 = _3314 ? 0 : (-1);
    uint _3318 = uint(int(uint(_3304) >> uint(31)));
    int _3320 = abs(_3244);
    int _3322 = ~_3310;
    int _3324 = _3322 + 1;
    int _3326 = _3324 + 1;
    int _3328 = ~_3316;
    int _3330 = _3258 + _3328;
    int _3332 = _3330 + 1;
    int _3334 = ~int(_3318);
    int _3336 = _3334 + 1;
    int _3338 = _3326 * as_type<int>(_3184);
    int _3340 = _3338 + _3262;
    int _3342 = ~_3320;
    int _3344 = _3342 + 1;
    int _3346 = _3344 + 1;
    bool _3348 = _2842 == 0;
    int _3350 = ~_3308;
    int _3352 = _3350 + 1;
    int _3354 = _3352 + 1;
    int _3356 = _3346 * as_type<int>(_3192);
    int _3358 = _3356 + _3340;
    int _3360 = _3332 ^ _3336;
    int _3362 = ~_2314;
    int _3364 = _3362 + 1;
    int _3366 = _3364 + 1;
    int _3368 = _3354 * as_type<int>(_3164);
    int _3370 = _3368 + _3302;
    bool _3372 = !_3348;
    int _3374 = _3372 ? _3296 : (-1);
    float _3376 = in.m_86.x;
    float _3378 = in.m_86.y;
    float _3380 = in.m_86.z;
    int _3382 = abs(_1964);
    float _3384 = _3312 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3386 = _2842 == 0;
    int _3388 = _3358 * _3366;
    int _3390 = ~_3336;
    int _3392 = _3390 + _3360;
    int _3394 = _3392 + 1;
    int _3396 = ~_3382;
    int _3398 = _3396 + 1;
    int _3400 = _3398 + 1;
    bool _3402 = !_3386;
    int _3404 = _3402 ? _3394 : (-1);
    bool _3406 = _641 == 0;
    int _3408 = _3370 * _3400;
    float _3410 = float(_3374);
    float _3412 = _3276 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3414 = float(_3404);
    int _3416 = _2410 * _3382;
    int _3418 = _3416 + _3408;
    bool _3420 = !_3406;
    int _3422 = _3420 ? _2414 : (-1);
    float _3424 = fma(_3384, _3410, _2942);
    float _3426 = _3166 * (-2.0);
    float _3428 = -_2946;
    float _3430 = fma(_3412, _3414, _3428);
    float _3432 = _966 + (-0.5);
    int _3434 = _3422 * _2314;
    int _3436 = _3434 + _3388;
    float _3438 = fma(_3384, _3306, _3424);
    float _3440 = -_2892;
    float _3442 = _3440 + 1.0;
    float _3444 = -_3412;
    float _3446 = fma(_3444, _3432, _3430);
    float _3448 = fma(_2654, _3426, _2654);
    float _3450 = float(_3436);
    float _3452 = -_2994;
    float _3454 = fma(_1004, _3452, _3438);
    float _3456 = float(_3418);
    float _3458 = fma(_966, _3442, _3446);
    float _3460 = fma(_3426, _3376, _3376);
    bool _3462 = !_2442;
    int _3464 = _3462 ? 0 : 1;
    out.m_88.x = _3450;
    bool _3466 = !_2446;
    int _3468 = _3466 ? 0 : 1;
    int _3470 = abs(_3464);
    out.m_88.w = _3456;
    out.m_90.x = _3454;
    out.m_90.y = _3458;
    float _3472 = _3380;
    if (_2702)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3474 = -_3100;
    float _3476 = _2610 + _3474;
    float _3478 = -_3102;
    float _3480 = _2612 + _3478;
    float _3482 = fma(_2602, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3460);
    float _3484 = float(_2326);
    float _3486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3488 = _3476 + _3486;
    float _3490 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3492 = _3480 + _3490;
    float _3494 = float(_3470);
    float _3496 = _2582 + (-1.0);
    float _3498 = _3488 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3500 = _2600 + (-1.0);
    float _3502 = _3494 * _3484;
    float _3504 = fma(_3492, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3498);
    float _3506 = -_3126;
    float _3508 = _2622 + _3506;
    int _3510 = abs(_3468);
    float _3512 = fma(_3496, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3514 = float(_2422);
    float _3516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3518 = _3508 + _3516;
    float _3520 = float(_3510);
    float _3522 = _834 + (-0.5);
    float _3524 = fma(_3448, _2988, _3482);
    float _3526 = fma(_3518, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3504);
    float _3528 = _3502 * (-2.0);
    float _3530 = _3520 * _3514;
    float _3532 = fma(_3146, _3146, _3130);
    float _3534 = _3524 * 0.15915493667125701904296875;
    float _3536 = fma(_3528, _3378, _3378);
    float _3538 = fma(_3512, _3528, _3512);
    float _3540 = _3530 * (-2.0);
    bool _3542 = _3526 >= 0.0;
    float _3544 = fma(_2584, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3536);
    float _3546 = sqrt(_3532);
    float _3548 = fma(_3500, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3550 = fma(_3540, _3380, _3380);
    float _3552 = fma(_3538, _2988, _3544);
    float _3554 = fma(_3548, _3540, _3548);
    float _3556 = fma(_3522, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3550);
    float _3558 = _3552 * 0.15915493667125701904296875;
    float _3560 = _3534 * 6.283185482025146484375;
    float _3562 = sin(_3560);
    float _3564 = fma(_3554, _2988, _3556);
    int _3566 = as_type<int>(_3538);
    if (_3542)
    {
        _3472 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3568 = _3472;
    int _3570 = as_type<int>(_3568);
    if (_3542)
    {
        out.m_65.x = 0.0;
    }
    float _3572 = _3564 * 0.15915493667125701904296875;
    float _3574 = _3534 * 6.283185482025146484375;
    float _3576 = cos(_3574);
    if (_3542)
    {
        float _3578 = _3568 * 5.0;
        _3570 = as_type<int>(_3578);
    }
    int _3580 = _3570;
    if (_3542)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10631 = as_type<float>(_3580);
        out.gl_Position.z = _10631;
    }
    float _3582 = _3558 * 6.283185482025146484375;
    float _3584 = sin(_3582);
    float _3586 = _3558 * 6.283185482025146484375;
    float _3588 = cos(_3586);
    if (_3542)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3590 = _3572 * 6.283185482025146484375;
    float _3592 = cos(_3590);
    float _3594 = _3022 * _3546;
    float _3596 = _453 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3600 = _3576 * _3588;
    float _3602 = _884 * _3594;
    float _3604 = _3594 * _3596;
    float _3606 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _3608 = _3572 * 6.283185482025146484375;
    float _3610 = sin(_3608);
    float _3612 = _3576 * _3584;
    float _3614 = _3598 * _3604;
    float _3616 = _3562 * _3584;
    float _3618 = _3562 * _3588;
    float _3620 = _3606 * _3602;
    float _3622 = _3594 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3624 = _3622 * 0.5;
    float _3626 = _3576 * _3592;
    float _3628 = _3588 * _3592;
    float _3630 = _3562 * _3592;
    float _3632 = _3584 * _3592;
    float _3634 = _3626 * _3614;
    float _3636 = fma(_3610, _3600, _3616);
    float _3638 = -_3618;
    float _3640 = fma(_3610, _3612, _3638);
    float _3642 = -_3614;
    float _3644 = _3610 * _3642;
    float _3646 = -_3612;
    float _3648 = fma(_3610, _3618, _3646);
    float _3650 = fma(_3636, _3620, _3634);
    float _3652 = _3630 * _3614;
    float _3654 = fma(_3628, _3620, _3644);
    float _3656 = fma(_3610, _3616, _3600);
    float _3658 = fma(_3640, _3624, _3650);
    float _3660 = fma(_3648, _3620, _3652);
    float _3662 = fma(_3632, _3624, _3654);
    float _3664 = _3636 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3666 = _3658 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3668 = _3658 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3670 = fma(_3656, _3624, _3660);
    float _3672 = _3658 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3674 = fma(_3662, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3666);
    float _3676 = fma(_3662, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3668);
    float _3678 = _3626 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3680 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3664);
    float _3682 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3674);
    float _3684 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3676);
    float _3686 = _3682 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3688 = _3684 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3690 = _3636 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3692 = _2612 + _3686;
    float _3694 = _2622 + _3688;
    float _3696 = _3636 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3698 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3700 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3702 = _3692 + _3700;
    float _3704 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3706 = _3694 + _3704;
    float _3708 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3696);
    float _3710 = fma(_3662, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3672);
    float _3712 = _3702 * _3702;
    float _3714 = _3706 * _3706;
    float _3716 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3690);
    float _3718 = _3626 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3720 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3710);
    float _3722 = _3712 + _3714;
    float _3724 = _3626 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3726 = -_3610;
    float _3728 = fma(_3726, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3718);
    float _3730 = _3720 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3732 = sqrt(_3722);
    float _3734 = -_3610;
    float _3736 = fma(_3734, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3724);
    float _3738 = _3640 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3740 = _3640 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3742 = fma(_3698, _3698, 1.0);
    float _3744 = _3640 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3746 = _2610 + _3730;
    float _3748 = -_3610;
    float _3750 = fma(_3748, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3678);
    float _3752 = rsqrt(_3742);
    float _3754 = fma(_3632, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3738);
    float _3756 = fma(_3632, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3740);
    float _3758 = fma(_3632, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3744);
    bool _3760 = _3732 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3762 = _3744;
    float _3764 = _3632;
    float _3766 = _3738;
    float _3768 = _3742;
    float _3770 = _3730;
    float _3772 = _3702;
    if (!_3760)
    {
        _3762 = _3714;
    }
    float _3774 = _3762;
    float _3776 = _3774;
    if (!_3760)
    {
        _3764 = _3712;
    }
    float _3778 = _3764;
    float _3780 = _3778;
    if (!_3760)
    {
        _3766 = _3692;
    }
    float _3782 = _3766;
    float _3784 = _3782;
    if (!_3760)
    {
        _3768 = _3694;
    }
    float _3786 = _3768;
    float _3788 = _3786;
    if (!_3760)
    {
        _3770 = _3746;
    }
    float _3790 = _3770;
    bool _3792 = !_3760;
    float _3794 = _3790;
    if (!_3792)
    {
        float _3796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3798 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3800 = _3732 + _3798;
        float _3802 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3804 = rsqrt(_3722);
        float _3806 = _3800 * _3796;
        float _3808 = _3806 * 0.15915493667125701904296875;
        float _3810 = _3808 * 6.283185482025146484375;
        float _3812 = sin(_3810);
        float _3814 = _3808 * 6.283185482025146484375;
        float _3816 = cos(_3814);
        float _3818 = fma(_3812, _3802, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3820 = _3804 * _3818;
        float _3822 = _3816 + (-1.0);
        float _3824 = fma(_3702, _3820, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3826 = fma(_3706, _3820, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3828 = _3822 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3830 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3832 = _3824 + _3830;
        float _3834 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3836 = _3826 + _3834;
        float _3838 = fma(_3746, _3816, _3828);
        float _3840 = _3832 * _3832;
        float _3842 = _3836 * _3836;
        _3794 = _3838;
        _3780 = _3840;
        _3776 = _3842;
        _3784 = _3824;
        _3788 = _3826;
    }
    float _3844 = _3794;
    float _3846 = _3780;
    float _3848 = _3776;
    float _3850 = _3784;
    float _3852 = _3788;
    float _3854 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3856 = _3844 + _3854;
    float _3858 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3728);
    float _3860 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3750);
    float _3862 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3736);
    float _3864 = fma(_3856, _3856, _3846);
    float _3866 = fma(_3656, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3754);
    float _3868 = fma(_3656, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3756);
    float _3870 = fma(_3656, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3758);
    float _3872 = _3864 + _3848;
    float _3874 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3716);
    float _3876 = _3698 * _3752;
    float _3878 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3708);
    float _3880 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3882 = _3698 * _3858;
    float _3884 = _3698 * _3860;
    float _3886 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3680);
    float _3888 = _3698 * _3862;
    float _3890 = -_3866;
    float _3892 = _3876 * _3890;
    float _3894 = -_3868;
    float _3896 = _3876 * _3894;
    float _3898 = -_3870;
    float _3900 = _3876 * _3898;
    float _3902 = sqrt(_3872);
    float _3904 = fma(_3880, _3874, _3882);
    float _3906 = fma(_3880, _3878, _3884);
    float _3908 = fma(_3880, _3886, _3888);
    float _3910 = fma(_3752, _3858, _3892);
    float _3912 = fma(_3752, _3860, _3896);
    float _3914 = _3868 + _3906;
    float _3916 = fma(_3752, _3862, _3900);
    float _3918 = _3866 + _3904;
    float _3920 = _3870 + _3908;
    out.m_92.x = _3874;
    out.m_92.y = _3878;
    out.m_92.z = _3886;
    out.m_94.x = _3910;
    out.m_94.y = _3912;
    out.m_94.z = _3916;
    bool _3922 = _3902 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3924 = isnan(_3902);
    bool _3926 = _3922 || _3924;
    bool _3928 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3930 = _3926 || _3928;
    out.m_96.x = _3918;
    out.m_96.y = _3914;
    out.m_96.z = _3920;
    float _3932 = _3866;
    if (!_3930)
    {
        _3932 = 1.0;
    }
    float _3934 = _3932;
    bool _3936 = !_3930;
    float _3938 = _3934;
    if (!_3936)
    {
        bool _3940 = _3902 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3942 = isnan(_3902);
        bool _3944 = _3940 || _3942;
        bool _3946 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3948 = _3944 || _3946;
        if (!_3948)
        {
            float _3950 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3952 = _3902 + _3950;
            float _3954 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3956 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3954;
            float _3958 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3960 = _3958 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3962 = 1.0 / _3956;
            float _3964 = _3952 * _3962;
            float _3966 = fma(_3964, _3960, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3938 = _3966;
            _3968 = true;
        }
        else
        {
            bool _3970 = _3902 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3972 = isnan(_3902);
            bool _3974 = _3970 || _3972;
            bool _3976 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3978 = _3974 || _3976;
            if (!_3978)
            {
                float _3980 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3982 = _3902 + _3980;
                float _3984 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3986 = _3984 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3988 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3990 = _3988 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3992 = 1.0 / _3986;
                float _3994 = _3982 * _3992;
                float _3996 = fma(_3994, _3990, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3938 = _3996;
                _3968 = true;
            }
            else
            {
                _3938 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3968 = false;
    float _3998 = _3938;
    float _4000 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4002 = _3844 + _4000;
    float _4004 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4006 = _3850 + _4004;
    float _4008 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4010 = _3852 + _4008;
    float _4012 = fma(_4002, _3998, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4014 = fma(_4006, _3998, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4016 = fma(_4010, _3998, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4018 = _3476 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4020 = -_2610;
    float _4022 = _4020 + _4012;
    float _4024 = -_2612;
    float _4026 = _4024 + _4014;
    float _4028 = -_2622;
    float _4030 = _4028 + _4016;
    float _4032 = fma(_3480, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4018);
    float _4034 = _4022 * _4022;
    float _4036 = _3476 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4038 = fma(_3508, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4032);
    float _4040 = fma(_4026, _4026, _4034);
    float _4042 = _4038 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4044 = fma(_4030, _4030, _4040);
    float _4046 = sqrt(_4044);
    bool _4048 = _4046 > 0.0;
    float _4050 = _4046;
    float _4052 = _4006;
    float _4054 = _4038;
    float _4056 = _4030;
    if (!_4048)
    {
        _4050 = _4014;
    }
    float _4058 = _4050;
    float _4060 = _4058;
    if (!_4048)
    {
        _4052 = _4012;
    }
    float _4062 = _4052;
    float _4064 = _4062;
    float _4066 = _4062;
    if (!_4048)
    {
        _4054 = _4016;
    }
    float _4068 = _4054;
    bool _4070 = !_4048;
    float _4072 = _4068;
    if (!_4070)
    {
        float _4074 = _215 * _215;
        float _4076 = fma(_213, _213, _4074);
        float _4078 = fma(_217, _217, _4076);
        float _4080 = rsqrt(_4044);
        float _4082 = sqrt(_4078);
        float _4084 = _4026 * _4080;
        float _4086 = _4022 * _4080;
        float _4088 = _4030 * _4080;
        bool _4090 = _4082 > 0.0;
        float _4092 = _4080;
        float _4094 = _4082;
        _4056 = _4088;
        if (!_4090)
        {
            _4092 = _4014;
        }
        float _4096 = _4092;
        _4060 = _4096;
        if (!_4090)
        {
            _4064 = _4012;
        }
        float _4098 = _4064;
        _4066 = _4098;
        if (!_4090)
        {
            _4094 = _4016;
        }
        float _4100 = _4094;
        bool _4102 = !_4090;
        _4072 = _4100;
        if (!_4102)
        {
            float _4104 = rsqrt(_4078);
            float _4106 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4108 = _215 * _4104;
            float _4110 = _213 * _4104;
            float _4112 = _217 * _4104;
            float _4114 = _4086 * _4108;
            float _4116 = fma(_4084, _4110, _4114);
            float _4118 = _4106 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4120 = fma(_4088, _4112, _4116);
            float _4122 = _4120 * _4118;
            float _4124 = fma(_213, _4122, _4014);
            float _4126 = fma(_215, _4122, _4012);
            float _4128 = fma(_217, _4122, _4016);
            _4066 = _4126;
            _4060 = _4124;
            _4072 = _4128;
        }
    }
    float _4130 = _4066;
    float _4132 = _4060;
    float _4134 = _4072;
    float _4136 = _4056;
    float _4138 = fma(_3480, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4036);
    float _4140 = 1.0 / _4042;
    float _4142 = -_3100;
    float _4144 = _4142 + _4130;
    float _4146 = -_3102;
    float _4148 = _4146 + _4132;
    float _4150 = fma(_3508, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4138);
    float _4152 = -_3126;
    float _4154 = _4152 + _4134;
    float _4156 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4158 = _4144 + _4156;
    float _4160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4162 = _4148 + _4160;
    float _4164 = _4150 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4166 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4168 = _4154 + _4166;
    float _4170 = _4158 * _4158;
    float _4172 = _4164 + _4042;
    float _4174 = fma(_4162, _4162, _4170);
    float _4176 = _4172 * _4140;
    float _4178 = _4176 * 0.5;
    float _4180 = fma(_4168, _4168, _4174);
    float _4182 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4184 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4186 = fma(_4178, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4184);
    float _4188 = rsqrt(_4180);
    float _4190 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4192 = 1.0 / _4186;
    float _4194 = _4188 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4196 = _3476 + _4190;
    float _4198 = sqrt(_4180);
    float _4200 = _4162 * _4194;
    float _4202 = _4168 * _4194;
    float _4204 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4206 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4208 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4210 = _4192 * _4208;
    float _4212 = _4200 * _4200;
    float _4214 = _4202 * _4202;
    float _4216 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4204);
    float _4218 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4206);
    bool _4220 = _4210 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4222 = _4212 + _4214;
    bool _4224 = _4210 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4226 = fma(_3508, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4216);
    float _4228 = fma(_3508, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4218);
    float _4230 = sqrt(_4222);
    float _4232 = _4226 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _4234 = !_4220;
    int _4236 = _4234 ? 0 : 1;
    float _4238 = _4228 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _4240 = 2;
    float _4242 = _4196;
    if (!_4220)
    {
        _4240 = 1;
    }
    int _4244 = _4240;
    float _4246 = trunc(_4232);
    int _4248 = int(_4246);
    int _4250 = _4244;
    if (!_4224)
    {
        _4250 = _4236;
    }
    int _4252 = _4250;
    float _4254 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _4256 = _4252 << 6;
    bool _4258 = _4230 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4260 = trunc(_4238);
    int _4262 = int(_4260);
    int _4264 = _4256 + 96;
    uint _4266 = uint(int(uint(_4264) >> uint(2)));
    uint _4268 = uint(int(uint(int(_4266)) >> uint(2)));
    int _4270 = int(_4266) & 3;
    float _4272 = (*spvDescriptorSet0.vp_c15)._m0[int(_4268)][_4270];
    int _4274 = int(_4266) + 1;
    uint _4276 = uint(int(uint(_4274) >> uint(2)));
    int _4278 = _4274 & 3;
    float _4280 = (*spvDescriptorSet0.vp_c15)._m0[int(_4276)][_4278];
    float _4282 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4284 = _4230 + _4282;
    int _4286 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4288 = _4248 + _4286;
    int _4290 = _4288 + 1;
    int _4292 = _4256 + 48;
    uint _4294 = uint(int(uint(_4292) >> uint(2)));
    uint _4296 = uint(int(uint(int(_4294)) >> uint(2)));
    int _4298 = int(_4294) & 3;
    float _4300 = (*spvDescriptorSet0.vp_c15)._m0[int(_4296)][_4298];
    int _4302 = int(_4294) + 1;
    uint _4304 = uint(int(uint(_4302) >> uint(2)));
    int _4306 = _4302 & 3;
    float _4308 = (*spvDescriptorSet0.vp_c15)._m0[int(_4304)][_4306];
    float _4310 = floor(_4254);
    bool _4312 = _4290 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4314 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4316 = _4262 + _4314;
    int _4318 = _4316 + 1;
    int _4320 = _4256 + 104;
    uint _4322 = uint(int(uint(_4320) >> uint(2)));
    uint _4324 = uint(int(uint(int(_4322)) >> uint(2)));
    int _4326 = int(_4322) & 3;
    float _4328 = (*spvDescriptorSet0.vp_c15)._m0[int(_4324)][_4326];
    int _4330 = int(_4322) + 1;
    uint _4332 = uint(int(uint(_4330) >> uint(2)));
    int _4334 = _4330 & 3;
    float _4336 = (*spvDescriptorSet0.vp_c15)._m0[int(_4332)][_4334];
    int _4338 = as_type<int>(_3694);
    float _4340 = _4284;
    int _4342 = as_type<int>(_4254);
    float _4344 = as_type<float>(_4252);
    if (_4258)
    {
        float _4346 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4338 = as_type<int>(_4346);
    }
    int _4348 = _4338;
    int _4350 = _4290 | _4318;
    bool _4352 = _4350 < 0;
    bool _4354 = _4352 || _4312;
    int _4356 = _4256 + 64;
    uint _4358 = uint(int(uint(_4356) >> uint(2)));
    uint _4360 = uint(int(uint(int(_4358)) >> uint(2)));
    int _4362 = int(_4358) & 3;
    float _4364 = (*spvDescriptorSet0.vp_c15)._m0[int(_4360)][_4362];
    int _4366 = int(_4358) + 1;
    uint _4368 = uint(int(uint(_4366) >> uint(2)));
    int _4370 = _4366 & 3;
    float _4372 = (*spvDescriptorSet0.vp_c15)._m0[int(_4368)][_4370];
    float _4374 = -_4310;
    float _4376 = _4254 + _4374;
    bool _4378 = _4318 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4380 = _4378 || _4354;
    int _4382 = _4256 + 56;
    uint _4384 = uint(int(uint(_4382) >> uint(2)));
    uint _4386 = uint(int(uint(int(_4384)) >> uint(2)));
    int _4388 = int(_4384) & 3;
    float _4390 = (*spvDescriptorSet0.vp_c15)._m0[int(_4386)][_4388];
    int _4392 = int(_4384) + 1;
    uint _4394 = uint(int(uint(_4392) >> uint(2)));
    int _4396 = _4392 & 3;
    float _4398 = (*spvDescriptorSet0.vp_c15)._m0[int(_4394)][_4396];
    int _4400 = _4348;
    if (_4258)
    {
        float _4402 = _4284 * as_type<float>(_4348);
        _4340 = _4402;
    }
    float _4404 = _4340;
    int _4406 = as_type<int>(_4404);
    if (_4258)
    {
        float _4408 = _4404 * 0.15915493667125701904296875;
        _3772 = _4408;
    }
    float _4410 = _3772;
    float _4412 = _4410;
    if (!_4380)
    {
        int _4414 = _4318 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4416 = _4414 + _4290;
        _4406 = _4416;
    }
    int _4418 = _4406;
    float _4420 = _3862;
    if (_4258)
    {
        float _4422 = _4410 * 6.283185482025146484375;
        float _4424 = cos(_4422);
        _4420 = _4424;
    }
    float _4426 = _4420;
    float _4428 = precise::max(0.0, _4182);
    if (!_4380)
    {
        int _4430 = _4418 << 2;
        _4400 = _4430;
    }
    int _4432 = _4400;
    float _4434 = -_4194;
    float _4436 = -_4428;
    float _4438 = fma(_4158, _4434, _4436);
    float _4440 = _4196 * _4280;
    float _4442 = as_type<float>(_4318);
    int _4444 = _4432;
    float _4446 = _4440;
    float _4448 = _4438;
    if (_4258)
    {
        float _4450 = _4410 * 6.283185482025146484375;
        float _4452 = sin(_4450);
        _4442 = _4452;
    }
    float _4454 = _4442;
    if (!_4380)
    {
        uint _4456 = uint(int(uint(_4418) >> uint(2)));
        _4342 = int(_4456);
    }
    int _4458 = _4342;
    float _4460 = fma(_3480, _4272, _4440);
    float _4462 = _4460;
    float _4464 = as_type<float>(_4458);
    if (!_4380)
    {
        int _4466 = 12 & _4432;
        _4444 = _4466;
    }
    int _4468 = _4444;
    float _4470 = _4196 * _4308;
    float _4472 = _4182;
    float _4474 = _4300;
    float _4476 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (_4258)
    {
        float _4478 = rsqrt(_4222);
        _4472 = _4478;
    }
    float _4480 = _4472;
    if (_4258)
    {
        float _4482 = _4438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4412 = _4482;
    }
    float _4484 = _4412;
    float _4486 = _4484;
    if (_4258)
    {
        float _4488 = _4426 + (-1.0);
        _4446 = _4488;
    }
    float _4490 = _4446;
    float _4492 = fma(_3480, _4300, _4470);
    if (!_4380)
    {
        int _4494 = _4458 << 4;
        int _4496 = _4494 + _4468;
        _3566 = _4496;
    }
    int _4498 = _3566;
    float _4500 = fma(_3508, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_4258)
    {
        _4474 = _4438;
    }
    float _4502 = _4474;
    float _4504 = fma(_3508, _4328, _4460);
    float _4506 = _4502;
    float _4508 = _4328;
    if (_4258)
    {
        float _4510 = fma(_4454, _4484, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4486 = _4510;
    }
    float _4512 = _4486;
    float _4514 = _4512;
    if (_4258)
    {
        float _4516 = _4490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4462 = _4516;
    }
    float _4518 = _4462;
    if (!_4258)
    {
        _4476 = _4200;
    }
    float _4520 = _4476;
    float _4522 = _4136;
    float _4524 = _4520;
    if (!_4380)
    {
        int _4526 = _4498 + 400;
        uint _4528 = uint(int(uint(_4526) >> uint(2)));
        uint _4530 = uint(int(uint(int(_4528)) >> uint(2)));
        int _4532 = int(_4528) & 3;
        float _4534 = (*spvDescriptorSet0.vp_c15)._m0[int(_4530)][_4532];
        _4522 = _4534;
    }
    float _4536 = _4522;
    if (!_4258)
    {
        _4464 = _4202;
    }
    float _4538 = _4464;
    float _4540 = _4538;
    if (_4258)
    {
        float _4542 = fma(_4438, _4426, _4518);
        _4506 = _4542;
    }
    float _4544 = _4506;
    if (!_4258)
    {
        _4448 = _4212;
    }
    float _4546 = _4448;
    float _4548 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4550 = _4546;
    float _4552 = _4480;
    if (_4258)
    {
        float _4554 = _4480 * _4512;
        _4514 = _4554;
    }
    float _4556 = _4514;
    if (!_4258)
    {
        _4508 = _4214;
    }
    float _4558 = _4508;
    float _4560 = floor(_4500);
    int _4562 = _4256 + 72;
    uint _4564 = uint(int(uint(_4562) >> uint(2)));
    uint _4566 = uint(int(uint(int(_4564)) >> uint(2)));
    int _4568 = int(_4564) & 3;
    float _4570 = (*spvDescriptorSet0.vp_c15)._m0[int(_4566)][_4568];
    int _4572 = int(_4564) + 1;
    uint _4574 = uint(int(uint(_4572) >> uint(2)));
    int _4576 = _4572 & 3;
    float _4578 = (*spvDescriptorSet0.vp_c15)._m0[int(_4574)][_4576];
    float _4580 = _4558;
    if (_4258)
    {
        float _4582 = _4200 * _4556;
        _4524 = _4582;
    }
    float _4584 = _4524;
    if (_4258)
    {
        float _4586 = _4202 * _4556;
        _4540 = _4586;
    }
    float _4588 = _4540;
    float _4590 = _4196 * _4372;
    float _4592 = fma(_3508, _4390, _4492);
    if (_4258)
    {
        float _4594 = _4584 * _4584;
        _4550 = _4594;
    }
    float _4596 = _4550;
    if (_4258)
    {
        float _4598 = _4588 * _4588;
        _4580 = _4598;
    }
    float _4600 = _4580;
    float _4602 = fma(_3480, _4364, _4590);
    float _4604 = _4504 + _4336;
    float _4606 = fma(_4544, _4544, _4596);
    float _4608 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4610 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4612 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4548);
    float _4614 = _4606 + _4600;
    float _4616 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _4618 = _4256 + 80;
    uint _4620 = uint(int(uint(_4618) >> uint(2)));
    uint _4622 = uint(int(uint(int(_4620)) >> uint(2)));
    int _4624 = int(_4620) & 3;
    float _4626 = (*spvDescriptorSet0.vp_c15)._m0[int(_4622)][_4624];
    int _4628 = int(_4620) + 1;
    uint _4630 = uint(int(uint(_4628) >> uint(2)));
    int _4632 = _4628 & 3;
    float _4634 = (*spvDescriptorSet0.vp_c15)._m0[int(_4630)][_4632];
    float _4636 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4608);
    float _4638 = rsqrt(_4614);
    float _4640 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4616);
    float _4642 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4644 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4636);
    float _4646 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4612);
    float _4648 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4640);
    int _4650 = _4256 + 88;
    uint _4652 = uint(int(uint(_4650) >> uint(2)));
    uint _4654 = uint(int(uint(int(_4652)) >> uint(2)));
    int _4656 = int(_4652) & 3;
    float _4658 = (*spvDescriptorSet0.vp_c15)._m0[int(_4654)][_4656];
    int _4660 = int(_4652) + 1;
    uint _4662 = uint(int(uint(_4660) >> uint(2)));
    int _4664 = _4660 & 3;
    float _4666 = (*spvDescriptorSet0.vp_c15)._m0[int(_4662)][_4664];
    float _4668 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4642);
    float _4670 = 1.0 / _4604;
    float _4672 = _4648 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4674 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4676 = fma(_4198, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4674);
    float _4678 = precise::clamp(_4676, 0.0, 1.0);
    float _4680 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4668);
    float _4682 = _4592 + _4398;
    float _4684 = _4672 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4686 = _4646 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4688 = _4680 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4690 = _4638 * _4584;
    float _4692 = -_4684;
    float _4694 = fma(_4692, _4610, 1.0);
    float _4696 = _4644 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4698 = _4688 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4700 = _4690 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4702 = -_4560;
    float _4704 = _4500 + _4702;
    float _4706 = _4454;
    if (!_4380)
    {
        float _4708 = floor(_4238);
        _4706 = _4708;
    }
    float _4710 = _4706;
    float _4712 = fma(_4696, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4698);
    float _4714 = -_4678;
    float _4716 = _4714 + 1.0;
    float _4718 = _4638 * _4544;
    float _4720 = _4638 * _4588;
    float _4722 = _4682 * _4670;
    float _4724 = fma(_4672, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4712);
    float _4726 = -_4700;
    float _4728 = fma(_4718, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4726);
    float _4730 = abs(_4716);
    float _4732 = log2(_4730);
    float _4734 = fma(_3508, _4570, _4602);
    bool _4736 = _4722 >= 0.0;
    float _4738 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4724);
    float _4740 = -_4720;
    float _4742 = fma(_4740, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4728);
    float _4744 = _4734 + _4578;
    bool _4746 = _4722 <= 1.0;
    bool _4748 = _4746 && _4736;
    float _4750 = fma(_4742, -0.5, 0.5);
    float _4752 = _4744 * _4670;
    float _4754 = fma(_4742, 0.5, 0.5);
    float _4756 = _4716;
    if (!_4380)
    {
        float _4758 = floor(_4232);
        _4552 = _4758;
    }
    float _4760 = _4552;
    float _4762 = _4688 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4764 = _4710;
    if (!_4380)
    {
        float _4766 = -_4710;
        float _4768 = _4238 + _4766;
        _4756 = _4768;
    }
    float _4770 = _4756;
    bool _4772 = _4752 >= 0.0;
    bool _4774 = _4772 && _4748;
    float _4776 = _4196 * _4634;
    float _4778 = _4732 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _4780 = _4752 <= 1.0;
    bool _4782 = _4780 && _4774;
    float _4784 = sqrt(_4750);
    float _4786 = fma(_3480, _4626, _4776);
    float _4788 = fma(_3508, _4658, _4786);
    float _4790 = fma(_4754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4792 = exp2(_4778);
    float _4794 = _4688 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4796 = _4788 + _4666;
    float _4798 = fma(_4754, _4790, -0.212114393711090087890625);
    if (_4782)
    {
        float _4800 = float(_4252);
        _4344 = _4800;
    }
    float _4802 = _4344;
    float _4804 = fma(_4696, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4794);
    float _4806 = _4718 + 1.0;
    float _4808 = fma(_4754, _4798, 1.570728778839111328125);
    float _4810 = log2(_4694);
    float _4812 = fma(_4696, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4762);
    float _4814 = fma(_4672, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4804);
    float _4816 = _4784 * 0.636619746685028076171875;
    if (!_4380)
    {
        float _4818 = -_4760;
        float _4820 = _4232 + _4818;
        _4764 = _4820;
    }
    float _4822 = _4764;
    float _4824 = fma(_4672, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4812);
    float _4826 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4814);
    float _4828 = -_4808;
    float _4830 = fma(_4816, _4828, 1.0);
    float _4832 = 1.0 / _4738;
    float _4834 = -_4718;
    float _4836 = fma(_4792, _4806, _4834);
    float _4838 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4824);
    float _4840 = _4796 * _4670;
    float _4842 = _4500;
    float _4844 = _4826;
    float _4846 = _4838;
    if (!_4380)
    {
        float _4848 = rint(_4536);
        float _4850 = precise::max(_4848, 0.0);
        uint _4852 = uint(_4850);
        uint _4854 = clamp(_4852, 0u, 65535u);
        _4842 = as_type<float>(_4854);
    }
    float _4856 = _4842;
    float _4858 = _4810 * 0.693147182464599609375;
    float _4860 = fma(_4836, 0.5, 0.5);
    float2 _12787 = float2(_4376, _4704);
    float _4862 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12787, float2(0.0), isnan(_12787)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12787, float2(0.0), isnan(_12787)), level(0.0)).x;
    float _4864 = _4858 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4866 = _4802;
    if (_4782)
    {
        float _4868 = rint(_4802);
        float _4870 = precise::max(_4868, 0.0);
        uint _4872 = uint(_4870);
        uint _4874 = clamp(_4872, 0u, 65535u);
        _4866 = as_type<float>(_4874);
    }
    float _4876 = _4866;
    float _4878 = _4826 * _4832;
    float _4880 = _4838 * _4832;
    float _4882 = fma(_4878, 0.5, 0.5);
    float _4884 = fma(_4880, -0.5, 0.5);
    float _4886 = _4856;
    if (!_4380)
    {
        float3 _12833 = float3(_4822, _4770, float(as_type<int>(_4856)));
        float3 _12837 = select(_12833, float3(0.0), isnan(_12833));
        float _4888 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12837.xy, uint(rint(_12837.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12837.xy, uint(rint(_12837.z)), level(0.0)).x;
        _4886 = _4888;
    }
    float _4890 = _4886;
    float _4892 = _4832;
    if (_4782)
    {
        float3 _12852 = float3(_4722, _4752, float(as_type<int>(_4876)));
        float3 _12854 = select(_12852, float3(0.0), isnan(_12852));
        float _4894 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12854.xy, uint(rint(_12854.z)), _4840, level(0.0));
        _4892 = _4894;
    }
    float _4896 = _4892;
    float3 _12864 = float3(_4882, _4884, _4864);
    float _4898 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12864, float3(0.0), isnan(_12864)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12864, float3(0.0), isnan(_12864)), level(0.0)).x;
    float3 _12873 = float3(_4882, _4884, _4864);
    float4 _4901 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12873, float3(0.0), isnan(_12873)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12873, float3(0.0), isnan(_12873)), level(0.0)).xyzw;
    float _4903 = _4901.x;
    float _4905 = _4901.y;
    float _4907 = _4901.z;
    float _4909 = _4901.w;
    float2 _12889 = float2(_4830, _4860);
    float3 _4913 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12889, float2(0.0), isnan(_12889)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12889, float2(0.0), isnan(_12889)), level(0.0)).xyz;
    float _4915 = _4913.x;
    float _4917 = _4913.y;
    float _4919 = _4913.z;
    float _4921 = abs(_4210);
    float _4923 = log2(_4921);
    float _4925 = _4688 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4927 = fma(_4696, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4925);
    float _4929 = fma(_4672, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4927);
    float _4931 = _4923 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4933 = exp2(_4931);
    float _4935 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4929);
    float _4937 = _4826 + _4738;
    float _4939 = _4738 * 0.5;
    float _4941 = _4935 + _4738;
    out.gl_Position.x = _4826;
    out.gl_Position.y = _4838;
    out.gl_Position.z = _4935;
    out.gl_Position.w = _4738;
    float _4943 = _4937 * 0.5;
    float _4945 = fma(_4838, -0.5, _4939);
    float _4947 = _4941 * 0.5;
    out.m_98.x = _4943;
    out.m_98.y = _4945;
    out.m_98.z = _4947;
    out.m_98.w = _4738;
    float _4949 = fma(_4933, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4951 = precise::clamp(_4949, 0.0, 1.0);
    float _4953 = fma(_4951, -2.0, 3.0);
    bool _4955 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4957 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4959 = _4955 || _4957;
    bool _4961 = isnan(0.5);
    bool _4963 = _4959 || _4961;
    float _4965 = _4732 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4967 = _4951 * _4951;
    float _4969 = _4967 * _4953;
    float _4971 = exp2(_4965);
    bool _4973 = _4210 <= 8000.0;
    bool _4975 = isnan(_4210);
    bool _4977 = _4973 || _4975;
    bool _4979 = isnan(8000.0);
    bool _4981 = _4977 || _4979;
    float _4983 = float(_4981);
    float _4985 = -_4969;
    float _4987 = _4985 + 1.0;
    float _4989 = _4935;
    if (_4963)
    {
        _4844 = 1.0;
    }
    float _4991 = _4844;
    float _4993 = fma(_4987, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4969);
    float _4995 = _4983 * _4993;
    float _4997 = _4991;
    if (!_4963)
    {
        float _4999 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _5001 = _4999 * 0.15915493667125701904296875;
        float _5003 = _5001 * 6.283185482025146484375;
        float _5005 = cos(_5003);
        float _5007 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _5009 = _5007 * 0.15915493667125701904296875;
        float _5011 = _5001 * 6.283185482025146484375;
        float _5013 = sin(_5011);
        float _5015 = 1.0 / _5005;
        float _5017 = _5009 * 6.283185482025146484375;
        float _5019 = cos(_5017);
        float _5021 = _5013 * _5015;
        float _5023 = _5009 * 6.283185482025146484375;
        float _5025 = sin(_5023);
        float _5027 = _5019 * _5021;
        float _5029 = 1.0 / _5027;
        float _5031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5033 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5031;
        float _5035 = 1.0 / _5033;
        float _5037 = _5025 * _5029;
        float _5039 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5041 = fma(_4210, _5037, _5039);
        float _5043 = _5041 * _5035;
        float _5045 = precise::clamp(_5043, 0.0, 1.0);
        _4989 = _5035;
        _4846 = _5029;
        _4997 = _5045;
    }
    float _5047 = _4989;
    float _5049 = _4846;
    float _5051 = _4997;
    float _5053 = _4995 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5055 = -_4862;
    float _5057 = _5055 + 1.0;
    float _5059 = -_4971;
    float _5061 = _5059 + 1.0;
    float _5063 = _5047;
    float _5065 = _5049;
    float _5067 = _5053;
    if (!_4782)
    {
        _5063 = 1.0;
    }
    float _5069 = _5063;
    float _5071 = _5057 * _5053;
    float _5073 = precise::clamp(_5071, 0.0, 1.0);
    float _5075 = _5069;
    if (_4782)
    {
        bool _5077 = _4896 >= _4840;
        bool _5079 = isnan(_4896);
        bool _5081 = _5077 || _5079;
        bool _5083 = isnan(_4840);
        bool _5085 = _5081 || _5083;
        float _5087 = float(_5085);
        _5075 = _5087;
    }
    float _5089 = _5075;
    float _5091 = _5061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5093 = _5091;
    if (_4380)
    {
        _5065 = 1.0;
    }
    float _5095 = _5065;
    float _5097 = _5095;
    if (!_4380)
    {
        int _5099 = _4418 << 4;
        int _5101 = _5099 + 2048;
        uint _5103 = uint(int(uint(_5101) >> uint(2)));
        uint _5105 = uint(int(uint(int(_5103)) >> uint(2)));
        int _5107 = int(_5103) & 3;
        float _5109 = (*spvDescriptorSet0.vp_c15)._m0[int(_5105)][_5107];
        int _5111 = int(_5103) + 1;
        uint _5113 = uint(int(uint(_5111) >> uint(2)));
        int _5115 = _5111 & 3;
        float _5117 = (*spvDescriptorSet0.vp_c15)._m0[int(_5113)][_5115];
        int _5119 = _5101 + 8;
        uint _5121 = uint(int(uint(_5119) >> uint(2)));
        uint _5123 = uint(int(uint(int(_5121)) >> uint(2)));
        int _5125 = int(_5121) & 3;
        float _5127 = (*spvDescriptorSet0.vp_c15)._m0[int(_5123)][_5125];
        int _5129 = int(_5121) + 1;
        uint _5131 = uint(int(uint(_5129) >> uint(2)));
        int _5133 = _5129 & 3;
        float _5135 = (*spvDescriptorSet0.vp_c15)._m0[int(_5131)][_5133];
        float _5137 = _4196 * _5117;
        float _5139 = fma(_3480, _5109, _5137);
        float _5141 = fma(_3508, _5127, _5139);
        float _5143 = _5141 + _5135;
        float _5145 = precise::clamp(_5143, 0.0, 1.0);
        float _5147 = -_5145;
        float _5149 = _5147 + _4890;
        float _5151 = fma(_5149, 500.0, 1.5);
        float _5153 = exp2(_5151);
        float _5155 = 0.0 + _5153;
        float _5157 = precise::clamp(_5155, 0.0, 1.0);
        _5097 = _5157;
        _5067 = _5109;
        _4242 = 500.0;
    }
    float _5159 = _5097;
    float _5161 = _5067;
    float _5163 = _4242;
    float _5165 = _5089 * _5159;
    float _5167 = _5091 * _4898;
    float _5169 = -_5073;
    float _5171 = fma(_5169, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5173 = -_5091;
    float _5175 = _5173 + 1.0;
    bool _5177 = _4198 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5179 = isnan(_4198);
    bool _5181 = _5177 || _5179;
    bool _5183 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5185 = _5181 || _5183;
    float _5187 = _4909 * _5167;
    float _5189 = -_5165;
    float _5191 = fma(_5189, _5171, 1.0);
    float _5193 = precise::clamp(_5191, 0.0, 1.0);
    float _5195 = _4919 * _5167;
    float _5197 = _4909 * _5175;
    float _5199 = fma(_4915, _5187, _4903);
    float _5201 = fma(_4917, _5187, _4905);
    float _5203 = _5193 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5205 = fma(_4909, _5195, _4907);
    float _5207 = _5051 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_100.x = _5203;
    float _5209 = _5161;
    float _5211 = _5163;
    float _5213 = _5175;
    float _5215 = _5193;
    float _5217 = _5187;
    if (!_5185)
    {
        _5093 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5219 = _5093;
    float _5221 = _5219;
    float _5223 = _5219;
    if (!_5185)
    {
        _5209 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5225 = _5209;
    out.m_102.x = _5199;
    out.m_102.y = _5201;
    out.m_102.z = _5205;
    out.m_102.w = _5197;
    float _5227 = _5225;
    float _5229 = _5225;
    if (!_5185)
    {
        _5211 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5231 = _5211;
    float _5233 = _5231;
    float _5235 = _5231;
    if (!_5185)
    {
        _5213 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5237 = _5213;
    float _5239 = _5237;
    float _5241 = _5237;
    if (!_5185)
    {
        _5215 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5243 = _5215;
    float _5245 = _5243;
    float _5247 = _5243;
    if (!_5185)
    {
        _5217 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5249 = _5217;
    bool _5251 = !_5185;
    float _5253 = _5249;
    float _5255 = _5249;
    if (!_5251)
    {
        bool _5257 = _4198 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5259 = isnan(_4198);
        bool _5261 = _5257 || _5259;
        bool _5263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5265 = _5261 || _5263;
        if (!_5265)
        {
            float _5267 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5269 = _4198 + _5267;
            float _5271 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5273 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5271;
            float _5275 = 1.0 / _5273;
            float _5277 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5279 = _5277 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5281 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5283 = _5281 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5285 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5287 = _5285 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5289 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5291 = _5289 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5293 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5295 = _5293 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5297 = _5269 * _5275;
            float _5299 = precise::clamp(_5297, 0.0, 1.0);
            float _5301 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5303 = _5301 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5305 = fma(_5299, _5279, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5307 = fma(_5299, _5303, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5309 = fma(_5299, _5283, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5311 = fma(_5299, _5287, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5313 = fma(_5299, _5291, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5315 = fma(_5299, _5295, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5229 = _5305;
            _5247 = _5313;
            _5223 = _5307;
            _5241 = _5311;
            _5235 = _5309;
            _5255 = _5315;
            _5317 = true;
        }
        else
        {
            bool _5319 = _4198 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5321 = isnan(_4198);
            bool _5323 = _5319 || _5321;
            bool _5325 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5327 = _5323 || _5325;
            if (!_5327)
            {
                _5221 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5329 = _5221;
            _5223 = _5329;
            if (!_5327)
            {
                _5227 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5331 = _5227;
            _5229 = _5331;
            if (!_5327)
            {
                _5233 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5333 = _5233;
            _5235 = _5333;
            if (!_5327)
            {
                _5239 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5335 = _5239;
            _5241 = _5335;
            if (!_5327)
            {
                _5245 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5337 = _5245;
            _5247 = _5337;
            if (!_5327)
            {
                _5253 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5339 = _5253;
            bool _5341 = !_5327;
            _5255 = _5339;
            if (!_5341)
            {
                bool _5343 = _4198 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5345 = isnan(_4198);
                bool _5347 = _5343 || _5345;
                bool _5349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5351 = _5347 || _5349;
                if (!_5351)
                {
                    float _5353 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5355 = _4198 + _5353;
                    float _5357 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5359 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5357;
                    float _5361 = 1.0 / _5359;
                    float _5363 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5365 = _5363 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5367 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5369 = _5367 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5371 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5373 = _5371 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5375 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5377 = _5375 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5379 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5381 = _5379 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5383 = _5355 * _5361;
                    float _5385 = precise::clamp(_5383, 0.0, 1.0);
                    float _5387 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5389 = _5387 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5391 = fma(_5385, _5365, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5393 = fma(_5385, _5389, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5395 = fma(_5385, _5369, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5397 = fma(_5385, _5373, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5399 = fma(_5385, _5377, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5401 = fma(_5385, _5381, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5229 = _5391;
                    _5247 = _5399;
                    _5223 = _5393;
                    _5241 = _5397;
                    _5235 = _5395;
                    _5255 = _5401;
                    _5317 = true;
                }
                else
                {
                    _5229 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5247 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5223 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5241 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5235 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5255 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5317 = false;
    float _5403 = _5229;
    float _5405 = _5247;
    float _5407 = _5223;
    float _5409 = _5241;
    float _5411 = _5235;
    float _5413 = _5255;
    float _5415 = fma(_3914, -0.5, 0.5);
    float _5417 = precise::clamp(_5415, 0.0, 1.0);
    float _5419 = -_5403;
    float _5421 = _5419 + _5405;
    float _5423 = _5207 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5425 = -_5407;
    float _5427 = _5425 + _5409;
    out.m_104.x = 0.0;
    float _5429 = fma(_5417, _5421, _5403);
    float _5431 = fma(_5417, _5427, _5407);
    out.m_65.x = _5423;
    float _5433 = -_5411;
    float _5435 = _5433 + _5413;
    float _5437 = _5429 * 0.586610972881317138671875;
    bool _5439 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5441 = fma(_5417, _5435, _5411);
    float _5443 = fma(_5431, 0.298911988735198974609375, _5437);
    bool _5445 = _5051 > 0.0;
    bool _5447 = isnan(_5051);
    bool _5449 = _5445 || _5447;
    bool _5451 = isnan(0.0);
    bool _5453 = _5449 || _5451;
    float _5455 = fma(_5441, 0.114477999508380889892578125, _5443);
    float _5457 = -_5455;
    float _5459 = _5431 + _5457;
    float _5461 = -_5455;
    float _5463 = _5429 + _5461;
    float _5465 = -_5455;
    float _5467 = _5441 + _5465;
    float _5469 = fma(_5459, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5455);
    float _5471 = fma(_5463, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5455);
    float _5473 = fma(_5467, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5455);
    bool _5475 = !_5439;
    if (!_5475)
    {
        float _5477 = -_4144;
        float _5479 = _5477 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5481 = -_4148;
        float _5483 = _5481 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5485 = -_4154;
        float _5487 = _5485 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5489 = _5479 * _5479;
        float _5491 = fma(_5483, _5483, _5489);
        float _5493 = fma(_5487, _5487, _5491);
        float _5495 = sqrt(_5493);
        float _5497 = rsqrt(_5493);
        float _5499 = -_5495;
        float _5501 = _5499 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5503 = _5501 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5505 = precise::clamp(_5503, 0.0, 1.0);
        float _5507 = _5483 * _5497;
        float _5509 = _5479 * _5497;
        float _5511 = abs(_5505);
        float _5513 = log2(_5511);
        float _5515 = _5487 * _5497;
        float _5517 = _5507 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5519 = _3914 * _5509;
        float _5521 = -_5509;
        float _5523 = -_5517;
        float _5525 = fma(_5521, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5523);
        float _5527 = fma(_3918, _5507, _5519);
        float _5529 = -_5515;
        float _5531 = fma(_5529, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5525);
        float _5533 = fma(_3920, _5515, _5527);
        float _5535 = precise::clamp(_5533, 0.0, 1.0);
        float _5537 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5539 = _5531 + _5537;
        float _5541 = _5513 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5543 = _5539 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5545 = precise::clamp(_5543, 0.0, 1.0);
        float _5547 = exp2(_5541);
        float _5549 = _5547 * _5545;
        float _5551 = _5535 * _5549;
        float _5553 = _5551 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5555 = _5551 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5557 = _5551 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _5553;
        out.m_104.y = _5555;
        out.m_104.z = _5557;
    }
    out.m_106.x = _5469;
    out.m_106.y = _5471;
    out.m_106.z = _5473;
    if (_5453)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_65.x = 0.0;
    float _5559 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5559;
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
    bool _5317 = false;
    bool _3968 = false;
    bool _489 = false;
    bool _345 = false;
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
        float _5628 = as_type<float>(_149);
        out.gl_Position.z = _5628;
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
        float _5691 = as_type<float>(_181);
        out.gl_Position.z = _5691;
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
    float _325 = _319;
    float _343;
    if (!_323)
    {
        float _327 = in.m_72.x;
        float _329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _331 = _327 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _335 = _333 * _329;
        float _337 = floor(_335);
        float _339 = -_337;
        float _341 = _335 + _339;
        _343 = _341;
        _345 = true;
    }
    else
    {
        _343 = _175;
    }
    _345 = false;
    float _347 = _343;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _351 = _347 + _349;
    float _353 = in.m_74.x;
    float _355 = in.m_74.y;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _361 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _363 = isnan(_347);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _377 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _379 = isnan(_347);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _389;
    bool _393 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _395 = isnan(_347);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = 1.0 / _359;
    float _407 = -_371;
    float _409 = _407 + 1.0;
    bool _411 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _413 = 1.0 / _375;
    float _415 = _391 * _405;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _421 = -_403;
    float _423 = _421 + 1.0;
    float _425 = _319 * _353;
    float _427 = fma(_415, _351, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _429 = _387 * _409;
    float _431 = -_387;
    float _433 = _431 + 1.0;
    float _435 = _371 * _423;
    float _437 = _419 * _413;
    float _439 = _427 * _429;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _443 = _347 + _441;
    float _445 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[115].x, _439);
    float _447 = fma(_437, _443, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _451 = fma(_447, _435, _445);
    float _453 = _321 * _355;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _457 = _449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _459 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[117].x, _451);
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _459 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _467 = _461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_76.x = _457;
    out.m_76.y = _463;
    out.m_76.z = _467;
    out.m_76.w = _465;
    bool _469 = !_411;
    float _487;
    if (!_469)
    {
        float _471 = in.m_72.x;
        float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _475 = _471 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _477 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _479 = _477 * _473;
        float _481 = floor(_479);
        float _483 = -_481;
        float _485 = _479 + _483;
        _487 = _485;
        _489 = true;
    }
    else
    {
        _487 = _175;
    }
    _489 = false;
    float _491 = _487;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _495 = _491 + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _501 = _491 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _503 = isnan(_491);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _517 = _491 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _519 = isnan(_491);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _529;
    bool _533 = _491 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _535 = isnan(_491);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = 1.0 / _499;
    float _547 = -_511;
    float _549 = _547 + 1.0;
    bool _551 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _553 = 1.0 / _515;
    float _555 = _531 * _545;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _561 = -_543;
    float _563 = _561 + 1.0;
    float _565 = fma(_555, _495, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _567 = _527 * _549;
    float _569 = -_527;
    float _571 = _569 + 1.0;
    float _573 = _511 * _563;
    float _575 = _559 * _553;
    float _577 = _565 * _567;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _581 = _491 + _579;
    float _583 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[131].x, _577);
    float _585 = fma(_575, _581, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _589 = fma(_585, _573, _583);
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _593 = _587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _597 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[133].x, _589);
    float _599 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = _597 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _593;
    out.m_78.y = _599;
    out.m_78.z = _601;
    out.m_78.w = _603;
    bool _605 = !_551;
    if (!_605)
    {
        float _607 = in.m_72.x;
        float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _611 = _607 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _615 = _613 * _609;
        float _617 = floor(_615);
        float _619 = -_617;
        float _621 = _615 + _619;
        _177 = _621;
    }
    float _623 = _177;
    float _625 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _627 = int(_625);
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _631 = _629 != 0;
    float _633 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _635 = int(_633);
    float _637 = float(_627);
    float _639 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _641 = int(_639);
    if (_631)
    {
        _325 = 1.0;
    }
    float _643 = _325;
    float _645 = float(_635);
    float _647 = 1.0 / _637;
    float _649 = 1.0 / _645;
    float _651 = float(uint(_641));
    int _653 = ~_641;
    int _655 = _653 + 1;
    float _657 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _659 = int(_657);
    float _661 = _647 * _131;
    float _663 = _645;
    float _665 = _647;
    float _667 = _643;
    if (_631)
    {
        float _669 = in.m_72.x;
        float _671 = in.m_72.y;
        _663 = _669;
        _665 = _671;
    }
    float _673 = _663;
    float _675 = _665;
    float _677 = _649 * _131;
    float _679 = 1.0 / _651;
    float _681 = float(uint(_659));
    float _683 = trunc(_677);
    int _685 = int(_683);
    float _687 = 1.0 / _681;
    int _689 = as_type<int>(_679) + (-2);
    int _691 = as_type<int>(_679);
    if (_631)
    {
        _691 = 0;
    }
    int _693 = _691;
    float _695 = 0.0;
    float _697 = _673;
    float _699 = _675;
    int _701 = _693;
    if (_631)
    {
        _695 = _675;
    }
    float _703 = _695;
    float _705 = trunc(_661);
    int _707 = int(_705);
    float _709 = float(uint(_685));
    float _711 = as_type<float>(_689) * _709;
    float _713 = _709;
    float _715 = _703;
    if (_631)
    {
        _713 = _673;
    }
    float _717 = _713;
    float _719 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _721 = int(_719);
    int _723 = as_type<int>(_687) + (-2);
    float _725 = 0.0;
    float _727 = _717;
    if (_631)
    {
        _725 = _717;
    }
    float _729 = _725;
    float _731 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _733 = int(_731);
    float _735 = float(uint(_707));
    float _737 = as_type<float>(_723) * _735;
    float _739 = _735;
    float _741 = _729;
    if (_631)
    {
        _739 = 1.0;
    }
    float _743 = _739;
    float _745 = trunc(_711);
    float _747 = precise::max(_745, 0.0);
    uint _750 = uint(_747);
    float _752 = float(uint(_721));
    float _754 = trunc(_737);
    float _756 = precise::max(_754, 0.0);
    uint _758 = uint(_756);
    float _760 = float(_733);
    float _762 = 1.0 / _760;
    float _764 = 1.0 / _752;
    float _766 = _760;
    int _768 = as_type<int>(_752);
    float _770 = _743;
    if (_631)
    {
        _766 = _717;
    }
    float _772 = _766;
    float _774 = _772;
    if (_631)
    {
        _768 = 0;
    }
    int _776 = _768;
    int _778 = _776;
    if (!_631)
    {
        float _780 = in.m_72.x;
        float _782 = in.m_72.y;
        float _784 = in.m_72.z;
        float _786 = _780 * 3.1415927410125732421875;
        float _788 = _786 * 0.15915493667125701904296875;
        float _790 = _782 * 3.1415927410125732421875;
        float _792 = _790 * 0.15915493667125701904296875;
        float _794 = _788 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = _792 * 6.283185482025146484375;
        float _800 = sin(_798);
        _667 = 7.345489978790283203125;
        _697 = _780;
        _770 = 5.839270114898681640625;
        _774 = _784;
        _727 = _782;
        _699 = _782;
        _701 = 1;
        _715 = _800;
        _778 = 2;
        _741 = _796;
    }
    float _802 = _667;
    float _804 = _697;
    float _806 = _770;
    float _808 = _774;
    float _810 = _727;
    float _812 = _699;
    int _814 = _701;
    float _816 = _715;
    int _818 = _778;
    float _820 = _741;
    int _822 = _655 * int(_750);
    int _824 = _822 + _685;
    int _826 = ~_659;
    int _828 = _826 + 1;
    float _830 = _762 * _131;
    float _832 = _802 * _804;
    float _834 = in.m_72.z;
    float _836 = in.m_72.w;
    float _838 = _806 * _808;
    float _840 = float(uint(_824));
    int _842 = _828 * int(_758);
    int _844 = _842 + _707;
    float _846 = floor(_832);
    float _848 = float(_641);
    float _850 = _802 * _810;
    float _852 = as_type<float>(_689) * _840;
    float _854 = float(uint(_844));
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _858 = _623 + _856;
    float _860 = float(_685);
    float _862 = _812 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _864 = trunc(_830);
    int _866 = int(_864);
    float _868 = as_type<float>(_723) * _854;
    bool _870 = _860 >= _848;
    bool _872 = isnan(_860);
    bool _874 = _870 || _872;
    bool _876 = isnan(_848);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = _804 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _884 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _886 = as_type<int>(_764) + (-2);
    float _888 = trunc(_852);
    float _890 = precise::max(_888, 0.0);
    uint _892 = uint(_890);
    float _894 = -_846;
    float _896 = _832 + _894;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _900 = _898 != 0;
    bool _902 = _836 > 0.5;
    bool _904 = _834 > 0.5;
    float _906 = floor(_838);
    float _908 = float(uint(_866));
    bool _910 = _812 > 0.5;
    int _912 = ~_641;
    int _914 = _912 + 1;
    float _916 = as_type<float>(_886) * _908;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _928 = _926 != 0;
    float _930 = trunc(_868);
    float _932 = precise::max(_930, 0.0);
    uint _934 = uint(_932);
    int _936 = int(_750) + int(_892);
    int _938 = ~_659;
    int _940 = _938 + 1;
    float _942 = -_221;
    int _944 = _910 ? as_type<int>(_942) : as_type<int>(_221);
    float _946 = -_906;
    float _948 = _838 + _946;
    float _950 = -_225;
    int _952 = _904 ? as_type<int>(_950) : as_type<int>(_225);
    float _954 = trunc(_916);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    int _960 = _914 * _936;
    int _962 = _960 + _685;
    bool _964 = !_928;
    float _966 = _964 ? _225 : as_type<float>(_952);
    float _968 = _896 * _848;
    int _970 = int(_758) + int(_934);
    float _972 = floor(_850);
    int _974 = int(_902);
    int _976 = _904 ? 2 : 0;
    int _978 = _974 | _976;
    int _980 = _900 ? 4 : 0;
    int _982 = _978 | _980;
    int _984 = _920 ? 8 : 0;
    int _986 = _982 | _984;
    int _988 = _924 ? 16 : 0;
    int _990 = _986 | _988;
    int _992 = _928 ? 32 : 0;
    int _994 = _990 | _992;
    int _996 = _910 ? 64 : 0;
    int _998 = _994 | _996;
    int _1000 = _998 & 64;
    bool _1002 = !_924;
    float _1004 = _1002 ? _221 : as_type<float>(_944);
    int _1006 = _940 * _970;
    int _1008 = _1006 + _707;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1012 = _1010 != 0;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1016 = _1014 != 0;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1020 = _1018 != 0;
    bool _1022 = !_900;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = trunc(_968);
    int _1028 = int(_1026);
    float _1030 = float(_659);
    float _1032 = float(_707);
    bool _1034 = uint(_962) >= uint(_641);
    float _1036 = _948 * _1030;
    int _1038 = ~_721;
    int _1040 = _1038 + 1;
    float _1042 = trunc(_880);
    int _1044 = int(_1042);
    bool _1046 = !_1016;
    int _1048 = _1046 ? 0 : 1;
    bool _1050 = !_1012;
    int _1052 = _1050 ? 0 : 1;
    int _1054 = _1040 * int(_958);
    int _1056 = _1054 + _866;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1060 = _1058 != 0;
    bool _1062 = uint(_1008) >= uint(_659);
    float _1064 = trunc(_1036);
    int _1066 = int(_1064);
    bool _1068 = _1032 >= _1030;
    bool _1070 = isnan(_1032);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(_1030);
    bool _1076 = _1072 || _1074;
    float _1078 = float(_1076);
    bool _1080 = !_1020;
    int _1082 = _1080 ? 0 : 1;
    bool _1084 = !_1060;
    int _1086 = _1084 ? 0 : 1;
    bool _1088 = !_1062;
    int _1090 = _1088 ? 0 : (-1);
    float _1092 = trunc(_1078);
    int _1094 = int(_1092);
    bool _1096 = !_1034;
    int _1098 = _1096 ? 0 : (-1);
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1110 = _1108 != 0;
    int _1112 = abs(_1024);
    int _1114 = ~_936;
    int _1116 = _1114 + _1098;
    int _1118 = _1116 + 1;
    float _1120 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1122 = log2(_1120);
    float _1124 = -_972;
    float _1126 = _850 + _1124;
    float _1128 = float(uint(_1056));
    int _1130 = _1028 * _1112;
    int _1132 = _1130 + _685;
    bool _1134 = !_1106;
    int _1136 = _1134 ? 0 : 1;
    int _1138 = _641 * _1118;
    int _1140 = _1138 + _685;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1144 = _1142 != 0;
    float _1146 = as_type<float>(_886) * _1128;
    bool _1148 = _1000 != 0;
    float _1150 = _171 * _131;
    int _1152 = ~_970;
    int _1154 = _1152 + _1090;
    int _1156 = _1154 + 1;
    bool _1158 = !_1144;
    int _1160 = _1158 ? 0 : 1;
    float _1162 = _848 * _1150;
    bool _1164 = _641 == 0;
    int _1166 = _659 * _1156;
    int _1168 = _1166 + _707;
    bool _1170 = !_1102;
    int _1172 = _1170 ? 0 : 1;
    float _1174 = trunc(_1146);
    float _1176 = precise::max(_1174, 0.0);
    uint _1178 = uint(_1176);
    bool _1180 = _659 == 0;
    float _1182 = _1030 * _1150;
    int _1184 = ~_1044;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    bool _1190 = !_1164;
    int _1192 = _1190 ? _1140 : (-1);
    int _1194 = ~_1094;
    int _1196 = _1194 + 1;
    int _1198 = _1196 + 1;
    float _1200 = trunc(_1162);
    int _1202 = int(_1200);
    bool _1204 = !_1180;
    int _1206 = _1204 ? _1168 : (-1);
    int _1208 = _1192 * _1188;
    int _1210 = _641 + (-1);
    int _1212 = abs(_1048);
    int _1214 = _1206 * _1198;
    int _1216 = _659 + (-1);
    int _1218 = _1044 * _1210;
    int _1220 = _1218 + _1208;
    int _1222 = abs(_1136);
    float _1224 = trunc(_1182);
    int _1226 = int(_1224);
    int _1228 = abs(_1052);
    int _1230 = _1094 * _1216;
    int _1232 = _1230 + _1214;
    int _1234 = _1220 * _1212;
    int _1236 = abs(_1160);
    float _1238 = _804 * 2.0;
    int _1240 = ~_721;
    int _1242 = _1240 + 1;
    int _1244 = _1232 * _1222;
    int _1246 = abs(_1082);
    int _1248 = _1202 * _1228;
    int _1250 = _1248 + _1234;
    int _1252 = abs(_1086);
    int _1254 = _1066 * _1236;
    int _1256 = _1254 + _707;
    int _1258 = int(_958) + int(_1178);
    int _1260 = _1132 * _1246;
    int _1262 = _1260 + _1250;
    float _1264 = floor(_1238);
    int _1266 = abs(_1172);
    int _1268 = _1242 * _1258;
    int _1270 = _1268 + _866;
    float _1272 = -_225;
    int _1274 = _902 ? as_type<int>(_1272) : as_type<int>(_225);
    int _1276 = _1028 * _1252;
    int _1278 = _1276 + _1262;
    float _1280 = -_221;
    int _1282 = _904 ? as_type<int>(_1280) : as_type<int>(_221);
    int _1284 = _1226 * _1266;
    int _1286 = _1284 + _1244;
    bool _1288 = uint(_1270) >= uint(_721);
    float _1290 = float(_721);
    float _1292 = float(_866);
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1296 = _1294 != 0;
    float _1298 = _1290 * _1150;
    bool _1300 = !_1110;
    int _1302 = _1300 ? 0 : 1;
    float _1304 = float(uint(_1278));
    bool _1306 = _1292 >= _1290;
    bool _1308 = isnan(_1292);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan(_1290);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = _1126 * _1290;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1322 = _1320 != 0;
    float _1324 = as_type<float>(_689) * _1304;
    bool _1326 = !_1296;
    int _1328 = _1326 ? 0 : 1;
    float _1330 = trunc(_1298);
    int _1332 = int(_1330);
    int _1334 = abs(_1302);
    bool _1336 = !_920;
    float _1338 = _1336 ? _225 : as_type<float>(_1274);
    bool _1340 = !_1322;
    int _1342 = _1340 ? 0 : 1;
    int _1344 = abs(_1328);
    float _1346 = trunc(_1324);
    float _1348 = precise::max(_1346, 0.0);
    uint _1350 = uint(_1348);
    bool _1352 = !_1288;
    int _1354 = _1352 ? 0 : (-1);
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1370 = _1368 != 0;
    int _1372 = _1256 * _1334;
    int _1374 = _1372 + _1286;
    float _1376 = trunc(_1316);
    int _1378 = int(_1376);
    int _1380 = ~_641;
    int _1382 = _1380 + 1;
    bool _1384 = !_1362;
    int _1386 = _1384 ? 0 : 1;
    int _1388 = _1066 * _1344;
    int _1390 = _1388 + _1374;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1394 = _1392 != 0;
    int _1396 = ~_1258;
    int _1398 = _1396 + _1354;
    int _1400 = _1398 + 1;
    int _1402 = _1382 * int(_1350);
    int _1404 = _1402 + _1278;
    float _1406 = float(uint(_1390));
    float _1408 = trunc(_1318);
    int _1410 = int(_1408);
    bool _1412 = !_1358;
    int _1414 = _1412 ? 0 : 1;
    int _1416 = _721 * _1400;
    int _1418 = _1416 + _866;
    bool _1420 = _721 == 0;
    float _1422 = as_type<float>(_723) * _1406;
    float _1424 = float(uint(_1404));
    int _1426 = ~_1378;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    float _1432 = _1406;
    if (_1394)
    {
        float _1434 = in.m_72.w;
        _1432 = _1434;
    }
    float _1436 = _1432;
    bool _1438 = !_1420;
    int _1440 = _1438 ? _1418 : (-1);
    float _1442 = as_type<float>(_689) * _1424;
    float _1444 = trunc(_1422);
    float _1446 = precise::max(_1444, 0.0);
    uint _1448 = uint(_1446);
    int _1450 = abs(_1386);
    int _1452 = _1440 * _1430;
    int _1454 = _721 + (-1);
    int _1456 = abs(_1414);
    float _1458 = trunc(_1442);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    int _1464 = abs(_1342);
    int _1466 = _1378 * _1454;
    int _1468 = _1466 + _1452;
    int _1470 = _1468 * _1450;
    int _1472 = ~_659;
    int _1474 = _1472 + 1;
    bool _1476 = _641 == 0;
    int _1478 = _1332 * _1456;
    int _1480 = _1478 + _1470;
    int _1482 = _1410 * _1464;
    int _1484 = _1482 + _866;
    float _1486 = as_type<float>(_1464);
    if (_1394)
    {
        float _1488 = _1436 * 3.1415927410125732421875;
        _1486 = _1488;
    }
    float _1490 = _1486;
    int _1492 = ~_641;
    int _1494 = _1492 + 1;
    int _1496 = _1474 * int(_1448);
    int _1498 = _1496 + _1390;
    float _1500 = _1490;
    if (_1394)
    {
        float _1502 = _1490 * 0.15915493667125701904296875;
        _1500 = _1502;
    }
    float _1504 = _1500;
    int _1506 = int(_1350) + int(_1462);
    bool _1508 = !_1366;
    int _1510 = _1508 ? 0 : 1;
    float _1512 = float(uint(_1498));
    float _1514 = _1504;
    if (_1394)
    {
        float _1516 = _1504 * 6.283185482025146484375;
        float _1518 = sin(_1516);
        _1514 = _1518;
    }
    float _1520 = _1514;
    int _1522 = _1494 * _1506;
    int _1524 = _1522 + _1278;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1528 = _1526 != 0;
    int _1530 = abs(_1510);
    float _1532 = as_type<float>(_723) * _1512;
    bool _1534 = !_1370;
    int _1536 = _1534 ? 0 : 1;
    bool _1538 = uint(_1524) >= uint(_641);
    int _1540 = _1484 * _1530;
    int _1542 = _1540 + _1480;
    float _1544 = float(uint(_1132));
    float _1546 = trunc(_1532);
    float _1548 = precise::max(_1546, 0.0);
    uint _1550 = uint(_1548);
    int _1552 = abs(_1536);
    bool _1554 = !_1538;
    int _1556 = _1554 ? 0 : (-1);
    float _1558 = as_type<float>(_689) * _1544;
    int _1560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1562 = _1560 != 0;
    int _1564 = _1410 * _1552;
    int _1566 = _1564 + _1542;
    int _1568 = ~_1506;
    int _1570 = _1568 + _1556;
    int _1572 = _1570 + 1;
    float _1574 = as_type<float>(_1452);
    bool _1576 = _1562;
    if (_1528)
    {
        float _1578 = in.m_72.x;
        _1574 = _1578;
    }
    float _1580 = _1574;
    bool _1582 = !_1562;
    float _1584 = _1582 ? _221 : as_type<float>(_1282);
    float _1586 = trunc(_1558);
    float _1588 = precise::max(_1586, 0.0);
    uint _1590 = uint(_1588);
    if (_1394)
    {
        bool _1592 = _1520 > 0.5;
        _1576 = _1592;
    }
    bool _1594 = _1576;
    int _1596 = _641 * _1572;
    int _1598 = _1596 + _1278;
    float _1600 = float(uint(_1566));
    int _1602 = ~_641;
    int _1604 = _1602 + 1;
    bool _1606 = !_1476;
    int _1608 = _1606 ? _1598 : (-1);
    float _1610 = as_type<float>(_886) * _1600;
    float _1612 = 0.0;
    float _1614 = _1600;
    if (!_1394)
    {
        _1612 = _221;
    }
    float _1616 = _1612;
    float _1618 = trunc(_1610);
    float _1620 = precise::max(_1618, 0.0);
    uint _1622 = uint(_1620);
    float _1624 = _1616;
    if (_1394)
    {
        float _1626 = -_221;
        float _1628 = _1594 ? _1626 : _221;
        _1624 = _1628;
    }
    float _1630 = _1624;
    int _1632 = _1608 & 3;
    bool _1634 = _1632 != 0;
    int _1636 = _1604 * int(_1590);
    int _1638 = _1636 + _1132;
    int _1640 = _1608 & 3;
    bool _1642 = _1640 != 0;
    int _1644 = _1634 ? 0 : 1;
    bool _1646 = uint(_1640) > 1u;
    if (_1528)
    {
        float _1648 = _1580 * 3.1415927410125732421875;
        _1614 = _1648;
    }
    float _1650 = _1614;
    int _1652 = int(_1448) + int(_1550);
    float _1654 = float(uint(_1256));
    float _1656 = _1650;
    if (_1528)
    {
        float _1658 = _1650 * 0.15915493667125701904296875;
        _1656 = _1658;
    }
    float _1660 = _1656;
    float _1662 = float(uint(_1638));
    int _1664 = ~_721;
    int _1666 = _1664 + 1;
    float _1668 = as_type<float>(_723) * _1654;
    int _1670 = ~_659;
    int _1672 = _1670 + 1;
    float _1674 = as_type<float>(_689) * _1662;
    int _1676 = ~_1644;
    int _1678 = _1676 + 1;
    int _1680 = _1678 + 1;
    int _1682 = _1666 * int(_1622);
    int _1684 = _1682 + _1566;
    float _1686 = -_225;
    int _1688 = _1148 ? as_type<int>(_1686) : as_type<int>(_225);
    int _1690 = _1672 * _1652;
    int _1692 = _1690 + _1390;
    float _1694 = trunc(_1668);
    float _1696 = precise::max(_1694, 0.0);
    uint _1698 = uint(_1696);
    int _1700 = _1680;
    if (!_1646)
    {
        int _1702 = ~_1644;
        int _1704 = _1702 + 1;
        _1700 = _1704;
    }
    int _1706 = _1700;
    bool _1708 = uint(_1640) >= 2u;
    int _1710 = ~_659;
    int _1712 = _1710 + 1;
    float _1714 = float(uint(_1684));
    float _1716 = _1660;
    if (_1528)
    {
        float _1718 = _1660 * 6.283185482025146484375;
        float _1720 = sin(_1718);
        _1716 = _1720;
    }
    float _1722 = _1716;
    bool _1724 = uint(_1692) >= uint(_659);
    int _1726 = _1708 ? 0 : 1;
    float _1728 = as_type<float>(_886) * _1714;
    bool _1730 = _1640 != 3;
    float _1732 = trunc(_1674);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    bool _1738 = !_1724;
    int _1740 = _1738 ? 0 : (-1);
    int _1742 = _1712 * int(_1698);
    int _1744 = _1742 + _1256;
    int _1746 = ~_1726;
    int _1748 = _1746 + 1;
    int _1750 = _1748 + 1;
    int _1752 = ~_1652;
    int _1754 = _1752 + _1740;
    int _1756 = _1754 + 1;
    float _1758 = trunc(_1728);
    float _1760 = precise::max(_1758, 0.0);
    uint _1762 = uint(_1760);
    float _1764 = float(uint(_1744));
    int _1766 = _659 * _1756;
    int _1768 = _1766 + _1390;
    float _1770 = 0.0;
    int _1772 = _1750;
    bool _1774 = _1730;
    if (!_1528)
    {
        _1770 = _225;
    }
    float _1776 = _1770;
    float _1778 = _1776;
    if (_1730)
    {
        int _1780 = ~_1726;
        int _1782 = _1780 + 1;
        _1772 = _1782;
    }
    int _1784 = _1772;
    float _1786 = as_type<float>(_723) * _1764;
    if (_1528)
    {
        bool _1788 = _1722 > 0.5;
        _1774 = _1788;
    }
    bool _1790 = _1774;
    bool _1792 = !_1180;
    int _1794 = _1792 ? _1768 : (-1);
    int _1796 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1798 = _1796 != 0;
    float _1800 = trunc(_1786);
    float _1802 = precise::max(_1800, 0.0);
    uint _1804 = uint(_1802);
    if (_1528)
    {
        float _1806 = -_225;
        float _1808 = _1790 ? _1806 : _225;
        _1778 = _1808;
    }
    float _1810 = _1778;
    int _1812 = _1794 & 3;
    bool _1814 = _1812 != 0;
    bool _1816 = !_1798;
    float _1818 = _1816 ? _225 : as_type<float>(_1688);
    float _1820 = _1810 + (-0.5);
    bool _1822 = uint(_1812) > 1u;
    int _1824 = int(_1622) + int(_1762);
    int _1826 = ~_721;
    int _1828 = _1826 + 1;
    int _1830 = _1794 & 3;
    bool _1832 = _1830 != 0;
    int _1834 = int(_1590) + int(_1736);
    int _1836 = _1828 * _1824;
    int _1838 = _1836 + _1566;
    int _1840 = ~_641;
    int _1842 = _1840 + 1;
    int _1844 = _1832 ? 0 : 1;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1848 = _1846 != 0;
    int _1850 = _1842 * _1834;
    int _1852 = _1850 + _1132;
    float _1854 = float(uint(_1484));
    bool _1856 = !_1848;
    int _1858 = _1856 ? 0 : 1;
    bool _1860 = uint(_1838) >= uint(_721);
    float _1862 = as_type<float>(_886) * _1854;
    int _1864 = ~_1844;
    int _1866 = _1864 + 1;
    int _1868 = _1866 + 1;
    int _1870 = _1868;
    if (!_1822)
    {
        int _1872 = ~_1844;
        int _1874 = _1872 + 1;
        _1870 = _1874;
    }
    int _1876 = _1870;
    float _1878 = trunc(_1862);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    bool _1884 = uint(_1852) >= uint(_641);
    bool _1886 = !_1860;
    int _1888 = _1886 ? 0 : (-1);
    bool _1890 = _1812 != 3;
    bool _1892 = !_1884;
    int _1894 = _1892 ? 0 : (-1);
    bool _1896 = uint(_1812) >= 2u;
    int _1898 = ~_1824;
    int _1900 = _1898 + _1888;
    int _1902 = _1900 + 1;
    int _1904 = ~_659;
    int _1906 = _1904 + 1;
    int _1908 = int(_1698) + int(_1804);
    int _1910 = _721 * _1902;
    int _1912 = _1910 + _1566;
    int _1914 = _1896 ? 0 : 1;
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1918 = _1916 != 0;
    int _1920 = _1906 * _1908;
    int _1922 = _1920 + _1256;
    int _1924 = ~_721;
    int _1926 = _1924 + 1;
    int _1928 = ~_1914;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = _1932;
    int _1936 = _1876;
    if (_1890)
    {
        int _1938 = ~_1914;
        int _1940 = _1938 + 1;
        _1934 = _1940;
    }
    int _1942 = _1934;
    int _1944 = _1926 * int(_1882);
    int _1946 = _1944 + _1484;
    int _1948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _1950 = _1948 != 0;
    bool _1952 = !_1918;
    int _1954 = _1952 ? 0 : 1;
    bool _1956 = uint(_1922) >= uint(_659);
    bool _1958 = !_1420;
    int _1960 = _1958 ? _1912 : (-1);
    bool _1962 = !_1950;
    int _1964 = _1962 ? 0 : 1;
    bool _1966 = !_1956;
    int _1968 = _1966 ? 0 : (-1);
    int _1970 = _1960 & 3;
    bool _1972 = _1970 != 0;
    int _1974 = _1960 & 3;
    bool _1976 = _1974 != 0;
    float _1978 = float(uint(_1946));
    int _1980 = _1972 ? 0 : 1;
    bool _1982 = uint(_1974) > 1u;
    float _1984 = as_type<float>(_886) * _1978;
    int _1986 = ~_1980;
    int _1988 = _1986 + 1;
    int _1990 = _1988 + 1;
    int _1992 = ~_721;
    int _1994 = _1992 + 1;
    float _1996 = trunc(_1984);
    float _1998 = precise::max(_1996, 0.0);
    uint _2000 = uint(_1998);
    float _2002 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2004 = _2002 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2008 = _2006 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2010 = _1990;
    if (!_1982)
    {
        int _2012 = ~_1980;
        int _2014 = _2012 + 1;
        _2010 = _2014;
    }
    int _2016 = _2010;
    float _2018 = 1.0 / _2004;
    bool _2020 = uint(_1974) >= 2u;
    int _2022 = ~_1908;
    int _2024 = _2022 + _1968;
    int _2026 = _2024 + 1;
    int _2028 = _2020 ? 0 : 1;
    bool _2030 = _1974 != 3;
    float _2032 = 1.0 / _2008;
    int _2034 = int(_1882) + int(_2000);
    int _2036 = _659 * _2026;
    int _2038 = _2036 + _1256;
    int _2040 = ~_2028;
    int _2042 = _2040 + 1;
    int _2044 = _2042 + 1;
    int _2046 = _1994 * _2034;
    int _2048 = _2046 + _1484;
    bool _2050 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2052 = isnan(_623);
    bool _2054 = _2050 || _2052;
    bool _2056 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2058 = _2054 || _2056;
    float _2060 = float(_2058);
    float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2064 = _2062 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2066 = _2044;
    if (_2030)
    {
        int _2068 = ~_2028;
        int _2070 = _2068 + 1;
        _2066 = _2070;
    }
    int _2072 = _2066;
    bool _2074 = uint(_2048) >= uint(_721);
    float _2076 = -_2060;
    float _2078 = _2076 + 1.0;
    float _2080 = 1.0 / _2064;
    bool _2082 = !_2074;
    int _2084 = _2082 ? 0 : (-1);
    bool _2086 = _804 > 0.5;
    float _2088 = -_221;
    int _2090 = _2086 ? as_type<int>(_2088) : as_type<int>(_221);
    int _2092 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2094 = _2092 != 0;
    float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2098 = _2096 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2100 = !_2094;
    float _2102 = _2100 ? _221 : as_type<float>(_2090);
    float _2104 = 1.0 / _2098;
    bool _2106 = _814 != 1;
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2108;
    float _2112 = in.m_58.x;
    float _2114 = in.m_58.y;
    float _2116 = in.m_58.z;
    int _2118 = ~_2034;
    int _2120 = _2118 + _2084;
    int _2122 = _2120 + 1;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2126 = abs(_1706);
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2130 = abs(_2016);
    float _2132 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2124);
    float _2134 = 0.0;
    float _2136 = _2098;
    if (!_2106)
    {
        _2134 = _812;
    }
    float _2138 = _2134;
    float _2140 = _816 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2142 = 0.0;
    float _2144 = _2138;
    if (!_2106)
    {
        _2142 = _812;
    }
    float _2146 = _2142;
    float _2148 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2132);
    float _2150 = 0.0;
    float _2152 = _2146;
    if (!_2106)
    {
        _2150 = _834;
    }
    float _2154 = _2150;
    int _2156 = _721 * _2122;
    int _2158 = _2156 + _1484;
    float _2160 = _2154;
    if (!_2106)
    {
        _2136 = _834;
    }
    float _2162 = _2136;
    float _2164 = _2162;
    if (_2106)
    {
        _2144 = _804;
    }
    float _2166 = _2144;
    if (_2106)
    {
        _2152 = _804;
    }
    float _2168 = _2152;
    if (_2106)
    {
        _2160 = _812;
    }
    float _2170 = _2160;
    float _2172 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_2106)
    {
        _2164 = _812;
    }
    float _2174 = _2164;
    float _2176 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2178 = _818 != 2;
    float _2180 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2182 = _812 * 2.0;
    float _2184 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2172);
    float _2186 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2176);
    float _2188 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2180);
    float _2190 = floor(_2182);
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2196 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2184);
    float _2198 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2186);
    float _2200 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2188);
    bool _2202 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2204 = isnan(_623);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2214;
    float _2218 = 0.0;
    if (_2178)
    {
        _2218 = _804;
    }
    float _2220 = _2218;
    float _2222 = 1.0 / _2194;
    float _2224 = 0.0;
    float _2226 = _2220;
    if (_2178)
    {
        _2224 = _812;
    }
    float _2228 = _2224;
    float _2230 = _2216 * _2104;
    float _2232 = _2228;
    if (!_2178)
    {
        _2226 = _834;
    }
    float _2234 = _2226;
    float _2236 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2236;
    if (!_2178)
    {
        _2232 = _804;
    }
    float _2240 = _2232;
    float _2242 = -_2212;
    float _2244 = _2242 + 1.0;
    bool _2246 = _1264 >= 0.0;
    bool _2248 = isnan(_1264);
    bool _2250 = _2246 || _2248;
    bool _2252 = isnan(0.0);
    bool _2254 = _2250 || _2252;
    float _2256 = _2238 * _2018;
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2260 = _2258 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2262 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2264 = isnan(_623);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2270 = _2266 || _2268;
    float _2272 = float(_2270);
    float _2274 = _2240 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2276 = _2254 ? 0 : 1;
    float _2278 = _2260 * _2032;
    bool _2280 = _1264 > 0.0;
    float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2288 = _2286 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2290 = _834 * 2.0;
    float _2292 = _2284 * _2080;
    int _2294 = ~_2276;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    float _2300 = 1.0 / _2288;
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2304 = _2302 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2306 = -_2272;
    float _2308 = _2306 + 1.0;
    float _2310 = _2170 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2312 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2314 = abs(_1858);
    float _2316 = _2060 * _2308;
    int _2318 = _2298;
    float _2320 = _2312;
    if (!_2280)
    {
        int _2322 = ~_2276;
        int _2324 = _2322 + 1;
        _2318 = _2324;
    }
    int _2326 = _2318;
    float _2328 = floor(_2290);
    bool _2330 = _2190 >= 0.0;
    bool _2332 = isnan(_2190);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan(0.0);
    bool _2338 = _2334 || _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2340;
    bool _2344 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2346 = isnan(_623);
    bool _2348 = _2344 || _2346;
    bool _2350 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2352 = _2348 || _2350;
    float _2354 = float(_2352);
    float _2356 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2358 = _2356 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2360 = _2338 ? 0 : 1;
    float _2362 = _2342 * _2222;
    bool _2364 = _2190 > 0.0;
    float _2366 = -_2354;
    float _2368 = _2366 + 1.0;
    float _2370 = 1.0 / _2304;
    bool _2372 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2374 = isnan(_623);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2380 = _2376 || _2378;
    float _2382 = float(_2380);
    float _2384 = _2358 * _2300;
    int _2386 = ~_2360;
    int _2388 = _2386 + 1;
    int _2390 = _2388 + 1;
    float _2392 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2394 = _623 + _2392;
    int _2396 = ~_1834;
    int _2398 = _2396 + _1894;
    int _2400 = _2398 + 1;
    float _2402 = _2382 * _2078;
    float _2404 = -_2382;
    float _2406 = _2404 + 1.0;
    bool _2408 = !_1420;
    int _2410 = _2408 ? _2158 : (-1);
    int _2412 = _641 * _2400;
    int _2414 = _2412 + _1132;
    int _2416 = _2390;
    if (!_2364)
    {
        int _2418 = ~_2360;
        int _2420 = _2418 + 1;
        _2416 = _2420;
    }
    int _2422 = _2416;
    float _2424 = _2354 * _2406;
    bool _2426 = !_1180;
    int _2428 = _2426 ? _2038 : (-1);
    bool _2430 = !_1642;
    int _2432 = _2430 ? 0 : 1;
    float _2434 = _2110 * _2370;
    int _2436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2438 = _2436 != 0;
    int _2440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2442 = _2440 != 0;
    int _2444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2446 = _2444 != 0;
    bool _2448 = _2328 >= 0.0;
    bool _2450 = isnan(_2328);
    bool _2452 = _2448 || _2450;
    bool _2454 = isnan(0.0);
    bool _2456 = _2452 || _2454;
    bool _2458 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2460 = isnan(_623);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2466 = _2462 || _2464;
    float _2468 = float(_2466);
    bool _2470 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2472 = isnan(_623);
    bool _2474 = _2470 || _2472;
    bool _2476 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2478 = _2474 || _2476;
    float _2480 = float(_2478);
    int _2482 = _2456 ? 0 : 1;
    float _2484 = -_2468;
    float _2486 = _2484 + 1.0;
    bool _2488 = _2328 > 0.0;
    float _2490 = _2468 * _2368;
    float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2494 = _623 + _2492;
    float _2496 = -_2480;
    float _2498 = _2496 + 1.0;
    float _2500 = _2480 * _2486;
    float _2502 = fma(_2292, _2394, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2504 = fma(_2230, _2494, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2506 = _2212 * _2498;
    float _2508 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2510 = _623 + _2508;
    bool _2512 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2514 = isnan(_623);
    bool _2516 = _2512 || _2514;
    bool _2518 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2520 = _2516 || _2518;
    float _2522 = float(_2520);
    float _2524 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2526 = _623 + _2524;
    float _2528 = fma(_2278, _2510, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2532 = _623 + _2530;
    float _2534 = _2522 * _2244;
    float _2536 = fma(_2256, _2526, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2538 = fma(_2362, _858, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2540 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2542 = _623 + _2540;
    float _2544 = fma(_2434, _2532, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2546 = _2504 * _2534;
    float _2548 = -_2522;
    float _2550 = _2548 + 1.0;
    float _2552 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2554 = ~_2482;
    int _2556 = _2554 + 1;
    int _2558 = _2556 + 1;
    float _2560 = fma(_2550, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2546);
    int _2562 = _2558;
    if (!_2488)
    {
        int _2564 = ~_2482;
        int _2566 = _2564 + 1;
        _2562 = _2566;
    }
    int _2568 = _2562;
    float _2570 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2572 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2552);
    float _2574 = fma(_2384, _2542, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2576 = fma(_2502, _2506, _2560);
    float _2578 = _812 + _804;
    float _2580 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2570);
    float _2582 = _812 + _834;
    float _2584 = _812 + (-0.5);
    float _2586 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2588 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2590 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2592 = fma(_2536, _2500, _2576);
    float _2594 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2596 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2586);
    float _2598 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2588);
    float _2600 = _804 + _834;
    float _2602 = _804 + (-0.5);
    float _2604 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2590);
    float _2606 = _820 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2608 = fma(_2140, -2.0, _2594);
    float _2610 = _2198 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2612 = _2196 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2614 = -_2128;
    float _2616 = fma(_2606, 2.0, _2614);
    float _2618 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2620 = fma(_2528, _2490, _2592);
    float _2622 = _2200 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2624 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2626 = _2610 + _2624;
    int _2628 = _1794 >> 31;
    float _2630 = -_2618;
    float _2632 = fma(_882, 2.0, _2630);
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2636 = _2612 + _2634;
    float _2638 = _2626 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2640 = _2628 & 3;
    float _2642 = fma(_2538, _2424, _2620);
    float _2644 = fma(_2636, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2638);
    int _2646 = _1794 + _2640;
    float _2648 = _2578 + (-1.0);
    float _2650 = fma(_2574, _2402, _2642);
    int _2652 = _2646 >> 2;
    float _2654 = fma(_2648, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2656 = !_1814;
    int _2658 = _2656 ? 0 : 1;
    float _2660 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2662 = _2622 + _2660;
    int _2664 = _2652 << 4;
    int _2666 = _2664 + 656;
    float _2668 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2670 = _1812 != 3;
    float _2672 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2644);
    uint _2674 = uint(int(uint(_2666) >> uint(2)));
    uint _2676 = uint(int(uint(int(_2674)) >> uint(2)));
    int _2678 = int(_2674) & 3;
    float _2680 = (*spvDescriptorSet0.vp_c9)._m0[int(_2676)][_2678];
    int _2682 = int(_2674) + 1;
    uint _2684 = uint(int(uint(_2682) >> uint(2)));
    int _2686 = _2682 & 3;
    float _2688 = (*spvDescriptorSet0.vp_c9)._m0[int(_2684)][_2686];
    float _2690 = fma(_862, -2.0, _2668);
    float _2692 = -_131;
    float _2694 = fma(_2692, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2616);
    bool _2696 = !_2670;
    int _2698 = _2696 ? 0 : (-1);
    float _2700 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2702 = _2672 >= 0.0;
    float _2704 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2706 = _1630 + 0.5;
    float _2708 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2700);
    float _2710 = -_131;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2632);
    float _2714 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2704);
    float _2716 = fma(_2706, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2694);
    int _2718 = _2666 + 8;
    uint _2720 = uint(int(uint(_2718) >> uint(2)));
    uint _2722 = uint(int(uint(int(_2720)) >> uint(2)));
    int _2724 = int(_2720) & 3;
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[int(_2722)][_2724];
    int _2728 = int(_2720) + 1;
    uint _2730 = uint(int(uint(_2728) >> uint(2)));
    int _2732 = _2728 & 3;
    float _2734 = (*spvDescriptorSet0.vp_c9)._m0[int(_2730)][_2732];
    float _2736 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2690);
    float _2738 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2608);
    float _2740 = _1818 + (-0.5);
    float _2742 = _2102 + 0.5;
    float _2744 = -_2740;
    float _2746 = -_2736;
    float _2748 = fma(_2744, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2746);
    float _2750 = fma(_2742, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2712);
    float _2752 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2754 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2756 = fma(_2544, _2316, _2650);
    float _2758 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2760 = fma(_2310, -2.0, _2752);
    int _2762 = abs(_2658);
    float _2764 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2766 = fma(_2274, -2.0, _2758);
    int _2768 = abs(_1876);
    int _2770 = abs(_1942);
    float _2772 = -_2764;
    float _2774 = fma(_2312, 2.0, _2772);
    int _2776 = ~_2768;
    int _2778 = _2776 + 1;
    int _2780 = _2778 + 1;
    float _2782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2784 = ~_2762;
    int _2786 = _2784 + 1;
    int _2788 = _2786 + 1;
    float _2790 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2604);
    if (_2702)
    {
        _2320 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2792 = _2320;
    float _2794 = -_1820;
    float _2796 = -_2738;
    float _2798 = fma(_2794, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2796);
    float _2800 = -_2790;
    float _2802 = _2800 + 1.0;
    int _2804 = abs(_2698);
    if (_2702)
    {
        float _2806 = _2792 * 5.0;
        _1936 = as_type<int>(_2806);
    }
    int _2808 = _1936;
    float _2810 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2760);
    float _2812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2814 = _2780 * as_type<int>(_2688);
    int _2816 = ~_2770;
    int _2818 = _2816 + 1;
    int _2820 = _2818 + 1;
    if (_2702)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9518 = as_type<float>(_2808);
        out.gl_Position.z = _9518;
    }
    bool _2822 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2824 = isnan(0.0);
    bool _2826 = _2822 || _2824;
    bool _2828 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2830 = _2826 || _2828;
    int _2832 = _2788 * as_type<int>(_2680);
    int _2834 = _2832 + _2814;
    int _2836 = abs(_1954);
    float _2838 = _2782 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2840 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2842 = int(_2840);
    float _2844 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2756);
    float _2846 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2596);
    float _2848 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2580);
    float _2850 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2598);
    int _2852 = _2820 * as_type<int>(_2726);
    int _2854 = _2852 + _2834;
    float _2856 = _1122 * _131;
    int _2858 = ~_2804;
    int _2860 = _2858 + 1;
    int _2862 = _2860 + 1;
    float _2864 = -_2148;
    float _2866 = _2864 + 1.0;
    int _2868 = ~_2836;
    int _2870 = _2868 + 1;
    int _2872 = _2870 + 1;
    float _2874 = _2812 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2876 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2878 = exp2(_2856);
    float _2880 = float(uint(_2842));
    int _2882 = _2862 * as_type<int>(_2734);
    int _2884 = _2882 + _2854;
    float _2886 = _1584 + 0.5;
    float _2888 = -_2876;
    float _2890 = fma(_2754, 2.0, _2888);
    float _2892 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2572);
    int _2894 = _2884 * _2872;
    float _2896 = -_2802;
    float _2898 = fma(_2896, _1630, _2716);
    float _2900 = 1.0 / _2880;
    float _2902 = _1338 + (-0.5);
    float _2904 = fma(_2866, _1810, _2798);
    float _2906 = -_131;
    float _2908 = fma(_2906, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2774);
    float _2910 = -_2874;
    float _2912 = -_2810;
    float _2914 = fma(_2910, _2902, _2912);
    int _2916 = _2428 * _2836;
    int _2918 = _2916 + _2894;
    out.m_80.x = _2898;
    out.m_80.y = _2904;
    float _2920 = fma(_2838, _2886, _2908);
    float _2922 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2924 = 1.0 + _2922;
    float _2926 = -_2878;
    float _2928 = _2926 + 1.0;
    float _2930 = float(uint(_2918));
    float _2932 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2708);
    float _2934 = 1.0 / _2924;
    float _2936 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2714);
    float _2938 = _2830 ? _2928 : 0.0;
    float _2940 = -_131;
    float _2942 = fma(_2940, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2890);
    int _2944 = as_type<int>(_2900) + (-2);
    float _2946 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2766);
    bool _2948 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2950 = isnan(1.0);
    bool _2952 = _2948 || _2950;
    bool _2954 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2956 = _2952 || _2954;
    out.m_82.x = _2844;
    int _2958 = abs(_2842);
    float _2960 = as_type<float>(_2944) * _2930;
    int _2962 = _1960 >> 31;
    float _2964 = -_2936;
    float _2966 = _2964 + 1.0;
    float _2968 = trunc(_2960);
    float _2970 = precise::max(_2968, 0.0);
    uint _2972 = uint(_2970);
    int _2974 = _1608 >> 31;
    float _2976 = _2626 * _2626;
    float _2978 = float(uint(_2958));
    float _2980 = fma(_1338, _2966, _2914);
    int _2982 = ~_2842;
    int _2984 = _2982 + 1;
    if (_2956)
    {
        float _2986 = _2938 * _2934;
        _141 = _2986;
    }
    float _2988 = _141;
    int _2990 = _2962 & 3;
    float _2992 = -_2850;
    float _2994 = _2992 + 1.0;
    float _2996 = 1.0 / _2978;
    int _2998 = _2974 & 3;
    float _3000 = fma(_2636, _2636, _2976);
    int _3002 = _1960 + _2990;
    float _3004 = -_2846;
    float _3006 = _3004 + 1.0;
    int _3008 = _1608 + _2998;
    float _3010 = fma(_2662, _2662, _3000);
    int _3012 = _2984 * int(_2972);
    int _3014 = _3012 + _2918;
    int _3016 = _3002 >> 2;
    float _3018 = -_3006;
    float _3020 = fma(_2102, _3018, _2750);
    float _3022 = rsqrt(_3010);
    int _3024 = _3008 >> 2;
    float _3026 = _884 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3028 = float(uint(_3014));
    float _3030 = -_2932;
    float _3032 = _3030 + 1.0;
    int _3034 = _3016 << 4;
    int _3036 = _3034 + 800;
    if (_2702)
    {
        out.m_65.x = 0.0;
    }
    int _3038 = abs(_2918);
    float _3040 = as_type<float>(_2944) * _3028;
    int _3042 = _3024 << 4;
    int _3044 = _3042 + 368;
    uint _3046 = uint(int(uint(_3036) >> uint(2)));
    uint _3048 = uint(int(uint(int(_3046)) >> uint(2)));
    int _3050 = int(_3046) & 3;
    float _3052 = (*spvDescriptorSet0.vp_c9)._m0[int(_3048)][_3050];
    int _3054 = int(_3046) + 1;
    uint _3056 = uint(int(uint(_3054) >> uint(2)));
    int _3058 = _3054 & 3;
    float _3060 = (*spvDescriptorSet0.vp_c9)._m0[int(_3056)][_3058];
    int _3062 = as_type<int>(_2996) + (-2);
    float _3064 = -_2848;
    float _3066 = _3064 + 1.0;
    float _3068 = float(uint(_3038));
    float _3070 = -_3032;
    float _3072 = fma(_1584, _3070, _2920);
    bool _3074 = !_2438;
    int _3076 = _3074 ? 0 : 1;
    float _3078 = _3026 * _3022;
    float _3080 = fma(_1818, _3066, _2748);
    uint _3082 = uint(int(uint(_3044) >> uint(2)));
    uint _3084 = uint(int(uint(int(_3082)) >> uint(2)));
    int _3086 = int(_3082) & 3;
    float _3088 = (*spvDescriptorSet0.vp_c9)._m0[int(_3084)][_3086];
    int _3090 = int(_3082) + 1;
    uint _3092 = uint(int(uint(_3090) >> uint(2)));
    int _3094 = _3090 & 3;
    float _3096 = (*spvDescriptorSet0.vp_c9)._m0[int(_3092)][_3094];
    float _3098 = as_type<float>(_3062) * _3068;
    float _3100 = _2626 * _3078;
    float _3102 = _2636 * _3078;
    int _3104 = ~_2958;
    int _3106 = _3104 + 1;
    out.m_84.x = _3020;
    out.m_84.y = _3080;
    out.m_84.z = _3072;
    out.m_84.w = _2980;
    float _3108 = -_3100;
    float _3110 = _2626 + _3108;
    float _3112 = trunc(_3098);
    float _3114 = precise::max(_3112, 0.0);
    uint _3116 = uint(_3114);
    int _3118 = abs(_3076);
    float _3120 = -_3102;
    float _3122 = _2636 + _3120;
    float _3124 = _3110 * _3110;
    float _3126 = _2662 * _3078;
    float _3128 = float(_2568);
    float _3130 = fma(_3122, _3122, _3124);
    float _3132 = float(_3118);
    float _3134 = trunc(_3040);
    float _3136 = precise::max(_3134, 0.0);
    uint _3138 = uint(_3136);
    int _3140 = ~_2842;
    int _3142 = _3140 + 1;
    float _3144 = -_3126;
    float _3146 = _2662 + _3144;
    int _3148 = _3036 + 8;
    uint _3150 = uint(int(uint(_3148) >> uint(2)));
    uint _3152 = uint(int(uint(int(_3150)) >> uint(2)));
    int _3154 = int(_3150) & 3;
    float _3156 = (*spvDescriptorSet0.vp_c9)._m0[int(_3152)][_3154];
    int _3158 = int(_3150) + 1;
    uint _3160 = uint(int(uint(_3158) >> uint(2)));
    int _3162 = _3158 & 3;
    float _3164 = (*spvDescriptorSet0.vp_c9)._m0[int(_3160)][_3162];
    float _3166 = _3132 * _3128;
    int _3168 = _3106 * int(_3116);
    int _3170 = _3168 + _3038;
    bool _3172 = !_1976;
    int _3174 = _3172 ? 0 : 1;
    int _3176 = _3044 + 8;
    uint _3178 = uint(int(uint(_3176) >> uint(2)));
    uint _3180 = uint(int(uint(int(_3178)) >> uint(2)));
    int _3182 = int(_3178) & 3;
    float _3184 = (*spvDescriptorSet0.vp_c9)._m0[int(_3180)][_3182];
    int _3186 = int(_3178) + 1;
    uint _3188 = uint(int(uint(_3186) >> uint(2)));
    int _3190 = _3186 & 3;
    float _3192 = (*spvDescriptorSet0.vp_c9)._m0[int(_3188)][_3190];
    float _3194 = float(uint(_3170));
    int _3196 = ~_2130;
    int _3198 = _3196 + 1;
    int _3200 = _3198 + 1;
    int _3202 = int(_2972) + int(_3138);
    float _3204 = as_type<float>(_3062) * _3194;
    int _3206 = abs(_2432);
    int _3208 = ~_2126;
    int _3210 = _3208 + 1;
    int _3212 = _3210 + 1;
    float _3214 = trunc(_3204);
    float _3216 = precise::max(_3214, 0.0);
    uint _3218 = uint(_3216);
    bool _3220 = _1640 != 3;
    int _3222 = _3142 * _3202;
    int _3224 = _3222 + _2918;
    int _3226 = ~_2958;
    int _3228 = _3226 + 1;
    int _3230 = _3200 * as_type<int>(_3060);
    int _3232 = abs(_3174);
    int _3234 = ~_3232;
    int _3236 = _3234 + 1;
    int _3238 = _3236 + 1;
    int _3240 = _3212 * as_type<int>(_3096);
    bool _3242 = !_3220;
    int _3244 = _3242 ? 0 : (-1);
    int _3246 = ~_3206;
    int _3248 = _3246 + 1;
    int _3250 = _3248 + 1;
    int _3252 = _3238 * as_type<int>(_3052);
    int _3254 = _3252 + _3230;
    bool _3256 = uint(_3224) >= uint(_2842);
    int _3258 = int(_3116) + int(_3218);
    int _3260 = _3250 * as_type<int>(_3088);
    int _3262 = _3260 + _3240;
    bool _3264 = !_3256;
    int _3266 = _3264 ? 0 : (-1);
    int _3268 = abs(_2072);
    int _3270 = _3228 * _3258;
    int _3272 = _3270 + _3038;
    bool _3274 = _1974 != 3;
    float _3276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3278 = ~_3202;
    int _3280 = _3278 + _3266;
    int _3282 = _3280 + 1;
    int _3284 = ~_3268;
    int _3286 = _3284 + 1;
    int _3288 = _3286 + 1;
    bool _3290 = !_3274;
    int _3292 = _3290 ? 0 : (-1);
    int _3294 = _2842 * _3282;
    int _3296 = _3294 + _2918;
    bool _3298 = uint(_3272) >= uint(_2958);
    int _3300 = _3288 * as_type<int>(_3156);
    int _3302 = _3300 + _3254;
    int _3304 = _2918 ^ _2842;
    float _3306 = _1004 + 0.5;
    int _3308 = abs(_3292);
    int _3310 = abs(_1784);
    float _3312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3314 = !_3298;
    int _3316 = _3314 ? 0 : (-1);
    uint _3318 = uint(int(uint(_3304) >> uint(31)));
    int _3320 = abs(_3244);
    int _3322 = ~_3310;
    int _3324 = _3322 + 1;
    int _3326 = _3324 + 1;
    int _3328 = ~_3316;
    int _3330 = _3258 + _3328;
    int _3332 = _3330 + 1;
    int _3334 = ~int(_3318);
    int _3336 = _3334 + 1;
    int _3338 = _3326 * as_type<int>(_3184);
    int _3340 = _3338 + _3262;
    int _3342 = ~_3320;
    int _3344 = _3342 + 1;
    int _3346 = _3344 + 1;
    bool _3348 = _2842 == 0;
    int _3350 = ~_3308;
    int _3352 = _3350 + 1;
    int _3354 = _3352 + 1;
    int _3356 = _3346 * as_type<int>(_3192);
    int _3358 = _3356 + _3340;
    int _3360 = _3332 ^ _3336;
    int _3362 = ~_2314;
    int _3364 = _3362 + 1;
    int _3366 = _3364 + 1;
    int _3368 = _3354 * as_type<int>(_3164);
    int _3370 = _3368 + _3302;
    bool _3372 = !_3348;
    int _3374 = _3372 ? _3296 : (-1);
    float _3376 = in.m_86.x;
    float _3378 = in.m_86.y;
    float _3380 = in.m_86.z;
    int _3382 = abs(_1964);
    float _3384 = _3312 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3386 = _2842 == 0;
    int _3388 = _3358 * _3366;
    int _3390 = ~_3336;
    int _3392 = _3390 + _3360;
    int _3394 = _3392 + 1;
    int _3396 = ~_3382;
    int _3398 = _3396 + 1;
    int _3400 = _3398 + 1;
    bool _3402 = !_3386;
    int _3404 = _3402 ? _3394 : (-1);
    bool _3406 = _641 == 0;
    int _3408 = _3370 * _3400;
    float _3410 = float(_3374);
    float _3412 = _3276 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3414 = float(_3404);
    int _3416 = _2410 * _3382;
    int _3418 = _3416 + _3408;
    bool _3420 = !_3406;
    int _3422 = _3420 ? _2414 : (-1);
    float _3424 = fma(_3384, _3410, _2942);
    float _3426 = _3166 * (-2.0);
    float _3428 = -_2946;
    float _3430 = fma(_3412, _3414, _3428);
    float _3432 = _966 + (-0.5);
    int _3434 = _3422 * _2314;
    int _3436 = _3434 + _3388;
    float _3438 = fma(_3384, _3306, _3424);
    float _3440 = -_2892;
    float _3442 = _3440 + 1.0;
    float _3444 = -_3412;
    float _3446 = fma(_3444, _3432, _3430);
    float _3448 = fma(_2654, _3426, _2654);
    float _3450 = float(_3436);
    float _3452 = -_2994;
    float _3454 = fma(_1004, _3452, _3438);
    float _3456 = float(_3418);
    float _3458 = fma(_966, _3442, _3446);
    float _3460 = fma(_3426, _3376, _3376);
    bool _3462 = !_2442;
    int _3464 = _3462 ? 0 : 1;
    out.m_88.x = _3450;
    bool _3466 = !_2446;
    int _3468 = _3466 ? 0 : 1;
    int _3470 = abs(_3464);
    out.m_88.w = _3456;
    out.m_90.x = _3454;
    out.m_90.y = _3458;
    float _3472 = _3380;
    if (_2702)
    {
        return out;
    }
    float _3474 = -_3100;
    float _3476 = _2610 + _3474;
    float _3478 = -_3102;
    float _3480 = _2612 + _3478;
    float _3482 = fma(_2602, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3460);
    float _3484 = float(_2326);
    float _3486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3488 = _3476 + _3486;
    float _3490 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3492 = _3480 + _3490;
    float _3494 = float(_3470);
    float _3496 = _2582 + (-1.0);
    float _3498 = _3488 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3500 = _2600 + (-1.0);
    float _3502 = _3494 * _3484;
    float _3504 = fma(_3492, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3498);
    float _3506 = -_3126;
    float _3508 = _2622 + _3506;
    int _3510 = abs(_3468);
    float _3512 = fma(_3496, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3514 = float(_2422);
    float _3516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3518 = _3508 + _3516;
    float _3520 = float(_3510);
    float _3522 = _834 + (-0.5);
    float _3524 = fma(_3448, _2988, _3482);
    float _3526 = fma(_3518, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3504);
    float _3528 = _3502 * (-2.0);
    float _3530 = _3520 * _3514;
    float _3532 = fma(_3146, _3146, _3130);
    float _3534 = _3524 * 0.15915493667125701904296875;
    float _3536 = fma(_3528, _3378, _3378);
    float _3538 = fma(_3512, _3528, _3512);
    float _3540 = _3530 * (-2.0);
    bool _3542 = _3526 >= 0.0;
    float _3544 = fma(_2584, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3536);
    float _3546 = sqrt(_3532);
    float _3548 = fma(_3500, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3550 = fma(_3540, _3380, _3380);
    float _3552 = fma(_3538, _2988, _3544);
    float _3554 = fma(_3548, _3540, _3548);
    float _3556 = fma(_3522, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3550);
    float _3558 = _3552 * 0.15915493667125701904296875;
    float _3560 = _3534 * 6.283185482025146484375;
    float _3562 = sin(_3560);
    float _3564 = fma(_3554, _2988, _3556);
    int _3566 = as_type<int>(_3538);
    if (_3542)
    {
        _3472 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3568 = _3472;
    int _3570 = as_type<int>(_3568);
    if (_3542)
    {
        out.m_65.x = 0.0;
    }
    float _3572 = _3564 * 0.15915493667125701904296875;
    float _3574 = _3534 * 6.283185482025146484375;
    float _3576 = cos(_3574);
    if (_3542)
    {
        float _3578 = _3568 * 5.0;
        _3570 = as_type<int>(_3578);
    }
    int _3580 = _3570;
    if (_3542)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10631 = as_type<float>(_3580);
        out.gl_Position.z = _10631;
    }
    float _3582 = _3558 * 6.283185482025146484375;
    float _3584 = sin(_3582);
    float _3586 = _3558 * 6.283185482025146484375;
    float _3588 = cos(_3586);
    if (_3542)
    {
        return out;
    }
    float _3590 = _3572 * 6.283185482025146484375;
    float _3592 = cos(_3590);
    float _3594 = _3022 * _3546;
    float _3596 = _453 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3600 = _3576 * _3588;
    float _3602 = _884 * _3594;
    float _3604 = _3594 * _3596;
    float _3606 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _3608 = _3572 * 6.283185482025146484375;
    float _3610 = sin(_3608);
    float _3612 = _3576 * _3584;
    float _3614 = _3598 * _3604;
    float _3616 = _3562 * _3584;
    float _3618 = _3562 * _3588;
    float _3620 = _3606 * _3602;
    float _3622 = _3594 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3624 = _3622 * 0.5;
    float _3626 = _3576 * _3592;
    float _3628 = _3588 * _3592;
    float _3630 = _3562 * _3592;
    float _3632 = _3584 * _3592;
    float _3634 = _3626 * _3614;
    float _3636 = fma(_3610, _3600, _3616);
    float _3638 = -_3618;
    float _3640 = fma(_3610, _3612, _3638);
    float _3642 = -_3614;
    float _3644 = _3610 * _3642;
    float _3646 = -_3612;
    float _3648 = fma(_3610, _3618, _3646);
    float _3650 = fma(_3636, _3620, _3634);
    float _3652 = _3630 * _3614;
    float _3654 = fma(_3628, _3620, _3644);
    float _3656 = fma(_3610, _3616, _3600);
    float _3658 = fma(_3640, _3624, _3650);
    float _3660 = fma(_3648, _3620, _3652);
    float _3662 = fma(_3632, _3624, _3654);
    float _3664 = _3636 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3666 = _3658 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3668 = _3658 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3670 = fma(_3656, _3624, _3660);
    float _3672 = _3658 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3674 = fma(_3662, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3666);
    float _3676 = fma(_3662, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3668);
    float _3678 = _3626 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3680 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3664);
    float _3682 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3674);
    float _3684 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3676);
    float _3686 = _3682 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3688 = _3684 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3690 = _3636 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3692 = _2612 + _3686;
    float _3694 = _2622 + _3688;
    float _3696 = _3636 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3698 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3700 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3702 = _3692 + _3700;
    float _3704 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3706 = _3694 + _3704;
    float _3708 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3696);
    float _3710 = fma(_3662, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3672);
    float _3712 = _3702 * _3702;
    float _3714 = _3706 * _3706;
    float _3716 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3690);
    float _3718 = _3626 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3720 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3710);
    float _3722 = _3712 + _3714;
    float _3724 = _3626 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3726 = -_3610;
    float _3728 = fma(_3726, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3718);
    float _3730 = _3720 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3732 = sqrt(_3722);
    float _3734 = -_3610;
    float _3736 = fma(_3734, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3724);
    float _3738 = _3640 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3740 = _3640 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3742 = fma(_3698, _3698, 1.0);
    float _3744 = _3640 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3746 = _2610 + _3730;
    float _3748 = -_3610;
    float _3750 = fma(_3748, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3678);
    float _3752 = rsqrt(_3742);
    float _3754 = fma(_3632, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3738);
    float _3756 = fma(_3632, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3740);
    float _3758 = fma(_3632, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3744);
    bool _3760 = _3732 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3762 = _3744;
    float _3764 = _3632;
    float _3766 = _3738;
    float _3768 = _3742;
    float _3770 = _3730;
    float _3772 = _3702;
    if (!_3760)
    {
        _3762 = _3714;
    }
    float _3774 = _3762;
    float _3776 = _3774;
    if (!_3760)
    {
        _3764 = _3712;
    }
    float _3778 = _3764;
    float _3780 = _3778;
    if (!_3760)
    {
        _3766 = _3692;
    }
    float _3782 = _3766;
    float _3784 = _3782;
    if (!_3760)
    {
        _3768 = _3694;
    }
    float _3786 = _3768;
    float _3788 = _3786;
    if (!_3760)
    {
        _3770 = _3746;
    }
    float _3790 = _3770;
    bool _3792 = !_3760;
    float _3794 = _3790;
    if (!_3792)
    {
        float _3796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3798 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3800 = _3732 + _3798;
        float _3802 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3804 = rsqrt(_3722);
        float _3806 = _3800 * _3796;
        float _3808 = _3806 * 0.15915493667125701904296875;
        float _3810 = _3808 * 6.283185482025146484375;
        float _3812 = sin(_3810);
        float _3814 = _3808 * 6.283185482025146484375;
        float _3816 = cos(_3814);
        float _3818 = fma(_3812, _3802, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3820 = _3804 * _3818;
        float _3822 = _3816 + (-1.0);
        float _3824 = fma(_3702, _3820, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3826 = fma(_3706, _3820, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3828 = _3822 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3830 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3832 = _3824 + _3830;
        float _3834 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3836 = _3826 + _3834;
        float _3838 = fma(_3746, _3816, _3828);
        float _3840 = _3832 * _3832;
        float _3842 = _3836 * _3836;
        _3794 = _3838;
        _3780 = _3840;
        _3776 = _3842;
        _3784 = _3824;
        _3788 = _3826;
    }
    float _3844 = _3794;
    float _3846 = _3780;
    float _3848 = _3776;
    float _3850 = _3784;
    float _3852 = _3788;
    float _3854 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3856 = _3844 + _3854;
    float _3858 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3728);
    float _3860 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3750);
    float _3862 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3736);
    float _3864 = fma(_3856, _3856, _3846);
    float _3866 = fma(_3656, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3754);
    float _3868 = fma(_3656, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3756);
    float _3870 = fma(_3656, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3758);
    float _3872 = _3864 + _3848;
    float _3874 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3716);
    float _3876 = _3698 * _3752;
    float _3878 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3708);
    float _3880 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3882 = _3698 * _3858;
    float _3884 = _3698 * _3860;
    float _3886 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3680);
    float _3888 = _3698 * _3862;
    float _3890 = -_3866;
    float _3892 = _3876 * _3890;
    float _3894 = -_3868;
    float _3896 = _3876 * _3894;
    float _3898 = -_3870;
    float _3900 = _3876 * _3898;
    float _3902 = sqrt(_3872);
    float _3904 = fma(_3880, _3874, _3882);
    float _3906 = fma(_3880, _3878, _3884);
    float _3908 = fma(_3880, _3886, _3888);
    float _3910 = fma(_3752, _3858, _3892);
    float _3912 = fma(_3752, _3860, _3896);
    float _3914 = _3868 + _3906;
    float _3916 = fma(_3752, _3862, _3900);
    float _3918 = _3866 + _3904;
    float _3920 = _3870 + _3908;
    out.m_92.x = _3874;
    out.m_92.y = _3878;
    out.m_92.z = _3886;
    out.m_94.x = _3910;
    out.m_94.y = _3912;
    out.m_94.z = _3916;
    bool _3922 = _3902 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3924 = isnan(_3902);
    bool _3926 = _3922 || _3924;
    bool _3928 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3930 = _3926 || _3928;
    out.m_96.x = _3918;
    out.m_96.y = _3914;
    out.m_96.z = _3920;
    float _3932 = _3866;
    if (!_3930)
    {
        _3932 = 1.0;
    }
    float _3934 = _3932;
    bool _3936 = !_3930;
    float _3938 = _3934;
    if (!_3936)
    {
        bool _3940 = _3902 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3942 = isnan(_3902);
        bool _3944 = _3940 || _3942;
        bool _3946 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3948 = _3944 || _3946;
        if (!_3948)
        {
            float _3950 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3952 = _3902 + _3950;
            float _3954 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3956 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3954;
            float _3958 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3960 = _3958 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3962 = 1.0 / _3956;
            float _3964 = _3952 * _3962;
            float _3966 = fma(_3964, _3960, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3938 = _3966;
            _3968 = true;
        }
        else
        {
            bool _3970 = _3902 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3972 = isnan(_3902);
            bool _3974 = _3970 || _3972;
            bool _3976 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3978 = _3974 || _3976;
            if (!_3978)
            {
                float _3980 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3982 = _3902 + _3980;
                float _3984 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3986 = _3984 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3988 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3990 = _3988 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3992 = 1.0 / _3986;
                float _3994 = _3982 * _3992;
                float _3996 = fma(_3994, _3990, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3938 = _3996;
                _3968 = true;
            }
            else
            {
                _3938 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3968 = false;
    float _3998 = _3938;
    float _4000 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4002 = _3844 + _4000;
    float _4004 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4006 = _3850 + _4004;
    float _4008 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4010 = _3852 + _4008;
    float _4012 = fma(_4002, _3998, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4014 = fma(_4006, _3998, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4016 = fma(_4010, _3998, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4018 = _3476 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4020 = -_2610;
    float _4022 = _4020 + _4012;
    float _4024 = -_2612;
    float _4026 = _4024 + _4014;
    float _4028 = -_2622;
    float _4030 = _4028 + _4016;
    float _4032 = fma(_3480, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4018);
    float _4034 = _4022 * _4022;
    float _4036 = _3476 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4038 = fma(_3508, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4032);
    float _4040 = fma(_4026, _4026, _4034);
    float _4042 = _4038 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4044 = fma(_4030, _4030, _4040);
    float _4046 = sqrt(_4044);
    bool _4048 = _4046 > 0.0;
    float _4050 = _4046;
    float _4052 = _4006;
    float _4054 = _4038;
    float _4056 = _4030;
    if (!_4048)
    {
        _4050 = _4014;
    }
    float _4058 = _4050;
    float _4060 = _4058;
    if (!_4048)
    {
        _4052 = _4012;
    }
    float _4062 = _4052;
    float _4064 = _4062;
    float _4066 = _4062;
    if (!_4048)
    {
        _4054 = _4016;
    }
    float _4068 = _4054;
    bool _4070 = !_4048;
    float _4072 = _4068;
    if (!_4070)
    {
        float _4074 = _215 * _215;
        float _4076 = fma(_213, _213, _4074);
        float _4078 = fma(_217, _217, _4076);
        float _4080 = rsqrt(_4044);
        float _4082 = sqrt(_4078);
        float _4084 = _4026 * _4080;
        float _4086 = _4022 * _4080;
        float _4088 = _4030 * _4080;
        bool _4090 = _4082 > 0.0;
        float _4092 = _4080;
        float _4094 = _4082;
        _4056 = _4088;
        if (!_4090)
        {
            _4092 = _4014;
        }
        float _4096 = _4092;
        _4060 = _4096;
        if (!_4090)
        {
            _4064 = _4012;
        }
        float _4098 = _4064;
        _4066 = _4098;
        if (!_4090)
        {
            _4094 = _4016;
        }
        float _4100 = _4094;
        bool _4102 = !_4090;
        _4072 = _4100;
        if (!_4102)
        {
            float _4104 = rsqrt(_4078);
            float _4106 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4108 = _215 * _4104;
            float _4110 = _213 * _4104;
            float _4112 = _217 * _4104;
            float _4114 = _4086 * _4108;
            float _4116 = fma(_4084, _4110, _4114);
            float _4118 = _4106 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4120 = fma(_4088, _4112, _4116);
            float _4122 = _4120 * _4118;
            float _4124 = fma(_213, _4122, _4014);
            float _4126 = fma(_215, _4122, _4012);
            float _4128 = fma(_217, _4122, _4016);
            _4066 = _4126;
            _4060 = _4124;
            _4072 = _4128;
        }
    }
    float _4130 = _4066;
    float _4132 = _4060;
    float _4134 = _4072;
    float _4136 = _4056;
    float _4138 = fma(_3480, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4036);
    float _4140 = 1.0 / _4042;
    float _4142 = -_3100;
    float _4144 = _4142 + _4130;
    float _4146 = -_3102;
    float _4148 = _4146 + _4132;
    float _4150 = fma(_3508, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4138);
    float _4152 = -_3126;
    float _4154 = _4152 + _4134;
    float _4156 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4158 = _4144 + _4156;
    float _4160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4162 = _4148 + _4160;
    float _4164 = _4150 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4166 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4168 = _4154 + _4166;
    float _4170 = _4158 * _4158;
    float _4172 = _4164 + _4042;
    float _4174 = fma(_4162, _4162, _4170);
    float _4176 = _4172 * _4140;
    float _4178 = _4176 * 0.5;
    float _4180 = fma(_4168, _4168, _4174);
    float _4182 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4184 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4186 = fma(_4178, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4184);
    float _4188 = rsqrt(_4180);
    float _4190 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4192 = 1.0 / _4186;
    float _4194 = _4188 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4196 = _3476 + _4190;
    float _4198 = sqrt(_4180);
    float _4200 = _4162 * _4194;
    float _4202 = _4168 * _4194;
    float _4204 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4206 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4208 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4210 = _4192 * _4208;
    float _4212 = _4200 * _4200;
    float _4214 = _4202 * _4202;
    float _4216 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4204);
    float _4218 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4206);
    bool _4220 = _4210 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4222 = _4212 + _4214;
    bool _4224 = _4210 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4226 = fma(_3508, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4216);
    float _4228 = fma(_3508, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4218);
    float _4230 = sqrt(_4222);
    float _4232 = _4226 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _4234 = !_4220;
    int _4236 = _4234 ? 0 : 1;
    float _4238 = _4228 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _4240 = 2;
    float _4242 = _4196;
    if (!_4220)
    {
        _4240 = 1;
    }
    int _4244 = _4240;
    float _4246 = trunc(_4232);
    int _4248 = int(_4246);
    int _4250 = _4244;
    if (!_4224)
    {
        _4250 = _4236;
    }
    int _4252 = _4250;
    float _4254 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _4256 = _4252 << 6;
    bool _4258 = _4230 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4260 = trunc(_4238);
    int _4262 = int(_4260);
    int _4264 = _4256 + 96;
    uint _4266 = uint(int(uint(_4264) >> uint(2)));
    uint _4268 = uint(int(uint(int(_4266)) >> uint(2)));
    int _4270 = int(_4266) & 3;
    float _4272 = (*spvDescriptorSet0.vp_c15)._m0[int(_4268)][_4270];
    int _4274 = int(_4266) + 1;
    uint _4276 = uint(int(uint(_4274) >> uint(2)));
    int _4278 = _4274 & 3;
    float _4280 = (*spvDescriptorSet0.vp_c15)._m0[int(_4276)][_4278];
    float _4282 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4284 = _4230 + _4282;
    int _4286 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4288 = _4248 + _4286;
    int _4290 = _4288 + 1;
    int _4292 = _4256 + 48;
    uint _4294 = uint(int(uint(_4292) >> uint(2)));
    uint _4296 = uint(int(uint(int(_4294)) >> uint(2)));
    int _4298 = int(_4294) & 3;
    float _4300 = (*spvDescriptorSet0.vp_c15)._m0[int(_4296)][_4298];
    int _4302 = int(_4294) + 1;
    uint _4304 = uint(int(uint(_4302) >> uint(2)));
    int _4306 = _4302 & 3;
    float _4308 = (*spvDescriptorSet0.vp_c15)._m0[int(_4304)][_4306];
    float _4310 = floor(_4254);
    bool _4312 = _4290 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4314 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4316 = _4262 + _4314;
    int _4318 = _4316 + 1;
    int _4320 = _4256 + 104;
    uint _4322 = uint(int(uint(_4320) >> uint(2)));
    uint _4324 = uint(int(uint(int(_4322)) >> uint(2)));
    int _4326 = int(_4322) & 3;
    float _4328 = (*spvDescriptorSet0.vp_c15)._m0[int(_4324)][_4326];
    int _4330 = int(_4322) + 1;
    uint _4332 = uint(int(uint(_4330) >> uint(2)));
    int _4334 = _4330 & 3;
    float _4336 = (*spvDescriptorSet0.vp_c15)._m0[int(_4332)][_4334];
    int _4338 = as_type<int>(_3694);
    float _4340 = _4284;
    int _4342 = as_type<int>(_4254);
    float _4344 = as_type<float>(_4252);
    if (_4258)
    {
        float _4346 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4338 = as_type<int>(_4346);
    }
    int _4348 = _4338;
    int _4350 = _4290 | _4318;
    bool _4352 = _4350 < 0;
    bool _4354 = _4352 || _4312;
    int _4356 = _4256 + 64;
    uint _4358 = uint(int(uint(_4356) >> uint(2)));
    uint _4360 = uint(int(uint(int(_4358)) >> uint(2)));
    int _4362 = int(_4358) & 3;
    float _4364 = (*spvDescriptorSet0.vp_c15)._m0[int(_4360)][_4362];
    int _4366 = int(_4358) + 1;
    uint _4368 = uint(int(uint(_4366) >> uint(2)));
    int _4370 = _4366 & 3;
    float _4372 = (*spvDescriptorSet0.vp_c15)._m0[int(_4368)][_4370];
    float _4374 = -_4310;
    float _4376 = _4254 + _4374;
    bool _4378 = _4318 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4380 = _4378 || _4354;
    int _4382 = _4256 + 56;
    uint _4384 = uint(int(uint(_4382) >> uint(2)));
    uint _4386 = uint(int(uint(int(_4384)) >> uint(2)));
    int _4388 = int(_4384) & 3;
    float _4390 = (*spvDescriptorSet0.vp_c15)._m0[int(_4386)][_4388];
    int _4392 = int(_4384) + 1;
    uint _4394 = uint(int(uint(_4392) >> uint(2)));
    int _4396 = _4392 & 3;
    float _4398 = (*spvDescriptorSet0.vp_c15)._m0[int(_4394)][_4396];
    int _4400 = _4348;
    if (_4258)
    {
        float _4402 = _4284 * as_type<float>(_4348);
        _4340 = _4402;
    }
    float _4404 = _4340;
    int _4406 = as_type<int>(_4404);
    if (_4258)
    {
        float _4408 = _4404 * 0.15915493667125701904296875;
        _3772 = _4408;
    }
    float _4410 = _3772;
    float _4412 = _4410;
    if (!_4380)
    {
        int _4414 = _4318 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4416 = _4414 + _4290;
        _4406 = _4416;
    }
    int _4418 = _4406;
    float _4420 = _3862;
    if (_4258)
    {
        float _4422 = _4410 * 6.283185482025146484375;
        float _4424 = cos(_4422);
        _4420 = _4424;
    }
    float _4426 = _4420;
    float _4428 = precise::max(0.0, _4182);
    if (!_4380)
    {
        int _4430 = _4418 << 2;
        _4400 = _4430;
    }
    int _4432 = _4400;
    float _4434 = -_4194;
    float _4436 = -_4428;
    float _4438 = fma(_4158, _4434, _4436);
    float _4440 = _4196 * _4280;
    float _4442 = as_type<float>(_4318);
    int _4444 = _4432;
    float _4446 = _4440;
    float _4448 = _4438;
    if (_4258)
    {
        float _4450 = _4410 * 6.283185482025146484375;
        float _4452 = sin(_4450);
        _4442 = _4452;
    }
    float _4454 = _4442;
    if (!_4380)
    {
        uint _4456 = uint(int(uint(_4418) >> uint(2)));
        _4342 = int(_4456);
    }
    int _4458 = _4342;
    float _4460 = fma(_3480, _4272, _4440);
    float _4462 = _4460;
    float _4464 = as_type<float>(_4458);
    if (!_4380)
    {
        int _4466 = 12 & _4432;
        _4444 = _4466;
    }
    int _4468 = _4444;
    float _4470 = _4196 * _4308;
    float _4472 = _4182;
    float _4474 = _4300;
    float _4476 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (_4258)
    {
        float _4478 = rsqrt(_4222);
        _4472 = _4478;
    }
    float _4480 = _4472;
    if (_4258)
    {
        float _4482 = _4438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4412 = _4482;
    }
    float _4484 = _4412;
    float _4486 = _4484;
    if (_4258)
    {
        float _4488 = _4426 + (-1.0);
        _4446 = _4488;
    }
    float _4490 = _4446;
    float _4492 = fma(_3480, _4300, _4470);
    if (!_4380)
    {
        int _4494 = _4458 << 4;
        int _4496 = _4494 + _4468;
        _3566 = _4496;
    }
    int _4498 = _3566;
    float _4500 = fma(_3508, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_4258)
    {
        _4474 = _4438;
    }
    float _4502 = _4474;
    float _4504 = fma(_3508, _4328, _4460);
    float _4506 = _4502;
    float _4508 = _4328;
    if (_4258)
    {
        float _4510 = fma(_4454, _4484, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4486 = _4510;
    }
    float _4512 = _4486;
    float _4514 = _4512;
    if (_4258)
    {
        float _4516 = _4490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4462 = _4516;
    }
    float _4518 = _4462;
    if (!_4258)
    {
        _4476 = _4200;
    }
    float _4520 = _4476;
    float _4522 = _4136;
    float _4524 = _4520;
    if (!_4380)
    {
        int _4526 = _4498 + 400;
        uint _4528 = uint(int(uint(_4526) >> uint(2)));
        uint _4530 = uint(int(uint(int(_4528)) >> uint(2)));
        int _4532 = int(_4528) & 3;
        float _4534 = (*spvDescriptorSet0.vp_c15)._m0[int(_4530)][_4532];
        _4522 = _4534;
    }
    float _4536 = _4522;
    if (!_4258)
    {
        _4464 = _4202;
    }
    float _4538 = _4464;
    float _4540 = _4538;
    if (_4258)
    {
        float _4542 = fma(_4438, _4426, _4518);
        _4506 = _4542;
    }
    float _4544 = _4506;
    if (!_4258)
    {
        _4448 = _4212;
    }
    float _4546 = _4448;
    float _4548 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4550 = _4546;
    float _4552 = _4480;
    if (_4258)
    {
        float _4554 = _4480 * _4512;
        _4514 = _4554;
    }
    float _4556 = _4514;
    if (!_4258)
    {
        _4508 = _4214;
    }
    float _4558 = _4508;
    float _4560 = floor(_4500);
    int _4562 = _4256 + 72;
    uint _4564 = uint(int(uint(_4562) >> uint(2)));
    uint _4566 = uint(int(uint(int(_4564)) >> uint(2)));
    int _4568 = int(_4564) & 3;
    float _4570 = (*spvDescriptorSet0.vp_c15)._m0[int(_4566)][_4568];
    int _4572 = int(_4564) + 1;
    uint _4574 = uint(int(uint(_4572) >> uint(2)));
    int _4576 = _4572 & 3;
    float _4578 = (*spvDescriptorSet0.vp_c15)._m0[int(_4574)][_4576];
    float _4580 = _4558;
    if (_4258)
    {
        float _4582 = _4200 * _4556;
        _4524 = _4582;
    }
    float _4584 = _4524;
    if (_4258)
    {
        float _4586 = _4202 * _4556;
        _4540 = _4586;
    }
    float _4588 = _4540;
    float _4590 = _4196 * _4372;
    float _4592 = fma(_3508, _4390, _4492);
    if (_4258)
    {
        float _4594 = _4584 * _4584;
        _4550 = _4594;
    }
    float _4596 = _4550;
    if (_4258)
    {
        float _4598 = _4588 * _4588;
        _4580 = _4598;
    }
    float _4600 = _4580;
    float _4602 = fma(_3480, _4364, _4590);
    float _4604 = _4504 + _4336;
    float _4606 = fma(_4544, _4544, _4596);
    float _4608 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4610 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4612 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4548);
    float _4614 = _4606 + _4600;
    float _4616 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _4618 = _4256 + 80;
    uint _4620 = uint(int(uint(_4618) >> uint(2)));
    uint _4622 = uint(int(uint(int(_4620)) >> uint(2)));
    int _4624 = int(_4620) & 3;
    float _4626 = (*spvDescriptorSet0.vp_c15)._m0[int(_4622)][_4624];
    int _4628 = int(_4620) + 1;
    uint _4630 = uint(int(uint(_4628) >> uint(2)));
    int _4632 = _4628 & 3;
    float _4634 = (*spvDescriptorSet0.vp_c15)._m0[int(_4630)][_4632];
    float _4636 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4608);
    float _4638 = rsqrt(_4614);
    float _4640 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4616);
    float _4642 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4644 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4636);
    float _4646 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4612);
    float _4648 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4640);
    int _4650 = _4256 + 88;
    uint _4652 = uint(int(uint(_4650) >> uint(2)));
    uint _4654 = uint(int(uint(int(_4652)) >> uint(2)));
    int _4656 = int(_4652) & 3;
    float _4658 = (*spvDescriptorSet0.vp_c15)._m0[int(_4654)][_4656];
    int _4660 = int(_4652) + 1;
    uint _4662 = uint(int(uint(_4660) >> uint(2)));
    int _4664 = _4660 & 3;
    float _4666 = (*spvDescriptorSet0.vp_c15)._m0[int(_4662)][_4664];
    float _4668 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4642);
    float _4670 = 1.0 / _4604;
    float _4672 = _4648 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4674 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4676 = fma(_4198, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4674);
    float _4678 = precise::clamp(_4676, 0.0, 1.0);
    float _4680 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4668);
    float _4682 = _4592 + _4398;
    float _4684 = _4672 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4686 = _4646 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4688 = _4680 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4690 = _4638 * _4584;
    float _4692 = -_4684;
    float _4694 = fma(_4692, _4610, 1.0);
    float _4696 = _4644 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4698 = _4688 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4700 = _4690 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4702 = -_4560;
    float _4704 = _4500 + _4702;
    float _4706 = _4454;
    if (!_4380)
    {
        float _4708 = floor(_4238);
        _4706 = _4708;
    }
    float _4710 = _4706;
    float _4712 = fma(_4696, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4698);
    float _4714 = -_4678;
    float _4716 = _4714 + 1.0;
    float _4718 = _4638 * _4544;
    float _4720 = _4638 * _4588;
    float _4722 = _4682 * _4670;
    float _4724 = fma(_4672, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4712);
    float _4726 = -_4700;
    float _4728 = fma(_4718, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4726);
    float _4730 = abs(_4716);
    float _4732 = log2(_4730);
    float _4734 = fma(_3508, _4570, _4602);
    bool _4736 = _4722 >= 0.0;
    float _4738 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4724);
    float _4740 = -_4720;
    float _4742 = fma(_4740, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4728);
    float _4744 = _4734 + _4578;
    bool _4746 = _4722 <= 1.0;
    bool _4748 = _4746 && _4736;
    float _4750 = fma(_4742, -0.5, 0.5);
    float _4752 = _4744 * _4670;
    float _4754 = fma(_4742, 0.5, 0.5);
    float _4756 = _4716;
    if (!_4380)
    {
        float _4758 = floor(_4232);
        _4552 = _4758;
    }
    float _4760 = _4552;
    float _4762 = _4688 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4764 = _4710;
    if (!_4380)
    {
        float _4766 = -_4710;
        float _4768 = _4238 + _4766;
        _4756 = _4768;
    }
    float _4770 = _4756;
    bool _4772 = _4752 >= 0.0;
    bool _4774 = _4772 && _4748;
    float _4776 = _4196 * _4634;
    float _4778 = _4732 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _4780 = _4752 <= 1.0;
    bool _4782 = _4780 && _4774;
    float _4784 = sqrt(_4750);
    float _4786 = fma(_3480, _4626, _4776);
    float _4788 = fma(_3508, _4658, _4786);
    float _4790 = fma(_4754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4792 = exp2(_4778);
    float _4794 = _4688 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4796 = _4788 + _4666;
    float _4798 = fma(_4754, _4790, -0.212114393711090087890625);
    if (_4782)
    {
        float _4800 = float(_4252);
        _4344 = _4800;
    }
    float _4802 = _4344;
    float _4804 = fma(_4696, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4794);
    float _4806 = _4718 + 1.0;
    float _4808 = fma(_4754, _4798, 1.570728778839111328125);
    float _4810 = log2(_4694);
    float _4812 = fma(_4696, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4762);
    float _4814 = fma(_4672, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4804);
    float _4816 = _4784 * 0.636619746685028076171875;
    if (!_4380)
    {
        float _4818 = -_4760;
        float _4820 = _4232 + _4818;
        _4764 = _4820;
    }
    float _4822 = _4764;
    float _4824 = fma(_4672, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4812);
    float _4826 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4814);
    float _4828 = -_4808;
    float _4830 = fma(_4816, _4828, 1.0);
    float _4832 = 1.0 / _4738;
    float _4834 = -_4718;
    float _4836 = fma(_4792, _4806, _4834);
    float _4838 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4824);
    float _4840 = _4796 * _4670;
    float _4842 = _4500;
    float _4844 = _4826;
    float _4846 = _4838;
    if (!_4380)
    {
        float _4848 = rint(_4536);
        float _4850 = precise::max(_4848, 0.0);
        uint _4852 = uint(_4850);
        uint _4854 = clamp(_4852, 0u, 65535u);
        _4842 = as_type<float>(_4854);
    }
    float _4856 = _4842;
    float _4858 = _4810 * 0.693147182464599609375;
    float _4860 = fma(_4836, 0.5, 0.5);
    float2 _12787 = float2(_4376, _4704);
    float _4862 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12787, float2(0.0), isnan(_12787)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12787, float2(0.0), isnan(_12787)), level(0.0)).x;
    float _4864 = _4858 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4866 = _4802;
    if (_4782)
    {
        float _4868 = rint(_4802);
        float _4870 = precise::max(_4868, 0.0);
        uint _4872 = uint(_4870);
        uint _4874 = clamp(_4872, 0u, 65535u);
        _4866 = as_type<float>(_4874);
    }
    float _4876 = _4866;
    float _4878 = _4826 * _4832;
    float _4880 = _4838 * _4832;
    float _4882 = fma(_4878, 0.5, 0.5);
    float _4884 = fma(_4880, -0.5, 0.5);
    float _4886 = _4856;
    if (!_4380)
    {
        float3 _12833 = float3(_4822, _4770, float(as_type<int>(_4856)));
        float3 _12837 = select(_12833, float3(0.0), isnan(_12833));
        float _4888 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12837.xy, uint(rint(_12837.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12837.xy, uint(rint(_12837.z)), level(0.0)).x;
        _4886 = _4888;
    }
    float _4890 = _4886;
    float _4892 = _4832;
    if (_4782)
    {
        float3 _12852 = float3(_4722, _4752, float(as_type<int>(_4876)));
        float3 _12854 = select(_12852, float3(0.0), isnan(_12852));
        float _4894 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12854.xy, uint(rint(_12854.z)), _4840, level(0.0));
        _4892 = _4894;
    }
    float _4896 = _4892;
    float3 _12864 = float3(_4882, _4884, _4864);
    float _4898 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12864, float3(0.0), isnan(_12864)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12864, float3(0.0), isnan(_12864)), level(0.0)).x;
    float3 _12873 = float3(_4882, _4884, _4864);
    float4 _4901 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12873, float3(0.0), isnan(_12873)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12873, float3(0.0), isnan(_12873)), level(0.0)).xyzw;
    float _4903 = _4901.x;
    float _4905 = _4901.y;
    float _4907 = _4901.z;
    float _4909 = _4901.w;
    float2 _12889 = float2(_4830, _4860);
    float3 _4913 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12889, float2(0.0), isnan(_12889)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12889, float2(0.0), isnan(_12889)), level(0.0)).xyz;
    float _4915 = _4913.x;
    float _4917 = _4913.y;
    float _4919 = _4913.z;
    float _4921 = abs(_4210);
    float _4923 = log2(_4921);
    float _4925 = _4688 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4927 = fma(_4696, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4925);
    float _4929 = fma(_4672, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4927);
    float _4931 = _4923 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4933 = exp2(_4931);
    float _4935 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4929);
    float _4937 = _4826 + _4738;
    float _4939 = _4738 * 0.5;
    float _4941 = _4935 + _4738;
    out.gl_Position.x = _4826;
    out.gl_Position.y = _4838;
    out.gl_Position.z = _4935;
    out.gl_Position.w = _4738;
    float _4943 = _4937 * 0.5;
    float _4945 = fma(_4838, -0.5, _4939);
    float _4947 = _4941 * 0.5;
    out.m_98.x = _4943;
    out.m_98.y = _4945;
    out.m_98.z = _4947;
    out.m_98.w = _4738;
    float _4949 = fma(_4933, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4951 = precise::clamp(_4949, 0.0, 1.0);
    float _4953 = fma(_4951, -2.0, 3.0);
    bool _4955 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4957 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4959 = _4955 || _4957;
    bool _4961 = isnan(0.5);
    bool _4963 = _4959 || _4961;
    float _4965 = _4732 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4967 = _4951 * _4951;
    float _4969 = _4967 * _4953;
    float _4971 = exp2(_4965);
    bool _4973 = _4210 <= 8000.0;
    bool _4975 = isnan(_4210);
    bool _4977 = _4973 || _4975;
    bool _4979 = isnan(8000.0);
    bool _4981 = _4977 || _4979;
    float _4983 = float(_4981);
    float _4985 = -_4969;
    float _4987 = _4985 + 1.0;
    float _4989 = _4935;
    if (_4963)
    {
        _4844 = 1.0;
    }
    float _4991 = _4844;
    float _4993 = fma(_4987, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4969);
    float _4995 = _4983 * _4993;
    float _4997 = _4991;
    if (!_4963)
    {
        float _4999 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _5001 = _4999 * 0.15915493667125701904296875;
        float _5003 = _5001 * 6.283185482025146484375;
        float _5005 = cos(_5003);
        float _5007 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _5009 = _5007 * 0.15915493667125701904296875;
        float _5011 = _5001 * 6.283185482025146484375;
        float _5013 = sin(_5011);
        float _5015 = 1.0 / _5005;
        float _5017 = _5009 * 6.283185482025146484375;
        float _5019 = cos(_5017);
        float _5021 = _5013 * _5015;
        float _5023 = _5009 * 6.283185482025146484375;
        float _5025 = sin(_5023);
        float _5027 = _5019 * _5021;
        float _5029 = 1.0 / _5027;
        float _5031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5033 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5031;
        float _5035 = 1.0 / _5033;
        float _5037 = _5025 * _5029;
        float _5039 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5041 = fma(_4210, _5037, _5039);
        float _5043 = _5041 * _5035;
        float _5045 = precise::clamp(_5043, 0.0, 1.0);
        _4989 = _5035;
        _4846 = _5029;
        _4997 = _5045;
    }
    float _5047 = _4989;
    float _5049 = _4846;
    float _5051 = _4997;
    float _5053 = _4995 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5055 = -_4862;
    float _5057 = _5055 + 1.0;
    float _5059 = -_4971;
    float _5061 = _5059 + 1.0;
    float _5063 = _5047;
    float _5065 = _5049;
    float _5067 = _5053;
    if (!_4782)
    {
        _5063 = 1.0;
    }
    float _5069 = _5063;
    float _5071 = _5057 * _5053;
    float _5073 = precise::clamp(_5071, 0.0, 1.0);
    float _5075 = _5069;
    if (_4782)
    {
        bool _5077 = _4896 >= _4840;
        bool _5079 = isnan(_4896);
        bool _5081 = _5077 || _5079;
        bool _5083 = isnan(_4840);
        bool _5085 = _5081 || _5083;
        float _5087 = float(_5085);
        _5075 = _5087;
    }
    float _5089 = _5075;
    float _5091 = _5061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5093 = _5091;
    if (_4380)
    {
        _5065 = 1.0;
    }
    float _5095 = _5065;
    float _5097 = _5095;
    if (!_4380)
    {
        int _5099 = _4418 << 4;
        int _5101 = _5099 + 2048;
        uint _5103 = uint(int(uint(_5101) >> uint(2)));
        uint _5105 = uint(int(uint(int(_5103)) >> uint(2)));
        int _5107 = int(_5103) & 3;
        float _5109 = (*spvDescriptorSet0.vp_c15)._m0[int(_5105)][_5107];
        int _5111 = int(_5103) + 1;
        uint _5113 = uint(int(uint(_5111) >> uint(2)));
        int _5115 = _5111 & 3;
        float _5117 = (*spvDescriptorSet0.vp_c15)._m0[int(_5113)][_5115];
        int _5119 = _5101 + 8;
        uint _5121 = uint(int(uint(_5119) >> uint(2)));
        uint _5123 = uint(int(uint(int(_5121)) >> uint(2)));
        int _5125 = int(_5121) & 3;
        float _5127 = (*spvDescriptorSet0.vp_c15)._m0[int(_5123)][_5125];
        int _5129 = int(_5121) + 1;
        uint _5131 = uint(int(uint(_5129) >> uint(2)));
        int _5133 = _5129 & 3;
        float _5135 = (*spvDescriptorSet0.vp_c15)._m0[int(_5131)][_5133];
        float _5137 = _4196 * _5117;
        float _5139 = fma(_3480, _5109, _5137);
        float _5141 = fma(_3508, _5127, _5139);
        float _5143 = _5141 + _5135;
        float _5145 = precise::clamp(_5143, 0.0, 1.0);
        float _5147 = -_5145;
        float _5149 = _5147 + _4890;
        float _5151 = fma(_5149, 500.0, 1.5);
        float _5153 = exp2(_5151);
        float _5155 = 0.0 + _5153;
        float _5157 = precise::clamp(_5155, 0.0, 1.0);
        _5097 = _5157;
        _5067 = _5109;
        _4242 = 500.0;
    }
    float _5159 = _5097;
    float _5161 = _5067;
    float _5163 = _4242;
    float _5165 = _5089 * _5159;
    float _5167 = _5091 * _4898;
    float _5169 = -_5073;
    float _5171 = fma(_5169, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5173 = -_5091;
    float _5175 = _5173 + 1.0;
    bool _5177 = _4198 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5179 = isnan(_4198);
    bool _5181 = _5177 || _5179;
    bool _5183 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5185 = _5181 || _5183;
    float _5187 = _4909 * _5167;
    float _5189 = -_5165;
    float _5191 = fma(_5189, _5171, 1.0);
    float _5193 = precise::clamp(_5191, 0.0, 1.0);
    float _5195 = _4919 * _5167;
    float _5197 = _4909 * _5175;
    float _5199 = fma(_4915, _5187, _4903);
    float _5201 = fma(_4917, _5187, _4905);
    float _5203 = _5193 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5205 = fma(_4909, _5195, _4907);
    float _5207 = _5051 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_100.x = _5203;
    float _5209 = _5161;
    float _5211 = _5163;
    float _5213 = _5175;
    float _5215 = _5193;
    float _5217 = _5187;
    if (!_5185)
    {
        _5093 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5219 = _5093;
    float _5221 = _5219;
    float _5223 = _5219;
    if (!_5185)
    {
        _5209 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5225 = _5209;
    out.m_102.x = _5199;
    out.m_102.y = _5201;
    out.m_102.z = _5205;
    out.m_102.w = _5197;
    float _5227 = _5225;
    float _5229 = _5225;
    if (!_5185)
    {
        _5211 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5231 = _5211;
    float _5233 = _5231;
    float _5235 = _5231;
    if (!_5185)
    {
        _5213 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5237 = _5213;
    float _5239 = _5237;
    float _5241 = _5237;
    if (!_5185)
    {
        _5215 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5243 = _5215;
    float _5245 = _5243;
    float _5247 = _5243;
    if (!_5185)
    {
        _5217 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5249 = _5217;
    bool _5251 = !_5185;
    float _5253 = _5249;
    float _5255 = _5249;
    if (!_5251)
    {
        bool _5257 = _4198 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5259 = isnan(_4198);
        bool _5261 = _5257 || _5259;
        bool _5263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5265 = _5261 || _5263;
        if (!_5265)
        {
            float _5267 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5269 = _4198 + _5267;
            float _5271 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5273 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5271;
            float _5275 = 1.0 / _5273;
            float _5277 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5279 = _5277 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5281 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5283 = _5281 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5285 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5287 = _5285 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5289 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5291 = _5289 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5293 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5295 = _5293 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5297 = _5269 * _5275;
            float _5299 = precise::clamp(_5297, 0.0, 1.0);
            float _5301 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5303 = _5301 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5305 = fma(_5299, _5279, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5307 = fma(_5299, _5303, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5309 = fma(_5299, _5283, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5311 = fma(_5299, _5287, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5313 = fma(_5299, _5291, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5315 = fma(_5299, _5295, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5229 = _5305;
            _5247 = _5313;
            _5223 = _5307;
            _5241 = _5311;
            _5235 = _5309;
            _5255 = _5315;
            _5317 = true;
        }
        else
        {
            bool _5319 = _4198 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5321 = isnan(_4198);
            bool _5323 = _5319 || _5321;
            bool _5325 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5327 = _5323 || _5325;
            if (!_5327)
            {
                _5221 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5329 = _5221;
            _5223 = _5329;
            if (!_5327)
            {
                _5227 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5331 = _5227;
            _5229 = _5331;
            if (!_5327)
            {
                _5233 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5333 = _5233;
            _5235 = _5333;
            if (!_5327)
            {
                _5239 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5335 = _5239;
            _5241 = _5335;
            if (!_5327)
            {
                _5245 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5337 = _5245;
            _5247 = _5337;
            if (!_5327)
            {
                _5253 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5339 = _5253;
            bool _5341 = !_5327;
            _5255 = _5339;
            if (!_5341)
            {
                bool _5343 = _4198 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5345 = isnan(_4198);
                bool _5347 = _5343 || _5345;
                bool _5349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5351 = _5347 || _5349;
                if (!_5351)
                {
                    float _5353 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5355 = _4198 + _5353;
                    float _5357 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5359 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5357;
                    float _5361 = 1.0 / _5359;
                    float _5363 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5365 = _5363 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5367 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5369 = _5367 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5371 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5373 = _5371 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5375 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5377 = _5375 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5379 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5381 = _5379 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5383 = _5355 * _5361;
                    float _5385 = precise::clamp(_5383, 0.0, 1.0);
                    float _5387 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5389 = _5387 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5391 = fma(_5385, _5365, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5393 = fma(_5385, _5389, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5395 = fma(_5385, _5369, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5397 = fma(_5385, _5373, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5399 = fma(_5385, _5377, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5401 = fma(_5385, _5381, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5229 = _5391;
                    _5247 = _5399;
                    _5223 = _5393;
                    _5241 = _5397;
                    _5235 = _5395;
                    _5255 = _5401;
                    _5317 = true;
                }
                else
                {
                    _5229 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5247 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5223 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5241 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5235 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5255 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5317 = false;
    float _5403 = _5229;
    float _5405 = _5247;
    float _5407 = _5223;
    float _5409 = _5241;
    float _5411 = _5235;
    float _5413 = _5255;
    float _5415 = fma(_3914, -0.5, 0.5);
    float _5417 = precise::clamp(_5415, 0.0, 1.0);
    float _5419 = -_5403;
    float _5421 = _5419 + _5405;
    float _5423 = _5207 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5425 = -_5407;
    float _5427 = _5425 + _5409;
    out.m_104.x = 0.0;
    float _5429 = fma(_5417, _5421, _5403);
    float _5431 = fma(_5417, _5427, _5407);
    out.m_65.x = _5423;
    float _5433 = -_5411;
    float _5435 = _5433 + _5413;
    float _5437 = _5429 * 0.586610972881317138671875;
    bool _5439 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5441 = fma(_5417, _5435, _5411);
    float _5443 = fma(_5431, 0.298911988735198974609375, _5437);
    bool _5445 = _5051 > 0.0;
    bool _5447 = isnan(_5051);
    bool _5449 = _5445 || _5447;
    bool _5451 = isnan(0.0);
    bool _5453 = _5449 || _5451;
    float _5455 = fma(_5441, 0.114477999508380889892578125, _5443);
    float _5457 = -_5455;
    float _5459 = _5431 + _5457;
    float _5461 = -_5455;
    float _5463 = _5429 + _5461;
    float _5465 = -_5455;
    float _5467 = _5441 + _5465;
    float _5469 = fma(_5459, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5455);
    float _5471 = fma(_5463, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5455);
    float _5473 = fma(_5467, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5455);
    bool _5475 = !_5439;
    if (!_5475)
    {
        float _5477 = -_4144;
        float _5479 = _5477 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5481 = -_4148;
        float _5483 = _5481 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5485 = -_4154;
        float _5487 = _5485 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5489 = _5479 * _5479;
        float _5491 = fma(_5483, _5483, _5489);
        float _5493 = fma(_5487, _5487, _5491);
        float _5495 = sqrt(_5493);
        float _5497 = rsqrt(_5493);
        float _5499 = -_5495;
        float _5501 = _5499 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5503 = _5501 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5505 = precise::clamp(_5503, 0.0, 1.0);
        float _5507 = _5483 * _5497;
        float _5509 = _5479 * _5497;
        float _5511 = abs(_5505);
        float _5513 = log2(_5511);
        float _5515 = _5487 * _5497;
        float _5517 = _5507 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5519 = _3914 * _5509;
        float _5521 = -_5509;
        float _5523 = -_5517;
        float _5525 = fma(_5521, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5523);
        float _5527 = fma(_3918, _5507, _5519);
        float _5529 = -_5515;
        float _5531 = fma(_5529, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5525);
        float _5533 = fma(_3920, _5515, _5527);
        float _5535 = precise::clamp(_5533, 0.0, 1.0);
        float _5537 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5539 = _5531 + _5537;
        float _5541 = _5513 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5543 = _5539 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5545 = precise::clamp(_5543, 0.0, 1.0);
        float _5547 = exp2(_5541);
        float _5549 = _5547 * _5545;
        float _5551 = _5535 * _5549;
        float _5553 = _5551 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5555 = _5551 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5557 = _5551 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _5553;
        out.m_104.y = _5555;
        out.m_104.z = _5557;
    }
    out.m_106.x = _5469;
    out.m_106.y = _5471;
    out.m_106.z = _5473;
    if (_5453)
    {
        return out;
    }
    out.m_65.x = 0.0;
    float _5559 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5559;
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
    bool _5317 = false;
    bool _3968 = false;
    bool _489 = false;
    bool _345 = false;
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
        float _5628 = as_type<float>(_149);
        out.gl_Position.z = _5628;
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
        float _5691 = as_type<float>(_181);
        out.gl_Position.z = _5691;
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
    float _325 = _319;
    float _343;
    if (!_323)
    {
        float _327 = in.m_72.x;
        float _329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _331 = _327 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _335 = _333 * _329;
        float _337 = floor(_335);
        float _339 = -_337;
        float _341 = _335 + _339;
        _343 = _341;
        _345 = true;
    }
    else
    {
        _343 = _175;
    }
    _345 = false;
    float _347 = _343;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _351 = _347 + _349;
    float _353 = in.m_74.x;
    float _355 = in.m_74.y;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _361 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _363 = isnan(_347);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _377 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _379 = isnan(_347);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _389;
    bool _393 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _395 = isnan(_347);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = 1.0 / _359;
    float _407 = -_371;
    float _409 = _407 + 1.0;
    bool _411 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _413 = 1.0 / _375;
    float _415 = _391 * _405;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _421 = -_403;
    float _423 = _421 + 1.0;
    float _425 = _319 * _353;
    float _427 = fma(_415, _351, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _429 = _387 * _409;
    float _431 = -_387;
    float _433 = _431 + 1.0;
    float _435 = _371 * _423;
    float _437 = _419 * _413;
    float _439 = _427 * _429;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _443 = _347 + _441;
    float _445 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[115].x, _439);
    float _447 = fma(_437, _443, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _451 = fma(_447, _435, _445);
    float _453 = _321 * _355;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _457 = _449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _459 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[117].x, _451);
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _459 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _467 = _461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_76.x = _457;
    out.m_76.y = _463;
    out.m_76.z = _467;
    out.m_76.w = _465;
    bool _469 = !_411;
    float _487;
    if (!_469)
    {
        float _471 = in.m_72.x;
        float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _475 = _471 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _477 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[11].w, _131);
        float _479 = _477 * _473;
        float _481 = floor(_479);
        float _483 = -_481;
        float _485 = _479 + _483;
        _487 = _485;
        _489 = true;
    }
    else
    {
        _487 = _175;
    }
    _489 = false;
    float _491 = _487;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _495 = _491 + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _501 = _491 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _503 = isnan(_491);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _517 = _491 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _519 = isnan(_491);
    bool _521 = _517 || _519;
    bool _523 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _525 = _521 || _523;
    float _527 = float(_525);
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _529;
    bool _533 = _491 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _535 = isnan(_491);
    bool _537 = _533 || _535;
    bool _539 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _541 = _537 || _539;
    float _543 = float(_541);
    float _545 = 1.0 / _499;
    float _547 = -_511;
    float _549 = _547 + 1.0;
    bool _551 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _553 = 1.0 / _515;
    float _555 = _531 * _545;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _561 = -_543;
    float _563 = _561 + 1.0;
    float _565 = fma(_555, _495, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _567 = _527 * _549;
    float _569 = -_527;
    float _571 = _569 + 1.0;
    float _573 = _511 * _563;
    float _575 = _559 * _553;
    float _577 = _565 * _567;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _581 = _491 + _579;
    float _583 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[131].x, _577);
    float _585 = fma(_575, _581, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _589 = fma(_585, _573, _583);
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _593 = _587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _597 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[133].x, _589);
    float _599 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = _595 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = _597 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _593;
    out.m_78.y = _599;
    out.m_78.z = _601;
    out.m_78.w = _603;
    bool _605 = !_551;
    if (!_605)
    {
        float _607 = in.m_72.x;
        float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _611 = _607 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _613 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[14].x, _131);
        float _615 = _613 * _609;
        float _617 = floor(_615);
        float _619 = -_617;
        float _621 = _615 + _619;
        _177 = _621;
    }
    float _623 = _177;
    float _625 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _627 = int(_625);
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _631 = _629 != 0;
    float _633 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _635 = int(_633);
    float _637 = float(_627);
    float _639 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _641 = int(_639);
    if (_631)
    {
        _325 = 1.0;
    }
    float _643 = _325;
    float _645 = float(_635);
    float _647 = 1.0 / _637;
    float _649 = 1.0 / _645;
    float _651 = float(uint(_641));
    int _653 = ~_641;
    int _655 = _653 + 1;
    float _657 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _659 = int(_657);
    float _661 = _647 * _131;
    float _663 = _645;
    float _665 = _647;
    float _667 = _643;
    if (_631)
    {
        float _669 = in.m_72.x;
        float _671 = in.m_72.y;
        _663 = _669;
        _665 = _671;
    }
    float _673 = _663;
    float _675 = _665;
    float _677 = _649 * _131;
    float _679 = 1.0 / _651;
    float _681 = float(uint(_659));
    float _683 = trunc(_677);
    int _685 = int(_683);
    float _687 = 1.0 / _681;
    int _689 = as_type<int>(_679) + (-2);
    int _691 = as_type<int>(_679);
    if (_631)
    {
        _691 = 0;
    }
    int _693 = _691;
    float _695 = 0.0;
    float _697 = _673;
    float _699 = _675;
    int _701 = _693;
    if (_631)
    {
        _695 = _675;
    }
    float _703 = _695;
    float _705 = trunc(_661);
    int _707 = int(_705);
    float _709 = float(uint(_685));
    float _711 = as_type<float>(_689) * _709;
    float _713 = _709;
    float _715 = _703;
    if (_631)
    {
        _713 = _673;
    }
    float _717 = _713;
    float _719 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _721 = int(_719);
    int _723 = as_type<int>(_687) + (-2);
    float _725 = 0.0;
    float _727 = _717;
    if (_631)
    {
        _725 = _717;
    }
    float _729 = _725;
    float _731 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _733 = int(_731);
    float _735 = float(uint(_707));
    float _737 = as_type<float>(_723) * _735;
    float _739 = _735;
    float _741 = _729;
    if (_631)
    {
        _739 = 1.0;
    }
    float _743 = _739;
    float _745 = trunc(_711);
    float _747 = precise::max(_745, 0.0);
    uint _750 = uint(_747);
    float _752 = float(uint(_721));
    float _754 = trunc(_737);
    float _756 = precise::max(_754, 0.0);
    uint _758 = uint(_756);
    float _760 = float(_733);
    float _762 = 1.0 / _760;
    float _764 = 1.0 / _752;
    float _766 = _760;
    int _768 = as_type<int>(_752);
    float _770 = _743;
    if (_631)
    {
        _766 = _717;
    }
    float _772 = _766;
    float _774 = _772;
    if (_631)
    {
        _768 = 0;
    }
    int _776 = _768;
    int _778 = _776;
    if (!_631)
    {
        float _780 = in.m_72.x;
        float _782 = in.m_72.y;
        float _784 = in.m_72.z;
        float _786 = _780 * 3.1415927410125732421875;
        float _788 = _786 * 0.15915493667125701904296875;
        float _790 = _782 * 3.1415927410125732421875;
        float _792 = _790 * 0.15915493667125701904296875;
        float _794 = _788 * 6.283185482025146484375;
        float _796 = sin(_794);
        float _798 = _792 * 6.283185482025146484375;
        float _800 = sin(_798);
        _667 = 7.345489978790283203125;
        _697 = _780;
        _770 = 5.839270114898681640625;
        _774 = _784;
        _727 = _782;
        _699 = _782;
        _701 = 1;
        _715 = _800;
        _778 = 2;
        _741 = _796;
    }
    float _802 = _667;
    float _804 = _697;
    float _806 = _770;
    float _808 = _774;
    float _810 = _727;
    float _812 = _699;
    int _814 = _701;
    float _816 = _715;
    int _818 = _778;
    float _820 = _741;
    int _822 = _655 * int(_750);
    int _824 = _822 + _685;
    int _826 = ~_659;
    int _828 = _826 + 1;
    float _830 = _762 * _131;
    float _832 = _802 * _804;
    float _834 = in.m_72.z;
    float _836 = in.m_72.w;
    float _838 = _806 * _808;
    float _840 = float(uint(_824));
    int _842 = _828 * int(_758);
    int _844 = _842 + _707;
    float _846 = floor(_832);
    float _848 = float(_641);
    float _850 = _802 * _810;
    float _852 = as_type<float>(_689) * _840;
    float _854 = float(uint(_844));
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _858 = _623 + _856;
    float _860 = float(_685);
    float _862 = _812 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _864 = trunc(_830);
    int _866 = int(_864);
    float _868 = as_type<float>(_723) * _854;
    bool _870 = _860 >= _848;
    bool _872 = isnan(_860);
    bool _874 = _870 || _872;
    bool _876 = isnan(_848);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = _804 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _884 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _886 = as_type<int>(_764) + (-2);
    float _888 = trunc(_852);
    float _890 = precise::max(_888, 0.0);
    uint _892 = uint(_890);
    float _894 = -_846;
    float _896 = _832 + _894;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _900 = _898 != 0;
    bool _902 = _836 > 0.5;
    bool _904 = _834 > 0.5;
    float _906 = floor(_838);
    float _908 = float(uint(_866));
    bool _910 = _812 > 0.5;
    int _912 = ~_641;
    int _914 = _912 + 1;
    float _916 = as_type<float>(_886) * _908;
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _928 = _926 != 0;
    float _930 = trunc(_868);
    float _932 = precise::max(_930, 0.0);
    uint _934 = uint(_932);
    int _936 = int(_750) + int(_892);
    int _938 = ~_659;
    int _940 = _938 + 1;
    float _942 = -_221;
    int _944 = _910 ? as_type<int>(_942) : as_type<int>(_221);
    float _946 = -_906;
    float _948 = _838 + _946;
    float _950 = -_225;
    int _952 = _904 ? as_type<int>(_950) : as_type<int>(_225);
    float _954 = trunc(_916);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    int _960 = _914 * _936;
    int _962 = _960 + _685;
    bool _964 = !_928;
    float _966 = _964 ? _225 : as_type<float>(_952);
    float _968 = _896 * _848;
    int _970 = int(_758) + int(_934);
    float _972 = floor(_850);
    int _974 = int(_902);
    int _976 = _904 ? 2 : 0;
    int _978 = _974 | _976;
    int _980 = _900 ? 4 : 0;
    int _982 = _978 | _980;
    int _984 = _920 ? 8 : 0;
    int _986 = _982 | _984;
    int _988 = _924 ? 16 : 0;
    int _990 = _986 | _988;
    int _992 = _928 ? 32 : 0;
    int _994 = _990 | _992;
    int _996 = _910 ? 64 : 0;
    int _998 = _994 | _996;
    int _1000 = _998 & 64;
    bool _1002 = !_924;
    float _1004 = _1002 ? _221 : as_type<float>(_944);
    int _1006 = _940 * _970;
    int _1008 = _1006 + _707;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1012 = _1010 != 0;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1016 = _1014 != 0;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1020 = _1018 != 0;
    bool _1022 = !_900;
    int _1024 = _1022 ? 0 : 1;
    float _1026 = trunc(_968);
    int _1028 = int(_1026);
    float _1030 = float(_659);
    float _1032 = float(_707);
    bool _1034 = uint(_962) >= uint(_641);
    float _1036 = _948 * _1030;
    int _1038 = ~_721;
    int _1040 = _1038 + 1;
    float _1042 = trunc(_880);
    int _1044 = int(_1042);
    bool _1046 = !_1016;
    int _1048 = _1046 ? 0 : 1;
    bool _1050 = !_1012;
    int _1052 = _1050 ? 0 : 1;
    int _1054 = _1040 * int(_958);
    int _1056 = _1054 + _866;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1060 = _1058 != 0;
    bool _1062 = uint(_1008) >= uint(_659);
    float _1064 = trunc(_1036);
    int _1066 = int(_1064);
    bool _1068 = _1032 >= _1030;
    bool _1070 = isnan(_1032);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(_1030);
    bool _1076 = _1072 || _1074;
    float _1078 = float(_1076);
    bool _1080 = !_1020;
    int _1082 = _1080 ? 0 : 1;
    bool _1084 = !_1060;
    int _1086 = _1084 ? 0 : 1;
    bool _1088 = !_1062;
    int _1090 = _1088 ? 0 : (-1);
    float _1092 = trunc(_1078);
    int _1094 = int(_1092);
    bool _1096 = !_1034;
    int _1098 = _1096 ? 0 : (-1);
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1102 = _1100 != 0;
    int _1104 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1106 = _1104 != 0;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1110 = _1108 != 0;
    int _1112 = abs(_1024);
    int _1114 = ~_936;
    int _1116 = _1114 + _1098;
    int _1118 = _1116 + 1;
    float _1120 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1122 = log2(_1120);
    float _1124 = -_972;
    float _1126 = _850 + _1124;
    float _1128 = float(uint(_1056));
    int _1130 = _1028 * _1112;
    int _1132 = _1130 + _685;
    bool _1134 = !_1106;
    int _1136 = _1134 ? 0 : 1;
    int _1138 = _641 * _1118;
    int _1140 = _1138 + _685;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1144 = _1142 != 0;
    float _1146 = as_type<float>(_886) * _1128;
    bool _1148 = _1000 != 0;
    float _1150 = _171 * _131;
    int _1152 = ~_970;
    int _1154 = _1152 + _1090;
    int _1156 = _1154 + 1;
    bool _1158 = !_1144;
    int _1160 = _1158 ? 0 : 1;
    float _1162 = _848 * _1150;
    bool _1164 = _641 == 0;
    int _1166 = _659 * _1156;
    int _1168 = _1166 + _707;
    bool _1170 = !_1102;
    int _1172 = _1170 ? 0 : 1;
    float _1174 = trunc(_1146);
    float _1176 = precise::max(_1174, 0.0);
    uint _1178 = uint(_1176);
    bool _1180 = _659 == 0;
    float _1182 = _1030 * _1150;
    int _1184 = ~_1044;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    bool _1190 = !_1164;
    int _1192 = _1190 ? _1140 : (-1);
    int _1194 = ~_1094;
    int _1196 = _1194 + 1;
    int _1198 = _1196 + 1;
    float _1200 = trunc(_1162);
    int _1202 = int(_1200);
    bool _1204 = !_1180;
    int _1206 = _1204 ? _1168 : (-1);
    int _1208 = _1192 * _1188;
    int _1210 = _641 + (-1);
    int _1212 = abs(_1048);
    int _1214 = _1206 * _1198;
    int _1216 = _659 + (-1);
    int _1218 = _1044 * _1210;
    int _1220 = _1218 + _1208;
    int _1222 = abs(_1136);
    float _1224 = trunc(_1182);
    int _1226 = int(_1224);
    int _1228 = abs(_1052);
    int _1230 = _1094 * _1216;
    int _1232 = _1230 + _1214;
    int _1234 = _1220 * _1212;
    int _1236 = abs(_1160);
    float _1238 = _804 * 2.0;
    int _1240 = ~_721;
    int _1242 = _1240 + 1;
    int _1244 = _1232 * _1222;
    int _1246 = abs(_1082);
    int _1248 = _1202 * _1228;
    int _1250 = _1248 + _1234;
    int _1252 = abs(_1086);
    int _1254 = _1066 * _1236;
    int _1256 = _1254 + _707;
    int _1258 = int(_958) + int(_1178);
    int _1260 = _1132 * _1246;
    int _1262 = _1260 + _1250;
    float _1264 = floor(_1238);
    int _1266 = abs(_1172);
    int _1268 = _1242 * _1258;
    int _1270 = _1268 + _866;
    float _1272 = -_225;
    int _1274 = _902 ? as_type<int>(_1272) : as_type<int>(_225);
    int _1276 = _1028 * _1252;
    int _1278 = _1276 + _1262;
    float _1280 = -_221;
    int _1282 = _904 ? as_type<int>(_1280) : as_type<int>(_221);
    int _1284 = _1226 * _1266;
    int _1286 = _1284 + _1244;
    bool _1288 = uint(_1270) >= uint(_721);
    float _1290 = float(_721);
    float _1292 = float(_866);
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1296 = _1294 != 0;
    float _1298 = _1290 * _1150;
    bool _1300 = !_1110;
    int _1302 = _1300 ? 0 : 1;
    float _1304 = float(uint(_1278));
    bool _1306 = _1292 >= _1290;
    bool _1308 = isnan(_1292);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan(_1290);
    bool _1314 = _1310 || _1312;
    float _1316 = float(_1314);
    float _1318 = _1126 * _1290;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1322 = _1320 != 0;
    float _1324 = as_type<float>(_689) * _1304;
    bool _1326 = !_1296;
    int _1328 = _1326 ? 0 : 1;
    float _1330 = trunc(_1298);
    int _1332 = int(_1330);
    int _1334 = abs(_1302);
    bool _1336 = !_920;
    float _1338 = _1336 ? _225 : as_type<float>(_1274);
    bool _1340 = !_1322;
    int _1342 = _1340 ? 0 : 1;
    int _1344 = abs(_1328);
    float _1346 = trunc(_1324);
    float _1348 = precise::max(_1346, 0.0);
    uint _1350 = uint(_1348);
    bool _1352 = !_1288;
    int _1354 = _1352 ? 0 : (-1);
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1370 = _1368 != 0;
    int _1372 = _1256 * _1334;
    int _1374 = _1372 + _1286;
    float _1376 = trunc(_1316);
    int _1378 = int(_1376);
    int _1380 = ~_641;
    int _1382 = _1380 + 1;
    bool _1384 = !_1362;
    int _1386 = _1384 ? 0 : 1;
    int _1388 = _1066 * _1344;
    int _1390 = _1388 + _1374;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1394 = _1392 != 0;
    int _1396 = ~_1258;
    int _1398 = _1396 + _1354;
    int _1400 = _1398 + 1;
    int _1402 = _1382 * int(_1350);
    int _1404 = _1402 + _1278;
    float _1406 = float(uint(_1390));
    float _1408 = trunc(_1318);
    int _1410 = int(_1408);
    bool _1412 = !_1358;
    int _1414 = _1412 ? 0 : 1;
    int _1416 = _721 * _1400;
    int _1418 = _1416 + _866;
    bool _1420 = _721 == 0;
    float _1422 = as_type<float>(_723) * _1406;
    float _1424 = float(uint(_1404));
    int _1426 = ~_1378;
    int _1428 = _1426 + 1;
    int _1430 = _1428 + 1;
    float _1432 = _1406;
    if (_1394)
    {
        float _1434 = in.m_72.w;
        _1432 = _1434;
    }
    float _1436 = _1432;
    bool _1438 = !_1420;
    int _1440 = _1438 ? _1418 : (-1);
    float _1442 = as_type<float>(_689) * _1424;
    float _1444 = trunc(_1422);
    float _1446 = precise::max(_1444, 0.0);
    uint _1448 = uint(_1446);
    int _1450 = abs(_1386);
    int _1452 = _1440 * _1430;
    int _1454 = _721 + (-1);
    int _1456 = abs(_1414);
    float _1458 = trunc(_1442);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    int _1464 = abs(_1342);
    int _1466 = _1378 * _1454;
    int _1468 = _1466 + _1452;
    int _1470 = _1468 * _1450;
    int _1472 = ~_659;
    int _1474 = _1472 + 1;
    bool _1476 = _641 == 0;
    int _1478 = _1332 * _1456;
    int _1480 = _1478 + _1470;
    int _1482 = _1410 * _1464;
    int _1484 = _1482 + _866;
    float _1486 = as_type<float>(_1464);
    if (_1394)
    {
        float _1488 = _1436 * 3.1415927410125732421875;
        _1486 = _1488;
    }
    float _1490 = _1486;
    int _1492 = ~_641;
    int _1494 = _1492 + 1;
    int _1496 = _1474 * int(_1448);
    int _1498 = _1496 + _1390;
    float _1500 = _1490;
    if (_1394)
    {
        float _1502 = _1490 * 0.15915493667125701904296875;
        _1500 = _1502;
    }
    float _1504 = _1500;
    int _1506 = int(_1350) + int(_1462);
    bool _1508 = !_1366;
    int _1510 = _1508 ? 0 : 1;
    float _1512 = float(uint(_1498));
    float _1514 = _1504;
    if (_1394)
    {
        float _1516 = _1504 * 6.283185482025146484375;
        float _1518 = sin(_1516);
        _1514 = _1518;
    }
    float _1520 = _1514;
    int _1522 = _1494 * _1506;
    int _1524 = _1522 + _1278;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1528 = _1526 != 0;
    int _1530 = abs(_1510);
    float _1532 = as_type<float>(_723) * _1512;
    bool _1534 = !_1370;
    int _1536 = _1534 ? 0 : 1;
    bool _1538 = uint(_1524) >= uint(_641);
    int _1540 = _1484 * _1530;
    int _1542 = _1540 + _1480;
    float _1544 = float(uint(_1132));
    float _1546 = trunc(_1532);
    float _1548 = precise::max(_1546, 0.0);
    uint _1550 = uint(_1548);
    int _1552 = abs(_1536);
    bool _1554 = !_1538;
    int _1556 = _1554 ? 0 : (-1);
    float _1558 = as_type<float>(_689) * _1544;
    int _1560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1562 = _1560 != 0;
    int _1564 = _1410 * _1552;
    int _1566 = _1564 + _1542;
    int _1568 = ~_1506;
    int _1570 = _1568 + _1556;
    int _1572 = _1570 + 1;
    float _1574 = as_type<float>(_1452);
    bool _1576 = _1562;
    if (_1528)
    {
        float _1578 = in.m_72.x;
        _1574 = _1578;
    }
    float _1580 = _1574;
    bool _1582 = !_1562;
    float _1584 = _1582 ? _221 : as_type<float>(_1282);
    float _1586 = trunc(_1558);
    float _1588 = precise::max(_1586, 0.0);
    uint _1590 = uint(_1588);
    if (_1394)
    {
        bool _1592 = _1520 > 0.5;
        _1576 = _1592;
    }
    bool _1594 = _1576;
    int _1596 = _641 * _1572;
    int _1598 = _1596 + _1278;
    float _1600 = float(uint(_1566));
    int _1602 = ~_641;
    int _1604 = _1602 + 1;
    bool _1606 = !_1476;
    int _1608 = _1606 ? _1598 : (-1);
    float _1610 = as_type<float>(_886) * _1600;
    float _1612 = 0.0;
    float _1614 = _1600;
    if (!_1394)
    {
        _1612 = _221;
    }
    float _1616 = _1612;
    float _1618 = trunc(_1610);
    float _1620 = precise::max(_1618, 0.0);
    uint _1622 = uint(_1620);
    float _1624 = _1616;
    if (_1394)
    {
        float _1626 = -_221;
        float _1628 = _1594 ? _1626 : _221;
        _1624 = _1628;
    }
    float _1630 = _1624;
    int _1632 = _1608 & 3;
    bool _1634 = _1632 != 0;
    int _1636 = _1604 * int(_1590);
    int _1638 = _1636 + _1132;
    int _1640 = _1608 & 3;
    bool _1642 = _1640 != 0;
    int _1644 = _1634 ? 0 : 1;
    bool _1646 = uint(_1640) > 1u;
    if (_1528)
    {
        float _1648 = _1580 * 3.1415927410125732421875;
        _1614 = _1648;
    }
    float _1650 = _1614;
    int _1652 = int(_1448) + int(_1550);
    float _1654 = float(uint(_1256));
    float _1656 = _1650;
    if (_1528)
    {
        float _1658 = _1650 * 0.15915493667125701904296875;
        _1656 = _1658;
    }
    float _1660 = _1656;
    float _1662 = float(uint(_1638));
    int _1664 = ~_721;
    int _1666 = _1664 + 1;
    float _1668 = as_type<float>(_723) * _1654;
    int _1670 = ~_659;
    int _1672 = _1670 + 1;
    float _1674 = as_type<float>(_689) * _1662;
    int _1676 = ~_1644;
    int _1678 = _1676 + 1;
    int _1680 = _1678 + 1;
    int _1682 = _1666 * int(_1622);
    int _1684 = _1682 + _1566;
    float _1686 = -_225;
    int _1688 = _1148 ? as_type<int>(_1686) : as_type<int>(_225);
    int _1690 = _1672 * _1652;
    int _1692 = _1690 + _1390;
    float _1694 = trunc(_1668);
    float _1696 = precise::max(_1694, 0.0);
    uint _1698 = uint(_1696);
    int _1700 = _1680;
    if (!_1646)
    {
        int _1702 = ~_1644;
        int _1704 = _1702 + 1;
        _1700 = _1704;
    }
    int _1706 = _1700;
    bool _1708 = uint(_1640) >= 2u;
    int _1710 = ~_659;
    int _1712 = _1710 + 1;
    float _1714 = float(uint(_1684));
    float _1716 = _1660;
    if (_1528)
    {
        float _1718 = _1660 * 6.283185482025146484375;
        float _1720 = sin(_1718);
        _1716 = _1720;
    }
    float _1722 = _1716;
    bool _1724 = uint(_1692) >= uint(_659);
    int _1726 = _1708 ? 0 : 1;
    float _1728 = as_type<float>(_886) * _1714;
    bool _1730 = _1640 != 3;
    float _1732 = trunc(_1674);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    bool _1738 = !_1724;
    int _1740 = _1738 ? 0 : (-1);
    int _1742 = _1712 * int(_1698);
    int _1744 = _1742 + _1256;
    int _1746 = ~_1726;
    int _1748 = _1746 + 1;
    int _1750 = _1748 + 1;
    int _1752 = ~_1652;
    int _1754 = _1752 + _1740;
    int _1756 = _1754 + 1;
    float _1758 = trunc(_1728);
    float _1760 = precise::max(_1758, 0.0);
    uint _1762 = uint(_1760);
    float _1764 = float(uint(_1744));
    int _1766 = _659 * _1756;
    int _1768 = _1766 + _1390;
    float _1770 = 0.0;
    int _1772 = _1750;
    bool _1774 = _1730;
    if (!_1528)
    {
        _1770 = _225;
    }
    float _1776 = _1770;
    float _1778 = _1776;
    if (_1730)
    {
        int _1780 = ~_1726;
        int _1782 = _1780 + 1;
        _1772 = _1782;
    }
    int _1784 = _1772;
    float _1786 = as_type<float>(_723) * _1764;
    if (_1528)
    {
        bool _1788 = _1722 > 0.5;
        _1774 = _1788;
    }
    bool _1790 = _1774;
    bool _1792 = !_1180;
    int _1794 = _1792 ? _1768 : (-1);
    int _1796 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1798 = _1796 != 0;
    float _1800 = trunc(_1786);
    float _1802 = precise::max(_1800, 0.0);
    uint _1804 = uint(_1802);
    if (_1528)
    {
        float _1806 = -_225;
        float _1808 = _1790 ? _1806 : _225;
        _1778 = _1808;
    }
    float _1810 = _1778;
    int _1812 = _1794 & 3;
    bool _1814 = _1812 != 0;
    bool _1816 = !_1798;
    float _1818 = _1816 ? _225 : as_type<float>(_1688);
    float _1820 = _1810 + (-0.5);
    bool _1822 = uint(_1812) > 1u;
    int _1824 = int(_1622) + int(_1762);
    int _1826 = ~_721;
    int _1828 = _1826 + 1;
    int _1830 = _1794 & 3;
    bool _1832 = _1830 != 0;
    int _1834 = int(_1590) + int(_1736);
    int _1836 = _1828 * _1824;
    int _1838 = _1836 + _1566;
    int _1840 = ~_641;
    int _1842 = _1840 + 1;
    int _1844 = _1832 ? 0 : 1;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1848 = _1846 != 0;
    int _1850 = _1842 * _1834;
    int _1852 = _1850 + _1132;
    float _1854 = float(uint(_1484));
    bool _1856 = !_1848;
    int _1858 = _1856 ? 0 : 1;
    bool _1860 = uint(_1838) >= uint(_721);
    float _1862 = as_type<float>(_886) * _1854;
    int _1864 = ~_1844;
    int _1866 = _1864 + 1;
    int _1868 = _1866 + 1;
    int _1870 = _1868;
    if (!_1822)
    {
        int _1872 = ~_1844;
        int _1874 = _1872 + 1;
        _1870 = _1874;
    }
    int _1876 = _1870;
    float _1878 = trunc(_1862);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    bool _1884 = uint(_1852) >= uint(_641);
    bool _1886 = !_1860;
    int _1888 = _1886 ? 0 : (-1);
    bool _1890 = _1812 != 3;
    bool _1892 = !_1884;
    int _1894 = _1892 ? 0 : (-1);
    bool _1896 = uint(_1812) >= 2u;
    int _1898 = ~_1824;
    int _1900 = _1898 + _1888;
    int _1902 = _1900 + 1;
    int _1904 = ~_659;
    int _1906 = _1904 + 1;
    int _1908 = int(_1698) + int(_1804);
    int _1910 = _721 * _1902;
    int _1912 = _1910 + _1566;
    int _1914 = _1896 ? 0 : 1;
    int _1916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1918 = _1916 != 0;
    int _1920 = _1906 * _1908;
    int _1922 = _1920 + _1256;
    int _1924 = ~_721;
    int _1926 = _1924 + 1;
    int _1928 = ~_1914;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = _1932;
    int _1936 = _1876;
    if (_1890)
    {
        int _1938 = ~_1914;
        int _1940 = _1938 + 1;
        _1934 = _1940;
    }
    int _1942 = _1934;
    int _1944 = _1926 * int(_1882);
    int _1946 = _1944 + _1484;
    int _1948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _1950 = _1948 != 0;
    bool _1952 = !_1918;
    int _1954 = _1952 ? 0 : 1;
    bool _1956 = uint(_1922) >= uint(_659);
    bool _1958 = !_1420;
    int _1960 = _1958 ? _1912 : (-1);
    bool _1962 = !_1950;
    int _1964 = _1962 ? 0 : 1;
    bool _1966 = !_1956;
    int _1968 = _1966 ? 0 : (-1);
    int _1970 = _1960 & 3;
    bool _1972 = _1970 != 0;
    int _1974 = _1960 & 3;
    bool _1976 = _1974 != 0;
    float _1978 = float(uint(_1946));
    int _1980 = _1972 ? 0 : 1;
    bool _1982 = uint(_1974) > 1u;
    float _1984 = as_type<float>(_886) * _1978;
    int _1986 = ~_1980;
    int _1988 = _1986 + 1;
    int _1990 = _1988 + 1;
    int _1992 = ~_721;
    int _1994 = _1992 + 1;
    float _1996 = trunc(_1984);
    float _1998 = precise::max(_1996, 0.0);
    uint _2000 = uint(_1998);
    float _2002 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2004 = _2002 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2008 = _2006 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2010 = _1990;
    if (!_1982)
    {
        int _2012 = ~_1980;
        int _2014 = _2012 + 1;
        _2010 = _2014;
    }
    int _2016 = _2010;
    float _2018 = 1.0 / _2004;
    bool _2020 = uint(_1974) >= 2u;
    int _2022 = ~_1908;
    int _2024 = _2022 + _1968;
    int _2026 = _2024 + 1;
    int _2028 = _2020 ? 0 : 1;
    bool _2030 = _1974 != 3;
    float _2032 = 1.0 / _2008;
    int _2034 = int(_1882) + int(_2000);
    int _2036 = _659 * _2026;
    int _2038 = _2036 + _1256;
    int _2040 = ~_2028;
    int _2042 = _2040 + 1;
    int _2044 = _2042 + 1;
    int _2046 = _1994 * _2034;
    int _2048 = _2046 + _1484;
    bool _2050 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2052 = isnan(_623);
    bool _2054 = _2050 || _2052;
    bool _2056 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2058 = _2054 || _2056;
    float _2060 = float(_2058);
    float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2064 = _2062 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2066 = _2044;
    if (_2030)
    {
        int _2068 = ~_2028;
        int _2070 = _2068 + 1;
        _2066 = _2070;
    }
    int _2072 = _2066;
    bool _2074 = uint(_2048) >= uint(_721);
    float _2076 = -_2060;
    float _2078 = _2076 + 1.0;
    float _2080 = 1.0 / _2064;
    bool _2082 = !_2074;
    int _2084 = _2082 ? 0 : (-1);
    bool _2086 = _804 > 0.5;
    float _2088 = -_221;
    int _2090 = _2086 ? as_type<int>(_2088) : as_type<int>(_221);
    int _2092 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2094 = _2092 != 0;
    float _2096 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2098 = _2096 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2100 = !_2094;
    float _2102 = _2100 ? _221 : as_type<float>(_2090);
    float _2104 = 1.0 / _2098;
    bool _2106 = _814 != 1;
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2108;
    float _2112 = in.m_58.x;
    float _2114 = in.m_58.y;
    float _2116 = in.m_58.z;
    int _2118 = ~_2034;
    int _2120 = _2118 + _2084;
    int _2122 = _2120 + 1;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2126 = abs(_1706);
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2130 = abs(_2016);
    float _2132 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2124);
    float _2134 = 0.0;
    float _2136 = _2098;
    if (!_2106)
    {
        _2134 = _812;
    }
    float _2138 = _2134;
    float _2140 = _816 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2142 = 0.0;
    float _2144 = _2138;
    if (!_2106)
    {
        _2142 = _812;
    }
    float _2146 = _2142;
    float _2148 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2132);
    float _2150 = 0.0;
    float _2152 = _2146;
    if (!_2106)
    {
        _2150 = _834;
    }
    float _2154 = _2150;
    int _2156 = _721 * _2122;
    int _2158 = _2156 + _1484;
    float _2160 = _2154;
    if (!_2106)
    {
        _2136 = _834;
    }
    float _2162 = _2136;
    float _2164 = _2162;
    if (_2106)
    {
        _2144 = _804;
    }
    float _2166 = _2144;
    if (_2106)
    {
        _2152 = _804;
    }
    float _2168 = _2152;
    if (_2106)
    {
        _2160 = _812;
    }
    float _2170 = _2160;
    float _2172 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_2106)
    {
        _2164 = _812;
    }
    float _2174 = _2164;
    float _2176 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _2178 = _818 != 2;
    float _2180 = _2114 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2182 = _812 * 2.0;
    float _2184 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2172);
    float _2186 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2176);
    float _2188 = fma(_2112, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2180);
    float _2190 = floor(_2182);
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2196 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2184);
    float _2198 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2186);
    float _2200 = fma(_2116, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2188);
    bool _2202 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2204 = isnan(_623);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    float _2214 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2216 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2214;
    float _2218 = 0.0;
    if (_2178)
    {
        _2218 = _804;
    }
    float _2220 = _2218;
    float _2222 = 1.0 / _2194;
    float _2224 = 0.0;
    float _2226 = _2220;
    if (_2178)
    {
        _2224 = _812;
    }
    float _2228 = _2224;
    float _2230 = _2216 * _2104;
    float _2232 = _2228;
    if (!_2178)
    {
        _2226 = _834;
    }
    float _2234 = _2226;
    float _2236 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2236;
    if (!_2178)
    {
        _2232 = _804;
    }
    float _2240 = _2232;
    float _2242 = -_2212;
    float _2244 = _2242 + 1.0;
    bool _2246 = _1264 >= 0.0;
    bool _2248 = isnan(_1264);
    bool _2250 = _2246 || _2248;
    bool _2252 = isnan(0.0);
    bool _2254 = _2250 || _2252;
    float _2256 = _2238 * _2018;
    float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2260 = _2258 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _2262 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2264 = isnan(_623);
    bool _2266 = _2262 || _2264;
    bool _2268 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2270 = _2266 || _2268;
    float _2272 = float(_2270);
    float _2274 = _2240 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2276 = _2254 ? 0 : 1;
    float _2278 = _2260 * _2032;
    bool _2280 = _1264 > 0.0;
    float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2284 = _2282 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2286 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2288 = _2286 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2290 = _834 * 2.0;
    float _2292 = _2284 * _2080;
    int _2294 = ~_2276;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    float _2300 = 1.0 / _2288;
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2304 = _2302 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2306 = -_2272;
    float _2308 = _2306 + 1.0;
    float _2310 = _2170 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2312 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2314 = abs(_1858);
    float _2316 = _2060 * _2308;
    int _2318 = _2298;
    float _2320 = _2312;
    if (!_2280)
    {
        int _2322 = ~_2276;
        int _2324 = _2322 + 1;
        _2318 = _2324;
    }
    int _2326 = _2318;
    float _2328 = floor(_2290);
    bool _2330 = _2190 >= 0.0;
    bool _2332 = isnan(_2190);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan(0.0);
    bool _2338 = _2334 || _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2340;
    bool _2344 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2346 = isnan(_623);
    bool _2348 = _2344 || _2346;
    bool _2350 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2352 = _2348 || _2350;
    float _2354 = float(_2352);
    float _2356 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2358 = _2356 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    int _2360 = _2338 ? 0 : 1;
    float _2362 = _2342 * _2222;
    bool _2364 = _2190 > 0.0;
    float _2366 = -_2354;
    float _2368 = _2366 + 1.0;
    float _2370 = 1.0 / _2304;
    bool _2372 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2374 = isnan(_623);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2380 = _2376 || _2378;
    float _2382 = float(_2380);
    float _2384 = _2358 * _2300;
    int _2386 = ~_2360;
    int _2388 = _2386 + 1;
    int _2390 = _2388 + 1;
    float _2392 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2394 = _623 + _2392;
    int _2396 = ~_1834;
    int _2398 = _2396 + _1894;
    int _2400 = _2398 + 1;
    float _2402 = _2382 * _2078;
    float _2404 = -_2382;
    float _2406 = _2404 + 1.0;
    bool _2408 = !_1420;
    int _2410 = _2408 ? _2158 : (-1);
    int _2412 = _641 * _2400;
    int _2414 = _2412 + _1132;
    int _2416 = _2390;
    if (!_2364)
    {
        int _2418 = ~_2360;
        int _2420 = _2418 + 1;
        _2416 = _2420;
    }
    int _2422 = _2416;
    float _2424 = _2354 * _2406;
    bool _2426 = !_1180;
    int _2428 = _2426 ? _2038 : (-1);
    bool _2430 = !_1642;
    int _2432 = _2430 ? 0 : 1;
    float _2434 = _2110 * _2370;
    int _2436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2438 = _2436 != 0;
    int _2440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2442 = _2440 != 0;
    int _2444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2446 = _2444 != 0;
    bool _2448 = _2328 >= 0.0;
    bool _2450 = isnan(_2328);
    bool _2452 = _2448 || _2450;
    bool _2454 = isnan(0.0);
    bool _2456 = _2452 || _2454;
    bool _2458 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2460 = isnan(_623);
    bool _2462 = _2458 || _2460;
    bool _2464 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2466 = _2462 || _2464;
    float _2468 = float(_2466);
    bool _2470 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2472 = isnan(_623);
    bool _2474 = _2470 || _2472;
    bool _2476 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2478 = _2474 || _2476;
    float _2480 = float(_2478);
    int _2482 = _2456 ? 0 : 1;
    float _2484 = -_2468;
    float _2486 = _2484 + 1.0;
    bool _2488 = _2328 > 0.0;
    float _2490 = _2468 * _2368;
    float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2494 = _623 + _2492;
    float _2496 = -_2480;
    float _2498 = _2496 + 1.0;
    float _2500 = _2480 * _2486;
    float _2502 = fma(_2292, _2394, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2504 = fma(_2230, _2494, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2506 = _2212 * _2498;
    float _2508 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2510 = _623 + _2508;
    bool _2512 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2514 = isnan(_623);
    bool _2516 = _2512 || _2514;
    bool _2518 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2520 = _2516 || _2518;
    float _2522 = float(_2520);
    float _2524 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2526 = _623 + _2524;
    float _2528 = fma(_2278, _2510, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2532 = _623 + _2530;
    float _2534 = _2522 * _2244;
    float _2536 = fma(_2256, _2526, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2538 = fma(_2362, _858, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2540 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2542 = _623 + _2540;
    float _2544 = fma(_2434, _2532, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2546 = _2504 * _2534;
    float _2548 = -_2522;
    float _2550 = _2548 + 1.0;
    float _2552 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _2554 = ~_2482;
    int _2556 = _2554 + 1;
    int _2558 = _2556 + 1;
    float _2560 = fma(_2550, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2546);
    int _2562 = _2558;
    if (!_2488)
    {
        int _2564 = ~_2482;
        int _2566 = _2564 + 1;
        _2562 = _2566;
    }
    int _2568 = _2562;
    float _2570 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2572 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2552);
    float _2574 = fma(_2384, _2542, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2576 = fma(_2502, _2506, _2560);
    float _2578 = _812 + _804;
    float _2580 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2570);
    float _2582 = _812 + _834;
    float _2584 = _812 + (-0.5);
    float _2586 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2588 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2590 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2592 = fma(_2536, _2500, _2576);
    float _2594 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2596 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2586);
    float _2598 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2588);
    float _2600 = _804 + _834;
    float _2602 = _804 + (-0.5);
    float _2604 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2590);
    float _2606 = _820 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2608 = fma(_2140, -2.0, _2594);
    float _2610 = _2198 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2612 = _2196 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2614 = -_2128;
    float _2616 = fma(_2606, 2.0, _2614);
    float _2618 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2620 = fma(_2528, _2490, _2592);
    float _2622 = _2200 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2624 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2626 = _2610 + _2624;
    int _2628 = _1794 >> 31;
    float _2630 = -_2618;
    float _2632 = fma(_882, 2.0, _2630);
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2636 = _2612 + _2634;
    float _2638 = _2626 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2640 = _2628 & 3;
    float _2642 = fma(_2538, _2424, _2620);
    float _2644 = fma(_2636, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2638);
    int _2646 = _1794 + _2640;
    float _2648 = _2578 + (-1.0);
    float _2650 = fma(_2574, _2402, _2642);
    int _2652 = _2646 >> 2;
    float _2654 = fma(_2648, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2656 = !_1814;
    int _2658 = _2656 ? 0 : 1;
    float _2660 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2662 = _2622 + _2660;
    int _2664 = _2652 << 4;
    int _2666 = _2664 + 656;
    float _2668 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2670 = _1812 != 3;
    float _2672 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2644);
    uint _2674 = uint(int(uint(_2666) >> uint(2)));
    uint _2676 = uint(int(uint(int(_2674)) >> uint(2)));
    int _2678 = int(_2674) & 3;
    float _2680 = (*spvDescriptorSet0.vp_c9)._m0[int(_2676)][_2678];
    int _2682 = int(_2674) + 1;
    uint _2684 = uint(int(uint(_2682) >> uint(2)));
    int _2686 = _2682 & 3;
    float _2688 = (*spvDescriptorSet0.vp_c9)._m0[int(_2684)][_2686];
    float _2690 = fma(_862, -2.0, _2668);
    float _2692 = -_131;
    float _2694 = fma(_2692, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2616);
    bool _2696 = !_2670;
    int _2698 = _2696 ? 0 : (-1);
    float _2700 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2702 = _2672 >= 0.0;
    float _2704 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2706 = _1630 + 0.5;
    float _2708 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2700);
    float _2710 = -_131;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2632);
    float _2714 = fma(_2174, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2704);
    float _2716 = fma(_2706, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2694);
    int _2718 = _2666 + 8;
    uint _2720 = uint(int(uint(_2718) >> uint(2)));
    uint _2722 = uint(int(uint(int(_2720)) >> uint(2)));
    int _2724 = int(_2720) & 3;
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[int(_2722)][_2724];
    int _2728 = int(_2720) + 1;
    uint _2730 = uint(int(uint(_2728) >> uint(2)));
    int _2732 = _2728 & 3;
    float _2734 = (*spvDescriptorSet0.vp_c9)._m0[int(_2730)][_2732];
    float _2736 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2690);
    float _2738 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2608);
    float _2740 = _1818 + (-0.5);
    float _2742 = _2102 + 0.5;
    float _2744 = -_2740;
    float _2746 = -_2736;
    float _2748 = fma(_2744, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2746);
    float _2750 = fma(_2742, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2712);
    float _2752 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2754 = _2234 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2756 = fma(_2544, _2316, _2650);
    float _2758 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2760 = fma(_2310, -2.0, _2752);
    int _2762 = abs(_2658);
    float _2764 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2766 = fma(_2274, -2.0, _2758);
    int _2768 = abs(_1876);
    int _2770 = abs(_1942);
    float _2772 = -_2764;
    float _2774 = fma(_2312, 2.0, _2772);
    int _2776 = ~_2768;
    int _2778 = _2776 + 1;
    int _2780 = _2778 + 1;
    float _2782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2784 = ~_2762;
    int _2786 = _2784 + 1;
    int _2788 = _2786 + 1;
    float _2790 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2604);
    if (_2702)
    {
        _2320 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2792 = _2320;
    float _2794 = -_1820;
    float _2796 = -_2738;
    float _2798 = fma(_2794, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2796);
    float _2800 = -_2790;
    float _2802 = _2800 + 1.0;
    int _2804 = abs(_2698);
    if (_2702)
    {
        float _2806 = _2792 * 5.0;
        _1936 = as_type<int>(_2806);
    }
    int _2808 = _1936;
    float _2810 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2760);
    float _2812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2814 = _2780 * as_type<int>(_2688);
    int _2816 = ~_2770;
    int _2818 = _2816 + 1;
    int _2820 = _2818 + 1;
    if (_2702)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9518 = as_type<float>(_2808);
        out.gl_Position.z = _9518;
    }
    bool _2822 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2824 = isnan(0.0);
    bool _2826 = _2822 || _2824;
    bool _2828 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2830 = _2826 || _2828;
    int _2832 = _2788 * as_type<int>(_2680);
    int _2834 = _2832 + _2814;
    int _2836 = abs(_1954);
    float _2838 = _2782 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2840 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2842 = int(_2840);
    float _2844 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2756);
    float _2846 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2596);
    float _2848 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2580);
    float _2850 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2598);
    int _2852 = _2820 * as_type<int>(_2726);
    int _2854 = _2852 + _2834;
    float _2856 = _1122 * _131;
    int _2858 = ~_2804;
    int _2860 = _2858 + 1;
    int _2862 = _2860 + 1;
    float _2864 = -_2148;
    float _2866 = _2864 + 1.0;
    int _2868 = ~_2836;
    int _2870 = _2868 + 1;
    int _2872 = _2870 + 1;
    float _2874 = _2812 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2876 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2878 = exp2(_2856);
    float _2880 = float(uint(_2842));
    int _2882 = _2862 * as_type<int>(_2734);
    int _2884 = _2882 + _2854;
    float _2886 = _1584 + 0.5;
    float _2888 = -_2876;
    float _2890 = fma(_2754, 2.0, _2888);
    float _2892 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2572);
    int _2894 = _2884 * _2872;
    float _2896 = -_2802;
    float _2898 = fma(_2896, _1630, _2716);
    float _2900 = 1.0 / _2880;
    float _2902 = _1338 + (-0.5);
    float _2904 = fma(_2866, _1810, _2798);
    float _2906 = -_131;
    float _2908 = fma(_2906, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2774);
    float _2910 = -_2874;
    float _2912 = -_2810;
    float _2914 = fma(_2910, _2902, _2912);
    int _2916 = _2428 * _2836;
    int _2918 = _2916 + _2894;
    out.m_80.x = _2898;
    out.m_80.y = _2904;
    float _2920 = fma(_2838, _2886, _2908);
    float _2922 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2924 = 1.0 + _2922;
    float _2926 = -_2878;
    float _2928 = _2926 + 1.0;
    float _2930 = float(uint(_2918));
    float _2932 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2708);
    float _2934 = 1.0 / _2924;
    float _2936 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2714);
    float _2938 = _2830 ? _2928 : 0.0;
    float _2940 = -_131;
    float _2942 = fma(_2940, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2890);
    int _2944 = as_type<int>(_2900) + (-2);
    float _2946 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2766);
    bool _2948 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2950 = isnan(1.0);
    bool _2952 = _2948 || _2950;
    bool _2954 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2956 = _2952 || _2954;
    out.m_82.x = _2844;
    int _2958 = abs(_2842);
    float _2960 = as_type<float>(_2944) * _2930;
    int _2962 = _1960 >> 31;
    float _2964 = -_2936;
    float _2966 = _2964 + 1.0;
    float _2968 = trunc(_2960);
    float _2970 = precise::max(_2968, 0.0);
    uint _2972 = uint(_2970);
    int _2974 = _1608 >> 31;
    float _2976 = _2626 * _2626;
    float _2978 = float(uint(_2958));
    float _2980 = fma(_1338, _2966, _2914);
    int _2982 = ~_2842;
    int _2984 = _2982 + 1;
    if (_2956)
    {
        float _2986 = _2938 * _2934;
        _141 = _2986;
    }
    float _2988 = _141;
    int _2990 = _2962 & 3;
    float _2992 = -_2850;
    float _2994 = _2992 + 1.0;
    float _2996 = 1.0 / _2978;
    int _2998 = _2974 & 3;
    float _3000 = fma(_2636, _2636, _2976);
    int _3002 = _1960 + _2990;
    float _3004 = -_2846;
    float _3006 = _3004 + 1.0;
    int _3008 = _1608 + _2998;
    float _3010 = fma(_2662, _2662, _3000);
    int _3012 = _2984 * int(_2972);
    int _3014 = _3012 + _2918;
    int _3016 = _3002 >> 2;
    float _3018 = -_3006;
    float _3020 = fma(_2102, _3018, _2750);
    float _3022 = rsqrt(_3010);
    int _3024 = _3008 >> 2;
    float _3026 = _884 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3028 = float(uint(_3014));
    float _3030 = -_2932;
    float _3032 = _3030 + 1.0;
    int _3034 = _3016 << 4;
    int _3036 = _3034 + 800;
    if (_2702)
    {
        out.m_65.x = 0.0;
    }
    int _3038 = abs(_2918);
    float _3040 = as_type<float>(_2944) * _3028;
    int _3042 = _3024 << 4;
    int _3044 = _3042 + 368;
    uint _3046 = uint(int(uint(_3036) >> uint(2)));
    uint _3048 = uint(int(uint(int(_3046)) >> uint(2)));
    int _3050 = int(_3046) & 3;
    float _3052 = (*spvDescriptorSet0.vp_c9)._m0[int(_3048)][_3050];
    int _3054 = int(_3046) + 1;
    uint _3056 = uint(int(uint(_3054) >> uint(2)));
    int _3058 = _3054 & 3;
    float _3060 = (*spvDescriptorSet0.vp_c9)._m0[int(_3056)][_3058];
    int _3062 = as_type<int>(_2996) + (-2);
    float _3064 = -_2848;
    float _3066 = _3064 + 1.0;
    float _3068 = float(uint(_3038));
    float _3070 = -_3032;
    float _3072 = fma(_1584, _3070, _2920);
    bool _3074 = !_2438;
    int _3076 = _3074 ? 0 : 1;
    float _3078 = _3026 * _3022;
    float _3080 = fma(_1818, _3066, _2748);
    uint _3082 = uint(int(uint(_3044) >> uint(2)));
    uint _3084 = uint(int(uint(int(_3082)) >> uint(2)));
    int _3086 = int(_3082) & 3;
    float _3088 = (*spvDescriptorSet0.vp_c9)._m0[int(_3084)][_3086];
    int _3090 = int(_3082) + 1;
    uint _3092 = uint(int(uint(_3090) >> uint(2)));
    int _3094 = _3090 & 3;
    float _3096 = (*spvDescriptorSet0.vp_c9)._m0[int(_3092)][_3094];
    float _3098 = as_type<float>(_3062) * _3068;
    float _3100 = _2626 * _3078;
    float _3102 = _2636 * _3078;
    int _3104 = ~_2958;
    int _3106 = _3104 + 1;
    out.m_84.x = _3020;
    out.m_84.y = _3080;
    out.m_84.z = _3072;
    out.m_84.w = _2980;
    float _3108 = -_3100;
    float _3110 = _2626 + _3108;
    float _3112 = trunc(_3098);
    float _3114 = precise::max(_3112, 0.0);
    uint _3116 = uint(_3114);
    int _3118 = abs(_3076);
    float _3120 = -_3102;
    float _3122 = _2636 + _3120;
    float _3124 = _3110 * _3110;
    float _3126 = _2662 * _3078;
    float _3128 = float(_2568);
    float _3130 = fma(_3122, _3122, _3124);
    float _3132 = float(_3118);
    float _3134 = trunc(_3040);
    float _3136 = precise::max(_3134, 0.0);
    uint _3138 = uint(_3136);
    int _3140 = ~_2842;
    int _3142 = _3140 + 1;
    float _3144 = -_3126;
    float _3146 = _2662 + _3144;
    int _3148 = _3036 + 8;
    uint _3150 = uint(int(uint(_3148) >> uint(2)));
    uint _3152 = uint(int(uint(int(_3150)) >> uint(2)));
    int _3154 = int(_3150) & 3;
    float _3156 = (*spvDescriptorSet0.vp_c9)._m0[int(_3152)][_3154];
    int _3158 = int(_3150) + 1;
    uint _3160 = uint(int(uint(_3158) >> uint(2)));
    int _3162 = _3158 & 3;
    float _3164 = (*spvDescriptorSet0.vp_c9)._m0[int(_3160)][_3162];
    float _3166 = _3132 * _3128;
    int _3168 = _3106 * int(_3116);
    int _3170 = _3168 + _3038;
    bool _3172 = !_1976;
    int _3174 = _3172 ? 0 : 1;
    int _3176 = _3044 + 8;
    uint _3178 = uint(int(uint(_3176) >> uint(2)));
    uint _3180 = uint(int(uint(int(_3178)) >> uint(2)));
    int _3182 = int(_3178) & 3;
    float _3184 = (*spvDescriptorSet0.vp_c9)._m0[int(_3180)][_3182];
    int _3186 = int(_3178) + 1;
    uint _3188 = uint(int(uint(_3186) >> uint(2)));
    int _3190 = _3186 & 3;
    float _3192 = (*spvDescriptorSet0.vp_c9)._m0[int(_3188)][_3190];
    float _3194 = float(uint(_3170));
    int _3196 = ~_2130;
    int _3198 = _3196 + 1;
    int _3200 = _3198 + 1;
    int _3202 = int(_2972) + int(_3138);
    float _3204 = as_type<float>(_3062) * _3194;
    int _3206 = abs(_2432);
    int _3208 = ~_2126;
    int _3210 = _3208 + 1;
    int _3212 = _3210 + 1;
    float _3214 = trunc(_3204);
    float _3216 = precise::max(_3214, 0.0);
    uint _3218 = uint(_3216);
    bool _3220 = _1640 != 3;
    int _3222 = _3142 * _3202;
    int _3224 = _3222 + _2918;
    int _3226 = ~_2958;
    int _3228 = _3226 + 1;
    int _3230 = _3200 * as_type<int>(_3060);
    int _3232 = abs(_3174);
    int _3234 = ~_3232;
    int _3236 = _3234 + 1;
    int _3238 = _3236 + 1;
    int _3240 = _3212 * as_type<int>(_3096);
    bool _3242 = !_3220;
    int _3244 = _3242 ? 0 : (-1);
    int _3246 = ~_3206;
    int _3248 = _3246 + 1;
    int _3250 = _3248 + 1;
    int _3252 = _3238 * as_type<int>(_3052);
    int _3254 = _3252 + _3230;
    bool _3256 = uint(_3224) >= uint(_2842);
    int _3258 = int(_3116) + int(_3218);
    int _3260 = _3250 * as_type<int>(_3088);
    int _3262 = _3260 + _3240;
    bool _3264 = !_3256;
    int _3266 = _3264 ? 0 : (-1);
    int _3268 = abs(_2072);
    int _3270 = _3228 * _3258;
    int _3272 = _3270 + _3038;
    bool _3274 = _1974 != 3;
    float _3276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3278 = ~_3202;
    int _3280 = _3278 + _3266;
    int _3282 = _3280 + 1;
    int _3284 = ~_3268;
    int _3286 = _3284 + 1;
    int _3288 = _3286 + 1;
    bool _3290 = !_3274;
    int _3292 = _3290 ? 0 : (-1);
    int _3294 = _2842 * _3282;
    int _3296 = _3294 + _2918;
    bool _3298 = uint(_3272) >= uint(_2958);
    int _3300 = _3288 * as_type<int>(_3156);
    int _3302 = _3300 + _3254;
    int _3304 = _2918 ^ _2842;
    float _3306 = _1004 + 0.5;
    int _3308 = abs(_3292);
    int _3310 = abs(_1784);
    float _3312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3314 = !_3298;
    int _3316 = _3314 ? 0 : (-1);
    uint _3318 = uint(int(uint(_3304) >> uint(31)));
    int _3320 = abs(_3244);
    int _3322 = ~_3310;
    int _3324 = _3322 + 1;
    int _3326 = _3324 + 1;
    int _3328 = ~_3316;
    int _3330 = _3258 + _3328;
    int _3332 = _3330 + 1;
    int _3334 = ~int(_3318);
    int _3336 = _3334 + 1;
    int _3338 = _3326 * as_type<int>(_3184);
    int _3340 = _3338 + _3262;
    int _3342 = ~_3320;
    int _3344 = _3342 + 1;
    int _3346 = _3344 + 1;
    bool _3348 = _2842 == 0;
    int _3350 = ~_3308;
    int _3352 = _3350 + 1;
    int _3354 = _3352 + 1;
    int _3356 = _3346 * as_type<int>(_3192);
    int _3358 = _3356 + _3340;
    int _3360 = _3332 ^ _3336;
    int _3362 = ~_2314;
    int _3364 = _3362 + 1;
    int _3366 = _3364 + 1;
    int _3368 = _3354 * as_type<int>(_3164);
    int _3370 = _3368 + _3302;
    bool _3372 = !_3348;
    int _3374 = _3372 ? _3296 : (-1);
    float _3376 = in.m_86.x;
    float _3378 = in.m_86.y;
    float _3380 = in.m_86.z;
    int _3382 = abs(_1964);
    float _3384 = _3312 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3386 = _2842 == 0;
    int _3388 = _3358 * _3366;
    int _3390 = ~_3336;
    int _3392 = _3390 + _3360;
    int _3394 = _3392 + 1;
    int _3396 = ~_3382;
    int _3398 = _3396 + 1;
    int _3400 = _3398 + 1;
    bool _3402 = !_3386;
    int _3404 = _3402 ? _3394 : (-1);
    bool _3406 = _641 == 0;
    int _3408 = _3370 * _3400;
    float _3410 = float(_3374);
    float _3412 = _3276 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3414 = float(_3404);
    int _3416 = _2410 * _3382;
    int _3418 = _3416 + _3408;
    bool _3420 = !_3406;
    int _3422 = _3420 ? _2414 : (-1);
    float _3424 = fma(_3384, _3410, _2942);
    float _3426 = _3166 * (-2.0);
    float _3428 = -_2946;
    float _3430 = fma(_3412, _3414, _3428);
    float _3432 = _966 + (-0.5);
    int _3434 = _3422 * _2314;
    int _3436 = _3434 + _3388;
    float _3438 = fma(_3384, _3306, _3424);
    float _3440 = -_2892;
    float _3442 = _3440 + 1.0;
    float _3444 = -_3412;
    float _3446 = fma(_3444, _3432, _3430);
    float _3448 = fma(_2654, _3426, _2654);
    float _3450 = float(_3436);
    float _3452 = -_2994;
    float _3454 = fma(_1004, _3452, _3438);
    float _3456 = float(_3418);
    float _3458 = fma(_966, _3442, _3446);
    float _3460 = fma(_3426, _3376, _3376);
    bool _3462 = !_2442;
    int _3464 = _3462 ? 0 : 1;
    out.m_88.x = _3450;
    bool _3466 = !_2446;
    int _3468 = _3466 ? 0 : 1;
    int _3470 = abs(_3464);
    out.m_88.w = _3456;
    out.m_90.x = _3454;
    out.m_90.y = _3458;
    float _3472 = _3380;
    if (_2702)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3474 = -_3100;
    float _3476 = _2610 + _3474;
    float _3478 = -_3102;
    float _3480 = _2612 + _3478;
    float _3482 = fma(_2602, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3460);
    float _3484 = float(_2326);
    float _3486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3488 = _3476 + _3486;
    float _3490 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3492 = _3480 + _3490;
    float _3494 = float(_3470);
    float _3496 = _2582 + (-1.0);
    float _3498 = _3488 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3500 = _2600 + (-1.0);
    float _3502 = _3494 * _3484;
    float _3504 = fma(_3492, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3498);
    float _3506 = -_3126;
    float _3508 = _2622 + _3506;
    int _3510 = abs(_3468);
    float _3512 = fma(_3496, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3514 = float(_2422);
    float _3516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3518 = _3508 + _3516;
    float _3520 = float(_3510);
    float _3522 = _834 + (-0.5);
    float _3524 = fma(_3448, _2988, _3482);
    float _3526 = fma(_3518, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3504);
    float _3528 = _3502 * (-2.0);
    float _3530 = _3520 * _3514;
    float _3532 = fma(_3146, _3146, _3130);
    float _3534 = _3524 * 0.15915493667125701904296875;
    float _3536 = fma(_3528, _3378, _3378);
    float _3538 = fma(_3512, _3528, _3512);
    float _3540 = _3530 * (-2.0);
    bool _3542 = _3526 >= 0.0;
    float _3544 = fma(_2584, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3536);
    float _3546 = sqrt(_3532);
    float _3548 = fma(_3500, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3550 = fma(_3540, _3380, _3380);
    float _3552 = fma(_3538, _2988, _3544);
    float _3554 = fma(_3548, _3540, _3548);
    float _3556 = fma(_3522, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3550);
    float _3558 = _3552 * 0.15915493667125701904296875;
    float _3560 = _3534 * 6.283185482025146484375;
    float _3562 = sin(_3560);
    float _3564 = fma(_3554, _2988, _3556);
    int _3566 = as_type<int>(_3538);
    if (_3542)
    {
        _3472 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3568 = _3472;
    int _3570 = as_type<int>(_3568);
    if (_3542)
    {
        out.m_65.x = 0.0;
    }
    float _3572 = _3564 * 0.15915493667125701904296875;
    float _3574 = _3534 * 6.283185482025146484375;
    float _3576 = cos(_3574);
    if (_3542)
    {
        float _3578 = _3568 * 5.0;
        _3570 = as_type<int>(_3578);
    }
    int _3580 = _3570;
    if (_3542)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10631 = as_type<float>(_3580);
        out.gl_Position.z = _10631;
    }
    float _3582 = _3558 * 6.283185482025146484375;
    float _3584 = sin(_3582);
    float _3586 = _3558 * 6.283185482025146484375;
    float _3588 = cos(_3586);
    if (_3542)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3590 = _3572 * 6.283185482025146484375;
    float _3592 = cos(_3590);
    float _3594 = _3022 * _3546;
    float _3596 = _453 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _3600 = _3576 * _3588;
    float _3602 = _884 * _3594;
    float _3604 = _3594 * _3596;
    float _3606 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _3608 = _3572 * 6.283185482025146484375;
    float _3610 = sin(_3608);
    float _3612 = _3576 * _3584;
    float _3614 = _3598 * _3604;
    float _3616 = _3562 * _3584;
    float _3618 = _3562 * _3588;
    float _3620 = _3606 * _3602;
    float _3622 = _3594 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3624 = _3622 * 0.5;
    float _3626 = _3576 * _3592;
    float _3628 = _3588 * _3592;
    float _3630 = _3562 * _3592;
    float _3632 = _3584 * _3592;
    float _3634 = _3626 * _3614;
    float _3636 = fma(_3610, _3600, _3616);
    float _3638 = -_3618;
    float _3640 = fma(_3610, _3612, _3638);
    float _3642 = -_3614;
    float _3644 = _3610 * _3642;
    float _3646 = -_3612;
    float _3648 = fma(_3610, _3618, _3646);
    float _3650 = fma(_3636, _3620, _3634);
    float _3652 = _3630 * _3614;
    float _3654 = fma(_3628, _3620, _3644);
    float _3656 = fma(_3610, _3616, _3600);
    float _3658 = fma(_3640, _3624, _3650);
    float _3660 = fma(_3648, _3620, _3652);
    float _3662 = fma(_3632, _3624, _3654);
    float _3664 = _3636 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3666 = _3658 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3668 = _3658 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3670 = fma(_3656, _3624, _3660);
    float _3672 = _3658 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3674 = fma(_3662, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3666);
    float _3676 = fma(_3662, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3668);
    float _3678 = _3626 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3680 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3664);
    float _3682 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3674);
    float _3684 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3676);
    float _3686 = _3682 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3688 = _3684 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3690 = _3636 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3692 = _2612 + _3686;
    float _3694 = _2622 + _3688;
    float _3696 = _3636 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3698 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3700 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3702 = _3692 + _3700;
    float _3704 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3706 = _3694 + _3704;
    float _3708 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3696);
    float _3710 = fma(_3662, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3672);
    float _3712 = _3702 * _3702;
    float _3714 = _3706 * _3706;
    float _3716 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3690);
    float _3718 = _3626 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3720 = fma(_3670, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3710);
    float _3722 = _3712 + _3714;
    float _3724 = _3626 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3726 = -_3610;
    float _3728 = fma(_3726, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3718);
    float _3730 = _3720 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3732 = sqrt(_3722);
    float _3734 = -_3610;
    float _3736 = fma(_3734, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3724);
    float _3738 = _3640 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3740 = _3640 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3742 = fma(_3698, _3698, 1.0);
    float _3744 = _3640 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3746 = _2610 + _3730;
    float _3748 = -_3610;
    float _3750 = fma(_3748, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3678);
    float _3752 = rsqrt(_3742);
    float _3754 = fma(_3632, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3738);
    float _3756 = fma(_3632, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3740);
    float _3758 = fma(_3632, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3744);
    bool _3760 = _3732 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3762 = _3744;
    float _3764 = _3632;
    float _3766 = _3738;
    float _3768 = _3742;
    float _3770 = _3730;
    float _3772 = _3702;
    if (!_3760)
    {
        _3762 = _3714;
    }
    float _3774 = _3762;
    float _3776 = _3774;
    if (!_3760)
    {
        _3764 = _3712;
    }
    float _3778 = _3764;
    float _3780 = _3778;
    if (!_3760)
    {
        _3766 = _3692;
    }
    float _3782 = _3766;
    float _3784 = _3782;
    if (!_3760)
    {
        _3768 = _3694;
    }
    float _3786 = _3768;
    float _3788 = _3786;
    if (!_3760)
    {
        _3770 = _3746;
    }
    float _3790 = _3770;
    bool _3792 = !_3760;
    float _3794 = _3790;
    if (!_3792)
    {
        float _3796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3798 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3800 = _3732 + _3798;
        float _3802 = _3746 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3804 = rsqrt(_3722);
        float _3806 = _3800 * _3796;
        float _3808 = _3806 * 0.15915493667125701904296875;
        float _3810 = _3808 * 6.283185482025146484375;
        float _3812 = sin(_3810);
        float _3814 = _3808 * 6.283185482025146484375;
        float _3816 = cos(_3814);
        float _3818 = fma(_3812, _3802, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3820 = _3804 * _3818;
        float _3822 = _3816 + (-1.0);
        float _3824 = fma(_3702, _3820, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3826 = fma(_3706, _3820, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3828 = _3822 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3830 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3832 = _3824 + _3830;
        float _3834 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3836 = _3826 + _3834;
        float _3838 = fma(_3746, _3816, _3828);
        float _3840 = _3832 * _3832;
        float _3842 = _3836 * _3836;
        _3794 = _3838;
        _3780 = _3840;
        _3776 = _3842;
        _3784 = _3824;
        _3788 = _3826;
    }
    float _3844 = _3794;
    float _3846 = _3780;
    float _3848 = _3776;
    float _3850 = _3784;
    float _3852 = _3788;
    float _3854 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3856 = _3844 + _3854;
    float _3858 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3728);
    float _3860 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3750);
    float _3862 = fma(_3630, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3736);
    float _3864 = fma(_3856, _3856, _3846);
    float _3866 = fma(_3656, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3754);
    float _3868 = fma(_3656, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3756);
    float _3870 = fma(_3656, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3758);
    float _3872 = _3864 + _3848;
    float _3874 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3716);
    float _3876 = _3698 * _3752;
    float _3878 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3708);
    float _3880 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3882 = _3698 * _3858;
    float _3884 = _3698 * _3860;
    float _3886 = fma(_3648, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3680);
    float _3888 = _3698 * _3862;
    float _3890 = -_3866;
    float _3892 = _3876 * _3890;
    float _3894 = -_3868;
    float _3896 = _3876 * _3894;
    float _3898 = -_3870;
    float _3900 = _3876 * _3898;
    float _3902 = sqrt(_3872);
    float _3904 = fma(_3880, _3874, _3882);
    float _3906 = fma(_3880, _3878, _3884);
    float _3908 = fma(_3880, _3886, _3888);
    float _3910 = fma(_3752, _3858, _3892);
    float _3912 = fma(_3752, _3860, _3896);
    float _3914 = _3868 + _3906;
    float _3916 = fma(_3752, _3862, _3900);
    float _3918 = _3866 + _3904;
    float _3920 = _3870 + _3908;
    out.m_92.x = _3874;
    out.m_92.y = _3878;
    out.m_92.z = _3886;
    out.m_94.x = _3910;
    out.m_94.y = _3912;
    out.m_94.z = _3916;
    bool _3922 = _3902 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3924 = isnan(_3902);
    bool _3926 = _3922 || _3924;
    bool _3928 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3930 = _3926 || _3928;
    out.m_96.x = _3918;
    out.m_96.y = _3914;
    out.m_96.z = _3920;
    float _3932 = _3866;
    if (!_3930)
    {
        _3932 = 1.0;
    }
    float _3934 = _3932;
    bool _3936 = !_3930;
    float _3938 = _3934;
    if (!_3936)
    {
        bool _3940 = _3902 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3942 = isnan(_3902);
        bool _3944 = _3940 || _3942;
        bool _3946 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3948 = _3944 || _3946;
        if (!_3948)
        {
            float _3950 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3952 = _3902 + _3950;
            float _3954 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3956 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3954;
            float _3958 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3960 = _3958 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3962 = 1.0 / _3956;
            float _3964 = _3952 * _3962;
            float _3966 = fma(_3964, _3960, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3938 = _3966;
            _3968 = true;
        }
        else
        {
            bool _3970 = _3902 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3972 = isnan(_3902);
            bool _3974 = _3970 || _3972;
            bool _3976 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3978 = _3974 || _3976;
            if (!_3978)
            {
                float _3980 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3982 = _3902 + _3980;
                float _3984 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3986 = _3984 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3988 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3990 = _3988 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3992 = 1.0 / _3986;
                float _3994 = _3982 * _3992;
                float _3996 = fma(_3994, _3990, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3938 = _3996;
                _3968 = true;
            }
            else
            {
                _3938 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3968 = false;
    float _3998 = _3938;
    float _4000 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4002 = _3844 + _4000;
    float _4004 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4006 = _3850 + _4004;
    float _4008 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4010 = _3852 + _4008;
    float _4012 = fma(_4002, _3998, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4014 = fma(_4006, _3998, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4016 = fma(_4010, _3998, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4018 = _3476 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4020 = -_2610;
    float _4022 = _4020 + _4012;
    float _4024 = -_2612;
    float _4026 = _4024 + _4014;
    float _4028 = -_2622;
    float _4030 = _4028 + _4016;
    float _4032 = fma(_3480, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4018);
    float _4034 = _4022 * _4022;
    float _4036 = _3476 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4038 = fma(_3508, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4032);
    float _4040 = fma(_4026, _4026, _4034);
    float _4042 = _4038 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4044 = fma(_4030, _4030, _4040);
    float _4046 = sqrt(_4044);
    bool _4048 = _4046 > 0.0;
    float _4050 = _4046;
    float _4052 = _4006;
    float _4054 = _4038;
    float _4056 = _4030;
    if (!_4048)
    {
        _4050 = _4014;
    }
    float _4058 = _4050;
    float _4060 = _4058;
    if (!_4048)
    {
        _4052 = _4012;
    }
    float _4062 = _4052;
    float _4064 = _4062;
    float _4066 = _4062;
    if (!_4048)
    {
        _4054 = _4016;
    }
    float _4068 = _4054;
    bool _4070 = !_4048;
    float _4072 = _4068;
    if (!_4070)
    {
        float _4074 = _215 * _215;
        float _4076 = fma(_213, _213, _4074);
        float _4078 = fma(_217, _217, _4076);
        float _4080 = rsqrt(_4044);
        float _4082 = sqrt(_4078);
        float _4084 = _4026 * _4080;
        float _4086 = _4022 * _4080;
        float _4088 = _4030 * _4080;
        bool _4090 = _4082 > 0.0;
        float _4092 = _4080;
        float _4094 = _4082;
        _4056 = _4088;
        if (!_4090)
        {
            _4092 = _4014;
        }
        float _4096 = _4092;
        _4060 = _4096;
        if (!_4090)
        {
            _4064 = _4012;
        }
        float _4098 = _4064;
        _4066 = _4098;
        if (!_4090)
        {
            _4094 = _4016;
        }
        float _4100 = _4094;
        bool _4102 = !_4090;
        _4072 = _4100;
        if (!_4102)
        {
            float _4104 = rsqrt(_4078);
            float _4106 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4108 = _215 * _4104;
            float _4110 = _213 * _4104;
            float _4112 = _217 * _4104;
            float _4114 = _4086 * _4108;
            float _4116 = fma(_4084, _4110, _4114);
            float _4118 = _4106 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4120 = fma(_4088, _4112, _4116);
            float _4122 = _4120 * _4118;
            float _4124 = fma(_213, _4122, _4014);
            float _4126 = fma(_215, _4122, _4012);
            float _4128 = fma(_217, _4122, _4016);
            _4066 = _4126;
            _4060 = _4124;
            _4072 = _4128;
        }
    }
    float _4130 = _4066;
    float _4132 = _4060;
    float _4134 = _4072;
    float _4136 = _4056;
    float _4138 = fma(_3480, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4036);
    float _4140 = 1.0 / _4042;
    float _4142 = -_3100;
    float _4144 = _4142 + _4130;
    float _4146 = -_3102;
    float _4148 = _4146 + _4132;
    float _4150 = fma(_3508, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4138);
    float _4152 = -_3126;
    float _4154 = _4152 + _4134;
    float _4156 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4158 = _4144 + _4156;
    float _4160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4162 = _4148 + _4160;
    float _4164 = _4150 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4166 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4168 = _4154 + _4166;
    float _4170 = _4158 * _4158;
    float _4172 = _4164 + _4042;
    float _4174 = fma(_4162, _4162, _4170);
    float _4176 = _4172 * _4140;
    float _4178 = _4176 * 0.5;
    float _4180 = fma(_4168, _4168, _4174);
    float _4182 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4184 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4186 = fma(_4178, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4184);
    float _4188 = rsqrt(_4180);
    float _4190 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _4192 = 1.0 / _4186;
    float _4194 = _4188 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4196 = _3476 + _4190;
    float _4198 = sqrt(_4180);
    float _4200 = _4162 * _4194;
    float _4202 = _4168 * _4194;
    float _4204 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _4206 = _4196 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _4208 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4210 = _4192 * _4208;
    float _4212 = _4200 * _4200;
    float _4214 = _4202 * _4202;
    float _4216 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[126].x, _4204);
    float _4218 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[127].x, _4206);
    bool _4220 = _4210 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _4222 = _4212 + _4214;
    bool _4224 = _4210 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _4226 = fma(_3508, (*spvDescriptorSet0.vp_c15)._m0[126].z, _4216);
    float _4228 = fma(_3508, (*spvDescriptorSet0.vp_c15)._m0[127].z, _4218);
    float _4230 = sqrt(_4222);
    float _4232 = _4226 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _4234 = !_4220;
    int _4236 = _4234 ? 0 : 1;
    float _4238 = _4228 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _4240 = 2;
    float _4242 = _4196;
    if (!_4220)
    {
        _4240 = 1;
    }
    int _4244 = _4240;
    float _4246 = trunc(_4232);
    int _4248 = int(_4246);
    int _4250 = _4244;
    if (!_4224)
    {
        _4250 = _4236;
    }
    int _4252 = _4250;
    float _4254 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    int _4256 = _4252 << 6;
    bool _4258 = _4230 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4260 = trunc(_4238);
    int _4262 = int(_4260);
    int _4264 = _4256 + 96;
    uint _4266 = uint(int(uint(_4264) >> uint(2)));
    uint _4268 = uint(int(uint(int(_4266)) >> uint(2)));
    int _4270 = int(_4266) & 3;
    float _4272 = (*spvDescriptorSet0.vp_c15)._m0[int(_4268)][_4270];
    int _4274 = int(_4266) + 1;
    uint _4276 = uint(int(uint(_4274) >> uint(2)));
    int _4278 = _4274 & 3;
    float _4280 = (*spvDescriptorSet0.vp_c15)._m0[int(_4276)][_4278];
    float _4282 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4284 = _4230 + _4282;
    int _4286 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _4288 = _4248 + _4286;
    int _4290 = _4288 + 1;
    int _4292 = _4256 + 48;
    uint _4294 = uint(int(uint(_4292) >> uint(2)));
    uint _4296 = uint(int(uint(int(_4294)) >> uint(2)));
    int _4298 = int(_4294) & 3;
    float _4300 = (*spvDescriptorSet0.vp_c15)._m0[int(_4296)][_4298];
    int _4302 = int(_4294) + 1;
    uint _4304 = uint(int(uint(_4302) >> uint(2)));
    int _4306 = _4302 & 3;
    float _4308 = (*spvDescriptorSet0.vp_c15)._m0[int(_4304)][_4306];
    float _4310 = floor(_4254);
    bool _4312 = _4290 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _4314 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _4316 = _4262 + _4314;
    int _4318 = _4316 + 1;
    int _4320 = _4256 + 104;
    uint _4322 = uint(int(uint(_4320) >> uint(2)));
    uint _4324 = uint(int(uint(int(_4322)) >> uint(2)));
    int _4326 = int(_4322) & 3;
    float _4328 = (*spvDescriptorSet0.vp_c15)._m0[int(_4324)][_4326];
    int _4330 = int(_4322) + 1;
    uint _4332 = uint(int(uint(_4330) >> uint(2)));
    int _4334 = _4330 & 3;
    float _4336 = (*spvDescriptorSet0.vp_c15)._m0[int(_4332)][_4334];
    int _4338 = as_type<int>(_3694);
    float _4340 = _4284;
    int _4342 = as_type<int>(_4254);
    float _4344 = as_type<float>(_4252);
    if (_4258)
    {
        float _4346 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4338 = as_type<int>(_4346);
    }
    int _4348 = _4338;
    int _4350 = _4290 | _4318;
    bool _4352 = _4350 < 0;
    bool _4354 = _4352 || _4312;
    int _4356 = _4256 + 64;
    uint _4358 = uint(int(uint(_4356) >> uint(2)));
    uint _4360 = uint(int(uint(int(_4358)) >> uint(2)));
    int _4362 = int(_4358) & 3;
    float _4364 = (*spvDescriptorSet0.vp_c15)._m0[int(_4360)][_4362];
    int _4366 = int(_4358) + 1;
    uint _4368 = uint(int(uint(_4366) >> uint(2)));
    int _4370 = _4366 & 3;
    float _4372 = (*spvDescriptorSet0.vp_c15)._m0[int(_4368)][_4370];
    float _4374 = -_4310;
    float _4376 = _4254 + _4374;
    bool _4378 = _4318 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _4380 = _4378 || _4354;
    int _4382 = _4256 + 56;
    uint _4384 = uint(int(uint(_4382) >> uint(2)));
    uint _4386 = uint(int(uint(int(_4384)) >> uint(2)));
    int _4388 = int(_4384) & 3;
    float _4390 = (*spvDescriptorSet0.vp_c15)._m0[int(_4386)][_4388];
    int _4392 = int(_4384) + 1;
    uint _4394 = uint(int(uint(_4392) >> uint(2)));
    int _4396 = _4392 & 3;
    float _4398 = (*spvDescriptorSet0.vp_c15)._m0[int(_4394)][_4396];
    int _4400 = _4348;
    if (_4258)
    {
        float _4402 = _4284 * as_type<float>(_4348);
        _4340 = _4402;
    }
    float _4404 = _4340;
    int _4406 = as_type<int>(_4404);
    if (_4258)
    {
        float _4408 = _4404 * 0.15915493667125701904296875;
        _3772 = _4408;
    }
    float _4410 = _3772;
    float _4412 = _4410;
    if (!_4380)
    {
        int _4414 = _4318 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _4416 = _4414 + _4290;
        _4406 = _4416;
    }
    int _4418 = _4406;
    float _4420 = _3862;
    if (_4258)
    {
        float _4422 = _4410 * 6.283185482025146484375;
        float _4424 = cos(_4422);
        _4420 = _4424;
    }
    float _4426 = _4420;
    float _4428 = precise::max(0.0, _4182);
    if (!_4380)
    {
        int _4430 = _4418 << 2;
        _4400 = _4430;
    }
    int _4432 = _4400;
    float _4434 = -_4194;
    float _4436 = -_4428;
    float _4438 = fma(_4158, _4434, _4436);
    float _4440 = _4196 * _4280;
    float _4442 = as_type<float>(_4318);
    int _4444 = _4432;
    float _4446 = _4440;
    float _4448 = _4438;
    if (_4258)
    {
        float _4450 = _4410 * 6.283185482025146484375;
        float _4452 = sin(_4450);
        _4442 = _4452;
    }
    float _4454 = _4442;
    if (!_4380)
    {
        uint _4456 = uint(int(uint(_4418) >> uint(2)));
        _4342 = int(_4456);
    }
    int _4458 = _4342;
    float _4460 = fma(_3480, _4272, _4440);
    float _4462 = _4460;
    float _4464 = as_type<float>(_4458);
    if (!_4380)
    {
        int _4466 = 12 & _4432;
        _4444 = _4466;
    }
    int _4468 = _4444;
    float _4470 = _4196 * _4308;
    float _4472 = _4182;
    float _4474 = _4300;
    float _4476 = (*spvDescriptorSet0.vp_c15)._m0[652].y;
    if (_4258)
    {
        float _4478 = rsqrt(_4222);
        _4472 = _4478;
    }
    float _4480 = _4472;
    if (_4258)
    {
        float _4482 = _4438 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4412 = _4482;
    }
    float _4484 = _4412;
    float _4486 = _4484;
    if (_4258)
    {
        float _4488 = _4426 + (-1.0);
        _4446 = _4488;
    }
    float _4490 = _4446;
    float _4492 = fma(_3480, _4300, _4470);
    if (!_4380)
    {
        int _4494 = _4458 << 4;
        int _4496 = _4494 + _4468;
        _3566 = _4496;
    }
    int _4498 = _3566;
    float _4500 = fma(_3508, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    if (!_4258)
    {
        _4474 = _4438;
    }
    float _4502 = _4474;
    float _4504 = fma(_3508, _4328, _4460);
    float _4506 = _4502;
    float _4508 = _4328;
    if (_4258)
    {
        float _4510 = fma(_4454, _4484, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4486 = _4510;
    }
    float _4512 = _4486;
    float _4514 = _4512;
    if (_4258)
    {
        float _4516 = _4490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4462 = _4516;
    }
    float _4518 = _4462;
    if (!_4258)
    {
        _4476 = _4200;
    }
    float _4520 = _4476;
    float _4522 = _4136;
    float _4524 = _4520;
    if (!_4380)
    {
        int _4526 = _4498 + 400;
        uint _4528 = uint(int(uint(_4526) >> uint(2)));
        uint _4530 = uint(int(uint(int(_4528)) >> uint(2)));
        int _4532 = int(_4528) & 3;
        float _4534 = (*spvDescriptorSet0.vp_c15)._m0[int(_4530)][_4532];
        _4522 = _4534;
    }
    float _4536 = _4522;
    if (!_4258)
    {
        _4464 = _4202;
    }
    float _4538 = _4464;
    float _4540 = _4538;
    if (_4258)
    {
        float _4542 = fma(_4438, _4426, _4518);
        _4506 = _4542;
    }
    float _4544 = _4506;
    if (!_4258)
    {
        _4448 = _4212;
    }
    float _4546 = _4448;
    float _4548 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4550 = _4546;
    float _4552 = _4480;
    if (_4258)
    {
        float _4554 = _4480 * _4512;
        _4514 = _4554;
    }
    float _4556 = _4514;
    if (!_4258)
    {
        _4508 = _4214;
    }
    float _4558 = _4508;
    float _4560 = floor(_4500);
    int _4562 = _4256 + 72;
    uint _4564 = uint(int(uint(_4562) >> uint(2)));
    uint _4566 = uint(int(uint(int(_4564)) >> uint(2)));
    int _4568 = int(_4564) & 3;
    float _4570 = (*spvDescriptorSet0.vp_c15)._m0[int(_4566)][_4568];
    int _4572 = int(_4564) + 1;
    uint _4574 = uint(int(uint(_4572) >> uint(2)));
    int _4576 = _4572 & 3;
    float _4578 = (*spvDescriptorSet0.vp_c15)._m0[int(_4574)][_4576];
    float _4580 = _4558;
    if (_4258)
    {
        float _4582 = _4200 * _4556;
        _4524 = _4582;
    }
    float _4584 = _4524;
    if (_4258)
    {
        float _4586 = _4202 * _4556;
        _4540 = _4586;
    }
    float _4588 = _4540;
    float _4590 = _4196 * _4372;
    float _4592 = fma(_3508, _4390, _4492);
    if (_4258)
    {
        float _4594 = _4584 * _4584;
        _4550 = _4594;
    }
    float _4596 = _4550;
    if (_4258)
    {
        float _4598 = _4588 * _4588;
        _4580 = _4598;
    }
    float _4600 = _4580;
    float _4602 = fma(_3480, _4364, _4590);
    float _4604 = _4504 + _4336;
    float _4606 = fma(_4544, _4544, _4596);
    float _4608 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4610 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4612 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4548);
    float _4614 = _4606 + _4600;
    float _4616 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    int _4618 = _4256 + 80;
    uint _4620 = uint(int(uint(_4618) >> uint(2)));
    uint _4622 = uint(int(uint(int(_4620)) >> uint(2)));
    int _4624 = int(_4620) & 3;
    float _4626 = (*spvDescriptorSet0.vp_c15)._m0[int(_4622)][_4624];
    int _4628 = int(_4620) + 1;
    uint _4630 = uint(int(uint(_4628) >> uint(2)));
    int _4632 = _4628 & 3;
    float _4634 = (*spvDescriptorSet0.vp_c15)._m0[int(_4630)][_4632];
    float _4636 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4608);
    float _4638 = rsqrt(_4614);
    float _4640 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4616);
    float _4642 = _4144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4644 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4636);
    float _4646 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4612);
    float _4648 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4640);
    int _4650 = _4256 + 88;
    uint _4652 = uint(int(uint(_4650) >> uint(2)));
    uint _4654 = uint(int(uint(int(_4652)) >> uint(2)));
    int _4656 = int(_4652) & 3;
    float _4658 = (*spvDescriptorSet0.vp_c15)._m0[int(_4654)][_4656];
    int _4660 = int(_4652) + 1;
    uint _4662 = uint(int(uint(_4660) >> uint(2)));
    int _4664 = _4660 & 3;
    float _4666 = (*spvDescriptorSet0.vp_c15)._m0[int(_4662)][_4664];
    float _4668 = fma(_4148, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4642);
    float _4670 = 1.0 / _4604;
    float _4672 = _4648 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4674 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4676 = fma(_4198, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4674);
    float _4678 = precise::clamp(_4676, 0.0, 1.0);
    float _4680 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4668);
    float _4682 = _4592 + _4398;
    float _4684 = _4672 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4686 = _4646 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4688 = _4680 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4690 = _4638 * _4584;
    float _4692 = -_4684;
    float _4694 = fma(_4692, _4610, 1.0);
    float _4696 = _4644 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4698 = _4688 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4700 = _4690 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4702 = -_4560;
    float _4704 = _4500 + _4702;
    float _4706 = _4454;
    if (!_4380)
    {
        float _4708 = floor(_4238);
        _4706 = _4708;
    }
    float _4710 = _4706;
    float _4712 = fma(_4696, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4698);
    float _4714 = -_4678;
    float _4716 = _4714 + 1.0;
    float _4718 = _4638 * _4544;
    float _4720 = _4638 * _4588;
    float _4722 = _4682 * _4670;
    float _4724 = fma(_4672, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4712);
    float _4726 = -_4700;
    float _4728 = fma(_4718, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4726);
    float _4730 = abs(_4716);
    float _4732 = log2(_4730);
    float _4734 = fma(_3508, _4570, _4602);
    bool _4736 = _4722 >= 0.0;
    float _4738 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4724);
    float _4740 = -_4720;
    float _4742 = fma(_4740, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4728);
    float _4744 = _4734 + _4578;
    bool _4746 = _4722 <= 1.0;
    bool _4748 = _4746 && _4736;
    float _4750 = fma(_4742, -0.5, 0.5);
    float _4752 = _4744 * _4670;
    float _4754 = fma(_4742, 0.5, 0.5);
    float _4756 = _4716;
    if (!_4380)
    {
        float _4758 = floor(_4232);
        _4552 = _4758;
    }
    float _4760 = _4552;
    float _4762 = _4688 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4764 = _4710;
    if (!_4380)
    {
        float _4766 = -_4710;
        float _4768 = _4238 + _4766;
        _4756 = _4768;
    }
    float _4770 = _4756;
    bool _4772 = _4752 >= 0.0;
    bool _4774 = _4772 && _4748;
    float _4776 = _4196 * _4634;
    float _4778 = _4732 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    bool _4780 = _4752 <= 1.0;
    bool _4782 = _4780 && _4774;
    float _4784 = sqrt(_4750);
    float _4786 = fma(_3480, _4626, _4776);
    float _4788 = fma(_3508, _4658, _4786);
    float _4790 = fma(_4754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4792 = exp2(_4778);
    float _4794 = _4688 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4796 = _4788 + _4666;
    float _4798 = fma(_4754, _4790, -0.212114393711090087890625);
    if (_4782)
    {
        float _4800 = float(_4252);
        _4344 = _4800;
    }
    float _4802 = _4344;
    float _4804 = fma(_4696, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4794);
    float _4806 = _4718 + 1.0;
    float _4808 = fma(_4754, _4798, 1.570728778839111328125);
    float _4810 = log2(_4694);
    float _4812 = fma(_4696, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4762);
    float _4814 = fma(_4672, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4804);
    float _4816 = _4784 * 0.636619746685028076171875;
    if (!_4380)
    {
        float _4818 = -_4760;
        float _4820 = _4232 + _4818;
        _4764 = _4820;
    }
    float _4822 = _4764;
    float _4824 = fma(_4672, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4812);
    float _4826 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4814);
    float _4828 = -_4808;
    float _4830 = fma(_4816, _4828, 1.0);
    float _4832 = 1.0 / _4738;
    float _4834 = -_4718;
    float _4836 = fma(_4792, _4806, _4834);
    float _4838 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4824);
    float _4840 = _4796 * _4670;
    float _4842 = _4500;
    float _4844 = _4826;
    float _4846 = _4838;
    if (!_4380)
    {
        float _4848 = rint(_4536);
        float _4850 = precise::max(_4848, 0.0);
        uint _4852 = uint(_4850);
        uint _4854 = clamp(_4852, 0u, 65535u);
        _4842 = as_type<float>(_4854);
    }
    float _4856 = _4842;
    float _4858 = _4810 * 0.693147182464599609375;
    float _4860 = fma(_4836, 0.5, 0.5);
    float2 _12787 = float2(_4376, _4704);
    float _4862 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12787, float2(0.0), isnan(_12787)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12787, float2(0.0), isnan(_12787)), level(0.0)).x;
    float _4864 = _4858 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4866 = _4802;
    if (_4782)
    {
        float _4868 = rint(_4802);
        float _4870 = precise::max(_4868, 0.0);
        uint _4872 = uint(_4870);
        uint _4874 = clamp(_4872, 0u, 65535u);
        _4866 = as_type<float>(_4874);
    }
    float _4876 = _4866;
    float _4878 = _4826 * _4832;
    float _4880 = _4838 * _4832;
    float _4882 = fma(_4878, 0.5, 0.5);
    float _4884 = fma(_4880, -0.5, 0.5);
    float _4886 = _4856;
    if (!_4380)
    {
        float3 _12833 = float3(_4822, _4770, float(as_type<int>(_4856)));
        float3 _12837 = select(_12833, float3(0.0), isnan(_12833));
        float _4888 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _12837.xy, uint(rint(_12837.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _12837.xy, uint(rint(_12837.z)), level(0.0)).x;
        _4886 = _4888;
    }
    float _4890 = _4886;
    float _4892 = _4832;
    if (_4782)
    {
        float3 _12852 = float3(_4722, _4752, float(as_type<int>(_4876)));
        float3 _12854 = select(_12852, float3(0.0), isnan(_12852));
        float _4894 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _12854.xy, uint(rint(_12854.z)), _4840, level(0.0));
        _4892 = _4894;
    }
    float _4896 = _4892;
    float3 _12864 = float3(_4882, _4884, _4864);
    float _4898 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12864, float3(0.0), isnan(_12864)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12864, float3(0.0), isnan(_12864)), level(0.0)).x;
    float3 _12873 = float3(_4882, _4884, _4864);
    float4 _4901 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12873, float3(0.0), isnan(_12873)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12873, float3(0.0), isnan(_12873)), level(0.0)).xyzw;
    float _4903 = _4901.x;
    float _4905 = _4901.y;
    float _4907 = _4901.z;
    float _4909 = _4901.w;
    float2 _12889 = float2(_4830, _4860);
    float3 _4913 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12889, float2(0.0), isnan(_12889)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12889, float2(0.0), isnan(_12889)), level(0.0)).xyz;
    float _4915 = _4913.x;
    float _4917 = _4913.y;
    float _4919 = _4913.z;
    float _4921 = abs(_4210);
    float _4923 = log2(_4921);
    float _4925 = _4688 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4927 = fma(_4696, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4925);
    float _4929 = fma(_4672, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4927);
    float _4931 = _4923 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4933 = exp2(_4931);
    float _4935 = fma(_4686, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4929);
    float _4937 = _4826 + _4738;
    float _4939 = _4738 * 0.5;
    float _4941 = _4935 + _4738;
    out.gl_Position.x = _4826;
    out.gl_Position.y = _4838;
    out.gl_Position.z = _4935;
    out.gl_Position.w = _4738;
    float _4943 = _4937 * 0.5;
    float _4945 = fma(_4838, -0.5, _4939);
    float _4947 = _4941 * 0.5;
    out.m_98.x = _4943;
    out.m_98.y = _4945;
    out.m_98.z = _4947;
    out.m_98.w = _4738;
    float _4949 = fma(_4933, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4951 = precise::clamp(_4949, 0.0, 1.0);
    float _4953 = fma(_4951, -2.0, 3.0);
    bool _4955 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4957 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4959 = _4955 || _4957;
    bool _4961 = isnan(0.5);
    bool _4963 = _4959 || _4961;
    float _4965 = _4732 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4967 = _4951 * _4951;
    float _4969 = _4967 * _4953;
    float _4971 = exp2(_4965);
    bool _4973 = _4210 <= 8000.0;
    bool _4975 = isnan(_4210);
    bool _4977 = _4973 || _4975;
    bool _4979 = isnan(8000.0);
    bool _4981 = _4977 || _4979;
    float _4983 = float(_4981);
    float _4985 = -_4969;
    float _4987 = _4985 + 1.0;
    float _4989 = _4935;
    if (_4963)
    {
        _4844 = 1.0;
    }
    float _4991 = _4844;
    float _4993 = fma(_4987, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4969);
    float _4995 = _4983 * _4993;
    float _4997 = _4991;
    if (!_4963)
    {
        float _4999 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _5001 = _4999 * 0.15915493667125701904296875;
        float _5003 = _5001 * 6.283185482025146484375;
        float _5005 = cos(_5003);
        float _5007 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _5009 = _5007 * 0.15915493667125701904296875;
        float _5011 = _5001 * 6.283185482025146484375;
        float _5013 = sin(_5011);
        float _5015 = 1.0 / _5005;
        float _5017 = _5009 * 6.283185482025146484375;
        float _5019 = cos(_5017);
        float _5021 = _5013 * _5015;
        float _5023 = _5009 * 6.283185482025146484375;
        float _5025 = sin(_5023);
        float _5027 = _5019 * _5021;
        float _5029 = 1.0 / _5027;
        float _5031 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5033 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5031;
        float _5035 = 1.0 / _5033;
        float _5037 = _5025 * _5029;
        float _5039 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5041 = fma(_4210, _5037, _5039);
        float _5043 = _5041 * _5035;
        float _5045 = precise::clamp(_5043, 0.0, 1.0);
        _4989 = _5035;
        _4846 = _5029;
        _4997 = _5045;
    }
    float _5047 = _4989;
    float _5049 = _4846;
    float _5051 = _4997;
    float _5053 = _4995 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5055 = -_4862;
    float _5057 = _5055 + 1.0;
    float _5059 = -_4971;
    float _5061 = _5059 + 1.0;
    float _5063 = _5047;
    float _5065 = _5049;
    float _5067 = _5053;
    if (!_4782)
    {
        _5063 = 1.0;
    }
    float _5069 = _5063;
    float _5071 = _5057 * _5053;
    float _5073 = precise::clamp(_5071, 0.0, 1.0);
    float _5075 = _5069;
    if (_4782)
    {
        bool _5077 = _4896 >= _4840;
        bool _5079 = isnan(_4896);
        bool _5081 = _5077 || _5079;
        bool _5083 = isnan(_4840);
        bool _5085 = _5081 || _5083;
        float _5087 = float(_5085);
        _5075 = _5087;
    }
    float _5089 = _5075;
    float _5091 = _5061 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5093 = _5091;
    if (_4380)
    {
        _5065 = 1.0;
    }
    float _5095 = _5065;
    float _5097 = _5095;
    if (!_4380)
    {
        int _5099 = _4418 << 4;
        int _5101 = _5099 + 2048;
        uint _5103 = uint(int(uint(_5101) >> uint(2)));
        uint _5105 = uint(int(uint(int(_5103)) >> uint(2)));
        int _5107 = int(_5103) & 3;
        float _5109 = (*spvDescriptorSet0.vp_c15)._m0[int(_5105)][_5107];
        int _5111 = int(_5103) + 1;
        uint _5113 = uint(int(uint(_5111) >> uint(2)));
        int _5115 = _5111 & 3;
        float _5117 = (*spvDescriptorSet0.vp_c15)._m0[int(_5113)][_5115];
        int _5119 = _5101 + 8;
        uint _5121 = uint(int(uint(_5119) >> uint(2)));
        uint _5123 = uint(int(uint(int(_5121)) >> uint(2)));
        int _5125 = int(_5121) & 3;
        float _5127 = (*spvDescriptorSet0.vp_c15)._m0[int(_5123)][_5125];
        int _5129 = int(_5121) + 1;
        uint _5131 = uint(int(uint(_5129) >> uint(2)));
        int _5133 = _5129 & 3;
        float _5135 = (*spvDescriptorSet0.vp_c15)._m0[int(_5131)][_5133];
        float _5137 = _4196 * _5117;
        float _5139 = fma(_3480, _5109, _5137);
        float _5141 = fma(_3508, _5127, _5139);
        float _5143 = _5141 + _5135;
        float _5145 = precise::clamp(_5143, 0.0, 1.0);
        float _5147 = -_5145;
        float _5149 = _5147 + _4890;
        float _5151 = fma(_5149, 500.0, 1.5);
        float _5153 = exp2(_5151);
        float _5155 = 0.0 + _5153;
        float _5157 = precise::clamp(_5155, 0.0, 1.0);
        _5097 = _5157;
        _5067 = _5109;
        _4242 = 500.0;
    }
    float _5159 = _5097;
    float _5161 = _5067;
    float _5163 = _4242;
    float _5165 = _5089 * _5159;
    float _5167 = _5091 * _4898;
    float _5169 = -_5073;
    float _5171 = fma(_5169, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5173 = -_5091;
    float _5175 = _5173 + 1.0;
    bool _5177 = _4198 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5179 = isnan(_4198);
    bool _5181 = _5177 || _5179;
    bool _5183 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5185 = _5181 || _5183;
    float _5187 = _4909 * _5167;
    float _5189 = -_5165;
    float _5191 = fma(_5189, _5171, 1.0);
    float _5193 = precise::clamp(_5191, 0.0, 1.0);
    float _5195 = _4919 * _5167;
    float _5197 = _4909 * _5175;
    float _5199 = fma(_4915, _5187, _4903);
    float _5201 = fma(_4917, _5187, _4905);
    float _5203 = _5193 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5205 = fma(_4909, _5195, _4907);
    float _5207 = _5051 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_100.x = _5203;
    float _5209 = _5161;
    float _5211 = _5163;
    float _5213 = _5175;
    float _5215 = _5193;
    float _5217 = _5187;
    if (!_5185)
    {
        _5093 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5219 = _5093;
    float _5221 = _5219;
    float _5223 = _5219;
    if (!_5185)
    {
        _5209 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5225 = _5209;
    out.m_102.x = _5199;
    out.m_102.y = _5201;
    out.m_102.z = _5205;
    out.m_102.w = _5197;
    float _5227 = _5225;
    float _5229 = _5225;
    if (!_5185)
    {
        _5211 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5231 = _5211;
    float _5233 = _5231;
    float _5235 = _5231;
    if (!_5185)
    {
        _5213 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5237 = _5213;
    float _5239 = _5237;
    float _5241 = _5237;
    if (!_5185)
    {
        _5215 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5243 = _5215;
    float _5245 = _5243;
    float _5247 = _5243;
    if (!_5185)
    {
        _5217 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5249 = _5217;
    bool _5251 = !_5185;
    float _5253 = _5249;
    float _5255 = _5249;
    if (!_5251)
    {
        bool _5257 = _4198 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5259 = isnan(_4198);
        bool _5261 = _5257 || _5259;
        bool _5263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5265 = _5261 || _5263;
        if (!_5265)
        {
            float _5267 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5269 = _4198 + _5267;
            float _5271 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5273 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5271;
            float _5275 = 1.0 / _5273;
            float _5277 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5279 = _5277 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5281 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5283 = _5281 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5285 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5287 = _5285 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5289 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5291 = _5289 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5293 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5295 = _5293 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5297 = _5269 * _5275;
            float _5299 = precise::clamp(_5297, 0.0, 1.0);
            float _5301 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5303 = _5301 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5305 = fma(_5299, _5279, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5307 = fma(_5299, _5303, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5309 = fma(_5299, _5283, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5311 = fma(_5299, _5287, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5313 = fma(_5299, _5291, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5315 = fma(_5299, _5295, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5229 = _5305;
            _5247 = _5313;
            _5223 = _5307;
            _5241 = _5311;
            _5235 = _5309;
            _5255 = _5315;
            _5317 = true;
        }
        else
        {
            bool _5319 = _4198 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5321 = isnan(_4198);
            bool _5323 = _5319 || _5321;
            bool _5325 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5327 = _5323 || _5325;
            if (!_5327)
            {
                _5221 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5329 = _5221;
            _5223 = _5329;
            if (!_5327)
            {
                _5227 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5331 = _5227;
            _5229 = _5331;
            if (!_5327)
            {
                _5233 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5333 = _5233;
            _5235 = _5333;
            if (!_5327)
            {
                _5239 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5335 = _5239;
            _5241 = _5335;
            if (!_5327)
            {
                _5245 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5337 = _5245;
            _5247 = _5337;
            if (!_5327)
            {
                _5253 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5339 = _5253;
            bool _5341 = !_5327;
            _5255 = _5339;
            if (!_5341)
            {
                bool _5343 = _4198 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5345 = isnan(_4198);
                bool _5347 = _5343 || _5345;
                bool _5349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5351 = _5347 || _5349;
                if (!_5351)
                {
                    float _5353 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5355 = _4198 + _5353;
                    float _5357 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5359 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5357;
                    float _5361 = 1.0 / _5359;
                    float _5363 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5365 = _5363 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5367 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5369 = _5367 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5371 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5373 = _5371 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5375 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5377 = _5375 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5379 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5381 = _5379 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5383 = _5355 * _5361;
                    float _5385 = precise::clamp(_5383, 0.0, 1.0);
                    float _5387 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5389 = _5387 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5391 = fma(_5385, _5365, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5393 = fma(_5385, _5389, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5395 = fma(_5385, _5369, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5397 = fma(_5385, _5373, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5399 = fma(_5385, _5377, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5401 = fma(_5385, _5381, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5229 = _5391;
                    _5247 = _5399;
                    _5223 = _5393;
                    _5241 = _5397;
                    _5235 = _5395;
                    _5255 = _5401;
                    _5317 = true;
                }
                else
                {
                    _5229 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5247 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5223 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5241 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5235 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5255 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5317 = false;
    float _5403 = _5229;
    float _5405 = _5247;
    float _5407 = _5223;
    float _5409 = _5241;
    float _5411 = _5235;
    float _5413 = _5255;
    float _5415 = fma(_3914, -0.5, 0.5);
    float _5417 = precise::clamp(_5415, 0.0, 1.0);
    float _5419 = -_5403;
    float _5421 = _5419 + _5405;
    float _5423 = _5207 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5425 = -_5407;
    float _5427 = _5425 + _5409;
    out.m_104.x = 0.0;
    float _5429 = fma(_5417, _5421, _5403);
    float _5431 = fma(_5417, _5427, _5407);
    out.m_65.x = _5423;
    float _5433 = -_5411;
    float _5435 = _5433 + _5413;
    float _5437 = _5429 * 0.586610972881317138671875;
    bool _5439 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5441 = fma(_5417, _5435, _5411);
    float _5443 = fma(_5431, 0.298911988735198974609375, _5437);
    bool _5445 = _5051 > 0.0;
    bool _5447 = isnan(_5051);
    bool _5449 = _5445 || _5447;
    bool _5451 = isnan(0.0);
    bool _5453 = _5449 || _5451;
    float _5455 = fma(_5441, 0.114477999508380889892578125, _5443);
    float _5457 = -_5455;
    float _5459 = _5431 + _5457;
    float _5461 = -_5455;
    float _5463 = _5429 + _5461;
    float _5465 = -_5455;
    float _5467 = _5441 + _5465;
    float _5469 = fma(_5459, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5455);
    float _5471 = fma(_5463, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5455);
    float _5473 = fma(_5467, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5455);
    bool _5475 = !_5439;
    if (!_5475)
    {
        float _5477 = -_4144;
        float _5479 = _5477 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5481 = -_4148;
        float _5483 = _5481 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5485 = -_4154;
        float _5487 = _5485 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5489 = _5479 * _5479;
        float _5491 = fma(_5483, _5483, _5489);
        float _5493 = fma(_5487, _5487, _5491);
        float _5495 = sqrt(_5493);
        float _5497 = rsqrt(_5493);
        float _5499 = -_5495;
        float _5501 = _5499 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5503 = _5501 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5505 = precise::clamp(_5503, 0.0, 1.0);
        float _5507 = _5483 * _5497;
        float _5509 = _5479 * _5497;
        float _5511 = abs(_5505);
        float _5513 = log2(_5511);
        float _5515 = _5487 * _5497;
        float _5517 = _5507 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5519 = _3914 * _5509;
        float _5521 = -_5509;
        float _5523 = -_5517;
        float _5525 = fma(_5521, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5523);
        float _5527 = fma(_3918, _5507, _5519);
        float _5529 = -_5515;
        float _5531 = fma(_5529, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5525);
        float _5533 = fma(_3920, _5515, _5527);
        float _5535 = precise::clamp(_5533, 0.0, 1.0);
        float _5537 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5539 = _5531 + _5537;
        float _5541 = _5513 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5543 = _5539 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5545 = precise::clamp(_5543, 0.0, 1.0);
        float _5547 = exp2(_5541);
        float _5549 = _5547 * _5545;
        float _5551 = _5535 * _5549;
        float _5553 = _5551 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5555 = _5551 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5557 = _5551 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _5553;
        out.m_104.y = _5555;
        out.m_104.z = _5557;
    }
    out.m_106.x = _5469;
    out.m_106.y = _5471;
    out.m_106.z = _5473;
    if (_5453)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_65.x = 0.0;
    float _5559 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5559;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

