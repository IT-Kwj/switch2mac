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
    float4 m_72 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_92 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3913 = false;
    bool _993 = false;
    bool _823 = false;
    bool _603 = false;
    bool _427 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_56.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_59.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4198 = as_type<float>(_131);
        out.gl_Position.z = _4198;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    if (_145)
    {
        float _153 = float(_115);
        _151 = _153;
    }
    float _155 = _151;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    if (_161)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _125;
    if (_161)
    {
        out.m_59.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _133 = as_type<int>(_165);
    }
    int _167 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4266 = as_type<float>(_167);
        out.gl_Position.z = _4266;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_66.x;
    float _173 = in.m_66.y;
    float _175 = in.m_66.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _193 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _195 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    float _199 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _201 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _203 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _205 = !_179;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_183;
    float _211 = _209 ? (-0.5) : 0.5;
    bool _213 = !_185;
    float _231;
    if (!_213)
    {
        float _215 = in.m_68.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_115);
        float _237 = 1.0 / _235;
        float _239 = _149 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = _241 + _247;
    bool _251 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _253 = isnan(_241);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _241 + _275;
    float _279 = 1.0 / _269;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _283 = 1.0 / _265;
    float _285 = 1.0 / _273;
    float _287 = _277 * _279;
    bool _289 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _291 = isnan(_241);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _245 * _283;
    bool _303 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_241);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_261;
    float _317 = _315 + 1.0;
    float _319 = _313 * _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _325 = _249 * _285;
    bool _327 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_241);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_313;
    float _341 = _339 + 1.0;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = _337 * _341;
    float _357 = -_337;
    float _359 = _357 + 1.0;
    float _361 = fma(_345, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = fma(_349, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _365 = fma(_323, _287, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _367 = _299 * _359;
    float _369 = fma(_353, _287, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = -_299;
    float _373 = _371 + 1.0;
    float _375 = _361 * _367;
    float _377 = _363 * _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _383;
    float _387 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _391 = fma(_381, _325, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _393 = fma(_385, _325, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _395 = fma(_365, _355, _387);
    float _397 = fma(_369, _355, _389);
    float _399 = fma(_391, _319, _395);
    float _401 = fma(_393, _319, _397);
    float _403 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].x, _399);
    float _405 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].y, _401);
    bool _407 = !_281;
    float _425;
    if (!_407)
    {
        float _409 = in.m_68.x;
        float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _413 = _409 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[11].x, _149);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        float _429 = float(_115);
        float _431 = 1.0 / _429;
        float _433 = _149 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = in.m_70.x;
    float _439 = in.m_70.y;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _443 = _435 + _441;
    bool _445 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _447 = isnan(_435);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _459 = _435 + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _469 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _471 = isnan(_435);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    bool _481 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _483 = isnan(_435);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = 1.0 / _467;
    float _495 = -_491;
    float _497 = _495 + 1.0;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _501 = 1.0 / _463;
    float _503 = _479 * _497;
    float _505 = -_479;
    float _507 = _505 + 1.0;
    float _509 = _405 * _439;
    float _511 = _459 * _493;
    float _513 = _403 * _437;
    float _515 = _443 * _501;
    float _517 = -_455;
    float _519 = _517 + 1.0;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _521;
    float _525 = _491 * _519;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _531;
    float _535 = fma(_523, _515, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _537 = fma(_529, _515, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _539 = fma(_533, _515, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _541 = _535 * _503;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _547 = _537 * _503;
    float _549 = _539 * _503;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _559 = fma(_545, _511, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[107].x, _547);
    float _563 = fma(_553, _511, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _565 = fma(_557, _511, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _567 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[107].y, _541);
    float _569 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[107].z, _549);
    float _571 = fma(_563, _525, _561);
    float _573 = fma(_559, _525, _567);
    float _575 = fma(_565, _525, _569);
    float _577 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].x, _571);
    float _579 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].y, _573);
    float _581 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].z, _575);
    bool _583 = !_499;
    float _601;
    if (!_583)
    {
        float _585 = in.m_68.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _593 = _591 * _587;
        float _595 = floor(_593);
        float _597 = -_595;
        float _599 = _593 + _597;
        _601 = _599;
        _603 = true;
    }
    else
    {
        float _605 = float(_115);
        float _607 = 1.0 / _605;
        float _609 = _149 * _607;
        _601 = _609;
    }
    _603 = false;
    float _611 = _601;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _615 = _611 + _613;
    float _617 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _631 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _633 = isnan(_611);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = 1.0 / _621;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _649 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _651 = isnan(_611);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = _579 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _663 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _665 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = 1.0 / _629;
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _675 = _625 * _643;
    bool _677 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _679 = isnan(_611);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = 1.0 / _647;
    float _691 = -_641;
    float _693 = _691 + 1.0;
    float _695 = fma(_675, _615, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _701 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _703 = isnan(_611);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -_687;
    float _715 = _713 + 1.0;
    float _717 = _687 * _693;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _723 = 1.0 / _699;
    float _725 = -_711;
    float _727 = _725 + 1.0;
    float _729 = _659 * _715;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _731;
    float _735 = _721 * _669;
    float _737 = _641 * _727;
    float _739 = _695 * _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _743 = _611 + _741;
    float _745 = -_659;
    float _747 = _745 + 1.0;
    bool _749 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _751 = isnan(_611);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _733 * _689;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _769 = _611 + _767;
    float _771 = fma(_735, _743, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _773 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[115].x, _739);
    float _775 = -_759;
    float _777 = _775 + 1.0;
    float _779 = _765 * _723;
    float _781 = fma(_761, _769, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _785 = _611 + _783;
    float _787 = fma(_771, _717, _773);
    float _789 = _711 * _777;
    float _791 = fma(_779, _785, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _793 = fma(_781, _737, _787);
    float _795 = fma(_791, _789, _793);
    float _797 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[119].x, _795);
    float _799 = _797 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _665;
    out.m_72.y = _667;
    out.m_72.z = _671;
    out.m_72.w = _799;
    bool _801 = !_673;
    float _803 = _737;
    float _821;
    if (!_801)
    {
        float _805 = in.m_68.x;
        float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _809 = _805 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[11].z, _149);
        float _813 = _811 * _807;
        float _815 = floor(_813);
        float _817 = -_815;
        float _819 = _813 + _817;
        _821 = _819;
        _823 = true;
    }
    else
    {
        float _825 = float(_115);
        float _827 = 1.0 / _825;
        float _829 = _149 * _827;
        _821 = _829;
    }
    _823 = false;
    float _831 = _821;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _835 = _831 + _833;
    bool _837 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _839 = isnan(_831);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _851 = _831 + _849;
    bool _853 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _855 = isnan(_831);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _873 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _875 = isnan(_831);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = -_847;
    float _887 = _885 + 1.0;
    float _889 = 1.0 / _871;
    float _891 = _883 * _887;
    float _893 = -_883;
    float _895 = _893 + 1.0;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _897;
    bool _901 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _903 = 1.0 / _867;
    float _905 = _863 * _895;
    float _907 = -_863;
    float _909 = _907 + 1.0;
    float _911 = _835 * _903;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _913;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _917;
    float _921 = fma(_899, _911, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _923 = fma(_915, _911, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _925 = fma(_919, _911, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _927 = _851 * _889;
    float _929 = _921 * _905;
    float _931 = _923 * _905;
    float _933 = _925 * _905;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _947 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].x, _929);
    float _949 = fma(_937, _927, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _951 = fma(_941, _927, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _953 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].y, _931);
    float _955 = fma(_945, _927, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _957 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].z, _933);
    float _959 = fma(_949, _891, _947);
    float _961 = fma(_951, _891, _953);
    float _963 = fma(_955, _891, _957);
    float _965 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[125].x, _959);
    float _967 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[125].y, _961);
    float _969 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[125].z, _963);
    bool _971 = !_901;
    float _973 = _965;
    float _991;
    if (!_971)
    {
        float _975 = in.m_68.x;
        float _977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _979 = _975 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _981 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _983 = _981 * _977;
        float _985 = floor(_983);
        float _987 = -_985;
        float _989 = _983 + _987;
        _991 = _989;
        _993 = true;
    }
    else
    {
        float _995 = float(_115);
        float _997 = 1.0 / _995;
        float _999 = _149 * _997;
        _991 = _999;
    }
    _993 = false;
    float _1001 = _991;
    float _1003 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1005 = int(_1003);
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1009 = _1007 != 0;
    float _1011 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1013 = int(_1011);
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1019 = float(_1005);
    float _1021 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1023 = int(_1021);
    if (_1009)
    {
        float _1025 = in.m_68.x;
        _803 = _1025;
    }
    float _1027 = _803;
    float _1029 = _1027;
    if (!_1009)
    {
        float _1031 = in.m_68.y;
        _1029 = _1031;
    }
    float _1033 = _1029;
    float _1035 = float(uint(_1013));
    float _1037 = 1.0 / _1019;
    int _1039 = ~_1013;
    int _1041 = _1039 + 1;
    bool _1043 = _1013 == 0;
    float _1045 = 1.0 / _1035;
    float _1047 = float(uint(_1023));
    float _1049 = _149 * _1037;
    float _1051 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1053 = int(_1051);
    int _1055 = as_type<int>(_1045) + (-2);
    float _1057 = trunc(_1049);
    int _1059 = int(_1057);
    int _1061 = ~_1013;
    int _1063 = _1061 + 1;
    float _1065 = float(_1053);
    float _1067 = 1.0 / _1047;
    float _1069 = float(uint(_1059));
    float _1071 = 1.0 / _1065;
    float _1073 = as_type<float>(_1055) * _1069;
    float _1075 = trunc(_1073);
    float _1077 = precise::max(_1075, 0.0);
    uint _1080 = uint(_1077);
    float _1082 = _149 * _1071;
    float _1084 = trunc(_1082);
    int _1086 = int(_1084);
    int _1088 = _1063 * int(_1080);
    int _1090 = _1088 + _1059;
    float _1092 = float(uint(_1090));
    float _1094 = in.m_68.x;
    float _1096 = in.m_68.y;
    float _1098 = in.m_68.z;
    float _1100 = in.m_68.w;
    float _1102 = as_type<float>(_1055) * _1092;
    float _1104 = _1092;
    if (_1009)
    {
        _1104 = 1.0;
    }
    float _1106 = _1104;
    float _1108 = _1106;
    if (!_1009)
    {
        _1108 = 7.345489978790283203125;
    }
    float _1110 = _1108;
    float _1112 = trunc(_1102);
    float _1114 = precise::max(_1112, 0.0);
    uint _1116 = uint(_1114);
    float _1118 = float(uint(_1086));
    int _1120 = int(_1080) + int(_1116);
    float _1122 = _1110 * _1094;
    float _1124 = float(_1013);
    float _1126 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1128 = float(_1059);
    int _1130 = _1041 * _1120;
    int _1132 = _1130 + _1059;
    float _1134 = _1110;
    float _1136 = _1098;
    if (_1009)
    {
        _1134 = 1.0;
    }
    float _1138 = _1134;
    float _1140 = floor(_1122);
    float _1142 = _1138;
    if (!_1009)
    {
        _1142 = 1.2345600128173828125;
    }
    float _1144 = _1142;
    float _1146 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1148 = _1128 >= _1124;
    bool _1150 = isnan(_1128);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(_1124);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = fma(_1126, -2.0, _1015);
    bool _1162 = uint(_1132) >= uint(_1013);
    float _1164 = _1033 * _1144;
    int _1166 = _1013 + (-1);
    float _1168 = -_1017;
    float _1170 = fma(_1146, 2.0, _1168);
    bool _1172 = !_1162;
    int _1174 = _1172 ? 0 : (-1);
    float _1176 = trunc(_1158);
    int _1178 = int(_1176);
    bool _1180 = _1001 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1182 = isnan(_1001);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1160);
    int _1194 = ~_1120;
    int _1196 = _1194 + _1174;
    int _1198 = _1196 + 1;
    float _1200 = -_149;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1170);
    float _1204 = float(_115);
    float _1206 = -_1140;
    float _1208 = _1122 + _1206;
    int _1210 = as_type<int>(_1067) + (-2);
    int _1212 = _1013 * _1198;
    int _1214 = _1212 + _1059;
    float _1216 = floor(_1164);
    int _1218 = ~_1023;
    int _1220 = _1218 + 1;
    float _1222 = as_type<float>(_1210) * _1118;
    bool _1224 = !_1043;
    int _1226 = _1224 ? _1214 : (-1);
    bool _1228 = _1001 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1230 = isnan(_1001);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = 1.0 / _1204;
    int _1242 = ~_1178;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    int _1248 = _1226 * _1246;
    float _1250 = trunc(_1222);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    float _1256 = -_1216;
    float _1258 = _1164 + _1256;
    int _1260 = _1178 * _1166;
    int _1262 = _1260 + _1248;
    float _1264 = _1208 * _1124;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1276 = _1274 != 0;
    float _1278 = _149 * _1240;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1282 = _1280 != 0;
    float _1284 = trunc(_1264);
    int _1286 = int(_1284);
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1290 = _1288 != 0;
    float _1292 = _1278 * _1124;
    bool _1294 = !_1272;
    int _1296 = _1294 ? 0 : 1;
    bool _1298 = !_1268;
    int _1300 = _1298 ? 0 : 1;
    int _1302 = _1220 * int(_1254);
    int _1304 = _1302 + _1086;
    int _1306 = abs(_1296);
    float _1308 = trunc(_1292);
    int _1310 = int(_1308);
    int _1312 = abs(_1300);
    float _1314 = float(uint(_1304));
    bool _1316 = !_1282;
    int _1318 = _1316 ? 0 : 1;
    bool _1320 = !_1276;
    int _1322 = _1320 ? 0 : 1;
    float _1324 = as_type<float>(_1210) * _1314;
    int _1326 = abs(_1318);
    float _1328 = trunc(_1324);
    float _1330 = precise::max(_1328, 0.0);
    uint _1332 = uint(_1330);
    bool _1334 = !_1290;
    int _1336 = _1334 ? 0 : 1;
    int _1338 = _1286 * _1326;
    int _1340 = _1338 + _1059;
    int _1342 = abs(_1322);
    int _1344 = _1262 * _1306;
    int _1346 = abs(_1336);
    float _1348 = float(_1023);
    int _1350 = _1310 * _1312;
    int _1352 = _1350 + _1344;
    int _1354 = ~_1023;
    int _1356 = _1354 + 1;
    float _1358 = float(_1086);
    int _1360 = _1340 * _1342;
    int _1362 = _1360 + _1352;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1366 = _1364 != 0;
    bool _1368 = _1358 >= _1348;
    bool _1370 = isnan(_1358);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(_1348);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    int _1380 = _1286 * _1346;
    int _1382 = _1380 + _1362;
    int _1384 = int(_1254) + int(_1332);
    float _1386 = _1258 * _1348;
    float _1388 = _1278 * _1348;
    int _1390 = _1023 + (-1);
    float _1392 = trunc(_1378);
    int _1394 = int(_1392);
    float _1396 = float(uint(_1382));
    int _1398 = _1356 * _1384;
    int _1400 = _1398 + _1086;
    float _1402 = as_type<float>(_1055) * _1396;
    bool _1404 = uint(_1400) >= uint(_1023);
    float _1406 = trunc(_1386);
    int _1408 = int(_1406);
    bool _1410 = !_1366;
    int _1412 = _1410 ? 0 : 1;
    bool _1414 = !_1404;
    int _1416 = _1414 ? 0 : (-1);
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1420 = _1418 != 0;
    int _1422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1424 = _1422 != 0;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1428 = _1426 != 0;
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1432 = _1430 != 0;
    int _1434 = ~_1384;
    int _1436 = _1434 + _1416;
    int _1438 = _1436 + 1;
    float _1440 = trunc(_1402);
    float _1442 = precise::max(_1440, 0.0);
    uint _1444 = uint(_1442);
    int _1446 = abs(_1412);
    int _1448 = ~_1013;
    int _1450 = _1448 + 1;
    int _1452 = _1023 * _1438;
    int _1454 = _1452 + _1086;
    bool _1456 = _1023 == 0;
    int _1458 = _1408 * _1446;
    int _1460 = _1458 + _1086;
    int _1462 = ~_1394;
    int _1464 = _1462 + 1;
    int _1466 = _1464 + 1;
    float _1468 = trunc(_1388);
    int _1470 = int(_1468);
    bool _1472 = !_1456;
    int _1474 = _1472 ? _1454 : (-1);
    bool _1476 = _1013 == 0;
    int _1478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1480 = _1478 != 0;
    int _1482 = _1450 * int(_1444);
    int _1484 = _1482 + _1382;
    int _1486 = _1474 * _1466;
    bool _1488 = !_1424;
    int _1490 = _1488 ? 0 : 1;
    float _1492 = float(uint(_1484));
    int _1494 = _1394 * _1390;
    int _1496 = _1494 + _1486;
    bool _1498 = !_1420;
    int _1500 = _1498 ? 0 : 1;
    int _1502 = abs(_1490);
    float _1504 = as_type<float>(_1055) * _1492;
    bool _1506 = !_1428;
    int _1508 = _1506 ? 0 : 1;
    int _1510 = abs(_1500);
    float _1512 = trunc(_1504);
    float _1514 = precise::max(_1512, 0.0);
    uint _1516 = uint(_1514);
    bool _1518 = !_1432;
    int _1520 = _1518 ? 0 : 1;
    int _1522 = _1496 * _1502;
    int _1524 = abs(_1508);
    int _1526 = abs(_1520);
    int _1528 = _1470 * _1510;
    int _1530 = _1528 + _1522;
    float _1532 = float(uint(_1340));
    int _1534 = _1460 * _1524;
    int _1536 = _1534 + _1530;
    float _1538 = float(uint(_1460));
    int _1540 = ~_1013;
    int _1542 = _1540 + 1;
    int _1544 = _1408 * _1526;
    int _1546 = _1544 + _1536;
    int _1548 = int(_1444) + int(_1516);
    float _1550 = as_type<float>(_1055) * _1532;
    float _1552 = as_type<float>(_1210) * _1538;
    float _1554 = float(uint(_1546));
    float _1556 = trunc(_1550);
    float _1558 = precise::max(_1556, 0.0);
    uint _1560 = uint(_1558);
    int _1562 = ~_1013;
    int _1564 = _1562 + 1;
    int _1566 = _1542 * _1548;
    int _1568 = _1566 + _1382;
    int _1570 = ~_1023;
    int _1572 = _1570 + 1;
    int _1574 = ~_1013;
    int _1576 = _1574 + 1;
    bool _1578 = uint(_1568) >= uint(_1013);
    float _1580 = trunc(_1552);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    float _1586 = as_type<float>(_1210) * _1554;
    int _1588 = 0;
    if (_1480)
    {
        _1588 = 0;
    }
    int _1590 = _1588;
    bool _1592 = !_1578;
    int _1594 = _1592 ? 0 : (-1);
    int _1596 = _1590;
    if (!_1480)
    {
        _1596 = 1;
    }
    int _1598 = _1596;
    float _1600 = trunc(_1586);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    int _1606 = ~_1548;
    int _1608 = _1606 + _1594;
    int _1610 = _1608 + 1;
    int _1612 = _1564 * int(_1560);
    int _1614 = _1612 + _1340;
    bool _1616 = _1094 > 0.5;
    int _1618 = _1013 * _1610;
    int _1620 = _1618 + _1382;
    int _1622 = _1572 * int(_1584);
    int _1624 = _1622 + _1460;
    float _1626 = float(uint(_1614));
    bool _1628 = !_1476;
    int _1630 = _1628 ? _1620 : (-1);
    float _1632 = float(uint(_1624));
    float _1634 = as_type<float>(_1055) * _1626;
    int _1636 = _1630 & 3;
    bool _1638 = _1636 != 0;
    int _1640 = _1572 * int(_1604);
    int _1642 = _1640 + _1546;
    int _1644 = _1630 & 3;
    bool _1646 = _1644 != 0;
    float _1648 = as_type<float>(_1210) * _1632;
    bool _1650 = uint(_1636) > 1u;
    float _1652 = trunc(_1634);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    float _1658 = float(uint(_1642));
    bool _1660 = uint(_1636) >= 2u;
    float _1662 = -_207;
    int _1664 = _1616 ? as_type<int>(_1662) : as_type<int>(_207);
    float _1666 = as_type<float>(_1210) * _1658;
    int _1668 = _1646 ? 0 : 1;
    float _1670 = trunc(_1648);
    float _1672 = precise::max(_1670, 0.0);
    uint _1674 = uint(_1672);
    bool _1676 = _1100 > 0.5;
    int _1678 = ~_1668;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    int _1684 = _1682;
    if (!_1650)
    {
        int _1686 = ~_1668;
        int _1688 = _1686 + 1;
        _1684 = _1688;
    }
    int _1690 = _1684;
    bool _1692 = _1636 != 3;
    float _1694 = trunc(_1666);
    float _1696 = precise::max(_1694, 0.0);
    uint _1698 = uint(_1696);
    int _1700 = int(_1560) + int(_1656);
    int _1702 = _1660 ? 0 : 1;
    bool _1704 = _1096 > 0.5;
    int _1706 = _1576 * _1700;
    int _1708 = _1706 + _1340;
    int _1710 = ~_1023;
    int _1712 = _1710 + 1;
    int _1714 = int(_1584) + int(_1674);
    int _1716 = ~_1702;
    int _1718 = _1716 + 1;
    int _1720 = _1718 + 1;
    bool _1722 = uint(_1708) >= uint(_1013);
    int _1724 = _1712 * _1714;
    int _1726 = _1724 + _1460;
    int _1728 = int(_1604) + int(_1698);
    int _1730 = ~_1023;
    int _1732 = _1730 + 1;
    int _1734 = _1720;
    if (_1692)
    {
        int _1736 = ~_1702;
        int _1738 = _1736 + 1;
        _1734 = _1738;
    }
    int _1740 = _1734;
    bool _1742 = !_1722;
    int _1744 = _1742 ? 0 : (-1);
    int _1746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1748 = _1746 != 0;
    int _1750 = _1732 * _1728;
    int _1752 = _1750 + _1546;
    bool _1754 = uint(_1726) >= uint(_1023);
    bool _1756 = !_1748;
    int _1758 = _1756 ? 0 : 1;
    bool _1760 = !_1754;
    int _1762 = _1760 ? 0 : (-1);
    int _1764 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1766 = _1764 != 0;
    bool _1768 = uint(_1752) >= uint(_1023);
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1774 = in.m_56.x;
    float _1776 = in.m_56.y;
    float _1778 = in.m_56.z;
    bool _1780 = !_1766;
    float _1782 = _1780 ? _207 : as_type<float>(_1664);
    float _1784 = 1.0 / _1772;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1792 = _1790 != 0;
    float _1794 = -_211;
    int _1796 = _1704 ? as_type<int>(_1794) : as_type<int>(_211);
    bool _1798 = _1098 > 0.5;
    float _1800 = 1.0 / _1788;
    bool _1802 = !_1792;
    float _1804 = _1802 ? _211 : as_type<float>(_1796);
    bool _1806 = !_1768;
    int _1808 = _1806 ? 0 : (-1);
    float _1810 = -_207;
    int _1812 = _1798 ? as_type<int>(_1810) : as_type<int>(_207);
    int _1814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1816 = _1814 != 0;
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1820 = _1818 != 0;
    float _1822 = -_1190;
    float _1824 = _1822 + 1.0;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1828 = _1826 != 0;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1830;
    bool _1834 = _1001 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1836 = isnan(_1001);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1842 = _1838 || _1840;
    float _1844 = float(_1842);
    float _1846 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1848 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1850 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1852 = _1832 * _1784;
    float _1854 = -_1844;
    float _1856 = _1854 + 1.0;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1860 = _1858 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1864 = _1001 + _1862;
    float _1866 = fma(_1774, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1846);
    float _1868 = fma(_1774, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1848);
    float _1870 = fma(_1774, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1850);
    float _1872 = _1190 * _1856;
    float _1874 = _1860 * _1800;
    float _1876 = fma(_1852, _1864, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1878 = _1238 * _1824;
    bool _1880 = !_1828;
    float _1882 = _1880 ? _207 : as_type<float>(_1812);
    float _1884 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1866);
    bool _1886 = _1598 != 1;
    float _1888 = _1876 * _1878;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1892 = _1001 + _1890;
    float _1894 = _1804 + (-0.5);
    float _1896 = -_1238;
    float _1898 = _1896 + 1.0;
    float _1900 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1868);
    float _1902 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1870);
    float _1904 = -_1894;
    float _1906 = -_1192;
    float _1908 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1906);
    float _1910 = fma(_1874, _1892, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1912 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1888);
    float _1914 = _1782 + 0.5;
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1918 = fma(_1910, _1872, _1912);
    int _1920 = ~_1728;
    int _1922 = _1920 + _1808;
    int _1924 = _1922 + 1;
    float _1926 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1202);
    float _1928 = _1874;
    float _1930 = _1870;
    float _1932 = _1888;
    if (!_1886)
    {
        _1928 = _1096;
    }
    float _1934 = _1928;
    float _1936 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1916);
    float _1938 = _1934;
    if (!_1886)
    {
        _1930 = _1096;
    }
    float _1940 = _1930;
    int _1942 = _1023 * _1924;
    int _1944 = _1942 + _1546;
    float _1946 = _1940;
    if (_1886)
    {
        _1938 = _1094;
    }
    float _1948 = _1938;
    float _1950 = _1900 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_1886)
    {
        _1946 = _1094;
    }
    float _1952 = _1946;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1886)
    {
        _1932 = _1098;
    }
    float _1958 = _1932;
    float _1960 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1954);
    float _1962 = _1958;
    if (_1886)
    {
        _1136 = _1096;
    }
    float _1964 = _1136;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1886)
    {
        _1962 = _1096;
    }
    float _1968 = _1962;
    float _1970 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1936);
    float _1972 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1966);
    int _1974 = _1630 >> 31;
    float _1976 = _1884 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1978 = !_1456;
    int _1980 = _1978 ? _1944 : (-1);
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1984 = _1974 & 3;
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = _1950 + _1986;
    int _1990 = _1980 >> 31;
    float _1992 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1982);
    int _1994 = _1630 + _1984;
    float _1996 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1918);
    int _1998 = _1990 & 3;
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2002 = _1994 >> 2;
    float _2004 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2006 = _1980 + _1998;
    float _2008 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1960);
    int _2010 = _2002 << 4;
    int _2012 = _2010 + 368;
    float _2014 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1972);
    int _2016 = _2006 >> 2;
    float _2018 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1992);
    uint _2020 = uint(int(uint(_2012) >> uint(2)));
    uint _2022 = uint(int(uint(int(_2020)) >> uint(2)));
    int _2024 = int(_2020) & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    int _2028 = int(_2020) + 1;
    uint _2030 = uint(int(uint(_2028) >> uint(2)));
    int _2032 = _2028 & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    bool _2036 = !_1638;
    int _2038 = _2036 ? 0 : 1;
    float _2040 = _1902 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2042 = _2016 << 4;
    int _2044 = _2042 + 512;
    float _2046 = -_2018;
    float _2048 = _2046 + 1.0;
    int _2050 = _1980 & 3;
    bool _2052 = _2050 != 0;
    float _2054 = _1882 + 0.5;
    int _2056 = _1980 & 3;
    bool _2058 = _2056 != 0;
    uint _2060 = uint(int(uint(_2044) >> uint(2)));
    uint _2062 = uint(int(uint(int(_2060)) >> uint(2)));
    int _2064 = int(_2060) & 3;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[int(_2062)][_2064];
    int _2068 = int(_2060) + 1;
    uint _2070 = uint(int(uint(_2068) >> uint(2)));
    int _2072 = _2068 & 3;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[int(_2070)][_2072];
    float _2076 = -_1970;
    float _2078 = _2076 + 1.0;
    int _2080 = _2052 ? 0 : 1;
    bool _2082 = uint(_2056) > 1u;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2086 = ~_2080;
    int _2088 = _2086 + 1;
    int _2090 = _2088 + 1;
    bool _2092 = !_2058;
    int _2094 = _2092 ? 0 : 1;
    float _2096 = -_2084;
    float _2098 = fma(_1956, 2.0, _2096);
    bool _2100 = _1636 != 3;
    int _2102 = _2012 + 8;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    uint _2106 = uint(int(uint(int(_2104)) >> uint(2)));
    int _2108 = int(_2104) & 3;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[int(_2106)][_2108];
    int _2112 = int(_2104) + 1;
    uint _2114 = uint(int(uint(_2112) >> uint(2)));
    int _2116 = _2112 & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    float _2120 = -_149;
    float _2122 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2098);
    int _2124 = ~_1700;
    int _2126 = _2124 + _1744;
    int _2128 = _2126 + 1;
    int _2130 = abs(_1690);
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2134 = _2090;
    if (!_2082)
    {
        int _2136 = ~_2080;
        int _2138 = _2136 + 1;
        _2134 = _2138;
    }
    int _2140 = _2134;
    float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2144 = _1976 + _2142;
    int _2146 = _2044 + 8;
    uint _2148 = uint(int(uint(_2146) >> uint(2)));
    uint _2150 = uint(int(uint(int(_2148)) >> uint(2)));
    int _2152 = int(_2148) & 3;
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[int(_2150)][_2152];
    int _2156 = int(_2148) + 1;
    uint _2158 = uint(int(uint(_2156) >> uint(2)));
    int _2160 = _2156 & 3;
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[int(_2158)][_2160];
    float _2164 = fma(_2004, -2.0, _2132);
    bool _2166 = uint(_2056) >= 2u;
    float _2168 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2000);
    bool _2170 = !_2100;
    int _2172 = _2170 ? 0 : (-1);
    float _2174 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2164);
    bool _2176 = _2056 != 3;
    int _2178 = _1013 * _2128;
    int _2180 = _2178 + _1340;
    int _2182 = _2166 ? 0 : 1;
    float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2186 = _2040 + _2184;
    int _2188 = abs(_2140);
    float _2190 = fma(_2054, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2122);
    int _2192 = ~_2182;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    float _2198 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2168);
    int _2200 = abs(_2038);
    int _2202 = ~_2188;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    int _2208 = _2196;
    if (_2176)
    {
        int _2210 = ~_2182;
        int _2212 = _2210 + 1;
        _2208 = _2212;
    }
    int _2214 = _2208;
    int _2216 = ~_2130;
    int _2218 = _2216 + 1;
    int _2220 = _2218 + 1;
    int _2222 = abs(_2094);
    int _2224 = abs(_1740);
    int _2226 = _2220 * as_type<int>(_2034);
    int _2228 = _2206 * as_type<int>(_2074);
    int _2230 = ~_2200;
    int _2232 = _2230 + 1;
    int _2234 = _2232 + 1;
    int _2236 = ~_2222;
    int _2238 = _2236 + 1;
    int _2240 = _2238 + 1;
    bool _2242 = _2056 != 3;
    int _2244 = _2234 * as_type<int>(_2026);
    int _2246 = _2244 + _2226;
    int _2248 = ~_2224;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = _2240 * as_type<int>(_2066);
    int _2256 = _2254 + _2228;
    int _2258 = abs(_2214);
    int _2260 = abs(_2172);
    int _2262 = _2252 * as_type<int>(_2110);
    int _2264 = _2262 + _2246;
    bool _2266 = !_2242;
    int _2268 = _2266 ? 0 : (-1);
    int _2270 = ~_2260;
    int _2272 = _2270 + 1;
    int _2274 = _2272 + 1;
    int _2276 = ~_2258;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = abs(_2268);
    int _2284 = _2274 * as_type<int>(_2118);
    int _2286 = _2284 + _2264;
    bool _2288 = !_1820;
    int _2290 = _2288 ? 0 : 1;
    int _2292 = _2280 * as_type<int>(_2154);
    int _2294 = _2292 + _2256;
    int _2296 = ~_1714;
    int _2298 = _2296 + _1762;
    int _2300 = _2298 + 1;
    float _2302 = -_211;
    int _2304 = _1676 ? as_type<int>(_2302) : as_type<int>(_211);
    int _2306 = abs(_1758);
    int _2308 = abs(_2290);
    int _2310 = ~_2282;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    bool _2316 = !_1816;
    float _2318 = _2316 ? _211 : as_type<float>(_2304);
    int _2320 = _1023 * _2300;
    int _2322 = _2320 + _1460;
    int _2324 = ~_2306;
    int _2326 = _2324 + 1;
    int _2328 = _2326 + 1;
    int _2330 = _2314 * as_type<int>(_2162);
    int _2332 = _2330 + _2294;
    int _2334 = ~_2308;
    int _2336 = _2334 + 1;
    int _2338 = _2336 + 1;
    float _2340 = _1988 * _1988;
    bool _2342 = !_1476;
    int _2344 = _2342 ? _2180 : (-1);
    int _2346 = _2286 * _2328;
    bool _2348 = !_1456;
    int _2350 = _2348 ? _2322 : (-1);
    int _2352 = _2332 * _2338;
    bool _2354 = _2198 >= 0.0;
    int _2356 = _2344 * _2306;
    int _2358 = _2356 + _2346;
    float _2360 = _2318 + (-0.5);
    int _2362 = _2350 * _2308;
    int _2364 = _2362 + _2352;
    float _2366 = fma(_2144, _2144, _2340);
    float _2368 = -_2008;
    float _2370 = _2368 + 1.0;
    float _2372 = -_2360;
    float _2374 = -_2174;
    float _2376 = fma(_2372, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2374);
    float _2378 = -_2014;
    float _2380 = _2378 + 1.0;
    float _2382 = fma(_2186, _2186, _2366);
    float _2384 = _967 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2386 = fma(_2318, _2048, _2376);
    float _2388 = _965 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2390 = _969 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_2354)
    {
        _973 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2392 = _973;
    float _2394 = rsqrt(_2382);
    float _2396 = -_2078;
    float _2398 = fma(_1782, _2396, _1926);
    float _2400 = fma(_1804, _2370, _1908);
    float _2402 = -_2380;
    float _2404 = fma(_1882, _2402, _2190);
    float _2406 = _2388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2408 = _2384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2410 = _2390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2412 = _1996 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2414 = as_type<int>(_2392);
    float _2416 = _2404;
    if (_2354)
    {
        float _2418 = _2392 * 5.0;
        _2414 = as_type<int>(_2418);
    }
    int _2420 = _2414;
    float _2422 = float(_2358);
    out.m_74.x = _2398;
    out.m_74.y = _2400;
    out.m_74.z = _2404;
    out.m_74.w = _2386;
    float _2424 = float(_2364);
    out.m_76.x = _2406;
    out.m_76.y = _2408;
    out.m_76.z = _2410;
    out.m_76.w = _2412;
    float _2426 = _1988 * _2394;
    float _2428 = _2144 * _2394;
    if (_2354)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7673 = as_type<float>(_2420);
        out.gl_Position.z = _7673;
    }
    out.m_78.x = _2422;
    out.m_78.y = _2424;
    if (_2354)
    {
        out.m_59.x = 0.0;
    }
    if (_2354)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2430 = -_2426;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1950);
    float _2434 = _2186 * _2394;
    float _2436 = -_2428;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1976);
    float _2440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2442 = _2432 + _2440;
    float _2444 = -_2434;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2040);
    float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2450 = _2438 + _2448;
    float _2452 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2456 = _2446 + _2454;
    float _2458 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2452);
    float _2460 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2458);
    bool _2462 = _2460 >= 0.0;
    float _2464 = _2434;
    if (_2462)
    {
        _2416 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2466 = _2416;
    int _2468 = as_type<int>(_2466);
    if (_2462)
    {
        out.m_59.x = 0.0;
    }
    if (_2462)
    {
        float _2470 = _2466 * 5.0;
        _2468 = as_type<int>(_2470);
    }
    int _2472 = _2468;
    if (_2462)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7772 = as_type<float>(_2472);
        out.gl_Position.z = _7772;
    }
    if (_2462)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2474 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2476 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2478 = floor(_2474);
    float _2480 = floor(_2476);
    float _2482 = -_2478;
    float _2484 = _2474 + _2482;
    float _2486 = -_2480;
    float _2488 = _2476 + _2486;
    float2 _7808 = float2(_2484, _2488);
    float _2490 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7808, float2(0.0), isnan(_7808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7808, float2(0.0), isnan(_7808)), level(0.0)).x;
    float _2492 = _2432 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2494 = -_2426;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1988);
    float _2498 = -_2428;
    float _2500 = fma(_2498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2144);
    float _2502 = -_2434;
    float _2504 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2186);
    float _2506 = fma(_2438, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2492);
    float _2508 = _2496 * _2496;
    float _2510 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2512 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2506);
    float _2514 = _2432 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2516 = fma(_2500, _2500, _2508);
    float _2518 = _2512 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2520 = fma(_2438, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2514);
    float _2522 = fma(_2504, _2504, _2516);
    float _2524 = 1.0 / _2518;
    float _2526 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2520);
    float _2528 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2530 = _2526 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2532 = sqrt(_2522);
    float _2534 = _2530 + _2518;
    float _2536 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2538 = _2432 + _2528;
    float _2540 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2542 = _2534 * _2524;
    float _2544 = _2542 * 0.5;
    float _2546 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2548 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2540);
    float _2550 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2552 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2550);
    float _2554 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2556 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2546);
    float _2558 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2548);
    float _2560 = _2394 * _2532;
    float _2562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _2564 = 1.0 / _2552;
    float _2566 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2568 = _2560 * _2554;
    float _2570 = _2560 * _2536;
    float _2572 = _2560 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2574 = _2572 * 0.5;
    float _2576 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2556);
    float _2578 = _2562 * _2568;
    float _2580 = _2510 * _2570;
    float _2582 = trunc(_2566);
    int _2584 = int(_2582);
    float _2586 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2588 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2590 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2592 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2586);
    float _2594 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2588);
    float _2596 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2598 = _2564 * _2596;
    float _2600 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2592);
    float _2602 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2594);
    bool _2604 = _2598 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2606 = _2598 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2608 = _2602 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _2610 = !_2604;
    int _2612 = _2610 ? 0 : 1;
    float _2614 = _1976 + _2608;
    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2618 = _2614 + _2616;
    int _2620 = 2;
    float _2622 = _2580;
    float _2624 = _2566;
    if (!_2604)
    {
        _2620 = 1;
    }
    int _2626 = _2620;
    int _2628 = _2626;
    if (!_2606)
    {
        _2628 = _2612;
    }
    int _2630 = _2628;
    float _2632 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _2634 = _2630 << 6;
    float _2636 = _2040 + _2632;
    int _2638 = _2634 + 48;
    uint _2640 = uint(int(uint(_2638) >> uint(2)));
    uint _2642 = uint(int(uint(int(_2640)) >> uint(2)));
    int _2644 = int(_2640) & 3;
    float _2646 = (*spvDescriptorSet0.vp_c15)._m0[int(_2642)][_2644];
    int _2648 = int(_2640) + 1;
    uint _2650 = uint(int(uint(_2648) >> uint(2)));
    int _2652 = _2648 & 3;
    float _2654 = (*spvDescriptorSet0.vp_c15)._m0[int(_2650)][_2652];
    float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2658 = _2636 + _2656;
    float _2660 = _2658 * _2658;
    int _2662 = _2634 + 56;
    uint _2664 = uint(int(uint(_2662) >> uint(2)));
    uint _2666 = uint(int(uint(int(_2664)) >> uint(2)));
    int _2668 = int(_2664) & 3;
    float _2670 = (*spvDescriptorSet0.vp_c15)._m0[int(_2666)][_2668];
    int _2672 = int(_2664) + 1;
    uint _2674 = uint(int(uint(_2672) >> uint(2)));
    int _2676 = _2672 & 3;
    float _2678 = (*spvDescriptorSet0.vp_c15)._m0[int(_2674)][_2676];
    float _2680 = fma(_2618, _2618, _2660);
    float _2682 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2590);
    float _2684 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2686 = sqrt(_2680);
    float _2688 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2682);
    int _2690 = _2634 + 64;
    uint _2692 = uint(int(uint(_2690) >> uint(2)));
    uint _2694 = uint(int(uint(int(_2692)) >> uint(2)));
    int _2696 = int(_2692) & 3;
    float _2698 = (*spvDescriptorSet0.vp_c15)._m0[int(_2694)][_2696];
    int _2700 = int(_2692) + 1;
    uint _2702 = uint(int(uint(_2700) >> uint(2)));
    int _2704 = _2700 & 3;
    float _2706 = (*spvDescriptorSet0.vp_c15)._m0[int(_2702)][_2704];
    float _2708 = _2688 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2710 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2712 = _2584 + _2710;
    int _2714 = _2712 + 1;
    float _2716 = trunc(_2684);
    int _2718 = int(_2716);
    float _2720 = _1950 + _2708;
    int _2722 = _2634 + 72;
    uint _2724 = uint(int(uint(_2722) >> uint(2)));
    uint _2726 = uint(int(uint(int(_2724)) >> uint(2)));
    int _2728 = int(_2724) & 3;
    float _2730 = (*spvDescriptorSet0.vp_c15)._m0[int(_2726)][_2728];
    int _2732 = int(_2724) + 1;
    uint _2734 = uint(int(uint(_2732) >> uint(2)));
    int _2736 = _2732 & 3;
    float _2738 = (*spvDescriptorSet0.vp_c15)._m0[int(_2734)][_2736];
    bool _2740 = _2686 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2742 = _2634 + 96;
    uint _2744 = uint(int(uint(_2742) >> uint(2)));
    uint _2746 = uint(int(uint(int(_2744)) >> uint(2)));
    int _2748 = int(_2744) & 3;
    float _2750 = (*spvDescriptorSet0.vp_c15)._m0[int(_2746)][_2748];
    int _2752 = int(_2744) + 1;
    uint _2754 = uint(int(uint(_2752) >> uint(2)));
    int _2756 = _2752 & 3;
    float _2758 = (*spvDescriptorSet0.vp_c15)._m0[int(_2754)][_2756];
    int _2760 = _2634 + 104;
    uint _2762 = uint(int(uint(_2760) >> uint(2)));
    uint _2764 = uint(int(uint(int(_2762)) >> uint(2)));
    int _2766 = int(_2762) & 3;
    float _2768 = (*spvDescriptorSet0.vp_c15)._m0[int(_2764)][_2766];
    int _2770 = int(_2762) + 1;
    uint _2772 = uint(int(uint(_2770) >> uint(2)));
    int _2774 = _2770 & 3;
    float _2776 = (*spvDescriptorSet0.vp_c15)._m0[int(_2772)][_2774];
    float _2778 = _2708;
    float _2780 = _2636;
    if (!_2740)
    {
        _2778 = _2614;
    }
    float _2782 = _2778;
    float _2784 = _2782;
    if (!_2740)
    {
        _2622 = _2720;
    }
    float _2786 = _2622;
    bool _2788 = !_2740;
    float _2790 = _2786;
    int _2792 = as_type<int>(_2750);
    int _2794 = as_type<int>(_2776);
    int _2796 = as_type<int>(_2706);
    if (!_2788)
    {
        float _2798 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2802 = _2686 + _2800;
        float _2804 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2806 = rsqrt(_2680);
        float _2808 = _2802 * _2798;
        float _2810 = _2808 * 0.15915493667125701904296875;
        float _2812 = _2810 * 6.283185482025146484375;
        float _2814 = sin(_2812);
        float _2816 = _2810 * 6.283185482025146484375;
        float _2818 = cos(_2816);
        float _2820 = fma(_2814, _2804, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2822 = _2806 * _2820;
        float _2824 = _2818 + (-1.0);
        float _2826 = fma(_2618, _2822, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2828 = fma(_2658, _2822, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2830 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2832 = fma(_2720, _2818, _2830);
        _2790 = _2832;
        _2784 = _2826;
        _2780 = _2828;
    }
    float _2834 = _2790;
    float _2836 = _2784;
    float _2838 = _2780;
    float _2840 = -_1950;
    float _2842 = _2840 + _2834;
    int _2844 = _2634 + 80;
    uint _2846 = uint(int(uint(_2844) >> uint(2)));
    uint _2848 = uint(int(uint(int(_2846)) >> uint(2)));
    int _2850 = int(_2846) & 3;
    float _2852 = (*spvDescriptorSet0.vp_c15)._m0[int(_2848)][_2850];
    int _2854 = int(_2846) + 1;
    uint _2856 = uint(int(uint(_2854) >> uint(2)));
    int _2858 = _2854 & 3;
    float _2860 = (*spvDescriptorSet0.vp_c15)._m0[int(_2856)][_2858];
    float _2862 = -_1976;
    float _2864 = _2862 + _2836;
    int _2866 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2868 = _2718 + _2866;
    int _2870 = _2868 + 1;
    float _2872 = _2842 * _2842;
    float _2874 = -_2040;
    float _2876 = _2874 + _2838;
    bool _2878 = _2714 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2880 = _2538 * _2758;
    float _2882 = fma(_2864, _2864, _2872);
    int _2884 = _2714 | _2870;
    float _2886 = fma(_2438, _2750, _2880);
    float _2888 = fma(_2876, _2876, _2882);
    bool _2890 = _2884 < 0;
    bool _2892 = _2890 || _2878;
    float _2894 = _2538 * _2654;
    float _2896 = fma(_2446, _2768, _2886);
    float _2898 = sqrt(_2888);
    bool _2900 = _2870 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2902 = _2900 || _2892;
    float _2904 = _2538 * _2706;
    float _2906 = _2896 + _2776;
    float _2908 = fma(_2438, _2646, _2894);
    bool _2910 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2912 = isnan(0.5);
    bool _2914 = _2910 || _2912;
    bool _2916 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2918 = _2914 || _2916;
    float _2920 = fma(_2438, _2698, _2904);
    float _2922 = 1.0 / _2906;
    float _2924 = fma(_2446, _2670, _2908);
    float _2926 = fma(_2446, _2730, _2920);
    int _2928 = as_type<int>(_2904);
    float _2930 = _2836;
    float _2932 = _2834;
    float _2934 = _2838;
    if (!_2902)
    {
        int _2936 = _2870 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2938 = _2936 + _2714;
        _2792 = _2938;
    }
    int _2940 = _2792;
    bool _2942 = _2898 > 0.0;
    float _2944 = _2758;
    if (!_2902)
    {
        float _2946 = floor(_2566);
        _2944 = _2946;
    }
    float _2948 = _2944;
    if (!_2902)
    {
        int _2950 = _2940 << 2;
        _2794 = _2950;
    }
    int _2952 = _2794;
    if (!_2902)
    {
        uint _2954 = uint(int(uint(_2940) >> uint(2)));
        _2796 = int(_2954);
    }
    int _2956 = _2796;
    int _2958 = _2956;
    if (!_2902)
    {
        int _2960 = 12 & _2952;
        _2928 = _2960;
    }
    int _2962 = _2928;
    float _2964 = _2924 + _2678;
    if (!_2902)
    {
        int _2966 = _2956 << 4;
        int _2968 = _2966 + _2962;
        _2958 = _2968;
    }
    int _2970 = _2958;
    bool _2972 = !_2942;
    if (!_2972)
    {
        float _2974 = _201 * _201;
        float _2976 = rsqrt(_2888);
        float _2978 = fma(_199, _199, _2974);
        float _2980 = fma(_203, _203, _2978);
        float _2982 = sqrt(_2980);
        float _2984 = _2864 * _2976;
        float _2986 = _2842 * _2976;
        float _2988 = _2876 * _2976;
        bool _2990 = _2982 > 0.0;
        bool _2992 = !_2990;
        if (!_2992)
        {
            float _2994 = rsqrt(_2980);
            float _2996 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2998 = _201 * _2994;
            float _3000 = _199 * _2994;
            float _3002 = _203 * _2994;
            float _3004 = _2986 * _2998;
            float _3006 = fma(_2984, _3000, _3004);
            float _3008 = _2996 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3010 = fma(_2988, _3002, _3006);
            float _3012 = _3010 * _3008;
            float _3014 = fma(_199, _3012, _2836);
            float _3016 = fma(_201, _3012, _2834);
            float _3018 = fma(_203, _3012, _2838);
            _2930 = _3014;
            _2932 = _3016;
            _2934 = _3018;
        }
    }
    float _3020 = _2930;
    float _3022 = _2932;
    float _3024 = _2934;
    float _3026 = -_2428;
    float _3028 = fma(_3026, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3020);
    float _3030 = -_2426;
    float _3032 = fma(_3030, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3022);
    float _3034 = -_2434;
    float _3036 = fma(_3034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3024);
    float _3038 = _2926 + _2738;
    float _3040 = _3032;
    float _3042 = _3028;
    float _3044 = _3036;
    if (!_2918)
    {
        float _3046 = _2442 * _2442;
        float _3048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3050 = -_2040;
        float _3052 = _3050 + _3024;
        float _3054 = fma(_2450, _2450, _3046);
        float _3056 = fma(_2456, _2456, _3054);
        float _3058 = 1.0 / _2560;
        float _3060 = sqrt(_3056);
        float _3062 = precise::min(_3060, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3064 = _3062 * _3048;
        float _3066 = -_1950;
        float _3068 = _3066 + _3022;
        float _3070 = _3064 * _3058;
        float _3072 = -_1976;
        float _3074 = _3072 + _3020;
        float _3076 = fma(_3068, _3070, _2432);
        float _3078 = fma(_3074, _3070, _2438);
        float _3080 = fma(_3052, _3070, _2446);
        _3040 = _3076;
        _3042 = _3078;
        _3044 = _3080;
    }
    float _3082 = _3040;
    float _3084 = _3042;
    float _3086 = _3044;
    float _3088 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3090 = _2040;
    if (!_2902)
    {
        int _3092 = _2970 + 400;
        uint _3094 = uint(int(uint(_3092) >> uint(2)));
        uint _3096 = uint(int(uint(int(_3094)) >> uint(2)));
        int _3098 = int(_3094) & 3;
        float _3100 = (*spvDescriptorSet0.vp_c15)._m0[int(_3096)][_3098];
        _3090 = _3100;
    }
    float _3102 = _3090;
    float _3104 = _3038 * _2922;
    float _3106 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3108 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3088);
    float _3110 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3112 = _2964 * _2922;
    float _3114 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3106);
    float _3116 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3108);
    int _3118 = _2634 + 88;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    uint _3122 = uint(int(uint(int(_3120)) >> uint(2)));
    int _3124 = int(_3120) & 3;
    float _3126 = (*spvDescriptorSet0.vp_c15)._m0[int(_3122)][_3124];
    int _3128 = int(_3120) + 1;
    uint _3130 = uint(int(uint(_3128) >> uint(2)));
    int _3132 = _3128 & 3;
    float _3134 = (*spvDescriptorSet0.vp_c15)._m0[int(_3130)][_3132];
    float _3136 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3110);
    float _3138 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3114);
    float _3140 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3142 = _3116 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3144 = _3112 >= 0.0;
    float _3146 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3136);
    float _3148 = _3138 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3150 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3140);
    float _3152 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3154 = _3112 <= 1.0;
    bool _3156 = _3154 && _3144;
    float _3158 = _3146 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3160 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3150);
    float _3162 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3152);
    bool _3164 = _3104 >= 0.0;
    bool _3166 = _3164 && _3156;
    float _3168 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3170 = _3160 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3172 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3162);
    bool _3174 = _3104 <= 1.0;
    bool _3176 = _3174 && _3166;
    float _3178 = _3158 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3180 = _1976;
    float _3182 = _3168;
    if (!_2902)
    {
        float _3184 = floor(_2684);
        _3180 = _3184;
    }
    float _3186 = _3180;
    float _3188 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3172);
    float _3190 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3192 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3194 = -_3178;
    float _3196 = fma(_3194, _3168, 1.0);
    float _3198 = _2538 * _2860;
    float _3200 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3190);
    float _3202 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3192);
    float _3204 = 1.0 / _3188;
    float _3206 = _3188;
    if (!_2902)
    {
        float _3208 = -_2948;
        float _3210 = _2566 + _3208;
        _2464 = _3210;
    }
    float _3212 = _2464;
    if (_3176)
    {
        float _3214 = float(_2630);
        _3182 = _3214;
    }
    float _3216 = _3182;
    float _3218 = fma(_2438, _2852, _3198);
    float _3220 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3200);
    float _3222 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3202);
    float _3224 = log2(_3196);
    float _3226 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3220);
    float _3228 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3222);
    float _3230 = _3186;
    if (!_2902)
    {
        float _3232 = -_3186;
        float _3234 = _2684 + _3232;
        _3230 = _3234;
    }
    float _3236 = _3230;
    float _3238 = _3198;
    float _3240 = _3236;
    if (_3176)
    {
        float _3242 = rint(_3216);
        float _3244 = precise::max(_3242, 0.0);
        uint _3246 = uint(_3244);
        uint _3248 = clamp(_3246, 0u, 65535u);
        _3238 = as_type<float>(_3248);
    }
    float _3250 = _3238;
    float _3252 = _3226 * _3204;
    float _3254 = _3228 * _3204;
    float _3256 = fma(_2446, _3126, _3218);
    float _3258 = fma(_3252, 0.5, 0.5);
    float _3260 = _3204;
    float _3262 = _3252;
    if (!_2902)
    {
        float _3264 = rint(_3102);
        float _3266 = precise::max(_3264, 0.0);
        uint _3268 = uint(_3266);
        uint _3270 = clamp(_3268, 0u, 65535u);
        _3260 = as_type<float>(_3270);
    }
    float _3272 = _3260;
    float _3274 = _3256 + _3134;
    float _3276 = _3224 * 0.693147182464599609375;
    float _3278 = fma(_3254, -0.5, 0.5);
    float _3280 = _3274 * _2922;
    float _3282 = _3276 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3284 = _3256;
    float _3286 = _3280;
    if (_3176)
    {
        float3 _9147 = float3(_3112, _3104, float(as_type<int>(_3250)));
        float3 _9151 = select(_9147, float3(0.0), isnan(_9147));
        float _3288 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9151.xy, uint(rint(_9151.z)), _3280, level(0.0));
        _3284 = _3288;
    }
    float _3290 = _3284;
    float3 _9161 = float3(_3258, _3278, _3282);
    float _3292 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9161, float3(0.0), isnan(_9161)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9161, float3(0.0), isnan(_9161)), level(0.0)).x;
    float3 _9170 = float3(_3258, _3278, _3282);
    float4 _3295 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9170, float3(0.0), isnan(_9170)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9170, float3(0.0), isnan(_9170)), level(0.0)).xyzw;
    float _3297 = _3295.x;
    float _3299 = _3295.y;
    float _3301 = _3295.z;
    float _3303 = _3295.w;
    float _3305 = _3212;
    if (!_2902)
    {
        float3 _9193 = float3(_3212, _3236, float(as_type<int>(_3272)));
        float3 _9195 = select(_9193, float3(0.0), isnan(_9193));
        float _3307 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9195.xy, uint(rint(_9195.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9195.xy, uint(rint(_9195.z)), level(0.0)).x;
        _3305 = _3307;
    }
    float _3309 = _3305;
    if (_2902)
    {
        _2624 = 1.0;
    }
    float _3311 = _2624;
    float _3313 = _3311;
    float _3315 = _3309;
    if (!_2902)
    {
        int _3317 = _2940 << 4;
        int _3319 = _3317 + 2048;
        uint _3321 = uint(int(uint(_3319) >> uint(2)));
        uint _3323 = uint(int(uint(int(_3321)) >> uint(2)));
        int _3325 = int(_3321) & 3;
        float _3327 = (*spvDescriptorSet0.vp_c15)._m0[int(_3323)][_3325];
        int _3329 = int(_3321) + 1;
        uint _3331 = uint(int(uint(_3329) >> uint(2)));
        int _3333 = _3329 & 3;
        float _3335 = (*spvDescriptorSet0.vp_c15)._m0[int(_3331)][_3333];
        int _3337 = _3319 + 8;
        uint _3339 = uint(int(uint(_3337) >> uint(2)));
        uint _3341 = uint(int(uint(int(_3339)) >> uint(2)));
        int _3343 = int(_3339) & 3;
        float _3345 = (*spvDescriptorSet0.vp_c15)._m0[int(_3341)][_3343];
        int _3347 = int(_3339) + 1;
        uint _3349 = uint(int(uint(_3347) >> uint(2)));
        int _3351 = _3347 & 3;
        float _3353 = (*spvDescriptorSet0.vp_c15)._m0[int(_3349)][_3351];
        float _3355 = _2538 * _3335;
        float _3357 = fma(_2438, _3327, _3355);
        float _3359 = fma(_2446, _3345, _3357);
        float _3361 = _3359 + _3353;
        float _3363 = precise::clamp(_3361, 0.0, 1.0);
        float _3365 = -_3363;
        float _3367 = _3365 + _3309;
        float _3369 = fma(_3367, 500.0, 1.5);
        float _3371 = exp2(_3369);
        float _3373 = 0.0 + _3371;
        float _3375 = precise::clamp(_3373, 0.0, 1.0);
        _3262 = _3335;
        _3240 = _3327;
        _3313 = _3375;
    }
    float _3377 = _3262;
    float _3379 = _3240;
    float _3381 = _3313;
    float _3383 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3385 = _3082 + _3383;
    float _3387 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3389 = _3084 + _3387;
    float _3391 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3393 = _3086 + _3391;
    float _3395 = _3385 * _3385;
    float _3397 = fma(_3389, _3389, _3395);
    float _3399 = fma(_3393, _3393, _3397);
    float _3401 = rsqrt(_3399);
    float _3403 = _3401 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3405 = _3389 * _3403;
    float _3407 = _3393 * _3403;
    float _3409 = _3405 * _3405;
    float _3411 = _3407 * _3407;
    float _3413 = _3409 + _3411;
    float _3415 = sqrt(_3413);
    bool _3417 = _3415 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3419 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3421 = _3415 + _3419;
    float _3423 = _3401;
    float _3425 = _3421;
    float _3427 = _3377;
    float _3429 = _3385;
    float _3431 = _3403;
    if (_3417)
    {
        float _3433 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3423 = _3433;
    }
    float _3435 = _3423;
    if (_3417)
    {
        float _3437 = _3421 * _3435;
        _3425 = _3437;
    }
    float _3439 = _3425;
    if (_3417)
    {
        float _3441 = _3439 * 0.15915493667125701904296875;
        _3427 = _3441;
    }
    float _3443 = _3427;
    float _3445 = _3393;
    float _3447 = _3443;
    if (_3417)
    {
        float _3449 = _3443 * 6.283185482025146484375;
        float _3451 = sin(_3449);
        _3445 = _3451;
    }
    float _3453 = _3445;
    float _3455 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3457 = precise::max(0.0, _3455);
    float _3459 = _3379;
    float _3461 = _3457;
    if (_3417)
    {
        float _3463 = _3443 * 6.283185482025146484375;
        float _3465 = cos(_3463);
        _3459 = _3465;
    }
    float _3467 = _3459;
    float _3469 = -_3403;
    float _3471 = -_3457;
    float _3473 = fma(_3385, _3469, _3471);
    float _3475 = _3455;
    if (_3417)
    {
        float _3477 = rsqrt(_3413);
        _3475 = _3477;
    }
    float _3479 = _3475;
    if (_3417)
    {
        float _3481 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3461 = _3481;
    }
    float _3483 = _3461;
    float _3485 = _3483;
    if (!_3417)
    {
        _3447 = _3409;
    }
    float _3487 = _3447;
    float _3489 = _3453;
    float _3491 = _3487;
    if (_3417)
    {
        float _3493 = fma(_3453, _3483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3485 = _3493;
    }
    float _3495 = _3485;
    float _3497 = _3495;
    if (!_3417)
    {
        _3489 = _3407;
    }
    float _3499 = _3489;
    float _3501 = _3499;
    float _3503 = _3467;
    if (_3417)
    {
        float _3505 = _3467 + (-1.0);
        _3429 = _3505;
    }
    float _3507 = _3429;
    if (_3417)
    {
        float _3509 = _3507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3431 = _3509;
    }
    float _3511 = _3431;
    float _3513 = sqrt(_3399);
    float _3515 = _3479;
    if (_3417)
    {
        float _3517 = _3479 * _3495;
        _3315 = _3517;
    }
    float _3519 = _3315;
    if (!_3417)
    {
        _3497 = _3405;
    }
    float _3521 = _3497;
    float _3523 = _3521;
    if (!_3417)
    {
        _3515 = _3473;
    }
    float _3525 = _3515;
    float _3527 = _3525;
    if (_3417)
    {
        float _3529 = _3405 * _3519;
        _3523 = _3529;
    }
    float _3531 = _3523;
    if (_3417)
    {
        float _3533 = fma(_3473, _3467, _3511);
        _3527 = _3533;
    }
    float _3535 = _3527;
    if (_3417)
    {
        float _3537 = _3407 * _3519;
        _3501 = _3537;
    }
    float _3539 = _3501;
    if (!_3417)
    {
        _3503 = _3411;
    }
    float _3541 = _3503;
    float _3543 = _3541;
    if (_3417)
    {
        float _3545 = _3531 * _3531;
        _3491 = _3545;
    }
    float _3547 = _3491;
    if (_3417)
    {
        float _3549 = _3539 * _3539;
        _3543 = _3549;
    }
    float _3551 = _3543;
    float _3553 = fma(_3535, _3535, _3547);
    float _3555 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3557 = fma(_3513, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3555);
    float _3559 = precise::clamp(_3557, 0.0, 1.0);
    float _3561 = _3553 + _3551;
    float _3563 = -_3559;
    float _3565 = _3563 + 1.0;
    float _3567 = rsqrt(_3561);
    float _3569 = _3567 * _3535;
    float _3571 = _3567 * _3531;
    float _3573 = abs(_3565);
    float _3575 = log2(_3573);
    float _3577 = _3567 * _3539;
    float _3579 = _3571 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3581 = -_3579;
    float _3583 = fma(_3569, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3581);
    float _3585 = -_3577;
    float _3587 = fma(_3585, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3583);
    float _3589 = fma(_3587, -0.5, 0.5);
    float _3591 = _3575 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3593 = fma(_3587, 0.5, 0.5);
    float _3595 = sqrt(_3589);
    float _3597 = fma(_3593, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3599 = fma(_3593, _3597, -0.212114393711090087890625);
    float _3601 = _3569 + 1.0;
    float _3603 = exp2(_3591);
    float _3605 = fma(_3593, _3599, 1.570728778839111328125);
    float _3607 = _3595 * 0.636619746685028076171875;
    float _3609 = -_3605;
    float _3611 = fma(_3607, _3609, 1.0);
    float _3613 = -_3569;
    float _3615 = fma(_3603, _3601, _3613);
    float _3617 = fma(_3615, 0.5, 0.5);
    float2 _9671 = float2(_3611, _3617);
    float3 _3621 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9671, float2(0.0), isnan(_9671)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9671, float2(0.0), isnan(_9671)), level(0.0)).xyz;
    float _3623 = _3621.x;
    float _3625 = _3621.y;
    float _3627 = _3621.z;
    float _3629 = abs(_2598);
    float _3631 = log2(_3629);
    float _3633 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3635 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3637 = fma(_3633, _3633, 1.0);
    float _3639 = -_2490;
    float _3641 = _3639 + 1.0;
    float _3643 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3635);
    float _3645 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3647 = _3633 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3649 = _2598 <= 8000.0;
    bool _3651 = isnan(_2598);
    bool _3653 = _3649 || _3651;
    bool _3655 = isnan(8000.0);
    bool _3657 = _3653 || _3655;
    float _3659 = float(_3657);
    float _3661 = rsqrt(_3637);
    float _3663 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3643);
    float _3665 = fma(_3645, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3647);
    out.m_80.x = _3084;
    out.m_80.y = _3082;
    out.m_80.z = _3086;
    float _3667 = _3631 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _3669 = _3513 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3671 = isnan(_3513);
    bool _3673 = _3669 || _3671;
    bool _3675 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3677 = _3673 || _3675;
    float _3679 = exp2(_3667);
    out.m_82.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_82.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_82.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _3681 = _3633 * _3661;
    float _3683 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3685 = _3681 * _3683;
    float _3687 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3689 = _3681 * _3687;
    float _3691 = fma(_3661, (*spvDescriptorSet0.vp_c8)._m0[24].y, _3685);
    float _3693 = fma(_3661, (*spvDescriptorSet0.vp_c8)._m0[26].y, _3689);
    float _3695 = fma(_3679, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3697 = precise::clamp(_3695, 0.0, 1.0);
    float _3699 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3701 = _3681 * _3699;
    float _3703 = _3633 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3705 = _3633 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3707 = fma(_3697, -2.0, 3.0);
    float _3709 = _3697 * _3697;
    float _3711 = fma(_3645, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3703);
    float _3713 = fma(_3645, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3705);
    float _3715 = _3575 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3717 = _3709 * _3707;
    float _3719 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3663);
    float _3721 = fma(_3661, (*spvDescriptorSet0.vp_c8)._m0[25].y, _3701);
    float _3723 = -_3717;
    float _3725 = _3723 + 1.0;
    float _3727 = exp2(_3715);
    out.gl_Position.x = _3226;
    out.gl_Position.y = _3228;
    out.gl_Position.z = _3719;
    out.gl_Position.w = _3188;
    float _3729 = fma(_3725, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3717);
    float _3731 = _3719 + _3188;
    out.m_84.x = _3691;
    out.m_84.y = _3721;
    out.m_84.z = _3693;
    float _3733 = _3659 * _3729;
    float _3735 = _3731 * 0.5;
    float _3737 = _3731;
    float _3739 = _3711;
    if (!_3176)
    {
        _3737 = 1.0;
    }
    float _3741 = _3737;
    float _3743 = _3733 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3745 = _3741;
    if (_3176)
    {
        bool _3747 = _3290 >= _3280;
        bool _3749 = isnan(_3290);
        bool _3751 = _3747 || _3749;
        bool _3753 = isnan(_3280);
        bool _3755 = _3751 || _3753;
        float _3757 = float(_3755);
        _3745 = _3757;
    }
    float _3759 = _3745;
    out.m_86.z = _3735;
    out.m_86.w = _3188;
    if (!_3677)
    {
        _3286 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3761 = _3286;
    float _3763 = _3641 * _3743;
    float _3765 = precise::clamp(_3763, 0.0, 1.0);
    float _3767 = -_3727;
    float _3769 = _3767 + 1.0;
    float _3771 = _3759 * _3381;
    float _3773 = _3665 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3775 = -_3765;
    float _3777 = fma(_3775, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3779 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3781 = _3711 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3783 = _3713 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3785 = -_3771;
    float _3787 = fma(_3785, _3777, 1.0);
    float _3789 = precise::clamp(_3787, 0.0, 1.0);
    float _3791 = _3779 * _3292;
    float _3793 = -_3779;
    float _3795 = _3793 + 1.0;
    float _3797 = _3789;
    float _3799 = _3791;
    float _3801 = _3761;
    float _3803 = _3761;
    if (!_3677)
    {
        _3739 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3805 = _3739;
    float _3807 = _3789 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3809 = _3303 * _3791;
    float _3811 = _3303 * _3795;
    out.m_88.x = _3773;
    out.m_88.y = _3781;
    out.m_88.z = _3783;
    float _3813 = _3809;
    float _3815 = _3805;
    float _3817 = _3805;
    if (!_3677)
    {
        _3797 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3819 = _3797;
    float _3821 = _3819;
    float _3823 = _3819;
    if (!_3677)
    {
        _3206 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3825 = _3206;
    out.m_90.x = _3807;
    float _3827 = _3627 * _3791;
    float _3829 = fma(_3623, _3809, _3297);
    float _3831 = fma(_3625, _3809, _3299);
    float _3833 = _3825;
    float _3835 = _3825;
    if (!_3677)
    {
        _3799 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3837 = _3799;
    float _3839 = fma(_3303, _3827, _3301);
    float _3841 = _3837;
    float _3843 = _3837;
    if (!_3677)
    {
        _3813 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3845 = _3813;
    out.m_92.x = _3829;
    out.m_92.y = _3831;
    out.m_92.z = _3839;
    out.m_92.w = _3811;
    bool _3847 = !_3677;
    float _3849 = _3845;
    float _3851 = _3845;
    if (!_3847)
    {
        bool _3853 = _3513 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3855 = isnan(_3513);
        bool _3857 = _3853 || _3855;
        bool _3859 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3861 = _3857 || _3859;
        if (!_3861)
        {
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3865 = _3513 + _3863;
            float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3869 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3867;
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3873 = _3871 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3877 = _3875 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3879 = 1.0 / _3869;
            float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3893 = _3865 * _3879;
            float _3895 = precise::clamp(_3893, 0.0, 1.0);
            float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3901 = fma(_3895, _3873, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3903 = fma(_3895, _3877, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3905 = fma(_3895, _3899, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3907 = fma(_3895, _3883, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3909 = fma(_3895, _3887, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3911 = fma(_3895, _3891, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3817 = _3903;
            _3835 = _3909;
            _3843 = _3901;
            _3803 = _3907;
            _3823 = _3905;
            _3851 = _3911;
            _3913 = true;
        }
        else
        {
            bool _3915 = _3513 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3917 = isnan(_3513);
            bool _3919 = _3915 || _3917;
            bool _3921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3923 = _3919 || _3921;
            if (!_3923)
            {
                _3841 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3925 = _3841;
            _3843 = _3925;
            if (!_3923)
            {
                _3815 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3927 = _3815;
            _3817 = _3927;
            if (!_3923)
            {
                _3821 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3929 = _3821;
            _3823 = _3929;
            if (!_3923)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3931 = _3801;
            _3803 = _3931;
            if (!_3923)
            {
                _3833 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3933 = _3833;
            _3835 = _3933;
            if (!_3923)
            {
                _3849 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3935 = _3849;
            bool _3937 = !_3923;
            _3851 = _3935;
            if (!_3937)
            {
                bool _3939 = _3513 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3941 = isnan(_3513);
                bool _3943 = _3939 || _3941;
                bool _3945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3947 = _3943 || _3945;
                if (!_3947)
                {
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3951 = _3513 + _3949;
                    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3955 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3953;
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3963 = _3961 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3965 = 1.0 / _3955;
                    float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3979 = _3951 * _3965;
                    float _3981 = precise::clamp(_3979, 0.0, 1.0);
                    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3987 = fma(_3981, _3959, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3989 = fma(_3981, _3963, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3991 = fma(_3981, _3985, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3993 = fma(_3981, _3969, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3995 = fma(_3981, _3973, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3997 = fma(_3981, _3977, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3817 = _3989;
                    _3835 = _3995;
                    _3843 = _3987;
                    _3803 = _3993;
                    _3823 = _3991;
                    _3851 = _3997;
                    _3913 = true;
                }
                else
                {
                    _3817 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3835 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3843 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3823 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3851 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3913 = false;
    float _3999 = _3817;
    float _4001 = _3835;
    float _4003 = _3843;
    float _4005 = _3803;
    float _4007 = _3823;
    float _4009 = _3851;
    float _4011 = fma(_3781, -0.5, 0.5);
    float _4013 = precise::clamp(_4011, 0.0, 1.0);
    float _4015 = -_3999;
    float _4017 = _4015 + _4001;
    float _4019 = -_4003;
    float _4021 = _4019 + _4005;
    float _4023 = -_4007;
    float _4025 = _4023 + _4009;
    bool _4027 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4029 = fma(_4013, _4017, _3999);
    float _4031 = fma(_4013, _4021, _4003);
    float _4033 = fma(_4013, _4025, _4007);
    float _4035 = _4029 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _4037 = fma(_4031, 0.298911988735198974609375, _4035);
    float _4039 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4041 = fma(_4033, 0.114477999508380889892578125, _4037);
    out.m_59.x = _4039;
    float _4043 = -_4041;
    float _4045 = _4031 + _4043;
    float _4047 = -_4041;
    float _4049 = _4029 + _4047;
    float _4051 = -_4041;
    float _4053 = _4033 + _4051;
    float _4055 = fma(_4045, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4041);
    float _4057 = fma(_4049, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4041);
    float _4059 = fma(_4053, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4041);
    out.m_96.x = _4055;
    out.m_96.y = _4057;
    out.m_96.z = _4059;
    if (!_4027)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4061 = -_3082;
    float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4065 = -_3084;
    float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4069 = -_3086;
    float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4073 = _4063 * _4063;
    float _4075 = fma(_4067, _4067, _4073);
    float _4077 = fma(_4071, _4071, _4075);
    float _4079 = sqrt(_4077);
    float _4081 = rsqrt(_4077);
    float _4083 = -_4079;
    float _4085 = _4083 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4087 = _4085 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4089 = precise::clamp(_4087, 0.0, 1.0);
    float _4091 = _4067 * _4081;
    float _4093 = _4063 * _4081;
    float _4095 = abs(_4089);
    float _4097 = log2(_4095);
    float _4099 = _4071 * _4081;
    float _4101 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4103 = _3781 * _4093;
    float _4105 = -_4093;
    float _4107 = -_4101;
    float _4109 = fma(_4105, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4107);
    float _4111 = fma(_3773, _4091, _4103);
    float _4113 = -_4099;
    float _4115 = fma(_4113, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4109);
    float _4117 = fma(_3783, _4099, _4111);
    float _4119 = precise::clamp(_4117, 0.0, 1.0);
    float _4121 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4123 = _4115 + _4121;
    float _4125 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4127 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4129 = precise::clamp(_4127, 0.0, 1.0);
    float _4131 = exp2(_4125);
    float _4133 = _4131 * _4129;
    float _4135 = _4119 * _4133;
    float _4137 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4139 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4141 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _4137;
    out.m_94.y = _4139;
    out.m_94.z = _4141;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3913 = false;
    bool _993 = false;
    bool _823 = false;
    bool _603 = false;
    bool _427 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_56.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_59.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4198 = as_type<float>(_131);
        out.gl_Position.z = _4198;
    }
    if (!_119)
    {
        return out;
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    if (_145)
    {
        float _153 = float(_115);
        _151 = _153;
    }
    float _155 = _151;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    if (_161)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _125;
    if (_161)
    {
        out.m_59.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _133 = as_type<int>(_165);
    }
    int _167 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4266 = as_type<float>(_167);
        out.gl_Position.z = _4266;
    }
    if (_161)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_66.x;
    float _173 = in.m_66.y;
    float _175 = in.m_66.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _193 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _195 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    float _199 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _201 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _203 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _205 = !_179;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_183;
    float _211 = _209 ? (-0.5) : 0.5;
    bool _213 = !_185;
    float _231;
    if (!_213)
    {
        float _215 = in.m_68.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_115);
        float _237 = 1.0 / _235;
        float _239 = _149 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = _241 + _247;
    bool _251 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _253 = isnan(_241);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _241 + _275;
    float _279 = 1.0 / _269;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _283 = 1.0 / _265;
    float _285 = 1.0 / _273;
    float _287 = _277 * _279;
    bool _289 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _291 = isnan(_241);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _245 * _283;
    bool _303 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_241);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_261;
    float _317 = _315 + 1.0;
    float _319 = _313 * _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _325 = _249 * _285;
    bool _327 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_241);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_313;
    float _341 = _339 + 1.0;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = _337 * _341;
    float _357 = -_337;
    float _359 = _357 + 1.0;
    float _361 = fma(_345, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = fma(_349, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _365 = fma(_323, _287, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _367 = _299 * _359;
    float _369 = fma(_353, _287, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = -_299;
    float _373 = _371 + 1.0;
    float _375 = _361 * _367;
    float _377 = _363 * _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _383;
    float _387 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _391 = fma(_381, _325, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _393 = fma(_385, _325, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _395 = fma(_365, _355, _387);
    float _397 = fma(_369, _355, _389);
    float _399 = fma(_391, _319, _395);
    float _401 = fma(_393, _319, _397);
    float _403 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].x, _399);
    float _405 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].y, _401);
    bool _407 = !_281;
    float _425;
    if (!_407)
    {
        float _409 = in.m_68.x;
        float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _413 = _409 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[11].x, _149);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        float _429 = float(_115);
        float _431 = 1.0 / _429;
        float _433 = _149 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = in.m_70.x;
    float _439 = in.m_70.y;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _443 = _435 + _441;
    bool _445 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _447 = isnan(_435);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _459 = _435 + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _469 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _471 = isnan(_435);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    bool _481 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _483 = isnan(_435);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = 1.0 / _467;
    float _495 = -_491;
    float _497 = _495 + 1.0;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _501 = 1.0 / _463;
    float _503 = _479 * _497;
    float _505 = -_479;
    float _507 = _505 + 1.0;
    float _509 = _405 * _439;
    float _511 = _459 * _493;
    float _513 = _403 * _437;
    float _515 = _443 * _501;
    float _517 = -_455;
    float _519 = _517 + 1.0;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _521;
    float _525 = _491 * _519;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _531;
    float _535 = fma(_523, _515, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _537 = fma(_529, _515, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _539 = fma(_533, _515, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _541 = _535 * _503;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _547 = _537 * _503;
    float _549 = _539 * _503;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _559 = fma(_545, _511, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[107].x, _547);
    float _563 = fma(_553, _511, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _565 = fma(_557, _511, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _567 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[107].y, _541);
    float _569 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[107].z, _549);
    float _571 = fma(_563, _525, _561);
    float _573 = fma(_559, _525, _567);
    float _575 = fma(_565, _525, _569);
    float _577 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].x, _571);
    float _579 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].y, _573);
    float _581 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].z, _575);
    bool _583 = !_499;
    float _601;
    if (!_583)
    {
        float _585 = in.m_68.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _593 = _591 * _587;
        float _595 = floor(_593);
        float _597 = -_595;
        float _599 = _593 + _597;
        _601 = _599;
        _603 = true;
    }
    else
    {
        float _605 = float(_115);
        float _607 = 1.0 / _605;
        float _609 = _149 * _607;
        _601 = _609;
    }
    _603 = false;
    float _611 = _601;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _615 = _611 + _613;
    float _617 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _631 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _633 = isnan(_611);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = 1.0 / _621;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _649 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _651 = isnan(_611);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = _579 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _663 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _665 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = 1.0 / _629;
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _675 = _625 * _643;
    bool _677 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _679 = isnan(_611);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = 1.0 / _647;
    float _691 = -_641;
    float _693 = _691 + 1.0;
    float _695 = fma(_675, _615, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _701 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _703 = isnan(_611);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -_687;
    float _715 = _713 + 1.0;
    float _717 = _687 * _693;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _723 = 1.0 / _699;
    float _725 = -_711;
    float _727 = _725 + 1.0;
    float _729 = _659 * _715;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _731;
    float _735 = _721 * _669;
    float _737 = _641 * _727;
    float _739 = _695 * _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _743 = _611 + _741;
    float _745 = -_659;
    float _747 = _745 + 1.0;
    bool _749 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _751 = isnan(_611);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _733 * _689;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _769 = _611 + _767;
    float _771 = fma(_735, _743, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _773 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[115].x, _739);
    float _775 = -_759;
    float _777 = _775 + 1.0;
    float _779 = _765 * _723;
    float _781 = fma(_761, _769, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _785 = _611 + _783;
    float _787 = fma(_771, _717, _773);
    float _789 = _711 * _777;
    float _791 = fma(_779, _785, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _793 = fma(_781, _737, _787);
    float _795 = fma(_791, _789, _793);
    float _797 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[119].x, _795);
    float _799 = _797 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _665;
    out.m_72.y = _667;
    out.m_72.z = _671;
    out.m_72.w = _799;
    bool _801 = !_673;
    float _803 = _737;
    float _821;
    if (!_801)
    {
        float _805 = in.m_68.x;
        float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _809 = _805 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[11].z, _149);
        float _813 = _811 * _807;
        float _815 = floor(_813);
        float _817 = -_815;
        float _819 = _813 + _817;
        _821 = _819;
        _823 = true;
    }
    else
    {
        float _825 = float(_115);
        float _827 = 1.0 / _825;
        float _829 = _149 * _827;
        _821 = _829;
    }
    _823 = false;
    float _831 = _821;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _835 = _831 + _833;
    bool _837 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _839 = isnan(_831);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _851 = _831 + _849;
    bool _853 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _855 = isnan(_831);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _873 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _875 = isnan(_831);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = -_847;
    float _887 = _885 + 1.0;
    float _889 = 1.0 / _871;
    float _891 = _883 * _887;
    float _893 = -_883;
    float _895 = _893 + 1.0;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _897;
    bool _901 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _903 = 1.0 / _867;
    float _905 = _863 * _895;
    float _907 = -_863;
    float _909 = _907 + 1.0;
    float _911 = _835 * _903;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _913;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _917;
    float _921 = fma(_899, _911, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _923 = fma(_915, _911, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _925 = fma(_919, _911, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _927 = _851 * _889;
    float _929 = _921 * _905;
    float _931 = _923 * _905;
    float _933 = _925 * _905;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _947 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].x, _929);
    float _949 = fma(_937, _927, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _951 = fma(_941, _927, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _953 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].y, _931);
    float _955 = fma(_945, _927, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _957 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].z, _933);
    float _959 = fma(_949, _891, _947);
    float _961 = fma(_951, _891, _953);
    float _963 = fma(_955, _891, _957);
    float _965 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[125].x, _959);
    float _967 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[125].y, _961);
    float _969 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[125].z, _963);
    bool _971 = !_901;
    float _973 = _965;
    float _991;
    if (!_971)
    {
        float _975 = in.m_68.x;
        float _977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _979 = _975 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _981 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _983 = _981 * _977;
        float _985 = floor(_983);
        float _987 = -_985;
        float _989 = _983 + _987;
        _991 = _989;
        _993 = true;
    }
    else
    {
        float _995 = float(_115);
        float _997 = 1.0 / _995;
        float _999 = _149 * _997;
        _991 = _999;
    }
    _993 = false;
    float _1001 = _991;
    float _1003 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1005 = int(_1003);
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1009 = _1007 != 0;
    float _1011 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1013 = int(_1011);
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1019 = float(_1005);
    float _1021 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1023 = int(_1021);
    if (_1009)
    {
        float _1025 = in.m_68.x;
        _803 = _1025;
    }
    float _1027 = _803;
    float _1029 = _1027;
    if (!_1009)
    {
        float _1031 = in.m_68.y;
        _1029 = _1031;
    }
    float _1033 = _1029;
    float _1035 = float(uint(_1013));
    float _1037 = 1.0 / _1019;
    int _1039 = ~_1013;
    int _1041 = _1039 + 1;
    bool _1043 = _1013 == 0;
    float _1045 = 1.0 / _1035;
    float _1047 = float(uint(_1023));
    float _1049 = _149 * _1037;
    float _1051 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1053 = int(_1051);
    int _1055 = as_type<int>(_1045) + (-2);
    float _1057 = trunc(_1049);
    int _1059 = int(_1057);
    int _1061 = ~_1013;
    int _1063 = _1061 + 1;
    float _1065 = float(_1053);
    float _1067 = 1.0 / _1047;
    float _1069 = float(uint(_1059));
    float _1071 = 1.0 / _1065;
    float _1073 = as_type<float>(_1055) * _1069;
    float _1075 = trunc(_1073);
    float _1077 = precise::max(_1075, 0.0);
    uint _1080 = uint(_1077);
    float _1082 = _149 * _1071;
    float _1084 = trunc(_1082);
    int _1086 = int(_1084);
    int _1088 = _1063 * int(_1080);
    int _1090 = _1088 + _1059;
    float _1092 = float(uint(_1090));
    float _1094 = in.m_68.x;
    float _1096 = in.m_68.y;
    float _1098 = in.m_68.z;
    float _1100 = in.m_68.w;
    float _1102 = as_type<float>(_1055) * _1092;
    float _1104 = _1092;
    if (_1009)
    {
        _1104 = 1.0;
    }
    float _1106 = _1104;
    float _1108 = _1106;
    if (!_1009)
    {
        _1108 = 7.345489978790283203125;
    }
    float _1110 = _1108;
    float _1112 = trunc(_1102);
    float _1114 = precise::max(_1112, 0.0);
    uint _1116 = uint(_1114);
    float _1118 = float(uint(_1086));
    int _1120 = int(_1080) + int(_1116);
    float _1122 = _1110 * _1094;
    float _1124 = float(_1013);
    float _1126 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1128 = float(_1059);
    int _1130 = _1041 * _1120;
    int _1132 = _1130 + _1059;
    float _1134 = _1110;
    float _1136 = _1098;
    if (_1009)
    {
        _1134 = 1.0;
    }
    float _1138 = _1134;
    float _1140 = floor(_1122);
    float _1142 = _1138;
    if (!_1009)
    {
        _1142 = 1.2345600128173828125;
    }
    float _1144 = _1142;
    float _1146 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1148 = _1128 >= _1124;
    bool _1150 = isnan(_1128);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(_1124);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = fma(_1126, -2.0, _1015);
    bool _1162 = uint(_1132) >= uint(_1013);
    float _1164 = _1033 * _1144;
    int _1166 = _1013 + (-1);
    float _1168 = -_1017;
    float _1170 = fma(_1146, 2.0, _1168);
    bool _1172 = !_1162;
    int _1174 = _1172 ? 0 : (-1);
    float _1176 = trunc(_1158);
    int _1178 = int(_1176);
    bool _1180 = _1001 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1182 = isnan(_1001);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1160);
    int _1194 = ~_1120;
    int _1196 = _1194 + _1174;
    int _1198 = _1196 + 1;
    float _1200 = -_149;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1170);
    float _1204 = float(_115);
    float _1206 = -_1140;
    float _1208 = _1122 + _1206;
    int _1210 = as_type<int>(_1067) + (-2);
    int _1212 = _1013 * _1198;
    int _1214 = _1212 + _1059;
    float _1216 = floor(_1164);
    int _1218 = ~_1023;
    int _1220 = _1218 + 1;
    float _1222 = as_type<float>(_1210) * _1118;
    bool _1224 = !_1043;
    int _1226 = _1224 ? _1214 : (-1);
    bool _1228 = _1001 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1230 = isnan(_1001);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = 1.0 / _1204;
    int _1242 = ~_1178;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    int _1248 = _1226 * _1246;
    float _1250 = trunc(_1222);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    float _1256 = -_1216;
    float _1258 = _1164 + _1256;
    int _1260 = _1178 * _1166;
    int _1262 = _1260 + _1248;
    float _1264 = _1208 * _1124;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1276 = _1274 != 0;
    float _1278 = _149 * _1240;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1282 = _1280 != 0;
    float _1284 = trunc(_1264);
    int _1286 = int(_1284);
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1290 = _1288 != 0;
    float _1292 = _1278 * _1124;
    bool _1294 = !_1272;
    int _1296 = _1294 ? 0 : 1;
    bool _1298 = !_1268;
    int _1300 = _1298 ? 0 : 1;
    int _1302 = _1220 * int(_1254);
    int _1304 = _1302 + _1086;
    int _1306 = abs(_1296);
    float _1308 = trunc(_1292);
    int _1310 = int(_1308);
    int _1312 = abs(_1300);
    float _1314 = float(uint(_1304));
    bool _1316 = !_1282;
    int _1318 = _1316 ? 0 : 1;
    bool _1320 = !_1276;
    int _1322 = _1320 ? 0 : 1;
    float _1324 = as_type<float>(_1210) * _1314;
    int _1326 = abs(_1318);
    float _1328 = trunc(_1324);
    float _1330 = precise::max(_1328, 0.0);
    uint _1332 = uint(_1330);
    bool _1334 = !_1290;
    int _1336 = _1334 ? 0 : 1;
    int _1338 = _1286 * _1326;
    int _1340 = _1338 + _1059;
    int _1342 = abs(_1322);
    int _1344 = _1262 * _1306;
    int _1346 = abs(_1336);
    float _1348 = float(_1023);
    int _1350 = _1310 * _1312;
    int _1352 = _1350 + _1344;
    int _1354 = ~_1023;
    int _1356 = _1354 + 1;
    float _1358 = float(_1086);
    int _1360 = _1340 * _1342;
    int _1362 = _1360 + _1352;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1366 = _1364 != 0;
    bool _1368 = _1358 >= _1348;
    bool _1370 = isnan(_1358);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(_1348);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    int _1380 = _1286 * _1346;
    int _1382 = _1380 + _1362;
    int _1384 = int(_1254) + int(_1332);
    float _1386 = _1258 * _1348;
    float _1388 = _1278 * _1348;
    int _1390 = _1023 + (-1);
    float _1392 = trunc(_1378);
    int _1394 = int(_1392);
    float _1396 = float(uint(_1382));
    int _1398 = _1356 * _1384;
    int _1400 = _1398 + _1086;
    float _1402 = as_type<float>(_1055) * _1396;
    bool _1404 = uint(_1400) >= uint(_1023);
    float _1406 = trunc(_1386);
    int _1408 = int(_1406);
    bool _1410 = !_1366;
    int _1412 = _1410 ? 0 : 1;
    bool _1414 = !_1404;
    int _1416 = _1414 ? 0 : (-1);
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1420 = _1418 != 0;
    int _1422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1424 = _1422 != 0;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1428 = _1426 != 0;
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1432 = _1430 != 0;
    int _1434 = ~_1384;
    int _1436 = _1434 + _1416;
    int _1438 = _1436 + 1;
    float _1440 = trunc(_1402);
    float _1442 = precise::max(_1440, 0.0);
    uint _1444 = uint(_1442);
    int _1446 = abs(_1412);
    int _1448 = ~_1013;
    int _1450 = _1448 + 1;
    int _1452 = _1023 * _1438;
    int _1454 = _1452 + _1086;
    bool _1456 = _1023 == 0;
    int _1458 = _1408 * _1446;
    int _1460 = _1458 + _1086;
    int _1462 = ~_1394;
    int _1464 = _1462 + 1;
    int _1466 = _1464 + 1;
    float _1468 = trunc(_1388);
    int _1470 = int(_1468);
    bool _1472 = !_1456;
    int _1474 = _1472 ? _1454 : (-1);
    bool _1476 = _1013 == 0;
    int _1478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1480 = _1478 != 0;
    int _1482 = _1450 * int(_1444);
    int _1484 = _1482 + _1382;
    int _1486 = _1474 * _1466;
    bool _1488 = !_1424;
    int _1490 = _1488 ? 0 : 1;
    float _1492 = float(uint(_1484));
    int _1494 = _1394 * _1390;
    int _1496 = _1494 + _1486;
    bool _1498 = !_1420;
    int _1500 = _1498 ? 0 : 1;
    int _1502 = abs(_1490);
    float _1504 = as_type<float>(_1055) * _1492;
    bool _1506 = !_1428;
    int _1508 = _1506 ? 0 : 1;
    int _1510 = abs(_1500);
    float _1512 = trunc(_1504);
    float _1514 = precise::max(_1512, 0.0);
    uint _1516 = uint(_1514);
    bool _1518 = !_1432;
    int _1520 = _1518 ? 0 : 1;
    int _1522 = _1496 * _1502;
    int _1524 = abs(_1508);
    int _1526 = abs(_1520);
    int _1528 = _1470 * _1510;
    int _1530 = _1528 + _1522;
    float _1532 = float(uint(_1340));
    int _1534 = _1460 * _1524;
    int _1536 = _1534 + _1530;
    float _1538 = float(uint(_1460));
    int _1540 = ~_1013;
    int _1542 = _1540 + 1;
    int _1544 = _1408 * _1526;
    int _1546 = _1544 + _1536;
    int _1548 = int(_1444) + int(_1516);
    float _1550 = as_type<float>(_1055) * _1532;
    float _1552 = as_type<float>(_1210) * _1538;
    float _1554 = float(uint(_1546));
    float _1556 = trunc(_1550);
    float _1558 = precise::max(_1556, 0.0);
    uint _1560 = uint(_1558);
    int _1562 = ~_1013;
    int _1564 = _1562 + 1;
    int _1566 = _1542 * _1548;
    int _1568 = _1566 + _1382;
    int _1570 = ~_1023;
    int _1572 = _1570 + 1;
    int _1574 = ~_1013;
    int _1576 = _1574 + 1;
    bool _1578 = uint(_1568) >= uint(_1013);
    float _1580 = trunc(_1552);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    float _1586 = as_type<float>(_1210) * _1554;
    int _1588 = 0;
    if (_1480)
    {
        _1588 = 0;
    }
    int _1590 = _1588;
    bool _1592 = !_1578;
    int _1594 = _1592 ? 0 : (-1);
    int _1596 = _1590;
    if (!_1480)
    {
        _1596 = 1;
    }
    int _1598 = _1596;
    float _1600 = trunc(_1586);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    int _1606 = ~_1548;
    int _1608 = _1606 + _1594;
    int _1610 = _1608 + 1;
    int _1612 = _1564 * int(_1560);
    int _1614 = _1612 + _1340;
    bool _1616 = _1094 > 0.5;
    int _1618 = _1013 * _1610;
    int _1620 = _1618 + _1382;
    int _1622 = _1572 * int(_1584);
    int _1624 = _1622 + _1460;
    float _1626 = float(uint(_1614));
    bool _1628 = !_1476;
    int _1630 = _1628 ? _1620 : (-1);
    float _1632 = float(uint(_1624));
    float _1634 = as_type<float>(_1055) * _1626;
    int _1636 = _1630 & 3;
    bool _1638 = _1636 != 0;
    int _1640 = _1572 * int(_1604);
    int _1642 = _1640 + _1546;
    int _1644 = _1630 & 3;
    bool _1646 = _1644 != 0;
    float _1648 = as_type<float>(_1210) * _1632;
    bool _1650 = uint(_1636) > 1u;
    float _1652 = trunc(_1634);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    float _1658 = float(uint(_1642));
    bool _1660 = uint(_1636) >= 2u;
    float _1662 = -_207;
    int _1664 = _1616 ? as_type<int>(_1662) : as_type<int>(_207);
    float _1666 = as_type<float>(_1210) * _1658;
    int _1668 = _1646 ? 0 : 1;
    float _1670 = trunc(_1648);
    float _1672 = precise::max(_1670, 0.0);
    uint _1674 = uint(_1672);
    bool _1676 = _1100 > 0.5;
    int _1678 = ~_1668;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    int _1684 = _1682;
    if (!_1650)
    {
        int _1686 = ~_1668;
        int _1688 = _1686 + 1;
        _1684 = _1688;
    }
    int _1690 = _1684;
    bool _1692 = _1636 != 3;
    float _1694 = trunc(_1666);
    float _1696 = precise::max(_1694, 0.0);
    uint _1698 = uint(_1696);
    int _1700 = int(_1560) + int(_1656);
    int _1702 = _1660 ? 0 : 1;
    bool _1704 = _1096 > 0.5;
    int _1706 = _1576 * _1700;
    int _1708 = _1706 + _1340;
    int _1710 = ~_1023;
    int _1712 = _1710 + 1;
    int _1714 = int(_1584) + int(_1674);
    int _1716 = ~_1702;
    int _1718 = _1716 + 1;
    int _1720 = _1718 + 1;
    bool _1722 = uint(_1708) >= uint(_1013);
    int _1724 = _1712 * _1714;
    int _1726 = _1724 + _1460;
    int _1728 = int(_1604) + int(_1698);
    int _1730 = ~_1023;
    int _1732 = _1730 + 1;
    int _1734 = _1720;
    if (_1692)
    {
        int _1736 = ~_1702;
        int _1738 = _1736 + 1;
        _1734 = _1738;
    }
    int _1740 = _1734;
    bool _1742 = !_1722;
    int _1744 = _1742 ? 0 : (-1);
    int _1746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1748 = _1746 != 0;
    int _1750 = _1732 * _1728;
    int _1752 = _1750 + _1546;
    bool _1754 = uint(_1726) >= uint(_1023);
    bool _1756 = !_1748;
    int _1758 = _1756 ? 0 : 1;
    bool _1760 = !_1754;
    int _1762 = _1760 ? 0 : (-1);
    int _1764 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1766 = _1764 != 0;
    bool _1768 = uint(_1752) >= uint(_1023);
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1774 = in.m_56.x;
    float _1776 = in.m_56.y;
    float _1778 = in.m_56.z;
    bool _1780 = !_1766;
    float _1782 = _1780 ? _207 : as_type<float>(_1664);
    float _1784 = 1.0 / _1772;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1792 = _1790 != 0;
    float _1794 = -_211;
    int _1796 = _1704 ? as_type<int>(_1794) : as_type<int>(_211);
    bool _1798 = _1098 > 0.5;
    float _1800 = 1.0 / _1788;
    bool _1802 = !_1792;
    float _1804 = _1802 ? _211 : as_type<float>(_1796);
    bool _1806 = !_1768;
    int _1808 = _1806 ? 0 : (-1);
    float _1810 = -_207;
    int _1812 = _1798 ? as_type<int>(_1810) : as_type<int>(_207);
    int _1814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1816 = _1814 != 0;
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1820 = _1818 != 0;
    float _1822 = -_1190;
    float _1824 = _1822 + 1.0;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1828 = _1826 != 0;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1830;
    bool _1834 = _1001 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1836 = isnan(_1001);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1842 = _1838 || _1840;
    float _1844 = float(_1842);
    float _1846 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1848 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1850 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1852 = _1832 * _1784;
    float _1854 = -_1844;
    float _1856 = _1854 + 1.0;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1860 = _1858 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1864 = _1001 + _1862;
    float _1866 = fma(_1774, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1846);
    float _1868 = fma(_1774, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1848);
    float _1870 = fma(_1774, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1850);
    float _1872 = _1190 * _1856;
    float _1874 = _1860 * _1800;
    float _1876 = fma(_1852, _1864, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1878 = _1238 * _1824;
    bool _1880 = !_1828;
    float _1882 = _1880 ? _207 : as_type<float>(_1812);
    float _1884 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1866);
    bool _1886 = _1598 != 1;
    float _1888 = _1876 * _1878;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1892 = _1001 + _1890;
    float _1894 = _1804 + (-0.5);
    float _1896 = -_1238;
    float _1898 = _1896 + 1.0;
    float _1900 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1868);
    float _1902 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1870);
    float _1904 = -_1894;
    float _1906 = -_1192;
    float _1908 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1906);
    float _1910 = fma(_1874, _1892, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1912 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1888);
    float _1914 = _1782 + 0.5;
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1918 = fma(_1910, _1872, _1912);
    int _1920 = ~_1728;
    int _1922 = _1920 + _1808;
    int _1924 = _1922 + 1;
    float _1926 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1202);
    float _1928 = _1874;
    float _1930 = _1870;
    float _1932 = _1888;
    if (!_1886)
    {
        _1928 = _1096;
    }
    float _1934 = _1928;
    float _1936 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1916);
    float _1938 = _1934;
    if (!_1886)
    {
        _1930 = _1096;
    }
    float _1940 = _1930;
    int _1942 = _1023 * _1924;
    int _1944 = _1942 + _1546;
    float _1946 = _1940;
    if (_1886)
    {
        _1938 = _1094;
    }
    float _1948 = _1938;
    float _1950 = _1900 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_1886)
    {
        _1946 = _1094;
    }
    float _1952 = _1946;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1886)
    {
        _1932 = _1098;
    }
    float _1958 = _1932;
    float _1960 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1954);
    float _1962 = _1958;
    if (_1886)
    {
        _1136 = _1096;
    }
    float _1964 = _1136;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1886)
    {
        _1962 = _1096;
    }
    float _1968 = _1962;
    float _1970 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1936);
    float _1972 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1966);
    int _1974 = _1630 >> 31;
    float _1976 = _1884 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1978 = !_1456;
    int _1980 = _1978 ? _1944 : (-1);
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1984 = _1974 & 3;
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = _1950 + _1986;
    int _1990 = _1980 >> 31;
    float _1992 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1982);
    int _1994 = _1630 + _1984;
    float _1996 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1918);
    int _1998 = _1990 & 3;
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2002 = _1994 >> 2;
    float _2004 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2006 = _1980 + _1998;
    float _2008 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1960);
    int _2010 = _2002 << 4;
    int _2012 = _2010 + 368;
    float _2014 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1972);
    int _2016 = _2006 >> 2;
    float _2018 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1992);
    uint _2020 = uint(int(uint(_2012) >> uint(2)));
    uint _2022 = uint(int(uint(int(_2020)) >> uint(2)));
    int _2024 = int(_2020) & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    int _2028 = int(_2020) + 1;
    uint _2030 = uint(int(uint(_2028) >> uint(2)));
    int _2032 = _2028 & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    bool _2036 = !_1638;
    int _2038 = _2036 ? 0 : 1;
    float _2040 = _1902 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2042 = _2016 << 4;
    int _2044 = _2042 + 512;
    float _2046 = -_2018;
    float _2048 = _2046 + 1.0;
    int _2050 = _1980 & 3;
    bool _2052 = _2050 != 0;
    float _2054 = _1882 + 0.5;
    int _2056 = _1980 & 3;
    bool _2058 = _2056 != 0;
    uint _2060 = uint(int(uint(_2044) >> uint(2)));
    uint _2062 = uint(int(uint(int(_2060)) >> uint(2)));
    int _2064 = int(_2060) & 3;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[int(_2062)][_2064];
    int _2068 = int(_2060) + 1;
    uint _2070 = uint(int(uint(_2068) >> uint(2)));
    int _2072 = _2068 & 3;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[int(_2070)][_2072];
    float _2076 = -_1970;
    float _2078 = _2076 + 1.0;
    int _2080 = _2052 ? 0 : 1;
    bool _2082 = uint(_2056) > 1u;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2086 = ~_2080;
    int _2088 = _2086 + 1;
    int _2090 = _2088 + 1;
    bool _2092 = !_2058;
    int _2094 = _2092 ? 0 : 1;
    float _2096 = -_2084;
    float _2098 = fma(_1956, 2.0, _2096);
    bool _2100 = _1636 != 3;
    int _2102 = _2012 + 8;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    uint _2106 = uint(int(uint(int(_2104)) >> uint(2)));
    int _2108 = int(_2104) & 3;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[int(_2106)][_2108];
    int _2112 = int(_2104) + 1;
    uint _2114 = uint(int(uint(_2112) >> uint(2)));
    int _2116 = _2112 & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    float _2120 = -_149;
    float _2122 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2098);
    int _2124 = ~_1700;
    int _2126 = _2124 + _1744;
    int _2128 = _2126 + 1;
    int _2130 = abs(_1690);
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2134 = _2090;
    if (!_2082)
    {
        int _2136 = ~_2080;
        int _2138 = _2136 + 1;
        _2134 = _2138;
    }
    int _2140 = _2134;
    float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2144 = _1976 + _2142;
    int _2146 = _2044 + 8;
    uint _2148 = uint(int(uint(_2146) >> uint(2)));
    uint _2150 = uint(int(uint(int(_2148)) >> uint(2)));
    int _2152 = int(_2148) & 3;
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[int(_2150)][_2152];
    int _2156 = int(_2148) + 1;
    uint _2158 = uint(int(uint(_2156) >> uint(2)));
    int _2160 = _2156 & 3;
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[int(_2158)][_2160];
    float _2164 = fma(_2004, -2.0, _2132);
    bool _2166 = uint(_2056) >= 2u;
    float _2168 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2000);
    bool _2170 = !_2100;
    int _2172 = _2170 ? 0 : (-1);
    float _2174 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2164);
    bool _2176 = _2056 != 3;
    int _2178 = _1013 * _2128;
    int _2180 = _2178 + _1340;
    int _2182 = _2166 ? 0 : 1;
    float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2186 = _2040 + _2184;
    int _2188 = abs(_2140);
    float _2190 = fma(_2054, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2122);
    int _2192 = ~_2182;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    float _2198 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2168);
    int _2200 = abs(_2038);
    int _2202 = ~_2188;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    int _2208 = _2196;
    if (_2176)
    {
        int _2210 = ~_2182;
        int _2212 = _2210 + 1;
        _2208 = _2212;
    }
    int _2214 = _2208;
    int _2216 = ~_2130;
    int _2218 = _2216 + 1;
    int _2220 = _2218 + 1;
    int _2222 = abs(_2094);
    int _2224 = abs(_1740);
    int _2226 = _2220 * as_type<int>(_2034);
    int _2228 = _2206 * as_type<int>(_2074);
    int _2230 = ~_2200;
    int _2232 = _2230 + 1;
    int _2234 = _2232 + 1;
    int _2236 = ~_2222;
    int _2238 = _2236 + 1;
    int _2240 = _2238 + 1;
    bool _2242 = _2056 != 3;
    int _2244 = _2234 * as_type<int>(_2026);
    int _2246 = _2244 + _2226;
    int _2248 = ~_2224;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = _2240 * as_type<int>(_2066);
    int _2256 = _2254 + _2228;
    int _2258 = abs(_2214);
    int _2260 = abs(_2172);
    int _2262 = _2252 * as_type<int>(_2110);
    int _2264 = _2262 + _2246;
    bool _2266 = !_2242;
    int _2268 = _2266 ? 0 : (-1);
    int _2270 = ~_2260;
    int _2272 = _2270 + 1;
    int _2274 = _2272 + 1;
    int _2276 = ~_2258;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = abs(_2268);
    int _2284 = _2274 * as_type<int>(_2118);
    int _2286 = _2284 + _2264;
    bool _2288 = !_1820;
    int _2290 = _2288 ? 0 : 1;
    int _2292 = _2280 * as_type<int>(_2154);
    int _2294 = _2292 + _2256;
    int _2296 = ~_1714;
    int _2298 = _2296 + _1762;
    int _2300 = _2298 + 1;
    float _2302 = -_211;
    int _2304 = _1676 ? as_type<int>(_2302) : as_type<int>(_211);
    int _2306 = abs(_1758);
    int _2308 = abs(_2290);
    int _2310 = ~_2282;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    bool _2316 = !_1816;
    float _2318 = _2316 ? _211 : as_type<float>(_2304);
    int _2320 = _1023 * _2300;
    int _2322 = _2320 + _1460;
    int _2324 = ~_2306;
    int _2326 = _2324 + 1;
    int _2328 = _2326 + 1;
    int _2330 = _2314 * as_type<int>(_2162);
    int _2332 = _2330 + _2294;
    int _2334 = ~_2308;
    int _2336 = _2334 + 1;
    int _2338 = _2336 + 1;
    float _2340 = _1988 * _1988;
    bool _2342 = !_1476;
    int _2344 = _2342 ? _2180 : (-1);
    int _2346 = _2286 * _2328;
    bool _2348 = !_1456;
    int _2350 = _2348 ? _2322 : (-1);
    int _2352 = _2332 * _2338;
    bool _2354 = _2198 >= 0.0;
    int _2356 = _2344 * _2306;
    int _2358 = _2356 + _2346;
    float _2360 = _2318 + (-0.5);
    int _2362 = _2350 * _2308;
    int _2364 = _2362 + _2352;
    float _2366 = fma(_2144, _2144, _2340);
    float _2368 = -_2008;
    float _2370 = _2368 + 1.0;
    float _2372 = -_2360;
    float _2374 = -_2174;
    float _2376 = fma(_2372, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2374);
    float _2378 = -_2014;
    float _2380 = _2378 + 1.0;
    float _2382 = fma(_2186, _2186, _2366);
    float _2384 = _967 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2386 = fma(_2318, _2048, _2376);
    float _2388 = _965 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2390 = _969 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_2354)
    {
        _973 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2392 = _973;
    float _2394 = rsqrt(_2382);
    float _2396 = -_2078;
    float _2398 = fma(_1782, _2396, _1926);
    float _2400 = fma(_1804, _2370, _1908);
    float _2402 = -_2380;
    float _2404 = fma(_1882, _2402, _2190);
    float _2406 = _2388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2408 = _2384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2410 = _2390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2412 = _1996 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2414 = as_type<int>(_2392);
    float _2416 = _2404;
    if (_2354)
    {
        float _2418 = _2392 * 5.0;
        _2414 = as_type<int>(_2418);
    }
    int _2420 = _2414;
    float _2422 = float(_2358);
    out.m_74.x = _2398;
    out.m_74.y = _2400;
    out.m_74.z = _2404;
    out.m_74.w = _2386;
    float _2424 = float(_2364);
    out.m_76.x = _2406;
    out.m_76.y = _2408;
    out.m_76.z = _2410;
    out.m_76.w = _2412;
    float _2426 = _1988 * _2394;
    float _2428 = _2144 * _2394;
    if (_2354)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7673 = as_type<float>(_2420);
        out.gl_Position.z = _7673;
    }
    out.m_78.x = _2422;
    out.m_78.y = _2424;
    if (_2354)
    {
        out.m_59.x = 0.0;
    }
    if (_2354)
    {
        return out;
    }
    float _2430 = -_2426;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1950);
    float _2434 = _2186 * _2394;
    float _2436 = -_2428;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1976);
    float _2440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2442 = _2432 + _2440;
    float _2444 = -_2434;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2040);
    float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2450 = _2438 + _2448;
    float _2452 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2456 = _2446 + _2454;
    float _2458 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2452);
    float _2460 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2458);
    bool _2462 = _2460 >= 0.0;
    float _2464 = _2434;
    if (_2462)
    {
        _2416 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2466 = _2416;
    int _2468 = as_type<int>(_2466);
    if (_2462)
    {
        out.m_59.x = 0.0;
    }
    if (_2462)
    {
        float _2470 = _2466 * 5.0;
        _2468 = as_type<int>(_2470);
    }
    int _2472 = _2468;
    if (_2462)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7772 = as_type<float>(_2472);
        out.gl_Position.z = _7772;
    }
    if (_2462)
    {
        return out;
    }
    float _2474 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2476 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2478 = floor(_2474);
    float _2480 = floor(_2476);
    float _2482 = -_2478;
    float _2484 = _2474 + _2482;
    float _2486 = -_2480;
    float _2488 = _2476 + _2486;
    float2 _7808 = float2(_2484, _2488);
    float _2490 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7808, float2(0.0), isnan(_7808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7808, float2(0.0), isnan(_7808)), level(0.0)).x;
    float _2492 = _2432 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2494 = -_2426;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1988);
    float _2498 = -_2428;
    float _2500 = fma(_2498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2144);
    float _2502 = -_2434;
    float _2504 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2186);
    float _2506 = fma(_2438, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2492);
    float _2508 = _2496 * _2496;
    float _2510 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2512 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2506);
    float _2514 = _2432 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2516 = fma(_2500, _2500, _2508);
    float _2518 = _2512 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2520 = fma(_2438, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2514);
    float _2522 = fma(_2504, _2504, _2516);
    float _2524 = 1.0 / _2518;
    float _2526 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2520);
    float _2528 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2530 = _2526 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2532 = sqrt(_2522);
    float _2534 = _2530 + _2518;
    float _2536 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2538 = _2432 + _2528;
    float _2540 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2542 = _2534 * _2524;
    float _2544 = _2542 * 0.5;
    float _2546 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2548 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2540);
    float _2550 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2552 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2550);
    float _2554 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2556 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2546);
    float _2558 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2548);
    float _2560 = _2394 * _2532;
    float _2562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _2564 = 1.0 / _2552;
    float _2566 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2568 = _2560 * _2554;
    float _2570 = _2560 * _2536;
    float _2572 = _2560 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2574 = _2572 * 0.5;
    float _2576 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2556);
    float _2578 = _2562 * _2568;
    float _2580 = _2510 * _2570;
    float _2582 = trunc(_2566);
    int _2584 = int(_2582);
    float _2586 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2588 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2590 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2592 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2586);
    float _2594 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2588);
    float _2596 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2598 = _2564 * _2596;
    float _2600 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2592);
    float _2602 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2594);
    bool _2604 = _2598 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2606 = _2598 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2608 = _2602 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _2610 = !_2604;
    int _2612 = _2610 ? 0 : 1;
    float _2614 = _1976 + _2608;
    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2618 = _2614 + _2616;
    int _2620 = 2;
    float _2622 = _2580;
    float _2624 = _2566;
    if (!_2604)
    {
        _2620 = 1;
    }
    int _2626 = _2620;
    int _2628 = _2626;
    if (!_2606)
    {
        _2628 = _2612;
    }
    int _2630 = _2628;
    float _2632 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _2634 = _2630 << 6;
    float _2636 = _2040 + _2632;
    int _2638 = _2634 + 48;
    uint _2640 = uint(int(uint(_2638) >> uint(2)));
    uint _2642 = uint(int(uint(int(_2640)) >> uint(2)));
    int _2644 = int(_2640) & 3;
    float _2646 = (*spvDescriptorSet0.vp_c15)._m0[int(_2642)][_2644];
    int _2648 = int(_2640) + 1;
    uint _2650 = uint(int(uint(_2648) >> uint(2)));
    int _2652 = _2648 & 3;
    float _2654 = (*spvDescriptorSet0.vp_c15)._m0[int(_2650)][_2652];
    float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2658 = _2636 + _2656;
    float _2660 = _2658 * _2658;
    int _2662 = _2634 + 56;
    uint _2664 = uint(int(uint(_2662) >> uint(2)));
    uint _2666 = uint(int(uint(int(_2664)) >> uint(2)));
    int _2668 = int(_2664) & 3;
    float _2670 = (*spvDescriptorSet0.vp_c15)._m0[int(_2666)][_2668];
    int _2672 = int(_2664) + 1;
    uint _2674 = uint(int(uint(_2672) >> uint(2)));
    int _2676 = _2672 & 3;
    float _2678 = (*spvDescriptorSet0.vp_c15)._m0[int(_2674)][_2676];
    float _2680 = fma(_2618, _2618, _2660);
    float _2682 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2590);
    float _2684 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2686 = sqrt(_2680);
    float _2688 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2682);
    int _2690 = _2634 + 64;
    uint _2692 = uint(int(uint(_2690) >> uint(2)));
    uint _2694 = uint(int(uint(int(_2692)) >> uint(2)));
    int _2696 = int(_2692) & 3;
    float _2698 = (*spvDescriptorSet0.vp_c15)._m0[int(_2694)][_2696];
    int _2700 = int(_2692) + 1;
    uint _2702 = uint(int(uint(_2700) >> uint(2)));
    int _2704 = _2700 & 3;
    float _2706 = (*spvDescriptorSet0.vp_c15)._m0[int(_2702)][_2704];
    float _2708 = _2688 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2710 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2712 = _2584 + _2710;
    int _2714 = _2712 + 1;
    float _2716 = trunc(_2684);
    int _2718 = int(_2716);
    float _2720 = _1950 + _2708;
    int _2722 = _2634 + 72;
    uint _2724 = uint(int(uint(_2722) >> uint(2)));
    uint _2726 = uint(int(uint(int(_2724)) >> uint(2)));
    int _2728 = int(_2724) & 3;
    float _2730 = (*spvDescriptorSet0.vp_c15)._m0[int(_2726)][_2728];
    int _2732 = int(_2724) + 1;
    uint _2734 = uint(int(uint(_2732) >> uint(2)));
    int _2736 = _2732 & 3;
    float _2738 = (*spvDescriptorSet0.vp_c15)._m0[int(_2734)][_2736];
    bool _2740 = _2686 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2742 = _2634 + 96;
    uint _2744 = uint(int(uint(_2742) >> uint(2)));
    uint _2746 = uint(int(uint(int(_2744)) >> uint(2)));
    int _2748 = int(_2744) & 3;
    float _2750 = (*spvDescriptorSet0.vp_c15)._m0[int(_2746)][_2748];
    int _2752 = int(_2744) + 1;
    uint _2754 = uint(int(uint(_2752) >> uint(2)));
    int _2756 = _2752 & 3;
    float _2758 = (*spvDescriptorSet0.vp_c15)._m0[int(_2754)][_2756];
    int _2760 = _2634 + 104;
    uint _2762 = uint(int(uint(_2760) >> uint(2)));
    uint _2764 = uint(int(uint(int(_2762)) >> uint(2)));
    int _2766 = int(_2762) & 3;
    float _2768 = (*spvDescriptorSet0.vp_c15)._m0[int(_2764)][_2766];
    int _2770 = int(_2762) + 1;
    uint _2772 = uint(int(uint(_2770) >> uint(2)));
    int _2774 = _2770 & 3;
    float _2776 = (*spvDescriptorSet0.vp_c15)._m0[int(_2772)][_2774];
    float _2778 = _2708;
    float _2780 = _2636;
    if (!_2740)
    {
        _2778 = _2614;
    }
    float _2782 = _2778;
    float _2784 = _2782;
    if (!_2740)
    {
        _2622 = _2720;
    }
    float _2786 = _2622;
    bool _2788 = !_2740;
    float _2790 = _2786;
    int _2792 = as_type<int>(_2750);
    int _2794 = as_type<int>(_2776);
    int _2796 = as_type<int>(_2706);
    if (!_2788)
    {
        float _2798 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2802 = _2686 + _2800;
        float _2804 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2806 = rsqrt(_2680);
        float _2808 = _2802 * _2798;
        float _2810 = _2808 * 0.15915493667125701904296875;
        float _2812 = _2810 * 6.283185482025146484375;
        float _2814 = sin(_2812);
        float _2816 = _2810 * 6.283185482025146484375;
        float _2818 = cos(_2816);
        float _2820 = fma(_2814, _2804, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2822 = _2806 * _2820;
        float _2824 = _2818 + (-1.0);
        float _2826 = fma(_2618, _2822, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2828 = fma(_2658, _2822, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2830 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2832 = fma(_2720, _2818, _2830);
        _2790 = _2832;
        _2784 = _2826;
        _2780 = _2828;
    }
    float _2834 = _2790;
    float _2836 = _2784;
    float _2838 = _2780;
    float _2840 = -_1950;
    float _2842 = _2840 + _2834;
    int _2844 = _2634 + 80;
    uint _2846 = uint(int(uint(_2844) >> uint(2)));
    uint _2848 = uint(int(uint(int(_2846)) >> uint(2)));
    int _2850 = int(_2846) & 3;
    float _2852 = (*spvDescriptorSet0.vp_c15)._m0[int(_2848)][_2850];
    int _2854 = int(_2846) + 1;
    uint _2856 = uint(int(uint(_2854) >> uint(2)));
    int _2858 = _2854 & 3;
    float _2860 = (*spvDescriptorSet0.vp_c15)._m0[int(_2856)][_2858];
    float _2862 = -_1976;
    float _2864 = _2862 + _2836;
    int _2866 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2868 = _2718 + _2866;
    int _2870 = _2868 + 1;
    float _2872 = _2842 * _2842;
    float _2874 = -_2040;
    float _2876 = _2874 + _2838;
    bool _2878 = _2714 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2880 = _2538 * _2758;
    float _2882 = fma(_2864, _2864, _2872);
    int _2884 = _2714 | _2870;
    float _2886 = fma(_2438, _2750, _2880);
    float _2888 = fma(_2876, _2876, _2882);
    bool _2890 = _2884 < 0;
    bool _2892 = _2890 || _2878;
    float _2894 = _2538 * _2654;
    float _2896 = fma(_2446, _2768, _2886);
    float _2898 = sqrt(_2888);
    bool _2900 = _2870 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2902 = _2900 || _2892;
    float _2904 = _2538 * _2706;
    float _2906 = _2896 + _2776;
    float _2908 = fma(_2438, _2646, _2894);
    bool _2910 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2912 = isnan(0.5);
    bool _2914 = _2910 || _2912;
    bool _2916 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2918 = _2914 || _2916;
    float _2920 = fma(_2438, _2698, _2904);
    float _2922 = 1.0 / _2906;
    float _2924 = fma(_2446, _2670, _2908);
    float _2926 = fma(_2446, _2730, _2920);
    int _2928 = as_type<int>(_2904);
    float _2930 = _2836;
    float _2932 = _2834;
    float _2934 = _2838;
    if (!_2902)
    {
        int _2936 = _2870 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2938 = _2936 + _2714;
        _2792 = _2938;
    }
    int _2940 = _2792;
    bool _2942 = _2898 > 0.0;
    float _2944 = _2758;
    if (!_2902)
    {
        float _2946 = floor(_2566);
        _2944 = _2946;
    }
    float _2948 = _2944;
    if (!_2902)
    {
        int _2950 = _2940 << 2;
        _2794 = _2950;
    }
    int _2952 = _2794;
    if (!_2902)
    {
        uint _2954 = uint(int(uint(_2940) >> uint(2)));
        _2796 = int(_2954);
    }
    int _2956 = _2796;
    int _2958 = _2956;
    if (!_2902)
    {
        int _2960 = 12 & _2952;
        _2928 = _2960;
    }
    int _2962 = _2928;
    float _2964 = _2924 + _2678;
    if (!_2902)
    {
        int _2966 = _2956 << 4;
        int _2968 = _2966 + _2962;
        _2958 = _2968;
    }
    int _2970 = _2958;
    bool _2972 = !_2942;
    if (!_2972)
    {
        float _2974 = _201 * _201;
        float _2976 = rsqrt(_2888);
        float _2978 = fma(_199, _199, _2974);
        float _2980 = fma(_203, _203, _2978);
        float _2982 = sqrt(_2980);
        float _2984 = _2864 * _2976;
        float _2986 = _2842 * _2976;
        float _2988 = _2876 * _2976;
        bool _2990 = _2982 > 0.0;
        bool _2992 = !_2990;
        if (!_2992)
        {
            float _2994 = rsqrt(_2980);
            float _2996 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2998 = _201 * _2994;
            float _3000 = _199 * _2994;
            float _3002 = _203 * _2994;
            float _3004 = _2986 * _2998;
            float _3006 = fma(_2984, _3000, _3004);
            float _3008 = _2996 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3010 = fma(_2988, _3002, _3006);
            float _3012 = _3010 * _3008;
            float _3014 = fma(_199, _3012, _2836);
            float _3016 = fma(_201, _3012, _2834);
            float _3018 = fma(_203, _3012, _2838);
            _2930 = _3014;
            _2932 = _3016;
            _2934 = _3018;
        }
    }
    float _3020 = _2930;
    float _3022 = _2932;
    float _3024 = _2934;
    float _3026 = -_2428;
    float _3028 = fma(_3026, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3020);
    float _3030 = -_2426;
    float _3032 = fma(_3030, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3022);
    float _3034 = -_2434;
    float _3036 = fma(_3034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3024);
    float _3038 = _2926 + _2738;
    float _3040 = _3032;
    float _3042 = _3028;
    float _3044 = _3036;
    if (!_2918)
    {
        float _3046 = _2442 * _2442;
        float _3048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3050 = -_2040;
        float _3052 = _3050 + _3024;
        float _3054 = fma(_2450, _2450, _3046);
        float _3056 = fma(_2456, _2456, _3054);
        float _3058 = 1.0 / _2560;
        float _3060 = sqrt(_3056);
        float _3062 = precise::min(_3060, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3064 = _3062 * _3048;
        float _3066 = -_1950;
        float _3068 = _3066 + _3022;
        float _3070 = _3064 * _3058;
        float _3072 = -_1976;
        float _3074 = _3072 + _3020;
        float _3076 = fma(_3068, _3070, _2432);
        float _3078 = fma(_3074, _3070, _2438);
        float _3080 = fma(_3052, _3070, _2446);
        _3040 = _3076;
        _3042 = _3078;
        _3044 = _3080;
    }
    float _3082 = _3040;
    float _3084 = _3042;
    float _3086 = _3044;
    float _3088 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3090 = _2040;
    if (!_2902)
    {
        int _3092 = _2970 + 400;
        uint _3094 = uint(int(uint(_3092) >> uint(2)));
        uint _3096 = uint(int(uint(int(_3094)) >> uint(2)));
        int _3098 = int(_3094) & 3;
        float _3100 = (*spvDescriptorSet0.vp_c15)._m0[int(_3096)][_3098];
        _3090 = _3100;
    }
    float _3102 = _3090;
    float _3104 = _3038 * _2922;
    float _3106 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3108 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3088);
    float _3110 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3112 = _2964 * _2922;
    float _3114 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3106);
    float _3116 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3108);
    int _3118 = _2634 + 88;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    uint _3122 = uint(int(uint(int(_3120)) >> uint(2)));
    int _3124 = int(_3120) & 3;
    float _3126 = (*spvDescriptorSet0.vp_c15)._m0[int(_3122)][_3124];
    int _3128 = int(_3120) + 1;
    uint _3130 = uint(int(uint(_3128) >> uint(2)));
    int _3132 = _3128 & 3;
    float _3134 = (*spvDescriptorSet0.vp_c15)._m0[int(_3130)][_3132];
    float _3136 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3110);
    float _3138 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3114);
    float _3140 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3142 = _3116 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3144 = _3112 >= 0.0;
    float _3146 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3136);
    float _3148 = _3138 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3150 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3140);
    float _3152 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3154 = _3112 <= 1.0;
    bool _3156 = _3154 && _3144;
    float _3158 = _3146 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3160 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3150);
    float _3162 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3152);
    bool _3164 = _3104 >= 0.0;
    bool _3166 = _3164 && _3156;
    float _3168 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3170 = _3160 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3172 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3162);
    bool _3174 = _3104 <= 1.0;
    bool _3176 = _3174 && _3166;
    float _3178 = _3158 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3180 = _1976;
    float _3182 = _3168;
    if (!_2902)
    {
        float _3184 = floor(_2684);
        _3180 = _3184;
    }
    float _3186 = _3180;
    float _3188 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3172);
    float _3190 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3192 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3194 = -_3178;
    float _3196 = fma(_3194, _3168, 1.0);
    float _3198 = _2538 * _2860;
    float _3200 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3190);
    float _3202 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3192);
    float _3204 = 1.0 / _3188;
    float _3206 = _3188;
    if (!_2902)
    {
        float _3208 = -_2948;
        float _3210 = _2566 + _3208;
        _2464 = _3210;
    }
    float _3212 = _2464;
    if (_3176)
    {
        float _3214 = float(_2630);
        _3182 = _3214;
    }
    float _3216 = _3182;
    float _3218 = fma(_2438, _2852, _3198);
    float _3220 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3200);
    float _3222 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3202);
    float _3224 = log2(_3196);
    float _3226 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3220);
    float _3228 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3222);
    float _3230 = _3186;
    if (!_2902)
    {
        float _3232 = -_3186;
        float _3234 = _2684 + _3232;
        _3230 = _3234;
    }
    float _3236 = _3230;
    float _3238 = _3198;
    float _3240 = _3236;
    if (_3176)
    {
        float _3242 = rint(_3216);
        float _3244 = precise::max(_3242, 0.0);
        uint _3246 = uint(_3244);
        uint _3248 = clamp(_3246, 0u, 65535u);
        _3238 = as_type<float>(_3248);
    }
    float _3250 = _3238;
    float _3252 = _3226 * _3204;
    float _3254 = _3228 * _3204;
    float _3256 = fma(_2446, _3126, _3218);
    float _3258 = fma(_3252, 0.5, 0.5);
    float _3260 = _3204;
    float _3262 = _3252;
    if (!_2902)
    {
        float _3264 = rint(_3102);
        float _3266 = precise::max(_3264, 0.0);
        uint _3268 = uint(_3266);
        uint _3270 = clamp(_3268, 0u, 65535u);
        _3260 = as_type<float>(_3270);
    }
    float _3272 = _3260;
    float _3274 = _3256 + _3134;
    float _3276 = _3224 * 0.693147182464599609375;
    float _3278 = fma(_3254, -0.5, 0.5);
    float _3280 = _3274 * _2922;
    float _3282 = _3276 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3284 = _3256;
    float _3286 = _3280;
    if (_3176)
    {
        float3 _9147 = float3(_3112, _3104, float(as_type<int>(_3250)));
        float3 _9151 = select(_9147, float3(0.0), isnan(_9147));
        float _3288 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9151.xy, uint(rint(_9151.z)), _3280, level(0.0));
        _3284 = _3288;
    }
    float _3290 = _3284;
    float3 _9161 = float3(_3258, _3278, _3282);
    float _3292 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9161, float3(0.0), isnan(_9161)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9161, float3(0.0), isnan(_9161)), level(0.0)).x;
    float3 _9170 = float3(_3258, _3278, _3282);
    float4 _3295 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9170, float3(0.0), isnan(_9170)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9170, float3(0.0), isnan(_9170)), level(0.0)).xyzw;
    float _3297 = _3295.x;
    float _3299 = _3295.y;
    float _3301 = _3295.z;
    float _3303 = _3295.w;
    float _3305 = _3212;
    if (!_2902)
    {
        float3 _9193 = float3(_3212, _3236, float(as_type<int>(_3272)));
        float3 _9195 = select(_9193, float3(0.0), isnan(_9193));
        float _3307 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9195.xy, uint(rint(_9195.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9195.xy, uint(rint(_9195.z)), level(0.0)).x;
        _3305 = _3307;
    }
    float _3309 = _3305;
    if (_2902)
    {
        _2624 = 1.0;
    }
    float _3311 = _2624;
    float _3313 = _3311;
    float _3315 = _3309;
    if (!_2902)
    {
        int _3317 = _2940 << 4;
        int _3319 = _3317 + 2048;
        uint _3321 = uint(int(uint(_3319) >> uint(2)));
        uint _3323 = uint(int(uint(int(_3321)) >> uint(2)));
        int _3325 = int(_3321) & 3;
        float _3327 = (*spvDescriptorSet0.vp_c15)._m0[int(_3323)][_3325];
        int _3329 = int(_3321) + 1;
        uint _3331 = uint(int(uint(_3329) >> uint(2)));
        int _3333 = _3329 & 3;
        float _3335 = (*spvDescriptorSet0.vp_c15)._m0[int(_3331)][_3333];
        int _3337 = _3319 + 8;
        uint _3339 = uint(int(uint(_3337) >> uint(2)));
        uint _3341 = uint(int(uint(int(_3339)) >> uint(2)));
        int _3343 = int(_3339) & 3;
        float _3345 = (*spvDescriptorSet0.vp_c15)._m0[int(_3341)][_3343];
        int _3347 = int(_3339) + 1;
        uint _3349 = uint(int(uint(_3347) >> uint(2)));
        int _3351 = _3347 & 3;
        float _3353 = (*spvDescriptorSet0.vp_c15)._m0[int(_3349)][_3351];
        float _3355 = _2538 * _3335;
        float _3357 = fma(_2438, _3327, _3355);
        float _3359 = fma(_2446, _3345, _3357);
        float _3361 = _3359 + _3353;
        float _3363 = precise::clamp(_3361, 0.0, 1.0);
        float _3365 = -_3363;
        float _3367 = _3365 + _3309;
        float _3369 = fma(_3367, 500.0, 1.5);
        float _3371 = exp2(_3369);
        float _3373 = 0.0 + _3371;
        float _3375 = precise::clamp(_3373, 0.0, 1.0);
        _3262 = _3335;
        _3240 = _3327;
        _3313 = _3375;
    }
    float _3377 = _3262;
    float _3379 = _3240;
    float _3381 = _3313;
    float _3383 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3385 = _3082 + _3383;
    float _3387 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3389 = _3084 + _3387;
    float _3391 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3393 = _3086 + _3391;
    float _3395 = _3385 * _3385;
    float _3397 = fma(_3389, _3389, _3395);
    float _3399 = fma(_3393, _3393, _3397);
    float _3401 = rsqrt(_3399);
    float _3403 = _3401 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3405 = _3389 * _3403;
    float _3407 = _3393 * _3403;
    float _3409 = _3405 * _3405;
    float _3411 = _3407 * _3407;
    float _3413 = _3409 + _3411;
    float _3415 = sqrt(_3413);
    bool _3417 = _3415 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3419 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3421 = _3415 + _3419;
    float _3423 = _3401;
    float _3425 = _3421;
    float _3427 = _3377;
    float _3429 = _3385;
    float _3431 = _3403;
    if (_3417)
    {
        float _3433 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3423 = _3433;
    }
    float _3435 = _3423;
    if (_3417)
    {
        float _3437 = _3421 * _3435;
        _3425 = _3437;
    }
    float _3439 = _3425;
    if (_3417)
    {
        float _3441 = _3439 * 0.15915493667125701904296875;
        _3427 = _3441;
    }
    float _3443 = _3427;
    float _3445 = _3393;
    float _3447 = _3443;
    if (_3417)
    {
        float _3449 = _3443 * 6.283185482025146484375;
        float _3451 = sin(_3449);
        _3445 = _3451;
    }
    float _3453 = _3445;
    float _3455 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3457 = precise::max(0.0, _3455);
    float _3459 = _3379;
    float _3461 = _3457;
    if (_3417)
    {
        float _3463 = _3443 * 6.283185482025146484375;
        float _3465 = cos(_3463);
        _3459 = _3465;
    }
    float _3467 = _3459;
    float _3469 = -_3403;
    float _3471 = -_3457;
    float _3473 = fma(_3385, _3469, _3471);
    float _3475 = _3455;
    if (_3417)
    {
        float _3477 = rsqrt(_3413);
        _3475 = _3477;
    }
    float _3479 = _3475;
    if (_3417)
    {
        float _3481 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3461 = _3481;
    }
    float _3483 = _3461;
    float _3485 = _3483;
    if (!_3417)
    {
        _3447 = _3409;
    }
    float _3487 = _3447;
    float _3489 = _3453;
    float _3491 = _3487;
    if (_3417)
    {
        float _3493 = fma(_3453, _3483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3485 = _3493;
    }
    float _3495 = _3485;
    float _3497 = _3495;
    if (!_3417)
    {
        _3489 = _3407;
    }
    float _3499 = _3489;
    float _3501 = _3499;
    float _3503 = _3467;
    if (_3417)
    {
        float _3505 = _3467 + (-1.0);
        _3429 = _3505;
    }
    float _3507 = _3429;
    if (_3417)
    {
        float _3509 = _3507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3431 = _3509;
    }
    float _3511 = _3431;
    float _3513 = sqrt(_3399);
    float _3515 = _3479;
    if (_3417)
    {
        float _3517 = _3479 * _3495;
        _3315 = _3517;
    }
    float _3519 = _3315;
    if (!_3417)
    {
        _3497 = _3405;
    }
    float _3521 = _3497;
    float _3523 = _3521;
    if (!_3417)
    {
        _3515 = _3473;
    }
    float _3525 = _3515;
    float _3527 = _3525;
    if (_3417)
    {
        float _3529 = _3405 * _3519;
        _3523 = _3529;
    }
    float _3531 = _3523;
    if (_3417)
    {
        float _3533 = fma(_3473, _3467, _3511);
        _3527 = _3533;
    }
    float _3535 = _3527;
    if (_3417)
    {
        float _3537 = _3407 * _3519;
        _3501 = _3537;
    }
    float _3539 = _3501;
    if (!_3417)
    {
        _3503 = _3411;
    }
    float _3541 = _3503;
    float _3543 = _3541;
    if (_3417)
    {
        float _3545 = _3531 * _3531;
        _3491 = _3545;
    }
    float _3547 = _3491;
    if (_3417)
    {
        float _3549 = _3539 * _3539;
        _3543 = _3549;
    }
    float _3551 = _3543;
    float _3553 = fma(_3535, _3535, _3547);
    float _3555 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3557 = fma(_3513, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3555);
    float _3559 = precise::clamp(_3557, 0.0, 1.0);
    float _3561 = _3553 + _3551;
    float _3563 = -_3559;
    float _3565 = _3563 + 1.0;
    float _3567 = rsqrt(_3561);
    float _3569 = _3567 * _3535;
    float _3571 = _3567 * _3531;
    float _3573 = abs(_3565);
    float _3575 = log2(_3573);
    float _3577 = _3567 * _3539;
    float _3579 = _3571 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3581 = -_3579;
    float _3583 = fma(_3569, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3581);
    float _3585 = -_3577;
    float _3587 = fma(_3585, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3583);
    float _3589 = fma(_3587, -0.5, 0.5);
    float _3591 = _3575 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3593 = fma(_3587, 0.5, 0.5);
    float _3595 = sqrt(_3589);
    float _3597 = fma(_3593, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3599 = fma(_3593, _3597, -0.212114393711090087890625);
    float _3601 = _3569 + 1.0;
    float _3603 = exp2(_3591);
    float _3605 = fma(_3593, _3599, 1.570728778839111328125);
    float _3607 = _3595 * 0.636619746685028076171875;
    float _3609 = -_3605;
    float _3611 = fma(_3607, _3609, 1.0);
    float _3613 = -_3569;
    float _3615 = fma(_3603, _3601, _3613);
    float _3617 = fma(_3615, 0.5, 0.5);
    float2 _9671 = float2(_3611, _3617);
    float3 _3621 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9671, float2(0.0), isnan(_9671)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9671, float2(0.0), isnan(_9671)), level(0.0)).xyz;
    float _3623 = _3621.x;
    float _3625 = _3621.y;
    float _3627 = _3621.z;
    float _3629 = abs(_2598);
    float _3631 = log2(_3629);
    float _3633 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3635 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3637 = fma(_3633, _3633, 1.0);
    float _3639 = -_2490;
    float _3641 = _3639 + 1.0;
    float _3643 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3635);
    float _3645 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3647 = _3633 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3649 = _2598 <= 8000.0;
    bool _3651 = isnan(_2598);
    bool _3653 = _3649 || _3651;
    bool _3655 = isnan(8000.0);
    bool _3657 = _3653 || _3655;
    float _3659 = float(_3657);
    float _3661 = rsqrt(_3637);
    float _3663 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3643);
    float _3665 = fma(_3645, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3647);
    out.m_80.x = _3084;
    out.m_80.y = _3082;
    out.m_80.z = _3086;
    float _3667 = _3631 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _3669 = _3513 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3671 = isnan(_3513);
    bool _3673 = _3669 || _3671;
    bool _3675 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3677 = _3673 || _3675;
    float _3679 = exp2(_3667);
    out.m_82.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_82.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_82.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _3681 = _3633 * _3661;
    float _3683 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3685 = _3681 * _3683;
    float _3687 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3689 = _3681 * _3687;
    float _3691 = fma(_3661, (*spvDescriptorSet0.vp_c8)._m0[24].y, _3685);
    float _3693 = fma(_3661, (*spvDescriptorSet0.vp_c8)._m0[26].y, _3689);
    float _3695 = fma(_3679, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3697 = precise::clamp(_3695, 0.0, 1.0);
    float _3699 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3701 = _3681 * _3699;
    float _3703 = _3633 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3705 = _3633 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3707 = fma(_3697, -2.0, 3.0);
    float _3709 = _3697 * _3697;
    float _3711 = fma(_3645, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3703);
    float _3713 = fma(_3645, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3705);
    float _3715 = _3575 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3717 = _3709 * _3707;
    float _3719 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3663);
    float _3721 = fma(_3661, (*spvDescriptorSet0.vp_c8)._m0[25].y, _3701);
    float _3723 = -_3717;
    float _3725 = _3723 + 1.0;
    float _3727 = exp2(_3715);
    out.gl_Position.x = _3226;
    out.gl_Position.y = _3228;
    out.gl_Position.z = _3719;
    out.gl_Position.w = _3188;
    float _3729 = fma(_3725, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3717);
    float _3731 = _3719 + _3188;
    out.m_84.x = _3691;
    out.m_84.y = _3721;
    out.m_84.z = _3693;
    float _3733 = _3659 * _3729;
    float _3735 = _3731 * 0.5;
    float _3737 = _3731;
    float _3739 = _3711;
    if (!_3176)
    {
        _3737 = 1.0;
    }
    float _3741 = _3737;
    float _3743 = _3733 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3745 = _3741;
    if (_3176)
    {
        bool _3747 = _3290 >= _3280;
        bool _3749 = isnan(_3290);
        bool _3751 = _3747 || _3749;
        bool _3753 = isnan(_3280);
        bool _3755 = _3751 || _3753;
        float _3757 = float(_3755);
        _3745 = _3757;
    }
    float _3759 = _3745;
    out.m_86.z = _3735;
    out.m_86.w = _3188;
    if (!_3677)
    {
        _3286 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3761 = _3286;
    float _3763 = _3641 * _3743;
    float _3765 = precise::clamp(_3763, 0.0, 1.0);
    float _3767 = -_3727;
    float _3769 = _3767 + 1.0;
    float _3771 = _3759 * _3381;
    float _3773 = _3665 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3775 = -_3765;
    float _3777 = fma(_3775, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3779 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3781 = _3711 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3783 = _3713 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3785 = -_3771;
    float _3787 = fma(_3785, _3777, 1.0);
    float _3789 = precise::clamp(_3787, 0.0, 1.0);
    float _3791 = _3779 * _3292;
    float _3793 = -_3779;
    float _3795 = _3793 + 1.0;
    float _3797 = _3789;
    float _3799 = _3791;
    float _3801 = _3761;
    float _3803 = _3761;
    if (!_3677)
    {
        _3739 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3805 = _3739;
    float _3807 = _3789 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3809 = _3303 * _3791;
    float _3811 = _3303 * _3795;
    out.m_88.x = _3773;
    out.m_88.y = _3781;
    out.m_88.z = _3783;
    float _3813 = _3809;
    float _3815 = _3805;
    float _3817 = _3805;
    if (!_3677)
    {
        _3797 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3819 = _3797;
    float _3821 = _3819;
    float _3823 = _3819;
    if (!_3677)
    {
        _3206 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3825 = _3206;
    out.m_90.x = _3807;
    float _3827 = _3627 * _3791;
    float _3829 = fma(_3623, _3809, _3297);
    float _3831 = fma(_3625, _3809, _3299);
    float _3833 = _3825;
    float _3835 = _3825;
    if (!_3677)
    {
        _3799 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3837 = _3799;
    float _3839 = fma(_3303, _3827, _3301);
    float _3841 = _3837;
    float _3843 = _3837;
    if (!_3677)
    {
        _3813 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3845 = _3813;
    out.m_92.x = _3829;
    out.m_92.y = _3831;
    out.m_92.z = _3839;
    out.m_92.w = _3811;
    bool _3847 = !_3677;
    float _3849 = _3845;
    float _3851 = _3845;
    if (!_3847)
    {
        bool _3853 = _3513 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3855 = isnan(_3513);
        bool _3857 = _3853 || _3855;
        bool _3859 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3861 = _3857 || _3859;
        if (!_3861)
        {
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3865 = _3513 + _3863;
            float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3869 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3867;
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3873 = _3871 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3877 = _3875 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3879 = 1.0 / _3869;
            float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3893 = _3865 * _3879;
            float _3895 = precise::clamp(_3893, 0.0, 1.0);
            float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3901 = fma(_3895, _3873, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3903 = fma(_3895, _3877, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3905 = fma(_3895, _3899, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3907 = fma(_3895, _3883, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3909 = fma(_3895, _3887, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3911 = fma(_3895, _3891, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3817 = _3903;
            _3835 = _3909;
            _3843 = _3901;
            _3803 = _3907;
            _3823 = _3905;
            _3851 = _3911;
            _3913 = true;
        }
        else
        {
            bool _3915 = _3513 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3917 = isnan(_3513);
            bool _3919 = _3915 || _3917;
            bool _3921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3923 = _3919 || _3921;
            if (!_3923)
            {
                _3841 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3925 = _3841;
            _3843 = _3925;
            if (!_3923)
            {
                _3815 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3927 = _3815;
            _3817 = _3927;
            if (!_3923)
            {
                _3821 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3929 = _3821;
            _3823 = _3929;
            if (!_3923)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3931 = _3801;
            _3803 = _3931;
            if (!_3923)
            {
                _3833 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3933 = _3833;
            _3835 = _3933;
            if (!_3923)
            {
                _3849 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3935 = _3849;
            bool _3937 = !_3923;
            _3851 = _3935;
            if (!_3937)
            {
                bool _3939 = _3513 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3941 = isnan(_3513);
                bool _3943 = _3939 || _3941;
                bool _3945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3947 = _3943 || _3945;
                if (!_3947)
                {
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3951 = _3513 + _3949;
                    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3955 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3953;
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3963 = _3961 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3965 = 1.0 / _3955;
                    float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3979 = _3951 * _3965;
                    float _3981 = precise::clamp(_3979, 0.0, 1.0);
                    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3987 = fma(_3981, _3959, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3989 = fma(_3981, _3963, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3991 = fma(_3981, _3985, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3993 = fma(_3981, _3969, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3995 = fma(_3981, _3973, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3997 = fma(_3981, _3977, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3817 = _3989;
                    _3835 = _3995;
                    _3843 = _3987;
                    _3803 = _3993;
                    _3823 = _3991;
                    _3851 = _3997;
                    _3913 = true;
                }
                else
                {
                    _3817 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3835 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3843 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3823 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3851 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3913 = false;
    float _3999 = _3817;
    float _4001 = _3835;
    float _4003 = _3843;
    float _4005 = _3803;
    float _4007 = _3823;
    float _4009 = _3851;
    float _4011 = fma(_3781, -0.5, 0.5);
    float _4013 = precise::clamp(_4011, 0.0, 1.0);
    float _4015 = -_3999;
    float _4017 = _4015 + _4001;
    float _4019 = -_4003;
    float _4021 = _4019 + _4005;
    float _4023 = -_4007;
    float _4025 = _4023 + _4009;
    bool _4027 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4029 = fma(_4013, _4017, _3999);
    float _4031 = fma(_4013, _4021, _4003);
    float _4033 = fma(_4013, _4025, _4007);
    float _4035 = _4029 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _4037 = fma(_4031, 0.298911988735198974609375, _4035);
    float _4039 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4041 = fma(_4033, 0.114477999508380889892578125, _4037);
    out.m_59.x = _4039;
    float _4043 = -_4041;
    float _4045 = _4031 + _4043;
    float _4047 = -_4041;
    float _4049 = _4029 + _4047;
    float _4051 = -_4041;
    float _4053 = _4033 + _4051;
    float _4055 = fma(_4045, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4041);
    float _4057 = fma(_4049, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4041);
    float _4059 = fma(_4053, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4041);
    out.m_96.x = _4055;
    out.m_96.y = _4057;
    out.m_96.z = _4059;
    if (!_4027)
    {
        return out;
    }
    float _4061 = -_3082;
    float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4065 = -_3084;
    float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4069 = -_3086;
    float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4073 = _4063 * _4063;
    float _4075 = fma(_4067, _4067, _4073);
    float _4077 = fma(_4071, _4071, _4075);
    float _4079 = sqrt(_4077);
    float _4081 = rsqrt(_4077);
    float _4083 = -_4079;
    float _4085 = _4083 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4087 = _4085 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4089 = precise::clamp(_4087, 0.0, 1.0);
    float _4091 = _4067 * _4081;
    float _4093 = _4063 * _4081;
    float _4095 = abs(_4089);
    float _4097 = log2(_4095);
    float _4099 = _4071 * _4081;
    float _4101 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4103 = _3781 * _4093;
    float _4105 = -_4093;
    float _4107 = -_4101;
    float _4109 = fma(_4105, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4107);
    float _4111 = fma(_3773, _4091, _4103);
    float _4113 = -_4099;
    float _4115 = fma(_4113, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4109);
    float _4117 = fma(_3783, _4099, _4111);
    float _4119 = precise::clamp(_4117, 0.0, 1.0);
    float _4121 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4123 = _4115 + _4121;
    float _4125 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4127 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4129 = precise::clamp(_4127, 0.0, 1.0);
    float _4131 = exp2(_4125);
    float _4133 = _4131 * _4129;
    float _4135 = _4119 * _4133;
    float _4137 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4139 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4141 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _4137;
    out.m_94.y = _4139;
    out.m_94.z = _4141;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3913 = false;
    bool _993 = false;
    bool _823 = false;
    bool _603 = false;
    bool _427 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_56.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_59.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4198 = as_type<float>(_131);
        out.gl_Position.z = _4198;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    if (_145)
    {
        float _153 = float(_115);
        _151 = _153;
    }
    float _155 = _151;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    if (_161)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _125;
    if (_161)
    {
        out.m_59.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _133 = as_type<int>(_165);
    }
    int _167 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4266 = as_type<float>(_167);
        out.gl_Position.z = _4266;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_66.x;
    float _173 = in.m_66.y;
    float _175 = in.m_66.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _193 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _195 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    float _199 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _201 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _203 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _205 = !_179;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_183;
    float _211 = _209 ? (-0.5) : 0.5;
    bool _213 = !_185;
    float _231;
    if (!_213)
    {
        float _215 = in.m_68.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_115);
        float _237 = 1.0 / _235;
        float _239 = _149 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = _241 + _247;
    bool _251 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _253 = isnan(_241);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _241 + _275;
    float _279 = 1.0 / _269;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _283 = 1.0 / _265;
    float _285 = 1.0 / _273;
    float _287 = _277 * _279;
    bool _289 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _291 = isnan(_241);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _245 * _283;
    bool _303 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_241);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_261;
    float _317 = _315 + 1.0;
    float _319 = _313 * _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _325 = _249 * _285;
    bool _327 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_241);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_313;
    float _341 = _339 + 1.0;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = _337 * _341;
    float _357 = -_337;
    float _359 = _357 + 1.0;
    float _361 = fma(_345, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = fma(_349, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _365 = fma(_323, _287, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _367 = _299 * _359;
    float _369 = fma(_353, _287, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = -_299;
    float _373 = _371 + 1.0;
    float _375 = _361 * _367;
    float _377 = _363 * _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _383;
    float _387 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _391 = fma(_381, _325, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _393 = fma(_385, _325, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _395 = fma(_365, _355, _387);
    float _397 = fma(_369, _355, _389);
    float _399 = fma(_391, _319, _395);
    float _401 = fma(_393, _319, _397);
    float _403 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].x, _399);
    float _405 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].y, _401);
    bool _407 = !_281;
    float _425;
    if (!_407)
    {
        float _409 = in.m_68.x;
        float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _413 = _409 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[11].x, _149);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        float _429 = float(_115);
        float _431 = 1.0 / _429;
        float _433 = _149 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = in.m_70.x;
    float _439 = in.m_70.y;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _443 = _435 + _441;
    bool _445 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _447 = isnan(_435);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _459 = _435 + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _461;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _469 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _471 = isnan(_435);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    bool _481 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _483 = isnan(_435);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = 1.0 / _467;
    float _495 = -_491;
    float _497 = _495 + 1.0;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _501 = 1.0 / _463;
    float _503 = _479 * _497;
    float _505 = -_479;
    float _507 = _505 + 1.0;
    float _509 = _405 * _439;
    float _511 = _459 * _493;
    float _513 = _403 * _437;
    float _515 = _443 * _501;
    float _517 = -_455;
    float _519 = _517 + 1.0;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _521;
    float _525 = _491 * _519;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _531;
    float _535 = fma(_523, _515, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _537 = fma(_529, _515, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _539 = fma(_533, _515, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _541 = _535 * _503;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _547 = _537 * _503;
    float _549 = _539 * _503;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _559 = fma(_545, _511, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _561 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[107].x, _547);
    float _563 = fma(_553, _511, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _565 = fma(_557, _511, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _567 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[107].y, _541);
    float _569 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[107].z, _549);
    float _571 = fma(_563, _525, _561);
    float _573 = fma(_559, _525, _567);
    float _575 = fma(_565, _525, _569);
    float _577 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].x, _571);
    float _579 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].y, _573);
    float _581 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[109].z, _575);
    bool _583 = !_499;
    float _601;
    if (!_583)
    {
        float _585 = in.m_68.x;
        float _587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _589 = _585 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _591 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _593 = _591 * _587;
        float _595 = floor(_593);
        float _597 = -_595;
        float _599 = _593 + _597;
        _601 = _599;
        _603 = true;
    }
    else
    {
        float _605 = float(_115);
        float _607 = 1.0 / _605;
        float _609 = _149 * _607;
        _601 = _609;
    }
    _603 = false;
    float _611 = _601;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _615 = _611 + _613;
    float _617 = _577 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _631 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _633 = isnan(_611);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = 1.0 / _621;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _649 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _651 = isnan(_611);
    bool _653 = _649 || _651;
    bool _655 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _657 = _653 || _655;
    float _659 = float(_657);
    float _661 = _579 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _663 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _665 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _669 = 1.0 / _629;
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _675 = _625 * _643;
    bool _677 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _679 = isnan(_611);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = 1.0 / _647;
    float _691 = -_641;
    float _693 = _691 + 1.0;
    float _695 = fma(_675, _615, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _701 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _703 = isnan(_611);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = -_687;
    float _715 = _713 + 1.0;
    float _717 = _687 * _693;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _721 = _719 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _723 = 1.0 / _699;
    float _725 = -_711;
    float _727 = _725 + 1.0;
    float _729 = _659 * _715;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _731;
    float _735 = _721 * _669;
    float _737 = _641 * _727;
    float _739 = _695 * _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _743 = _611 + _741;
    float _745 = -_659;
    float _747 = _745 + 1.0;
    bool _749 = _611 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _751 = isnan(_611);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _733 * _689;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _769 = _611 + _767;
    float _771 = fma(_735, _743, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _773 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[115].x, _739);
    float _775 = -_759;
    float _777 = _775 + 1.0;
    float _779 = _765 * _723;
    float _781 = fma(_761, _769, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _785 = _611 + _783;
    float _787 = fma(_771, _717, _773);
    float _789 = _711 * _777;
    float _791 = fma(_779, _785, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _793 = fma(_781, _737, _787);
    float _795 = fma(_791, _789, _793);
    float _797 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[119].x, _795);
    float _799 = _797 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _665;
    out.m_72.y = _667;
    out.m_72.z = _671;
    out.m_72.w = _799;
    bool _801 = !_673;
    float _803 = _737;
    float _821;
    if (!_801)
    {
        float _805 = in.m_68.x;
        float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _809 = _805 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[11].z, _149);
        float _813 = _811 * _807;
        float _815 = floor(_813);
        float _817 = -_815;
        float _819 = _813 + _817;
        _821 = _819;
        _823 = true;
    }
    else
    {
        float _825 = float(_115);
        float _827 = 1.0 / _825;
        float _829 = _149 * _827;
        _821 = _829;
    }
    _823 = false;
    float _831 = _821;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _835 = _831 + _833;
    bool _837 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _839 = isnan(_831);
    bool _841 = _837 || _839;
    bool _843 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _845 = _841 || _843;
    float _847 = float(_845);
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _851 = _831 + _849;
    bool _853 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _855 = isnan(_831);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _873 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _875 = isnan(_831);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = -_847;
    float _887 = _885 + 1.0;
    float _889 = 1.0 / _871;
    float _891 = _883 * _887;
    float _893 = -_883;
    float _895 = _893 + 1.0;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _897;
    bool _901 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _903 = 1.0 / _867;
    float _905 = _863 * _895;
    float _907 = -_863;
    float _909 = _907 + 1.0;
    float _911 = _835 * _903;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _913;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _917;
    float _921 = fma(_899, _911, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _923 = fma(_915, _911, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _925 = fma(_919, _911, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _927 = _851 * _889;
    float _929 = _921 * _905;
    float _931 = _923 * _905;
    float _933 = _925 * _905;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _947 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].x, _929);
    float _949 = fma(_937, _927, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _951 = fma(_941, _927, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _953 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].y, _931);
    float _955 = fma(_945, _927, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _957 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[123].z, _933);
    float _959 = fma(_949, _891, _947);
    float _961 = fma(_951, _891, _953);
    float _963 = fma(_955, _891, _957);
    float _965 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[125].x, _959);
    float _967 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[125].y, _961);
    float _969 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[125].z, _963);
    bool _971 = !_901;
    float _973 = _965;
    float _991;
    if (!_971)
    {
        float _975 = in.m_68.x;
        float _977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _979 = _975 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _981 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _983 = _981 * _977;
        float _985 = floor(_983);
        float _987 = -_985;
        float _989 = _983 + _987;
        _991 = _989;
        _993 = true;
    }
    else
    {
        float _995 = float(_115);
        float _997 = 1.0 / _995;
        float _999 = _149 * _997;
        _991 = _999;
    }
    _993 = false;
    float _1001 = _991;
    float _1003 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1005 = int(_1003);
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1009 = _1007 != 0;
    float _1011 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1013 = int(_1011);
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1017 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1019 = float(_1005);
    float _1021 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1023 = int(_1021);
    if (_1009)
    {
        float _1025 = in.m_68.x;
        _803 = _1025;
    }
    float _1027 = _803;
    float _1029 = _1027;
    if (!_1009)
    {
        float _1031 = in.m_68.y;
        _1029 = _1031;
    }
    float _1033 = _1029;
    float _1035 = float(uint(_1013));
    float _1037 = 1.0 / _1019;
    int _1039 = ~_1013;
    int _1041 = _1039 + 1;
    bool _1043 = _1013 == 0;
    float _1045 = 1.0 / _1035;
    float _1047 = float(uint(_1023));
    float _1049 = _149 * _1037;
    float _1051 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1053 = int(_1051);
    int _1055 = as_type<int>(_1045) + (-2);
    float _1057 = trunc(_1049);
    int _1059 = int(_1057);
    int _1061 = ~_1013;
    int _1063 = _1061 + 1;
    float _1065 = float(_1053);
    float _1067 = 1.0 / _1047;
    float _1069 = float(uint(_1059));
    float _1071 = 1.0 / _1065;
    float _1073 = as_type<float>(_1055) * _1069;
    float _1075 = trunc(_1073);
    float _1077 = precise::max(_1075, 0.0);
    uint _1080 = uint(_1077);
    float _1082 = _149 * _1071;
    float _1084 = trunc(_1082);
    int _1086 = int(_1084);
    int _1088 = _1063 * int(_1080);
    int _1090 = _1088 + _1059;
    float _1092 = float(uint(_1090));
    float _1094 = in.m_68.x;
    float _1096 = in.m_68.y;
    float _1098 = in.m_68.z;
    float _1100 = in.m_68.w;
    float _1102 = as_type<float>(_1055) * _1092;
    float _1104 = _1092;
    if (_1009)
    {
        _1104 = 1.0;
    }
    float _1106 = _1104;
    float _1108 = _1106;
    if (!_1009)
    {
        _1108 = 7.345489978790283203125;
    }
    float _1110 = _1108;
    float _1112 = trunc(_1102);
    float _1114 = precise::max(_1112, 0.0);
    uint _1116 = uint(_1114);
    float _1118 = float(uint(_1086));
    int _1120 = int(_1080) + int(_1116);
    float _1122 = _1110 * _1094;
    float _1124 = float(_1013);
    float _1126 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1128 = float(_1059);
    int _1130 = _1041 * _1120;
    int _1132 = _1130 + _1059;
    float _1134 = _1110;
    float _1136 = _1098;
    if (_1009)
    {
        _1134 = 1.0;
    }
    float _1138 = _1134;
    float _1140 = floor(_1122);
    float _1142 = _1138;
    if (!_1009)
    {
        _1142 = 1.2345600128173828125;
    }
    float _1144 = _1142;
    float _1146 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1148 = _1128 >= _1124;
    bool _1150 = isnan(_1128);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(_1124);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = fma(_1126, -2.0, _1015);
    bool _1162 = uint(_1132) >= uint(_1013);
    float _1164 = _1033 * _1144;
    int _1166 = _1013 + (-1);
    float _1168 = -_1017;
    float _1170 = fma(_1146, 2.0, _1168);
    bool _1172 = !_1162;
    int _1174 = _1172 ? 0 : (-1);
    float _1176 = trunc(_1158);
    int _1178 = int(_1176);
    bool _1180 = _1001 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1182 = isnan(_1001);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1160);
    int _1194 = ~_1120;
    int _1196 = _1194 + _1174;
    int _1198 = _1196 + 1;
    float _1200 = -_149;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1170);
    float _1204 = float(_115);
    float _1206 = -_1140;
    float _1208 = _1122 + _1206;
    int _1210 = as_type<int>(_1067) + (-2);
    int _1212 = _1013 * _1198;
    int _1214 = _1212 + _1059;
    float _1216 = floor(_1164);
    int _1218 = ~_1023;
    int _1220 = _1218 + 1;
    float _1222 = as_type<float>(_1210) * _1118;
    bool _1224 = !_1043;
    int _1226 = _1224 ? _1214 : (-1);
    bool _1228 = _1001 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1230 = isnan(_1001);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = 1.0 / _1204;
    int _1242 = ~_1178;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    int _1248 = _1226 * _1246;
    float _1250 = trunc(_1222);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    float _1256 = -_1216;
    float _1258 = _1164 + _1256;
    int _1260 = _1178 * _1166;
    int _1262 = _1260 + _1248;
    float _1264 = _1208 * _1124;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1276 = _1274 != 0;
    float _1278 = _149 * _1240;
    int _1280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1282 = _1280 != 0;
    float _1284 = trunc(_1264);
    int _1286 = int(_1284);
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1290 = _1288 != 0;
    float _1292 = _1278 * _1124;
    bool _1294 = !_1272;
    int _1296 = _1294 ? 0 : 1;
    bool _1298 = !_1268;
    int _1300 = _1298 ? 0 : 1;
    int _1302 = _1220 * int(_1254);
    int _1304 = _1302 + _1086;
    int _1306 = abs(_1296);
    float _1308 = trunc(_1292);
    int _1310 = int(_1308);
    int _1312 = abs(_1300);
    float _1314 = float(uint(_1304));
    bool _1316 = !_1282;
    int _1318 = _1316 ? 0 : 1;
    bool _1320 = !_1276;
    int _1322 = _1320 ? 0 : 1;
    float _1324 = as_type<float>(_1210) * _1314;
    int _1326 = abs(_1318);
    float _1328 = trunc(_1324);
    float _1330 = precise::max(_1328, 0.0);
    uint _1332 = uint(_1330);
    bool _1334 = !_1290;
    int _1336 = _1334 ? 0 : 1;
    int _1338 = _1286 * _1326;
    int _1340 = _1338 + _1059;
    int _1342 = abs(_1322);
    int _1344 = _1262 * _1306;
    int _1346 = abs(_1336);
    float _1348 = float(_1023);
    int _1350 = _1310 * _1312;
    int _1352 = _1350 + _1344;
    int _1354 = ~_1023;
    int _1356 = _1354 + 1;
    float _1358 = float(_1086);
    int _1360 = _1340 * _1342;
    int _1362 = _1360 + _1352;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1366 = _1364 != 0;
    bool _1368 = _1358 >= _1348;
    bool _1370 = isnan(_1358);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(_1348);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    int _1380 = _1286 * _1346;
    int _1382 = _1380 + _1362;
    int _1384 = int(_1254) + int(_1332);
    float _1386 = _1258 * _1348;
    float _1388 = _1278 * _1348;
    int _1390 = _1023 + (-1);
    float _1392 = trunc(_1378);
    int _1394 = int(_1392);
    float _1396 = float(uint(_1382));
    int _1398 = _1356 * _1384;
    int _1400 = _1398 + _1086;
    float _1402 = as_type<float>(_1055) * _1396;
    bool _1404 = uint(_1400) >= uint(_1023);
    float _1406 = trunc(_1386);
    int _1408 = int(_1406);
    bool _1410 = !_1366;
    int _1412 = _1410 ? 0 : 1;
    bool _1414 = !_1404;
    int _1416 = _1414 ? 0 : (-1);
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1420 = _1418 != 0;
    int _1422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1424 = _1422 != 0;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1428 = _1426 != 0;
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1432 = _1430 != 0;
    int _1434 = ~_1384;
    int _1436 = _1434 + _1416;
    int _1438 = _1436 + 1;
    float _1440 = trunc(_1402);
    float _1442 = precise::max(_1440, 0.0);
    uint _1444 = uint(_1442);
    int _1446 = abs(_1412);
    int _1448 = ~_1013;
    int _1450 = _1448 + 1;
    int _1452 = _1023 * _1438;
    int _1454 = _1452 + _1086;
    bool _1456 = _1023 == 0;
    int _1458 = _1408 * _1446;
    int _1460 = _1458 + _1086;
    int _1462 = ~_1394;
    int _1464 = _1462 + 1;
    int _1466 = _1464 + 1;
    float _1468 = trunc(_1388);
    int _1470 = int(_1468);
    bool _1472 = !_1456;
    int _1474 = _1472 ? _1454 : (-1);
    bool _1476 = _1013 == 0;
    int _1478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1480 = _1478 != 0;
    int _1482 = _1450 * int(_1444);
    int _1484 = _1482 + _1382;
    int _1486 = _1474 * _1466;
    bool _1488 = !_1424;
    int _1490 = _1488 ? 0 : 1;
    float _1492 = float(uint(_1484));
    int _1494 = _1394 * _1390;
    int _1496 = _1494 + _1486;
    bool _1498 = !_1420;
    int _1500 = _1498 ? 0 : 1;
    int _1502 = abs(_1490);
    float _1504 = as_type<float>(_1055) * _1492;
    bool _1506 = !_1428;
    int _1508 = _1506 ? 0 : 1;
    int _1510 = abs(_1500);
    float _1512 = trunc(_1504);
    float _1514 = precise::max(_1512, 0.0);
    uint _1516 = uint(_1514);
    bool _1518 = !_1432;
    int _1520 = _1518 ? 0 : 1;
    int _1522 = _1496 * _1502;
    int _1524 = abs(_1508);
    int _1526 = abs(_1520);
    int _1528 = _1470 * _1510;
    int _1530 = _1528 + _1522;
    float _1532 = float(uint(_1340));
    int _1534 = _1460 * _1524;
    int _1536 = _1534 + _1530;
    float _1538 = float(uint(_1460));
    int _1540 = ~_1013;
    int _1542 = _1540 + 1;
    int _1544 = _1408 * _1526;
    int _1546 = _1544 + _1536;
    int _1548 = int(_1444) + int(_1516);
    float _1550 = as_type<float>(_1055) * _1532;
    float _1552 = as_type<float>(_1210) * _1538;
    float _1554 = float(uint(_1546));
    float _1556 = trunc(_1550);
    float _1558 = precise::max(_1556, 0.0);
    uint _1560 = uint(_1558);
    int _1562 = ~_1013;
    int _1564 = _1562 + 1;
    int _1566 = _1542 * _1548;
    int _1568 = _1566 + _1382;
    int _1570 = ~_1023;
    int _1572 = _1570 + 1;
    int _1574 = ~_1013;
    int _1576 = _1574 + 1;
    bool _1578 = uint(_1568) >= uint(_1013);
    float _1580 = trunc(_1552);
    float _1582 = precise::max(_1580, 0.0);
    uint _1584 = uint(_1582);
    float _1586 = as_type<float>(_1210) * _1554;
    int _1588 = 0;
    if (_1480)
    {
        _1588 = 0;
    }
    int _1590 = _1588;
    bool _1592 = !_1578;
    int _1594 = _1592 ? 0 : (-1);
    int _1596 = _1590;
    if (!_1480)
    {
        _1596 = 1;
    }
    int _1598 = _1596;
    float _1600 = trunc(_1586);
    float _1602 = precise::max(_1600, 0.0);
    uint _1604 = uint(_1602);
    int _1606 = ~_1548;
    int _1608 = _1606 + _1594;
    int _1610 = _1608 + 1;
    int _1612 = _1564 * int(_1560);
    int _1614 = _1612 + _1340;
    bool _1616 = _1094 > 0.5;
    int _1618 = _1013 * _1610;
    int _1620 = _1618 + _1382;
    int _1622 = _1572 * int(_1584);
    int _1624 = _1622 + _1460;
    float _1626 = float(uint(_1614));
    bool _1628 = !_1476;
    int _1630 = _1628 ? _1620 : (-1);
    float _1632 = float(uint(_1624));
    float _1634 = as_type<float>(_1055) * _1626;
    int _1636 = _1630 & 3;
    bool _1638 = _1636 != 0;
    int _1640 = _1572 * int(_1604);
    int _1642 = _1640 + _1546;
    int _1644 = _1630 & 3;
    bool _1646 = _1644 != 0;
    float _1648 = as_type<float>(_1210) * _1632;
    bool _1650 = uint(_1636) > 1u;
    float _1652 = trunc(_1634);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    float _1658 = float(uint(_1642));
    bool _1660 = uint(_1636) >= 2u;
    float _1662 = -_207;
    int _1664 = _1616 ? as_type<int>(_1662) : as_type<int>(_207);
    float _1666 = as_type<float>(_1210) * _1658;
    int _1668 = _1646 ? 0 : 1;
    float _1670 = trunc(_1648);
    float _1672 = precise::max(_1670, 0.0);
    uint _1674 = uint(_1672);
    bool _1676 = _1100 > 0.5;
    int _1678 = ~_1668;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    int _1684 = _1682;
    if (!_1650)
    {
        int _1686 = ~_1668;
        int _1688 = _1686 + 1;
        _1684 = _1688;
    }
    int _1690 = _1684;
    bool _1692 = _1636 != 3;
    float _1694 = trunc(_1666);
    float _1696 = precise::max(_1694, 0.0);
    uint _1698 = uint(_1696);
    int _1700 = int(_1560) + int(_1656);
    int _1702 = _1660 ? 0 : 1;
    bool _1704 = _1096 > 0.5;
    int _1706 = _1576 * _1700;
    int _1708 = _1706 + _1340;
    int _1710 = ~_1023;
    int _1712 = _1710 + 1;
    int _1714 = int(_1584) + int(_1674);
    int _1716 = ~_1702;
    int _1718 = _1716 + 1;
    int _1720 = _1718 + 1;
    bool _1722 = uint(_1708) >= uint(_1013);
    int _1724 = _1712 * _1714;
    int _1726 = _1724 + _1460;
    int _1728 = int(_1604) + int(_1698);
    int _1730 = ~_1023;
    int _1732 = _1730 + 1;
    int _1734 = _1720;
    if (_1692)
    {
        int _1736 = ~_1702;
        int _1738 = _1736 + 1;
        _1734 = _1738;
    }
    int _1740 = _1734;
    bool _1742 = !_1722;
    int _1744 = _1742 ? 0 : (-1);
    int _1746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1748 = _1746 != 0;
    int _1750 = _1732 * _1728;
    int _1752 = _1750 + _1546;
    bool _1754 = uint(_1726) >= uint(_1023);
    bool _1756 = !_1748;
    int _1758 = _1756 ? 0 : 1;
    bool _1760 = !_1754;
    int _1762 = _1760 ? 0 : (-1);
    int _1764 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1766 = _1764 != 0;
    bool _1768 = uint(_1752) >= uint(_1023);
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1774 = in.m_56.x;
    float _1776 = in.m_56.y;
    float _1778 = in.m_56.z;
    bool _1780 = !_1766;
    float _1782 = _1780 ? _207 : as_type<float>(_1664);
    float _1784 = 1.0 / _1772;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _1790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1792 = _1790 != 0;
    float _1794 = -_211;
    int _1796 = _1704 ? as_type<int>(_1794) : as_type<int>(_211);
    bool _1798 = _1098 > 0.5;
    float _1800 = 1.0 / _1788;
    bool _1802 = !_1792;
    float _1804 = _1802 ? _211 : as_type<float>(_1796);
    bool _1806 = !_1768;
    int _1808 = _1806 ? 0 : (-1);
    float _1810 = -_207;
    int _1812 = _1798 ? as_type<int>(_1810) : as_type<int>(_207);
    int _1814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1816 = _1814 != 0;
    int _1818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1820 = _1818 != 0;
    float _1822 = -_1190;
    float _1824 = _1822 + 1.0;
    int _1826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1828 = _1826 != 0;
    float _1830 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1830;
    bool _1834 = _1001 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1836 = isnan(_1001);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1842 = _1838 || _1840;
    float _1844 = float(_1842);
    float _1846 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1848 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1850 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1852 = _1832 * _1784;
    float _1854 = -_1844;
    float _1856 = _1854 + 1.0;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1860 = _1858 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1864 = _1001 + _1862;
    float _1866 = fma(_1774, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1846);
    float _1868 = fma(_1774, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1848);
    float _1870 = fma(_1774, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1850);
    float _1872 = _1190 * _1856;
    float _1874 = _1860 * _1800;
    float _1876 = fma(_1852, _1864, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1878 = _1238 * _1824;
    bool _1880 = !_1828;
    float _1882 = _1880 ? _207 : as_type<float>(_1812);
    float _1884 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1866);
    bool _1886 = _1598 != 1;
    float _1888 = _1876 * _1878;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1892 = _1001 + _1890;
    float _1894 = _1804 + (-0.5);
    float _1896 = -_1238;
    float _1898 = _1896 + 1.0;
    float _1900 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1868);
    float _1902 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1870);
    float _1904 = -_1894;
    float _1906 = -_1192;
    float _1908 = fma(_1904, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1906);
    float _1910 = fma(_1874, _1892, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1912 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1888);
    float _1914 = _1782 + 0.5;
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1918 = fma(_1910, _1872, _1912);
    int _1920 = ~_1728;
    int _1922 = _1920 + _1808;
    int _1924 = _1922 + 1;
    float _1926 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1202);
    float _1928 = _1874;
    float _1930 = _1870;
    float _1932 = _1888;
    if (!_1886)
    {
        _1928 = _1096;
    }
    float _1934 = _1928;
    float _1936 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1916);
    float _1938 = _1934;
    if (!_1886)
    {
        _1930 = _1096;
    }
    float _1940 = _1930;
    int _1942 = _1023 * _1924;
    int _1944 = _1942 + _1546;
    float _1946 = _1940;
    if (_1886)
    {
        _1938 = _1094;
    }
    float _1948 = _1938;
    float _1950 = _1900 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_1886)
    {
        _1946 = _1094;
    }
    float _1952 = _1946;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1956 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_1886)
    {
        _1932 = _1098;
    }
    float _1958 = _1932;
    float _1960 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1954);
    float _1962 = _1958;
    if (_1886)
    {
        _1136 = _1096;
    }
    float _1964 = _1136;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1886)
    {
        _1962 = _1096;
    }
    float _1968 = _1962;
    float _1970 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1936);
    float _1972 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1966);
    int _1974 = _1630 >> 31;
    float _1976 = _1884 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1978 = !_1456;
    int _1980 = _1978 ? _1944 : (-1);
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1984 = _1974 & 3;
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = _1950 + _1986;
    int _1990 = _1980 >> 31;
    float _1992 = fma(_1968, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1982);
    int _1994 = _1630 + _1984;
    float _1996 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1918);
    int _1998 = _1990 & 3;
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2002 = _1994 >> 2;
    float _2004 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2006 = _1980 + _1998;
    float _2008 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1960);
    int _2010 = _2002 << 4;
    int _2012 = _2010 + 368;
    float _2014 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1972);
    int _2016 = _2006 >> 2;
    float _2018 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1992);
    uint _2020 = uint(int(uint(_2012) >> uint(2)));
    uint _2022 = uint(int(uint(int(_2020)) >> uint(2)));
    int _2024 = int(_2020) & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    int _2028 = int(_2020) + 1;
    uint _2030 = uint(int(uint(_2028) >> uint(2)));
    int _2032 = _2028 & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    bool _2036 = !_1638;
    int _2038 = _2036 ? 0 : 1;
    float _2040 = _1902 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2042 = _2016 << 4;
    int _2044 = _2042 + 512;
    float _2046 = -_2018;
    float _2048 = _2046 + 1.0;
    int _2050 = _1980 & 3;
    bool _2052 = _2050 != 0;
    float _2054 = _1882 + 0.5;
    int _2056 = _1980 & 3;
    bool _2058 = _2056 != 0;
    uint _2060 = uint(int(uint(_2044) >> uint(2)));
    uint _2062 = uint(int(uint(int(_2060)) >> uint(2)));
    int _2064 = int(_2060) & 3;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[int(_2062)][_2064];
    int _2068 = int(_2060) + 1;
    uint _2070 = uint(int(uint(_2068) >> uint(2)));
    int _2072 = _2068 & 3;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[int(_2070)][_2072];
    float _2076 = -_1970;
    float _2078 = _2076 + 1.0;
    int _2080 = _2052 ? 0 : 1;
    bool _2082 = uint(_2056) > 1u;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2086 = ~_2080;
    int _2088 = _2086 + 1;
    int _2090 = _2088 + 1;
    bool _2092 = !_2058;
    int _2094 = _2092 ? 0 : 1;
    float _2096 = -_2084;
    float _2098 = fma(_1956, 2.0, _2096);
    bool _2100 = _1636 != 3;
    int _2102 = _2012 + 8;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    uint _2106 = uint(int(uint(int(_2104)) >> uint(2)));
    int _2108 = int(_2104) & 3;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[int(_2106)][_2108];
    int _2112 = int(_2104) + 1;
    uint _2114 = uint(int(uint(_2112) >> uint(2)));
    int _2116 = _2112 & 3;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[int(_2114)][_2116];
    float _2120 = -_149;
    float _2122 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2098);
    int _2124 = ~_1700;
    int _2126 = _2124 + _1744;
    int _2128 = _2126 + 1;
    int _2130 = abs(_1690);
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2134 = _2090;
    if (!_2082)
    {
        int _2136 = ~_2080;
        int _2138 = _2136 + 1;
        _2134 = _2138;
    }
    int _2140 = _2134;
    float _2142 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2144 = _1976 + _2142;
    int _2146 = _2044 + 8;
    uint _2148 = uint(int(uint(_2146) >> uint(2)));
    uint _2150 = uint(int(uint(int(_2148)) >> uint(2)));
    int _2152 = int(_2148) & 3;
    float _2154 = (*spvDescriptorSet0.vp_c9)._m0[int(_2150)][_2152];
    int _2156 = int(_2148) + 1;
    uint _2158 = uint(int(uint(_2156) >> uint(2)));
    int _2160 = _2156 & 3;
    float _2162 = (*spvDescriptorSet0.vp_c9)._m0[int(_2158)][_2160];
    float _2164 = fma(_2004, -2.0, _2132);
    bool _2166 = uint(_2056) >= 2u;
    float _2168 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2000);
    bool _2170 = !_2100;
    int _2172 = _2170 ? 0 : (-1);
    float _2174 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2164);
    bool _2176 = _2056 != 3;
    int _2178 = _1013 * _2128;
    int _2180 = _2178 + _1340;
    int _2182 = _2166 ? 0 : 1;
    float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2186 = _2040 + _2184;
    int _2188 = abs(_2140);
    float _2190 = fma(_2054, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2122);
    int _2192 = ~_2182;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    float _2198 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2168);
    int _2200 = abs(_2038);
    int _2202 = ~_2188;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    int _2208 = _2196;
    if (_2176)
    {
        int _2210 = ~_2182;
        int _2212 = _2210 + 1;
        _2208 = _2212;
    }
    int _2214 = _2208;
    int _2216 = ~_2130;
    int _2218 = _2216 + 1;
    int _2220 = _2218 + 1;
    int _2222 = abs(_2094);
    int _2224 = abs(_1740);
    int _2226 = _2220 * as_type<int>(_2034);
    int _2228 = _2206 * as_type<int>(_2074);
    int _2230 = ~_2200;
    int _2232 = _2230 + 1;
    int _2234 = _2232 + 1;
    int _2236 = ~_2222;
    int _2238 = _2236 + 1;
    int _2240 = _2238 + 1;
    bool _2242 = _2056 != 3;
    int _2244 = _2234 * as_type<int>(_2026);
    int _2246 = _2244 + _2226;
    int _2248 = ~_2224;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    int _2254 = _2240 * as_type<int>(_2066);
    int _2256 = _2254 + _2228;
    int _2258 = abs(_2214);
    int _2260 = abs(_2172);
    int _2262 = _2252 * as_type<int>(_2110);
    int _2264 = _2262 + _2246;
    bool _2266 = !_2242;
    int _2268 = _2266 ? 0 : (-1);
    int _2270 = ~_2260;
    int _2272 = _2270 + 1;
    int _2274 = _2272 + 1;
    int _2276 = ~_2258;
    int _2278 = _2276 + 1;
    int _2280 = _2278 + 1;
    int _2282 = abs(_2268);
    int _2284 = _2274 * as_type<int>(_2118);
    int _2286 = _2284 + _2264;
    bool _2288 = !_1820;
    int _2290 = _2288 ? 0 : 1;
    int _2292 = _2280 * as_type<int>(_2154);
    int _2294 = _2292 + _2256;
    int _2296 = ~_1714;
    int _2298 = _2296 + _1762;
    int _2300 = _2298 + 1;
    float _2302 = -_211;
    int _2304 = _1676 ? as_type<int>(_2302) : as_type<int>(_211);
    int _2306 = abs(_1758);
    int _2308 = abs(_2290);
    int _2310 = ~_2282;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    bool _2316 = !_1816;
    float _2318 = _2316 ? _211 : as_type<float>(_2304);
    int _2320 = _1023 * _2300;
    int _2322 = _2320 + _1460;
    int _2324 = ~_2306;
    int _2326 = _2324 + 1;
    int _2328 = _2326 + 1;
    int _2330 = _2314 * as_type<int>(_2162);
    int _2332 = _2330 + _2294;
    int _2334 = ~_2308;
    int _2336 = _2334 + 1;
    int _2338 = _2336 + 1;
    float _2340 = _1988 * _1988;
    bool _2342 = !_1476;
    int _2344 = _2342 ? _2180 : (-1);
    int _2346 = _2286 * _2328;
    bool _2348 = !_1456;
    int _2350 = _2348 ? _2322 : (-1);
    int _2352 = _2332 * _2338;
    bool _2354 = _2198 >= 0.0;
    int _2356 = _2344 * _2306;
    int _2358 = _2356 + _2346;
    float _2360 = _2318 + (-0.5);
    int _2362 = _2350 * _2308;
    int _2364 = _2362 + _2352;
    float _2366 = fma(_2144, _2144, _2340);
    float _2368 = -_2008;
    float _2370 = _2368 + 1.0;
    float _2372 = -_2360;
    float _2374 = -_2174;
    float _2376 = fma(_2372, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2374);
    float _2378 = -_2014;
    float _2380 = _2378 + 1.0;
    float _2382 = fma(_2186, _2186, _2366);
    float _2384 = _967 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2386 = fma(_2318, _2048, _2376);
    float _2388 = _965 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2390 = _969 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_2354)
    {
        _973 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2392 = _973;
    float _2394 = rsqrt(_2382);
    float _2396 = -_2078;
    float _2398 = fma(_1782, _2396, _1926);
    float _2400 = fma(_1804, _2370, _1908);
    float _2402 = -_2380;
    float _2404 = fma(_1882, _2402, _2190);
    float _2406 = _2388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2408 = _2384 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2410 = _2390 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2412 = _1996 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2414 = as_type<int>(_2392);
    float _2416 = _2404;
    if (_2354)
    {
        float _2418 = _2392 * 5.0;
        _2414 = as_type<int>(_2418);
    }
    int _2420 = _2414;
    float _2422 = float(_2358);
    out.m_74.x = _2398;
    out.m_74.y = _2400;
    out.m_74.z = _2404;
    out.m_74.w = _2386;
    float _2424 = float(_2364);
    out.m_76.x = _2406;
    out.m_76.y = _2408;
    out.m_76.z = _2410;
    out.m_76.w = _2412;
    float _2426 = _1988 * _2394;
    float _2428 = _2144 * _2394;
    if (_2354)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7673 = as_type<float>(_2420);
        out.gl_Position.z = _7673;
    }
    out.m_78.x = _2422;
    out.m_78.y = _2424;
    if (_2354)
    {
        out.m_59.x = 0.0;
    }
    if (_2354)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2430 = -_2426;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1950);
    float _2434 = _2186 * _2394;
    float _2436 = -_2428;
    float _2438 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1976);
    float _2440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2442 = _2432 + _2440;
    float _2444 = -_2434;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2040);
    float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2450 = _2438 + _2448;
    float _2452 = _2442 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2456 = _2446 + _2454;
    float _2458 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2452);
    float _2460 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2458);
    bool _2462 = _2460 >= 0.0;
    float _2464 = _2434;
    if (_2462)
    {
        _2416 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2466 = _2416;
    int _2468 = as_type<int>(_2466);
    if (_2462)
    {
        out.m_59.x = 0.0;
    }
    if (_2462)
    {
        float _2470 = _2466 * 5.0;
        _2468 = as_type<int>(_2470);
    }
    int _2472 = _2468;
    if (_2462)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7772 = as_type<float>(_2472);
        out.gl_Position.z = _7772;
    }
    if (_2462)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2474 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2476 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2478 = floor(_2474);
    float _2480 = floor(_2476);
    float _2482 = -_2478;
    float _2484 = _2474 + _2482;
    float _2486 = -_2480;
    float _2488 = _2476 + _2486;
    float2 _7808 = float2(_2484, _2488);
    float _2490 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7808, float2(0.0), isnan(_7808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7808, float2(0.0), isnan(_7808)), level(0.0)).x;
    float _2492 = _2432 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2494 = -_2426;
    float _2496 = fma(_2494, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1988);
    float _2498 = -_2428;
    float _2500 = fma(_2498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2144);
    float _2502 = -_2434;
    float _2504 = fma(_2502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2186);
    float _2506 = fma(_2438, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2492);
    float _2508 = _2496 * _2496;
    float _2510 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2512 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2506);
    float _2514 = _2432 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2516 = fma(_2500, _2500, _2508);
    float _2518 = _2512 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2520 = fma(_2438, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2514);
    float _2522 = fma(_2504, _2504, _2516);
    float _2524 = 1.0 / _2518;
    float _2526 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2520);
    float _2528 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _2530 = _2526 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2532 = sqrt(_2522);
    float _2534 = _2530 + _2518;
    float _2536 = _513 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2538 = _2432 + _2528;
    float _2540 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2542 = _2534 * _2524;
    float _2544 = _2542 * 0.5;
    float _2546 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2548 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2540);
    float _2550 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2552 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2550);
    float _2554 = _509 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2556 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2546);
    float _2558 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2548);
    float _2560 = _2394 * _2532;
    float _2562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _2564 = 1.0 / _2552;
    float _2566 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2568 = _2560 * _2554;
    float _2570 = _2560 * _2536;
    float _2572 = _2560 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2574 = _2572 * 0.5;
    float _2576 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2556);
    float _2578 = _2562 * _2568;
    float _2580 = _2510 * _2570;
    float _2582 = trunc(_2566);
    int _2584 = int(_2582);
    float _2586 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2588 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2590 = _2578 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2592 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2586);
    float _2594 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2588);
    float _2596 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2598 = _2564 * _2596;
    float _2600 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2592);
    float _2602 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2594);
    bool _2604 = _2598 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _2606 = _2598 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _2608 = _2602 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _2610 = !_2604;
    int _2612 = _2610 ? 0 : 1;
    float _2614 = _1976 + _2608;
    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2618 = _2614 + _2616;
    int _2620 = 2;
    float _2622 = _2580;
    float _2624 = _2566;
    if (!_2604)
    {
        _2620 = 1;
    }
    int _2626 = _2620;
    int _2628 = _2626;
    if (!_2606)
    {
        _2628 = _2612;
    }
    int _2630 = _2628;
    float _2632 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _2634 = _2630 << 6;
    float _2636 = _2040 + _2632;
    int _2638 = _2634 + 48;
    uint _2640 = uint(int(uint(_2638) >> uint(2)));
    uint _2642 = uint(int(uint(int(_2640)) >> uint(2)));
    int _2644 = int(_2640) & 3;
    float _2646 = (*spvDescriptorSet0.vp_c15)._m0[int(_2642)][_2644];
    int _2648 = int(_2640) + 1;
    uint _2650 = uint(int(uint(_2648) >> uint(2)));
    int _2652 = _2648 & 3;
    float _2654 = (*spvDescriptorSet0.vp_c15)._m0[int(_2650)][_2652];
    float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2658 = _2636 + _2656;
    float _2660 = _2658 * _2658;
    int _2662 = _2634 + 56;
    uint _2664 = uint(int(uint(_2662) >> uint(2)));
    uint _2666 = uint(int(uint(int(_2664)) >> uint(2)));
    int _2668 = int(_2664) & 3;
    float _2670 = (*spvDescriptorSet0.vp_c15)._m0[int(_2666)][_2668];
    int _2672 = int(_2664) + 1;
    uint _2674 = uint(int(uint(_2672) >> uint(2)));
    int _2676 = _2672 & 3;
    float _2678 = (*spvDescriptorSet0.vp_c15)._m0[int(_2674)][_2676];
    float _2680 = fma(_2618, _2618, _2660);
    float _2682 = fma(_2580, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2590);
    float _2684 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2686 = sqrt(_2680);
    float _2688 = fma(_2574, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2682);
    int _2690 = _2634 + 64;
    uint _2692 = uint(int(uint(_2690) >> uint(2)));
    uint _2694 = uint(int(uint(int(_2692)) >> uint(2)));
    int _2696 = int(_2692) & 3;
    float _2698 = (*spvDescriptorSet0.vp_c15)._m0[int(_2694)][_2696];
    int _2700 = int(_2692) + 1;
    uint _2702 = uint(int(uint(_2700) >> uint(2)));
    int _2704 = _2700 & 3;
    float _2706 = (*spvDescriptorSet0.vp_c15)._m0[int(_2702)][_2704];
    float _2708 = _2688 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2710 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2712 = _2584 + _2710;
    int _2714 = _2712 + 1;
    float _2716 = trunc(_2684);
    int _2718 = int(_2716);
    float _2720 = _1950 + _2708;
    int _2722 = _2634 + 72;
    uint _2724 = uint(int(uint(_2722) >> uint(2)));
    uint _2726 = uint(int(uint(int(_2724)) >> uint(2)));
    int _2728 = int(_2724) & 3;
    float _2730 = (*spvDescriptorSet0.vp_c15)._m0[int(_2726)][_2728];
    int _2732 = int(_2724) + 1;
    uint _2734 = uint(int(uint(_2732) >> uint(2)));
    int _2736 = _2732 & 3;
    float _2738 = (*spvDescriptorSet0.vp_c15)._m0[int(_2734)][_2736];
    bool _2740 = _2686 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2742 = _2634 + 96;
    uint _2744 = uint(int(uint(_2742) >> uint(2)));
    uint _2746 = uint(int(uint(int(_2744)) >> uint(2)));
    int _2748 = int(_2744) & 3;
    float _2750 = (*spvDescriptorSet0.vp_c15)._m0[int(_2746)][_2748];
    int _2752 = int(_2744) + 1;
    uint _2754 = uint(int(uint(_2752) >> uint(2)));
    int _2756 = _2752 & 3;
    float _2758 = (*spvDescriptorSet0.vp_c15)._m0[int(_2754)][_2756];
    int _2760 = _2634 + 104;
    uint _2762 = uint(int(uint(_2760) >> uint(2)));
    uint _2764 = uint(int(uint(int(_2762)) >> uint(2)));
    int _2766 = int(_2762) & 3;
    float _2768 = (*spvDescriptorSet0.vp_c15)._m0[int(_2764)][_2766];
    int _2770 = int(_2762) + 1;
    uint _2772 = uint(int(uint(_2770) >> uint(2)));
    int _2774 = _2770 & 3;
    float _2776 = (*spvDescriptorSet0.vp_c15)._m0[int(_2772)][_2774];
    float _2778 = _2708;
    float _2780 = _2636;
    if (!_2740)
    {
        _2778 = _2614;
    }
    float _2782 = _2778;
    float _2784 = _2782;
    if (!_2740)
    {
        _2622 = _2720;
    }
    float _2786 = _2622;
    bool _2788 = !_2740;
    float _2790 = _2786;
    int _2792 = as_type<int>(_2750);
    int _2794 = as_type<int>(_2776);
    int _2796 = as_type<int>(_2706);
    if (!_2788)
    {
        float _2798 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2800 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2802 = _2686 + _2800;
        float _2804 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2806 = rsqrt(_2680);
        float _2808 = _2802 * _2798;
        float _2810 = _2808 * 0.15915493667125701904296875;
        float _2812 = _2810 * 6.283185482025146484375;
        float _2814 = sin(_2812);
        float _2816 = _2810 * 6.283185482025146484375;
        float _2818 = cos(_2816);
        float _2820 = fma(_2814, _2804, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2822 = _2806 * _2820;
        float _2824 = _2818 + (-1.0);
        float _2826 = fma(_2618, _2822, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2828 = fma(_2658, _2822, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2830 = _2824 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2832 = fma(_2720, _2818, _2830);
        _2790 = _2832;
        _2784 = _2826;
        _2780 = _2828;
    }
    float _2834 = _2790;
    float _2836 = _2784;
    float _2838 = _2780;
    float _2840 = -_1950;
    float _2842 = _2840 + _2834;
    int _2844 = _2634 + 80;
    uint _2846 = uint(int(uint(_2844) >> uint(2)));
    uint _2848 = uint(int(uint(int(_2846)) >> uint(2)));
    int _2850 = int(_2846) & 3;
    float _2852 = (*spvDescriptorSet0.vp_c15)._m0[int(_2848)][_2850];
    int _2854 = int(_2846) + 1;
    uint _2856 = uint(int(uint(_2854) >> uint(2)));
    int _2858 = _2854 & 3;
    float _2860 = (*spvDescriptorSet0.vp_c15)._m0[int(_2856)][_2858];
    float _2862 = -_1976;
    float _2864 = _2862 + _2836;
    int _2866 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2868 = _2718 + _2866;
    int _2870 = _2868 + 1;
    float _2872 = _2842 * _2842;
    float _2874 = -_2040;
    float _2876 = _2874 + _2838;
    bool _2878 = _2714 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2880 = _2538 * _2758;
    float _2882 = fma(_2864, _2864, _2872);
    int _2884 = _2714 | _2870;
    float _2886 = fma(_2438, _2750, _2880);
    float _2888 = fma(_2876, _2876, _2882);
    bool _2890 = _2884 < 0;
    bool _2892 = _2890 || _2878;
    float _2894 = _2538 * _2654;
    float _2896 = fma(_2446, _2768, _2886);
    float _2898 = sqrt(_2888);
    bool _2900 = _2870 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2902 = _2900 || _2892;
    float _2904 = _2538 * _2706;
    float _2906 = _2896 + _2776;
    float _2908 = fma(_2438, _2646, _2894);
    bool _2910 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2912 = isnan(0.5);
    bool _2914 = _2910 || _2912;
    bool _2916 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2918 = _2914 || _2916;
    float _2920 = fma(_2438, _2698, _2904);
    float _2922 = 1.0 / _2906;
    float _2924 = fma(_2446, _2670, _2908);
    float _2926 = fma(_2446, _2730, _2920);
    int _2928 = as_type<int>(_2904);
    float _2930 = _2836;
    float _2932 = _2834;
    float _2934 = _2838;
    if (!_2902)
    {
        int _2936 = _2870 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2938 = _2936 + _2714;
        _2792 = _2938;
    }
    int _2940 = _2792;
    bool _2942 = _2898 > 0.0;
    float _2944 = _2758;
    if (!_2902)
    {
        float _2946 = floor(_2566);
        _2944 = _2946;
    }
    float _2948 = _2944;
    if (!_2902)
    {
        int _2950 = _2940 << 2;
        _2794 = _2950;
    }
    int _2952 = _2794;
    if (!_2902)
    {
        uint _2954 = uint(int(uint(_2940) >> uint(2)));
        _2796 = int(_2954);
    }
    int _2956 = _2796;
    int _2958 = _2956;
    if (!_2902)
    {
        int _2960 = 12 & _2952;
        _2928 = _2960;
    }
    int _2962 = _2928;
    float _2964 = _2924 + _2678;
    if (!_2902)
    {
        int _2966 = _2956 << 4;
        int _2968 = _2966 + _2962;
        _2958 = _2968;
    }
    int _2970 = _2958;
    bool _2972 = !_2942;
    if (!_2972)
    {
        float _2974 = _201 * _201;
        float _2976 = rsqrt(_2888);
        float _2978 = fma(_199, _199, _2974);
        float _2980 = fma(_203, _203, _2978);
        float _2982 = sqrt(_2980);
        float _2984 = _2864 * _2976;
        float _2986 = _2842 * _2976;
        float _2988 = _2876 * _2976;
        bool _2990 = _2982 > 0.0;
        bool _2992 = !_2990;
        if (!_2992)
        {
            float _2994 = rsqrt(_2980);
            float _2996 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2998 = _201 * _2994;
            float _3000 = _199 * _2994;
            float _3002 = _203 * _2994;
            float _3004 = _2986 * _2998;
            float _3006 = fma(_2984, _3000, _3004);
            float _3008 = _2996 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3010 = fma(_2988, _3002, _3006);
            float _3012 = _3010 * _3008;
            float _3014 = fma(_199, _3012, _2836);
            float _3016 = fma(_201, _3012, _2834);
            float _3018 = fma(_203, _3012, _2838);
            _2930 = _3014;
            _2932 = _3016;
            _2934 = _3018;
        }
    }
    float _3020 = _2930;
    float _3022 = _2932;
    float _3024 = _2934;
    float _3026 = -_2428;
    float _3028 = fma(_3026, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3020);
    float _3030 = -_2426;
    float _3032 = fma(_3030, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3022);
    float _3034 = -_2434;
    float _3036 = fma(_3034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3024);
    float _3038 = _2926 + _2738;
    float _3040 = _3032;
    float _3042 = _3028;
    float _3044 = _3036;
    if (!_2918)
    {
        float _3046 = _2442 * _2442;
        float _3048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3050 = -_2040;
        float _3052 = _3050 + _3024;
        float _3054 = fma(_2450, _2450, _3046);
        float _3056 = fma(_2456, _2456, _3054);
        float _3058 = 1.0 / _2560;
        float _3060 = sqrt(_3056);
        float _3062 = precise::min(_3060, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3064 = _3062 * _3048;
        float _3066 = -_1950;
        float _3068 = _3066 + _3022;
        float _3070 = _3064 * _3058;
        float _3072 = -_1976;
        float _3074 = _3072 + _3020;
        float _3076 = fma(_3068, _3070, _2432);
        float _3078 = fma(_3074, _3070, _2438);
        float _3080 = fma(_3052, _3070, _2446);
        _3040 = _3076;
        _3042 = _3078;
        _3044 = _3080;
    }
    float _3082 = _3040;
    float _3084 = _3042;
    float _3086 = _3044;
    float _3088 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3090 = _2040;
    if (!_2902)
    {
        int _3092 = _2970 + 400;
        uint _3094 = uint(int(uint(_3092) >> uint(2)));
        uint _3096 = uint(int(uint(int(_3094)) >> uint(2)));
        int _3098 = int(_3094) & 3;
        float _3100 = (*spvDescriptorSet0.vp_c15)._m0[int(_3096)][_3098];
        _3090 = _3100;
    }
    float _3102 = _3090;
    float _3104 = _3038 * _2922;
    float _3106 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3108 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3088);
    float _3110 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3112 = _2964 * _2922;
    float _3114 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3106);
    float _3116 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3108);
    int _3118 = _2634 + 88;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    uint _3122 = uint(int(uint(int(_3120)) >> uint(2)));
    int _3124 = int(_3120) & 3;
    float _3126 = (*spvDescriptorSet0.vp_c15)._m0[int(_3122)][_3124];
    int _3128 = int(_3120) + 1;
    uint _3130 = uint(int(uint(_3128) >> uint(2)));
    int _3132 = _3128 & 3;
    float _3134 = (*spvDescriptorSet0.vp_c15)._m0[int(_3130)][_3132];
    float _3136 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3110);
    float _3138 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3114);
    float _3140 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3142 = _3116 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _3144 = _3112 >= 0.0;
    float _3146 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3136);
    float _3148 = _3138 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3150 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3140);
    float _3152 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _3154 = _3112 <= 1.0;
    bool _3156 = _3154 && _3144;
    float _3158 = _3146 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3160 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3150);
    float _3162 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3152);
    bool _3164 = _3104 >= 0.0;
    bool _3166 = _3164 && _3156;
    float _3168 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3170 = _3160 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3172 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3162);
    bool _3174 = _3104 <= 1.0;
    bool _3176 = _3174 && _3166;
    float _3178 = _3158 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3180 = _1976;
    float _3182 = _3168;
    if (!_2902)
    {
        float _3184 = floor(_2684);
        _3180 = _3184;
    }
    float _3186 = _3180;
    float _3188 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3172);
    float _3190 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3192 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3194 = -_3178;
    float _3196 = fma(_3194, _3168, 1.0);
    float _3198 = _2538 * _2860;
    float _3200 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3190);
    float _3202 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3192);
    float _3204 = 1.0 / _3188;
    float _3206 = _3188;
    if (!_2902)
    {
        float _3208 = -_2948;
        float _3210 = _2566 + _3208;
        _2464 = _3210;
    }
    float _3212 = _2464;
    if (_3176)
    {
        float _3214 = float(_2630);
        _3182 = _3214;
    }
    float _3216 = _3182;
    float _3218 = fma(_2438, _2852, _3198);
    float _3220 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3200);
    float _3222 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3202);
    float _3224 = log2(_3196);
    float _3226 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3220);
    float _3228 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3222);
    float _3230 = _3186;
    if (!_2902)
    {
        float _3232 = -_3186;
        float _3234 = _2684 + _3232;
        _3230 = _3234;
    }
    float _3236 = _3230;
    float _3238 = _3198;
    float _3240 = _3236;
    if (_3176)
    {
        float _3242 = rint(_3216);
        float _3244 = precise::max(_3242, 0.0);
        uint _3246 = uint(_3244);
        uint _3248 = clamp(_3246, 0u, 65535u);
        _3238 = as_type<float>(_3248);
    }
    float _3250 = _3238;
    float _3252 = _3226 * _3204;
    float _3254 = _3228 * _3204;
    float _3256 = fma(_2446, _3126, _3218);
    float _3258 = fma(_3252, 0.5, 0.5);
    float _3260 = _3204;
    float _3262 = _3252;
    if (!_2902)
    {
        float _3264 = rint(_3102);
        float _3266 = precise::max(_3264, 0.0);
        uint _3268 = uint(_3266);
        uint _3270 = clamp(_3268, 0u, 65535u);
        _3260 = as_type<float>(_3270);
    }
    float _3272 = _3260;
    float _3274 = _3256 + _3134;
    float _3276 = _3224 * 0.693147182464599609375;
    float _3278 = fma(_3254, -0.5, 0.5);
    float _3280 = _3274 * _2922;
    float _3282 = _3276 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3284 = _3256;
    float _3286 = _3280;
    if (_3176)
    {
        float3 _9147 = float3(_3112, _3104, float(as_type<int>(_3250)));
        float3 _9151 = select(_9147, float3(0.0), isnan(_9147));
        float _3288 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _9151.xy, uint(rint(_9151.z)), _3280, level(0.0));
        _3284 = _3288;
    }
    float _3290 = _3284;
    float3 _9161 = float3(_3258, _3278, _3282);
    float _3292 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9161, float3(0.0), isnan(_9161)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9161, float3(0.0), isnan(_9161)), level(0.0)).x;
    float3 _9170 = float3(_3258, _3278, _3282);
    float4 _3295 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9170, float3(0.0), isnan(_9170)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9170, float3(0.0), isnan(_9170)), level(0.0)).xyzw;
    float _3297 = _3295.x;
    float _3299 = _3295.y;
    float _3301 = _3295.z;
    float _3303 = _3295.w;
    float _3305 = _3212;
    if (!_2902)
    {
        float3 _9193 = float3(_3212, _3236, float(as_type<int>(_3272)));
        float3 _9195 = select(_9193, float3(0.0), isnan(_9193));
        float _3307 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _9195.xy, uint(rint(_9195.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _9195.xy, uint(rint(_9195.z)), level(0.0)).x;
        _3305 = _3307;
    }
    float _3309 = _3305;
    if (_2902)
    {
        _2624 = 1.0;
    }
    float _3311 = _2624;
    float _3313 = _3311;
    float _3315 = _3309;
    if (!_2902)
    {
        int _3317 = _2940 << 4;
        int _3319 = _3317 + 2048;
        uint _3321 = uint(int(uint(_3319) >> uint(2)));
        uint _3323 = uint(int(uint(int(_3321)) >> uint(2)));
        int _3325 = int(_3321) & 3;
        float _3327 = (*spvDescriptorSet0.vp_c15)._m0[int(_3323)][_3325];
        int _3329 = int(_3321) + 1;
        uint _3331 = uint(int(uint(_3329) >> uint(2)));
        int _3333 = _3329 & 3;
        float _3335 = (*spvDescriptorSet0.vp_c15)._m0[int(_3331)][_3333];
        int _3337 = _3319 + 8;
        uint _3339 = uint(int(uint(_3337) >> uint(2)));
        uint _3341 = uint(int(uint(int(_3339)) >> uint(2)));
        int _3343 = int(_3339) & 3;
        float _3345 = (*spvDescriptorSet0.vp_c15)._m0[int(_3341)][_3343];
        int _3347 = int(_3339) + 1;
        uint _3349 = uint(int(uint(_3347) >> uint(2)));
        int _3351 = _3347 & 3;
        float _3353 = (*spvDescriptorSet0.vp_c15)._m0[int(_3349)][_3351];
        float _3355 = _2538 * _3335;
        float _3357 = fma(_2438, _3327, _3355);
        float _3359 = fma(_2446, _3345, _3357);
        float _3361 = _3359 + _3353;
        float _3363 = precise::clamp(_3361, 0.0, 1.0);
        float _3365 = -_3363;
        float _3367 = _3365 + _3309;
        float _3369 = fma(_3367, 500.0, 1.5);
        float _3371 = exp2(_3369);
        float _3373 = 0.0 + _3371;
        float _3375 = precise::clamp(_3373, 0.0, 1.0);
        _3262 = _3335;
        _3240 = _3327;
        _3313 = _3375;
    }
    float _3377 = _3262;
    float _3379 = _3240;
    float _3381 = _3313;
    float _3383 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3385 = _3082 + _3383;
    float _3387 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3389 = _3084 + _3387;
    float _3391 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3393 = _3086 + _3391;
    float _3395 = _3385 * _3385;
    float _3397 = fma(_3389, _3389, _3395);
    float _3399 = fma(_3393, _3393, _3397);
    float _3401 = rsqrt(_3399);
    float _3403 = _3401 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3405 = _3389 * _3403;
    float _3407 = _3393 * _3403;
    float _3409 = _3405 * _3405;
    float _3411 = _3407 * _3407;
    float _3413 = _3409 + _3411;
    float _3415 = sqrt(_3413);
    bool _3417 = _3415 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3419 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3421 = _3415 + _3419;
    float _3423 = _3401;
    float _3425 = _3421;
    float _3427 = _3377;
    float _3429 = _3385;
    float _3431 = _3403;
    if (_3417)
    {
        float _3433 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3423 = _3433;
    }
    float _3435 = _3423;
    if (_3417)
    {
        float _3437 = _3421 * _3435;
        _3425 = _3437;
    }
    float _3439 = _3425;
    if (_3417)
    {
        float _3441 = _3439 * 0.15915493667125701904296875;
        _3427 = _3441;
    }
    float _3443 = _3427;
    float _3445 = _3393;
    float _3447 = _3443;
    if (_3417)
    {
        float _3449 = _3443 * 6.283185482025146484375;
        float _3451 = sin(_3449);
        _3445 = _3451;
    }
    float _3453 = _3445;
    float _3455 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3457 = precise::max(0.0, _3455);
    float _3459 = _3379;
    float _3461 = _3457;
    if (_3417)
    {
        float _3463 = _3443 * 6.283185482025146484375;
        float _3465 = cos(_3463);
        _3459 = _3465;
    }
    float _3467 = _3459;
    float _3469 = -_3403;
    float _3471 = -_3457;
    float _3473 = fma(_3385, _3469, _3471);
    float _3475 = _3455;
    if (_3417)
    {
        float _3477 = rsqrt(_3413);
        _3475 = _3477;
    }
    float _3479 = _3475;
    if (_3417)
    {
        float _3481 = _3473 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3461 = _3481;
    }
    float _3483 = _3461;
    float _3485 = _3483;
    if (!_3417)
    {
        _3447 = _3409;
    }
    float _3487 = _3447;
    float _3489 = _3453;
    float _3491 = _3487;
    if (_3417)
    {
        float _3493 = fma(_3453, _3483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3485 = _3493;
    }
    float _3495 = _3485;
    float _3497 = _3495;
    if (!_3417)
    {
        _3489 = _3407;
    }
    float _3499 = _3489;
    float _3501 = _3499;
    float _3503 = _3467;
    if (_3417)
    {
        float _3505 = _3467 + (-1.0);
        _3429 = _3505;
    }
    float _3507 = _3429;
    if (_3417)
    {
        float _3509 = _3507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3431 = _3509;
    }
    float _3511 = _3431;
    float _3513 = sqrt(_3399);
    float _3515 = _3479;
    if (_3417)
    {
        float _3517 = _3479 * _3495;
        _3315 = _3517;
    }
    float _3519 = _3315;
    if (!_3417)
    {
        _3497 = _3405;
    }
    float _3521 = _3497;
    float _3523 = _3521;
    if (!_3417)
    {
        _3515 = _3473;
    }
    float _3525 = _3515;
    float _3527 = _3525;
    if (_3417)
    {
        float _3529 = _3405 * _3519;
        _3523 = _3529;
    }
    float _3531 = _3523;
    if (_3417)
    {
        float _3533 = fma(_3473, _3467, _3511);
        _3527 = _3533;
    }
    float _3535 = _3527;
    if (_3417)
    {
        float _3537 = _3407 * _3519;
        _3501 = _3537;
    }
    float _3539 = _3501;
    if (!_3417)
    {
        _3503 = _3411;
    }
    float _3541 = _3503;
    float _3543 = _3541;
    if (_3417)
    {
        float _3545 = _3531 * _3531;
        _3491 = _3545;
    }
    float _3547 = _3491;
    if (_3417)
    {
        float _3549 = _3539 * _3539;
        _3543 = _3549;
    }
    float _3551 = _3543;
    float _3553 = fma(_3535, _3535, _3547);
    float _3555 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3557 = fma(_3513, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3555);
    float _3559 = precise::clamp(_3557, 0.0, 1.0);
    float _3561 = _3553 + _3551;
    float _3563 = -_3559;
    float _3565 = _3563 + 1.0;
    float _3567 = rsqrt(_3561);
    float _3569 = _3567 * _3535;
    float _3571 = _3567 * _3531;
    float _3573 = abs(_3565);
    float _3575 = log2(_3573);
    float _3577 = _3567 * _3539;
    float _3579 = _3571 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3581 = -_3579;
    float _3583 = fma(_3569, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3581);
    float _3585 = -_3577;
    float _3587 = fma(_3585, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3583);
    float _3589 = fma(_3587, -0.5, 0.5);
    float _3591 = _3575 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3593 = fma(_3587, 0.5, 0.5);
    float _3595 = sqrt(_3589);
    float _3597 = fma(_3593, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3599 = fma(_3593, _3597, -0.212114393711090087890625);
    float _3601 = _3569 + 1.0;
    float _3603 = exp2(_3591);
    float _3605 = fma(_3593, _3599, 1.570728778839111328125);
    float _3607 = _3595 * 0.636619746685028076171875;
    float _3609 = -_3605;
    float _3611 = fma(_3607, _3609, 1.0);
    float _3613 = -_3569;
    float _3615 = fma(_3603, _3601, _3613);
    float _3617 = fma(_3615, 0.5, 0.5);
    float2 _9671 = float2(_3611, _3617);
    float3 _3621 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9671, float2(0.0), isnan(_9671)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9671, float2(0.0), isnan(_9671)), level(0.0)).xyz;
    float _3623 = _3621.x;
    float _3625 = _3621.y;
    float _3627 = _3621.z;
    float _3629 = abs(_2598);
    float _3631 = log2(_3629);
    float _3633 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3635 = _3142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3637 = fma(_3633, _3633, 1.0);
    float _3639 = -_2490;
    float _3641 = _3639 + 1.0;
    float _3643 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3635);
    float _3645 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3647 = _3633 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3649 = _2598 <= 8000.0;
    bool _3651 = isnan(_2598);
    bool _3653 = _3649 || _3651;
    bool _3655 = isnan(8000.0);
    bool _3657 = _3653 || _3655;
    float _3659 = float(_3657);
    float _3661 = rsqrt(_3637);
    float _3663 = fma(_3158, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3643);
    float _3665 = fma(_3645, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3647);
    out.m_80.x = _3084;
    out.m_80.y = _3082;
    out.m_80.z = _3086;
    float _3667 = _3631 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _3669 = _3513 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3671 = isnan(_3513);
    bool _3673 = _3669 || _3671;
    bool _3675 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3677 = _3673 || _3675;
    float _3679 = exp2(_3667);
    out.m_82.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_82.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_82.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _3681 = _3633 * _3661;
    float _3683 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3685 = _3681 * _3683;
    float _3687 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3689 = _3681 * _3687;
    float _3691 = fma(_3661, (*spvDescriptorSet0.vp_c8)._m0[24].y, _3685);
    float _3693 = fma(_3661, (*spvDescriptorSet0.vp_c8)._m0[26].y, _3689);
    float _3695 = fma(_3679, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3697 = precise::clamp(_3695, 0.0, 1.0);
    float _3699 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3701 = _3681 * _3699;
    float _3703 = _3633 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3705 = _3633 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3707 = fma(_3697, -2.0, 3.0);
    float _3709 = _3697 * _3697;
    float _3711 = fma(_3645, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3703);
    float _3713 = fma(_3645, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3705);
    float _3715 = _3575 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3717 = _3709 * _3707;
    float _3719 = fma(_3170, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3663);
    float _3721 = fma(_3661, (*spvDescriptorSet0.vp_c8)._m0[25].y, _3701);
    float _3723 = -_3717;
    float _3725 = _3723 + 1.0;
    float _3727 = exp2(_3715);
    out.gl_Position.x = _3226;
    out.gl_Position.y = _3228;
    out.gl_Position.z = _3719;
    out.gl_Position.w = _3188;
    float _3729 = fma(_3725, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3717);
    float _3731 = _3719 + _3188;
    out.m_84.x = _3691;
    out.m_84.y = _3721;
    out.m_84.z = _3693;
    float _3733 = _3659 * _3729;
    float _3735 = _3731 * 0.5;
    float _3737 = _3731;
    float _3739 = _3711;
    if (!_3176)
    {
        _3737 = 1.0;
    }
    float _3741 = _3737;
    float _3743 = _3733 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3745 = _3741;
    if (_3176)
    {
        bool _3747 = _3290 >= _3280;
        bool _3749 = isnan(_3290);
        bool _3751 = _3747 || _3749;
        bool _3753 = isnan(_3280);
        bool _3755 = _3751 || _3753;
        float _3757 = float(_3755);
        _3745 = _3757;
    }
    float _3759 = _3745;
    out.m_86.z = _3735;
    out.m_86.w = _3188;
    if (!_3677)
    {
        _3286 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3761 = _3286;
    float _3763 = _3641 * _3743;
    float _3765 = precise::clamp(_3763, 0.0, 1.0);
    float _3767 = -_3727;
    float _3769 = _3767 + 1.0;
    float _3771 = _3759 * _3381;
    float _3773 = _3665 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _3775 = -_3765;
    float _3777 = fma(_3775, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3779 = _3769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3781 = _3711 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _3783 = _3713 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _3785 = -_3771;
    float _3787 = fma(_3785, _3777, 1.0);
    float _3789 = precise::clamp(_3787, 0.0, 1.0);
    float _3791 = _3779 * _3292;
    float _3793 = -_3779;
    float _3795 = _3793 + 1.0;
    float _3797 = _3789;
    float _3799 = _3791;
    float _3801 = _3761;
    float _3803 = _3761;
    if (!_3677)
    {
        _3739 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3805 = _3739;
    float _3807 = _3789 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3809 = _3303 * _3791;
    float _3811 = _3303 * _3795;
    out.m_88.x = _3773;
    out.m_88.y = _3781;
    out.m_88.z = _3783;
    float _3813 = _3809;
    float _3815 = _3805;
    float _3817 = _3805;
    if (!_3677)
    {
        _3797 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3819 = _3797;
    float _3821 = _3819;
    float _3823 = _3819;
    if (!_3677)
    {
        _3206 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3825 = _3206;
    out.m_90.x = _3807;
    float _3827 = _3627 * _3791;
    float _3829 = fma(_3623, _3809, _3297);
    float _3831 = fma(_3625, _3809, _3299);
    float _3833 = _3825;
    float _3835 = _3825;
    if (!_3677)
    {
        _3799 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3837 = _3799;
    float _3839 = fma(_3303, _3827, _3301);
    float _3841 = _3837;
    float _3843 = _3837;
    if (!_3677)
    {
        _3813 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3845 = _3813;
    out.m_92.x = _3829;
    out.m_92.y = _3831;
    out.m_92.z = _3839;
    out.m_92.w = _3811;
    bool _3847 = !_3677;
    float _3849 = _3845;
    float _3851 = _3845;
    if (!_3847)
    {
        bool _3853 = _3513 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3855 = isnan(_3513);
        bool _3857 = _3853 || _3855;
        bool _3859 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3861 = _3857 || _3859;
        if (!_3861)
        {
            float _3863 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3865 = _3513 + _3863;
            float _3867 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3869 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3867;
            float _3871 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3873 = _3871 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3875 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3877 = _3875 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3879 = 1.0 / _3869;
            float _3881 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3883 = _3881 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3887 = _3885 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3893 = _3865 * _3879;
            float _3895 = precise::clamp(_3893, 0.0, 1.0);
            float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3901 = fma(_3895, _3873, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3903 = fma(_3895, _3877, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3905 = fma(_3895, _3899, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3907 = fma(_3895, _3883, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3909 = fma(_3895, _3887, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3911 = fma(_3895, _3891, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3817 = _3903;
            _3835 = _3909;
            _3843 = _3901;
            _3803 = _3907;
            _3823 = _3905;
            _3851 = _3911;
            _3913 = true;
        }
        else
        {
            bool _3915 = _3513 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3917 = isnan(_3513);
            bool _3919 = _3915 || _3917;
            bool _3921 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3923 = _3919 || _3921;
            if (!_3923)
            {
                _3841 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3925 = _3841;
            _3843 = _3925;
            if (!_3923)
            {
                _3815 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3927 = _3815;
            _3817 = _3927;
            if (!_3923)
            {
                _3821 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3929 = _3821;
            _3823 = _3929;
            if (!_3923)
            {
                _3801 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3931 = _3801;
            _3803 = _3931;
            if (!_3923)
            {
                _3833 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3933 = _3833;
            _3835 = _3933;
            if (!_3923)
            {
                _3849 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3935 = _3849;
            bool _3937 = !_3923;
            _3851 = _3935;
            if (!_3937)
            {
                bool _3939 = _3513 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3941 = isnan(_3513);
                bool _3943 = _3939 || _3941;
                bool _3945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3947 = _3943 || _3945;
                if (!_3947)
                {
                    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3951 = _3513 + _3949;
                    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3955 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3953;
                    float _3957 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3959 = _3957 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3961 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3963 = _3961 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3965 = 1.0 / _3955;
                    float _3967 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3969 = _3967 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3971 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3973 = _3971 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3979 = _3951 * _3965;
                    float _3981 = precise::clamp(_3979, 0.0, 1.0);
                    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3987 = fma(_3981, _3959, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3989 = fma(_3981, _3963, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3991 = fma(_3981, _3985, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3993 = fma(_3981, _3969, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3995 = fma(_3981, _3973, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3997 = fma(_3981, _3977, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3817 = _3989;
                    _3835 = _3995;
                    _3843 = _3987;
                    _3803 = _3993;
                    _3823 = _3991;
                    _3851 = _3997;
                    _3913 = true;
                }
                else
                {
                    _3817 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3835 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3843 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3803 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3823 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3851 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3913 = false;
    float _3999 = _3817;
    float _4001 = _3835;
    float _4003 = _3843;
    float _4005 = _3803;
    float _4007 = _3823;
    float _4009 = _3851;
    float _4011 = fma(_3781, -0.5, 0.5);
    float _4013 = precise::clamp(_4011, 0.0, 1.0);
    float _4015 = -_3999;
    float _4017 = _4015 + _4001;
    float _4019 = -_4003;
    float _4021 = _4019 + _4005;
    float _4023 = -_4007;
    float _4025 = _4023 + _4009;
    bool _4027 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4029 = fma(_4013, _4017, _3999);
    float _4031 = fma(_4013, _4021, _4003);
    float _4033 = fma(_4013, _4025, _4007);
    float _4035 = _4029 * 0.586610972881317138671875;
    out.m_94.x = 0.0;
    float _4037 = fma(_4031, 0.298911988735198974609375, _4035);
    float _4039 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4041 = fma(_4033, 0.114477999508380889892578125, _4037);
    out.m_59.x = _4039;
    float _4043 = -_4041;
    float _4045 = _4031 + _4043;
    float _4047 = -_4041;
    float _4049 = _4029 + _4047;
    float _4051 = -_4041;
    float _4053 = _4033 + _4051;
    float _4055 = fma(_4045, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4041);
    float _4057 = fma(_4049, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4041);
    float _4059 = fma(_4053, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4041);
    out.m_96.x = _4055;
    out.m_96.y = _4057;
    out.m_96.z = _4059;
    if (!_4027)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4061 = -_3082;
    float _4063 = _4061 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4065 = -_3084;
    float _4067 = _4065 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4069 = -_3086;
    float _4071 = _4069 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4073 = _4063 * _4063;
    float _4075 = fma(_4067, _4067, _4073);
    float _4077 = fma(_4071, _4071, _4075);
    float _4079 = sqrt(_4077);
    float _4081 = rsqrt(_4077);
    float _4083 = -_4079;
    float _4085 = _4083 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4087 = _4085 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4089 = precise::clamp(_4087, 0.0, 1.0);
    float _4091 = _4067 * _4081;
    float _4093 = _4063 * _4081;
    float _4095 = abs(_4089);
    float _4097 = log2(_4095);
    float _4099 = _4071 * _4081;
    float _4101 = _4091 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4103 = _3781 * _4093;
    float _4105 = -_4093;
    float _4107 = -_4101;
    float _4109 = fma(_4105, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4107);
    float _4111 = fma(_3773, _4091, _4103);
    float _4113 = -_4099;
    float _4115 = fma(_4113, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4109);
    float _4117 = fma(_3783, _4099, _4111);
    float _4119 = precise::clamp(_4117, 0.0, 1.0);
    float _4121 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4123 = _4115 + _4121;
    float _4125 = _4097 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4127 = _4123 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4129 = precise::clamp(_4127, 0.0, 1.0);
    float _4131 = exp2(_4125);
    float _4133 = _4131 * _4129;
    float _4135 = _4119 * _4133;
    float _4137 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4139 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4141 = _4135 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _4137;
    out.m_94.y = _4139;
    out.m_94.z = _4141;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

